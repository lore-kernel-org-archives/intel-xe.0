Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94084D116E8
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 01:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF91210E737;
	Thu, 27 Nov 2025 01:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IbDZkzqB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A4110E0A5
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 01:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764207930; x=1795743930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R22YtW6e7iES7mUMio8riPimYMPCNKhk6oKianKcQog=;
 b=IbDZkzqBN+jFfmU8KpfmQn89glU+9nQAuDeX7M4AEPKz1z6UUvbCurII
 fJtFfTxcdJtCXqyEEnvxRxrB1nPHXnzHjBpI10fuDVmPffmmOqa1uhEHe
 43yTo0P8+AZOMb+rWYPA1sqC4lvM+xfgEMnTVrqaRlkc0FLZPCWf1Hv9y
 guFe6r6zbBxBzxBw1G+S0KG9Ha3b96euVpdskY6mpHNA2eVzfX8G7IOrM
 lcRMuAzhM3XyMN523Va1pMR3wY+kFHyAm+CB5FidlS2a5lJddTpIq08U2
 5hsgT9gji3BYAYrfKPEXZt3HKDOSTzMJHY5Y8gNqQELn7W9v1wZMFbzba g==;
X-CSE-ConnectionGUID: jY3ZRD7aR/+njQKv7ohAzQ==
X-CSE-MsgGUID: sLY9aJawTcSOrA/Yyo/a2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70114859"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="70114859"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 17:45:26 -0800
X-CSE-ConnectionGUID: 821K74N2TNGh2JGZwUTdWQ==
X-CSE-MsgGUID: wdm/nViiR2anZ+SVNfsSVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="192753399"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 17:45:25 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 07/10] drm/xe/sriov: Prep for multiple exec quantums and
 preemption timeouts
Date: Wed, 26 Nov 2025 17:45:13 -0800
Message-ID: <20251127014507.2323746-19-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
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

Each scheduler group can be independently configured with its own exec
quantum and preemption timeouts. The existing KLVs to configure those
parameter will apply the value to all groups (even if they're not
enabled at the moment).

When scheduler groups are disable the GuC used the values from Group 0.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  7 ++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 25 +++++++++++++------
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |  5 ++--
 3 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index a6dce9da339f..48f47e26132d 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -290,7 +290,9 @@ enum  {
  *      infinitely long compute or shader kernel. In such a scenario, the
  *      PF would need to trigger a VM PAUSE and then change the KLV to force
  *      it to take effect. Such cases might typically happen on a 1PF+1VF
- *      Virtualization config enabled for heavier workloads like AI/ML.
+ *      Virtualization config enabled for heavier workloads like AI/ML. If
+ *      scheduling groups are supported, the provided value is applied to all
+ *      groups (even if they've not yet been enabled).
  *
  *      The max value for this KLV is 100 seconds, anything exceeding that
  *      will be clamped to the max.
@@ -312,7 +314,8 @@ enum  {
  *      In this case, the PF would need to trigger a VM PAUSE and then change
  *      the KLV to force it to take effect. Such cases might typically happen
  *      on a 1PF+1VF Virtualization config enabled for heavier workloads like
- *      AI/ML.
+ *      AI/ML. If scheduling groups are supported, the provided value is applied
+ *      to all groups (even if they've not yet been enabled).
  *
  *      The max value for this KLV is 100 seconds, anything exceeding that
  *      will be clamped to the max.
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 59c5c6b4d994..eb547fedb6da 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -298,10 +298,10 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool
 	}
 
 	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_EXEC_QUANTUM);
-	cfg[n++] = config->exec_quantum;
+	cfg[n++] = config->exec_quantum[0];
 
 	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
-	cfg[n++] = config->preempt_timeout;
+	cfg[n++] = config->preempt_timeout[0];
 
 #define encode_threshold_config(TAG, ...) ({					\
 	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
@@ -1857,12 +1857,15 @@ static int pf_provision_exec_quantum(struct xe_gt *gt, unsigned int vfid,
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
 	int err;
+	int i;
 
 	err = pf_push_vf_cfg_exec_quantum(gt, vfid, &exec_quantum);
 	if (unlikely(err))
 		return err;
 
-	config->exec_quantum = exec_quantum;
+	for (i = 0; i < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT; i++)
+		config->exec_quantum[i] = exec_quantum;
+
 	return 0;
 }
 
@@ -1870,7 +1873,7 @@ static u32 pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
 
-	return config->exec_quantum;
+	return config->exec_quantum[0];
 }
 
 /**
@@ -1987,12 +1990,14 @@ static int pf_provision_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
 	int err;
+	int i;
 
 	err = pf_push_vf_cfg_preempt_timeout(gt, vfid, &preempt_timeout);
 	if (unlikely(err))
 		return err;
 
-	config->preempt_timeout = preempt_timeout;
+	for (i = 0; i < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT; i++)
+		config->preempt_timeout[i] = preempt_timeout;
 
 	return 0;
 }
@@ -2001,7 +2006,7 @@ static u32 pf_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
 
-	return config->preempt_timeout;
+	return config->preempt_timeout[0];
 }
 
 /**
@@ -2180,10 +2185,14 @@ u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid
 
 static void pf_reset_config_sched(struct xe_gt *gt, struct xe_gt_sriov_config *config)
 {
+	int i;
+
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
-	config->exec_quantum = 0;
-	config->preempt_timeout = 0;
+	for (i = 0; i < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT; i++) {
+		config->exec_quantum[i] = 0;
+		config->preempt_timeout[i] = 0;
+	}
 }
 
 static int pf_provision_threshold(struct xe_gt *gt, unsigned int vfid,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
index 686c7b3b6d7a..abf003946242 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_GT_SRIOV_PF_CONFIG_TYPES_H_
 #define _XE_GT_SRIOV_PF_CONFIG_TYPES_H_
 
+#include "abi/guc_klvs_abi.h"
 #include "xe_ggtt_types.h"
 #include "xe_guc_klv_thresholds_set_types.h"
 
@@ -30,9 +31,9 @@ struct xe_gt_sriov_config {
 	/** @begin_db: start index of GuC doorbell ID range. */
 	u16 begin_db;
 	/** @exec_quantum: execution-quantum in milliseconds. */
-	u32 exec_quantum;
+	u32 exec_quantum[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT];
 	/** @preempt_timeout: preemption timeout in microseconds. */
-	u32 preempt_timeout;
+	u32 preempt_timeout[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT];
 	/** @sched_priority: scheduling priority. */
 	u32 sched_priority;
 	/** @thresholds: GuC thresholds for adverse events notifications. */
-- 
2.43.0

