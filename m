Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9ED5D3E783
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 02:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807AC10E657;
	Wed,  6 Nov 2024 02:22:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A072C10E657;
 Wed,  6 Nov 2024 02:22:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_series_starting_with_=5B1/2=5D?=
 =?utf-8?q?_drm/xe=3A_improve_hibernation_on_igpu?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Nov 2024 02:22:09 -0000
Message-ID: <173085972965.1414592.4266794925559912964@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241106021725.4156175-1-matthew.brost@intel.com>
In-Reply-To: <20241106021725.4156175-1-matthew.brost@intel.com>
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

Series: series starting with [1/2] drm/xe: improve hibernation on igpu
URL   : https://patchwork.freedesktop.org/series/140973/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[02:21:41] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:21:46] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_map.h:11,
                 from ../drivers/gpu/drm/xe/xe_vm.h:12,
                 from ../drivers/gpu/drm/xe/xe_bo.h:14,
                 from ../drivers/gpu/drm/xe/xe_bo_evict.c:8:
../drivers/gpu/drm/xe/xe_bo_evict.c: In function ‘xe_bo_restore_kernel’:
../drivers/gpu/drm/xe/xe_bo_evict.c:126:33: error: ‘id’ undeclared (first use in this function); did you mean ‘ida’?
  126 |         for_each_tile(tile, xe, id)
      |                                 ^~
../drivers/gpu/drm/xe/xe_bo_evict.c:126:9: note: in expansion of macro ‘for_each_tile’
  126 |         for_each_tile(tile, xe, id)
      |         ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bo_evict.c:126:33: note: each undeclared identifier is reported only once for each function it appears in
  126 |         for_each_tile(tile, xe, id)
      |                                 ^~
../drivers/gpu/drm/xe/xe_bo_evict.c:126:9: note: in expansion of macro ‘for_each_tile’
  126 |         for_each_tile(tile, xe, id)
      |         ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device.h:9:
../drivers/gpu/drm/xe/xe_bo_evict.c:126:23: error: ‘tile’ undeclared (first use in this function); did you mean ‘file’?
  126 |         for_each_tile(tile, xe, id)
      |                       ^~~~
../include/drm/drm_util.h:63:38: note: in definition of macro ‘for_each_if’
   63 | #define for_each_if(condition) if (!(condition)) {} else
      |                                      ^~~~~~~~~
../drivers/gpu/drm/xe/xe_bo_evict.c:126:9: note: in expansion of macro ‘for_each_tile’
  126 |         for_each_tile(tile, xe, id)
      |         ^~~~~~~~~~~~~
make[7]: *** [../scripts/Makefile.build:229: drivers/gpu/drm/xe/xe_bo_evict.o] Error 1
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

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


