Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D90DC83030
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 07:42:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABD910E7D9;
	Thu,  3 Jul 2025 07:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQj0i7e8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C6710E7DB
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 07:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751528565; x=1783064565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=djW1GxUse0GT/9pNHmOi7Hw+g39lXIISDPoi9ThEWIM=;
 b=dQj0i7e8ZYBopspA6M9GCyWkXH17m0bCvurvNdGvuoA8HrsHsQ+eGZCZ
 lE6hpQl+/pz1Gonwpl4T/c3WFigNcJsIRQPtliyKljquZYrlvHjQ40Ckb
 kmZKmMmSyFgCvyMnH6t0mOKR+aDXWbXlKN17UrfJYO69aXZbq7+LlOoCG
 3424wFcA+3N60Gnis7X7gkbuxMmUxlgm/oNYXoqWgk96fLD8hXbt37a4b
 k/hM4KDZFZYXpzGdcEHRrYyYBk37SJ9kt4/mYoMPoREyW7Ks9odWfLUFu
 4kPb5OqwPP0irAzgeHQa9bIeFxmxhGAArUh38L/F7TfnV33d7etA74NNi g==;
X-CSE-ConnectionGUID: ui+zLF1cTtqbamiSThvhcQ==
X-CSE-MsgGUID: wyLG3arqQb+Pdf6ibRoS7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53938261"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="53938261"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 00:42:45 -0700
X-CSE-ConnectionGUID: 2ZSjhBOOTlyzSJwEwW9FrQ==
X-CSE-MsgGUID: jh9COUdHR3qkcxYYNCuIDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="155043736"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa010.fm.intel.com with ESMTP; 03 Jul 2025 00:42:44 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Release runtime pm for error path of
 xe_devcoredump_read()
Date: Thu,  3 Jul 2025 07:41:08 +0000
Message-ID: <20250703074105.3461107-6-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703074105.3461107-4-shuicheng.lin@intel.com>
References: <20250703062024.3441918-4-shuicheng.lin@intel.com>
 <20250703074105.3461107-4-shuicheng.lin@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>
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

