Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8C1606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 14:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L4sMSK5X
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5A210F155;
	Thu,  5 Nov 2026 14:55:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA63210F155
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 14:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793890548; x=1825426548;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mhLrFW4asGMqaJLTEM7P22nv3WoT2sjIStwuExLdAoY=;
 b=L4sMSK5XuwysEUMPVfIrkPK0vD8VMPUxL8SbNLhtY1PqPEgDw4JJDH9X
 WDqEywfFpp8AVCbKYcDsWM6TNn1DiWGu4H34yLRsPrTh+AjUc28Cljs4z
 tXtn9VKSGMj2gX3cbrpUU5g/zygWYJ/NbMzRkGfhUOv7j0RbTVyV6evri
 2/i6iCAFIB1tRKeJX/rIvRCTiqmx/GGppytSR1f5yYs80lIpVdielP6Ch
 Sv4zv3s2iAR2m2UZgeJG1ST9y3/H+it9TkE14bQr0NpbytJfXKTki524H
 CvpMMGUzHRdyr++mjKdD+Yq8QTRBwclTEVHjjAriGjaedni4tGIqOz9an Q==;
X-CSE-ConnectionGUID: yrescnIuQouRYvv8qNVwGQ==
X-CSE-MsgGUID: WBrH0cu/Q2iT0yWh0Zxcsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2583228"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2583228"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 06:55:47 -0800
X-CSE-ConnectionGUID: oiR1Fx1cR9y1kPOvYTLv2g==
X-CSE-MsgGUID: xyLFgBFKQiqh3On4m0dprQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7450074"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 06:55:46 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, rodrigo.vivi@intel.com,
 himal.prasad.ghimiray@intel.com, riana.tauro@intel.com
Subject: [PATCH v4] drm/xe/guc: Demote uncorrectable local error log on CRI
Date: Thu,  5 Nov 2026 20:25:32 +0530
Message-ID: <20261105145531.1847892-2-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
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

The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
local, queue-level context termination rather than a global device or
driver failure. On CRI, due to a hardware limitation, the platform cannot
distinguish GT translation faults from true RAS conditions, meaning
standard workloads routinely trigger this error.

Printing this at ERROR level is too noisy and causes false-positive
dmesg-warn failures in CI. Demote the log level to INFO for CRI.

v4:
  - Change to _dbg instead of _info. (Matt)
v3:
  - Limit the demotion to CRI and add comment explaining the HW limitation
    (Rodrigo)
v2:
  - Also ratelimit the GUC_ID_UNKNOWN to match the CAT error handler.
    (Himal)

Fixes: 4e57574fa3a3 ("drm/xe/guc: Handle GuC local uncorrectable error notifications")
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9e7c2778029c..abc2c3d67f29 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3610,7 +3610,7 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	guc_id = msg[0];
 
 	if (guc_id == GUC_ID_UNKNOWN) {
-		xe_gt_err(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
+		xe_gt_err_ratelimited(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
 		return 0;
 	}
 
@@ -3618,9 +3618,19 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(!q))
 		return -EPROTO;
 
-	xe_gt_err(gt,
-		  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
-		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
+	/*
+	 * On CRI, the hardware cannot distinguish GT translation faults
+	 * from true RAS conditions. Demote to info to avoid false-positive
+	 * hardware error logs.
+	 */
+	if (gt_to_xe(gt)->info.platform == XE_CRESCENTISLAND)
+		xe_gt_dbg(gt,
+			  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
+			  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
+	else
+		xe_gt_err(gt,
+			  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
+			  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
 
 	trace_xe_guc_uncorrectable_error(q);
 
-- 
2.43.0

