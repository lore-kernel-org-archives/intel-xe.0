Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4343EF99EA
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA2110E850;
	Fri, 13 Feb 2026 22:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XjYk4I7I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BB510E845
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021959; x=1802557959;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=R21FgM8PSxUsL5I6JNYVYGf809/GTxmrxlgZTrDanYY=;
 b=XjYk4I7I73sftv1PFI+XhO3eK43j3NFQb2idE1L31sczXq2SO2u0P35u
 J7g0Lm/1g9Y3Dq9hK4yzTUt0ot46sdyQ0qevyc/pOcel1L1Lfs900yeyk
 LLfoqUlQpo0E4qhFJ/qotJf0IHAh0RWVZBdY8tiVtgOPvx6wxXzSKPD6x
 MEW2UllaBsfFW6y8e4RmYR93cmuPSfLpj+3M2896Y6FLSbIw5yRyplSIv
 kMtrejBurmPUyeSqg5dlljd4PeYuGvJpRqqUHvDiLsVkR34qZqovqCVig
 0XT7bmhSteLmKfcX6NjLy541nxAePuHKgAjRgZohVv2YRhDGiL1QRcgrG Q==;
X-CSE-ConnectionGUID: RKQrUgTWSJGFdAiXIEylXw==
X-CSE-MsgGUID: vhJgZkRnSM+yqMb8a+rMrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654448"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654448"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:38 -0800
X-CSE-ConnectionGUID: Z9x/UnK+Sy69zTgj9CM0SQ==
X-CSE-MsgGUID: wX7Ndza7Qc2YU6X1OZavJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705680"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:55 -0800
Subject: [PATCH 20/22] drm/xe: Consolidate workaround entries for
 Wa_15016589081
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-20-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1904;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=R21FgM8PSxUsL5I6JNYVYGf809/GTxmrxlgZTrDanYY=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aDLAd0saaz04Q/GvUI8p79AKeRpSDIeWv5E
 QgN528roteJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mgwAKCRBNeSQFyHKQ
 BDt7D/45FL+MNT+Oq4QIZsqxxn/kxenHkinpslUaLceTKa6bq4EipskqmoUjWgsUsC3aKFGcM8w
 cUiE+yTDTtRxchui6cv0RyjhzZVBGPVBWiXpH5oJ1gq7kBVRJRrXKYfl/g9RqkxYuOanf6gkJcg
 W9qVA3sU+190vOyl3YgW7+7S8wKIol1X9eSUbNjKrtUBuOLFpNrbSikbVCpubClSAbTr6OgHr5k
 B3oF5tkHMs4n9H7IKVmKodPr3Qw0XKUttbh6g+Ebj+40nqYw/z0adTEo9n+3Iu5gzFlHTRqxtHT
 g3cjWmsEdWi2nJR5MRSl0Br1DYgzKjdq619Pe4sNWkebFHufY93VunMqGFUOvAhN5UxSyKg9F0Y
 m5+NsNsERnAL/1MQv/MgEMA4eKRfQRzn+dtSwqXFwj1dC1CBIgTwbo7UNQP4USaaKISE6Td4Qi8
 fTeh8eyM8U540jUwJcMJu1qn518kxdXV6aJWWhL9GBzbFN4trEwLnFHIfdPxV9kqCUpLzUa4FHc
 74ssv6Kx093381+Notf3gh8MQt3jPhAcixk5MUngQYNRYJqNsCjax7Jk2ZYyShThWIlJhG7nGqF
 nMm9LDvLjd1Y2AWO+w7z+eqICmcbVILcGfBI2dbS3T7bLbnwHA5kSTKQHdbpV9Yt0EpZDccqtPh
 /iq4wjAsDlks+VQ==
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

Wa_15016589081 applies to all graphics versions from 20.01 through 20.04
(inclusive).  Consolidate the RTP entries into a single range-based entry.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index d3948e50b011a2721b8388e06cead7f16ecad174..fb123117d1a86082393fc214ee8658eca85d4005 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -653,6 +653,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
 	},
+	{ XE_RTP_NAME("15016589081"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
+	},
 
 	/* DG1 */
 
@@ -728,10 +732,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 			     DIS_PARTIAL_AUTOSTRIP |
 			     DIS_AUTOSTRIP))
 	},
-	{ XE_RTP_NAME("15016589081"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
-	},
 
 	/* Xe2_HPG */
 	{ XE_RTP_NAME("15010599737"),
@@ -751,10 +751,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 			     DIS_PARTIAL_AUTOSTRIP |
 			     DIS_AUTOSTRIP))
 	},
-	{ XE_RTP_NAME("15016589081"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
-	},
 	{ XE_RTP_NAME("22021007897"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))

-- 
2.53.0

