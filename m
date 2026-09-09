Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB45C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C19710F0F8;
	Wed,  9 Sep 2026 12:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCBKmQl0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80E410F0F7
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957712; x=1820493712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6d+Qg8ohn6hcfFvPV0FbEm4ccTRgRml8Ild0iCKBKCg=;
 b=iCBKmQl0gIfD5uo3hduACJ5IDcZp7XOt6aqcF1/As/+Qt5hgglu49Xe3
 sySB8vQim23ZkMlZi/dx/sw/WZa7T2xt+LN2BaFJIKoJusMMHzQIf4tgG
 nc9LevLxFxhmAPZrPDAmoBovN5+XT88OazqFleEHP79dOYwmZvbKFwIjW
 8eEklYH5SHg+QgysfQiUprBTG/oPMCmIIte3cHJTUPav8cAAJmPPYQVKu
 UOeXAkvceYqNGbC0DR79xD4XSIosPR/pxCY8+JC7d/RCiWYb7hXf7X/GF
 Tdy6FvRMq44WPPev7JP8WZLI7lYSgFTdhg5B7rJx+QpSbyFSpNCcQQ/Nf g==;
X-CSE-ConnectionGUID: McHP5lwrSMqqsJxC5k6JIA==
X-CSE-MsgGUID: HruDzN0IQSCg8O4Z2EvWUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715463"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715463"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:41:52 -0700
X-CSE-ConnectionGUID: y3OsMVPNTb2BsotbkTfbnA==
X-CSE-MsgGUID: CG2YUDsDRjCdvokLATlXGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246516"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:41:50 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 01/21] drm/xe: Add xe_usm_queue generic USM circular buffer
Date: Wed,  9 Sep 2026 18:14:55 +0530
Message-ID: <20260909124457.1610890-24-himal.prasad.ghimiray@intel.com>
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

Introduce struct xe_usm_queue, a generic lock-protected circular FIFO
used by USM consumers (page fault, access counter) to receive fixed-size
entries from IRQ context and process them via a work_struct.

The entry_size field stores the power-of-two stride once at init time,
so the three inline helpers avoid recomputing it on every invocation:
  xe_usm_queue_full()  - CIRC_SPACE check (caller holds lock)
  xe_usm_queue_pop()   - dequeue one entry (acquires lock internally)
  xe_usm_queue_push()  - enqueue one entry (caller holds lock)

v2
- Removed struct work_struct worker — the embedded worker is no longer
  part of the queue.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_usm_queue.h | 127 ++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_usm_queue.h

diff --git a/drivers/gpu/drm/xe/xe_usm_queue.h b/drivers/gpu/drm/xe/xe_usm_queue.h
new file mode 100644
index 000000000000..64f708a5f835
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_usm_queue.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_USM_QUEUE_H_
+#define _XE_USM_QUEUE_H_
+
+#include <linux/circ_buf.h>
+#include <linux/spinlock.h>
+#include <linux/workqueue.h>
+
+/**
+ * struct xe_usm_queue - Generic USM circular FIFO queue
+ *
+ * A lock-protected circular buffer used by the access counter
+ * consumer. Producers push fixed-size entries from IRQ context;
+ * workers process them asynchronously.
+ */
+struct xe_usm_queue {
+	/**
+	 * @data: Raw byte buffer backing the queue, protected by @lock
+	 */
+	void *data;
+	/** @size: Total size of @data in bytes */
+	u32 size;
+	/** @head: Write cursor in bytes, moved by producer, protected by @lock */
+	u32 head;
+	/** @tail: Read cursor in bytes, moved by consumer, protected by @lock */
+	u32 tail;
+	/**
+	 * @entry_size: Slot size in bytes (power of two); governs head/tail
+	 * arithmetic.  Always >= @data_size.
+	 */
+	u32 entry_size;
+	/**
+	 * @data_size: Actual number of bytes of live data per entry.
+	 * memcpy in push/pop uses this value so callers never need to
+	 * over-allocate their stack buffers to entry_size.
+	 */
+	u32 data_size;
+	/** @lock: Protects the queue head/tail */
+	spinlock_t lock;
+};
+
+/**
+ * xe_usm_queue_full - Check whether the queue has no room for one more entry
+ * @q: queue
+ *
+ * Must be called with @q->lock held.
+ *
+ * Return: true if the queue is full
+ */
+static inline bool xe_usm_queue_full(struct xe_usm_queue *q)
+{
+	lockdep_assert_held(&q->lock);
+
+	return CIRC_SPACE(q->head, q->tail, q->size) <= q->entry_size;
+}
+
+/**
+ * xe_usm_queue_pop - Pop one entry from the queue into @out
+ * @q: queue
+ * @out: destination buffer, must be at least @q->data_size bytes
+ *
+ * Copies exactly @q->data_size bytes into @out (the actual live data
+ * size), while advancing the tail by @q->entry_size (the padded slot
+ * size).  This prevents stack overflows when @entry_size > @data_size.
+ *
+ * Acquires @q->lock internally with spin_lock_irq().
+ *
+ * Return: true if an entry was dequeued, false if the queue was empty
+ */
+static inline bool xe_usm_queue_pop(struct xe_usm_queue *q, void *out)
+{
+	bool found = false;
+
+	spin_lock_irq(&q->lock);
+	if (q->tail != q->head) {
+		memcpy(out, q->data + q->tail, q->data_size);
+		q->tail = (q->tail + q->entry_size) % q->size;
+		found = true;
+	}
+	spin_unlock_irq(&q->lock);
+
+	return found;
+}
+
+/**
+ * xe_usm_queue_peek - Check whether the queue has at least one entry
+ * @q: queue
+ *
+ * Acquires @q->lock internally with spin_lock_irq().
+ *
+ * Return: true if the queue is non-empty
+ */
+static inline bool xe_usm_queue_peek(struct xe_usm_queue *q)
+{
+	bool found;
+
+	spin_lock_irq(&q->lock);
+	found = q->tail != q->head;
+	spin_unlock_irq(&q->lock);
+
+	return found;
+}
+
+/**
+ * xe_usm_queue_push - Push one entry into the queue
+ * @q: queue
+ * @in: source buffer, must be at least @q->data_size bytes
+ *
+ * Copies exactly @q->data_size bytes from @in into the next slot
+ * (which is @q->entry_size bytes wide; any padding bytes are left
+ * uninitialised and are never read back by pop).
+ *
+ * Must be called with @q->lock held.
+ * Caller must check xe_usm_queue_full() before calling.
+ */
+static inline void xe_usm_queue_push(struct xe_usm_queue *q, const void *in)
+{
+	lockdep_assert_held(&q->lock);
+
+	memcpy(q->data + q->head, in, q->data_size);
+	q->head = (q->head + q->entry_size) % q->size;
+}
+#endif
-- 
2.43.0

