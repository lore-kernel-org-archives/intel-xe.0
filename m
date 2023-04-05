Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741CCC761A6
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 02:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC59C10E0D3;
	Wed,  5 Apr 2023 02:40:34 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BAEA10E077
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 02:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680662432; x=1712198432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yzUcHSE4wkMe2In7ojd8StpHWsSwSVywiqV8Q9O/+zI=;
 b=NuxAo7VxVMpb1v/RawW2YCJnoXrcri19tFxhuFjg+q8ejocE1sI/O0oN
 iK6LmMndKzQJYtXnnj3uKdj4/mPzB0svoaDxprK57AZtXCuVAyTJeg50q
 99QjJUfQykHLaZy/0LnS6kPOkrx2ahdn7tuUZcOnz0bkE1IAH5eCJisZ1
 CMi5TpqP/DXQdnNd35J8X3SKDPrbdYxxuhqL55tQQ6F6D5ryan/TxL+oI
 wNjCtST55fPqiz9Nha5yQ9bokTheMyWPYa3BASoq3PQSUjLzzc/QlAaow
 v3viaGuycx0Az24xDSIH0lX/keUm273rSe2RUceZjFPpFs2EZ5hl0GnRp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="370175220"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="370175220"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 19:40:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="719159713"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="719159713"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 19:40:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue,  4 Apr 2023 19:40:36 -0700
Message-Id: <20230405024036.3969996-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230405024036.3969996-1-matthew.brost@intel.com>
References: <20230405024036.3969996-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe: Add always_invalidate_ggtt module
 parameter
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

Adding so if we suspect missing GGTT invalidation are causing user hangs
we can flip a module parameter to determine if that is the issue.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c   | 8 ++++++--
 drivers/gpu/drm/xe/xe_module.c | 4 ++++
 drivers/gpu/drm/xe/xe_module.h | 1 +
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 55d0c2554f7b..7620fdd234c7 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -18,6 +18,7 @@
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_module.h"
 #include "xe_wopcm.h"
 
 /* FIXME: Common file, preferably auto-gen */
@@ -281,9 +282,12 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 
 	/*
 	 * XXX: Unsure why without invalidation on every map during driver load
-	 * we can fail the driver load.
+	 * we can fail the driver load. Have a module parameter to always
+	 * invalidate the GGTT if we suspect this is an issue with user
+	 * submission.
 	 */
-	if (ggtt->invalidate || !gt->uc.guc.submission_state.enabled) {
+	if (always_invalidate_ggtt || ggtt->invalidate ||
+	    !gt->uc.guc.submission_state.enabled) {
 		xe_ggtt_invalidate(gt);
 		ggtt->invalidate = false;
 	}
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 6860586ce7f8..30f241153e05 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -22,6 +22,10 @@ bool enable_display = true;
 module_param_named(enable_display, enable_display, bool, 0444);
 MODULE_PARM_DESC(enable_display, "Enable display");
 
+bool always_invalidate_ggtt = false;
+module_param_named(always_invalidate_ggtt, always_invalidate_ggtt, bool, 0444);
+MODULE_PARM_DESC(always_invalidate_ggtt, "Always invalidate GGTT on map");
+
 u32 xe_force_vram_bar_size;
 module_param_named(vram_bar_size, xe_force_vram_bar_size, uint, 0600);
 MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 86916c176382..f9e111f33c9f 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -8,6 +8,7 @@
 /* Module modprobe variables */
 extern bool enable_guc;
 extern bool enable_display;
+extern bool always_invalidate_ggtt;
 extern u32 xe_force_vram_bar_size;
 extern int xe_guc_log_level;
 extern char *xe_param_force_probe;
-- 
2.34.1

