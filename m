Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24979FC5923
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 10:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC91E10E8B1;
	Thu, 26 Feb 2026 10:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AK+E5d8T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2F310E8B7;
 Thu, 26 Feb 2026 10:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772100497; x=1803636497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kiNj47tFdPu/EHTNlZe0gRXuojlkHA4+K+fwD22QS+w=;
 b=AK+E5d8T4WUCIs7I9XQuxJrVPY2I2fA6aTsq8gF1QEsLsrPTCmH6fkCE
 wnacgIhpo8+uA5/IJAHuktlYBhCCWTNEV9j3ZrL6L/xYplHlAtmY0f20E
 Pz3ITUlSCvMwz1BGB0U+QcQEbxzoljDmBo/ARi2k1LRwLb63ExesYh0Hs
 0yuRXlk98FNTVd+unDuTPKWcJiyOpi35X4YocaBdpc5iaBoz45LkEXl1t
 gf2lsDgUhGhutsbplbEi+bqhXfhkWlzeJVWmRP32CxXSH246SX8Exfz6y
 1C57IWYgjYTSlLBJ8O84l1942RD1zLclVehffTBgemh+6UU7x6fp+cjrB g==;
X-CSE-ConnectionGUID: LCIYxs85R0u4DpvMSh2mkw==
X-CSE-MsgGUID: m6U48DB+TmmnTVdZSOemJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73029794"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="73029794"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 02:08:16 -0800
X-CSE-ConnectionGUID: q+Domm5hSguhMOsmi95Lsg==
X-CSE-MsgGUID: X2TlwLZNTKSPVL+Olnzatw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="214518210"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.224])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 02:08:15 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 08/19] drm/i915/overlay: Extract i915_overlay_reset()
Date: Thu, 26 Feb 2026 12:07:27 +0200
Message-ID: <20260226100738.29997-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260226100738.29997-1-ville.syrjala@linux.intel.com>
References: <20260226100738.29997-1-ville.syrjala@linux.intel.com>
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

overlay->frontbuffer_bits tracking will move to the i915 side
of the parent vs. display driver split, so extract the reset
part of that into a new function (i915_overlay_reset()).

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index adf419a30c65..9070d88d25b5 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -496,6 +496,17 @@ static int intel_overlay_release_old_vid(struct intel_overlay *overlay)
 	return i915_active_wait(&overlay->last_flip);
 }
 
+static void i915_overlay_reset(struct drm_device *drm)
+{
+	struct intel_display *display = to_intel_display(drm);
+	struct intel_overlay *overlay = display->overlay;
+
+	if (!overlay)
+		return;
+
+	overlay->frontbuffer_bits = 0;
+}
+
 void intel_overlay_reset(struct intel_display *display)
 {
 	struct intel_overlay *overlay = display->overlay;
@@ -506,7 +517,8 @@ void intel_overlay_reset(struct intel_display *display)
 	overlay->old_xscale = 0;
 	overlay->old_yscale = 0;
 	overlay->crtc = NULL;
-	overlay->frontbuffer_bits = 0;
+
+	i915_overlay_reset(display->drm);
 }
 
 static int packed_depth_bytes(u32 format)
-- 
2.52.0

