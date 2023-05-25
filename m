Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CFFC7EE31
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 21:34:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A19910E781;
	Thu, 25 May 2023 21:34:53 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF12410E780
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 21:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685050479; x=1716586479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ho0Vlybxp1vAjiNAO4Tf2D+/12XjfZW53DUqKbC+Ahw=;
 b=U7CFDvy8oe1c2NPKU1gpgSQwgjmwSfvHGNXZmNE+PE8cPWeIyr+c1UNS
 xU0jsEurafPwqo9FXq7aXbPWCMOP9DAkEAR2n2V1Ht3SAQgzhRXfQoWNm
 ftWFX9MHHwKbORJ6Ea0vRN6VEzXo7ET5eArFW1ETIQKuotMXZ+tk4ORHx
 kROiVNijFtg+C9E+Pd8XFZHNZCPKrpzTj5MFRXD1VtDsNYjnttsZcd3Kb
 1cZsZLVGWiBS35XPF4JLZ6Kl/cnqYfwIvJW6uO4Wgmap6Tt3AnjtiQA/q
 6LUhaSWoDpkdkMoviqcuDQ7Tm5Luc/vrEVwgUw35+qQ7TdEUBlX/bubZm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334377906"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="334377906"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="737970741"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="737970741"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 14:33:53 -0700
Message-Id: <20230525213407.3907094-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525213407.3907094-1-lucas.demarchi@intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 07/21] drm/xe/debugfs: Dump active workarounds
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
index 3e2a3f678f36..f578544c7646 100644
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

