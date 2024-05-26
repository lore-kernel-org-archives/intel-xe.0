Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2FBC25B75
	for <intel-xe@archiver.kernel.org>; Sun, 26 May 2024 13:03:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91DC10E124;
	Sun, 26 May 2024 13:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="U/yQSwf3";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4183010E124
 for <intel-xe@lists.freedesktop.org>; Sun, 26 May 2024 13:03:09 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716728591; bh=vxErbsInJ707plvn11KGcLV7d3DNoVvQmAShbdgZE5o=;
 h=From:To:Cc:Subject:Date:From;
 b=U/yQSwf34rcY9XNboMN4R9J6Z/1wHuEl8JBts+HbGBoqZsj6XQEdCErXYj63DBnjq
 suemxO6GpP1wNAc/tSVnvqMQiENkX3CcCRrUaqufaY2fO5JLSO1kovpp9ZXVcU7P8c
 UMynPcvFzBtQQMl2gSPdHCZnr+Odp/QdmhLi1ZaKJ5cBvQjavB4MBpeOpJymxIPzTT
 N3jMPQ6/upL+XscYUXA64jfrxcj9YObcyn/C/d9AtpQ57IM/LmkeiiYROH0FEjSlgs
 Q4eZBtnvjMEAswQl7ERyFthiA0i9BQPlYjfE7UO/NZedqXXXvJnqo9lXcaNeOKyISp
 kI6NBM7XXcP/g==
Received: from fkassabri-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by fkassabri-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 44QD2sl0706796; Sun, 26 May 2024 16:02:55 +0300
From: Farah Kassabri <fkassabri@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: Michal.Wajdeczko@intel.com
Subject: [PATCH v2] drm/xe: Add device CXL capabilities identification
Date: Sun, 26 May 2024 16:02:54 +0300
Message-Id: <20240526130254.706783-1-fkassabri@habana.ai>
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
Reviewed by: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
---
changes in v2:
fixes following review

 drivers/gpu/drm/xe/Makefile          |  3 ++-
 drivers/gpu/drm/xe/xe_cxl.c          | 35 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_cxl.h          | 26 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       |  5 ++++
 drivers/gpu/drm/xe/xe_device_types.h | 10 ++++++++
 5 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_cxl.c
 create mode 100644 drivers/gpu/drm/xe/xe_cxl.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a5959bb7b1fb..5f35dff98238 100644
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
@@ -146,7 +147,7 @@ xe-y += xe_bb.o \
 	xe_vram_freq.o \
 	xe_wait_user_fence.o \
 	xe_wa.o \
-	xe_wopcm.o
+	xe_wopcm.o \
 
 xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
 
diff --git a/drivers/gpu/drm/xe/xe_cxl.c b/drivers/gpu/drm/xe/xe_cxl.c
new file mode 100644
index 000000000000..13c4bf7fe35e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cxl.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include "xe_cxl.h"
+
+int xe_cxl_init_capabilities(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	u16 ctrl, cxl_dvsec;
+	int rc;
+
+	cxl_dvsec = pci_find_dvsec_capability(pdev, PCI_DVSEC_VENDOR_ID_CXL, CXL_DVSEC_PCIE_DEVICE);
+	if (!cxl_dvsec)
+		return 0;
+
+	xe->info.has_cxl_cap = true;
+	xe->cxl.dvsec = cxl_dvsec;
+
+	rc = pci_read_config_word(pdev, cxl_dvsec + CXL_DVSEC_CTRL_OFFSET, &ctrl);
+	if (rc < 0) {
+		drm_err(&xe->drm, "Failed to read dvsec ctrl register(%d)\n", rc);
+		return rc;
+	}
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
index 000000000000..6ba89d527c84
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cxl.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_CXL_H_
+#define _XE_CXL_H_
+
+#include "xe_device.h"
+#include "../drivers/cxl/cxlpci.h"
+
+enum {
+	CXL_DEV_TYPE_ONE = 1,
+	CXL_DEV_TYPE_TWO = 2,
+	CXL_DEV_TYPE_THREE = 3,
+};
+
+/**
+ * xe_cxl_init_capabilities - set CXL device capabilities
+ * @xe: xe device structure
+ *
+ * Set CXL capabilities and information of the xe device.
+ */
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

