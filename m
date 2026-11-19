Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BF5606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 12:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mLrI9HrO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E931D10E78D;
	Thu, 19 Nov 2026 12:48:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C39D10E78D
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795092527; x=1826628527;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kPMyeWZjULO1VXpkwH9xI/BahY5yrvmAbXjXErhHN88=;
 b=mLrI9HrOaAkUnqyZT6oERxPn//K92+VlqvaQ1jx8YPmIG25ZuUuQG7lT
 mMx7N3C0cGMYqSFPdnJz3bAYJRPF6F/JDvkw4lKrKQvPlGWu93nqbcvDi
 4qXR/wZXb1AAgQ6szZM7J/kPVNFoaliam0Jf7XXksQNZVXzbsMdOP4MSV
 4OQGAYJ/hl/BA6twhoiD+W9157IDGRhDkNd6NvfTBOYjFKFZ79mE4u5J+
 ij1HXQqQzbwdeXiHXlxwJBxGZj05qxUECCLe2tCrgzUSz0CH5xbkhgaAV
 R8Awp59+pGJKFUbAFD7lcBJL8rZr02Cxqkxm3VTIZCWIA21yll9HRv5R+ A==;
X-CSE-ConnectionGUID: 4v0e3quAR3iKXYw19lASFg==
X-CSE-MsgGUID: LTAhr8lpQYCthRh/PAMZiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3856495"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3856495"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 04:48:46 -0800
X-CSE-ConnectionGUID: wQBM3XpARm6fss9C37kVPQ==
X-CSE-MsgGUID: HEQiFct2SGeT4I8d6/GeNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="12376711"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.91])
 ([10.245.245.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 04:48:45 -0800
Message-ID: <905fc2549d7a7354d9486c8dafe092a2166ca4bd.camel@linux.intel.com>
Subject: Re: [PATCH 1/5] drm/xe/vm: restore userptr invalidations on VMA op
 unwind
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost	
 <matthew.brost@intel.com>, Himal Prasad Ghimiray	
 <himal.prasad.ghimiray@intel.com>, Stuart Summers <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Nov 2026 13:48:42 +0100
In-Reply-To: <20261119-userptr-repin-v1-1-af2e327833a9@intel.com>
References: <20261119-userptr-repin-v1-0-af2e327833a9@intel.com>
 <20261119-userptr-repin-v1-1-af2e327833a9@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 2026-11-19 at 11:14 +0000, Matthew Auld wrote:
> When xe_vma_op_commit() commits DRM_GPUVA_OP_UNMAP or
> DRM_GPUVA_OP_REMAP, prep_vma_destroy() sets XE_VMA_DESTROYED while
> the
> old VMA's GPU page tables remain live. If a subsequent step fails and
> unwinds (for example splitting a userptr VMA where new_vma() fails,
> or a
> later op in an array of binds failing), a concurrent MMU notifier
> invalidation is lost on non-fault-mode VMs:
>=20
> =C2=A0 CPU0 (VM_BIND / MADVISE)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 CPU1 (MMU notifier)
> =C2=A0 ------------------------=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -------------------
> =C2=A0 down_write(&vm->lock)
> =C2=A0 xe_vma_op_commit()
> =C2=A0=C2=A0=C2=A0 prep_vma_destroy(vma)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags |=3D XE_VMA_DESTROYED
> =C2=A0 ...
> =C2=A0 /* later step fails */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> xe_vma_userptr_invalidate_start()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 down_write(&notifier_lock)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 mmu_interval_set_seq()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* XE_VMA_DESTROYED set:
> skips
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 * vm->userptr.invalidated
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 drm_gpusvm_unmap_pages()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 up_write(&notifier_lock)
> =C2=A0 xe_vma_op_unwind()
> =C2=A0=C2=A0=C2=A0 flags &=3D ~XE_VMA_DESTROYED
> =C2=A0=C2=A0=C2=A0 xe_vm_insert_vma(vm, vma)
> =C2=A0 up_write(&vm->lock)
>=20
> Once vm->lock is dropped, the VMA remains in the VM with live GPU
> PTEs
> pointing at unmapped pages, while neither exec nor the rebind worker
> knows to repin and rebind it.
>=20
> Add unprep_vma_destroy() to check xe_vma_userptr_check_repin() while
> clearing XE_VMA_DESTROYED under the notifier lock and queue
> invalidated
> non-fault-mode userptr VMAs onto vm->userptr.invalidated.
>=20
> Fixes: b06d47be7c83 ("drm/xe: Port Xe to GPUVA")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org> # v6.12+

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>



> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c | 35 ++++++++++++++++++++++++-----------
> =C2=A01 file changed, 24 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index dd855876f571..75be5e5329bd 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -44,6 +44,7 @@
> =C2=A0#include "xe_tile.h"
> =C2=A0#include "xe_tlb_inval.h"
> =C2=A0#include "xe_trace_bo.h"
> +#include "xe_userptr.h"
> =C2=A0#include "xe_vm_madvise.h"
> =C2=A0#include "xe_wa.h"
> =C2=A0
> @@ -2401,6 +2402,26 @@ static void prep_vma_destroy(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0		xe_vm_remove_vma(vm, vma);
> =C2=A0}
> =C2=A0
> +static void unprep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool post_commit)
> +{
> +	xe_svm_notifier_lock(vm);
> +	vma->gpuva.flags &=3D ~XE_VMA_DESTROYED;
> +	if (IS_ENABLED(CONFIG_DRM_GPUSVM) &&
> !xe_vm_in_fault_mode(vm) &&
> +	=C2=A0=C2=A0=C2=A0 xe_vma_is_userptr(vma) &&
> +	=C2=A0=C2=A0=C2=A0 xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
> +		struct xe_userptr_vma *uvma =3D to_userptr_vma(vma);
> +
> +		spin_lock(&vm->userptr.invalidated_lock);
> +		list_move_tail(&uvma->userptr.invalidate_link,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &vm->userptr.invalidated);
> +		spin_unlock(&vm->userptr.invalidated_lock);
> +	}
> +	xe_svm_notifier_unlock(vm);
> +	if (post_commit)
> +		xe_vm_insert_vma(vm, vma);
> +}
> +
> =C2=A0#undef ULL
> =C2=A0#define ULL	unsigned long long
> =C2=A0
> @@ -3093,13 +3114,8 @@ static void xe_vma_op_unwind(struct xe_vm *vm,
> struct xe_vma_op *op,
> =C2=A0
> =C2=A0		xe_vm_assert_write_mode_or_garbage_collector(vm);
> =C2=A0
> -		if (vma) {
> -			xe_svm_notifier_lock(vm);
> -			vma->gpuva.flags &=3D ~XE_VMA_DESTROYED;
> -			xe_svm_notifier_unlock(vm);
> -			if (post_commit)
> -				xe_vm_insert_vma(vm, vma);
> -		}
> +		if (vma)
> +			unprep_vma_destroy(vm, vma, post_commit);
> =C2=A0		break;
> =C2=A0	}
> =C2=A0	case DRM_GPUVA_OP_REMAP:
> @@ -3117,9 +3133,6 @@ static void xe_vma_op_unwind(struct xe_vm *vm,
> struct xe_vma_op *op,
> =C2=A0			xe_vma_destroy_unlocked(op->remap.next);
> =C2=A0		}
> =C2=A0		if (vma) {
> -			xe_svm_notifier_lock(vm);
> -			vma->gpuva.flags &=3D ~XE_VMA_DESTROYED;
> -			xe_svm_notifier_unlock(vm);
> =C2=A0			if (post_commit) {
> =C2=A0				/*
> =C2=A0				 * Restore the old va range, in case
> of the
> @@ -3131,8 +3144,8 @@ static void xe_vma_op_unwind(struct xe_vm *vm,
> struct xe_vma_op *op,
> =C2=A0					op->remap.old_start;
> =C2=A0				op->base.remap.unmap->va->va.range =3D
> =C2=A0					op->remap.old_range;
> -				xe_vm_insert_vma(vm, vma);
> =C2=A0			}
> +			unprep_vma_destroy(vm, vma, post_commit);
> =C2=A0		}
> =C2=A0		break;
> =C2=A0	}
