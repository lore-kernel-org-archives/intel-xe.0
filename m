Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD93CCA471
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 23:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A11210E642;
	Tue, 30 Sep 2025 23:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hj4MKEEw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B8E10E2E4
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 23:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759275343; x=1790811343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K0skx8vVbazqssDo0JXbG3pEA7A+IFYd8a7YOOuRxGU=;
 b=Hj4MKEEwatgmxC44uzBMOz3KSIYaLYSw+bNAwYC7ufKNA6YzyTR/c9EQ
 u4N5A4BDayZjLpMWsQp6qG09ptyv8Le7vFM33QqDowEfFFiRru2H+zKL3
 1WCW4AivIJLoapWVcAyOK39WSPXBb5pzqiiaspAxCnTCuTackHKifNYkA
 +Np5GQPos6mdmU5LLPpIm8zAzUpGTQvhhHO8/jmDib5CkdV7/xZpuzAE0
 2NUvT9a5rQQhAUAA5cYlEsh+zkjy41QjBZ0NPMcOGdMIYQz46iS9Cvfs7
 D/hTlgEejQkTP3SaZeI0Zw7e2uYlA/j0/bBoOmzCkl3zPZxe5rkBliUf9 Q==;
X-CSE-ConnectionGUID: glnujEZDTZqMOBykbE3Pcg==
X-CSE-MsgGUID: 0oTBBj8UTGG/cqFpOcGFUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72646742"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="72646742"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 16:35:42 -0700
X-CSE-ConnectionGUID: 2cUagR0/R4aXQ7feH1USMg==
X-CSE-MsgGUID: gP1JK8qXRne9xN7ibD/L8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="177775528"
Received: from krychlik-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.173])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 16:35:42 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 6/6] drm/xe/pf: Synchronize VF FLR between all GTs
Date: Wed,  1 Oct 2025 01:35:24 +0200
Message-ID: <20250930233525.201263-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930233525.201263-1-michal.wajdeczko@intel.com>
References: <20250930233525.201263-1-michal.wajdeczko@intel.com>
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

The PF part of the VF FLR processing shall be done after all GuCs
confirm that they finished their part VF FLR processing, otherwise
PF may start clearing VF's GGTT that other GuC may still accessing.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 56 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |  1 +
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  2 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      | 29 ++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h      |  1 +
 5 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 491918d6b93b..2e6bd3d1fe1d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -18,6 +18,7 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_tile.h"
 
@@ -170,6 +171,7 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(FLR_SEND_START);
 	CASE2STR(FLR_WAIT_GUC);
 	CASE2STR(FLR_GUC_DONE);
+	CASE2STR(FLR_SYNC);
 	CASE2STR(FLR_RESET_CONFIG);
 	CASE2STR(FLR_RESET_DATA);
 	CASE2STR(FLR_RESET_MMIO);
@@ -940,6 +942,10 @@ int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid)
  *	:        v                                      :        |           |
  *	:       FLR_GUC_DONE                            :        |           |
  *	:        |                                      :        |           |
+ *	:        | o--<--sync                           :        |           |
+ *	:        |/        /                            :        |           |
+ *	:       FLR_SYNC--o                             :        |           |
+ *	:        |                                      :        |           |
  *	:       FLR_RESET_CONFIG---failed--->-----------o--------+-----------o
  *	:        |                                      :        |           |
  *	:       FLR_RESET_DATA                          :        |           |
@@ -1147,12 +1153,38 @@ static bool pf_exit_vf_flr_send_start(struct xe_gt *gt, unsigned int vfid)
 	return true;
 }
 
+static bool pf_exit_vf_flr_sync(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SYNC))
+		return false;
+
+	pf_enter_vf_flr_reset_config(gt, vfid);
+	return true;
+}
+
+static void pf_enter_vf_flr_sync(struct xe_gt *gt, unsigned int vfid)
+{
+	int ret;
+
+	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SYNC))
+		pf_enter_vf_state_machine_bug(gt, vfid);
+
+	ret = xe_sriov_pf_control_sync_flr(gt_to_xe(gt), vfid);
+	if (ret < 0) {
+		xe_gt_sriov_dbg_verbose(gt, "FLR checkpoint %pe\n", ERR_PTR(ret));
+		pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SYNC);
+	} else {
+		xe_gt_sriov_dbg_verbose(gt, "FLR checkpoint pass\n");
+		pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SYNC);
+	}
+}
+
 static bool pf_exit_vf_flr_guc_done(struct xe_gt *gt, unsigned int vfid)
 {
 	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_GUC_DONE))
 		return false;
 
-	pf_enter_vf_flr_reset_config(gt, vfid);
+	pf_enter_vf_flr_sync(gt, vfid);
 	return true;
 }
 
@@ -1178,6 +1210,28 @@ int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid)
 	return 0;
 }
 
+/**
+ * xe_gt_sriov_pf_control_sync_flr() - Synchronize on the VF FLR checkpoint.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @sync: if true it will allow to exit the checkpoint
+ *
+ * Return: non-zero if FLR checkpoint has been reached, zero if the is no FLR
+ *         in progress, or a negative error code on the FLR busy or failed.
+ */
+int xe_gt_sriov_pf_control_sync_flr(struct xe_gt *gt, unsigned int vfid, bool sync)
+{
+	if (sync && pf_exit_vf_flr_sync(gt, vfid))
+		return 1;
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SYNC))
+		return 1;
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WIP))
+		return -EBUSY;
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED))
+		return -EIO;
+	return 0;
+}
+
 /**
  * xe_gt_sriov_pf_control_wait_flr() - Wait for a VF FLR to complete.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
index fd256866f628..8a72ef3778d4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
@@ -18,6 +18,7 @@ int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_sync_flr(struct xe_gt *gt, unsigned int vfid, bool sync);
 int xe_gt_sriov_pf_control_wait_flr(struct xe_gt *gt, unsigned int vfid);
 
 #ifdef CONFIG_PCI_IOV
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index f02f941b4ad2..c80b7e77f1ad 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -18,6 +18,7 @@
  * @XE_GT_SRIOV_STATE_FLR_SEND_START: indicates that the PF wants to send a FLR START command.
  * @XE_GT_SRIOV_STATE_FLR_WAIT_GUC: indicates that the PF awaits for a response from the GuC.
  * @XE_GT_SRIOV_STATE_FLR_GUC_DONE: indicates that the PF has received a response from the GuC.
+ * @XE_GT_SRIOV_STATE_FLR_SYNC: indicates that the PF awaits to synchronize with other GuCs.
  * @XE_GT_SRIOV_STATE_FLR_RESET_CONFIG: indicates that the PF needs to clear VF's resources.
  * @XE_GT_SRIOV_STATE_FLR_RESET_DATA: indicates that the PF needs to clear VF's data.
  * @XE_GT_SRIOV_STATE_FLR_RESET_MMIO: indicates that the PF needs to reset VF's registers.
@@ -47,6 +48,7 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_FLR_SEND_START,
 	XE_GT_SRIOV_STATE_FLR_WAIT_GUC,
 	XE_GT_SRIOV_STATE_FLR_GUC_DONE,
+	XE_GT_SRIOV_STATE_FLR_SYNC,
 	XE_GT_SRIOV_STATE_FLR_RESET_CONFIG,
 	XE_GT_SRIOV_STATE_FLR_RESET_DATA,
 	XE_GT_SRIOV_STATE_FLR_RESET_MMIO,
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index e1c54a8feb07..416d00a03fbb 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -120,3 +120,32 @@ int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid)
 
 	return result;
 }
+
+/**
+ * xe_sriov_pf_control_sync_flr() - Synchronize a VF FLR between all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_sync_flr(gt, vfid, false);
+		if (ret < 0)
+			return ret;
+	}
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_sync_flr(gt, vfid, true);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
index 9bf059f746d4..2d52d0ac1b28 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
@@ -12,5 +12,6 @@ int xe_sriov_pf_control_pause_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid);
 
 #endif
-- 
2.47.1

