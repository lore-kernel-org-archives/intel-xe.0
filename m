Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D79ECA1013
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 14:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F181110EBDA;
	Fri,  5 Sep 2025 14:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQ/nnS4Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D5110EBC8;
 Fri,  5 Sep 2025 14:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757084350; x=1788620350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2O+u2fzqS/wt4ZLbwbWvr7M6ZRlUD/vt6Pgtr9ahWHs=;
 b=IQ/nnS4QyZjg5jvdiW+z/8HABQpEIvMNgolvCxLJ7T7kVLsGLUHLgZEA
 LANeE4G8084hYZ2Uhl/Hj/dLpjBUoJTdGSO43BoZdHTfvMfd7MCXy1eeG
 wJ5Oc6vVaUmG57GVmxUGmGS1uKQcflZf7CNt04CIPm+aMWAtXHLx81nKD
 Rn72gVKdmEdqtLFpEm0GnRk5pbIM/gHQZTHlGbPcrlgC2Pm4EkQpYJ1iD
 JHowoklOK/SyvHIhLafrZJEiL5BYtSCa+5sldHuw0KuWkvp43usNQ9eh9
 BU0okyyRT0kl2k9Q/m4uFW3zfbfroii2A/JIcxm6sEgEt9eiLRtq+KNnI w==;
X-CSE-ConnectionGUID: R6NT+vgVTUSfEFhFtvFcRw==
X-CSE-MsgGUID: +2Z8ZIaETd2pbxF0EeiNnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70054398"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="70054398"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 07:59:10 -0700
X-CSE-ConnectionGUID: PI6V6O/5TCSDqNtSG3xDMA==
X-CSE-MsgGUID: EVdx1uyYSMaBEvJ2IRCfQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="172987816"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 07:59:08 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 09/13] drm/i915: Extract sanitize_wm_latency()
Date: Fri,  5 Sep 2025 17:58:28 +0300
Message-ID: <20250905145832.12097-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250905145832.12097-1-ville.syrjala@linux.intel.com>
References: <20250905145832.12097-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Pull the "zero out invalid WM latencies" stuff into a helper.
Mainly to avoid mixing higher level and lower level stuff in
the same adjust_wm_latency() function.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 23 ++++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 98a397772678..e3305a399ddf 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -3217,14 +3217,10 @@ static int wm_read_latency(struct intel_display *display)
 		return 2;
 }
 
-static void
-adjust_wm_latency(struct intel_display *display)
+static void sanitize_wm_latency(struct intel_display *display)
 {
 	u16 *wm = display->wm.skl_latency;
-	int i, level, num_levels = display->wm.num_levels;
-
-	if (display->platform.dg2)
-		multiply_wm_latency(display, 2);
+	int level, num_levels = display->wm.num_levels;
 
 	/*
 	 * If a level n (n > 1) has a 0us latency, all levels m (m >= n)
@@ -3233,11 +3229,24 @@ adjust_wm_latency(struct intel_display *display)
 	 */
 	for (level = 1; level < num_levels; level++) {
 		if (wm[level] == 0) {
+			int i;
+
 			for (i = level + 1; i < num_levels; i++)
 				wm[i] = 0;
-			break;
+			return;
 		}
 	}
+}
+
+static void
+adjust_wm_latency(struct intel_display *display)
+{
+	u16 *wm = display->wm.skl_latency;
+
+	if (display->platform.dg2)
+		multiply_wm_latency(display, 2);
+
+	sanitize_wm_latency(display);
 
 	/*
 	 * WaWmMemoryReadLatency
-- 
2.49.1

