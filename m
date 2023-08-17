Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E198C678DD
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 22:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD5C10E125;
	Thu, 17 Aug 2023 22:17:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775D910E125
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 22:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692310635; x=1723846635;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=78ROn93SozHROBxJV/eM6VvAT8aGN7/FhztSlosK7OE=;
 b=kzmqEAOpXLT1XHoH0eubGWamadNwef2WonxwDulnuIqQ2pZRjg7XuqOF
 dAdO9lYzXQn0YYWXu3eECjvhTmwHMoFRyHWSUxhx6pFs0K1vexaIRlOFT
 KRUD8YnplJxnGk3vDdUgAvMK1CX4wcFJRdhPvW2hDHv8kJjNEaJ7e2iYQ
 bdti3dEvinnWorvLwctLFOny8jbU0p+HoJ8bpBIRzXMKMWavRyMNEjZPY
 tmJxFZ3KDCHwrRvez6gmga30K+y9yRhrbq5eigxHcow6QQCjwOPE04jDx
 wqke3lvqGpUn4njQbWUms3wtUAFYJXjU6wQEtOFMA/ZREcN8Q1ifhhKkB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363105258"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="363105258"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 15:17:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="737874261"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="737874261"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 15:17:14 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 15:17:07 -0700
Message-ID: <20230817221707.1602873-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817201831.1583172-8-daniele.ceraolospurio@intel.com>
References: <20230817201831.1583172-8-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: enable idle msg and set hysteresis for
 GSCCS
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On MTL (and only on MTL) the GSCCS defaults with idle messaging
disabled. This means that, once awoken, the GSCCS will never signal its
idleness to the GT. To allow the GT to enter the proper low-power state,
we need therefore to turn idle messaging on. As part of this, we also
need to set a proper hysteresis value for the engine.

v2: use MEDIA_VERSION() and CLR() for the RTP rule and action, add reg
bit define in descending order (Matt)

Bspec: 71496
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  4 ++++
 drivers/gpu/drm/xe/xe_hw_engine.c        | 16 ++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 79873bf64e8d..d57fd855086a 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -24,6 +24,10 @@
 #define RING_PSMI_CTL(base)			XE_REG((base) + 0x50, XE_REG_OPTION_MASKED)
 #define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
 #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
+#define   IDLE_MSG_DISABLE			REG_BIT(0)
+
+#define RING_PWRCTX_MAXCNT(base)		XE_REG((base) + 0x54)
+#define   IDLE_WAIT_TIME			REG_GENMASK(19, 0)
 
 #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
 #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 81281e9c02eb..24b5226f1433 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -339,6 +339,22 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 					   ring_cmd_cctl_val,
 					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 		},
+		/*
+		 * To allow the GSC engine to go idle on MTL we need to enable
+		 * idle messaging and set the hysteresis value (we use 0xA=5us
+		 * as recommended in spec). On platforms after MTL this is
+		 * enabled by default.
+		 */
+		{ XE_RTP_NAME("MTL GSCCS IDLE MSG enable"),
+		  XE_RTP_RULES(MEDIA_VERSION(1300), ENGINE_CLASS(OTHER)),
+		  XE_RTP_ACTIONS(CLR(RING_PSMI_CTL(0),
+				     IDLE_MSG_DISABLE,
+				     XE_RTP_ACTION_FLAG(ENGINE_BASE)),
+				 FIELD_SET(RING_PWRCTX_MAXCNT(0),
+					   IDLE_WAIT_TIME,
+					   0xA,
+					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+		},
 		{}
 	};
 
-- 
2.41.0

