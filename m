Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1263DCD8C87
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 23:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F4611ABCB;
	Fri,  5 Jun 2026 23:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q2ccFK1Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1ACF11ABBC
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 23:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780701680; x=1812237680;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6tZRIW6LuDmCf/5wULL8IKL7Y1QsoFm04dk9sbhdRTY=;
 b=Q2ccFK1QdVshUcMOyPIoaWiDD9DodrFqfZizNJUarGuUbpjOK3L0YarX
 +Moaz5+yXsEXBHoK+1osDAoNSFArCmmiDmR6Pmt41bE9mHQnAMfbtxw7h
 hm+Y2j1SgEZIS5HZPMZnXb8gCzSG2hao1Ii/10/Pv0TL6a5szNwlRUl2H
 Jglx+dU8eiMej2x07kEVB5/QdG2eMsOeKa2eesFfILLxDUiqm5s1QGL63
 rGXZWhpL27FxwH9X29Qh8uqLqxFv//fNKvOsOUu9/rzjk/P9yKl65yDVH
 nCzeX6BZNLcxXvid8ZbJaI72F9LMznyPqAzSIXAh5azkL9jQ3QOq1BoqI Q==;
X-CSE-ConnectionGUID: R8LqZK6LTtqFmFk33beeXg==
X-CSE-MsgGUID: jlPoMu6+TSK+TK3mivP3gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81449680"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="81449680"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 16:21:19 -0700
X-CSE-ConnectionGUID: rQVYduoSR7CkdnBBklZiRw==
X-CSE-MsgGUID: wnmsHx5vTSyXtXlgvQx7Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="245018296"
Received: from dut4385arlh.fm.intel.com ([10.105.8.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 16:21:19 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: michal.wajdeczko@intel.com, ilia.levi@intel.com, x.wang@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 alan.previn.teres.alexis@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 05/12] drm/xe: Add configfs max_msix_vecs attribute
Date: Fri,  5 Jun 2026 23:21:12 +0000
Message-ID: <20260605232108.674580-19-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605232108.674580-14-stuart.summers@intel.com>
References: <20260605232108.674580-14-stuart.summers@intel.com>
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

Add a configfs attribute to cap the total number of MSI-X vectors used
by the driver. This intends to cover all assigned vectors.

This let's us configure at runtime (prior to driver load) how many
vectors we want to be able to allocate during driver runtime without
changing anything in the PCIe capabilities. For VMWARE and other use
cases where system-wide vector count is strictly maintained rather
than per-device maximums, this helps provide this configurability
by a system administrator.

Example to cap the driver to 64 MSI-X vectors total:

  # echo 64 > /sys/kernel/config/xe/0000:03:00.0/max_msix_vecs

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/xe_configfs.c | 71 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |  6 +++
 drivers/gpu/drm/xe/xe_irq.c      |  5 ++-
 3 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 32102600a148..5dc1f8196fe1 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -237,6 +237,23 @@
  *
  * This setting only takes effect when probing the device.
  *
+ * Max MSI-X exec queue vectors:
+ * ------------------------------
+ *
+ * Limit the total number of MSI-X vectors used by the driver. This cap is
+ * applied at device init time and covers all vectors: GuC-to-host, the
+ * shared default HWE vector, and any per-exec-queue dedicated vectors.
+ * Once the cap is reached, no additional dynamic vectors can be allocated
+ * and exec queues fall back to sharing the default vector. The value must
+ * be a non-zero positive integer; the default matches the compile-time
+ * limit (XE_MSIX_MAX_VECS).
+ *
+ * This attribute can only be set before binding to the device.
+ *
+ * Example to cap the driver to 64 MSI-X vectors total::
+ *
+ *	# echo 64 > /sys/kernel/config/xe/0000:03:00.0/max_msix_vecs
+ *
  * Remove devices
  * ==============
  *
@@ -262,6 +279,7 @@ struct xe_config_group_device {
 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
 		bool survivability_mode;
 		bool enable_psmi;
+		unsigned int max_msix_vecs;
 		struct {
 			unsigned int max_vfs;
 			bool admin_only_pf;
@@ -281,6 +299,7 @@ static const struct xe_config_device device_defaults = {
 	.engines_allowed = U64_MAX,
 	.survivability_mode = false,
 	.enable_psmi = false,
+	.max_msix_vecs = XE_MSIX_MAX_VECS,
 	.sriov = {
 		.max_vfs = XE_DEFAULT_MAX_VFS,
 		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
@@ -794,6 +813,35 @@ static ssize_t wa_bb_store(struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
 	return len;
 }
 
+static ssize_t max_msix_vecs_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	return sprintf(page, "%u\n", dev->max_msix_vecs);
+}
+
+static ssize_t max_msix_vecs_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	unsigned int max_msix_vecs;
+	int ret;
+
+	ret = kstrtouint(page, 0, &max_msix_vecs);
+	if (ret)
+		return ret;
+
+	if (!max_msix_vecs || max_msix_vecs > XE_MSIX_MAX_VECS)
+		return -EINVAL;
+
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
+	dev->config.max_msix_vecs = max_msix_vecs;
+
+	return len;
+}
+
 static ssize_t ctx_restore_mid_bb_store(struct config_item *item,
 					const char *data, size_t sz)
 {
@@ -816,6 +864,7 @@ CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, survivability_mode);
+CONFIGFS_ATTR(, max_msix_vecs);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_ctx_restore_mid_bb,
@@ -824,6 +873,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
 	&attr_survivability_mode,
+	&attr_max_msix_vecs,
 	NULL,
 };
 
@@ -1099,6 +1149,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
 	PRI_CUSTOM_ATTR("%d", survivability_mode);
+	PRI_CUSTOM_ATTR("%u", max_msix_vecs);
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
 #undef PRI_CUSTOM_ATTR
@@ -1277,6 +1328,26 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 	return len;
 }
 
+/**
+ * xe_configfs_get_max_msix_vecs - get configfs max_msix_vecs setting
+ * @pdev: pci device
+ *
+ * Return: maximum total number of MSI-X vectors the driver may use
+ */
+unsigned int xe_configfs_get_max_msix_vecs(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	unsigned int val;
+
+	if (!dev)
+		return device_defaults.max_msix_vecs;
+
+	val = dev->config.max_msix_vecs;
+	config_group_put(&dev->group);
+
+	return val;
+}
+
 #ifdef CONFIG_PCI_IOV
 /**
  * xe_configfs_admin_only_pf() - Get PF's operational mode.
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 07d62bf0c152..68115bff0fa0 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -10,6 +10,7 @@
 
 #include "xe_defaults.h"
 #include "xe_hw_engine_types.h"
+#include "xe_irq.h"
 #include "xe_module.h"
 
 struct pci_dev;
@@ -29,6 +30,7 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 					enum xe_engine_class class,
 					const u32 **cs);
+unsigned int xe_configfs_get_max_msix_vecs(struct pci_dev *pdev);
 #ifdef CONFIG_PCI_IOV
 unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
 bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
@@ -48,6 +50,10 @@ static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 						      enum xe_engine_class class,
 						      const u32 **cs) { return 0; }
+static inline unsigned int xe_configfs_get_max_msix_vecs(struct pci_dev *pdev)
+{
+	return XE_MSIX_MAX_VECS;
+}
 #ifdef CONFIG_PCI_IOV
 static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
 {
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index c84d2283dd6a..40d3d43e492f 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -11,6 +11,7 @@
 
 #include "display/xe_display.h"
 #include "regs/xe_irq_regs.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_drv.h"
 #include "xe_exec_queue.h"
@@ -896,7 +897,9 @@ static int xe_irq_msix_init(struct xe_device *xe)
 		return nvec;
 	}
 
-	xe->irq.msix.nvec = min_t(int, nvec, XE_MSIX_MAX_VECS);
+	xe->irq.msix.nvec =
+		min_t(int, nvec, xe_configfs_get_max_msix_vecs(pdev));
+
 	xa_init_flags(&xe->irq.msix.indexes, XA_FLAGS_ALLOC);
 	return 0;
 }
-- 
2.43.0

