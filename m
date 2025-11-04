Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2B2CCFA04
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 10:23:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF1510E5AE;
	Tue,  4 Nov 2025 10:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gW6aP+ym";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ABE910E5AC
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 10:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762251779; x=1793787779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x1DtWhqpejuy/eUT8jZxfBo7QXdu4wsBDoWebciup40=;
 b=gW6aP+ymp3Suhe97LzGH4fVd2qop5RK8CMzLTe9R/Tem5s7RGj+beZXn
 zjU9H/wDs6i9d0/QH+EYHJVIKpYstVE9W8P5wDYdr7AlYil6hZ1dInXnF
 hMujMiA3YvuGf7T3gxF4qN/Y1AezlbxO/iK7g8XbAe6mGoG/DCS0YC/SK
 rFzmYzM6uEei+tr5BrYr072d0IrvgxNZaRvGJbSuH8CMJwzIaI5kBiUdP
 31CF9Nc62onanvmtH8BNPsc038VFW+MUAB5ULw6rpmqOQPCurXb9w5eh5
 V7iY8gMF88PIo7L3Tix22bR/vG5C5aOJ1ZJK1JfvhP+HoWVMukAOcBMsS w==;
X-CSE-ConnectionGUID: GUwBBE7sRnSJ12UG97wsIg==
X-CSE-MsgGUID: wahsN97oQXKsuCvdL197rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75693029"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="75693029"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:22:59 -0800
X-CSE-ConnectionGUID: W1Cu2Y1JRhGnHyc5693ruA==
X-CSE-MsgGUID: nhq9W39eQNGjUe+52ewwMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="186810873"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa009.jf.intel.com with ESMTP; 04 Nov 2025 02:22:57 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org,
	matthew.brost@intel.com
Cc: matthew.auld@intel.com, michal.mrozek@intel.com,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v4 2/3] drm/xe: add xe_migrate_resolve wrapper and
 is_vram_resolve support
Date: Tue,  4 Nov 2025 16:23:04 +0530
Message-Id: <20251104105305.2100460-3-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251104105305.2100460-1-nitin.r.gote@intel.com>
References: <20251104105305.2100460-1-nitin.r.gote@intel.com>
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

Introduce an internal __xe_migrate_copy(..., is_vram_resolve) path and
expose a small wrapper xe_migrate_resolve() that calls it with
is_vram_resolve=true.

For resolve/decompression operations we must ensure the copy code uses
the compression PAT index when appropriate; this change centralizes that
behavior and allows callers to schedule a resolve (decompress) operation
via the migrate API.

v2: (Matt)
  - Simplify xe_migrate_resolve(), use single BO/resource;
    remove copy_only_ccs argument as it's always false.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 83 ++++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_migrate.h |  4 ++
 2 files changed, 60 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 56a5804726e9..1c0971671534 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -832,31 +832,13 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
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
@@ -877,8 +859,15 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
 		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
 	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
-	bool use_comp_pat = type_device && xe_device_has_flat_ccs(xe) &&
-		GRAPHICS_VER(xe) >= 20 && src_is_vram && !dst_is_vram;
+
+	/*
+	 * For decompression operation, always use the compression PAT index.
+	 * Otherwise, only use the compression PAT index for device memory
+	 * when copying from VRAM to system memory.
+	 */
+	bool use_comp_pat = is_vram_resolve || (type_device &&
+			    xe_device_has_flat_ccs(xe) &&
+			    GRAPHICS_VER(xe) >= 20 && src_is_vram && !dst_is_vram);
 
 	/* Copying CCS between two different BOs is not supported yet. */
 	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
@@ -1037,6 +1026,46 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
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
+				     struct xe_bo *bo,
+				     struct ttm_resource *res)
+{
+	return __xe_migrate_copy(m, bo, bo, res, res, false, true);
+}
+
 /**
  * xe_migrate_lrc() - Get the LRC from migrate context.
  * @migrate: Migrate context.
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 4fad324b6253..302180c9e38b 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -125,6 +125,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct ttm_resource *dst,
 				  bool copy_only_ccs);
 
+struct dma_fence *xe_migrate_resolve(struct xe_migrate *m,
+				     struct xe_bo *bo,
+				     struct ttm_resource *res);
+
 int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 			   struct xe_bo *src_bo,
 			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
-- 
2.25.1

