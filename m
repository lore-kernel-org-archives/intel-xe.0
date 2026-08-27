Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FB3C61DC6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 12:35:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2C010EFD6;
	Thu, 27 Aug 2026 12:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4tdxksh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651E810EFE0;
 Thu, 27 Aug 2026 12:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787834113; x=1819370113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i7LFohJiZx0MWeushdLCnj8rOR1zoaqPfHXn4qNgQAU=;
 b=f4tdxkshkeZiefYfPRPK1BtgHP08tPQi4WiWLpQ8cqzcVdHUQwkwEpl0
 Je/I2oie8K+LNHMRbsUJP8VXliHXiVa/3mK/vAgg0xXGdkxtDmPZcOk3L
 G620U9Z2F0Jgen1vbt3Z0O4Kpcn/AVU2cpVJQ1OuCkIpYPxR5CsanKAUp
 JcOUUXMZzA2EoC20wE97x0S46OXJSKJWrL/xV5ARP5giCfbKy1yjW3vY3
 h5BUoHIwyUrXn0juhG3o7gIdfQoplS4bnMd6MbRjWG3/Ggi2RUS/x0piy
 BbkbOpM2vXIGUL8oBKlHtiyQaZgGmYTpI3hQem9EHEd7wf8CRuVTSWELS Q==;
X-CSE-ConnectionGUID: Bb+jxpy1TfumcHQBOzFmkQ==
X-CSE-MsgGUID: Fg3KrHlPScuRU/ahnF9yEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="92191769"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="92191769"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:35:13 -0700
X-CSE-ConnectionGUID: S/16/DPRTZydp9K5QShA7Q==
X-CSE-MsgGUID: 7cShUJCcRhKRbYmSHewkpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="269809914"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.219])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:35:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, Maarten Lankhorst <maarten.lankhorst@intel.com>
Subject: [PATCH v2 2/7] drm/i915/reset: make intel_display_reset_supported()
 static
Date: Thu, 27 Aug 2026 15:34:52 +0300
Message-ID: <b8a20403c76d23b54dfc7a2b3dcc338296dc955f.1787833879.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787833879.git.jani.nikula@intel.com>
References: <cover.1787833879.git.jani.nikula@intel.com>
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

intel_display_reset_supported() is included in
intel_display_reset_needed_after_gpu_reset(), so there's really no need
to call both in intel_gt_reset_global(). Simplify, and make
intel_display_reset_supported() static.

Note: For now, keep using intel_gt_gpu_reset_clobbers_display() in most
places, although it's just a thin wrapper around
intel_display_reset_needed_after_gpu_reset().

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_reset.c | 2 +-
 drivers/gpu/drm/i915/display/intel_display_reset.h | 1 -
 drivers/gpu/drm/i915/gt/intel_reset.c              | 3 +--
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_reset.c b/drivers/gpu/drm/i915/display/intel_display_reset.c
index 6ec1af1c8431..323ca0e5e74f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reset.c
+++ b/drivers/gpu/drm/i915/display/intel_display_reset.c
@@ -18,7 +18,7 @@
 #include "intel_hotplug.h"
 #include "intel_pps.h"
 
-bool intel_display_reset_supported(struct intel_display *display)
+static bool intel_display_reset_supported(struct intel_display *display)
 {
 	return display && HAS_DISPLAY(display);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display_reset.h b/drivers/gpu/drm/i915/display/intel_display_reset.h
index 68312403904e..192ff8065a79 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reset.h
+++ b/drivers/gpu/drm/i915/display/intel_display_reset.h
@@ -10,7 +10,6 @@
 
 struct intel_display;
 
-bool intel_display_reset_supported(struct intel_display *display);
 bool intel_display_reset_needed_after_gpu_reset(struct intel_display *display);
 bool intel_display_reset_test(struct intel_display *display);
 void intel_display_reset_prepare(struct intel_display *display);
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 439635bf94dd..1122354239f9 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1424,8 +1424,7 @@ static void intel_gt_reset_global(struct intel_gt *gt,
 		bool reset_display;
 
 		need_display_reset =
-			intel_display_reset_supported(display) &&
-			intel_gt_gpu_reset_clobbers_display(gt) &&
+			intel_display_reset_needed_after_gpu_reset(display) &&
 			intel_has_gpu_reset(gt);
 
 		reset_display =
-- 
2.47.3

