Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232B3CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 06:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB93F10E11C;
	Thu, 28 Aug 2025 06:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LaxUPHNR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8C710E11C
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 06:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756361931; x=1787897931;
 h=message-id:subject:from:to:cc:in-reply-to:references:
 content-transfer-encoding:mime-version:date;
 bh=fmqSov/klVU99Ejyf9cnvIKuZWVZ5hqwxT/rGtS0tmE=;
 b=LaxUPHNRNmBeem3nTckHrfaVVnrbN60pDxvdvJY4WV8ctwmKpAXMQNwz
 F9jLQsue//l8W1qpW1oatWgW5lRry8jr/Ew7e40RtpiVnizm2rPkVgtey
 bxtT+YNvH4Uy3a41IDWhee71prMDHmyMiaLJuwRIvdNvEUSO/rCMNeWOi
 eoHh58I4uBCY5wAhCXSc1H2ZarFMXFZAx9Es1RikauiO3pKeblco5A0bD
 E7Nqi8y7Z16I91w38c9A47A6ia1wSc9UdLa0TQlPiuAuzDvkiU3YpIGLS
 p9j+EEPazHP2aEVAWz/eQW1WVAL1YDy7Im/c9VhI3fltlbaeqEaRAiDI4 Q==;
X-CSE-ConnectionGUID: yTlCf0/TTHG8+LERxM5O4Q==
X-CSE-MsgGUID: u+22NFQBQGa51vGGgA22UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58770094"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58770094"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 23:18:50 -0700
X-CSE-ConnectionGUID: xQ+JrZZcTx2hYYHCzqGoiw==
X-CSE-MsgGUID: nzG0MGKnQjel+LTXlk1kAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="169322390"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.28])
 ([10.245.245.28])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 23:18:48 -0700
Message-ID: <f20a7c46832609135067d5d21e059d34f15d8b81.camel@linux.intel.com>
Subject: Re: [PATCH v2 09/16] drm/xe: Convert the CPU fault handler for
 exhaustive eviction
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
In-Reply-To: <aK8pz/4W62DMiDy6@lstrano-desk.jf.intel.com>
References: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
 <20250822094030.3499-10-thomas.hellstrom@linux.intel.com>
 <aK46+muNkR2uAq75@lstrano-desk.jf.intel.com>
 <cc739f6d910cf772a10b4304c205b971f15bf7dc.camel@linux.intel.com>
 <aK8pz/4W62DMiDy6@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Date: Thu, 28 Aug 2025 08:18:21 +0200
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Wed, 2025-08-27 at 08:52 -0700, Matthew Brost wrote:
> On Wed, Aug 27, 2025 at 04:16:25PM +0200, Thomas Hellstr=C3=B6m wrote:
> > On Tue, 2025-08-26 at 15:53 -0700, Matthew Brost wrote:
> > > On Fri, Aug 22, 2025 at 11:40:23AM +0200, Thomas Hellstr=C3=B6m wrote=
:
> > > > The CPU fault handler may populate bos and migrate, and in
> > > > doing
> > > > so might interfere with other tasks validating.
> > > >=20
> > > > Rework the CPU fault handler completely into a fastpath
> > > > and a slowpath. The fastpath trylocks only the validation lock
> > > > in read-mode. If that fails, there's a fallback to the
> > > > slowpath, where we do a full validation transaction.
> > > >=20
> > > > This mandates open-coding of bo locking, bo idling and
> > > > bo populating, but we still call into TTM for fault
> > > > finalizing.
> > > >=20
> > > > v2:
> > > > - Rework the CPU fault handler to actually take part in
> > > > =C2=A0 the exhaustive eviction scheme (Matthew Brost).
> > > >=20
> > > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > > <thomas.hellstrom@linux.intel.com>
> > > > ---
> > > > =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 191
> > > > ++++++++++++++++++++++++-
> > > > ----
> > > > =C2=A0drivers/gpu/drm/xe/xe_validation.c |=C2=A0=C2=A0 3 +-
> > > > =C2=A02 files changed, 163 insertions(+), 31 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > index 76e9c93826a2..686ca5d6038a 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -1713,57 +1713,188 @@ static void xe_gem_object_close(struct
> > > > drm_gem_object *obj,
> > > > =C2=A0	}
> > > > =C2=A0}
> > > > =C2=A0
> > > > -static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
> > > > +static vm_fault_t __xe_bo_cpu_fault(struct vm_fault *vmf,
> > > > struct
> > > > xe_device *xe, struct xe_bo *bo)
> > > > +{
> > > > +	vm_fault_t ret;
> > > > +
> > > > +	trace_xe_bo_cpu_fault(bo);
> > > > +
> > > > +	ret =3D ttm_bo_vm_fault_reserved(vmf, vmf->vma-
> > > > > vm_page_prot,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > TTM_BO_VM_NUM_PREFAULT);
> > > > +	if (ret =3D=3D VM_FAULT_NOPAGE &&
> > > > +	=C2=A0=C2=A0=C2=A0 mem_type_is_vram(bo->ttm.resource->mem_type)) =
{
> > > > +		mutex_lock(&xe-
> > > > >mem_access.vram_userfault.lock);
> > > > +		if (list_empty(&bo->vram_userfault_link))
> > > > +			list_add(&bo->vram_userfault_link,
> > > > +				 &xe-
> > > > > mem_access.vram_userfault.list);
> > > > +		mutex_unlock(&xe-
> > > > >mem_access.vram_userfault.lock);
> > > > +	}
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static vm_fault_t xe_err_to_fault_t(int err)
> > > > +{
> > > > +	switch (err) {
> > > > +	case 0:
> > > > +	case -EINTR:
> > > > +	case -ERESTARTSYS:
> > > > +	case -EAGAIN:
> > > > +		return VM_FAULT_NOPAGE;
> > > > +	case -ENOMEM:
> > > > +	case -ENOSPC:
> > > > +		return VM_FAULT_OOM;
> > > > +	default:
> > > > +		break;
> > > > +	}
> > > > +	return VM_FAULT_SIGBUS;
> > > > +}
> > > > +
> > > > +static vm_fault_t xe_bo_cpu_fault_fastpath(struct vm_fault
> > > > *vmf,
> > > > struct xe_device *xe,
> > > > +					=C2=A0=C2=A0 struct xe_bo *bo,
> > > > bool
> > > > needs_rpm)
> > > > +{
> > > > +	struct ttm_buffer_object *tbo =3D &bo->ttm;
> > > > +	vm_fault_t ret =3D VM_FAULT_RETRY;
> > > > +	struct xe_validation_ctx ctx;
> > > > +	int err;
> > > > +
> > > > +	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
> > > > +		return VM_FAULT_RETRY;
> > > > +
> > > > +	err =3D xe_validation_ctx_init(&ctx, &xe->val, NULL,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0 (struct xe_val_flags) {
> > > > +					=C2=A0=C2=A0=C2=A0=C2=A0 .interruptible =3D
> > > > true,
> > > > +					=C2=A0=C2=A0=C2=A0=C2=A0 .no_block =3D true
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0 });
> > > > +	if (err)
> > > > +		goto out_pm;
> > > > +
> > > > +	if (!dma_resv_trylock(tbo->base.resv))
> > > > +		goto out_validation;
> > > > +
> > > > +	if (!dma_resv_test_signaled(tbo->base.resv,
> > > > DMA_RESV_USAGE_KERNEL))
> > > > +		goto out_unlock;
> > > > +
> > > > +	if (!tbo->resource->bus.is_iomem) {
> > > > +		struct ttm_operation_ctx ctx =3D {
> > > > +			.interruptible =3D true,
> > > > +			.no_wait_gpu =3D true,
> > > > +			.gfp_retry_mayfail =3D true,
> > > > +		};
> > > > +
> > > > +		err =3D ttm_bo_populate(tbo, &ctx);
> > >=20
> > > The version of the fault handler before didn't have a
> > > ttm_bo_populate
> > > call. Can you explain why it is added here?
> >=20
> > It's called from within ttm_bo_vm_fault_reserved() but with a
> > blocking
> > ttm_operation_ctx. Here we call it non-blocking and if it succeeds
> > the
> > version in ttm_bo_vm_fault_reserved() will be a NOP.
> >=20
> > The functionality is to bring in bos from swap if needed. Or to be
> > able
> > to access bos with deferred backing store allocation.
> >=20
>=20
> Ah, yes. I see that now. This made notice potential another issue.
> See below.
>=20
> > >=20
> > > Also in we have this code in ttm_bo_vm_reserve which rejects
> > > external
> > > object marked as unmappable. Do we need something like this?
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (bo->ttm && (bo->ttm->p=
age_flags &
> > > TTM_TT_FLAG_EXTERNAL))
> > > {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (!(bo->ttm->page_flags &
> > > TTM_TT_FLAG_EXTERNAL_MAPPABLE)) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_r=
esv_unlock(bo->base.resv);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n VM_FAULT_SIGBUS;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> > Ah, right. This essentially blocks imported dma-bufs from being
> > mapped
> > here. I'll fix. This reminds me to add a comment to rework the ttm
> > helpers to move this stuff to TTM.
> >=20
> > /Thomas
> >=20
> > >=20
> > > Matt
> > >=20
> > > > +		if (err) {
> > > > +			if (err !=3D -ENOMEM && err !=3D -ENOSPC)
> > > > +				ret =3D xe_err_to_fault_t(err);
> > > > +			goto out_unlock;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	ret =3D __xe_bo_cpu_fault(vmf, xe, bo);
> > > > +
> > > > +out_unlock:
> > > > +	dma_resv_unlock(tbo->base.resv);
> > > > +out_validation:
> > > > +	xe_validation_ctx_fini(&ctx);
> > > > +out_pm:
> > > > +	if (needs_rpm)
> > > > +		xe_pm_runtime_put(xe);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
> > > > =C2=A0{
> > > > =C2=A0	struct ttm_buffer_object *tbo =3D vmf->vma-
> > > > >vm_private_data;
> > > > =C2=A0	struct drm_device *ddev =3D tbo->base.dev;
> > > > =C2=A0	struct xe_device *xe =3D to_xe_device(ddev);
> > > > =C2=A0	struct xe_bo *bo =3D ttm_to_xe_bo(tbo);
> > > > =C2=A0	bool needs_rpm =3D bo->flags & XE_BO_FLAG_VRAM_MASK;
> > > > -	struct drm_exec *exec;
> > > > +	bool retry_after_wait =3D false;
> > > > +	struct xe_validation_ctx ctx;
> > > > +	struct drm_exec exec;
> > > > =C2=A0	vm_fault_t ret;
> > > > +	int err =3D 0;
> > > > =C2=A0	int idx;
> > > > =C2=A0
> > > > +	if (!drm_dev_enter(&xe->drm, &idx))
> > > > +		return ttm_bo_vm_dummy_page(vmf, vmf->vma-
> > > > > vm_page_prot);
> > > > +
> > > > +	ret =3D xe_bo_cpu_fault_fastpath(vmf, xe, bo,
> > > > needs_rpm);
> > > > +	if (ret !=3D VM_FAULT_RETRY)
> > > > +		goto out;
> > > > +
> > > > +	if (fault_flag_allow_retry_first(vmf->flags)) {
> > > > +		if (vmf->flags & FAULT_FLAG_RETRY_NOWAIT)
> > > > +			goto out;
> > > > +		retry_after_wait =3D true;
> > > > +		xe_bo_get(bo);
> > > > +		mmap_read_unlock(vmf->vma->vm_mm);
> > > > +	} else {
> > > > +		ret =3D VM_FAULT_NOPAGE;
> > > > +	}
> > > > +
> > > > +	/*
> > > > +	 * The fastpath failed and we were not required to
> > > > return
> > > > and retry immediately.
> > > > +	 * We're now running in one of two modes:
> > > > +	 *
> > > > +	 * 1) retry_after_wait =3D=3D true: The mmap_read_lock()
> > > > is
> > > > dropped, and we're trying
> > > > +	 * to resolve blocking waits. But we can't resolve the
> > > > fault since the
> > > > +	 * mmap_read_lock() is dropped. After retrying the
> > > > fault,
> > > > the aim is that the fastpath
> > > > +	 * should succeed. But it may fail since we drop the
> > > > bo
> > > > lock.
> > > > +	 *
> > > > +	 * 2) retry_after_wait =3D=3D false: The fastpath failed,
> > > > typically even after
> > > > +	 * a retry. Do whatever's necessary to resolve the
> > > > fault.
> > > > +	 *
> > > > +	 * This construct is recommended to avoid excessive
> > > > waits
> > > > under the mmap_lock.
> > > > +	 */
> > > > +
> > > > =C2=A0	if (needs_rpm)
> > > > =C2=A0		xe_pm_runtime_get(xe);
> > > > =C2=A0
> > > > -	exec =3D XE_VALIDATION_UNIMPLEMENTED;
> > > > -	ret =3D ttm_bo_vm_reserve(tbo, vmf);
> > > > -	if (ret)
> > > > -		goto out;
> > > > +	xe_validation_guard(&ctx, &xe->val, &exec, (struct
> > > > xe_val_flags) {.interruptible =3D true},
> > > > +			=C2=A0=C2=A0=C2=A0 err) {
> > > > +		long lerr;
> > > > =C2=A0
> > > > -	if (drm_dev_enter(ddev, &idx)) {
> > > > -		trace_xe_bo_cpu_fault(bo);
> > > > +		err =3D drm_exec_lock_obj(&exec, &tbo->base);
> > > > +		drm_exec_retry_on_contention(&exec);
> > > > +		if (err)
> > > > +			break;
> > > > =C2=A0
> > > > -		xe_validation_assert_exec(xe, exec, &tbo-
> > > > >base);
> > > > -		ret =3D ttm_bo_vm_fault_reserved(vmf, vmf->vma-
> > > > > vm_page_prot,
> > > > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > TTM_BO_VM_NUM_PREFAULT);
> > > > -		drm_dev_exit(idx);
> > > > +		lerr =3D dma_resv_wait_timeout(tbo->base.resv,
> > > > +					=C2=A0=C2=A0=C2=A0=C2=A0
> > > > DMA_RESV_USAGE_KERNEL, true,
> > > > +					=C2=A0=C2=A0=C2=A0=C2=A0
> > > > MAX_SCHEDULE_TIMEOUT);
> > > > +		if (lerr < 0) {
> > > > +			err =3D lerr;
> > > > +			break;
> > > > +		}
> > > > =C2=A0
> > > > -		if (ret =3D=3D VM_FAULT_RETRY &&
> > > > -		=C2=A0=C2=A0=C2=A0 !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> > > > -			goto out;
> > > > +		if (!tbo->resource->bus.is_iomem) {
> > > > +			struct ttm_operation_ctx tctx =3D {
> > > > +				.interruptible =3D true,
> > > > +				.no_wait_gpu =3D false,
> > > > +				.gfp_retry_mayfail =3D true,
> > > > +			};
> > > > =C2=A0
> > > > -		/*
> > > > -		 * ttm_bo_vm_reserve() already has
> > > > dma_resv_lock.
> > > > -		 */
> > > > -		if (ret =3D=3D VM_FAULT_NOPAGE &&
> > > > -		=C2=A0=C2=A0=C2=A0 mem_type_is_vram(tbo->resource->mem_type))
> > > > {
> > > > -			mutex_lock(&xe-
> > > > > mem_access.vram_userfault.lock);
> > > > -			if (list_empty(&bo-
> > > > >vram_userfault_link))
> > > > -				list_add(&bo-
> > > > >vram_userfault_link,
> > > > -					 &xe-
> > > > > mem_access.vram_userfault.list);
> > > > -			mutex_unlock(&xe-
> > > > > mem_access.vram_userfault.lock);
> > > > +			err =3D ttm_bo_populate(tbo, &tctx);
> > > > +			xe_validation_retry_on_oom(&ctx,
> > > > &err);
> > > > +			if (err && (err =3D=3D -EINTR || err =3D=3D -
> > > > ERESTARTSYS))
>=20
> This if statement looks odd.
>=20
> 'err && (err =3D=3D -EINTR || err =3D=3D -ERESTARTSYS)'
>=20
> The 'err &&' is not required in the way this logic is written.
>=20
> Should this be:
>=20
> if (err)
> 	break;
>=20
> Or is this an attempt to call ttm_bo_vm_fault_reserved which calls
> ttm_bo_populate without gfp_retry_mayfail on OOO situations?

Yes, the if (err && is there to short-circuit the rest of the
evaluation in the common case of err =3D=3D 0. Not that I expect that there
will be a dramatic performance improvement, but it explains why. And
yes, I should include the -EAGAIN and if a removal is warranted, that
should be a separate patch. Finally yes, the intention is to try
without gfp_retry_mayfail as a last resort.

there is a VM_FAULT_OOM error, but it seems parts of the vm doesn't
really expect that to be returned and ends up printing a confused
memory from the OOM subsystem. Instead without the gfp_retry_mayfail,
then from what I can tell, the OOM killer will be invoked for faulting.

>=20
> Also you don't check err =3D=3D -EAGAIN in the existing logic which
> ttm_bo_vm_fault_reserved does on the return of ttm_bo_populate.
>=20
> Can you explain the reasoing here? Also a few comments in code
> explaining the reasoning of the error handling would be helpful.

Agreed. I'll add that.

/Thomas




>=20
> Matt
>=20
> > > > +				break;
> > > > =C2=A0		}
> > > > -	} else {
> > > > -		ret =3D ttm_bo_vm_dummy_page(vmf, vmf->vma-
> > > > > vm_page_prot);
> > > > +		if (!retry_after_wait)
> > > > +			ret =3D __xe_bo_cpu_fault(vmf, xe, bo);
> > > > =C2=A0	}
> > > > +	if (err)
> > > > +		ret =3D xe_err_to_fault_t(err);
> > > > =C2=A0
> > > > -	dma_resv_unlock(tbo->base.resv);
> > > > -out:
> > > > =C2=A0	if (needs_rpm)
> > > > =C2=A0		xe_pm_runtime_put(xe);
> > > > =C2=A0
> > > > +	if (retry_after_wait)
> > > > +		xe_bo_put(bo);
> > > > +out:
> > > > +	drm_dev_exit(idx);
> > > > +
> > > > =C2=A0	return ret;
> > > > =C2=A0}
> > > > =C2=A0
> > > > @@ -1807,7 +1938,7 @@ int xe_bo_read(struct xe_bo *bo, u64
> > > > offset,
> > > > void *dst, int size)
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0static const struct vm_operations_struct xe_gem_vm_ops =3D {
> > > > -	.fault =3D xe_gem_fault,
> > > > +	.fault =3D xe_bo_cpu_fault,
> > > > =C2=A0	.open =3D ttm_bo_vm_open,
> > > > =C2=A0	.close =3D ttm_bo_vm_close,
> > > > =C2=A0	.access =3D xe_bo_vm_access,
> > > > diff --git a/drivers/gpu/drm/xe/xe_validation.c
> > > > b/drivers/gpu/drm/xe/xe_validation.c
> > > > index b90fda3dd5f4..826cd09966ef 100644
> > > > --- a/drivers/gpu/drm/xe/xe_validation.c
> > > > +++ b/drivers/gpu/drm/xe/xe_validation.c
> > > > @@ -241,7 +241,8 @@ int xe_validation_exec_lock(struct
> > > > xe_validation_ctx *ctx,
> > > > =C2=A0 */
> > > > =C2=A0void xe_validation_ctx_fini(struct xe_validation_ctx *ctx)
> > > > =C2=A0{
> > > > -	drm_exec_fini(ctx->exec);
> > > > +	if (ctx->exec)
> > > > +		drm_exec_fini(ctx->exec);
> > > > =C2=A0	xe_validation_unlock(ctx);
> > > > =C2=A0}
> > > > =C2=A0
> > > > --=20
> > > > 2.50.1
> > > >=20
> >=20

