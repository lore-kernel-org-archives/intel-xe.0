Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649B6C87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 17:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2456410E1EC;
	Fri,  8 Aug 2025 17:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ljaULdI7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA5410E1EC
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 17:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754674210; x=1786210210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+mnf8YrZE4miwVXVHWhl8J5A/g4V5KkmXe4vvuNnYY0=;
 b=ljaULdI7R1qDrWC+Ns5uDv2Wkj+jOEj6pBjozW4p97s4e4AbqA/mTujx
 hcU9/wwbMTe8nX/BYgJP/30oI0oWTmgylKTkoBVfA7AB/W6nSolLPeT40
 sjo6My1r5UJYqYRJiGcCaky1LDnvROAHNVRd/FV3wtz2VFAJU+xr/+p/k
 Lp4i8NPAu/C60gqJfTKkrbDvlNQ22Gnn4GHrQEFuYeXRgQzPJU4SZXVYP
 DSw5uhZOwgEJYVXepA3e5Oewnla9AHWNk696wpXy/HWKfv8tUtEKHu9eu
 XloaPhqvMIE6dKEI96/8SfbF9DlCCOsIlBUBhteqBa3U8sUPXE2eWGxun Q==;
X-CSE-ConnectionGUID: fBszBe23SjC8oZYsWg0ufw==
X-CSE-MsgGUID: RflQNU2JQhW4Jy9Uwekdww==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68109817"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68109817"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:09 -0700
X-CSE-ConnectionGUID: TB+w0vQERtqZ4xNsLT/DZQ==
X-CSE-MsgGUID: bViR0+uTTMaEJkBqqtU0/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165387397"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com, Matt Roper <matthew.d.roper@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 01/13] drm/xe/psmi: Add GuC flag to enable PSMI
Date: Fri,  8 Aug 2025 10:29:44 -0700
Message-ID: <20250808-psmi-v3-1-a111e9f1e4b7@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-858c0
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

PSMI allows to capture data from the GPU useful for early
validation. From the kernel side there isn't much to be done, just a few
things:

	1) Toggle the feature support in GuC
	2) Enable some additional WAs
	3) Allocate buffers

Here is the first step, with the next ones to follow. For now everything
is disabled through a check in configfs that is currently hardcoded to
disabled.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.h | 2 ++
 drivers/gpu/drm/xe/xe_guc.c      | 7 ++++++-
 drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index fb87640080896..c14588b86e833 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -16,12 +16,14 @@ void xe_configfs_exit(void);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
 void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
+static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
 #else
 static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
 static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
 static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
+static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 9e34401e4489f..cb757a53de856 100644
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
@@ -81,11 +82,15 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
 
 static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 {
+	struct xe_device *xe = guc_to_xe(guc);
 	u32 flags = GUC_CTL_ENABLE_LITE_RESTORE;
 
-	if (!guc_to_xe(guc)->info.skip_guc_pc)
+	if (!xe->info.skip_guc_pc)
 		flags |= GUC_CTL_ENABLE_SLPC;
 
+	if (xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev)))
+		flags |= GUC_CTL_ENABLE_PSMI;
+
 	return flags;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index ca9f999d38d1e..4dc000c977faf 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -112,6 +112,7 @@ struct guc_update_exec_queue_policy {
 #define GUC_CTL_FEATURE			2
 #define   GUC_CTL_ENABLE_SLPC		BIT(2)
 #define   GUC_CTL_ENABLE_LITE_RESTORE	BIT(4)
+#define   GUC_CTL_ENABLE_PSMI		BIT(7)
 #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
 
 #define GUC_CTL_DEBUG			3

-- 
2.50.1

