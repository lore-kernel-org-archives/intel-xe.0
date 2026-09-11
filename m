Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F76C88E50
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 08:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E6B10F56C;
	Fri, 11 Sep 2026 08:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KswuxlPi";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C7210F564;
 Fri, 11 Sep 2026 08:22:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 34728402C2;
 Fri, 11 Sep 2026 08:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F351F000FF;
 Fri, 11 Sep 2026 08:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789114949;
 bh=Ltk8Y7cdHGwFe/BKWVWchUyThJQdTvzMqYqDMjAabs4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=KswuxlPisq8oBz50eg3byfbUavElQ7jLBM0xw0TqQh7OvikgtZkjwrXyzMCs4Pb0k
 Fiw2pDU9lXUNGllvNXNwGP1HsllpNS6f4OeFEMhsPd+PfnjxpQVWTuRl///4lquMI/
 xbKXr39eOqSke2iwB/NhNJr05S1YGWuwKzULmibv0XcntkS9zjTkb7P95zt1KGDNW7
 zf2DBdUrkp+x/0/cKR580yBvxTPnFz8ilh9gR1bIepaRpE9ZqBdgDgMk8vDeciNwpb
 yIPceIOZjlnpZLMGD0rZ7sWSU4he0KF9e9545YRMJawHic45O+8NZdAiiayea8c72D
 V4H7KSGuw+OAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/10] drm/xe/pm: avoid reclaim when arming PME wakeup
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260911080448.778316-4-vinod.govindapillai@intel.com>
References: <20260911080448.778316-1-vinod.govindapillai@intel.com>
 <20260911080448.778316-4-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 08:22:28 +0000
Message-Id: <20260911082228.D4F351F000FF@smtp.kernel.org>
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
- [Medium] Misuse of Memory Allocator API: using memalloc_noreclaim_save() =
improperly grants emergency memory reserves to ACPI methods.
--

commit 7547491908f27fd6d8049619891faf97cc3918e3
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>

drm/xe/pm: avoid reclaim when arming PME wakeup

This commit wraps calls to pci_enable_wake() with memalloc_noreclaim_save()
and memalloc_noreclaim_restore() in xe_pci_runtime_suspend(). The goal is to
avoid deadlocks with the xe_shrinker by preventing allocations from entering
reclaim while holding the runtime PM lock.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 9b486e8ad2b5c..4369f0d9efb1e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1384,10 +1384,13 @@ static int xe_pci_runtime_suspend(struct device *=
dev)
>  {
>  	struct pci_dev *pdev =3D to_pci_dev(dev);
>  	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> +	unsigned int flags;
>  	int err;
> =20
> +	flags =3D memalloc_noreclaim_save();
>  	xe->pme.enabled =3D xe->pme.capable && !xe->d3cold.allowed &&
>  			  pci_enable_wake(pdev, PCI_D3hot, true) =3D=3D 0;
> +	memalloc_noreclaim_restore(flags);

[Severity: Medium]
Could this use of memalloc_noreclaim_save() improperly grant emergency memo=
ry
reserves to ACPI methods?

Using memalloc_noreclaim_save() sets the PF_MEMALLOC flag for the current
task, which grants allocations access to the ALLOC_NO_WATERMARKS emergency
memory reserves. These reserves are strictly intended for tasks that are
actively freeing memory to guarantee forward progress.

Since ACPI methods inside pci_enable_wake() can perform arbitrary evaluation
and allocation, granting them emergency reserves risks depleting these
reserves.

To avoid the deadlock with xe_shrinker without abusing PF_MEMALLOC, would it
be safer to use memalloc_nofs_save() instead?

Stripping __GFP_FS causes can_backup to be false in xe_shrinker_scan(), whi=
ch
makes the shrinker exit early without attempting to acquire the runtime PM
lock.

> =20
>  	/*
>  	 * We hold an additional reference to the runtime PM to keep PF in D0
> @@ -1401,7 +1404,9 @@ static int xe_pci_runtime_suspend(struct device *de=
v)
>  	err =3D xe_pm_runtime_suspend(xe);
>  	if (err) {
>  		if (xe->pme.enabled) {
> +			flags =3D memalloc_noreclaim_save();
>  			pci_enable_wake(pdev, PCI_D3hot, false);
> +			memalloc_noreclaim_restore(flags);

[Severity: Medium]
Does this error path have the same issue with granting emergency memory
reserves to pci_enable_wake() via memalloc_noreclaim_save() as mentioned
above?

>  			xe->pme.enabled =3D false;
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911080448.7783=
16-1-vinod.govindapillai@intel.com?part=3D3
