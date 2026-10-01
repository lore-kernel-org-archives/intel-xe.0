Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370CACA5FD2
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 13:41:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E169C10E429;
	Thu,  1 Oct 2026 13:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YECioy6q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDAC10E429
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 13:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790862078; x=1822398078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rdXKEl5slA9oLBALjASKu1yVPVFlSr7TxC7S1mrNItU=;
 b=YECioy6qq/9ORzsT5Bq6XrHnuaBybQWZve1BVS4BI0784uvegOOzeKxT
 eNhshk6UYMZeYD/SR3/cSOn2Aei4NNdBUnYuqL1j/590ERHqkcG5JQYNN
 arWM8holoYVhZeKVu0by3D60sk+ex6pfq7NFnbfAMU2HAt4MHKiSA461t
 q654+hWWCCbvErl9LLXc8mFyGR4r/XkZ4sOJqpP+ZPb40FD2+O1fyr0BT
 EXOe+/U08LcAZOO/YCk4+5Q2twrRwlMbzFxQmmOid/JpSp8rcxWhErBPx
 9HmB20On88mDTwVZM1zGuOdEGrzE0IQvDAfBnzorz/Hs3KWn0/iDefN6V w==;
X-CSE-ConnectionGUID: FaI8v7NbQLO30/8oTC5rVw==
X-CSE-MsgGUID: oSf6ilLMT0elMHyEl4d0WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="100951891"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="100951891"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 06:40:45 -0700
X-CSE-ConnectionGUID: groVO+ajT5m90AsUSZ71kA==
X-CSE-MsgGUID: aHnE6JUbQ/CTk4lFuRlpOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="275525140"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.244.16])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 06:40:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Fix stale pinned_link entry when fb-pin
 performs the final unpin
Date: Thu,  1 Oct 2026 15:40:18 +0200
Message-ID: <20261001134018.111553-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001134018.111553-1-thomas.hellstrom@linux.intel.com>
References: <20261001134018.111553-1-thomas.hellstrom@linux.intel.com>
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

Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.8+
Assisted-by: LLM
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

v2:
- New patch
---
 drivers/gpu/drm/xe/xe_bo.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 2fbbba7cf4b0..581bfded21db 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -487,12 +487,27 @@ static void xe_bo_account_pin(struct xe_bo *bo)
  * held, before &ttm_buffer_object.pin_count is decremented by
  * ttm_bo_unpin(), so that the check against the true 1->0 transition sees
  * the pin count that is about to be released.
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
 
-	if (bo->ttm.pin_count == 1 && bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+	if (last_unpin && !list_empty(&bo->pinned_link)) {
+		spin_lock(&xe->pinned.lock);
+		list_del_init(&bo->pinned_link);
+		spin_unlock(&xe->pinned.lock);
+	}
+
+	if (last_unpin && bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
 		xe_ttm_tt_account_add(xe, bo->ttm.ttm);
 }
 
@@ -3311,11 +3326,6 @@ void xe_bo_unpin_external(struct xe_bo *bo)
 	xe_assert(xe, xe_bo_is_pinned(bo));
 	xe_assert(xe, xe_bo_is_user(bo));
 
-	spin_lock(&xe->pinned.lock);
-	if (bo->ttm.pin_count == 1 && !list_empty(&bo->pinned_link))
-		list_del_init(&bo->pinned_link);
-	spin_unlock(&xe->pinned.lock);
-
 	xe_bo_unpin_account(bo);
 
 	/*
@@ -3337,10 +3347,7 @@ void xe_bo_unpin(struct xe_bo *bo)
 	xe_assert(xe, xe_bo_is_pinned(bo));
 
 	if (mem_type_is_vram(place->mem_type) || bo->flags & XE_BO_FLAG_GGTT) {
-		spin_lock(&xe->pinned.lock);
 		xe_assert(xe, !list_empty(&bo->pinned_link));
-		list_del_init(&bo->pinned_link);
-		spin_unlock(&xe->pinned.lock);
 
 		if (bo->backup_obj) {
 			if (xe_bo_is_pinned(bo->backup_obj))
-- 
2.55.0

