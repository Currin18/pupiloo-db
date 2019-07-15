create type user_role_type as enum('teacher', 'admin');
create table user (
    id bigserial primary key not null,
    created_at timestamp not null,
    updated_at timestamp not null,
    email varchar(255) not null,
    password varchar(255) not null,
    password_salt varchar(255) not null,
    role_type user_role_type not null
);

create table teacher (
    id bigserial primary key not null,
    created_at timestamp not null,
    updated_at timestamp not null,
    name varchar(255) not null,
    address varchar(255),
    fiscal_data jsonb,
    availability jsonb
    enabled boolean not null default false,
    user_id bigint references user(id) on delete set null
);

create table father (
    id bigserial primary key not null,
    created_at timestamp not null,
    updated_at timestamp not null,
    name varchar(255) not null,
    address varchar(255),
    billing_address jsonb,
    enabled boolean not null default false
);

create table billing (
    id bigserial primary key not null,
    created_at timestamp not null,
    updated_at timestamp not null,
    name varchar(255) not null,
    amount bigint not null,
);

create table lesson (
    id bigserial primary key not null,
    created_at timestamp not null,
    updated_at timestamp not null,
    teacher_id bigint references teacher(id) on delete set null,
    father_id bigint references father(id) on delete set null,
    students jsonb,
    billing_id bigint references billing(id) on delete set null,
    scheduled_date date not null,
    start_time time,
    end_time time
);