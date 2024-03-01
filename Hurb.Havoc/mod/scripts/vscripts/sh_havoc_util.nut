untyped

global function HavocPrecache

void function HavocPrecache()
{
  #if SERVER
	RegisterWeaponDamageSources(
		{
			mp_titanweapon_havoc_triplethreat = "#WPN_HAVOC_TRIPLE_THREAT"
			mp_titanweapon_shockwave = "#WPN_TITAN_SHOCKWAVE"
			mp_titanweapon_arc_mine = "#WPN_TITAN_ARC_MINE_SHORT"
			mp_titanweapon_blast_shield = "#WPN_TITAN_BLAST_SHIELD"
		}
	)
	#endif

  HavocTripleThreat_Init()
  MpTitanweaponShockWave_Init()
  MpTitanweaponArcMine_Init()
  MpTitanweaponBlastShield_Init()
  Havoc_Loadout_Util()
  PrecacheWeapon("mp_titancore_berserk_core")
}
