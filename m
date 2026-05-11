Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF44CD37B7
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 05:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCCB10E48F;
	Mon, 11 May 2026 05:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VbRLn8LW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C04110E495;
 Mon, 11 May 2026 05:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778479014; x=1810015014;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/AwnVgoxrR4fwd2D3iMk+JyvHPem5E5kKse7hw4tPN4=;
 b=VbRLn8LW2DSHQi8TU/84Q/D+1ehzljIymu/MJFV8/Qyhs+Z46IbeLu+J
 qs4qtB8wxtpIEnbqKvvYUkxgIzJAVpVa7QkGyoHTdBmQIzbE6qwsIGEEv
 oJoe3Ryf/te4V9lw+5QtN0AycTJA7ZOxId8foOgDG7e7Zd27oZWy/v2ZO
 0rHEqFp4g9NFOXc+XGxUzSxE4Ic6zkLoZ0EmHwAr3RbchF6S9sjaQc5p/
 8F0XA7nZXKUgnaHoFOFcoAMY0ggej0XVDtwDUctmos8HC14UhSlMXU7y0
 HhSBhttLhGg0WsuGqs9UfU3ZUWgXzz/CSupV/RZ/xZ0wjNvCkSth+o2Qd g==;
X-CSE-ConnectionGUID: xYA+wBfkQjef+IZKPmKypw==
X-CSE-MsgGUID: urhrWRnWR9+2I1INtrGy0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="81922867"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="81922867"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 22:56:54 -0700
X-CSE-ConnectionGUID: H3qiWkbvQeyn0iEq8l16yA==
X-CSE-MsgGUID: 6f3ZUOrhQS+RR9DINoxpbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="241719963"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa004.jf.intel.com with ESMTP; 10 May 2026 22:56:52 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, pranay.samala@intel.com
Subject: [PATCH v3 4/4] drm/i915: Fix color blob reference handling in
 intel_plane_state
Date: Mon, 11 May 2026 11:02:13 +0530
Message-Id: <20260511053213.3122314-5-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260511053213.3122314-1-chaitanya.kumar.borah@intel.com>
References: <20260511053213.3122314-1-chaitanya.kumar.borah@intel.com>
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

Take proper references for hw color blobs (degamma_lut, gamma_lut,
ctm, lut_3d) in intel_plane_duplicate_state() and drop them in
intel_plane_destroy_state().

v2:
- handle blobs in hw state clear

Fixes: 3b7476e786c2 ("drm/i915/color: Add framework to program PRE/POST CSC LUT")
Fixes: a78f1b6baf4d ("drm/i915/color: Add framework to program CSC")
Fixes: 65db7a1f9cf7 ("drm/i915/color: Add 3D LUT to color pipeline")
Reviewed-by: Pranay Samala <pranay.samala@intel.com> #v1
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_plane.c | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index 559eef467dda..54b2c32473cc 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -145,6 +145,15 @@ intel_plane_duplicate_state(struct drm_plane *plane)
 	if (intel_state->hw.fb)
 		drm_framebuffer_get(intel_state->hw.fb);
 
+	if (intel_state->hw.degamma_lut)
+		drm_property_blob_get(intel_state->hw.degamma_lut);
+	if (intel_state->hw.gamma_lut)
+		drm_property_blob_get(intel_state->hw.gamma_lut);
+	if (intel_state->hw.ctm)
+		drm_property_blob_get(intel_state->hw.ctm);
+	if (intel_state->hw.lut_3d)
+		drm_property_blob_get(intel_state->hw.lut_3d);
+
 	return &intel_state->uapi;
 }
 
@@ -168,6 +177,16 @@ intel_plane_destroy_state(struct drm_plane *plane,
 	__drm_atomic_helper_plane_destroy_state(&plane_state->uapi);
 	if (plane_state->hw.fb)
 		drm_framebuffer_put(plane_state->hw.fb);
+
+	if (plane_state->hw.degamma_lut)
+		drm_property_blob_put(plane_state->hw.degamma_lut);
+	if (plane_state->hw.gamma_lut)
+		drm_property_blob_put(plane_state->hw.gamma_lut);
+	if (plane_state->hw.ctm)
+		drm_property_blob_put(plane_state->hw.ctm);
+	if (plane_state->hw.lut_3d)
+		drm_property_blob_put(plane_state->hw.lut_3d);
+
 	kfree(plane_state);
 }
 
@@ -340,6 +359,14 @@ static void intel_plane_clear_hw_state(struct intel_plane_state *plane_state)
 {
 	if (plane_state->hw.fb)
 		drm_framebuffer_put(plane_state->hw.fb);
+	if (plane_state->hw.degamma_lut)
+		drm_property_blob_put(plane_state->hw.degamma_lut);
+	if (plane_state->hw.gamma_lut)
+		drm_property_blob_put(plane_state->hw.gamma_lut);
+	if (plane_state->hw.ctm)
+		drm_property_blob_put(plane_state->hw.ctm);
+	if (plane_state->hw.lut_3d)
+		drm_property_blob_put(plane_state->hw.lut_3d);
 
 	memset(&plane_state->hw, 0, sizeof(plane_state->hw));
 }
-- 
2.25.1

