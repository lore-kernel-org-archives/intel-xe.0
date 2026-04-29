Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DC4FF8877
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 10:25:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8954210EB08;
	Wed, 29 Apr 2026 10:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ff9PRgd2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8849410EF46;
 Wed, 29 Apr 2026 10:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777458314; x=1808994314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f+mZmF+poPJ9JY7k7jDGbI/suk7+gBb6KlngWf4L0DI=;
 b=ff9PRgd2mX0InECDRRGfvDxz67f09AV0JVom3HTgWAc3OsWlKFmOfDnb
 59x1Ly9yPMRw8Tfx0IYRlCxSt5Qu/n2j/z40b8Zzp7vD14XyVZXB9RyM8
 gU0hsT6InLaqFVSWKGx8zAuHnw9GayYHjoXiv7Z0TUCAQ4mXqRVcyZIJz
 VRjwEhgWeBRf+jqJGvfI7FXHI3fHc2c8R5bbRyO53Q6GF5Jw9C7nKwW2F
 yyswT29o5wPiWBmujYt/JTTFbc5myL6RrBAyqqi25momg9JDRn5ckn1tt
 io9Ph3ghaZT0FASOIvNfERSeKZGK3qSpCW8hZyfdlvhJnXn70KkYp6kFn A==;
X-CSE-ConnectionGUID: WwiHN+mZSQGihc9bPU3Iyg==
X-CSE-MsgGUID: w0z1bZKWRz2IiLfJPRe1TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="89078494"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="89078494"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 03:25:13 -0700
X-CSE-ConnectionGUID: 3b0KTfcnSX+4c5InBvVUqA==
X-CSE-MsgGUID: vzQ4fVpaQca9KJ2c99mr9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="238554367"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.175])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 03:25:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 03/15] drm/i915/display: move fdi funcs under fdi sub-struct
Date: Wed, 29 Apr 2026 13:24:43 +0300
Message-ID: <26cc1fc32212c5db532aefb16bcb8626d409d79a.1777458161.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777458161.git.jani.nikula@intel.com>
References: <cover.1777458161.git.jani.nikula@intel.com>
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

Move fdi related functions under fdi sub-struct of struct intel_display.

The funcs sub-struct of struct intel_display seems unnecessary. Instead
of display->funcs.FEATURE, prefer display->FEATURE.funcs.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_core.h | 6 +++---
 drivers/gpu/drm/i915/display/intel_fdi.c          | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index db07e332af5a..0fdda5339e81 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -316,9 +316,6 @@ struct intel_display {
 
 		/* pm display functions */
 		const struct intel_wm_funcs *wm;
-
-		/* fdi display functions */
-		const struct intel_fdi_funcs *fdi;
 	} funcs;
 
 	struct {
@@ -418,6 +415,9 @@ struct intel_display {
 	} fbdev;
 
 	struct {
+		/* internal fdi functions */
+		const struct intel_fdi_funcs *funcs;
+
 		unsigned int pll_freq;
 		u32 rx_config;
 	} fdi;
diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i915/display/intel_fdi.c
index 917f020650af..f5094655a63b 100644
--- a/drivers/gpu/drm/i915/display/intel_fdi.c
+++ b/drivers/gpu/drm/i915/display/intel_fdi.c
@@ -123,7 +123,7 @@ void intel_fdi_link_train(struct intel_crtc *crtc,
 {
 	struct intel_display *display = to_intel_display(crtc);
 
-	display->funcs.fdi->fdi_link_train(crtc, crtc_state);
+	display->fdi.funcs->fdi_link_train(crtc, crtc_state);
 }
 
 /**
@@ -1109,11 +1109,11 @@ void
 intel_fdi_init_hook(struct intel_display *display)
 {
 	if (display->platform.ironlake) {
-		display->funcs.fdi = &ilk_funcs;
+		display->fdi.funcs = &ilk_funcs;
 	} else if (display->platform.sandybridge) {
-		display->funcs.fdi = &gen6_funcs;
+		display->fdi.funcs = &gen6_funcs;
 	} else if (display->platform.ivybridge) {
 		/* FIXME: detect B0+ stepping and use auto training */
-		display->funcs.fdi = &ivb_funcs;
+		display->fdi.funcs = &ivb_funcs;
 	}
 }
-- 
2.47.3

