Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FEDC44507
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 04:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7956B10E3FB;
	Fri, 17 Jul 2026 04:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJYv9zJw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4333A10E3FB
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jul 2026 04:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784261375; x=1815797375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sPmatBuf7W8QmEpWlytPekltp75V90oAL3/EXv2t83s=;
 b=CJYv9zJw/iiY7WYMzlIwHaOCmUjgCWS/LPjf83oVJiELpqI7XPlt1grX
 Ts8B+loNHAXNYgv6NzsaibPXgK53c7lSt5t8r1U+6XH8gEtca5anEeUYQ
 WQTzgoo7G2eLH34Qvv+g4yJzc5NIGUZCGFX73Mc+qNcYjydGDhc/UQe9V
 Ot6RnzxNgsIMhjxmilmeatUDMzYcWl2uOQq02m6/v3v5gr/kKjxaUqEOg
 aPcY6ZM56G/btpr5Kl6oxj8OeY10JMtWQdh2NS1Fu0EIfnvcFUe+NurBr
 G777TP8sbdpgUovjXwYI1bbI2BjAxulJe9yDeA7xqyAcFsaOp5gpBJq6H w==;
X-CSE-ConnectionGUID: +0tmCk4fTvmI53IA0m1UWQ==
X-CSE-MsgGUID: anuDp10zTXyW9DHoX32XvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85129371"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="85129371"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 21:09:35 -0700
X-CSE-ConnectionGUID: sgcVe9ObSY+nnC4wFbbMIw==
X-CSE-MsgGUID: y3dJrBzYSnW4t5WSmdIBYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="255538937"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 21:09:33 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 9/9] drm/xe/hwmon: Update fan info after late binding
Date: Fri, 17 Jul 2026 09:47:57 +0530
Message-Id: <20260717041757.2759084-10-karthik.poosa@intel.com>
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

Add xe_hwmon_fan_update_post_lb() to update fan info after late binding.
Add param is_init into xe_hwmon_read_fan_control_info() to avoid
resetting user pwm mode post-LB.
Call init path with is_init=true from preregistration.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: Codex:gpt-5-3
---
 drivers/gpu/drm/xe/xe_hwmon.c        | 50 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_hwmon.h        |  2 ++
 drivers/gpu/drm/xe/xe_late_bind_fw.c |  3 ++
 3 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 65f356c741f5..518ba4438de4 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -1848,7 +1848,7 @@ static const struct attribute_group hwmon_curve_attrgroup = {
 	.is_visible = xe_hwmon_curve_attributes_visible,
 };
 
-static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
+static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon, bool is_init)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
 	int point;
@@ -1901,8 +1901,13 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
 			       fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
 		}
 
-		/* Set PWM enable mode to automatic i.e stock table in use. */
-		fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
+		/*
+		 * Set PWM enable mode to automatic i.e stock table in use, only during init.
+		 * For late binding, the mode is already set by the user and should not be
+		 * overridden.
+		 */
+		if (is_init)
+			fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
 
 		/* Read minimum fan PWM */
 		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
@@ -2737,7 +2742,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 				xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
 
 		/* Fan control tables initialization */
-		if (xe_hwmon_read_fan_control_info(hwmon))
+		if (xe_hwmon_read_fan_control_info(hwmon, true))
 			xe_warn(hwmon->xe, "Fan control tables are not available\n");
 	}
 
@@ -2918,4 +2923,41 @@ void xe_hwmon_resume(struct xe_device *xe)
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
+	int fan;
+	int num_fans;
+
+	if (!hwmon || !xe->info.has_fan_control)
+		return;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	/* Read number of fans */
+	if (xe_hwmon_get_num_fans(hwmon, &num_fans)) {
+		xe_warn(hwmon->xe, "Failed to read number of fans after LB\n");
+		goto unlock;
+	}
+	hwmon->num_fans = num_fans;
+	xe_dbg(hwmon->xe, "Number of fans detected after LB: %u\n", hwmon->num_fans);
+
+	/* Read stock table */
+	for (fan = 0; fan < hwmon->num_fans; fan++) {
+		if (xe_hwmon_read_fan_control_info(hwmon, false)) {
+			xe_warn(hwmon->xe, "Failed to read fan %d stock table after LB\n", fan);
+			continue;
+		}
+	}
+
+unlock:
+	mutex_unlock(&hwmon->hwmon_lock);
+}
+
 MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
index 6c6f30208508..7198d7a4a1be 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.h
+++ b/drivers/gpu/drm/xe/xe_hwmon.h
@@ -14,10 +14,12 @@ struct xe_device;
 int xe_hwmon_register(struct xe_device *xe);
 void xe_hwmon_suspend(struct xe_device *xe);
 void xe_hwmon_resume(struct xe_device *xe);
+void xe_hwmon_fan_update_post_lb(struct xe_device *xe);
 #else
 static inline int xe_hwmon_register(struct xe_device *xe) { return 0; };
 static inline void xe_hwmon_suspend(struct xe_device *xe) {}
 static inline void xe_hwmon_resume(struct xe_device *xe) {}
+static inline void xe_hwmon_fan_update_post_lb(struct xe_device *xe) {}
 #endif
 
 #endif /* _XE_HWMON_H_ */
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 768442ca7da6..34295418ef50 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -13,6 +13,7 @@
 #include <drm/drm_print.h>
 
 #include "xe_device.h"
+#include "xe_hwmon.h"
 #include "xe_late_bind_fw.h"
 #include "xe_pcode.h"
 #include "xe_pcode_api.h"
@@ -252,6 +253,8 @@ static void xe_late_bind_work(struct work_struct *work)
 	if (!ret) {
 		drm_dbg(&xe->drm, "Load %s firmware successful\n",
 			fw_id_to_name[lbfw->id]);
+		if (fw_id_to_name[lbfw->id] == XE_LB_FW_FAN_CONTROL)
+			xe_hwmon_fan_update_post_lb(late_bind_to_xe(late_bind));
 		goto out;
 	}
 
-- 
2.25.1

