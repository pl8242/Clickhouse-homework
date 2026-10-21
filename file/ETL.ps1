# Параметры подключения
$container = "clickhouse-second"
$user = "admin"
$password = "MySecret123"
$db = "homework"


# Важная настройка: остановка скрипта при любой ошибке
$ErrorActionPreference = "Stop"

Write-Host "=== 1. CLEAN DATA ==="
docker exec -i $container clickhouse-client `
  --user=$user `
  --password=$password  `
  --database=$db `
  --query="TRUNCATE TABLE $db.metrika"

Write-Host "TRUNCATE executed."

# 2. Загрузка данных
Write-Host "=== 2. LOAD TSV ==="

# Подсчет строк в файле (исключаем пустые строки, если нужно — убрать | Where-Object { \$_ })
$rowCount = (Get-Content "metrika_sample.tsv" -Encoding UTF8 | Measure-Object -Line).Lines
Write-Host "count_row: $rowCount"

Get-Content "metrika_sample.tsv" | docker exec -i $container clickhouse-client `
  --user=$user `
  --password=$password `
  --database=$db `
  --query="INSERT INTO metrika FORMAT TSV" `
  --input_format_tsv_crlf_end_of_line=1

Write-Host "FINISH"

# 3. Выполнение аналитического запроса
Write-Host "=== 3. REZALT ==="
$sql = Get-Content "04-task-query.sql" -Raw -Encoding UTF8
docker exec -i $container clickhouse-client `
  --user=$user `
  --password=$password `
  --database=$db `
  --format=TSVWithNames `
  --query="$sql"
