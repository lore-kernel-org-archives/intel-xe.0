Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBBFCD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 15:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670EF10FFB9;
	Wed,  3 Jun 2026 15:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nEJ7oaf2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E3310FFB9;
 Wed,  3 Jun 2026 15:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780499707; x=1812035707;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wPP1PiOsRnEx1r+SATxcHu0wagj4q7iy7xKiFS9+VD4=;
 b=nEJ7oaf2tMewLeU9I7tvY2zYEKY4xiUbMDevHcmGmfXtQQXDF3kGEzEw
 4lb9E6q/tXyjUwRWoaJT/B9WiHky6ASLhqj8FO+YQPuDB24A9aljxXNTX
 s6IIpwPi3C9c6zWUy6kKAIJPc95lgu/mE/H7LVMt0J/maWd0qOWaM0CQ1
 Bz27pY+XA4eQsR1Unpd8865Yy3hCveA1FXfL7+sF11PSRDaHvdmcd6uS0
 D7jtbpwA9qMbeQf+jCbzk514+R4bwDvu14ZtKhaqB6o833AvpuQW8avIs
 frDyigMvm6SHj+oePKET7YUsDJ30AIcGaXBY4JmqJDmWMTwlE1mFiX6aN g==;
X-CSE-ConnectionGUID: /46XJ3OITvmw7T4/QorXag==
X-CSE-MsgGUID: dQLPh+LuS8Ch8bPvqbINaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="91997091"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="91997091"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:15:07 -0700
X-CSE-ConnectionGUID: FQfkk6EvRGK8J+/wINBVvQ==
X-CSE-MsgGUID: EyZEAkTAQ46e9cChMHZ6BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="274509655"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.189])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:15:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 6/8] drm/i915/color: join loops in
 xelpd_program_plane_post_csc_lut()
Date: Wed,  3 Jun 2026 18:14:33 +0300
Message-ID: <011336e9d57bba57e15d1aa64ae53a20c461ed62.1780499355.git.jani.nikula@intel.com>
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
lut_size; there's three more entries after the first 32.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 26 ++++++++--------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 48f09c73e513..5c09c5dd361e 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4024,35 +4024,27 @@ xelpd_program_plane_post_csc_lut(struct intel_dsb *dsb,
 	intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0),
 			   PLANE_PAL_PREC_AUTO_INCREMENT);
 	if (post_csc_lut) {
-		for (i = 0; i < lut_size; i++) {
-			lut_val = drm_color_lut32_extract(post_csc_lut[i].green, 24);
+		for (i = 0; i < lut_size + 3; i++) {
+			if (i < lut_size)
+				lut_val = drm_color_lut32_extract(post_csc_lut[i].green, 24);
+			/* else clamp to the last LUT value to prevent step discontinuity */
 
 			intel_de_write_dsb(display, dsb,
 					   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
 					   lut_val);
 		}
-
-		/* Segment 2 - clamp to the last LUT value to prevent step discontinuity */
-		do {
-			intel_de_write_dsb(display, dsb,
-					   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-					   lut_val);
-		} while (i++ < 34);
 	} else {
 		/*TODO: Add for segment 0 */
-		for (i = 0; i < lut_size; i++) {
-			lut_val = (i * ((1 << 24) - 1)) / (lut_size - 1);
+		for (i = 0; i < lut_size + 3; i++) {
+			if (i < lut_size)
+				lut_val = (i * ((1 << 24) - 1)) / (lut_size - 1);
+			else
+				lut_val = 1 << 24;
 
 			intel_de_write_dsb(display, dsb,
 					   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
 					   lut_val);
 		}
-
-		do {
-			intel_de_write_dsb(display, dsb,
-					   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-					   1 << 24);
-		} while (i++ < 34);
 	}
 
 	intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
-- 
2.47.3

