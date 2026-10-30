Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA01606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 20:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VkwAuZbP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959A210E8C6;
	Fri, 30 Oct 2026 20:34:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDC810E365;
 Fri, 30 Oct 2026 20:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793392469; x=1824928469;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Cj2oHU9xnTm3+Z668HqvSsY+ZwftlRNCWgO/FSsoGtA=;
 b=VkwAuZbPpIYQn39n2BCVuwp+oXRSC+p9j2bVfN79rIzjwiY9hc69IPfB
 Av9vsgNqlXax9SPwv6sbcEqSTEykR3BiClnG00pV8k31QLJBz+ZbUbJ47
 30SfOOAei/UIY47VNMf9tuuASKtnssq+R/gxA/b8MDOG14WPIGNL57ioq
 df7bro9cigwp6/8fp52UjFx4Fys7GHTY9bO5DNGy9nKaYAh/8UUlyafa+
 Y3d5MJN4zyLdRJYqn4fzLk0+y6FL89h5XzfBndViGY2Evit1/tI0qaEQg
 Elkyl74Z8yeQHlk6tyeSDLpXNkn9qXiZzEFvSLSZaq8DNo/JmEJ6Bcsp4 w==;
X-CSE-ConnectionGUID: O+028vqBSB+RQ1UNn/mC1g==
X-CSE-MsgGUID: r4MKZXk1TAm3MzRGXasmEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2042440"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2042440"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 13:34:29 -0700
X-CSE-ConnectionGUID: t1SQLL0TSZeQ7dJX7cq+ag==
X-CSE-MsgGUID: y9quzN3qTlu3bvVPmaGFGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5500622"
Received: from astead-desk.fm.intel.com ([10.80.113.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 13:34:29 -0700
From: Alan Stead <alan.stead@intel.com>
To: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 vivek.kasireddy@intel.com, dongwon.kim@intel.com, james.xiong@intel.com
Subject: [RFC v1 1/3] drm/i915/dip: Send HDMI EMPs early in V. Blank when VRR
 is in range
Date: Fri, 30 Oct 2026 13:32:20 -0700
Message-ID: <20261030203314.1085262-2-alan.stead@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030203314.1085262-1-alan.stead@intel.com>
References: <20261030203314.1085262-1-alan.stead@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

EMP_AS_SDP_TL defines the line, counted back from the next V. Active, on
which HDMI 2.1 Extended Metadata Packets (EMPs) and DP Adaptive Sync SDPs
are sent. It is always programmed to the start of the VSYNC pulse, which
is right for the DP AS SDP, but HDMI 2.1 expects EMPs (such as the VTEM
used to signal VRR) within the first half of V. Blank.

When VRR is in range on an HDMI output, send the EMPs on the 2nd line of
the V. Blank instead, keeping the line within the SCL + guardband region
as required by the hardware. Nothing changes for DP/eDP or for HDMI
outputs where VRR is not in range.

HDMI VRR is not enabled by the driver yet, so this has no effect until
the following patches.

Signed-off-by: Alan Stead <alan.stead@intel.com>
Assisted-by: LLM
---
 drivers/gpu/drm/i915/display/intel_dip.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dip.c b/drivers/gpu/drm/i915/display/intel_dip.c
index f447150ff7bc..831881e6c15e 100644
--- a/drivers/gpu/drm/i915/display/intel_dip.c
+++ b/drivers/gpu/drm/i915/display/intel_dip.c
@@ -19,6 +19,25 @@ static int intel_dip_get_as_sdp_transmission_line(const struct intel_crtc_state
 	if (!HAS_EMP_AS_SDP_TL(display))
 		return 0;
 
+	/*
+	 * HDMI 2.1 expects the EMPs (such as the VTEM used for VRR) within
+	 * the first half of V. Blank, so send them on the 2nd line of the
+	 * V. Blank rather than at the start of the VSYNC pulse. The line
+	 * must also stay within the SCL + guardband region.
+	 */
+	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI) &&
+	    crtc_state->vrr.in_range) {
+		const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
+		int max_tl = crtc_state->set_context_latency +
+			crtc_state->vrr.guardband - 1;
+		int tl = mode->crtc_vtotal - mode->crtc_vdisplay - 1;
+
+		if (max_tl > 0)
+			tl = min(tl, max_tl);
+
+		return tl;
+	}
+
 	/*
 	 * EMP_AS_SDP_TL defines the T1 position as the default AS SDP
 	 * Transmission Line, which corresponds to the start of the
-- 
2.53.0

