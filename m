Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17A4606A326
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 17:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE95710EC21;
	Tue, 20 Oct 2026 17:03:53 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD9210EC21;
 Tue, 20 Oct 2026 17:03:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe=3A_Tie_BO_TTM_LRU_prior?=
 =?utf-8?q?ity_to_DONTNEED/WILLNEED_madvise_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Oct 2026 17:03:52 -0000
Message-ID: <179251583219.47616.7534796526224178707@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261020165137.765886-1-matthew.brost@intel.com>
In-Reply-To: <20261020165137.765886-1-matthew.brost@intel.com>
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

Series: drm/xe: Tie BO TTM LRU priority to DONTNEED/WILLNEED madvise state
URL   : https://patchwork.freedesktop.org/series/176498/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[17:02:46] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:02:50] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[17:03:11] Starting KUnit Kernel (1/1)...
[17:03:11] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[17:03:11] ================= gpu_buddy (14 subtests) ==================
[17:03:11] [PASSED] gpu_test_buddy_alloc_limit
[17:03:11] [PASSED] gpu_test_buddy_alloc_optimistic
[17:03:11] [PASSED] gpu_test_buddy_alloc_pessimistic
[17:03:11] [PASSED] gpu_test_buddy_alloc_pathological
[17:03:11] [PASSED] gpu_test_buddy_alloc_contiguous
[17:03:11] [PASSED] gpu_test_buddy_alloc_clear
[17:03:11] [PASSED] gpu_test_buddy_alloc_range
[17:03:11] [PASSED] gpu_test_buddy_alloc_range_bias
[17:03:12] [PASSED] gpu_test_buddy_fragmentation_performance
[17:03:13] [PASSED] gpu_test_buddy_dirty_tracker_performance
[17:03:13] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[17:03:13] [PASSED] gpu_test_buddy_offset_aligned_allocation
[17:03:13] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[17:03:13] [PASSED] gpu_test_buddy_addr_to_block
[17:03:13] ==================== [PASSED] gpu_buddy ====================
[17:03:13] ============================================================
[17:03:13] Testing complete. Ran 14 tests: passed: 14
[17:03:13] Elapsed time: 27.120s total, 4.475s configuring, 20.777s building, 1.826s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_bo.c:568:13: error: redefinition of ‘xe_ttm_bo_is_imported’
  568 | static bool xe_ttm_bo_is_imported(struct ttm_buffer_object *tbo)
      |             ^~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bo.c:474:13: note: previous definition of ‘xe_ttm_bo_is_imported’ with type ‘bool(struct ttm_buffer_object *)’ {aka ‘_Bool(struct ttm_buffer_object *)’}
  474 | static bool xe_ttm_bo_is_imported(struct ttm_buffer_object *tbo)
      |             ^~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bo.c:593:13: error: redefinition of ‘xe_bo_account_pin’
  593 | static void xe_bo_account_pin(struct xe_bo *bo)
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bo.c:499:13: note: previous definition of ‘xe_bo_account_pin’ with type ‘void(struct xe_bo *)’
  499 | static void xe_bo_account_pin(struct xe_bo *bo)
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bo.c:617:13: error: redefinition of ‘xe_bo_account_unpin’
  617 | static void xe_bo_account_unpin(struct xe_bo *bo)
      |             ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bo.c:523:13: note: previous definition of ‘xe_bo_account_unpin’ with type ‘void(struct xe_bo *)’
  523 | static void xe_bo_account_unpin(struct xe_bo *bo)
      |             ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bo.c:642:6: error: redefinition of ‘xe_bo_pin_account’
  642 | void xe_bo_pin_account(struct xe_bo *bo)
      |      ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bo.c:548:6: note: previous definition of ‘xe_bo_pin_account’ with type ‘void(struct xe_bo *)’
  548 | void xe_bo_pin_account(struct xe_bo *bo)
      |      ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bo.c:656:6: error: redefinition of ‘xe_bo_unpin_account’
  656 | void xe_bo_unpin_account(struct xe_bo *bo)
      |      ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bo.c:562:6: note: previous definition of ‘xe_bo_unpin_account’ with type ‘void(struct xe_bo *)’
  562 | void xe_bo_unpin_account(struct xe_bo *bo)
      |      ^~~~~~~~~~~~~~~~~~~
make[7]: *** [../scripts/Makefile.build:290: drivers/gpu/drm/xe/xe_bo.o] Error 1
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

[17:03:13] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:03:15] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


