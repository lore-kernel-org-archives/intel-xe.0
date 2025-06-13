Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDABC71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 15:36:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF81010EA14;
	Fri, 13 Jun 2025 15:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Uqh4n4O/";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7F910EA1C
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 15:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8bKz91olAoG7lap9+yVW1GU+is/0ozi5TIByANGXjTA=; b=Uqh4n4O/r0HKu2Dga95olI811V
 060D2FaqG2QF+/DuEVaNR7w2/TA9qcjrkbNn5LHpZWZevnaa4ewbnEHyik3VHjly7PtILlBydu/3a
 UhRIDTqGQ/otk6g7MBGIICLhqNH/VO68vuaVE8yV+sXDGwAVA2/+jnMMUZBFI+R3V8TYfTQ3ewq2E
 46Nf+DRz4feJ5ZCbkfpR71NR+1/dR6c/H0npqzJSdx/uPS0/DBlMT2WxBZps0ayuRHqpGxtSngOaC
 71cAlnns7SolN72i8isnKL0w0xS3576Jytofm8rOKnTcyX6DlcHirJDfODtg6lec5NZDB8PgMVFuG
 /4Nr6stg==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uQ6Rl-0034p2-D0; Fri, 13 Jun 2025 17:36:01 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 1/7] drm/xe: Consolidate LRC offset calculations
Date: Fri, 13 Jun 2025 16:35:52 +0100
Message-ID: <20250613153558.68350-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250613153558.68350-1-tvrtko.ursulin@igalia.com>
References: <20250613153558.68350-1-tvrtko.ursulin@igalia.com>
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

Attempt to consolidate the LRC offsets calculations by alignning the
recently added wa_bb_offset with the naming scheme in the file and
also change the size stored in struct xe_lrc to not include the ring
buffer.

The former makes it somewhat visually easier to follow the layout of the
various logical blocks stored in the LRC bo, while the latter reduces the
number of sprinkled around calculations.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Matthew Brost <matthew.brost@intel.com
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c       | 41 ++++++++++++++-----------------
 drivers/gpu/drm/xe/xe_lrc_types.h |  2 +-
 2 files changed, 19 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index a875b93697a5..afe1e2844218 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -717,8 +717,12 @@ static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
 
 static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
 {
-	/* Indirect ring state page is at the very end of LRC */
-	return lrc->size - LRC_INDIRECT_RING_STATE_SIZE;
+	return lrc->bo->size - LRC_WA_BB_SIZE - LRC_INDIRECT_RING_STATE_SIZE;
+}
+
+static inline u32 __xe_lrc_wa_bb_offset(struct xe_lrc *lrc)
+{
+	return lrc->bo->size - LRC_WA_BB_SIZE;
 }
 
 #define DECL_MAP_ADDR_HELPERS(elem) \
@@ -973,11 +977,6 @@ struct wa_bb_setup {
 			 u32 *batch, size_t max_size);
 };
 
-static size_t wa_bb_offset(struct xe_lrc *lrc)
-{
-	return lrc->bo->size - LRC_WA_BB_SIZE;
-}
-
 static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 {
 	const size_t max_size = LRC_WA_BB_SIZE;
@@ -993,7 +992,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 			return -ENOMEM;
 		cmd = buf;
 	} else {
-		cmd = lrc->bo->vmap.vaddr + wa_bb_offset(lrc);
+		cmd = lrc->bo->vmap.vaddr + __xe_lrc_wa_bb_offset(lrc);
 	}
 
 	remain = max_size / sizeof(*cmd);
@@ -1017,13 +1016,13 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 
 	if (buf) {
 		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap,
-				 wa_bb_offset(lrc), buf,
+				 __xe_lrc_wa_bb_offset(lrc), buf,
 				 (cmd - buf) * sizeof(*cmd));
 		kfree(buf);
 	}
 
 	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR, xe_bo_ggtt_addr(lrc->bo) +
-			     wa_bb_offset(lrc) + 1);
+			     __xe_lrc_wa_bb_offset(lrc) + 1);
 
 	return 0;
 
@@ -1040,19 +1039,22 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		       u32 init_flags)
 {
 	struct xe_gt *gt = hwe->gt;
+	const u32 lrc_size = xe_gt_lrc_size(gt, hwe->class);
+	const u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct iosys_map map;
 	void *init_data = NULL;
 	u32 arb_enable;
-	u32 lrc_size;
 	u32 bo_flags;
 	int err;
 
 	kref_init(&lrc->refcount);
 	lrc->gt = gt;
+	lrc->size = lrc_size;
 	lrc->flags = 0;
-	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
+	lrc->ring.size = ring_size;
+	lrc->ring.tail = 0;
 	if (xe_gt_has_indirect_ring_state(gt))
 		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
 
@@ -1065,17 +1067,12 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
 	 * via VM bind calls.
 	 */
-	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL,
-				       lrc_size + LRC_WA_BB_SIZE,
+	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, bo_size,
 				       ttm_bo_type_kernel,
 				       bo_flags);
 	if (IS_ERR(lrc->bo))
 		return PTR_ERR(lrc->bo);
 
-	lrc->size = lrc_size;
-	lrc->ring.size = ring_size;
-	lrc->ring.tail = 0;
-
 	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
 			     hwe->fence_irq, hwe->name);
 
@@ -1096,10 +1093,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
 		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
 				 gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
-				 xe_gt_lrc_size(gt, hwe->class) - LRC_PPHWSP_SIZE);
+				 lrc_size - LRC_PPHWSP_SIZE);
 	} else {
-		xe_map_memcpy_to(xe, &map, 0, init_data,
-				 xe_gt_lrc_size(gt, hwe->class));
+		xe_map_memcpy_to(xe, &map, 0, init_data, lrc_size);
 		kfree(init_data);
 	}
 
@@ -1859,8 +1855,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	snapshot->seqno = xe_lrc_seqno(lrc);
 	snapshot->lrc_bo = xe_bo_get(lrc->bo);
 	snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
-	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset -
-		LRC_WA_BB_SIZE;
+	snapshot->lrc_size = lrc->size;
 	snapshot->lrc_snapshot = NULL;
 	snapshot->ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(lrc));
 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index 883e550a9423..2c7c81079801 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -22,7 +22,7 @@ struct xe_lrc {
 	 */
 	struct xe_bo *bo;
 
-	/** @size: size of lrc including any indirect ring state page */
+	/** @size: size of the lrc and optional indirect ring state */
 	u32 size;
 
 	/** @gt: gt which this LRC belongs to */
-- 
2.48.0

