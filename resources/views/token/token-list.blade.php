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
        <a href="{{ route('workspace.edit', $workspace->id) }}"
           class="text-decoration-none text-dark">
            {{ $workspace->title }}
        </a>
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
    <form class="mx-auto text-center d-flex flex-column gap-4 w-50 my-2" action="{{ route('workspace.token.index', $workspace->id) }}" method="POST">
        @csrf
        <h2>Create Token</h2>
        <input class="form-control" type="text" name="name" placeholder="Title">
        <button
            class="btn btn-dark"
        >Create Token</button>
    </form>
    @error('message')
    <span class="d-block my-4 alert alert-success text-success"> {{ $message }}</span>
    @enderror
    <table class="shadow p-2 mt-5 w-100">
        <thead>
        <tr class="border-bottom rounded-top">
            <th class="p-2">Name</th>
            <th class="p-2">Created At</th>
            <th class="p-2">Revoked At</th>
        </tr>
        </thead>
        <tbody>
        @foreach($tokens AS $token)
            @if($token->revoked_at)
                <tr class="bg-danger">
                    <td class="p-2">{{ $token->name }}</td>
                    <td class="p-2">{{ $token->created_at }}</td>
                    <td class="p-2">{{ $token->revoked_at }}</td>
                    <td class="p-2">
                        <a href="{{ route('workspace.edit', $workspace->id) }}" class="btn disabled btn-dark text-light">
                            Revoked
                        </a>
                    </td>
                </tr>
                @else
                <tr>
                    <td class="p-2">{{ $token->name }}</td>
                    <td class="p-2">{{ $token->created_at }}</td>
                    <td class="p-2"></td>
                    <td class="p-2">
                        <form action="{{ route('workspace.token.destroy', [$workspace->id, $token->id]) }}" method="POST">
                            @csrf
                            @method('delete')
                            <button type="submit" class="btn btn-dark text-light">
                                Revoke
                            </button>
                        </form>
                    </td>
                </tr>
            @endif
        @endforeach
        </tbody>
    </table>
</main>
</body>
</html>
