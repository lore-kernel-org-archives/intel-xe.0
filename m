Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827D5CA600F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 22:23:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C7210F816;
	Wed,  7 Oct 2026 22:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TudPSz2v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B269A10F810;
 Wed,  7 Oct 2026 22:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791411819; x=1822947819;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ORIr4aueKB+RkOMzbE8YwVsrBLXkxgAy8Jk7402wdUc=;
 b=TudPSz2vjGzK+Mkc9Bo7tsU84ctGpxqSTr+QE99Fkv956gNWlhQJ8rtd
 3/vuXHYL6hvqWHIz0ci/CW6Aov3vSnUf/8Thab5hhrFam6krayHNpPO7I
 eKpeLrWNVYU0ugOY5y6NoPweP9SYIwSH5qvBpCwLIC8IQev1d8YkbRJ+e
 av+eDYAFY6NySamMRjW3pT1spxu2FMPLeS1LJhIy7+LRXWcTPBkXhLXrU
 BrecBEjVcWU/slNjHgxL2jQpIlgp8+STc9KnP04c0K7tpPQlDXIe5mwrR
 Y1weWudGe64Cmc4FG+BX4DBLa56RPsjA4MBImyK83H5KvobVTVT5qxs3T w==;
X-CSE-ConnectionGUID: PGFmHGHMQRK/E/M6SubF2A==
X-CSE-MsgGUID: L3rGF+siR3ydEO4oVoU3eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="88796"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="88796"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 15:23:38 -0700
X-CSE-ConnectionGUID: BOb84K37SyauDgKCXAK5vA==
X-CSE-MsgGUID: QzuwbJA+TAq49eLFQveMeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="193240"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.62])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 15:23:37 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/5] drm/i915/gmbus: Remove the INTEL_DISPLAY_WA_16025573575
 leftovers
Date: Thu,  8 Oct 2026 01:23:14 +0300
Message-ID: <20261007222314.5714-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007222314.5714-1-ville.syrjala@linux.intel.com>
References: <20261007222314.5714-1-ville.syrjala@linux.intel.com>
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

We no longer need the INTEL_DISPLAY_WA_16025573575 since the
bit banging code now always follows the w/a sequence.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_wa.c | 13 -------------
 drivers/gpu/drm/i915/display/intel_display_wa.h |  1 -
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 888676693f5e..2e3ff4861ef4 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -51,17 +51,6 @@ void intel_display_wa_apply(struct intel_display *display)
 		gen11_display_wa_apply(display);
 }
 
-/*
- * Wa_16025573575:
- * Fixes: Issue with bitbashing on Xe3 based platforms.
- * Workaround: Set masks bits in GPIO CTL and preserve it during bitbashing sequence.
- */
-static bool intel_display_needs_wa_16025573575(struct intel_display *display)
-{
-	return DISPLAY_VERx100(display) == 3000 || DISPLAY_VERx100(display) == 3002 ||
-		DISPLAY_VERx100(display) == 3500;
-}
-
 /*
  * Wa_14011503117:
  * Fixes: Before enabling the scaler DE fatal error is masked
@@ -134,8 +123,6 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 	case INTEL_DISPLAY_WA_16023588340:
 		/* This is a GT workaround. */
 		return display->parent->wa && display->parent->wa->wa_16023588340(display->drm);
-	case INTEL_DISPLAY_WA_16025573575:
-		return intel_display_needs_wa_16025573575(display);
 	case INTEL_DISPLAY_WA_16025596647:
 		return DISPLAY_VER(display) == 20 &&
 			IS_DISPLAY_VERx100_STEP(display, 3000,
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 425a300840aa..b707147a7587 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -42,7 +42,6 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_16011342517,
 	INTEL_DISPLAY_WA_16011863758,
 	INTEL_DISPLAY_WA_16023588340,
-	INTEL_DISPLAY_WA_16025573575,
 	INTEL_DISPLAY_WA_16025596647,
 	INTEL_DISPLAY_WA_16029024088,
 	INTEL_DISPLAY_WA_16030862157,
-- 
2.55.0

