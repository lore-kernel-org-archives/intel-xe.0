Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D886FE65D25
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 04:14:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29A110EABE;
	Fri, 22 Nov 2024 04:14:15 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853E010EAC0;
 Fri, 22 Nov 2024 04:14:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe=3A_Add_devcoredump_lock?=
 =?utf-8?q?ing_and_reason_string_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 Nov 2024 04:14:14 -0000
Message-ID: <173224885456.1542974.11622970842426794594@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241122025357.1398385-1-John.C.Harrison@Intel.com>
In-Reply-To: <20241122025357.1398385-1-John.C.Harrison@Intel.com>
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

Series: drm/xe: Add devcoredump locking and reason string (rev3)
URL   : https://patchwork.freedesktop.org/series/141628/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../include/linux/bitops.h:7,
                 from ../include/linux/thread_info.h:27,
                 from ../include/asm-generic/current.h:6,
                 from ./arch/um/include/generated/asm/current.h:1,
                 from ../include/linux/mutex.h:14,
                 from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:10,
                 from ../drivers/gpu/drm/xe/xe_devcoredump.c:7:
../drivers/gpu/drm/xe/xe_devcoredump.c: In function ‘xe_devcoredump_init’:
../drivers/gpu/drm/xe/xe_devcoredump.c:370:44: error: invalid type argument of ‘->’ (have ‘struct xe_devcoredump’)
  370 |                 might_lock(&xe->devcoredump->lock);
      |                                            ^~
../include/linux/typecheck.h:11:16: note: in definition of macro ‘typecheck’
   11 |         typeof(x) __dummy2; \
      |                ^
../drivers/gpu/drm/xe/xe_devcoredump.c:370:17: note: in expansion of macro ‘might_lock’
  370 |                 might_lock(&xe->devcoredump->lock);
      |                 ^~~~~~~~~~
../include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
   12 |         (void)(&__dummy == &__dummy2); \
      |                         ^~
../include/linux/lockdep.h:551:9: note: in expansion of macro ‘typecheck’
  551 |         typecheck(struct lockdep_map *, &(lock)->dep_map);              \
      |         ^~~~~~~~~
../drivers/gpu/drm/xe/xe_devcoredump.c:370:17: note: in expansion of macro ‘might_lock’
  370 |                 might_lock(&xe->devcoredump->lock);
      |                 ^~~~~~~~~~
In file included from ../include/linux/mutex.h:17:
../drivers/gpu/drm/xe/xe_devcoredump.c:370:44: error: invalid type argument of ‘->’ (have ‘struct xe_devcoredump’)
  370 |                 might_lock(&xe->devcoredump->lock);
      |                                            ^~
../include/linux/lockdep.h:552:24: note: in definition of macro ‘might_lock’
  552 |         lock_acquire(&(lock)->dep_map, 0, 0, 0, 1, NULL, _THIS_IP_);    \
      |                        ^~~~
../drivers/gpu/drm/xe/xe_devcoredump.c:370:44: error: invalid type argument of ‘->’ (have ‘struct xe_devcoredump’)
  370 |                 might_lock(&xe->devcoredump->lock);
      |                                            ^~
../include/linux/lockdep.h:553:24: note: in definition of macro ‘might_lock’
  553 |         lock_release(&(lock)->dep_map, _THIS_IP_);                      \
      |                        ^~~~
make[7]: *** [../scripts/Makefile.build:229: drivers/gpu/drm/xe/xe_devcoredump.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:478: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:478: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:478: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:478: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
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
make[2]: *** [/kernel/Makefile:1936: .] Error 2
make[1]: *** [/kernel/Makefile:224: __sub-make] Error 2
make: *** [Makefile:224: __sub-make] Error 2

[04:13:46] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:13:51] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


