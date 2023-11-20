Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721ACC197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 05:13:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E7610E0D2;
	Mon, 20 Nov 2023 05:13:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BCE10E0D2
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 05:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700457230; x=1731993230;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bbRRd2yjdGf2a4eyTVe7tS0xK91HIN4CfQ8ybDNTGVw=;
 b=KUfrUVRIWsoGoT+OMde0KWIDo9HmXWF2PtlTPqOdwl1PWTSD3LPgy9xn
 7yQoRh+lYffo5X1KSoav6hzZkIJ13HTJYgPbADwv3sfBl8z0GL6vzmspk
 KBznHAK4tk6wtb7ZU3d1jetrB65WWB+L3HYI1VGog1Vrw0IZEFn+/N0kO
 j2dg1MVOiQhfn8fIajUTsLjh0R4peAmshEhzfEfseqzF+ZMINvI06gM9G
 57NqQRLbNWS53V42yZ4UCaedx1tW9tD88w2P4h2IIbC7s1w0nFyf2SqEr
 wmR2G6IHn6gQOnvRXuRAovVCHdYVa8qdZzsbFYwFWrTtd0SCoUXygHVZP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="4669745"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="4669745"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2023 21:13:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="832162916"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; d="scan'208";a="832162916"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga008.fm.intel.com with ESMTP; 19 Nov 2023 21:13:48 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Nov 2023 10:53:00 +0530
Message-Id: <20231120052300.3558962-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V3] drm/xe/xe2: Add workaround 14020013138
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

V3:
  - Apply rule RENDER class
V2(Matt):
  - Apply WA in lrc context

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
 2 files changed, 8 insertions(+)

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
index 6572715dfc09..0a6c9d541b50 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -715,6 +715,11 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
 	},
+	{ XE_RTP_NAME("14020013138"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
+		       ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
+	},
 
 	{}
 };
-- 
2.25.1

