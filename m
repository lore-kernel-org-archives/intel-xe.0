Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45A8D5AE79
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 08:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773C310E7D1;
	Thu,  7 Nov 2024 08:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aNlM1nE9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AF510E7D1
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 08:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730966587; x=1762502587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GhU1CoQtnxEPtUAd3tRtN7cUTnQ+9WLJz6SDrfVnkyg=;
 b=aNlM1nE9TomG0s6RXItwvgvOIoges3viBF/B/4VAma5r15v3K1vvWfRn
 RwtK5yVO+4w3cpZFgoFkIvslOwuFN4PS7cv8aqhrmUQ+ks70yG7gpiliP
 Sz+EFMo//9iwRCwi/rgcBJ5FDiFhWnECYTpEyMmAZFEkF3BmbQ8iS665G
 9N67r/xeC0kRanNi+K3MgYsUvUx6dLeoqlDwQDVMq9CbO54HYILHvx6uM
 yjlM31Et9xZGleJdZgBqxP8lFzuI47mus/2Rl1t5AFzTbvkc7u3VrXgiZ
 K1Fex+Nh+T0VSGv2RjYq3EJPZP+F1x/uJVVMmGZ34nyNp3FjElKLwMR3R w==;
X-CSE-ConnectionGUID: DJqGExSzRFSxap8tUcsD2A==
X-CSE-MsgGUID: 0ejCl/RESzakHVldmeyRoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48257274"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="48257274"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 00:03:06 -0800
X-CSE-ConnectionGUID: wu51aGS7RFGdIMiKp8O+NA==
X-CSE-MsgGUID: +XK6weuxQ1inr2Wx0aVwoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="84533948"
Received: from singhapo-super-server.iind.intel.com ([10.145.169.90])
 by fmviesa006.fm.intel.com with ESMTP; 07 Nov 2024 00:02:26 -0800
From: apoorva.singh@intel.com
To: intel-xe@lists.freedesktop.org
Cc: Apoorva Singh <apoorva.singh@intel.com>
Subject: [PATCH] drm/xe/xe3lpg: Add Wa_16024792527
Date: Thu,  7 Nov 2024 13:44:38 +0530
Message-Id: <20241107081438.1426635-1-apoorva.singh@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Apoorva Singh <apoorva.singh@intel.com>

Force Sampler Tile64 Overfetch via MMIO

Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 ++
 drivers/gpu/drm/xe/xe_wa.c           | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 0c9e4b2fafab..bd185a96a71a 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -445,6 +445,8 @@
 
 #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
 #define   ENABLE_SMALLPL			REG_BIT(15)
+#define   SMP_WAIT_FETCH_MERGING_COUNTER_MASK	REG_GENMASK(11, 10)
+#define   SMP_FORCE_128B_OVERFETCH		REG_FIELD_PREP(SMP_WAIT_FETCH_MERGING_COUNTER_MASK, 1)
 #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
 #define   SAMPLER_ENABLE_HEADLESS_MSG		REG_BIT(5)
 #define   INDIRECT_STATE_BASE_ADDR_OVERRIDE	REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 02cf647f86d8..7fa4c7bd1747 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -607,6 +607,12 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
 	},
+	{ XE_RTP_NAME("16024792527"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(FIELD_SET(SAMPLER_MODE, SMP_WAIT_FETCH_MERGING_COUNTER_MASK,
+				   SMP_FORCE_128B_OVERFETCH))
+	},
 
 	{}
 };
-- 
2.34.1

