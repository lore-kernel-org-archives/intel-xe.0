Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18E6C87FCC
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 19:34:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8819110E7D5;
	Thu, 31 Jul 2025 19:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1M7cITj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE96C10E7DE
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 19:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753990447; x=1785526447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fhj4FbF3zUBpHtvNsYmKDuE18GtQZWgGfxM/RDskXTk=;
 b=d1M7cITjdcyXzJAd+ud/84pMOOOs0Pzs18TZVflTvPEUPUOqx1LaNyC7
 c7YFHq1uvZd/9zYoUW1Rtazds7g/9Ebmv5sVpjmvj/gufM/M29VyiY04m
 PlEi0OBeXC0/wyH3znzDZP4579av8pwBkrPRRRkJVaNDeKAyqziht33i9
 /EBeCjIp4KZS5w6fa08MAuR4Yy1GTU/1qYA5K2SlpZFOhddKrIM20X/r+
 /To9ik20gCbaZ8BII35a5TM4OYg1h056LC0dxSd27jlWFvA/WvMInEDyW
 LfDZbPvtIaulhhlJRQvBfMrtAIGcF7OIdo33PClb3LZFuT7CZgUYfAoID A==;
X-CSE-ConnectionGUID: bh0BnwDCRKuTdoaKBlPrQw==
X-CSE-MsgGUID: BU450KQOQV2RtYnC1sqB+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55395030"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="55395030"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:34:07 -0700
X-CSE-ConnectionGUID: 4caCR0YbQD+VbUTgIR3/cQ==
X-CSE-MsgGUID: RzVMiG4/SD2mUVjGIxR02g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="194334006"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:34:06 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v6 09/11] drm/xe/configfs: Check if device was preconfigured
Date: Thu, 31 Jul 2025 21:33:37 +0200
Message-ID: <20250731193339.179829-10-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731193339.179829-1-michal.wajdeczko@intel.com>
References: <20250731193339.179829-1-michal.wajdeczko@intel.com>
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
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
v2: make function void, rename helpers (Lucas) and rebased
---
 drivers/gpu/drm/xe/xe_configfs.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |  2 ++
 drivers/gpu/drm/xe/xe_pci.c      |  3 +++
 3 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 150e7f2becc8..5f145ccdf535 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -107,6 +107,11 @@ static void set_device_defaults(struct xe_config_device *config)
 	*config = device_defaults;
 }
 
+static bool config_device_is_default(const struct xe_config_device *config)
+{
+	return !memcmp(config, &device_defaults, sizeof(*config));
+}
+
 struct engine_info {
 	const char *cls;
 	u64 mask;
@@ -339,6 +344,26 @@ static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev
 	return to_xe_config_group_device(item);
 }
 
+/**
+ * xe_configfs_check_device() - Test if device was configured by configfs
+ * @pdev: the &pci_dev device to test
+ *
+ * Try to find the configfs group that belongs to the specified pci device
+ * and print a diagnostic message if found.
+ */
+void xe_configfs_check_device(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+
+	if (!dev)
+		return;
+
+	pci_dbg(pdev, "found %s settings in configfs\n",
+		config_device_is_default(&dev->config) ? "default" : "custom");
+
+	config_group_put(&dev->group);
+}
+
 /**
  * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
  * @pdev: pci device
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index fb8764008089..fa4ea7f0c375 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -13,12 +13,14 @@ struct pci_dev;
 #if IS_ENABLED(CONFIG_CONFIGFS_FS)
 int xe_configfs_init(void);
 void xe_configfs_exit(void);
+void xe_configfs_check_device(struct pci_dev *pdev);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
 void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 #else
 static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
+static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
 static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
 static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 52d46c66ae1e..9ce6e6dca5bc 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -17,6 +17,7 @@
 
 #include "display/xe_display.h"
 #include "regs/xe_gt_regs.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_drv.h"
 #include "xe_gt.h"
@@ -771,6 +772,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct xe_device *xe;
 	int err;
 
+	xe_configfs_check_device(pdev);
+
 	if (desc->require_force_probe && !id_forced(pdev->device)) {
 		dev_info(&pdev->dev,
 			 "Your graphics device %04x is not officially supported\n"
-- 
2.47.1

