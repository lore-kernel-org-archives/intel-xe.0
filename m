Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3839C561E6
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 15:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6480510EEF4;
	Wed,  5 Aug 2026 15:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P5spcUVT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CB110EEF3
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 15:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785944869; x=1817480869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R+fYV23ga9PuXtnwkCRKmB13/TXlMOfVizUM+igzcFg=;
 b=P5spcUVT/pKB1wJHGjzI68uXXYjDxh3TjND+G/RDhi0mdPbsm2pplUVm
 mPvUw813Ykcqrp1mPNTmW1XICofn/VLiz81rOGBOWlXRds34y2YMY3mBd
 d54CFTUcGNXau7yDHeXR55qqM6hhgTnh8RXFyuPgUkRHT/7Y3qvbF7geD
 lYplz5xWhVDwfad73SFXlIHvxtgWIZmlCPYgZNvyGRjQOwEuNgTOBQUk6
 nZcKAL1OmRf1y81TmnOmEqJLHNvGqxcOuF48lKpZAt2YDvh/HHBoJLFyE
 Ejv9dbzVZzWaZ+lxx9ii26c45LuFknguJSgW09GR8BM0Xoe/sfhrgEVGp g==;
X-CSE-ConnectionGUID: 7X1Kl00HQbyvCcoW0RYCpA==
X-CSE-MsgGUID: Ko+ZakicRt+T7NsRlshgCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="96874530"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="96874530"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 08:47:49 -0700
X-CSE-ConnectionGUID: d8Z7M7PkSOGJxy5/ArG9CA==
X-CSE-MsgGUID: 2CK7iLysQdCoMUUK9/Uh9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="266069773"
Received: from kposwiat-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.252.229])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 08:47:48 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/3] drm/xe/pf: Add _locked variant of the contexts bulk
 config function
Date: Wed,  5 Aug 2026 17:47:32 +0200
Message-ID: <20260805154733.604-3-michal.wajdeczko@intel.com>
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

We will soon want to provision all VFs, including their GuC context
IDs config, in one step. Split existing GuC IDs bulk configuration
function into two functions, one of which will expect the master
lock to be already taken. Use this new function in the fair GuC IDs
provisioning.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 37 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 ++
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 47623315d615..4976d8c018ce 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1116,7 +1116,7 @@ static int pf_config_bulk_set_u32_done(struct xe_gt *gt, unsigned int first, uns
 }
 
 /**
- * xe_gt_sriov_pf_config_bulk_set_ctxs - Provision many VFs with GuC context IDs.
+ * xe_gt_sriov_pf_config_bulk_set_ctxs_locked() - Provision many VFs with GuC context IDs.
  * @gt: the &xe_gt
  * @vfid: starting VF identifier
  * @num_vfs: number of VFs to provision
@@ -1126,30 +1126,48 @@ static int pf_config_bulk_set_u32_done(struct xe_gt *gt, unsigned int first, uns
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_config_bulk_set_ctxs(struct xe_gt *gt, unsigned int vfid,
-					unsigned int num_vfs, u32 num_ctxs)
+int xe_gt_sriov_pf_config_bulk_set_ctxs_locked(struct xe_gt *gt, unsigned int vfid,
+					       unsigned int num_vfs, u32 num_ctxs)
 {
 	unsigned int n;
 	int err = 0;
 
 	xe_gt_assert(gt, vfid);
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
 	if (!num_vfs)
 		return 0;
 
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 	for (n = vfid; n < vfid + num_vfs; n++) {
 		err = pf_provision_vf_ctxs(gt, n, num_ctxs);
 		if (err)
 			break;
 	}
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
 	return pf_config_bulk_set_u32_done(gt, vfid, num_vfs, num_ctxs,
-					   xe_gt_sriov_pf_config_get_ctxs,
+					   pf_get_vf_config_ctxs,
 					   "GuC context IDs", no_unit, n, err);
 }
 
+/**
+ * xe_gt_sriov_pf_config_bulk_set_ctxs() - Provision many VFs with GuC context IDs.
+ * @gt: the &xe_gt
+ * @vfid: starting VF identifier
+ * @num_vfs: number of VFs to provision
+ * @num_ctxs: requested number of GuC contexts IDs (0 to release)
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_bulk_set_ctxs(struct xe_gt *gt, unsigned int vfid,
+					unsigned int num_vfs, u32 num_ctxs)
+{
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return xe_gt_sriov_pf_config_bulk_set_ctxs_locked(gt, vfid, num_vfs, num_ctxs);
+}
+
 static u32 pf_profile_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
@@ -1198,10 +1216,9 @@ int xe_gt_sriov_pf_config_set_fair_ctxs(struct xe_gt *gt, unsigned int vfid,
 	xe_gt_assert(gt, vfid);
 	xe_gt_assert(gt, num_vfs);
 
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
 	fair = pf_estimate_fair_ctxs(gt, num_vfs);
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
-
 	if (!fair)
 		return -ENOSPC;
 
@@ -1210,7 +1227,7 @@ int xe_gt_sriov_pf_config_set_fair_ctxs(struct xe_gt *gt, unsigned int vfid,
 		xe_gt_sriov_info(gt, "Using non-profile provisioning (%s %u vs %u)\n",
 				 "GuC context IDs", fair, profile);
 
-	return xe_gt_sriov_pf_config_bulk_set_ctxs(gt, vfid, num_vfs, fair);
+	return xe_gt_sriov_pf_config_bulk_set_ctxs_locked(gt, vfid, num_vfs, fair);
 }
 
 static u32 pf_get_min_spare_dbs(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 3741202908ee..a14ca7bf7e4d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -26,6 +26,8 @@ int xe_gt_sriov_pf_config_set_ctxs(struct xe_gt *gt, unsigned int vfid, u32 num_
 int xe_gt_sriov_pf_config_set_fair_ctxs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_bulk_set_ctxs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
 					u32 num_ctxs);
+int xe_gt_sriov_pf_config_bulk_set_ctxs_locked(struct xe_gt *gt, unsigned int vfid,
+					       unsigned int num_vfs, u32 num_ctxs);
 
 u32 xe_gt_sriov_pf_config_get_dbs(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_dbs);
-- 
2.47.1

