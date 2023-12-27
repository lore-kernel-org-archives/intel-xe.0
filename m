Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BEDC46CD4
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 23:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A87E10E242;
	Wed, 27 Dec 2023 23:59:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D375C10E181
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 23:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703721549; x=1735257549;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=57HFDhFmDTR7fyg80e7ZvgeQvYnEpPXoNJlEL9Go2uQ=;
 b=Zky1AbimGdcqbaCETSHCOoQwU0RY734+lkTzixZXOTYzDta9vZnlLVyl
 idb6nIklFA8GWk59v/TKsnF8WI2tmbfNxhhFd9YGXXXFkvfDpa7rweRVe
 ZTAl+uIXeofEKkMk//SCit8eE1CXjujuVVrqTJmXoN9frmgoJ6c0rlHkY
 M/+AJEzZGPnacicJqun7lERI7PLTepBQ57BQnr5vuwHDbQFHaGQjLL2y9
 DVKTJUGgi+bUxNTshCrrZGZAZYVjISynMPqhUP/Hh+q7pOVDm8qH5q2sa
 GsLxgoiijbVkaohEMVjEG+fDpfGzfGru6Il/FyFnj9sHosmgyoJqGb/S8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3329152"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="3329152"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 15:59:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="754589870"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="754589870"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.132.129])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 15:59:07 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 04/10] drm/xe/guc: Add helpers for HXG messages
Date: Thu, 28 Dec 2023 00:58:32 +0100
Message-Id: <20231227235838.212-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231227235838.212-1-michal.wajdeczko@intel.com>
References: <20231227235838.212-1-michal.wajdeczko@intel.com>
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

In addition to MMIO and CTB communication between the host driver
and the GUC firmware, we will start using GuC HXG message protocol
in communication between SR-IOV VFs and PF. Define helpers related
to HXG message protocol to minimize code duplication.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_hxg_helpers.h | 107 ++++++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_hxg_helpers.h

diff --git a/drivers/gpu/drm/xe/xe_guc_hxg_helpers.h b/drivers/gpu/drm/xe/xe_guc_hxg_helpers.h
new file mode 100644
index 000000000000..4dc080484e7a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_hxg_helpers.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GUC_HXG_HELPERS_H_
+#define _XE_GUC_HXG_HELPERS_H_
+
+#include <linux/bitfield.h>
+#include <linux/types.h>
+
+#include "abi/guc_messages_abi.h"
+
+/**
+ * hxg_sizeof - Queries size of the object or type (in HXG units).
+ *
+ * Asserts when actual size is not aligned to HXG unit (u32).
+ *
+ * Return: size in dwords (u32).
+ */
+#define hxg_sizeof(T)	(sizeof(T) / sizeof(u32) + BUILD_BUG_ON_ZERO(sizeof(T) % sizeof(u32)))
+
+static inline const char *guc_hxg_type_to_string(unsigned int type)
+{
+	switch (type) {
+	case GUC_HXG_TYPE_REQUEST:
+		return "request";
+	case GUC_HXG_TYPE_FAST_REQUEST:
+		return "fast-request";
+	case GUC_HXG_TYPE_EVENT:
+		return "event";
+	case GUC_HXG_TYPE_NO_RESPONSE_BUSY:
+		return "busy";
+	case GUC_HXG_TYPE_NO_RESPONSE_RETRY:
+		return "retry";
+	case GUC_HXG_TYPE_RESPONSE_FAILURE:
+		return "failure";
+	case GUC_HXG_TYPE_RESPONSE_SUCCESS:
+		return "response";
+	default:
+		return "<invalid>";
+	}
+}
+
+static inline bool guc_hxg_type_is_action(unsigned int type)
+{
+	switch (type) {
+	case GUC_HXG_TYPE_REQUEST:
+	case GUC_HXG_TYPE_FAST_REQUEST:
+	case GUC_HXG_TYPE_EVENT:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static inline bool guc_hxg_type_is_reply(unsigned int type)
+{
+	switch (type) {
+	case GUC_HXG_TYPE_NO_RESPONSE_BUSY:
+	case GUC_HXG_TYPE_NO_RESPONSE_RETRY:
+	case GUC_HXG_TYPE_RESPONSE_FAILURE:
+	case GUC_HXG_TYPE_RESPONSE_SUCCESS:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static inline u32 guc_hxg_msg_encode_success(u32 *msg, u32 data0)
+{
+	msg[0] = FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
+		 FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_RESPONSE_SUCCESS) |
+		 FIELD_PREP(GUC_HXG_RESPONSE_MSG_0_DATA0, data0);
+
+	return GUC_HXG_RESPONSE_MSG_MIN_LEN;
+}
+
+static inline u32 guc_hxg_msg_encode_failure(u32 *msg, u32 error, u32 hint)
+{
+	msg[0] = FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
+		 FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_RESPONSE_FAILURE) |
+		 FIELD_PREP(GUC_HXG_FAILURE_MSG_0_HINT, hint) |
+		 FIELD_PREP(GUC_HXG_FAILURE_MSG_0_ERROR, error);
+
+	return GUC_HXG_FAILURE_MSG_LEN;
+}
+
+static inline u32 guc_hxg_msg_encode_busy(u32 *msg, u32 counter)
+{
+	msg[0] = FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
+		 FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_NO_RESPONSE_BUSY) |
+		 FIELD_PREP(GUC_HXG_BUSY_MSG_0_COUNTER, counter);
+
+	return GUC_HXG_BUSY_MSG_LEN;
+}
+
+static inline u32 guc_hxg_msg_encode_retry(u32 *msg, u32 reason)
+{
+	msg[0] = FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
+		 FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_NO_RESPONSE_RETRY) |
+		 FIELD_PREP(GUC_HXG_RETRY_MSG_0_REASON, reason);
+
+	return GUC_HXG_RETRY_MSG_LEN;
+}
+
+#endif
-- 
2.25.1

