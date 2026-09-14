Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E39C88E73
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 20:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B24710F1F0;
	Mon, 14 Sep 2026 20:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VO/Sgpo4";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B626F10F1EE;
 Mon, 14 Sep 2026 20:01:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9CDF641E7B;
 Mon, 14 Sep 2026 20:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5631F000FF;
 Mon, 14 Sep 2026 20:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789416077;
 bh=hb/uy5Pp1DtIIUdxtnNGB3BochM9+Jmdbo3k7rMc7R4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=VO/Sgpo4Fpmby7Xtzy0awEePNd5nl5bl1XdpoVjga1jmS0k1i2QMoS75pBLKspzPt
 7CSF8yxogpDl1I5kQ2DR/zXriWz0jeM8yRThqYQajNYXpF0/lPs7NkjVA337FsGH8V
 0lpXJ68XUePlirmxq+3uLmvnBGqHWhZY8o86NIktLUd3RqceDrpHi1u0yXixAAMJ2R
 WOy28Cwa9t/hNhCpyfV74vECUPP62R3qWOayYwbSTEzTL2O/bkhHeVxi40FCz/nY2Y
 XcyHETwep+VKd4j5hEM55aCT5D0K7S+4XivUpC+CHtzx1ljCsjNpe/uyHI2YgaCVEp
 WYxWGWyKGcNhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/7] drm/xe/pm: introduce PM PME support
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260914194737.272679-3-vinod.govindapillai@intel.com>
References: <20260914194737.272679-1-vinod.govindapillai@intel.com>
 <20260914194737.272679-3-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 20:01:16 +0000
Message-Id: <20260914200117.4A5631F000FF@smtp.kernel.org>
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
- [Medium] Failed runtime suspend leaves PCI PME wake enabled because the s=
oftware flag is prematurely cleared before the hardware cleanup check.
--

commit 31cf117b704a2fc5858594d67a6c704b16fd2e7b
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>

drm/xe/pm: introduce PM PME support

This commit introduces PME support for capable devices to avoid relying on
HPD polling. It assesses PME capabilities during PCI probe and enables them
for specific contexts during the PM runtime suspend call.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 32e10e1a26eff..ef5fefdd09e4d 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
[ ... ]
> @@ -1380,8 +1386,14 @@ static int xe_pci_runtime_suspend(struct device *d=
ev)
>  	xe_assert(xe, !pci_num_vf(pdev));
> =20
>  	err =3D xe_pm_runtime_suspend(xe);
> -	if (err)
> +	if (err) {
> +		if (xe_pm_pme_enabled(xe)) {

[Severity: Medium]
Since xe_pm_runtime_suspend() already clears the software flag in its=20
failure path, will this check always evaluate to false?

If the flag is cleared early by the callee, it appears=20
pci_enable_wake(pdev, PCI_D3hot, false) is skipped. Could this leave the=20
PCI device with PME wake enabled while in D0 after a failed runtime suspend=
,=20
potentially causing spurious PME interrupts?

> +			pci_enable_wake(pdev, PCI_D3hot, false);
> +			xe_pm_update_pme_enabled(xe, false);
> +		}
> +
>  		return err;
> +	}
> =20
>  	pci_save_state(pdev);
[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index a5289a9df8d25..6453adbc3410d 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
[ ... ]
> @@ -650,6 +663,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	return 0;
> =20
>  out_resume:
> +	xe_pm_update_pme_enabled(xe, false);

[Severity: Medium]
Does clearing the PME enabled flag here inadvertently defeat the hardware=20
cleanup logic in the xe_pci_runtime_suspend() caller?

>  	xe_display_pm_runtime_resume(xe);
>  	xe_pxp_pm_resume(xe->pxp);
>  out:
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914194737.2726=
79-1-vinod.govindapillai@intel.com?part=3D2
