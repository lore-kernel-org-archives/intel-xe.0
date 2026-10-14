Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A11CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 05:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237AB10FAF5;
	Wed, 14 Oct 2026 05:52:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E6C10FACD
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 05:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791957163; x=1823493163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3TFm97xrzXW7WiAUJsoFHjWOEPq84yQcPXHXQn2TSDY=;
 b=d5j3ju40w0EXx1QW0eEjCtVp4cWew/jZ+9ypUUfgdlWXrjMVX2tkDN8T
 0ndwbkA9q6Z7PeP3q3Q/NqqX4BWvGiE02WTcTLwY6w8lL2Qvl4fbzOgi1
 SRzIaPNJRymES1dK7+GrbEw1wgfurJkGVNqoQXrBBRL1DCySnrlNxRgbJ
 dsgk49XE1DyBt2dg3HGbzYL7ewvtKUuEBzFE/Mn7Ntg8J0UnaR8u4ABIS
 RTU/HpF+/G8rhewzqleS2Ffnwj3402lq3xkdrZK08XSAyC4EzwIbjqGZh
 MMP5RbUHlgvQ5W3seFgWXr2+6Aq+N73QbdYbSodpSXjoi/J76xxKwT7Va A==;
X-CSE-ConnectionGUID: UOXosMKcQY2UwoimAehSRA==
X-CSE-MsgGUID: JGZOLsAcTuW8lGQkqgYuJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="679835"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="679835"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 22:52:43 -0700
X-CSE-ConnectionGUID: 9NLt6RhKRY235klHmA0amQ==
X-CSE-MsgGUID: 4+6p/Z4QRxab6CGAarVyIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1675723"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 13 Oct 2026 22:52:41 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v6 2/7] drm/xe: Drop xe_device_set_wedged_method()
Date: Wed, 14 Oct 2026 11:21:19 +0530
Message-ID: <20261014055215.330408-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014055215.330408-1-raag.jadav@intel.com>
References: <20261014055215.330408-1-raag.jadav@intel.com>
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

Commit 60439ac3f235 ("drm/xe: Add a helper function to set recovery
method") introduced xe_device_set_wedged_method() helper to allow setting
preferred recovery method before wedging the device, but also introduced
a flaw where the previously set method can be overwritten by concurrent
racing wedge call. This can result in unintended recovery method to be
sent to userspace and possibly failed recovery.

Drop xe_device_set_wedged_method() entirely and pass the recovery method
as part of xe_device_declare_wedged() argument, which places the preferred
recovery method on stack and avoids this issue.

Fixes: 60439ac3f235 ("drm/xe: Add a helper function to set recovery method")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
v2: Split fixes into separate patches (Rodrigo, Michal)
---
 drivers/gpu/drm/xe/xe_amc.c                |  3 ++-
 drivers/gpu/drm/xe/xe_device.c             | 27 ++++------------------
 drivers/gpu/drm/xe/xe_device.h             |  3 +--
 drivers/gpu/drm/xe/xe_gsc.c                |  3 ++-
 drivers/gpu/drm/xe/xe_gt.c                 |  3 ++-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c        |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c         |  5 ++--
 drivers/gpu/drm/xe/xe_mert.c               |  6 +++--
 drivers/gpu/drm/xe/xe_pci_error.c          |  3 ++-
 drivers/gpu/drm/xe/xe_ras.c                |  3 +--
 drivers/gpu/drm/xe/xe_survivability_mode.c |  3 +--
 11 files changed, 24 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
index 8ecadee6eea3..b7390a4ee3ce 100644
--- a/drivers/gpu/drm/xe/xe_amc.c
+++ b/drivers/gpu/drm/xe/xe_amc.c
@@ -160,7 +160,8 @@ static void xe_amc_work(struct work_struct *work)
 	case AMC_ALERT_OOB_RESET:
 	case AMC_ALERT_CATERR:
 		dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n", amc_alert[alert_reason]);
-		xe_device_declare_wedged(i2c_client_to_xe_device(client));
+		xe_device_declare_wedged(i2c_client_to_xe_device(client),
+					 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
 		break;
 	default:
 		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 22ae10958d7f..cd2decc24f78 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1378,29 +1378,16 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
  *   firmware and restore device to normal operation.
  */
 
-/**
- * xe_device_set_wedged_method - Set wedged recovery method
- * @xe: xe device instance
- * @method: recovery method to set
- *
- * Set wedged recovery method to be sent in drm wedged uevent.
- */
-void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
-{
-	xe->wedged.method = method;
-}
-
 #define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
 #define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
 
 /**
  * xe_device_declare_wedged - Declare device wedged
  * @xe: xe device instance
+ * @method: method(s) to be used for recovery
  *
  * This is a final state that can only be cleared with the recovery method
- * specified in the drm wedged uevent. The method can be set using
- * xe_device_set_wedged_method before declaring the device as wedged. If no method
- * is set, reprobe (unbind/re-bind) will be sent by default.
+ * specified in the drm wedged uevent.
  *
  * In this state every IOCTL will be blocked so the GT cannot be used.
  * In general it will be called upon any critical error such as gt reset
@@ -1411,7 +1398,7 @@ void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
  * snapshot capture. In this mode, GT reset won't be attempted so the state of
  * the issue is preserved for further debugging.
  */
-void xe_device_declare_wedged(struct xe_device *xe)
+void xe_device_declare_wedged(struct xe_device *xe, unsigned long method)
 {
 	struct xe_gt *gt;
 	u8 id;
@@ -1442,14 +1429,10 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		 * it available to the user for debugging.
 		 */
 		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
-			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
-		/* If no wedge recovery method is set, use default */
-		else if (!xe->wedged.method)
-			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
-						    DRM_WEDGE_RECOVERY_BUS_RESET);
+			method = DRM_WEDGE_RECOVERY_NONE;
 
 		/* Notify userspace of wedged device */
-		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
+		drm_dev_wedged_event(&xe->drm, method, NULL);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 80bda9b548d5..9f35370c0851 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -264,8 +264,7 @@ static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
 }
 #endif
 
-void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
-void xe_device_declare_wedged(struct xe_device *xe);
+void xe_device_declare_wedged(struct xe_device *xe, unsigned long method);
 int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
 const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);
 
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 524ac56bdcc7..2bbe0f20ff8d 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -340,7 +340,8 @@ static int gsc_er_complete(struct xe_gt *gt)
 		 * declare the device as wedged.
 		 */
 		xe_gt_err(gt, "GSC ER timed out!\n");
-		xe_device_declare_wedged(gt_to_xe(gt));
+		xe_device_declare_wedged(gt_to_xe(gt),
+					 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
 		return -EIO;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index d8bf538ceaff..497b2f59c104 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -992,7 +992,8 @@ static void gt_reset_worker(struct work_struct *w)
 
 err_fail:
 	xe_log_err_fatal(gt, GT, err, "reset failed\n");
-	xe_device_declare_wedged(gt_to_xe(gt));
+	xe_device_declare_wedged(gt_to_xe(gt),
+				 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
 err_pm_put:
 	xe_pm_runtime_put(gt_to_xe(gt));
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 37899fcf5b22..28ec83bb8100 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1462,7 +1462,7 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 fail:
 	vf_post_migration_abort(gt);
 	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
-	xe_device_declare_wedged(xe);
+	xe_device_declare_wedged(xe, DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
 	return;
 
 queue:
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7ce73489c35f..e2a0b989cfc8 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1453,7 +1453,7 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
 	if (xe_device_wedged(xe))
 		return true;
 
-	xe_device_declare_wedged(xe);
+	xe_device_declare_wedged(xe, DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
 
 	return true;
 }
@@ -1780,7 +1780,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	}
 
 	if (wedge_device)
-		xe_device_declare_wedged(gt_to_xe(q->gt));
+		xe_device_declare_wedged(gt_to_xe(q->gt),
+					 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
 
 	/*
 	 * We want the job added back to the pending list so it gets freed; this
diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
index 32700c19a1df..934be933d57f 100644
--- a/drivers/gpu/drm/xe/xe_mert.c
+++ b/drivers/gpu/drm/xe/xe_mert.c
@@ -74,7 +74,8 @@ static void mert_handle_cat_error(struct xe_device *xe)
 		break;
 	case CATERR_UNMAPPED_GGTT:
 		xe_sriov_err(xe, "MERT: CAT_ERR: Access to an unmapped GGTT!\n");
-		xe_device_declare_wedged(xe);
+		xe_device_declare_wedged(xe,
+					 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
 		break;
 	case CATERR_LMTT_FAULT:
 		xe_sriov_dbg_ratelimited(xe, "MERT: CAT_ERR: VF%u LMTT fault!\n", vfid);
@@ -82,7 +83,8 @@ static void mert_handle_cat_error(struct xe_device *xe)
 		break;
 	default:
 		xe_sriov_err(xe, "MERT: Unexpected CAT_ERR code=%#x!\n", code);
-		xe_device_declare_wedged(xe);
+		xe_device_declare_wedged(xe,
+					 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
 		break;
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 79ce0c671549..fdecd3e0b9a9 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -86,7 +86,8 @@ static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
 
 	/* User wants to debug the error, prevent reset */
 	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
-		xe_device_declare_wedged(xe);
+		xe_device_declare_wedged(xe,
+					 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
 		return PCI_ERS_RESULT_DISCONNECT;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 7a85735c57d5..fe16a4106060 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -321,8 +321,7 @@ static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
 
 static void punit_error_handler(struct xe_device *xe)
 {
-	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_COLD_RESET);
-	xe_device_declare_wedged(xe);
+	xe_device_declare_wedged(xe, DRM_WEDGE_RECOVERY_COLD_RESET);
 }
 
 static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 45d44ebe288b..ca031576fecb 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -446,8 +446,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
 	xe_log_err(xe, SURVIVABILITY, 0, "Runtime Mode enabled!\n");
 
-	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
-	xe_device_declare_wedged(xe);
+	xe_device_declare_wedged(xe, DRM_WEDGE_RECOVERY_VENDOR);
 
 	xe_log_err(xe, SURVIVABILITY, 0, "Firmware flash required!\n");
 	xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
-- 
2.43.0

