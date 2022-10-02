<?php

namespace App\EventListener;

use App\Entity\Store;
use DateTimeImmutable;
use Doctrine\Persistence\Event\LifecycleEventArgs;

class StoreListener 
{
    public function prePersist(Store $store, LifecycleEventArgs $event)
    {
        $store->setUpdatedDate(new DateTimeImmutable());
    }
}