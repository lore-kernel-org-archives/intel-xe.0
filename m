Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A03606A31B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZsKKLdvK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298D010FA1C;
	Wed,  4 Nov 2026 07:49:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E881910FA1C
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 07:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793778541; x=1825314541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cd+tZJZdP1SHUYPqUPPlXsnK60vVSRNiuFWngjEywQM=;
 b=ZsKKLdvK/HSCb/Zy4IjrodT30iWA03l64wRzJpxZbB+67fHnS3E47sBz
 v3PY0HNe83QWJO+K+Rk6NDLDaHhvCOSx8H/s0MJ4oNnvVHj0SWh9unc07
 7pZbWNAqMi1XKWWB0BhXpb1JCosI5rVbqbDjNNlo9v5VCRTy+rgYG1pmV
 ffuvZEVG6hDZG/wnQwSRYHOgvPD4eNCnZs3GDFEq8YlaC89OwGutzxJ73
 v1hb9BxPj4kkXSLNQpTfu+2Shfdydq+1jtIKI4NcLHGGFP4iN62UEezgQ
 ShULGuDP97oRcT0lkBKGTKOrtCV79nViV+mkG3dM51HWmJyf6AwYIQqrO Q==;
X-CSE-ConnectionGUID: 9zwu6SK7SoK0cHGLJH0uRQ==
X-CSE-MsgGUID: FoyTUOcxTA+DpnWUJwEe3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2536102"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2536102"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 23:49:00 -0800
X-CSE-ConnectionGUID: Mfwp5ijKTfG5UWwtJton+g==
X-CSE-MsgGUID: D4R6tc19Qt24iSu8QBiz/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="8520938"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa013.fm.intel.com with ESMTP; 03 Nov 2026 23:48:57 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, lukas@wunner.de,
 daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v13 03/10] drm/xe/gt: Introduce FLR helpers
Date: Wed,  4 Nov 2026 13:17:31 +0530
Message-ID: <20261104074813.1415191-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104074813.1415191-1-raag.jadav@intel.com>
References: <20261104074813.1415191-1-raag.jadav@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
 drivers/gpu/drm/xe/xe_gt.c       | 24 +++++++++++
 drivers/gpu/drm/xe/xe_gt.h       |  2 +
 drivers/gpu/drm/xe/xe_guc.c      | 29 +++++++++++++
 drivers/gpu/drm/xe/xe_guc.h      |  2 +
 drivers/gpu/drm/xe/xe_huc.c      | 14 ++++++
 drivers/gpu/drm/xe/xe_huc.h      |  1 +
 drivers/gpu/drm/xe/xe_uc.c       | 74 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_uc.h       |  2 +
 drivers/gpu/drm/xe/xe_uc_types.h | 14 ++++++
 11 files changed, 177 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index db669a953886..8edb8cee3cbd 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -550,6 +550,20 @@ void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc)
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
index be79a0da2f2f..0985feea0e8c 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -906,6 +906,30 @@ static int do_gt_restart(struct xe_gt *gt)
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
+	xe_tlb_inval_reset(&gt->tlb_inval);
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
index 7d292f9d0be7..1c701dd98edc 100644
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
 void xe_gt_wedge_declare(struct xe_gt *gt);
 int xe_gt_record_default_lrcs(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 300126e6624f..c4fb34e64cd6 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1736,6 +1736,35 @@ void xe_guc_sanitize(struct xe_guc *guc)
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
index 543ba4e5981e..a73bf08df98d 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -33,10 +33,12 @@ struct drm_printer;
 struct xe_gt;
 
 void xe_guc_comm_init_early(struct xe_guc *guc);
+void xe_guc_flr_prepare(struct xe_guc *guc);
 int xe_guc_init_noalloc(struct xe_guc *guc);
 int xe_guc_init(struct xe_guc *guc);
 int xe_guc_init_post_hwconfig(struct xe_guc *guc);
 int xe_guc_post_load_init(struct xe_guc *guc);
+int xe_guc_reinit(struct xe_guc *guc);
 int xe_guc_reset(struct xe_guc *guc);
 void xe_guc_resume_early(struct xe_guc *guc);
 int xe_guc_upload(struct xe_guc *guc);
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
index 89040d9fa05f..f5433025325c 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -19,6 +19,8 @@
 #include "xe_guc_submit.h"
 #include "xe_huc.h"
 #include "xe_sriov.h"
+#include "xe_uc_fw.h"
+#include "xe_wedge.h"
 #include "xe_wopcm.h"
 
 static struct xe_gt *
@@ -279,6 +281,78 @@ static void uc_reset_wait(struct xe_uc *uc)
 		goto again;
 }
 
+static void uc_flr_prepare(struct work_struct *w)
+{
+	struct xe_uc_flr *flr = container_of(w, struct xe_uc_flr, work);
+	struct xe_uc *uc = flr->uc;
+
+	xe_gt_assert(uc_to_gt(uc), xe_wedged(uc_to_xe(uc)));
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
index 3c56327fb3f9..2978a4e32894 100644
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
 void xe_uc_resume_early(struct xe_uc *uc);
 void xe_uc_runtime_resume(struct xe_uc *uc);
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

