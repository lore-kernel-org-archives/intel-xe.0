Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7975606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 11:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dHvwMH5i
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE15112392;
	Thu,  5 Nov 2026 11:49:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10294112392
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 11:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793879370; x=1825415370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y1fXszz7L/G6ojjMJiQ3qWqjh9a6W8hksOjaJ72u4Og=;
 b=dHvwMH5iiOl9kZiZVa+jk8mDVmvAKfwE8vlI4OaryjBmUOwGOTLApiKK
 Mjf0w6x3TYslQsI11arkcAEGxQGC+Ey+ZwtVlB5LmHTaGKt5s8YpMU24S
 xp3GPDOGaLq21c5g3NKB72Z/b1OY7OlqTBAw46iJtkjI7qZaHtiX03NJp
 3M1Gsv40AtIdbdzMWp+MCnNe9Err3yuezpMk0m0IxyoI5VTfkjeXuIiXA
 W0OnUCxplgcZORXmkbezadLp2J7/5CZfmx100ZdlvDnt7B2PoXQPLQU9S
 Z7B4PfkDbVybZBvyS3oiXjU1fQG9gcLLup7ZVwCOj41T9iQsSn+gub9nm g==;
X-CSE-ConnectionGUID: PDVqF97UQj+pBydglnkFQA==
X-CSE-MsgGUID: 2iblgEtdRdSfV/e/pYiftg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2562829"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2562829"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 03:49:29 -0800
X-CSE-ConnectionGUID: E8u6atfOR7GjqjE9265m8Q==
X-CSE-MsgGUID: ekYvrwRkTHubRrqq5q2uaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7300123"
Received: from gsd-build.iind.intel.com ([10.190.229.108])
 by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2026 03:49:28 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 1/1] drm/xe/pf: Program LMTT directory pointer from each
 GT's init path
Date: Thu,  5 Nov 2026 11:49:25 +0000
Message-ID: <20261105114923.880265-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105114923.880265-3-satyanarayana.k.v.p@intel.com>
References: <20261105114923.880265-3-satyanarayana.k.v.p@intel.com>
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

Also use MCR registers for primary GT and unicast registers for media GT.

Fixes: ad69d62588cd ("drm/xe/pf: Program LMTT directory pointer on all GTs within a tile")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

---
V1 -> V2:
- Use MCR register for primary GT and unicast register for media GT
(Roper Matt).
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
 drivers/gpu/drm/xe/xe_gt.c           | 14 +++----
 drivers/gpu/drm/xe/xe_lmtt.c         | 58 +++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_lmtt.h         |  5 ++-
 4 files changed, 55 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 73aa78d30679..90319e3d6046 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -109,6 +109,7 @@
 #define GAMSTLB_CTRL2				XE_REG_MCR(0x4788)
 #define   STLB_SINGLE_BANK_MODE			REG_BIT(11)
 
+#define XE2_LMEM_CFG_MCR			XE_REG_MCR(0x48b0)
 #define XE2_LMEM_CFG				XE_REG(0x48b0)
 
 #define XE2_GAMWALK_CTRL			0x47e4
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
index b6b3d892a35e..8fba3c01fac2 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -12,7 +12,8 @@
 
 #include "xe_assert.h"
 #include "xe_bo.h"
-#include "xe_tlb_inval.h"
+#include "xe_gt.h"
+#include "xe_gt_mcr.h"
 #include "xe_lmtt.h"
 #include "xe_log.h"
 #include "xe_map.h"
@@ -22,6 +23,7 @@
 #include "xe_sriov.h"
 #include "xe_tile.h"
 #include "xe_tile_sriov_printk.h"
+#include "xe_tlb_inval.h"
 
 /**
  * DOC: Local Memory Translation Table
@@ -211,14 +213,43 @@ int xe_lmtt_init(struct xe_lmtt *lmtt)
 	return err;
 }
 
-static void lmtt_setup_dir_ptr(struct xe_lmtt *lmtt)
+static void lmtt_setup_dir_ptr_gt(struct xe_gt *gt, u32 config)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_reg_mcr reg_mcr;
+	struct xe_reg reg;
+	u32 val_read;
+
+	if (GRAPHICS_VER(xe) < 20) {
+		reg = LMEM_CFG;
+		xe_mmio_write32(&gt->mmio, reg, config);
+		return;
+	}
+
+	if (xe_gt_is_main_type(gt)) {
+		reg_mcr = XE2_LMEM_CFG_MCR;
+		xe_gt_mcr_multicast_write(gt, reg_mcr, config);
+		val_read = xe_gt_mcr_unicast_read_any(gt, reg_mcr);
+		xe_gt_assert_msg(gt, val_read == config, "LMEM_CFG_MCR: %#x != %#x\n",
+				 config, val_read);
+	} else {
+		reg = XE2_LMEM_CFG;
+		xe_mmio_write32(&gt->mmio, reg, config);
+
+		if (MEDIA_VER(xe) >= 35) {
+			val_read = xe_mmio_read32(&gt->mmio, reg);
+			xe_gt_assert_msg(gt, val_read == config, "LMEM_CFG: %#x != %#x\n",
+					 config, val_read);
+		}
+	}
+}
+
+static void lmtt_setup_dir_ptr(struct xe_lmtt *lmtt, struct xe_gt *gt)
 {
 	struct xe_tile *tile = lmtt_to_tile(lmtt);
 	struct xe_device *xe = tile_to_xe(tile);
 	dma_addr_t offset = xe_bo_main_addr(lmtt->pd->bo, XE_PAGE_SIZE);
-	struct xe_gt *gt;
 	u32 config;
-	u8 id;
 
 	lmtt_debug(lmtt, "DIR offset %pad\n", &offset);
 	lmtt_assert(lmtt, xe_bo_is_vram(lmtt->pd->bo));
@@ -226,31 +257,32 @@ static void lmtt_setup_dir_ptr(struct xe_lmtt *lmtt)
 
 	config = LMEM_EN | REG_FIELD_PREP(LMTT_DIR_PTR, offset / SZ_64K);
 
-	for_each_gt_on_tile(gt, tile, id)
-		xe_mmio_write32(&gt->mmio,
-				GRAPHICS_VER(xe) >= 20 ? XE2_LMEM_CFG : LMEM_CFG,
-				config);
+	lmtt_setup_dir_ptr_gt(gt, config);
 
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

