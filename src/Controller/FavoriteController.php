<?php

namespace App\Controller;

use App\Entity\User;
use App\Entity\Store;
use App\Entity\Favorite;
use App\Repository\FavoriteRepository;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class FavoriteController extends AbstractController
{
    #[IsGranted('ROLE_USER')]
    #[Route('/favorite', name: 'app_favorite')]
    public function index(FavoriteRepository $favoriteRepository): Response
    {
        $user = $this->getUser();
        
        $favorites = $favoriteRepository->findBy(['user' => $user]);

        return $this->render('favorite/index.html.twig', [
            'favorites' => $favorites,
        ]);
    }

    #[Route('/favorites-for-list', name: 'app_favorites_for_list')]
    public function favoritesList(FavoriteRepository $favoriteRepository, SerializerInterface $serializer) 
    {
        $user = $this->getUser();
        
        $favorites = $favoriteRepository->findBy(['user' => $user]);

        return new JsonResponse($serializer->serialize($favorites, 'json', ['groups' => ['favorite']]));
    }

    #[IsGranted('ROLE_USER')]
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

    #[IsGranted('ROLE_USER')]
    #[Route('/remove-favorite/{store}', name: 'app_remove_favorite')]
    public function removeFavorite(Store $store, FavoriteRepository $favoriteRepository) 
    {
        /** @var User */
        $user = $this->getUser();
        $favorite = $favoriteRepository->findOneBy(['store' => $store, 'user' => $user]);
        $favoriteRepository->remove($favorite, true);

        return new JsonResponse('OK');
    }
}
