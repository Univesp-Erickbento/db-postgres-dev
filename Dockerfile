# ✅ Usa imagem oficial com Java e Liquibase pré-instalado
FROM liquibase/liquibase:4.24.0

# ✅ Define a versão do driver JDBC do PostgreSQL
ENV POSTGRES_DRIVER_VERSION=42.7.1

# ✅ Cria diretório para o driver JDBC
RUN mkdir -p /liquibase/sql

# ✅ Baixa o driver JDBC necessário para se conectar ao PostgreSQL
RUN curl -L -o /liquibase/sql/postgresql-${POSTGRES_DRIVER_VERSION}.jar \
    https://jdbc.postgresql.org/download/postgresql-${POSTGRES_DRIVER_VERSION}.jar

# ✅ Define o CLASSPATH para que o Liquibase encontre o driver
ENV CLASSPATH="/liquibase/sql/postgresql-${POSTGRES_DRIVER_VERSION}.jar"

# ✅ Copia os arquivos da sua pasta liquibase local para dentro do container
# Estrutura local: liquibase/{changelog/, sql/}
COPY liquibase /liquibase

# ✅ Copia o arquivo de propriedades (configurações do Liquibase)
COPY liquibase.properties /liquibase/liquibase.properties

# 🔍 Lista os arquivos copiados — útil para debug em build
RUN ls -R /liquibase

# ✅ Define diretório de trabalho padrão
WORKDIR /liquibase

# ✅ Comando padrão ao rodar o container (pode ser sobrescrito)
CMD ["liquibase", "--defaultsFile=/liquibase/liquibase.properties", "update"]
