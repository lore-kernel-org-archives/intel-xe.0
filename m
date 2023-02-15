Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE05C636D4
	for <intel-xe@archiver.kernel.org>; Wed, 15 Feb 2023 10:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFB110EA95;
	Wed, 15 Feb 2023 10:30:40 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A05110EA91
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Feb 2023 10:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676457037; x=1707993037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E1HnsaxOMTkWZud6Veh7vaVc6OmnEYivt6w9aleqNNw=;
 b=aCNvpyj9/U1WgKPehkf6AEkIqhl9I68diAaXi5ZPhbDzJ0w4frCGP0Rf
 t7xvKI7DQU5gDNdUVdZH0tq/jWUZgsum8H4lRnzkbaYBijsOagI3w6JO9
 bi7T2t2PKtSiyFCHZahSo0P8mb7mkPB0gQFVm4TQyCwfRBdSsdp3U4vJb
 VAjbkN4fb9uNF3Q+kH7vSafTm6TV0Q/wBfx1lcuktH48IyzmKhVvjbOdr
 08HjjR6hd/tpeP2B5zJW52EthL5eChjCbqzhmeLGa1HX/Tz6CPgc62re7
 YlyhpKaLFuenGtjG8Yz3SeT8JiwtkzOoJDiYVj15UozJOqHdlzLWRHhIv w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="311758968"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="311758968"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 02:30:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="758352302"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="758352302"
Received: from merinomx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.18.230])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 02:30:08 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Feb 2023 10:28:44 +0000
Message-Id: <20230215102845.278677-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215102845.278677-1-matthew.auld@intel.com>
References: <20230215102845.278677-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/3] drm/xe/stolen: don't map stolen on
 small-bar
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The driver should still be functional with small-bar, just that the vram
size is clamped to the BAR size (until we add proper support for tiered
vram). For stolen vram we shouldn't iomap anything if the BAR size
doesn't also contain the stolen portion, since on discrete the stolen
portion is always at the end of normal vram. Stolen should still be
functional, just that allocating CPU visible io memory will always
return an error.

v2 (Lucas)
  - Mention in the commit message that stolen vram is always as the end
    of normal vram, which is why stolen in not mappable on small-bar
    systems.
  - Just make xe_ttm_stolen_inaccessible() return true for such cases.
    Also rename to xe_ttm_stolen_cpu_inaccessible to better describe
    that we are talking about direct CPU access. Plus add some
    kernel-doc.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/209
Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c             |  2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 47 +++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h |  2 +-
 3 files changed, 37 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9b7b9c8f84be..4173c1418b63 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1149,7 +1149,7 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_gt *gt,
 	u64 end = offset == ~0ull ? offset : start + size;
 
 	if (flags & XE_BO_CREATE_STOLEN_BIT &&
-	    xe_ttm_stolen_inaccessible(xe))
+	    xe_ttm_stolen_cpu_inaccessible(xe))
 		flags |= XE_BO_CREATE_GGTT_BIT;
 
 	bo = xe_bo_create_locked_range(xe, gt, vm, size, start, end, type, flags);
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index b4e9c88644e4..e20c567f276f 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -21,11 +21,6 @@
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_vram_mgr.h"
 
-bool xe_ttm_stolen_inaccessible(struct xe_device *xe)
-{
-	return !IS_DGFX(xe) && GRAPHICS_VERx100(xe) < 1270;
-}
-
 struct xe_ttm_stolen_mgr {
 	struct xe_ttm_vram_mgr base;
 
@@ -43,6 +38,34 @@ to_stolen_mgr(struct ttm_resource_manager *man)
 	return container_of(man, struct xe_ttm_stolen_mgr, base.manager);
 }
 
+/**
+ * xe_ttm_stolen_cpu_inaccessible - Can we directly CPU access stolen memory for
+ * this device.
+ *
+ * On some integrated platforms we can't directly access stolen via the CPU
+ * (like some normal system memory).  Also on small-bar systems for discrete,
+ * since stolen is always as the end of normal VRAM, and the BAR likely doesn't
+ * stretch that far. However CPU access of stolen is generally rare, and at
+ * least on discrete should not be needed.
+ *
+ * If this is indeed inaccessible then we fallback to using the GGTT mappable
+ * aperture for CPU access. On discrete platforms we have no such thing, so when
+ * later attempting to CPU map the memory an error is instead thrown.
+ */
+bool xe_ttm_stolen_cpu_inaccessible(struct xe_device *xe)
+{
+	struct ttm_resource_manager *ttm_mgr =
+		ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
+	struct xe_ttm_stolen_mgr *mgr;
+
+	if (!ttm_mgr)
+		return true;
+
+	mgr = to_stolen_mgr(ttm_mgr);
+
+	return !mgr->io_base || GRAPHICS_VERx100(xe) < 1270;
+}
+
 static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -126,7 +149,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 
 	if (IS_DGFX(xe))
 		stolen_size = detect_bar2_dgfx(xe, mgr);
-	else if (!xe_ttm_stolen_inaccessible(xe))
+	else if (GRAPHICS_VERx100(xe) >= 1270)
 		stolen_size = detect_bar2_integrated(xe, mgr);
 	else
 		stolen_size = detect_stolen(xe, mgr);
@@ -140,7 +163,6 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 	if (pgsize < PAGE_SIZE)
 		pgsize = PAGE_SIZE;
 
-
 	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, stolen_size, pgsize);
 	if (err) {
 		drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
@@ -150,7 +172,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
 		    stolen_size);
 
-	if (!xe_ttm_stolen_inaccessible(xe))
+	if (!xe_ttm_stolen_cpu_inaccessible(xe))
 		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, stolen_size);
 }
 
@@ -161,10 +183,9 @@ u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
 	struct xe_ttm_stolen_mgr *mgr = to_stolen_mgr(ttm_mgr);
 	struct xe_res_cursor cur;
 
-	if (!mgr->io_base)
-		return 0;
+	XE_BUG_ON(!mgr->io_base);
 
-	if (!IS_DGFX(xe) && xe_ttm_stolen_inaccessible(xe))
+	if (!IS_DGFX(xe) && xe_ttm_stolen_cpu_inaccessible(xe))
 		return mgr->io_base + xe_bo_ggtt_addr(bo) + offset;
 
 	xe_res_first(bo->ttm.resource, offset, 4096, &cur);
@@ -202,6 +223,8 @@ static int __xe_ttm_stolen_io_mem_reserve_stolen(struct xe_device *xe,
 #ifdef CONFIG_X86
 	struct xe_bo *bo = ttm_to_xe_bo(mem->bo);
 
+	XE_BUG_ON(IS_DGFX(xe));
+
 	/* XXX: Require BO to be mapped to GGTT? */
 	if (drm_WARN_ON(&xe->drm, !(bo->flags & XE_BO_CREATE_GGTT_BIT)))
 		return -EIO;
@@ -228,7 +251,7 @@ int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem)
 	if (!mgr || !mgr->io_base)
 		return -EIO;
 
-	if (!xe_ttm_stolen_inaccessible(xe))
+	if (!xe_ttm_stolen_cpu_inaccessible(xe))
 		return __xe_ttm_stolen_io_mem_reserve_bar2(xe, mgr, mem);
 	else
 		return __xe_ttm_stolen_io_mem_reserve_stolen(xe, mgr, mem);
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
index ade37abb0623..2fda97b97a05 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
@@ -14,7 +14,7 @@ struct xe_device;
 
 void xe_ttm_stolen_mgr_init(struct xe_device *xe);
 int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem);
-bool xe_ttm_stolen_inaccessible(struct xe_device *xe);
+bool xe_ttm_stolen_cpu_inaccessible(struct xe_device *xe);
 u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset);
 u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe);
 
-- 
2.39.1

