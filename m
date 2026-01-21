Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC84CC44506
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 21:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A270D10E880;
	Wed, 21 Jan 2026 21:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3EHjsHZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1E210E1D4
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 21:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769031756; x=1800567756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lcRK5aUYw4EL4aXMYJMLYRgrMlClHr8I9g+FAub6ASQ=;
 b=m3EHjsHZO+J+UdZku8bv4JGlHCERC2uFAUUemg4Em156uOJYk9Mbq1Eu
 7f0cAQMBg0ZwjJYpLzIllGg9mvamKpsUAQNlaNJ3/4+zVjO1AboD3Io7p
 37Brkyu70KP5zAQ+9Eu1/Sn19TP5Xd7bLu6w5WgQhINTw1CCBvz1v/WYI
 W6GhM67mbOVSyY9jqhZqbnZrvAIYLNkyiI+rK1x+pWTntRaxhJ+BozY01
 f7MOMc5TcTe/KtPP/+xBOktzaG7adB+dZWl9NqPHdbk8B+9ZqwGOw93K1
 BUsUc7j4PxnKNWwW9v61s79AkfiBO8vB+DymROf8WzcikY2OLAxiaNoxY g==;
X-CSE-ConnectionGUID: X9FrQ6zRSia2Pu60nD/unQ==
X-CSE-MsgGUID: 3UO2UXD9SnaYakVU2otHcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70433941"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="70433941"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 13:42:35 -0800
X-CSE-ConnectionGUID: U5P5qXiPQwG32rzTMunw0w==
X-CSE-MsgGUID: ShTNymP1Q2uX3qy33zh8Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="205691623"
Received: from lalin-p14sg4.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.33.19])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 13:42:34 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/5] drm/xe/configfs: Always return consistent max_vfs value
Date: Wed, 21 Jan 2026 22:42:14 +0100
Message-ID: <20260121214218.2817-4-michal.wajdeczko@intel.com>
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

The max_vfs parameter used by the Xe driver has its default value
definition, but it could be altered by the module parameter or by
the device specific configfs attribute.

To avoid mistakes or code duplication, always rely on the configfs
helper (or stub), which will provide necessary fallback if needed.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 3 ++-
 drivers/gpu/drm/xe/xe_configfs.h | 8 +++++++-
 drivers/gpu/drm/xe/xe_sriov_pf.c | 4 +---
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 9f6251b1008b..a823b0bd4ebb 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -15,6 +15,7 @@
 
 #include "instructions/xe_mi_commands.h"
 #include "xe_configfs.h"
+#include "xe_defaults.h"
 #include "xe_gt_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_module.h"
@@ -280,7 +281,7 @@ static const struct xe_config_device device_defaults = {
 	.survivability_mode = false,
 	.enable_psmi = false,
 	.sriov = {
-		.max_vfs = UINT_MAX,
+		.max_vfs = XE_DEFAULT_MAX_VFS,
 	},
 };
 
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 510888354a7c..e0a555b871b3 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 #include "xe_hw_engine_types.h"
+#include "xe_module.h"
 
 struct pci_dev;
 
@@ -41,7 +42,12 @@ static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum
 						     const u32 **cs) { return 0; }
 static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
 						      const u32 **cs) { return 0; }
-static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev) { return UINT_MAX; }
+#ifdef CONFIG_PCI_IOV
+static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
+{
+	return xe_modparam.max_vfs;
+}
+#endif
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index 6ce3c58e003c..33bd754d138f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -22,9 +22,7 @@
 
 static unsigned int wanted_max_vfs(struct xe_device *xe)
 {
-	if (IS_ENABLED(CONFIG_CONFIGFS_FS))
-		return xe_configfs_get_max_vfs(to_pci_dev(xe->drm.dev));
-	return xe_modparam.max_vfs;
+	return xe_configfs_get_max_vfs(to_pci_dev(xe->drm.dev));
 }
 
 static int pf_reduce_totalvfs(struct xe_device *xe, int limit)
-- 
2.47.1

