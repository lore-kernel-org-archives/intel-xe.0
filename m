Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171DDC79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 14:10:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5D610E164;
	Wed,  9 Sep 2026 14:10:56 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909E710E1F1;
 Wed,  9 Sep 2026 14:10:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Access_counter_squash?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Sep 2026 14:10:55 -0000
Message-ID: <178896305558.143074.15619304086736802897@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260909140650.1639482-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260909140650.1639482-2-himal.prasad.ghimiray@intel.com>
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

Series: Access counter squash
URL   : https://patchwork.freedesktop.org/series/173728/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[14:10:00] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:10:04] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[14:10:24] Starting KUnit Kernel (1/1)...
[14:10:24] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[14:10:24] ============= refcount_interrupt (4 subtests) ==============
[14:10:24] [PASSED] test_single_irq_change
[14:10:24] [PASSED] test_nested_irq_change
[14:10:24] [PASSED] test_multiple_irq_change
[14:10:24] [PASSED] test_irq_save
[14:10:24] =============== [PASSED] refcount_interrupt ================
[14:10:24] ================= gpu_buddy (14 subtests) ==================
[14:10:24] [PASSED] gpu_test_buddy_alloc_limit
[14:10:24] [PASSED] gpu_test_buddy_alloc_optimistic
[14:10:24] [PASSED] gpu_test_buddy_alloc_pessimistic
[14:10:24] [PASSED] gpu_test_buddy_alloc_pathological
[14:10:24] [PASSED] gpu_test_buddy_alloc_contiguous
[14:10:24] [PASSED] gpu_test_buddy_alloc_clear
[14:10:24] [PASSED] gpu_test_buddy_alloc_range
[14:10:25] [PASSED] gpu_test_buddy_alloc_range_bias
[14:10:25] [PASSED] gpu_test_buddy_fragmentation_performance
[14:10:26] [PASSED] gpu_test_buddy_dirty_tracker_performance
[14:10:26] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[14:10:26] [PASSED] gpu_test_buddy_offset_aligned_allocation
[14:10:26] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[14:10:26] [PASSED] gpu_test_buddy_addr_to_block
[14:10:26] ==================== [PASSED] gpu_buddy ====================
[14:10:26] ============================================================
[14:10:26] Testing complete. Ran 18 tests: passed: 18
[14:10:26] Elapsed time: 26.232s total, 4.401s configuring, 19.913s building, 1.863s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_access_counter.c: In function ‘xe_access_counter_service’:
../drivers/gpu/drm/xe/xe_access_counter.c:217:25: error: implicit declaration of function ‘xe_svm_range_find_first’; did you mean ‘xe_svm_range_find_or_insert’? [-Werror=implicit-function-declaration]
  217 |                 range = xe_svm_range_find_first(vm, hint_va, min(xe_vma_end(vma), gran_end));
      |                         ^~~~~~~~~~~~~~~~~~~~~~~
      |                         xe_svm_range_find_or_insert
../drivers/gpu/drm/xe/xe_access_counter.c:217:23: warning: assignment to ‘struct xe_svm_range *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
  217 |                 range = xe_svm_range_find_first(vm, hint_va, min(xe_vma_end(vma), gran_end));
      |                       ^
../drivers/gpu/drm/xe/xe_access_counter.c:223:23: error: implicit declaration of function ‘xe_svm_range_setup’; did you mean ‘xe_svm_range_debug’? [-Werror=implicit-function-declaration]
  223 |                 err = xe_svm_range_setup(vm, vma, NULL, gt, xe_svm_range_start(range),
      |                       ^~~~~~~~~~~~~~~~~~
      |                       xe_svm_range_debug
../drivers/gpu/drm/xe/xe_access_counter.c:225:50: error: ‘struct xe_svm_range_setup_flags’ has no member named ‘atomic’
  225 |                                                 .atomic = false,
      |                                                  ^~~~~~
../drivers/gpu/drm/xe/xe_access_counter.c:225:59: warning: excess elements in struct initializer
  225 |                                                 .atomic = false,
      |                                                           ^~~~~
../drivers/gpu/drm/xe/xe_access_counter.c:225:59: note: (near initialization for ‘(anonymous)’)
../drivers/gpu/drm/xe/xe_access_counter.c:226:50: error: ‘struct xe_svm_range_setup_flags’ has no member named ‘acc_ctr_trigger’
  226 |                                                 .acc_ctr_trigger = true,
      |                                                  ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_access_counter.c:226:68: warning: excess elements in struct initializer
  226 |                                                 .acc_ctr_trigger = true,
      |                                                                    ^~~~
../drivers/gpu/drm/xe/xe_access_counter.c:226:68: note: (near initialization for ‘(anonymous)’)
../drivers/gpu/drm/xe/xe_access_counter.c:224:76: error: invalid use of undefined type ‘struct xe_svm_range_setup_flags’
  224 |                                          (struct xe_svm_range_setup_flags) {
      |                                                                            ^
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:290: drivers/gpu/drm/xe/xe_access_counter.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:551: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:551: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:551: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:551: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:2229: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[14:10:26] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:10:28] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


