Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC92C74A5B
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 09:25:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A2010E38A;
	Tue,  7 Mar 2023 09:25:33 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EC010E3C5
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 09:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678181130; x=1709717130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WuESDId3Hl7wrkolSPRsEYWgQBRoHe2xVQ/j1R45zS8=;
 b=U41dUXDxc43+UBIIO1LEkJrRqS8/7YwO9CtTeix9K5rB0K82JvQzy7iR
 kMIrUylJeJZi+Ty5InQuRYd9ljQSypkO8p4hLFRxyMrMJsGPcO5ldcmvP
 IRi6C8Q3MaILWY+DghZbgZquXJB+rp4Q6jn0wPibzQWbm+wRblpBIvln1
 3s3J2q6OhKBcKzw8uDqStVm7xsCTvMt2O5Lm2rj0qOrQqSYhWYGTNkPKo
 t35zo+0rk1mez8c19Qj6vPev5SDxIzI/YJwUwgXlpGR9uQidfxbSdl+2h
 2kvK8/V3FrgXSQJHHOfLD+GG7XZbKdTTu42iBlLV337Bq8T5Xawq3k+O0 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="422079118"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="422079118"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005798811"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="1005798811"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  7 Mar 2023 01:24:34 -0800
Message-Id: <20230307092446.1263266-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307092446.1263266-1-lucas.demarchi@intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 07/19] drm/xe/rtp: Add match helper for gslice
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add match helper to detect when the first gslice is fused off, as needed
by future workarounds.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_rtp.h | 11 +++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 0d2f51bb06e8..dc5a1c62d531 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -8,6 +8,7 @@
 #include <drm/xe_drm.h>
 
 #include "xe_gt.h"
+#include "xe_gt_topology.h"
 #include "xe_macros.h"
 #include "xe_reg_sr.h"
 
@@ -170,3 +171,12 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
 	return render_compute_mask &&
 		hwe->engine_id == __ffs(render_compute_mask);
 }
+
+bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
+					 const struct xe_hw_engine *hwe)
+{
+	unsigned int dss = xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0);
+	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
+
+	return dss >= dss_per_grp;
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

