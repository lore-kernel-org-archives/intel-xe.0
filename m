Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527E0C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 12:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254D310E487;
	Wed, 10 May 2023 12:12:53 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE87310E487
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 12:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683720769; x=1715256769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OLZzF+V+Pj5malnoVhhxnXtRQL8XUctHNmudnSj/Zso=;
 b=e/RyTgGubSJwH42uWe8UtR3Wc2yXv0zsLizpNRKQFQRAbmn/fVJj2gjS
 mcEhgGS3oXkXYLbamvHu15K1eP/t+yPflV7IQlrecwhTNMAOfkWxSTRUn
 zfXoqiCzhXmIn8gkS1Px1GNeMAgBwwW588jh3bnuRpveymF4j5RkTClR8
 8KCx5pCtTGp20SX30CH/lrZDAuoJTgf1aCEaKG9OhgtI6oFI70fNu2b1W
 cr7YTmWzw3cVlIWUNQkixspW2vfF5heW2C8SvY/tyXbklydr1rsciMTO0
 OLfYlsFLudpG9EUc5J+HIP1xu3aCyMWfcCx06NKh91QAyvxin0SZeRRUw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353268181"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="353268181"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="788906290"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="788906290"
Received: from iisaev-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.141])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:46 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 15:11:43 +0300
Message-Id: <20230510121152.736148-15-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510121152.736148-1-jouni.hogander@intel.com>
References: <20230510121152.736148-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v2 14/23] drm/xe: Add i915_active.h
 compatibility header
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
Cc: jani.nikula@intel.com, rodrigo.vivi@kernel.org,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 ville.syrjala@linux.intel.com
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

