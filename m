Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450FFCAC581
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 12:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A56810E50C;
	Mon,  8 Sep 2025 12:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lh625CA6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D06F10E50A
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 12:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757334647; x=1788870647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rc8lcEoCNrtb2oEMkCXVTb/LBxTZsCtfJXzNHgj4agE=;
 b=Lh625CA623RAvYc4oySXxoBdcqvEMNninD/QTnj5Rpod2uotPTrwzG3L
 ZSgbLwYEo5brl+i2D1Ohh2kcRUlNf09BtAPAdwgCrKhAVHz3sQ11yi8YJ
 cTtI38EevgwT77Jt/xGJ/59gJq/YEG5DaDzM1w5aObEEJIQLBqJE27CYy
 +twj9bxxMS/MgPfhvM4dREawJHs/VWWO/s6tJ50gKzv3uc35KmADqCJgX
 BkZKIhMnVc4Z+LGBhzv2iPEH2YFTdx4CVo//celecLF76ho/DFWMDYp4f
 AFZpdOTTj1t1Bh+LJR8ARedFkVgB2GiKg6255dphBgKhHVCFN8rJof1+r g==;
X-CSE-ConnectionGUID: zdDlmiSRSBa3Rv9940rRYA==
X-CSE-MsgGUID: YKafzo/BTGew9K+wWHdgLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59526309"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="59526309"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:30:47 -0700
X-CSE-ConnectionGUID: KbsBjLr0S56dWgAWwnvuCg==
X-CSE-MsgGUID: oAWtf5llToKkNxeKCSLFug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172656445"
Received: from abaranow-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.83.253])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:30:45 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 6/7] drm/xe/vf: Move VF CCS data to xe_device
Date: Mon,  8 Sep 2025 14:30:23 +0200
Message-ID: <20250908123025.747-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908123025.747-1-michal.wajdeczko@intel.com>
References: <20250908123025.747-1-michal.wajdeczko@intel.com>
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

We only need single set of VF CCS contexts, they are not per-tile
as initial implementation might suggest. Move all VF CCS data from
xe_tile.sriov.vf to xe_device.sriov.vf. Also rename some structs to
align with the usage and fix their kernel-doc.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.c                 |  4 ++--
 drivers/gpu/drm/xe/xe_device_types.h       |  3 ---
 drivers/gpu/drm/xe/xe_gt_debugfs.c         |  4 ++--
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 21 +++++++++----------
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h | 24 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_sriov_vf_types.h     |  7 +++----
 6 files changed, 38 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index feb6e013dc38..6d20229c11de 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -64,7 +64,7 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
 			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
 {
 	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
-	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_sa_manager *bb_pool;
 	int err;
 
@@ -78,7 +78,7 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
 	 * So, this extra DW acts as a guard here.
 	 */
 
-	bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
+	bb_pool = xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
 	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
 
 	if (IS_ERR(bb->bo)) {
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 1e780f8a2a8c..c0a1f71f767d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -183,9 +183,6 @@ struct xe_tile {
 		struct {
 			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
 			struct xe_ggtt_node *ggtt_balloon[2];
-
-			/** @sriov.vf.ccs: CCS read and write contexts for VF. */
-			struct xe_tile_vf_ccs ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
 		} vf;
 	} sriov;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index f6f2c14b642d..a9d960de0e5e 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -126,7 +126,7 @@ static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
 
 static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_sa_manager *bb_pool;
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
 
@@ -136,7 +136,7 @@ static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
 	xe_pm_runtime_get(gt_to_xe(gt));
 
 	for_each_ccs_rw_ctx(ctx_id) {
-		bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
+		bb_pool = xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
 		if (!bb_pool)
 			break;
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index eb8436e44ca4..c5c60f05073d 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -136,7 +136,7 @@ static u64 get_ccs_bb_pool_size(struct xe_device *xe)
 	return round_up(bb_pool_size * 2, SZ_1M);
 }
 
-static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
+static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_sa_manager *sa_manager;
@@ -168,7 +168,7 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
 	return 0;
 }
 
-static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
+static void ccs_rw_update_ring(struct xe_sriov_vf_ccs_ctx *ctx)
 {
 	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
 	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
@@ -185,7 +185,7 @@ static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
 	xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
 }
 
-static int register_save_restore_context(struct xe_tile_vf_ccs *ctx)
+static int register_save_restore_context(struct xe_sriov_vf_ccs_ctx *ctx)
 {
 	int ctx_type;
 
@@ -215,15 +215,14 @@ static int register_save_restore_context(struct xe_tile_vf_ccs *ctx)
  */
 int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
 {
-	struct xe_tile *tile = xe_device_get_root_tile(xe);
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
-	struct xe_tile_vf_ccs *ctx;
+	struct xe_sriov_vf_ccs_ctx *ctx;
 	int err;
 
 	xe_assert(xe, IS_VF_CCS_READY(xe));
 
 	for_each_ccs_rw_ctx(ctx_id) {
-		ctx = &tile->sriov.vf.ccs[ctx_id];
+		ctx = &xe->sriov.vf.ccs.contexts[ctx_id];
 		err = register_save_restore_context(ctx);
 		if (err)
 			return err;
@@ -234,7 +233,7 @@ int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
 
 static void xe_sriov_vf_ccs_fini(void *arg)
 {
-	struct xe_tile_vf_ccs *ctx = arg;
+	struct xe_sriov_vf_ccs_ctx *ctx = arg;
 	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
 
 	/*
@@ -258,7 +257,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 {
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
-	struct xe_tile_vf_ccs *ctx;
+	struct xe_sriov_vf_ccs_ctx *ctx;
 	struct xe_exec_queue *q;
 	u32 flags;
 	int err;
@@ -270,7 +269,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 		return 0;
 
 	for_each_ccs_rw_ctx(ctx_id) {
-		ctx = &tile->sriov.vf.ccs[ctx_id];
+		ctx = &xe->sriov.vf.ccs.contexts[ctx_id];
 		ctx->ctx_id = ctx_id;
 
 		flags = EXEC_QUEUE_FLAG_KERNEL |
@@ -325,7 +324,7 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
-	struct xe_tile_vf_ccs *ctx;
+	struct xe_sriov_vf_ccs_ctx *ctx;
 	struct xe_tile *tile;
 	struct xe_bb *bb;
 	int err = 0;
@@ -339,7 +338,7 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
 		/* bb should be NULL here. Assert if not NULL */
 		xe_assert(xe, !bb);
 
-		ctx = &tile->sriov.vf.ccs[ctx_id];
+		ctx = &xe->sriov.vf.ccs.contexts[ctx_id];
 		err = xe_migrate_ccs_rw_copy(tile, ctx->mig_q, bo, ctx_id);
 	}
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
index 4d3c10907135..22c499943d2a 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
@@ -6,6 +6,8 @@
 #ifndef _XE_SRIOV_VF_CCS_TYPES_H_
 #define _XE_SRIOV_VF_CCS_TYPES_H_
 
+#include <linux/types.h>
+
 #define for_each_ccs_rw_ctx(id__) \
 	for ((id__) = 0; (id__) < XE_SRIOV_VF_CCS_CTX_COUNT; (id__)++)
 
@@ -18,16 +20,32 @@ enum xe_sriov_vf_ccs_rw_ctxs {
 struct xe_migrate;
 struct xe_sa_manager;
 
-struct xe_tile_vf_ccs {
-	/** @id: Id to which context it belongs to */
+/**
+ * struct xe_sriov_vf_ccs_ctx - VF CCS migration context data.
+ */
+struct xe_sriov_vf_ccs_ctx {
+	/** @ctx_id: Id to which context it belongs to */
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
+
 	/** @mig_q: exec queues used for migration */
 	struct xe_exec_queue *mig_q;
 
+	/** @mem: memory data */
 	struct {
-		/** @ccs_bb_pool: Pool from which batch buffers are allocated. */
+		/** @mem.ccs_bb_pool: Pool from which batch buffers are allocated. */
 		struct xe_sa_manager *ccs_bb_pool;
 	} mem;
 };
 
+/**
+ * struct xe_sriov_vf_ccs - The VF CCS migration support data.
+ */
+struct xe_sriov_vf_ccs {
+	/** @contexts: CCS read and write contexts for VF. */
+	struct xe_sriov_vf_ccs_ctx contexts[XE_SRIOV_VF_CCS_CTX_COUNT];
+
+	/** @initialized: Initialization of VF CCS is completed or not. */
+	bool initialized;
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
index 2c94d1f92187..426cc5841958 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
@@ -9,6 +9,8 @@
 #include <linux/types.h>
 #include <linux/workqueue_types.h>
 
+#include "xe_sriov_vf_ccs_types.h"
+
 /**
  * struct xe_sriov_vf_relay_version - PF ABI version details.
  */
@@ -43,10 +45,7 @@ struct xe_device_vf {
 	} migration;
 
 	/** @ccs: VF CCS state data */
-	struct {
-		/** @ccs.initialized: Initilalization of VF CCS is completed or not */
-		bool initialized;
-	} ccs;
+	struct xe_sriov_vf_ccs ccs;
 };
 
 #endif
-- 
2.47.1

