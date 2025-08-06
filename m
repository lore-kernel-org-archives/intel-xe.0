Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C349ECA0EC0
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 06:22:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A7410E3AE;
	Wed,  6 Aug 2025 06:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ICmNPN4U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D8110E2FE
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 06:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754461367; x=1785997367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DFKQSS/8ZTFE/ZKREsiNsI0KIPGwtALyWtcspixlYMk=;
 b=ICmNPN4UfVoBjS2eVFa/ect+5IZnISbMq/BJKmWu71tcCj2cA9caC9fH
 +jOexQ7f/fshx/XCTw3E4tdzNQUhIjFfIDSoCgaYWwgPMXgkKrp93RS6L
 w8+XX5AZ1R59dg3YVoSALJZpVEHOVTP7Uu1nn3HA8VPi8DBHUSjvr7EYy
 T/CiK3Supc5mzdlRbwgimG0elRs+x46jdDZTC8GaMfZYluqbGZpeL6W3r
 e1SXmNp4yXVNrLWJ6GqWhHFjDkkkSnrdnppq6gGRFPBQTxymoOidSpZGI
 Zv4GUUVAKAGUUBSVWalmfVTNPULrBn4gVlmTNUoebuWHk5AT84rxCWiqo w==;
X-CSE-ConnectionGUID: 3OfVOFMARs2s0q/W7tRHfw==
X-CSE-MsgGUID: 9sR/pjp/R6eMjFDNrjJnYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="79316930"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="79316930"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:22:47 -0700
X-CSE-ConnectionGUID: leQhnFMDRpaixqAvthBSsg==
X-CSE-MsgGUID: 42k8kmkQQJaEyqkMPbfG5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="201868936"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:22:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, michal.mrozek@intel.com
Subject: [PATCH 01/11] drm/xe: Stub out new pagefault layer
Date: Tue,  5 Aug 2025 23:22:32 -0700
Message-Id: <20250806062242.1090416-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806062242.1090416-1-matthew.brost@intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_pagefault.c       |  63 ++++++++++++
 drivers/gpu/drm/xe/xe_pagefault.h       |  19 ++++
 drivers/gpu/drm/xe/xe_pagefault_types.h | 125 ++++++++++++++++++++++++
 4 files changed, 208 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_pagefault.c
 create mode 100644 drivers/gpu/drm/xe/xe_pagefault.h
 create mode 100644 drivers/gpu/drm/xe/xe_pagefault_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 8e0c3412a757..6fbebafe79c9 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -93,6 +93,7 @@ xe-y += xe_bb.o \
 	xe_nvm.o \
 	xe_oa.o \
 	xe_observation.o \
+	xe_pagefault.o \
 	xe_pat.o \
 	xe_pci.o \
 	xe_pcode.o \
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
new file mode 100644
index 000000000000..3ce0e8d74b9d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -0,0 +1,63 @@
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
index 000000000000..fcff84f93dd8
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -0,0 +1,125 @@
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
+struct xe_pagefault;
+struct xe_gt;
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
+	XE_PAGEFAULT_TYPE_NOT_PRESENT		= 0,
+	/** @XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION: Write access violation */
+	XE_PAGEFAULT_WRITE_ACCESS_VIOLATION	= 1,
+	/** @XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION: Atomic access violation */
+	XE_PAGEFAULT_ATOMIC_ACCESS_VIOLATION	= 2,
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
+ * Carefully sized to be 64 bytes.
+ */
+struct xe_pagefault {
+	/**
+	 * @gt: GT of fault
+	 *
+	 * XXX: We may want to decouple the GT from individual faults, as it's
+	 * unclear whether future platforms will always have a GT for all page
+	 * fault producers. Internally, the GT is used for stats, identifying
+	 * the appropriate VRAM region, and locating the migration queue.
+	 * Leaving this as-is for now, but we can revisit later to see if we
+	 * can convert it to use the Xe device pointer instead.
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
+		/** @consumer.access_type: access type */
+		u8 access_type;
+		/** @consumer.fault_type: fault type */
+		u8 fault_type;
+#define XE_PAGEFAULT_LEVEL_NACK		0xff	/* Producer indicates nack fault */
+		/** @consumer.fault_level: fault level */
+		u8 fault_level;
+		/** @consumer.engine_class: engine class */
+		u8 engine_class;
+		/** consumer.reserved: reserved bits for future expansion */
+		u64 reserved;
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
+		 * producer.msg: page fault message, used by producer in fault
+		 * acknowledgement to formulate response to HW/FW interface.
+		 */
+		u32 msg[XE_PAGEFAULT_PRODUCER_MSG_LEN_DW];
+	} producer;
+};
+
+/** struct xe_pagefault_queue: Xe pagefault queue (consumer) */
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

