Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE07E98DF0
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 07:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C9B10E25A;
	Mon, 23 Feb 2026 07:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NP9Ot0GA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D59F10E25C;
 Mon, 23 Feb 2026 07:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771830732; x=1803366732;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fjY621t7jEuFHMYI0nw31wKbfe7oEdTGQB3aIrvSHfg=;
 b=NP9Ot0GA8aLnJugcHgH6+mfA7L+a3hOKKbkjjaKeYhPgizmJ4H2Kipf5
 L2I7gSAdK3HiPCU9ID7SNfhlD6OVKaLe5ZapufXfUnXgjPuxk4zGf1Dmm
 i3sg/4xE+0F7Xvongawg+UFeFRTIWLht5YO4EJ3tz8QM9mfH767Z3GD3M
 l6hfWmb77F+XQKh1T11fw9Q0N2GECSWmZPKbKk2TmhMFauiBXK71Xccai
 w85kKR1q5zrzM5NvBDmsoONruVaXMNAmSfCQ/xP7SvLABzPGcBlo5HIzS
 +x+fsAbbJcjITxg3t9V5lpYN0ECHg7ldPbJLr9Ia1ui0G2QCATIZZ19Vg Q==;
X-CSE-ConnectionGUID: HL1D7CD2QSiQ2f0CgzVl0Q==
X-CSE-MsgGUID: eh5V5lvJQaeiPbxpV+JXFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76680766"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76680766"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 23:12:12 -0800
X-CSE-ConnectionGUID: iUxC3EwVTTKypVp1qiMYww==
X-CSE-MsgGUID: WVyZ4KRUTUCHeXmiXXFjdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="246069099"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa002.jf.intel.com with ESMTP; 22 Feb 2026 23:12:11 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: uma.shankar@intel.com,
	chaitanya.kumar.borah@intel.com
Subject: [PATCH] drm/i915: Fix color blob reference handling in
 intel_plane_state
Date: Mon, 23 Feb 2026 12:17:08 +0530
Message-Id: <20260223064708.540934-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
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

Fixes: 3b7476e786c2 ("drm/i915/color: Add framework to program PRE/POST CSC LUT")
Fixes: a78f1b6baf4d ("drm/i915/color: Add framework to program CSC")
Fixes: 65db7a1f9cf7 ("drm/i915/color: Add 3D LUT to color pipeline")
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_plane.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index 3dc2ed52147f..171cb5e32609 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -144,6 +144,15 @@ intel_plane_duplicate_state(struct drm_plane *plane)
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
 
@@ -167,6 +176,16 @@ intel_plane_destroy_state(struct drm_plane *plane,
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
 
-- 
2.25.1

