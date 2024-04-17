Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594FEC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 16:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0494010F778;
	Wed, 17 Apr 2024 16:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d9mFzNBR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C4C10F778
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 16:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713371534; x=1744907534;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PeuhrkDFP6V6sTT9PbGvnwWsKE1XrIyOHjjjG4qu/gw=;
 b=d9mFzNBRRipwNHChjozwUWLULzh6rP1xvzb0Cnv0o0RgCdEiOXKVLMX5
 LtetCjmCzi8dfvFdZqA6UfUwvZ22aPfBgG23MMinEBwCdN+w9doF6+5Aa
 O0S7NqANsshQPlN6Nn0gaVQ4lZslTYmG4VDPFuB5aw3hIrrEpv046qg5l
 ZcYCSHIHk/+SxtMpuf4gXt9i63WLP0/iwtQJ1xkobOBzin7QHJtX+8cVJ
 FaUKUYgO/tIl0Z6Fdftr78hqlYr+vxRQd9y2CBJCoQszvPjiBgZu4+Pft
 Nk664AfDKWe1hFK9SK8XN3HVx2j3R1HEkroCxHzlhnNnpFvt3jwfYa3CK w==;
X-CSE-ConnectionGUID: 0UgqtdCzRzSueNlJ6DE7Jw==
X-CSE-MsgGUID: kn1tmqUaRvePQkB3YU1haQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9043912"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="9043912"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 09:32:13 -0700
X-CSE-ConnectionGUID: 0EzlbO3hR0WEdINK+o6M7w==
X-CSE-MsgGUID: 8D+8zjWNQK2KoSUQiGYIhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="27252110"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.81])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 09:32:11 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/xe/vm: prevent UAF in rebind_work_func()
Date: Wed, 17 Apr 2024 17:31:08 +0100
Message-ID: <20240417163107.270053-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
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

We flush the rebind worker during the vm close phase, however in places
like preempt_fence_work_func() we seem to queue the rebind worker
without first checking if the vm has already been closed.  The concern
here is the vm being closed with the worker flushed, but then being
rearmed later, which looks like potential uaf, since there is no actual
refcounting to track the queued worker. To ensure this can't happen
prevent queueing the rebind worker once the vm has been closed.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1591
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1304
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1249
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_pt.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.h | 17 ++++++++++++++---
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 5b7930f46cf3..e21461be904f 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1327,7 +1327,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 		}
 		if (!rebind && last_munmap_rebind &&
 		    xe_vm_in_preempt_fence_mode(vm))
-			xe_vm_queue_rebind_worker(vm);
+			xe_vm_queue_rebind_worker_locked(vm);
 	} else {
 		kfree(rfence);
 		kfree(ifence);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 306cd0934a19..8420fbf19f6d 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -211,10 +211,20 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
 
 int xe_vm_invalidate_vma(struct xe_vma *vma);
 
-static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
+static inline void xe_vm_queue_rebind_worker_locked(struct xe_vm *vm)
 {
 	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
-	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
+	lockdep_assert_held(&vm->lock);
+
+	if (!xe_vm_is_closed(vm))
+		queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
+}
+
+static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
+{
+	down_read(&vm->lock);
+	xe_vm_queue_rebind_worker_locked(vm);
+	up_read(&vm->lock);
 }
 
 /**
@@ -225,12 +235,13 @@ static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
  * If the rebind functionality on a compute vm was disabled due
  * to nothing to execute. Reactivate it and run the rebind worker.
  * This function should be called after submitting a batch to a compute vm.
+ *
  */
 static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
 {
 	if (xe_vm_in_preempt_fence_mode(vm) && vm->preempt.rebind_deactivated) {
 		vm->preempt.rebind_deactivated = false;
-		xe_vm_queue_rebind_worker(vm);
+		xe_vm_queue_rebind_worker_locked(vm);
 	}
 }
 
-- 
2.44.0

