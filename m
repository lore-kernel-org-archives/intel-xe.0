Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B80410F286F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 20:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D838B10ED77;
	Fri, 27 Mar 2026 20:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPuRqpb5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1C210ED77
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 20:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774643992; x=1806179992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XdyiKq1SXMFTqr/xS2ECT3grH9GcdyJxWFG34tMKlag=;
 b=fPuRqpb5+ic5GG6wqSPdb4kxXSbdfg7TZhRjlAq0LsPqWkjhYJ/S2KB3
 tUUSmHe51Ki8lNCYgvUIdiUDt+OLm/RB8G32eQtUVF9MRq68rak5jF3VI
 IqzrFE6QcqYsRjvkSRwcHLpHLgUWyH6Wv/Pv3ENgnxVxEQvTk24zjr2Rt
 MjjtFyWABjUz9DZ6DyMn/GiC/Vp65oh69KgMSsuFuzhNpPUhL3F4TYF2U
 F8gqqpqyOHvydW66Vh8O+OARYUdxieb7k3q65N57cCV7aNH5wGaBuRGq3
 BPVi1CnrfUBJTMoO2DwO7ycL0BasNp+tGcfch1Xh3INTo/+rtMQA6x/va w==;
X-CSE-ConnectionGUID: k+8KEDj4RX2ftIf8xdCHyA==
X-CSE-MsgGUID: IitmDb2zQBmbCjKy6AKQIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="93110329"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="93110329"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 13:39:52 -0700
X-CSE-ConnectionGUID: na/L+st4RQe8wfoCxkymiA==
X-CSE-MsgGUID: biHySchwQU6UKrqsEcAvaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="218794350"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 27 Mar 2026 13:39:48 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 3/9] drm/xe/gt: Introduce FLR helpers
Date: Sat, 28 Mar 2026 02:06:14 +0530
Message-ID: <20260327203620.809353-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327203620.809353-1-raag.jadav@intel.com>
References: <20260327203620.809353-1-raag.jadav@intel.com>
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
all its uCs before/after PCIe FLR, introduce flr_prepare/done() helpers.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Add kernel doc (Matthew Brost)
v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)
---
 drivers/gpu/drm/xe/xe_gsc.c      | 14 ++++++++++++
 drivers/gpu/drm/xe/xe_gsc.h      |  1 +
 drivers/gpu/drm/xe/xe_gt.c       | 37 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h       |  2 ++
 drivers/gpu/drm/xe/xe_gt_types.h |  9 ++++++++
 drivers/gpu/drm/xe/xe_guc.c      | 36 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h      |  2 ++
 drivers/gpu/drm/xe/xe_huc.c      | 14 ++++++++++++
 drivers/gpu/drm/xe/xe_huc.h      |  1 +
 drivers/gpu/drm/xe/xe_uc.c       | 37 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_uc.h       |  2 ++
 11 files changed, 155 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index e5c234f3d795..7bf6a90ea1a2 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -552,6 +552,20 @@ void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc)
 		flush_work(&gsc->work);
 }
 
+/**
+ * xe_gsc_flr_done() - Re-initialize GSC after FLR
+ * @gsc: The GSC object
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_gsc_flr_done(struct xe_gsc *gsc)
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
index b8b8e0810ad9..8b7fd98f0be6 100644
--- a/drivers/gpu/drm/xe/xe_gsc.h
+++ b/drivers/gpu/drm/xe/xe_gsc.h
@@ -13,6 +13,7 @@ struct xe_gsc;
 struct xe_gt;
 struct xe_hw_engine;
 
+int xe_gsc_flr_done(struct xe_gsc *gsc);
 int xe_gsc_init(struct xe_gsc *gsc);
 int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);
 void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 8a31c963c372..c395d8cc3b5a 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -991,6 +991,43 @@ void xe_gt_reset_async(struct xe_gt *gt)
 		xe_pm_runtime_put(gt_to_xe(gt));
 }
 
+static void xe_gt_flr_prepare_work(struct work_struct *w)
+{
+	struct xe_gt *gt = container_of(w, typeof(*gt), flr.worker);
+
+	xe_uc_flr_prepare(&gt->uc);
+}
+
+/**
+ * xe_gt_flr_prepare() - Prepare GT for FLR
+ * @gt: the GT object
+ *
+ * Prepare all GT uCs for FLR.
+ */
+void xe_gt_flr_prepare(struct xe_gt *gt)
+{
+	/*
+	 * We'll be tearing down exec queues which signals all fences and frees the
+	 * jobs but all of that happens asynchronously, so make sure we don't disrupt
+	 * the scheduler while jobs are still in-flight.
+	 */
+	INIT_WORK_ONSTACK(&gt->flr.worker, xe_gt_flr_prepare_work);
+	queue_work(gt->ordered_wq, &gt->flr.worker);
+	flush_work(&gt->flr.worker);
+	destroy_work_on_stack(&gt->flr.worker);
+}
+
+/**
+ * xe_gt_flr_done() - Re-initialize GT after FLR
+ * @gt: the GT object
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_gt_flr_done(struct xe_gt *gt)
+{
+	return xe_uc_flr_done(&gt->uc);
+}
+
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index de7e47763411..5e6e4eb09efe 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -63,6 +63,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
  */
 void xe_gt_record_user_engines(struct xe_gt *gt);
 
+int xe_gt_flr_done(struct xe_gt *gt);
+void xe_gt_flr_prepare(struct xe_gt *gt);
 void xe_gt_suspend_prepare(struct xe_gt *gt);
 int xe_gt_suspend(struct xe_gt *gt);
 void xe_gt_shutdown(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 8b55cf25a75f..f6694cc90582 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -201,6 +201,15 @@ struct xe_gt {
 		struct work_struct worker;
 	} reset;
 
+	/** @flr: state for FLR */
+	struct {
+		/**
+		 * @flr.worker: worker for FLR to be done async allowing to safely
+		 * flush all code paths
+		 */
+		struct work_struct worker;
+	} flr;
+
 	/** @tlb_inval: TLB invalidation state */
 	struct xe_tlb_inval tlb_inval;
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index ccebb437e37f..7db1fb8fea2b 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1681,6 +1681,42 @@ void xe_guc_sanitize(struct xe_guc *guc)
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
+ * xe_guc_flr_done() - Re-initialize GuC after FLR
+ * @guc: The GuC object
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_guc_flr_done(struct xe_guc *guc)
+{
+	int err;
+
+	if (!xe_uc_fw_is_loadable(&guc->fw))
+		return 0;
+
+	err = xe_uc_fw_reinit(&guc->fw);
+	if (err)
+		return err;
+
+	xe_guc_submit_reinit(guc);
+	return 0;
+}
+
 int xe_guc_reset_prepare(struct xe_guc *guc)
 {
 	return xe_guc_submit_reset_prepare(guc);
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 02514914f404..1fcc623cf24e 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -32,6 +32,8 @@
 struct drm_printer;
 
 void xe_guc_comm_init_early(struct xe_guc *guc);
+int xe_guc_flr_done(struct xe_guc *guc);
+void xe_guc_flr_prepare(struct xe_guc *guc);
 int xe_guc_init_noalloc(struct xe_guc *guc);
 int xe_guc_init(struct xe_guc *guc);
 int xe_guc_init_post_hwconfig(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 57afe21444b1..96c1bbb6f52c 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -296,6 +296,20 @@ void xe_huc_sanitize(struct xe_huc *huc)
 	xe_uc_fw_sanitize(&huc->fw);
 }
 
+/**
+ * xe_huc_flr_done() - Re-initialize HuC after FLR
+ * @huc: The HuC object
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_huc_flr_done(struct xe_huc *huc)
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
index fa1c45e70443..7600ea196908 100644
--- a/drivers/gpu/drm/xe/xe_huc.h
+++ b/drivers/gpu/drm/xe/xe_huc.h
@@ -17,6 +17,7 @@ enum xe_huc_auth_types {
 	XE_HUC_AUTH_TYPES_COUNT
 };
 
+int xe_huc_flr_done(struct xe_huc *huc);
 int xe_huc_init(struct xe_huc *huc);
 int xe_huc_init_post_hwconfig(struct xe_huc *huc);
 int xe_huc_upload(struct xe_huc *huc);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 75091bde0d50..e41aa95a4322 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -15,6 +15,7 @@
 #include "xe_guc_pc.h"
 #include "xe_guc_rc.h"
 #include "xe_guc_engine_activity.h"
+#include "xe_guc_submit.h"
 #include "xe_huc.h"
 #include "xe_sriov.h"
 #include "xe_wopcm.h"
@@ -275,6 +276,42 @@ static void uc_reset_wait(struct xe_uc *uc)
 		goto again;
 }
 
+/**
+ * xe_uc_flr_prepare() - Prepare uCs for FLR
+ * @uc: The uC object
+ *
+ * Tear down pending work and stop all uCs.
+ */
+void xe_uc_flr_prepare(struct xe_uc *uc)
+{
+	xe_gsc_wait_for_worker_completion(&uc->gsc);
+	xe_uc_reset_prepare(uc);
+	xe_guc_flr_prepare(&uc->guc);
+	xe_uc_stop(uc);
+	xe_uc_sanitize(uc);
+}
+
+/**
+ * xe_uc_flr_done() - Re-initialize uCs after FLR
+ * @uc: The uC object
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_uc_flr_done(struct xe_uc *uc)
+{
+	int ret;
+
+	ret = xe_guc_flr_done(&uc->guc);
+	if (ret)
+		return ret;
+
+	ret = xe_huc_flr_done(&uc->huc);
+	if (ret)
+		return ret;
+
+	return xe_gsc_flr_done(&uc->gsc);
+}
+
 void xe_uc_suspend_prepare(struct xe_uc *uc)
 {
 	xe_gsc_wait_for_worker_completion(&uc->gsc);
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 255a54a8f876..1756821edea1 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -8,6 +8,8 @@
 
 struct xe_uc;
 
+int xe_uc_flr_done(struct xe_uc *uc);
+void xe_uc_flr_prepare(struct xe_uc *uc);
 int xe_uc_init_noalloc(struct xe_uc *uc);
 int xe_uc_init(struct xe_uc *uc);
 int xe_uc_init_post_hwconfig(struct xe_uc *uc);
-- 
2.43.0

