Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7387DCCFA13
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 10:53:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3110010F314;
	Thu, 30 Apr 2026 10:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gejrpYoN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE2E10F31C
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 10:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777546431; x=1809082431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gEFoyLvgiej2dib+jrz17kHSut6kau+UrFdYQsImN5k=;
 b=gejrpYoNNfRyRha4vsjyW6KB1dYk75aQFTeXsjyXSA9TrPSQxK8b/Upf
 TNgsMkxW6maf7QSQLiR70REgWG557khDbOUQLVLg+/KCOMIdkFfH3EsAB
 TP1HCkvmFODzzoLvPIn53olQCsuGcTu4UMO3ZG8El/erLLdYZ1+ZZTsTd
 T6qqOZ/pg0hDn3pK0zfIpTHBYL7dLZHbo9ig1DHnke1SLe0Vr6KCsVtwP
 F41KXd6xgHp4HcIC7Netudxnr+eCn4rXWs1JYeobdkDamed71XmTTvw8f
 lCiJZ4/qeUd1tZgTfENvav5vhvdTUDOF6TMHeoF+Mp8o4wetw1+CJjSWs w==;
X-CSE-ConnectionGUID: pz1qWjGqT8iBeJcGZTGsSw==
X-CSE-MsgGUID: Ss3S3vWdTOO8jau73ud7zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89586068"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="89586068"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:53:51 -0700
X-CSE-ConnectionGUID: 0rW/HIQ7QWurSw+TM7VrXA==
X-CSE-MsgGUID: HiumJEggTd+ICtns18SWfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="233518915"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.250.15])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:53:45 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Oak Zeng <oak.zeng@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Bruce Chang <yu.bruce.chang@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 21/24] drm/xe/vm: Support for adding null page VMA to VM on
 request
Date: Thu, 30 Apr 2026 13:51:17 +0300
Message-ID: <20260430105121.712843-22-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
References: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
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
index f00bd5801b0c..20acf5b63214 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -5083,3 +5083,36 @@ void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
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
index c5b900f38ded..63821e11c81a 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -436,4 +436,7 @@ static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
 	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
 
 void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from);
+
+struct xe_vma *xe_vm_create_null_vma(struct xe_vm *vm, u64 addr);
+
 #endif
-- 
2.43.0

