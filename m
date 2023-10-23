Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EECC004C0
	for <intel-xe@archiver.kernel.org>; Mon, 23 Oct 2023 15:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFEF10E215;
	Mon, 23 Oct 2023 15:22:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1B510E217
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Oct 2023 15:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698074520; x=1729610520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GdStj/AhwNNATPdqkzOq5Sh0F8GRqIVUe0ddpmaBGrQ=;
 b=c8Eh0iKHxwu71JmaMy68XvVcl/aEuMJFeywNQtkIhB8tmnEpl+nB0DDP
 pyhYImVab2sfLAXZWLuV7ZgO8TIYikhKaZE4ougBTNwtFoi8Ydkowgej4
 GkYEMgG4ReobPScVY6Cdsd8+3Q+gaYTjuyjv7QeLBk1nsLRoM3Ve/ohfg
 M7+0AccbQu/F2DB+sOcwcuT/1TB/eEFzHXtsqvnzcSd3ID2/CbdkQ5a5q
 t1YcwHoBsoes+Htt2FTZVtjJ5cnKUUgO074XWhGsQ+a2gtWPPYIq3P3hs
 QOZdVxRYMX/zxkBWqeZx3o4tnZ4RFYYy9p4HFwgs1KWBYuoqAoyJlxv6a w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="451089148"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="451089148"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 08:21:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="758161453"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="758161453"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 08:21:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 23 Oct 2023 08:21:37 -0700
Message-Id: <20231023152138.132614-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231023152138.132614-1-lucas.demarchi@intel.com>
References: <20231023152138.132614-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Add performance tuning settings for
 MTL and Xe2
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Shekhar Chauhan <shekhar.chauhan@intel.com>

Adding L3SQCREG5 as part of HW recommended settings.
Note: Programming exactly the values requested in the BSpec,
even though the upper bits of the L3SQCREG5 register no longer
exist on Xe2's primary GT, so the hardware will ignore them.

Bspec: 72161
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 ++
 drivers/gpu/drm/xe/xe_tuning.c       | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 8e01ae49ef21..ec9d11b57bef 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -292,6 +292,8 @@
 
 #define XEHPC_L3CLOS_MASK(i)			XE_REG_MCR(0xb194 + (i) * 8)
 
+#define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
+
 #define XEHP_MERT_MOD_CTRL			XE_REG_MCR(0xcf28)
 #define RENDER_MOD_CTRL				XE_REG_MCR(0xcf2c)
 #define COMP_MOD_CTRL				XE_REG_MCR(0xcf30)
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index d70519816522..53ccd338fd8c 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -24,6 +24,20 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(SET(XEHP_SQCM, EN_32B_ACCESS))
 	},
+
+	/* Xe2 */
+
+	{ XE_RTP_NAME("Tuning: L3 cache"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004)),
+	  XE_RTP_ACTIONS(FIELD_SET(XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
+				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
+	},
+	{ XE_RTP_NAME("Tuning: L3 cache - media"),
+	  XE_RTP_RULES(MEDIA_VERSION(2000)),
+	  XE_RTP_ACTIONS(FIELD_SET(XE2LPM_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
+				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
+	},
+
 	{}
 };
 
@@ -63,6 +77,15 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
 	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
 	},
+
+	/* Xe_LPG */
+
+	{ XE_RTP_NAME("Tuning: L3 cache"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(FIELD_SET(XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
+				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
+	},
+
 	{}
 };
 
-- 
2.40.1

