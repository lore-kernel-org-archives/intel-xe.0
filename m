Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6541CA5FF0
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 12:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624BC10E39C;
	Tue,  6 Oct 2026 12:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iDLBceOc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0FD10E410
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Oct 2026 12:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791290499; x=1822826499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dp+VAj0kK9/C3oB6NbXxFptwkODPrRAHiE5OWsav0HQ=;
 b=iDLBceOcjfNpSGi5ivIetiFNWjxD+bGqPfHowrN0CQybPEGgGnCcaO8h
 7gf8GocG0yVI41wznTy9d7HNzuRhmuh185k1XE5FcCDeCQJ0/RTc7HDEJ
 qVhr+ysH0Pjl7cDe7J/K6uBgBWJDcACnW+j2RA7mRTG1eDJtJMyWxEuoG
 HhkfpbpZxw04Xn9DEnornzZr5D0CrU3gucFff/ukVHyWVcCe1aNirqyAD
 dWhKNmZqV1+lJKByLhWN9VN50UTrZA6QcNwlScwZmdAujwVAZJbkNNIgM
 xts3p/8Io3Hw+o8pFf6rSZIAQR4YKyPoIy0a49kyToxH2BKXNmCVCyCiU w==;
X-CSE-ConnectionGUID: B6NbyhPrSoe1Pcl+yI2Xlg==
X-CSE-MsgGUID: Qim5LEHuRJu8flAsJOS4Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="113765000"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="113765000"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 05:41:39 -0700
X-CSE-ConnectionGUID: APTUUIgPSVCDoJbEgwXn4g==
X-CSE-MsgGUID: 7yz9RHOJSJeZXKnzfCqvtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="276670012"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 05:41:38 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2 2/4] drm/xe: Re-validate external pin under resv lock
 before VRAM purge
Date: Tue,  6 Oct 2026 18:11:28 +0530
Message-ID: <20261006124125.1560295-8-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261006124125.1560295-6-tejas.upadhyay@intel.com>
References: <20261006124125.1560295-6-tejas.upadhyay@intel.com>
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

xe_ttm_vram_reserve_page_at_addr() checks xe_bo_is_user() &&
xe_bo_is_pinned() while holding only mgr->lock, not the BO's
reservation lock, since it must run before the owning BO is
even known to be purgeable. A user BO can become pinned
after that check passes but before xe_ttm_vram_purge_page()
runs.

xe_ttm_vram_purge_page() takes the reservation lock but only
rechecks xe_bo_is_pinned(), not xe_bo_is_user(). If the race
is hit, it calls xe_bo_unpin() (the kernel-BO unpin path,
not xe_bo_unpin_external())on an externally pinned BO and
then purges its backing store while userspace/hardware still
expects it to be resident.

Recheck xe_bo_is_user() && xe_bo_is_pinned() under the
reservation lock and reject the purge, requesting SBR with
-EIO the same way the caller's own critical-BO check
already does.

Fixes: 7737f819e9f1 ("drm/xe/vram: Add VRAM page offline fault handler")
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 4c5837cdb996..ed79e4c6ba1a 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -687,6 +687,19 @@ static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
 		goto out;
 	}
 
+	/*
+	 * The caller's user+pinned check was lockless (mgr->lock only), so an
+	 * external pin can race in before we get here. Re-validate now that
+	 * we hold the reservation lock and reject the purge instead of
+	 * unpinning a BO userspace still expects to be resident. Request SBR
+	 * the same way the caller's own critical-BO check does.
+	 */
+	if (xe_bo_is_user(bo) && xe_bo_is_pinned(bo)) {
+		xe_bo_unlock(bo);
+		ret = -EIO;
+		goto out;
+	}
+
 	xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
 	ttm_bo_unmap_virtual(&bo->ttm);   /* nuke CPU mmap + VRAM IO mappings */
 	if (xe_bo_is_pinned(bo))
@@ -851,6 +864,13 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
 		 */
 		ret = xe_ttm_vram_purge_page(xe, pbo);
 		xe_bo_put(pbo);
+		if (ret == -EIO) {
+			/* Raced into an external pin after the lockless check above */
+			drm_err(&xe->drm,
+				"%s: addr: 0x%llx became externally pinned, requesting SBR\n",
+				__func__, addr);
+			return ret;
+		}
 		if (ret)
 			drm_warn(&xe->drm, "Purge failed at addr:0x%llx, ret:%d\n", addr, ret);
 	}
-- 
2.52.0

