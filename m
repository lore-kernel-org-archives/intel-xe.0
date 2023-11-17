Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E337DC072A2
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 12:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B273F10E750;
	Fri, 17 Nov 2023 12:04:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D74610E750
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 12:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700222649; x=1731758649;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tvPoUHOTgPyqLgdlSVo9NqIjPmDhpu9jn+YjVwLTpxI=;
 b=G4jitZKYyqB7V4JArfNa2JhS8hkcU+JcarV1UdQGh8Gb61yXQPFt1Fgo
 LG0Kpl4hob0jAb0ICFud5RF+8jLAnuZtAxQP0O8tjPTxZdKP83sEmGuSS
 qMjjDXhG6Je1fdc4679/cNo8Ac2nvlqQDMmLO6ZRjXZ3xxLOu7yrLbt1s
 WS43wQWpVWXDGPU5isbbxENIPnDN76VhN/lcsFpNuxWfcytgthF6rVA63
 /NB5nvZF0uVOYErVlCU+WiGqjq/Tgs+L+JZx0eOlZ7QLb6v2BvYS0s7FH
 YuygSgcI9LW1osegl3AhXHOnBhMC/z21HwA8dsJq9i99ck986x4HWXkFq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="477502229"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="477502229"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 04:03:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="759156824"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="759156824"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga007.jf.intel.com with ESMTP; 17 Nov 2023 04:03:53 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 17 Nov 2023 17:43:01 +0530
Message-Id: <20231117121301.3443217-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 14020013138
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

This workaround applies to Xe2_LPG_MD A0

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cc27fe8fc363..5c497a10f9d7 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -93,6 +93,9 @@
 #define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
 #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
 
+#define WM_CHICKEN3				XE_REG_MCR(0x5588, XE_REG_OPTION_MASKED)
+#define   HIZ_PLANE_COMPRESSION_DIS		REG_BIT(10)
+
 #define CHICKEN_RASTER_2			XE_REG_MCR(0x6208, XE_REG_OPTION_MASKED)
 #define   TBIMR_FAST_CLIP			REG_BIT(5)
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index d03e6674519f..67a6cb5086ab 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -272,6 +272,10 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 			 SET(XEHPC_L3CLOS_MASK(2), ~0),
 			 SET(XEHPC_L3CLOS_MASK(3), ~0))
 	},
+	{ XE_RTP_NAME("14020013138"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)),
+	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
+	},
 
 	{}
 };
-- 
2.25.1

