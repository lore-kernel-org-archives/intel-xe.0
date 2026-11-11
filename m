Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF80F606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 21:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j6DxtKoE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C5910E458;
	Wed, 11 Nov 2026 21:22:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D5610E458
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 21:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794432134; x=1825968134;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ViaFEieqvF1POYgBe0CVzOW1f6cZ3kh+4NIiBlvduN8=;
 b=j6DxtKoEFlUBNvPvKHcsq3evZlK9JFZohWm0+BySSxnDIKPoGBJnfByX
 APnMlJZiM9zwPmOnROeHDS669IPHVv/fGpWHZfOQrgfIQwSp3s+OZoSqd
 jvb9yI+ohvaiTAfF5kxFOEGk+iUA0+KLUFayFpIEW7ktKQhlE3YlieRNX
 HRo1wLk8WfATsGidawJzJskIbPOw3Z9jf0/JnYLlGmXNN3inlXSlml/jV
 Nz1jrn/F9gI8GCObU3U2GuTTA8P/bUmYxSg+lc67RDNL25m9cDjOEwlrt
 HIFqfXgMpYzrpM/nmCWYJTTXfEX0R9/zRb7/TrKHwl4gFb1RbNUuJ625O A==;
X-CSE-ConnectionGUID: eHY9sxJZQ1G/dvDDZisTEw==
X-CSE-MsgGUID: WOjGseBxTZ+gkznq5NbXbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3206969"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3206969"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 13:22:14 -0800
X-CSE-ConnectionGUID: xK86dHZeQAmJ8xh5ZkCt+A==
X-CSE-MsgGUID: Zl3PSl5HT/OxPmGTtWfQ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8939503"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by fmviesa007.fm.intel.com with ESMTP; 11 Nov 2026 13:22:14 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] drm/xe: Add sysfs to disable RPe
Date: Wed, 11 Nov 2026 13:21:51 -0800
Message-ID: <20261111212150.3738637-2-vinay.belgaumkar@intel.com>
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
it will bring up the min_Freq to rpe_freq.

$ cat /sys/class/drm/card0/device/tile0/gt1/freq0/use_rpe
1

Cc: Sk Anirban <sk.anirban@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_freq.c      | 34 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c       | 47 +++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 ++
 4 files changed, 77 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index a40dd074106f..f9542848c1d2 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -242,6 +242,39 @@ static ssize_t power_profile_store(struct kobject *kobj,
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
+static struct kobj_attribute attr_use_rpe = __ATTR_RW(use_rpe);
+
 static const struct attribute *freq_attrs[] = {
 	&attr_act_freq.attr,
 	&attr_cur_freq.attr,
@@ -252,6 +285,7 @@ static const struct attribute *freq_attrs[] = {
 	&attr_min_freq.attr,
 	&attr_max_freq.attr,
 	&attr_power_profile.attr,
+	&attr_use_rpe.attr,
 	NULL
 };
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 9558d7196a51..8f7044b49e13 100644
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
@@ -1166,6 +1174,26 @@ static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val)
 	return ret;
 }
 
+int xe_guc_pc_set_use_rpe(struct xe_guc_pc *pc, u32 val)
+{
+	int ret;
+
+	guard(mutex)(&pc->freq_lock);
+
+	/* If use_rpe == 1, ignore_eff_freq = false */
+	ret = pc_set_ignore_eff_freq(pc, !val);
+	if (ret) {
+		xe_gt_err_once(pc_to_gt(pc),
+			       "Failed to set use_rpe to %d: %pe\n",
+			       !val, ERR_PTR(ret));
+		return ret;
+	}
+
+	pc->use_rpe = val;
+
+	return ret;
+}
+
 static const char *power_profile_to_string(struct xe_guc_pc *pc)
 {
 	switch (pc->power_profile) {
@@ -1314,6 +1342,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	if (ret)
 		return ret;
 
+	ret = pc_set_ignore_eff_freq(pc, !pc->use_rpe);
+	if (unlikely(ret))
+		return ret;
+
 	ret = pc_init_freqs(pc);
 	if (ret)
 		return ret;
@@ -1400,6 +1432,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
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

