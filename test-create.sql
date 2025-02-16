CREATE TABLE member
(
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,               -- 회원 고유 ID
    name        VARCHAR(255) NOT NULL,                           -- 회원 이름
    joined_at   DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 가입 일자
    visit_count INT          NOT NULL DEFAULT 0                  -- 방문 횟수
);


SET SESSION cte_max_recursion_depth = 500000;

INSERT INTO member (name, joined_at, visit_count)
WITH RECURSIVE cte (n) AS
                   (SELECT 1
                    UNION ALL
                    SELECT n + 1
                    FROM cte
                    WHERE n < 100000)
SELECT CONCAT('User_', FLOOR(RAND() * 100000)),                -- 랜덤 이름 생성
       DATE_ADD(CURDATE(), INTERVAL FLOOR(RAND() * 3) - 2 DAY), -- 현재 날짜에서 -2일~0일 사이 랜덤 날짜
       FLOOR(RAND() * 100)                                      -- 방문 횟수 (0~99 랜덤)
FROM cte;