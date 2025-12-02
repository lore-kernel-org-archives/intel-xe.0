Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48F2D116F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 13:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715DC10E65E;
	Tue,  2 Dec 2025 13:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJSFcQi0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B9010E65F
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 13:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764683648; x=1796219648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U8d1goNht4bhZspn9JOgntnbogboZa3/6paW4KvXNlw=;
 b=MJSFcQi09V4vhgiDkg4Fbkipv6VOqLD0GqAYFbbUA7BaYrInSf+56VLn
 7Dp4gDLB+YR9i2hN+d1BWrgQO6h/Z9W+hKKEBwW3SZvzaSFMEjEol7Jc3
 RgsmDHWbfCUloFLKJk7ce55QVWq93WM2iInhZTPzYb/VKtRCaBfpGRnxi
 6J7sR45FGxlORpDqQif4ff6epziAFrqRyynXzLm+JneGAwbz67wJGLmdo
 vCVSLy+hRsq577xEVKN3layNO4RVcH90AL95P1JcV57Tm1Cxj4vepFCwv
 YdxTZbxlitB7uix5rEry7SZYSI1KVgdIjsS9HlculN8tF7NAYAH8HCj/J w==;
X-CSE-ConnectionGUID: dtVPpwogQ4SD7D5KgJ3glQ==
X-CSE-MsgGUID: hA/AX+xnRX6crsTuGU3KaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66537137"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66537137"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:54:08 -0800
X-CSE-ConnectionGUID: AxrkdkNCRVOVsXSK6ckB+A==
X-CSE-MsgGUID: kvAlpIj/Tk+WRpK02/GqRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="199505812"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.246.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:54:03 -0800
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
Subject: [PATCH 18/20] drm/xe/vm: Support for adding null page VMA to VM on
 request
Date: Tue,  2 Dec 2025 15:52:37 +0200
Message-ID: <20251202135241.880267-19-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
References: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
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
 drivers/gpu/drm/xe/xe_vm.h |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6052bb81a827..a7df015af3b2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4676,3 +4676,36 @@ int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t r
 
 	return xe_vm_alloc_vma(vm, &map_req, false);
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
index 361f10b3c453..37da7d1d6ec1 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -414,4 +414,6 @@ static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
 #define xe_vm_has_valid_gpu_mapping(tile, tile_present, tile_invalidated)	\
 	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
 
+struct xe_vma *xe_vm_create_null_vma(struct xe_vm *vm, u64 addr);
+
 #endif
-- 
2.43.0

