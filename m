Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED855CCF9F3
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 03:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F228910E578;
	Tue, 28 Oct 2025 03:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YGHnImL4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27CC10E1E1
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 03:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761623929; x=1793159929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZyudO7m1qULRrNQKzo/yY20yf58kmKE+F2M3LKLUx7s=;
 b=YGHnImL42P2RoTdMBI61AgPaVvWkKm4UYISiKf5RtINRTPrMjkrE1Q62
 fW2w/y3j71PqTzcNBCeTlNcVy+IwvJNZ/FJVM+Ro9PUoyerKc2bOzpaX+
 mH9BDyjH3VH5RUNDmr1JoU+yeQTw8I1jtnQ8sNmj7WFQIKqau95R+e3BC
 Gv7xmo/wAW6fjIHI8vKIBel/0cvzu3SNuXBTdbGtmKmNaVQpjWuDrl9jt
 4dG0taEEgZ7A00W6DTUwRePoOR/zHwTVcZnp/ZPDsW/Nomr1biVs6jYBK
 SZ0pb79f1vspFQLx8e+X1XR9MrXtOzlvqSQRTsOJaSbnqAJGWq/Uh4XkS A==;
X-CSE-ConnectionGUID: OKshL9okT2WLd4XWRJTupg==
X-CSE-MsgGUID: G+Y7WMWdTqmwiYom6T/nSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67550951"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67550951"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 20:58:47 -0700
X-CSE-ConnectionGUID: Xub4k/DhQSmz0Z3jK2FBVw==
X-CSE-MsgGUID: HpCj+57TRKylTxsgO8jNIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="184461063"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 20:58:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com,
	francois.dugast@intel.com
Subject: [PATCH v3 1/7] drm/xe: Stub out new pagefault layer
Date: Mon, 27 Oct 2025 20:58:37 -0700
Message-Id: <20251028035843.2488613-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251028035843.2488613-1-matthew.brost@intel.com>
References: <20251028035843.2488613-1-matthew.brost@intel.com>
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

Stub out the new page fault layer and add kernel documentation. This is
intended as a replacement for the GT page fault layer, enabling multiple
producers to hook into a shared page fault consumer interface.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Makefile             |   1 +
 drivers/gpu/drm/xe/xe_pagefault.c       |  65 +++++++++++
 drivers/gpu/drm/xe/xe_pagefault.h       |  19 ++++
 drivers/gpu/drm/xe/xe_pagefault_types.h | 136 ++++++++++++++++++++++++
 4 files changed, 221 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_pagefault.c
 create mode 100644 drivers/gpu/drm/xe/xe_pagefault.h
 create mode 100644 drivers/gpu/drm/xe/xe_pagefault_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 82c6b3d29676..b35021e5b9eb 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -94,6 +94,7 @@ xe-y += xe_bb.o \
 	xe_nvm.o \
 	xe_oa.o \
 	xe_observation.o \
+	xe_pagefault.o \
 	xe_pat.o \
 	xe_pci.o \
 	xe_pcode.o \
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
new file mode 100644
index 000000000000..d509a80cb1f3
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_pagefault.h"
+#include "xe_pagefault_types.h"
+
+/**
+ * DOC: Xe page faults
+ *
+ * Xe page faults are handled in two layers. The producer layer interacts with
+ * hardware or firmware to receive and parse faults into struct xe_pagefault,
+ * then forwards them to the consumer. The consumer layer services the faults
+ * (e.g., memory migration, page table updates) and acknowledges the result back
+ * to the producer, which then forwards the results to the hardware or firmware.
+ * The consumer uses a page fault queue sized to absorb all potential faults and
+ * a multi-threaded worker to process them. Multiple producers are supported,
+ * with a single shared consumer.
+ *
+ * xe_pagefault.c implements the consumer layer.
+ */
+
+/**
+ * xe_pagefault_init() - Page fault init
+ * @xe: xe device instance
+ *
+ * Initialize Xe page fault state. Must be done after reading fuses.
+ *
+ * Return: 0 on Success, errno on failure
+ */
+int xe_pagefault_init(struct xe_device *xe)
+{
+	/* TODO - implement */
+	return 0;
+}
+
+/**
+ * xe_pagefault_reset() - Page fault reset for a GT
+ * @xe: xe device instance
+ * @gt: GT being reset
+ *
+ * Reset the Xe page fault state for a GT; that is, squash any pending faults on
+ * the GT.
+ */
+void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
+{
+	/* TODO - implement */
+}
+
+/**
+ * xe_pagefault_handler() - Page fault handler
+ * @xe: xe device instance
+ * @pf: Page fault
+ *
+ * Sink the page fault to a queue (i.e., a memory buffer) and queue a worker to
+ * service it. Safe to be called from IRQ or process context. Reclaim safe.
+ *
+ * Return: 0 on success, errno on failure
+ */
+int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
+{
+	/* TODO - implement */
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_pagefault.h b/drivers/gpu/drm/xe/xe_pagefault.h
new file mode 100644
index 000000000000..bd0cdf9ed37f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pagefault.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_PAGEFAULT_H_
+#define _XE_PAGEFAULT_H_
+
+struct xe_device;
+struct xe_gt;
+struct xe_pagefault;
+
+int xe_pagefault_init(struct xe_device *xe);
+
+void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt);
+
+int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
new file mode 100644
index 000000000000..d3b516407d60
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -0,0 +1,136 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_PAGEFAULT_TYPES_H_
+#define _XE_PAGEFAULT_TYPES_H_
+
+#include <linux/workqueue.h>
+
+struct xe_gt;
+struct xe_pagefault;
+
+/** enum xe_pagefault_access_type - Xe page fault access type */
+enum xe_pagefault_access_type {
+	/** @XE_PAGEFAULT_ACCESS_TYPE_READ: Read access type */
+	XE_PAGEFAULT_ACCESS_TYPE_READ	= 0,
+	/** @XE_PAGEFAULT_ACCESS_TYPE_WRITE: Write access type */
+	XE_PAGEFAULT_ACCESS_TYPE_WRITE	= 1,
+	/** @XE_PAGEFAULT_ACCESS_TYPE_ATOMIC: Atomic access type */
+	XE_PAGEFAULT_ACCESS_TYPE_ATOMIC	= 2,
+};
+
+/** enum xe_pagefault_type - Xe page fault type */
+enum xe_pagefault_type {
+	/** @XE_PAGEFAULT_TYPE_NOT_PRESENT: Not present */
+	XE_PAGEFAULT_TYPE_NOT_PRESENT			= 0,
+	/** @XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION: Write access violation */
+	XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION	= 1,
+	/** @XE_PAGEFAULT_TYPE_ATOMIC_ACCESS_VIOLATION: Atomic access violation */
+	XE_PAGEFAULT_TYPE_ATOMIC_ACCESS_VIOLATION	= 2,
+};
+
+/** struct xe_pagefault_ops - Xe pagefault ops (producer) */
+struct xe_pagefault_ops {
+	/**
+	 * @ack_fault: Ack fault
+	 * @pf: Page fault
+	 * @err: Error state of fault
+	 *
+	 * Page fault producer receives acknowledgment from the consumer and
+	 * sends the result to the HW/FW interface.
+	 */
+	void (*ack_fault)(struct xe_pagefault *pf, int err);
+};
+
+/**
+ * struct xe_pagefault - Xe page fault
+ *
+ * Generic page fault structure for communication between producer and consumer.
+ * Carefully sized to be 64 bytes. Upon a device page fault, the producer
+ * populates this structure, and the consumer copies it into the page-fault
+ * queue for deferred handling.
+ */
+struct xe_pagefault {
+	/**
+	 * @gt: GT of fault
+	 */
+	struct xe_gt *gt;
+	/**
+	 * @consumer: State for the software handling the fault. Populated by
+	 * the producer and may be modified by the consumer to communicate
+	 * information back to the producer upon fault acknowledgment.
+	 */
+	struct {
+		/** @consumer.page_addr: address of page fault */
+		u64 page_addr;
+		/** @consumer.asid: address space ID */
+		u32 asid;
+		/**
+		 * @consumer.access_type: access type, u8 rather than enum to
+		 * keep size compact
+		 */
+		u8 access_type;
+		/**
+		 * @consumer.fault_type: fault type, u8 rather than enum to
+		 * keep size compact
+		 */
+		u8 fault_type;
+#define XE_PAGEFAULT_LEVEL_NACK		0xff	/* Producer indicates nack fault */
+		/** @consumer.fault_level: fault level */
+		u8 fault_level;
+		/** @consumer.engine_class: engine class */
+		u8 engine_class;
+		/** @consumer.engine_instance: engine instance */
+		u8 engine_instance;
+		/** consumer.reserved: reserved bits for future expansion */
+		u8 reserved[7];
+	} consumer;
+	/**
+	 * @producer: State for the producer (i.e., HW/FW interface). Populated
+	 * by the producer and should not be modified—or even inspected—by the
+	 * consumer, except for calling operations.
+	 */
+	struct {
+		/** @producer.private: private pointer */
+		void *private;
+		/** @producer.ops: operations */
+		const struct xe_pagefault_ops *ops;
+#define XE_PAGEFAULT_PRODUCER_MSG_LEN_DW	4
+		/**
+		 * @producer.msg: page fault message, used by producer in fault
+		 * acknowledgment to formulate response to HW/FW interface.
+		 * Included in the page-fault message because the producer
+		 * typically receives the fault in a context where memory cannot
+		 * be allocated (e.g., atomic context or the reclaim path).
+		 */
+		u32 msg[XE_PAGEFAULT_PRODUCER_MSG_LEN_DW];
+	} producer;
+};
+
+/**
+ * struct xe_pagefault_queue: Xe pagefault queue (consumer)
+ *
+ * Used to capture all device page faults for deferred processing. Size this
+ * queue to absorb the device’s worst-case number of outstanding faults.
+ */
+struct xe_pagefault_queue {
+	/**
+	 * @data: Data in queue containing struct xe_pagefault, protected by
+	 * @lock
+	 */
+	void *data;
+	/** @size: Size of queue in bytes */
+	u32 size;
+	/** @head: Head pointer in bytes, moved by producer, protected by @lock */
+	u32 head;
+	/** @tail: Tail pointer in bytes, moved by consumer, protected by @lock */
+	u32 tail;
+	/** @lock: protects page fault queue */
+	spinlock_t lock;
+	/** @worker: to process page faults */
+	struct work_struct worker;
+};
+
+#endif
-- 
2.34.1

