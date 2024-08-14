Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A712C52D7F
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 09:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5A010E1F6;
	Wed, 14 Aug 2024 09:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J/gP8Hw1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E56D10E1F6
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 09:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723629250; x=1755165250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PfKOBbjWRayQVVw47KXdWJI1DQTNb3z39Ww5rgoj3c0=;
 b=J/gP8Hw1sTncFZtO9lc74rN2SIS81NSS1PH9/z5sDhfwKnMRnUoajJQE
 VYJ2Z3AaBoY3CDR0GOncmR8urxkNyZk0Pu6rzsxwkpffKJzFDJoHPPrSM
 xawxHsqhq6ThTi/gVdJhuamrSQIkjWkNddiCvYx4rnGkgzM496R0GKfHP
 JFoyPuTohhJb4ImHobSKPg/U5g7IpNP6v4t1qDboKXkOqdsxhPn0cgtWS
 iNBfSJPRSXZyTdKF02kHOprp9p8bBJ/2hQULOEFEA/SDT/yYRK2mJMk5U
 QAAh6pB3lY4tCMoYv9BqjcsFxNYiSw2DDirF6nJu4MIecPNcHIcZLOuIA Q==;
X-CSE-ConnectionGUID: iffMpuUvROy09CiYAKiRew==
X-CSE-MsgGUID: eu0SnacvRGWJh6av7zVugQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32510054"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="32510054"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 02:54:07 -0700
X-CSE-ConnectionGUID: qLhwFbLuTNihoGTLVxYcHg==
X-CSE-MsgGUID: df8RZCToQCKxWn/qxQEbVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="63624180"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa004.fm.intel.com with ESMTP; 14 Aug 2024 02:54:05 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2 2/3] drm/xe: Write all slices if its mcr register
Date: Wed, 14 Aug 2024 15:26:13 +0530
Message-Id: <20240814095614.909774-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814095614.909774-1-tejas.upadhyay@intel.com>
References: <20240814095614.909774-1-tejas.upadhyay@intel.com>
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
index 5f33dee35f8a..aeb17fcb27ac 100644
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

