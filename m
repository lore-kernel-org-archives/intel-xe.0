Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00B2EE0217
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE0010E9BA;
	Tue, 10 Sep 2024 23:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HIGJju55";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2955F10E8F5
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012049; x=1757548049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=67C8sw54li7fHhOdcHPtcw3p3HdfVJBDkmjsnEoiRfs=;
 b=HIGJju55mzFdQzc2Frn94usoGqjYnNqEIVIF3CNNetSN5YTDI9g5vaCz
 1nOWzoLQB7sBsDor32N+ErOLYO8ufvyREYQ5WCN2RE38qRvxHr7JBR6nR
 kzvC8Y1NK2+gN8+AMvo2gb/1JzeJw9Bo84cMEWK+K0YgHFopcQAVrhHff
 7TeCKqtfq/V2BLP+2dv7mbb1rxvij5VZjT46Gi81ZVDPdIRw3sP8eUjDt
 hyIkHdQEz/rqeBkcuTbABR0eP61yyR6XG3EHd+3IwQdQQeumFD8kW4O4X
 ODo5zLumDzaPyShP6m6VAyTAZK4a/R53ZePls5GhkX5aQYRWMuGg6hAhc A==;
X-CSE-ConnectionGUID: wfZdwt/mQo2Mefl2YwP/yA==
X-CSE-MsgGUID: w0sJonkMQbya/AmCKgWwcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144323"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144323"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:29 -0700
X-CSE-ConnectionGUID: niESq8Q+QHGBrXhzEDqRZA==
X-CSE-MsgGUID: fi28qLt7QFaql6RTW6wavw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989644"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 32/43] drm/xe/topology: Convert register access to use
 xe_mmio
Date: Tue, 10 Sep 2024 16:47:52 -0700
Message-ID: <20240910234719.3335472-77-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910234719.3335472-45-matthew.d.roper@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 0662f71c6ede..651ba53623e5 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -25,7 +25,7 @@ load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
 
 	va_start(argp, numregs);
 	for (i = 0; i < numregs; i++)
-		fuse_val[i] = xe_mmio_read32(gt, va_arg(argp, struct xe_reg));
+		fuse_val[i] = xe_mmio_read32(&gt->mmio, va_arg(argp, struct xe_reg));
 	va_end(argp);
 
 	bitmap_from_arr32(mask, fuse_val, numregs * 32);
@@ -35,7 +35,7 @@ static void
 load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask, enum xe_gt_eu_type *eu_type)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	u32 reg_val = xe_mmio_read32(gt, XELP_EU_ENABLE);
+	u32 reg_val = xe_mmio_read32(&gt->mmio, XELP_EU_ENABLE);
 	u32 val = 0;
 	int i;
 
@@ -127,7 +127,7 @@ static void
 load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	u32 fuse3 = xe_mmio_read32(gt, MIRROR_FUSE3);
+	u32 fuse3 = xe_mmio_read32(&gt->mmio, MIRROR_FUSE3);
 
 	if (GRAPHICS_VER(xe) >= 20) {
 		xe_l3_bank_mask_t per_node = {};
@@ -141,7 +141,7 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
 		xe_l3_bank_mask_t per_node = {};
 		xe_l3_bank_mask_t per_mask_bit = {};
 		u32 meml3_en = REG_FIELD_GET(MEML3_EN_MASK, fuse3);
-		u32 fuse4 = xe_mmio_read32(gt, XEHP_FUSE4);
+		u32 fuse4 = xe_mmio_read32(&gt->mmio, XEHP_FUSE4);
 		u32 bank_val = REG_FIELD_GET(GT_L3_EXC_MASK, fuse4);
 
 		bitmap_set_value8(per_mask_bit, 0x3, 0);
-- 
2.45.2

