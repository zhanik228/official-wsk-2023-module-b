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
    <table class="shadow p-2 mt-5 w-100">
        <thead>
        <tr class="border-bottom rounded-top">
            <th class="p-2">Token</th>
            <th class="p-2">Time</th>
            <th class="p-2">Per sec.</th>
            <th class="p-2">Total</th>
        </tr>
        </thead>
        <tbody>
        @foreach($workspace->currentBills AS $currentBill)
            <tr>
                <td class="p-2">{{ $currentBill->token->name }}</td>
                <td class="p-2">{{ $currentBill->usage_service_per_sec }} s</td>
                <td class="p-2">{{ $currentBill->service->service_cost_per_sec }} $</td>
                <td class="p-2">
                    {{ $currentBill->total }} $
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
    <div class="d-flex justify-content-between align-items-end mt-5">
        <p class=" fs-2">Total</p>
        <p class="fs-3">{{ $totality }} $</p>
    </div>
</main>
</body>
</html>
