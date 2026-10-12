$container = "clickhouse-second"
$user = "admin"
$password = "MySecret123"
$db = "homework"

$ErrorActionPreference = "Stop"

# Write-Host "=== 1. Загружаем TSV (CRLF учтён) ==="
# Убрали -AsByteStream — он не нужен и вызывает ошибку в PS Core
Get-Content "metrika_sample.tsv" | docker exec -i $container clickhouse-client `
  --user=$user `
  --password=$password `
  --database=$db `
  --query="INSERT INTO metrika FORMAT TSV" `
  --input_format_tsv_crlf_end_of_line=1

# Write-Host "=== 2. Выполняем задание ==="
$sql = Get-Content "04-task-query.sql" -Raw
docker exec -i $container clickhouse-client `
  --user=$user `
  --password=$password `
  --database=$db `
  --format=TSVWithNames `
  --query="$sql"


    
