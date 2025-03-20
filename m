Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732C8C36002
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 21:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289A210E6C6;
	Thu, 20 Mar 2025 21:16:26 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6DD10E6A2
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 21:16:22 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 2/2] drm/xe: Copy cpu_caching when importing DMA-BUF.
Date: Thu, 20 Mar 2025 22:15:19 +0100
Message-ID: <20250320211519.632432-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250320211519.632432-1-dev@lankhorst.se>
References: <20250320211519.632432-1-dev@lankhorst.se>
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

When testing xe with P2PDMA DMA-BUF import,
VM_BIND was failing because cpu_caching was not set.

Set cpu_caching if available from another xe driver,
to allow uncached VM_BIND on imported DMA-BUF.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index c5b95470fa324..9b1813e65e0a4 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -266,12 +266,12 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
 	const struct dma_buf_attach_ops *attach_ops;
 	struct dma_buf_attachment *attach;
 	struct drm_gem_object *obj;
-	struct xe_bo *bo;
+	struct xe_bo *bo, *foreign_bo = NULL;
 
-	if (dma_buf->ops == &xe_dmabuf_ops) {
+	if (dma_buf->ops == &xe_dmabuf_ops &&
+	    !XE_TEST_ONLY(test && test->force_different_devices)) {
 		obj = dma_buf->priv;
-		if (obj->dev == dev &&
-		    !XE_TEST_ONLY(test && test->force_different_devices)) {
+		if (obj->dev == dev) {
 			/*
 			 * Importing dmabuf exported from out own gem increases
 			 * refcount on gem itself instead of f_count of dmabuf.
@@ -279,6 +279,8 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
 			drm_gem_object_get(obj);
 			return obj;
 		}
+
+		foreign_bo = gem_to_xe_bo(obj);
 	}
 
 	/*
@@ -310,6 +312,9 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
 
 	get_dma_buf(dma_buf);
 	obj->import_attach = attach;
+	if (foreign_bo)
+		bo->cpu_caching = foreign_bo->cpu_caching;
+
 	return obj;
 
 out_err:
-- 
2.45.2

