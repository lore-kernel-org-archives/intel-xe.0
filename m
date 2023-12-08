Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D1AC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:43:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58B910E990;
	Fri,  8 Dec 2023 06:43:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9581B10E9D1
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702017815; x=1733553815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xRX/q7TfcBRV/8WL/HC1p6ti+//rytOhQBV6xeYMzS0=;
 b=lu9ijXixbbHtN8HiyUtn2Bb2H4AP1U8LDTvaR/t1IKSvQHLbEZePHgFS
 PbqaHKUKV8l5ZK7n5wMW5upJMo47KuH/osRb1o4Gi7akUNJ494XxwAuJB
 1lSk8cxah8zEPUkG49VrepglEyrj23kqq+UMTUxjGcYhLtYVGNinowUnQ
 pMNSA+7HWGB0+cZ+8Zb4vfGHVvpQrF/NHeafCn+fmXNvOQEeX3g6gyH3u
 sZIsE81RxvUfnwv7n2t/Pu3OhKlwY8SPDPgEviNEUpcw3MqTxVPeXRXAI
 uEFKZ9xID8HG06lSfJAd7e3YD34uYPwFObTCAhFQF983esFReyzj8ZZrX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373866604"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="373866604"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="775699229"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="775699229"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:34 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 03/17] drm/xe/oa/uapi: Add oa_max_sample_rate sysctl
Date: Thu,  7 Dec 2023 22:43:15 -0800
Message-ID: <20231208064329.2387604-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Introduce oa_max_sample_rate sysctl to set a max limit on the frequency of
periodic OA reports.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/Makefile    |  1 +
 drivers/gpu/drm/xe/xe_device.c |  7 +++++
 drivers/gpu/drm/xe/xe_module.c |  5 ++++
 drivers/gpu/drm/xe/xe_oa.c     | 49 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h     | 16 +++++++++++
 5 files changed, 78 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_oa.c
 create mode 100644 drivers/gpu/drm/xe/xe_oa.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b719953d9d30f..cf7e0e5261f73 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -98,6 +98,7 @@ xe-y += xe_bb.o \
 	xe_mmio.o \
 	xe_mocs.o \
 	xe_module.o \
+	xe_oa.o \
 	xe_pat.o \
 	xe_pci.o \
 	xe_pcode.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 35616d1a81a31..744d573eb2720 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -29,6 +29,7 @@
 #include "xe_irq.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
+#include "xe_oa.h"
 #include "xe_pat.h"
 #include "xe_pcode.h"
 #include "xe_perf.h"
@@ -480,6 +481,10 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_heci_gsc_init(xe);
 
+	err = xe_oa_init(xe);
+	if (err)
+		goto err_irq_shutdown;
+
 	err = xe_display_init(xe);
 	if (err)
 		goto err_irq_shutdown;
@@ -526,6 +531,8 @@ void xe_device_remove(struct xe_device *xe)
 
 	xe_display_fini(xe);
 
+	xe_oa_fini(xe);
+
 	xe_heci_gsc_fini(xe);
 
 	xe_irq_shutdown(xe);
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 8629330d928b0..176d3e6ec8464 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -10,6 +10,7 @@
 
 #include "xe_drv.h"
 #include "xe_hw_fence.h"
+#include "xe_oa.h"
 #include "xe_pci.h"
 #include "xe_perf.h"
 #include "xe_pmu.h"
@@ -76,6 +77,10 @@ static const struct init_funcs init_funcs[] = {
 		.init = xe_perf_sysctl_register,
 		.exit = xe_perf_sysctl_unregister,
 	},
+	{
+		.init = xe_oa_sysctl_register,
+		.exit = xe_oa_sysctl_unregister,
+	},
 };
 
 static int __init xe_init(void)
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
new file mode 100644
index 0000000000000..f4cacb4af47c5
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/sysctl.h>
+
+#include "xe_device.h"
+#include "xe_oa.h"
+
+static int xe_oa_sample_rate_hard_limit;
+static u32 xe_oa_max_sample_rate = 100000;
+
+static struct ctl_table_header *sysctl_header;
+
+int xe_oa_init(struct xe_device *xe)
+{
+	/* Choose a representative limit */
+	xe_oa_sample_rate_hard_limit = xe_root_mmio_gt(xe)->info.reference_clock / 2;
+	return 0;
+}
+
+void xe_oa_fini(struct xe_device *xe)
+{
+}
+
+static struct ctl_table oa_ctl_table[] = {
+	{
+	 .procname = "oa_max_sample_rate",
+	 .data = &xe_oa_max_sample_rate,
+	 .maxlen = sizeof(xe_oa_max_sample_rate),
+	 .mode = 0644,
+	 .proc_handler = proc_dointvec_minmax,
+	 .extra1 = SYSCTL_ZERO,
+	 .extra2 = &xe_oa_sample_rate_hard_limit,
+	 },
+	{}
+};
+
+int xe_oa_sysctl_register(void)
+{
+	sysctl_header = register_sysctl("dev/xe", oa_ctl_table);
+	return 0;
+}
+
+void xe_oa_sysctl_unregister(void)
+{
+	unregister_sysctl_table(sysctl_header);
+}
diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
new file mode 100644
index 0000000000000..1b81330c9708b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_OA_H_
+#define _XE_OA_H_
+
+struct xe_device;
+
+int xe_oa_init(struct xe_device *xe);
+void xe_oa_fini(struct xe_device *xe);
+int xe_oa_sysctl_register(void);
+void xe_oa_sysctl_unregister(void);
+
+#endif
-- 
2.41.0

