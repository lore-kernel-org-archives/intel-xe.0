Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84471C36010
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 15:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D41310EBED;
	Fri, 11 Apr 2025 15:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T16TZpVj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D444B10EBED
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Apr 2025 15:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744383938; x=1775919938;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=ep3vYU6upx6uHzpjI8HxxOCBALEkL+9/mTPk379FklQ=;
 b=T16TZpVjgaxCVrGlnGdWzINFhZq69naC2aEyejq0C+u9buLFzvo6garq
 /mTrZX27vkJ9R7g4ipN77JH5Z10eX43k6O9xRSuwDO6vB1Lsd8QwUl3Cj
 05DcI7dAFznHIyL5zvs8l9Ds0/Wgwhv4jz/moj1QDqwkaeilRFT+6Aait
 B+sk8AXPPgh0iZ3dJOnq/2Z8mnJeV3Da97HTn1SmMHWQ5RJKdWi7l3zSs
 1uweW8ptKoywcEioNSIbz6J3w7msDxTE7dAcjTv3Lm0JIw59Zea3g5jiR
 3b41iQbQkCRq4hX/hNDJfoya6TafnE7baF8JnRTasmFTyLtFcnWqPmgQR Q==;
X-CSE-ConnectionGUID: DCIUIk61SZqNv1J/RQdv4g==
X-CSE-MsgGUID: oGf495L3SfyPFp9BiPp/kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="63483604"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="63483604"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 08:05:38 -0700
X-CSE-ConnectionGUID: C2ha6LsRTZerZbXkX+/cDw==
X-CSE-MsgGUID: 2MLCmxJMTO246I9wyTIXXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="134325245"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.82])
 ([10.245.246.82])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 08:05:36 -0700
Message-ID: <d4bf28a70130675fd82e98e794b37ce6c45e0385.camel@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/xe: evict user memory in PM notifier
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Date: Fri, 11 Apr 2025 17:05:22 +0200
In-Reply-To: <20250410162016.158474-6-matthew.auld@intel.com>
References: <20250410162016.158474-5-matthew.auld@intel.com>
 <20250410162016.158474-6-matthew.auld@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 2025-04-10 at 17:20 +0100, Matthew Auld wrote:
> In the case of VRAM we might need to allocate large amounts of
> GFP_KERNEL memory on suspend, however doing that directly in the
> driver
> .suspend()/.prepare() callback is not advisable (no swap for
> example).
>=20
> To improve on this we can instead hook up to the PM notifier
> framework
> which is invoked at an earlier stage. We effectively call the evict
> routine twice, where the notifier will have hopefully have cleared
> out
> most if not everything by the time we call it a second time when
> entering the .suspend() callback. For s4 we also get the added
> benefit
> of allocating the system pages before the hibernation image size is
> calculated, which looks more sensible.

> Note that the .suspend() hook is still responsible for dealing with
> all
> the pinned memory. Improving that is left to another patch.
>=20
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1181
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4288
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4566
> Suggested-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo_evict.c=C2=A0=C2=A0=C2=A0=C2=A0 | 45 +++++=
+++++++++++-------
> =C2=A0drivers/gpu/drm/xe/xe_bo_evict.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 =
+
> =C2=A0drivers/gpu/drm/xe/xe_device_types.h |=C2=A0 3 ++
> =C2=A0drivers/gpu/drm/xe/xe_pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/xe/xe_pm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 55 ++++++++++++++++++++++++--
> --
> =C2=A0drivers/gpu/drm/xe/xe_pm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A06 files changed, 84 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c
> b/drivers/gpu/drm/xe/xe_bo_evict.c
> index 2bf74eb7f281..748360fd2439 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -47,25 +47,17 @@ static int xe_bo_apply_to_pinned(struct xe_device
> *xe,
> =C2=A0}
> =C2=A0
> =C2=A0/**
> - * xe_bo_evict_all - evict all BOs from VRAM
> - *
> + * xe_bo_evict_all_user - evict all non-pinned user BOs from VRAM
> =C2=A0 * @xe: xe device
> =C2=A0 *
> - * Evict non-pinned user BOs first (via GPU), evict pinned external
> BOs next
> - * (via GPU), wait for evictions, and finally evict pinned kernel
> BOs via CPU.
> - * All eviction magic done via TTM calls.
> + * Evict non-pinned user BOs (via GPU).
> =C2=A0 *
> =C2=A0 * Evict =3D=3D move VRAM BOs to temporary (typically system) memor=
y.
> - *
> - * This function should be called before the device goes into a
> suspend state
> - * where the VRAM loses power.
> =C2=A0 */
> -int xe_bo_evict_all(struct xe_device *xe)
> +int xe_bo_evict_all_user(struct xe_device *xe)
> =C2=A0{
> =C2=A0	struct ttm_device *bdev =3D &xe->ttm;
> -	struct xe_tile *tile;
> =C2=A0	u32 mem_type;
> -	u8 id;
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	/* User memory */
> @@ -91,9 +83,34 @@ int xe_bo_evict_all(struct xe_device *xe)
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	ret =3D xe_bo_apply_to_pinned(xe, &xe->pinned.late.external,
> -				=C2=A0=C2=A0=C2=A0 &xe->pinned.late.external,
> -				=C2=A0=C2=A0=C2=A0 xe_bo_evict_pinned);
> +	return 0;
> +}
> +
> +/**
> + * xe_bo_evict_all - evict all BOs from VRAM
> + * @xe: xe device
> + *
> + * Evict non-pinned user BOs first (via GPU), evict pinned external
> BOs next
> + * (via GPU), wait for evictions, and finally evict pinned kernel
> BOs via CPU.
> + * All eviction magic done via TTM calls.
> + *
> + * Evict =3D=3D move VRAM BOs to temporary (typically system) memory.
> + *
> + * This function should be called before the device goes into a
> suspend state
> + * where the VRAM loses power.
> + */
> +int xe_bo_evict_all(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	u8 id;
> +	int ret;
> +
> +	ret =3D xe_bo_evict_all_user(xe);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D xe_bo_apply_to_pinned(xe, &xe-
> >pinned.late.kernel_bo_present,
> +				=C2=A0=C2=A0=C2=A0 &xe->pinned.late.evicted,
> xe_bo_evict_pinned);
> =C2=A0
> =C2=A0	if (!ret)
> =C2=A0		ret =3D xe_bo_apply_to_pinned(xe, &xe-
> >pinned.late.kernel_bo_present,
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h
> b/drivers/gpu/drm/xe/xe_bo_evict.h
> index d63eb3fc5cc9..e7f048634b32 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.h
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.h
> @@ -9,6 +9,7 @@
> =C2=A0struct xe_device;
> =C2=A0
> =C2=A0int xe_bo_evict_all(struct xe_device *xe);
> +int xe_bo_evict_all_user(struct xe_device *xe);
> =C2=A0int xe_bo_restore_early(struct xe_device *xe);
> =C2=A0int xe_bo_restore_late(struct xe_device *xe);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 0369fc09c9da..495bc00ebed4 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -522,6 +522,9 @@ struct xe_device {
> =C2=A0		struct mutex lock;
> =C2=A0	} d3cold;
> =C2=A0
> +	/** @pm_notifier: Our PM notifier to perform actions in
> response to various PM events. */
> +	struct notifier_block pm_notifier;
> +
> =C2=A0	/** @pmt: Support the PMT driver callback interface */
> =C2=A0	struct {
> =C2=A0		/** @pmt.lock: protect access for telemetry data */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c
> b/drivers/gpu/drm/xe/xe_pci.c
> index 4fe7e0d941a9..a4caa6222b6f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -747,7 +747,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
> =C2=A0		return;
> =C2=A0
> =C2=A0	xe_device_remove(xe);
> -	xe_pm_runtime_fini(xe);
> +	xe_pm_fini(xe);
> =C2=A0}
> =C2=A0
> =C2=A0/*
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index aaba2a97bb3a..e7ea4003dbf8 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -282,6 +282,29 @@ static u32 vram_threshold_value(struct xe_device
> *xe)
> =C2=A0	return DEFAULT_VRAM_THRESHOLD;
> =C2=A0}
> =C2=A0
> +static int xe_pm_notifier_callback(struct notifier_block *nb,
> +				=C2=A0=C2=A0 unsigned long action, void *data)
> +{
> +	struct xe_device *xe =3D container_of(nb, struct xe_device,
> pm_notifier);
> +	int err =3D 0;
> +
> +	switch (action) {
> +	case PM_HIBERNATION_PREPARE:
> +	case PM_SUSPEND_PREPARE:
> +		xe_pm_runtime_get(xe);
> +		err =3D xe_bo_evict_all_user(xe);
> +		xe_pm_runtime_put(xe);
> +		if (err)
> +			drm_dbg(&xe->drm, "Notifier evict user
> failed (%d)\n", err);
> +		break;
> +	}
> +
> +	if (err)
> +		return NOTIFY_BAD;
> +
> +	return NOTIFY_DONE;
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_pm_init - Initialize Xe Power Management
> =C2=A0 * @xe: xe device instance
> @@ -295,6 +318,11 @@ int xe_pm_init(struct xe_device *xe)
> =C2=A0	u32 vram_threshold;
> =C2=A0	int err;
> =C2=A0
> +	xe->pm_notifier.notifier_call =3D xe_pm_notifier_callback;
> +	err =3D register_pm_notifier(&xe->pm_notifier);
> +	if (err)
> +		return err;
> +
> =C2=A0	/* For now suspend/resume is only allowed with GuC */
> =C2=A0	if (!xe_device_uc_enabled(xe))
> =C2=A0		return 0;
> @@ -304,24 +332,23 @@ int xe_pm_init(struct xe_device *xe)
> =C2=A0	if (xe->d3cold.capable) {
> =C2=A0		err =3D xe_device_sysfs_init(xe);
> =C2=A0		if (err)
> -			return err;
> +			goto err_unregister;
> =C2=A0
> =C2=A0		vram_threshold =3D vram_threshold_value(xe);
> =C2=A0		err =3D xe_pm_set_vram_threshold(xe, vram_threshold);
> =C2=A0		if (err)
> -			return err;
> +			goto err_unregister;
> =C2=A0	}
> =C2=A0
> =C2=A0	xe_pm_runtime_init(xe);
> -
> =C2=A0	return 0;
> +
> +err_unregister:
> +	unregister_pm_notifier(&xe->pm_notifier);
> +	return err;
> =C2=A0}
> =C2=A0
> -/**
> - * xe_pm_runtime_fini - Finalize Runtime PM
> - * @xe: xe device instance
> - */
> -void xe_pm_runtime_fini(struct xe_device *xe)
> +static void xe_pm_runtime_fini(struct xe_device *xe)
> =C2=A0{
> =C2=A0	struct device *dev =3D xe->drm.dev;
> =C2=A0
> @@ -329,6 +356,18 @@ void xe_pm_runtime_fini(struct xe_device *xe)
> =C2=A0	pm_runtime_forbid(dev);
> =C2=A0}
> =C2=A0
> +/**
> + * xe_pm_fini - Finalize PM
> + * @xe: xe device instance
> + */
> +void xe_pm_fini(struct xe_device *xe)
> +{
> +	if (xe_device_uc_enabled(xe))
> +		xe_pm_runtime_fini(xe);
> +
> +	unregister_pm_notifier(&xe->pm_notifier);
> +}
> +
> =C2=A0static void xe_pm_write_callback_task(struct xe_device *xe,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct task_struct *task)
> =C2=A0{
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 998d1ed64556..59678b310e55 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -17,7 +17,7 @@ int xe_pm_resume(struct xe_device *xe);
> =C2=A0
> =C2=A0int xe_pm_init_early(struct xe_device *xe);
> =C2=A0int xe_pm_init(struct xe_device *xe);
> -void xe_pm_runtime_fini(struct xe_device *xe);
> +void xe_pm_fini(struct xe_device *xe);
> =C2=A0bool xe_pm_runtime_suspended(struct xe_device *xe);
> =C2=A0int xe_pm_runtime_suspend(struct xe_device *xe);
> =C2=A0int xe_pm_runtime_resume(struct xe_device *xe);

