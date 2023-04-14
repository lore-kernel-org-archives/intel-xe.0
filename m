Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B33C77B71
	for <intel-xe@archiver.kernel.org>; Fri, 14 Apr 2023 19:34:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075B810E208;
	Fri, 14 Apr 2023 19:34:05 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9381F10E208
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Apr 2023 19:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681500843; x=1713036843;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T70rKUPHGz1UOidS1IzyRgVQAEfVGfTyUVFjmr5K0/s=;
 b=ITMO0ENJHg6ijC4IO4xUMMZ85712A1ZkhNvANBGbhh8c9jtIoaREKdoD
 m3ifCpxsfvdJYCD7xVNOZQF/w3kmDnAGBOTIfCkv+qQDk7bRNgg2iWpq3
 aW15KZHJ0WV/hnaVI1YSfnKdN/pWDQ/h03mDhab/D6OO3/CkBonl1GS/Y
 OODyLqgL2QQdLpMMIByei6cnQhYIV9nJ7B+EhSc1l0lnwUJUNxr6diYpR
 zuIdpkecMUtcBgKmiENM7e1rr42xL5cKtoEjKP5MOA1q/CWnKZghtmXFS
 vu4FeEHJN65Ogkt7qNGKJYYr4r8+6ubL31Ecbt6n3rQDZa8RVjg62xoss Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="343311209"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="343311209"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 12:34:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="667310353"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="667310353"
Received: from msatwood-mobl.amr.corp.intel.com (HELO msatwood-mobl.intel.com)
 ([10.212.194.120])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 12:34:02 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org, lucas.demarchi@intel.com,
 lionel.g.landwerlin@intel.com, matthew.d.roper@intel.com
Date: Fri, 14 Apr 2023 12:33:55 -0700
Message-Id: <20230414193355.143875-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/: add gt tuning for indirect state
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
which is more convienent for UMD. Behavior change mirrors windows
behavior.

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
 2 files changed, 6 insertions(+)

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
index 27cf1330facd..5abef45a10fc 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -26,6 +26,11 @@ static const struct xe_rtp_entry gt_tunings[] = {
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(SET(XEHP_SQCM, EN_32B_ACCESS))
 	},
+	{ XE_RTP_NAME("Tuning: Set Indirect State Override"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, -1)),
+	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
 	{}
 };
 
-- 
2.39.2

