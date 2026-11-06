Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9B4606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 10:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qq3GxReI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15E610E2E7;
	Fri,  6 Nov 2026 10:32:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B673C10E2E7
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 10:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793961158; x=1825497158;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/SYNgLc8RPGUsHkVzMVi0CGvVU9TQSuoptml9C5Zpio=;
 b=Qq3GxReIs395Hgzs6wn8gJX6k9YRKgadiDyluCdA7h6j/I83NWr5ZPUC
 qmqg7GqlKn6TwhQjw6yIa1+1nK6x1YHjxI1pyKShLpN22MIVDkVTd0uSW
 mIYOQ8ZScdQb05i5ZxUFDFDt/rrQO2cV65ZIhWIYFJ+3doG5VSDNOOXDi
 yHaBcRavRyM72fr9jCtPnRtsRzavUvWgLhSuO+7easRBYcMsQfDZ62fT5
 L4m68xSr4OSzwb4BlZUpuVlWyvrtm7dK5l5yX0eUsHDOVzdxDqk89MLKY
 u0lPKt3tj80r3/BPMIB1uDDbvhVgDEfUAweHH7dmBwdxu0GXzYAatW2ci A==;
X-CSE-ConnectionGUID: dAlFsLgqRXmmQTRb3fgmWQ==
X-CSE-MsgGUID: NQHPTV2ERDaU/9L+aBpBWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2649438"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2649438"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 02:32:38 -0800
X-CSE-ConnectionGUID: jzDmMBqkRXGewRa3UToFlQ==
X-CSE-MsgGUID: Zz/YS7b0R6WbSTbSwptHFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7584721"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.245.125])
 ([10.245.245.125])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 02:32:37 -0800
Message-ID: <b34f93a9f8901f787b030f275d7708f4334b4360.camel@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe/pm: skip BO eviction on iGPU for
 non-hibernation sleep
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Carlos Santa
 <carlos.santa@intel.com>
Date: Fri, 06 Nov 2026 11:32:34 +0100
In-Reply-To: <20261106-s4-opti-v1-2-5edaea2c6d31@intel.com>
References: <20261106-s4-opti-v1-0-5edaea2c6d31@intel.com>
 <20261106-s4-opti-v1-2-5edaea2c6d31@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, Matthew,

On Fri, 2026-11-06 at 10:16 +0000, Matthew Auld wrote:
> On iGPU platforms, system RAM and graphics stolen memory remain
> powered
> during S2idle and S3 (< S4) suspend, so evicting user buffers or
> preparing pinned BOs is unnecessary and needlessly purges DONTNEED
> buffers in userspace caches.
>=20
> Distinguish S4 hibernation (.freeze and PM_HIBERNATION_PREPARE) from
> < S4 suspend (.suspend and PM_SUSPEND_PREPARE), and skip BO eviction
> on
> iGPU when not creating a hibernation image.

Isn't there a risk that compression metadata is lost or cleared on S3
resume if we don't back it up?

Thanks,
Thomas


>=20
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Carlos Santa <carlos.santa@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_pci.c | 21 ++++++++++++++++++---
> =C2=A0drivers/gpu/drm/xe/xe_pm.c=C2=A0 | 26 ++++++++++++++++++++------
> =C2=A0drivers/gpu/drm/xe/xe_pm.h=C2=A0 |=C2=A0 2 +-
> =C2=A03 files changed, 39 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pci.c
> b/drivers/gpu/drm/xe/xe_pci.c
> index ba23ec60477b..67be6e707361 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1335,7 +1335,7 @@ static void d3cold_toggle(struct pci_dev *pdev,
> enum toggle_d3cold toggle)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> -static int xe_pci_suspend(struct device *dev)
> +static int __xe_pci_suspend(struct device *dev, bool hibernate)
> =C2=A0{
> =C2=A0	struct pci_dev *pdev =3D to_pci_dev(dev);
> =C2=A0	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> @@ -1344,7 +1344,7 @@ static int xe_pci_suspend(struct device *dev)
> =C2=A0	if (xe_survivability_mode_is_boot_enabled(xe))
> =C2=A0		return -EBUSY;
> =C2=A0
> -	err =3D xe_pm_suspend(xe);
> +	err =3D xe_pm_suspend(xe, hibernate);
> =C2=A0	if (err)
> =C2=A0		return err;
> =C2=A0
> @@ -1362,6 +1362,16 @@ static int xe_pci_suspend(struct device *dev)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static int xe_pci_suspend(struct device *dev)
> +{
> +	return __xe_pci_suspend(dev, false);
> +}
> +
> +static int xe_pci_freeze(struct device *dev)
> +{
> +	return __xe_pci_suspend(dev, true);
> +}
> +
> =C2=A0static int xe_pci_resume(struct device *dev)
> =C2=A0{
> =C2=A0	struct pci_dev *pdev =3D to_pci_dev(dev);
> @@ -1491,7 +1501,12 @@ static int xe_pci_runtime_idle(struct device
> *dev)
> =C2=A0}
> =C2=A0
> =C2=A0static const struct dev_pm_ops xe_pm_ops =3D {
> -	SET_SYSTEM_SLEEP_PM_OPS(xe_pci_suspend, xe_pci_resume)
> +	.suspend =3D pm_sleep_ptr(xe_pci_suspend),
> +	.resume =3D pm_sleep_ptr(xe_pci_resume),
> +	.freeze =3D pm_sleep_ptr(xe_pci_freeze),
> +	.thaw =3D pm_sleep_ptr(xe_pci_resume),
> +	.poweroff =3D pm_sleep_ptr(xe_pci_suspend),
> +	.restore =3D pm_sleep_ptr(xe_pci_resume),
> =C2=A0	SET_RUNTIME_PM_OPS(xe_pci_runtime_suspend,
> xe_pci_runtime_resume, xe_pci_runtime_idle)
> =C2=A0};
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 61d68c09189f..e73192b03074 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -166,13 +166,19 @@ static void xe_rpm_lockmap_release(const struct
> xe_device *xe)
> =C2=A0			 &xe_pm_runtime_d3cold_map);
> =C2=A0}
> =C2=A0
> +static bool xe_pm_needs_bo_evict(struct xe_device *xe, bool
> hibernate)
> +{
> +	return IS_DGFX(xe) || hibernate;
> +}
> +
> =C2=A0/**
> - * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0-
> >S2idle
> + * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0-
> >S2idle / S0->S4
> =C2=A0 * @xe: xe device instance
> + * @hibernate: true if preparing for S4 hibernation, false for < S4
> suspend
> =C2=A0 *
> =C2=A0 * Return: 0 on success
> =C2=A0 */
> -int xe_pm_suspend(struct xe_device *xe)
> +int xe_pm_suspend(struct xe_device *xe, bool hibernate)
> =C2=A0{
> =C2=A0	struct xe_gt *gt;
> =C2=A0	u8 id;
> @@ -193,10 +199,12 @@ int xe_pm_suspend(struct xe_device *xe)
> =C2=A0
> =C2=A0	xe_display_pm_suspend(xe);
> =C2=A0
> -	/* FIXME: Super racey... */
> -	err =3D xe_bo_evict_all(xe);
> -	if (err)
> -		goto err_display;
> +	if (xe_pm_needs_bo_evict(xe, hibernate)) {
> +		/* FIXME: Super racey... */
> +		err =3D xe_bo_evict_all(xe);
> +		if (err)
> +			goto err_display;
> +	}
> =C2=A0
> =C2=A0	for_each_gt(gt, xe, id) {
> =C2=A0		err =3D xe_gt_suspend(gt);
> @@ -461,6 +469,9 @@ static int xe_pm_notifier_callback(struct
> notifier_block *nb,
> =C2=A0		struct xe_validation_ctx ctx;
> =C2=A0
> =C2=A0		reinit_completion(&xe->pm_block);
> +		if (!xe_pm_needs_bo_evict(xe, action =3D=3D
> PM_HIBERNATION_PREPARE))
> +			break;
> +
> =C2=A0		xe_pm_block_begin_signalling();
> =C2=A0		xe_pm_runtime_get(xe);
> =C2=A0		(void)xe_validation_ctx_init(&ctx, &xe->val, NULL,
> @@ -485,6 +496,9 @@ static int xe_pm_notifier_callback(struct
> notifier_block *nb,
> =C2=A0	case PM_POST_SUSPEND:
> =C2=A0		complete_all(&xe->pm_block);
> =C2=A0		xe_pm_wake_rebind_workers(xe);
> +		if (!xe_pm_needs_bo_evict(xe, action =3D=3D
> PM_POST_HIBERNATION))
> +			break;
> +
> =C2=A0		xe_bo_notifier_unprepare_all_pinned(xe);
> =C2=A0		xe_pm_runtime_put(xe);
> =C2=A0		break;
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 16d4e6c629f1..af81f2a2975f 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -13,7 +13,7 @@
> =C2=A0
> =C2=A0struct xe_device;
> =C2=A0
> -int xe_pm_suspend(struct xe_device *xe);
> +int xe_pm_suspend(struct xe_device *xe, bool hibernate);
> =C2=A0int xe_pm_resume(struct xe_device *xe);
> =C2=A0
> =C2=A0int xe_pm_init_early(struct xe_device *xe);
