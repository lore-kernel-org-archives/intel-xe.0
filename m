Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C32C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 12:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D430A10E2A6;
	Thu, 16 Nov 2023 12:54:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FC110E2A6
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 12:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700139256; x=1731675256;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L3rqSqyh/p3hnKqeMiW1/J8xaXNvzzljx3Dv1dmz/pY=;
 b=TnMhGBToeqOlt4oFrQT2djvLxQlvHgiHy4SNA5eKVCu90+HnRaZCqgfE
 g1axxb3pjSUF/gO0Ws81h7Wcv0l+0cjBtKxgYj8dtM5aqQvb7S7lClJH1
 kk4QS6wfdN2rSKyf6DH6Ki6mKN7HjyYrqEsERdHSz+M0IhnQG5yLalSbG
 38UIu3u28xe40ieabPgLOgE0XupBHxAb2GHiT8d6VPOfzbOWdNsYsWAI7
 yI04+x5zPNeMmWY0xP2tzEUefeCJY0tdJPVRkCOhHMmdg5SK/Cv8c+CHO
 rlN/QTB1KdmKZ64+Mu1vWjzO+8vP9zlssaD33at9bCwdYm649+3nnajdm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="370439436"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="370439436"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 04:54:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="1096774358"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="1096774358"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga005.fm.intel.com with ESMTP; 16 Nov 2023 04:54:14 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 18:33:21 +0530
Message-Id: <20231116130321.3388111-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2] drm/xe/xe2: Add workaround 14019449301
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

This workaround applies to Xe2_LPM

V2(MattR):
  - Change name of register
  - Loop for all engines
  - Driver permanent WA, applies to all steps

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_wa.c               | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index b57dec17eb2d..ff6b0207c78e 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -121,4 +121,7 @@
 #define VDBOX_CGCTL3F1C(base)			XE_REG((base) + 0x3f1c)
 #define   MFXPIPE_CLKGATE_DIS			REG_BIT(3)
 
+#define VDBOX_CGCTL3F08				XE_REG(0x3f08)
+#define CG3DDISHRS_CLKGATE_DIS			REG_BIT(5)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index d03e6674519f..aff92a7efa07 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -259,6 +259,14 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(XELPMP_SQCNT1, ENFORCE_RAR))
 	},
 
+	/* Xe2_LPM */
+
+	{ XE_RTP_NAME("14019449301"),
+	  XE_RTP_RULES(MEDIA_VERSION(2000), ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08, CG3DDISHRS_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
+
 	/* Xe2_LPG */
 
 	{ XE_RTP_NAME("16020975621"),
-- 
2.25.1

