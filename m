Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B38C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 21:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39E410E0C6;
	Wed, 28 May 2025 21:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGlAF5HT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D35D10E6D1
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 21:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748469258; x=1780005258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d7OulooivPZ+aBd88QmQO6mQ/AmiGPREIe8R5LQpdyQ=;
 b=kGlAF5HTCfrc45ZXF9TB1SIMd033d5AJbNOepTdkksJ50gn2HuI0nfP0
 d16xwnHnvrvJGW7jjBor0U9LXGEFpDn4mWXo8Y0/+Gb1n6A9ZA8P9kkCU
 lPCCC9yhsdSXSH+AvPOir2riUEfh5ljViP/9G42WEJN/FknQKWAJFIVGM
 //h5wtB9u56C2rKaJUu4Q8UEVswEqERoclIDcEoJ4BvxYMwKrv0NvZUBa
 JC8Cckvp0ylJrz3ADJ+PCIylfUFXvmUP0yVTzt/R+nAbDFU2QAMbAHzYs
 VE/9LFBA4PKP/g2tussZzAGZigt4r9tvoDNkYHnrF/FwZ/meY2WXejvDs w==;
X-CSE-ConnectionGUID: lbWJ3ZCJS8mPtH5XeuQkBQ==
X-CSE-MsgGUID: 3mYLuhb0Tt6m9MYen8DikQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="73044760"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="73044760"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:54:18 -0700
X-CSE-ConnectionGUID: 97fE9ubDSoSuvgeePuLvZA==
X-CSE-MsgGUID: u/snDO7mT2uxYTyiD0CtMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143201077"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:54:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v4 3/5] drm/xe: Allow to disable engines
Date: Wed, 28 May 2025 14:54:06 -0700
Message-ID: <20250528-engine-mask-v4-3-f4636d2a890a@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528-engine-mask-v4-0-f4636d2a890a@intel.com>
References: <20250528-engine-mask-v4-0-f4636d2a890a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-d9694
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

Sometimes it's useful to load the driver with a smaller set of engines
to allow more targeted debugging, particularly on early enabling.

Besides checking what is fused off in hardware, add similar logic to
disable engines in software. This will use configfs to allow users
to set what engine to disable, so already add prepare for that. The
exact configfs interface will be added later.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c  | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h  |  2 ++
 drivers/gpu/drm/xe/xe_hw_engine.c | 20 ++++++++++++++++++++
 3 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index cb9f175c89a1c..8320d57ef5a80 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -226,6 +226,21 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
 	config_item_put(&dev->group.cg_item);
 }
 
+/**
+ * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
+ * @pdev: pci device
+ *
+ * Find the configfs group that belongs to the pci device and return
+ * the mask of engines allowed to be used.
+ *
+ * Return: engine mask with allowed engines
+ */
+u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
+{
+	/* dummy implementation */
+	return U64_MAX;
+}
+
 int __init xe_configfs_init(void)
 {
 	struct config_group *root = &xe_configfs.su_group;
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index ef6d231b3024b..79d001b647740 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -14,11 +14,13 @@ int xe_configfs_init(void);
 void xe_configfs_exit(void);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
 void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
+u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 #else
 static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
 static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
 static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
+static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 33681169b8570..3439c8522d013 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -17,6 +17,7 @@
 #include "regs/xe_irq_regs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_execlist.h"
 #include "xe_force_wake.h"
@@ -805,6 +806,24 @@ static void check_gsc_availability(struct xe_gt *gt)
 	}
 }
 
+static void check_sw_disable(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	u64 sw_allowed = xe_configfs_get_engines_allowed(to_pci_dev(xe->drm.dev));
+	enum xe_hw_engine_id id;
+
+	for (id = 0; id < XE_NUM_HW_ENGINES; ++id) {
+		if (!(gt->info.engine_mask & BIT(id)))
+			continue;
+
+		if (!(sw_allowed & BIT(id))) {
+			gt->info.engine_mask &= ~BIT(id);
+			xe_gt_info(gt, "%s disabled via configfs\n",
+				   engine_infos[id].name);
+		}
+	}
+}
+
 int xe_hw_engines_init_early(struct xe_gt *gt)
 {
 	int i;
@@ -813,6 +832,7 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
 	read_copy_fuses(gt);
 	read_compute_fuses(gt);
 	check_gsc_availability(gt);
+	check_sw_disable(gt);
 
 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);

-- 
2.49.0

