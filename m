Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B91C52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 13:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC7210E218;
	Mon, 12 Aug 2024 13:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I8C84nv3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC70210E218
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 13:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723469949; x=1755005949;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v+oLChjAA/pelm3i0CTRAHgUcb5+VQSm45TWYU4Yg30=;
 b=I8C84nv3F28tsdHJugjkWqV6WRIuKrZd15DW7K2eYycrvfOLq2rMqdCR
 nrWVinVL5hkvFnnnzV5Z7SsIK3gpfAytXa0/5b/eP5claz7dvzu+mHg3R
 alyKOMaHy01kKBL8fuDf+LEyqYa3y/BRuVO+VugIRUdmaOZ+9SBM9yIV5
 Updh0KvqMztNgKwKn3tax270tYdh//M1CqgBn+kH//eM2I7MHyYLbVwM2
 rOjOS3Ym+S7rNRxdDJdWTZEEN4ZgYG26G97p2buO0+1UqYCkHdD1j/Wbf
 XbIZimL8r3VFmhRiSBi4d6frTGuwBv7Xa/lvLeBgNQjpe7cT0jteBUFA8 Q==;
X-CSE-ConnectionGUID: HWF+UNDgRc6cT5qhJ8x2LA==
X-CSE-MsgGUID: 0E1bIOtbQ8G6Y4iEXNHwyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21234281"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="21234281"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 06:39:08 -0700
X-CSE-ConnectionGUID: t/0La/yQT0eUrD58rJL6mg==
X-CSE-MsgGUID: FfgShOFvQc20phOFFMD51Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="58190025"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa009.jf.intel.com with ESMTP; 12 Aug 2024 06:39:06 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2] drm/xe/xe2hpg: Add Wa_14021821874
Date: Mon, 12 Aug 2024 19:11:17 +0530
Message-Id: <20240812134117.813670-1-tejas.upadhyay@intel.com>
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

Wa_14021821874 applies to xe2_hpg

V2(Himal):
  - Use space after define

Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 2c8c4d4218db..5f33dee35f8a 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -451,6 +451,7 @@
 #define   DIS_FIX_EOT1_FLUSH			REG_BIT(9)
 
 #define TDL_TSL_CHICKEN				XE_REG_MCR(0xe4c4, XE_REG_OPTION_MASKED)
+#define   STK_ID_RESTRICT			REG_BIT(12)
 #define   SLM_WMTP_RESTORE			REG_BIT(11)
 
 #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 564e32e44e3b..28b7f95b6c2f 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -542,6 +542,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
 	},
+	{ XE_RTP_NAME("14021821874"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
+	},
 
 	/* Xe2_LPM */
 
-- 
2.25.1

