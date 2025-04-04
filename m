Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C369FC36010
	for <intel-xe@archiver.kernel.org>; Fri,  4 Apr 2025 22:21:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856C510E33E;
	Fri,  4 Apr 2025 22:21:15 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9693410E035;
 Fri,  4 Apr 2025 22:21:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Offload_GGTT_binding_to_migrat?=
 =?utf-8?q?ion_engine=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Apr 2025 22:21:14 -0000
Message-ID: <174380527461.39815.8510217178413971552@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250404205138.620455-1-dev@lankhorst.se>
In-Reply-To: <20250404205138.620455-1-dev@lankhorst.se>
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

Series: Offload GGTT binding to migration engine.
URL   : https://patchwork.freedesktop.org/series/147283/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../include/kunit/static_stub.h:18,
                 from ../drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c:6,
                 from ../drivers/gpu/drm/xe/xe_guc_buf.c:175:
../drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c: In function ‘replacement_xe_managed_bo_create_pin_map’:
../drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c:45:66: error: invalid use of undefined type ‘struct xe_ggtt’
   45 |                                 drm_mm_insert_node_in_range(&ggtt->mm,
      |                                                                  ^~
../include/kunit/test.h:776:22: note: in definition of macro ‘KUNIT_BASE_BINARY_ASSERTION’
  776 |         const typeof(right) __right = (right);                                 \
      |                      ^~~~~
../include/kunit/test.h:1350:9: note: in expansion of macro ‘KUNIT_BINARY_INT_ASSERTION’
 1350 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1347:9: note: in expansion of macro ‘KUNIT_ASSERT_EQ_MSG’
 1347 |         KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
      |         ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c:44:17: note: in expansion of macro ‘KUNIT_ASSERT_EQ’
   44 |                 KUNIT_ASSERT_EQ(test, 0,
      |                 ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c:45:66: error: invalid use of undefined type ‘struct xe_ggtt’
   45 |                                 drm_mm_insert_node_in_range(&ggtt->mm,
      |                                                                  ^~
../include/kunit/test.h:776:40: note: in definition of macro ‘KUNIT_BASE_BINARY_ASSERTION’
  776 |         const typeof(right) __right = (right);                                 \
      |                                        ^~~~~
../include/kunit/test.h:1350:9: note: in expansion of macro ‘KUNIT_BINARY_INT_ASSERTION’
 1350 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1347:9: note: in expansion of macro ‘KUNIT_ASSERT_EQ_MSG’
 1347 |         KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
      |         ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c:44:17: note: in expansion of macro ‘KUNIT_ASSERT_EQ’
   44 |                 KUNIT_ASSERT_EQ(test, 0,
      |                 ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c: In function ‘guc_buf_test_init’:
../drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c:70:26: error: invalid use of undefined type ‘struct xe_ggtt’
   70 |         drm_mm_init(&ggtt->mm, DUT_GGTT_START, DUT_GGTT_SIZE);
      |                          ^~
In file included from ../include/linux/seqlock.h:19,
                 from ../include/linux/mmzone.h:17,
                 from ../include/linux/gfp.h:7,
                 from ../include/drm/drm_managed.h:6,
                 from ../drivers/gpu/drm/xe/xe_guc_buf.c:7:
../drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c:71:25: error: invalid use of undefined type ‘struct xe_ggtt’
   71 |         mutex_init(&ggtt->lock);
      |                         ^~
../include/linux/mutex.h:64:23: note: in definition of macro ‘mutex_init’
   64 |         __mutex_init((mutex), #mutex, &__key);                          \
      |                       ^~~~~
make[7]: *** [../scripts/Makefile.build:207: drivers/gpu/drm/xe/xe_guc_buf.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:465: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
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
make[5]: *** [../scripts/Makefile.build:465: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:465: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:465: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:1994: .] Error 2
make[1]: *** [/kernel/Makefile:251: __sub-make] Error 2
make: *** [Makefile:251: __sub-make] Error 2

[22:20:45] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:20:49] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


