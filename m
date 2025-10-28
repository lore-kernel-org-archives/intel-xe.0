Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4483CCCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 17:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0840810E642;
	Tue, 28 Oct 2025 17:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5jx72xe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866E010E64D
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 17:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761674333; x=1793210333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aupFtisvb9i+PzeZpK2QpS1le3EurED9p6/79r+63mQ=;
 b=Z5jx72xeVxmXr8FT1shp2VmtuN5Ht4AXOAG+fpuKRsA6xqmubrpu7Lzq
 QoCY+CW5YxFoCX/adICSzXoM1cQa/CSyyXssRdYUgNPjw3iQAmM5vI4s3
 dRMF3ILLbFtPEeUdXceQXJTsGMK5ddHyASOYl98Xs9SDPe4X4JqBwneDY
 EFn0u3YP3ZHEcDrvm1AGppcvGcweASwcrvkRRQglG8yBaEeSpr1F05uj1
 xEMVZrgKw6im7RJ5kAErNn7Avf9L3Fj9hhIQBEaG1IDPEA0An2qoNFqbe
 Nr/AR/f397I0LGo2iM+Olra/XguUGTKytqjh0LNvUHwT7YdYzf6OVW3e7 w==;
X-CSE-ConnectionGUID: vMb8uYoAQ6yzU0fimHsycg==
X-CSE-MsgGUID: VAlbccwQQF+2CIvNgp/5Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63687823"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63687823"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:58:53 -0700
X-CSE-ConnectionGUID: xHHVe3YuQWSUB6rwR4ZB9w==
X-CSE-MsgGUID: AkJ2XIP0TWCinoERi1Y2Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189469346"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:58:50 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 03/17] drm/xe/pf: Add _locked variants of the VF EQ config
 functions
Date: Tue, 28 Oct 2025 18:58:17 +0100
Message-ID: <20251028175832.184534-4-michal.wajdeczko@intel.com>
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

In upcoming patches we will want to configure VF's execution
quantum (EQ) on all GTs under single lock to avoid potential
races in parallel GT configuration attempts.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 58 +++++++++++++++++-----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  4 ++
 2 files changed, 49 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index c0c0215c0703..717f81e76b8c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1732,29 +1732,65 @@ static int pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
 }
 
 /**
- * xe_gt_sriov_pf_config_set_exec_quantum - Configure execution quantum for the VF.
+ * xe_gt_sriov_pf_config_set_exec_quantum_locked() - Configure execution quantum of the VF.
  * @gt: the &xe_gt
  * @vfid: the VF identifier
  * @exec_quantum: requested execution quantum in milliseconds (0 is infinity)
  *
- * This function can only be called on PF.
+ * This function can only be called on PF with the master mutex hold.
+ * It will log the provisioned value or an error in case of the failure.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid,
-					   u32 exec_quantum)
+int xe_gt_sriov_pf_config_set_exec_quantum_locked(struct xe_gt *gt, unsigned int vfid,
+						  u32 exec_quantum)
 {
 	int err;
 
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
 	err = pf_provision_exec_quantum(gt, vfid, exec_quantum);
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
 	return pf_config_set_u32_done(gt, vfid, exec_quantum,
-				      xe_gt_sriov_pf_config_get_exec_quantum(gt, vfid),
+				      pf_get_exec_quantum(gt, vfid),
 				      "execution quantum", exec_quantum_unit, err);
 }
 
+/**
+ * xe_gt_sriov_pf_config_set_exec_quantum - Configure execution quantum for the VF.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @exec_quantum: requested execution quantum in milliseconds (0 is infinity)
+ *
+ * This function can only be called on PF.
+ * It will log the provisioned value or na error in case of the failure.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid,
+					   u32 exec_quantum)
+{
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return xe_gt_sriov_pf_config_set_exec_quantum_locked(gt, vfid, exec_quantum);
+}
+
+/**
+ * xe_gt_sriov_pf_config_get_exec_quantum_locked() - Get VF's execution quantum.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function can only be called on PF with the master mutex hold.
+ *
+ * Return: VF's (or PF's) execution quantum in milliseconds.
+ */
+u32 xe_gt_sriov_pf_config_get_exec_quantum_locked(struct xe_gt *gt, unsigned int vfid)
+{
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	return pf_get_exec_quantum(gt, vfid);
+}
+
 /**
  * xe_gt_sriov_pf_config_get_exec_quantum - Get VF's execution quantum.
  * @gt: the &xe_gt
@@ -1766,13 +1802,9 @@ int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid,
  */
 u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
 {
-	u32 exec_quantum;
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
 
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
-	exec_quantum = pf_get_exec_quantum(gt, vfid);
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
-
-	return exec_quantum;
+	return pf_get_exec_quantum(gt, vfid);
 }
 
 static const char *preempt_timeout_unit(u32 preempt_timeout)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 513e6512a575..b4beb5a97031 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -40,6 +40,10 @@ int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid, uns
 u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 exec_quantum);
 
+u32 xe_gt_sriov_pf_config_get_exec_quantum_locked(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_config_set_exec_quantum_locked(struct xe_gt *gt, unsigned int vfid,
+						  u32 exec_quantum);
+
 u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
 					      u32 preempt_timeout);
-- 
2.47.1

