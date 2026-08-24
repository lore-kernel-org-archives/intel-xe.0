Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C79BC5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 18:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 347C210E0F5;
	Mon, 24 Aug 2026 18:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oY3+2PuN";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410D910E0F5
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 18:56:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D3CB141273;
 Mon, 24 Aug 2026 18:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C341F000E9;
 Mon, 24 Aug 2026 18:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787597793;
 bh=16zZyMmdKP+L0XnOYcxJOqXtdo7e8Yw3GfcMCeb4G+w=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=oY3+2PuNayPgqXgmQ1vOMQ+OG+/kuu4NUdaLz5fkdcp1gYCxAvg/Wk5txV/m4cESr
 /RfneRfWkGqLmwPITjJIvrMRs0YXPu9Sak5kCfo2li76RveJ0Q1k1cegbdrunu2ijA
 joVKVIP/ScH81pt6DUAl8zOaIJnTiXj8ImcMvKGJ/uWM+hA4IsaiYFB8l1PYUEzwBy
 xteipAzTSnEsZGmYOCx96azeVmIJN2f6TWrOwsSZ6unbEw/rVn8F57yoEfpzIhpxET
 lTP+nquDrL3Jq5OMC7Eip0/aqAEAaHCM1oH2rT0NMSLXDHT9ZVEXX4xxAKFQvK99Ii
 EdIsrFQINgdIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] drm/xe/hwmon: Use VRAM temperature sensor count
 from thermal config on CRI
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260824184137.2164727-7-karthik.poosa@intel.com>
References: <20260824184137.2164727-1-karthik.poosa@intel.com>
 <20260824184137.2164727-7-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 18:56:33 +0000
Message-Id: <20260824185633.A2C341F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Regression / Missing Initialization of vram_count disables MMIO se=
nsors
- [Medium] Incomplete Implementation / Unexposed Hardware Monitoring Channe=
ls
- [Medium] Dead Code / Unreachable Feature for XE_CRESCENTISLAND (CRI) plat=
forms
--

--- Patch [2]: [PATCH 2/3] drm/xe/hwmon: Use VRAM temperature sensor count =
from thermal config on CRI ---
commit dad00759fd95979bfa227e2bf51f1aad6c7133a4
Author: Karthik Poosa <karthik.poosa@intel.com>
Subject: drm/xe/hwmon: Use VRAM temperature sensor count from thermal confi=
g on CRI

This patch dynamically reads the number of VRAM temperature channels on
Crescent Island platforms. It increases the maximum channel count and uses
the pcode thermal config to determine available sensors.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index c15312b0858ca..8c8a519711230 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -39,7 +39,8 @@ enum xe_hwmon_reg_operation {
>  	REG_READ64,
>  };
> =20
> -#define MAX_VRAM_CHANNELS      (16)
> +/* Maximum number of VRAM channels supported by Xe */
> +#define MAX_VRAM_CHANNELS      (80)

[Severity: Medium]
Will the hwmon subsystem actually expose these additional channels?

Looking at the hwmon_info array in xe_hwmon.c, it is statically defined
with exactly 21 temperature items, ending with a NULL terminator.
Because the hwmon core stops iterating at the terminator, sensors past
vram_ch_16 won't be queried or exported to sysfs, making this increase
to 80 ineffective.

[ ... ]

> @@ -786,6 +790,17 @@ static int xe_hwmon_pcode_read_thermal_info(struct x=
e_hwmon *hwmon)
>  	drm_dbg(&hwmon->xe->drm, "thermal config count 0x%x\n", config);
>  	hwmon->temp.count =3D REG_FIELD_GET(TEMP_MASK, config);
> =20
> +	if (hwmon->xe->info.platform >=3D XE_CRESCENTISLAND) {
> +		hwmon->temp.vram_count =3D REG_FIELD_GET(VRAM_COUNT_MASK, config);

[Severity: Medium]
Are the parsed VRAM channels accessible on Crescent Island platforms?

When is_vram_ch_available() runs, it calls xe_hwmon_get_reg() to get the
temperature register. However, xe_hwmon_get_reg() does not currently have
a branch for XE_CRESCENTISLAND in the REG_TEMP switch case.

Because it falls through and returns XE_REG(0), xe_reg_is_valid() will
fail in is_vram_ch_available(), making these newly parsed sensors
unreachable for CRI platforms.

> +		if (hwmon->temp.vram_count > MAX_VRAM_CHANNELS && hwmon->temp.vram_cou=
nt) {
> +			drm_warn(&hwmon->xe->drm, "VRAM channel count %d exceeds max %d, clam=
ping\n",
> +				 hwmon->temp.vram_count, MAX_VRAM_CHANNELS);
> +			hwmon->temp.vram_count =3D MAX_VRAM_CHANNELS;
> +		}
> +	} else {
> +		hwmon->temp.vram_count =3D 16; /* For older platforms, max is 16 VRAM =
channels */
> +	}
> +
>  	return ret;
>  }

[ ... ]

> @@ -964,6 +979,9 @@ static inline bool is_vram_ch_available(struct xe_hwm=
on *hwmon, int channel)
>  	u32 reg_val;
>  	u8 temp;
> =20
> +	if (vram_id >=3D hwmon->temp.vram_count)
> +		return false;

[Severity: High]
Does this new check rely on pcode succeeding for older platforms?

If xe_hwmon_pcode_read_thermal_info() returns early due to a pcode mailbox
error when reading READ_THERMAL_LIMITS or READ_THERMAL_CONFIG, or is skipped
entirely, hwmon->temp.vram_count will remain 0.

Because of this check, an early return would unconditionally disable all
MMIO-based VRAM temperature sensors on platforms like BMG, losing existing
functionality. Previously, these sensors relied on a static maximum and
were completely decoupled from pcode initialization success.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824184137.2164=
727-1-karthik.poosa@intel.com?part=3D2
