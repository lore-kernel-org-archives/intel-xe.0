Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87679FF8867
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 10:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AA310EF6F;
	Wed, 29 Apr 2026 10:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpfU8M2w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75E210EF69;
 Wed, 29 Apr 2026 10:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777458347; x=1808994347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t9TbpCBRVDFUjiN+pAfbpJjXJMPdQAzhAct3nnejYbM=;
 b=jpfU8M2wBQ2+tZPpfUZcbKpRz81YRBHzVXR7fQUUI5Dc77gX/91m4PhU
 jeCU5+p3Ana9qCuxM3SjZylgwWNBkYcNG2Qizi/m9zixGk82jd005B0t4
 7voG7KScd1Vu8Ka/IsveyMIkcKKGJqwZlugCYlp7wL1ydwVBjebsCYeJa
 Dpgm4T6KvrMRVWPe7SZiPYxy20yrxAOHo4KNEPTkd/zCYueCSj52sTcwP
 0bKzl+PQvf+0LKStn0lqZOUnfYhFZ589NIiYcRq+COu8DCYstHVwMjUiC
 YTdH2WulgnSlZnaolpAW8E7AUx3b3PMf2oVQC7sYj0OWtGXWA8rgxiRzn w==;
X-CSE-ConnectionGUID: lbDWj51bQqmGKYL0Fl6/zw==
X-CSE-MsgGUID: izhBD9YKS8a/G82BVYs3jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="103838193"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="103838193"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 03:25:47 -0700
X-CSE-ConnectionGUID: MnLlhFLKRGasXaY6hxm77w==
X-CSE-MsgGUID: VEvX+5rOTMGSIJIAbKQveg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="257784115"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.175])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 03:25:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 11/15] drm/i915/irq: constify pipe stats parameters
Date: Wed, 29 Apr 2026 13:24:51 +0300
Message-ID: <a2d9d63372235668e6066cae0fc5acf96ee440c3.1777458161.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777458161.git.jani.nikula@intel.com>
References: <cover.1777458161.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_irq.c | 6 +++---
 drivers/gpu/drm/i915/display/intel_display_irq.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index bf4b5e7b6011..d30b063714b0 100644
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

