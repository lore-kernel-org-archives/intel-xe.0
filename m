Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED67C79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 10:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE2810E26A;
	Thu, 10 Sep 2026 10:28:00 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC50C10E26A;
 Thu, 10 Sep 2026 10:27:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Access_counter_squash_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Sep 2026 10:27:59 -0000
Message-ID: <178903607983.146758.4383433034818243@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260910102400.1652246-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260910102400.1652246-2-himal.prasad.ghimiray@intel.com>
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

Series: Access counter squash (rev2)
URL   : https://patchwork.freedesktop.org/series/173728/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[10:26:59] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:27:03] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[10:27:23] Starting KUnit Kernel (1/1)...
[10:27:23] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[10:27:24] ============= refcount_interrupt (4 subtests) ==============
[10:27:24] [PASSED] test_single_irq_change
[10:27:24] [PASSED] test_nested_irq_change
[10:27:24] [PASSED] test_multiple_irq_change
[10:27:24] [PASSED] test_irq_save
[10:27:24] =============== [PASSED] refcount_interrupt ================
[10:27:24] ================= gpu_buddy (14 subtests) ==================
[10:27:24] [PASSED] gpu_test_buddy_alloc_limit
[10:27:24] [PASSED] gpu_test_buddy_alloc_optimistic
[10:27:24] [PASSED] gpu_test_buddy_alloc_pessimistic
[10:27:24] [PASSED] gpu_test_buddy_alloc_pathological
[10:27:24] [PASSED] gpu_test_buddy_alloc_contiguous
[10:27:24] [PASSED] gpu_test_buddy_alloc_clear
[10:27:24] [PASSED] gpu_test_buddy_alloc_range
[10:27:24] [PASSED] gpu_test_buddy_alloc_range_bias
[10:27:25] [PASSED] gpu_test_buddy_fragmentation_performance
[10:27:25] [PASSED] gpu_test_buddy_dirty_tracker_performance
[10:27:25] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[10:27:25] [PASSED] gpu_test_buddy_offset_aligned_allocation
[10:27:25] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[10:27:25] [PASSED] gpu_test_buddy_addr_to_block
[10:27:25] ==================== [PASSED] gpu_buddy ====================
[10:27:25] ============================================================
[10:27:25] Testing complete. Ran 18 tests: passed: 18
[10:27:25] Elapsed time: 26.710s total, 4.424s configuring, 20.368s building, 1.871s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from <command-line>:
../drivers/gpu/drm/xe/xe_pt.c: In function ‘xe_pt_stage_bind’:
../drivers/gpu/drm/xe/xe_pt.c:883:60: error: ‘struct <anonymous>’ has no member named ‘flags’
  883 |                 range_flags.__flags = READ_ONCE(range->base.flags.__flags);
      |                                                            ^
./../include/linux/compiler_types.h:682:23: note: in definition of macro ‘__compiletime_assert’
  682 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
./../include/linux/compiler_types.h:702:9: note: in expansion of macro ‘_compiletime_assert’
  702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:9: note: in expansion of macro ‘compiletime_assert’
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:28: note: in expansion of macro ‘__native_word’
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
../include/asm-generic/rwonce.h:49:9: note: in expansion of macro ‘compiletime_assert_rwonce_type’
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pt.c:883:39: note: in expansion of macro ‘READ_ONCE’
  883 |                 range_flags.__flags = READ_ONCE(range->base.flags.__flags);
      |                                       ^~~~~~~~~
../drivers/gpu/drm/xe/xe_pt.c:883:60: error: ‘struct <anonymous>’ has no member named ‘flags’
  883 |                 range_flags.__flags = READ_ONCE(range->base.flags.__flags);
      |                                                            ^
./../include/linux/compiler_types.h:682:23: note: in definition of macro ‘__compiletime_assert’
  682 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
./../include/linux/compiler_types.h:702:9: note: in expansion of macro ‘_compiletime_assert’
  702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:9: note: in expansion of macro ‘compiletime_assert’
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:28: note: in expansion of macro ‘__native_word’
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
../include/asm-generic/rwonce.h:49:9: note: in expansion of macro ‘compiletime_assert_rwonce_type’
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pt.c:883:39: note: in expansion of macro ‘READ_ONCE’
  883 |                 range_flags.__flags = READ_ONCE(range->base.flags.__flags);
      |                                       ^~~~~~~~~
../drivers/gpu/drm/xe/xe_pt.c:883:60: error: ‘struct <anonymous>’ has no member named ‘flags’
  883 |                 range_flags.__flags = READ_ONCE(range->base.flags.__flags);
      |                                                            ^
./../include/linux/compiler_types.h:682:23: note: in definition of macro ‘__compiletime_assert’
  682 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
./../include/linux/compiler_types.h:702:9: note: in expansion of macro ‘_compiletime_assert’
  702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:9: note: in expansion of macro ‘compiletime_assert’
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:28: note: in expansion of macro ‘__native_word’
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
../include/asm-generic/rwonce.h:49:9: note: in expansion of macro ‘compiletime_assert_rwonce_type’
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pt.c:883:39: note: in expansion of macro ‘READ_ONCE’
  883 |                 range_flags.__flags = READ_ONCE(range->base.flags.__flags);
      |                                       ^~~~~~~~~
../drivers/gpu/drm/xe/xe_pt.c:883:60: error: ‘struct <anonymous>’ has no member named ‘flags’
  883 |                 range_flags.__flags = READ_ONCE(range->base.flags.__flags);
      |                                                            ^
./../include/linux/compiler_types.h:682:23: note: in definition of macro ‘__compiletime_assert’
  682 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
./../include/linux/compiler_types.h:702:9: note: in expansion of macro ‘_compiletime_assert’
  702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:9: note: in expansion of macro ‘compiletime_assert’
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:28: note: in expansion of macro ‘__native_word’
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |                            ^~~~~~~~~~~~~
../include/asm-generic/rwonce.h:49:9: note: in expansion of macro ‘compiletime_assert_rwonce_type’
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pt.c:883:39: note: in expansion of macro ‘READ_ONCE’
  883 |                 range_flags.__flags = READ_ONCE(range->base.flags.__flags);
      |                                       ^~~~~~~~~
../drivers/gpu/drm/xe/xe_pt.c:883:60: error: ‘struct <anonymous>’ has no member named ‘flags’
  883 |                 range_flags.__flags = READ_ONCE(range->base.flags.__flags);
      |                                                            ^
./../include/linux/compiler_types.h:682:23: note: in definition of macro ‘__compiletime_assert’
  682 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
./../include/linux/compiler_types.h:702:9: note: in expansion of macro ‘_compiletime_assert’
  702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:36:9: note: in expansion of macro ‘compiletime_assert’
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
      |         ^~~~~~~~~~~~~~~~~~
../include/asm-generic/rwonce.h:49:9: note: in expansion of macro ‘compiletime_assert_rwonce_type’
   49 |         compiletime_assert_rwonce_type(x);                              \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pt.c:883:39: note: in expansion of macro ‘READ_ONCE’
  883 |                 range_flags.__flags = READ_ONCE(range->base.flags.__flags);
      |                                       ^~~~~~~~~
../drivers/gpu/drm/xe/xe_pt.c:883:60: error: ‘struct <anonymous>’ has no member named ‘flags’
  883 |                 range_flags.__flags = READ_ONCE(range->base.flags.__flags);
      |                                                            ^
./../include/linux/compiler_types.h:626:27: note: in definition of macro ‘__unqual_scalar_typeof’
  626 |                 _Generic((x),                                           \
      |                           ^
../include/asm-generic/rwonce.h:50:9: note: in expansion of macro ‘__READ_ONCE’
   50 |         __READ_ONCE(x);                                                 \
      |         ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pt.c:883:39: note: in expansion of macro ‘READ_ONCE’
  883 |                 range_flags.__flags = READ_ONCE(range->base.flags.__flags);
      |                                       ^~~~~~~~~
In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                 from ../include/linux/compiler.h:369,
                 from ../include/linux/export.h:5,
                 from ../include/linux/linkage.h:7,
                 from ../include/linux/preempt.h:10,
                 from ../include/linux/spinlock.h:56,
                 from ../include/linux/kref.h:16,
                 from ../drivers/gpu/drm/xe/xe_page_reclaim.h:9,
                 from ../drivers/gpu/drm/xe/xe_pt_types.h:11,
                 from ../drivers/gpu/drm/xe/xe_pt.h:10,
                 from ../drivers/gpu/drm/xe/xe_pt.c:6:
../drivers/gpu/drm/xe/xe_pt.c:883:60: error: ‘struct <anonymous>’ has no member named ‘flags’
  883 |                 range_flags.__flags = READ_ONCE(range->base.flags.__flags);
      |                                                            ^
../include/asm-generic/rwonce.h:44:73: note: in definition of macro ‘__READ_ONCE’
   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
      |                                                                         ^
../drivers/gpu/drm/xe/xe_pt.c:883:39: note: in expansion of macro ‘READ_ONCE’
  883 |                 range_flags.__flags = READ_ONCE(range->base.flags.__flags);
      |                                       ^~~~~~~~~
make[7]: *** [../scripts/Makefile.build:290: drivers/gpu/drm/xe/xe_pt.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:551: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:551: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:551: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:551: drivers] Error 2
make[2]: *** [/kernel/Makefile:2229: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[10:27:25] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:27:27] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


