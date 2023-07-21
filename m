Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B01C001DE
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 19:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100E010E096;
	Fri, 21 Jul 2023 19:21:59 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63F110E096
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 19:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689967317; x=1721503317;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CAyG6zuZFyy05JNI9CHZXSfl9ixKdEcH72vBJDUyYws=;
 b=WeS8ZJEjs0NmftwNtNGhAF3zQOqhHbXprizLbmBZUj2NU820Lbmc+maL
 jA/SpkbWEaTKmz8oc2hj4592iVm04AD2fUcCk3MxGuoxOsycz1wPfB6eq
 i8LcjucLSwGVD93V8s/isqGSRhh+Gn3wBzqMrxH9mKrsulpVnD3/LAD9G
 vL7p1up0FXITvc4dxqSNyCNqzqv1ixjJSKkYPAxmn9yDZyL9C40soItIM
 pjLH8ML/r/ocUkDhLNZHpFV8T0Z3qhLvmCkqhIHMNce0zCdRvh6wadLMN
 p5ht3Df03WnVDx4y/3TZESSlrker4O98lZ27nMSwaHORC6TtsgkwvUgg2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="367134053"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="367134053"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 12:21:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="728206913"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="728206913"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 12:21:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 21 Jul 2023 12:21:52 -0700
Message-Id: <20230721192152.275803-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Use migrate engine for page fault binds
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

We must use migrate engine for page fault binds in order to avoid a
deadlock as the migrate engine has a reserved BCS instance which cannot
be stuck on a fault. To use the migrate engine the engine argument to
xe_migrate_update_pgtables must be NULL, this was incorrectly wired up
so vm->eng[tile_id] was always being used. Fix this.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 3 +--
 drivers/gpu/drm/xe/xe_vm.c | 3 ++-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 457f1363ec67..bbc319fba9e8 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1421,8 +1421,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 	}
 
 	fence = xe_migrate_update_pgtables(tile->migrate,
-					   vm, xe_vma_bo(vma),
-					   e ? e : vm->eng[tile->id],
+					   vm, xe_vma_bo(vma), e,
 					   entries, num_entries,
 					   syncs, num_syncs,
 					   &bind_pt_update.base);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6003c0be5b59..62a99c393d6b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1678,7 +1678,8 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_engine *e,
 		if (!(vma->tile_mask & BIT(id)))
 			goto next;
 
-		fence = __xe_pt_bind_vma(tile, vma, e, first_op ? syncs : NULL,
+		fence = __xe_pt_bind_vma(tile, vma, e ? e : vm->eng[id],
+					 first_op ? syncs : NULL,
 					 first_op ? num_syncs : 0,
 					 vma->tile_present & BIT(id));
 		if (IS_ERR(fence)) {
-- 
2.34.1

