CREATE TABLE complaints (
    id SERIAL PRIMARY KEY,                          -- 연번 (자동 증가, 기본 키)
    complaint_number VARCHAR(255) UNIQUE NOT NULL,  -- 민원번호 (고유값)
    title VARCHAR(255) NOT NULL,                    -- 제목
    summary TEXT,                                   -- 접수요약
    status VARCHAR(50),                             -- 처리상태
    request_content TEXT,                           -- 민원내용
    response_content TEXT,                          -- 처리내용
    request_date DATE,                              -- 신청일자
    department VARCHAR(100),                        -- 처리부서
    process_date DATE,                              -- 처리일
    law_clause VARCHAR(255),                        -- 법령·조문 수정
    category VARCHAR(100),                          -- 카테고리
    year INT,                                       -- 연도
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, -- 생성일시
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP  -- 수정일시
);

-- 각 컬럼에 대한 주석 추가 (선택 사항)
COMMENT ON COLUMN complaints.id IS '연번 (PK)';
COMMENT ON COLUMN complaints.complaint_number IS '민원번호';
COMMENT ON COLUMN complaints.title IS '제목';
COMMENT ON COLUMN complaints.summary IS '접수요약';
COMMENT ON COLUMN complaints.status IS '처리상태';
COMMENT ON COLUMN complaints.request_content IS '민원내용';
COMMENT ON COLUMN complaints.response_content IS '처리내용';
COMMENT ON COLUMN complaints.request_date IS '신청일자';
COMMENT ON COLUMN complaints.department IS '처리부서';
COMMENT ON COLUMN complaints.process_date IS '처리일';
COMMENT ON COLUMN complaints.law_clause IS '법령·조문 수정';
COMMENT ON COLUMN complaints.category IS '카테고리';
COMMENT ON COLUMN complaints.year IS '연도';
COMMENT ON COLUMN complaints.created_at IS '레코드 생성일시';
COMMENT ON COLUMN complaints.updated_at IS '레코드 마지막 수정일시';
