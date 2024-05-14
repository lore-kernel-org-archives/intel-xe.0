Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE94DC25B7C
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 19:01:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C32A10E6A7;
	Tue, 14 May 2024 19:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AOKZupnq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F11410E136
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 19:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715713264; x=1747249264;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jDAsiSQ1QObsKuuTeK/ccuc0KT1tZBZUxwOMRhPaJ68=;
 b=AOKZupnqpEEv+ICD2YJWCZeXmos331zm8RjsXEPngeRftSqWe8sEA6Oo
 Guh/jJpDlUU1J+LJeaBuJNiiCc77q9XkDFC4RgpqKAGS/YzmHT6UDyhFL
 cE9QxlXfKUY78ff2Uy2MMIqKC6C45TeTm8GwqsFnGg9s9K7X2rKU6f0fM
 0QvK8cbsgGNVGG021A44bfmk4FblnZIc/ZD7i4qjJ2NImBJITpwh2C9kc
 MZuR/QEtl04RtA8oVsy0+hWMkg52RlTw0O7aORnsa1UpdZLKui13UMUUN
 2Xrj7ooXdlEN9jSHXiiytTfwnLJBOiL8i0w9Ujbp7U6dn2eQjfSVg8FnA w==;
X-CSE-ConnectionGUID: HlA0XYzMS0Gxak5fDSDC2w==
X-CSE-MsgGUID: +NneQsPyRtySpQfFZ2eP6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11523180"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11523180"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 12:01:04 -0700
X-CSE-ConnectionGUID: Q1vc6EDvQtaZRcZNrmPv1Q==
X-CSE-MsgGUID: U08JMLSRRkG41DdtmqWUxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35565498"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 12:01:03 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 2/8] drm/xe/guc: Introduce GuC KLV thresholds set
Date: Tue, 14 May 2024 21:00:09 +0200
Message-Id: <20240514190015.2172-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240514190015.2172-1-michal.wajdeczko@intel.com>
References: <20240514190015.2172-1-michal.wajdeczko@intel.com>
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

The GuC firmware monitors VF's activity and notifies the PF driver
once any configured threshold related to such activity is exceeded.

The available thresholds are defined in the GuC ABI as part of the
GuC VF Configuration KLVs.  Threshold configurations performed by
the PF driver and notifications sent by the GuC rely on the KLV keys,
which are not zero-based and might not guarantee continuity.

To simplify the driver code and eliminate the need to repeat very
similar code for each threshold, introduce the threshold set macro
that allows to generate required code based on unique threshold tag.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: improve readability of generated switch/enum (Piotr)
    silence kernel-doc warning (CI.hooks)
---
 .../gpu/drm/xe/xe_guc_klv_thresholds_set.h    | 64 +++++++++++++++++
 .../drm/xe/xe_guc_klv_thresholds_set_types.h  | 68 +++++++++++++++++++
 2 files changed, 132 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h

diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
new file mode 100644
index 000000000000..da0fedbbdbaf
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_GUC_KLV_THRESHOLDS_SET_H_
+#define _XE_GUC_KLV_THRESHOLDS_SET_H_
+
+#include "abi/guc_klvs_abi.h"
+#include "xe_guc_klv_helpers.h"
+#include "xe_guc_klv_thresholds_set_types.h"
+
+/**
+ * MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY - Prepare the name of the KLV key constant.
+ * @TAG: unique tag of the GuC threshold KLV key.
+ */
+#define MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG) \
+	MAKE_GUC_KLV_KEY(CONCATENATE(VF_CFG_THRESHOLD_, TAG))
+
+/**
+ * xe_guc_klv_threshold_key_to_index - Find index of the tracked GuC threshold.
+ * @key: GuC threshold KLV key.
+ *
+ * This translation is automatically generated using &MAKE_XE_GUC_KLV_THRESHOLDS_SET.
+ * Return: index of the GuC threshold KLV or -1 if not found.
+ */
+static inline int xe_guc_klv_threshold_key_to_index(u32 key)
+{
+	switch (key) {
+#define define_xe_guc_klv_threshold_key_to_index_case(TAG, ...)		\
+									\
+	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):			\
+		return MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG);
+
+	/* private: auto-generated case statements */
+	MAKE_XE_GUC_KLV_THRESHOLDS_SET(define_xe_guc_klv_threshold_key_to_index_case)
+	}
+	return -1;
+#undef define_xe_guc_klv_threshold_key_to_index_case
+}
+
+/**
+ * xe_guc_klv_threshold_index_to_key - Get tracked GuC threshold KLV key.
+ * @index: GuC threshold KLV index.
+ *
+ * This translation is automatically generated using &MAKE_XE_GUC_KLV_THRESHOLDS_SET.
+ * Return: key of the GuC threshold KLV or 0 on malformed index.
+ */
+static inline u32 xe_guc_klv_threshold_index_to_key(enum xe_guc_klv_threshold_index index)
+{
+	switch (index) {
+#define define_xe_guc_klv_threshold_index_to_key_case(TAG, ...)		\
+									\
+	case MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG):			\
+		return MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG);
+
+	/* private: auto-generated case statements */
+	MAKE_XE_GUC_KLV_THRESHOLDS_SET(define_xe_guc_klv_threshold_index_to_key_case)
+	}
+	return 0; /* unreachable */
+#undef define_xe_guc_klv_threshold_index_to_key_case
+}
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
new file mode 100644
index 000000000000..0a028c94756d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_GUC_KLV_THRESHOLDS_SET_TYPES_H_
+#define _XE_GUC_KLV_THRESHOLDS_SET_TYPES_H_
+
+#include "xe_args.h"
+
+/**
+ * MAKE_XE_GUC_KLV_THRESHOLDS_SET - Generate various GuC thresholds definitions.
+ * @define: name of the inner macro to expand.
+ *
+ * The GuC firmware is able to monitor VF's adverse activity and will notify the
+ * PF driver once any threshold is exceeded.
+ *
+ * This super macro allows various conversions between the GuC adverse event
+ * threshold KLV definitions and the driver code without repeating similar code
+ * or risking missing some cases.
+ *
+ * For each GuC threshold definition, the inner macro &define will be provided
+ * with the &TAG, that corresponds to the GuC threshold KLV key name defined by
+ * ABI and the associated &NAME, that may be used in code or debugfs/sysfs::
+ *
+ *	define(TAG, NAME)
+ */
+#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)		\
+	define(CAT_ERR, cat_error_count)		\
+	define(ENGINE_RESET, engine_reset_count)	\
+	define(PAGE_FAULT, page_fault_count)		\
+	define(H2G_STORM, guc_time_us)			\
+	define(IRQ_STORM, irq_time_us)			\
+	define(DOORBELL_STORM, doorbell_time_us)	\
+	/* end */
+
+/**
+ * XE_GUC_KLV_NUM_THRESHOLDS - Number of GuC thresholds KLVs.
+ *
+ * Calculated automatically using &MAKE_XE_GUC_KLV_THRESHOLDS_SET.
+ */
+#define XE_GUC_KLV_NUM_THRESHOLDS \
+	(CALL_ARGS(COUNT_ARGS, MAKE_XE_GUC_KLV_THRESHOLDS_SET(ARGS_SEP_COMMA)) - 1)
+
+/**
+ * MAKE_XE_GUC_KLV_THRESHOLD_INDEX - Create enumerator name.
+ * @TAG: unique TAG of the enum xe_guc_klv_threshold_index.
+ */
+#define MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG) \
+	CONCATENATE(XE_GUC_KLV_THRESHOLD_INDEX_, TAG)
+
+/**
+ * enum xe_guc_klv_threshold_index - Index of the tracked GuC threshold.
+ *
+ * This enum is automatically generated using &MAKE_XE_GUC_KLV_THRESHOLDS_SET.
+ * All these generated enumerators will only be used by the also generated code.
+ */
+enum xe_guc_klv_threshold_index {
+#define define_xe_guc_klv_threshold_index_enum(TAG, ...)	\
+								\
+	MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG),
+
+	/* private: auto-generated enum definitions */
+	MAKE_XE_GUC_KLV_THRESHOLDS_SET(define_xe_guc_klv_threshold_index_enum)
+#undef define_xe_guc_klv_threshold_index_enum
+};
+
+#endif
-- 
2.43.0

