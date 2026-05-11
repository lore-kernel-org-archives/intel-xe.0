Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED9DCD4842
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 12:29:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBB210E73B;
	Mon, 11 May 2026 12:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fMMAbkHF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB3C10E73D;
 Mon, 11 May 2026 12:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778502541; x=1810038541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vjQ50gGZcVErV0REW3vIfQHm8W2PijXBmka4HiCYlJ4=;
 b=fMMAbkHFIj/Mrixvi6z3coTYMW6/TUIETh5Zdf1DxtWJMPrgptySoKgH
 YyageGXJa1GnRjbtSWvcOVDAxDvsC+2vkI62v2FdVINyfVzOuqEj7Xf3E
 HKIoahFooiC2tnXYJablMMSWtEjOxyCp6oSXVhU2j7G8NOkLaKVo1gcu5
 rrN80fiNzPb1724nkAu2lqSXA8zMzTPQQ07KflDu5zC7cjkudJ0gJw9LD
 HujK86PWsGW9DZWAKGgI0FhWyYyyn6TF1hqsZoP4us8rRbCHHOMJHcJa/
 RiM4f6xvJb1TWcBdZKwfRGOw7i7BJkHE00kCohvBIuFm2ei6ubXDdAfOY w==;
X-CSE-ConnectionGUID: oPjGiAhLS+uSC2Bh7tIJ6Q==
X-CSE-MsgGUID: Pk5thvW0SWaye6dPEn5LlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="90762815"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="90762815"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:29:01 -0700
X-CSE-ConnectionGUID: i1VjWBXfT1ilp3nco7W+7w==
X-CSE-MsgGUID: nsmMQjkMSVi2o9ik7vGoWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="267801459"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.16])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:29:00 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH v2 10/11] drm/i915/bw: extract update_sagv_status()
Date: Mon, 11 May 2026 15:28:15 +0300
Message-ID: <20260511122816.1235478-11-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511122816.1235478-1-vinod.govindapillai@intel.com>
References: <20260511122816.1235478-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

Extract the code to update the sagv status based on the number of
QGV points into a separate function and use it.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 33 +++++++++++--------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 0bda13a3e31b..938c0294c251 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -505,6 +505,19 @@ static void debug_print_bw_info(struct intel_display *display)
 	}
 }
 
+static void update_sagv_status(struct intel_display *display, int qgv_points)
+{
+	/*
+	 * In case if SAGV is disabled in BIOS, we always get 1
+	 * SAGV point, but we can't send PCode commands to restrict it
+	 * as it will fail and pointless anyway.
+	 */
+	if (qgv_points == 1)
+		display->sagv.status = I915_SAGV_NOT_CONTROLLED;
+	else
+		display->sagv.status = I915_SAGV_ENABLED;
+}
+
 static bool is_tile_y_factored(struct intel_display *display)
 {
 	/* TGL supports Y-tile for LPDDR4/5, but not for DDR4 */
@@ -571,15 +584,7 @@ static int icl_get_bw_info(struct intel_display *display,
 
 	debug_print_bw_info(display);
 
-	/*
-	 * In case if SAGV is disabled in BIOS, we always get 1
-	 * SAGV point, but we can't send PCode commands to restrict it
-	 * as it will fail and pointless anyway.
-	 */
-	if (qi.num_points == 1)
-		display->sagv.status = I915_SAGV_NOT_CONTROLLED;
-	else
-		display->sagv.status = I915_SAGV_ENABLED;
+	update_sagv_status(display, qi.num_points);
 
 	return 0;
 }
@@ -682,15 +687,7 @@ static int tgl_get_bw_info(struct intel_display *display,
 
 	debug_print_bw_info(display);
 
-	/*
-	 * In case if SAGV is disabled in BIOS, we always get 1
-	 * SAGV point, but we can't send PCode commands to restrict it
-	 * as it will fail and pointless anyway.
-	 */
-	if (qi.num_points == 1)
-		display->sagv.status = I915_SAGV_NOT_CONTROLLED;
-	else
-		display->sagv.status = I915_SAGV_ENABLED;
+	update_sagv_status(display, qi.num_points);
 
 	return 0;
 }
-- 
2.43.0

