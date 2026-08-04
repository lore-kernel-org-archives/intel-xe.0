Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20195C55838
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 16:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31C810EB33;
	Tue,  4 Aug 2026 16:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXEdxMZP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577D810E109
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 16:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785862266; x=1817398266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FcRIAHwBctHcwnV75HUDxELkr+OOI6TELqublq5tJIs=;
 b=LXEdxMZP37WTZGTyl51N9dp88pvP0cyAfcAisZmdbd/dKZfbWiqVC609
 jZlI6h1NRRX+ukZOfdLFj+8AC63NHyb+9O76/ZZVrTN+bgefKcoFUPRkI
 sHQprzVUogDrl+R11PmTQNS5PnPNvNluxbgC5AY2HSu+kQUjw722BHJiW
 jAphZS1ts9VAbcKAjppz6Pl7PQ4o7b3tvr5CmMLoH83lZKsUKYinriLo9
 gke3NW0qvGgbZStO4xGaKfef9j8JNu6rGQIrNcWjLJ6P+qc1+71+gdxtw
 Rt9jM2T9g+t4+0PgrSeA8EFym94IqfJ9sSbRMCLsR6BfTeij6SiH3P8f7 Q==;
X-CSE-ConnectionGUID: /fQp2Fi/QpO0I/IuPUGqMg==
X-CSE-MsgGUID: 6rgpT4+jRBW2rsqVNgUaOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97925417"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="97925417"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 09:51:06 -0700
X-CSE-ConnectionGUID: K9vpZRsoSWaw0XcO1160XA==
X-CSE-MsgGUID: Z9y41QM+QUqBMGmXCSTeEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="265063686"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.44])
 by orviesa003.jf.intel.com with ESMTP; 04 Aug 2026 09:51:07 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, stable@vger.kernel.org
Subject: [PATCH v8 1/3] drm/xe/guc_ads: allocate UM queues in a separate BO
Date: Tue,  4 Aug 2026 16:50:55 +0000
Message-ID: <20260804165057.129529-2-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804165057.129529-1-jia.yao@intel.com>
References: <20260804165057.129529-1-jia.yao@intel.com>
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

Move the UM queues into a dedicated UC BO (ads->um_queue_bo) and avoid
CPU memset operations on it, which eliminates the CPU as a potential
cacheline-polluting agent and helps maintain consistency between GAM
writes and GuC reads.

Fixes: 9c57bc08652a ("drm/xe/lnl: Drop force_probe requirement")
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: <stable@vger.kernel.org> # v6.12+
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h            | 14 +++++
 drivers/gpu/drm/xe/xe_guc.c           |  6 ++
 drivers/gpu/drm/xe/xe_guc_ads.c       | 90 +++++++++++++++++----------
 drivers/gpu/drm/xe/xe_guc_ads_types.h |  5 ++
 4 files changed, 83 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 7ae1d9ac0574..57039cf42ea7 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -6,6 +6,7 @@
 #ifndef _XE_BO_H_
 #define _XE_BO_H_
 
+#include <drm/drm_prime.h>
 #include <drm/ttm/ttm_tt.h>
 
 #include "xe_bo_types.h"
@@ -548,6 +549,19 @@ void xe_bo_dev_fini(struct xe_bo_dev *bo_device);
 
 struct sg_table *xe_bo_sg(struct xe_bo *bo);
 
+/**
+ * xe_bo_sg_is_contiguous() - Check if a BO's DMA address space is contiguous.
+ * @bo: the BO to check (must have a valid sg table, i.e. !xe_bo_is_vram())
+ * @len: required contiguous length in bytes
+ *
+ * Returns true if the first @len bytes of the BO are mapped to a contiguous
+ * DMA address range.
+ */
+static inline bool xe_bo_sg_is_contiguous(struct xe_bo *bo, size_t len)
+{
+	return drm_prime_get_contiguous_size(xe_bo_sg(bo)) >= len;
+}
+
 /*
  * xe_sg_segment_size() - Provides upper limit for sg segment size.
  * @dev: device pointer
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 4286bd05c686..4f132bf8539d 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -732,6 +732,12 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
+	if (guc->ads.um_queue_bo) {
+		ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.um_queue_bo);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index f0ac00586d3a..f8c679cef003 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -64,10 +64,14 @@ ads_to_map(struct xe_guc_ads *ads)
 
 /*
  * The Additional Data Struct (ADS) has pointers for different buffers used by
- * the GuC. One single gem object contains the ADS struct itself (guc_ads) and
- * all the extra buffers indirectly linked via the ADS struct's entries.
+ * the GuC. One gem object (ads->bo) contains the ADS struct itself (guc_ads)
+ * and most of the extra buffers linked via the ADS struct's entries.  The UM
+ * fault queues (PAGE_FAULT, PAGE_FAULT_RESPONSE, ACCESS_COUNTER rings) are
+ * kept in a separate BO (ads->um_queue_bo) so that the full memset of ads->bo
+ * performed on every GT reset does not discard fault descriptors already
+ * written into the rings by the GPU.
  *
- * Layout of the ADS blob allocated for the GuC:
+ * Layout of the ADS blob (ads->bo):
  *
  *      +---------------------------------------+ <== base
  *      | guc_ads                               |
@@ -99,10 +103,6 @@ ads_to_map(struct xe_guc_ads *ads)
  *      +---------------------------------------+
  *      | padding                               |
  *      +---------------------------------------+ <== 4K aligned
- *      | UM queues                             |
- *      +---------------------------------------+
- *      | padding                               |
- *      +---------------------------------------+ <== 4K aligned
  *      | private data                          |
  *      +---------------------------------------+
  *      | padding                               |
@@ -156,16 +156,6 @@ static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
 	return PAGE_ALIGN(ads->capture_size);
 }
 
-static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
-{
-	struct xe_device *xe = ads_to_xe(ads);
-
-	if (!xe->info.has_usm)
-		return 0;
-
-	return GUC_UM_QUEUE_SIZE * GUC_UM_HW_QUEUE_MAX;
-}
-
 static size_t guc_ads_private_data_size(struct xe_guc_ads *ads)
 {
 	return PAGE_ALIGN(ads_to_guc(ads)->fw.private_data_size);
@@ -206,22 +196,12 @@ static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
 	return PAGE_ALIGN(offset);
 }
 
-static size_t guc_ads_um_queues_offset(struct xe_guc_ads *ads)
-{
-	u32 offset;
-
-	offset = guc_ads_capture_offset(ads) +
-		 guc_ads_capture_size(ads);
-
-	return PAGE_ALIGN(offset);
-}
-
 static size_t guc_ads_private_data_offset(struct xe_guc_ads *ads)
 {
 	size_t offset;
 
-	offset = guc_ads_um_queues_offset(ads) +
-		guc_ads_um_queues_size(ads);
+	offset = guc_ads_capture_offset(ads) +
+		guc_ads_capture_size(ads);
 
 	return PAGE_ALIGN(offset);
 }
@@ -461,6 +441,46 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 
 	ads->bo = bo;
 
+	if (xe->info.has_usm) {
+		/*
+		 * Allocate a separate BO for the HW fault ring (UM queues).
+		 *
+		 * Round the size up to the next power of two so that
+		 * (system memory, no IOMMU) the TTM pool issues a single
+		 * alloc_pages(order=N) call, maximising the chance of getting
+		 * a physically contiguous block.  GuC requires contiguous DPA.
+		 */
+		size_t um_size = roundup_pow_of_two(GUC_UM_QUEUE_SIZE *
+						    GUC_UM_HW_QUEUE_MAX);
+
+		u32 um_flags = XE_BO_FLAG_SYSTEM |
+			       XE_BO_FLAG_GGTT |
+			       XE_BO_FLAG_GGTT_INVALIDATE |
+			       XE_BO_FLAG_PINNED_NORESTORE;
+
+		bo = xe_managed_bo_create_pin_map(xe, tile, um_size, um_flags);
+		if (IS_ERR(bo))
+			return PTR_ERR(bo);
+
+		/*
+		 * On pre-Xe3p platforms, GAM (not GuC) accesses the UM queue
+		 * ring via base_dpa, which must be a contiguous DMA address
+		 * range.  Verify that the allocated pages are contiguous in
+		 * DMA address space.
+		 */
+		if (!xe_bo_is_vram(bo) &&
+		    !xe_guc_using_main_gamctrl_queues(ads_to_guc(ads)) &&
+		    unlikely(!xe_bo_sg_is_contiguous(bo,
+						     GUC_UM_QUEUE_SIZE *
+						     GUC_UM_HW_QUEUE_MAX))) {
+			drm_err(&xe->drm,
+				"UM fault queue memory is not contiguous in DMA address space; GAM requires contiguous DPA\n");
+			return -ENOMEM;
+		}
+
+		ads->um_queue_bo = bo;
+	}
+
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_guc_ads_init, ERRNO); /* See xe_pci_probe() */
@@ -893,7 +913,7 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
 
 static void guc_um_init_params(struct xe_guc_ads *ads)
 {
-	u32 um_queue_offset = guc_ads_um_queues_offset(ads);
+	struct xe_bo *um_bo = ads->um_queue_bo;
 	struct xe_guc *guc = ads_to_guc(ads);
 	struct xe_device *xe = ads_to_xe(ads);
 	u64 base_dpa;
@@ -903,8 +923,14 @@ static void guc_um_init_params(struct xe_guc_ads *ads)
 
 	with_dpa = !xe_guc_using_main_gamctrl_queues(guc);
 
-	base_ggtt = xe_bo_ggtt_addr(ads->bo) + um_queue_offset;
-	base_dpa = xe_bo_main_addr(ads->bo, PAGE_SIZE) + um_queue_offset;
+	if (um_bo) {
+		/* All USM platforms: UM queues in dedicated um_queue_bo */
+		base_ggtt = xe_bo_ggtt_addr(um_bo);
+		base_dpa = xe_bo_main_addr(um_bo, PAGE_SIZE);
+	} else {
+		/* Platform does not support USM: no UM queues, nothing to do */
+		return;
+	}
 
 	for (i = 0; i < GUC_UM_HW_QUEUE_MAX; ++i) {
 		/*
diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h b/drivers/gpu/drm/xe/xe_guc_ads_types.h
index 48a8e092023f..845c1fbd93a4 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
@@ -16,6 +16,11 @@ struct xe_bo;
 struct xe_guc_ads {
 	/** @bo: Xe BO for GuC ads blob */
 	struct xe_bo *bo;
+	/**
+	 * @um_queue_bo: Dedicated BO for the HW fault ring (UM queues).
+	 * NULL if the platform does not support USM.
+	 */
+	struct xe_bo *um_queue_bo;
 	/** @golden_lrc_size: golden LRC size */
 	size_t golden_lrc_size;
 	/** @regset_size: size of register set passed to GuC for save/restore */
-- 
2.43.0

