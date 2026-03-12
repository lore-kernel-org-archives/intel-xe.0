Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF473FED2F6
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 09:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A4710E352;
	Thu, 12 Mar 2026 09:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IAQW8Fvi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B05110E9C6
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 09:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773306589; x=1804842589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=swiYHFoWtJ8+fh4XuTBnbr0S30OZ2LN23hg29snBsho=;
 b=IAQW8FvilOEdLEXKCoDxbEbU1ZTwr2KYYQFpr4rBB1LDJB8f2i5XWcJ6
 Qm36Nst3qPXmppmpG2f2kp9WIL7pJJNnwrfaKe+bUEdrQQUJlfjFUjfI9
 UH4bDihUHjDEvZDf5/ed2kSlwLhpWlvSQ4tYlWtzvnM+6XFDcjTL8hOIy
 Jsh6oRMCbiaU8soGB45Xp360QIRxRilpuCkVO+zKKD34SAgwosnvQkE/0
 UzOIXeMNPgWiHIdNAfOlQvFjwvRHAaXkgcI2TRdYR3aAjNtqQ/l8yZTZf
 nmBEtq/GKcteQkKxjujJAqST9L9chwWl3YxtcnzTdsuMqq9pKX2IN+N8f Q==;
X-CSE-ConnectionGUID: ZYAyoPNcR4GJXeQoVIp4eA==
X-CSE-MsgGUID: d/YwycpgTpWNRyWbNUZq0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="77994760"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="77994760"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 02:09:49 -0700
X-CSE-ConnectionGUID: PL0cxgnFTmKRF02bGhdCIw==
X-CSE-MsgGUID: BH020lUOS/6sSaMJpJFy2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="220815122"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 12 Mar 2026 02:09:46 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com,
 aravind.iddamsetty@linux.intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 3/4] drm/xe/sysctrl: Add system controller event support
Date: Thu, 12 Mar 2026 14:36:56 +0530
Message-ID: <20260312090657.4026013-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312090657.4026013-1-raag.jadav@intel.com>
References: <20260312090657.4026013-1-raag.jadav@intel.com>
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
v2: Handle unexpected response length (Mallesh)
v3: Handle event flood (Mallesh)
---
 drivers/gpu/drm/xe/Makefile                 |  1 +
 drivers/gpu/drm/xe/xe_sysctrl.c             |  4 +
 drivers/gpu/drm/xe/xe_sysctrl.h             |  1 +
 drivers/gpu/drm/xe/xe_sysctrl_event.c       | 82 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_event_types.h | 52 +++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h     | 10 +++
 6 files changed, 150 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 543eb0b2430b..373adb20afb2 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -125,6 +125,7 @@ xe-y += xe_bb.o \
 	xe_survivability_mode.o \
 	xe_sync.o \
 	xe_sysctrl.o \
+	xe_sysctrl_event.o \
 	xe_sysctrl_mailbox.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index 30349df1c04b..63b9aaf98669 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -42,6 +42,10 @@ static void sysctrl_fini(void *arg)
 
 static void xe_sysctrl_work(struct work_struct *work)
 {
+	struct xe_sysctrl *sc = container_of(work, struct xe_sysctrl, work);
+
+	guard(mutex)(&sc->work_lock);
+	xe_sysctrl_event(sc);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
index ff60d42b52a7..0821ea44893d 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
@@ -18,5 +18,6 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
 
 int xe_sysctrl_init(struct xe_device *xe);
 void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
+void xe_sysctrl_event(struct xe_sysctrl *sc);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
new file mode 100644
index 000000000000..47afca586bd1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
@@ -0,0 +1,82 @@
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
+static void xe_sysctrl_get_pending_event(struct xe_sysctrl *sc,
+					 struct xe_sysctrl_mailbox_command *command)
+{
+	struct xe_sysctrl_event_response response;
+	struct xe_device *xe = sc_to_xe(sc);
+	u32 count = 0;
+	size_t len;
+	int ret;
+
+	command->data_out = &response;
+	command->data_out_len = sizeof(response);
+
+	do {
+		memset(&response, 0, sizeof(response));
+
+		ret = xe_sysctrl_send_command(sc, command, &len);
+		if (ret) {
+			xe_err(xe, "sysctrl: failed to get pending event %d\n", ret);
+			return;
+		}
+
+		if (len != sizeof(response)) {
+			xe_err(xe, "sysctrl: unexpected pending event response length %ld\n", len);
+			return;
+		}
+
+		if (response.event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED) {
+			xe_warn(xe, "[RAS]: error counter threshold crossed\n");
+		} else {
+			xe_err(xe, "sysctrl: unexpected event %#x\n", response.event);
+			return;
+		}
+
+		if (++count > XE_SYSCTRL_EVENT_FLOOD) {
+			xe_err(xe, "sysctrl: event flooding\n");
+			return;
+		}
+
+		xe_dbg(xe, "sysctrl: %u events pending\n", response.count);
+	} while (response.count);
+}
+
+static void xe_sysctrl_event_request_prep(struct xe_device *xe,
+					  struct xe_sysctrl_app_msg_hdr *header,
+					  struct xe_sysctrl_event_request *request)
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
+void xe_sysctrl_event(struct xe_sysctrl *sc)
+{
+	struct xe_sysctrl_mailbox_command command = {};
+	struct xe_sysctrl_event_request request = {};
+	struct xe_sysctrl_app_msg_hdr header = {};
+
+	xe_sysctrl_event_request_prep(sc_to_xe(sc), &header, &request);
+
+	command.header = header;
+	command.data_in = &request;
+	command.data_in_len = sizeof(request);
+
+	xe_sysctrl_get_pending_event(sc, &command);
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
new file mode 100644
index 000000000000..1430a7ee2b39
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
@@ -0,0 +1,52 @@
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
+enum xe_sysctrl_event {
+	XE_SYSCTRL_EVENT_THRESHOLD_CROSSED = 1,
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
+	u32 reserved:24;
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
+	u32 reserved:31;
+	/** @data: Generic event data */
+	u32 data[XE_SYSCTRL_EVENT_DATA_LEN];
+} __packed;
+
+#endif /* _XE_SYSCTRL_EVENT_TYPES_H_ */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
index 91460be9e22c..d59a825597d3 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
@@ -23,6 +23,16 @@ struct xe_sysctrl_mailbox_command;
 #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
 	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
 
+/* Command groups */
+enum xe_sysctrl_group {
+	XE_SYSCTRL_GROUP_GFSP			= 0x01,
+};
+
+/* Commands supported by GFSP group */
+enum xe_sysctrl_gfsp_cmd {
+	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
+};
+
 void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
 int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 			    struct xe_sysctrl_mailbox_command *cmd,
-- 
2.43.0

