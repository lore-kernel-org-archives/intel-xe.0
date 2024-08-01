Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4606CC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 15:40:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755AB10E8CA;
	Thu,  1 Aug 2024 15:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cCeIT+iL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4A110E033;
 Thu,  1 Aug 2024 15:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722526831; x=1754062831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qbDGocw6cAh1ojmAV47NmSPjoug7L3oo28Qp5f56ExY=;
 b=cCeIT+iLsDNxT6oeYr2kig7l2LxlIwQ8tajH9zXboWHYkpG3pBkOtoWm
 ZCrs3ns4z5LLb3bfjWxcbOLHKF6GnsjQwu7UQ5pdhYRIvUYJ2GKOlly0c
 2DlA2z/RCA7mOPLQF99N6XykoxWcKSONUyMXzz/I9vWazdvcFsS+nQ74Y
 UxvXfqyZ9bng4ddnTuffKOejx0oLNh4ccrDz3yMmvzRfq3RLcw9F2VEXv
 dQs01Vtb89cJBiljtSNNfEN2YZJ788DrZOMdxOsa4aJjymQQpYZkaiTJS
 TbcXbBdCF2f78Q+AIwkyKeEpS6TaL8l6n1XvmXCWx0FfskePxkgrcnNJl g==;
X-CSE-ConnectionGUID: eQA+3zaaQcqQrlkr8sl/8w==
X-CSE-MsgGUID: w9jBHBDsSK2WuESabikk5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="23407966"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="23407966"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 08:40:31 -0700
X-CSE-ConnectionGUID: kb/hTU/3QMuOu87Ak0CFEQ==
X-CSE-MsgGUID: jGgUf0PgSBCkgCc8hv6jOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55047751"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 08:40:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH v5 1/3] drm/xe: Take ref to VM in delayed snapshot
Date: Thu,  1 Aug 2024 08:41:16 -0700
Message-Id: <20240801154118.2547543-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801154118.2547543-1-matthew.brost@intel.com>
References: <20240801154118.2547543-1-matthew.brost@intel.com>
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

Kernel BO's don't take a ref to the VM, we need the VM for the
delayed snapshot, so take a ref to the VM in delayed snapshot.

v2:
 - Check for lrc_bo before taking a VM ref (CI)
 - Check lrc_bo->vm before taking / dropping a VM ref (CI)
 - Drop VM in xe_lrc_snapshot_free
v5:
 - Fix commit message wording (Johnathan)

47058633d9c5 ("drm/xe: Move lrc snapshot capturing to xe_lrc.c")
Cc: Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 94ff62e1d95e..58121821f081 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1634,6 +1634,9 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	if (!snapshot)
 		return NULL;
 
+	if (lrc->bo && lrc->bo->vm)
+		xe_vm_get(lrc->bo->vm);
+
 	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
 	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
 	snapshot->head = xe_lrc_ring_head(lrc);
@@ -1653,12 +1656,14 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
 {
 	struct xe_bo *bo;
+	struct xe_vm *vm;
 	struct iosys_map src;
 
 	if (!snapshot)
 		return;
 
 	bo = snapshot->lrc_bo;
+	vm = bo->vm;
 	snapshot->lrc_bo = NULL;
 
 	snapshot->lrc_snapshot = kvmalloc(snapshot->lrc_size, GFP_KERNEL);
@@ -1678,6 +1683,8 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
 	xe_bo_unlock(bo);
 put_bo:
 	xe_bo_put(bo);
+	if (vm)
+		xe_vm_put(vm);
 }
 
 void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p)
@@ -1727,8 +1734,14 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
 		return;
 
 	kvfree(snapshot->lrc_snapshot);
-	if (snapshot->lrc_bo)
+	if (snapshot->lrc_bo) {
+		struct xe_vm *vm;
+
+		vm = snapshot->lrc_bo->vm;
 		xe_bo_put(snapshot->lrc_bo);
+		if (vm)
+			xe_vm_put(vm);
+	}
 	kfree(snapshot);
 }
 
-- 
2.34.1

