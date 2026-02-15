Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9D1E63F14
	for <intel-xe@archiver.kernel.org>; Sun, 15 Feb 2026 20:33:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4C710E00C;
	Sun, 15 Feb 2026 20:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aTt/sNsl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BAC410E00C
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Feb 2026 20:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771187620; x=1802723620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F4p6xdQTKjrl9PW5tkJtjOKEYWI2KY9mg4Pi2xmyxWI=;
 b=aTt/sNslciLIIqndQXR9LM3LQmde8FbDBHOZf0LkORbnf1ZsWmsfYVHk
 pNau4H53fzjyb5C2tijg6Wtj+OicHInbxEi5OghjMuFHwevOJjRto3d/S
 RyInsTgmPmkN7ROrzQtMYEpB0fRgKVfbfPexRmsJeN/v3h3mhWHGhihCq
 5eSSOiiBAm3yddOJvo8eu6kdqyggSgolSmgKM5alyTtWoMvqDBgiskgJM
 kM9oqIgx2PE/8nsNChHJj0yORmSW98VOqqxxvDSMRez+IgpZfivX5IOsg
 O6yow3in/RU0ft/4lLnVNpoKCisOKL5bs5t5dgnjcjuQ1UKWaI6NSB2x+ w==;
X-CSE-ConnectionGUID: QZDV4DafSzC4nJKI8OOzrw==
X-CSE-MsgGUID: AoY1RFLzThKXjuF6uPJA4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71996387"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="71996387"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 12:33:40 -0800
X-CSE-ConnectionGUID: q0tzY78gSZmBrD1jOrLG4w==
X-CSE-MsgGUID: z3CUXgPoQ1y6TeqNyu/COg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="251096588"
Received: from shealy-mobl3.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.64.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 12:33:40 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/9] drm/xe/pf: Add locked variants of VRAM configuration
 functions
Date: Sun, 15 Feb 2026 21:33:15 +0100
Message-ID: <20260215203323.595-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260215203323.595-1-michal.wajdeczko@intel.com>
References: <20260215203323.595-1-michal.wajdeczko@intel.com>
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

We already have few functions to configure LMEM (aka VRAM) but they
all are taking master mutex. Split them and expose locked variants
to allow use by the caller who already hold this mutex.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 77 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  4 ++
 2 files changed, 74 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 23601ce79348..23af49dc1bfa 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1754,7 +1754,7 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
 }
 
 /**
- * xe_gt_sriov_pf_config_bulk_set_lmem - Provision many VFs with LMEM.
+ * xe_gt_sriov_pf_config_bulk_set_lmem_locked() - Provision many VFs with LMEM.
  * @gt: the &xe_gt (can't be media)
  * @vfid: starting VF identifier (can't be 0)
  * @num_vfs: number of VFs to provision
@@ -1764,31 +1764,94 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid,
-					unsigned int num_vfs, u64 size)
+int xe_gt_sriov_pf_config_bulk_set_lmem_locked(struct xe_gt *gt, unsigned int vfid,
+					       unsigned int num_vfs, u64 size)
 {
 	unsigned int n;
 	int err = 0;
 
-	xe_gt_assert(gt, vfid);
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+	xe_gt_assert(gt, xe_device_has_lmtt(gt_to_xe(gt)));
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	xe_gt_assert(gt, xe_gt_is_main_type(gt));
+	xe_gt_assert(gt, vfid);
 
 	if (!num_vfs)
 		return 0;
 
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 	for (n = vfid; n < vfid + num_vfs; n++) {
 		err = pf_provision_vf_lmem(gt, n, size);
 		if (err)
 			break;
 	}
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
 	return pf_config_bulk_set_u64_done(gt, vfid, num_vfs, size,
-					   xe_gt_sriov_pf_config_get_lmem,
+					   pf_get_vf_config_lmem,
 					   "LMEM", n, err);
 }
 
+/**
+ * xe_gt_sriov_pf_config_bulk_set_lmem() - Provision many VFs with LMEM.
+ * @gt: the &xe_gt (can't be media)
+ * @vfid: starting VF identifier (can't be 0)
+ * @num_vfs: number of VFs to provision
+ * @size: requested LMEM size
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid,
+					unsigned int num_vfs, u64 size)
+{
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return xe_gt_sriov_pf_config_bulk_set_lmem_locked(gt, vfid, num_vfs, size);
+}
+
+/**
+ * xe_gt_sriov_pf_config_get_lmem_locked() - Get VF's LMEM quota.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0 == PFID)
+ *
+ * This function can only be called on PF.
+ *
+ * Return: VF's LMEM quota.
+ */
+u64 xe_gt_sriov_pf_config_get_lmem_locked(struct xe_gt *gt, unsigned int vfid)
+{
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid);
+
+	return pf_get_vf_config_lmem(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_config_set_lmem_locked() - Provision VF with LMEM.
+ * @gt: the &xe_gt (can't be media)
+ * @vfid: the VF identifier (can't be 0 == PFID)
+ * @size: requested LMEM size
+ *
+ * This function can only be called on PF.
+ */
+int xe_gt_sriov_pf_config_set_lmem_locked(struct xe_gt *gt, unsigned int vfid, u64 size)
+{
+	int err;
+
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+	xe_gt_assert(gt, xe_device_has_lmtt(gt_to_xe(gt)));
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, xe_gt_is_main_type(gt));
+	xe_gt_assert(gt, vfid);
+
+	err = pf_provision_vf_lmem(gt, vfid, size);
+
+	return pf_config_set_u64_done(gt, vfid, size,
+				      pf_get_vf_config_lmem(gt, vfid),
+				      "LMEM", err);
+}
+
 static struct xe_bo *pf_get_vf_config_lmem_obj(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 3c6c8b6655af..4a004ecd6140 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -36,6 +36,10 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
 int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
 					u64 size);
+u64 xe_gt_sriov_pf_config_get_lmem_locked(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_config_set_lmem_locked(struct xe_gt *gt, unsigned int vfid, u64 size);
+int xe_gt_sriov_pf_config_bulk_set_lmem_locked(struct xe_gt *gt, unsigned int vfid,
+					       unsigned int num_vfs, u64 size);
 struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid);
 
 u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid);
-- 
2.47.1

