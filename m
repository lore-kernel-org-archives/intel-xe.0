Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05913EC01B4
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 09:31:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE40110E349;
	Mon, 23 Mar 2026 09:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cMXCjgbW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF1210E4B3
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 09:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774258287; x=1805794287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g2mVTRAWWSADwf1IwqbpDI5aysFi8c5on0AwIsAFhAw=;
 b=cMXCjgbW/B3VbNAPQsm8NzdtrB5dJzdAl7d/Y4ei/9NSlI6LGd/29UCJ
 /go1ykNLa0HMvVTYWTvxMDw+FOlDeKJIFj3x9LD9TSHkOyZBOg8GHg/pg
 TGwF4IZGjr4ERjezX99CSKTi5Ef77MDIAzqk4uAeFs1Iix6puvqft1JPj
 WBfoFyBuZIioHe+c027H97kqeie1GIOQt/v1lJ270M70vKXSGkT72F+sd
 Rm3xa3W82fhsVsdV4nafAnTos0WzHQZOaqM2E2L2gT0y+IhIhjbKV1PTb
 YuVzj7DGVdr+bySyajmQ8kmR3GVoDRVEQmLoTdAXTADX7BN3/FT9XExkC A==;
X-CSE-ConnectionGUID: z9eVeJqVRrKqNPMH3lIgxg==
X-CSE-MsgGUID: 990sdXQYSyi+S8iS8i0Bjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75221761"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75221761"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:31:27 -0700
X-CSE-ConnectionGUID: phqnbE2DTGeUmSu/1KVhTA==
X-CSE-MsgGUID: GBw/3kh2S3eP7AneXZPofQ==
X-ExtLoop1: 1
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:31:26 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v7 07/12] drm/xe/madvise: Block imported and exported dma-bufs
Date: Mon, 23 Mar 2026 15:00:56 +0530
Message-ID: <20260323093106.2986900-8-arvind.yadav@intel.com>
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

Prevent marking imported or exported dma-bufs as purgeable.
External devices may be accessing these buffers without our
knowledge, making purging unsafe.

Check drm_gem_is_imported() for buffers created by other
drivers and obj->dma_buf for buffers exported to other
drivers. Silently skip these BOs during madvise processing.

This follows drm_gem_shmem's purgeable implementation and
prevents data corruption from purging actively-used shared
buffers.

v3:
   - Addresses review feedback from Matt Roper about handling
     imported/exported BOs correctly in the purgeable BO
     implementation.

v4:
   - Check should be add to xe_vm_madvise_purgeable_bo.

v5:
   - Rename xe_bo_is_external_dmabuf() to xe_bo_is_dmabuf_shared()
     for clarity (Thomas)
   - Update comments to clarify why both imports and exports
     are unsafe to purge.

v6:
  - No PTEs to zap for shared dma-bufs.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index ed1940da7739..340e83764a76 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -185,6 +185,34 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 	}
 }
 
+
+/**
+ * xe_bo_is_dmabuf_shared() - Check if BO is shared via dma-buf
+ * @bo: Buffer object
+ *
+ * Prevent marking imported or exported dma-bufs as purgeable.
+ * For imported BOs, Xe doesn't own the backing store and cannot
+ * safely reclaim pages (exporter or other devices may still be
+ * using them). For exported BOs, external devices may have active
+ * mappings we cannot track.
+ *
+ * Return: true if BO is imported or exported, false otherwise
+ */
+static bool xe_bo_is_dmabuf_shared(struct xe_bo *bo)
+{
+	struct drm_gem_object *obj = &bo->ttm.base;
+
+	/* Imported: exporter owns backing store */
+	if (drm_gem_is_imported(obj))
+		return true;
+
+	/* Exported: external devices may be accessing */
+	if (obj->dma_buf)
+		return true;
+
+	return false;
+}
+
 /**
  * enum xe_bo_vmas_purge_state - VMA purgeable state aggregation
  *
@@ -234,6 +262,10 @@ static enum xe_bo_vmas_purge_state xe_bo_all_vmas_dontneed(struct xe_bo *bo)
 
 	xe_bo_assert_held(bo);
 
+	/* Shared dma-bufs cannot be purgeable */
+	if (xe_bo_is_dmabuf_shared(bo))
+		return XE_BO_VMAS_STATE_WILLNEED;
+
 	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
 		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
 			struct xe_vma *vma = gpuva_to_vma(gpuva);
@@ -335,6 +367,12 @@ static void __maybe_unused madvise_purgeable(struct xe_device *xe,
 		/* BO must be locked before modifying madv state */
 		xe_bo_assert_held(bo);
 
+		/* Skip shared dma-bufs - no PTEs to zap */
+		if (xe_bo_is_dmabuf_shared(bo)) {
+			vmas[i]->skip_invalidation = true;
+			continue;
+		}
+
 		/*
 		 * Once purged, always purged. Cannot transition back to WILLNEED.
 		 * This matches i915 semantics where purged BOs are permanently invalid.
-- 
2.43.0

