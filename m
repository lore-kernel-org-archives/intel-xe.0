Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE77606A326
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 09:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NEh0oX7N
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD0E112873;
	Fri, 20 Nov 2026 09:56:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08517112861;
 Fri, 20 Nov 2026 09:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795168569; x=1826704569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SQJysGE7GU0r/ow7t7cLCpJZQ5nT+jMzFWNqdG5znRE=;
 b=NEh0oX7NBZNFploHoPq/KcTWvxC70+zy5G2/F0yYuunyKdNcHetvCae+
 x6ZrsY8T1LDo3UvmXkEF1AffEiLhDwUAZteYvXIFnQO8amEyAoCRtWTl0
 2e9NL/VHmdJmCoUPWz++ify9k/WXnyC26t3nKXd6rRF6fo2+3qQ5yCdBd
 YrqOqfdw1djjIcVwiHhPC/jg16ibeeatoUPM6RxnZrzDanrBTAnKbdw0Y
 2UERtZr4yjU76uNtNamG+//EJRlS4cgkFSvLwgNrcex6KSBkAAfSBz0nq
 X6jLwp6S1Jux92C3hiCvB4KsYNfbz1GhwkZjGxXupSZoupotLCW21UNmN w==;
X-CSE-ConnectionGUID: BjE7K/UQTMOUiot7Vs1pmg==
X-CSE-MsgGUID: hDye7a7ZQaawX4VudRV35A==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4072528"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4072528"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 01:56:08 -0800
X-CSE-ConnectionGUID: Y1lC/7hhTD+il6Tbfhv29Q==
X-CSE-MsgGUID: 3cJSk1sPQmeWZLOoIxEqcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10567011"
Received: from lpankiew-mobl.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.221])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 01:56:07 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 4/4] drm/i915/psr: Add trace for selective update area
Date: Fri, 20 Nov 2026 11:55:41 +0200
Message-ID: <20261120095541.1325118-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120095541.1325118-1-jouni.hogander@intel.com>
References: <20261120095541.1325118-1-jouni.hogander@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a display tracepoint for the final selective update area, including
pipe, frame and full update status.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../drm/i915/display/intel_display_trace.h    | 33 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_psr.c      |  5 +++
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers/gpu/drm/i915/display/intel_display_trace.h
index 98ba7e20ca30b..ae9b196f03ee0 100644
--- a/drivers/gpu/drm/i915/display/intel_display_trace.h
+++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
@@ -475,6 +475,39 @@ TRACE_EVENT(intel_plane_update_arm,
 		      DRM_RECT_ARG((const struct drm_rect *)__entry->dst))
 );
 
+TRACE_EVENT(intel_psr2_su_area,
+	    TP_PROTO(struct intel_crtc *crtc,
+		     const struct intel_crtc_state *crtc_state, bool full_update),
+	    TP_ARGS(crtc, crtc_state, full_update),
+
+	    TP_STRUCT__entry(
+			     __string(dev, __dev_name_kms(crtc))
+			     __field(u32, pipe)
+			     __field(u32, frame)
+			     __field(int, x1)
+			     __field(int, y1)
+			     __field(int, x2)
+			     __field(int, y2)
+			     __field(u32, full_update)
+			     ),
+
+	    TP_fast_assign(
+			   __assign_str(dev);
+			   __entry->pipe = crtc->pipe;
+			   __entry->frame = intel_crtc_get_vblank_counter(crtc);
+			   __entry->x1 = crtc_state->psr2_su_area.x1;
+			   __entry->y1 = crtc_state->psr2_su_area.y1;
+			   __entry->x2 = crtc_state->psr2_su_area.x2;
+			   __entry->y2 = crtc_state->psr2_su_area.y2;
+			   __entry->full_update = full_update;
+			   ),
+
+	    TP_printk("dev=%s pipe=%u frame=%u su_area=%dx%d+%d+%d full_update=%u",
+		      __get_str(dev), __entry->pipe, __entry->frame,
+		      __entry->x2 - __entry->x1, __entry->y2 - __entry->y1,
+		      __entry->x1, __entry->y1, __entry->full_update)
+);
+
 TRACE_EVENT(intel_plane_disable_arm,
 	    TP_PROTO(struct intel_plane *plane, struct intel_crtc *crtc),
 	    TP_ARGS(plane, crtc),
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index efcc5ce1bfab0..b196d49c58d6a 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -40,6 +40,7 @@
 #include "intel_display_irq.h"
 #include "intel_display_regs.h"
 #include "intel_display_rpm.h"
+#include "intel_display_trace.h"
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
 #include "intel_display_wa.h"
@@ -3332,6 +3333,10 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 		ret = psr2_sel_fetch_apply_su_area(state, joined_crtc, full_update);
 		if (ret)
 			return ret;
+
+		trace_intel_psr2_su_area(joined_crtc,
+					 intel_atomic_get_new_crtc_state(state, joined_crtc),
+					 full_update);
 	}
 
 	return 0;
-- 
2.53.0

