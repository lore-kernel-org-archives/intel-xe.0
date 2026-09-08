Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A052C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEF710EB1F;
	Tue,  8 Sep 2026 10:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jr+TKdDH";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037E410EB1F
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:28:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C261E40DB4;
 Tue,  8 Sep 2026 10:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851771F00A3A;
 Tue,  8 Sep 2026 10:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788863329;
 bh=UrUQcIJdHCiYKANRhi/rTz2q0a4CVWvqGwgufLBC3/w=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Jr+TKdDHOui76wuMi5I5u9ttjaAY1GNic4qbda75IgRHaKMNeIa0Oa9NqtZT0c/Ff
 ypPhDW7U1Fn7t3Af3VGlThZ2t/vxG94q3BzPvwPoCXdeujAw8SP1ePgV5nztr4sEeO
 fGMJt2xj6R7KPv6mls1coL301vgR33abxy/uH7rtcsrUbGfBjIkBLcJpjGM68r1j9R
 DBchnLawf6dzOwP9ZLHPkEWSXc7lA3aVJR9OF8bOW9jNxGqSHRzhL1pzkvt32FpaYi
 LxKOpDiLt7d9ta741mKcTNhI6qIg00m7FuZ5RD8brvdtmgKfycMtlnYlIHaFgqXwnv
 fqsmg0TEHnKGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/13] drm/xe/pci: Report unknown GMDID versions
 using structured xe_log API
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260908101849.1219614-11-dnyaneshwar.bhadane@intel.com>
References: <20260908101849.1219614-1-dnyaneshwar.bhadane@intel.com>
 <20260908101849.1219614-11-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 10:28:49 +0000
Message-Id: <20260908102849.851771F00A3A@smtp.kernel.org>
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
- [Medium] The patch uses the 'REGS' component tag instead of the 'GT' tag =
claimed in the commit message.
--

commit 5fd6d40222829ad569de8cdf73c334a89531ce68
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

drm/xe/pci: Report unknown GMDID versions using structured xe_log API

This commit updates the GMDID handling code to replace drm_err() with the
structured xe_log_err() function when hardware reports unrecognized graphics
or media IP versions.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -718,8 +718,9 @@ static int handle_gmdid(struct xe_device *xe,
> =20
>  	*graphics_ip =3D find_graphics_ip(ver);
>  	if (!*graphics_ip) {
> -		drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n=
",
> -			ver / 100, ver % 100);
> +		xe_log_err(xe, REGS, -EINVAL,
> +			   "Hardware reports unknown graphics version %u.%02u\n",
> +			   ver / 100, ver % 100);

[Severity: Medium]
The commit message states this replaces drm_err() with xe_log_err() "using
the GT component tag". However, handle_gmdid() uses the REGS tag here.
Should this use the GT tag as described in the commit message, or is REGS
the intended tag for this log?

>  	}
> =20
>  	ret =3D read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
> @@ -732,8 +733,9 @@ static int handle_gmdid(struct xe_device *xe,
> =20
>  	*media_ip =3D find_media_ip(ver);
>  	if (!*media_ip) {
> -		drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
> -			ver / 100, ver % 100);
> +		xe_log_err(xe, REGS, -EINVAL,
> +			   "Hardware reports unknown media version %u.%02u\n",
> +			   ver / 100, ver % 100);

[Severity: Medium]
Similarly, this uses the REGS tag for the unknown media version error. Does
this also need to be updated to use the GT tag to match the commit
description?

>  	}
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908101849.1219=
614-1-dnyaneshwar.bhadane@intel.com?part=3D10
