Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB9FCEBF91
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 20:53:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3598C10E1CC;
	Mon, 17 Nov 2025 20:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IqNV8TPO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CE310E1CB
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 20:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763412802; x=1794948802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SY7K+U1zjSlPvr9cTwpOn3qhuSZLKJa1LoB4BSBt4Vc=;
 b=IqNV8TPOsgzxZ01NO4S703r5iqG5Xf8agu5calfN16UcMXqp+7HEsfzR
 UuxKaAM6hJKKGRfXQGT4jvQalyDvESR9k++TU65v5BbS104p/W+rwJS3Y
 nSP1YllvHtSoqXV0jsWxO//yrVzruXJXCx/xCgGdcIkgmi/Lc0xQLvB05
 JQwPv8D2Ttc1EFG8DXHcoV1+5fNKAPMTv/+Utq9vXMj/vD3i2kgMhjbAD
 cTq+hDriVQ65gljGBaK/bV9iJM8Ul6T83sL5RoaW6nys4gwcSigrJI90A
 Jhr8AWUL1GjNpaI+rdVrPPhagjIZapvPobEQGETi2xmTZbZOEiG5N0vZs Q==;
X-CSE-ConnectionGUID: MzyIMSFcRlui9/AvnDIGqw==
X-CSE-MsgGUID: 6K6OXGtmSd6ea7nE8KM74Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65516552"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="65516552"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 12:53:21 -0800
X-CSE-ConnectionGUID: KcGKeQDyTRmVOjuug81TLQ==
X-CSE-MsgGUID: bFv5w2qwQFeK4iLl1ebUjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="190227338"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 12:53:21 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com, lucas.demarchi@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH v2 1/4] drm/xe/soc_remapper: Initialize SoC remapper during Xe
 probe
Date: Mon, 17 Nov 2025 12:53:17 -0800
Message-ID: <20251117205315.1458477-7-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117205315.1458477-6-umesh.nerlige.ramappa@intel.com>
References: <20251117205315.1458477-6-umesh.nerlige.ramappa@intel.com>
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

SoC remapper is used to map different HW functions in the SoC to their
respective drivers. Initialize SoC remapper during driver load.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2: (Ashutosh/Lucas)
- s/remapper/soc_remapper/
- return status from init during probe
- reorder patches 1 and 2 from earlier series
- fix copyright year
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device.c       |  5 +++++
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
 drivers/gpu/drm/xe/xe_soc_remapper.c | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_soc_remapper.h | 15 +++++++++++++++
 5 files changed, 42 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.c
 create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 8aa85c93b3d6..977b75336016 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -110,6 +110,7 @@ xe-y += xe_bb.o \
 	xe_range_fence.o \
 	xe_reg_sr.o \
 	xe_reg_whitelist.o \
+	xe_soc_remapper.o \
 	xe_ring_ops.o \
 	xe_rtp.o \
 	xe_sa.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9f2f19dc1fd3..0d51502af30e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -60,6 +60,7 @@
 #include "xe_psmi.h"
 #include "xe_pxp.h"
 #include "xe_query.h"
+#include "xe_soc_remapper.h"
 #include "xe_shrinker.h"
 #include "xe_survivability_mode.h"
 #include "xe_sriov.h"
@@ -911,6 +912,10 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_nvm_init(xe);
 
+	err = xe_soc_remapper_init(xe);
+	if (err)
+		return err;
+
 	err = xe_heci_gsc_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a03cc83aa26f..de23fff3262c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -547,6 +547,12 @@ struct xe_device {
 		struct mutex lock;
 	} pmt;
 
+	/* @soc_remapper: SoC remapper object */
+	struct {
+		/* Serialize access to SoC Remapper's index registers */
+		spinlock_t lock;
+	} soc_remapper;
+
 	/**
 	 * @pm_callback_task: Track the active task that is running in either
 	 * the runtime_suspend or runtime_resume callbacks.
diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
new file mode 100644
index 000000000000..f5a02abd6ab1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/spinlock.h>
+
+#include "xe_soc_remapper.h"
+
+int xe_soc_remapper_init(struct xe_device *xe)
+{
+	spin_lock_init(&xe->soc_remapper.lock);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.h b/drivers/gpu/drm/xe/xe_soc_remapper.h
new file mode 100644
index 000000000000..3cfd44f1fd74
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_soc_remapper.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SOC_REMAPPER_H_
+#define _XE_SOC_REMAPPER_H_
+
+#include <linux/types.h>
+
+#include "xe_device_types.h"
+
+int xe_soc_remapper_init(struct xe_device *xe);
+
+#endif
-- 
2.43.0

