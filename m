Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7254F46C47
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 14:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B55A10E24D;
	Mon,  6 Apr 2026 14:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WgD683BC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664E810E24D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 14:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775485333; x=1807021333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=phFA8bNEVId4PPdg1gf3nBnf5MXfvaJk0T5cT+2kLUQ=;
 b=WgD683BCKz/HVf2VASOWc8YDH2ehg4AV96EDl0+0DhvI4CtQiI4lPEc9
 bwJiLqt+IenBhFjl5uEEdHt99s+s9aqjq07gvX4t8txoFKwaMBsE74uLD
 h3fLPajYeXdD2695/aBMp17z502iJe/r3jc+p2ni3nddBq2WtTVjukEfR
 8AeeQTCYvyHUhINtRK+FD3+Iwl6vTWo1u7w+zZV34QLDxNQGwXUI1QGIM
 Uby2DWvpUq4IWXFbN175oxReCvLUV8Df49W1Dj2OfALzwWMLZ3Fr+glWL
 mnl4PcF4X7cFWNk7eDJMFPDdvKfErbudzfvHxqwoe+BFa1xXwPnBJyETL A==;
X-CSE-ConnectionGUID: lcfH2kvXRlWuKux2iDtvZw==
X-CSE-MsgGUID: VQvAiIFoQmyYmjqucQQCAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="75473054"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="75473054"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 07:22:13 -0700
X-CSE-ConnectionGUID: hnPMrPd3TVGF914L8V0qtA==
X-CSE-MsgGUID: cr9y6NQgRHGFZtu13No9uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="232746854"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 07:22:10 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v2 2/5] drm/xe/xe_ras: Add structures and commands for get and
 clear counter
Date: Mon,  6 Apr 2026 20:24:41 +0530
Message-ID: <20260406145440.2016065-9-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260406145440.2016065-7-riana.tauro@intel.com>
References: <20260406145440.2016065-7-riana.tauro@intel.com>
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

Add request and response structures for get and clear counter command.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: add num_headers to queue header
    add structures for clear counter
    move commands to sysctrl file (Raag)
---
 drivers/gpu/drm/xe/xe_ras_types.h             | 176 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  15 ++
 2 files changed, 191 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h

diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
new file mode 100644
index 000000000000..ac83a8b75c70
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -0,0 +1,176 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_RAS_TYPES_H_
+#define _XE_RAS_TYPES_H_
+
+#include <linux/types.h>
+
+#define XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE	200
+
+/**
+ * struct xe_ras_error_common - Common RAS error class
+ *
+ * This structure contains error severity and component information
+ * across all products
+ */
+struct xe_ras_error_common {
+	/** @severity: Error Severity */
+	u8 severity;
+	/** @component: IP where the error originated */
+	u8 component;
+} __packed;
+
+/**
+ * struct xe_ras_error_unit - Error unit information
+ */
+struct xe_ras_error_unit {
+	/** @tile: Tile identifier */
+	u8 tile;
+	/** @instance: Instance identifier within a component */
+	u32 instance;
+} __packed;
+
+/**
+ * struct xe_ras_error_cause - Error cause information
+ */
+struct xe_ras_error_cause {
+	/** @cause: Cause */
+	u32 cause;
+	/** @reserved: For future use */
+	u8 reserved;
+} __packed;
+
+/**
+ * struct xe_ras_error_product - Error fields that are specific to the product
+ */
+struct xe_ras_error_product {
+	/** @unit: Unit within IP block */
+	struct xe_ras_error_unit unit;
+	/** @error_cause: Cause/checker */
+	struct xe_ras_error_cause error_cause;
+} __packed;
+
+/**
+ * struct xe_ras_error_class - Complete RAS Error Class
+ *
+ * This structure provides the complete error classification by combining
+ * the common error class with the product-specific error class.
+ */
+struct xe_ras_error_class {
+	/** @common: Common error severity and component */
+	struct xe_ras_error_common common;
+	/** @product: Product-specific unit and cause */
+	struct xe_ras_error_product product;
+} __packed;
+
+/**
+ * struct xe_ras_info_queue_header - Info queue header
+ *
+ * This structure provides metadata about large info queue data
+ */
+struct xe_ras_info_queue_header {
+	/** @total_size: Total size of complete info queue data (bytes) */
+	u32 total_size;
+	/** @chunk_offset: Offset of this chunk within total data (bytes) */
+	u32 chunk_offset;
+	/** @chunk_size: Size of data in this chunk (bytes) */
+	u32 chunk_size;
+	/** @sequence_number: Sequence number of this chunk (starts at 0) */
+	u32 sequence_number;
+	/** @flags: Info queue control flags */
+	u32 flags:8;
+	/** @compression_type: Compression algorithm used (0 = none) */
+	u32 compression_type:4;
+	/** @num_headers: Number of detailed counter headers present at the beginning of queue data */
+	u32 num_headers:5;
+	/** @reserved: Reserved for future use */
+	u32 reserved:15;
+	/** @checksum: Checksum of the chunk data */
+	u32 checksum;
+} __packed;
+
+/**
+ * struct xe_ras_info_queue_response - Info queue response
+ *
+ * This structure provides the response for commands with info queue
+ */
+struct xe_ras_info_queue_response {
+	/** @queue_header: Info queue metadata */
+	struct xe_ras_info_queue_header queue_header;
+	/** @queue_data: Info queue data chunk */
+	u8 queue_data[XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE];
+} __packed;
+
+/**
+ * struct xe_ras_get_counter_request - Request for XE_SYSCTRL_CMD_GET_COUNTER
+ *
+ * This structure defines the request format to get error counter value.
+ */
+struct xe_ras_get_counter_request {
+	/** @error_class: RAS error class */
+	struct xe_ras_error_class error_class;
+	/** @reserved: Reserved for future use */
+	u32 reserved;
+} __packed;
+
+/**
+ * struct xe_ras_get_counter_response - Response for XE_SYSCTRL_CMD_GET_COUNTER
+ *
+ * This structure defines the response format to get error counter value.
+ */
+struct xe_ras_get_counter_response {
+	/** @error_class: RAS error class */
+	struct xe_ras_error_class error_class;
+	/** @counter_value: Current counter value */
+	u32 counter_value;
+	/** @timestamp: Timestamp of the counter value */
+	u64 timestamp;
+	/** @threshold_value: Threshold value for the counter */
+	u32 threshold_value;
+	/** @counter_status: Status of the counter */
+	u32 counter_status:8;
+	/** @reserved: Reserved for future use */
+	u32 reserved:1;
+	/** @has_info_queue: Indicates if info queue is present */
+	u32 has_info_queue:1;
+	/** @reserved1: Reserved for future use */
+	u32 reserved1:22;
+	/** @info_queue: Info queue data */
+	struct xe_ras_info_queue_response info_queue;
+} __packed;
+
+/**
+ * struct xe_ras_clear_counter_request - Request for XE_SYSCTRL_CMD_CLEAR_COUNTER
+ *
+ * This structure defines the request format to clear an error counter.
+ */
+struct xe_ras_clear_counter_request {
+	/** @error_class: RAS error class */
+	struct xe_ras_error_class error_class;
+	/** @specific_counter: (1 = Specific counter, 0 = Aggregate counter) */
+	u32 specific_counter:1;
+	/** @reserved: Reserved for future use */
+	u32 reserved:31;
+} __packed;
+
+/**
+ * struct xe_ras_clear_counter_response - Response for XE_SYSCTRL_CMD_CLEAR_COUNTER
+ *
+ * This structure defines the response received on clearing an error counter.
+ */
+struct xe_ras_clear_counter_response {
+	/** @error_class: RAS error class */
+	struct xe_ras_error_class error_class;
+	/** @previous_counter_value: Counter value before clearing */
+	u32 previous_counter_value;
+	/** @clear_timestamp: Timestamp when the counter was cleared */
+	u64 clear_timestamp;
+	/** @status: Status of the clear operation (Success/Failure) */
+	u32 status;
+	/** @reserved: Reserved for future use */
+	u32 reserved[3];
+} __packed;
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 89456aec6097..61ec8b18d430 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -10,6 +10,21 @@
 
 #include "abi/xe_sysctrl_abi.h"
 
+/**
+ * enum xe_sysctrl_mailbox_command_id - Sysctrl Command ID's for GFSP group
+ *
+ * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
+ * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
+ */
+enum xe_sysctrl_mailbox_command_id {
+	XE_SYSCTRL_CMD_GET_COUNTER = 0x03,
+	XE_SYSCTRL_CMD_CLEAR_COUNTER = 0x04
+};
+
+enum xe_sysctrl_group {
+	XE_SYSCTRL_GROUP_GFSP = 1
+};
+
 /**
  * struct xe_sysctrl_mailbox_command - System Controller mailbox command
  */
-- 
2.47.1

