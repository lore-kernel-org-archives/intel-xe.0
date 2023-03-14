Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E279CC6FD19
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 00:30:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9007610E6AE;
	Tue, 14 Mar 2023 00:30:47 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7995110E6A8
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 00:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678753845; x=1710289845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LnJa2xY9R3ntcPfptEalp4kcdGvjXbv/9t6ojt0yL7w=;
 b=Hzl+bjzq6uRN8N1kp35KJGYZjkTr8Bcz74j/wNwwgNw2AMPQVEDPDr0w
 Dgh8xeXdTmxh4k1X48cWkrTd9a9QC5GBXzbKBVBhDhylFi9NurwtxYk5e
 M7ayG2HdCak6V77eZzr7lDqHSPtDr7WBtjPzbt15c10UlC9pmqVKMNtqK
 V7PoPP6jjdfXU5dwmyUsM+vBJ2UNzsgz1ER2JSgD1wdhPQrR0cfnnVTp0
 Yx6aTlNv01J+x4TpP/v7oLldwqq5SE70mTpDW9n5V3a9U1iTkvQc9kpyW
 sP8bUUR25Fq0p1nSzKucdXD3YWAsBkezQmkPJemjcLf2AVqQ1ObcC4sWG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="402168020"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="402168020"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 17:30:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="789116674"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="789116674"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 17:30:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 17:29:59 -0700
Message-Id: <20230314003012.2600353-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230314003012.2600353-1-lucas.demarchi@intel.com>
References: <20230314003012.2600353-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 01/14] drm/xe/rtp: Add match helper for gslice
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
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
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
index ac983ce93684..a3be7c77753a 100644
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

