<?php

namespace App\Controller;

use App\Repository\CategoryRepository;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;


class SearchController extends AbstractController
{
    #[Route('/search', name: 'app_search')]
    public function index(Request $request, CategoryRepository $categoryRepository, SerializerInterface $serializer): Response
    {
        $searchInput = $request->query->get('search-input');
        $searchResult = $categoryRepository->searchByName($searchInput);

        return new JsonResponse($serializer->serialize($searchResult, 'json', ['groups' => 'search']));
    }
}
