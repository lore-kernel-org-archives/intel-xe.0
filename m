Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C03ECD9AA
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 22:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CC810E135;
	Thu,  5 Feb 2026 22:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mh0b2kTP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C332210E135
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 22:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770329113; x=1801865113;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9Fl4/opRt8kVS8zR7mB5LNT/GUCtL/kWCx7etzB7FUk=;
 b=Mh0b2kTPSfeyY61OjkhbMs1GGDLsIDeMuWbR8+dKvTNg9tEeDvbeOPL8
 4Q21CziozrT6nDhbgcQebhzRvqgeC5pU+pq/MQOFBAzbXxhDSspbfRPuQ
 zsILTNd/X+IFTzciyjgZpNn1jxA2vd4cf2gabyTy3kSNIbLI4t0D61d2x
 2SIgy8CDpG2NbXYaEhMdgw0u0GdNQY2DSIx1Jo5hLBq628+haB5fpC82T
 a3HW17PckSILUZ4abDbkJhY+3oS98Au7oFW93GHy+Z6002ejJk7ZmB89/
 zjeTAJU8G22Qk7WWFVlU/KBpXMlR4gY/ASeIltVc8SMD6c2kNxsoQgdoc Q==;
X-CSE-ConnectionGUID: nSWa4DSIRb6hfBEWCL7nzQ==
X-CSE-MsgGUID: B2k6QnCETA2vWi3b7yWSSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="75395693"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="75395693"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 14:05:12 -0800
X-CSE-ConnectionGUID: +bwGnCbIRaaoj671Ek+UKw==
X-CSE-MsgGUID: wzz18jiVS4+spyXSJan2kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210563595"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 14:05:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/xe2_hpg: Fix handling of Wa_14019988906 &
 Wa_14019877138
Date: Thu,  5 Feb 2026 14:05:09 -0800
Message-ID: <20260205220508.51905-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
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

The PSS_CHICKEN register has been part of the RCS engine's LRC since it
was first introduced in Xe_LP.  That means that any workarounds that
adjust its value (such as Wa_14019988906 and Wa_14019877138) need to be
implemented in the lrc_was[] table so that they become part of the
default LRC from which all subsequent LRCs are copied.  Although these
workarounds were implemented correctly on most platforms, they were
incorrectly placed on the engine_was[] table for Xe2_HPG.

Move the workarounds to the proper lrc_was[] table and switch the
'xe_rtp_match_first_render_or_compute' rule to specifically match the
RCS since that's the engine whose LRC manages the register.

Bspec: 65182
Fixes: 7f3ee7d88058 ("drm/xe/xe2hpg: Add initial GT workarounds")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 1e8d61ac581b..d37edc62b6a6 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -567,16 +567,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
 	},
-	{ XE_RTP_NAME("14019988906"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
-	},
-	{ XE_RTP_NAME("14019877138"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
-	},
 	{ XE_RTP_NAME("14020338487"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
@@ -852,6 +842,14 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
 	},
+	{ XE_RTP_NAME("14019988906"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
+	},
+	{ XE_RTP_NAME("14019877138"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
+	},
 	{ XE_RTP_NAME("14021490052"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(FF_MODE,
-- 
2.52.0

