Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56967C54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 13:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F86710E9F8;
	Thu, 21 Mar 2024 13:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mhw89Fvb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3406E10E9D3
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 13:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711026115; x=1742562115;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bAtUX03YwZIZWlEt7ukQU4sPFpGFzvD/4JQvO/Z9JzI=;
 b=mhw89FvbROFacWJ07iImbnA1elKnkbmsb35Wp5PE/bh5Fw2HGe7CcoOw
 x2fQarSJ0OH/9bgQvgs6nUGruVQZ9Tx77+aBHG9Ne3grI9WxeR0XSL4Su
 1aarZZA188tUG6HeVOr77yMDttVqvI1PKFhtx1PgJpERppOWMsa+hhKaw
 gjsgv9pf9CY5CEvpRs3GwqNQcsR3/hZU+DyLdMtbS+/+RbIs74F+84zyG
 QhuHCpghSd85Q+QbhfMmJl0bL5RZm82FKitOR3e00OXfroi8dkx2eQqk9
 tEfJkwwAOjRH1kfNk/SWGGxtKJp9KetZ+S5wQgUvIrp8heQSr1xUTCh9i g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5842369"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="5842369"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 06:01:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="14576730"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by fmviesa008.fm.intel.com with ESMTP; 21 Mar 2024 06:01:52 -0700
From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
To: intel-xe@lists.freedesktop.org, janga.rahul.kumar@intel.com,
 ramadevi.gandi@intel.com
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/mocs: Add debugfs node to dump mocs
Date: Thu, 21 Mar 2024 18:37:39 +0530
Message-Id: <20240321130739.3311199-1-janga.rahul.kumar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

This is useful to check mocs configuration. Tests/Tools can use
this debugfs entry to get mocs info.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 13 +++++++++
 drivers/gpu/drm/xe/xe_mocs.c       | 45 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mocs.h       |  8 ++++++
 3 files changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 6b4dc2927727..918be3b90ba9 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -17,6 +17,7 @@
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
+#include "xe_mocs.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
 #include "xe_reg_sr.h"
@@ -233,6 +234,17 @@ static int vecs_default_lrc(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int mocs(struct seq_file *m, void *data)
+{
+	struct xe_gt *gt = node_to_gt(m->private);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_pm_runtime_get(gt_to_xe(gt));
+	xe_mocs_dump(gt, &p);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
+	return 0;
+}
 static const struct drm_info_list debugfs_list[] = {
 	{"hw_engines", hw_engines, 0},
 	{"force_reset", force_reset, 0},
@@ -248,6 +260,7 @@ static const struct drm_info_list debugfs_list[] = {
 	{"default_lrc_bcs", bcs_default_lrc},
 	{"default_lrc_vcs", vcs_default_lrc},
 	{"default_lrc_vecs", vecs_default_lrc},
+	{"mocs", mocs, 0},
 };
 
 void xe_gt_debugfs_register(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index bff659d20062..a0416100912b 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -574,6 +574,51 @@ void xe_mocs_init(struct xe_gt *gt)
 		init_l3cc_table(gt, &table);
 }
 
+void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
+{
+	struct xe_mocs_info table;
+	unsigned int flags;
+	u32 ret, reg_val;
+	unsigned int i;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	flags = get_mocs_settings(xe, &table);
+	xe_device_mem_access_get(xe);
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+
+	if (ret)
+		goto err_fw;
+
+	if (flags & HAS_GLOBAL_MOCS) {
+		drm_printf(p, "Global mocs registers configuration:\n");
+		for (i = 0; i < table.n_entries ; i++) {
+			if (regs_are_mcr(gt))
+				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
+			else
+				reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
+
+			drm_printf(p, "GLOB_MOCS[%d] 0x%x 0x%x\n", i, XELP_GLOBAL_MOCS(i).addr, reg_val);
+		}
+	}
+
+	if (flags & HAS_LNCF_MOCS) {
+		for (i = 0; i < (table.n_entries + 1)/2 ; i++) {
+			if (regs_are_mcr(gt))
+				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
+			else
+				reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
+
+			drm_printf(p, "LNCFCMOCS[%d] 0x%x 0x%x\n", i, XELP_LNCFCMOCS(i).addr, reg_val);
+		}
+	}
+
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+
+err_fw:
+	xe_assert(xe, !ret);
+	xe_device_mem_access_put(xe);
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_mocs.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_mocs.h b/drivers/gpu/drm/xe/xe_mocs.h
index 053754c5a94e..d6fa4485a6e9 100644
--- a/drivers/gpu/drm/xe/xe_mocs.h
+++ b/drivers/gpu/drm/xe/xe_mocs.h
@@ -10,8 +10,16 @@
 
 struct xe_exec_queue;
 struct xe_gt;
+struct drm_printer;
 
 void xe_mocs_init_early(struct xe_gt *gt);
 void xe_mocs_init(struct xe_gt *gt);
 
+/**
+ * xe_mocs_dump - Dump mocs table
+ * @gt: GT structure
+ * @p: Printer to dump info to
+ */
+void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p);
+
 #endif
-- 
2.25.1

