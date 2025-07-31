Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E3DC87FCC
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 15:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBB010E289;
	Thu, 31 Jul 2025 15:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4Skl6Mq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49ADE10E289
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 15:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753975771; x=1785511771;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gflAC+vdaFvHs89137G2K8BsNQmjYgo5gg9pNk1c3Uk=;
 b=K4Skl6Mq8aiufWB0p3wm26smIT27O69inurF2q37I3TCMU3KD90Di4x/
 0txx9QWjFreETJCXcBVp0K0zz7GWR5080Hwy0g0deJWIlbADqN//l3N2O
 ovMmDtkcYcYjGNyJQRaVlYiAifRAxIcPkZWuQwPobViZuzVjtMidVwZ66
 gDkrBnHfGVkNUHe40ZqpCGizjw0BbEdS78xCp6nKCW6ZBDuItXiHVhXhN
 PUKQvJGgSrvPCPzmWUOFtshwIYIswG3QpWoj4ZaKTAj5z82KR9jqFchdE
 ubx2zeWcKg55H4TtDYIO2Hgt/ehw9uKHCZ5wHTWbhnRA4VQk9fbZYj+Sa g==;
X-CSE-ConnectionGUID: dOUFQ9XsT0OEGW7T9GGVTA==
X-CSE-MsgGUID: lHavYnuwTfGAGF7PYCibqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67748539"
X-IronPort-AV: E=Sophos;i="6.17,254,1747724400"; d="scan'208";a="67748539"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 08:29:31 -0700
X-CSE-ConnectionGUID: lYS1IiHBTo+Bq0TmN3/Zpg==
X-CSE-MsgGUID: bgWqmrVWTjy9zrUhGqx4Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,254,1747724400"; d="scan'208";a="186974472"
Received: from dut4086lnl.fm.intel.com ([10.105.10.26])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 08:29:31 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 tilak.tirumalesh.tangudu@intel.com, matthew.d.roper@intel.com
Subject: [PATCH] drm/xe: Extend wa_13012615864 to additional Xe2 and Xe3
 platforms
Date: Thu, 31 Jul 2025 15:29:31 +0000
Message-ID: <20250731152930.67059-2-jonathan.cavitt@intel.com>
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

v2: Correct code placement (Matt R)

Extend WA 13012615864 to Graphics Versions 20.01,20.02,20.04
and 30.03 .

Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 22a98600fd8f..535067e7fb0c 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -538,6 +538,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
 	},
+	{ XE_RTP_NAME("13012615864"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
+	},
 
 	/* Xe2_HPG */
 
@@ -602,6 +607,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
 	},
+	{ XE_RTP_NAME("13012615864"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
+	},
 
 	/* Xe2_LPM */
 
@@ -647,7 +657,8 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE))
 	},
 	{ XE_RTP_NAME("13012615864"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), OR,
+		       GRAPHICS_VERSION(3003),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
 	},
-- 
2.43.0

