Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C49C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 15:41:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E922610E216;
	Wed, 30 Jul 2025 15:41:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5495D10E20A;
 Wed, 30 Jul 2025 15:41:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_kunit=3A_Refactor_and_extend_K?=
 =?utf-8?q?Unit=27s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marie Zhussupova" <marievic@google.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Jul 2025 15:41:57 -0000
Message-ID: <175389011734.199826.1812598772666897124@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250729193647.3410634-1-marievic@google.com>
In-Reply-To: <20250729193647.3410634-1-marievic@google.com>
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

Series: kunit: Refactor and extend KUnit's
URL   : https://patchwork.freedesktop.org/series/152290/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../include/drm/drm_kunit_helpers.h:10,
                 from ../drivers/gpu/drm/xe/tests/xe_pci_test.c:7:
../drivers/gpu/drm/xe/tests/xe_pci_test.c:59:45: error: initialization of ‘const void * (*)(struct kunit *, const void *, char *)’ from incompatible pointer type ‘const void * (*)(const void *, char *)’ [-Werror=incompatible-pointer-types]
   59 |         KUNIT_CASE_PARAM(check_graphics_ip, xe_pci_graphics_ip_gen_param),
      |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:215:38: note: in definition of macro ‘KUNIT_CASE_PARAM’
  215 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_pci_test.c:59:45: note: (near initialization for ‘xe_pci_tests[0].generate_params’)
   59 |         KUNIT_CASE_PARAM(check_graphics_ip, xe_pci_graphics_ip_gen_param),
      |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:215:38: note: in definition of macro ‘KUNIT_CASE_PARAM’
  215 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_pci_test.c:60:42: error: initialization of ‘const void * (*)(struct kunit *, const void *, char *)’ from incompatible pointer type ‘const void * (*)(const void *, char *)’ [-Werror=incompatible-pointer-types]
   60 |         KUNIT_CASE_PARAM(check_media_ip, xe_pci_media_ip_gen_param),
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:215:38: note: in definition of macro ‘KUNIT_CASE_PARAM’
  215 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_pci_test.c:60:42: note: (near initialization for ‘xe_pci_tests[1].generate_params’)
   60 |         KUNIT_CASE_PARAM(check_media_ip, xe_pci_media_ip_gen_param),
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:215:38: note: in definition of macro ‘KUNIT_CASE_PARAM’
  215 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_pci_test.c:61:51: error: initialization of ‘const void * (*)(struct kunit *, const void *, char *)’ from incompatible pointer type ‘const void * (*)(const void *, char *)’ [-Werror=incompatible-pointer-types]
   61 |         KUNIT_CASE_PARAM(check_platform_gt_count, xe_pci_id_gen_param),
      |                                                   ^~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:215:38: note: in definition of macro ‘KUNIT_CASE_PARAM’
  215 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_pci_test.c:61:51: note: (near initialization for ‘xe_pci_tests[2].generate_params’)
   61 |         KUNIT_CASE_PARAM(check_platform_gt_count, xe_pci_id_gen_param),
      |                                                   ^~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:215:38: note: in definition of macro ‘KUNIT_CASE_PARAM’
  215 |                   .generate_params = gen_params, .module_name = KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
cc1: some warnings being treated as errors
make[8]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/xe/tests/xe_pci_test.o] Error 1
make[8]: *** Waiting for unfinished jobs....
make[7]: *** [../scripts/Makefile.build:555: drivers/gpu/drm/xe/tests] Error 2
make[6]: *** [../scripts/Makefile.build:555: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:555: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:555: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:555: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:2003: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[15:41:29] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:41:33] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


