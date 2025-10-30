Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEEBCCF9FE
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 14:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9DE10E9BF;
	Thu, 30 Oct 2025 14:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gjWu96YQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1BF10E9B7
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 14:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761834259; x=1793370259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7I0C2rb54UHC6TTJByEZHmaOAdzy5HpzFmgou9vjqqE=;
 b=gjWu96YQks2+1q4AJZM+gBXDRYq1bfE0L+4rIJa7DbjaPk9T9wKNrSY8
 ZHE7CdzgoljqcATsMfhbZf8+BG3bzBf4Ow0G4rkORo5bMJ+JGmBs3oE0P
 IFgChk9tZ1NrsjV79RT73TbQNyan6DBqkqiR1IcMTzGktTz2svj6TTrv6
 7xnsYVWGrPiH+tB2PwFaElIuCzm8K0M9B5yx1uh8nTXFbSXyEubarUJrU
 g43TzpBpWdgudOk8YmdAKoBPFHeo7VFHt5IH/tHen7eJ29DhX1yGI/mK7
 idzEHSVIPAmkMAqMplIPixDaXERyicY670OVB6GRxiUPBO6UaSD9dAqQw Q==;
X-CSE-ConnectionGUID: WsN69TKTT+Kg1KFRgw0KUA==
X-CSE-MsgGUID: t82gOT/OREOdOg/LkoeyUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63181347"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="63181347"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 07:24:19 -0700
X-CSE-ConnectionGUID: E9lQRjYpTq+2sIPIrmVYiA==
X-CSE-MsgGUID: DLrI8mv4RAyvju9/jwPLig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="216625322"
Received: from himal-super-server.iind.intel.com (HELO
 hghimira.iind.intel.com) ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 30 Oct 2025 07:24:18 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3 3/5] drm/xe/svm: Extend MAP range to reduce vma
 fragmentation
Date: Thu, 30 Oct 2025 20:22:51 +0530
Message-Id: <20251030145253.867189-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251030145253.867189-1-himal.prasad.ghimiray@intel.com>
References: <20251030145253.867189-1-himal.prasad.ghimiray@intel.com>
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
index 5037fd246547..f348a1ca3e54 100644
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

