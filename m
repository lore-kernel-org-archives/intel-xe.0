Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E330C83F04
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 08:33:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E8E10E1AA;
	Thu,  3 Jul 2025 08:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTlTpc8U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FDD10E1AA
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 08:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751531606; x=1783067606;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=djW1GxUse0GT/9pNHmOi7Hw+g39lXIISDPoi9ThEWIM=;
 b=NTlTpc8Um0fC42YKozQ4ru+Bj6WfwRvkXq0VNWv9UE7UvtG76zmtH+AE
 u2Oz/+I3ubHXa9D/jkyu08X4/zSdKIH0nUkV6m0kbA1lbgEu/c0AEAiCK
 K36VkksNUMOK0fs2g0uJG71wFG2N/WkSfQet7VpcOvFX1eAwQehU18HVp
 8chWvB7M/Jtw+XbLvmDjtZ4zR3lO4YFhNDHZhhQPsW0HywngLj1J8xNy8
 uM+JuU+v9fGtsYN/4CxnXjAnRlvLxulKbemb0/r7uaWLSaodZRuum00vo
 pUVJWw2Qb1FWNVeJuHU7PuZzDDAsx5CJIvx/BwXRQwXGYYHHZS1QX9iG2 Q==;
X-CSE-ConnectionGUID: wkROIRi/TaW066tMgwDWMw==
X-CSE-MsgGUID: Wy+cVNY9Q/eI0oKnQX4qXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53816799"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="53816799"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 01:33:26 -0700
X-CSE-ConnectionGUID: o+sphr0SSbGO1l3THuqEtw==
X-CSE-MsgGUID: iyhGXXIfQEOn5q+e4Ju7mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="153738897"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa006.jf.intel.com with ESMTP; 03 Jul 2025 01:33:24 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Release runtime pm for error path of
 xe_devcoredump_read()
Date: Thu,  3 Jul 2025 08:32:05 +0000
Message-ID: <20250703083202.3462887-6-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703083202.3462887-4-shuicheng.lin@intel.com>
References: <20250703083202.3462887-4-shuicheng.lin@intel.com>
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

