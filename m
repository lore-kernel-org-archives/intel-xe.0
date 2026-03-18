Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85078FCD0C1
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 07:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B6310E6A4;
	Wed, 18 Mar 2026 07:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VnKWPQfu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D755010E2EB
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 07:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773817814; x=1805353814;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zMlxgp1G61fKnKApki29BsFKL8G8vWpDbXfrX+urGP8=;
 b=VnKWPQfu3okIXSGAx5K0t1ABk4nRSPXFBS2KBTIQ4jUCXnnkxP3/5b9y
 Yj7rCHwG+WVWh4a8fbe27xRkZoMSVovbcR+mMH7ek/mp94dstOgdNfpk1
 jkBh4fFhQMtqaqUaX4miTxHWmn+NQNXIL1XP0h+7D2beS6AyGK6laJt/H
 lCrR40X3452kyV2hxegRnaOCcp9zuHTX+X6z3WMS2jGgMHB5bc0+ynI0N
 j94sJgG8D6MNUEs8xZ7rAXuITFeFh0dDNcesEoge6u4BaUAS/3N2xwqGk
 WSUfn7eq0AsSRw1fLFIEHuOgY5WjhGQdjGLYY/iOvYqoXgo4d1KVwjof4 w==;
X-CSE-ConnectionGUID: C8NACjwNSo+42F3Jgfcn2Q==
X-CSE-MsgGUID: d+V2/RhiQeCr7TTMDGp6dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78764249"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="78764249"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 00:10:13 -0700
X-CSE-ConnectionGUID: 11W0Q1kUQeK6SbOEaSkFBA==
X-CSE-MsgGUID: KZee2c8gRUOwIb6vkRBI+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="260423989"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 00:10:11 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 stuart.summers@intel.com, arvind.yadav@intel.com, tejas.upadhyay@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 03/15] drm/xe: Stub out new access_counter layer
Date: Wed, 18 Mar 2026 13:14:44 +0530
Message-Id: <20260318074456.2839499-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
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

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/Makefile                  |   3 +-
 drivers/gpu/drm/xe/xe_access_counter.c       |  55 +++++++++
 drivers/gpu/drm/xe/xe_access_counter.h       |  17 +++
 drivers/gpu/drm/xe/xe_access_counter_types.h | 123 +++++++++++++++++++
 4 files changed, 197 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_access_counter.c
 create mode 100644 drivers/gpu/drm/xe/xe_access_counter.h
 create mode 100644 drivers/gpu/drm/xe/xe_access_counter_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3a3f9f22d42a..92d8d6e4a447 100644
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
index 000000000000..74b903b9461b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_access_counter_types.h
@@ -0,0 +1,123 @@
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
+
+struct xe_gt;
+struct xe_access_counter;
+
+/** enum xe_access_counter_type - Xe access counter type */
+enum xe_access_counter_type {
+	/** @XE_ACCESS_COUNTER_TYPE_TRIGGER */
+	XE_ACCESS_COUNTER_TYPE_TRIGGER		= 0,
+	/** @XE_ACCESS_COUNTER_TYPE_NOTIFY*/
+	XE_ACCESS_COUNTER_TYPE_NOTIFY	= 1,
+};
+
+/** enum xe_access_counter_granularity - Xe access counter granularity */
+enum xe_access_counter_granularity {
+	/** @XE_ACCESS_COUNTER_GRANULARITY_128K: 128K granularity */
+	XE_ACCESS_COUNTER_GRANULARITY_128K	= 0,
+	/** @XE_ACCESS_COUNTER_GRANULARITY_2M: 2M granularity */
+	XE_ACCESS_COUNTER_GRANULARITY_2M	= 1,
+	/** @XE_ACCESS_COUNTER_GRANULARITY_16M: 16M granularity */
+	XE_ACCESS_COUNTER_GRANULARITY_16M	= 2,
+	/** @XE_ACCESS_COUNTER_GRANULARITY_64M: 64M granularity */
+	XE_ACCESS_COUNTER_GRANULARITY_64M	= 3,
+};
+
+static inline int xe_access_counter_granularity_in_byte(int val)
+{
+	switch (val) {
+	case XE_ACCESS_COUNTER_GRANULARITY_128K:
+		return SZ_128K;
+	case XE_ACCESS_COUNTER_GRANULARITY_2M:
+		return SZ_2M;
+	case XE_ACCESS_COUNTER_GRANULARITY_16M:
+		return SZ_16M;
+	case XE_ACCESS_COUNTER_GRANULARITY_64M:
+		return SZ_64M;
+	default:
+		return 0;
+	}
+}
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
+		/** @consumer.va_range_base: base virtual address of range */
+		u64 va_range_base;
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
+		/** @consumer: Platform-specific fields */
+		union {
+			/** @consumer.xe3: Xe3-specific fields */
+			struct {
+				/** @consumer.xe3.asid: address space ID */
+				u32 asid;
+				/** @consumer.xe3.engine_class: engine class */
+				u8 engine_class;
+				/** @consumer.xe3.engine_instance: engine instance */
+				u8 engine_instance;
+				/** @consumer.xe3.vfid: VFID */
+				u8 vfid;
+				/** @consumer.xe3.reserved: reserved bits */
+				u8 reserved;
+			} xe3;
+		};
+	} consumer;
+	/**
+	 * @producer: State for the producer (i.e., HW/FW interface). Populated
+	 * by the producer and should not be modified—or even inspected—by the
+	 * consumer, except for calling operations.
+	 */
+	struct {
+		/** @producer.private: private pointer */
+		void *private;
+#define XE_ACCESS_COUNTER_PRODUCER_MSG_LEN_DW	4
+		/**
+		 * @producer.msg: access counter message, used by producer in
+		 * acknowledgment to formulate response to HW/FW interface.
+		 * Included in the access counter message because the producer
+		 * typically receives the notification in a context where memory
+		 * cannot be allocated (e.g., atomic context or the reclaim path).
+		 */
+		u32 msg[XE_ACCESS_COUNTER_PRODUCER_MSG_LEN_DW];
+	} producer;
+};
+
+#endif
-- 
2.34.1

