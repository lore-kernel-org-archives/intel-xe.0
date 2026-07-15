Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2240CC44508
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 05:38:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8497F10EEB3;
	Wed, 15 Jul 2026 05:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9R09jFS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C2110E127
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 05:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784093922; x=1815629922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/3Qt805+M7hT8WLtYBSPQWvolXREyRD8raxkZSWDu14=;
 b=V9R09jFSwysHqVHFfRv1hoaNemWb2rn7SLa/IGZGZ18ZGshteEs7HpeQ
 48LXFV9Q1/ULEtutLFLUvxnodBScAMH+wF1EamU2kABrE+SPS3zEEOXXc
 72PFoTZbK4w950rt7DZc5LyEKD4mjC8YWtfbRHnrwUFVeExTk3hKu6uS+
 obcfFp0onO6U14N9bjAYPjSiJbWv5wpCXGwA0twnSFv8l/H1GF3xOj6HU
 2/FAGt8nuZcPttmDWvEn/KxUucx7PMqYRDJjgv5aV0SbU0pT3GhLdF1MQ
 AQmHV6zkJrKpyj1NsJqww8xEUPuquD4I/nuilMC2KlqdnYbB3/IUWqHpD Q==;
X-CSE-ConnectionGUID: SIEx6lhXRKqf7E9jPPz2JA==
X-CSE-MsgGUID: x1tSLbDAQMuqQDa6Ijp9xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88622376"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="88622376"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 22:38:41 -0700
X-CSE-ConnectionGUID: aq9Wi9P7STCuwRME6ByDJg==
X-CSE-MsgGUID: McJjvyRAQsaO4j0DqpJFNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="252676592"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 22:38:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Carlos Santa <carlos.santa@intel.com>,
	Ryan Neph <ryanneph@google.com>
Subject: [PATCH v4 3/4] drm/xe: Lower BO TTM priority to lowest when fully
 unmapped from VM
Date: Tue, 14 Jul 2026 22:38:35 -0700
Message-Id: <20260715053836.3719601-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715053836.3719601-1-matthew.brost@intel.com>
References: <20260715053836.3719601-1-matthew.brost@intel.com>
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

An UNMAP (or the unmap half of a REMAP) can leave a BO with no
remaining VMA mappings anywhere. Such a BO is unlikely to be touched
again soon, so rather than leaving it at whatever priority band it had
while still in active use, drop it to XE_BO_PRIORITY_LOW, the lowest
level, so it becomes one of the first candidates considered for
eviction/shrinking. This applies both to BOs private to a VM and to
extobjs shared across multiple VMs (bo->vm == NULL) -- an extobj with
no bindings left anywhere is just as good an eviction/shrink candidate
as an unmapped private BO. Imported bos are excluded, since their
vma_count is never tracked (xe_bo_vma_count_inc/dec_locked() are
no-ops for them), so it would never reflect anything meaningful.

This has to be done inside xe_vma_destroy() itself, right after
xe_bo_vma_count_dec_locked(), rather than by its callers after the
fact: xe_vma_destroy() may drop the last reference to the BO via
xe_bo_put() in xe_vma_destroy_late() (called either synchronously, or
asynchronously via a fence callback), so a caller that stashed a
pointer to the BO before calling xe_vma_destroy() and then dereferences
it afterwards risks a use-after-free. Doing the check and update
before that possible final put avoids this.

bo->purgeable.vma_count, which xe_bo_vma_count_dec_locked() just
updated, tells us whether the BO has become fully unmapped. A REMAP
that only shrinks a mapping still leaves vma_count > 0 via the
prev/next VMA(s) created earlier in the bind, so those are correctly
left untouched. This runs under the BO's dma-resv, already asserted
held via xe_bo_assert_held() just above.

Cc: Carlos Santa <carlos.santa@intel.com>
Cc: Ryan Neph <ryanneph@google.com>
Assisted-by: GitHub_Copilot:claude-sonnet-5
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a90f310b8fa2..f74db350abf1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1282,6 +1282,22 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 		xe_bo_vma_count_dec_locked(bo);
 		if (vma->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED)
 			xe_bo_willneed_put_locked(bo);
+
+		/*
+		 * @bo has just lost a VMA mapping. If it now has none left
+		 * anywhere, it is unlikely to be used again soon, so lower
+		 * its TTM priority to the lowest level, making it one of the
+		 * first buffers considered for eviction/shrinking. This
+		 * applies both to BOs private to @vm and to extobjs shared
+		 * across multiple VMs (bo->vm == NULL), but not to imported
+		 * bos, whose vma_count is never tracked. Must be done here,
+		 * rather than by the caller, as this may be the last
+		 * reference to @bo (see xe_vma_destroy_late()).
+		 */
+		if (!drm_gem_is_imported(&bo->ttm.base) &&
+		    !bo->purgeable.vma_count &&
+		    bo->ttm.priority != XE_BO_PRIORITY_LOW)
+			xe_bo_update_ttm_priority(bo, XE_BO_PRIORITY_LOW);
 	}
 
 	xe_vm_assert_held(vm);
-- 
2.34.1

