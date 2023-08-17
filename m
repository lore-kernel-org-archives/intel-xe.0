Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66383C5ACA1
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 20:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C2B10E090;
	Thu, 17 Aug 2023 20:19:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208EB10E0C7
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 20:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692303567; x=1723839567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JMU5eeNIJqJIQp/PNQOkoevSIQ+DAvel4yHnjX5DaXs=;
 b=SPk+3h/4kOWXZaXPKj1Xwr+vtCCGOh3AL2fphYTICVZhX1Bfwrjsn4yK
 FCL2x3Li9BzC/UXfUhEcG6beVCI9+kLl8GiBTLrVtmGbQwC0pWJiLuQ1g
 LBEcOQouuWXTWFcIpsdqfC1R/yAK/cqTuw48vR/85bAgihEGEdC4aRDdH
 3nsOij8Jh8dZ3AUcdSz2oBMSHnj4fiqmWyt4IvYfdJ0qGTaQ8b7m379od
 Fba9eCAtudOSoWi7WpXZa5IhRd3sbHxg103HsTN3vEdhKQfkGszJRstVA
 VI3uH6/hyoyx+vc03dRjsCfXFha86I3sSQQXmGS3Jjx2fkham4ndPJZzb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363077729"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="363077729"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 13:18:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="878379341"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 13:18:55 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 13:18:31 -0700
Message-ID: <20230817201831.1583172-8-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817201831.1583172-1-daniele.ceraolospurio@intel.com>
References: <20230817201831.1583172-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 7/7] drm/xe: enable idle msg and set
 hysteresis for GSCCS
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

On MTL (and only on MTL) the GSCCS defaults with idle messaging
disabled. This means that, once awoken, the GSCCS will never signal its
idleness to the GT. To allow the GT to enter the proper low-power state,
we need therefore to turn idle messaging on. As part of this, we also
need to set a proper hysteresis value for the engine.

Bspec: 71496
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  4 ++++
 drivers/gpu/drm/xe/xe_hw_engine.c        | 17 +++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 79873bf64e8d..f012a66cb3da 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -22,9 +22,13 @@
 #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
 
 #define RING_PSMI_CTL(base)			XE_REG((base) + 0x50, XE_REG_OPTION_MASKED)
+#define   IDLE_MSG_DISABLE			REG_BIT(0)
 #define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
 #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
 
+#define RING_PWRCTX_MAXCNT(base)		XE_REG((base) + 0x54)
+#define   IDLE_WAIT_TIME			REG_GENMASK(19, 0)
+
 #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
 #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
 #define RING_IPEIR(base)			XE_REG((base) + 0x64)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 81281e9c02eb..cd0ac3ce5abf 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -339,6 +339,23 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 					   ring_cmd_cctl_val,
 					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 		},
+		/*
+		 * To allow the GSC engine to go idle on MTL we need to enable
+		 * idle messaging and set the hysteresis value (we use 0xA=5us
+		 * as recommended in spec). On platform after MTL this is
+		 * enabled by default.
+		 */
+		{ XE_RTP_NAME("MTL GSCCS IDLE MSG enable"),
+		  XE_RTP_RULES(PLATFORM(METEORLAKE), ENGINE_CLASS(OTHER)),
+		  XE_RTP_ACTIONS(FIELD_SET(RING_PSMI_CTL(0),
+					   IDLE_MSG_DISABLE,
+					   0,
+					   XE_RTP_ACTION_FLAG(ENGINE_BASE)),
+				 FIELD_SET(RING_PWRCTX_MAXCNT(0),
+					   IDLE_WAIT_TIME,
+					   0xA,
+					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+		},
 		{}
 	};
 
-- 
2.41.0

