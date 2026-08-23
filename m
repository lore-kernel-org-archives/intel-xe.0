Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC670C5DF81
	for <intel-xe@archiver.kernel.org>; Sun, 23 Aug 2026 10:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751C810E434;
	Sun, 23 Aug 2026 10:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lJ2TfmSf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7DD10E3EA
 for <intel-xe@lists.freedesktop.org>; Sun, 23 Aug 2026 10:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787480320; x=1819016320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PPQWVFTwbzCV6RR5asjlTJQKMlV/ZvQIthKkp9TcgKo=;
 b=lJ2TfmSffqIzvUfRhuihIOm++DHMiT4FQwu5oWtUNagNUtcsFyRsvU2v
 jtDsQPlcO0CE1MUXSlBAuOOarjsplZ7198VqYikjM3inyyukcsn6DHG+c
 GpWn+i0uVy7VCzdnkPz3N0AkNA1HDvq6vTARebjQBXLICHit7Zkdej3v5
 +rTCgHDg6qebjbzcqUO+ei5eCl7Ib4+6a+Bqi9Cc/XRtzrQ8q1ka/6q4U
 014zWt1a0oOemX8BtCCZaQGVy2uxj7JEZQ7HrF/1SSC9rxf2Eys2/uEID
 VafNYUukjya0SvQy/9sTJ1N60ziXr1ACwyx8c5JsYPBoLSfDC1YlfH9KS A==;
X-CSE-ConnectionGUID: 56AcR/6TQCGngizLrf+e5A==
X-CSE-MsgGUID: vI3gLgiPQ0yeESwz4Z4ngQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="98547677"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; d="scan'208";a="98547677"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2026 03:18:40 -0700
X-CSE-ConnectionGUID: 0SblinTORHyCIkKwfpCbSQ==
X-CSE-MsgGUID: L72TldtoQzO6d8DV3hm1AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; d="scan'208";a="266222469"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2026 03:18:37 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, heikki.krogerus@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 1/2] drm/xe/i2c: Not for review, Squash of I2C/AMC series
Date: Sun, 23 Aug 2026 16:05:25 +0530
Message-ID: <20260823103523.554184-5-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260823103523.554184-4-badal.nilawar@intel.com>
References: <20260823103523.554184-4-badal.nilawar@intel.com>
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

From: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Squash of https://patchwork.freedesktop.org/series/168930/

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 MAINTAINERS                                |   1 +
 drivers/gpu/drm/xe/Makefile                |   4 +-
 drivers/gpu/drm/xe/regs/xe_i2c_regs.h      |   2 +
 drivers/gpu/drm/xe/xe_amc.c                | 197 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_amc.h                |  25 +++
 drivers/gpu/drm/xe/xe_i2c.c                | 165 +++++++++--------
 drivers/gpu/drm/xe/xe_i2c.h                |  14 +-
 drivers/i2c/busses/i2c-designware-common.c |   2 +
 drivers/i2c/busses/i2c-designware-core.h   |  85 +--------
 drivers/i2c/busses/i2c-designware-master.c |   2 +
 drivers/i2c/busses/i2c-designware-slave.c  |   2 +
 include/linux/designware_i2c.h             | 107 +++++++++++
 12 files changed, 441 insertions(+), 165 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_amc.c
 create mode 100644 drivers/gpu/drm/xe/xe_amc.h
 create mode 100644 include/linux/designware_i2c.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3c508bda61d5..6ff23846f456 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26266,6 +26266,7 @@ R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 L:	linux-i2c@vger.kernel.org
 S:	Supported
 F:	drivers/i2c/busses/i2c-designware-*
+F:	include/linux/designware_i2c.h
 
 SYNOPSYS DESIGNWARE I2C DRIVER - AMDISP
 M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 92134709d998..67b8b5477639 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -154,7 +154,9 @@ xe-y += xe_bb.o \
 	xe_wait_user_fence.o \
 	xe_wopcm.o
 
-xe-$(CONFIG_I2C)	+= xe_i2c.o
+xe-$(CONFIG_I2C)	+= xe_i2c.o \
+			   xe_amc.o
+
 xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
 xe-$(CONFIG_DRM_GPUSVM) += xe_userptr.o
 
diff --git a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
index f2e455e2bfe4..37550e4a20f8 100644
--- a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
@@ -20,4 +20,6 @@
 #define I2C_CONFIG_CMD			XE_REG(I2C_CONFIG_SPACE_OFFSET + PCI_COMMAND)
 #define I2C_CONFIG_PMCSR		XE_REG(I2C_CONFIG_SPACE_OFFSET + 0x84)
 
+#define I2C_REG(reg)			XE_REG((reg) + I2C_MEM_SPACE_OFFSET)
+
 #endif /* _XE_I2C_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
new file mode 100644
index 000000000000..8ecadee6eea3
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_amc.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Intel Corporation.
+ */
+
+#include <linux/delay.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/pci_ids.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/workqueue.h>
+
+#include "regs/xe_i2c_regs.h"
+
+#include "xe_amc.h"
+#include "xe_device.h"
+#include "xe_i2c.h"
+#include "xe_mmio.h"
+
+/**
+ * DOC: Add-In Management Controller (AMC)
+ *
+ * Handler for the SMBus Alerts from the AMC. All the alerts from AMC will cause
+ * the device to be declared wedged.
+ */
+
+#define AMC_COMMAND		0x0f
+#define AMC_GPU_I2C_ADDR	0x8f
+#define AMC_VERSION_V1		0x01
+#define AMC_DESTINATION_ID	12
+#define AMC_SOURCE_ID		8
+#define AMC_FLAGS		0xc8
+
+#define AMC_MSG_TYPE		0x7e
+#define AMC_GET_ALERT_REASON	0x01
+
+enum xe_amc_alert {
+	AMC_ALERT_UNKNOWN,
+	AMC_ALERT_FW_DOWNLOAD,
+	AMC_ALERT_THERMAL_TRIP,
+	AMC_ALERT_OOB_REQUEST,
+	AMC_ALERT_OOB_RESET,
+	AMC_ALERT_CATERR,
+};
+
+static const char * const amc_alert[] = {
+	[AMC_ALERT_FW_DOWNLOAD]		= "Firmware Download",
+	[AMC_ALERT_THERMAL_TRIP]	= "Thermal Trip",
+	[AMC_ALERT_OOB_REQUEST]		= "OOB Request",
+	[AMC_ALERT_OOB_RESET]		= "OOB Reset",
+	[AMC_ALERT_CATERR]		= "Catastrophic",
+};
+
+struct xe_amc {
+	struct xe_i2c *i2c;
+	struct work_struct work;
+};
+
+struct amc_header {
+	u8 command;
+	u8 len;
+	u8 address;
+	u8 version;
+	u8 destination;
+	u8 source;
+	u8 flags;
+} __packed;
+
+struct amc_message {
+	u8 type;
+	u16 vendor;
+	u8 command;
+} __packed;
+
+struct amc_request {
+	struct amc_header header;
+	struct amc_message message;
+	u32 reserved;
+} __packed;
+
+struct amc_response {
+	struct amc_header header;
+	struct amc_message message;
+	u8 error;
+	u8 value;
+} __packed;
+
+static const struct amc_request amc_get_alert_reason = {
+	.header = {
+		.command	= AMC_COMMAND,
+		.len		= sizeof(struct amc_request) - 2,
+		.address	= AMC_GPU_I2C_ADDR,
+		.version	= AMC_VERSION_V1,
+		.destination	= AMC_DESTINATION_ID,
+		.source		= AMC_SOURCE_ID,
+		.flags		= AMC_FLAGS,
+	},
+	.message = {
+		.type		= AMC_MSG_TYPE,
+		.vendor		= htons(PCI_VENDOR_ID_INTEL),
+		.command	= AMC_GET_ALERT_REASON,
+	},
+};
+
+static void xe_amc_work(struct work_struct *work)
+{
+	const struct amc_request *request = &amc_get_alert_reason;
+	struct xe_amc *amc = from_work(amc, work, work);
+	u8 alert_reason = AMC_ALERT_UNKNOWN;
+	struct amc_response response;
+	struct i2c_client *client;
+	int ret;
+
+	client = amc->i2c->client[XE_I2C_CLIENT_AMC];
+	if (IS_ERR_OR_NULL(client))
+		goto out_reassert_interrupt;
+
+	ret = i2c_master_send(client, (u8 *)request, sizeof(*request));
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to send request (%d)\n", ret);
+		goto out_reassert_interrupt;
+	}
+
+	/* AMC needs 20ms to generate the response. */
+	fsleep(20 * USEC_PER_MSEC);
+
+	ret = i2c_master_recv(client, (u8 *)&response, sizeof(response));
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to read response (%d)\n", ret);
+		goto out_reassert_interrupt;
+	}
+
+	if (!response.header.len) {
+		dev_err(&client->dev, "empty response from AMC\n");
+		goto out_reassert_interrupt;
+	}
+
+	if (memcmp(&response.message, &request->message, sizeof(struct amc_message))) {
+		dev_err(&client->dev, "response does not match the request\n");
+		goto out_reassert_interrupt;
+	}
+
+	if (response.error) {
+		dev_err(&client->dev, "AMC error 0x%02x\n", response.error);
+		goto out_reassert_interrupt;
+	}
+
+	alert_reason = response.value;
+	dev_dbg(&client->dev, "Alert reason: %d\n", alert_reason);
+
+out_reassert_interrupt:
+	xe_mmio_rmw32(amc->i2c->mmio, I2C_CONFIG_CMD, PCI_COMMAND_INTX_DISABLE, 0);
+
+	switch (alert_reason) {
+	case AMC_ALERT_FW_DOWNLOAD:
+	case AMC_ALERT_THERMAL_TRIP:
+	case AMC_ALERT_OOB_REQUEST:
+	case AMC_ALERT_OOB_RESET:
+	case AMC_ALERT_CATERR:
+		dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n", amc_alert[alert_reason]);
+		xe_device_declare_wedged(i2c_client_to_xe_device(client));
+		break;
+	default:
+		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
+		break;
+	}
+}
+
+void xe_amc_handle_alert(struct xe_i2c *i2c)
+{
+	queue_work(system_long_wq, &i2c->amc->work);
+}
+
+int xe_amc_init(struct xe_i2c *i2c)
+{
+	struct xe_amc *amc;
+
+	amc = kzalloc(sizeof(*amc), GFP_KERNEL);
+	if (!amc)
+		return -ENOMEM;
+
+	INIT_WORK(&amc->work, xe_amc_work);
+	i2c->amc = amc;
+	amc->i2c = i2c;
+
+	return 0;
+}
+
+void xe_amc_exit(struct xe_i2c *i2c)
+{
+	if (i2c->amc) {
+		cancel_work_sync(&i2c->amc->work);
+		kfree(i2c->amc);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_amc.h b/drivers/gpu/drm/xe/xe_amc.h
new file mode 100644
index 000000000000..b1d5311fee53
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_amc.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _XE_AMC_H_
+#define _XE_AMC_H_
+
+#include <linux/i2c.h>
+
+#include "xe_device.h"
+
+struct xe_i2c;
+
+static inline struct xe_device *i2c_adapter_to_xe_device(struct i2c_adapter *adapter)
+{
+	return kdev_to_xe_device(adapter->dev.parent->parent);
+}
+
+static inline struct xe_device *i2c_client_to_xe_device(struct i2c_client *client)
+{
+	return i2c_adapter_to_xe_device(client->adapter);
+}
+
+int xe_amc_init(struct xe_i2c *i2c);
+void xe_amc_exit(struct xe_i2c *i2c);
+void xe_amc_handle_alert(struct xe_i2c *i2c);
+
+#endif /* _XE_AMC_H_ */
diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index a26c38bb17a1..d8fa68206f41 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -8,12 +8,11 @@
 #include <drm/drm_print.h>
 #include <linux/array_size.h>
 #include <linux/container_of.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/ioport.h>
-#include <linux/irq.h>
-#include <linux/irqdomain.h>
 #include <linux/notifier.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
@@ -24,9 +23,12 @@
 #include <linux/types.h>
 #include <linux/workqueue.h>
 
+#include <linux/designware_i2c.h>
+
 #include "regs/xe_i2c_regs.h"
 #include "regs/xe_irq_regs.h"
 
+#include "xe_amc.h"
 #include "xe_device.h"
 #include "xe_i2c.h"
 #include "xe_mmio.h"
@@ -61,16 +63,32 @@ static inline void xe_i2c_read_endpoint(struct xe_mmio *mmio, void *ep)
 	val[1] = xe_mmio_read32(mmio, REG_SG_REMAP_ADDR_POSTFIX);
 }
 
+static void xe_i2c_handle_smbus_alert(struct xe_i2c *i2c)
+{
+	u32 stat;
+
+	stat = xe_mmio_read32(i2c->mmio, I2C_REG(DW_IC_SMBUS_INTR_STAT));
+	if (!stat)
+		return;
+
+	xe_mmio_write32(i2c->mmio, I2C_REG(DW_IC_CLR_SMBUS_INTR), stat);
+
+	if (stat & DW_IC_SMBUS_INTR_ALERT && i2c->amc)
+		xe_amc_handle_alert(i2c);
+	else
+		xe_mmio_rmw32(i2c->mmio, I2C_CONFIG_CMD, PCI_COMMAND_INTX_DISABLE, 0);
+}
+
 static void xe_i2c_client_work(struct work_struct *work)
 {
 	struct xe_i2c *i2c = container_of(work, struct xe_i2c, work);
 	struct i2c_board_info info = {
 		.type	= "amc",
 		.flags	= I2C_CLIENT_HOST_NOTIFY,
-		.addr	= i2c->ep.addr[1],
+		.addr	= i2c->ep.addr[XE_I2C_CLIENT_AMC],
 	};
 
-	i2c->client[0] = i2c_new_client_device(i2c->adapter, &info);
+	i2c->client[XE_I2C_CLIENT_AMC] = i2c_new_client_device(i2c->adapter, &info);
 }
 
 static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void *data)
@@ -115,16 +133,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 		goto err_fwnode_remove;
 	}
 
-	if (i2c->adapter_irq) {
-		struct resource res;
-
-		res = DEFINE_RES_IRQ_NAMED(i2c->adapter_irq, "xe_i2c");
-
-		ret = platform_device_add_resources(pdev, &res, 1);
-		if (ret)
-			goto err_pdev_put;
-	}
-
 	pdev->dev.parent = i2c->drm_dev;
 	pdev->dev.fwnode = fwnode;
 	i2c->adapter_node = fwnode;
@@ -166,7 +174,8 @@ bool xe_i2c_present(struct xe_device *xe)
 
 static bool xe_i2c_irq_present(struct xe_device *xe)
 {
-	return xe->i2c && xe->i2c->adapter_irq;
+	return xe->i2c && xe->i2c->ep.capabilities & XE_I2C_EP_CAP_IRQ &&
+		!xe_survivability_mode_is_boot_enabled(xe);
 }
 
 /**
@@ -179,18 +188,10 @@ static bool xe_i2c_irq_present(struct xe_device *xe)
  */
 void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl)
 {
-	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
-
 	if (!(master_ctl & I2C_IRQ) || !xe_i2c_irq_present(xe))
 		return;
 
-	/* Forward interrupt to I2C adapter */
-	generic_handle_irq_safe(xe->i2c->adapter_irq);
-
-	/* Deassert after I2C adapter clears the interrupt */
-	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_INTX_DISABLE);
-	/* Reassert to allow subsequent interrupt generation */
-	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, PCI_COMMAND_INTX_DISABLE, 0);
+	xe_i2c_handle_smbus_alert(xe->i2c);
 }
 
 void xe_i2c_irq_reset(struct xe_device *xe)
@@ -215,50 +216,40 @@ void xe_i2c_irq_postinstall(struct xe_device *xe)
 	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, PCI_COMMAND_INTX_DISABLE, 0);
 }
 
-static int xe_i2c_irq_map(struct irq_domain *h, unsigned int virq,
-			  irq_hw_number_t hw_irq_num)
+/* See "Disabling DW_apb_i2c" in the DesignWare DW_abp_i2c databook. */
+static void xe_i2c_disable(struct xe_i2c *i2c)
 {
-	irq_set_chip_and_handler(virq, &dummy_irq_chip, handle_simple_irq);
-	return 0;
-}
+	int timeout = 100;
+	u32 status;
 
-static const struct irq_domain_ops xe_i2c_irq_ops = {
-	.map = xe_i2c_irq_map,
-};
+	xe_mmio_rmw32(i2c->mmio, I2C_REG(DW_IC_ENABLE), DW_IC_ENABLE_ENABLE, 0);
 
-static int xe_i2c_create_irq(struct xe_device *xe)
-{
-	struct xe_i2c *i2c = xe->i2c;
-	struct irq_domain *domain;
+	do {
+		status = xe_mmio_read32(i2c->mmio, I2C_REG(DW_IC_ENABLE_STATUS));
+		if (!(status & DW_IC_ENABLE_ENABLE))
+			return;
+		/* Can't sleep here. */
+		udelay(25);
+	} while (timeout--);
 
-	if (!(i2c->ep.capabilities & XE_I2C_EP_CAP_IRQ) ||
-	    xe_survivability_mode_is_boot_enabled(xe))
-		return 0;
-
-	domain = irq_domain_create_linear(dev_fwnode(i2c->drm_dev), 1, &xe_i2c_irq_ops, NULL);
-	if (!domain)
-		return -ENOMEM;
-
-	i2c->adapter_irq = irq_create_mapping(domain, 0);
-	i2c->irqdomain = domain;
-
-	return 0;
-}
-
-static void xe_i2c_remove_irq(struct xe_i2c *i2c)
-{
-	if (!i2c->irqdomain)
-		return;
-
-	irq_dispose_mapping(i2c->adapter_irq);
-	irq_domain_remove(i2c->irqdomain);
+	dev_warn(i2c->drm_dev, "timeout in disabling i2c adapter\n");
 }
 
 static int xe_i2c_read(void *context, unsigned int reg, unsigned int *val)
 {
 	struct xe_i2c *i2c = context;
 
-	*val = xe_mmio_read32(i2c->mmio, XE_REG(reg + I2C_MEM_SPACE_OFFSET));
+	*val = xe_mmio_read32(i2c->mmio, I2C_REG(reg));
+
+	switch (reg) {
+	case DW_IC_ENABLE:
+	case DW_IC_ENABLE_STATUS:
+		FIELD_MODIFY(DW_IC_ENABLE_ENABLE, val,
+			     i2c->ic_enable & DW_IC_ENABLE_ENABLE);
+		break;
+	default:
+		break;
+	}
 
 	return 0;
 }
@@ -267,8 +258,33 @@ static int xe_i2c_write(void *context, unsigned int reg, unsigned int val)
 {
 	struct xe_i2c *i2c = context;
 
-	xe_mmio_write32(i2c->mmio, XE_REG(reg + I2C_MEM_SPACE_OFFSET), val);
+	switch (reg) {
+	case DW_IC_CON:
+	case DW_IC_TAR:
+	case DW_IC_SAR:
+		/* Disable the controller. */
+		xe_i2c_disable(i2c);
 
+		/* Write the register. */
+		xe_mmio_write32(i2c->mmio, I2C_REG(reg), val);
+
+		/* Enable the controller. */
+		xe_mmio_rmw32(i2c->mmio, I2C_REG(DW_IC_ENABLE), 0, DW_IC_ENABLE_ENABLE);
+		return 0;
+	case DW_IC_ENABLE:
+		i2c->ic_enable = val;
+		/* Other fields can be updated except the enable bit. */
+		val |= DW_IC_ENABLE_ENABLE;
+		break;
+	case DW_IC_SMBUS_INTR_MASK:
+		/* Make sure the Alert is never masked. */
+		val |= DW_IC_SMBUS_INTR_ALERT;
+		break;
+	default:
+		break;
+	}
+
+	xe_mmio_write32(i2c->mmio, I2C_REG(reg), val);
 	return 0;
 }
 
@@ -310,12 +326,15 @@ static void xe_i2c_remove(void *data)
 	struct xe_i2c *i2c = data;
 	unsigned int i;
 
-	for (i = 0; i < XE_I2C_MAX_CLIENTS; i++)
+	xe_amc_exit(i2c);
+
+	for (i = 0; i < XE_I2C_MAX_CLIENTS; i++) {
 		i2c_unregister_device(i2c->client[i]);
+		i2c->client[i] = NULL;
+	}
 
 	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
 	xe_i2c_unregister_adapter(i2c);
-	xe_i2c_remove_irq(i2c);
 }
 
 /**
@@ -363,22 +382,18 @@ int xe_i2c_probe(struct xe_device *xe)
 	if (ret)
 		return ret;
 
-	ret = xe_i2c_create_irq(xe);
-	if (ret)
-		goto err_unregister_notifier;
-
 	ret = xe_i2c_register_adapter(i2c);
-	if (ret)
-		goto err_remove_irq;
+	if (ret) {
+		bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
+		return ret;
+	}
+
+	ret = xe_amc_init(i2c);
+	if (ret) {
+		xe_i2c_remove(i2c);
+		return ret;
+	}
 
 	xe_i2c_irq_postinstall(xe);
 	return devm_add_action_or_reset(drm_dev, xe_i2c_remove, i2c);
-
-err_remove_irq:
-	xe_i2c_remove_irq(i2c);
-
-err_unregister_notifier:
-	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
-
-	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
index 425d8160835f..d63adacfefe7 100644
--- a/drivers/gpu/drm/xe/xe_i2c.h
+++ b/drivers/gpu/drm/xe/xe_i2c.h
@@ -11,18 +11,21 @@ struct device;
 struct fwnode_handle;
 struct i2c_adapter;
 struct i2c_client;
-struct irq_domain;
 struct platform_device;
+struct xe_amc;
 struct xe_device;
 struct xe_mmio;
 
-#define XE_I2C_MAX_CLIENTS		3
-
 #define XE_I2C_EP_COOKIE_DEVICE		0xde
 
 /* Endpoint Capabilities */
 #define XE_I2C_EP_CAP_IRQ		BIT(0)
 
+enum XE_I2C_CLIENT {
+	XE_I2C_CLIENT_AMC = 1,
+	XE_I2C_MAX_CLIENTS = 3,
+};
+
 struct xe_i2c_endpoint {
 	u8 cookie;
 	u8 capabilities;
@@ -34,17 +37,16 @@ struct xe_i2c {
 	struct platform_device *pdev;
 	struct i2c_adapter *adapter;
 	struct i2c_client *client[XE_I2C_MAX_CLIENTS];
+	unsigned int ic_enable;
 
 	struct notifier_block bus_notifier;
 	struct work_struct work;
 
-	struct irq_domain *irqdomain;
-	int adapter_irq;
-
 	struct xe_i2c_endpoint ep;
 	struct device *drm_dev;
 
 	struct xe_mmio *mmio;
+	struct xe_amc *amc;
 };
 
 #if IS_ENABLED(CONFIG_I2C)
diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index e4dfa2ec58bb..a1eca6cd4b75 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -33,6 +33,8 @@
 #include <linux/types.h>
 #include <linux/units.h>
 
+#include <linux/designware_i2c.h>
+
 #include "i2c-designware-core.h"
 
 #define DW_IC_DEFAULT_BUS_CAPACITANCE_pF	100
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index c71aa2dd368d..2c929a6e8da2 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -18,6 +18,8 @@
 #include <linux/regmap.h>
 #include <linux/types.h>
 
+#include <linux/designware_i2c.h>
+
 #define DW_IC_DEFAULT_FUNCTIONALITY		(I2C_FUNC_I2C | \
 						 I2C_FUNC_SMBUS_BYTE | \
 						 I2C_FUNC_SMBUS_BYTE_DATA | \
@@ -25,23 +27,6 @@
 						 I2C_FUNC_SMBUS_BLOCK_DATA | \
 						 I2C_FUNC_SMBUS_I2C_BLOCK)
 
-#define DW_IC_CON_MASTER			BIT(0)
-#define DW_IC_CON_SPEED_STD			(1 << 1)
-#define DW_IC_CON_SPEED_FAST			(2 << 1)
-#define DW_IC_CON_SPEED_HIGH			(3 << 1)
-#define DW_IC_CON_SPEED_MASK			GENMASK(2, 1)
-#define DW_IC_CON_10BITADDR_SLAVE		BIT(3)
-#define DW_IC_CON_10BITADDR_MASTER		BIT(4)
-#define DW_IC_CON_RESTART_EN			BIT(5)
-#define DW_IC_CON_SLAVE_DISABLE			BIT(6)
-#define DW_IC_CON_STOP_DET_IFADDRESSED		BIT(7)
-#define DW_IC_CON_TX_EMPTY_CTRL			BIT(8)
-#define DW_IC_CON_RX_FIFO_FULL_HLD_CTRL		BIT(9)
-#define DW_IC_CON_BUS_CLEAR_CTRL		BIT(11)
-
-#define DW_IC_DATA_CMD_DAT			GENMASK(7, 0)
-#define DW_IC_DATA_CMD_FIRST_DATA_BYTE		BIT(11)
-
 /*
  * Register access parameters
  */
@@ -55,65 +40,9 @@
 #define DW_IC_FIFO_RX_FIELD			GENMASK(15, 8)
 #define DW_IC_FIFO_MIN_DEPTH			2
 
-/*
- * Registers offset
- */
-#define DW_IC_CON				0x00
-#define DW_IC_TAR				0x04
-#define DW_IC_SAR				0x08
-#define DW_IC_DATA_CMD				0x10
-#define DW_IC_SS_SCL_HCNT			0x14
-#define DW_IC_SS_SCL_LCNT			0x18
-#define DW_IC_FS_SCL_HCNT			0x1c
-#define DW_IC_FS_SCL_LCNT			0x20
-#define DW_IC_HS_SCL_HCNT			0x24
-#define DW_IC_HS_SCL_LCNT			0x28
-#define DW_IC_INTR_STAT				0x2c
-#define DW_IC_INTR_MASK				0x30
-#define DW_IC_RAW_INTR_STAT			0x34
-#define DW_IC_RX_TL				0x38
-#define DW_IC_TX_TL				0x3c
-#define DW_IC_CLR_INTR				0x40
-#define DW_IC_CLR_RX_UNDER			0x44
-#define DW_IC_CLR_RX_OVER			0x48
-#define DW_IC_CLR_TX_OVER			0x4c
-#define DW_IC_CLR_RD_REQ			0x50
-#define DW_IC_CLR_TX_ABRT			0x54
-#define DW_IC_CLR_RX_DONE			0x58
-#define DW_IC_CLR_ACTIVITY			0x5c
-#define DW_IC_CLR_STOP_DET			0x60
-#define DW_IC_CLR_START_DET			0x64
-#define DW_IC_CLR_GEN_CALL			0x68
-#define DW_IC_ENABLE				0x6c
-#define DW_IC_STATUS				0x70
-#define DW_IC_TXFLR				0x74
-#define DW_IC_RXFLR				0x78
-#define DW_IC_SDA_HOLD				0x7c
-#define DW_IC_TX_ABRT_SOURCE			0x80
-#define DW_IC_ENABLE_STATUS			0x9c
-#define DW_IC_CLR_RESTART_DET			0xa8
-#define DW_IC_SMBUS_INTR_MASK			0xcc
-#define DW_IC_COMP_PARAM_1			0xf4
-#define DW_IC_COMP_VERSION			0xf8
 #define DW_IC_SDA_HOLD_MIN_VERS			0x3131312A /* "111*" == v1.11* */
-#define DW_IC_COMP_TYPE				0xfc
 #define DW_IC_COMP_TYPE_VALUE			0x44570140 /* "DW" + 0x0140 */
 
-#define DW_IC_INTR_RX_UNDER			BIT(0)
-#define DW_IC_INTR_RX_OVER			BIT(1)
-#define DW_IC_INTR_RX_FULL			BIT(2)
-#define DW_IC_INTR_TX_OVER			BIT(3)
-#define DW_IC_INTR_TX_EMPTY			BIT(4)
-#define DW_IC_INTR_RD_REQ			BIT(5)
-#define DW_IC_INTR_TX_ABRT			BIT(6)
-#define DW_IC_INTR_RX_DONE			BIT(7)
-#define DW_IC_INTR_ACTIVITY			BIT(8)
-#define DW_IC_INTR_STOP_DET			BIT(9)
-#define DW_IC_INTR_START_DET			BIT(10)
-#define DW_IC_INTR_GEN_CALL			BIT(11)
-#define DW_IC_INTR_RESTART_DET			BIT(12)
-#define DW_IC_INTR_MST_ON_HOLD			BIT(13)
-
 #define DW_IC_INTR_DEFAULT_MASK			(DW_IC_INTR_RX_FULL | \
 						 DW_IC_INTR_TX_ABRT | \
 						 DW_IC_INTR_STOP_DET)
@@ -123,16 +52,6 @@
 						 DW_IC_INTR_RX_UNDER | \
 						 DW_IC_INTR_RD_REQ)
 
-#define DW_IC_ENABLE_ENABLE			BIT(0)
-#define DW_IC_ENABLE_ABORT			BIT(1)
-
-#define DW_IC_STATUS_ACTIVITY			BIT(0)
-#define DW_IC_STATUS_TFE			BIT(2)
-#define DW_IC_STATUS_RFNE			BIT(3)
-#define DW_IC_STATUS_MASTER_ACTIVITY		BIT(5)
-#define DW_IC_STATUS_SLAVE_ACTIVITY		BIT(6)
-#define DW_IC_STATUS_MASTER_HOLD_TX_FIFO_EMPTY	BIT(7)
-
 #define DW_IC_SDA_HOLD_RX_SHIFT			16
 #define DW_IC_SDA_HOLD_RX_MASK			GENMASK(23, 16)
 
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 7a301c8b604e..a1bcc3797e4f 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -25,6 +25,8 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include <linux/designware_i2c.h>
+
 #include "i2c-designware-core.h"
 
 #define AMD_TIMEOUT_MIN_US	25
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index ad0d5fbfa6d5..0abcc7757b23 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -19,6 +19,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
+#include <linux/designware_i2c.h>
+
 #include "i2c-designware-core.h"
 
 int i2c_dw_reg_slave(struct i2c_client *slave)
diff --git a/include/linux/designware_i2c.h b/include/linux/designware_i2c.h
new file mode 100644
index 000000000000..53f37f18a722
--- /dev/null
+++ b/include/linux/designware_i2c.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Synopsys DesignWare I2C register definitions
+ *
+ * Copyright (C) 2026, Intel Corporation
+ */
+
+#ifndef __LINUX_DESIGNWARE_I2C_H
+#define __LINUX_DESIGNWARE_I2C_H
+
+#include <linux/bits.h>
+
+/*
+ * Registers offset
+ */
+#define DW_IC_CON				0x00
+#define DW_IC_TAR				0x04
+#define DW_IC_SAR				0x08
+#define DW_IC_DATA_CMD				0x10
+#define DW_IC_SS_SCL_HCNT			0x14
+#define DW_IC_SS_SCL_LCNT			0x18
+#define DW_IC_FS_SCL_HCNT			0x1c
+#define DW_IC_FS_SCL_LCNT			0x20
+#define DW_IC_HS_SCL_HCNT			0x24
+#define DW_IC_HS_SCL_LCNT			0x28
+#define DW_IC_INTR_STAT				0x2c
+#define DW_IC_INTR_MASK				0x30
+#define DW_IC_RAW_INTR_STAT			0x34
+#define DW_IC_RX_TL				0x38
+#define DW_IC_TX_TL				0x3c
+#define DW_IC_CLR_INTR				0x40
+#define DW_IC_CLR_RX_UNDER			0x44
+#define DW_IC_CLR_RX_OVER			0x48
+#define DW_IC_CLR_TX_OVER			0x4c
+#define DW_IC_CLR_RD_REQ			0x50
+#define DW_IC_CLR_TX_ABRT			0x54
+#define DW_IC_CLR_RX_DONE			0x58
+#define DW_IC_CLR_ACTIVITY			0x5c
+#define DW_IC_CLR_STOP_DET			0x60
+#define DW_IC_CLR_START_DET			0x64
+#define DW_IC_CLR_GEN_CALL			0x68
+#define DW_IC_ENABLE				0x6c
+#define DW_IC_STATUS				0x70
+#define DW_IC_TXFLR				0x74
+#define DW_IC_RXFLR				0x78
+#define DW_IC_SDA_HOLD				0x7c
+#define DW_IC_TX_ABRT_SOURCE			0x80
+#define DW_IC_ENABLE_STATUS			0x9c
+#define DW_IC_CLR_RESTART_DET			0xa8
+#define DW_IC_SMBUS_INTR_STAT			0xc8
+#define DW_IC_SMBUS_INTR_MASK			0xcc
+#define DW_IC_CLR_SMBUS_INTR			0xd4
+#define DW_IC_COMP_PARAM_1			0xf4
+#define DW_IC_COMP_VERSION			0xf8
+#define DW_IC_COMP_TYPE				0xfc
+
+/* DW_IC_CON bits */
+#define DW_IC_CON_MASTER			BIT(0)
+#define DW_IC_CON_SPEED_STD			(1 << 1)
+#define DW_IC_CON_SPEED_FAST			(2 << 1)
+#define DW_IC_CON_SPEED_HIGH			(3 << 1)
+#define DW_IC_CON_SPEED_MASK			GENMASK(2, 1)
+#define DW_IC_CON_10BITADDR_SLAVE		BIT(3)
+#define DW_IC_CON_10BITADDR_MASTER		BIT(4)
+#define DW_IC_CON_RESTART_EN			BIT(5)
+#define DW_IC_CON_SLAVE_DISABLE			BIT(6)
+#define DW_IC_CON_STOP_DET_IFADDRESSED		BIT(7)
+#define DW_IC_CON_TX_EMPTY_CTRL			BIT(8)
+#define DW_IC_CON_RX_FIFO_FULL_HLD_CTRL		BIT(9)
+#define DW_IC_CON_BUS_CLEAR_CTRL		BIT(11)
+
+/* DW_IC_DATA_CMD bits */
+#define DW_IC_DATA_CMD_DAT			GENMASK(7, 0)
+#define DW_IC_DATA_CMD_FIRST_DATA_BYTE		BIT(11)
+
+/* DW_IC_INTR_* bits */
+#define DW_IC_INTR_RX_UNDER			BIT(0)
+#define DW_IC_INTR_RX_OVER			BIT(1)
+#define DW_IC_INTR_RX_FULL			BIT(2)
+#define DW_IC_INTR_TX_OVER			BIT(3)
+#define DW_IC_INTR_TX_EMPTY			BIT(4)
+#define DW_IC_INTR_RD_REQ			BIT(5)
+#define DW_IC_INTR_TX_ABRT			BIT(6)
+#define DW_IC_INTR_RX_DONE			BIT(7)
+#define DW_IC_INTR_ACTIVITY			BIT(8)
+#define DW_IC_INTR_STOP_DET			BIT(9)
+#define DW_IC_INTR_START_DET			BIT(10)
+#define DW_IC_INTR_GEN_CALL			BIT(11)
+#define DW_IC_INTR_RESTART_DET			BIT(12)
+#define DW_IC_INTR_MST_ON_HOLD			BIT(13)
+
+/* DW_IC_ENABLE bits */
+#define DW_IC_ENABLE_ENABLE			BIT(0)
+#define DW_IC_ENABLE_ABORT			BIT(1)
+
+/* DW_IC_STATUS bits */
+#define DW_IC_STATUS_ACTIVITY			BIT(0)
+#define DW_IC_STATUS_TFE			BIT(2)
+#define DW_IC_STATUS_RFNE			BIT(3)
+#define DW_IC_STATUS_MASTER_ACTIVITY		BIT(5)
+#define DW_IC_STATUS_SLAVE_ACTIVITY		BIT(6)
+#define DW_IC_STATUS_MASTER_HOLD_TX_FIFO_EMPTY	BIT(7)
+
+/* DW_IC_SMBUS_INTR_* bits */
+#define DW_IC_SMBUS_INTR_ALERT			BIT(10)
+
+#endif /* __LINUX_DESIGNWARE_I2C_H */
-- 
2.54.0

