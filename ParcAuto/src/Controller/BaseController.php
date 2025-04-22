<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class BaseController extends AbstractController
{
    #[Route('/', name: 'index')]
    public function index(): Response
    {
        return $this->render('base/index.html.twig', [
        ]);
    }
    #[Route('/', name: "connexion")]
    public function connexion(): Response
    {
        return $this->render('base/connexion.html.twig', [
        ]);
    }
    #[Route('/', name: "creation")]
    public function creation(): Response
    {
        return $this->render('base/creation.html.twig', [
        ]);
    }
}
