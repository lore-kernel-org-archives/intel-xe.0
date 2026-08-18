Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ED8C5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 15:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5946110E046;
	Tue, 18 Aug 2026 15:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nN0PNohA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5494310E046
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 15:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787067647; x=1818603647;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Bl9vW+kjff2UjhwmAhOL86VVpBsJgiWilMAm+yunRio=;
 b=nN0PNohALjQIElFnx/JRZYy1hHF05DLr9kaQikRIoQwEv5LCLnw6vlio
 KWXD/ozN4odPqhmrappBt+by2SvXpaURn77AQzivQWSaPUOSFi9nr3vB1
 Qr7vebaUHtJ5me0PiAK7FxwejIQT37KyHu52jGHuw/K8huILzb64LmL2h
 S/FTATTw+CoDhPMeMP18RbYgOEqwVpAOJ6dH7Cyd5oEclapG6RcI0SjNo
 1aEKU85qurE3zdbXBXKMAZAG7zogHUV+SQCQsn6UMsB3NoJ5nDiyaonxH
 2uMi/hs1PWCJw2qkLURJj1VC3NBe4ik9lIbwfRMozkoggZBTqPDWsrYzK w==;
X-CSE-ConnectionGUID: mA12yAY9RCm+5ou6tStXcA==
X-CSE-MsgGUID: jkkA09ZpRoasSnSdCJ1dGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="97901527"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="97901527"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 08:40:47 -0700
X-CSE-ConnectionGUID: 9V32nK0oRQ6PEmMq9tkwHw==
X-CSE-MsgGUID: qLTtjkxjRc20fu5AMMKuIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="261054444"
Received: from ndcfedvm.sc.intel.com ([10.3.206.26])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 08:40:46 -0700
From: Nathan Ciobanu <nathan.d.ciobanu@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Add force_p2p module/configfs parameter
Date: Tue, 18 Aug 2026 08:40:42 -0700
Message-ID: <20260818154042.301638-1-nathan.d.ciobanu@linux.intel.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add force_p2p module and configfs parameter to give users an option to
allow P2P DMA between GPU cards that are connected off of the root bus
with no switch/bridge in between, as seen in some virtual machine
topologies (Q35/QEMU, VMware):

 \-[0000:03]-+-00.0  Intel Corporation [Intel Graphics]
             \-01.0  Intel Corporation [Intel Graphics]

or

 -[0000:00]-+-01.6-[07]----00.0  Intel Graphics
            \-01.7-[08]----00.0  Intel Graphics

In these situations the p2pdma distance calculation API would fail the
host-bridge case and not give a chance to users to take advantage of P2P
DMA.

This module/config parameter should be used with caution after proving
that the memory mapped between the two devices is not getting corrupted.
Users need to verify that the platform's physical topology
allows/facilitates P2P and tests such as the IGT xe_peer2peer pass.

Assisted-by: Claude:claude-3.5-sonnet
Signed-off-by: Nathan Ciobanu <nathan.d.ciobanu@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 052cce962161..187352a8b419 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -255,6 +255,39 @@
  * The created device directories can be removed using ``rmdir``::
  *
  *	# rmdir /sys/kernel/config/xe/0000:03:00.0/
+ *
+ * Force P2P DMA
+ * -------------
+ *
+ * This option is useful in virtual machines when the PCIe emulated topology
+ * doesn't mimic the physical one and the p2pdma API fails to calculate a
+ * distance between nodes due to whitelist checks. In such cases, the user can
+ * set the force_p2p module parameter globally or through configfs, if needed,
+ * have the option to granularly control that setting on a per-device basis.
+ *
+ * By default, force_p2p will have the same value as the xe_modparam.force_p2p
+ * which by default is 0.
+ *
+ * The symptoms that point to the P2P issue that this option is trying to
+ * address is:
+ * - dmesg errors such as "xe 0000:03:01.0: cannot be used for peer-to-peer DMA
+ *   as the client and provider (0000:03:00.0) do not share an upstream bridge
+ *   or whitelisted host bridge"
+ * - Running the IGT xe_peer2peer tests result in skips.
+ * - UMD libraries fail with p2p related errors.
+ *
+ * Use these steps if the global xe.force_p2p parameter is inconvenient
+ * for some GPU devices in your system. NOTE that this option needs to be
+ * set on both endpoints of a pair to take effect.
+ *
+ * 1. Unbind the driver from device:
+ *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind
+ *
+ * 2. Set the force_p2p option on/off:
+ *	# echo [0|1] > /sys/kernel/config/xe/0000\:03\:00.0/force_p2p
+ *
+ * 3. Rebind the driver to device:
+ *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
  */
 
 /* Similar to struct xe_bb, but not tied to HW (yet) */
@@ -275,6 +308,7 @@ struct xe_config_group_device {
 		bool survivability_mode;
 		bool enable_psmi;
 		bool enable_multi_queue;
+		bool force_p2p;
 		struct {
 			unsigned int max_vfs;
 			bool admin_only_pf;
@@ -295,6 +329,7 @@ static const struct xe_config_device device_defaults = {
 	.survivability_mode = false,
 	.enable_psmi = false,
 	.enable_multi_queue = true,
+	.force_p2p = XE_DEFAULT_FORCE_P2P,
 	.sriov = {
 		.max_vfs = XE_DEFAULT_MAX_VFS,
 		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
@@ -304,6 +339,7 @@ static const struct xe_config_device device_defaults = {
 static void set_device_defaults(struct xe_config_device *config)
 {
 	*config = device_defaults;
+	config->force_p2p = xe_modparam.force_p2p;
 #ifdef CONFIG_PCI_IOV
 	config->sriov.max_vfs = xe_modparam.max_vfs;
 #endif
@@ -563,6 +599,37 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 	return len;
 }
 
+static ssize_t force_p2p_show(struct config_item *item, char *page)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+
+	guard(mutex)(&dev->lock);
+
+	return sprintf(page, "%d\n", dev->config.force_p2p);
+}
+
+static ssize_t force_p2p_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	bool force_p2p;
+	int ret;
+
+	guard(mutex)(&dev->lock);
+
+	if (is_bound(dev))
+		return -EBUSY;
+
+	ret = kstrtobool(page, &force_p2p);
+	if (ret)
+		return ret;
+
+	dev->config.force_p2p = force_p2p;
+
+	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+
+	return len;
+}
+
 static ssize_t enable_psmi_show(struct config_item *item, char *page)
 {
 	struct xe_config_device *dev = to_xe_config_device(item);
@@ -856,6 +923,7 @@ CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, enable_multi_queue);
 CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, engines_allowed);
+CONFIGFS_ATTR(, force_p2p);
 CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, survivability_mode);
 
@@ -865,6 +933,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_enable_multi_queue,
 	&attr_enable_psmi,
 	&attr_engines_allowed,
+	&attr_force_p2p,
 	&attr_gt_types_allowed,
 	&attr_survivability_mode,
 	NULL,
@@ -1269,6 +1338,25 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
 	return ret;
 }
 
+/** xe_configfs_get_force_p2p - get configfs force_p2p setting
+ * @pdev: pci device
+ *
+ * Return: force_p2p setting in configfs
+ */
+bool xe_configfs_get_force_p2p(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	bool ret;
+
+	if (!dev)
+		return xe_modparam.force_p2p;
+
+	ret = dev->config.force_p2p;
+
+	config_group_put(&dev->group);
+	return ret;
+}
+
 /**
  * xe_configfs_get_enable_multi_queue - get configfs enable_multi_queue setting
  * @pdev: pci device
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 4fbbeafba473..45af69cb74b1 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -30,6 +30,7 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 					enum xe_engine_class class,
 					const u32 **cs);
+bool xe_configfs_get_force_p2p(struct pci_dev *pdev);
 #ifdef CONFIG_PCI_IOV
 unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
 bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
@@ -50,6 +51,7 @@ static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 						      enum xe_engine_class class,
 						      const u32 **cs) { return 0; }
+static inline bool xe_configfs_get_force_p2p(struct pci_dev *pdev) { return xe_modparam.force_p2p; }
 #ifdef CONFIG_PCI_IOV
 static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
 {
diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
index 0884224ef7c7..3881e832566a 100644
--- a/drivers/gpu/drm/xe/xe_defaults.h
+++ b/drivers/gpu/drm/xe/xe_defaults.h
@@ -13,6 +13,7 @@
 #define XE_DEFAULT_GUC_LOG_LEVEL		1
 #endif
 
+#define XE_DEFAULT_FORCE_P2P			0
 #define XE_DEFAULT_PROBE_DISPLAY		IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 #define XE_DEFAULT_VRAM_BAR_SIZE		0
 #define XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index bf0728838ead..bd8f8ad70bcd 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -15,6 +15,7 @@
 
 #include "tests/xe_test.h"
 #include "xe_bo.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_pm.h"
 #include "xe_ttm_vram_mgr.h"
@@ -26,9 +27,14 @@ static int xe_dma_buf_attach(struct dma_buf *dmabuf,
 			     struct dma_buf_attachment *attach)
 {
 	struct drm_gem_object *obj = attach->dmabuf->priv;
+	struct pci_dev *a_pdev = to_pci_dev(obj->dev->dev);
+	struct pci_dev *b_pdev = dev_is_pci(attach->dev) ?
+				 to_pci_dev(attach->dev) : NULL;
 
 	if (attach->peer2peer &&
-	    pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach->dev, false) < 0)
+	    !(b_pdev && xe_configfs_get_force_p2p(a_pdev) &&
+	      xe_configfs_get_force_p2p(b_pdev)) &&
+	    pci_p2pdma_distance(a_pdev, attach->dev, false) < 0)
 		attach->peer2peer = false;
 
 	if (!attach->peer2peer && !xe_bo_can_migrate(gem_to_xe_bo(obj), XE_PL_TT))
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 4bc28dfc1992..99cb2a455c6e 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -22,6 +22,7 @@
 #include "xe_sched_job.h"
 
 struct xe_modparam xe_modparam = {
+	.force_p2p =		XE_DEFAULT_FORCE_P2P,
 	.probe_display =	XE_DEFAULT_PROBE_DISPLAY,
 	.guc_log_level =	XE_DEFAULT_GUC_LOG_LEVEL,
 	.force_probe =		XE_DEFAULT_FORCE_PROBE,
@@ -38,6 +39,10 @@ module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600)
 MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size in MiB, must be power of 2 "
 		 "[default=" __stringify(XE_DEFAULT_SVM_NOTIFIER_SIZE) "]");
 
+module_param_named_unsafe(force_p2p, xe_modparam.force_p2p, bool, 0400);
+MODULE_PARM_DESC(force_p2p, "Force P2P DMA between GPUs (useful in virtual machines), bypassing p2pdma checks. "
+		 "[default=" __stringify(XE_DEFAULT_FORCE_P2P) "]");
+
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
 MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched "
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 6272d9e41207..bb154c7b095a 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -12,6 +12,7 @@ struct work_struct;
 
 /* Module modprobe variables */
 struct xe_modparam {
+	bool force_p2p;
 	bool probe_display;
 	int force_vram_bar_size;
 	int guc_log_level;
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 627a741293d5..3cd53bb166af 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -12,6 +12,7 @@
 
 #include "xe_bo.h"
 #include "xe_exec_queue_types.h"
+#include "xe_configfs.h"
 #include "xe_gt_stats.h"
 #include "xe_migrate.h"
 #include "xe_module.h"
@@ -892,6 +893,10 @@ static bool xe_has_interconnect(struct drm_pagemap_peer *peer1,
 	if (dev1 == dev2)
 		return true;
 
+	if (xe_configfs_get_force_p2p(to_pci_dev(dev1)) &&
+	    xe_configfs_get_force_p2p(to_pci_dev(dev2)))
+		return true;
+
 	return pci_p2pdma_distance(to_pci_dev(dev1), dev2, true) >= 0;
 }
 
-- 
2.55.0

