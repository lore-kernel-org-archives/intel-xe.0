Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3ECC5DF81
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 18:59:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECCF10E126;
	Mon, 24 Aug 2026 18:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RMe0PpdK";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B45310E126
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 18:59:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2632A43DF2;
 Mon, 24 Aug 2026 18:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B0A1F000E9;
 Mon, 24 Aug 2026 18:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787597958;
 bh=OSzVi849IhyKcWL3u2WAS+fU5LBkNYY+a2WYMZ6TM/s=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=RMe0PpdKTEWu5UaBb2jDTUJh/V94BM4E3Vq9CEwAwO89fbdITgkRdnM+YGVoq1Olv
 gbO8bSP75GCZKtrD3r3vUaq+iMEEfV1Lrpv8kiQx3tQo1bqGIZc7EKSVi27KcAQwbL
 Y3d3t+CJu4nnO0AwrhVLxhakuCeHXbZnxh0MwWipDUMbiBk2D1gSzP2AZeKbjuSmZp
 jq7cW6dxZ0tQF18qV87SWm1Fx24m53BacSSjNCBrt9WOFdNRQNdZDzvM4uUzP+1jd5
 JdR06tAA5TZvIzp8CAS4JS3AACyqFhHAz5joxsUPQSFKsb5QA5h9jK6JsCdWvT7O6c
 GgEsT79wPV1og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] drm/xe/hwmon: Detect unavailable temperature sensors
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260824184137.2164727-2-karthik.poosa@intel.com>
References: <20260824184137.2164727-1-karthik.poosa@intel.com>
 <20260824184137.2164727-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 18:59:17 +0000
Message-Id: <20260824185917.D2B0A1F000E9@smtp.kernel.org>
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
- [High] Incorrect register bitmask `TEMP_MASK` extracts fractional tempera=
ture instead of integer, improperly hiding valid VRAM sensors.
- [Medium] Inverted short-circuit evaluation causes unconditional hardware =
PCODE reads and excessive log spam during hwmon registration.
- [Medium] Threshold limit sysfs attributes are exposed for unavailable sen=
sors due to missing validity checks.
--

--- Patch [1]: [PATCH 1/3] drm/xe/hwmon: Detect unavailable temperature sen=
sors ---
commit de3d36ad17dd257811068fa1f47a4b3779a65fb1
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Detect unavailable temperature sensors

Add is_temp_valid() to validate sensor presence.
A temperature reading of 0xFF on CRI platforms indicates that the
corresponding sensor is not present and should be treated as unavailable.

Use this check from xe_hwmon_temp_is_visible() callback so that attributes
for unavailable sensors are not exposed during hwmon device registration.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index de3f2aeffc3fb..c15312b0858ca 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c

[ ... ]

> @@ -804,11 +813,25 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long=
 *val)
>  		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, dw=
ord[i]);
>  	}
> =20
> -	for (i =3D TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
> -		average +=3D hwmon->temp.value[i];
> +	for (i =3D TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
> +		if (is_temp_valid(hwmon, hwmon->temp.value[i])) {
> +			average +=3D hwmon->temp.value[i];
> +			count++;
> +		} else {
> +			drm_dbg(&hwmon->xe->drm, "mc temp sensor %d not available, val 0x%x\n=
",
> +				i, hwmon->temp.value[i]);
> +		}
> +	}
> +
> +	if (!count) {
> +		drm_warn(&hwmon->xe->drm, "no memory temp sensors available!\n");

[Severity: Medium]
Will this warning be emitted multiple times during device registration?

Because hwmon subsystem core evaluates the is_visible callback multiple tim=
es
per channel, and the logic in xe_hwmon_temp_is_visible() evaluates=20
get_mc_temp() first, this warning may trigger excessively if the sensor is=
=20
intentionally absent.

> +		return -ENXIO;
> +	}
> +
> +	average /=3D count;
> +	if (val)
> +		*val =3D average * MILLIDEGREE_PER_DEGREE;
> =20
> -	average /=3D (hwmon->temp.count - TEMP_INDEX_MCTRL - 1);
> -	*val =3D average * MILLIDEGREE_PER_DEGREE;
>  	return 0;
>  }

[ ... ]

> @@ -932,11 +961,21 @@ static inline bool is_vram_ch_available(struct xe_h=
wmon *hwmon, int channel)
>  	struct xe_mmio *mmio =3D xe_root_tile_mmio(hwmon->xe);
>  	int vram_id =3D channel - CHANNEL_VRAM_N;
>  	struct xe_reg vram_reg;
> +	u32 reg_val;
> +	u8 temp;
> =20
>  	vram_reg =3D xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
> -	if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
> +	if (!xe_reg_is_valid(vram_reg))
>  		return false;
> =20
> +	reg_val =3D xe_mmio_read32(mmio, vram_reg);
> +	temp =3D REG_FIELD_GET(TEMP_MASK, reg_val);

[Severity: High]
Does this extract the correct bits for the VRAM channel temperature value?

For CHANNEL_VRAM_N, TEMP_MASK extracts bits 7:0, which may represent the
fractional part of the temperature rather than the integer temperature.=20
The integer temperature is typically in bits 31:8 and extracted with
TEMP_MASK_VRAM_N.

If a valid sensor has a temperature with a 0 fractional part (or 0xFF on ne=
wer
platforms), could it be falsely detected as missing and hidden?

> +	if (!is_temp_valid(hwmon, temp)) {
> +		drm_dbg(&hwmon->xe->drm, "vram channel %d unavailable, val 0x%x\n", vr=
am_id,
> +			reg_val);
> +		return false;
> +	}
> +
>  	/* Create label only for available vram channel */
>  	sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
>  	return true;
> @@ -953,8 +992,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 =
attr, int channel)
>  		case CHANNEL_VRAM:
>  			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;

[Severity: Medium]
Will this expose threshold limit attributes for unavailable sensors?

The input attribute for CHANNEL_PKG and CHANNEL_VRAM is now correctly hidden
if the sensor returns an unavailable sentinel. However, hwmon_temp_emergency
and hwmon_temp_crit do not seem to check is_temp_valid() for these channels.
Could this lead to userspace seeing emergency/crit attributes for sensors=20
that don't actually exist?

>  		case CHANNEL_MCTRL:
> +			return !get_mc_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;

[Severity: Medium]
Does this execute a synchronous hardware read before checking hwmon->temp.c=
ount?

Because this uses !get_mc_temp(hwmon, NULL) && hwmon->temp.count,
get_mc_temp() is unconditionally executed first due to left-to-right
evaluation. If temp.count is 0, should the condition short-circuit before
performing the hardware read by placing the temp.count check first?

>  		case CHANNEL_PCIE:
> -			return hwmon->temp.count ? 0444 : 0;
> +			return !get_pcie_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824184137.2164=
727-1-karthik.poosa@intel.com?part=3D1
