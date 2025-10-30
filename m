Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0DFCCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 22:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A3510EA56;
	Thu, 30 Oct 2025 22:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gpVGBXzU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAFC10EA5A
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 22:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761863054; x=1793399054;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YhrsBOzz4ZYKQQeNnJmjFbgfDsqvIp2xg69OkVc6ao8=;
 b=gpVGBXzUVCI9DzVGpEAqyu3FJb0AG1PFD/cQ+y3g9qGROz2dSKyNnl8Q
 kSCedfruuBPE0aydO9+nw9ugTrm20BXp3j8p6gLHlfhMHshc/f5vOG6Iq
 jAtFneWIQd1JyjBS99/WAV5ovPMievSjLvi3kdYEx5gCIT0l/gIZVh3NT
 pQnK6aMqbpeHo/PF/pT++RrUdBQoeejx1k+Iyxl4UEhBY15ndxt+66+K2
 DjIKL3ivQVm1Qrqh1Xll4zTRipwAuCUSwPxWzhSls05RvJSOeuSmht9R5
 FZFAWUUdqIvncQxQ2o5heARNdpN0Rn01Ms5IleaPRRL804C+65cEtkjbr w==;
X-CSE-ConnectionGUID: JgT1LAAyRx22qd2IELqPeg==
X-CSE-MsgGUID: F/wNoYPFQyK8HFUQad9CEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64059942"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64059942"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:24:14 -0700
X-CSE-ConnectionGUID: Gw3b4erwScCVG2kbObDBdw==
X-CSE-MsgGUID: YBZ7ibkzT6m6EnJ7vHI0IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185346403"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:24:11 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 03/17] drm/xe/pf: Add _locked variants of the VF EQ config
 functions
Date: Thu, 30 Oct 2025 23:23:34 +0100
Message-ID: <20251030222348.186658-4-michal.wajdeczko@intel.com>
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

In upcoming patches we will want to configure VF's execution
quantum (EQ) on all GTs under single lock to avoid potential
races in parallel GT configuration attempts.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v2: fix typo, unify kernel-doc (Piotr)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 66 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  4 ++
 2 files changed, 53 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index c0c0215c0703..f3e79a30d8ec 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1732,47 +1732,79 @@ static int pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
 }
 
 /**
- * xe_gt_sriov_pf_config_set_exec_quantum - Configure execution quantum for the VF.
+ * xe_gt_sriov_pf_config_set_exec_quantum_locked() - Configure PF/VF execution quantum.
  * @gt: the &xe_gt
- * @vfid: the VF identifier
+ * @vfid: the PF or VF identifier
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
 
 /**
- * xe_gt_sriov_pf_config_get_exec_quantum - Get VF's execution quantum.
+ * xe_gt_sriov_pf_config_set_exec_quantum() - Configure PF/VF execution quantum.
  * @gt: the &xe_gt
- * @vfid: the VF identifier
+ * @vfid: the PF or VF identifier
+ * @exec_quantum: requested execution quantum in milliseconds (0 is infinity)
  *
  * This function can only be called on PF.
+ * It will log the provisioned value or an error in case of the failure.
  *
- * Return: VF's (or PF's) execution quantum in milliseconds.
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
+ * xe_gt_sriov_pf_config_get_exec_quantum_locked() - Get PF/VF execution quantum.
+ * @gt: the &xe_gt
+ * @vfid: the PF or VF identifier
+ *
+ * This function can only be called on PF with the master mutex hold.
+ *
+ * Return: execution quantum in milliseconds (or 0 if infinity).
+ */
+u32 xe_gt_sriov_pf_config_get_exec_quantum_locked(struct xe_gt *gt, unsigned int vfid)
+{
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	return pf_get_exec_quantum(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_config_get_exec_quantum() - Get PF/VF execution quantum.
+ * @gt: the &xe_gt
+ * @vfid: the PF or VF identifier
+ *
+ * This function can only be called on PF.
+ *
+ * Return: execution quantum in milliseconds (or 0 if infinity).
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

