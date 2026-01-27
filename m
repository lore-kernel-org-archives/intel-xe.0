Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42ECD2D8F7
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 10:54:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C8A10E539;
	Tue, 27 Jan 2026 10:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSR0GfTP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D32710E51A
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 10:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769511254; x=1801047254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gzoEWryi3Dkt1kqqD+KMyBpjwXo1vGNdIxnhEuoFNiA=;
 b=DSR0GfTPcUcuooppbam611iNY65v+spKIWNFC2177XhPj3VnzcgAmi1Z
 OyUadH433vO2FaL6YtybwutfHYPk/VZR+fqmoUP5j34Wt/FFjZsvZXnEV
 0gd9RTUf2MM62iKdFtSJiNjHtLJ7rmmKkuq4xM0Sb8TS8tOQnNnu7NdIz
 7RWMwoPLKBH/uaIYoXGLtgrawEixk1SIdWBJRBD9Ke4XZUkieXsHKADGo
 EM49JT268T8205fRG2+Tgre8DuXx2pNbrSgVlJGleCUWxjTyBKhMM3fN2
 TewS4ixUR8paVMuh4VnXekpcdsuJViwFhyxZTnXfYvrSVGStbWrp9TC43 Q==;
X-CSE-ConnectionGUID: XV8kor8xTXqHv8sY9INHtw==
X-CSE-MsgGUID: n7eRRhR5QvWDspwGd5F0KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70606772"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="70606772"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 02:54:14 -0800
X-CSE-ConnectionGUID: W+TqGTjlTXy6EjRBGJIyyQ==
X-CSE-MsgGUID: kVc9cKVrQeqK6fGIw3uFdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="207965534"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 02:54:09 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v5 4/6] drm/xe/sysctrl: Add System Controller initialization
Date: Tue, 27 Jan 2026 02:53:48 -0800
Message-ID: <20260127105347.2651751-12-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127105347.2651751-8-anoop.c.vijay@intel.com>
References: <20260127105347.2651751-8-anoop.c.vijay@intel.com>
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

Add top-level System Controller initialization and cleanup:
- SOC remapper region configuration
- Mailbox initialization
- Resource cleanup on driver unload

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
v4: (Matt)
- Add MMIO allocation and initialization
---
 drivers/gpu/drm/xe/xe_sysctrl.c | 80 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.h | 13 ++++++
 2 files changed, 93 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h

diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
new file mode 100644
index 000000000000..430bccbdc3b9
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+#include <linux/device.h>
+#include <linux/mutex.h>
+
+#include "regs/xe_sysctrl_regs.h"
+#include "xe_device.h"
+#include "xe_mmio.h"
+#include "xe_printk.h"
+#include "xe_soc_remapper.h"
+#include "xe_sysctrl.h"
+#include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_types.h"
+
+/**
+ * DOC: System Controller (sysctrl)
+ *
+ * The System Controller (sysctrl) is an embedded microcontroller in Intel GPUs
+ * responsible for managing various low-level platform functions. Communication
+ * between the driver and the System Controller occurs via a mailbox interface,
+ * enabling the exchange of commands and responses.
+ *
+ * This module provides initialization routines and helper functions to interact
+ * with the System Controller through the mailbox.
+ */
+
+static void xe_sysctrl_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+
+	xe->soc_remapper.set_sysctrl_region(xe, 0);
+}
+
+/**
+ * xe_sysctrl_init - Initialize System Controller subsystem
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
+	if (!xe->soc_remapper.set_sysctrl_region)
+		return -ENODEV;
+
+	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
+
+	ret = devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, xe);
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
+	ret = drmm_mutex_init(&xe->drm, &sc->cmd_lock);
+	if (ret)
+		return ret;
+
+	xe_sysctrl_mailbox_init(sc);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
new file mode 100644
index 000000000000..ee7826fe4c98
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_SYSCTRL_H_
+#define _XE_SYSCTRL_H_
+
+struct xe_device;
+
+int xe_sysctrl_init(struct xe_device *xe);
+
+#endif /* _XE_SYSCTRL_H_ */
-- 
2.43.0

