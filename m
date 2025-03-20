Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC24FC28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 17:38:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE0310E677;
	Thu, 20 Mar 2025 17:38:36 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464B710E677;
 Thu, 20 Mar 2025 17:38:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Replace_xe=5Fhmm_with_gpusvm?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Mar 2025 17:38:35 -0000
Message-ID: <174249231528.59409.9028563610558288085@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250320172956.168358-9-matthew.auld@intel.com>
In-Reply-To: <20250320172956.168358-9-matthew.auld@intel.com>
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

Series: Replace xe_hmm with gpusvm
URL   : https://patchwork.freedesktop.org/series/146553/
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
/usr/bin/ld: drivers/gpu/drm/xe/xe_vm.o: in function `xe_vma_destroy_late':
xe_vm.c:(.text+0xd2d): undefined reference to `drm_gpusvm_basic_range_free_pages'
/usr/bin/ld: xe_vm.c:(.text+0xd52): undefined reference to `drm_gpusvm_basic_range_fini'
/usr/bin/ld: drivers/gpu/drm/xe/xe_vm.o: in function `xe_vma_userptr_pin_pages':
xe_vm.c:(.text+0x1f4b): undefined reference to `drm_gpusvm_basic_range_get_pages'
/usr/bin/ld: drivers/gpu/drm/xe/xe_vm.o: in function `new_vma':
xe_vm.c:(.text+0x389e): undefined reference to `drm_gpusvm_basic_range_init'
/usr/bin/ld: drivers/gpu/drm/xe/xe_vm.o: in function `xe_vm_close_and_put':
xe_vm.c:(.text+0x4cc0): undefined reference to `drm_gpusvm_basic_fini'
/usr/bin/ld: drivers/gpu/drm/xe/xe_vm.o: in function `xe_vm_create':
xe_vm.c:(.text+0x57fe): undefined reference to `drm_gpusvm_basic_init'
/usr/bin/ld: drivers/gpu/drm/xe/xe_vm.o: in function `vma_userptr_invalidate':
xe_vm.c:(.text+0x941e): undefined reference to `drm_gpusvm_basic_range_unmap_pages'
collect2: error: ld returned 1 exit status
make[3]: *** [../scripts/Makefile.vmlinux:77: vmlinux] Error 1
make[2]: *** [/kernel/Makefile:1231: vmlinux] Error 2
make[1]: *** [/kernel/Makefile:251: __sub-make] Error 2
make: *** [Makefile:251: __sub-make] Error 2

[17:37:58] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:38:02] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


