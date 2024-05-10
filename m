Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6645FC25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 21:00:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D8310E575;
	Fri, 10 May 2024 21:00:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjZ3ttbu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD63C10E5FA
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 21:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715374808; x=1746910808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G6SY4mfDq3EMNsKodIdr9+dYwZPmeiV673qib3ea66E=;
 b=kjZ3ttbuCWvzWL223OENDTps1Qem6Qdtq1nWytuIDmjPUsl+tc2mtx0I
 3ZeoFnRYKjXAE0ZRShO4fQ0h2l2u4mgiN4x+Ez2O0tubYAwEfws1XNIPN
 nIV0VIXIrpVJlnaf/pEPgq/Lpqwfm4DmdDk62zB9f4F2mOQ0bl8FmZBcJ
 on3qXjx5WFIQZ2PyvZ6NAgxq+lJw9HB/R4x05aP7z5jYyOJpFjih1YmMQ
 MGrMdl14vLl+tAee/pWraYvcIG6eRvfjFGHyVCMsop+P9I3lpZaPaDHBL
 LWCvQyc6kRpAxwQC/e58Qrb3dVVeLnEoE5G/qvvk3/7t8SUFmTf+UkaTB A==;
X-CSE-ConnectionGUID: IjiTu8d6S5K7u+aY2himmw==
X-CSE-MsgGUID: fd0NEqdwQfiUp+SBYSLLEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="22048292"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="22048292"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 14:00:08 -0700
X-CSE-ConnectionGUID: M6X6fNfpQRSBRJeo1EHIdg==
X-CSE-MsgGUID: GBbvn2hSRXGLwxLMCwVfMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="34604088"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 14:00:08 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: david.e.box@linux.intel.com, "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 5/6] drm/xe/vsec: Add support for DG2
Date: Fri, 10 May 2024 16:59:37 -0400
Message-ID: <20240510205948.904409-6-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240510205948.904409-1-michael.j.ruhl@intel.com>
References: <20240510205948.904409-1-michael.j.ruhl@intel.com>
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

DG2 needs to adjust the discovery offset WRT the GT BAR
not the P2SB bar so utilize the P2SB quirk.

Add support by registering via the intel_vsec_register()
API.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/Makefile    |   1 +
 drivers/gpu/drm/xe/xe_device.c |   3 +
 drivers/gpu/drm/xe/xe_vsec.c   | 110 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h   |  13 ++++
 4 files changed, 127 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a67977edff5b..805b27201e1a 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -143,6 +143,7 @@ xe-y += xe_bb.o \
 	xe_uc_debugfs.o \
 	xe_uc_fw.o \
 	xe_vm.o \
+	xe_vsec.o \
 	xe_vram_freq.o \
 	xe_wait_user_fence.o \
 	xe_wa.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4165e1347371..e77768bc4471 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -46,6 +46,7 @@
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
+#include "xe_vsec.h"
 #include "xe_wait_user_fence.h"
 
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
@@ -662,6 +663,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_hwmon_register(xe);
 
+	xe_vsec_init(xe);
+
 	return drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
 
 err_fini_display:
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
new file mode 100644
index 000000000000..a91aec49d04a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2022 - 2024 Intel Corporation
+ */
+#include <linux/intel_vsec.h>
+#include <linux/pci.h>
+
+#include "xe_device_types.h"
+#include "xe_drv.h"
+#include "xe_platform_types.h"
+#include "xe_vsec.h"
+
+#define SOC_BASE		0x280000
+
+/* from drivers/platform/x86/intel/pmt/telemetry.c */
+#define TELEM_BASE_OFFSET	0x8
+
+#define DG2_PMT_BASE		0xE8000
+#define DG2_DISCOVERY_START	0x6000
+#define DG2_TELEM_START		0x4000
+
+#define DG2_DISCOVERY_OFFSET	(SOC_BASE + DG2_PMT_BASE + DG2_DISCOVERY_START)
+#define DG2_TELEM_OFFSET	(SOC_BASE + DG2_PMT_BASE + DG2_TELEM_START)
+
+#define GFX_BAR			0
+
+static struct intel_vsec_header dg2_telemetry = {
+	.length = 0x10,
+	.id = VSEC_ID_TELEMETRY,
+	.num_entries = 1,
+	.entry_size = 3,
+	.tbir = GFX_BAR,
+	.offset = DG2_DISCOVERY_OFFSET,
+};
+
+static struct intel_vsec_header *dg2_capabilities[] = {
+	&dg2_telemetry,
+	NULL
+};
+
+static struct intel_vsec_platform_info dg2_vsec_info = {
+	.caps = VSEC_CAP_TELEMETRY,
+	.headers = dg2_capabilities,
+	.quirks = VSEC_QUIRK_EARLY_HW | VSEC_QUIRK_P2SB_OFFSET,
+};
+
+/*
+ * Access the DG2 PMT MMIO discovery table
+ *
+ * The intel_vsec driver does not typically access the discovery table.
+ * Instead, it creates a memory resource for the table and passes it
+ * to the PMT telemetry driver. Each discovery table contains 3 items,
+ *    - GUID
+ *    - Telemetry size
+ *    - Telemetry offset (offset from P2SB BAR, not GT)
+ *
+ * For DG2 we know what the telemetry offset is, but we still need to
+ * use the discovery table to pass the GUID and the size. So figure
+ * out the difference between the P2SB offset and the GT offset and
+ * save this so that the telemetry driver can use it to adjust the
+ * value.
+ */
+static int dg2_adjust_offset(struct pci_dev *pdev, struct device *dev,
+			     struct intel_vsec_platform_info *info)
+{
+	void __iomem *base;
+	u32 telem_offset;
+	u64 addr;
+
+	addr = pci_resource_start(pdev, GFX_BAR) + info->headers[0]->offset;
+	base = ioremap_wc(addr, 16);
+	if (!base)
+		return -ENOMEM;
+
+	telem_offset = readl(base + TELEM_BASE_OFFSET);
+
+	/* Use the base_addr + P2SB quirk to pass this info */
+	if (telem_offset < DG2_TELEM_OFFSET)
+		info->base_addr = -(DG2_TELEM_OFFSET - telem_offset);
+	else
+		info->base_addr = -(telem_offset - DG2_TELEM_OFFSET);
+
+	iounmap(base);
+
+	return 0;
+}
+
+/**
+ * intel_vsec_init - Initialize resources and add intel_vsec auxiliary
+ * interface
+ * @xe: valid xe instance
+ */
+void xe_vsec_init(struct xe_device *xe)
+{
+	struct intel_vsec_platform_info *info = &dg2_vsec_info;
+	struct device *dev = xe->drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+	u32 ret;
+
+	ret = dg2_adjust_offset(pdev, dev, info);
+	if (ret)
+		return;
+
+	/*
+	 * Register a VSEC. Cleanup is handled using device managed
+	 * resources.
+	 */
+	intel_vsec_register(pdev, info);
+}
+MODULE_IMPORT_NS(INTEL_VSEC);
diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
new file mode 100644
index 000000000000..3fd29a21cad6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vsec.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright © 2022 - 2024 Intel Corporation
+ */
+
+#ifndef _XE_VSEC_H_
+#define _XE_VSEC_H_
+
+struct xe_device;
+
+void xe_vsec_init(struct xe_device *xe);
+
+#endif
-- 
2.44.0

