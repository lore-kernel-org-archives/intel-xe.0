Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C46606A31F
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 18:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846C810E027;
	Tue, 20 Oct 2026 18:13:54 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF2810E027
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 18:13:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1DC2460416;
 Tue, 20 Oct 2026 18:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B01EC1F000C9;
 Tue, 20 Oct 2026 18:13:51 +0000 (UTC)
Message-ID: <sashiko-outbox-179458@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/xe: Add a minimum age gate to the shrinker
To: "Matthew Brost" <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261020175045.843524-1-matthew.brost@intel.com>
References: <20261020175045.843524-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 18:13:21 +0000
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] drm/xe: xe_shrinker_walk() aborts later passes when early pass hit=
s young BO
- [High] drm/xe: xe_bo_move() stamps bulk-moved BOs without moving VM bulk =
LRU tail
- [Medium] drm/xe: xe_shrinker_lru_young() misclassifies contended, purgeab=
le, and sg BOs
- [Medium] drm/xe: xe_bo_shrink_too_young() compares unset zero vm_stamp wi=
th time_after()
--

commit 308fbeccc17100af491eebe029a1eec420fd7050
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add a minimum age gate to the shrinker

This commit adds a minimum bo age gate to the xe shrinker, controlled by a
per-device shrinker_min_age_ms sysfs attribute and
CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS. Buffer objects are timestamped on lru
bumps in xe_bo_move() and xe_vm_bump_lru(), and the shrinker skips backing
up bos younger than the configured threshold.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 1b74331b15ec1..59a42c3282f74 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1313,9 +1313,80 @@ static int xe_bo_move(struct ttm_buffer_object *tt=
m_bo, bool evict,
>  		xe_tt_unmap_sg(xe, ttm_bo->ttm);
>  	}
> =20
> +	if (!ret && ttm_bo->resource && ttm_bo->resource->mem_type =3D=3D XE_PL=
_TT)
> +		xe_bo_bump_lru(bo);
> +
>  	return ret;
>  }
> =20
> +/**
> + * xe_bo_bump_lru_locked() - Bump a BO on the LRU and stamp its last use
> + * @bo: The buffer object, reserved by the caller.
> + *
> + * Move @bo to the tail of its LRU, or of its bulk move if it belongs to=
 one,
> + * and record the time for the shrinker's minimum age gate. The caller m=
ust
> + * hold the device LRU lock.
> + */
> +void xe_bo_bump_lru_locked(struct xe_bo *bo)
> +{
> +	WRITE_ONCE(bo->lru_stamp, jiffies);
> +	ttm_bo_move_to_lru_tail(&bo->ttm);
> +}

[Severity: High]
When a private user bo belonging to a vm with bulk move is moved into
XE_PL_TT in drivers/gpu/drm/xe/xe_bo.c:xe_bo_move(), could calling
xe_bo_bump_lru() break the age ordering on the global XE_PL_TT lru?

For bos with bo->ttm.bulk_move set to &vm->lru_bulk_move,
ttm_bo_move_to_lru_tail() calls
drivers/gpu/drm/ttm/ttm_resource.c:ttm_resource_move_to_lru_tail():

    } else if (bo->bulk_move) {
        struct ttm_lru_bulk_move_pos *pos =3D
            ttm_lru_bulk_move_pos(bo->bulk_move, res);

        ttm_lru_bulk_move_pos_tail(pos, res);
    }

Similarly, during bo creation in
drivers/gpu/drm/xe/xe_bo.c:xe_bo_init_locked(), after
ttm_bo_init_reserved() -> xe_bo_move() stamps bo->lru_stamp =3D jiffies:

    bo->created =3D true;
    if (bulk)
        ttm_bo_set_bulk_move(&bo->ttm, bulk);
    else
        ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);

When the vm already has an existing bulk-move segment on XE_PL_TT, both
paths only move the bo to pos->last of that vm's bulk-move sub-range rather
than to the tail of the global man->lru list, because the vm's segment only
moves to the global lru tail when ttm_lru_bulk_move_tail(&vm->lru_bulk_move)
is called in xe_vm_bump_lru().

If an older vm whose bulk-move segment sits near the head of XE_PL_TT (ahead
of older bos from other vms) creates, binds, faults, or evicts a private bo
into XE_PL_TT without calling xe_vm_bump_lru(), bo->lru_stamp is stamped
with jiffies while the bo stays anchored inside the vm's old bulk-move
segment.

Because xe_bo_shrink_too_young() takes the later of bo->lru_stamp and
vm->lru_stamp, once any preceding old bos in that vm's segment are shrunk or
freed, this young bo sits at the head of XE_PL_TT ahead of older bos from
other vms. Won't both xe_shrinker_lru_young() and __xe_shrinker_walk() hit
this young bo first and stop, preventing older bos behind that vm's
bulk-move segment from being reclaimed?

> +
> +/**
> + * xe_bo_bump_lru() - Bump a BO on the LRU and stamp its last use
> + * @bo: The buffer object, reserved by the caller.
> + *
> + * Like xe_bo_bump_lru_locked(), but takes the device LRU lock.
> + */
> +void xe_bo_bump_lru(struct xe_bo *bo)
> +{
> +	spinlock_t *lru_lock =3D &xe_bo_device(bo)->ttm.lru_lock;
> +
> +	spin_lock(lru_lock);
> +	xe_bo_bump_lru_locked(bo);
> +	spin_unlock(lru_lock);
> +}
> +
> +/**
> + * xe_bo_shrink_too_young() - Whether a BO was used too recently to shri=
nk
> + * @bo: The TTM buffer object, reserved by the caller.
> + * @min_age: Minimum age in jiffies. 0 disables the check.
> + *
> + * The age is taken from the later of the BO's own &xe_bo.lru_stamp and,=
 for
> + * user BOs private to a VM, the VM's &xe_vm.lru_stamp. Purgeable and no=
n-xe
> + * BOs are never considered young since dropping them is cheap. Neither =
are
> + * BOs in XE_PL_SYSTEM: they are not GPU mapped, hence not part of a wor=
king
> + * set, and must be moved back to TT, refreshing the stamp, before use.
> + *
> + * Return: true if @bo was touched less than @min_age jiffies ago.
> + */
> +bool xe_bo_shrink_too_young(struct ttm_buffer_object *bo, unsigned long =
min_age)
> +{
> +	struct xe_ttm_tt *xe_tt;
> +	struct xe_bo *xe_bo;
> +	unsigned long stamp;
> +
> +	if (!min_age || !bo->ttm || !xe_bo_is_xe_bo(bo) ||
> +	    bo->resource->mem_type =3D=3D XE_PL_SYSTEM)
> +		return false;
> +
> +	xe_tt =3D container_of(bo->ttm, struct xe_ttm_tt, ttm);
> +	if (xe_tt->purgeable)
> +		return false;
> +
> +	xe_bo =3D ttm_to_xe_bo(bo);
> +	stamp =3D READ_ONCE(xe_bo->lru_stamp);
> +	if (xe_bo->vm && xe_bo_is_user(xe_bo)) {
> +		unsigned long vm_stamp =3D READ_ONCE(xe_bo->vm->lru_stamp);
> +
> +		if (!stamp || time_after(vm_stamp, stamp))
> +			stamp =3D vm_stamp;
> +	}
> +
> +	return stamp && time_before(jiffies, stamp + min_age);
> +}

[Severity: Medium]
In drivers/gpu/drm/xe/xe_bo.c:xe_bo_shrink_too_young(), what happens if
xe_bo->vm->lru_stamp is still 0 (unset) while xe_bo->lru_stamp is non-zero?

For a fault-mode vm (XE_VM_FLAG_FAULT_MODE) where xe_vm_bump_lru() is not
called on page faults, or a non-fault-mode vm prior to its first exec,
vm->lru_stamp remains 0 while xe_bo_move() sets xe_bo->lru_stamp to jiffies.

Because vm_stamp is not checked for non-zero before calling
time_after(vm_stamp, stamp), time_after(0, stamp) evaluates
((long)(stamp - 0) < 0). Whenever jiffies has its sign bit set (such as the
first 5 minutes after boot on 32-bit kernels due to INITIAL_JIFFIES, or half
of the jiffies wrap space), time_after(0, stamp) returns true and overwrites
the valid stamp with 0, causing xe_bo_shrink_too_young() to return false and
bypass the minimum age gate. Should this check vm_stamp before comparing
with time_after()?

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shr=
inker.c
> index 772dab9b3ed75..8e863ee5a96e9 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c

[ ... ]

> @@ -136,6 +140,16 @@ static int __xe_shrinker_walk(struct xe_shrinker *sh=
rinker,
>  			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
>  				continue;
> =20
> +			/*
> +			 * The LRU is roughly age ordered, so everything past
> +			 * the first young BO is most likely young too. Stop
> +			 * here.
> +			 */
> +			if (xe_bo_shrink_too_young(ttm_bo, min_age)) {
> +				*young =3D true;
> +				goto out;
> +			}
> +
>  			lret =3D xe_bo_shrink(ctx, ttm_bo, flags, scanned);
>  			/* Like the TTM LRU walk, skip bos we can't shrink now. */
>  			if (lret =3D=3D -EBUSY)
> @@ -168,35 +182,117 @@ static int __xe_shrinker_walk(struct xe_shrinker *=
shrinker,
>  static int xe_shrinker_walk(struct xe_shrinker *shrinker,
>  			    struct ttm_operation_ctx *ctx,
>  			    const struct xe_bo_shrink_flags flags,
> +			    unsigned long min_age,
>  			    unsigned long to_scan, unsigned long *scanned,
>  			    unsigned long *freed)
>  {
>  	bool no_wait_gpu =3D true;
>  	struct xe_bo_shrink_flags save_flags =3D flags;
> +	bool young =3D false;
>  	int ret;
> =20
>  	swap(no_wait_gpu, ctx->no_wait_gpu);
>  	save_flags.writeback =3D false;
> -	ret =3D __xe_shrinker_walk(shrinker, ctx, save_flags, to_scan, scanned,
> -				 freed);
> +	ret =3D __xe_shrinker_walk(shrinker, ctx, save_flags, min_age, &young,
> +				 to_scan, scanned, freed);
>  	swap(no_wait_gpu, ctx->no_wait_gpu);
> -	if (ret || *scanned >=3D to_scan)
> +	if (ret || young || *scanned >=3D to_scan)
>  		return ret;
> =20
>  	if (!ctx->no_wait_gpu) {
> -		ret =3D __xe_shrinker_walk(shrinker, ctx, save_flags, to_scan, scanned,
> -					 freed);
> -		if (ret || *scanned >=3D to_scan)
> +		ret =3D __xe_shrinker_walk(shrinker, ctx, save_flags, min_age,
> +					 &young, to_scan, scanned, freed);
> +		if (ret || young || *scanned >=3D to_scan)
>  			return ret;
>  	}
> =20
>  	if (flags.writeback)
> -		ret =3D __xe_shrinker_walk(shrinker, ctx, flags, to_scan, scanned,
> -					 freed);
> +		ret =3D __xe_shrinker_walk(shrinker, ctx, flags, min_age, &young,
> +					 to_scan, scanned, freed);
> =20
>  	return ret;
>  }

[Severity: High]
Does checking young between passes in
drivers/gpu/drm/xe/xe_shrinker.c:xe_shrinker_walk() prematurely abort the
later gpu-wait and writeback passes?

xe_shrinker_walk() runs up to three passes of __xe_shrinker_walk() with
progressively relaxed constraints:

1. Pass 1 forces ctx->no_wait_gpu =3D true and save_flags.writeback =3D fal=
se.
2. Pass 2 (when the caller's ctx->no_wait_gpu is false, such as kswapd) runs
   with ctx->no_wait_gpu =3D false and save_flags.writeback =3D false.
3. Pass 3 (when flags.writeback is true) runs with writeback enabled.

During Pass 1, because ctx->no_wait_gpu is true, ttm_bo_shrink_suitable()
returns false for any bo with unsignaled DMA_RESV_USAGE_BOOKKEEP fences:

drivers/gpu/drm/ttm/ttm_bo_util.c:ttm_bo_shrink_suitable() {
    return bo->ttm && ttm_tt_is_populated(bo->ttm) && !bo->pin_count &&
        (!ctx->no_wait_gpu ||
         dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP));
}

Pass 1 therefore skips all gpu-busy bos in XE_PL_SYSTEM (which are never
supposed to be gated by min_age) and all older gpu-busy bos at the head of
XE_PL_TT, as well as any older idle bos where xe_bo_shrink() returns -EBUSY
without writeback.

If Pass 1 then encounters a young bo further down XE_PL_TT that happens to
be gpu-idle, ttm_bo_shrink_suitable() and xe_bo_shrink_too_young() both
return true, setting *young =3D true and jumping to out.

Because xe_shrinker_walk() checks:

    if (ret || young || *scanned >=3D to_scan)
        return ret;

it returns immediately after Pass 1 (or after Pass 2 when Pass 2 skips old
bos requiring writeback and hits a young bo), completely skipping Pass 2 and
Pass 3 and failing to reclaim the older gpu-busy or writeback-requiring bos.

In addition, xe_shrinker_lru_young() in xe_shrinker_count() sets
ctx.no_wait_gpu =3D false, so it sees the old gpu-busy bos at the head of t=
he
lru as suitable and reports num_pages to vmscan, only for xe_shrinker_scan()
to skip them in Pass 1, hit a young idle bo, and return SHRINK_STOP with
nr_scanned =3D=3D 0. Should hitting a young bo only stop the current
__xe_shrinker_walk() pass rather than aborting subsequent passes in
xe_shrinker_walk()?

[ ... ]

> +/* Max shrink-unsuitable BOs to skip per LRU before giving up the snoop.=
 */
> +#define XE_SHRINKER_SNOOP_MAX	16
> +
> +/*
> + * Whether the first shrinkable BO on every TT-backed LRU is younger than
> + * @min_age. BOs are trylocked through the reserved LRU walker since the=
ir
> + * tt may be torn down while still on the LRU. Contended BOs are skipped=
 by
> + * the walker. If no verdict can be reached within the snoop budget, rep=
ort
> + * not young and leave it to the scan side check.
> + */
> +static bool xe_shrinker_lru_young(struct xe_shrinker *shrinker,
> +				  unsigned long min_age)
> +{
> +	struct ttm_operation_ctx ctx =3D {
> +		.interruptible =3D false,
> +		.no_wait_gpu =3D false,
> +	};
> +	struct xe_device *xe =3D shrinker->xe;
> +	unsigned int mem_type;
> +
> +	for (mem_type =3D XE_PL_SYSTEM; mem_type <=3D XE_PL_TT; ++mem_type) {
> +		struct ttm_resource_manager *man =3D ttm_manager_type(&xe->ttm, mem_ty=
pe);
> +		struct ttm_bo_lru_cursor curs;
> +		struct ttm_buffer_object *ttm_bo;
> +		struct ttm_lru_walk_arg arg =3D {
> +			.ctx =3D &ctx,
> +			.trylock_only =3D true,
> +		};
> +		unsigned int budget =3D XE_SHRINKER_SNOOP_MAX;
> +
> +		if (!man || !man->use_tt)
> +			continue;
> +
> +		ttm_bo_lru_for_each_reserved_guarded(&curs, man, &arg, ttm_bo) {
> +			if (!ttm_bo_shrink_suitable(ttm_bo, &ctx)) {
> +				if (!--budget)
> +					return false;
> +				continue;
> +			}
> +
> +			if (!xe_bo_shrink_too_young(ttm_bo, min_age))
> +				return false;
> +
> +			break;
> +		}
> +	}
> +
> +	return true;
> +}

[Severity: Medium]
Can drivers/gpu/drm/xe/xe_shrinker.c:xe_shrinker_lru_young() and
drivers/gpu/drm/xe/xe_bo.c:xe_bo_shrink_too_young() misclassify contended,
purgeable, or imported dma-buf bos?

There appear to be three cases where the snoop and walk logic diverges from
what xe_bo_shrink() can actually shrink:

1. Contended lrus: ttm_bo_lru_for_each_reserved_guarded() walks XE_PL_SYSTEM
   and XE_PL_TT with arg.trylock_only =3D true. In
   drivers/gpu/drm/ttm/ttm_bo_util.c:__ttm_bo_lru_cursor_next(), any bo
   whose dma_resv trylock fails is skipped before reaching the loop body:

       bo =3D res->bo;
       if (ttm_lru_walk_trylock(curs, bo))
           bo_locked =3D true;
       else if ((!arg->ticket && !arg->sleeping_lock) ||
                arg->ctx->no_wait_gpu || arg->trylock_only)
           continue;

   Because contended bos never enter the loop body in
   xe_shrinker_lru_young(), budget is never decremented for them. Since all
   private bos of a vm share xe_vm_resv(vm), if that vm's lock is held
   during an active exec, bind, or fault and no uncontended suitable bo is
   found on XE_PL_SYSTEM or XE_PL_TT, the loops finish without inspecting
   any young bo and fall through to return true, causing xe_shrinker_count()
   to return SHRINK_EMPTY instead of reporting not young when no verdict can
   be reached.

2. Purgeable bos on shared lrus: Purgeable bos reside on the same
   XE_PL_SYSTEM and XE_PL_TT lrus as non-purgeable bos. When
   xe_shrinker_lru_young() snoops for the non-purgeable shrinker,
   ttm_bo_shrink_suitable() returns true for a purgeable bo and
   xe_bo_shrink_too_young() returns false because xe_tt->purgeable is true.
   Instead of skipping the purgeable bo to snoop the first non-purgeable bo,
   xe_shrinker_lru_young() sees !xe_bo_shrink_too_young() and immediately
   returns false.

3. Imported dma-buf bos (ttm_bo_type_sg): ttm marks imported dma-buf ttm_tts
   as populated, so ttm_bo_shrink_suitable() returns true even though
   xe_bo_shrink() rejects them with -EBUSY via
   !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE). Neither
   xe_shrinker_lru_young() nor xe_bo_shrink_too_young() checks
   TTM_TT_FLAG_EXTERNAL_MAPPABLE. An imported dma-buf bumped by
   xe_vm_bump_lru() has a young lru_stamp, causing xe_bo_shrink_too_young()
   to return true and stop __xe_shrinker_walk() before xe_bo_shrink() can
   skip it, while an unstamped imported dma-buf causes
   xe_shrinker_lru_young() to return false.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020175045.8435=
24-1-matthew.brost@intel.com?part=3D1
