Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA9A1048936
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 01:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B4410EC5E;
	Sat, 28 Feb 2026 01:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aW+N7iXX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F3A10EC53
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Feb 2026 01:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772242515; x=1803778515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sL449RqN8272HKDYnzfFJb+QjprLX6w6ufCM4MF5hnI=;
 b=aW+N7iXX69MH6/0OccGubu9YPJF8a77HBM1XKD9cywTRZJsBqhbXVafV
 VNWf1aWcxa02JuIYALoJMrSNlTEO0PCS+glbTjD+H/44imDunpWBJtOJf
 tl+2L4R94+NtG6jMldZHvR90PaOtxeV6jjSuwZXqOmpCJiAT3Ylu0uyRc
 3EX2XKd7I4Soil6fCFBR7J2yd+6MT8IzxPZ5WcLxB3rjXP7f2a1xt6CTM
 GjGu8Bc5fK0CzmMUmpXYhbb1AiPzcqWA5vLW6HMJkxIr1Fkd3aIBZyDYG
 t1XAUQICoJAbk95U3uTc0NHK14BHi1e6pnFNPx7DPAXtGrRTY96xJG/tg Q==;
X-CSE-ConnectionGUID: ud+6a17RTSC+tprF8+w0eA==
X-CSE-MsgGUID: bdNPZyO6S1+s6jSeeNgpJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="83966364"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="83966364"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:09 -0800
X-CSE-ConnectionGUID: Wh1RKbgMTVKAMlIJeUvwdg==
X-CSE-MsgGUID: H4jSfVFyQeion4w4AKv4sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="213854911"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v3 25/25] drm/xe: Add modparam to enable / disable ULLS on
 migrate queue
Date: Fri, 27 Feb 2026 17:35:01 -0800
Message-Id: <20260228013501.106680-26-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260228013501.106680-1-matthew.brost@intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
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

Having modparam to enable / disable ULLS on migrate queue will help with
quick experiments.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      |  1 +
 drivers/gpu/drm/xe/xe_defaults.h     |  1 +
 drivers/gpu/drm/xe/xe_device.c       | 12 +++++++++---
 drivers/gpu/drm/xe/xe_device_types.h |  5 +++++
 drivers/gpu/drm/xe/xe_migrate.c      |  2 +-
 drivers/gpu/drm/xe/xe_module.c       |  4 ++++
 drivers/gpu/drm/xe/xe_module.h       |  1 +
 7 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 844cfafe1ec7..049389205b3f 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -85,6 +85,7 @@ static int info(struct seq_file *m, void *data)
 	drm_printf(&p, "tile_count %d\n", xe->info.tile_count);
 	drm_printf(&p, "vm_max_level %d\n", xe->info.vm_max_level);
 	drm_printf(&p, "force_execlist %s\n", str_yes_no(xe->info.force_execlist));
+	drm_printf(&p, "ulls_enable %s\n", str_yes_no(xe->info.ulls_enable));
 	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
 	drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
 	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe->info.skip_guc_pc));
diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
index c8ae1d5f3d60..299360546283 100644
--- a/drivers/gpu/drm/xe/xe_defaults.h
+++ b/drivers/gpu/drm/xe/xe_defaults.h
@@ -14,6 +14,7 @@
 #endif
 
 #define XE_DEFAULT_PROBE_DISPLAY		IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
+#define XE_DEFAULT_ULLS_ENABLE			true
 #define XE_DEFAULT_VRAM_BAR_SIZE		0
 #define XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
 #define XE_DEFAULT_MAX_VFS			~0
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b7ad7f97e68c..18af003c95c5 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -437,6 +437,14 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	ttm_device_fini(&xe->ttm);
 }
 
+static void xe_device_parse_modparam(struct xe_device *xe)
+{
+	xe->info.force_execlist = xe_modparam.force_execlist;
+	xe->info.ulls_enable = xe_modparam.ulls_enable;
+	xe->atomic_svm_timeslice_ms = 5;
+	xe->min_run_period_lr_ms = 5;
+}
+
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent)
 {
@@ -470,9 +478,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
-	xe->info.force_execlist = xe_modparam.force_execlist;
-	xe->atomic_svm_timeslice_ms = 5;
-	xe->min_run_period_lr_ms = 5;
+	xe_device_parse_modparam(xe);
 
 	err = xe_irq_init(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b3737dfcc45c..a20ff1707227 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -231,6 +231,11 @@ struct xe_device {
 		u8 skip_pcode:1;
 		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on VF */
 		u8 needs_shared_vf_gt_wq:1;
+		/**
+		 * @info.ulls_enable: Enable ULLS on migration queue in LR VM
+		 * open
+		 */
+		u8 ulls_enable:1;
 	} info;
 
 	/** @wa_active: keep track of active workarounds */
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 62f27868f56b..9f02e238e7c6 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -447,7 +447,7 @@ void xe_migrate_ulls_enter(struct xe_migrate *m)
 
 	xe_assert(xe, xe->info.has_usm);
 
-	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
+	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || !xe->info.ulls_enable)
 		return;
 
 job_alloc:
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 4cb578182912..bb4fb967aec9 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -22,6 +22,7 @@
 
 struct xe_modparam xe_modparam = {
 	.probe_display =	XE_DEFAULT_PROBE_DISPLAY,
+	.ulls_enable =		XE_DEFAULT_ULLS_ENABLE,
 	.guc_log_level =	XE_DEFAULT_GUC_LOG_LEVEL,
 	.force_probe =		XE_DEFAULT_FORCE_PROBE,
 #ifdef CONFIG_PCI_IOV
@@ -45,6 +46,9 @@ MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched
 		 "[default=" __stringify(XE_DEFAULT_PROBE_DISPLAY) "])");
 #endif
 
+module_param_named(ulls_enable, xe_modparam.ulls_enable, bool, 0444);
+MODULE_PARM_DESC(ulls_enable, "Enable ULLS on migration queue if LR VM open (default: true)");
+
 module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
 MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB (<0=disable-resize, 0=max-needed-size, >0=force-size "
 		 "[default=" __stringify(XE_DEFAULT_VRAM_BAR_SIZE) "])");
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 79cb9639c0f3..f0220b694c40 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -12,6 +12,7 @@
 struct xe_modparam {
 	bool force_execlist;
 	bool probe_display;
+	bool ulls_enable;
 	int force_vram_bar_size;
 	int guc_log_level;
 	char *guc_firmware_path;
-- 
2.34.1

