Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBFEC61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 14:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABC510F0C0;
	Thu, 27 Aug 2026 14:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hbh+pX1I";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DF410F0C0
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 14:56:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 25F85600D2;
 Thu, 27 Aug 2026 14:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C1A1F000E9;
 Thu, 27 Aug 2026 14:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787842585;
 bh=GBfRGkVLqaebrdvEf5kWxQWP8mpt1jmzgwQJM1ax3Gw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Hbh+pX1I/vrBlQMMbE7+4tW1dkyuZ5w+ZAu79Kul9sL10PfqZ+YTA5qaNSFu/PJVZ
 H4qxP/vWvcP/RSxpCpxrZSxFlAMt3n5ytlt/ZR/xLNmVvAPj3bs7wGQginangyNNX9
 rRNUQ+BdzsGC9Ea4RINMWekT/a5W0d8QP10y7ilAs23nzsUHH5YPWsqI/bw/g7al2R
 IchygMkQMZAnnU7qWkbge/AnEgQczaDUrTE3Kqbzkird1di1YW+C9YcSrqlCiWO8sN
 Tgw3AvQtMSlchvMZVHBDdRPD6vZ+6gTYDmq3RJrOnNl0ofjNlUZYd+FtRYXWg+zbQV
 F9bMt2+yftIFQ==
From: sashiko-bot@kernel.org
Subject: Re: [CI v3] drm/xe/vram: Add early VRAM health check
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260827144244.477862-2-matthew.auld@intel.com>
References: <20260827144244.477862-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 14:56:25 +0000
Message-Id: <20260827145625.B0C1A1F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Forcing xe_device_l2_flush() causes unsupported MMIO writes to Xe2=
-specific registers on pre-Xe2 platforms.
- [High] xe_migrate_debug_ccs_overlap() ignores migration job creation fail=
ures, causing xe_vram_memtest() to silently corrupt CCS metadata with unini=
tialized memory.
- [Medium] The memtest_bo reserved for each tile is leaked if xe_device_pro=
be() fails before reaching xe_vram_memtest().
- [Medium] xe_device_l2_flush() incorrectly flushes only the root GT's L2 c=
ache on multi-tile systems, rendering the flush ineffective for non-root ti=
les.
- [Medium] Missing write memory barrier (xe_device_wmb) before xe_device_l2=
_flush creates a race condition.
--

commit 1d02ef806f72d6fb5a8aebd6553ae34e7b2019e8
Author: Matthew Auld <matthew.auld@intel.com>

drm/xe/vram: Add early VRAM health check
   =20
Use the last page as a canary for BAR sizing, CCS sizing, identity map
setup. If something is wrong the last page is where we will likely find
it. Hit it with everything we have.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 396d02eb2af83..601c372775eff 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1051,6 +1051,8 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
> =20
> +	xe_vram_reserve_memtest_bo(xe);
> +
>  	for_each_tile(tile, xe, id) {
>  		err =3D xe_tile_init(tile);
>  		if (err)
>  			return err;

[Severity: Medium]
Will this leak the allocated BOs if one of these subsequent initialization
steps fails? xe_vram_reserve_memtest_bo() pins the BO into
tile->mem.memtest_bo but doesn't seem to register a devm action or provide
automatic cleanup for the probe failure path before xe_vram_memtest()
completes.

[ ... ]
> @@ -1270,7 +1276,7 @@ bool xe_device_is_l2_flush_optimized(struct xe_devi=
ce *xe)
>  	return false;
>  }
> =20
> -void xe_device_l2_flush(struct xe_device *xe)
> +void xe_device_l2_flush(struct xe_device *xe, bool force)
>  {
>  	struct xe_gt *gt;
> =20
>  	gt =3D xe_root_mmio_gt(xe);

[Severity: Medium]
Does this function hardcode the flush to only the root GT? When called insi=
de
the per-tile loop in xe_vram_memtest(), it looks like this will always only
flush Tile 0's L2 cache, skipping the other tiles.

>  	if (!gt)
>  		return;
> =20
> -	if (!XE_GT_WA(gt, 16023588340))
> +	if (!force && !XE_GT_WA(gt, 16023588340))
>  		return;
> =20
>  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);

[Severity: High]
Does forcing this bypass the workaround check on pre-Xe2 platforms?
XE2_GLOBAL_INVAL is an Xe2-specific register, but xe_vram_memtest() sets
force to true on any device with flat CCS (e.g., DG2). Could this cause
unsupported MMIO writes and hardware errors on those older platforms?

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 75b83687f1b5d..271bcfb0859ce 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
[ ... ]
> @@ -2633,3 +2633,64 @@ void xe_migrate_job_lock_assert(struct xe_exec_que=
ue *q)
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
> +void xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
> +				  struct xe_bo *scratch_bo,
> +				  bool write_to_ccs)
> +{
[ ... ]
> +	job =3D xe_bb_create_migration_job(m->q, bb,
> +					 xe_migrate_batch_base(m, xe->info.has_usm),
> +					 0);
> +	if (!IS_ERR(job)) {
> +		xe_sched_job_add_migrate_flush(job, MI_FLUSH_DW_CCS);
> +
> +		mutex_lock(&m->job_mutex);
> +		xe_sched_job_arm(job);
> +
> +		fence =3D dma_fence_get(&job->drm.s_fence->finished);
> +		xe_sched_job_push(job);
> +		mutex_unlock(&m->job_mutex);
> +
> +		dma_fence_wait(fence, false);
> +		dma_fence_put(fence);
> +	} else {
> +		drm_warn(&xe->drm, "Failed to create job for VRAM overlap check\n");
> +	}
> +
> +	xe_bb_free(bb, NULL);
> +}
> +#endif

[Severity: High]
What happens if the migration job fails to create here? This function retur=
ns
void, swallowing the error. If the first call in xe_vram_memtest() fails to
save the original CCS metadata, it leaves scratch_bo_before uninitialized,
and the final call will later restore this uninitialized garbage into the C=
CS
metadata. Could this silently corrupt hardware state?

> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 7b4478fb1697c..393ab8761686c 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
[ ... ]
> +int xe_vram_memtest(struct xe_device *xe)
> +{
[ ... ]
> +		if (xe_device_has_flat_ccs(xe)) {
> +			struct xe_bo *scratch_bo_before;
> +			struct xe_bo *scratch_bo_after;
[ ... ]
> +			/* Save original CCS metadata for PA 0 */
> +			xe_migrate_debug_ccs_overlap(tile->migrate, scratch_bo_before, false);
> +
> +			/* Fill last page with CPU */
> +			xe_map_memset(xe, &last_page_bo->vmap, 0, 0x5A, SZ_64K);
> +			xe_device_l2_flush(xe, true);

[Severity: Medium]
Should there be an xe_device_wmb() here before flushing the L2 cache?
xe_map_memset() uses Write-Combining (WC) semantics, so the GPU might read
stale data if the CPU's WC buffers aren't fully flushed to memory before the
MMIO flush command is received.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827144244.4778=
62-2-matthew.auld@intel.com?part=3D1
