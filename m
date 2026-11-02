Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3D6606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 21:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HLJ0MRl3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA2210E6C7;
	Mon,  2 Nov 2026 21:06:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960F710E6C7
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 21:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793653602; x=1825189602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=askwBJiDtBuClzvdqSajOMZWXO7I/FItgaQa4PoG12Y=;
 b=HLJ0MRl3Ev2AUCn0bydk59hLZPEtWaiacVS2mGjKbPmRup535N3V/BJY
 gDl8QrIkSrp/kY6HSDX8eO9JQsYlIU9soHUpENQQmZ25WJ6Tm2Of4sRYZ
 BH7ClcZ/vLbvXSc760aOC7wdv5Or+c2ZTAs/ako/5GpAZDeKn54h30Vhw
 m0iKDv+eO6CeqLv9xaobvFzLBOg4iY/WvOxSnTZH5OVjIANuF2ZVKjEpY
 i5wVZp9YV3U91PI6ctIoQKwtby9Qz0lEs/DnLvI6h1JNsVitL1lIjAe2O
 s1MCVpIsyq+qAES4BqpvooMbguZDW9S3cC2TAFHinz28VqSiiIC94ZqnF w==;
X-CSE-ConnectionGUID: IQk+JqWsQG211+AREnS9UQ==
X-CSE-MsgGUID: 6UHlsc7VQCC4xJUZrYaslg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2390413"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2390413"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 13:06:36 -0800
X-CSE-ConnectionGUID: T6y18bIWTniG/XjdIcek4g==
X-CSE-MsgGUID: tdNsHEjKTZaa8PcezYaUdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6249849"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa004.fm.intel.com with ESMTP; 02 Nov 2026 13:06:35 -0800
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: alan.previn.teres.alexis@intel.com,
 Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH 1/3] drm/xe/wedge: add fault inspection with debugfs release
Date: Mon,  2 Nov 2026 13:02:40 -0800
Message-ID: <20261102210242.635207-2-daniel.charles@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102210242.635207-1-daniel.charles@intel.com>
References: <20261102210242.635207-1-daniel.charles@intel.com>
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

From: Alan Previn <alan.previn.teres.alexis@intel.com>

Add wedged_mode=3 for inspecting hardware after a fault without automatic
engine recovery. Extend the no-reset GuC policy and provide a debugfs
release interface backed by a dedicated worker.

The worker stops submission on all GTs and blocks new Xe ioctls while
waiting for a skip or continue response. Skip does not undo the GT stop
or restore normal operation; continue proceeds into permanent wedging
and userspace notification. The stop is best-effort, not an atomic
snapshot, and in-flight ioctls can still complete.

Configure wedged_mode=3 before starting workloads: changing modes does not
atomically synchronize GuC policy updates with concurrent submissions.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Signed-off-by: Daniel Charles <daniel.charles@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c     |  27 ++-
 drivers/gpu/drm/xe/xe_device.c      |  12 +-
 drivers/gpu/drm/xe/xe_gt.c          |  17 +-
 drivers/gpu/drm/xe/xe_gt.h          |   1 +
 drivers/gpu/drm/xe/xe_guc.c         |   2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c     |   2 +-
 drivers/gpu/drm/xe/xe_guc_capture.c |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c  |  18 +-
 drivers/gpu/drm/xe/xe_pci.c         |  16 +-
 drivers/gpu/drm/xe/xe_uc.c          |   2 +-
 drivers/gpu/drm/xe/xe_wedge.c       | 250 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_wedge.h       |   3 +
 drivers/gpu/drm/xe/xe_wedge_types.h |  36 ++++
 13 files changed, 357 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index e59d4964d811..162423c50e63 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -419,7 +419,7 @@ static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
 	char buf[32];
 	int len = 0;
 
-	len = scnprintf(buf, sizeof(buf), "%d\n", xe->wedged.mode);
+	len = scnprintf(buf, sizeof(buf), "%d\n", READ_ONCE(xe->wedged.mode));
 
 	return simple_read_from_buffer(ubuf, size, pos, buf, len);
 }
@@ -448,6 +448,25 @@ static const struct file_operations wedged_mode_fops = {
 	.write = wedged_mode_set,
 };
 
+static ssize_t wedged_pause_resume_set(struct file *f, const char __user *ubuf,
+				       size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	u32 reply;
+	int ret;
+
+	ret = kstrtouint_from_user(ubuf, size, 0, &reply);
+	if (ret)
+		return ret;
+	ret = xe_wedge_set_reply(xe, reply);
+	return ret ? ret : size;
+}
+
+static const struct file_operations wedged_pause_resume_fops = {
+	.owner = THIS_MODULE,
+	.write = wedged_pause_resume_set,
+};
+
 static ssize_t page_reclaim_hw_assist_show(struct file *f, char __user *ubuf,
 					   size_t size, loff_t *pos)
 {
@@ -723,6 +742,12 @@ void xe_debugfs_register(struct xe_device *xe)
 
 	debugfs_create_file("wedged_mode", 0600, root, xe,
 			    &wedged_mode_fops);
+	/*
+	 * Skip is not recovery: GTs remain stopped. Inspection has no automatic
+	 * timeout. Continue completes permanent wedging, not normal execution.
+	 */
+	debugfs_create_file("wedged_pause_resume", 0200, root, xe,
+			    &wedged_pause_resume_fops);
 
 	debugfs_create_file("atomic_svm_timeslice_ms", 0600, root, xe,
 			    &atomic_svm_timeslice_ms_fops);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d3bb42e4d0d7..210bb4229402 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -239,7 +239,7 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
 	long ret;
 
-	if (xe_wedged(xe))
+	if (xe_wedged(xe) || atomic_read(&xe->wedged.declare_pending))
 		return -ECANCELED;
 
 	ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
@@ -257,7 +257,7 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
 	long ret;
 
-	if (xe_wedged(xe))
+	if (xe_wedged(xe) || atomic_read(&xe->wedged.declare_pending))
 		return -ECANCELED;
 
 	ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
@@ -461,6 +461,11 @@ int xe_device_init_early(struct xe_device *xe)
 {
 	int err;
 
+	mutex_init(&xe->wedged.mode_mutex);
+	spin_lock_init(&xe->wedged.mode_lock);
+	atomic_set(&xe->wedged.declare_pending, 0);
+	init_waitqueue_head(&xe->wedged.pause_waitq);
+
 	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
 			      xe->drm.anon_inode->i_mapping,
 			      xe->drm.vma_offset_manager,
@@ -1110,6 +1115,7 @@ int xe_device_probe(struct xe_device *xe)
 	return 0;
 
 err_unregister_display:
+	xe_wedge_prepare_fini(xe);
 	xe_display_unregister(xe);
 	drm_dev_unregister(&xe->drm);
 
@@ -1132,6 +1138,8 @@ void xe_device_shutdown(struct xe_device *xe)
 
 	drm_dbg(&xe->drm, "Shutting down device\n");
 
+	xe_wedge_prepare_fini(xe);
+
 	xe_display_shutdown(xe);
 
 	xe_irq_suspend(xe);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 45fb074812a2..a84fa80e9fa9 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -1194,10 +1194,25 @@ void xe_gt_wedge_declare(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
-	xe_gt_assert(gt, xe->wedged.mode);
+	xe_gt_assert(gt, READ_ONCE(xe->wedged.mode));
 	xe_uc_reset_prepare(&gt->uc);
 
 	xe_pm_runtime_get_noresume(xe);
 	if (!queue_work(gt->ordered_wq, &gt->wedge.worker))
 		xe_pm_runtime_put(xe);
 }
+
+/**
+ * xe_gt_wedge_pause() - Stop GT submission synchronously for mode-3 inspection
+ * @gt: GT to stop
+ *
+ * Called only by the sleepable device inspection worker.
+ */
+void xe_gt_wedge_pause(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, READ_ONCE(gt_to_xe(gt)->wedged.mode) ==
+		     XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE);
+	xe_uc_reset_prepare(&gt->uc);
+	xe_uc_wedge_declare(&gt->uc);
+	xe_tlb_inval_reset(&gt->tlb_inval);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 7b6952fe804c..a2591c5f0ffa 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -41,6 +41,7 @@ int xe_gt_init_early(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
 void xe_gt_mmio_init(struct xe_gt *gt);
 void xe_gt_wedge_declare(struct xe_gt *gt);
+void xe_gt_wedge_pause(struct xe_gt *gt);
 int xe_gt_record_default_lrcs(struct xe_gt *gt);
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index b1f4e132fa0c..1f8df08544ed 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1839,7 +1839,7 @@ int xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
  */
 void xe_guc_wedge_declare(struct xe_guc *guc)
 {
-	xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);
+	xe_gt_assert(guc_to_gt(guc), READ_ONCE(guc_to_xe(guc)->wedged.mode));
 
 	xe_guc_ct_stop(&guc->ct);
 	xe_guc_submit_wedge(guc);
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 43a2951a66d6..01026c024da0 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -534,7 +534,7 @@ static void guc_policies_init(struct xe_guc_ads *ads)
 	ads_blob_write(ads, policies.max_num_work_items,
 		       GLOBAL_POLICY_MAX_NUM_WI);
 
-	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+	if (xe_wedge_is_hanging_on_any(READ_ONCE(xe->wedged.mode)))
 		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
 
 	ads_blob_write(ads, policies.global_flags, global_flags);
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 5a4d085660a2..dfedabc651a5 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1894,7 +1894,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
 
 	xe = gt_to_xe(q->gt);
 
-	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+	if (xe_wedge_is_hanging_on_any(READ_ONCE(xe->wedged.mode)))
 		return NULL;
 
 	if (!xe_device_uc_enabled(xe))
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9e7c2778029c..57e258283935 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1424,7 +1424,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
 	struct xe_exec_queue *q;
 	unsigned long index;
 
-	xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);
+	xe_gt_assert(guc_to_gt(guc), READ_ONCE(guc_to_xe(guc)->wedged.mode));
 
 	/*
 	 * If device is being wedged even before submission_state is
@@ -1433,7 +1433,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
 	if (!guc->submission_state.initialized)
 		return;
 
-	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
+	if (xe_wedge_is_hanging_on_any(READ_ONCE(xe->wedged.mode))) {
 		mutex_lock(&guc->submission_state.lock);
 		xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
 			if (xe_exec_queue_get_unless_zero(q))
@@ -1453,7 +1453,7 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 
-	if (xe->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+	if (!xe_wedge_is_hanging_on_any(READ_ONCE(xe->wedged.mode)))
 		return false;
 
 	if (xe_wedged(xe))
@@ -1672,7 +1672,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	if (!exec_queue_killed(q))
 		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
 	else
-		wedged = xe_wedged(xe);
+		wedged = xe_wedged(xe) ||
+			 (READ_ONCE(xe->wedged.mode) ==
+			  XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE &&
+			  exec_queue_wedged(q));
 
 	/*
 	 * Only tag as GPU hang if this is the original timeout, not a
@@ -1726,6 +1729,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			goto handle_vf_resume;
 		if (!ret || xe_guc_read_stopped(guc)) {
 trigger_reset:
+			if (READ_ONCE(xe->wedged.mode) ==
+			    XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE &&
+			    (exec_queue_wedged(q) || exec_queue_wedged(primary))) {
+				wedged = true;
+				goto complete_jobs;
+			}
 			if (!ret)
 				xe_gt_warn(guc_to_gt(guc),
 					   "Schedule disable failed to respond, guc_id=%d",
@@ -1778,6 +1787,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		}
 	}
 
+complete_jobs:
 	/* Mark all outstanding jobs as bad, thus completing them */
 	xe_sched_job_set_error(job, err);
 	drm_sched_for_each_pending_job(tmp_job, &sched->base, NULL)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 0c13eb901aa7..331a80baa649 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -39,6 +39,7 @@
 #include "xe_survivability_mode.h"
 #include "xe_tile.h"
 #include "xe_tile_printk.h"
+#include "xe_wedge.h"
 
 enum toggle_d3cold {
 	D3COLD_DISABLE,
@@ -1120,6 +1121,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 
+	xe_wedge_prepare_fini(xe);
+
 	if (IS_SRIOV_PF(xe))
 		xe_pci_sriov_configure(pdev, 0);
 
@@ -1252,15 +1255,15 @@ static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *des
 
 	err = xe_probe_info(xe, &probed_info);
 	if (err)
-		return err;
+		goto err_wedge_cleanup;
 
 	err = xe_info_init(xe, &probed_info);
 	if (err)
-		return err;
+		goto err_wedge_cleanup;
 
 	err = xe_display_probe(xe);
 	if (err)
-		return err;
+		goto err_wedge_cleanup;
 
 	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) display:%s dma_m_s:%d tc:%d gscfi:%d cscfi:%d",
 		desc->platform_name,
@@ -1288,11 +1291,11 @@ static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *des
 
 	err = xe_pm_probe(xe);
 	if (err)
-		return err;
+		goto err_wedge_cleanup;
 
 	err = xe_device_probe(xe);
 	if (err)
-		return err;
+		goto err_wedge_cleanup;
 
 	err = xe_pm_init(xe);
 	if (err)
@@ -1303,6 +1306,9 @@ static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *des
 err_driver_cleanup:
 	xe_pci_remove(pdev);
 	return err;
+err_wedge_cleanup:
+	xe_wedge_prepare_fini(xe);
+	return err;
 }
 
 static void xe_pci_shutdown(struct pci_dev *pdev)
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 686c28856014..ae428bbe72ac 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -334,7 +334,7 @@ void xe_uc_runtime_resume(struct xe_uc *uc)
  */
 void xe_uc_wedge_declare(struct xe_uc *uc)
 {
-	xe_gt_assert(uc_to_gt(uc), uc_to_xe(uc)->wedged.mode);
+	xe_gt_assert(uc_to_gt(uc), READ_ONCE(uc_to_xe(uc)->wedged.mode));
 
 	xe_guc_wedge_declare(&uc->guc);
 }
diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
index 2f35937c5e66..c22c3544adca 100644
--- a/drivers/gpu/drm/xe/xe_wedge.c
+++ b/drivers/gpu/drm/xe/xe_wedge.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
+#include <linux/workqueue.h>
 
 #include "xe_defaults.h"
 #include "xe_device.h"
@@ -67,9 +68,10 @@ static void wedge_work(struct work_struct *work)
 #define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
 
 /**
- * xe_wedge_declare() - Declare device wedged
+ * wedge_declare_now() - Declare device wedged
  * @xe: xe device instance
  * @method: method(s) to be used for recovery
+ * @gts_already_wedged: Inspection has already stopped GT submission
  *
  * This is the final state that can only be cleared with the recovery method
  * specified in the drm wedged uevent.
@@ -87,7 +89,8 @@ static void wedge_work(struct work_struct *work)
  * Since the wedge handling is done as part of worker thread, this is safe for
  * atomic callers.
  */
-void xe_wedge_declare(struct xe_device *xe, unsigned long method)
+static void wedge_declare_now(struct xe_device *xe, unsigned long method,
+			      bool gts_already_wedged)
 {
 	struct xe_gt *gt;
 	u8 id;
@@ -109,15 +112,17 @@ void xe_wedge_declare(struct xe_device *xe, unsigned long method)
 			"Please file a _new_ bug report at %s\n",
 			WEDGED_URL, XE_BUG_URL);
 
-	for_each_initialized_gt(gt, xe, id)
-		xe_gt_wedge_declare(gt);
+	if (!gts_already_wedged) {
+		for_each_initialized_gt(gt, xe, id)
+			xe_gt_wedge_declare(gt);
+	}
 
 	/*
 	 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
 	 * hangs, so wedge the device with 'none' recovery method and have
 	 * it available to the user for debugging.
 	 */
-	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+	if (xe_wedge_is_hanging_on_any(READ_ONCE(xe->wedged.mode)))
 		xe->wedged.method = DRM_WEDGE_RECOVERY_NONE;
 	else
 		xe->wedged.method = method;
@@ -125,6 +130,188 @@ void xe_wedge_declare(struct xe_device *xe, unsigned long method)
 	schedule_work(&xe->wedged.work);
 }
 
+static bool wedge_reply_ready(struct xe_device *xe)
+{
+	u32 reply = READ_ONCE(xe->wedged.reply);
+
+	return reply == XE_WEDGE_REPLY_SKIP || reply == XE_WEDGE_REPLY_CONTINUE;
+}
+
+int xe_wedge_set_reply(struct xe_device *xe, u32 reply)
+{
+	unsigned long flags;
+	int ret = 0;
+
+	if (reply != XE_WEDGE_REPLY_SKIP && reply != XE_WEDGE_REPLY_CONTINUE)
+		return -EINVAL;
+
+	spin_lock_irqsave(&xe->wedged.mode_lock, flags);
+	if (READ_ONCE(xe->wedged.mode) !=
+	    XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE ||
+	    !atomic_read(&xe->wedged.declare_pending) ||
+	    !xe->wedged.wait_active || READ_ONCE(xe->wedged.shutting_down))
+		ret = -EINVAL;
+	else if (READ_ONCE(xe->wedged.reply))
+		ret = -EALREADY;
+	else
+		WRITE_ONCE(xe->wedged.reply, reply);
+	spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
+
+	if (!ret)
+		wake_up_all(&xe->wedged.pause_waitq);
+	return ret;
+}
+
+static void wedge_pause_work(struct work_struct *work)
+{
+	struct xe_device *xe = container_of(work, struct xe_device, wedged.pause_work);
+	struct xe_gt *gt;
+	unsigned long flags;
+	bool pm_ref;
+	u32 reply;
+	u8 id;
+
+	spin_lock_irqsave(&xe->wedged.mode_lock, flags);
+	pm_ref = xe->wedged.pause_pm_ref;
+	xe->wedged.pause_pm_ref = false;
+	spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
+
+	if (READ_ONCE(xe->wedged.shutting_down)) {
+		if (pm_ref)
+			goto put_runtime_ref;
+		goto clear_pending;
+	}
+
+	if (!pm_ref) {
+		xe_warn(xe, "Mode-3 wedge could not retain active runtime PM; resuming for inspection, hardware state may have changed\n");
+		if (!xe_pm_runtime_resume_and_get(xe)) {
+			xe_err(xe, "Failed to resume device for mode-3 inspection; aborting pause\n");
+			goto clear_pending;
+		}
+	}
+
+	if (READ_ONCE(xe->wedged.shutting_down))
+		goto put_runtime_ref;
+
+	for_each_initialized_gt(gt, xe, id)
+		xe_gt_wedge_pause(gt);
+
+	spin_lock_irqsave(&xe->wedged.mode_lock, flags);
+	WRITE_ONCE(xe->wedged.reply, 0);
+	xe->wedged.wait_active = true;
+	spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
+
+	xe_err(xe, "GT submission stopped for mode-3 hardware debugging.\n"
+	       "New DRM ioctls are blocked while waiting for 'wedged_pause_resume'.\n"
+	       "Skip: 0x%08x; continue into permanent wedge: 0x%08x.\n"
+	       "Skip does not restart GTs or recover the fault.\n",
+	       XE_WEDGE_REPLY_SKIP, XE_WEDGE_REPLY_CONTINUE);
+
+	wait_event_idle(xe->wedged.pause_waitq,
+			wedge_reply_ready(xe) || READ_ONCE(xe->wedged.shutting_down));
+
+	spin_lock_irqsave(&xe->wedged.mode_lock, flags);
+	xe->wedged.wait_active = false;
+	reply = READ_ONCE(xe->wedged.reply);
+	spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
+
+	if (!READ_ONCE(xe->wedged.shutting_down) && reply == XE_WEDGE_REPLY_CONTINUE)
+		wedge_declare_now(xe, DRM_WEDGE_RECOVERY_NONE, true);
+	else
+		xe_info(xe, "Inspection released without permanent wedge; GTs remain stopped\n");
+put_runtime_ref:
+	xe_pm_runtime_put(xe);
+clear_pending:
+	atomic_set(&xe->wedged.declare_pending, 0);
+}
+
+static void wedge_request(struct xe_device *xe, unsigned long method, bool mode3_only)
+{
+	unsigned long flags;
+	enum xe_wedged_mode mode;
+	bool pm_ref;
+
+	spin_lock_irqsave(&xe->wedged.mode_lock, flags);
+	mode = READ_ONCE(xe->wedged.mode);
+	if (READ_ONCE(xe->wedged.shutting_down) ||
+	    (mode3_only && mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE)) {
+		spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
+		return;
+	}
+
+	if (mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE) {
+		spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
+		wedge_declare_now(xe, method, false);
+		return;
+	}
+
+	if (atomic_read(&xe->wedged.declare_pending)) {
+		spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
+		return;
+	}
+
+	atomic_set(&xe->wedged.declare_pending, 1);
+	pm_ref = xe_pm_runtime_get_if_active(xe);
+	if (WARN_ON_ONCE(!queue_work(xe->wedged.pause_workqueue, &xe->wedged.pause_work))) {
+		xe_err(xe, "Mode-3 inspection work already queued\n");
+		spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
+		if (pm_ref)
+			xe_pm_runtime_put(xe);
+		return;
+	}
+	xe->wedged.pause_pm_ref = pm_ref;
+	spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
+}
+
+/**
+ * xe_wedge_declare() - Request device wedging
+ * @xe: Xe device
+ * @method: Recovery methods for a permanent wedge
+ *
+ * Mode 3 defers all requests, including critical errors, to inspection.
+ * Returning does not imply GT stopping is complete. Permanent wedging and
+ * its userspace notification occur only on continue. Teardown suppresses
+ * new inspection requests. Other modes retain normal wedge handling.
+ */
+void xe_wedge_declare(struct xe_device *xe, unsigned long method)
+{
+	wedge_request(xe, method, false);
+}
+
+/**
+ * xe_wedge_declare_mode3() - Request inspection only in mode 3
+ * @xe: Xe device
+ *
+ * Safe for atomic callers. Returning does not imply the GTs are stopped.
+ */
+void xe_wedge_declare_mode3(struct xe_device *xe)
+{
+	wedge_request(xe, DRM_WEDGE_RECOVERY_NONE, true);
+}
+
+/**
+ * xe_wedge_prepare_fini() - Release and join mode-3 inspection before teardown
+ * @xe: Xe device
+ */
+void xe_wedge_prepare_fini(struct xe_device *xe)
+{
+	unsigned long flags;
+	bool mode3;
+
+	mutex_lock(&xe->wedged.mode_mutex);
+	spin_lock_irqsave(&xe->wedged.mode_lock, flags);
+	mode3 = READ_ONCE(xe->wedged.mode) ==
+		XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE;
+	if (mode3)
+		WRITE_ONCE(xe->wedged.shutting_down, true);
+	spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
+	if (mode3 && xe->wedged.pause_workqueue) {
+		wake_up_all(&xe->wedged.pause_waitq);
+		flush_work(&xe->wedged.pause_work);
+	}
+	mutex_unlock(&xe->wedged.mode_mutex);
+}
+
 static const char *wedge_mode_to_string(enum xe_wedged_mode mode)
 {
 	switch (mode) {
@@ -134,6 +321,8 @@ static const char *wedge_mode_to_string(enum xe_wedged_mode mode)
 		return "upon-critical-error";
 	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET:
 		return "upon-any-hang-no-reset";
+	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE:
+		return "upon-any-hang-no-reset-wait-for-release";
 	default:
 		return "<invalid>";
 	}
@@ -141,10 +330,10 @@ static const char *wedge_mode_to_string(enum xe_wedged_mode mode)
 
 static int wedge_validate_mode(struct xe_device *xe, unsigned int mode)
 {
-	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
+	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE) {
 		xe_dbg(xe, "wedged_mode: invalid value (%u)\n", mode);
 		return -EINVAL;
-	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRIOV_VF(xe) ||
+	} else if (xe_wedge_is_hanging_on_any(mode) && (IS_SRIOV_VF(xe) ||
 		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
 		xe_dbg(xe, "wedged_mode: (%u) %s mode is not supported for %s\n",
 		       mode, wedge_mode_to_string(mode),
@@ -160,11 +349,11 @@ static bool wedge_mode_needs_policy_update(struct xe_device *xe, enum xe_wedged_
 	if (xe->wedged.inconsistent_reset)
 		return true;
 
-	if (xe->wedged.mode == mode)
+	if (READ_ONCE(xe->wedged.mode) == mode)
 		return false;
 
-	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET ||
-	    mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+	if (xe_wedge_is_hanging_on_any(READ_ONCE(xe->wedged.mode)) ||
+	    xe_wedge_is_hanging_on_any(mode))
 		return true;
 
 	return false;
@@ -175,7 +364,7 @@ static int __wedge_mode_set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode m
 	bool enable_engine_reset;
 	int ret;
 
-	enable_engine_reset = (mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET);
+	enable_engine_reset = !xe_wedge_is_hanging_on_any(mode);
 	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
 						       enable_engine_reset);
 	if (ret)
@@ -216,20 +405,46 @@ static int wedge_mode_set_reset_policy(struct xe_device *xe, enum xe_wedged_mode
  */
 int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode)
 {
+	unsigned long flags;
+	enum xe_wedged_mode old_mode;
+	bool update_policy;
 	int ret;
 
 	ret = wedge_validate_mode(xe, mode);
 	if (ret)
 		return ret;
 
-	if (wedge_mode_needs_policy_update(xe, mode)) {
+	mutex_lock(&xe->wedged.mode_mutex);
+	spin_lock_irqsave(&xe->wedged.mode_lock, flags);
+	if (atomic_read(&xe->wedged.declare_pending) || READ_ONCE(xe->wedged.shutting_down)) {
+		spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+	old_mode = READ_ONCE(xe->wedged.mode);
+	spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
+
+	update_policy = wedge_mode_needs_policy_update(xe, mode);
+	if (update_policy) {
 		ret = wedge_mode_set_reset_policy(xe, mode);
 		if (ret)
-			return ret;
+			goto out_unlock;
 	}
 
-	xe->wedged.mode = mode;
+	spin_lock_irqsave(&xe->wedged.mode_lock, flags);
+	if (atomic_read(&xe->wedged.declare_pending)) {
+		spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
+		ret = update_policy ? wedge_mode_set_reset_policy(xe, old_mode) : 0;
+		if (!ret)
+			ret = -EBUSY;
+		goto out_unlock;
+	}
+	WRITE_ONCE(xe->wedged.mode, mode);
+	spin_unlock_irqrestore(&xe->wedged.mode_lock, flags);
+	ret = 0;
 
+out_unlock:
+	mutex_unlock(&xe->wedged.mode_mutex);
 	return ret;
 }
 
@@ -237,6 +452,9 @@ static void xe_wedge_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_device *xe = arg;
 
+	xe_wedge_prepare_fini(xe);
+	if (xe->wedged.pause_workqueue)
+		destroy_workqueue(xe->wedged.pause_workqueue);
 	disable_work_sync(&xe->wedged.work);
 
 	if (atomic_read(&xe->wedged.flag))
@@ -252,6 +470,10 @@ static void xe_wedge_fini(struct drm_device *drm, void *arg)
 int xe_wedge_init(struct xe_device *xe)
 {
 	INIT_WORK(&xe->wedged.work, wedge_work);
+	INIT_WORK(&xe->wedged.pause_work, wedge_pause_work);
+	xe->wedged.pause_workqueue = alloc_workqueue("xe_wedge_pause", WQ_UNBOUND, 1);
+	if (!xe->wedged.pause_workqueue)
+		return -ENOMEM;
 
 	xe->wedged.mode = wedge_validate_mode(xe, xe_modparam.wedged_mode) ?
 			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
index 3b5499dfc30d..3fef49d448f5 100644
--- a/drivers/gpu/drm/xe/xe_wedge.h
+++ b/drivers/gpu/drm/xe/xe_wedge.h
@@ -18,6 +18,9 @@ static inline bool xe_wedged(struct xe_device *xe)
 }
 
 void xe_wedge_declare(struct xe_device *xe, unsigned long method);
+void xe_wedge_declare_mode3(struct xe_device *xe);
+void xe_wedge_prepare_fini(struct xe_device *xe);
+int xe_wedge_set_reply(struct xe_device *xe, u32 reply);
 int xe_wedge_init(struct xe_device *xe);
 int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode);
 
diff --git a/drivers/gpu/drm/xe/xe_wedge_types.h b/drivers/gpu/drm/xe/xe_wedge_types.h
index e472c5fcbd26..855036e3f197 100644
--- a/drivers/gpu/drm/xe/xe_wedge_types.h
+++ b/drivers/gpu/drm/xe/xe_wedge_types.h
@@ -7,6 +7,9 @@
 #define _XE_WEDGE_TYPES_H_
 
 #include <linux/types.h>
+#include <linux/mutex.h>
+#include <linux/spinlock_types.h>
+#include <linux/wait.h>
 #include <linux/workqueue_types.h>
 
 /**
@@ -18,13 +21,26 @@
  * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
  *	any hang. In this mode, engine resets are disabled to avoid automatic
  *	recovery attempts. This mode is primarily intended for debugging hangs.
+ * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE: Stop submission
+ *	for inspection and wait for a debugfs skip or continue response.
  */
 enum xe_wedged_mode {
 	XE_WEDGED_MODE_NEVER = 0,
 	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
 	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
+	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE = 3,
 };
 
+/* Skip releases inspection without recovering the fault or restarting GTs. */
+#define XE_WEDGE_REPLY_CONTINUE 0xdeadbbbb
+#define XE_WEDGE_REPLY_SKIP 0xdeadf001
+
+static inline bool xe_wedge_is_hanging_on_any(enum xe_wedged_mode mode)
+{
+	return mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET ||
+		mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE;
+}
+
 /**
  * struct xe_wedge - Struct to control Wedged States and mode
  */
@@ -39,6 +55,26 @@ struct xe_wedge {
 	bool inconsistent_reset;
 	/** @work: Worker to defer non-atomic calls */
 	struct work_struct work;
+	/** @mode_mutex: Serializes mode changes and inspection teardown. */
+	struct mutex mode_mutex;
+	/** @mode_lock: Protects mode updates and inspection activation/replies. */
+	spinlock_t mode_lock;
+	/** @declare_pending: An inspection request owns the ioctl gate. */
+	atomic_t declare_pending;
+	/** @pause_work: Sleepable mode-3 stop and inspection worker. */
+	struct work_struct pause_work;
+	/** @pause_workqueue: Isolated queue for the indefinite inspection wait. */
+	struct workqueue_struct *pause_workqueue;
+	/** @pause_pm_ref: Queued worker's reference, protected by mode_lock. */
+	bool pause_pm_ref;
+	/** @pause_waitq: Wait for a reply or teardown. */
+	wait_queue_head_t pause_waitq;
+	/** @wait_active: Inspection is accepting replies under mode_lock. */
+	bool wait_active;
+	/** @shutting_down: Suppress new requests while tearing down mode 3. */
+	bool shutting_down;
+	/** @reply: Accepted debugfs response, protected by mode_lock. */
+	u32 reply;
 };
 
 #endif
-- 
2.43.0

