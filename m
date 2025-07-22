Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADCDC83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 16:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1109310E6D2;
	Tue, 22 Jul 2025 16:28:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4073A89BAE;
 Tue, 22 Jul 2025 16:28:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_series_starting_with_=5B1/1=5D?=
 =?utf-8?q?_drm/xe=3A_MADVISE_SQUASH_for_CI_-v5?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Jul 2025 16:28:56 -0000
Message-ID: <175320173625.180989.17706575504005442957@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250722161039.3711681-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250722161039.3711681-1-himal.prasad.ghimiray@intel.com>
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

Series: series starting with [1/1] drm/xe: MADVISE SQUASH for CI -v5
URL   : https://patchwork.freedesktop.org/series/151954/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/drm_gpuvm.c: In function ‘drm_gpuvm_sm_map_exec_lock’:
../drivers/gpu/drm/drm_gpuvm.c:2543:35: error: incompatible type for argument 6 of ‘__drm_gpuvm_sm_map’
 2543 |                                   req_obj, req_offset);
      |                                   ^~~~~~~
      |                                   |
      |                                   struct drm_gem_object *
../drivers/gpu/drm/drm_gpuvm.c:2106:52: note: expected ‘enum drm_gpuvm_sm_map_ops_flags’ but argument is of type ‘struct drm_gem_object *’
 2106 |                    enum drm_gpuvm_sm_map_ops_flags flags,
      |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
../drivers/gpu/drm/drm_gpuvm.c:2543:44: warning: passing argument 7 of ‘__drm_gpuvm_sm_map’ makes pointer from integer without a cast [-Wint-conversion]
 2543 |                                   req_obj, req_offset);
      |                                            ^~~~~~~~~~
      |                                            |
      |                                            u64 {aka long long unsigned int}
../drivers/gpu/drm/drm_gpuvm.c:2107:43: note: expected ‘struct drm_gem_object *’ but argument is of type ‘u64’ {aka ‘long long unsigned int’}
 2107 |                    struct drm_gem_object *req_obj, u64 req_offset)
      |                    ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
../drivers/gpu/drm/drm_gpuvm.c:2541:16: error: too few arguments to function ‘__drm_gpuvm_sm_map’
 2541 |         return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
      |                ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/drm_gpuvm.c:2103:1: note: declared here
 2103 | __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
      | ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/drm_gpuvm.c:2545:1: error: control reaches end of non-void function [-Werror=return-type]
 2545 | }
      | ^
cc1: some warnings being treated as errors
make[6]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/drm_gpuvm.o] Error 1
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:555: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:555: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:555: drivers] Error 2
make[2]: *** [/kernel/Makefile:2003: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[16:28:22] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:28:26] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


