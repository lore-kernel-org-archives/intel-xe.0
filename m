Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1350EB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 08:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A859F10E2FC;
	Tue, 18 Jul 2023 08:11:55 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0370710E2FC
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jul 2023 08:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689667912; x=1721203912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0ug7gIBhuPEtrzxoC2gE2pFmm727Ahg7iefv8a9NUuA=;
 b=KO1e0euB3xy0DceCBSjK5gde8Fx4gOWMkDKaiZHU09NcYwqYHky4+nwV
 qtb7NhMKSZ9p44VkJ5Ws+tU104Ujyle+aWUxscZfYLMpIeBLs4/dlBpql
 w/FbsvVsWhPMq1RLU6xCCZ4toRM8SMgxg0cDWyU/PI1paqLeFVGuXsI++
 B6STqr5+XfTiZt+PcF4IRl8hbPLLFLdEfbvMBcM4119t7b7ma2oQmkgT6
 6JRd0U3bBj20tMKCpcDOBscrYuSZS5cdw+6CxfdjEH8Nw+AKvew7cduwS
 At6Qw4y8ytXEfwcKo339n2jj15jXxSHSeeoc/GbxMxPkjuR7D5NlQQerO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="356084445"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; d="scan'208";a="356084445"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 01:11:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="717508218"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; d="scan'208";a="717508218"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 01:11:49 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jul 2023 13:37:03 +0530
Message-Id: <20230718080703.239343-6-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230718080703.239343-1-anshuman.gupta@intel.com>
References: <20230718080703.239343-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 5/5] drm/xe/pm: Init pcode and restore vram on
 power lost
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
Cc: sujaritha.sundaresan@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Don't init pcode and restore VRAM objects in vain.
We can rely on primary GT GUC_STATUS to detect whether
card has really lost power even when d3cold is allowed by xe.
Adding d3cold.lost_power flag to avoid pcode init and vram
restoration.
Also cleaning up the TODO code comment.

v2:
- %s/xe_guc_has_lost_power()/xe_guc_in_reset().
- Used existing gt instead of new variable. [Rodrigo]
- Added kernel-doc function comment. [Rodrigo]
- xe_guc_in_reset() return true if failed to get fw.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_guc.c          | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h          |  1 +
 drivers/gpu/drm/xe/xe_pci.c          |  2 --
 drivers/gpu/drm/xe/xe_pm.c           | 13 +++++++++++--
 5 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 624c8cb3b13b..23f8e51b04f0 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -355,6 +355,9 @@ struct xe_device {
 		/** @allowed: Indicates if d3cold is a valid device state */
 		bool allowed;
 
+		/** @power_lost: Indicates if card has really lost power. */
+		bool power_lost;
+
 		/**
 		 * @vram_threshold:
 		 *
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index d44537abf7da..ed90d738d673 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -844,3 +844,30 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 	xe_guc_ct_print(&guc->ct, p, false);
 	xe_guc_submit_print(guc, p);
 }
+
+/**
+ * xe_guc_in_reset() - Detect if GuC MIA is in reset.
+ * @guc: The GuC object
+ *
+ * This function detects runtime resume from d3cold by leveraging
+ * GUC_STATUS, GUC doesn't get reset during d3hot,
+ * it strictly to be called from RPM resume handler.
+ *
+ * Return: true if failed to get forcewake or GuC MIA is in Reset,
+ * otherwise false.
+ */
+bool xe_guc_in_reset(struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	u32 status;
+	int err;
+
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err)
+		return true;
+
+	status = xe_mmio_read32(gt, GUC_STATUS);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+
+	return  status & GS_MIA_IN_RESET;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 74a74051f354..f64f22e97169 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -35,6 +35,7 @@ void xe_guc_reset_wait(struct xe_guc *guc);
 void xe_guc_stop_prepare(struct xe_guc *guc);
 int xe_guc_stop(struct xe_guc *guc);
 int xe_guc_start(struct xe_guc *guc);
+bool xe_guc_in_reset(struct xe_guc *guc);
 
 static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
 {
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 9b78dbe32742..78df43c20cd2 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -846,8 +846,6 @@ static int xe_pci_runtime_idle(struct device *dev)
 		 * but maybe include some other conditions. So, before
 		 * we can re-enable the D3cold, we need to:
 		 * 1. rewrite the VRAM save / restore to avoid buffer object locks
-		 * 2. at resume, detect if we really lost power and avoid memory
-		 *    restoration if we were only up to d3cold
 		 */
 		xe->d3cold.allowed = false;
 	}
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 5bb7d597e97d..03c6ab9a5100 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -17,6 +17,7 @@
 #include "xe_display.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
+#include "xe_guc.h"
 #include "xe_irq.h"
 #include "xe_pcode.h"
 
@@ -197,7 +198,15 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	u8 id;
 	int err;
 
-	if (xe->d3cold.allowed) {
+	/*
+	 * It can be possible that xe has allowed d3cold but other pcie devices
+	 * in gfx card soc would have blocked d3cold, therefore card has not
+	 * really lost power. Detecting primary Gt power is sufficient.
+	 */
+	gt = xe_device_get_gt(xe, 0);
+	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
+
+	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
 		for_each_gt(gt, xe, id) {
 			err = xe_pcode_init(gt);
 			if (err)
@@ -218,7 +227,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
 
-	if (xe->d3cold.allowed) {
+	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
 		err = xe_bo_restore_user(xe);
 		if (err)
 			return err;
-- 
2.38.0

