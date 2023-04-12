Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEF7C7619A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 08:21:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E45310E734;
	Wed, 12 Apr 2023 08:21:34 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C160810E73E
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 08:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681287691; x=1712823691;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tr6F+pDyha8Q0PN/HYpcC9reMks39uY7579dlggogVY=;
 b=ajNiGLpB3M23IpxlS40OWRDrFNYPfFD8fUV1eVbaFUku0g3Zy7KsoL/B
 SZH3bO0fONG5cxWo711DNGeA4Dfaq6rwCRH9bO1WDZA28yrhgY0P8+CNy
 TvfseJUbLmTBwe98O/tGRNE1o5Mnt/bTMK3KQbMPhXxrKJMESoX8/DFdr
 IU0Bppw68bGmKv990ZiItOPw6YCXeXbohLofHBRHcJXqjwuTpfjFyDUP7
 Z1ZnfE6kTu8l+F6uCYHyka93/WLFPpzqBjenTbKNiDcEIuJc1Oe4czvgI
 9o9dC1bAZ6U0z6kLQuSzC+/b7npy9nZGk3qlCN8KvyTrBMgXI7Pe7YgQG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="406665650"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; d="scan'208";a="406665650"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 01:21:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="758150826"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; d="scan'208";a="758150826"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 01:21:30 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 01:20:53 -0700
Message-Id: <20230412082054.3314568-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230412082054.3314568-1-lucas.demarchi@intel.com>
References: <20230412082054.3314568-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 1/2] drm/xe: Add debugfs to dump all known
 workarounds
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Dump the names of all known workarounds known by the driver (regardless
of the platform being executed). This helps to validate workarounds
missing implementation. Later this can be extended to mark the
workarounds that are active under this platform.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_wa.c      | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa.h      |  4 ++++
 3 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 7827a785b020..ad1b1ab49e1d 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -13,6 +13,7 @@
 #include "xe_device.h"
 #include "xe_gt_debugfs.h"
 #include "xe_step.h"
+#include "xe_wa.h"
 
 #ifdef CONFIG_DRM_XE_DEBUG
 #include "xe_bo_evict.h"
@@ -60,8 +61,19 @@ static int info(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int workarounds(struct seq_file *m, void *data)
+{
+	struct xe_device *xe = node_to_xe(m->private);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_wa_dump(xe, &p);
+
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{"info", info, 0},
+	{"workarounds", workarounds, 0},
 };
 
 static int forcewake_open(struct inode *inode, struct file *file)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index a7d681b7538d..100315c03014 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -656,3 +656,27 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
 {
 	xe_rtp_process(lrc_was, &hwe->reg_lrc, hwe->gt, hwe);
 }
+
+/**
+ * xe_wa_dump - dump all workarounds known by the driver
+ * @xe: xe device
+ * @p: DRM printer
+ */
+void xe_wa_dump(struct xe_device *xe, struct drm_printer *p)
+{
+	const struct xe_rtp_entry *entry;
+
+	drm_printf(p, "Workarounds\n");
+
+	drm_printf(p, "\tGT\n");
+	for (entry = gt_was; entry && entry->name; entry++)
+		drm_printf(p, "\t\t%s\n", entry->name);
+
+	drm_printf(p, "\tEngine\n");
+	for (entry = engine_was; entry && entry->name; entry++)
+		drm_printf(p, "\t\t%s\n", entry->name);
+
+	drm_printf(p, "\tLRC\n");
+	for (entry = lrc_was; entry && entry->name; entry++)
+		drm_printf(p, "\t\t%s\n", entry->name);
+}
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index cd2307d58795..97d104b7e566 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -6,6 +6,8 @@
 #ifndef _XE_WA_
 #define _XE_WA_
 
+struct drm_printer;
+struct xe_device;
 struct xe_gt;
 struct xe_hw_engine;
 
@@ -13,6 +15,8 @@ void xe_wa_process_gt(struct xe_gt *gt);
 void xe_wa_process_engine(struct xe_hw_engine *hwe);
 void xe_wa_process_lrc(struct xe_hw_engine *hwe);
 
+void xe_wa_dump(struct xe_device *xe, struct drm_printer *p);
+
 void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
 
 #endif
-- 
2.39.0

