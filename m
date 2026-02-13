Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661A6EF99E3
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAED10E845;
	Fri, 13 Feb 2026 22:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l2MrJRSN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B97410E844
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021957; x=1802557957;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=X54kzelXnZtDBvyHV9Q56Q2kGyZvRIr2jM6bUn9c25o=;
 b=l2MrJRSNxqwCe6Azsn2yXZEox93+t0EE+LAcoRyALljn2Gzf2S/O3Btg
 U3WtRtxqrAswm0kUWO5zG67fIqPGCjlER5JjyBwUpzQzda+cNcSommzjt
 63OrI+9r9DbkA+FULXs1dSTCx305n7IfSYVCm4VAtjrUGlgWhx5VAO/Ts
 lTM1Xx0QvY1CSGVAzr/r02guc5ZtjcVSgRAdVLpRa4gnwdz1j3eXQOQoQ
 z+FW15ynhvPucwolGu9Fj6CO0+tDgKWz9wJOfdQW10hQxsqceNZKAIitc
 fy+2ql9pFPQ9ecy2GAe3a5lQt+6nUl6+EV1bXTG54p38ysPMtn3haHOKk Q==;
X-CSE-ConnectionGUID: 3se81u8GRZC0MDPVoMruYw==
X-CSE-MsgGUID: b9CB4RRVRuK7HEqJpOzvaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654431"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654431"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:37 -0800
X-CSE-ConnectionGUID: USkeMF6RRoyfqKX33o/sog==
X-CSE-MsgGUID: Od2la82TR961BerSgz0nnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705626"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:37 -0800
Subject: [PATCH 02/22] drm/xe/pvc: Drop pre-prod workarounds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-2-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3791;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=X54kzelXnZtDBvyHV9Q56Q2kGyZvRIr2jM6bUn9c25o=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aBYBoaBS72mG5oOeicZSfAtkwZJGdDLdLYP
 NiRzxS5HL2JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mgQAKCRBNeSQFyHKQ
 BL64EAC1qTbXTKLxxuSyBALXXD02RczVKn3U/nB3ojUe/KlfHT1NLQTF7mlA6dii+fHy/dF6TfE
 A8fM8hBBc4Dxl+PN9ES6b54EUjsyJ65Hou333b1JIG8ABKCyDbRF2j3IxualeinWCluzJDj3RUf
 WmBEWodoD4MJ0pbhtE7oTmtIuMjrq5j9VKKnVqKIJvD+J8kmNR4Wx0Yg1eNZv3ijvDAa/14bEnG
 8UZe8wKDHhvGJy5HAfQHrpY1j7MAgDFjyAjNbGP4FnFSr7tAgvcVIo071+yv0/hrZI7cri0q6Om
 5GYq4qoFerf+4XG4Ra7XtrvjpkyeorBpyFkQ0ENvexJXFTqPrvHGsKFFjiKkdqJR0isX8pdwYaI
 nh58M/9KkUX+BfAAqTpjcig18DdT+y6pG0sZMTdZDditlIf0kGh3QYOuvITSgFzrP9udPM90jYq
 zRc0j9GPk1WaGareKhRXrdyUOUBD5TUxLhbGwLy7OV1geqAiVH8q7kRnqfssEZ+pVeOjx+PhBzn
 dPVoEy+dONsOoHMlzU3VjoCU223IiguZ9eYDQJLOMFAZSwLNnUxJj0G6PS4R2fNAE9FqAmHHDEZ
 buZvNcSITiD357ovwDntu6LLKlP15gTnffuHBiny4jwY7d2MftYEtjQKiAUZ7q75JhRIcWH3uA0
 VMv87lzzf/Apmsg==
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

Bspec: 44484
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        |  3 ---
 drivers/gpu/drm/xe/xe_oa.c         | 13 -------------
 drivers/gpu/drm/xe/xe_wa.c         |  5 -----
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 --
 4 files changed, 23 deletions(-)

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
 
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a462d6983d8d6daf74beaf6fef5bfe2ab779179d..8683b56d4c80a4a514a85924fe3b6a61e7a9fd18 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1760,18 +1760,6 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
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
@@ -1824,7 +1812,6 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	xe_pm_runtime_put(stream->oa->xe);
 	if (stream->override_gucrc)
 		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
-err_free_configs:
 	xe_oa_free_configs(stream);
 exit:
 	xe_file_put(stream->xef);
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 7f45d6eba44354a4dd047ac5800f18c6a9c90725..fb1ce4479dd81a5fe91906948cd37a7e654b655c 100644
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

