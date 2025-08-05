Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1B0C87FD2
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 23:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15F110E6FC;
	Tue,  5 Aug 2025 23:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EFgvF6kP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E5910E5C8
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754437326; x=1785973326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=isU4tqfLyrX0yopUd9KxU4pfLzwDbR6ZGsDMykkA0T4=;
 b=EFgvF6kPX+7rCb7Az1VklEm/JrAnpdXM9QW6yD29dZjoXhhtkfBAK9Ib
 7qTnohvFdaGZZS2q6idyHXNvEEiai9ZYu4hLy7catT79ERxSJ4oQvpL8O
 vJ43At3bVaWf5lLOqTsMzSY7+TZiSnJuubGATF/lv1829bQbojj7F3WCF
 TNwqtVLvB7R/NqJnHKvScuycCE0NCY9Ve7ctucrINDkBiXUQTILjqch6L
 pau0uT6nhGF04ubgINsxbUQLBh2+lRAOJOCDH14y/K2KS9VXZc2pwHkMz
 PoR1wy1dkF7A9qkVe4xepBSK5mczDzJKEB9rX6YsrNVqMrOC3ebhgTihT w==;
X-CSE-ConnectionGUID: tuv3eOkIR02X+UuSK3aqKg==
X-CSE-MsgGUID: /TW5BtfBTs+3XUDrkEskhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68119070"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="68119070"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:05 -0700
X-CSE-ConnectionGUID: 4jmciu6ETLGhL6xSa+ETgw==
X-CSE-MsgGUID: LKP1QqrDSSWUjfLt/qOmtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164641633"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 14/15] drm/xe: Add modparam to enable / disable ULLS on
 migrate queue
Date: Tue,  5 Aug 2025 16:41:59 -0700
Message-Id: <20250805234200.1035609-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805234200.1035609-1-matthew.brost@intel.com>
References: <20250805234200.1035609-1-matthew.brost@intel.com>
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

v2:
 - Rebase on changes in series

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      |  1 +
 drivers/gpu/drm/xe/xe_device.c       | 11 +++++++++--
 drivers/gpu/drm/xe/xe_device_types.h |  5 +++++
 drivers/gpu/drm/xe/xe_migrate.c      |  2 +-
 drivers/gpu/drm/xe/xe_module.c       |  5 +++++
 drivers/gpu/drm/xe/xe_module.h       |  1 +
 6 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 0b4a532f7c45..a64ef860bf1f 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -81,6 +81,7 @@ static int info(struct seq_file *m, void *data)
 	drm_printf(&p, "tile_count %d\n", xe->info.tile_count);
 	drm_printf(&p, "vm_max_level %d\n", xe->info.vm_max_level);
 	drm_printf(&p, "force_execlist %s\n", str_yes_no(xe->info.force_execlist));
+	drm_printf(&p, "ulls_enable %s\n", str_yes_no(xe->info.ulls_enable));
 	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
 	drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
 	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe->info.skip_guc_pc));
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 57edbc63da6f..80c992859e90 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -412,6 +412,13 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	ttm_device_fini(&xe->ttm);
 }
 
+static void xe_device_parse_modparam(struct xe_device *xe)
+{
+	xe->info.force_execlist = xe_modparam.force_execlist;
+	xe->info.ulls_enable = xe_modparam.ulls_enable;
+	xe->atomic_svm_timeslice_ms = 5;
+}
+
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent)
 {
@@ -445,8 +452,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
-	xe->info.force_execlist = xe_modparam.force_execlist;
-	xe->atomic_svm_timeslice_ms = 5;
+
+	xe_device_parse_modparam(xe);
 
 	err = xe_irq_init(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 01e8fa0d2f9f..3858387eba34 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -314,6 +314,11 @@ struct xe_device {
 		u8 skip_mtcfg:1;
 		/** @info.skip_pcode: skip access to PCODE uC */
 		u8 skip_pcode:1;
+		/**
+		 * @info.ulls_enable: Enable ULLS on migration queue in LR VM
+		 * open
+		 */
+		u8 ulls_enable:1;
 	} info;
 
 	/** @wa_active: keep track of active workarounds */
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 2da7aafecfa4..bd9f3c446671 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -406,7 +406,7 @@ void xe_migrate_ulls_enter(struct xe_migrate *m)
 
 	xe_assert(xe, xe->info.has_usm);
 
-	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
+	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || !xe->info.ulls_enable)
 		return;
 
 job_alloc:
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index d08338fc3bc1..d8d9db82e71d 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -25,6 +25,7 @@
 #endif
 
 #define DEFAULT_PROBE_DISPLAY		true
+#define DEFAULT_ULLS_ENABLE		true
 #define DEFAULT_VRAM_BAR_SIZE		0
 #define DEFAULT_FORCE_PROBE		CONFIG_DRM_XE_FORCE_PROBE
 #define DEFAULT_MAX_VFS			~0
@@ -34,6 +35,7 @@
 
 struct xe_modparam xe_modparam = {
 	.probe_display =	DEFAULT_PROBE_DISPLAY,
+	.ulls_enable =		DEFAULT_ULLS_ENABLE,
 	.guc_log_level =	DEFAULT_GUC_LOG_LEVEL,
 	.force_probe =		DEFAULT_FORCE_PROBE,
 #ifdef CONFIG_PCI_IOV
@@ -55,6 +57,9 @@ module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
 MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched "
 		 "[default=" __stringify(DEFAULT_PROBE_DISPLAY) "])");
 
+module_param_named(ulls_enable, xe_modparam.ulls_enable, bool, 0444);
+MODULE_PARM_DESC(ulls_enable, "Enable ULLS on migration queue if LR VM open (default: true)");
+
 module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
 MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB (<0=disable-resize, 0=max-needed-size, >0=force-size "
 		 "[default=" __stringify(DEFAULT_VRAM_BAR_SIZE) "])");
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

