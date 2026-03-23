Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F37BEC01B4
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 09:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A2910E4AF;
	Mon, 23 Mar 2026 09:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1lb0+hE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BB410E4B3
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 09:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774258289; x=1805794289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=REPheUutH7ykkyJNP59pYpeSsb82wPQFFimWMyJmUD0=;
 b=C1lb0+hEcBGmg5u6vSVfP14o7kyk2hWgnRZOgPDpbbKLeoBENz9tUPCv
 3H7mRFs4dRHgnMnwZIyU+bWBdfNmfCoDed10te7on0GvGu6tEg7Ic7D2C
 /p5LQ2mjwrzJvtgOIloy2g0EMS25QJSklz0LG5q53YvMbJGhsL9peZelX
 DqFGaBZfcujzhKNBffsPtyBgbrIHSg5irFM6NAAyrQEHczUIasawqCUfC
 s6tp8xsM5RsjCikYcg0tfwTCtBgcCPUqlkvno4BSD25RjL9RDKLFSOUDM
 ZBaliN3FxH4r/DMtQJ5Qqbar+iIbvUah0oVCFuL0S9JEdVlP3hRfZUuxh A==;
X-CSE-ConnectionGUID: UHsabvgqT3GWhcQ9lYjgjA==
X-CSE-MsgGUID: QPyKyfjlS9KUoJjasO9oTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75221764"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75221764"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:31:29 -0700
X-CSE-ConnectionGUID: e9GLFFezQ728wG81Eh6y+Q==
X-CSE-MsgGUID: F6bbG8O6SHWEmpbV5/uYBg==
X-ExtLoop1: 1
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:31:27 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v7 08/12] drm/xe/bo: Block mmap of DONTNEED/purged BOs
Date: Mon, 23 Mar 2026 15:00:57 +0530
Message-ID: <20260323093106.2986900-9-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323093106.2986900-1-arvind.yadav@intel.com>
References: <20260323093106.2986900-1-arvind.yadav@intel.com>
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

Don't allow new CPU mmaps to BOs marked DONTNEED or PURGED.
DONTNEED BOs can have their contents discarded at any time, making
CPU access undefined behavior. PURGED BOs have no backing store and
are permanently invalid.

Return -EBUSY for DONTNEED BOs (temporary purgeable state) and
-EINVAL for purged BOs (permanent, no backing store).

The mmap offset ioctl now checks the BO's purgeable state before
allowing userspace to establish a new CPU mapping. This prevents
the race where userspace gets a valid offset but the BO is purged
before actual faulting begins.

Existing mmaps (established before DONTNEED) may still work until
pages are purged, at which point CPU faults fail with SIGBUS.

v6:
- Split DONTNEED → -EBUSY and PURGED → -EINVAL for consistency
  with the rest of the series (Thomas, Matt)

v7:
  - Move purgeable check from xe_gem_mmap_offset_ioctl() into a new
    xe_gem_object_mmap() callback that wraps drm_gem_ttm_mmap(). (Thomas)
  - Use an interruptible lock. (Thomas)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index da18b43650e3..83a1d1ca6cc6 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2165,10 +2165,32 @@ static const struct vm_operations_struct xe_gem_vm_ops = {
 	.access = xe_bo_vm_access,
 };
 
+static int xe_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct xe_bo *bo = gem_to_xe_bo(obj);
+	int err = 0;
+
+	/*
+	 * Reject mmap of purgeable BOs. DONTNEED BOs can be purged
+	 * at any time, making CPU access undefined behavior. Purged BOs have
+	 * no backing store and are permanently invalid.
+	 */
+	xe_bo_lock(bo, true);
+	if (xe_bo_madv_is_dontneed(bo))
+		err = -EBUSY;
+	else if (xe_bo_is_purged(bo))
+		err = -EINVAL;
+	xe_bo_unlock(bo);
+	if (err)
+		return err;
+
+	return drm_gem_ttm_mmap(obj, vma);
+}
+
 static const struct drm_gem_object_funcs xe_gem_object_funcs = {
 	.free = xe_gem_object_free,
 	.close = xe_gem_object_close,
-	.mmap = drm_gem_ttm_mmap,
+	.mmap = xe_gem_object_mmap,
 	.export = xe_gem_prime_export,
 	.vm_ops = &xe_gem_vm_ops,
 };
@@ -3427,8 +3449,8 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 
 	/* The mmap offset was set up at BO allocation time. */
 	args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
+	drm_gem_object_put(gem_obj);
 
-	xe_bo_put(gem_to_xe_bo(gem_obj));
 	return 0;
 }
 
-- 
2.43.0

