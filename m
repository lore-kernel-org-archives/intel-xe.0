Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05643C98317
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 11:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FC310E152;
	Thu, 24 Sep 2026 11:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NK7gi701";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D209110E152
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 11:27:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BA4B14109C;
 Thu, 24 Sep 2026 11:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7399E1F00893;
 Thu, 24 Sep 2026 11:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790249275;
 bh=6bQz6RkZJPv7LVa97tFdMPUCZmXNgkd0wxAvIzTsxEA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=NK7gi701gbRk9DksN7BxHjdpOp84J0gTwQp//yWmiN1YZEob5toRclmvqrL9puAaq
 QoD2rvQNcjYdJG/tgyQR40xpXGgyZZYJ1fxpvAXdtOgT+7m3Kd+Ia4kiGLHcqtQTM+
 ZJ/lpPUDl4dn6FZ4phj4NiVHWuHnsDiXWK4fKKkNzqZlaW24CPqV4l+ASPueOQGgiu
 E8X+nh5iWqIX6aJhwC0SvqIUE88i3OjE+3bJkGIXKdM9BFbM1DlYlDHZaVwX9YIHov
 WaBv5ToGztFv4toD6xrZP7XT3t98Y0ph948NjyJh+46+bjLB/giH0Go/y04CxhX2TU
 3jL8a2U8B9BJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/13] drm/xe/hwmon: use CRI-specific package and
 VRAM temperature registers
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260924111156.2628915-11-karthik.poosa@intel.com>
References: <20260924111156.2628915-1-karthik.poosa@intel.com>
 <20260924111156.2628915-11-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 11:27:55 +0000
Message-Id: <20260924112755.7399E1F00893@smtp.kernel.org>
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
- [Medium] drm/xe/hwmon: incorrect BMG register used for CRI per-VRAM chann=
el temperatures
--

commit 8d77f2708804f58e62723e17d986cd5eb1877de7
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: use CRI-specific package and VRAM temperature registers

This commit updates the hardware monitoring register accesses to use
Crescent Island (CRI) specific MMIO offsets for package and VRAM
temperatures, as they differ from Battlemage offsets.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 1b587bd9487e1..e1cff5700e7f9 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -293,7 +293,15 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmo=
n *hwmon, enum xe_hwmon_reg
> =20
>  	switch (hwmon_reg) {
>  	case REG_TEMP:
> -		if (xe->info.platform =3D=3D XE_BATTLEMAGE || xe->info.platform =3D=3D=
 XE_CRESCENTISLAND) {
> +		if (xe->info.platform =3D=3D XE_CRESCENTISLAND) {
> +			if (channel =3D=3D CHANNEL_PKG)
> +				return CRI_PACKAGE_TEMPERATURE;
> +			else if (channel =3D=3D CHANNEL_VRAM)
> +				return CRI_VRAM_TEMPERATURE;
> +			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count) &&
> +				 xe_hwmon_vram_channel_enabled(hwmon, channel - CHANNEL_VRAM_N))
> +				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);

[Severity: Medium]
Does Crescent Island actually use the Battlemage register offset for
per-channel VRAM temperatures?

If a monitoring daemon reads a sysfs temperature attribute corresponding
to a specific VRAM channel (e.g., temp3_input mapping to CHANNEL_VRAM_N)
on a Crescent Island device, xe_hwmon_get_reg() will return the
BMG_VRAM_TEMPERATURE_N macro in the XE_CRESCENTISLAND branch.

The commit message explicitly notes that Crescent Island uses different MMIO
offsets for package and VRAM temperatures. While the aggregate CHANNEL_PKG
and CHANNEL_VRAM cases were updated to use the new CRI_ macros, the
CHANNEL_VRAM_N fallback still uses the BMG_VRAM_TEMPERATURE_N macro.

Will this cause hardware monitoring tools to read incorrect temperature data
for individual VRAM channels on Crescent Island since it accesses the
Battlemage MMIO offset?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924111156.2628=
915-1-karthik.poosa@intel.com?part=3D10
