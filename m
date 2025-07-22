Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBDEC83F27
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 14:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D952D10E699;
	Tue, 22 Jul 2025 14:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C9uxkUU/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA32910E699
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 14:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753193499; x=1784729499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4RXpV30q2un1YZHEyZEorV7TQC5GBQw0kvxrhJ2BjiQ=;
 b=C9uxkUU/nv+xIG5r/tBThl7ddVbVTM8iWem3VTjSR6zwSrBd1PL2zoyx
 er1ItUuSD4yiRGeqpizvmCAlkI599a2iycjDCNKH+5xA6mO5sRPiVJp4M
 HVRszzlPRJOaORYKT81aQvHzYL+EALqUSQSpyaiuy6qrCm+wtVWGjxVPv
 2KRkBH3y25mJ2WChk6qbMcbMwigqmFiLpXau32C3FefLZZ+jYqsr3Eqao
 TFicdaSQc+43qUwTDEAhJJtCp2lwDBZqb7zzg4aWll1fCQDGfCeOASQYa
 h3++XVlPeVJPBffJjUNFB0//ZA2adf7ATG4uBiTv1RV1lt7nFWu2heRjq A==;
X-CSE-ConnectionGUID: zHKRQkzXT/uvR4zXTd7xEw==
X-CSE-MsgGUID: 91wbdVzXT0adkJ/+pwTGNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="54663034"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="54663034"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 07:11:38 -0700
X-CSE-ConnectionGUID: b5ZSRdkUR+eGoBXzSMY1GQ==
X-CSE-MsgGUID: 8rzBpGZGRNmaTO+83Z+0qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163396278"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 07:11:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 4/6] drm/xe/configfs: Check if device was preconfigured
Date: Tue, 22 Jul 2025 16:10:57 +0200
Message-ID: <20250722141059.30707-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722141059.30707-1-michal.wajdeczko@intel.com>
References: <20250722141059.30707-1-michal.wajdeczko@intel.com>
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

Since device configuration using configfs could be prepared long
time prior the driver load, add a debug log whether the current
device driver probe is using custom or default settings.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 35 ++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_configfs.h |  2 ++
 drivers/gpu/drm/xe/xe_pci.c      |  3 +++
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 36e2b45b305f..f83e8e9f070f 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -118,6 +118,17 @@ static struct xe_config_device *to_xe_config_device(struct config_item *item)
 	return container_of(to_config_group(item), struct xe_config_device, group);
 }
 
+static void xe_config_set_defaults(struct xe_config_device *dev)
+{
+	dev->engines_allowed = U64_MAX;
+	dev->survivability_mode = false;
+}
+
+static bool xe_config_is_default(const struct xe_config_device *dev)
+{
+	return dev->engines_allowed == U64_MAX && !dev->survivability_mode;
+}
+
 static ssize_t survivability_mode_show(struct config_item *item, char *page)
 {
 	struct xe_config_device *dev = to_xe_config_device(item);
@@ -281,8 +292,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 	if (!dev)
 		return ERR_PTR(-ENOMEM);
 
-	/* Default values */
-	dev->engines_allowed = U64_MAX;
+	xe_config_set_defaults(dev);
 
 	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
 
@@ -323,6 +333,27 @@ static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
 	return to_xe_config_device(item);
 }
 
+/**
+ * xe_configfs_check_device() - Test if device was configured by configfs
+ * @pdev: the &pci_dev device to test
+ *
+ * Try to find the configfs group that belongs to the specified pci device
+ * and print a diagnostic message if found.
+ *
+ * Return: true if config group is found, false otherwise
+ */
+bool xe_configfs_check_device(struct pci_dev *pdev)
+{
+	struct xe_config_device *cfg = configfs_find_group(pdev);
+
+	if (!cfg)
+		return false;
+
+	pci_dbg(pdev, "found %s settings in configfs\n",
+		xe_config_is_default(cfg) ? "default" : "custom");
+	return true;
+}
+
 /**
  * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
  * @pdev: pci device
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index fb8764008089..cdccf1f9b716 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -13,12 +13,14 @@ struct pci_dev;
 #if IS_ENABLED(CONFIG_CONFIGFS_FS)
 int xe_configfs_init(void);
 void xe_configfs_exit(void);
+bool xe_configfs_check_device(struct pci_dev *pdev);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
 void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 #else
 static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
+static inline bool xe_configfs_check_device(struct pci_dev *pdev) { return false; }
 static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
 static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index f4ea13527945..322dc52c4a0b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -17,6 +17,7 @@
 
 #include "display/xe_display.h"
 #include "regs/xe_gt_regs.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_drv.h"
 #include "xe_gt.h"
@@ -770,6 +771,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct xe_device *xe;
 	int err;
 
+	xe_configfs_check_device(pdev);
+
 	if (desc->require_force_probe && !id_forced(pdev->device)) {
 		dev_info(&pdev->dev,
 			 "Your graphics device %04x is not officially supported\n"
-- 
2.47.1

