Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEE6CA6019
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 12:18:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874BF10E53A;
	Fri,  9 Oct 2026 12:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WONcHwZ5";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE72110E53A
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 12:18:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D7C3540344;
 Fri,  9 Oct 2026 12:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903861F000FF;
 Fri,  9 Oct 2026 12:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791548317;
 bh=SDmVtuvEYgFYUxllN97vx5NBO3vSx/LgRTERN+Dlh0Q=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=WONcHwZ5OvR/aopRV57kkp632Z+JYNrSbAL4JMYfRRdfe5+y1Dhd9PxBs6h7sJkeX
 N6VQws+3VTtHprJt0GJmmGWqk771dISnmDzb7nQHZrSa5N1pl3AoNu56+HQaOm2Pd/
 PdedciuB0pKcd9iXstM8ZSwohc5xoH2CJNBNv4LMOIjBuDaOm1V0xetsqKkhiUd1eC
 L0k04jcrbNV3/zUslibg8iumz/IE+Z8BWdKCE+BLwUU8R7VDAqVGraxLO1eZPPasOJ
 i+yNmW0QZojUI0BjYYbAMXp2qN8mXKqLHyJhOgMqAPyJbvEOTel6iFeFzP9dtUfjeu
 sghVzISczSb9A==
Message-ID: <sashiko-outbox-165514@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 10/14] drm/xe/hwmon: Add platform-aware VRAM thermal
 channel support
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261009120335.52973-11-karthik.poosa@intel.com>
References: <20261009120335.52973-1-karthik.poosa@intel.com>
 <20261009120335.52973-11-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 12:18:37 +0000
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
- [Low] hwmon: DRM driver implements hwmon directly instead of as auxiliary=
 device
--

commit 55ff84e7912b9e195885552d6a750a68cc2c19d9
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Add platform-aware VRAM thermal channel support

On CRI, this derives the number of available VRAM temperature channels from
the CRI_MSU_VRAM_ENABLE register. It increases the maximum supported VRAM
channel count to 80 and uses the derived count to control VRAM sensor
enumeration, channel access, and VRAM label allocation.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index bafa175f84578..9d83d9d2286ed 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
[ ... ]
> @@ -1683,7 +1809,9 @@ int xe_hwmon_register(struct xe_device *xe)
>  	hwmon->xe =3D xe;
>  	xe->hwmon =3D hwmon;
> =20
> -	xe_hwmon_get_preregistration_info(hwmon);
> +	ret =3D xe_hwmon_get_preregistration_info(hwmon);
> +	if (ret)
> +		goto err_null_hwmon;
> =20
>  	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
> =20
> @@ -1693,10 +1821,14 @@ int xe_hwmon_register(struct xe_device *xe)
>  								hwmon_groups);

[Severity: Low]
The hwmon subsystem guidelines state that if a chip's main functionality
is not hardware monitoring (such as a DRM controller), its hardware
monitoring functionality should be implemented as an auxiliary device
driver residing in drivers/hwmon/.

Does registering the hardware monitoring device directly from within the=20
drivers/gpu/drm/ subsystem bypass these structural layering rules?

>  	if (IS_ERR(hwmon->hwmon_dev)) {
>  		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_=
dev);
> -		xe->hwmon =3D NULL;
> -		return PTR_ERR(hwmon->hwmon_dev);
> +		ret =3D PTR_ERR(hwmon->hwmon_dev);
> +		goto err_null_hwmon;
>  	}
> =20
>  	return 0;
> +
> +err_null_hwmon:
> +	xe->hwmon =3D NULL;
> +	return ret;
>  }
>  MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009120335.5297=
3-1-karthik.poosa@intel.com?part=3D10
