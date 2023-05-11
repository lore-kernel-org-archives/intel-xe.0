Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7441AC7EE22
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 16:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCD310E58C;
	Thu, 11 May 2023 16:56:58 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D823A10E579
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 16:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683824215; x=1715360215;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pvH+nHM69+1C8R6k6BTmlxIpByHNSb8eTjwIb4dylRc=;
 b=Gv3Jb9yOo5B1gLJu25X7bk4QBLGR3OwPQGsryRRzbHn4pH89i3tJOaDt
 uMc8feeOB+0im9/0WfRqBGioVRh6lusX3R9rp4Gu5Ixdmq9hi1rFysdDI
 pFL/5l4A83PNjSBmo+jEdla+9DjbXhXMXsH0qPFOHcDahFXYYnuSVh/40
 MLEsV27+zFSTOjL8Hura59bXDt6kf0Wh7RbJ5i5cWEHldluOK5JMCpqA9
 qJIbsKDndno1xqI/hZ1Ow5er5UwMAZL405yjT/EGIoLMtjk8Z786lr7Yd
 peqw2HZw3JGJj2re4X8U1vX35qqjV/Vhk39Ap+SXD7QzMWJx9YCt6263L A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="348043611"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="348043611"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 09:56:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="650287335"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="650287335"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.141.62])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 09:56:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 11 May 2023 18:56:35 +0200
Message-Id: <20230511165636.1772-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/2] drm/xe: Introduce GT oriented log messages
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
Cc: Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

While debugging GT related problems, it's good to know which GT was
reporting problems. Introduce helper macros to allow prefix GT logs
with GT idetifier. We will use them in upcoming patches.

v2: use xe_ prefix (Lucas)
v3: use correct include

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_printk.h | 46 +++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_printk.h

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
new file mode 100644
index 000000000000..0b801429cf1a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GT_PRINTK_H_
+#define _XE_GT_PRINTK_H_
+
+#include <drm/drm_print.h>
+
+#include "xe_device_types.h"
+
+#define xe_gt_printk(_gt, _level, _fmt, ...) \
+	drm_##_level(&(_gt)->xe->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define xe_gt_err(_gt, _fmt, ...) \
+	xe_gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
+
+#define xe_gt_warn(_gt, _fmt, ...) \
+	xe_gt_printk((_gt), warn, _fmt, ##__VA_ARGS__)
+
+#define xe_gt_notice(_gt, _fmt, ...) \
+	xe_gt_printk((_gt), notice, _fmt, ##__VA_ARGS__)
+
+#define xe_gt_info(_gt, _fmt, ...) \
+	xe_gt_printk((_gt), info, _fmt, ##__VA_ARGS__)
+
+#define xe_gt_dbg(_gt, _fmt, ...) \
+	xe_gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
+
+#define xe_gt_err_ratelimited(_gt, _fmt, ...) \
+	xe_gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
+
+#define xe_gt_WARN(_gt, _condition, _fmt, ...) \
+	drm_WARN(&(_gt)->xe->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define xe_gt_WARN_ONCE(_gt, _condition, _fmt, ...) \
+	drm_WARN_ONCE(&(_gt)->xe->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define xe_gt_WARN_ON(_gt, _condition) \
+	xe_gt_WARN((_gt), _condition, "%s(%s)", "gt_WARN_ON", __stringify(_condition))
+
+#define xe_gt_WARN_ON_ONCE(_gt, _condition) \
+	xe_gt_WARN_ONCE((_gt), _condition, "%s(%s)", "gt_WARN_ON_ONCE", __stringify(_condition))
+
+#endif
-- 
2.25.1

