<?php

namespace App\EventListener;

use App\Entity\User;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\Security\Http\Event\LoginSuccessEvent;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;

class LoginSuccessListener
{
    public function __construct(private UrlGeneratorInterface $router)
    {
    }

    public function onLoginSuccess(LoginSuccessEvent $event): void
    {
        /** @var User */
        $user = $event->getUser();
        $roles = $user->getRoles();

        if (in_array('ROLE_ADMIN', $roles)) {
            $url = $this->router->generate('admin');

            $response = new RedirectResponse($url);
            $event->setResponse($response);
        } else {
            $url = $this->router->generate('home');

            $response = new RedirectResponse($url);
            $event->setResponse($response);
        }
    }
}