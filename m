Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF476606A31C
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 06:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9746810E17F;
	Sat, 28 Nov 2026 06:14:32 +0000 (UTC)
Received: from 8b00d9f022d5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B21F10E17F;
 Sat, 28 Nov 2026 06:14:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/hwmon=3A_Add_fan_contro?=
 =?utf-8?q?l_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 28 Nov 2026 06:14:31 -0000
Message-ID: <179584647110.3608.2913294678397398985@8b00d9f022d5>
X-Patchwork-Hint: ignore
References: <20261128055923.3316956-1-karthik.poosa@intel.com>
In-Reply-To: <20261128055923.3316956-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Add fan control support (rev2)
URL   : https://patchwork.freedesktop.org/series/179435/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[06:13:18] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:13:23] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[06:13:44] Starting KUnit Kernel (1/1)...
[06:13:44] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[06:13:44] ================= gpu_buddy (15 subtests) ==================
[06:13:44] [PASSED] gpu_test_buddy_alloc_limit
[06:13:44] [PASSED] gpu_test_buddy_alloc_optimistic
[06:13:44] [PASSED] gpu_test_buddy_alloc_pessimistic
[06:13:44] [PASSED] gpu_test_buddy_alloc_pathological
[06:13:44] [PASSED] gpu_test_buddy_alloc_contiguous
[06:13:44] [PASSED] gpu_test_buddy_alloc_clear
[06:13:44] [PASSED] gpu_test_buddy_alloc_range
[06:13:44] [PASSED] gpu_test_buddy_alloc_range_bias
[06:13:44] [PASSED] gpu_test_buddy_alloc_range_clear_guard
[06:13:45] [PASSED] gpu_test_buddy_fragmentation_performance
[06:13:46] [PASSED] gpu_test_buddy_dirty_tracker_performance
[06:13:46] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[06:13:46] [PASSED] gpu_test_buddy_offset_aligned_allocation
[06:13:46] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[06:13:46] [PASSED] gpu_test_buddy_addr_to_block
[06:13:46] ==================== [PASSED] gpu_buddy ====================
[06:13:46] ============================================================
[06:13:46] Testing complete. Ran 15 tests: passed: 15
[06:13:46] Elapsed time: 27.769s total, 5.110s configuring, 20.641s building, 1.985s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_hwmon.c:3096:6: error: redefinition of ‘xe_hwmon_unregister’
 3096 | void xe_hwmon_unregister(struct xe_device *xe)
      |      ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hwmon.c:3070:6: note: previous definition of ‘xe_hwmon_unregister’ with type ‘void(struct xe_device *)’
 3070 | void xe_hwmon_unregister(struct xe_device *xe)
      |      ^~~~~~~~~~~~~~~~~~~
make[7]: *** [../scripts/Makefile.build:290: drivers/gpu/drm/xe/xe_hwmon.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:572: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:572: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:572: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:572: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:2244: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[06:13:46] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:13:48] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


