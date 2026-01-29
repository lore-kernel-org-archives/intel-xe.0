Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4CCD3F083
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 05:51:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852E610E7CB;
	Thu, 29 Jan 2026 05:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DqnuUup5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859A710E7CB
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 05:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769665881; x=1801201881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jyAlDKRJWupAdjLBnlN9LmcdNWXy/ooB7fwbJVmllQE=;
 b=DqnuUup5Z81ydCxSqemaaEfmZRoC4XKX/J1x2+nFf+ywGQolOfsLAkRb
 LxLVkRyHQ63XPD6HlbH/fbrtzOiflFL+i1s24zaFqgFhOi0oWpWd/EjUE
 QxH97AgiwCqSXx1CDo1+b/t4XHJNgEO7VSDxCtHjj2FXlq+A11EFlve4y
 j7FI4f/GcNJ0bIwMDM7596bhld6v7MNbCAztCR5RyrOGCwMb2UMEJMuH2
 FSTaOvCXqiA1nTrud1H+NwDhX71bWVsjGIIUskRr+dtTKJesbUZ1g9gEd
 +7VTXXI5E5WQ8ydA/sbcuXBCqQ/L1ciWccgkeC1w5e46e5IFuiQa+BASN A==;
X-CSE-ConnectionGUID: /cVbhFNlTgirhSsFql4y3g==
X-CSE-MsgGUID: vPvGeifvT0WFolaKrAkBDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82262217"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="82262217"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 21:51:21 -0800
X-CSE-ConnectionGUID: lwZ5PsyCQcuZ79GwgoeAdA==
X-CSE-MsgGUID: Y3BuPncPR5aUcRjDDHnEOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="207711270"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.45])
 by orviesa010.jf.intel.com with ESMTP; 28 Jan 2026 21:51:20 -0800
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>,
	Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe: Reject coh_none PAT index for CPU cached memory in
 madvise
Date: Thu, 29 Jan 2026 05:51:13 +0000
Message-ID: <20260129055113.518798-1-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129000147.339361-1-jia.yao@intel.com>
References: <20260129000147.339361-1-jia.yao@intel.com>
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

Add validation in xe_vm_madvise_ioctl() to reject PAT indices with
XE_COH_NONE coherency mode when applied to CPU cached memory.

Using coh_none with CPU cached buffers is a security issue. When the
kernel clears pages before reallocation, the clear operation stays in
CPU cache (dirty). GPU with coh_none can bypass CPU caches and read
stale sensitive data directly from DRAM, potentially leaking data from
previously freed pages of other processes.

This aligns with the existing validation in vm_bind path
(xe_vm_bind_ioctl_validate_bo).

v2(Matthew brost)
- Add fixes
- Move one debug print to better place

Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 47 ++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index add9a6ca2390..50b82e821da7 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -352,6 +352,44 @@ static void xe_madvise_details_fini(struct xe_madvise_details *details)
 	drm_pagemap_put(details->dpagemap);
 }
 
+static bool check_pat_args_are_sane(struct xe_device *xe,
+				    struct xe_vmas_in_madvise_range *madvise_range,
+				    u16 pat_index)
+{
+	u16 coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
+	int i;
+
+	/*
+	 * Using coh_none with CPU cached buffers is not allowed.
+	 * Otherwise CPU page clearing can be bypassed, which is a
+	 * security issue. GPU can directly access system memory and
+	 * bypass CPU caches, potentially reading stale sensitive data
+	 * from previously freed pages.
+	 */
+	if (coh_mode != XE_COH_NONE)
+		return true;
+
+	for (i = 0; i < madvise_range->num_vmas; i++) {
+		struct xe_vma *vma = madvise_range->vmas[i];
+		struct xe_bo *bo = xe_vma_bo(vma);
+
+		if (bo) {
+			/* BO with WB caching + COH_NONE is not allowed */
+			if (XE_IOCTL_DBG(xe, bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB))
+				return false;
+			/* Imported dma-buf without caching info, assume cached */
+			if (XE_IOCTL_DBG(xe, !bo->cpu_caching))
+				return false;
+		} else if (XE_IOCTL_DBG(xe, xe_vma_is_cpu_addr_mirror(vma)) ||
+			   xe_vma_is_userptr(vma)) {
+			/* System memory (userptr/SVM) is always CPU cached */
+			return false;
+		}
+	}
+
+	return true;
+}
+
 static bool check_bo_args_are_sane(struct xe_vm *vm, struct xe_vma **vmas,
 				   int num_vmas, u32 atomic_val)
 {
@@ -442,6 +480,14 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	if (err || !madvise_range.num_vmas)
 		goto madv_fini;
 
+	if (args->type == DRM_XE_MEM_RANGE_ATTR_PAT) {
+		if (!check_pat_args_are_sane(xe, &madvise_range,
+					     args->pat_index.val)) {
+			err = -EINVAL;
+			goto free_vmas;
+		}
+	}
+
 	if (madvise_range.has_bo_vmas) {
 		if (args->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
 			if (!check_bo_args_are_sane(vm, madvise_range.vmas,
@@ -485,6 +531,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 err_fini:
 	if (madvise_range.has_bo_vmas)
 		drm_exec_fini(&exec);
+free_vmas:
 	kfree(madvise_range.vmas);
 	madvise_range.vmas = NULL;
 madv_fini:
-- 
2.43.0

