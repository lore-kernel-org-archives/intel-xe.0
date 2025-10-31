Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E728FCCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 21:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A817F10E338;
	Fri, 31 Oct 2025 21:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O2f2qsFJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A9310E329
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 21:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761945508; x=1793481508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wOTkujkB8bFL1fx4OJcewCkPOivYQsYvxNyunyCn6XI=;
 b=O2f2qsFJKa4P3I3kCWtYjjvrYzUmOVVa/PrVqOkvIJRAsN40s43eY5J4
 hPR2SFnah/pl/rLSOdQq9EGUZdsZnXdhX6Xh3dlwNOKaTVDhpXI1PKuO5
 UADPJaqwCidDofwYtM4efyrQ2tgEFSnHYYiT5LdiX2lIpg9YVJoDkJGXO
 C0c2DsVQe1MJFzCErK48+fXYN5chOt7SEnElucFWk0P3Ld+9F1AKcYd7M
 CA4oJcYrcKKVgorXaplIOga8sAqb2bpiwYK8K3zpSBTTpirXiC4O6nC/f
 hT40pIxoTwKNGtztDHi/oP1BhDesZB25PmyXG6koPKSq9DevYlCKcoiGz Q==;
X-CSE-ConnectionGUID: jdTJqpymQqOnDReFo3p8KQ==
X-CSE-MsgGUID: 9K9dYaOtSqy1wSu+64Tf6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="86740452"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="86740452"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 14:18:27 -0700
X-CSE-ConnectionGUID: 6uK/pKyTQEesAVSo0Kh9cg==
X-CSE-MsgGUID: HSC1d/TrRH6zivYxa96XlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="209891496"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 14:18:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/2] drm/xe: Move rebar to its own file
Date: Fri, 31 Oct 2025 14:17:42 -0700
Message-ID: <20251031-xe-pci-rebar-2-part-2-v1-1-c4a794a39041@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031-xe-pci-rebar-2-part-2-v1-0-c4a794a39041@intel.com>
References: <20251031-xe-pci-rebar-2-part-2-v1-0-c4a794a39041@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-50d74
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

Now that xe_pci.c calls the rebar directly, it doesn't make sense to
keep it in xe_vram.c since it's closer to the PCI initialization than to
the VRAM. Move it to its own file.

While at it, add a better comment to document the possible values for
the vram_bar_size module parameter.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Makefile       |   1 +
 drivers/gpu/drm/xe/xe_pci.c       |   3 +-
 drivers/gpu/drm/xe/xe_pci_rebar.c | 138 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_rebar.h |  13 ++++
 drivers/gpu/drm/xe/xe_vram.c      | 121 ---------------------------------
 drivers/gpu/drm/xe/xe_vram.h      |   1 -
 6 files changed, 154 insertions(+), 123 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index d36f4101c8e0f..98603ca39438f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -96,6 +96,7 @@ xe-y += xe_bb.o \
 	xe_observation.o \
 	xe_pat.o \
 	xe_pci.o \
+	xe_pci_rebar.o \
 	xe_pcode.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index aeae675c912b7..5f304ea2477a0 100644
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
@@ -997,7 +998,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		return err;
 
-	xe_vram_resize_bar(xe);
+	xe_pci_rebar(xe);
 
 	err = xe_device_probe_early(xe);
 	/*
diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.c b/drivers/gpu/drm/xe/xe_pci_rebar.c
new file mode 100644
index 0000000000000..d21e29c95ca33
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_rebar.c
@@ -0,0 +1,138 @@
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
+#define BAR_SIZE_SHIFT 20
+
+/*
+ * Release all the BARs that could influence/block LMEMBAR resizing, i.e.
+ * assigned IORESOURCE_MEM_64 BARs
+ */
+static void release_bars(struct pci_dev *pdev)
+{
+	struct resource *res;
+	int i;
+
+	pci_dev_for_each_resource(pdev, res, i) {
+		/* Resource already un-assigned, do not reset it */
+		if (!res->parent)
+			continue;
+
+		/* No need to release unrelated BARs */
+		if (!(res->flags & IORESOURCE_MEM_64))
+			continue;
+
+		pci_release_resource(pdev, i);
+	}
+}
+
+static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	int bar_size = pci_rebar_bytes_to_size(size);
+	int ret;
+
+	release_bars(pdev);
+
+	ret = pci_resize_resource(pdev, resno, bar_size);
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
+ * xe_pci_rebar - Resize the LMEMBAR
+ * @xe: xe device instance
+ *
+ * If vram_bar_size module param is set, attempt to set to the requested size
+ * else set to maximum possible size.
+ */
+void xe_pci_rebar(struct xe_device *xe)
+{
+	int force_vram_bar_size = xe_modparam.force_vram_bar_size;
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct pci_bus *root = pdev->bus;
+	resource_size_t current_size;
+	resource_size_t rebar_size;
+	struct resource *root_res;
+	u32 bar_size_mask;
+	u32 pci_cmd;
+	int i;
+
+	/* gather some relevant info */
+	current_size = pci_resource_len(pdev, LMEM_BAR);
+	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
+
+	if (!bar_size_mask)
+		return;
+
+	if (force_vram_bar_size < 0)
+		return;
+
+	/* set to a specific size? */
+	if (force_vram_bar_size) {
+		u32 bar_size_bit;
+
+		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
+
+		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
+
+		if (!bar_size_bit) {
+			drm_info(&xe->drm,
+				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
+				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
+			return;
+		}
+
+		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
+
+		if (rebar_size == current_size)
+			return;
+	} else {
+		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
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
index 0000000000000..c87aa58aee718
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
+void xe_pci_rebar(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index b62a96f8ef9eb..52f107eb1a80d 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -25,127 +25,6 @@
 #include "xe_vram.h"
 #include "xe_vram_types.h"
 
-#define BAR_SIZE_SHIFT 20
-
-/*
- * Release all the BARs that could influence/block LMEMBAR resizing, i.e.
- * assigned IORESOURCE_MEM_64 BARs
- */
-static void release_bars(struct pci_dev *pdev)
-{
-	struct resource *res;
-	int i;
-
-	pci_dev_for_each_resource(pdev, res, i) {
-		/* Resource already un-assigned, do not reset it */
-		if (!res->parent)
-			continue;
-
-		/* No need to release unrelated BARs */
-		if (!(res->flags & IORESOURCE_MEM_64))
-			continue;
-
-		pci_release_resource(pdev, i);
-	}
-}
-
-static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
-{
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	int bar_size = pci_rebar_bytes_to_size(size);
-	int ret;
-
-	release_bars(pdev);
-
-	ret = pci_resize_resource(pdev, resno, bar_size);
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
-	u32 bar_size_mask;
-	u32 pci_cmd;
-	int i;
-
-	/* gather some relevant info */
-	current_size = pci_resource_len(pdev, LMEM_BAR);
-	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
-
-	if (!bar_size_mask)
-		return;
-
-	if (force_vram_bar_size < 0)
-		return;
-
-	/* set to a specific size? */
-	if (force_vram_bar_size) {
-		u32 bar_size_bit;
-
-		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
-
-		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
-
-		if (!bar_size_bit) {
-			drm_info(&xe->drm,
-				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
-				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
-			return;
-		}
-
-		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
-
-		if (rebar_size == current_size)
-			return;
-	} else {
-		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
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
index 13505cfb184dc..72860f714fc66 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -11,7 +11,6 @@
 struct xe_device;
 struct xe_vram_region;
 
-void xe_vram_resize_bar(struct xe_device *xe);
 int xe_vram_probe(struct xe_device *xe);
 
 struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);

-- 
2.51.0

