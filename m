Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B8BC4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 05:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C13010E176;
	Mon,  4 Dec 2023 05:31:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B8D10E194
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 05:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701667884; x=1733203884;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3U89D7quPHMol6RngzG06CAUqVjpKsglQoUtF0xTRqE=;
 b=nLWHLJfsrGgSIOShv/tysqZu6C35V9Yr2qqweoxdIzpuMiAmDzMdrUpp
 melIYwKAH72n52zZKj3cnWTe9Y5mWohyt90RkdSuYDRi2TNnATRyeYahP
 bcDQWXuvdmRV/G3CUAWnjZ1d3BmoEakTmxMFNMMPIu0Q8qdF6QENpM6f5
 LkoMNe9KZie7HAv83yHfdqu++ETBW2lHz2XnhQHulEA6eXKjlUV2zTu4U
 Bn+KjVRk1IX573PsW9EIjuRKlyS6+8PCbymH8XGAGJ5E9HD3yVXrQsetY
 DPohlwwABrCVP30msVtFuXu+tYIaQbiF3npCm8c4LeWYqvsxCzA8VqI1r A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="393422781"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; d="scan'208";a="393422781"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 21:31:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="840902442"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; d="scan'208";a="840902442"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga004.fm.intel.com with ESMTP; 03 Dec 2023 21:31:22 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  4 Dec 2023 11:10:51 +0530
Message-Id: <20231204054051.775719-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 14019988906
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This workaround applies to Graphics 20.04 as engine
workaround

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index d318ec0efd7d..91c09ce04861 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -125,6 +125,7 @@
 
 #define XEHP_PSS_CHICKEN			XE_REG_MCR(0x7044, XE_REG_OPTION_MASKED)
 #define   FD_END_COLLECT			REG_BIT(5)
+#define   FLSH_IGNORES_PSD			REG_BIT(10)
 
 #define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
 #define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 63bd4bb1af03..a23efede5fc5 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -719,6 +719,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
 	},
+	{ XE_RTP_NAME("14019988906"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
+	},
 
 	{}
 };
-- 
2.25.1

