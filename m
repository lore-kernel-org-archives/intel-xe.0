Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C87AC7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 16:44:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBCA10E1D7;
	Fri, 26 May 2023 16:44:54 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3CB10E823
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 16:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685119453; x=1716655453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a9+G00FzA9LOnuZCvQSirCA9wg8XZ4wsugSFYCBeblY=;
 b=LMnXA9vXu/YKJm1qACuQFJf9Bv8DLweRrbnv+tvSDXPfn1VPPchbp0+k
 QJiFG+rc1/59rfgmC1RAdYDGia40rUUKuYuupddenf0hdq1P2SruGl+Xp
 ByPKTx2M6g2sWqv1CPx1TN6ikmAB8VDcNplssZ1K4HTpUUAVPwF8AH1rT
 3Nb/51Vwx1Bgv3gkv0xQ8cRG+TJDuws++qdA0QbmIE6oImn8uAw5cmglQ
 u8q3tkMv5eQWY7mmLLDrLyHS7o1L0hJv/WlgOaD/AnSdlbK1rXshYrHwj
 fUFmNwRUI0rc0+G/VWIlckszpMKlHX9kPcRe991TQJL4uWug/gn9/EZ77 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356628379"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="356628379"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="795151466"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="795151466"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 09:43:44 -0700
Message-Id: <20230526164358.86393-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526164358.86393-1-lucas.demarchi@intel.com>
References: <20230526164358.86393-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 07/21] drm/xe/debugfs: Dump active workarounds
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

Add a "workarounds" node in debugfs that can dump all the active
workarounds using the information recorded by rtp infra when those
workarounds were processed.

v2: move workarounds to be reported per-GT

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_wa.c         | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_wa.h         |  2 ++
 3 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 8bf441e850a0..339ecd5fad9b 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -19,6 +19,7 @@
 #include "xe_reg_sr.h"
 #include "xe_reg_whitelist.h"
 #include "xe_uc_debugfs.h"
+#include "xe_wa.h"
 
 static struct xe_gt *node_to_gt(struct drm_info_node *node)
 {
@@ -127,6 +128,16 @@ static int register_save_restore(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int workarounds(struct seq_file *m, void *data)
+{
+	struct xe_gt *gt = node_to_gt(m->private);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_wa_dump(gt, &p);
+
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{"hw_engines", hw_engines, 0},
 	{"force_reset", force_reset, 0},
@@ -135,6 +146,7 @@ static const struct drm_info_list debugfs_list[] = {
 	{"steering", steering, 0},
 	{"ggtt", ggtt, 0},
 	{"register-save-restore", register_save_restore, 0},
+	{"workarounds", workarounds, 0},
 };
 
 void xe_gt_debugfs_register(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 665714abc5f0..910579453316 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -651,3 +651,20 @@ int xe_wa_init(struct xe_gt *gt)
 
 	return 0;
 }
+
+void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
+{
+	size_t idx;
+
+	drm_printf(p, "GT Workarounds\n");
+	for_each_set_bit(idx, gt->wa_active.gt, ARRAY_SIZE(gt_was))
+		drm_printf_indent(p, 1, "%s\n", gt_was[idx].name);
+
+	drm_printf(p, "\nEngine Workarounds\n");
+	for_each_set_bit(idx, gt->wa_active.engine, ARRAY_SIZE(engine_was))
+		drm_printf_indent(p, 1, "%s\n", engine_was[idx].name);
+
+	drm_printf(p, "\nLRC Workarounds\n");
+	for_each_set_bit(idx, gt->wa_active.lrc, ARRAY_SIZE(lrc_was))
+		drm_printf_indent(p, 1, "%s\n", lrc_was[idx].name);
+}
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index eae05bcecc68..defefa5d9611 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -6,6 +6,7 @@
 #ifndef _XE_WA_
 #define _XE_WA_
 
+struct drm_printer;
 struct xe_gt;
 struct xe_hw_engine;
 
@@ -15,5 +16,6 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe);
 void xe_wa_process_lrc(struct xe_hw_engine *hwe);
 
 void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
+void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
 
 #endif
-- 
2.40.1

