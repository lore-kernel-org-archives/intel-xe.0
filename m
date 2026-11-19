Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07A5606A32C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 22:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WXfRDJvq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E0C11275F;
	Thu, 19 Nov 2026 22:30:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C73B11275F
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 22:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795127419; x=1826663419;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rrkdvLaOJu0R1vQl1AbN9fop2XuFC1Xx+34bMrNd0Lo=;
 b=WXfRDJvqJwvvX+3dKM7jZKgoTYv8W5XG/cg3p8GrhmGW/Y8tRn+XclAo
 gMV3xBhgynYIB/NOQkcoNPGyQ0wI4FAuA2FlV/J7I8Dmq68Xh0+/WzzJM
 6RMamySifDUyCTRYoct9yUGkuAI4lgCtwYCeSxqZYOzVF3NDMkjvrUvPJ
 hpdlQ8HYQiDQY3jSwrHlt/nkqApOOVSOszjojaak1ZMDmJSXv93k+WmA3
 G0nD2gVHZ6cn/e/wEN/b7rkd+pIQwvzN0/gyhQ6uTe8czqqXZnlCpc8mv
 45e7jFadFgJ8EFdbhkQE7K0NK5nX8o0W7baIPIK609ONZ4UqlCvDW7hd0 Q==;
X-CSE-ConnectionGUID: yyfmdiG8T3iyRmvjfLClqA==
X-CSE-MsgGUID: 0q7BtQTFQt6Jq20NJsBEqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3893358"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3893358"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 14:30:17 -0800
X-CSE-ConnectionGUID: fptjCWB2QxalZ8qkEdUjUQ==
X-CSE-MsgGUID: PDzKx49BQTK1ILw0wev4xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10564816"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by orviesa002.jf.intel.com with ESMTP; 19 Nov 2026 14:30:16 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v4 1/2] drm/xe: Disallow freq changes while mert cap is active
Date: Thu, 19 Nov 2026 14:29:59 -0800
Message-ID: <20261119222958.1239889-3-vinay.belgaumkar@intel.com>
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

When Wa_22019338487 is applied, GT freq is capped until GSC load is done.
During this time, it is possible that users can access sysfs to set min/max
GT frequencies. Modifying the frequencies between save/restore could cause
inconsistency. Prevent this by introducing a flag which tracks if the cap
is active and defer user min/max requests until the cap is lifted.

While we are here, fix the minor issue where mert cap is removed only on a
successful GSC load.

v2: Restore mert cap even after GSC load fails (Sashiko)

Fixes: 3b1592fb7835 ("drm/xe/lnl: Apply Wa_22019338487")
Assisted-by: LLM
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c          |  6 +--
 drivers/gpu/drm/xe/xe_guc_pc.c       | 66 +++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 +
 3 files changed, 51 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 8edb8cee3cbd..d750a4c5075b 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -290,9 +290,6 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
 
 	xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
 
-	/* GSC load is done, restore expected GT frequencies */
-	xe_gt_sanitize_freq(gt);
-
 	xe_gt_dbg(gt, "GSC FW async load completed\n");
 
 	/* HuC auth failure is not fatal */
@@ -376,6 +373,9 @@ static void gsc_work(struct work_struct *work)
 			xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
 		else
 			xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_RUNNING);
+
+		/* Restore the mert cap now that GSC load was attempted */
+		xe_gt_sanitize_freq(gt);
 	}
 
 	if (actions & GSC_ACTION_SW_PROXY)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 9558d7196a51..ea47b0ded83a 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -344,13 +344,18 @@ static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
 	pc_set_manual_rp_ctrl(pc, false);
 }
 
-static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
+static bool pc_freq_in_range(struct xe_guc_pc *pc, u32 freq)
 {
 	/*
 	 * Let's only check for the rpn-rp0 range. If max < min,
 	 * min becomes a fixed request.
 	 */
-	if (freq < pc->rpn_freq || freq > pc->rp0_freq)
+	return freq >= pc->rpn_freq && freq <= pc->rp0_freq;
+}
+
+static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
+{
+	if (!pc_freq_in_range(pc, freq))
 		return -EINVAL;
 
 	/*
@@ -377,12 +382,8 @@ static int pc_get_max_freq(struct xe_guc_pc *pc)
 
 static int pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
 {
-	/*
-	 * Let's only check for the rpn-rp0 range. If max < min,
-	 * min becomes a fixed request.
-	 * Also, overclocking is not supported.
-	 */
-	if (freq < pc->rpn_freq || freq > pc->rp0_freq)
+	/* Overclocking is not supported. */
+	if (!pc_freq_in_range(pc, freq))
 		return -EINVAL;
 
 	return pc_action_set_param(pc,
@@ -638,17 +639,26 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
 
 static int xe_guc_pc_set_min_freq_locked(struct xe_guc_pc *pc, u32 freq)
 {
-	int ret;
-
 	lockdep_assert_held(&pc->freq_lock);
 
 	/* Might be in the middle of a gt reset */
 	if (!pc->freq_ready)
 		return -EAGAIN;
 
-	ret = pc_set_min_freq(pc, freq);
-	if (ret)
-		return ret;
+	/*
+	 * While the Wa_22019338487 cap is active, defer applying the new min
+	 * to GuC; xe_guc_pc_restore_stashed_freq() will apply it once the
+	 * cap is removed.
+	 */
+	if (pc->mert_freq_cap_active) {
+		if (!pc_freq_in_range(pc, freq))
+			return -EINVAL;
+	} else {
+		int ret = pc_set_min_freq(pc, freq);
+
+		if (ret)
+			return ret;
+	}
 
 	pc->user_requested_min = freq;
 
@@ -707,17 +717,26 @@ int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq)
 
 static int xe_guc_pc_set_max_freq_locked(struct xe_guc_pc *pc, u32 freq)
 {
-	int ret;
-
 	lockdep_assert_held(&pc->freq_lock);
 
 	/* Might be in the middle of a gt reset */
 	if (!pc->freq_ready)
 		return -EAGAIN;
 
-	ret = pc_set_max_freq(pc, freq);
-	if (ret)
-		return ret;
+	/*
+	 * While the Wa_22019338487 cap is active, defer applying the new max
+	 * to GuC; xe_guc_pc_restore_stashed_freq() will apply it once the
+	 * cap is lifted.
+	 */
+	if (pc->mert_freq_cap_active) {
+		if (!pc_freq_in_range(pc, freq))
+			return -EINVAL;
+	} else {
+		int ret = pc_set_max_freq(pc, freq);
+
+		if (ret)
+			return ret;
+	}
 
 	pc->user_requested_max = freq;
 
@@ -1094,6 +1113,9 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
 	if (!ret)
 		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
 
+	if (!ret)
+		pc->mert_freq_cap_active = true;
+
 	return ret;
 }
 
@@ -1112,9 +1134,13 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
 		return 0;
 
 	mutex_lock(&pc->freq_lock);
-	ret = pc_set_max_freq(pc, pc->stashed_max_freq);
+	/* Apply any user min/max request made while the cap was active, else the stash. */
+	ret = pc_set_max_freq(pc, pc->user_requested_max ?: pc->stashed_max_freq);
+
+	if (!ret)
+		ret = pc_set_min_freq(pc, pc->user_requested_min ?: pc->stashed_min_freq);
 	if (!ret)
-		ret = pc_set_min_freq(pc, pc->stashed_min_freq);
+		pc->mert_freq_cap_active = false;
 	mutex_unlock(&pc->freq_lock);
 
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
index 711bbcdcb0d3..9a6ea2904e33 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
@@ -35,6 +35,8 @@ struct xe_guc_pc {
 	bool freq_ready;
 	/** @power_profile: Base or power_saving profile */
 	u32 power_profile;
+	/** @mert_freq_cap_active: Wa_22019338487 min/max cap is currently in force */
+	bool mert_freq_cap_active;
 };
 
 #endif	/* _XE_GUC_PC_TYPES_H_ */
-- 
2.53.0

