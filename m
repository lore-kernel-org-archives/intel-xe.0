Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD94BC47079
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 22:20:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848B710E56B;
	Thu,  4 Jan 2024 22:20:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB22510E56A
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 22:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704406845; x=1735942845;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zZ7G6N/3e4FWPHE5EK9liWYUVJMlE/+7P9zhU8nJVG8=;
 b=ONhuh1tp9PRKv+FX8spdYu/jrF9WTdLg6AfvMs2e0tAkq5KJrx3fUnam
 DXosXnYUx/Nqp2if5IrnKjw+d9DqhpRmvi2oKM/8yHTXX7MCXVb1UZpWM
 D+LihY+glhiXB6xxqjb7HUeqoBtqupgpkqB630ESMTSFDEooPn68f3URb
 0/WAfeAasnIROVFqWIJ6l+XAehw1nkAuiPOs9vuqbY//jHw6R8G/N8Sh/
 /WU4806YModFUb5IKjdxyYmG1fQejLrj9YoM8YggZNDCNMgFiBOZmggqY
 a2kaxXUy58x27nFjHIyCka66MInDUg6/AOKEcFF78j00cYSlqe6b9Kjcu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="428546854"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="428546854"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 14:20:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="784022802"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="784022802"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.149.125])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 14:20:45 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 04/10] drm/xe/guc: Add helpers for HXG messages
Date: Thu,  4 Jan 2024 23:20:25 +0100
Message-Id: <20240104222031.277-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240104222031.277-1-michal.wajdeczko@intel.com>
References: <20240104222031.277-1-michal.wajdeczko@intel.com>
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

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: fix hxg_sizeof kernel-doc (CI)
---
 drivers/gpu/drm/xe/xe_guc_hxg_helpers.h | 108 ++++++++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_hxg_helpers.h

diff --git a/drivers/gpu/drm/xe/xe_guc_hxg_helpers.h b/drivers/gpu/drm/xe/xe_guc_hxg_helpers.h
new file mode 100644
index 000000000000..aeeb573c6842
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_hxg_helpers.h
@@ -0,0 +1,108 @@
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
+ * @T: the object or type
+ *
+ * Force a compilation error if actual size is not aligned to HXG unit (u32).
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

