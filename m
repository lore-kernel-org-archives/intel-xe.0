Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC33BC43327
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 04:15:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F5A10E2F9;
	Wed,  1 Jul 2026 04:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EhqgBhnj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CEF10E2F9
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 04:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782879301; x=1814415301;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Oc0hWwGBIZ7z26a5RZIydVue5LqZkWgFuBLZS9ozmMo=;
 b=EhqgBhnjrcDE2QtvW/ULGVG5QnjOyGO9s31BiARNqepM7hphr06oGL1l
 c8K2NmTw4056B0EkTLSz+YX7IuSggEWvHFvC+2dM4KPgUfLr2mvHa+6XR
 Es6YacOD3MzL173TGqC4Fnsb5mU1BzM3oj0aoacvF3NUvXTSuuDkfVD9o
 jtfdJBKVY9cvCOttzZ5IqpORzjlGATUpdrW8s7LdNx90TjkEWnhtSAJ8Y
 UoFkDaEAOin7LuyY7WmgO+T8oYgVZiiV4d7kSX86JgGVr9bDXDXJhcrUt
 GQyZOgUgARq5Lsmn1/N5iqhJjJMMArkUJzh0pmPV+mjvcfYM8sBg+LHVT Q==;
X-CSE-ConnectionGUID: 8J+T8fm/QzWlmlebrVHf6w==
X-CSE-MsgGUID: 7ahKdSzwTGisx8RYDViNVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="93958081"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="93958081"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 21:15:01 -0700
X-CSE-ConnectionGUID: JB525UOnTSGEoqRYgiBEqg==
X-CSE-MsgGUID: +MZjYBamQuu81bxYfwHPIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="257355276"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.40])
 by fmviesa005.fm.intel.com with ESMTP; 30 Jun 2026 21:15:01 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe/guc_ads: allocate UM queues in a separate UC BO
Date: Wed,  1 Jul 2026 04:14:59 +0000
Message-ID: <20260701041459.2151262-1-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
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

The GPU updates the HWQ tail pointer (non-posted, strongly ordered)
before writing the fault descriptor data into the ring (posted WB,
weakly ordered). If the ADS BO uses WB caching, GuC may read the ring
slot before the GPU write reaches system memory, resulting in an
all-zero descriptor being forwarded to the driver.

Allocate the UM queues (HW fault ring) in a dedicated UC-mapped BO
(ads->um_queue_bo) so that GPU writes bypass the L3 cache and are
immediately visible in DRAM. Keeping the UM queues separate avoids
making the Golden LRC region uncached, which would regress context
restore performance.

Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c       | 66 +++++++++++++++------------
 drivers/gpu/drm/xe/xe_guc_ads_types.h | 10 +++-
 2 files changed, 46 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index c98454545a85..2ff83e85761e 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -155,16 +155,6 @@ static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
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
@@ -205,22 +195,12 @@ static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
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
@@ -400,15 +380,43 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 	ads->ads_waklv_size = calculate_waklv_size(ads);
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
-					  XE_BO_FLAG_SYSTEM |
-					  XE_BO_FLAG_GGTT |
-					  XE_BO_FLAG_GGTT_INVALIDATE |
-					  XE_BO_FLAG_PINNED_NORESTORE);
+				  XE_BO_FLAG_SYSTEM |
+				  XE_BO_FLAG_GGTT |
+				  XE_BO_FLAG_GGTT_INVALIDATE |
+				  XE_BO_FLAG_PINNED_NORESTORE);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
 	ads->bo = bo;
 
+	/*
+	 * Allocate a separate UC BO for the HW fault ring (UM queues).
+	 *
+	 * The GPU updates the HWQ tail pointer (non-posted, strongly ordered)
+	 * before writing the fault descriptor data into the ring (posted WB,
+	 * weakly ordered). GuC may read the ring slot before the GPU write
+	 * reaches system memory if the ADS BO is WB-cached, resulting in an
+	 * all-zero descriptor being forwarded to the driver. Using UC mapping
+	 * bypasses the L3 cache so GPU writes are immediately visible in DRAM.
+	 *
+	 * Keeping the UM queues in a separate BO avoids making the Golden LRC
+	 * (also in the main ADS BO) uncached, which would regress context
+	 * restore performance.
+	 */
+	if (xe->info.has_usm) {
+		bo = xe_managed_bo_create_pin_map(xe, tile,
+					  GUC_UM_QUEUE_SIZE * GUC_UM_HW_QUEUE_MAX,
+					  XE_BO_FLAG_SYSTEM |
+					  XE_BO_FLAG_GGTT |
+					  XE_BO_FLAG_GGTT_INVALIDATE |
+					  XE_BO_FLAG_PINNED_NORESTORE |
+					  XE_BO_FLAG_NEEDS_UC);
+		if (IS_ERR(bo))
+			return PTR_ERR(bo);
+
+		ads->um_queue_bo = bo;
+	}
+
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_guc_ads_init, ERRNO); /* See xe_pci_probe() */
@@ -820,9 +828,9 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
 
 static void guc_um_init_params(struct xe_guc_ads *ads)
 {
-	u32 um_queue_offset = guc_ads_um_queues_offset(ads);
 	struct xe_guc *guc = ads_to_guc(ads);
 	struct xe_device *xe = ads_to_xe(ads);
+	struct xe_bo *um_bo = ads->um_queue_bo;
 	u64 base_dpa;
 	u32 base_ggtt;
 	bool with_dpa;
@@ -830,8 +838,8 @@ static void guc_um_init_params(struct xe_guc_ads *ads)
 
 	with_dpa = !xe_guc_using_main_gamctrl_queues(guc);
 
-	base_ggtt = xe_bo_ggtt_addr(ads->bo) + um_queue_offset;
-	base_dpa = xe_bo_main_addr(ads->bo, PAGE_SIZE) + um_queue_offset;
+	base_ggtt = xe_bo_ggtt_addr(um_bo);
+	base_dpa = xe_bo_main_addr(um_bo, PAGE_SIZE);
 
 	for (i = 0; i < GUC_UM_HW_QUEUE_MAX; ++i) {
 		/*
diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h b/drivers/gpu/drm/xe/xe_guc_ads_types.h
index 48a8e092023f..1a57c51551aa 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
@@ -14,8 +14,16 @@ struct xe_bo;
  * struct xe_guc_ads - GuC additional data structures (ADS)
  */
 struct xe_guc_ads {
-	/** @bo: Xe BO for GuC ads blob */
+	/** @bo: Xe BO for GuC ads blob (WB cached) */
 	struct xe_bo *bo;
+	/**
+	 * @um_queue_bo: Separate UC BO for HW fault ring (UM queues).
+	 *
+	 * GPU descriptor writes are posted WB and may not be visible in LLC
+	 * before GuC reads the tail-advanced ring slot. UC mapping bypasses L3
+	 * so GPU writes reach system memory before GuC samples the descriptor.
+	 */
+	struct xe_bo *um_queue_bo;
 	/** @golden_lrc_size: golden LRC size */
 	size_t golden_lrc_size;
 	/** @regset_size: size of register set passed to GuC for save/restore */
-- 
2.43.0

