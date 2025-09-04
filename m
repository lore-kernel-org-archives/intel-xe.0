Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1C9CA1012
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 06:30:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6603610E977;
	Thu,  4 Sep 2025 06:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gCbUroqz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE79910E977
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 06:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756967457; x=1788503457;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6aKT2cHEj2FoSfK1ZRYZuV/XTmdDEP0wmjcUogw367Y=;
 b=gCbUroqzW6ywE20Bvio00E/xNAd80r+01wfHiLzJcTLC03m4w0nHqKer
 0wj9nK1JhX7ItkPGXOcPdKMYi7oBQtkCUHAg+xaEgrOgP7mJ3vnfiMRQN
 gpWHako1Z0EewF6NofKBfk48A3SZgz6MBbMtjdSLx7ZGT3XIwXV6h72ED
 H1VfZZjKqdKtH+BgYh/zcDBPfKxA2Iv/pwCjiBVF1W2RVRfogVx0HNXXX
 6FsohrHe7MuENeT4Zlx9w9t/R5/+FWD4hfTY/TNedF0Wpa2P9rF0+GuIP
 myCcrG/eRhodnt6PuaBcTi9qY0hCTr16lF5nMHF+wbVR+oiqO2CsnR3aD A==;
X-CSE-ConnectionGUID: 8GWgMNldQJu9gz6zPm2iew==
X-CSE-MsgGUID: uB46qnOmSsamQ8xvbESkqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59248678"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59248678"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 23:30:57 -0700
X-CSE-ConnectionGUID: 3LxRSqxNRIeAwIJ3LY+lHg==
X-CSE-MsgGUID: epm9uW5OQaSLgn1XaI0Xlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="202646466"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.98])
 ([10.245.244.98])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 23:30:55 -0700
Message-ID: <8911b08a5fda63ab174a73fbf6869cf4c2a0b172.camel@linux.intel.com>
Subject: Re: [PATCH v4 06/13] drm/xe: Convert the CPU fault handler for
 exhaustive eviction
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Date: Thu, 04 Sep 2025 08:30:48 +0200
In-Reply-To: <aLiBx5vkRAidvyRp@lstrano-desk.jf.intel.com>
References: <20250902124021.70211-1-thomas.hellstrom@linux.intel.com>
 <20250902124021.70211-7-thomas.hellstrom@linux.intel.com>
 <aLiBx5vkRAidvyRp@lstrano-desk.jf.intel.com>
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

On Wed, 2025-09-03 at 10:58 -0700, Matthew Brost wrote:
> On Tue, Sep 02, 2025 at 02:40:14PM +0200, Thomas Hellstr=C3=B6m wrote:
> > The CPU fault handler may populate bos and migrate, and in doing
> > so might interfere with other tasks validating.
> >=20
> > Rework the CPU fault handler completely into a fastpath
> > and a slowpath. The fastpath trylocks only the validation lock
> > in read-mode. If that fails, there's a fallback to the
> > slowpath, where we do a full validation transaction.
> >=20
> > This mandates open-coding of bo locking, bo idling and
> > bo populating, but we still call into TTM for fault
> > finalizing.
> >=20
> > v2:
> > - Rework the CPU fault handler to actually take part in
> > =C2=A0 the exhaustive eviction scheme (Matthew Brost).
> > v3:
> > - Don't return anything but VM_FAULT_RETRY if we've dropped the
> > =C2=A0 mmap_lock. Not even if a signal is pending.
> > - Rebase on gpu_madvise() and split out fault migration.
> > - Wait for idle after migration.
> > - Check whether the resource manager uses tts to determine
> > =C2=A0 whether to map the tt or iomem.
> > - Add a number of asserts.
> > - Allow passing a ttm_operation_ctx to xe_bo_migrate() so that
> > =C2=A0 it's possible to try non-blocking migration.
> > - Don't fall through to TTM on migration / population error
> > =C2=A0 Instead remove the gfp_retry_mayfail in mode 2 where we
> > =C2=A0 must succeed. (Matthew Brost)
> >=20
>=20
> This version doesn't appear to have the checks around
> TTM_TT_FLAG_EXTERNAL / TTM_TT_FLAG_EXTERNAL_MAPPABLE mentioned here
> [1].
>=20
> Was not not including these intentional or an oversight?

Yes, Indeed. I had a version with these but realized they'd be better
off in mmap than in fault. But anyway, I'll keep them in the fault
hadler for a v5.

Thanks,
Thomas


>=20
> Matt
>=20
> [1]
> https://patchwork.freedesktop.org/patch/670282/?series=3D152882&rev=3D2#c=
omment_1229753
>=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/display/xe_fb_pin.c |=C2=A0=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 240 ++++++++++++++++++++-
> > ----
> > =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > =C2=A0drivers/gpu/drm/xe/xe_dma_buf.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> > =C2=A0drivers/gpu/drm/xe/xe_gt_pagefault.c=C2=A0=C2=A0 |=C2=A0=C2=A0 2 =
+-
> > =C2=A0drivers/gpu/drm/xe/xe_validation.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 3 +-
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A07 files changed, 205 insertions(+), 52 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > index 4b0748e6fdd6..d7a8448a43dc 100644
> > --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > @@ -314,7 +314,7 @@ static struct i915_vma *__xe_pin_fb_vma(const
> > struct intel_framebuffer *fb,
> > =C2=A0		goto err;
> > =C2=A0
> > =C2=A0	if (IS_DGFX(xe))
> > -		ret =3D xe_bo_migrate(bo, XE_PL_VRAM0, exec);
> > +		ret =3D xe_bo_migrate(bo, XE_PL_VRAM0, NULL, exec);
> > =C2=A0	else
> > =C2=A0		ret =3D xe_bo_validate(bo, NULL, true, exec);
> > =C2=A0	if (!ret)
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index d417d6c7f526..c3151f3874da 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1725,68 +1725,213 @@ static bool should_migrate_to_smem(struct
> > xe_bo *bo)
> > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->attr.atomic_access =3D=
=3D DRM_XE_ATOMIC_CPU;
> > =C2=A0}
> > =C2=A0
> > -static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
> > +/* Populate the bo if swapped out, or migrate if the access mode
> > requires that. */
> > +static int xe_bo_fault_migrate(struct xe_bo *bo, struct
> > ttm_operation_ctx *ctx,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_exec *exec)
> > +{
> > +	struct ttm_buffer_object *tbo =3D &bo->ttm;
> > +	int err =3D 0;
> > +
> > +	if (ttm_manager_type(tbo->bdev, tbo->resource->mem_type)-
> > >use_tt) {
> > +		xe_assert(xe_bo_device(bo),
> > +			=C2=A0 dma_resv_test_signaled(tbo->base.resv,
> > DMA_RESV_USAGE_KERNEL) ||
> > +			=C2=A0 (tbo->ttm && ttm_tt_is_populated(tbo-
> > >ttm)));
> > +		err =3D ttm_bo_populate(&bo->ttm, ctx);
> > +	} else if (should_migrate_to_smem(bo)) {
> > +		xe_assert(xe_bo_device(bo), bo->flags &
> > XE_BO_FLAG_SYSTEM);
> > +		err =3D xe_bo_migrate(bo, XE_PL_TT, ctx, exec);
> > +	}
> > +
> > +	return err;
> > +}
> > +
> > +/* Call into TTM to populate PTEs, and register bo for PTE removal
> > on runtime suspend. */
> > +static vm_fault_t __xe_bo_cpu_fault(struct vm_fault *vmf, struct
> > xe_device *xe, struct xe_bo *bo)
> > +{
> > +	vm_fault_t ret;
> > +
> > +	trace_xe_bo_cpu_fault(bo);
> > +
> > +	ret =3D ttm_bo_vm_fault_reserved(vmf, vmf->vma-
> > >vm_page_prot,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TTM_BO_VM_NUM_PREFAULT);
> > +	/*
> > +	 * When TTM is actually called to insert PTEs, ensure no
> > blocking conditions
> > +	 * remain, in which case TTM may drop locks and return
> > VM_FAULT_RETRY.
> > +	 */
> > +	xe_assert(xe, ret !=3D VM_FAULT_RETRY);
> > +
> > +	if (ret =3D=3D VM_FAULT_NOPAGE &&
> > +	=C2=A0=C2=A0=C2=A0 mem_type_is_vram(bo->ttm.resource->mem_type)) {
> > +		mutex_lock(&xe->mem_access.vram_userfault.lock);
> > +		if (list_empty(&bo->vram_userfault_link))
> > +			list_add(&bo->vram_userfault_link,
> > +				 &xe-
> > >mem_access.vram_userfault.list);
> > +		mutex_unlock(&xe->mem_access.vram_userfault.lock);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static vm_fault_t xe_err_to_fault_t(int err)
> > +{
> > +	switch (err) {
> > +	case 0:
> > +	case -EINTR:
> > +	case -ERESTARTSYS:
> > +	case -EAGAIN:
> > +		return VM_FAULT_NOPAGE;
> > +	case -ENOMEM:
> > +	case -ENOSPC:
> > +		return VM_FAULT_OOM;
> > +	default:
> > +		break;
> > +	}
> > +	return VM_FAULT_SIGBUS;
> > +}
> > +
> > +static vm_fault_t xe_bo_cpu_fault_fastpath(struct vm_fault *vmf,
> > struct xe_device *xe,
> > +					=C2=A0=C2=A0 struct xe_bo *bo, bool
> > needs_rpm)
> > +{
> > +	struct ttm_buffer_object *tbo =3D &bo->ttm;
> > +	vm_fault_t ret =3D VM_FAULT_RETRY;
> > +	struct xe_validation_ctx ctx;
> > +	struct ttm_operation_ctx tctx =3D {
> > +		.interruptible =3D true,
> > +		.no_wait_gpu =3D true,
> > +		.gfp_retry_mayfail =3D true,
> > +
> > +	};
> > +	int err;
> > +
> > +	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
> > +		return VM_FAULT_RETRY;
> > +
> > +	err =3D xe_validation_ctx_init(&ctx, &xe->val, NULL,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 (struct xe_val_flags) {
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 .interruptible =3D
> > true,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 .no_block =3D true
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 });
> > +	if (err)
> > +		goto out_pm;
> > +
> > +	if (!dma_resv_trylock(tbo->base.resv))
> > +		goto out_validation;
> > +
> > +	err =3D xe_bo_fault_migrate(bo, &tctx, NULL);
> > +	if (err) {
> > +		/* Return VM_FAULT_RETRY on these errors. */
> > +		if (err !=3D -ENOMEM && err !=3D -ENOSPC && err !=3D -
> > EBUSY)
> > +			ret =3D xe_err_to_fault_t(err);
> > +		goto out_unlock;
> > +	}
> > +
> > +	if (dma_resv_test_signaled(bo->ttm.base.resv,
> > DMA_RESV_USAGE_KERNEL))
> > +		ret =3D __xe_bo_cpu_fault(vmf, xe, bo);
> > +
> > +out_unlock:
> > +	dma_resv_unlock(tbo->base.resv);
> > +out_validation:
> > +	xe_validation_ctx_fini(&ctx);
> > +out_pm:
> > +	if (needs_rpm)
> > +		xe_pm_runtime_put(xe);
> > +
> > +	return ret;
> > +}
> > +
> > +static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
> > =C2=A0{
> > =C2=A0	struct ttm_buffer_object *tbo =3D vmf->vma->vm_private_data;
> > =C2=A0	struct drm_device *ddev =3D tbo->base.dev;
> > =C2=A0	struct xe_device *xe =3D to_xe_device(ddev);
> > =C2=A0	struct xe_bo *bo =3D ttm_to_xe_bo(tbo);
> > =C2=A0	bool needs_rpm =3D bo->flags & XE_BO_FLAG_VRAM_MASK;
> > -	struct drm_exec *exec;
> > +	bool retry_after_wait =3D false;
> > +	struct xe_validation_ctx ctx;
> > +	struct drm_exec exec;
> > =C2=A0	vm_fault_t ret;
> > -	int idx, r =3D 0;
> > +	int err =3D 0;
> > +	int idx;
> > =C2=A0
> > -	if (needs_rpm)
> > -		xe_pm_runtime_get(xe);
> > +	if (!drm_dev_enter(&xe->drm, &idx))
> > +		return ttm_bo_vm_dummy_page(vmf, vmf->vma-
> > >vm_page_prot);
> > =C2=A0
> > -	exec =3D XE_VALIDATION_UNIMPLEMENTED;
> > -	ret =3D ttm_bo_vm_reserve(tbo, vmf);
> > -	if (ret)
> > +	ret =3D xe_bo_cpu_fault_fastpath(vmf, xe, bo, needs_rpm);
> > +	if (ret !=3D VM_FAULT_RETRY)
> > =C2=A0		goto out;
> > =C2=A0
> > -	if (drm_dev_enter(ddev, &idx)) {
> > -		trace_xe_bo_cpu_fault(bo);
> > +	if (fault_flag_allow_retry_first(vmf->flags)) {
> > +		if (vmf->flags & FAULT_FLAG_RETRY_NOWAIT)
> > +			goto out;
> > +		retry_after_wait =3D true;
> > +		xe_bo_get(bo);
> > +		mmap_read_unlock(vmf->vma->vm_mm);
> > +	} else {
> > +		ret =3D VM_FAULT_NOPAGE;
> > +	}
> > =C2=A0
> > -		xe_validation_assert_exec(xe, exec, &tbo->base);
> > -		if (should_migrate_to_smem(bo)) {
> > -			xe_assert(xe, bo->flags &
> > XE_BO_FLAG_SYSTEM);
> > +	/*
> > +	 * The fastpath failed and we were not required to return
> > and retry immediately.
> > +	 * We're now running in one of two modes:
> > +	 *
> > +	 * 1) retry_after_wait =3D=3D true: The mmap_read_lock() is
> > dropped, and we're trying
> > +	 * to resolve blocking waits. But we can't resolve the
> > fault since the
> > +	 * mmap_read_lock() is dropped. After retrying the fault,
> > the aim is that the fastpath
> > +	 * should succeed. But it may fail since we drop the bo
> > lock.
> > +	 *
> > +	 * 2) retry_after_wait =3D=3D false: The fastpath failed,
> > typically even after
> > +	 * a retry. Do whatever's necessary to resolve the fault.
> > +	 *
> > +	 * This construct is recommended to avoid excessive waits
> > under the mmap_lock.
> > +	 */
> > =C2=A0
> > -			r =3D xe_bo_migrate(bo, XE_PL_TT, exec);
> > -			if (r =3D=3D -EBUSY || r =3D=3D -ERESTARTSYS || r
> > =3D=3D -EINTR)
> > -				ret =3D VM_FAULT_NOPAGE;
> > -			else if (r)
> > -				ret =3D VM_FAULT_SIGBUS;
> > -		}
> > -		if (!ret)
> > -			ret =3D ttm_bo_vm_fault_reserved(vmf,
> > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmf->vma-
> > >vm_page_prot,
> > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > TTM_BO_VM_NUM_PREFAULT);
> > -		drm_dev_exit(idx);
> > +	if (needs_rpm)
> > +		xe_pm_runtime_get(xe);
> > =C2=A0
> > -		if (ret =3D=3D VM_FAULT_RETRY &&
> > -		=C2=A0=C2=A0=C2=A0 !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> > -			goto out;
> > +	xe_validation_guard(&ctx, &xe->val, &exec, (struct
> > xe_val_flags) {.interruptible =3D true},
> > +			=C2=A0=C2=A0=C2=A0 err) {
> > +		struct ttm_operation_ctx tctx =3D {
> > +			.interruptible =3D true,
> > +			.no_wait_gpu =3D false,
> > +			.gfp_retry_mayfail =3D retry_after_wait,
> > +		};
> > +		long lerr;
> > =C2=A0
> > -		/*
> > -		 * ttm_bo_vm_reserve() already has dma_resv_lock.
> > -		 */
> > -		if (ret =3D=3D VM_FAULT_NOPAGE &&
> > -		=C2=A0=C2=A0=C2=A0 mem_type_is_vram(tbo->resource->mem_type)) {
> > -			mutex_lock(&xe-
> > >mem_access.vram_userfault.lock);
> > -			if (list_empty(&bo->vram_userfault_link))
> > -				list_add(&bo->vram_userfault_link,
> > -					 &xe-
> > >mem_access.vram_userfault.list);
> > -			mutex_unlock(&xe-
> > >mem_access.vram_userfault.lock);
> > +		err =3D drm_exec_lock_obj(&exec, &tbo->base);
> > +		drm_exec_retry_on_contention(&exec);
> > +		if (err)
> > +			break;
> > +
> > +		err =3D xe_bo_fault_migrate(bo, &tctx, &exec);
> > +		if (err) {
> > +			drm_exec_retry_on_contention(&exec);
> > +			xe_validation_retry_on_oom(&ctx, &err);
> > +			break;
> > =C2=A0		}
> > -	} else {
> > -		ret =3D ttm_bo_vm_dummy_page(vmf, vmf->vma-
> > >vm_page_prot);
> > +
> > +		lerr =3D dma_resv_wait_timeout(tbo->base.resv,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0
> > DMA_RESV_USAGE_KERNEL, true,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0
> > MAX_SCHEDULE_TIMEOUT);
> > +		if (lerr < 0) {
> > +			err =3D lerr;
> > +			break;
> > +		}
> > +
> > +		if (!retry_after_wait)
> > +			ret =3D __xe_bo_cpu_fault(vmf, xe, bo);
> > =C2=A0	}
> > +	/* if retry_after_wait =3D=3D true, we *must* return
> > VM_FAULT_RETRY. */
> > +	if (err && !retry_after_wait)
> > +		ret =3D xe_err_to_fault_t(err);
> > =C2=A0
> > -	dma_resv_unlock(tbo->base.resv);
> > -out:
> > =C2=A0	if (needs_rpm)
> > =C2=A0		xe_pm_runtime_put(xe);
> > =C2=A0
> > +	if (retry_after_wait)
> > +		xe_bo_put(bo);
> > +out:
> > +	drm_dev_exit(idx);
> > +
> > =C2=A0	return ret;
> > =C2=A0}
> > =C2=A0
> > @@ -1830,7 +1975,7 @@ int xe_bo_read(struct xe_bo *bo, u64 offset,
> > void *dst, int size)
> > =C2=A0}
> > =C2=A0
> > =C2=A0static const struct vm_operations_struct xe_gem_vm_ops =3D {
> > -	.fault =3D xe_gem_fault,
> > +	.fault =3D xe_bo_cpu_fault,
> > =C2=A0	.open =3D ttm_bo_vm_open,
> > =C2=A0	.close =3D ttm_bo_vm_close,
> > =C2=A0	.access =3D xe_bo_vm_access,
> > @@ -3060,6 +3205,8 @@ static void xe_place_from_ttm_type(u32
> > mem_type, struct ttm_place *place)
> > =C2=A0 * xe_bo_migrate - Migrate an object to the desired region id
> > =C2=A0 * @bo: The buffer object to migrate.
> > =C2=A0 * @mem_type: The TTM region type to migrate to.
> > + * @tctx: A pointer to a struct ttm_operation_ctx or NULL if
> > + * a default interruptibe ctx is to be used.
> > =C2=A0 * @exec: The drm_exec transaction to use for exhaustive eviction=
.
> > =C2=A0 *
> > =C2=A0 * Attempt to migrate the buffer object to the desired memory
> > region. The
> > @@ -3072,7 +3219,8 @@ static void xe_place_from_ttm_type(u32
> > mem_type, struct ttm_place *place)
> > =C2=A0 * Return: 0 on success. Negative error code on failure. In
> > particular may
> > =C2=A0 * return -EINTR or -ERESTARTSYS if signal pending.
> > =C2=A0 */
> > -int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec
> > *exec)
> > +int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct
> > ttm_operation_ctx *tctx,
> > +		=C2=A0 struct drm_exec *exec)
> > =C2=A0{
> > =C2=A0	struct xe_device *xe =3D ttm_to_xe_device(bo->ttm.bdev);
> > =C2=A0	struct ttm_operation_ctx ctx =3D {
> > @@ -3084,6 +3232,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32
> > mem_type, struct drm_exec *exec)
> > =C2=A0	struct ttm_place requested;
> > =C2=A0
> > =C2=A0	xe_bo_assert_held(bo);
> > +	tctx =3D tctx ? tctx : &ctx;
> > =C2=A0
> > =C2=A0	if (bo->ttm.resource->mem_type =3D=3D mem_type)
> > =C2=A0		return 0;
> > @@ -3110,8 +3259,9 @@ int xe_bo_migrate(struct xe_bo *bo, u32
> > mem_type, struct drm_exec *exec)
> > =C2=A0		add_vram(xe, bo, &requested, bo->flags, mem_type,
> > &c);
> > =C2=A0	}
> > =C2=A0
> > -	xe_validation_assert_exec(xe_bo_device(bo), exec, &bo-
> > >ttm.base);
> > -	return ttm_bo_validate(&bo->ttm, &placement, &ctx);
> > +	if (!tctx->no_wait_gpu)
> > +		xe_validation_assert_exec(xe_bo_device(bo), exec,
> > &bo->ttm.base);
> > +	return ttm_bo_validate(&bo->ttm, &placement, tctx);
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h
> > b/drivers/gpu/drm/xe/xe_bo.h
> > index c6bb90ca5c2e..8a057d39f0a8 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -284,7 +284,8 @@ uint64_t vram_region_gpu_offset(struct
> > ttm_resource *res);
> > =C2=A0
> > =C2=A0bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
> > =C2=A0
> > -int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec
> > *exec);
> > +int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct
> > ttm_operation_ctx *ctc,
> > +		=C2=A0 struct drm_exec *exec);
> > =C2=A0int xe_bo_evict(struct xe_bo *bo, struct drm_exec *exec);
> > =C2=A0
> > =C2=A0int xe_bo_evict_pinned(struct xe_bo *bo);
> > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
> > b/drivers/gpu/drm/xe/xe_dma_buf.c
> > index 78a827d4e726..2fdfeaf59fb1 100644
> > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > @@ -64,7 +64,7 @@ static int xe_dma_buf_pin(struct
> > dma_buf_attachment *attach)
> > =C2=A0		return -EINVAL;
> > =C2=A0	}
> > =C2=A0
> > -	ret =3D xe_bo_migrate(bo, XE_PL_TT, exec);
> > +	ret =3D xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
> > =C2=A0	if (ret) {
> > =C2=A0		if (ret !=3D -EINTR && ret !=3D -ERESTARTSYS)
> > =C2=A0			drm_dbg(&xe->drm,
> > @@ -102,7 +102,7 @@ static struct sg_table *xe_dma_buf_map(struct
> > dma_buf_attachment *attach,
> > =C2=A0
> > =C2=A0	if (!xe_bo_is_pinned(bo)) {
> > =C2=A0		if (!attach->peer2peer)
> > -			r =3D xe_bo_migrate(bo, XE_PL_TT, exec);
> > +			r =3D xe_bo_migrate(bo, XE_PL_TT, NULL,
> > exec);
> > =C2=A0		else
> > =C2=A0			r =3D xe_bo_validate(bo, NULL, false, exec);
> > =C2=A0		if (r)
> > @@ -170,7 +170,7 @@ static int xe_dma_buf_begin_cpu_access(struct
> > dma_buf *dma_buf,
> > =C2=A0
> > =C2=A0	/* Can we do interruptible lock here? */
> > =C2=A0	xe_bo_lock(bo, false);
> > -	(void)xe_bo_migrate(bo, XE_PL_TT, exec);
> > +	(void)xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
> > =C2=A0	xe_bo_unlock(bo);
> > =C2=A0
> > =C2=A0	return 0;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index ec6f6d520a9c..a054d6010ae0 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -87,7 +87,7 @@ static int xe_pf_begin(struct drm_exec *exec,
> > struct xe_vma *vma,
> > =C2=A0	if (!bo)
> > =C2=A0		return 0;
> > =C2=A0
> > -	return need_vram_move ? xe_bo_migrate(bo, vram->placement,
> > exec) :
> > +	return need_vram_move ? xe_bo_migrate(bo, vram->placement,
> > NULL, exec) :
> > =C2=A0		xe_bo_validate(bo, vm, true, exec);
> > =C2=A0}
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_validation.c
> > b/drivers/gpu/drm/xe/xe_validation.c
> > index b90fda3dd5f4..826cd09966ef 100644
> > --- a/drivers/gpu/drm/xe/xe_validation.c
> > +++ b/drivers/gpu/drm/xe/xe_validation.c
> > @@ -241,7 +241,8 @@ int xe_validation_exec_lock(struct
> > xe_validation_ctx *ctx,
> > =C2=A0 */
> > =C2=A0void xe_validation_ctx_fini(struct xe_validation_ctx *ctx)
> > =C2=A0{
> > -	drm_exec_fini(ctx->exec);
> > +	if (ctx->exec)
> > +		drm_exec_fini(ctx->exec);
> > =C2=A0	xe_validation_unlock(ctx);
> > =C2=A0}
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index 38d50ec3d939..d3060c5b2e8f 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3166,6 +3166,7 @@ static int op_lock_and_prep(struct drm_exec
> > *exec, struct xe_vm *vm,
> > =C2=A0		if (!err && !xe_vma_has_no_bo(vma))
> > =C2=A0			err =3D xe_bo_migrate(xe_vma_bo(vma),
> > =C2=A0					=C2=A0=C2=A0=C2=A0
> > region_to_mem_type[region],
> > +					=C2=A0=C2=A0=C2=A0 NULL,
> > =C2=A0					=C2=A0=C2=A0=C2=A0 exec);
> > =C2=A0		break;
> > =C2=A0	}
> > --=20
> > 2.50.1
> >=20

