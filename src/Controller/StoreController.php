<?php

namespace App\Controller;

use App\Entity\Category;
use App\Repository\StoreRepository;
use App\Repository\CategoryRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class StoreController extends AbstractController
{
    #[Route('/stores-by-category/{category}', name: 'app_stores_by_category')]
    public function index(Category $category, Request $request, StoreRepository $storeRepository, SerializerInterface $serializer): Response
    {
        $storesResult = $storeRepository->findByCategory($category);

        return new JsonResponse($serializer->serialize($storesResult, 'json'));
    }
}
