Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367A3C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 06:32:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACBA10E10A;
	Fri, 24 May 2024 06:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bTXAkuHB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE27510E1BC
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 06:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716532343; x=1748068343;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YHOrV8p2E5/ma/lIjB9uxlE0KgRhKzdrmxPR8cJhAZI=;
 b=bTXAkuHBrqDNsJNQ23HTcDjLeDUR8F6l9doqCvPNXZiYNi6cNoIr6/y2
 c8JF05RT0tjdn7WlbS5Rv5KcZEDru5z2EHskj1g4s8f2DAoNve8V67swX
 V3jr+eWVtQ88TdK3wUUpMZy2LT+cjEKEwXxzxKh7NRMzbCo1Pf0AyEH9y
 D2NAXiPthuWShpMbIdihqAGnsWrN4I6MNFg8F5upVua8LqAQ5XrzTLhUv
 aGcm2Qj6xGqH/O+T8/ywmCbfCi9V/0gjSKRVI7cGZS1yYII+UlyL5vVJS
 Fc9uciAopag2AvjverEgviIMVR1f3t3Bor7oxdBnJ8E0PWHkw2hU8w5os g==;
X-CSE-ConnectionGUID: FAlu/w7hRJCTuGKtmKK/zw==
X-CSE-MsgGUID: KOxQGnAnRTiCLp4YWNMkcg==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="23466083"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="23466083"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 23:32:17 -0700
X-CSE-ConnectionGUID: ZoP3pTFyQY2hso2WX2o9FQ==
X-CSE-MsgGUID: v3foGHiWS3K3gL5YPfQbPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="65137816"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa001.fm.intel.com with ESMTP; 23 May 2024 23:32:15 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
Date: Fri, 24 May 2024 12:02:28 +0530
Message-Id: <20240524063228.127423-1-tejas.upadhyay@intel.com>
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

Wa_15015404425 applies to xe2_lpm all steppings

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h |  1 +
 drivers/gpu/drm/xe/xe_mmio.c      | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 722fb6dbb72e..07c8a23bd7c2 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -42,6 +42,7 @@
 #define STOLEN_RESERVED				XE_REG(0x1082c0)
 #define   WOPCM_SIZE_MASK			REG_GENMASK64(9, 7)
 
+#define MEDIA_DUMMY_REG				XE_REG(0x138000)
 #define MTL_RP_STATE_CAP			XE_REG(0x138000)
 
 #define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index ff7a7cf99530..e1dc87078387 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -450,6 +450,21 @@ int xe_mmio_init(struct xe_device *xe)
 	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
 }
 
+static void mmio_flush_pending_writes(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (!(xe->info.platform == XE_LUNARLAKE))
+		return;
+
+	if (xe_gt_is_media_type(gt) &&  MEDIA_VER(xe) == 20) {
+		int itr = 4;
+		/* 4 dummy writes */
+		while (itr--)
+			xe_mmio_write32(gt, MEDIA_DUMMY_REG, 0);
+	}
+}
+
 u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -479,6 +494,9 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
 	struct xe_tile *tile = gt_to_tile(gt);
 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
 
+	/* Wa_15015404425 */
+	mmio_flush_pending_writes(gt);
+
 	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
 }
 
-- 
2.25.1

