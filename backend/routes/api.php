<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/ping', fn () => response()->json(['message' => 'pong']));

Route::get('/login', fn () => response()->json(['message' => 'Unauthenticated.'], 401))->name('login');

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
