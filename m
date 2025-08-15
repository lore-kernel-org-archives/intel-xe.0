Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1259BCA0ED1
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 10:53:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB04410E257;
	Fri, 15 Aug 2025 10:53:17 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B56510E257;
 Fri, 15 Aug 2025 10:53:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_kunit=3A_Refactor_and_extend_K?=
 =?utf-8?q?Unit=27s_parameterized_testing_framework_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marie Zhussupova" <marievic@google.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 15 Aug 2025 10:53:16 -0000
Message-ID: <175525519630.240037.10704673787319753800@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250815103604.3857930-1-marievic@google.com>
In-Reply-To: <20250815103604.3857930-1-marievic@google.com>
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

Series: kunit: Refactor and extend KUnit's parameterized testing framework (rev2)
URL   : https://patchwork.freedesktop.org/series/152794/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[10:52:48] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:52:52] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
ERROR:root:In file included from ../include/drm/drm_kunit_helpers.h:10,
                 from ../drivers/gpu/drm/xe/tests/xe_pci_test.c:7:
../drivers/gpu/drm/xe/tests/xe_pci_test.c:59:45: error: initialization of ‘const void * (*)(struct kunit *, const void *, char *)’ from incompatible pointer type ‘const void * (*)(const void *, char *)’ [-Werror=incompatible-pointer-types]
   59 |         KUNIT_CASE_PARAM(check_graphics_ip, xe_pci_graphics_ip_gen_param),
      |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:210:38: note: in definition of macro ‘KUNIT_CASE_PARAM’
  210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_pci_test.c:59:45: note: (near initialization for ‘xe_pci_tests[0].generate_params’)
   59 |         KUNIT_CASE_PARAM(check_graphics_ip, xe_pci_graphics_ip_gen_param),
      |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:210:38: note: in definition of macro ‘KUNIT_CASE_PARAM’
  210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_pci_test.c:60:42: error: initialization of ‘const void * (*)(struct kunit *, const void *, char *)’ from incompatible pointer type ‘const void * (*)(const void *, char *)’ [-Werror=incompatible-pointer-types]
   60 |         KUNIT_CASE_PARAM(check_media_ip, xe_pci_media_ip_gen_param),
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:210:38: note: in definition of macro ‘KUNIT_CASE_PARAM’
  210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_pci_test.c:60:42: note: (near initialization for ‘xe_pci_tests[1].generate_params’)
   60 |         KUNIT_CASE_PARAM(check_media_ip, xe_pci_media_ip_gen_param),
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:210:38: note: in definition of macro ‘KUNIT_CASE_PARAM’
  210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_pci_test.c:61:51: error: initialization of ‘const void * (*)(struct kunit *, const void *, char *)’ from incompatible pointer type ‘const void * (*)(const void *, char *)’ [-Werror=incompatible-pointer-types]
   61 |         KUNIT_CASE_PARAM(check_platform_gt_count, xe_pci_id_gen_param),
      |                                                   ^~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:210:38: note: in definition of macro ‘KUNIT_CASE_PARAM’
  210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_pci_test.c:61:51: note: (near initialization for ‘xe_pci_tests[2].generate_params’)
   61 |         KUNIT_CASE_PARAM(check_platform_gt_count, xe_pci_id_gen_param),
      |                                                   ^~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:210:38: note: in definition of macro ‘KUNIT_CASE_PARAM’
  210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
cc1: some warnings being treated as errors
make[8]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/xe/tests/xe_pci_test.o] Error 1
make[8]: *** Waiting for unfinished jobs....
In file included from ../include/kunit/static_stub.h:18,
                 from ../drivers/gpu/drm/xe/xe_bo.c:20:
../drivers/gpu/drm/xe/tests/xe_bo.c:610:48: error: initialization of ‘const void * (*)(struct kunit *, const void *, char *)’ from incompatible pointer type ‘const void * (*)(const void *, char *)’ [-Werror=incompatible-pointer-types]
  610 |         KUNIT_CASE_PARAM(xe_ccs_migrate_kunit, xe_pci_live_device_gen_param),
      |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:210:38: note: in definition of macro ‘KUNIT_CASE_PARAM’
  210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_bo.c:610:48: note: (near initialization for ‘xe_bo_tests[0].generate_params’)
  610 |         KUNIT_CASE_PARAM(xe_ccs_migrate_kunit, xe_pci_live_device_gen_param),
      |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:210:38: note: in definition of macro ‘KUNIT_CASE_PARAM’
  210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_bo.c:611:45: error: initialization of ‘const void * (*)(struct kunit *, const void *, char *)’ from incompatible pointer type ‘const void * (*)(const void *, char *)’ [-Werror=incompatible-pointer-types]
  611 |         KUNIT_CASE_PARAM(xe_bo_evict_kunit, xe_pci_live_device_gen_param),
      |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:210:38: note: in definition of macro ‘KUNIT_CASE_PARAM’
  210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_bo.c:611:45: note: (near initialization for ‘xe_bo_tests[1].generate_params’)
  611 |         KUNIT_CASE_PARAM(xe_bo_evict_kunit, xe_pci_live_device_gen_param),
      |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:210:38: note: in definition of macro ‘KUNIT_CASE_PARAM’
  210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_bo.c:624:51: error: initialization of ‘const void * (*)(struct kunit *, const void *, char *)’ from incompatible pointer type ‘const void * (*)(const void *, char *)’ [-Werror=incompatible-pointer-types]
  624 |         KUNIT_CASE_PARAM_ATTR(xe_bo_shrink_kunit, xe_pci_live_device_gen_param,
      |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:223:38: note: in definition of macro ‘KUNIT_CASE_PARAM_ATTR’
  223 |                   .generate_params = gen_params,                                \
      |                                      ^~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_bo.c:624:51: note: (near initialization for ‘xe_bo_shrink_test[0].generate_params’)
  624 |         KUNIT_CASE_PARAM_ATTR(xe_bo_shrink_kunit, xe_pci_live_device_gen_param,
      |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:223:38: note: in definition of macro ‘KUNIT_CASE_PARAM_ATTR’
  223 |                   .generate_params = gen_params,                                \
      |                                      ^~~~~~~~~~
make[7]: *** [../scripts/Makefile.build:556: drivers/gpu/drm/xe/tests] Error 2
make[7]: *** Waiting for unfinished jobs....
In file included from ../drivers/gpu/drm/xe/xe_dma_buf.c:8:
../drivers/gpu/drm/xe/tests/xe_dma_buf.c:285:44: error: initialization of ‘const void * (*)(struct kunit *, const void *, char *)’ from incompatible pointer type ‘const void * (*)(const void *, char *)’ [-Werror=incompatible-pointer-types]
  285 |         KUNIT_CASE_PARAM(xe_dma_buf_kunit, xe_pci_live_device_gen_param),
      |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:210:38: note: in definition of macro ‘KUNIT_CASE_PARAM’
  210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_dma_buf.c:285:44: note: (near initialization for ‘xe_dma_buf_tests[0].generate_params’)
  285 |         KUNIT_CASE_PARAM(xe_dma_buf_kunit, xe_pci_live_device_gen_param),
      |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:210:38: note: in definition of macro ‘KUNIT_CASE_PARAM’
  210 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/xe/xe_dma_buf.o] Error 1
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/xe/xe_bo.o] Error 1
make[6]: *** [../scripts/Makefile.build:556: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:556: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:556: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:556: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:2011: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


