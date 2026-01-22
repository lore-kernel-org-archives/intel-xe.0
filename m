Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788E3D6CFA7
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 21:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3964310EADC;
	Thu, 22 Jan 2026 21:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h57pMfwF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E37810EADF
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 21:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769118228; x=1800654228;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+K+d52Gtc1nesEdQYmL35gwv2XvvquGSaMAHe593ACc=;
 b=h57pMfwFWNgoQhaV9LdvBq/yolL59dVvCXYtxIufR0mzjaGoKwrN/kxH
 JHFnfzhmAbsn+1s3/E/uPMFukT8YryNW+xDSUlQn1sQY/028W+wgW8dlr
 WksrjC0Y6oZKzAbJ1BvpWlU0mlfz0uA17xpm2qtXC3YsmNTZY7OL5QFF8
 Qhbi45cv3X1dIHIrWrScBhRq+8B+AZAz2RXWh8Dp4G2Iu3HRXh8EqrXd5
 mnSWruYjtxMKEf5/tj6XDf7Iiwc2J1vamOtSrQwjYUtubSKUjKvhUWkrX
 e2nSF7+6jFMKMlPPDsmTe+uL3xCcbMu1UKftWW+DG1Xw0AE9MmPxUDQrG A==;
X-CSE-ConnectionGUID: +uVEoFyDSFSH2x8LG6jfYg==
X-CSE-MsgGUID: XN79J1lcSdaOmt3zarKFQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70419773"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="70419773"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 13:43:48 -0800
X-CSE-ConnectionGUID: k+eeDLVFR7SbaGSR2m2cdQ==
X-CSE-MsgGUID: tzWIkFdKRNu2nxmGO9uQSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="244454746"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa001.jf.intel.com with ESMTP; 22 Jan 2026 13:43:47 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Skip address copy for sync-only execs
Date: Thu, 22 Jan 2026 21:40:54 +0000
Message-ID: <20260122214053.3189366-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

For parallel exec queues, xe_exec_ioctl() copied the batch buffer address
array from userspace without checking num_batch_buffer.
If user creates a sync-only exec that doesn't use the address field, the
exec will fail with -EFAULT.
Add num_batch_buffer check to skip the copy, and the exec could be executed
successfully.

Here is the sync-only exec:
struct drm_xe_exec exec = {
    .extensions = 0,
    .exec_queue_id = qid,
    .num_syncs = 1,
    .syncs = (uintptr_t)&sync,
    .address = 0,            /* ignored for sync-only */
    .num_batch_buffer = 0,   /* sync-only */
};

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index a5485fe6e3f1..dbe6c006f1d6 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -192,9 +192,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_syncs;
 	}
 
-	if (xe_exec_queue_is_parallel(q)) {
-		err = copy_from_user(addresses, addresses_user, sizeof(u64) *
-				     q->width);
+	if (args->num_batch_buffer && xe_exec_queue_is_parallel(q)) {
+		err = copy_from_user(addresses, addresses_user,
+				     sizeof(u64) * q->width);
 		if (err) {
 			err = -EFAULT;
 			goto err_syncs;
-- 
2.50.1

