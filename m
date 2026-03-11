Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B9C104C00E
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 10:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B431610E895;
	Wed, 11 Mar 2026 10:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jlR6+vvN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F9910E88F
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 10:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773226149; x=1804762149;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5OmLZaxA8QXVPZCYp6XjkMxiyPAwUiGFdEy1yQSSIk0=;
 b=jlR6+vvNVmlZ2sZMNg0GoSJOElo4DUALJnEcFI2a2phg8cwsbFpkM1GB
 qTXn32nIiyRFBxAc6siYp8aIV0E2nB4Yu23XqR9h7xiIw9jfueFlE1Irl
 brCuUknOXYITBKqLR9M1GT9QHwgkKMmSNf6xUmaOU1bujKkiN8VFpBFeK
 6+q24zBOOc6AORcMi7KxC4s3CvwuIguZLAjdlOXAtPlFYbrbVwJiZ1Nab
 kiPQ/6u/EuMDyTXRwbmlGt9YM1jqRjBRRKxaW5UCE05WbFVHdwv1cfCCh
 EuPYdB4vzsX6xJZSYnVMGtpGLQevgQO74JwAX4Z9NEA8xHCCMYROpR1x/ Q==;
X-CSE-ConnectionGUID: PBJh1ydKRTSGxQa1phsE2w==
X-CSE-MsgGUID: Qja6QIPpQfuqLbmDoG+o0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74480991"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74480991"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 03:49:08 -0700
X-CSE-ConnectionGUID: nxXCGeyIRwCfQeagmVa/CA==
X-CSE-MsgGUID: e+PMJBp1Slip8lY/Hp1QIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="215665986"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 03:49:07 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/lrc: Fix uninitialized new_ts when capturing context
 timestamp
Date: Wed, 11 Mar 2026 03:49:02 -0700
Message-ID: <20260311104901.2933716-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
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

Getting engine specific CTX TIMESTAMP register can fail. In that case,
if the context is active, new_ts is uninitialized. Fix that case by
initializing new_ts to lrc_ts.

Flagged by static analysis.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index aa26c71ae34f..9d766ef414ed 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2563,7 +2563,7 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
  * @lrc: Pointer to the lrc.
  *
  * Return latest ctx timestamp. With support for active contexts, the
- * calculation may bb slightly racy, so follow a read-again logic to ensure that
+ * calculation may be slightly racy, so follow a read-again logic to ensure that
  * the context is still active before returning the right timestamp.
  *
  * Returns: New ctx timestamp value
@@ -2584,6 +2584,8 @@ u64 xe_lrc_timestamp(struct xe_lrc *lrc)
 		engine_id = xe_lrc_engine_id(lrc);
 		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
 			new_ts = reg_ts;
+		else
+			new_ts = lrc_ts;
 
 		/* read lrc again to ensure context is still active */
 		lrc_ts = xe_lrc_ctx_timestamp(lrc);
-- 
2.51.0

