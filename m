Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4C8C10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 12:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16F910F51A;
	Mon,  6 May 2024 12:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XEVESffQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D461810F51A
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 12:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714998608; x=1746534608;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Ts12cyxGJ4S0Yo99OwiRI/r7cs1zjx83vmKKrI1JNO4=;
 b=XEVESffQkJ/j7qYmnnRlh4W5W22ybayIMm2osFnXf7RuBul0EIcdZZbG
 8uI35/H4tNbbuzBrF9b5A5meHoFnfhY7mwOqFJ2VEsyzOmKjk97lEZzCx
 fO1e2n+ytjlbN07XtPmFggm6vMTHap7FLy22iPMSSTbdh6iv9u9sDH1/0
 E/CMI90DoYe6aMlH6kNKeiuOyGhbPxw/CYkZfFilKBUp/21FPRaimS8um
 wZkW7LZgxSK/TQUe9e2PjHCuPfpb8T6M0eQsH94IW6q0JuMibn+uxHPJo
 YqBvN7f/wwWSzwKmCK0Dt/Fvg1NZCj3w4pmcJW/JbhS27uu+1UQUrL3k/ Q==;
X-CSE-ConnectionGUID: Kaz0m1fiSjiGbOX9FfVQNA==
X-CSE-MsgGUID: ICfxLY6zTNyfkgoTQA1IOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="28266115"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28266115"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 05:30:08 -0700
X-CSE-ConnectionGUID: CVviUi4mTm+4ICqvRLBVPw==
X-CSE-MsgGUID: XfVgiG+rRtSZPOhUTThvpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28551492"
Received: from unknown (HELO [10.245.245.120]) ([10.245.245.120])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 05:30:06 -0700
Message-ID: <e0106194140f1801232744002779b6fa51af6fa4.camel@linux.intel.com>
Subject: Re: [PATCH 4/7] drm/xe: Relax runtime pm protection around VM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, matthew.brost@intel.com, 
 francois.dugast@intel.com, matthew.auld@intel.com, anshuman.gupta@intel.com
Date: Mon, 06 May 2024 14:30:03 +0200
In-Reply-To: <20240503191309.7022-5-rodrigo.vivi@intel.com>
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
 <20240503191309.7022-5-rodrigo.vivi@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

Hi, Rodrigo.

On Fri, 2024-05-03 at 15:13 -0400, Rodrigo Vivi wrote:
> In the regular use case scenario, user space will create a
> VM, and keep it alive for the entire duration of its workload.
>=20
> For the regular desktop cases, it means that the VM
> is alive even on idle scenarios where display goes off. This
> is unacceptable since this would entirely block runtime PM
> indefinitely, blocking deeper Package-C state. This would be
> a waste drainage of power.
>=20
> So, let's limit the protection only for the long running workloads,
> which memory might be mapped and accessed during this entire
> workload.
>=20
> This indeed opens up a risk of use case without display, and
> without long-running workload, where memory might be mapped
> and accessed with direct read and write operations without
> any gpu execution involved. Because of this, we are also
> adding here, the extra protection for the special vm_op access
> callback.

A couple of ignorant questions:

Why aren't the runtime_pm get / put in xe_sched_job_create() /
destroy() sufficient also for LR vms? If not, could the vm deactivation
/ reactivation be used for this (see xe_vm_reactivate_rebind)

>=20
> In the ideal case of the mmapped scenario of vm_ops, we would
> also get references in the 'open' and 'mmap' callbacks, and
> put it back on the 'close' callback, for a balanced case.
> However, this would also block the regular desktop case, so
> we are not doing this.

I'm not completely following here. We have xe_runtime_pm_get() in the
fault handler + some form of delayed xe_runtime_pm_put(). Does this say
we ideally should replace that with open + mmap / close?=20

Thanks,
Thomas

>=20
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 17 ++++++++++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_vm.c |=C2=A0 6 +++---
> =C2=A02 files changed, 19 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 52a16cb4e736..48eca9f2651a 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1157,11 +1157,26 @@ static vm_fault_t xe_gem_fault(struct
> vm_fault *vmf)
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +static int xe_vm_access(struct vm_area_struct *vma, unsigned long
> addr,
> +			void *buf, int len, int write)
> +{
> +	struct ttm_buffer_object *tbo =3D vma->vm_private_data;
> +	struct drm_device *ddev =3D tbo->base.dev;
> +	struct xe_device *xe =3D to_xe_device(ddev);
> +	int ret;
> +
> +	xe_pm_runtime_get(xe);
> +	ret =3D ttm_bo_vm_access(vma, addr, buf, len, write);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +
> =C2=A0static const struct vm_operations_struct xe_gem_vm_ops =3D {
> =C2=A0	.fault =3D xe_gem_fault,
> =C2=A0	.open =3D ttm_bo_vm_open,
> =C2=A0	.close =3D ttm_bo_vm_close,
> -	.access =3D ttm_bo_vm_access
> +	.access =3D xe_vm_access
> =C2=A0};
> =C2=A0
> =C2=A0static const struct drm_gem_object_funcs xe_gem_object_funcs =3D {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index dfd31b346021..aa298b768620 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1347,7 +1347,7 @@ struct xe_vm *xe_vm_create(struct xe_device
> *xe, u32 flags)
> =C2=A0
> =C2=A0	vm->pt_ops =3D &xelp_pt_ops;
> =C2=A0
> -	if (!(flags & XE_VM_FLAG_MIGRATION))
> +	if (flags & XE_VM_FLAG_LR_MODE)
> =C2=A0		xe_pm_runtime_get_noresume(xe);
> =C2=A0
> =C2=A0	vm_resv_obj =3D drm_gpuvm_resv_object_alloc(&xe->drm);
> @@ -1457,7 +1457,7 @@ struct xe_vm *xe_vm_create(struct xe_device
> *xe, u32 flags)
> =C2=A0	for_each_tile(tile, xe, id)
> =C2=A0		xe_range_fence_tree_fini(&vm->rftree[id]);
> =C2=A0	kfree(vm);
> -	if (!(flags & XE_VM_FLAG_MIGRATION))
> +	if (flags & XE_VM_FLAG_LR_MODE)
> =C2=A0		xe_pm_runtime_put(xe);
> =C2=A0	return ERR_PTR(err);
> =C2=A0}
> @@ -1592,7 +1592,7 @@ static void vm_destroy_work_func(struct
> work_struct *w)
> =C2=A0
> =C2=A0	mutex_destroy(&vm->snap_mutex);
> =C2=A0
> -	if (!(vm->flags & XE_VM_FLAG_MIGRATION))
> +	if (vm->flags & XE_VM_FLAG_LR_MODE)
> =C2=A0		xe_pm_runtime_put(xe);
> =C2=A0
> =C2=A0	for_each_tile(tile, xe, id)

