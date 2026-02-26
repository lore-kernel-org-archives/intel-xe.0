Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05B9FCE064
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 12:25:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9328210E915;
	Thu, 26 Feb 2026 12:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0NFT0hG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AF810E915
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 12:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772108723; x=1803644723;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=tr9owkmY7MtLgWggIIPysmjTQpUhLSzrLLkTJnNZ/oY=;
 b=f0NFT0hGsOqtbf9lD3HqIgCvgGRDLsNfEYPU+twk/XpHT3BTLt6XlOmY
 W464tAyeNA+MhBcsWsVnUU0q3kj5QgjHEERffoeNATAQJM4Ui2yV8dlnu
 8Q34jPm0BpKhMJvlAqsLzy+H4H+elG09I2OHckg31ZOogy/fQJn7EWfvp
 JShXt9ODC2i1EgRLbPYxMOoWvaq/60jq9byFAkz6z0li5dLlnWAq2aE6E
 1KYuinJkfHiCYKphLKm3GrYJPmc++6sukmUWJk8eOJx/nFmXiStSEfF5R
 rAf0SsbwgJBJWCJpYXPe01moAX9rZ+M/SpZDUe2Y2awW5b3HJWC6UOf+H g==;
X-CSE-ConnectionGUID: eHuzQZ2ARrm+9OdqpYIcag==
X-CSE-MsgGUID: 5twxoEL/T7G3FYNhnpLmjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="77003311"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="77003311"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:25:23 -0800
X-CSE-ConnectionGUID: 4h5Pr9ErQ2aDr7Dw1ipTmw==
X-CSE-MsgGUID: LIdnBAlYTnGyLIAkAYP55Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="216457666"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.215])
 ([10.245.244.215])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:25:22 -0800
Message-ID: <95ad0e5b8ed775c2a8948a09ebab75c7acfd1a74.camel@linux.intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe: Move LRC seqno to system memory to avoid
 slow dGPU reads
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, francois.dugast@intel.com, 
 daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com
Date: Thu, 26 Feb 2026 13:25:19 +0100
In-Reply-To: <20260218043319.809548-4-matthew.brost@intel.com>
References: <20260218043319.809548-1-matthew.brost@intel.com>
 <20260218043319.809548-4-matthew.brost@intel.com>
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

On Tue, 2026-02-17 at 20:33 -0800, Matthew Brost wrote:
> The LRC seqno is read by the CPU in the fence signaling path. On dGPU
> that read can turn into a PCIe transaction when the seqno lives in
> the
> main LRC BO, making the hot-path poll/peek much more expensive.
>=20
> Allocate a small dedicated seqno BO in system memory and map the
> seqno
> and start_seqno fields from there instead. The GPU still updates the
> values, but CPU reads stay in cached system memory and avoid PCIe
> read
> latency.
>=20
> Update the LRC map/address helpers to accept a BO expression and use
> the
> new lrc->seqno_bo for seqno mappings. Unpin/unmap seqno_bo during
> teardown.

I remember this was discussed also when enabling discrete for the i915
driver but we didn't have any timing information at that time.

Whether this is a good thing depends on the amount of cpu polling per
seqno bump, but I figure that's typically always at least one CPU read,
right?

>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_lrc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5=
7 +++++++++++++++++++----------
> --
> =C2=A0drivers/gpu/drm/xe/xe_lrc_types.h |=C2=A0 6 ++++
> =C2=A02 files changed, 42 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c
> b/drivers/gpu/drm/xe/xe_lrc.c
> index 38f648b98868..d72146313424 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -715,12 +715,13 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
> =C2=A0#define __xe_lrc_pphwsp_offset xe_lrc_pphwsp_offset
> =C2=A0#define __xe_lrc_regs_offset xe_lrc_regs_offset
> =C2=A0
> -#define LRC_SEQNO_PPHWSP_OFFSET 512
> -#define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
> -#define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET
> + 8)
> +#define LRC_CTX_JOB_TIMESTAMP_OFFSET 512
> =C2=A0#define LRC_ENGINE_ID_PPHWSP_OFFSET 1024
> =C2=A0#define LRC_PARALLEL_PPHWSP_OFFSET 2048
> =C2=A0
> +#define LRC_SEQNO_OFFSET 0
> +#define LRC_START_SEQNO_OFFSET (LRC_SEQNO_OFFSET + 8)
> +
> =C2=A0u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
> =C2=A0{
> =C2=A0	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
> @@ -747,14 +748,12 @@ size_t xe_lrc_skip_size(struct xe_device *xe)
> =C2=A0
> =C2=A0static inline u32 __xe_lrc_seqno_offset(struct xe_lrc *lrc)
> =C2=A0{
> -	/* The seqno is stored in the driver-defined portion of
> PPHWSP */
> -	return xe_lrc_pphwsp_offset(lrc) + LRC_SEQNO_PPHWSP_OFFSET;
> +	return LRC_SEQNO_OFFSET;
> =C2=A0}
> =C2=A0
> =C2=A0static inline u32 __xe_lrc_start_seqno_offset(struct xe_lrc *lrc)
> =C2=A0{
> -	/* The start seqno is stored in the driver-defined portion
> of PPHWSP */
> -	return xe_lrc_pphwsp_offset(lrc) +
> LRC_START_SEQNO_PPHWSP_OFFSET;
> +	return LRC_START_SEQNO_OFFSET;
> =C2=A0}
> =C2=A0
> =C2=A0static u32 __xe_lrc_ctx_job_timestamp_offset(struct xe_lrc *lrc)
> @@ -805,10 +804,11 @@ static inline u32 __xe_lrc_wa_bb_offset(struct
> xe_lrc *lrc)
> =C2=A0	return xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE;
> =C2=A0}
> =C2=A0
> -#define DECL_MAP_ADDR_HELPERS(elem) \
> +#define DECL_MAP_ADDR_HELPERS(elem, bo_expr) \
> =C2=A0static inline struct iosys_map __xe_lrc_##elem##_map(struct xe_lrc
> *lrc) \
> =C2=A0{ \
> -	struct iosys_map map =3D lrc->bo->vmap; \
> +	struct xe_bo *bo =3D (bo_expr); \
> +	struct iosys_map map =3D bo->vmap; \
> =C2=A0\
> =C2=A0	xe_assert(lrc_to_xe(lrc), !iosys_map_is_null(&map));=C2=A0 \
> =C2=A0	iosys_map_incr(&map, __xe_lrc_##elem##_offset(lrc)); \
> @@ -816,20 +816,22 @@ static inline struct iosys_map
> __xe_lrc_##elem##_map(struct xe_lrc *lrc) \
> =C2=A0} \
> =C2=A0static inline u32 __maybe_unused __xe_lrc_##elem##_ggtt_addr(struct
> xe_lrc *lrc) \
> =C2=A0{ \
> -	return xe_bo_ggtt_addr(lrc->bo) +
> __xe_lrc_##elem##_offset(lrc); \
> +	struct xe_bo *bo =3D (bo_expr); \
> +\
> +	return xe_bo_ggtt_addr(bo) + __xe_lrc_##elem##_offset(lrc);
> \
> =C2=A0} \
> =C2=A0
> -DECL_MAP_ADDR_HELPERS(ring)
> -DECL_MAP_ADDR_HELPERS(pphwsp)
> -DECL_MAP_ADDR_HELPERS(seqno)
> -DECL_MAP_ADDR_HELPERS(regs)
> -DECL_MAP_ADDR_HELPERS(start_seqno)
> -DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
> -DECL_MAP_ADDR_HELPERS(ctx_timestamp)
> -DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw)
> -DECL_MAP_ADDR_HELPERS(parallel)
> -DECL_MAP_ADDR_HELPERS(indirect_ring)
> -DECL_MAP_ADDR_HELPERS(engine_id)
> +DECL_MAP_ADDR_HELPERS(ring, lrc->bo)
> +DECL_MAP_ADDR_HELPERS(pphwsp, lrc->bo)
> +DECL_MAP_ADDR_HELPERS(seqno, lrc->seqno_bo)
> +DECL_MAP_ADDR_HELPERS(regs, lrc->bo)
> +DECL_MAP_ADDR_HELPERS(start_seqno, lrc->seqno_bo)
> +DECL_MAP_ADDR_HELPERS(ctx_job_timestamp, lrc->bo)
> +DECL_MAP_ADDR_HELPERS(ctx_timestamp, lrc->bo)
> +DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
> +DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
> +DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
> +DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
> =C2=A0
> =C2=A0#undef DECL_MAP_ADDR_HELPERS
> =C2=A0
> @@ -1036,6 +1038,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
> =C2=A0{
> =C2=A0	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
> =C2=A0	xe_bo_unpin_map_no_vm(lrc->bo);
> +	xe_bo_unpin_map_no_vm(lrc->seqno_bo);
> =C2=A0}
> =C2=A0
> =C2=A0/*
> @@ -1445,6 +1448,7 @@ static int xe_lrc_init(struct xe_lrc *lrc,
> struct xe_hw_engine *hwe,
> =C2=A0	u32 bo_size =3D ring_size + lrc_size + LRC_WA_BB_SIZE;
> =C2=A0	struct xe_tile *tile =3D gt_to_tile(gt);
> =C2=A0	struct xe_device *xe =3D gt_to_xe(gt);
> +	struct xe_bo *seqno_bo;
> =C2=A0	struct iosys_map map;
> =C2=A0	u32 arb_enable;
> =C2=A0	u32 bo_flags;
> @@ -1479,6 +1483,17 @@ static int xe_lrc_init(struct xe_lrc *lrc,
> struct xe_hw_engine *hwe,
> =C2=A0	if (IS_ERR(lrc->bo))
> =C2=A0		return PTR_ERR(lrc->bo);
> =C2=A0
> +	seqno_bo =3D xe_bo_create_pin_map_novm(xe, tile, PAGE_SIZE,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_type_kernel,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_GGTT |
> +					=C2=A0=C2=A0=C2=A0=C2=A0
> XE_BO_FLAG_GGTT_INVALIDATE |
> +					=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_SYSTEM,
> false);

XE_BO_FLAG_PINNED_NORESTORE?

Thanks,
Thomas


> +	if (IS_ERR(seqno_bo)) {
> +		err =3D PTR_ERR(lrc->bo);
> +		goto err_lrc_finish;
> +	}
> +	lrc->seqno_bo =3D seqno_bo;
> +
> =C2=A0	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 hwe->fence_irq, hwe->name);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h
> b/drivers/gpu/drm/xe/xe_lrc_types.h
> index a4373d280c39..5a718f759ed6 100644
> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> @@ -22,6 +22,12 @@ struct xe_lrc {
> =C2=A0	 */
> =C2=A0	struct xe_bo *bo;
> =C2=A0
> +	/**
> +	 * @seqno_bo: Buffer object (memory) for seqno numbers.
> Always in system
> +	 * memory as this a CPU read, GPU write path object.
> +	 */
> +	struct xe_bo *seqno_bo;
> +
> =C2=A0	/** @size: size of the lrc and optional indirect ring state
> */
> =C2=A0	u32 size;
> =C2=A0
