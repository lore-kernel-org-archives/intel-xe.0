Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01DE606A325
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 17:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UfL9Z3zQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B9410ECA9;
	Thu, 19 Nov 2026 17:22:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C97A10E5AD;
 Thu, 19 Nov 2026 17:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795108948; x=1826644948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bI4/yJI19LpfwRreqXrGmSQsYYRm4+Xlf05gPkY87mY=;
 b=UfL9Z3zQOyxfodoiIlh7u4KOTtHHedGQK0nM7C2rVHvC8CkTD+RwF6C+
 f1SmWWUIbMODCe3MpxZ8rfDz8k5bkwBmWlzY8GlbgjJMRnshqYzAe59qm
 QksuefcM3BS//J42GNAvecxmPeV+7DKhJHpXU7u8AeMczjNURNYpLHiGs
 PEnXfbJEnye1WtL0gj+/S54Jqu6zTlai16wNRyNsdAzk6O9lRs9zT3GZ1
 EXoJqcNdQHf2Dey2zOdhn5iI3n1qzdENhBA6bnDT/mQysZ/TaeLpWZchY
 QRzThe/j3qZnspWRo2bw59no9RcNQdH/Pv9LHpLHhS7HKbUlsyanwTKXt A==;
X-CSE-ConnectionGUID: T2qKyq+YTUSxKvBlqzu/FA==
X-CSE-MsgGUID: QUr1CuBGTQePHorEo59Acw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3961730"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3961730"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 09:22:27 -0800
X-CSE-ConnectionGUID: HWFSRE5FRVa/faNlVQwf3w==
X-CSE-MsgGUID: hR2VtrSFS4G0kTjTSMkHsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10515021"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa002.jf.intel.com with ESMTP; 19 Nov 2026 09:22:26 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH] drm/i915/color: Program the 3D LUT on the plane's own pipe
 with joiner
Date: Thu, 19 Nov 2026 22:29:25 +0530
Message-ID: <20261119165925.683691-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
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

With joiner, a secondary pipe plane's uapi.crtc points at the primary
CRTC. intel_color_load_3dlut() and intel_color_plane_commit_arm() use
it, so the 3D LUT is loaded and enabled twice on the primary pipe and
never on the secondary, leaving the secondary pipe's part of the screen
without it.

Use hw.crtc, the CRTC the plane is actually on.

Cc: Uma Shankar <uma.shankar@intel.com>
Fixes: 65db7a1f9cf7 ("drm/i915/color: Add 3D LUT to color pipeline")
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 4070dc8d97d9..9060c29de533 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4278,7 +4278,7 @@ void intel_color_plane_commit_arm(struct intel_dsb *dsb,
 				  const struct intel_plane_state *plane_state)
 {
 	struct intel_display *display = to_intel_display(plane_state);
-	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
+	struct intel_crtc *crtc = to_intel_crtc(plane_state->hw.crtc);
 
 	if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
 		glk_lut_3d_commit(dsb, crtc, !!plane_state->hw.lut_3d);
@@ -4318,7 +4318,7 @@ intel_color_load_3dlut(struct intel_dsb *dsb,
 		       const struct intel_plane_state *plane_state)
 {
 	struct intel_display *display = to_intel_display(plane_state);
-	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
+	struct intel_crtc *crtc = to_intel_crtc(plane_state->hw.crtc);
 
 	if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
 		glk_load_lut_3d(dsb, crtc, plane_state->hw.lut_3d);
-- 
2.50.1

