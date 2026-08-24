Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE950C5DF9D
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 18:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA5B10E0F5;
	Mon, 24 Aug 2026 18:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WvQQ6F6K";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F56810E0F5
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 18:58:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 67E3743936;
 Mon, 24 Aug 2026 18:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF881F000E9;
 Mon, 24 Aug 2026 18:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787597907;
 bh=6/cS08/Fo3Vb+GfGZ4rQFc0HJSmBIhCgOsmvO8e8fds=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=WvQQ6F6K416Eug3OJLs/cQ0sKNXV4psfbYnsG4joq27ZRCMB7lUWOToEx7guwn5uE
 qOePtfj1tL1kIBurLwZ7uSOokKIL1BBMtQ64lQP92yne9AvbDbn1p7lpirQISBmr4S
 7mxnECkruJEwS4FwDvq9tGZ07P1wOf2coS54dM7Cwm6t2uCnNKPoZfLB2QyPfQJaRo
 on1zNa9EOa5XlNPgnVGXl372YKDh3jRLL9OXcgJS5mG/0/gJia6PCo5CD8I0qc8KxA
 /uK+NbjXyTny6OYjGAmOEqr9D34I3EaTVYMFxQDMbPD+/bje9MRUKmBsx50s7S35dI
 sM9minc3AVSdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] drm/xe/hwmon: Detect unavailable temperature sensors
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260824184137.2164727-6-karthik.poosa@intel.com>
References: <20260824184137.2164727-1-karthik.poosa@intel.com>
 <20260824184137.2164727-6-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 18:58:26 +0000
Message-Id: <20260824185827.2BF881F000E9@smtp.kernel.org>
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
- [High] Incorrect bitmask in `is_vram_ch_available()` evaluates the wrong =
bits, improperly hiding valid VRAM sensors.
- [Medium] Incorrect short-circuit logic in `is_visible` causes uncondition=
al hardware polling, leading to permanently hidden attributes on transient =
errors and excessive `drm_warn` log spam.
--

--- Patch [1]: [PATCH 1/3] drm/xe/hwmon: Detect unavailable temperature sen=
sors ---
commit 0fa4d58443299c1d66e99a6115caeb31a5bd8c21
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
> +	if (!is_temp_valid(hwmon, temp)) {

[Severity: High]
Does this code extract the correct bits for CHANNEL_VRAM_N?

For CHANNEL_VRAM_N, the hardware register stores the temperature in bits 30=
:8
(TEMP_MASK_VRAM_N). However, is_vram_ch_available() extracts the value using
TEMP_MASK (bits 7:0).

By evaluating unrelated bits against the sentinel value (0 or 0xFF), can th=
is
cause valid VRAM sensors to be improperly hidden if the lower bits happen to
match the sentinel?

> +		drm_dbg(&hwmon->xe->drm, "vram channel %d unavailable, val 0x%x\n", vr=
am_id,
> +			reg_val);
> +		return false;
> +	}
> +
>  	/* Create label only for available vram channel */
>  	sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
>  	return true;

[ ... ]

> @@ -953,8 +992,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 =
attr, int channel)
>  		case CHANNEL_VRAM:
>  			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
>  		case CHANNEL_MCTRL:
> +			return !get_mc_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
>  		case CHANNEL_PCIE:
> -			return hwmon->temp.count ? 0444 : 0;
> +			return !get_pcie_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;

[Severity: Medium]
Does this reversed short-circuit logic cause unconditional hardware polling=
 and
log spam?

Since !get_mc_temp() and !get_pcie_temp() are evaluated before checking
hwmon->temp.count, they will trigger PCODE reads even when the count is 0.

Furthermore, xe_hwmon_temp_is_visible() executes up to 5 times per channel
during hwmon registration. If a sensor is legitimately missing, the new
drm_warn() statements in get_mc_temp() and get_pcie_temp() will repeatedly
spam the kernel log with warnings for expected missing hardware.

Could this early polling also cause valid attributes to be permanently hidd=
en
if a transient PCODE timeout occurs during registration?

>  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>  			return (is_vram_ch_available(hwmon, channel) &&
>  				hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]) ? 0444 : 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824184137.2164=
727-1-karthik.poosa@intel.com?part=3D1
