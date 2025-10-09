Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421DCCCD187
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 09:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D0B10E201;
	Thu,  9 Oct 2025 09:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G+c3MYq0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC7010E201
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 09:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760003354; x=1791539354;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=ZyRuonkxt2ucdgPKGbQwpejydJyf/DeBN/bUI0gjBBA=;
 b=G+c3MYq0V940SQrHI0yO7nxjHZT8ahDWWIfBru85TnczzzqOb96xwj13
 0McFEwLtkpgiIrDnKvui/X4bV5K5Ke/xwVsEtbmpFdHfajs1HNswRUHJ0
 wwigulwf1aHJQ5HHMhJ08sdCexVyIBx2FaPstvzLqDsXeF9K6l7qQ0vXD
 2LfrVxZkJzbUtrjfPsSull5kGP16GvklVwlyHcbJiQ+YF6UWTL1Ki4uZG
 biTcHEy8f0029NvnaX2/MtXFTPoVhM14W+BelwZIeviINkGuG7dUNr6Q/
 WHwWKsLVB/pAg1yFUZT1xOeRRyslCmb2DYEbD3Oe4TZlwApV0WtJji61l g==;
X-CSE-ConnectionGUID: ZL6HvmOUQiqlg6TK861Idw==
X-CSE-MsgGUID: bVHK+emRTXSeo06rpyL90Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62150844"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62150844"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 02:49:14 -0700
X-CSE-ConnectionGUID: kWuuVNfWT9+8gLdEx6G4wQ==
X-CSE-MsgGUID: y2nf1SdHQUK21JpwvYP2kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="179924583"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.245.27])
 ([10.245.245.27])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 02:49:13 -0700
Message-ID: <68a5d384d2c1bfca3cd6fb11a31cd0e19b62cb19.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Don't allow evicting of BOs in same VM in array
 of VM binds
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>, 
 "intel-xe@lists.freedesktop.org"	 <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
Date: Thu, 09 Oct 2025 11:49:10 +0200
In-Reply-To: <5f3936a32079971fa490b1dccfd69d2558df7aaf.camel@intel.com>
References: <20251008200051.3423684-1-matthew.brost@intel.com>
 <5f3936a32079971fa490b1dccfd69d2558df7aaf.camel@intel.com>
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

On Wed, 2025-10-08 at 22:52 +0000, Zanoni, Paulo R wrote:
> On Wed, 2025-10-08 at 13:00 -0700, Matthew Brost wrote:
> > An array of VM binds can potentially evict other buffer objects
> > (BOs)
> > within the same VM under certain conditions, which may lead to NULL
> > pointer dereferences later in the bind pipeline. To prevent this,
> > clear
> > the allow_res_evict flag in the xe_bo_validate call.
> >=20
> > Cc: stable@vger.kernel.org
> > Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6268
>=20
> I can confirm it fixes the issue for me. Thanks!!
>=20
> I did some quick testing, but everything still seems to work, so feel
> free to add:
> Tested-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
>=20
>=20
> > Fixes: 774b5fa509a9 ("drm/xe: Avoid evicting object of the same vm
> > in none fault mode")
> > Fixes: 77f2ef3f16f5 ("drm/xe: Lock all gpuva ops during VM bind
> > IOCTL")
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> > GPUs")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
25 ++++++++++++++++---------
> > =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0 1 +
> > =C2=A02 files changed, 17 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index 4e914928e0a9..468176cf901e 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2834,7 +2834,7 @@ static void vm_bind_ioctl_ops_unwind(struct
> > xe_vm *vm,
> > =C2=A0}
> > =C2=A0
> > =C2=A0static int vma_lock_and_validate(struct drm_exec *exec, struct
> > xe_vma *vma,
> > -				 bool validate)
> > +				 bool no_res_evict, bool validate)

Perhaps call this allow_res_evict to avoid negating later.

> > =C2=A0{
> > =C2=A0	struct xe_bo *bo =3D xe_vma_bo(vma);
> > =C2=A0	struct xe_vm *vm =3D xe_vma_vm(vma);
> > @@ -2845,7 +2845,8 @@ static int vma_lock_and_validate(struct
> > drm_exec *exec, struct xe_vma *vma,
> > =C2=A0			err =3D drm_exec_lock_obj(exec, &bo-
> > >ttm.base);
> > =C2=A0		if (!err && validate)
> > =C2=A0			err =3D xe_bo_validate(bo, vm,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0
> > !xe_vm_in_preempt_fence_mode(vm), exec);
> > +					=C2=A0=C2=A0=C2=A0=C2=A0
> > !xe_vm_in_preempt_fence_mode(vm) &&
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 !no_res_evict, exec);
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	return err;
> > @@ -2915,14 +2916,16 @@ static int prefetch_ranges(struct xe_vm
> > *vm, struct xe_vma_op *op)
> > =C2=A0}
> > =C2=A0
> > =C2=A0static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm
> > *vm,
> > -			=C2=A0=C2=A0=C2=A0 struct xe_vma_op *op)
> > +			=C2=A0=C2=A0=C2=A0 struct xe_vma_ops *vops, struct
> > xe_vma_op *op)
> > =C2=A0{
> > =C2=A0	int err =3D 0;
> > +	bool no_res_evict =3D vops->flags &
> > XE_VMA_OPS_ARRAY_OF_BINDS;

For a future reader it may not be clear why this restriction is done.
Can you add a short description for future reference?

Otherwise LGTM.

Moving forward, we should find time to change the blocking of same-vm
evictions to take place in eviction_valuable(). Because at least in
exec we'd want to be able to evict local bos that are not bound to the
VM, but in that case still need to figure out how to handle bos about
to be bound.

/Thomas


> > =C2=A0
> > =C2=A0	switch (op->base.op) {
> > =C2=A0	case DRM_GPUVA_OP_MAP:
> > =C2=A0		if (!op->map.invalidate_on_bind)
> > =C2=A0			err =3D vma_lock_and_validate(exec, op-
> > >map.vma,
> > +						=C2=A0=C2=A0=C2=A0 no_res_evict,
> > =C2=A0						=C2=A0=C2=A0=C2=A0
> > !xe_vm_in_fault_mode(vm) ||
> > =C2=A0						=C2=A0=C2=A0=C2=A0 op-
> > >map.immediate);
> > =C2=A0		break;
> > @@ -2933,11 +2936,13 @@ static int op_lock_and_prep(struct drm_exec
> > *exec, struct xe_vm *vm,
> > =C2=A0
> > =C2=A0		err =3D vma_lock_and_validate(exec,
> > =C2=A0					=C2=A0=C2=A0=C2=A0 gpuva_to_vma(op-
> > >base.remap.unmap->va),
> > -					=C2=A0=C2=A0=C2=A0 false);
> > +					=C2=A0=C2=A0=C2=A0 no_res_evict, false);
> > =C2=A0		if (!err && op->remap.prev)
> > -			err =3D vma_lock_and_validate(exec, op-
> > >remap.prev, true);
> > +			err =3D vma_lock_and_validate(exec, op-
> > >remap.prev,
> > +						=C2=A0=C2=A0=C2=A0 no_res_evict,
> > true);
> > =C2=A0		if (!err && op->remap.next)
> > -			err =3D vma_lock_and_validate(exec, op-
> > >remap.next, true);
> > +			err =3D vma_lock_and_validate(exec, op-
> > >remap.next,
> > +						=C2=A0=C2=A0=C2=A0 no_res_evict,
> > true);
> > =C2=A0		break;
> > =C2=A0	case DRM_GPUVA_OP_UNMAP:
> > =C2=A0		err =3D check_ufence(gpuva_to_vma(op-
> > >base.unmap.va));
> > @@ -2946,7 +2951,7 @@ static int op_lock_and_prep(struct drm_exec
> > *exec, struct xe_vm *vm,
> > =C2=A0
> > =C2=A0		err =3D vma_lock_and_validate(exec,
> > =C2=A0					=C2=A0=C2=A0=C2=A0 gpuva_to_vma(op-
> > >base.unmap.va),
> > -					=C2=A0=C2=A0=C2=A0 false);
> > +					=C2=A0=C2=A0=C2=A0 no_res_evict, false);
> > =C2=A0		break;
> > =C2=A0	case DRM_GPUVA_OP_PREFETCH:
> > =C2=A0	{
> > @@ -2961,7 +2966,7 @@ static int op_lock_and_prep(struct drm_exec
> > *exec, struct xe_vm *vm,
> > =C2=A0
> > =C2=A0		err =3D vma_lock_and_validate(exec,
> > =C2=A0					=C2=A0=C2=A0=C2=A0 gpuva_to_vma(op-
> > >base.prefetch.va),
> > -					=C2=A0=C2=A0=C2=A0 false);
> > +					=C2=A0=C2=A0=C2=A0 no_res_evict, false);
> > =C2=A0		if (!err && !xe_vma_has_no_bo(vma))
> > =C2=A0			err =3D xe_bo_migrate(xe_vma_bo(vma),
> > =C2=A0					=C2=A0=C2=A0=C2=A0
> > region_to_mem_type[region],
> > @@ -3007,7 +3012,7 @@ static int
> > vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
> > =C2=A0		return err;
> > =C2=A0
> > =C2=A0	list_for_each_entry(op, &vops->list, link) {
> > -		err =3D op_lock_and_prep(exec, vm, op);
> > +		err =3D op_lock_and_prep(exec, vm, vops, op);
> > =C2=A0		if (err)
> > =C2=A0			return err;
> > =C2=A0	}
> > @@ -3640,6 +3645,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	xe_vma_ops_init(&vops, vm, q, syncs, num_syncs);
> > +	if (args->num_binds > 1)
> > +		vops.flags |=3D XE_VMA_OPS_ARRAY_OF_BINDS;
> > =C2=A0	for (i =3D 0; i < args->num_binds; ++i) {
> > =C2=A0		u64 range =3D bind_ops[i].range;
> > =C2=A0		u64 addr =3D bind_ops[i].addr;
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index da39940501d8..413353e1c225 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -476,6 +476,7 @@ struct xe_vma_ops {
> > =C2=A0	/** @flag: signify the properties within xe_vma_ops*/
> > =C2=A0#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
> > =C2=A0#define XE_VMA_OPS_FLAG_MADVISE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(1)
> > +#define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
> > =C2=A0	u32 flags;
> > =C2=A0#ifdef TEST_VM_OPS_ERROR
> > =C2=A0	/** @inject_error: inject error to test error handling */

