Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265E7C88E42
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 04:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0A610E277;
	Fri, 11 Sep 2026 04:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPhs1gJL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C0210E277;
 Fri, 11 Sep 2026 04:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789100100; x=1820636100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ly3VbJd4W3I9uFjis2EGHK5Te5kwOYrqasqTkbwKgUs=;
 b=OPhs1gJLmtlH4QOZxDqdFnxvCyF6c0Y41GiKG960+mIayKyZbLrBAG7w
 +C8He2KlZ9HP/RPzkFs1Ggz0IyziPXaTAzX7PKKeqQ0uVqxiVZOVI0fiC
 8XhDVuU6PixuVgh/MOM5JIJfLiTe5FLUlkmw0H9A0SuqBUHdPaVHaAgcR
 7t76PbdIqL44fxTHPU/51G0nNtLGDp/9Uknz6hzwRUBW0zyB+OoSdwMp9
 PBsErCNWekIgXhZJjv7ZE2QtyUhmctAV8rABr1KoLf6sFs+J3st30WSeU
 k2a5f9HE+4y0pmO6xZrnetdHYfsKnErEayxESCVjf3YbsPv/9i9oyH4sh w==;
X-CSE-ConnectionGUID: YLfRpuEyQWGBWOBTR8pbYA==
X-CSE-MsgGUID: i3Yfx/yNS3iSL6BY4iqO9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89599950"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89599950"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 21:15:00 -0700
X-CSE-ConnectionGUID: afFtDIs+ToWzuG1KOmd0Aw==
X-CSE-MsgGUID: Th0MnjI9R4WcCoKuCRfzFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="275334412"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 10 Sep 2026 21:14:59 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 01/10] drm/i915/display: Add helper to compute link M/N ratio
 for reuse
Date: Fri, 11 Sep 2026 09:44:40 +0530
Message-Id: <20260911041449.3699400-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911041449.3699400-1-suraj.kandpal@intel.com>
References: <20260911041449.3699400-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
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

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Introduce `intel_display_get_link_m_n()` to compute the link M/N ratio
based on pixel clock and link clock. This logic was previously embedded
within `intel_link_compute_m_n()`.

The new helper allows reuse of link M/N computation in other contexts
without requiring the full data M/N calculation.

No functional changes intended.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index fc30a455bed3..b5682c196646 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2633,13 +2633,24 @@ static void compute_m_n(u32 *ret_m, u32 *ret_n,
 	intel_reduce_m_n_ratio(ret_m, ret_n);
 }
 
+static
+void intel_display_get_link_m_n(u32 *link_m, u32 *link_n,
+				u32 pixel_clock,
+				u32 link_clock)
+{
+	u32 link_symbol_clock = intel_dp_link_symbol_clock(link_clock);
+
+	compute_m_n(link_m, link_n,
+		    pixel_clock, link_symbol_clock,
+		    0x80000);
+}
+
 void
 intel_link_compute_m_n(u16 bits_per_pixel_x16, int nlanes,
 		       int pixel_clock, int link_clock,
 		       int bw_overhead,
 		       struct intel_link_m_n *m_n)
 {
-	u32 link_symbol_clock = intel_dp_link_symbol_clock(link_clock);
 	u32 data_m = intel_dp_effective_data_rate(pixel_clock, bits_per_pixel_x16,
 						  bw_overhead);
 	u32 data_n = drm_dp_max_dprx_data_rate(link_clock, nlanes);
@@ -2656,9 +2667,8 @@ intel_link_compute_m_n(u16 bits_per_pixel_x16, int nlanes,
 		    data_m, data_n,
 		    0x8000000);
 
-	compute_m_n(&m_n->link_m, &m_n->link_n,
-		    pixel_clock, link_symbol_clock,
-		    0x80000);
+	intel_display_get_link_m_n(&m_n->link_m, &m_n->link_n,
+				   pixel_clock, link_clock);
 }
 
 void intel_panel_sanitize_ssc(struct intel_display *display)
-- 
2.34.1

