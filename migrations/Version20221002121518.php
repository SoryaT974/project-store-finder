<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20221002121518 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE address (id INT AUTO_INCREMENT NOT NULL, store_id INT NOT NULL, street_number INT DEFAULT NULL, street_name VARCHAR(150) NOT NULL, city VARCHAR(150) NOT NULL, postal_code INT NOT NULL, country VARCHAR(75) NOT NULL, UNIQUE INDEX UNIQ_D4E6F81B092A811 (store_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE category (id INT AUTO_INCREMENT NOT NULL, parent_id INT DEFAULT NULL, name VARCHAR(150) NOT NULL, created_date DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', updated_date DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', INDEX IDX_64C19C1727ACA70 (parent_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE opinion (id INT AUTO_INCREMENT NOT NULL, store_id INT NOT NULL, user_name VARCHAR(150) NOT NULL, score INT NOT NULL, comment VARCHAR(255) DEFAULT NULL, INDEX IDX_AB02B027B092A811 (store_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE store (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, slug VARCHAR(255) NOT NULL, phone_number VARCHAR(45) DEFAULT NULL, schedule JSON DEFAULT NULL, description VARCHAR(255) DEFAULT NULL, created_date DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', updated_date DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE store_category (store_id INT NOT NULL, category_id INT NOT NULL, INDEX IDX_383B663BB092A811 (store_id), INDEX IDX_383B663B12469DE2 (category_id), PRIMARY KEY(store_id, category_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE `user` (id INT AUTO_INCREMENT NOT NULL, last_name VARCHAR(45) NOT NULL, first_name VARCHAR(45) NOT NULL, user_name VARCHAR(45) NOT NULL, phone_number VARCHAR(45) NOT NULL, email VARCHAR(45) NOT NULL, password VARCHAR(45) NOT NULL, created_date DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', updated_date DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE address ADD CONSTRAINT FK_D4E6F81B092A811 FOREIGN KEY (store_id) REFERENCES store (id)');
        $this->addSql('ALTER TABLE category ADD CONSTRAINT FK_64C19C1727ACA70 FOREIGN KEY (parent_id) REFERENCES category (id)');
        $this->addSql('ALTER TABLE opinion ADD CONSTRAINT FK_AB02B027B092A811 FOREIGN KEY (store_id) REFERENCES store (id)');
        $this->addSql('ALTER TABLE store_category ADD CONSTRAINT FK_383B663BB092A811 FOREIGN KEY (store_id) REFERENCES store (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE store_category ADD CONSTRAINT FK_383B663B12469DE2 FOREIGN KEY (category_id) REFERENCES category (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE address DROP FOREIGN KEY FK_D4E6F81B092A811');
        $this->addSql('ALTER TABLE category DROP FOREIGN KEY FK_64C19C1727ACA70');
        $this->addSql('ALTER TABLE opinion DROP FOREIGN KEY FK_AB02B027B092A811');
        $this->addSql('ALTER TABLE store_category DROP FOREIGN KEY FK_383B663BB092A811');
        $this->addSql('ALTER TABLE store_category DROP FOREIGN KEY FK_383B663B12469DE2');
        $this->addSql('DROP TABLE address');
        $this->addSql('DROP TABLE category');
        $this->addSql('DROP TABLE opinion');
        $this->addSql('DROP TABLE store');
        $this->addSql('DROP TABLE store_category');
        $this->addSql('DROP TABLE `user`');
    }
}
