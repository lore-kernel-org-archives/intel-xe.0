Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D229DC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 17:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A28F10E92B;
	Thu,  7 Dec 2023 17:51:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3F810E92B
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 17:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701971484; x=1733507484;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tzFHT3jd+ADIY5m9w3LfnMZHiQ1Et4bxSIRfnZoxb9k=;
 b=AJUmgTReObNRx+mowwFCe4+fWdZackhsV9EQNRGU3Lec9q8BPqdEnIiW
 V4ZFaW6Ggt882k24EGo7zEhQQ4ml3ESew+Dunz1pKNtuzEHlr+y8/pp7J
 LfurP8jRmbGszg8fhUlfWNTV5NhOqWTNhsZVeNW8rdAN8bQs2XSJLLbeG
 U43WLzL+GZQ2dyHdTizEtxOHBKk+TG5xs0S+dX5rWC3yHD29riPYF7ngv
 lIGPAdTpx/KU0e7ItuXBBr0ZSsyyeNQwdW94UKRbKJorGIUhkoxYIGYTQ
 Gq8+c8+XpxSlFKOc2YQWWsGvGP6U1jc7KSjnKEDJFZ5Ay4RkMP4fl7YXz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1381872"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="1381872"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 09:51:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="862564372"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="862564372"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 09:51:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/xe2: Add workaround 16020183090
Date: Thu,  7 Dec 2023 09:51:17 -0800
Message-Id: <20231207175117.2334022-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Graphics version 20.04, used in Lunar Lake, needs WA 16020183090 for
steppings A*. Set ENABLE_SEMAPHORE_POLL_BIT in INSTPM(RENDER_RING_BASE)
and whitelist CSBE_DEBUG_STATUS for userspace to be able to use it
and complement the workaround.

Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 4 ++++
 drivers/gpu/drm/xe/xe_reg_whitelist.c    | 8 ++++++++
 drivers/gpu/drm/xe/xe_wa.c               | 5 +++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 3942db268b01..93d83ceba873 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -46,6 +46,9 @@
 #define RING_EMR(base)				XE_REG((base) + 0xb4)
 #define RING_ESR(base)				XE_REG((base) + 0xb8)
 
+#define INSTPM(base)				XE_REG((base) + 0xc0, XE_REG_OPTION_MASKED)
+#define   ENABLE_SEMAPHORE_POLL_BIT		REG_BIT(13)
+
 #define RING_CMD_CCTL(base)			XE_REG((base) + 0xc4, XE_REG_OPTION_MASKED)
 
 #define CSFE_CHICKEN1_REG(base)			XE_REG((base) + 0xd4, XE_REG_OPTION_MASKED)
@@ -92,6 +95,7 @@
 #define   TAIL_ADDR				0x001FFFF8
 
 #define RING_CTX_TIMESTAMP(base)		XE_REG((base) + 0x3a8)
+#define CSBE_DEBUG_STATUS(base)			XE_REG((base) + 0x3fc)
 
 #define RING_FORCE_TO_NONPRIV(base, i)		XE_REG(((base) + 0x4d0) + (i) * 4)
 #define   RING_FORCE_TO_NONPRIV_DENY		REG_BIT(30)
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index e66ae1bdaf9c..3fa2ece7d228 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -7,9 +7,11 @@
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_regs.h"
 #include "xe_gt_types.h"
 #include "xe_platform_types.h"
 #include "xe_rtp.h"
+#include "xe_step.h"
 
 #undef XE_REG_MCR
 #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
@@ -56,6 +58,12 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				   RING_FORCE_TO_NONPRIV_DENY,
 				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 	},
+	{ XE_RTP_NAME("16020183090"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
+		       ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(WHITELIST(CSBE_DEBUG_STATUS(RENDER_RING_BASE), 0))
+	},
+
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 23f1285135b8..f3326825bef5 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -737,6 +737,11 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
 	},
+	{ XE_RTP_NAME("16020183090"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
+		       ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(INSTPM(RENDER_RING_BASE), ENABLE_SEMAPHORE_POLL_BIT))
+	},
 
 	{}
 };
-- 
2.40.1

