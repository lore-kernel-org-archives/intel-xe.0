Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4697ACCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 09:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0DB10E253;
	Thu, 30 Oct 2025 09:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UmJ95S+y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10AA10E253
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761817955; x=1793353955;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=olN2t7Uv8vYQVvsRvA3cUZu10vFetbKWhnRCsahpkGM=;
 b=UmJ95S+yF4W9l3ngRRBdxRTds++Mb0+MMbA9nZZrEPbha5urZjK7qZ/G
 1L3cEU4zYSsOYcYmnY3MfjxWzS72tvRV1fX7BgpvVM5a8H9ADZgzF5Wr6
 QJDoi9yfqMaCpANE7vSitXxTwl3GcCkMuZ0HHOBM4nRVGc9RGEwqENqhO
 d7Y++6z+i8niKg0DF2uvyZohzL+MztWHjtFtpWUB+/4Tm9AyrxATrP9Rd
 Ss4l44+p5su6aAiwak6o8BYsnt8HuJwMNER9bfqQpiNpMJExLlbHcNyuc
 J+u9hbFuXytzBEGf3swdaSbFAdchCYGSM0W85/Qq97bAMjwqdtLND1Q40 Q==;
X-CSE-ConnectionGUID: 1MAoBTIyQrebM4L5TSvYPA==
X-CSE-MsgGUID: uTRs2AmxQ4KRZcwboacHZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75075175"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="75075175"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 02:52:35 -0700
X-CSE-ConnectionGUID: U3+grGSESSutChzq9QKLrA==
X-CSE-MsgGUID: q6Q74pFRTYKONyQbr0ZekA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="185608710"
Received: from opintica-mobl1 (HELO [10.245.245.172]) ([10.245.245.172])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 02:52:34 -0700
Message-ID: <4789ae16c361794efb8f1b910cbbfd34337d6d76.camel@linux.intel.com>
Subject: Re: [PATCH v5 3/6] drm/xe: Decouple bind queue last fence from TLB
 invalidations
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Thu, 30 Oct 2025 10:52:32 +0100
In-Reply-To: <20251029205719.2746501-4-matthew.brost@intel.com>
References: <20251029205719.2746501-1-matthew.brost@intel.com>
 <20251029205719.2746501-4-matthew.brost@intel.com>
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

On Wed, 2025-10-29 at 13:57 -0700, Matthew Brost wrote:
> Separate the bind queue=E2=80=99s last fence to apply exclusively to the =
bind
> job, avoiding unnecessary serialization on prior TLB invalidations.
> Preserve correct user fence signaling by merging bind and TLB
> invalidation fences later in the pipeline.
>=20
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6047
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>=20
> ---
Pls keep version history

> v3:
> =C2=A0- Fix lockdep assert for migrate queues (CI)
> =C2=A0- Use individual dma fence contexts for array out fences (Testing)
> =C2=A0- Don't set last fence with arrays (Testing)
> =C2=A0- Move TLB invalid last fence under migrate lock (Testing)
> =C2=A0- Don't set queue last for migrate queues (Testing)

Reviewed-by:
Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com


> ---
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 73 ++++++++++---------------
> =C2=A0drivers/gpu/drm/xe/xe_sync.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 63 +++++++++++++++++-----
> =C2=A0drivers/gpu/drm/xe/xe_tlb_inval_job.c | 31 ++++++++---
> =C2=A0drivers/gpu/drm/xe/xe_tlb_inval_job.h |=C2=A0 5 +-
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 76 ++++++++++++++-----------
> --
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 5 --
> =C2=A06 files changed, 143 insertions(+), 110 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index d22fd1ccc0ba..a4b9cdf016d9 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -3,8 +3,6 @@
> =C2=A0 * Copyright =C2=A9 2022 Intel Corporation
> =C2=A0 */
> =C2=A0
> -#include <linux/dma-fence-array.h>
> -
> =C2=A0#include "xe_pt.h"
> =C2=A0
> =C2=A0#include "regs/xe_gtt_defs.h"
> @@ -2359,10 +2357,9 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> struct xe_vma_ops *vops)
> =C2=A0	struct xe_vm *vm =3D vops->vm;
> =C2=A0	struct xe_vm_pgtable_update_ops *pt_update_ops =3D
> =C2=A0		&vops->pt_update_ops[tile->id];
> -	struct dma_fence *fence, *ifence, *mfence;
> +	struct xe_exec_queue *q =3D pt_update_ops->q;
> +	struct dma_fence *fence, *ifence =3D NULL, *mfence =3D NULL;
> =C2=A0	struct xe_tlb_inval_job *ijob =3D NULL, *mjob =3D NULL;
> -	struct dma_fence **fences =3D NULL;
> -	struct dma_fence_array *cf =3D NULL;
> =C2=A0	struct xe_range_fence *rfence;
> =C2=A0	struct xe_vma_op *op;
> =C2=A0	int err =3D 0, i;
> @@ -2390,15 +2387,14 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> struct xe_vma_ops *vops)
> =C2=A0#endif
> =C2=A0
> =C2=A0	if (pt_update_ops->needs_invalidation) {
> -		struct xe_exec_queue *q =3D pt_update_ops->q;
> =C2=A0		struct xe_dep_scheduler *dep_scheduler =3D
> =C2=A0			to_dep_scheduler(q, tile->primary_gt);
> =C2=A0
> =C2=A0		ijob =3D xe_tlb_inval_job_create(q, &tile->primary_gt-
> >tlb_inval,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dep_scheduler,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dep_scheduler, vm,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pt_update_ops->start,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pt_update_ops->last,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm->usm.asid);
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
> =C2=A0		if (IS_ERR(ijob)) {
> =C2=A0			err =3D PTR_ERR(ijob);
> =C2=A0			goto kill_vm_tile1;
> @@ -2410,26 +2406,15 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> struct xe_vma_ops *vops)
> =C2=A0
> =C2=A0			mjob =3D xe_tlb_inval_job_create(q,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &tile-
> >media_gt->tlb_inval,
> -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> dep_scheduler,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> dep_scheduler, vm,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> pt_update_ops->start,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> pt_update_ops->last,
> -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm-
> >usm.asid);
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT);
> =C2=A0			if (IS_ERR(mjob)) {
> =C2=A0				err =3D PTR_ERR(mjob);
> =C2=A0				goto free_ijob;
> =C2=A0			}
> =C2=A0			update.mjob =3D mjob;
> -
> -			fences =3D kmalloc_array(2, sizeof(*fences),
> GFP_KERNEL);
> -			if (!fences) {
> -				err =3D -ENOMEM;
> -				goto free_ijob;
> -			}
> -			cf =3D dma_fence_array_alloc(2);
> -			if (!cf) {
> -				err =3D -ENOMEM;
> -				goto free_ijob;
> -			}
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> @@ -2460,31 +2445,12 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> struct xe_vma_ops *vops)
> =C2=A0				=C2=A0 pt_update_ops->last, fence))
> =C2=A0		dma_fence_wait(fence, false);
> =C2=A0
> -	/* tlb invalidation must be done before signaling
> unbind/rebind */
> -	if (ijob) {
> -		struct dma_fence *__fence;
> -
> +	if (ijob)
> =C2=A0		ifence =3D xe_tlb_inval_job_push(ijob, tile->migrate,
> fence);
> -		__fence =3D ifence;
> +	if (mjob)
> +		mfence =3D xe_tlb_inval_job_push(mjob, tile->migrate,
> fence);
> =C2=A0
> -		if (mjob) {
> -			fences[0] =3D ifence;
> -			mfence =3D xe_tlb_inval_job_push(mjob, tile-
> >migrate,
> -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence);
> -			fences[1] =3D mfence;
> -
> -			dma_fence_array_init(cf, 2, fences,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 vm-
> >composite_fence_ctx,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 vm-
> >composite_fence_seqno++,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 false);
> -			__fence =3D &cf->base;
> -		}
> -
> -		dma_fence_put(fence);
> -		fence =3D __fence;
> -	}
> -
> -	if (!mjob) {
> +	if (!mjob && !ijob) {
> =C2=A0		dma_resv_add_fence(xe_vm_resv(vm), fence,
> =C2=A0				=C2=A0=C2=A0 pt_update_ops->wait_vm_bookkeep ?
> =C2=A0				=C2=A0=C2=A0 DMA_RESV_USAGE_KERNEL :
> @@ -2492,6 +2458,14 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> struct xe_vma_ops *vops)
> =C2=A0
> =C2=A0		list_for_each_entry(op, &vops->list, link)
> =C2=A0			op_commit(vops->vm, tile, pt_update_ops, op,
> fence, NULL);
> +	} else if (ijob && !mjob) {
> +		dma_resv_add_fence(xe_vm_resv(vm), ifence,
> +				=C2=A0=C2=A0 pt_update_ops->wait_vm_bookkeep ?
> +				=C2=A0=C2=A0 DMA_RESV_USAGE_KERNEL :
> +				=C2=A0=C2=A0 DMA_RESV_USAGE_BOOKKEEP);
> +
> +		list_for_each_entry(op, &vops->list, link)
> +			op_commit(vops->vm, tile, pt_update_ops, op,
> ifence, NULL);
> =C2=A0	} else {
> =C2=A0		dma_resv_add_fence(xe_vm_resv(vm), ifence,
> =C2=A0				=C2=A0=C2=A0 pt_update_ops->wait_vm_bookkeep ?
> @@ -2511,16 +2485,23 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> struct xe_vma_ops *vops)
> =C2=A0	if (pt_update_ops->needs_svm_lock)
> =C2=A0		xe_svm_notifier_unlock(vm);
> =C2=A0
> +	/*
> +	 * The last fence is only used for zero bind queue idling;
> migrate
> +	 * queues are not exposed to user space.
> +	 */
> +	if (!(q->flags & EXEC_QUEUE_FLAG_MIGRATE))
> +		xe_exec_queue_last_fence_set(q, vm, fence);
> +
> =C2=A0	xe_tlb_inval_job_put(mjob);
> =C2=A0	xe_tlb_inval_job_put(ijob);
> +	dma_fence_put(ifence);
> +	dma_fence_put(mfence);
> =C2=A0
> =C2=A0	return fence;
> =C2=A0
> =C2=A0free_rfence:
> =C2=A0	kfree(rfence);
> =C2=A0free_ijob:
> -	kfree(cf);
> -	kfree(fences);
> =C2=A0	xe_tlb_inval_job_put(mjob);
> =C2=A0	xe_tlb_inval_job_put(ijob);
> =C2=A0kill_vm_tile1:
> diff --git a/drivers/gpu/drm/xe/xe_sync.c
> b/drivers/gpu/drm/xe/xe_sync.c
> index d48ab7b32ca5..df7ca349398b 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -14,7 +14,7 @@
> =C2=A0#include <drm/drm_syncobj.h>
> =C2=A0#include <uapi/drm/xe_drm.h>
> =C2=A0
> -#include "xe_device_types.h"
> +#include "xe_device.h"
> =C2=A0#include "xe_exec_queue.h"
> =C2=A0#include "xe_macros.h"
> =C2=A0#include "xe_sched_job_types.h"
> @@ -297,26 +297,67 @@ xe_sync_in_fence_get(struct xe_sync_entry
> *sync, int num_sync,
> =C2=A0	struct dma_fence **fences =3D NULL;
> =C2=A0	struct dma_fence_array *cf =3D NULL;
> =C2=A0	struct dma_fence *fence;
> -	int i, num_in_fence =3D 0, current_fence =3D 0;
> +	int i, num_fence =3D 0, current_fence =3D 0;
> =C2=A0
> =C2=A0	lockdep_assert_held(&vm->lock);
> =C2=A0
> =C2=A0	/* Count in-fences */
> =C2=A0	for (i =3D 0; i < num_sync; ++i) {
> =C2=A0		if (sync[i].fence) {
> -			++num_in_fence;
> +			++num_fence;
> =C2=A0			fence =3D sync[i].fence;
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> =C2=A0	/* Easy case... */
> -	if (!num_in_fence) {
> +	if (!num_fence) {
> +		if (q->flags & EXEC_QUEUE_FLAG_VM) {
> +			struct xe_exec_queue *__q;
> +			struct xe_tile *tile;
> +			u8 id;
> +
> +			for_each_tile(tile, vm->xe, id)
> +				num_fence +=3D (1 +
> XE_MAX_GT_PER_TILE);
> +
> +			fences =3D kmalloc_array(num_fence,
> sizeof(*fences),
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL);
> +			if (!fences)
> +				return ERR_PTR(-ENOMEM);
> +
> +			fences[current_fence++] =3D
> +				xe_exec_queue_last_fence_get(q, vm);
> +			for_each_tlb_inval(i)
> +				fences[current_fence++] =3D
> +					xe_exec_queue_tlb_inval_last
> _fence_get(q, vm, i);
> +			list_for_each_entry(__q, &q->multi_gt_list,
> +					=C2=A0=C2=A0=C2=A0 multi_gt_link) {
> +				fences[current_fence++] =3D
> +					xe_exec_queue_last_fence_get
> (__q, vm);
> +				for_each_tlb_inval(i)
> +					fences[current_fence++] =3D
> +						xe_exec_queue_tlb_in
> val_last_fence_get(__q, vm, i);
> +			}
> +
> +			xe_assert(vm->xe, current_fence =3D=3D
> num_fence);
> +			cf =3D dma_fence_array_create(num_fence,
> fences,
> +						=C2=A0=C2=A0=C2=A0
> dma_fence_context_alloc(1),
> +						=C2=A0=C2=A0=C2=A0 1, false);
> +			if (!cf)
> +				goto err_out;
> +
> +			return &cf->base;
> +		}
> +
> =C2=A0		fence =3D xe_exec_queue_last_fence_get(q, vm);
> =C2=A0		return fence;
> =C2=A0	}
> =C2=A0
> -	/* Create composite fence */
> -	fences =3D kmalloc_array(num_in_fence + 1, sizeof(*fences),
> GFP_KERNEL);
> +	/*
> +	 * Create composite fence - FIXME - the below code doesn't
> work. This is
> +	 * unused in Mesa so we are ok for the moment. Perhaps we
> just disable
> +	 * this entire code path if number of in fences !=3D 0.
> +	 */
> +	fences =3D kmalloc_array(num_fence + 1, sizeof(*fences),
> GFP_KERNEL);
> =C2=A0	if (!fences)
> =C2=A0		return ERR_PTR(-ENOMEM);
> =C2=A0	for (i =3D 0; i < num_sync; ++i) {
> @@ -326,14 +367,10 @@ xe_sync_in_fence_get(struct xe_sync_entry
> *sync, int num_sync,
> =C2=A0		}
> =C2=A0	}
> =C2=A0	fences[current_fence++] =3D xe_exec_queue_last_fence_get(q,
> vm);
> -	cf =3D dma_fence_array_create(num_in_fence, fences,
> -				=C2=A0=C2=A0=C2=A0 vm->composite_fence_ctx,
> -				=C2=A0=C2=A0=C2=A0 vm->composite_fence_seqno++,
> -				=C2=A0=C2=A0=C2=A0 false);
> -	if (!cf) {
> -		--vm->composite_fence_seqno;
> +	cf =3D dma_fence_array_create(num_fence, fences,
> +				=C2=A0=C2=A0=C2=A0 dma_fence_context_alloc(1), 1,
> false);
> +	if (!cf)
> =C2=A0		goto err_out;
> -	}
> =C2=A0
> =C2=A0	return &cf->base;
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> index 492def04a559..1ae0dec2cf31 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> @@ -12,6 +12,7 @@
> =C2=A0#include "xe_tlb_inval_job.h"
> =C2=A0#include "xe_migrate.h"
> =C2=A0#include "xe_pm.h"
> +#include "xe_vm.h"
> =C2=A0
> =C2=A0/** struct xe_tlb_inval_job - TLB invalidation job */
> =C2=A0struct xe_tlb_inval_job {
> @@ -21,6 +22,8 @@ struct xe_tlb_inval_job {
> =C2=A0	struct xe_tlb_inval *tlb_inval;
> =C2=A0	/** @q: exec queue issuing the invalidate */
> =C2=A0	struct xe_exec_queue *q;
> +	/** @vm: VM which TLB invalidation is being issued for */
> +	struct xe_vm *vm;
> =C2=A0	/** @refcount: ref count of this job */
> =C2=A0	struct kref refcount;
> =C2=A0	/**
> @@ -32,8 +35,8 @@ struct xe_tlb_inval_job {
> =C2=A0	u64 start;
> =C2=A0	/** @end: End address to invalidate */
> =C2=A0	u64 end;
> -	/** @asid: Address space ID to invalidate */
> -	u32 asid;
> +	/** @type: GT type */
> +	int type;
> =C2=A0	/** @fence_armed: Fence has been armed */
> =C2=A0	bool fence_armed;
> =C2=A0};
> @@ -46,7 +49,7 @@ static struct dma_fence
> *xe_tlb_inval_job_run(struct xe_dep_job *dep_job)
> =C2=A0		container_of(job->fence, typeof(*ifence), base);
> =C2=A0
> =C2=A0	xe_tlb_inval_range(job->tlb_inval, ifence, job->start,
> -			=C2=A0=C2=A0 job->end, job->asid);
> +			=C2=A0=C2=A0 job->end, job->vm->usm.asid);
> =C2=A0
> =C2=A0	return job->fence;
> =C2=A0}
> @@ -70,9 +73,10 @@ static const struct xe_dep_job_ops dep_job_ops =3D {
> =C2=A0 * @q: exec queue issuing the invalidate
> =C2=A0 * @tlb_inval: TLB invalidation client
> =C2=A0 * @dep_scheduler: Dependency scheduler for job
> + * @vm: VM which TLB invalidation is being issued for
> =C2=A0 * @start: Start address to invalidate
> =C2=A0 * @end: End address to invalidate
> - * @asid: Address space ID to invalidate
> + * @type: GT type
> =C2=A0 *
> =C2=A0 * Create a TLB invalidation job and initialize internal fields. Th=
e
> caller is
> =C2=A0 * responsible for releasing the creation reference.
> @@ -81,8 +85,8 @@ static const struct xe_dep_job_ops dep_job_ops =3D {
> =C2=A0 */
> =C2=A0struct xe_tlb_inval_job *
> =C2=A0xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inva=
l
> *tlb_inval,
> -			struct xe_dep_scheduler *dep_scheduler, u64
> start,
> -			u64 end, u32 asid)
> +			struct xe_dep_scheduler *dep_scheduler,
> +			struct xe_vm *vm, u64 start, u64 end, int
> type)
> =C2=A0{
> =C2=A0	struct xe_tlb_inval_job *job;
> =C2=A0	struct drm_sched_entity *entity =3D
> @@ -90,19 +94,24 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q,
> struct xe_tlb_inval *tlb_inval,
> =C2=A0	struct xe_tlb_inval_fence *ifence;
> =C2=A0	int err;
> =C2=A0
> +	xe_assert(vm->xe, type =3D=3D XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT
> ||
> +		=C2=A0 type =3D=3D XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
> +
> =C2=A0	job =3D kmalloc(sizeof(*job), GFP_KERNEL);
> =C2=A0	if (!job)
> =C2=A0		return ERR_PTR(-ENOMEM);
> =C2=A0
> =C2=A0	job->q =3D q;
> +	job->vm =3D vm;
> =C2=A0	job->tlb_inval =3D tlb_inval;
> =C2=A0	job->start =3D start;
> =C2=A0	job->end =3D end;
> -	job->asid =3D asid;
> =C2=A0	job->fence_armed =3D false;
> =C2=A0	job->dep.ops =3D &dep_job_ops;
> +	job->type =3D type;
> =C2=A0	kref_init(&job->refcount);
> =C2=A0	xe_exec_queue_get(q);	/* Pairs with put in
> xe_tlb_inval_job_destroy */
> +	xe_vm_get(vm);		/* Pairs with put in
> xe_tlb_inval_job_destroy */
> =C2=A0
> =C2=A0	ifence =3D kmalloc(sizeof(*ifence), GFP_KERNEL);
> =C2=A0	if (!ifence) {
> @@ -124,6 +133,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q,
> struct xe_tlb_inval *tlb_inval,
> =C2=A0err_fence:
> =C2=A0	kfree(ifence);
> =C2=A0err_job:
> +	xe_vm_put(vm);
> =C2=A0	xe_exec_queue_put(q);
> =C2=A0	kfree(job);
> =C2=A0
> @@ -138,6 +148,7 @@ static void xe_tlb_inval_job_destroy(struct kref
> *ref)
> =C2=A0		container_of(job->fence, typeof(*ifence), base);
> =C2=A0	struct xe_exec_queue *q =3D job->q;
> =C2=A0	struct xe_device *xe =3D gt_to_xe(q->gt);
> +	struct xe_vm *vm =3D job->vm;
> =C2=A0
> =C2=A0	if (!job->fence_armed)
> =C2=A0		kfree(ifence);
> @@ -147,6 +158,7 @@ static void xe_tlb_inval_job_destroy(struct kref
> *ref)
> =C2=A0
> =C2=A0	drm_sched_job_cleanup(&job->dep.drm);
> =C2=A0	kfree(job);
> +	xe_vm_put(vm);		/* Pairs with get from
> xe_tlb_inval_job_create */
> =C2=A0	xe_exec_queue_put(q);	/* Pairs with get from
> xe_tlb_inval_job_create */
> =C2=A0	xe_pm_runtime_put(xe);	/* Pairs with get from
> xe_tlb_inval_job_create */
> =C2=A0}
> @@ -231,6 +243,11 @@ struct dma_fence *xe_tlb_inval_job_push(struct
> xe_tlb_inval_job *job,
> =C2=A0	dma_fence_get(&job->dep.drm.s_fence->finished);
> =C2=A0	drm_sched_entity_push_job(&job->dep.drm);
> =C2=A0
> +	/* Let the upper layers fish this out */
> +	xe_exec_queue_tlb_inval_last_fence_set(job->q, job->vm,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &job-
> >dep.drm.s_fence->finished,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job->type);
> +
> =C2=A0	xe_migrate_job_unlock(m, job->q);
> =C2=A0
> =C2=A0	/*
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> index e63edcb26b50..4d6df1a6c6ca 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> @@ -11,14 +11,15 @@
> =C2=A0struct dma_fence;
> =C2=A0struct xe_dep_scheduler;
> =C2=A0struct xe_exec_queue;
> +struct xe_migrate;
> =C2=A0struct xe_tlb_inval;
> =C2=A0struct xe_tlb_inval_job;
> -struct xe_migrate;
> +struct xe_vm;
> =C2=A0
> =C2=A0struct xe_tlb_inval_job *
> =C2=A0xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inva=
l
> *tlb_inval,
> =C2=A0			struct xe_dep_scheduler *dep_scheduler,
> -			u64 start, u64 end, u32 asid);
> +			struct xe_vm *vm, u64 start, u64 end, int
> type);
> =C2=A0
> =C2=A0int xe_tlb_inval_job_alloc_dep(struct xe_tlb_inval_job *job);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 4241cc433dca..7a6e254996fb 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1623,9 +1623,6 @@ struct xe_vm *xe_vm_create(struct xe_device
> *xe, u32 flags, struct xe_file *xef)
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	if (number_tiles > 1)
> -		vm->composite_fence_ctx =3D
> dma_fence_context_alloc(1);
> -
> =C2=A0	if (xef && xe->info.has_asid) {
> =C2=A0		u32 asid;
> =C2=A0
> @@ -3107,20 +3104,26 @@ static struct dma_fence *ops_execute(struct
> xe_vm *vm,
> =C2=A0	struct dma_fence *fence =3D NULL;
> =C2=A0	struct dma_fence **fences =3D NULL;
> =C2=A0	struct dma_fence_array *cf =3D NULL;
> -	int number_tiles =3D 0, current_fence =3D 0, err;
> +	int number_tiles =3D 0, current_fence =3D 0, n_fence =3D 0, err;
> =C2=A0	u8 id;
> =C2=A0
> =C2=A0	number_tiles =3D vm_ops_setup_tile_args(vm, vops);
> =C2=A0	if (number_tiles =3D=3D 0)
> =C2=A0		return ERR_PTR(-ENODATA);
> =C2=A0
> -	if (number_tiles > 1) {
> -		fences =3D kmalloc_array(number_tiles,
> sizeof(*fences),
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL);
> -		if (!fences) {
> -			fence =3D ERR_PTR(-ENOMEM);
> -			goto err_trace;
> -		}
> +	for_each_tile(tile, vm->xe, id)
> +		n_fence +=3D (1 + XE_MAX_GT_PER_TILE);
> +
> +	fences =3D kmalloc_array(n_fence, sizeof(*fences),
> GFP_KERNEL);
> +	if (!fences) {
> +		fence =3D ERR_PTR(-ENOMEM);
> +		goto err_trace;
> +	}
> +
> +	cf =3D dma_fence_array_alloc(n_fence);
> +	if (!cf) {
> +		fence =3D ERR_PTR(-ENOMEM);
> +		goto err_out;
> =C2=A0	}
> =C2=A0
> =C2=A0	for_each_tile(tile, vm->xe, id) {
> @@ -3137,29 +3140,30 @@ static struct dma_fence *ops_execute(struct
> xe_vm *vm,
> =C2=A0	trace_xe_vm_ops_execute(vops);
> =C2=A0
> =C2=A0	for_each_tile(tile, vm->xe, id) {
> +		struct xe_exec_queue *q =3D vops->pt_update_ops[tile-
> >id].q;
> +		int i;
> +
> +		fence =3D NULL;
> =C2=A0		if (!vops->pt_update_ops[id].num_ops)
> -			continue;
> +			goto collect_fences;
> =C2=A0
> =C2=A0		fence =3D xe_pt_update_ops_run(tile, vops);
> =C2=A0		if (IS_ERR(fence))
> =C2=A0			goto err_out;
> =C2=A0
> -		if (fences)
> -			fences[current_fence++] =3D fence;
> +collect_fences:
> +		fences[current_fence++] =3D fence ?:
> dma_fence_get_stub();
> +		xe_migrate_job_lock(tile->migrate, q);
> +		for_each_tlb_inval(i)
> +			fences[current_fence++] =3D
> +				xe_exec_queue_tlb_inval_last_fence_g
> et(q, vm, i);
> +		xe_migrate_job_unlock(tile->migrate, q);
> =C2=A0	}
> =C2=A0
> -	if (fences) {
> -		cf =3D dma_fence_array_create(number_tiles, fences,
> -					=C2=A0=C2=A0=C2=A0 vm->composite_fence_ctx,
> -					=C2=A0=C2=A0=C2=A0 vm-
> >composite_fence_seqno++,
> -					=C2=A0=C2=A0=C2=A0 false);
> -		if (!cf) {
> -			--vm->composite_fence_seqno;
> -			fence =3D ERR_PTR(-ENOMEM);
> -			goto err_out;
> -		}
> -		fence =3D &cf->base;
> -	}
> +	xe_assert(vm->xe, current_fence =3D=3D n_fence);
> +	dma_fence_array_init(cf, n_fence, fences,
> dma_fence_context_alloc(1),
> +			=C2=A0=C2=A0=C2=A0=C2=A0 1, false);
> +	fence =3D &cf->base;
> =C2=A0
> =C2=A0	for_each_tile(tile, vm->xe, id) {
> =C2=A0		if (!vops->pt_update_ops[id].num_ops)
> @@ -3220,7 +3224,6 @@ static void op_add_ufence(struct xe_vm *vm,
> struct xe_vma_op *op,
> =C2=A0static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct
> xe_vma_ops *vops,
> =C2=A0				=C2=A0=C2=A0 struct dma_fence *fence)
> =C2=A0{
> -	struct xe_exec_queue *wait_exec_queue =3D
> to_wait_exec_queue(vm, vops->q);
> =C2=A0	struct xe_user_fence *ufence;
> =C2=A0	struct xe_vma_op *op;
> =C2=A0	int i;
> @@ -3241,7 +3244,6 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm
> *vm, struct xe_vma_ops *vops,
> =C2=A0	if (fence) {
> =C2=A0		for (i =3D 0; i < vops->num_syncs; i++)
> =C2=A0			xe_sync_entry_signal(vops->syncs + i,
> fence);
> -		xe_exec_queue_last_fence_set(wait_exec_queue, vm,
> fence);
> =C2=A0	}
> =C2=A0}
> =C2=A0
> @@ -3435,19 +3437,19 @@ static int vm_bind_ioctl_signal_fences(struct
> xe_vm *vm,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_sync_entry *sync=
s,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int num_syncs)
> =C2=A0{
> -	struct dma_fence *fence;
> +	struct dma_fence *fence =3D NULL;
> =C2=A0	int i, err =3D 0;
> =C2=A0
> -	fence =3D xe_sync_in_fence_get(syncs, num_syncs,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 to_wait_exec_queue(vm, q), vm);
> -	if (IS_ERR(fence))
> -		return PTR_ERR(fence);
> +	if (num_syncs) {
> +		fence =3D xe_sync_in_fence_get(syncs, num_syncs,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 to_wait_exec_queue(vm,
> q), vm);
> +		if (IS_ERR(fence))
> +			return PTR_ERR(fence);
> =C2=A0
> -	for (i =3D 0; i < num_syncs; i++)
> -		xe_sync_entry_signal(&syncs[i], fence);
> +		for (i =3D 0; i < num_syncs; i++)
> +			xe_sync_entry_signal(&syncs[i], fence);
> +	}
> =C2=A0
> -	xe_exec_queue_last_fence_set(to_wait_exec_queue(vm, q), vm,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 fence);
> =C2=A0	dma_fence_put(fence);
> =C2=A0
> =C2=A0	return err;
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index d6e2a0fdd4b3..542dbe2f9310 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -221,11 +221,6 @@ struct xe_vm {
> =C2=A0#define XE_VM_FLAG_GSC			BIT(8)
> =C2=A0	unsigned long flags;
> =C2=A0
> -	/** @composite_fence_ctx: context composite fence */
> -	u64 composite_fence_ctx;
> -	/** @composite_fence_seqno: seqno for composite fence */
> -	u32 composite_fence_seqno;
> -
> =C2=A0	/**
> =C2=A0	 * @lock: outer most lock, protects objects of anything
> attached to this
> =C2=A0	 * VM

