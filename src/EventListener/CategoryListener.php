<?php

namespace App\EventListener;

use App\Entity\Category;
use DateTimeImmutable;
use Doctrine\Persistence\Event\LifecycleEventArgs;

class CategoryListener 
{
    public function prePersist(Category $category, LifecycleEventArgs $event)
    {
        $category->setUpdatedDate(new DateTimeImmutable());
    }
}