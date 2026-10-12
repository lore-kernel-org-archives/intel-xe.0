Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E59DCA9EDD
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 15:41:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E96310E49C;
	Mon, 12 Oct 2026 15:41:43 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6C110F1E2
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 15:41:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 420E6401F2;
 Mon, 12 Oct 2026 15:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E411F0089C;
 Mon, 12 Oct 2026 15:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
 s=korg; t=1791819696;
 bh=6zcDI0SNiTXPlEmpQJBS03ZFlm/QZjbv1OyfMA/0pYs=;
 h=Subject:To:Cc:From:Date;
 b=UdYqtomVz5AdPEe2SC5jXXVDxuc9TmPph0dyrhBi37k+4Wy6TtHAKZZTC1aMaJO55
 rUbnJ29sajg2QCwmv7m3bAYUPUyHcepXN9LOLWIr0V+jXnV53quIe6If/DRBI8Jee4
 Ai2Op5E5ODufm6OR3q62GviMtjPqhw5qBtr7Y40s=
Subject: Patch "drm/xe: Fix stale pinned_link entry when fb-pin performs the
 final unpin" has been added to the 7.2-stable tree
To: gregkh@linuxfoundation.org, himal.prasad.ghimiray@intel.com,
 intel-xe@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 matthew.auld@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 12 Oct 2026 17:38:38 +0200
Message-ID: <2026101238-dedicator-launch-3a82@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    drm/xe: Fix stale pinned_link entry when fb-pin performs the final unpin

to the 7.2-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-xe-fix-stale-pinned_link-entry-when-fb-pin-performs-the-final-unpin.patch
and it can be found in the queue-7.2 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From cf238c067eaae1cbfb00738e29219b9568d2313e Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri, 2 Oct 2026 12:08:30 +0200
Subject: drm/xe: Fix stale pinned_link entry when fb-pin performs the final unpin
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit cf238c067eaae1cbfb00738e29219b9568d2313e upstream.

xe_bo_pin_external() and xe_bo_unpin_external() maintain the bo's
pinned_link list membership in xe->pinned.late.external, based on
whether the current call is the outermost pin or the final unpin.
However, the same external bo's pin_count can also be raised and
lowered directly by __xe_pin_fb_vma()/__xe_unpin_fb_vma(), which pin
the bo as a display scanout buffer without going through
xe_bo_pin_external()/xe_bo_unpin_external() at all, and have no
notion of, or ownership over, pinned_link.

If a bo is pinned both externally (e.g. dma-buf export) and as an fb,
and the external unpin happens first, xe_bo_unpin_external() correctly
observes pin_count > 1 and leaves the bo on pinned_link. When the fb
unpin later performs the true last unpin (pin_count 1 -> 0), it never
touches pinned_link, leaving the bo linked on xe->pinned.late.external
indefinitely. Once the bo is subsequently freed, this stale list entry
points into freed memory, corrupting the list and risking a
use-after-free the next time the list is walked or spliced.

The backup object pin/unpin sites in xe_bo_notifier_prepare_pinned()/
xe_bo_notifier_unprepare_pinned() have the same bypass characteristic,
though they never add their bo to a pinned list, so are not affected
by this particular list-corruption issue.

Move the pinned_link removal into xe_bo_account_unpin(), which already
runs on every unpin path (kernel, external, framebuffer, backup
object) right before the true 1 -> 0 pin_count transition. Since
list_del_init() only operates on the node itself, this removal is
list-agnostic and safe to perform regardless of which list (external
or kernel_bo_present) the bo happens to be linked on, or which code
path is performing the final unpin. Drop the now-redundant explicit
list_del_init() calls in xe_bo_unpin_external() and xe_bo_unpin().

v2:
- New patch

v3:
- Rebased on changes to previous patch.

Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.8+
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Assisted-by: LLM
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Link: https://patch.msgid.link/20261002100830.12297-3-thomas.hellstrom@linux.intel.com
(cherry picked from commit ca58d36a1f93af586ee93b340c9f9fd81312cc01)
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/xe/xe_bo.c |   25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -483,12 +483,27 @@ static void xe_bo_account_pin(struct xe_
  * ttm_bo_unpin(), so that the check against the true 1->0 transition sees
  * the pin count that is about to be released. See xe_bo_account_pin() for
  * why imported bos are excluded.
+ *
+ * On the true last unpin, also removes @bo from whichever pinned-bo list
+ * (external or kernel_bo_present) it may currently be linked on, since a
+ * bo's final unpin can happen through a pin path (e.g. framebuffer,
+ * backup object) that has no notion of, or ownership over, that list.
+ * This is safe and list-agnostic: list_del_init() only needs the node
+ * itself, not knowledge of which list it is threaded through, and is a
+ * no-op if @bo is not linked.
  */
 static void xe_bo_account_unpin(struct xe_bo *bo)
 {
 	struct xe_device *xe = xe_bo_device(bo);
+	bool last_unpin = bo->ttm.pin_count == 1;
+
+	if (last_unpin && !list_empty(&bo->pinned_link)) {
+		spin_lock(&xe->pinned.lock);
+		list_del_init(&bo->pinned_link);
+		spin_unlock(&xe->pinned.lock);
+	}
 
-	if (bo->ttm.pin_count == 1 && bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm) &&
+	if (last_unpin && bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm) &&
 	    !xe_ttm_bo_is_imported(&bo->ttm))
 		xe_ttm_tt_account_add(xe, bo->ttm.ttm);
 }
@@ -3149,11 +3164,6 @@ void xe_bo_unpin_external(struct xe_bo *
 	xe_assert(xe, xe_bo_is_pinned(bo));
 	xe_assert(xe, xe_bo_is_user(bo));
 
-	spin_lock(&xe->pinned.lock);
-	if (bo->ttm.pin_count == 1 && !list_empty(&bo->pinned_link))
-		list_del_init(&bo->pinned_link);
-	spin_unlock(&xe->pinned.lock);
-
 	xe_bo_unpin_account(bo);
 
 	/*
@@ -3172,10 +3182,7 @@ void xe_bo_unpin(struct xe_bo *bo)
 	xe_assert(xe, xe_bo_is_pinned(bo));
 
 	if (mem_type_is_vram(place->mem_type) || bo->flags & XE_BO_FLAG_GGTT) {
-		spin_lock(&xe->pinned.lock);
 		xe_assert(xe, !list_empty(&bo->pinned_link));
-		list_del_init(&bo->pinned_link);
-		spin_unlock(&xe->pinned.lock);
 
 		if (bo->backup_obj) {
 			if (xe_bo_is_pinned(bo->backup_obj))


Patches currently in stable-queue which might be from thomas.hellstrom@linux.intel.com are

queue-7.2/drm-xe-fix-shrinker-accounting-double-subtraction-on-nested-external-pins.patch
queue-7.2/drm-xe-fix-stale-pinned_link-entry-when-fb-pin-performs-the-final-unpin.patch
