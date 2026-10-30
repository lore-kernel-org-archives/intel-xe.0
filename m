Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF8B606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 15:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OYONJYku
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1373D10E264;
	Fri, 30 Oct 2026 15:28:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7352010E257
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 15:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793374115; x=1824910115;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VpxfwUba1z77LUr+p5wXWEFRIgQTwLz4YRY2r+3beXY=;
 b=OYONJYku4/7CqMxIaFW4gGEKSQ8RBBAkrhBESAoHjGQolREm4NhhrBX5
 JCVBkQkzrTptqweDGolmTjSEGE1ZVBsLb2/P3py/RYu+cN94mve/TZpGW
 YJiAWpBt8H59UGERs7A+pIBsKXQ1U3mwgaaKbAMWB/he+9xPV63d12o+D
 +vyp0tmByxXLiWnx4nFcWxtEJkwBq6abKeBLvX5a8FHFTPICE9XRkZ4rk
 sZL6w4sW4DbW3dNV+2h86JTcX1OzL4DFvNcVuYcrd2sZjtof6ClXKnpuY
 s6q1bhgmKZkrODR5ECxThUQykOtYosuC0jVQLd1hT3LdlcnAIHUaoX8Rj w==;
X-CSE-ConnectionGUID: gUvoMqi2RtO2QgG9H5tHrw==
X-CSE-MsgGUID: xy9+GfsJQMai96HCiqgcSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2053401"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2053401"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 08:28:35 -0700
X-CSE-ConnectionGUID: ZFMufWKlTYyputO4gPNtHA==
X-CSE-MsgGUID: nhcfyvV+SASofKRcWiITyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5475868"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.72])
 ([10.245.244.72])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 08:28:34 -0700
Message-ID: <60bbc8e80a642d8b1f5d42a9e2a14209f5e5124f.camel@linux.intel.com>
Subject: Re: [PATCH 5/6] drm/xe/migrate: plumb interruptible wait flag to
 clear and copy
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Date: Fri, 30 Oct 2026 16:28:32 +0100
In-Reply-To: <20261030-migrate-bb-optimise-v1-5-b8d01649cfe9@intel.com>
References: <20261030-migrate-bb-optimise-v1-0-b8d01649cfe9@intel.com>
 <20261030-migrate-bb-optimise-v1-5-b8d01649cfe9@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 2026-10-30 at 11:49 +0000, Matthew Auld wrote:
> Plumb a bool intr parameter into xe_migrate_clear() and
> xe_migrate_copy() and pass it to __xe_bb_new(), forwarding
> ctx->interruptible from xe_bo_move() and false from non-interruptible
> kernel callers so suballocator waits respect the caller's context.
>=20
> Assisted-by: LLM
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9644
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Should this and the previous one have a -fixes?

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/tests/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/xe/tests/xe_migrate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 12 ++++++------
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +++++--=
--
> =C2=A0drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |=C2=A0 3 ++-
> =C2=A0drivers/gpu/drm/xe/xe_migrate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 ++++++++++++-------
> =C2=A0drivers/gpu/drm/xe/xe_migrate.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++++--
> =C2=A0drivers/gpu/drm/xe/xe_vram.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A07 files changed, 31 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c
> b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 6a17e13d58cf..22a2e8f8143a 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -270,7 +270,7 @@ static int ccs_test_migrate(struct xe_tile *tile,
> struct xe_bo *bo,
> =C2=A0	/* Optionally clear bo *and* CCS data in VRAM. */
> =C2=A0	if (clear) {
> =C2=A0		fence =3D xe_migrate_clear(tile->migrate, bo, bo-
> >ttm.resource,
> -				=09
> XE_MIGRATE_CLEAR_FLAG_FULL);
> +					 XE_MIGRATE_CLEAR_FLAG_FULL,
> false);
> =C2=A0		if (IS_ERR(fence)) {
> =C2=A0			KUNIT_FAIL(test, "Failed to submit bo
> clear.\n");
> =C2=A0			return PTR_ERR(fence);
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c
> b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index a9ef8f2dcebb..162532412426 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -112,7 +112,7 @@ static void test_copy(struct xe_migrate *m,
> struct xe_bo *bo,
> =C2=A0
> =C2=A0	xe_map_memset(xe, &remote->vmap, 0, 0xd0,
> xe_bo_size(remote));
> =C2=A0	fence =3D xe_migrate_clear(m, remote, remote->ttm.resource,
> -				 XE_MIGRATE_CLEAR_FLAG_FULL);
> +				 XE_MIGRATE_CLEAR_FLAG_FULL, false);
> =C2=A0	if (!sanity_fence_failed(xe, fence, big ? "Clearing remote
> big bo" :
> =C2=A0				 "Clearing remote small bo", test))
> {
> =C2=A0		retval =3D xe_map_rd(xe, &remote->vmap, 0, u64);
> @@ -130,7 +130,7 @@ static void test_copy(struct xe_migrate *m,
> struct xe_bo *bo,
> =C2=A0
> =C2=A0	expected =3D 0xc0c0c0c0c0c0c0c0;
> =C2=A0	fence =3D xe_migrate_copy(m, remote, bo, remote->ttm.resource,
> -				bo->ttm.resource, false);
> +				bo->ttm.resource, false, false);
> =C2=A0	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo
> remote -> vram" :
> =C2=A0				 "Copying small bo remote -> vram",
> test)) {
> =C2=A0		retval =3D xe_map_rd(xe, &bo->vmap, 0, u64);
> @@ -147,7 +147,7 @@ static void test_copy(struct xe_migrate *m,
> struct xe_bo *bo,
> =C2=A0	xe_map_memset(xe, &bo->vmap, 0, 0xc0, xe_bo_size(bo));
> =C2=A0
> =C2=A0	fence =3D xe_migrate_copy(m, bo, remote, bo->ttm.resource,
> -				remote->ttm.resource, false);
> +				remote->ttm.resource, false, false);
> =C2=A0	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo
> vram -> remote" :
> =C2=A0				 "Copying small bo vram -> remote",
> test)) {
> =C2=A0		retval =3D xe_map_rd(xe, &remote->vmap, 0, u64);
> @@ -287,7 +287,7 @@ static void xe_migrate_sanity_test(struct
> xe_migrate *m, struct kunit *test,
> =C2=A0	xe_map_memset(xe, &tiny->vmap, 0, 0x22, xe_bo_size(tiny));
> =C2=A0	expected =3D 0;
> =C2=A0	fence =3D xe_migrate_clear(m, tiny, tiny->ttm.resource,
> -				 XE_MIGRATE_CLEAR_FLAG_FULL);
> +				 XE_MIGRATE_CLEAR_FLAG_FULL, false);
> =C2=A0	if (sanity_fence_failed(xe, fence, "Clearing small bo",
> test))
> =C2=A0		goto out;
> =C2=A0
> @@ -309,7 +309,7 @@ static void xe_migrate_sanity_test(struct
> xe_migrate *m, struct kunit *test,
> =C2=A0	xe_map_memset(xe, &big->vmap, 0, 0x11, xe_bo_size(big));
> =C2=A0	expected =3D 0;
> =C2=A0	fence =3D xe_migrate_clear(m, big, big->ttm.resource,
> -				 XE_MIGRATE_CLEAR_FLAG_FULL);
> +				 XE_MIGRATE_CLEAR_FLAG_FULL, false);
> =C2=A0	if (sanity_fence_failed(xe, fence, "Clearing big bo", test))
> =C2=A0		goto out;
> =C2=A0
> @@ -611,7 +611,7 @@ static void test_clear(struct xe_device *xe,
> struct xe_tile *tile,
> =C2=A0	kunit_info(test, "Clear vram buffer object\n");
> =C2=A0	expected =3D 0x0000000000000000;
> =C2=A0	fence =3D xe_migrate_clear(tile->migrate, vram_bo, vram_bo-
> >ttm.resource,
> -				 XE_MIGRATE_CLEAR_FLAG_FULL);
> +				 XE_MIGRATE_CLEAR_FLAG_FULL, false);
> =C2=A0	if (sanity_fence_failed(xe, fence, "Clear vram_bo", test))
> =C2=A0		return;
> =C2=A0	dma_fence_put(fence);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 42a6aa1a2e4a..e01143c0ccd7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1298,10 +1298,11 @@ static int xe_bo_move(struct
> ttm_buffer_object *ttm_bo, bool evict,
> =C2=A0		else if (handle_system_ccs)
> =C2=A0			flags |=3D XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
> =C2=A0
> -		fence =3D xe_migrate_clear(migrate, bo, new_mem,
> flags);
> +		fence =3D xe_migrate_clear(migrate, bo, new_mem,
> flags,
> +					 ctx->interruptible);
> =C2=A0	} else {
> =C2=A0		fence =3D xe_migrate_copy(migrate, bo, bo, old_mem,
> new_mem,
> -					handle_system_ccs);
> +					handle_system_ccs, ctx-
> >interruptible);
> =C2=A0	}
> =C2=A0	if (IS_ERR(fence)) {
> =C2=A0		ret =3D PTR_ERR(fence);
> @@ -1594,7 +1595,7 @@ static int xe_bo_evict_pinned_copy(struct xe_bo
> *bo, struct xe_bo *backup)
> =C2=A0			goto out_backup;
> =C2=A0
> =C2=A0		fence =3D xe_migrate_copy(migrate, bo, backup, bo-
> >ttm.resource,
> -					backup->ttm.resource,
> false);
> +					backup->ttm.resource, false,
> false);
> =C2=A0		if (IS_ERR(fence)) {
> =C2=A0			ret =3D PTR_ERR(fence);
> =C2=A0			goto out_backup;
> @@ -1744,7 +1745,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
> =C2=A0
> =C2=A0		fence =3D xe_migrate_copy(migrate, backup, bo,
> =C2=A0					backup->ttm.resource, bo-
> >ttm.resource,
> -					false);
> +					false, ctx.interruptible);
> =C2=A0		if (IS_ERR(fence)) {
> =C2=A0			ret =3D PTR_ERR(fence);
> =C2=A0			goto out_unlock_bo;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 0a47458e5bf2..c410a8e86cd9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -3019,7 +3019,8 @@ static int pf_sanitize_lmem(struct xe_tile
> *tile, struct xe_bo *bo, long timeout
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	xe_bo_lock(bo, false);
> -	fence =3D xe_migrate_clear(m, bo, bo->ttm.resource,
> XE_MIGRATE_CLEAR_FLAG_FULL);
> +	fence =3D xe_migrate_clear(m, bo, bo->ttm.resource,
> +				 XE_MIGRATE_CLEAR_FLAG_FULL, false);
> =C2=A0	if (IS_ERR(fence)) {
> =C2=A0		err =3D PTR_ERR(fence);
> =C2=A0	} else if (!fence) {
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index 1a216fb12d2b..dd326bcd12b1 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1213,7 +1213,8 @@ static struct dma_fence
> *__xe_migrate_copy(struct xe_migrate *m,
> =C2=A0					=C2=A0=C2=A0 struct ttm_resource *src,
> =C2=A0					=C2=A0=C2=A0 struct ttm_resource *dst,
> =C2=A0					=C2=A0=C2=A0 bool copy_only_ccs,
> -					=C2=A0=C2=A0 bool is_vram_resolve)
> +					=C2=A0=C2=A0 bool is_vram_resolve,
> +					=C2=A0=C2=A0 bool intr)
> =C2=A0{
> =C2=A0	struct xe_gt *gt =3D m->tile->primary_gt;
> =C2=A0	struct xe_device *xe =3D gt_to_xe(gt);
> @@ -1315,7 +1316,7 @@ static struct dma_fence
> *__xe_migrate_copy(struct xe_migrate *m,
> =C2=A0		batch_size +=3D ((copy_only_ccs) ? 0 :
> emit_copy_cmd_len(xe)) +
> =C2=A0			((needs_ccs_emit ? EMIT_COPY_CCS_DW : 0));
> =C2=A0
> -		bb =3D xe_bb_new(gt, batch_size, usm);
> +		bb =3D __xe_bb_new(gt, batch_size, usm, intr);
> =C2=A0		if (IS_ERR(bb)) {
> =C2=A0			err =3D PTR_ERR(bb);
> =C2=A0			goto err_sync;
> @@ -1409,6 +1410,7 @@ static struct dma_fence
> *__xe_migrate_copy(struct xe_migrate *m,
> =C2=A0 * @src: The source TTM resource.
> =C2=A0 * @dst: The dst TTM resource.
> =C2=A0 * @copy_only_ccs: If true copy only CCS metadata
> + * @intr: Whether to perform any wait interruptibly
> =C2=A0 *
> =C2=A0 * Copies the contents of @src to @dst: On flat CCS devices,
> =C2=A0 * the CCS metadata is copied as well if needed, or if not present,
> @@ -1423,9 +1425,10 @@ struct dma_fence *xe_migrate_copy(struct
> xe_migrate *m,
> =C2=A0				=C2=A0 struct xe_bo *dst_bo,
> =C2=A0				=C2=A0 struct ttm_resource *src,
> =C2=A0				=C2=A0 struct ttm_resource *dst,
> -				=C2=A0 bool copy_only_ccs)
> +				=C2=A0 bool copy_only_ccs,
> +				=C2=A0 bool intr)
> =C2=A0{
> -	return __xe_migrate_copy(m, src_bo, dst_bo, src, dst,
> copy_only_ccs, false);
> +	return __xe_migrate_copy(m, src_bo, dst_bo, src, dst,
> copy_only_ccs, false, intr);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -1443,7 +1446,7 @@ struct dma_fence *xe_migrate_resolve(struct
> xe_migrate *m,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_bo *bo,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource *res)
> =C2=A0{
> -	return __xe_migrate_copy(m, bo, bo, res, res, false, true);
> +	return __xe_migrate_copy(m, bo, bo, res, res, false, true,
> true);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -1913,6 +1916,7 @@ static void emit_clear(struct xe_gt *gt, struct
> xe_bb *bb, u64 src_ofs,
> =C2=A0 * @bo: The buffer object @dst is currently bound to.
> =C2=A0 * @dst: The dst TTM resource to be cleared.
> =C2=A0 * @clear_flags: flags to specify which data to clear: CCS, BO, or
> both.
> + * @intr: Whether to perform any wait interruptibly.
> =C2=A0 *
> =C2=A0 * Clear the contents of @dst to zero when
> XE_MIGRATE_CLEAR_FLAG_BO_DATA is set.
> =C2=A0 * On flat CCS devices, the CCS metadata is cleared to zero with
> XE_MIGRATE_CLEAR_FLAG_CCS_DATA.
> @@ -1926,7 +1930,8 @@ static void emit_clear(struct xe_gt *gt, struct
> xe_bb *bb, u64 src_ofs,
> =C2=A0struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> =C2=A0				=C2=A0=C2=A0 struct xe_bo *bo,
> =C2=A0				=C2=A0=C2=A0 struct ttm_resource *dst,
> -				=C2=A0=C2=A0 u32 clear_flags)
> +				=C2=A0=C2=A0 u32 clear_flags,
> +				=C2=A0=C2=A0 bool intr)
> =C2=A0{
> =C2=A0	bool clear_vram =3D mem_type_is_vram(dst->mem_type);
> =C2=A0	bool clear_bo_data =3D XE_MIGRATE_CLEAR_FLAG_BO_DATA &
> clear_flags;
> @@ -1987,7 +1992,7 @@ struct dma_fence *xe_migrate_clear(struct
> xe_migrate *m,
> =C2=A0		if (WARN_ON_ONCE(!clear_L0))
> =C2=A0			break;
> =C2=A0
> -		bb =3D xe_bb_new(gt, batch_size, usm);
> +		bb =3D __xe_bb_new(gt, batch_size, usm, intr);
> =C2=A0		if (IS_ERR(bb)) {
> =C2=A0			err =3D PTR_ERR(bb);
> =C2=A0			goto err_sync;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> b/drivers/gpu/drm/xe/xe_migrate.h
> index 2e8be10fdb71..30fb236ea520 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -54,7 +54,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate
> *m,
> =C2=A0				=C2=A0 struct xe_bo *dst_bo,
> =C2=A0				=C2=A0 struct ttm_resource *src,
> =C2=A0				=C2=A0 struct ttm_resource *dst,
> -				=C2=A0 bool copy_only_ccs);
> +				=C2=A0 bool copy_only_ccs,
> +				=C2=A0 bool intr);
> =C2=A0
> =C2=A0struct dma_fence *xe_migrate_resolve(struct xe_migrate *m,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_bo *bo,
> @@ -85,7 +86,8 @@ int xe_migrate_access_memory(struct xe_migrate *m,
> struct xe_bo *bo,
> =C2=A0struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> =C2=A0				=C2=A0=C2=A0 struct xe_bo *bo,
> =C2=A0				=C2=A0=C2=A0 struct ttm_resource *dst,
> -				=C2=A0=C2=A0 u32 clear_flags);
> +				=C2=A0=C2=A0 u32 clear_flags,
> +				=C2=A0=C2=A0 bool intr);
> =C2=A0
> =C2=A0struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_vram.c
> b/drivers/gpu/drm/xe/xe_vram.c
> index 1c02889ba29b..946970236208 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -526,7 +526,7 @@ int xe_vram_memtest(struct xe_device *xe)
> =C2=A0		xe_bo_lock(last_page_bo, false);
> =C2=A0		fence =3D xe_migrate_clear(tile->migrate,
> last_page_bo,
> =C2=A0					 last_page_bo->ttm.resource,
> -				=09
> XE_MIGRATE_CLEAR_FLAG_BO_DATA);
> +				=09
> XE_MIGRATE_CLEAR_FLAG_BO_DATA, false);
> =C2=A0		xe_bo_unlock(last_page_bo);
> =C2=A0
> =C2=A0		if (!IS_ERR(fence)) {
