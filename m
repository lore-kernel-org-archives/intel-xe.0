Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7488FCE06A
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 12:43:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C90910E91D;
	Thu, 26 Feb 2026 12:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqx0b0Gf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975E110E91D
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 12:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772109828; x=1803645828;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=r4zib0TL3AyPMEAL5P/XJNhX43TnOlieL/e+VbM4V/c=;
 b=gqx0b0GfaY9srLQT0XWBZme0qnQ6jE683fI62EANkd1rRy+6lqLsBJ/k
 w2szBAU5Z5W0OanSQTdFYo/zI8i8ZhKH8CXx8AYP0C/cChpyCMEf6dXiT
 ussSH7J4m7IkPtGRtNC9O/oNH4hQKe0ja0ZDBhh8G28oA5ItSz0YNVaVL
 eVsHh76+xfRxmxLEzBxL6+NbpWteIKUG2lsVEdBZgxjN9zkSRgbDWvKlV
 Ij+I3MX0nz6yNxjRK4GoVDPmktkVy5gWvC74NOOa3udx69PqzVC1nK8FH
 L3WhJoW0H4LvWgVRQV7pJV5weIiWV7GQV48sQK5IgHcgJ46XePKDq+u/V A==;
X-CSE-ConnectionGUID: TMlooi4bSjaTJvB1f7xqbA==
X-CSE-MsgGUID: Pdl1fy33SkGgwaMn98lUPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="75770548"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="75770548"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:43:47 -0800
X-CSE-ConnectionGUID: +7DQvHESTW2r5DFXZtsNnw==
X-CSE-MsgGUID: cKP82drzQGqTY/YbPqqrZQ==
X-ExtLoop1: 1
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.215])
 ([10.245.244.215])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:43:45 -0800
Message-ID: <bf67f6971cacc71313cc92de8b0e99212106344c.camel@linux.intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe: Move LRC seqno to system memory to avoid
 slow dGPU reads
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, francois.dugast@intel.com, 
 daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com
Date: Thu, 26 Feb 2026 13:43:43 +0100
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
> +	if (IS_ERR(seqno_bo)) {
> +		err =3D PTR_ERR(lrc->bo);

Claude found the above. Should be PTR_ERR(seqno_bo).

/Thomas


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
