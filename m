Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537F8CCD1AB
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 02:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA8B10EAF1;
	Fri, 17 Oct 2025 02:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ari2jAht";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D46410EAE3
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 02:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760668040; x=1792204040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2NJDTdLFdew2GpiYkL1+XLpbkqhg1cKvUxw9e673Vrg=;
 b=Ari2jAhtuoK7zFIMVftSikpcIU7XW9s/mpla9ENs0hZu58I1vzKDNykj
 AV/VL2d0LvB7aSk/6k8xS7FfyQ/F54S3AVoQ+PnYH0Whh4TjryK/DfRWN
 lBbWhEz7aYrcoaMuWtYE5UJGDsSgE059vdmcfUG0cF9qLDM4KluBEhRQC
 5UWHlTNACDiMFekicgIpo+sN5f483hmOWGu9lsThXmnG/uUt8QjcN8pim
 HH/V42AWguArhiU6kBInl49W6pDRLoipPkLXHLdTjHPNSMgOtZ4pMfvy0
 t14BeebKT+qAlpSqslbmqoCuBBO4Ps8SnuDWd8UQUdfSwmD0edaybTclv g==;
X-CSE-ConnectionGUID: UWQz0qjUTf23yIP3SXQPHg==
X-CSE-MsgGUID: vKBDtkckS9KckbQVCWkocg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66739226"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66739226"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:20 -0700
X-CSE-ConnectionGUID: mVUDi4PNRhSVkMWukM4aZg==
X-CSE-MsgGUID: w5eOELYGTRyJtB6sXUKobA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183089223"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 22/24] drm/xe/xe3p_xpc: Skip compression tuning on
 platforms without flatccs
Date: Thu, 16 Oct 2025 19:26:41 -0700
Message-ID: <20251016-xe3p-v3-22-3dd173a3097a@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Matt Roper <matthew.d.roper@intel.com>

The compression overfetch tuning settings only apply to platforms that
support FlatCCS.  In Xe3p_XPC (and any future IPs that also lack
compression) some of the registers being adjusted by this tuning will
not exist or may have been repurposed for something else, so we should
take care not to try to program them.

Note that our xe_rtp_match_has_flatccs() function will also return false
on platforms that do have FlatCCS in the hardware design, but have
compression manually disabled in the BIOS.  On such platforms the
registers still exist (and it would be fine to continue programming
them), but they would have no effect, so skipping that tuning is also
safe.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c    |  7 +++++++
 drivers/gpu/drm/xe/xe_rtp.h    | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_tuning.c |  9 ++++++---
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 66707cc89ec97..ed509b1c8cfcd 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -378,3 +378,10 @@ bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_device *xe,
 {
 	return xe_gt_has_discontiguous_dss_groups(gt);
 }
+
+bool xe_rtp_match_has_flat_ccs(const struct xe_device *xe,
+			       const struct xe_gt *gt,
+			       const struct xe_hw_engine *hwe)
+{
+	return xe->info.has_flat_ccs;
+}
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index e5b8a9452e29e..ba5f940c0a961 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -491,4 +491,16 @@ bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_device *xe,
 						  const struct xe_gt *gt,
 						  const struct xe_hw_engine *hwe);
 
+/**
+ * xe_rtp_match_has_flat_ccs - Match when platform has FlatCCS compression
+ * @xe: Device structure
+ * @gt: GT structure
+ * @hwe: Engine instance
+ *
+ * Returns: true if platform has FlatCCS compression, false otherwise
+ */
+bool xe_rtp_match_has_flat_ccs(const struct xe_device *xe,
+			       const struct xe_gt *gt,
+			       const struct xe_hw_engine *hwe);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index fd58ea5e78bf6..7c140d8cb1e07 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -40,7 +40,8 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
 	},
 	{ XE_RTP_NAME("Tuning: Compression Overfetch"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
+		       FUNC(xe_rtp_match_has_flat_ccs)),
 	  XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX),
 			 SET(CCCHKNREG1, L3CMPCTRL))
 	},
@@ -58,12 +59,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG3, COMPPWOVERFETCHEN))
 	},
 	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
+		       FUNC(xe_rtp_match_has_flat_ccs)),
 	  XE_RTP_ACTIONS(SET(L3SQCREG2,
 			     COMPMEMRD256BOVRFETCHEN))
 	},
 	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only - media"),
-	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
+		       FUNC(xe_rtp_match_has_flat_ccs)),
 	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG2,
 			     COMPMEMRD256BOVRFETCHEN))
 	},

-- 
2.51.0

