Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BB5C43458
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 21:40:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53F910F71C;
	Fri, 26 Jun 2026 21:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U7FwiG7N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7060B10E425
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 21:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782510039; x=1814046039;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=Rjq/adRmfGKOjmKssz9jWwx/+5q3T4qrArZ8bp5uAgQ=;
 b=U7FwiG7NncdyrufRGTBcj2KurBu68ER3CHIuabGG+qEcmKSFYOuViLW0
 lpGcXgs9fNgPRytx9AsSEWSl3BL3Pmf4SNpj27I0kceCJHvb3ELhS117L
 /Ewv7f3B6yZ16wgaDEjsjk4HHBc0wZuGIDa3kF52dJtWparTxVVsMssMi
 ssBQ3nJqYXhqgdODzwaCvKMwqBo3lh4z7X4sT/IVQT7zZrFbjrJ01ZLKC
 Uf4OyYAVHD+ZMdVoraIhZvxCMpw4l1uUMfE8oG8vlgfxpTmuwqkKDwnPF
 NHRvqt6EFSuZhwVsHZVl453XwLRoZdI3zRW9uCqpU6U6YW0RNwAflecaW A==;
X-CSE-ConnectionGUID: ASShWDAwR7uWLNqNNOuDLw==
X-CSE-MsgGUID: 3S/8L7mfRdiizUPPZIeyyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="85854952"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; d="scan'208";a="85854952"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 14:40:39 -0700
X-CSE-ConnectionGUID: YpztB0hiQg+kODbcTj4F7w==
X-CSE-MsgGUID: F2P9/HrSRiCVWsbN0TFr2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; d="scan'208";a="255390907"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.134])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 14:40:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 26 Jun 2026 14:39:35 -0700
Subject: [PATCH] drm/xe: Drop 'force_execlist' module parameter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-remove_execlists-v1-1-2584d8c4a6f2@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3M2wpAQBRG4VfRvjbFYBpeRZLGP+xyarak5N1NL
 r+LtR4SBIZQkzwUcLHwvkXkaUJuHrYJisdo0pk2mdFGBaz7hR433MJyiiorb7Utau/sQDE7Ajz
 f/7Lt3vcDCOGKxGIAAAA=
X-Change-ID: 20260626-remove_execlists-45f82839fc8a
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6885;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=Rjq/adRmfGKOjmKssz9jWwx/+5q3T4qrArZ8bp5uAgQ=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqPvHWeQNevzkfyGQznaMP+H5UJdRX2gz5DQGME
 wZoFfntxLeJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaj7x1gAKCRBNeSQFyHKQ
 BJXwD/90LKSC/3WzxizQGWAuetW6grp1ArWX9Ln3gBssNTGkPWIkxRibAkOPZYHILBxnsGaJpyV
 IpOVlHPnw8uasG1dktg3YP4ok5du5pzWhrqZse+pnsf4MKlQfdOsEnCMNxSPfyT8cf9i7o1dqDv
 3+Q02Ma36IJXEW9xV11IsCNEIw3QXA4Z+t0adLnn15ly6it9vWRQzkE82RCi0AcdhWmGXnEzF2C
 C/82M0d4m8safQ+oRIZukyjY9F9rYR5tdkwa5Iy6JGSHIcOXIAV+NHylvsPv5y+59Ay3ORrLA7p
 AEloRMCf3n8ZIjc1JzLL/fsGdBPkNWdI8E6hrG4GlKOJ7vGk3x/eByljcIi6pYn5aaaHdeEVKcL
 8DwiHf1eA1xBm0zo1lCj9kiaWJmR6Y3fZOXkUDLtPNkjnJcGJ1/w8JvRZ77tfgZ27wYkAEwEaz5
 U+s6Ga9FF5rhvAo0wN2ssx+mvAi0RhfIK6bfNs9vaGfCvGa0dtSU2lVbhmodWxLIbNN1B4fr2G5
 Go1pKPkTUFbHfHNl8jzbX5ojuh1Lah86AYZ1zUu+G2mD0fOaKzcAr29zqdeyazf3BPULOHvIzta
 ZOmZ9SKQwUfRcSYxxnWCMzWshfs6gyXRkHb/tsW6Z5VUgv1J7n/xHNFOCBEIKnikdzfNja/b+Jp
 VQDvLQHyTCopEiQ==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

During very early development of the Xe driver the force_execlist module
parameter could be used to exercise some parts of the driver in a
GuC-less manner.  This was primarily intended to ensure that the driver
was being designed and developed with proper modularity and layering;
use of the GuC firmware has always been considered mandatory for any
real Xe driver operation.  The "execlist" implementation in the driver
was never completed, and has further bitrotted over time to the point
where it hangs during execution of even the simplest IGT tests like
xe_exec_store now.

Drop the force_execlist parameter; it's broken and isn't going to get
fixed.  In the (very unlikely) event that we decide to bring something
like this back in the future, it would need to be as a per-device
configfs setting rather than a driver-wide module parameter.

The "execlist" implementation is now dead code, so it will probably also
be removed sometime in the near future.  There's a bit more general
refactoring we might want to do first before we take that step, so for
now we're just removing the module parameter.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c       | 1 -
 drivers/gpu/drm/xe/xe_device.h        | 2 +-
 drivers/gpu/drm/xe/xe_device_types.h  | 2 --
 drivers/gpu/drm/xe/xe_gt_mcr.c        | 3 +--
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 6 ------
 drivers/gpu/drm/xe/xe_module.c        | 3 ---
 drivers/gpu/drm/xe/xe_module.h        | 1 -
 drivers/gpu/drm/xe/xe_pci.c           | 1 -
 8 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 22b471303984..3c018dbccc07 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -117,7 +117,6 @@ static int info(struct seq_file *m, void *data)
 	drm_printf(&p, "revid %d\n", xe->info.revid);
 	drm_printf(&p, "tile_count %d\n", xe->info.tile_count);
 	drm_printf(&p, "vm_max_level %d\n", xe->info.vm_max_level);
-	drm_printf(&p, "force_execlist %s\n", str_yes_no(xe->info.force_execlist));
 	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
 	drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
 	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe->info.skip_guc_pc));
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 975768a6a9c8..8056d8bd7d6d 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -116,7 +116,7 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
 
 static inline bool xe_device_uc_enabled(struct xe_device *xe)
 {
-	return !xe->info.force_execlist;
+	return true;
 }
 
 #define for_each_tile(tile__, xe__, id__) \
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4e2f115f14e2..46a9e9fad7a9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -144,8 +144,6 @@ struct xe_device {
 		 * Keep all flags below alphabetically sorted
 		 */
 
-		/** @info.force_execlist: Forced execlist submission */
-		u8 force_execlist:1;
 		/** @info.has_access_counter: Device supports access counter */
 		u8 has_access_counter:1;
 		/** @info.has_asid: Has address space ID */
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index d11cc9e25cdb..a97b236dab7c 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -404,8 +404,7 @@ static unsigned int dss_per_group(struct xe_gt *gt)
 	 * Some older platforms don't have tables or don't have complete tables.
 	 * Newer platforms should always have the required info.
 	 */
-	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000 &&
-	    !gt_to_xe(gt)->info.force_execlist)
+	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000)
 		xe_gt_err(gt, "Slice/Subslice counts missing from hwconfig table; using typical fallback values\n");
 
 	if (gt_to_xe(gt)->info.platform == XE_PVC)
diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index cf6d106e6036..046d0655122f 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -208,9 +208,6 @@ static int send_tlb_inval_asid_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
 
 	lockdep_assert_held(&tlb_inval->seqno_lock);
 
-	if (guc_to_xe(guc)->info.force_execlist)
-		return -ECANCELED;
-
 	return send_tlb_inval_ppgtt(guc, seqno, start, end, asid,
 				    XE_GUC_TLB_INVAL_PAGE_SELECTIVE, prl_sa);
 }
@@ -228,9 +225,6 @@ static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
 
 	lockdep_assert_held(&tlb_inval->seqno_lock);
 
-	if (xe->info.force_execlist)
-		return -ECANCELED;
-
 	vm = xe_device_asid_to_vm(xe, asid);
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 4cb578182912..39e4fc85f019 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -36,9 +36,6 @@ module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600)
 MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size in MiB, must be power of 2 "
 		 "[default=" __stringify(XE_DEFAULT_SVM_NOTIFIER_SIZE) "]");
 
-module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
-MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
-
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
 MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched "
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 79cb9639c0f3..c75153471248 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -10,7 +10,6 @@
 
 /* Module modprobe variables */
 struct xe_modparam {
-	bool force_execlist;
 	bool probe_display;
 	int force_vram_bar_size;
 	int guc_log_level;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 9c249454cc95..15020df6937a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -793,7 +793,6 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				 xe_modparam.probe_display &&
 				 desc->has_display;
-	xe->info.force_execlist = xe_modparam.force_execlist;
 
 	xe_assert(xe, desc->max_gt_per_tile > 0);
 	xe_assert(xe, desc->max_gt_per_tile <= XE_MAX_GT_PER_TILE);

---
base-commit: 4020469e425c12c543a21904da37735c392223a3
change-id: 20260626-remove_execlists-45f82839fc8a

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

