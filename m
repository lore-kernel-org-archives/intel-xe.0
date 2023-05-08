Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CB3C77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 14:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF2610E2C2;
	Mon,  8 May 2023 14:47:34 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FED10E2C2
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 14:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683557252; x=1715093252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e3w1oIlc/ls9MY1cFwACugmzIJxtmp+oeaa+h/2fugc=;
 b=WtBd9IDkdPZkyzRA+9efSdj0WijpVch5YTQvm+LJ6MxKrreNYuJfqjqM
 j2agMUEhSMNpj+SMX9RKG/Fs7NQ++XZAN8n6IswIn5uTZ1nDnoCWpG7kc
 w+oGKhUKyWdseywM2S5XiRlmBjnwpUYPOC/RvpPs9tVN9fOZiy9kDxDAc
 DDiKFqsOM82jBk3tmOFH9f/f2JTvhQtbwb5i8cRqXg4VZhAJfp3o0TqaI
 aihS0zh5r86hkEovPqgnWpKUX2Xaru1CrpRMeICVeQV6CeKU+b+QpH5yP
 LG4es38fdt9yvGyedUPagmlQOL6kbU9Nb35tmeJQbQCUrf2oytEIFUi94 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="352724235"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="352724235"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 07:47:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="731330028"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="731330028"
Received: from heid-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.62.78])
 by orsmga001-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 07:47:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 17:46:12 +0300
Message-Id: <20230508144618.162140-13-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508144618.162140-1-jani.nikula@intel.com>
References: <20230508144618.162140-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 12/18] fixup! drm/xe/display: Implement display
 support
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add compat intel_pcode.h glue layer.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/xe/compat-i915-headers/intel_pcode.h  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h
new file mode 100644
index 000000000000..71f1fd1de2fd
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __INTEL_PCODE_H__
+#define __INTEL_PCODE_H__
+
+#include "intel_uncore.h"
+#include "xe_pcode.h"
+
+static inline int
+snb_pcode_write_timeout(struct fake_uncore *uncore, u32 mbox, u32 val,
+			int fast_timeout_us, int slow_timeout_ms)
+{
+	return xe_pcode_write_timeout(__fake_uncore_to_gt(uncore), mbox, val,
+				      slow_timeout_ms ?: 1);
+}
+
+static inline int
+snb_pcode_write(struct fake_uncore *uncore, u32 mbox, u32 val)
+{
+
+	return xe_pcode_write(__fake_uncore_to_gt(uncore), mbox, val);
+}
+
+static inline int
+snb_pcode_read(struct fake_uncore *uncore, u32 mbox, u32 *val, u32 *val1)
+{
+	return xe_pcode_read(__fake_uncore_to_gt(uncore), mbox, val, val1);
+}
+
+static inline int
+skl_pcode_request(struct fake_uncore *uncore, u32 mbox,
+		  u32 request, u32 reply_mask, u32 reply,
+		  int timeout_base_ms)
+{
+	return xe_pcode_request(__fake_uncore_to_gt(uncore), mbox, request, reply_mask, reply,
+				timeout_base_ms);
+}
+
+#endif /* __INTEL_PCODE_H__ */
-- 
2.39.2

