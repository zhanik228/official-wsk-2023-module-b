<?php

namespace App\Http\Controllers\workspace;

use App\Http\Controllers\Controller;
use App\Models\Workspace;
use Illuminate\Http\Request;

class WorkspaceController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $userId = $request->user()->id;
        $workspaces = Workspace::where('user_id', $userId)->get();
        return view('workspace.workspace-list')->with(['workspaces' => $workspaces]);
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
    public function store(Request $request)
    {
        $request->validate([
           'title' => 'max:100'
        ]);

        Workspace::create([
            'user_id' => $request->user()->id,
           'title' => $request->title,
           'description' => $request->description
        ]);

        return redirect()->route('workspace.index')->withErrors([
            'message' => 'Successfully created'
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
        $workspace = Workspace::find($id);
        return view('workspace.workspace-edit')
            ->with(['workspace' => $workspace]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $workspace = Workspace::find($id);
        $workspace->update([
            'title' => $request->title,
            'description' => $request->description
        ]);
        return redirect()->route('workspace.edit', $id)
            ->withErrors([
                'message' => 'Successfully updated'
            ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
