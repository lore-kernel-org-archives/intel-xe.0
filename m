Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92CBC001DE
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 16:45:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F36F10E3B8;
	Tue,  8 Aug 2023 16:45:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E4110E3B8
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 16:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691513150; x=1723049150;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=IxOtqjenuGTqgm2pbkAoPi2ijDRyCguSURUCjAZTlHU=;
 b=Vg1E5yPniC+1e4HPw9S6gqVCjpkLEcBFmCQqpx9mB7V/Zz54Rqi8cazD
 zpbMIQMYHbw3gCNjl7VTYJk63rmNnpvQXSaKHe9vUChEMsidsLwYESRmD
 tlg5CpeIkZUgGYTRWNB95DRQHziq53ddEqooXt0euN6ivaOyeSl/ySYyY
 Y06ZHuSh/wWv9F8QTRsTqN9ky46nGrm1JnsyUOmkUbzMQDJQQBx5DGt9y
 B+F26tYWu/AEquAntxhKObfseQwv6PI2cYq13nGtKdxkVTQwLh4ODhfd8
 zvImlH4omEhmN1kIZzNbFSnSZCoL/teQaKO/ku1Pel6QsJoZwfl38oRhP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="457267563"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="457267563"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 09:45:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="766431672"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="766431672"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 09:45:45 -0700
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com, matthew.brost@intel.com
Date: Tue,  8 Aug 2023 12:45:34 -0400
Message-Id: <20230808164534.1027552-4-david.kershner@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230808164534.1027552-1-david.kershner@intel.com>
References: <20230808164534.1027552-1-david.kershner@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: Teach i915 how to use objects with
 XeLink connectivity
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
 drivers/gpu/drm/xe/xe_bo.c      |  47 ++++++++-
 drivers/gpu/drm/xe/xe_bo.h      |   2 +
 drivers/gpu/drm/xe/xe_dma_buf.c | 162 +++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_dma_buf.h |   3 +
 drivers/gpu/drm/xe/xe_pt.c      |   7 +-
 drivers/gpu/drm/xe/xe_xelink.c  |  12 +++
 drivers/gpu/drm/xe/xe_xelink.h  |   2 +
 7 files changed, 186 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 284c86107a5f..f48e917b3e28 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -8,6 +8,7 @@
 #include <linux/dma-buf.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
@@ -524,6 +525,32 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
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
@@ -540,6 +567,7 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 	struct xe_ttm_tt *xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt,
 					       ttm);
 	struct sg_table *sg;
+	struct xe_bo *bo;
 
 	XE_WARN_ON(!attach);
 	XE_WARN_ON(!ttm_bo->ttm);
@@ -547,12 +575,27 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 	if (new_res->mem_type == XE_PL_SYSTEM)
 		goto out;
 
+	bo = ttm_to_xe_bo(ttm_bo);
 	if (ttm_bo->sg) {
-		dma_buf_unmap_attachment(attach, ttm_bo->sg, DMA_BIDIRECTIONAL);
+		if (bo->flags & XE_BO_XELINK_AVAIL) {
+			struct xe_bo *export;
+			//export = dma_buf_to_obj(attach->dmabuf);
+			export = gem_to_xe_bo(attach->dmabuf->priv);
+			xe_xelink_mapping_put(to_xe_device(export->ttm.base.dev)); // don't do?
+			xe_xelink_mapping_put(to_xe_device(ttm_bo->base.dev)); // don't do?
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
index 0823dda0f31b..d7bf00c52c29 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -33,6 +33,8 @@
 #define XE_BO_FIXED_PLACEMENT_BIT	BIT(11)
 #define XE_BO_PAGETABLE			BIT(12)
 #define XE_BO_NEEDS_CPU_ACCESS		BIT(13)
+#define XE_BO_XELINK_AVAIL		BIT(14)
+
 /* this one is trigger internally only */
 #define XE_BO_INTERNAL_TEST		BIT(30)
 #define XE_BO_INTERNAL_64K		BIT(31)
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 975dee1f770f..e511b09b8556 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -11,6 +11,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_prime.h>
+#include <drm/intel_xelink_platform.h>
 #include <drm/ttm/ttm_tt.h>
 
 #include "tests/xe_test.h"
@@ -21,21 +22,6 @@
 
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
@@ -68,8 +54,8 @@ static void xe_dma_buf_unpin(struct dma_buf_attachment *attach)
 	xe_bo_unpin_external(bo);
 }
 
-static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
-				       enum dma_data_direction dir)
+struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
+				enum dma_data_direction dir)
 {
 	struct dma_buf *dma_buf = attach->dmabuf;
 	struct drm_gem_object *obj = dma_buf->priv;
@@ -160,34 +146,6 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
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
 xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
@@ -240,6 +198,120 @@ struct dma_buf_test_params {
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
+	if (dma_buf->ops != &xe_dmabuf_ops ||
+	    !bo || bo->ttm.base.import_attach->importer_ops != &xe_dma_buf_attach_ops)
+		return 0;
+
+	import = gem_to_xe_bo(dma_buf->priv);
+	if (!xe_bo_is_vram(import))
+		return 0;
+
+	src = xe_bo_device(bo);
+	dst = xe_bo_device(import);
+
+	qi = src->intel_xelink.ops->connectivity_query(src->intel_xelink.handle,
+						       dst->intel_xelink.xelink_id);
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
+		if (xe_xelink_mapping_get(src))
+			return 0;
+		if (xe_xelink_mapping_get(dst)) {
+			xe_xelink_mapping_put(src);
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
+	int xelink;
+
+	xelink = update_xelink(dmabuf, attach->importer_priv);
+
+	if (attach->peer2peer &&
+	    pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach->dev, false) < 0)
+		attach->peer2peer = false;
+
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
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 5709518e314b..2c8698216581 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -130,6 +130,10 @@ u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
 	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
 		pte |= XE_PPGTT_PTE_DM;
 
+/* DAK */
+	if (xe_bo_is_vram(bo) || bo->flags & XE_BO_XELINK_AVAIL)
+		pte |= XE_PPGTT_PTE_DM;
+
 	return __pte_encode(pte, cache, NULL, pt_level);
 }
 
@@ -144,8 +148,7 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
 	if (level == 0) {
 		u64 empty = xe_pte_encode(vm->scratch_bo[id], 0,
 					  XE_CACHE_WB, 0);
-
-		return empty;
+return empty;
 	} else {
 		return xe_pde_encode(vm->scratch_pt[id][level - 1]->bo, 0,
 				     XE_CACHE_WB);
diff --git a/drivers/gpu/drm/xe/xe_xelink.c b/drivers/gpu/drm/xe/xe_xelink.c
index ac4cff76f81d..00bebad1c899 100644
--- a/drivers/gpu/drm/xe/xe_xelink.c
+++ b/drivers/gpu/drm/xe/xe_xelink.c
@@ -462,3 +462,15 @@ void xe_xelink_remove(struct xe_device *xe)
 
 	xe->intel_xelink.ops = &default_ops;
 }
+
+int xe_xelink_mapping_get(struct xe_device *xe)
+{
+	return xe->intel_xelink.ops->parent_event(xe->intel_xelink.handle,
+					       XELINK_PARENT_MAPPING_GET);
+}
+
+int xe_xelink_mapping_put(struct xe_device *xe)
+{
+	return xe->intel_xelink.ops->parent_event(xe->intel_xelink.handle,
+					       XELINK_PARENT_MAPPING_PUT);
+}
diff --git a/drivers/gpu/drm/xe/xe_xelink.h b/drivers/gpu/drm/xe/xe_xelink.h
index e17faacc7b1c..12feb5b04d23 100644
--- a/drivers/gpu/drm/xe/xe_xelink.h
+++ b/drivers/gpu/drm/xe/xe_xelink.h
@@ -31,6 +31,8 @@ void xe_xelink_init_early(struct xe_device *xe);
 void xe_xelink_init_mmio(struct xe_device *xe);
 void xe_xelink_init(struct xe_device *xe);
 void xe_xelink_init_aux(struct xe_device *xe);
+int xe_xelink_mapping_get(struct xe_device *xe);
+int xe_xelink_mapping_put(struct xe_device *xe);
 void xe_xelink_remove(struct xe_device *xe);
 
 #endif
-- 
2.35.1

