Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A305C07548
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 07:38:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2743B10E4FD;
	Wed, 15 Nov 2023 07:38:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8987910E4F9
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 07:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700033897; x=1731569897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NfxDdPVpAv3ySA6ZUqnvaC/abfGHlOwBZZyvaMTppXs=;
 b=ZR9wxaE1GPsTbXttL4OCNiE6b8pWpwHnIv7UVhpCw5EPzADJDN9gJKuO
 fDb7kNJ7/4CTVjk4gLsRBrBh2SgawGfGJxDYQv4JyfhYoOIF7PUrBym0V
 BBZPXVwhYuKWqM8Grtuqk79/VJmSQkUHOB0r+ImGLfNpMCLVqrf8Sn+j3
 +9hEDSScnhkhJvCBv6XEgpnn3gSyJYZSb4CyVvm2kDeaZgzmnxTPmGaL4
 6mIicSddibMZwHtuSU2FAF5qB97BrWZikQPN4ZYrIrbc/TRtKF+ilDDfM
 ScfXH45yXiLQCJ/8IHVYboyDKCP1l7I81Zn07VnRfzPINXiyjWYIT4FJW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="393689395"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="393689395"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 23:38:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="1096371386"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="1096371386"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.134.235])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 23:38:16 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 08:38:03 +0100
Message-Id: <20231115073804.1861-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231115073804.1861-1-michal.wajdeczko@intel.com>
References: <20231115073804.1861-1-michal.wajdeczko@intel.com>
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
 drivers/gpu/drm/xe/xe_sriov_types.h  | 28 ++++++++++++++
 6 files changed, 138 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_types.h

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
diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
new file mode 100644
index 000000000000..999a4311b98b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_types.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_TYPES_H_
+#define _XE_SRIOV_TYPES_H_
+
+#include <linux/build_bug.h>
+
+/**
+ * enum xe_sriov_mode - SR-IOV mode
+ * @XE_SRIOV_MODE_NONE: bare-metal mode (non-virtualized)
+ * @XE_SRIOV_MODE_PF: SR-IOV Physical Function (PF) mode
+ * @XE_SRIOV_MODE_VF: SR-IOV Virtual Function (VF) mode
+ */
+enum xe_sriov_mode {
+	/*
+	 * Note: We don't use default enum value 0 to allow catch any too early
+	 * attempt of checking the SR-IOV mode prior to the actual mode probe.
+	 */
+	XE_SRIOV_MODE_NONE = 1,
+	XE_SRIOV_MODE_PF,
+	XE_SRIOV_MODE_VF,
+};
+static_assert(XE_SRIOV_MODE_NONE);
+
+#endif
-- 
2.25.1

