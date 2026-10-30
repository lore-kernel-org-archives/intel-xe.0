Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E919606A33F
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 17:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RAue/9ED
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E3B112946;
	Fri, 30 Oct 2026 17:13:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B4B112941;
 Fri, 30 Oct 2026 17:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793380417; x=1824916417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dn66xtlWVM5p5roDqExY1oIyYiZ3koqc9OpCuTzbkdg=;
 b=RAue/9EDVqgUndqRtW14AXW6nlz4022wXndnk2ysZVhVDzDe78iJScmv
 ucgt1StMqeqZfvI+BxZOF5L3sM/6eCVtGo4vtO5W+tYXLmKeVMTNyfb5P
 +6yZ1awjnSE1rkOsux25rqhVncNlOCcMHDkKr/6eV8sBYTaYhQycrSarS
 Oqu3cSP0K1l/Cx+Pv0gKbG7geS4JHSIQxoOm90KBXT7Isdu9mGB99MHq/
 Z/cWzOxeKRFXxhZXpBtaFW6M/ntiBUMqKWMhL7YAOw+EdDFAGIG2bWvDr
 J3UQG/gGZE0vpJMZw8zgD1wxwL0o0Nm1YYR02nG3RCBHXGUrL3qqXI7an A==;
X-CSE-ConnectionGUID: y6+ynd9JSQm25oU6ytDFVA==
X-CSE-MsgGUID: Dm/LPuVBSeG0u8Z9CQniJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2174306"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2174306"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:13:36 -0700
X-CSE-ConnectionGUID: STNttM4kSjeOD7TdnJQMMA==
X-CSE-MsgGUID: dlD91MbBScG/Y1pNBqCJZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7311367"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:13:34 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	stable@vger.kernel.org
Subject: [PATCH 01/10] drm/i915: Disable port sync if VRR is enabled
Date: Fri, 30 Oct 2026 19:13:17 +0200
Message-ID: <20261030171327.29829-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
References: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Using both VRR and port sync together would require extra
work, which we don't do. Trying this with the current code
will anger the hardware. Disable port sync if VRR is enabled.

This will of course allow the previously synced outputs
to go out of sync. It would probably make more sense to
reject VRR instead when port sync is used, but that's not
possible right now because VRR state is computed from
.compute_config() and port sync from .compute_config_late().
So let's take the easy way out for now, which at least
keeps the hardware happy.

Cc: stable@vger.kernel.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index a0aff087fafa..ed7d4cbbfb5a 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4599,9 +4599,12 @@ static bool crtcs_port_sync_compatible(const struct intel_crtc_state *crtc_state
 	/*
 	 * FIXME the modeset sequence is currently wrong and
 	 * can't deal with joiner + port sync at the same time.
+	 *
+	 * TODO VRR + port sync needs special handling
 	 */
 	return crtc_state1->hw.active && crtc_state2->hw.active &&
 		!crtc_state1->joiner_pipes && !crtc_state2->joiner_pipes &&
+		!crtc_state1->vrr.enable && !crtc_state2->vrr.enable &&
 		crtc_state1->output_types == crtc_state2->output_types &&
 		crtc_state1->output_format == crtc_state2->output_format &&
 		crtc_state1->lane_count == crtc_state2->lane_count &&
-- 
2.55.0

