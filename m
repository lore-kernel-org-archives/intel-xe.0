Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FC6EB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 04:51:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCDC10E09C;
	Mon, 19 Jun 2023 04:51:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 55D2B10E095;
 Mon, 19 Jun 2023 04:51:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 51DC0A7DFF;
 Mon, 19 Jun 2023 04:51:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aravind Iddamsetty" <aravind.iddamsetty@intel.com>
Date: Mon, 19 Jun 2023 04:51:22 -0000
Message-ID: <168715028232.16530.6209640664513395310@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230619045128.3716798-1-aravind.iddamsetty@intel.com>
In-Reply-To: <20230619045128.3716798-1-aravind.iddamsetty@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/?=
 =?utf-8?q?pmu=3A_Enable_PMU_interface?=
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

Series: drm/xe/pmu: Enable PMU interface
URL   : https://patchwork.freedesktop.org/series/119504/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../include/linux/list.h:5,
                 from ../include/drm/drm_drv.h:30,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:7:
../drivers/gpu/drm/xe/xe_pmu.c: In function ‘xe_pmu_event_destroy’:
../drivers/gpu/drm/xe/xe_pmu.c:32:21: error: ‘struct perf_event’ has no member named ‘pmu’
   32 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |                     ^~
../include/linux/container_of.h:19:26: note: in definition of macro ‘container_of’
   19 |  void *__mptr = (void *)(ptr);     \
      |                          ^~~
In file included from ../include/linux/container_of.h:5,
                 from ../include/linux/list.h:5,
                 from ../include/drm/drm_drv.h:30,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:7:
../drivers/gpu/drm/xe/xe_pmu.c:32:21: error: ‘struct perf_event’ has no member named ‘pmu’
   32 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |                     ^~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:2: note: in expansion of macro ‘static_assert’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |  ^~~~~~~~~~~~~
../include/linux/container_of.h:20:16: note: in expansion of macro ‘__same_type’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |                ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:32:3: note: in expansion of macro ‘container_of’
   32 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |   ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:32:21: error: ‘struct perf_event’ has no member named ‘pmu’
   32 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |                     ^~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:2: note: in expansion of macro ‘static_assert’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |  ^~~~~~~~~~~~~
../include/linux/container_of.h:21:9: note: in expansion of macro ‘__same_type’
   21 |         __same_type(*(ptr), void),   \
      |         ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:32:3: note: in expansion of macro ‘container_of’
   32 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |   ^~~~~~~~~~~~
./../include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
  338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:2: note: in expansion of macro ‘static_assert’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |  ^~~~~~~~~~~~~
../include/linux/container_of.h:20:16: note: in expansion of macro ‘__same_type’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |                ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:32:3: note: in expansion of macro ‘container_of’
   32 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |   ^~~~~~~~~~~~
In file included from ./arch/um/include/generated/asm/bug.h:1,
                 from ../include/linux/bug.h:5,
                 from ../include/linux/thread_info.h:13,
                 from ../include/asm-generic/preempt.h:5,
                 from ./arch/um/include/generated/asm/preempt.h:1,
                 from ../include/linux/preempt.h:78,
                 from ../include/linux/spinlock.h:56,
                 from ../include/linux/kref.h:16,
                 from ../include/drm/drm_device.h:5,
                 from ../include/drm/drm_drv.h:35,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:7:
../drivers/gpu/drm/xe/xe_pmu.c:34:29: error: ‘struct perf_event’ has no member named ‘parent’
   34 |  drm_WARN_ON(&xe->drm, event->parent);
      |                             ^~
../include/asm-generic/bug.h:131:25: note: in definition of macro ‘WARN’
  131 |  int __ret_warn_on = !!(condition);    \
      |                         ^~~~~~~~~
../include/drm/drm_print.h:630:2: note: in expansion of macro ‘drm_WARN’
  630 |  drm_WARN((drm), (x), "%s",     \
      |  ^~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:34:2: note: in expansion of macro ‘drm_WARN_ON’
   34 |  drm_WARN_ON(&xe->drm, event->parent);
      |  ^~~~~~~~~~~
In file included from ../include/linux/list.h:5,
                 from ../include/drm/drm_drv.h:30,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:7:
../drivers/gpu/drm/xe/xe_pmu.c: In function ‘xe_pmu_event_init’:
../drivers/gpu/drm/xe/xe_pmu.c:98:21: error: ‘struct perf_event’ has no member named ‘pmu’
   98 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |                     ^~
../include/linux/container_of.h:19:26: note: in definition of macro ‘container_of’
   19 |  void *__mptr = (void *)(ptr);     \
      |                          ^~~
In file included from ../include/linux/container_of.h:5,
                 from ../include/linux/list.h:5,
                 from ../include/drm/drm_drv.h:30,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:7:
../drivers/gpu/drm/xe/xe_pmu.c:98:21: error: ‘struct perf_event’ has no member named ‘pmu’
   98 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |                     ^~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:2: note: in expansion of macro ‘static_assert’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |  ^~~~~~~~~~~~~
../include/linux/container_of.h:20:16: note: in expansion of macro ‘__same_type’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |                ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:98:3: note: in expansion of macro ‘container_of’
   98 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |   ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:98:21: error: ‘struct perf_event’ has no member named ‘pmu’
   98 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |                     ^~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:2: note: in expansion of macro ‘static_assert’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |  ^~~~~~~~~~~~~
../include/linux/container_of.h:21:9: note: in expansion of macro ‘__same_type’
   21 |         __same_type(*(ptr), void),   \
      |         ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:98:3: note: in expansion of macro ‘container_of’
   98 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |   ^~~~~~~~~~~~
./../include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
  338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:2: note: in expansion of macro ‘static_assert’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |  ^~~~~~~~~~~~~
../include/linux/container_of.h:20:16: note: in expansion of macro ‘__same_type’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |                ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:98:3: note: in expansion of macro ‘container_of’
   98 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |   ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:105:11: error: ‘struct perf_event’ has no member named ‘attr’
  105 |  if (event->attr.type != event->pmu->type)
      |           ^~
../drivers/gpu/drm/xe/xe_pmu.c:105:31: error: ‘struct perf_event’ has no member named ‘pmu’
  105 |  if (event->attr.type != event->pmu->type)
      |                               ^~
../drivers/gpu/drm/xe/xe_pmu.c:109:11: error: ‘struct perf_event’ has no member named ‘attr’
  109 |  if (event->attr.sample_period) /* no sampling */
      |           ^~
../drivers/gpu/drm/xe/xe_pmu.c:112:6: error: implicit declaration of function ‘has_branch_stack’ [-Werror=implicit-function-declaration]
  112 |  if (has_branch_stack(event))
      |      ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:115:11: error: ‘struct perf_event’ has no member named ‘cpu’
  115 |  if (event->cpu < 0)
      |           ^~
../drivers/gpu/drm/xe/xe_pmu.c:119:29: error: ‘struct perf_event’ has no member named ‘cpu’
  119 |  if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
      |                             ^~
../drivers/gpu/drm/xe/xe_pmu.c:122:31: error: ‘struct perf_event’ has no member named ‘attr’
  122 |  ret = config_status(xe, event->attr.config);
      |                               ^~
../drivers/gpu/drm/xe/xe_pmu.c:126:12: error: ‘struct perf_event’ has no member named ‘parent’
  126 |  if (!event->parent) {
      |            ^~
../drivers/gpu/drm/xe/xe_pmu.c:128:8: error: ‘struct perf_event’ has no member named ‘destroy’
  128 |   event->destroy = xe_pmu_event_destroy;
      |        ^~
In file included from ../include/linux/list.h:5,
                 from ../include/drm/drm_drv.h:30,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:7:
../drivers/gpu/drm/xe/xe_pmu.c: In function ‘__xe_pmu_event_read’:
../drivers/gpu/drm/xe/xe_pmu.c:137:21: error: ‘struct perf_event’ has no member named ‘pmu’
  137 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |                     ^~
../include/linux/container_of.h:19:26: note: in definition of macro ‘container_of’
   19 |  void *__mptr = (void *)(ptr);     \
      |                          ^~~
In file included from ../include/linux/container_of.h:5,
                 from ../include/linux/list.h:5,
                 from ../include/drm/drm_drv.h:30,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:7:
../drivers/gpu/drm/xe/xe_pmu.c:137:21: error: ‘struct perf_event’ has no member named ‘pmu’
  137 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |                     ^~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:2: note: in expansion of macro ‘static_assert’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |  ^~~~~~~~~~~~~
../include/linux/container_of.h:20:16: note: in expansion of macro ‘__same_type’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |                ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:137:3: note: in expansion of macro ‘container_of’
  137 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |   ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:137:21: error: ‘struct perf_event’ has no member named ‘pmu’
  137 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |                     ^~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:2: note: in expansion of macro ‘static_assert’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |  ^~~~~~~~~~~~~
../include/linux/container_of.h:21:9: note: in expansion of macro ‘__same_type’
   21 |         __same_type(*(ptr), void),   \
      |         ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:137:3: note: in expansion of macro ‘container_of’
  137 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |   ^~~~~~~~~~~~
./../include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
  338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:2: note: in expansion of macro ‘static_assert’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |  ^~~~~~~~~~~~~
../include/linux/container_of.h:20:16: note: in expansion of macro ‘__same_type’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |                ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:137:3: note: in expansion of macro ‘container_of’
  137 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |   ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:138:47: error: ‘struct perf_event’ has no member named ‘attr’
  138 |  const unsigned int gt_id = config_gt_id(event->attr.config);
      |                                               ^~
../drivers/gpu/drm/xe/xe_pmu.c:139:41: error: ‘struct perf_event’ has no member named ‘attr’
  139 |  const u64 config = config_counter(event->attr.config);
      |                                         ^~
In file included from ../include/linux/list.h:5,
                 from ../include/drm/drm_drv.h:30,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:7:
../drivers/gpu/drm/xe/xe_pmu.c: In function ‘xe_pmu_event_read’:
../drivers/gpu/drm/xe/xe_pmu.c:161:21: error: ‘struct perf_event’ has no member named ‘pmu’
  161 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |                     ^~
../include/linux/container_of.h:19:26: note: in definition of macro ‘container_of’
   19 |  void *__mptr = (void *)(ptr);     \
      |                          ^~~
In file included from ../include/linux/container_of.h:5,
                 from ../include/linux/list.h:5,
                 from ../include/drm/drm_drv.h:30,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:7:
../drivers/gpu/drm/xe/xe_pmu.c:161:21: error: ‘struct perf_event’ has no member named ‘pmu’
  161 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |                     ^~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:2: note: in expansion of macro ‘static_assert’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |  ^~~~~~~~~~~~~
../include/linux/container_of.h:20:16: note: in expansion of macro ‘__same_type’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |                ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:161:3: note: in expansion of macro ‘container_of’
  161 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |   ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:161:21: error: ‘struct perf_event’ has no member named ‘pmu’
  161 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |                     ^~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:2: note: in expansion of macro ‘static_assert’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |  ^~~~~~~~~~~~~
../include/linux/container_of.h:21:9: note: in expansion of macro ‘__same_type’
   21 |         __same_type(*(ptr), void),   \
      |         ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:161:3: note: in expansion of macro ‘container_of’
  161 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |   ^~~~~~~~~~~~
./../include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
  338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:2: note: in expansion of macro ‘static_assert’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |  ^~~~~~~~~~~~~
../include/linux/container_of.h:20:16: note: in expansion of macro ‘__same_type’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |                ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:161:3: note: in expansion of macro ‘container_of’
  161 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |   ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:162:36: error: ‘struct perf_event’ has no member named ‘hw’
  162 |  struct hw_perf_event *hwc = &event->hw;
      |                                    ^~
../drivers/gpu/drm/xe/xe_pmu.c:167:8: error: ‘struct perf_event’ has no member named ‘hw’
  167 |   event->hw.state = PERF_HES_STOPPED;
      |        ^~
../drivers/gpu/drm/xe/xe_pmu.c:167:21: error: ‘PERF_HES_STOPPED’ undeclared (first use in this function)
  167 |   event->hw.state = PERF_HES_STOPPED;
      |                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:167:21: note: each undeclared identifier is reported only once for each function it appears in
In file included from ../include/asm-generic/local64.h:22,
                 from ./arch/x86/include/generated/asm/local64.h:1,
                 from ../include/linux/u64_stats_sync.h:71,
                 from ../include/linux/cgroup-defs.h:20,
                 from ../include/linux/cgroup.h:28,
                 from ../include/linux/perf_event.h:60,
                 from ../drivers/gpu/drm/xe/xe_pmu_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_pmu.h:9,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:18,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:12:
../drivers/gpu/drm/xe/xe_pmu.c:171:26: error: ‘struct hw_perf_event’ has no member named ‘prev_count’
  171 |  prev = local64_read(&hwc->prev_count);
      |                          ^~
../arch/x86/include/asm/local.h:16:42: note: in definition of macro ‘local_read’
   16 | #define local_read(l) atomic_long_read(&(l)->a)
      |                                          ^
../drivers/gpu/drm/xe/xe_pmu.c:171:9: note: in expansion of macro ‘local64_read’
  171 |  prev = local64_read(&hwc->prev_count);
      |         ^~~~~~~~~~~~
In file included from ../include/linux/atomic.h:82,
                 from ../include/linux/jump_label.h:255,
                 from ../arch/x86/include/asm/string_64.h:6,
                 from ../arch/x86/include/asm/string.h:5,
                 from ../include/linux/string.h:20,
                 from ../include/linux/bitmap.h:11,
                 from ../include/linux/cpumask.h:12,
                 from ../include/linux/smp.h:13,
                 from ../include/linux/lockdep.h:14,
                 from ../include/linux/spinlock.h:63,
                 from ../include/linux/kref.h:16,
                 from ../include/drm/drm_device.h:5,
                 from ../include/drm/drm_drv.h:35,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:7:
../drivers/gpu/drm/xe/xe_pmu.c:174:26: error: ‘struct hw_perf_event’ has no member named ‘prev_count’
  174 |  if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
      |                          ^~
../include/linux/atomic/atomic-instrumented.h:2049:9: note: in definition of macro ‘cmpxchg_local’
 2049 |  typeof(ptr) __ai_ptr = (ptr); \
      |         ^~~
../include/asm-generic/local64.h:45:34: note: in expansion of macro ‘local_cmpxchg’
   45 | #define local64_cmpxchg(l, o, n) local_cmpxchg((&(l)->a), (o), (n))
      |                                  ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:174:6: note: in expansion of macro ‘local64_cmpxchg’
  174 |  if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
      |      ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:174:26: error: ‘struct hw_perf_event’ has no member named ‘prev_count’
  174 |  if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
      |                          ^~
../include/linux/atomic/atomic-instrumented.h:2049:26: note: in definition of macro ‘cmpxchg_local’
 2049 |  typeof(ptr) __ai_ptr = (ptr); \
      |                          ^~~
../include/asm-generic/local64.h:45:34: note: in expansion of macro ‘local_cmpxchg’
   45 | #define local64_cmpxchg(l, o, n) local_cmpxchg((&(l)->a), (o), (n))
      |                                  ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:174:6: note: in expansion of macro ‘local64_cmpxchg’
  174 |  if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
      |      ^~~~~~~~~~~~~~~
../include/linux/atomic/atomic-instrumented.h:2050:43: error: invalid type argument of unary ‘*’ (have ‘int’)
 2050 |  instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
      |                                           ^~~~~~~~~
../arch/x86/include/asm/local.h:124:3: note: in expansion of macro ‘cmpxchg_local’
  124 |  (cmpxchg_local(&((l)->a.counter), (o), (n)))
      |   ^~~~~~~~~~~~~
../include/asm-generic/local64.h:45:34: note: in expansion of macro ‘local_cmpxchg’
   45 | #define local64_cmpxchg(l, o, n) local_cmpxchg((&(l)->a), (o), (n))
      |                                  ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:174:6: note: in expansion of macro ‘local64_cmpxchg’
  174 |  if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
      |      ^~~~~~~~~~~~~~~
../include/linux/atomic/atomic-instrumented.h:2050:26: warning: passing argument 1 of ‘instrument_atomic_write’ makes pointer from integer without a cast [-Wint-conversion]
 2050 |  instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
      |                          ^~~~~~~~
      |                          |
      |                          int
../arch/x86/include/asm/local.h:124:3: note: in expansion of macro ‘cmpxchg_local’
  124 |  (cmpxchg_local(&((l)->a.counter), (o), (n)))
      |   ^~~~~~~~~~~~~
../include/asm-generic/local64.h:45:34: note: in expansion of macro ‘local_cmpxchg’
   45 | #define local64_cmpxchg(l, o, n) local_cmpxchg((&(l)->a), (o), (n))
      |                                  ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:174:6: note: in expansion of macro ‘local64_cmpxchg’
  174 |  if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
      |      ^~~~~~~~~~~~~~~
In file included from ../include/asm-generic/bitops/instrumented-atomic.h:14,
                 from ../arch/x86/include/asm/bitops.h:424,
                 from ../include/linux/bitops.h:68,
                 from ../include/linux/thread_info.h:27,
                 from ../include/asm-generic/preempt.h:5,
                 from ./arch/um/include/generated/asm/preempt.h:1,
                 from ../include/linux/preempt.h:78,
                 from ../include/linux/spinlock.h:56,
                 from ../include/linux/kref.h:16,
                 from ../include/drm/drm_device.h:5,
                 from ../include/drm/drm_drv.h:35,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:7:
../include/linux/instrumented.h:85:74: note: expected ‘const volatile void *’ but argument is of type ‘int’
   85 | static __always_inline void instrument_atomic_write(const volatile void *v, size_t size)
      |                                                     ~~~~~~~~~~~~~~~~~~~~~^
In file included from ../arch/x86/include/asm/atomic.h:8,
                 from ../include/linux/atomic.h:7,
                 from ../include/linux/jump_label.h:255,
                 from ../arch/x86/include/asm/string_64.h:6,
                 from ../arch/x86/include/asm/string.h:5,
                 from ../include/linux/string.h:20,
                 from ../include/linux/bitmap.h:11,
                 from ../include/linux/cpumask.h:12,
                 from ../include/linux/smp.h:13,
                 from ../include/linux/lockdep.h:14,
                 from ../include/linux/spinlock.h:63,
                 from ../include/linux/kref.h:16,
                 from ../include/drm/drm_device.h:5,
                 from ../include/drm/drm_drv.h:35,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:7:
../arch/x86/include/asm/cmpxchg.h:87:13: error: invalid type argument of unary ‘*’ (have ‘int’)
   87 |  __typeof__(*(ptr)) __ret;     \
      |             ^~~~~~
../arch/x86/include/asm/cmpxchg.h:140:2: note: in expansion of macro ‘__raw_cmpxchg’
  140 |  __raw_cmpxchg((ptr), (old), (new), (size), "")
      |  ^~~~~~~~~~~~~
../arch/x86/include/asm/cmpxchg.h:155:2: note: in expansion of macro ‘__cmpxchg_local’
  155 |  __cmpxchg_local(ptr, old, new, sizeof(*(ptr)))
      |  ^~~~~~~~~~~~~~~
../include/linux/atomic/atomic-instrumented.h:2051:2: note: in expansion of macro ‘arch_cmpxchg_local’
 2051 |  arch_cmpxchg_local(__ai_ptr, __VA_ARGS__); \
      |  ^~~~~~~~~~~~~~~~~~
../arch/x86/include/asm/local.h:124:3: note: in expansion of macro ‘cmpxchg_local’
  124 |  (cmpxchg_local(&((l)->a.counter), (o), (n)))
      |   ^~~~~~~~~~~~~
../include/asm-generic/local64.h:45:34: note: in expansion of macro ‘local_cmpxchg’
   45 | #define local64_cmpxchg(l, o, n) local_cmpxchg((&(l)->a), (o), (n))
      |                                  ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:174:6: note: in expansion of macro ‘local64_cmpxchg’
  174 |  if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
      |      ^~~~~~~~~~~~~~~
../arch/x86/include/asm/cmpxchg.h:88:13: error: invalid type argument of unary ‘*’ (have ‘int’)
   88 |  __typeof__(*(ptr)) __old = (old);    \
      |             ^~~~~~
../arch/x86/include/asm/cmpxchg.h:140:2: note: in expansion of macro ‘__raw_cmpxchg’
  140 |  __raw_cmpxchg((ptr), (old), (new), (size), "")
      |  ^~~~~~~~~~~~~
../arch/x86/include/asm/cmpxchg.h:155:2: note: in expansion of macro ‘__cmpxchg_local’
  155 |  __cmpxchg_local(ptr, old, new, sizeof(*(ptr)))
      |  ^~~~~~~~~~~~~~~
../include/linux/atomic/atomic-instrumented.h:2051:2: note: in expansion of macro ‘arch_cmpxchg_local’
 2051 |  arch_cmpxchg_local(__ai_ptr, __VA_ARGS__); \
      |  ^~~~~~~~~~~~~~~~~~
../arch/x86/include/asm/local.h:124:3: note: in expansion of macro ‘cmpxchg_local’
  124 |  (cmpxchg_local(&((l)->a.counter), (o), (n)))
      |   ^~~~~~~~~~~~~
../include/asm-generic/local64.h:45:34: note: in expansion of macro ‘local_cmpxchg’
   45 | #define local64_cmpxchg(l, o, n) local_cmpxchg((&(l)->a), (o), (n))
      |                                  ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:174:6: note: in expansion of macro ‘local64_cmpxchg’
  174 |  if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
      |      ^~~~~~~~~~~~~~~
../arch/x86/include/asm/cmpxchg.h:89:13: error: invalid type argument of unary ‘*’ (have ‘int’)
   89 |  __typeof__(*(ptr)) __new = (new);    \
      |             ^~~~~~
../arch/x86/include/asm/cmpxchg.h:140:2: note: in expansion of macro ‘__raw_cmpxchg’
  140 |  __raw_cmpxchg((ptr), (old), (new), (size), "")
      |  ^~~~~~~~~~~~~
../arch/x86/include/asm/cmpxchg.h:155:2: note: in expansion of macro ‘__cmpxchg_local’
  155 |  __cmpxchg_local(ptr, old, new, sizeof(*(ptr)))
      |  ^~~~~~~~~~~~~~~
../include/linux/atomic/atomic-instrumented.h:2051:2: note: in expansion of macro ‘arch_cmpxchg_local’
 2051 |  arch_cmpxchg_local(__ai_ptr, __VA_ARGS__); \
      |  ^~~~~~~~~~~~~~~~~~
../arch/x86/include/asm/local.h:124:3: note: in expansion of macro ‘cmpxchg_local’
  124 |  (cmpxchg_local(&((l)->a.counter), (o), (n)))
      |   ^~~~~~~~~~~~~
../include/asm-generic/local64.h:45:34: note: in expansion of macro ‘local_cmpxchg’
   45 | #define local64_cmpxchg(l, o, n) local_cmpxchg((&(l)->a), (o), (n))
      |                                  ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:174:6: note: in expansion of macro ‘local64_cmpxchg’
  174 |  if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
      |      ^~~~~~~~~~~~~~~
../arch/x86/include/asm/cmpxchg.h:155:40: error: invalid type argument of unary ‘*’ (have ‘int’)
  155 |  __cmpxchg_local(ptr, old, new, sizeof(*(ptr)))
      |                                        ^~~~~~
../arch/x86/include/asm/cmpxchg.h:90:10: note: in definition of macro ‘__raw_cmpxchg’
   90 |  switch (size) {       \
      |          ^~~~
../arch/x86/include/asm/cmpxchg.h:155:2: note: in expansion of macro ‘__cmpxchg_local’
  155 |  __cmpxchg_local(ptr, old, new, sizeof(*(ptr)))
      |  ^~~~~~~~~~~~~~~
../include/linux/atomic/atomic-instrumented.h:2051:2: note: in expansion of macro ‘arch_cmpxchg_local’
 2051 |  arch_cmpxchg_local(__ai_ptr, __VA_ARGS__); \
      |  ^~~~~~~~~~~~~~~~~~
../arch/x86/include/asm/local.h:124:3: note: in expansion of macro ‘cmpxchg_local’
  124 |  (cmpxchg_local(&((l)->a.counter), (o), (n)))
      |   ^~~~~~~~~~~~~
../include/asm-generic/local64.h:45:34: note: in expansion of macro ‘local_cmpxchg’
   45 | #define local64_cmpxchg(l, o, n) local_cmpxchg((&(l)->a), (o), (n))
      |                                  ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:174:6: note: in expansion of macro ‘local64_cmpxchg’
  174 |  if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
      |      ^~~~~~~~~~~~~~~
../arch/x86/include/asm/cmpxchg.h:93:24: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
   93 |   volatile u8 *__ptr = (volatile u8 *)(ptr);  \
      |                        ^
../arch/x86/include/asm/cmpxchg.h:140:2: note: in expansion of macro ‘__raw_cmpxchg’
  140 |  __raw_cmpxchg((ptr), (old), (new), (size), "")
      |  ^~~~~~~~~~~~~
../arch/x86/include/asm/cmpxchg.h:155:2: note: in expansion of macro ‘__cmpxchg_local’
  155 |  __cmpxchg_local(ptr, old, new, sizeof(*(ptr)))
      |  ^~~~~~~~~~~~~~~
../include/linux/atomic/atomic-instrumented.h:2051:2: note: in expansion of macro ‘arch_cmpxchg_local’
 2051 |  arch_cmpxchg_local(__ai_ptr, __VA_ARGS__); \
      |  ^~~~~~~~~~~~~~~~~~
../arch/x86/include/asm/local.h:124:3: note: in expansion of macro ‘cmpxchg_local’
  124 |  (cmpxchg_local(&((l)->a.counter), (o), (n)))
      |   ^~~~~~~~~~~~~
../include/asm-generic/local64.h:45:34: note: in expansion of macro ‘local_cmpxchg’
   45 | #define local64_cmpxchg(l, o, n) local_cmpxchg((&(l)->a), (o), (n))
      |                                  ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:174:6: note: in expansion of macro ‘local64_cmpxchg’
  174 |  if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
      |      ^~~~~~~~~~~~~~~
../arch/x86/include/asm/cmpxchg.h:102:25: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
  102 |   volatile u16 *__ptr = (volatile u16 *)(ptr);  \
      |                         ^
../arch/x86/include/asm/cmpxchg.h:140:2: note: in expansion of macro ‘__raw_cmpxchg’
  140 |  __raw_cmpxchg((ptr), (old), (new), (size), "")
      |  ^~~~~~~~~~~~~
../arch/x86/include/asm/cmpxchg.h:155:2: note: in expansion of macro ‘__cmpxchg_local’
  155 |  __cmpxchg_local(ptr, old, new, sizeof(*(ptr)))
      |  ^~~~~~~~~~~~~~~
../include/linux/atomic/atomic-instrumented.h:2051:2: note: in expansion of macro ‘arch_cmpxchg_local’
 2051 |  arch_cmpxchg_local(__ai_ptr, __VA_ARGS__); \
      |  ^~~~~~~~~~~~~~~~~~
../arch/x86/include/asm/local.h:124:3: note: in expansion of macro ‘cmpxchg_local’
  124 |  (cmpxchg_local(&((l)->a.counter), (o), (n)))
      |   ^~~~~~~~~~~~~
../include/asm-generic/local64.h:45:34: note: in expansion of macro ‘local_cmpxchg’
   45 | #define local64_cmpxchg(l, o, n) local_cmpxchg((&(l)->a), (o), (n))
      |                                  ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:174:6: note: in expansion of macro ‘local64_cmpxchg’
  174 |  if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
      |      ^~~~~~~~~~~~~~~
../arch/x86/include/asm/cmpxchg.h:111:25: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
  111 |   volatile u32 *__ptr = (volatile u32 *)(ptr);  \
      |                         ^
../arch/x86/include/asm/cmpxchg.h:140:2: note: in expansion of macro ‘__raw_cmpxchg’
  140 |  __raw_cmpxchg((ptr), (old), (new), (size), "")
      |  ^~~~~~~~~~~~~
../arch/x86/include/asm/cmpxchg.h:155:2: note: in expansion of macro ‘__cmpxchg_local’
  155 |  __cmpxchg_local(ptr, old, new, sizeof(*(ptr)))
      |  ^~~~~~~~~~~~~~~
../include/linux/atomic/atomic-instrumented.h:2051:2: note: in expansion of macro ‘arch_cmpxchg_local’
 2051 |  arch_cmpxchg_local(__ai_ptr, __VA_ARGS__); \
      |  ^~~~~~~~~~~~~~~~~~
../arch/x86/include/asm/local.h:124:3: note: in expansion of macro ‘cmpxchg_local’
  124 |  (cmpxchg_local(&((l)->a.counter), (o), (n)))
      |   ^~~~~~~~~~~~~
../include/asm-generic/local64.h:45:34: note: in expansion of macro ‘local_cmpxchg’
   45 | #define local64_cmpxchg(l, o, n) local_cmpxchg((&(l)->a), (o), (n))
      |                                  ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:174:6: note: in expansion of macro ‘local64_cmpxchg’
  174 |  if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
      |      ^~~~~~~~~~~~~~~
../arch/x86/include/asm/cmpxchg.h:120:25: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
  120 |   volatile u64 *__ptr = (volatile u64 *)(ptr);  \
      |                         ^
../arch/x86/include/asm/cmpxchg.h:140:2: note: in expansion of macro ‘__raw_cmpxchg’
  140 |  __raw_cmpxchg((ptr), (old), (new), (size), "")
      |  ^~~~~~~~~~~~~
../arch/x86/include/asm/cmpxchg.h:155:2: note: in expansion of macro ‘__cmpxchg_local’
  155 |  __cmpxchg_local(ptr, old, new, sizeof(*(ptr)))
      |  ^~~~~~~~~~~~~~~
../include/linux/atomic/atomic-instrumented.h:2051:2: note: in expansion of macro ‘arch_cmpxchg_local’
 2051 |  arch_cmpxchg_local(__ai_ptr, __VA_ARGS__); \
      |  ^~~~~~~~~~~~~~~~~~
../arch/x86/include/asm/local.h:124:3: note: in expansion of macro ‘cmpxchg_local’
  124 |  (cmpxchg_local(&((l)->a.counter), (o), (n)))
      |   ^~~~~~~~~~~~~
../include/asm-generic/local64.h:45:34: note: in expansion of macro ‘local_cmpxchg’
   45 | #define local64_cmpxchg(l, o, n) local_cmpxchg((&(l)->a), (o), (n))
      |                                  ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:174:6: note: in expansion of macro ‘local64_cmpxchg’
  174 |  if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
      |      ^~~~~~~~~~~~~~~
In file included from ./arch/x86/include/generated/asm/local64.h:1,
                 from ../include/linux/u64_stats_sync.h:71,
                 from ../include/linux/cgroup-defs.h:20,
                 from ../include/linux/cgroup.h:28,
                 from ../include/linux/perf_event.h:60,
                 from ../drivers/gpu/drm/xe/xe_pmu_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_pmu.h:9,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:18,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:12:
../drivers/gpu/drm/xe/xe_pmu.c:177:32: error: ‘struct perf_event’ has no member named ‘count’
  177 |  local64_add(new - prev, &event->count);
      |                                ^~
../include/asm-generic/local64.h:34:43: note: in definition of macro ‘local64_add’
   34 | #define local64_add(i,l) local_add((i),(&(l)->a))
      |                                           ^
In file included from ../include/asm-generic/local64.h:22,
                 from ./arch/x86/include/generated/asm/local64.h:1,
                 from ../include/linux/u64_stats_sync.h:71,
                 from ../include/linux/cgroup-defs.h:20,
                 from ../include/linux/cgroup.h:28,
                 from ../include/linux/perf_event.h:60,
                 from ../drivers/gpu/drm/xe/xe_pmu_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_pmu.h:9,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:18,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:12:
../drivers/gpu/drm/xe/xe_pmu.c: In function ‘xe_pmu_enable’:
../drivers/gpu/drm/xe/xe_pmu.c:187:20: error: ‘struct perf_event’ has no member named ‘hw’
  187 |  local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
      |                    ^~
../arch/x86/include/asm/local.h:17:43: note: in definition of macro ‘local_set’
   17 | #define local_set(l, i) atomic_long_set(&(l)->a, (i))
      |                                           ^
../drivers/gpu/drm/xe/xe_pmu.c:187:2: note: in expansion of macro ‘local64_set’
  187 |  local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
      |  ^~~~~~~~~~~
In file included from ../include/linux/list.h:5,
                 from ../include/drm/drm_drv.h:30,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:7:
../drivers/gpu/drm/xe/xe_pmu.c: In function ‘xe_pmu_event_start’:
../drivers/gpu/drm/xe/xe_pmu.c:193:21: error: ‘struct perf_event’ has no member named ‘pmu’
  193 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |                     ^~
../include/linux/container_of.h:19:26: note: in definition of macro ‘container_of’
   19 |  void *__mptr = (void *)(ptr);     \
      |                          ^~~
In file included from ../include/linux/container_of.h:5,
                 from ../include/linux/list.h:5,
                 from ../include/drm/drm_drv.h:30,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:7:
../drivers/gpu/drm/xe/xe_pmu.c:193:21: error: ‘struct perf_event’ has no member named ‘pmu’
  193 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |                     ^~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:2: note: in expansion of macro ‘static_assert’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |  ^~~~~~~~~~~~~
../include/linux/container_of.h:20:16: note: in expansion of macro ‘__same_type’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |                ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:193:3: note: in expansion of macro ‘container_of’
  193 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |   ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:193:21: error: ‘struct perf_event’ has no member named ‘pmu’
  193 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |                     ^~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:2: note: in expansion of macro ‘static_assert’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |  ^~~~~~~~~~~~~
../include/linux/container_of.h:21:9: note: in expansion of macro ‘__same_type’
   21 |         __same_type(*(ptr), void),   \
      |         ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:193:3: note: in expansion of macro ‘container_of’
  193 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |   ^~~~~~~~~~~~
./../include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
  338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:2: note: in expansion of macro ‘static_assert’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |  ^~~~~~~~~~~~~
../include/linux/container_of.h:20:16: note: in expansion of macro ‘__same_type’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |                ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:193:3: note: in expansion of macro ‘container_of’
  193 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |   ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:200:7: error: ‘struct perf_event’ has no member named ‘hw’
  200 |  event->hw.state = 0;
      |       ^~
../drivers/gpu/drm/xe/xe_pmu.c: In function ‘xe_pmu_event_stop’:
../drivers/gpu/drm/xe/xe_pmu.c:208:7: error: ‘struct perf_event’ has no member named ‘hw’
  208 |  event->hw.state = PERF_HES_STOPPED;
      |       ^~
../drivers/gpu/drm/xe/xe_pmu.c:208:20: error: ‘PERF_HES_STOPPED’ undeclared (first use in this function)
  208 |  event->hw.state = PERF_HES_STOPPED;
      |                    ^~~~~~~~~~~~~~~~
In file included from ../include/linux/list.h:5,
                 from ../include/drm/drm_drv.h:30,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:7:
../drivers/gpu/drm/xe/xe_pmu.c: In function ‘xe_pmu_event_add’:
../drivers/gpu/drm/xe/xe_pmu.c:214:21: error: ‘struct perf_event’ has no member named ‘pmu’
  214 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |                     ^~
../include/linux/container_of.h:19:26: note: in definition of macro ‘container_of’
   19 |  void *__mptr = (void *)(ptr);     \
      |                          ^~~
In file included from ../include/linux/container_of.h:5,
                 from ../include/linux/list.h:5,
                 from ../include/drm/drm_drv.h:30,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:7:
../drivers/gpu/drm/xe/xe_pmu.c:214:21: error: ‘struct perf_event’ has no member named ‘pmu’
  214 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |                     ^~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:2: note: in expansion of macro ‘static_assert’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |  ^~~~~~~~~~~~~
../include/linux/container_of.h:20:16: note: in expansion of macro ‘__same_type’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |                ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:214:3: note: in expansion of macro ‘container_of’
  214 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |   ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:214:21: error: ‘struct perf_event’ has no member named ‘pmu’
  214 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |                     ^~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:2: note: in expansion of macro ‘static_assert’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |  ^~~~~~~~~~~~~
../include/linux/container_of.h:21:9: note: in expansion of macro ‘__same_type’
   21 |         __same_type(*(ptr), void),   \
      |         ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:214:3: note: in expansion of macro ‘container_of’
  214 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |   ^~~~~~~~~~~~
./../include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
  338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:2: note: in expansion of macro ‘static_assert’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |  ^~~~~~~~~~~~~
../include/linux/container_of.h:20:16: note: in expansion of macro ‘__same_type’
   20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
      |                ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:214:3: note: in expansion of macro ‘container_of’
  214 |   container_of(event->pmu, typeof(*xe), pmu.base);
      |   ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c: In function ‘xe_pmu_cpu_offline’:
../drivers/gpu/drm/xe/xe_pmu.c:497:3: error: implicit declaration of function ‘perf_pmu_migrate_context’ [-Werror=implicit-function-declaration]
  497 |   perf_pmu_migrate_context(&pmu->base, cpu, target);
      |   ^~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c: At top level:
../drivers/gpu/drm/xe/xe_pmu.c:506:5: error: redefinition of ‘xe_pmu_init’
  506 | int xe_pmu_init(void)
      |     ^~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:18,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:12:
../drivers/gpu/drm/xe/xe_pmu.h:16:19: note: previous definition of ‘xe_pmu_init’ was here
   16 | static inline int xe_pmu_init(void) { return 0; }
      |                   ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c:523:6: error: redefinition of ‘xe_pmu_exit’
  523 | void xe_pmu_exit(void)
      |      ^~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:18,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:12:
../drivers/gpu/drm/xe/xe_pmu.h:17:20: note: previous definition of ‘xe_pmu_exit’ was here
   17 | static inline void xe_pmu_exit(void) {}
      |                    ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c: In function ‘xe_pmu_unregister’:
../drivers/gpu/drm/xe/xe_pmu.c:559:2: error: implicit declaration of function ‘perf_pmu_unregister’; did you mean ‘xe_pmu_unregister’? [-Werror=implicit-function-declaration]
  559 |  perf_pmu_unregister(&pmu->base);
      |  ^~~~~~~~~~~~~~~~~~~
      |  xe_pmu_unregister
../drivers/gpu/drm/xe/xe_pmu.c: At top level:
../drivers/gpu/drm/xe/xe_pmu.c:566:6: error: redefinition of ‘xe_pmu_register’
  566 | void xe_pmu_register(struct xe_pmu *pmu)
      |      ^~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:18,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/xe_pmu.c:12:
../drivers/gpu/drm/xe/xe_pmu.h:18:20: note: previous definition of ‘xe_pmu_register’ was here
   18 | static inline void xe_pmu_register(struct xe_pmu *pmu) {}
      |                    ^~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.c: In function ‘xe_pmu_register’:
../drivers/gpu/drm/xe/xe_pmu.c:610:8: error: implicit declaration of function ‘perf_pmu_register’; did you mean ‘xe_pmu_register’? [-Werror=implicit-function-declaration]
  610 |  ret = perf_pmu_register(&pmu->base, pmu->name, -1);
      |        ^~~~~~~~~~~~~~~~~
      |        xe_pmu_register
cc1: some warnings being treated as errors
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_pmu.o] Error 1
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:494: drivers/gpu/drm/xe] Error 2
make[4]: *** [../scripts/Makefile.build:494: drivers/gpu/drm] Error 2
make[3]: *** [../scripts/Makefile.build:494: drivers/gpu] Error 2
make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
make[1]: *** [/kernel/Makefile:2025: .] Error 2
make: *** [Makefile:226: __sub-make] Error 2

[04:50:59] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:51:03] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


