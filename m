Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93933EE57C3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 04:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4887510E868;
	Fri,  8 Sep 2023 04:23:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEC710E85F
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 04:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694147035; x=1725683035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lQf+xWgbRytWGTjU+lTdX9WyH0EOi81cVqKRMdE3ag8=;
 b=eXBOvtyYNn3eyUl1D5J/ZHR6yL18cFJR+2DzWXsEjOrOZ9Loui8R+p4Q
 c7e4LEAMAKQCIFhCf8MsVM2/AGAa0Sy3grijY9Che70BiLathulkY2NLT
 kFO5wJlm4bN5LCucZGaTi//ANrMJXklZ1pdd/xKvNn7xLNe7L17UtiVaR
 7LC/3OpxpR8R9yG3QggcsLt1ro07BTjHUtqYdFtGE1tXZOkBY7ONuWivc
 2E0RcX9xwQl9l0KZReVvlEuqF2/44hGxTT0IhbxYCx3erBcCtegmDwsJG
 9rVuMsQ2QXCDCcxic+9JsZp8rz6sxAyF4ayusmh8/3uSx66ew5/Xg61yF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="463935385"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="463935385"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="857200708"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="857200708"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:53 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Sep 2023 21:23:33 -0700
Message-ID: <20230908042348.1592535-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
References: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 02/17] drm/xe/oa: Add OA types
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

Add types and data structs used by OA. The data structs maintain device and
gt level information, information about the open OA stream and OA buffer
used internally to capture OA counters written by HW as well as capture
configurations which can be selected for an OA stream.

v2: Add linux includes to fix build
v3: Change oa_unit_id to u16 (Umesh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa_types.h | 295 +++++++++++++++++++++++++++++++
 1 file changed, 295 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h

diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
new file mode 100644
index 0000000000000..4063c81e353ff
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -0,0 +1,295 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_OA_TYPES_H_
+#define _XE_OA_TYPES_H__
+
+#include <linux/idr.h>
+#include <linux/kobject.h>
+#include <linux/poll.h>
+#include <linux/sysfs.h>
+#include <drm/xe_drm.h>
+#include "regs/xe_reg_defs.h"
+
+struct drm_device;
+struct drm_file;
+
+enum {
+	OA_GROUP_OAG = 0,
+	OA_GROUP_OAM_SAMEDIA_0 = 0,
+
+	OA_GROUP_MAX,
+	OA_GROUP_INVALID = U32_MAX,
+};
+
+enum oa_type {
+	TYPE_OAG,
+	TYPE_OAM,
+};
+
+enum report_header {
+	HDR_32_BIT = 0,
+	HDR_64_BIT,
+};
+
+struct xe_oa_format {
+	u32 format;
+	int size;
+	int type;
+	enum report_header header;
+};
+
+struct xe_oa_reg {
+	struct xe_reg addr;
+	u32 value;
+};
+
+struct xe_oa_config {
+	struct xe_oa *oa;
+
+	char uuid[UUID_STRING_LEN + 1];
+	int id;
+
+	const struct xe_oa_reg *mux_regs;
+	u32 mux_regs_len;
+	const struct xe_oa_reg *b_counter_regs;
+	u32 b_counter_regs_len;
+	const struct xe_oa_reg *flex_regs;
+	u32 flex_regs_len;
+
+	struct attribute_group sysfs_metric;
+	struct attribute *attrs[2];
+	struct kobj_attribute sysfs_metric_id;
+
+	struct kref ref;
+	struct rcu_head rcu;
+};
+
+struct xe_oa_regs {
+	u32 base;
+	struct xe_reg oa_head_ptr;
+	struct xe_reg oa_tail_ptr;
+	struct xe_reg oa_buffer;
+	struct xe_reg oa_ctx_ctrl;
+	struct xe_reg oa_ctrl;
+	struct xe_reg oa_debug;
+	struct xe_reg oa_status;
+	u32 oa_ctrl_counter_format_shift;
+};
+
+/**
+ * struct xe_oa_group - OA group representing one hardware OA unit
+ */
+struct xe_oa_group {
+	/** @oa_unit_id: identifier for the OA unit */
+	u16 oa_unit_id;
+
+	/**
+	 * @exclusive_stream: The stream currently using the OA unit. This is
+	 * sometimes accessed outside a syscall associated to its file
+	 * descriptor.
+	 */
+	struct xe_oa_stream *exclusive_stream;
+
+	/** @num_engines: number of engines using this OA unit */
+	u32 num_engines;
+
+	/** @regs: OA buffer register group for programming the OA unit */
+	struct xe_oa_regs regs;
+
+	/** @type: Type of OA unit - OAM, OAG etc. */
+	enum oa_type type;
+};
+
+/**
+ * struct xe_oa_gt - OA per-gt information
+ */
+struct xe_oa_gt {
+	/** @lock: lock associated with anything below within this structure */
+	struct mutex lock;
+
+	/** @num_oa_groups: number of oa groups per gt */
+	u32 num_oa_groups;
+
+	/** @group: list of OA groups - one for each OA buffer */
+	struct xe_oa_group *group;
+};
+
+/**
+ * struct xe_oa - OA device level information
+ */
+struct xe_oa {
+	/** @xe: back pointer to xe device */
+	struct xe_device *xe;
+
+	/** @metrics_kobj: kobj for metrics sysfs */
+	struct kobject *metrics_kobj;
+
+	/**
+	 * @metrics_lock: lock associated with adding/modifying/removing OA
+	 * configs in oa->metrics_idr.
+	 */
+	struct mutex metrics_lock;
+
+	/**
+	 * @metrics_idr: List of dynamic configurations (struct xe_oa_config)
+	 */
+	struct idr metrics_idr;
+
+	/** @ctx_oactxctrl_offset: offset of OACTXCONTROL register in context image */
+	u32 ctx_oactxctrl_offset;
+
+	/** @oa_formats: tracks all OA formats across platforms */
+	const struct xe_oa_format *oa_formats;
+
+#define FORMAT_MASK_SIZE DIV_ROUND_UP(XE_OA_FORMAT_MAX - 1, BITS_PER_LONG)
+
+	/** @format_mask: tracks valid OA formats for a platform */
+	unsigned long format_mask[FORMAT_MASK_SIZE];
+
+	/** @oa_unit_ids: tracks oa unit ids assigned across gt's */
+	u16 oa_unit_ids;
+};
+
+/**
+ * struct xe_oa_stream - state for a single open stream FD
+ */
+struct xe_oa_stream {
+	/** @oa: xe_oa backpointer */
+	struct xe_oa *oa;
+
+	/** @gt: gt associated with the oa stream */
+	struct xe_gt *gt;
+
+	/**
+	 * @hwe: hardware engine associated with this performance stream.
+	 */
+	struct xe_hw_engine *hwe;
+
+	/** @lock: Lock associated with operations on stream */
+	struct mutex lock;
+
+	/**
+	 * @sample: true when DRM_XE_OA_PROP_SAMPLE_OA is given when
+	 * opening a stream, representing the contents of a single sample
+	 * as read() by userspace.
+	 */
+	bool sample;
+
+	/**
+	 * @sample_size: Considering the configured contents of a sample
+	 * combined with the required header size, this is the total size
+	 * of a single sample record.
+	 */
+	int sample_size;
+
+	/**
+	 * @exec_q: %NULL if measuring system-wide across all exec_q's or a
+	 * specific exec_q that is being monitored.
+	 */
+	struct xe_exec_queue *exec_q;
+
+	/**
+	 * @enabled: Whether the stream is currently enabled, considering
+	 * whether the stream was opened in a disabled state and based
+	 * on `XE_OA_IOCTL_ENABLE` and `XE_OA_IOCTL_DISABLE` calls.
+	 */
+	bool enabled;
+
+	/** @oa_config: The OA configuration used by the stream */
+	struct xe_oa_config *oa_config;
+
+	/**
+	 * @oa_config_bos: A list of struct i915_oa_config_bo allocated lazily
+	 * each time @oa_config changes.
+	 */
+	struct llist_head oa_config_bos;
+
+	/** @specific_ctx_id: id of the context used for filtering reports */
+	u32 specific_ctx_id;
+
+	/** @specific_ctx_id_mask: The mask used to masking specific_ctx_id bits */
+	u32 specific_ctx_id_mask;
+
+	/**
+	 * @poll_check_timer: High resolution timer that will periodically
+	 * check for data in the circular OA buffer for notifying userspace
+	 * (e.g. during a read() or poll()).
+	 */
+	struct hrtimer poll_check_timer;
+
+	/**
+	 * @poll_wq: The wait queue that hrtimer callback wakes when it
+	 * sees data ready to read in the circular OA buffer.
+	 */
+	wait_queue_head_t poll_wq;
+
+	/** @pollin: Whether there is data available to read */
+	bool pollin;
+
+	/** @periodic: Whether periodic sampling is currently enabled */
+	bool periodic;
+
+	/** @period_exponent: The OA unit sampling frequency is derived from this */
+	int period_exponent;
+
+	/** @oa_buffer: State of the OA buffer */
+	struct {
+		/** @format: data format */
+		const struct xe_oa_format *format;
+
+		/** @format: xe_bo backing the OA buffer */
+		struct xe_bo *bo;
+
+		/** @vaddr: mapped vaddr of the OA buffer */
+		u8 *vaddr;
+
+		/** @last_ctx_id: last context id for OA data added */
+		u32 last_ctx_id;
+
+		/**
+		 * @ptr_lock: Locks reads and writes to all head/tail state
+		 *
+		 * Consider: the head and tail pointer state needs to be read
+		 * consistently from a hrtimer callback (atomic context) and
+		 * read() fop (user context) with tail pointer updates happening
+		 * in atomic context and head updates in user context and the
+		 * (unlikely) possibility of read() errors needing to reset all
+		 * head/tail state.
+		 *
+		 * Note: Contention/performance aren't currently a significant
+		 * concern here considering the relatively low frequency of
+		 * hrtimer callbacks (5ms period) and that reads typically only
+		 * happen in response to a hrtimer event and likely complete
+		 * before the next callback.
+		 *
+		 * Note: This lock is not held *while* reading and copying data
+		 * to userspace so the value of head observed in htrimer
+		 * callbacks won't represent any partial consumption of data.
+		 */
+		spinlock_t ptr_lock;
+
+		/**
+		 * @head: Although we can always read back the head pointer register,
+		 * we prefer to avoid trusting the HW state, just to avoid any
+		 * risk that some hardware condition could somehow bump the
+		 * head pointer unpredictably and cause us to forward the wrong
+		 * OA buffer data to userspace.
+		 */
+		u32 head;
+
+		/**
+		 * @tail: The last verified tail that can be read by userspace.
+		 */
+		u32 tail;
+	} oa_buffer;
+
+	/**
+	 * @poll_oa_period: The period in nanoseconds at which the OA
+	 * buffer should be checked for available data.
+	 */
+	u64 poll_oa_period;
+};
+#endif
-- 
2.41.0

