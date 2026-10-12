### Что сделано

- Развёрнут ClickHouse в Docker-контейнере (`docker-compose.yaml`).
- Создана БД `homework` (скрипт `01-create-database.sql`).
- Создана таблица metrika на движке MergeTree с партиционированием по месяцу (PARTITION BY toYYYYMM(EventDate)) (скрипт `02-create-table.sql`).
- Данные загружены из TSV-файла (скрипт `ETL.ps1`).
- Реализован аналитический запрос для поиска пользователя (UserID) с наибольшим количеством просмотров (`04-task-query.sql`).
- Результат проверен в Power BI: подключение к БД выполнено, запрос отрабатывает, визуализация подтверждает расчёт.

### Файлы

- `docker-compose.yaml` - разворачивание и управление контейнером ClickHouse со всеми нужными настройками.
- `01-create-database.sql` — создание БД.
- `02-create-table.sql` — DDL таблицы metrika.
- `ETL.ps1` — скрипт загрузки данных.
- `04-task-query.sql` — финальный аналитический запрос.
- `README.md` — инструкция по запуску и описание результатов.
- `screenshots/` — скриншоты результатов в консоли и Power BI.

### Как воспроизвести

В PowerShell последовательно выполняем
1. Создать локальную рабочую папку, в которой будут созданы рабочие скрипты и из которой вызовем bash:

   `mkdir C:\Users\pl081\clickhouse-hw`
   
<img width="914" height="365" alt="рабочая папка" src="https://github.com/user-attachments/assets/887b186f-2cd8-4bef-bc0f-22f41b0e4fda" />

2. Создаем подкаталоги:

   `mkdir data, logs`
      
<img width="810" height="296" alt="icon_2" src="https://github.com/user-attachments/assets/0d7e7bfd-3e2a-4229-af5e-ce1930bd6856" />

3. Запустить ClickHouse в Docker используя `docker-compose.yaml`:
   
   `docker compose up`
   
<img width="2342" height="548" alt="icon_3" src="https://github.com/user-attachments/assets/5d94cc97-3467-4a1e-90dd-27d3cca050e1" />

4. Создаем БД и Таблицу:
   
   `docker exec -i clickhouse-second clickhouse-client --query "\$(Get-Content '01-create-database.sql' -Raw)"`
   `docker exec -i clickhouse-second clickhouse-client --query "\$(Get-Content '02-create-table.sql' -Raw)"`
   
<img width="1980" height="66" alt="icon_4" src="https://github.com/user-attachments/assets/026fff19-ead6-4ba6-8299-723f17e3771a" />

5. Загружаем данные:
   
   `$ddl = Get-Content "02-create-table.sql" -Raw`
   `docker exec -i clickhouse-second clickhouse-client --user=admin --password=MySecret123 --query="$ddl"`

<img width="2202" height="117" alt="icon_6" src="https://github.com/user-attachments/assets/3b614c97-1653-4183-89b4-b527e6caa9c2" />

6. Выполняем аналитический запрос, выводим:
   
   `.\ETL.ps1`
   
<img width="626" height="125" alt="icon_7" src="https://github.com/user-attachments/assets/cc2a3220-4630-45fb-9d7f-975000a82d4d" />


  
