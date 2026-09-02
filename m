Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAAAC624D3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 18:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A058010F31A;
	Wed,  2 Sep 2026 18:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AlfqWqen";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA4A10F30B
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 18:10:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8488260232;
 Wed,  2 Sep 2026 18:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C201F00A3A;
 Wed,  2 Sep 2026 18:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788372622;
 bh=Dz6n2qT9aOMZk5WbkZJrbH8gXvhDSfTdGuAE8mfquMk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=AlfqWqenUTQMmjH85jD/9qUSb0aHB+WdZM7ysft4FY1F2WD1C2jfqNC+mW4c/Cs0l
 dVUna8u+BLWIt8euauFxd1tREKqzTFRWdYo3ibWvbbOdzWCVqEdGrxsjNBc+7bL7OQ
 xQXo1z9jch6BM4Mg5kNJu7++HhhIapw01i7fTSasN9B64cjU7F92HbO5hrYNjIQqg7
 ZmsGlvq39oo+qP0V+2ce9DTGyvFn3AIT5Y2M4PBTp5uLWVenT22eiq4Z9Fthz5g2GY
 SEG9OX7UrvJdXGhMPCNHb9/zNdeeFKTZ/4KXQGqzl5NnXr2RyM33vvTYnMWbD3pFG+
 RWrgT/XskSOLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] drm/xe/hwmon: Use VRAM temperature sensor count
 from thermal config on CRI
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260902175507.3910573-3-karthik.poosa@intel.com>
References: <20260902175507.3910573-1-karthik.poosa@intel.com>
 <20260902175507.3910573-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 18:10:21 +0000
Message-Id: <20260902181022.28C201F00A3A@smtp.kernel.org>
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
- [Medium] VRAM temperature sensors will not be exposed on Crescent Island =
(CRI) platforms because `xe_hwmon_get_reg()` lacks `REG_TEMP` support for `=
XE_CRESCENTISLAND`.
- [Medium] On Battlemage (BMG) platforms, all VRAM temperature sensors will=
 be silently hidden if the thermal PCODE mailbox initialization fails.
--

commit 426a936975a4587d5003554dc21e461abf340940
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Use VRAM temperature sensor count from thermal config on CRI
   =20
Read the number of VRAM temperature sensor channels from the second byte
of READ_THERMAL_CONFIG on CRI platforms. Use the reported count to avoid
exposing hwmon attributes for unavailable VRAM temperature sensors, while
retaining the maximum supported channel count on non-CRI platforms.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 768f6d68b2916..51a6664eec485 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
[ ... ]
> @@ -271,7 +275,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon=
 *hwmon, enum xe_hwmon_reg
>  				return BMG_PACKAGE_TEMPERATURE;
>  			else if (channel =3D=3D CHANNEL_VRAM)
>  				return BMG_VRAM_TEMPERATURE;
> -			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> +			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
>  				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
>  		} else if (xe->info.platform =3D=3D XE_DG2) {
>  			if (channel =3D=3D CHANNEL_PKG)

[Severity: Medium]
Will VRAM temperature sensors be exposed on XE_CRESCENTISLAND platforms?

When checking sysfs attribute visibility, is_temp_available() queries
xe_hwmon_get_reg() for REG_TEMP. Since xe_hwmon_get_reg() only has branches
for XE_BATTLEMAGE and XE_DG2, it returns an invalid register (XE_REG(0)) for
XE_CRESCENTISLAND platforms.

This causes is_temp_available() to unconditionally return false. Does this
code need a branch for XE_CRESCENTISLAND to return the correct VRAM
temperature registers?

[ ... ]
> @@ -786,6 +854,17 @@ static int xe_hwmon_pcode_read_thermal_info(struct x=
e_hwmon *hwmon)
>  	drm_dbg(&hwmon->xe->drm, "thermal config count 0x%x\n", config);
>  	hwmon->temp.count =3D REG_FIELD_GET(TEMP_MASK, config);
> =20
> +	if (hwmon->xe->info.platform >=3D XE_CRESCENTISLAND) {
> +		hwmon->temp.vram_count =3D REG_FIELD_GET(VRAM_COUNT_MASK, config);
> +		if (hwmon->temp.vram_count > XE_MAX_VRAM_CHANNELS) {
> +			drm_warn(&hwmon->xe->drm, "VRAM channel count %d exceeds max %d, clam=
ping\n",
> +				 hwmon->temp.vram_count, XE_MAX_VRAM_CHANNELS);
> +			hwmon->temp.vram_count =3D XE_MAX_VRAM_CHANNELS;
> +		}
> +	} else {
> +		hwmon->temp.vram_count =3D BMG_MAX_VRAM_CHANNELS;
> +	}
> +
>  	return ret;
>  }

[Severity: Medium]
Will this silently hide all VRAM temperature sensors on Battlemage (BMG)
platforms if the thermal PCODE mailbox initialization fails?

If xe_hwmon_pcode_read_thermal_info() encounters a failure (such as an error
reading READ_THERMAL_LIMITS or READ_THERMAL_CONFIG earlier in the function),
it returns early. This skips the fallback assignment of hwmon->temp.vram_co=
unt
at the end of the function.

Because hwmon->temp.vram_count is 0-initialized, the in_range() check will
subsequently evaluate to false in xe_hwmon_get_reg(), returning an invalid
register and hiding the sensors. Previously, this path fell back to a
hardcoded MAX_VRAM_CHANNELS value, preserving visibility.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902175507.3910=
573-1-karthik.poosa@intel.com?part=3D2
