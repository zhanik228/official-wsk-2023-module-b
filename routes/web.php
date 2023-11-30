<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return redirect()->route('login.index');
});

Route::resource('login', \App\Http\Controllers\auth\AuthController::class);
Route::middleware('web')->group(function() {
    Route::resource('workspace', \App\Http\Controllers\workspace\WorkspaceController::class);
    Route::resource('workspace.token', \App\Http\Controllers\token\ApiTokenController::class);
    Route::resource('workspace.quota', \App\Http\Controllers\quota\QuotaController::class);
    Route::resource('workspace.bill', \App\Http\Controllers\BillController::class);
});
