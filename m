Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48E4D0BB46
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 23:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F08E10E877;
	Wed, 23 Oct 2024 23:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FE8vv1st";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2557D10E872
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 23:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729725130; x=1761261130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AwnnURAHt5qk7h9HX9vN+5e7fmGFN4WywcnsFsE93YA=;
 b=FE8vv1str5zg2on+FQ7LmGOFtyE7D1XqPp9upR+xEPy6xDPTtcQb3YDl
 sZomSsyOogwh0PbT9z32Sdq3N0oHgXEcznSb7H0AVEkCeEnr5qmRyl/kf
 jhv7RZi7wyvlVkXzfACT5KA/JHzLOqCExldSkeHYoV6wR3KfGHgvmsSQL
 6kcSChhYYUqvdibbLncgSZwKksjpgMW6sLnZinbvVqq2ZVEHh6Ai3Kysg
 mwAGN9LaGn9i4uyrw4xQGOiUDwrLa0d3nPjXKXiarkdaAKmCSPLCbZ2cV
 OivnwRSLsa1pP14ENtKeB7kXp23lvSgCYKFmB59seeO2L3sZx3Nky0EOt Q==;
X-CSE-ConnectionGUID: U0IsWM++QFK7wZPzrQ6utQ==
X-CSE-MsgGUID: bw4spgNNQNaKSNSWSS9J4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="28775156"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="28775156"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 16:12:10 -0700
X-CSE-ConnectionGUID: wGz3faS8Rl2IBpQVMbhXEQ==
X-CSE-MsgGUID: 4+mN8p8rSBiWp2+eopUvTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="111217984"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.97.255])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 16:12:09 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/5] drm/xe/pf: Add functions to configure VF scheduling
 priority
Date: Thu, 24 Oct 2024 01:11:50 +0200
Message-Id: <20241023231152.1815-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241023231152.1815-1-michal.wajdeczko@intel.com>
References: <20241023231152.1815-1-michal.wajdeczko@intel.com>
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

Add functions to configure PF or VF scheduling priority using the
VF_CFG_SCHED_PRIORITY KLV.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 76 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |  3 +
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |  2 +
 3 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 062a0c2fd2cd..2a9d9aab73c8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -207,6 +207,11 @@ static int pf_push_vf_cfg_preempt_timeout(struct xe_gt *gt, unsigned int vfid, u
 	return pf_push_vf_cfg_u32(gt, vfid, GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY, *preempt_timeout);
 }
 
+static int pf_push_vf_cfg_priority(struct xe_gt *gt, unsigned int vfid, u32 priority)
+{
+	return pf_push_vf_cfg_u32(gt, vfid, GUC_KLV_VF_CFG_SCHED_PRIORITY_KEY, priority);
+}
+
 static int pf_push_vf_cfg_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 {
 	return pf_push_vf_cfg_u64(gt, vfid, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, size);
@@ -1765,6 +1770,77 @@ u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfi
 	return preempt_timeout;
 }
 
+static const char *priority_unit(u32 priority)
+{
+	return priority == GUC_SCHED_PRIORITY_LOW ? "(low)" :
+		priority == GUC_SCHED_PRIORITY_NORMAL ? "(normal)" :
+		priority == GUC_SCHED_PRIORITY_HIGH ? "(high)" :
+		"(?)";
+}
+
+static int pf_provision_priority(struct xe_gt *gt, unsigned int vfid, u32 priority)
+{
+	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+	int err;
+
+	err = pf_push_vf_cfg_priority(gt, vfid, priority);
+	if (unlikely(err))
+		return err;
+
+	config->priority = priority;
+	return 0;
+}
+
+static int pf_get_priority(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+
+	return config->priority;
+}
+
+/**
+ * xe_gt_sriov_pf_config_set_priority - Configure scheduling priority.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @priority: requested scheduling priority
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_set_priority(struct xe_gt *gt, unsigned int vfid, u32 priority)
+{
+	int err;
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	err = pf_provision_priority(gt, vfid, priority);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return pf_config_set_u32_done(gt, vfid, priority,
+				      xe_gt_sriov_pf_config_get_priority(gt, vfid),
+				      "priority", priority_unit, err);
+}
+
+/**
+ * xe_gt_sriov_pf_config_get_priority - Get VF's scheduling priority.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function can only be called on PF.
+ *
+ * Return: VF's (or PF's) scheduling priority.
+ */
+u32 xe_gt_sriov_pf_config_get_priority(struct xe_gt *gt, unsigned int vfid)
+{
+	u32 priority;
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	priority = pf_get_priority(gt, vfid);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return priority;
+}
+
 static void pf_reset_config_sched(struct xe_gt *gt, struct xe_gt_sriov_config *config)
 {
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 0c55aa40a1a7..5eb539508844 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -44,6 +44,9 @@ u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfi
 int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
 					      u32 preempt_timeout);
 
+u32 xe_gt_sriov_pf_config_get_priority(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_config_set_priority(struct xe_gt *gt, unsigned int vfid, u32 priority);
+
 u32 xe_gt_sriov_pf_config_get_threshold(struct xe_gt *gt, unsigned int vfid,
 					enum xe_guc_klv_threshold_index index);
 int xe_gt_sriov_pf_config_set_threshold(struct xe_gt *gt, unsigned int vfid,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
index 2d3b73d78f14..2394ca5e0488 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
@@ -33,6 +33,8 @@ struct xe_gt_sriov_config {
 	u32 exec_quantum;
 	/** @preempt_timeout: preemption timeout in microseconds. */
 	u32 preempt_timeout;
+	/** @priority: scheduling priority. */
+	u32 priority;
 	/** @thresholds: GuC thresholds for adverse events notifications. */
 	u32 thresholds[XE_GUC_KLV_NUM_THRESHOLDS];
 };
-- 
2.43.0

