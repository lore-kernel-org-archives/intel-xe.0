Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA97C27C44
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 00:33:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BF610EEAD;
	Thu, 30 May 2024 00:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZCqFn1DN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBC010F01D
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 00:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717029208; x=1748565208;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oZejvSK2TGpDjfThza4hpWE0zRO5dlS84ksj9DKNjmI=;
 b=ZCqFn1DN+LXZQIoJcU+ymSxHvXmcPZKijCEajAzVfrH7Dq7Mbe/XSKy1
 W2P+A4caL9GThgqxQ/ZIVPsGp3B1qsQAF4k6IBHON3tFFQM4Q4Kysdwc/
 4YnCsmPl88Ze499w/8FIa+rnIQW8x9XfolGmqcKC9eZ6sySC2JdPPG1DM
 8cG5lQm+13b2rYO8BY/EWi83VRX+QO+z06v+iuYK8xPPKdMaH/4e9//Er
 ioH9j/r6wHENhQWw3rWHNKYwmIjWGgkx4U9dBXQVVXe/1Z/mdBA0c/PKZ
 PzJ57zRIPE3L5AyT/BLHJYiMxX2j62377LFM+pc8q++crfM5+ESis/dFb w==;
X-CSE-ConnectionGUID: XqHPIbn0S5Ko7NNxWT+UxQ==
X-CSE-MsgGUID: czwHmkI3TH++uPjkWFje7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="30975377"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="30975377"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 17:33:22 -0700
X-CSE-ConnectionGUID: gxzTRYZCSoWynhowPHiVNQ==
X-CSE-MsgGUID: ehKXL6tjSoGpSjS/PKK4Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40088730"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 17:33:21 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 07/26] drm: move xe_sg_segment_size to drm layer
Date: Wed, 29 May 2024 20:47:13 -0400
Message-Id: <20240530004732.84898-7-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240530004732.84898-1-oak.zeng@intel.com>
References: <20240530004732.84898-1-oak.zeng@intel.com>
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

Move this helper function to drm layer and rename it to
drm_gem_dma_max_sg_segment, so it can be used by the coming
drm patches also. No functional changes.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       |  3 ++-
 drivers/gpu/drm/xe/xe_bo.h       | 24 ------------------------
 drivers/gpu/drm/xe/xe_device.c   |  3 ++-
 drivers/gpu/drm/xe/xe_hmm.c      |  3 ++-
 include/drm/drm_gem_dma_helper.h | 25 +++++++++++++++++++++++++
 5 files changed, 31 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 2bae01ce4e5b..d5823aab9fb8 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -9,6 +9,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_ttm_helper.h>
+#include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
@@ -299,7 +300,7 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
 	ret = sg_alloc_table_from_pages_segment(&xe_tt->sgt, tt->pages,
 						num_pages, 0,
 						(u64)num_pages << PAGE_SHIFT,
-						xe_sg_segment_size(xe_tt->dev),
+						drm_gem_dma_max_sg_segment(xe_tt->dev),
 						GFP_KERNEL);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 6de894c728f5..90261c77ad13 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -289,30 +289,6 @@ void xe_bo_put_commit(struct llist_head *deferred);
 
 struct sg_table *xe_bo_sg(struct xe_bo *bo);
 
-/*
- * xe_sg_segment_size() - Provides upper limit for sg segment size.
- * @dev: device pointer
- *
- * Returns the maximum segment size for the 'struct scatterlist'
- * elements.
- */
-static inline unsigned int xe_sg_segment_size(struct device *dev)
-{
-	struct scatterlist __maybe_unused sg;
-	size_t max = BIT_ULL(sizeof(sg.length) * 8) - 1;
-
-	max = min_t(size_t, max, dma_max_mapping_size(dev));
-
-	/*
-	 * The iommu_dma_map_sg() function ensures iova allocation doesn't
-	 * cross dma segment boundary. It does so by padding some sg elements.
-	 * This can cause overflow, ending up with sg->length being set to 0.
-	 * Avoid this by ensuring maximum segment size is half of 'max'
-	 * rounded down to PAGE_SIZE.
-	 */
-	return round_down(max / 2, PAGE_SIZE);
-}
-
 #define i915_gem_object_flush_if_display(obj)		((void)(obj))
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f04b11e45c2d..a6ef8a769148 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -12,6 +12,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_client.h>
 #include <drm/drm_gem_ttm_helper.h>
+#include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
@@ -407,7 +408,7 @@ static int xe_set_dma_info(struct xe_device *xe)
 	unsigned int mask_size = xe->info.dma_mask_size;
 	int err;
 
-	dma_set_max_seg_size(xe->drm.dev, xe_sg_segment_size(xe->drm.dev));
+	dma_set_max_seg_size(xe->drm.dev, drm_gem_dma_max_sg_segment(xe->drm.dev));
 
 	err = dma_set_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
index 2c32dc46f7d4..f99746c4bd6b 100644
--- a/drivers/gpu/drm/xe/xe_hmm.c
+++ b/drivers/gpu/drm/xe/xe_hmm.c
@@ -3,6 +3,7 @@
  * Copyright © 2024 Intel Corporation
  */
 
+#include <drm/drm_gem_dma_helper.h>
 #include <linux/scatterlist.h>
 #include <linux/mmu_notifier.h>
 #include <linux/dma-mapping.h>
@@ -96,7 +97,7 @@ static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
 	}
 
 	ret = sg_alloc_table_from_pages_segment(st, pages, npages, 0, npages << PAGE_SHIFT,
-						xe_sg_segment_size(dev), GFP_KERNEL);
+						drm_gem_dma_max_sg_segment(dev), GFP_KERNEL);
 	if (ret)
 		goto free_pages;
 
diff --git a/include/drm/drm_gem_dma_helper.h b/include/drm/drm_gem_dma_helper.h
index a827bde494f6..ff7403b103ad 100644
--- a/include/drm/drm_gem_dma_helper.h
+++ b/include/drm/drm_gem_dma_helper.h
@@ -5,6 +5,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_gem.h>
+#include <linux/dma-mapping.h>
 
 struct drm_mode_create_dumb;
 
@@ -133,6 +134,30 @@ static inline int drm_gem_dma_object_mmap(struct drm_gem_object *obj, struct vm_
 	return drm_gem_dma_mmap(dma_obj, vma);
 }
 
+/*
+ * drm_gem_dma_max_sg_segment() - Provides upper limit for sg segment size.
+ * @dev: device pointer
+ *
+ * Returns the maximum segment size for the 'struct scatterlist'
+ * elements.
+ */
+static inline unsigned int drm_gem_dma_max_sg_segment(struct device *dev)
+{
+	struct scatterlist __maybe_unused sg;
+	size_t max = BIT_ULL(sizeof(sg.length) * 8) - 1;
+
+	max = min_t(size_t, max, dma_max_mapping_size(dev));
+
+	/*
+	 * The iommu_dma_map_sg() function ensures iova allocation doesn't
+	 * cross dma segment boundary. It does so by padding some sg elements.
+	 * This can cause overflow, ending up with sg->length being set to 0.
+	 * Avoid this by ensuring maximum segment size is half of 'max'
+	 * rounded down to PAGE_SIZE.
+	 */
+	return round_down(max / 2, PAGE_SIZE);
+}
+
 /*
  * Driver ops
  */
-- 
2.26.3

