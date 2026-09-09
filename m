Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3BCC79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 11:16:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DF310E147;
	Wed,  9 Sep 2026 11:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cd8Y7FXq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C2710E147
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 11:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788952591; x=1820488591;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3fEvoPkNJl6xZu5359fla3r2porW80WEWANNm5XfbX0=;
 b=Cd8Y7FXqdd9cWVnaKC0UNKp4vnB+k1Z6JULFuArMh8kEvNB+de3aWl9y
 RnXzc3NByPD/FB0/ESjGYNLNuqKFiVz43lK63oqv468mZaMWrFMobrB8m
 Qjw6T0AIzNwG6sY9vWia+4S6X+uVvRsrwKusH/oWSS7gYUAfHfJmMZKBk
 x1DZanXwmmDzHvkLCBlvt1ntUtQeZSj6gJnaZJGNC7jkKESdgfvlsutv1
 WBBf71y8Oj3W/Z+J64aUvL0z+D9qIdWeN0F5fpKtZYQlpw7OwGG3qRSde
 z2rAVnxrspiG5exlxKvCw7BHMZ/1PZzbGoZbCtFRtZJV7T1d0Ue+uy+XD w==;
X-CSE-ConnectionGUID: 9FHTFWjaQ1SBQ4EdEVY7Kg==
X-CSE-MsgGUID: ZoFtwc/oTMasjmJEyp+ceA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89300085"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89300085"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 04:16:31 -0700
X-CSE-ConnectionGUID: /tDnbuVwTZCwpzlVC5PwUw==
X-CSE-MsgGUID: 7H46dYpRQk6BtF4YUIz+iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="267005695"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 04:16:29 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [V4] drm/xe: Skip clearing purged page-table BOs
Date: Wed,  9 Sep 2026 16:46:21 +0530
Message-ID: <20260909111620.1276402-2-tejas.upadhyay@intel.com>
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

v4(Sashiko):
- dont leave svm notifier lock early
v3(Sashiko):
- Validate NULL vmap
v2(Sashiko):
- Fix lock ordering

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 6 ++++--
 drivers/gpu/drm/xe/xe_vm.c | 4 ++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 7fb2fe1f826c..4b351dbf6572 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -236,9 +236,11 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
  */
 void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)
 {
-	struct iosys_map *map = &pt->bo->vmap;
+	struct xe_bo *bo = pt->bo;
 
-	xe_map_memset(xe, map, 0, 0, SZ_4K);
+	xe_bo_assert_held(bo);
+	if (!iosys_map_is_null(&bo->vmap))
+		xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9e71567b27cc..efa5ff6cc823 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1876,6 +1876,8 @@ static void xe_vm_close(struct xe_vm *vm)
 	bound = drm_dev_enter(&xe->drm, &idx);
 
 	down_write(&vm->lock);
+	xe_vm_lock(vm, false);
+
 	if (xe_vm_in_fault_mode(vm))
 		xe_svm_notifier_lock(vm);
 
@@ -1903,6 +1905,8 @@ static void xe_vm_close(struct xe_vm *vm)
 
 	if (xe_vm_in_fault_mode(vm))
 		xe_svm_notifier_unlock(vm);
+
+	xe_vm_unlock(vm);
 	up_write(&vm->lock);
 
 	if (bound)
-- 
2.52.0

