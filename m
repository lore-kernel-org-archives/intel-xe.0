Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F91C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 17:59:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F4110EA37;
	Wed, 19 Apr 2023 17:59:39 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A08110EA37;
 Wed, 19 Apr 2023 17:59:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 963F7A47DF;
 Wed, 19 Apr 2023 17:59:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Wed, 19 Apr 2023 17:59:37 -0000
Message-ID: <168192717761.10529.392223485848611487@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230419175650.3259121-1-francois.dugast@intel.com>
In-Reply-To: <20230419175650.3259121-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe?=
 =?utf-8?q?=3A_switch_to_using_drm=5Fexec_=28rev3=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: switch to using drm_exec (rev3)
URL   : https://patchwork.freedesktop.org/series/116477/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/i915/display/intel_display.c: In function ‘i915_gem_object_read_from_page’:
../drivers/gpu/drm/i915/display/intel_display.c:7347:23: error: passing argument 2 of ‘xe_bo_lock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
 7347 |  ret = xe_bo_lock(bo, &ww, 0, true);
      |                       ^~~
      |                       |
      |                       struct ww_acquire_ctx *
In file included from ../drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:14,
                 from ../drivers/gpu/drm/i915/display/intel_display.c:56:
../drivers/gpu/drm/xe/xe_bo.h:145:51: note: expected ‘struct drm_exec *’ but argument is of type ‘struct ww_acquire_ctx *’
  145 | int xe_bo_lock(struct xe_bo *bo, struct drm_exec *exec,
      |                                  ~~~~~~~~~~~~~~~~~^~~~
../drivers/gpu/drm/i915/display/intel_display.c:7364:19: error: passing argument 2 of ‘xe_bo_unlock’ from incompatible pointer type [-Werror=incompatible-pointer-types]
 7364 |  xe_bo_unlock(bo, &ww);
      |                   ^~~
      |                   |
      |                   struct ww_acquire_ctx *
In file included from ../drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:14,
                 from ../drivers/gpu/drm/i915/display/intel_display.c:56:
../drivers/gpu/drm/xe/xe_bo.h:147:54: note: expected ‘struct drm_exec *’ but argument is of type ‘struct ww_acquire_ctx *’
  147 | void xe_bo_unlock(struct xe_bo *bo, struct drm_exec *exec);
      |                                     ~~~~~~~~~~~~~~~~~^~~~
cc1: some warnings being treated as errors
make[6]: *** [../drivers/gpu/drm/xe/Makefile:124: drivers/gpu/drm/xe/display/intel_display.o] Error 1
make[5]: *** [../scripts/Makefile.build:494: drivers/gpu/drm/xe] Error 2
make[4]: *** [../scripts/Makefile.build:494: drivers/gpu/drm] Error 2
make[3]: *** [../scripts/Makefile.build:494: drivers/gpu] Error 2
make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
make[1]: *** [/kernel/Makefile:2025: .] Error 2
make: *** [Makefile:226: __sub-make] Error 2

[17:59:10] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:59:14] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


