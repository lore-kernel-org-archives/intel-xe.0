Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53B7EA4FC2
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:05:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22C210E44A;
	Mon, 23 Feb 2026 14:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ni56y3Hb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B62F10E44A
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 14:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771855500; x=1803391500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vRnCb762anjR7XncpNZ2yLcoqvxLPDydrWdjkktPiXY=;
 b=Ni56y3Hb0FOm0gOI5F5R8XxoQIX6LdkccgeXAcUplACEvuIkWz8fh3rN
 JtXvK75OdNRCtuBquVU+ehOCQM5y7Kl3260kk8D4MO7QqMp936y+o6lTe
 v930Y4VGOnMAFoYR3TeXSD0Ils1B3BXRm7B/O90hMac+G51apwgLZqBqy
 /VSK0U/+ULe/09pMGmLM5VleEV3FhHMbZ8BZEsk4wbgcgf/b9TIqGYNuK
 ay0iZL5xdlTuLSjQOcq8j3uKHcminnq9+W1chvWYPIl0bJG0cGLNoyQ3K
 wcIMVKZFmIiyw8qb9RwwXDgvwoxI2BLBftMJmLAfq2B62+Ao/29rdZN0y w==;
X-CSE-ConnectionGUID: +q2sr1cBSlWvsCUxGowN9w==
X-CSE-MsgGUID: l+Gq0wHmTG+n6NSf37jlig==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76460973"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76460973"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:05:00 -0800
X-CSE-ConnectionGUID: cuT04mVYSNSkKyUgkvum3Q==
X-CSE-MsgGUID: GHlz3Rg9TNqQKfNXyTxKrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="214656534"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.3])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:04:55 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Oak Zeng <oak.zeng@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Bruce Chang <yu.bruce.chang@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 20/22] drm/xe/vm: Support for adding null page VMA to VM on
 request
Date: Mon, 23 Feb 2026 16:03:15 +0200
Message-ID: <20260223140318.1822138-21-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
References: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
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

From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

The XE2 (and PVC) HW has a limitation that the pagefault due to invalid
access will halt the corresponding EUs. So, in order to activate the
debugger, kmd needs to install the temporal page to unhalt the EUs.
Plan to be used for pagefault handling when the EU debugger is running.
The idea is to install a null page vma if the pagefault is from an invalid
access. After installing null page pte, the user debugger can continue to
run/inspect without causing a fatal failure or reset and stop.
Based on Bruce's implementation [1].

[1] https://lore.kernel.org/intel-xe/20230829231648.4438-1-yu.bruce.chang@intel.com/

v2: s/NULL_VMA/DRM_GPUVA_SPARSE (Mika)
v3: use ERR_CAST as we dont return null (Mika)

Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Co-developed-by: Bruce Chang <yu.bruce.chang@intel.com>
Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 33 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h |  3 +++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e09ebd2e357c..9ee0631cb6cb 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4796,3 +4796,36 @@ void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	}
 	up_write(&vm->exec_queues.lock);
 }
+
+struct xe_vma *xe_vm_create_null_vma(struct xe_vm *vm, u64 addr)
+{
+	struct xe_vma_mem_attr default_attr = {
+		.preferred_loc = {
+			.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
+			.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
+		},
+		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
+		.default_pat_index = vm->xe->pat.idx[XE_CACHE_NONE],
+		.pat_index = vm->xe->pat.idx[XE_CACHE_NONE],
+	};
+	struct xe_vma *vma;
+	u32 page_size;
+	int err;
+
+	if (xe_vm_is_closed_or_banned(vm))
+		return ERR_PTR(-ENOENT);
+
+	page_size = vm->flags & XE_VM_FLAG_64K ? SZ_64K : SZ_4K;
+	vma = xe_vma_create(vm, NULL, 0, addr, addr + page_size - 1,
+			    &default_attr, DRM_GPUVA_SPARSE);
+	if (IS_ERR(vma))
+		return ERR_CAST(vma);
+
+	err = xe_vm_insert_vma(vm, vma);
+	if (err) {
+		xe_vma_destroy_late(vma);
+		return ERR_PTR(err);
+	}
+
+	return vma;
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 288115c7844a..5d932b29d047 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -418,4 +418,7 @@ static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
 	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
 
 void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from);
+
+struct xe_vma *xe_vm_create_null_vma(struct xe_vm *vm, u64 addr);
+
 #endif
-- 
2.43.0

