Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1893BEE0213
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 23:15:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C483910E1FC;
	Wed, 13 Sep 2023 23:15:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8B410E1F4
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 23:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694646891; x=1726182891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ulLEBW4vIxOqnQwckBfBezTWPd/Rs+l3rU8IZj87Jbk=;
 b=Qbo6uijMEVMFoJzbNFK3+y82U8QylT1ve7EKjZ1JGa5ERoCxPABm5zKk
 7DKBg1zhtoLOAIWfwfySaZVQTNhRgtdqR4p90MvkTpz0ZkjYGJBJFcnHk
 JBYWRBjTiA2K6tjC4+Rp7Qt3XPTKLvQEQwaYmJgecif2UqSVQVCC6TYEQ
 tnoE1jy/NxlO26J4UkpeXA/uGi7Tz0okWSvPwfjnZkWAfZ2ZHp0XZj7M+
 oYkPnnVIYmALbfS2vHBCo7E2e83GRfYz22T4+267kHKxsJibcYPlTubL6
 WceaeNZjv2CzeojCYv+36kA1kLs1hemvZGSXCjCwmW+VseQd87McRmp+x g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377714991"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="377714991"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 16:14:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="773659709"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="773659709"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 16:14:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 13 Sep 2023 16:14:17 -0700
Message-ID: <20230913231411.291933-13-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230913231411.291933-8-matthew.d.roper@intel.com>
References: <20230913231411.291933-8-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/6] drm/xe/wa: Apply tile workarounds at
 probe/resume
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Although the vast majority of workarounds the driver needs to implement
are either GT-based or display-based, there are occasionally workarounds
that reside outside those parts of the hardware (i.e., in they target
registers in the sgunit/soc); we can consider these to be "tile"
workarounds since there will be instance of these registers per tile.
The registers in question should only lose their values during a
function-level reset, so they only need to be applied during probe and
resume; the registers will not be affected by GT/engine resets.

Tile workarounds are rare (there's only one, 22010954014, that's
relevant to Xe at the moment) so it's probably not worth updating the
xe_rtp design to handle tile-level workarounds yet, although we may want
to consider that in the future if/when more of these show up on future
platforms.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h  |  3 +++
 drivers/gpu/drm/xe/xe_pm.c         |  5 +++++
 drivers/gpu/drm/xe/xe_tile.c       |  3 +++
 drivers/gpu/drm/xe/xe_wa.c         | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa.h         |  2 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
 6 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 39d7b0740bf0..8a93ab169e04 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -56,6 +56,9 @@
 #define GU_CNTL					XE_REG(0x101010)
 #define   LMEM_INIT				REG_BIT(7)
 
+#define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
+#define   SGSI_SIDECLK_DIS			REG_BIT(17)
+
 #define GGC					XE_REG(0x108040)
 #define   GMS_MASK				REG_GENMASK(15, 8)
 #define   GGMS_MASK				REG_GENMASK(7, 6)
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 0f06d8304e17..ad3c08c4ff22 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -20,6 +20,7 @@
 #include "xe_guc.h"
 #include "xe_irq.h"
 #include "xe_pcode.h"
+#include "xe_wa.h"
 
 /**
  * DOC: Xe Power Management
@@ -86,10 +87,14 @@ int xe_pm_suspend(struct xe_device *xe)
  */
 int xe_pm_resume(struct xe_device *xe)
 {
+	struct xe_tile *tile;
 	struct xe_gt *gt;
 	u8 id;
 	int err;
 
+	for_each_tile(tile, xe, id)
+		xe_wa_apply_tile_workarounds(tile);
+
 	for_each_gt(gt, xe, id) {
 		err = xe_pcode_init(gt);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index e0bc2b60ab09..131752a57f65 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -12,6 +12,7 @@
 #include "xe_tile.h"
 #include "xe_tile_sysfs.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_wa.h"
 
 /**
  * DOC: Multi-tile Design
@@ -143,6 +144,8 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 	if (IS_ERR(tile->mem.kernel_bb_pool))
 		err = PTR_ERR(tile->mem.kernel_bb_pool);
 
+	xe_wa_apply_tile_workarounds(tile);
+
 	xe_tile_sysfs_init(tile);
 
 err_mem_access:
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index f45e9452ba0e..d84e67a9af07 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -753,3 +753,23 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
 		if (oob_was[idx].name)
 			drm_printf_indent(p, 1, "%s\n", oob_was[idx].name);
 }
+
+/*
+ * Apply tile (non-GT, non-display) workarounds.  Think very carefully before
+ * adding anything to this function; most workarounds should be implemented
+ * elsewhere.  The programming here is primarily for sgunit/soc workarounds,
+ * which are relatively rare.  Since the registers these workarounds target are
+ * outside the GT, they should only need to be applied once at device
+ * probe/resume; they will not lose their values on any kind of GT or engine
+ * reset.
+ *
+ * TODO:  We may want to move this over to xe_rtp in the future once we have
+ * enough workarounds to justify the work.
+ */
+void xe_wa_apply_tile_workarounds(struct xe_tile *tile)
+{
+	struct xe_gt *mmio = tile->primary_gt;
+
+	if (XE_WA(mmio, 22010954014))
+		xe_mmio_rmw32(mmio, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
+}
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index cfe685989524..1b24d66f9d80 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -9,12 +9,14 @@
 struct drm_printer;
 struct xe_gt;
 struct xe_hw_engine;
+struct xe_tile;
 
 int xe_wa_init(struct xe_gt *gt);
 void xe_wa_process_oob(struct xe_gt *gt);
 void xe_wa_process_gt(struct xe_gt *gt);
 void xe_wa_process_engine(struct xe_hw_engine *hwe);
 void xe_wa_process_lrc(struct xe_hw_engine *hwe);
+void xe_wa_apply_tile_workarounds(struct xe_tile *tile);
 
 void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
 void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 599e67169dae..f3ff774dc4aa 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -18,3 +18,4 @@
 14016763929	SUBPLATFORM(DG2, G10)
 		SUBPLATFORM(DG2, G12)
 16017236439	PLATFORM(PVC)
+22010954014	PLATFORM(DG2)
-- 
2.41.0

