class Highlander_XComZombie extends XComZombie;

simulated function ApplyShredderRocket(const DamageEvent Dmg, bool enemyOfUnitHit)
{
    class'Highlander_XComUnitPawn_Extensions'.static.ApplyShredderRocket(self, Dmg, enemyOfUnitHit);
}