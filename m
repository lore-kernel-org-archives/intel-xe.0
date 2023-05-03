Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6549FC77B7F
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 13:11:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4132710E0CB;
	Wed,  3 May 2023 13:11:16 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92A110E0CB
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683119474; x=1714655474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e3w1oIlc/ls9MY1cFwACugmzIJxtmp+oeaa+h/2fugc=;
 b=lVgXWUailYDnRQsGXI5gb7HR1F5FrNfxNaeziX3TcYz0lorZoukeyYkQ
 MLvFdNskb+xftW92l91djFynaApUdPfLNPAWRMZRAO3QPFj2Ntgy2aRxp
 SA2+bV1X82GGdyKule+rmJJD7RaSWazv8Umck+URKGtc+W3r3x+LBUzvv
 p0pizHvp38xvSuhmigyP1Vkuk+LF1RT0uAhPjMHdXohxlRgRBZEhwjvXl
 Edljt53YP4ZgXFc8heph8VslAY1wIrjYRlGeu+9syiwi4nLw7FvoaKKoX
 cQ9am0kCTlNCUE7hYEXXhEtrY/iRmMG96uNditGbZXA5ME24hXyffDdJU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="350726805"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="350726805"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:11:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="1026493508"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="1026493508"
Received: from ebrosekx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.204])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:11:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  3 May 2023 16:09:59 +0300
Message-Id: <20230503131005.1602412-13-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503131005.1602412-1-jani.nikula@intel.com>
References: <20230503131005.1602412-1-jani.nikula@intel.com>
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

