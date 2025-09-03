Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430DFCA1012
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 23:23:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAEC10E217;
	Wed,  3 Sep 2025 23:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWtdmAr4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21B910E220
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 23:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756941793; x=1788477793;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Azp91BcIUV4suYLFb79RjnULrLeRN5vu1sg2sL7ssUM=;
 b=ZWtdmAr4ofUXau9QzajX4bxnE4sCZVqkXLh7uavAcFdxhDPkfmwtAqVa
 yv9fk/MNtI/vJMasdQnZIBqQygruNfX2XMQYjfxfQ+fplwkVd/iZP8Uvc
 H2lQ3ve2+jI0On8Sqy5wdey2qdxlLQX168q9Y+CnyplJobWxMoeE3jr9S
 9OGOlW8oa6lwCNzL5jwPMZbc6PMqTMfo0i726kJsK82cIltQs0RneFff4
 SXlFMfIoaOGgEefRmriTCh3eVDtXBN+i0oljlDTC5f9cOqZLiq4Ej3iJJ
 QyCt5qKBz0ivRA5nI0bFmWqOZ2JVz/JFoJhOSZETxAACz6bZpdpc9Ej3c g==;
X-CSE-ConnectionGUID: yh4bTQUpRuaD+GEPxqmLuQ==
X-CSE-MsgGUID: QVagrzfRRiio5pxdMsJ/oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76874448"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="76874448"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 16:23:12 -0700
X-CSE-ConnectionGUID: WXY0PPjoSOi4Q9NotG7ozw==
X-CSE-MsgGUID: lReXNWgLQ8q7i9XzUA/LCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="172172823"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by fmviesa009.fm.intel.com with ESMTP; 03 Sep 2025 16:23:12 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2] drm/xe/guc: Add SLPC power profile interface
Date: Wed,  3 Sep 2025 16:21:20 -0700
Message-Id: <20250903232120.390190-1-vinay.belgaumkar@intel.com>
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

v2: Address review comments (Rodrigo)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  5 ++
 drivers/gpu/drm/xe/xe_gt_freq.c               | 26 +++++++
 drivers/gpu/drm/xe/xe_guc_pc.c                | 67 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.h                |  2 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h          |  2 +
 5 files changed, 102 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
index b28c8fa061f7..ce5c59517528 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
@@ -210,6 +210,11 @@ struct slpc_shared_data {
 	u8 reserved_mode_definition[4096];
 } __packed;
 
+enum slpc_power_profile {
+	SLPC_POWER_PROFILE_BASE = 0x0,
+	SLPC_POWER_PROFILE_POWER_SAVING = 0x1
+};
+
 /**
  * DOC: SLPC H2G MESSAGE FORMAT
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 60d9354e7dbf..781e4890fb26 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -227,6 +227,31 @@ static ssize_t max_freq_store(struct kobject *kobj,
 }
 static struct kobj_attribute attr_max_freq = __ATTR_RW(max_freq);
 
+static ssize_t power_profile_show(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  char *buff)
+{
+	struct device *dev = kobj_to_dev(kobj);
+
+	xe_guc_pc_get_power_profile(dev_to_pc(dev), buff);
+
+	return strlen(buff);
+}
+
+static ssize_t power_profile_store(struct kobject *kobj,
+				   struct kobj_attribute *attr,
+				   const char *buff, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+	int err;
+
+	err = xe_guc_pc_set_power_profile(pc, buff);
+
+	return err ?: count;
+}
+static struct kobj_attribute attr_power_profile = __ATTR_RW(power_profile);
+
 static const struct attribute *freq_attrs[] = {
 	&attr_act_freq.attr,
 	&attr_cur_freq.attr,
@@ -236,6 +261,7 @@ static const struct attribute *freq_attrs[] = {
 	&attr_rpn_freq.attr,
 	&attr_min_freq.attr,
 	&attr_max_freq.attr,
+	&attr_power_profile.attr,
 	NULL
 };
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 88557e86d637..68a5bf8e3946 100644
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
@@ -1171,6 +1176,61 @@ static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val)
 	return ret;
 }
 
+static const char *power_profile_to_string(struct xe_guc_pc *pc)
+{
+	switch (pc->power_profile) {
+	case SLPC_POWER_PROFILE_BASE:
+		return "base";
+	case SLPC_POWER_PROFILE_POWER_SAVING:
+		return "power_saving";
+	default:
+		return "invalid";
+	}
+}
+
+void xe_guc_pc_get_power_profile(struct xe_guc_pc *pc, char *profile)
+{
+	switch (pc->power_profile) {
+	case SLPC_POWER_PROFILE_BASE:
+		sprintf(profile, "[%s]    %s\n", "base", "power_saving");
+		break;
+	case SLPC_POWER_PROFILE_POWER_SAVING:
+		sprintf(profile, "%s    [%s]\n", "base", "power_saving");
+		break;
+	default:
+		sprintf(profile, "invalid");
+	}
+}
+
+int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char *buf)
+{
+	int ret = 0;
+	u32 val;
+
+	if (strncmp("base", buf, strlen("base")) == 0)
+		val = SLPC_POWER_PROFILE_BASE;
+	else if (strncmp("power_saving", buf, strlen("power_saving")) == 0)
+		val = SLPC_POWER_PROFILE_POWER_SAVING;
+	else
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
@@ -1249,6 +1309,11 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	/* Enable SLPC Optimized Strategy for compute */
 	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
 
+	/* Set cached value of power_profile */
+	ret = xe_guc_pc_set_power_profile(pc, power_profile_to_string(pc));
+	if (unlikely(ret))
+		xe_gt_err(gt, "Failed to set SLPC power profile: %pe\n", ERR_PTR(ret));
+
 out:
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return ret;
@@ -1327,6 +1392,8 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	pc->bo = bo;
 
+	pc->power_profile = SLPC_POWER_PROFILE_BASE;
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini_hw, pc);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 52ecdd5ddbff..0e31396f103c 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -31,6 +31,8 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq);
 int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq);
 int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq);
 int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq);
+int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char *buf);
+void xe_guc_pc_get_power_profile(struct xe_guc_pc *pc, char *profile);
 
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

