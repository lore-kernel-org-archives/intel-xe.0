Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155B2CCF9EF
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 16:30:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D9710E51A;
	Mon, 27 Oct 2025 16:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IzrBfZQS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F100810E515;
 Mon, 27 Oct 2025 16:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761582619; x=1793118619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FV8hS9xkBaBxLb/7hSsP6P+NCmmObgRtX/epjMon8Ic=;
 b=IzrBfZQS7gU3IGRVC4/oYOEHHdCv4/IwOuXGxIUZHEb2aUGBk4mwQezc
 /jQlnahPIqEX08VduiupGh1007L1lVhRSDZWzg7wZ0v0mJQ8R+w1ujETU
 qKX6uJrOsWo9YJ66ooKGH2Q64CZHntL9g0SOcsTB+/f59+q1GrulJ2V9P
 PJUGLgC3KIoSlLNaSExLi5v1736bLRyvpS0WfhC4XcIn2L4Qwa/palfsU
 Fi2dQY+of7L6nf6SlVKBCDCNSUVvPhZ5yMjR+5LwOkShl8BRnSd2H8vK2
 8AKjC3/0wMkI1l/eMe6sxAlw1qgRz/35FC99e2I9rw08AcIAhr9T4ja1k w==;
X-CSE-ConnectionGUID: Mq9L5M9oTJC0UNOqbqm5eA==
X-CSE-MsgGUID: O5Hzxcp3S9a5Mho15ImwBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81299384"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="81299384"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:30:19 -0700
X-CSE-ConnectionGUID: elZfBjo7TuG1nnJk6GwqMw==
X-CSE-MsgGUID: qT1EW1lRRFCbEBBAdbllyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184785821"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa007.fm.intel.com with ESMTP; 27 Oct 2025 09:30:17 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, mitulkumar.ajitkumar.golani@intel.com,
 ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v8 22/22] drm/i915/vrr: Add function to check if DC Balance
 Possible
Date: Mon, 27 Oct 2025 21:59:27 +0530
Message-ID: <20251027162927.2655581-23-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027162927.2655581-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20251027162927.2655581-1-mitulkumar.ajitkumar.golani@intel.com>
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

Add function to check if DC Balance possibile on
requested PIPE and also validate along with DISPLAY_VER
check.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index d68306cdbf57..50bb3a1f6105 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -236,6 +236,22 @@ void intel_vrr_compute_cmrr_timings(struct intel_crtc_state *crtc_state)
 	crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
 }
 
+static
+int intel_vrr_dc_balance_possible(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	enum pipe pipe = crtc->pipe;
+
+	/*
+	 * FIXME: Currently Firmware supports DC Balancing on PIPE A
+	 * and PIPE B. Account those limitation while computing DC
+	 * Balance parameters.
+	 */
+	return (HAS_VRR_DC_BALANCE(display) &&
+		((pipe == PIPE_A) || (pipe == PIPE_B)));
+}
+
 static
 void intel_vrr_compute_vrr_timings(struct intel_crtc_state *crtc_state,
 				   int vmin, int vmax)
@@ -249,7 +265,7 @@ void intel_vrr_compute_vrr_timings(struct intel_crtc_state *crtc_state,
 	crtc_state->vrr.enable = true;
 	crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
 
-	if (HAS_VRR_DC_BALANCE(display))
+	if (intel_vrr_dc_balance_possible(crtc_state))
 		crtc_state->vrr.dc_balance.enable = true;
 }
 
-- 
2.48.1

