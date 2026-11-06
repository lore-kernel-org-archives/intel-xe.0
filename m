Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F4E606A32C
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 03:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E2XcnBar
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E22310E0C1;
	Fri,  6 Nov 2026 03:48:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C7110E0C1
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 03:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793936895; x=1825472895;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mImAp8aRP6MuZQMRZZBMgguJKAEsRGflqd/T87QDXTM=;
 b=E2XcnBare3FeUjPCy2Db1f/l0IVsBRec/QwpOfsFFRsK9jvxiG6xCL3v
 dMTJX03DQTssCAsgvN/h17PZDxzEHYukViScgtc/Ecsq+DPY715o3NqkI
 7BpQhlehnX/bMnEHsZjlRRFh28xCU1EXaRbdsWGNNxEiLdWmohHuutbuF
 KHmwpjA5ego10119BG9Xa8RP6goWd03MzIcAWTrOKyXm5nMH3q2S09iYe
 xPrSCQp3uCtu6wUzg3tlezZBEPrtJgZA4jilWpF2QYo8HBndcUCuOBUKd
 Wa5djjWM8hEJ47ZMkv7hDAj4AmEH9Zk1JtS0oaVjEojcEWWz1NaF4omxH g==;
X-CSE-ConnectionGUID: oFoVgMdzQ3uSYZUgK/lURA==
X-CSE-MsgGUID: SkX4P4FPSeOiEbMwcNPREA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2649366"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2649366"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 19:48:15 -0800
X-CSE-ConnectionGUID: iyXVQqmAQ9OeroWe4mgWuA==
X-CSE-MsgGUID: NGJ7gODvQKacRRXqGczyTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7512085"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 19:48:13 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, tejas.upadhyay@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v5] drm/xe/guc: Demote uncorrectable local error log on CRI
Date: Fri,  6 Nov 2026 09:18:05 +0530
Message-ID: <20261106034804.2005214-2-varun.gupta@intel.com>
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
dmesg-warn failures in CI. Demote the log level to debug for CRI.

v5:
  - Correct commmit message and comment (Tejas)
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
index 9e7c2778029c..b14b37b767f5 100644
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
+	 * from true RAS conditions. Demote to debug to avoid false
+	 * positive hardware error logs.
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

