Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0F0CD3436
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 22:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F35B10E894;
	Mon,  4 May 2026 22:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f9/WYUNj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6715210E685;
 Mon,  4 May 2026 22:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777933589; x=1809469589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t9TbpCBRVDFUjiN+pAfbpJjXJMPdQAzhAct3nnejYbM=;
 b=f9/WYUNjG1AUVrjrRQt7OMVc1sqr+c9BOohBE7WS6Nv1JncZlE/cWM/P
 CWzVrkoBdSMf9xpXjngEwoCHHVwTYNBersJDLVDnncIV17ZAW10G7hjre
 g/sCxmNxm1L2PZxM23BdEU0WMMfb0IuMjkb/b80gkCtyvSCmZ6C3mpwHf
 Db2cp4YI6xL3tfnHmQUEB26ti673Rg51Ug8wXDExJ5bIFEFLh1IjhXAg0
 93Bf/XqDsWPTNJrsjlKrPktq2gefa4Mqt4uwgsEvhanP4btHdevbJrsm7
 AUpWlWpvbg6Hek3ilr56zjGcMLF1TWvLCGpPg39JFcqcWcbdsYkNhAxcu g==;
X-CSE-ConnectionGUID: lGB0whc8QyStwu9zLv1hPw==
X-CSE-MsgGUID: d13A5NhwTPyY4iRaQoQITw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="77820278"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="77820278"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 15:26:29 -0700
X-CSE-ConnectionGUID: db/eNiHpRLq/EbJzfrKIgw==
X-CSE-MsgGUID: 20PyurW/QOKTaYqJXKUs9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="235509344"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.157])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 15:26:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH v2 2/6] drm/i915/irq: constify pipe stats parameters
Date: Tue,  5 May 2026 01:26:09 +0300
Message-ID: <d661e302c91278bfc4f98f58341ce60c19ad3ad2.1777933454.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777933454.git.jani.nikula@intel.com>
References: <cover.1777933454.git.jani.nikula@intel.com>
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

