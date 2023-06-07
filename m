Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4B9C7EE23
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 11:05:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE9110E4B8;
	Wed,  7 Jun 2023 11:05:46 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5773C10E4B8
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 11:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686135944; x=1717671944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SSCusmjt8T3WbROIFLyhZd/mc9yYrWznQ04DCeFb3tk=;
 b=BrO7kl1hOyovuAHV3WN5klitxUgftcPNu08IBqj/onUKXUsxiNcLQkX1
 ZU3lUmLtFcA1La5Clkb+zQHErj591P8Mlzbsk0REO9+/KJczivZuSDorC
 VkQcg6YvbhT6b6W+75pWX1kYd4fors1bZvpzeuSH+pDFk8ZR6YVbJ2ZGK
 BJ//Kw0w6JdcPrXplxQ3qMMNRFfFWIUd9BhPVEvrOm64x+DE4CeWptMsq
 WDlLFyo4eBBRn06rzoyf5Ja5wH3QSlUjsMJrrLgeZJxaIMAtdAMqe1QnS
 6nSRtiaLhNBDph3Zhn9j9WhNP9tgTJySFEE0mJjPSYe9H1bY9KKu5cBA/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="420512535"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="420512535"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 04:05:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="703593492"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="703593492"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 04:05:41 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  7 Jun 2023 16:33:28 +0530
Message-Id: <20230607110328.3739706-6-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230607110328.3739706-1-anshuman.gupta@intel.com>
References: <20230607110328.3739706-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 5/5] drm/xe/pm: Init pcode and restore vram on
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Don't init pcode and restore VRAM objects in vain.
We can rely on primary GT GUC_STATUS to detect whether
card has really lost power even when d3cold is allowed by xe.
Adding d3cold.lost_power flag to avoid pcode init and vram
restoration.
Also cleaning up the TODO code comment.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_guc.c          | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h          |  1 +
 drivers/gpu/drm/xe/xe_pci.c          |  2 --
 drivers/gpu/drm/xe/xe_pm.c           | 15 ++++++++++++---
 5 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bdd093d30788..34bf2ea3b3f9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -382,6 +382,9 @@ struct xe_device {
 		/** @allowed: Indicates if d3cold is a valid device state */
 		bool allowed;
 
+		/** @power_lost Indicates if card has really lost power. */
+		bool power_lost;
+
 		/**
 		 * @vram_threshold is the permissible threshold(in megabytes)
 		 * for vram save/restore. d3cold will be disallowed,
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e51d8fb4a354..706b3bc0452e 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -848,3 +848,20 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 	xe_guc_ct_print(&guc->ct, p, false);
 	xe_guc_submit_print(guc, p);
 }
+
+/* Srtictly to called from RPM resume handler */
+bool xe_guc_has_lost_power(struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	u32 status;
+	int err;
+
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err)
+		return false;
+
+	status = xe_mmio_read32(gt, GUC_STATUS);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+
+	return  status & GS_MIA_IN_RESET;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 74a74051f354..3e628bbbe69e 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -35,6 +35,7 @@ void xe_guc_reset_wait(struct xe_guc *guc);
 void xe_guc_stop_prepare(struct xe_guc *guc);
 int xe_guc_stop(struct xe_guc *guc);
 int xe_guc_start(struct xe_guc *guc);
+bool xe_guc_has_lost_power(struct xe_guc *guc);
 
 static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
 {
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6cf66ce25039..b5cd3b69c98e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -829,8 +829,6 @@ static int xe_pci_runtime_idle(struct device *dev)
 		 * but maybe include some other conditions. So, before
 		 * we can re-enable the D3cold, we need to:
 		 * 1. rewrite the VRAM save / restore to avoid buffer object locks
-		 * 2. at resume, detect if we really lost power and avoid memory
-		 *    restoration if we were only up to d3cold
 		 */
 		xe->d3cold.allowed = false;
 	}
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 9872a800b0b3..e37ec8aca609 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -16,6 +16,7 @@
 #include "xe_display.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
+#include "xe_guc.h"
 #include "xe_irq.h"
 #include "xe_pcode.h"
 
@@ -192,11 +193,19 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 
 int xe_pm_runtime_resume(struct xe_device *xe)
 {
-	struct xe_gt *gt;
+	struct xe_gt *gt, *gt0;
 	u8 id;
 	int err;
 
-	if (xe->d3cold.allowed) {
+	/*
+	 * It can be possible that xe has allowed d3cold but other pcie devices
+	 * in gfx card soc would have blocked d3cold, therefore card has not
+	 * really lost power. Detecting primary Gt power is sufficient.
+	 */
+	gt0 = xe_device_get_gt(xe, 0);
+	xe->d3cold.power_lost = xe_guc_has_lost_power(&gt0->uc.guc);
+
+	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
 		for_each_gt(gt, xe, id) {
 			err = xe_pcode_init(gt);
 			if (err)
@@ -217,7 +226,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
 
-	if (xe->d3cold.allowed) {
+	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
 		err = xe_bo_restore_user(xe);
 		if (err)
 			return err;
-- 
2.38.0

