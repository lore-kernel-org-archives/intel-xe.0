Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B816C61D92
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 11:24:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD15010E474;
	Tue, 21 Nov 2023 11:24:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEDA10E474
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 11:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700565850; x=1732101850;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=twob/4cy+ymsSM+a9XM3TX5Yi11HK08V+H4vFe631Is=;
 b=FyzD8wKqTe6noholsj3IxeZXkG7BnZYnP/uSs8oCeAponcmRCpcHp7+B
 NYUJOBE7Fdq2Z9CNlLDDcOzhVjsFZMdShLJZ7Btbfa1DJG+HqobJAFUG6
 K7Q+RnMS8ZIknuMDJ4AbFYzMSkW5EoipvS/a0bWD5bkaJCuX8fsCX3DbX
 QgkRGWohMOQhZ+wiC8rgy15vMqUUQ/Vxp6ymNP0ED4IAJVotPp1OWSEEn
 HbCvNmxNJoWgn3C8ve2uZBF48KxyrFWXrFxp4sQuhShA81zZvckCiUvUF
 zZSgXWhmDu1ycXpR0y0uKct10+bRsdGFUCDXjujjNo6tPktaLSNAcN2nT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371156102"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="371156102"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 03:24:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="716506984"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="716506984"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 21 Nov 2023 03:24:07 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Nov 2023 17:03:20 +0530
Message-Id: <20231121113320.3735446-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V3] drm/xe/xe2: Add workaround 14019449301
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

V3(MattR):
  - Reorder reg and wa placement
  - Add base parameter to reg macro for better definition
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
index b57dec17eb2d..0035cfb89cf2 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -112,6 +112,9 @@
 #define RING_EXECLIST_CONTROL(base)		XE_REG((base) + 0x550)
 #define	  EL_CTRL_LOAD				REG_BIT(0)
 
+#define VDBOX_CGCTL3F08(base)			XE_REG((base) + 0x3f08)
+#define   CG3DDISHRS_CLKGATE_DIS		REG_BIT(5)
+
 #define VDBOX_CGCTL3F10(base)			XE_REG((base) + 0x3f10)
 #define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index d03e6674519f..aea03a56c797 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -273,6 +273,14 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 			 SET(XEHPC_L3CLOS_MASK(3), ~0))
 	},
 
+	/* Xe2_LPM */
+
+	{ XE_RTP_NAME("14019449301"),
+	  XE_RTP_RULES(MEDIA_VERSION(2000), ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
+
 	{}
 };
 
-- 
2.25.1

