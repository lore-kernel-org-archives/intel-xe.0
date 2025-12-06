Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660EFD3B7E5
	for <intel-xe@archiver.kernel.org>; Sat,  6 Dec 2025 23:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B83710E311;
	Sat,  6 Dec 2025 23:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iC7I1nsi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6EBC10E313
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Dec 2025 23:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765062257; x=1796598257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=44YF/r3xhB0qXlJdpSxq/5n8mOjM8oLrXTDZXbJRIUI=;
 b=iC7I1nsiL5HZ5YxzOkdTMpDcyTPrixOkSOLgHDcx5GJyjE2oCH0M4+fo
 td73+IT9jje7mQDyYAVPGWAOORI/jP9I9nexlOsWGRTYNm5wmzquv8Xdi
 0rHxKVE+2VHmA8eqy5ASRC0l7UuH60pQwzgdbw8eMJ5dn598/e4dlP26R
 2MJV5+xj6ziEF/34UpzU+v0EMPyZzxK+Yw8qHOIFMsSoScJLKEWNUpoK/
 4moku3NPEklRf3QoY4pkYyj6s9o5nMr+cVWsZSQ7OVqVp3SziTH3cCtJc
 eCuz+dFJ3H/aeKqA4xMc3miBVUnkWT2NJUSePAAPidJNIRRk3D7vQB3lk A==;
X-CSE-ConnectionGUID: A7AkLhD9QVK7EFf4zv5A2g==
X-CSE-MsgGUID: eS16jngcQCyRuWmfp5JwLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="78411692"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="78411692"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 15:04:17 -0800
X-CSE-ConnectionGUID: 7+bD5p09TBaU36ViJCfiQQ==
X-CSE-MsgGUID: bFyEWY+uRxukrHHBkAa7yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="200045540"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 15:04:16 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 08/11] drm/xe/sriov: Prep for multiple exec quantums and
 preemption timeouts
Date: Sat,  6 Dec 2025 15:04:04 -0800
Message-ID: <20251206230356.3600292-21-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
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
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  8 ++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 25 +++++++++++++------
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |  5 ++--
 3 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 30a051a0b4ee..6331836ddea7 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -292,6 +292,10 @@ enum  {
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
@@ -314,6 +318,10 @@ enum  {
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
index dda671d05b89..be25c439a10b 100644
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
 
 #define encode_threshold_config(TAG, NAME, MIN_GUC_VER) ({				\
 	if (!MIN_GUC_VER || GUC_FIRMWARE_VER(&gt->uc.guc) >= MIN_GUC_VER) {		\
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
index 686c7b3b6d7a..a417d099688d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
@@ -7,6 +7,7 @@
 #define _XE_GT_SRIOV_PF_CONFIG_TYPES_H_
 
 #include "xe_ggtt_types.h"
+#include "xe_guc_fwif.h"
 #include "xe_guc_klv_thresholds_set_types.h"
 
 struct xe_bo;
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

