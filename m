Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DE4FF886F
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 05:51:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F2E10E2F4;
	Tue, 28 Apr 2026 05:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzvHCCdD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5408210E2F4
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 05:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777355490; x=1808891490;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zYL/r88sz10A7t6Sw2oLA9zryU4T5IbFUQZnP+qGzrk=;
 b=bzvHCCdDkwE5CCIVODkSs96BAJZUefJeYoLTDFphQxA1xB0bZ8rZfXHt
 2017riD3RyfUbkx9lKEtkpnelWFK7XMrYmGOyyWhXjgS81xTliL+ZlNyD
 MzCA/t6h0YPMo46hkRNVpR+GrdUeRrR8+eM6mT0Uzm9vcVg/NQ/zHfxpt
 5lV7xJtSq8a/bQVwSLPCzOqEWSR8usUb1XR/kLfa/GheGj4/XfGH6NTsp
 cQyzTsCMTodET5JWq+V8g99KY49gDzM5anF7GC2ZYzlrSHKwbxwgoMNCd
 hndTum2GmyTMdnIBdctCZorUfO9rSPnz/MWZEYjYfxDIVC9vu/+TQHRbv w==;
X-CSE-ConnectionGUID: BJksNDNaS1i1TrmAWh5wrA==
X-CSE-MsgGUID: UA6T3snhS6CcrghYRHX9fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="82119232"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="82119232"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 22:51:30 -0700
X-CSE-ConnectionGUID: efzZnwy0S7u1uP7ETPWkrQ==
X-CSE-MsgGUID: Rjh07hiAQuKZnOdS7eWQbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="271978592"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 27 Apr 2026 22:51:26 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com,
 aravind.iddamsetty@linux.intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 2/3] drm/xe/sysctrl: Add system controller event support
Date: Tue, 28 Apr 2026 11:18:25 +0530
Message-ID: <20260428054826.1202076-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428054826.1202076-1-raag.jadav@intel.com>
References: <20260428054826.1202076-1-raag.jadav@intel.com>
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
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: Handle unexpected response length (Mallesh)
v3: Handle event flood (Mallesh)
v6: Drop xe prefix from static functions (Riana)
    Don't fail on unexpected event (Riana)
    Move sysctrl commands to xe_sysctrl_mailbox_types.h (Riana)
    Add kernel doc (Riana)
v7: Use consistent error logs (Riana)
    s/reserved2/reserved1 (Riana)
    Update event count kdoc (Riana)
---
 drivers/gpu/drm/xe/Makefile                   |  1 +
 drivers/gpu/drm/xe/xe_sysctrl.c               | 10 +++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
 drivers/gpu/drm/xe/xe_sysctrl_event.c         | 87 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_event_types.h   | 57 ++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 18 ++++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  3 +
 7 files changed, 177 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3fceda259834..1c863b711ae9 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -126,6 +126,7 @@ xe-y += xe_bb.o \
 	xe_survivability_mode.o \
 	xe_sync.o \
 	xe_sysctrl.o \
+	xe_sysctrl_event.o \
 	xe_sysctrl_mailbox.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index 7de3e73bd8e0..1db20be8158b 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -12,6 +12,7 @@
 #include "regs/xe_sysctrl_regs.h"
 #include "xe_device.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
 #include "xe_soc_remapper.h"
 #include "xe_sysctrl.h"
 #include "xe_sysctrl_mailbox.h"
@@ -39,6 +40,11 @@ static void sysctrl_fini(void *arg)
 
 static void xe_sysctrl_work(struct work_struct *work)
 {
+	struct xe_sysctrl *sc = container_of(work, struct xe_sysctrl, work);
+	struct xe_device *xe = sc_to_xe(sc);
+
+	guard(xe_pm_runtime)(xe);
+	xe_sysctrl_event(sc);
 }
 
 /**
@@ -74,6 +80,10 @@ int xe_sysctrl_init(struct xe_device *xe)
 	if (ret)
 		return ret;
 
+	ret = devm_mutex_init(xe->drm.dev, &sc->event_lock);
+	if (ret)
+		return ret;
+
 	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
 	xe_sysctrl_mailbox_init(sc);
 	INIT_WORK(&sc->work, xe_sysctrl_work);
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
index f7469bfc9324..090dffb6d55f 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
@@ -16,6 +16,7 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
 	return container_of(sc, struct xe_device, sc);
 }
 
+void xe_sysctrl_event(struct xe_sysctrl *sc);
 int xe_sysctrl_init(struct xe_device *xe);
 void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
 void xe_sysctrl_pm_resume(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
new file mode 100644
index 000000000000..5a5721699ce3
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "xe_device.h"
+#include "xe_irq.h"
+#include "xe_printk.h"
+#include "xe_sysctrl.h"
+#include "xe_sysctrl_event_types.h"
+#include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_mailbox_types.h"
+
+static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_command *command)
+{
+	struct xe_sysctrl_event_response *response = command->data_out;
+	struct xe_device *xe = sc_to_xe(sc);
+	u32 count = XE_SYSCTRL_EVENT_FLOOD;
+	size_t len;
+	int ret;
+
+	do {
+		memset(response, 0, sizeof(*response));
+
+		ret = xe_sysctrl_send_command(sc, command, &len);
+		if (ret) {
+			xe_err(xe, "sysctrl: failed to get pending event %d\n", ret);
+			return;
+		}
+
+		if (len != sizeof(*response)) {
+			xe_err(xe, "sysctrl: unexpected event response length %zu (expected %zu)\n",
+			       len, sizeof(*response));
+			return;
+		}
+
+		if (response->event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED)
+			xe_warn(xe, "[RAS]: counter threshold crossed\n");
+		else
+			xe_warn(xe, "sysctrl: unexpected event %#x\n", response->event);
+
+		if (!--count) {
+			xe_err(xe, "sysctrl: event flooding\n");
+			return;
+		}
+
+		xe_dbg(xe, "sysctrl: %u events pending\n", response->count);
+	} while (response->count);
+}
+
+static void event_request_prepare(struct xe_device *xe, struct xe_sysctrl_app_msg_hdr *header,
+				  struct xe_sysctrl_event_request *request)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+
+	header->data = REG_FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
+		       REG_FIELD_PREP(APP_HDR_COMMAND_MASK, XE_SYSCTRL_CMD_GET_PENDING_EVENT);
+
+	request->vector = xe_device_has_msix(xe) ? XE_IRQ_DEFAULT_MSIX : 0;
+	request->fn = PCI_FUNC(pdev->devfn);
+}
+
+/**
+ * xe_sysctrl_event() - Handler for System Controller events
+ * @sc: System Controller instance
+ *
+ * Handle events generated by System Controller.
+ */
+void xe_sysctrl_event(struct xe_sysctrl *sc)
+{
+	struct xe_sysctrl_mailbox_command command = {};
+	struct xe_sysctrl_event_response response = {};
+	struct xe_sysctrl_event_request request = {};
+	struct xe_sysctrl_app_msg_hdr header = {};
+
+	xe_device_assert_mem_access(sc_to_xe(sc));
+	event_request_prepare(sc_to_xe(sc), &header, &request);
+
+	command.header = header;
+	command.data_in = &request;
+	command.data_in_len = sizeof(request);
+	command.data_out = &response;
+	command.data_out_len = sizeof(response);
+
+	guard(mutex)(&sc->event_lock);
+	get_pending_event(sc, &command);
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
new file mode 100644
index 000000000000..c16c66b9fa7f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
@@ -0,0 +1,57 @@
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
+#define XE_SYSCTRL_EVENT_DATA_LEN		59
+
+/* Modify as needed */
+#define XE_SYSCTRL_EVENT_FLOOD			16
+
+/**
+ * enum xe_sysctrl_event - Events reported by System Controller
+ *
+ * @XE_SYSCTRL_EVENT_THRESHOLD_CROSSED: Error counter threshold crossed
+ */
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
+	u32 fn:8;
+	/** @reserved: Reserved for future use */
+	u32 reserved:24;
+	/** @reserved1: Reserved for future use */
+	u32 reserved1[2];
+} __packed;
+
+/**
+ * struct xe_sysctrl_event_response - Response structure for pending event
+ */
+struct xe_sysctrl_event_response {
+	/** @count: Pending event count after this response */
+	u32 count;
+	/** @event: Pending event type */
+	u32 event;
+	/** @timestamp: Timestamp of most recent event */
+	u64 timestamp;
+	/** @extended: Event has extended payload */
+	u32 extended:1;
+	/** @reserved: Reserved for future use */
+	u32 reserved:31;
+	/** @data: Generic event data */
+	u32 data[XE_SYSCTRL_EVENT_DATA_LEN];
+} __packed;
+
+#endif /* _XE_SYSCTRL_EVENT_TYPES_H_ */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 89456aec6097..84d7c647e743 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -10,6 +10,24 @@
 
 #include "abi/xe_sysctrl_abi.h"
 
+/**
+ * enum xe_sysctrl_group - System Controller command groups
+ *
+ * @XE_SYSCTRL_GROUP_GFSP: GFSP group
+ */
+enum xe_sysctrl_group {
+	XE_SYSCTRL_GROUP_GFSP			= 0x01,
+};
+
+/**
+ * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
+ *
+ * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
+ */
+enum xe_sysctrl_gfsp_cmd {
+	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
+};
+
 /**
  * struct xe_sysctrl_mailbox_command - System Controller mailbox command
  */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
index 5f408d6491ef..66ba24f43017 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -31,6 +31,9 @@ struct xe_sysctrl {
 
 	/** @work: Pending events worker */
 	struct work_struct work;
+
+	/** @event_lock: Mutex protecting pending events */
+	struct mutex event_lock;
 };
 
 #endif
-- 
2.43.0

