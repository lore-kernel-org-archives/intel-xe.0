Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFA8606A31E
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 05:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=geFmdQL/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0A910E363;
	Sat, 28 Nov 2026 05:58:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF1810E271
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Nov 2026 05:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795845500; x=1827381500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u33FhM2yLak6wuwkaADI5Rcr81XsFpxDboPufB5sT2Q=;
 b=geFmdQL/Ujx7qyWKrM8YAjdB4wSDa8B1F+4nLB/GVaWQdR35ciocvSyD
 MLqncOGLoehPFSChRQmeUIJtPGfEAhu1UxXMDz4NaJSEXEUz6055PO+wO
 AvCdLfuxKH3SNgV9r8tb9tIGH3Vp8ZQ1FRKozhI9JGmd6/eY3C/Nt5HJY
 fPtfCvjXkJf85qFEAUp7s8yKBV7LWNygavjQSjy/Tp8EeVMJ0bl71bA/K
 Autux/es2UXO/yVJuehGrsZeeGDHIw5nPMvlsEUDKk4fO/QsJlHZ4nZGt
 4hUk3q7ue3Ig9uDlLCGFptJg6Gp3r0RYBTNnS6WqsELtzG8lRAryyYJGR w==;
X-CSE-ConnectionGUID: efNlrSPgTm26yFq3bUEVRA==
X-CSE-MsgGUID: Iv8exdm0QNKeMFPb6GSQ7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4754904"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4754904"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:58:20 -0800
X-CSE-ConnectionGUID: TIeQSgU/Q+6Ja3sY4YollA==
X-CSE-MsgGUID: ZrJc7hPARi+jq+6er0Gisw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; d="scan'208";a="12304331"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:58:17 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 08/10] drm/xe/hwmon: Refresh fan data after late binding
Date: Sat, 28 Nov 2026 11:29:21 +0530
Message-Id: <20261128055923.3316956-9-karthik.poosa@intel.com>
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

Refresh cached stock fan tables and maximum RPM for registered fans after
fan-control firmware loads.

Serialize the refresh with hwmon registration and teardown. Flush
late-bind work before releasing hwmon state, and protect fanN_max reads
against concurrent max_rps updates.

v2:
 - Compare lbfw->id with XE_LB_FW_FAN_CONTROL. (Soham)
 - Use xe already in scope. (Soham)
 - Spell out "late binding" in warnings. (Soham)
 - Return an error from xe_hwmon_get_fan_enable_mask() and keep the
   old mask if the read fails.
 - Start fans enabled after late binding in automatic mode.

v3:
 - Serialize the refresh with hwmon registration and teardown. Flush
   late-bind work before releasing hwmon state, and protect fanN_max reads
   against concurrent max_rps updates.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c        | 71 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_hwmon.h        |  2 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c |  3 ++
 3 files changed, 70 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 3e82a9236b10..92eb0aba6d4a 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -16,6 +16,7 @@
 #include "regs/xe_pcode_regs.h"
 #include "xe_device.h"
 #include "xe_hwmon.h"
+#include "xe_late_bind_fw.h"
 #include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_pcode.h"
@@ -259,6 +260,8 @@ struct xe_hwmon {
 	struct device *hwmon_dev;
 	/** @xe: Xe device */
 	struct xe_device *xe;
+	/** @registration_lock: serialize registration with late-binding updates */
+	struct mutex registration_lock;
 	/** @hwmon_lock: lock for rw attributes*/
 	struct mutex hwmon_lock;
 	/** @scl_shift_power: pkg power unit */
@@ -293,6 +296,13 @@ struct xe_hwmon {
 	const struct attribute_group *groups[3];
 };
 
+static void xe_hwmon_flush_late_bind(void *arg)
+{
+	struct xe_device *xe = arg;
+
+	xe_late_bind_pm_suspend(&xe->late_bind);
+}
+
 static inline int prepare_power_limit_param2(const struct xe_hwmon *hwmon, int channel)
 {
 	if (hwmon->read_power_limit_from_pcode[channel]) {
@@ -1808,7 +1818,6 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
 		if (!IS_FAN_ENABLED(hwmon, fan))
 			continue;
 
-		fi->pwm_enable_mode = XE_FAN_PWM_UNINITIALIZED;
 		fi->fan_table[STOCK_FAN_TABLE].point_count = 0;
 
 		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_MAX_FAN_RPS, fan,
@@ -2480,7 +2489,9 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 	case hwmon_fan_input:
 		return xe_hwmon_fan_input_read(hwmon, channel, val);
 	case hwmon_fan_max:
+		mutex_lock(&hwmon->hwmon_lock);
 		*val = mul_u32_u32(hwmon->fi[channel].max_rps, 60);
+		mutex_unlock(&hwmon->hwmon_lock);
 		return 0;
 	default:
 		return -EOPNOTSUPP;
@@ -2948,9 +2959,21 @@ int xe_hwmon_register(struct xe_device *xe)
 	if (ret)
 		return ret;
 
+	ret = devm_mutex_init(dev, &hwmon->registration_lock);
+	if (ret)
+		return ret;
+
+	/* Flush late-bind work before devm releases the hwmon state it may use. */
+	ret = devm_add_action_or_reset(dev, xe_hwmon_flush_late_bind, xe);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&hwmon->registration_lock);
+
 	/* There's only one instance of hwmon per device */
 	hwmon->xe = xe;
-	xe->hwmon = hwmon;
+	/* Pair with the acquire load in xe_hwmon_fan_update_post_lb(). */
+	smp_store_release(&xe->hwmon, hwmon);
 
 	ret = xe_hwmon_get_preregistration_info(hwmon);
 	if (ret)
@@ -2977,7 +3000,7 @@ int xe_hwmon_register(struct xe_device *xe)
 	return 0;
 
 err_null_hwmon:
-	xe->hwmon = NULL;
+	WRITE_ONCE(xe->hwmon, NULL);
 	return ret;
 }
 
@@ -2990,11 +3013,21 @@ int xe_hwmon_register(struct xe_device *xe)
  */
 void xe_hwmon_unregister(struct xe_device *xe)
 {
-	if (!xe->hwmon)
+	struct xe_hwmon *hwmon;
+
+	/* Stop updates before unregistering hwmon or unplugging the device. */
+	xe_late_bind_pm_suspend(&xe->late_bind);
+
+	hwmon = READ_ONCE(xe->hwmon);
+	if (!hwmon)
 		return;
 
-	hwmon_device_unregister(xe->hwmon->hwmon_dev);
-	xe->hwmon = NULL;
+	mutex_lock(&hwmon->registration_lock);
+	if (READ_ONCE(xe->hwmon) == hwmon) {
+		hwmon_device_unregister(hwmon->hwmon_dev);
+		WRITE_ONCE(xe->hwmon, NULL);
+	}
+	mutex_unlock(&hwmon->registration_lock);
 }
 
 /**
@@ -3103,4 +3136,30 @@ void xe_hwmon_resume(struct xe_device *xe, bool runtime)
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
+	/* Pair with the release store in xe_hwmon_register(). */
+	struct xe_hwmon *hwmon = smp_load_acquire(&xe->hwmon);
+
+	if (!hwmon || !xe->info.has_fan_control)
+		return;
+
+	guard(mutex)(&hwmon->registration_lock);
+	if (READ_ONCE(xe->hwmon) != hwmon)
+		return;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	if (xe_hwmon_read_fan_control_info(hwmon))
+		xe_warn(hwmon->xe, "failed to read stock fan tables after late binding\n");
+
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
index c577e2d51620..6fe154ea01c3 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -14,6 +14,7 @@
 
 #include "xe_configfs.h"
 #include "xe_device.h"
+#include "xe_hwmon.h"
 #include "xe_late_bind_fw.h"
 #include "xe_pcode.h"
 #include "xe_pcode_api.h"
@@ -298,6 +299,8 @@ static void xe_late_bind_work(struct work_struct *work)
 	if (!ret) {
 		drm_dbg(&xe->drm, "Load %s firmware successful\n",
 			fw_id_to_name[lbfw->id]);
+		if (lbfw->id == XE_LB_FW_FAN_CONTROL)
+			xe_hwmon_fan_update_post_lb(xe);
 		goto out;
 	}
 
-- 
2.34.1

