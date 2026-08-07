Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD22C5AC80
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 19:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54FA10E35E;
	Fri,  7 Aug 2026 19:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4hd/TmW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB8910E315
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 19:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786131922; x=1817667922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TmDxZHpgFZ746x7JIHKITlRNCcmyu4RdmjDBOLbaKxg=;
 b=J4hd/TmW92sPTtQDcWjfp8BpoBvo4ait0Sox2DcAlnuSB7TUmIEmYMtM
 AjAQNfXgWCsH+mbi4PBoaCwfxO6a9C9FWTHbb2/5+0CVTIyhqc1oj6/3L
 Ci+PP0d4hAYvIsZ7TxmLIW/I7kMndc+T5LT/nDD6OmsMJx09dzOH8uHCe
 djJmtF2/ndK2GGPwiGAd1RaENQ9MpYvzfudp8hDVG6z4vzAcYpWVtM61A
 8x27TLo1KP9gazWBVnCZyeU/ye2coZftnqksVKVva0/w/FryZhQRrwh5q
 B4MsCvwOehegJI5odaB3SNTGacxtTdC6Rh7FDa9pYe7TKTMS0vfGW0bZ5 g==;
X-CSE-ConnectionGUID: kZDLiGw8Q3CZpXNvY3pEkA==
X-CSE-MsgGUID: 5zloHzmxQKGV6UgsVIPprg==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86758822"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86758822"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 12:45:21 -0700
X-CSE-ConnectionGUID: /Rzd8Jq9TyuB3wCNdjShvA==
X-CSE-MsgGUID: jZTKGuccTxW9IY9kfYEu6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="258174091"
Received: from dut4475arls.fm.intel.com ([10.105.10.116])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 12:45:20 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 03/10] drm/xe: Split out configfs data structures
Date: Fri,  7 Aug 2026 19:45:20 +0000
Message-ID: <20260807194518.9474-15-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807194518.9474-12-stuart.summers@intel.com>
References: <20260807194518.9474-12-stuart.summers@intel.com>
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
Assisted-by: Copilot:claude-sonnet-4.6,claude-opus-4.7
---
 drivers/gpu/drm/xe/xe_configfs.c       | 41 --------------------
 drivers/gpu/drm/xe/xe_configfs.h       |  2 +-
 drivers/gpu/drm/xe/xe_configfs_types.h | 53 ++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 42 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_types.h

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index cb6ab1fcb8c1..029c9f682c8e 100644
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
@@ -259,43 +255,6 @@
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
-		bool enable_multi_queue;
-		bool enable_psmi;
-		bool survivability_mode;
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
index bba592fb612c..7db2f46291fa 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -8,8 +8,8 @@
 #include <linux/limits.h>
 #include <linux/types.h>
 
+#include "xe_configfs_types.h"
 #include "xe_defaults.h"
-#include "xe_hw_engine_types.h"
 #include "xe_module.h"
 
 struct pci_dev;
diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h b/drivers/gpu/drm/xe/xe_configfs_types.h
new file mode 100644
index 000000000000..3be7d6160b4c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_configfs_types.h
@@ -0,0 +1,53 @@
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
+		bool enable_multi_queue;
+		bool enable_psmi;
+		bool survivability_mode;
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

