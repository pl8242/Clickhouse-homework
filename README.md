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
- `screenshots` — скриншоты результатов в консоли
- альтернативная проверка подключения к БД и результата через `Power BI`.

### Как воспроизвести

Используем VS Code, docker.desktop, powershell

<img width="1272" height="800" alt="icon_10" src="https://github.com/user-attachments/assets/2d61d814-46eb-4a29-aff3-0d8831838b9e" />

   
В PowerShell последовательно выполняем
1. Подготовка рабочей директории
   Создаем папку проекта, в которой будут размещены рабочие скрипты:

   `mkdir C:\Users\pl081\clickhouse-hw`
   
<img width="914" height="365" alt="рабочая папка" src="https://github.com/user-attachments/assets/887b186f-2cd8-4bef-bc0f-22f41b0e4fda" />

2. Создаем подкаталоги:

   `mkdir data, logs`
      
<img width="810" height="296" alt="icon_2" src="https://github.com/user-attachments/assets/0d7e7bfd-3e2a-4229-af5e-ce1930bd6856" />

3. Запустить ClickHouse в Docker используя `docker-compose.yaml`:
   
   `docker compose up`
   
<img width="2342" height="548" alt="icon_3" src="https://github.com/user-attachments/assets/5d94cc97-3467-4a1e-90dd-27d3cca050e1" />

<img width="2186" height="889" alt="icon_9" src="https://github.com/user-attachments/assets/2d3a9fb1-5ab4-43e7-8fd8-fa1ce666cc90" />


4. Создаем БД и Таблицу:
   
   `Get-Content "01-create-database.sql" -Raw | docker exec -i clickhouse-second clickhouse-client --query=""`

   `Get-Content "02-create-table.sql" -Raw | docker exec -i clickhouse-second clickhouse-client --query=""`
   
<img width="1980" height="66" alt="icon_4" src="https://github.com/user-attachments/assets/026fff19-ead6-4ba6-8299-723f17e3771a" />

5. Выполняем загрузку данных и аналитический запрос, перед этим очищаем ранее загруженные данные. выводим:
   
   `.\ETL.ps1`
   
   <img width="613" height="294" alt="ETL_результат_powershell" src="https://github.com/user-attachments/assets/f8d6113c-19fe-40c6-9edd-e72095df0357" />



7. Power BI

   <img width="628" height="392" alt="icon_13_power_bi" src="https://github.com/user-attachments/assets/62342cb7-cd5e-46b3-bbd5-36776d050ee9" />


  
