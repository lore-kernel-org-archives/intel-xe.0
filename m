Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230FB606A329
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 09:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=THWgsXhm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC85010ED5B;
	Mon, 26 Oct 2026 09:47:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2FD10ED54;
 Mon, 26 Oct 2026 09:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793008058; x=1824544058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TyIi2LwUgAbe846nkXm5t/hHpXzyrJfOJkFoZtPmWRA=;
 b=THWgsXhmKG7LBZoSGk1qIkVx1ArtqF53qJaO6pmWhHsGMq+SseDZR2Tq
 ABmghNVDlzujkNdBNVehQ7XhPWRAaW78Z3Jcy6cMGGWHO/MH1REnNUNji
 RHOTzFCx7ZEhbhIprYKhv2NVf5KEhfnr+87GqsbWpn0pC3PBjNitsKco7
 p2Pg/U4kSxxWlK7S1B3aO/vIWA27C/eFqsUZ2wqj7Ro5UO2UWgMQdSx1Q
 gRB7JEWJPvNwfP84gL6OMfdE+Z8y7CIjYQDTCAXg/4QYd7sibmSLTCuaA
 gdNL5Wxd6BPZhCE5KB9u0LbDbaJwrEQz7RLlECpd6YRMW4stwgU8ukY7B Q==;
X-CSE-ConnectionGUID: x/e1Zso2QWOx79h0Zq5OEg==
X-CSE-MsgGUID: bcj6SeqtSqmOhsc+tGmTNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1570577"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1570577"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 02:47:38 -0700
X-CSE-ConnectionGUID: upU/bzKNSxyBnSfEhl/obA==
X-CSE-MsgGUID: 6jpT4mNESlmDoZzPdp2ZZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4569257"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.48])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 02:47:37 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v5 1/2] drm/i915/display: move the SNB FBC workaround comment
Date: Mon, 26 Oct 2026 11:46:07 +0200
Message-ID: <20261026094724.53374-2-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026094724.53374-1-luciano.coelho@intel.com>
References: <20261026094724.53374-1-luciano.coelho@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Sandy Bridge FBC workaround comment is still above the PCH
clock gating call in gen6_init_clock_gating().  The registers it
describes are programmed in intel_display_gen6_init_clock_gating()
instead.

Move the comment next to those writes.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 .../gpu/drm/i915/display/intel_display_clock_gating.c | 11 +++++++++++
 drivers/gpu/drm/i915/intel_clock_gating.c             | 11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
index ef1ee72494df..7961c0f10bb5 100644
--- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
+++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
@@ -237,6 +237,17 @@ static void intel_display_gen6_init_clock_gating(struct intel_display *display)
 	intel_de_write(display, ILK_DSPCLK_GATE_D, dspclk_gate);
 	intel_de_rmw(display, ILK_DISPLAY_CHICKEN2, 0, ILK_ELPIN_409_SELECT);
 
+	/*
+	 * According to the spec the following bits should be
+	 * set in order to enable memory self-refresh and fbc:
+	 * The bit21 and bit22 of 0x42000
+	 * The bit21 and bit22 of 0x42004
+	 * The bit5 and bit7 of 0x42020
+	 * The bit14 of 0x70180
+	 * The bit14 of 0x71180
+	 *
+	 * WaFbcAsynchFlipDisableFbcQueue:snb
+	 */
 	intel_de_write(display, ILK_DISPLAY_CHICKEN1,
 		       intel_de_read(display, ILK_DISPLAY_CHICKEN1) |
 		       ILK_FBCQ_DIS | ILK_PABSTRETCH_DIS);
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index c5c4441f3a61..6faf29c8d887 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -114,17 +114,6 @@ static void gen6_init_clock_gating(struct drm_i915_private *i915)
 			   GEN6_RCPBUNIT_CLOCK_GATE_DISABLE |
 			   GEN6_RCCUNIT_CLOCK_GATE_DISABLE);
 
-	/*
-	 * According to the spec the following bits should be
-	 * set in order to enable memory self-refresh and fbc:
-	 * The bit21 and bit22 of 0x42000
-	 * The bit21 and bit22 of 0x42004
-	 * The bit5 and bit7 of 0x42020
-	 * The bit14 of 0x70180
-	 * The bit14 of 0x71180
-	 *
-	 * WaFbcAsynchFlipDisableFbcQueue:snb
-	 */
 	intel_pch_init_clock_gating(i915->display);
 
 	gen6_check_mch_setup(i915);
-- 
2.53.0

