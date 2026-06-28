<?php

namespace Tests\Feature;

// use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ExampleTest extends TestCase
{
    /**
     * A basic test example.
     */
    public function test_the_api_ping_returns_pong(): void
    {
        $response = $this->getJson('/api/ping');

        $response->assertStatus(200)
            ->assertJson(['message' => 'pong']);
    }
}
