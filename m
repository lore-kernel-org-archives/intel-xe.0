Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447D4C61DCB
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 14:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC74410F3DE;
	Fri, 28 Aug 2026 14:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nObI+Isw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77D910F3DB
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 14:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787926056; x=1819462056;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=oWvdTypKpV6MRNSAPTDtyoOHEyuJUR0ToCicu8XIDVQ=;
 b=nObI+IswF4QbEMwXZSl7zCrrjFYBKuXgNm8/UKwszW9BMxnwimiGVdwO
 ZwFVhddZEl1OrLkoO2MhUycVdAhR76wJCMsWunZUsMeUeSm/uoQzTUw6X
 k1JgsQjlFD5T/1gnDVWFWMGmFX7acI3tjJ8iu1NjDkV26ETf58jPrkwQK
 iYxPg+A3iqkjCMZTL79yhpV3yWM+IHyWCKHTYisA1ZlaLcx4RI2+uj5r0
 bgxFOmuR1d7bxkX4g4rZs9883lYkA5LdrM05hL9zuJxye2K5z5TlLRTec
 MSxQO1Yy9JkbjMY2wGnU2jc7FL5Um6tM1Oz2GTfQFJS6inARjKFCBfRqy g==;
X-CSE-ConnectionGUID: b67CtkuDT8CEE/cK4WNkPQ==
X-CSE-MsgGUID: 0RPph4BORZKLb88jMb7/YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88358945"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="88358945"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 07:07:36 -0700
X-CSE-ConnectionGUID: XF+pEiqeQxWZSWKBW5uzGA==
X-CSE-MsgGUID: pPyheSjQSiOXf/RLP5NL5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="298067546"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.245.166])
 ([10.245.245.166])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 07:07:34 -0700
Message-ID: <846109470543562cb52d3ccf8693ad56cddab212.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/bo: Take a runtime PM ref when shrinking a bo
 needing invalidation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Date: Fri, 28 Aug 2026 16:07:31 +0200
In-Reply-To: <apBpWBAyiAPMAkMm@gsse-cloud1.jf.intel.com>
References: <20260825224819.2182540-1-shuicheng.lin@intel.com>
 <ebc4797204a5aec94f122094e2fbe2fb1d0536c1.camel@linux.intel.com>
 <DM4PR11MB545658D01D36A23A72096175EAAE2@DM4PR11MB5456.namprd11.prod.outlook.com>
 <ao/Psuvcjjxkt8iH@gsse-cloud1.jf.intel.com>
 <DM4PR11MB54565CC96CAE42FB1C25434EEAAD2@DM4PR11MB5456.namprd11.prod.outlook.com>
 <apBpWBAyiAPMAkMm@gsse-cloud1.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

Hi!


On Thu, 2026-08-27 at 09:44 -0700, Matthew Brost wrote:
> On Thu, Aug 27, 2026 at 10:20:10AM -0600, Lin, Shuicheng wrote:
> > On Wed, Aug 26, 2026 10:49 PM Matthew Brost wrote:
> > > On Wed, Aug 26, 2026 at 10:10:38PM +0000, Lin, Shuicheng wrote:
> > > > On Wed, Aug 26, 2026 1:01 AM Thomas Hellstr=C3=B6m wrote:
> > > > > On Tue, 2026-08-25 at 22:48 +0000, Shuicheng Lin wrote:
> > > > > > xe_bo_shrink() only took a runtime PM reference for the
> > > > > > System CCS
> > > > > > backup case, and only after the purgeable branch had
> > > > > > already returned.
> > > > > > That branch calls xe_bo_move_notify(), which reaches
> > > > > > xe_bo_trigger_rebind() -> xe_vm_invalidate_vma() and
> > > > > > submits a TLB
> > > > > > invalidation over GuC CT.=C2=A0 The non-purgeable branch reache=
s
> > > > > > the
> > > > > > same code through ttm_bo_shrink(.allow_move =3D true) ->
> > > > > > xe_bo_move().
> > > > > >=20
> > > > > > When the device is runtime suspended the CT is disabled and
> > > > > > the
> > > > > > send returns -ENODEV, tripping the XE_WARN_ON() in
> > > xe_bo_trigger_rebind():
> > > > > >=20
> > > > > > =C2=A0 WARNING: drivers/gpu/drm/xe/xe_bo.c:770 at
> > > > > > xe_bo_move_notify+0x1fc/0x450 [xe], CPU#2: xe_madvise/21389
> > > > > > =C2=A0=C2=A0 xe_bo_shrink+0x20f/0x2b0 [xe]
> > > > > > =C2=A0=C2=A0 __xe_shrinker_walk+0x174/0x410 [xe]
> > > > > > =C2=A0=C2=A0 xe_shrinker_walk+0x56/0xf0 [xe]
> > > > > > =C2=A0=C2=A0 xe_shrinker_scan+0x10c/0x1e0 [xe]
> > > > > > =C2=A0=C2=A0 do_shrink_slab+0x176/0x7e0
> > > > > > =C2=A0=C2=A0 shrink_slab+0x137/0x990
> > > > > > =C2=A0=C2=A0 drop_slab+0x7f/0x130
> > > > > > =C2=A0=C2=A0 drop_caches_sysctl_handler+0x9c/0xf0
> > > > > >=20
> > > > > > The invalidation is always issued for a fault-mode vm;
> > > > > > since
> > > > > > commit 4e7ebff69aed ("drm/xe/xe3p_lpg: flush shrinker bo
> > > > > > cachelines
> > > > > > manually")
> > > > > > it is also issued for a non-fault-mode vm on hardware with
> > > > > > an
> > > > > > optimized
> > > > > > L2 flush, which is how this surfaced.
> > > > > >=20
> > > > > > Add bo_needs_invalidate(), mirroring that condition, and
> > > > > > use it in
> > > > > > xe_bo_shrink() to compute needs_rpm ahead of both
> > > > > > branches.=C2=A0 The
> > > > > > reference is then held across xe_bo_move_notify() in either
> > > > > > path,
> > > > > > and is not taken for a bo whose mappings would not have
> > > > > > been invalidated.
> > > > > >=20
> > > > > > Shrinking can run in reclaim contexts where the device may
> > > > > > not be
> > > > > > resumed, so a bo is skipped when the reference cannot be
> > > > > > acquired.
> > > > > > Have
> > > > > > that skip queue the shrinker PM worker:
> > > > > > xe_shrinker_runtime_pm_get() is gated on the needs of its
> > > > > > own
> > > > > > backup pass rather than on this one, and on DGFX it returns
> > > > > > before
> > > > > > queueing anything, so without this a scan where every
> > > > > > candidate is
> > > > > > skipped makes no progress, reports nothing scanned and
> > > > > > returns
> > > SHRINK_STOP with nothing arranging a wake.
> > > > > >=20
> > > > > > Also gate the System CCS term on !xe_tt->purgeable, since
> > > > > > xe_bo_shrink_purge() frees the pages without a GPU copy.
> > > > > >=20
> > > > > > Reproduced with igt@xe_madvise@dontneed-before-exec while
> > > > > > the GPU
> > > > > > is runtime suspended.
> > > > > >=20
> > > > > > Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
> > > > > > Assisted-by: Claude:claude-opus-5
> > > > > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > > > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > > >=20
> > > > > Nice catch.
> > > > >=20
> > > > > I wonder, however, can we skip the TLB flush if runtime PM is
> > > > > not
> > > > > available at TLB flush time (runtime_pm_get_if_active()?)
> > > > > Assuming
> > > > > that if runtime PM is not available, no contexts can be
> > > > > active and
> > > > > they will flush TLB implicitly when becoming active?
> > > >=20
> > > > Do you mean call runtime_pm_get_if_active() in
> > > > xe_tlb_inval_range_tilemask_submit(),
> > > > or lower down in xe_tlb_inval_fence_init()?
> > > > I'd prefer that too, as it would simplify the code. Two things
> > > > stop me doing it
> > > here.
> > > >=20
> > > > First, the PTE zap also needs the device, and it runs before
> > > > the flush.
> > > > xe_pt_zap_ptes_entry() does xe_map_memset(), which asserts via
> > > > xe_device_assert_mem_access():
> > > >=20
> > >=20
> > > I agree with this - the zap is not optional for fault mode, it
> > > probably isn't for
> > > 'xe_device_is_l2_flush_optimized'.
> > >=20
> > > > =C2=A0 Assertion `!xe_pm_runtime_suspended(xe)` failed!
> > > > =C2=A0=C2=A0 xe_pt_zap_ptes_entry+0xb8/0x120 [xe]
> > > > =C2=A0=C2=A0 xe_vm_invalidate_vma_submit+0xb1/0x770 [xe]
> > > > =C2=A0=C2=A0 xe_bo_move_notify+0x1b3/0x450 [xe]
> > > > =C2=A0=C2=A0 xe_bo_shrink+0x20f/0x2b0 [xe]
> > > >=20
> > > > The zap isn't optional - the pages are being freed, so the PTEs
> > > > have
> > > > to be cleared either way - and xe_pt_create() uses
> > > > XE_BO_FLAG_VRAM_IF_DGFX(), so on discrete it is a BAR write
> > > > that needs
> > > > D0. Skipping the flush alone leaves that behind.
> > > >=20
> > > > Second, I can't find the implicit flush in the code.
> > > > xe_pm_runtime_resume() only calls xe_gt_resume()
> > > > (do_gt_restart())
> > > > when d3cold.allowed; otherwise xe_gt_runtime_resume() just
> > > > takes
> > > > forcewake and does xe_uc_runtime_resume() - no reset, no
> > > > invalidation.
> > > > That doesn't mean the TLBs survive, it may well be a property
> > > > of the
> > > > power state, but I can't confirm the assumption by reading the
> > > > driver.
> > > > Do you know if that is guaranteed? Thanks.
> > > >=20
> > > > >=20
> > > > > IIRC It's not totally clear whether this would work for
> > > > > "has_ctx_tlb_inval"
> > > > > hardware, and if so we might need to add something similar to
> > > > > this
> > > > > for that hardware.
> > > >=20
> > > > My understanding is that it falls out for free if the check
> > > > sits above
> > > xe_tlb_inval_issue().
> > > > Is it right? Thanks.
> > > >=20
> > > > Shuicheng
> > > >=20
> > > > >=20
> > > > > Thanks,
> > > > > Thomas
> > > > >=20
> > > > > > ---
> > > > > > =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 62
> > > > > > +++++++++++++++++++++++++++---
> > > > > > --
> > > > > > =C2=A0drivers/gpu/drm/xe/xe_shrinker.c | 18 +++++++++-
> > > > > > =C2=A0drivers/gpu/drm/xe/xe_shrinker.h |=C2=A0 2 ++
> > > > > > =C2=A03 files changed, 72 insertions(+), 10 deletions(-)
> > > > > >=20
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > b/drivers/gpu/drm/xe/xe_bo.c index
> > > > > > 2eb5d6aac523..274ff97d8542
> > > > > > 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > @@ -734,6 +734,32 @@ static int
> > > > > > xe_ttm_io_mem_reserve(struct
> > > > > > ttm_device *bdev,
> > > > > > =C2=A0	}
> > > > > > =C2=A0}
> > > > > >=20
> > > > > > +/*
> > > > > > + * Whether xe_bo_move_notify() will invalidate the GPU
> > > > > > mappings
> > > > > > +of
> > > > > > @bo, and
> > > > > > + * therefore needs the device resumed to reach the GuC.
> > > > > > + *
> > > > > > + * This mirrors the condition under which
> > > > > > xe_bo_trigger_rebind()
> > > > > > below calls
> > > > > > + * xe_vm_invalidate_vma(): always for a fault-mode vm, and
> > > > > > for
> > > > > > + any
> > > > > > bound vm on
> > > > > > + * hardware where the L2 flush is optimized. Keep the two
> > > > > > in sync.
> > > > > > + *
> > > > > > + * Context: Caller must hold the BO's dma-resv lock.
> > > > > > + */
> > > > > > +static bool bo_needs_invalidate(struct xe_bo *bo) {
> > > > > > +	struct drm_gpuvm_bo *vm_bo;
> > > > > > +
> > > > > > +	if
> > > > > > (xe_device_is_l2_flush_optimized(xe_bo_device(bo)))
> > > > > > +		return xe_bo_is_vm_bound(bo);
> > > > > > +
> > > > > > +	xe_bo_assert_held(bo);
> > > > > > +
> > > > > > +	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->ttm.base)
> > > > > > +		if (xe_vm_in_fault_mode(gpuvm_to_vm(vm_bo-
> > > > > > >vm)))
> > > > > > +			return true;
> > > > > > +
> > > > > > +	return false;
> > > > > > +}
> > > > > > +
> > > > > > =C2=A0static int xe_bo_trigger_rebind(struct xe_device *xe,
> > > > > > struct
> > > > > > xe_bo *bo,
> > > > > > =C2=A0				const struct
> > > > > > ttm_operation_ctx *ctx)
> > > > > > =C2=A0{
> > > > > > @@ -1361,6 +1387,28 @@ long xe_bo_shrink(struct
> > > > > > ttm_operation_ctx
> > > > > > *ctx, struct ttm_buffer_object *bo,
> > > > > > =C2=A0	if (!xe_bo_is_xe_bo(bo) ||
> > > > > > !xe_bo_get_unless_zero(xe_bo))
> > > > > > =C2=A0		return xe_bo_shrink_purge(ctx, bo,
> > > > > > scanned);
> > > > > >=20
> > > > > > +	/*
> > > > > > +	 * Moving this bo out of a non-system placement
> > > > > > makes
> > > > > > +	 * xe_bo_move_notify() invalidate its GPU mappings
> > > > > > over GuC
> > > > > > CT, and
> > > > > > +	 * System CCS needs a gpu copy when moving PL_TT -
> > > > > > >
> > > > > > PL_SYSTEM. Both
> > > > > > +	 * need the device resumed.
> > > > > > +	 */
> > > > > > +	needs_rpm =3D bo->resource->mem_type !=3D XE_PL_SYSTEM
> > > > > > &&
> > > > > > +		(bo_needs_invalidate(xe_bo) ||
> > > > > > +		 (!xe_tt->purgeable && !IS_DGFX(xe) &&
> > > > > > +		=C2=A0 xe_bo_needs_ccs_pages(xe_bo)));
> > >=20
> > > This is a complex enough conditional that my current feeling is
> > > to just
> > > unconditionally set:
> > >=20
> > > needs_rpm =3D true;
> >=20
> > How about keep the XE_PL_SYSTEM check?
> >=20
>=20
> I think checking system is reasonable, and better than my suggestion,
> as
> this implies we don't have GPU pages (no invalidation) and no need
> for a
> CCS copy, and is keep check which is easy to understand.
>=20
> > 	/* Both the invalidation and the System CCS copy need the
> > device. */
> > 	needs_rpm =3D bo->resource->mem_type !=3D XE_PL_SYSTEM;
> >=20
> > @Thomas Hellstr=C3=B6m you wrote the original code, what do you think?
> >=20
>=20
> Yes, let's see what Thomas says.

I think keeping the system check makes sense, and for now a quick fix.

However I think avoiding waking the device for small reclaims makes
sense, so we should also look at the shrink batch series trying to make
that merged.

If we wanted to optimize this, and add back the complexity, I think
calling xe_vm_invalidate_vma() would only make sense if runtime_pm is
available:

1) We need to do it on faulting VMs -> Runtime PM always available.
2) We need to do it to trap L1 cache flushes and on l2_flush_optimized
to flush out l2 before reclaiming -> Can we assume that the device
always does this before going to sleep? Need to confirm that with
Ankur.

Thanks,
Thomas


>=20
> Mattb
>=20
> > >=20
> > > In practice, on iGPUs where the display is in use, we always hold
> > > a runtime PM
> > > reference. It would be very unusual for the display to be
> > > suspended while the
> > > shrinker is running, at least as far as I can tell.
> > > Let's drop this hard-to-understand, likely overengineered
> > > conditional.
> >=20
> > I could only reproduce the issue with display disabled. And the CI
> > machine that hits it has no monitor connected.
> >=20
> > Shuicheng
> >=20
> > >=20
> > > Thoughts?
> > >=20
> > > Matt
> > >=20
> > > > > > +	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
> > > > > > {
> > > > > > +		/*
> > > > > > +		 * Resuming is not allowed from all
> > > > > > reclaim
> > > > > > contexts, so leave
> > > > > > +		 * this bo alone and ask for the device to
> > > > > > be woken
> > > > > > up outside
> > > > > > +		 * of reclaim.
> > > > > > xe_shrinker_runtime_pm_get() is gated
> > > > > > on the
> > > > > > +		 * needs of its own backup pass rather
> > > > > > than on ours,
> > > > > > and on
> > > > > > +		 * DGFX it returns before queueing
> > > > > > anything, so ask
> > > > > > here.
> > > > > > +		 */
> > > > > > +		xe_shrinker_queue_pm(xe->mem.shrinker);
> > > > > > +		goto out_unref;
> > > > > > +	}
> > > > > > +
> > > > > > =C2=A0	if (xe_tt->purgeable) {
> > > > > > =C2=A0		if (bo->resource->mem_type !=3D
> > > > > > XE_PL_SYSTEM)
> > > > > > =C2=A0			lret =3D xe_bo_move_notify(xe_bo,
> > > > > > ctx); @@ -1369,28
> > > > > +1417,24 @@ long
> > > > > > xe_bo_shrink(struct ttm_operation_ctx *ctx, struct
> > > > > > ttm_buffer_object *bo,
> > > > > > =C2=A0		if (lret > 0 &&
> > > > > > xe_bo_madv_is_dontneed(xe_bo))
> > > > > > =C2=A0			xe_bo_set_purgeable_state(xe_bo,
> > > > > >=20
> > > > > > XE_MADV_PURGEABLE_PURGED);
> > > > > > -		goto out_unref;
> > > > > > +		goto out_put_rpm;
> > > > > > =C2=A0	}
> > > > > >=20
> > > > > > -	/* System CCS needs gpu copy when moving PL_TT ->
> > > > > > PL_SYSTEM
> > > > > > */
> > > > > > -	needs_rpm =3D (!IS_DGFX(xe) && bo->resource-
> > > > > > >mem_type !=3D
> > > > > > XE_PL_SYSTEM &&
> > > > > > -		=C2=A0=C2=A0=C2=A0=C2=A0 xe_bo_needs_ccs_pages(xe_bo));
> > > > > > -	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
> > > > > > -		goto out_unref;
> > > > > > -
> > > > > > =C2=A0	*scanned +=3D tt->num_pages;
> > > > > > =C2=A0	lret =3D ttm_bo_shrink(ctx, bo, (struct
> > > > > > ttm_bo_shrink_flags)
> > > > > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 {.purge =3D false,
> > > > > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .writeback =3D
> > > > > > flags.writeback,
> > > > > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .allow_move =3D true});
> > > > > > -	if (needs_rpm)
> > > > > > -		xe_pm_runtime_put(xe);
> > > > > >=20
> > > > > > =C2=A0	if (lret > 0) {
> > > > > > =C2=A0		xe_ttm_tt_account_subtract(xe, tt);
> > > > > > =C2=A0		update_global_total_pages(bo->bdev, -
> > > > > > (long)tt-
> > > > > > > num_pages);
> > > > > > =C2=A0	}
> > > > > >=20
> > > > > > +out_put_rpm:
> > > > > > +	if (needs_rpm)
> > > > > > +		xe_pm_runtime_put(xe);
> > > > > > +
> > > > > > =C2=A0out_unref:
> > > > > > =C2=A0	xe_bo_put(xe_bo);
> > > > > >=20
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > > > > > b/drivers/gpu/drm/xe/xe_shrinker.c
> > > > > > index 83374cd57660..fb6ec77972a5 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> > > > > > @@ -54,6 +54,22 @@ xe_shrinker_mod_pages(struct xe_shrinker
> > > > > > *shrinker, long shrinkable, long purgea
> > > > > > =C2=A0	write_unlock(&shrinker->lock);
> > > > > > =C2=A0}
> > > > > >=20
> > > > > > +/**
> > > > > > + * xe_shrinker_queue_pm() - Ask for the device to be woken
> > > > > > up for
> > > > > > shrinking
> > > > > > + * @shrinker: Pointer to the struct xe_shrinker.
> > > > > > + *
> > > > > > + * Queue a worker that takes and drops a runtime PM
> > > > > > reference.
> > > > > > Shrinking can
> > > > > > + * be called from reclaim context, where resuming the
> > > > > > device is
> > > > > > + not
> > > > > > always
> > > > > > + * allowed, so a caller that needs the device resumed but
> > > > > > could
> > > > > > + not
> > > > > > acquire a
> > > > > > + * reference uses this to have it woken up outside of
> > > > > > reclaim.
> > > > > > + The
> > > > > > current
> > > > > > + * scan makes no progress on the affected buffer objects,
> > > > > > but a
> > > > > > subsequent one
> > > > > > + * can.
> > > > > > + */
> > > > > > +void xe_shrinker_queue_pm(struct xe_shrinker *shrinker) {
> > > > > > +	queue_work(shrinker->xe->unordered_wq, &shrinker-
> > > > > > > pm_worker);
> > > > > > +}
> > > > > > +
> > > > > > =C2=A0static s64 __xe_shrinker_walk(struct xe_device *xe,
> > > > > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ct=
x
> > > > > > *ctx,
> > > > > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > > > > > xe_bo_shrink_flags flags, @@ -185,7
> > > > > +201,7 @@
> > > > > > static bool xe_shrinker_runtime_pm_get(struct xe_shrinker
> > > > > > *shrinker, bool force,
> > > > > > =C2=A0			xe_pm_runtime_get(xe);
> > > > > > =C2=A0			return true;
> > > > > > =C2=A0		}
> > > > > > -		queue_work(xe->unordered_wq, &shrinker-
> > > > > > >pm_worker);
> > > > > > +		xe_shrinker_queue_pm(shrinker);
> > > > > > =C2=A0		return false;
> > > > > > =C2=A0	}
> > > > > >=20
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_shrinker.h
> > > > > > b/drivers/gpu/drm/xe/xe_shrinker.h
> > > > > > index 5132ae5192e1..86d2a322cadd 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_shrinker.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_shrinker.h
> > > > > > @@ -11,6 +11,8 @@ struct xe_device;
> > > > > >=20
> > > > > > =C2=A0void xe_shrinker_mod_pages(struct xe_shrinker *shrinker,
> > > > > > long
> > > > > > shrinkable, long purgeable);
> > > > > >=20
> > > > > > +void xe_shrinker_queue_pm(struct xe_shrinker *shrinker);
> > > > > > +
> > > > > > =C2=A0int xe_shrinker_create(struct xe_device *xe);
> > > > > >=20
> > > > > > =C2=A0#endif
