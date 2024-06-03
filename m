Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5123C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 10:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDB010E35A;
	Mon,  3 Jun 2024 10:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KMcLgdw8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEB410E1E8
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 10:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717411769; x=1748947769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/NxzI60V3uN8pbUhFg1Y9mWby/ZyFcLnDyUslOChiGw=;
 b=KMcLgdw8nBbWC+oGCIXeL8Kij2ZZiv12D8dimJ5tJfSrF60iHlSsLrAz
 4p1BWu20h20YGAmkh6+30R9LvxRimjh6wxjpcCWaSLtXE5izKOhMsdh9e
 xUUwaYWBg+GnLW/eqFMhQclN4u2Q+9NmJ/T+dIRlWc2bPhIbD/fImUANW
 N0qtp0PrtIq5AUSH4QYdROMuHt9WvicI2/Pr3IExeIQwy8Vb9reA2oFmM
 ezEcPimmT/yj+t60lkOCv6ANCcxfIIfufTLJQVtloVX7flcUM0CWmAjmv
 qoqnsDZuZA/XC2wu0V/i/4GVpa7vjPwtbbvtk6z0EL2Bwkt2LdKOLwSqt Q==;
X-CSE-ConnectionGUID: zm8BNV9CR1umdyCnA7HPSg==
X-CSE-MsgGUID: oSFYkHHhRAeUFTvNqs4kzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13645865"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="13645865"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 03:49:29 -0700
X-CSE-ConnectionGUID: qdSS2hfxRsW0JGOBkqa/4A==
X-CSE-MsgGUID: mAinIB8wQ2uiJFBPqgrPnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="36827131"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa008.fm.intel.com with ESMTP; 03 Jun 2024 03:49:27 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V4 1/2] drm/xe/xe2lpm: Add permanent Wa_14020756599
Date: Mon,  3 Jun 2024 16:19:50 +0530
Message-Id: <20240603104951.705603-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240603104951.705603-1-tejas.upadhyay@intel.com>
References: <20240603104951.705603-1-tejas.upadhyay@intel.com>
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

For xe2_lpm Wa_14020756599 is applied to all steppings and
when RCS is present on graphics GT.

V5(MattR):
  - Add more comments about new API
V4:
  - Make it part of lrc wa
  - Check for RCS as rtp rule
V3(MattR):
  - Rename rtp api name
  - Use MEDIA_VERx100
V2:
  - Remove engine filter video decode
  - Fix typo GRAPHICS/MEDIA/s - Himal

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c |  6 ++++++
 drivers/gpu/drm/xe/xe_rtp.h | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_wa.c  |  7 +++++++
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index fb44cc7521d8..01c32a932780 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -323,3 +323,9 @@ bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
 
 	return dss >= dss_per_gslice;
 }
+
+bool xe_rtp_match_when_media2000(const struct xe_gt *gt,
+				 const struct xe_hw_engine *hwe)
+{
+	return (gt_to_xe(gt))->info.media_verx100 == 2000;
+}
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 337b1ef1959c..a32645f5f80b 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -427,4 +427,18 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
 bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
 					 const struct xe_hw_engine *hwe);
 
+/*
+ * xe_rtp_match_when_media2000 - Match when media GT version 2000
+ *
+ * @gt: GT structure
+ * @hwe: Engine instance
+ *
+ * Its one of the case where we need to apply workaround on primary GT
+ * based on if media GT version 2000 is present. Thus this API will help
+ * us to match media version 2000.
+ *
+ * Returns: true if media GT version 2000, false otherwise.
+ */
+bool xe_rtp_match_when_media2000(const struct xe_gt *gt,
+				 const struct xe_hw_engine *hwe);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 64bc595fc727..321ea100a491 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -701,6 +701,13 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 			     DIS_AUTOSTRIP))
 	},
 
+	/* Xe2_LPM */
+
+	{ XE_RTP_NAME("14020756599"),
+	  XE_RTP_RULES(ENGINE_CLASS(RENDER), FUNC(xe_rtp_match_when_media2000)),
+	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
+	},
+
 	{}
 };
 
-- 
2.25.1

