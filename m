Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C64C021A0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 03:37:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1AA10E272;
	Thu, 13 Feb 2025 03:37:10 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18E510E272;
 Thu, 13 Feb 2025 03:37:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Introduce_GPU_SVM_and_Xe_SVM_i?=
 =?utf-8?q?mplementation_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Feb 2025 03:37:08 -0000
Message-ID: <173941782871.1519959.15601941493742725551@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250213021112.1228481-1-matthew.brost@intel.com>
In-Reply-To: <20250213021112.1228481-1-matthew.brost@intel.com>
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

Series: Introduce GPU SVM and Xe SVM implementation (rev5)
URL   : https://patchwork.freedesktop.org/series/137870/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../mm/memremap.c: In function ‘memremap_compat_align’:
../mm/memremap.c:37:16: error: ‘SUBSECTION_SIZE’ undeclared (first use in this function); did you mean ‘SECTOR_SIZE’?
   37 |         return SUBSECTION_SIZE;
      |                ^~~~~~~~~~~~~~~
      |                SECTOR_SIZE
../mm/memremap.c:37:16: note: each undeclared identifier is reported only once for each function it appears in
../mm/memremap.c: In function ‘pageunmap_range’:
../mm/memremap.c:121:9: error: implicit declaration of function ‘remove_pfn_range_from_zone’ [-Werror=implicit-function-declaration]
  121 |         remove_pfn_range_from_zone(page_zone(first_page), PHYS_PFN(range->start),
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
../mm/memremap.c:124:17: error: implicit declaration of function ‘__remove_pages’; did you mean ‘__free_pages’? [-Werror=implicit-function-declaration]
  124 |                 __remove_pages(PHYS_PFN(range->start),
      |                 ^~~~~~~~~~~~~~
      |                 __free_pages
../mm/memremap.c:127:17: error: implicit declaration of function ‘arch_remove_memory’; did you mean ‘remove_memory’? [-Werror=implicit-function-declaration]
  127 |                 arch_remove_memory(range->start, range_len(range),
      |                 ^~~~~~~~~~~~~~~~~~
      |                 remove_memory
../mm/memremap.c: At top level:
../mm/memremap.c:170:60: warning: ‘struct mhp_params’ declared inside parameter list will not be visible outside of this definition or declaration
  170 | static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
      |                                                            ^~~~~~~~~~
../mm/memremap.c: In function ‘pagemap_range’:
../mm/memremap.c:214:46: error: invalid use of undefined type ‘struct mhp_params’
  214 |         error = track_pfn_remap(NULL, &params->pgprot, PHYS_PFN(range->start), 0,
      |                                              ^~
../mm/memremap.c:219:14: error: implicit declaration of function ‘mhp_range_allowed’ [-Werror=implicit-function-declaration]
  219 |         if (!mhp_range_allowed(range->start, range_len(range), !is_private)) {
      |              ^~~~~~~~~~~~~~~~~
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
../mm/memremap.c:238:25: error: implicit declaration of function ‘add_pages’; did you mean ‘dir_pages’? [-Werror=implicit-function-declaration]
  238 |                 error = add_pages(nid, PHYS_PFN(range->start),
      |                         ^~~~~~~~~
      |                         dir_pages
../mm/memremap.c:247:25: error: implicit declaration of function ‘arch_add_memory’ [-Werror=implicit-function-declaration]
  247 |                 error = arch_add_memory(nid, range->start, range_len(range),
      |                         ^~~~~~~~~~~~~~~
../mm/memremap.c:255:17: error: implicit declaration of function ‘move_pfn_range_to_zone’ [-Werror=implicit-function-declaration]
  255 |                 move_pfn_range_to_zone(zone, PHYS_PFN(range->start),
      |                 ^~~~~~~~~~~~~~~~~~~~~~
../mm/memremap.c:256:67: error: invalid use of undefined type ‘struct mhp_params’
  256 |                                 PHYS_PFN(range_len(range)), params->altmap,
      |                                                                   ^~
../mm/memremap.c: In function ‘memremap_pages’:
../mm/memremap.c:294:16: error: variable ‘params’ has initializer but incomplete type
  294 |         struct mhp_params params = {
      |                ^~~~~~~~~~
../mm/memremap.c:295:18: error: ‘struct mhp_params’ has no member named ‘altmap’
  295 |                 .altmap = pgmap_altmap(pgmap),
      |                  ^~~~~~
../mm/memremap.c:295:27: warning: excess elements in struct initializer
  295 |                 .altmap = pgmap_altmap(pgmap),
      |                           ^~~~~~~~~~~~
../mm/memremap.c:295:27: note: (near initialization for ‘params’)
../mm/memremap.c:296:18: error: ‘struct mhp_params’ has no member named ‘pgmap’
  296 |                 .pgmap = pgmap,
      |                  ^~~~~
../mm/memremap.c:296:26: warning: excess elements in struct initializer
  296 |                 .pgmap = pgmap,
      |                          ^~~~~
../mm/memremap.c:296:26: note: (near initialization for ‘params’)
../mm/memremap.c:297:18: error: ‘struct mhp_params’ has no member named ‘pgprot’
  297 |                 .pgprot = PAGE_KERNEL,
      |                  ^~~~~~
In file included from ../arch/x86/include/asm/user_64.h:6,
                 from ../arch/x86/include/asm/user.h:8,
                 from ../arch/x86/um/asm/processor.h:22,
                 from ../include/linux/sched.h:13,
                 from ../include/linux/ratelimit.h:6,
                 from ../include/linux/dev_printk.h:16,
                 from ../include/linux/device.h:15,
                 from ../mm/memremap.c:3:
../arch/um/include/asm/page.h:70:25: warning: excess elements in struct initializer
   70 | #define __pgprot(x)     ((pgprot_t) { (x) } )
      |                         ^
../arch/um/include/asm/pgtable.h:65:25: note: in expansion of macro ‘__pgprot’
   65 | #define PAGE_KERNEL     __pgprot(_PAGE_PRESENT | _PAGE_RW | _PAGE_DIRTY | _PAGE_ACCESSED)
      |                         ^~~~~~~~
../mm/memremap.c:297:27: note: in expansion of macro ‘PAGE_KERNEL’
  297 |                 .pgprot = PAGE_KERNEL,
      |                           ^~~~~~~~~~~
../arch/um/include/asm/page.h:70:25: note: (near initialization for ‘params’)
   70 | #define __pgprot(x)     ((pgprot_t) { (x) } )
      |                         ^
../arch/um/include/asm/pgtable.h:65:25: note: in expansion of macro ‘__pgprot’
   65 | #define PAGE_KERNEL     __pgprot(_PAGE_PRESENT | _PAGE_RW | _PAGE_DIRTY | _PAGE_ACCESSED)
      |                         ^~~~~~~~
../mm/memremap.c:297:27: note: in expansion of macro ‘PAGE_KERNEL’
  297 |                 .pgprot = PAGE_KERNEL,
      |                           ^~~~~~~~~~~
../mm/memremap.c:294:27: error: storage size of ‘params’ isn’t known
  294 |         struct mhp_params params = {
      |                           ^~~~~~
../mm/memremap.c:294:27: warning: unused variable ‘params’ [-Wunused-variable]
../mm/memremap.c: In function ‘memremap_compat_align’:
../mm/memremap.c:38:1: error: control reaches end of non-void function [-Werror=return-type]
   38 | }
      | ^
cc1: some warnings being treated as errors
make[4]: *** [../scripts/Makefile.build:207: mm/memremap.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:465: mm] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:1994: .] Error 2
make[1]: *** [/kernel/Makefile:251: __sub-make] Error 2
make: *** [Makefile:251: __sub-make] Error 2

[03:36:35] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[03:36:39] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


