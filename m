Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FF7C44514
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 23:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C74C10F41E;
	Thu, 16 Jul 2026 23:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hMBy12s9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2298810F41E;
 Thu, 16 Jul 2026 23:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784242816; x=1815778816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a/dpIBp7Wmj4esvcsCFLW9xinPuSwiU5BAh1WoEK7ys=;
 b=hMBy12s9kT4j589RJOBNuSTXXrWpoGp4MjYiRxfF3v9qzWDVQb8Erbxn
 B3YH1/gZ0Vm23zVVRBqV2fw8N509RTywd6MSMDiTR8zufEMSi+EvzTG0h
 CvEqtCtoAos/Mh6OEcbas8fpXryxuoo4aVJnyDMuMOiIzIkWVB1rFGf0n
 Y85wv02RJ7UIVsXqZT1GiqHyVbd4QNMM8Rx/J57Koszw/GrHNggY1UEya
 XZ6QgPVek5LqT8NZBOgwveDRxNabr4qSy2mobvrpTVLlwUrtrmq0YBz+x
 04oMFq4/FZOfBrD7DAhSFUyuQ4PFAKFvi10tzoI28Om4i4qmYZwKhvDlT w==;
X-CSE-ConnectionGUID: P6kuNggmSIGkTObn4vLAlA==
X-CSE-MsgGUID: 1rZRoFsgToSEVW5+FBIz/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="107711299"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="107711299"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 16:00:15 -0700
X-CSE-ConnectionGUID: 6WRdziacRS2fxTXNHVb1FA==
X-CSE-MsgGUID: knexvNXgRSC5ns7Q0HYyvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="252227118"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.15])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 16:00:13 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH 2/4] drm/i915/fbc: refactor maximum plane size handling for fbc
Date: Fri, 17 Jul 2026 01:59:54 +0300
Message-ID: <20260716225956.555995-3-vinod.govindapillai@intel.com>
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

Restrictions to enable FBC based on fixed plane width and height
have been improving in newer platforms and eventualy may allow
the maximum plane size as per the platform resolution support.
Update the function which checks such a size restriction to have
the possibility to get the maximum plane width and height
compared rather than the hard coded values.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index a7d02dd6ca96..78228a5e765f 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1315,9 +1315,11 @@ static bool intel_fbc_surface_size_ok(const struct intel_plane_state *plane_stat
 	return effective_w <= max_w && effective_h <= max_h;
 }
 
-static void intel_fbc_max_plane_size(struct intel_display *display,
+static void intel_fbc_max_plane_size(const struct intel_plane_state *plane_state,
 				     unsigned int *w, unsigned int *h)
 {
+	struct intel_display *display = to_intel_display(plane_state);
+
 	if (DISPLAY_VER(display) >= 10) {
 		*w = 5120;
 		*h = 4096;
@@ -1335,10 +1337,9 @@ static void intel_fbc_max_plane_size(struct intel_display *display,
 
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

