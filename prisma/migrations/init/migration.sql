-- CreateTable
CREATE TABLE "ar_internal_metadata" (
    "key" VARCHAR NOT NULL,
    "value" VARCHAR,
    "created_at" TIMESTAMP(6) NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "ar_internal_metadata_pkey" PRIMARY KEY ("key")
);

-- CreateTable
CREATE TABLE "cities" (
    "id" BIGSERIAL NOT NULL,
    "name" VARCHAR,
    "created_at" TIMESTAMP(6) NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "cities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "data_migrations" (
    "version" VARCHAR NOT NULL,

    CONSTRAINT "data_migrations_pkey" PRIMARY KEY ("version")
);

-- CreateTable
CREATE TABLE "organizations" (
    "id" BIGSERIAL NOT NULL,
    "city_id" BIGINT NOT NULL,
    "name" VARCHAR,
    "address" VARCHAR,
    "telephone" VARCHAR,
    "email" VARCHAR,
    "iban" VARCHAR,
    "website" VARCHAR,
    "swift" VARCHAR,
    "verified" BOOLEAN DEFAULT false,
    "archived" BOOLEAN DEFAULT false,
    "created_at" TIMESTAMP(6) NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,
    "description" TEXT,
    "highlighted" BOOLEAN DEFAULT false,

    CONSTRAINT "organizations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "schema_migrations" (
    "version" VARCHAR NOT NULL,

    CONSTRAINT "schema_migrations_pkey" PRIMARY KEY ("version")
);

-- CreateIndex
CREATE INDEX "index_organizations_on_city_id" ON "organizations"("city_id");

-- AddForeignKey
ALTER TABLE "organizations" ADD CONSTRAINT "fk_rails_cc9c96a6c7" FOREIGN KEY ("city_id") REFERENCES "cities"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

