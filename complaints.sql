CREATE TABLE complaints (
    id UUID PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    request_date DATE NOT NULL,
    department VARCHAR(255),
    process_date DATE,
    law_clause VARCHAR(255),
    year INT,
    user_id UUID REFERENCES users(id),
    status VARCHAR(50) CHECK (status IN ('접수', '진행중', '처리완료')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 테이블에 대한 설명을 추가하는 주석 (선택 사항)
COMMENT ON TABLE complaints IS '민원 정보를 저장하는 테이블';
COMMENT ON COLUMN complaints.id IS '민원 고유 ID';
COMMENT ON COLUMN complaints.title IS '제목';
COMMENT ON COLUMN complaints.request_date IS '신청일자';
COMMENT ON COLUMN complaints.department IS '처리 부서';
COMMENT ON COLUMN complaints.process_date IS '처리일';
COMMENT ON COLUMN complaints.law_clause IS '법령·조문';
COMMENT ON COLUMN complaints.year IS '연도';
COMMENT ON COLUMN complaints.user_id IS '민원인 ID (users.id 참조)';
COMMENT ON COLUMN complaints.status IS '민원 처리 상태 (접수, 진행중, 처리완료)';
COMMENT ON COLUMN complaints.created_at IS '생성 일시';
COMMENT ON COLUMN complaints.updated_at IS '마지막 업데이트 일시';
