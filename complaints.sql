-- pgvector 확장이 설치되어 있어야 합니다.
-- CREATE EXTENSION IF NOT EXISTS vector;

CREATE EXTENSION vector;

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
    title_embedding VECTOR(1536),                   -- 제목 임베딩 벡터
    request_content_embedding VECTOR(1536),         -- 민원내용 임베딩 벡터
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, -- 생성일시
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP  -- 수정일시
);
