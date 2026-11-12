Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F86606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 22:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C+uXCzYg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A47610E4E4;
	Thu, 12 Nov 2026 22:22:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C10C10E4E4
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 22:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794522126; x=1826058126;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YBYphsgXnSE6pw1tWSGDySZ5l3LpP+3jiu3yFSYdpVE=;
 b=C+uXCzYgcMOXdqaL7F9JRoET9AXvJFFba7lA/gTHqpxOeYUyvxREck79
 HmhOE61ZusXyADB/V/6lAzEgYndvCk79R+ONcl7DmtMJLxWCCBPvRuACk
 jqbMvNMbKGzt7HZ+8iyAfizjpTDv0WiDXOh3rcp8tlctX8VLKfENhfx6f
 eHHS6QUMtuuCneNdbTcg4Y6F/s5SwStFlLwS/atMdLcmZS+t+kCszL7kS
 vthydZrz0NJUzLlXomAyCIJ3LUIsbEG0If35S/vOLYg5nddXsSat1zlVZ
 dRYA1u79RZC9OT+Wxfdr7g1LPZgA4L8+YmZg3Jnrdrig4S6KEA2d4LOWB w==;
X-CSE-ConnectionGUID: ORLj5mZvTD2XpB/zik2YwQ==
X-CSE-MsgGUID: zUN+3CQvT3u3aLTigXqcsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3216967"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3216967"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 14:22:05 -0800
X-CSE-ConnectionGUID: 12Qyl+lOQrOKEELcg/qS3A==
X-CSE-MsgGUID: vZrlqxYETAWedvfGCjZJ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8702502"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by fmviesa004.fm.intel.com with ESMTP; 12 Nov 2026 14:22:03 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2] drm/xe: Add sysfs to disable RPe
Date: Thu, 12 Nov 2026 14:22:00 -0800
Message-ID: <20261112222159.3862116-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.53.0
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

When SLPC is initialized, GuC sets the GT min freq to RPe(efficient) by
default. This frequency is desgined for optimal perf/power ratio. However,
certain use cases may want to run at lower frequencies. This sysfs allows
user to disable use of default RPe behavior.

Efficient frequency will now be controlled by this interface alone. Setting
min_freq < efficient will not affect the flag. Disabling use_rpe will cause
GuC to bring back min_freq to whatever level it was set before and enabling
it will bring up the min_freq to RPe.

$ cat /sys/class/drm/card0/device/tile0/gt1/freq0/use_rpe
1

v2: Address Sashiko comments.

Cc: Sk Anirban <sk.anirban@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_freq.c      | 35 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c       | 63 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 +
 4 files changed, 94 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index a40dd074106f..38c4f17ba99c 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -242,6 +242,40 @@ static ssize_t power_profile_store(struct kobject *kobj,
 }
 static struct kobj_attribute attr_power_profile = __ATTR_RW(power_profile);
 
+static ssize_t use_rpe_show(struct kobject *kobj,
+			    struct kobj_attribute *attr,
+			    char *buff)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+
+	return sysfs_emit(buff, "%u\n", pc->use_rpe);
+}
+
+static ssize_t use_rpe_store(struct kobject *kobj,
+			     struct kobj_attribute *attr,
+			     const char *buff, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+	int err;
+	u32 val;
+
+	err = kstrtou32(buff, 0, &val);
+	if (err)
+		return err;
+
+	if (val > 1)
+		return -EINVAL;
+
+	guard(xe_pm_runtime)(dev_to_xe(dev));
+	err = xe_guc_pc_set_use_rpe(pc, val);
+
+	return err ?: count;
+}
+
+static struct kobj_attribute attr_use_rpe = __ATTR_RW(use_rpe);
+
 static const struct attribute *freq_attrs[] = {
 	&attr_act_freq.attr,
 	&attr_cur_freq.attr,
@@ -252,6 +286,7 @@ static const struct attribute *freq_attrs[] = {
 	&attr_min_freq.attr,
 	&attr_max_freq.attr,
 	&attr_power_profile.attr,
+	&attr_use_rpe.attr,
 	NULL
 };
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 9558d7196a51..1404df21c00a 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -344,6 +344,21 @@ static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
 	pc_set_manual_rp_ctrl(pc, false);
 }
 
+static int pc_set_ignore_eff_freq(struct xe_guc_pc *pc, u32 val)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	int ret;
+
+	xe_device_assert_mem_access(pc_to_xe(pc));
+
+	ret = pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY, val);
+	if (ret)
+		xe_gt_err_once(gt, "Failed to set ignore_eff_freq to %u, %pe\n",
+			       val, ERR_PTR(ret));
+
+	return ret;
+}
+
 static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
 {
 	/*
@@ -353,13 +368,6 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
 	if (freq < pc->rpn_freq || freq > pc->rp0_freq)
 		return -EINVAL;
 
-	/*
-	 * GuC policy is to elevate minimum frequency to the efficient levels
-	 * Our goal is to have the admin choices respected.
-	 */
-	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
-			    freq < xe_guc_pc_get_rpe_freq(pc));
-
 	return pc_action_set_param(pc,
 				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
 				   freq);
@@ -1072,6 +1080,7 @@ void xe_guc_pc_remove_flush_freq_limit(struct xe_guc_pc *pc)
 static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
 {
 	int ret;
+	u32 mert_freq_cap;
 
 	if (!XE_GT_WA(pc_to_gt(pc), 22019338487))
 		return 0;
@@ -1090,6 +1099,14 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
 	/*
 	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
 	 */
+	mert_freq_cap = min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc));
+	if (mert_freq_cap < xe_guc_pc_get_rpe_freq(pc) && pc->use_rpe) {
+		/* Temporarily let GuC drop min below RPe so the cap can be applied. */
+		ret = pc_set_ignore_eff_freq(pc, 1);
+		if (ret)
+			return ret;
+	}
+
 	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
 	if (!ret)
 		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
@@ -1113,6 +1130,11 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
 
 	mutex_lock(&pc->freq_lock);
 	ret = pc_set_max_freq(pc, pc->stashed_max_freq);
+
+	/* Undo any temporary ignore_eff_freq override from pc_set_mert_freq_cap(). */
+	if (!ret)
+		ret = pc_set_ignore_eff_freq(pc, !pc->use_rpe);
+
 	if (!ret)
 		ret = pc_set_min_freq(pc, pc->stashed_min_freq);
 	mutex_unlock(&pc->freq_lock);
@@ -1166,6 +1188,28 @@ static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val)
 	return ret;
 }
 
+int xe_guc_pc_set_use_rpe(struct xe_guc_pc *pc, u32 val)
+{
+	int ret;
+
+	guard(mutex)(&pc->freq_lock);
+
+	/* Might be in the middle of a gt reset */
+	if (!pc->freq_ready)
+		return -EAGAIN;
+
+	/**
+	 * If use_rpe == 1, ignore_eff_freq = false. GuC elevates min_freq to
+	 * RPe when enabled, and resets it back to the previously set min
+	 * when disabled, so no explicit set_min_freq request is needed here.
+	 */
+	ret = pc_set_ignore_eff_freq(pc, !val);
+	if (!ret)
+		pc->use_rpe = val;
+
+	return ret;
+}
+
 static const char *power_profile_to_string(struct xe_guc_pc *pc)
 {
 	switch (pc->power_profile) {
@@ -1314,6 +1358,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	if (ret)
 		return ret;
 
+	ret = pc_set_ignore_eff_freq(pc, !pc->use_rpe);
+	if (unlikely(ret))
+		return ret;
+
 	ret = pc_init_freqs(pc);
 	if (ret)
 		return ret;
@@ -1400,6 +1448,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	pc->bo = bo;
 
 	pc->power_profile = SLPC_POWER_PROFILE_BASE;
+	pc->use_rpe = true;
 
 	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini_hw, pc);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 1025a2b15f5f..dc52f349a6a2 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -31,6 +31,7 @@ int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq);
 int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq);
 int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char *buf);
 void xe_guc_pc_get_power_profile(struct xe_guc_pc *pc, char *profile);
+int xe_guc_pc_set_use_rpe(struct xe_guc_pc *pc, u32 val);
 
 enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
 u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
index 711bbcdcb0d3..61654ee7d8d6 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
@@ -35,6 +35,8 @@ struct xe_guc_pc {
 	bool freq_ready;
 	/** @power_profile: Base or power_saving profile */
 	u32 power_profile;
+	/** @use_rpe: Toggle use of efficient frequency */
+	u32 use_rpe;
 };
 
 #endif	/* _XE_GUC_PC_TYPES_H_ */
-- 
2.53.0

