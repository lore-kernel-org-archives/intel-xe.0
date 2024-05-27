Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC5FC25B74
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 08:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13D110F97A;
	Mon, 27 May 2024 08:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="gEF1vm2c";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD3D10F97A
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 08:40:43 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716799248; bh=T3IRthMeMG1rHmLiLAwsvENki4c9AR9YFXrPDsa0FUU=;
 h=From:To:Cc:Subject:Date:From;
 b=gEF1vm2c5yc1VNWrAG8ck46HIlHHjf8h5Mpsow5KeV4UUngyjjWOOhUpznUqS9H8c
 fcduspCKk526gVxZoNr0Y6xU3pMch20cGNZTABWX5iFYChpNBmd28iUmbr3dJ6aDuC
 KDroSMA29qnfFdSRfEv5V5cQ7UZ/P2MxomwoskI1GKq8CwwKymmHXDJf20/H/APIyh
 iiwU6eM2cFCjrOLephqxHz5OAK99tmzfY5Is+qvA6xBdTdoNXpEpaAGzH6yUBuY1ox
 6t6yLmJL73gW7YttRXcLz/dMZpQpr8xXIs/fiq5ghK6I0v9wObBtYRm9/MvtB38L8B
 7sXRr6wgYFkBQ==
Received: from fkassabri-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by fkassabri-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 44R8eVSV840712; Mon, 27 May 2024 11:40:31 +0300
From: Farah Kassabri <fkassabri@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: Michal.Wajdeczko@intel.com
Subject: [PATCH v3] drm/xe: Add device CXL capabilities identification
Date: Mon, 27 May 2024 11:40:31 +0300
Message-Id: <20240527084031.840699-1-fkassabri@habana.ai>
X-Mailer: git-send-email 2.34.1
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

As future Intel GPUs will use CXL interface with the host
servers, this patch will add check if the xe device has CXL
capabilities or not, by reading the PCIe standard DVSEC register
and identify the CXL vendor id.

Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
---
Changes in v3:
fixes following review.

 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_cxl.c          | 51 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_cxl.h          | 13 +++++++
 drivers/gpu/drm/xe/xe_device.c       |  5 +++
 drivers/gpu/drm/xe/xe_device_types.h | 10 ++++++
 5 files changed, 80 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_cxl.c
 create mode 100644 drivers/gpu/drm/xe/xe_cxl.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a5959bb7b1fb..65c0a0317ee7 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -65,6 +65,7 @@ $(uses_generated_oob): $(generated_oob)
 xe-y += xe_bb.o \
 	xe_bo.o \
 	xe_bo_evict.o \
+	xe_cxl.o \
 	xe_debugfs.o \
 	xe_devcoredump.o \
 	xe_device.o \
diff --git a/drivers/gpu/drm/xe/xe_cxl.c b/drivers/gpu/drm/xe/xe_cxl.c
new file mode 100644
index 000000000000..78e4179e965a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cxl.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include "xe_cxl.h"
+#include "xe_device.h"
+#include "../drivers/cxl/cxlpci.h"
+
+enum {
+	CXL_DEV_TYPE_ONE = 1,
+	CXL_DEV_TYPE_TWO,
+	CXL_DEV_TYPE_THREE
+};
+
+/**
+ * xe_cxl_init_capabilities - set CXL device capabilities
+ * @xe: xe device structure
+ *
+ * Set CXL capabilities and information of the xe device.
+ *
+ * Return: 0 on success, negative value on failure.
+ */
+int xe_cxl_init_capabilities(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	u16 ctrl, cxl_dvsec;
+	int rc;
+
+	cxl_dvsec = pci_find_dvsec_capability(pdev, PCI_DVSEC_VENDOR_ID_CXL, CXL_DVSEC_PCIE_DEVICE);
+	if (!cxl_dvsec)
+		return -1;
+
+	rc = pci_read_config_word(pdev, cxl_dvsec + CXL_DVSEC_CTRL_OFFSET, &ctrl);
+	if (rc < 0) {
+		drm_err(&xe->drm, "Failed to read DVSEC_CTRL register(%d)\n", rc);
+		return rc;
+	}
+
+	xe->info.has_cxl_cap = true;
+	xe->cxl.dvsec = cxl_dvsec;
+
+	if (ctrl & CXL_DVSEC_MEM_ENABLE)
+		xe->cxl.type = (ctrl & BIT(0)) ? CXL_DEV_TYPE_TWO : CXL_DEV_TYPE_THREE;
+	else
+		xe->cxl.type = CXL_DEV_TYPE_ONE;
+
+	drm_dbg(&xe->drm, "The device has CXL capability, type %u\n", xe->cxl.type);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_cxl.h b/drivers/gpu/drm/xe/xe_cxl.h
new file mode 100644
index 000000000000..82e36285c383
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cxl.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_CXL_H_
+#define _XE_CXL_H_
+
+struct xe_device;
+
+int xe_cxl_init_capabilities(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5acf2c92789f..04677c9ff10f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -50,6 +50,7 @@
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
 #include "xe_wait_user_fence.h"
+#include "xe_cxl.h"
 
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
@@ -312,6 +313,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (WARN_ON(err))
 		goto err;
 
+	err = xe_cxl_init_capabilities(xe);
+	if (err)
+		goto err;
+
 	return xe;
 
 err:
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8e7048ff3ee5..323c3d57fdb8 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -285,6 +285,8 @@ struct xe_device {
 		u8 has_atomic_enable_pte_bit:1;
 		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
 		u8 has_device_atomics_on_smem:1;
+		/** @info.has_cxl_cap: device has CXL capabilities */
+		u8 has_cxl_cap:1;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 		struct {
@@ -321,6 +323,14 @@ struct xe_device {
 		struct ttm_resource_manager sys_mgr;
 	} mem;
 
+	/** @cxl: CXL info for device */
+	struct {
+		/** @cxl.dvsec: offset to device DVSEC */
+		u16 dvsec;
+		/** @cxl.type: CXL device type */
+		u16 type;
+	} cxl;
+
 	/** @sriov: device level virtualization data */
 	struct {
 		/** @sriov.__mode: SR-IOV mode (Don't access directly!) */
-- 
2.34.1

