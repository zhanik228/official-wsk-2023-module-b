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
    <form class="mx-auto text-center d-flex flex-column gap-4 w-50" action="{{ route('workspace.store') }}" method="POST">
        @csrf
        <h2>Create Workspace</h2>
        <input class="form-control" type="text" name="title" placeholder="Title">
        <input class="form-control" type="text" name="description" placeholder="Description">
        <button
            class="btn btn-dark"
        >Create Workspace</button>
    </form>
    @error('message')
        <span class="alert alert-success">
            {{ $message }}
        </span>
    @enderror
    <table class="shadow p-2 mt-5 w-100">
        <thead>
            <tr class="border-bottom rounded-top">
                <th class="p-2">Title</th>
                <th class="p-2">Description</th>
            </tr>
        </thead>
        <tbody>
        @foreach($workspaces AS $workspace)
            <tr>
                <td class="p-2">{{ $workspace->title }}</td>
                <td class="p-2">{{ $workspace->description }}</td>
                <td class="p-2">
                    <a href="{{ route('workspace.edit', $workspace->id) }}" class="btn btn-dark text-light">
                        Edit
                    </a>
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</body>
</html>
