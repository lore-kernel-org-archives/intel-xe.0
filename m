Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AD3C6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 18 Apr 2023 20:14:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3522A10E890;
	Tue, 18 Apr 2023 20:14:13 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058BA10E890
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Apr 2023 20:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681848849; x=1713384849;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zdcNgTUmcqAadnzH5ABtIZIuKV6lDDYs6wDBNas1Jh8=;
 b=hZ9hn7ZPlUvW7m+CyMAX//Cjrqh+qEMhZ1xvRPk6DybZKVonnv4o784r
 gS05fBRLgLsgMvhYoRQwoxN0cdEOQYXqGngZJr2iWawfD6mXJ+fSAYBPz
 qKXB6Pxqbv030QE5Uc6Q1y8nxxvRZ6ulPrU0YfV1rtpDWKxGoBFgMyVYH
 Ibkn7A+bP/wuj4f3QElcTFSsZJT69ouR+IWmbBsxXNZPWWSVRCi5Uwldk
 EbSlNKl8drU80pp/CszFJv3pOzcvJT0liPoZ03S3slV3vOpfNnDutfFif
 Cd+e76zlRELwMGAsHTu7ZRI6Qsu4n/tC8slAmyW5+6htPzVQf691kcF/V A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="324894785"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="324894785"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 13:14:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="684727178"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="684727178"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.209.23.216])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 13:14:08 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com, jose.souza@intel.com
Date: Tue, 18 Apr 2023 13:14:03 -0700
Message-Id: <20230418201403.289184-2-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418201403.289184-1-matthew.s.atwood@intel.com>
References: <20230418201403.289184-1-matthew.s.atwood@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe: add gt tuning for indirect state
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
chanrge for i915 in commit 16fc9c08f0ec ("drm/i915: disable sampler
indirect state in bindless heap")

v2: move to new infra for per engine tuning, commit message (Lucas)

Bspec: 46052

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_tuning.c       | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index f174758d8307..b7324aede6b6 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -286,6 +286,7 @@
 #define   ENABLE_SMALLPL			REG_BIT(15)
 #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
 #define   GEN11_SAMPLER_ENABLE_HEADLESS_MSG	REG_BIT(5)
+#define   INDIRECT_STATE_BASE_ADDR_OVERRIDE	REG_BIT(0)
 
 #define GEN9_HALF_SLICE_CHICKEN7		MCR_REG(0xe194)
 #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 35af2624b28a..05685e4be02e 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -30,6 +30,12 @@ static const struct xe_rtp_entry gt_tunings[] = {
 };
 
 static const struct xe_rtp_entry engine_tunings[] = {
+	{ XE_RTP_NAME("Tuning: Set Indirect State Overrride"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
 	{}
 };
 
-- 
2.39.2

