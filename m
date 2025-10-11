Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360A7CCD184
	for <intel-xe@archiver.kernel.org>; Sat, 11 Oct 2025 19:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3F110E321;
	Sat, 11 Oct 2025 19:49:21 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C7A10E321;
 Sat, 11 Oct 2025 19:49:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_vfio/xe=3A_Add_driver_variant_?=
 =?utf-8?q?for_Xe_VF_migration?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 11 Oct 2025 19:49:21 -0000
Message-ID: <176021216126.2413.15631127483964442009@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
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

Series: vfio/xe: Add driver variant for Xe VF migration
URL   : https://patchwork.freedesktop.org/series/155785/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_guc_buf.c:180:
../drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c: In function ‘guc_buf_test_init’:
../drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c:75:73: error: macro "KUNIT_ASSERT_EQ" passed 4 arguments, but takes just 3
   75 |         KUNIT_ASSERT_EQ(test, 0, xe_guc_buf_cache_init(&guc->buf), SZ_8K);
      |                                                                         ^
In file included from ../include/kunit/static_stub.h:18,
                 from ../drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c:6:
../include/kunit/test.h:1358: note: macro "KUNIT_ASSERT_EQ" defined here
 1358 | #define KUNIT_ASSERT_EQ(test, left, right) \
      | 
../drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c:75:9: error: ‘KUNIT_ASSERT_EQ’ undeclared (first use in this function); did you mean ‘KUNIT_ASSERTION’?
   75 |         KUNIT_ASSERT_EQ(test, 0, xe_guc_buf_cache_init(&guc->buf), SZ_8K);
      |         ^~~~~~~~~~~~~~~
      |         KUNIT_ASSERTION
../drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c:75:9: note: each undeclared identifier is reported only once for each function it appears in
make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/xe/xe_guc_buf.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:556: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:556: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:556: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:556: drivers] Error 2
make[2]: *** [/kernel/Makefile:2011: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[19:48:47] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:48:51] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


