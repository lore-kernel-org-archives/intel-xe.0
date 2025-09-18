Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00204CA1013
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 13:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CC510E8C7;
	Thu, 18 Sep 2025 13:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eudz3HvQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CD910E8C1
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 13:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758203798; x=1789739798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F02xwPAxBVzg1u37qjenDAJz4R7HsReOhD+zjoyQsvA=;
 b=Eudz3HvQSRZ/SoJGIQKc+WDjMu7gVnKRehoXsTCGSRkJB0vxZiBmVIgY
 zTSAsxUx/HpozrtMX/pjFRFOr9RYmDe8NmEUX7CRCzab7RbkIMtCXINl+
 aDobuWIvmtEVygpR5+hnsWyzA84/cIX9PxgIzHpTdPFVcJU+h9sRxJImd
 f3rrn/SyTA6iGfByyTPtplHpNC5mP7ngTlxrVpJNOFXs4lrwGH1cfFTAV
 qcTr8LModzmF/YkmIdbxxd3EfV5B84RzVo5ZNswCq9kPS7in8xeiZZISA
 bQY0TOCKlIO0h0xWYM624U8WVf4ZPfbP5zQyEptkb18emkQrjcwuGmNqr w==;
X-CSE-ConnectionGUID: FRLnQo75SqyCO2lQb/caUQ==
X-CSE-MsgGUID: N+JOX0seSQWNH3lCU7FwBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64337079"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64337079"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 06:56:38 -0700
X-CSE-ConnectionGUID: AJCAmfmwTOiLSbVAKXmtAw==
X-CSE-MsgGUID: hXtYrVGcS/CamjYKyI+B3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="179828045"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa004.jf.intel.com with ESMTP; 18 Sep 2025 06:56:37 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@intel.com, Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v1 2/5] drm/xe: add xe_migrate_resolve wrapper and
 is_vram_resolve support
Date: Thu, 18 Sep 2025 19:55:26 +0530
Message-Id: <20250918142529.608432-3-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250918142529.608432-1-nitin.r.gote@intel.com>
References: <20250918142529.608432-1-nitin.r.gote@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Introduce an internal __xe_migrate_copy(..., is_vram_resolve) path and
expose a small wrapper xe_migrate_resolve() that calls it with
is_vram_resolve=true.

For resolve/decompression operations we must ensure the copy code uses
the compression PAT index when appropriate; this change centralizes that
behavior and allows callers to schedule a resolve (decompress) operation
via the migrate API.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 90 +++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_migrate.h |  7 +++
 2 files changed, 70 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 1d667fa36cf3..6558a774dbee 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -764,31 +764,13 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 	return flush_flags;
 }
 
-/**
- * xe_migrate_copy() - Copy content of TTM resources.
- * @m: The migration context.
- * @src_bo: The buffer object @src is currently bound to.
- * @dst_bo: If copying between resources created for the same bo, set this to
- * the same value as @src_bo. If copying between buffer objects, set it to
- * the buffer object @dst is currently bound to.
- * @src: The source TTM resource.
- * @dst: The dst TTM resource.
- * @copy_only_ccs: If true copy only CCS metadata
- *
- * Copies the contents of @src to @dst: On flat CCS devices,
- * the CCS metadata is copied as well if needed, or if not present,
- * the CCS metadata of @dst is cleared for security reasons.
- *
- * Return: Pointer to a dma_fence representing the last copy batch, or
- * an error pointer on failure. If there is a failure, any copy operation
- * started by the function call has been synced.
- */
-struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
-				  struct xe_bo *src_bo,
-				  struct xe_bo *dst_bo,
-				  struct ttm_resource *src,
-				  struct ttm_resource *dst,
-				  bool copy_only_ccs)
+static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
+					   struct xe_bo *src_bo,
+					   struct xe_bo *dst_bo,
+					   struct ttm_resource *src,
+					   struct ttm_resource *dst,
+					   bool copy_only_ccs,
+					   bool is_vram_resolve)
 {
 	struct xe_gt *gt = m->tile->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
@@ -809,8 +791,19 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
 		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
 	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
-	bool use_comp_pat = type_device && xe_device_has_flat_ccs(xe) &&
-		GRAPHICS_VER(xe) >= 20 && src_is_vram && !dst_is_vram;
+	bool use_comp_pat;
+
+	/*
+	 * For decompression operation, always use the compression PAT index.
+	 * Otherwise, only use the compression PAT index for device memory
+	 * when copying from VRAM to system memory.
+	 */
+	if (is_vram_resolve) {
+		use_comp_pat = true;
+	} else {
+		use_comp_pat = type_device && xe_device_has_flat_ccs(xe) &&
+			GRAPHICS_VER(xe) >= 20 && src_is_vram && !dst_is_vram;
+	}
 
 	/* Copying CCS between two different BOs is not supported yet. */
 	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
@@ -969,6 +962,49 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	return fence;
 }
 
+/**
+ * xe_migrate_copy() - Copy content of TTM resources.
+ * @m: The migration context.
+ * @src_bo: The buffer object @src is currently bound to.
+ * @dst_bo: If copying between resources created for the same bo, set this to
+ * the same value as @src_bo. If copying between buffer objects, set it to
+ * the buffer object @dst is currently bound to.
+ * @src: The source TTM resource.
+ * @dst: The dst TTM resource.
+ * @copy_only_ccs: If true copy only CCS metadata
+ *
+ * Copies the contents of @src to @dst: On flat CCS devices,
+ * the CCS metadata is copied as well if needed, or if not present,
+ * the CCS metadata of @dst is cleared for security reasons.
+ *
+ * Return: Pointer to a dma_fence representing the last copy batch, or
+ * an error pointer on failure. If there is a failure, any copy operation
+ * started by the function call has been synced.
+ */
+struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
+				  struct xe_bo *src_bo,
+				  struct xe_bo *dst_bo,
+				  struct ttm_resource *src,
+				  struct ttm_resource *dst,
+				  bool copy_only_ccs)
+{
+	return __xe_migrate_copy(m, src_bo, dst_bo, src, dst, copy_only_ccs, false);
+}
+
+/**
+ * xe_migrate_resolve() - Resolve and decompress a buffer object if required.
+ * This wrapper forwards to __xe_migrate_copy() with is_vram_resolve=true.
+ */
+struct dma_fence *xe_migrate_resolve(struct xe_migrate *m,
+				     struct xe_bo *src_bo,
+				     struct xe_bo *dst_bo,
+				     struct ttm_resource *src,
+				     struct ttm_resource *dst,
+				     bool copy_only_ccs)
+{
+	return __xe_migrate_copy(m, src_bo, dst_bo, src, dst, copy_only_ccs, true);
+}
+
 /**
  * xe_migrate_lrc() - Get the LRC from migrate context.
  * @migrate: Migrate context.
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 4fad324b6253..ade68ab32a71 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -125,6 +125,13 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct ttm_resource *dst,
 				  bool copy_only_ccs);
 
+struct dma_fence *xe_migrate_resolve(struct xe_migrate *m,
+				     struct xe_bo *src_bo,
+				     struct xe_bo *dst_bo,
+				     struct ttm_resource *src,
+				     struct ttm_resource *dst,
+				     bool copy_only_ccs);
+
 int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 			   struct xe_bo *src_bo,
 			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
-- 
2.25.1

