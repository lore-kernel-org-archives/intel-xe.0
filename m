Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30EE606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 01:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PQ28/b1P
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0D510E6E7;
	Wed, 18 Nov 2026 01:25:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D070E10E6E7
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 01:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794965105; x=1826501105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sZtSO2gwc2SbIM6OrtDc0t5uVewvGMA5MXsrOVOESGw=;
 b=PQ28/b1PSRfBxfD8PsmrjRlhvNMN/gCtvv8axZM0gCGdB9CHxrUgMHwL
 LZ08aL+bw6e9493a+xGfALC4czAjqIszZOZNJ0wTzCgP8soVucz26Ds1i
 GoRvmXO3RMUoFwktCIqxyMKBELIPV3yuluSFifsMQ+uXucU80vIkCo0k/
 UHIvhiE8c7lKj8JubT2o5Y96rG96y4nTs5U+61Y6rFJFDXFX4UbEU6nNj
 XSYLXAHgJEacAlDcgtu6ZPepeuLPr7qF8HKmAZkrB9AV82hsvNLprzoai
 yFhYXszj6gcYBpRs+e/Jf9zKI3+EsDynJhq99e8tbRlE1Jrc681KafSvo g==;
X-CSE-ConnectionGUID: dQiNSF/GQ8O2YinxPAa+LA==
X-CSE-MsgGUID: wHd7K9ZLS1yhmB6X+T8Neg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3775354"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3775354"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 17:25:04 -0800
X-CSE-ConnectionGUID: IvXs1IOgRQ2WWRKZgAR6dw==
X-CSE-MsgGUID: lIG28ArmT1SFY/D1JbPYCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9875530"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by orviesa004.jf.intel.com with ESMTP; 17 Nov 2026 17:25:05 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v3 2/2] drm/xe: Add sysfs to disable RPe
Date: Tue, 17 Nov 2026 17:24:55 -0800
Message-ID: <20261118012453.626087-4-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118012453.626087-3-vinay.belgaumkar@intel.com>
References: <20261118012453.626087-3-vinay.belgaumkar@intel.com>
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
min_freq < efficient will not disable RPe. When RPe is enabled, GuC raises
min to RPe and lowers it back when disabled.

Update pc_set_mert_freq_cap() to now disable RPe before stashing min freq.
This ensures we are saving the real min freq instead of the elevated one.

$ cat /sys/class/drm/card0/device/tile0/gt1/freq0/use_rpe
1

v2: Address Sashiko comments.
v3: Disable RPe before stashing freq before mert cap (Sashiko)

Cc: Sk Anirban <sk.anirban@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_freq.c      | 35 +++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c       | 76 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 +
 4 files changed, 105 insertions(+), 9 deletions(-)

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
index ea47b0ded83a..5ff3df99464b 100644
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
 static bool pc_freq_in_range(struct xe_guc_pc *pc, u32 freq)
 {
 	/*
@@ -358,13 +373,6 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
 	if (!pc_freq_in_range(pc, freq))
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
@@ -1091,12 +1099,23 @@ void xe_guc_pc_remove_flush_freq_limit(struct xe_guc_pc *pc)
 static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
 {
 	int ret;
+	u32 mert_freq_cap;
 
 	if (!XE_GT_WA(pc_to_gt(pc), 22019338487))
 		return 0;
 
 	guard(mutex)(&pc->freq_lock);
 
+	/*
+	 * Disable the RPe floor so the min queried below reflects the real
+	 * underlying minimum (RPn or user_requested_min) instead of a value
+	 * GuC may have elevated to RPe. This stays disabled until
+	 * xe_guc_pc_restore_stashed_freq() reinstates it.
+	 */
+	ret = pc_set_ignore_eff_freq(pc, 1);
+	if (ret)
+		return ret;
+
 	/*
 	 * Get updated min/max and stash them.
 	 */
@@ -1109,7 +1128,9 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
 	/*
 	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
 	 */
-	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
+	mert_freq_cap = min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc));
+
+	ret = pc_set_min_freq(pc, mert_freq_cap);
 	if (!ret)
 		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
 
@@ -1136,9 +1157,11 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
 	mutex_lock(&pc->freq_lock);
 	/* Apply any user min/max request made while the cap was active, else the stash. */
 	ret = pc_set_max_freq(pc, pc->user_requested_max ?: pc->stashed_max_freq);
-
 	if (!ret)
 		ret = pc_set_min_freq(pc, pc->user_requested_min ?: pc->stashed_min_freq);
+	/* Restore ignore_eff_freq override from pc_set_mert_freq_cap(). */
+	if (!ret)
+		ret = pc_set_ignore_eff_freq(pc, !pc->use_rpe);
 	if (!ret)
 		pc->mert_freq_cap_active = false;
 	mutex_unlock(&pc->freq_lock);
@@ -1192,6 +1215,36 @@ static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val)
 	return ret;
 }
 
+int xe_guc_pc_set_use_rpe(struct xe_guc_pc *pc, u32 val)
+{
+	int ret = 0;
+
+	guard(mutex)(&pc->freq_lock);
+
+	/* Might be in the middle of a gt reset */
+	if (!pc->freq_ready)
+		return -EAGAIN;
+
+	/*
+	 * While the Wa_22019338487 cap is active, ignore_eff_freq must stay
+	 * forced off. xe_guc_pc_restore_stashed_freq() will apply this value
+	 * once the cap is lifted.
+	 */
+	if (!pc->mert_freq_cap_active) {
+		/**
+		 * If use_rpe == 1, ignore_eff_freq = false. GuC elevates min_freq to
+		 * RPe when enabled, and resets it back to the previously set min
+		 * when disabled, so no explicit set_min_freq request is needed here.
+		 */
+		ret = pc_set_ignore_eff_freq(pc, !val);
+	}
+
+	if (!ret)
+		pc->use_rpe = val;
+
+	return ret;
+}
+
 static const char *power_profile_to_string(struct xe_guc_pc *pc)
 {
 	switch (pc->power_profile) {
@@ -1340,6 +1393,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	if (ret)
 		return ret;
 
+	ret = pc_set_ignore_eff_freq(pc, !pc->use_rpe);
+	if (unlikely(ret))
+		return ret;
+
 	ret = pc_init_freqs(pc);
 	if (ret)
 		return ret;
@@ -1426,6 +1483,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
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
index 9a6ea2904e33..36bc25fc6753 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
@@ -37,6 +37,8 @@ struct xe_guc_pc {
 	u32 power_profile;
 	/** @mert_freq_cap_active: Wa_22019338487 min/max cap is currently in force */
 	bool mert_freq_cap_active;
+	/** @use_rpe: Toggle use of efficient frequency */
+	u32 use_rpe;
 };
 
 #endif	/* _XE_GUC_PC_TYPES_H_ */
-- 
2.53.0

