Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343AACCF9E9
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 08:55:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F003F10E776;
	Wed, 29 Oct 2025 08:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BZKXin7E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6AA10E774
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 08:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761728116; x=1793264116;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kReVe3f+pjF6giPK1uya86ttuY008498m/3VKHWTQe8=;
 b=BZKXin7EkgRzeyKTEIJ/Tcik3pzRsrP2epRntsNko1J8BOlsD6xHxirR
 6LPIcB7OdIKsWuiXaHAC3BPi2qelMsEO/ndUmuzhaOVEsqMvQzKqerGAw
 J9aADfcfd5JbwqoFD0RS70LRsqvuU4fIF6xob0w260G3wZII4fXVLaN+U
 G+Ah4Uq/f65MgQVDWeJwCnQ9IUrH9LWmmVL32wZKwZ9XpKxZx3X6u9NOL
 2YtDLi7torH2CevNviWVN188/KjaG/+bk+CZW2i1XbYzVWWpxS0obwxdu
 XpBCt2tz+Np3wPo5A57RCML0inU1Nfrf2aFXlrtTd46GJNFh52O0kJrVY A==;
X-CSE-ConnectionGUID: jx+wgWukT8WGXXbBhls/MA==
X-CSE-MsgGUID: /WNqlFfsStK/D0L95u30Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89312252"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="89312252"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 01:55:16 -0700
X-CSE-ConnectionGUID: kKkVEjkoRzejC6Q52Ejixg==
X-CSE-MsgGUID: QtXfePMIQ0C9Gb0fCxf1Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185678892"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.28])
 ([10.245.245.28])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 01:55:15 -0700
Message-ID: <f976fdad404f4e8704ad2974dfed06f80ba31e6e.camel@linux.intel.com>
Subject: Re: [RFC PATCH 3/9] drm/xe/madvise: Implement purgeable buffer
 object support
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com
Date: Wed, 29 Oct 2025 09:55:12 +0100
In-Reply-To: <20251028122415.1136721-4-arvind.yadav@intel.com>
References: <20251028122415.1136721-1-arvind.yadav@intel.com>
 <20251028122415.1136721-4-arvind.yadav@intel.com>
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

On Tue, 2025-10-28 at 17:54 +0530, Arvind Yadav wrote:
> This allows userspace applications to provide memory usage hints to
> the kernel for better memory management under pressure:
>=20
> - WILLNEED: BO will be needed again, re-validate if purged
> - DONTNEED: BO not currently needed, may be purged if needed
>=20
> When userspace marks BO as DONTNEED, the kernel can reclaim
> their memory during memory pressure. BO transition to PURGED
> state when reclaimed, and attempting to access purged buffers
> triggers appropriate fault handling.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 75 +++++++++++++++++++++++++---
> --
> =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c | 67 ++++++++++++++++++++++++++
> =C2=A02 files changed, 130 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index cbc3ee157218..3b3eb83658cc 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -836,6 +836,60 @@ static int xe_bo_move_notify(struct xe_bo *bo,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static int xe_bo_invalidate_tlb_before_purge(struct xe_bo *bo)

In the future someone might want to reuse this function for
invalidating somewhere else. Could we perhaps rename to
xe_bo_invalidate_vmas() or something like that?


> +{
> +	struct drm_gpuvm_bo *vm_bo;
> +	struct drm_gpuva *gpuva;
> +	struct drm_gem_object *obj =3D &bo->ttm.base;
> +	int ret;
> +
> +	/* BO must be locked before invalidating */
> +	dma_resv_assert_held(bo->ttm.base.resv);
> +
> +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> +		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> +			struct xe_vma *vma =3D gpuva_to_vma(gpuva);
> +
> +			ret =3D xe_vm_invalidate_vma(vma);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void xe_bo_set_purged(struct xe_bo *bo)
> +{
> +	/* BO must be locked before modifying madv state */
> +	dma_resv_assert_held(bo->ttm.base.resv);
> +
> +	atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_PURGED);
> +}
> +
> +static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct
> ttm_operation_ctx *ctx)
> +{
> +	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> +	struct xe_bo *bo =3D ttm_to_xe_bo(ttm_bo);
> +
> +	if (ttm_bo->ttm) {
> +		struct ttm_placement place =3D {};
> +		int ret =3D ttm_bo_validate(ttm_bo, &place, ctx);
> +		int ret_inval;

Christian from AMD once mentioned that instead of implicitly calling
ttm_bo_validate() with an empty placement, we could send the null
placement through the evict_flags callback. Would that work?




> +
> +		drm_WARN_ON(&xe->drm, ret);
> +		if (!ret && bo) {
> +			if (atomic_read(&bo->madv_purgeable) =3D=3D
> XE_MADV_PURGEABLE_DONTNEED) {
> +				/* Invalidate TLB before marking BO
> as purged */
> +				ret_inval =3D
> xe_bo_invalidate_tlb_before_purge(bo);

Since the page-table update and page-freeing is really intended to be
an asynchronous operation, and the GPU bindings are intended to be
invalidated in move_notify() / trigger_rebind() where we properly take
care of special cases like faulting VMs etc, can we move the
invalidation logic there?

Perhaps it is even possible to skip the synchronous page-table zeroing
here in favour of a NULL rebind (when rebinding a purged BO we set up
all zero mappings, or whatever mappings are required given scratch page
mode etc.) Then the page-table clearing will be properly inserted in
the asynchronous execution.


> +				if (!ret_inval)
> +					xe_bo_set_purged(bo);
> +
> +			}
> +		}



> +	}
> +}
> +
> =C2=A0static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource *new_mem,
> @@ -853,8 +907,14 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0	bool needs_clear;
> =C2=A0	bool handle_system_ccs =3D (!IS_DGFX(xe) &&
> xe_bo_needs_ccs_pages(bo) &&
> =C2=A0				=C2=A0 ttm && ttm_tt_is_populated(ttm)) ?
> true : false;
> +	int state =3D atomic_read(&bo->madv_purgeable);
> =C2=A0	int ret =3D 0;
> =C2=A0
> +	if (evict && state =3D=3D XE_MADV_PURGEABLE_DONTNEED) {
> +		xe_ttm_bo_purge(ttm_bo, ctx);
> +			return 0;
> +	}
> +
> =C2=A0	/* Bo creation path, moving to system or TT. */
> =C2=A0	if ((!old_mem && ttm) && !handle_system_ccs) {
> =C2=A0		if (new_mem->mem_type =3D=3D XE_PL_TT)
> @@ -1606,18 +1666,6 @@ static void xe_ttm_bo_delete_mem_notify(struct
> ttm_buffer_object *ttm_bo)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> -static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct
> ttm_operation_ctx *ctx)
> -{
> -	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> -
> -	if (ttm_bo->ttm) {
> -		struct ttm_placement place =3D {};
> -		int ret =3D ttm_bo_validate(ttm_bo, &place, ctx);
> -
> -		drm_WARN_ON(&xe->drm, ret);
> -	}
> -}
> -
> =C2=A0static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
> =C2=A0{
> =C2=A0	struct ttm_operation_ctx ctx =3D {
> @@ -2472,6 +2520,9 @@ struct xe_bo *xe_bo_create_user(struct
> xe_device *xe,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_type_device, flags,=
 0,
> true);
> =C2=A0	}
> =C2=A0
> +	/* Initialize purge advisory state */
> +	atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_WILLNEED);
> +
> =C2=A0	return bo;
> =C2=A0}
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index cad3cf627c3f..1f0356ea4403 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -158,6 +158,54 @@ static void madvise_pat_index(struct xe_device
> *xe, struct xe_vm *vm,
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +/*
> + * Handle purgeable buffer object advice for
> DONTNEED/WILLNEED/PURGED.
> + * Returns 0 on success, negative errno on error.
> + */
> +static void xe_vm_madvise_purgeable_bo(struct xe_device *xe, struct
> xe_vm *vm,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma **vmas, int
> num_vmas,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_xe_madvise *op,
> struct drm_exec *exec)
> +{
> +
> +	xe_assert(vm->xe, op->type =3D=3D
> DRM_XE_VMA_ATTR_PURGEABLE_STATE);
> +
> +	for (int i =3D 0; i < num_vmas; i++) {
> +		struct xe_bo *bo =3D xe_vma_bo(vmas[i]);
> +		int state;
> +		int ret;
> +
> +		if (!bo)
> +			continue;
> +
> +		/* BO must be locked before modifying madv state */
> +		dma_resv_assert_held(bo->ttm.base.resv);
> +
> +		switch (op->purge_state_val.val) {
> +		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
> +			state =3D atomic_read(&bo->madv_purgeable);
> +			if (state =3D=3D XE_MADV_PURGEABLE_PURGED) {
> +				ret =3D xe_bo_validate(bo, NULL, true,
> exec);
> +				if (ret) {
> +					drm_err(&vm->xe->drm,
> +						"Failed to validate
> purged BO: %d\n", ret);
> +					return;
> +				}
> +			}
> +			atomic_set(&bo->madv_purgeable,
> XE_MADV_PURGEABLE_WILLNEED);
> +			break;
> +		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> +			state =3D atomic_read(&bo->madv_purgeable);
> +			if (state !=3D XE_MADV_PURGEABLE_PURGED)
> +				atomic_set(&bo->madv_purgeable,
> XE_MADV_PURGEABLE_DONTNEED);
> +			break;
> +		default:
> +			drm_warn(&vm->xe->drm, "Invalid madvice
> value =3D %d\n",
> +				 op->purge_state_val.val);
> +			return;
> +		}
> +	}
> +}
> +
> =C2=A0typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm=
,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma **vmas, int num_vmas,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_xe_madvise *op);
> @@ -283,6 +331,19 @@ static bool madvise_args_are_sane(struct
> xe_device *xe, const struct drm_xe_madv
> =C2=A0			return false;
> =C2=A0		break;
> =C2=A0	}
> +	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
> +	{
> +		u32 val =3D args->purge_state_val.val;
> +
> +		if (XE_IOCTL_DBG(xe, !((val =3D=3D
> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED) ||
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (val =3D=3D
> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED))))
> +			return false;
> +
> +		if (XE_IOCTL_DBG(xe, args-
> >purge_state_val.reserved))
> +			return false;
> +
> +		break;
> +	}
> =C2=A0	default:
> =C2=A0		if (XE_IOCTL_DBG(xe, 1))
> =C2=A0			return false;
> @@ -402,6 +463,12 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
> void *data, struct drm_file *fil
> =C2=A0					goto err_fini;
> =C2=A0			}
> =C2=A0		}
> +		if (args->type =3D=3D DRM_XE_VMA_ATTR_PURGEABLE_STATE) {
> +			xe_vm_madvise_purgeable_bo(xe, vm,
> madvise_range.vmas,
> +						=C2=A0=C2=A0
> madvise_range.num_vmas, args, &exec);
> +			goto err_fini;
> +
> +		}
> =C2=A0	}
> =C2=A0
> =C2=A0	if (madvise_range.has_svm_userptr_vmas) {

