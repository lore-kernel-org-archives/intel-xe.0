Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32119C9830E
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 16:43:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E418510EEB5;
	Wed, 23 Sep 2026 16:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GGxW+Uqo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED4610ED61;
 Wed, 23 Sep 2026 16:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790181816; x=1821717816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cxGXLpSYo/htGZLZqlEvEwYyYXcVfwX0lMDS2cNMjVU=;
 b=GGxW+Uqo9/utqeq1CggiTrE1d/nh8aj/R0eJNGILn8G8IDkVBmq7k2li
 dl5R+jJf+5S6o+GU2NZgjtwH1wEtZZLwOMDfOFy4x3S4Ogmnv2gu3h95Q
 qa0JNRsCHU7iG8me1nwPhsf0jxQlxkPWpTz69cB8vbsZbxWYo1zdh4cjh
 5DMxteZyYSNDVORB0PQ+jQMi0gLHm/fAmMYcmb7dkZNzEAZfvwch4cooy
 gDp0hH5Qw78A1mHBXarv3XMvOajxc1uFaETk8GM+v95NthV/iX7TWB3I3
 CyAfi986jO4T5Qq0oxSmrlWFdKAscCCIupitxDgoDzzQxR5Lr7X3VTzps w==;
X-CSE-ConnectionGUID: OW885KTqSbOpzixW3a2REQ==
X-CSE-MsgGUID: 14I8ZfLFRb2UoYxSSOzEWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="116423781"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="116423781"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 09:43:35 -0700
X-CSE-ConnectionGUID: MBwnIvt6R8WZN/UNpJXb+Q==
X-CSE-MsgGUID: wuUa2QW9SPKg5Jvm+LhiFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="273883079"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.46])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 09:43:33 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Xizhe Tang <xizheTang2005@163.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 3/3] drm/i915/vrr: s/intel_vrr_possible()/has_vrr_tg_timings()/
Date: Wed, 23 Sep 2026 19:43:21 +0300
Message-ID: <20260923164321.9230-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260923164321.9230-1-ville.syrjala@linux.intel.com>
References: <20260923164321.9230-1-ville.syrjala@linux.intel.com>
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

Several places in the VRR code are using intel_vrr_possible() as
an indication whether whether we should program the VRR timing
generator registers or not. While the implementation is correct
the function name is very confusing. Rename the function to
has_vrr_tg_timings(), and make it static as it's no longer needed
outside intel_vrr.c.

Cc: Xizhe Tang <xizheTang2005@163.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 12 ++++++------
 drivers/gpu/drm/i915/display/intel_vrr.h |  1 -
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index bb2bfa8e76e2..2141462fcbcb 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -98,7 +98,7 @@ bool intel_vrr_is_in_range(struct intel_connector *connector, int vrefresh)
 		vrefresh <= info->monitor_range.max_vfreq;
 }
 
-bool intel_vrr_possible(const struct intel_crtc_state *crtc_state)
+static bool has_vrr_tg_timings(const struct intel_crtc_state *crtc_state)
 {
 	return crtc_state->vrr.flipline;
 }
@@ -383,7 +383,7 @@ void intel_vrr_set_fixed_rr_timings(const struct intel_crtc_state *crtc_state,
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 
-	if (!intel_vrr_possible(crtc_state))
+	if (!has_vrr_tg_timings(crtc_state))
 		return;
 
 	intel_vrr_set_cmrr_timings(crtc_state, transcoder);
@@ -623,7 +623,7 @@ void intel_vrr_compute_guardband(struct intel_crtc_state *crtc_state)
 	struct drm_display_mode *pipe_mode = &crtc_state->hw.pipe_mode;
 	int guardband;
 
-	if (!intel_vrr_possible(crtc_state))
+	if (!has_vrr_tg_timings(crtc_state))
 		return;
 
 	if (intel_vrr_use_optimized_guardband(crtc_state))
@@ -695,7 +695,7 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 		intel_de_rmw(display, CHICKEN_TRANS(display, cpu_transcoder),
 			     0, PIPE_VBLANK_WITH_DELAY);
 
-	if (!intel_vrr_possible(crtc_state)) {
+	if (!has_vrr_tg_timings(crtc_state)) {
 		intel_de_write(display,
 			       TRANS_VRR_CTL(display, cpu_transcoder), 0);
 		return;
@@ -1040,7 +1040,7 @@ void intel_vrr_transcoder_enable(const struct intel_crtc_state *crtc_state)
 
 	intel_vrr_set_transcoder_timings(crtc_state);
 
-	if (!intel_vrr_possible(crtc_state))
+	if (!has_vrr_tg_timings(crtc_state))
 		return;
 
 	if (intel_vrr_always_use_vrr_tg(display))
@@ -1051,7 +1051,7 @@ void intel_vrr_transcoder_disable(const struct intel_crtc_state *old_crtc_state)
 {
 	struct intel_display *display = to_intel_display(old_crtc_state);
 
-	if (!intel_vrr_possible(old_crtc_state))
+	if (!has_vrr_tg_timings(old_crtc_state))
 		return;
 
 	if (intel_vrr_always_use_vrr_tg(display))
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
index f04e81593d99..b56aacb031fb 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.h
+++ b/drivers/gpu/drm/i915/display/intel_vrr.h
@@ -19,7 +19,6 @@ enum transcoder;
 
 bool intel_vrr_is_capable(struct intel_connector *connector);
 bool intel_vrr_is_in_range(struct intel_connector *connector, int vrefresh);
-bool intel_vrr_possible(const struct intel_crtc_state *crtc_state);
 void intel_vrr_check_modeset(struct intel_atomic_state *state);
 void intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 			      struct drm_connector_state *conn_state);
-- 
2.54.0

