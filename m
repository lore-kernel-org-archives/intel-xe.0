Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A98CC6FD1E
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 22:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2930E10EA20;
	Fri, 10 Mar 2023 22:16:30 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB95610EA1B
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 22:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678486588; x=1710022588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cmHTW7dLga9vLvhWQBQrjl5m2cURlqKv4SIfI+b/V80=;
 b=HTpQoYTSHnkoiayLMYtx76nynlZOajwa9hb0zS767g1DgCjRtHlohL22
 WzRhdd3nw37QiIIYI42w5xUOel7XGR2tWK0mx1N6MhBnkmncLO1ir62xN
 CgZzrN5fvMjtHGOrxMbTl3ur2Xu0amUbcQ7putv+/D5dYptbP38M6Vuee
 oGiDM24gvI5aJfsrFwf09rQjCmiQ9C/sB1dWmfjnydKT0D+iapy68XlAs
 km3tKzVvhaA8ZKKhM3B5C0JKXJHIRdT1Ez4xIuytM5FJwJ5F3l8mnF4NW
 Qevb6/Dxfqz1misS0wCpxdWCcCQ3X/aRgCyHaGPTabb5Vx+djHeZwVVce Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423106178"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="423106178"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 14:16:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="821234952"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="821234952"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 14:16:22 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Mar 2023 14:15:38 -0800
Message-Id: <20230310221549.2337402-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230310221549.2337402-1-lucas.demarchi@intel.com>
References: <20230310221549.2337402-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 01/12] drm/xe/rtp: Add match helper for gslice
 fused off
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add match helper to detect when the first gslice is fused off, as needed
by future workarounds.

v2:
  - Add warning if called on a platform without geometry pipeline
    (Matt Roper)
  - Hardcode 4 as the number of gslices, which matches all the currently
    supported platforms. PVC doesn't have geometry pipeline and
    shouldn't use this function (Matt Roper)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_rtp.h | 11 +++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 0d2f51bb06e8..cb9dd894547d 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -8,6 +8,7 @@
 #include <drm/xe_drm.h>
 
 #include "xe_gt.h"
+#include "xe_gt_topology.h"
 #include "xe_macros.h"
 #include "xe_reg_sr.h"
 
@@ -170,3 +171,18 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
 	return render_compute_mask &&
 		hwe->engine_id == __ffs(render_compute_mask);
 }
+
+bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
+					 const struct xe_hw_engine *hwe)
+{
+	unsigned int dss_per_gslice = 4;
+	unsigned int dss;
+
+	if (drm_WARN(&gt_to_xe(gt)->drm, !gt->fuse_topo.g_dss_mask,
+		     "Checking gslice for platform without geometry pipeline\n"))
+		return false;
+
+	dss = xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0);
+
+	return dss >= dss_per_gslice;
+}
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 433f0cbff57f..4140ef507fa0 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -427,4 +427,15 @@ bool xe_rtp_match_even_instance(const struct xe_gt *gt,
 bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
 					  const struct xe_hw_engine *hwe);
 
+/*
+ * xe_rtp_match_first_gslice_fused_off - Match when first gslice is fused off
+ *
+ * @gt: GT structure
+ * @hwe: Engine instance
+ *
+ * Returns: true if first gslice is fused off, false otherwise.
+ */
+bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
+					 const struct xe_hw_engine *hwe);
+
 #endif
-- 
2.39.0

