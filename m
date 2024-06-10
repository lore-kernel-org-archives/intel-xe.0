Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD71AC27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 18:54:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3791D10E379;
	Mon, 10 Jun 2024 18:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YMyANw3O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E0910E379
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 18:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718045662; x=1749581662;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lyq4U6XkjRrf1Z885go0k9nRPiZNrRoX/kYe8d2tA2w=;
 b=YMyANw3OgTHZlJAnkr/yN9J+0a+1hHektDxYkVrDBFLsO4W+9hg3IvaV
 YFicOsGqcM3UPqiWIlzP66Dfq7oAqWNHv7XcK7x3C8ufDKi3b+0Q6U6po
 krlHVEDYABZ2aqaxTzc/ufTYOTui2ER/BQgVySZScseJ2N77WTyUcNz/D
 HzjLjlz8XK/eWk1LyDyHsKVdzVp7qesUruRyw+BuYdn15W9eWwjvCAv2p
 oJGgK/DBI+BJHJR9rJ9iXrd3P+nEK/brd7m9RHjHCItb5UTPBluL0f9ud
 SNoHWR3HCMUr4W2Avu9ipg0MBQ1e8DVXQOzrcHoE5XOyYX+Bj5UQXmEaa g==;
X-CSE-ConnectionGUID: caJvsCxdTAe5q1lyMoPCAQ==
X-CSE-MsgGUID: EAzq+HuGT2WntfB0acny0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="26126013"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="26126013"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 11:54:22 -0700
X-CSE-ConnectionGUID: pVYo3UwiTWyefV6qtZulpQ==
X-CSE-MsgGUID: TJZrPN4lRvi4CzeLs2gPEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39149464"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa008.fm.intel.com with ESMTP; 10 Jun 2024 11:54:22 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v2] drm/xe/lnl: Apply Wa_22019338487
Date: Mon, 10 Jun 2024 11:52:31 -0700
Message-Id: <20240610185231.1451157-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

This WA requires us to limit media GT frequency requests to a certain
cap value during driver load. Freq limits are restored after load
completes, so perf will not be affected during normal operations.

During normal driver operation, this WA requires dummy writes to media
offset 0x380D8C after every ~63 GGTT writes. This will ensure completion
of the LMEM writes originating from Gunit.

During driver unload(before FLR), the WA requires that we set requested
frequency to the cap value again.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  2 +
 drivers/gpu/drm/xe/xe_device.c       | 10 ++++
 drivers/gpu/drm/xe/xe_ggtt.c         | 19 ++++++
 drivers/gpu/drm/xe/xe_ggtt_types.h   |  2 +
 drivers/gpu/drm/xe/xe_gsc.c          |  4 ++
 drivers/gpu/drm/xe/xe_gt.c           |  2 +
 drivers/gpu/drm/xe/xe_guc_pc.c       | 87 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_pc.h       |  4 ++
 drivers/gpu/drm/xe/xe_guc_pc_types.h |  4 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
 10 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 478acc94a71c..ab282070fedf 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -24,9 +24,11 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
 	$(call cmd,wa_oob)
 
 uses_generated_oob := \
+	$(obj)/xe_ggtt.o \
 	$(obj)/xe_gsc.o \
 	$(obj)/xe_guc.o \
 	$(obj)/xe_guc_ads.o \
+	$(obj)/xe_guc_pc.o \
 	$(obj)/xe_migrate.o \
 	$(obj)/xe_ring_ops.o \
 	$(obj)/xe_vm.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 94dbfe5cf19c..6450cccb1771 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -37,6 +37,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
+#include "xe_guc_pc.h"
 #include "xe_hwmon.h"
 #include "xe_irq.h"
 #include "xe_memirq.h"
@@ -50,6 +51,7 @@
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
+#include "xe_uc_fw.h"
 #include "xe_vm.h"
 #include "xe_vram.h"
 #include "xe_wait_user_fence.h"
@@ -668,6 +670,12 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_hwmon_register(xe);
 
+	/* Wa_22019338487: Restore GT/Media freq now if GSC is not being loaded. */
+	for_each_gt(gt, xe, id) {
+		if (!xe_uc_fw_is_available(&gt->uc.gsc.fw))
+			xe_guc_pc_wa_22019338487_end(&gt->uc.guc.pc);
+	}
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_fini_display:
@@ -701,6 +709,8 @@ void xe_device_remove(struct xe_device *xe)
 	struct xe_gt *gt;
 	u8 id;
 
+	xe_guc_pc_wa_22019338487_fini(xe);
+
 	xe_device_remove_display(xe);
 
 	xe_display_fini(xe);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ff91fd1b7c8..58d177be724a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -11,6 +11,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 #include <drm/intel/i915_drm.h>
+#include <generated/xe_wa_oob.h>
 
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_gtt_defs.h"
@@ -23,8 +24,10 @@
 #include "xe_gt_sriov_vf.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_map.h"
+#include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
+#include "xe_wa.h"
 #include "xe_wopcm.h"
 
 static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
@@ -69,12 +72,28 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
 	return ggms ? SZ_1M << ggms : 0;
 }
 
+static void apply_wa_22019338487(struct xe_ggtt *ggtt)
+{
+	/*
+	 * 22019338487: GMD_ID is a RO register, a dummy write forces gunit
+	 * to wait for completion of prior GTT writes before letting this through.
+	 */
+	if (XE_WA(ggtt->tile->media_gt, 22019338487)) {
+		if (++ggtt->update_count > 63) {
+			xe_mmio_write32(ggtt->tile->media_gt, GMD_ID, 0x0);
+			ggtt->update_count = 0;
+		}
+	}
+}
+
 void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
 	xe_tile_assert(ggtt->tile, addr < ggtt->size);
+	lockdep_assert_held(&ggtt->lock);
 
 	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
+	apply_wa_22019338487(ggtt);
 }
 
 static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index d8c584d9a8c3..89b721205d2d 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -34,6 +34,8 @@ struct xe_ggtt {
 	const struct xe_ggtt_pt_ops *pt_ops;
 
 	struct drm_mm mm;
+
+	unsigned int update_count;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 80a61934decc..9cd154bf75b7 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -22,6 +22,7 @@
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
+#include "xe_guc_pc.h"
 #include "xe_huc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
@@ -342,6 +343,7 @@ static void gsc_work(struct work_struct *work)
 	struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_guc_pc *pc = &gt->uc.guc.pc;
 	u32 actions;
 	int ret;
 
@@ -370,6 +372,8 @@ static void gsc_work(struct work_struct *work)
 	if (actions & GSC_ACTION_SW_PROXY)
 		xe_gsc_proxy_request_handler(gsc);
 
+	xe_guc_pc_wa_22019338487_end(pc);
+
 out:
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
 	xe_pm_runtime_put(xe);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 57d84751e160..1315b184220a 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -816,6 +816,8 @@ int xe_gt_resume(struct xe_gt *gt)
 
 	xe_gt_idle_enable_pg(gt);
 
+	xe_guc_pc_wa_22019338487_end(&gt->uc.guc.pc);
+
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_gt_dbg(gt, "resumed\n");
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 666a37106bc5..7d8aa68e60b7 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 
 #include <drm/drm_managed.h>
+#include <generated/xe_wa_oob.h>
 
 #include "abi/guc_actions_slpc_abi.h"
 #include "regs/xe_gt_regs.h"
@@ -24,6 +25,7 @@
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_pcode.h"
+#include "xe_wa.h"
 
 #define MCHBAR_MIRROR_BASE_SNB	0x140000
 
@@ -41,6 +43,8 @@
 #define GT_FREQUENCY_MULTIPLIER	50
 #define GT_FREQUENCY_SCALER	3
 
+#define LNL_MERT_FREQ_CAP	800
+
 /**
  * DOC: GuC Power Conservation (PC)
  *
@@ -673,6 +677,14 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
 		tgl_init_fused_rp_values(pc);
 }
 
+u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc)
+{
+	if (MEDIA_VERx100(pc_to_xe(pc)) == 2000)
+		return LNL_MERT_FREQ_CAP;
+	else
+		return 0;
+}
+
 /**
  * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
  * frequency to allow faster GuC load times
@@ -684,7 +696,11 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
 
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 	pc_init_fused_rp_values(pc);
-	pc_set_cur_freq(pc, pc->rp0_freq);
+
+	if (XE_WA(gt, 22019338487))
+		pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), pc->rp0_freq));
+	else
+		pc_set_cur_freq(pc, pc->rp0_freq);
 }
 
 static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
@@ -740,6 +756,71 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
 	return ret;
 }
 
+static int pc_wa_22019338487_start(struct xe_guc_pc *pc)
+{
+	int ret = 0;
+
+	if (XE_WA(pc_to_gt(pc), 22019338487)) {
+		/*
+		 * Get updated min/max and stash them.
+		 */
+		ret = xe_guc_pc_get_min_freq(pc, &pc->pre_wa_min_freq);
+		if (!ret)
+			ret = xe_guc_pc_get_max_freq(pc, &pc->pre_wa_max_freq);
+		if (ret)
+			return ret;
+
+		/*
+		 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
+		 */
+		mutex_lock(&pc->freq_lock);
+
+		ret = pc_set_min_freq(pc, min(pc->rpe_freq, xe_guc_pc_mert_freq_cap(pc)));
+		if (!ret)
+			ret = pc_set_max_freq(pc, min(pc->rp0_freq, xe_guc_pc_mert_freq_cap(pc)));
+
+		mutex_unlock(&pc->freq_lock);
+	}
+
+	return ret;
+}
+
+static int restore_pre_wa_freq(struct xe_guc_pc *pc)
+{
+	int ret = 0;
+
+	mutex_lock(&pc->freq_lock);
+	ret = pc_set_max_freq(pc, pc->pre_wa_max_freq);
+	if (!ret)
+		pc_set_min_freq(pc, pc->pre_wa_min_freq);
+
+	mutex_unlock(&pc->freq_lock);
+
+	return ret;
+}
+
+int xe_guc_pc_wa_22019338487_end(struct xe_guc_pc *pc)
+{
+	if (XE_WA(pc_to_gt(pc), 22019338487))
+		return restore_pre_wa_freq(pc);
+	else
+		return 0;
+}
+
+void xe_guc_pc_wa_22019338487_fini(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	struct xe_guc_pc *pc;
+	u8 id;
+
+	for_each_gt(gt, xe, id) {
+		pc = &gt->uc.guc.pc;
+		/* Set requested freq to mert_freq_cap before unload */
+		if (XE_WA(gt, 22019338487))
+			pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), pc->rpe_freq));
+	}
+}
+
 /**
  * xe_guc_pc_gucrc_disable - Disable GuC RC
  * @pc: Xe_GuC_PC instance
@@ -854,6 +935,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	if (ret)
 		goto out;
 
+	ret = pc_wa_22019338487_start(pc);
+	if (ret)
+		goto out;
+
 	if (xe->info.platform == XE_PVC) {
 		xe_guc_pc_gucrc_disable(pc);
 		ret = 0;
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 532cac985a6d..760324ecdbf8 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 
+struct xe_device;
 struct xe_guc_pc;
 
 int xe_guc_pc_init(struct xe_guc_pc *pc);
@@ -29,5 +30,8 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
 u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
 u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
 void xe_guc_pc_init_early(struct xe_guc_pc *pc);
+u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc);
+int xe_guc_pc_wa_22019338487_end(struct xe_guc_pc *pc);
+void xe_guc_pc_wa_22019338487_fini(struct xe_device *xe);
 
 #endif /* _XE_GUC_PC_H_ */
diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
index 2afd0dbc3542..721f673b1628 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
@@ -25,6 +25,10 @@ struct xe_guc_pc {
 	u32 user_requested_min;
 	/** @user_requested_max: Stash the maximum requested freq by user */
 	u32 user_requested_max;
+	/** @pre_wa_min_freq: Stash the minimum freq before applying WA */
+	u32 pre_wa_min_freq;
+	/** @pre_wa_max_freq: Stash the maximum freq before applying WA */
+	u32 pre_wa_max_freq;
 	/** @freq_lock: Let's protect the frequencies */
 	struct mutex freq_lock;
 	/** @freq_ready: Only handle freq changes, if they are really ready */
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 12fe88796a49..a6b897030fde 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -27,3 +27,4 @@
 16022287689	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
 13011645652	GRAPHICS_VERSION(2004)
+22019338487	MEDIA_VERSION(2000)
-- 
2.38.1

