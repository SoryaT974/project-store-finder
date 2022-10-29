<?php

namespace App\EventListener;

use App\Entity\Store;
use DateTimeImmutable;
use Doctrine\Persistence\Event\LifecycleEventArgs;
use Symfony\Component\String\Slugger\AsciiSlugger;

class StoreListener 
{
    public function prePersist(Store $store, LifecycleEventArgs $event)
    {
        $store->setUpdatedDate(new DateTimeImmutable());
        $slugger = new AsciiSlugger();
        $slug = $slugger->slug($store->getName());
        $store->setSlug($slug);
    }
}