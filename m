Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF384CD6E64
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 08:54:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A08113000;
	Mon,  1 Jun 2026 08:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JR5rvxdR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90D2112FFF;
 Mon,  1 Jun 2026 08:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780304063; x=1811840063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rl4xuY1v9VBtAe/BpnRqX4uCDCp+AZh+liY7lQ03n5g=;
 b=JR5rvxdRouxfZwr2a92/sI2SQEMuTK2pl2KNgudh3zU52Kw86LdSVLIF
 oCHIS0W5tBu/GdVy7FMrFEEG7h9lD9FiTDNrtga/3zY9cdbZXmDNUAjTd
 yBnN9Z7LXwevH37GZR5UEtAKYV1TyUim5HG3OvOQ2twVMpK+vFgLFZv5c
 8QINAgYnJk+34uxpTSR9LfdPuDJ3RyHMVBb2d9Dvth/gm496Yx3UJ4DRY
 4N/ZA4TsjREAVDVGhA3FfnbLiktJTfJG3HXlm8sce1JqgoSZ6WuI5GO/o
 Hr8GXk+UYwSnErMJfhla+KUqBmbRUUKQ8IThOASzwD77ZkFDLwY936a5o A==;
X-CSE-ConnectionGUID: JFR7DDZmT+i5f1OArrxIbQ==
X-CSE-MsgGUID: 7l99cSteQDi9sn0d9BggHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="91368925"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="91368925"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 01:54:23 -0700
X-CSE-ConnectionGUID: vPz26myOQSO1bqY57bHFaw==
X-CSE-MsgGUID: MChDPTJNQaCjQbQvM+58RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="239110460"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa006.fm.intel.com with ESMTP; 01 Jun 2026 01:54:20 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, pranay.samala@intel.com,
 stable@vger.kernel.org
Subject: [v4 3/3] drm/i915: Fix color blob reference handling in
 intel_plane_state
Date: Mon,  1 Jun 2026 13:59:53 +0530
Message-Id: <20260601082953.128539-4-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260601082953.128539-1-chaitanya.kumar.borah@intel.com>
References: <20260601082953.128539-1-chaitanya.kumar.borah@intel.com>
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

Cc: <stable@vger.kernel.org> #v6.19+
Fixes: 3b7476e786c2 ("drm/i915/color: Add framework to program PRE/POST CSC LUT")
Fixes: a78f1b6baf4d ("drm/i915/color: Add framework to program CSC")
Fixes: 65db7a1f9cf7 ("drm/i915/color: Add 3D LUT to color pipeline")
Reviewed-by: Pranay Samala <pranay.samala@intel.com> #v1
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_plane.c | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index b8348c0189aa..3eaf82477f49 100644
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

