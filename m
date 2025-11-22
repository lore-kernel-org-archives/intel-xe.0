Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4617BCFC515
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 04:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4ABE10E174;
	Sat, 22 Nov 2025 04:58:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yfx/20Bs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769AC10E174
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 04:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763787500; x=1795323500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=riVb1xxw8dYWRTYfK63nMPxFPk3KFZJ1o1UTYEe5vJw=;
 b=Yfx/20BsjfwNCscWw5tn+CRVCbqDw4l167kOVDsfA0aUcZTrpr4KbmEQ
 x/oVKwlF9SfPWlpdDA49vwgBHMZ1PgqFKgKsPxZVbs7sG0+/aEOfqVr+5
 jaAXSGw+dVm6AkMAo9zlgyq0tjIzXogS8c/M2kabqfym+8FDboZ3Ao0bz
 GHUcrvuEhUpLfwaO25nFXUgM4ACPjYTEM8XYWCpQasUJ8ElLDqri8ElEG
 iFpJ+e5nOXM7yG9JMCr0czpIiJPL8q5AJDtfw/8dTyr/+TVenWWkt3ENe
 THArAjpSyzfjKc1XtJM7SWCoqHsPkLjeDODcFP5dY4qXgJmXT9AuJl4l4 w==;
X-CSE-ConnectionGUID: TN3YuV5eT5SdExEWIpTJBw==
X-CSE-MsgGUID: wpVjdcZrTn2Wwtvc6t8JoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65921453"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="65921453"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 20:58:20 -0800
X-CSE-ConnectionGUID: sannqGNwQXec4QV+XgIwng==
X-CSE-MsgGUID: DLbQZnorSGe4ShfLIXgjqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="191976551"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 20:58:16 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, badal.nilawar@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, mohamed.mansoor.v@intel.com, kam.nasim@intel.com,
 anoop.c.vijay@intel.com
Subject: [RFC 1/5] drm/xe/soc_remapper: Initialize SoC remapper during Xe probe
Date: Fri, 21 Nov 2025 20:58:03 -0800
Message-ID: <20251122045803.3616201-8-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251122045803.3616201-7-anoop.c.vijay@intel.com>
References: <20251122045803.3616201-7-anoop.c.vijay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

SoC remapper is used to map different HW functions in the SoC to their
respective drivers. Initialize SoC remapper during driver load.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
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
index 1a3aa041820d..7ebfbf9051bf 100644
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
index 1197f914ef77..f15489c100af 100644
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
@@ -906,6 +907,10 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_nvm_init(xe);
 
+	err = xe_soc_remapper_init(xe);
+	if (err)
+		return err;
+
 	err = xe_heci_gsc_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0b2fa7c56d38..4d23b75bc728 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -552,6 +552,12 @@ struct xe_device {
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

