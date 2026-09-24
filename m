Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC03FC9830E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 11:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E0F10E4BA;
	Thu, 24 Sep 2026 11:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PCeBnmOo";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7105110E4BA
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 11:22:38 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 71A166020C;
 Thu, 24 Sep 2026 11:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FEC1F000FF;
 Thu, 24 Sep 2026 11:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790248957;
 bh=1tDtXDv2dIeOGjsbzMeOQSOV1JDLJQ21eFAGQJlEPfE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=PCeBnmOodEMYpJZfoLcGopsKaGicoFEFE32cqzaQFB/uO258wGLyoN+I+ipLUXRVg
 rUu5BKHqhwsYFxKZ1QK8T6b3uYQ38dE++p73NgEFWyBjcDQrBoQjHTxQBlt5/YmQyW
 D9D2GCiEBMIsBKcg9odBuOnLPswI5G3D7jQ+4io2QS5pN02+etZu3EnaXZyB3HnntP
 byxCjOg8rLCXyQkn7rIrDdoHi+2AuNnJnnDRN97r2wtniJshckOrW2fCmpx0pG3+Wl
 KdLfmvIg+7O8LChnBATmJehw3rrfks5BUg22jGJAYgOz+bsPMjPVXOSeoPX2fwxg3f
 DpoSMqSmOH+nw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH i-g-t v4 11/13] drm/xe/hwmon: Decode CRI temperature
 registers as IEEE-754
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260924105000.2627929-12-karthik.poosa@intel.com>
References: <20260924105000.2627929-1-karthik.poosa@intel.com>
 <20260924105000.2627929-12-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 11:22:36 +0000
Message-Id: <20260924112236.F1FEC1F000FF@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] hwmon: Incorrect IEEE-754 decoding applied to CHANNEL_VRAM_N
--

commit 4017413f8095f651034d897f32ec30cb3740f4f1
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Decode CRI temperature registers as IEEE-754

This commit decodes the package and VRAM temperature registers for Crescent
Island platforms as IEEE-754 floating-point values instead of the previous
fixed-point formats. It implements integer-based decoding to be exposed thr=
ough
hwmon.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index e1cff5700e7f9..c411cd375aa1b 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
[ ... ]
> @@ -1249,26 +1312,27 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 at=
tr, int channel, long *val)
>  	switch (attr) {
>  	case hwmon_temp_input:
>  		switch (channel) {
[ ... ]
> +		case CHANNEL_PKG:
> +		case CHANNEL_VRAM:
>  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>  			reg_val =3D xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, ch=
annel));
> -			/*
> -			 * This temperature format is 24 bit [31:8] signed integer and 8 bit
> -			 * [7:0] fraction.
> -			 */
> -			*val =3D (s32)(REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val)) *
> -				(REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
> -				 MILLIDEGREE_PER_DEGREE;
> +			if (hwmon->xe->info.platform >=3D XE_CRESCENTISLAND) {
> +				return xe_hwmon_temperature_decode((u32)reg_val, val);

[Severity: Medium]
Will this incorrectly apply IEEE-754 decoding to CHANNEL_VRAM_N registers on
Crescent Island?

Looking at xe_hwmon_get_reg(), when the platform is XE_CRESCENTISLAND,
CHANNEL_VRAM_N still maps to the legacy BMG_VRAM_TEMPERATURE_N:

drivers/gpu/drm/xe/xe_hwmon.c:xe_hwmon_get_reg() {
	...
	case REG_TEMP:
		if (xe->info.platform =3D=3D XE_CRESCENTISLAND) {
			if (channel =3D=3D CHANNEL_PKG)
				return CRI_PACKAGE_TEMPERATURE;
			else if (channel =3D=3D CHANNEL_VRAM)
				return CRI_VRAM_TEMPERATURE;
			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count) &&
				 xe_hwmon_vram_channel_enabled(hwmon, channel - CHANNEL_VRAM_N))
				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
	...
}

Since BMG_VRAM_TEMPERATURE_N uses a 24.8 fixed-point format, decoding it as
IEEE-754 will cause the exponent bits to evaluate to 0 for most normal
temperatures. This could result in the function returning 0 degrees instead=
 of
the correct value.

Should CHANNEL_VRAM_N bypass the IEEE-754 decoding even on Crescent Island?

> +			} else if (channel >=3D CHANNEL_VRAM_N) {
> +				/*
> +				 * This temperature format is 24 bit [31:8] signed integer and 8 bit
> +				 * [7:0] fraction for platforms before CRI.
> +				 */
> +				*val =3D (s32)REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val) *
> +					(REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
> +					MILLIDEGREE_PER_DEGREE;
> +			} else {
> +				*val =3D REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> +			}
>  			return 0;
>  		default:
>  			return -EOPNOTSUPP;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924105000.2627=
929-1-karthik.poosa@intel.com?part=3D11
