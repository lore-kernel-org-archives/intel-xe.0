Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C15C55174
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 15:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5898910E1B6;
	Wed,  5 Aug 2026 15:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PVuMJDZa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFD110E1B6
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 15:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785944871; x=1817480871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VAPvbPGM+fw0q5LAXo/HBvjDhIMZrfFHb8E9CiLO9Iw=;
 b=PVuMJDZaO1C0Dkb5oAidTcHHtv/9c+kWrUDAm6gtbwelTiyDUn1rFzuX
 haRRpLZGF7eqfagnMzbnIggkFm7ADRHgGsqTMrlo7Hu3rgLkXTYz2rYTH
 ovOa2L4Gmch35dBDQ1a7pL+ZCxOCiZyX/hpWlZ1sEv4WM8h16cUnr4+3O
 aPhWhjIbRCov8f4emI0qRSo4seelmwsmIggDKNmd7iWHGR2CQIg2pWSJi
 7OEjNc22iUcRoxXqwv+6WcWG/zMpQDagBXWUMtK3VQ+yvyJdKI0Gt1jS8
 WZRYnOmt/s38UueeGlwtYTr/f/5E/0gQs8MIePC+SLeL5gtWVLI6Uuz1h Q==;
X-CSE-ConnectionGUID: wOOcrR5ZRdO2ev74o2VBwA==
X-CSE-MsgGUID: 2GEsRtC/R76M9tp9tQuEmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="96874532"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="96874532"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 08:47:50 -0700
X-CSE-ConnectionGUID: HwGGkVepStKFgwFZNIyicQ==
X-CSE-MsgGUID: ZMB1PRgdQX2Xn0fuTkLuSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="266069779"
Received: from kposwiat-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.252.229])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 08:47:50 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/3] drm/xe/pf: Add _locked variant of the doorbells bulk
 config function
Date: Wed,  5 Aug 2026 17:47:33 +0200
Message-ID: <20260805154733.604-4-michal.wajdeczko@intel.com>
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

We will soon want to provision all VFs, including their GuC doorbell
IDs config, in one step. Split existing doorbells bulk configuration
function into two functions, one of which will expect the master lock
to be already taken. Use this new function in the fair GuC doorbells
provisioning.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 37 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 ++
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 4976d8c018ce..b3145444b3d5 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1397,7 +1397,7 @@ int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_d
 }
 
 /**
- * xe_gt_sriov_pf_config_bulk_set_dbs - Provision many VFs with GuC context IDs.
+ * xe_gt_sriov_pf_config_bulk_set_dbs_locked() - Provision many VFs with GuC context IDs.
  * @gt: the &xe_gt
  * @vfid: starting VF identifier (can't be 0)
  * @num_vfs: number of VFs to provision
@@ -1407,30 +1407,48 @@ int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_d
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid,
-				       unsigned int num_vfs, u32 num_dbs)
+int xe_gt_sriov_pf_config_bulk_set_dbs_locked(struct xe_gt *gt, unsigned int vfid,
+					      unsigned int num_vfs, u32 num_dbs)
 {
 	unsigned int n;
 	int err = 0;
 
 	xe_gt_assert(gt, vfid);
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
 	if (!num_vfs)
 		return 0;
 
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 	for (n = vfid; n < vfid + num_vfs; n++) {
 		err = pf_provision_vf_dbs(gt, n, num_dbs);
 		if (err)
 			break;
 	}
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
 	return pf_config_bulk_set_u32_done(gt, vfid, num_vfs, num_dbs,
-					   xe_gt_sriov_pf_config_get_dbs,
+					   pf_get_vf_config_dbs,
 					   "GuC doorbell IDs", no_unit, n, err);
 }
 
+/**
+ * xe_gt_sriov_pf_config_bulk_set_dbs() - Provision many VFs with GuC context IDs.
+ * @gt: the &xe_gt
+ * @vfid: starting VF identifier (can't be 0)
+ * @num_vfs: number of VFs to provision
+ * @num_dbs: requested number of GuC doorbell IDs (0 to release)
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid,
+				       unsigned int num_vfs, u32 num_dbs)
+{
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return xe_gt_sriov_pf_config_bulk_set_dbs_locked(gt, vfid, num_vfs, num_dbs);
+}
+
 static u32 pf_profile_fair_dbs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
@@ -1480,10 +1498,9 @@ int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid,
 	xe_gt_assert(gt, vfid);
 	xe_gt_assert(gt, num_vfs);
 
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
 	fair = pf_estimate_fair_dbs(gt, num_vfs);
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
-
 	if (!fair)
 		return -ENOSPC;
 
@@ -1492,7 +1509,7 @@ int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid,
 		xe_gt_sriov_info(gt, "Using non-profile provisioning (%s %u vs %u)\n",
 				 "GuC doorbell IDs", fair, profile);
 
-	return xe_gt_sriov_pf_config_bulk_set_dbs(gt, vfid, num_vfs, fair);
+	return xe_gt_sriov_pf_config_bulk_set_dbs_locked(gt, vfid, num_vfs, fair);
 }
 
 static u64 pf_get_lmem_alignment(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index a14ca7bf7e4d..a56e63f3660a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -34,6 +34,8 @@ int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_d
 int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
 				       u32 num_dbs);
+int xe_gt_sriov_pf_config_bulk_set_dbs_locked(struct xe_gt *gt, unsigned int vfid,
+					      unsigned int num_vfs, u32 num_dbs);
 
 u64 xe_gt_sriov_pf_config_get_lmem(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size);
-- 
2.47.1

