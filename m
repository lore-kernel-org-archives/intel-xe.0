Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C26C61DC2
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 23:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A93810E364;
	Wed, 26 Aug 2026 23:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bz73C978";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0383610E359;
 Wed, 26 Aug 2026 23:02:01 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E5D8860A63;
 Wed, 26 Aug 2026 23:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FF21F000E9;
 Wed, 26 Aug 2026 23:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787785320;
 bh=NLxXqAxrAJSCbWz6zj0ANh/u/DalxDROvJCCWh7lvjk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=bz73C97861yuVgSrWtQ2vLLCScSm1VRrnLVE64dp5IKIoHfAZ52peR+O+mjF3vyYT
 NMUeUpeMrUVxJdo2hvkAiPSq4IJbW2y+Ir6MN1QWfprXJfc7hv+gx1/IKN0hhZ9Cvx
 KaXuvXhnZyK6hD1huWZNb8DBa3NXlrc6RQjm1EHAaJBqzXz+mCy4AM2DvrBTYFw5Bc
 dVD6lSD+ZjZndd3m5ojKphlw/4HpjEHfBiBkxh3//D4WmYwM0jk21C+oiT/L3fLQ7w
 3C6M44t1y9PiuVajdVh0n3/WOe88yhICF9Jk6aU15NO7eKjwDVXOGtRoZ6XKBxvklo
 Wr1L9noqOCpLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] drm/xe/pm: allow the device to signal PME from D3hot
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260826225338.804902-4-vinod.govindapillai@intel.com>
References: <20260826225338.804902-1-vinod.govindapillai@intel.com>
 <20260826225338.804902-4-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 23:01:59 +0000
Message-Id: <20260826230200.69FF21F000E9@smtp.kernel.org>
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
- [Medium] The variable `err` is used uninitialized in the warning message =
when `pci_enable_wake()` fails, potentially leaking stack memory to the ker=
nel log.
--

commit 49538b2bae6d5a5f0599da227733b24b63d3639b
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>

    drm/xe/pm: allow the device to signal PME from D3hot
   =20
    Make the device a usable wakeup source so it can raise PME while runtime
    suspended to D3hot The PCI core marks endpoints wakeup-capable but leav=
es
    them disabled, so pci_enable_wake() returns -EINVAL until the driver op=
ts
    in using devm_device_init_wakeup(). D3cold is excluded, as the device
    loses power there and cannot signal at all.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 3b3b6426d960c..af59859fd8c96 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
[ ... ]
> @@ -1380,6 +1384,7 @@ static int xe_pci_runtime_suspend(struct device *de=
v)
>  {
>  	struct pci_dev *pdev =3D to_pci_dev(dev);
>  	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> +	bool pme_armed =3D false;
>  	int err;
> =20
>  	/*
> @@ -1391,9 +1396,20 @@ static int xe_pci_runtime_suspend(struct device *d=
ev)
>  	xe_assert(xe, !IS_SRIOV_VF(xe));
>  	xe_assert(xe, !pci_num_vf(pdev));
> =20
> -	err =3D xe_pm_runtime_suspend(xe, false);
> -	if (err)
> +	if (xe_pm_pme_capable(xe)) {
> +		pme_armed =3D !pci_enable_wake(pdev, PCI_D3hot, true);
> +		if (!pme_armed)
> +			drm_warn(&xe->drm,
> +				 "Failed to arm PME for D3hot: %d\n", err);

[Severity: Medium]
Could this leak uninitialized stack memory to the kernel log? It looks like
the variable err is used in the warning message when pci_enable_wake() fails
in xe_pci_runtime_suspend(), but it hasn't been initialized yet. Since the
return value from pci_enable_wake() is inverted into the boolean pme_armed,
the actual error code is never captured in err before printing it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826225338.8049=
02-1-vinod.govindapillai@intel.com?part=3D3
