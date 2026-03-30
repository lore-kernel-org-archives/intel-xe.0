Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2017C1061B22
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 20:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1B310E80B;
	Mon, 30 Mar 2026 20:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LkkC/XLA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A2410E807
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 20:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774903273; x=1806439273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/fieZxWITSCG6eYZBINQDgJQ3BZQh3ei0yGGsHLIuHA=;
 b=LkkC/XLAOFUPzkwdOLilWKKYzez1WhmomhHXsrl1jk8j1r608Hf4ysty
 hFCvzUHE4D2cDk/q3UMNZL08R+/+z2+ograU7EfvJzZCI0mliZSEcvTiV
 Gbfk7S2TzsyrGvDg2fgUyqto4wfifud/glevzYtjPE7D8tABg3uA7yG6B
 59yV7aE41Uz7M7ybke14ol4EtpNewjjRq+rVmZoCbvY6Y1M0qEj6eUOW3
 j+jf7VRqMYy0kd7Rd8bF1mSwlkGd/3EDD6O1LPW5BoGYO3Qv5s3nkQPCu
 5haf7LUR46VNNUI+BITGAr36Z/HoWRBvTOUAMlFVgA4hLz/ygAtJc1+a8 g==;
X-CSE-ConnectionGUID: N9AqVPaVRWySJOGu+MdBrA==
X-CSE-MsgGUID: JcM1wi5cSjaAMDAGWNpRtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75923717"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75923717"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:41:13 -0700
X-CSE-ConnectionGUID: WO11lKt1RvCrLn3oakAAcQ==
X-CSE-MsgGUID: TldTZCTaRdyGAxSu6qUMIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="225329452"
Received: from liyantan-mobl1.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.179])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:41:11 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 12/13] drm/xe/pf: Extract helpers for bulk EQ/PT provisioning
Date: Mon, 30 Mar 2026 22:40:43 +0200
Message-ID: <20260330204046.567-13-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330204046.567-1-michal.wajdeczko@intel.com>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
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

We already have functions to bulk provision execution quantum and
preemption timeout, but they are applying changes to all possible
VFs, while in upcoming patch we would like to provision only subset
of available VFs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 66 +++++++++++++---------
 1 file changed, 40 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 680ea73d1ce3..7f85d6629fec 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2193,34 +2193,41 @@ u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
 	return pf_get_exec_quantum(gt, vfid);
 }
 
-/**
- * xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked() - Configure EQ for PF and VFs.
- * @gt: the &xe_gt to configure
- * @exec_quantum: requested execution quantum in milliseconds (0 is infinity)
- *
- * This function can only be called on PF with the master mutex hold.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked(struct xe_gt *gt, u32 exec_quantum)
+static int pf_bulk_set_exec_quantum(struct xe_gt *gt, u32 exec_quantum,
+				    unsigned int first_vf, unsigned int num_vfs)
 {
-	unsigned int totalvfs = xe_gt_sriov_pf_get_totalvfs(gt);
 	unsigned int n;
 	int err = 0;
 
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
-	for (n = 0; n <= totalvfs; n++) {
+	for (n = first_vf; n < first_vf + num_vfs; n++) {
 		err = pf_provision_exec_quantum(gt, VFID(n), exec_quantum);
 		if (err)
 			break;
 	}
 
-	return pf_config_bulk_set_u32_done(gt, 0, 1 + totalvfs, exec_quantum,
+	return pf_config_bulk_set_u32_done(gt, first_vf, num_vfs, exec_quantum,
 					   pf_get_exec_quantum, "execution quantum",
 					   exec_quantum_unit, n, err);
 }
 
+/**
+ * xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked() - Configure EQ for PF and VFs.
+ * @gt: the &xe_gt to configure
+ * @exec_quantum: requested execution quantum in milliseconds (0 is infinity)
+ *
+ * This function can only be called on PF with the master mutex hold.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked(struct xe_gt *gt, u32 exec_quantum)
+{
+	unsigned int totalvfs = xe_gt_sriov_pf_get_totalvfs(gt);
+
+	return pf_bulk_set_exec_quantum(gt, exec_quantum, PFID, 1 + totalvfs);
+}
+
 static int pf_provision_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
 					     const u32 *exec_quantums, u32 count)
 {
@@ -2418,34 +2425,41 @@ u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfi
 	return pf_get_preempt_timeout(gt, vfid);
 }
 
-/**
- * xe_gt_sriov_pf_config_bulk_set_preempt_timeout_locked() - Configure PT for PF and VFs.
- * @gt: the &xe_gt to configure
- * @preempt_timeout: requested preemption timeout in microseconds (0 is infinity)
- *
- * This function can only be called on PF with the master mutex hold.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int xe_gt_sriov_pf_config_bulk_set_preempt_timeout_locked(struct xe_gt *gt, u32 preempt_timeout)
+static int pf_bulk_set_preempt_timeout(struct xe_gt *gt, u32 preempt_timeout,
+				       unsigned int first_vf, unsigned int num_vfs)
 {
-	unsigned int totalvfs = xe_gt_sriov_pf_get_totalvfs(gt);
 	unsigned int n;
 	int err = 0;
 
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
-	for (n = 0; n <= totalvfs; n++) {
+	for (n = first_vf; n < first_vf + num_vfs; n++) {
 		err = pf_provision_preempt_timeout(gt, VFID(n), preempt_timeout);
 		if (err)
 			break;
 	}
 
-	return pf_config_bulk_set_u32_done(gt, 0, 1 + totalvfs, preempt_timeout,
+	return pf_config_bulk_set_u32_done(gt, first_vf, num_vfs, preempt_timeout,
 					   pf_get_preempt_timeout, "preemption timeout",
 					   preempt_timeout_unit, n, err);
 }
 
+/**
+ * xe_gt_sriov_pf_config_bulk_set_preempt_timeout_locked() - Configure PT for PF and VFs.
+ * @gt: the &xe_gt to configure
+ * @preempt_timeout: requested preemption timeout in microseconds (0 is infinity)
+ *
+ * This function can only be called on PF with the master mutex hold.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_bulk_set_preempt_timeout_locked(struct xe_gt *gt, u32 preempt_timeout)
+{
+	unsigned int totalvfs = xe_gt_sriov_pf_get_totalvfs(gt);
+
+	return pf_bulk_set_preempt_timeout(gt, preempt_timeout, PFID, 1 + totalvfs);
+}
+
 static int pf_provision_groups_preempt_timeouts(struct xe_gt *gt, unsigned int vfid,
 						const u32 *preempt_timeouts, u32 count)
 {
-- 
2.47.1

