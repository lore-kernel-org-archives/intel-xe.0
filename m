Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7493BC624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 12:21:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC2C10E132;
	Fri,  4 Sep 2026 12:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lsQki9eN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C82C10E132
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 12:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788524501; x=1820060501;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Sa0CqvuyQTZNOYX7jb4AygaCxWU3mdIY5ZIVHAHHOBk=;
 b=lsQki9eNBuedhQa/9mw7Gk++9YnLOnFThigLZgxBkVsBQdbDzgJZVHYN
 YyWUJ2cBalewVlk7wG5seZ71GhZ79FPmncQxYFS4elLIu2boQ8711DAkk
 S+s5gMllrYZZfnGIxYvd/KpUAVmEBeZTM3oY+H6tBzo47i5BRDP9QdIdp
 DJpr4WC60Sr4AjD92HzUlcshqT4ZUEahlQ2Y86d4uKxpgujsCS21gyJ3q
 9UmypkPEdAALKef9RBTEyS/glCq4/gIJDVe3VY9PJfZcQavvvS55mINNW
 e1rUkSyv+6/a6Sj+B0dYLIpPXAil+dKoGzXbddW499YlMM4jX0GNsntSe w==;
X-CSE-ConnectionGUID: ohkOhCMZQKSmAd5H5LmjRw==
X-CSE-MsgGUID: KiRhQ3dSRTmJWGAv/M8dyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="106393786"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="106393786"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 05:21:40 -0700
X-CSE-ConnectionGUID: wDWtwv7UTC6sUvZDRIAfTg==
X-CSE-MsgGUID: TtwukFMwR5qKRZ1eX4hnFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="273551862"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 05:21:40 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: Skip clearing purged page-table BOs
Date: Fri,  4 Sep 2026 17:51:22 +0530
Message-ID: <20260904122121.806122-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
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

VRAM page offlining can clear a page-table BO's vmap before VM teardown
calls xe_pt_clear(). Check for a purged BO under its dma-resv lock before
writing to the mapping.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 5d990c1c3740..23bc74ba02cb 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -236,9 +236,12 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
  */
 void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)
 {
-	struct iosys_map *map = &pt->bo->vmap;
+	struct xe_bo *bo = pt->bo;
 
-	xe_map_memset(xe, map, 0, 0, SZ_4K);
+	xe_bo_lock(bo, false);
+	if (!xe_bo_is_purged(bo))
+		xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
+	xe_bo_unlock(bo);
 }
 
 /**
-- 
2.52.0

