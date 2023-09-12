Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5445CA0ED4
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 06:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E48D10E379;
	Tue, 12 Sep 2023 06:47:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D840410E36E
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 06:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694501253; x=1726037253;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OLZzF+V+Pj5malnoVhhxnXtRQL8XUctHNmudnSj/Zso=;
 b=FmAh0Tqg6AQ15n6akaYjruaw4an5NRSpXlSrbCeFmf+AlVM0VAH47k13
 9ZfDSqZY3aBAsb1Rn+baqbaXSMOk5zOmx6SyTZfgGDmdvLjcJG9NVPPLs
 8jkCw7P21qmipakc69y6HZdD2FVdVnI4WaAtxpgLOKOi6Nc/1plipAiEX
 f0lkvc2Wm6ckgshkL2CaHVaVfCxFFCa0IWhnTc/Ty89G0axAaR97ltyeR
 9dPB/6M9J1IzuChvFP3q2eClhBeS2H8YoGGMLJIPKr2aSJnRMrf/DKYol
 HAXKcb8JnulVEpqZQgChmhOkZDH3RLxjaLn0zmG/xDf0BJFkkomYKWYkY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444730347"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="444730347"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="813699051"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="813699051"
Received: from sptommas-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.216.207])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:32 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 09:47:05 +0300
Message-Id: <20230912064709.2802305-9-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912064709.2802305-1-jouni.hogander@intel.com>
References: <20230912064709.2802305-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 08/12] drm/xe: Add i915_active.h compatibility
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

