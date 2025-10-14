Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22532CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 07:34:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68BD10E565;
	Tue, 14 Oct 2025 07:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DzFFdL26";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577D910E565
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 07:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760427273; x=1791963273;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/7rfaJJ+mjrQq1630gkZUGE2OTEocKKwHDf5gdDLFFI=;
 b=DzFFdL26bwEey5U3YFmPnUhzN9uBUAesa8FFdBbCGXGxT++nxU+wizT7
 znzhtYXf7/EMhLLeN+w8zeMWyBt8tLK+8qn8shMWpYpeNs+GdsOPMv9iQ
 nStz8NQIvTgvK1TK2IC1n3N46kQ0hQR6mqHcMIcXZL3VYt0gnIL908jFR
 GHPwUP4OTRniagPezu2XGNIuVJqfnc9xr0daz+kwW7ZeOrU6dpcP2TGcW
 w3/9ifw8ie23ciO2ayB3y2bevZtBmBYdIeus+9TDxtk9pXMp9O1q8N2iz
 FC3kzHButQ932wv9w8sKcQBoBNXjTEYGrZlL0f1HsVv6hWkcK96QULIXM Q==;
X-CSE-ConnectionGUID: Sct0ZRVrQlSlPCEq74c8fA==
X-CSE-MsgGUID: b6LNJvjfTvCfe57+43Eqgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="80018301"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="80018301"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:34:32 -0700
X-CSE-ConnectionGUID: S2ougH0bSeiPWK8/Vami0Q==
X-CSE-MsgGUID: UtJR3pXmSky8+nh+x3vgGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181612486"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.172])
 ([10.245.244.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:34:30 -0700
Message-ID: <3050bab3718e825ea622fc3e3954e7f3f69eda3f.camel@linux.intel.com>
Subject: Re: [RFC PATCH] drm/xe: Retain vma flags when recreating and
 splitting vmas for madvise
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Date: Tue, 14 Oct 2025 09:34:28 +0200
In-Reply-To: <aO3bczENGyIIQJDS@lstrano-desk.jf.intel.com>
References: <20251013185348.88033-1-thomas.hellstrom@linux.intel.com>
 <aO3bczENGyIIQJDS@lstrano-desk.jf.intel.com>
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

On Mon, 2025-10-13 at 22:11 -0700, Matthew Brost wrote:
> On Mon, Oct 13, 2025 at 08:53:48PM +0200, Thomas Hellstr=C3=B6m wrote:
> > When splitting and restoring vmas for madvise, we only copied the
> > XE_VMA_SYSTEM_ALLOCATOR flag. That meant we lost flags for
> > read_only,
> > dumpable and sparse (in case anyone would call madvise for the
> > latter).
> >=20
>=20
> I don't think the above flags should be possible to set / needed to
> be
> retained upon split / restore but non the less a good cleanup.

OK, I wasn't really sure of the scope of the current madvise
implementation, but at least for userptr we'd want to retain the
readonly and dumpable flags? Also we'd probably for consistency want to
honor readonly for svm vmas as well?

/Thomas


>=20
> > Instead, define a mask of relevant flags and ensure all are
> > replicated,
> > To simplify this and make the code a bit less fragile, remove the
> > conversion to VMA_CREATE flags and instead just pass around the
> > gpuva flags after initial conversion from user-space.
>=20
> Also a good cleanup. So if CI is clean:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks, I'll build the autoreset on this one then and add Fixes: on
both.

/Thomas


>=20
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 4 +-
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
86 +++++++++++-----------------
> > ----
> > =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0 9 +---
> > =C2=A03 files changed, 32 insertions(+), 67 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > b/drivers/gpu/drm/xe/xe_pt.c
> > index e39da95f3a05..d22fd1ccc0ba 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -2022,7 +2022,7 @@ static int op_prepare(struct xe_vm *vm,
> > =C2=A0	case DRM_GPUVA_OP_MAP:
> > =C2=A0		if ((!op->map.immediate && xe_vm_in_fault_mode(vm)
> > &&
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 !op->map.invalidate_on_bind) ||
> > -		=C2=A0=C2=A0=C2=A0 op->map.is_cpu_addr_mirror)
> > +		=C2=A0=C2=A0=C2=A0 (op->map.vma_flags & XE_VMA_SYSTEM_ALLOCATOR))
> > =C2=A0			break;
> > =C2=A0
> > =C2=A0		err =3D bind_op_prepare(vm, tile, pt_update_ops, op-
> > >map.vma,
> > @@ -2252,7 +2252,7 @@ static void op_commit(struct xe_vm *vm,
> > =C2=A0	switch (op->base.op) {
> > =C2=A0	case DRM_GPUVA_OP_MAP:
> > =C2=A0		if ((!op->map.immediate &&
> > xe_vm_in_fault_mode(vm)) ||
> > -		=C2=A0=C2=A0=C2=A0 op->map.is_cpu_addr_mirror)
> > +		=C2=A0=C2=A0=C2=A0 (op->map.vma_flags & XE_VMA_SYSTEM_ALLOCATOR))
> > =C2=A0			break;
> > =C2=A0
> > =C2=A0		bind_op_commit(vm, tile, pt_update_ops, op-
> > >map.vma, fence,
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index 179758ca7cb8..9c29608aa3bc 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -642,6 +642,12 @@ static void
> > xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8
> > tile_mask,
> > =C2=A0			vops->pt_update_ops[i].num_ops +=3D inc_val;
> > =C2=A0}
> > =C2=A0
> > +#define XE_VMA_CREATE_MASK (		=C2=A0=C2=A0=C2=A0 \
> > +	XE_VMA_READ_ONLY |		=C2=A0=C2=A0=C2=A0 \
> > +	XE_VMA_DUMPABLE |		=C2=A0=C2=A0=C2=A0 \
> > +	XE_VMA_SYSTEM_ALLOCATOR |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
> > +	DRM_GPUVA_SPARSE)
> > +
> > =C2=A0static void xe_vm_populate_rebind(struct xe_vma_op *op, struct
> > xe_vma *vma,
> > =C2=A0				=C2=A0 u8 tile_mask)
> > =C2=A0{
> > @@ -654,8 +660,7 @@ static void xe_vm_populate_rebind(struct
> > xe_vma_op *op, struct xe_vma *vma,
> > =C2=A0	op->base.map.gem.offset =3D vma->gpuva.gem.offset;
> > =C2=A0	op->map.vma =3D vma;
> > =C2=A0	op->map.immediate =3D true;
> > -	op->map.dumpable =3D vma->gpuva.flags & XE_VMA_DUMPABLE;
> > -	op->map.is_null =3D xe_vma_is_null(vma);
> > +	op->map.vma_flags =3D vma->gpuva.flags & XE_VMA_CREATE_MASK;
> > =C2=A0}
> > =C2=A0
> > =C2=A0static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct
> > xe_vma *vma,
> > @@ -958,11 +963,6 @@ static void xe_vma_free(struct xe_vma *vma)
> > =C2=A0		kfree(vma);
> > =C2=A0}
> > =C2=A0
> > -#define VMA_CREATE_FLAG_READ_ONLY		BIT(0)
> > -#define VMA_CREATE_FLAG_IS_NULL			BIT(1)
> > -#define VMA_CREATE_FLAG_DUMPABLE		BIT(2)
> > -#define VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR	BIT(3)
> > -
> > =C2=A0static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> > =C2=A0				=C2=A0=C2=A0=C2=A0 struct xe_bo *bo,
> > =C2=A0				=C2=A0=C2=A0=C2=A0 u64 bo_offset_or_userptr,
> > @@ -973,11 +973,8 @@ static struct xe_vma *xe_vma_create(struct
> > xe_vm *vm,
> > =C2=A0	struct xe_vma *vma;
> > =C2=A0	struct xe_tile *tile;
> > =C2=A0	u8 id;
> > -	bool read_only =3D (flags & VMA_CREATE_FLAG_READ_ONLY);
> > -	bool is_null =3D (flags & VMA_CREATE_FLAG_IS_NULL);
> > -	bool dumpable =3D (flags & VMA_CREATE_FLAG_DUMPABLE);
> > -	bool is_cpu_addr_mirror =3D
> > -		(flags & VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR);
> > +	bool is_null =3D (flags & DRM_GPUVA_SPARSE);
> > +	bool is_cpu_addr_mirror =3D (flags &
> > XE_VMA_SYSTEM_ALLOCATOR);
> > =C2=A0
> > =C2=A0	xe_assert(vm->xe, start < end);
> > =C2=A0	xe_assert(vm->xe, end < vm->size);
> > @@ -998,10 +995,6 @@ static struct xe_vma *xe_vma_create(struct
> > xe_vm *vm,
> > =C2=A0		if (!vma)
> > =C2=A0			return ERR_PTR(-ENOMEM);
> > =C2=A0
> > -		if (is_cpu_addr_mirror)
> > -			vma->gpuva.flags |=3D
> > XE_VMA_SYSTEM_ALLOCATOR;
> > -		if (is_null)
> > -			vma->gpuva.flags |=3D DRM_GPUVA_SPARSE;
> > =C2=A0		if (bo)
> > =C2=A0			vma->gpuva.gem.obj =3D &bo->ttm.base;
> > =C2=A0	}
> > @@ -1012,10 +1005,7 @@ static struct xe_vma *xe_vma_create(struct
> > xe_vm *vm,
> > =C2=A0	vma->gpuva.vm =3D &vm->gpuvm;
> > =C2=A0	vma->gpuva.va.addr =3D start;
> > =C2=A0	vma->gpuva.va.range =3D end - start + 1;
> > -	if (read_only)
> > -		vma->gpuva.flags |=3D XE_VMA_READ_ONLY;
> > -	if (dumpable)
> > -		vma->gpuva.flags |=3D XE_VMA_DUMPABLE;
> > +	vma->gpuva.flags =3D flags;
> > =C2=A0
> > =C2=A0	for_each_tile(tile, vm->xe, id)
> > =C2=A0		vma->tile_mask |=3D 0x1 << id;
> > @@ -2298,12 +2288,14 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm,
> > struct xe_vma_ops *vops,
> > =C2=A0		if (__op->op =3D=3D DRM_GPUVA_OP_MAP) {
> > =C2=A0			op->map.immediate =3D
> > =C2=A0				flags &
> > DRM_XE_VM_BIND_FLAG_IMMEDIATE;
> > -			op->map.read_only =3D
> > -				flags &
> > DRM_XE_VM_BIND_FLAG_READONLY;
> > -			op->map.is_null =3D flags &
> > DRM_XE_VM_BIND_FLAG_NULL;
> > -			op->map.is_cpu_addr_mirror =3D flags &
> > -
> > 				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
> > -			op->map.dumpable =3D flags &
> > DRM_XE_VM_BIND_FLAG_DUMPABLE;
> > +			if (flags & DRM_XE_VM_BIND_FLAG_READONLY)
> > +				op->map.vma_flags |=3D
> > XE_VMA_READ_ONLY;
> > +			if (flags & DRM_XE_VM_BIND_FLAG_NULL)
> > +				op->map.vma_flags |=3D
> > DRM_GPUVA_SPARSE;
> > +			if (flags &
> > DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
> > +				op->map.vma_flags |=3D
> > XE_VMA_SYSTEM_ALLOCATOR;
> > +			if (flags & DRM_XE_VM_BIND_FLAG_DUMPABLE)
> > +				op->map.vma_flags |=3D
> > XE_VMA_DUMPABLE;
> > =C2=A0			op->map.pat_index =3D pat_index;
> > =C2=A0			op->map.invalidate_on_bind =3D
> > =C2=A0				__xe_vm_needs_clear_scratch_pages(
> > vm, flags);
> > @@ -2616,14 +2608,7 @@ static int vm_bind_ioctl_ops_parse(struct
> > xe_vm *vm, struct drm_gpuva_ops *ops,
> > =C2=A0				.pat_index =3D op->map.pat_index,
> > =C2=A0			};
> > =C2=A0
> > -			flags |=3D op->map.read_only ?
> > -				VMA_CREATE_FLAG_READ_ONLY : 0;
> > -			flags |=3D op->map.is_null ?
> > -				VMA_CREATE_FLAG_IS_NULL : 0;
> > -			flags |=3D op->map.dumpable ?
> > -				VMA_CREATE_FLAG_DUMPABLE : 0;
> > -			flags |=3D op->map.is_cpu_addr_mirror ?
> > -
> > 				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
> > +			flags |=3D op->map.vma_flags &
> > XE_VMA_CREATE_MASK;
> > =C2=A0
> > =C2=A0			vma =3D new_vma(vm, &op->base.map,
> > &default_attr,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags);
> > @@ -2632,7 +2617,7 @@ static int vm_bind_ioctl_ops_parse(struct
> > xe_vm *vm, struct drm_gpuva_ops *ops,
> > =C2=A0
> > =C2=A0			op->map.vma =3D vma;
> > =C2=A0			if (((op->map.immediate ||
> > !xe_vm_in_fault_mode(vm)) &&
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 !op->map.is_cpu_addr_mirror) ||
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 !(op->map.vma_flags &
> > XE_VMA_SYSTEM_ALLOCATOR)) ||
> > =C2=A0			=C2=A0=C2=A0=C2=A0 op->map.invalidate_on_bind)
> > =C2=A0				xe_vma_ops_incr_pt_update_ops(vops
> > ,
> > =C2=A0							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 op-
> > >tile_mask, 1);
> > @@ -2663,18 +2648,7 @@ static int vm_bind_ioctl_ops_parse(struct
> > xe_vm *vm, struct drm_gpuva_ops *ops,
> > =C2=A0			op->remap.start =3D xe_vma_start(old);
> > =C2=A0			op->remap.range =3D xe_vma_size(old);
> > =C2=A0
> > -			flags |=3D op->base.remap.unmap->va->flags &
> > -				XE_VMA_READ_ONLY ?
> > -				VMA_CREATE_FLAG_READ_ONLY : 0;
> > -			flags |=3D op->base.remap.unmap->va->flags &
> > -				DRM_GPUVA_SPARSE ?
> > -				VMA_CREATE_FLAG_IS_NULL : 0;
> > -			flags |=3D op->base.remap.unmap->va->flags &
> > -				XE_VMA_DUMPABLE ?
> > -				VMA_CREATE_FLAG_DUMPABLE : 0;
> > -			flags |=3D xe_vma_is_cpu_addr_mirror(old) ?
> > -
> > 				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
> > -
> > +			flags |=3D op->base.remap.unmap->va->flags &
> > XE_VMA_CREATE_MASK;
> > =C2=A0			if (op->base.remap.prev) {
> > =C2=A0				vma =3D new_vma(vm, op-
> > >base.remap.prev,
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &old->attr, flags);
> > @@ -4238,7 +4212,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
> > =C2=A0	struct xe_vma_ops vops;
> > =C2=A0	struct drm_gpuva_ops *ops =3D NULL;
> > =C2=A0	struct drm_gpuva_op *__op;
> > -	bool is_cpu_addr_mirror =3D false;
> > +	unsigned int vma_flags =3D 0;
> > =C2=A0	bool remap_op =3D false;
> > =C2=A0	struct xe_vma_mem_attr tmp_attr;
> > =C2=A0	u16 default_pat;
> > @@ -4268,15 +4242,17 @@ static int xe_vm_alloc_vma(struct xe_vm
> > *vm,
> > =C2=A0				vma =3D gpuva_to_vma(op-
> > >base.unmap.va);
> > =C2=A0				XE_WARN_ON(!xe_vma_has_default_mem
> > _attrs(vma));
> > =C2=A0				default_pat =3D vma-
> > >attr.default_pat_index;
> > +				vma_flags =3D vma->gpuva.flags;
> > =C2=A0			}
> > =C2=A0
> > =C2=A0			if (__op->op =3D=3D DRM_GPUVA_OP_REMAP) {
> > =C2=A0				vma =3D gpuva_to_vma(op-
> > >base.remap.unmap->va);
> > =C2=A0				default_pat =3D vma-
> > >attr.default_pat_index;
> > +				vma_flags =3D vma->gpuva.flags;
> > =C2=A0			}
> > =C2=A0
> > =C2=A0			if (__op->op =3D=3D DRM_GPUVA_OP_MAP) {
> > -				op->map.is_cpu_addr_mirror =3D true;
> > +				op->map.vma_flags |=3D vma_flags &
> > XE_VMA_CREATE_MASK;
> > =C2=A0				op->map.pat_index =3D default_pat;
> > =C2=A0			}
> > =C2=A0		} else {
> > @@ -4285,11 +4261,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
> > =C2=A0				xe_assert(vm->xe, !remap_op);
> > =C2=A0				xe_assert(vm->xe,
> > xe_vma_has_no_bo(vma));
> > =C2=A0				remap_op =3D true;
> > -
> > -				if
> > (xe_vma_is_cpu_addr_mirror(vma))
> > -					is_cpu_addr_mirror =3D true;
> > -				else
> > -					is_cpu_addr_mirror =3D
> > false;
> > +				vma_flags =3D vma->gpuva.flags;
> > =C2=A0			}
> > =C2=A0
> > =C2=A0			if (__op->op =3D=3D DRM_GPUVA_OP_MAP) {
> > @@ -4298,10 +4270,10 @@ static int xe_vm_alloc_vma(struct xe_vm
> > *vm,
> > =C2=A0				/*
> > =C2=A0				 * In case of madvise ops
> > DRM_GPUVA_OP_MAP is
> > =C2=A0				 * always after
> > DRM_GPUVA_OP_REMAP, so ensure
> > -				 * we assign op-
> > >map.is_cpu_addr_mirror true
> > -				 * if REMAP is for
> > xe_vma_is_cpu_addr_mirror vma
> > +				 * to propagate the flags from the
> > vma we're
> > +				 * unmapping.
> > =C2=A0				 */
> > -				op->map.is_cpu_addr_mirror =3D
> > is_cpu_addr_mirror;
> > +				op->map.vma_flags |=3D vma_flags &
> > XE_VMA_CREATE_MASK;
> > =C2=A0			}
> > =C2=A0		}
> > =C2=A0		print_op(vm->xe, __op);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 413353e1c225..a3b422b27ae8 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -345,17 +345,10 @@ struct xe_vm {
> > =C2=A0struct xe_vma_op_map {
> > =C2=A0	/** @vma: VMA to map */
> > =C2=A0	struct xe_vma *vma;
> > +	unsigned int vma_flags;
> > =C2=A0	/** @immediate: Immediate bind */
> > =C2=A0	bool immediate;
> > =C2=A0	/** @read_only: Read only */
> > -	bool read_only;
> > -	/** @is_null: is NULL binding */
> > -	bool is_null;
> > -	/** @is_cpu_addr_mirror: is CPU address mirror binding */
> > -	bool is_cpu_addr_mirror;
> > -	/** @dumpable: whether BO is dumped on GPU hang */
> > -	bool dumpable;
> > -	/** @invalidate: invalidate the VMA before bind */
> > =C2=A0	bool invalidate_on_bind;
> > =C2=A0	/** @pat_index: The pat index to use for this operation.
> > */
> > =C2=A0	u16 pat_index;
> > --=20
> > 2.51.0
> >=20

