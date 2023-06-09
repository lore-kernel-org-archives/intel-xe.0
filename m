Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDBEC7EE29
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 14:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F5D10E6B8;
	Fri,  9 Jun 2023 14:38:46 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9109710E6B8
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 14:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686321523; x=1717857523;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IDz0hTISkinPRAXleEyjIv/e9faxOEO2TyhLtk22wA4=;
 b=aPHW1TjGGdCrM0nnbul2umBObI5fnFF6QH7+bjXvEoBzsroAYHUsOgl7
 4ZPr9c/E7Et7CqvgcxsgjWLkYMkJqhl/2P89okWbS9YSnCXAyCubD3zGz
 uM5amJAJq3h7Q9tbhmBi/QWHveq09w8YAzRqpd1kw5j/9RWkln34YWYzP
 wwS1TvZ61kQKKbSO4oMm2gIhh7drlbDhqFxOpyrPvJQstkjq2jvDS7gLu
 PlyZbfC4k3IIeGVZb67ejVa+vhuIAB4OaGrvQxq6JQS9Zc8NkeyUtwHDP
 7rWEyezheEn7Dkp0Ps8LrmNqUnWhBz36YCMMsk6TrhzhYM752jSpgT89K w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="360094465"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="360094465"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 07:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="957175720"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="957175720"
Received: from pdhernan-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.255.35.182])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 07:38:41 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  9 Jun 2023 11:38:14 -0300
Message-Id: <20230609143815.302540-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609143815.302540-1-gustavo.sousa@intel.com>
References: <20230609143815.302540-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe/reg_sr: Use a single parameter for
 xe_reg_sr_apply_whitelist()
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

All other parameters can be extracted from a single struct xe_hw_engine
reference. This removes redundancy and simplifies the code.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c        | 3 +--
 drivers/gpu/drm/xe/xe_hw_engine.c | 2 +-
 drivers/gpu/drm/xe/xe_reg_sr.c    | 7 +++++--
 drivers/gpu/drm/xe/xe_reg_sr.h    | 4 ++--
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3799e663bad3..2458397ce8af 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -491,8 +491,7 @@ static int do_gt_restart(struct xe_gt *gt)
 
 	for_each_hw_engine(hwe, gt, id) {
 		xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
-		xe_reg_sr_apply_whitelist(&hwe->reg_whitelist,
-					  hwe->mmio_base, gt);
+		xe_reg_sr_apply_whitelist(hwe);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b42a0cb50159..68cd793cdfb5 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -381,7 +381,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	XE_BUG_ON(!(gt->info.engine_mask & BIT(id)));
 
 	xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
-	xe_reg_sr_apply_whitelist(&hwe->reg_whitelist, hwe->mmio_base, gt);
+	xe_reg_sr_apply_whitelist(hwe);
 
 	hwe->hwsp = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K, ttm_bo_type_kernel,
 					 XE_BO_CREATE_VRAM_IF_DGFX(tile) |
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 8580ff38b82c..65e6ad1906c6 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -20,6 +20,7 @@
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
+#include "xe_hw_engine_types.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_reg_whitelist.h"
@@ -211,12 +212,14 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
 }
 
-void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
-			       struct xe_gt *gt)
+void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 {
+	struct xe_reg_sr *sr = &hwe->reg_whitelist;
+	struct xe_gt *gt = hwe->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_reg_sr_entry *entry;
 	struct drm_printer p;
+	u32 mmio_base = hwe->mmio_base;
 	unsigned long reg;
 	unsigned int slot = 0;
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
index c3001798d9e8..e3197c33afe2 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.h
+++ b/drivers/gpu/drm/xe/xe_reg_sr.h
@@ -14,6 +14,7 @@
 
 struct xe_device;
 struct xe_gt;
+struct xe_hw_engine;
 struct drm_printer;
 
 int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe);
@@ -22,7 +23,6 @@ void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
 int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e,
 		  struct xe_gt *gt);
 void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt);
-void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
-			       struct xe_gt *gt);
+void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe);
 
 #endif
-- 
2.40.1

