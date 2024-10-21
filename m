Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AB8D3C53F
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 05:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50A010E0A1;
	Mon, 21 Oct 2024 05:52:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E572C10E0A1;
 Mon, 21 Oct 2024 05:52:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/sriov=3A_Don=27t_migrat?=
 =?utf-8?q?e_dmabuf_BO_to_System_RAM_while_running_in_VM_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vivek Kasireddy" <vivek.kasireddy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Oct 2024 05:52:49 -0000
Message-ID: <172948996993.1303159.6430248448036997173@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241021052236.1820329-1-vivek.kasireddy@intel.com>
In-Reply-To: <20241021052236.1820329-1-vivek.kasireddy@intel.com>
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

Series: drm/xe/sriov: Don't migrate dmabuf BO to System RAM while running in VM (rev2)
URL   : https://patchwork.freedesktop.org/series/139920/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_bo.c: In function ‘xe_bo_translate_iova_to_dpa’:
../drivers/gpu/drm/xe/xe_bo.c:591:29: error: invalid use of undefined type ‘struct drm_pagemap_dma_addr’
  591 |                 bo->dma_addr[i] = drm_pagemap_dma_addr_encode(addr,
      |                             ^
../drivers/gpu/drm/xe/xe_bo.c:591:35: error: implicit declaration of function ‘drm_pagemap_dma_addr_encode’ [-Werror=implicit-function-declaration]
  591 |                 bo->dma_addr[i] = drm_pagemap_dma_addr_encode(addr,
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bo.c:592:49: error: ‘DRM_INTERCONNECT_DRIVER’ undeclared (first use in this function)
  592 |                                                 DRM_INTERCONNECT_DRIVER,
      |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bo.c:592:49: note: each undeclared identifier is reported only once for each function it appears in
../drivers/gpu/drm/xe/xe_bo.c:591:33: error: invalid use of undefined type ‘struct drm_pagemap_dma_addr’
  591 |                 bo->dma_addr[i] = drm_pagemap_dma_addr_encode(addr,
      |                                 ^
In file included from ../include/linux/percpu.h:5,
                 from ../include/linux/percpu_counter.h:14,
                 from ../include/linux/mm_types.h:21,
                 from ../include/linux/mmzone.h:22,
                 from ../include/linux/gfp.h:7,
                 from ../include/linux/mm.h:7,
                 from ../include/linux/pagemap.h:8,
                 from ../include/drm/ttm/ttm_tt.h:30,
                 from ../drivers/gpu/drm/xe/xe_bo.h:9,
                 from ../drivers/gpu/drm/xe/xe_bo.c:6:
../drivers/gpu/drm/xe/xe_bo.c: In function ‘xe_bo_sg_to_dma_addr_array’:
../drivers/gpu/drm/xe/xe_bo.c:626:55: error: invalid application of ‘sizeof’ to incomplete type ‘struct drm_pagemap_dma_addr’
  626 |         bo->dma_addr = kmalloc_array(sg->nents, sizeof(*bo->dma_addr),
      |                                                       ^
../include/linux/alloc_tag.h:202:16: note: in definition of macro ‘alloc_hooks_tag’
  202 |         typeof(_do_alloc) _res = _do_alloc;                             \
      |                ^~~~~~~~~
../include/linux/slab.h:925:49: note: in expansion of macro ‘alloc_hooks’
  925 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
      |                                                 ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bo.c:626:24: note: in expansion of macro ‘kmalloc_array’
  626 |         bo->dma_addr = kmalloc_array(sg->nents, sizeof(*bo->dma_addr),
      |                        ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bo.c:626:55: error: invalid application of ‘sizeof’ to incomplete type ‘struct drm_pagemap_dma_addr’
  626 |         bo->dma_addr = kmalloc_array(sg->nents, sizeof(*bo->dma_addr),
      |                                                       ^
../include/linux/alloc_tag.h:202:34: note: in definition of macro ‘alloc_hooks_tag’
  202 |         typeof(_do_alloc) _res = _do_alloc;                             \
      |                                  ^~~~~~~~~
../include/linux/slab.h:925:49: note: in expansion of macro ‘alloc_hooks’
  925 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
      |                                                 ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bo.c:626:24: note: in expansion of macro ‘kmalloc_array’
  626 |         bo->dma_addr = kmalloc_array(sg->nents, sizeof(*bo->dma_addr),
      |                        ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bo.c:626:22: warning: assignment to ‘struct drm_pagemap_dma_addr *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
  626 |         bo->dma_addr = kmalloc_array(sg->nents, sizeof(*bo->dma_addr),
      |                      ^
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:229: drivers/gpu/drm/xe/xe_bo.o] Error 1
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

[05:52:22] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:52:26] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


