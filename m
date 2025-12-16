Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7DCD5B161
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 07:42:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C90310E08B;
	Tue, 16 Dec 2025 07:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lszTF4kH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8FB10E3BD
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765870925; x=1797406925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nQprQKUoh2Q4Ey/3g4UByTpjKGkQDPxG2aJ9y7N5h/4=;
 b=lszTF4kHmk624umKA9q8lfmiQCsHGzzcFqQoVoMX1kHkTS2+YpyT5ZlO
 jig0u4bxPQl9rS73Z2MtuYvrMP9Ruun9xc7Z0CqBqQj6i/YKurKSVyVGw
 CUBFRi4WxKvqhKsp17QbXpMfapp1nB/Jy0mEPfvLGITqfe3/63ztdfG1O
 JTZnlZ1j48M9VxqRMJyXZX2AE2bzNwPa3X4g1QfwjOB1cGhy06rB0e4sz
 YZfyfOq5K71LZtdWGIOEjwneMFZKIKW//sM7zWnn1yd2Oc9A1MIU7GNOM
 0a/A6+8y10Ugm4Q3e8ZU+rhVjvSpggUzRl8zfasfUfHfNTbMO4gl2doeu A==;
X-CSE-ConnectionGUID: GyduWXwAQkGQZ1fcjb8DEA==
X-CSE-MsgGUID: BnosdIYSTIewb2zyN3/S1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78420939"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="78420939"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 23:42:04 -0800
X-CSE-ConnectionGUID: tvlL+xCaT+CooUNSFiUMcA==
X-CSE-MsgGUID: nYCUEWSqShmsVXzDUkcLPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="203050813"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 23:42:04 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v5 1/3] drm/xe/soc_remapper: Initialize SoC remapper during Xe
 probe
Date: Mon, 15 Dec 2025 23:42:01 -0800
Message-ID: <20251216074159.2788534-6-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216074159.2788534-5-umesh.nerlige.ramappa@intel.com>
References: <20251216074159.2788534-5-umesh.nerlige.ramappa@intel.com>
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

v3: (Michal, Badal)
- Kernel doc fixes
- Alphabetical order for headers/objects
- Add has_soc_remapper
- Drop unnecessary headers

v4: (Badal)
- Telem and SC need separate has_ checks
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device.c       |  5 +++++
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
 drivers/gpu/drm/xe/xe_soc_remapper.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_soc_remapper.h | 13 +++++++++++++
 5 files changed, 46 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.c
 create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 8b43e391b3d3..fda2e5e9dcc9 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -116,6 +116,7 @@ xe-y += xe_bb.o \
 	xe_sa.o \
 	xe_sched_job.o \
 	xe_shrinker.o \
+	xe_soc_remapper.o \
 	xe_step.o \
 	xe_survivability_mode.o \
 	xe_sync.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 00afc84a8683..937e43591ed9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -61,6 +61,7 @@
 #include "xe_pxp.h"
 #include "xe_query.h"
 #include "xe_shrinker.h"
+#include "xe_soc_remapper.h"
 #include "xe_survivability_mode.h"
 #include "xe_sriov.h"
 #include "xe_tile.h"
@@ -969,6 +970,10 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_nvm_init(xe);
 
+	err = xe_soc_remapper_init(xe);
+	if (err)
+		return err;
+
 	err = xe_heci_gsc_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 413ba4c8b62e..6da897b9f006 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -573,6 +573,12 @@ struct xe_device {
 		struct mutex lock;
 	} pmt;
 
+	/** @soc_remapper: SoC remapper object */
+	struct {
+		/** @soc_remapper.lock: Serialize access to SoC Remapper's index registers */
+		spinlock_t lock;
+	} soc_remapper;
+
 	/**
 	 * @pm_callback_task: Track the active task that is running in either
 	 * the runtime_suspend or runtime_resume callbacks.
diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
new file mode 100644
index 000000000000..8a6749918436
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_soc_remapper.h"
+
+/**
+ * xe_soc_remapper_init() - Initialize SoC remapper
+ * @xe: Pointer to xe device.
+ *
+ * Initialize SoC remapper.
+
+ * Return: 0 on success, error code on failure
+ */
+int xe_soc_remapper_init(struct xe_device *xe)
+{
+	spin_lock_init(&xe->soc_remapper.lock);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.h b/drivers/gpu/drm/xe/xe_soc_remapper.h
new file mode 100644
index 000000000000..1060ad0f5abc
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_soc_remapper.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SOC_REMAPPER_H_
+#define _XE_SOC_REMAPPER_H_
+
+#include "xe_device_types.h"
+
+int xe_soc_remapper_init(struct xe_device *xe);
+
+#endif
-- 
2.43.0

