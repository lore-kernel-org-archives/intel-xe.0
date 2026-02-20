Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFF6C5AD44
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41E410E824;
	Fri, 20 Feb 2026 17:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lnb4VBXF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC7410E81C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608496; x=1803144496;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=bsQEtQlDrp71gA1G1e//TkpVbzyq1gUGcXX0KKzk2bc=;
 b=lnb4VBXF4PM3uEJAOzrZSi+lWrevzQ4nWP9wk7W1zkHvGDNNypiQUhVf
 HAvfipV8dBgbHkFkdcon/+nN/7qOeyAiAADhW71fVG6CVgEsG324L+4sn
 gGzdvYwYEeBid35lF7SFasA0P1A2OQucKNPXMRNDr5ZP+BvpbCwsAEVBu
 RksyVHPx+4eowvorW1WzFTaa/OJ06b/AcnPNQ094dXO5HxwPeW7q03xUi
 R2zbrTVXAlwot9oolOxcem9ttZtxgrXgEDV/5ezksth9SE+ep+xA9htD7
 pNLO8czoI75S4faTDCrDmEhh42dJ+izgI86uEQ4DAk0R7xNomwEQApEe5 g==;
X-CSE-ConnectionGUID: o5e1BvzaTXqCYuPMpKrXbw==
X-CSE-MsgGUID: uLyJTYiwQJm9OatCtPy7fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606729"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606729"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:16 -0800
X-CSE-ConnectionGUID: /yorfw30Tcqfo0MIpreG7w==
X-CSE-MsgGUID: WwmYgmHgTLuk3DHQNsw2Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138670"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:16 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:24 -0800
Subject: [PATCH v2 02/23] drm/xe/pvc: Drop pre-prod workarounds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-2-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7152;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=bsQEtQlDrp71gA1G1e//TkpVbzyq1gUGcXX0KKzk2bc=;
 b=kA0DAAoBTXkkBchykAQByyZiAGmYmazIQ8SaW4b62j6DZycbZDM7IhHkABzIlgFUDYceS7+tq
 IkCMwQAAQoAHRYhBMJnwwlEf+tPPyFtrE15JAXIcpAEBQJpmJmsAAoJEE15JAXIcpAE+fwP/3MY
 8lsh2YXAIgHDAp8aZcvfBjnXTOve+JjyKZfYAWDvLJBLk1MB3a4IDoVv3zYcU2Gm8WCd5FPdFTz
 jMEDlfzTtWp/VbKue7xKEmp8oNtwmxVasmTap48qL0BJsZjMEJq9zeJmaFDCePC4PJgLyYu08lK
 Cpenp+rDe5LjAJ02sbS2Z8R/XZXGXOf9qJpVAQNetu+vIqllkfN6MNAAh/DNHf6MTox7XE4RKvF
 aMbC/kUBwFkm1i0Ttt8lrcu2YAG5AppeSOn9q4Wyu0arWwJ2Ru/LsD58O2c/rHWw4k+KTWGwZm5
 r5FaFK8SwFIMC+xUfuXaJoOoS8xIFOR/JN8dnpBGiKToKuj1s7EkcFlBbSINnSJvwmQPKshUvel
 B48or6oizryAwjIUH31idS2O4QgAaB4AL18ZfKpP7FJxWj1f5epYvKPmzFMeqehUBzFglBuke1B
 1oec3rIgVFCxlaIQh7lWhTt3mpN9PizR5FTOor6p6W6Uw1aPGrp/CGz9mB+bziwtKHoZxy1mqyy
 5DPaVk9pjL8Htnw6IfDXbkZViJatafbOZcfn6BETm7xn0cl02UzFxsaMWESvOlCDEBapDzdOov5
 qeyGlIW96Sc04DYx9Y8uxVtxuSLBq2v7VZyWBVOPVM1IZIlbm450HMZIcS7+vomMGd6MtKpFiq3
 496rE
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

Production PVC hardware had a graphics stepping of C0.  Xe1 platforms
already aren't officially supported by the Xe driver, but pre-production
steppings are especially out of scope (and 'has_pre_prod_wa' is not set
in the device descriptor).  Drop the workarounds that aren't relevant to
production hardware.

v2:
 - Drop the stream->override_gucrc which is no longer set anywhere after
   the removal of Wa_1509372804.  (Bala)
 - Drop xe_guc_rc_set_mode / xe_guc_rc_unset_mode which are no longer
   used after the removal of Wa_1509372804.

Bspec: 44484
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        |  3 ---
 drivers/gpu/drm/xe/xe_guc_rc.c     | 29 -----------------------------
 drivers/gpu/drm/xe/xe_guc_rc.h     |  2 --
 drivers/gpu/drm/xe/xe_oa.c         | 19 -------------------
 drivers/gpu/drm/xe/xe_oa_types.h   |  3 ---
 drivers/gpu/drm/xe/xe_wa.c         |  5 -----
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 --
 7 files changed, 63 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index cbbb4d665b8fe66105727e83cfc59a13624d259e..54d2fc780127742e2e152da438c7d3e8332f3cbc 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -213,9 +213,6 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
 		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
 
-	if (XE_GT_WA(gt, 1509372804))
-		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
-
 	if (XE_GT_WA(gt, 14018913170))
 		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
index 427a889b2a1e04b1d01bd7db8add20ce41f60ce5..99fa127b261ffb0fe7bdae5fcbc78258f67529a8 100644
--- a/drivers/gpu/drm/xe/xe_guc_rc.c
+++ b/drivers/gpu/drm/xe/xe_guc_rc.c
@@ -129,32 +129,3 @@ int xe_guc_rc_enable(struct xe_guc *guc)
 
 	return guc_action_setup_gucrc(guc, GUCRC_FIRMWARE_CONTROL);
 }
-
-/**
- * xe_guc_rc_set_mode() - set new GUCRC mode
- * @guc: Xe GuC instance
- * @mode: new value of the mode.
- *
- * Function to set GuC RC mode to one of the enum values.
- *
- * Returns: 0 on success, negative error code on error
- */
-int xe_guc_rc_set_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode)
-{
-	guard(xe_pm_runtime_noresume)(guc_to_xe(guc));
-	return xe_guc_pc_action_set_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
-}
-
-/**
- * xe_guc_rc_unset_mode() - revert to default mode
- * @guc: Xe GuC instance
- *
- * Function to revert GuC RC mode to platform defaults.
- *
- * Returns: 0 on success, negative error code on error
- */
-int xe_guc_rc_unset_mode(struct xe_guc *guc)
-{
-	guard(xe_pm_runtime_noresume)(guc_to_xe(guc));
-	return xe_guc_pc_action_unset_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE);
-}
diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
index f1f949e7ecc0c6afab3eaeb616fe49d0437d710c..b083fc364dd430e5868a4e6da62b5777f5a6f1e1 100644
--- a/drivers/gpu/drm/xe/xe_guc_rc.h
+++ b/drivers/gpu/drm/xe/xe_guc_rc.h
@@ -12,7 +12,5 @@ enum slpc_gucrc_mode;
 int xe_guc_rc_init(struct xe_guc *guc);
 int xe_guc_rc_enable(struct xe_guc *guc);
 void xe_guc_rc_disable(struct xe_guc *guc);
-int xe_guc_rc_set_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode);
-int xe_guc_rc_unset_mode(struct xe_guc *guc);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a462d6983d8d6daf74beaf6fef5bfe2ab779179d..72fc4424017bf8fb7a42e3a3ae3f6adfe91cf21d 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -873,10 +873,6 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
 	xe_pm_runtime_put(stream->oa->xe);
 
-	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
-	if (stream->override_gucrc)
-		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
-
 	xe_oa_free_configs(stream);
 	xe_file_put(stream->xef);
 }
@@ -1760,18 +1756,6 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 		goto exit;
 	}
 
-	/*
-	 * GuC reset of engines causes OA to lose configuration
-	 * state. Prevent this by overriding GUCRC mode.
-	 */
-	if (XE_GT_WA(stream->gt, 1509372804)) {
-		ret = xe_guc_rc_set_mode(&gt->uc.guc, SLPC_GUCRC_MODE_GUCRC_NO_RC6);
-		if (ret)
-			goto err_free_configs;
-
-		stream->override_gucrc = true;
-	}
-
 	/* Take runtime pm ref and forcewake to disable RC6 */
 	xe_pm_runtime_get(stream->oa->xe);
 	stream->fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
@@ -1822,9 +1806,6 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 err_fw_put:
 	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
 	xe_pm_runtime_put(stream->oa->xe);
-	if (stream->override_gucrc)
-		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
-err_free_configs:
 	xe_oa_free_configs(stream);
 exit:
 	xe_file_put(stream->xef);
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 08cc8d7c221582662abff9397e27fbb8ccca468a..b03ffd513483449adc6b2937c0707e5bfc619a5b 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -239,9 +239,6 @@ struct xe_oa_stream {
 	/** @poll_period_ns: hrtimer period for checking OA buffer for available data */
 	u64 poll_period_ns;
 
-	/** @override_gucrc: GuC RC has been overridden for the OA stream */
-	bool override_gucrc;
-
 	/** @oa_status: temporary storage for oa_status register value */
 	u32 oa_status;
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index aa5755bcdc04a3ec2569ab9676a9dd95516f1711..4b2c77f51fd830fe2439708865fb0b966545bc71 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -499,11 +499,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       ENGINE_CLASS(COMPUTE)),
 	  XE_RTP_ACTIONS(SET(RING_HWSTAM(RENDER_RING_BASE), ~0))
 	},
-	{ XE_RTP_NAME("14014999345"),
-	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COMPUTE),
-		       GRAPHICS_STEP(B0, C0)),
-	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC))
-	},
 
 	/* Xe_LPG */
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index cc988f2a18d33365dc09d32f4e85ced01b823877..c3222d9504889b5175fdfa73db0bf4e9910a277d 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -8,7 +8,6 @@
 22012727685	SUBPLATFORM(DG2, G11)
 22016596838	PLATFORM(PVC)
 18020744125	PLATFORM(PVC)
-1509372804	PLATFORM(PVC), GRAPHICS_STEP(A0, C0)
 1409600907	GRAPHICS_VERSION_RANGE(1200, 1250)
 22014953428	SUBPLATFORM(DG2, G10)
 		SUBPLATFORM(DG2, G12)
@@ -53,7 +52,6 @@
 18013179988	GRAPHICS_VERSION(1255)
 		GRAPHICS_VERSION_RANGE(1270, 1274)
 1508761755	GRAPHICS_VERSION(1255)
-		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
 16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
 		MEDIA_VERSION_RANGE(1301, 3000)
 		MEDIA_VERSION(3002)

-- 
2.53.0

