Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFC8C55ABA
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 15:47:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCA910EEF3;
	Wed,  5 Aug 2026 15:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LS26cD6u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE10910EEED
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 15:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785944868; x=1817480868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9jjBsD0uKgGplcB8FGLvlaZsWDsAt4+OvgDR6G+QJ7M=;
 b=LS26cD6uJM5CQjtcIuhjXU+P5LDpQzRpMyjo+BbWGrf768yZzI4JCkBO
 B5qXqZt7r3+zF8sQis0Slf1rXwFq3cd2HpQePd+MoVeHprhQl5mWVRSpp
 V6W3zKo5Sae+lFjjHaIFuqjDl9HETarVJlqBO1D4ZnzW49KmBNndW63t5
 l1LQlYn/9ltaIetpaASmU1ZoA64Y9aBWPbHL75Cdw60ZqMp75layTo5nq
 h652jZkhDfxV8h5SKz/QKKZTvJj12qU6vAWmI1l732En0AQ0w+yX5iwW5
 6im2xFaRwh541Uspkp9XXaXhRN730lnl+fLSVoEtoFZWa4eZO9AzMh+dF w==;
X-CSE-ConnectionGUID: Mbbc1jSxREah5r5a7pqe1g==
X-CSE-MsgGUID: WBvx7yCtREyl0c019B/RxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="96874528"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="96874528"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 08:47:48 -0700
X-CSE-ConnectionGUID: sWn7SXcYRgKQnQumjEXQoQ==
X-CSE-MsgGUID: sojc6VIvRISAxEQXWCbzTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="266069769"
Received: from kposwiat-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.252.229])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 08:47:47 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/3] drm/xe/pf: Add _locked variant of the GGTT bulk config
 function
Date: Wed,  5 Aug 2026 17:47:31 +0200
Message-ID: <20260805154733.604-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805154733.604-1-michal.wajdeczko@intel.com>
References: <20260805154733.604-1-michal.wajdeczko@intel.com>
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

We will soon want to provision all VFs, including their GGTT config,
in one step. Split existing GGTT bulk configuration function into
two functions, one of which will expect the master lock to be already
taken. Use this new function in the fair GGTT provisioning.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 37 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 ++
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 2c9b85b84b1b..47623315d615 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -668,7 +668,7 @@ static int pf_config_bulk_set_u64_done(struct xe_gt *gt, unsigned int first, uns
 }
 
 /**
- * xe_gt_sriov_pf_config_bulk_set_ggtt - Provision many VFs with GGTT.
+ * xe_gt_sriov_pf_config_bulk_set_ggtt_locked() - Provision many VFs with GGTT.
  * @gt: the &xe_gt (can't be media)
  * @vfid: starting VF identifier (can't be 0)
  * @num_vfs: number of VFs to provision
@@ -678,31 +678,49 @@ static int pf_config_bulk_set_u64_done(struct xe_gt *gt, unsigned int first, uns
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_config_bulk_set_ggtt(struct xe_gt *gt, unsigned int vfid,
-					unsigned int num_vfs, u64 size)
+int xe_gt_sriov_pf_config_bulk_set_ggtt_locked(struct xe_gt *gt, unsigned int vfid,
+					       unsigned int num_vfs, u64 size)
 {
 	unsigned int n;
 	int err = 0;
 
 	xe_gt_assert(gt, vfid);
 	xe_gt_assert(gt, xe_gt_is_main_type(gt));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
 	if (!num_vfs)
 		return 0;
 
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 	for (n = vfid; n < vfid + num_vfs; n++) {
 		err = pf_provision_vf_ggtt(gt, n, size);
 		if (err)
 			break;
 	}
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
 	return pf_config_bulk_set_u64_done(gt, vfid, num_vfs, size,
-					   xe_gt_sriov_pf_config_get_ggtt,
+					   pf_get_vf_config_ggtt,
 					   "GGTT", n, err);
 }
 
+/**
+ * xe_gt_sriov_pf_config_bulk_set_ggtt() - Provision many VFs with GGTT.
+ * @gt: the &xe_gt (can't be media)
+ * @vfid: starting VF identifier (can't be 0)
+ * @num_vfs: number of VFs to provision
+ * @size: requested GGTT size
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_bulk_set_ggtt(struct xe_gt *gt, unsigned int vfid,
+					unsigned int num_vfs, u64 size)
+{
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return xe_gt_sriov_pf_config_bulk_set_ggtt_locked(gt, vfid, num_vfs, size);
+}
+
 /* Return: size of the largest continuous GGTT region */
 static u64 pf_get_max_ggtt(struct xe_gt *gt)
 {
@@ -775,10 +793,9 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
 	xe_gt_assert(gt, num_vfs);
 	xe_gt_assert(gt, xe_gt_is_main_type(gt));
 
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
 	fair = pf_estimate_fair_ggtt(gt, num_vfs);
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
-
 	if (!fair)
 		return -ENOSPC;
 
@@ -787,7 +804,7 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
 		xe_gt_sriov_info(gt, "Using non-profile provisioning (%s %llu vs %llu)\n",
 				 "GGTT", fair, profile);
 
-	return xe_gt_sriov_pf_config_bulk_set_ggtt(gt, vfid, num_vfs, fair);
+	return xe_gt_sriov_pf_config_bulk_set_ggtt_locked(gt, vfid, num_vfs, fair);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 2ec62c12ad5c..3741202908ee 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -18,6 +18,8 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt,
 					unsigned int vfid, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_bulk_set_ggtt(struct xe_gt *gt,
 					unsigned int vfid, unsigned int num_vfs, u64 size);
+int xe_gt_sriov_pf_config_bulk_set_ggtt_locked(struct xe_gt *gt,
+					       unsigned int vfid, unsigned int num_vfs, u64 size);
 
 u32 xe_gt_sriov_pf_config_get_ctxs(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_ctxs(struct xe_gt *gt, unsigned int vfid, u32 num_ctxs);
-- 
2.47.1

