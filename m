Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99DA606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 22:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NRtJKFLv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690AD112776;
	Thu, 19 Nov 2026 22:30:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E62112776
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 22:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795127421; x=1826663421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eQl5bWeh1ca3LO7tKeUXBXINXxxuJO7V3Z60cTAfzag=;
 b=NRtJKFLv/Dcj6o4ivh6gpwNKQwzp60xmMQNMSA8lGufj2Y2Jtnm6hLCt
 2QOOwzMycVcrOmzZFsjLX0aA6hvIbLfryAWF0T75UWNZEcudI46egW5Td
 xLkUdJaOT+REc6Ih9Dp6n4pnMqnYjdp7wVEwIn+lQj9CViAXAajalrLAd
 yBBWR6HVg9BrXJ7gy9UV0JZluxDpMPkcfyPGJkKa4T5S3EWUG98GICHmi
 nsEWpmTLzkcIhbf8rFJG6ICZ7IVTQsYAxqbI3Xe8BxGG1zLjugruiVYwo
 q54H7E0zd9CZJ9PhzPLO3Rbo3lctoAgIsdgSZI/QljuxOKq7od8JWcPLH Q==;
X-CSE-ConnectionGUID: T2IMtIgBQcyxSQUup87tSw==
X-CSE-MsgGUID: ZSULrZxNTK+3QWqLIj+x2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3893376"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3893376"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 14:30:20 -0800
X-CSE-ConnectionGUID: 2hDXLEUrQ8C0KhK4kDN6Vw==
X-CSE-MsgGUID: BdvwX3d0T0yJu9FW17q7lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10564856"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by orviesa002.jf.intel.com with ESMTP; 19 Nov 2026 14:30:21 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v4 2/2] drm/xe: Add sysfs to disable RPe
Date: Thu, 19 Nov 2026 14:30:00 -0800
Message-ID: <20261119222958.1239889-4-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119222958.1239889-3-vinay.belgaumkar@intel.com>
References: <20261119222958.1239889-3-vinay.belgaumkar@intel.com>
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
v4: Disable RPe inside pc_adjust_freq_bounds (Sashiko), make use_rpe a
bool (Anirban)

Cc: Sk Anirban <sk.anirban@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_freq.c      | 35 ++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c       | 80 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 +
 4 files changed, 109 insertions(+), 9 deletions(-)

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
index ea47b0ded83a..0f98e8e48c57 100644
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
@@ -935,6 +943,15 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 
 	lockdep_assert_held(&pc->freq_lock);
 
+	/*
+	 * GuC enables RPe by default during SLPC reset, regardless of
+	 * use_rpe. Disable it so min_freq below reflects the true GT min
+	 * freq.
+	 */
+	ret = pc_set_ignore_eff_freq(pc, 1);
+	if (ret)
+		goto out;
+
 	ret = pc_action_query_task_state(pc);
 	if (ret)
 		goto out;
@@ -1091,12 +1108,23 @@ void xe_guc_pc_remove_flush_freq_limit(struct xe_guc_pc *pc)
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
@@ -1109,7 +1137,9 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
 	/*
 	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
 	 */
-	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
+	mert_freq_cap = min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc));
+
+	ret = pc_set_min_freq(pc, mert_freq_cap);
 	if (!ret)
 		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
 
@@ -1136,9 +1166,11 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
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
@@ -1192,6 +1224,31 @@ static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val)
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
+	if (!pc->mert_freq_cap_active) {
+		/*
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
@@ -1344,6 +1401,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	if (ret)
 		return ret;
 
+	ret = pc_set_ignore_eff_freq(pc, !pc->use_rpe);
+	if (unlikely(ret))
+		return ret;
+
 	ret = pc_set_mert_freq_cap(pc);
 	if (ret)
 		return ret;
@@ -1426,6 +1487,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
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
index 9a6ea2904e33..d59e7c935738 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
@@ -37,6 +37,8 @@ struct xe_guc_pc {
 	u32 power_profile;
 	/** @mert_freq_cap_active: Wa_22019338487 min/max cap is currently in force */
 	bool mert_freq_cap_active;
+	/** @use_rpe: Toggle use of efficient frequency */
+	bool use_rpe;
 };
 
 #endif	/* _XE_GUC_PC_TYPES_H_ */
-- 
2.53.0

