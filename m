Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3D7C5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 16:48:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B173010E308;
	Fri,  7 Aug 2026 16:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YsbLgtns";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825BD10E308
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 16:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786121319; x=1817657319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s0X4ULCR8fSZSr9PaQXTHJnSF0Xo+VEonDih4Z1RaVA=;
 b=YsbLgtnsupNPBmQPXinrQa0a1uA6avGdKnaEj6J3PqxK6qIDzafxdNoa
 WLj+XwI1YKAQsEZJZe2q8T7GsM7kW2zXPRMw8HCibebHJT6wXs+pyJuPP
 M9HwmrdEe/FvBs1lBcx6bY32ZA+Pmb9fD32enMhdJ0w8qHkmoNByXAoPR
 H5zuJAHX4SPBrLlbbp5pxM3ohWG4AbASdK9qI/i1FiL/sNLq5jtyQx18R
 hz5z+xUYunJWlbxIT/EPqYtQA5E3aY9OCK8C+1l/1x+E+PQXhhclBtizz
 7I/J6wX0TD2342DE3bnLWFMZw8NC55dVp1dciDamiOuUYp2a7+aGSsWrm g==;
X-CSE-ConnectionGUID: UrInWdk9S8u45uXrbier/Q==
X-CSE-MsgGUID: PgWe9v4HQgqT3hyYlaqrbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86608387"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86608387"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 09:48:38 -0700
X-CSE-ConnectionGUID: oZTYjD0JTWeT0owIvSrkTA==
X-CSE-MsgGUID: ylSAt9oSSOukcGnv57gsFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="256213016"
Received: from ciaramcd-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.36])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 09:48:36 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 3/3] drm/xe/pf: Add _locked variant of the doorbells bulk
 config function
Date: Fri,  7 Aug 2026 18:48:26 +0200
Message-ID: <20260807164826.5650-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805154733.604-4-michal.wajdeczko@intel.com>
References: <20260805154733.604-4-michal.wajdeczko@intel.com>
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
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
v2: fix kernel-doc (Satya)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 37 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 ++
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 4976d8c018ce..be0a413ee17c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1397,7 +1397,7 @@ int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_d
 }
 
 /**
- * xe_gt_sriov_pf_config_bulk_set_dbs - Provision many VFs with GuC context IDs.
+ * xe_gt_sriov_pf_config_bulk_set_dbs_locked() - Provision many VFs with GuC doorbells.
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
+ * xe_gt_sriov_pf_config_bulk_set_dbs() - Provision many VFs with GuC doorbells.
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

