Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8196CAC5A7
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 11:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1D910E41B;
	Mon, 22 Sep 2025 11:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OmpYHhAr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9293810E41B
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 11:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758539474; x=1790075474;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6xyijfe7eCLwJwJwixKPSPOcCm/hjBguC5GRhPT9csw=;
 b=OmpYHhArPlEJLB09HHWXkR+stmUHoDQ7oH89UWXFeRyiTmWNRHUZv3gI
 AdnWXnYzKlOdEQLkhFIzyiADJaJwWEOOEXG4MMsL2RukrvFHl/6SEMB4u
 UIF5Eo2Usdb/dL22IcHlX4Ob20dG1bD392p50g3SxzbuRhKuJZ4hTuMN5
 bhIlF0mQ6w1YZOScFYLlMPS9DdclmE8uj3h9FS5w8cATJMHpMPXMDYvjE
 sItkXz7FZUf2SAZibP1nSh00vMiBIwu8NBk/h8PqYlRyQXihNCXpYDkQi
 4bgBnBi757M9eUPYv7Ljcx/HvJZEe0ujDrsM+sce27iS43NsJOClde7I/ A==;
X-CSE-ConnectionGUID: QOcfkOMTSByw2YmhAPsKZQ==
X-CSE-MsgGUID: BUxcFc1TSiywEGZ970BGwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="64620020"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="64620020"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 04:11:12 -0700
X-CSE-ConnectionGUID: wN/Kag0eQmqArW+746wwAQ==
X-CSE-MsgGUID: oJR69YVPR0imkytJrjx+gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="207191858"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.93])
 ([10.245.244.93])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 04:11:10 -0700
Message-ID: <756fcc2acbb8cbb8ee79853d6450ba885a993dab.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/xe/pat: Improve PAT index handling in
 xe_vma_mem_attr
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Date: Mon, 22 Sep 2025 13:11:07 +0200
In-Reply-To: <20250918080003.153906-2-himal.prasad.ghimiray@intel.com>
References: <20250918080003.153906-1-himal.prasad.ghimiray@intel.com>
 <20250918080003.153906-2-himal.prasad.ghimiray@intel.com>
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

On Thu, 2025-09-18 at 13:30 +0530, Himal Prasad Ghimiray wrote:
> Replaced flat PAT index fields with a structured format to support
> separate indices for system memory, local VRAM, and remote GPU
> memory.
>=20
> This allows KMD to handle multiple PAT indices passed via madvise,
> which
> are used to encode PTEs based on memory location. Defaults to
> 'initial'
> unless overridden.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray
> <himal.prasad.ghimiray@intel.com>

Patch LGTM, Although please see comment on the 2/2 patch.
Thanks,
Thomas


> ---
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 21 +++++++++---------
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 25 ++++++++++++++++------
> =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c |=C2=A0 9 ++++++--
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0 | 34 +++++++++++++++++=
+++--------
> --
> =C2=A05 files changed, 61 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index a1c88f9a6c76..b984854d09a6 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -522,7 +522,6 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> pgoff_t offset,
> =C2=A0{
> =C2=A0	struct xe_pt_stage_bind_walk *xe_walk =3D
> =C2=A0		container_of(walk, typeof(*xe_walk), base);
> -	u16 pat_index =3D xe_walk->vma->attr.pat_index;
> =C2=A0	struct xe_pt *xe_parent =3D container_of(parent,
> typeof(*xe_parent), base);
> =C2=A0	struct xe_vm *vm =3D xe_walk->vm;
> =C2=A0	struct xe_pt *xe_child;
> @@ -535,6 +534,8 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> pgoff_t offset,
> =C2=A0		struct xe_res_cursor *curs =3D xe_walk->curs;
> =C2=A0		bool is_null =3D xe_vma_is_null(xe_walk->vma);
> =C2=A0		bool is_vram =3D is_null ? false :
> xe_res_is_vram(curs);
> +		u16 pat_index =3D is_vram ? xe_walk->vma-
> >attr.pat_index.devmem
> +					: xe_walk->vma-
> >attr.pat_index.smem;
> =C2=A0
> =C2=A0		XE_WARN_ON(xe_walk->va_curs_start !=3D addr);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 7f2f1f041f1d..90027eb27a1e 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -291,16 +291,19 @@ static int __xe_svm_garbage_collector(struct
> xe_vm *vm,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static void xe_vma_set_default_attributes(struct xe_vma *vma)
> +{
> +	vma->attr.preferred_loc.devmem_fd =3D
> DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE;
> +	vma->attr.preferred_loc.migration_policy =3D
> DRM_XE_MIGRATE_ALL_PAGES;
> +	vma->attr.pat_index.smem =3D vma->attr.pat_index.initial;
> +	vma->attr.pat_index.devmem =3D vma->attr.pat_index.initial;
> +	vma->attr.pat_index.remote =3D vma->attr.pat_index.initial;
> +	vma->attr.atomic_access =3D DRM_XE_ATOMIC_UNDEFINED;
> +}
> +
> =C2=A0static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64
> range_start, u64 range_end)
> =C2=A0{
> =C2=A0	struct xe_vma *vma;
> -	struct xe_vma_mem_attr default_attr =3D {
> -		.preferred_loc =3D {
> -			.devmem_fd =3D
> DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
> -			.migration_policy =3D
> DRM_XE_MIGRATE_ALL_PAGES,
> -		},
> -		.atomic_access =3D DRM_XE_ATOMIC_UNDEFINED,
> -	};
> =C2=A0	int err =3D 0;
> =C2=A0
> =C2=A0	vma =3D xe_vm_find_vma_by_addr(vm, range_start);
> @@ -314,9 +317,7 @@ static int xe_svm_range_set_default_attr(struct
> xe_vm *vm, u64 range_start, u64
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_vma_start(vma), xe_vma_end=
(vma));
> =C2=A0
> =C2=A0	if (xe_vma_start(vma) =3D=3D range_start && xe_vma_end(vma) =3D=3D
> range_end) {
> -		default_attr.pat_index =3D vma-
> >attr.default_pat_index;
> -		default_attr.default_pat_index=C2=A0 =3D vma-
> >attr.default_pat_index;
> -		vma->attr =3D default_attr;
> +		xe_vma_set_default_attributes(vma);
> =C2=A0	} else {
> =C2=A0		vm_dbg(&vm->xe->drm, "Split VMA start=3D0x%016llx,
> vma_end=3D0x%016llx",
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range_start, range_end);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0cacab20ff85..6122061786f6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2003,7 +2003,10 @@ static int get_mem_attrs(struct xe_vm *vm, u32
> *num_vmas, u64 start,
> =C2=A0		attrs[i].start =3D xe_vma_start(vma);
> =C2=A0		attrs[i].end =3D xe_vma_end(vma);
> =C2=A0		attrs[i].atomic.val =3D vma->attr.atomic_access;
> -		attrs[i].pat_index.val =3D vma->attr.pat_index;
> +
> +		/* TODO: Modify drm_xe_mem_range_attr for all pats
> */
> +		attrs[i].pat_index.val =3D vma-
> >attr.pat_index.initial;
> +
> =C2=A0		attrs[i].preferred_mem_loc.devmem_fd =3D vma-
> >attr.preferred_loc.devmem_fd;
> =C2=A0		attrs[i].preferred_mem_loc.migration_policy =3D
> =C2=A0		vma->attr.preferred_loc.migration_policy;
> @@ -2540,7 +2543,9 @@ static int xe_vma_op_commit(struct xe_vm *vm,
> struct xe_vma_op *op)
> =C2=A0 * it checks the following conditions:
> =C2=A0 *
> =C2=A0 * - `atomic_access` is `DRM_XE_VMA_ATOMIC_UNDEFINED`
> - * - `pat_index` is equal to `default_pat_index`
> + * - `pat_index.smem` is equal to `pat_index.initial`
> + * - `pat_index.devmem` is equal to `pat_index.initial`
> + * - `pat_index.remote` is equal to `pat_index.initial`
> =C2=A0 * - `preferred_loc.devmem_fd` is
> `DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE`
> =C2=A0 * - `preferred_loc.migration_policy` is `DRM_XE_MIGRATE_ALL_PAGES`
> =C2=A0 *
> @@ -2549,7 +2554,9 @@ static int xe_vma_op_commit(struct xe_vm *vm,
> struct xe_vma_op *op)
> =C2=A0bool xe_vma_has_default_mem_attrs(struct xe_vma *vma)
> =C2=A0{
> =C2=A0	return (vma->attr.atomic_access =3D=3D DRM_XE_ATOMIC_UNDEFINED
> &&
> -		vma->attr.pat_index =3D=3D=C2=A0 vma->attr.default_pat_index
> &&
> +		vma->attr.pat_index.smem =3D=3D=C2=A0 vma-
> >attr.pat_index.initial &&
> +		vma->attr.pat_index.devmem =3D=3D=C2=A0 vma-
> >attr.pat_index.initial &&
> +		vma->attr.pat_index.remote =3D=3D=C2=A0 vma-
> >attr.pat_index.initial &&
> =C2=A0		vma->attr.preferred_loc.devmem_fd =3D=3D
> DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE &&
> =C2=A0		vma->attr.preferred_loc.migration_policy =3D=3D
> DRM_XE_MIGRATE_ALL_PAGES);
> =C2=A0}
> @@ -2585,9 +2592,13 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm *vm, struct drm_gpuva_ops *ops,
> =C2=A0					.devmem_fd =3D
> DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
> =C2=A0					.migration_policy =3D
> DRM_XE_MIGRATE_ALL_PAGES,
> =C2=A0				},
> +				.pat_index =3D {
> +					.initial =3D op-
> >map.pat_index,
> +					.smem =3D op->map.pat_index,
> +					.devmem =3D op->map.pat_index,
> +					.remote =3D op->map.pat_index,
> +				},
> =C2=A0				.atomic_access =3D
> DRM_XE_ATOMIC_UNDEFINED,
> -				.default_pat_index =3D op-
> >map.pat_index,
> -				.pat_index =3D op->map.pat_index,
> =C2=A0			};
> =C2=A0
> =C2=A0			flags |=3D op->map.read_only ?
> @@ -4226,12 +4237,12 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
> =C2=A0			if (__op->op =3D=3D DRM_GPUVA_OP_UNMAP) {
> =C2=A0				vma =3D gpuva_to_vma(op-
> >base.unmap.va);
> =C2=A0				XE_WARN_ON(!xe_vma_has_default_mem_a
> ttrs(vma));
> -				default_pat =3D vma-
> >attr.default_pat_index;
> +				default_pat =3D vma-
> >attr.pat_index.initial;
> =C2=A0			}
> =C2=A0
> =C2=A0			if (__op->op =3D=3D DRM_GPUVA_OP_REMAP) {
> =C2=A0				vma =3D gpuva_to_vma(op-
> >base.remap.unmap->va);
> -				default_pat =3D vma-
> >attr.default_pat_index;
> +				default_pat =3D vma-
> >attr.pat_index.initial;
> =C2=A0			}
> =C2=A0
> =C2=A0			if (__op->op =3D=3D DRM_GPUVA_OP_MAP) {
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index cad3cf627c3f..e3f0cf23a3a9 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -149,11 +149,16 @@ static void madvise_pat_index(struct xe_device
> *xe, struct xe_vm *vm,
> =C2=A0	xe_assert(vm->xe, op->type =3D=3D DRM_XE_MEM_RANGE_ATTR_PAT);
> =C2=A0
> =C2=A0	for (i =3D 0; i < num_vmas; i++) {
> -		if (vmas[i]->attr.pat_index =3D=3D op->pat_index.val) {
> +		/*TODO : Pass different pat_indexes from ioctl */
> +		if (vmas[i]->attr.pat_index.smem =3D=3D op-
> >pat_index.val &&
> +		=C2=A0=C2=A0=C2=A0 vmas[i]->attr.pat_index.devmem =3D=3D op-
> >pat_index.val &&
> +		=C2=A0=C2=A0=C2=A0 vmas[i]->attr.pat_index.remote =3D=3D op-
> >pat_index.val) {
> =C2=A0			vmas[i]->skip_invalidation =3D true;
> =C2=A0		} else {
> =C2=A0			vmas[i]->skip_invalidation =3D false;
> -			vmas[i]->attr.pat_index =3D op->pat_index.val;
> +			vmas[i]->attr.pat_index.smem =3D op-
> >pat_index.val;
> +			vmas[i]->attr.pat_index.devmem =3D op-
> >pat_index.val;
> +			vmas[i]->attr.pat_index.remote =3D=C2=A0 op-
> >pat_index.val;
> =C2=A0		}
> =C2=A0	}
> =C2=A0}
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index da39940501d8..94dea8c263ed 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -65,6 +65,29 @@ struct xe_vma_mem_attr {
> =C2=A0		u32 devmem_fd;
> =C2=A0	} preferred_loc;
> =C2=A0
> +	/** @pat_index: The pat index to encode the PTEs for this
> vma */
> +	struct {
> +		/** @initial: The pat index set during first bind by
> user. */
> +		u16 initial;
> +		/**
> +		 * @smem: Used for encoding when pages are in system
> memory.
> +		 * same as initial unless overwritten by madvise.
> +		 */
> +		u16 smem;
> +
> +		/**
> +		 * @devmem: Used for encoding when pages are in
> local vram.
> +		 * same as initial unless overwritten by madvise.
> +		 */
> +		u16 devmem;
> +
> +		/**
> +		 * @remote: Used for encoding when pages are in
> remote gpu vram.
> +		 * same as initial unless overwritten by madvise.
> +		 */
> +		u16 remote;
> +	} pat_index;
> +
> =C2=A0	/**
> =C2=A0	 * @atomic_access: The atomic access type for the vma
> =C2=A0	 * See %DRM_XE_VMA_ATOMIC_UNDEFINED,
> %DRM_XE_VMA_ATOMIC_DEVICE,
> @@ -72,17 +95,6 @@ struct xe_vma_mem_attr {
> =C2=A0	 * values. These are defined in uapi/drm/xe_drm.h.
> =C2=A0	 */
> =C2=A0	u32 atomic_access;
> -
> -	/**
> -	 * @default_pat_index: The pat index for VMA set during
> first bind by user.
> -	 */
> -	u16 default_pat_index;
> -
> -	/**
> -	 * @pat_index: The pat index to use when encoding the PTEs
> for this vma.
> -	 * same as default_pat_index unless overwritten by madvise.
> -	 */
> -	u16 pat_index;
> =C2=A0};
> =C2=A0
> =C2=A0struct xe_vma {

