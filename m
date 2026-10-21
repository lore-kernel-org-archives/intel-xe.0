Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4617606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 07:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aQrHglTq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7B210FA87;
	Wed, 21 Oct 2026 07:14:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FD310FA7F;
 Wed, 21 Oct 2026 07:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792566853; x=1824102853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XVUfSF7UrZyIsCOvF6uKyWC+403MNwXR2kbU9GZVhBg=;
 b=aQrHglTqic+4rhcrORxWJV5Yp8ZjNC3m/vwb2Yr/yHQA2n3ZvxNhaL7d
 GAoTYB4DS79Zx/D7bVqjCmlOXb9DLWAwfOMJE9RPJFvGHLcAVkHHEsB/R
 XII1VZAAVABil/Bi5qHtSVsm3dfxuWS6CXe1fB2l1IPjaIAy/UfPh4F0H
 k4ZQ4mWVFpjEWKwV7Hw0kuhyi9Zla//NAuOPermA8g5LIwbPl16riN2Am
 nL34gSXOhhO8XHICChd4vuvzNi2mn/iTG+SvYX/L885vEyreRoS8rcXPo
 XXWVHTecn1fRz2LTKNIkppaVyNAtN/o+2PmpBjviHgPw+YNfsRoLWYvZw Q==;
X-CSE-ConnectionGUID: mJAr7xLjQJC8W9VO7Ajlcw==
X-CSE-MsgGUID: X7dwNkVBTw2S0e5waU0Qqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1383981"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1383981"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 00:14:13 -0700
X-CSE-ConnectionGUID: wit6N0O8S6uVDp1ISSbYXA==
X-CSE-MsgGUID: 7jAV3rHQR5G7wkwpxEhygw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3356996"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa008.fm.intel.com with ESMTP; 21 Oct 2026 00:14:11 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v6 03/11] drm/i915/display_wa: Add support for Wa_14014191401
Date: Wed, 21 Oct 2026 12:43:53 +0530
Message-Id: <20261021071401.1161586-4-suraj.kandpal@intel.com>
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

The DG2 transcoder timing generator DDA only supports a Link M/N ratio
of up to 4. The Link M/N ratio limit uses a bare platform check for it.

Add Wa_14014191401 for DG2 and use it for the limit instead.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_wa.c | 2 ++
 drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
 drivers/gpu/drm/i915/display/intel_dp.c         | 3 ++-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 2e3ff4861ef4..91395076e903 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -94,6 +94,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 			IS_DISPLAY_STEP(display, STEP_A0, STEP_A2);
 	case INTEL_DISPLAY_WA_14014143976:
 		return IS_DISPLAY_STEP(display, STEP_E0, STEP_FOREVER);
+	case INTEL_DISPLAY_WA_14014191401:
+		return display->platform.dg2;
 	case INTEL_DISPLAY_WA_14016740474:
 		return IS_DISPLAY_VERx100_STEP(display, 1400, STEP_A0, STEP_C0);
 	case INTEL_DISPLAY_WA_14020863754:
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index b707147a7587..f41e58d1d6e7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -31,6 +31,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_14011508470,
 	INTEL_DISPLAY_WA_14011765242,
 	INTEL_DISPLAY_WA_14014143976,
+	INTEL_DISPLAY_WA_14014191401,
 	INTEL_DISPLAY_WA_14016740474,
 	INTEL_DISPLAY_WA_14020863754,
 	INTEL_DISPLAY_WA_14025769978,
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7ceb7c02b597..f3a79ae49b18 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -70,6 +70,7 @@
 #include "intel_display_regs.h"
 #include "intel_display_rpm.h"
 #include "intel_display_types.h"
+#include "intel_display_wa.h"
 #include "intel_dp.h"
 #include "intel_dp_aux.h"
 #include "intel_dp_hdcp.h"
@@ -1271,7 +1272,7 @@ bool intel_dp_has_dsc(const struct intel_connector *connector)
 static int
 intel_dp_get_max_m_n_ratio(struct intel_display *display)
 {
-	if (display->platform.dg2)
+	if (intel_display_wa(display, INTEL_DISPLAY_WA_14014191401))
 		return 4;
 
 	return 10;
-- 
2.34.1

