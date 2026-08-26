Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F30C61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 14:11:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F300A10E136;
	Wed, 26 Aug 2026 14:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b0ZS5fOg";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C2410E136
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 14:11:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 57778438C6;
 Wed, 26 Aug 2026 14:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6C41F000E9;
 Wed, 26 Aug 2026 14:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787753462;
 bh=bu/r/xzEA6ciZdHx+/h2+oAcGgx3nnPcrawAVii2iYM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=b0ZS5fOgiHfGtIKj2g/DFj/aFitPmH2pQPONKdcC5juBgrPHwYPVSYMVJ9UxFns3N
 fvVKwgghQZp5xTSOHX/udtXRIy0z+lhxFwQbMXHM08qEFwl+hNoaTLQmDk+NqIOrIT
 V1ORBSvhXLQ32IIo/58HgvKTjJ2zoPKa3AVlToxnbPgmOZJYZTh9xoTMCOIZcuV/Ms
 13gZgRVNa6CXTX/T5YNxo6UBqyOVl+1T9G5KwXSESD7oJtD7Nlh2hHiSs7WllclTsn
 mz2iLKdWBOQjM5th0QZiKudQVkTEi7QkGit1ThrF2+wM0N/NMFLhHJNszLituBVjFF
 nZ1Wv+ZmqUxdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V18 10/14] drm/xe/ras: Cache bad_page_reservation policy
 at init
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260826135136.204044-26-tejas.upadhyay@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-26-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 14:11:01 +0000
Message-Id: <20260826141102.0E6C41F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The commit message claims caching happens in xe_drm_ras_init(), =
but it is actually implemented in xe_ras_init().

Pre-existing issues:
- [High] Ignored return value from `xe_drm_ras_init()` leads to potential N=
ULL pointer dereference on error paths.
--

commit 5b627dce853b33e2e2e98dd02e3de8fcd0a8ae35
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe/ras: Cache bad_page_reservation policy at init

This commit caches the configfs bad_page_reservation attribute during driver
initialization to prevent repeated configfs lookups on every fault.

> drm/xe/ras: Cache bad_page_reservation policy at init
>=20
> The configfs bad_page_reservation attribute can only be set before
> device bind, so its value is immutable at runtime. Cache it in
> struct xe_drm_ras during xe_drm_ras_init() to avoid repeated configfs
> lookups on every fault.

[Severity: Medium]
The commit message states that caching happens "during xe_drm_ras_init()", =
but
the patch actually implements the configfs lookup and caching in xe_ras_ini=
t()
instead. Should the commit message be updated to reflect the correct functi=
on?

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index d25d25f775310..c7e86ae0e8adb 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> @@ -804,6 +805,10 @@ void xe_ras_init(struct xe_device *xe)
>  {
>  	int ret;
> =20
> +	if (xe->info.platform =3D=3D XE_CRESCENTISLAND)
> +		xe->ras.bad_page_reservation =3D
> +			xe_configfs_get_bad_page_reservation(to_pci_dev(xe->drm.dev));
> +
>  	xe_drm_ras_init(xe);

[Severity: High]
This isn't a bug introduced by this patch, but the return value of
xe_drm_ras_init() is completely ignored here.=20

If xe_drm_ras_init() fails (e.g., if drmm_kcalloc() returns NULL),
xe->ras.node remains NULL. Because the error is ignored, device initializat=
ion
continues and DRM RAS is considered enabled (has_drm_ras remains true).

Later, if a hardware error triggers xe_drm_ras_event(), the code calculates:

    node =3D &ras->node[severity];

If severity > 0, this results in a non-NULL but invalid pointer (computed a=
s a
small offset from NULL). drm_ras_nl_error_event() receives this pointer, its
!node check passes, and it dereferences node->id, causing a kernel panic.

Should we check the return value of xe_drm_ras_init() and handle the failur=
e?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826135136.2040=
44-16-tejas.upadhyay@intel.com?part=3D10
