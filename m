Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C797BC55175
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 02:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F5310E1A2;
	Fri, 31 Jul 2026 02:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P2KZXMt+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9129D10E131
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 02:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785464685; x=1817000685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eUWdE98/R2Xpy7hG48uhsCeyh6fqdtCmTk+BQOaaOOU=;
 b=P2KZXMt+DxKrQpQh+qxmGyyCiyHiHFTRK4oQIX8u4EimsHWdPlegvyWz
 zyv28cLcX7B723foZupD6aRv+2b2VOxokhRFkbWv9cJGKjJbugQTYC+Ix
 jcnnr8ZYsP7pqsuLB7FWOvHF4TtGov44n2RL9kk+IB3SuIKEvPrcQbtbo
 0dNbNwHb6jfq11X3ceJ9cZy9eWuv63GEg2lLKFdUrmIj4jMIFy9Aq+5hn
 gZ2wvkqY61SpdN2fN58jw81668cqkw8jF3XIbwecm/u+X8dVt/ySKRZcS
 1aI2h/g+lV2c50avepmeQgowLnbB5GfLl/uf/Ud4ntRZw1Gkdzg3sUa6t g==;
X-CSE-ConnectionGUID: RaDKEYCWQR6OWnBwkRmyBg==
X-CSE-MsgGUID: yHF/eHjuQKqDsCR72KZaSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="88623495"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="88623495"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 19:24:45 -0700
X-CSE-ConnectionGUID: aLLt1FfHTHm/CqNhi/ahBw==
X-CSE-MsgGUID: 1eoZQT1lRsSbbZWgOLysJw==
X-ExtLoop1: 1
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 19:24:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Carlos Santa <carlos.santa@intel.com>,
	Ryan Neph <ryanneph@google.com>
Subject: [PATCH v6 5/8] drm/xe: Adjust BO TTM priority on DONTNEED/WILLNEED
 madvise transitions
Date: Thu, 30 Jul 2026 19:24:36 -0700
Message-Id: <20260731022439.2446486-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731022439.2446486-1-matthew.brost@intel.com>
References: <20260731022439.2446486-1-matthew.brost@intel.com>
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

The DRM_XE_MADVISE ioctl lets userspace mark a VMA's BO as DONTNEED,
signalling that its contents are not needed right now and may be
discarded under memory pressure (see madvise_purgeable() in
xe_vm_madvise.c), or restore it back to WILLNEED. This is a stronger,
explicit signal than a plain unbind: userspace has told us the BO is
not just unused for now, but that it is actively fine to lose the
data. There is no reason to keep such a BO competing for LRU space
with actively used buffers, and conversely, once userspace marks it
WILLNEED again it is back in active use and should be reprioritized
accordingly.

Adjust the BO's TTM LRU priority in xe_bo_set_purgeable_state(), the
single point through which a BO's aggregate (VMA-count driven)
purgeable state actually transitions between WILLNEED and DONTNEED
(PURGED is terminal and left untouched). On a real WILLNEED -> DONTNEED
transition, drop the BO to XE_BO_PRIORITY_LOW, the same lowest level
xe_vma_destroy() already uses for a BO that has lost all of its VMA
mappings. On a DONTNEED -> WILLNEED transition, restore it via
xe_vm_bo_priority()'s existing heuristic for a private BO, or
XE_BO_PRIORITY_HIGHEST for an extobj not tied to a single VM.

Expose xe_bo_update_ttm_priority() (previously static to xe_vm.c) so
xe_bo.c can safely change the BO's priority without corrupting its
VM's TTM LRU bulk-move range, the same helper already used by
xe_vma_destroy(), xe_vma_update_bo_priority(), and
xe_vm_update_bo_priority(). xe_bo_set_purgeable_state() is always
called with the BO's dma-resv held, so this is safe.

Cc: Carlos Santa <carlos.santa@intel.com>
Cc: Ryan Neph <ryanneph@google.com>
Assisted-by: GitHub_Copilot:claude-sonnet-5
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.c | 10 +++++++---
 drivers/gpu/drm/xe/xe_vm.h |  1 +
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3d81367dc5c9..2669c487b778 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -888,6 +888,15 @@ static void xe_bo_set_purgeable_shrinker(struct xe_bo *bo,
  * transitions. Once a BO is PURGED, it cannot transition to any other state.
  * Invalid transitions are caught with xe_assert(). Shrinker page accounting
  * is updated automatically.
+ *
+ * A WILLNEED -> DONTNEED transition also lowers the BO's TTM LRU priority to
+ * XE_BO_PRIORITY_LOW, matching xe_vma_destroy()'s handling of a BO losing
+ * its last VMA: userspace has signaled it does not need these contents
+ * again soon, so make it one of the first buffers considered for
+ * eviction/shrinking. Conversely, a DONTNEED -> WILLNEED transition restores
+ * the BO's priority to whatever xe_vm_bo_priority()'s heuristic would
+ * otherwise dictate (or XE_BO_PRIORITY_HIGHEST for an extobj not tied to a
+ * single VM), since the BO is back in active use.
  */
 void xe_bo_set_purgeable_state(struct xe_bo *bo,
 			       enum xe_madv_purgeable_state new_state)
@@ -905,6 +914,14 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
 	xe_assert(xe, !(bo->purgeable.state == XE_MADV_PURGEABLE_PURGED &&
 			new_state != XE_MADV_PURGEABLE_PURGED));
 
+	if (new_state == XE_MADV_PURGEABLE_DONTNEED &&
+	    bo->purgeable.state == XE_MADV_PURGEABLE_WILLNEED)
+		xe_bo_update_ttm_priority(bo, XE_BO_PRIORITY_LOW);
+	else if (new_state == XE_MADV_PURGEABLE_WILLNEED &&
+		 bo->purgeable.state == XE_MADV_PURGEABLE_DONTNEED)
+		xe_bo_update_ttm_priority(bo, bo->vm ? xe_vm_bo_priority(bo->vm) :
+					  XE_BO_PRIORITY_HIGHEST);
+
 	bo->purgeable.state = new_state;
 	xe_bo_set_purgeable_shrinker(bo, new_state);
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a0b407bc149c..1be367b1c671 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1232,8 +1232,10 @@ static void vma_destroy_cb(struct dma_fence *fence,
 	queue_work(system_dfl_wq, &vma->destroy_work);
 }
 
-/*
- * Change @bo's TTM LRU priority to @priority. @bo's dma-resv must be held.
+/**
+ * xe_bo_update_ttm_priority() - Change a BO's TTM LRU priority
+ * @bo: The buffer object
+ * @priority: The new TTM LRU priority, one of the XE_BO_PRIORITY_* levels
  *
  * Private, user BOs of non-fault-mode VMs have bo->ttm.bulk_move set to
  * their VM's LRU bulk-move range (see xe_bo_init_locked()), which tracks a
@@ -1245,8 +1247,10 @@ static void vma_destroy_cb(struct dma_fence *fence,
  * potentially crashing on a NULL bucket). Temporarily detaching the BO from
  * its bulk-move range moves it with a plain, non-bulk LRU update instead,
  * and reattaching afterwards re-inserts it into the new priority's bucket.
+ *
+ * Context: Caller must hold @bo's dma-resv lock.
  */
-static void xe_bo_update_ttm_priority(struct xe_bo *bo, int priority)
+void xe_bo_update_ttm_priority(struct xe_bo *bo, int priority)
 {
 	struct ttm_lru_bulk_move *bulk = bo->ttm.bulk_move;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index d69481ef360f..e6e8d18c04af 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -308,6 +308,7 @@ void xe_vm_kill(struct xe_vm *vm, bool unlocked);
 void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
 void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
 int xe_vm_bo_priority(struct xe_vm *vm);
+void xe_bo_update_ttm_priority(struct xe_bo *bo, int priority);
 
 /**
  * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
-- 
2.34.1

