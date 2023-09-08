Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BC2EE7FE1
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 12:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7978310E04D;
	Fri,  8 Sep 2023 12:24:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E9510E8A5
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 12:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694175884; x=1725711884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OLZzF+V+Pj5malnoVhhxnXtRQL8XUctHNmudnSj/Zso=;
 b=DCsYpWmzUveY2cR13PlyqxfWQr3MGiyTGE8eleKq1zO4DS8VIIV7t04/
 eBDgqsVodVdRwLF/5ZLwU0aNpqfNiJmAIH1FzTDw83mD7mExeQmHllD6U
 D/l2NMCI3WHkbPaJTaZOIW/RIt+i306D8nDJwZgl1vrpwmZY3zTdzIB/B
 U55hA4gK64CQ0JqfpFxyUIvBG/bUJtOy/SP6SMKZMGBRRLA94Zch55GCV
 jeHVbuPQDQDEU5pNYE2Yi73xBS3oOnkWXSEkh9+/f2XHffcf1Ezn6gwoQ
 bm2PG1QSVfcpLKf/aGqVs5SH2nNPging6oKwaAGkSNrrSQmfKDang6aP1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="441650055"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="441650055"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 05:24:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="692244211"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="692244211"
Received: from akorchin-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.73])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 05:24:43 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  8 Sep 2023 15:24:11 +0300
Message-Id: <20230908122415.1886366-8-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230908122415.1886366-1-jouni.hogander@intel.com>
References: <20230908122415.1886366-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 07/11] drm/xe: Add i915_active.h compatibility
 header
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add empty definitions for i915_active_init/fini to kill ifdefs from
frontbuffer tracking code.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../drm/xe/compat-i915-headers/i915_active.h  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_active.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_active.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_active.h
new file mode 100644
index 000000000000..6f0ab3753563
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_active.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef _I915_ACTIVE_H_
+#define _I915_ACTIVE_H_
+
+#include "i915_active_types.h"
+
+static inline void i915_active_init(struct i915_active *ref,
+				    int (*active)(struct i915_active *ref),
+				    void (*retire)(struct i915_active *ref),
+				    unsigned long flags)
+{
+	(void) active;
+	(void) retire;
+}
+
+#define i915_active_fini(active) do { } while (0)
+
+#endif
-- 
2.34.1

