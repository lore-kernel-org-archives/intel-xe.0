Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41644CA0ED3
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 10:10:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB2310E73D;
	Wed,  4 Sep 2024 10:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7baoGxb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDC310E73D
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 10:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725444655; x=1756980655;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9nujyTa2mEnc+llpFEICd4iVyvCvw7wv1qTpdF7PxiI=;
 b=P7baoGxb6N1bx8OcKX5d2Oh5HeaxLlm9XQdeBhp2a2ca+DclpJjphEQR
 FIkATP5XWpki447TAtxUurguNH8RbxpVgHZm0ftXL0eM5RAP+I2mrOwrf
 ToJ8DN4Lr8Rl3kMKBL6sXc3FQwu12O7ZAdLG1kmLGUeAek/qravAsw9xQ
 cj1CYCMz+qW79vNs7OrCIq0PdWsbfFWwz4bAdV0rCIPFrd2ZlmKbKUYin
 iUNRtmyXGXLptLpCc3BR4dZqhL4P7DmA4htrbBH5cIEBQhrwFnsqYFT8H
 oYnCn7bZPIkquAS04Q+4cDLC7WuAXwLMbW5FC9jKHnW+uYgo8TKgXlmhM w==;
X-CSE-ConnectionGUID: 231ZvzinRdu4yga2f57+aw==
X-CSE-MsgGUID: PnoiEPAdTGiZ9DUWmOqWiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34666124"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="34666124"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 03:10:55 -0700
X-CSE-ConnectionGUID: OkS2RvFmTR276gnXNba4HA==
X-CSE-MsgGUID: PRgs+zDuTt+al0c1fTPk1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="65272403"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa009.fm.intel.com with ESMTP; 04 Sep 2024 03:10:53 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH V2] drm/xe/xe2hpg: Add Wa_15016589081
Date: Wed,  4 Sep 2024 15:43:33 +0530
Message-Id: <20240904101333.2049655-1-tejas.upadhyay@intel.com>
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

Wa_15016589081 applies to xe2_hpg renderCS

V2(Gustavo)
  - rename bit macro

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 0d1a4a9f4e11..660ff42e45a6 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -105,6 +105,7 @@
 
 #define CHICKEN_RASTER_1			XE_REG_MCR(0x6204, XE_REG_OPTION_MASKED)
 #define   DIS_SF_ROUND_NEAREST_EVEN		REG_BIT(8)
+#define   DIS_CLIP_NEGATIVE_BOUNDING_BOX	REG_BIT(6)
 
 #define CHICKEN_RASTER_2			XE_REG_MCR(0x6208, XE_REG_OPTION_MASKED)
 #define   TBIMR_FAST_CLIP			REG_BIT(5)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 28b7f95b6c2f..d424992514a4 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -733,6 +733,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 			     DIS_PARTIAL_AUTOSTRIP |
 			     DIS_AUTOSTRIP))
 	},
+	{ XE_RTP_NAME("15016589081"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
+	},
 
 	{}
 };
-- 
2.25.1

