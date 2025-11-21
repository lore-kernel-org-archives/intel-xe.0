Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE678CFC509
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 21:59:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9776810E90F;
	Fri, 21 Nov 2025 21:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lJlNLy3Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBDA10E90F
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 21:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763762364; x=1795298364;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CtEW8OXle47g2puwDwzVigr5DhOBxYEeCOTVIy5RmE0=;
 b=lJlNLy3QzOXOG2TDDsVdhZE2fXQVQsR2QidtC19hKhCGp7H10ni4xiIu
 e1BrdX5t/mLC8Qpt5M9JBVQWXUP3CTRCKhzacBtc2B92N+2s4hBbHFdhB
 esA1LaJwKtsEJ2CyqSdiCCDRIOdOOhtErS6Wle9T0nZhSuKILTu76lqVA
 GWq7WWOjwV6/a18tNY5nz1jM5mD0lVG/4G3P86OzchsPscMd0pirkokz+
 cgRxajpmvIQ2/VSi+ROQ3iSU5bPNE6vEx5f5cor/znIz0TtsBLEmmLDL6
 3fr/+2DJnI7NG1+SvtF02KMyfVgw6n+L1gbNX0iV8FegHlaThPExk4OPz A==;
X-CSE-ConnectionGUID: ibkC2dEOTO+QLlb94qYVLg==
X-CSE-MsgGUID: DHayp5pgQcOHdesq3/HD1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="76474671"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="76474671"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 13:59:24 -0800
X-CSE-ConnectionGUID: T1SmYvuaTcCbW1D350YRLw==
X-CSE-MsgGUID: PYt87ju0QXOvAdPXV6pUUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="192263145"
Received: from hchegond-desk.jf.intel.com ([10.88.27.198])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 13:59:24 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 1/1] drm/xe/xe3: Remove graphics IP 30.01 from Wa_18041344222
 IP list
Date: Fri, 21 Nov 2025 13:59:17 -0800
Message-ID: <280ab3e8dce8d7a40540ae634a5432694ac17ab0.1763762330.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.43.0
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

As per the updated WA database, Wa_18041344222 no longer applies to
graphics IP version 30.01. Remove it.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 3764abca3d4f..237d96d6e275 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -701,7 +701,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
 	},
 	{ XE_RTP_NAME("18041344222"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3000),
 		       FUNC(xe_rtp_match_first_render_or_compute),
 		       FUNC(xe_rtp_match_not_sriov_vf),
 		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
-- 
2.43.0

