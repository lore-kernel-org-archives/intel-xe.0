Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD9EC88E40
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:41:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA78310F109;
	Wed,  9 Sep 2026 12:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mvr2vOP4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1A910F0FE
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957713; x=1820493713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6MBqGihx1CAK0EAAJ24xX+8b57AFtRy3evaUGzjryGM=;
 b=Mvr2vOP4GItNgxIlRRuDGI7PPepgSP0VvNK161OcaOXIn8s/NkydkK+O
 ULZ27C2J4W/gBFslAIHCWeFvFAMqzDPzgPm7Iq7D1Na7GKKDIV+ZMarCI
 6uijIfMmFZi41ly9GvIg1fUpErN3Py8651l2zUHvt3yqC31G0Pl76zxDT
 3deKvSx69UYcId35hXdtYTXMQHOsSmkh9RUtX16xgrHUZAt/hLHX3xj/V
 Wrdb21XbkvAl+wYyfPcLgvpkOKjnp7Izw8iqpSS+JshBQfvyFjKoDIr/I
 FIm6TP/NwbfkDsYHx2U+lTErGCE384WqDDCn+wWcgyzQnETtXWEKyaH9w w==;
X-CSE-ConnectionGUID: mG/Ol80OQBCSP6XUVzayfA==
X-CSE-MsgGUID: AkeOxqbuTBeVKYLkwPCBAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715469"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715469"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:41:53 -0700
X-CSE-ConnectionGUID: J8LhVU9+TNqf+I2Kxk5+eA==
X-CSE-MsgGUID: cPZiXJMySJ23zdMQ0yUnrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246519"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:41:52 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 02/21] drm/xe: Stub out new access_counter layer
Date: Wed,  9 Sep 2026 18:14:56 +0530
Message-ID: <20260909124457.1610890-25-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
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

Add access counter infrastructure with type definitions, header files,
and stub implementation. This follows a two-layer producer-consumer
architecture similar to the pagefault layer.

v2
- Add Xe access counter work item
- Remove producer fields
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/Makefile                  |  3 +-
 drivers/gpu/drm/xe/xe_access_counter.c       | 55 ++++++++++++++
 drivers/gpu/drm/xe/xe_access_counter.h       | 17 +++++
 drivers/gpu/drm/xe/xe_access_counter_types.h | 79 ++++++++++++++++++++
 4 files changed, 153 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_access_counter.c
 create mode 100644 drivers/gpu/drm/xe/xe_access_counter.h
 create mode 100644 drivers/gpu/drm/xe/xe_access_counter_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index adc2de37e768..96a4f83c5d89 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -32,7 +32,8 @@ $(obj)/generated/%_device_wa_oob.c $(obj)/generated/%_device_wa_oob.h: $(obj)/xe
 
 # core driver code
 
-xe-y += xe_bb.o \
+xe-y += xe_access_counter.o \
+	xe_bb.o \
 	xe_bo.o \
 	xe_bo_evict.o \
 	xe_dep_scheduler.o \
diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
new file mode 100644
index 000000000000..f3a8a93b5135
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_access_counter.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/circ_buf.h>
+
+#include <drm/drm_exec.h>
+#include <drm/drm_managed.h>
+
+#include "xe_access_counter.h"
+#include "xe_access_counter_types.h"
+#include "xe_device.h"
+
+/**
+ * DOC: Xe access counters
+ *
+ * Xe access counters are handled in two layers with one-way communication.
+ * The producer layer interacts with hardware or firmware to receive and parse
+ * access counter notifications into struct xe_access_counter, then forwards them
+ * to the consumer. The consumer layer services the notifications (e.g., memory
+ * migration hints, binding decisions). No acknowledgment is sent back to the
+ * producer. The consumer uses an access counter queue sized to absorb all potential
+ * notifications and a multi-threaded worker to process them. Multiple producers
+ * are supported, with a single shared consumer.
+ *
+ * xe_access_counter.c implements the consumer layer.
+ */
+
+/**
+ * xe_access_counter_init - Initialize access counter consumer layer
+ * @xe: xe device
+ *
+ * Return: 0 on success, negative error code on error
+ */
+int xe_access_counter_init(struct xe_device *xe)
+{
+	/* Stub implementation - to be filled in */
+	return 0;
+}
+
+/**
+ * xe_access_counter_handler - Handle an access counter notification
+ * @xe: xe device
+ * @ac: access counter notification
+ *
+ * Process an access counter notification from the producer layer.
+ *
+ * Return: 0 on success, negative error code on error
+ */
+int xe_access_counter_handler(struct xe_device *xe, struct xe_access_counter *ac)
+{
+	/* Stub implementation - to be filled in */
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_access_counter.h b/drivers/gpu/drm/xe/xe_access_counter.h
new file mode 100644
index 000000000000..b3a331687f13
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_access_counter.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_ACCESS_COUNTER_H_
+#define _XE_ACCESS_COUNTER_H_
+
+struct xe_device;
+struct xe_gt;
+struct xe_access_counter;
+
+int xe_access_counter_init(struct xe_device *xe);
+
+int xe_access_counter_handler(struct xe_device *xe, struct xe_access_counter *ac);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_access_counter_types.h b/drivers/gpu/drm/xe/xe_access_counter_types.h
new file mode 100644
index 000000000000..343365776037
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_access_counter_types.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_ACCESS_COUNTER_TYPES_H_
+#define _XE_ACCESS_COUNTER_TYPES_H_
+
+#include <linux/sizes.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+struct xe_device;
+struct xe_gt;
+struct xe_access_counter;
+
+/**
+ * struct xe_access_counter - Xe access counter
+ *
+ * Generic access counter structure for communication between producer and consumer.
+ * Carefully sized to be 64 bytes. Upon a device access counter notification, the
+ * producer populates this structure, and the consumer copies it into the access
+ * counter queue for deferred handling.
+ */
+struct xe_access_counter {
+	/**
+	 * @gt: GT of access counter
+	 */
+	struct xe_gt *gt;
+	/**
+	 * @consumer: State for the software handling the access counter.
+	 * Populated by the producer and may be modified by the consumer to
+	 * communicate information back to the producer upon acknowledgment.
+	 */
+	struct {
+		/** @consumer.page_va: virtual address of page */
+		u64 page_va;
+		/** @consumer.sub_granularity: sub-granularity */
+		u32 sub_granularity;
+		/**
+		 * @consumer.counter_type: counter type, u8 rather than enum to
+		 * keep size compact
+		 */
+		u8 counter_type;
+		/**
+		 * @consumer.granularity: access granularity, u8 rather than enum
+		 * to keep size compact
+		 */
+		u8 granularity;
+		/** @consumer.reserved: reserved bits for alignment */
+		u8 reserved[2];
+		/** @consumer.asid: address space ID */
+		u32 asid;
+		/** @consumer.engine_class: engine class */
+		u8 engine_class;
+		/** @consumer.engine_instance: engine instance */
+		u8 engine_instance;
+		/** @consumer.vfid: VFID */
+		u8 vfid;
+		/** @consumer.reserved1: reserved bits */
+		u8 reserved1;
+	} consumer;
+};
+
+/**
+ * struct xe_ac_worker - Access counter worker context
+ *
+ * Each worker pulls entries from the shared access counter queue
+ * concurrently, eliminating head-of-queue blocking when one event
+ * takes a long time to process.
+ */
+struct xe_ac_worker {
+	/** @xe: back-pointer to xe_device */
+	struct xe_device *xe;
+	/** @work: work item scheduled on the USM workqueue */
+	struct work_struct work;
+};
+
+#endif
-- 
2.43.0

