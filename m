Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C55C624D3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 18:08:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8B910F304;
	Wed,  2 Sep 2026 18:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cxxRBoeN";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0039B10F304
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 18:08:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 735BA600D1;
 Wed,  2 Sep 2026 18:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD161F000E9;
 Wed,  2 Sep 2026 18:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788372491;
 bh=Hi/RqFGliRz5S35e+3sWuY1meZzr0MkIOikXGH5+YEE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=cxxRBoeN6BNoVvHwsBvUFdV7nPHhAE9NJS8Yj27lHwloTep+CF57oEInGnXDqlL16
 HG38eO3eyQ2nJiH72vkX5fbLcseSf6CJ9VdQBfX0z0ThVGsr91AKc7dd+g4hCub5Qq
 9xuBQhucDRelp9od/zo8lE4gTcQYLsqOa11KEeSymSnagDqQ0d55mb5nZlTb6SSe1u
 v2EbLWhV2K4GZ+oegGp3IhOggBaBqD17aUB5SmI9/dyJLPC61gpoW9LM2Z/szfG+lc
 IQdrUmNXPIw2Vu/ZPL/KVHGDpfOY1Y6tDodIrtp1lUNTLz6gJWdPfemAXbTfZiCwWJ
 CfEgwGhcdrriw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] drm/xe/hwmon: Decode CRI temperature registers
 as IEEE-754
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260902175507.3910573-5-karthik.poosa@intel.com>
References: <20260902175507.3910573-1-karthik.poosa@intel.com>
 <20260902175507.3910573-5-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 18:08:10 +0000
Message-Id: <20260902180811.0BD161F000E9@smtp.kernel.org>
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
- [Medium] Missing bounds check for negative shift values leads to integer =
overflow on 32-bit systems.
- [Medium] Missing REG_TEMP register definitions for XE_CRESCENTISLAND caus=
es temperature attributes to be hidden and new decoding logic to be dead co=
de.
--

commit 0e96a51c64ab3a240ac604df829dbc789366c5c7
Author: Karthik Poosa <karthik.poosa@intel.com>
Subject: drm/xe/hwmon: Decode CRI temperature registers as IEEE-754

This commit adds support for decoding Crescent Island (CRI) hardware
temperature registers, which encode package and VRAM temperatures as
IEEE-754 floating-point values. It introduces an integer-based decoder
to properly convert and expose these values through the hwmon subsystem.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 3a675d7b6758b..c2b8d4c79783a 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
[ ... ]
> +static int xe_hwmon_temperature_decode(u32 reg_val, long *temperature)
> +{
> +	u32 exponent =3D (reg_val >> 23) & 0xff;
> +	u32 mantissa =3D reg_val & 0x7fffff;
> +	s64 value;
> +	int shift;
[ ... ]
> +	value =3D (s64)(mantissa | BIT(23)) * MILLIDEGREE_PER_DEGREE;
> +	shift =3D exponent - 150;
> +	if (shift >=3D 0) {
> +		if (shift >=3D BITS_PER_LONG || value > (LONG_MAX >> shift))
> +			return -ERANGE;
> +		value <<=3D shift;
> +	} else if (shift > -64) {
> +		value >>=3D -shift;

[Severity: Medium]
Does this negative shift path need bounds checking for 32-bit systems?

Since long is 32 bits on those systems, the computed value before the
shift might require up to 34 bits. If the exponent is 148 or 149
(resulting in a shift of -2 or -1), the right-shifted value can still
take 32 or 33 bits, exceeding LONG_MAX.=20

This would cause the value to silently overflow when assigned to=20
long *temperature, resulting in a wrapped negative temperature instead of
returning an error.

> +	} else {
> +		value =3D 0;
> +	}
> +
> +	if (reg_val & BIT(31))
> +		value =3D -value;
> +
> +	*temperature =3D value;
> +	return 0;
> +}
[ ... ]
> @@ -1135,26 +1187,27 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 at=
tr, int channel, long *val)
>  	switch (attr) {
>  	case hwmon_temp_input:
>  		switch (channel) {
[ ... ]
>  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>  			reg_val =3D xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, ch=
annel));
> +			if (hwmon->xe->info.platform >=3D XE_CRESCENTISLAND) {
> +				return xe_hwmon_temperature_decode((u32)reg_val, val);

[Severity: Medium]
Will this new decoding logic for XE_CRESCENTISLAND ever be reached?

When the hwmon subsystem initializes and calls xe_hwmon_temp_is_visible(),
it checks is_temp_available(), which in turn calls=20
xe_hwmon_get_reg(..., REG_TEMP, channel).=20

Currently, xe_hwmon_get_reg() only defines REG_TEMP for BATTLEMAGE and DG2,
meaning it falls through and returns an invalid XE_REG(0) for Crescent
Island. Because the register is invalid, is_temp_available() will return
false, making the sysfs temperature attributes invisible and leaving this
decoding logic as dead code.=20

Should xe_hwmon_get_reg() be updated to include Crescent Island?

> +			} else if (channel >=3D CHANNEL_VRAM_N) {
> +				/*
> +				 * This temperature format is 24 bit [31:8] signed integer and 8 bit
> +				 * [7:0] fraction for platforms before CRI.
> +				 */
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902175507.3910=
573-1-karthik.poosa@intel.com?part=3D4
