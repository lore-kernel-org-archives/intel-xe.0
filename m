Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D412D64099
	for <intel-xe@archiver.kernel.org>; Sat,  9 Nov 2024 01:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241FB10E339;
	Sat,  9 Nov 2024 01:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LyGAR+M8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641AD10E326
 for <Intel-Xe@lists.freedesktop.org>; Sat,  9 Nov 2024 01:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731117577; x=1762653577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gWOJ1tA+/4DwEXEWhtUw/KxpMZK7xjWSv3CDHaeFI0I=;
 b=LyGAR+M8g+Vl1lEqvp3Kgf8cuxQh5rjcyhw8riM/ipbtdWycg0BcYPad
 MZKKv/Ay9oYfGwQJeWcJt3iB45yoTZbXirnCS5ucyevEZDqBz3OEs5OIT
 xjnt6onJIny0f9QvQ8lX/ORJSz/+ppBNjGXx32G0+QltqbmstjdX587tt
 G5SRmVXdmlmyRQY2D2dHi84kLq5FOV5tjZp6yldGaV6xckt2ONacrtOm0
 Id6wdsbwRY9u5NUbmL4Lb+c5I4rNv/MQlGuh25cjyybh5A7W7VpLGUDme
 CV/Av07w2APNo5gZ5IZ/wmAxG3jzO9SntyoNvNqZtUBRxMARtFWEnIIX8 A==;
X-CSE-ConnectionGUID: rRyDPddWTwy0SE+7mrAMjA==
X-CSE-MsgGUID: RCOI0YkXR9erDM2QP28mbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="34799512"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="34799512"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 17:59:36 -0800
X-CSE-ConnectionGUID: BWqQL4HNQ0qmfcmPzkA8Rg==
X-CSE-MsgGUID: 1HT0UvOBTAGQT3vedC5r7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="90369011"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 08 Nov 2024 17:59:35 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [RFC 3/5] drm/xe: Disconnect coredump structure from xe_device
 structure
Date: Fri,  8 Nov 2024 17:59:32 -0800
Message-ID: <20241109015934.2203462-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241109015934.2203462-1-John.C.Harrison@Intel.com>
References: <20241109015934.2203462-1-John.C.Harrison@Intel.com>
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

The devcoredump code is currently assuming that there is only ever one
coredump object and it lives inside an xe_device object. This will not
be the case shortly. So break that assumption and add a direct link
from the coredump back to the xe instead.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 25 ++++++++++-------------
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 ++
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index f0fcc898b3ae..53dc79506094 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -69,11 +69,6 @@
 /* 1 hour timeout */
 #define XE_COREDUMP_TIMEOUT_JIFFIES (60 * 60 * HZ)
 
-static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
-{
-	return container_of(coredump, struct xe_device, devcoredump);
-}
-
 static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
 {
 	return &q->gt->uc.guc;
@@ -82,14 +77,13 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
 static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 				     struct xe_devcoredump *coredump)
 {
-	struct xe_device *xe;
+	struct xe_device *xe = coredump->xe;
 	struct xe_devcoredump_snapshot *ss;
 	struct drm_printer p;
 	struct drm_print_iterator iter;
 	struct timespec64 ts;
 	int i;
 
-	xe = coredump_to_xe(coredump);
 	ss = &coredump->snapshot;
 
 	iter.data = buffer;
@@ -221,7 +215,7 @@ static void xe_devcoredump_free(void *data)
 	struct xe_devcoredump *coredump = data;
 
 	/* Our device is gone. Nothing to do... */
-	if (!data || !coredump_to_xe(coredump))
+	if (!data)
 		return;
 
 	cancel_work_sync(&coredump->snapshot.work);
@@ -233,8 +227,10 @@ static void xe_devcoredump_free(void *data)
 	memset(&coredump->snapshot, 0, sizeof(coredump->snapshot));
 	coredump->captured = false;
 	coredump->job = NULL;
-	drm_info(&coredump_to_xe(coredump)->drm,
-		 "Xe device coredump has been deleted.\n");
+
+	/* Only report to user when freeing the sysfs accessible dump */
+	if (coredump == &coredump->xe->devcoredump)
+		drm_info(&coredump->xe->drm, "Xe device coredump has been deleted.\n");
 }
 
 static void devcoredump_snapshot_job(struct xe_devcoredump *coredump,
@@ -298,7 +294,7 @@ static void devcoredump_snapshot_gt(struct xe_devcoredump *coredump, struct xe_g
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
-static void devcoredump_snapshot_xe(struct xe_devcoredump *coredump, struct xe_device *xe)
+static void devcoredump_snapshot_xe(struct xe_devcoredump *coredump)
 {
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
 
@@ -309,7 +305,7 @@ static void devcoredump_snapshot_xe(struct xe_devcoredump *coredump, struct xe_d
 	struct xe_gt *gt;
 	int i;
 
-	for_each_gt(gt, xe, i) {
+	for_each_gt(gt, coredump->xe, i) {
 		struct xe_gt_snapshot *ss_gt;
 		struct xe_guc *guc = &gt->uc.guc;
 		unsigned int fw_ref;
@@ -340,7 +336,7 @@ static void devcoredump_snapshot_for_thing(struct xe_devcoredump *coredump,
 	struct xe_device *xe;
 	bool cookie;
 
-	xe = coredump_to_xe(coredump);
+	xe = coredump->xe;
 
 	xe_assert(xe, !coredump->captured);
 	coredump->captured = true;
@@ -358,7 +354,7 @@ static void devcoredump_snapshot_for_thing(struct xe_devcoredump *coredump,
 	else if (gt)
 		devcoredump_snapshot_gt(coredump, gt);
 	else
-		devcoredump_snapshot_xe(coredump, xe);
+		devcoredump_snapshot_xe(coredump);
 
 	queue_work(system_unbound_wq, &ss->work);
 
@@ -378,6 +374,7 @@ static void devcoredump_for_thing(struct xe_device *_xe, struct xe_gt *gt, struc
 		return;
 	}
 
+	coredump->xe = xe;
 	devcoredump_snapshot_for_thing(coredump, gt, job);
 
 	drm_info(&xe->drm, "Xe device coredump has been created\n");
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 3703ddea1252..cf0233c268d1 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -76,6 +76,8 @@ struct xe_devcoredump_snapshot {
  * for reading the information.
  */
 struct xe_devcoredump {
+	/** @xe: Related Xe device */
+	struct xe_device *xe;
 	/** @captured: The snapshot of the first hang has already been taken. */
 	bool captured;
 	/** @snapshot: Snapshot is captured at time of the first crash */
-- 
2.47.0

