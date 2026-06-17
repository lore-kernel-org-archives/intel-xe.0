Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D679DCD98E2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 19:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8906710F0E9;
	Wed, 17 Jun 2026 19:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgqyKxks";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E102810EB0E
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 19:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781724395; x=1813260395;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=uk2DIV/y6HvOPLqrVTgKJ0wA+vhUgWKteZ0Z0eoUje8=;
 b=jgqyKxksPNuAgLaE0tcuWczPH/l3er08TSHnmewN5cLbFy2EwxP587YW
 mPouV8jA+W00OkODBOkAguIJUZgfxMda9gfU2jz3QrDlbpW9C1DmQAkk2
 7rAQgikuiPRYBCAmYMX/nCB+taEUkoHiUD68L1k60YjMmMGOg69RJ8dL6
 jLZOpDpmFLYUNHGxFwPYB/btqBIE+rV3vlvVstdqWE1fNbIYtaq7zUgV2
 ysAUvINzZyE0BHfsUsjj8QK94s2mA5dkz+MeZ9j/DxERC3UaGpaoil+qp
 jtD/jpV4EhjD4S6fwv/QyjDooa/SkdsC2gUfijSOjuauQxjy68Nim2++k Q==;
X-CSE-ConnectionGUID: 2TVYxbUKQgCOh7FsGHbtCA==
X-CSE-MsgGUID: tmRj7LpzQnWeIXeDo/qkPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="105339760"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="105339760"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 12:25:47 -0700
X-CSE-ConnectionGUID: fTylDPPcQaOQpq7LfH5y9w==
X-CSE-MsgGUID: swMzzB3YTwew0H/f+9sGoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="278347308"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.134])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 12:25:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 17 Jun 2026 12:24:48 -0700
Subject: [PATCH v2 4/5] drm/xe: Move engines' non-LRC programming RTP table
 off the stack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-rtp_with_dynamic_vals-v2-4-3f4cb34c2ea1@intel.com>
References: <20260617-rtp_with_dynamic_vals-v2-0-3f4cb34c2ea1@intel.com>
In-Reply-To: <20260617-rtp_with_dynamic_vals-v2-0-3f4cb34c2ea1@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Violet Monti <violet.monti@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7805;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=uk2DIV/y6HvOPLqrVTgKJ0wA+vhUgWKteZ0Z0eoUje8=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqMvS3fTzZoG5s2/qGtkGH5DBenNIQcELfwrjKW
 kf7RG95wg6JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCajL0twAKCRBNeSQFyHKQ
 BBthD/9M15zcM953bdfNkuc33P96IW6rcxwTlCxkvo76pzXHli4dSGmMRzsKW2k8pLodeLY1Ppf
 AJ9PbEGhguY/3Rgrw0Xg2G/S0V0nWT3iRRiGXeQqoSDscTtZEN+yIEG/NoM27tqA1PLpsnx/J5r
 PnKmyaLbevFDS4ua1/CAwDYma09ICepgbNyERKF0I1C1EZ04D7cxsACYBoJzZ7azyVM/hHgUNuq
 UsialuQK2Jq3MaIio49dQWLMV9HCs8Zm/ImJoUaynvnMgACnDXvI3JcYgBMDHNQGHxWLqCs7Hn+
 yn+mibO85q9hy72lQvbSYneeTJ0VU8TOmRXW0/6ykCmbLYpYDpo8zmldt4TXBFs96o9+txvbSoA
 BtRtIerJnz+FKwaK3s0XpdsjJKO/1UqHx2L22A9HjkmrG6Dl0Vv9cxOJxjVr7s4xt13e05VvU74
 4Pm57EQrxr/yLCN5zhIaxPnJnQECeMGJdDK5H1ETLwCAM6X8fqwpwfnAy/JQ+KRZqXej3sxJbFc
 x8Zsk6x45eHAw2WASSg4M0FP9XOQN+DaRtpG8PiBGZrKfGIPwZ4bymhoFrNt1YvgdVAscUf7kGu
 z6rPpiY9B+vd+Z5lZ2K8YFz5pjieWcnS7RFf2H0kmQuuzKRYOhk6k2/q4hQ2CRU//YuGK0wNSLd
 EmBYaimknRyj29Q==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

The 'engine_sr' RTP table was allocated on the stack because it wasn't
truly constant and needed to calculate the proper value for
RING_CMD_CCTL at runtime based on other stack variables.  Using the
FIELD_SET_FUNC action allows us to make the table itself truly constant
and move it off the stack; the RING_CMD_CCTL value is now calculated
during RTP table processing.

v2:
 - Made table static

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 158 ++++++++++++++++++++------------------
 1 file changed, 82 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 603bb197801a..7e7411bfe1dc 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -387,86 +387,92 @@ void xe_hw_engine_setup_reg_lrc(struct xe_hw_engine *hwe)
 	xe_tuning_process_lrc(hwe);
 }
 
+/*
+ * RING_CMD_CCTL specifies the default MOCS entry that will be
+ * used by the command streamer when executing commands that
+ * don't have a way to explicitly specify a MOCS setting.
+ * The default should usually reference whichever MOCS entry
+ * corresponds to uncached behavior, although use of a WB cached
+ * entry is recommended by the spec in certain circumstances on
+ * specific platforms.
+ * Bspec: 72161
+ */
+static u32 ring_cmd_cctl_val(struct xe_gt *gt, struct xe_hw_engine *hwe)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	u8 mocs_read_idx = gt->mocs.uc_index;
+
+	if (hwe->class == XE_ENGINE_CLASS_COMPUTE && IS_DGFX(xe) &&
+	    (GRAPHICS_VER(xe) >= 20 || xe->info.platform == XE_PVC))
+		mocs_read_idx = gt->mocs.wb_index;
+
+	return REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, gt->mocs.uc_index) |
+		REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
+}
+
+static const struct xe_rtp_table_sr engine_sr = XE_RTP_TABLE_SR(
+	{ XE_RTP_NAME("RING_CMD_CCTL_default_MOCS"),
+	  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
+	  XE_RTP_ACTIONS(FIELD_SET_FUNC(RING_CMD_CCTL(0),
+					CMD_CCTL_WRITE_OVERRIDE_MASK |
+					CMD_CCTL_READ_OVERRIDE_MASK,
+					ring_cmd_cctl_val,
+					XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+	},
+	{ XE_RTP_NAME("Disable HW status page updates for interrupts"),
+	  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
+	  XE_RTP_ACTIONS(SET(RING_HWSTAM(0), ~0x0,
+			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+	},
+	{ XE_RTP_NAME("Disable engine 'legacy' mode"),
+	  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
+	  XE_RTP_ACTIONS(SET(GFX_MODE(0), GFX_DISABLE_LEGACY_MODE,
+			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+	},
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
+	/* Enable Priority Mem Read */
+	{ XE_RTP_NAME("Priority_Mem_Read"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
+			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+	},
+	{ XE_RTP_NAME("Enable CCS Engine(s)"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, XE_RTP_END_VERSION_UNDEFINED),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(RCU_MODE, RCU_MODE_CCS_ENABLE))
+	},
+	/* Use Fixed slice CCS mode */
+	{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
+	  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
+	  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
+				   RCU_MODE_FIXED_SLICE_CCS_MODE))
+	},
+	{ XE_RTP_NAME("Enable MSI-X interrupt support"),
+	  XE_RTP_RULES(FUNC(xe_rtp_match_has_msix)),
+	  XE_RTP_ACTIONS(SET(GFX_MODE(0), GFX_MSIX_INTERRUPT_ENABLE,
+			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+	},
+);
+
 static void
 hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 {
-	struct xe_gt *gt = hwe->gt;
-	struct xe_device *xe = gt_to_xe(gt);
-	/*
-	 * RING_CMD_CCTL specifies the default MOCS entry that will be
-	 * used by the command streamer when executing commands that
-	 * don't have a way to explicitly specify a MOCS setting.
-	 * The default should usually reference whichever MOCS entry
-	 * corresponds to uncached behavior, although use of a WB cached
-	 * entry is recommended by the spec in certain circumstances on
-	 * specific platforms.
-	 * Bspec: 72161
-	 */
-	const u8 mocs_write_idx = gt->mocs.uc_index;
-	const u8 mocs_read_idx = hwe->class == XE_ENGINE_CLASS_COMPUTE && IS_DGFX(xe) &&
-				 (GRAPHICS_VER(xe) >= 20 || xe->info.platform == XE_PVC) ?
-				 gt->mocs.wb_index : gt->mocs.uc_index;
-	u32 ring_cmd_cctl_val = REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, mocs_write_idx) |
-				REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
-	const struct xe_rtp_table_sr engine_sr = XE_RTP_TABLE_SR(
-		{ XE_RTP_NAME("RING_CMD_CCTL_default_MOCS"),
-		  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
-		  XE_RTP_ACTIONS(FIELD_SET(RING_CMD_CCTL(0),
-					   CMD_CCTL_WRITE_OVERRIDE_MASK |
-					   CMD_CCTL_READ_OVERRIDE_MASK,
-					   ring_cmd_cctl_val,
-					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
-		},
-		{ XE_RTP_NAME("Disable HW status page updates for interrupts"),
-		  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
-		  XE_RTP_ACTIONS(SET(RING_HWSTAM(0), ~0x0,
-				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
-		},
-		{ XE_RTP_NAME("Disable engine 'legacy' mode"),
-		  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
-		  XE_RTP_ACTIONS(SET(GFX_MODE(0), GFX_DISABLE_LEGACY_MODE,
-				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
-		},
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
-		{ XE_RTP_NAME("Enable CCS Engine(s)"),
-		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, XE_RTP_END_VERSION_UNDEFINED),
-			       FUNC(xe_rtp_match_first_render_or_compute)),
-		  XE_RTP_ACTIONS(SET(RCU_MODE, RCU_MODE_CCS_ENABLE))
-		},
-		/* Use Fixed slice CCS mode */
-		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
-		  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
-		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
-					   RCU_MODE_FIXED_SLICE_CCS_MODE))
-		},
-		{ XE_RTP_NAME("Enable MSI-X interrupt support"),
-		  XE_RTP_RULES(FUNC(xe_rtp_match_has_msix)),
-		  XE_RTP_ACTIONS(SET(GFX_MODE(0), GFX_MSIX_INTERRUPT_ENABLE,
-				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
-		},
-	);
 
 	xe_rtp_process_to_sr(&ctx, &engine_sr, &hwe->reg_sr, false);
 }

-- 
2.54.0

