Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E701CAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 13:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E551110E8C8;
	Thu, 18 Sep 2025 13:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gICBSne7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C132E10E8C8
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 13:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758203800; x=1789739800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=odOkuukZq6WqzdbsMJviWEhqdReBGlH3zmn5lWBPumU=;
 b=gICBSne7Rz0E6td4kZO5x1y1Y/dqKYOHEoz1EghK29w3q2SDeztq4rQ/
 +u8WF9e05SPwWANi8TICYz01mCMf0cxJMxKdVBA6WYSw3zjjBkIFOYkJ1
 dXq0LT1ckzozmWg2J+Zo76mDh3N3GoGGtxppuscKGRP9QtQ6WvhZVy01H
 59w6tkwHBGI4c2kOmpSnPYcEJBq6UdLA0kYUkb+4bPvcvkBNPz8ZATZjb
 6ppWU0bqDRL+YlvNm4FfhofpEdad7dAYZcnHGvNJt4YxX+ApygP4t2wMT
 fm4AgodgyU+hwwfI91d8wNrjSSlnt4l/w6ZDE9UdsPzaFBzbh+8q7+NmG Q==;
X-CSE-ConnectionGUID: 5lNZGZqhT264C7RYsozMZQ==
X-CSE-MsgGUID: 78/j8gbUT2+uhz9Cj1Pn+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64337083"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64337083"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 06:56:40 -0700
X-CSE-ConnectionGUID: vAdurDm1SpCutAPQ8PgwRg==
X-CSE-MsgGUID: a4UWiBZxRWGcGla8YTbggQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="179828064"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa004.jf.intel.com with ESMTP; 18 Sep 2025 06:56:39 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@intel.com, Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v1 3/5] drm/xe: add drm_exec helper to atomically lock VM (+
 optional BO) with BOOKKEEP retry
Date: Thu, 18 Sep 2025 19:55:27 +0530
Message-Id: <20250918142529.608432-4-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250918142529.608432-1-nitin.r.gote@intel.com>
References: <20250918142529.608432-1-nitin.r.gote@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add xe_vm_exec_lock_vm_and_bo(), a drm_exec-based helper that atomically
acquires the VM reservation and an optional BO reservation. When requested
(wait_bookkeep) the helper verifies DMA_RESV_USAGE_BOOKKEEP is clear and,
if not, releases the exec locks, waits outside the reservation and retries.

This centralises the drm_exec + BOOKKEEP wait/retry logic used by vm_bind
paths, avoiding duplicated code and preventing sleeps while holding resv
locks. Caller must call drm_exec_fini(exec) on success and must not
re-acquire vm->lock while exec holds the reservations.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 53 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0cacab20ff85..fae88c4c981e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3496,6 +3496,59 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 	return 0;
 }
 
+/* Helper:
+ * Atomically acquire VM (+ optional BO) reservations using drm_exec.
+ * If wait_bookkeep is true, ensure VM BOOKKEEP is clear before returning:
+ *  - if BOOKKEEP fences exist, release exec locks, wait outside and retry.
+ *
+ * On success returns 0 with *exec initialized and the reservations held.
+ * Caller MUST call drm_exec_fini(exec) to release reservations.
+ */
+static int xe_vm_exec_lock_vm_and_bo(struct xe_vm *vm, struct xe_bo *bo,
+				     struct drm_exec *exec, bool intr,
+				     bool wait_bookkeep)
+{
+	int err = 0, wait;
+
+retry:
+	drm_exec_init(exec, intr ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0, 0);
+	drm_exec_until_all_locked(exec) {
+		err = drm_exec_lock_obj(exec, xe_vm_obj(vm));
+		drm_exec_retry_on_contention(exec);
+		if (err)
+			break;
+
+		if (bo)	{
+			err = drm_exec_lock_obj(exec, &bo->ttm.base);
+			drm_exec_retry_on_contention(exec);
+			if (err)
+				break;
+		}
+	}
+
+	if (err) {
+		/* Ensure exec cleaned up if partially initialized */
+		drm_exec_fini(exec);
+		return err;
+	}
+
+	if (wait_bookkeep) {
+		/* If BOOKKEEP fences exist, release exec and wait outside, then retry */
+		if (!dma_resv_test_signaled(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP)) {
+			drm_exec_fini(exec);
+			wait = dma_resv_wait_timeout(xe_vm_resv(vm),
+						     DMA_RESV_USAGE_BOOKKEEP,
+						     true, MAX_SCHEDULE_TIMEOUT);
+			if (wait <= 0)
+				return -ETIME;
+			goto retry;
+		}
+	}
+
+	/* Success: exec holds the reservations */
+	return 0;
+}
+
 int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
-- 
2.25.1

