Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A241CD1288
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11AC810EB85;
	Fri,  7 Nov 2025 18:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPtbMIII";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9E510E1D2
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539209; x=1794075209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DuDX11CtrqC9zy3OTe/7LYbOq0RdUFeopNfyT0T4ey0=;
 b=OPtbMIII1pAgG/AahKUl5l3mLoICJhRJbcAQxogbT27fAJ0aHbO9wYOp
 5IDYvTTmguCiLRFyek6lYReBWbhOwinkHhw0cFU6cHMu5TNm6FvDENs5+
 ETADm/VErDf8a4hM/PjfohJvOoMI39d7mLxcMSvyXEh1/kdcJbqC0gXJT
 8fzwa0L/6kABujpVbx2fzGjSr/XKhgHWg8oR6LHfdxAFZufONmkPgEVWZ
 1psPrmQXmDfskAb7EI38zFJPPvnA3rdCX0iidJ3skvvJu0zGKyPuU8ZVH
 to3CW6Ntm0sKPzadP+jeee3JsLdSgygXh7VW4uDtDfh7JQ9mCE5VDN3ll g==;
X-CSE-ConnectionGUID: y9tCRJUHTD2lKv2wOzsIpg==
X-CSE-MsgGUID: GnXs0pndTDaDQM3V6INswQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64730185"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64730185"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:29 -0800
X-CSE-ConnectionGUID: GAFNzfy4RjCNhFKOcOlvkw==
X-CSE-MsgGUID: 7yONK2XmQZWdRmvqCS7+UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271161"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:29 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 05/33] squash! drm/xe/forcewake: Create dedicated type for
 forcewake references
Date: Fri,  7 Nov 2025 10:13:21 -0800
Message-ID: <20251107181315.631642-40-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
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

The changes here were generated with Coccinelle from the following
semantic patch:

        @@
        identifier ref;
        expression fw, domains;
        @@
        (
        - unsigned int ref;
        + struct xe_force_wake_ref ref;
        |
        - unsigned int ref = 0;
        + struct xe_force_wake_ref ref;
        )
          <+...
          ref = xe_force_wake_get(fw, domains);
          ...+>

        @@
        expression fw, ref;
        @@
        - xe_force_wake_put(fw, ref);
        + xe_force_wake_put(ref);

        @@
        struct xe_force_wake_ref ref;
        @@
        - !ref
        + !ref.domains

This patch should be squashed into the previous patch before merging.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c |  6 +--
 drivers/gpu/drm/xe/tests/xe_mocs.c       |  6 +--
 drivers/gpu/drm/xe/xe_devcoredump.c      |  8 ++--
 drivers/gpu/drm/xe/xe_device.c           | 18 ++++----
 drivers/gpu/drm/xe/xe_drm_client.c       |  6 +--
 drivers/gpu/drm/xe/xe_eu_stall.c         |  2 +-
 drivers/gpu/drm/xe/xe_gsc.c              | 17 +++----
 drivers/gpu/drm/xe/xe_gsc_proxy.c        |  6 +--
 drivers/gpu/drm/xe/xe_gt.c               | 58 ++++++++++++------------
 drivers/gpu/drm/xe/xe_gt_debugfs.c       |  4 +-
 drivers/gpu/drm/xe/xe_gt_idle.c          | 20 ++++----
 drivers/gpu/drm/xe/xe_guc.c              | 10 ++--
 drivers/gpu/drm/xe/xe_guc_log.c          |  6 +--
 drivers/gpu/drm/xe/xe_guc_pc.c           | 16 +++----
 drivers/gpu/drm/xe/xe_guc_submit.c       |  4 +-
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c    |  4 +-
 drivers/gpu/drm/xe/xe_huc.c              |  6 +--
 drivers/gpu/drm/xe/xe_mocs.c             |  2 +-
 drivers/gpu/drm/xe/xe_oa.c               |  4 +-
 drivers/gpu/drm/xe/xe_pat.c              | 36 +++++++--------
 drivers/gpu/drm/xe/xe_pxp.c              | 16 +++----
 drivers/gpu/drm/xe/xe_query.c            |  6 +--
 drivers/gpu/drm/xe/xe_reg_sr.c           |  6 +--
 drivers/gpu/drm/xe/xe_vram.c             |  6 +--
 24 files changed, 137 insertions(+), 136 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 4ae847b628e2..80fd3844c41c 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -37,7 +37,7 @@ bool intel_hdcp_gsc_check_status(struct drm_device *drm)
 	struct xe_gt *gt = tile->media_gt;
 	struct xe_gsc *gsc = &gt->uc.gsc;
 	bool ret = true;
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 
 	if (!gsc || !xe_uc_fw_is_enabled(&gsc->fw)) {
 		drm_dbg_kms(&xe->drm,
@@ -47,7 +47,7 @@ bool intel_hdcp_gsc_check_status(struct drm_device *drm)
 
 	xe_pm_runtime_get(xe);
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
-	if (!fw_ref) {
+	if (!fw_ref.domains) {
 		drm_dbg_kms(&xe->drm,
 			    "failed to get forcewake to check proxy status\n");
 		ret = false;
@@ -57,7 +57,7 @@ bool intel_hdcp_gsc_check_status(struct drm_device *drm)
 	if (!xe_gsc_proxy_init_done(gsc))
 		ret = false;
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 out:
 	xe_pm_runtime_put(xe);
 	return ret;
diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 0e502feaca81..9c774b44328e 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -48,7 +48,7 @@ static void read_l3cc_table(struct xe_gt *gt,
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+		xe_force_wake_put(fw_ref);
 		KUNIT_ASSERT_TRUE_MSG(test, true, "Forcewake Failed.\n");
 	}
 
@@ -74,7 +74,7 @@ static void read_l3cc_table(struct xe_gt *gt,
 		KUNIT_EXPECT_EQ_MSG(test, l3cc_expected, l3cc,
 				    "l3cc idx=%u has incorrect val.\n", i);
 	}
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 }
 
 static void read_mocs_table(struct xe_gt *gt,
@@ -107,7 +107,7 @@ static void read_mocs_table(struct xe_gt *gt,
 				    "mocs reg 0x%x has incorrect val.\n", i);
 	}
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 }
 
 static int mocs_kernel_test_run_device(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 203e3038cc81..eb0b40ffffaa 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -276,7 +276,7 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
 	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
 	struct xe_device *xe = coredump_to_xe(coredump);
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 
 	/*
 	 * NB: Despite passing a GFP_ flags parameter here, more allocations are done
@@ -295,7 +295,7 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
 	xe_vm_snapshot_capture_delayed(ss->vm);
 	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
-	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 
 	ss->read.chunk_position = 0;
 
@@ -332,7 +332,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	const char *process_name = "no process";
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	bool cookie;
 
 	ss->snapshot_time = ktime_get_real();
@@ -364,7 +364,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	queue_work(system_unbound_wq, &ss->work);
 
-	xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	dma_fence_end_signalling(cookie);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c7d373c70f0f..9ae2b29a1cab 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -775,7 +775,7 @@ ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
 static int probe_has_flat_ccs(struct xe_device *xe)
 {
 	struct xe_gt *gt;
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	u32 reg;
 
 	/* Always enabled/disabled, no runtime check to do */
@@ -787,7 +787,7 @@ static int probe_has_flat_ccs(struct xe_device *xe)
 		return 0;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LOWER);
@@ -797,7 +797,7 @@ static int probe_has_flat_ccs(struct xe_device *xe)
 		drm_dbg(&xe->drm,
 			"Flat CCS has been disabled in bios, May lead to performance impact");
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 
 	return 0;
 }
@@ -1034,7 +1034,7 @@ void xe_device_wmb(struct xe_device *xe)
  */
 static void tdf_request_sync(struct xe_device *xe)
 {
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	struct xe_gt *gt;
 	u8 id;
 
@@ -1043,7 +1043,7 @@ static void tdf_request_sync(struct xe_device *xe)
 			continue;
 
 		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-		if (!fw_ref)
+		if (!fw_ref.domains)
 			return;
 
 		xe_mmio_write32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST);
@@ -1059,14 +1059,14 @@ static void tdf_request_sync(struct xe_device *xe)
 				   150, NULL, false))
 			xe_gt_err_once(gt, "TD flush timeout\n");
 
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+		xe_force_wake_put(fw_ref);
 	}
 }
 
 void xe_device_l2_flush(struct xe_device *xe)
 {
 	struct xe_gt *gt;
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 
 	gt = xe_root_mmio_gt(xe);
 	if (!gt)
@@ -1076,7 +1076,7 @@ void xe_device_l2_flush(struct xe_device *xe)
 		return;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	if (!fw_ref.domains)
 		return;
 
 	spin_lock(&gt->global_invl_lock);
@@ -1087,7 +1087,7 @@ void xe_device_l2_flush(struct xe_device *xe)
 
 	spin_unlock(&gt->global_invl_lock);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 60a6ea7c88e4..182526864286 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -290,7 +290,7 @@ static bool force_wake_get_any_engine(struct xe_device *xe,
 				      struct xe_force_wake_ref *pfw_ref)
 {
 	enum xe_force_wake_domains domain;
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	struct xe_hw_engine *hwe;
 	struct xe_force_wake *fw;
 
@@ -303,7 +303,7 @@ static bool force_wake_get_any_engine(struct xe_device *xe,
 
 	fw_ref = xe_force_wake_get(fw, domain);
 	if (!xe_force_wake_ref_has_domain(fw_ref, domain)) {
-		xe_force_wake_put(fw, fw_ref);
+		xe_force_wake_put(fw_ref);
 		return false;
 	}
 
@@ -360,7 +360,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 
 	gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
 
-	xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	xe_pm_runtime_put(xe);
 
 	for (class = 0; class < XE_ENGINE_CLASS_MAX; class++) {
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 8b3da9ae6888..95b2bfd403ad 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -832,7 +832,7 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
 		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
 					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
 
-	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
+	xe_force_wake_put(stream->fw_ref);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index dd69cb834f8e..59519c9023bd 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -263,7 +263,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_tile *tile = gt_to_tile(gt);
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	int ret;
 
 	if (tile->primary_gt && XE_GT_WA(tile->primary_gt, 14018094691)) {
@@ -281,8 +281,9 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
 
 	ret = gsc_upload(gsc);
 
-	if (tile->primary_gt && XE_GT_WA(tile->primary_gt, 14018094691))
-		xe_force_wake_put(gt_to_fw(tile->primary_gt), fw_ref);
+	if (tile->primary_gt && XE_GT_WA(tile->primary_gt, 14018094691)) {
+		xe_force_wake_put(fw_ref);
+	}
 
 	if (ret)
 		return ret;
@@ -352,7 +353,7 @@ static void gsc_work(struct work_struct *work)
 	struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	u32 actions;
 	int ret;
 
@@ -382,7 +383,7 @@ static void gsc_work(struct work_struct *work)
 		xe_gsc_proxy_request_handler(gsc);
 
 out:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	xe_pm_runtime_put(xe);
 }
 
@@ -615,7 +616,7 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_mmio *mmio = &gt->mmio;
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 
 	xe_uc_fw_print(&gsc->fw, p);
 
@@ -625,7 +626,7 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 		return;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
-	if (!fw_ref)
+	if (!fw_ref.domains)
 		return;
 
 	drm_printf(p, "\nHECI1 FWSTS: 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x\n",
@@ -636,5 +637,5 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 			xe_mmio_read32(mmio, HECI_FWSTS5(MTL_GSC_HECI1_BASE)),
 			xe_mmio_read32(mmio, HECI_FWSTS6(MTL_GSC_HECI1_BASE)));
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 }
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 464282a89eef..ba1211fe5a60 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -440,7 +440,7 @@ static void xe_gsc_proxy_remove(void *arg)
 	struct xe_gsc *gsc = arg;
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int fw_ref = 0;
+	struct xe_force_wake_ref fw_ref;
 
 	if (!gsc->proxy.component_added)
 		return;
@@ -448,13 +448,13 @@ static void xe_gsc_proxy_remove(void *arg)
 	/* disable HECI2 IRQs */
 	xe_pm_runtime_get(xe);
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
-	if (!fw_ref)
+	if (!fw_ref.domains)
 		xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
 
 	/* try do disable irq even if forcewake failed */
 	gsc_proxy_irq_toggle(gsc, false);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	xe_pm_runtime_put(xe);
 
 	xe_gsc_wait_for_worker_completion(gsc);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 6d479948bf21..d39bf8cb64eb 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -103,14 +103,14 @@ void xe_gt_sanitize(struct xe_gt *gt)
 
 static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	u32 reg;
 
 	if (!XE_GT_WA(gt, 16023588340))
 		return;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	if (!fw_ref.domains)
 		return;
 
 	if (xe_gt_is_main_type(gt)) {
@@ -120,12 +120,12 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 	}
 
 	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0xF);
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 }
 
 static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	u32 reg;
 
 	if (!XE_GT_WA(gt, 16023588340))
@@ -135,14 +135,14 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
 		return;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	if (!fw_ref.domains)
 		return;
 
 	reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
 	reg &= ~CG_DIS_CNTLBUS;
 	xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 }
 
 static void gt_reset_worker(struct work_struct *w);
@@ -389,7 +389,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 
 int xe_gt_init_early(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	int err;
 
 	if (IS_SRIOV_PF(gt_to_xe(gt))) {
@@ -437,12 +437,12 @@ int xe_gt_init_early(struct xe_gt *gt)
 		return err;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	xe_gt_mcr_init_early(gt);
 	xe_pat_init(gt);
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 
 	return 0;
 }
@@ -460,11 +460,11 @@ static void dump_pat_on_error(struct xe_gt *gt)
 
 static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	int err;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	err = xe_uc_init(&gt->uc);
@@ -510,18 +510,18 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	 */
 	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	return 0;
 
 err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 
 	return err;
 }
 
 static int gt_init_with_all_forcewake(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	int err;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
@@ -592,12 +592,12 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
 	if (IS_SRIOV_PF(gt_to_xe(gt)))
 		xe_gt_sriov_pf_init_hw(gt);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 
 	return 0;
 
 err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 
 	return err;
 }
@@ -819,7 +819,7 @@ static int do_gt_restart(struct xe_gt *gt)
 static void gt_reset_worker(struct work_struct *w)
 {
 	struct xe_gt *gt = container_of(w, typeof(*gt), reset.worker);
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	int err;
 
 	if (xe_device_wedged(gt_to_xe(gt)))
@@ -863,7 +863,7 @@ static void gt_reset_worker(struct work_struct *w)
 	if (err)
 		goto err_out;
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 
 	/* Pair with get while enqueueing the work in xe_gt_reset_async() */
 	xe_pm_runtime_put(gt_to_xe(gt));
@@ -873,7 +873,7 @@ static void gt_reset_worker(struct work_struct *w)
 	return;
 
 err_out:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	XE_WARN_ON(xe_uc_start(&gt->uc));
 
 err_fail:
@@ -902,18 +902,18 @@ void xe_gt_reset_async(struct xe_gt *gt)
 
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
 	xe_uc_suspend_prepare(&gt->uc);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 }
 
 int xe_gt_suspend(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	int err;
 
 	xe_gt_dbg(gt, "suspending\n");
@@ -931,7 +931,7 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 	xe_gt_disable_host_l2_vram(gt);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	xe_gt_dbg(gt, "suspended\n");
 
 	return 0;
@@ -939,7 +939,7 @@ int xe_gt_suspend(struct xe_gt *gt)
 err_msg:
 	err = -ETIMEDOUT;
 err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
 
 	return err;
@@ -947,11 +947,11 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 void xe_gt_shutdown(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	do_gt_reset(gt);
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 }
 
 /**
@@ -976,7 +976,7 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
 
 int xe_gt_resume(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	int err;
 
 	xe_gt_dbg(gt, "resuming\n");
@@ -990,7 +990,7 @@ int xe_gt_resume(struct xe_gt *gt)
 
 	xe_gt_idle_enable_pg(gt);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	xe_gt_dbg(gt, "resumed\n");
 
 	return 0;
@@ -998,7 +998,7 @@ int xe_gt_resume(struct xe_gt *gt)
 err_msg:
 	err = -ETIMEDOUT;
 err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
 
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index e4fd632f43cf..0b2c5d3ff8bb 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -118,7 +118,7 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	int ret = 0;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
@@ -131,7 +131,7 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 		xe_hw_engine_print(hwe, p);
 
 fw_put:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index bdc9d9877ec4..503aeabbe4c3 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -103,7 +103,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	struct xe_gt_idle *gtidle = &gt->gtidle;
 	struct xe_mmio *mmio = &gt->mmio;
 	u32 vcs_mask, vecs_mask;
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	int i, j;
 
 	if (IS_SRIOV_VF(xe))
@@ -146,13 +146,13 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	}
 
 	xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 }
 
 void xe_gt_idle_disable_pg(struct xe_gt *gt)
 {
 	struct xe_gt_idle *gtidle = &gt->gtidle;
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return;
@@ -162,7 +162,7 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 }
 
 /**
@@ -181,7 +181,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 	enum xe_gt_idle_state state;
 	u32 pg_enabled, pg_status = 0;
 	u32 vcs_mask, vecs_mask;
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	int n;
 	/*
 	 * Media Slices
@@ -219,13 +219,13 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 	/* Do not wake the GT to read powergating status */
 	if (state != GT_IDLE_C6) {
 		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-		if (!fw_ref)
+		if (!fw_ref.domains)
 			return -ETIMEDOUT;
 
 		pg_enabled = xe_mmio_read32(&gt->mmio, POWERGATE_ENABLE);
 		pg_status = xe_mmio_read32(&gt->mmio, POWERGATE_DOMAIN_STATUS);
 
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+		xe_force_wake_put(fw_ref);
 	}
 
 	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
@@ -396,7 +396,7 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
 
 int xe_gt_idle_disable_c6(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 
 	xe_device_assert_mem_access(gt_to_xe(gt));
 
@@ -404,13 +404,13 @@ int xe_gt_idle_disable_c6(struct xe_gt *gt)
 		return 0;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	xe_mmio_write32(&gt->mmio, RC_CONTROL, 0);
 	xe_mmio_write32(&gt->mmio, RC_STATE, 0);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index ecc3e091b89e..edff47a3235a 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -658,11 +658,11 @@ static void guc_fini_hw(void *arg)
 {
 	struct xe_guc *guc = arg;
 	struct xe_gt *gt = guc_to_gt(guc);
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_uc_sanitize_reset(&guc_to_gt(guc)->uc);
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 
 	guc_g2g_fini(guc);
 }
@@ -1610,7 +1610,7 @@ int xe_guc_start(struct xe_guc *guc)
 void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	u32 status;
 	int i;
 
@@ -1618,7 +1618,7 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 
 	if (!IS_SRIOV_VF(gt_to_xe(gt))) {
 		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-		if (!fw_ref)
+		if (!fw_ref.domains)
 			return;
 
 		status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
@@ -1639,7 +1639,7 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 				   i, xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(i)));
 		}
 
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+		xe_force_wake_put(fw_ref);
 	}
 
 	drm_puts(p, "\n");
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index c01ccb35dc75..f1d25e542f98 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -145,7 +145,7 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
 	struct xe_device *xe = log_to_xe(log);
 	struct xe_guc *guc = log_to_guc(log);
 	struct xe_gt *gt = log_to_gt(log);
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	size_t remain;
 	int i;
 
@@ -166,11 +166,11 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
 	}
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref) {
+	if (!fw_ref.domains) {
 		snapshot->stamp = ~0ULL;
 	} else {
 		snapshot->stamp = xe_mmio_read64_2x32(&gt->mmio, GUC_PMTIMESTAMP_LO);
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+		xe_force_wake_put(fw_ref);
 	}
 	snapshot->ktime = ktime_get_boottime_ns();
 	snapshot->level = log->level;
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index ff22235857f8..034c87d7bf10 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -511,7 +511,7 @@ u32 xe_guc_pc_get_cur_freq_fw(struct xe_guc_pc *pc)
 int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 
 	/*
 	 * GuC SLPC plays with cur freq request when GuCRC is enabled
@@ -519,13 +519,13 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
 	 */
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+		xe_force_wake_put(fw_ref);
 		return -ETIMEDOUT;
 	}
 
 	*freq = get_cur_freq(gt);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	return 0;
 }
 
@@ -1223,7 +1223,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	struct xe_device *xe = pc_to_xe(pc);
 	struct xe_gt *gt = pc_to_gt(pc);
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	ktime_t earlier;
 	int ret;
 
@@ -1231,7 +1231,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+		xe_force_wake_put(fw_ref);
 		return -ETIMEDOUT;
 	}
 
@@ -1298,7 +1298,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 		xe_gt_err(gt, "Failed to set SLPC power profile: %pe\n", ERR_PTR(ret));
 
 out:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	return ret;
 }
 
@@ -1330,7 +1330,7 @@ static void xe_guc_pc_fini_hw(void *arg)
 {
 	struct xe_guc_pc *pc = arg;
 	struct xe_device *xe = pc_to_xe(pc);
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 
 	if (xe_device_wedged(xe))
 		return;
@@ -1342,7 +1342,7 @@ static void xe_guc_pc_fini_hw(void *arg)
 	/* Bind requested freq to mert_freq_cap before unload */
 	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
 
-	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
+	xe_force_wake_put(fw_ref);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d4ffdb71ef3d..40514c270d6b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1225,7 +1225,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	const char *process_name = "no process";
 	struct xe_device *xe = guc_to_xe(guc);
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	int err = -ETIME;
 	pid_t pid = -1;
 	int i = 0;
@@ -1264,7 +1264,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 		xe_engine_snapshot_capture_for_queue(q);
 
-		xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
+		xe_force_wake_put(fw_ref);
 	}
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index a80175c7c478..321e5072b43e 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -71,7 +71,7 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 		return send_tlb_inval(guc, action, ARRAY_SIZE(action));
 	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
 		struct xe_mmio *mmio = &gt->mmio;
-		unsigned int fw_ref;
+		struct xe_force_wake_ref fw_ref;
 
 		if (IS_SRIOV_VF(xe))
 			return -ECANCELED;
@@ -86,7 +86,7 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
 					GUC_TLB_INV_CR_INVALIDATE);
 		}
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+		xe_force_wake_put(fw_ref);
 	}
 
 	return -ECANCELED;
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 0a70c8924582..5136e310515e 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -300,7 +300,7 @@ void xe_huc_sanitize(struct xe_huc *huc)
 void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
 {
 	struct xe_gt *gt = huc_to_gt(huc);
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 
 	xe_uc_fw_print(&huc->fw, p);
 
@@ -308,11 +308,11 @@ void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
 		return;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	if (!fw_ref.domains)
 		return;
 
 	drm_printf(p, "\nHuC status: 0x%08x\n",
 		   xe_mmio_read32(&gt->mmio, HUC_KERNEL_LOAD_INFO));
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 }
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 6613d3b48a84..73f9401d9907 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -828,7 +828,7 @@ int xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
 	table.ops->dump(&table, flags, gt, p);
 
 err_fw:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	xe_pm_runtime_put(xe);
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 87a2bf53d661..2e38391c44f7 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -870,7 +870,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 
 	xe_oa_free_oa_buffer(stream);
 
-	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
+	xe_force_wake_put(stream->fw_ref);
 	xe_pm_runtime_put(stream->oa->xe);
 
 	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
@@ -1817,7 +1817,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 err_free_oa_buf:
 	xe_oa_free_oa_buffer(stream);
 err_fw_put:
-	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
+	xe_force_wake_put(stream->fw_ref);
 	xe_pm_runtime_put(stream->oa->xe);
 	if (stream->override_gucrc)
 		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 68171cceea18..2a963b8ff807 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -233,11 +233,11 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
 static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	int i;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	drm_printf(p, "PAT table:\n");
@@ -250,7 +250,7 @@ static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
 	}
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	return 0;
 }
 
@@ -262,11 +262,11 @@ static const struct xe_pat_ops xelp_pat_ops = {
 static int xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	int i;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	drm_printf(p, "PAT table:\n");
@@ -281,7 +281,7 @@ static int xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
 	}
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	return 0;
 }
 
@@ -293,11 +293,11 @@ static const struct xe_pat_ops xehp_pat_ops = {
 static int xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	int i;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	drm_printf(p, "PAT table:\n");
@@ -310,7 +310,7 @@ static int xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 			   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
 	}
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	return 0;
 }
 
@@ -322,11 +322,11 @@ static const struct xe_pat_ops xehpc_pat_ops = {
 static int xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	int i;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	drm_printf(p, "PAT table:\n");
@@ -344,7 +344,7 @@ static int xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 			   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
 	}
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	return 0;
 }
 
@@ -361,12 +361,12 @@ static const struct xe_pat_ops xelpg_pat_ops = {
 static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	u32 pat;
 	int i;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	drm_printf(p, "PAT table: (* = reserved entry)\n");
@@ -406,7 +406,7 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 		   REG_FIELD_GET(XE2_COH_MODE, pat),
 		   pat);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	return 0;
 }
 
@@ -419,12 +419,12 @@ static const struct xe_pat_ops xe2_pat_ops = {
 static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	u32 pat;
 	int i;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	drm_printf(p, "PAT table: (* = reserved entry)\n");
@@ -456,7 +456,7 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
 		   REG_FIELD_GET(XE2_COH_MODE, pat),
 		   pat);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index bdbdbbf6a678..5dc536189184 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -58,7 +58,7 @@ bool xe_pxp_is_enabled(const struct xe_pxp *pxp)
 static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
 {
 	struct xe_gt *gt = pxp->gt;
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	bool ready;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
@@ -77,7 +77,7 @@ static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
 	ready = xe_huc_is_authenticated(&gt->uc.huc, XE_HUC_AUTH_VIA_GSC) &&
 		xe_gsc_proxy_init_done(&gt->uc.gsc);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 
 	return ready;
 }
@@ -135,7 +135,7 @@ static void pxp_invalidate_queues(struct xe_pxp *pxp);
 static int pxp_terminate_hw(struct xe_pxp *pxp)
 {
 	struct xe_gt *gt = pxp->gt;
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	int ret = 0;
 
 	drm_dbg(&pxp->xe->drm, "Terminating PXP\n");
@@ -162,7 +162,7 @@ static int pxp_terminate_hw(struct xe_pxp *pxp)
 	ret = xe_pxp_submit_session_invalidation(&pxp->gsc_res, ARB_SESSION);
 
 out:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	return ret;
 }
 
@@ -326,14 +326,14 @@ static int kcr_pxp_set_status(const struct xe_pxp *pxp, bool enable)
 {
 	u32 val = enable ? _MASKED_BIT_ENABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES) :
 		  _MASKED_BIT_DISABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES);
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(pxp->gt), XE_FW_GT);
 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT))
 		return -EIO;
 
 	xe_mmio_write32(&pxp->gt->mmio, KCR_INIT, val);
-	xe_force_wake_put(gt_to_fw(pxp->gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 
 	return 0;
 }
@@ -453,7 +453,7 @@ int xe_pxp_init(struct xe_device *xe)
 static int __pxp_start_arb_session(struct xe_pxp *pxp)
 {
 	int ret;
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(pxp->gt), XE_FW_GT);
 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT))
@@ -479,7 +479,7 @@ static int __pxp_start_arb_session(struct xe_pxp *pxp)
 	drm_dbg(&pxp->xe->drm, "PXP ARB session is active\n");
 
 out_force_wake:
-	xe_force_wake_put(gt_to_fw(pxp->gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 1c0915e2cc16..6d84651c76cd 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -122,7 +122,7 @@ query_engine_cycles(struct xe_device *xe,
 	__ktime_func_t cpu_clock;
 	struct xe_hw_engine *hwe;
 	struct xe_gt *gt;
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 
 	if (IS_SRIOV_VF(xe))
 		return -EOPNOTSUPP;
@@ -160,14 +160,14 @@ query_engine_cycles(struct xe_device *xe,
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))  {
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+		xe_force_wake_put(fw_ref);
 		return -EIO;
 	}
 
 	hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_timestamp,
 			   &resp.cpu_delta, cpu_clock);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 
 	if (GRAPHICS_VER(xe) >= 20)
 		resp.width = 64;
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index fc8447a838c4..c155880646d4 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -168,7 +168,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 {
 	struct xe_reg_sr_entry *entry;
 	unsigned long reg;
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 
 	if (xa_empty(&sr->xa))
 		return;
@@ -185,12 +185,12 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 	xa_for_each(&sr->xa, reg, entry)
 		apply_one_mmio(gt, entry);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 
 	return;
 
 err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 	xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index b62a96f8ef9e..8e43ebf8ee3b 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -245,7 +245,7 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *gt = tile->primary_gt;
-	unsigned int fw_ref;
+	struct xe_force_wake_ref fw_ref;
 	u64 offset;
 	u32 reg;
 
@@ -266,7 +266,7 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 	}
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	/* actual size */
@@ -289,7 +289,7 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 	/* remove the tile offset so we have just the available size */
 	*vram_size = offset - *tile_offset;
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(fw_ref);
 
 	return 0;
 }
-- 
2.51.1

