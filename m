Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979E8606A31B
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 19:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i1VdFb4o
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6081510EC3E;
	Tue, 20 Oct 2026 19:08:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A669F10EC3E
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 19:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792523331; x=1824059331;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VOB5odbYNUR1fFeaU8vNG8SOmJ+q4vrrv2pSst7Cpl8=;
 b=i1VdFb4obXMEHB3lCIuqie/HKkn23EqqAziAOm7PEvxhwPy8Wmr2tuJg
 xaVo2cwVyLQJ9BLeTJOyGftdcIAs4p6+raN0olSXRi/a5A4ljs6oHWnwq
 Jkauo0jn143+f6xIdFD01w2+in5/vSYu3VDeubuafp00JvmeQNSZ2CgsV
 uyCJgz8nj1PXUGeqs7bGS3V9dKoyDzoxj+swLL77V8uwgolpHjGuwKgZt
 S+j88uYwn7xjpzHFoZGsjcmIKnv0mxlatI3c87z+Nec6i3koKKcCPcnO2
 1RObgezPVEOX1pfX7VLFiXgHv7iG4K/y/CGlL4PyRgtVDtK/Qlv8YtlZi Q==;
X-CSE-ConnectionGUID: l6g862XqTN6M+kCOR7UBag==
X-CSE-MsgGUID: BdkW4gS0SnWq+PxrcPvx8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1339817"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1339817"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 12:08:45 -0700
X-CSE-ConnectionGUID: Ur9S7uMfTVS2gUA5Sps6JA==
X-CSE-MsgGUID: VZFG62MyQ2qxnmZXwqabtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3226592"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 12:08:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 1/3] drm/xe: Tie BO TTM LRU priority to DONTNEED/WILLNEED
 madvise state
Date: Tue, 20 Oct 2026 12:08:38 -0700
Message-Id: <20261020190840.854525-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020190840.854525-1-matthew.brost@intel.com>
References: <20261020190840.854525-1-matthew.brost@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DRM_XE_MADVISE ioctl lets userspace mark a VMA's BO as DONTNEED,
signalling that its contents are not needed right now and may be
discarded under memory pressure (see madvise_purgeable() in
xe_vm_madvise.c), or restore it back to WILLNEED. This is a stronger,
explicit signal than a plain unbind: userspace has told us the BO is not
just unused for now, but that it is actively fine to lose the data.
There is no reason to keep such a BO competing for LRU space with
actively used buffers, and conversely, once userspace marks it WILLNEED
again it is back in active use and should be reprioritized accordingly.

Give xe two TTM LRU priority bands and tie them to that state:
XE_BO_PRIORITY_LOW for DONTNEED BOs and XE_BO_PRIORITY_NORMAL for
everything else. Since the TTM LRU is walked in ascending priority
order, DONTNEED BOs become the first candidates for eviction and
shrinking. The transition is driven from xe_bo_set_purgeable_state(),
the single point through which a BO's aggregate purgeable state actually
moves between WILLNEED and DONTNEED (PURGED is terminal and left at
XE_BO_PRIORITY_LOW).

Changing bo->ttm.priority cannot be done by a plain store: private, user
BOs have bo->ttm.bulk_move set to their VM's LRU bulk-move range, which
tracks a contiguous [first, last] run of resources per (mem_type,
priority) bucket. Writing the priority while the BO is still attached
would leave the resource linked in the old priority's bucket while the
bulk-move code looks it up under the new one, corrupting both. Add
xe_bo_update_ttm_priority(), which temporarily detaches the BO from its
bulk-move range, updates the priority with a plain non-bulk LRU update,
and reattaches it into the new priority's bucket.
xe_bo_set_purgeable_state() is always called with the BO's dma-resv
held, so this is safe.

With DONTNEED BOs now clustered at XE_BO_PRIORITY_LOW, the shrinker's
purge pass no longer needs to walk each memory type's whole LRU: nothing
beyond XE_BO_PRIORITY_LOW can possibly be purgeable, so continuing past
it just wastes time trylocking BOs that can never be purged in this
pass. Break out of the per-mem_type LRU walk in __xe_shrinker_walk()
once a BO's priority rises above XE_BO_PRIORITY_LOW during the purge
pass. Behavior of the non-purge (regular shrink) pass is unchanged.

Assisted-by: LLM
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 46 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo_types.h |  8 +++++-
 drivers/gpu/drm/xe/xe_shrinker.c |  3 +++
 3 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 1b74331b15ec..bc4801c48fce 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -992,6 +992,38 @@ static void xe_bo_set_purgeable_shrinker(struct xe_bo *bo,
 	}
 }
 
+/*
+ * Change @bo's TTM LRU priority to @priority. @bo's dma-resv must be held.
+ *
+ * Private, user BOs of non-fault-mode VMs have bo->ttm.bulk_move set to their
+ * VM's LRU bulk-move range (see xe_bo_create_user()), which tracks a
+ * contiguous [first, last] run of resources per (mem_type, priority) bucket.
+ * Writing bo->ttm.priority while the BO is still attached to that range would
+ * leave the resource linked in the old priority's bucket while the bulk-move
+ * code looks it up under the new one, corrupting both buckets. Temporarily
+ * detaching the BO from its bulk-move range moves it with a plain, non-bulk
+ * LRU update instead, and reattaching afterwards re-inserts it into the new
+ * priority's bucket.
+ */
+static void xe_bo_update_ttm_priority(struct xe_bo *bo, int priority)
+{
+	struct ttm_lru_bulk_move *bulk = bo->ttm.bulk_move;
+
+	xe_bo_assert_held(bo);
+
+	if (bo->ttm.priority == priority)
+		return;
+
+	if (bulk)
+		ttm_bo_set_bulk_move(&bo->ttm, NULL);
+
+	bo->ttm.priority = priority;
+	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
+
+	if (bulk)
+		ttm_bo_set_bulk_move(&bo->ttm, bulk);
+}
+
 /**
  * xe_bo_set_purgeable_state() - Set BO purgeable state with validation
  * @bo: Buffer object
@@ -1001,6 +1033,13 @@ static void xe_bo_set_purgeable_shrinker(struct xe_bo *bo,
  * transitions. Once a BO is PURGED, it cannot transition to any other state.
  * Invalid transitions are caught with xe_assert(). Shrinker page accounting
  * is updated automatically.
+ *
+ * A WILLNEED -> DONTNEED transition also lowers the BO's TTM LRU priority to
+ * XE_BO_PRIORITY_LOW: userspace has signaled it does not need these contents
+ * again soon, so make it one of the first buffers considered for
+ * eviction/shrinking. The shrinker's purge pass relies on this clustering to
+ * bound its LRU walk. Conversely, a DONTNEED -> WILLNEED transition restores
+ * XE_BO_PRIORITY_NORMAL, since the BO is back in active use.
  */
 void xe_bo_set_purgeable_state(struct xe_bo *bo,
 			       enum xe_madv_purgeable_state new_state)
@@ -1018,6 +1057,13 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
 	xe_assert(xe, !(bo->purgeable.state == XE_MADV_PURGEABLE_PURGED &&
 			new_state != XE_MADV_PURGEABLE_PURGED));
 
+	if (new_state == XE_MADV_PURGEABLE_DONTNEED &&
+	    bo->purgeable.state == XE_MADV_PURGEABLE_WILLNEED)
+		xe_bo_update_ttm_priority(bo, XE_BO_PRIORITY_LOW);
+	else if (new_state == XE_MADV_PURGEABLE_WILLNEED &&
+		 bo->purgeable.state == XE_MADV_PURGEABLE_DONTNEED)
+		xe_bo_update_ttm_priority(bo, XE_BO_PRIORITY_NORMAL);
+
 	bo->purgeable.state = new_state;
 	xe_bo_set_purgeable_shrinker(bo, new_state);
 }
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 8ec4a01a0092..0265fb314c77 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -24,7 +24,13 @@ struct xe_exec_queue;
 
 #define XE_BO_MAX_PLACEMENTS	3
 
-/* TODO: To be selected with VM_MADVISE */
+/*
+ * TTM LRU priority bands. The LRU is walked in ascending priority order, so
+ * XE_BO_PRIORITY_LOW objects are the first candidates for eviction and
+ * shrinking. BOs advised DONTNEED through DRM_XE_MADVISE live at
+ * XE_BO_PRIORITY_LOW, everything else at XE_BO_PRIORITY_NORMAL.
+ */
+#define	XE_BO_PRIORITY_LOW	0
 #define	XE_BO_PRIORITY_NORMAL	1
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index 772dab9b3ed7..c86455ea08d1 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -133,6 +133,9 @@ static int __xe_shrinker_walk(struct xe_shrinker *shrinker,
 		}
 
 		ttm_bo_lru_for_each_reserved_guarded(&curs, man, &arg, ttm_bo) {
+			if (flags.purge && ttm_bo->priority > XE_BO_PRIORITY_LOW)
+				break;
+
 			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
 				continue;
 
-- 
2.34.1

