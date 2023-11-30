<?php

namespace App\Http\Controllers;

use App\Models\ApiToken;
use App\Models\Workspace;
use Illuminate\Http\Request;

class BillController extends Controller
{
    public function index($workspaceId) {
        $workspace = Workspace::find($workspaceId);
        $tokens = ApiToken::where('workspace_id', $workspaceId)->get();
        $totality = 0;
        $workspace->currentBills->map(function($bill) use(&$totality) {
            $totality = $totality + $bill->total;
        });
        return view('bill.bill-list')->with([
            'workspace' => $workspace,
            'tokens' => $tokens,
            'totality' => $totality
        ]);
    }
}
