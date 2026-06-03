Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D74CD6E57
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 15:15:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B0B10FFC5;
	Wed,  3 Jun 2026 15:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CQIMhmS5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC5B10FFC2;
 Wed,  3 Jun 2026 15:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780499702; x=1812035702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iX+dJuZGdc4DHv7UdPJUXLpQlOjTsSgdsArACdh2EWo=;
 b=CQIMhmS5GqLt+p7hVkygvtwsdc8P6P9YM0H+qPV1wQmb+dUToHBev+yO
 Jg5JZugAxVoiYiDkqrfu5SitNtj0jr1/3nKBs9jH0hYX9Ray6+cY4eEds
 hcpHbxbbq0TalMX5So4sSM57G5RiNdBdMjjW/pE/1CeP1q+HZcdDg3ErX
 o6K1e0lGI3uWwOQANaj2y4EgVGseo3zh8QRi8lyo8+ioSrvm7hS7SBF5f
 04slNixod/t76AV9j0O/0l+LfkmZXRqP0LGq6b5xZmIRccYb8R0UxVvIe
 lEqNlFcRF6sH1UVfIcPSaYnCKi7FXv4wouA3dTINT0ikZXAIhMhpbsGk2 A==;
X-CSE-ConnectionGUID: XkpSHxdfTJKbqI4nXBp8Rw==
X-CSE-MsgGUID: d91NMQjPQTOiJB+ozXMOIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="92421189"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="92421189"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:15:02 -0700
X-CSE-ConnectionGUID: BMx9xj8KRbKVwZz5oTR09Q==
X-CSE-MsgGUID: QJ6aqJc7RtONgWCT/ekPuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="244380881"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.189])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:15:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 5/8] drm/i915/color: join loops in
 xelpd_program_plane_pre_csc_lut()
Date: Wed,  3 Jun 2026 18:14:32 +0300
Message-ID: <6d4f8bb713a998c199606c079bed924458f04f54.1780499355.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780499355.git.jani.nikula@intel.com>
References: <cover.1780499355.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Use single for loops instead of two. Especially switching from a
for-loop to a do-while-loop with the same loop index is confusing, and
it's hard to figure out the end index. Define the end in terms of
lut_size; there's three more entries after the first 128.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 27 ++++++++--------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 5209a4cdd14d..48f09c73e513 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3978,35 +3978,26 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 			   PLANE_PAL_PREC_AUTO_INCREMENT);
 
 	if (pre_csc_lut) {
-		for (i = 0; i < lut_size; i++) {
-			lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
+		for (i = 0; i < lut_size + 3; i++) {
+			if (i < lut_size)
+				lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
+			/* else duplicate last lut_val */
 
 			intel_de_write_dsb(display, dsb,
 					   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
 					   lut_val);
 		}
-
-		/* Program the max register to clamp values > 1.0. */
-		/* TODO: Restrict to 0x7ffffff */
-		do {
-			intel_de_write_dsb(display, dsb,
-					   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-					   lut_val);
-		} while (i++ < 130);
 	} else {
-		for (i = 0; i < lut_size; i++) {
-			lut_val = (i * ((1 << 24) - 1)) / (lut_size - 1);
+		for (i = 0; i < lut_size + 3; i++) {
+			if (i < lut_size)
+				lut_val = (i * ((1 << 24) - 1)) / (lut_size - 1);
+			else
+				lut_val = 1 << 24;
 
 			intel_de_write_dsb(display, dsb,
 					   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
 					   lut_val);
 		}
-
-		do {
-			intel_de_write_dsb(display, dsb,
-					   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-					   1 << 24);
-		} while (i++ < 130);
 	}
 
 	intel_de_write_dsb(display, dsb, PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
-- 
2.47.3

