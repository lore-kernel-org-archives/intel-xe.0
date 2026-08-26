Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C03BC61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C069510ED28;
	Wed, 26 Aug 2026 13:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BTFXdB77";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA3B10ED28;
 Wed, 26 Aug 2026 13:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787751671; x=1819287671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3c2EtxSPe14ywvvI8UHMi6cEBxXOvwrVkKDp/pUCzoE=;
 b=BTFXdB77Pww9GIAYzqXEXVBUV6sso5Cu4D2oAbPfJFtNjpx4t0m3uuwJ
 l3fswHqKbcmpJCVcNRZUQY2J5HJdStbFo1desF6otOm6znmudavmUqwef
 t4ZSpisp3iZrXmqmmpemNXi12BCvRKyLFBhK6YTEUfAlxmFcR525yAQiq
 97odn+aZZ9MdfnshJ8RGVElhY2QQKEVyzHIXKMkpyUJPGxfUE4uGFhYKD
 5YkO9rp3LXPHs3MuXlZCUN+e2OHGfwrUkOMT9Z9kBoWywhQaNcrOd7LhD
 qBJpaRTO+wyGazxNCsAmQjzgWHAynoElGJO72oSMYm9kJMi5paSNf+UNd A==;
X-CSE-ConnectionGUID: HNW6ZTTQQvONlyIikxgNJQ==
X-CSE-MsgGUID: MXmsC7GTRFuDxsGyxt87uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="92053074"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="92053074"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:41:11 -0700
X-CSE-ConnectionGUID: RCbc+tqdRQ6sutqgUHv2rA==
X-CSE-MsgGUID: CxnwzHGNS5Gf7QJmC/JGPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="265780026"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:41:10 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 08/14] drm/i915/cdclk: Unify the pcode pre/post notify in
 bxt_set_cdclk()
Date: Wed, 26 Aug 2026 16:40:27 +0300
Message-ID: <20260826134033.13976-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
References: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
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

The control flow between the pcode pre and post notifications in
bxt_set_cdclk() is written in two different ways, even though
they end up doing the same thing. Unify the code.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 5334abbaaed8..53d6cb05e467 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2264,7 +2264,7 @@ static void bxt_set_cdclk(struct intel_display *display,
 {
 	struct intel_cdclk_config mid_cdclk_config;
 	int cdclk = cdclk_config->cdclk;
-	int ret = 0;
+	int ret;
 
 	/*
 	 * Inform power controller of upcoming frequency change.
@@ -2273,7 +2273,7 @@ static void bxt_set_cdclk(struct intel_display *display,
 	 * this step.
 	 */
 	if (DISPLAY_VER(display) >= 14 || display->platform.dg2)
-		; /* NOOP */
+		ret = 0; /* NOOP */
 	else if (DISPLAY_VER(display) >= 11)
 		ret = intel_parent_pcode_request(display, SKL_PCODE_CDCLK_CONTROL,
 						 SKL_CDCLK_PREPARE_FOR_CHANGE,
@@ -2309,15 +2309,12 @@ static void bxt_set_cdclk(struct intel_display *display,
 	if (DISPLAY_VER(display) >= 20 && cdclk > display->cdclk.hw.cdclk)
 		xe2lpd_mdclk_cdclk_ratio_program(display, cdclk_config);
 
-	if (DISPLAY_VER(display) >= 14)
-		/*
-		 * NOOP - No Pcode communication needed for
-		 * Display versions 14 and beyond
-		 */;
-	else if (DISPLAY_VER(display) >= 11 && !display->platform.dg2)
+	if (DISPLAY_VER(display) >= 14 || display->platform.dg2)
+		ret = 0; /* NOOP */
+	else if (DISPLAY_VER(display) >= 11)
 		ret = intel_parent_pcode_write(display, SKL_PCODE_CDCLK_CONTROL,
 					       cdclk_config->voltage_level);
-	if (DISPLAY_VER(display) < 11) {
+	else
 		/*
 		 * The timeout isn't specified, the 2ms used here is based on
 		 * experiment.
@@ -2327,7 +2324,6 @@ static void bxt_set_cdclk(struct intel_display *display,
 		ret = intel_parent_pcode_write_timeout(display,
 						       HSW_PCODE_DE_WRITE_FREQ_REQ,
 						       cdclk_config->voltage_level, 2);
-	}
 	if (ret)
 		drm_err(display->drm,
 			"PCode CDCLK freq set failed, (err %d, freq %d)\n",
-- 
2.54.0

