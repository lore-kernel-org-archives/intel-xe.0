Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1136CC5321D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 23:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDD710E137;
	Mon, 26 Aug 2024 23:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ED1jfox3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173FB10E137
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Aug 2024 23:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724715670; x=1756251670;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1678+T6m0ZfnROZM6JVHl8t+ShIGxq3+5aoGD1KWgLI=;
 b=ED1jfox3/khKYnFgxBU/gRjaGOllXI2lPj+HqWWRo7g1qU2LP5Zm1KE+
 ohHg4N0PYsFVe0heBGfHfCW3hf+wIpz71QSS2zL96o6xaMsSJOkETOfkw
 nt5bcjYMLR8zeOIGkMQi+TcDDPp0TGBQL1jFrBDFoUE/QgTnKCpWRoks7
 FQiGPs95YDXa8l6ZC0fiAdtAJz5CbyF8ZFWavKCQ4yBVabF8uMvhJdf9D
 aOfiyhe/f6biv2i+9F4Cai7isRahs5mdOLaKIiiDtsyQ9CX0G5ccqQktE
 6/U8Nn7DRODudvwisS5cbqAfhQ6VWu0z8Xz955q80lZMJ6X02Yq6LANgt Q==;
X-CSE-ConnectionGUID: RaH6qpimTtu4IMrfYIglJg==
X-CSE-MsgGUID: wH33eSR/SQaXKJVXwB7cKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="33829621"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="33829621"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 16:41:10 -0700
X-CSE-ConnectionGUID: 8wT6hA6eQ3+taqioRhC9ug==
X-CSE-MsgGUID: 4yc8DFwJThuzE7oEmmchYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="67009052"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 16:41:10 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI] drm/xe: Replace xe_device_wmb by wmb
Date: Mon, 26 Aug 2024 16:41:00 -0700
Message-ID: <20240826234100.1850471-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

CI ONLY for now

In xe_device_wmb(), it is not clear what the purpose of register write
following wmb() is. Replace xe_device_wmb() with just wmb() to see if we
see any failures in CI.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     | 18 ------------------
 drivers/gpu/drm/xe/xe_device.h     |  2 --
 drivers/gpu/drm/xe/xe_guc_ct.c     |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c    |  2 +-
 drivers/gpu/drm/xe/xe_vm.c         |  2 +-
 6 files changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b6db7e082d887..f0154281f3eea 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -800,24 +800,6 @@ void xe_device_shutdown(struct xe_device *xe)
 {
 }
 
-/**
- * xe_device_wmb() - Device specific write memory barrier
- * @xe: the &xe_device
- *
- * While wmb() is sufficient for a barrier if we use system memory, on discrete
- * platforms with device memory we additionally need to issue a register write.
- * Since it doesn't matter which register we write to, use the read-only VF_CAP
- * register that is also marked as accessible by the VFs.
- */
-void xe_device_wmb(struct xe_device *xe)
-{
-	struct xe_gt *gt = xe_root_mmio_gt(xe);
-
-	wmb();
-	if (IS_DGFX(xe))
-		xe_mmio_write32(gt, VF_CAP_REG, 0);
-}
-
 /**
  * xe_device_td_flush() - Flush transient L3 cache entries
  * @xe: The device
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index f052c06a2d2f5..3be5fa94fa113 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -42,8 +42,6 @@ int xe_device_probe(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
 void xe_device_shutdown(struct xe_device *xe);
 
-void xe_device_wmb(struct xe_device *xe);
-
 static inline struct xe_file *to_xe_file(const struct drm_file *file)
 {
 	return file->driver_priv;
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index f24dd52239268..5ac610f227d88 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -596,7 +596,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	/* Write H2G ensuring visable before descriptor update */
 	xe_map_memcpy_to(xe, &map, 0, cmd, H2G_CT_HEADERS * sizeof(u32));
 	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
-	xe_device_wmb(xe);
+	wmb();
 
 	/* Update local copies */
 	h2g->info.tail = (tail + full_len) % h2g->info.size;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index fbbe6a487bbb3..bbf7ec0111642 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -699,7 +699,7 @@ static void wq_item_append(struct xe_exec_queue *q)
 	q->guc->wqi_tail += wqi_size;
 	xe_assert(xe, q->guc->wqi_tail <= WQ_SIZE);
 
-	xe_device_wmb(xe);
+	wmb();
 
 	map = xe_lrc_parallel_map(q->lrc[0]);
 	parallel_write(xe, map, wq_desc.tail, q->guc->wqi_tail);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index cbf54be224c96..06cc1f1e65a1f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1298,7 +1298,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 	}
 
 	trace_xe_vm_cpu_bind(vm);
-	xe_device_wmb(vm->xe);
+	wmb();
 
 	return dma_fence_get_stub();
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index bfa4880a1673a..975f174df41c9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3186,7 +3186,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 
 	for_each_tile(tile, xe, id) {
 		if (xe_pt_zap_ptes(tile, vma)) {
-			xe_device_wmb(xe);
+			wmb();
 			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
 							  &fence[fence_id],
 							  true);
-- 
2.41.0

