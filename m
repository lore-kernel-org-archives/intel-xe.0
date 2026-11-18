Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8A5606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 01:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F6+QFYYy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C89710E58C;
	Wed, 18 Nov 2026 01:25:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7BF10E58C
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 01:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794965103; x=1826501103;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TuB5OVr0pk8mA/E0zvRp9u09DnaDdkYK41o7G1eHeIc=;
 b=F6+QFYYyEu3K1leCZtM5rwB+OizoMo67HCr/kan/NLg8zd3de0LA42g7
 Nu9kWGQy1hKHKNqcP+AV4/WL3zFMauih6gZriBFfg64HbZMi1NFTut6lM
 cj9bu9X8Qq2CmXUJwQ+LI+gznrigw1UPCdJH9qpNkaXOlknQPAsvAu5aT
 OjoxWhlBT1ZPSgG7v7HhF8POokPNPe5LAOTFjs+ux1DGNx4SyOZ0IjNVr
 AAFMIbYfdfY2HiTEm1PHmWGrRaq00uCWW3DBTpBqV1WSVFo3UqwSM1Ov4
 vYFi4UQH3A6nlPFwGTPe48u4hN8F1V9F/Jyy9amNAAbc+fGHB3nMje7DW g==;
X-CSE-ConnectionGUID: 5VIGuIjUTty7PA1aECwftg==
X-CSE-MsgGUID: O02WaFzkQPSOVITUhWt+IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3775352"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3775352"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 17:25:03 -0800
X-CSE-ConnectionGUID: 9GKNBoSORBmD3qyN19O1kA==
X-CSE-MsgGUID: pSiAmLpRQju7KvFLdk6p8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9875518"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by orviesa004.jf.intel.com with ESMTP; 17 Nov 2026 17:25:03 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v3 1/2] drm/xe: Disallow freq changes while mert cap is active
Date: Tue, 17 Nov 2026 17:24:54 -0800
Message-ID: <20261118012453.626087-3-vinay.belgaumkar@intel.com>
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

Fixes: 3b1592fb7835 ("drm/xe/lnl: Apply Wa_22019338487")
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c       | 66 +++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 +
 2 files changed, 48 insertions(+), 20 deletions(-)

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

