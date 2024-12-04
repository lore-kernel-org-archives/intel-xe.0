Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE5FE7716E
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 14:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517BF10ED45;
	Wed,  4 Dec 2024 14:07:25 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A352910ED3F;
 Wed,  4 Dec 2024 14:07:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_kernel/cgroups=3A_Add_=22dmem?=
 =?utf-8?q?=22_memory_accounting_cgroup=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Dec 2024 14:07:24 -0000
Message-ID: <173332124466.2495098.1146773508096963844@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241204134410.1161769-1-dev@lankhorst.se>
In-Reply-To: <20241204134410.1161769-1-dev@lankhorst.se>
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

Series: kernel/cgroups: Add "dmem" memory accounting cgroup.
URL   : https://patchwork.freedesktop.org/series/142111/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/ttm/ttm_bo.c:45:
../include/linux/cgroup_dmem.h:32:1: error: expected identifier or ‘(’ before ‘{’ token
   32 | {
      | ^
../include/linux/cgroup_dmem.h:42:1: error: expected identifier or ‘(’ before ‘{’ token
   42 | {
      | ^
../drivers/gpu/drm/ttm/ttm_bo.c: In function ‘ttm_bo_evict_cb’:
../drivers/gpu/drm/ttm/ttm_bo.c:518:57: error: passing argument 1 of ‘dmem_cgroup_state_evict_valuable’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  518 |         if (!dmem_cgroup_state_evict_valuable(evict_walk->limit_pool, bo->resource->css,
      |                                               ~~~~~~~~~~^~~~~~~~~~~~
      |                                                         |
      |                                                         struct dmem_cgroup_pool_state *
../include/linux/cgroup_dmem.h:55:66: note: expected ‘struct dmem_cgroup_device *’ but argument is of type ‘struct dmem_cgroup_pool_state *’
   55 | bool dmem_cgroup_state_evict_valuable(struct dmem_cgroup_device *region,
      |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
../drivers/gpu/drm/ttm/ttm_bo.c:519:57: error: incompatible type for argument 3 of ‘dmem_cgroup_state_evict_valuable’
  519 |                                               evict_walk->try_low, &evict_walk->hit_low))
      |                                               ~~~~~~~~~~^~~~~~~~~
      |                                                         |
      |                                                         bool {aka _Bool}
../include/linux/cgroup_dmem.h:57:70: note: expected ‘struct dmem_cgroup_pool_state *’ but argument is of type ‘bool’ {aka ‘_Bool’}
   57 |                                       struct dmem_cgroup_pool_state *test_pool,
      |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
../drivers/gpu/drm/ttm/ttm_bo.c:519:47: warning: the comparison will always evaluate as ‘true’ for the address of ‘hit_low’ will never be NULL [-Waddress]
  519 |                                               evict_walk->try_low, &evict_walk->hit_low))
      |                                               ^~~~~~~~~~
../drivers/gpu/drm/ttm/ttm_bo.c:509:14: note: ‘hit_low’ declared here
  509 |         bool hit_low;
      |              ^~~~~~~
../drivers/gpu/drm/ttm/ttm_bo.c:518:14: error: too few arguments to function ‘dmem_cgroup_state_evict_valuable’
  518 |         if (!dmem_cgroup_state_evict_valuable(evict_walk->limit_pool, bo->resource->css,
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/cgroup_dmem.h:55:6: note: declared here
   55 | bool dmem_cgroup_state_evict_valuable(struct dmem_cgroup_device *region,
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/cgroup_dmem.h: At top level:
../include/linux/cgroup_dmem.h:31:1: warning: ‘dmem_cgroup_register_region’ declared ‘static’ but never defined [-Wunused-function]
   31 | dmem_cgroup_register_region(u64 size, const char *name_fmt, ...) __printf(2,3);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/cgroup_dmem.h:39:12: warning: ‘dmem_cgroup_try_charge’ declared ‘static’ but never defined [-Wunused-function]
   39 | static int dmem_cgroup_try_charge(struct dmem_cgroup_device *cgdev, u64 size,
      |            ^~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:194: drivers/gpu/drm/ttm/ttm_bo.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:440: drivers/gpu/drm/ttm] Error 2
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
make[5]: *** [../scripts/Makefile.build:440: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:440: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:440: drivers] Error 2
make[2]: *** [/kernel/Makefile:1989: .] Error 2
make[1]: *** [/kernel/Makefile:251: __sub-make] Error 2
make: *** [Makefile:251: __sub-make] Error 2

[14:06:51] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:06:55] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


