Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EF3C982D2
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 00:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52E110E7A1;
	Fri, 18 Sep 2026 00:58:43 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC5F10E7A0;
 Fri, 18 Sep 2026 00:58:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Use_SIG=5FID_logs_for_GuC_comp?=
 =?utf-8?q?onent_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Sep 2026 00:58:42 -0000
Message-ID: <178969312251.177999.3266670319964218281@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260917235923.1521112-9-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20260917235923.1521112-9-umesh.nerlige.ramappa@intel.com>
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

Series: Use SIG_ID logs for GuC component (rev3)
URL   : https://patchwork.freedesktop.org/series/173177/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[00:57:41] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:57:46] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[00:58:06] Starting KUnit Kernel (1/1)...
[00:58:06] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[00:58:06] ============= refcount_interrupt (4 subtests) ==============
[00:58:06] [PASSED] test_single_irq_change
[00:58:06] [PASSED] test_nested_irq_change
[00:58:06] [PASSED] test_multiple_irq_change
[00:58:06] [PASSED] test_irq_save
[00:58:06] =============== [PASSED] refcount_interrupt ================
[00:58:06] ================= gpu_buddy (14 subtests) ==================
[00:58:06] [PASSED] gpu_test_buddy_alloc_limit
[00:58:06] [PASSED] gpu_test_buddy_alloc_optimistic
[00:58:06] [PASSED] gpu_test_buddy_alloc_pessimistic
[00:58:06] [PASSED] gpu_test_buddy_alloc_pathological
[00:58:06] [PASSED] gpu_test_buddy_alloc_contiguous
[00:58:06] [PASSED] gpu_test_buddy_alloc_clear
[00:58:06] [PASSED] gpu_test_buddy_alloc_range
[00:58:07] [PASSED] gpu_test_buddy_alloc_range_bias
[00:58:08] [PASSED] gpu_test_buddy_fragmentation_performance
[00:58:08] [PASSED] gpu_test_buddy_dirty_tracker_performance
[00:58:08] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[00:58:08] [PASSED] gpu_test_buddy_offset_aligned_allocation
[00:58:08] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[00:58:08] [PASSED] gpu_test_buddy_addr_to_block
[00:58:08] ==================== [PASSED] gpu_buddy ====================
[00:58:08] ============================================================
[00:58:08] Testing complete. Ran 18 tests: passed: 18
[00:58:08] Elapsed time: 26.713s total, 4.453s configuring, 20.342s building, 1.868s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[00:58:08] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:58:10] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
ERROR:root:../drivers/gpu/drm/xe/xe_guc_ct.c: In function ‘__xe_guc_ct_start’:
../drivers/gpu/drm/xe/xe_guc_ct.c:129:41: error: implicit declaration of function ‘ct_dead_capture’ [-Werror=implicit-function-declaration]
  129 | #define CT_DEAD(ct, ctb, reason_code)   ct_dead_capture((ct), (ctb), ct_id(reason_code))
      |                                         ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:742:9: note: in expansion of macro ‘CT_DEAD’
  742 |         CT_DEAD(ct, NULL, SETUP);
      |         ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:128:29: error: ‘CT_DEAD_SETUP’ undeclared (first use in this function)
  128 | #define ct_id(reason_code)  CT_DEAD_##reason_code
      |                             ^~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:129:70: note: in expansion of macro ‘ct_id’
  129 | #define CT_DEAD(ct, ctb, reason_code)   ct_dead_capture((ct), (ctb), ct_id(reason_code))
      |                                                                      ^~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:742:9: note: in expansion of macro ‘CT_DEAD’
  742 |         CT_DEAD(ct, NULL, SETUP);
      |         ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:128:29: note: each undeclared identifier is reported only once for each function it appears in
  128 | #define ct_id(reason_code)  CT_DEAD_##reason_code
      |                             ^~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:129:70: note: in expansion of macro ‘ct_id’
  129 | #define CT_DEAD(ct, ctb, reason_code)   ct_dead_capture((ct), (ctb), ct_id(reason_code))
      |                                                                      ^~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:742:9: note: in expansion of macro ‘CT_DEAD’
  742 |         CT_DEAD(ct, NULL, SETUP);
      |         ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c: In function ‘h2g_has_room’:
../drivers/gpu/drm/xe/xe_guc_ct.c:128:29: error: ‘CT_DEAD_H2G_HAS_ROOM’ undeclared (first use in this function)
  128 | #define ct_id(reason_code)  CT_DEAD_##reason_code
      |                             ^~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:129:70: note: in expansion of macro ‘ct_id’
  129 | #define CT_DEAD(ct, ctb, reason_code)   ct_dead_capture((ct), (ctb), ct_id(reason_code))
      |                                                                      ^~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:868:25: note: in expansion of macro ‘CT_DEAD’
  868 |                         CT_DEAD(ct, h2g, H2G_HAS_ROOM);
      |                         ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c: In function ‘__g2h_release_space’:
../drivers/gpu/drm/xe/xe_guc_ct.c:128:29: error: ‘CT_DEAD_G2H_RELEASE’ undeclared (first use in this function)
  128 | #define ct_id(reason_code)  CT_DEAD_##reason_code
      |                             ^~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:129:70: note: in expansion of macro ‘ct_id’
  129 | #define CT_DEAD(ct, ctb, reason_code)   ct_dead_capture((ct), (ctb), ct_id(reason_code))
      |                                                                      ^~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:943:17: note: in expansion of macro ‘CT_DEAD’
  943 |                 CT_DEAD(ct, &ct->ctbs.g2h, G2H_RELEASE);
      |                 ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c: In function ‘h2g_write’:
../drivers/gpu/drm/xe/xe_guc_ct.c:128:29: error: ‘CT_DEAD_H2G_WRITE’ undeclared (first use in this function)
  128 | #define ct_id(reason_code)  CT_DEAD_##reason_code
      |                             ^~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:1042:65: note: in expansion of macro ‘ct_id’
 1042 |                         return ct_corrupted(ct,  &ct->ctbs.h2g, ct_id(H2G_WRITE),
      |                                                                 ^~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c: In function ‘guc_ct_send_locked’:
../drivers/gpu/drm/xe/xe_guc_ct.c:128:29: error: ‘CT_DEAD_DEADLOCK’ undeclared (first use in this function)
  128 | #define ct_id(reason_code)  CT_DEAD_##reason_code
      |                             ^~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:129:70: note: in expansion of macro ‘ct_id’
  129 | #define CT_DEAD(ct, ctb, reason_code)   ct_dead_capture((ct), (ctb), ct_id(reason_code))
      |                                                                      ^~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:1297:9: note: in expansion of macro ‘CT_DEAD’
 1297 |         CT_DEAD(ct, &ct->ctbs.h2g, DEADLOCK);
      |         ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c: In function ‘guc_handle_crash_dump_msg’:
../drivers/gpu/drm/xe/xe_guc_ct.c:128:29: error: ‘CT_DEAD_CRASH’ undeclared (first use in this function)
  128 | #define ct_id(reason_code)  CT_DEAD_##reason_code
      |                             ^~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:129:70: note: in expansion of macro ‘ct_id’
  129 | #define CT_DEAD(ct, ctb, reason_code)   ct_dead_capture((ct), (ctb), ct_id(reason_code))
      |                                                                      ^~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:1632:9: note: in expansion of macro ‘CT_DEAD’
 1632 |         CT_DEAD(ct, NULL, CRASH);
      |         ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c: In function ‘guc_handle_exception_msg’:
../drivers/gpu/drm/xe/xe_guc_ct.c:128:29: error: ‘CT_DEAD_CRASH’ undeclared (first use in this function)
  128 | #define ct_id(reason_code)  CT_DEAD_##reason_code
      |                             ^~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:129:70: note: in expansion of macro ‘ct_id’
  129 | #define CT_DEAD(ct, ctb, reason_code)   ct_dead_capture((ct), (ctb), ct_id(reason_code))
      |                                                                      ^~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:1641:9: note: in expansion of macro ‘CT_DEAD’
 1641 |         CT_DEAD(ct, NULL, CRASH);
      |         ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c: In function ‘parse_g2h_response’:
../drivers/gpu/drm/xe/xe_guc_ct.c:128:29: error: ‘CT_DEAD_PARSE_G2H_RESPONSE’ undeclared (first use in this function)
  128 | #define ct_id(reason_code)  CT_DEAD_##reason_code
      |                             ^~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:129:70: note: in expansion of macro ‘ct_id’
  129 | #define CT_DEAD(ct, ctb, reason_code)   ct_dead_capture((ct), (ctb), ct_id(reason_code))
      |                                                                      ^~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:1684:17: note: in expansion of macro ‘CT_DEAD’
 1684 |                 CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
      |                 ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c: In function ‘parse_g2h_msg’:
../drivers/gpu/drm/xe/xe_guc_ct.c:128:29: error: ‘CT_DEAD_PARSE_G2H_ORIGIN’ undeclared (first use in this function)
  128 | #define ct_id(reason_code)  CT_DEAD_##reason_code
      |                             ^~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:129:70: note: in expansion of macro ‘ct_id’
  129 | #define CT_DEAD(ct, ctb, reason_code)   ct_dead_capture((ct), (ctb), ct_id(reason_code))
      |                                                                      ^~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:1753:17: note: in expansion of macro ‘CT_DEAD’
 1753 |                 CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_ORIGIN);
      |                 ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:128:29: error: ‘CT_DEAD_PARSE_G2H_TYPE’ undeclared (first use in this function)
  128 | #define ct_id(reason_code)  CT_DEAD_##reason_code
      |                             ^~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:129:70: note: in expansion of macro ‘ct_id’
  129 | #define CT_DEAD(ct, ctb, reason_code)   ct_dead_capture((ct), (ctb), ct_id(reason_code))
      |                                                                      ^~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:1771:17: note: in expansion of macro ‘CT_DEAD’
 1771 |                 CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_TYPE);
      |                 ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c: In function ‘process_g2h_msg’:
../drivers/gpu/drm/xe/xe_guc_ct.c:128:29: error: ‘CT_DEAD_PROCESS_FAILED’ undeclared (first use in this function)
  128 | #define ct_id(reason_code)  CT_DEAD_##reason_code
      |                             ^~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:129:70: note: in expansion of macro ‘ct_id’
  129 | #define CT_DEAD(ct, ctb, reason_code)   ct_dead_capture((ct), (ctb), ct_id(reason_code))
      |                                                                      ^~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:1872:17: note: in expansion of macro ‘CT_DEAD’
 1872 |                 CT_DEAD(ct, NULL, PROCESS_FAILED);
      |                 ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c: In function ‘g2h_read’:
../drivers/gpu/drm/xe/xe_guc_ct.c:128:29: error: ‘CT_DEAD_G2H_READ’ undeclared (first use in this function)
  128 | #define ct_id(reason_code)  CT_DEAD_##reason_code
      |                             ^~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:1919:65: note: in expansion of macro ‘ct_id’
 1919 |                         return ct_corrupted(ct,  &ct->ctbs.g2h, ct_id(G2H_READ),
      |                                                                 ^~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c: In function ‘g2h_fast_path’:
../drivers/gpu/drm/xe/xe_guc_ct.c:128:29: error: ‘CT_DEAD_FAST_G2H’ undeclared (first use in this function)
  128 | #define ct_id(reason_code)  CT_DEAD_##reason_code
      |                             ^~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:129:70: note: in expansion of macro ‘ct_id’
  129 | #define CT_DEAD(ct, ctb, reason_code)   ct_dead_capture((ct), (ctb), ct_id(reason_code))
      |                                                                      ^~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:2055:17: note: in expansion of macro ‘CT_DEAD’
 2055 |                 CT_DEAD(ct, NULL, FAST_G2H);
      |                 ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c: In function ‘receive_g2h’:
../drivers/gpu/drm/xe/xe_guc_ct.c:128:29: error: ‘CT_DEAD_G2H_RECV’ undeclared (first use in this function)
  128 | #define ct_id(reason_code)  CT_DEAD_##reason_code
      |                             ^~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:129:70: note: in expansion of macro ‘ct_id’
  129 | #define CT_DEAD(ct, ctb, reason_code)   ct_dead_capture((ct), (ctb), ct_id(reason_code))
      |                                                                      ^~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:2174:25: note: in expansion of macro ‘CT_DEAD’
 2174 |                         CT_DEAD(ct, NULL, G2H_RECV);
      |                         ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c: At top level:
../drivers/gpu/drm/xe/xe_guc_ct.c:2468:13: warning: conflicting types for ‘ct_dead_capture’; have ‘void(struct xe_guc_ct *, struct guc_ctb *, u32)’ {aka ‘void(struct xe_guc_ct *, struct guc_ctb *, unsigned int)’}
 2468 | static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
      |             ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:2468:13: error: static declaration of ‘ct_dead_capture’ follows non-static declaration
../drivers/gpu/drm/xe/xe_guc_ct.c:129:41: note: previous implicit declaration of ‘ct_dead_capture’ with type ‘void(struct xe_guc_ct *, struct guc_ctb *, u32)’ {aka ‘void(struct xe_guc_ct *, struct guc_ctb *, unsigned int)’}
  129 | #define CT_DEAD(ct, ctb, reason_code)   ct_dead_capture((ct), (ctb), ct_id(reason_code))
      |                                         ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:742:9: note: in expansion of macro ‘CT_DEAD’
  742 |         CT_DEAD(ct, NULL, SETUP);
      |         ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_ct.c:2468:13: warning: ‘ct_dead_capture’ defined but not used [-Wunused-function]
 2468 | static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
      |             ^~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:290: drivers/gpu/drm/xe/xe_guc_ct.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:551: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:551: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:551: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:551: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:2229: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


