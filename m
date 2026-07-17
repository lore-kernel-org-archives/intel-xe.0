Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C44CC44507
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 04:09:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE0B10E74D;
	Fri, 17 Jul 2026 04:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gw8XaDt1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC5F10F268
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jul 2026 04:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784261372; x=1815797372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pJukiF9Tvb1rXsD8C3X2kGCcKbLOxoLulazW4F5E0AE=;
 b=gw8XaDt1zn3VMvgSQsvdc0cDD9m3+fZDRb47TMOrGHOCocvNUUgWiP26
 aj++U+KUYzwtJSrl+n4+l1CZrZRZq03qnsX/O18EUYMR2RKiGGsnjDYAK
 +Xy8CywdISfnc9exlY5+NBAgrTl6t+OTU34wxq1IGH/0wPPyjEk4XzWbP
 4h/xyMICbGssiJJtJrc1jd3xqgzdHMIx7VZxzoOnaXdtaqtd0oeI+zpi8
 D9ruGkOdUn4fs1yXjafX5Q3xlK3fJ6H0uIIY0M/DDeO5EoUvFjXWA/eMv
 2v+mabySTU/gPBQV9/Btc1/daykfy39F05454lA5nQw9SPXlZ4dxkiXS0 w==;
X-CSE-ConnectionGUID: Ht9Y02MESzGxvretmsO+Pw==
X-CSE-MsgGUID: OCLdaO+fQ9aTvs/Y27bO7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85129369"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="85129369"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 21:09:31 -0700
X-CSE-ConnectionGUID: X0APCt7WQhuM4qHUj8LxRg==
X-CSE-MsgGUID: QIBFo/UtSYGmfmIfJ7IEQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="255538933"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 21:09:29 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 8/9] drm/xe/hwmon: preserve fan user table across suspend
 resume
Date: Fri, 17 Jul 2026 09:47:56 +0530
Message-Id: <20260717041757.2759084-9-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260717041757.2759084-1-karthik.poosa@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
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

Save and restore active fan user tables over suspend/resume via new
xe_hwmon PM hooks, and run restore, only when d3cold is allowed.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: Codex:gpt-5-3
---
 drivers/gpu/drm/xe/xe_hwmon.c | 133 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.h |   4 +
 drivers/gpu/drm/xe/xe_pm.c    |   9 +++
 3 files changed, 146 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 770f07fb6511..65f356c741f5 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -229,6 +229,8 @@ struct xe_hwmon_fan_info {
 	u8 pwm_enable_mode;
 	/** @is_full_speed: flag indicating if fan is in full speed */
 	bool is_full_speed;
+	/** @restore_user_table: restore user fan table on next resume */
+	bool restore_user_table;
 };
 
 /**
@@ -2785,4 +2787,135 @@ int xe_hwmon_register(struct xe_device *xe)
 
 	return 0;
 }
+
+/**
+ * xe_hwmon_suspend - Save hwmon state before suspend
+ * @xe: xe device instance
+ *
+ * Save any hwmon runtime state that must survive PM suspend transitions.
+ */
+void xe_hwmon_suspend(struct xe_device *xe)
+{
+	struct xe_hwmon *hwmon = xe->hwmon;
+	struct xe_tile *root_tile;
+	int fan;
+
+	if (!hwmon || !xe->info.has_fan_control)
+		return;
+
+	/*
+	 * User fan-table restore is limited to d3cold flows, so skip snapshot
+	 * work when d3cold is not allowed for this device.
+	 */
+	if (!xe->d3cold.allowed) {
+		xe_dbg(xe, "d3cold not allowed, skipping fan user-table snapshot\n");
+		return;
+	}
+
+	root_tile = xe_device_get_root_tile(hwmon->xe);
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	for (fan = 0; fan < hwmon->num_fans; fan++) {
+		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+		u32 point_count;
+		int ret;
+
+		/*
+		 * Record whether this fan was using the user table
+		 * so resume can restore it if firmware state is reset.
+		 */
+		fi->restore_user_table = (fi->pwm_enable_mode != XE_FAN_PWM_AUTO_STOCK_TABLE);
+
+		xe_dbg(hwmon->xe, "fan %d user table restore flag set to %d\n", fan,
+		       fi->restore_user_table);
+
+		if (!fi->restore_user_table)
+			continue;
+
+		ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
+		if (ret || !point_count) {
+			xe_warn(hwmon->xe,
+				"fan %d point count read before suspend failed, ret=%d, val =%u\n",
+				fan, ret, point_count);
+			continue;
+		}
+
+		fi->fan_table[USER_FAN_TABLE].fan_control_point_count =
+			min_t(u32, point_count, MAX_FAN_CONTROL_POINTS);
+
+		for (int point = 0; point < fi->fan_table[USER_FAN_TABLE].fan_control_point_count;
+		     point++) {
+			u32 fcp = FCP_INDEX(USER_FAN_TABLE, point);
+
+			ret = xe_pcode_read_timeout(root_tile,
+						    PCODE_MBOX(FAN_SPEED_CONTROL,
+							       FSC_READ_FAN_TABLE, fan),
+						    &fcp, NULL,
+						    XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
+			if (ret) {
+				xe_warn(hwmon->xe,
+					"fan %d user point %d before suspend failed, ret=%d\n",
+					fan, point, ret);
+				continue;
+			}
+
+			fi->fan_table[USER_FAN_TABLE].fcp[point].temp =
+				REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
+			fi->fan_table[USER_FAN_TABLE].fcp[point].speed =
+				REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
+		}
+		xe_dbg(hwmon->xe,
+		       "fan %d user table snapshot taken before suspend, point_count=%u\n", fan,
+		       fi->fan_table[USER_FAN_TABLE].fan_control_point_count);
+	}
+
+	mutex_unlock(&hwmon->hwmon_lock);
+}
+
+/**
+ * xe_hwmon_resume - Restore hwmon state after resume
+ * @xe: xe device instance
+ *
+ * Restore any hwmon runtime state that was saved across suspend.
+ */
+void xe_hwmon_resume(struct xe_device *xe)
+{
+	struct xe_hwmon *hwmon = xe->hwmon;
+	int fan;
+
+	if (!hwmon || !xe->info.has_fan_control)
+		return;
+
+	if (!xe->d3cold.allowed) {
+		xe_dbg(xe, "d3cold not allowed, skipping fan user-table restore\n");
+		return;
+	}
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	for (fan = 0; fan < hwmon->num_fans; fan++) {
+		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+		int ret;
+
+		if (!fi->restore_user_table) {
+			xe_dbg(xe, "fan %d user table restore not required\n", fan);
+			continue;
+		}
+
+		/* Re-program cached user-table settings for fans active before suspend. */
+		ret = xe_hwmon_activate_user_fan_table(hwmon, fan,
+						       fi->is_full_speed,
+						       USER_FAN_TABLE);
+		if (ret)
+			xe_warn(xe, "failed to restore fan %d user table after resume, ret=%d\n",
+				fan, ret);
+
+		xe_dbg(xe, "fan %d user table restored\n", fan);
+		fi->restore_user_table = false;
+	}
+
+	mutex_unlock(&hwmon->hwmon_lock);
+}
+
 MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
index d02c1bfe8c0a..6c6f30208508 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.h
+++ b/drivers/gpu/drm/xe/xe_hwmon.h
@@ -12,8 +12,12 @@ struct xe_device;
 
 #if IS_REACHABLE(CONFIG_HWMON)
 int xe_hwmon_register(struct xe_device *xe);
+void xe_hwmon_suspend(struct xe_device *xe);
+void xe_hwmon_resume(struct xe_device *xe);
 #else
 static inline int xe_hwmon_register(struct xe_device *xe) { return 0; };
+static inline void xe_hwmon_suspend(struct xe_device *xe) {}
+static inline void xe_hwmon_resume(struct xe_device *xe) {}
 #endif
 
 #endif /* _XE_HWMON_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 99562f691080..23a78fa4a71e 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -23,6 +23,7 @@
 #include "xe_i2c.h"
 #include "xe_irq.h"
 #include "xe_late_bind_fw.h"
+#include "xe_hwmon.h"
 #include "xe_pcode.h"
 #include "xe_printk.h"
 #include "xe_pxp.h"
@@ -189,6 +190,8 @@ int xe_pm_suspend(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
 
+	xe_hwmon_suspend(xe);
+
 	xe_display_pm_suspend(xe);
 
 	/* FIXME: Super racey... */
@@ -290,6 +293,8 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_late_bind_fw_load(&xe->late_bind);
 
+	xe_hwmon_resume(xe);
+
 	drm_dbg(&xe->drm, "Device resumed\n");
 	xe_pm_block_end_signalling();
 	return 0;
@@ -615,6 +620,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	if (err)
 		goto out;
 
+	xe_hwmon_suspend(xe);
+
 	/*
 	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
 	 * also checks and deletes bo entry from user fault list.
@@ -724,6 +731,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	xe_hwmon_resume(xe);
+
 	if (IS_VF_CCS_READY(xe))
 		xe_sriov_vf_ccs_register_context(xe);
 
-- 
2.25.1

