Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B811FCCF9FE
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 05:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713B910E37D;
	Mon,  3 Nov 2025 05:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PnAFSHr8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6BB10E372
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 05:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762148480; x=1793684480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eB7uVww636KhKKTBo6cxPp95wIbTuQnOeM5LgdB6d0w=;
 b=PnAFSHr8khG/LHnOBrQRaVQqoXvLWkPhnedHbMLKVWHMT1WtmdqYglvc
 w2t3Ii7yc02XLAwrISfyG8moQCVr8P7/OkHdzjQLdDaAvwFl8ezsuVYT1
 Hnfh0P+jH7LCVc6refzMtls3fjn3XnIaZCcl7iQbldyq1SFzxksmkrfMA
 D1SzVITZRwgi/fxeLhkMk9oezBvAWw+iZaFR7cq1sMd6vcBkG4V3o2F0a
 4+3nzJz+vxfEziQGFkHD7/0P1yfzRRBeFXPkQgzzGhfHc/VRMw97WKBkS
 V62BBDOyg2XbHAWWf1dYAcX1Gj0VUW2O9EpljsL2GnMdR1doReNK3LUbd w==;
X-CSE-ConnectionGUID: g++WE5LzRAy3ZgFIZ82DXg==
X-CSE-MsgGUID: aIQp1isCQm6K824bljqYxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="74896316"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="74896316"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 21:41:19 -0800
X-CSE-ConnectionGUID: FEMQF0kMQsyTdwmeN3JdCw==
X-CSE-MsgGUID: 8xovfdc4Qkmz5a8D6mvjOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="191936210"
Received: from himal-super-server.iind.intel.com (HELO
 hghimira.iind.intel.com) ([10.190.239.34])
 by orviesa005.jf.intel.com with ESMTP; 02 Nov 2025 21:41:18 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v4 3/5] drm/xe/svm: Extend MAP range to reduce vma
 fragmentation
Date: Mon,  3 Nov 2025 11:39:55 +0530
Message-Id: <20251103060957.957760-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251103060957.957760-1-himal.prasad.ghimiray@intel.com>
References: <20251103060957.957760-1-himal.prasad.ghimiray@intel.com>
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
index 944eb35bb2b8..d78eb95a954f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2231,6 +2231,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 	struct drm_gpuva_ops *ops;
 	struct drm_gpuva_op *__op;
 	struct drm_gpuvm_bo *vm_bo;
+	u64 range_start = addr;
 	u64 range_end = addr + range;
 	int err;
 
@@ -2243,10 +2244,14 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
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

