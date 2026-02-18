Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0847E9A04C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 04:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0826810E551;
	Wed, 18 Feb 2026 04:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQCaW9M/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D11110E551
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 04:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771389208; x=1802925208;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8hCl7GNUepOBFYNJ/KZTJDNEhr9FOs95/0GBQ6U7c/Q=;
 b=eQCaW9M/0gRylQ0/Jwx1HSjxxRz/sEH8JSp83V/Ya5wqjJDpyeWkp9FD
 Euvz1I9DrQccWGbX4yBWJgiayVntq4Lqv/pAUS0TqmlDuvscOWQ+dfFLi
 IIiX9BJO4eZgn1dESRbcCOTCCnT3/yVqiNnGKJCf5q/kYc4m1Avsc4wtv
 VGzxbHyYj6JDYNBYJ/NHfqsZgjcjbc+Qr2HP1R9Ws8qCepVlErVtv6mBi
 XIxl1SHocXPrZcxWvvnywwx8b+yNYMe8DPfS5RZ8rNC4CfRsixPnRPkb1
 7gJAzi6RapPKaagYEiQYFX36uNsLiMLcZTvTSmFIj0pC04XqLTIP4Niwe A==;
X-CSE-ConnectionGUID: D1CwXoKCRMGRSi7RWGCeEQ==
X-CSE-MsgGUID: zKMx9eodR/2GIP2BzS5E7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="76303543"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="76303543"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 20:33:27 -0800
X-CSE-ConnectionGUID: q0Jv529LTUCnPBBMi9PEXw==
X-CSE-MsgGUID: 8dNb6YxSTmmDzMMRLNujFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="237095381"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 20:33:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, francois.dugast@intel.com,
 daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v3 3/3] drm/xe: Move LRC seqno to system memory to avoid slow
 dGPU reads
Date: Tue, 17 Feb 2026 20:33:19 -0800
Message-Id: <20260218043319.809548-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218043319.809548-1-matthew.brost@intel.com>
References: <20260218043319.809548-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The LRC seqno is read by the CPU in the fence signaling path. On dGPU
that read can turn into a PCIe transaction when the seqno lives in the
main LRC BO, making the hot-path poll/peek much more expensive.

Allocate a small dedicated seqno BO in system memory and map the seqno
and start_seqno fields from there instead. The GPU still updates the
values, but CPU reads stay in cached system memory and avoid PCIe read
latency.

Update the LRC map/address helpers to accept a BO expression and use the
new lrc->seqno_bo for seqno mappings. Unpin/unmap seqno_bo during
teardown.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c       | 57 +++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_lrc_types.h |  6 ++++
 2 files changed, 42 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 38f648b98868..d72146313424 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -715,12 +715,13 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
 #define __xe_lrc_pphwsp_offset xe_lrc_pphwsp_offset
 #define __xe_lrc_regs_offset xe_lrc_regs_offset
 
-#define LRC_SEQNO_PPHWSP_OFFSET 512
-#define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
-#define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
+#define LRC_CTX_JOB_TIMESTAMP_OFFSET 512
 #define LRC_ENGINE_ID_PPHWSP_OFFSET 1024
 #define LRC_PARALLEL_PPHWSP_OFFSET 2048
 
+#define LRC_SEQNO_OFFSET 0
+#define LRC_START_SEQNO_OFFSET (LRC_SEQNO_OFFSET + 8)
+
 u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
 {
 	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
@@ -747,14 +748,12 @@ size_t xe_lrc_skip_size(struct xe_device *xe)
 
 static inline u32 __xe_lrc_seqno_offset(struct xe_lrc *lrc)
 {
-	/* The seqno is stored in the driver-defined portion of PPHWSP */
-	return xe_lrc_pphwsp_offset(lrc) + LRC_SEQNO_PPHWSP_OFFSET;
+	return LRC_SEQNO_OFFSET;
 }
 
 static inline u32 __xe_lrc_start_seqno_offset(struct xe_lrc *lrc)
 {
-	/* The start seqno is stored in the driver-defined portion of PPHWSP */
-	return xe_lrc_pphwsp_offset(lrc) + LRC_START_SEQNO_PPHWSP_OFFSET;
+	return LRC_START_SEQNO_OFFSET;
 }
 
 static u32 __xe_lrc_ctx_job_timestamp_offset(struct xe_lrc *lrc)
@@ -805,10 +804,11 @@ static inline u32 __xe_lrc_wa_bb_offset(struct xe_lrc *lrc)
 	return xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE;
 }
 
-#define DECL_MAP_ADDR_HELPERS(elem) \
+#define DECL_MAP_ADDR_HELPERS(elem, bo_expr) \
 static inline struct iosys_map __xe_lrc_##elem##_map(struct xe_lrc *lrc) \
 { \
-	struct iosys_map map = lrc->bo->vmap; \
+	struct xe_bo *bo = (bo_expr); \
+	struct iosys_map map = bo->vmap; \
 \
 	xe_assert(lrc_to_xe(lrc), !iosys_map_is_null(&map));  \
 	iosys_map_incr(&map, __xe_lrc_##elem##_offset(lrc)); \
@@ -816,20 +816,22 @@ static inline struct iosys_map __xe_lrc_##elem##_map(struct xe_lrc *lrc) \
 } \
 static inline u32 __maybe_unused __xe_lrc_##elem##_ggtt_addr(struct xe_lrc *lrc) \
 { \
-	return xe_bo_ggtt_addr(lrc->bo) + __xe_lrc_##elem##_offset(lrc); \
+	struct xe_bo *bo = (bo_expr); \
+\
+	return xe_bo_ggtt_addr(bo) + __xe_lrc_##elem##_offset(lrc); \
 } \
 
-DECL_MAP_ADDR_HELPERS(ring)
-DECL_MAP_ADDR_HELPERS(pphwsp)
-DECL_MAP_ADDR_HELPERS(seqno)
-DECL_MAP_ADDR_HELPERS(regs)
-DECL_MAP_ADDR_HELPERS(start_seqno)
-DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
-DECL_MAP_ADDR_HELPERS(ctx_timestamp)
-DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw)
-DECL_MAP_ADDR_HELPERS(parallel)
-DECL_MAP_ADDR_HELPERS(indirect_ring)
-DECL_MAP_ADDR_HELPERS(engine_id)
+DECL_MAP_ADDR_HELPERS(ring, lrc->bo)
+DECL_MAP_ADDR_HELPERS(pphwsp, lrc->bo)
+DECL_MAP_ADDR_HELPERS(seqno, lrc->seqno_bo)
+DECL_MAP_ADDR_HELPERS(regs, lrc->bo)
+DECL_MAP_ADDR_HELPERS(start_seqno, lrc->seqno_bo)
+DECL_MAP_ADDR_HELPERS(ctx_job_timestamp, lrc->bo)
+DECL_MAP_ADDR_HELPERS(ctx_timestamp, lrc->bo)
+DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
+DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
+DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
+DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
 
 #undef DECL_MAP_ADDR_HELPERS
 
@@ -1036,6 +1038,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 {
 	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
 	xe_bo_unpin_map_no_vm(lrc->bo);
+	xe_bo_unpin_map_no_vm(lrc->seqno_bo);
 }
 
 /*
@@ -1445,6 +1448,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_bo *seqno_bo;
 	struct iosys_map map;
 	u32 arb_enable;
 	u32 bo_flags;
@@ -1479,6 +1483,17 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (IS_ERR(lrc->bo))
 		return PTR_ERR(lrc->bo);
 
+	seqno_bo = xe_bo_create_pin_map_novm(xe, tile, PAGE_SIZE,
+					     ttm_bo_type_kernel,
+					     XE_BO_FLAG_GGTT |
+					     XE_BO_FLAG_GGTT_INVALIDATE |
+					     XE_BO_FLAG_SYSTEM, false);
+	if (IS_ERR(seqno_bo)) {
+		err = PTR_ERR(lrc->bo);
+		goto err_lrc_finish;
+	}
+	lrc->seqno_bo = seqno_bo;
+
 	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
 			     hwe->fence_irq, hwe->name);
 
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index a4373d280c39..5a718f759ed6 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -22,6 +22,12 @@ struct xe_lrc {
 	 */
 	struct xe_bo *bo;
 
+	/**
+	 * @seqno_bo: Buffer object (memory) for seqno numbers. Always in system
+	 * memory as this a CPU read, GPU write path object.
+	 */
+	struct xe_bo *seqno_bo;
+
 	/** @size: size of the lrc and optional indirect ring state */
 	u32 size;
 
-- 
2.34.1

