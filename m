Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87717C27C40
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 16:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A53410E591;
	Thu, 24 Aug 2023 16:09:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EA110E579
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 16:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692893389; x=1724429389;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B8BDTDIqWr/8h614s8umJ5A4YQeIR46uODLIjRvqgyQ=;
 b=KvnVg5qY1assOTkROFdaYP3hl+bAZX8gRqEcNaqo2rD1qDCpWMaZSDVT
 Dly7zF77eUyXIC9im4WUsm0eftJ4A40cBha+uYzFqQcZLofzZ7WfxYHtd
 OGqSVXxaoY5LUQ9zZH8juSQU4DYCeJzZX1b1VHUUmqCLZ7MR5nWKBf2Sb
 YouKEN7nD5sakVLNmHA/ERGj8/HCBhw+4AE1NYrKVVlop1TQopRtnJO0g
 ndWD9GT2/f1EyMkr3Am0vuzFlOqSiwYCR4YuGtBdOiVu/FTCuyP9Z5kzW
 VeCPx/4bdipXG3/nCcbnVR/NciIHXtIQCq8eUvm+WJUfEUjlTQ+wKwWXP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="377229420"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="377229420"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 09:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="851574247"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="851574247"
Received: from romanbog-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.5.6])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 09:04:52 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 24 Aug 2023 17:04:45 +0100
Message-ID: <20230824160444.494648-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: nuke GuC on unload
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On PVC unloading followed by reloading the module often results in a
completely dead machine (seems to be plaguing CI). Resetting the GuC
like we do at load seems to cure it at least when locally testing this.

v2:
  - Move pc_fini into guc_fini. We want to do the GuC reset just after
    calling pc_fini, otherwise we encounter communication failures. It
    also seems like a good idea to do the reset before we start releasing
    the various other GuC resources. In the case of pc_fini there is an
    explicit stop, but for other stuff like logs, ads, ctb there is not.

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/542
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/597
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c    | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c |  8 +-------
 drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
 drivers/gpu/drm/xe/xe_uc.c     |  5 +++++
 drivers/gpu/drm/xe/xe_uc.h     |  1 +
 5 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e102637c0695..3cea4323113f 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -5,6 +5,8 @@
 
 #include "xe_guc.h"
 
+#include <drm/drm_managed.h>
+
 #include "generated/xe_wa_oob.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
@@ -20,6 +22,7 @@
 #include "xe_guc_submit.h"
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
+#include "xe_uc.h"
 #include "xe_uc_fw.h"
 #include "xe_wa.h"
 #include "xe_wopcm.h"
@@ -217,6 +220,16 @@ static void guc_write_params(struct xe_guc *guc)
 		xe_mmio_write32(gt, SOFT_SCRATCH(1 + i), guc->params[i]);
 }
 
+static void guc_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_guc *guc = arg;
+
+	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
+	xe_guc_pc_fini(&guc->pc);
+	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
+	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
+}
+
 int xe_guc_init(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
@@ -244,6 +257,10 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
+	ret = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, guc_fini, guc);
+	if (ret)
+		return ret;
+
 	guc_init_params(guc);
 
 	if (xe_gt_is_media_type(gt))
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index c03bb58e7049..87de1ce40e07 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -884,10 +884,8 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 	return ret;
 }
 
-static void pc_fini(struct drm_device *drm, void *arg)
+void xe_guc_pc_fini(struct xe_guc_pc *pc)
 {
-	struct xe_guc_pc *pc = arg;
-
 	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
@@ -925,9 +923,5 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	if (err)
 		return err;
 
-	err = drmm_add_action_or_reset(&xe->drm, pc_fini, pc);
-	if (err)
-		return err;
-
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 81833a53b3c9..43ea582545b5 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -9,6 +9,7 @@
 #include "xe_guc_pc_types.h"
 
 int xe_guc_pc_init(struct xe_guc_pc *pc);
+void xe_guc_pc_fini(struct xe_guc_pc *pc);
 int xe_guc_pc_start(struct xe_guc_pc *pc);
 int xe_guc_pc_stop(struct xe_guc_pc *pc);
 int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index addd6f2681b9..9c8ce504f4da 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -167,6 +167,11 @@ int xe_uc_init_hw(struct xe_uc *uc)
 	return 0;
 }
 
+int xe_uc_fini_hw(struct xe_uc *uc)
+{
+	return xe_uc_sanitize_reset(uc);
+}
+
 int xe_uc_reset_prepare(struct xe_uc *uc)
 {
 	/* GuC submission not enabled, nothing to do */
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 42219b361df5..4109ae7028af 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -12,6 +12,7 @@ int xe_uc_init(struct xe_uc *uc);
 int xe_uc_init_hwconfig(struct xe_uc *uc);
 int xe_uc_init_post_hwconfig(struct xe_uc *uc);
 int xe_uc_init_hw(struct xe_uc *uc);
+int xe_uc_fini_hw(struct xe_uc *uc);
 void xe_uc_gucrc_disable(struct xe_uc *uc);
 int xe_uc_reset_prepare(struct xe_uc *uc);
 void xe_uc_stop_prepare(struct xe_uc *uc);
-- 
2.41.0

