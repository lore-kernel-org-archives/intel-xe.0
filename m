Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B6ECAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 10:15:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DCE10E408;
	Mon, 22 Sep 2025 10:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NpRCpNw4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4046C10E407
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 10:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758536126; x=1790072126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YSxXGlPIVSseYhcFfeQ8f9D+RnTN+gIewd/VcyjsHEE=;
 b=NpRCpNw4La8RueHSiNYiznTlHL7LphljT+zsDJTITA8vBodrb5WGpBHp
 MbnRACOLsMRGdZf1izdolgDPdfjdyOAK+KMwXVaRTmlxNN2GkOnk7WssD
 FBbNxbqr0owSQob/en6y8NaaA2Jdh24R9q2SMnMYH2ajoU/ibOrwWObEt
 c/jzaPy9VVyC2VN2rCDAi6W8POSX4Uw/jVMxJqDNZ23479YXxldhlsPU8
 m/i1nevsfT2pycyW7Mf63/YO6O71k1Dt/uAbehxjtxXZQPH3MFA+ZmSVH
 p/1LmTref0E8wLSVIr4lg6Ve3Kc0BPbzMagAnjSkJs+8o3HHz0zNSueLm Q==;
X-CSE-ConnectionGUID: M7+VZYtISkqGBNbmJmGlbQ==
X-CSE-MsgGUID: iXvl3N1TQ8aAxgzy/NB2IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="64433393"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="64433393"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 03:15:26 -0700
X-CSE-ConnectionGUID: unV9ruAxTuSGay9SK+I6OA==
X-CSE-MsgGUID: CLFbJZvfTLmJ9xQQBVpFGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="176263382"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by orviesa007.jf.intel.com with ESMTP; 22 Sep 2025 03:15:25 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 3/4] drm/xe/svm: Extend MAP range to reduce vma fragmentation
Date: Mon, 22 Sep 2025 16:13:15 +0530
Message-Id: <20250922104316.263995-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922104316.263995-1-himal.prasad.ghimiray@intel.com>
References: <20250922104316.263995-1-himal.prasad.ghimiray@intel.com>
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
`bo_unmap` operations ideally target the same area and helps reduce
fragmentation by coalescing nearby compatible VMAs into a single mapping.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 246bff91fa43..198130f71e0f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2213,6 +2213,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 	struct drm_gpuva_ops *ops;
 	struct drm_gpuva_op *__op;
 	struct drm_gpuvm_bo *vm_bo;
+	u64 range_start = addr;
 	u64 range_end = addr + range;
 	int err;
 
@@ -2225,10 +2226,14 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
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

