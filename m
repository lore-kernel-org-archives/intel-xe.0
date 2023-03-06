Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D706C64EC4
	for <intel-xe@archiver.kernel.org>; Mon,  6 Mar 2023 21:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5344110E267;
	Mon,  6 Mar 2023 21:28:05 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9083C10E267
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Mar 2023 21:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678138083; x=1709674083;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PajsKBWyGtSPrY0Ibp6Xar7P4YYi0bfnqzCQG5BkPBY=;
 b=NHN65HgGPnGzprgr68rKgUYv/iKTa0h1lelqhZetwy0QiKOo8SU6o0bc
 dSMINg9iqCSmpZOrI7mnu9POuFI/6CJ9UpO1VeO39q8tNILlAkpmXY0yS
 t/rJPAUJdI36ieqz/qQ9wajmkr6yYPrCmsqX46eXw0ZLpobX8aCyUYckL
 Fc2lnQx4G3z257auYtCwiJNBrIuNo+6qFySTJpvfjurddbsgBbQlfK0Aw
 ZXdkZ0+LyP/hWZqvQwlG6rzL2Av7ZfLrhbT/EjQl9CniVU/SW4rl8uIZv
 fmBYsRf1SG611FUeUjO0EZQs3hwxf5GIOBDyeHE3IElT2kxZM+IgapwiH w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="363299608"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="363299608"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 13:28:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="706576200"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="706576200"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 13:28:02 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Mar 2023 13:24:50 -0800
Message-Id: <20230306212450.803557-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix duplicated setting for register
 0x6604
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

The following warning shows up for TGL:

		[drm:xe_reg_sr_add [xe]] *ERROR* Discarding save-restore reg 6604 (clear: 00ff0000, set: 00040000, masked: no): ret=-22
		[drm:xe_reg_sr_add [xe]] *ERROR* Discarding save-restore reg 6604 (clear: 00ff0000, set: 00040000, masked: no): ret=-22

That is because the same register is being set both by the WAs and the
tunings. Like was done in i915, prefer the tuning over the workaround
since that is applicable for more platforms. Also fix the tuning: it
was incorrectly using the MCR version of the register, but that only
became true in XEHP.

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/233
Reported-by: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 -
 drivers/gpu/drm/xe/xe_tuning.c       | 11 ++++++-----
 drivers/gpu/drm/xe/xe_wa.c           | 10 +++-------
 3 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 4d0f09cd447c..c025c6dbf3a9 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -70,7 +70,6 @@
 #define XEHP_FLAT_CCS_BASE_ADDR			MCR_REG(0x4910)
 
 #define GEN12_FF_MODE2				_MMIO(0x6604)
-#define XEHP_FF_MODE2				MCR_REG(0x6604)
 #define   FF_MODE2_GS_TIMER_MASK		REG_GENMASK(31, 24)
 #define   FF_MODE2_GS_TIMER_224			REG_FIELD_PREP(FF_MODE2_GS_TIMER_MASK, 224)
 #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 624b257ecfbc..2861a014c85c 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -24,11 +24,12 @@ static const struct xe_rtp_entry gt_tunings[] = {
 };
 
 static const struct xe_rtp_entry lrc_tunings[] = {
-	{ XE_RTP_NAME("1604555607"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(1200)),
-	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(XEHP_FF_MODE2,
-						FF_MODE2_TDS_TIMER_MASK,
-						FF_MODE2_TDS_TIMER_128))
+	{ XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
+	  /* read verification is ignored due to 1608008084. */
+	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(GEN12_FF_MODE2,
+						FF_MODE2_GS_TIMER_MASK,
+						FF_MODE2_GS_TIMER_224))
 	},
 	{}
 };
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index df72b15dfeb0..71e9e1a111f8 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -265,13 +265,9 @@ static const struct xe_rtp_entry lrc_was[] = {
 				   GEN9_PREEMPT_GPGPU_THREAD_GROUP_LEVEL,
 				   XE_RTP_ACTION_FLAG(MASKED_REG)))
 	},
-	{ XE_RTP_NAME("16011163337"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
-	  /* read verification is ignored due to 1608008084. */
-	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(GEN12_FF_MODE2,
-						FF_MODE2_GS_TIMER_MASK,
-						FF_MODE2_GS_TIMER_224))
-	},
+
+	/* DG1 */
+
 	{ XE_RTP_NAME("1409044764"),
 	  XE_RTP_RULES(PLATFORM(DG1)),
 	  XE_RTP_ACTIONS(CLR(GEN11_COMMON_SLICE_CHICKEN3,
-- 
2.39.0

