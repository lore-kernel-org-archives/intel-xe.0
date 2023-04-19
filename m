Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7299C77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 17:55:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9A010EA44;
	Wed, 19 Apr 2023 17:55:07 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE72D10E1D2
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 17:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681926904; x=1713462904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HgQSUEqlrllY9fAi3dN39Df/J1V2uBpyqSIHeMFaFD4=;
 b=URtTyUNyZOZzuYz0QDgsU4jIihZ0TS0E2FrJ7BdP0teE2lyDQ8xhaOEn
 Q4rwqwp7LY8YMbrumPZBU9PqRX6kF9IMseP4oukOAkG+xMpSds4KseBz/
 TCLQ4LaO3vxs4MfO/FEHmGB8fLvIyGWBfAeNgeW6Foi9Q+xaqnzcka6kA
 s2wnNAoF1xUI+whl1SK9Gn+46BeOgI4G4God5ADluo99J8uu7nbz3vsWp
 8dy59zYLeQAZV/wYXzwb8HBQ6DdNh0dcmjscuOgD01eSLcECmJf1j3Cou
 NVcykYlcsY3FnyB+OtNiKFCdXeylliZiIoUFW5AdmRZAmf+wQKAXv6kXS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="408429387"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="408429387"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 10:55:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="722022450"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="722022450"
Received: from dut125tglh.fm.intel.com ([10.105.23.23])
 by orsmga008.jf.intel.com with ESMTP; 19 Apr 2023 10:55:02 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Date: Wed, 19 Apr 2023 17:55:01 +0000
Message-Id: <20230419175501.155319-5-stuart.summers@intel.com>
X-Mailer: git-send-email 2.38.1.143.g1fc3c0ad40
In-Reply-To: <20230419175501.155319-1-stuart.summers@intel.com>
References: <20230419175501.155319-1-stuart.summers@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] drm/xe: Migrate module parameters to new
 debugfs structure
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
Cc: stuart.summers@intel.com, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use the new debugfs structure for the current module parameters
outside of force_probe. This still allows the driver to be
manually probed without any need to change the autoprobe settings.

For the rest, they can now be tuned prior to binding to the device
by disabling the driver autoprobe.

Drop the current dummy parameter.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c  |  4 ++--
 drivers/gpu/drm/xe/xe_display.c |  3 ++-
 drivers/gpu/drm/xe/xe_guc_log.c |  2 +-
 drivers/gpu/drm/xe/xe_mmio.c    |  4 ++--
 drivers/gpu/drm/xe/xe_module.c  | 16 ----------------
 drivers/gpu/drm/xe/xe_module.h  |  5 -----
 drivers/gpu/drm/xe/xe_params.h  |  5 ++++-
 7 files changed, 11 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 867051d74eea..b07f8fc1a515 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -195,8 +195,8 @@ int xe_device_init(struct xe_device *xe)
 	if (WARN_ON(err))
 		goto err_put;
 
-	xe->info.enable_guc = enable_guc;
-	xe->info.enable_display = enable_display;
+	xe->info.enable_guc = xe->info.params.enable_guc;
+	xe->info.enable_display = xe->info.params.enable_display;
 
 	spin_lock_init(&xe->irq.lock);
 
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index c67f6a591a58..35f8344fdc5a 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -29,6 +29,7 @@
 #include "intel_hotplug.h"
 #include "intel_opregion.h"
 #include "xe_module.h"
+#include "xe_params.h"
 
 /* Xe device functions */
 
@@ -49,7 +50,7 @@ static void xe_display_last_close(struct drm_device *dev)
  */
 int xe_display_set_driver_hooks(struct pci_dev *pdev, struct drm_driver *driver)
 {
-	if (!enable_display)
+	if (!xe_modparams.enable_display)
 		return 0;
 
 	/* Detect if we need to wait for other drivers early on */
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 9a7b5d5906c1..9a2930f6613f 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -100,7 +100,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
 
 	xe_map_memset(xe, &bo->vmap, 0, 0, guc_log_size());
 	log->bo = bo;
-	log->level = xe_guc_log_level;
+	log->level = xe->info.params.guc_log_level;
 
 	err = drmm_add_action_or_reset(&xe->drm, guc_log_fini, log);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 5cacaa05759a..58c459d852ed 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -78,7 +78,7 @@ static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
 	u32 pci_cmd;
 	int i;
 	int ret;
-	u64 force_vram_bar_size = xe_force_vram_bar_size;
+	u64 force_vram_bar_size = xe->info.params.force_vram_bar_size;
 
 	current_size = roundup_pow_of_two(pci_resource_len(pdev, GEN12_LMEM_BAR));
 
@@ -225,7 +225,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		drm_info(&xe->drm, "Successfully resize VRAM from %lluMiB to %lluMiB\n",
 			 (u64)original_size >> 20,
 			 (u64)xe->mem.vram.io_size >> 20);
-	else if (xe->mem.vram.io_size < usable_size && !xe_force_vram_bar_size)
+	else if (xe->mem.vram.io_size < usable_size && !xe->info.params.force_vram_bar_size)
 		drm_info(&xe->drm, "Using a reduced BAR size of %lluMiB. Consider enabling 'Resizable BAR' support in your BIOS.\n",
 			 (u64)xe->mem.vram.size >> 20);
 	if (xe->mem.vram.size < vram_size)
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 6860586ce7f8..962c89d371d8 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -14,22 +14,6 @@
 #include "xe_pci.h"
 #include "xe_sched_job.h"
 
-bool enable_guc = true;
-module_param_named_unsafe(enable_guc, enable_guc, bool, 0444);
-MODULE_PARM_DESC(enable_guc, "Enable GuC submission");
-
-bool enable_display = true;
-module_param_named(enable_display, enable_display, bool, 0444);
-MODULE_PARM_DESC(enable_display, "Enable display");
-
-u32 xe_force_vram_bar_size;
-module_param_named(vram_bar_size, xe_force_vram_bar_size, uint, 0600);
-MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
-
-int xe_guc_log_level = 5;
-module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
-MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
-
 char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
 module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
 MODULE_PARM_DESC(force_probe,
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 86916c176382..fb95bff2c2f4 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -5,9 +5,4 @@
 
 #include <linux/init.h>
 
-/* Module modprobe variables */
-extern bool enable_guc;
-extern bool enable_display;
-extern u32 xe_force_vram_bar_size;
-extern int xe_guc_log_level;
 extern char *xe_param_force_probe;
diff --git a/drivers/gpu/drm/xe/xe_params.h b/drivers/gpu/drm/xe/xe_params.h
index 26fb592e9cd6..7d17d75c1a85 100644
--- a/drivers/gpu/drm/xe/xe_params.h
+++ b/drivers/gpu/drm/xe/xe_params.h
@@ -23,7 +23,10 @@ struct drm_printer;
  *       debugfs file
  */
 #define XE_PARAMS_FOR_EACH(param) \
-	param(bool, dummy, true, 0444)
+	param(bool, enable_guc, true, 0444) \
+	param(bool, enable_display, true, 0444) \
+	param(unsigned int, force_vram_bar_size, -1, 0600) \
+	param(int, guc_log_level, 5, 0600)
 
 #define MEMBER(T, member, ...) T member;
 struct xe_params {
-- 
2.38.1.143.g1fc3c0ad40

