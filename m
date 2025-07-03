Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B0BC77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 06:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F041310E12C;
	Thu,  3 Jul 2025 06:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cs8tVpvA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CC910E12C
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 06:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751523868; x=1783059868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FmTBBcVhW3q0pgFuCRfD2nltm0DX2LlQx4kf2XQRyCU=;
 b=cs8tVpvANLChBmlTq28+Buw9+Zt7549mwR28dqUbHltdrEER8bw5GjGY
 idI6X00gtVSlHXx/MJFBj0nLfnpQAIv8oK1FR8AecqTqbCZVwXGSWyVBC
 byPTKeLdYgwPMTYVA5JNxfSj8TJ/a8VG+q5G1O7eUMsVQ0m4VhrQ4zQqm
 qXI6EZDsxVRNRKdkuz1V7Y9KFQUfE5u6Pe7yt/r2LOI1SXp6FRajfCgTx
 DVwKDaK6H0SQrlDUwKIxGjs06vpVbUmEBUrqmmORSaikRPcnBxe+D71Et
 s019DSUsn58t2CXxh4FgJhYpk+9TgJ//Apau5Gb8hn8m+BEq9jjpV0gGi Q==;
X-CSE-ConnectionGUID: UmFhnVL4S0anNKpdlCy+Ig==
X-CSE-MsgGUID: rO5mCPx9SS61qVytNKPvZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64885923"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="64885923"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:24:28 -0700
X-CSE-ConnectionGUID: mI6syXNGQjmuafPvGXPUrA==
X-CSE-MsgGUID: wIuTFjZWQhaut4L7uygExQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="154634328"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa009.fm.intel.com with ESMTP; 02 Jul 2025 23:24:26 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] drm/xe: Release runtime pm for error path of
 xe_devcoredump_read()
Date: Thu,  3 Jul 2025 06:20:27 +0000
Message-ID: <20250703062024.3441918-6-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703062024.3441918-4-shuicheng.lin@intel.com>
References: <20250703062024.3441918-4-shuicheng.lin@intel.com>
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

xe_pm_runtime_put() is missed to be called for the error path in
xe_devcoredump_read().
Add function description comments for xe_devcoredump_read() to help
understand it.

Fixes: c4a2e5f865b7 ("drm/xe: Add devcoredump chunking")
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 32 +++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 94625010abc4..701ffe6c8264 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -171,14 +171,29 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 
 #define XE_DEVCOREDUMP_CHUNK_MAX	(SZ_512M + SZ_1G)
 
+/**
+ * xe_devcoredump_read - Read data from the Xe device coredump snapshot
+ * @buffer: Destination buffer to copy the coredump data into
+ * @offset: Offset in the coredump data to start reading from
+ * @count: Number of bytes to read
+ * @data: Pointer to the xe_devcoredump structure
+ * @datalen: Length of the data (unused)
+ *
+ * Reads a chunk of the coredump snapshot data into the provided buffer,
+ * handling chunked reads for large coredumps and ensuring proper locking.
+ *
+ * Return: Number of bytes copied on success, or a negative error code on failure.
+ */
 static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 				   size_t count, void *data, size_t datalen)
 {
 	struct xe_devcoredump *coredump = data;
 	struct xe_devcoredump_snapshot *ss;
-	ssize_t byte_copied;
+	ssize_t byte_copied = 0;
 	u32 chunk_offset;
 	ssize_t new_chunk_position;
+	bool pm_acquired = false;
+	int ret = 0;
 
 	if (!coredump)
 		return -ENODEV;
@@ -188,19 +203,23 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	/* Ensure delayed work is captured before continuing */
 	flush_work(&ss->work);
 
-	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
+	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX) {
 		xe_pm_runtime_get(gt_to_xe(ss->gt));
+		pm_acquired = true;
+	}
 
 	mutex_lock(&coredump->lock);
 
 	if (!ss->read.buffer) {
 		mutex_unlock(&coredump->lock);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto pm_put;
 	}
 
 	if (offset >= ss->read.size) {
 		mutex_unlock(&coredump->lock);
-		return 0;
+		ret = 0;
+		goto pm_put;
 	}
 
 	new_chunk_position = div_u64_rem(offset,
@@ -223,10 +242,11 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 
 	mutex_unlock(&coredump->lock);
 
-	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
+pm_put:
+	if (pm_acquired)
 		xe_pm_runtime_put(gt_to_xe(ss->gt));
 
-	return byte_copied;
+	return byte_copied ? byte_copied : ret;
 }
 
 static void xe_devcoredump_free(void *data)
-- 
2.49.0

