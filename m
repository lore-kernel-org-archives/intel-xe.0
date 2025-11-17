Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3B7CEACEF
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 23:43:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDCC10E403;
	Mon, 17 Nov 2025 23:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TIlUFCTp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D682B10E1DC
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 23:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763423010; x=1794959010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xenPZWJ9jmzrilBuvP3GQ7ODbSL/7tqxdo1x0pOTKJI=;
 b=TIlUFCTp1Opct3b7Ljl88myLkNQrrPwRoN1E2ja3oBLNGiy/760NlkMp
 4biv8HLiogGVGIshuia8pXJI2SGLz90eQhZV5OkP9/3xQDRvJTbN4KlM5
 S3IdwWSmnPJk3adAgj2e/BCoorUat6qzXEJvofpETHkEP+L8K45wx2KBO
 Twk2m9wsYKEucIXsMl7MBKbbQJj20z1TTxuLzF/+ljqlzDm3eBbrHaXXX
 2AK/3mfbWzjzz+fxkENOfmJN38jbnBrRVb5h4c2nO9i8ooqKsdfTrbf4c
 wC6yX+A2BNXVUgLUU38X9Akzufu7ScZpBFIEhuktSilszocfXhzc5HDDb w==;
X-CSE-ConnectionGUID: kL1k1fktQ1KJXXIXbrFZIQ==
X-CSE-MsgGUID: RD6lGaNnRaCxDDo7qFzJjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69302089"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="69302089"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 15:43:29 -0800
X-CSE-ConnectionGUID: hFV/BZOVRjK+a6K97+yYig==
X-CSE-MsgGUID: b0Fje6x5SUauNNOH3B7HKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="190827328"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 15:43:29 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 2/3] drm/xe: Move rebar to its own file
Date: Mon, 17 Nov 2025 15:42:46 -0800
Message-ID: <20251117-xe-pci-rebar-2-part-2-v2-2-9f3dac7dec36@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251117-xe-pci-rebar-2-part-2-v2-0-9f3dac7dec36@intel.com>
References: <20251117-xe-pci-rebar-2-part-2-v2-0-9f3dac7dec36@intel.com>
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

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: s/xe_pci_rebar()/xe_pci_rebar_resize()/ (Matt Roper)
---
 drivers/gpu/drm/xe/Makefile       |   1 +
 drivers/gpu/drm/xe/xe_pci.c       |   3 +-
 drivers/gpu/drm/xe/xe_pci_rebar.c | 108 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_rebar.h |  13 +++++
 drivers/gpu/drm/xe/xe_vram.c      |  91 --------------------------------
 drivers/gpu/drm/xe/xe_vram.h      |   1 -
 6 files changed, 124 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e4b273b025d2a..2653453eaae34 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -97,6 +97,7 @@ xe-y += xe_bb.o \
 	xe_pagefault.o \
 	xe_pat.o \
 	xe_pci.o \
+	xe_pci_rebar.o \
 	xe_pcode.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index cd03b4b3ebdbd..7e1bdd56a7044 100644
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
+	xe_pci_rebar_resize(xe);
 
 	err = xe_device_probe_early(xe);
 	/*
diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.c b/drivers/gpu/drm/xe/xe_pci_rebar.c
new file mode 100644
index 0000000000000..a55950d1e2e2f
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
index 0000000000000..8677921ac3638
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
index d50baefcd1248..52342bafe9c02 100644
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
2.51.2

