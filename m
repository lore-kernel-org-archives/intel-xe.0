Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5457C83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 21:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B28E10E06C;
	Wed, 23 Jul 2025 21:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nqv7cyyZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9EA10E06C
 for <Intel-Xe@lists.freedesktop.org>; Wed, 23 Jul 2025 21:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753305622; x=1784841622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F2E5udVM+8aKtbXZkieD7nsB/nuvPjaRdGq9rtXd1HU=;
 b=Nqv7cyyZHYl+Rxgcr2E/KTBMjTH/xhUgCIIhNW1VMJymXzqkzEC0AZiR
 hPVmZtzpmrOoN9VNy+HxQZRMFe2RhQTx65JhPRhJ1KZuSgQPLlqV+MbNb
 /CF8EkTvzNzcc/iN9o4wdfSa4GyfZJaD98CYZegg0JrfunQmXKRi5ri5l
 rMsELO6vqmHQqvY9n5A1p1D+gux0nEqPFUh0sp50P/CsOQJJaRWoBe3Z4
 4+vnLeo0xlmekDlm/wau8iHS3gM6m9mJ8MUoCKU7hyhYn1bcXCv6/7vrm
 Z1dzoOx8uVDG9QH4HUYV8i1gV8K4HCnoKEctQt0SNbioxAIqbHkBJzHUS g==;
X-CSE-ConnectionGUID: CtpdVqLpQBawerPYiVavnw==
X-CSE-MsgGUID: RgCld09LS/+l0tPCM+FElg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66168649"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="66168649"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 14:20:21 -0700
X-CSE-ConnectionGUID: ZdBpY5zCQkmITK85W8V8Xg==
X-CSE-MsgGUID: AynL2jYMR1+Fv2M1nzNT1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="159040452"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa010.jf.intel.com with ESMTP; 23 Jul 2025 14:20:21 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
Date: Wed, 23 Jul 2025 14:20:20 -0700
Message-ID: <20250723212020.3678133-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250723212020.3678133-1-John.C.Harrison@Intel.com>
References: <20250723212020.3678133-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

The GuC has an option to write log data via NPK. This is basically a
magic IO address that GuC writes arbitrary data to and which can be
logged by a suitable hardware logger. This can allow retrieval of the
GuC log in hardware debug environments even when the system as a whole
dies horribly.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 61 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |  3 ++
 drivers/gpu/drm/xe/xe_guc.c      |  5 +++
 3 files changed, 69 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 8ec1ff1e4e80..9fbd7e2ab152 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -77,6 +77,17 @@
  * available for migrations, but it's disabled. This is intended for debugging
  * purposes only.
  *
+ * GuC log target:
+ * ---------------
+ *
+ * Specify the target for GuC firmware logging:
+ *   0 = memory
+ *   1 = NPK
+ *   2 = memory + NPK
+ *
+ * Note that logging via NPK (North Peak) is only useful if some kind of hardware
+ * debugger is attached that can save out the NPK stream externally.
+ *
  * Remove devices
  * ==============
  *
@@ -90,6 +101,7 @@ struct xe_config_device {
 
 	bool survivability_mode;
 	u64 engines_allowed;
+	u32 guc_log_target;
 
 	/* protects attributes */
 	struct mutex lock;
@@ -226,12 +238,38 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 	return len;
 }
 
+static ssize_t guc_log_target_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	return sprintf(page, "%d\n", dev->guc_log_target);
+}
+
+static ssize_t guc_log_target_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+	u32 guc_log_target;
+	int ret;
+
+	ret = kstrtou32(page, 0, &guc_log_target);
+	if (ret)
+		return ret;
+
+	mutex_lock(&dev->lock);
+	dev->guc_log_target = guc_log_target;
+	mutex_unlock(&dev->lock);
+
+	return len;
+}
+
 CONFIGFS_ATTR(, survivability_mode);
 CONFIGFS_ATTR(, engines_allowed);
+CONFIGFS_ATTR(, guc_log_target);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_survivability_mode,
 	&attr_engines_allowed,
+	&attr_guc_log_target,
 	NULL,
 };
 
@@ -386,6 +424,29 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
 	return engines_allowed;
 }
 
+/**
+ * xe_configfs_get_guc_log_target - get configfs GuC log target attribute
+ * @pdev: pci device
+ *
+ * find the configfs group that belongs to the pci device and return
+ * the GuC log target attribute
+ *
+ * Return: GuC log target if config group is found, false otherwise
+ */
+u32 xe_configfs_get_guc_log_target(struct pci_dev *pdev)
+{
+	struct xe_config_device *dev = configfs_find_group(pdev);
+	u32 guc_log_target;
+
+	if (!dev)
+		return false;
+
+	guc_log_target = dev->guc_log_target;
+	config_item_put(&dev->group.cg_item);
+
+	return guc_log_target;
+}
+
 int __init xe_configfs_init(void)
 {
 	struct config_group *root = &xe_configfs.su_group;
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index fb8764008089..97f9ad0f9495 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -16,12 +16,15 @@ void xe_configfs_exit(void);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
 void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
+u32 xe_configfs_get_guc_log_target(struct pci_dev *pdev);
 #else
 static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
 static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
 static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
+static inline u32 xe_configfs_get_guc_log_target(struct pci_dev *pdev) { return 0; }
+
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 8fac3c518975..53ef93e162d2 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -16,6 +16,7 @@
 #include "regs/xe_guc_regs.h"
 #include "regs/xe_irq_regs.h"
 #include "xe_bo.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
@@ -67,6 +68,7 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
 
 static u32 guc_ctl_debug_flags(struct xe_guc *guc)
 {
+	u32 target = xe_configfs_get_guc_log_target(to_pci_dev(guc_to_xe(guc)->drm.dev));
 	u32 level = xe_guc_log_get_level(&guc->log);
 	u32 flags = 0;
 
@@ -75,6 +77,9 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
 	else
 		flags |= FIELD_PREP(GUC_LOG_VERBOSITY, GUC_LOG_LEVEL_TO_VERBOSITY(level));
 
+	if (target)
+		flags |= FIELD_PREP(GUC_LOG_DESTINATION, target);
+
 	return flags;
 }
 
-- 
2.49.0

