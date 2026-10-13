Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3EECC6B03
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 03:34:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1779810E4B9;
	Tue, 13 Oct 2026 03:34:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EAA10E4B9
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 03:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791862481; x=1823398481;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yBuRI4TC9cCaAsHcdMwPkM7VdXRzsVhDSrswE93UmOw=;
 b=hCs4aULk0k+t7uigtjidQlfGnXvS/m9RetkhuLbAhXc1jx+yqjQGfuXx
 lLNwH+3Oa+o0NLtXNHZvqxdd96T9PDZAj+qvKmJ83VLOHsRBhdjmi5cJ7
 C+k/S2/oryqSeAJscg0LLC16B3XOkAg1TvP5WOw03uCW6KUMMUu4LDtnj
 Rhbfq0n2dz6qwBjU5E1+EQzZTDhXbxk4QyqJW3y0AxpUV11CCDZr19HBW
 Qe7hsNie71kwBg8m7cRFv4FnlUdyzgkSsxsLmPguIrjyF6Hnxi9iIz//Z
 MkvgKcKzVaJoXCJmcAJLV9LQar/whIFS4/vywNxetVKIGr55Q82oTxqgl A==;
X-CSE-ConnectionGUID: oemu6S/7RW+QWBzpU6gZzQ==
X-CSE-MsgGUID: 9VVuHyWyS3WEABmvpm2HfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="483020"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="483020"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 20:34:41 -0700
X-CSE-ConnectionGUID: EgG1AvQySAO5Q/Q2bqf48w==
X-CSE-MsgGUID: nqV9v3qxTJWG7AeNRvZsoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1171410"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 20:34:40 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, himal.prasad.ghimiray@intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH v3] drm/xe/guc: Demote uncorrectable local error log on CRI
Date: Tue, 13 Oct 2026 09:04:31 +0530
Message-ID: <20261013033430.1885990-2-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
local, queue-level context termination rather than a global device or
driver failure. On CRI, due to a hardware limitation, the platform cannot
distinguish GT translation faults from true RAS conditions, meaning
standard workloads routinely trigger this error.

Printing this at ERROR level is too noisy and causes false-positive
dmesg-warn failures in CI. Demote the log level to INFO for CRI.

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
index 7ce73489c35f..dc5b6b98ffc2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3585,7 +3585,7 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	guc_id = msg[0];
 
 	if (guc_id == GUC_ID_UNKNOWN) {
-		xe_gt_err(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
+		xe_gt_err_ratelimited(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
 		return 0;
 	}
 
@@ -3593,9 +3593,19 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
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
+		xe_gt_info(gt,
+			   "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
+			   guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
+	else
+		xe_gt_err(gt,
+			  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
+			  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
 
 	trace_xe_guc_uncorrectable_error(q);
 
-- 
2.43.0

