Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B294EC3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 04:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF9210E02C;
	Thu, 10 Apr 2025 04:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IAX0lGyk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CC510E080
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 04:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744257907; x=1775793907;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=43hDpJBrPRoSuuZVsyaqYv2/FYi5uXg/vDK53y4mHKw=;
 b=IAX0lGyklmN20YXB2UFM+GHtTlinLQe5Yr4b3dPbTCdl990gGinmGq4X
 gVGlN4uQvdi0n4GPFPos4nb1u19xIgFORdWsM4d0wkwl5jAKn7oUCYzb4
 bJXeQOUQqjnHoH+V56qfJJCLlLnEtMtDAg3hEV7W7MmBMC8MsTYqtVHPK
 F7mDMLg/sD9N7BTBCRq0OhLue6l1gXKfW8MksNeTO5gdVfXGt6VUi/EhV
 NY61JH6R7jtBp+Eus61qzF3k5TQJa9DlJNoCOyOcnB4GOe0CsfmGuEdHF
 /P2fwHMNM5B3aDtfZ/6DBn7894uD3rG1IyIqUXc035ygiA+y3StIqoF2b Q==;
X-CSE-ConnectionGUID: OdzY4+pOQbqyh/JJGvfZqQ==
X-CSE-MsgGUID: ItKIPK7LS2m8yH5auNYtkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="44999850"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="44999850"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 21:05:07 -0700
X-CSE-ConnectionGUID: PFGP5VzFQMKbUVVeGAp7tQ==
X-CSE-MsgGUID: 0GlstKNHTEiBF800MCFjwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="133642760"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 21:05:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 1/4] drm/xe: Add devcoredump chunking
Date: Wed,  9 Apr 2025 21:06:19 -0700
Message-Id: <20250410040622.238389-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410040622.238389-1-matthew.brost@intel.com>
References: <20250410040622.238389-1-matthew.brost@intel.com>
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

Chunk devcoredump into 1.5G pieces to avoid hitting the kvmalloc limit
of 2G. Simple algorithm reads 1.5G at time in xe_devcoredump_read
callback as needed.

Some memory allocations are changed to GFP_ATOMIC as they done in
xe_devcoredump_read which holds lock in the path of reclaim. The
allocations are small, so in practice should never fail.

v2:
 - Update commit message wrt gfp atomic (John H)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 59 ++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 +
 drivers/gpu/drm/xe/xe_guc_hwconfig.c      |  2 +-
 3 files changed, 50 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 81b9d9bb3f57..a9e618abf8ac 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -80,7 +80,8 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
 	return &q->gt->uc.guc;
 }
 
-static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
+static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
+				     ssize_t start,
 				     struct xe_devcoredump *coredump)
 {
 	struct xe_device *xe;
@@ -94,7 +95,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 	ss = &coredump->snapshot;
 
 	iter.data = buffer;
-	iter.start = 0;
+	iter.start = start;
 	iter.remain = count;
 
 	p = drm_coredump_printer(&iter);
@@ -168,6 +169,8 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 	ss->vm = NULL;
 }
 
+#define XE_DEVCOREDUMP_CHUNK_MAX	(SZ_512M + SZ_1G)
+
 static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 				   size_t count, void *data, size_t datalen)
 {
@@ -183,6 +186,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	/* Ensure delayed work is captured before continuing */
 	flush_work(&ss->work);
 
+	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
+		xe_pm_runtime_get(gt_to_xe(ss->gt));
+
 	mutex_lock(&coredump->lock);
 
 	if (!ss->read.buffer) {
@@ -195,12 +201,26 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 		return 0;
 	}
 
+	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
+	    offset < ss->read.chunk_position) {
+		ss->read.chunk_position =
+			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
+
+		__xe_devcoredump_read(ss->read.buffer,
+				      XE_DEVCOREDUMP_CHUNK_MAX,
+				      ss->read.chunk_position, coredump);
+	}
+
 	byte_copied = count < ss->read.size - offset ? count :
 		ss->read.size - offset;
-	memcpy(buffer, ss->read.buffer + offset, byte_copied);
+	memcpy(buffer, ss->read.buffer +
+	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
 
 	mutex_unlock(&coredump->lock);
 
+	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
+		xe_pm_runtime_put(gt_to_xe(ss->gt));
+
 	return byte_copied;
 }
 
@@ -254,17 +274,32 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
 	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
 
-	xe_pm_runtime_put(xe);
+	ss->read.chunk_position = 0;
 
 	/* Calculate devcoredump size */
-	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
-
-	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
-	if (!ss->read.buffer)
-		return;
+	ss->read.size = __xe_devcoredump_read(NULL, LONG_MAX, 0, coredump);
+
+	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX) {
+		ss->read.buffer = kvmalloc(XE_DEVCOREDUMP_CHUNK_MAX,
+					   GFP_USER);
+		if (!ss->read.buffer)
+			goto put_pm;
+
+		__xe_devcoredump_read(ss->read.buffer,
+				      XE_DEVCOREDUMP_CHUNK_MAX,
+				      0, coredump);
+	} else {
+		ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
+		if (!ss->read.buffer)
+			goto put_pm;
+
+		__xe_devcoredump_read(ss->read.buffer, ss->read.size, 0,
+				      coredump);
+		xe_devcoredump_snapshot_free(ss);
+	}
 
-	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
-	xe_devcoredump_snapshot_free(ss);
+put_pm:
+	xe_pm_runtime_put(xe);
 }
 
 static void devcoredump_snapshot(struct xe_devcoredump *coredump,
@@ -425,7 +460,7 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
 	if (offset & 3)
 		drm_printf(p, "Offset not word aligned: %zu", offset);
 
-	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
+	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_ATOMIC);
 	if (!line_buff) {
 		drm_printf(p, "Failed to allocate line buffer\n");
 		return;
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 1a1d16a96b2d..a174385a6d83 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -66,6 +66,8 @@ struct xe_devcoredump_snapshot {
 	struct {
 		/** @read.size: size of devcoredump in human readable format */
 		ssize_t size;
+		/** @read.chunk_position: position of devcoredump chunk */
+		ssize_t chunk_position;
 		/** @read.buffer: buffer of devcoredump in human readable format */
 		char *buffer;
 	} read;
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index af2c817d552c..21403a250834 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -175,7 +175,7 @@ int xe_guc_hwconfig_lookup_u32(struct xe_guc *guc, u32 attribute, u32 *val)
 	if (num_dw == 0)
 		return -EINVAL;
 
-	hwconfig = kzalloc(size, GFP_KERNEL);
+	hwconfig = kzalloc(size, GFP_ATOMIC);
 	if (!hwconfig)
 		return -ENOMEM;
 
-- 
2.34.1

