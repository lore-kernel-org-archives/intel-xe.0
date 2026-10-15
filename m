Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66D6CC6B38
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 19:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E3A112469;
	Thu, 15 Oct 2026 19:09:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3106112459
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 19:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792091346; x=1823627346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IlQiF4cfW6h3feM19oeHn6j25Re2f1ErG6GihzzfmHs=;
 b=fR6LDMIIpWLlSURlXOH377Jg0o3IH5i/bbuVcbpALYtvTytOv9QWeytf
 cwLuazBuopvvmXpyF91of/ml9eRXUXuyPpDdfbEu0RO7MODAFW/PlddKm
 NYwL0wzEW97Pxmddk7jhsfxI7r95e7mX9PuIHIGaxDIEVZnbzLApZghIn
 gE1rZkE1wTj94MyhiNnDWWu1I9yn4JOsq5axqSDmS9UDLLrkYgpp4VILL
 3pHemQz7lpGJ2umb/dAEkRicojNcFtrLKx/eSyWluaqGwgWFMnTDN70rC
 0qyUd3Bb1otxnTrlXovR4vXPWvL4eniJTIr1e++hZeDQ7HxQUw1SWGxiM g==;
X-CSE-ConnectionGUID: NHtzc9HvQXWEESSN0aEEBw==
X-CSE-MsgGUID: zTidW20XTm6a0paYRUEFyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="770395"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="770395"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:09:06 -0700
X-CSE-ConnectionGUID: qsQvVvWYRTOY91LbciKbCA==
X-CSE-MsgGUID: 4zJbS5SORUOvDm0k+iT9qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1835280"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:09:04 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 9/9] drm/xe/hwmon: Update fan info after late binding
Date: Fri, 16 Oct 2026 00:37:51 +0530
Message-Id: <20261015190751.1268916-10-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261015190751.1268916-1-karthik.poosa@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
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
Assisted-by: LLM
---
 drivers/gpu/drm/xe/xe_hwmon.c        | 41 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_hwmon.h        |  2 ++
 drivers/gpu/drm/xe/xe_late_bind_fw.c |  3 ++
 3 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index d9f6cc9c81f6..e91bcacdfe93 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -2068,7 +2068,7 @@ static const struct attribute_group hwmon_curve_attrgroup = {
 	.is_visible = xe_hwmon_curve_attributes_visible,
 };
 
-static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
+static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon, bool is_init)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
 	int point;
@@ -2129,8 +2129,13 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
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
@@ -3070,7 +3075,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 				xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
 
 		/* Fan control tables initialization */
-		if (xe_hwmon_read_fan_control_info(hwmon))
+		if (xe_hwmon_read_fan_control_info(hwmon, true))
 			xe_warn(hwmon->xe, "Fan control tables are not available\n");
 	}
 	return xe_hwmon_init_temp_info(hwmon);
@@ -3258,4 +3263,32 @@ void xe_hwmon_resume(struct xe_device *xe)
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
+
+	if (!hwmon || !xe->info.has_fan_control)
+		return;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	if (xe_hwmon_get_fan_enable_mask(hwmon)) {
+		xe_warn(hwmon->xe, "Failed to read fan enable mask after LB\n");
+		goto unlock;
+	}
+
+	/* Read stock tables. */
+	if (xe_hwmon_read_fan_control_info(hwmon, false))
+		xe_warn(hwmon->xe, "Failed to read stock fan tables after LB\n");
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

