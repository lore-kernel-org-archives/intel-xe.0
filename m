Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B9BCCF9F4
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 17:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A416010E64C;
	Tue, 28 Oct 2025 17:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dZ4WzE8h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B18310E64F
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 17:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761674335; x=1793210335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ci0eXozTUvZn1Xl0UUE2zCZfQx1W8ohNo6s2uOnwfJA=;
 b=dZ4WzE8hEL9dlNJFleHd37jfjNBZzaznC9V/rxC88DX3RcuY5gqCnb1a
 lEDHEh/s1z76LFQoX9JHpzX4E8NoS1afsOiEh1yGFp0XYze2SHzFaaxcK
 q1a0RTXE7eq0FJQaBGe2Y8JmXPXGgRb5udcVO7gHzQ13PJkAvl1BEwbHD
 aHIGVPc/lULi4oeHuYhv2g0cE4T3G1y+orCUZsDf1kzM4Zxld346MUC8C
 PscHqwIvxd7UpPRctAwjqBKOT88cnbkjjc229VqAwThRMWmi9iOnlQfdg
 4drsPhkSD4vFBmWLBJZr7ZkbtOygW2mwJJF85ZrO9PQmeeOoMnzLSRkXd Q==;
X-CSE-ConnectionGUID: VW+HPY4/R36JNFxqGplqZw==
X-CSE-MsgGUID: LYZy+HWYTnyHFL6zrmgSJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63687828"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63687828"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:58:54 -0700
X-CSE-ConnectionGUID: +aZhj8XsRYe9vhNWaN1PKw==
X-CSE-MsgGUID: ukuYnm8hRNCipVb70Lw7Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189469351"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:58:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 04/17] drm/xe/pf: Add _locked variants of the VF PT config
 functions
Date: Tue, 28 Oct 2025 18:58:18 +0100
Message-ID: <20251028175832.184534-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028175832.184534-1-michal.wajdeczko@intel.com>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
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

In upcoming patches we will want to configure VF's preemption
timeout (PT) on all GTs under single lock to avoid potential
races due to parallel GT configuration attempts.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 59 +++++++++++++++++-----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  4 ++
 2 files changed, 49 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 717f81e76b8c..e48457bd7d12 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1835,31 +1835,66 @@ static int pf_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
 }
 
 /**
- * xe_gt_sriov_pf_config_set_preempt_timeout - Configure preemption timeout for the VF.
+ * xe_gt_sriov_pf_config_set_preempt_timeout_locked() - Configure preemption timeout of the VF.
  * @gt: the &xe_gt
  * @vfid: the VF identifier
  * @preempt_timeout: requested preemption timeout in microseconds (0 is infinity)
  *
- * This function can only be called on PF.
+ * This function can only be called on PF with the master mutex hold.
+ * It will log the provisioned value or an error in case of the failure.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
-					      u32 preempt_timeout)
+int xe_gt_sriov_pf_config_set_preempt_timeout_locked(struct xe_gt *gt, unsigned int vfid,
+						     u32 preempt_timeout)
 {
 	int err;
 
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
 	err = pf_provision_preempt_timeout(gt, vfid, preempt_timeout);
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
 	return pf_config_set_u32_done(gt, vfid, preempt_timeout,
-				      xe_gt_sriov_pf_config_get_preempt_timeout(gt, vfid),
+				      pf_get_preempt_timeout(gt, vfid),
 				      "preemption timeout", preempt_timeout_unit, err);
 }
 
 /**
- * xe_gt_sriov_pf_config_get_preempt_timeout - Get VF's preemption timeout.
+ * xe_gt_sriov_pf_config_set_preempt_timeout() - Configure preemption timeout of the VF.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @preempt_timeout: requested preemption timeout in microseconds (0 is infinity)
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
+					      u32 preempt_timeout)
+{
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return xe_gt_sriov_pf_config_set_preempt_timeout_locked(gt, vfid, preempt_timeout);
+}
+
+/**
+ * xe_gt_sriov_pf_config_get_preempt_timeout_locked() - Get VF's preemption timeout.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function can only be called on PF with the master mutex hold.
+ *
+ * Return: VF's (or PF's) preemption timeout in microseconds.
+ */
+u32 xe_gt_sriov_pf_config_get_preempt_timeout_locked(struct xe_gt *gt, unsigned int vfid)
+{
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	return pf_get_preempt_timeout(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_config_get_preempt_timeout() - Get VF's preemption timeout.
  * @gt: the &xe_gt
  * @vfid: the VF identifier
  *
@@ -1869,13 +1904,9 @@ int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfi
  */
 u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
 {
-	u32 preempt_timeout;
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
 
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
-	preempt_timeout = pf_get_preempt_timeout(gt, vfid);
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
-
-	return preempt_timeout;
+	return pf_get_preempt_timeout(gt, vfid);
 }
 
 static const char *sched_priority_unit(u32 priority)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index b4beb5a97031..6bab5ad6c849 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -48,6 +48,10 @@ u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfi
 int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
 					      u32 preempt_timeout);
 
+u32 xe_gt_sriov_pf_config_get_preempt_timeout_locked(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_config_set_preempt_timeout_locked(struct xe_gt *gt, unsigned int vfid,
+						     u32 preempt_timeout);
+
 u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_sched_priority(struct xe_gt *gt, unsigned int vfid, u32 priority);
 
-- 
2.47.1

