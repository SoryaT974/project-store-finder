<?php

namespace App\Controller\Admin;

use App\Entity\Store;
use EasyCorp\Bundle\EasyAdminBundle\Field\SlugField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ArrayField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TelephoneField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

#[IsGranted('ROLE_ADMIN')]
class StoreCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Store::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('name'),
            TextEditorField::new('description'),
            AssociationField::new('categories'),
            ImageField::new('imageUrl')->setBasePath('uploads/')->setUploadDir('public/uploads/'),
            TelephoneField::new('phoneNumber'),
            ArrayField::new('schedule'),
            NumberField::new('latitude'),
            NumberField::new('longitude'),
            DateTimeField::new('createdDate')->setDisabled(),
            DateTimeField::new('updatedDate')->setDisabled(),
        ];
    }
}
