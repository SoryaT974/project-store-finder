<?php

namespace App\EventListener;

use Symfony\Component\Security\Core\Event\AuthenticationSuccessEvent;
use Symfony\Component\Security\Core\Exception\AuthenticationException;

class LoginVerifiedListener
{
    public function onAuthenticationSuccess(AuthenticationSuccessEvent $event)
    {
        /** @var User */
        $user = $event->getAuthenticationToken()->getUser();
        if (!$user->isVerified()) {
            throw new AuthenticationException("Merci de vérifier votre boite mail et de valider votre compte via le lien qui vous a été envoyé.");
        }
    }
}