Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBDBD58E73
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 08:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113BD10E44B;
	Mon,  2 Mar 2026 08:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KqyH5dC5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D5610E44B
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 08:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772439014; x=1803975014;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oeaYTP3N5SWcewtojoTwUx177AzgdDZzD1rnZZC3qKk=;
 b=KqyH5dC5LjbBq6NzyXDMt6NgDxvsYN3m1ZqhEQnVaFIKCpMd09OZ7pf1
 uPc91rhGNcMt+KQGc9qqm8cWz9ot8dzBaSJcMJcBso3AAT/I9dpnnoBCV
 O9HPUySLK1PhtF9T9xwHalIpCUlunhdRyDiWMnyGa5QRiMs1dmiecgdqz
 POpnYvJdwdrVC2ovEjUYj3pOJb3fAtzVtuHNcgmZnZj26nH272k5ICvMx
 GhSmPonqbNms1yI7nOCPBEoClxzTi7+bAIj3BldqxA+0RrWfi5V/VasQi
 brzuF9gkSYrVCIxBOGBoewuPEaPt5YtwiDSu4nipqtRXtLGX0W4mw6oBf Q==;
X-CSE-ConnectionGUID: lwQUmboTThurRFpvhA6rOw==
X-CSE-MsgGUID: D5RTLFJPQ+mHfzVACm5I2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84790259"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="84790259"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 00:10:13 -0800
X-CSE-ConnectionGUID: 6KtxTUPVShyhnX+x1rXVfg==
X-CSE-MsgGUID: p1y0CtO+R7Gin7mYclY+Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="214079135"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 00:10:10 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v8 1/6] drm/xe/sysctrl: Add System Controller types and device
 integration
Date: Mon,  2 Mar 2026 00:10:03 -0800
Message-ID: <20260302081002.3275868-9-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302081002.3275868-8-anoop.c.vijay@intel.com>
References: <20260302081002.3275868-8-anoop.c.vijay@intel.com>
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

Add foundational type definitions for System Controller support and
integrate them into xe_device structure. Also add has_sysctrl
capability flag to device descriptor and runtime info.

No functional changes. This is preparatory infrastructure for
System Controller support.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
v4: (Matt, Mike)
- Add domain-specific MMIO accessor
- Change phase_bit type from u32 to bool

v6: (Matt)
- Add mailbox protocol constants

v8: (Matt, Michal)
- Reordered patches for logical flow
---
 drivers/gpu/drm/xe/xe_device_types.h  |  6 +++++
 drivers/gpu/drm/xe/xe_pci_types.h     |  1 +
 drivers/gpu/drm/xe/xe_sysctrl_types.h | 32 +++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index caa8f34a6744..ec66ef772cd6 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -26,6 +26,7 @@
 #include "xe_sriov_vf_ccs_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
+#include "xe_sysctrl_types.h"
 #include "xe_tile_types.h"
 #include "xe_validation.h"
 
@@ -203,6 +204,8 @@ struct xe_device {
 		u8 has_soc_remapper_telem:1;
 		/** @info.has_sriov: Supports SR-IOV */
 		u8 has_sriov:1;
+		/** @info.has_sysctrl: Supports System Controller */
+		u8 has_sysctrl:1;
 		/** @info.has_usm: Device has unified shared memory support */
 		u8 has_usm:1;
 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
@@ -512,6 +515,9 @@ struct xe_device {
 	/** @i2c: I2C host controller */
 	struct xe_i2c *i2c;
 
+	/** @sc: System Controller */
+	struct xe_sysctrl sc;
+
 	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
 	u32 atomic_svm_timeslice_ms;
 
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 47e8a1552c2b..6ffef99b7973 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -57,6 +57,7 @@ struct xe_device_desc {
 	u8 has_soc_remapper_sysctrl:1;
 	u8 has_soc_remapper_telem:1;
 	u8 has_sriov:1;
+	u8 has_sysctrl:1;
 	u8 needs_scratch:1;
 	u8 skip_guc_pc:1;
 	u8 skip_mtcfg:1;
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
new file mode 100644
index 000000000000..c1a3f4c835b8
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_SYSCTRL_TYPES_H_
+#define _XE_SYSCTRL_TYPES_H_
+
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+struct xe_mmio;
+
+/**
+ * struct xe_sysctrl - System Controller driver context
+ *
+ * This structure maintains the runtime state for System Controller
+ * communication. All fields are initialized during xe_sysctrl_init()
+ * and protected appropriately for concurrent access.
+ */
+struct xe_sysctrl {
+	/** @mmio: MMIO region for system control registers */
+	struct xe_mmio *mmio;
+
+	/** @cmd_lock: Mutex protecting mailbox command operations */
+	struct mutex cmd_lock;
+
+	/** @phase_bit: MKHI message boundary phase toggle bit (0 or 1) */
+	bool phase_bit;
+};
+
+#endif
-- 
2.43.0

