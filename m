Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0062CC36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 20:48:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E2810E699;
	Tue,  1 Apr 2025 20:48:35 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A2F10E699;
 Tue,  1 Apr 2025 20:48:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Large_devcoredump_file_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Apr 2025 20:48:33 -0000
Message-ID: <174354051380.24812.12308694975428757480@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250401204351.4130873-1-matthew.brost@intel.com>
In-Reply-To: <20250401204351.4130873-1-matthew.brost@intel.com>
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

Series: Large devcoredump file support
URL   : https://patchwork.freedesktop.org/series/147085/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_migrate.c: In function ‘xe_migrate_access_memory’:
../drivers/gpu/drm/xe/xe_migrate.c:1819:19: error: ‘CACHELINE_MASK’ undeclared (first use in this function)
 1819 |         if (len & CACHELINE_MASK || ((uintptr_t)buf | offset) & CACHELINE_MASK) {
      |                   ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:1819:19: note: each undeclared identifier is reported only once for each function it appears in
../drivers/gpu/drm/xe/xe_migrate.c:1827:35: error: ‘CACHELINE_BYTES’ undeclared (first use in this function)
 1827 |                         u8 bounce[CACHELINE_BYTES];
      |                                   ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:1827:28: warning: unused variable ‘bounce’ [-Wunused-variable]
 1827 |                         u8 bounce[CACHELINE_BYTES];
      |                            ^~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:1886:27: error: implicit declaration of function ‘xe_migrate_vram’; did you mean ‘xe_migrate_to_vram’? [-Werror=implicit-function-declaration]
 1886 |                 __fence = xe_migrate_vram(m, current_bytes,
      |                           ^~~~~~~~~~~~~~~
      |                           xe_migrate_to_vram
../drivers/gpu/drm/xe/xe_migrate.c:1890:43: error: ‘XE_MIGRATE_COPY_TO_VRAM’ undeclared (first use in this function)
 1890 |                                           XE_MIGRATE_COPY_TO_VRAM :
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:1891:43: error: ‘XE_MIGRATE_COPY_TO_SRAM’ undeclared (first use in this function)
 1891 |                                           XE_MIGRATE_COPY_TO_SRAM);
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:207: drivers/gpu/drm/xe/xe_migrate.o] Error 1
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
make[6]: *** [../scripts/Makefile.build:465: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:465: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:465: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:465: drivers] Error 2
make[2]: *** [/kernel/Makefile:1994: .] Error 2
make[1]: *** [/kernel/Makefile:251: __sub-make] Error 2
make: *** [Makefile:251: __sub-make] Error 2

[20:48:05] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:48:09] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


