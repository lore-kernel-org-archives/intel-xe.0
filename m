Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6F3C87FCC
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 15:27:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB3610E7B8;
	Thu, 31 Jul 2025 15:27:11 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194B410E7BA
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 15:27:10 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH 1/2] drm/xe: Extract xe_bo_is_visible_vram
Date: Thu, 31 Jul 2025 17:26:59 +0200
Message-ID: <20250731152700.2196681-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250731152700.2196681-1-dev@lankhorst.se>
References: <20250731152700.2196681-1-dev@lankhorst.se>
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

This will make it possible to call from xe_display code.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 19 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_bo.h |  1 +
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 1a72561f987c8..c5fe8b50e09f5 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -576,6 +576,23 @@ static bool xe_ttm_resource_visible(struct ttm_resource *mem)
 	return vres->used_visible_size == mem->size;
 }
 
+/**
+ * xe_bo_is_visible_vram - check if BO is placed entirely in visible VRAM.
+ * @bo: The BO
+ *
+ * This function checks whether a given BO resides entirely in memory visible from the CPU
+ *
+ * Returns: true if the BO is entirely visible, false otherwise.
+ *
+ */
+bool xe_bo_is_visible_vram(struct xe_bo *bo)
+{
+	if (drm_WARN_ON(bo->ttm.base.dev, !xe_bo_is_vram(bo)))
+		return false;
+
+	return xe_ttm_resource_visible(bo->ttm.resource);
+}
+
 static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 				 struct ttm_resource *mem)
 {
@@ -1589,7 +1606,7 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
 	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
 		return -EIO;
 
-	if (!xe_ttm_resource_visible(ttm_bo->resource) || len >= SZ_16K) {
+	if (!xe_bo_is_visible_vram(bo) || len >= SZ_16K) {
 		struct xe_migrate *migrate =
 			mem_type_to_migrate(xe, ttm_bo->resource->mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 8cce413b52353..6134d82e80554 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -277,6 +277,7 @@ int xe_bo_read(struct xe_bo *bo, u64 offset, void *dst, int size);
 
 bool mem_type_is_vram(u32 mem_type);
 bool xe_bo_is_vram(struct xe_bo *bo);
+bool xe_bo_is_visible_vram(struct xe_bo *bo);
 bool xe_bo_is_stolen(struct xe_bo *bo);
 bool xe_bo_is_stolen_devmem(struct xe_bo *bo);
 bool xe_bo_is_vm_bound(struct xe_bo *bo);
-- 
2.45.2

