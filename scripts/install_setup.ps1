# install_setup.ps1
# Script para automatizar a configuração do ambiente de desenvolvimento no Windows.

# Parâmetros
param (
    # O $HOME\dev\my-dev-configs é um bom padrão, mas pode ser ajustado se necessário.
    [string]$ConfigsRepoPath = "$HOME\dev\my-dev-configs"
)

#----------------------------------------------------------------------
# FUNÇÕES HELPER (AJUDA)
#----------------------------------------------------------------------

# Função para criar os links (Junctions) de forma segura
function Create-Junction {
    param ([string]$Link, [string]$Target)

    # Verifica se o alvo do link (a pasta no seu repo) existe
    if (-not (Test-Path $Target)) {
        Write-Warning "O diretório de origem '$Target' não foi encontrado. Pulando a criação do link."
        return
    }

    # Se o link já existe, remove para evitar erros
    if (Test-Path $Link) {
        Write-Host "Caminho '$Link' já existe. Removendo para recriar..." -ForegroundColor Yellow
        try {
            Remove-Item $Link -Recurse -Force -ErrorAction Stop
        } catch {
            Write-Error "Falha ao remover '$Link'. Verifique se não está em uso."
            return
        }
    }
    
    Write-Host "Criando Junction: $Link -> $Target"
    cmd /c mklink /J "$Link" "$Target"
}

#----------------------------------------------------------------------
# LÓGICA PRINCIPAL DO SCRIPT
#----------------------------------------------------------------------

Write-Host "--------------------------------------------------------" -ForegroundColor Cyan
Write-Host "INICIANDO SETUP DO AMBIENTE DE DESENVOLVIMENTO" -ForegroundColor Cyan
Write-Host "--------------------------------------------------------"

# 1. Verificando se o repositório de configs existe no caminho esperado
if (-not (Test-Path $ConfigsRepoPath)) {
    Write-Error "O repositório de configurações não foi encontrado em '$ConfigsRepoPath'."
    Write-Error "Verifique se você clonou o repositório para o local correto ou ajuste o parâmetro -ConfigsRepoPath."
    return
}

# 2. Criando Junctions para as configurações
Write-Host "`n[PASSO 1 de 2] Criando links (Junctions) para as configurações..." -ForegroundColor Green

# Neovim
Create-Junction -Link "$env:LOCALAPPDATA\nvim" -Target "$ConfigsRepoPath\nvim"

# Git (exemplo, aponte para seu .gitconfig global)
# Create-Junction -Link "$HOME\.gitconfig" -Target "$ConfigsRepoPath\git\.gitconfig"

# VS Code (exemplo)
# Create-Junction -Link "$env:APPDATA\Code\User" -Target "$ConfigsRepoPath\vscode"


Write-Host "`n[PASSO 2 de 2] Verificando dependências..." -ForegroundColor Green
Write-Host "Lembre-se de instalar as ferramentas necessárias (Neovim, Git, MSYS2, etc)."
Write-Host "Você pode usar Chocolatey para facilitar esse processo."


Write-Host "--------------------------------------------------------" -ForegroundColor Cyan
Write-Host "SETUP CONCLUÍDO!" -ForegroundColor Cyan
Write-Host "Ações recomendadas:"
Write-Host "1. Instale as ferramentas listadas no README.md (Neovim, MSYS2, etc.)."
Write-Host "2. Reinicie seu terminal para garantir que todas as mudanças tenham efeito."
Write-Host "--------------------------------------------------------"