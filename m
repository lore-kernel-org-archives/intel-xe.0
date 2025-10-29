Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5484BCCF9EB
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 16:05:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BB110E1FC;
	Wed, 29 Oct 2025 16:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FnYtr0f0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF7210E1FC
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 16:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761753941; x=1793289941;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=G/IFVCQXEjgEMevGjbo66o1ONKsqHO3YouukKOGyJyo=;
 b=FnYtr0f0BgUEmqPPi5E9Q0rZMQsnXrVXl309EocC05FzlZmNWTJg5Fb0
 gh0vxNUmqXDhPhH7uCLUEPhN5lNIz0TNj7DkGqO/2zvslNTKgvSRwzuhy
 4Zi3PTqK7zPpeuG6GF3ChXp1k0YyRhFn4M4v66X/+uwPeNDH6dkAwBAeY
 /y9+ChL9Vj50HhntAQmhsa1w9fPf0Aw25c45y/dgryKjBEqpHVnYVEJnI
 ogWWfOhkstFL+gXxTLF/W6BGJFJmdnQX7loQ5+/i3DgUVNMLPyDis8hUj
 VVCtZXSFxOrf9CNFpsxKa7M20ltYbsHxxx5a2UWLPxnX8W732IBeINAB5 Q==;
X-CSE-ConnectionGUID: Yt5pBuVvR82bt8L6UOFAxQ==
X-CSE-MsgGUID: 0rVKSglRRImInUqgjx8YDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67717238"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67717238"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 09:05:40 -0700
X-CSE-ConnectionGUID: /7mr/m3uQRmugFC5zP60QA==
X-CSE-MsgGUID: Y6S1YTeGTgiqeQMDhdWW7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="186053591"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.28])
 ([10.245.245.28])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 09:05:38 -0700
Message-ID: <8bfb52c1a4ca10bbb789fd166e85c93d11db3c79.camel@linux.intel.com>
Subject: Re: [PATCH v4 1/5] drm/xe: Add last fence attachment to TLB
 invalidation job queues
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Wed, 29 Oct 2025 17:05:36 +0100
In-Reply-To: <20251027182737.2358096-2-matthew.brost@intel.com>
References: <20251027182737.2358096-1-matthew.brost@intel.com>
 <20251027182737.2358096-2-matthew.brost@intel.com>
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

On Mon, 2025-10-27 at 11:27 -0700, Matthew Brost wrote:
> To address serialization issues with bursts of unbind jobs, this
> patch
> adds support for attaching the last fence to TLB invalidation job
> queues. The idea is that user fence signaling for a bind job reflects
> both the bind job itself and the last fences of all related TLB
> invalidations. The submission order of bind jobs and TLB
> invalidations
> depends solely on the state of their respective queues.
>=20
> This patch only introduces support functions for last fence
> attachment
> to TLB invalidation queues.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM. Mostly style fixes below.

Also imperative language in the commit message.

>=20
> ---
> v3:
> =C2=A0- Fix assert in xe_exec_queue_tlb_inval_last_fence_set (CI)
> =C2=A0- Ensure migrate lock held for migrate queues (Testing)
> ---
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 105
> ++++++++++++++++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 18 ++++
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue_types.h |=C2=A0=C2=A0 5 ++
> =C2=A0drivers/gpu/drm/xe/xe_migrate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 14 +++
> =C2=A0drivers/gpu/drm/xe/xe_migrate.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 ++
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +-
> =C2=A06 files changed, 155 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 90cbc95f8e2e..d7d00d4de93c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -376,11 +376,15 @@ void xe_exec_queue_destroy(struct kref *ref)
> =C2=A0{
> =C2=A0	struct xe_exec_queue *q =3D container_of(ref, struct
> xe_exec_queue, refcount);
> =C2=A0	struct xe_exec_queue *eq, *next;
> +	int i;
> =C2=A0
> =C2=A0	if (xe_exec_queue_uses_pxp(q))
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
> @@ -998,7 +1002,9 @@ int xe_exec_queue_destroy_ioctl(struct
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
> @@ -1097,6 +1103,7 @@ void xe_exec_queue_last_fence_set(struct
> xe_exec_queue *q, struct xe_vm *vm,
> =C2=A0				=C2=A0 struct dma_fence *fence)
> =C2=A0{
> =C2=A0	xe_exec_queue_last_fence_lockdep_assert(q, vm);
> +	xe_assert(vm->xe, !dma_fence_is_container(fence));
> =C2=A0
> =C2=A0	xe_exec_queue_last_fence_put(q, vm);
> =C2=A0	q->last_fence =3D dma_fence_get(fence);
> @@ -1125,6 +1132,102 @@ int xe_exec_queue_last_fence_test_dep(struct
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
> +	if (q->tlb_inval[type].last_fence) {

IIRC dma_fence_put() already has a NULL check?

> +		dma_fence_put(q->tlb_inval[type].last_fence);
> +		q->tlb_inval[type].last_fence =3D NULL;
> +	}
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
> index a4dfbe858bda..c4b95fad93f1 100644
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
> @@ -86,6 +90,20 @@ void xe_exec_queue_last_fence_set(struct
> xe_exec_queue *e, struct xe_vm *vm,
> =C2=A0				=C2=A0 struct dma_fence *fence);
> =C2=A0int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm *vm);
> +
> +void xe_exec_queue_tlb_inval_last_fence_put(struct xe_exec_queue *q,
> +					=C2=A0=C2=A0=C2=A0 struct xe_vm *vm,
> +					=C2=A0=C2=A0=C2=A0 unsigned int type);

An empty line between declarations.

> +void xe_exec_queue_tlb_inval_last_fence_put_unlocked(struct
> xe_exec_queue *q,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int
> type);
> +struct dma_fence *xe_exec_queue_tlb_inval_last_fence_get(struct
> xe_exec_queue *q,
> +							 struct
> xe_vm *vm,
> +							 unsigned
> int type);
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
> index 282505fa1377..b4185fee54e1 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -145,6 +145,11 @@ struct xe_exec_queue {
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
> index 10d77666a425..d2a2f823f1b3 100644
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

