Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7B4C02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 22:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EF710E98F;
	Thu,  6 Feb 2025 22:55:12 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0C810E98F;
 Thu,  6 Feb 2025 22:55:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe=3A_Introduced_needs=5Fscratch_bit_in_device_descript?=
 =?utf-8?q?or?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Feb 2025 22:55:10 -0000
Message-ID: <173888251075.2291008.16587466813802117379@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250206213850.36712-1-oak.zeng@intel.com>
In-Reply-To: <20250206213850.36712-1-oak.zeng@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [1/3] drm/xe: Introduced needs_scratch bit in device descriptor
URL   : https://patchwork.freedesktop.org/series/144448/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fd374c12257d456d4917dafb5efe0be9239151a2
Author: Oak Zeng <oak.zeng@intel.com>
Date:   Thu Feb 6 16:38:50 2025 -0500

    drm/xe: Allow scratch page under fault mode for certain platform
    
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
+ /mt/dim checkpatch f2401c718ce075408a723b147cac70aad2a8246f drm-intel
6f45cf218640 drm/xe: Introduced needs_scratch bit in device descriptor
3ba519878d43 drm/xe: Clear scratch page on vm_bind
fd374c12257d drm/xe: Allow scratch page under fault mode for certain platform
-:34: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#34: 
root@DUT1130BMGFRD:/home/szeng/dii-tools/igt-public/build/tests# ./xe_exec_fault_mode --run-subtest scratch-fault

total: 0 errors, 1 warnings, 0 checks, 9 lines checked


