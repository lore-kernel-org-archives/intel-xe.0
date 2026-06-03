Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFA2CD6E57
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 15:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D7010FFB7;
	Wed,  3 Jun 2026 15:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f51bbBDG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4CE10FFB7;
 Wed,  3 Jun 2026 15:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780499685; x=1812035685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gKHd7QtoGmDNV4QBhd0YIvS4M2aBLRH6fdytAXAhGwk=;
 b=f51bbBDGWPLSdoZUcKYYvzkY31trugp/Ktlwc+RLffiofmjgKuLNRuv0
 eiKkIuyyYMGfp8ElCQuTwDc4iypnzdieeKygUqxLzyBmgXzUmERq1I4wc
 aY8j0aNcnP+Dt6YpvejjSZYv6hZSVsN/QBPyRcqw7EmyZyViJ/6BxlViO
 k/gv1HR+VQTJsspl7tQNbj586QKdQDHMkzMcGFtJVYErPmZynkAc7ax8K
 HLm+c4eX3X6hGgBifLYXlMtgL8jg0vKxZS+3htOhRRqex/eT/RvQIo4V2
 IITsbwThRoO0FbeS5tbr2OQTzbEBZPKxX9tMk5oXZrzPWkKKbKUTVRlD8 Q==;
X-CSE-ConnectionGUID: 41nFfGw6TX6Sdmj7Ouh+zg==
X-CSE-MsgGUID: sbCkR3SjTDq6YwPIYKrKtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="92421173"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="92421173"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:14:45 -0700
X-CSE-ConnectionGUID: NC5g+taYS+uWdwXmcxLZOg==
X-CSE-MsgGUID: SxGDybrBRFCyvVbFq1dKLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="244380762"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.189])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:14:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 1/8] drm/i915/color: clean up variables in
 xelpd_program_plane_pre_csc_lut()
Date: Wed,  3 Jun 2026 18:14:28 +0300
Message-ID: <92d8a508ab18dfd33b6e5573e6edf433f1bbd321.1780499355.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780499355.git.jani.nikula@intel.com>
References: <cover.1780499355.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

Use plain int for counting. Initialize lut_size at declaration. Remove
unnecessary lut_val initialization. Remove extra u32 v and just use
lut_val.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 458508bcf1f4..73ab879915c3 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3967,12 +3967,10 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 	enum pipe pipe = to_intel_plane(state->plane)->pipe;
 	enum plane_id plane = to_intel_plane(state->plane)->id;
 	const struct drm_color_lut32 *pre_csc_lut = plane_state->hw.degamma_lut->data;
-	u32 i, lut_size;
-	u32 lut_val = 1 << 24;
+	int i, lut_size = 128;
+	u32 lut_val;
 
 	if (icl_is_hdr_plane(display, plane)) {
-		lut_size = 128;
-
 		intel_de_write_dsb(display, dsb,
 				   PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
 				   PLANE_PAL_PREC_AUTO_INCREMENT);
@@ -3995,10 +3993,11 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 			} while (i++ < 130);
 		} else {
 			for (i = 0; i < lut_size; i++) {
-				u32 v = (i * ((1 << 24) - 1)) / (lut_size - 1);
+				lut_val = (i * ((1 << 24) - 1)) / (lut_size - 1);
 
 				intel_de_write_dsb(display, dsb,
-						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
+						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						   lut_val);
 			}
 
 			do {
-- 
2.47.3

