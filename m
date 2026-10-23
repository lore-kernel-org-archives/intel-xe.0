Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93731606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 16:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cllbhSaz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B46E10E6B9;
	Fri, 23 Oct 2026 16:58:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFDC10E6B9;
 Fri, 23 Oct 2026 16:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792774699; x=1824310699;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SNeN7wEYi1gyQdcYU2ZoqxlK3yEy9ec7iQ+cEcfLx0E=;
 b=cllbhSazsEgARGqMX9/wW+EeCiUQuv1nNvT1KnysZC0jR5w0ZH7KO1hG
 IShFzJ1/3ntdp3aeCDxQBNg8OMa2k9vV2vr+X96gUoX5dV2EBKVfoiDDM
 wv41F1L+T2uLuap/L6sQYUgFulxJzlw7/SWZYbXM1PICOjO8h4QCduXxN
 oZwZEM/wb2Ayx5yoZdrtAuJ0agWmWFPg/N6hCra3n8Crd7nZouSXdmQkK
 oHqC3iDEuOKxl5Nq7izmSjN+Yt3M5/uLUTX0jDxA878KqcFGaI6l2oUgn
 i/K+uxRe63jqiaYoWYOY7ZI0LdESBx53m4ug2T9wHr0/sqfdM+fYeEIer Q==;
X-CSE-ConnectionGUID: HNbDu7PdRxOqZCcANECDhw==
X-CSE-MsgGUID: qu13RY2BS+eeVipNByD+iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1433837"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1433837"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:18 -0700
X-CSE-ConnectionGUID: H17ELWGiQw2d/OPxe9Rtig==
X-CSE-MsgGUID: vjJBarkLRFiwh8w44gH2Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3571415"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:17 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 03/13] drm/i915/vrr:
 s/intel_vrr_vblank_start()/vrr_vblank_start()/
Date: Fri, 23 Oct 2026 19:57:53 +0300
Message-ID: <20261023165803.31016-4-ville.syrjala@linux.intel.com>
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
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Rename intel_vrr_vblank_start() to vrr_vblank_start() to
highlight that it's an internal helper and that no one
should be thinking about exposing it outside intel_vrr.c

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 8dfebcbaf8b5..b62148f29503 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -311,8 +311,8 @@ static int intel_vrr_hw_value(const struct intel_crtc_state *crtc_state,
 		return value - crtc_state->set_context_latency;
 }
 
-static int intel_vrr_vblank_start(const struct intel_crtc_state *crtc_state,
-				  int vtotal)
+static int vrr_vblank_start(const struct intel_crtc_state *crtc_state,
+			    int vtotal)
 {
 	return vtotal - crtc_state->vrr.guardband;
 }
@@ -1231,7 +1231,7 @@ int intel_vrr_dcb_vmin_vblank_start_next(const struct intel_crtc_state *crtc_sta
 	if (REG_FIELD_GET(VRR_DCB_ADJ_FLIPLINE_CNT_MASK, tmp) == 0)
 		return -EINVAL;
 
-	return intel_vrr_vblank_start(crtc_state, VRR_DCB_ADJ_FLIPLINE(tmp) + 1);
+	return vrr_vblank_start(crtc_state, VRR_DCB_ADJ_FLIPLINE(tmp) + 1);
 }
 
 int intel_vrr_dcb_vmax_vblank_start_next(const struct intel_crtc_state *crtc_state)
@@ -1245,7 +1245,7 @@ int intel_vrr_dcb_vmax_vblank_start_next(const struct intel_crtc_state *crtc_sta
 	if (REG_FIELD_GET(VRR_DCB_ADJ_VMAX_CNT_MASK, tmp) == 0)
 		return -EINVAL;
 
-	return intel_vrr_vblank_start(crtc_state, VRR_DCB_ADJ_VMAX(tmp) + 1);
+	return vrr_vblank_start(crtc_state, VRR_DCB_ADJ_VMAX(tmp) + 1);
 }
 
 int intel_vrr_dcb_vmin_vblank_start_final(const struct intel_crtc_state *crtc_state)
@@ -1256,7 +1256,7 @@ int intel_vrr_dcb_vmin_vblank_start_final(const struct intel_crtc_state *crtc_st
 
 	tmp = intel_de_read(display, TRANS_VRR_DCB_FLIPLINE_LIVE(cpu_transcoder));
 
-	return intel_vrr_vblank_start(crtc_state, VRR_DCB_FLIPLINE(tmp) + 1);
+	return vrr_vblank_start(crtc_state, VRR_DCB_FLIPLINE(tmp) + 1);
 }
 
 int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_state)
@@ -1267,7 +1267,7 @@ int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_st
 
 	tmp = intel_de_read(display, TRANS_VRR_DCB_VMAX_LIVE(cpu_transcoder));
 
-	return intel_vrr_vblank_start(crtc_state, VRR_DCB_VMAX(tmp) + 1);
+	return vrr_vblank_start(crtc_state, VRR_DCB_VMAX(tmp) + 1);
 }
 
 static
-- 
2.55.0

