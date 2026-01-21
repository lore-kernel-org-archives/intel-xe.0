Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B4FC44500
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 21:42:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A744810E88B;
	Wed, 21 Jan 2026 21:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VSO6gvv7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991BA10E880
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 21:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769031758; x=1800567758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BElhj0CtkQFogdB6O5jevdIyuRcHzLhWJUFwPyDCf18=;
 b=VSO6gvv7BW07IBHFefyam+1TUv199Ab42m1DZzyB+fkTK3upVI6n6Feu
 BOMJyrHlItqL0rP+kpmMskpD/MdeChEzdhALDot+l1vNn0wQMGgb9lFUO
 iSMUOk4A6MS3aXRK+Jl80BANbOElPZBeUBT9yGbmJWP/Q+wUn0vBDTyhh
 OFB6CgyA2WBJqDecVuZhQzCb7l3UbnqhseeiiNZNzRx329WNhjYdILLuq
 fAsGOY5rhzdiAoS1HhklMe5NNwKSXGWT8TVBzYYw4ebrGufmegqt49D2y
 FFHqtugV1dSkogHq6czeXvoAkbBrv8xoqmXHfr0kVo14MD+2SoFP1lzbD g==;
X-CSE-ConnectionGUID: 3SdO+5QfSniJoO9kLM6IBQ==
X-CSE-MsgGUID: KKiw/9+VRQCnucgTi8IIyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70433945"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="70433945"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 13:42:38 -0800
X-CSE-ConnectionGUID: 9ipg59/aRFuMUpjWbSY0yQ==
X-CSE-MsgGUID: 3Y0087fGSiuIqRKlVHngng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="205691632"
Received: from lalin-p14sg4.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.33.19])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 13:42:36 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 5/5] drm/xe/configfs: Add sriov.admin_only_pf attribute
Date: Wed, 21 Jan 2026 22:42:16 +0100
Message-ID: <20260121214218.2817-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121214218.2817-1-michal.wajdeczko@intel.com>
References: <20260121214218.2817-1-michal.wajdeczko@intel.com>
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

Instead of relying on fixed relation to the display probe flag,
add configfs attribute to allow an administrator to configure
desired PF operation mode in a more flexible way.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 61 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |  6 ++++
 drivers/gpu/drm/xe/xe_defaults.h |  1 +
 drivers/gpu/drm/xe/xe_sriov_pf.c |  2 +-
 4 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index a823b0bd4ebb..2596810f4366 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -264,6 +264,7 @@ struct xe_config_group_device {
 		bool enable_psmi;
 		struct {
 			unsigned int max_vfs;
+			bool admin_only_pf;
 		} sriov;
 	} config;
 
@@ -282,6 +283,7 @@ static const struct xe_config_device device_defaults = {
 	.enable_psmi = false,
 	.sriov = {
 		.max_vfs = XE_DEFAULT_MAX_VFS,
+		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
 	},
 };
 
@@ -898,10 +900,40 @@ static ssize_t sriov_max_vfs_store(struct config_item *item, const char *page, s
 	return len;
 }
 
+static ssize_t sriov_admin_only_pf_show(struct config_item *item, char *page)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
+
+	guard(mutex)(&dev->lock);
+
+	return sprintf(page, "%s\n", str_yes_no(dev->config.sriov.admin_only_pf));
+}
+
+static ssize_t sriov_admin_only_pf_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
+	bool admin_only_pf;
+	int ret;
+
+	guard(mutex)(&dev->lock);
+
+	if (is_bound(dev))
+		return -EBUSY;
+
+	ret = kstrtobool(page, &admin_only_pf);
+	if (ret)
+		return ret;
+
+	dev->config.sriov.admin_only_pf = admin_only_pf;
+	return len;
+}
+
 CONFIGFS_ATTR(sriov_, max_vfs);
+CONFIGFS_ATTR(sriov_, admin_only_pf);
 
 static struct configfs_attribute *xe_config_sriov_attrs[] = {
 	&sriov_attr_max_vfs,
+	&sriov_attr_admin_only_pf,
 	NULL,
 };
 
@@ -912,6 +944,8 @@ static bool xe_config_sriov_is_visible(struct config_item *item,
 
 	if (attr == &sriov_attr_max_vfs && dev->mode != XE_SRIOV_MODE_PF)
 		return false;
+	if (attr == &sriov_attr_admin_only_pf && dev->mode != XE_SRIOV_MODE_PF)
+		return false;
 
 	return true;
 }
@@ -1065,6 +1099,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
 	PRI_CUSTOM_ATTR("%d", survivability_mode);
+	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
 #undef PRI_CUSTOM_ATTR
 }
@@ -1243,6 +1278,32 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 }
 
 #ifdef CONFIG_PCI_IOV
+/**
+ * xe_configfs_admin_only_pf() - Get PF's operational mode.
+ * @pdev: the &pci_dev device
+ *
+ * Find the configfs group that belongs to the PCI device and return a flag
+ * whether the PF driver should be dedicated for VFs management only.
+ *
+ * If configfs group is not present, use driver's default value.
+ *
+ * Return: true if PF driver is dedicated for VFs administration only.
+ */
+bool xe_configfs_admin_only_pf(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	bool admin_only_pf;
+
+	if (!dev)
+		return XE_DEFAULT_ADMIN_ONLY_PF;
+
+	scoped_guard(mutex, &dev->lock)
+		admin_only_pf = dev->config.sriov.admin_only_pf;
+
+	config_group_put(&dev->group);
+
+	return admin_only_pf;
+}
 /**
  * xe_configfs_get_max_vfs() - Get number of VFs that could be managed
  * @pdev: the &pci_dev device
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index e0a555b871b3..487531269511 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -8,6 +8,7 @@
 #include <linux/limits.h>
 #include <linux/types.h>
 
+#include "xe_defaults.h"
 #include "xe_hw_engine_types.h"
 #include "xe_module.h"
 
@@ -28,6 +29,7 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_cla
 					const u32 **cs);
 #ifdef CONFIG_PCI_IOV
 unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
+bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
 #endif
 #else
 static inline int xe_configfs_init(void) { return 0; }
@@ -47,6 +49,10 @@ static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
 {
 	return xe_modparam.max_vfs;
 }
+static inline bool xe_configfs_admin_only_pf(struct pci_dev *pdev)
+{
+	return XE_DEFAULT_ADMIN_ONLY_PF;
+}
 #endif
 #endif
 
diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
index 9183d05b96e1..5d5d41d067c5 100644
--- a/drivers/gpu/drm/xe/xe_defaults.h
+++ b/drivers/gpu/drm/xe/xe_defaults.h
@@ -18,6 +18,7 @@
 #define XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
 #define XE_DEFAULT_MAX_VFS			~0
 #define XE_DEFAULT_MAX_VFS_STR			"unlimited"
+#define XE_DEFAULT_ADMIN_ONLY_PF		false
 #define XE_DEFAULT_WEDGED_MODE			XE_WEDGED_MODE_UPON_CRITICAL_ERROR
 #define XE_DEFAULT_WEDGED_MODE_STR		"upon-critical-error"
 #define XE_DEFAULT_SVM_NOTIFIER_SIZE		512
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index 919f176a19eb..47a6e0fd66e0 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -22,7 +22,7 @@
 
 static bool wanted_admin_only(struct xe_device *xe)
 {
-	return !xe->info.probe_display;
+	return xe_configfs_admin_only_pf(to_pci_dev(xe->drm.dev));
 }
 
 static unsigned int wanted_max_vfs(struct xe_device *xe)
-- 
2.47.1

