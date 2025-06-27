Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E220C7EE3A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 12:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12ED410EA15;
	Fri, 27 Jun 2025 12:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nIR6qmVq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4EA10EA10
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 12:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751028570; x=1782564570;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lc6zuBZjZaFrQpyM4dmF3RU1BaLsUdgHSY8uBfR73Jc=;
 b=nIR6qmVqxEcp0pMW5P756e229Ci0N83j1bkc8qF9hgmfDAQ2i7oXbnIM
 J9S/AgzaTLirKkab7qf6DywDeOnd7aOZtk7hbgXMGouZpBKHfXo88lS4g
 FqFPunPrOBUfbhb0ep6vXmRYIWKIu9TjPYPHDYyRX99X8p3+jVpGYr/Xi
 ZUiYv+igfoYBRhpa91v2aSC8uUs1rBqJCz6vqt4voP+7lbGptFHNBCdAf
 xichgb9jZNFEckTP3DJb/j0NRUu5q9aQhG5HQPdntrbJoV7+o3M7E+uE6
 0fkqpcbd4TsQb5AQfnS8HALzm8pK1TdvdofvjKTDlps6kA1DOKTg+tTh8 g==;
X-CSE-ConnectionGUID: s086dKsmRtu2aMgcUId4Aw==
X-CSE-MsgGUID: uURcQUNcRw+zgnqw021I7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64031908"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="64031908"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 05:49:30 -0700
X-CSE-ConnectionGUID: p7e1Wct/Stq+hls8Uq9HDg==
X-CSE-MsgGUID: FZrTSBLvStaCXtRXX9IRYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="152969699"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 05:49:28 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 2/7] drm/xe: Move PF and VF device types to separate headers
Date: Fri, 27 Jun 2025 14:49:11 +0200
Message-Id: <20250627124916.1392-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250627124916.1392-1-michal.wajdeczko@intel.com>
References: <20250627124916.1392-1-michal.wajdeczko@intel.com>
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

We plan to add more PF and VF types and mixing them in a single
file is not desired.  Move them out to new dedicated files.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h   |  2 ++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h | 29 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_types.h    | 36 --------------------------
 drivers/gpu/drm/xe/xe_sriov_vf_types.h | 27 +++++++++++++++++++
 4 files changed, 58 insertions(+), 36 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_types.h

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 962acd451734..64a7e4c52a11 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -21,7 +21,9 @@
 #include "xe_platform_types.h"
 #include "xe_pmu_types.h"
 #include "xe_pt_types.h"
+#include "xe_sriov_pf_types.h"
 #include "xe_sriov_types.h"
+#include "xe_sriov_vf_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
 #include "xe_ttm_vram_mgr_types.h"
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
new file mode 100644
index 000000000000..918dc089eb1d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PF_TYPES_H_
+#define _XE_SRIOV_PF_TYPES_H_
+
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+/**
+ * struct xe_device_pf - Xe PF related data
+ *
+ * The data in this structure is valid only if driver is running in the
+ * @XE_SRIOV_MODE_PF mode.
+ */
+struct xe_device_pf {
+	/** @device_total_vfs: Maximum number of VFs supported by the device. */
+	u16 device_total_vfs;
+
+	/** @driver_max_vfs: Maximum number of VFs supported by the driver. */
+	u16 driver_max_vfs;
+
+	/** @master_lock: protects all VFs configurations across GTs */
+	struct mutex master_lock;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
index ca94382a721e..1a138108d139 100644
--- a/drivers/gpu/drm/xe/xe_sriov_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_types.h
@@ -7,9 +7,6 @@
 #define _XE_SRIOV_TYPES_H_
 
 #include <linux/build_bug.h>
-#include <linux/mutex.h>
-#include <linux/types.h>
-#include <linux/workqueue_types.h>
 
 /**
  * VFID - Virtual Function Identifier
@@ -40,37 +37,4 @@ enum xe_sriov_mode {
 };
 static_assert(XE_SRIOV_MODE_NONE);
 
-/**
- * struct xe_device_pf - Xe PF related data
- *
- * The data in this structure is valid only if driver is running in the
- * @XE_SRIOV_MODE_PF mode.
- */
-struct xe_device_pf {
-	/** @device_total_vfs: Maximum number of VFs supported by the device. */
-	u16 device_total_vfs;
-
-	/** @driver_max_vfs: Maximum number of VFs supported by the driver. */
-	u16 driver_max_vfs;
-
-	/** @master_lock: protects all VFs configurations across GTs */
-	struct mutex master_lock;
-};
-
-/**
- * struct xe_device_vf - Xe Virtual Function related data
- *
- * The data in this structure is valid only if driver is running in the
- * @XE_SRIOV_MODE_VF mode.
- */
-struct xe_device_vf {
-	/** @migration: VF Migration state data */
-	struct {
-		/** @migration.worker: VF migration recovery worker */
-		struct work_struct worker;
-		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
-		unsigned long gt_flags;
-	} migration;
-};
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
new file mode 100644
index 000000000000..55c2421d4b2e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_VF_TYPES_H_
+#define _XE_SRIOV_VF_TYPES_H_
+
+#include <linux/workqueue_types.h>
+
+/**
+ * struct xe_device_vf - Xe Virtual Function related data
+ *
+ * The data in this structure is valid only if driver is running in the
+ * @XE_SRIOV_MODE_VF mode.
+ */
+struct xe_device_vf {
+	/** @migration: VF Migration state data */
+	struct {
+		/** @migration.worker: VF migration recovery worker */
+		struct work_struct worker;
+		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
+		unsigned long gt_flags;
+	} migration;
+};
+
+#endif
-- 
2.47.1

