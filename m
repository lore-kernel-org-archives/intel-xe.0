Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568A4D711CD
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 22:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0FC10EBCF;
	Thu, 18 Dec 2025 22:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brOAtl7D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F328510EBCF
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 22:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766097548; x=1797633548;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=0wPu+rjnIPU4jYmlv+5O9PLoGjFNPG2gsIwoNDiK6zA=;
 b=brOAtl7D10oAiTZ86PEGUZOBlsVlHjGr3rf+41As1Wvybf/DXBaDKd3y
 OeJwJrkAsreRItKQ2bBKZqcRZshRWdOsOhIlf5kCj17kRx0KKN0dbvlfX
 UbFgnCdaU0UoRRgppax742rp+WE+VEDdb1bDcKds9m4YifggXOmE0sKW1
 JH/YRgNphxDPmkOQomakShu/SzrbqWXeWxGLVGy0IosJt4mkOOL/Hdi/b
 uWgdNfYsKKQZxLfE4PV4RPCgvgeczEnSq6sh5bZLwCwvhMrbxknFQoJly
 +iswfHQuLAzay9ueQASyMKQgz2tbnuXAkdzNXxA3YWBkrjD9GorT/04jI Q==;
X-CSE-ConnectionGUID: 4YaCm/c4Q4SofcLxB0veNQ==
X-CSE-MsgGUID: 9rqiF1gLTvaABmyYGY72pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71910910"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="71910910"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:39:07 -0800
X-CSE-ConnectionGUID: M4amlAB3SfeqhKskig/puw==
X-CSE-MsgGUID: hRwtGLHFQXidxwEIBhlt+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="199176848"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:39:07 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 09/12] drm/xe/pf: Prep for multiple exec quantums and preemption
 timeouts
Date: Thu, 18 Dec 2025 14:38:55 -0800
Message-ID: <20251218223846.1146344-23-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218223846.1146344-14-daniele.ceraolospurio@intel.com>
References: <20251218223846.1146344-14-daniele.ceraolospurio@intel.com>
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

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  8 ++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 25 +++++++++++++------
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |  5 ++--
 3 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 39dee685a92c..60758c034bf7 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -297,6 +297,10 @@ enum  {
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
@@ -319,6 +323,10 @@ enum  {
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
index 6e8507c24986..3e36a3c479a0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -299,10 +299,10 @@ static u32 encode_config(struct xe_gt *gt, u32 *cfg, const struct xe_gt_sriov_co
 	}
 
 	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_EXEC_QUANTUM);
-	cfg[n++] = config->exec_quantum;
+	cfg[n++] = config->exec_quantum[0];
 
 	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
-	cfg[n++] = config->preempt_timeout;
+	cfg[n++] = config->preempt_timeout[0];
 
 #define encode_threshold_config(TAG, NAME, VER...) ({					\
 	if (IF_ARGS(GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), true, VER)) {		\
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

