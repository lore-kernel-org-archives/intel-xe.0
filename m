Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0442ECCD1BE
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 12:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AB610E401;
	Thu, 23 Oct 2025 12:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YUft0BG+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46F510E3FC
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 12:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761222489; x=1792758489;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=j66+3sO+R0TYVluG0nZYWWlwI3HyZh6TeynPueW/9ik=;
 b=YUft0BG+WaOEXRntogvatXDBTPDQI2IMBljYTbLTkxbTkVrQ3b6rDZm8
 CVybXaTSt9I5Rf9eJgu+W2pplSiGX+eESbSOLrfLqesYNlupSI7U3YiVg
 XIOFwuec48QmWteGvMLbmFmvNejFvH//Fb1xQGKQ46iPJAHMTJX+Pg4ew
 HF7vzWRFojfzwPcasGLeCZgxcFKEWbv0+mkLfEMK8WGNJ3TRzOry3lpdy
 +07M0sHcnhel7hS3Rx31OUzLNudR57tQq299cnmhOO0yFiRiDgsM9ur/c
 H8yoU/HY8wZEPvFxOx2TX2Ac0nZReB2yvV0QEjk8dZjLoP4ue76wpbo+6 w==;
X-CSE-ConnectionGUID: aZqr8cOkRzSZCmR4Pox3Kw==
X-CSE-MsgGUID: yQz242N2QOWNHB2t5YGszQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62418727"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="62418727"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 05:28:08 -0700
X-CSE-ConnectionGUID: HTHV1zy3QgGELtJtntkBZg==
X-CSE-MsgGUID: wnIm7mZySlS3/TDuUDWE7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="184626180"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.244.166])
 ([10.245.244.166])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 05:28:07 -0700
Message-ID: <46098af5c1d4d98f0e498b2c6968c7a04caacefe.camel@linux.intel.com>
Subject: Re: [PATCH 1/1] drm/xe: Avoid serializing unbind jobs on prior TLB
 invalidations
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: carlos.santa@intel.com
Date: Thu, 23 Oct 2025 14:28:05 +0200
In-Reply-To: <20251017165217.493595-2-matthew.brost@intel.com>
References: <20251017165217.493595-1-matthew.brost@intel.com>
 <20251017165217.493595-2-matthew.brost@intel.com>
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

Hi Matt

On Fri, 2025-10-17 at 09:52 -0700, Matthew Brost wrote:
> When a burst of unbind jobs is issued, a dependency chain can form
> between the TLB invalidation of a previous unbind job and the current
> one. This leads to undesirable serialization, causing current jobs to
> wait unnecessarily for prior TLB invalidations, execute on the GPU
> when
> not needed, and significantly slow down the unbind burst=E2=80=94resultin=
g in
> up
> to a 4=C3=97 slowdown.
>=20
> To break this chain, mask the last bind queue dependency if the last
> fence's DMA context matches the TLB invalidation context. This allows
> full pipelining of unbinds and TLB invalidations while preserving
> correct dma-fence signaling semantics.
>=20
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6047
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Some comments below.

Apart from that, it looks like this stems from us always combining the
exec_queue fence and TLB fence into an out_fence and then use that as
the exec_queue_last_fence.

But IMO the exec_queue last fence should always be a single gpu_job
fence, with the exception of no bind jobs, so that we store the gpu_job
fence as the last fence, and *then* combine with any TLB fence as the
out fence.


> ---
> =C2=A0drivers/gpu/drm/xe/xe_exec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue.c=C2=A0=C2=A0=C2=A0 | 18 +++++++++=
--
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue.h=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15 +++++++--
> =C2=A0drivers/gpu/drm/xe/xe_sched_job.c=C2=A0=C2=A0=C2=A0=C2=A0 | 44
> ++++++++++++++++++++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_sched_job.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7=
 ++++-
> =C2=A0drivers/gpu/drm/xe/xe_tlb_inval_job.c | 14 +++++++++
> =C2=A0drivers/gpu/drm/xe/xe_tlb_inval_job.h |=C2=A0 2 ++
> =C2=A08 files changed, 98 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec.c
> b/drivers/gpu/drm/xe/xe_exec.c
> index 0dc27476832b..6034cfc8be06 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -294,7 +294,8 @@ int xe_exec_ioctl(struct drm_device *dev, void
> *data, struct drm_file *file)
> =C2=A0		goto err_put_job;
> =C2=A0
> =C2=A0	if (!xe_vm_in_lr_mode(vm)) {
> -		err =3D xe_sched_job_last_fence_add_dep(job, vm);
> +		err =3D xe_sched_job_last_fence_add_dep(job, vm,
> NO_MASK_DEP,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NO_MASK_DEP);
> =C2=A0		if (err)
> =C2=A0			goto err_put_job;
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 90cbc95f8e2e..d6f69d9bccba 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -25,6 +25,7 @@
> =C2=A0#include "xe_migrate.h"
> =C2=A0#include "xe_pm.h"
> =C2=A0#include "xe_ring_ops_types.h"
> +#include "xe_sched_job.h"
> =C2=A0#include "xe_trace.h"
> =C2=A0#include "xe_vm.h"
> =C2=A0#include "xe_pxp.h"
> @@ -1106,11 +1107,17 @@ void xe_exec_queue_last_fence_set(struct
> xe_exec_queue *q, struct xe_vm *vm,
> =C2=A0 * xe_exec_queue_last_fence_test_dep - Test last fence dependency o=
f
> queue
> =C2=A0 * @q: The exec queue
> =C2=A0 * @vm: The VM the engine does a bind or exec for
> + * @mask_ctx0: Mask dma-fence context0
> + * @mask_ctx1: Mask dma-fence context1
> + *
> + * Test last fence dependency of queue, skipping masked dma fence
> contexts.
> =C2=A0 *
> =C2=A0 * Returns:
> - * -ETIME if there exists an unsignalled last fence dependency, zero
> otherwise.
> + * -ETIME if there exists an unsignalled and unmasked last fence
> dependency,
> + * zero otherwise.
> =C2=A0 */
> -int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> struct xe_vm *vm)
> +int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> struct xe_vm *vm,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 mask_ctx0, u64 mask_ctx1)
> =C2=A0{
> =C2=A0	struct dma_fence *fence;
> =C2=A0	int err =3D 0;
> @@ -1119,6 +1126,13 @@ int xe_exec_queue_last_fence_test_dep(struct
> xe_exec_queue *q, struct xe_vm *vm)
> =C2=A0	if (fence) {
> =C2=A0		err =3D test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence-
> >flags) ?
> =C2=A0			0 : -ETIME;
> +
> +		if (err =3D=3D -ETIME) {
> +			if (xe_sched_job_mask_dependency(fence,
> mask_ctx0,
> +							 mask_ctx1))
> +				err =3D 0;
> +		}
> +
> =C2=A0		dma_fence_put(fence);
> =C2=A0	}
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h
> b/drivers/gpu/drm/xe/xe_exec_queue.h
> index a4dfbe858bda..99a35b22a46c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -85,7 +85,8 @@ struct dma_fence
> *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *
> =C2=A0void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct
> xe_vm *vm,
> =C2=A0				=C2=A0 struct dma_fence *fence);
> =C2=A0int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm *vm);
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm *vm, u64
> mask_ctx0,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 mask_ctx1);
> =C2=A0void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
> =C2=A0
> =C2=A0int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, voi=
d
> *scratch);
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index d22fd1ccc0ba..bba9ae559f57 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1341,10 +1341,21 @@ static int xe_pt_vm_dependencies(struct
> xe_sched_job *job,
> =C2=A0	}
> =C2=A0
> =C2=A0	if (!(pt_update_ops->q->flags & EXEC_QUEUE_FLAG_KERNEL)) {
> +		u64 mask_ctx0 =3D NO_MASK_DEP, mask_ctx1 =3D
> NO_MASK_DEP;
> +
> +		if (ijob)
> +			mask_ctx0 =3D
> xe_tlb_inval_job_fence_context(ijob);
> +		if (mjob)
> +			mask_ctx1 =3D
> xe_tlb_inval_job_fence_context(mjob);
> +
> =C2=A0		if (job)
> -			err =3D xe_sched_job_last_fence_add_dep(job,
> vm);
> +			err =3D xe_sched_job_last_fence_add_dep(job,
> vm,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> mask_ctx0,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> mask_ctx1);
> =C2=A0		else
> -			err =3D
> xe_exec_queue_last_fence_test_dep(pt_update_ops->q, vm);
> +			err =3D
> xe_exec_queue_last_fence_test_dep(pt_update_ops->q,
> +								vm,
> mask_ctx0,
> +								mask
> _ctx1);
> =C2=A0	}
> =C2=A0
> =C2=A0	for (i =3D 0; job && !err && i < vops->num_syncs; i++)
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c
> b/drivers/gpu/drm/xe/xe_sched_job.c
> index d21bf8f26964..7cbdd87904c6 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -6,6 +6,7 @@
> =C2=A0#include "xe_sched_job.h"
> =C2=A0
> =C2=A0#include <uapi/drm/xe_drm.h>
> +#include <linux/dma-fence-array.h>
> =C2=A0#include <linux/dma-fence-chain.h>
> =C2=A0#include <linux/slab.h>
> =C2=A0
> @@ -295,19 +296,60 @@ void xe_sched_job_push(struct xe_sched_job
> *job)
> =C2=A0	xe_sched_job_put(job);
> =C2=A0}
> =C2=A0
> +/**
> + * xe_sched_job_mask_dependency() - Determine if a dma-fence
> dependency can be masked
> + * @fence: The dma-fence to check
> + * @mask_ctx0: First context to compare against the fence's context
> + * @mask_ctx1: Second context to compare against the fence's context
> + *
> + * This function checks whether the context of the given dma-fence
> matches
> + * either of the provided mask contexts. If a match is found, the
> dependency
> + * represented by the fence can be skipped. If the fence is a dma-
> fence-array,
> + * its individual fences are unwound and checked.
> + *
> + * Return: true if the fence can be masked (i.e., skipped), false
> otherwise.
> + */
> +bool xe_sched_job_mask_dependency(struct dma_fence *fence, u64
> mask_ctx0,
> +				=C2=A0 u64 mask_ctx1)
> +{
> +	if (dma_fence_is_array(fence)) {
> +		struct dma_fence *__fence;
> +		int index;
> +
> +		dma_fence_array_for_each(__fence, index, fence)
> +			if (__fence->context =3D=3D mask_ctx0 ||
> +			=C2=A0=C2=A0=C2=A0 __fence->context =3D=3D mask_ctx1)
> +				return true;

What if there are other fences in the array that don't match the
contexts? Don't we lose them.

On a different side-note, when looking at the code it looks like the
last fence could in theory be an array_fence[tiles] of
array_fence[gts]. I don't think we have such HW yet, but IIRC dma_fence
container rules do not allow that.

Thanks,
Thomas



> +	} else if (fence->context =3D=3D mask_ctx0 ||
> +		=C2=A0=C2=A0 fence->context =3D=3D mask_ctx1) {
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_sched_job_last_fence_add_dep - Add last fence dependency to
> job
> =C2=A0 * @job:job to add the last fence dependency to
> =C2=A0 * @vm: virtual memory job belongs to
> + * @mask_ctx0: Mask dma-fence context0
> + * @mask_ctx1: Mask dma-fence context1
> + *
> + * Add last fence dependency to job, skipping masked dma fence
> contexts.
> =C2=A0 *
> =C2=A0 * Returns:
> =C2=A0 * 0 on success, or an error on failing to expand the array.
> =C2=A0 */
> -int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct
> xe_vm *vm)
> +int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct
> xe_vm *vm,
> +				=C2=A0=C2=A0=C2=A0 u64 mask_ctx0, u64 mask_ctx1)
> =C2=A0{
> =C2=A0	struct dma_fence *fence;
> =C2=A0
> =C2=A0	fence =3D xe_exec_queue_last_fence_get(job->q, vm);
> +	if (xe_sched_job_mask_dependency(fence, mask_ctx0,
> mask_ctx1)) {
> +		dma_fence_put(fence);
> +		return 0;
> +	}
> =C2=A0
> =C2=A0	return drm_sched_job_add_dependency(&job->drm, fence);
> =C2=A0}
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.h
> b/drivers/gpu/drm/xe/xe_sched_job.h
> index 3dc72c5c1f13..81d8e848e605 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job.h
> @@ -58,7 +58,8 @@ bool xe_sched_job_completed(struct xe_sched_job
> *job);
> =C2=A0void xe_sched_job_arm(struct xe_sched_job *job);
> =C2=A0void xe_sched_job_push(struct xe_sched_job *job);
> =C2=A0
> -int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct
> xe_vm *vm);
> +int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct
> xe_vm *vm,
> +				=C2=A0=C2=A0=C2=A0 u64 mask_ctx0, u64 mask_ctx1);
> =C2=A0void xe_sched_job_init_user_fence(struct xe_sched_job *job,
> =C2=A0				=C2=A0 struct xe_sync_entry *sync);
> =C2=A0
> @@ -93,4 +94,8 @@ void xe_sched_job_snapshot_print(struct
> xe_sched_job_snapshot *snapshot, struct
> =C2=A0int xe_sched_job_add_deps(struct xe_sched_job *job, struct dma_resv
> *resv,
> =C2=A0			=C2=A0 enum dma_resv_usage usage);
> =C2=A0
> +#define NO_MASK_DEP	(~0x0ull)
> +bool xe_sched_job_mask_dependency(struct dma_fence *fence, u64
> mask_ctx0,
> +				=C2=A0 u64 mask_ctx1);
> +
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> index 492def04a559..f2fe7f9fbb22 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> @@ -32,6 +32,8 @@ struct xe_tlb_inval_job {
> =C2=A0	u64 start;
> =C2=A0	/** @end: End address to invalidate */
> =C2=A0	u64 end;
> +	/** @fence_context: Fence context for job */
> +	u64 fence_context;
> =C2=A0	/** @asid: Address space ID to invalidate */
> =C2=A0	u32 asid;
> =C2=A0	/** @fence_armed: Fence has been armed */
> @@ -101,6 +103,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q,
> struct xe_tlb_inval *tlb_inval,
> =C2=A0	job->asid =3D asid;
> =C2=A0	job->fence_armed =3D false;
> =C2=A0	job->dep.ops =3D &dep_job_ops;
> +	job->fence_context =3D entity->fence_context + 1;
> =C2=A0	kref_init(&job->refcount);
> =C2=A0	xe_exec_queue_get(q);	/* Pairs with put in
> xe_tlb_inval_job_destroy */
> =C2=A0
> @@ -266,3 +269,14 @@ void xe_tlb_inval_job_put(struct
> xe_tlb_inval_job *job)
> =C2=A0	if (!IS_ERR_OR_NULL(job))
> =C2=A0		kref_put(&job->refcount, xe_tlb_inval_job_destroy);
> =C2=A0}
> +
> +/**
> + * xe_tlb_inval_job_fence_context() - TLB invalidation job fence
> context
> + * @job: TLB invalidation job object
> + *
> + * Return: TLB invalidation job fence context
> + */
> +u64 xe_tlb_inval_job_fence_context(struct xe_tlb_inval_job *job)
> +{
> +	return job->fence_context;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> index e63edcb26b50..2576165c2228 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> @@ -30,4 +30,6 @@ void xe_tlb_inval_job_get(struct xe_tlb_inval_job
> *job);
> =C2=A0
> =C2=A0void xe_tlb_inval_job_put(struct xe_tlb_inval_job *job);
> =C2=A0
> +u64 xe_tlb_inval_job_fence_context(struct xe_tlb_inval_job *job);
> +
> =C2=A0#endif

