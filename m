Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D1FC7EE30
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 12:57:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDBB10E2B8;
	Tue,  1 Jul 2025 12:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iHufuiFY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7662310E2B8
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 12:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751374618; x=1782910618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JCMJh6GL6R4gK5iUTMK0FJ8sKqIkaQpb3CM3peMoLMo=;
 b=iHufuiFYdZQU/ZS5YpQtFQ7OftxZL2tWc1wuXKGetVN3MaPx3G6inc+R
 Ap09W5Z67otAAoWPRZKSngY8hsDvLLX+bCW7DA3buXrTmzktgSnDisnHR
 Nzpnu7jLGKfLM4E46HI2nB14gs4yrLBOD/CW+5FwzfSE2N5IHdzxZ564T
 fPPouhdqtNLMXXTVjkUT6vzrtLOBPlkEqp9Xqi2ifb5kfmDRonwyTbbV/
 hlencmj+eOkCuQ6mzruQL2pwORBwOGCD59zgPiQJkQRgx1+l/YaZetKGH
 oetOpRsrwhSSxRUq+05I0QiFWka96NzvynQWDU7ADrzELkkbCMQOhhq3f A==;
X-CSE-ConnectionGUID: oiWwtRA/QzS496uwtsC4Jw==
X-CSE-MsgGUID: x1LsR+kTTOGKQqiadRKI7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53745197"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53745197"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 05:56:58 -0700
X-CSE-ConnectionGUID: PaCL3oqDTwGFqwFaxVQ0Ew==
X-CSE-MsgGUID: eYVYvoKGSKCP7OcFDZMy8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153236553"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.176])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 05:56:57 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 2/7] drm/xe: Move PF and VF device types to separate headers
Date: Tue,  1 Jul 2025 14:56:41 +0200
Message-Id: <20250701125646.1568-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250701125646.1568-1-michal.wajdeczko@intel.com>
References: <20250701125646.1568-1-michal.wajdeczko@intel.com>
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
index 5f0b993b598c..554975418ea9 100644
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

