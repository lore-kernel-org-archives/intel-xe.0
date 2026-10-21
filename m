Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CFF606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 04:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMsPBQ32
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F9910E26B;
	Wed, 21 Oct 2026 04:35:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6FD10E26B
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 04:35:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6BD8740308;
 Wed, 21 Oct 2026 04:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 311901F000C9;
 Wed, 21 Oct 2026 04:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792557302;
 bh=OFBtoeozEpFD4+e3aI7oNAVwTHBI7xRKPsmOK4jMKLQ=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=iMsPBQ32WI1+3htnGfQjovuLKfHPw4RmFEtSh31DatwrEl+PIgfOOw6xIBJW1EL+G
 j9c7xWm6rrIjPALvRrQpcuaioIScqR0uit1MCj4qrBMMLD7gNIShH02UetXEHcGcUS
 Gk+Rj5nrLdU1KcRdxUN4mOHZTwkarVYngREOV1Xkg1F0fzb+EQvgnfAydMB5gX+Vxi
 U2cQ6/YV+uitFq++cD6Y3MT7xwA1yYJtoDzPJEZH/baQmFVnL6CBApeI251+8MRGZq
 2JRd7JBZNU0GyXV5nO4FvFx0NqsLjQyVH8mD8CmJwf/q6Q7AIzVU1+EuVbGszRGG3d
 QBwrhvmo3kX0A==
Message-ID: <sashiko-outbox-179786@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] drm/xe/pagefault: add CPU mirror VMA for SVA faults
 without PRI
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261021041117.1774877-7-naresh.kumar.g@intel.com>
References: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
 <20261021041117.1774877-7-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 04:35:01 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] drm/xe: NULL deref and uninitialized PAT in xe_vm_alloc_cpu_ad=
dr_mirror_vma()
- [High] drm/xe: 4K VMA check before 64K mirror alloc in xe_pagefault_servi=
ce()
--

commit c441331b0c386c437e9ad479c73465c57bd86054
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

drm/xe/pagefault: add CPU mirror VMA for SVA faults without PRI

This commit adds on-demand creation of a cpu-address-mirror vma in
xe_pagefault_service() when servicing sva faults on platforms with ats/pasid
enabled but without pri support. It also introduces the
XE_PAGEFAULT_ERROR_VMA_ALLOC error code to report vma allocation failures.

> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pa=
gefault.c
> index 5247321c805ec..fbdf12d3d5580 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
[ ... ]
> @@ -298,6 +300,51 @@ static int xe_pagefault_service(struct xe_pagefault =
*pf)
>  	}
> =20
>  	vma =3D xe_vm_find_vma_by_addr(vm, xe_pagefault_addr(pf));
> +
> +	/*
> +	 * ATS/PASID is negotiated but this hardware has no PRI, so there is
> +	 * no IOMMU self-healing path to fault the page in - the driver has
> +	 * to create the missing CPU-address-mirror binding itself and let
> +	 * the SVM path below service the fault.
> +	 */
> +	if (!vma && vm->sva_handle && xe_pci_svm_needs_sw_iopf(pdev)) {
> +		u64 page_size =3D vm->flags & XE_VM_FLAG_64K ? SZ_64K : SZ_4K;
> +		u64 start =3D ALIGN_DOWN(xe_pagefault_addr(pf), page_size);
> +		u64 end =3D start + page_size;
> +		int alloc_err =3D 0;
> +
> +		up_read(&vm->lock);
> +		down_write(&vm->lock);
> +		/* Lock was dropped, re-check: a racing fault may have won */
> +		vma =3D xe_vm_find_vma_by_addr(vm, xe_pagefault_addr(pf));

[Severity: High]
When vm->flags & XE_VM_FLAG_64K is set, xe_pagefault_service() aligns start
and end to SZ_64K, but xe_vm_find_vma_by_addr() in drivers/gpu/drm/xe/xe_vm=
.c
only checks a 4k range at the faulting address:

drivers/gpu/drm/xe/xe_vm.c:xe_vm_find_vma_by_addr() {
	return xe_vm_find_overlapping_vma(vm, page_addr, SZ_4K);
}

Because vm_bind_ioctl_check_args() in drivers/gpu/drm/xe/xe_vm.c and
madvise_args_are_sane() in drivers/gpu/drm/xe/xe_vm_madvise.c allow
4k-aligned mappings on 64k vms (xe_vm_bind_ioctl_validate_bo() only requires
64k alignment for bos with XE_BO_FLAG_INTERNAL_64K), another 4k-aligned vma
(such as a system-memory bo, userptr, sparse vma, or madvise-split vma) can
already exist elsewhere within [start, end).

If a fault hits an unmapped 4k page in that 64k window without first checki=
ng
xe_vm_find_overlapping_vma(vm, start, page_size), won't
xe_vm_alloc_cpu_addr_mirror_vma() -> xe_vm_alloc_vma() ->
drm_gpuvm_sm_map_ops_create() generate unmap or remap operations that destr=
oy
the overlapping vma via xe_vma_destroy() without unbinding its page tables =
or
holding bo->ttm.base.resv, triggering xe_bo_assert_held(bo) in
xe_vma_destroy()?

> +		if (!vma) {
> +			if (xe_vm_is_closed_or_banned(vm)) {
> +				alloc_err =3D -ENOENT;
> +			} else {
> +				/* Merge with adjacent mirror VMAs instead of leaving singletons */
> +				xe_vm_find_cpu_addr_mirror_vma_range(vm, &start, &end);
> +				alloc_err =3D xe_vm_alloc_cpu_addr_mirror_vma(vm, start, end - start=
);

[Severity: Critical]
What happens in xe_pagefault_service() when a fault occurs at an address wi=
th
no immediately adjacent default-attribute mirror vma at start - SZ_4K or
end + 1 (such as the first sva page fault in the vm)?

In that case, xe_vm_find_cpu_addr_mirror_vma_range() leaves [start, end)
unchanged so the range does not overlap any existing gpuva in vm->gpuvm.

When xe_vm_alloc_cpu_addr_mirror_vma() calls xe_vm_alloc_vma(vm, &map_req,
false) in drivers/gpu/drm/xe/xe_vm.c, vma_flags is initialized to 0 and
default_pat is left uninitialized on the stack, because both are only
populated from an existing vma during DRM_GPUVA_OP_UNMAP or
DRM_GPUVA_OP_REMAP:

drivers/gpu/drm/xe/xe_vm.c:xe_vm_alloc_vma() {
	unsigned int vma_flags =3D 0;
	bool remap_op =3D false;
	struct xe_vma_mem_attr tmp_attr =3D {};
	u16 default_pat;
	...
		if (!is_madvise) {
			if (__op->op =3D=3D DRM_GPUVA_OP_UNMAP) {
				vma =3D gpuva_to_vma(op->base.unmap.va);
				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
				default_pat =3D vma->attr.default_pat_index;
				vma_flags =3D vma->gpuva.flags;
			}

			if (__op->op =3D=3D DRM_GPUVA_OP_REMAP) {
				vma =3D gpuva_to_vma(op->base.remap.unmap->va);
				default_pat =3D vma->attr.default_pat_index;
				vma_flags =3D vma->gpuva.flags;
			}

			if (__op->op =3D=3D DRM_GPUVA_OP_MAP) {
				op->map.vma_flags |=3D vma_flags & XE_VMA_CREATE_MASK;
				op->map.pat_index =3D default_pat;
			}
		}
}

Because drm_gpuvm_sm_map_ops_create() only emits DRM_GPUVA_OP_MAP when no
existing gpuva overlaps [start, end), op->map.vma_flags remains 0 (missing
XE_VMA_SYSTEM_ALLOCATOR) and op->map.pat_index uses the uninitialized
default_pat variable.

From there, vm_bind_ioctl_ops_parse() -> new_vma() -> xe_vma_create() in
drivers/gpu/drm/xe/xe_vm.c sees !bo && !is_null && !is_cpu_addr_mirror,
allocates a struct xe_userptr_vma instead of a mirror vma, and calls
xe_userptr_setup() in drivers/gpu/drm/xe/xe_userptr.c:

drivers/gpu/drm/xe/xe_userptr.c:xe_userptr_setup() {
	...
	err =3D mmu_interval_notifier_insert(&userptr->notifier, current->mm,
					   start, range,
					   &vma_userptr_notifier_ops);
}

Since xe_pagefault_service() runs on a workqueue kthread where current->mm =
is
NULL, won't this cause a null pointer dereference inside
mmu_interval_notifier_insert()?

> +			}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021041117.1774=
877-1-naresh.kumar.g@intel.com?part=3D6
