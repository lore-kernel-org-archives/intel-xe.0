Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE98D11193
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 19:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D198C10E661;
	Wed, 26 Nov 2025 19:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MouquNEk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDFF10E702
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 18:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764183598; x=1795719598;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bwCsZZGd3XuaQ7qzoFcXLkEcSaUDDNa5O1CkLOHWIiQ=;
 b=MouquNEkJ07cudmQBit8lGPhI5uOHfLleThBeEgftyS7FSkui4okTOLw
 6AwzLfpp2Thf2M8XFKxML/RldF7RLXMkJbbPiQsznwtTPXT0ItQVSuWOm
 A7NuTW/GniUgNh5cZUNpTUXDCDb5WcrpYqMBs4qwBqui/HrtKEeLMDG1f
 lQNzgI+xi+5dtiznEl520W1F5nr4VrG6s2M/USWXRGgj6AkXP2KOI+4bO
 pKDxLhv/rNeDMRX3E84vdUp9/JLOYVMo7mlFbBMpwgZkjtFAmFdvooq63
 eOHkO7oeVFA11H8sgQmlFw2dsY4sBC2bwHBktoqqHawXKd29EdWM6EBWX A==;
X-CSE-ConnectionGUID: m0vOLfVUTaOI8OJ7xYB/lg==
X-CSE-MsgGUID: KocIujmISUa5KUniA5DWeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66269523"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="66269523"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:59:57 -0800
X-CSE-ConnectionGUID: u7e33VewQDqD/aM9yLfzMQ==
X-CSE-MsgGUID: QDKDQl+ISPiMQuANzxe8Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193121214"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:59:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 6/9] drm/xe: Add VM.uapi_flags to VM snapshot capture
Date: Wed, 26 Nov 2025 10:59:49 -0800
Message-Id: <20251126185952.546277-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126185952.546277-1-matthew.brost@intel.com>
References: <20251126185952.546277-1-matthew.brost@intel.com>
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
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8bf3f9d3d644..00ffd3f03983 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4043,6 +4043,7 @@ int xe_vm_validate_protected(struct xe_vm *vm)
 }
 
 struct xe_vm_snapshot {
+	int uapi_flags;
 	unsigned long num_snaps;
 	struct {
 		u64 ofs, bo_ofs;
@@ -4082,6 +4083,13 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
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
@@ -4196,6 +4204,7 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 		return;
 	}
 
+	drm_printf(p, "VM.uapi_flags: 0x%x\n", snap->uapi_flags);
 	for (i = 0; i < snap->num_snaps; i++) {
 		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[i].len);
 
-- 
2.34.1

