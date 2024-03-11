Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D577C5475B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 19:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6524112B17;
	Mon, 11 Mar 2024 19:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GK5QGyqC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CE7112B17
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 19:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710186475; x=1741722475;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6sT4NqgzNY/Odx6tim6lmz1X/P8sWhvg2b/FoxrPjxM=;
 b=GK5QGyqCeFXDSMwaQRPdM/QlLZvAKduVyHliWPAdu62+4dBB9e9x0MN4
 riFhvYciqiUtwpkqSvitRKRFB1UlfNa4xcGh1vaC2lIE4/nIrHw0X/mRP
 ilJc7DsoDu0KVv81ZK1ZAyPxFpvkMFK2ZgequfHSKrRv7sXyWGYTB92jp
 6s8JLEYpGXIOuUG09xhmv98awLtmu+zxrvM6ZUeL3kjhXxRd5zOQojgwM
 kEN/8vfaVRXfbC6SWQq7tmKDE5min98RRGq/yPrh5Q1L9SjWKmAk3Uy/o
 DDnfIGx1IAqb8KkSKm5wzu428oortsBzKfNKKdWh1n5ilrKHriMQJ38Jm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="7818474"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="7818474"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 12:47:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11350991"
Received: from binis42x-mobl.gar.corp.intel.com (HELO [10.249.254.59])
 ([10.249.254.59])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 12:47:53 -0700
Message-ID: <3c16d6322a6d0127f9448c11a9b5876c688fe41d.camel@linux.intel.com>
Subject: Re: [PATCH v3] drm/xe: Invalidate userptr VMA on page pin fault
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: fei.yang@intel.com
Date: Mon, 11 Mar 2024 20:47:50 +0100
In-Reply-To: <20240311192045.852975-1-matthew.brost@intel.com>
References: <20240311192045.852975-1-matthew.brost@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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

On Mon, 2024-03-11 at 12:20 -0700, Matthew Brost wrote:
> Rather than return an error to the user or ban the VM when userptr
> VMA
> page pin fails with -EFAULT, invalidate VMA mappings. This supports
> the
> UMD use case of freeing userptr while still having bindings.
>=20
> Now that non-faulting VMs can invalidate VMAs, drop the usm prefix
> for
> the tile_invalidated member.
>=20
> v2:
> =C2=A0- Fix build error (CI)
> v3:
> =C2=A0- Don't invalidate VMA if in fault mode, rather kill VM (Thomas)
> =C2=A0- Update commit message with tile_invalidated name chagne (Thomas)
> =C2=A0- Wait VM bookkeep slots with VM resv lock (Thomas)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_gt_pagefault.c |=C2=A0 4 ++--
> =C2=A0drivers/gpu/drm/xe/xe_trace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 29 ++++++++++++++++++++------
> --
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 =
++-----
> =C2=A04 files changed, 26 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 73c535193a98..241c294270d9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -69,7 +69,7 @@ static bool access_is_atomic(enum access_type
> access_type)
> =C2=A0static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
> =C2=A0{
> =C2=A0	return BIT(tile->id) & vma->tile_present &&
> -		!(BIT(tile->id) & vma->usm.tile_invalidated);
> +		!(BIT(tile->id) & vma->tile_invalidated);
> =C2=A0}
> =C2=A0
> =C2=A0static bool vma_matches(struct xe_vma *vma, u64 page_addr)
> @@ -226,7 +226,7 @@ static int handle_pagefault(struct xe_gt *gt,
> struct pagefault *pf)
> =C2=A0
> =C2=A0	if (xe_vma_is_userptr(vma))
> =C2=A0		ret =3D
> xe_vma_userptr_check_repin(to_userptr_vma(vma));
> -	vma->usm.tile_invalidated &=3D ~BIT(tile->id);
> +	vma->tile_invalidated &=3D ~BIT(tile->id);
> =C2=A0
> =C2=A0unlock_dma_resv:
> =C2=A0	drm_exec_fini(&exec);
> diff --git a/drivers/gpu/drm/xe/xe_trace.h
> b/drivers/gpu/drm/xe/xe_trace.h
> index 4ddc55527f9a..846f14507d5f 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -468,7 +468,7 @@ DEFINE_EVENT(xe_vma, xe_vma_userptr_invalidate,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(vma)
> =C2=A0);
> =C2=A0
> -DEFINE_EVENT(xe_vma, xe_vma_usm_invalidate,
> +DEFINE_EVENT(xe_vma, xe_vma_invalidate,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(struct xe_vma *vma),
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(vma)
> =C2=A0);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 643b3701a738..19323b411cb2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -724,11 +724,25 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
> =C2=A0	list_for_each_entry_safe(uvma, next, &vm-
> >userptr.repin_list,
> =C2=A0				 userptr.repin_link) {
> =C2=A0		err =3D xe_vma_userptr_pin_pages(uvma);
> -		if (err < 0)
> -			return err;
> -
> =C2=A0		list_del_init(&uvma->userptr.repin_link);
> -		list_move_tail(&uvma->vma.combined_links.rebind,
> &vm->rebind_list);
> +		if (err =3D=3D -EFAULT && !xe_vm_in_fault_mode(vm)) {
> +			/* Wait for pending binds */
> +			xe_vm_lock(vm, false);
> +			dma_resv_wait_timeout(xe_vm_resv(vm),
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> DMA_RESV_USAGE_BOOKKEEP,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 false,
> MAX_SCHEDULE_TIMEOUT);
> +
> +			err =3D xe_vm_invalidate_vma(&uvma->vma);

This can still race with yet another notifier, I think.

> +			xe_vm_unlock(vm);
> +			if (err)
> +				return err;
> +		} else {
> +			if (err < 0)

And here we should've kept the userptr on the repin list.


/Thomas


> +				return err;
> +


> +			list_move_tail(&uvma-
> >vma.combined_links.rebind,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &vm->rebind_list);
> +		}
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;
> @@ -2024,7 +2038,7 @@ static int xe_vm_prefetch(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0			return err;
> =C2=A0	}
> =C2=A0
> -	if (vma->tile_mask !=3D (vma->tile_present & ~vma-
> >usm.tile_invalidated)) {
> +	if (vma->tile_mask !=3D (vma->tile_present & ~vma-
> >tile_invalidated)) {
> =C2=A0		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs,
> num_syncs,
> =C2=A0				=C2=A0 true, first_op, last_op);
> =C2=A0	} else {
> @@ -3214,9 +3228,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> =C2=A0	u8 id;
> =C2=A0	int ret;
> =C2=A0
> -	xe_assert(xe, xe_vm_in_fault_mode(xe_vma_vm(vma)));
> =C2=A0	xe_assert(xe, !xe_vma_is_null(vma));
> -	trace_xe_vma_usm_invalidate(vma);
> +	trace_xe_vma_invalidate(vma);
> =C2=A0
> =C2=A0	/* Check that we don't race with page-table updates */
> =C2=A0	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> @@ -3254,7 +3267,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	vma->usm.tile_invalidated =3D vma->tile_mask;
> +	vma->tile_invalidated =3D vma->tile_mask;
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 79b5cab57711..ae5fb565f6bf 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -84,11 +84,8 @@ struct xe_vma {
> =C2=A0		struct work_struct destroy_work;
> =C2=A0	};
> =C2=A0
> -	/** @usm: unified shared memory state */
> -	struct {
> -		/** @tile_invalidated: VMA has been invalidated */
> -		u8 tile_invalidated;
> -	} usm;
> +	/** @tile_invalidated: VMA has been invalidated */
> +	u8 tile_invalidated;
> =C2=A0
> =C2=A0	/** @tile_mask: Tile mask of where to create binding for
> this VMA */
> =C2=A0	u8 tile_mask;

