Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCEEC52D7C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 16:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E761910E9A7;
	Fri,  9 Aug 2024 16:58:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C9310E9A7;
 Fri,  9 Aug 2024 16:58:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_PF=3A_Improve_VF_control?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Aug 2024 16:58:42 -0000
Message-ID: <172322272203.552689.750776306009628217@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240809165159.662-1-michal.wajdeczko@intel.com>
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

Series: PF: Improve VF control
URL   : https://patchwork.freedesktop.org/series/137095/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
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
In file included from ../include/kunit/static_stub.h:18,
                 from ../drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c:7:
../drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c: In function ‘pf_control_test_init’:
../drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c:52:30: error: implicit declaration of function ‘__pf_peek_vf_state’; did you mean ‘pf_peek_vf_state’? [-Werror=implicit-function-declaration]
   52 |  KUNIT_ASSERT_EQ(test, 0ul, *__pf_peek_vf_state(gt, VFUT1));
      |                              ^~~~~~~~~~~~~~~~~~
../include/kunit/test.h:725:15: note: in definition of macro ‘KUNIT_BASE_BINARY_ASSERTION’
  725 |  const typeof(right) __right = (right);           \
      |               ^~~~~
../include/kunit/test.h:1299:2: note: in expansion of macro ‘KUNIT_BINARY_INT_ASSERTION’
 1299 |  KUNIT_BINARY_INT_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1296:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ_MSG’
 1296 |  KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
      |  ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c:52:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ’
   52 |  KUNIT_ASSERT_EQ(test, 0ul, *__pf_peek_vf_state(gt, VFUT1));
      |  ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c:52:29: error: invalid type argument of unary ‘*’ (have ‘int’)
   52 |  KUNIT_ASSERT_EQ(test, 0ul, *__pf_peek_vf_state(gt, VFUT1));
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:725:15: note: in definition of macro ‘KUNIT_BASE_BINARY_ASSERTION’
  725 |  const typeof(right) __right = (right);           \
      |               ^~~~~
../include/kunit/test.h:1299:2: note: in expansion of macro ‘KUNIT_BINARY_INT_ASSERTION’
 1299 |  KUNIT_BINARY_INT_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1296:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ_MSG’
 1296 |  KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
      |  ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c:52:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ’
   52 |  KUNIT_ASSERT_EQ(test, 0ul, *__pf_peek_vf_state(gt, VFUT1));
      |  ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c:52:29: error: invalid type argument of unary ‘*’ (have ‘int’)
   52 |  KUNIT_ASSERT_EQ(test, 0ul, *__pf_peek_vf_state(gt, VFUT1));
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:725:33: note: in definition of macro ‘KUNIT_BASE_BINARY_ASSERTION’
  725 |  const typeof(right) __right = (right);           \
      |                                 ^~~~~
../include/kunit/test.h:1299:2: note: in expansion of macro ‘KUNIT_BINARY_INT_ASSERTION’
 1299 |  KUNIT_BINARY_INT_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1296:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ_MSG’
 1296 |  KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
      |  ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c:52:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ’
   52 |  KUNIT_ASSERT_EQ(test, 0ul, *__pf_peek_vf_state(gt, VFUT1));
      |  ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c:53:29: error: invalid type argument of unary ‘*’ (have ‘int’)
   53 |  KUNIT_ASSERT_EQ(test, 0ul, *__pf_peek_vf_state(gt, VFUT2));
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:725:15: note: in definition of macro ‘KUNIT_BASE_BINARY_ASSERTION’
  725 |  const typeof(right) __right = (right);           \
      |               ^~~~~
../include/kunit/test.h:1299:2: note: in expansion of macro ‘KUNIT_BINARY_INT_ASSERTION’
 1299 |  KUNIT_BINARY_INT_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1296:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ_MSG’
 1296 |  KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
      |  ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c:53:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ’
   53 |  KUNIT_ASSERT_EQ(test, 0ul, *__pf_peek_vf_state(gt, VFUT2));
      |  ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c:53:29: error: invalid type argument of unary ‘*’ (have ‘int’)
   53 |  KUNIT_ASSERT_EQ(test, 0ul, *__pf_peek_vf_state(gt, VFUT2));
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:725:33: note: in definition of macro ‘KUNIT_BASE_BINARY_ASSERTION’
  725 |  const typeof(right) __right = (right);           \
      |                                 ^~~~~
../include/kunit/test.h:1299:2: note: in expansion of macro ‘KUNIT_BINARY_INT_ASSERTION’
 1299 |  KUNIT_BINARY_INT_ASSERTION(test,           \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
../include/kunit/test.h:1296:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ_MSG’
 1296 |  KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
      |  ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c:53:2: note: in expansion of macro ‘KUNIT_ASSERT_EQ’
   53 |  KUNIT_ASSERT_EQ(test, 0ul, *__pf_peek_vf_state(gt, VFUT2));
      |  ^~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/xe/xe_gt_sriov_pf_control.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:485: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:485: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:485: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:485: drivers] Error 2
make[2]: *** [/kernel/Makefile:1925: .] Error 2
make[1]: *** [/kernel/Makefile:224: __sub-make] Error 2
make: *** [Makefile:224: __sub-make] Error 2

[16:58:13] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:58:17] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


