Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5490FC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 09:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AA710E69B;
	Thu,  8 Aug 2024 09:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YF+eqGL0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80EC10E69A
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 09:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723109187; x=1754645187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y877xISEqwb5JBf/08YDM09ZplrX9vCbv21dEvO6DSQ=;
 b=YF+eqGL05yVldHjBf/1kO+5IJqMzVGZY+b+L1Z/RQv8vzQEZFLxuX6ss
 ++a2XTsvCEmPVkIzKRG/z+KkOY8lWS+MP+9dTcXFYvDvjZAqQgXSo5kXq
 9ydBTPGNQUpojU+eLQyuXW6ZCGSXlwU5RAaD0ym1xFiPf6t1GPpfO50Ng
 HnpBTYLvDnCHjbh5nwj2Bkpqnk1dKA/e5mb6B160nkEM0ShUUgBC9BwJt
 aOaBb0SFscKS6g0+wAlGiPt7gx5dffwkNZnm5yYMItEOr6IAhgWxXzD4N
 5wWxI2q6syIvAedvhoiTI6ni01rrDdmZN9cWCamAzbOTNvczgrvD1ViIl Q==;
X-CSE-ConnectionGUID: IpNPaH0+SmapPy7Wdoa4BA==
X-CSE-MsgGUID: o7t893hmTjSbUG1I8GBv9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="25094240"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="25094240"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 02:26:26 -0700
X-CSE-ConnectionGUID: tRBNxOtpSsGOtjuLZ0E9jw==
X-CSE-MsgGUID: UZjh3IRAT/mSEv6n3qcG0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="62000435"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa003.jf.intel.com with ESMTP; 08 Aug 2024 02:26:25 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 2/2] drm/xe: Write all slices if its mcr register
Date: Thu,  8 Aug 2024 14:58:26 +0530
Message-Id: <20240808092826.585276-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240808092826.585276-1-tejas.upadhyay@intel.com>
References: <20240808092826.585276-1-tejas.upadhyay@intel.com>
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

Register GAMREQSTRM_CTRL should be considered mcr register
which should write to all slices as per documentation.

Bspec: 71185
Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
 drivers/gpu/drm/xe/xe_gt.c           | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 2c8c4d4218db..41b70073e18d 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -83,7 +83,7 @@
 #define STATELESS_COMPRESSION_CTRL		XE_REG(0x4148)
 #define   UNIFIED_COMPRESSION_FORMAT		REG_GENMASK(3, 0)
 
-#define XE2_GAMREQSTRM_CTRL			XE_REG(0x4194)
+#define XE2_GAMREQSTRM_CTRL			XE_REG_MCR(0x4194)
 #define   CG_DIS_CNTLBUS			REG_BIT(6)
 
 #define CCS_AUX_INV				XE_REG(0x4208)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 238c7d1053f0..224c137967c3 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -110,9 +110,9 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 
 	if (!xe_gt_is_media_type(gt)) {
 		xe_mmio_write32(gt, SCRATCH1LPFC, EN_L3_RW_CCS_CACHE_FLUSH);
-		reg = xe_mmio_read32(gt, XE2_GAMREQSTRM_CTRL);
+		reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
 		reg |= CG_DIS_CNTLBUS;
-		xe_mmio_write32(gt, XE2_GAMREQSTRM_CTRL, reg);
+		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
 	}
 
 	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0x3);
@@ -134,9 +134,9 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
 	if (WARN_ON(err))
 		return;
 
-	reg = xe_mmio_read32(gt, XE2_GAMREQSTRM_CTRL);
+	reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
 	reg &= ~CG_DIS_CNTLBUS;
-	xe_mmio_write32(gt, XE2_GAMREQSTRM_CTRL, reg);
+	xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
-- 
2.25.1

