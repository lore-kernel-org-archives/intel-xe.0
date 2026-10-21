Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED747606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 07:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QOty830O
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC06D10FA95;
	Wed, 21 Oct 2026 07:14:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A653410FA82;
 Wed, 21 Oct 2026 07:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792566861; x=1824102861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r5JIPYOl+rV8uYt49MMkrLk4d04H3nTp6g8sijq96fw=;
 b=QOty830O7690ROAWDzwmzWD4LVkfU5AXaFuBFuvMWX+yNB6oIq3Lm685
 C4gzMHXJuTKnG6+8/4QPIy0VlfuKe/nTQdKZKvO/fmF/Qp73eNw0Upo09
 CG86HGR/IJJh6urXKAlwJ02rsqtbud8SuVp4RaiGWZAwIcD+bl62oQ1qb
 ENq9aBxMN2kZ3ICloUQVGdsnQBLvZqpk7sWYzmbKKINtIP8lvqzfEgkHA
 oAl6YUmw8LGQZFscbJD7xSUUTXds3tRjPL6ujUBfaM+bo3SyjJsxVYcrz
 FmsZT9wdYeTMvE3vuEm8NtfJ9fKqNKjeFXhKZ6loizxeXxTiasf9utsLD w==;
X-CSE-ConnectionGUID: X1kKg/MBRFujvd95utFOxg==
X-CSE-MsgGUID: FmB/6zDvSD+QfrhzDGYHfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1383997"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1383997"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 00:14:21 -0700
X-CSE-ConnectionGUID: pQcGOB9CRQKYikl7Ie/CBg==
X-CSE-MsgGUID: B1HzEtHHTVWwVKpoOtZ9vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3357051"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa008.fm.intel.com with ESMTP; 21 Oct 2026 00:14:19 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v6 07/11] drm/i915/display_wa: Add support for Wa_14021768792
Date: Wed, 21 Oct 2026 12:43:57 +0530
Message-Id: <20261021071401.1161586-8-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021071401.1161586-1-suraj.kandpal@intel.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20261021071401.1161586-1-suraj.kandpal@intel.com>
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

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Some BMG ultrajoiner configurations require support for Link M/N ratios
between 10.0 and 15.0. This range is not natively supported and requires
a workaround.

Wa_14021768792 enables this support by utilizing HDMI_EMP_DATA,
CHICKEN_TRANS and the extended bits in the LINK_N register.

Add the necessary logic to enable the workaround on applicable platforms.
The underlying mechanism comes from the display C0,
so it is gated on display stepping C0 and later.

v2:
-Don't include i915_drv.h and don't use struct drm_i915_private under
display/. Use display->platform.battlemage, which names the affected
platform directly, instead of IS_DGFX() combined with a display version
check. (Jani)
-Rebase on the reworked display WA framework, where the condition goes
directly into the __intel_display_wa() switch.

Bspec: 49266
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_wa.c | 9 +++++++++
 drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 91395076e903..e6f84dffdeb7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -102,6 +102,15 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 		return DISPLAY_VERx100(display) == 3000 ||
 			DISPLAY_VERx100(display) == 2000 ||
 			DISPLAY_VERx100(display) == 1401;
+	/*
+	 * Wa_14021768792:
+	 * Fixes: Limitation of Link M/N ratio > 10 for specific Xe2HPD platforms.
+	 * Workaround: Use HDMI_EMP_DATA, CHICKEN_BITs and extended bits in LINK_N
+	 * registers to support LINK M/N ratios from > 10 but < 15.
+	 */
+	case INTEL_DISPLAY_WA_14021768792:
+		return display->platform.battlemage &&
+			IS_DISPLAY_STEP(display, STEP_C0, STEP_FOREVER);
 	case INTEL_DISPLAY_WA_14025769978:
 		return DISPLAY_VER(display) == 35;
 	case INTEL_DISPLAY_WA_14026643300:
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index f41e58d1d6e7..0b43c2144dcc 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -34,6 +34,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_14014191401,
 	INTEL_DISPLAY_WA_14016740474,
 	INTEL_DISPLAY_WA_14020863754,
+	INTEL_DISPLAY_WA_14021768792,
 	INTEL_DISPLAY_WA_14025769978,
 	INTEL_DISPLAY_WA_14026643300,
 	INTEL_DISPLAY_WA_15013987218,
-- 
2.34.1

