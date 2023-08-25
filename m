Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8D7C88CB2
	for <intel-xe@archiver.kernel.org>; Fri, 25 Aug 2023 09:39:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B4310E650;
	Fri, 25 Aug 2023 09:39:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3E410E64E
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Aug 2023 09:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692956370; x=1724492370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OLZzF+V+Pj5malnoVhhxnXtRQL8XUctHNmudnSj/Zso=;
 b=Q68LTRon7rSfTbkkRY64YuiV8AYwNLcCaWA74Kqv+Gym9cyHDYS/N4H3
 6lKgePRyt2mJbEd5BkXU/TZUIKVXCOBMJH10xiqAokI+1Zj6FjBMzTAkB
 VwuELXxyyvw9JtQnsOlz1BV+OE5lNkLDmbUa7T7JnRl1Qndnbg0TjeKJe
 kmkqlzQ1pL2diGrHobdZHztvRqtX25uXNKANKCPq/IpiW5/IUBMOZr8sK
 GxWP5lvgJVv1NunM0x0cOvse10Qp768oKGDL/5taVIw8Cc6TujqHem2UO
 hJ/fbdYM5GO3rXuy2Sx1oxb0S+P/oX/x1lCuiYGYqeHP4xkVV4rKpRAzR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="461037118"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="461037118"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="687246835"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="687246835"
Received: from janlundk-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.56.87])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:29 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 25 Aug 2023 12:38:58 +0300
Message-Id: <20230825093904.1230143-7-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825093904.1230143-1-jouni.hogander@intel.com>
References: <20230825093904.1230143-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 06/12] drm/xe: Add i915_active.h compatibility
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

