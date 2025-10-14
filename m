Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E938CCD192
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F085B10E536;
	Tue, 14 Oct 2025 03:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IqKHISKE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA74C10E52C
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412330; x=1791948330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9YHXR752IHkP3GKpxn1wqzNngAV33GVa6jfCDetnWSs=;
 b=IqKHISKEKDBd10EOzPtOIzam7DUm/91M3Uw7W8/er6zIZtM/PY9EP7m0
 9Kf8ty5wzp7IN5iD2TS3zUcTV6uzJFb6mUZWcQCdyB5/vIuqH9YAIFYid
 K43SKd8aZl1bess0JebFwQyNIWInj28NFvB4EEP5C53prf5peIobFK75I
 HmRDENnZmFQK2JCY5xNAI2N6NQNAzXexI9nd5voxw2kGCrt5JLG4uvBll
 6g8R0GRUsaNSj8jL5N8ueBAtFEFIHz4EqftGRgrB1VNlf7HO7hC906NJq
 FdrNzfkroIyU119Z9LYUnf1q2dqe9n/T83I7IQhW5+v2mkr7EOIfsPB93 A==;
X-CSE-ConnectionGUID: Gv0LvZIFQx2gKz/33vdtzQ==
X-CSE-MsgGUID: M8rC6ZdcRq2Cah32AaOccQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414885"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414885"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:30 -0700
X-CSE-ConnectionGUID: DjDy9t4aQBq7/P5LKCCPmA==
X-CSE-MsgGUID: UuHgUueMRWGlWoety1Yg0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567329"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 21/23] drm/xe/xe3p_xpc: Skip compression tuning on platforms
 without flatccs
Date: Mon, 13 Oct 2025 20:24:53 -0700
Message-ID: <20251013-xe3p-v1-21-bfb74f038215@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
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
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c    |  6 ++++++
 drivers/gpu/drm/xe/xe_rtp.h    | 10 ++++++++++
 drivers/gpu/drm/xe/xe_tuning.c |  9 ++++++---
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index b5f430d59f805..22a879270c1ec 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -376,3 +376,9 @@ bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
 {
 	return xe_gt_has_discontiguous_dss_groups(gt);
 }
+
+bool xe_rtp_match_has_flat_ccs(const struct xe_gt *gt,
+			      const struct xe_hw_engine *hwe)
+{
+	return gt_to_xe(gt)->info.has_flat_ccs;
+}
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index ac12ddf6cde6d..92f0d16110dd5 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -483,4 +483,14 @@ bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
 bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
 						  const struct xe_hw_engine *hwe);
 
+/**
+ * xe_rtp_match_has_flat_ccs - Match when platform has FlatCCS compression
+ * @gt: GT structure
+ * @hwe: Engine instance
+ *
+ * Returns: true if platform has FlatCCS compression, false otherwise
+ */
+bool xe_rtp_match_has_flat_ccs(const struct xe_gt *gt,
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

