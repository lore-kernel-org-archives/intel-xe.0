Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8839DE668AE
	for <intel-xe@archiver.kernel.org>; Sat, 20 Dec 2025 01:44:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418EE10E0BE;
	Sat, 20 Dec 2025 01:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="APP8cPVq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E6C10E0A6
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Dec 2025 01:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766195089; x=1797731089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/NwEfm4yfoshqrXSQ9RUV4HDuD5D/YgJm6N2I62Ck1o=;
 b=APP8cPVqXtD2W746SGQyw8JAT7KEaY7nrcinlOrzlAtXmduhkF3Y9Qs9
 soi2nHw3Zq4EdkxtZHlTd/IPEytqrsrqF+dkXUYWmv0T8AV/KRtBcFlxL
 2TpdZLI3ZAdOABDgZ/xOgTxACfZoC/eKmbMHDqdCoq90v6j2trKWaIP1V
 zur8s8/dqRRTHvtXcsGaw2Z0xRAcRTILMmM//OJWyIrmWAew/4NssQ4fv
 B0N91+GjkGd7VLFFP90LOdWJGMB0+mXghOarqB+3L9vQQGnzXiel2DFef
 MYx/9WtFWAhfuW8pQ45YWNHThRTozMowC5ZGCABsvAmYLYYgU1j04XNiK g==;
X-CSE-ConnectionGUID: bKT/tR8CRjq9N1EnG1f8zw==
X-CSE-MsgGUID: RNn3l1CJQY6tpygCwm/2wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="79273651"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="79273651"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 17:44:49 -0800
X-CSE-ConnectionGUID: 4AuJ+hOZQ8qhiRn4eJD/8Q==
X-CSE-MsgGUID: HH1QlzJXSZa9rXiEL17g1w==
X-ExtLoop1: 1
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 17:44:48 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v6 1/3] drm/xe/soc_remapper: Initialize SoC remapper during Xe
 probe
Date: Fri, 19 Dec 2025 17:44:44 -0800
Message-ID: <20251220014442.3076408-6-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251220014442.3076408-5-umesh.nerlige.ramappa@intel.com>
References: <20251220014442.3076408-5-umesh.nerlige.ramappa@intel.com>
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
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
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
index 47e7912ce634..37a6583993d1 100644
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

