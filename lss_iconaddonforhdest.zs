class LSS_IconAddon : LSS_EventHandler
{
    override TextureID GetTexture(LSS_Weapon currentWeapon)
    {
        TextureID texture;

        texture = GetHDestTexture(currentWeapon);

        if (texture.IsValid())
        {
            return texture;
        }
        else
        {
            // Fallback on the basic function
            return Super.GetTexture(currentWeapon);
        }
    }

    ui TextureID GetHDestTexture(LSS_Weapon currentWeapon)
    {
        HDWeapon hdWeapon = HDWeapon(currentWeapon.weapon);
        if (!hdWeapon) return null;

        String sprite;
        double scale;
        [sprite, scale] = hdWeapon.GetPickupSprite();

        //Console.printf("Sprite: %s", sprite);

        return TexMan.CheckForTexture(sprite, TexMan.TYPE_SPRITE);
    }
}