Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28926EA811A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 14:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18A010E590;
	Tue, 10 Feb 2026 14:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fsU+DCwW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2079810E590
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 14:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770732121; x=1802268121;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=40Wom/YMshJDV8g0dLJwejH697fytz5CVoX0pm5YSt8=;
 b=fsU+DCwWlYSA8siPSNkpyg6io6rnlr/sQMFrvoF3gl7AazzzMjIEuvee
 dPWy12U/r6GcoW2AKNaBWWo26cRm+8+1ZOLo37I7z6FPexXR7e1WI5jut
 fyLGVZTs30HAmZ0TXT+CWR7qtWqLjRtR3mHSMajCX3ZfnX6iQ+boypead
 MlWCS8oB6mpS762aDmvtwbTTHTjfIQwu11xhLn3yHanUGAtt45ywcBD/v
 7gBUHLJ0j1B8xPiyhLGPDyKpHbaqao1HdVuqEz3KhCeg5QP6OSWUKssK5
 qVosrCuKqxFRq1/OzVxwrAXZi24YTMGDelRQ4vHfvwZPpzNRhOyNDLmHv w==;
X-CSE-ConnectionGUID: KwhV1uARQSSkswYykEm4Cg==
X-CSE-MsgGUID: AGIxnZidS9K6Z1gtAfqzFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="83229526"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="83229526"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 06:02:01 -0800
X-CSE-ConnectionGUID: QYcziVHXT0ubwzpenFhZaA==
X-CSE-MsgGUID: GzgrTMa0RK6nqnmYJ9Ycvg==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.80])
 ([10.245.244.80])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 06:01:59 -0800
Message-ID: <d7a1ab7d1352c60253f8b840db391d23b955d5fa.camel@linux.intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe/vf: Fix fs_reclaim warning with CCS
 save/restore BB allocation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Date: Tue, 10 Feb 2026 15:01:56 +0100
In-Reply-To: <dfb761f4-eb4a-4a86-9856-b5da35f16d94@intel.com>
References: <20260210105929.4089794-5-satyanarayana.k.v.p@intel.com>
 <20260210105929.4089794-7-satyanarayana.k.v.p@intel.com>
 <dfb761f4-eb4a-4a86-9856-b5da35f16d94@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
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

On Tue, 2026-02-10 at 14:02 +0100, Michal Wajdeczko wrote:
>=20
>=20
> On 2/10/2026 11:59 AM, Satyanarayana K V P wrote:
> > CCS save/restore batch buffers are attached during BO allocation
> > and
> > detached during BO teardown. The shrinker triggers xe_bo_move(),
> > which is
> > used for both allocation and deletion paths.
> >=20
> > When BO allocation and shrinking occur concurrently, a circular
> > locking
> > dependency involving fs_reclaim and swap_guard can occur, leading
> > to a
> > deadlock such as:
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > WARNING: possible circular locking dependency detected
> > ------------------------------------------------------
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 CPU1
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ----=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ----
> > =C2=A0lock(fs_reclaim);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock(&sa_manager->swap_guard);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock(fs_reclaim);
> > =C2=A0lock(&sa_manager->swap_guard);
> >=20
> > =C2=A0*** DEADLOCK ***
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >=20
> > To avoid this, the BB pointer and SA are allocated using
> > xe_bb_alloc()
> > before taking lock and SA is initialized using xe_bb_init()
> > preventing
> > reclaim from being invoked in this context.
> >=20
> > Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy
> > commands with BO")
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >=20
> > ---
> > V2 -> V3:
> > - Created new functions xe_sa_bo_alloc(), xe_sa_bo_release() and
> > xe_sa_bo_init(). (Thomas)
> > - Created new functions xe_bb_alloc(), xe_bb_release and
> > xe_bb_init(). (Thomas)
> > - Updated guard() to scoped_guard() in xe_migrate_ccs_rw_copy().
> > (Thomas)
> >=20
> > V1 -> V2:
> > - Used drm_suballoc_alloc() and drm_suballoc_init() for BB
> > allocation
> > (Thomas).
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_bb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 49 +++=
++++++++------
> > =C2=A0drivers/gpu/drm/xe/xe_bb.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
7 ++-
> > =C2=A0drivers/gpu/drm/xe/xe_migrate.c | 96 ++++++++++++++++++----------=
-
> > ----
> > =C2=A0drivers/gpu/drm/xe/xe_sa.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 40 +++=
+++++++++++
> > =C2=A0drivers/gpu/drm/xe/xe_sa.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
3 ++
> > =C2=A05 files changed, 135 insertions(+), 60 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bb.c
> > b/drivers/gpu/drm/xe/xe_bb.c
> > index 8b678297aaa2..631ae564e719 100644
> > --- a/drivers/gpu/drm/xe/xe_bb.c
> > +++ b/drivers/gpu/drm/xe/xe_bb.c
> > @@ -59,16 +59,43 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32
> > dwords, bool usm)
> > =C2=A0	return ERR_PTR(err);
> > =C2=A0}
> > =C2=A0
> > -struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> > -			=C2=A0=C2=A0=C2=A0 enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
>=20
> shouldn't we add kernel-doc for all new/updated public functions?

+1.

>=20
> > +struct xe_bb *xe_bb_alloc(struct xe_gt *gt)
> > =C2=A0{
> > =C2=A0	struct xe_bb *bb =3D kmalloc(sizeof(*bb), GFP_KERNEL);
> > =C2=A0	struct xe_device *xe =3D gt_to_xe(gt);
> > -	struct xe_sa_manager *bb_pool;
> > =C2=A0	int err;
> > =C2=A0
> > =C2=A0	if (!bb)
> > =C2=A0		return ERR_PTR(-ENOMEM);
> > +
> > +	bb->bo =3D xe_sa_bo_alloc(GFP_KERNEL);
> > +	if (IS_ERR(bb->bo)) {
> > +		drm_err(&xe->drm, "Sub-allocator memory allocation
> > failed with %ld\n",
>=20
> nit: there is xe_err(xe, ...)
>=20
> nit: we try to print errors using %pe, which here is even more
> appropriate
>=20
> nit: maybe "Failed to allocate SA object for BO (%pe)\n" ?
>=20
> nit: or maybe any error message should be in xe_sa_bo_alloc()

Typically we don't print errors other than in a debug mode, like
drm_dbg() (I don't think we have an xe_dbg, though). In particular with
memory allocation the core will spew out error messages anyway so I
think it's safe to remove that and just forward it to upper layers.

The rest with Michal's review comments addressed LGTM.

Thanks,
Thomas



>=20
> > +			PTR_ERR(bb->bo));
> > +		err =3D PTR_ERR(bb->bo);
> > +		goto err;
> > +	}
> > +
> > +	return bb;
> > +
> > +err:
> > +	kfree(bb);
> > +	return ERR_PTR(err);
> > +}
> > +
>=20
> kernel-doc
>=20
> > +void xe_bb_release(struct xe_bb *bb)
> > +{
> > +	if (bb->bo)
>=20
> do we need this?
> in xe_bb_alloc() we guarantee that bb will either have valid .bo or
> no bb at all
>=20
> > +		xe_sa_bo_release(bb->bo);
> > +
> > +	kfree(bb);
> > +}
> > +
>=20
> kernel-doc
>=20
> > +int xe_bb_init(struct xe_gt *gt, struct xe_bb *bb,
>=20
> as this is xe_bb function, it should take xe_bb as first param
>=20
> > +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_sa_manager *bb_pool, u=
32 dwords)
> > +{
> > +	int err;
> > +
> > =C2=A0	/*
> > =C2=A0	 * We need to allocate space for the requested number of
> > dwords &
> > =C2=A0	 * one additional MI_BATCH_BUFFER_END dword. Since the
> > whole SA
> > @@ -76,22 +103,14 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt,
> > u32 dwords,
> > =C2=A0	 * is not over written when the last chunk of SA is
> > allocated for BB.
> > =C2=A0	 * So, this extra DW acts as a guard here.
> > =C2=A0	 */
> > -
> > -	bb_pool =3D xe-
> > >sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
> > -	bb->bo =3D xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
> > -
> > -	if (IS_ERR(bb->bo)) {
> > -		err =3D PTR_ERR(bb->bo);
> > -		goto err;
> > -	}
> > +	err =3D xe_sa_bo_init(bb_pool, bb->bo, 4 * (dwords + 1));
> > +	if (err)
> > +		return err;
> > =C2=A0
> > =C2=A0	bb->cs =3D xe_sa_bo_cpu_addr(bb->bo);
> > =C2=A0	bb->len =3D 0;
> > =C2=A0
> > -	return bb;
> > -err:
> > -	kfree(bb);
> > -	return ERR_PTR(err);
> > +	return 0;
> > =C2=A0}
> > =C2=A0
> > =C2=A0static struct xe_sched_job *
> > diff --git a/drivers/gpu/drm/xe/xe_bb.h
> > b/drivers/gpu/drm/xe/xe_bb.h
> > index 2a8adc9a6dee..3eb80925bfd1 100644
> > --- a/drivers/gpu/drm/xe/xe_bb.h
> > +++ b/drivers/gpu/drm/xe/xe_bb.h
> > @@ -13,11 +13,14 @@ struct dma_fence;
> > =C2=A0struct xe_gt;
> > =C2=A0struct xe_exec_queue;
> > =C2=A0struct xe_sched_job;
> > +struct xe_sa_manager;
>=20
> wrong order
>=20
> > =C2=A0enum xe_sriov_vf_ccs_rw_ctxs;
> > =C2=A0
> > =C2=A0struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
> > -struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> > -			=C2=A0=C2=A0=C2=A0 enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
> > +struct xe_bb *xe_bb_alloc(struct xe_gt *gt);
> > +void xe_bb_release(struct xe_bb *bb);
> > +int xe_bb_init(struct xe_gt *gt, struct xe_bb *bb,
> > +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_sa_manager *bb_pool, u=
32 dwords);
> > =C2=A0struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_bb *bb);
> > =C2=A0struct xe_sched_job *xe_bb_create_migration_job(struct
> > xe_exec_queue *q,
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index 078a9bc2821d..c858eaa70e3e 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -1148,65 +1148,75 @@ int xe_migrate_ccs_rw_copy(struct xe_tile
> > *tile, struct xe_exec_queue *q,
> > =C2=A0		size -=3D src_L0;
> > =C2=A0	}
> > =C2=A0
> > -	bb_pool =3D ctx->mem.ccs_bb_pool;
> > -	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
> > -	xe_sa_bo_swap_shadow(bb_pool);
> > -
> > -	bb =3D xe_bb_ccs_new(gt, batch_size, read_write);
> > +	bb =3D xe_bb_alloc(gt);
> > =C2=A0	if (IS_ERR(bb)) {
> > -		drm_err(&xe->drm, "BB allocation failed.\n");
> > =C2=A0		err =3D PTR_ERR(bb);
> > =C2=A0		return err;
>=20
> nit: this could be
>=20
> 		return PTR_ERR(bb);
>=20
> > =C2=A0	}
> > =C2=A0
> > -	batch_size_allocated =3D batch_size;
> > -	size =3D xe_bo_size(src_bo);
> > -	batch_size =3D 0;
> > +	bb_pool =3D ctx->mem.ccs_bb_pool;
> > +	scoped_guard(mutex, xe_sa_bo_swap_guard(bb_pool)) {
> > +		xe_sa_bo_swap_shadow(bb_pool);
> > +
> > +		err =3D xe_bb_init(gt, bb, bb_pool, batch_size);
> > +		if (err) {
> > +			drm_err(&xe->drm, "BB allocation
> > failed.\n");
>=20
> nit: there is xe_err() but since there is a gt maybe it should be
> xe_gt_err() ?
>=20
> nit: or maybe move that message to xe_bb_init() ?
>=20
> > +			xe_bb_release(bb);
> > +			return err;
> > +		}
> > =C2=A0
> > -	/*
> > -	 * Emit PTE and copy commands here.
> > -	 * The CCS copy command can only support limited size. If
> > the size to be
> > -	 * copied is more than the limit, divide copy into chunks.
> > So, calculate
> > -	 * sizes here again before copy command is emitted.
> > -	 */
> > -	while (size) {
> > -		batch_size +=3D 10; /* Flush + ggtt addr + 2 NOP */
> > -		u32 flush_flags =3D 0;
> > -		u64 ccs_ofs, ccs_size;
> > -		u32 ccs_pt;
> > +		batch_size_allocated =3D batch_size;
> > +		size =3D xe_bo_size(src_bo);
> > +		batch_size =3D 0;
> > =C2=A0
> > -		u32 avail_pts =3D max_mem_transfer_per_pass(xe) /
> > LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> > +		/*
> > +		 * Emit PTE and copy commands here.
> > +		 * The CCS copy command can only support limited
> > size. If the size to be
> > +		 * copied is more than the limit, divide copy into
> > chunks. So, calculate
> > +		 * sizes here again before copy command is
> > emitted.
> > +		 */
> > =C2=A0
> > -		src_L0 =3D xe_migrate_res_sizes(m, &src_it);
> > +		while (size) {
> > +			batch_size +=3D 10; /* Flush + ggtt addr + 2
> > NOP */
> > +			u32 flush_flags =3D 0;
> > +			u64 ccs_ofs, ccs_size;
> > +			u32 ccs_pt;
> > =C2=A0
> > -		batch_size +=3D pte_update_size(m, false, src,
> > &src_it, &src_L0,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &src_L0_ofs,
> > &src_L0_pt, 0, 0,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 avail_pts);
> > +			u32 avail_pts =3D
> > max_mem_transfer_per_pass(xe) /
> > +					LEVEL0_PAGE_TABLE_ENCODE_S
> > IZE;
> > =C2=A0
> > -		ccs_size =3D xe_device_ccs_bytes(xe, src_L0);
> > -		batch_size +=3D pte_update_size(m, 0, NULL, &ccs_it,
> > &ccs_size, &ccs_ofs,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &ccs_pt, 0,
> > avail_pts, avail_pts);
> > -		xe_assert(xe, IS_ALIGNED(ccs_it.start,
> > PAGE_SIZE));
> > -		batch_size +=3D EMIT_COPY_CCS_DW;
> > +			src_L0 =3D xe_migrate_res_sizes(m, &src_it);
> > +
> > +			batch_size +=3D pte_update_size(m, false,
> > src, &src_it, &src_L0,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &src_L0_ofs,
> > &src_L0_pt, 0, 0,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 avail_pts);
> > +
> > +			ccs_size =3D xe_device_ccs_bytes(xe,
> > src_L0);
> > +			batch_size +=3D pte_update_size(m, 0, NULL,
> > &ccs_it, &ccs_size, &ccs_ofs,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &ccs_pt, 0,
> > avail_pts, avail_pts);
> > +			xe_assert(xe, IS_ALIGNED(ccs_it.start,
> > PAGE_SIZE));
> > +			batch_size +=3D EMIT_COPY_CCS_DW;
> > =C2=A0
> > -		emit_pte(m, bb, src_L0_pt, false, true, &src_it,
> > src_L0, src);
> > +			emit_pte(m, bb, src_L0_pt, false, true,
> > &src_it, src_L0, src);
> > =C2=A0
> > -		emit_pte(m, bb, ccs_pt, false, false, &ccs_it,
> > ccs_size, src);
> > +			emit_pte(m, bb, ccs_pt, false, false,
> > &ccs_it, ccs_size, src);
> > =C2=A0
> > -		bb->len =3D emit_flush_invalidate(bb->cs, bb->len,
> > flush_flags);
> > -		flush_flags =3D xe_migrate_ccs_copy(m, bb,
> > src_L0_ofs, src_is_pltt,
> > -						=C2=A0 src_L0_ofs,
> > dst_is_pltt,
> > -						=C2=A0 src_L0, ccs_ofs,
> > true);
> > -		bb->len =3D emit_flush_invalidate(bb->cs, bb->len,
> > flush_flags);
> > +			bb->len =3D emit_flush_invalidate(bb->cs,
> > bb->len, flush_flags);
> > +			flush_flags =3D xe_migrate_ccs_copy(m, bb,
> > src_L0_ofs, src_is_pltt,
> > +							=C2=A0
> > src_L0_ofs, dst_is_pltt,
> > +							=C2=A0 src_L0,
> > ccs_ofs, true);
> > +			bb->len =3D emit_flush_invalidate(bb->cs,
> > bb->len, flush_flags);
> > =C2=A0
> > -		size -=3D src_L0;
> > -	}
> > +			size -=3D src_L0;
> > +		}
> > =C2=A0
> > -	xe_assert(xe, (batch_size_allocated =3D=3D bb->len));
> > -	src_bo->bb_ccs[read_write] =3D bb;
> > +		xe_assert(xe, (batch_size_allocated =3D=3D bb->len));
> > +		src_bo->bb_ccs[read_write] =3D bb;
> > +
> > +		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> > +		xe_sa_bo_sync_shadow(bb->bo);
> > +	}
> > =C2=A0
> > -	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> > -	xe_sa_bo_sync_shadow(bb->bo);
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_sa.c
> > b/drivers/gpu/drm/xe/xe_sa.c
> > index b738102575d4..59d0187b3e82 100644
> > --- a/drivers/gpu/drm/xe/xe_sa.c
> > +++ b/drivers/gpu/drm/xe/xe_sa.c
> > @@ -175,6 +175,46 @@ struct drm_suballoc *__xe_sa_bo_new(struct
> > xe_sa_manager *sa_manager, u32 size,
> > =C2=A0	return drm_suballoc_new(&sa_manager->base, size, gfp,
> > true, 0);
> > =C2=A0}
> > =C2=A0
> > +/**
> > + * xe_sa_bo_alloc - Allocate uninitialized suballoc object.
> > + * @gfp: gfp flags used for memory allocation.
> > + *
> > + * Allocate memory for an uninitialized suballoc object. Intended
> > usage is
> > + * allocate memory for suballoc object outside of a reclaim
> > tainted context
> > + * and then be initialized at a later time in a reclaim tainted
> > context.
> > + *
> > + * Return: a new uninitialized suballoc object, or an ERR_PTR(-
> > ENOMEM).
> > + */
> > +
>=20
> extra \n
>=20
> > +struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp)
> > +{
> > +	return drm_suballoc_alloc(gfp);
> > +}
> > +
> > +/**
> > + * xe_sa_bo_release - Release memory for suballocation.
>=20
> nit: add () to function name
>=20
> =C2=A0=C2=A0=C2=A0 * xe_sa_bo_release() - ...
>=20
>=20
> > + * @sa: The struct drm_suballoc.
> > + */
> > +void xe_sa_bo_release(struct drm_suballoc *sa)
> > +{
> > +	drm_suballoc_release(sa);
> > +}
> > +
> > +/**
> > + * xe_sa_bo_init - Initialize a suballocation.
>=20
> ditto
>=20
> > + * @sa_manager: pointer to the sa_manager
> > + * @sa: The struct drm_suballoc.
> > + * @size: number of bytes we want to suballocate.
> > + *
> > + * Try to make a suballocation on a pre-allocated suballoc object
> > of size @size.
> > + *
> > + * Return: zero on success, errno on failure.
> > + */
> > +int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct
> > drm_suballoc *sa, u32 size)
>=20
> why size is u32 ? drm_suballoc_init() takes size_t
>=20
> > +{
> > +	return drm_suballoc_init(&sa_manager->base, sa, size,
> > true, 0);
> > +}
> > +
> > =C2=A0/**
> > =C2=A0 * xe_sa_bo_flush_write() - Copy the data from the sub-allocation
> > to the GPU memory.
> > =C2=A0 * @sa_bo: the &drm_suballoc to flush
> > diff --git a/drivers/gpu/drm/xe/xe_sa.h
> > b/drivers/gpu/drm/xe/xe_sa.h
> > index 05e9a4e00e78..19d4b698a7d7 100644
> > --- a/drivers/gpu/drm/xe/xe_sa.h
> > +++ b/drivers/gpu/drm/xe/xe_sa.h
> > @@ -38,6 +38,9 @@ static inline struct drm_suballoc
> > *xe_sa_bo_new(struct xe_sa_manager *sa_manager
> > =C2=A0	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
> > =C2=A0}
> > =C2=A0
> > +struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp);
> > +void xe_sa_bo_release(struct drm_suballoc *sa);
> > +int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct
> > drm_suballoc *sa, u32 size);
> > =C2=A0void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
> > =C2=A0void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo);
> > =C2=A0void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence
> > *fence);
