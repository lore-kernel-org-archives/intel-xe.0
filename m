Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31632CD4F3D
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 16:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E6810EF27;
	Wed, 13 May 2026 16:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftj3iQE2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67FB10EF34;
 Wed, 13 May 2026 16:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778688825; x=1810224825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kE+0qBhac0gcoH+XG3Sq/TNq317pv3d24DLU+Rz8T+8=;
 b=ftj3iQE2K8eNUwSzcggPqR+DtUrp6GOqob5bcaN+RBLuDC2rz5zDh5qx
 j/qkXP0Uq9Eu2KxE4xOaja4+GB6O1tGsLLDa2xxvT6PQY/7T38JNL6/F7
 JyHK86IHOQ8m52bakHidYNpxsjXczBOxWk3oIpOmKRDrIgYczIaPNLXMQ
 zMISlWTX1Kb3xOcAnEpjzGIrh9NeoIcA8tkj0KEVXbAneMNzxi24a46Wf
 TaKZZPdRsQCwp6HVJ2rUcXC78ydStbQMZ1MyewIdKjH9JDRW/NkCZ7wdk
 5izp7nlKcy9QIbMYMSZCbInkYhAgHBxhoWp0PMDqgJmG6MyApX+EvwMrb Q==;
X-CSE-ConnectionGUID: 957Cg7v0RHK9N/bK3b1/aw==
X-CSE-MsgGUID: mldVPRunST+xSD1t19FhpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79517154"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="79517154"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 09:13:45 -0700
X-CSE-ConnectionGUID: dTs15yfbRYuMXqsxCi04cA==
X-CSE-MsgGUID: WXwU3U2qQluP3Q+B4El3fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="261631738"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.124])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 09:13:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v4 2/8] drm/i915/irq: constify pipe stats parameters
Date: Wed, 13 May 2026 19:13:25 +0300
Message-ID: <3b7ad6be706ed757b53c6c4e06a3410f6f7520e0.1778688699.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778688699.git.jani.nikula@intel.com>
References: <cover.1778688699.git.jani.nikula@intel.com>
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

The pipe stat irq handling doesn't need to modify the pipe stats
arrays. Make them const.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_irq.c | 6 +++---
 drivers/gpu/drm/i915/display/intel_display_irq.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index a1dbf20c2e02..c656d59c7571 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -597,7 +597,7 @@ void i9xx_pipestat_irq_ack(struct intel_display *display,
 }
 
 void i915_pipestat_irq_handler(struct intel_display *display,
-			       u32 iir, u32 pipe_stats[I915_MAX_PIPES])
+			       u32 iir, const u32 pipe_stats[I915_MAX_PIPES])
 {
 	bool blc_event = false;
 	enum pipe pipe;
@@ -621,7 +621,7 @@ void i915_pipestat_irq_handler(struct intel_display *display,
 }
 
 void i965_pipestat_irq_handler(struct intel_display *display,
-			       u32 iir, u32 pipe_stats[I915_MAX_PIPES])
+			       u32 iir, const u32 pipe_stats[I915_MAX_PIPES])
 {
 	bool blc_event = false;
 	enum pipe pipe;
@@ -648,7 +648,7 @@ void i965_pipestat_irq_handler(struct intel_display *display,
 }
 
 void valleyview_pipestat_irq_handler(struct intel_display *display,
-				     u32 pipe_stats[I915_MAX_PIPES])
+				     const u32 pipe_stats[I915_MAX_PIPES])
 {
 	enum pipe pipe;
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.h b/drivers/gpu/drm/i915/display/intel_display_irq.h
index e2b1674fae06..d25b9ea4272b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.h
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.h
@@ -78,9 +78,9 @@ void i915_disable_pipestat(struct intel_display *display, enum pipe pipe, u32 st
 
 void i9xx_pipestat_irq_ack(struct intel_display *display, u32 iir, u32 pipe_stats[I915_MAX_PIPES]);
 
-void i915_pipestat_irq_handler(struct intel_display *display, u32 iir, u32 pipe_stats[I915_MAX_PIPES]);
-void i965_pipestat_irq_handler(struct intel_display *display, u32 iir, u32 pipe_stats[I915_MAX_PIPES]);
-void valleyview_pipestat_irq_handler(struct intel_display *display, u32 pipe_stats[I915_MAX_PIPES]);
+void i915_pipestat_irq_handler(struct intel_display *display, u32 iir, const u32 pipe_stats[I915_MAX_PIPES]);
+void i965_pipestat_irq_handler(struct intel_display *display, u32 iir, const u32 pipe_stats[I915_MAX_PIPES]);
+void valleyview_pipestat_irq_handler(struct intel_display *display, const u32 pipe_stats[I915_MAX_PIPES]);
 
 void vlv_display_error_irq_ack(struct intel_display *display, u32 *eir, u32 *dpinvgtt);
 void vlv_display_error_irq_handler(struct intel_display *display, u32 eir, u32 dpinvgtt);
-- 
2.47.3

