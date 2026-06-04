Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA8FCD6E7E
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 16:07:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8071111A172;
	Thu,  4 Jun 2026 16:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="SwK4mJOb";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA43111A15B
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 16:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1780589229;
 bh=Du91BbqLhMJz20dMJska7NucxLm+CaciF18Ehnqvc3Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SwK4mJObtZnhZY1AifsDxYzZUJr8xh8P5AUdx/q0isGqilRRSnmlODQghGPzcbcCa
 CbtVAeM6nWe55YxrN2dbl55APh0GntNMqN8+5EK1MkushxCQ0rja/nFKsTRW99Mpey
 4WwGiENlkt69WTbmJ26bbCL1UTcQbfOzsR4oNG35Of7qaTDM21unD5xGmqeiauf6Hg
 YwHrUzkKYDSqBrQcP4ruWm3uHNgipZoEG+bKStufZi9FpWZIxbw0Sca36L4K7MfpIB
 n3KZ+jcMuwbUrPsu6qEUUi0iDQ9reqy+C3yySKGxkkgcQ3QRmrFoJP9mw+51tMPTIV
 Cb9/XWSoxapNg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [CI 24/24] drm/xe: Add modparam to enable / disable ULLS on migrate
 queue
Date: Thu,  4 Jun 2026 18:06:53 +0200
Message-ID: <20260604160655.50036-25-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604160655.50036-1-dev@lankhorst.se>
References: <20260604160655.50036-1-dev@lankhorst.se>
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

From: Matthew Brost <matthew.brost@intel.com>

Having modparam to enable / disable ULLS on migrate queue will help with
quick experiments.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-26-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_debugfs.c      |  1 +
 drivers/gpu/drm/xe/xe_defaults.h     |  1 +
 drivers/gpu/drm/xe/xe_device.c       | 11 +++++++++--
 drivers/gpu/drm/xe/xe_device_types.h |  5 +++++
 drivers/gpu/drm/xe/xe_migrate.c      |  2 +-
 drivers/gpu/drm/xe/xe_module.c       |  4 ++++
 drivers/gpu/drm/xe/xe_module.h       |  1 +
 7 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 22b471303984a..05ec4baadc50d 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -118,6 +118,7 @@ static int info(struct seq_file *m, void *data)
 	drm_printf(&p, "tile_count %d\n", xe->info.tile_count);
 	drm_printf(&p, "vm_max_level %d\n", xe->info.vm_max_level);
 	drm_printf(&p, "force_execlist %s\n", str_yes_no(xe->info.force_execlist));
+	drm_printf(&p, "ulls_enable %s\n", str_yes_no(xe->info.ulls_enable));
 	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
 	drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
 	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe->info.skip_guc_pc));
diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
index c8ae1d5f3d601..2993605462835 100644
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
index 4280b133a522e..9d106d55281ec 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -515,6 +515,14 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
 }
 ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
 
+static void xe_device_parse_modparam(struct xe_device *xe)
+{
+	xe->info.force_execlist = xe_modparam.force_execlist;
+	xe->info.ulls_enable = xe_modparam.ulls_enable;
+	xe->atomic_svm_timeslice_ms = 5;
+	xe->min_run_period_lr_ms = 5;
+}
+
 /**
  * xe_device_init_early() - Initialize a new &xe_device instance
  * @xe: the &xe_device to initialize
@@ -540,8 +548,7 @@ int xe_device_init_early(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe->atomic_svm_timeslice_ms = 5;
-	xe->min_run_period_lr_ms = 5;
+	xe_device_parse_modparam(xe);
 
 	err = xe_irq_init(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a641e1d3072fa..ca936862db3c9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -226,6 +226,11 @@ struct xe_device {
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
index d572958ef0cf4..8e4af6a6f596d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -468,7 +468,7 @@ void xe_migrate_ulls_enter(struct xe_migrate *m)
 
 	xe_assert(xe, xe->info.has_usm);
 
-	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
+	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || !xe->info.ulls_enable)
 		return;
 
 job_alloc:
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 4cb5781829122..bb4fb967aec93 100644
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
index 79cb9639c0f3d..f0220b694c40e 100644
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
2.53.0

