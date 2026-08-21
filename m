Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AABC5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 11:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC32E10E27E;
	Fri, 21 Aug 2026 11:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XinH6Vaa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A24110E27E
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 11:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787311525; x=1818847525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z9ecT5mRLquMIoTDRzLt4VST0aum3x8fgM4zg3sINOM=;
 b=XinH6VaaUpdzSJDFkTFWr15c6goWjdasrasr0dHlqGdvuAWJNZGLFryY
 /BNh5h2fL/+MKNlG+MI0S/kwpcCuwuXgf741SXWttQPZrLRYuavlE1YJH
 ylm0tDLdTXXTH0mnzuxtxDOImGryeOE7YZD0AyiECWYzM1NRwNahu8haT
 TM/wrUruhpoc6fFz0/LCfmEBLQvjKDCl2RMiaQcNpBCL1vjpNML6QzysD
 lBmcipvaQxezBrpIzX5TqvAqKw7ktZ2iv4iy9LJ47eGEDSaYD4EnLB9n/
 saAiTPIix2/W9s6mwzhqSa1RIxz5VdAB0Rr3M9aeYIhf2LsQHNzSTWIfL g==;
X-CSE-ConnectionGUID: n8oYei0oSoKtcuLJg0jI/A==
X-CSE-MsgGUID: yGw8jhgOSWOP75KOs8PvHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="90377529"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="90377529"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 04:25:25 -0700
X-CSE-ConnectionGUID: XlzVz1SrSB2/o2FZ65OGTA==
X-CSE-MsgGUID: iCakpCYRTU2OHFN6ikT84A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="304523402"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 21 Aug 2026 04:25:21 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, lukas@wunner.de,
 daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v10 03/10] drm/xe/gt: Introduce FLR helpers
Date: Fri, 21 Aug 2026 16:53:25 +0530
Message-ID: <20260821112436.545405-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821112436.545405-1-raag.jadav@intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
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

In preparation of usecases which require preparing/re-initializing GT and
all its uCs before/after PCIe FLR, introduce flr_prepare/reinit() helpers.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
v2: Add kernel doc (Matthew Brost)
v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)
v6: Add IS_DGFX() assert (Daniele)
    s/flr_done/reinit (Daniele)
---
 drivers/gpu/drm/xe/xe_gsc.c      | 14 ++++++
 drivers/gpu/drm/xe/xe_gsc.h      |  1 +
 drivers/gpu/drm/xe/xe_gt.c       | 23 ++++++++++
 drivers/gpu/drm/xe/xe_gt.h       |  2 +
 drivers/gpu/drm/xe/xe_guc.c      | 29 +++++++++++++
 drivers/gpu/drm/xe/xe_guc.h      |  2 +
 drivers/gpu/drm/xe/xe_huc.c      | 14 ++++++
 drivers/gpu/drm/xe/xe_huc.h      |  1 +
 drivers/gpu/drm/xe/xe_uc.c       | 73 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_uc.h       |  2 +
 drivers/gpu/drm/xe/xe_uc_types.h | 14 ++++++
 11 files changed, 175 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 524ac56bdcc7..475e44455c9e 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -548,6 +548,20 @@ void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc)
 		flush_work(&gsc->work);
 }
 
+/**
+ * xe_gsc_reinit() - Re-initialize GSC after FLR
+ * @gsc: The GSC object
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_gsc_reinit(struct xe_gsc *gsc)
+{
+	if (!xe_uc_fw_is_loadable(&gsc->fw))
+		return 0;
+
+	return xe_uc_fw_reinit(&gsc->fw);
+}
+
 void xe_gsc_stop_prepare(struct xe_gsc *gsc)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
index b8b8e0810ad9..ce390bffb163 100644
--- a/drivers/gpu/drm/xe/xe_gsc.h
+++ b/drivers/gpu/drm/xe/xe_gsc.h
@@ -15,6 +15,7 @@ struct xe_hw_engine;
 
 int xe_gsc_init(struct xe_gsc *gsc);
 int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);
+int xe_gsc_reinit(struct xe_gsc *gsc);
 void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);
 void xe_gsc_stop_prepare(struct xe_gsc *gsc);
 void xe_gsc_load_start(struct xe_gsc *gsc);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 6805e0d3bf21..d4fac8c4d8a4 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -910,6 +910,29 @@ static int do_gt_restart(struct xe_gt *gt)
 	return 0;
 }
 
+/**
+ * xe_gt_flr_prepare() - Prepare GT for FLR
+ * @gt: the GT object
+ *
+ * Prepare all GT uCs for FLR.
+ */
+void xe_gt_flr_prepare(struct xe_gt *gt)
+{
+	xe_gt_sanitize(gt);
+	xe_uc_flr_prepare(&gt->uc);
+}
+
+/**
+ * xe_gt_reinit() - Re-initialize GT after FLR
+ * @gt: the GT object
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_gt_reinit(struct xe_gt *gt)
+{
+	return xe_uc_reinit(&gt->uc);
+}
+
 static void gt_reset_worker(struct work_struct *w)
 {
 	struct xe_gt *gt = container_of(w, typeof(*gt), reset.worker);
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 65a4655b0994..1e56355318c9 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -37,8 +37,10 @@
 })
 
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
+void xe_gt_flr_prepare(struct xe_gt *gt);
 int xe_gt_init_early(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
+int xe_gt_reinit(struct xe_gt *gt);
 void xe_gt_mmio_init(struct xe_gt *gt);
 void xe_gt_declare_wedged(struct xe_gt *gt);
 int xe_gt_record_default_lrcs(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index c7f8bbd4cb92..ffe7f0847e76 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1709,6 +1709,35 @@ void xe_guc_sanitize(struct xe_guc *guc)
 	xe_guc_submit_disable(guc);
 }
 
+/**
+ * xe_guc_flr_prepare() - Prepare GuC for FLR
+ * @guc: The GuC object
+ *
+ * Stop GuC submission and tear down exec queues.
+ */
+void xe_guc_flr_prepare(struct xe_guc *guc)
+{
+	if (!xe_uc_fw_is_loadable(&guc->fw))
+		return;
+
+	xe_guc_submit_stop(guc);
+	xe_guc_submit_pause_abort(guc);
+}
+
+/**
+ * xe_guc_reinit() - Re-initialize GuC after FLR
+ * @guc: The GuC object
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_guc_reinit(struct xe_guc *guc)
+{
+	if (!xe_uc_fw_is_loadable(&guc->fw))
+		return 0;
+
+	return xe_uc_fw_reinit(&guc->fw);
+}
+
 int xe_guc_reset_prepare(struct xe_guc *guc)
 {
 	return xe_guc_submit_reset_prepare(guc);
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 61e3ee19a59b..e0226cc28046 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -32,10 +32,12 @@
 struct drm_printer;
 
 void xe_guc_comm_init_early(struct xe_guc *guc);
+void xe_guc_flr_prepare(struct xe_guc *guc);
 int xe_guc_init_noalloc(struct xe_guc *guc);
 int xe_guc_init(struct xe_guc *guc);
 int xe_guc_init_post_hwconfig(struct xe_guc *guc);
 int xe_guc_post_load_init(struct xe_guc *guc);
+int xe_guc_reinit(struct xe_guc *guc);
 int xe_guc_reset(struct xe_guc *guc);
 int xe_guc_upload(struct xe_guc *guc);
 int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 57afe21444b1..c73e1acbd091 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -296,6 +296,20 @@ void xe_huc_sanitize(struct xe_huc *huc)
 	xe_uc_fw_sanitize(&huc->fw);
 }
 
+/**
+ * xe_huc_reinit() - Re-initialize HuC after FLR
+ * @huc: The HuC object
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_huc_reinit(struct xe_huc *huc)
+{
+	if (!xe_uc_fw_is_loadable(&huc->fw))
+		return 0;
+
+	return xe_uc_fw_reinit(&huc->fw);
+}
+
 void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
 {
 	struct xe_gt *gt = huc_to_gt(huc);
diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
index fa1c45e70443..cb1a770b4a9c 100644
--- a/drivers/gpu/drm/xe/xe_huc.h
+++ b/drivers/gpu/drm/xe/xe_huc.h
@@ -19,6 +19,7 @@ enum xe_huc_auth_types {
 
 int xe_huc_init(struct xe_huc *huc);
 int xe_huc_init_post_hwconfig(struct xe_huc *huc);
+int xe_huc_reinit(struct xe_huc *huc);
 int xe_huc_upload(struct xe_huc *huc);
 int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type);
 bool xe_huc_is_authenticated(struct xe_huc *huc, enum xe_huc_auth_types type);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 65f59f06177f..4b9b5ea4fb08 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -18,6 +18,7 @@
 #include "xe_guc_submit.h"
 #include "xe_huc.h"
 #include "xe_sriov.h"
+#include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
 static struct xe_gt *
@@ -278,6 +279,78 @@ static void uc_reset_wait(struct xe_uc *uc)
 		goto again;
 }
 
+static void uc_flr_prepare(struct work_struct *w)
+{
+	struct xe_uc_flr *flr = container_of(w, struct xe_uc_flr, work);
+	struct xe_uc *uc = flr->uc;
+
+	xe_gt_assert(uc_to_gt(uc), xe_device_wedged(uc_to_xe(uc)));
+
+	xe_uc_reset_prepare(uc);
+	xe_guc_flr_prepare(&uc->guc);
+}
+
+static void uc_flr_sanitize(struct work_struct *w)
+{
+	struct xe_uc_flr *flr = container_of(w, struct xe_uc_flr, work);
+	struct xe_uc *uc = flr->uc;
+
+	/* TODO: Sanitize GSC firmware */
+	xe_gt_assert(uc_to_gt(uc), IS_DGFX(uc_to_xe(uc)));
+	xe_gt_assert(uc_to_gt(uc), !xe_uc_fw_is_loadable(&uc->gsc.fw));
+
+	xe_uc_stop(uc);
+	xe_uc_sanitize(uc);
+}
+
+/**
+ * xe_uc_flr_prepare() - Prepare uCs for FLR
+ * @uc: The uC object
+ *
+ * Tear down pending work and stop all uCs.
+ */
+void xe_uc_flr_prepare(struct xe_uc *uc)
+{
+	struct xe_uc_flr flr = { .uc = uc };
+	struct xe_gt *gt = uc_to_gt(uc);
+
+	/*
+	 * We'll be tearing down exec queues which signals all fences and frees the
+	 * jobs but all of that happens asynchronously, so make sure we don't disrupt
+	 * the scheduler while jobs are still in-flight.
+	 */
+	INIT_WORK_ONSTACK(&flr.work, uc_flr_prepare);
+	queue_work(gt->ordered_wq, &flr.work);
+	flush_work(&flr.work);
+	destroy_work_on_stack(&flr.work);
+
+	INIT_WORK_ONSTACK(&flr.work, uc_flr_sanitize);
+	queue_work(gt->ordered_wq, &flr.work);
+	flush_work(&flr.work);
+	destroy_work_on_stack(&flr.work);
+}
+
+/**
+ * xe_uc_reinit() - Re-initialize uCs after FLR
+ * @uc: The uC object
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_uc_reinit(struct xe_uc *uc)
+{
+	int ret;
+
+	ret = xe_guc_reinit(&uc->guc);
+	if (ret)
+		return ret;
+
+	ret = xe_huc_reinit(&uc->huc);
+	if (ret)
+		return ret;
+
+	return xe_gsc_reinit(&uc->gsc);
+}
+
 void xe_uc_suspend_prepare(struct xe_uc *uc)
 {
 	xe_gsc_wait_for_worker_completion(&uc->gsc);
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 255a54a8f876..e06f7937111f 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -8,10 +8,12 @@
 
 struct xe_uc;
 
+void xe_uc_flr_prepare(struct xe_uc *uc);
 int xe_uc_init_noalloc(struct xe_uc *uc);
 int xe_uc_init(struct xe_uc *uc);
 int xe_uc_init_post_hwconfig(struct xe_uc *uc);
 int xe_uc_load_hw(struct xe_uc *uc);
+int xe_uc_reinit(struct xe_uc *uc);
 int xe_uc_reset_prepare(struct xe_uc *uc);
 void xe_uc_runtime_resume(struct xe_uc *uc);
 void xe_uc_runtime_suspend(struct xe_uc *uc);
diff --git a/drivers/gpu/drm/xe/xe_uc_types.h b/drivers/gpu/drm/xe/xe_uc_types.h
index 1708379dc834..2b47382f7b3b 100644
--- a/drivers/gpu/drm/xe/xe_uc_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_types.h
@@ -25,4 +25,18 @@ struct xe_uc {
 	struct xe_wopcm wopcm;
 };
 
+/**
+ * struct xe_uc_flr - uC FLR teardown
+ */
+struct xe_uc_flr {
+	/** @uc: uC to schedule FLR worker on */
+	struct xe_uc *uc;
+
+	/**
+	 * @work: worker for FLR teardown to be done async allowing to safely
+	 * flush all code paths
+	 */
+	struct work_struct work;
+};
+
 #endif
-- 
2.43.0

