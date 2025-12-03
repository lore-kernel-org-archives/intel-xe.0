Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E9FD12689
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 00:48:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FD010E6F7;
	Wed,  3 Dec 2025 00:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+VYhh8a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B960710E6FE
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 00:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764722886; x=1796258886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TOmq9ETS9DmVyWgI0N9LtvRDnBGDchDH2iUhy+LaUxI=;
 b=k+VYhh8aBx9Z0Wf4s0WxUUfMm2rQh3uwrjKPGEfx1cp+WaWmozAD+VH0
 952Fpr3sA9NoptfHHuH6KO65H7jybMOc5LADGxn4IJ7/rCB1yYW9M++ZF
 7AZMfDa0ULDDoyvKtHYC0xu7i17F4d8GvwgVhrongpy3VUlvWMPru4UIF
 mKE/RQW8tfPZTLIhyIy6+nYHPlukSjfst/TzZyQNaJ1dCNlMlsjlKFG5v
 0UawXcCkK+zmt7eXPjhsSQ8AbhACLbp/IOeD+O1tC9B5bmFbb+wPefAX4
 sEA2KoDcwOub1gEr/IG4AcFFdv6McdSeENl7VcTemZmSGFKxcyV7Uh1eF g==;
X-CSE-ConnectionGUID: ohFgyYL7T26w4fvr6/8Wxg==
X-CSE-MsgGUID: vw47yduBQ569nFliWddIsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="65895339"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="65895339"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 16:48:05 -0800
X-CSE-ConnectionGUID: 7aa27o2PSmatcd42jLTtHQ==
X-CSE-MsgGUID: ILEZEvgbQeGP9rYNgDuQlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="194340516"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 16:48:05 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com, ashutosh.dixit@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v3 1/3] drm/xe/soc_remapper: Initialize SoC remapper during Xe
 probe
Date: Tue,  2 Dec 2025 16:48:02 -0800
Message-ID: <20251203004800.1993258-6-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251203004800.1993258-5-umesh.nerlige.ramappa@intel.com>
References: <20251203004800.1993258-5-umesh.nerlige.ramappa@intel.com>
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
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device.c       |  5 +++++
 drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++++
 drivers/gpu/drm/xe/xe_pci.c          |  2 ++
 drivers/gpu/drm/xe/xe_pci_types.h    |  2 ++
 drivers/gpu/drm/xe/xe_soc_remapper.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_soc_remapper.h | 13 +++++++++++++
 7 files changed, 55 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.c
 create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 0eadfeda67d9..06c3987afd4c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -115,6 +115,7 @@ xe-y += xe_bb.o \
 	xe_sa.o \
 	xe_sched_job.o \
 	xe_shrinker.o \
+	xe_soc_remapper.o \
 	xe_step.o \
 	xe_survivability_mode.o \
 	xe_sync.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 92f883dd8877..b54fc5852fef 100644
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
index 9a9a8eb84a78..450fe703a3b9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -315,6 +315,8 @@ struct xe_device {
 		u8 has_pxp:1;
 		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
 		u8 has_range_tlb_inval:1;
+		/** @info.has_soc_remapper: Has SoC remapper support */
+		u8 has_soc_remapper:1;
 		/** @info.has_sriov: Supports SR-IOV */
 		u8 has_sriov:1;
 		/** @info.has_usm: Device has unified shared memory support */
@@ -555,6 +557,12 @@ struct xe_device {
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
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 75e3588242c7..ec0fed691fa0 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -413,6 +413,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_flat_ccs = false,
 	.has_mbx_power_limits = true,
 	.has_mert = true,
+	.has_soc_remapper = true,
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	.require_force_probe = true,
@@ -869,6 +870,7 @@ static int xe_info_init(struct xe_device *xe,
 		xe->info.has_device_atomics_on_smem = 1;
 
 	xe->info.has_range_tlb_inval = graphics_desc->has_range_tlb_inval;
+	xe->info.has_soc_remapper = graphics_desc->has_soc_remapper;
 	xe->info.has_usm = graphics_desc->has_usm;
 	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
 
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index f19f35359696..98da07f13838 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -50,6 +50,7 @@ struct xe_device_desc {
 	u8 has_mem_copy_instr:1;
 	u8 has_mert:1;
 	u8 has_pxp:1;
+	u8 has_soc_remapper:1;
 	u8 has_sriov:1;
 	u8 needs_scratch:1;
 	u8 skip_guc_pc:1;
@@ -65,6 +66,7 @@ struct xe_graphics_desc {
 	u8 has_atomic_enable_pte_bit:1;
 	u8 has_indirect_ring_state:1;
 	u8 has_range_tlb_inval:1;
+	u8 has_soc_remapper:1;
 	u8 has_usm:1;
 	u8 has_64bit_timestamp:1;
 };
diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
new file mode 100644
index 000000000000..f49af7e1da2a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
@@ -0,0 +1,24 @@
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
+	if (!xe->info.has_soc_remapper)
+		return 0;
+
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

