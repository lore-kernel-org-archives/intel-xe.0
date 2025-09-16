Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AA8CAC598
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 14:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BC110E377;
	Tue, 16 Sep 2025 14:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dzPD0iqR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5559A10E377
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 14:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758031625; x=1789567625;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m0HHwEGFjSf3EsYARQEiHjWg6Wte60e47tcKKfv/Fkk=;
 b=dzPD0iqRr1S/HczrD2KmizW+/eUmN3OQiXxRY+oqlKFlmXdXuXGWrdFd
 jlB4VzKwXQfPQH7W0CNWqKMrLngbKO7HU1AeniWLCwb3yTamrNy3v43CN
 36JYnnUYx0XAboGf7vzRXBBXP9RfGJMm9DCmpwQahmogp5Hj3KdbPkCbJ
 KyfPCSrOePKHxZNEh9m50mEXGMa10zVUD3mGmIszb1eppuH8Z89BbK9Td
 IqHxDhu8TW9pILmXRyoYNp2yNWta0VY9dafPXca8slgoYOY9+gtT57YIY
 V2Wh87+IVT20g9aaq/BC+efx2iwAfM+TB6UWGIy2cTjjJ9i68WfUw420G Q==;
X-CSE-ConnectionGUID: pPkqjJ87QnW3LVmtIsOZ+g==
X-CSE-MsgGUID: im6OwtD5TzCssL9UfwTEgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="63944739"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="63944739"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 07:07:04 -0700
X-CSE-ConnectionGUID: pFRgy5P1QGiBQg/PQRNFrQ==
X-CSE-MsgGUID: 6DtgZf7LT+CDa1XSKNzz8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="174884359"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 07:07:00 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] drm/xe/guc_pc: Add ignore efficient frequency support
Date: Tue, 16 Sep 2025 19:35:44 +0530
Message-ID: <20250916140543.3055778-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
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

When setting the minimum frequency, GuC automatically adjusts it to
efficient levels, potentially overriding user requests.
This patch adds the slpc_ignore_eff_freq sysfs interface to disable
this behavior, allowing users to enforce their exact minimum frequency
settings.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_freq.c      | 36 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c       | 49 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 ++
 4 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 4ff1b6b58d6b..fb16fa5c6a0f 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -227,6 +227,41 @@ static ssize_t max_freq_store(struct kobject *kobj,
 }
 static struct kobj_attribute attr_max_freq = __ATTR_RW(max_freq);
 
+static ssize_t slpc_ignore_eff_freq_show(struct kobject *kobj,
+					 struct kobj_attribute *attr, char *buf)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+
+	return sysfs_emit(buf, "%u\n", pc->ignore_eff_freq);
+}
+
+static ssize_t slpc_ignore_eff_freq_store(struct kobject *kobj,
+					  struct kobj_attribute *attr,
+					  const char *buff, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+	u32 val;
+	ssize_t ret;
+
+	ret = kstrtou32(buff, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val > 1)
+		return -EINVAL;
+
+	xe_pm_runtime_get(dev_to_xe(dev));
+	ret = xe_guc_pc_set_ignore_eff_freq(pc, val);
+	xe_pm_runtime_put(dev_to_xe(dev));
+	if (ret)
+		return ret;
+
+	return count;
+}
+static struct kobj_attribute attr_slpc_ignore_eff_freq = __ATTR_RW(slpc_ignore_eff_freq);
+
 static ssize_t power_profile_show(struct kobject *kobj,
 				  struct kobj_attribute *attr,
 				  char *buff)
@@ -263,6 +298,7 @@ static const struct attribute *freq_attrs[] = {
 	&attr_rpn_freq.attr,
 	&attr_min_freq.attr,
 	&attr_max_freq.attr,
+	&attr_slpc_ignore_eff_freq.attr,
 	&attr_power_profile.attr,
 	NULL
 };
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 53fdf59524c4..0229a89e3ff8 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -336,6 +336,8 @@ static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
 
 static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
 {
+	int ret;
+
 	/*
 	 * Let's only check for the rpn-rp0 range. If max < min,
 	 * min becomes a fixed request.
@@ -347,8 +349,10 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
 	 * GuC policy is to elevate minimum frequency to the efficient levels
 	 * Our goal is to have the admin choices respected.
 	 */
-	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
-			    freq < pc->rpe_freq);
+	ret = pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
+				  freq < pc->rpe_freq || pc->ignore_eff_freq);
+	if (ret)
+		xe_gt_err(pc_to_gt(pc), "Failed to set efficient freq\n");
 
 	return pc_action_set_param(pc,
 				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
@@ -737,6 +741,45 @@ int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
 	return xe_guc_pc_set_max_freq_locked(pc, freq);
 }
 
+int xe_guc_pc_set_ignore_eff_freq(struct xe_guc_pc *pc, bool val)
+{
+	int ret;
+	u32 min_freq;
+
+	guard(mutex)(&pc->freq_lock);
+
+	if (!pc->freq_ready)
+		return -EAGAIN;
+
+	if (val) {
+		ret = xe_guc_pc_get_min_freq_locked(pc, &min_freq);
+		if (ret)
+			return ret;
+	}
+
+	ret = pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY, val);
+	if (ret) {
+		xe_gt_err(pc_to_gt(pc), "Failed to set ignore efficient freq(%d): %pe\n",
+			  val, ERR_PTR(ret));
+		return ret;
+	}
+
+	pc->ignore_eff_freq = val;
+
+	if (val) {
+		ret = pc_action_set_param(pc,
+					  SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
+					  min_freq);
+		if (ret) {
+			xe_gt_err(pc_to_gt(pc), "Failed to set min freq to %u: %pe\n",
+				  min_freq, ERR_PTR(ret));
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * xe_guc_pc_c_status - get the current GT C state
  * @pc: XE_GuC_PC instance
@@ -1382,6 +1425,8 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	if (err)
 		return err;
 
+	pc->ignore_eff_freq = false;
+
 	bo = xe_managed_bo_create_pin_map(xe, tile, size,
 					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 					  XE_BO_FLAG_GGTT |
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 0e31396f103c..3a87d0da609d 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -31,6 +31,7 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq);
 int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq);
 int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq);
 int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq);
+int xe_guc_pc_set_ignore_eff_freq(struct xe_guc_pc *pc, bool val);
 int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char *buf);
 void xe_guc_pc_get_power_profile(struct xe_guc_pc *pc, char *profile);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
index 5e4ea53fbee6..c3b44598507b 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
@@ -37,6 +37,8 @@ struct xe_guc_pc {
 	struct mutex freq_lock;
 	/** @freq_ready: Only handle freq changes, if they are really ready */
 	bool freq_ready;
+	/** @ignore_eff_freq: Ignore efficient frequency */
+	bool ignore_eff_freq;
 	/** @power_profile: Base or power_saving profile */
 	u32 power_profile;
 };
-- 
2.43.0

