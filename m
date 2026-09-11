Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F1FC88E4D
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 18:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA4910F6AE;
	Fri, 11 Sep 2026 18:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BFa368TE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CED10E2A4
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 18:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789151591; x=1820687591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/2+TUmuebyNziDjrJbFl6wpYBsQCc9g8eZB9afXpbzM=;
 b=BFa368TEcKCVZWa9LMmEMBA/38pedUx9KegzaNHkxUZkM6bh2JXxwVLy
 pbiGDRn8z9i/qeRcLs+y2x1oREp6lzHiSjfbDiP4f0FcWHeSD0uJI30Fy
 JuPu0EArF0hdr2BNB19ehq3OncYIxHg5p8V9eZQC3Yn3dwtqTZBXfdE3c
 o6+gH24StfiSmydaAer/Ec3w2nerKLfAjr0LeXl1PrkbyvMflt0eDTK3S
 h3LUsRXGyLNRbD/80dwKji4/n7ePMGLwyumcOD22yvpBgXaNnMS9v30uY
 LnqKFT4c/tFmVHldPBQ6FRVnoU8rP5yGIpPTm0uhHn312TeX9SNES6JuH A==;
X-CSE-ConnectionGUID: Q73S9ZmnTzOPHHaIckue0g==
X-CSE-MsgGUID: yY4Wnzl1QBWqhwy7vcCUsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89383781"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89383781"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 11:33:10 -0700
X-CSE-ConnectionGUID: GrF6azkuTTODejCwoz+XHA==
X-CSE-MsgGUID: pR600QgeSJuEmKrngSPGGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="275748006"
Received: from ncataldi-mobl3.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.174])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 11:33:10 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/3] drm/xe/pf: Add _locked variant of the fair sched config
 function
Date: Fri, 11 Sep 2026 20:32:57 +0200
Message-ID: <20260911183257.14999-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911183257.14999-1-michal.wajdeczko@intel.com>
References: <20260911183257.14999-1-michal.wajdeczko@intel.com>
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

We will soon want to auto provision all VFs in a single step, while
already holding the master mutex. Split existing function into two.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 23 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 146981aedf5f..6947aeed458e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2784,15 +2784,16 @@ static bool pf_needs_provision_sched(struct xe_gt *gt, unsigned int num_vfs)
 #define XE_ADMIN_PF_SCHED_PRIORITY	GUC_SCHED_PRIORITY_HIGH
 
 /**
- * xe_gt_sriov_pf_config_set_fair_sched() - Provision PF and VFs with fair scheduling.
+ * xe_gt_sriov_pf_config_set_fair_sched_locked() - Provision PF and VFs with fair scheduling.
  * @gt: the &xe_gt
  * @num_vfs: number of VFs to provision (can't be 0)
  *
+ * The caller must hold the master PF mutex.
  * This function can only be called on PF.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs)
+int xe_gt_sriov_pf_config_set_fair_sched_locked(struct xe_gt *gt, unsigned int num_vfs)
 {
 	int result = 0;
 	int err;
@@ -2801,7 +2802,7 @@ int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs)
 	xe_gt_assert(gt, XE_FAIR_EXEC_QUANTUM_MS);
 	xe_gt_assert(gt, XE_FAIR_PREEMPT_TIMEOUT_US);
 
-	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
 	if (!pf_needs_provision_sched(gt, num_vfs))
 		return 0;
@@ -2822,6 +2823,22 @@ int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs)
 	return result;
 }
 
+/**
+ * xe_gt_sriov_pf_config_set_fair_sched() - Provision PF and VFs with fair scheduling.
+ * @gt: the &xe_gt
+ * @num_vfs: number of VFs to provision (can't be 0)
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs)
+{
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return xe_gt_sriov_pf_config_set_fair_sched_locked(gt, num_vfs);
+}
+
 static int pf_provision_threshold(struct xe_gt *gt, unsigned int vfid,
 				  enum xe_guc_klv_threshold_index index, u32 value)
 {
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index d43da8599977..3e10697d2174 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -87,6 +87,7 @@ int xe_gt_sriov_pf_config_set_threshold(struct xe_gt *gt, unsigned int vfid,
 					enum xe_guc_klv_threshold_index index, u32 value);
 
 int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs);
+int xe_gt_sriov_pf_config_set_fair_sched_locked(struct xe_gt *gt, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_sanitize(struct xe_gt *gt, unsigned int vfid, long timeout);
 int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool force);
-- 
2.47.1

