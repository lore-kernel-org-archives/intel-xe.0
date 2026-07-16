Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB524C44514
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 23:00:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CA510F422;
	Thu, 16 Jul 2026 23:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qwvp7puh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E7810F41F;
 Thu, 16 Jul 2026 23:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784242818; x=1815778818;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2rh3RM6K1QP8aU3kQ1qqG7DVXlfidy1gCCKjvQE7f+0=;
 b=Qwvp7puhve7/JYA093TOiuwoAWjHQO8oJRhbSNsJLpHCjlN5X3197MhP
 I3KZYC+yU1kG01HZxpYXe+W+kcW53n7FBdCiBRmfIKQVEnaN1afEy7V3L
 vNlAiWqBi/xL4vdEjz9y+tVewOkbNdSdJrWhfm8klcgYH3IuAcDH7JOBh
 F7pIfGHDK0QiX9RFjEBEq24AndfrAvLe1pVHEOOKQH2RTqM3Zyz3VD0Vt
 MMU0ZYrTcwtf/S/fjFOWAitoIXxZeffG5DucCgMIZN82mxOLRScQaBsA2
 ge2sutMc97A/r3y5DSXq/C1gvo5Ewb5ocs6uYaurFzowyBEYyNK968KlB w==;
X-CSE-ConnectionGUID: QZFdaY7qRJ+mPgQxLU05Wg==
X-CSE-MsgGUID: nDzU5e/KRYCt2yLdLALYOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="107711302"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="107711302"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 16:00:18 -0700
X-CSE-ConnectionGUID: 3NXZ9s9SRR66ZCxlsSIFGQ==
X-CSE-MsgGUID: dPuxv0yJSY+ZF+Wr9YDcPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="252227132"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.15])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 16:00:16 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH 3/4] drm/i915/fbc: xe2_lpd+ don't require any hardcoded plane
 width limit
Date: Fri, 17 Jul 2026 01:59:55 +0300
Message-ID: <20260716225956.555995-4-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716225956.555995-1-vinod.govindapillai@intel.com>
References: <20260716225956.555995-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

In xe2_lpd+ platforms, there are no restrictions to enable FBC
on planes with respect to the plane width - width can be as per
the platform's maximum supported resolution.

Bspec: 69560
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 78228a5e765f..20f02ef9387a 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -59,6 +59,7 @@
 #include "intel_fbc_regs.h"
 #include "intel_frontbuffer.h"
 #include "intel_parent.h"
+#include "skl_universal_plane.h"
 
 #define for_each_fbc_id(__display, __fbc_id) \
 	for ((__fbc_id) = INTEL_FBC_A; (__fbc_id) < I915_MAX_FBCS; (__fbc_id)++) \
@@ -1319,8 +1320,14 @@ static void intel_fbc_max_plane_size(const struct intel_plane_state *plane_state
 				     unsigned int *w, unsigned int *h)
 {
 	struct intel_display *display = to_intel_display(plane_state);
+	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
+	const struct drm_framebuffer *fb = plane_state->hw.fb;
+	unsigned int rotation = plane_state->hw.rotation;
 
-	if (DISPLAY_VER(display) >= 10) {
+	if (DISPLAY_VER(display) >= 20) {
+		*w = intel_plane_max_width(plane, fb, 0, rotation);
+		*h = 4096;
+	} else if (DISPLAY_VER(display) >= 10) {
 		*w = 5120;
 		*h = 4096;
 	} else if (DISPLAY_VER(display) >= 8 || display->platform.haswell) {
-- 
2.43.0

