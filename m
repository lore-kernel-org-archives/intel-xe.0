Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566E5C98317
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 11:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1027510E0EC;
	Thu, 24 Sep 2026 11:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FPtDpm/p";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227EF10E0EC
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 11:25:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 062BF432C8;
 Thu, 24 Sep 2026 11:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17E51F00893;
 Thu, 24 Sep 2026 11:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790249111;
 bh=4dZ0QCggqmIgQfr7GcmF6ZwwwWzsr5Y1p1l5rxNazEE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=FPtDpm/pm1ObtctkotGF6zNOVYD2wpKWHMSUS6SThtie8dbeCuMdHis+p2szXsvVo
 xWlmZNKnwvWH1SImJHSD3VTSC+iAWgEY4AEg7EfMQOw0G0hciHzcqNuJUfWIHqNZcq
 25Kc+arjr0afeKI6jqnCt3WvT2XjrbKNqFshr4+L8zyyB6gNxGgVjOxRMQQ7iWQJFn
 Yf5wn2wUnmPhAHRipi/lmb/H6rMA/LUQ9kenA7RW5FuJvj8om+j8aU69AOylZ9of/n
 C30J5qoMIneNiMaMGWHlA8nDzrn/lkgLAHUsV9Fj/f5pY43wiRf0OUBRAS68O4Df2v
 J96We2UgT7REg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH i-g-t v4 10/13] drm/xe/hwmon: use CRI-specific package
 and VRAM temperature registers
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260924105000.2627929-11-karthik.poosa@intel.com>
References: <20260924105000.2627929-1-karthik.poosa@intel.com>
 <20260924105000.2627929-11-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 11:25:11 +0000
Message-Id: <20260924112511.B17E51F00893@smtp.kernel.org>
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
- [High] xe_hwmon: VRAM temperature register offset collision on Crescent I=
sland
--

commit fd97330baada16c38f4cebd065bec94e97f517b7
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: use CRI-specific package and VRAM temperature registers

Crescent Island uses different MMIO offsets for package and VRAM temperature
than Battlemage. Add CRI-specific register definitions and select them in
xe_hwmon_get_reg() for REG_TEMP handling.

> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe=
/regs/xe_pcode_regs.h
> index 11916b4f7cfc0..a6f13d7c39894 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
[ ... ]
>  #define CRI_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> -#define CRI_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
>  #define CRI_MSU_VRAM_ENABLE             XE_REG(0x138340)
> +#define CRI_PACKAGE_TEMPERATURE			XE_REG(0x138344)
> +#define CRI_VRAM_TEMPERATURE			XE_REG(0x138348)
> +#define CRI_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
> =20
>  #endif /* _XE_PCODE_REGS_H_ */

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

[Severity: High]
Will using the BMG_VRAM_TEMPERATURE_N() macro for Crescent Island cause
register offset collisions for higher VRAM channels?

The BMG_VRAM_TEMPERATURE_N(n) macro computes offsets as 0x138260 + (n * 4).
When n >=3D 56, the resulting offsets overlap with the newly added CRI
registers:

- n =3D 56 gives 0x138340 (collides with CRI_MSU_VRAM_ENABLE)
- n =3D 57 gives 0x138344 (collides with CRI_PACKAGE_TEMPERATURE)
- n =3D 58 gives 0x138348 (collides with CRI_VRAM_TEMPERATURE)

Since Crescent Island allows up to 80 VRAM channels, reading the sysfs
hwmon tempX_input attributes for channels 56 and above would return
data from these unrelated registers instead of VRAM temperature telemetry.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924105000.2627=
929-1-karthik.poosa@intel.com?part=3D10
