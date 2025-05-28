Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D95EC3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 07:37:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B0989B33;
	Wed, 28 May 2025 07:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ax2Drq8s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9FB88C11
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 07:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748417877; x=1779953877;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=MNfsn/RchX7qn3fGyIr7Z90WsJ1ufa/ZNDTzLFcp1PA=;
 b=Ax2Drq8sOr3UHTvQFqaaJ/EYYYylWg5Cg+PY2TzYUdEgjjf8tDGRTrjU
 M4La5DI+2z8elSJ0voLq7gH5e+Xln54Xe33YVtsM5KAMpfU0qdRMuSvJg
 dNEOe58IesmOMcCIk0n4hvRnFqCAjUjT5cBJt7TjK8LQvK0ZQc2zely2L
 XiMifzsEtc1rvqs8J+NiZ0/MEig4/7qU9g0MzUexgBc3kxXE4vQds9T7N
 RTH2lCsD8TxZo1B0hJpbH7a4t6bRISw9OqzSQQmiGqoMYKn5hSw2gJQGs
 J39DeBdxWbNa1fTUYXVMtF/HDxh8gSzFdIu4PzeDrvdtA2uHAh/5tpCXb A==;
X-CSE-ConnectionGUID: 2nIFsVMhSjy1qheZwi4TWA==
X-CSE-MsgGUID: jvIbObamQOG2mtKJILR1ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="60687006"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="60687006"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 00:37:53 -0700
X-CSE-ConnectionGUID: maTUvwVxRj+qoFUCBauxDw==
X-CSE-MsgGUID: 1NoDUI9OQ8+/zSjgTVprsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="147038874"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.106])
 ([10.245.245.106])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 00:37:51 -0700
Message-ID: <e5483b1596456e71ed4d878a53327ab106ec7f02.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: Rework eviction rejection of bound external bos
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Oak Zheng <oak.zheng@intel.com>
Date: Wed, 28 May 2025 09:37:40 +0200
In-Reply-To: <aDYLEuObNlqzG9qg@lstrano-desk.jf.intel.com>
References: <20250526161632.20694-1-thomas.hellstrom@linux.intel.com>
 <aDYLEuObNlqzG9qg@lstrano-desk.jf.intel.com>
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

On Tue, 2025-05-27 at 11:57 -0700, Matthew Brost wrote:
> On Mon, May 26, 2025 at 06:16:32PM +0200, Thomas Hellstr=C3=B6m wrote:
> > For preempt_fence mode VM's we're rejecting eviction of
> > shared bos during VM_BIND. However, since we do this in the
> > move() callback, we're getting an eviction failure warning from
> > TTM. The TTM callback intended for these things is
> > eviction_valuable().
> >=20
> > However, the latter doesn't pass in the struct ttm_operation_ctx
> > needed to determine whether the caller needs this.
> >=20
> > Instead, attach the needed information to the vm under the
> > vm->resv, until we've been able to update TTM to provide the
> > needed information. And add sufficient lockdep checks to prevent
> > misuse and races.
> >=20
> > v2:
> > - Fix a copy-paste error in xe_vm_clear_validating()
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Fixes: 0af944f0e308 ("drm/xe: Reject BO eviction if BO is bound to
> > current VM")
> > Cc: Oak Zeng <oak.zeng@intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
46 +++++++++++++---------
> > =C2=A0drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
65
> > ++++++++++++++++++++++++++++++++
> > =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0 8 ++++
> > =C2=A03 files changed, 101 insertions(+), 18 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index d99d91fe8aa9..3c48a8c5f439 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -841,21 +841,6 @@ static int xe_bo_move(struct ttm_buffer_object
> > *ttm_bo, bool evict,
> > =C2=A0		goto out;
> > =C2=A0	}
> > =C2=A0
> > -	/* Reject BO eviction if BO is bound to current VM. */
> > -	if (evict && ctx->resv) {
> > -		struct drm_gpuvm_bo *vm_bo;
> > -
> > -		drm_gem_for_each_gpuvm_bo(vm_bo, &bo->ttm.base) {
> > -			struct xe_vm *vm =3D gpuvm_to_vm(vm_bo->vm);
> > -
> > -			if (xe_vm_resv(vm) =3D=3D ctx->resv &&
> > -			=C2=A0=C2=A0=C2=A0 xe_vm_in_preempt_fence_mode(vm)) {
> > -				ret =3D -EBUSY;
> > -				goto out;
> > -			}
> > -		}
> > -	}
> > -
> > =C2=A0	/*
> > =C2=A0	 * Failed multi-hop where the old_mem is still marked as
> > =C2=A0	 * TTM_PL_FLAG_TEMPORARY, should just be a dummy move.
> > @@ -1013,6 +998,25 @@ static long xe_bo_shrink_purge(struct
> > ttm_operation_ctx *ctx,
> > =C2=A0	return lret;
> > =C2=A0}
> > =C2=A0
> > +static bool
> > +xe_bo_eviction_valuable(struct ttm_buffer_object *bo, const struct
> > ttm_place *place)
> > +{
> > +	struct drm_gpuvm_bo *vm_bo;
> > +
> > +	if (!ttm_bo_eviction_valuable(bo, place))
> > +		return false;
> > +
> > +	if (!xe_bo_is_xe_bo(bo))
> > +		return true;
> > +
> > +	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
> > +		if (xe_vm_is_validating(gpuvm_to_vm(vm_bo->vm)))
> > +			return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> > =C2=A0/**
> > =C2=A0 * xe_bo_shrink() - Try to shrink an xe bo.
> > =C2=A0 * @ctx: The struct ttm_operation_ctx used for shrinking.
> > @@ -1047,7 +1051,7 @@ long xe_bo_shrink(struct ttm_operation_ctx
> > *ctx, struct ttm_buffer_object *bo,
> > =C2=A0	=C2=A0=C2=A0=C2=A0 (flags.purge && !xe_tt->purgeable))
> > =C2=A0		return -EBUSY;
> > =C2=A0
> > -	if (!ttm_bo_eviction_valuable(bo, &place))
> > +	if (!xe_bo_eviction_valuable(bo, &place))
> > =C2=A0		return -EBUSY;
> > =C2=A0
> > =C2=A0	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
> > @@ -1588,7 +1592,7 @@ const struct ttm_device_funcs xe_ttm_funcs =3D
> > {
> > =C2=A0	.io_mem_pfn =3D xe_ttm_io_mem_pfn,
> > =C2=A0	.access_memory =3D xe_ttm_access_memory,
> > =C2=A0	.release_notify =3D xe_ttm_bo_release_notify,
> > -	.eviction_valuable =3D ttm_bo_eviction_valuable,
> > +	.eviction_valuable =3D xe_bo_eviction_valuable,
> > =C2=A0	.delete_mem_notify =3D xe_ttm_bo_delete_mem_notify,
> > =C2=A0	.swap_notify =3D xe_ttm_bo_swap_notify,
> > =C2=A0};
> > @@ -2431,6 +2435,8 @@ int xe_bo_validate(struct xe_bo *bo, struct
> > xe_vm *vm, bool allow_res_evict)
> > =C2=A0		.no_wait_gpu =3D false,
> > =C2=A0		.gfp_retry_mayfail =3D true,
> > =C2=A0	};
> > +	struct pin_cookie cookie;
> > +	int ret;
> > =C2=A0
> > =C2=A0	if (vm) {
> > =C2=A0		lockdep_assert_held(&vm->lock);
> > @@ -2440,8 +2446,12 @@ int xe_bo_validate(struct xe_bo *bo, struct
> > xe_vm *vm, bool allow_res_evict)
> > =C2=A0		ctx.resv =3D xe_vm_resv(vm);
> > =C2=A0	}
> > =C2=A0
> > +	cookie =3D xe_vm_set_validating(vm, allow_res_evict);
> > =C2=A0	trace_xe_bo_validate(bo);
> > -	return ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
> > +	ret =3D ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
> > +	xe_vm_clear_validating(vm, allow_res_evict, cookie);
> > +
> > +	return ret;
> > =C2=A0}
> > =C2=A0
> > =C2=A0bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo)
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h
> > b/drivers/gpu/drm/xe/xe_vm.h
> > index 99e164852f63..fe05c4f7f425 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -303,6 +303,71 @@ void xe_vm_snapshot_capture_delayed(struct
> > xe_vm_snapshot *snap);
> > =C2=A0void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct
> > drm_printer *p);
> > =C2=A0void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> > =C2=A0
> > +/**
> > + * xe_vm_set_validating() - Register this task as currently making
> > bos resident
> > + * @vm: Pointer to the vm or NULL.
> > + *
> > + * Register this task as currently making bos resident for the vm.
> > Intended
> > + * to avoid eviction by the same task of shared bos bound to the
> > vm.
> > + * Call with the vm's resv lock held.
> > + *
> > + * Return: A pin cookie that should be used for
> > xe_vm_clear_validating().
> > + */
> > +static inline struct pin_cookie xe_vm_set_validating(struct xe_vm
> > *vm,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 bool
> > allow_res_evict)
> > +{
> > +	struct pin_cookie cookie =3D {};
> > +
> > +	if (vm && !allow_res_evict) {
> > +		xe_vm_assert_held(vm);
> > +		cookie =3D lockdep_pin_lock(&xe_vm_resv(vm)-
> > >lock.base);
>=20
> I'm little unclear on why the cookie is needed / what
> lockdep_pin_lock
> does. I looked implementation for lockdep_pin_lock and it completely
> undocumented - could you explain?

lockdep_pin_lock() warns if someone somewhere deeper in the call chain
for some reason unlocks the specific lock while the lock is pinned.

In this case that would mean that vm->validating would be set without
the vm->resv was held.

Mostly paranoia.

/Thomas

>=20
> Everything else makes sense and LGTM.
>=20
> Matt
>=20
> > +		/* Pairs with READ_ONCE in xe_vm_is_validating()
> > */
> > +		WRITE_ONCE(vm->validating, current);
> > +	}
> > +
> > +	return cookie;
> > +}
> > +
> > +/**
> > + * xe_vm_clear_validating() - Unregister this task as currently
> > making bos resident
> > + * @vm: Pointer to the vm or NULL
> > + * @cookie: Cookie obtained from xe_vm_set_validating().
> > + *
> > + * Register this task as currently making bos resident for the vm.
> > Intended
> > + * to avoid eviction by the same task of shared bos bound to the
> > vm.
> > + * Call with the vm's resv lock held.
> > + */
> > +static inline void xe_vm_clear_validating(struct xe_vm *vm, bool
> > allow_res_evict,
> > +					=C2=A0 struct pin_cookie
> > cookie)
> > +{
> > +	if (vm && !allow_res_evict) {
> > +		lockdep_unpin_lock(&xe_vm_resv(vm)->lock.base,
> > cookie);
> > +		/* Pairs with READ_ONCE in xe_vm_is_validating()
> > */
> > +		WRITE_ONCE(vm->validating, NULL);
> > +	}
> > +}
> > +
> > +/**
> > + * xe_vm_is_validating() - Whether bos bound to the vm are
> > currently being made resident
> > + * by the current task.
> > + * @vm: Pointer to the vm.
> > + *
> > + * If this function returns %true, we should be in a vm resv
> > locked region, since
> > + * the current process is the same task that called
> > xe_vm_set_validating().
> > + * The function asserts that that's indeed the case.
> > + *
> > + * Return: %true if the task is currently making bos resident,
> > %false otherwise.
> > + */
> > +static inline bool xe_vm_is_validating(struct xe_vm *vm)
> > +{
> > +	/* Pairs with WRITE_ONCE in xe_vm_is_validating() */
> > +	if (READ_ONCE(vm->validating) =3D=3D current) {
> > +		xe_vm_assert_held(vm);
> > +		return true;
> > +	}
> > +	return false;
> > +}
> > +
> > =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> > =C2=A0void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)=
;
> > =C2=A0#else
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index bfc145baad49..0e1318a15c9e 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -310,6 +310,14 @@ struct xe_vm {
> > =C2=A0	 * protected by the vm resv.
> > =C2=A0	 */
> > =C2=A0	u64 tlb_flush_seqno;
> > +	/**
> > +	 * @validating: The task that is currently making bos
> > resident for this vm.
> > +	 * Protected by the VM's resv for writing. Opportunistic
> > reading can be done
> > +	 * using READ_ONCE. Note: This is a workaround for the
> > +	 * TTM eviction_valuable() callback not being passed a
> > struct
> > +	 * ttm_operation_context(). Future work might want to
> > address this.
> > +	 */
> > +	struct task_struct *validating;
> > =C2=A0	/** @batch_invalidate_tlb: Always invalidate TLB before
> > batch start */
> > =C2=A0	bool batch_invalidate_tlb;
> > =C2=A0	/** @xef: XE file handle for tracking this VM's drm client
> > */
> > --=20
> > 2.49.0
> >=20

