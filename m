Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3852BC7EE30
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 22:20:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1796310E384;
	Tue, 16 May 2023 22:20:31 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D23810E378
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 22:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684275627; x=1715811627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WoosA221GxlVh7Q9oyZr+XbKC8BQmVaHgzzzwxRQPKw=;
 b=PkYQztDKoufq2nM/9DKBa2cIS8DaDFXtzyZZYKt5ZJYLfJihJ29QgYaK
 GqfNsQr8hkSMNswAW3BL9FYPPfYOUMzw+ne1RgHLM/u0fSozihV6WHi2n
 DGTFKomQS792RGopMvXCI0/y5HcQhfb/x0BKvf2u9D/Th8BPAeddrILS/
 r6C2vMmzGdKOHglZzOeXMcqma70CX1C8jX9gf7pSC3zLjRbaI58JZoTXv
 KvqXZRDLKYFuFAkEjZILrQ2tGsjt3IrHC5O3smgcYx99ezd4b5yZSPby/
 JNhuiwQ3If/7iJntwgephfqGCIlltakbUuGScvlQkULn1p6j9C9gKq+4a Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="415013388"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="415013388"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:20:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="766530866"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="766530866"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:20:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 15:19:47 -0700
Message-Id: <20230516221950.3512818-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516221950.3512818-1-lucas.demarchi@intel.com>
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 6/9] drm/xe/debugfs: Dump active workarounds
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add a "workarounds" node in debugfs that can dump all the active
workarounds using the information recorded by rtp infra when those
workarounds were processed.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_wa.c      | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa.h      |  2 ++
 3 files changed, 32 insertions(+)

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
index fa37b1c0425a..bc2665737836 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -650,3 +650,21 @@ int xe_wa_init(struct xe_device *xe)
 
 	return 0;
 }
+
+void xe_wa_dump(struct xe_device *xe, struct drm_printer *p)
+{
+	size_t idx;
+
+	drm_printf(p, "GT Workarounds\n");
+	for_each_set_bit(idx, xe->wa_active.gt, ARRAY_SIZE(gt_was))
+		drm_printf_indent(p, 1, "%s\n", gt_was[idx].name);
+
+	drm_printf(p, "\nEngine Workarounds\n");
+	for_each_set_bit(idx, xe->wa_active.engine, ARRAY_SIZE(engine_was))
+		drm_printf_indent(p, 1, "%s\n", engine_was[idx].name);
+
+	drm_printf(p, "\nLRC Workarounds\n");
+	for_each_set_bit(idx, xe->wa_active.lrc, ARRAY_SIZE(lrc_was))
+		drm_printf_indent(p, 1, "%s\n", lrc_was[idx].name);
+}
+
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index 8edad4f92800..32ab34d9237f 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -6,6 +6,7 @@
 #ifndef _XE_WA_
 #define _XE_WA_
 
+struct drm_printer;
 struct xe_device;
 struct xe_gt;
 struct xe_hw_engine;
@@ -16,5 +17,6 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe);
 void xe_wa_process_lrc(struct xe_hw_engine *hwe);
 
 void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
+void xe_wa_dump(struct xe_device *xe, struct drm_printer *p);
 
 #endif
-- 
2.40.1

