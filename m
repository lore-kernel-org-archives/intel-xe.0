Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5750C606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 12:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KEat+ZmV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC3810E56C;
	Fri, 27 Nov 2026 12:34:05 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0B110E56C
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 12:33:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 104EA62A23;
 Fri, 27 Nov 2026 12:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A77C1F00897;
 Fri, 27 Nov 2026 12:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795782837;
 bh=6wMgjl7V+XJqO1k1m2r7lK3iqRbeAffXJ21zbcDtDjU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=KEat+ZmVP1BEvCO4X2DkLQtm+Ni82CejoF8JWAuwWzIUJMruDyFMF8JhhsXcBbf3R
 9ujJ/I/xoZqbtsKAlKZ0ZZ0G1LaDIHq1+LHVmyCU0kx37sPc495hG9SgPkWIHh316b
 U26WLc3nFhwb8fKybZlu3gNqhSRcVQkQdUpFFfIhQ5Rq/JQpiConDJLqQkcKoDdAg6
 ut7sO8/lxxgRweJX6yJxOJoaMPS2mjv6ndyLqFyENd4Husbv4i0x9mwREouXK6DVzD
 l60DHKsVOtfNDzrj8/hBzp6mlH4C+1V0wPxMSxiHBsmVgcTfa1+z9/vF27AaR8s9fR
 NPAB0cm9UpqqQ==
Message-ID: <sashiko-outbox-237412@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] drm/xe/bb: drop per-batch prefetch padding
To: "Matthew Auld" <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261127-migrate-bb-optimise-v2-5-808d0d520ddb@intel.com>
References: <20261127-migrate-bb-optimise-v2-0-808d0d520ddb@intel.com>
 <20261127-migrate-bb-optimise-v2-5-808d0d520ddb@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 12:33:57 +0000
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/xe: batch size underestimation in pte_update_cmd_size()
  for non-4K pages
--

commit 8de4bf033cf5665a8ffaac384549e82ba2ea902c
Author: Matthew Auld <matthew.auld@intel.com>

drm/xe/bb: drop per-batch prefetch padding

This commit drops the per-batch bb_prefetch() padding from __xe_bb_new(),
relying on the 4K guard region at the end of the suballocation pool BO to
cover hardware CS prefetch.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9644

> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 6308a1dca4647..bcb3a56995a6f 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -14,20 +14,6 @@
>  #include "xe_sched_job.h"
>  #include "xe_vm_types.h"
> =20
> -static int bb_prefetch(struct xe_gt *gt)
> -{
> -	struct xe_device *xe =3D gt_to_xe(gt);
> -
> -	if (GRAPHICS_VERx100(xe) >=3D 1250 && xe_gt_is_main_type(gt))
> -		/*
> -		 * RCS and CCS require 1K, although other engines would be
> -		 * okay with 512.
> -		 */
> -		return SZ_1K;
> -	else
> -		return SZ_512;
> -}
> -
>  struct xe_bb *__xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm, bool i=
ntr)
>  {
>  	struct xe_tile *tile =3D gt_to_tile(gt);
> @@ -38,13 +24,13 @@ struct xe_bb *__xe_bb_new(struct xe_gt *gt, u32 dword=
s, bool usm, bool intr)
>  		return ERR_PTR(-ENOMEM);
> =20
>  	/*
> -	 * We need to allocate space for the requested number of dwords,
> -	 * one additional MI_BATCH_BUFFER_END dword, and additional buffer
> -	 * space to accommodate the platform-specific hardware prefetch
> -	 * requirements.
> +	 * We need to allocate space for the requested number of dwords and
> +	 * one additional MI_BATCH_BUFFER_END dword. Hardware CS prefetch
> +	 * at the end of the pool BO is covered by the SZ_4K guard region
> +	 * reserved by xe_sa_bo_manager_init().
>  	 */
>  	bb->bo =3D xe_sa_bo_new(!usm ? tile->mem.kernel_bb_pool : gt->usm.bb_po=
ol,
> -			      4 * (dwords + 1) + bb_prefetch(gt), intr);
> +			      4 * (dwords + 1), intr);
>  	if (IS_ERR(bb->bo)) {
>  		err =3D PTR_ERR(bb->bo);
>  		goto err;
> @@ -129,7 +115,7 @@ __xe_bb_create_job(struct xe_exec_queue *q, struct xe=
_bb *bb, u64 *addr)
>  	if (bb->len =3D=3D 0 || bb->cs[bb->len - 1] !=3D MI_BATCH_BUFFER_END)
>  		bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
> =20
> -	xe_gt_assert(q->gt, bb->len * 4 + bb_prefetch(q->gt) <=3D size);
> +	xe_gt_assert(q->gt, bb->len * 4 <=3D size);
> =20
>  	xe_sa_bo_flush_write(bb->bo);

[Severity: Medium]
Without the trailing bb_prefetch() padding, can build_pt_update_batch_sram()
overflow bb->bo when PAGE_SIZE > 4K?

pte_update_cmd_size() sizes the batch assuming each MI_STORE_DATA_IMM
command writes up to MAX_PTE_PER_SDI (510) entries, whereas
build_pt_update_batch_sram() rounds level-0 chunks down to a multiple of
PAGE_SIZE / XE_PAGE_SIZE (496 entries on 64K pages, 508 on 16K pages):

drivers/gpu/drm/xe/xe_migrate.c:pte_update_cmd_size() {
    ...
	num_dword =3D (1 + 2) * DIV_U64_ROUND_UP(entries, MAX_PTE_PER_SDI);
	num_dword +=3D entries * 2;
    ...
}

drivers/gpu/drm/xe/xe_migrate.c:build_pt_update_batch_sram() {
    ...
	while (ptes) {
		u32 chunk =3D min(MAX_PTE_PER_SDI, ptes);

		if (!level)
			chunk =3D ALIGN_DOWN(chunk, PAGE_SIZE / XE_PAGE_SIZE);

		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
    ...
}

When the smaller chunk size requires an extra 3-dword MI_STORE_DATA_IMM
header (for example, migrating 63 64K pages =3D 1008 4K PTEs emits 3 headers
instead of 2), bb->cs writes 12 bytes past the end of bb->bo, triggering
the xe_gt_assert() in __xe_bb_create_job() and truncating the last 3
dwords of the batch when xe_sa_bo_flush_write() copies drm_suballoc_size()
bytes to VRAM.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-migrate-bb=
-optimise-v2-0-808d0d520ddb@intel.com?part=3D5
