Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9883BE6FE24
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 18:39:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FAF10E2B7;
	Tue, 23 Dec 2025 18:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WecPgQIn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C2710E2BA
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Dec 2025 18:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766515189; x=1798051189;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=fPVXnCG+NTrVCicvbVz8G3Nc9Py5rcxubK7QocfCMgI=;
 b=WecPgQInJtniHJcWrHT2yKfpyavL3tU8YgzmUWfryKbGx5F2K0deihPP
 cAzi3JjHOhjAlHgKf5iqzwoO1HmIUHBzTwz6bp0aATVJ3uPkaMsMGE4Oc
 LItHU9HjAjAKhctxuyMu76skySuCt6sesEXqjwfL7ceE4FR2/sFHQQSZ9
 yfd9XPMbbDw8UMwL82tpV/SdFQW6Sk+mD4cE7aQ+ewcXS5jwAMr1yYaR+
 cg9qB9vShYp/iyYl4ib4+LwaqWdiczAfduwoNRUbZmzhEki0bhix5nukE
 j6SmKWHdAfN55t36le+qsdceilajlL9njXEdk0oy9r6JLShGXWSI/9HoT w==;
X-CSE-ConnectionGUID: 2D+C9/bsRBOvG5R/vZIvPg==
X-CSE-MsgGUID: B+CXcFcmQEeseuYCAPTz3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="93839536"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="93839536"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 10:39:48 -0800
X-CSE-ConnectionGUID: i8IwjBauToyEHIvDQE7zFQ==
X-CSE-MsgGUID: 9THAL5K3RjWcGlip0nr6eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="199079222"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 10:39:48 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 1/3] drm/xe/soc_remapper: Initialize SoC remapper during Xe
 probe
Date: Tue, 23 Dec 2025 10:39:45 -0800
Message-ID: <20251223183943.3175941-6-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223183943.3175941-5-umesh.nerlige.ramappa@intel.com>
References: <20251223183943.3175941-5-umesh.nerlige.ramappa@intel.com>
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

v5: Fix malformed comment (CI hooks)
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
index 951387d54295..e101d290b2a6 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -62,6 +62,7 @@
 #include "xe_pxp.h"
 #include "xe_query.h"
 #include "xe_shrinker.h"
+#include "xe_soc_remapper.h"
 #include "xe_survivability_mode.h"
 #include "xe_sriov.h"
 #include "xe_svm.h"
@@ -989,6 +990,10 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_nvm_init(xe);
 
+	err = xe_soc_remapper_init(xe);
+	if (err)
+		return err;
+
 	err = xe_heci_gsc_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6832fdbe2744..69570e21c16b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -578,6 +578,12 @@ struct xe_device {
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
index 000000000000..f2cc1f5b334a
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
+ *
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

