Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFB8C55177
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 02:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048C610F118;
	Fri, 31 Jul 2026 02:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fn9hIG+j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C35B10E14C
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 02:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785464685; x=1817000685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ivuaTuYOF2GYPKGvqlj0UTrwNBnqBWBrLVpVjTxW5kQ=;
 b=fn9hIG+jQhH4XWX1xfGnBy0Q5VCmPRT1Zowl1t4s/DsP7Vh8uA1KHxxp
 D0Mz1PDd7tZW79n/vrJcncWWhGLQkgk0BPa+jsvvUJE9l5vYKAoxXf++B
 knTSm8wU5kCVV9z6mVjjWzHp82qdHzYhSp21Zd010a9pWYKyd4ss8zSWb
 rSVun3LpqRlf8dWfptDerLDnuDC29oxTbfEnIAPgMkojLpj+HgrMeUGP6
 UL6fofrOddNDYiQSgl9euE3kF7LJuA+v6m3ZBj6ziGv3wfQpl1HTlkZGn
 0YKdKeO6GJqdfYNxWtPGxyhkXhjcNxqrr78fmpC+jsLFuz46UVLh7t/Ay Q==;
X-CSE-ConnectionGUID: uAQlQkyjSPCQxZxbEXmMBw==
X-CSE-MsgGUID: trAsiOGUSPe2eQ7Y8TYdvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="88623497"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="88623497"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 19:24:45 -0700
X-CSE-ConnectionGUID: FNK3ZgqnQeulH7FwKvdtiA==
X-CSE-MsgGUID: A3zuwYomQDWJ+fl589OPfA==
X-ExtLoop1: 1
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 19:24:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Carlos Santa <carlos.santa@intel.com>,
	Ryan Neph <ryanneph@google.com>
Subject: [PATCH v6 6/8] drm/xe: Limit purge shrinker pass to the lowest TTM
 priority band
Date: Thu, 30 Jul 2026 19:24:37 -0700
Message-Id: <20260731022439.2446486-7-matthew.brost@intel.com>
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

The shrinker's purge pass (xe_shrinker_scan() with shrink_flags.purge
set) walks each memory type's whole TTM LRU list looking for BOs that
are purgeable (bo->ttm.purgeable, set for DONTNEED BOs, see
xe_bo_set_purgeable_shrinker()). Two problems with the current walk:

1. It scans the full LRU across all priority bands, even though a
   DONTNEED BO is now always kept at XE_BO_PRIORITY_LOW: unbind
   (xe_vma_destroy()) and the DONTNEED madvise transition
   (xe_bo_set_purgeable_state()) both drop a BO's priority to
   XE_BO_PRIORITY_LOW as they mark or become eligible for purging.
   Since ttm_bo_lru_cursor_first()/_next() walk each priority level in
   ascending order, nothing beyond XE_BO_PRIORITY_LOW can possibly be
   purgeable, so continuing past it just wastes time trylocking BOs
   that can never be purged in this pass.

2. __xe_shrinker_walk() aborts the entire walk (returning early out of
   the mem_type loop) the moment xe_bo_shrink() returns -EBUSY for a
   non-purgeable BO reached during the purge pass. Since most BOs
   sharing the XE_BO_PRIORITY_LOW band are simply unmapped (not
   DONTNEED), this means the purge pass typically stops after the very
   first candidate that isn't actually purgeable, skipping any
   purgeable BOs later in the list instead of continuing to look for
   them.

Fix both: break out of the LRU walk for a given mem_type once a BO's
priority rises above XE_BO_PRIORITY_LOW during the purge pass, and
treat a -EBUSY from xe_bo_shrink() during the purge pass as "this BO
isn't purgeable, try the next one" rather than aborting the walk.
Behavior of the non-purge (regular shrink) pass is unchanged.

Cc: Carlos Santa <carlos.santa@intel.com>
Cc: Ryan Neph <ryanneph@google.com>
Assisted-by: GitHub_Copilot:claude-sonnet-5
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_shrinker.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index 83374cd57660..81895b587b56 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -75,10 +75,24 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
 			continue;
 
 		ttm_bo_lru_for_each_reserved_guarded(&curs, man, &arg, ttm_bo) {
+			/*
+			 * The LRU is walked in ascending priority order.
+			 * Purgeable BOs are clustered at XE_BO_PRIORITY_LOW
+			 * (see xe_bo_set_purgeable_state()), so once we've
+			 * moved past it during the purge pass, nothing
+			 * further down the LRU can be purged; stop early
+			 * rather than walking (and trylocking) BOs that can
+			 * never satisfy this pass.
+			 */
+			if (flags.purge && ttm_bo->priority > XE_BO_PRIORITY_LOW)
+				break;
+
 			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
 				continue;
 
 			lret = xe_bo_shrink(ctx, ttm_bo, flags, scanned);
+			if (flags.purge && lret == -EBUSY)
+				continue;
 			if (lret < 0)
 				return lret;
 
-- 
2.34.1

