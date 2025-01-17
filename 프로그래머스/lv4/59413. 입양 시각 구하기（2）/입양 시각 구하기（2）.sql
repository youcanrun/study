-- 코드를 입력하세요
# SELECT HOUR(DATETIME) HOUR
# , COUNT(ANIMAL_ID) COUNT
# FROM ANIMAL_OUTS 
# WHERE HOUR(DATETIME) BETWEEN '00' AND '23'
# GROUP BY HOUR(DATETIME)
# ORDER BY HOUR(DATETIME)

SET @HOUR := -1; -- SET으로 변수에 값 할당
SELECT (@HOUR := @HOUR +1) AS HOUR -- @HOUR 값이 1씩 증가하면서 select문 전체를 실행
,(SELECT COUNT(*) 
  FROM ANIMAL_OUTS 
  WHERE HOUR(DATETIME) = @HOUR) as COUNT
FROM ANIMAL_OUTS
WHERE @HOUR < 23;