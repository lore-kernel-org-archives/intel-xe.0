Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC4FC3600C
	for <intel-xe@archiver.kernel.org>; Fri,  4 Apr 2025 03:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F22F10E090;
	Fri,  4 Apr 2025 03:32:37 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE4D10E090;
 Fri,  4 Apr 2025 03:32:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Large_devcoredump_file_support?=
 =?utf-8?q?_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Apr 2025 03:32:35 -0000
Message-ID: <174373755584.37249.3603726306663056727@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250403202705.18488-1-matthew.brost@intel.com>
In-Reply-To: <20250403202705.18488-1-matthew.brost@intel.com>
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

Series: Large devcoredump file support (rev2)
URL   : https://patchwork.freedesktop.org/series/147085/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[03:32:02] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[03:32:06] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
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
../drivers/gpu/drm/xe/xe_migrate.c: In function ‘xe_migrate_access_memory’:
../drivers/gpu/drm/xe/xe_migrate.c:1819:19: error: ‘XE_CACHELINE_MASK’ undeclared (first use in this function)
 1819 |         if (len & XE_CACHELINE_MASK ||
      |                   ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:1819:19: note: each undeclared identifier is reported only once for each function it appears in
../drivers/gpu/drm/xe/xe_migrate.c:1828:35: error: ‘XE_CACHELINE_BYTES’ undeclared (first use in this function); did you mean ‘L1_CACHE_BYTES’?
 1828 |                         u8 bounce[XE_CACHELINE_BYTES];
      |                                   ^~~~~~~~~~~~~~~~~~
      |                                   L1_CACHE_BYTES
../drivers/gpu/drm/xe/xe_migrate.c:1828:28: warning: unused variable ‘bounce’ [-Wunused-variable]
 1828 |                         u8 bounce[XE_CACHELINE_BYTES];
      |                            ^~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:1888:27: error: implicit declaration of function ‘xe_migrate_vram’; did you mean ‘xe_migrate_to_vram’? [-Werror=implicit-function-declaration]
 1888 |                 __fence = xe_migrate_vram(m, current_bytes,
      |                           ^~~~~~~~~~~~~~~
      |                           xe_migrate_to_vram
../drivers/gpu/drm/xe/xe_migrate.c:1892:43: error: ‘XE_MIGRATE_COPY_TO_VRAM’ undeclared (first use in this function)
 1892 |                                           XE_MIGRATE_COPY_TO_VRAM :
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:1893:43: error: ‘XE_MIGRATE_COPY_TO_SRAM’ undeclared (first use in this function)
 1893 |                                           XE_MIGRATE_COPY_TO_SRAM);
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:207: drivers/gpu/drm/xe/xe_migrate.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:465: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:465: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:465: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:465: drivers] Error 2
make[2]: *** [/kernel/Makefile:1994: .] Error 2
make[1]: *** [/kernel/Makefile:251: __sub-make] Error 2
make: *** [Makefile:251: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


