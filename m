Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E183C5AD2B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2102910E81F;
	Fri, 20 Feb 2026 17:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BAIRrnE1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E8710E82B
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608498; x=1803144498;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=g5mORvmzV9PKPQwA1aNYpq37VAM6DSCnTcqNRI7MMtU=;
 b=BAIRrnE1KQ7BVAJK+0Cn4awwBUQ3Jky7PyTaooubqF2w0weNnD6qsKav
 WsSa2oCs0FThIytYsoLmVtogMDZZ+sOVUVCk0k6Brfb45Zp5mMJbB9h3+
 uxa5JxGhcbK17DxYFnb6DfJI2YlZtM26hROV1dbQkwVZnseRegK47xVlX
 sh7aeZCG+aN/niU5evDj0HIZRImWCFabE7ZGR91RvjumlODzpq0AfKGSh
 DSTzhvm/KPpFK4yB2Dju42TzczhYeTAOOs7St7u7eT47S6DefM1J4VPCG
 McTYwUE9T2IcOzBdTzA2X0YcpniJ/frbDLXZ0jaXcp72fOaZWu2P00X7j w==;
X-CSE-ConnectionGUID: oK1SecCsRuSB7gABbpshaA==
X-CSE-MsgGUID: qNPzZQbNQ8eJrwtKTIW0jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606750"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606750"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
X-CSE-ConnectionGUID: T2BSA41CTPqj1LceDv4IKg==
X-CSE-MsgGUID: nbT4v9xhRI+NO5VcoGGcfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138732"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:18 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:42 -0800
Subject: [PATCH v2 20/23] drm/xe: Consolidate workaround entries for
 Wa_15016589081
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-20-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1904;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=g5mORvmzV9PKPQwA1aNYpq37VAM6DSCnTcqNRI7MMtU=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJmvBz0bs9Zy1oRa/WkHHJl7oBkmeDAlj3ngE
 eVw+H/B2XiJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrwAKCRBNeSQFyHKQ
 BAo/EACx+eesVp3EIJXMglBJCrT/NGronMB1CAZYXPACOiTTqKxZbkKxaMcePZEwWY23qeRU+Wp
 N4FefnZ6Q9/Qe0vJ1Ru39NTqnoVlnHMg05cr/gDvdgUiKw2ZlCy+2SVaZ3JTcNmcdMp+TUwNmn/
 0BVNC7VhyKHsk3AlryM4Udepkp374D8gA84jVgQ/yeqNL2qazQ8EPfkspi2nsifhMEVhMMcpMi6
 x0NAs1YIIAvmCrX3XqsACRtYYTYAc73xkJr++qeiLR+5JFhKfHkU4V1zw2zCiE9mNqESX0Zg32a
 3++XNqQpTcmIAr5dwt/jUH+oTkWGDvLdzF9F8Gnv43w0cAxjpzsCkN5tPu8wzrSTOpcUqv6AAQm
 pX8JyqrL0k+z8IBB27CFB5V1AG/FFkT2MN4VgBcc5izVv/bRcRkXdMLkf0DYfydNv50bjb5iLx0
 zlU03pWc0I4c9n1ct9n5amXIj1S3LOPJnEQZkh/xmO3RbZ0ikJfn+Kp03JAhA+C4wH/BN1Dz7xG
 GlnZTZaU+BcCfV74/jadq2JGb6UwwcC0DcIGrhEczt5JjfUtZjfzFjJAbCwTTxYdFH2BEB3B14x
 PGGOhIGFxN8fx+gHijAFh5D9UgI8K+MOHa7y2Rbx2jW9QpfK3UbDWJMtHAF+XmpUnDYpAsB8M8Y
 gfsGmeTMSyjLxdA==
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
index 5aa404c0cbfbc8d11c93d820b1a192ab4776def8..fa5dce4ead48bae424a49c62142683dbf1971376 100644
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

