Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2223CCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 08:03:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B96B10E74F;
	Wed, 15 Oct 2025 08:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2/OlCip";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE04A10E75A
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 08:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760515379; x=1792051379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x2kRDEO23eyomss8cdNRjVwv3knbjJt71nyYKTimWG0=;
 b=H2/OlCipqh8BzgXvP+vbNFteH2i2z3ckzRXuoHU9VBchwssday8uiugr
 zComQ0htQTcU/TNDN2g6bVGK+Tvkena50HrmKhIndm1Y7UlHCYD2cmWGy
 L9HoYwc51lccLFqjCA3igDhG9ltIkJ3YMiNHWMTKfN1uk2SrPIK53LFnF
 pyO8DMxR077HHUI09mr4yB5iSml7Tix2v/qwOD692cvEvfRns1bVs02l1
 LAY7e8h2nwHc6/M8iwn6HdQjr6G3zUZS7aHMMO2TJ1BYRGqBQxq7ABhAG
 O/LHqdwrZrxR8eR1KS6qHIL9NM9rZlgOfR/SWnee9ccbPKWboO9Ynp/Iz w==;
X-CSE-ConnectionGUID: 4jhRv3adSoeay9THnT7n8w==
X-CSE-MsgGUID: pXTMqEnAS5StBPh7gmEJRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="61891504"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="61891504"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 01:02:59 -0700
X-CSE-ConnectionGUID: zy9RNNAeRNSs7fRsRMg7pQ==
X-CSE-MsgGUID: 2YKUKBNgQNWqmqtO2z2vzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="205805465"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 01:02:54 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, varun.gupta@intel.com,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 karthik.poosa@intel.com
Subject: [PATCH v5 08/12] drm/xe/vrsr: Refactor d3cold.allowed to a enum
Date: Wed, 15 Oct 2025 13:37:06 +0530
Message-Id: <20251015080710.1468409-9-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015080710.1468409-1-badal.nilawar@intel.com>
References: <20251015080710.1468409-1-badal.nilawar@intel.com>
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

From: Anshuman Gupta <anshuman.gupta@intel.com>

Add xe_d3_state enum to add support for VRAM Self Refresh
d3cold state.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
---
V2: Rebased
---
 drivers/gpu/drm/xe/display/xe_display.c |  6 +++---
 drivers/gpu/drm/xe/xe_device_types.h    |  5 +++--
 drivers/gpu/drm/xe/xe_pci.c             |  6 +++---
 drivers/gpu/drm/xe/xe_pm.c              | 21 +++++++++++----------
 drivers/gpu/drm/xe/xe_pm.h              |  8 +++++++-
 5 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 205040f43ddd..35d09109462e 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -395,7 +395,7 @@ void xe_display_pm_runtime_suspend(struct xe_device *xe)
 	if (!xe->info.probe_display)
 		return;
 
-	if (xe->d3cold.allowed) {
+	if (xe->d3cold.target_state) {
 		xe_display_enable_d3cold(xe);
 		return;
 	}
@@ -421,7 +421,7 @@ void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
 	if (!xe->info.probe_display)
 		return;
 
-	if (xe->d3cold.allowed)
+	if (xe->d3cold.target_state)
 		xe_display_pm_suspend_late(xe);
 
 	/*
@@ -501,7 +501,7 @@ void xe_display_pm_runtime_resume(struct xe_device *xe)
 	if (!xe->info.probe_display)
 		return;
 
-	if (xe->d3cold.allowed) {
+	if (xe->d3cold.target_state) {
 		xe_display_disable_d3cold(xe);
 		return;
 	}
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index da81e1937918..a139f8aec33b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -20,6 +20,7 @@
 #include "xe_memirq_types.h"
 #include "xe_oa_types.h"
 #include "xe_platform_types.h"
+#include "xe_pm.h"
 #include "xe_pmu_types.h"
 #include "xe_pt_types.h"
 #include "xe_sriov_pf_types.h"
@@ -510,8 +511,8 @@ struct xe_device {
 		/** @d3cold.capable: Indicates if root port is d3cold capable */
 		bool capable;
 
-		/** @d3cold.allowed: Indicates if d3cold is a valid device state */
-		bool allowed;
+		/** @d3cold.target_state: Indicates d3cold target state */
+		enum xe_d3_state target_state;
 
 		/** @d3cold.vrsr_capable: Indicates if d3cold VRAM Self Refresh is supported */
 		bool vrsr_capable;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 0cc14ddd92de..eb60cf44c1d7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1118,7 +1118,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
 
 	pci_save_state(pdev);
 
-	if (xe->d3cold.allowed) {
+	if (xe->d3cold.target_state) {
 		d3cold_toggle(pdev, D3COLD_ENABLE);
 		pci_disable_device(pdev);
 		pci_ignore_hotplug(pdev);
@@ -1143,7 +1143,7 @@ static int xe_pci_runtime_resume(struct device *dev)
 
 	pci_restore_state(pdev);
 
-	if (xe->d3cold.allowed) {
+	if (xe->d3cold.target_state) {
 		err = pci_enable_device(pdev);
 		if (err)
 			return err;
@@ -1159,7 +1159,7 @@ static int xe_pci_runtime_idle(struct device *dev)
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 
-	xe_pm_d3cold_allowed_toggle(xe);
+	xe_pm_d3cold_target_state_toggle(xe);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 61466bf0bba6..aa38dbe1e368 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -719,7 +719,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 
 	xe_display_pm_runtime_suspend(xe);
 
-	if (xe->d3cold.allowed) {
+	if (xe->d3cold.target_state) {
 		err = xe_bo_evict_all(xe);
 		if (err)
 			goto out_resume;
@@ -771,7 +771,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_idle_disable_c6(gt);
 
-	if (xe->d3cold.allowed) {
+	if (xe->d3cold.target_state) {
 		err = xe_pcode_ready(xe, true);
 		if (err)
 			goto out;
@@ -787,7 +787,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 			goto out;
 	}
 
-	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
+	if (xe->d3cold.target_state != XE_D3HOT)
+		xe_i2c_pm_resume(xe, true);
 
 	xe_irq_resume(xe);
 
@@ -796,7 +797,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_display_pm_runtime_resume(xe);
 
-	if (xe->d3cold.allowed) {
+	if (xe->d3cold.target_state) {
 		err = xe_bo_restore_late(xe);
 		if (err)
 			goto out;
@@ -807,7 +808,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	if (IS_VF_CCS_READY(xe))
 		xe_sriov_vf_ccs_register_context(xe);
 
-	if (xe->d3cold.allowed)
+	if (xe->d3cold.target_state != XE_D3HOT)
 		xe_late_bind_fw_load(&xe->late_bind);
 
 out:
@@ -1046,13 +1047,13 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
 }
 
 /**
- * xe_pm_d3cold_allowed_toggle - Check conditions to toggle d3cold.allowed
+ * xe_pm_d3cold_target_state_toggle - Check conditions to toggle target_state
  * @xe: xe device instance
  *
  * To be called during runtime_pm idle callback.
  * Check for all the D3Cold conditions ahead of runtime suspend.
  */
-void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
+void xe_pm_d3cold_target_state_toggle(struct xe_device *xe)
 {
 	struct ttm_resource_manager *man;
 	u32 total_vram_used_mb = 0;
@@ -1060,7 +1061,7 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
 	int i;
 
 	if (!xe->d3cold.capable) {
-		xe->d3cold.allowed = false;
+		xe->d3cold.target_state = XE_D3HOT;
 		return;
 	}
 
@@ -1075,9 +1076,9 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
 	mutex_lock(&xe->d3cold.lock);
 
 	if (total_vram_used_mb < xe->d3cold.vram_threshold)
-		xe->d3cold.allowed = true;
+		xe->d3cold.target_state = XE_D3COLD_OFF;
 	else
-		xe->d3cold.allowed = false;
+		xe->d3cold.target_state = XE_D3HOT;
 
 	mutex_unlock(&xe->d3cold.lock);
 }
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 3d5a8c4a4971..f6c09841b0ae 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -12,6 +12,12 @@
 
 struct xe_device;
 
+enum xe_d3_state {
+	XE_D3HOT = 0,
+	XE_D3COLD_VRSR,
+	XE_D3COLD_OFF,
+};
+
 int xe_pm_suspend(struct xe_device *xe);
 int xe_pm_resume(struct xe_device *xe);
 
@@ -30,7 +36,7 @@ void xe_pm_runtime_get_noresume(struct xe_device *xe);
 bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
-void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
+void xe_pm_d3cold_target_state_toggle(struct xe_device *xe);
 bool xe_rpm_reclaim_safe(const struct xe_device *xe);
 struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
 int xe_pm_block_on_suspend(struct xe_device *xe);
-- 
2.34.1

