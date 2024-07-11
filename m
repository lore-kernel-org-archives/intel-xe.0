Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7505C3271E
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 06:52:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C2E10E968;
	Thu, 11 Jul 2024 06:52:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446BF10E966;
 Thu, 11 Jul 2024 06:52:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_series_starting_with_=5B1/6=5D?=
 =?utf-8?q?_drm/xe/migrate=3A_Handle_clear_ccs_logic_for_xe2_dgfx?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jul 2024 06:52:19 -0000
Message-ID: <172068073927.124492.14568768818912781872@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1720677099.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1720677099.git.akshata.jahagirdar@intel.com>
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

Series: series starting with [1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
URL   : https://patchwork.freedesktop.org/series/135977/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[06:51:51] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:51:55] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
ERROR:root:In file included from ../drivers/gpu/drm/xe/tests/xe_test.h:13,
                 from ../drivers/gpu/drm/xe/xe_migrate.c:20:
../drivers/gpu/drm/xe/tests/xe_migrate.c: In function ‘test_migrate’:
../drivers/gpu/drm/xe/tests/xe_migrate.c:514:20: warning: format ‘%li’ expects argument of type ‘long int’, but argument 7 has type ‘int’ [-Wformat=]
  514 |   KUNIT_FAIL(test, "Failed to vmap vram bo: %li\n", ret);
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~
      |                                                     |
      |                                                     int
../include/kunit/test.h:608:9: note: in definition of macro ‘_KUNIT_FAILED’
  608 |         fmt,           \
      |         ^~~
../include/kunit/test.h:638:2: note: in expansion of macro ‘KUNIT_FAIL_ASSERTION’
  638 |  KUNIT_FAIL_ASSERTION(test,            \
      |  ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_migrate.c:514:3: note: in expansion of macro ‘KUNIT_FAIL’
  514 |   KUNIT_FAIL(test, "Failed to vmap vram bo: %li\n", ret);
      |   ^~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_migrate.c:1511:
../drivers/gpu/drm/xe/tests/xe_migrate.c:514:47: note: format string is defined here
  514 |   KUNIT_FAIL(test, "Failed to vmap vram bo: %li\n", ret);
      |                                             ~~^
      |                                               |
      |                                               long int
      |                                             %i
In file included from ../drivers/gpu/drm/xe/tests/xe_test.h:13,
                 from ../drivers/gpu/drm/xe/xe_migrate.c:20:
../drivers/gpu/drm/xe/tests/xe_migrate.c:537:20: warning: format ‘%li’ expects argument of type ‘long int’, but argument 7 has type ‘int’ [-Wformat=]
  537 |   KUNIT_FAIL(test, "Failed to validate vram bo for: %li\n", ret);
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~
      |                                                             |
      |                                                             int
../include/kunit/test.h:608:9: note: in definition of macro ‘_KUNIT_FAILED’
  608 |         fmt,           \
      |         ^~~
../include/kunit/test.h:638:2: note: in expansion of macro ‘KUNIT_FAIL_ASSERTION’
  638 |  KUNIT_FAIL_ASSERTION(test,            \
      |  ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_migrate.c:537:3: note: in expansion of macro ‘KUNIT_FAIL’
  537 |   KUNIT_FAIL(test, "Failed to validate vram bo for: %li\n", ret);
      |   ^~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_migrate.c:1511:
../drivers/gpu/drm/xe/tests/xe_migrate.c:537:55: note: format string is defined here
  537 |   KUNIT_FAIL(test, "Failed to validate vram bo for: %li\n", ret);
      |                                                     ~~^
      |                                                       |
      |                                                       long int
      |                                                     %i
In file included from ../drivers/gpu/drm/xe/tests/xe_test.h:13,
                 from ../drivers/gpu/drm/xe/xe_migrate.c:20:
../drivers/gpu/drm/xe/tests/xe_migrate.c:553:20: warning: format ‘%li’ expects argument of type ‘long int’, but argument 7 has type ‘int’ [-Wformat=]
  553 |   KUNIT_FAIL(test, "Failed to vmap vram bo: %li\n", ret);
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~
      |                                                     |
      |                                                     int
../include/kunit/test.h:608:9: note: in definition of macro ‘_KUNIT_FAILED’
  608 |         fmt,           \
      |         ^~~
../include/kunit/test.h:638:2: note: in expansion of macro ‘KUNIT_FAIL_ASSERTION’
  638 |  KUNIT_FAIL_ASSERTION(test,            \
      |  ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_migrate.c:553:3: note: in expansion of macro ‘KUNIT_FAIL’
  553 |   KUNIT_FAIL(test, "Failed to vmap vram bo: %li\n", ret);
      |   ^~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_migrate.c:1511:
../drivers/gpu/drm/xe/tests/xe_migrate.c:553:47: note: format string is defined here
  553 |   KUNIT_FAIL(test, "Failed to vmap vram bo: %li\n", ret);
      |                                             ~~^
      |                                               |
      |                                               long int
      |                                             %i
../drivers/gpu/drm/xe/tests/xe_migrate.c: In function ‘validate_ccs_test_run_tile’:
../drivers/gpu/drm/xe/tests/xe_migrate.c:627:26: error: implicit declaration of function ‘XE_BO_CREATE_VRAM_IF_DGFX’; did you mean ‘XE_BO_FLAG_VRAM_IF_DGFX’? [-Werror=implicit-function-declaration]
  627 |  unsigned int bo_flags = XE_BO_CREATE_VRAM_IF_DGFX(tile);
      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
      |                          XE_BO_FLAG_VRAM_IF_DGFX
../drivers/gpu/drm/xe/tests/xe_migrate.c:631:24: error: ‘XE_BO_CREATE_SYSTEM_BIT’ undeclared (first use in this function)
  631 |    ttm_bo_type_device, XE_BO_CREATE_SYSTEM_BIT | XE_BO_NEEDS_CPU_ACCESS);
      |                        ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_migrate.c:631:24: note: each undeclared identifier is reported only once for each function it appears in
../drivers/gpu/drm/xe/tests/xe_migrate.c:631:50: error: ‘XE_BO_NEEDS_CPU_ACCESS’ undeclared (first use in this function); did you mean ‘XE_BO_FLAG_NEEDS_CPU_ACCESS’?
  631 |    ttm_bo_type_device, XE_BO_CREATE_SYSTEM_BIT | XE_BO_NEEDS_CPU_ACCESS);
      |                                                  ^~~~~~~~~~~~~~~~~~~~~~
      |                                                  XE_BO_FLAG_NEEDS_CPU_ACCESS
In file included from ../drivers/gpu/drm/xe/tests/xe_test.h:13,
                 from ../drivers/gpu/drm/xe/xe_migrate.c:20:
../drivers/gpu/drm/xe/tests/xe_migrate.c:642:20: warning: format ‘%li’ expects argument of type ‘long int’, but argument 7 has type ‘int’ [-Wformat=]
  642 |   KUNIT_FAIL(test, "Failed to validate system bo for: %li\n", ret);
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~
      |                                                               |
      |                                                               int
../include/kunit/test.h:608:9: note: in definition of macro ‘_KUNIT_FAILED’
  608 |         fmt,           \
      |         ^~~
../include/kunit/test.h:638:2: note: in expansion of macro ‘KUNIT_FAIL_ASSERTION’
  638 |  KUNIT_FAIL_ASSERTION(test,            \
      |  ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_migrate.c:642:3: note: in expansion of macro ‘KUNIT_FAIL’
  642 |   KUNIT_FAIL(test, "Failed to validate system bo for: %li\n", ret);
      |   ^~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_migrate.c:1511:
../drivers/gpu/drm/xe/tests/xe_migrate.c:642:57: note: format string is defined here
  642 |   KUNIT_FAIL(test, "Failed to validate system bo for: %li\n", ret);
      |                                                       ~~^
      |                                                         |
      |                                                         long int
      |                                                       %i
In file included from ../drivers/gpu/drm/xe/tests/xe_test.h:13,
                 from ../drivers/gpu/drm/xe/xe_migrate.c:20:
../drivers/gpu/drm/xe/tests/xe_migrate.c:648:20: warning: format ‘%li’ expects argument of type ‘long int’, but argument 7 has type ‘int’ [-Wformat=]
  648 |   KUNIT_FAIL(test, "Failed to vmap system bo: %li\n", ret);
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~
      |                                                       |
      |                                                       int
../include/kunit/test.h:608:9: note: in definition of macro ‘_KUNIT_FAILED’
  608 |         fmt,           \
      |         ^~~
../include/kunit/test.h:638:2: note: in expansion of macro ‘KUNIT_FAIL_ASSERTION’
  638 |  KUNIT_FAIL_ASSERTION(test,            \
      |  ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_migrate.c:648:3: note: in expansion of macro ‘KUNIT_FAIL’
  648 |   KUNIT_FAIL(test, "Failed to vmap system bo: %li\n", ret);
      |   ^~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_migrate.c:1511:
../drivers/gpu/drm/xe/tests/xe_migrate.c:648:49: note: format string is defined here
  648 |   KUNIT_FAIL(test, "Failed to vmap system bo: %li\n", ret);
      |                                               ~~^
      |                                                 |
      |                                                 long int
      |                                               %i
In file included from ../drivers/gpu/drm/xe/tests/xe_test.h:13,
                 from ../drivers/gpu/drm/xe/xe_migrate.c:20:
../drivers/gpu/drm/xe/tests/xe_migrate.c:665:20: warning: format ‘%li’ expects argument of type ‘long int’, but argument 7 has type ‘int’ [-Wformat=]
  665 |   KUNIT_FAIL(test, "Failed to validate system bo for: %li\n", ret);
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~
      |                                                               |
      |                                                               int
../include/kunit/test.h:608:9: note: in definition of macro ‘_KUNIT_FAILED’
  608 |         fmt,           \
      |         ^~~
../include/kunit/test.h:638:2: note: in expansion of macro ‘KUNIT_FAIL_ASSERTION’
  638 |  KUNIT_FAIL_ASSERTION(test,            \
      |  ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_migrate.c:665:3: note: in expansion of macro ‘KUNIT_FAIL’
  665 |   KUNIT_FAIL(test, "Failed to validate system bo for: %li\n", ret);
      |   ^~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_migrate.c:1511:
../drivers/gpu/drm/xe/tests/xe_migrate.c:665:57: note: format string is defined here
  665 |   KUNIT_FAIL(test, "Failed to validate system bo for: %li\n", ret);
      |                                                       ~~^
      |                                                         |
      |                                                         long int
      |                                                       %i
In file included from ../drivers/gpu/drm/xe/tests/xe_test.h:13,
                 from ../drivers/gpu/drm/xe/xe_migrate.c:20:
../drivers/gpu/drm/xe/tests/xe_migrate.c:671:20: warning: format ‘%li’ expects argument of type ‘long int’, but argument 7 has type ‘int’ [-Wformat=]
  671 |   KUNIT_FAIL(test, "Failed to vmap system bo: %li\n", ret);
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~
      |                                                       |
      |                                                       int
../include/kunit/test.h:608:9: note: in definition of macro ‘_KUNIT_FAILED’
  608 |         fmt,           \
      |         ^~~
../include/kunit/test.h:638:2: note: in expansion of macro ‘KUNIT_FAIL_ASSERTION’
  638 |  KUNIT_FAIL_ASSERTION(test,            \
      |  ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_migrate.c:671:3: note: in expansion of macro ‘KUNIT_FAIL’
  671 |   KUNIT_FAIL(test, "Failed to vmap system bo: %li\n", ret);
      |   ^~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_migrate.c:1511:
../drivers/gpu/drm/xe/tests/xe_migrate.c:671:49: note: format string is defined here
  671 |   KUNIT_FAIL(test, "Failed to vmap system bo: %li\n", ret);
      |                                               ~~^
      |                                                 |
      |                                                 long int
      |                                               %i
In file included from ../drivers/gpu/drm/xe/tests/xe_test.h:13,
                 from ../drivers/gpu/drm/xe/xe_migrate.c:20:
../drivers/gpu/drm/xe/tests/xe_migrate.c:687:20: warning: format ‘%li’ expects argument of type ‘long int’, but argument 7 has type ‘int’ [-Wformat=]
  687 |   KUNIT_FAIL(test, "Failed to validate vram bo for: %li\n", ret);
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~
      |                                                             |
      |                                                             int
../include/kunit/test.h:608:9: note: in definition of macro ‘_KUNIT_FAILED’
  608 |         fmt,           \
      |         ^~~
../include/kunit/test.h:638:2: note: in expansion of macro ‘KUNIT_FAIL_ASSERTION’
  638 |  KUNIT_FAIL_ASSERTION(test,            \
      |  ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_migrate.c:687:3: note: in expansion of macro ‘KUNIT_FAIL’
  687 |   KUNIT_FAIL(test, "Failed to validate vram bo for: %li\n", ret);
      |   ^~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_migrate.c:1511:
../drivers/gpu/drm/xe/tests/xe_migrate.c:687:55: note: format string is defined here
  687 |   KUNIT_FAIL(test, "Failed to validate vram bo for: %li\n", ret);
      |                                                     ~~^
      |                                                       |
      |                                                       long int
      |                                                     %i
In file included from ../drivers/gpu/drm/xe/tests/xe_test.h:13,
                 from ../drivers/gpu/drm/xe/xe_migrate.c:20:
../drivers/gpu/drm/xe/tests/xe_migrate.c:693:20: warning: format ‘%li’ expects argument of type ‘long int’, but argument 7 has type ‘int’ [-Wformat=]
  693 |   KUNIT_FAIL(test, "Failed to vmap vram bo: %li\n", ret);
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~
      |                                                     |
      |                                                     int
../include/kunit/test.h:608:9: note: in definition of macro ‘_KUNIT_FAILED’
  608 |         fmt,           \
      |         ^~~
../include/kunit/test.h:638:2: note: in expansion of macro ‘KUNIT_FAIL_ASSERTION’
  638 |  KUNIT_FAIL_ASSERTION(test,            \
      |  ^~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_migrate.c:693:3: note: in expansion of macro ‘KUNIT_FAIL’
  693 |   KUNIT_FAIL(test, "Failed to vmap vram bo: %li\n", ret);
      |   ^~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_migrate.c:1511:
../drivers/gpu/drm/xe/tests/xe_migrate.c:693:47: note: format string is defined here
  693 |   KUNIT_FAIL(test, "Failed to vmap vram bo: %li\n", ret);
      |                                             ~~^
      |                                               |
      |                                               long int
      |                                             %i
../drivers/gpu/drm/xe/tests/xe_migrate.c: In function ‘validate_ccs_test_run_device’:
../drivers/gpu/drm/xe/tests/xe_migrate.c:735:2: error: implicit declaration of function ‘xe_device_mem_access_get’ [-Werror=implicit-function-declaration]
  735 |  xe_device_mem_access_get(xe);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_migrate.c:740:2: error: implicit declaration of function ‘xe_device_mem_access_put’ [-Werror=implicit-function-declaration]
  740 |  xe_device_mem_access_put(xe);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/xe/xe_migrate.o] Error 1
make[7]: *** Waiting for unfinished jobs....
../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
  156 | u64 ioread64_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:163:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
  163 | u64 ioread64_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:170:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
  170 | u64 ioread64be_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:178:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
  178 | u64 ioread64be_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:264:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
  264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:272:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
  272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:280:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
  280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
../lib/iomap.c:288:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
  288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
make[6]: *** [../scripts/Makefile.build:485: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:485: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:485: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:485: drivers] Error 2
make[2]: *** [/kernel/Makefile:1934: .] Error 2
make[1]: *** [/kernel/Makefile:240: __sub-make] Error 2
make: *** [Makefile:240: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


