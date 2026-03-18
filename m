Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79852FCD0BE
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 07:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D5B10E2EB;
	Wed, 18 Mar 2026 07:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iK4X6mHa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791C710E2EB
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 07:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773817812; x=1805353812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S2O2bHxp+FwXuaeFfQ5a7v4mT0DJlsxyxBdGhSth1j4=;
 b=iK4X6mHaTv8s/Xh+e2EKLhIRb2YHiVzB9JJXRnqAuNHUsNgSoJvoNrGx
 juEDS970Ts4pjUcUAzyPIjSXF3H7eOV1UQgubf0C3GTdSutlbnhUrG/C9
 FkLEHjlUniTmRv/em8O28wpA9YK/d4AGuog+e6ARcPtRkFh/u1QSlb6TD
 YiYymKLGmyKx284SaXSEiL2I7riVRQGd4q3bNIh0DWUALzhA+sHJU461S
 +RxTyZAhMXCItrm36x06yL7pZLArbWO7Z3QBTkIPyGnngPYvrW7m1+Df/
 vb+EBWjSR0pTV4c9QA4ut8FYuDhbGb9iXklmETwdLQqVSk8PwRtAx56X/ g==;
X-CSE-ConnectionGUID: tvNVC5cGQFqEiOfOSkoY1w==
X-CSE-MsgGUID: U1WTOtccRyWM9BbS3QKA3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78764241"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="78764241"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 00:10:08 -0700
X-CSE-ConnectionGUID: 66ArPTMTS3mTcItd/MK0dg==
X-CSE-MsgGUID: suja0R+RT/yTkrl0BagtfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="260423957"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 00:10:06 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 stuart.summers@intel.com, arvind.yadav@intel.com, tejas.upadhyay@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 01/15] drm/xe: Add xe_usm_queue generic USM circular buffer
Date: Wed, 18 Mar 2026 13:14:42 +0530
Message-Id: <20260318074456.2839499-2-himal.prasad.ghimiray@intel.com>
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

Introduce struct xe_usm_queue, a generic lock-protected circular FIFO
used by USM consumers (page fault, access counter) to receive fixed-size
entries from IRQ context and process them via a work_struct.

Provide three inline helpers in xe_usm_queue.h:
  xe_usm_queue_full()  - CIRC_SPACE check (caller holds lock)
  xe_usm_queue_pop()   - dequeue one entry (acquires lock internally)
  xe_usm_queue_push()  - enqueue one entry (caller holds lock)

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_usm_queue.h | 100 ++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_usm_queue.h

diff --git a/drivers/gpu/drm/xe/xe_usm_queue.h b/drivers/gpu/drm/xe/xe_usm_queue.h
new file mode 100644
index 000000000000..5dc2d692d8bb
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_usm_queue.h
@@ -0,0 +1,100 @@
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
+ * A lock-protected circular buffer used by both the page fault consumer and
+ * the access counter consumer. Producers push fixed-size entries from IRQ
+ * context; a work_struct processes them asynchronously.
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
+	/** @lock: Protects the queue head/tail */
+	spinlock_t lock;
+	/** @worker: Work item scheduled to drain the queue */
+	struct work_struct worker;
+};
+
+/**
+ * xe_usm_queue_full - Check whether the queue has no room for one more entry
+ * @q: queue
+ * @size: exact size of one entry in bytes (sizeof the entry struct)
+ *
+ * Must be called with @q->lock held.
+ *
+ * Return: true if the queue is full
+ */
+static inline bool xe_usm_queue_full(struct xe_usm_queue *q, u32 size)
+{
+	u32 entry_size = roundup_pow_of_two(size);
+
+	lockdep_assert_held(&q->lock);
+
+	return CIRC_SPACE(q->head, q->tail, q->size) <= entry_size;
+}
+/**
+ * xe_usm_queue_pop - Pop one entry from the queue into @out
+ * @q: queue
+ * @out: destination buffer, must be at least @size bytes
+ * @size: exact size of one entry in bytes (sizeof the entry struct)
+ *
+ * Acquires @q->lock internally with spin_lock_irq().
+ *
+ * Return: true if an entry was dequeued, false if the queue was empty
+ */
+static inline bool xe_usm_queue_pop(struct xe_usm_queue *q, void *out,
+				    u32 size)
+{
+	u32 entry_size = roundup_pow_of_two(size);
+	bool found = false;
+
+	spin_lock_irq(&q->lock);
+	if (q->tail != q->head) {
+		memcpy(out, q->data + q->tail, size);
+		q->tail = (q->tail + entry_size) % q->size;
+		found = true;
+	}
+	spin_unlock_irq(&q->lock);
+
+	return found;
+}
+
+/**
+ * xe_usm_queue_push - Push one entry into the queue
+ * @q: queue
+ * @in: source buffer, must be at least @size bytes
+ * @size: size of one entry of in bytes
+ *
+ * Must be called with @q->lock held.
+ * Caller must check xe_usm_queue_full() before calling.
+ */
+static inline void xe_usm_queue_push(struct xe_usm_queue *q, const void *in,
+				     u32 size)
+{
+	u32 entry_size = roundup_pow_of_two(size);
+
+	lockdep_assert_held(&q->lock);
+
+	memcpy(q->data + q->head, in, size);
+	q->head = (q->head + entry_size) % q->size;
+}
+#endif
-- 
2.34.1

