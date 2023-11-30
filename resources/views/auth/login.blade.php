<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <link rel="stylesheet" href="{{ asset('bootstrap-5.3.2-dist/css/bootstrap.css') }}">
    <link rel="stylesheet" href="{{ asset('style.css') }}">
</head>
<body class="d-flex align-items-center justify-content-center">
    <form class="d-flex flex-column gap-4" action="{{ route('login.store') }}" method="POST">
        @csrf
        <h2>Login</h2>
        <input
            class="form-control"
            type="text"
            placeholder="Username"
            name="username"
        >
        <input
            class="form-control"
            type="password"
            placeholder="Password"
            name="password"
        >
        <button
            class="btn btn-primary"
            type="submit"
        >
            Login
        </button>
        @if($errors->any())
            {{ implode('', $errors->all()) }}
        @endif
    </form>
</body>
</html>
