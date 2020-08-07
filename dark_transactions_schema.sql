-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/sGcDUq
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "card_holder" (
    -- This is creating an identification for each card holder.
    "id" int   NOT NULL,
    -- Here you receive the name of the card holder.
    "name" varchar(100)   NOT NULL,
    CONSTRAINT "pk_card_holder" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "credit_card" (
    -- Here you receive a card number which also is the primary key so it can be referenced uniquely.
    "card" varchar(100)   NOT NULL,
    -- This card holder id is a reference to the unique id number generated in the card_holder table.
    "card_holder_id" int   NOT NULL,
    CONSTRAINT "pk_credit_card" PRIMARY KEY (
        "card"
     )
);

CREATE TABLE "merchant" (
    -- This is creating an id for each merchant specific to this table so that each merchant has a uniqe row.
    "id" int   NOT NULL,
    -- This is giving the name for each merchant.
    "name" varchar(100)   NOT NULL,
    -- Here we reference the merchant_category table to give a specific category
    "merchant_category_id" int   NOT NULL,
    CONSTRAINT "pk_merchant" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "merchant_category" (
    -- This is giving a unique id number to each type of merchant. We are categorizing the merchants to easily reference by group.
    "id" int   NOT NULL,
    -- Here we specify the name of each merchant category.
    "name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_merchant_category" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "transaction" (
    -- This gives a unique id to each individual transaction for easy reference.
    "id" bigint   NOT NULL,
    -- Here we are defining the date for each transaction.
    "date" varchar(250)   NOT NULL,
    -- Here we are specifying the amount for each transaction.
    "amount" varchar(50)   NOT NULL,
    -- Here we are giving the card number used for each individual transaction.
    "card" varchar(100)   NOT NULL,
    -- Here we are referencing the id column in the merchant table for each merchants specific id.
    "merchant_id" int   NOT NULL,
    CONSTRAINT "pk_transaction" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "credit_card" ADD CONSTRAINT "fk_credit_card_card_holder_id" FOREIGN KEY("card_holder_id")
REFERENCES "card_holder" ("id");

ALTER TABLE "merchant" ADD CONSTRAINT "fk_merchant_merchant_category_id" FOREIGN KEY("merchant_category_id")
REFERENCES "merchant_category" ("id");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_merchant_id" FOREIGN KEY("merchant_id")
REFERENCES "merchant" ("id");

