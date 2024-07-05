Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A96C3271E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jul 2024 14:53:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B8210EBD9;
	Fri,  5 Jul 2024 14:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PpO6zpAW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB5210EBD9;
 Fri,  5 Jul 2024 14:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720191195; x=1751727195;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5enoQGoUTN8hrFCf2/PCAjfe0QUqPvVVn7XPPHHwFL8=;
 b=PpO6zpAWrz5WDgmfQp2oan9WjtoXF4g9o4fNFSBUfHBXbxICAMwv3YrI
 uzf/NnpQHjtBduGkDw0RfHsrEpVeahhGt1oYz9V7p9URQ9zzvDx5Z0Eb4
 E/Svi66LRnOKKp4WZc9TP4sIf6ppqTFP7MLFc4cBHaqYqsco4h0VHfyHx
 tBnzrhInGPL2s06nOxLDGAcvnI5WSCvf8GZ5K4BFQ1BkkQegt29huu9+v
 vtll0fMcQONq7m+QcV99bsSS/7kIAV1boMXvmYpqk88MZgUCrRFb2woJe
 N8RZfd8/gvkYCi9CtiI0Xpc4k9KMlc5CLnZKL68q9fw3GXwdIhSwA4IVo w==;
X-CSE-ConnectionGUID: DpWQ5K4BQn6OdCayALs0ug==
X-CSE-MsgGUID: xp61PqOeReOiuHYpqEqONQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17204744"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="17204744"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 07:53:15 -0700
X-CSE-ConnectionGUID: NBv69Iq4TgWVKQ2PIsohFg==
X-CSE-MsgGUID: cGI4X8beSxy6lly8vKUeqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="46864390"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 05 Jul 2024 07:53:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 05 Jul 2024 17:53:12 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 06/20] drm/i915/fbc:
 s/intel_fbc_hw_tracking_covers_screen()/intel_fbc_surface_size_ok()/
Date: Fri,  5 Jul 2024 17:52:40 +0300
Message-ID: <20240705145254.3355-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240705145254.3355-1-ville.syrjala@linux.intel.com>
References: <20240705145254.3355-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Rename intel_fbc_hw_tracking_covers_screen() to intel_fbc_surface_size_ok()
so that the naming scheme is the same for the surface size vs. plane
size checks. "surface size" is what bspec talks about.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index c7fd774440a8..40a3b4937dc5 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1102,7 +1102,7 @@ static void intel_fbc_max_surface_size(struct intel_display *display,
  * the X and Y offset registers. That's why we include the src x/y offsets
  * instead of just looking at the plane size.
  */
-static bool intel_fbc_hw_tracking_covers_screen(const struct intel_plane_state *plane_state)
+static bool intel_fbc_surface_size_ok(const struct intel_plane_state *plane_state)
 {
 	struct intel_display *display = to_intel_display(plane_state->uapi.plane->dev);
 	unsigned int effective_w, effective_h, max_w, max_h;
@@ -1354,7 +1354,7 @@ static int intel_fbc_check_plane(struct intel_atomic_state *state,
 		return 0;
 	}
 
-	if (!intel_fbc_hw_tracking_covers_screen(plane_state)) {
+	if (!intel_fbc_surface_size_ok(plane_state)) {
 		plane_state->no_fbc_reason = "surface size too big";
 		return 0;
 	}
-- 
2.44.2

