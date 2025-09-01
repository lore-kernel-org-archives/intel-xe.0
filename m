Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18E2CA1002
	for <intel-xe@archiver.kernel.org>; Mon,  1 Sep 2025 08:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9683810E0C7;
	Mon,  1 Sep 2025 08:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EDRnFTno";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A5510E0C7
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Sep 2025 08:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756715931; x=1788251931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TqKDFnPOp/7fEQ+wViYWqt2nYv1FEvS+zJM718HW4Ek=;
 b=EDRnFTno4OMBXaIXCS3N6jT7YaiMEjvISLzxqUH8dTVOgSRJMUNWDFr5
 1kCsFu2f0ZSxgTPseWyu50sDmaNbEe2wiQecH72Oy6RxLaO6LQWJ3l5Gv
 jRLRttSmFI5i8FYxbzdLlbO47fHzPaOhgMdYkuWItnbWB0xzVgIuvTVh9
 CMfCc1cOTifDKRtnZwyWciCHn0bpLjG+KZs9ih3oU+qWXhFo60V5H61+h
 A7O9+d+o85CuhJ1MMhCVQujA7pbk+Etgq3Px/nn8x3Ppgt5PKFQHKYiaa
 93Wa9NZBJSevljJ3FyW8/U6fQtenWxE6j8ZgwKJT58LoeAhr/jftnrM/J Q==;
X-CSE-ConnectionGUID: KvnqxYA9RfeaiteO/GCGcA==
X-CSE-MsgGUID: F6uVc+8lRACseTpwFFa1EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="58899194"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="58899194"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 01:38:50 -0700
X-CSE-ConnectionGUID: EdUDi1hkRnW3Rd1zqMW57Q==
X-CSE-MsgGUID: YvULGWn1TKC4wyo7EvKvGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="201910244"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.171])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 01:38:48 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, stable@vger.kernel.org,
 Rodrigo vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 1/3] drm/xe: Attempt to bring bos back to VRAM after
 eviction
Date: Mon,  1 Sep 2025 10:38:27 +0200
Message-ID: <20250901083829.27341-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250901083829.27341-1-thomas.hellstrom@linux.intel.com>
References: <20250901083829.27341-1-thomas.hellstrom@linux.intel.com>
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

VRAM+TT bos that are evicted from VRAM to TT may remain in
TT also after a revalidation following eviction or suspend.

This manifests itself as applications becoming sluggish
after buffer objects get evicted or after a resume from
suspend or hibernation.

If the bo supports placement in both VRAM and TT, and
we are on DGFX, mark the TT placement as fallback. This means
that it is tried only after VRAM + eviction.

This flaw has probably been present since the xe module was
upstreamed but use a Fixes: commit below where backporting is
likely to be simple. For earlier versions we need to open-
code the fallback algorithm in the driver.

v2:
- Remove check for dgfx. (Matthew Auld)
- Update the xe_dma_buf kunit test for the new strategy (CI)
- Allow dma-buf to pin in current placement (CI)
- Make xe_bo_validate() for pinned bos a NOP.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5995
Fixes: a78a8da51b36 ("drm/ttm: replace busy placement with flags v6")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: <stable@vger.kernel.org> # v6.9+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v1
---
 drivers/gpu/drm/xe/tests/xe_bo.c      |  2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 10 +---------
 drivers/gpu/drm/xe/xe_bo.c            | 16 ++++++++++++----
 drivers/gpu/drm/xe/xe_bo.h            |  2 +-
 drivers/gpu/drm/xe/xe_dma_buf.c       |  2 +-
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index bb469096d072..7b40cc8be1c9 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -236,7 +236,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 		}
 
 		xe_bo_lock(external, false);
-		err = xe_bo_pin_external(external);
+		err = xe_bo_pin_external(external, false);
 		xe_bo_unlock(external);
 		if (err) {
 			KUNIT_FAIL(test, "external bo pin err=%pe\n",
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index 3c5ad8cc65a0..5baeab6b6fb7 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -85,15 +85,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
 		return;
 	}
 
-	/*
-	 * If on different devices, the exporter is kept in system  if
-	 * possible, saving a migration step as the transfer is just
-	 * likely as fast from system memory.
-	 */
-	if (params->mem_mask & XE_BO_FLAG_SYSTEM)
-		KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, XE_PL_TT));
-	else
-		KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, mem_type));
+	KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, mem_type));
 
 	if (params->force_different_devices)
 		KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(imported, XE_PL_TT));
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4faf15d5fa6d..870f43347281 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -188,6 +188,8 @@ static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
 
 		bo->placements[*c] = (struct ttm_place) {
 			.mem_type = XE_PL_TT,
+			.flags = (bo_flags & XE_BO_FLAG_VRAM_MASK) ?
+			TTM_PL_FLAG_FALLBACK : 0,
 		};
 		*c += 1;
 	}
@@ -2322,6 +2324,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res)
 /**
  * xe_bo_pin_external - pin an external BO
  * @bo: buffer object to be pinned
+ * @in_place: Pin in current placement, don't attempt to migrate.
  *
  * Pin an external (not tied to a VM, can be exported via dma-buf / prime FD)
  * BO. Unique call compared to xe_bo_pin as this function has it own set of
@@ -2329,7 +2332,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res)
  *
  * Returns 0 for success, negative error code otherwise.
  */
-int xe_bo_pin_external(struct xe_bo *bo)
+int xe_bo_pin_external(struct xe_bo *bo, bool in_place)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	int err;
@@ -2338,9 +2341,11 @@ int xe_bo_pin_external(struct xe_bo *bo)
 	xe_assert(xe, xe_bo_is_user(bo));
 
 	if (!xe_bo_is_pinned(bo)) {
-		err = xe_bo_validate(bo, NULL, false);
-		if (err)
-			return err;
+		if (!in_place) {
+			err = xe_bo_validate(bo, NULL, false);
+			if (err)
+				return err;
+		}
 
 		spin_lock(&xe->pinned.lock);
 		list_add_tail(&bo->pinned_link, &xe->pinned.late.external);
@@ -2493,6 +2498,9 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
 	};
 	int ret;
 
+	if (xe_bo_is_pinned(bo))
+		return 0;
+
 	if (vm) {
 		lockdep_assert_held(&vm->lock);
 		xe_vm_assert_held(vm);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 8cce413b5235..cfb1ec266a6d 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -200,7 +200,7 @@ static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
 	}
 }
 
-int xe_bo_pin_external(struct xe_bo *bo);
+int xe_bo_pin_external(struct xe_bo *bo, bool in_place);
 int xe_bo_pin(struct xe_bo *bo);
 void xe_bo_unpin_external(struct xe_bo *bo);
 void xe_bo_unpin(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 346f857f3837..af64baf872ef 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -72,7 +72,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
 		return ret;
 	}
 
-	ret = xe_bo_pin_external(bo);
+	ret = xe_bo_pin_external(bo, true);
 	xe_assert(xe, !ret);
 
 	return 0;
-- 
2.50.1

