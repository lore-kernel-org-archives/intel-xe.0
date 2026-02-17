Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21423E83844
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 13:22:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FC910E23B;
	Tue, 17 Feb 2026 13:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+0yRo2R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468FC10E23B
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Feb 2026 13:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771334530; x=1802870530;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BaNEQ4jRDwpYtA5LM76zPbdjBzMdTn/u1hAeNPUtzGE=;
 b=K+0yRo2RU47PEylOu1jFhAZkuHxzlUyJYHxHLmd17PNcN8fOAL4DCA9v
 73oE5731kzw2neoTFMJ+fsMALxWWvqNLFChyZsNDcuXPIjvU3sqxfZn75
 SLCnZYGccgjaWQhs2BmAEy+JcxRlitACFIxVKZIwnSc0PHugbLPqnQ2S7
 0zTnm2lB2GmRpVl4B44CjXT06btFVerAe8ys+D2i67omcPY/Lw4cQKEMP
 3w5Svc+8yph0VZYtwF3Kd7yXZJb8VDV8903V0o3jzEzpK0Shv5zmHdm6b
 WjUO+q9NRTndH0cU3aHlZl1h7Pzd+OZEK0Cqxed/J8Tci7Ywcq3DaJpYC A==;
X-CSE-ConnectionGUID: 4pKCqizAQJGvbHFuUH+yzA==
X-CSE-MsgGUID: l9wUp5eHTJWbBigEcfGYnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72576260"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="72576260"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 05:22:10 -0800
X-CSE-ConnectionGUID: gf1BRBxYQhOn6zwc5PQDrA==
X-CSE-MsgGUID: Fydqc5TWQ76jvDVt5mIcVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="212351564"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.127])
 ([10.245.245.127])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 05:22:08 -0800
Message-ID: <aa1c38307ec2873c955b52f31a161dec41bb3cef.camel@linux.intel.com>
Subject: Re: [PATCH v5 2/3] drm/xe/vf: Fix fs_reclaim warning with CCS
 save/restore BB allocation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Date: Tue, 17 Feb 2026 14:22:06 +0100
In-Reply-To: <20260217120745.1074232-7-satyanarayana.k.v.p@intel.com>
References: <20260217120745.1074232-5-satyanarayana.k.v.p@intel.com>
 <20260217120745.1074232-7-satyanarayana.k.v.p@intel.com>
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

On Tue, 2026-02-17 at 12:07 +0000, Satyanarayana K V P wrote:
> CCS save/restore batch buffers are attached during BO allocation and
> detached during BO teardown. The shrinker triggers xe_bo_move(),
> which is
> used for both allocation and deletion paths.
>=20
> When BO allocation and shrinking occur concurrently, a circular
> locking
> dependency involving fs_reclaim and swap_guard can occur, leading to
> a
> deadlock such as:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> WARNING: possible circular locking dependency detected
> ------------------------------------------------------
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 CPU1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ----=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ----
> =C2=A0lock(fs_reclaim);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock(&sa_manager->swap_guard);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock(fs_reclaim);
> =C2=A0lock(&sa_manager->swap_guard);
>=20
> =C2=A0*** DEADLOCK ***
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>=20
> To avoid this, the BB pointer and SA are allocated using
> xe_bb_alloc()
> before taking lock and SA is initialized using xe_bb_init()
> preventing
> reclaim from being invoked in this context.
>=20
> Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy commands
> with BO")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Still holds.

/Thomas


>=20
> ---
> V4 -> V5:
> - Removed enum xe_sriov_vf_ccs_rw_ctxs from xe_bb.h as it is not used
> =C2=A0 any more (Michal).
>=20
> V3 -> V4:
> - Fixed some nits (Michal).
>=20
> V2 -> V3:
> - Updated commit message (Matt, Thomas & Christian).
> - Removed timeout logic from drm_suballoc_init(). (Thomas &
> Christian).
>=20
> V1 -> V2:
> - Splitted drm_suballoc_new() into drm_suballoc_alloc() and
> drm_suballoc_init() (Thomas).
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 72 +++++=
+++++++++++++------
> =C2=A0drivers/gpu/drm/xe/xe_bb.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 =
++-
> =C2=A0drivers/gpu/drm/xe/xe_migrate.c | 99 ++++++++++++++++++------------=
-
> --
> =C2=A0drivers/gpu/drm/xe/xe_sa.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 39 +++++=
++++++++
> =C2=A0drivers/gpu/drm/xe/xe_sa.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 =
+
> =C2=A05 files changed, 156 insertions(+), 64 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 8b678297aaa2..a991d9db8164 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -59,16 +59,64 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32
> dwords, bool usm)
> =C2=A0	return ERR_PTR(err);
> =C2=A0}
> =C2=A0
> -struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> -			=C2=A0=C2=A0=C2=A0 enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> +/**
> + * xe_bb_alloc() - Allocate a new batch buffer structure
> + * @gt: the &xe_gt
> + *
> + * Allocates and initializes a new xe_bb structure with an
> associated
> + * uninitialized suballoc object.
> + *
> + * Returns: Batch buffer structure or an ERR_PTR(-ENOMEM).
> + */
> +struct xe_bb *xe_bb_alloc(struct xe_gt *gt)
> =C2=A0{
> =C2=A0	struct xe_bb *bb =3D kmalloc(sizeof(*bb), GFP_KERNEL);
> -	struct xe_device *xe =3D gt_to_xe(gt);
> -	struct xe_sa_manager *bb_pool;
> =C2=A0	int err;
> =C2=A0
> =C2=A0	if (!bb)
> =C2=A0		return ERR_PTR(-ENOMEM);
> +
> +	bb->bo =3D xe_sa_bo_alloc(GFP_KERNEL);
> +	if (IS_ERR(bb->bo)) {
> +		err =3D PTR_ERR(bb->bo);
> +		goto err;
> +	}
> +
> +	return bb;
> +
> +err:
> +	kfree(bb);
> +	return ERR_PTR(err);
> +}
> +
> +/**
> + * xe_bb_release() - Release and free a batch buffer structure
> + * @bb: Batch buffer structure to release
> + *
> + * Releases the sub-allocated buffer object associated with the
> batch buffer
> + * and frees the xe_bb structure memory.
> + */
> +void xe_bb_release(struct xe_bb *bb)
> +{
> +	xe_sa_bo_release(bb->bo);
> +	kfree(bb);
> +}
> +
> +/**
> + * xe_bb_init() - Initialize a batch buffer with memory from a sub-
> allocator pool
> + * @bb: Batch buffer structure to initialize
> + * @bb_pool: Suballoc memory pool to allocate from
> + * @dwords: Number of dwords to be allocated
> + *
> + * Initializes the batch buffer by allocating memory from the
> specified
> + * suballoc pool.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_bb_init(struct xe_bb *bb, struct xe_sa_manager *bb_pool, u32
> dwords)
> +{
> +	int err;
> +
> =C2=A0	/*
> =C2=A0	 * We need to allocate space for the requested number of
> dwords &
> =C2=A0	 * one additional MI_BATCH_BUFFER_END dword. Since the whole
> SA
> @@ -76,22 +124,14 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt,
> u32 dwords,
> =C2=A0	 * is not over written when the last chunk of SA is
> allocated for BB.
> =C2=A0	 * So, this extra DW acts as a guard here.
> =C2=A0	 */
> -
> -	bb_pool =3D xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
> -	bb->bo =3D xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
> -
> -	if (IS_ERR(bb->bo)) {
> -		err =3D PTR_ERR(bb->bo);
> -		goto err;
> -	}
> +	err =3D xe_sa_bo_init(bb_pool, bb->bo, 4 * (dwords + 1));
> +	if (err)
> +		return err;
> =C2=A0
> =C2=A0	bb->cs =3D xe_sa_bo_cpu_addr(bb->bo);
> =C2=A0	bb->len =3D 0;
> =C2=A0
> -	return bb;
> -err:
> -	kfree(bb);
> -	return ERR_PTR(err);
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static struct xe_sched_job *
> diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> index 2a8adc9a6dee..5778699149ec 100644
> --- a/drivers/gpu/drm/xe/xe_bb.h
> +++ b/drivers/gpu/drm/xe/xe_bb.h
> @@ -12,12 +12,13 @@ struct dma_fence;
> =C2=A0
> =C2=A0struct xe_gt;
> =C2=A0struct xe_exec_queue;
> +struct xe_sa_manager;
> =C2=A0struct xe_sched_job;
> -enum xe_sriov_vf_ccs_rw_ctxs;
> =C2=A0
> =C2=A0struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
> -struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> -			=C2=A0=C2=A0=C2=A0 enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
> +struct xe_bb *xe_bb_alloc(struct xe_gt *gt);
> +void xe_bb_release(struct xe_bb *bb);
> +int xe_bb_init(struct xe_bb *bb, struct xe_sa_manager *bb_pool, u32
> dwords);
> =C2=A0struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_bb *bb);
> =C2=A0struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queu=
e
> *q,
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index 078a9bc2821d..d4cfc54d614b 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -25,6 +25,7 @@
> =C2=A0#include "xe_exec_queue.h"
> =C2=A0#include "xe_ggtt.h"
> =C2=A0#include "xe_gt.h"
> +#include "xe_gt_printk.h"
> =C2=A0#include "xe_hw_engine.h"
> =C2=A0#include "xe_lrc.h"
> =C2=A0#include "xe_map.h"
> @@ -1148,65 +1149,73 @@ int xe_migrate_ccs_rw_copy(struct xe_tile
> *tile, struct xe_exec_queue *q,
> =C2=A0		size -=3D src_L0;
> =C2=A0	}
> =C2=A0
> +	bb =3D xe_bb_alloc(gt);
> +	if (IS_ERR(bb))
> +		return PTR_ERR(bb);
> +
> =C2=A0	bb_pool =3D ctx->mem.ccs_bb_pool;
> -	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
> -	xe_sa_bo_swap_shadow(bb_pool);
> +	scoped_guard(mutex, xe_sa_bo_swap_guard(bb_pool)) {
> +		xe_sa_bo_swap_shadow(bb_pool);
> +
> +		err =3D xe_bb_init(bb, bb_pool, batch_size);
> +		if (err) {
> +			xe_gt_err(gt, "BB allocation failed.\n");
> +			xe_bb_release(bb);
> +			return err;
> +		}
> =C2=A0
> -	bb =3D xe_bb_ccs_new(gt, batch_size, read_write);
> -	if (IS_ERR(bb)) {
> -		drm_err(&xe->drm, "BB allocation failed.\n");
> -		err =3D PTR_ERR(bb);
> -		return err;
> -	}
> +		batch_size_allocated =3D batch_size;
> +		size =3D xe_bo_size(src_bo);
> +		batch_size =3D 0;
> =C2=A0
> -	batch_size_allocated =3D batch_size;
> -	size =3D xe_bo_size(src_bo);
> -	batch_size =3D 0;
> +		/*
> +		 * Emit PTE and copy commands here.
> +		 * The CCS copy command can only support limited
> size. If the size to be
> +		 * copied is more than the limit, divide copy into
> chunks. So, calculate
> +		 * sizes here again before copy command is emitted.
> +		 */
> =C2=A0
> -	/*
> -	 * Emit PTE and copy commands here.
> -	 * The CCS copy command can only support limited size. If
> the size to be
> -	 * copied is more than the limit, divide copy into chunks.
> So, calculate
> -	 * sizes here again before copy command is emitted.
> -	 */
> -	while (size) {
> -		batch_size +=3D 10; /* Flush + ggtt addr + 2 NOP */
> -		u32 flush_flags =3D 0;
> -		u64 ccs_ofs, ccs_size;
> -		u32 ccs_pt;
> +		while (size) {
> +			batch_size +=3D 10; /* Flush + ggtt addr + 2
> NOP */
> +			u32 flush_flags =3D 0;
> +			u64 ccs_ofs, ccs_size;
> +			u32 ccs_pt;
> =C2=A0
> -		u32 avail_pts =3D max_mem_transfer_per_pass(xe) /
> LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> +			u32 avail_pts =3D
> max_mem_transfer_per_pass(xe) /
> +					LEVEL0_PAGE_TABLE_ENCODE_SIZ
> E;
> =C2=A0
> -		src_L0 =3D xe_migrate_res_sizes(m, &src_it);
> +			src_L0 =3D xe_migrate_res_sizes(m, &src_it);
> =C2=A0
> -		batch_size +=3D pte_update_size(m, false, src,
> &src_it, &src_L0,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &src_L0_ofs,
> &src_L0_pt, 0, 0,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 avail_pts);
> +			batch_size +=3D pte_update_size(m, false, src,
> &src_it, &src_L0,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &src_L0_ofs,
> &src_L0_pt, 0, 0,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 avail_pts);
> =C2=A0
> -		ccs_size =3D xe_device_ccs_bytes(xe, src_L0);
> -		batch_size +=3D pte_update_size(m, 0, NULL, &ccs_it,
> &ccs_size, &ccs_ofs,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &ccs_pt, 0, avail_pts,
> avail_pts);
> -		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> -		batch_size +=3D EMIT_COPY_CCS_DW;
> +			ccs_size =3D xe_device_ccs_bytes(xe, src_L0);
> +			batch_size +=3D pte_update_size(m, 0, NULL,
> &ccs_it, &ccs_size, &ccs_ofs,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &ccs_pt, 0,
> avail_pts, avail_pts);
> +			xe_assert(xe, IS_ALIGNED(ccs_it.start,
> PAGE_SIZE));
> +			batch_size +=3D EMIT_COPY_CCS_DW;
> =C2=A0
> -		emit_pte(m, bb, src_L0_pt, false, true, &src_it,
> src_L0, src);
> +			emit_pte(m, bb, src_L0_pt, false, true,
> &src_it, src_L0, src);
> =C2=A0
> -		emit_pte(m, bb, ccs_pt, false, false, &ccs_it,
> ccs_size, src);
> +			emit_pte(m, bb, ccs_pt, false, false,
> &ccs_it, ccs_size, src);
> =C2=A0
> -		bb->len =3D emit_flush_invalidate(bb->cs, bb->len,
> flush_flags);
> -		flush_flags =3D xe_migrate_ccs_copy(m, bb, src_L0_ofs,
> src_is_pltt,
> -						=C2=A0 src_L0_ofs,
> dst_is_pltt,
> -						=C2=A0 src_L0, ccs_ofs,
> true);
> -		bb->len =3D emit_flush_invalidate(bb->cs, bb->len,
> flush_flags);
> +			bb->len =3D emit_flush_invalidate(bb->cs, bb-
> >len, flush_flags);
> +			flush_flags =3D xe_migrate_ccs_copy(m, bb,
> src_L0_ofs, src_is_pltt,
> +							=C2=A0
> src_L0_ofs, dst_is_pltt,
> +							=C2=A0 src_L0,
> ccs_ofs, true);
> +			bb->len =3D emit_flush_invalidate(bb->cs, bb-
> >len, flush_flags);
> =C2=A0
> -		size -=3D src_L0;
> -	}
> +			size -=3D src_L0;
> +		}
> =C2=A0
> -	xe_assert(xe, (batch_size_allocated =3D=3D bb->len));
> -	src_bo->bb_ccs[read_write] =3D bb;
> +		xe_assert(xe, (batch_size_allocated =3D=3D bb->len));
> +		src_bo->bb_ccs[read_write] =3D bb;
> +
> +		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> +		xe_sa_bo_sync_shadow(bb->bo);
> +	}
> =C2=A0
> -	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> -	xe_sa_bo_sync_shadow(bb->bo);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index b738102575d4..4b3dcc7e5ae0 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -175,6 +175,45 @@ struct drm_suballoc *__xe_sa_bo_new(struct
> xe_sa_manager *sa_manager, u32 size,
> =C2=A0	return drm_suballoc_new(&sa_manager->base, size, gfp, true,
> 0);
> =C2=A0}
> =C2=A0
> +/**
> + * xe_sa_bo_alloc() - Allocate uninitialized suballoc object.
> + * @gfp: gfp flags used for memory allocation.
> + *
> + * Allocate memory for an uninitialized suballoc object. Intended
> usage is
> + * allocate memory for suballoc object outside of a reclaim tainted
> context
> + * and then be initialized at a later time in a reclaim tainted
> context.
> + *
> + * Return: a new uninitialized suballoc object, or an ERR_PTR(-
> ENOMEM).
> + */
> +struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp)
> +{
> +	return drm_suballoc_alloc(gfp);
> +}
> +
> +/**
> + * xe_sa_bo_release() - Release memory for suballocation.
> + * @sa: The struct drm_suballoc.
> + */
> +void xe_sa_bo_release(struct drm_suballoc *sa)
> +{
> +	drm_suballoc_release(sa);
> +}
> +
> +/**
> + * xe_sa_bo_init() - Initialize a suballocation.
> + * @sa_manager: pointer to the sa_manager
> + * @sa: The struct drm_suballoc.
> + * @size: number of bytes we want to suballocate.
> + *
> + * Try to make a suballocation on a pre-allocated suballoc object of
> size @size.
> + *
> + * Return: zero on success, errno on failure.
> + */
> +int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct
> drm_suballoc *sa, size_t size)
> +{
> +	return drm_suballoc_init(&sa_manager->base, sa, size, true,
> 0);
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_sa_bo_flush_write() - Copy the data from the sub-allocation t=
o
> the GPU memory.
> =C2=A0 * @sa_bo: the &drm_suballoc to flush
> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> index 05e9a4e00e78..156b6e6fa14b 100644
> --- a/drivers/gpu/drm/xe/xe_sa.h
> +++ b/drivers/gpu/drm/xe/xe_sa.h
> @@ -38,6 +38,9 @@ static inline struct drm_suballoc
> *xe_sa_bo_new(struct xe_sa_manager *sa_manager
> =C2=A0	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
> =C2=A0}
> =C2=A0
> +struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp);
> +void xe_sa_bo_release(struct drm_suballoc *sa);
> +int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct
> drm_suballoc *sa, size_t size);
> =C2=A0void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
> =C2=A0void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo);
> =C2=A0void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence
> *fence);
