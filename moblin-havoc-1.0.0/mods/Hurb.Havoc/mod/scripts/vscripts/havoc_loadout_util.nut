global function Havoc_Loadout_Util

void function Havoc_Loadout_Util()
{
  #if SERVER
		AddCallback_OnTitanGetsNewTitanLoadout( SetHavocTitanLoadout );
  #endif
}

//==================================================//Apply loadout//==================================================//

void function SetHavocTitanLoadout( entity titan, TitanLoadoutDef loadout  )
{
	#if SERVER
	if(loadout.titanClass == "#DEFAULT_TITAN_HAVOC")
	{
		entity player = GetPetTitanOwner( titan )
		entity soul = titan.GetTitanSoul()

		if (!(IsValid( soul )))
			return

//==================================================//KITS//==================================================//

		if(SoulHasPassive( soul, ePassives["#GEAR_HAVOC_HYDRAULIC"] ) )
		{
			titan.GetMainWeapons()[0].SetMods(["pressurised_chamber"])
        }
		if(SoulHasPassive( soul, ePassives["#GEAR_HAVOC_TEST"] ) )
		{
			titan.GetMainWeapons()[0].SetMods(["bursttest"])
        }
		/*if(SoulHasPassive( soul, ePassives["#GEAR_ARCHON_FEEDBACK"] ) )
		{
			titan.GetMainWeapons()[0].SetMods(["static_feedback"])
        }
        if(SoulHasPassive( soul, ePassives["#GEAR_ARCHON_SMOKE"] ) )
		{
			titan.GetOffhandWeapon(OFFHAND_EQUIPMENT).SetMods(["bring_the_thunder"])
        }
        if(SoulHasPassive( soul, ePassives["#GEAR_ARCHON_THYLORD"] ) )
		{
			titan.GetOffhandWeapon(OFFHAND_RIGHT).SetMods(["thylord_module"])
        }
		if(SoulHasPassive( soul, ePassives["#GEAR_ARCHON_SHIELD"] ) )
		{
			titan.GetOffhandWeapon(OFFHAND_SPECIAL).SetMods(["bolt_from_the_blue"])
        }*/

//==================================================//AEGIS RANKS//==================================================//

		if(GetCurrentPlaylistVarInt("aegis_upgrades", 0) == 1)
		{
			//Rank 1: ???

			//Rank 2: Chassis Upgrade
			loadout.setFileMods.append( "fd_health_upgrade" )

			//Rank 3: ???

			//Rank 4: ???

			//Rank 5: Shield Upgrade
			float titanShieldHealth = GetTitanSoulShieldHealth( soul )
			soul.SetShieldHealthMax( int( titanShieldHealth * 1.5 ) )

			//Rank 6: ???

			//Rank 7: ???
		}
	}
	#endif
}
