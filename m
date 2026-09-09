Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD457C88E40
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0F810F224;
	Wed,  9 Sep 2026 16:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AxxcMKgm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2358310F220;
 Wed,  9 Sep 2026 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788970705; x=1820506705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Me+1t8/HhvwgdsTTkRYLJoAstlAPd8ISRf1/g3R3OzQ=;
 b=AxxcMKgmwWLaj1sd9SFvkrgddGjSxdh0nFNs49en2D5YrdE8sLXPxxXT
 dgp7Y25a5tOEfXwzXCoj/8rTfwml7I+1xRVbYuTTE6rYwRzj0bG0yGDBE
 AmBg0uizQOAAFcGCklwAnGDJUhuKQF5m3u9TiIpahNv8mB1HT4lzZ7Tfo
 1O30V4GZBDpmtIWC6tRDKYcX47De6SMGT4/E2AzUZu/WnlXh5lTAL5sj0
 L3N/HbwstMePwQKsn/+4ZL+uHU6OCaH3h4PvI2OCeMjYmHEDBRy2WlPJz
 YLnpYujASW1GKc9fISm5b0awc3GF7PZiMRshbEy2VaFezU3ao3h/6aRu8 w==;
X-CSE-ConnectionGUID: MS4+1y56T7ytEZrcveo0Dg==
X-CSE-MsgGUID: fNxrDY0wSpeZsYiSUDHuXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89446199"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89446199"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:18:24 -0700
X-CSE-ConnectionGUID: BuKhGGWgRKSZegLfotBX+Q==
X-CSE-MsgGUID: deEG3Cf3Q5GjbWgj+nZzIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="276592096"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.137])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:18:22 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 12/13] drm/i915/dsb: Add tracepoints for DSB commit
Date: Wed,  9 Sep 2026 19:17:29 +0300
Message-ID: <20260909161730.12969-13-ville.syrjala@linux.intel.com>
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

Currently DSB based commits don't leave any breadcrumbs via
tracepoints. Add new intel_dsb_commit and intel_dsb_done
tracepoints that at least indicates when the DSB does something.

We might want to improve this later somehow to have a slightly
better idea what the DSB might end up doing. But at least this
now shows that *something* is happening on the hardware.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/i915/display/intel_display_trace.h    | 51 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dsb.c      |  5 ++
 2 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers/gpu/drm/i915/display/intel_display_trace.h
index 504d105935bc..06cf662931fe 100644
--- a/drivers/gpu/drm/i915/display/intel_display_trace.h
+++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
@@ -22,6 +22,7 @@
 #include "intel_display_core.h"
 #include "intel_display_limits.h"
 #include "intel_display_types.h"
+#include "intel_dsb.h"
 #include "intel_vblank.h"
 
 #define __dev_name_display(display) dev_name((display)->drm->dev)
@@ -681,6 +682,56 @@ TRACE_EVENT(intel_fbc_nuke,
 		      __entry->frame, __entry->scanline)
 );
 
+TRACE_EVENT(intel_dsb_commit,
+	    TP_PROTO(struct intel_crtc *crtc, enum intel_dsb_id dsb_id),
+	    TP_ARGS(crtc, dsb_id),
+
+	    TP_STRUCT__entry(
+			     __string(dev, __dev_name_kms(crtc))
+			     __field(char, pipe_name)
+			     __field(u32, dsb_id)
+			     __field(u32, frame)
+			     __field(u32, scanline)
+			     ),
+
+	    TP_fast_assign(
+			   __assign_str(dev);
+			   __entry->pipe_name = pipe_name(crtc->pipe);
+			   __entry->dsb_id = dsb_id;
+			   __entry->frame = intel_crtc_get_vblank_counter(crtc);
+			   __entry->scanline = intel_get_crtc_scanline(crtc);
+			   ),
+
+	    TP_printk("dev %s, pipe %c, DSB %d, frame=%u, scanline=%u",
+		      __get_str(dev), __entry->pipe_name, __entry->dsb_id,
+		      __entry->frame, __entry->scanline)
+);
+
+TRACE_EVENT(intel_dsb_done,
+	    TP_PROTO(struct intel_crtc *crtc, enum intel_dsb_id dsb_id),
+	    TP_ARGS(crtc, dsb_id),
+
+	    TP_STRUCT__entry(
+			     __string(dev, __dev_name_kms(crtc))
+			     __field(char, pipe_name)
+			     __field(u32, dsb_id)
+			     __field(u32, frame)
+			     __field(u32, scanline)
+			     ),
+
+	    TP_fast_assign(
+			   __assign_str(dev);
+			   __entry->pipe_name = pipe_name(crtc->pipe);
+			   __entry->dsb_id = dsb_id;
+			   __entry->frame = intel_crtc_get_vblank_counter(crtc);
+			   __entry->scanline = intel_get_crtc_scanline(crtc);
+			   ),
+
+	    TP_printk("dev %s, pipe %c, DSB %d, frame=%u, scanline=%u",
+		      __get_str(dev), __entry->pipe_name, __entry->dsb_id,
+		      __entry->frame, __entry->scanline)
+);
+
 TRACE_EVENT(intel_crtc_vblank_work_start,
 	    TP_PROTO(struct intel_crtc *crtc),
 	    TP_ARGS(crtc),
diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 8e01e1eed291..299d778520a2 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -14,6 +14,7 @@
 #include "intel_de.h"
 #include "intel_display_regs.h"
 #include "intel_display_rpm.h"
+#include "intel_display_trace.h"
 #include "intel_display_types.h"
 #include "intel_dsb.h"
 #include "intel_dsb_regs.h"
@@ -982,6 +983,8 @@ void intel_dsb_commit(struct intel_dsb *dsb)
 	intel_de_write_fw(display, DSB_HEAD(pipe, dsb->id),
 			  intel_dsb_head(dsb));
 
+	trace_intel_dsb_commit(crtc, dsb->id);
+
 	intel_de_write_fw(display, DSB_TAIL(pipe, dsb->id),
 			  intel_dsb_tail(dsb));
 }
@@ -1124,6 +1127,8 @@ void intel_dsb_irq_handler(struct intel_display *display,
 		spin_lock(&display->drm->event_lock);
 
 		if (crtc->dsb_event) {
+			trace_intel_dsb_done(crtc, dsb_id);
+
 			/*
 			 * Update vblank counter/timestamp in case it
 			 * hasn't been done yet for this frame.
-- 
2.54.0

