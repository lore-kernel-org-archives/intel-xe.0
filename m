Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23896E7E0BB
	for <intel-xe@archiver.kernel.org>; Mon,  9 Feb 2026 10:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D496B10E3BF;
	Mon,  9 Feb 2026 10:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kaojv4Fo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E4B10E3BF
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Feb 2026 10:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770632656; x=1802168656;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v4a47hHZU5IDL655lug2CptMmNbHNPzhw6qFXKRa0dU=;
 b=kaojv4Foeft1qTMYSg9H2q7FsvuxayKXXSpY0xJgqQaSOYrdUMPQ1GTZ
 2YyZh6/9y4OObBLqE+dOd4Yii1n9kGJI0MWUZT5lDoLXghICS66Vxmays
 nTCe/2KVnK4gjh148kJQdKvbvI5Ra0gkWps0w/fLP23YRkNg0e062FtgL
 kXHvrUsAJbHvoaleBtiQu+bx4yc5sPXgmPki05QIU2OhF9jQAFOzZgwz4
 ViYHwCQ8vpUa2PkRxkJHLD0p4mCaDAf8GW72U5YNhZR6lBNussB/E7SRt
 GwsvEWSBtVj7qUFb0xYWZiqJ91WhGL7cAD+lQFhE6vtRAVXsEjXU4NOFz g==;
X-CSE-ConnectionGUID: DPn8gqrlTlyigCMYcFfoYA==
X-CSE-MsgGUID: ZrRpJYVJRNC+RoEWITPECw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71924675"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="71924675"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:24:15 -0800
X-CSE-ConnectionGUID: otQtNziVRkWuMUGcgEvdfA==
X-CSE-MsgGUID: zfb+kpbQQ4OQvFvNe9UVpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="211357920"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:24:13 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Soham Purkait <soham.purkait@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "Usyskin, Alexander" <alexander.usyskin@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>
Subject: [PATCH v4] drm/xe/cri: Add check to verify if CSC is a PCIe endpoint
Date: Mon,  9 Feb 2026 15:56:43 +0530
Message-ID: <20260209102642.2325804-2-balasubramani.vivekanandan@intel.com>
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

v4:
  - Refactor the code to check if CSC is exposed as PCIe endpoint early
    in the probe and enable has_heci_cscfi as fallback

Cc: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Cc: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Cc: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: "Jadav, Raag" <raag.jadav@intel.com>

---
 drivers/gpu/drm/xe/xe_heci_gsc.c  | 49 +++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_heci_gsc.h  |  1 +
 drivers/gpu/drm/xe/xe_pci.c       |  2 ++
 drivers/gpu/drm/xe/xe_pcode_api.h | 10 ++++---
 4 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index c1f15313f92e..dcb9471e7567 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -10,10 +10,14 @@
 
 #include <drm/drm_print.h>
 
+#include "regs/xe_gsc_regs.h"
+#include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_heci_gsc.h"
-#include "regs/xe_gsc_regs.h"
+#include "xe_pcode.h"
+#include "xe_pcode_api.h"
 #include "xe_platform_types.h"
+#include "xe_printk.h"
 #include "xe_survivability_mode.h"
 
 #define GSC_BAR_LENGTH  0x00000FFC
@@ -168,6 +172,33 @@ static int heci_gsc_add_device(struct xe_device *xe, const struct heci_gsc_def *
 	return ret;
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
+	ret = xe_pcode_read(xe_device_get_root_tile(xe),
+			    PCODE_MBOX(DGFX_PCODE_STATUS,
+				       DGFX_CSC_PCIE_DEVICE_STATUS, 0),
+				       &val, NULL);
+
+	return !ret && (val & DGFX_CSC_EXPOSED_AS_PCIE);
+}
+
+void xe_heci_gsc_init_early(struct xe_device *xe)
+{
+	if (xe->info.platform == XE_CRESCENTISLAND && !IS_SRIOV_VF(xe)) {
+		if (!is_csc_pci_ep(xe)) {
+			xe_warn(xe, "CSC not exposed as a PCIe endpoint. Forcing fallback\n");
+			xe->info.has_heci_cscfi = 1;
+		}
+	}
+}
+
 int xe_heci_gsc_init(struct xe_device *xe)
 {
 	struct xe_heci_gsc *heci_gsc = &xe->heci_gsc;
@@ -179,14 +210,20 @@ int xe_heci_gsc_init(struct xe_device *xe)
 
 	heci_gsc->irq = -1;
 
-	if (xe->info.platform == XE_BATTLEMAGE) {
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
+		break;
 	}
 
 	if (!def || !def->name) {
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.h b/drivers/gpu/drm/xe/xe_heci_gsc.h
index 745eb6783942..0013f34f8426 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.h
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.h
@@ -33,6 +33,7 @@ struct xe_heci_gsc {
 	int irq;
 };
 
+void xe_heci_gsc_init_early(struct xe_device *xe);
 int xe_heci_gsc_init(struct xe_device *xe);
 void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir);
 void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 42f15cd394f6..2310b30421f6 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1056,6 +1056,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		return err;
 
+	xe_heci_gsc_init_early(xe);
+
 	err = xe_display_probe(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 85cc7478b787..48b77f9c6283 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -31,10 +31,12 @@
 #define   PCODE_FREQ_RING_RATIO_SHIFT	16
 
 /* PCODE Init */
-#define   DGFX_PCODE_STATUS		0x7E
-#define     DGFX_GET_INIT_STATUS	0x0
-#define     DGFX_INIT_STATUS_COMPLETE	0x1
-#define     DGFX_LINK_DOWNGRADE_STATUS	REG_BIT(31)
+#define   DGFX_PCODE_STATUS			0x7E
+#define     DGFX_GET_INIT_STATUS		0x0
+#define       DGFX_INIT_STATUS_COMPLETE		0x1
+#define       DGFX_LINK_DOWNGRADE_STATUS	REG_BIT(31)
+#define     DGFX_CSC_PCIE_DEVICE_STATUS		0x3
+#define       DGFX_CSC_EXPOSED_AS_PCIE		0x1
 
 #define   PCODE_POWER_SETUP			0x7C
 #define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4
-- 
2.43.0

