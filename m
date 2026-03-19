Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07DD108E1FA
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 11:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D7D10E987;
	Thu, 19 Mar 2026 11:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ja0vy1w5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4CC10E92D
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 11:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773921574; x=1805457574;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dPE5smODFAeXHdgAJ32P9UFFCbC4+nyua6Iwvb/x9Pc=;
 b=Ja0vy1w5LvelGX5WPRbqwni0Jp69EVv5uL5t17/1v5mbNma4IxiAtPWj
 rhNZlLzLf6KNGcwylb+dWa7hto6hVb3x1igZJ7SR4YA4B5UlunV0/RCNc
 2aJHMjk4Rwk2ByX4Szah9WNEIpH0QlyWsTblmQLaIOxwrb+WMygzyeO6s
 v7YCFLGOA4IoDtBRx4tTLmuyeSFajjigF6e78g5jwo8B4Nv4yT/DU0KpH
 G1pxUmLX7hrLWizYEKCSnCTv0xpfOlSfr00ntsciyyEmKLlXHYtR2T601
 TP+IVC8RCAm1ZAiMeyLABODwq3IY56xwR56AqQ9iUhhsr47epXz6UXYxP w==;
X-CSE-ConnectionGUID: o/dOMgWlSDSRX4LHLOdVpw==
X-CSE-MsgGUID: /wdwNCJnSKiiQdPDwhqMJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="78593942"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="78593942"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 04:59:23 -0700
X-CSE-ConnectionGUID: g1I3vwXJSMWeVu1hd4Y1tQ==
X-CSE-MsgGUID: KgoQnPrpTUCtANMd3GSVHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="223160888"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.31])
 by orviesa007.jf.intel.com with ESMTP; 19 Mar 2026 04:59:02 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, stable@vger.kernel.org,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Mathew Alwin <alwin.mathew@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v7 1/2] drm/xe/uapi: Reject coh_none PAT index for CPU cached
 memory in madvise
Date: Thu, 19 Mar 2026 11:58:57 +0000
Message-ID: <20260319115858.444541-2-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319115858.444541-1-jia.yao@intel.com>
References: <20260129000147.339361-1-jia.yao@intel.com>
 <20260319115858.444541-1-jia.yao@intel.com>
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

v3(Matthew Auld)
- Should be drm/xe/uapi
- More Cc

v4(Shuicheng Lin)
- Fix kmem leak issues by the way

v5
- Remove kmem leak because it has been merged by another patch

v6
- Remove the fix which is not related to current fix

v7
- No change

Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")
Cc: stable@vger.kernel.org # v6.18
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Mathew Alwin <alwin.mathew@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Acked-by: Michal Mrozek <michal.mrozek@intel.com>
Acked-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 45 ++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 869db304d96d..f26eb86e9c47 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -365,6 +365,43 @@ static void xe_madvise_details_fini(struct xe_madvise_details *details)
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
+		} else if (XE_IOCTL_DBG(xe, xe_vma_is_cpu_addr_mirror(vma) ||
+					    xe_vma_is_userptr(vma)))
+			/* System memory (userptr/SVM) is always CPU cached */
+			return false;
+	}
+
+	return true;
+}
+
 static bool check_bo_args_are_sane(struct xe_vm *vm, struct xe_vma **vmas,
 				   int num_vmas, u32 atomic_val)
 {
@@ -455,6 +492,14 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
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
-- 
2.43.0

