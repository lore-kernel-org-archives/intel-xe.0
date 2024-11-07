Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1701D5AE71
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 08:09:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A065D10E02B;
	Thu,  7 Nov 2024 08:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G5wneWGd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96CF10E02B
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 08:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730966989; x=1762502989;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0Vvr4IyuKCmumZJ3L16NGBXOqKdqvHs/O5H5mbd/pAU=;
 b=G5wneWGdJWo/Ebg8VNg5UXX2D9RIH/izWA9AbT30/Sah71UJzBpwaBW+
 W9Pfa7kCjrX9VohHPbGMGBMogzPwgzBJgkCzateBE417/k/W7HuFptZc3
 Z1+U49Ou+8ykmM1arGwXfW401ucK2zMEWzdwqBUvykUuhegnjMC59FSM+
 9m7h9WOARSskmViFpgggnLbKGrzjOgicZEW/xm21ClyDUyzQG1/XtSJpC
 GtboiKmlZbgmewlNg4gReE3luw8EHk7xZWBBclpErVxQNY1j2NrIoghCz
 52ay4ML6N1tH5poQRvQKrGDbjO0Mtl0tuCSRxBH0fCxpCkiVE+/RueVYN g==;
X-CSE-ConnectionGUID: A21t7WkhTu2NXslfFhXMwg==
X-CSE-MsgGUID: 8DItFOZISba2wqPKt+jgvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="42200479"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="42200479"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 00:09:49 -0800
X-CSE-ConnectionGUID: +41aj5dZQyCEKZYrW5ZHQw==
X-CSE-MsgGUID: rTdqJUvZT6OyxqvbXu5MIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="108251600"
Received: from singhapo-super-server.iind.intel.com ([10.145.169.90])
 by fmviesa002.fm.intel.com with ESMTP; 07 Nov 2024 00:09:47 -0800
From: apoorva.singh@intel.com
To: intel-xe@lists.freedesktop.org
Cc: Apoorva Singh <apoorva.singh@intel.com>
Subject: [PATCH] drm/xe/xe3lpg: Add Wa_16024792527
Date: Thu,  7 Nov 2024 13:51:58 +0530
Message-Id: <20241107082158.1436637-1-apoorva.singh@intel.com>
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
index 0c9e4b2fafab..162f18e975da 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -445,6 +445,8 @@
 
 #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
 #define   ENABLE_SMALLPL			REG_BIT(15)
+#define   SMP_WAIT_FETCH_MERGING_COUNTER	REG_GENMASK(11, 10)
+#define   SMP_FORCE_128B_OVERFETCH		REG_FIELD_PREP(SMP_WAIT_FETCH_MERGING_COUNTER, 1)
 #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
 #define   SAMPLER_ENABLE_HEADLESS_MSG		REG_BIT(5)
 #define   INDIRECT_STATE_BASE_ADDR_OVERRIDE	REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 02cf647f86d8..570fe0376402 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -607,6 +607,12 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
 	},
+	{ XE_RTP_NAME("16024792527"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(FIELD_SET(SAMPLER_MODE, SMP_WAIT_FETCH_MERGING_COUNTER,
+				   SMP_FORCE_128B_OVERFETCH))
+	},
 
 	{}
 };
-- 
2.34.1

