Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE079C5AD69
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E7010E839;
	Fri, 20 Feb 2026 17:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HcoieXow";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46E210E81C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608497; x=1803144497;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=QaBKBss8eqaGszHAlg2ZwCpK0J7MED7VLSA3mYR4fTc=;
 b=HcoieXowiTeEvkQEOIaCNWmlgU4vKeP9WKf3ChB6Js56/NIfDKfOLNoY
 fbjRonMeH5WQCowzVfxILg1ybQ5quKIaq1JsnvlHZB26LfnoH25AE4bpJ
 C46rxXa3MhqV5Ecz+5xRGYop/74d8EAk286Z39nllJ5xfK6Meh1hSGGZe
 r27atknBgoRYQtTqw2QiJIqmsw0ltglo9fCot3GHVhDk+YebPkfzo9XlG
 UVjMbLD4OVR5qUYV21PAFxVzjX5Yz6GEdr4hTOo7k1fOoAiq7MX6iURRE
 4nGCpsKALW8XtRxK+tSZo9tABgGQLiIQDae3PWDCzFZ28ExbTxWYIyGUl w==;
X-CSE-ConnectionGUID: ZQhKVyQITBaM2Vf+WjjGLA==
X-CSE-MsgGUID: MB+fCQB+SNedFh43U80gYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606738"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606738"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
X-CSE-ConnectionGUID: EyLCKD02T4+y69uH7yPxhQ==
X-CSE-MsgGUID: MSKMe09MR2y6/gAfhwtEFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138698"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:32 -0800
Subject: [PATCH v2 10/23] drm/xe: Consolidate workaround entries for
 Wa_14020338487
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-10-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2049;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=QaBKBss8eqaGszHAlg2ZwCpK0J7MED7VLSA3mYR4fTc=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJmtCuOhV7lj6OX4fnSFScEf/IgQ9eC0zQcnn
 bkZrUBojkuJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrQAKCRBNeSQFyHKQ
 BHgjD/9HhKxrRu8dSCVE+z/N3k1Dsz1LPtU7iGAYi7Zs0m3Djdo7bT4ORbROtaj3IHlfkJHkjGY
 PTgqUHbnx1xTE75MJVcLHm3y0TpobJV0eaCHWlOkpop+quSU+WvRJmjSJFhZckq0upX3fdynR6v
 q/0YCSUpPyM5OEQ6eFWzXk6L/DpAm27zNjw/79iW6K5ai1FclPQcl5HqZfCmio31phri1f491yw
 E4M0ow2nAb3jaiq5WEDU9YBs811UIe5XOGEvU8WpFDWn4oOiL6OX7LVTNB5wRLSDAp+8WaoRwov
 /sRw4IgjeWNJ/TNJGfSmFrshbQSD3rDwyKCTAxLbWOVLUc1GWMENFJWQtt1mfFOD9568QMf/f+w
 qxBM/P9dl5n6YGNU8yih5+CAIkZOqBtPBFpAilEHoObfLGA0OFOLjLYwDJ20FJZc1iomw7WmMW/
 5hkmfy3yu9XQ9tz/44uuvmXDVRAsfumX/fUsnDMQE4nTsiQeDqm9YaJtRDEF2UljME2He1iNMPw
 kuFnlaLWRD5PhhK+zy9cCBNmsFzI7E9ODfpH3vXkPojRhD2oQrQ7VU2HuMk+OGiqNZDc4TiA44q
 BSl3ekfTHdg1m7ZyrHDvNGHftn6XmWod6LEjvD+sTKKK0FeCMnDBDgKcbtgppYf/oLPQhVdLOW1
 ovySdao3CA82mlQ==
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

Wa_14020338487 applies to all graphics versions from 20.01 through 20.04
(inclusive).  Consolidate the two RTP entries into a single range-based
entry.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index f99f1fbe3aee016d8a8aa19d62f6fd503e6e19f2..4809166ba8ec69fc913fe2ca0103fe54e345dd14 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -353,6 +353,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
 	},
+	{ XE_RTP_NAME("14020338487"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
+	},
 
 	/* TGL */
 
@@ -490,10 +495,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 
 	/* Xe2_LPG */
 
-	{ XE_RTP_NAME("14020338487"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
-	},
 	{ XE_RTP_NAME("18034896535, 16021540221"), /* 16021540221: GRAPHICS_STEP(A0, B0) */
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
@@ -544,11 +545,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
 	},
-	{ XE_RTP_NAME("14020338487"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
-	},
 	{ XE_RTP_NAME("14018471104"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
 		       FUNC(xe_rtp_match_first_render_or_compute)),

-- 
2.53.0

