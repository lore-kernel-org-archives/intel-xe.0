Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AB210ED67A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 13:19:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBD910EE52;
	Fri, 27 Mar 2026 13:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X+hs/fUC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D7710EE52
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 13:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774617552; x=1806153552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5paNAgfY/pEtesn2fvcz2mKOgxl0CsqF/xwkQ/JZyLE=;
 b=X+hs/fUCRdReY3XIX2delVv4DCyDgzjGMQSwTPKLlQKZROJjsBYwRzAN
 s/YJhDCm9oRtvfchHkGUjUXfnXnSOmR1d3I+46/lNargml3XJ/1nhV6XA
 tOoNZ8+QmnNwjYLcaHtZ45gpmLSrOydT4ue7DR2KM1/lXKLLXgLSYJvaR
 19EYdCI6lrc088SdBQN1cDhUUaQg+GVbtytcBuIrOEJQsWdEArKwRuBn8
 dPUt13f0tBZFnAsPq7Q7uVAbzwKFxhRcIua2QDPQcIT9kq8rwdNr+Fj21
 tFEIzqhy/WALBjoqLs6fMEZ1LWQj0ZJvzB0jbR1EkKlKgoS0A8VrqVA7G Q==;
X-CSE-ConnectionGUID: d56eDBE5QIWXt2gS3Uz9MA==
X-CSE-MsgGUID: L3+Vf3AlSJaJlgg8262qNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75656115"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="75656115"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:19:00 -0700
X-CSE-ConnectionGUID: 8K/fStupQaOJ/LkWBv/t6A==
X-CSE-MsgGUID: PL3ONMbhRAugL5S55KV5eg==
X-ExtLoop1: 1
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:18:56 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v13 4/7] drm/xe/xe_sysctrl: Add System Controller
 initialization support
Date: Fri, 27 Mar 2026 06:18:41 -0700
Message-ID: <20260327131837.2192929-13-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327131837.2192929-9-anoop.c.vijay@intel.com>
References: <20260327131837.2192929-9-anoop.c.vijay@intel.com>
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

Add initialization and cleanup infrastructure for System Controller
subsystem and integrate it into xe device probe path.

During initialization, platform support is checked via has_sysctrl
capability flag and the mailbox region is configured through SoC
remapper interface.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v8: (Matt, Michal, Shuicheng)
- Fixed include order
- Added VF check
- Converted runtime checks to assertions
- Added sc_to_xe() helper
- Fixed kernel-doc syntax

v10: (Riana, Anshuman)
- Updated sysctrl documentation
- Cleaned up commit message
- Fixed mutex lifetime management

v13: (Umesh)
- Drop VF-specific checks from sysctrl code
- Gate sysctrl paths on has_sysctrl and has_soc_remapper_sysctrl
- Return early when SoC remapper or sysctrl is absent
- Replace sysctrl asserts with error returns
---
 drivers/gpu/drm/xe/Makefile     |  1 +
 drivers/gpu/drm/xe/xe_device.c  |  5 +++
 drivers/gpu/drm/xe/xe_sysctrl.c | 77 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.h | 21 +++++++++
 4 files changed, 104 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 49de1c22a469..b2d44e7169dd 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -123,6 +123,7 @@ xe-y += xe_bb.o \
 	xe_step.o \
 	xe_survivability_mode.o \
 	xe_sync.o \
+	xe_sysctrl.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
 	xe_tlb_inval.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9b0540e3e289..968cc6c101a2 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -65,6 +65,7 @@
 #include "xe_survivability_mode.h"
 #include "xe_sriov.h"
 #include "xe_svm.h"
+#include "xe_sysctrl.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
@@ -984,6 +985,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	err = xe_sysctrl_init(xe);
+	if (err)
+		goto err_unregister_display;
+
 	err = xe_device_sysfs_init(xe);
 	if (err)
 		goto err_unregister_display;
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
new file mode 100644
index 000000000000..f1b3af1748ad
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/device.h>
+#include <linux/mutex.h>
+
+#include <drm/drm_managed.h>
+
+#include "regs/xe_sysctrl_regs.h"
+#include "xe_device.h"
+#include "xe_mmio.h"
+#include "xe_soc_remapper.h"
+#include "xe_sysctrl.h"
+#include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_types.h"
+
+/**
+ * DOC: System Controller (sysctrl)
+ *
+ * System Controller (sysctrl) is a firmware-managed entity on Intel dGPUs
+ * responsible for selected low-level platform management functions.
+ * Communication between driver and System Controller is performed
+ * via a mailbox interface, enabling command and response exchange.
+ *
+ * This module provides initialization and support code for interacting
+ * with System Controller through the mailbox interface.
+ */
+static void sysctrl_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+
+	xe->soc_remapper.set_sysctrl_region(xe, 0);
+}
+
+/**
+ * xe_sysctrl_init() - Initialize System Controller subsystem
+ * @xe: xe device instance
+ *
+ * Entry point for System Controller initialization, called from xe_device_probe.
+ * This function checks platform support and initializes the system controller.
+ *
+ * Return: 0 on success, error code on failure
+ */
+int xe_sysctrl_init(struct xe_device *xe)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_sysctrl *sc = &xe->sc;
+	int ret;
+
+	if (!xe->info.has_soc_remapper_sysctrl)
+		return 0;
+
+	if (!xe->info.has_sysctrl)
+		return 0;
+
+	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
+
+	ret = devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
+	if (ret)
+		return ret;
+
+	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
+	if (!sc->mmio)
+		return -ENOMEM;
+
+	xe_mmio_init(sc->mmio, tile, tile->mmio.regs, tile->mmio.regs_size);
+	sc->mmio->adj_offset = SYSCTRL_BASE;
+	sc->mmio->adj_limit = U32_MAX;
+
+	ret = devm_mutex_init(xe->drm.dev, &sc->cmd_lock);
+	if (ret)
+		return ret;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
new file mode 100644
index 000000000000..d5d8735038ae
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_SYSCTRL_H_
+#define _XE_SYSCTRL_H_
+
+#include <linux/container_of.h>
+
+#include "xe_device_types.h"
+#include "xe_sysctrl_types.h"
+
+static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
+{
+	return container_of(sc, struct xe_device, sc);
+}
+
+int xe_sysctrl_init(struct xe_device *xe);
+
+#endif
-- 
2.43.0

