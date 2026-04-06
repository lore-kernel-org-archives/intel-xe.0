Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76950EF4EA4
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 08:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372D810E213;
	Mon,  6 Apr 2026 08:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QvxIalcV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61AF10E213
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 08:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775465924; x=1807001924;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=epW333p8LOXxDL66Twyml6y3E6JgecdBoN41AwlAPF4=;
 b=QvxIalcVw34NgRxgzgzWoxXHcQHr9vpNDj1DVLTGD6ZJht6+6qeC9/MC
 Qv5H/yD1tBfCJY3rJLk/W9hICFwN6L5cSjT8FXmljWtoEt0dbaOuHRnLQ
 dcafc/Y/IZQDJibiLUf8RwjoBKlDHgN9f/h+TZIqRiEynMcKaefYsNqDF
 NP7wsid5DdNHcRoGRhdk3KvM/DiGQdXx0Pgdomn57Gx7iLHHHcyoLKLRd
 kmmR8DuNra4SO0/v6obsfjiX3zNkAHhcV5vpFh4cWKNuFK4y0r+QtFjhQ
 XRlXc0KVaOIFIaJG225uXKmaMnaiLP1dEeJ4OdgnWWqXYEo/CXahLch7t w==;
X-CSE-ConnectionGUID: Vw7rBm6PQa28tckvHkq1/A==
X-CSE-MsgGUID: 9R28cBNQS4i6KaURdgRH4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="80012884"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="80012884"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:58:44 -0700
X-CSE-ConnectionGUID: vRWaDMy3TDOYzsxXBGQ7FA==
X-CSE-MsgGUID: Ki3iADBuSHyZfLLUefoH3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="227775163"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:58:42 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC v2 1/7] drm/xe/vm: Track CPU_AUTORESET state in xe_vma
Date: Mon,  6 Apr 2026 14:28:24 +0530
Message-ID: <20260406085830.1118431-2-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406085830.1118431-1-arvind.yadav@intel.com>
References: <20260406085830.1118431-1-arvind.yadav@intel.com>
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

Track MADVISE_AUTORESET CPU-only state in struct xe_vma with a dedicated
cpu_autoreset_active bool.

Add XE_VMA_CPU_AUTORESET_ACTIVE as a pipeline-only bit to carry this
state through MAP/REMAP operations. Runtime state lives in
xe_vma.cpu_autoreset_active rather than vma->gpuva.flags.

The state is set at bind time and cleared on the first successful GPU
fault.

v2:
  - Move runtime state from gpuva.flags to xe_vma bool. (Matt)
  - Keep XE_VMA_CPU_AUTORESET_ACTIVE pipeline-only. (Matt)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.h       |  5 +++++
 drivers/gpu/drm/xe/xe_vm_types.h | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index c5b900f38ded..bdf42083da86 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -181,6 +181,11 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 		!xe_vma_is_cpu_addr_mirror(vma);
 }
 
+static inline bool xe_vma_has_cpu_autoreset_active(const struct xe_vma *vma)
+{
+	return vma->cpu_autoreset_active;
+}
+
 struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
 
 int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index a94827d7fbec..6a19ecca5518 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -52,6 +52,8 @@ struct xe_vm_pgtable_update_op;
 #define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 8)
 #define XE_VMA_SYSTEM_ALLOCATOR	(DRM_GPUVA_USERBITS << 9)
 #define XE_VMA_MADV_AUTORESET	(DRM_GPUVA_USERBITS << 10)
+/* Pipeline-only bit used to carry cpu_autoreset_active through MAP/REMAP. */
+#define XE_VMA_CPU_AUTORESET_ACTIVE	(DRM_GPUVA_USERBITS << 11)
 
 /**
  * struct xe_vma_mem_attr - memory attributes associated with vma
@@ -157,6 +159,14 @@ struct xe_vma {
 	/** @tile_staged: bind is staged for this VMA */
 	u8 tile_staged;
 
+	/**
+	 * @cpu_autoreset_active: CPU mirror VMA is still CPU-only.
+	 *
+	 * Set at bind time and cleared on the first successful GPU fault.
+	 * Protected by vm->lock.
+	 */
+	bool cpu_autoreset_active;
+
 	/**
 	 * @skip_invalidation: Used in madvise to avoid invalidation
 	 * if mem attributes doesn't change
-- 
2.43.0

