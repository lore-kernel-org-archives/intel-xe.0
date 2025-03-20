Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81536C36002
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 19:27:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436A910E69B;
	Thu, 20 Mar 2025 19:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OkVSEoUk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8511710E6A0
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 19:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742498848; x=1774034848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zdSvYlCSPTtloXZLiQIAFrt5T6AHAhr6peFTJNI/BPk=;
 b=OkVSEoUkDppUMw9ODGT0ftsL1ogredmI1cFw5S3EIyKgV9nY8shQRV7w
 2NofFxeVOpyW1R0QwKP4nrN0H03ggOXFrUT4b9QsK12NBDHZiLutQ4aJk
 OPLikQ5fUsVKPnAs1UoY0F93oJGZLg32l+CRzJx38Z+qR8yPz/Lx34yoL
 KUPiPX3nONBWH7aP9GtmZA+UiMxsPkwIrRqtPWDAjYREDCIaIYKgGeYUz
 HWPddSv/icup9p4AEjZFEMpkRRm3aKa6Xoi2ip8qpUgIgZXyNg1UzXQIM
 i9qtYhzhzhhLpkFoQKOsOLi81nGtAbdXISChLmSGeBHufEOGjFn2wTXQd Q==;
X-CSE-ConnectionGUID: PpPznb71RV6gu3IGi0kAEg==
X-CSE-MsgGUID: qyKVMBMTSPW6N9xr2A0FvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43678750"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43678750"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 12:27:23 -0700
X-CSE-ConnectionGUID: izjM3C7CTqi9JWul4dtMkA==
X-CSE-MsgGUID: FwFEHZhxSCGsr8wprGNFCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="123156822"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 12:27:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v3 6/9] drm/xe: Add VM.uapi_flags to VM snapshot capture
Date: Thu, 20 Mar 2025 12:28:28 -0700
Message-Id: <20250320192831.3842138-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320192831.3842138-1-matthew.brost@intel.com>
References: <20250320192831.3842138-1-matthew.brost@intel.com>
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

Add VM.uapi_flags to VM snapshot capture VM snapshot capture. This is
useful information for debug and will help build a robust GPU hang
replay tool.

The current format is:

VM.uapi_flags: 0x%x

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 94bf056da5b9..b51598d39149 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3705,6 +3705,7 @@ int xe_vm_validate_protected(struct xe_vm *vm)
 }
 
 struct xe_vm_snapshot {
+	int uapi_flags;
 	unsigned long num_snaps;
 	struct {
 		u64 ofs, bo_ofs;
@@ -3743,6 +3744,13 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 		goto out_unlock;
 	}
 
+	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
+		snap->uapi_flags |= DRM_XE_VM_CREATE_FLAG_FAULT_MODE;
+	if (vm->flags & XE_VM_FLAG_LR_MODE)
+		snap->uapi_flags |= DRM_XE_VM_CREATE_FLAG_LR_MODE;
+	if (vm->flags & XE_VM_FLAG_SCRATCH_PAGE)
+		snap->uapi_flags |= DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
+
 	snap->num_snaps = num_snaps;
 	i = 0;
 	drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
@@ -3856,6 +3864,7 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 		return;
 	}
 
+	drm_printf(p, "VM.uapi_flags: 0x%x\n", snap->uapi_flags);
 	for (i = 0; i < snap->num_snaps; i++) {
 		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[i].len);
 
-- 
2.34.1

