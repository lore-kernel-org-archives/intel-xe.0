Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB22C87FDA
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 23:42:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EEFE10E5C8;
	Tue,  5 Aug 2025 23:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sy7qbNI0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CFC10E656
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754437326; x=1785973326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=USxq20HqLMxPg9PVj3ksv/E88WbkCwuwdp/TZm/tPrE=;
 b=Sy7qbNI0l5T7/5/QCZk/iinCIY4MmBjsfEhAGFD/pH8bH3Aa28Hx4MAr
 4YY3j4JrCgOhVCiYwG15nE0V7s5usumq315vepO1/hx2WvPQRCBn+7i8e
 w5ElsLJfITKn0dsvd5v+K8rKURVhNpAB/gAkKWE1HOT+mWXtk20AKxnVd
 8CyNzmHDDY0uHtedacv5121gYXzF8z7F2nqqzqfdFAmRLj4eTSA+H0oOv
 0Hmceb0G/l28+DAQvTw4mY8q2XyNUymq2XH8rU9ebiF3GLDDFriDTHFnL
 mKs5J9maht8aJao07THlPXKfknI/K2n+mjMqkLxBDsgVZfKCwa6JsXOn1 w==;
X-CSE-ConnectionGUID: wAVuwsC5QUm1zmMRuKxmGg==
X-CSE-MsgGUID: q+BIopa6T4qpxd4f3zB2jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68119072"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="68119072"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:05 -0700
X-CSE-ConnectionGUID: ks/ldwWsTmeknvhiRj+Sog==
X-CSE-MsgGUID: 23gEhqlBQneQr8bxoPdm9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164641634"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 15/15] drm/xe: Add modparam to enable / disable high SLPC
 on migrate queue
Date: Tue,  5 Aug 2025 16:42:00 -0700
Message-Id: <20250805234200.1035609-16-matthew.brost@intel.com>
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

Having modparam to enable / disable high SLPC on migrate queue will help
with quick experiments.

v2:
 - Enable by default
 - Set low latency flag at caller

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      |  2 ++
 drivers/gpu/drm/xe/xe_device.c       |  2 ++
 drivers/gpu/drm/xe/xe_device_types.h |  5 +++++
 drivers/gpu/drm/xe/xe_migrate.c      | 20 ++++++++------------
 drivers/gpu/drm/xe/xe_module.c       |  5 +++++
 drivers/gpu/drm/xe/xe_module.h       |  1 +
 6 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index a64ef860bf1f..cd243b1c2286 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -82,6 +82,8 @@ static int info(struct seq_file *m, void *data)
 	drm_printf(&p, "vm_max_level %d\n", xe->info.vm_max_level);
 	drm_printf(&p, "force_execlist %s\n", str_yes_no(xe->info.force_execlist));
 	drm_printf(&p, "ulls_enable %s\n", str_yes_no(xe->info.ulls_enable));
+	drm_printf(&p, "high_slpc_migration_queue %s\n",
+		   str_yes_no(xe->info.high_slpc_migration_queue));
 	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
 	drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
 	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe->info.skip_guc_pc));
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 80c992859e90..649c81e6c68d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -416,6 +416,8 @@ static void xe_device_parse_modparam(struct xe_device *xe)
 {
 	xe->info.force_execlist = xe_modparam.force_execlist;
 	xe->info.ulls_enable = xe_modparam.ulls_enable;
+	xe->info.high_slpc_migration_queue =
+		xe_modparam.high_slpc_migration_queue;
 	xe->atomic_svm_timeslice_ms = 5;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 3858387eba34..29cd10eeb89a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -319,6 +319,11 @@ struct xe_device {
 		 * open
 		 */
 		u8 ulls_enable:1;
+		/**
+		 * @info.high_slpc_migration_queue: High SLPC on migration
+		 * queue
+		 */
+		u8 high_slpc_migration_queue:1;
 	} info;
 
 	/** @wa_active: keep track of active workarounds */
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index bd9f3c446671..12ee9eb542f9 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -545,6 +545,9 @@ int xe_migrate_init(struct xe_migrate *m)
 	struct xe_gt *primary_gt = tile->primary_gt;
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_vm *vm;
+	u32 flags = EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_PERMANENT |
+		EXEC_QUEUE_FLAG_MIGRATE | (xe->info.high_slpc_migration_queue ?
+					   EXEC_QUEUE_FLAG_LOW_LATENCY : 0);
 	int err;
 
 	/* Special layout, prepared below.. */
@@ -571,11 +574,9 @@ int xe_migrate_init(struct xe_migrate *m)
 			goto err_out;
 		}
 
+		flags |= EXEC_QUEUE_FLAG_HIGH_PRIORITY;
 		m->bind_q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
-						 EXEC_QUEUE_FLAG_KERNEL |
-						 EXEC_QUEUE_FLAG_PERMANENT |
-						 EXEC_QUEUE_FLAG_HIGH_PRIORITY |
-						 EXEC_QUEUE_FLAG_MIGRATE, 0);
+						 flags, 0);
 		if (IS_ERR(m->bind_q)) {
 			err = PTR_ERR(m->bind_q);
 			goto err_out;
@@ -586,10 +587,7 @@ int xe_migrate_init(struct xe_migrate *m)
 		 * PVC, may want to revisit if performance is needed.
 		 */
 		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
-					    EXEC_QUEUE_FLAG_KERNEL |
-					    EXEC_QUEUE_FLAG_PERMANENT |
-					    EXEC_QUEUE_FLAG_HIGH_PRIORITY |
-					    EXEC_QUEUE_FLAG_MIGRATE, 0);
+					    flags, 0);
 	} else {
 		m->bind_q = xe_exec_queue_create_class(xe, primary_gt, vm,
 						       XE_ENGINE_CLASS_COPY,
@@ -602,10 +600,8 @@ int xe_migrate_init(struct xe_migrate *m)
 		}
 
 		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
-						  XE_ENGINE_CLASS_COPY,
-						  EXEC_QUEUE_FLAG_KERNEL |
-						  EXEC_QUEUE_FLAG_PERMANENT |
-						  EXEC_QUEUE_FLAG_MIGRATE, 0);
+						  XE_ENGINE_CLASS_COPY, flags,
+						  0);
 	}
 	if (IS_ERR(m->q)) {
 		err = PTR_ERR(m->q);
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index d8d9db82e71d..760c2eb78cc8 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -26,6 +26,7 @@
 
 #define DEFAULT_PROBE_DISPLAY		true
 #define DEFAULT_ULLS_ENABLE		true
+#define DEFAULT_HIGH_SLPC_MIGRATION_QUEUE	true
 #define DEFAULT_VRAM_BAR_SIZE		0
 #define DEFAULT_FORCE_PROBE		CONFIG_DRM_XE_FORCE_PROBE
 #define DEFAULT_MAX_VFS			~0
@@ -36,6 +37,7 @@
 struct xe_modparam xe_modparam = {
 	.probe_display =	DEFAULT_PROBE_DISPLAY,
 	.ulls_enable =		DEFAULT_ULLS_ENABLE,
+	.high_slpc_migration_queue =	DEFAULT_HIGH_SLPC_MIGRATION_QUEUE,
 	.guc_log_level =	DEFAULT_GUC_LOG_LEVEL,
 	.force_probe =		DEFAULT_FORCE_PROBE,
 #ifdef CONFIG_PCI_IOV
@@ -60,6 +62,9 @@ MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched
 module_param_named(ulls_enable, xe_modparam.ulls_enable, bool, 0444);
 MODULE_PARM_DESC(ulls_enable, "Enable ULLS on migration queue if LR VM open (default: true)");
 
+module_param_named(high_slpc_migration_queue, xe_modparam.high_slpc_migration_queue, bool, 0444);
+MODULE_PARM_DESC(high_slpc_migration_queue, "High SLPC on migration queue (default: false)");
+
 module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
 MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB (<0=disable-resize, 0=max-needed-size, >0=force-size "
 		 "[default=" __stringify(DEFAULT_VRAM_BAR_SIZE) "])");
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 8ea69a5b2141..d0afc085f443 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -13,6 +13,7 @@ struct xe_modparam {
 	bool force_execlist;
 	bool probe_display;
 	bool ulls_enable;
+	bool high_slpc_migration_queue;
 	u32 force_vram_bar_size;
 	int guc_log_level;
 	char *guc_firmware_path;
-- 
2.34.1

