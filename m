Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDB8C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 14:32:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B22710E6F0;
	Thu, 13 Jul 2023 14:32:52 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B407E10E6EF
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 14:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689258770; x=1720794770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B6Dk/NFvzMzBfcbDY/VjyiMLxpPd9fEhILMYxfUeF2E=;
 b=Q5XRst45N39DVbIsY3Vvuxsc+xlgk4HpLBnfXVDLheHC2u3MpT7kjkVg
 NDEWfVOn7tI4jy0JC0ZZP216V6ywSQfCcrb1Iuby/0quVJvv6Aenq3MB7
 OJ+yRSxm24RnQ+e/LVx1Sg2fEKLQmCLvnVH7iRkh0kZ0ywjtxe7n5wGmi
 V9PMr64nZllyJZBr7l6zCb/JNqunM+81aK6pJxfV2VyzyWWzlmfokCFUJ
 r3rtHrIDUFSNqhlXdbDUtKqkZWscKsaW02w5TgCjAPkcv+ZS0mR2T2L7a
 dvA2UlxItfgXv8JdJjWVDao9IWI6CziF17W9H2mn6L/7ktX4ROkenbElS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="362668612"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="362668612"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 07:32:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="812016320"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="812016320"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 07:32:47 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 20:01:21 +0530
Message-Id: <20230713143121.3901357-6-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230713143121.3901357-1-anshuman.gupta@intel.com>
References: <20230713143121.3901357-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 5/5] drm/xe/pm: Init pcode and restore vram on
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
- Added kenrel-doc function comment. [Rodrigo]
- xe_guc_in_reset() return true if failed to get fw.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_guc.c          | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h          |  1 +
 drivers/gpu/drm/xe/xe_pci.c          |  2 --
 drivers/gpu/drm/xe/xe_pm.c           | 13 +++++++++++--
 5 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f2a6998e8873..89ac2bf482eb 100644
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
index 8245bbc58770..d6ad1bb85a0e 100644
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
index 871868301838..7bb5330ab2db 100644
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
index c732317b55cb..9a934674d470 100644
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

