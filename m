Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7598CD6AAF8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 19:18:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E4310E533;
	Thu,  2 Apr 2026 19:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ecEFxF9G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEF310E533
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 19:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775157492; x=1806693492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jQJGsSXtZO1F4ePWz8aK3ECDMccFp7UIkuPFlUEiIv0=;
 b=ecEFxF9Gm+OopEUV8qQnIe4g3sItwWbGTD0j/pnw2v6GFyHaW4Av4aWS
 cbNe2q3mSwnPkkHXsxr+J6TIIeE/fLR1TYv1XPAz/RCmVPT51aCwqwlzE
 qvGiFHTBhk0MB/7JtC2kmRzJD0EpyHdu46BiPEzdA5X8nUdzuoqQUidfq
 ICrWPXYn98tImgmLRqV2kpsNUmftR2mEXrQeP40AHLeKRwLNlwHl7cLOz
 aWV3HciZyURbba827wPhfr+BtC17IwxZIhAY/G3EsXEFfyarG6S6/Md+Z
 y8+SVM6/8410hLgXXvPhol87JKsYBqEyeikYe2jNVnIz7YDQzqTmHjesb w==;
X-CSE-ConnectionGUID: HaJPAUOLRK2iLVRD5xLJww==
X-CSE-MsgGUID: KRx52a+8SFeGibRPxXER+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76241088"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="76241088"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:11 -0700
X-CSE-ConnectionGUID: A+94/159RNOXEF46rUDlBw==
X-CSE-MsgGUID: IWh1otV1RAaL0dys8j/Uxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="222212964"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:09 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 03/13] drm/xe/pf: Force new VFs prorities only once
Date: Thu,  2 Apr 2026 21:17:16 +0200
Message-ID: <20260402191726.4932-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402191726.4932-1-michal.wajdeczko@intel.com>
References: <20260402191726.4932-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We should force change of VFs scheduling priorities only after
initial change of the SCHED_IF_IDLE policy. Doing that also during
any later policy reprovisioning will overwrite changes done on the
individual per-VF scheduling priorities (currently only for PF).

While around also move priority change code to the _config component
to maintain a proper isolation. Also document our expectation about
the GuC version where the new meaning of the policy KLV is present.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v2: add lockdep_assert_held (Piotr)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 29 ++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 44 ++++++++++------------
 3 files changed, 49 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 658e9b048751..c74745642a92 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2550,6 +2550,35 @@ u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid
 	return priority;
 }
 
+/**
+ * xe_gt_sriov_pf_config_force_sched_priority_locked() - Force update scheduling priority.
+ * @gt: the &xe_gt
+ * @priority: new scheduling priority to set
+ *
+ * This function allows to update cached values of the scheduling priorities of all
+ * VFs (and PF) as result of applying the `GUC_KLV_VGT_POLICY_SCHED_IF_IDLE`_ policy.
+ *
+ * This function can only be called on PF.
+ */
+void xe_gt_sriov_pf_config_force_sched_priority_locked(struct xe_gt *gt, u32 priority)
+{
+	unsigned int total_vfs = 1 + xe_gt_sriov_pf_get_totalvfs(gt);
+	struct xe_gt_sriov_config *config;
+	unsigned int n;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	for (n = 0; n < total_vfs; n++) {
+		config = pf_pick_vf_config(gt, VFID(n));
+		config->sched_priority = priority;
+	}
+
+	pf_config_bulk_set_u32_done(gt, PFID, 1 + total_vfs, priority,
+				    pf_get_sched_priority, "scheduling priority",
+				    sched_priority_unit, n, 0);
+}
+
 static void pf_reset_config_sched(struct xe_gt *gt, struct xe_gt_sriov_config *config)
 {
 	int i;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 4a004ecd6140..e9314f0a9b4e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -71,6 +71,7 @@ int xe_gt_sriov_pf_config_set_groups_preempt_timeouts(struct xe_gt *gt, unsigned
 
 u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_sched_priority(struct xe_gt *gt, unsigned int vfid, u32 priority);
+void xe_gt_sriov_pf_config_force_sched_priority_locked(struct xe_gt *gt, u32 priority);
 
 u32 xe_gt_sriov_pf_config_get_threshold(struct xe_gt *gt, unsigned int vfid,
 					enum xe_guc_klv_threshold_index index);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index 848e24926ecd..6ab02e96e46c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -8,6 +8,7 @@
 #include "abi/guc_actions_sriov_abi.h"
 
 #include "xe_gt.h"
+#include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_policy.h"
 #include "xe_gt_sriov_printk.h"
@@ -153,33 +154,14 @@ static int pf_update_policy_u32(struct xe_gt *gt, u16 key, u32 *policy, u32 valu
 	return 0;
 }
 
-static void pf_bulk_reset_sched_priority(struct xe_gt *gt, u32 priority)
-{
-	unsigned int total_vfs = 1 + xe_gt_sriov_pf_get_totalvfs(gt);
-	unsigned int n;
-
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
-
-	for (n = 0; n < total_vfs; n++)
-		gt->sriov.pf.vfs[n].config.sched_priority = priority;
-}
-
 static int pf_provision_sched_if_idle(struct xe_gt *gt, bool enable)
 {
-	int err;
-
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
-	err = pf_update_policy_bool(gt, GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY,
-				    &gt->sriov.pf.policy.guc.sched_if_idle,
-				    enable);
-
-	if (!err)
-		pf_bulk_reset_sched_priority(gt, enable ? GUC_SCHED_PRIORITY_NORMAL :
-					     GUC_SCHED_PRIORITY_LOW);
-	return err;
+	return pf_update_policy_bool(gt, GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY,
+				     &gt->sriov.pf.policy.guc.sched_if_idle,
+				     enable);
 }
 
 static int pf_reprovision_sched_if_idle(struct xe_gt *gt)
@@ -209,13 +191,25 @@ static void pf_sanitize_sched_if_idle(struct xe_gt *gt)
  */
 int xe_gt_sriov_pf_policy_set_sched_if_idle(struct xe_gt *gt, bool enable)
 {
+	u32 priority;
 	int err;
 
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
 	err = pf_provision_sched_if_idle(gt, enable);
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+	if (err)
+		return err;
 
-	return err;
+	/*
+	 * As of GuC 70.12 a change of this policy impacts individual configs
+	 * of all VFs. See `GUC_KLV_VGT_POLICY_SCHED_IF_IDLE`_ for details.
+	 */
+	xe_gt_assert(gt, GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 12));
+
+	priority = enable ? GUC_SCHED_PRIORITY_NORMAL : GUC_SCHED_PRIORITY_LOW;
+	xe_gt_sriov_pf_config_force_sched_priority_locked(gt, priority);
+
+	return 0;
 }
 
 /**
-- 
2.47.1

