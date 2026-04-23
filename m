Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72558FDEE29
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 16:54:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D7910E341;
	Thu, 23 Apr 2026 16:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LKnAnUz5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF2810F1D1;
 Thu, 23 Apr 2026 16:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776963245; x=1808499245;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wKsH4uJzTkCOyuVV99r4OKPFDOnPrH5KEYi5hOuuxXw=;
 b=LKnAnUz5GwBfoUSVcsAcIlvKvU0YtSSoIayxw+THZnvKGL2QXrKKrzDB
 ZeHe5+aI7aKK2sTW9YDiafacsAJ5pPmUJY9SFwAS8YobZQDa+o1Cm0Nby
 GbsBL4Q+C6dEi41Up64ht5Sp0xDb53tY5IpYZdC8qfUu2gK9hkaIq3z2t
 0s7r89ze5NWfyQfK1PnVBBHUaDLjlp8SBHMIa0/A9/hAveogVxmTwrLwb
 8V0kDfRuJ4dRvhh5jLhGKFBWniLKsKHsnQ2XuS4r5MekT2xrKPPA28ThD
 VQxnAjmVYtQ80pPJv8fgDxuCdHKG3VOXHp+SoQ77E0Vpf+dows1NPYbMK w==;
X-CSE-ConnectionGUID: tmvwC/yXQM+JvrIdb3Krgw==
X-CSE-MsgGUID: SkF+k88PQ/awA6fTaxAWSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="88245172"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="88245172"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 09:54:05 -0700
X-CSE-ConnectionGUID: RtViTHJ8TqWtmpx1C/6Eaw==
X-CSE-MsgGUID: A0Ig61LFReqZmtd7RH4pdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="237765136"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.188])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 09:54:03 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 03/16] drm/i915: Move the i915_dpt_offset()==0 assert
Date: Thu, 23 Apr 2026 19:53:32 +0300
Message-ID: <20260423165346.20884-4-ville.syrjala@linux.intel.com>
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

Move the i915_dpt_offset() check into the lower level
intel_fb_pin_to_dpt() function. Clears out some of the unnecessary
junk from the higher level code, making it easier to introduce
the new fb_pin parent interface.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_fb_pin.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_fb_pin.c b/drivers/gpu/drm/i915/i915_fb_pin.c
index b800b55530a5..400ad8768c11 100644
--- a/drivers/gpu/drm/i915/i915_fb_pin.c
+++ b/drivers/gpu/drm/i915/i915_fb_pin.c
@@ -101,6 +101,12 @@ intel_fb_pin_to_dpt(struct drm_gem_object *_obj, struct intel_dpt *dpt,
 	i915_gem_object_flush_if_display(obj);
 
 	i915_vma_get(vma);
+
+	/*
+	 * The DPT object contains only one vma, and there is no VT-d
+	 * guard, so the VMA's offset within the DPT is always 0.
+	 */
+	drm_WARN_ON(&i915->drm, i915_dpt_offset(vma));
 err:
 	atomic_dec(&i915->pending_fb_pin);
 
@@ -255,7 +261,6 @@ int intel_plane_pin_fb(struct intel_plane_state *plane_state,
 		       const struct intel_plane_state *old_plane_state)
 {
 	struct intel_display *display = to_intel_display(plane_state);
-	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
 	const struct intel_framebuffer *fb =
 		to_intel_framebuffer(plane_state->hw.fb);
@@ -304,12 +309,6 @@ int intel_plane_pin_fb(struct intel_plane_state *plane_state,
 		plane_state->dpt_vma = vma;
 
 		WARN_ON(plane_state->ggtt_vma == plane_state->dpt_vma);
-
-		/*
-		 * The DPT object contains only one vma, and there is no VT-d
-		 * guard, so the VMA's offset within the DPT is always 0.
-		 */
-		drm_WARN_ON(&i915->drm, i915_dpt_offset(plane_state->dpt_vma));
 	}
 
 	/*
-- 
2.52.0

