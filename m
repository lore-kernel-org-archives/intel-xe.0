Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4FCC0218C
	for <intel-xe@archiver.kernel.org>; Sat, 25 Jan 2025 21:55:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9A010E029;
	Sat, 25 Jan 2025 21:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lu8ealcO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456F610E029
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Jan 2025 21:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737842121; x=1769378121;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qU4giWMcmN3t09XIVRpC+T/cbJjJyjRbwhQSv5+T9Cs=;
 b=lu8ealcOpu7I1rRRKBXdc3thUa/GaK7nXA+bT3cH85flqQfbQc1cUV1a
 IrL0/dj5WuCdN776g+JZvc7g3PrS/iB+RF+h71xrON7sot8nd9qHHGMXh
 7Nzu6PZvqfcCkbMYrBNCjHalKIEGPFUkJzmhup7GcbjW6cV8L9C2EQdVl
 i8QDNuatUhSkyG0e78zzEvJHmhSLSrpSnRxpGdnc3wzbiEJ2JkiAev63l
 nKgccu5xDkX+R0PUr+HOi4N5xxUBhLsHd9yECFBhAZ9OOT0o3DMerY2SB
 Soxh9S083MA2iIoznGpTdwnzsJr6998CODi+6FxvqEi0rrXU387KUk9BL g==;
X-CSE-ConnectionGUID: 908NKyxWTe+urpx/q2S9PA==
X-CSE-MsgGUID: kL9Rvip7QeqedFXhNsfibQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="37604198"
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; d="scan'208";a="37604198"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2025 13:55:20 -0800
X-CSE-ConnectionGUID: OPK0p5jCRKSxWXhBZdLeVw==
X-CSE-MsgGUID: JuxmZXcGRGqiz6McMu9BcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; d="scan'208";a="113083215"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.113.167])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2025 13:55:19 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/pf: Move VFs reprovisioning to worker
Date: Sat, 25 Jan 2025 22:55:05 +0100
Message-Id: <20250125215505.720-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Since the GuC is reset during GT reset, we need to re-send the
entire SR-IOV provisioning configuration to the GuC. But since
this whole configuration is protected by the PF master mutex and
we can't avoid making allocations under this mutex (like during
LMEM provisioning), we can't do this reprovisioning from gt-reset
path if we want to be reclaim-safe. Move VFs reprovisioning to a
async worker that we will start from the gt-reset path.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c       | 53 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h | 10 +++++
 2 files changed, 56 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index 6f906c8e8108..d66478deab98 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -15,7 +15,11 @@
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
 #include "xe_gt_sriov_pf_service.h"
+#include "xe_gt_sriov_printk.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
+
+static void pf_worker_restart_func(struct work_struct *w);
 
 /*
  * VF's metadata is maintained in the flexible array where:
@@ -41,6 +45,11 @@ static int pf_alloc_metadata(struct xe_gt *gt)
 	return 0;
 }
 
+static void pf_init_workers(struct xe_gt *gt)
+{
+	INIT_WORK(&gt->sriov.pf.workers.restart, pf_worker_restart_func);
+}
+
 /**
  * xe_gt_sriov_pf_init_early - Prepare SR-IOV PF data structures on PF.
  * @gt: the &xe_gt to initialize
@@ -65,6 +74,8 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	pf_init_workers(gt);
+
 	return 0;
 }
 
@@ -155,14 +166,42 @@ void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid)
 	pf_clear_vf_scratch_regs(gt, vfid);
 }
 
-/**
- * xe_gt_sriov_pf_restart - Restart SR-IOV support after a GT reset.
- * @gt: the &xe_gt
- *
- * This function can only be called on PF.
- */
-void xe_gt_sriov_pf_restart(struct xe_gt *gt)
+static void pf_restart(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+
+	xe_pm_runtime_get(xe);
 	xe_gt_sriov_pf_config_restart(gt);
 	xe_gt_sriov_pf_control_restart(gt);
+	xe_pm_runtime_put(xe);
+
+	xe_gt_sriov_dbg(gt, "restart completed\n");
+}
+
+static void pf_worker_restart_func(struct work_struct *w)
+{
+	struct xe_gt *gt = container_of(w, typeof(*gt), sriov.pf.workers.restart);
+
+	pf_restart(gt);
+}
+
+static void pf_queue_restart(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	xe_gt_assert(gt, IS_SRIOV_PF(xe));
+
+	if (!queue_work(xe->sriov.wq, &gt->sriov.pf.workers.restart))
+		xe_gt_sriov_dbg(gt, "restart already in queue!\n");
+}
+
+/**
+ * xe_gt_sriov_pf_restart - Restart SR-IOV support after a GT reset.
+ * @gt: the &xe_gt
+ *
+ * This function can only be called on PF.
+ */
+void xe_gt_sriov_pf_restart(struct xe_gt *gt)
+{
+	pf_queue_restart(gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
index 0426b1a77069..a64a6835ad65 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
@@ -35,8 +35,17 @@ struct xe_gt_sriov_metadata {
 	struct xe_gt_sriov_state_snapshot snapshot;
 };
 
+/**
+ * struct xe_gt_sriov_pf_workers - GT level workers used by the PF.
+ */
+struct xe_gt_sriov_pf_workers {
+	/** @restart: worker that executes actions post GT reset */
+	struct work_struct restart;
+};
+
 /**
  * struct xe_gt_sriov_pf - GT level PF virtualization data.
+ * @workers: workers data.
  * @service: service data.
  * @control: control data.
  * @policy: policy data.
@@ -45,6 +54,7 @@ struct xe_gt_sriov_metadata {
  * @vfs: metadata for all VFs.
  */
 struct xe_gt_sriov_pf {
+	struct xe_gt_sriov_pf_workers workers;
 	struct xe_gt_sriov_pf_service service;
 	struct xe_gt_sriov_pf_control control;
 	struct xe_gt_sriov_pf_policy policy;
-- 
2.47.1

