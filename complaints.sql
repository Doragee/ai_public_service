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

네, 제공해주신 내용을 바탕으로 테이블 생성 SQL 쿼리를 작성했습니다.

테이블 이름은 complaints로 지정했으며, users 테이블이 존재하고 해당 테이블의 id를 참조하는 것으로 가정했습니다.

SQL

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

-- 쿼리 설명
-- CREATE TABLE complaints: complaints라는 이름의 새 테이블을 생성합니다.
-- id UUID PRIMARY KEY: id 컬럼을 UUID 타입의 기본 키(Primary Key)로 설정하여 각 민원을 고유하게 식별합니다.
-- title VARCHAR(255) NOT NULL: title 컬럼은 가변 길이 문자열(최대 255자)을 저장하며, NOT NULL 제약 조건으로 값이 비어있을 수 없도록 합니다.
-- user_id UUID REFERENCES users(id): user_id 컬럼은 users 테이블의 id 컬럼을 참조하는 외래 키(Foreign Key)입니다. 이를 통해 데이터 무결성을 유지할 수 있습니다.
-- status VARCHAR(50) CHECK (status IN ('접수', '진행중', '처리완료')): status 컬럼에는 '접수', '진행중', '처리완료' 세 가지 값만 들어갈 수 있도록 CHECK 제약 조건을 추가했습니다.
-- created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP: 행이 처음 생성될 때의 타임존을 포함한 타임스탬프가 자동으로 기록됩니다.
-- updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP: 행이 마지막으로 업데이트된 시간을 기록합니다. 이 필드는 보통 트리거(trigger)를 사용해 행이 업데이트될 때마다 자동으로 갱신되도록 설정하는 경우가 많습니다.

-- 마지막 업데이트 시간을 자동으로 갱신하는 함수 생성
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 테이블에 트리거 적용
CREATE TRIGGER update_complaints_updated_at
BEFORE UPDATE ON complaints
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();
