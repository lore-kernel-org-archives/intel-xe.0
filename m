Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4B6CA5FFE
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 19:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B7610EE65;
	Mon,  5 Oct 2026 19:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hh+suedm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BCA10E5F5
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 19:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791227176; x=1822763176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=btI4ng9djbHiG98ExZ1z5eZM/GuDk2wb2CTnU4+DNQU=;
 b=Hh+suedm47CJdWx4wz1VNSqQao8bigHDZ5Av5JQ2ZOWNYia6APPLDW90
 64kWvtSx56SEfrUfagtQCwTtJ8xPR6QErLteTHitoP+nDGrzDk/KgICgp
 /Lu+PuiF3XdsiT/mVDafcBo58MUaNtfi0dJOYgNxSY/DkT5Ulo0Bl50d6
 N2jGo4nXdgrsdXiszpDxC0s8ZFjmoPINTb6cF5zSU6G+x01Z/rIGZkUb1
 WFwrSpbtXtlcKvvDqrHG4oILHI96bMp1CY8zH99FRBSkLbDqGMK57kdwg
 i3q+AaR1CZkUJ6EDr7BoeMBWr1y1ljNeWAZkUVZfCc6KNbl4dT470q7Hj A==;
X-CSE-ConnectionGUID: l/s19ZEHTE65eQbwOPDFhA==
X-CSE-MsgGUID: LLy9YxZKRNuMt9u0IKW6Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102578422"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="102578422"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 12:06:16 -0700
X-CSE-ConnectionGUID: 3e84wiwCREyjKV/IHlcTzA==
X-CSE-MsgGUID: ulHOnbcEQVuhQZELtqCoUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="274690873"
Received: from dut4435arlh.fm.intel.com ([10.105.8.126])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 12:06:16 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 gustavo.sousa@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 07/15] drm/xe: Split out configfs data structures
Date: Mon,  5 Oct 2026 19:06:17 +0000
Message-ID: <20261005190611.332940-24-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005190611.332940-17-stuart.summers@intel.com>
References: <20261005190611.332940-17-stuart.summers@intel.com>
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

Planning on moving debug specific configfs parameters
to their own file in a future patch. In preparation for
that change, move the structures in xe_configfs.c to a
new _types.h file so we can easily access them in the
different configfs files.

Doing that separately here instead of combining with
the patch that adds the debug file for ease of review.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: LLM
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c       | 43 --------------------
 drivers/gpu/drm/xe/xe_configfs.h       |  1 +
 drivers/gpu/drm/xe/xe_configfs_types.h | 55 ++++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 43 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_types.h

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 4a92a6f22311..16884fa035a8 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -4,7 +4,6 @@
  */
 
 #include <linux/bitops.h>
-#include <linux/ctype.h>
 #include <linux/configfs.h>
 #include <linux/cleanup.h>
 #include <linux/find.h>
@@ -17,10 +16,7 @@
 #include "xe_configfs.h"
 #include "xe_defaults.h"
 #include "xe_gt_types.h"
-#include "xe_hw_engine_types.h"
 #include "xe_module.h"
-#include "xe_pci_types.h"
-#include "xe_sriov_types.h"
 
 /**
  * DOC: Xe Configfs
@@ -290,45 +286,6 @@
  *	# rmdir /sys/kernel/config/xe/0000:03:00.0/
  */
 
-/* Similar to struct xe_bb, but not tied to HW (yet) */
-struct wa_bb {
-	u32 *cs;
-	u32 len; /* in dwords */
-};
-
-struct xe_config_group_device {
-	struct config_group group;
-	struct config_group sriov;
-
-	/*
-	 * Fields sorted by type (largest first) then name: struct arrays,
-	 * u64, u32/unsigned int, u8, bool, sub-structs last. Within each
-	 * type, entries are sorted alphabetically.
-	 */
-	struct xe_config_device {
-		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
-		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
-		u64 engines_allowed;
-		u64 gt_types_allowed;
-		u32 migrate_ulls_period_ms;
-		u8 survivability_mode;
-		bool enable_multi_queue;
-		bool enable_psmi;
-		bool enable_vram_page_offline;
-		struct {
-			unsigned int max_vfs;
-			bool admin_only_pf;
-		} sriov;
-	} config;
-
-	/* protects attributes */
-	struct mutex lock;
-	/* matching descriptor */
-	const struct xe_device_desc *desc;
-	/* tentative SR-IOV mode */
-	enum xe_sriov_mode mode;
-};
-
 static const struct xe_config_device device_defaults = {
 	.engines_allowed = U64_MAX,
 	.gt_types_allowed = U64_MAX,
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 275086e50451..c832de85b771 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -9,6 +9,7 @@
 #include <linux/limits.h>
 #include <linux/types.h>
 
+#include "xe_configfs_types.h"
 #include "xe_defaults.h"
 #include "xe_hw_engine_types.h"
 #include "xe_module.h"
diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h b/drivers/gpu/drm/xe/xe_configfs_types.h
new file mode 100644
index 000000000000..b1e351761d69
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_configfs_types.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+#ifndef _XE_CONFIGFS_TYPES_H_
+#define _XE_CONFIGFS_TYPES_H_
+
+#include <linux/configfs.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+#include "xe_hw_engine_types.h"
+#include "xe_pci_types.h"
+#include "xe_sriov_types.h"
+
+/* Similar to struct xe_bb, but not tied to HW (yet) */
+struct wa_bb {
+	u32 *cs;
+	u32 len; /* in dwords */
+};
+
+struct xe_config_group_device {
+	struct config_group group;
+	struct config_group sriov;
+
+	/*
+	 * Fields sorted by type (largest first) then name: struct arrays,
+	 * u64, u32/unsigned int, u8, bool, sub-structs last. Within each
+	 * type, entries are sorted alphabetically.
+	 */
+	struct xe_config_device {
+		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
+		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
+		u64 engines_allowed;
+		u64 gt_types_allowed;
+		u32 migrate_ulls_period_ms;
+		u8 survivability_mode;
+		bool enable_multi_queue;
+		bool enable_psmi;
+		bool enable_vram_page_offline;
+		struct {
+			unsigned int max_vfs;
+			bool admin_only_pf;
+		} sriov;
+	} config;
+
+	/* protects attributes */
+	struct mutex lock;
+	/* matching descriptor */
+	const struct xe_device_desc *desc;
+	/* tentative SR-IOV mode */
+	enum xe_sriov_mode mode;
+};
+
+#endif /* _XE_CONFIGFS_TYPES_H_ */
-- 
2.43.0

