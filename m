Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0F4C27C40
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 17:58:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDDF10E09F;
	Wed, 23 Aug 2023 17:58:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F8210E095
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 17:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692813489; x=1724349489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6/Psedxf1mP5FYbuuxDqu8ki7jrAEr/m0mXTxT6gbRU=;
 b=DYem16qR4+XrC3gVe7Sp4HAXegKWS+mrLvKiNYvPd6IfPm2UlIhL/HFE
 x88wWXfwyPtsHpnn/q/jg8LLH+Kr8R4eZ0q5/gf9cLHORoZXYOjw41AH7
 rOsbOdKTsbuv/AKdI831wF5pNdWDrQpffWqcPB/32yqja6dipoIdSHuts
 S0139rHvlwoyAWLx8p4qNW1g5zhzKQ0TcIJrtFvGKcCBvUjZntHtSRNUH
 Doq+H6T/8L2ZcmXJwP/0YRFhT9JHA0CLoKvUZaok3poTKH+l9jZXWOxnV
 fS/MHAd6483dEMq29hGpCMAl2vtX/Magwyaa2CmKS4PhasPcsN82TK0RN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="440589330"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="440589330"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 10:56:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="736750855"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="736750855"
Received: from fskirtun-mobl-g8.ger.corp.intel.com (HELO
 mwauld-desk1.intel.com) ([10.252.21.28])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 10:56:16 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 23 Aug 2023 18:55:53 +0100
Message-ID: <20230823175551.230686-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823175551.230686-3-matthew.auld@intel.com>
References: <20230823175551.230686-3-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: nuke GuC on unload
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

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/542
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/597
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_uc.c  |  5 +++++
 drivers/gpu/drm/xe/xe_uc.h  |  1 +
 3 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e102637c0695..bbe06686a706 100644
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
@@ -217,6 +220,15 @@ static void guc_write_params(struct xe_guc *guc)
 		xe_mmio_write32(gt, SOFT_SCRATCH(1 + i), guc->params[i]);
 }
 
+static void guc_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_guc *guc = arg;
+
+	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
+	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
+	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
+}
+
 int xe_guc_init(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
@@ -240,6 +252,10 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
+	ret = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, guc_fini, guc);
+	if (ret)
+		goto out;
+
 	ret = xe_guc_pc_init(&guc->pc);
 	if (ret)
 		goto out;
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

