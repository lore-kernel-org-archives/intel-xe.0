Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058D7D4A61A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 09:36:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3C010E838;
	Fri, 16 Jan 2026 09:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PcdUlbCe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76D010E838
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 09:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768556216; x=1800092216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EeA1R0C2i1Mq6e6Th0+ov/dhkp6uSLuclc5f2KwuoQM=;
 b=PcdUlbCeCPMvDCw9x6A6Tec+NkCQEeYHEjfM/25t/c7ozG2qgYK7eqxM
 +l12ZvxA/Q2rT5eEh0TxpEeB3DPbpeuliIy/CEpvHV6tJC6WFYIRT/RVx
 abV5ebJWICAcPmgTa0A+BYbt5sdabT2dlgxkFsqaUNE/1HrwfDUR5WfOc
 aiBe9rA3MTwvBQ0erzltW0AlJ+bvZtSA0JLWGEVzOVxmFcvyOXb2/KYsc
 HBX0uNMLx2c0LApGOl+7AfhSZtmAnv6ZKRRbI3ULXK/sjTCrSQ6lI6vLA
 jjCI2yiuai9h2C+Wn/8SEezUBzKH3mevK7w2WbY5gSbBT2P/nkNs285wG Q==;
X-CSE-ConnectionGUID: v6VtIJt0SpmMKfQ1nRDBUA==
X-CSE-MsgGUID: HdB+46vdRn2x8675/ho+dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80174991"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="80174991"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 01:36:56 -0800
X-CSE-ConnectionGUID: lJ9JnIkpSmOLSXom+dMqDQ==
X-CSE-MsgGUID: ASvXZBfrSYqXCfpiI/ChBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="205619598"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 16 Jan 2026 01:36:54 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, umesh.nerlige.ramappa@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 3/4] drm/xe/sysctrl: Add system controller event support
Date: Fri, 16 Jan 2026 15:03:32 +0530
Message-ID: <20260116093432.914040-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116093432.914040-1-raag.jadav@intel.com>
References: <20260116093432.914040-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

System controller reports different types of events to GFX endpoint for
different usecases, add initial support for them. This will be further
extended to service those usecases.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/Makefile                 |  1 +
 drivers/gpu/drm/xe/xe_sysctrl.c             |  7 ++
 drivers/gpu/drm/xe/xe_sysctrl.h             |  1 +
 drivers/gpu/drm/xe/xe_sysctrl_event.c       | 77 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_event_types.h | 49 +++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h     | 10 +++
 6 files changed, 145 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index ff567fa58119..16e28cab8464 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -122,6 +122,7 @@ xe-y += xe_bb.o \
 	xe_survivability_mode.o \
 	xe_sync.o \
 	xe_sysctrl.o \
+	xe_sysctrl_event.o \
 	xe_sysctrl_mailbox.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index 1d78916dd6ad..b5a57e2dc0d8 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -10,6 +10,7 @@
 #include "regs/xe_irq_regs.h"
 #include "regs/xe_sysctrl_regs.h"
 #include "xe_device.h"
+#include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_soc_remapper.h"
 #include "xe_sysctrl.h"
@@ -30,6 +31,12 @@
 
 static void xe_sysctrl_work(struct work_struct *work)
 {
+	struct xe_sysctrl *sc = container_of(work, struct xe_sysctrl, work);
+	struct xe_device *xe = container_of(sc, struct xe_device, sc);
+
+	xe_pm_runtime_get(xe);
+	xe_sysctrl_event(xe);
+	xe_pm_runtime_put(xe);
 }
 
 static void xe_sysctrl_fini(void *arg)
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
index 5919310b9db9..bd9acf575d14 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
@@ -12,5 +12,6 @@ struct xe_device;
 
 int xe_sysctrl_init(struct xe_device *xe);
 void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
+void xe_sysctrl_event(struct xe_device *xe);
 
 #endif /* _XE_SYSCTRL_H_ */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
new file mode 100644
index 000000000000..3a860bc34db0
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "xe_assert.h"
+#include "xe_device.h"
+#include "xe_irq.h"
+#include "xe_pm.h"
+#include "xe_printk.h"
+#include "xe_sysctrl.h"
+#include "xe_sysctrl_event_types.h"
+#include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_mailbox_types.h"
+
+static void xe_sysctrl_get_pending_event(struct xe_device *xe,
+					 struct xe_sysctrl_mailbox_command *command)
+{
+	struct xe_sysctrl_event_response response;
+	size_t len;
+	int ret;
+
+	command->data_out = &response;
+	command->data_out_len = sizeof(response);
+
+	do {
+		memset(&response, 0, sizeof(response));
+
+		ret = xe_sysctrl_send_command(xe, command, &len);
+		if (ret || !len)
+			return;
+
+		if (len != sizeof(response))
+			xe_err(xe, "Unexpected response length %ld\n", len);
+
+		if (response.event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED)
+			xe_warn(xe, "Counter threshold crossed\n");
+		else
+			xe_err(xe, "Unexpected event %#x\n", response.event);
+
+	} while (response.count);
+}
+
+static void xe_sysctrl_event_request_prep(struct xe_device *xe,
+					  struct xe_sysctrl_mailbox_app_msg_hdr *header,
+					  struct xe_sysctrl_event_request *request)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct xe_sysctrl_event_request req_data;
+	u32 req_hdr;
+
+	req_hdr = REG_FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
+		  REG_FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_CMD_GET_PENDING_EVENT);
+
+	req_data.vector = xe_device_has_msix(xe) ? XE_IRQ_DEFAULT_MSIX : 0;
+	req_data.fn = PCI_FUNC(pdev->devfn);
+
+	header->data = req_hdr;
+	*request = req_data;
+}
+
+void xe_sysctrl_event(struct xe_device *xe)
+{
+	struct xe_sysctrl_mailbox_app_msg_hdr header = {};
+	struct xe_sysctrl_mailbox_command command = {};
+	struct xe_sysctrl_event_request request;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	xe_sysctrl_event_request_prep(xe, &header, &request);
+
+	command.header = header;
+	command.data_in = &request;
+	command.data_in_len = sizeof(request);
+
+	xe_sysctrl_get_pending_event(xe, &command);
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
new file mode 100644
index 000000000000..9c5fb95c58f7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_SYSCTRL_EVENT_TYPES_H_
+#define _XE_SYSCTRL_EVENT_TYPES_H_
+
+#include <linux/types.h>
+
+#define XE_SYSCTRL_EVENT_DATA_LEN		68
+
+enum xe_sysctrl_event {
+	XE_SYSCTRL_EVENT_THRESHOLD_CROSSED	= 0x01,
+};
+
+/**
+ * struct xe_sysctrl_event_request - Request structure for pending event
+ */
+struct xe_sysctrl_event_request {
+	/** @vector: MSI-X vector that was triggered */
+	u32 vector;
+	/** @fn: Function index (0-7) of PCIe device */
+	u8 fn;
+	/** @reserved: Reserved for future use */
+	u16 reserved;
+	/** @reserved2: Reserved for future use */
+	u32 reserved2[2];
+} __packed;
+
+/**
+ * struct xe_sysctrl_event_response - Response structure for pending event
+ */
+struct xe_sysctrl_event_response {
+	/** @count: Number of pending events */
+	u32 count;
+	/** @event: Pending event */
+	enum xe_sysctrl_event event;
+	/** @timestamp: Timestamp of most recent event */
+	u64 timestamp;
+	/** @extended: Event has extended payload */
+	u8 extended:1;
+	/** @reserved: Reserved for future use */
+	u32 reserved:23;
+	/** @data: Generic event data */
+	u32 data[XE_SYSCTRL_EVENT_DATA_LEN];
+} __packed;
+
+#endif /* _XE_SYSCTRL_EVENT_TYPES_H_ */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
index 750b7528bab2..c6208a611c9e 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
@@ -27,6 +27,16 @@ struct xe_sysctrl_mailbox_command;
 #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
 	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
 
+/* Command groups */
+enum xe_sysctrl_group {
+	XE_SYSCTRL_GROUP_GFSP =			0x01,
+};
+
+/* Commands supported by GFSP group */
+enum xe_sysctrl_gfsp_cmd {
+	XE_SYSCTRL_CMD_GET_PENDING_EVENT =	0x07,
+};
+
 void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
 int xe_sysctrl_send_command(struct xe_device *xe,
 			    struct xe_sysctrl_mailbox_command *cmd,
-- 
2.43.0

