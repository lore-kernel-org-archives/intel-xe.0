Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83156C83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 11:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442B210E155;
	Wed, 23 Jul 2025 11:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aE3LE35T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C1E10E155
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 11:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753269390; x=1784805390;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1b38hp7IdH5i5vuLFMdKPu2VeZnAeAiXlwxZrHM9s6k=;
 b=aE3LE35TCqwXhF8OsSMV2sfJQN/28rXJ3vDp7ZH49KKk7bfDeMQ8sq2d
 2+gfJ6J412oRfknAmhnrSD1RczDjqDg2zgzIrjzGgOOCPSgE+NImJDy5Z
 fAoXmiUhKKCd9vL7FAdGkp+6HU6aY32jGAIXguWImy5IUKZvezPUCQAsL
 UjgAexRfnAuAJXejnaxQOwUrDgVDQ7NgPCSxCnYdZ3seRp2qTZzC9qzaY
 wm2cqGAzyutj/uRwQbvg1VMk3NnPaQGOjTLWRhFFqIf7vKV8i3mLl4GcS
 DLhte60JsQAayQOBdbmIeO0GaoUgenhOsamPkd4BlzXZOjHMlxlqSbC+U w==;
X-CSE-ConnectionGUID: NXTFjfXdRIG1qh2Jl2R0uQ==
X-CSE-MsgGUID: z9CcdlvnTN60Wkqj6Yq2ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55648542"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="55648542"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 04:16:30 -0700
X-CSE-ConnectionGUID: qPMfa5bWTv+G0iaJGjkX4A==
X-CSE-MsgGUID: MwCmkYRSTiWNq48dec3Hhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="163686940"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa003.jf.intel.com with ESMTP; 23 Jul 2025 04:16:28 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, tejas.upadhyay@intel.com,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] drm/xe: Rename MCFG_MCR_SELECTOR to STEER_SEMAPHORE
Date: Wed, 23 Jul 2025 17:10:50 +0530
Message-Id: <20250723114050.3790099-1-nitin.r.gote@intel.com>
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
likely copied from i915. According to the hardware specification (bspec),
this register is actually called STEER_SEMAPHORE.

Rename the register definition and update its usage in xe_gt_mcr.c to
match the official hardware documentation.

No functional changes.

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
Hi,

Removed STEER_SEMAPHORE definition from xe_gt_mcr.c
as missed to remove in first version.

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

