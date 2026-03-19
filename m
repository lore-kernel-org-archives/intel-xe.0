Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258E3108E1F6
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 11:41:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2A610E987;
	Thu, 19 Mar 2026 11:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFGrD4UO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBAC110E985;
 Thu, 19 Mar 2026 11:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773920464; x=1805456464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IXcYOJQul3W/mThwx+3ScbKD0uOf8TNkZocl2sHz14s=;
 b=jFGrD4UOgaJXG1PAMZZjGH8IQFtlL5ZWj+ARV8JUjvlDMEZz6kDn4Q4p
 yThpYral9atopmQKbm8JXpMDfFeqegazdtxDxFHngfI+4W4czqD5GQpjJ
 YWewNxoorp0vd1fDUzBo72as3fIfpS4pNLMKIt27nXdZE7G2RONcLGKG8
 0gWF/N5A2myZmlaA1sHiPGRDpRntQJ2S7hZtXcd2dADMd78Uc/oGXf8sr
 7V4ogM2j8a5dfo+srOZBbGFFvWWjHzv3pD/izwJpd9yzgWqIDdmQv3Pft
 85Mel7i+KnaoW5tMNFFviG0t/AZhAkQ0ZHnCUJL5Sxwsdq9UV1tWfdfBn A==;
X-CSE-ConnectionGUID: BTxmQzOvRzK5ExMqsXUdSw==
X-CSE-MsgGUID: Zz+k25oyQIKobGikUAytBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="78891655"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="78891655"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 04:41:04 -0700
X-CSE-ConnectionGUID: FeghZ5RmQduP8X749ryO+g==
X-CSE-MsgGUID: I57egpOdRTinUNttRcjE8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="222971008"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.169])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 04:41:02 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/9] drm/i915/wm:
 s/skl_print_plane_changes()/skl_print_plane_wm_changes()/
Date: Thu, 19 Mar 2026 13:40:31 +0200
Message-ID: <20260319114034.7093-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260319114034.7093-1-ville.syrjala@linux.intel.com>
References: <20260319114034.7093-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Rename skl_print_plane_changes() to skl_print_plane_wm_changes()
to better reflect what it does.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 8b1b371fbfab..6c8dab847ae2 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -2602,11 +2602,12 @@ static char enast(bool enable)
 }
 
 static noinline_for_stack void
-skl_print_plane_changes(struct intel_display *display,
-			struct intel_plane *plane,
-			const struct skl_plane_wm *old_wm,
-			const struct skl_plane_wm *new_wm)
+skl_print_plane_wm_changes(struct intel_plane *plane,
+			   const struct skl_plane_wm *old_wm,
+			   const struct skl_plane_wm *new_wm)
 {
+	struct intel_display *display = to_intel_display(plane);
+
 	drm_dbg_kms(display->drm,
 		    "[PLANE:%d:%s]   level %cwm0,%cwm1,%cwm2,%cwm3,%cwm4,%cwm5,%cwm6,%cwm7,%ctwm,%cswm,%cstwm"
 		    " -> %cwm0,%cwm1,%cwm2,%cwm3,%cwm4,%cwm5,%cwm6,%cwm7,%ctwm,%cswm,%cstwm\n",
@@ -2738,7 +2739,7 @@ skl_print_wm_changes(struct intel_atomic_state *state)
 			if (skl_plane_wm_equals(display, old_wm, new_wm))
 				continue;
 
-			skl_print_plane_changes(display, plane, old_wm, new_wm);
+			skl_print_plane_wm_changes(plane, old_wm, new_wm);
 		}
 	}
 }
-- 
2.52.0

