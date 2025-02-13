Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39F5C021A0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 02:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD1F10E26B;
	Thu, 13 Feb 2025 02:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DueNdA/n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A475B10E1C0
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 02:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412475; x=1770948475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5rtFdP+6S69nNsoLPJUAfPaX+oPu2wK07ua0APGM7qk=;
 b=DueNdA/niHIgzOtdtwPTOdiGgsHdo60T3m4I6xbmyeKuA38+iEGq12B9
 W2Q2TQUyCC8FXAY/OgtSB0RPIl0z0QE9craNcSUTlEd3PA9Ib5biyHfsj
 SSoqCB1fjtUfCGJI7x+Z053zCLRgUNz4ZcvdWQYiEwcCuhUiCjUbBn754
 +E0I5b1+ej3sHKCHb4pfQnvrBKOaf4xE90R4K8Y87WQvjF76M8HHYBnKS
 TX863xhbjvqFQGZXjfEKjJW93CDKZlGscfSWrjlxUA//IO6yiWQV3ZDzW
 DIuATJ6slLLUyXLcKY3piE4WlY3gbvhHIPl1RN2JDTbk1b/e5S14OawS7 g==;
X-CSE-ConnectionGUID: IgoWpdamTmiph8JEdbZt0A==
X-CSE-MsgGUID: z/E8Y34ASWyz5uoAXcPVeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39282508"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="39282508"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:07:54 -0800
X-CSE-ConnectionGUID: le8Uu8HkQvyZEwyk/ePefw==
X-CSE-MsgGUID: FApmmcOwQRC9Hr7jiY4UJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136250855"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:07:54 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com
Subject: [PATCH 3/3] drm/xe: Allow scratch page under fault mode for certain
 platform
Date: Wed, 12 Feb 2025 21:23:31 -0500
Message-Id: <20250213022331.265424-3-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250213022331.265424-1-oak.zeng@intel.com>
References: <20250213022331.265424-1-oak.zeng@intel.com>
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

v3: Move the scratch page flag check to after scratch page wa (Thomas)

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 813d893d9b63..c2dfd0ade403 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1766,7 +1766,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
-			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
+			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
+			 !(NEEDS_SCRATCH(xe))))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
-- 
2.26.3

