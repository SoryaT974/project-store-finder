<?php

namespace App\EventListener;

use App\Entity\User;
use DateTimeImmutable;
use Doctrine\Persistence\Event\LifecycleEventArgs;

class UserListener 
{
    public function prePersist(User $user, LifecycleEventArgs $event)
    {
        $user->setUpdatedDate(new DateTimeImmutable());
    }
}