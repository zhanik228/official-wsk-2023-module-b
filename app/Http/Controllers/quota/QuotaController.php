<?php

namespace App\Http\Controllers\quota;

use App\Http\Controllers\Controller;
use App\Models\ApiToken;
use App\Models\Bill;
use App\Models\Quota;
use App\Models\Workspace;
use Illuminate\Http\Request;
use Illuminate\Queue\Console\TableCommand;

class QuotaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($workspaceId)
    {
        $workspace = Workspace::find($workspaceId);
        $tokens = ApiToken::where('workspace_id', $workspaceId)->get();
        $totality = 0;
        $workspace->currentBills->map(function($bill) use(&$totality) {
            $totality = $totality + $bill->total;
        });
        return view('quota.quota-list')->with([
            'workspace' => $workspace,
            'tokens' => $tokens,
            'totality' => $totality,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request, $workspaceId)
    {
        $quota = Quota::create([
            'workspace_id' => $workspaceId,
           'limit' => $request->limit
        ]);

        return redirect()->route('workspace.quota.index', $workspaceId)->withErrors([
            'message' => 'successfully created'
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($workspaceId, string $id)
    {
        Quota::where('id', $id)->delete();

        return redirect()->route('workspace.quota.index', $workspaceId);
    }
}
