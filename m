Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3FCC61DF0
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 04:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0733A10E25E;
	Mon, 31 Aug 2026 04:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqmjfxOv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA4910E5CF
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 04:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788150427; x=1819686427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+A6z6/jZspNKl+k+blD/idZOO+sy/TEXzy+G+DK+Kgc=;
 b=bqmjfxOvRoDJ/TEBFXcuoCWe0kRXlS4FtijMq7W8IYd9NnW/FI/Annet
 ds96+Ki0ZXUFqFk0nMTTjW3PF4h3P95OZC0aw+NkxDtoweItYtmLWZeVi
 lfufUk8zGH00NZuGVTE/gHgQSeVfGqx9xjaGJBcOeXzcHfFZ/XPasgck0
 L5/WUgEPy+nYPx0Y8P2MmjR9u4sEuKJBzSDBGywN95bA44JJgy7GGCEnv
 uDlzMWjDlODK8sT+VhMpbNVQUJeshPMWDYi4fCwOpEyv9mkCPDCmk/xiB
 8EYi3eda97ytip4xSpia2XueuCe1LzgjOFjeNooSPCWzeKrPoUAjfItwZ A==;
X-CSE-ConnectionGUID: bUaqxDSSRhq68XuJqSjEqg==
X-CSE-MsgGUID: lZVBBafBQaCnxykgon69sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106072238"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="106072238"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 21:27:07 -0700
X-CSE-ConnectionGUID: d4EfTQx+S3GCdZcOZ4n7Vg==
X-CSE-MsgGUID: dHSZBBfAQrOB+HgPQS1TIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="272878126"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 30 Aug 2026 21:27:03 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 5/5] drm/xe/wedge: Update naming to match with xe_wedge
Date: Mon, 31 Aug 2026 09:55:53 +0530
Message-ID: <20260831042633.1760474-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831042633.1760474-1-raag.jadav@intel.com>
References: <20260831042633.1760474-1-raag.jadav@intel.com>
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

Now that we have a dedicated xe_wedge component, update all its function
names accordingly.

No functional impact.

Suggested-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c |  2 +-
 drivers/gpu/drm/xe/xe_amc.c                 |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                  |  2 +-
 drivers/gpu/drm/xe/xe_device.c              | 10 +++---
 drivers/gpu/drm/xe/xe_gsc.c                 |  2 +-
 drivers/gpu/drm/xe/xe_gt.c                  | 10 +++---
 drivers/gpu/drm/xe/xe_gt.h                  |  2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |  2 +-
 drivers/gpu/drm/xe/xe_guc.c                 |  4 +--
 drivers/gpu/drm/xe/xe_guc.h                 |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c              |  6 ++--
 drivers/gpu/drm/xe/xe_guc_rc.c              |  4 +--
 drivers/gpu/drm/xe/xe_guc_submit.c          | 12 ++++----
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c       |  2 +-
 drivers/gpu/drm/xe/xe_mert.c                |  4 +--
 drivers/gpu/drm/xe/xe_pci_error.c           |  8 ++---
 drivers/gpu/drm/xe/xe_ras.c                 |  4 +--
 drivers/gpu/drm/xe/xe_sriov_pf.c            |  2 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c  |  4 +--
 drivers/gpu/drm/xe/xe_uc.c                  |  6 ++--
 drivers/gpu/drm/xe/xe_uc.h                  |  2 +-
 drivers/gpu/drm/xe/xe_wedge.c               | 34 ++++++++++-----------
 drivers/gpu/drm/xe/xe_wedge.h               | 10 +++---
 23 files changed, 68 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
index 27740b40c8ae..4ba9484a421d 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
@@ -123,7 +123,7 @@ int xe_kunit_helper_xe_device_live_test_init(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
 	kunit_info(test, "running on %s device\n", xe->info.platform_name);
 
-	KUNIT_ASSERT_FALSE(test, xe_device_wedged(xe));
+	KUNIT_ASSERT_FALSE(test, xe_wedged(xe));
 	xe_pm_runtime_get(xe);
 	KUNIT_ASSERT_EQ(test, 0, kunit_add_action_or_reset(test, put_xe_pm_runtime, xe));
 
diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
index 8ecadee6eea3..70ceb454b926 100644
--- a/drivers/gpu/drm/xe/xe_amc.c
+++ b/drivers/gpu/drm/xe/xe_amc.c
@@ -160,7 +160,7 @@ static void xe_amc_work(struct work_struct *work)
 	case AMC_ALERT_OOB_RESET:
 	case AMC_ALERT_CATERR:
 		dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n", amc_alert[alert_reason]);
-		xe_device_declare_wedged(i2c_client_to_xe_device(client));
+		xe_wedge_declare(i2c_client_to_xe_device(client));
 		break;
 	default:
 		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index dde309821237..0545c18375be 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2094,7 +2094,7 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
 	int err = 0;
 	int idx;
 
-	if (xe_device_wedged(xe) || !drm_dev_enter(&xe->drm, &idx))
+	if (xe_wedged(xe) || !drm_dev_enter(&xe->drm, &idx))
 		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
 
 	ret = xe_bo_cpu_fault_fastpath(vmf, xe, bo, needs_rpm);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d3a7034fac01..cf8563a0ced9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -225,7 +225,7 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
 	long ret;
 
-	if (xe_device_wedged(xe))
+	if (xe_wedged(xe))
 		return -ECANCELED;
 
 	ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
@@ -243,7 +243,7 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
 	long ret;
 
-	if (xe_device_wedged(xe))
+	if (xe_wedged(xe))
 		return -ECANCELED;
 
 	ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
@@ -829,7 +829,7 @@ int xe_device_probe_early(struct xe_device *xe)
 	 */
 	assert_lmem_ready(xe);
 
-	xe_device_wedged_init_early(xe);
+	xe_wedge_init_early(xe);
 
 	err = xe_device_vram_alloc(xe);
 	if (err)
@@ -1137,14 +1137,14 @@ int xe_device_probe(struct xe_device *xe)
 
 	detect_preproduction_hw(xe);
 
-	err = xe_device_wedged_init(xe);
+	err = xe_wedge_init(xe);
 	if (err)
 		goto err_unregister_display;
 
 	/*
 	 * Process and log any errors detected by hardware. Possible results can
 	 * include declaring the device as wedged, which must be done only after
-	 * xe_device_wedged_fini() is registered.
+	 * xe_wedge_fini() is registered.
 	 */
 	xe_ras_process_errors(xe);
 
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 524ac56bdcc7..8650cee31ae6 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -340,7 +340,7 @@ static int gsc_er_complete(struct xe_gt *gt)
 		 * declare the device as wedged.
 		 */
 		xe_gt_err(gt, "GSC ER timed out!\n");
-		xe_device_declare_wedged(gt_to_xe(gt));
+		xe_wedge_declare(gt_to_xe(gt));
 		return -EIO;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 5c201327a747..caea0557ce13 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -926,7 +926,7 @@ static void gt_reset_worker(struct work_struct *w)
 	unsigned int fw_ref;
 	int err;
 
-	if (xe_device_wedged(gt_to_xe(gt)))
+	if (xe_wedged(gt_to_xe(gt)))
 		goto err_pm_put;
 
 	if (xe_device_is_in_reset(gt_to_xe(gt)))
@@ -985,7 +985,7 @@ static void gt_reset_worker(struct work_struct *w)
 
 err_fail:
 	xe_log_err_fatal(gt, GT, err, "reset failed\n");
-	xe_device_declare_wedged(gt_to_xe(gt));
+	xe_wedge_declare(gt_to_xe(gt));
 err_pm_put:
 	xe_pm_runtime_put(gt_to_xe(gt));
 }
@@ -1013,7 +1013,7 @@ static void gt_wedge_worker(struct work_struct *w)
 {
 	struct xe_gt *gt = container_of(w, typeof(*gt), wedge.worker);
 
-	xe_uc_declare_wedged(&gt->uc);
+	xe_uc_wedge_declare(&gt->uc);
 	xe_tlb_inval_reset(&gt->tlb_inval);
 }
 
@@ -1197,13 +1197,13 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_gt *gt)
 }
 
 /**
- * xe_gt_declare_wedged() - Declare GT wedged
+ * xe_gt_wedge_declare() - Declare GT wedged
  * @gt: the GT object
  *
  * Wedge the GT which stops all submission, saves desired debug state, and
  * cleans up anything which could timeout.
  */
-void xe_gt_declare_wedged(struct xe_gt *gt)
+void xe_gt_wedge_declare(struct xe_gt *gt)
 {
 	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
 
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 92d934d50244..7b6952fe804c 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -40,7 +40,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
 int xe_gt_init_early(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
 void xe_gt_mmio_init(struct xe_gt *gt);
-void xe_gt_declare_wedged(struct xe_gt *gt);
+void xe_gt_wedge_declare(struct xe_gt *gt);
 int xe_gt_record_default_lrcs(struct xe_gt *gt);
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 37899fcf5b22..097f46436924 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1462,7 +1462,7 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 fail:
 	vf_post_migration_abort(gt);
 	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
-	xe_device_declare_wedged(xe);
+	xe_wedge_declare(xe);
 	return;
 
 queue:
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index c7f8bbd4cb92..23a4f5064476 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1813,13 +1813,13 @@ int xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 }
 
 /**
- * xe_guc_declare_wedged() - Declare GuC wedged
+ * xe_guc_wedge_declare() - Declare GuC wedged
  * @guc: the GuC object
  *
  * Wedge the GuC which stops all submission, saves desired debug state, and
  * cleans up anything which could timeout.
  */
-void xe_guc_declare_wedged(struct xe_guc *guc)
+void xe_guc_wedge_declare(struct xe_guc *guc)
 {
 	xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);
 
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 61e3ee19a59b..8e2c0486f85a 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -60,7 +60,7 @@ void xe_guc_reset_wait(struct xe_guc *guc);
 void xe_guc_stop_prepare(struct xe_guc *guc);
 void xe_guc_stop(struct xe_guc *guc);
 int xe_guc_start(struct xe_guc *guc);
-void xe_guc_declare_wedged(struct xe_guc *guc);
+void xe_guc_wedge_declare(struct xe_guc *guc);
 bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc);
 bool xe_guc_has_paging_engine(struct xe_guc *guc);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 5c4733da385c..eca5776a0420 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1062,7 +1062,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 	xe_gt_assert(gt, g2h_len || !num_g2h);
 	lockdep_assert_held(&ct->lock);
 
-	if (xe_device_wedged(ct_to_xe(ct))) {
+	if (xe_wedged(ct_to_xe(ct))) {
 		ret = -ENOTRECOVERABLE;
 		goto out;
 	}
@@ -1474,7 +1474,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	if (g2h_fence.fail) {
 		if (g2h_fence.cancel) {
 			xe_gt_dbg(gt, "H2G request %#x canceled!\n", action[0]);
-			ret = xe_device_wedged(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
+			ret = xe_wedged(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
 			goto unlock;
 		}
 		xe_gt_err(gt, "H2G request %#x failed: error %#x hint %#x\n",
@@ -1813,7 +1813,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
 	lockdep_assert_held(&ct->fast_lock);
 
-	if (xe_device_wedged(xe))
+	if (xe_wedged(xe))
 		return -ENOTRECOVERABLE;
 
 	if (ct->state == XE_GUC_CT_STATE_DISABLED)
diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
index 99fa127b261f..53c594eba396 100644
--- a/drivers/gpu/drm/xe/xe_guc_rc.c
+++ b/drivers/gpu/drm/xe/xe_guc_rc.c
@@ -40,7 +40,7 @@ static int guc_action_setup_gucrc(struct xe_guc *guc, u32 control)
 	int ret;
 
 	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret && !(xe_device_wedged(guc_to_xe(guc)) && ret == -ECANCELED))
+	if (ret && !(xe_wedged(guc_to_xe(guc)) && ret == -ECANCELED))
 		xe_gt_err(guc_to_gt(guc),
 			  "GuC RC setup %s(%u) failed (%pe)\n",
 			   control == GUCRC_HOST_CONTROL ? "HOST_CONTROL" :
@@ -73,7 +73,7 @@ static void xe_guc_rc_fini_hw(void *arg)
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
 
-	if (xe_device_wedged(xe))
+	if (xe_wedged(xe))
 		return;
 
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 99d8c807ff05..4d8e1c11a0f3 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1387,10 +1387,10 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
 	if (xe->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
 		return false;
 
-	if (xe_device_wedged(xe))
+	if (xe_wedged(xe))
 		return true;
 
-	xe_device_declare_wedged(xe);
+	xe_wedge_declare(xe);
 
 	return true;
 }
@@ -1597,7 +1597,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	if (!exec_queue_killed(q))
 		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
 	else
-		wedged = xe_device_wedged(xe);
+		wedged = xe_wedged(xe);
 
 	set_exec_queue_banned(q);
 
@@ -1708,7 +1708,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	}
 
 	if (wedge_device)
-		xe_device_declare_wedged(gt_to_xe(q->gt));
+		xe_wedge_declare(gt_to_xe(q->gt));
 
 	/*
 	 * We want the job added back to the pending list so it gets freed; this
@@ -2452,7 +2452,7 @@ static int guc_exec_queue_wait_suspend_done(struct xe_exec_queue *q, bool blocki
 						       WAIT_COND, HZ * 5);
 	}
 
-	if (!blocking && vf_recovery(guc) && !xe_device_wedged(xe))
+	if (!blocking && vf_recovery(guc) && !xe_wedged(xe))
 		return -EAGAIN;
 
 	if (!ret)
@@ -2694,7 +2694,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
 
 void xe_guc_submit_reset_wait(struct xe_guc *guc)
 {
-	wait_event(guc->ct.wq, xe_device_wedged(guc_to_xe(guc)) ||
+	wait_event(guc->ct.wq, xe_wedged(guc_to_xe(guc)) ||
 		   !xe_guc_read_stopped(guc));
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 111fef781b2a..2fd260a937d6 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -77,7 +77,7 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 		};
 
 		return send_tlb_inval(guc, action, ARRAY_SIZE(action));
-	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
+	} else if (xe_device_uc_enabled(xe) && !xe_wedged(xe)) {
 		struct xe_mmio *mmio = &gt->mmio;
 
 		if (IS_SRIOV_VF(xe))
diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
index 32700c19a1df..894ce2b8c2cb 100644
--- a/drivers/gpu/drm/xe/xe_mert.c
+++ b/drivers/gpu/drm/xe/xe_mert.c
@@ -74,7 +74,7 @@ static void mert_handle_cat_error(struct xe_device *xe)
 		break;
 	case CATERR_UNMAPPED_GGTT:
 		xe_sriov_err(xe, "MERT: CAT_ERR: Access to an unmapped GGTT!\n");
-		xe_device_declare_wedged(xe);
+		xe_wedge_declare(xe);
 		break;
 	case CATERR_LMTT_FAULT:
 		xe_sriov_dbg_ratelimited(xe, "MERT: CAT_ERR: VF%u LMTT fault!\n", vfid);
@@ -82,7 +82,7 @@ static void mert_handle_cat_error(struct xe_device *xe)
 		break;
 	default:
 		xe_sriov_err(xe, "MERT: Unexpected CAT_ERR code=%#x!\n", code);
-		xe_device_declare_wedged(xe);
+		xe_wedge_declare(xe);
 		break;
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 79ce0c671549..23bb468f199b 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -22,7 +22,7 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
 
 	/*
 	 * Wedge the device to prevent userspace access but do not send the uevent.
-	 * xe_device_wedged_fini() releases runtime pm if wedged flag is set, so acquire a runtime
+	 * xe_wedge_fini() releases runtime pm if wedged flag is set, so acquire a runtime
 	 * pm reference to avoid underflow.
 	 */
 	if (!atomic_xchg(&xe->wedged.flag, 1))
@@ -31,7 +31,7 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
 	xe_device_set_in_reset(xe);
 
 	for_each_gt(gt, xe, id)
-		xe_gt_declare_wedged(gt);
+		xe_gt_wedge_declare(gt);
 
 	pci_disable_device(pdev);
 }
@@ -61,7 +61,7 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
 		return PCI_ERS_RESULT_DISCONNECT;
 
 	/* If the device is already wedged or in survivability mode, do not attempt recovery */
-	if (xe_survivability_mode_is_boot_enabled(xe) || xe_device_wedged(xe))
+	if (xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe))
 		return PCI_ERS_RESULT_DISCONNECT;
 
 	switch (state) {
@@ -86,7 +86,7 @@ static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
 
 	/* User wants to debug the error, prevent reset */
 	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
-		xe_device_declare_wedged(xe);
+		xe_wedge_declare(xe);
 		return PCI_ERS_RESULT_DISCONNECT;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index de4cb9ef7355..5a45b97b5ae1 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -320,8 +320,8 @@ static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
 
 static void punit_error_handler(struct xe_device *xe)
 {
-	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_COLD_RESET);
-	xe_device_declare_wedged(xe);
+	xe_wedge_set_method(xe, DRM_WEDGE_RECOVERY_COLD_RESET);
+	xe_wedge_declare(xe);
 }
 
 static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index 33bd754d138f..b45f5008a114 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -157,7 +157,7 @@ int xe_sriov_pf_wait_ready(struct xe_device *xe)
 	unsigned int id;
 	int err;
 
-	if (xe_device_wedged(xe))
+	if (xe_wedged(xe))
 		return -ECANCELED;
 
 	for_each_gt(gt, xe, id) {
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 45d44ebe288b..73adc9369eb8 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -446,8 +446,8 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
 	xe_log_err(xe, SURVIVABILITY, 0, "Runtime Mode enabled!\n");
 
-	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
-	xe_device_declare_wedged(xe);
+	xe_wedge_set_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
+	xe_wedge_declare(xe);
 
 	xe_log_err(xe, SURVIVABILITY, 0, "Firmware flash required!\n");
 	xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 65f59f06177f..686c28856014 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -326,15 +326,15 @@ void xe_uc_runtime_resume(struct xe_uc *uc)
 }
 
 /**
- * xe_uc_declare_wedged() - Declare UC wedged
+ * xe_uc_wedge_declare() - Declare UC wedged
  * @uc: the UC object
  *
  * Wedge the UC which stops all submission, saves desired debug state, and
  * cleans up anything which could timeout.
  */
-void xe_uc_declare_wedged(struct xe_uc *uc)
+void xe_uc_wedge_declare(struct xe_uc *uc)
 {
 	xe_gt_assert(uc_to_gt(uc), uc_to_xe(uc)->wedged.mode);
 
-	xe_guc_declare_wedged(&uc->guc);
+	xe_guc_wedge_declare(&uc->guc);
 }
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 255a54a8f876..23bc0ce1c42f 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -21,6 +21,6 @@ int xe_uc_start(struct xe_uc *uc);
 void xe_uc_suspend_prepare(struct xe_uc *uc);
 int xe_uc_suspend(struct xe_uc *uc);
 int xe_uc_sanitize_reset(struct xe_uc *uc);
-void xe_uc_declare_wedged(struct xe_uc *uc);
+void xe_uc_wedge_declare(struct xe_uc *uc);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
index 04d8c5666be1..5982ea7e0f57 100644
--- a/drivers/gpu/drm/xe/xe_wedge.c
+++ b/drivers/gpu/drm/xe/xe_wedge.c
@@ -54,24 +54,24 @@
  */
 
 /**
- * xe_device_set_wedged_method() - Set wedge recovery method
+ * xe_wedge_set_method() - Set wedge recovery method
  * @xe: xe device instance
  * @method: recovery method to set
  *
  * Set wedge recovery method to be sent in drm wedged uevent.
  */
-void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
+void xe_wedge_set_method(struct xe_device *xe, unsigned long method)
 {
 	xe->wedged.method = method;
 }
 
 /**
- * xe_device_wedged() - Check for wedged device
+ * xe_wedged() - Check for wedged device
  * @xe: xe device instance
  *
  * Returns: %true if device is wedged, %false otherwise.
  */
-bool xe_device_wedged(struct xe_device *xe)
+bool xe_wedged(struct xe_device *xe)
 {
 	return atomic_read(&xe->wedged.flag);
 }
@@ -86,11 +86,11 @@ static void wedge_work(struct work_struct *work)
 	 * it available to the user for debugging.
 	 */
 	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
-		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
+		xe_wedge_set_method(xe, DRM_WEDGE_RECOVERY_NONE);
 	/* If no wedge recovery method is set, use default */
 	else if (!xe->wedged.method)
-		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
-					    DRM_WEDGE_RECOVERY_BUS_RESET);
+		xe_wedge_set_method(xe, DRM_WEDGE_RECOVERY_REBIND |
+					DRM_WEDGE_RECOVERY_BUS_RESET);
 
 	/* Notify userspace of wedged device */
 	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
@@ -100,12 +100,12 @@ static void wedge_work(struct work_struct *work)
 #define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
 
 /**
- * xe_device_declare_wedged() - Declare device wedged
+ * xe_wedge_declare() - Declare device wedged
  * @xe: xe device instance
  *
  * This is a final state that can only be cleared with the recovery method
  * specified in the drm wedged uevent. The method can be set using
- * xe_device_set_wedged_method() before declaring the device as wedged.
+ * xe_wedge_set_method() before declaring the device as wedged.
  * If no method is set, rebind/bus-reset will be sent by default.
  *
  * In this state every IOCTL will be blocked so the GT cannot be used.
@@ -120,7 +120,7 @@ static void wedge_work(struct work_struct *work)
  * Since the wedge handling is done as part of worker thread, this is safe for
  * atomic callers.
  */
-void xe_device_declare_wedged(struct xe_device *xe)
+void xe_wedge_declare(struct xe_device *xe)
 {
 	struct xe_gt *gt;
 	u8 id;
@@ -143,7 +143,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
 			WEDGED_URL, XE_BUG_URL);
 
 	for_each_gt(gt, xe, id)
-		xe_gt_declare_wedged(gt);
+		xe_gt_wedge_declare(gt);
 
 	schedule_work(&xe->wedged.work);
 }
@@ -255,10 +255,10 @@ int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode)
 }
 
 /**
- * xe_device_wedged_init_early() - Set wedge mode passed as module parameter
+ * xe_wedge_init_early() - Set wedge mode passed as module parameter
  * @xe: xe device instance
  */
-void xe_device_wedged_init_early(struct xe_device *xe)
+void xe_wedge_init_early(struct xe_device *xe)
 {
 	xe->wedged.mode = wedge_validate_mode(xe, xe_modparam.wedged_mode) ?
 			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
@@ -266,7 +266,7 @@ void xe_device_wedged_init_early(struct xe_device *xe)
 	       xe->wedged.mode, wedge_mode_to_string(xe->wedged.mode));
 }
 
-static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
+static void xe_wedge_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_device *xe = arg;
 
@@ -277,12 +277,12 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
 }
 
 /**
- * xe_device_wedged_init() - Initialize wedge
+ * xe_wedge_init() - Initialize wedge
  * @xe: xe device instance
  */
-int xe_device_wedged_init(struct xe_device *xe)
+int xe_wedge_init(struct xe_device *xe)
 {
 	INIT_WORK(&xe->wedged.work, wedge_work);
 
-	return drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
+	return drmm_add_action_or_reset(&xe->drm, xe_wedge_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
index b31a682dbff8..f72c7ccd1f05 100644
--- a/drivers/gpu/drm/xe/xe_wedge.h
+++ b/drivers/gpu/drm/xe/xe_wedge.h
@@ -11,11 +11,11 @@
 struct xe_device;
 enum xe_wedged_mode;
 
-void xe_device_declare_wedged(struct xe_device *xe);
-bool xe_device_wedged(struct xe_device *xe);
-void xe_device_wedged_init_early(struct xe_device *xe);
-int xe_device_wedged_init(struct xe_device *xe);
-void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
+bool xe_wedged(struct xe_device *xe);
+void xe_wedge_declare(struct xe_device *xe);
+void xe_wedge_init_early(struct xe_device *xe);
+int xe_wedge_init(struct xe_device *xe);
+void xe_wedge_set_method(struct xe_device *xe, unsigned long method);
 int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode);
 
 #endif
-- 
2.43.0

