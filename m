Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE91CCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 22:24:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD0110EA5A;
	Thu, 30 Oct 2025 22:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/eoP9fV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F44010EA56
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 22:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761863055; x=1793399055;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k3v1qHm7JK3WVvrR65P2VHeZew0tVCdEOFIx6Aut/wQ=;
 b=a/eoP9fVDrvzeAqmPkVHiYtDg/jaU16G9SDkzOllLHrsSHWTSQYsj3jd
 bIlJliaMNEmGG0uwmk0O/6I074iSOWQX8jc6x0nXiC1LniH1iLwPYo/DX
 jICgtQ3wG5eV4Bz4iFi/loC76iW0mccYJ1H+cyWuwEkjtmEMOJjTU0Xgg
 CZlWXPYrImWCFhQqSLYDJFtWMNM7YeORM3CayAzgtl2n36Ek0IQgzECId
 S/NOaQp8IPTC0lrLsEV4m/vrQe5J5Losx7Oc+B5JUcEl2i8CqafWeDdGS
 WKdm9SSGR3n6Uh9Dvp1b76CV2DKUci1kDNTP8L56p4KB1mqG1S8wtPUQY w==;
X-CSE-ConnectionGUID: +mdde1fSRT2MH0k5ok9tqA==
X-CSE-MsgGUID: itNAtZ+0QA+zN5E0vIdVsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64059943"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64059943"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:24:14 -0700
X-CSE-ConnectionGUID: cic3ptrwTK6AA/7cJ9cXbg==
X-CSE-MsgGUID: V/AFMXapTMu5jPy/SYOLlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185346414"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:24:13 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 04/17] drm/xe/pf: Add _locked variants of the VF PT config
 functions
Date: Thu, 30 Oct 2025 23:23:35 +0100
Message-ID: <20251030222348.186658-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030222348.186658-1-michal.wajdeczko@intel.com>
References: <20251030222348.186658-1-michal.wajdeczko@intel.com>
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

In upcoming patches we will want to configure VF's preemption
timeout (PT) on all GTs under single lock to avoid potential
races due to parallel GT configuration attempts.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: unify kernel-doc (Piotr)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 65 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  4 ++
 2 files changed, 52 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index f3e79a30d8ec..ce733bde43e3 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1835,47 +1835,78 @@ static int pf_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
 }
 
 /**
- * xe_gt_sriov_pf_config_set_preempt_timeout - Configure preemption timeout for the VF.
+ * xe_gt_sriov_pf_config_set_preempt_timeout_locked() - Configure PF/VF preemption timeout.
  * @gt: the &xe_gt
- * @vfid: the VF identifier
+ * @vfid: the PF or VF identifier
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
+ * xe_gt_sriov_pf_config_set_preempt_timeout() - Configure PF/VF preemption timeout.
  * @gt: the &xe_gt
- * @vfid: the VF identifier
+ * @vfid: the PF or VF identifier
+ * @preempt_timeout: requested preemption timeout in microseconds (0 is infinity)
  *
  * This function can only be called on PF.
  *
- * Return: VF's (or PF's) preemption timeout in microseconds.
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
+ * xe_gt_sriov_pf_config_get_preempt_timeout_locked() - Get PF/VF preemption timeout.
+ * @gt: the &xe_gt
+ * @vfid: the PF or VF identifier
+ *
+ * This function can only be called on PF with the master mutex hold.
+ *
+ * Return: preemption timeout in microseconds (or 0 if infinity).
+ */
+u32 xe_gt_sriov_pf_config_get_preempt_timeout_locked(struct xe_gt *gt, unsigned int vfid)
+{
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	return pf_get_preempt_timeout(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_config_get_preempt_timeout() - Get PF/VF preemption timeout.
+ * @gt: the &xe_gt
+ * @vfid: the PF or VF identifier
+ *
+ * This function can only be called on PF.
+ *
+ * Return: preemption timeout in microseconds (or 0 if infinity).
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

