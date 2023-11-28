Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF91DC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 15:15:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED0010E573;
	Tue, 28 Nov 2023 15:15:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF4F10E56D
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 15:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701184523; x=1732720523;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=fnkyfRYlgS71drz6AzDvKfB4TUUiJ+8wLzM1TSTJ2kA=;
 b=KzymCdh9leLnFbCX3AfCqh2Wl1Nz7/YmUlKj215pzFZWzfXKXH8fU9Fj
 wwW/tjSqsVKYWzmnsima/L/lOpZcDIWdRe/YxM6AEfxRsTl56OAHAbIHo
 XjYjEWw9HLdWjVw4xc6FSxc54/tZ7Viv56J6oUe/qctf8OpRdMauVauK8
 UsvT5YXmt2cNy7DUJOdyfVVjYt3hyKEXudKtHRpx2MNBBJfAZUZGembGN
 kNOGJreprZLf7YrtDMNgCufAJeCl+Uj4JxRDnYjw6FPXH6SVm6nfY7wMo
 fVbLrirpRn218HPiwI60b8yZV9084eRrIM0PgLb+kpeH5JmEyLSW+Hl5/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="11637946"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="11637946"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 07:15:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="744937028"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="744937028"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.140.124])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 07:15:21 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 16:15:04 +0100
Message-Id: <20231128151507.1015-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231128151507.1015-1-michal.wajdeczko@intel.com>
References: <20231128151507.1015-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/5] drm/xe: Introduce SR-IOV logging macros
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

To simplify logging and help identify SR-IOV specific messages
define set of helper macros that will prefix messages based on
the current SR-IOV mode.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_printk.h | 46 ++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_printk.h

diff --git a/drivers/gpu/drm/xe/xe_sriov_printk.h b/drivers/gpu/drm/xe/xe_sriov_printk.h
new file mode 100644
index 000000000000..117e1d541692
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_printk.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PRINTK_H_
+#define _XE_SRIOV_PRINTK_H_
+
+#include <drm/drm_print.h>
+
+#include "xe_device_types.h"
+#include "xe_sriov_types.h"
+
+#define xe_sriov_printk_prefix(xe) \
+	((xe)->sriov.__mode == XE_SRIOV_MODE_PF ? "PF: " : \
+	 (xe)->sriov.__mode == XE_SRIOV_MODE_VF ? "VF: " : "")
+
+#define xe_sriov_printk(xe, _level, fmt, ...) \
+	drm_##_level(&(xe)->drm, "%s" fmt, xe_sriov_printk_prefix(xe), ##__VA_ARGS__)
+
+#define xe_sriov_err(xe, fmt, ...) \
+	xe_sriov_printk((xe), err, fmt, ##__VA_ARGS__)
+
+#define xe_sriov_err_ratelimited(xe, fmt, ...) \
+	xe_sriov_printk((xe), err_ratelimited, fmt, ##__VA_ARGS__)
+
+#define xe_sriov_warn(xe, fmt, ...) \
+	xe_sriov_printk((xe), warn, fmt, ##__VA_ARGS__)
+
+#define xe_sriov_notice(xe, fmt, ...) \
+	xe_sriov_printk((xe), notice, fmt, ##__VA_ARGS__)
+
+#define xe_sriov_info(xe, fmt, ...) \
+	xe_sriov_printk((xe), info, fmt, ##__VA_ARGS__)
+
+#define xe_sriov_dbg(xe, fmt, ...) \
+	xe_sriov_printk((xe), dbg, fmt, ##__VA_ARGS__)
+
+/* for low level noisy debug messages */
+#ifdef CONFIG_DRM_XE_DEBUG_SRIOV
+#define xe_sriov_dbg_verbose(xe, fmt, ...) xe_sriov_dbg(xe, fmt, ##__VA_ARGS__)
+#else
+#define xe_sriov_dbg_verbose(xe, fmt, ...) typecheck(struct xe_device *, (xe))
+#endif
+
+#endif
-- 
2.25.1

