Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8050CD1288
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 16:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E9810EFF5;
	Mon,  1 Apr 2024 16:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzsSNP9T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7E710EFF5
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 16:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711988675; x=1743524675;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ovy4ei1ZT9+V7i9JuNdf5EO3xjl5WHdGkguBNrwt2f0=;
 b=lzsSNP9TTcYs5RcMk8vv+IihJdxlcXkstKpWefOqagaaoC4K6f8RuFyP
 VvyCvfJekcuyBq9ISgiuXVsAyXAdKSMhfu2myg0pxe7KiQ5PjEtUx5WSO
 GbpANfe7WDvT/tTLXx4bexFCVyl7eLWqio3s7wFrIW3vUos+K1yiLZbCH
 KZyOz4kDe9BV5YC3nYTNAhGtlXwYNIN+gyjloO5MoPoDKRl1wqTrCrfWE
 0rfaap+ucD12QmvhGdyAIQioQF7UBRUPQKGEgIMJVmj4elH2Xt/8+FrHc
 soL48TvgoQgplv2Wo07Mcc5ESGsaL5+evepWIrNn7amCYyDBxrxK/+CR1 g==;
X-CSE-ConnectionGUID: Oq1D7moARj2A0VIYQ3A0Ug==
X-CSE-MsgGUID: 8PUBMUJARpGCYMO0u3FZ1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7249456"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="7249456"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:24:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="40923264"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa002.fm.intel.com with ESMTP; 01 Apr 2024 09:24:32 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3] drm/xe/xe2: Add workaround 18033852989
Date: Mon,  1 Apr 2024 22:08:06 +0530
Message-Id: <20240401163806.3821128-1-himal.prasad.ghimiray@intel.com>
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

This workaround applies to RCS engine's context, hence added as
LRC workaround.

v2
- Fix commit description as lrc workaround instead of engine.(Lucas)

v3
- COMMON_SLICE_CHICKEN1 is a masked register, add XE_REG_OPTION_MASKED
flag. (Matt)

BSPEC: 55899

Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 ++-
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index d5b21f03beaa..6617c86a096b 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -97,7 +97,8 @@
 #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
 #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
 
-#define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
+#define COMMON_SLICE_CHICKEN1			XE_REG(0x7010, XE_REG_OPTION_MASKED)
+#define   DISABLE_BOTTOM_CLIP_RECTANGLE_TEST	REG_BIT(14)
 
 #define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
 #define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 74b33a3845f2..c904e55ced9c 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -579,6 +579,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(INSTPM(RENDER_RING_BASE), ENABLE_SEMAPHORE_POLL_BIT))
 	},
+	{ XE_RTP_NAME("18033852989"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
+	},
 
 	{}
 };
-- 
2.25.1

