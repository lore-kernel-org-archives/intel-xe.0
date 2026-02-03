Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904E7E87835
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 14:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465CC10E659;
	Tue,  3 Feb 2026 14:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+xeG6Ht";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB1410E02B
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 14:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770127478; x=1801663478;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MHmcVOCoNYfp8oTLVZL39wD5P/diMlWoKjRHa/wms64=;
 b=j+xeG6HtQZ21zLwbZtZXZKx+psydort9H1gjQJIPnIlHHW49bm1vRDnB
 ut+LN5s3aOcer1HunXUuKU54hNAjSNQ/Mmbpz7DARhsxYfQvfFU+WEWt/
 uu8w4vsIo/KGVbJ4u/+KebL/75joCA/uAI514vfkm7om1Y/q0dwiC1+s6
 /EQsxKgw8+sfnXx1I06/kMuMuDL4BqjYWlPIl8U1e/gA667OvyPOgL6nm
 KO91Fi3ZT126yGKSZPBhCUj7n+0drMKbScle54K8xrJ5G3Kv8cvcAuQBA
 HTefrArioN8y2iaYPVwOcrSL3mWvLGpsALTt9WA8jWJGJA67ZfzL98XgK g==;
X-CSE-ConnectionGUID: vUtSTiw4SpCDvdhDBayBSg==
X-CSE-MsgGUID: Qk1/3nu6St6dr6tpwbCuSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="81927547"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="81927547"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 06:04:37 -0800
X-CSE-ConnectionGUID: ySVU96YxSOKVFYv7LgX4vQ==
X-CSE-MsgGUID: CXTTxAZOQEyUr0++jnYHDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="210009950"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 06:04:35 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v3 1/2] drm/xe/cri: Add check to verify if CSC is a PCIe
 endpoint
Date: Tue,  3 Feb 2026 19:36:40 +0530
Message-ID: <20260203140639.2048912-3-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Soham Purkait <soham.purkait@intel.com>

Add check to verify if CSC is a PCIe endpoint via pcode mailbox
during xe modprobe. If this mode is not supported, an auxiliary
child device for the MEI driver is created as a fallback flow.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---

v2:
  - Use scoped based resource management for runtime pm (Shuicheng)
  - Initiliaze return value of xe_pcode_read (Shuicheng)
  - Assert when CSC is not supported as a PCIe endpoint

v3:
  - Change assert to a kernel warning (Michal)
  - Fix kernel-doc stye comment (Michal)
  - Change if-else ladder to a switch statement

---
 drivers/gpu/drm/xe/xe_heci_gsc.c  | 47 +++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_pcode_api.h |  2 ++
 2 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index c1f15313f92e..10ba46e3e683 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -10,10 +10,15 @@
 
 #include <drm/drm_print.h>
 
+#include "regs/xe_gsc_regs.h"
+#include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_heci_gsc.h"
-#include "regs/xe_gsc_regs.h"
+#include "xe_pcode.h"
+#include "xe_pcode_api.h"
 #include "xe_platform_types.h"
+#include "xe_pm.h"
+#include "xe_printk.h"
 #include "xe_survivability_mode.h"
 
 #define GSC_BAR_LENGTH  0x00000FFC
@@ -42,6 +47,24 @@ static int heci_gsc_irq_init(int irq)
 	return irq_set_chip_data(irq, NULL);
 }
 
+/*
+ * This function queries whether CSC is exposed as a PCIe endpoint using pcode
+ * mailbox sub-command PCODE_STATUS_SUBCOMMAND_CSC_PCIE_DEVICE_STATUS.
+ */
+static bool is_csc_pci_ep(struct xe_device *xe)
+{
+	int ret;
+	u32 val = 0;
+
+	guard(xe_pm_runtime)(xe);
+	ret = xe_pcode_read(xe_device_get_root_tile(xe),
+			    PCODE_MBOX(DGFX_PCODE_STATUS,
+				       DGFX_CSC_PCIE_DEVICE_STATUS, 0),
+				       &val, NULL);
+
+	return !ret && (val & DGFX_CSC_EXPOSED_AS_PCIE);
+}
+
 /**
  * struct heci_gsc_def - graphics security controller heci interface definitions
  *
@@ -179,14 +202,26 @@ int xe_heci_gsc_init(struct xe_device *xe)
 
 	heci_gsc->irq = -1;
 
-	if (xe->info.platform == XE_BATTLEMAGE) {
+	if (xe->info.platform == XE_CRESCENTISLAND) {
+		if (is_csc_pci_ep(xe))
+			return 0;
+		xe_warn(xe, "CSC not exposed as a PCIe endpoint. Using fallback\n");
+	}
+
+	switch (xe->info.platform) {
+	case XE_CRESCENTISLAND:
+	case XE_BATTLEMAGE:
+	case XE_DG2:
 		def = &heci_gsc_def_dg2;
-	} else if (xe->info.platform == XE_PVC) {
+		break;
+	case XE_PVC:
 		def = &heci_gsc_def_pvc;
-	} else if (xe->info.platform == XE_DG2) {
-		def = &heci_gsc_def_dg2;
-	} else if (xe->info.platform == XE_DG1) {
+		break;
+	case XE_DG1:
 		def = &heci_gsc_def_dg1;
+		break;
+	default:
+		def = NULL;
 	}
 
 	if (!def || !def->name) {
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 85cc7478b787..35c373a561bf 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -35,6 +35,8 @@
 #define     DGFX_GET_INIT_STATUS	0x0
 #define     DGFX_INIT_STATUS_COMPLETE	0x1
 #define     DGFX_LINK_DOWNGRADE_STATUS	REG_BIT(31)
+#define     DGFX_CSC_PCIE_DEVICE_STATUS 0x3
+#define     DGFX_CSC_EXPOSED_AS_PCIE    0x1
 
 #define   PCODE_POWER_SETUP			0x7C
 #define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4
-- 
2.43.0

