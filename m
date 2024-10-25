Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22D4D1038E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 01:58:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F2110E9CC;
	Fri, 25 Oct 2024 01:58:33 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5173410E0CF;
 Fri, 25 Oct 2024 01:58:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/guc/tlb=3A_Flush_g2h_wo?=
 =?utf-8?q?rker_in_case_of_tlb_timeout_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 01:58:32 -0000
Message-ID: <172982151233.1330038.16352733779175507806@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241024153739.994688-1-nirmoy.das@intel.com>
In-Reply-To: <20241024153739.994688-1-nirmoy.das@intel.com>
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

Series: drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout (rev2)
URL   : https://patchwork.freedesktop.org/series/140382/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[01:57:58] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[01:58:03] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json ARCH=um O=.kunit --jobs=48
ERROR:root:In file included from ../drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:16,
                 from ../drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:9:
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:24:35: warning: ‘struct xe_runtime_pm’ declared inside parameter list will not be visible outside of this definition or declaration
   24 | intel_runtime_pm_suspended(struct xe_runtime_pm *pm)
      |                                   ^~~~~~~~~~~~~
In file included from ../include/linux/container_of.h:5,
                 from ../include/linux/list.h:5,
                 from ../include/linux/wait.h:7,
                 from ../include/linux/dma-fence.h:17,
                 from ../drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:6:
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h: In function ‘intel_runtime_pm_suspended’:
../include/linux/container_of.h:20:54: error: ‘struct xe_device’ has no member named ‘runtime_pm’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                                                      ^~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro ‘static_assert’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro ‘__same_type’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:26:32: note: in expansion of macro ‘container_of’
   26 |         struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
      |                                ^~~~~~~~~~~~
./../include/linux/compiler_types.h:458:27: error: expression in static assertion is not an integer
  458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro ‘static_assert’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro ‘__same_type’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:26:32: note: in expansion of macro ‘container_of’
   26 |         struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
      |                                ^~~~~~~~~~~~
In file included from ../include/uapi/linux/posix_types.h:5,
                 from ../include/uapi/linux/types.h:14,
                 from ../include/linux/types.h:6,
                 from ../drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h:9:
../include/linux/stddef.h:16:33: error: ‘struct xe_device’ has no member named ‘runtime_pm’
   16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
      |                                 ^~~~~~~~~~~~~~~~~~
../include/linux/container_of.h:23:28: note: in expansion of macro ‘offsetof’
   23 |         ((type *)(__mptr - offsetof(type, member))); })
      |                            ^~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:26:32: note: in expansion of macro ‘container_of’
   26 |         struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
      |                                ^~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h: At top level:
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:31:59: warning: ‘struct xe_runtime_pm’ declared inside parameter list will not be visible outside of this definition or declaration
   31 | static inline intel_wakeref_t intel_runtime_pm_get(struct xe_runtime_pm *pm)
      |                                                           ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h: In function ‘intel_runtime_pm_get’:
../include/linux/container_of.h:20:54: error: ‘struct xe_device’ has no member named ‘runtime_pm’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                                                      ^~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro ‘static_assert’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro ‘__same_type’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:33:32: note: in expansion of macro ‘container_of’
   33 |         struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
      |                                ^~~~~~~~~~~~
./../include/linux/compiler_types.h:458:27: error: expression in static assertion is not an integer
  458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro ‘static_assert’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro ‘__same_type’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:33:32: note: in expansion of macro ‘container_of’
   33 |         struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
      |                                ^~~~~~~~~~~~
../include/linux/stddef.h:16:33: error: ‘struct xe_device’ has no member named ‘runtime_pm’
   16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
      |                                 ^~~~~~~~~~~~~~~~~~
../include/linux/container_of.h:23:28: note: in expansion of macro ‘offsetof’
   23 |         ((type *)(__mptr - offsetof(type, member))); })
      |                            ^~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:33:32: note: in expansion of macro ‘container_of’
   33 |         struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
      |                                ^~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h: At top level:
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:38:69: warning: ‘struct xe_runtime_pm’ declared inside parameter list will not be visible outside of this definition or declaration
   38 | static inline intel_wakeref_t intel_runtime_pm_get_if_in_use(struct xe_runtime_pm *pm)
      |                                                                     ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h: In function ‘intel_runtime_pm_get_if_in_use’:
../include/linux/container_of.h:20:54: error: ‘struct xe_device’ has no member named ‘runtime_pm’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                                                      ^~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro ‘static_assert’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro ‘__same_type’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:40:32: note: in expansion of macro ‘container_of’
   40 |         struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
      |                                ^~~~~~~~~~~~
./../include/linux/compiler_types.h:458:27: error: expression in static assertion is not an integer
  458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro ‘static_assert’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro ‘__same_type’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:40:32: note: in expansion of macro ‘container_of’
   40 |         struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
      |                                ^~~~~~~~~~~~
../include/linux/stddef.h:16:33: error: ‘struct xe_device’ has no member named ‘runtime_pm’
   16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
      |                                 ^~~~~~~~~~~~~~~~~~
../include/linux/container_of.h:23:28: note: in expansion of macro ‘offsetof’
   23 |         ((type *)(__mptr - offsetof(type, member))); })
      |                            ^~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:40:32: note: in expansion of macro ‘container_of’
   40 |         struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
      |                                ^~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h: At top level:
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:45:68: warning: ‘struct xe_runtime_pm’ declared inside parameter list will not be visible outside of this definition or declaration
   45 | static inline intel_wakeref_t intel_runtime_pm_get_noresume(struct xe_runtime_pm *pm)
      |                                                                    ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h: In function ‘intel_runtime_pm_get_noresume’:
../include/linux/container_of.h:20:54: error: ‘struct xe_device’ has no member named ‘runtime_pm’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                                                      ^~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro ‘static_assert’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro ‘__same_type’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:47:32: note: in expansion of macro ‘container_of’
   47 |         struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
      |                                ^~~~~~~~~~~~
./../include/linux/compiler_types.h:458:27: error: expression in static assertion is not an integer
  458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro ‘static_assert’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro ‘__same_type’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:47:32: note: in expansion of macro ‘container_of’
   47 |         struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
      |                                ^~~~~~~~~~~~
../include/linux/stddef.h:16:33: error: ‘struct xe_device’ has no member named ‘runtime_pm’
   16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
      |                                 ^~~~~~~~~~~~~~~~~~
../include/linux/container_of.h:23:28: note: in expansion of macro ‘offsetof’
   23 |         ((type *)(__mptr - offsetof(type, member))); })
      |                            ^~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:47:32: note: in expansion of macro ‘container_of’
   47 |         struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
      |                                ^~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h: At top level:
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:54:58: warning: ‘struct xe_runtime_pm’ declared inside parameter list will not be visible outside of this definition or declaration
   54 | static inline void intel_runtime_pm_put_unchecked(struct xe_runtime_pm *pm)
      |                                                          ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h: In function ‘intel_runtime_pm_put_unchecked’:
../include/linux/container_of.h:20:54: error: ‘struct xe_device’ has no member named ‘runtime_pm’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                                                      ^~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro ‘static_assert’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro ‘__same_type’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:56:32: note: in expansion of macro ‘container_of’
   56 |         struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
      |                                ^~~~~~~~~~~~
./../include/linux/compiler_types.h:458:27: error: expression in static assertion is not an integer
  458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro ‘static_assert’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro ‘__same_type’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:56:32: note: in expansion of macro ‘container_of’
   56 |         struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
      |                                ^~~~~~~~~~~~
../include/linux/stddef.h:16:33: error: ‘struct xe_device’ has no member named ‘runtime_pm’
   16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
      |                                 ^~~~~~~~~~~~~~~~~~
../include/linux/container_of.h:23:28: note: in expansion of macro ‘offsetof’
   23 |         ((type *)(__mptr - offsetof(type, member))); })
      |                            ^~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:56:32: note: in expansion of macro ‘container_of’
   56 |         struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
      |                                ^~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h: At top level:
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:61:48: warning: ‘struct xe_runtime_pm’ declared inside parameter list will not be visible outside of this definition or declaration
   61 | static inline void intel_runtime_pm_put(struct xe_runtime_pm *pm, intel_wakeref_t wakeref)
      |                                                ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h: In function ‘intel_runtime_pm_put’:
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:64:48: error: passing argument 1 of ‘intel_runtime_pm_put_unchecked’ from incompatible pointer type [-Werror=incompatible-pointer-types]
   64 |                 intel_runtime_pm_put_unchecked(pm);
      |                                                ^~
      |                                                |
      |                                                struct xe_runtime_pm *
../drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:54:73: note: expected ‘struct xe_runtime_pm *’ but argument is of type ‘struct xe_runtime_pm *’
   54 | static inline void intel_runtime_pm_put_unchecked(struct xe_runtime_pm *pm)
      |                                                   ~~~~~~~~~~~~~~~~~~~~~~^~
../drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h: In function ‘to_i915’:
../include/linux/container_of.h:20:54: error: invalid use of undefined type ‘struct drm_i915_private’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                                                      ^~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro ‘static_assert’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro ‘__same_type’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:22:16: note: in expansion of macro ‘container_of’
   22 |         return container_of(dev, struct drm_i915_private, drm);
      |                ^~~~~~~~~~~~
./../include/linux/compiler_types.h:458:27: error: expression in static assertion is not an integer
  458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro ‘static_assert’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro ‘__same_type’
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:22:16: note: in expansion of macro ‘container_of’
   22 |         return container_of(dev, struct drm_i915_private, drm);
      |                ^~~~~~~~~~~~
../include/linux/stddef.h:16:33: error: invalid use of undefined type ‘struct drm_i915_private’
   16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
      |                                 ^~~~~~~~~~~~~~~~~~
../include/linux/container_of.h:23:28: note: in expansion of macro ‘offsetof’
   23 |         ((type *)(__mptr - offsetof(type, member))); })
      |                            ^~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:22:16: note: in expansion of macro ‘container_of’
   22 |         return container_of(dev, struct drm_i915_private, drm);
      |                ^~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:229: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:478: drivers/gpu/drm/xe] Error 2
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
make[5]: *** [../scripts/Makefile.build:478: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:478: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:478: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:1936: .] Error 2
make[1]: *** [/kernel/Makefile:224: __sub-make] Error 2
make: *** [Makefile:224: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


