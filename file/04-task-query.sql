SELECT UserID,
    count() AS views_count
FROM homework.metrika
GROUP BY UserID
ORDER BY views_count DESC
LIMIT 1;