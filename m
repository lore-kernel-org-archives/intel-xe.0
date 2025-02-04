Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0B5C02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 18:30:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B644110E6E2;
	Tue,  4 Feb 2025 18:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BDqHl6D/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB92210E033
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 18:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738693838; x=1770229838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S8QI/nfadb+rgIrmMmLy7OGWGflPwzbYRtnSx0LEzq0=;
 b=BDqHl6D/3Y3CN+E1LB/nKf5swSd/s7LhgQxXZewsedhc923gnL6mw2f2
 GVKL5UC1MVNuVuzGBI9i/C3hRW1rD8++0y23wz1hVm2vmIN6DrE6DuFSc
 miB+Q8Gt1k9UhYIRLSaCe1jdbrh6RSzBT3zPT3cQxv7VJ6tHErbCi0c2g
 xzgT1tHBYbuZ/qDmQLvWqy+wL0JAifPwo4qFW7+6G7/wt6eL3k9cQQuSU
 9eohSD2pha9Sr7XevaUXtKuuqcdZzvHwFb3cDoqo+roPSflUFH/4XGBAT
 lHsIpBk26xfJ6uaAaETLbKwESUMkULHYyk4EIKREz1pe/O7uddDOiq66k g==;
X-CSE-ConnectionGUID: 1QObhIabSsyO1cI1A57HfQ==
X-CSE-MsgGUID: /JhRWNTJTvCt+jzxx2NdKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39131950"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="39131950"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:30:37 -0800
X-CSE-ConnectionGUID: S4oAlLzQSu+x845Ed2gNcw==
X-CSE-MsgGUID: M4JzJa9VSG+U8fhuCDa2lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="115709222"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:30:37 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com
Subject: [PATCH 3/3] drm/xe: Allow scratch page under fault mode for certain
 platform
Date: Tue,  4 Feb 2025 13:45:58 -0500
Message-Id: <20250204184558.4181478-3-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250204184558.4181478-1-oak.zeng@intel.com>
References: <20250204184558.4181478-1-oak.zeng@intel.com>
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

Normally scratch page is not allowed when a vm is operate under page
fault mode, i.e., in the existing codes, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
and DRM_XE_VM_CREATE_FLAG_FAULT_MODE are mutual exclusive. The reason
is fault mode relies on recoverable page to work, while scratch page
can mute recoverable page fault.

On xe2 and xe3, out of bound prefetch can cause page fault and further
system hang because xekmd can't resolve such page fault. SYCL and OCL
language runtime requires out of bound prefetch to be silently dropped
without causing any functional problem, thus the existing behavior
doesn't meet language runtime requirement.

At the same time, HW prefetching can cause page fault interrupt. Due to
page fault interrupt overhead (i.e., need Guc and KMD involved to fix
the page fault), HW prefetching can be slowed by many orders of magnitude.

Fix those problems by allowing scratch page under fault mode for xe2 and
xe3. With scratch page in place, HW prefetching could always hit scratch
page instead of causing interrupt.

A side effect is, scratch page could hide application program error.
Application out of bound accesses are hided by scratch page mapping,
instead of get reported to user.

igt test: https://patchwork.freedesktop.org/series/144334/. Test result on
BMG:

root@DUT1130BMGFRD:/home/szeng/dii-tools/igt-public/build/tests# ./xe_exec_fault_mode --run-subtest scratch-fault
IGT-Version: 1.30-gde1a3cb42 (x86_64) (Linux: 6.13.0-xe x86_64)
Using IGT_SRANDOM=1738684805 for randomisation
Opened device: /dev/dri/card0
Starting subtest: scratch-fault
Subtest scratch-fault: SUCCESS (0.080s)

Without this series, the test result is:

root@DUT1130BMGFRD:/home/szeng/dii-tools/igt-public/build/tests# ./xe_exec_fault_mode --run-subtest scratch-fault
IGT-Version: 1.30-gde1a3cb42 (x86_64) (Linux: 6.13.0-xe x86_64)
Using IGT_SRANDOM=1738686046 for randomisation
Opened device: /dev/dri/card0
Starting subtest: scratch-fault
(xe_exec_fault_mode:5047) CRITICAL: Test assertion failure function test_exec, file ../tests/intel/xe_exec_fault_mode.c:349:
(xe_exec_fault_mode:5047) CRITICAL: Failed assertion: __xe_wait_ufence(fd, &exec_sync[i], 0xdeadbeefdeadbeefull, exec_queues[i % n_exec_queues], &timeout) == 0
(xe_exec_fault_mode:5047) CRITICAL: Last errno: 62, Timer expired
(xe_exec_fault_mode:5047) CRITICAL: error: -62 != 0
Stack trace:
  #0 ../lib/igt_core.c:2266 __igt_fail_assert()
  #1 ../tests/intel/xe_exec_fault_mode.c:346 test_exec()
  #2 ../tests/intel/xe_exec_fault_mode.c:537 __igt_unique____real_main407()
  #3 ../tests/intel/xe_exec_fault_mode.c:407 main()
  #4 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
  #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
  #6 [_start+0x2e]
Subtest scratch-fault failed.

v2: Refine commit message (Thomas)

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 813d893d9b63..c0372f083d42 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1752,6 +1752,11 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, args->extensions))
 		return -EINVAL;
 
+	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
+			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
+			 !(NEEDS_SCRATCH(xe))))
+		return -EINVAL;
+
 	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
 		args->flags |= DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
 
@@ -1765,10 +1770,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
-			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
-		return -EINVAL;
-
 	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
 			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
 		return -EINVAL;
-- 
2.26.3

