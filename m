Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8162DCA601E
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 12:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3538010F24D;
	Fri,  9 Oct 2026 12:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aum5GbQ5";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D79D10E5BF
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 12:16:15 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4975A407EF;
 Fri,  9 Oct 2026 12:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EBBB1F000FF;
 Fri,  9 Oct 2026 12:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791548175;
 bh=VlTaA9TGtQ+Gtt4sEdYY4tRYTeGBW/ktwONONvg8Vgs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=aum5GbQ5Mawum5C1A+si7eeJRlL77pI9Sg++nf+TXrkMolEuraUM8Yvphi8mp76+o
 t3c/pTkxyOjsqnl2B1wJrIhMHaCpnBKzceTHmDKTXzo8PK901cfIenihklS1iQaAl/
 pDD+0A6YJAcIqo0gWqr+iHNKX+jqxGB0xSf7KTRo3wvSGraU0LSEIOngqLQB5rdHxv
 ouQLJf+UWT8QKzm9vzIZLULdKtAh2/RYWDb/A27y9HNR00cH8TMX8j/fxOXN2ZoFRO
 /LTucmfgpuMb5TDtYkOE788JzX44r8rW2WJOnjl2GNsqdRmn+9I+Hg5KL5ZQHaJsxJ
 oVCZm9qa3z3pw==
Message-ID: <sashiko-outbox-165508@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 07/14] drm/xe/hwmon: Consolidate temperature sensor
 availability checks
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261009120335.52973-8-karthik.poosa@intel.com>
References: <20261009120335.52973-1-karthik.poosa@intel.com>
 <20261009120335.52973-8-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 12:16:14 +0000
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
- [Medium] drm/xe/hwmon: live hardware read during probe permanently hides =
sysfs attributes on transient failure
- [Medium] drm/xe/hwmon: endianness bug when extracting thermal limits via =
union
--

commit bbb594b78c17c03bdb11a59f0ce797f39d14c3e9
Author: Karthik Poosa <karthik.poosa@intel.com>
Subject: drm/xe/hwmon: Consolidate temperature sensor availability checks

This commit replaces is_vram_ch_available() with a generalized
is_temp_available() function that validates multiple sensor types using new
helpers. It uses this new function during hwmon registration to ensure
attributes for absent sensors are not exposed.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index accccadbe3e67..62e341ef37e9b 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c

[ ... ]

> @@ -1008,19 +1008,39 @@ static void xe_hwmon_get_voltage(struct xe_hwmon =
*hwmon, int channel, long *valu
>  	*value =3D DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 250=
0, SF_VOLTAGE);
>  }
> =20
> -static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int chan=
nel)
> +static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
>  {
>  	struct xe_mmio *mmio =3D xe_root_tile_mmio(hwmon->xe);
> -	int vram_id =3D channel - CHANNEL_VRAM_N;
> -	struct xe_reg vram_reg;
> +	struct xe_reg reg;
> +	u32 reg_val;
> =20
> -	vram_reg =3D xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
> -	if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
> -		return false;
> +	switch (channel) {
> +	case CHANNEL_PKG:
> +	case CHANNEL_VRAM:
> +	case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> +		reg =3D xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
> +		if (!xe_reg_is_valid(reg))
> +			return false;
> +
> +		reg_val =3D xe_mmio_read32(mmio, reg);
> +		if (!mmio_temp_valid(hwmon, reg_val)) {

[Severity: Medium]
Since this function is called during hwmon registration to determine attrib=
ute
visibility, does this live hardware read risk permanently hiding sysfs
attributes if the hardware is transiently busy or uninitialized?

If the sensor returns 0 (which mmio_temp_valid treats as invalid) during
driver probe, the attribute will be hidden for the entire boot cycle.

> +			drm_dbg(&hwmon->xe->drm,
> +				"channel %d temperature unavailable, val 0x%x\n", channel, reg_val);
> +			return false;
> +		}
> +
> +		if (channel >=3D CHANNEL_VRAM_N)
> +			sprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N],
> +				"vram_ch_%d", channel - CHANNEL_VRAM_N);
> =20
> -	/* Create label only for available vram channel */
> -	sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
> -	return true;
> +		return true;
> +	case CHANNEL_MCTRL:
> +		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);

[Severity: Medium]
Similar to the MMIO read above, could this PCODE mailbox read cause
attributes to be permanently hidden?

If the PCODE mailbox transiently times out during driver probe,
get_mc_temp() will return an error, causing the MCTRL attribute to be
permanently hidden for the duration of the boot cycle.

> +	case CHANNEL_PCIE:
> +		return hwmon->temp.count && !get_pcie_temp(hwmon, NULL);
> +	default:
> +		return false;
> +	}
>  }
> =20
>  static umode_t
> @@ -1030,14 +1050,13 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, =
u32 attr, int channel)
>  	case hwmon_temp_emergency:
>  		switch (channel) {
>  		case CHANNEL_PKG:
> -			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
> -		case CHANNEL_VRAM:
> -			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
>  		case CHANNEL_MCTRL:
>  		case CHANNEL_PCIE:
> -			return hwmon->temp.count ? 0444 : 0;
> +			return (is_temp_available(hwmon, channel) &&
> +				hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN]) ? 0444 : 0;

[Severity: Medium]
Does extracting thermal limits this way introduce an endianness bug?

While looking at how the limits are accessed here, the xe_hwmon_thermal_info
struct aliases u8 arrays with u32 arrays:

        union {
                u8 limit[TEMP_LIMIT_MAX];
                u32 data[DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32))];
        };

If the driver reads 32-bit values from PCODE into the u32 arrays, extracting
individual 8-bit limits by indexing into the u8 arrays assumes a little-end=
ian
memory layout. On big-endian architectures, index 0 will map to bits 24:31
instead of bits 0:7, potentially causing the driver to extract incorrect
thermal limits.

> +		case CHANNEL_VRAM:
>  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> -			return (is_vram_ch_available(hwmon, channel) &&
> +			return (is_temp_available(hwmon, channel) &&
>  				hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]) ? 0444 : 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009120335.5297=
3-1-karthik.poosa@intel.com?part=3D7
