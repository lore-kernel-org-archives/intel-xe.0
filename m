Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65163C71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 03:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F117A10E108;
	Thu, 12 Jun 2025 03:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ASYfYLXI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884B910E108
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 03:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749698273; x=1781234273;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9hMLz3LS3PXrV/h0YwO60woNaBYa361IhV3smO7/8VU=;
 b=ASYfYLXIwDCEPP9rD+jZiiNvgX/YXvXujFCupVuvI0JVo+Bt7Cr2SL3z
 a504ieVKhtxytn+OZUJw8LQ5NpbS25arrbSGGpae28mXBN7YutTFJZW2K
 7tTqKaBxxXMA5qr7lGcYeypAmigP8G2+oitZRxwpIp1W/QZYGG+lpvLbq
 AI5L71sQskeg2RomRgiD70Y11nNW+5sbj9tUfrvqrP8R2ey6lYNZVQdra
 JWAeHCMIKYdZRnY6p0Zqg2jzegwjN5ZbmtWVmz/gwaOMOufKJu48cjaEE
 /rQ41efD/5XO+z8lJO7nFA+OLLfNGKVIj+UzwWwpjsEjXYfNVRZ4H54pG A==;
X-CSE-ConnectionGUID: VH3e7dwURf2Q6oZt3RQ8YQ==
X-CSE-MsgGUID: yh+lhc8WR5eV8ibojNl+pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51959209"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="51959209"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 20:17:52 -0700
X-CSE-ConnectionGUID: /gm9Nx40TQ27X7g0MdRgKQ==
X-CSE-MsgGUID: I+YIfhLZQYOVBl/UvGXWug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="147375025"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 20:17:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 shuicheng.lin@intel.com
Subject: [PATCH] drm/xe: Make WA BB part of LRC BO
Date: Wed, 11 Jun 2025 20:19:25 -0700
Message-Id: <20250612031925.4009701-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

No idea why, but without this GuC context switches randomly fail when
running IGTs in a loop. Need to follow up why this fixes the
aforementioned issue but can live with a stable driver for now.

Fixes: 617d824c5323 ("drm/xe: Add WA BB to capture active context utilization")
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c       | 36 +++++++++++++++----------------
 drivers/gpu/drm/xe/xe_lrc_types.h |  3 ---
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 529c6a972a55..a875b93697a5 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -40,6 +40,7 @@
 
 #define LRC_PPHWSP_SIZE				SZ_4K
 #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
+#define LRC_WA_BB_SIZE				SZ_4K
 
 static struct xe_device *
 lrc_to_xe(struct xe_lrc *lrc)
@@ -910,7 +911,6 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 {
 	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
 	xe_bo_unpin_map_no_vm(lrc->bo);
-	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
 }
 
 /*
@@ -973,22 +973,27 @@ struct wa_bb_setup {
 			 u32 *batch, size_t max_size);
 };
 
+static size_t wa_bb_offset(struct xe_lrc *lrc)
+{
+	return lrc->bo->size - LRC_WA_BB_SIZE;
+}
+
 static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 {
-	const size_t max_size = lrc->bb_per_ctx_bo->size;
+	const size_t max_size = LRC_WA_BB_SIZE;
 	static const struct wa_bb_setup funcs[] = {
 		{ .setup = wa_bb_setup_utilization },
 	};
 	ssize_t remain;
 	u32 *cmd, *buf = NULL;
 
-	if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
+	if (lrc->bo->vmap.is_iomem) {
 		buf = kmalloc(max_size, GFP_KERNEL);
 		if (!buf)
 			return -ENOMEM;
 		cmd = buf;
 	} else {
-		cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
+		cmd = lrc->bo->vmap.vaddr + wa_bb_offset(lrc);
 	}
 
 	remain = max_size / sizeof(*cmd);
@@ -1011,13 +1016,14 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	*cmd++ = MI_BATCH_BUFFER_END;
 
 	if (buf) {
-		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bb_per_ctx_bo->vmap, 0,
-				 buf, (cmd - buf) * sizeof(*cmd));
+		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap,
+				 wa_bb_offset(lrc), buf,
+				 (cmd - buf) * sizeof(*cmd));
 		kfree(buf);
 	}
 
-	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
-			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
+	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR, xe_bo_ggtt_addr(lrc->bo) +
+			     wa_bb_offset(lrc) + 1);
 
 	return 0;
 
@@ -1059,20 +1065,13 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
 	 * via VM bind calls.
 	 */
-	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, lrc_size,
+	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL,
+				       lrc_size + LRC_WA_BB_SIZE,
 				       ttm_bo_type_kernel,
 				       bo_flags);
 	if (IS_ERR(lrc->bo))
 		return PTR_ERR(lrc->bo);
 
-	lrc->bb_per_ctx_bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
-						  ttm_bo_type_kernel,
-						  bo_flags);
-	if (IS_ERR(lrc->bb_per_ctx_bo)) {
-		err = PTR_ERR(lrc->bb_per_ctx_bo);
-		goto err_lrc_finish;
-	}
-
 	lrc->size = lrc_size;
 	lrc->ring.size = ring_size;
 	lrc->ring.tail = 0;
@@ -1860,7 +1859,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	snapshot->seqno = xe_lrc_seqno(lrc);
 	snapshot->lrc_bo = xe_bo_get(lrc->bo);
 	snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
-	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset;
+	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset -
+		LRC_WA_BB_SIZE;
 	snapshot->lrc_snapshot = NULL;
 	snapshot->ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(lrc));
 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index ae24cf6f8dd9..883e550a9423 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -53,9 +53,6 @@ struct xe_lrc {
 
 	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
 	u64 ctx_timestamp;
-
-	/** @bb_per_ctx_bo: buffer object for per context batch wa buffer */
-	struct xe_bo *bb_per_ctx_bo;
 };
 
 struct xe_lrc_snapshot;
-- 
2.34.1

