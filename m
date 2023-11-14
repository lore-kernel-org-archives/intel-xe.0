Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EF1C46CC8
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 23:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2186210E4DF;
	Tue, 14 Nov 2023 23:06:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79DB10E409
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 23:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700003172; x=1731539172;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ch1G7uBlfJEhMqTaGwQLblShE+W4ntfSpSXNlcGnBAQ=;
 b=aLvpupkCIGv9kZtmvBndjGwqiPjFWvi/3iQ+922qSdeVc9jj7najD/6/
 vWSkDT3ojok5CRJQnDYRav/ekn5AEFPismwxmre6i/FjP4BmsgUZK4MlI
 hfnG32GTbmo02XRzlrUkm/Y2cU15tjBX85ztS0rREOO96zNfYharg51s6
 Jo8wLT0EoQeYdM/oQnoWkQyfvZb8JcasyRJqmWjlryxM9C4umOMUU5Sse
 lhtrIfkfcx6zibrD/Eme4P3tr1oeIh2uykBhaY2O+3mNSR5dNkF1alLaE
 exRWhlZjJlM1gnV9fJuH5ibYMoBnbmISvoKrp0azUVUq3bgjmegNnt6bv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="421864119"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="421864119"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 15:06:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="1096258510"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="1096258510"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.134.195])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 15:06:11 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 00:05:57 +0100
Message-Id: <20231114230558.1774-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231114230558.1774-1-michal.wajdeczko@intel.com>
References: <20231114230558.1774-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Prepare for running in different
 SR-IOV modes
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

We will be adding support for the SR-IOV and driver might be then
running, in addition to existing non-virtualized bare-metal mode,
also in Physical Function (PF) or Virtual Function (VF) mode.

Since these additional modes require some changes to the driver,
define enum flag to represent different SR-IOV modes and add a
function where we will detect the actual mode in the runtime.

We start with a forced bare-metal mode as it is sufficient to
enable basic functionality and ensures no impact to existing code.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  3 ++
 drivers/gpu/drm/xe/xe_device_types.h |  7 ++++
 drivers/gpu/drm/xe/xe_pci.c          |  3 ++
 drivers/gpu/drm/xe/xe_sriov.c        | 55 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov.h        | 42 +++++++++++++++++++++
 5 files changed, 110 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index cb41b4fead08..fbba74d9a330 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -123,6 +123,9 @@ xe-y += xe_bb.o \
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
 
+# graphics virtualization (SR-IOV) support
+xe-y += xe_sriov.o
+
 # i915 Display compat #defines and #includes
 subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
 	-I$(srctree)/$(src)/display/ext \
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f2ba4f746fa2..2712905c7a91 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -18,6 +18,7 @@
 #include "xe_platform_types.h"
 #include "xe_pt_types.h"
 #include "xe_pmu.h"
+#include "xe_sriov_types.h"
 #include "xe_step_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
@@ -299,6 +300,12 @@ struct xe_device {
 		struct ttm_resource_manager sys_mgr;
 	} mem;
 
+	/** @sriov: device level virtualization data */
+	struct {
+		/** @sriov.__mode: SR-IOV mode (Don't access directly!) */
+		enum xe_sriov_mode __mode;
+	} sriov;
+
 	/** @usm: unified memory state */
 	struct {
 		/** @asid: convert a ASID to VM */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c1c8048bbc0f..3030b223e4a0 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -24,6 +24,7 @@
 #include "xe_module.h"
 #include "xe_pci_types.h"
 #include "xe_pm.h"
+#include "xe_sriov.h"
 #include "xe_step.h"
 
 enum toggle_d3cold {
@@ -706,6 +707,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_master(pdev);
 
+	xe_sriov_probe_early(xe, desc->has_sriov);
+
 	err = xe_info_init(xe, desc, subplatform_desc);
 	if (err)
 		goto err_pci_disable;
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
new file mode 100644
index 000000000000..42a0e0c917a0
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_assert.h"
+#include "xe_sriov.h"
+
+/**
+ * xe_sriov_mode_to_string - Convert enum value to string.
+ * @mode: the &xe_sriov_mode to convert
+ *
+ * Returns: SR-IOV mode as a user friendly string.
+ */
+const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode)
+{
+	switch (mode) {
+	case XE_SRIOV_MODE_NONE:
+		return "none";
+	case XE_SRIOV_MODE_PF:
+		return "SR-IOV PF";
+	case XE_SRIOV_MODE_VF:
+		return "SR-IOV VF";
+	default:
+		return "<invalid>";
+	}
+}
+
+/**
+ * xe_sriov_probe_early - Probe a SR-IOV mode.
+ * @xe: the &xe_device to probe mode on
+ * @has_sriov: flag indicating hardware support for SR-IOV
+ *
+ * This function should be called only once and as soon as possible during
+ * driver probe to detect whether we are running a SR-IOV Physical Function
+ * (PF) or a Virtual Function (VF) device.
+ *
+ * SR-IOV PF mode detection is based on PCI @dev_is_pf() function.
+ * SR-IOV VF mode detection is based on dedicated MMIO register read.
+ */
+void xe_sriov_probe_early(struct xe_device *xe, bool has_sriov)
+{
+	enum xe_sriov_mode mode = XE_SRIOV_MODE_NONE;
+
+	/* TODO: replace with proper mode detection */
+	xe_assert(xe, !has_sriov);
+
+	xe_assert(xe, !xe->sriov.__mode);
+	xe->sriov.__mode = mode;
+	xe_assert(xe, xe->sriov.__mode);
+
+	if (has_sriov)
+		drm_info(&xe->drm, "Running in %s mode\n",
+			 xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
new file mode 100644
index 000000000000..5af73a3172b0
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_H_
+#define _XE_SRIOV_H_
+
+#include "xe_assert.h"
+#include "xe_device_types.h"
+#include "xe_sriov_types.h"
+
+const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode);
+
+void xe_sriov_probe_early(struct xe_device *xe, bool has_sriov);
+
+static inline enum xe_sriov_mode xe_device_sriov_mode(struct xe_device *xe)
+{
+	xe_assert(xe, xe->sriov.__mode);
+	return xe->sriov.__mode;
+}
+
+static inline bool xe_device_is_sriov_pf(struct xe_device *xe)
+{
+	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_PF;
+}
+
+static inline bool xe_device_is_sriov_vf(struct xe_device *xe)
+{
+	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_VF;
+}
+
+#ifdef CONFIG_PCI_IOV
+#define IS_SRIOV_PF(xe) xe_device_is_sriov_pf(xe)
+#else
+#define IS_SRIOV_PF(xe) (typecheck(struct xe_device *, (xe)) && false)
+#endif
+#define IS_SRIOV_VF(xe) xe_device_is_sriov_vf(xe)
+
+#define IS_SRIOV(xe) (IS_SRIOV_PF(xe) || IS_SRIOV_VF(xe))
+
+#endif
-- 
2.25.1

