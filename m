Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A055B606A321
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 05:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hCBcBPFa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1E110E0DE;
	Tue, 24 Nov 2026 05:47:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABB210E0DE
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 05:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795499213; x=1827035213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j0dRrtkw+dHM9iR/+JVq6XdBE1x2WrbfDfv8maSr0h0=;
 b=hCBcBPFahfb3X+JSuNlm8zSpL2+Upsqk83UbbeRvlW1jLEJHD9FsBA/l
 +rdjmM80tORFEX07BnDY3Pj5LUXjYtbxy1Jge6Ow0wyy7pzV8tMfXdbyO
 1zbxqvqoUOp4coQMoa9BJ2+sq5iA9kq2M98lpN3OzxybrTrqLxgRFl8q+
 tMd6hM4Ybk0hR/H7AkNXL/soii4+HHkE0p8ktYdC8hVHCAew21RQaxcrY
 2DOR0S98aAzxsvIYcGVes201/LowJHamUWvXK7Nc7B4AtSS+RZUX4Zcxn
 3xk3YPH9t8nsP9qHKXAbUeswR8jifx3jTxrNYdQxQl9rttbQzHYQ9wWK4 w==;
X-CSE-ConnectionGUID: He7253/+QXCXKkFyW2cWtg==
X-CSE-MsgGUID: Xghlxi5yRTG0yzEZgJErug==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4222658"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4222658"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 21:46:53 -0800
X-CSE-ConnectionGUID: GdomquT0Qeebpx+o44GUQQ==
X-CSE-MsgGUID: Ug1VWCrOQsm1HZHSk1tYKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11354622"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 21:46:50 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 09/10] drm/xe/hwmon: Update fan info after late binding
Date: Tue, 24 Nov 2026 11:18:10 +0530
Message-Id: <20261124054811.798763-10-karthik.poosa@intel.com>
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

Add xe_hwmon_fan_update_post_lb() to re-read the fan enable mask and
stock fan tables once the fan-control late binding firmware is loaded.

Pass a mask of newly enabled fans to xe_hwmon_read_fan_control_info(),
so only those fans start in automatic mode and the mode selected by the
user is kept for fans that were already known.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---

v2:
 - Compare lbfw->id with XE_LB_FW_FAN_CONTROL. (Soham)
 - Use xe already in scope. (Soham)
 - Spell out "late binding" in warnings. (Soham)
 - Return an error from xe_hwmon_get_fan_enable_mask() and keep the
   old mask if the read fails.
 - Start fans enabled after late binding in automatic mode.

 drivers/gpu/drm/xe/xe_hwmon.c        | 47 +++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_hwmon.h        |  2 ++
 drivers/gpu/drm/xe/xe_late_bind_fw.c |  3 ++
 3 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index e29774523f37..2f1d779e2784 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -1223,14 +1223,14 @@ static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 sub
 				     uval, NULL);
 }
 
-static void xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
+static int xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
 {
 	int ret;
 
 	/* Platforms that don't return correct value */
 	if (hwmon->xe->info.platform == XE_DG2) {
 		hwmon->fan_enable_mask = GENMASK(1, 0);
-		return;
+		return 0;
 	}
 
 	ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, 0,
@@ -1238,7 +1238,7 @@ static void xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
 	if (ret) {
 		hwmon->fan_enable_mask = 0;
 		xe_warn(hwmon->xe, "failed to read number of fans, ret=%d\n", ret);
-		return;
+		return ret;
 	}
 
 	/* Check if fan mask exceeds FAN_MAX and log a warning if it does */
@@ -1249,6 +1249,8 @@ static void xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
 	}
 
 	xe_info(hwmon->xe, "Number of fans detected: %u\n", hweight32(hwmon->fan_enable_mask));
+
+	return 0;
 }
 
 static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *point_count,
@@ -1825,7 +1827,7 @@ static void xe_hwmon_init_curve_attrs(struct xe_hwmon *hwmon)
 	hwmon->curve_group.is_visible = xe_hwmon_curve_attributes_visible;
 }
 
-static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
+static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon, u32 new_fan_mask)
 {
 	int point;
 	int fan;
@@ -1897,8 +1899,9 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
 		if (!fi->fan_table[STOCK_FAN_TABLE].point_count)
 			continue;
 
-		/* Set PWM enable mode to automatic i.e stock table in use. */
-		fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
+		/* Start new fans in automatic mode; keep the user's mode for known fans. */
+		if (new_fan_mask & BIT(fan))
+			fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
 
 		/* Read minimum fan PWM */
 		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
@@ -2824,7 +2827,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 				xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
 
 		/* Fan control tables initialization */
-		if (xe_hwmon_read_fan_control_info(hwmon))
+		if (xe_hwmon_read_fan_control_info(hwmon, hwmon->fan_enable_mask))
 			xe_warn(hwmon->xe, "Fan control tables are not available\n");
 	}
 	return xe_hwmon_init_temp_info(hwmon);
@@ -3033,4 +3036,34 @@ void xe_hwmon_resume(struct xe_device *xe, bool runtime)
 	mutex_unlock(&hwmon->hwmon_lock);
 }
 
+/**
+ * xe_hwmon_fan_update_post_lb - Update fan info after late binding
+ * @xe: xe device instance
+ *
+ * This function reads the number of fans and their stock table after late binding.
+ */
+void xe_hwmon_fan_update_post_lb(struct xe_device *xe)
+{
+	struct xe_hwmon *hwmon = xe->hwmon;
+	u32 old_mask;
+
+	if (!hwmon || !xe->info.has_fan_control)
+		return;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	old_mask = hwmon->fan_enable_mask;
+	if (xe_hwmon_get_fan_enable_mask(hwmon)) {
+		xe_warn(hwmon->xe, "keeping fan enable mask %#x after late binding\n", old_mask);
+		hwmon->fan_enable_mask = old_mask;
+		goto unlock;
+	}
+
+	if (xe_hwmon_read_fan_control_info(hwmon, hwmon->fan_enable_mask & ~old_mask))
+		xe_warn(hwmon->xe, "failed to read stock fan tables after late binding\n");
+
+unlock:
+	mutex_unlock(&hwmon->hwmon_lock);
+}
+
 MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
index 50874b6b6527..4d46290e7a9d 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.h
+++ b/drivers/gpu/drm/xe/xe_hwmon.h
@@ -15,11 +15,13 @@ int xe_hwmon_register(struct xe_device *xe);
 void xe_hwmon_unregister(struct xe_device *xe);
 void xe_hwmon_suspend(struct xe_device *xe, bool runtime);
 void xe_hwmon_resume(struct xe_device *xe, bool runtime);
+void xe_hwmon_fan_update_post_lb(struct xe_device *xe);
 #else
 static inline int xe_hwmon_register(struct xe_device *xe) { return 0; };
 static inline void xe_hwmon_unregister(struct xe_device *xe) { }
 static inline void xe_hwmon_suspend(struct xe_device *xe, bool runtime) {}
 static inline void xe_hwmon_resume(struct xe_device *xe, bool runtime) {}
+static inline void xe_hwmon_fan_update_post_lb(struct xe_device *xe) {}
 #endif
 
 #endif /* _XE_HWMON_H_ */
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 355d7c841871..2ac92a12cc32 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -13,6 +13,7 @@
 #include <drm/drm_print.h>
 
 #include "xe_device.h"
+#include "xe_hwmon.h"
 #include "xe_late_bind_fw.h"
 #include "xe_pcode.h"
 #include "xe_pcode_api.h"
@@ -289,6 +290,8 @@ static void xe_late_bind_work(struct work_struct *work)
 	if (!ret) {
 		drm_dbg(&xe->drm, "Load %s firmware successful\n",
 			fw_id_to_name[lbfw->id]);
+		if (lbfw->id == XE_LB_FW_FAN_CONTROL)
+			xe_hwmon_fan_update_post_lb(xe);
 		goto out;
 	}
 
-- 
2.34.1

