Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB889CD5BB1
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 13:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E25810F5FF;
	Fri, 22 May 2026 13:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NEaXCPGn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0DA10F5FF;
 Fri, 22 May 2026 13:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779457393; x=1810993393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DzDJMhY/IhdakaoW/1M+W31oPxzn7iTFyYba0LI4Idk=;
 b=NEaXCPGnZUWa9WCzEhXt6WCzQyixcLNMWVpsw1z0sYf+MOZnqDN7dpcc
 kH4HmRzzUHLQbOuV4EnSM8C6BY4BYLr0+MPG3l6aCyZw954IZ2ivlcZ3N
 LMGe9ekBLC8usy6T6k7UU5FDxf9GEmoirEd7Bi1xka2ZT4ZBlwDFhSm/i
 DsA9zyAO6Yq48LMAxrBFFhE34HORfn9dPMHLmAaDUM09SlMwb7HWAvGRH
 +ZaymKRjC+fgiTijuKEbS3BQsM7T6gjMUE2p4LJ/+ri4FyvQzYt8GIXPr
 viFBva7I3oQFgZDrihnMA6ntmN8r0wPEUwh9oQxWyzJc4exbCF0oclyTt A==;
X-CSE-ConnectionGUID: hnjU6jGIQCWtSHS3YC7g5Q==
X-CSE-MsgGUID: fjeXrgedROWFIPp3f6Eotw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="105850608"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="105850608"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 06:43:13 -0700
X-CSE-ConnectionGUID: SJzMFItbSDCsKfAZRkgPcA==
X-CSE-MsgGUID: WJPhKzcaTwCnASs138eXwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="238317223"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 06:43:11 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 navaremanasi@google.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 5/6] drm/i915/intel_panel: Use highest refresh rate mode for
 VRR panels
Date: Fri, 22 May 2026 18:55:10 +0530
Message-ID: <20260522132511.321540-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260522132511.321540-1-ankit.k.nautiyal@intel.com>
References: <20260522132511.321540-1-ankit.k.nautiyal@intel.com>
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

intel_panel_fixed_mode() intends to choose a fixed mode at or above the
requested refresh rate for VRR panels, so the requested refresh can be
reached by extending vblank.

However, as per the current logic in is_best_fixed_mode(), the helper
can return a lower refresh rate mode if it appears first in the list of
fixed modes. This is because is_best_fixed_mode() picks the closest
match, and the VRR check only rejects candidates where both rates are in
VRR range and the candidate is lower, but the first mode bypasses this
via the !best_mode early return.

For seamless switch features like LRR (Lower Refresh Rate) this creates
a problem as selecting a lower fixed mode results in a change in
vsync_start/end, forcing a full modeset.

To fix this, introduce need_higher_rr_mode() which returns true for all
VRR capable panels when the requested rate is in VRR range. When true,
intel_panel_fixed_mode() returns the highest refresh rate mode upfront,
which can then be reduced to match the requested vrefresh by extending
the vblank length.

Also remove the VRR check from is_best_fixed_mode() since the selection
is now handled upfront in intel_panel_fixed_mode().

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_panel.c | 37 ++++++++++++++--------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 2765d87ddca7..1c2a8cd454be 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -59,29 +59,32 @@ intel_panel_preferred_fixed_mode(struct intel_connector *connector)
 					struct drm_display_mode, head);
 }
 
-static bool is_best_fixed_mode(struct intel_connector *connector,
-			       int vrefresh, int fixed_mode_vrefresh,
+static bool is_best_fixed_mode(int vrefresh, int fixed_mode_vrefresh,
 			       const struct drm_display_mode *best_mode)
 {
 	/* we want to always return something */
 	if (!best_mode)
 		return true;
 
-	/*
-	 * With VRR always pick a mode with equal/higher than requested
-	 * vrefresh, which we can then reduce to match the requested
-	 * vrefresh by extending the vblank length.
-	 */
-	if (intel_vrr_is_in_range(connector, vrefresh) &&
-	    intel_vrr_is_in_range(connector, fixed_mode_vrefresh) &&
-	    fixed_mode_vrefresh < vrefresh)
-		return false;
-
 	/* pick the fixed_mode that is closest in terms of vrefresh */
 	return abs(fixed_mode_vrefresh - vrefresh) <
 		abs(drm_mode_vrefresh(best_mode) - vrefresh);
 }
 
+static bool need_higher_rr_mode(struct intel_connector *connector,
+				const struct drm_display_mode *mode)
+{
+	int vrefresh = drm_mode_vrefresh(mode);
+
+	if (!intel_vrr_is_capable(connector))
+		return false;
+
+	if (!intel_vrr_is_in_range(connector, vrefresh))
+		return false;
+
+	return true;
+}
+
 const struct drm_display_mode *
 intel_panel_fixed_mode(struct intel_connector *connector,
 		       const struct drm_display_mode *mode)
@@ -89,10 +92,18 @@ intel_panel_fixed_mode(struct intel_connector *connector,
 	const struct drm_display_mode *fixed_mode, *best_mode = NULL;
 	int vrefresh = drm_mode_vrefresh(mode);
 
+	/*
+	 * With VRR always pick the highest refresh rate mode,
+	 * which we can then reduce to match the requested
+	 * vrefresh by extending the vblank length.
+	 */
+	if (need_higher_rr_mode(connector, mode))
+		return intel_panel_highest_vrefresh_mode(connector);
+
 	list_for_each_entry(fixed_mode, &connector->panel.fixed_modes, head) {
 		int fixed_mode_vrefresh = drm_mode_vrefresh(fixed_mode);
 
-		if (is_best_fixed_mode(connector, vrefresh,
+		if (is_best_fixed_mode(vrefresh,
 				       fixed_mode_vrefresh, best_mode))
 			best_mode = fixed_mode;
 	}
-- 
2.45.2

