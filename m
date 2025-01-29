Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4DAC02190
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 15:56:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC09C10E839;
	Wed, 29 Jan 2025 15:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="KTn2VrA4";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CA110E834
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 15:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m/1NkHEMOt+Sh3PCwqavD0WYsbu+i5fsOMiK0aa45Vg=; b=KTn2VrA4hgD1fB/3V26rcpmO3e
 7594qH0byL39Dlhd3njA5PLYs942qZn51/p68oJVwS6u5gGj0nsOEKm1Tk30PEqcXkAlHUwfNeO6Q
 rCdGsIGBdIq7daJW5VHR/T99FD3z8praR0BklaUUWch6wTq7bnJPAYN+AuZx3+GUqJHKKIXqRr1dF
 L7HIFBLTAirb5fi3fcsDsae+EsuYqxvRDUKFt78g0EOLS1HgFt4rGQrHcgg3PlInNfaa6c3SHS7se
 uhabM0eKyP+fOhSr7KL0GaIg2rXGFPQWEjS6HSd1u7m8O/q5/YRBp7ZZCILqYHG15dT+iZBMikvM3
 OfPMMpBg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tdAQZ-000e7i-3c; Wed, 29 Jan 2025 16:56:37 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 5/5] drm/xe: Move a couple static workarounds/tunings to the
 static list
Date: Wed, 29 Jan 2025 15:56:27 +0000
Message-ID: <20250129155627.93827-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250129155627.93827-1-tvrtko.ursulin@igalia.com>
References: <20250129155627.93827-1-tvrtko.ursulin@igalia.com>
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

One workaround and one tuning are completely static so can be moved to the
respective static lists in xe_wa.c and xa_tunings.c respectively.
Advantage being that they will be shown in debugfs as active, when active.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 22 ----------------------
 drivers/gpu/drm/xe/xe_tuning.c    |  8 ++++++++
 drivers/gpu/drm/xe/xe_wa.c        | 16 ++++++++++++++++
 3 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index fc447751fe78..423fb43a1a4a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -437,28 +437,6 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 					   ring_cmd_cctl_val,
 					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 		},
-		/*
-		 * To allow the GSC engine to go idle on MTL we need to enable
-		 * idle messaging and set the hysteresis value (we use 0xA=5us
-		 * as recommended in spec). On platforms after MTL this is
-		 * enabled by default.
-		 */
-		{ XE_RTP_NAME("MTL GSCCS IDLE MSG enable"),
-		  XE_RTP_RULES(MEDIA_VERSION(1300), ENGINE_CLASS(OTHER)),
-		  XE_RTP_ACTIONS(CLR(RING_PSMI_CTL(0),
-				     IDLE_MSG_DISABLE,
-				     XE_RTP_ACTION_FLAG(ENGINE_BASE)),
-				 FIELD_SET(RING_PWRCTX_MAXCNT(0),
-					   IDLE_WAIT_TIME,
-					   0xA,
-					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
-		},
-		/* Enable Priority Mem Read */
-		{ XE_RTP_NAME("Priority_Mem_Read"),
-		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
-		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
-				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
-		},
 		{}
 	};
 
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index c5c5a6fba406..f9d178ae0a73 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -10,6 +10,7 @@
 #include <drm/drm_managed.h>
 
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_engine_regs.h"
 #include "xe_gt_types.h"
 #include "xe_platform_types.h"
 #include "xe_rtp.h"
@@ -95,6 +96,13 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE))
 	},
+
+	{ XE_RTP_NAME("Priority_Mem_Read"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
+			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+	},
+
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 744dba4fdb58..1380bcf17fac 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -458,6 +458,22 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_TDL_SVHS_GATING))
 	},
+	/*
+	 * To allow the GSC engine to go idle on MTL we need to enable
+	 * idle messaging and set the hysteresis value (we use 0xA=5us
+	 * as recommended in spec). On platforms after MTL this is
+	 * enabled by default.
+	 */
+	{ XE_RTP_NAME("MTL GSCCS IDLE MSG enable"),
+	  XE_RTP_RULES(MEDIA_VERSION(1300), ENGINE_CLASS(OTHER)),
+	  XE_RTP_ACTIONS(CLR(RING_PSMI_CTL(0),
+			     IDLE_MSG_DISABLE,
+			     XE_RTP_ACTION_FLAG(ENGINE_BASE)),
+			 FIELD_SET(RING_PWRCTX_MAXCNT(0),
+				   IDLE_WAIT_TIME,
+				   0xA,
+				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+	},
 
 	/* Xe2_LPG */
 
-- 
2.48.0

