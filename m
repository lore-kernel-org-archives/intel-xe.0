Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A06C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 21:45:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8A810E85C;
	Wed, 13 Dec 2023 21:45:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039EA10E824
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 21:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702503935; x=1734039935;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1sPN+Yt1m+GlIGpXt0/xNlnitM5+YkuY88pat5FeZPo=;
 b=BCryFIA2RqHWhlVHx08VIz82c8LFgClk/H0Jd+NtVuiDhqgEoRh1dI43
 2bAEeqdeIDcpJ7DhPH2+OMAGuozQoTpi//mcbLmmZj9Qc51Iz0lMalxW+
 kiOFY07Hac4S3HsE2doH6T7elMWXUmyqTUMVWVrOdfF8M77KBim9Bq+Pp
 V5h7MTybl11zQq/KlO3YupaTQhPbrOGFDO0H96Oh3gvno7fr/nkm0IMvR
 dy3hNV1mMd0u4uErqbeMRA8Ej7rO+/RfBghO0dQA/bPppSvi+iTSpAtwF
 SnBxP6OQ71Jw/UNNnP0KXJMdv0YOdYshweMPYR2w1WjilIhRejAUPO4xR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="16581502"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="16581502"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 13:45:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="22137478"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 13:45:34 -0800
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v3 2/3] drm/xe: Teach Xe how to use objects with XeLink
 connectivity
Date: Wed, 13 Dec 2023 16:45:24 -0500
Message-Id: <20231213214525.2584729-3-david.kershner@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20231213214525.2584729-1-david.kershner@intel.com>
References: <20231213214525.2584729-1-david.kershner@intel.com>
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

The XeLink device offers fabric backed memory.  Page table entries
need to be aware of this fact so that the access occur over the
fabric rather than to the system or local device memory.

Objects are shared via dma-buf, and then fabric connectivity is
checked during the _get_pages() pass.

Objects do NOT need to be dma mapped because system dma does not
occur.

The Device Physical Address (DPA) is the memory range assigned
to the fabric device at driver init.  This address is what will
need to be programmed into the page table entry.  In addition
the PTE_LM bit needs to be set.

Address information is provided in a scatter/gather table.

Teach the dma-buf interface and the page table entries all about
fabric backed memory.

Signed-off-by: David Kershner <david.kershner@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           |  45 +++++-
 drivers/gpu/drm/xe/xe_bo.h           |   2 +
 drivers/gpu/drm/xe/xe_dma_buf.c      | 208 +++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_dma_buf.h      |   3 +
 drivers/gpu/drm/xe/xe_ggtt.c         |   3 +
 drivers/gpu/drm/xe/xe_link.c         |  12 ++
 drivers/gpu/drm/xe/xe_link.h         |   2 +
 drivers/gpu/drm/xe/xe_pt.c           |   2 +
 drivers/gpu/drm/xe/xe_trace.h        |  29 ++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  17 ++-
 drivers/gpu/drm/xe/xe_vm.c           |   3 +-
 11 files changed, 256 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7c0037aecff3..8f2efc95cd04 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -8,6 +8,7 @@
 #include <linux/dma-buf.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/ttm/ttm_device.h>
@@ -525,6 +526,32 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 	return ret;
 }
 
+/**
+ * map_xelink_connectivity - check for XeLink and create a mappable sgt
+ * if available
+ * @bo: object to check XeLink connectivity
+ *
+ * Returns sgt or -errno on error, -EIO indicates no XeLink connectivity.
+ */
+static struct sg_table *map_xelink_connectivity(struct xe_bo *bo)
+{
+	struct dma_buf_attachment *attach = bo->ttm.base.import_attach;
+	struct xe_bo *import;
+
+	if (!(bo->flags & XE_BO_XELINK_AVAIL))
+		return ERR_PTR(-EIO);
+
+	import = gem_to_xe_bo(attach->dmabuf->priv);
+
+	/* Make sure the object didn't migrate */
+	if (!xe_bo_is_vram(import)) {
+		bo->flags &= ~XE_BO_XELINK_AVAIL;
+		return ERR_PTR(-EIO);
+	}
+
+	return xe_dma_buf_map(attach, DMA_NONE);
+}
+
 /*
  * The dma-buf map_attachment() / unmap_attachment() is hooked up here.
  * Note that unmapping the attachment is deferred to the next
@@ -542,6 +569,7 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 					       ttm);
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
 	struct sg_table *sg;
+	struct xe_bo *bo, *export;
 
 	xe_assert(xe, attach);
 	xe_assert(xe, ttm_bo->ttm);
@@ -549,12 +577,25 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 	if (new_res->mem_type == XE_PL_SYSTEM)
 		goto out;
 
+	bo = ttm_to_xe_bo(ttm_bo);
 	if (ttm_bo->sg) {
-		dma_buf_unmap_attachment(attach, ttm_bo->sg, DMA_BIDIRECTIONAL);
+		if (bo->flags & XE_BO_XELINK_AVAIL) {
+			export = gem_to_xe_bo(attach->dmabuf->priv);
+			xe_link_mapping_put(to_xe_device(export->ttm.base.dev));
+			xe_link_mapping_put(to_xe_device(ttm_bo->base.dev));
+			sg_free_table(ttm_bo->sg);
+			kfree(ttm_bo->sg);
+		} else {
+			dma_buf_unmap_attachment(attach, ttm_bo->sg, DMA_BIDIRECTIONAL);
+		}
 		ttm_bo->sg = NULL;
 	}
 
-	sg = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+	sg = map_xelink_connectivity(bo);
+
+	if (IS_ERR(sg) && PTR_ERR(sg) == -EIO)
+		sg = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+
 	if (IS_ERR(sg))
 		return PTR_ERR(sg);
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 9b1279aca127..72a040a5d1e7 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -44,6 +44,8 @@
 #define XE_BO_FIXED_PLACEMENT_BIT	BIT(11)
 #define XE_BO_PAGETABLE			BIT(12)
 #define XE_BO_NEEDS_CPU_ACCESS		BIT(13)
+#define XE_BO_XELINK_AVAIL		BIT(14)
+
 /* this one is trigger internally only */
 #define XE_BO_INTERNAL_TEST		BIT(30)
 #define XE_BO_INTERNAL_64K		BIT(31)
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 64ed303728fd..c31bde452d93 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -11,36 +11,34 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_prime.h>
+#include <drm/xelink_platform.h>
 #include <drm/ttm/ttm_tt.h>
 
 #include "tests/xe_test.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_trace.h"
 #include "xe_vm.h"
 
 MODULE_IMPORT_NS(DMA_BUF);
 
-static int xe_dma_buf_attach(struct dma_buf *dmabuf,
-			     struct dma_buf_attachment *attach)
-{
-	struct drm_gem_object *obj = attach->dmabuf->priv;
-
-	if (attach->peer2peer &&
-	    pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach->dev, false) < 0)
-		attach->peer2peer = false;
-
-	if (!attach->peer2peer && !xe_bo_can_migrate(gem_to_xe_bo(obj), XE_PL_TT))
-		return -EOPNOTSUPP;
-
-	xe_device_mem_access_get(to_xe_device(obj->dev));
-	return 0;
-}
 
 static void xe_dma_buf_detach(struct dma_buf *dmabuf,
 			      struct dma_buf_attachment *attach)
 {
 	struct drm_gem_object *obj = attach->dmabuf->priv;
+	struct xe_bo *bo = gem_to_xe_bo(obj);
+
+	if (attach->importer_priv) {
+		struct drm_gem_object *im_obj = attach->importer_priv;
+		struct xe_bo *im_bo = gem_to_xe_bo(im_obj);
+
+		if (im_bo->flags & XE_BO_XELINK_AVAIL) {
+			xe_link_mapping_put(xe_bo_device(bo));
+			xe_link_mapping_put(xe_bo_device(im_bo));
+		}
+	}
 
 	xe_device_mem_access_put(to_xe_device(obj->dev));
 }
@@ -85,20 +83,29 @@ static void xe_dma_buf_unpin(struct dma_buf_attachment *attach)
 	xe_bo_unpin_external(bo);
 }
 
-static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
-				       enum dma_data_direction dir)
+struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
+				enum dma_data_direction dir)
 {
 	struct dma_buf *dma_buf = attach->dmabuf;
 	struct drm_gem_object *obj = dma_buf->priv;
 	struct xe_bo *bo = gem_to_xe_bo(obj);
 	struct sg_table *sgt;
 	int r = 0;
+	bool xelink_avail = false;
+
+	if (attach->importer_priv) {
+		struct drm_gem_object *im_obj = attach->importer_priv;
+		struct xe_bo *im_bo = gem_to_xe_bo(im_obj);
 
-	if (!attach->peer2peer && !xe_bo_can_migrate(bo, XE_PL_TT))
+		xelink_avail = im_bo->flags & XE_BO_XELINK_AVAIL;
+	}
+
+	if (!attach->peer2peer && !xe_bo_can_migrate(bo, XE_PL_TT) &&
+	    !xelink_avail)
 		return ERR_PTR(-EOPNOTSUPP);
 
 	if (!xe_bo_is_pinned(bo)) {
-		if (!attach->peer2peer)
+		if (!attach->peer2peer && !xelink_avail)
 			r = xe_bo_migrate(bo, XE_PL_TT);
 		else
 			r = xe_bo_validate(bo, NULL, false);
@@ -175,41 +182,12 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 	return 0;
 }
 
-const struct dma_buf_ops xe_dmabuf_ops = {
-	.attach = xe_dma_buf_attach,
-	.detach = xe_dma_buf_detach,
-	.pin = xe_dma_buf_pin,
-	.unpin = xe_dma_buf_unpin,
-	.map_dma_buf = xe_dma_buf_map,
-	.unmap_dma_buf = xe_dma_buf_unmap,
-	.release = drm_gem_dmabuf_release,
-	.begin_cpu_access = xe_dma_buf_begin_cpu_access,
-	.mmap = drm_gem_dmabuf_mmap,
-	.vmap = drm_gem_dmabuf_vmap,
-	.vunmap = drm_gem_dmabuf_vunmap,
-};
-
-struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
-{
-	struct xe_bo *bo = gem_to_xe_bo(obj);
-	struct dma_buf *buf;
-
-	if (bo->vm)
-		return ERR_PTR(-EPERM);
-
-	buf = drm_gem_prime_export(obj, flags);
-	if (!IS_ERR(buf))
-		buf->ops = &xe_dmabuf_ops;
-
-	return buf;
-}
 
 static struct drm_gem_object *
-xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
+xe_dma_buf_init_obj(struct xe_device *xe, struct xe_bo *storage,
 		    struct dma_buf *dma_buf)
 {
 	struct dma_resv *resv = dma_buf->resv;
-	struct xe_device *xe = to_xe_device(dev);
 	struct xe_bo *bo;
 	int ret;
 
@@ -256,6 +234,121 @@ struct dma_buf_test_params {
 	container_of(_priv, struct dma_buf_test_params, base)
 #endif
 
+static int xe_dma_buf_attach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach);
+
+const struct dma_buf_ops xe_dmabuf_ops = {
+	.attach = xe_dma_buf_attach,
+	.detach = xe_dma_buf_detach,
+	.pin = xe_dma_buf_pin,
+	.unpin = xe_dma_buf_unpin,
+	.map_dma_buf = xe_dma_buf_map,
+	.unmap_dma_buf = xe_dma_buf_unmap,
+	.release = drm_gem_dmabuf_release,
+	.begin_cpu_access = xe_dma_buf_begin_cpu_access,
+	.mmap = drm_gem_dmabuf_mmap,
+	.vmap = drm_gem_dmabuf_vmap,
+	.vunmap = drm_gem_dmabuf_vunmap,
+};
+
+/*
+ * update_xelink - check for XeLink connectivity if available
+ * @obj: object to check XeLink connectivity
+ *
+ * If the imported object is a i915 dma-buf, and LMEM based, query to see if
+ * there is a XeLink, and if the XeLink is connected set the XeLink bit.
+ *
+ * 0 no connectivity, use P2P if available
+ * 1 XeLink is available
+ * -1 XeLink only is requested, and there is no XeLink
+ *
+ */
+static int update_xelink(struct dma_buf *dma_buf, struct xe_bo *bo)
+{
+	struct xe_bo *import;
+	struct xe_device *src;
+	struct xe_device *dst;
+	struct query_info *qi;
+	int connected;
+	int i;
+	int n;
+
+	/* Verify that both sides are xe devices */
+	if (dma_buf->ops != &xe_dmabuf_ops || !bo)
+		return 0;
+
+	import = gem_to_xe_bo(dma_buf->priv);
+	if (!xe_bo_is_vram(import))
+		return 0;
+
+	src = xe_bo_device(bo);
+	dst = xe_bo_device(import);
+
+	qi = src->xelink.ops->connectivity_query(src->xelink.handle,
+						 dst->xelink.xelink_id);
+	if (IS_ERR(qi))
+		return 0;
+
+	/*
+	 * Examine the query information.  A zero bandwidth link indicates we
+	 * are NOT connected.
+	 */
+	connected = 1;
+	for (i = 0, n = qi->src_cnt * qi->dst_cnt; i < n && connected; i++)
+		if (!qi->sd2sd[i].bandwidth)
+			connected = 0;
+
+	/* we are responsible for freeing qi */
+	kfree(qi);
+
+	if (connected) {
+		if (xe_link_mapping_get(src))
+			return 0;
+		if (xe_link_mapping_get(dst)) {
+			xe_link_mapping_put(src);
+			return 0;
+		}
+		bo->flags |= XE_BO_XELINK_AVAIL;
+	}
+
+	return connected;
+}
+
+static int xe_dma_buf_attach(struct dma_buf *dmabuf,
+			     struct dma_buf_attachment *attach)
+{
+	struct drm_gem_object *obj = attach->dmabuf->priv;
+	struct xe_bo *bo = gem_to_xe_bo(attach->importer_priv);
+	int xelink;
+
+	xelink = update_xelink(dmabuf, bo);
+
+	if (attach->peer2peer &&
+	    pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach->dev, false) < 0)
+		attach->peer2peer = false;
+
+	trace_xe_dma_buf_attach(gem_to_xe_bo(obj), bo, xelink, attach->peer2peer);
+	if (!xelink && !attach->peer2peer && !xe_bo_can_migrate(gem_to_xe_bo(obj), XE_PL_TT))
+		return -EOPNOTSUPP;
+
+	xe_device_mem_access_get(to_xe_device(obj->dev));
+	return 0;
+}
+
+struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
+{
+	struct xe_bo *bo = gem_to_xe_bo(obj);
+	struct dma_buf *buf;
+
+	if (bo->vm)
+		return ERR_PTR(-EPERM);
+
+	buf = drm_gem_prime_export(obj, flags);
+	if (!IS_ERR(buf))
+		buf->ops = &xe_dmabuf_ops;
+
+	return buf;
+}
+
 struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
 					   struct dma_buf *dma_buf)
 {
@@ -264,6 +357,7 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
 			(xe_cur_kunit_priv(XE_TEST_LIVE_DMA_BUF));)
 	const struct dma_buf_attach_ops *attach_ops;
 	struct dma_buf_attachment *attach;
+	struct xe_device *xe = to_xe_device(dev);
 	struct drm_gem_object *obj;
 	struct xe_bo *bo;
 
@@ -295,26 +389,18 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
 		attach_ops = test->attach_ops;
 #endif
 
-	attach = dma_buf_dynamic_attach(dma_buf, dev->dev, attach_ops, &bo->ttm.base);
-	if (IS_ERR(attach)) {
-		obj = ERR_CAST(attach);
-		goto out_err;
-	}
-
 	/* Errors here will take care of freeing the bo. */
-	obj = xe_dma_buf_init_obj(dev, bo, dma_buf);
+	obj = xe_dma_buf_init_obj(xe, bo, dma_buf);
 	if (IS_ERR(obj))
 		return obj;
 
+	attach = dma_buf_dynamic_attach(dma_buf, dev->dev, attach_ops, &bo->ttm.base);
+	if (IS_ERR(attach))
+		return ERR_CAST(attach);
 
 	get_dma_buf(dma_buf);
 	obj->import_attach = attach;
 	return obj;
-
-out_err:
-	xe_bo_free(bo);
-
-	return obj;
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.h b/drivers/gpu/drm/xe/xe_dma_buf.h
index 861dd28a862c..36771a50451e 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.h
+++ b/drivers/gpu/drm/xe/xe_dma_buf.h
@@ -7,9 +7,12 @@
 #define _XE_DMA_BUF_H_
 
 #include <drm/drm_gem.h>
+#include <linux/dma-direction.h>
 
 struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags);
 struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
 					   struct dma_buf *dma_buf);
+struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
+				enum dma_data_direction dir);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 374ae4289fa0..c8279a97abee 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -37,6 +37,9 @@ static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
 		pte |= XE_GGTT_PTE_DM;
 
+	if (xe_bo_is_vram(bo) || bo->flags & XE_BO_XELINK_AVAIL)
+		pte |= XE_PPGTT_PTE_DM;
+
 	return pte;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_link.c b/drivers/gpu/drm/xe/xe_link.c
index 3ed1113fe348..afd9efa1aa0d 100644
--- a/drivers/gpu/drm/xe/xe_link.c
+++ b/drivers/gpu/drm/xe/xe_link.c
@@ -447,3 +447,15 @@ void xe_link_remove(struct xe_device *xe)
 
 	xe->xelink.ops = &default_ops;
 }
+
+int xe_link_mapping_get(struct xe_device *xe)
+{
+	return xe->xelink.ops->parent_event(xe->xelink.handle,
+					       XELINK_PARENT_MAPPING_GET);
+}
+
+int xe_link_mapping_put(struct xe_device *xe)
+{
+	return xe->xelink.ops->parent_event(xe->xelink.handle,
+					       XELINK_PARENT_MAPPING_PUT);
+}
diff --git a/drivers/gpu/drm/xe/xe_link.h b/drivers/gpu/drm/xe/xe_link.h
index 2d3642166aed..9c81236bce2d 100644
--- a/drivers/gpu/drm/xe/xe_link.h
+++ b/drivers/gpu/drm/xe/xe_link.h
@@ -31,6 +31,8 @@ void xe_link_init_early(struct xe_device *xe);
 void xe_link_init_mmio(struct xe_device *xe);
 void xe_link_init(struct xe_device *xe);
 void xe_link_init_aux(struct xe_device *xe);
+int xe_link_mapping_get(struct xe_device *xe);
+int xe_link_mapping_put(struct xe_device *xe);
 void xe_link_remove(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index de1030a47588..0731cc009689 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -609,6 +609,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	if (is_devmem) {
 		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
 		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
+	} else if (!xe_vma_has_no_bo(vma) && bo->flags & XE_BO_XELINK_AVAIL) {
+		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
 	}
 
 	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 95163c303f3e..2ae9091c7e76 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -105,6 +105,35 @@ DEFINE_EVENT(xe_bo, xe_bo_move,
 	     TP_ARGS(bo)
 );
 
+DECLARE_EVENT_CLASS(xe_dma_buf,
+		    TP_PROTO(struct xe_bo *bo, struct xe_bo *imp_bo, int xelink, int p2p),
+		    TP_ARGS(bo, imp_bo, xelink, p2p),
+
+		    TP_STRUCT__entry(
+			     __field(struct xe_bo *, bo)
+			     __field(struct xe_bo *, imp_bo)
+			     __field(bool, xelink)
+			     __field(bool, p2p)
+			     ),
+
+		    TP_fast_assign(
+			   __entry->bo = bo;
+			   __entry->imp_bo = imp_bo;
+			   __entry->xelink = xelink;
+			   __entry->p2p = p2p;
+			   ),
+
+		    TP_printk("bo=: 0x%p-mem_type=%d, imp_bo: 0x%p-mem_type=%d, xelink=%d, p2p=%d",
+			      __entry->bo, __entry->bo->ttm.resource->mem_type,
+			      __entry->imp_bo, __entry->imp_bo->ttm.resource->mem_type,
+			      __entry->xelink, __entry->p2p)
+);
+
+DEFINE_EVENT(xe_dma_buf, xe_dma_buf_attach,
+	     TP_PROTO(struct xe_bo *bo, struct xe_bo *imp_bo, int xelink, int p2p),
+	     TP_ARGS(bo, imp_bo, xelink, p2p)
+);
+
 DECLARE_EVENT_CLASS(xe_exec_queue,
 		    TP_PROTO(struct xe_exec_queue *q),
 		    TP_ARGS(q),
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 953e5dc0fd80..98baa187dc18 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -410,15 +410,20 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 	 */
 	xe_res_first(res, offset, length, &cursor);
 	for_each_sgtable_sg((*sgt), sg, i) {
-		phys_addr_t phys = cursor.start + tile->mem.vram.io_start;
 		size_t size = cursor.size;
 		dma_addr_t addr;
 
-		addr = dma_map_resource(dev, phys, size, dir,
-					DMA_ATTR_SKIP_CPU_SYNC);
-		r = dma_mapping_error(dev, addr);
-		if (r)
-			goto error_unmap;
+		if (dir == DMA_NONE) {
+			addr = cursor.start + tile->mem.vram.dpa_base;
+		} else {
+			phys_addr_t phys = cursor.start + tile->mem.vram.io_start;
+
+			addr = dma_map_resource(dev, phys, size, dir,
+						DMA_ATTR_SKIP_CPU_SYNC);
+			r = dma_mapping_error(dev, addr);
+			if (r)
+				goto error_unmap;
+		}
 
 		sg_set_page(sg, NULL, size, 0);
 		sg_dma_address(sg) = addr;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2f3df9ee67c9..d9efe4dde4c8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1132,7 +1132,8 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 	pte |= pte_encode_pat_index(xe, pat_index, pt_level);
 	pte |= pte_encode_ps(pt_level);
 
-	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
+	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo) ||
+	    bo->flags & XE_BO_XELINK_AVAIL)
 		pte |= XE_PPGTT_PTE_DM;
 
 	return pte;
-- 
2.38.1

