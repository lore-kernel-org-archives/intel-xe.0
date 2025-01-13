Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610C6C02180
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jan 2025 19:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF57F10E1ED;
	Mon, 13 Jan 2025 19:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dgLwX044";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FAF10E1ED
 for <Intel-Xe@lists.freedesktop.org>; Mon, 13 Jan 2025 19:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736797446; x=1768333446;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9I3JzaygfGfzLu2iNZohd/g1epRuNjAS3t7Gf58HCl4=;
 b=dgLwX044qXCb2QVOm3H0Bock7U8tHn7XQazLZcRSt/02auXK7nfVW/cC
 XG+bh7+Vh+BzQlV/SQ3eftNNWnTx3g+0/vEp7+1lPCiDdVfjCxecxXf1J
 mMIziT2QS3jysLCLE2kaqtIvl/+OUrakfXGSHlPCUfu66TasrNy6v9EvY
 sExao7tB8zNWbAhOheeKuI//IBM7KvjfgmkQkzsq0E5c1s2ZFsifmfRj/
 OpmUtPmMUG61P7yt7uq5gH8JlZBvs1Aux9pb8OrNsIl9LzpkXTyklsx9S
 vl8S7DTfqQ8fCZ6kA2k/S25dvLDUvanr5B7/AOfMnnxHpVN2aax07Tamw w==;
X-CSE-ConnectionGUID: l4lVl/MNRAOpkqDymNt4cw==
X-CSE-MsgGUID: xeUAzfsjQxaoHUD8ZURgIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40753841"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; d="scan'208";a="40753841"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 11:44:06 -0800
X-CSE-ConnectionGUID: CjG3TXQiTDSbTH5Ezzgywg==
X-CSE-MsgGUID: 9fxBb+XJTwGnucq3ZxJF4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; d="scan'208";a="104345613"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa009.jf.intel.com with ESMTP; 13 Jan 2025 11:44:06 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/guc: Drop error messages about missing GuC logs
Date: Mon, 13 Jan 2025 11:44:04 -0800
Message-ID: <20250113194405.2033085-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

The GuC log snapshot code would complain loudly if there was no GuC
log to take a snapshot of or if the snapshot alloc failed. Originally,
this code was only called on demand when a user (or developer)
explicitly requested a dump of the log. Hence an error message was
useful.

However, it is now part of the general devcoredump file and is called
for any GPU hang. Most people don't care about GuC logs and GPU hangs
do not generally mean a kernel/GuC bug. More importantly, there are
valid situations where there is no GuC log, e.g. SRIOV VFs.

So drop the error message.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3958
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index df4cfb698cdb..80151ff6a71f 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -149,16 +149,12 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
 	size_t remain;
 	int i;
 
-	if (!log->bo) {
-		xe_gt_err(gt, "GuC log buffer not allocated\n");
+	if (!log->bo)
 		return NULL;
-	}
 
 	snapshot = xe_guc_log_snapshot_alloc(log, atomic);
-	if (!snapshot) {
-		xe_gt_err(gt, "GuC log snapshot not allocated\n");
+	if (!snapshot)
 		return NULL;
-	}
 
 	remain = snapshot->size;
 	for (i = 0; i < snapshot->num_chunks; i++) {
-- 
2.47.0

