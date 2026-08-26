Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39DFC61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC5810E4C3;
	Wed, 26 Aug 2026 13:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A0DtN0mQ";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E0510E88D
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 13:11:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 89932408D1;
 Wed, 26 Aug 2026 13:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD171F000E9;
 Wed, 26 Aug 2026 13:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787749895;
 bh=E6vWtbXGDCSBbUnxJnu7g3Jk1WDejpZilZ1siErjPqo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=A0DtN0mQKj2S8IAofkFgshEFPHCzVJsbahG0DyXIeOWxpoTtJ59B/7CMON5ZsCfh3
 NwuI7ZlMwN2TvsNLCWQD3CLEfGTDWBhRLrMyFBEdLh3r/hJiiOWEju4dgfQQdBCEzZ
 PViw06suAe8fev5KvPHIUOK1OH1c2kbsczUdZIgDY21dSs0/PQFc87/N9lqXs156Rf
 R0DfAIGJR8ZiIrh3IkAco+dj6Tm1ke4mSc75Ar6QJQ6hZOiU4YHPXRINE9DSZNEXn/
 mHIO5IXiJeqJdkiNh+nqazJ2WcKM09LAlhmJ46+McxVyopI21FuYXl044+ogQqCCc7
 qH0HuPWwoXgAg==
From: sashiko-bot@kernel.org
Subject: Re: [CI] drm/xe/vram: Add early VRAM health check
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260826125304.378173-2-matthew.auld@intel.com>
References: <20260826125304.378173-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 13:11:34 +0000
Message-Id: <20260826131135.4BD171F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] VRAM memtest BOs are leaked on error paths and skipped tiles.
- [High] `xe_migrate_debug_ccs_overlap` fails to acquire the necessary `job=
_mutex` lock.
- [High] `xe_migrate_debug_ccs_overlap` fails to initialize the second migr=
ation batch buffer, causing execution of uninitialized GPU memory.
- [High] Hardcoded 256MB VRAM bounds in `xe_migrate_debug_ccs_overlap` caus=
es out-of-bounds GPU reads on systems with small VRAM.
- [High] The CCS overlap test writes a canary to the end of VRAM but checks=
 the CCS metadata for the beginning of VRAM, rendering the test useless.
- [Medium] Mismatch between code implementation and comment for flat CCS of=
fset rounding.
- [Medium] Config guard mismatch for `memtest_bo` causes build failures.
- [Medium] Ignoring the return value of `xe_migrate_clear()` masks software=
 errors as hardware failures.
--

commit c386b266adaf1a488d11cddd5ddf577c88467fb1
Author: Matthew Auld <matthew.auld@intel.com>
Subject: drm/xe/vram: Add early VRAM health check

This commit introduces an early VRAM health check to detect BAR sizing, CCS
sizing, and identity map setup issues using a canary page at the end of VRA=
M.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 71ce153737abe..5d9e3dc133fa8 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
[ ... ]
> @@ -1040,6 +1040,8 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
> =20
> +	xe_vram_reserve_memtest_bo(xe);
> +
>  	for_each_tile(tile, xe, id) {
>  		err =3D xe_tile_init(tile);
>  		if (err)
>  			return err;

[Severity: High]
If xe_tile_init() fails, does this code leak the reserved memtest BOs since
there is no cleanup before returning the error?

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index f79d0047bec69..644be4c2d4404 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
[ ... ]
> @@ -2635,3 +2635,59 @@ void xe_migrate_job_lock_assert(struct xe_exec_que=
ue *q)
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>  #include "tests/xe_migrate.c"
>  #endif
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
> +void xe_migrate_debug_ccs_overlap(struct xe_migrate *m, struct xe_bo *la=
st_page_bo, struct xe_bo *scratch_bo)
> +{
> +	struct xe_device *xe =3D tile_to_xe(m->tile);
> +	struct xe_gt *gt =3D m->tile->primary_gt;
> +	struct dma_fence *fence;
> +	struct xe_bb *bb;
> +	struct xe_sched_job *job;
> +	u64 first_page_dpa, clear_L0_ofs, scratch_dpa, scratch_L0_ofs;
> +
> +	if (!xe_device_has_flat_ccs(xe))
> +		return;
> +
> +	first_page_dpa =3D xe_vram_region_dpa_base(m->tile->mem.vram);
> +	clear_L0_ofs =3D xe_migrate_vram_ofs(xe, first_page_dpa, true);

[Severity: High]
The test writes a canary pattern to the end of VRAM (vram_size - SZ_64K) la=
ter,
but clear_L0_ofs is based on first_page_dpa (the very beginning of VRAM). D=
oes
this check the wrong CCS metadata region and miss the canary pattern entire=
ly?

> +
> +	scratch_dpa =3D xe_bo_addr(scratch_bo, 0, XE_PAGE_SIZE);
> +	scratch_L0_ofs =3D xe_migrate_vram_ofs(xe, scratch_dpa, false);
> +
> +	for (int j =3D 0; j < 4; j++) {
> +		bb =3D xe_bb_new(gt, 256, xe->info.has_usm);
> +		if (IS_ERR(bb)) {
> +			drm_warn(&xe->drm, "Failed to create bb for VRAM overlap check\n");
> +			return;
> +		}
> +
> +		for (int i =3D 0; i < 16; i++) {
> +			int idx =3D (j * 16) + i;
> +			/* 4MB payload =3D 16KB CCS metadata */
> +			emit_copy_ccs(gt, bb, scratch_L0_ofs + (idx * 16384), false,
> +				      clear_L0_ofs + (idx * SZ_4M), true, SZ_4M);

[Severity: High]
Is it possible for a tile's VRAM to be smaller than 256MB? This loop
unconditionally tests 256MB (64 iterations of 4MB chunks), which might resu=
lt
in out-of-bounds GPU reads on smaller VRAM configurations.

> +		}
> +
> +		bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
> +
> +		job =3D xe_bb_create_migration_job(m->q, bb,
> +						 xe_migrate_batch_base(m, xe->info.has_usm),
> +						 bb->len);

[Severity: High]
By passing bb->len as the second_idx right after writing MI_BATCH_BUFFER_EN=
D,
does xe_bb_create_migration_job() leave the second batch buffer empty and
unterminated? This might cause the GPU to execute uninitialized memory.

> +		if (!IS_ERR(job)) {
> +			xe_sched_job_add_migrate_flush(job, MI_FLUSH_DW_CCS);
> +			xe_sched_job_arm(job);
> +
> +			fence =3D dma_fence_get(&job->drm.s_fence->finished);
> +			xe_sched_job_push(job);

[Severity: High]
Does this code need to acquire m->job_mutex before calling xe_sched_job_arm=
()
and xe_sched_job_push()? Other migration jobs hold this lock to serialize
queue accesses.

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_tile_types.h b/drivers/gpu/drm/xe/xe_t=
ile_types.h
> index 0048100ccb723..75097e4d1c643 100644
> --- a/drivers/gpu/drm/xe/xe_tile_types.h
> +++ b/drivers/gpu/drm/xe/xe_tile_types.h
> @@ -97,6 +97,10 @@ struct xe_tile {
>  		 * Only main GT has page reclaim list allocations.
>  		 */
>  		struct xe_sa_manager *reclaim_pool;
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +		/** @mem.memtest_bo: VRAM overlap check BO */
> +		struct xe_bo *memtest_bo;
> +#endif

[Severity: Medium]
In this header, memtest_bo is guarded by CONFIG_DRM_XE_DEBUG, but in
xe_vram.c and xe_migrate.c its usage is guarded by CONFIG_DRM_XE_DEBUG_MEM.
Will this cause a build failure if CONFIG_DRM_XE_DEBUG_MEM is enabled witho=
ut
CONFIG_DRM_XE_DEBUG?

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 23eb7edbdd572..eb3d7b42371cd 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
[ ... ]
> @@ -89,7 +92,7 @@ static int get_flat_ccs_offset(struct xe_gt *gt, u64 ti=
le_size, u64 *poffset)
>  		offset =3D offset_hi << 32; /* HW view bits 39:32 */
>  		offset |=3D offset_lo << 6; /* HW view bits 31:6 */
>  		offset *=3D num_enabled; /* convert to SW view */
> -		offset =3D round_up(offset, SZ_128K); /* SW must round up to nearest 1=
28K */
> +		offset =3D round_up(offset, SZ_128K); /* SW must round down to nearest=
 2M */

[Severity: Medium]
The comment states we must round down to nearest 2M, but the code still cal=
ls
round_up(offset, SZ_128K). Which one is the intended behavior?

[ ... ]
> @@ -387,3 +390,160 @@ resource_size_t xe_vram_region_actual_physical_size=
(const struct xe_vram_region
[ ... ]
> +int xe_vram_memtest(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	u8 id;
> +	int err =3D 0;
> +
> +	for_each_tile(tile, xe, id) {
> +		struct xe_bo *last_page_bo =3D tile->mem.memtest_bo;
> +		struct dma_fence *fence;
> +		bool overlap =3D false;
> +		int i, consecutive =3D 0;
> +		u8 val;
> +
> +		if (!last_page_bo || !tile->migrate)
> +			continue;

[Severity: High]
For tiles without a migrate engine, does this continue bypass the unpin and
cleanup of tile->mem.memtest_bo, leading to a resource leak?

[ ... ]
> +		/* 2. Non-CCS access via GPU on the last page */
> +		fence =3D xe_migrate_clear(tile->migrate, last_page_bo,
> +					 last_page_bo->ttm.resource,
> +					 XE_MIGRATE_CLEAR_FLAG_BO_DATA);
> +		if (!IS_ERR(fence)) {
> +			dma_fence_wait(fence, false);
> +			dma_fence_put(fence);
> +		}
> +
> +		rmb();
> +
> +		val =3D xe_map_rd(xe, &last_page_bo->vmap, 0, u8);
> +		if (drm_WARN(&xe->drm, val !=3D 0x00,
> +			     "Tile %d: GPU memtest clear failed at offset 0 (expected 0x00, g=
ot 0x%02x)\n",
> +			     id, val)) {

[Severity: Medium]
If xe_migrate_clear() fails and returns an ERR_PTR, this skips the wait but
proceeds to read the VRAM validation byte. Will this falsely report a GPU
hardware failure because it reads the old 0xA5 value instead of 0x00?

[ ... ]
> +
> +unpin:
> +		xe_bo_unpin_map_no_vm(last_page_bo);
> +		tile->mem.memtest_bo =3D NULL;
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}

[Severity: High]
On error, this early return skips cleanup for the remaining tiles in the lo=
op.
Does this code leak the memtest_bo for subsequent tiles?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826125304.3781=
73-2-matthew.auld@intel.com?part=3D1
