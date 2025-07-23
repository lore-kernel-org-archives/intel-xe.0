Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CE7C83F1A
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 13:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3C510E7CD;
	Wed, 23 Jul 2025 13:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7uwwAvX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CAB10E7CD
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 13:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753278385; x=1784814385;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mq6N/RKx603JQaLIoTM7HUOUzL1CQ/KB1TaJ1ewv0G4=;
 b=P7uwwAvXJ7lwB2Jd/dU899Fk2pGNKmBZeui3zD1GJ8R8mFI2yYHzpNpp
 Koq9xp0pixQdfxrreqI9mhgtbzvJwhKG3V44OmxWNaylbfrl7qiytJt9G
 arxFzs1/8X/I2U54bgoSElHEjnOZLLcb8pxyfjO8YilvhoEzJXC3a/Yir
 z6+I4jKNptUNDBHNofoWrx5ejvhK8SfqxckHWLcCz0MciXWZxlthnzaVF
 yXR/wO5K17ghBVYlipRupAWA3nfYvSGYLqzXJoiBUVNNR6c8YOMJmbnjO
 sOnODWHMt1RUffvSEe4g6a3+chrRZTO4pMzHENZtKtNsqxes8jVuPoI9T A==;
X-CSE-ConnectionGUID: pKhyS+EGQ5iSibUzekOG5g==
X-CSE-MsgGUID: WgA6OOQ6RJeFf8iaWNEiPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73138178"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="73138178"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 06:46:25 -0700
X-CSE-ConnectionGUID: 5P/7YdzRQqOFhEHw/eAT1A==
X-CSE-MsgGUID: V2biB0oWQ+OcN1oSawgYcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="190522700"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa001.fm.intel.com with ESMTP; 23 Jul 2025 06:46:19 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org,
	tejas.upadhyay@intel.com
Cc: lucas.demarchi@intel.com,
	Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] drm/xe: Rename MCFG_MCR_SELECTOR to STEER_SEMAPHORE
Date: Wed, 23 Jul 2025 19:40:39 +0530
Message-Id: <20250723141039.3848390-1-nitin.r.gote@intel.com>
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

The register at offset 0xfd0 was incorrectly named MCFG_MCR_SELECTOR,
likely copied from i915. According to the hardware specification (Bspec),
this register is actually called STEER_SEMAPHORE.

Rename the register definition and update its usage in xe_gt_mcr.c to
match the official hardware documentation.

No functional changes.

v2: Add Bspec reference (Tejas)

Bspec: 67113
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c       | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 5cd5ab8529c5..f96b2e2b3064 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -42,7 +42,7 @@
 #define FORCEWAKE_ACK_GSC			XE_REG(0xdf8)
 #define FORCEWAKE_ACK_GT_MTL			XE_REG(0xdfc)
 
-#define MCFG_MCR_SELECTOR			XE_REG(0xfd0)
+#define STEER_SEMAPHORE				XE_REG(0xfd0)
 #define MTL_MCR_SELECTOR			XE_REG(0xfd4)
 #define SF_MCR_SELECTOR				XE_REG(0xfd8)
 #define MCR_SELECTOR				XE_REG(0xfdc)
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 64a2f0d6aaf9..683ac021a06d 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -46,8 +46,6 @@
  * MCR registers are not available on Virtual Function (VF).
  */
 
-#define STEER_SEMAPHORE		XE_REG(0xFD0)
-
 static inline struct xe_reg to_xe_reg(struct xe_reg_mcr reg_mcr)
 {
 	return reg_mcr.__reg;
@@ -533,7 +531,7 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
 		u32 steer_val = REG_FIELD_PREP(MCR_SLICE_MASK, 0) |
 			REG_FIELD_PREP(MCR_SUBSLICE_MASK, 2);
 
-		xe_mmio_write32(&gt->mmio, MCFG_MCR_SELECTOR, steer_val);
+		xe_mmio_write32(&gt->mmio, STEER_SEMAPHORE, steer_val);
 		xe_mmio_write32(&gt->mmio, SF_MCR_SELECTOR, steer_val);
 		/*
 		 * For GAM registers, all reads should be directed to instance 1
-- 
2.25.1

