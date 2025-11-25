Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B7BCFD368
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 07:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A408D10E354;
	Tue, 25 Nov 2025 07:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdJmPGgB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2266B10E108
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 07:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764055645; x=1795591645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y6Aw1bAtjZsCDaaDpCYShMB+Xt4EdK2PCoCOjZtD/cE=;
 b=bdJmPGgBoCUplkrLeOSKzJVCE5As8LTfqRK0KQ5mmaY/umo+QpErKIK6
 u9yOer7fVYm64p8fJTLmIkyqIXsJn51V5AQTeMrUZIz0ivCbynjitUn7n
 uTd3qWo/cGWJagbzkxzLcAi8KjmErkE63V7Z/brPtSbD5lOwNFjtJDHyT
 20tfnmLPKh3lkO8e+/TQM0G81fcIHckY/avZ1OAhbgDgqbfWEO8muCk2n
 yGtS1bcT6+z0auWvmCHw1a6WweYKC9U/3G7/Y3bTbooIQ0ydjpvWFm6Dg
 w+VxeysNMiVxbZ7gAZe0YRczTxvpwIivoqNuqYOKp+t9PpdDEJPVBdX+d w==;
X-CSE-ConnectionGUID: 52oi9vQVRvucu/aIQV8WKA==
X-CSE-MsgGUID: Mx/X3eKjRKawxKA0412HYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="91553149"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="91553149"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 23:27:25 -0800
X-CSE-ConnectionGUID: i4w+m6rhSEKptoYyKjJSRg==
X-CSE-MsgGUID: Jqq/EN1zTRiIzsJskn2McQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="191698550"
Received: from himal-super-server.iind.intel.com (HELO
 hghimira.iind.intel.com) ([10.190.239.34])
 by orviesa006.jf.intel.com with ESMTP; 24 Nov 2025 23:27:24 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v5 3/5] drm/xe/svm: Extend MAP range to reduce vma
 fragmentation
Date: Tue, 25 Nov 2025 13:26:26 +0530
Message-Id: <20251125075628.1182481-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125075628.1182481-1-himal.prasad.ghimiray@intel.com>
References: <20251125075628.1182481-1-himal.prasad.ghimiray@intel.com>
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

When DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR is set during VM_BIND_OP_MAP,
the mapping logic now checks adjacent cpu_addr_mirror VMAs with default
attributes and expands the mapping range accordingly. This ensures that
bo_unmap operations ideally target the same area and helps reduce
fragmentation by coalescing nearby compatible VMAs into a single mapping.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index fc11a1a6f979..2681039f3221 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2233,6 +2233,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 	struct drm_gpuva_ops *ops;
 	struct drm_gpuva_op *__op;
 	struct drm_gpuvm_bo *vm_bo;
+	u64 range_start = addr;
 	u64 range_end = addr + range;
 	int err;
 
@@ -2245,10 +2246,14 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
 	switch (operation) {
 	case DRM_XE_VM_BIND_OP_MAP:
+		if (flags & DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
+			xe_vm_find_cpu_addr_mirror_vma_range(vm, &range_start, &range_end);
+
+		fallthrough;
 	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
 		struct drm_gpuvm_map_req map_req = {
-			.map.va.addr = addr,
-			.map.va.range = range,
+			.map.va.addr = range_start,
+			.map.va.range = range_end - range_start,
 			.map.gem.obj = obj,
 			.map.gem.offset = bo_offset_or_userptr,
 		};
-- 
2.34.1

