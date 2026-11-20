Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7C4606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 02:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LzcmTKE5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4BE1127D8;
	Fri, 20 Nov 2026 02:16:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FB31127D8
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 02:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795140984; x=1826676984;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MUWFlktB4SUOYXXMqDvFNbNDsQRpuHWvWd+FUrtzOSc=;
 b=LzcmTKE5rTydwYsTzpueWw1E9qLVvI3NeNX1f3aIk0S/2bJcwXovIv7N
 c7ox6Jtdx7uX5QydFAWIHBV+TDgp0E3siq9YVDywtAG8AkBZEYk03UZjJ
 NWyR5lqmtjHZ0pY2bbXRvBjp0uFi4ykm4A+4jNxXeuWGy6auYIpkRnbL3
 drK4Ag3bjI1hRJdmNn/FVjUi7fBmHXXlAHbg559PXJkV0ROKkoDKdVY5O
 wmA8u/CL7z8cxSti9NUdaA2MOUQJTzEcgY+Ssl3NDJAxMdC011BERLqQp
 MBmpv8QD8/rfjK3mz6jnPjbuK3SzYlwUnYtQV5UGPagYjH0118ifyoeCc A==;
X-CSE-ConnectionGUID: v2BDxVINSw6bb9tS1zkeKw==
X-CSE-MsgGUID: QnVXqarzTkiTg01VADl1Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3902848"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3902848"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 18:16:23 -0800
X-CSE-ConnectionGUID: zYuwDrcCQdSXTWwrEDJ6eA==
X-CSE-MsgGUID: Dmgui6ycRBeMSpi+cDBx9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10672908"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2026 18:16:23 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v5 1/2] drm/xe: Disallow freq changes while mert cap is active
Date: Thu, 19 Nov 2026 18:16:07 -0800
Message-ID: <20261120021606.1360244-3-vinay.belgaumkar@intel.com>
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
v5: Return stashed value for min/max during cap (Sashiko)

Fixes: 3b1592fb7835 ("drm/xe/lnl: Apply Wa_22019338487")
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c          |  6 +--
 drivers/gpu/drm/xe/xe_guc_pc.c       | 74 ++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 +
 3 files changed, 59 insertions(+), 23 deletions(-)

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
index 9558d7196a51..7e9700f16bfb 100644
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
@@ -612,6 +613,10 @@ static int xe_guc_pc_get_min_freq_locked(struct xe_guc_pc *pc, u32 *freq)
 	if (!pc->freq_ready)
 		return -EAGAIN;
 
+	/* In the middle of a temporary freq cap, return stashed value */
+	if (XE_GT_WA(pc_to_gt(pc), 22019338487) && pc->mert_freq_cap_active)
+		return pc->stashed_min_freq;
+
 	ret = pc_action_query_task_state(pc);
 	if (ret)
 		return ret;
@@ -638,17 +643,26 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
 
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
 
@@ -681,6 +695,10 @@ static int xe_guc_pc_get_max_freq_locked(struct xe_guc_pc *pc, u32 *freq)
 	if (!pc->freq_ready)
 		return -EAGAIN;
 
+	/* In the middle of a temporary freq cap, return stashed value */
+	if (XE_GT_WA(pc_to_gt(pc), 22019338487) && pc->mert_freq_cap_active)
+		return pc->stashed_max_freq;
+
 	ret = pc_action_query_task_state(pc);
 	if (ret)
 		return ret;
@@ -707,17 +725,26 @@ int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq)
 
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
 
@@ -1094,6 +1121,9 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
 	if (!ret)
 		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
 
+	if (!ret)
+		pc->mert_freq_cap_active = true;
+
 	return ret;
 }
 
@@ -1112,9 +1142,13 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
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

