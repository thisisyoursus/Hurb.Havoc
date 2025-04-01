global function Havoc_CheckDependencies

struct
{
    string currentMod
    string currentDependency
    string currentURL
} file

void function Havoc_CheckDependencies()
{
    #if HAVOC_HAS_TITANFRAMEWORK

    #elseif UI
        Havoc_CreateDependencyDialog( "Hurb.Havoc", "Peepee.TitanFramework", "https://northstar.thunderstore.io/package/The_Peepeepoopoo_man/Titanframework/" )
    #endif
}

void function Havoc_CreateDependencyDialog( string mod, string dependency, string url )
{
    file.currentMod = mod
    file.currentDependency = dependency
    file.currentURL = url
    DialogData dialogData
    dialogData.header = Localize("#MISSING_DEPENDENCY_HEADER")

    array<ModInfo> infos = NSGetModInformation( dependency )

    //Mod not installed
    dialogData.message = Localize( "#MISSING_DEPENDENCY_BODY_INSTALL", mod, dependency, url )

	AddDialogButton( dialogData, "#OPEN_THUNDERSTORE", Havoc_InstallMod )
    AddDialogButton( dialogData, Localize("#DISABLE_MOD", mod), Havoc_DisableMod )
    AddDialogFooter( dialogData, "#A_BUTTON_SELECT" )
	AddDialogFooter( dialogData, "#B_BUTTON_BACK" )
    foreach ( ModInfo modInfo in infos )
    {
        if ( modInfo.name == dependency ){//Mod disabled
            dialogData.message = Localize( "#MISSING_DEPENDENCY_BODY_DISABLED", mod, dependency )

	        AddDialogButton( dialogData, Localize("#ENABLE_MOD", dependency), Havoc_EnableMod )
            AddDialogButton( dialogData, Localize("#DISABLE_MOD", mod), Havoc_DisableMod )
            AddDialogFooter( dialogData, "#A_BUTTON_SELECT" )
	        AddDialogFooter( dialogData, "#B_BUTTON_BACK" )
            break
        }
    }

	OpenDialog( dialogData )
}

void function Havoc_EnableMod()
{
    NSSetModEnabled( file.currentDependency, true )
    ReloadMods()
}

void function Havoc_InstallMod()
{
    LaunchExternalWebBrowser(file.currentURL, WEBBROWSER_FLAG_FORCEEXTERNAL)
    ReloadMods()
}

void function Havoc_DisableMod()
{
    NSSetModEnabled( file.currentMod, false )
    ReloadMods()
}
