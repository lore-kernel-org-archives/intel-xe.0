Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEEFC30653
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jul 2024 06:45:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0793A10E100;
	Wed,  3 Jul 2024 06:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXvOAQ7/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0A510E100
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jul 2024 06:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719989125; x=1751525125;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s8inlRt3nqF90r+QimeuS6Zkkf5szU01bxvhAdh0XwQ=;
 b=HXvOAQ7/0MM5qgyFfsrkRzvpD1CqSanxqYVw3BLq9PSh8S2kcSbOVTyv
 CIXuACLuRSghK0N0RgjyA28RIozbiHL9iWYaAq4sBBcJM4H+CMDA2hn4X
 JnqsKom4hIm52KnpggpCMEWg6sOm1pwnjkJt6QxYU1GwQyQHZLDjtNREp
 ocwxTvo3OW0ZkKbAt0/3zPcWf9eE/rtgDBDaHwdzTNUlF2+mMgj1l0EGn
 jybtkeWwXKR1yf5tm/1Q4BMQt9Id0qUOxXHF9q/2NMtezsrnzdC8KFG6E
 dYYAaXBCPE6fvcOziR0MzaXAcBhtmdNEbOpEeYML5i+WYy7UYCJKCyqrp Q==;
X-CSE-ConnectionGUID: /d2ti0f0Qg+d+vfsoqE4sg==
X-CSE-MsgGUID: GjF03XXITAq007EveZw/3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28592785"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; d="scan'208";a="28592785"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 23:45:24 -0700
X-CSE-ConnectionGUID: MvRKXywjR22PxJiTa2UYRQ==
X-CSE-MsgGUID: Zozd0Ro5QpGQHwEiD23lcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; d="scan'208";a="46053464"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa010.jf.intel.com with ESMTP; 02 Jul 2024 23:45:23 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2] drm/xe/xe2: Add Wa_15015404425
Date: Wed,  3 Jul 2024 12:16:26 +0530
Message-Id: <20240703064626.2581326-1-tejas.upadhyay@intel.com>
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

Wa_15015404425 applies to xe2 LNL all steppings

V2:
  - Add WA to 8/16/32bit reads also - MattR
  - Corrected dummy reg address - MattR
  - Use for loop to avoid mental pause - JaniN

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h |  1 +
 drivers/gpu/drm/xe/xe_mmio.c      | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 23e33ec84902..56a1ba59cbd3 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -45,6 +45,7 @@
 #define STOLEN_RESERVED				XE_REG(0x1082c0)
 #define   WOPCM_SIZE_MASK			REG_GENMASK64(9, 7)
 
+#define MEDIA_DUMMY_REG				XE_REG(0x130030)
 #define MTL_RP_STATE_CAP			XE_REG(0x138000)
 
 #define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f92faad4b96d..51022a560086 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -121,12 +121,28 @@ int xe_mmio_init(struct xe_device *xe)
 	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
 }
 
+static void mmio_flush_pending_writes(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int i;
+
+	if (!(xe->info.platform == XE_LUNARLAKE))
+		return;
+
+	/* 4 dummy writes */
+	for (i = 0; i < 4; i++)
+		xe_mmio_write32(gt, MEDIA_DUMMY_REG, 0);
+}
+
 u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
 	u8 val;
 
+	/* Wa_15015404425 */
+	mmio_flush_pending_writes(gt);
+
 	val = readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
 	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
 
@@ -139,6 +155,9 @@ u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
 	u16 val;
 
+	/* Wa_15015404425 */
+	mmio_flush_pending_writes(gt);
+
 	val = readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
 	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
 
@@ -160,6 +179,9 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
 	u32 val;
 
+	/* Wa_15015404425 */
+	mmio_flush_pending_writes(gt);
+
 	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
 		val = xe_gt_sriov_vf_read32(gt, reg);
 	else
-- 
2.25.1

