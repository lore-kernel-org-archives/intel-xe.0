Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B900CD30019
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 16:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6161C10E382;
	Fri, 18 Oct 2024 16:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zv7WOCpr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7E310E382
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 16:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729267920; x=1760803920;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EHrpDdG9U0X2sHwmlv4vWp6cUBMs83aiOZ3LPOxQlks=;
 b=Zv7WOCprFcrMrpYxswYpjrN+zSLfWwGC+vBcve0Vyy9YigdhSSIUjORK
 RIFwcNTq4ivGPizKi6d826f9dC6+Gqmi67V0QHISAZkdZm7CgKptUQ9LD
 kG+RL5+gY9BEggJckMS6mlnO0BkGMzVRkKzNaLNTgo+XNpt1onFIy2xOs
 /EkCPfZNacUYprs2Ku5sKVi8FmM9XhS7C0Ssw/o6QloreLxdzn0E0ZSzd
 CiKnRSdb+5MwMu/2I84OKroqHmLMqMyId38/tmnnVIepvKrsuqjfzTBFE
 v0lA8r1uKNg9JA1XVR2HfhknIWc/T7izhQMOM50gM8xNsj9nL3fUv69pN A==;
X-CSE-ConnectionGUID: SLQ1n03hSMC4gtWqlNEklA==
X-CSE-MsgGUID: jLGgyEA9RhyO31pBgLAexQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39351335"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39351335"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 09:12:00 -0700
X-CSE-ConnectionGUID: wQfcnDyDTqaGwfaKsj/McQ==
X-CSE-MsgGUID: CM4S/uqoQrGTdGYUDHCgRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="109730498"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 09:11:57 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4] drm/xe/ufence: Signal ufence faster when possible
Date: Fri, 18 Oct 2024 17:29:58 +0200
Message-ID: <20241018152958.1975994-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

When the backing fence is already signaled, the ufence can be
immediately signaled without queuing in the ordered work queue.
This should also reduce load from the xe ordered_wq and won't
block signaling a ufence which doesn't require any serialization.

v2: fix system_wq typo
v3: signal immediately instead of queuing in system_wq (Matt B)
v4: revert back to v2 of using workqueue because of locking issue
    and remote viewing a different mm struct.
    Use Xe's unordered_wq which should be less congested than global
    one.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index a90480c6aecf..7a1558c7ce09 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -92,18 +92,27 @@ static void user_fence_worker(struct work_struct *w)
 	user_fence_put(ufence);
 }
 
-static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
+static void kick_ufence_ordered(struct xe_user_fence *ufence,
+				struct dma_fence *fence)
 {
 	INIT_WORK(&ufence->worker, user_fence_worker);
 	queue_work(ufence->xe->ordered_wq, &ufence->worker);
 	dma_fence_put(fence);
 }
 
+static void kick_ufence_unordered(struct xe_user_fence *ufence,
+				  struct dma_fence *fence)
+{
+	INIT_WORK(&ufence->worker, user_fence_worker);
+	queue_work(ufence->xe->unordered_wq, &ufence->worker);
+	dma_fence_put(fence);
+}
+
 static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 {
 	struct xe_user_fence *ufence = container_of(cb, struct xe_user_fence, cb);
 
-	kick_ufence(ufence, fence);
+	kick_ufence_ordered(ufence, fence);
 }
 
 int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
@@ -239,7 +248,16 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
 		err = dma_fence_add_callback(fence, &sync->ufence->cb,
 					     user_fence_cb);
 		if (err == -ENOENT) {
-			kick_ufence(sync->ufence, fence);
+			/*
+			 * use unordered_wq to schedule it faster and to keep
+			 * the ordered_wq less loaded as serialization is not
+			 * needed for when the fence is already signaled.
+			 *
+			 * This needs to be done with a wq here to avoid locking
+			 * issue when a ufence addr is backed by a bo and also
+			 * tsk->mm needs to null to call kthread_use_mm().
+			 */
+			kick_ufence_unordered(sync->ufence, fence);
 		} else if (err) {
 			XE_WARN_ON("failed to add user fence");
 			user_fence_put(sync->ufence);
-- 
2.46.0

