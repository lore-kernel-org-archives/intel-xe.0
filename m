Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B23C5CFEB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 13:31:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7CD10F337;
	Thu, 13 Aug 2026 13:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYAxItgu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4624F10F341
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 13:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786627879; x=1818163879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YJlzd6tISlzQ2UmmCQDtscERX6HjjK4wXiM1w45r6QE=;
 b=PYAxItgudULXXIrcRcXu+43bOJhDPtYhlddI4PAu5is4m64pG+5XhD2i
 e2OEKxORY0zIQ0r46ti4DdvobX1EFibOHv+JSgbepGozV0o0M9mFB34YF
 4zqCtUYE3VMwRt4hWSRqd9ezPL4YeYIsksEKEh70GA9OOqY6PlTmLUqLm
 uRC7er5C7YbJHPP+WHe/PqnTuoI62t4DC2uZnqSGZqWlbCHmUt8Q76MJr
 7ylGXpUOvLAKxE8GzL4ash0MRTvUdL4KDpLScwDNfVAPd+z+/q4Vfi8S+
 tXQCfUQCqO2ri4QGPdhrJTzhXsOU8SUHp6jColxtrRJWx1Ci94CVLdIZo w==;
X-CSE-ConnectionGUID: MEqBv3A0R+G7M+3xOMP5nQ==
X-CSE-MsgGUID: BVEVTrcDRmW89Gj/RvClCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97547728"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="97547728"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 06:31:19 -0700
X-CSE-ConnectionGUID: hIA+8x5YQNSGvasw5vWKLg==
X-CSE-MsgGUID: xk0bNWa/S0Gdw4GZQRiNBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="268207361"
Received: from unknown (HELO gfx-coremm-kmd15.iind.intel.com) ([10.223.55.8])
 by orviesa005.jf.intel.com with ESMTP; 13 Aug 2026 06:31:18 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 5/6] drm/xe/guc: add TDL gfx registers to capture list
Date: Thu, 13 Aug 2026 19:00:36 +0530
Message-ID: <20260813133037.2912699-6-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813133037.2912699-1-naresh.kumar.g@intel.com>
References: <20260813133037.2912699-1-naresh.kumar.g@intel.com>
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

Add ROW_INSDONE_TDL_GFX and SS_LSC_HDC_IDLE_TDL_GFX register
definitions and include them in the XeHPG extended GuC capture register
list.

This makes the TDL gfx state available in GuC error captures for
debugging hang and fault scenarios.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_guc_capture.c  | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 25014bccd3a6..8c55d766a5a6 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -572,6 +572,9 @@
 #define EU_SYSTOLIC_LIC_THROTTLE_CTL_WITH_LOCK	XE_REG_MCR(0xe534)
 #define   EU_SYSTOLIC_LIC_THROTTLE_CTL_LOCK_BIT	REG_BIT(31)
 
+#define ROW_INSDONE_TDL_GFX                    XE_REG_MCR(0xe580)
+#define SS_LSC_HDC_IDLE_TDL_GFX                        XE_REG_MCR(0xe584)
+
 #define XEHP_HDC_CHICKEN0					XE_REG_MCR(0xe5f0, XE_REG_OPTION_MASKED)
 #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
 #define   DIS_ATOMIC_CHAINING_TYPED_WRITES	REG_BIT(3)
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 368769857c9b..a6052da71787 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -376,7 +376,9 @@ static const struct __ext_steer_reg xehpg_extregs[] = {
 	{"SC_INSTDONE",			XEHPG_SC_INSTDONE},
 	{"SC_INSTDONE_EXTRA",		XEHPG_SC_INSTDONE_EXTRA},
 	{"SC_INSTDONE_EXTRA2",		XEHPG_SC_INSTDONE_EXTRA2},
-	{"INSTDONE_GEOM_SVGUNIT",	XEHPG_INSTDONE_GEOM_SVGUNIT}
+	{"INSTDONE_GEOM_SVGUNIT",	XEHPG_INSTDONE_GEOM_SVGUNIT},
+	{"ROW_INSDONE_TDL_GFX",		ROW_INSDONE_TDL_GFX},
+	{"SS_LSC_HDC_IDLE_TDL_GFX",	SS_LSC_HDC_IDLE_TDL_GFX}
 };
 
 static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
-- 
2.43.0

