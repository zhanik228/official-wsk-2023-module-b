<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Workspace</title>
    <link rel="stylesheet" href="{{ asset('bootstrap-5.3.2-dist/css/bootstrap.css') }}">
    <link rel="stylesheet" href="{{ asset('style.css') }}">
</head>
<body class="container">
<header class="d-flex align-items-end gap-5">
    <a href="{{ route('workspace.index') }}" class="text-decoration-none text-dark fs-2"><-</a>
    <h2>
        {{ $workspace->title }}
    </h2>
    <nav>
        <ul class="list-unstyled d-flex gap-4">
            <li>
                <a href="{{ route('workspace.token.index', $workspace->id) }}" class="fs-5 text-decoration-none text-primary">Tokens</a>
            </li>
            <li>
                <a href="{{ route('workspace.quota.index', $workspace->id) }}" class="fs-5 text-decoration-none text-primary">Quotas</a>
            </li>
            <li>
                <a href="{{ route('workspace.bill.index', $workspace->id) }}" class="fs-5 text-decoration-none text-primary">Bills</a>
            </li>
        </ul>
    </nav>
</header>
<main>
    <form class="mx-auto text-center d-flex flex-column gap-4 w-50" action="{{ route('workspace.update', $workspace->id) }}" method="POST">
        @csrf
        @method('PUT')
        <h2>Edit Workspace</h2>
        <input value="{{ $workspace->title }}" class="form-control" type="text" name="title" placeholder="Title">
        <input value="{{ $workspace->description }}" class="form-control" type="text" name="description" placeholder="Description">
        <button
            class="btn btn-dark"
        >Update Workspace</button>
    </form>
    @error('message')
    <span class="d-block my-2 alert alert-success">
                {{ $message }}
            </span>
    @enderror
</main>
</body>
</html>
