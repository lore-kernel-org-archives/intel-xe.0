Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBA6C6FD1B
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 09:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1993310E38A;
	Tue,  7 Mar 2023 09:25:37 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B7E10E3C5
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 09:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678181130; x=1709717130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SfBUDj+sVCyq3o1kqNy40vV5tLeQu16ImEamxC1mu9M=;
 b=bFdxR5BQerVLA9XUFRSwJJ6JiO6p47WEFOzWnY5th3MFipKfI+/n+YZ1
 EKRr7Ow8uM0QombckXEQ/WZHyMUdW+3TqTeUGI4QZHJey1H+ZZW73jnrN
 Wc0BTZihJCuFCS/Pz6d/tD7h7Ph4SlYrfBhWk8Xc9jvUwOeythRK1CO/d
 UxxLd+akb2juuCVFq3cQdksvec5GWQzwrOL79AwTQ9ELpMsnDmc9cN4UZ
 lUaqZJK0S3KBlHdyL/5pUtn4uPQG4fIKEabeIfUiFfwD2PzwqlPhakDuX
 mtXT/T7GairchO9hYytWwnvwTI9pCQnNwZTar4BkGuPBlirtPd85zQU0h Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="422079121"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="422079121"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005798820"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="1005798820"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  7 Mar 2023 01:24:37 -0800
Message-Id: <20230307092446.1263266-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307092446.1263266-1-lucas.demarchi@intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 10/19] drm/xe/debugfs: Dump register save-restore
 tables
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add debugfs entry to dump the final tables with register save-restore
information. This has a format a little bit different than when the
values are applied because we don't want to read the values from the HW
when dumping via debugfs.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_reg_sr.c     | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_reg_sr.h     |  2 ++
 3 files changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 78942e12e76c..2db4863ba57e 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -16,6 +16,7 @@
 #include "xe_gt_topology.h"
 #include "xe_hw_engine.h"
 #include "xe_macros.h"
+#include "xe_reg_sr.h"
 #include "xe_uc_debugfs.h"
 
 static struct xe_gt *node_to_gt(struct drm_info_node *node)
@@ -98,6 +99,28 @@ static int ggtt(struct seq_file *m, void *data)
 	return xe_ggtt_dump(gt->mem.ggtt, &p);
 }
 
+static int register_save_restore(struct seq_file *m, void *data)
+{
+	struct xe_gt *gt = node_to_gt(m->private);
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	xe_reg_sr_dump(&gt->reg_sr, &p);
+	drm_printf(&p, "\n");
+
+	drm_printf(&p, "Engine\n");
+	for_each_hw_engine(hwe, gt, id)
+		xe_reg_sr_dump(&hwe->reg_sr, &p);
+	drm_printf(&p, "\n");
+
+	drm_printf(&p, "LRC\n");
+	for_each_hw_engine(hwe, gt, id)
+		xe_reg_sr_dump(&hwe->reg_lrc, &p);
+
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{"hw_engines", hw_engines, 0},
 	{"force_reset", force_reset, 0},
@@ -105,6 +128,7 @@ static const struct drm_info_list debugfs_list[] = {
 	{"topology", topology, 0},
 	{"steering", steering, 0},
 	{"ggtt", ggtt, 0},
+	{"register-save-restore", register_save_restore, 0},
 };
 
 void xe_gt_debugfs_register(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 194a5060f1b3..855d86a6c43a 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -8,6 +8,7 @@
 #include <linux/align.h>
 #include <linux/string_helpers.h>
 #include <linux/xarray.h>
+#include <linux/string_helpers.h>
 
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
@@ -220,3 +221,19 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
 err_force_wake:
 	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
 }
+
+void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p)
+{
+	struct xe_reg_sr_entry *entry;
+	unsigned long reg;
+
+	if (!sr->name || xa_empty(&sr->xa))
+		return;
+
+	drm_printf(p, "%s\n", sr->name);
+	xa_for_each(&sr->xa, reg, entry)
+		drm_printf(p, "\tREG[0x%lx] clr=0x%08x set=0x%08x masked=%s mcr=%s\n",
+			   reg, entry->clr_bits, entry->set_bits,
+			   str_yes_no(entry->masked_reg),
+			   str_yes_no(entry->reg_type == XE_RTP_REG_MCR));
+}
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
index 9f47230c8ddc..3af369089faa 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.h
+++ b/drivers/gpu/drm/xe/xe_reg_sr.h
@@ -14,8 +14,10 @@
 
 struct xe_device;
 struct xe_gt;
+struct drm_printer;
 
 int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe);
+void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
 
 int xe_reg_sr_add(struct xe_reg_sr *sr, u32 reg,
 		  const struct xe_reg_sr_entry *e);
-- 
2.39.0

