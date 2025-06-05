Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DACC5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 15:31:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75D410E96F;
	Thu,  5 Jun 2025 15:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ggw+bEYT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D27610E919
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 15:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749137455; x=1780673455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RbGo7NpIUvuIg/Xo6dBZq1gwoEcACmIvmpBi3eIkb1Q=;
 b=ggw+bEYTNvDd6lmQlm+88SxMyaj+YZYdi1qmcs1QaKy7WJBJXIsi4RIQ
 Oti7fjjWjaDbuqkWih1okyISddU0+yvSaxc5parKn7fag25X/n7uSq4TE
 58sQCz0ICvdYwKRATUHPWWF/c7TjnwhkiGtbtHFcasClDjXhohYk0jxJg
 rL/gRTY2sG+2MqRCo7/P5jr0LTFQ0uBRKvY5e+PI8R3iT5oe81IV6rFxt
 DoTW+cAmU2/GdRxq9/hnfd6C43kp56Eo0NjJjeUAom5Qq4Wvat6vQKe8r
 3rjlaTDe7o7+262w4W+wiJzKf73hTDlQldnJI2+ExRamNQdeHwHW3we6e g==;
X-CSE-ConnectionGUID: zRnrIQ7YRO2sMfgLd9JTCQ==
X-CSE-MsgGUID: zozWEC9DTeuQtJ15ebI+XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61529500"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="61529500"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:52 -0700
X-CSE-ConnectionGUID: c5UHSFfIQsCLXA8LZnZLSw==
X-CSE-MsgGUID: 1/k6G59QQzOc0yda7aDgKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="176502831"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 14/15] drm/xe: Add modparam to enable / disable ULLS on
 migrate queue
Date: Thu,  5 Jun 2025 08:32:22 -0700
Message-Id: <20250605153223.2789122-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605153223.2789122-1-matthew.brost@intel.com>
References: <20250605153223.2789122-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_debugfs.c      | 1 +
 drivers/gpu/drm/xe/xe_device.c       | 1 +
 drivers/gpu/drm/xe/xe_device_types.h | 5 +++++
 drivers/gpu/drm/xe/xe_migrate.c      | 4 ++--
 drivers/gpu/drm/xe/xe_module.c       | 4 ++++
 drivers/gpu/drm/xe/xe_module.h       | 1 +
 6 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d83cd6ed3fa8..d027bda5652f 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -59,6 +59,7 @@ static int info(struct seq_file *m, void *data)
 	drm_printf(&p, "tile_count %d\n", xe->info.tile_count);
 	drm_printf(&p, "vm_max_level %d\n", xe->info.vm_max_level);
 	drm_printf(&p, "force_execlist %s\n", str_yes_no(xe->info.force_execlist));
+	drm_printf(&p, "ulls_enable %s\n", str_yes_no(xe->info.ulls_enable));
 	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
 	drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
 	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe->info.skip_guc_pc));
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 660b0c5126dc..8cc88410dfca 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -442,6 +442,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
 	xe->info.force_execlist = xe_modparam.force_execlist;
+	xe->info.ulls_enable = xe_modparam.ulls_enable;
 	xe->atomic_svm_timeslice_ms = 5;
 
 	err = xe_irq_init(xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index ac27389ccb8b..214a90696615 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -355,6 +355,11 @@ struct xe_device {
 		u8 skip_mtcfg:1;
 		/** @info.skip_pcode: skip access to PCODE uC */
 		u8 skip_pcode:1;
+		/**
+		 * @info.ulls_enable: Enable ULLS on migration queue in LR VM
+		 * open
+		 */
+		u8 ulls_enable:1;
 	} info;
 
 	/** @survivability: survivability information for device */
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 80344d4f6f10..ebe472af2e7a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -752,7 +752,7 @@ void xe_migrate_lr_vm_get(struct xe_migrate *m)
 {
 	struct xe_device *xe = tile_to_xe(m->tile);
 
-	if (!IS_DGFX(xe) || !xe->info.has_usm)
+	if (!IS_DGFX(xe) || !xe->info.has_usm || !xe->info.ulls_enable)
 		return;
 
 	mutex_lock(&m->job_mutex);
@@ -780,7 +780,7 @@ void xe_migrate_lr_vm_put(struct xe_migrate *m)
 {
 	struct xe_device *xe = tile_to_xe(m->tile);
 
-	if (!IS_DGFX(xe) || !xe->info.has_usm)
+	if (!IS_DGFX(xe) || !xe->info.has_usm || !xe->info.ulls_enable)
 		return;
 
 	mutex_lock(&m->job_mutex);
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 1c4dfafbcd0b..353bd5a8f02b 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -20,6 +20,7 @@
 
 struct xe_modparam xe_modparam = {
 	.probe_display = true,
+	.ulls_enable = true,
 	.guc_log_level = 3,
 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
 #ifdef CONFIG_PCI_IOV
@@ -39,6 +40,9 @@ MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
 module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
 MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched (default: true)");
 
+module_param_named(ulls_enable, xe_modparam.ulls_enable, bool, 0444);
+MODULE_PARM_DESC(ulls_enable, "Enable ULLS on migration queue if LR VM open (default: true)");
+
 module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
 MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size (in MiB) - <0=disable-resize, 0=max-needed-size[default], >0=force-size");
 
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 5a3bfea8b7b4..8ea69a5b2141 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -12,6 +12,7 @@
 struct xe_modparam {
 	bool force_execlist;
 	bool probe_display;
+	bool ulls_enable;
 	u32 force_vram_bar_size;
 	int guc_log_level;
 	char *guc_firmware_path;
-- 
2.34.1

