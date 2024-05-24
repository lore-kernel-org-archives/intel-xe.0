Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029D4C25B7A
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 13:22:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800DA10F323;
	Fri, 24 May 2024 13:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LhUpby0i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF64489C68
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 13:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716556960; x=1748092960;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=AmGiVpmJda+wFBxSbNgo8QvojTYx4hTeF8/PbozRA7I=;
 b=LhUpby0iMMxHKuNZTfWfb01ep3LZbLMwDWlv9FbeIO2GAYJzOpcMRyXa
 +hUzg4HF2awEBoNrlj5j2EUj2q3aTPkId9256Qw9oSiHwwcY4hc6eiKXt
 qI8wgcax9hhtofTsVt82OZmzE9A6HK2I30UWrMtTv7Yykm7npkn+bQvXu
 f7AG9nkVjBJAJ/gsmz3I9/buPjIlwzS1+sa2Vg37ltM4tmTfdvtOLJ1Ex
 ve3WvdWpYjgUYOqjTbdwMks7q/EivbU0Vb4ZTsw1pjfGNIFHIPjkAyY5J
 S5MJjSMUlesrQQkFbwRRs0TH8AGIYVoZh9z3dNw0Hy+UQkPjCrCu20hJe Q==;
X-CSE-ConnectionGUID: Nyl3GSsvQ9uDIGyEVTUwGQ==
X-CSE-MsgGUID: uH0sqspCSSiIEieHVCDlXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="35447850"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="35447850"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 06:22:39 -0700
X-CSE-ConnectionGUID: T95xs8LuRiWUUC8TgPceLQ==
X-CSE-MsgGUID: 8n8OjYMBT2Sw82EZoHWNIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="64832514"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO [10.245.246.112])
 ([10.245.246.112])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 06:22:36 -0700
Message-ID: <96e1e573e0be75b29d0935c69a32158d6f20d1d5.camel@linux.intel.com>
Subject: Re: [PATCH v3 3/5] drm/xe: Don't initialize fences at
 xe_sched_job_create()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
Date: Fri, 24 May 2024 15:22:33 +0200
In-Reply-To: <ZlCSNtSd67eXcqBk@intel.com>
References: <20240524071940.83042-1-thomas.hellstrom@linux.intel.com>
 <20240524071940.83042-4-thomas.hellstrom@linux.intel.com>
 <ZlCSNtSd67eXcqBk@intel.com>
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

Thanks for reviewing.

On Fri, 2024-05-24 at 09:12 -0400, Rodrigo Vivi wrote:
> On Fri, May 24, 2024 at 09:19:38AM +0200, Thomas Hellstr=C3=B6m wrote:
> > Pre-allocate but don't initialize fences at xe_sched_job_create(),
> > and initialize / arm them instead at xe_sched_job_arm(). This
> > makes it possible to move xe_sched_job_create() with its memory
> > allocation out of any lock that is required for fence
> > initialization, and that may not allow memory allocation under it.
> >=20
> > Replaces the struct dma_fence_array for parallell jobs with a
> > struct dma_fence_chain, since the former doesn't allow
> > a split-up between allocation and initialization.
>=20
> I'm wondering if it would be possible/better to split this change
> in a separate patch.

It's possible to do it as a prereq, but then we'd have to remove all
the new code since we'd had to allocate and initialize in _job_create()
to be really consistent. So I think it is better here.

>=20
> >=20
> > v2:
> > - Rebase.
> > - Don't always use the first lrc when initializing parallel
> > =C2=A0 lrc fences.
> > - Use dma_fence_chain_contained() to access the lrc fences.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_exec_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 5 -
> > =C2=A0drivers/gpu/drm/xe/xe_exec_queue_types.h |=C2=A0 10 --
> > =C2=A0drivers/gpu/drm/xe/xe_ring_ops.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 12 +-
> > =C2=A0drivers/gpu/drm/xe/xe_sched_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 159 +++++++++++++------
> > ----
> > =C2=A0drivers/gpu/drm/xe/xe_sched_job_types.h=C2=A0 |=C2=A0 18 ++-
> > =C2=A0drivers/gpu/drm/xe/xe_trace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A06 files changed, 113 insertions(+), 93 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index e8bf250f5b6a..e3cebec3de24 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -96,11 +96,6 @@ static struct xe_exec_queue
> > *__xe_exec_queue_alloc(struct xe_device *xe,
> > =C2=A0		}
> > =C2=A0	}
> > =C2=A0
> > -	if (xe_exec_queue_is_parallel(q)) {
> > -		q->parallel.composite_fence_ctx =3D
> > dma_fence_context_alloc(1);
> > -		q->parallel.composite_fence_seqno =3D 0;
> > -	}
> > -
> > =C2=A0	return q;
> > =C2=A0}
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index ee78d497d838..f0c40e8ad80a 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -103,16 +103,6 @@ struct xe_exec_queue {
> > =C2=A0		struct xe_guc_exec_queue *guc;
> > =C2=A0	};
> > =C2=A0
> > -	/**
> > -	 * @parallel: parallel submission state
> > -	 */
> > -	struct {
> > -		/** @parallel.composite_fence_ctx: context
> > composite fence */
> > -		u64 composite_fence_ctx;
> > -		/** @parallel.composite_fence_seqno: seqno for
> > composite fence */
> > -		u32 composite_fence_seqno;
> > -	} parallel;
> > -
> > =C2=A0	/** @sched_props: scheduling properties */
> > =C2=A0	struct {
> > =C2=A0		/** @sched_props.timeslice_us: timeslice period in
> > micro-seconds */
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index 2705d1f9d572..f75756e7a87b 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -366,7 +366,7 @@ static void emit_migration_job_gen12(struct
> > xe_sched_job *job,
> > =C2=A0
> > =C2=A0	dw[i++] =3D MI_ARB_ON_OFF | MI_ARB_DISABLE; /* Enabled again
> > below */
> > =C2=A0
> > -	i =3D emit_bb_start(job->batch_addr[0], BIT(8), dw, i);
> > +	i =3D emit_bb_start(job->ptrs[0].batch_addr, BIT(8), dw, i);
> > =C2=A0
> > =C2=A0	if (!IS_SRIOV_VF(gt_to_xe(job->q->gt))) {
> > =C2=A0		/* XXX: Do we need this? Leaving for now. */
> > @@ -375,7 +375,7 @@ static void emit_migration_job_gen12(struct
> > xe_sched_job *job,
> > =C2=A0		dw[i++] =3D preparser_disable(false);
> > =C2=A0	}
> > =C2=A0
> > -	i =3D emit_bb_start(job->batch_addr[1], BIT(8), dw, i);
> > +	i =3D emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
> > =C2=A0
> > =C2=A0	dw[i++] =3D MI_FLUSH_DW | MI_INVALIDATE_TLB | job-
> > >migrate_flush_flags |
> > =C2=A0		MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW;
> > @@ -397,7 +397,7 @@ static void emit_job_gen12_gsc(struct
> > xe_sched_job *job)
> > =C2=A0	xe_gt_assert(gt, job->q->width <=3D 1); /* no parallel
> > submission for GSCCS */
> > =C2=A0
> > =C2=A0	__emit_job_gen12_simple(job, job->q->lrc,
> > -				job->batch_addr[0],
> > +				job->ptrs[0].batch_addr,
> > =C2=A0				xe_sched_job_lrc_seqno(job));
> > =C2=A0}
> > =C2=A0
> > @@ -413,7 +413,7 @@ static void emit_job_gen12_copy(struct
> > xe_sched_job *job)
> > =C2=A0
> > =C2=A0	for (i =3D 0; i < job->q->width; ++i)
> > =C2=A0		__emit_job_gen12_simple(job, job->q->lrc + i,
> > -					job->batch_addr[i],
> > +					job->ptrs[i].batch_addr,
> > =C2=A0					xe_sched_job_lrc_seqno(job
> > ));
> > =C2=A0}
> > =C2=A0
> > @@ -424,7 +424,7 @@ static void emit_job_gen12_video(struct
> > xe_sched_job *job)
> > =C2=A0	/* FIXME: Not doing parallel handshake for now */
> > =C2=A0	for (i =3D 0; i < job->q->width; ++i)
> > =C2=A0		__emit_job_gen12_video(job, job->q->lrc + i,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job->batch_addr[i],
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job->ptrs[i].batch_addr,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > xe_sched_job_lrc_seqno(job));
> > =C2=A0}
> > =C2=A0
> > @@ -434,7 +434,7 @@ static void
> > emit_job_gen12_render_compute(struct xe_sched_job *job)
> > =C2=A0
> > =C2=A0	for (i =3D 0; i < job->q->width; ++i)
> > =C2=A0		__emit_job_gen12_render_compute(job, job->q->lrc +
> > i,
> > -						job-
> > >batch_addr[i],
> > +						job-
> > >ptrs[i].batch_addr,
> > =C2=A0						xe_sched_job_lrc_s
> > eqno(job));
> > =C2=A0}
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c
> > b/drivers/gpu/drm/xe/xe_sched_job.c
> > index 874450be327e..4537c7f9099f 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > @@ -6,7 +6,7 @@
> > =C2=A0#include "xe_sched_job.h"
> > =C2=A0
> > =C2=A0#include <drm/xe_drm.h>
> > -#include <linux/dma-fence-array.h>
> > +#include <linux/dma-fence-chain.h>
> > =C2=A0#include <linux/slab.h>
> > =C2=A0
> > =C2=A0#include "xe_device.h"
> > @@ -29,7 +29,7 @@ int __init xe_sched_job_module_init(void)
> > =C2=A0	xe_sched_job_slab =3D
> > =C2=A0		kmem_cache_create("xe_sched_job",
> > =C2=A0				=C2=A0 sizeof(struct xe_sched_job) +
> > -				=C2=A0 sizeof(u64), 0,
> > +				=C2=A0 sizeof(struct xe_job_ptrs), 0,
> > =C2=A0				=C2=A0 SLAB_HWCACHE_ALIGN, NULL);
> > =C2=A0	if (!xe_sched_job_slab)
> > =C2=A0		return -ENOMEM;
> > @@ -37,7 +37,7 @@ int __init xe_sched_job_module_init(void)
> > =C2=A0	xe_sched_job_parallel_slab =3D
> > =C2=A0		kmem_cache_create("xe_sched_job_parallel",
> > =C2=A0				=C2=A0 sizeof(struct xe_sched_job) +
> > -				=C2=A0 sizeof(u64) *
> > +				=C2=A0 sizeof(struct xe_job_ptrs) *
> > =C2=A0				=C2=A0 XE_HW_ENGINE_MAX_INSTANCE, 0,
> > =C2=A0				=C2=A0 SLAB_HWCACHE_ALIGN, NULL);
> > =C2=A0	if (!xe_sched_job_parallel_slab) {
> > @@ -79,26 +79,33 @@ static struct xe_device *job_to_xe(struct
> > xe_sched_job *job)
> > =C2=A0	return gt_to_xe(job->q->gt);
> > =C2=A0}
> > =C2=A0
> > +/* Free unused pre-allocated fences */
> > +static void xe_sched_job_free_fences(struct xe_sched_job *job)
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < job->q->width; ++i) {
> > +		struct xe_job_ptrs *ptrs =3D &job->ptrs[i];
> > +
> > +		if (ptrs->lrc_fence)
> > +			xe_lrc_free_seqno_fence(ptrs->lrc_fence);
> > +		if (ptrs->chain_fence)
> > +			dma_fence_chain_free(ptrs->chain_fence);
> > +	}
> > +}
> > +
> > =C2=A0struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
> > =C2=A0					 u64 *batch_addr)
> > =C2=A0{
> > -	struct xe_sched_job *job;
> > -	struct dma_fence **fences;
> > =C2=A0	bool is_migration =3D xe_sched_job_is_migration(q);
> > +	struct xe_sched_job *job;
> > =C2=A0	int err;
> > -	int i, j;
> > +	int i;
> > =C2=A0	u32 width;
> > =C2=A0
> > =C2=A0	/* only a kernel context can submit a vm-less job */
> > =C2=A0	XE_WARN_ON(!q->vm && !(q->flags &
> > EXEC_QUEUE_FLAG_KERNEL));
> > =C2=A0
> > -	/* Migration and kernel engines have their own locking */
> > -	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL |
> > EXEC_QUEUE_FLAG_VM))) {
> > -		lockdep_assert_held(&q->vm->lock);
> > -		if (!xe_vm_in_lr_mode(q->vm))
> > -			xe_vm_assert_held(q->vm);
> > -	}
> > -
> > =C2=A0	job =3D job_alloc(xe_exec_queue_is_parallel(q) ||
> > is_migration);
> > =C2=A0	if (!job)
> > =C2=A0		return ERR_PTR(-ENOMEM);
> > @@ -111,43 +118,25 @@ struct xe_sched_job
> > *xe_sched_job_create(struct xe_exec_queue *q,
> > =C2=A0	if (err)
> > =C2=A0		goto err_free;
> > =C2=A0
> > -	if (!xe_exec_queue_is_parallel(q)) {
> > -		job->fence =3D xe_lrc_create_seqno_fence(q->lrc);
> > -		if (IS_ERR(job->fence)) {
> > -			err =3D PTR_ERR(job->fence);
> > -			goto err_sched_job;
> > -		}
> > -		job->lrc_seqno =3D job->fence->seqno;
> > -	} else {
> > -		struct dma_fence_array *cf;
> > +	for (i =3D 0; i < q->width; ++i) {
> > +		struct dma_fence *fence =3D
> > xe_lrc_alloc_seqno_fence();
> > +		struct dma_fence_chain *chain;
> > =C2=A0
> > -		fences =3D kmalloc_array(q->width, sizeof(*fences),
> > GFP_KERNEL);
> > -		if (!fences) {
> > -			err =3D -ENOMEM;
> > +		if (IS_ERR(fence)) {
> > +			err =3D PTR_ERR(fence);
> > =C2=A0			goto err_sched_job;
> > =C2=A0		}
> > +		job->ptrs[i].lrc_fence =3D fence;
> > =C2=A0
> > -		for (j =3D 0; j < q->width; ++j) {
> > -			fences[j] =3D xe_lrc_create_seqno_fence(q-
> > >lrc + j);
> > -			if (IS_ERR(fences[j])) {
> > -				err =3D PTR_ERR(fences[j]);
> > -				goto err_fences;
> > -			}
> > -			if (!j)
> > -				job->lrc_seqno =3D fences[0]->seqno;
> > -		}
> > +		if (i + 1 =3D=3D q->width)
> > +			continue;
> > =C2=A0
> > -		cf =3D dma_fence_array_create(q->width, fences,
> > -					=C2=A0=C2=A0=C2=A0 q-
> > >parallel.composite_fence_ctx,
> > -					=C2=A0=C2=A0=C2=A0 q-
> > >parallel.composite_fence_seqno++,
> > -					=C2=A0=C2=A0=C2=A0 false);
> > -		if (!cf) {
> > -			--q->parallel.composite_fence_seqno;
> > +		chain =3D dma_fence_chain_alloc();
> > +		if (!chain) {
> > =C2=A0			err =3D -ENOMEM;
> > -			goto err_fences;
> > +			goto err_sched_job;
> > =C2=A0		}
> > -
> > -		job->fence =3D &cf->base;
> > +		job->ptrs[i].chain_fence =3D chain;
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	width =3D q->width;
> > @@ -155,19 +144,14 @@ struct xe_sched_job
> > *xe_sched_job_create(struct xe_exec_queue *q,
> > =C2=A0		width =3D 2;
> > =C2=A0
> > =C2=A0	for (i =3D 0; i < width; ++i)
> > -		job->batch_addr[i] =3D batch_addr[i];
> > +		job->ptrs[i].batch_addr =3D batch_addr[i];
> > =C2=A0
> > =C2=A0	xe_pm_runtime_get_noresume(job_to_xe(job));
> > =C2=A0	trace_xe_sched_job_create(job);
> > =C2=A0	return job;
> > =C2=A0
> > -err_fences:
> > -	for (j =3D j - 1; j >=3D 0; --j) {
> > -		--q->lrc[j].fence_ctx.next_seqno;
> > -		dma_fence_put(fences[j]);
> > -	}
> > -	kfree(fences);
> > =C2=A0err_sched_job:
> > +	xe_sched_job_free_fences(job);
> > =C2=A0	drm_sched_job_cleanup(&job->drm);
> > =C2=A0err_free:
> > =C2=A0	xe_exec_queue_put(q);
> > @@ -188,6 +172,7 @@ void xe_sched_job_destroy(struct kref *ref)
> > =C2=A0		container_of(ref, struct xe_sched_job, refcount);
> > =C2=A0	struct xe_device *xe =3D job_to_xe(job);
> > =C2=A0
> > +	xe_sched_job_free_fences(job);
> > =C2=A0	xe_exec_queue_put(job->q);
> > =C2=A0	dma_fence_put(job->fence);
> > =C2=A0	drm_sched_job_cleanup(&job->drm);
> > @@ -195,27 +180,32 @@ void xe_sched_job_destroy(struct kref *ref)
> > =C2=A0	xe_pm_runtime_put(xe);
> > =C2=A0}
> > =C2=A0
> > -void xe_sched_job_set_error(struct xe_sched_job *job, int error)
> > +/* Set the error status under the fence to avoid racing with
> > signaling */
> > +static bool xe_fence_set_error(struct dma_fence *fence, int error)
> > =C2=A0{
> > -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence-
> > >flags))
> > -		return;
> > +	unsigned long irq_flags;
> > +	bool signaled;
> > =C2=A0
> > -	dma_fence_set_error(job->fence, error);
> > +	spin_lock_irqsave(fence->lock, irq_flags);
> > +	signaled =3D test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence-
> > >flags);
> > +	if (!signaled)
> > +		dma_fence_set_error(fence, error);
> > +	spin_unlock_irqrestore(fence->lock, irq_flags);
> > +
> > +	return signaled;
> > +}
> > =C2=A0
> > -	if (dma_fence_is_array(job->fence)) {
> > -		struct dma_fence_array *array =3D
> > -			to_dma_fence_array(job->fence);
> > -		struct dma_fence **child =3D array->fences;
> > -		unsigned int nchild =3D array->num_fences;
> > +void xe_sched_job_set_error(struct xe_sched_job *job, int error)
> > +{
> > +	if (xe_fence_set_error(job->fence, error))
> > +		return;
> > =C2=A0
> > -		do {
> > -			struct dma_fence *current_fence =3D
> > *child++;
> > +	if (dma_fence_is_chain(job->fence)) {
> > +		struct dma_fence *iter;
> > =C2=A0
> > -			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 &current_fence->flags))
> > -				continue;
> > -			dma_fence_set_error(current_fence, error);
> > -		} while (--nchild);
> > +		dma_fence_chain_for_each(iter, job->fence)
> > +			xe_fence_set_error(dma_fence_chain_contain
> > ed(iter),
> > +					=C2=A0=C2=A0 error);
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	trace_xe_sched_job_set_error(job);
> > @@ -230,7 +220,7 @@ bool xe_sched_job_started(struct xe_sched_job
> > *job)
> > =C2=A0
> > =C2=A0	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 xe_lrc_start_seqno(lrc),
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 dma_fence_array_first(job-
> > >fence)->ops);
> > +				=C2=A0=C2=A0=C2=A0=C2=A0
> > dma_fence_chain_contained(job->fence)->ops);
> > =C2=A0}
> > =C2=A0
> > =C2=A0bool xe_sched_job_completed(struct xe_sched_job *job)
> > @@ -244,13 +234,24 @@ bool xe_sched_job_completed(struct
> > xe_sched_job *job)
> > =C2=A0
> > =C2=A0	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 xe_lrc_seqno(lrc),
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 dma_fence_array_first(job-
> > >fence)->ops);
> > +				=C2=A0=C2=A0=C2=A0=C2=A0
> > dma_fence_chain_contained(job->fence)->ops);
> > =C2=A0}
> > =C2=A0
> > =C2=A0void xe_sched_job_arm(struct xe_sched_job *job)
> > =C2=A0{
> > =C2=A0	struct xe_exec_queue *q =3D job->q;
> > +	struct dma_fence *fence, *prev;
> > =C2=A0	struct xe_vm *vm =3D q->vm;
> > +	u64 seqno =3D 0;
> > +	int i;
> > +
> > +	/* Migration and kernel engines have their own locking */
> > +	if (IS_ENABLED(CONFIG_LOCKDEP) &&
> > +	=C2=A0=C2=A0=C2=A0 !(q->flags & (EXEC_QUEUE_FLAG_KERNEL |
> > EXEC_QUEUE_FLAG_VM))) {
> > +		lockdep_assert_held(&q->vm->lock);
> > +		if (!xe_vm_in_lr_mode(q->vm))
> > +			xe_vm_assert_held(q->vm);
> > +	}
> > =C2=A0
> > =C2=A0	if (vm && !xe_sched_job_is_migration(q) &&
> > !xe_vm_in_lr_mode(vm) &&
> > =C2=A0	=C2=A0=C2=A0=C2=A0 (vm->batch_invalidate_tlb || vm->tlb_flush_se=
qno !=3D q-
> > >tlb_flush_seqno)) {
> > @@ -259,6 +260,25 @@ void xe_sched_job_arm(struct xe_sched_job
> > *job)
> > =C2=A0		job->ring_ops_flush_tlb =3D true;
> > =C2=A0	}
> > =C2=A0
> > +	/* Arm the pre-allocated fences */
> > +	for (i =3D 0; i < q->width; prev =3D fence, ++i) {
> > +		struct dma_fence_chain *chain;
> > +
> > +		fence =3D job->ptrs[i].lrc_fence;
> > +		xe_lrc_init_seqno_fence(&q->lrc[i], fence);
> > +		job->ptrs[i].lrc_fence =3D NULL;
> > +		if (!i) {
> > +			job->lrc_seqno =3D fence->seqno;
>=20
> same question of the first patch remains here...

I answered in the first patch thread.


>=20
> > +			continue;
>=20
> but here my doubt goes a bit beyond on why you only init
> the chain the non-first one.

The fence chain structure combines two fences into one.
Either two LRC fences, or a previous fence chain plus a LRC fence.
So on the first iteration, we don't yet have two fences to combine, so
that step is skipped. There's always one fence chain less than LRC
fences, and on non-parallel jobs there is no fence chain at all.

Thanks,
Thomas

>=20
> > +		}
> > +
> > +		chain =3D job->ptrs[i - 1].chain_fence;
> > +		dma_fence_chain_init(chain, prev, fence, seqno++);
> > +		job->ptrs[i - 1].chain_fence =3D NULL;
> > +		fence =3D &chain->base;
> > +	}
> > +
> > +	job->fence =3D fence;
> > =C2=A0	drm_sched_job_arm(&job->drm);
> > =C2=A0}
> > =C2=A0
> > @@ -318,7 +338,8 @@ xe_sched_job_snapshot_capture(struct
> > xe_sched_job *job)
> > =C2=A0
> > =C2=A0	snapshot->batch_addr_len =3D q->width;
> > =C2=A0	for (i =3D 0; i < q->width; i++)
> > -		snapshot->batch_addr[i] =3D
> > xe_device_uncanonicalize_addr(xe, job->batch_addr[i]);
> > +		snapshot->batch_addr[i] =3D
> > +			xe_device_uncanonicalize_addr(xe, job-
> > >ptrs[i].batch_addr);
> > =C2=A0
> > =C2=A0	return snapshot;
> > =C2=A0}
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > index 990ddac55ed6..0d3f76fb05ce 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > @@ -11,6 +11,20 @@
> > =C2=A0#include <drm/gpu_scheduler.h>
> > =C2=A0
> > =C2=A0struct xe_exec_queue;
> > +struct dma_fence;
> > +struct dma_fence_chain;
> > +
> > +/**
> > + * struct xe_job_ptrs - Per hw engine instance data
> > + */
> > +struct xe_job_ptrs {
> > +	/** @lrc_fence: Pre-allocated uinitialized lrc fence.*/
> > +	struct dma_fence *lrc_fence;
> > +	/** @chain_fence: Pre-allocated ninitialized fence chain
> > node. */
> > +	struct dma_fence_chain *chain_fence;
> > +	/** @batch_addr: Batch buffer address. */
> > +	u64 batch_addr;
> > +};
> > =C2=A0
> > =C2=A0/**
> > =C2=A0 * struct xe_sched_job - XE schedule job (batch buffer tracking)
> > @@ -43,8 +57,8 @@ struct xe_sched_job {
> > =C2=A0	u32 migrate_flush_flags;
> > =C2=A0	/** @ring_ops_flush_tlb: The ring ops need to flush TLB
> > before payload. */
> > =C2=A0	bool ring_ops_flush_tlb;
> > -	/** @batch_addr: batch buffer address of job */
> > -	u64 batch_addr[];
> > +	/** @ptrs: per instance pointers. */
> > +	struct xe_job_ptrs ptrs[];
>=20
> instance and ptrs sounds so generic here...
> I'm bad with names as well... but I'm wondering if it wouldn't be
> better
> to s/xe_sched_job *job/xe_sched_jobs *jobs/
> and then this one here is 'a' job: struct xe_job job[];
>=20
> Another bad option xe_batches_and_fences batches_and_fences[]; :/
>=20
> > =C2=A0};
> > =C2=A0
> > =C2=A0struct xe_sched_job_snapshot {
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h
> > b/drivers/gpu/drm/xe/xe_trace.h
> > index 6c6cecc58f63..450f407c66e8 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -272,7 +272,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
> > =C2=A0			=C2=A0=C2=A0 __entry->flags =3D job->q->flags;
> > =C2=A0			=C2=A0=C2=A0 __entry->error =3D job->fence->error;
> > =C2=A0			=C2=A0=C2=A0 __entry->fence =3D job->fence;
> > -			=C2=A0=C2=A0 __entry->batch_addr =3D (u64)job-
> > >batch_addr[0];
> > +			=C2=A0=C2=A0 __entry->batch_addr =3D (u64)job-
> > >ptrs[0].batch_addr;
> > =C2=A0			=C2=A0=C2=A0 ),
> > =C2=A0
> > =C2=A0		=C2=A0=C2=A0=C2=A0 TP_printk("fence=3D%p, seqno=3D%u, lrc_seqno=
=3D%u,
> > guc_id=3D%d, batch_addr=3D0x%012llx, guc_state=3D0x%x, flags=3D0x%x,
> > error=3D%d",
> > --=20
> > 2.44.0
> >=20

