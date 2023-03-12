Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4916AC6FD1D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 02:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F405A10E1EA;
	Wed, 15 Mar 2023 02:05:55 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58D810E1EA
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 02:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678845954; x=1710381954;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q3W55ut+RewyjK2pyJhKdeMeOPMKtAooAIi8Uwkda/k=;
 b=aWMSWEyCci/+XahGKOhbNenjyi0SJtL2cGA7/hylZ4EvWvPdB7ErSOrs
 QmewJ1QJkIAyydc3xM4UQ2QRzs+PqfFLzF4WVKoV1c4wNRgpw+4naw5pS
 uC6RY8pU7QQXyeELDaZABOCABdUTtSEIG8HdRw+ok26jxfxaJCDySBhSQ
 7hlVQr+xEOsFxfljYRf+s1v4414afXq8V9Goze9heBfY8DGg87eTFsKoF
 Dt+o4GxV9L/xLtw3N+zMorfMT9FLkjVXGmxNjt6sytU9WRWX5LFCjX59q
 0tKZnUbZzBkBIncKYWoqHtrq6yvPBZch8gehWWBGTYlJEhobmtr8rTqUd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="325953733"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="325953733"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 19:05:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="629298331"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="629298331"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga003.jf.intel.com with ESMTP; 14 Mar 2023 19:05:20 -0700
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.136.19])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 70B4A865F3
 for <intel-xe@lists.freedesktop.org>; Sun, 12 Mar 2023 19:14:43 +0000 (GMT)
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sun, 12 Mar 2023 20:14:41 +0100
Message-Id: <20230312191442.1609-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Introduce GT oriented log messages
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

While debugging GT related problems, it's good to know which GT was
reporting problems. Introduce helper macros to allow prefix GT logs
with GT idetifier. We will use them in upcoming patches.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_printk.h | 45 +++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_printk.h

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
new file mode 100644
index 000000000000..b12a92024126
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GT_PRINTK_H_
+#define _XE_GT_PRINTK_H_
+
+#include <drm/drm_print.h>
+#include "xe_gt_types.h"
+
+#define gt_printk(_gt, _level, _fmt, ...) \
+	drm_##_level(&(_gt)->xe->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define gt_err(_gt, _fmt, ...) \
+	gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
+
+#define gt_warn(_gt, _fmt, ...) \
+	gt_printk((_gt), warn, _fmt, ##__VA_ARGS__)
+
+#define gt_notice(_gt, _fmt, ...) \
+	gt_printk((_gt), notice, _fmt, ##__VA_ARGS__)
+
+#define gt_info(_gt, _fmt, ...) \
+	gt_printk((_gt), info, _fmt, ##__VA_ARGS__)
+
+#define gt_dbg(_gt, _fmt, ...) \
+	gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
+
+#define gt_err_ratelimited(_gt, _fmt, ...) \
+	gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
+
+#define gt_WARN(_gt, _condition, _fmt, ...) \
+	drm_WARN(&(_gt)->xe->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define gt_WARN_ONCE(_gt, _condition, _fmt, ...) \
+	drm_WARN_ONCE(&(_gt)->xe->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define gt_WARN_ON(_gt, _condition) \
+	gt_WARN((_gt), _condition, "%s(%s)", "gt_WARN_ON", __stringify(_condition))
+
+#define gt_WARN_ON_ONCE(_gt, _condition) \
+	gt_WARN_ONCE((_gt), _condition, "%s(%s)", "gt_WARN_ON_ONCE", __stringify(_condition))
+
+#endif
-- 
2.25.1

