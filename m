Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD46F606A321
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 05:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bUzX+gIb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F5810E21F;
	Tue, 24 Nov 2026 05:47:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADE410E68C
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 05:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795499210; x=1827035210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XrtJc4Wrgxmiv09DnuFRbqtt7v1ilWhx9qVH4tE97sw=;
 b=bUzX+gIblkvEExKW5IFmf3m+l48ooG4UVMPzrYUDScGrATSnsfZN9Iob
 Y554n59T4pvswfiLLgeBesullqtRx/7/wy+teUcLLIvImeymA/CW6wgyo
 5gRXEdLJFeILmZhdnCmksxYH04U5VtYOvH6cekj+bozS2bllIEDYxyi1I
 iZercWfMvUdA9Lk0+nKlmSa4k4GwfdTfqj1I6fdcoHtciC/uxZ5SqtTBI
 aVyrk/idueHbIscugKOtbPvukwQ9nVllJP9sndhLH1IMNk7tbPHSHMJwZ
 iLF2R/v2m0BszaJ2VXRLELwaV7c5Y8yaw2VExqmeQjqHRJC57ZPldihje w==;
X-CSE-ConnectionGUID: MTRj+FtTT3+zITsFfCRd8g==
X-CSE-MsgGUID: HeroQQsZQd6IYPKHq4X+bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4222657"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4222657"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 21:46:50 -0800
X-CSE-ConnectionGUID: 5H0/amNvSM2hWVViztnwbA==
X-CSE-MsgGUID: uczdp8uiRZu7OEVg4R2Omw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11354618"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 21:46:47 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 08/10] drm/xe/hwmon: Preserve fan user table across suspend
 resume
Date: Tue, 24 Nov 2026 11:18:09 +0530
Message-Id: <20261124054811.798763-9-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124054811.798763-1-karthik.poosa@intel.com>
References: <20261124054811.798763-1-karthik.poosa@intel.com>
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

Save and restore active fan user tables over suspend/resume via new
xe_hwmon PM hooks.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---

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

 drivers/gpu/drm/xe/xe_device.c |   4 +
 drivers/gpu/drm/xe/xe_hwmon.c  | 135 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.h  |   4 +
 drivers/gpu/drm/xe/xe_pm.c     |   5 ++
 4 files changed, 148 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index eafc66d686e2..495e39c75072 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1418,6 +1418,8 @@ int xe_device_suspend(struct xe_device *xe, bool hibernate, bool flr)
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
 
+	xe_hwmon_suspend(xe, false);
+
 	if (flr) {
 		for_each_gt(gt, xe, id)
 			xe_gt_flr_prepare(gt);
@@ -1546,5 +1548,7 @@ int xe_device_resume(struct xe_device *xe, bool flr)
 
 	xe_late_bind_pm_resume(&xe->late_bind);
 
+	xe_hwmon_resume(xe, false);
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 42b6d67e3879..e29774523f37 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -271,6 +271,8 @@ struct xe_hwmon_fan_info {
 	u8 pwm_enable_mode;
 	/** @is_full_speed: flag indicating if fan is in full speed */
 	bool is_full_speed;
+	/** @restore_user_table: restore user fan table on next resume */
+	bool restore_user_table;
 };
 
 /**
@@ -2898,4 +2900,137 @@ void xe_hwmon_unregister(struct xe_device *xe)
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
+	struct xe_tile *root_tile;
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
+	root_tile = xe_device_get_root_tile(hwmon->xe);
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	for (fan = 0; fan < FAN_MAX; fan++) {
+		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+		struct fan_control_point points[MAX_FAN_CONTROL_POINTS];
+		u32 point_count = 0;
+		u32 point;
+		int ret;
+
+		if (!IS_FAN_ENABLED(hwmon, fan))
+			continue;
+
+		fi->restore_user_table = false;
+		if (fi->pwm_enable_mode == XE_FAN_PWM_AUTO_STOCK_TABLE)
+			continue;
+
+		ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
+		if (ret || point_count < MIN_FAN_CONTROL_POINTS) {
+			xe_warn(hwmon->xe,
+				"fan %d user table point count before suspend invalid, ret=%d, count=%u\n",
+				fan, ret, point_count);
+			continue;
+		}
+
+		for (point = 0; point < point_count; point++) {
+			u32 fcp = FCP_INDEX(USER_FAN_TABLE, point);
+
+			ret = xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL,
+								  FSC_READ_FAN_TABLE, fan),
+					    &fcp, NULL);
+			if (ret) {
+				xe_warn(hwmon->xe,
+					"failed to read fan %d user table point %u before suspend, ret=%d\n",
+					fan, point, ret);
+				break;
+			}
+
+			points[point].temp =
+				REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
+			points[point].speed =
+				REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
+		}
+		if (ret)
+			continue;
+
+		memcpy(fi->fan_table[USER_FAN_TABLE].fcp, points,
+		       point_count * sizeof(points[0]));
+		fi->fan_table[USER_FAN_TABLE].point_count = point_count;
+		fi->restore_user_table = true;
+		xe_dbg(hwmon->xe,
+		       "fan %d user table snapshot taken before suspend, point_count=%u\n", fan,
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
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index f73f68bd449b..05e10254b61e 100644
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
@@ -683,6 +686,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	xe_hwmon_resume(xe, true);
+
 	if (IS_VF_CCS_READY(xe))
 		xe_sriov_vf_ccs_register_context(xe);
 
-- 
2.34.1

