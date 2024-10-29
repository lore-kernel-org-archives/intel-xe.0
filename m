Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5888D3A661
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 14:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D478876A;
	Tue, 29 Oct 2024 14:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bF+tC9+N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DDE8876A
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 14:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730211947; x=1761747947;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gYL3osGTwprVJyq46rHuh/gzQKZFrtSaCd2aPf7aujc=;
 b=bF+tC9+Ntba6jy8e7P6euk+W8C9PRMDqedswpnH7DFbZkiPrLmjCDB50
 jR38vcwNtr0Wu7Tep6mm5D9caZP4RqQ3JW9U3Lk4/DR+ewsmN0DF8uC2K
 8am42hkyhuyTf0oph7Y1NwHIBMrXtTjU7Hyb60hqVjOV+SVCJwfRNSJHQ
 NDI6I7tVK6tXqKHct9Uxw0OObtP2YeErW9Cmx0bJVK3mr5tWu2dCVQJ9v
 9DRfHebJ+IyDPtQG88vhO+Jlocl+jTzF63RxOW7gNqyZXYzfbZbE8j4zD
 qPeUauPxJ85jKp+atCdozVZlE595fU6Ne6/yLrnFloGYV9JL4R7ovubKW w==;
X-CSE-ConnectionGUID: Hsy8iTXiR6GMMvdpgTdwBw==
X-CSE-MsgGUID: HdxfJmSFRnWUjX89n4HUYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="41254524"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="41254524"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 07:25:47 -0700
X-CSE-ConnectionGUID: ttq/wLb7SWak84tV/NTvrQ==
X-CSE-MsgGUID: RAtgbs1KQJKmdrMpdHzKbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="82044412"
Received: from singhapo-super-server.iind.intel.com ([10.145.169.90])
 by fmviesa009.fm.intel.com with ESMTP; 29 Oct 2024 07:25:45 -0700
From: apoorva.singh@intel.com
To: intel-xe@lists.freedesktop.org
Cc: Apoorva Singh <apoorva.singh@intel.com>
Subject: [PATCH] drm/xe/xe3lpg: Add Wa_16024792527
Date: Tue, 29 Oct 2024 20:07:40 +0530
Message-Id: <20241029143740.1296020-1-apoorva.singh@intel.com>
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
 drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 42dc55cb23f4..7ed6addd795a 100644
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
index 02cf647f86d8..18dc5cdf7c43 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -607,6 +607,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
 	},
+	{ XE_RTP_NAME("16024792527"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, SMP_FORCE_128B_OVERFETCH))
+	},
 
 	{}
 };
-- 
2.34.1

