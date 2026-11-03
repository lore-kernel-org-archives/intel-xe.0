Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633DC606A327
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 11:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eWMHIPYV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E7110E7DB;
	Tue,  3 Nov 2026 11:45:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A50D10E7DB
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 11:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793706347; x=1825242347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rcz5qXH6CaARDV/UrSMrF5VAgVp0N9Rk3+cBnLyUBKs=;
 b=eWMHIPYVLsD5CmPEmzZrjQhGCYSxGLu1na3D6I+aZoRe/OkdvBKaxrgN
 U3gjz3Vb89OrnGMTgMDUqBvWV8Plbwj1nkV5jsQmnVyyLWCfDaOzxRYTL
 hXvNqlV14igp+e8p3618b4QrNuP2ICvv46ScOfS5z4k8x9RLZVznhzNDz
 aBzwkfjNfyNwP8H9XS6hJjyNs1pKqkD6WBZZMt3ZrBoXfOx0lBy/8vZf9
 gPgdEb0i5aXFxDYEwcx/xLs8isdoUEB2EmWR70ja4YjvdZP87QdCweVmg
 y4Q2WPZPh3mAKoni+XrIXVM724NDK2BqUxntSM/opCwkHTClLSbBrzZaZ g==;
X-CSE-ConnectionGUID: kk2/AX5CSiaSR1rf8k25EA==
X-CSE-MsgGUID: 8P4AkhTVRkGmyKtBlSRLvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2306299"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2306299"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 03:45:47 -0800
X-CSE-ConnectionGUID: OacUloHxQ0azmVg1H0LVqQ==
X-CSE-MsgGUID: WIYnID2gSAOZfWTSarLhBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="8183045"
Received: from gsd-build.iind.intel.com ([10.190.229.108])
 by fmviesa012.fm.intel.com with ESMTP; 03 Nov 2026 03:45:46 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 1/1] drm/xe/pf: Program LMTT directory pointer from each GT's
 init path
Date: Tue,  3 Nov 2026 11:45:42 +0000
Message-ID: <20261103114540.240284-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103114540.240284-3-satyanarayana.k.v.p@intel.com>
References: <20261103114540.240284-3-satyanarayana.k.v.p@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The LMTT directory pointer is configured on every GT of the tile only
from the primary GT's init/reset flow. On new platforms, both primary and
media GTs have their own forcewake. Primary GT's init holds only its own
forcewake, so the media GT write can be lost.

Program the LMTT directory pointer from each GT's own init and restart
path, while that GT's forcewake is held.

Fixes: ad69d62588cd ("drm/xe/pf: Program LMTT directory pointer on all GTs within a tile")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c   | 14 ++++++--------
 drivers/gpu/drm/xe/xe_lmtt.c | 28 +++++++++++++++-------------
 drivers/gpu/drm/xe/xe_lmtt.h |  5 +++--
 3 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index be79a0da2f2f..b751b5044f3c 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -675,11 +675,10 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
 		xe_gt_apply_ccs_mode(gt);
 	}
 
-	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_is_main_type(gt))
-		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
-
-	if (IS_SRIOV_PF(gt_to_xe(gt)))
+	if (IS_SRIOV_PF(gt_to_xe(gt))) {
+		xe_lmtt_init_hw(gt);
 		xe_gt_sriov_pf_init_hw(gt);
+	}
 
 	/* Last action registered here so devres drains resets before teardown */
 	err = devm_add_action_or_reset(xe->drm.dev, gt_worker_disable, gt);
@@ -879,11 +878,10 @@ static int do_gt_restart(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_is_main_type(gt))
-		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
-
-	if (IS_SRIOV_PF(gt_to_xe(gt)))
+	if (IS_SRIOV_PF(gt_to_xe(gt))) {
+		xe_lmtt_init_hw(gt);
 		xe_gt_sriov_pf_init_hw(gt);
+	}
 
 	xe_mocs_init(gt);
 
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index b6b3d892a35e..2dec0628585d 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -12,7 +12,7 @@
 
 #include "xe_assert.h"
 #include "xe_bo.h"
-#include "xe_tlb_inval.h"
+#include "xe_gt.h"
 #include "xe_lmtt.h"
 #include "xe_log.h"
 #include "xe_map.h"
@@ -22,6 +22,7 @@
 #include "xe_sriov.h"
 #include "xe_tile.h"
 #include "xe_tile_sriov_printk.h"
+#include "xe_tlb_inval.h"
 
 /**
  * DOC: Local Memory Translation Table
@@ -211,14 +212,13 @@ int xe_lmtt_init(struct xe_lmtt *lmtt)
 	return err;
 }
 
-static void lmtt_setup_dir_ptr(struct xe_lmtt *lmtt)
+static void lmtt_setup_dir_ptr(struct xe_lmtt *lmtt, struct xe_gt *gt)
 {
 	struct xe_tile *tile = lmtt_to_tile(lmtt);
 	struct xe_device *xe = tile_to_xe(tile);
 	dma_addr_t offset = xe_bo_main_addr(lmtt->pd->bo, XE_PAGE_SIZE);
-	struct xe_gt *gt;
+	struct xe_reg reg = GRAPHICS_VER(xe) >= 20 ? XE2_LMEM_CFG : LMEM_CFG;
 	u32 config;
-	u8 id;
 
 	lmtt_debug(lmtt, "DIR offset %pad\n", &offset);
 	lmtt_assert(lmtt, xe_bo_is_vram(lmtt->pd->bo));
@@ -226,31 +226,33 @@ static void lmtt_setup_dir_ptr(struct xe_lmtt *lmtt)
 
 	config = LMEM_EN | REG_FIELD_PREP(LMTT_DIR_PTR, offset / SZ_64K);
 
-	for_each_gt_on_tile(gt, tile, id)
-		xe_mmio_write32(&gt->mmio,
-				GRAPHICS_VER(xe) >= 20 ? XE2_LMEM_CFG : LMEM_CFG,
-				config);
+	xe_mmio_write32(&gt->mmio, reg, config);
+	lmtt_assert(lmtt, xe_mmio_read32(&gt->mmio, reg) == config);
 
-	if (xe_device_has_mert(xe) && xe_tile_is_root(tile))
+	if (xe_device_has_mert(xe) && xe_tile_is_root(tile) &&
+	    xe_gt_is_main_type(gt))
 		xe_mmio_write32(&tile->mmio, MERT_LMEM_CFG, config);
 }
 
 /**
  * xe_lmtt_init_hw - Perform LMTT hardware initialization.
- * @lmtt: the &xe_lmtt to initialize
+ * @gt: the &xe_gt for which lmtt is initialized
  *
  * This function is a second step of the LMTT initialization.
- * This function registers LMTT Root Directory prepared in xe_lmtt_init().
+ * This function registers LMTT Root Directory prepared in xe_lmtt_init()
+ * on the given GT.
  *
  * This function shall be called after every hardware reset.
  * This function shall be called only when running as a PF driver.
  */
-void xe_lmtt_init_hw(struct xe_lmtt *lmtt)
+void xe_lmtt_init_hw(struct xe_gt *gt)
 {
+	struct xe_lmtt *lmtt = &gt_to_tile(gt)->sriov.pf.lmtt;
+
 	if (!lmtt->pd)
 		return;
 
-	lmtt_setup_dir_ptr(lmtt);
+	lmtt_setup_dir_ptr(lmtt, gt);
 }
 
 static int lmtt_invalidate_hw(struct xe_lmtt *lmtt)
diff --git a/drivers/gpu/drm/xe/xe_lmtt.h b/drivers/gpu/drm/xe/xe_lmtt.h
index 8fa387b38c52..5ef065dd573c 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.h
+++ b/drivers/gpu/drm/xe/xe_lmtt.h
@@ -9,12 +9,13 @@
 #include <linux/types.h>
 
 struct xe_bo;
+struct xe_gt;
 struct xe_lmtt;
 struct xe_lmtt_ops;
 
 #ifdef CONFIG_PCI_IOV
 int xe_lmtt_init(struct xe_lmtt *lmtt);
-void xe_lmtt_init_hw(struct xe_lmtt *lmtt);
+void xe_lmtt_init_hw(struct xe_gt *gt);
 void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt);
 int xe_lmtt_prepare_pages(struct xe_lmtt *lmtt, unsigned int vfid, u64 range);
 int xe_lmtt_populate_pages(struct xe_lmtt *lmtt, unsigned int vfid, struct xe_bo *bo, u64 offset);
@@ -23,7 +24,7 @@ u64 xe_lmtt_estimate_pt_size(struct xe_lmtt *lmtt, u64 size);
 u64 xe_lmtt_page_size(struct xe_lmtt *lmtt);
 #else
 static inline int xe_lmtt_init(struct xe_lmtt *lmtt) { return 0; }
-static inline void xe_lmtt_init_hw(struct xe_lmtt *lmtt) { }
+static inline void xe_lmtt_init_hw(struct xe_gt *gt) { }
 #endif
 
 #endif
-- 
2.43.0

