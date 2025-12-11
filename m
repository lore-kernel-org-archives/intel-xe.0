Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65DED3E786
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 01:57:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5A110E6D5;
	Thu, 11 Dec 2025 01:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z51oA+vZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C45110E6D0
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 01:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765418248; x=1796954248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Fjk5/al+kDkkorZx2PiZrjp84ZIZrIvZdAX1oSkIbk=;
 b=Z51oA+vZkoUIiVxaA96u79uFpIR0ufnOEMnnBkWOzIbfHEqdkMum2Zp6
 s5WHJqCtJkejf1gyBVplr370nVdz8yTMHJ3LpuvVPnEuOz9JhpYbUAjDr
 KcKMPr7r39PiTNYI+OmzYt94i6uEfGe38uOnqJz0ChrDpk6f6Z9/kqoT9
 qw9Fc3XLjS5VAwZLWDrhNb+5m6d2cJlPyz7/QVC4NWZcIKrZzQc4CblAR
 r+5UXLqVGueVs3V5FIVsh+0G/yFuitxaLLAHyZ1MZoxGwFB08SZ7e8a9z
 6golaxMYBQclZzVLmcWm821vD09CaRhR246Tbqety4vRCf1XunbZAoxAY g==;
X-CSE-ConnectionGUID: j99mssVARLCSfeiAkKLKhw==
X-CSE-MsgGUID: GDw5hIknS9OpLu9sbmG9WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71244494"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="71244494"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:57:27 -0800
X-CSE-ConnectionGUID: lkdJWY03QvGQER1jbv0E/Q==
X-CSE-MsgGUID: SI8T4en6TNKq2nCqlZt4Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="196676795"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:57:27 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 09/12] drm/xe/sriov: Prep for multiple exec quantums and
 preemption timeouts
Date: Wed, 10 Dec 2025 17:57:08 -0800
Message-ID: <20251211015700.34266-23-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
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
parameters will apply the value to all groups (even if they're not
enabled at the moment).

When scheduler groups are disabled, the GuC uses the values from Group 0.

v2: improve doc, use ARRAY_SIZE for loops (Michal)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: improve doc, use ARRAY_SIZE for loops (Michal)
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  8 ++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 25 +++++++++++++------
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |  5 ++--
 3 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 186d4fa162c9..a5be29abe6fe 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -294,6 +294,10 @@ enum  {
  *      it to take effect. Such cases might typically happen on a 1PF+1VF
  *      Virtualization config enabled for heavier workloads like AI/ML.
  *
+ *      If scheduling groups are supported, the provided value is applied to all
+ *      groups (even if they've not yet been enabled). Support for this feature
+ *      is available from GuC 70.53.0.
+ *
  *      The max value for this KLV is 100 seconds, anything exceeding that
  *      will be clamped to the max.
  *
@@ -316,6 +320,10 @@ enum  {
  *      on a 1PF+1VF Virtualization config enabled for heavier workloads like
  *      AI/ML.
  *
+ *      If scheduling groups are supported, the provided value is applied to all
+ *      groups (even if they've not yet been enabled). Support for this feature
+ *      is available from GuC 70.53.0.
+ *
  *      The max value for this KLV is 100 seconds, anything exceeding that
  *      will be clamped to the max.
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 3d9bfdd305c9..503697b4381e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -299,10 +299,10 @@ static u32 encode_config(struct xe_gt *gt, u32 *cfg,
 	}
 
 	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_EXEC_QUANTUM);
-	cfg[n++] = config->exec_quantum;
+	cfg[n++] = config->exec_quantum[0];
 
 	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
-	cfg[n++] = config->preempt_timeout;
+	cfg[n++] = config->preempt_timeout[0];
 
 #define encode_threshold_config(TAG, NAME, MAJ, MIN) ({					\
 	if (!MAJ || GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(MAJ, MIN, 0)) {	\
@@ -1860,12 +1860,15 @@ static int pf_provision_exec_quantum(struct xe_gt *gt, unsigned int vfid,
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
 	int err;
+	int i;
 
 	err = pf_push_vf_cfg_exec_quantum(gt, vfid, &exec_quantum);
 	if (unlikely(err))
 		return err;
 
-	config->exec_quantum = exec_quantum;
+	for (i = 0; i < ARRAY_SIZE(config->exec_quantum); i++)
+		config->exec_quantum[i] = exec_quantum;
+
 	return 0;
 }
 
@@ -1873,7 +1876,7 @@ static u32 pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
 
-	return config->exec_quantum;
+	return config->exec_quantum[0];
 }
 
 /**
@@ -1990,12 +1993,14 @@ static int pf_provision_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
 	int err;
+	int i;
 
 	err = pf_push_vf_cfg_preempt_timeout(gt, vfid, &preempt_timeout);
 	if (unlikely(err))
 		return err;
 
-	config->preempt_timeout = preempt_timeout;
+	for (i = 0; i < ARRAY_SIZE(config->preempt_timeout); i++)
+		config->preempt_timeout[i] = preempt_timeout;
 
 	return 0;
 }
@@ -2004,7 +2009,7 @@ static u32 pf_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
 
-	return config->preempt_timeout;
+	return config->preempt_timeout[0];
 }
 
 /**
@@ -2183,10 +2188,14 @@ u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid
 
 static void pf_reset_config_sched(struct xe_gt *gt, struct xe_gt_sriov_config *config)
 {
+	int i;
+
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
-	config->exec_quantum = 0;
-	config->preempt_timeout = 0;
+	for (i = 0; i < ARRAY_SIZE(config->exec_quantum); i++) {
+		config->exec_quantum[i] = 0;
+		config->preempt_timeout[i] = 0;
+	}
 }
 
 static int pf_provision_threshold(struct xe_gt *gt, unsigned int vfid,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
index 686c7b3b6d7a..75a48d0fa859 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_GT_SRIOV_PF_CONFIG_TYPES_H_
 #define _XE_GT_SRIOV_PF_CONFIG_TYPES_H_
 
+#include "abi/guc_scheduler_abi.h"
 #include "xe_ggtt_types.h"
 #include "xe_guc_klv_thresholds_set_types.h"
 
@@ -30,9 +31,9 @@ struct xe_gt_sriov_config {
 	/** @begin_db: start index of GuC doorbell ID range. */
 	u16 begin_db;
 	/** @exec_quantum: execution-quantum in milliseconds. */
-	u32 exec_quantum;
+	u32 exec_quantum[GUC_MAX_SCHED_GROUPS];
 	/** @preempt_timeout: preemption timeout in microseconds. */
-	u32 preempt_timeout;
+	u32 preempt_timeout[GUC_MAX_SCHED_GROUPS];
 	/** @sched_priority: scheduling priority. */
 	u32 sched_priority;
 	/** @thresholds: GuC thresholds for adverse events notifications. */
-- 
2.43.0

