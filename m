Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C087C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40F410F226;
	Wed,  9 Sep 2026 16:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SlGsyUYD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904D910F225;
 Wed,  9 Sep 2026 16:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788970709; x=1820506709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=opBQOphP2LCqF41Ed34J949aoaYBn6TKQgzEEInFqTg=;
 b=SlGsyUYDXbYV8QpXQx409+Ol2T11Uu/z5P2llm9MXT6Ha3I6uK3eBTM0
 gEvhoQrj+y/X7gLasHPtpNm5v0wS1S5WNIyPhlSknSX4RArwkyNmwyz17
 IIsIQ0tLwYxN1jq+lNxu572vzcdzpaBNoijz5jNWSbxxpzFrQGMYH5oh3
 2S3fAB/YaXaRBAs9/YVOYnyX6/h9u2lZk024SIlK+rRKFo1aYaZ2U8XRL
 XmY/F3ykKY3yAInsC7pU+CngIQh2qVYg7U0CAtvMY/HP2seffLeVUNEaZ
 zhs+jtO7crjIwBYfCpxuzx+Ggpp/qSiFCJzba7bJOBd94BWTE/dkC0u2m w==;
X-CSE-ConnectionGUID: DkL3ofIhRwyrfEBAL9Vh5g==
X-CSE-MsgGUID: MLz3FaH/QmS3SHEtczrvFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89446209"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89446209"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:18:29 -0700
X-CSE-ConnectionGUID: b0wgGPsHQY6mrUGpiDHYig==
X-CSE-MsgGUID: jiXRafnrQQavwB6lC8jPSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="276592105"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.137])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:18:26 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 13/13] drm/i915/dsb: Add tracepoints for flip queue
Date: Wed,  9 Sep 2026 19:17:30 +0300
Message-ID: <20260909161730.12969-14-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
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

Currently flip queue based commits don't leave any breadcrumbs
via tracepoints. Add new intel_flipq_add and intel_flipq_done
tracepoints that at least indicates when we something happens
via the flip queeu.

We might want to improve this later somehow to have a slightly
better idea what the flip queue might end up doing. But at least
this now shows that *something* is going on.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/i915/display/intel_display_trace.h    | 60 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dmc.c      |  3 +
 drivers/gpu/drm/i915/display/intel_flipq.c    |  7 ++-
 3 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers/gpu/drm/i915/display/intel_display_trace.h
index 06cf662931fe..98ba7e20ca30 100644
--- a/drivers/gpu/drm/i915/display/intel_display_trace.h
+++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
@@ -23,6 +23,7 @@
 #include "intel_display_limits.h"
 #include "intel_display_types.h"
 #include "intel_dsb.h"
+#include "intel_flipq.h"
 #include "intel_vblank.h"
 
 #define __dev_name_display(display) dev_name((display)->drm->dev)
@@ -732,6 +733,65 @@ TRACE_EVENT(intel_dsb_done,
 		      __entry->frame, __entry->scanline)
 );
 
+TRACE_EVENT(intel_flipq_add,
+	    TP_PROTO(struct intel_crtc *crtc,
+		     enum intel_flipq_id flipq_id,
+		     enum intel_dsb_id dsb_id,
+		     u32 pts, u32 curr_pts),
+	    TP_ARGS(crtc, flipq_id, dsb_id, pts, curr_pts),
+
+	    TP_STRUCT__entry(
+			     __string(dev, __dev_name_kms(crtc))
+			     __field(char, pipe_name)
+			     __field(u32, flipq_id)
+			     __field(u32, dsb_id)
+			     __field(u32, pts)
+			     __field(u32, curr_pts)
+			     __field(u32, frame)
+			     __field(u32, scanline)
+			     ),
+
+	    TP_fast_assign(
+			   __assign_str(dev);
+			   __entry->pipe_name = pipe_name(crtc->pipe);
+			   __entry->flipq_id = flipq_id;
+			   __entry->dsb_id = dsb_id;
+			   __entry->pts = pts;
+			   __entry->curr_pts = curr_pts;
+			   __entry->frame = intel_crtc_get_vblank_counter(crtc);
+			   __entry->scanline = intel_get_crtc_scanline(crtc);
+			   ),
+
+	    TP_printk("dev %s, pipe %c, FQ %d, DSB %d, PTS %u, current PTS %u, frame=%u, scanline=%u",
+		      __get_str(dev), __entry->pipe_name,
+		      __entry->flipq_id, __entry->dsb_id,
+		      __entry->pts, __entry->curr_pts,
+		      __entry->frame, __entry->scanline)
+);
+
+TRACE_EVENT(intel_flipq_done,
+	    TP_PROTO(struct intel_crtc *crtc),
+	    TP_ARGS(crtc),
+
+	    TP_STRUCT__entry(
+			     __string(dev, __dev_name_kms(crtc))
+			     __field(char, pipe_name)
+			     __field(u32, frame)
+			     __field(u32, scanline)
+			     ),
+
+	    TP_fast_assign(
+			   __assign_str(dev);
+			   __entry->pipe_name = pipe_name(crtc->pipe);
+			   __entry->frame = intel_crtc_get_vblank_counter(crtc);
+			   __entry->scanline = intel_get_crtc_scanline(crtc);
+			   ),
+
+	    TP_printk("dev %s, pipe %c, frame=%u, scanline=%u",
+		      __get_str(dev), __entry->pipe_name,
+		      __entry->frame, __entry->scanline)
+);
+
 TRACE_EVENT(intel_crtc_vblank_work_start,
 	    TP_PROTO(struct intel_crtc *crtc),
 	    TP_ARGS(crtc),
diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index a191eee240d9..a16560f94986 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -34,6 +34,7 @@
 #include "intel_display_power_well.h"
 #include "intel_display_regs.h"
 #include "intel_display_rpm.h"
+#include "intel_display_trace.h"
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
 #include "intel_dmc.h"
@@ -1715,6 +1716,8 @@ void intel_pipedmc_irq_handler(struct intel_display *display, enum pipe pipe)
 			spin_lock(&display->drm->event_lock);
 
 			if (crtc->flipq_event) {
+				trace_intel_flipq_done(crtc);
+
 				/*
 				 * Update vblank counter/timestamp in case it
 				 * hasn't been done yet for this frame.
diff --git a/drivers/gpu/drm/i915/display/intel_flipq.c b/drivers/gpu/drm/i915/display/intel_flipq.c
index 45788234fc83..e7cfacd8a5ef 100644
--- a/drivers/gpu/drm/i915/display/intel_flipq.c
+++ b/drivers/gpu/drm/i915/display/intel_flipq.c
@@ -11,6 +11,7 @@
 #include "intel_crtc.h"
 #include "intel_de.h"
 #include "intel_display_core.h"
+#include "intel_display_trace.h"
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
 #include "intel_display_wa.h"
@@ -430,11 +431,13 @@ void intel_flipq_add(struct intel_crtc *crtc,
 {
 	struct intel_display *display = to_intel_display(crtc);
 	struct intel_flipq *flipq = &crtc->flipq[flipq_id];
+	unsigned int curr_pts;
 
 	if (!assert_flipq_has_room(crtc, flipq_id))
 		return;
 
-	pts += intel_de_read(display, PIPEDMC_FPQ_TS(crtc->pipe));
+	curr_pts = intel_de_read(display, PIPEDMC_FPQ_TS(crtc->pipe));
+	pts += curr_pts;
 
 	intel_flipq_preempt(crtc, true);
 
@@ -446,6 +449,8 @@ void intel_flipq_add(struct intel_crtc *crtc,
 	flipq->tail = (flipq->tail + 1) % intel_flipq_size_entries(flipq->flipq_id);
 	intel_flipq_write_tail(crtc);
 
+	trace_intel_flipq_add(crtc, flipq_id, dsb_id, pts, curr_pts);
+
 	intel_flipq_preempt(crtc, false);
 
 	intel_flipq_sw_dmc_wake(crtc);
-- 
2.54.0

