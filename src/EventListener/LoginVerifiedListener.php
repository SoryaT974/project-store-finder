<?php

namespace App\EventListener;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Security\Core\Event\AuthenticationSuccessEvent;
use Symfony\Component\Security\Core\Exception\AuthenticationException;
use Symfony\Component\Security\Http\Event\LoginSuccessEvent;

class LoginVerifiedListener
{
    public function onAuthenticationSuccess(AuthenticationSuccessEvent $event)
    {
        /** @var User */
        $user = $event->getAuthenticationToken()->getUser();
        if (!$user->isVerified()) {
            throw new AuthenticationException("Merci de vÃ©rifier vos email et valider votre compte.");
        }
    }
}