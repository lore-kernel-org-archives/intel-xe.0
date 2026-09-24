Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3936C98317
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 11:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEF010F463;
	Thu, 24 Sep 2026 11:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XWtJ8v0G";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5E710F48D
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 11:24:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 96FE240D6F;
 Thu, 24 Sep 2026 11:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662051F000FF;
 Thu, 24 Sep 2026 11:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790249049;
 bh=b+yVoGZdSdiuOqXePWOu/nOS3nWDpwEqsteq8B7BE7w=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=XWtJ8v0GbIuPsHchWaBDR+4gwF67/OOs8dkRxNGLzyl+yPkVEyfwmqRHjtP18jcrO
 FSadslde8fcqDW9g0qFHBBbIDqFi/scNquEtQyVxx96SVho9nN5TEejCK2PxXRZGzp
 Fmc0WZ1Jv1LQMDRo1cZ8ajX+ECleFAzKpgjPsv8TUPI5zGWuHRB56VPWcBarFXTjYJ
 esDxtg+Z3bUhh4UkB6ceppWTZFTeBAojJG4aojLIY+efnby3ksWc4HX3VhRRix416A
 8/oTpx9V4wPnjh7EueJgtWnIEzoOFxlqjHupLlKa7MWSaxycRfTyaZ2Lw2xJFrvKl9
 Bu0r0gNo1d6Cg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/13] drm/xe/hwmon: Add platform-aware VRAM thermal
 channel support
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260924111156.2628915-10-karthik.poosa@intel.com>
References: <20260924111156.2628915-1-karthik.poosa@intel.com>
 <20260924111156.2628915-10-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 11:24:09 +0000
Message-Id: <20260924112409.662051F000FF@smtp.kernel.org>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] hwmon: VRAM temperature array overlaps with CRI control registers
- [Medium] hwmon: VRAM temperature channels truncated for sparse MSU masks
--

commit e9469679c20c906facf743cdf68972d046f4524d
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Add platform-aware VRAM thermal channel support

On CRI, derive the number of available VRAM temperature channels from the
CRI_MSU_VRAM_ENABLE register, where each enabled MSU contributes
VRAM_CHANNELS_PER_MSU channels.
=20
Increase the maximum supported VRAM channel count to 80 and use the
derived count to control VRAM sensor enumeration, channel access, and
VRAM label allocation. Add a has_fixed_vram_channels platform flag to
preserve the existing fixed-channel behavior on non-CRI platforms.

> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe=
/regs/xe_pcode_regs.h
> index c63b409d7a821..11916b4f7cfc0 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -29,5 +29,6 @@
> =20
>  #define CRI_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
>  #define CRI_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
> +#define CRI_MSU_VRAM_ENABLE             XE_REG(0x138340)
> =20
>  #endif /* _XE_PCODE_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index cf5d51c685360..1b587bd9487e1 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -39,7 +39,11 @@ enum xe_hwmon_reg_operation {
>  	REG_READ64,
>  };
> =20
> -#define MAX_VRAM_CHANNELS      (16)
> +#define MAX_VRAM_CHANNELS	80

[Severity: High]
Does the VRAM temperature array overlap with the newly added CRI control
registers?

The BMG_VRAM_TEMPERATURE_N(n) macro calculates the register address as
0x138260 + (n * 4). By increasing MAX_VRAM_CHANNELS to 80, this expands the
temperature array significantly.

For channel 56, the address evaluates to 0x138260 + 0xE0 =3D 0x138340, which
overlaps with the newly added CRI_MSU_VRAM_ENABLE. Channel 57 overlaps with
CRI_PACKAGE_TEMPERATURE (0x138344), and channel 58 overlaps with
CRI_VRAM_TEMPERATURE (0x138348).

Reading VRAM temperature channels >=3D 56 will read unrelated control or
status registers. This regression can lead to bogus temperature reporting or
potential hardware side-effects on platforms that enable them.

> +#define FIXED_VRAM_CHANNELS	16
> +
> +/* Each MSU enable bit maps to one VRAM subsystem of 4 channels. */
> +#define VRAM_CHANNELS_PER_MSU	4
> =20
>  enum xe_hwmon_channel {
[ ... ]
> @@ -805,15 +887,38 @@ static const struct hwmon_channel_info * const hwmo=
n_info[] =3D {
>  static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>  {
>  	struct xe_tile *root_tile =3D xe_device_get_root_tile(hwmon->xe);
> +	struct xe_mmio *mmio =3D xe_root_tile_mmio(hwmon->xe);
>  	u32 config =3D 0;
>  	int ret;
> =20
> +	/*
> +	 * Only CRI reports dynamic VRAM channel state. Fixed-channel platforms
> +	 * set the count up front so those sensors stay visible even if the the=
rmal
> +	 * mailbox reads below fail.
> +	 */
> +	if (hwmon->xe->info.has_fixed_vram_channels)
> +		hwmon->temp.vram_count =3D FIXED_VRAM_CHANNELS;
> +
> +	if (hwmon->xe->info.platform =3D=3D XE_CRESCENTISLAND) {
> +		hwmon->temp.msu_mask =3D xe_mmio_read32(mmio, CRI_MSU_VRAM_ENABLE);
> +		/* Each enabled MSU bit maps to VRAM_CHANNELS_PER_MSU channels. */
> +		hwmon->temp.vram_count =3D hweight32(hwmon->temp.msu_mask) * VRAM_CHAN=
NELS_PER_MSU;

[Severity: Medium]
Does this calculate the upper bound as the population count rather than the
maximum active index?

If the msu_mask is sparse (e.g., bit 0 and bit 4 enabled, yielding 8 total
channels), vram_count will evaluate to 8.

Later in xe_hwmon_get_reg(), this vram_count is used as an upper bound:
in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count)

When iterating, channels 16-19 (corresponding to bit 4) will fail the
in_range(..., 8) check because their relative index (16) is >=3D 8. This
regression causes valid hardware sensors for higher-indexed MSUs to be
silently skipped and not exported to userspace.

> +		drm_dbg(&hwmon->xe->drm, "MSU VRAM enable mask 0x%x, VRAM channel coun=
t %d\n",
> +			hwmon->temp.msu_mask, hwmon->temp.vram_count);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924111156.2628=
915-1-karthik.poosa@intel.com?part=3D9
