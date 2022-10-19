<?php

namespace App\Controller;

use App\Entity\User;
use App\Entity\Store;
use App\Entity\Favorite;
use App\Repository\FavoriteRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class FavoriteController extends AbstractController
{
    #[Route('/favorite', name: 'app_favorite')]
    public function index(): Response
    {
        return $this->render('favorite/index.html.twig', [
            'favorite' => 'FavoriteController',
        ]);
    }

    #[Route('/add-favorite/{store}', name: 'app_add_favorite')]
    public function addFavorite(Store $store, FavoriteRepository $favoriteRepository) 
    {
        $user = $this->getUser();
        $favorite = new Favorite();
        $favorite->setStore($store);
        $favorite->setUser($user);
        $favoriteRepository->add($favorite, true);

        return new JsonResponse(['id' => $favorite->getId()]);
    }

    #[Route('/remove-favorite/{favorite}', name: 'app_remove_favorite')]
    public function removeFavorite(Favorite $favorite, FavoriteRepository $favoriteRepository) 
    {
        /** @var User */
        $user = $this->getUser();

        if ($user->hasFavorite($favorite)) {
            $favoriteRepository->remove($favorite);
        }

        return new JsonResponse('ok');
    }
}
