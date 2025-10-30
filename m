Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81FDCCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 08:25:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95AB10E8D8;
	Thu, 30 Oct 2025 08:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlKqXGCv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870CC10E8D8
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 08:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761812702; x=1793348702;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=Va+N6DwboA+vAkmDtmfAAsxn2bJl302J3H+ka5Dq0gY=;
 b=mlKqXGCvQjqhTlnLMv55oaIMPL5xxEvn10HHDJpdcE1IpjAVF5w+bOCh
 Yzxvx9yZWeGByBCPUG8kjqTbkeaReNaspDrYzsacavA7WYOnmsENk1TBh
 2H4IKeUVFwmwoKiY4EQsZ2Sv1P4JPU+XWB1ch6mU6jNaxSUcX3NwJnLMK
 fennfy8iltU1zNT4ckN4KnVKJA0nBpSP48fFIktWbns1IrpBatZAnDK2w
 3UlkVrryrmZzevogD2aQ61zOutFtGP0Kb9vk3RxiQE+P9BgDa81xFhqNY
 8eZddlZXABYqcnATAsLXuUQ7D3+1/qGsLzfnL56OFGYBE6VXl+88Wht5S g==;
X-CSE-ConnectionGUID: FSOgO0rqSxugWnHWLewAAA==
X-CSE-MsgGUID: QHllp0nqQ7WeAbyaNn7K3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="74238072"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="74238072"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 01:25:02 -0700
X-CSE-ConnectionGUID: 5wP0kUnATbmBrU7CEtn7jA==
X-CSE-MsgGUID: rqN4HcwfQ92rNeZdT9Z0Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="185547697"
Received: from opintica-mobl1 (HELO [10.245.245.172]) ([10.245.245.172])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 01:25:01 -0700
Message-ID: <cc6705b5f45780f9750ecd3fa3234522456be7d2.camel@linux.intel.com>
Subject: Re: [PATCH v5 2/6] drm/xe: Attach last fence to TLB invalidation
 job queues
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Thu, 30 Oct 2025 09:24:59 +0100
In-Reply-To: <20251029205719.2746501-3-matthew.brost@intel.com>
References: <20251029205719.2746501-1-matthew.brost@intel.com>
 <20251029205719.2746501-3-matthew.brost@intel.com>
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
> Add support for attaching the last fence to TLB invalidation job
> queues
> to address serialization issues during bursts of unbind jobs. Ensure
> that user fence signaling for a bind job reflects both the bind job
> itself and the last fences of all related TLB invalidations. Maintain
> submission order based solely on the state of the bind and TLB
> invalidation queues.
>=20
> Introduce support functions for last fence attachment to TLB
> invalidation queues.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

>=20
> ---
> v3:
> =C2=A0- Fix assert in xe_exec_queue_tlb_inval_last_fence_set (CI)
> =C2=A0- Ensure migrate lock held for migrate queues (Testing)
> v5:
> =C2=A0- Style nits (Thomas)
> =C2=A0- Rewrite commit message (Thomas)
> ---
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 103
> ++++++++++++++++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 21 +++++
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue_types.h |=C2=A0=C2=A0 5 ++
> =C2=A0drivers/gpu/drm/xe/xe_migrate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 14 +++
> =C2=A0drivers/gpu/drm/xe/xe_migrate.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 ++
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +-
> =C2=A06 files changed, 156 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 6e168efbac65..b7551592fe3f 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -386,6 +386,7 @@ void xe_exec_queue_destroy(struct kref *ref)
> =C2=A0{
> =C2=A0	struct xe_exec_queue *q =3D container_of(ref, struct
> xe_exec_queue, refcount);
> =C2=A0	struct xe_exec_queue *eq, *next;
> +	int i;
> =C2=A0
> =C2=A0	if (q->ufence_syncobj)
> =C2=A0		drm_syncobj_put(q->ufence_syncobj);
> @@ -394,6 +395,9 @@ void xe_exec_queue_destroy(struct kref *ref)
> =C2=A0		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
> =C2=A0
> =C2=A0	xe_exec_queue_last_fence_put_unlocked(q);
> +	for_each_tlb_inval(i)
> +		xe_exec_queue_tlb_inval_last_fence_put_unlocked(q,
> i);
> +
> =C2=A0	if (!(q->flags & EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD)) {
> =C2=A0		list_for_each_entry_safe(eq, next, &q-
> >multi_gt_list,
> =C2=A0					 multi_gt_link)
> @@ -1011,7 +1015,9 @@ int xe_exec_queue_destroy_ioctl(struct
> drm_device *dev, void *data,
> =C2=A0static void xe_exec_queue_last_fence_lockdep_assert(struct
> xe_exec_queue *q,
> =C2=A0						=C2=A0=C2=A0=C2=A0 struct xe_vm
> *vm)
> =C2=A0{
> -	if (q->flags & EXEC_QUEUE_FLAG_VM) {
> +	if (q->flags & EXEC_QUEUE_FLAG_MIGRATE) {
> +		xe_migrate_job_lock_assert(q);
> +	} else if (q->flags & EXEC_QUEUE_FLAG_VM) {
> =C2=A0		lockdep_assert_held(&vm->lock);
> =C2=A0	} else {
> =C2=A0		xe_vm_assert_held(vm);
> @@ -1110,6 +1116,7 @@ void xe_exec_queue_last_fence_set(struct
> xe_exec_queue *q, struct xe_vm *vm,
> =C2=A0				=C2=A0 struct dma_fence *fence)
> =C2=A0{
> =C2=A0	xe_exec_queue_last_fence_lockdep_assert(q, vm);
> +	xe_assert(vm->xe, !dma_fence_is_container(fence));
> =C2=A0
> =C2=A0	xe_exec_queue_last_fence_put(q, vm);
> =C2=A0	q->last_fence =3D dma_fence_get(fence);
> @@ -1138,6 +1145,100 @@ int xe_exec_queue_last_fence_test_dep(struct
> xe_exec_queue *q, struct xe_vm *vm)
> =C2=A0	return err;
> =C2=A0}
> =C2=A0
> +/**
> + * xe_exec_queue_tlb_inval_last_fence_put() - Drop ref to last TLB
> invalidation fence
> + * @q: The exec queue
> + * @vm: The VM the engine does a bind for
> + * @type: Either primary or media GT
> + */
> +void xe_exec_queue_tlb_inval_last_fence_put(struct xe_exec_queue *q,
> +					=C2=A0=C2=A0=C2=A0 struct xe_vm *vm,
> +					=C2=A0=C2=A0=C2=A0 unsigned int type)
> +{
> +	xe_exec_queue_last_fence_lockdep_assert(q, vm);
> +	xe_assert(vm->xe, type =3D=3D XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT
> ||
> +		=C2=A0 type =3D=3D XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
> +
> +	xe_exec_queue_tlb_inval_last_fence_put_unlocked(q, type);
> +}
> +
> +/**
> + * xe_exec_queue_tlb_inval_last_fence_put_unlocked() - Drop ref to
> last TLB
> + * invalidation fence unlocked
> + * @q: The exec queue
> + * @type: Either primary or media GT
> + *
> + * Only safe to be called from xe_exec_queue_destroy().
> + */
> +void xe_exec_queue_tlb_inval_last_fence_put_unlocked(struct
> xe_exec_queue *q,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int
> type)
> +{
> +	xe_assert(q->vm->xe, type =3D=3D
> XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT ||
> +		=C2=A0 type =3D=3D XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
> +
> +	dma_fence_put(q->tlb_inval[type].last_fence);
> +	q->tlb_inval[type].last_fence =3D NULL;
> +}
> +
> +/**
> + * xe_exec_queue_tlb_inval_last_fence_get() - Get last fence for TLB
> invalidation
> + * @q: The exec queue
> + * @vm: The VM the engine does a bind for
> + * @type: Either primary or media GT
> + *
> + * Get last fence, takes a ref
> + *
> + * Returns: last fence if not signaled, dma fence stub if signaled
> + */
> +struct dma_fence *xe_exec_queue_tlb_inval_last_fence_get(struct
> xe_exec_queue *q,
> +							 struct
> xe_vm *vm,
> +							 unsigned
> int type)
> +{
> +	struct dma_fence *fence;
> +
> +	xe_exec_queue_last_fence_lockdep_assert(q, vm);
> +	xe_assert(vm->xe, type =3D=3D XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT
> ||
> +		=C2=A0 type =3D=3D XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
> +	xe_assert(vm->xe, q->flags & (EXEC_QUEUE_FLAG_VM |
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXEC_QUEUE_FLAG_MIGRATE));
> +
> +	if (q->tlb_inval[type].last_fence &&
> +	=C2=A0=C2=A0=C2=A0 test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 &q->tlb_inval[type].last_fence->flags))
> +		xe_exec_queue_tlb_inval_last_fence_put(q, vm, type);
> +
> +	fence =3D q->tlb_inval[type].last_fence ?:
> dma_fence_get_stub();
> +	dma_fence_get(fence);
> +	return fence;
> +}
> +
> +/**
> + * xe_exec_queue_tlb_inval_last_fence_set() - Set last fence for TLB
> invalidation
> + * @q: The exec queue
> + * @vm: The VM the engine does a bind for
> + * @fence: The fence
> + * @type: Either primary or media GT
> + *
> + * Set the last fence for the tlb invalidation type on the queue.
> Increases
> + * reference count for fence, when closing queue
> + * xe_exec_queue_tlb_inval_last_fence_put should be called.
> + */
> +void xe_exec_queue_tlb_inval_last_fence_set(struct xe_exec_queue *q,
> +					=C2=A0=C2=A0=C2=A0 struct xe_vm *vm,
> +					=C2=A0=C2=A0=C2=A0 struct dma_fence *fence,
> +					=C2=A0=C2=A0=C2=A0 unsigned int type)
> +{
> +	xe_exec_queue_last_fence_lockdep_assert(q, vm);
> +	xe_assert(vm->xe, type =3D=3D XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT
> ||
> +		=C2=A0 type =3D=3D XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
> +	xe_assert(vm->xe, q->flags & (EXEC_QUEUE_FLAG_VM |
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXEC_QUEUE_FLAG_MIGRATE));
> +	xe_assert(vm->xe, !dma_fence_is_container(fence));
> +
> +	xe_exec_queue_tlb_inval_last_fence_put(q, vm, type);
> +	q->tlb_inval[type].last_fence =3D dma_fence_get(fence);
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_exec_queue_contexts_hwsp_rebase - Re-compute GGTT references
> =C2=A0 * within all LRCs of a queue.
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h
> b/drivers/gpu/drm/xe/xe_exec_queue.h
> index a4dfbe858bda..1ba7354b33d1 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -14,6 +14,10 @@ struct drm_file;
> =C2=A0struct xe_device;
> =C2=A0struct xe_file;
> =C2=A0
> +#define for_each_tlb_inval(__i)	\
> +	for (__i =3D XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT; \
> +	=C2=A0=C2=A0=C2=A0=C2=A0 __i <=3D XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT; ++_=
_i)
> +
> =C2=A0struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe,
> struct xe_vm *vm,
> =C2=A0					=C2=A0=C2=A0 u32 logical_mask, u16
> width,
> =C2=A0					=C2=A0=C2=A0 struct xe_hw_engine
> *hw_engine, u32 flags,
> @@ -86,6 +90,23 @@ void xe_exec_queue_last_fence_set(struct
> xe_exec_queue *e, struct xe_vm *vm,
> =C2=A0				=C2=A0 struct dma_fence *fence);
> =C2=A0int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm *vm);
> +
> +void xe_exec_queue_tlb_inval_last_fence_put(struct xe_exec_queue *q,
> +					=C2=A0=C2=A0=C2=A0 struct xe_vm *vm,
> +					=C2=A0=C2=A0=C2=A0 unsigned int type);
> +
> +void xe_exec_queue_tlb_inval_last_fence_put_unlocked(struct
> xe_exec_queue *q,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int
> type);
> +
> +struct dma_fence *xe_exec_queue_tlb_inval_last_fence_get(struct
> xe_exec_queue *q,
> +							 struct
> xe_vm *vm,
> +							 unsigned
> int type);
> +
> +void xe_exec_queue_tlb_inval_last_fence_set(struct xe_exec_queue *q,
> +					=C2=A0=C2=A0=C2=A0 struct xe_vm *vm,
> +					=C2=A0=C2=A0=C2=A0 struct dma_fence *fence,
> +					=C2=A0=C2=A0=C2=A0 unsigned int type);
> +
> =C2=A0void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
> =C2=A0
> =C2=A0int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, voi=
d
> *scratch);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 838266c3914b..4ef61e803676 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -146,6 +146,11 @@ struct xe_exec_queue {
> =C2=A0		 * dependency scheduler
> =C2=A0		 */
> =C2=A0		struct xe_dep_scheduler *dep_scheduler;
> +		/**
> +		 * @last_fence: last fence for tlb invalidation,
> protected by
> +		 * vm->lock in write mode
> +		 */
> +		struct dma_fence *last_fence;
> =C2=A0	} tlb_inval[XE_EXEC_QUEUE_TLB_INVAL_COUNT];
> =C2=A0
> =C2=A0	/** @pxp: PXP info tracking */
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index 921c9c1ea41f..4567bc88a8ec 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -2333,6 +2333,20 @@ void xe_migrate_job_unlock(struct xe_migrate
> *m, struct xe_exec_queue *q)
> =C2=A0		xe_vm_assert_held(q->vm);	/* User queues VM's
> should be locked */
> =C2=A0}
> =C2=A0
> +#if IS_ENABLED(CONFIG_PROVE_LOCKING)
> +/**
> + * xe_migrate_job_lock_assert() - Assert migrate job lock held of
> queue
> + * @q: Migrate queue
> + */
> +void xe_migrate_job_lock_assert(struct xe_exec_queue *q)
> +{
> +	struct xe_migrate *m =3D gt_to_tile(q->gt)->migrate;
> +
> +	xe_gt_assert(q->gt, q =3D=3D m->q);
> +	lockdep_assert_held(&m->job_mutex);
> +}
> +#endif
> +
> =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> =C2=A0#include "tests/xe_migrate.c"
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> b/drivers/gpu/drm/xe/xe_migrate.h
> index 4fad324b6253..9b5791617f5e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -152,6 +152,14 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> =C2=A0
> =C2=A0void xe_migrate_wait(struct xe_migrate *m);
> =C2=A0
> +#if IS_ENABLED(CONFIG_PROVE_LOCKING)
> +void xe_migrate_job_lock_assert(struct xe_exec_queue *q);
> +#else
> +static inline void xe_migrate_job_lock_assert(struct xe_exec_queue
> *q)
> +{
> +}
> +#endif
> +
> =C2=A0void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue
> *q);
> =C2=A0void xe_migrate_job_unlock(struct xe_migrate *m, struct
> xe_exec_queue *q);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 4058c476aa2d..4241cc433dca 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1731,8 +1731,13 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> =C2=A0
> =C2=A0	down_write(&vm->lock);
> =C2=A0	for_each_tile(tile, xe, id) {
> -		if (vm->q[id])
> +		if (vm->q[id]) {
> +			int i;
> +
> =C2=A0			xe_exec_queue_last_fence_put(vm->q[id], vm);
> +			for_each_tlb_inval(i)
> +				xe_exec_queue_tlb_inval_last_fence_p
> ut(vm->q[id], vm, i);
> +		}
> =C2=A0	}
> =C2=A0	up_write(&vm->lock);
> =C2=A0

