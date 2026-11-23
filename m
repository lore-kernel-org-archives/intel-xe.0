Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217E4606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 09:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=La0Qbody
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79DC10EB82;
	Mon, 23 Nov 2026 09:25:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1BB10EB82;
 Mon, 23 Nov 2026 09:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795425951; x=1826961951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/lruYxMOhxSjztV+nS1l1EEJ/Zh3EcWVG4jULWKX7yQ=;
 b=La0Qbodyp1Y3riTN8fJd2J1p4dVhLgXEsUwpHoQ0VCXfGPScrlo4MuB8
 Vd3dPBqtQ6A8hJktbTffq2boTYAZhrmZYJ438MTVV0QQ2P9NGGS6wnZQ8
 nOXnLFC1lXm8VdmYjBBgzUTMjLRZZDkTfcCg2skpQLFhfJpE8rvhhnQ/S
 2KZvpWWPzriGlrPXdC4hY/g3dXXbYwQQh5ldioY7xM0T2Efii7FVKJiwI
 ZyQDtJRx8RRFI7/ckMPtJ837cGTrlOETUJLoc904Qb8a2TnALDmi5G/QI
 bTxj2d+1VXcQ9RwoVr/yq06pH2cb4Pn1tRIMRRE8S5Quzpp8CY0Myo2Nr g==;
X-CSE-ConnectionGUID: RG22SkX9R4u7Xu5eyggzRw==
X-CSE-MsgGUID: 7WxrxaT7TSKTTFPCGYnfwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4235931"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4235931"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:25:51 -0800
X-CSE-ConnectionGUID: uBU802RTQGCcZmJAMPhGiw==
X-CSE-MsgGUID: M3+IMeOpTmqTt0LaT2iV4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11268168"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa002.jf.intel.com with ESMTP; 23 Nov 2026 01:25:50 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [PATCH v2] drm/i915/color: Program the 3D LUT on the plane's own pipe
 with joiner
Date: Mon, 23 Nov 2026 14:32:51 +0530
Message-ID: <20261123090251.934904-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119165925.683691-1-chaitanya.kumar.borah@intel.com>
References: <20261119165925.683691-1-chaitanya.kumar.borah@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With joiner, a secondary pipe plane gets its hw state from the primary
pipe's plane, but its own uapi.crtc stays NULL. intel_color_load_3dlut()
and intel_color_plane_commit_arm() take the CRTC from uapi.crtc, so they
skip the secondary plane and its pipe's 3D LUT is never loaded or
enabled, leaving that part of the screen without it.

Use hw.crtc, the CRTC the plane is actually on. The linked Y-plane of a
planar YUV scanout also has hw.crtc set but no 3D LUT state of its own,
so skip it in intel_color_plane_commit_arm() to keep it from clearing
LUT_3D_CTL.

v2:
- Correct the commit message (Sashiko)
- Skip the linked Y-plane (Sashiko)

Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>
Fixes: 65db7a1f9cf7 ("drm/i915/color: Add 3D LUT to color pipeline")
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
Matthew, the is_y_plane check is only needed to keep this patch
regression free on its own: with hw.crtc the linked Y-plane would
otherwise reach glk_lut_3d_commit() and clear LUT_3D_CTL. If you
rebase your series on top of this patch, the check can be dropped in
your patch 1 [1], since the owning-plane check there already skips
the Y-plane, which is never PLANE_PRIMARY.

[1] https://lore.kernel.org/intel-gfx/20261118191514.2931270-2-matthew.schwartz@linux.dev/

 drivers/gpu/drm/i915/display/intel_color.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 4070dc8d97d9..e5d40575aa95 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4278,7 +4278,11 @@ void intel_color_plane_commit_arm(struct intel_dsb *dsb,
 				  const struct intel_plane_state *plane_state)
 {
 	struct intel_display *display = to_intel_display(plane_state);
-	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
+	struct intel_crtc *crtc = to_intel_crtc(plane_state->hw.crtc);
+
+	/* The linked Y-plane has no 3D LUT state of its own */
+	if (plane_state->is_y_plane)
+		return;
 
 	if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
 		glk_lut_3d_commit(dsb, crtc, !!plane_state->hw.lut_3d);
@@ -4318,7 +4322,7 @@ intel_color_load_3dlut(struct intel_dsb *dsb,
 		       const struct intel_plane_state *plane_state)
 {
 	struct intel_display *display = to_intel_display(plane_state);
-	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
+	struct intel_crtc *crtc = to_intel_crtc(plane_state->hw.crtc);
 
 	if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
 		glk_load_lut_3d(dsb, crtc, plane_state->hw.lut_3d);
-- 
2.50.1

