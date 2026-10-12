### Что сделано

- Развёрнут ClickHouse в Docker-контейнере (docker-compose.yaml).
- Создана БД `homework` (скрипт '01-create-database.sql').
- Создана таблица `metrika` на движке MergeTree с партиционированием по месяцу (`PARTITION BY toYYYYMM(EventDate)`) (скрипт '02-create-table.sql').
- Данные загружены из TSV-файла (скрипт `ETL.ps1`).
- Реализован аналитический запрос для поиска пользователя (`UserID`) с наибольшим количеством просмотров (04-task-query.sql).
- Результат проверен в Power BI: подключение к БД выполнено, запрос отрабатывает, визуализация подтверждает расчёт.

### Файлы

- 'docker-compose.yaml' - разворачивание и управление контейнером ClickHouse со всеми нужными настройками.
- `01-create-database.sql` — создание БД.
- `02-create-table.sql` — DDL таблицы `metrika`.
- `ETL.ps1` — скрипт загрузки данных.
- `04-task-query.sql` — финальный аналитический запрос.
- `README.md` — инструкция по запуску и описание результатов.
- `screenshots/` — скриншоты результатов в консоли и Power BI.

### Как воспроизвести

1. Создать рабочую папку
   ```PowerShell
    mkdir C:\Users\pl081\clickhouse-hw
  <img width="914" height="365" alt="рабочая папка" src="https://github.com/user-attachments/assets/887b186f-2cd8-4bef-bc0f-22f41b0e4fda" />
2. Создаем подкаталоги
  ```PowerShell
     mkdir data, logs
  <img width="810" height="296" alt="icon_2" src="https://github.com/user-attachments/assets/0d7e7bfd-3e2a-4229-af5e-ce1930bd6856" />

3. Запустить ClickHouse в Docker используя 'docker-compose.yaml' :
   ```PowerShell
   docker compose up

  <img width="2342" height="548" alt="icon_3" src="https://github.com/user-attachments/assets/5d94cc97-3467-4a1e-90dd-27d3cca050e1" />

