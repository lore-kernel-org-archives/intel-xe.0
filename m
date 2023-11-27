Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588D1C07D5A
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 19:59:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B90310E0E7;
	Mon, 27 Nov 2023 19:59:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A209C10E0BD
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 19:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701115156; x=1732651156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5Lr1tFJ5tLTJdlZFHJdKJHlwRG6D6Qa6nKvuMHpPcLs=;
 b=hhpfM6HI43giS588xHI22q3bLJaHKmwWA6thAw5OSMuk8a17MIqvGI/9
 DM2eQ6/L10TACDUKCmRwrPk506fSiJujuEOqPbJ21v57gPfKKo7kvDAsI
 Rulip8Xtb1rVBFHO8LitgL4zCuMSLYHAh5jRBmj3Bh3jDv4LxELyjjdZQ
 CPvAppPGaDZP7j1It5Jc8nxrjUjKYIun8Kg+OyqtXhxoSIqFpNtUImSCD
 skB5VLmv6yNztHyonrNmZnoRmhnr/y8hzNwO1VGfY8Ne3zo77m9mv8UXE
 wVNHQ977O4UQZplZHcXduFFZ+ZUqcuO3I7p8Hgoo0cT+cFLDBMcvlzmB2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="383164002"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="383164002"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 11:59:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="16705618"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmviesa001.fm.intel.com with ESMTP; 27 Nov 2023 11:59:16 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 11:58:56 -0800
Message-Id: <20231127195856.4183070-4-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20231127195856.4183070-1-vinay.belgaumkar@intel.com>
References: <20231127195856.4183070-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: Manually setup C6 when skip_guc_pc
 is set
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

Skip the init/start/stop GuC PC functions and toggle C6 using
register writes instead. Also request max possible frequency
as dynamic freq management is disabled.

v2: Fix compile warning

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++++
 drivers/gpu/drm/xe/xe_gt_idle.c      | 24 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_idle.h      |  4 ++++
 drivers/gpu/drm/xe/xe_guc_pc.c       | 35 +++++++++++++++++++++++++---
 4 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cc27fe8fc363..71eb6b8c8e15 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -269,7 +269,11 @@
 #define   RPSWCTL_ENABLE			REG_FIELD_PREP(RPSWCTL_MASK, 2)
 #define   RPSWCTL_DISABLE			REG_FIELD_PREP(RPSWCTL_MASK, 0)
 #define RC_CONTROL				XE_REG(0xa090)
+#define   RC_CTL_HW_ENABLE			REG_BIT(31)
+#define   RC_CTL_TO_MODE			REG_BIT(28)
+#define   RC_CTL_RC6_ENABLE			REG_BIT(18)
 #define RC_STATE				XE_REG(0xa094)
+#define RC_IDLE_HYSTERSIS			XE_REG(0xa0ac)
 
 #define PMINTRMSK				XE_REG(0xa168)
 #define   PMINTR_DISABLE_REDIRECT_TO_GUC	REG_BIT(31)
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index e5b7e5d38e76..9358f7336889 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -10,6 +10,8 @@
 #include "xe_gt_idle.h"
 #include "xe_gt_sysfs.h"
 #include "xe_guc_pc.h"
+#include "regs/xe_gt_regs.h"
+#include "xe_mmio.h"
 
 /**
  * DOC: Xe GT Idle
@@ -166,3 +168,25 @@ void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
 		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
 			 __func__, err);
 }
+
+void xe_gt_idle_enable_c6(struct xe_gt *gt)
+{
+	xe_device_assert_mem_access(gt_to_xe(gt));
+	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
+
+	/* Units of 1280 ns for a total of 5s */
+	xe_mmio_write32(gt, RC_IDLE_HYSTERSIS, 0x3B9ACA);
+	/* Enable RC6 */
+	xe_mmio_write32(gt, RC_CONTROL,
+			RC_CTL_HW_ENABLE | RC_CTL_TO_MODE | RC_CTL_RC6_ENABLE);
+}
+
+void xe_gt_idle_disable_c6(struct xe_gt *gt)
+{
+	xe_device_assert_mem_access(gt_to_xe(gt));
+	xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+
+	xe_mmio_write32(gt, PG_ENABLE, 0);
+	xe_mmio_write32(gt, RC_CONTROL, 0);
+	xe_mmio_write32(gt, RC_STATE, 0);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
index 9b36bf7db3a7..69280fd16b03 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.h
+++ b/drivers/gpu/drm/xe/xe_gt_idle.h
@@ -8,6 +8,10 @@
 
 #include "xe_gt_idle_types.h"
 
+struct xe_gt;
+
 void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
+void xe_gt_idle_enable_c6(struct xe_gt *gt);
+void xe_gt_idle_disable_c6(struct xe_gt *gt);
 
 #endif /* _XE_GT_IDLE_H_ */
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index e9dd6c3d750b..8fb4cda7b54b 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -14,6 +14,7 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_gt_idle.h"
 #include "xe_gt_sysfs.h"
 #include "xe_gt_types.h"
 #include "xe_guc_ct.h"
@@ -867,13 +868,24 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 
 	xe_device_mem_access_get(pc_to_xe(pc));
 
-	memset(pc->bo->vmap.vaddr, 0, size);
-	slpc_shared_data_write(pc, header.size, size);
-
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (ret)
 		goto out_fail_force_wake;
 
+	if (xe->info.skip_guc_pc) {
+		if (xe->info.platform != XE_PVC)
+			xe_gt_idle_enable_c6(gt);
+
+		/* Request max possible since dynamic freq mgmt is not enabled */
+		pc_set_cur_freq(pc, UINT_MAX);
+
+		ret = 0;
+		goto out;
+	}
+
+	memset(pc->bo->vmap.vaddr, 0, size);
+	slpc_shared_data_write(pc, header.size, size);
+
 	ret = pc_action_reset(pc);
 	if (ret)
 		goto out;
@@ -909,10 +921,17 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
  */
 int xe_guc_pc_stop(struct xe_guc_pc *pc)
 {
+	struct xe_device *xe = pc_to_xe(pc);
 	int ret;
 
 	xe_device_mem_access_get(pc_to_xe(pc));
 
+	if (xe->info.skip_guc_pc) {
+		xe_gt_idle_disable_c6(pc_to_gt(pc));
+		ret = 0;
+		goto out;
+	}
+
 	mutex_lock(&pc->freq_lock);
 	pc->freq_ready = false;
 	mutex_unlock(&pc->freq_lock);
@@ -933,6 +952,13 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 
 void xe_guc_pc_fini(struct xe_guc_pc *pc)
 {
+	struct xe_device *xe = pc_to_xe(pc);
+
+	if (xe->info.skip_guc_pc) {
+		xe_gt_idle_disable_c6(pc_to_gt(pc));
+		return;
+	}
+
 	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
@@ -953,6 +979,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
 	int err;
 
+	if (xe->info.skip_guc_pc)
+		return 0;
+
 	mutex_init(&pc->freq_lock);
 
 	bo = xe_bo_create_pin_map(xe, tile, NULL, size,
-- 
2.38.1

