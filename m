Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330AE606A319
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 05:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YRGz1PcK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016E0112970;
	Fri, 23 Oct 2026 05:02:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F5B10E552;
 Fri, 23 Oct 2026 05:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792731758; x=1824267758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PGc/bMKYGkWOKcjVjo7mo4IZyfQjKtso+RwwFSbO8OA=;
 b=YRGz1PcKlDDAAYfzIXoHTFZvQBPpfGptdehlU8DjHlqTDpbZTk7kwTmu
 iZaV1w2X+hfFLhYxcIQ3vm0ANWp0td+QwBXFahVFuWM6MUY2QDqvAWAmu
 3fVwELnegJUgBrLOU6NZM0LZE5MQ89T/sgG9ibKjScTN2ejd7sWYYuUn6
 t7hFDFizJXFJ3zGLJqaGRf2TSeXHCbbmWzxXVcOnz5ys/MjCxhAwdLsU1
 u2LRn6+/Ft0Q0UcFZKwormeSF0n0oug6LvxHaQMHzFgwfBwKe37XgrpIU
 oIASBY2n5wMbmWkqqu5rtMY0IY3d/M/xbeAWI8JKJHY2a6xPTrAYAYkFM Q==;
X-CSE-ConnectionGUID: hW/9SU8ZQHKvp/ed7/SPXQ==
X-CSE-MsgGUID: JGsGebOxRDeZnUSZw+2isg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1499155"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1499155"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:02:37 -0700
X-CSE-ConnectionGUID: Gu06/Mt5QMyetJ/xfr3BGw==
X-CSE-MsgGUID: u7mQb8M0SAWPud3w7n8MiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3926582"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 22 Oct 2026 22:02:35 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v8 03/14] drm/i915/display_wa: Add support for Wa_14014191401
Date: Fri, 23 Oct 2026 10:32:16 +0530
Message-Id: <20261023050227.2068466-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023050227.2068466-1-suraj.kandpal@intel.com>
References: <20261023050227.2068466-1-suraj.kandpal@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DG2 transcoder timing generator DDA only supports a Link M/N ratio
of up to 4. The Link M/N ratio limit uses a bare platform check for it.

Add Wa_14014191401 for DG2 and use it for the limit instead.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
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
index 661a863362ad..3703135f41e2 100644
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

