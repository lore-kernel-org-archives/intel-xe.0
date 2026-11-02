Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82826606A329
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 18:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4838D10F134;
	Mon,  2 Nov 2026 18:20:16 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB15D10F134;
 Mon,  2 Nov 2026 18:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_series_starting_with_=5B1/1=5D?=
 =?utf-8?q?_drm/xe/pcode=3A_Fix_pcode=5Ftry=5Frequest_polling_delays?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Nov 2026 18:20:14 -0000
Message-ID: <179364361469.106055.10448047167898137416@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102174608.1279278-2-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20261102174608.1279278-2-alan.previn.teres.alexis@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: series starting with [1/1] drm/xe/pcode: Fix pcode_try_request polling delays
URL   : https://patchwork.freedesktop.org/series/177492/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[18:19:01] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:19:07] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[18:19:27] Starting KUnit Kernel (1/1)...
[18:19:27] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[18:19:27] ================= gpu_buddy (14 subtests) ==================
[18:19:27] [PASSED] gpu_test_buddy_alloc_limit
[18:19:27] [PASSED] gpu_test_buddy_alloc_optimistic
[18:19:27] [PASSED] gpu_test_buddy_alloc_pessimistic
[18:19:27] [PASSED] gpu_test_buddy_alloc_pathological
[18:19:27] [PASSED] gpu_test_buddy_alloc_contiguous
[18:19:27] [PASSED] gpu_test_buddy_alloc_clear
[18:19:27] [PASSED] gpu_test_buddy_alloc_range
[18:19:28] [PASSED] gpu_test_buddy_alloc_range_bias
[18:19:29] [PASSED] gpu_test_buddy_fragmentation_performance
[18:19:29] [PASSED] gpu_test_buddy_dirty_tracker_performance
[18:19:29] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[18:19:29] [PASSED] gpu_test_buddy_offset_aligned_allocation
[18:19:29] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[18:19:29] [PASSED] gpu_test_buddy_addr_to_block
[18:19:29] ==================== [PASSED] gpu_buddy ====================
[18:19:29] ============================================================
[18:19:29] Testing complete. Ran 14 tests: passed: 14
[18:19:29] Elapsed time: 28.058s total, 5.172s configuring, 20.818s building, 2.034s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../include/linux/nodemask.h:92,
                 from ../include/linux/numa.h:6,
                 from ../include/linux/cpumask.h:15,
                 from ../include/linux/smp.h:13,
                 from ../include/linux/interrupt_rc.h:18,
                 from ../include/linux/spinlock.h:60,
                 from ../include/linux/sched.h:38,
                 from ../include/linux/delay.h:13,
                 from ../drivers/gpu/drm/xe/xe_pcode.c:8:
../drivers/gpu/drm/xe/xe_pcode.c: In function ‘pcode_try_request’:
../drivers/gpu/drm/xe/xe_pcode.c:171:71: error: expected ‘)’ before ‘;’ token
  171 |                         wait = min_t(int, wait, (MAX_UDELAY_MS * 1000);
      |                                                                       ^
../include/linux/minmax.h:86:38: note: in definition of macro ‘__cmp_once_unique’
   86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
      |                                      ^
../include/linux/minmax.h:161:27: note: in expansion of macro ‘__cmp_once’
  161 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
      |                           ^~~~~~~~~~
../drivers/gpu/drm/xe/xe_pcode.c:171:32: note: in expansion of macro ‘min_t’
  171 |                         wait = min_t(int, wait, (MAX_UDELAY_MS * 1000);
      |                                ^~~~~
../include/linux/minmax.h:86:37: note: to match this ‘(’
   86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
      |                                     ^
../include/linux/minmax.h:89:9: note: in expansion of macro ‘__cmp_once_unique’
   89 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
      |         ^~~~~~~~~~~~~~~~~
../include/linux/minmax.h:161:27: note: in expansion of macro ‘__cmp_once’
  161 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
      |                           ^~~~~~~~~~
../drivers/gpu/drm/xe/xe_pcode.c:171:32: note: in expansion of macro ‘min_t’
  171 |                         wait = min_t(int, wait, (MAX_UDELAY_MS * 1000);
      |                                ^~~~~
make[7]: *** [../scripts/Makefile.build:290: drivers/gpu/drm/xe/xe_pcode.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:572: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:572: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:572: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:572: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:2244: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[18:19:30] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:19:32] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


