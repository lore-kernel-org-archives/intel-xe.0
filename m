Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E5DCA5FD4
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 13:57:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F7C10E29C;
	Fri,  2 Oct 2026 13:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SaDubuaK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A94110E29C;
 Fri,  2 Oct 2026 13:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790949478; x=1822485478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AjttZ/k6gQuJYLeEvMVq+ae8OK+X95EpTx78AjcbDYQ=;
 b=SaDubuaK/ljCmoa1N9iNp75Q6vbhSplb6Zwl2Mumcc8ReaT+LMKn1aNF
 lixjEIvHW1qq16GIzNLmAxELqxfJO9hlBBD4e/Bb2UfxqqkfUJG9amToP
 FdnGOQVuFkdgWzLobbt1Ziu/vdeuJ4Mi17RPlBTmgj4e4KTj9WrRbeUSu
 515520uJNtF0RwrFipL8Rd4Pcr/sLdqjL4Yp2BwxBBujs4JWxMYUti062
 xWg5f3aRdOklhzKfKYUA6p+0/tJMZjU+UlIJFXQAyJsGXMCwzgPRc1UPO
 E5ObiyIB6apizmFH9OcrIDnUlUNUj5kNRYMbTQzyifsZpHCEqLRhbmYCf w==;
X-CSE-ConnectionGUID: fHvS9283QwSh9Ztl4AJCPA==
X-CSE-MsgGUID: gyXSpm51R2CCGCKW1ntmmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90615021"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="90615021"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 06:57:58 -0700
X-CSE-ConnectionGUID: hrC0b3OlRhGrUjwulLgUFg==
X-CSE-MsgGUID: m3Yn9p4LTB+ocBumu+AhWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="272658242"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.24])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 06:57:56 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 2/3] drm/i915/dp: Drop using intel_de_read_notrace()
Date: Fri,  2 Oct 2026 16:57:54 +0300
Message-ID: <20261002135754.25422-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260930115303.24285-2-ville.syrjala@linux.intel.com>
References: <20260930115303.24285-2-ville.syrjala@linux.intel.com>
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

I want to eliminate intel_de_read_notrace() to shrink the
intel_de.h API a bit. That should help with the cleaning out
the remaining uncore mess for xe vs. i915.

Furthermore on xe intel_de_read_notrace() doesn't even do
what it says on the tin, and instead all register accesses
are traced anyway.

Switch the last users of intel_de_read_notrace()
(intel_dp_aux_wait_done() and intel_dp_aux_xfer())
over to the normal intel_de_read().

v2: Drop the trace_i915_reg_rw() as well

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index 3cb07b0a901c..394326d17e0d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -16,7 +16,6 @@
 #include "intel_pps.h"
 #include "intel_quirks.h"
 #include "intel_tc.h"
-#include "intel_uncore_trace.h"
 
 #define AUX_CH_NAME_BUFSIZE	6
 
@@ -66,7 +65,7 @@ intel_dp_aux_wait_done(struct intel_dp *intel_dp)
 	int ret;
 
 	if (intel_parent_irq_enabled(display)) {
-#define C (((status = intel_de_read_notrace(display, ch_ctl)) & DP_AUX_CH_CTL_SEND_BUSY) == 0)
+#define C (((status = intel_de_read(display, ch_ctl)) & DP_AUX_CH_CTL_SEND_BUSY) == 0)
 		done = wait_event_timeout(display->gmbus.wait_queue, C,
 					  msecs_to_jiffies_timeout(timeout_ms));
 
@@ -324,13 +323,11 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 
 	/* Try to wait for any previous AUX channel activity */
 	for (try = 0; try < 3; try++) {
-		status = intel_de_read_notrace(display, ch_ctl);
+		status = intel_de_read(display, ch_ctl);
 		if ((status & DP_AUX_CH_CTL_SEND_BUSY) == 0)
 			break;
 		msleep(1);
 	}
-	/* just trace the final value */
-	trace_i915_reg_rw(false, ch_ctl, status, sizeof(status), true);
 
 	if (try == 3) {
 		const u32 status = intel_de_read(display, ch_ctl);
-- 
2.54.0

