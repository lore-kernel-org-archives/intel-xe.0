Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB69ECAC598
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 21:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B224210E555;
	Tue, 16 Sep 2025 21:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JO3RbXgr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD9D10E555
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 21:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758057364; x=1789593364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oOpVri4DEBE7FtLQzXjuWkSAJRR1AHdPpL5hKQOGK0c=;
 b=JO3RbXgrr7h9+CuDDmcksp8d2ANBko2iu22psYqZQUzxYU+Emyt1PvNs
 QCPeXOn4QZftLCI2r3Nd//6xmlRoEYwVKXVCQHkK/lgVXRvEMKOOAiC5k
 hdEOQUsQVWxgbrv1T2RYebuHgXhxoGwJFJZu2nzO+Rv5xod2groBNNd0s
 G6ByHl5Qs273VTqWWlgT8hiDZD6oOHlxl7+GHN25/1Ca91o9jgYeDjsa/
 0W2arZiqQR52AKSiUEHvMZ9tqs0g1iGmE87I895Qh0hB0DRgayl/yTbTj
 INFeluOK79/r5bqdfT6EogbQkdA/EwvZNA2/jtluh+df+1q9GUOWQAfCM A==;
X-CSE-ConnectionGUID: 3VlCtWMDTC6WC4bCv35jCA==
X-CSE-MsgGUID: orcAzJRPSCuPAe3mW5t2ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="82949104"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="82949104"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 14:16:03 -0700
X-CSE-ConnectionGUID: lPFRZxAjQrKLuAhGc2P8FQ==
X-CSE-MsgGUID: 0UEkhnc4S0ieUebf2rG52g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="175146064"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 14:16:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 3/7] drm/xe/lrc: Allow to add user commands on context
 switch
Date: Tue, 16 Sep 2025 14:15:40 -0700
Message-ID: <20250916-wa-bb-cmds-v5-3-306bddbc15da@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com>
References: <20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

During validation it's useful to allows additional commands to be
executed on context switch. Fetch the commands from configfs (to be
added) and add them to the WA BB.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: Fix warning when building without configfs
v3: Move taint to this patch from the configfs implementation
---
 drivers/gpu/drm/xe/xe_configfs.c | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |  6 ++++++
 drivers/gpu/drm/xe/xe_lrc.c      | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 45fdb6cf26b5d..d86c75af03278 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -633,6 +633,19 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
 	return ret;
 }
 
+/**
+ * xe_configfs_get_ctx_restore_post_bb - get configfs ctx_restore_post_bb setting
+ * @pdev: pci device
+ *
+ * Return: post_ctx_restore setting in configfs
+ */
+u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
+					enum xe_engine_class class,
+					const u32 **cs)
+{
+	return 0;
+}
+
 int __init xe_configfs_init(void)
 {
 	int ret;
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 1402e863b71c0..eff2645b5f593 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -8,6 +8,8 @@
 #include <linux/limits.h>
 #include <linux/types.h>
 
+#include <xe_hw_engine_types.h>
+
 struct pci_dev;
 
 #if IS_ENABLED(CONFIG_CONFIGFS_FS)
@@ -17,6 +19,8 @@ void xe_configfs_check_device(struct pci_dev *pdev);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
+u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
+					const u32 **cs);
 #else
 static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
@@ -24,6 +28,8 @@ static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
 static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
+static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
+						      const u32 **cs) { return 0; }
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 6d52e0eb97f54..c706585611d55 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -8,6 +8,7 @@
 #include <generated/xe_wa_oob.h>
 
 #include <linux/ascii85.h>
+#include <linux/panic.h>
 
 #include "instructions/xe_mi_commands.h"
 #include "instructions/xe_gfxpipe_commands.h"
@@ -16,6 +17,7 @@
 #include "regs/xe_lrc_layout.h"
 #include "xe_bb.h"
 #include "xe_bo.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_drm_client.h"
 #include "xe_exec_queue_types.h"
@@ -1102,6 +1104,35 @@ static ssize_t setup_timestamp_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	return cmd - batch;
 }
 
+static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
+						  struct xe_hw_engine *hwe,
+						  u32 *batch, size_t max_len)
+{
+	struct xe_device *xe = gt_to_xe(lrc->gt);
+	const u32 *user_batch;
+	u32 *cmd = batch;
+	u32 count;
+
+	count = xe_configfs_get_ctx_restore_post_bb(to_pci_dev(xe->drm.dev),
+						    hwe->class, &user_batch);
+	if (!count)
+		return 0;
+
+	if (count > max_len)
+		return -ENOSPC;
+
+	/*
+	 * This should be used only for tests and validation. Taint the kernel
+	 * as anything could be submitted directly in context switches
+	 */
+	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
+
+	memcpy(cmd, user_batch, count * sizeof(u32));
+	cmd += count;
+
+	return cmd - batch;
+}
+
 static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
 					       struct xe_hw_engine *hwe,
 					       u32 *batch, size_t max_len)
@@ -1203,6 +1234,7 @@ int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe
 		{ .setup = setup_timestamp_wa },
 		{ .setup = setup_invalidate_state_cache_wa },
 		{ .setup = setup_utilization_wa },
+		{ .setup = setup_configfs_post_ctx_restore_bb },
 	};
 	struct bo_setup_state state = {
 		.lrc = lrc,

-- 
2.50.1

