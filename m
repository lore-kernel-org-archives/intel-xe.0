Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3F9C83F03
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 00:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D1310E3E3;
	Mon,  7 Jul 2025 00:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjGimwM9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7729410E3E3
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 00:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751849440; x=1783385440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=foYdcZhVKcls0gvVpEQhGrir3U+zPQ9ejRf2QehsM4M=;
 b=fjGimwM9QRj4dkOEqcSAPTgaNj67xCCa5r5eWYkojppHt/wQKsO7tF4Z
 RflnG1bms+N92bXjbU7cFND66UN4BkBHy0NsyCvWHC3IP+NgC5PMQ8+kK
 iFni9ys1J2abuLWkv+H38WWyXLooFT4fcUrVqs/YiSZ95qaTg69edvzbc
 8uEp+2E8SUkaqKp3ONPH/ilmTdILwFLVT7hrsnIlR5HAQUYh3lVk4qPOW
 m7UiIU0hVyCMQM/Ggv40TS8GFDndZG+dTIsIp6yZeG5uwqR7fZxsxJyio
 gHJBg+hb2v4qDtbzbR1GGc3CYezIh2UT2wKirSzXabifkbruGR23Q4s8t w==;
X-CSE-ConnectionGUID: KnW7R17BQ1Sc7pvPYGA3Bg==
X-CSE-MsgGUID: bPPn92jVRI61wxC7lb52ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="54205000"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="54205000"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 17:50:40 -0700
X-CSE-ConnectionGUID: yiBgC0JHQTKM0g7vSmvQWA==
X-CSE-MsgGUID: yCPVubaKT/6qrDsKSADdJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="155564852"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa008.jf.intel.com with ESMTP; 06 Jul 2025 17:50:39 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v3 2/2] drm/xe: Release runtime pm for error path of
 xe_devcoredump_read()
Date: Mon,  7 Jul 2025 00:49:14 +0000
Message-ID: <20250707004911.3502904-6-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707004911.3502904-4-shuicheng.lin@intel.com>
References: <20250707004911.3502904-4-shuicheng.lin@intel.com>
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

v2: more detail function comments and refine goto logic (Matt)

Fixes: c4a2e5f865b7 ("drm/xe: Add devcoredump chunking")
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 38 +++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 94625010abc4..203e3038cc81 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -171,14 +171,32 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 
 #define XE_DEVCOREDUMP_CHUNK_MAX	(SZ_512M + SZ_1G)
 
+/**
+ * xe_devcoredump_read() - Read data from the Xe device coredump snapshot
+ * @buffer: Destination buffer to copy the coredump data into
+ * @offset: Offset in the coredump data to start reading from
+ * @count: Number of bytes to read
+ * @data: Pointer to the xe_devcoredump structure
+ * @datalen: Length of the data (unused)
+ *
+ * Reads a chunk of the coredump snapshot data into the provided buffer.
+ * If the devcoredump is smaller than 1.5 GB (XE_DEVCOREDUMP_CHUNK_MAX),
+ * it is read directly from a pre-written buffer. For larger devcoredumps,
+ * the pre-written buffer must be periodically repopulated from the snapshot
+ * state due to kmalloc size limitations.
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
+	bool pm_needed = false;
+	int ret = 0;
 
 	if (!coredump)
 		return -ENODEV;
@@ -188,20 +206,19 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	/* Ensure delayed work is captured before continuing */
 	flush_work(&ss->work);
 
-	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
+	pm_needed = ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX;
+	if (pm_needed)
 		xe_pm_runtime_get(gt_to_xe(ss->gt));
 
 	mutex_lock(&coredump->lock);
 
 	if (!ss->read.buffer) {
-		mutex_unlock(&coredump->lock);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto unlock;
 	}
 
-	if (offset >= ss->read.size) {
-		mutex_unlock(&coredump->lock);
-		return 0;
-	}
+	if (offset >= ss->read.size)
+		goto unlock;
 
 	new_chunk_position = div_u64_rem(offset,
 					 XE_DEVCOREDUMP_CHUNK_MAX,
@@ -221,12 +238,13 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 		ss->read.size - offset;
 	memcpy(buffer, ss->read.buffer + chunk_offset, byte_copied);
 
+unlock:
 	mutex_unlock(&coredump->lock);
 
-	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
+	if (pm_needed)
 		xe_pm_runtime_put(gt_to_xe(ss->gt));
 
-	return byte_copied;
+	return byte_copied ? byte_copied : ret;
 }
 
 static void xe_devcoredump_free(void *data)
-- 
2.49.0

