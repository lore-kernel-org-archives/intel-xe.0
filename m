Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D65CEF99E5
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC3A10E849;
	Fri, 13 Feb 2026 22:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMLA4K6A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECCE10E844
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021958; x=1802557958;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=m4emvqoGcRQLkhpe1OFJ8ldoYQhFv8cqSiEJlKHqaqE=;
 b=iMLA4K6AYDJDzpqgOqg9zIYNTzRjWMyjzFKuOeoJGVy6fJ1fgKVijjwd
 NlNoA4M0R+eAgFr9x1Z/d82Wm5r8F9p9QaQmVUPfjPZ2Fmq+5fZHugYJ2
 RZ+E2RHNgAUWw/s3O28uv3RK/uyh4HGgAKv4eRCox7UmsnFrAoJb8/fWl
 hDHkohrgp/rBaVPlG7Xxv3u56PS9xGTgzGt5Mal9po+ag5jd++L6tEQMs
 lpLSCUNgni0DEsSkWg43W/rdXR/pDe0V0RcryL6Np+4kfKaA/YofUzPgG
 QjSmUeFlONswvXe44V1972p3kLIliLO8ygzE8e+X5d24SFj4ujVBckwiU Q==;
X-CSE-ConnectionGUID: Wb7JqgR0Tjuj/3w0ePVQbQ==
X-CSE-MsgGUID: bKToAx9mQ++E0IxMFJFbYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654438"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654438"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:37 -0800
X-CSE-ConnectionGUID: 7pvxQqGEQKeTc/lxwMbDSg==
X-CSE-MsgGUID: S+/WRJrmSgyknAJG8KkHAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705650"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:45 -0800
Subject: [PATCH 10/22] drm/xe: Consolidate workaround entries for
 Wa_14020338487
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-10-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2049;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=m4emvqoGcRQLkhpe1OFJ8ldoYQhFv8cqSiEJlKHqaqE=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aCtcg0d6QZeWqtLM6GT1+3dN4S5bRAzysme
 hapoYPiPVWJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mggAKCRBNeSQFyHKQ
 BN/FD/91TCzL9PfgfRpugBg9801nFxvr7u26c6T7B/VhCeEfJK2mYBKf1LYPhBdgxUL5p29jWKo
 S9tVIfi7zzW5bUbfqJPhOdiqgDDDyzH4gh3gxORpUMGJtho1PLX64RuIxSecu4+g6Bbv77hgxIY
 Jjagi4wBhx1Ce+fmPXKJjO6cdAXw8qLtqSldWXOLcDUmF8ZeOcvbFIbD6aVs4Y3inGCizu4Tvu7
 acmDWHtty9y98icmdGinH/FeF9BxnwKFejmA1wNaR6c0zkNq/bbu9+sdPo6gdUIGuk8vbNEDrrJ
 PogPN2fF6Wj9bwp6kXj3mt6oTjfjNd790m+k2lGG+uS2yWM4Qeax+6srCcDBfiKoWsMTNpqpS0G
 98SdeYYr1cZHAfA2kQN8wSqvvzyCD6aoWD6H87WxHbEMh38c5ufT6TiPxv6797G2yd/+yox7wje
 JJ0WeNRlvML4wL5a4ImMmRRd/JR+10vX+elcTeTAzFBoxnV+BzB4Kqk7Y1xT+SSBVjphCdCR2me
 WIT7PByZIk91SkgJb8tY+VlHh0F6BdfCGd9le3Fl0oTDhHRIIkj9GNHVovi4GvbGWFTzFQAjPZi
 6j6z1vTmWeap2qVwqE0dZLCBvl3wO1gHhrcdBf6Cxxr9EGbyg39k7Vxo7A1RQRirfEf7eXbTyaw
 ChK8TmMj33+gwYA==
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
index 4a7e129f6e603c1fa60fa883c6a6e6c8dbee818e..370edba9e3747d63d3b0c76a09b5ee64da66481c 100644
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
@@ -538,11 +539,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
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

