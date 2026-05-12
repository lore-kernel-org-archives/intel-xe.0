Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693A7CD4851
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 13:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FC910E248;
	Tue, 12 May 2026 13:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJVWD3C+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AF510EAD0
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 13:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778594036; x=1810130036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wkXRCaerAtgPx+gYhIYSB2ME8geakYA/E6DsbM9lrog=;
 b=mJVWD3C+Lgjy0SIDy1VNK5/WqEVlEY3Cx6i6Fp3S7vLyd5kbXRqbrgLL
 q1c46WeL5wRxnXCoPhvuffzlJnMQEb3SxXNTb9xCtjtYlZELu+o2EMFVg
 48cZ1a2lDoElzQp/IQxgOJ2tipukx9WRxiZ1luaoZgQbql4Ggx5kjrg3r
 dkXBVkmJ4fI+MFP+eK5/kDWpb2KI0SY0cBXoWYYnf/H7dLgXEUSNcQP8Z
 pN/8sX2rhjZ8he8C4fLJXuCBC4ORY92S7KOp473CCHF2KiVvR2vMuyxPy
 D194mhF9Y+cdeZxDv1AULyt3eGhaZLu0bvDy0vw6vaLkk60oMtS1xWzzk g==;
X-CSE-ConnectionGUID: Rqq8ZlFhQb2dSYsYRnUpcA==
X-CSE-MsgGUID: iP/K7K3ISLKpYXt5maLh3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="96927799"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="96927799"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 06:53:55 -0700
X-CSE-ConnectionGUID: yeRvOCApTw+tGkpovMg7tw==
X-CSE-MsgGUID: CIsvL2m5QTa70E2oU35syQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="242134751"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fedora) ([10.245.245.172])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 06:53:53 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 1/2] drm/xe: Track number of populated ttm_tts in the shrinker
Date: Tue, 12 May 2026 15:53:31 +0200
Message-ID: <20260512135332.11702-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512135332.11702-1-thomas.hellstrom@linux.intel.com>
References: <20260512135332.11702-1-thomas.hellstrom@linux.intel.com>
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

Add a populated_tts counter to struct xe_shrinker to track how many
ttm_tts are currently populated and on the LRU (i.e., shrinkable or
purgeable). This mirrors the existing per-pages accounting but counts
objects rather than pages.

The counter is incremented in xe_ttm_tt_account_add() and decremented
in xe_ttm_tt_account_subtract(), which are already called at the exact
points where pages enter and leave the shrinker's jurisdiction (populate,
unpopulate, pin, and unpin). Purgeable state transfers, which move pages
between the shrinkable and purgeable buckets without changing the total
object count, pass tts=0.

Extend xe_shrinker_mod_pages() with a tts delta parameter so that page
and object accounting can be updated atomically under the same lock.

Assert that populated_tts reaches zero at device teardown, alongside
the existing assertions for shrinkable_pages and purgeable_pages.

No functional change intended; the new field is unused until a follow-up
commit wires it into shrinker batch sizing.

Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 12 ++++++------
 drivers/gpu/drm/xe/xe_shrinker.c | 15 +++++++++++----
 drivers/gpu/drm/xe/xe_shrinker.h |  3 ++-
 3 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5ce60d161e09..f456423e8180 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -428,9 +428,9 @@ static void xe_ttm_tt_account_add(struct xe_device *xe, struct ttm_tt *tt)
 	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
 
 	if (xe_tt->purgeable)
-		xe_shrinker_mod_pages(xe->mem.shrinker, 0, tt->num_pages);
+		xe_shrinker_mod_pages(xe->mem.shrinker, 0, tt->num_pages, 1);
 	else
-		xe_shrinker_mod_pages(xe->mem.shrinker, tt->num_pages, 0);
+		xe_shrinker_mod_pages(xe->mem.shrinker, tt->num_pages, 0, 1);
 }
 
 static void xe_ttm_tt_account_subtract(struct xe_device *xe, struct ttm_tt *tt)
@@ -438,9 +438,9 @@ static void xe_ttm_tt_account_subtract(struct xe_device *xe, struct ttm_tt *tt)
 	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
 
 	if (xe_tt->purgeable)
-		xe_shrinker_mod_pages(xe->mem.shrinker, 0, -(long)tt->num_pages);
+		xe_shrinker_mod_pages(xe->mem.shrinker, 0, -(long)tt->num_pages, -1);
 	else
-		xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0);
+		xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0, -1);
 }
 
 static void update_global_total_pages(struct ttm_device *ttm_dev,
@@ -853,11 +853,11 @@ static void xe_bo_set_purgeable_shrinker(struct xe_bo *bo,
 	if (!xe_tt->purgeable && new_state == XE_MADV_PURGEABLE_DONTNEED) {
 		xe_tt->purgeable = true;
 		/* Transfer pages from shrinkable to purgeable count */
-		xe_shrinker_mod_pages(xe->mem.shrinker, -tt_pages, tt_pages);
+		xe_shrinker_mod_pages(xe->mem.shrinker, -tt_pages, tt_pages, 0);
 	} else if (xe_tt->purgeable && new_state == XE_MADV_PURGEABLE_WILLNEED) {
 		xe_tt->purgeable = false;
 		/* Transfer pages from purgeable to shrinkable count */
-		xe_shrinker_mod_pages(xe->mem.shrinker, tt_pages, -tt_pages);
+		xe_shrinker_mod_pages(xe->mem.shrinker, tt_pages, -tt_pages, 0);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index 83374cd57660..cded230f5459 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -20,6 +20,7 @@
  * @lock: Lock protecting accounting.
  * @shrinkable_pages: Number of pages that are currently shrinkable.
  * @purgeable_pages: Number of pages that are currently purgeable.
+ * @populated_tts: Number of populated ttm_tts currently shrinkable or purgeable.
  * @shrink: Pointer to the mm shrinker.
  * @pm_worker: Worker to wake up the device if required.
  */
@@ -28,6 +29,7 @@ struct xe_shrinker {
 	rwlock_t lock;
 	long shrinkable_pages;
 	long purgeable_pages;
+	long populated_tts;
 	struct shrinker *shrink;
 	struct work_struct pm_worker;
 };
@@ -38,19 +40,23 @@ static struct xe_shrinker *to_xe_shrinker(struct shrinker *shrink)
 }
 
 /**
- * xe_shrinker_mod_pages() - Modify shrinker page accounting
+ * xe_shrinker_mod_pages() - Modify shrinker page and object accounting
  * @shrinker: Pointer to the struct xe_shrinker.
  * @shrinkable: Shrinkable pages delta. May be negative.
- * @purgeable: Purgeable page delta. May be negative.
+ * @purgeable: Purgeable pages delta. May be negative.
+ * @tts: Populated ttm_tt count delta. May be negative.
  *
- * Modifies the shrinkable and purgeable pages accounting.
+ * Updates the shrinkable and purgeable page counts and the populated
+ * ttm_tt count.
  */
 void
-xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgeable)
+xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgeable,
+		      long tts)
 {
 	write_lock(&shrinker->lock);
 	shrinker->shrinkable_pages += shrinkable;
 	shrinker->purgeable_pages += purgeable;
+	shrinker->populated_tts += tts;
 	write_unlock(&shrinker->lock);
 }
 
@@ -269,6 +275,7 @@ static void xe_shrinker_fini(struct drm_device *drm, void *arg)
 
 	xe_assert(shrinker->xe, !shrinker->shrinkable_pages);
 	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
+	xe_assert(shrinker->xe, !shrinker->populated_tts);
 	shrinker_free(shrinker->shrink);
 	flush_work(&shrinker->pm_worker);
 	kfree(shrinker);
diff --git a/drivers/gpu/drm/xe/xe_shrinker.h b/drivers/gpu/drm/xe/xe_shrinker.h
index 5132ae5192e1..9c63e22b3b73 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.h
+++ b/drivers/gpu/drm/xe/xe_shrinker.h
@@ -9,7 +9,8 @@
 struct xe_shrinker;
 struct xe_device;
 
-void xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgeable);
+void xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgeable,
+			   long tts);
 
 int xe_shrinker_create(struct xe_device *xe);
 
-- 
2.54.0

