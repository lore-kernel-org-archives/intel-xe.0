Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0797C7EE2A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 15:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF3610EA52;
	Fri, 27 Jun 2025 15:13:20 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DE710EA57
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 15:13:19 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 1/2] drm/xe: Extract xe_bo_is_visible_vram
Date: Fri, 27 Jun 2025 17:13:09 +0200
Message-ID: <20250627151307.23001-5-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250627151307.23001-4-dev@lankhorst.se>
References: <20250627151307.23001-4-dev@lankhorst.se>
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
---
 drivers/gpu/drm/xe/xe_bo.c | 10 +++++++++-
 drivers/gpu/drm/xe/xe_bo.h |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4e39188a021ab..af312bc70d0fe 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -557,6 +557,14 @@ static bool xe_ttm_resource_visible(struct ttm_resource *mem)
 	return vres->used_visible_size == mem->size;
 }
 
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
@@ -1547,7 +1555,7 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
 	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
 		return -EIO;
 
-	if (!xe_ttm_resource_visible(ttm_bo->resource) || len >= SZ_16K) {
+	if (!xe_bo_is_visible_vram(bo) || len >= SZ_16K) {
 		struct xe_migrate *migrate =
 			mem_type_to_migrate(xe, ttm_bo->resource->mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 02ada1fb8a235..460cfc309eec2 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -265,6 +265,7 @@ int xe_bo_read(struct xe_bo *bo, u64 offset, void *dst, int size);
 
 bool mem_type_is_vram(u32 mem_type);
 bool xe_bo_is_vram(struct xe_bo *bo);
+bool xe_bo_is_visible_vram(struct xe_bo *bo);
 bool xe_bo_is_stolen(struct xe_bo *bo);
 bool xe_bo_is_stolen_devmem(struct xe_bo *bo);
 bool xe_bo_is_vm_bound(struct xe_bo *bo);
-- 
2.45.2

