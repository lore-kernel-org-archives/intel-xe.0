Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11D4606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 11:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WxM9MY+0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8782A11277D;
	Fri, 30 Oct 2026 11:50:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8963112771
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 11:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793361009; x=1824897009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j5TTMRQwdQhlmVPxPMACGsMqEsyyR2TiXj0XbesXLbI=;
 b=WxM9MY+0pRGuPc0MGEf7AQmUUjsnImHDqIKpADgLKt0PWOHT+uI4nMtE
 McwhCz1MShVXm1tfR9CD5E09sYFGaHcOQOlb2Gc3QmeV7vLv2zsYFtNVW
 oQZ9TnF0hqObWe0BExfRhSlgwA5xQYOBgupHkZcAO95IwDj+ap7hwVO2h
 zpQ0uleytqKWUQ/zGT58UIxt6ZerT3l1Hht0121i4I6DZfIy1ETo03OuW
 tztU8g1My8Mu8V8aq5IWZJoa75S7cgksQAyXsZqYNcF+FhRgbFjk57KfO
 XokUwesnVuooiUySRxe4p1Ian830LIDx+TEUvjSMQi3thuMJqIB+SSsqF w==;
X-CSE-ConnectionGUID: ktAVVLP9SgCp/SlLA5nj0g==
X-CSE-MsgGUID: lS4B+QgxShCP3DFJ/03ZcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2135391"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2135391"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:50:08 -0700
X-CSE-ConnectionGUID: npCRKl4FQSqwHGtqiTgS+g==
X-CSE-MsgGUID: hlRVRW9SScqHP7tYqnSd5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5441165"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.36])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:50:07 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 5/6] drm/xe/migrate: plumb interruptible wait flag to clear
 and copy
Date: Fri, 30 Oct 2026 11:49:55 +0000
Message-ID: <20261030-migrate-bb-optimise-v1-5-b8d01649cfe9@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030-migrate-bb-optimise-v1-0-b8d01649cfe9@intel.com>
References: <20261030-migrate-bb-optimise-v1-0-b8d01649cfe9@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Plumb a bool intr parameter into xe_migrate_clear() and
xe_migrate_copy() and pass it to __xe_bb_new(), forwarding
ctx->interruptible from xe_bo_move() and false from non-interruptible
kernel callers so suballocator waits respect the caller's context.

Assisted-by: LLM
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9644
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c           |  2 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c      | 12 ++++++------
 drivers/gpu/drm/xe/xe_bo.c                 |  9 +++++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  3 ++-
 drivers/gpu/drm/xe/xe_migrate.c            | 19 ++++++++++++-------
 drivers/gpu/drm/xe/xe_migrate.h            |  6 ++++--
 drivers/gpu/drm/xe/xe_vram.c               |  2 +-
 7 files changed, 31 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 6a17e13d58cf..22a2e8f8143a 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -270,7 +270,7 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 	/* Optionally clear bo *and* CCS data in VRAM. */
 	if (clear) {
 		fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource,
-					 XE_MIGRATE_CLEAR_FLAG_FULL);
+					 XE_MIGRATE_CLEAR_FLAG_FULL, false);
 		if (IS_ERR(fence)) {
 			KUNIT_FAIL(test, "Failed to submit bo clear.\n");
 			return PTR_ERR(fence);
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index a9ef8f2dcebb..162532412426 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -112,7 +112,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 
 	xe_map_memset(xe, &remote->vmap, 0, 0xd0, xe_bo_size(remote));
 	fence = xe_migrate_clear(m, remote, remote->ttm.resource,
-				 XE_MIGRATE_CLEAR_FLAG_FULL);
+				 XE_MIGRATE_CLEAR_FLAG_FULL, false);
 	if (!sanity_fence_failed(xe, fence, big ? "Clearing remote big bo" :
 				 "Clearing remote small bo", test)) {
 		retval = xe_map_rd(xe, &remote->vmap, 0, u64);
@@ -130,7 +130,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 
 	expected = 0xc0c0c0c0c0c0c0c0;
 	fence = xe_migrate_copy(m, remote, bo, remote->ttm.resource,
-				bo->ttm.resource, false);
+				bo->ttm.resource, false, false);
 	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo remote -> vram" :
 				 "Copying small bo remote -> vram", test)) {
 		retval = xe_map_rd(xe, &bo->vmap, 0, u64);
@@ -147,7 +147,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 	xe_map_memset(xe, &bo->vmap, 0, 0xc0, xe_bo_size(bo));
 
 	fence = xe_migrate_copy(m, bo, remote, bo->ttm.resource,
-				remote->ttm.resource, false);
+				remote->ttm.resource, false, false);
 	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo vram -> remote" :
 				 "Copying small bo vram -> remote", test)) {
 		retval = xe_map_rd(xe, &remote->vmap, 0, u64);
@@ -287,7 +287,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test,
 	xe_map_memset(xe, &tiny->vmap, 0, 0x22, xe_bo_size(tiny));
 	expected = 0;
 	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource,
-				 XE_MIGRATE_CLEAR_FLAG_FULL);
+				 XE_MIGRATE_CLEAR_FLAG_FULL, false);
 	if (sanity_fence_failed(xe, fence, "Clearing small bo", test))
 		goto out;
 
@@ -309,7 +309,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test,
 	xe_map_memset(xe, &big->vmap, 0, 0x11, xe_bo_size(big));
 	expected = 0;
 	fence = xe_migrate_clear(m, big, big->ttm.resource,
-				 XE_MIGRATE_CLEAR_FLAG_FULL);
+				 XE_MIGRATE_CLEAR_FLAG_FULL, false);
 	if (sanity_fence_failed(xe, fence, "Clearing big bo", test))
 		goto out;
 
@@ -611,7 +611,7 @@ static void test_clear(struct xe_device *xe, struct xe_tile *tile,
 	kunit_info(test, "Clear vram buffer object\n");
 	expected = 0x0000000000000000;
 	fence = xe_migrate_clear(tile->migrate, vram_bo, vram_bo->ttm.resource,
-				 XE_MIGRATE_CLEAR_FLAG_FULL);
+				 XE_MIGRATE_CLEAR_FLAG_FULL, false);
 	if (sanity_fence_failed(xe, fence, "Clear vram_bo", test))
 		return;
 	dma_fence_put(fence);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 42a6aa1a2e4a..e01143c0ccd7 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1298,10 +1298,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		else if (handle_system_ccs)
 			flags |= XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
 
-		fence = xe_migrate_clear(migrate, bo, new_mem, flags);
+		fence = xe_migrate_clear(migrate, bo, new_mem, flags,
+					 ctx->interruptible);
 	} else {
 		fence = xe_migrate_copy(migrate, bo, bo, old_mem, new_mem,
-					handle_system_ccs);
+					handle_system_ccs, ctx->interruptible);
 	}
 	if (IS_ERR(fence)) {
 		ret = PTR_ERR(fence);
@@ -1594,7 +1595,7 @@ static int xe_bo_evict_pinned_copy(struct xe_bo *bo, struct xe_bo *backup)
 			goto out_backup;
 
 		fence = xe_migrate_copy(migrate, bo, backup, bo->ttm.resource,
-					backup->ttm.resource, false);
+					backup->ttm.resource, false, false);
 		if (IS_ERR(fence)) {
 			ret = PTR_ERR(fence);
 			goto out_backup;
@@ -1744,7 +1745,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 
 		fence = xe_migrate_copy(migrate, backup, bo,
 					backup->ttm.resource, bo->ttm.resource,
-					false);
+					false, ctx.interruptible);
 		if (IS_ERR(fence)) {
 			ret = PTR_ERR(fence);
 			goto out_unlock_bo;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 0a47458e5bf2..c410a8e86cd9 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -3019,7 +3019,8 @@ static int pf_sanitize_lmem(struct xe_tile *tile, struct xe_bo *bo, long timeout
 		return 0;
 
 	xe_bo_lock(bo, false);
-	fence = xe_migrate_clear(m, bo, bo->ttm.resource, XE_MIGRATE_CLEAR_FLAG_FULL);
+	fence = xe_migrate_clear(m, bo, bo->ttm.resource,
+				 XE_MIGRATE_CLEAR_FLAG_FULL, false);
 	if (IS_ERR(fence)) {
 		err = PTR_ERR(fence);
 	} else if (!fence) {
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 1a216fb12d2b..dd326bcd12b1 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1213,7 +1213,8 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 					   struct ttm_resource *src,
 					   struct ttm_resource *dst,
 					   bool copy_only_ccs,
-					   bool is_vram_resolve)
+					   bool is_vram_resolve,
+					   bool intr)
 {
 	struct xe_gt *gt = m->tile->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
@@ -1315,7 +1316,7 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
 		batch_size += ((copy_only_ccs) ? 0 : emit_copy_cmd_len(xe)) +
 			((needs_ccs_emit ? EMIT_COPY_CCS_DW : 0));
 
-		bb = xe_bb_new(gt, batch_size, usm);
+		bb = __xe_bb_new(gt, batch_size, usm, intr);
 		if (IS_ERR(bb)) {
 			err = PTR_ERR(bb);
 			goto err_sync;
@@ -1409,6 +1410,7 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
  * @src: The source TTM resource.
  * @dst: The dst TTM resource.
  * @copy_only_ccs: If true copy only CCS metadata
+ * @intr: Whether to perform any wait interruptibly
  *
  * Copies the contents of @src to @dst: On flat CCS devices,
  * the CCS metadata is copied as well if needed, or if not present,
@@ -1423,9 +1425,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct xe_bo *dst_bo,
 				  struct ttm_resource *src,
 				  struct ttm_resource *dst,
-				  bool copy_only_ccs)
+				  bool copy_only_ccs,
+				  bool intr)
 {
-	return __xe_migrate_copy(m, src_bo, dst_bo, src, dst, copy_only_ccs, false);
+	return __xe_migrate_copy(m, src_bo, dst_bo, src, dst, copy_only_ccs, false, intr);
 }
 
 /**
@@ -1443,7 +1446,7 @@ struct dma_fence *xe_migrate_resolve(struct xe_migrate *m,
 				     struct xe_bo *bo,
 				     struct ttm_resource *res)
 {
-	return __xe_migrate_copy(m, bo, bo, res, res, false, true);
+	return __xe_migrate_copy(m, bo, bo, res, res, false, true, true);
 }
 
 /**
@@ -1913,6 +1916,7 @@ static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
  * @bo: The buffer object @dst is currently bound to.
  * @dst: The dst TTM resource to be cleared.
  * @clear_flags: flags to specify which data to clear: CCS, BO, or both.
+ * @intr: Whether to perform any wait interruptibly.
  *
  * Clear the contents of @dst to zero when XE_MIGRATE_CLEAR_FLAG_BO_DATA is set.
  * On flat CCS devices, the CCS metadata is cleared to zero with XE_MIGRATE_CLEAR_FLAG_CCS_DATA.
@@ -1926,7 +1930,8 @@ static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct xe_bo *bo,
 				   struct ttm_resource *dst,
-				   u32 clear_flags)
+				   u32 clear_flags,
+				   bool intr)
 {
 	bool clear_vram = mem_type_is_vram(dst->mem_type);
 	bool clear_bo_data = XE_MIGRATE_CLEAR_FLAG_BO_DATA & clear_flags;
@@ -1987,7 +1992,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		if (WARN_ON_ONCE(!clear_L0))
 			break;
 
-		bb = xe_bb_new(gt, batch_size, usm);
+		bb = __xe_bb_new(gt, batch_size, usm, intr);
 		if (IS_ERR(bb)) {
 			err = PTR_ERR(bb);
 			goto err_sync;
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 2e8be10fdb71..30fb236ea520 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -54,7 +54,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct xe_bo *dst_bo,
 				  struct ttm_resource *src,
 				  struct ttm_resource *dst,
-				  bool copy_only_ccs);
+				  bool copy_only_ccs,
+				  bool intr);
 
 struct dma_fence *xe_migrate_resolve(struct xe_migrate *m,
 				     struct xe_bo *bo,
@@ -85,7 +86,8 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct xe_bo *bo,
 				   struct ttm_resource *dst,
-				   u32 clear_flags);
+				   u32 clear_flags,
+				   bool intr);
 
 struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
 
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 1c02889ba29b..946970236208 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -526,7 +526,7 @@ int xe_vram_memtest(struct xe_device *xe)
 		xe_bo_lock(last_page_bo, false);
 		fence = xe_migrate_clear(tile->migrate, last_page_bo,
 					 last_page_bo->ttm.resource,
-					 XE_MIGRATE_CLEAR_FLAG_BO_DATA);
+					 XE_MIGRATE_CLEAR_FLAG_BO_DATA, false);
 		xe_bo_unlock(last_page_bo);
 
 		if (!IS_ERR(fence)) {

-- 
2.56.0
