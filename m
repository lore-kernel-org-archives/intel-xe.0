Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A949CCD185
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 12:34:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA56910EA14;
	Thu,  9 Oct 2025 12:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="beoZar0F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8B010EA14
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 12:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760013248; x=1791549248;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=W5sw7ONYTArPVgwyI1SNddSFxg1k65Th2TPHoKztgm0=;
 b=beoZar0FFPzCJ3GcIhHoNjHf4PZWyYTWLQrqgle7QaEjvUGL7FjPBI8W
 r6AewPeTlLlhJI3ayRWpFilkaUkbJnWpKGlbMyu+F0Iy0d3+/6dAUrDgP
 oXt+W3vqhDZcTnwe7dEikOUUNO0KLRMNL/r5IlKHfymemsnbN7RNBahDM
 p9wWwpy/GAkuEJsZv8FaKUYST7eVmTBMIhfu8Wzu7Y1g9022KO0bi1xVn
 Dl2t/YWPCUIptDrn0gm3uq0Ue0x9kCV74V/4bdoxUvEMsLe1NYiJzh3Rk
 x4SF30wg5sRRqqsX6UgTp7YNy+lWAT1Gy2/MUjLCMalKlx/N691aeMcE0 A==;
X-CSE-ConnectionGUID: EL0RcM7ZS9KfvAsQjkf0PQ==
X-CSE-MsgGUID: W+Ss7xJ8QESL6al5to7jiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="72902498"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="72902498"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 05:34:08 -0700
X-CSE-ConnectionGUID: NHwgFz82Spu0vFBMGcQ+yQ==
X-CSE-MsgGUID: f3e/Ez7vR4O14pViQ+4oeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="211341745"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.245.27])
 ([10.245.245.27])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 05:34:06 -0700
Message-ID: <a0b09207528eabc4062b9e1c213826f7bf8b58ab.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: Don't allow evicting of BOs in same VM in
 array of VM binds
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: paulo.r.zanoni@intel.com
Date: Thu, 09 Oct 2025 14:34:04 +0200
In-Reply-To: <20251009110618.3481870-1-matthew.brost@intel.com>
References: <20251009110618.3481870-1-matthew.brost@intel.com>
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

On Thu, 2025-10-09 at 04:06 -0700, Matthew Brost wrote:
> An array of VM binds can potentially evict other buffer objects (BOs)
> within the same VM under certain conditions, which may lead to NULL
> pointer dereferences later in the bind pipeline. To prevent this,
> clear
> the allow_res_evict flag in the xe_bo_validate call.
>=20
> v2:
> =C2=A0- Invert polarity of no_res_evict (Thomas)
> =C2=A0- Add comment in code explaining issue (Thomas)
>=20

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> Cc: stable@vger.kernel.org
> Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6268
> Fixes: 774b5fa509a9 ("drm/xe: Avoid evicting object of the same vm in
> none fault mode")
> Fixes: 77f2ef3f16f5 ("drm/xe: Lock all gpuva ops during VM bind
> IOCTL")
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> GPUs")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Tested-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 33=
 +++++++++++++++++++++++-------
> --
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0 1 +
> =C2=A02 files changed, 25 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index faca626702b8..ede9cc6ff079 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2858,7 +2858,7 @@ static void vm_bind_ioctl_ops_unwind(struct
> xe_vm *vm,
> =C2=A0}
> =C2=A0
> =C2=A0static int vma_lock_and_validate(struct drm_exec *exec, struct
> xe_vma *vma,
> -				 bool validate)
> +				 bool res_evict, bool validate)
> =C2=A0{
> =C2=A0	struct xe_bo *bo =3D xe_vma_bo(vma);
> =C2=A0	struct xe_vm *vm =3D xe_vma_vm(vma);
> @@ -2869,7 +2869,8 @@ static int vma_lock_and_validate(struct
> drm_exec *exec, struct xe_vma *vma,
> =C2=A0			err =3D drm_exec_lock_obj(exec, &bo-
> >ttm.base);
> =C2=A0		if (!err && validate)
> =C2=A0			err =3D xe_bo_validate(bo, vm,
> -					=C2=A0=C2=A0=C2=A0=C2=A0
> !xe_vm_in_preempt_fence_mode(vm), exec);
> +					=C2=A0=C2=A0=C2=A0=C2=A0
> !xe_vm_in_preempt_fence_mode(vm) &&
> +					=C2=A0=C2=A0=C2=A0=C2=A0 res_evict, exec);
> =C2=A0	}
> =C2=A0
> =C2=A0	return err;
> @@ -2939,14 +2940,24 @@ static int prefetch_ranges(struct xe_vm *vm,
> struct xe_vma_op *op)
> =C2=A0}
> =C2=A0
> =C2=A0static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm=
,
> -			=C2=A0=C2=A0=C2=A0 struct xe_vma_op *op)
> +			=C2=A0=C2=A0=C2=A0 struct xe_vma_ops *vops, struct
> xe_vma_op *op)
> =C2=A0{
> =C2=A0	int err =3D 0;
> +	bool res_evict;
> +
> +
> +	/*
> +	 * We only allow evicting a BO within the VM if it is not
> part of an
> +	 * array of binds, as an array of binds can evict another BO
> within the
> +	 * bind.
> +	 */
> +	res_evict =3D !(vops->flags & XE_VMA_OPS_ARRAY_OF_BINDS);
> =C2=A0
> =C2=A0	switch (op->base.op) {
> =C2=A0	case DRM_GPUVA_OP_MAP:
> =C2=A0		if (!op->map.invalidate_on_bind)
> =C2=A0			err =3D vma_lock_and_validate(exec, op-
> >map.vma,
> +						=C2=A0=C2=A0=C2=A0 res_evict,
> =C2=A0						=C2=A0=C2=A0=C2=A0
> !xe_vm_in_fault_mode(vm) ||
> =C2=A0						=C2=A0=C2=A0=C2=A0 op-
> >map.immediate);
> =C2=A0		break;
> @@ -2957,11 +2968,13 @@ static int op_lock_and_prep(struct drm_exec
> *exec, struct xe_vm *vm,
> =C2=A0
> =C2=A0		err =3D vma_lock_and_validate(exec,
> =C2=A0					=C2=A0=C2=A0=C2=A0 gpuva_to_vma(op-
> >base.remap.unmap->va),
> -					=C2=A0=C2=A0=C2=A0 false);
> +					=C2=A0=C2=A0=C2=A0 res_evict, false);
> =C2=A0		if (!err && op->remap.prev)
> -			err =3D vma_lock_and_validate(exec, op-
> >remap.prev, true);
> +			err =3D vma_lock_and_validate(exec, op-
> >remap.prev,
> +						=C2=A0=C2=A0=C2=A0 res_evict,
> true);
> =C2=A0		if (!err && op->remap.next)
> -			err =3D vma_lock_and_validate(exec, op-
> >remap.next, true);
> +			err =3D vma_lock_and_validate(exec, op-
> >remap.next,
> +						=C2=A0=C2=A0=C2=A0 res_evict,
> true);
> =C2=A0		break;
> =C2=A0	case DRM_GPUVA_OP_UNMAP:
> =C2=A0		err =3D check_ufence(gpuva_to_vma(op->base.unmap.va));
> @@ -2970,7 +2983,7 @@ static int op_lock_and_prep(struct drm_exec
> *exec, struct xe_vm *vm,
> =C2=A0
> =C2=A0		err =3D vma_lock_and_validate(exec,
> =C2=A0					=C2=A0=C2=A0=C2=A0 gpuva_to_vma(op-
> >base.unmap.va),
> -					=C2=A0=C2=A0=C2=A0 false);
> +					=C2=A0=C2=A0=C2=A0 res_evict, false);
> =C2=A0		break;
> =C2=A0	case DRM_GPUVA_OP_PREFETCH:
> =C2=A0	{
> @@ -2985,7 +2998,7 @@ static int op_lock_and_prep(struct drm_exec
> *exec, struct xe_vm *vm,
> =C2=A0
> =C2=A0		err =3D vma_lock_and_validate(exec,
> =C2=A0					=C2=A0=C2=A0=C2=A0 gpuva_to_vma(op-
> >base.prefetch.va),
> -					=C2=A0=C2=A0=C2=A0 false);
> +					=C2=A0=C2=A0=C2=A0 res_evict, false);
> =C2=A0		if (!err && !xe_vma_has_no_bo(vma))
> =C2=A0			err =3D xe_bo_migrate(xe_vma_bo(vma),
> =C2=A0					=C2=A0=C2=A0=C2=A0
> region_to_mem_type[region],
> @@ -3031,7 +3044,7 @@ static int
> vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
> =C2=A0		return err;
> =C2=A0
> =C2=A0	list_for_each_entry(op, &vops->list, link) {
> -		err =3D op_lock_and_prep(exec, vm, op);
> +		err =3D op_lock_and_prep(exec, vm, vops, op);
> =C2=A0		if (err)
> =C2=A0			return err;
> =C2=A0	}
> @@ -3664,6 +3677,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
> =C2=A0	}
> =C2=A0
> =C2=A0	xe_vma_ops_init(&vops, vm, q, syncs, num_syncs);
> +	if (args->num_binds > 1)
> +		vops.flags |=3D XE_VMA_OPS_ARRAY_OF_BINDS;
> =C2=A0	for (i =3D 0; i < args->num_binds; ++i) {
> =C2=A0		u64 range =3D bind_ops[i].range;
> =C2=A0		u64 addr =3D bind_ops[i].addr;
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index da39940501d8..413353e1c225 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -476,6 +476,7 @@ struct xe_vma_ops {
> =C2=A0	/** @flag: signify the properties within xe_vma_ops*/
> =C2=A0#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
> =C2=A0#define XE_VMA_OPS_FLAG_MADVISE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(1)
> +#define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
> =C2=A0	u32 flags;
> =C2=A0#ifdef TEST_VM_OPS_ERROR
> =C2=A0	/** @inject_error: inject error to test error handling */

