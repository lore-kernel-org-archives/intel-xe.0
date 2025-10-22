Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98A2CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 05:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6A210E6A6;
	Wed, 22 Oct 2025 05:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X/5zJZn+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1AC10E6A6
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 05:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761110318; x=1792646318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kNe/ldpprZOuhpick8Io25g0rJgUmTnKJ8GIwmCXStk=;
 b=X/5zJZn+pU8/6IeN2O8qA+0hJZKXniyqf6p9xVSSwb+UscZTzi+bDfqi
 dyd4rODNhFT9F1a4I2J8wsBCOZV6tRbKSCAf+wV0dUkA45YOYJNbJ9myj
 frRuHNy87pafIfT9D7482wOqkNUHtfiD/AjJHrNFmCwBzqYf+IMws4Nuo
 53w3jnKmhB6hdkNhOceNo0fTUE8GJhV8PNgu1o9jFa9REmDEin2mdkXqh
 ZEYGFDPObkienkigzEKXRae9paSoofWr03bjyMob3u7GX8pziJ8Bj3Cvi
 8XgimRAW6RyC8Ok67I6kp617JUN0uQtEeqxsBQTH0JTaBiBNPufsdvyu9 w==;
X-CSE-ConnectionGUID: C9tw6LHBT3+bX4ZXpTe1Pg==
X-CSE-MsgGUID: dxGsBeKCTYC0JPQLvP7Bzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67083981"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67083981"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
X-CSE-ConnectionGUID: 0CeHjQxTTpqrKk8OyxkgHw==
X-CSE-MsgGUID: hgJE0SJNQlyH83D2GLnD/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="220959713"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH 11/12] drm/xe/pf: Add TLB invalidation support for MERT
Date: Tue, 21 Oct 2025 22:17:43 -0700
Message-ID: <20251021-cri-v1-11-bf11e61d9f49@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
Content-Transfer-Encoding: 8bit
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

From: Lukasz Laguna <lukasz.laguna@intel.com>

Trigger MERT's TLB invalidation after LMTT updates ensuring memory
translations remain coherent.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_mert_regs.h     |  3 +++
 drivers/gpu/drm/xe/xe_device_types.h       |  6 ++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_irq.c                |  8 ++++++++
 drivers/gpu/drm/xe/xe_sriov_pf.c           |  3 +++
 5 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
index 5b7c15e08747e..aef66c04901d2 100644
--- a/drivers/gpu/drm/xe/regs/xe_mert_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
@@ -10,4 +10,7 @@
 
 #define MERT_LMEM_CFG				XE_REG(0x1448b0)
 
+#define MERT_TLB_INV_DESC_A			XE_REG(0x14cf7c)
+#define   MERT_TLB_INV_DESC_A_VALID		REG_BIT(0)
+
 #endif /* _XE_MERT_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index fb401809fae5a..6fcd35bee73b5 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -219,6 +219,12 @@ struct xe_tile {
 
 	/** @debugfs: debugfs directory associated with this tile */
 	struct dentry *debugfs;
+
+	/** @mert: MERT-related data */
+	struct {
+		/** @mert.tlb_inv_done: completion of TLB invalidation */
+		struct completion tlb_inv_done;
+	} mert;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index c0c0215c07036..ebe81cb21f5ab 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -10,6 +10,7 @@
 #include "abi/guc_klvs_abi.h"
 
 #include "regs/xe_guc_regs.h"
+#include "regs/xe_mert_regs.h"
 
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -31,6 +32,7 @@
 #include "xe_lmtt.h"
 #include "xe_map.h"
 #include "xe_migrate.h"
+#include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vram_types.h"
@@ -1346,6 +1348,20 @@ static int pf_distribute_config_lmem(struct xe_gt *gt, unsigned int vfid, u64 si
 	return 0;
 }
 
+static void invalidate_mert_lmtt(struct xe_device *xe)
+{
+	const long timeout = HZ / 4;
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+
+	xe_assert(xe, xe_device_has_mert(xe));
+
+	reinit_completion(&tile->mert.tlb_inv_done);
+	xe_mmio_write32(&tile->mmio, MERT_TLB_INV_DESC_A, MERT_TLB_INV_DESC_A_VALID);
+
+	if (!wait_for_completion_timeout(&tile->mert.tlb_inv_done, timeout))
+		drm_err(&xe->drm, "MERT TLB invalidation timeout\n");
+}
+
 static void pf_force_lmtt_invalidate(struct xe_device *xe)
 {
 	struct xe_lmtt *lmtt;
@@ -1359,6 +1375,9 @@ static void pf_force_lmtt_invalidate(struct xe_device *xe)
 		lmtt = &tile->sriov.pf.lmtt;
 		xe_lmtt_invalidate_hw(lmtt);
 	}
+
+	if (xe_device_has_mert(xe))
+		invalidate_mert_lmtt(xe);
 }
 
 static void pf_reset_vf_lmtt(struct xe_device *xe, unsigned int vfid)
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 011b5eb66102f..82bf0d3995dfe 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -12,6 +12,7 @@
 #include "display/xe_display.h"
 #include "regs/xe_guc_regs.h"
 #include "regs/xe_irq_regs.h"
+#include "regs/xe_mert_regs.h"
 #include "xe_device.h"
 #include "xe_drv.h"
 #include "xe_gsc_proxy.h"
@@ -468,8 +469,15 @@ static void dg1_intr_enable(struct xe_device *xe, bool stall)
 
 static void mert_irq_handler(struct xe_device *xe, u32 master_ctl)
 {
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	u32 reg_val;
+
 	if (!(master_ctl & SOC_H2DMEMINT_IRQ))
 		return;
+
+	reg_val = xe_mmio_read32(&tile->mmio, MERT_TLB_INV_DESC_A);
+	if (!(reg_val & MERT_TLB_INV_DESC_A_VALID))
+		complete(&tile->mert.tlb_inv_done);
 }
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index bc1ab9ee31d92..b40701d75dacb 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -88,6 +88,7 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
  */
 int xe_sriov_pf_init_early(struct xe_device *xe)
 {
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 	int err;
 
 	xe_assert(xe, IS_SRIOV_PF(xe));
@@ -103,6 +104,8 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
 
 	xe_sriov_pf_service_init(xe);
 
+	init_completion(&root_tile->mert.tlb_inv_done);
+
 	return 0;
 }
 

-- 
2.51.0

