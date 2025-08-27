Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A68CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 22:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4D410E91A;
	Wed, 27 Aug 2025 22:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rb9IsFKX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA18C10E91B
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 22:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756334166; x=1787870166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tXsqZ99E6aV+q83oUf1p6PPe92Gu5xGSxNC40YW8ih0=;
 b=Rb9IsFKXK44iJY1Hhg9AaM5sLsnrpQQtDvjT/tyBwvZlmufnmZfoJsVA
 5x6vAl8sacfXRCHD1kQYmpxTDQztIz59be0ySiCVZJvNek4qy2O0Djteo
 2NIqKNNPiL4ByosgFkbVo81xZBLL/AOYjDBy9zdw3oFm/uERKiicT/F2B
 u62CRR1LUEKEvYx6+c8ztfpFLw60bPNsCGQUeOYxzui5Jl3BE8lCfU/2L
 b75la1/yz/TnCKYuI+zbAOXrpHtZiAk/4QYRpPVn7gtcaJTXGBHMJq6kF
 yakIZuZpv6ukH1OL+svJiPVYTS5QQlfZLxN3gutuMUu7v+T9ru9/GbxI2 Q==;
X-CSE-ConnectionGUID: cB5V8ZgoTTCAKX7iUZRNng==
X-CSE-MsgGUID: KgRKqI8RTbWarQxKWpJg3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69308124"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="69308124"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 15:36:05 -0700
X-CSE-ConnectionGUID: CyfyLZcTSe2nuVgS5tIUUA==
X-CSE-MsgGUID: U3BZZc2pTKaOqdAtqzLiWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170117873"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 15:36:04 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH v2 5/6] drm/xe/lrc: Allow to add user commands on context
 switch
Date: Wed, 27 Aug 2025 15:35:30 -0700
Message-ID: <20250827-wa-bb-cmds-v2-5-3cdf4d63c72a@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827-wa-bb-cmds-v2-0-3cdf4d63c72a@intel.com>
References: <20250827-wa-bb-cmds-v2-0-3cdf4d63c72a@intel.com>
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
 drivers/gpu/drm/xe/xe_configfs.c | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |  6 ++++++
 drivers/gpu/drm/xe/xe_lrc.c      | 25 +++++++++++++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 483b13ef567b2..639c1dbf888f6 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -630,6 +630,19 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
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
index 58c8c31640008..a53e2d8fc792f 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -8,6 +8,8 @@
 #include <linux/limits.h>
 #include <linux/types.h>
 
+#include <xe_hw_engine_types.h>
+
 struct pci_dev;
 
 #if IS_ENABLED(CONFIG_CONFIGFS_FS)
@@ -18,6 +20,8 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
 void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
+u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
+					const u32 **cs);
 #else
 static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
@@ -26,6 +30,8 @@ static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { re
 static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
+u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
+					const u32 **cs) { return 0; }
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 8f6c3ba478828..13e920a53e3a8 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -16,6 +16,7 @@
 #include "regs/xe_lrc_layout.h"
 #include "xe_bb.h"
 #include "xe_bo.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_drm_client.h"
 #include "xe_exec_queue_types.h"
@@ -1102,6 +1103,29 @@ static ssize_t setup_timestamp_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
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
+	memcpy(cmd, user_batch, count * sizeof(u32));
+	cmd += count;
+
+	return cmd - batch;
+}
+
 static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
 					       struct xe_hw_engine *hwe,
 					       u32 *batch, size_t max_len)
@@ -1203,6 +1227,7 @@ int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe
 		{ .setup = setup_timestamp_wa },
 		{ .setup = setup_invalidate_state_cache_wa },
 		{ .setup = setup_utilization_wa },
+		{ .setup = setup_configfs_post_ctx_restore_bb },
 	};
 	struct bo_setup_state state = {
 		.lrc = lrc,

-- 
2.50.1

