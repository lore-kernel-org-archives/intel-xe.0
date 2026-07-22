Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04887C44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 13:25:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B4C10E459;
	Wed, 22 Jul 2026 13:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BpkTJkZm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0699410E459;
 Wed, 22 Jul 2026 13:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784726708; x=1816262708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n63XrrkaiRSVS4JqBx26ZNpzyMbnxbxPwdLlKo2nnZU=;
 b=BpkTJkZmamm+33fvzcNOpHBWJxBmWLU1WJuhBcmW9D2SHILCyRIXf7zm
 hu4dgtjpf+N9xBX/yCaH1BAwseU61ER91Q0Gv1mVpWh5wQ8v24oQBKrEQ
 f7Fx+vrYCApaY5Fm0b+bqpLxmbPZIUWON5+zQVRjpkTOVSNNGGbK68B7k
 jFFGP7Nx0WKux/JbqV5QrXVmafvqEoVyOX3p3rCYXBSuKYfr5umzBD3C/
 VLUcRH7jP84oJTNgZrNNAO/B3fL+uwBEhsoH3nVsdI43ddInjGQCe7C3m
 bOjil3hotSdoCipRaL7LlHTi8nJaYCzEtiSzh87nPTferF1T4nZ9bxOP0 g==;
X-CSE-ConnectionGUID: Cww82V52Sm2he163FwRQ/A==
X-CSE-MsgGUID: mNOMGYd6Sfmb57zR/i9/FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96016994"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="96016994"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 06:25:08 -0700
X-CSE-ConnectionGUID: V5bUxEywTRuOKDWzkd0U+A==
X-CSE-MsgGUID: LtesoIx2THWftUcZH0NYjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="254687813"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.191])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 06:25:06 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@linux.intel.com,
 jouni.hogander@intel.com
Subject: [PATCH v2 2/3] drm/i915/fbc: No need of any hardcoded plane width
 limit from LNL+
Date: Wed, 22 Jul 2026 16:24:47 +0300
Message-ID: <20260722132448.318112-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722132448.318112-1-vinod.govindapillai@intel.com>
References: <20260722132448.318112-1-vinod.govindapillai@intel.com>
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

v2: patches squashed and changes in patch descriptions

Bspec: 69560
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index a7d02dd6ca96..20f02ef9387a 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -59,6 +59,7 @@
 #include "intel_fbc_regs.h"
 #include "intel_frontbuffer.h"
 #include "intel_parent.h"
+#include "skl_universal_plane.h"
 
 #define for_each_fbc_id(__display, __fbc_id) \
 	for ((__fbc_id) = INTEL_FBC_A; (__fbc_id) < I915_MAX_FBCS; (__fbc_id)++) \
@@ -1315,10 +1316,18 @@ static bool intel_fbc_surface_size_ok(const struct intel_plane_state *plane_stat
 	return effective_w <= max_w && effective_h <= max_h;
 }
 
-static void intel_fbc_max_plane_size(struct intel_display *display,
+static void intel_fbc_max_plane_size(const struct intel_plane_state *plane_state,
 				     unsigned int *w, unsigned int *h)
 {
-	if (DISPLAY_VER(display) >= 10) {
+	struct intel_display *display = to_intel_display(plane_state);
+	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
+	const struct drm_framebuffer *fb = plane_state->hw.fb;
+	unsigned int rotation = plane_state->hw.rotation;
+
+	if (DISPLAY_VER(display) >= 20) {
+		*w = intel_plane_max_width(plane, fb, 0, rotation);
+		*h = 4096;
+	} else if (DISPLAY_VER(display) >= 10) {
 		*w = 5120;
 		*h = 4096;
 	} else if (DISPLAY_VER(display) >= 8 || display->platform.haswell) {
@@ -1335,10 +1344,9 @@ static void intel_fbc_max_plane_size(struct intel_display *display,
 
 static bool intel_fbc_plane_size_valid(const struct intel_plane_state *plane_state)
 {
-	struct intel_display *display = to_intel_display(plane_state);
 	unsigned int w, h, max_w, max_h;
 
-	intel_fbc_max_plane_size(display, &max_w, &max_h);
+	intel_fbc_max_plane_size(plane_state, &max_w, &max_h);
 
 	w = drm_rect_width(&plane_state->uapi.src) >> 16;
 	h = drm_rect_height(&plane_state->uapi.src) >> 16;
-- 
2.43.0

