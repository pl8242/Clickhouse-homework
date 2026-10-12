CREATE TABLE homework.metrika (
    `EventDate` Date,
    `CounterID` UInt32,
    `UserID` UInt64,
    `RegionID` UInt32
) ENGINE = MergeTree() PARTITION BY toYYYYMM(EventDate)
ORDER BY (CounterID, EventDate, intHash32(UserID));