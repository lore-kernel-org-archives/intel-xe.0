Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB30CA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 16:47:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F0910E1A6;
	Fri, 29 Aug 2025 16:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MeE2zMYq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F2210E1A6
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 16:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756486034; x=1788022034;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=auiZS0H9ZgMK7wsvm56V402NgcqCubnpUWZzf8qQPc8=;
 b=MeE2zMYqabAgJ/V4PwsQB1Cs4qKUy+h+wOhCymm8Lc4edWMDK/lnwSKX
 Skh3SO5dm0F9H07R6vPxra49E30I+qQuyf0q2BzVt/9R2uA47rkWIsIP1
 Mco4KbkImTdtRWtgoOseFrbdMx4IAV8GM10GZqmVWdyfTfQ5p6ZWnoVsJ
 H6zgUxhbCE4Px07lzbZ7UrtVe6kT1DTEJFIE4JERlE8vNw/HbzF+e1WDC
 +89BfyaUYD6zP6Ucyyb/dpyacsY3ByNk0ofpkTTKUMIU+EOd4QNrjj+ls
 UMO4XIBuPjJ248QDK8MLkusx/FiOHfWM66GtTrCF6mEa7bXVp2O5IUv/w Q==;
X-CSE-ConnectionGUID: 4B4m4bsZSdywknh/g8Sasw==
X-CSE-MsgGUID: vBWfqKbGSMKPcRU2ptCIqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81368394"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="81368394"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 09:47:13 -0700
X-CSE-ConnectionGUID: x8lHBVq7ST6Oal+J/82QVw==
X-CSE-MsgGUID: L54fKzjVRcS5a5twE/Rb0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170809213"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa009.fm.intel.com with ESMTP; 29 Aug 2025 09:47:12 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/guc: Add SLPC power profile interface
Date: Fri, 29 Aug 2025 09:43:08 -0700
Message-Id: <20250829164308.1346909-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

GuC has an interface to set a power profile for the SLPC algorithm.
Base mode is default and ensures a balanced performance, power_saving
mode has conservative up/down thresholds and is suitable for use with
apps that typically need to be power efficient. This will result in
lower GT frequencies, thus consuming lower power.

Selected power profile will be displayed in this format:

$ cat power_profile

  [base]    power_saving

$ echo power_saving > power_profile
$ cat power_profile

  base    [power_saving]

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  5 +++
 drivers/gpu/drm/xe/xe_gt_freq.c               | 42 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c                | 37 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.h                |  1 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h          |  2 +
 5 files changed, 87 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
index b28c8fa061f7..c1d16acbb732 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
@@ -210,6 +210,11 @@ struct slpc_shared_data {
 	u8 reserved_mode_definition[4096];
 } __packed;
 
+enum slpc_power_profiles {
+	SLPC_POWER_PROFILES_BASE = 0x0,
+	SLPC_POWER_PROFILES_POWER_SAVING = 0x1
+};
+
 /**
  * DOC: SLPC H2G MESSAGE FORMAT
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 60d9354e7dbf..cf26004b1efb 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -11,6 +11,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
+#include "abi/guc_actions_slpc_abi.h"
 #include "xe_gt_sysfs.h"
 #include "xe_gt_throttle.h"
 #include "xe_gt_types.h"
@@ -227,6 +228,46 @@ static ssize_t max_freq_store(struct kobject *kobj,
 }
 static struct kobj_attribute attr_max_freq = __ATTR_RW(max_freq);
 
+static ssize_t power_profile_show(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  char *buff)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+
+	switch (pc->power_profile) {
+	case SLPC_POWER_PROFILES_BASE:
+		return sysfs_emit(buff, "[%s]    %s\n", "base", "power_saving");
+	case SLPC_POWER_PROFILES_POWER_SAVING:
+		return sysfs_emit(buff, "%s    [%s]\n", "base", "power_saving");
+	}
+
+	return sysfs_emit(buff, "%u\n", pc->power_profile);
+}
+
+static ssize_t power_profile_store(struct kobject *kobj,
+				   struct kobj_attribute *attr,
+				   const char *buff, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+	char power_saving[] = "power_saving";
+	char base[] = "base";
+	int err;
+	u32 val;
+
+	if (!strncmp(buff, power_saving, sizeof(power_saving) - 1))
+		val = SLPC_POWER_PROFILES_POWER_SAVING;
+	else if (!strncmp(buff, base, sizeof(base) - 1))
+		val = SLPC_POWER_PROFILES_BASE;
+	else
+		return -EINVAL;
+
+	err = xe_guc_pc_set_power_profile(pc, val);
+	return err ?: count;
+}
+static struct kobj_attribute attr_power_profile = __ATTR_RW(power_profile);
+
 static const struct attribute *freq_attrs[] = {
 	&attr_act_freq.attr,
 	&attr_cur_freq.attr,
@@ -236,6 +277,7 @@ static const struct attribute *freq_attrs[] = {
 	&attr_rpn_freq.attr,
 	&attr_min_freq.attr,
 	&attr_max_freq.attr,
+	&attr_power_profile.attr,
 	NULL
 };
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 88557e86d637..c71d95959dd2 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -79,6 +79,11 @@
  * Xe driver enables SLPC with all of its defaults features and frequency
  * selection, which varies per platform.
  *
+ * Power profiles add another level of control to SLPC. When power saving
+ * profile is chosen, SLPC will use conservative thresholds to ramp frequency,
+ * thus saving power. Base profile is default and ensures balanced performance
+ * for any workload.
+ *
  * Render-C States:
  * ================
  *
@@ -1171,6 +1176,31 @@ static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val)
 	return ret;
 }
 
+int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, u32 val)
+{
+
+	int ret = 0;
+
+	if (val > SLPC_POWER_PROFILES_POWER_SAVING)
+		return -EINVAL;
+
+	guard(mutex)(&pc->freq_lock);
+	xe_pm_runtime_get(pc_to_xe(pc));
+
+	ret = pc_action_set_param(pc,
+				  SLPC_PARAM_POWER_PROFILE,
+				  val);
+	if (ret)
+		xe_gt_err_once(pc_to_gt(pc), "Failed to set power profile to %d: %pe\n",
+			       val, ERR_PTR(ret));
+	else
+		pc->power_profile = val;
+
+	xe_pm_runtime_put(pc_to_xe(pc));
+
+	return ret;
+}
+
 /**
  * xe_guc_pc_start - Start GuC's Power Conservation component
  * @pc: Xe_GuC_PC instance
@@ -1249,6 +1279,11 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	/* Enable SLPC Optimized Strategy for compute */
 	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
 
+	/* Set cached value of power_profile */
+	ret = xe_guc_pc_set_power_profile(pc, pc->power_profile);
+	if (unlikely(ret))
+		xe_gt_err(gt, "Failed to set SLPC power profile: %pe\n", ERR_PTR(ret));
+
 out:
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return ret;
@@ -1327,6 +1362,8 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	pc->bo = bo;
 
+	pc->power_profile = SLPC_POWER_PROFILES_BASE;
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini_hw, pc);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 52ecdd5ddbff..5242bfa8aaa3 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -31,6 +31,7 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq);
 int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq);
 int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq);
 int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq);
+int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, u32 val);
 
 enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
 u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
index c02053948a57..5e4ea53fbee6 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
@@ -37,6 +37,8 @@ struct xe_guc_pc {
 	struct mutex freq_lock;
 	/** @freq_ready: Only handle freq changes, if they are really ready */
 	bool freq_ready;
+	/** @power_profile: Base or power_saving profile */
+	u32 power_profile;
 };
 
 #endif	/* _XE_GUC_PC_TYPES_H_ */
-- 
2.38.1

