Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637DEC3DA7F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 09:30:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C69E10E2E2;
	Wed, 31 Jul 2024 09:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RWCkNcYc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7769F10E2E2
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 09:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722418199; x=1753954199;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wWCxZ4XWsLDJhb18LT7ThoYf+dG2oIVZmLprkmJ0v8Y=;
 b=RWCkNcYc8QPAPZ5ghwl9L96LDxm9YHJSPJAtc3qcYsjdCW4WX3DGTRMp
 TzePKjvQsCiKeiRiUK9R8BDSBDAxYXl9NO0JaakFaFp+Z8GvGIZZsnrWg
 tyw4bksXm5K7LBXRHKd+tIm8qBDBKmAkoHcHioyakgtJB8JVNbtuREnvg
 ZAw2nzTMsvLc3Wf+TD7cwfgVxIxmicKny40vlM1QyeJBDwr/xcv5K9kRl
 kEIZEwDaZNqDwvNeeiNjHAqGgv3nYhpqtfUICXD4f5seZPmAD0tiK3dE3
 dgVJLUnqWNDtnXbw5qWLqoOj80xfY8PO2rtLZJImrohz0mSNhqosE407e A==;
X-CSE-ConnectionGUID: 4/qIyyDFSc2hOWd0Ovqd7Q==
X-CSE-MsgGUID: SH9vN1oIQMKCV4ufRDXKzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20423736"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="20423736"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 02:29:58 -0700
X-CSE-ConnectionGUID: AgBwtdqMT86v3UDGHsStbQ==
X-CSE-MsgGUID: opA81TEbTmyxiOAm7b8smw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59422718"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa005.jf.intel.com with ESMTP; 31 Jul 2024 02:29:57 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: Write all slices if its mcr register
Date: Wed, 31 Jul 2024 15:01:52 +0530
Message-Id: <20240731093152.51424-1-tejas.upadhyay@intel.com>
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

Register GAMREQSTRM_CTRL should be considered mcr register
which should write to all slices as per documentation.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
 drivers/gpu/drm/xe/xe_gt.c           | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 3b87f95f9ecf..b131e3171899 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -80,7 +80,7 @@
 #define   LE_CACHEABILITY_MASK			REG_GENMASK(1, 0)
 #define   LE_CACHEABILITY(value)		REG_FIELD_PREP(LE_CACHEABILITY_MASK, value)
 
-#define XE2_GAMREQSTRM_CTRL			XE_REG(0x4194)
+#define XE2_GAMREQSTRM_CTRL			XE_REG_MCR(0x4194)
 #define   CG_DIS_CNTLBUS			REG_BIT(6)
 
 #define CCS_AUX_INV				XE_REG(0x4208)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 58895ed22f6e..c6296dc8897f 100644
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

