Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB70ACAC592
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 11:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2D210E98B;
	Fri, 19 Sep 2025 11:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pii2R4QE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026FF10E98B
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Sep 2025 11:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758279845; x=1789815845;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=pWKjAIM70Yk9MuWp1ChKH3lCxXISWhDTkhp6xGNviPA=;
 b=Pii2R4QEolUr4yGnjYWG226BxAGrFDCoTBjgj/DMEcPItjzmg+uJSLoR
 iAqOlEfrRO5vDxq4kRnsVoiFxeNQHCgU1obQcgcCZmNAbEBNRTG9seBmg
 xjvwWWoJEbMGTuflSOHNI0TEemM9z3EGdM5rmlu2Zq741EIN1CIpeu6Dh
 JWQ0pucy+AYcL7SVNg7KKZFOi42NSsTa3aMG1ITSDulW7/BYeJvFlM3II
 HInsKNDtwjAggUOLUwAx1240KMR054D0toqjN7lpJoI0ZFEkETNkJNErE
 3RrMcMxx3Ou8lkfDkE84NdT12BCKvlAiidvUADQukl/ECMraUN/L3qc/4 w==;
X-CSE-ConnectionGUID: e9/J08hTShKpGc9OKwRmpw==
X-CSE-MsgGUID: ovqU2NUNTgyKWt5UJ6WXaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="71254419"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="71254419"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 04:04:05 -0700
X-CSE-ConnectionGUID: RFh436A+RZ6d/297UWjFZg==
X-CSE-MsgGUID: ozHKE9NtTzGEqvjHFzxmZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="181081996"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.245.120])
 ([10.245.245.120])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 04:04:04 -0700
Message-ID: <b806599df64b052f54d8da37f03bb66c1375dea6.camel@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe/pm: Add lockdep annotation for the pm_block
 completion
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Date: Fri, 19 Sep 2025 13:04:01 +0200
In-Reply-To: <55ad501d-f73c-4ce1-87d6-8f5d0bd59d41@intel.com>
References: <20250918142848.21807-1-thomas.hellstrom@linux.intel.com>
 <20250918142848.21807-3-thomas.hellstrom@linux.intel.com>
 <55ad501d-f73c-4ce1-87d6-8f5d0bd59d41@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Fri, 2025-09-19 at 12:00 +0100, Matthew Auld wrote:
> On 18/09/2025 15:28, Thomas Hellstr=C3=B6m wrote:
> > Similar to how we annotate dma-fences, add lockep annotation to
> > the pm_block completion to ensure we don't wait for it while
> > holding
> > locks that are needed in the pm notifier or in the device
> > suspend / resume callbacks.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0 drivers/gpu/drm/xe/xe_exec.c |=C2=A0 3 +-
> > =C2=A0 drivers/gpu/drm/xe/xe_pm.c=C2=A0=C2=A0 | 59
> > ++++++++++++++++++++++++++++++++++++
> > =C2=A0 drivers/gpu/drm/xe/xe_pm.h=C2=A0=C2=A0 |=C2=A0 2 ++
> > =C2=A0 drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0 |=C2=A0 2 ++
> > =C2=A0 4 files changed, 65 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > b/drivers/gpu/drm/xe/xe_exec.c
> > index 7715e74bb945..83897950f0da 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -16,6 +16,7 @@
> > =C2=A0 #include "xe_exec_queue.h"
> > =C2=A0 #include "xe_hw_engine_group.h"
> > =C2=A0 #include "xe_macros.h"
> > +#include "xe_pm.h"
> > =C2=A0 #include "xe_ring_ops_types.h"
> > =C2=A0 #include "xe_sched_job.h"
> > =C2=A0 #include "xe_sync.h"
> > @@ -247,7 +248,7 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> > =C2=A0=C2=A0	 * on task freezing during suspend / hibernate, the call
> > will
> > =C2=A0=C2=A0	 * return -ERESTARTSYS and the IOCTL will be rerun.
> > =C2=A0=C2=A0	 */
> > -	err =3D wait_for_completion_interruptible(&xe->pm_block);
> > +	err =3D xe_pm_block_on_suspend(xe);
> > =C2=A0=C2=A0	if (err)
> > =C2=A0=C2=A0		goto err_unlock_list;
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c
> > b/drivers/gpu/drm/xe/xe_pm.c
> > index b1c536b39034..5c561d3c3515 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -82,8 +82,58 @@ static struct lockdep_map
> > xe_pm_runtime_d3cold_map =3D {
> > =C2=A0 static struct lockdep_map xe_pm_runtime_nod3cold_map =3D {
> > =C2=A0=C2=A0	.name =3D "xe_rpm_nod3cold_map"
> > =C2=A0 };
> > +
> > +static struct lockdep_map xe_pm_block_lockdep_map =3D {
> > +	.name =3D "xe_pm_block_map",
> > +};
> > =C2=A0 #endif
> > =C2=A0=20
> > +static void xe_pm_block_begin_signalling(void)
> > +{
> > +	lock_acquire_shared_recursive(&xe_pm_block_lockdep_map, 0,
> > 1, NULL, _RET_IP_);
> > +}
> > +
> > +static void xe_pm_block_end_signalling(void)
> > +{
> > +	lock_release(&xe_pm_block_lockdep_map, _RET_IP_);
> > +}
> > +
> > +/**
> > + * xe_pm_might_block_on_suspend() - Annotate that the code might
> > block on suspend
> > + *
> > + * Annotation to use where the code might block or sieze to make
> > + * progress pending resume completion.
> > + */
> > +void xe_pm_might_block_on_suspend(void)
> > +{
> > +	lock_map_acquire(&xe_pm_block_lockdep_map);
> > +	lock_map_release(&xe_pm_block_lockdep_map);
> > +}
> > +
> > +/**
> > + * xe_pm_might_block_on_suspend() - Block pending suspend.
> > + * @xe: The xe device about to be suspended.
> > + *
> > + * Block if the pm notifier has start evicting bos, to avoid
> > + * racing and validating those bos back. The function is
> > + * annotated to ensure no locks are held that are also grabbed
> > + * in the pm notifier or the device suspend / resume.
> > + * This is intended to be used by freezable tasks only.
> > + * (Not freezable workqueues), with the intention that the
> > function
> > + * returns %-ERESTARTSYS when tasks are frozen during suspend,
> > + * and allows the task to freeze. The caller must be able to
> > + * handle the %-ERESTARTSYS.
> > + *
> > + * Return: %0 on success, %-ERESTARTSYS on signal pending or
> > + * if freezing requested.
> > + */
> > +int xe_pm_block_on_suspend(struct xe_device *xe)
> > +{
> > +	xe_pm_might_block_on_suspend();
> > +
> > +	return wait_for_completion_interruptible(&xe->pm_block);
> > +}
> > +
> > =C2=A0 /**
> > =C2=A0=C2=A0 * xe_rpm_reclaim_safe() - Whether runtime resume can be do=
ne
> > from reclaim context
> > =C2=A0=C2=A0 * @xe: The xe device.
> > @@ -123,6 +173,7 @@ int xe_pm_suspend(struct xe_device *xe)
> > =C2=A0=C2=A0	int err;
> > =C2=A0=20
> > =C2=A0=C2=A0	drm_dbg(&xe->drm, "Suspending device\n");
> > +	xe_pm_block_begin_signalling();
> > =C2=A0=C2=A0	trace_xe_pm_suspend(xe, __builtin_return_address(0));
> > =C2=A0=20
> > =C2=A0=C2=A0	err =3D xe_pxp_pm_suspend(xe->pxp);
> > @@ -152,6 +203,8 @@ int xe_pm_suspend(struct xe_device *xe)
> > =C2=A0=C2=A0	xe_i2c_pm_suspend(xe);
> > =C2=A0=20
> > =C2=A0=C2=A0	drm_dbg(&xe->drm, "Device suspended\n");
> > +	xe_pm_block_end_signalling();
> > +
> > =C2=A0=C2=A0	return 0;
> > =C2=A0=20
> > =C2=A0 err_display:
> > @@ -159,6 +212,7 @@ int xe_pm_suspend(struct xe_device *xe)
> > =C2=A0=C2=A0	xe_pxp_pm_resume(xe->pxp);
> > =C2=A0 err:
> > =C2=A0=C2=A0	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
> > +	xe_pm_block_end_signalling();
> > =C2=A0=C2=A0	return err;
> > =C2=A0 }
> > =C2=A0=20
> > @@ -175,6 +229,7 @@ int xe_pm_resume(struct xe_device *xe)
> > =C2=A0=C2=A0	u8 id;
> > =C2=A0=C2=A0	int err;
> > =C2=A0=20
> > +	xe_pm_block_begin_signalling();
> > =C2=A0=C2=A0	drm_dbg(&xe->drm, "Resuming device\n");
> > =C2=A0=C2=A0	trace_xe_pm_resume(xe, __builtin_return_address(0));
> > =C2=A0=20
> > @@ -217,9 +272,11 @@ int xe_pm_resume(struct xe_device *xe)
> > =C2=A0=C2=A0		xe_sriov_vf_ccs_register_context(xe);
> > =C2=A0=20
> > =C2=A0=C2=A0	drm_dbg(&xe->drm, "Device resumed\n");
> > +	xe_pm_block_end_signalling();
> > =C2=A0=C2=A0	return 0;
> > =C2=A0 err:
> > =C2=A0=C2=A0	drm_dbg(&xe->drm, "Device resume failed %d\n", err);
> > +	xe_pm_block_end_signalling();
> > =C2=A0=C2=A0	return err;
> > =C2=A0 }
> > =C2=A0=20
> > @@ -324,6 +381,7 @@ static int xe_pm_notifier_callback(struct
> > notifier_block *nb,
> > =C2=A0=C2=A0		struct xe_validation_ctx ctx;
> > =C2=A0=20
> > =C2=A0=C2=A0		reinit_completion(&xe->pm_block);
> > +		xe_pm_block_begin_signalling();
> > =C2=A0=C2=A0		xe_pm_runtime_get(xe);
> > =C2=A0=C2=A0		(void)xe_validation_ctx_init(&ctx, &xe->val, NULL,
> > =C2=A0=C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 (struct xe_val_flags)
> > {.exclusive =3D true});
> > @@ -340,6 +398,7 @@ static int xe_pm_notifier_callback(struct
> > notifier_block *nb,
> > =C2=A0=C2=A0		 * avoid a runtime suspend interfering with
> > evicted objects or backup
> > =C2=A0=C2=A0		 * allocations.
> > =C2=A0=C2=A0		 */
> > +		xe_pm_block_end_signalling();
>=20
> I guess ideally this would somehow be extended to the complete_all()=20
> below, but that would then pull in loads of unrelated stuff?

Yes, unfortunately it doesn't cover everything. But AFAICT at least
what we do in the driver.

Thanks for reviewing!
/Thomas


>=20
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>=20
> > =C2=A0=C2=A0		break;
> > =C2=A0=C2=A0	}
> > =C2=A0=C2=A0	case PM_POST_HIBERNATION:
> > diff --git a/drivers/gpu/drm/xe/xe_pm.h
> > b/drivers/gpu/drm/xe/xe_pm.h
> > index 59678b310e55..f7f89a18b6fc 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.h
> > +++ b/drivers/gpu/drm/xe/xe_pm.h
> > @@ -33,6 +33,8 @@ int xe_pm_set_vram_threshold(struct xe_device
> > *xe, u32 threshold);
> > =C2=A0 void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
> > =C2=A0 bool xe_rpm_reclaim_safe(const struct xe_device *xe);
> > =C2=A0 struct task_struct *xe_pm_read_callback_task(struct xe_device
> > *xe);
> > +int xe_pm_block_on_suspend(struct xe_device *xe);
> > +void xe_pm_might_block_on_suspend(void);
> > =C2=A0 int xe_pm_module_init(void);
> > =C2=A0=20
> > =C2=A0 #endif
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index 0cacab20ff85..80b7f13ecd80 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -466,6 +466,8 @@ static void preempt_rebind_work_func(struct
> > work_struct *w)
> > =C2=A0 retry:
> > =C2=A0=C2=A0	if (!try_wait_for_completion(&vm->xe->pm_block) &&
> > vm_suspend_rebind_worker(vm)) {
> > =C2=A0=C2=A0		up_write(&vm->lock);
> > +		/* We don't actually block but don't make
> > progress. */
> > +		xe_pm_might_block_on_suspend();
> > =C2=A0=C2=A0		return;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
>=20

