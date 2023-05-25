Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCF8C77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 19:35:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469BE10E034;
	Thu, 25 May 2023 19:35:38 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E908A10E034
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 19:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685043335; x=1716579335;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UgVV6imh9GPnkHMzP3ELENF735rwMS7W4RCKZ9OggKQ=;
 b=Dtmicm8j/8N9+lRT6NPhtyetu7DqxzSIiSbxO6c6XWoJ0/uVuWcBqCuC
 wV1tYn6d5JmEhfux2ax9KrnxruDF2pdY476SI/Dvwhi+a67GJ3JcPVW7b
 t3CwSbKy/WMu7C5whfpMavd8oZHBfsEztUHkfzVS1h8IrD++3uLTyteM4
 aNLD21f2VJNWLbd3j/sPzmeHar8ZOR2JEvkVU951up4lr0BCVkaw9RMX/
 9JWBbXm1+wuTgsxDm0QzJmwyvpsZefaI1uWo0g2iQYekvrI09dEUMRYjs
 8UJM4Fg/zyOyS6M3J7Iy9KcJbs0RSFjjN28v6L8pNeE6qwWJFy06s9kdn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="419747123"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="419747123"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 12:35:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="708122082"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="708122082"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 12:35:33 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 12:35:28 -0700
Message-Id: <20230525193528.25251-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: Apply upper limit to sg element size
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
Cc: thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The iommu_dma_map_sg() function ensures iova allocation doesn't
cross dma segment boundary. It does so by padding some sg elements.
This can cause overflow, ending up with sg->length being set to 0.
Avoid this by halving the maximum segment size (rounded down to
PAGE_SIZE).

Specify maximum segment size for sg elements by using
sg_alloc_table_from_pages_segment() to allocate sg_table.

v2: Use correct max segment size in dma_set_max_seg_size() call

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c   |  8 +++++---
 drivers/gpu/drm/xe/xe_bo.h   | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.c |  7 ++-----
 drivers/gpu/drm/xe/xe_vm.c   |  8 +++++---
 4 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c82e995df779..21c5aca424dd 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -251,9 +251,11 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
 	if (xe_tt->sg)
 		return 0;
 
-	ret = sg_alloc_table_from_pages(&xe_tt->sgt, tt->pages, num_pages,
-					0, (u64)num_pages << PAGE_SHIFT,
-					GFP_KERNEL);
+	ret = sg_alloc_table_from_pages_segment(&xe_tt->sgt, tt->pages,
+						num_pages, 0,
+						(u64)num_pages << PAGE_SHIFT,
+						xe_sg_segment_size(xe_tt->dev),
+						GFP_KERNEL);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 7e111332c35a..a1c51cc0ac3c 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -296,6 +296,27 @@ void xe_bo_put_commit(struct llist_head *deferred);
 
 struct sg_table *xe_bo_get_sg(struct xe_bo *bo);
 
+/*
+ * xe_sg_segment_size() - Provides upper limit for sg segment size.
+ * @dev: device pointer
+ *
+ * Returns the maximum segment size for the 'struct scatterlist'
+ * elements.
+ */
+static inline unsigned int xe_sg_segment_size(struct device *dev)
+{
+	size_t max = min_t(size_t, UINT_MAX, dma_max_mapping_size(dev));
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
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index c7fbb1cc1f64..4c270a07136e 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -11,6 +11,7 @@
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
@@ -26,11 +27,7 @@ static int xe_set_dma_info(struct xe_device *xe)
 	unsigned int mask_size = xe->info.dma_mask_size;
 	int err;
 
-	/*
-	 * We don't have a max segment size, so set it to the max so sg's
-	 * debugging layer doesn't complain
-	 */
-	dma_set_max_seg_size(xe->drm.dev, UINT_MAX);
+	dma_set_max_seg_size(xe->drm.dev, xe_sg_segment_size(xe->drm.dev));
 
 	err = dma_set_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a0306526b269..4d9c8de8b348 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -117,9 +117,11 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 	if (ret)
 		goto out;
 
-	ret = sg_alloc_table_from_pages(&vma->userptr.sgt, pages, pinned,
-					0, (u64)pinned << PAGE_SHIFT,
-					GFP_KERNEL);
+	ret = sg_alloc_table_from_pages_segment(&vma->userptr.sgt, pages,
+						pinned, 0,
+						(u64)pinned << PAGE_SHIFT,
+						xe_sg_segment_size(xe->drm.dev),
+						GFP_KERNEL);
 	if (ret) {
 		vma->userptr.sg = NULL;
 		goto out;
-- 
2.21.0.rc0.32.g243a4c7e27

