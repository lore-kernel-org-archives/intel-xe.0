Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE5BC624D3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 18:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEFC10F331;
	Wed,  2 Sep 2026 18:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TyQ1OzB+";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E988D10F323
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 18:07:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B84D7600D1;
 Wed,  2 Sep 2026 18:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508DD1F000E9;
 Wed,  2 Sep 2026 18:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788372435;
 bh=wEBX7JPbwxToRUhbou2giY1AqjUwwSHUE2vuKD47Vjw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=TyQ1OzB+gEhs1esT0D1VwRbmAjH09QVOhqpwoHJsr9u71chUk0y0kkc7IJ29Dx7E9
 OuIE9+L8Q7Zt7AMbbaJrWDyabQj2wGMBRn7T7vsuduQGxH/XV72+C8t+ffqtjo+PaV
 D1gFQXo98kQdHer1CTjgPgyfbzRDPRZgz/bQtQk7qtDT2gxSmIWzqhMofcnIPstGA8
 2CYRz5Y2BhzNGF/rpSb5TgqnAgxy1VKJnMRkYxj/TO4wZSJs+V6+ASi/BowZX7CdrU
 c6+y3z1/9WBDVJ3d1Bv8FzxUIkka07Idk5RwxbkMDEpZW9b+kiAAsreB2yOUDwmZCD
 Ftpa4jwslO+9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] drm/xe/hwmon: Disable memory controller and PCIe
 temperatures on CRI
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260902175507.3910573-6-karthik.poosa@intel.com>
References: <20260902175507.3910573-1-karthik.poosa@intel.com>
 <20260902175507.3910573-6-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 18:07:14 +0000
Message-Id: <20260902180715.508DD1F000E9@smtp.kernel.org>
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
- [Medium] The patch uses an enum ordering check that inadvertently disable=
s memory controller and PCIe temperatures on Nova Lake P, splitting the Nov=
alake platform family.
--

commit 91ec5832293666790affd1f3a6202739f54f4e49
Author: Karthik Poosa <karthik.poosa@intel.com>

    drm/xe/hwmon: Disable memory controller and PCIe temperatures on CRI

    Temporarily disable memory controller and PCIe temperature reporting on
    CRI platforms. The definitions and interpretation of these temperature
    sources are not yet sufficiently clear, which may result in inaccurate
    reporting.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index c2b8d4c79783a..5b2cef292ffcc 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -1061,8 +1061,14 @@ static bool is_temp_available(struct xe_hwmon *hwm=
on, int channel)
> =20
>  		return true;
>  	case CHANNEL_MCTRL:
> +		if (hwmon->xe->info.platform >=3D XE_CRESCENTISLAND)
> +			return false;
> +
>  		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
>  	case CHANNEL_PCIE:
> +		if (hwmon->xe->info.platform >=3D XE_CRESCENTISLAND)
> +			return false;
> +

[Severity: Medium]
Does this check inadvertently affect Nova Lake P?

Looking at the enum definition in xe_platform_types.h, XE_NOVALAKE_P is
defined after XE_CRESCENTISLAND, while XE_NOVALAKE_S is defined before it:

	XE_NOVALAKE_S,
	XE_CRESCENTISLAND,
	XE_NOVALAKE_P,

Using the >=3D operator will disable memory controller and PCIe temperature=
s on
Nova Lake P, while they remain enabled for Nova Lake S. This seems to
contradict the commit message which states this disables temperatures on CRI
platforms.

Should these checks use =3D=3D XE_CRESCENTISLAND instead to avoid splitting=
 the
Novalake family?

>  		return hwmon->temp.count && !get_pcie_temp(hwmon, NULL);
>  	default:
>  		return false;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902175507.3910=
573-1-karthik.poosa@intel.com?part=3D5
