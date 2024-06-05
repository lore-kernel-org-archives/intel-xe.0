Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03355C27C53
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 09:34:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A1989919;
	Wed,  5 Jun 2024 09:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgEhow7m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57DB89919
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 09:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717580043; x=1749116043;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=72FVkl7eoLqXR5lQ2kx7INZR6RphKWMEkoYlf+gWpb4=;
 b=jgEhow7m60saPjX4kHFWWuv4qYIeX3bcAe5Ji8i9VMb4GJ3lcyyBy9cd
 ZUXiDNspO1jxE0GaGuFj6eEsqYSZnxMNt09gtKpQdW2PFZ8cbMAtEdjyN
 rs2BacRu71WbnR9n3KtBe0Ld9bKApCmrhIO6P30XnuSDecmBhx2S3iWJH
 F3qFMD+4nKVqWyfUvhrC6HqjAHduyPlifcrPArwGS3CaZYENc8iGMfcjU
 rkg4WhiUv1eIY55ZZHrFtffimeTMbw4qNgeN87tAm8JUT8/aP9aQM91LB
 YeLfUMSmNOYP3pfrlTsQHMSpJ5C7YhsECHlirJF/S8VTxiRp0+9gB5391 w==;
X-CSE-ConnectionGUID: Y4zZBXYvSD+Ne980R7P1uQ==
X-CSE-MsgGUID: 1A/TIn51T6i/qjEr6uwu0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14289346"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="14289346"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 02:34:02 -0700
X-CSE-ConnectionGUID: QmiUkAFpRreBi4Cnnpgkrg==
X-CSE-MsgGUID: Xh75rS8lQ/qKYLZNPiOSdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="37525704"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 05 Jun 2024 02:34:00 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH v3 1/3] drm/xe: Cleanup force wake registers bit definitions
Date: Wed,  5 Jun 2024 15:20:03 +0530
Message-Id: <20240605095005.1261268-1-himal.prasad.ghimiray@intel.com>
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

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++++---
 drivers/gpu/drm/xe/xe_force_wake.c   | 18 ++++++++++++------
 2 files changed, 17 insertions(+), 9 deletions(-)

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
index 9bbe8a5040da..54279c3814af 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -52,13 +52,15 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
 			    XE_FW_DOMAIN_ID_GT,
 			    FORCEWAKE_GT,
 			    FORCEWAKE_ACK_GT_MTL,
-			    BIT(0), BIT(16));
+			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
+			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
 	} else {
 		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
 			    XE_FW_DOMAIN_ID_GT,
 			    FORCEWAKE_GT,
 			    FORCEWAKE_ACK_GT,
-			    BIT(0), BIT(16));
+			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
+			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
 	}
 }
 
@@ -74,7 +76,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 			    XE_FW_DOMAIN_ID_RENDER,
 			    FORCEWAKE_RENDER,
 			    FORCEWAKE_ACK_RENDER,
-			    BIT(0), BIT(16));
+			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
+			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
 
 	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
 		if (!(gt->info.engine_mask & BIT(i)))
@@ -84,7 +87,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 			    XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
 			    FORCEWAKE_MEDIA_VDBOX(j),
 			    FORCEWAKE_ACK_MEDIA_VDBOX(j),
-			    BIT(0), BIT(16));
+			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
+			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
 	}
 
 	for (i = XE_HW_ENGINE_VECS0, j = 0; i <= XE_HW_ENGINE_VECS3; ++i, ++j) {
@@ -95,7 +99,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 			    XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
 			    FORCEWAKE_MEDIA_VEBOX(j),
 			    FORCEWAKE_ACK_MEDIA_VEBOX(j),
-			    BIT(0), BIT(16));
+			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
+			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
 	}
 
 	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0))
@@ -103,7 +108,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 			    XE_FW_DOMAIN_ID_GSC,
 			    FORCEWAKE_GSC,
 			    FORCEWAKE_ACK_GSC,
-			    BIT(0), BIT(16));
+			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
+			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
 }
 
 static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
-- 
2.25.1

