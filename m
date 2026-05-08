Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26196CD3436
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 14:34:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80C410F503;
	Fri,  8 May 2026 14:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LAohuOH5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCEE10F502;
 Fri,  8 May 2026 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778250885; x=1809786885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lulrMpw5Dk6/2JsIseyxd7vnr4SfxQuipiIjhnkbX+0=;
 b=LAohuOH5aHLCBwDGBoVar2PmyTay074hpEl4j+THrrJjIHTO62m4rFu4
 x3t70HG7CAWwuxa6jqMCwX+z+1RIo/1ZfSNvyyN/QC2C7rMLB4Z6b+kwJ
 Q0HsWcev8LAYEQhJFILyDlUtoaIDJWPvYtfZyMNgGMmyOgzfWQuZV0RqY
 HfDGCPV8ExY0E+ASUs5Ldpql0uZ5AlV7u292Lw2uLmvPsSQTnIUbzx0P/
 dzWnNJIiNZF4cBEVVAFS4POQMD7K5ldETLtvfAyMynPG9oIxqc7Q8Zl4n
 FpUD/w8VRmfyJBs6LP6jDJN/ZVvw9Gze1hT+TaBSBSRiQGdWkUescHR/s Q==;
X-CSE-ConnectionGUID: 4X0YLtrcSXmxRt8v9vsnrQ==
X-CSE-MsgGUID: /h61pLmzTS28laHD6Or3Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="89808858"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="89808858"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 07:34:45 -0700
X-CSE-ConnectionGUID: gGkqCgSyRbq556GRWRAeXw==
X-CSE-MsgGUID: b220K9o+TYGzhif6d5BHaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="237024095"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.104])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 07:34:43 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 03/16] drm/i915: Move the i915_dpt_offset()==0 assert
Date: Fri,  8 May 2026 17:34:13 +0300
Message-ID: <20260508143426.26504-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260508143426.26504-1-ville.syrjala@linux.intel.com>
References: <20260508143426.26504-1-ville.syrjala@linux.intel.com>
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

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
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

