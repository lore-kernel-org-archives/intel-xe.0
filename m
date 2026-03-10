Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9A6FD4F19
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 18:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC53110E2CD;
	Tue, 10 Mar 2026 18:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ci8KE6Ap";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE3F10E2CD
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 18:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773167028; x=1804703028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TiABjjmuEPrqAHUgtk93qbwhRElB9z8OkCCs9uFKEzY=;
 b=ci8KE6ApnYF/Yon/wbOSGLnoZ7Rylqg48Z3CXdRLu2TXKw+i8wYj/xwX
 mvVWRdSjujMVFwb0LRbgJ5Sh6Y+nEfhuBNSqoAwYkLQN6y4Xl/2pTGIhS
 odVS0ThSjDomYXkd47O2P04FrK/96V1ynAMw1LCWG4mCS8syvnQdl5+/+
 71E17qoj9Ft23y5AF213EQRlO4Pn3ngO7zwHxhxYQ+dwdlj6i5n2TeTA7
 T2nRp9q7ZPREspxFGoakIOxKcY81d/pUTIFrIqqBLThXNLB0wtqBkNHif
 Kd6wM9kv58rFKN8e+oqkT3rtw/1cLm65jF95YZUEWfbyT8a4Yh3uR2sLA w==;
X-CSE-ConnectionGUID: ykm2kSL1Q/yDxZOO2g5/mA==
X-CSE-MsgGUID: HW0H4uC0S2e409IGE4ck0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="78109807"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="78109807"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 11:23:48 -0700
X-CSE-ConnectionGUID: FfVVzNacSjS1uoRxhM/XLw==
X-CSE-MsgGUID: eSQwH5KNQZWvf0YwbSW/Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="258127616"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 11:23:44 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v9 1/6] drm/xe/sysctrl: Add System Controller types and device
 integration
Date: Tue, 10 Mar 2026 11:23:20 -0700
Message-ID: <20260310182336.611041-9-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310182336.611041-8-anoop.c.vijay@intel.com>
References: <20260310182336.611041-8-anoop.c.vijay@intel.com>
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

Add foundational type definitions for System Controller (sysctrl)
support and integrate them into xe_device structure. Also add a
 capability flag to device descriptor and runtime
info.

System Controller is a separate management entity responsible for
certain platform-level control and coordination tasks in Intel Xe3p
dGPU platforms. Driver communicates with it via a mailbox interface
using SCHI (System Controller Host Interface) protocol for operations
delegated to this controller.

This commit introduces core data structures required for sysctrl
support, including MMIO region, command mutex, and phase bit used
by SCHI protocol.  flag explicitly records presence of
sysctrl hardware on supported platforms.

No functional changes. This is preparatory infrastructure for System
Controller support.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
v4: (Matt, Mike)
- Add domain-specific MMIO accessor
- Change phase_bit type from u32 to bool

v6: (Matt)
- Add mailbox protocol constants

v8: (Matt, Michal)
- Reordered patches for logical flow

v9: (Matt)
- Extended commit message to explain System Controller and purpose of
  `has_sysctrl` flag
---
 drivers/gpu/drm/xe/xe_device_types.h  |  6 +++++
 drivers/gpu/drm/xe/xe_pci_types.h     |  1 +
 drivers/gpu/drm/xe/xe_sysctrl_types.h | 32 +++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 3e04e80e0815..2990c1e76687 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -27,6 +27,7 @@
 #include "xe_sriov_vf_ccs_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
+#include "xe_sysctrl_types.h"
 #include "xe_tile_types.h"
 #include "xe_validation.h"
 
@@ -206,6 +207,8 @@ struct xe_device {
 		u8 has_soc_remapper_telem:1;
 		/** @info.has_sriov: Supports SR-IOV */
 		u8 has_sriov:1;
+		/** @info.has_sysctrl: Supports System Controller */
+		u8 has_sysctrl:1;
 		/** @info.has_usm: Device has unified shared memory support */
 		u8 has_usm:1;
 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
@@ -518,6 +521,9 @@ struct xe_device {
 	/** @i2c: I2C host controller */
 	struct xe_i2c *i2c;
 
+	/** @sc: System Controller */
+	struct xe_sysctrl sc;
+
 	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
 	u32 atomic_svm_timeslice_ms;
 
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 8eee4fb1c57c..08386c5eca27 100644
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
index 000000000000..8217f6befe70
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
+	/** @phase_bit: Message boundary phase toggle bit (0 or 1) */
+	bool phase_bit;
+};
+
+#endif
-- 
2.43.0

