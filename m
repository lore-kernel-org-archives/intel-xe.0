Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926D1E9907D
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 10:30:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C1010E934;
	Fri, 10 Apr 2026 10:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpEpc6+t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B1610E934
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Apr 2026 10:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775817058; x=1807353058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/sW/M/3ang/WIMnn26PTflqaDvWUUESAMAHS7ZpUCt0=;
 b=jpEpc6+tfbiCdiclDoVujGblz1iYl/ZilL+6m89XJej6rFj689YI2He+
 PYQJG8Abcrkc/oPC0CbBKOm9unS7uKN5KMNrCp2ZlUIWhoFGecIBCv1Hh
 j2EkdVK36hS10BdrTFHFFRxUEfjLyVGZ/ZF3OCaKxubCLaOEuaiy6+xLB
 JlRIWW0vEVSMcHQWdDTgwtAtMz3g6PNu79kBL9Nyc+TuK/4O/w45C581P
 UUX1bfF7Tb4IPsrD5RBmEQ9DSSpMbNF+j4k6rju4BJfDmiufvXe7eIwgf
 JGxoJGZ3cX4A13SkDu6B2GiOYx3DqlgtRzd85fIMrFNU1pszfESHmBgpk g==;
X-CSE-ConnectionGUID: B9qNbYERSW+gWvQfpCP42g==
X-CSE-MsgGUID: 58qIhGzrSvmy0gbjFvfQCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76724464"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="76724464"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 03:30:58 -0700
X-CSE-ConnectionGUID: PghSxfVtQcueWDZgr+6wmw==
X-CSE-MsgGUID: q5H/BIgIRbeBLqATfn7cNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="226331238"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 10 Apr 2026 03:30:55 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com,
 aravind.iddamsetty@linux.intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v6 2/3] drm/xe/sysctrl: Add system controller event support
Date: Fri, 10 Apr 2026 15:57:43 +0530
Message-ID: <20260410102744.427150-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410102744.427150-1-raag.jadav@intel.com>
References: <20260410102744.427150-1-raag.jadav@intel.com>
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
---
 drivers/gpu/drm/xe/Makefile                   |  1 +
 drivers/gpu/drm/xe/xe_sysctrl.c               | 11 +++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
 drivers/gpu/drm/xe/xe_sysctrl_event.c         | 84 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_event_types.h   | 57 +++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 18 ++++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  3 +
 7 files changed, 175 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 7f03f06df186..9e6689c86797 100644
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
index 72ce0822cc6d..8fd791047f0a 100644
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
@@ -39,6 +40,12 @@ static void sysctrl_fini(void *arg)
 
 static void xe_sysctrl_work(struct work_struct *work)
 {
+	struct xe_sysctrl *sc = container_of(work, struct xe_sysctrl, work);
+	struct xe_device *xe = sc_to_xe(sc);
+
+	guard(xe_pm_runtime)(xe);
+	guard(mutex)(&sc->work_lock);
+	xe_sysctrl_event(sc);
 }
 
 /**
@@ -74,6 +81,10 @@ int xe_sysctrl_init(struct xe_device *xe)
 	if (ret)
 		return ret;
 
+	ret = devm_mutex_init(xe->drm.dev, &sc->work_lock);
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
index 000000000000..3edde46a9711
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
@@ -0,0 +1,84 @@
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
+			xe_err(xe, "sysctrl: unexpected event response length %zu\n", len);
+			return;
+		}
+
+		if (response->event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED)
+			xe_warn(xe, "[RAS]: counter threshold crossed\n");
+		else
+			xe_err(xe, "sysctrl: unexpected event %#x\n", response->event);
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
+static void event_request_prep(struct xe_device *xe, struct xe_sysctrl_app_msg_hdr *header,
+			       struct xe_sysctrl_event_request *request)
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
+	event_request_prep(sc_to_xe(sc), &header, &request);
+
+	command.header = header;
+	command.data_in = &request;
+	command.data_in_len = sizeof(request);
+	command.data_out = &response;
+	command.data_out_len = sizeof(response);
+
+	get_pending_event(sc, &command);
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
new file mode 100644
index 000000000000..7066d7979f4a
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
+	/** @reserved2: Reserved for future use */
+	u32 reserved2[2];
+} __packed;
+
+/**
+ * struct xe_sysctrl_event_response - Response structure for pending event
+ */
+struct xe_sysctrl_event_response {
+	/** @count: Pending event count, decremented by fw on each response */
+	u32 count;
+	/** @event: Pending event */
+	enum xe_sysctrl_event event;
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
index 5f408d6491ef..95359af691c9 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -31,6 +31,9 @@ struct xe_sysctrl {
 
 	/** @work: Pending events worker */
 	struct work_struct work;
+
+	/** @work_lock: Mutex protecting pending events */
+	struct mutex work_lock;
 };
 
 #endif
-- 
2.43.0

