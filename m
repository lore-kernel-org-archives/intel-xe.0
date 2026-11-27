Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF06606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MgO3gC1s
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C901121C4;
	Fri, 27 Nov 2026 06:10:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4181112143;
 Fri, 27 Nov 2026 06:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795759798; x=1827295798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RmO0IAUzz6xEN306K6TzXx4+d4yyQ90U35fL6xraOaI=;
 b=MgO3gC1smGI78lQ8F2tHALaNknoyJm46XNB4LmiVusTlaKlJILcxe/Jb
 NvUCOJ86icAW1I37ymXVHBR1bDI6JIcWI4JE7x9+t7yg2FqQUPN2wBvd5
 Wt+PgYhOFZiDJo2XzgKQ/eb6z11B0P0BBTfVO6kNFuhLqEi3QpgVNyVd0
 +I0bjVH3d4ttvGEtW2DOWF9anw+Hgr2dEcKMlEEF5Iprcy1hi/iBOvTfo
 RTIR+SG68rFcGztOdDWg2NaOEJNFVQ3zBs1IyaMJ+vm41Kt++xcnJTIFT
 16JhI4m6mRShRvUUC4Rj/yIRmUGoAYNrNKe8TRFuUeRXF2nRoOXugMdzs g==;
X-CSE-ConnectionGUID: /wA16y1qRNaDrRmaO4q/Aw==
X-CSE-MsgGUID: /Oi1CygBR4GmBuDKTjerJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4578262"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4578262"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:09:58 -0800
X-CSE-ConnectionGUID: M9g3u7W+Sv2tVGUgl4vsIA==
X-CSE-MsgGUID: Zh/VUk6LSRGAwWL1CG6buA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14361941"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa013.fm.intel.com with ESMTP; 26 Nov 2026 22:09:56 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, jani.nikula@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 10/18] drm/i915/display: Add HAS_PORT_SYNC()
Date: Fri, 27 Nov 2026 11:39:16 +0530
Message-Id: <20261127060924.1648295-11-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127060924.1648295-1-suraj.kandpal@intel.com>
References: <20261127060924.1648295-1-suraj.kandpal@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a macro for the platforms that use transcoder port sync, instead of
open coding the display version range where the port sync group is
computed. Pipelock is going to need its own check next to it.

No functional change.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c            | 2 +-
 drivers/gpu/drm/i915/display/intel_display_device.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 54c4f90cdfea..aae78c99beaf 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4670,7 +4670,7 @@ intel_ddi_port_sync_transcoders(const struct intel_crtc_state *ref_crtc_state,
 	 * From, xe3lpd onwards we have defeatured this with reference to
 	 * Wa_16024710867
 	 */
-	if (!IS_DISPLAY_VER(display, 9, 30))
+	if (!HAS_PORT_SYNC(display))
 		return 0;
 
 	if (!intel_crtc_has_type(ref_crtc_state, INTEL_OUTPUT_DP))
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index c6a5409e2db0..769a634f5a7e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -196,6 +196,7 @@ struct intel_display_platforms {
 #define HAS_PIPELOCK(__display)		(DISPLAY_VER(__display) >= 35)
 #define HAS_PIXEL_NORMALIZER(__display)	(DISPLAY_VER(__display) >= 35)
 #define HAS_PMDEMAND(__display)		(DISPLAY_VER(__display) >= 14)
+#define HAS_PORT_SYNC(__display)	(IS_DISPLAY_VER(__display, 9, 30))
 #define HAS_PSR(__display)		(DISPLAY_INFO(__display)->has_psr)
 #define HAS_PSR_HW_TRACKING(__display)	(DISPLAY_INFO(__display)->has_psr_hw_tracking)
 #define HAS_PSR2_SEL_FETCH(__display)	(DISPLAY_VER(__display) >= 12)
-- 
2.34.1

