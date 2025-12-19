Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A289EE66891
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 21:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D5A10F0C2;
	Fri, 19 Dec 2025 21:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dKgC+xVt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3970110ED16
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 21:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766179030; x=1797715030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VJjukNpNr5gFs/txfT53SgWZcMXnwy1Pw3elXvyz1QA=;
 b=dKgC+xVtqei33wyAVxJaUA1t/B8w6uWgWbFHBkKY9RW+gUorRtm9oWw0
 4ROxKJWzgAeLaQqlL5v1YBQhpKdOJs4hP3tNAqEOZ7L/7GaaWXX87saYE
 q7Ypltqa7g7iNK7+TVjVaw9E85MkeLyOzVfpsNb5uvSNg+pCKjYvd3b/r
 To+Yb+a/+QYZFevYE4pgBP1gFox7v78W95KvWrewMu2dqarUdY/pKs1/s
 teYsTuYpnnFw6zwl6AgYlH0Van5w8M+atZJxgIskHjjwU3NKoRqJKEiq3
 AFH8/Gks73fJvTalrdJ4GjtfxzbfmNyr3iwJCR5unrGd48p3V5aZyh4IH Q==;
X-CSE-ConnectionGUID: rWEBngIXQd+RsyBYQu41PQ==
X-CSE-MsgGUID: U4XrTE0FR2aLmgAGfSQoqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68036835"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="68036835"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 13:17:10 -0800
X-CSE-ConnectionGUID: phddwaXuRfCVhbdXMNAc4g==
X-CSE-MsgGUID: kvEZFgaZRqKQhKMM0fm3DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="199447620"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 13:17:08 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [CI 1/2] drm/xe: Move rebar to its own file
Date: Fri, 19 Dec 2025 13:16:48 -0800
Message-ID: <20251219211650.1908961-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219211650.1908961-4-matthew.d.roper@intel.com>
References: <20251219211650.1908961-4-matthew.d.roper@intel.com>
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

From: Lucas De Marchi <lucas.demarchi@intel.com>

Now that xe_pci.c calls the rebar directly, it doesn't make sense to
keep it in xe_vram.c since it's closer to the PCI initialization than to
the VRAM. Move it to its own file.

While at it, add a better comment to document the possible values for
the vram_bar_size module parameter.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/Makefile       |   1 +
 drivers/gpu/drm/xe/xe_pci.c       |   3 +-
 drivers/gpu/drm/xe/xe_pci_rebar.c | 108 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_rebar.h |  13 ++++
 drivers/gpu/drm/xe/xe_vram.c      |  91 -------------------------
 drivers/gpu/drm/xe/xe_vram.h      |   1 -
 6 files changed, 124 insertions(+), 93 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_rebar.c
 create mode 100644 drivers/gpu/drm/xe/xe_pci_rebar.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 7f08b4cd91d6..7297e150add9 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -98,6 +98,7 @@ xe-y += xe_bb.o \
 	xe_page_reclaim.o \
 	xe_pat.o \
 	xe_pci.o \
+	xe_pci_rebar.o \
 	xe_pcode.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 535325796067..28a1b59c7698 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -27,6 +27,7 @@
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
+#include "xe_pci_rebar.h"
 #include "xe_pci_sriov.h"
 #include "xe_pci_types.h"
 #include "xe_pm.h"
@@ -1017,7 +1018,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		return err;
 
-	xe_vram_resize_bar(xe);
+	xe_pci_rebar_resize(xe);
 
 	err = xe_device_probe_early(xe);
 	/*
diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.c b/drivers/gpu/drm/xe/xe_pci_rebar.c
new file mode 100644
index 000000000000..a55950d1e2e2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_rebar.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/pci.h>
+#include <linux/types.h>
+
+#include <drm/drm_print.h>
+
+#include "regs/xe_bars.h"
+#include "xe_device_types.h"
+#include "xe_module.h"
+#include "xe_pci_rebar.h"
+
+static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	int bar_size = pci_rebar_bytes_to_size(size);
+	int ret;
+
+	ret = pci_resize_resource(pdev, resno, bar_size, 0);
+	if (ret) {
+		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
+			 resno, 1 << bar_size, ERR_PTR(ret));
+		return;
+	}
+
+	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
+}
+
+/*
+ * xe_pci_rebar_resize - Resize the LMEMBAR
+ * @xe: xe device instance
+ *
+ * If vram_bar_size module param is set, attempt to set to the requested size
+ * else set to maximum possible size.
+ */
+void xe_pci_rebar_resize(struct xe_device *xe)
+{
+	int force_vram_bar_size = xe_modparam.force_vram_bar_size;
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct pci_bus *root = pdev->bus;
+	resource_size_t current_size;
+	resource_size_t rebar_size;
+	struct resource *root_res;
+	int max_size, i;
+	u32 pci_cmd;
+
+	/* gather some relevant info */
+	current_size = pci_resource_len(pdev, LMEM_BAR);
+
+	if (force_vram_bar_size < 0)
+		return;
+
+	/* set to a specific size? */
+	if (force_vram_bar_size) {
+		rebar_size = pci_rebar_bytes_to_size(force_vram_bar_size *
+						     (resource_size_t)SZ_1M);
+
+		if (!pci_rebar_size_supported(pdev, LMEM_BAR, rebar_size)) {
+			drm_info(&xe->drm,
+				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%llx. Leaving default: %lluMiB\n",
+				 (u64)pci_rebar_size_to_bytes(rebar_size) >> 20,
+				 pci_rebar_get_possible_sizes(pdev, LMEM_BAR),
+				 (u64)current_size >> 20);
+			return;
+		}
+
+		rebar_size = pci_rebar_size_to_bytes(rebar_size);
+		if (rebar_size == current_size)
+			return;
+	} else {
+		max_size = pci_rebar_get_max_size(pdev, LMEM_BAR);
+		if (max_size < 0)
+			return;
+		rebar_size = pci_rebar_size_to_bytes(max_size);
+
+		/* only resize if larger than current */
+		if (rebar_size <= current_size)
+			return;
+	}
+
+	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
+		 (u64)current_size >> 20, (u64)rebar_size >> 20);
+
+	while (root->parent)
+		root = root->parent;
+
+	pci_bus_for_each_resource(root, root_res, i) {
+		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
+		    (u64)root_res->start > 0x100000000ul)
+			break;
+	}
+
+	if (!root_res) {
+		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
+		return;
+	}
+
+	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
+	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
+
+	resize_bar(xe, LMEM_BAR, rebar_size);
+
+	pci_assign_unassigned_bus_resources(pdev->bus);
+	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
+}
diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.h b/drivers/gpu/drm/xe/xe_pci_rebar.h
new file mode 100644
index 000000000000..8677921ac363
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_rebar.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_PCI_REBAR_H_
+#define _XE_PCI_REBAR_H_
+
+struct xe_device;
+
+void xe_pci_rebar_resize(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 1b9e9b028975..c64d98bf1723 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -25,97 +25,6 @@
 #include "xe_vram.h"
 #include "xe_vram_types.h"
 
-static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
-{
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	int bar_size = pci_rebar_bytes_to_size(size);
-	int ret;
-
-	ret = pci_resize_resource(pdev, resno, bar_size, 0);
-	if (ret) {
-		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
-			 resno, 1 << bar_size, ERR_PTR(ret));
-		return;
-	}
-
-	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
-}
-
-/*
- * if force_vram_bar_size is set, attempt to set to the requested size
- * else set to maximum possible size
- */
-void xe_vram_resize_bar(struct xe_device *xe)
-{
-	int force_vram_bar_size = xe_modparam.force_vram_bar_size;
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	struct pci_bus *root = pdev->bus;
-	resource_size_t current_size;
-	resource_size_t rebar_size;
-	struct resource *root_res;
-	int max_size, i;
-	u32 pci_cmd;
-
-	/* gather some relevant info */
-	current_size = pci_resource_len(pdev, LMEM_BAR);
-
-	if (force_vram_bar_size < 0)
-		return;
-
-	/* set to a specific size? */
-	if (force_vram_bar_size) {
-		rebar_size = pci_rebar_bytes_to_size(force_vram_bar_size *
-						     (resource_size_t)SZ_1M);
-
-		if (!pci_rebar_size_supported(pdev, LMEM_BAR, rebar_size)) {
-			drm_info(&xe->drm,
-				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%llx. Leaving default: %lluMiB\n",
-				 (u64)pci_rebar_size_to_bytes(rebar_size) >> 20,
-				 pci_rebar_get_possible_sizes(pdev, LMEM_BAR),
-				 (u64)current_size >> 20);
-			return;
-		}
-
-		rebar_size = pci_rebar_size_to_bytes(rebar_size);
-		if (rebar_size == current_size)
-			return;
-	} else {
-		max_size = pci_rebar_get_max_size(pdev, LMEM_BAR);
-		if (max_size < 0)
-			return;
-		rebar_size = pci_rebar_size_to_bytes(max_size);
-
-		/* only resize if larger than current */
-		if (rebar_size <= current_size)
-			return;
-	}
-
-	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
-		 (u64)current_size >> 20, (u64)rebar_size >> 20);
-
-	while (root->parent)
-		root = root->parent;
-
-	pci_bus_for_each_resource(root, root_res, i) {
-		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
-		    (u64)root_res->start > 0x100000000ul)
-			break;
-	}
-
-	if (!root_res) {
-		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
-		return;
-	}
-
-	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
-	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
-
-	resize_bar(xe, LMEM_BAR, rebar_size);
-
-	pci_assign_unassigned_bus_resources(pdev->bus);
-	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
-}
-
 static bool resource_is_valid(struct pci_dev *pdev, int bar)
 {
 	if (!pci_resource_flags(pdev, bar))
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index 13505cfb184d..72860f714fc6 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -11,7 +11,6 @@
 struct xe_device;
 struct xe_vram_region;
 
-void xe_vram_resize_bar(struct xe_device *xe);
 int xe_vram_probe(struct xe_device *xe);
 
 struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
-- 
2.52.0

