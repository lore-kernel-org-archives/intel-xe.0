Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0007AC7113B
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 19:55:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B0610E0F0;
	Wed, 23 Aug 2023 19:55:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1B110E0F0
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 19:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692820545; x=1724356545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YkhPo69Ap4Z5yd4LGnfnJhGaD+CpCYuniX9h/9uGT+Y=;
 b=kZoXfSRRX/FSsOGWlGnrPNXEfbQRomonakHK8XNuDrK10gFLJoUgDObH
 UVWTsVw8dJdmyFtEwLS7D42GX1dU7YtbOAbuPKm0MhP5sF3cXhl5JYCBO
 Ak9HfM2GzrnnetypP8uM8mbBDSVXOq+LBqduYM2/OyHrhyLpBdupHT257
 yFAFgz9OT9c3H+Wns+k8ps4wLJeEPllEtb9J+0N6e5399h6f1QTGpCmcd
 KmnPvTHlP7plpbNWtzSQUQiPo07OmV3GWfncqg2vII5Qnd7RlfV6odmI9
 ICG0Z8NkfkXFSC0zEEGfCyaM00a0ui42ZbzmsSTj5FlgSNlfB6CQxBq0H A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="440613201"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="440613201"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 12:55:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="860437412"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="860437412"
Received: from msatwood-mobl.jf.intel.com ([10.24.12.99])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 12:55:45 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com
Date: Wed, 23 Aug 2023 12:55:33 -0700
Message-Id: <20230823195533.125633-2-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230823195533.125633-1-matthew.s.atwood@intel.com>
References: <20230823195533.125633-1-matthew.s.atwood@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2 v3] drm/xe: add gt tuning for indirect state
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

Force indirect state sampler data to only be in the dynamic state pool,
which is more convienent for the UMD. Behavior change mirrors similar
change for i915 in commit 16fc9c08f0ec ("drm/i915: disable sampler
indirect state in bindless heap")

v2: split out per engine tuning into separate patch, commit message
(Lucas)
v3: rebase

Bspec: 46052

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index aa9d7fad41ee..d039e7afe466 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -298,6 +298,7 @@
 #define   ENABLE_SMALLPL			REG_BIT(15)
 #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
 #define   SAMPLER_ENABLE_HEADLESS_MSG		REG_BIT(5)
+#define   INDIRECT_STATE_BASE_ADDR_OVERRIDE	REG_BIT(0)
 
 #define HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194, XE_REG_OPTION_MASKED)
 #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 702cb41dab53..07ffda39e2e4 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -28,6 +28,11 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 };
 
 static const struct xe_rtp_entry_sr engine_tunings[] = {
+	{ XE_RTP_NAME("Tuning: Set Indirect State Override"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE))
+	},
 	{}
 };
 
-- 
2.40.1

