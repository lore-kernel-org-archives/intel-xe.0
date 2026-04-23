Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35429FDEE29
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 16:54:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF58710F201;
	Thu, 23 Apr 2026 16:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VSQN50qk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E0C10F1F3;
 Thu, 23 Apr 2026 16:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776963271; x=1808499271;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=enf31ndGpwUsrdaTHFfsrWNRg3SKgJAp4F+kNgRmFwg=;
 b=VSQN50qkMEoxMeVYzc7xFJ7C+0uP/mEnUD0hVL0HGkI2t/rYSfdkWDK9
 aC1Ec3hXdgntgu0PU4B1R2excKPpw5Qu/J0bX87zstW2BaauLjRRlFye8
 BTh2MDoPxuMzLQ2i/T/0Uotxs2MwxKU7S6OfWqpKgb8L2pRkYCysLg5rb
 ASV245/7kQ2B1onQPdp5UOZH8BwAHNe/aBaBpd3MYA4HWmwCAwG8653B3
 zDBgBroCJqnub5RQSaE6BDsgptTY6m7saJ3M19bRDw/fWTGEiSI1IuiDM
 pe/i86wlfl4ryTXUoJKRbtzWHhsB4V+j9vIciYtHil2RLHQChyTXMXc3r g==;
X-CSE-ConnectionGUID: FP/W9fEaTpare2vL11H+kw==
X-CSE-MsgGUID: ryQg6uhGQJ2x8NTPoH+iVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="81799500"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="81799500"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 09:54:31 -0700
X-CSE-ConnectionGUID: Ex//Y13TTa2TumsQ2Sb5gQ==
X-CSE-MsgGUID: ++MrGcQ5Qh2t6GzOdQkpiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="232560146"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.188])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 09:54:29 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 09/16] drm/xe: Reorganize intel_plane_pin_fb() a bit
Date: Thu, 23 Apr 2026 19:53:38 +0300
Message-ID: <20260423165346.20884-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260423165346.20884-1-ville.syrjala@linux.intel.com>
References: <20260423165346.20884-1-ville.syrjala@linux.intel.com>
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

Move most of the plane state stuff out from the inner parts
of intel_plane_pin_fb(). The plan is to take those inner parts and
abstract them into the new fb_pin parent interface, and we don't
want any plane_state stuff there.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index bbeb5c2a6c51..9774089ee75c 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -459,26 +459,30 @@ int intel_plane_pin_fb(struct intel_plane_state *new_plane_state,
 {
 	struct drm_framebuffer *fb = new_plane_state->hw.fb;
 	struct drm_gem_object *obj = intel_fb_bo(fb);
-	struct i915_vma *vma;
 	struct intel_plane *plane = to_intel_plane(new_plane_state->uapi.plane);
 	struct intel_fb_pin_params pin_params = {
 		.view = &new_plane_state->view.gtt,
 		.alignment = plane->min_alignment(plane, fb, 0),
 		.needs_cpu_lmem_access = intel_fb_needs_cpu_access(fb),
 	};
+	struct i915_vma *ggtt_vma = NULL;
+	struct i915_vma *dpt_vma = NULL;
+	int fence_id = -1;
+	u32 offset;
 
 	if (reuse_vma(new_plane_state, old_plane_state))
 		return 0;
 
-	vma = __xe_pin_fb_vma(obj, intel_fb_uses_dpt(fb), &pin_params);
+	ggtt_vma = __xe_pin_fb_vma(obj, intel_fb_uses_dpt(fb), &pin_params);
+	if (IS_ERR(ggtt_vma))
+		return PTR_ERR(ggtt_vma);
 
-	if (IS_ERR(vma))
-		return PTR_ERR(vma);
+	offset = xe_ggtt_node_addr(ggtt_vma->node);
 
-	new_plane_state->ggtt_vma = vma;
-
-	new_plane_state->surf = xe_ggtt_node_addr(new_plane_state->ggtt_vma->node) +
-		plane->surf_offset(new_plane_state);
+	new_plane_state->dpt_vma = dpt_vma;
+	new_plane_state->ggtt_vma = ggtt_vma;
+	new_plane_state->fence_id = fence_id;
+	new_plane_state->surf = offset + plane->surf_offset(new_plane_state);
 
 	return 0;
 }
-- 
2.52.0

