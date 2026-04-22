Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C43F9EDC5
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 12:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5686E10E2AA;
	Wed, 22 Apr 2026 12:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LoJa7jS4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADD310E2AA
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Apr 2026 12:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776862783; x=1808398783;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nSsLhb2VmlbehBBBV9TrfGfXcIgSSaRZ4bnrV4hFmYI=;
 b=LoJa7jS412wOFdlZPJMylkEO38O9f0sfeqKKXljTHM7WauAJcHvRLTwt
 g38IvBsW/4xs5Iecb80pi0FTqSi5uzKmeQi+RABgPcBAkBBU3c5FGQYBA
 J2sA7YNb2fpOl8ImkLYyXjalaZoUMXw1zt85GaKtGsv6dAdhV8K3ib3Qp
 f0J2uFAxzQBIH+BipmLx53PHHfNaG1Juq4BJ+hPCISy/UxU8gIg5+kMBh
 fLmK56FD+c/4fKqKYfOb0eEnM4Ze8SamjAuRoqb1Q2l+O2ffxlUw9U1qa
 RtVYm8ixQiQEFJwRThWuM1OS2lzVGUv8+X5UD8DlFbo+J7eRYoNt4B5kN Q==;
X-CSE-ConnectionGUID: pZLvJMcrTHKcVgrvD85k4A==
X-CSE-MsgGUID: ee2Ru+NUQ/2z51EVlE5Eww==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77997247"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="77997247"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 05:59:42 -0700
X-CSE-ConnectionGUID: pruCXTmyQYCkVKfnTu5Big==
X-CSE-MsgGUID: RyNEapzFQXqE+17F/dnbcQ==
X-ExtLoop1: 1
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 05:59:39 -0700
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>
Subject: [PATCH v4] drm/xe: Convert stolen memory over to ttm_range_manager
Date: Wed, 22 Apr 2026 18:25:03 +0530
Message-ID: <20260422125502.3088222-2-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
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

Stolen memory requires physically contiguous allocations for display
scanout and compressed framebuffers. The stolen memory manager was
sharing the gpu_buddy allocator backend with the VRAM manager, but
buddy manages non-contiguous power-of-two blocks making it a poor fit.
Stolen memory also has fundamentally different allocation patterns:

- Allocation sizes are not power-of-two. Since buddy rounds up to the
  next power-of-two block size, a ~17MB request can fail even with
  ~22MB free, because the free space is fragmented across non-fitting
  power-of-two blocks.
- Hardware restrictions prevent using the first 4K page of stolen for
  certain allocations (e.g., FBC). The display code sets fpfn=1 to
  enforce this, but when fpfn != 0, gpu_buddy enables
  GPU_BUDDY_RANGE_ALLOCATION mode which disables the try_harder
  coalescing path, further reducing allocation success.

This combination caused FBC compressed framebuffer (CFB) allocation
failures on platforms like NVL/PTL. In case of NVL where stolen memory
is ~56MB and the initial plane framebuffer consumes ~34MB at probe time,
leaving ~22MB for subsequent allocations.

Use ttm_range_man_init_nocheck() to set up a drm_mm-backed TTM resource
manager for stolen memory. This reuses the TTM core's ttm_range_manager
callbacks, avoiding duplicate implementations.

Tested on NVL with a 4K DP display: stolen_mm shows a single ~22MB
contiguous free hole after initial plane framebuffer allocation, and
FBC successfully allocates its CFB from that region. The corresponding
IGT was previously skipped and now passes.

v2:
- Clarify that stolen memory requires contiguous allocations (Matt B)
- Properly handle xe_ttm_resource_visible() for stolen instead of
  unconditionally returning true (Matt A)

v3:
- Rebase
- Fix xe_display_bo_fbdev_prefer_stolen() to compare in pages, since
  ttm_range_manager stores stolen->size in pages not bytes (Matt A)

v4:
- Add kernel-doc for struct xe_ttm_stolen_mgr (Matt B)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7631
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Acked-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display_bo.c |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                 | 16 ++++--
 drivers/gpu/drm/xe/xe_device_types.h       |  3 +
 drivers/gpu/drm/xe/xe_res_cursor.h         | 14 ++++-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c     | 64 ++++++++--------------
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h     | 12 ++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 11 ++--
 7 files changed, 67 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.c b/drivers/gpu/drm/xe/display/xe_display_bo.c
index dc0d78ff2d79..7fbac223b097 100644
--- a/drivers/gpu/drm/xe/display/xe_display_bo.c
+++ b/drivers/gpu/drm/xe/display/xe_display_bo.c
@@ -138,7 +138,7 @@ bool xe_display_bo_fbdev_prefer_stolen(struct xe_device *xe, unsigned int size)
 	 * important and we should probably use that space with FBC or other
 	 * features.
 	 */
-	return stolen->size >= size * 2;
+	return stolen->size >= (size * 2) >> PAGE_SHIFT;
 }
 
 static struct drm_gem_object *xe_display_bo_fbdev_create(struct drm_device *drm, int size)
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5ce60d161e09..62850b6f684b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -586,11 +586,17 @@ static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
 	kfree(tt);
 }
 
-static bool xe_ttm_resource_visible(struct ttm_resource *mem)
+static bool xe_ttm_resource_visible(struct xe_device *xe, struct ttm_resource *mem)
 {
-	struct xe_ttm_vram_mgr_resource *vres =
-		to_xe_ttm_vram_mgr_resource(mem);
+	struct xe_ttm_vram_mgr_resource *vres;
 
+	if (mem->mem_type == XE_PL_STOLEN) {
+		struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
+
+		return mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe);
+	}
+
+	vres = to_xe_ttm_vram_mgr_resource(mem);
 	return vres->used_visible_size == mem->size;
 }
 
@@ -608,7 +614,7 @@ bool xe_bo_is_visible_vram(struct xe_bo *bo)
 	if (drm_WARN_ON(bo->ttm.base.dev, !xe_bo_is_vram(bo)))
 		return false;
 
-	return xe_ttm_resource_visible(bo->ttm.resource);
+	return xe_ttm_resource_visible(xe_bo_device(bo), bo->ttm.resource);
 }
 
 static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
@@ -624,7 +630,7 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 	case XE_PL_VRAM1: {
 		struct xe_vram_region *vram = xe_map_resource_to_region(mem);
 
-		if (!xe_ttm_resource_visible(mem))
+		if (!xe_ttm_resource_visible(xe, mem))
 			return -EINVAL;
 
 		mem->bus.offset = mem->start << PAGE_SHIFT;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 89437de3001a..32dd2ffbc796 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -42,6 +42,7 @@ struct xe_ggtt;
 struct xe_i2c;
 struct xe_pat_ops;
 struct xe_pxp;
+struct xe_ttm_stolen_mgr;
 struct xe_vram_region;
 
 /**
@@ -276,6 +277,8 @@ struct xe_device {
 		struct ttm_resource_manager sys_mgr;
 		/** @mem.shrinker: system memory shrinker. */
 		struct xe_shrinker *shrinker;
+		/** @mem.stolen_mgr: stolen memory manager. */
+		struct xe_ttm_stolen_mgr *stolen_mgr;
 	} mem;
 
 	/** @sriov: device level virtualization data */
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index 5f4ab08c0686..0522caafd89d 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -101,7 +101,15 @@ static inline void xe_res_first(struct ttm_resource *res,
 	cur->mem_type = res->mem_type;
 
 	switch (cur->mem_type) {
-	case XE_PL_STOLEN:
+	case XE_PL_STOLEN: {
+		/* res->start is in pages (ttm_range_manager). */
+		cur->start = (res->start << PAGE_SHIFT) + start;
+		cur->size = size;
+		cur->remaining = size;
+		cur->node = NULL;
+		cur->mm = NULL;
+		break;
+	}
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1: {
 		struct gpu_buddy_block *block;
@@ -289,6 +297,10 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
 
 	switch (cur->mem_type) {
 	case XE_PL_STOLEN:
+		/* Just advance within the contiguous region. */
+		cur->start += size;
+		cur->size = cur->remaining;
+		break;
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1:
 		start = size - cur->size;
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 27c9d72222cf..5e9070739e65 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -19,30 +19,11 @@
 #include "xe_device.h"
 #include "xe_gt_printk.h"
 #include "xe_mmio.h"
-#include "xe_res_cursor.h"
 #include "xe_sriov.h"
 #include "xe_ttm_stolen_mgr.h"
-#include "xe_ttm_vram_mgr.h"
 #include "xe_vram.h"
 #include "xe_wa.h"
 
-struct xe_ttm_stolen_mgr {
-	struct xe_ttm_vram_mgr base;
-
-	/* PCI base offset */
-	resource_size_t io_base;
-	/* GPU base offset */
-	resource_size_t stolen_base;
-
-	void __iomem *mapping;
-};
-
-static inline struct xe_ttm_stolen_mgr *
-to_stolen_mgr(struct ttm_resource_manager *man)
-{
-	return container_of(man, struct xe_ttm_stolen_mgr, base.manager);
-}
-
 /**
  * xe_ttm_stolen_cpu_access_needs_ggtt() - If we can't directly CPU access
  * stolen, can we then fallback to mapping through the GGTT.
@@ -210,12 +191,19 @@ static u64 detect_stolen(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 #endif
 }
 
+static void xe_ttm_stolen_mgr_fini(struct drm_device *dev, void *arg)
+{
+	struct xe_device *xe = to_xe_device(dev);
+
+	ttm_range_man_fini_nocheck(&xe->ttm, XE_PL_STOLEN);
+}
+
 int xe_ttm_stolen_mgr_init(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct xe_ttm_stolen_mgr *mgr;
 	u64 stolen_size, io_size;
-	int err;
+	int ret;
 
 	mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
 	if (!mgr)
@@ -244,12 +232,12 @@ int xe_ttm_stolen_mgr_init(struct xe_device *xe)
 	if (mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe))
 		io_size = stolen_size;
 
-	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, stolen_size,
-				     io_size, PAGE_SIZE);
-	if (err) {
-		drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
-		return err;
-	}
+	ret = ttm_range_man_init_nocheck(&xe->ttm, XE_PL_STOLEN, false,
+					 stolen_size >> PAGE_SHIFT);
+	if (ret)
+		return ret;
+
+	xe->mem.stolen_mgr = mgr;
 
 	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
 		    stolen_size);
@@ -257,36 +245,32 @@ int xe_ttm_stolen_mgr_init(struct xe_device *xe)
 	if (io_size)
 		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, io_size);
 
-	return 0;
+	return drmm_add_action_or_reset(&xe->drm, xe_ttm_stolen_mgr_fini, mgr);
 }
 
 u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
 {
 	struct xe_device *xe = xe_bo_device(bo);
-	struct ttm_resource_manager *ttm_mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
-	struct xe_ttm_stolen_mgr *mgr = to_stolen_mgr(ttm_mgr);
-	struct xe_res_cursor cur;
+	struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
 
 	XE_WARN_ON(!mgr->io_base);
 
 	if (xe_ttm_stolen_cpu_access_needs_ggtt(xe))
 		return mgr->io_base + xe_bo_ggtt_addr(bo) + offset;
 
-	xe_res_first(bo->ttm.resource, offset, 4096, &cur);
-	return mgr->io_base + cur.start;
+	/* Range allocator: res->start is in pages. */
+	return mgr->io_base + (bo->ttm.resource->start << PAGE_SHIFT) + offset;
 }
 
 static int __xe_ttm_stolen_io_mem_reserve_bar2(struct xe_device *xe,
 					       struct xe_ttm_stolen_mgr *mgr,
 					       struct ttm_resource *mem)
 {
-	struct xe_res_cursor cur;
-
 	if (!mgr->io_base)
 		return -EIO;
 
-	xe_res_first(mem, 0, 4096, &cur);
-	mem->bus.offset = cur.start;
+	/* Range allocator always produces contiguous allocations. */
+	mem->bus.offset = mem->start << PAGE_SHIFT;
 
 	drm_WARN_ON(&xe->drm, !(mem->placement & TTM_PL_FLAG_CONTIGUOUS));
 
@@ -329,8 +313,7 @@ static int __xe_ttm_stolen_io_mem_reserve_stolen(struct xe_device *xe,
 
 int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem)
 {
-	struct ttm_resource_manager *ttm_mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
-	struct xe_ttm_stolen_mgr *mgr = ttm_mgr ? to_stolen_mgr(ttm_mgr) : NULL;
+	struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
 
 	if (!mgr || !mgr->io_base)
 		return -EIO;
@@ -343,8 +326,5 @@ int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem)
 
 u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe)
 {
-	struct xe_ttm_stolen_mgr *mgr =
-		to_stolen_mgr(ttm_manager_type(&xe->ttm, XE_PL_STOLEN));
-
-	return mgr->stolen_base;
+	return xe->mem.stolen_mgr->stolen_base;
 }
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
index 8e877d1e839b..32badaee9c88 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
@@ -12,6 +12,18 @@ struct ttm_resource;
 struct xe_bo;
 struct xe_device;
 
+/**
+ * struct xe_ttm_stolen_mgr - Xe TTM stolen memory manager
+ */
+struct xe_ttm_stolen_mgr {
+	/** @io_base: PCI base offset for CPU I/O access */
+	resource_size_t io_base;
+	/** @stolen_base: GPU base offset */
+	resource_size_t stolen_base;
+	/** @mapping: I/O memory mapping for CPU access */
+	void __iomem *mapping;
+};
+
 int xe_ttm_stolen_mgr_init(struct xe_device *xe);
 int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem);
 bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 5fd0d5506a7e..79ef8e1b5e5c 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -301,14 +301,13 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 			   u64 default_page_size)
 {
 	struct ttm_resource_manager *man = &mgr->manager;
+	const char *name;
 	int err;
 
-	if (mem_type != XE_PL_STOLEN) {
-		const char *name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
-		man->cg = drmm_cgroup_register_region(&xe->drm, name, size);
-		if (IS_ERR(man->cg))
-			return PTR_ERR(man->cg);
-	}
+	name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
+	man->cg = drmm_cgroup_register_region(&xe->drm, name, size);
+	if (IS_ERR(man->cg))
+		return PTR_ERR(man->cg);
 
 	man->func = &xe_ttm_vram_mgr_func;
 	mgr->mem_type = mem_type;
-- 
2.52.0

