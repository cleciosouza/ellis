# Use uma imagem Python oficial como imagem base. Alpine é uma ótima escolha para imagens pequenas.
FROM python:3.12-alpine

# Define o diretório de trabalho no contêiner como /app
WORKDIR /app

# Copia o arquivo de dependências para o contêiner
COPY requirements.txt .

# Instala as dependências
# --no-cache-dir mantém a imagem menor
# -r requirements.txt informa ao pip para instalar a partir do arquivo
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o sistema de arquivos da imagem.
COPY . .

# Expõe a porta 8000 para permitir a comunicação com o serviço
EXPOSE 8000

# Comando para executar a aplicação usando uvicorn
# --host 0.0.0.0 torna o servidor acessível de fora do contêiner
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]