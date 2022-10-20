<?php

namespace App\Controller;

use App\Entity\User;
use App\Entity\Store;
use App\Entity\Favorite;
use App\Repository\FavoriteRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Serializer\SerializerInterface;
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

    #[Route('/favorites-for-list', name: 'app_favorites_for_list')]
    public function favoritesList(FavoriteRepository $favoriteRepository, SerializerInterface $serializer) 
    {
        $user = $this->getUser();
        
        $favorites = $favoriteRepository->findBy(['user' => $user]);

        return new JsonResponse($serializer->serialize($favorites, 'json'));
    }

    #[Route('/add-favorite/{store}', name: 'app_add_favorite')]
    public function addFavorite(Store $store, FavoriteRepository $favoriteRepository) 
    {
        $user = $this->getUser();
        $favorite = new Favorite();
        $favorite->setStore($store);
        $favorite->setUser($user);
        $favoriteRepository->add($favorite, true);

        return new JsonResponse('OK');
    }

    #[Route('/remove-favorite/{store}', name: 'app_remove_favorite')]
    public function removeFavorite(Store $store, FavoriteRepository $favoriteRepository) 
    {
        /** @var User */
        $user = $this->getUser();
        $favorite = $favoriteRepository->findOneBy(['store' => $store, 'user' => $user]);
        
        $favoriteRepository->remove($favorite);

        return new JsonResponse('OK');
    }
}
