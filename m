Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577DD606A68C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 22:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oE7BUgsh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF5D10E0E3;
	Fri, 20 Nov 2026 22:53:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDAF10E0E3
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 22:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795215215; x=1826751215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dVpcutwXjk8LDZo4ZIp7lZojnNk6ZOhfGf3p77QNdtM=;
 b=oE7BUgsh7dz2gPBc3yYwaS8IY9lzrq/qI5x3DJ1ZlKcoOprJ9mLDEoyA
 dbn9C/cCn0u4MIsopXDJaNGyPXhNsmpKdoBOOqarCDIHDkFMt57/Q1mFk
 +mqRo9LjP/FydMB5iWRv7WbMv3YmLUUfOFlS7sIAYPc7WFWwfXGwE+Md1
 nFB7jCNRaDHLYyRDuROok8Rfq12Zs0r2bUpHt/3dsqxN6Cw293SaVY/PM
 B9hO7JejHOb21OpPbOxxko73aPxrmEL+E7LyCOyfaxEBbsCDuQgzLFUx0
 7+A5H1+sYwVHVTKxcJl17APnG3s32wdrk5WGrcuUQUbGR2vOSjWVKhh0h w==;
X-CSE-ConnectionGUID: s8tMuFuPSReTrJs+EMfAMA==
X-CSE-MsgGUID: 0MTWZp9IQrS8M0DF2hV0sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4012735"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4012735"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 14:53:35 -0800
X-CSE-ConnectionGUID: W9QAWlM9RBCBO86rl60ABw==
X-CSE-MsgGUID: g30Ef51CQ3iE1NHeeWI5dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10886628"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by fmviesa005.fm.intel.com with ESMTP; 20 Nov 2026 14:53:34 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v6 2/2] drm/xe: Add sysfs to disable RPe
Date: Fri, 20 Nov 2026 14:53:27 -0800
Message-ID: <20261120225325.1460380-4-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120225325.1460380-3-vinay.belgaumkar@intel.com>
References: <20261120225325.1460380-3-vinay.belgaumkar@intel.com>
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
v5: Restore use_rpe while under pc->freq_lock(Sashiko)
v6: Fix bug in pc_init_freqs (Sashiko)

Cc: Sk Anirban <sk.anirban@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_freq.c      | 35 ++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c       | 81 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 +
 4 files changed, 110 insertions(+), 9 deletions(-)

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
index 7cbdb7985843..2d4ae5bb4876 100644
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
@@ -947,6 +955,15 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 
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
@@ -1103,12 +1120,23 @@ void xe_guc_pc_remove_flush_freq_limit(struct xe_guc_pc *pc)
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
@@ -1121,7 +1149,9 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
 	/*
 	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
 	 */
-	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
+	mert_freq_cap = min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc));
+
+	ret = pc_set_min_freq(pc, mert_freq_cap);
 	if (!ret)
 		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
 
@@ -1148,9 +1178,11 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
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
@@ -1182,6 +1214,11 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
 
 	pc_init_pcode_freq(pc);
 
+	/* Restore use_rpe */
+	ret = pc_set_ignore_eff_freq(pc, !pc->use_rpe);
+	if (ret)
+		goto out;
+
 	/*
 	 * The frequencies are really ready for use only after the user
 	 * requested ones got restored.
@@ -1204,6 +1241,31 @@ static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val)
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
@@ -1440,6 +1502,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
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

