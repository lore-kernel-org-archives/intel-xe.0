Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BD8E9E31F
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 15:27:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C8E10E61A;
	Wed, 11 Feb 2026 15:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jYiTiAz6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF7E10E051
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 15:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770823633; x=1802359633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mvt50osqlEMKrxd0A/L+Ok6kPVIAnxKMITRc396BUwE=;
 b=jYiTiAz697hMKzPmwhR/GIFFfnCoiCE+Ox9YWM+a0abHxiyjRV70RNyc
 TIdYZRNkQyvw0ybChryVuCEAIE3+Ub1cUMXAhtHTNE4RwzSLmhLeNrkn7
 kV7TiQnCW64c6G50345QbN/mO8G6pPqOLi/6gM3lyHD/69UKP7CXx7s6L
 ATFS2WKinm/eSyJ86xxMrfwEJ45Bk+KEhKCWaXOoTpUmkhXGalwxtWj9A
 BMC38KQPzA62TTRKZ8CIEl1z2y8b5/+MyQUoL8GJs6MYitIuEzHJk2kzU
 ZWgzxnywPV2GakZOsCGgZNh/wrEsuUJ/Vna5wjLKM+lyzCNSXZ3aYT4Xw g==;
X-CSE-ConnectionGUID: l54lir+OSuCpgO7Fj4EMWg==
X-CSE-MsgGUID: zIynLN4IQnyDObzplBDxgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="89564296"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="89564296"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 07:27:13 -0800
X-CSE-ConnectionGUID: CCFVxTVPRkGKNbBtxubk5g==
X-CSE-MsgGUID: +2v5eW38RLW/5WXinsV8NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211388198"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 07:27:12 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [PATCH v5 7/9] drm/xe/madvise: Block imported and exported dma-bufs
Date: Wed, 11 Feb 2026 20:56:36 +0530
Message-ID: <20260211152644.1661165-8-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211152644.1661165-1-arvind.yadav@intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
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

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 35 ++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index c184426546a2..8d55ea78b6d1 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -184,6 +184,33 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 	}
 }
 
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
  * xe_bo_all_vmas_dontneed() - Check if all VMAs of a BO are marked DONTNEED
  * @bo: Buffer object
@@ -204,6 +231,10 @@ static bool xe_bo_all_vmas_dontneed(struct xe_bo *bo)
 
 	xe_bo_assert_held(bo);
 
+	/* Shared dma-bufs cannot be purgeable */
+	if (xe_bo_is_dmabuf_shared(bo))
+		return false;
+
 	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
 		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
 			struct xe_vma *vma = gpuva_to_vma(gpuva);
@@ -304,6 +335,10 @@ static void __maybe_unused madvise_purgeable(struct xe_device *xe,
 		/* BO must be locked before modifying madv state */
 		xe_bo_assert_held(bo);
 
+		/* Skip shared dma-bufs */
+		if (xe_bo_is_dmabuf_shared(bo))
+			continue;
+
 		/*
 		 * Once purged, always purged. Cannot transition back to WILLNEED.
 		 * This matches i915 semantics where purged BOs are permanently invalid.
-- 
2.43.0

