Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE28AC25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 06:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519B310E3D8;
	Fri, 24 May 2024 06:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGH7D5uB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C027E10E395
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 06:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716533840; x=1748069840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=izlIl4vozNhDOZpTInbgUXRqUgG+HR7SUXDb67tyIAM=;
 b=KGH7D5uBndeIJzSBFKUcLib/D2J8DY4v8vqCqfFfU8MALZjCCJhcQdUV
 46ZuJ9sT1EsWVcGeJBEHW1XDltKtwe7cWwGbGPA5TE3S/8Yy1ej0kH4C0
 6imVzar60MZHp56Rc4Fqqbdt9PWJ3y30wwMgLBSWH2cruJVIDT/ZHHxpv
 1cJ0VS18Dz7i6ryku8YH9TKocQHc8BkFywYEDc5Tp4iAIWefoPyj5YiIn
 70tSmiSDKnmVW3nuJgQPR3E2n0nwrH0pmEgdxur8fmv6Ijm+kQHcd4juN
 qmSc46JTJvmoCwD8pyZ+N4P6w0JnSbjkyh7twXbHqV0E9Nx724sdtUYIY w==;
X-CSE-ConnectionGUID: LqS9eTNOSv6J3dScUL+VRQ==
X-CSE-MsgGUID: IIQC08mFTryondIdjn75GQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="13014118"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="13014118"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 23:57:20 -0700
X-CSE-ConnectionGUID: B1p+OD1bTGClnfaBTYJ7YQ==
X-CSE-MsgGUID: KDhnbl0eQxWlD8ATJBW0kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="65142143"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 23:57:17 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Subject: [PATCH v4 1/2] drm/xe: Standardize power gate registers
Date: Fri, 24 May 2024 12:39:15 +0530
Message-Id: <20240524070916.143022-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240524070916.143022-1-riana.tauro@intel.com>
References: <20240524070916.143022-1-riana.tauro@intel.com>
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

Standardize power gate registers

No functional changes

v2: change commit message (Rodrigo)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++-----
 drivers/gpu/drm/xe/xe_gt_idle.c      |  2 +-
 drivers/gpu/drm/xe/xe_wa.c           | 10 +++++-----
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 9cacdcfe27ff..7c173db7d585 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -316,11 +316,9 @@
 
 #define FORCEWAKE_GT				XE_REG(0xa188)
 
-#define PG_ENABLE				XE_REG(0xa210)
-#define   VD2_MFXVDENC_POWERGATE_ENABLE		REG_BIT(8)
-#define   VD2_HCP_POWERGATE_ENABLE		REG_BIT(7)
-#define   VD0_MFXVDENC_POWERGATE_ENABLE		REG_BIT(4)
-#define   VD0_HCP_POWERGATE_ENABLE		REG_BIT(3)
+#define POWERGATE_ENABLE			XE_REG(0xa210)
+#define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
+#define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
 
 #define CTC_MODE				XE_REG(0xa26c)
 #define   CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 749b7f4b688f..6790b5674965 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -202,7 +202,7 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt)
 	xe_device_assert_mem_access(gt_to_xe(gt));
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
-	xe_mmio_write32(gt, PG_ENABLE, 0);
+	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
 	xe_mmio_write32(gt, RC_CONTROL, 0);
 	xe_mmio_write32(gt, RC_STATE, 0);
 }
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 05db53c1448c..64bc595fc727 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -238,11 +238,11 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	},
 	{ XE_RTP_NAME("14020316580"),
 	  XE_RTP_RULES(MEDIA_VERSION(1301)),
-	  XE_RTP_ACTIONS(CLR(PG_ENABLE,
-			     VD0_HCP_POWERGATE_ENABLE |
-			     VD0_MFXVDENC_POWERGATE_ENABLE |
-			     VD2_HCP_POWERGATE_ENABLE |
-			     VD2_MFXVDENC_POWERGATE_ENABLE)),
+	  XE_RTP_ACTIONS(CLR(POWERGATE_ENABLE,
+			     VDN_HCP_POWERGATE_ENABLE(0) |
+			     VDN_MFXVDENC_POWERGATE_ENABLE(0) |
+			     VDN_HCP_POWERGATE_ENABLE(2) |
+			     VDN_MFXVDENC_POWERGATE_ENABLE(2))),
 	},
 	{ XE_RTP_NAME("14019449301"),
 	  XE_RTP_RULES(MEDIA_VERSION(1301), ENGINE_CLASS(VIDEO_DECODE)),
-- 
2.40.0

