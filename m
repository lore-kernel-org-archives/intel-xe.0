Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB4A106B50C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 12:00:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6AB10E894;
	Wed, 25 Mar 2026 12:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lJ6SnXMF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AD110E894
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Mar 2026 12:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774440052; x=1805976052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7tAbVc+/z+JcfYoMkkSCfA7jkNchX0A4SBKc1PNqbDw=;
 b=lJ6SnXMF1FZPynWa/9Nb5yowgxqLIaiBqWLpuYuCj2fPItwxR7Olh3Mw
 w9NxwCotRYNRfnFBOs/kz76/JLxcBK5LTCP7xqIICIVrKpf41+KWNhAs4
 JaTpCs/yxbvXr43mYesWw9og9o1P/X8tsRD5XB95YLWEVseVUBSXdVrXm
 QOdwbvp3jqQQqydYqrwacJ0A6D3JyVejRMb9+YXHkeYjB4AFgTiYgs/2X
 qLfBZyw8P8NIwbpZ3lFQxLcNDtqfYpPDvgpSQFpYhjamoWAo23kAAzljs
 TLFK18PWpshRJE9mOBztuYT8f+r6no6yO5fFcGtfZyQtkeNdh84z4YGR0 Q==;
X-CSE-ConnectionGUID: dm2lRTMgRGyzQzwjjrvf+g==
X-CSE-MsgGUID: nj41B/ImRmyYX9jJSZ3LpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="98094668"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="98094668"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:00:51 -0700
X-CSE-ConnectionGUID: 11AhOfh0SxmGeqmB+QYyZw==
X-CSE-MsgGUID: Q/PMKi3YTLiDSSKaBPZAdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="218087309"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:00:48 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v12 4/7] drm/xe/xe_sysctrl: Add System Controller
 initialization support
Date: Wed, 25 Mar 2026 05:00:31 -0700
Message-ID: <20260325120030.510480-13-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325120030.510480-9-anoop.c.vijay@intel.com>
References: <20260325120030.510480-9-anoop.c.vijay@intel.com>
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
---
 drivers/gpu/drm/xe/Makefile     |  1 +
 drivers/gpu/drm/xe/xe_device.c  |  5 ++
 drivers/gpu/drm/xe/xe_sysctrl.c | 82 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.h | 21 +++++++++
 4 files changed, 109 insertions(+)
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
index c8e91ff464a7..6df85a240f83 100644
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
@@ -985,6 +986,10 @@ int xe_device_probe(struct xe_device *xe)
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
index 000000000000..fd23f345d8c7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -0,0 +1,82 @@
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
+#include "xe_assert.h"
+#include "xe_device.h"
+#include "xe_mmio.h"
+#include "xe_printk.h"
+#include "xe_soc_remapper.h"
+#include "xe_sriov.h"
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
+	if (!xe->info.has_sysctrl)
+		return 0;
+
+	if (IS_SRIOV_VF(xe))
+		return 0;
+
+	xe_assert(xe, xe->soc_remapper.set_sysctrl_region);
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

