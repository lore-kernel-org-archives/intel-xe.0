Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD76AC7618A
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 22:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC27310EA23;
	Fri, 10 Mar 2023 22:16:30 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521CB10EA1B
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 22:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678486588; x=1710022588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qua9YrBFAu8Tj2HaHbb75foBD1nEOGJktdlxEwsMIj0=;
 b=UCwI2tanzmff9m7gs+YoRuD8CBWuYGZ5o+vIpf/jsuca8vaKBBTZz6iU
 0SZsjSa/cOOF/J7ZszpT/6FTQ14f/tJHeVSblgZffJPTnDou5R8goCo0T
 rqRhwfmJT54Ccss2HS/yOIkjIBPHF8y0A03EwCqZC3wcFrIr4qxMuumi3
 ETsB/avcyOal+Nd/+RvSu5b+sZkcGfWpGm4JkQRlab9IUzQhlijGpc+1o
 85DzlIndCM1jca+CjWWmzWnnRACJDj0QOkRSFJqQrcPbCwiNd/CZryDKR
 f3eX2Zct+enWmGb0MT3Tdh2qg/UMja7FkKO1oyMNX0wbgNWsy0w7ituKI A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423106174"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="423106174"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 14:16:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="821234959"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="821234959"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 14:16:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Mar 2023 14:15:41 -0800
Message-Id: <20230310221549.2337402-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230310221549.2337402-1-lucas.demarchi@intel.com>
References: <20230310221549.2337402-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 04/12] drm/xe/debugfs: Dump register
 save-restore tables
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add debugfs entry to dump the final tables with register save-restore
information.

For the workarounds, this has a format a little bit different than when the
values are applied because we don't want to read the values from the HW
when dumping via debugfs. For whitelist it just re-uses the print
function added for when the whitelist is being built.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c    | 30 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_reg_sr.c        | 22 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_reg_sr.h        |  2 ++
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 18 ++++++++++++++++
 drivers/gpu/drm/xe/xe_reg_whitelist.h |  3 +++
 5 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 78942e12e76c..9fab8017490f 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -16,6 +16,8 @@
 #include "xe_gt_topology.h"
 #include "xe_hw_engine.h"
 #include "xe_macros.h"
+#include "xe_reg_sr.h"
+#include "xe_reg_whitelist.h"
 #include "xe_uc_debugfs.h"
 
 static struct xe_gt *node_to_gt(struct drm_info_node *node)
@@ -98,6 +100,33 @@ static int ggtt(struct seq_file *m, void *data)
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
+	drm_printf(&p, "\n");
+
+	drm_printf(&p, "Whitelist\n");
+	for_each_hw_engine(hwe, gt, id)
+		xe_reg_whitelist_dump(&hwe->reg_whitelist, &p);
+
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{"hw_engines", hw_engines, 0},
 	{"force_reset", force_reset, 0},
@@ -105,6 +134,7 @@ static const struct drm_info_list debugfs_list[] = {
 	{"topology", topology, 0},
 	{"steering", steering, 0},
 	{"ggtt", ggtt, 0},
+	{"register-save-restore", register_save_restore, 0},
 };
 
 void xe_gt_debugfs_register(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index f6ed9e6e5697..9eaf1be27886 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -8,6 +8,7 @@
 #include <linux/align.h>
 #include <linux/string_helpers.h>
 #include <linux/xarray.h>
+#include <linux/string_helpers.h>
 
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
@@ -230,3 +231,24 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
 err_force_wake:
 	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
 }
+
+/**
+ * xe_reg_sr_dump - print all save/restore entries
+ * @sr: Save/restore entries
+ * @p: DRM printer
+ */
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
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 6c8577e8dba6..c4b3a2045299 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -108,3 +108,21 @@ void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
 			  deny ? "deny" : "allow",
 			  access_str);
 }
+
+/**
+ * xe_reg_whitelist_dump - print all whitelist entries
+ * @sr: Save/restore entries
+ * @p: DRM printer
+ */
+void xe_reg_whitelist_dump(struct xe_reg_sr *sr, struct drm_printer *p)
+{
+	struct xe_reg_sr_entry *entry;
+	unsigned long reg;
+
+	if (!sr->name || xa_empty(&sr->xa))
+		return;
+
+	drm_printf(p, "%s\n", sr->name);
+	xa_for_each(&sr->xa, reg, entry)
+		xe_reg_whitelist_print_entry(p, 1, reg, entry);
+}
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.h b/drivers/gpu/drm/xe/xe_reg_whitelist.h
index c76d81c528da..69b121d377da 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.h
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.h
@@ -10,6 +10,7 @@
 
 struct drm_printer;
 struct xe_hw_engine;
+struct xe_reg_sr;
 struct xe_reg_sr_entry;
 
 void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
@@ -17,4 +18,6 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
 void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
 				  u32 reg, struct xe_reg_sr_entry *entry);
 
+void xe_reg_whitelist_dump(struct xe_reg_sr *sr, struct drm_printer *p);
+
 #endif
-- 
2.39.0

