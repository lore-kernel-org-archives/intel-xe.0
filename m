Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA747C88E72
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 13:53:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485F510E407;
	Thu, 17 Sep 2026 13:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B/rc03lG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C1F10E407
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 13:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789653201; x=1821189201;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VXHB8AgeLeDtoSIWGRMMgzLBVJgHLfzVQMNzMjD7EF4=;
 b=B/rc03lGNLmEhu+A5zUBrDIosv8ORpzS+OpnVOAJ/OZKBUCZxBdHVo3m
 elfLJHDWdmS5xk3xjbDSDY/NE87pvny+W2L2VCdj2pHdnWinwiNIKaOa0
 Ez75vQur3ilUpQ/LKr/tLUU3DzGOA/Zushp1GDwC3NimETznYNm8QzMrA
 yv1uXAJcrROVYafBP7FjZPdWSYSSItJEqmmFCbWV+uRTpmQ5VE+utVjF8
 EHWsQWWSmlrxmaQKDrQxCFDFdVuACoM19P2EcvEhYSpFMdSyPpJDkwvVG
 9T4L2JWWFNXbomsMSskekpiN+aqsOuAmZmtLyBYpAwJPSVPlO0zvvsvUO g==;
X-CSE-ConnectionGUID: RlHgjTZ6SFWnra1W3rngFw==
X-CSE-MsgGUID: ZLTJ96jpSYW9D3faHIhRTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77641734"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77641734"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 06:53:20 -0700
X-CSE-ConnectionGUID: y14lGHQ5TwiIB5jt7fPkhA==
X-CSE-MsgGUID: 3OzE/ZrcQxaaP2eDn1fBLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="298878682"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 06:53:19 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: zhanjun.dong@intel.com, daniele.ceraolospurio@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v2] drm/xe/guc: Demote uncorrectable local error log to info
Date: Thu, 17 Sep 2026 19:23:11 +0530
Message-ID: <20260917135310.3590412-2-varun.gupta@intel.com>
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
driver failure. This can be triggered as part of expected recovery flows,
including intentional fault-injection tests.

Printing this at ERROR level is too noisy and causes false-positive
dmesg-warn failures in CI. Switch the log level to INFO, matching the
adjacent CAT error handler.

v2:
  - Also ratelimit the GUC_ID_UNKNOWN to match the CAT error handler.
    (Himal)

Fixes: 4e57574fa3a3 ("drm/xe/guc: Handle GuC local uncorrectable error notifications")
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f3ba8abfc228..6144a1767f10 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3487,7 +3487,7 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	guc_id = msg[0];
 
 	if (guc_id == GUC_ID_UNKNOWN) {
-		xe_gt_err(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
+		xe_gt_err_ratelimited(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
 		return 0;
 	}
 
@@ -3495,9 +3495,9 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(!q))
 		return -EPROTO;
 
-	xe_gt_err(gt,
-		  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
-		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
+	xe_gt_info(gt,
+		   "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
+		   guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
 
 	trace_xe_guc_uncorrectable_error(q);
 
-- 
2.43.0

