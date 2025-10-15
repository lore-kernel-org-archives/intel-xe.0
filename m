Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496FECCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 22:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A3C10E902;
	Wed, 15 Oct 2025 22:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="drUutNXM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1342310E902
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 22:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760566032; x=1792102032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2NJDTdLFdew2GpiYkL1+XLpbkqhg1cKvUxw9e673Vrg=;
 b=drUutNXM04nJ7A4kXmUSgmfA/SAhzIlET9d3rzO4hZshckDQ7mR+Yl6r
 V7lfLkfPS0glY1j8AXfa+yD0QIRuBbX6mDjVJxx2z3EeMFnJRFNhH3B6o
 V3dScdsyOgRB+wf4nUXORoNWaiiXdyE6K2mQmVK/ELrcPG0jBB7OZjFyb
 eopzTMGudD9U/7lBAWlMoZZQXn48Hr0pmzQRS24mQtfRgyOvr6wX2Naeh
 iufz+Wa3XtZBgt7UGGxBNEiRvzo57k7OhEqx2Tdr2Qx82DiST8Y6xBDNv
 tyS5ARuPL6SN3hRlLtk/G3gFeqM8YKaJnywsJISXY2QwFWxwlqMOMvz3A Q==;
X-CSE-ConnectionGUID: P5Ot0w9hTQaP5xGKj1XLyQ==
X-CSE-MsgGUID: 3nCLimGMTy2EpEhQ2/GXww==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62794065"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62794065"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
X-CSE-ConnectionGUID: o9WstSphSESTbKWc8berlg==
X-CSE-MsgGUID: EZrkYzPxQkKshLy3Xd30wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="186298323"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2 20/22] drm/xe/xe3p_xpc: Skip compression tuning on
 platforms without flatccs
Date: Wed, 15 Oct 2025 15:06:35 -0700
Message-ID: <20251015-xe3p-v2-20-b9189b3056a2@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
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

