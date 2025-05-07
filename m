Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74969C3ABBF
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 20:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6D410E897;
	Wed,  7 May 2025 20:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZlXtKQf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1175B10E88D
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 20:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746648857; x=1778184857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oBXcsaveZ7PUh8J9ROGRYn/YeXC4vlB4Cbv7nAv/mKk=;
 b=fZlXtKQfDJTtx0n+FLrcOY6ZG5IOJhJc6bv3ZnCAfgG7Smd/PVc4DxdH
 RLydWP9VSvemoG7PDP7OtDraKOfXUfKdpJQWeooxjjRDAdQ7+QYH6UiYU
 tHO7l1Y4faCxZATfYmOYa/bONq06UQjiwBg6Vj6nC3OPrGMpzAjEJf9Oi
 dG82K3nTl4j1b6hWxvok03rYOqr0+aAJ0ccAfRAd2o9xqu66BJpe/rvDb
 tUNywTEoQDC4uyiXDEnADVKttW79Oml46YlPC1pR6wzogHXSspEOEYMuJ
 Xdy6a1kzO3/x0KhqfiMAKz+h1WHVOY9J93DN1CS+PmeYNQiPcDlbui8Zd Q==;
X-CSE-ConnectionGUID: 1+CC3w3YQpSHOGsvc9q+3A==
X-CSE-MsgGUID: Yp6haXeuRHqtFKsRMv712w==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="65935088"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="65935088"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:14:17 -0700
X-CSE-ConnectionGUID: RA0EoqNGSOGQ+6C896hrlA==
X-CSE-MsgGUID: ewt3GxRfSBCg1U4tcyopFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="136571019"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:14:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, carlos.santa@intel.com,
 sushma.venkatesh.reddy@intel.com
Subject: [PATCH v4 6/9] drm/xe: Add VM.uapi_flags to VM snapshot capture
Date: Wed,  7 May 2025 13:15:36 -0700
Message-Id: <20250507201539.1316770-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507201539.1316770-1-matthew.brost@intel.com>
References: <20250507201539.1316770-1-matthew.brost@intel.com>
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
index 5af2e79ae34e..ef1736fc0c2f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3723,6 +3723,7 @@ int xe_vm_validate_protected(struct xe_vm *vm)
 }
 
 struct xe_vm_snapshot {
+	int uapi_flags;
 	unsigned long num_snaps;
 	struct {
 		u64 ofs, bo_ofs;
@@ -3762,6 +3763,13 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
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
@@ -3876,6 +3884,7 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 		return;
 	}
 
+	drm_printf(p, "VM.uapi_flags: 0x%x\n", snap->uapi_flags);
 	for (i = 0; i < snap->num_snaps; i++) {
 		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[i].len);
 
-- 
2.34.1

