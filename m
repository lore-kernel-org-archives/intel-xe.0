Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F89606A31B
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 04:21:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C9E10E26B;
	Wed, 21 Oct 2026 04:21:51 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B10310E26B;
 Wed, 21 Oct 2026 04:21:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_ATS/PASID_SVA_support_and_PRI-?=
 =?utf-8?q?less_fault_servicing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Oct 2026 04:21:50 -0000
Message-ID: <179255651004.49260.3146581060600797941@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
In-Reply-To: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
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

Series: ATS/PASID SVA support and PRI-less fault servicing
URL   : https://patchwork.freedesktop.org/series/176519/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[04:20:43] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:20:47] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[04:21:08] Starting KUnit Kernel (1/1)...
[04:21:08] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[04:21:08] ================= gpu_buddy (14 subtests) ==================
[04:21:08] [PASSED] gpu_test_buddy_alloc_limit
[04:21:08] [PASSED] gpu_test_buddy_alloc_optimistic
[04:21:08] [PASSED] gpu_test_buddy_alloc_pessimistic
[04:21:08] [PASSED] gpu_test_buddy_alloc_pathological
[04:21:08] [PASSED] gpu_test_buddy_alloc_contiguous
[04:21:08] [PASSED] gpu_test_buddy_alloc_clear
[04:21:08] [PASSED] gpu_test_buddy_alloc_range
[04:21:09] [PASSED] gpu_test_buddy_alloc_range_bias
[04:21:10] [PASSED] gpu_test_buddy_fragmentation_performance
[04:21:10] [PASSED] gpu_test_buddy_dirty_tracker_performance
[04:21:10] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[04:21:10] [PASSED] gpu_test_buddy_offset_aligned_allocation
[04:21:10] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[04:21:10] [PASSED] gpu_test_buddy_addr_to_block
[04:21:10] ==================== [PASSED] gpu_buddy ====================
[04:21:10] ============================================================
[04:21:10] Testing complete. Ran 14 tests: passed: 14
[04:21:10] Elapsed time: 27.450s total, 4.472s configuring, 20.860s building, 2.054s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_pci.c: In function ‘__xe_pci_probe’:
../drivers/gpu/drm/xe/xe_pci.c:1288:19: error: ‘struct pci_dev’ has no member named ‘pasid_cap’; did you mean ‘pcie_cap’?
 1288 |         if (pdev->pasid_cap)
      |                   ^~~~~~~~~
      |                   pcie_cap
make[7]: *** [../scripts/Makefile.build:290: drivers/gpu/drm/xe/xe_pci.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:551: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:551: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:551: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:551: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:2229: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[04:21:10] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:21:12] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


