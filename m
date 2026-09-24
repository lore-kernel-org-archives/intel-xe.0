Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0803FC9830E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 11:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B66110E152;
	Thu, 24 Sep 2026 11:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ftHfhfLt";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3784210E152
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 11:27:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id F3D814109C;
 Thu, 24 Sep 2026 11:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC9F1F000FF;
 Thu, 24 Sep 2026 11:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790249254;
 bh=gLmLTGupKZrn1HgoHfzlMSge5asRTvH6cE12Cw1fGCA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ftHfhfLtDv+YmqDl7vvYllpUANkZptATkHtdsdauWtLfCA36hMUEpJabROsRZ5t3B
 i2NvuIlk8I3pyojXqGToYamz4MPtIO9GBmmUZuQjA1VuFqdFPWtHW10334pFhhYEoR
 HgzFsOq8jLAxabrW/QefB0AtmQ/ENnI6qXT6Kf7W8ea4WxRQHCZ2uI4BcPDpJW448/
 PBd5Y740sc4evU0d8PjOG5iUnHFOMEEsgk4bFHsnwqT3ybonmGoBHkLI2gGLENOj7h
 p6WRPs6nCkjTPb8wVYvq8XE7aE3LJgmI+Nvzi/wNviwmlc8ylxhOaV82N8CB3Nvoh4
 abHqUUs7TcLtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 11/13] drm/xe/hwmon: Decode CRI temperature registers
 as IEEE-754
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260924111156.2628915-12-karthik.poosa@intel.com>
References: <20260924111156.2628915-1-karthik.poosa@intel.com>
 <20260924111156.2628915-12-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 11:27:34 +0000
Message-Id: <20260924112734.ACC9F1F000FF@smtp.kernel.org>
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
- [Medium] hwmon: xe: incorrect IEEE-754 decoding applied to VRAM_N on Cres=
cent Island
--

commit 8039331718fb03f6dfcbe8bbe7a3375383a0c5d2
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Decode CRI temperature registers as IEEE-754

This commit decodes the package and VRAM temperatures on Crescent Island
from an IEEE-754 floating-point format to integer millidegrees.

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
> -		case CHANNEL_PKG:
> -		case CHANNEL_VRAM:
> -			reg_val =3D xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, ch=
annel));
> -
> -			/* HW register value is in degrees Celsius, convert to millidegrees. =
*/
> -			*val =3D REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> -			return 0;
>  		case CHANNEL_MCTRL:
>  			return get_mc_temp(hwmon, val);
>  		case CHANNEL_PCIE:
>  			return get_pcie_temp(hwmon, val);
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
Will this indiscriminately apply IEEE-754 decoding to all VRAM channels on
Crescent Island, including CHANNEL_VRAM_N?

Looking at xe_hwmon_get_reg(), VRAM_N on XE_CRESCENTISLAND still uses
the legacy BMG_VRAM_TEMPERATURE_N registers:

	case REG_TEMP:
		if (xe->info.platform =3D=3D XE_CRESCENTISLAND) {
			if (channel =3D=3D CHANNEL_PKG)
				...
			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count) &&
				 xe_hwmon_vram_channel_enabled(hwmon, channel - CHANNEL_VRAM_N))
				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);

Since BMG_VRAM_TEMPERATURE_N registers encode temperatures in a 24.8
fixed-point format, parsing them as IEEE-754 floating-point values will
result in incorrectly reporting sensor values when reading tempN_input via
sysfs.

Could this condition be narrowed to exclude CHANNEL_VRAM_N?

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924111156.2628=
915-1-karthik.poosa@intel.com?part=3D11
