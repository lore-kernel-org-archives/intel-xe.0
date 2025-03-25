Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13261C35FFC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 14:23:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6BE10E0B6;
	Tue, 25 Mar 2025 14:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jioa8Huy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF29510E0B6
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 14:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742912600; x=1774448600;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=URBqta60Aub1pnl5QaTNtpNKU+KjjkoXTSKKyHW2pdk=;
 b=Jioa8HuyVSt3dVK5VAUw12J+dBSAxXY8fCUhnrsZTYc7gQPSl2j6usA+
 8vfnhreKSVJ079s5QtD0R8RExMo8j5spTp7MnV8KKgtzZIWXviIEIK4D6
 SH/SYg1XDhqG2UICE2qoEc2Ctgmy0VuDi+AxPQTC7m/Fj8dPV9hYfkIpY
 KhPugG4cXGbPvUPqZ8VPTq3GQnUqHJ1h9uTXYnnsMdCPY9lVJ4/3DdO8n
 CZNhGMNn5KSRHU44bCZG4JAOxpYQD6ku+c+rM1Vtg1vmeCODDb+N5qPCB
 Ho7CzQosbuc9qs9T8ebMMBAWSmuTdSDghh55u9CxmY/nJjgoxKnjBdlnD g==;
X-CSE-ConnectionGUID: 2iCrj1/MTSav3AAn+INjKQ==
X-CSE-MsgGUID: c+P379Z4S0uDWgn7wKiixA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="43887636"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="43887636"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 07:23:20 -0700
X-CSE-ConnectionGUID: mG528TV8SzKiLjU4j8MEmg==
X-CSE-MsgGUID: nBvOk0qmTluhg6+SrQ83Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="124109928"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.125])
 ([10.245.246.125])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 07:23:19 -0700
Message-ID: <f88fe5f8d716ddfccf240075c2a31ca7b350868b.camel@linux.intel.com>
Subject: Re: [PATCH v2 5/5] drm/xe/uapi, drm/xe: Make the PT code handle
 placement per PTE rather than per vma / range
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, Matthew
 Auld <matthew.auld@intel.com>
Date: Tue, 25 Mar 2025 15:23:14 +0100
In-Reply-To: <Z92e9sx7PdSSl3p4@lstrano-desk.jf.intel.com>
References: <20250321163416.45217-1-thomas.hellstrom@linux.intel.com>
 <20250321163416.45217-6-thomas.hellstrom@linux.intel.com>
 <Z92e9sx7PdSSl3p4@lstrano-desk.jf.intel.com>
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

On Fri, 2025-03-21 at 10:16 -0700, Matthew Brost wrote:
> On Fri, Mar 21, 2025 at 05:34:16PM +0100, Thomas Hellstr=C3=B6m wrote:
> > With SVM, ranges forwarded to the PT code for binding can, mostly
> > due to races when migrating, point to both VRAM and system /
> > foreign
> > device memory. Make the PT code able to handle that by checking,
> > for each PTE set up, whether it points to local VRAM or to system
> > memory.
> >=20
> > The UAPI is changed implicitly in that before this patch,
> > global atomics required a bo with VRAM/System placements. With
> > this patch that is changed to requiring LR mode, and
> > if the required placement is not available upon GPU atomic access
> > pagefault, an error will be generated and the VM banned.
>=20
> I think the queue will get banned if I'm reading the code correctly.
>=20
> >=20
> > v2:
> > - Fix system memory GPU atomic access.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_bo.c |=C2=A0 12 +++--
> > =C2=A0drivers/gpu/drm/xe/xe_pt.c | 106 ++++++++++++++++----------------=
-
> > ----
> > =C2=A02 files changed, 56 insertions(+), 62 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 9d043d2c30fd..3c7c2353d3c8 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -2116,10 +2116,16 @@ uint64_t vram_region_gpu_offset(struct
> > ttm_resource *res)
> > =C2=A0{
> > =C2=A0	struct xe_device *xe =3D ttm_to_xe_device(res->bo->bdev);
> > =C2=A0
> > -	if (res->mem_type =3D=3D XE_PL_STOLEN)
> > +	switch (res->mem_type) {
> > +	case XE_PL_STOLEN:
> > =C2=A0		return xe_ttm_stolen_gpu_offset(xe);
> > -
> > -	return res_to_mem_region(res)->dpa_base;
> > +	case XE_PL_TT:
> > +	case XE_PL_SYSTEM:
> > +		return 0;
> > +	default:
> > +		return res_to_mem_region(res)->dpa_base;
> > +	}
> > +	return 0;
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > b/drivers/gpu/drm/xe/xe_pt.c
> > index 9e719535a3bb..3ffe135c27f1 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -278,13 +278,15 @@ struct xe_pt_stage_bind_walk {
> > =C2=A0	struct xe_vm *vm;
> > =C2=A0	/** @tile: The tile we're building for. */
> > =C2=A0	struct xe_tile *tile;
> > -	/** @default_pte: PTE flag only template. No address is
> > associated */
> > -	u64 default_pte;
> > +	/** @default_pte: PTE flag only template for VRAM. No
> > address is associated */
> > +	u64 default_vram_pte;
> > +	/** @default_pte: PTE flag only template for VRAM. No
> > address is associated */
> > +	u64 default_system_pte;
> > =C2=A0	/** @dma_offset: DMA offset to add to the PTE. */
> > =C2=A0	u64 dma_offset;
> > =C2=A0	/**
> > =C2=A0	 * @needs_64k: This address range enforces 64K alignment
> > and
> > -	 * granularity.
> > +	 * granularity on VRAM.
> > =C2=A0	 */
> > =C2=A0	bool needs_64K;
> > =C2=A0	/**
> > @@ -515,13 +517,16 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> > pgoff_t offset,
> > =C2=A0	if (level =3D=3D 0 || xe_pt_hugepte_possible(addr, next,
> > level, xe_walk)) {
> > =C2=A0		struct xe_res_cursor *curs =3D xe_walk->curs;
> > =C2=A0		bool is_null =3D xe_vma_is_null(xe_walk->vma);
> > +		bool is_vram =3D is_null ? false :
> > xe_res_is_vram(curs);
>=20
> So xe_res_is_vram is still per range / VMA. I assume a follow on will
> change this to be per page?=20

For VMAs it's per VMA, but for ranges it's per mapped page AFAICT (at
least that's the intention).

>=20
> Patch LGTM though. With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks. Does this hold for v3 as well? (I dropped the atomic UAPI
change).

/Thomas


>=20
> > =C2=A0
> > =C2=A0		XE_WARN_ON(xe_walk->va_curs_start !=3D addr);
> > =C2=A0
> > =C2=A0		pte =3D vm->pt_ops->pte_encode_vma(is_null ? 0 :
> > =C2=A0						 xe_res_dma(curs)
> > + xe_walk->dma_offset,
> > =C2=A0						 xe_walk->vma,
> > pat_index, level);
> > -		pte |=3D xe_walk->default_pte;
> > +		if (!is_null)
> > +			pte |=3D is_vram ? xe_walk->default_vram_pte
> > :
> > +				xe_walk->default_system_pte;
> > =C2=A0
> > =C2=A0		/*
> > =C2=A0		 * Set the XE_PTE_PS64 hint if possible, otherwise
> > if
> > @@ -531,7 +536,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> > pgoff_t offset,
> > =C2=A0			if (xe_pt_is_pte_ps64K(addr, next,
> > xe_walk)) {
> > =C2=A0				xe_walk->vma->gpuva.flags |=3D
> > XE_VMA_PTE_64K;
> > =C2=A0				pte |=3D XE_PTE_PS64;
> > -			} else if (XE_WARN_ON(xe_walk->needs_64K))
> > {
> > +			} else if (XE_WARN_ON(xe_walk->needs_64K
> > && is_vram)) {
> > =C2=A0				return -EINVAL;
> > =C2=A0			}
> > =C2=A0		}
> > @@ -603,6 +608,31 @@ static const struct xe_pt_walk_ops
> > xe_pt_stage_bind_ops =3D {
> > =C2=A0	.pt_entry =3D xe_pt_stage_bind_entry,
> > =C2=A0};
> > =C2=A0
> > +/* The GPU can always to atomics in VRAM */
> > +static bool xe_atomic_for_vram(struct xe_vm *vm)
> > +{
> > +	return true;
> > +}
> > +
> > +/*
> > + * iGFX always expect to be able to do atomics in system.
> > + *
> > + * For DGFX, 3D clients want to do atomics in system that is
> > + * not coherent with CPU atomics. Compute clients want
> > + * atomics that look coherent with CPU atomics. We
> > + * distinguish the two by checking for lr mode. For
> > + * compute we then disallow atomics in system.
> > + * Compute attempts to perform atomics in system memory would
> > + * then cause an unrecoverable page-fault in preempt-fence
> > + * mode, but in fault mode the data would be migrated to VRAM
> > + * for GPU atomics and to system for CPU atomics.
> > + */
> > +static bool xe_atomic_for_system(struct xe_vm *vm)
> > +{
> > +	return (!IS_DGFX(vm->xe) || !xe_vm_in_lr_mode(vm)) &&
> > +		vm->xe->info.has_device_atomics_on_smem;
> > +}
> > +
> > =C2=A0/**
> > =C2=A0 * xe_pt_stage_bind() - Build a disconnected page-table tree for =
a
> > given address
> > =C2=A0 * range.
> > @@ -629,9 +659,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> > xe_vma *vma,
> > =C2=A0{
> > =C2=A0	struct xe_device *xe =3D tile_to_xe(tile);
> > =C2=A0	struct xe_bo *bo =3D xe_vma_bo(vma);
> > -	bool is_devmem =3D !xe_vma_is_userptr(vma) && bo &&
> > -		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
> > =C2=A0	struct xe_res_cursor curs;
> > +	struct xe_vm *vm =3D xe_vma_vm(vma);
> > =C2=A0	struct xe_pt_stage_bind_walk xe_walk =3D {
> > =C2=A0		.base =3D {
> > =C2=A0			.ops =3D &xe_pt_stage_bind_ops,
> > @@ -639,7 +668,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> > xe_vma *vma,
> > =C2=A0			.max_level =3D XE_PT_HIGHEST_LEVEL,
> > =C2=A0			.staging =3D true,
> > =C2=A0		},
> > -		.vm =3D xe_vma_vm(vma),
> > +		.vm =3D vm,
> > =C2=A0		.tile =3D tile,
> > =C2=A0		.curs =3D &curs,
> > =C2=A0		.va_curs_start =3D range ? range->base.itree.start :
> > @@ -647,26 +676,22 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> > xe_vma *vma,
> > =C2=A0		.vma =3D vma,
> > =C2=A0		.wupd.entries =3D entries,
> > =C2=A0	};
> > -	struct xe_pt *pt =3D xe_vma_vm(vma)->pt_root[tile->id];
> > +	struct xe_pt *pt =3D vm->pt_root[tile->id];
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	if (range) {
> > =C2=A0		/* Move this entire thing to xe_svm.c? */
> > -		xe_svm_notifier_lock(xe_vma_vm(vma));
> > +		xe_svm_notifier_lock(vm);
> > =C2=A0		if (!xe_svm_range_pages_valid(range)) {
> > =C2=A0			xe_svm_range_debug(range, "BIND PREPARE -
> > RETRY");
> > -			xe_svm_notifier_unlock(xe_vma_vm(vma));
> > +			xe_svm_notifier_unlock(vm);
> > =C2=A0			return -EAGAIN;
> > =C2=A0		}
> > =C2=A0		if (xe_svm_range_has_dma_mapping(range)) {
> > =C2=A0			xe_res_first_dma(range->base.dma_addr, 0,
> > =C2=A0					 range->base.itree.last +
> > 1 - range->base.itree.start,
> > =C2=A0					 &curs);
> > -			is_devmem =3D xe_res_is_vram(&curs);
> > -			if (is_devmem)
> > -				xe_svm_range_debug(range, "BIND
> > PREPARE - DMA VRAM");
> > -			else
> > -				xe_svm_range_debug(range, "BIND
> > PREPARE - DMA");
> > +			xe_svm_range_debug(range, "BIND PREPARE -
> > MIXED");
> > =C2=A0		} else {
> > =C2=A0			xe_assert(xe, false);
> > =C2=A0		}
> > @@ -674,54 +699,17 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> > xe_vma *vma,
> > =C2=A0		 * Note, when unlocking the resource cursor dma
> > addresses may become
> > =C2=A0		 * stale, but the bind will be aborted anyway at
> > commit time.
> > =C2=A0		 */
> > -		xe_svm_notifier_unlock(xe_vma_vm(vma));
> > +		xe_svm_notifier_unlock(vm);
> > =C2=A0	}
> > =C2=A0
> > -	xe_walk.needs_64K =3D (xe_vma_vm(vma)->flags &
> > XE_VM_FLAG_64K) && is_devmem;
> > -
> > -	/**
> > -	 * Default atomic expectations for different allocation
> > scenarios are as follows:
> > -	 *
> > -	 * 1. Traditional API: When the VM is not in LR mode:
> > -	 *=C2=A0=C2=A0=C2=A0 - Device atomics are expected to function with a=
ll
> > allocations.
> > -	 *
> > -	 * 2. Compute/SVM API: When the VM is in LR mode:
> > -	 *=C2=A0=C2=A0=C2=A0 - Device atomics are the default behavior when t=
he
> > bo is placed in a single region.
> > -	 *=C2=A0=C2=A0=C2=A0 - In all other cases device atomics will be disa=
bled
> > with AE=3D0 until an application
> > -	 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 request differently using a ioctl li=
ke madvise.
> > -	 */
> > +	xe_walk.needs_64K =3D (vm->flags & XE_VM_FLAG_64K);
> > =C2=A0	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
> > -		if (xe_vm_in_lr_mode(xe_vma_vm(vma))) {
> > -			if (bo && xe_bo_has_single_placement(bo))
> > -				xe_walk.default_pte |=3D
> > XE_USM_PPGTT_PTE_AE;
> > -			/**
> > -			 * If a SMEM+LMEM allocation is backed by
> > SMEM, a device
> > -			 * atomics will cause a gpu page fault and
> > which then
> > -			 * gets migrated to LMEM, bind such
> > allocations with
> > -			 * device atomics enabled.
> > -			 */
> > -			else if (is_devmem)
> > -				xe_walk.default_pte |=3D
> > XE_USM_PPGTT_PTE_AE;
> > -		} else {
> > -			xe_walk.default_pte |=3D
> > XE_USM_PPGTT_PTE_AE;
> > -		}
> > -
> > -		/**
> > -		 * Unset AE if the platform(PVC) doesn't support
> > it on an
> > -		 * allocation
> > -		 */
> > -		if (!xe->info.has_device_atomics_on_smem &&
> > !is_devmem)
> > -			xe_walk.default_pte &=3D
> > ~XE_USM_PPGTT_PTE_AE;
> > +		xe_walk.default_vram_pte =3D xe_atomic_for_vram(vm)
> > ? XE_USM_PPGTT_PTE_AE : 0;
> > +		xe_walk.default_system_pte =3D
> > xe_atomic_for_system(vm) ? XE_USM_PPGTT_PTE_AE : 0;
> > =C2=A0	}
> > =C2=A0
> > -	if (is_devmem) {
> > -		xe_walk.default_pte |=3D XE_PPGTT_PTE_DM;
> > -		xe_walk.dma_offset =3D bo ?
> > vram_region_gpu_offset(bo->ttm.resource) : 0;
> > -	}
> > -
> > -	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
> > -		xe_walk.dma_offset =3D
> > xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
> > -
> > +	xe_walk.default_vram_pte |=3D XE_PPGTT_PTE_DM;
> > +	xe_walk.dma_offset =3D bo ? vram_region_gpu_offset(bo-
> > >ttm.resource) : 0;
> > =C2=A0	if (!range)
> > =C2=A0		xe_bo_assert_held(bo);
> > =C2=A0
> > --=20
> > 2.48.1
> >=20

