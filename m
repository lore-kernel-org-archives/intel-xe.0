Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E54606A31C
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 05:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DG4q2MJY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E4510E273;
	Sat, 28 Nov 2026 05:58:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D917710E2E9
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Nov 2026 05:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795845497; x=1827381497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m8mDgXmkquJsXFPsqiRHqajnaMuhoaBOlJNUgNbdwkE=;
 b=DG4q2MJYjuVR3PzvMEZ3OudYMHaNuJ43pcr+5SBxRPmAsbeYnJQP/CPB
 nubFpK0nLdgDVXUBNH5jZqgrbwFuYsnk32AdOMkrCq3xZNHMSiOGD4GXr
 J+Otr3Ko3qL3YIKgIV5haaGSadH8EMPZp1rp33Hn26odYZDvV2Ai6pWX+
 4PNcSWwRXrOWI2L7GE6Nni3qFIh+WamvuSjL6xveDBlDfEaVY9kQQGp1Q
 6RQKCXlrcqNcUVg4JLWdYGsThyUFg7ZN6dCBmTwJWobURCMtrVyUVXtWL
 HrFkDRnPY/U1OCmYGnTv482b5QdEBGfOLoTXuqHo6ppJERWsOVjZZlBDr Q==;
X-CSE-ConnectionGUID: JN9CG2SgRC6KSIDrMudQow==
X-CSE-MsgGUID: jd0bNf2JSJCFhJiBhQh84g==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4754901"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4754901"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:58:17 -0800
X-CSE-ConnectionGUID: sBy7mxdvRVmAPlqeqjwFRg==
X-CSE-MsgGUID: DFhQ1FiMTCu2OKVojSAORA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; d="scan'208";a="12304323"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:58:14 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 07/10] drm/xe/hwmon: Restore fan user tables after resume
Date: Sat, 28 Nov 2026 11:29:20 +0530
Message-Id: <20261128055923.3316956-8-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261128055923.3316956-1-karthik.poosa@intel.com>
References: <20261128055923.3316956-1-karthik.poosa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Preserve active manual and full-speed fan tables across system suspend,
runtime D3cold, and FLR.

On resume, wait for late-bound fan-control firmware to reload before
restoring the cached table. If restoration fails, verify fallback to
stock fan control.

v2: Use xe_pcode_read() instead of xe_pcode_read_timeout().

v3:
 - Use u32 for the point index. (Soham)
 - Say "user table point" in suspend warnings. (Soham)
 - Sort the xe_hwmon.h include. (Soham)
 - Call the system PM hooks from xe_device_suspend() and
   xe_device_resume() after the upstream refactor, so FLR also
   restores the table.
 - Check d3cold.allowed only for runtime PM; system suspend always
   loses the table.
 - Pass hwmon to IS_FAN_ENABLED().

v4:
 - Avoid fan-table reads during suspend.
 - Fall back to the stock fan table on user-table restore failure.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |   3 +
 drivers/gpu/drm/xe/xe_hwmon.c        | 109 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.h        |   4 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c |   7 ++
 drivers/gpu/drm/xe/xe_pm.c           |  11 ++-
 5 files changed, 131 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 36693df65594..ed259b0fc3d6 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1428,6 +1428,8 @@ int xe_device_suspend(struct xe_device *xe, bool hibernate, bool flr)
 
 	xe_late_bind_pm_suspend(&xe->late_bind);
 
+	xe_hwmon_suspend(xe, false);
+
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
 
@@ -1558,6 +1560,7 @@ int xe_device_resume(struct xe_device *xe, bool flr)
 	xe_pxp_pm_resume(xe->pxp);
 
 	xe_late_bind_pm_resume(&xe->late_bind);
+	xe_hwmon_resume(xe, false);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 866e54c82d27..3e82a9236b10 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -219,6 +219,8 @@ struct xe_hwmon_fan_info {
 	u8 pwm_enable_mode;
 	/** @is_full_speed: flag indicating if fan is in full speed */
 	bool is_full_speed;
+	/** @restore_user_table: restore user fan table on next resume */
+	bool restore_user_table;
 };
 
 /**
@@ -2994,4 +2996,111 @@ void xe_hwmon_unregister(struct xe_device *xe)
 	hwmon_device_unregister(xe->hwmon->hwmon_dev);
 	xe->hwmon = NULL;
 }
+
+/**
+ * xe_hwmon_suspend - Save hwmon state before suspend
+ * @xe: xe device instance
+ * @runtime: true for runtime suspend, false for system suspend or FLR prepare
+ *
+ * Save any hwmon runtime state that must survive PM suspend transitions.
+ */
+void xe_hwmon_suspend(struct xe_device *xe, bool runtime)
+{
+	struct xe_hwmon *hwmon = xe->hwmon;
+	int fan;
+
+	if (!hwmon || !xe->info.has_fan_control)
+		return;
+
+	/* Runtime suspend keeps the fan tables unless the device enters d3cold. */
+	if (runtime && !xe->d3cold.allowed) {
+		xe_dbg(xe, "d3cold not allowed, skipping fan user-table snapshot\n");
+		return;
+	}
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	for (fan = 0; fan < FAN_MAX; fan++) {
+		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+		u32 point_count = fi->fan_table[USER_FAN_TABLE].point_count;
+
+		if (!IS_FAN_ENABLED(hwmon, fan))
+			continue;
+
+		fi->restore_user_table = false;
+		if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE &&
+		    fi->pwm_enable_mode != XE_FAN_PWM_FULL_SPEED)
+			continue;
+
+		if (point_count < MIN_FAN_CONTROL_POINTS ||
+		    point_count > MAX_FAN_CONTROL_POINTS)
+			continue;
+		fi->restore_user_table = true;
+		xe_dbg(hwmon->xe,
+		       "fan %d cached user table marked for restore, point_count=%u\n", fan,
+		       point_count);
+	}
+
+	mutex_unlock(&hwmon->hwmon_lock);
+}
+
+/**
+ * xe_hwmon_resume - Restore hwmon state after resume
+ * @xe: xe device instance
+ * @runtime: true for runtime resume, false for system resume or FLR done
+ *
+ * Restore any hwmon runtime state that was saved across suspend.
+ */
+void xe_hwmon_resume(struct xe_device *xe, bool runtime)
+{
+	struct xe_hwmon *hwmon = xe->hwmon;
+	int fan;
+
+	if (!hwmon || !xe->info.has_fan_control)
+		return;
+
+	if (runtime && !xe->d3cold.allowed) {
+		xe_dbg(xe, "d3cold not allowed, skipping fan user-table restore\n");
+		return;
+	}
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	for (fan = 0; fan < FAN_MAX; fan++) {
+		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+		int ret;
+
+		if (!IS_FAN_ENABLED(hwmon, fan))
+			continue;
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
+		if (ret) {
+			xe_warn(xe, "failed to restore fan %d user table after resume, ret=%d\n",
+				fan, ret);
+			fi->fan_table[USER_FAN_TABLE].point_count = 0;
+			fi->restore_user_table = false;
+			ret = xe_hwmon_fan_set_auto(hwmon, fan);
+			if (ret) {
+				xe_warn(xe, "fan %d stock fallback failed, state unconfirmed, ret=%d\n",
+					fan, ret);
+				continue;
+			}
+			continue;
+		}
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
index e67e0134f02a..50874b6b6527 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.h
+++ b/drivers/gpu/drm/xe/xe_hwmon.h
@@ -13,9 +13,13 @@ struct xe_device;
 #if IS_REACHABLE(CONFIG_HWMON)
 int xe_hwmon_register(struct xe_device *xe);
 void xe_hwmon_unregister(struct xe_device *xe);
+void xe_hwmon_suspend(struct xe_device *xe, bool runtime);
+void xe_hwmon_resume(struct xe_device *xe, bool runtime);
 #else
 static inline int xe_hwmon_register(struct xe_device *xe) { return 0; };
 static inline void xe_hwmon_unregister(struct xe_device *xe) { }
+static inline void xe_hwmon_suspend(struct xe_device *xe, bool runtime) {}
+static inline void xe_hwmon_resume(struct xe_device *xe, bool runtime) {}
 #endif
 
 #endif /* _XE_HWMON_H_ */
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index ad39383a7e41..c577e2d51620 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -517,10 +517,17 @@ void xe_late_bind_pm_suspend(struct xe_late_bind *late_bind)
  */
 void xe_late_bind_pm_resume(struct xe_late_bind *late_bind)
 {
+	struct xe_late_bind_fw *fan_control_fw;
+	bool fan_control_fw_pending;
+
 	if (!late_bind->component_added || late_bind->disable)
 		return;
 
+	fan_control_fw = &late_bind->late_bind_fw[XE_LB_FW_FAN_CONTROL];
+	fan_control_fw_pending = !!fan_control_fw->payload;
 	xe_late_bind_fw_load(late_bind);
+	if (fan_control_fw_pending)
+		flush_work(&fan_control_fw->work);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index f73f68bd449b..4d4b398cbeda 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -20,6 +20,7 @@
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_gt_idle.h"
+#include "xe_hwmon.h"
 #include "xe_i2c.h"
 #include "xe_irq.h"
 #include "xe_late_bind_fw.h"
@@ -567,6 +568,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	if (err)
 		goto out;
 
+	xe_hwmon_suspend(xe, true);
+
 	/*
 	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
 	 * also checks and deletes bo entry from user fault list.
@@ -683,12 +686,14 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
-	if (IS_VF_CCS_READY(xe))
-		xe_sriov_vf_ccs_register_context(xe);
-
 	if (xe->d3cold.allowed)
 		xe_late_bind_pm_resume(&xe->late_bind);
 
+	xe_hwmon_resume(xe, true);
+
+	if (IS_VF_CCS_READY(xe))
+		xe_sriov_vf_ccs_register_context(xe);
+
 out:
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
-- 
2.34.1

