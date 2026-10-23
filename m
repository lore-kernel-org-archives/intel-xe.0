Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE85606A322
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 16:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OEDiqNId
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADA4112C5D;
	Fri, 23 Oct 2026 16:59:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDFF112C3C;
 Fri, 23 Oct 2026 16:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792774710; x=1824310710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B+U/r0kJZinGt9yHo8OTXmFHi+7UbNbHs0qXAq3T0q8=;
 b=OEDiqNIdkf5ejFLajvUTUGgXZ9CHeZ0pYrI6kzgqaqPygkxN7Gf66uSw
 7u7LcmYoVaw+BxE/Wv0BmNlAHJMVrcloWuXrD68AYIomltQj9QjkPbfhS
 svrypbCYSiofw2HGWvU4l/SoJj5YR9lB8x6P0qmiy3jcp6KHnSvqzAdIz
 UXCvfeKL+tFYkHFo2B2e8kOdDKRTmqQeDs1y1yp8rsYQv4pxPe4Af78TP
 CgLtoO7MqJ63wzKYz2pckAmHiDXBfYQJbfPQJDBIeG3Ar1Sbx2j/1MZBj
 KOK6RFm9OVcq3wprMOnzzpvMc9YvkqjjJQHneCIPVuslLvM0GadmcxIOK w==;
X-CSE-ConnectionGUID: VSPZFhaHTGKadZ1pY48gjA==
X-CSE-MsgGUID: gAgnt/17RyylQzmnBeEedA==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1428517"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1428517"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:30 -0700
X-CSE-ConnectionGUID: RoHF5eRKQqiQhaHKDfsilg==
X-CSE-MsgGUID: NQTqbse/QzqRbBe31uVSEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3798525"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:28 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 06/13] drm/i915/vrr: Use the local 'adjusted_mode'
 intel_vrr_compute_config()
Date: Fri, 23 Oct 2026 19:57:56 +0300
Message-ID: <20261023165803.31016-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

intel_vrr_compute_config() has a local 'adjusted_mode' variable.
Use it instead of going for the long hand version.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 9ab62423a1a6..6aa99bcec448 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -529,11 +529,11 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 
 	if (HAS_AS_SDP(display)) {
 		crtc_state->vrr.vsync_start =
-			(crtc_state->hw.adjusted_mode.crtc_vtotal -
-			 crtc_state->hw.adjusted_mode.crtc_vsync_start);
+			(adjusted_mode->crtc_vtotal -
+			 adjusted_mode->crtc_vsync_start);
 		crtc_state->vrr.vsync_end =
-			(crtc_state->hw.adjusted_mode.crtc_vtotal -
-			 crtc_state->hw.adjusted_mode.crtc_vsync_end);
+			(adjusted_mode->crtc_vtotal -
+			 adjusted_mode->crtc_vsync_end);
 	}
 
 	intel_vrr_dc_balance_compute_config(crtc_state);
-- 
2.55.0

