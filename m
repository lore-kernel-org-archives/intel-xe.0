Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DA4CCF9F8
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 08:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFD510E917;
	Thu, 30 Oct 2025 08:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a90QAVme";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA4E10E917
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 08:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761812231; x=1793348231;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HB/4G41E1LrEJ5cXj0OwwIUmjtaUMFk+TLo2mHkiCoA=;
 b=a90QAVmeBeIAnyiYSXx1UMChW+ku6LIw9f26JDsAt0iosct61PjcrMBz
 zP12h8P+2p84ev0sTmIQMMZ7NVJhwzdDrosflGnW3HGTS0uNcF24sEoQR
 aOqO/kqZEw22vKCwg0Nca4KU91OpuPASD6Y0FWn7s73XL8a10+ryXScf3
 xc7pJ1UxdSer9SWOr/k8+gwZyLqaLod0I1rvMc2Lpld0vC2hHfkc0oezj
 MA2uXT9LQ1CVuH67TZ3ufzULIcE5w4+bXJWgq1HrcB0MZPZsc+eYNlXog
 IXRxOqH+2JiE9K2x+P9LNrjMHnXuMljDy/uD4pERQjsucLmTv3aUPPctd Q==;
X-CSE-ConnectionGUID: fQ4YsZyhQq2Ch4gL70FUOw==
X-CSE-MsgGUID: itEn4rgzTcSveobAkS/f9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75293449"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="75293449"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 01:17:10 -0700
X-CSE-ConnectionGUID: JsCZ3GBhQOinqwSEtExMsA==
X-CSE-MsgGUID: puVQWwSYQhmkT4iHdFT8Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="185545563"
Received: from opintica-mobl1 (HELO [10.245.245.172]) ([10.245.245.172])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 01:17:09 -0700
Message-ID: <29fdde6904e00bcaaefc9148c97d7cdd833c5bbc.camel@linux.intel.com>
Subject: Re: [RFC PATCH 3/9] drm/xe/madvise: Implement purgeable buffer
 object support
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com
Date: Thu, 30 Oct 2025 09:17:07 +0100
In-Reply-To: <59ccc1f9-efb6-4584-93ca-7114a644a851@intel.com>
References: <20251028122415.1136721-1-arvind.yadav@intel.com>
 <20251028122415.1136721-4-arvind.yadav@intel.com>
 <f976fdad404f4e8704ad2974dfed06f80ba31e6e.camel@linux.intel.com>
 <93be3dde56c24ce83c28a2dfe3bffeaf9a47b25d.camel@linux.intel.com>
 <59ccc1f9-efb6-4584-93ca-7114a644a851@intel.com>
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

On Thu, 2025-10-30 at 12:33 +0530, Yadav, Arvind wrote:
>=20
> On 29-10-2025 16:21, Thomas Hellstr=C3=B6m wrote:
> > On Wed, 2025-10-29 at 09:55 +0100, Thomas Hellstr=C3=B6m wrote:
> > > On Tue, 2025-10-28 at 17:54 +0530, Arvind Yadav wrote:
> > > > This allows userspace applications to provide memory usage
> > > > hints to
> > > > the kernel for better memory management under pressure:
> > > >=20
> > > > - WILLNEED: BO will be needed again, re-validate if purged
> > > > - DONTNEED: BO not currently needed, may be purged if needed
> > > >=20
> > > > When userspace marks BO as DONTNEED, the kernel can reclaim
> > > > their memory during memory pressure. BO transition to PURGED
> > > > state when reclaimed, and attempting to access purged buffers
> > > > triggers appropriate fault handling.
> > > >=20
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > > > ---
> > > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 75
> > > > +++++++++++++++++++++++++-
> > > > --
> > > > --
> > > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c | 67
> > > > ++++++++++++++++++++++++++
> > > > =C2=A0=C2=A02 files changed, 130 insertions(+), 12 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > index cbc3ee157218..3b3eb83658cc 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -836,6 +836,60 @@ static int xe_bo_move_notify(struct xe_bo
> > > > *bo,
> > > > =C2=A0=C2=A0	return 0;
> > > > =C2=A0=C2=A0}
> > > > =C2=A0=20
> > > > +static int xe_bo_invalidate_tlb_before_purge(struct xe_bo *bo)
> > > In the future someone might want to reuse this function for
> > > invalidating somewhere else. Could we perhaps rename to
> > > xe_bo_invalidate_vmas() or something like that?
> Noted.
> > >=20
> > >=20
> > > > +{
> > > > +	struct drm_gpuvm_bo *vm_bo;
> > > > +	struct drm_gpuva *gpuva;
> > > > +	struct drm_gem_object *obj =3D &bo->ttm.base;
> > > > +	int ret;
> > > > +
> > > > +	/* BO must be locked before invalidating */
> > > > +	dma_resv_assert_held(bo->ttm.base.resv);
> > > > +
> > > > +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> > > > +		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> > > > +			struct xe_vma *vma =3D
> > > > gpuva_to_vma(gpuva);
> > > > +
> > > > +			ret =3D xe_vm_invalidate_vma(vma);
> > > > +			if (ret)
> > > > +				return ret;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static void xe_bo_set_purged(struct xe_bo *bo)
> > > > +{
> > > > +	/* BO must be locked before modifying madv state */
> > > > +	dma_resv_assert_held(bo->ttm.base.resv);
> > > > +
> > > > +	atomic_set(&bo->madv_purgeable,
> > > > XE_MADV_PURGEABLE_PURGED);
> > > > +}
> > > > +
> > > > +static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo,
> > > > struct
> > > > ttm_operation_ctx *ctx)
> > > > +{
> > > > +	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> > > > +	struct xe_bo *bo =3D ttm_to_xe_bo(ttm_bo);
> > > > +
> > > > +	if (ttm_bo->ttm) {
> > > > +		struct ttm_placement place =3D {};
> > > > +		int ret =3D ttm_bo_validate(ttm_bo, &place,
> > > > ctx);
> > > > +		int ret_inval;
> > > Christian from AMD once mentioned that instead of implicitly
> > > calling
> > > ttm_bo_validate() with an empty placement, we could send the null
> > > placement through the evict_flags callback. Would that work?
> > >=20
> > >=20
> > Actually it doesn't since we don't get to call move_notify.
> Agreed,
> > >=20
> > > > +
> > > > +		drm_WARN_ON(&xe->drm, ret);
> > > > +		if (!ret && bo) {
> > > > +			if (atomic_read(&bo->madv_purgeable)
> > > > =3D=3D
> > > > XE_MADV_PURGEABLE_DONTNEED) {
> > > > +				/* Invalidate TLB before
> > > > marking
> > > > BO
> > > > as purged */
> > > > +				ret_inval =3D
> > > > xe_bo_invalidate_tlb_before_purge(bo);
> > > Since the page-table update and page-freeing is really intended
> > > to be
> > > an asynchronous operation, and the GPU bindings are intended to
> > > be
> > > invalidated in move_notify() / trigger_rebind() where we properly
> > > take
> > > care of special cases like faulting VMs etc, can we move the
> > > invalidation logic there?
> > >=20
> > > Perhaps it is even possible to skip the synchronous page-table
> > > zeroing
> > > here in favour of a NULL rebind (when rebinding a purged BO we
> > > set up
> > > all zero mappings, or whatever mappings are required given
> > > scratch
> > > page
> > > mode etc.) Then the page-table clearing will be properly inserted
> > > in
> > > the asynchronous execution.
> > >=20
>=20
> My understanding is that you are suggesting two main changes:
>=20
> 1. Asynchronous Invalidation: I should remove the synchronous=20
> xe_bo_invalidate_tlb_before_purge() call. Instead, I should rely on
> the=20
> existing asynchronous invalidation path that is already triggered
> during=20
> eviction via xe_bo_move_notify() -> xe_bo_trigger_rebind(). This will
> handle the TLB invalidation correctly and more efficiently.
>=20
> 2. NULL Rebind on Access(for VM Faulting Mode is ENABLED): When a GPU
> operation tries to bind a buffer that is in the PURGED state, the
> driver=20
> should not error. Instead, it should perform a "NULL rebind" by
> mapping=20
> the buffer's VMA to a scratch page. This ensures the GPU reads safe,=20
> zeroed data instead of accessing invalid memory.

Yes. We want scratch PTEs if the VM is scratch-page-enabled, and the
"clear_pt" mode otherwise.

>=20
> The BO would only be re-allocated and re-bound when userspace
> explicitly=20
> Call WILLNEED.
> I=E2=80=99ll now look into implementing the NULL rebind logic within the =
VMA=20
> mapping path and will follow up with an updated patch.

IMO we should try to mimic the i915 behaviour here, since it's already
implemented in mesa: That is, if we call WILLNEED on an already purged
bo, we return an error.

/Thomas
>=20
> ~Arvind
> > > > +				if (!ret_inval)
> > > > +					xe_bo_set_purged(bo);
> > > > +
> > > > +			}
> > > > +		}
> > >=20
> > >=20
> > > > +	}
> > > > +}
> > > > +
> > > > =C2=A0=C2=A0static int xe_bo_move(struct ttm_buffer_object *ttm_bo,=
 bool
> > > > evict,
> > > > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_c=
tx *ctx,
> > > > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource *n=
ew_mem,
> > > > @@ -853,8 +907,14 @@ static int xe_bo_move(struct
> > > > ttm_buffer_object
> > > > *ttm_bo, bool evict,
> > > > =C2=A0=C2=A0	bool needs_clear;
> > > > =C2=A0=C2=A0	bool handle_system_ccs =3D (!IS_DGFX(xe) &&
> > > > xe_bo_needs_ccs_pages(bo) &&
> > > > =C2=A0=C2=A0				=C2=A0 ttm &&
> > > > ttm_tt_is_populated(ttm))
> > > > ?
> > > > true : false;
> > > > +	int state =3D atomic_read(&bo->madv_purgeable);
> > > > =C2=A0=C2=A0	int ret =3D 0;
> > > > =C2=A0=20
> > > > +	if (evict && state =3D=3D XE_MADV_PURGEABLE_DONTNEED) {
> > > > +		xe_ttm_bo_purge(ttm_bo, ctx);
> > > > +			return 0;
> > > > +	}
> > > > +
> > > > =C2=A0=C2=A0	/* Bo creation path, moving to system or TT. */
> > > > =C2=A0=C2=A0	if ((!old_mem && ttm) && !handle_system_ccs) {
> > > > =C2=A0=C2=A0		if (new_mem->mem_type =3D=3D XE_PL_TT)
> > > > @@ -1606,18 +1666,6 @@ static void
> > > > xe_ttm_bo_delete_mem_notify(struct
> > > > ttm_buffer_object *ttm_bo)
> > > > =C2=A0=C2=A0	}
> > > > =C2=A0=C2=A0}
> > > > =C2=A0=20
> > > > -static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo,
> > > > struct
> > > > ttm_operation_ctx *ctx)
> > > > -{
> > > > -	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> > > > -
> > > > -	if (ttm_bo->ttm) {
> > > > -		struct ttm_placement place =3D {};
> > > > -		int ret =3D ttm_bo_validate(ttm_bo, &place,
> > > > ctx);
> > > > -
> > > > -		drm_WARN_ON(&xe->drm, ret);
> > > > -	}
> > > > -}
> > > > -
> > > > =C2=A0=C2=A0static void xe_ttm_bo_swap_notify(struct ttm_buffer_obj=
ect
> > > > *ttm_bo)
> > > > =C2=A0=C2=A0{
> > > > =C2=A0=C2=A0	struct ttm_operation_ctx ctx =3D {
> > > > @@ -2472,6 +2520,9 @@ struct xe_bo *xe_bo_create_user(struct
> > > > xe_device *xe,
> > > > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_type_de=
vice,
> > > > flags,
> > > > 0,
> > > > true);
> > > > =C2=A0=C2=A0	}
> > > > =C2=A0=20
> > > > +	/* Initialize purge advisory state */
> > > > +	atomic_set(&bo->madv_purgeable,
> > > > XE_MADV_PURGEABLE_WILLNEED);
> > > > +
> > > > =C2=A0=C2=A0	return bo;
> > > > =C2=A0=C2=A0}
> > > > =C2=A0=20
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > index cad3cf627c3f..1f0356ea4403 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > @@ -158,6 +158,54 @@ static void madvise_pat_index(struct
> > > > xe_device
> > > > *xe, struct xe_vm *vm,
> > > > =C2=A0=C2=A0	}
> > > > =C2=A0=C2=A0}
> > > > =C2=A0=20
> > > > +/*
> > > > + * Handle purgeable buffer object advice for
> > > > DONTNEED/WILLNEED/PURGED.
> > > > + * Returns 0 on success, negative errno on error.
> > > > + */
> > > > +static void xe_vm_madvise_purgeable_bo(struct xe_device *xe,
> > > > struct
> > > > xe_vm *vm,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma **vmas,
> > > > int
> > > > num_vmas,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_xe_madvise
> > > > *op,
> > > > struct drm_exec *exec)
> > > > +{
> > > > +
> > > > +	xe_assert(vm->xe, op->type =3D=3D
> > > > DRM_XE_VMA_ATTR_PURGEABLE_STATE);
> > > > +
> > > > +	for (int i =3D 0; i < num_vmas; i++) {
> > > > +		struct xe_bo *bo =3D xe_vma_bo(vmas[i]);
> > > > +		int state;
> > > > +		int ret;
> > > > +
> > > > +		if (!bo)
> > > > +			continue;
> > > > +
> > > > +		/* BO must be locked before modifying madv
> > > > state
> > > > */
> > > > +		dma_resv_assert_held(bo->ttm.base.resv);
> > > > +
> > > > +		switch (op->purge_state_val.val) {
> > > > +		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
> > > > +			state =3D atomic_read(&bo-
> > > > >madv_purgeable);
> > > > +			if (state =3D=3D XE_MADV_PURGEABLE_PURGED)
> > > > {
> > > > +				ret =3D xe_bo_validate(bo, NULL,
> > > > true,
> > > > exec);
> > > > +				if (ret) {
> > > > +					drm_err(&vm->xe->drm,
> > > > +						"Failed to
> > > > validate
> > > > purged BO: %d\n", ret);
> > > > +					return;
> > > > +				}
> > > > +			}
> > > > +			atomic_set(&bo->madv_purgeable,
> > > > XE_MADV_PURGEABLE_WILLNEED);
> > > > +			break;
> > > > +		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> > > > +			state =3D atomic_read(&bo-
> > > > >madv_purgeable);
> > > > +			if (state !=3D XE_MADV_PURGEABLE_PURGED)
> > > > +				atomic_set(&bo-
> > > > >madv_purgeable,
> > > > XE_MADV_PURGEABLE_DONTNEED);
> > > > +			break;
> > > > +		default:
> > > > +			drm_warn(&vm->xe->drm, "Invalid
> > > > madvice
> > > > value =3D %d\n",
> > > > +				 op->purge_state_val.val);
> > > > +			return;
> > > > +		}
> > > > +	}
> > > > +}
> > > > +
> > > > =C2=A0=C2=A0typedef void (*madvise_func)(struct xe_device *xe, stru=
ct
> > > > xe_vm
> > > > *vm,
> > > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma **vmas, int
> > > > num_vmas,
> > > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_xe_madvise *op);
> > > > @@ -283,6 +331,19 @@ static bool madvise_args_are_sane(struct
> > > > xe_device *xe, const struct drm_xe_madv
> > > > =C2=A0=C2=A0			return false;
> > > > =C2=A0=C2=A0		break;
> > > > =C2=A0=C2=A0	}
> > > > +	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
> > > > +	{
> > > > +		u32 val =3D args->purge_state_val.val;
> > > > +
> > > > +		if (XE_IOCTL_DBG(xe, !((val =3D=3D
> > > > DRM_XE_VMA_PURGEABLE_STATE_WILLNEED) ||
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (val =3D=3D
> > > > DRM_XE_VMA_PURGEABLE_STATE_DONTNEED))))
> > > > +			return false;
> > > > +
> > > > +		if (XE_IOCTL_DBG(xe, args-
> > > > > purge_state_val.reserved))
> > > > +			return false;
> > > > +
> > > > +		break;
> > > > +	}
> > > > =C2=A0=C2=A0	default:
> > > > =C2=A0=C2=A0		if (XE_IOCTL_DBG(xe, 1))
> > > > =C2=A0=C2=A0			return false;
> > > > @@ -402,6 +463,12 @@ int xe_vm_madvise_ioctl(struct drm_device
> > > > *dev,
> > > > void *data, struct drm_file *fil
> > > > =C2=A0=C2=A0					goto err_fini;
> > > > =C2=A0=C2=A0			}
> > > > =C2=A0=C2=A0		}
> > > > +		if (args->type =3D=3D
> > > > DRM_XE_VMA_ATTR_PURGEABLE_STATE)
> > > > {
> > > > +			xe_vm_madvise_purgeable_bo(xe, vm,
> > > > madvise_range.vmas,
> > > > +					=09
> > > > madvise_range.num_vmas, args, &exec);
> > > > +			goto err_fini;
> > > > +
> > > > +		}
> > > > =C2=A0=C2=A0	}
> > > > =C2=A0=20
> > > > =C2=A0=C2=A0	if (madvise_range.has_svm_userptr_vmas) {

