Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1B3FCD0C1
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 07:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217C210E6A4;
	Wed, 18 Mar 2026 07:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FNtXP/Hp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA0510E6A4
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 07:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773817841; x=1805353841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d35aZ7hJQcNyduAXLCcPddLxUMDyxWeWVieWMgTNxUo=;
 b=FNtXP/HpbtoTapiC56JFL4EgoKcLBKWrQNUqiAUYzR1d9S2rbUOLhDo1
 km2IDYpTDYaYRJ6sjFn9jt6fJeOd7TrhigZuhBdZ97NUd32fBUpqDFwm1
 BuuiLDPRRj63ikfZzyLY2YVUBC563+UtKk6weygFFQ2ypA4mYVJSXnw8r
 dpMCM2p/12ghsPA3ITK+uShl/Zf/MWRwlpjQcyNwqS2tHoSiUQEiipFWG
 9/3KwdTtcvzDr6sltFU5LWcEHBkLMYQPE94zs5zqATKHSKXMyYdK5fU3I
 0GRLd5Tlwy4+h1RLCysicP/XzfVU+VM5VA9jN8wrr7wawGazqJcdojNRa g==;
X-CSE-ConnectionGUID: gf8oaqHxRFK4G9M+oaHtWA==
X-CSE-MsgGUID: zEUYR3r6SPW3W9OEOlcqlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78764289"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="78764289"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 00:10:41 -0700
X-CSE-ConnectionGUID: i9VxB9axQQibHu0Tex1/rA==
X-CSE-MsgGUID: MLxY5IR9Sqm0lY5q8X/SFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="260424104"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 00:10:39 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 stuart.summers@intel.com, arvind.yadav@intel.com, tejas.upadhyay@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 14/15] drm/xe/vm: Add xe_vma_supports_access_ctr() helper
Date: Wed, 18 Mar 2026 13:14:55 +0530
Message-Id: <20260318074456.2839499-15-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
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

Hardware access counter slots are finite resources. Add a helper
to determine whether a VMA is eligible for access counting, so
callers can avoid wasting slots on BOs that cannot benefit from
migration hints.

A VMA is eligible if:
  - The device is a discrete GPU (access counters unused on iGPU)
  - It is a CPU address mirror (SVM) VMA, which is always migratable
  - The backing BO has more than one placement region
  - The BO is not already resident in VRAM local to the triggering tile

Userptr and null VMAs are excluded as they have no associated BO.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 41 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h |  3 +++
 2 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 659504ec5a13..7f979d6205f4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4356,6 +4356,47 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 	kvfree(snap);
 }
 
+/**
+ * xe_vma_supports_access_ctr - Determine if VMA is eligible for access counting
+ * @xe: Pointer to the Xe device structure
+ * @vma: The VMA
+ * @tile: Tile with which VMA bound is associated to
+ *
+ * Note, access counters are not used unless enabled in LRC.
+ */
+bool xe_vma_supports_access_ctr(struct xe_device *xe,
+				struct xe_vma *vma,
+				struct xe_tile *tile)
+{
+	struct xe_bo *bo = xe_vma_bo(vma);
+	struct ttm_resource *res;
+
+	if (!IS_DGFX(xe))
+		return false;
+
+	if (xe_vma_is_cpu_addr_mirror(vma))
+		return true;
+
+	/* userptr or using null vma*/
+	if (!bo)
+		return false;
+
+	res = bo->ttm.resource;
+	/* if for some reason no backing store, nothing to migrate */
+	if (!res)
+		return false;
+
+	/* cannot migrate if single placement */
+	if (bo->placement.num_placement <= 1)
+		return false;
+
+	/* cannot migrate to ourself (already in VRAM local to @tile) */
+	if (!tile->mem.vram || res->mem_type == tile->mem.vram->placement)
+		return false;
+
+	return true;
+}
+
 /**
  * xe_vma_need_vram_for_atomic - Check if VMA needs VRAM migration for atomic operations
  * @xe: Pointer to the Xe device structure
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 127cecfcb80b..17844ef0f0b7 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -178,6 +178,9 @@ struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
 
 int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic);
 
+bool xe_vma_supports_access_ctr(struct xe_device *xe, struct xe_vma *vma,
+				struct xe_tile *tile);
+
 int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
 
 int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
-- 
2.34.1

