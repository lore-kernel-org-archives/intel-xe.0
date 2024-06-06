Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0484AC25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 08:41:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD35910E0A5;
	Thu,  6 Jun 2024 08:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ieIfqoIv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB2E10E0A5
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 08:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717663276; x=1749199276;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bpztutS96GK3vT1f3lvcjJyJr63pFIuSsW4GC2256i0=;
 b=ieIfqoIvrqrpj/f3nAPUXtea3JqIYrE7AjOCb9jX36Cr/SN3M3OTsf/N
 5UZ7/1reYfGVa1gC/NrIU1zglhGs3Xbw2SKypouh9kGyqdvGxtJzxpCvb
 kRj/JIVRutBRHCpmhNWiSBZdOg2RK5owjaSX1wwdjnJjt0csmUR1JA/6O
 kYb7B4rOEZJJmkIqBAzJWgJBl7sX0G6pS20UiMrJwaIuohCaLfsqcbq8Q
 lemzn/lCFydUt5vY484M+Fh0ZWjK9+QzqpgU3HMTJ9I5WuUhgxNACfssa
 nFhWpAv82OWxdG8vi2o9NaQdKNlUfL26+zi4lRQIGSU18+jhb05kojrXr w==;
X-CSE-ConnectionGUID: PKwN2tNlQW6qveLGZuOlmQ==
X-CSE-MsgGUID: 87Ajd2N2ScK3x7YN1C0WWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14450632"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="14450632"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 01:41:16 -0700
X-CSE-ConnectionGUID: B5JN46gpTaePowCslbhn6A==
X-CSE-MsgGUID: GMQ8VdgPT/6qXyarObW0gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="68700519"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa002.jf.intel.com with ESMTP; 06 Jun 2024 01:41:14 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [CI] drm/xe: Cleanup force wake registers bit definitions
Date: Thu,  6 Jun 2024 14:27:20 +0530
Message-Id: <20240606085720.1327152-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

- Remove unused bit definitions.
- Driver uses BIT(0) for waking/sleeping the domain and since the
registers are masked respective mask bit BIT(16) needs to be set. Use
defines for these bits and use them in domain initialization.

v3
- Use defines within domain_init

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++++---
 drivers/gpu/drm/xe/xe_force_wake.c   | 24 +++++++++---------------
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index d09b2473259f..47c26c37608d 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -487,9 +487,11 @@
 	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
 
 #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
-#define   FORCEWAKE_KERNEL			BIT(0)
-#define   FORCEWAKE_USER			BIT(1)
-#define   FORCEWAKE_KERNEL_FALLBACK		BIT(15)
+
+/* Applicable for all FORCEWAKE_DOMAIN and FORCEWAKE_ACK_DOMAIN regs */
+#define   FORCEWAKE_KERNEL			0
+#define   FORCEWAKE_MT(bit)			BIT(bit)
+#define   FORCEWAKE_MT_MASK(bit)		BIT((bit) + 16)
 
 #define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
 #define MTL_MEDIA_MC6				XE_REG(0x138048)
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 9bbe8a5040da..b2d385daff4b 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -28,13 +28,13 @@ fw_to_xe(struct xe_force_wake *fw)
 
 static void domain_init(struct xe_force_wake_domain *domain,
 			enum xe_force_wake_domain_id id,
-			struct xe_reg reg, struct xe_reg ack, u32 val, u32 mask)
+			struct xe_reg reg, struct xe_reg ack)
 {
 	domain->id = id;
 	domain->reg_ctl = reg;
 	domain->reg_ack = ack;
-	domain->val = val;
-	domain->mask = mask;
+	domain->val = FORCEWAKE_MT(FORCEWAKE_KERNEL);
+	domain->mask = FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL);
 }
 
 void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
@@ -51,14 +51,12 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
 		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
 			    XE_FW_DOMAIN_ID_GT,
 			    FORCEWAKE_GT,
-			    FORCEWAKE_ACK_GT_MTL,
-			    BIT(0), BIT(16));
+			    FORCEWAKE_ACK_GT_MTL);
 	} else {
 		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
 			    XE_FW_DOMAIN_ID_GT,
 			    FORCEWAKE_GT,
-			    FORCEWAKE_ACK_GT,
-			    BIT(0), BIT(16));
+			    FORCEWAKE_ACK_GT);
 	}
 }
 
@@ -73,8 +71,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 		domain_init(&fw->domains[XE_FW_DOMAIN_ID_RENDER],
 			    XE_FW_DOMAIN_ID_RENDER,
 			    FORCEWAKE_RENDER,
-			    FORCEWAKE_ACK_RENDER,
-			    BIT(0), BIT(16));
+			    FORCEWAKE_ACK_RENDER);
 
 	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
 		if (!(gt->info.engine_mask & BIT(i)))
@@ -83,8 +80,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j],
 			    XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
 			    FORCEWAKE_MEDIA_VDBOX(j),
-			    FORCEWAKE_ACK_MEDIA_VDBOX(j),
-			    BIT(0), BIT(16));
+			    FORCEWAKE_ACK_MEDIA_VDBOX(j));
 	}
 
 	for (i = XE_HW_ENGINE_VECS0, j = 0; i <= XE_HW_ENGINE_VECS3; ++i, ++j) {
@@ -94,16 +90,14 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j],
 			    XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
 			    FORCEWAKE_MEDIA_VEBOX(j),
-			    FORCEWAKE_ACK_MEDIA_VEBOX(j),
-			    BIT(0), BIT(16));
+			    FORCEWAKE_ACK_MEDIA_VEBOX(j));
 	}
 
 	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0))
 		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GSC],
 			    XE_FW_DOMAIN_ID_GSC,
 			    FORCEWAKE_GSC,
-			    FORCEWAKE_ACK_GSC,
-			    BIT(0), BIT(16));
+			    FORCEWAKE_ACK_GSC);
 }
 
 static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
-- 
2.25.1

