Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B39DC77B73
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 10:29:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5296E10E141;
	Tue, 30 May 2023 10:29:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8A2D110E141;
 Tue, 30 May 2023 10:29:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 86A0AA00E6;
 Tue, 30 May 2023 10:29:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Date: Tue, 30 May 2023 10:29:23 -0000
Message-ID: <168544256354.18933.12823793581661367359@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230530103421.2824622-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20230530103421.2824622-1-sujaritha.sundaresan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Adding_?=
 =?utf-8?q?throttle_reasons_sysfs_attributes?=
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

Series: Adding throttle reasons sysfs attributes
URL   : https://patchwork.freedesktop.org/series/118559/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_guc_pc.c:642:1: error: unknown type name ‘xe_reg_t’
  642 | xe_reg_t xe_gt_perf_limit_reasons_reg(struct xe_gt *gt)
      | ^~~~~~~~
In file included from ../drivers/gpu/drm/xe/regs/xe_gt_regs.h:9,
                 from ../drivers/gpu/drm/xe/xe_guc_pc.c:12:
../drivers/gpu/drm/xe/xe_guc_pc.c: In function ‘xe_gt_perf_limit_reasons_reg’:
../drivers/gpu/drm/xe/regs/xe_reg_defs.h:85:26: error: incompatible types when returning type ‘const struct xe_reg’ but ‘int’ was expected
   85 | #define XE_REG(r_, ...)  ((const struct xe_reg)XE_REG_INITIALIZER(r_, ##__VA_ARGS__))
      |                          ^
../drivers/gpu/drm/xe/regs/xe_gt_regs.h:387:39: note: in expansion of macro ‘XE_REG’
  387 | #define MTL_MEDIA_PERF_LIMIT_REASONS  XE_REG(0x138030)
      |                                       ^~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:645:24: note: in expansion of macro ‘MTL_MEDIA_PERF_LIMIT_REASONS’
  645 |                 return MTL_MEDIA_PERF_LIMIT_REASONS;
      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/regs/xe_reg_defs.h:85:26: error: incompatible types when returning type ‘const struct xe_reg’ but ‘int’ was expected
   85 | #define XE_REG(r_, ...)  ((const struct xe_reg)XE_REG_INITIALIZER(r_, ##__VA_ARGS__))
      |                          ^
../drivers/gpu/drm/xe/regs/xe_gt_regs.h:377:34: note: in expansion of macro ‘XE_REG’
  377 | #define GT0_PERF_LIMIT_REASONS   XE_REG(0x1381a8)
      |                                  ^~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:647:16: note: in expansion of macro ‘GT0_PERF_LIMIT_REASONS’
  647 |         return GT0_PERF_LIMIT_REASONS;
      |                ^~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c: At top level:
../drivers/gpu/drm/xe/xe_guc_pc.c:654:2: error: expected specifier-qualifier-list before ‘xe_reg_t’
  654 |  xe_reg_t (*reg32)(struct xe_gt *gt);
      |  ^~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:659:4: error: unknown type name ‘xe_reg_t’
  659 |    xe_reg_t reg32, u32 mask)
      |    ^~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c: In function ‘throttle_reason_bool_show’:
../drivers/gpu/drm/xe/xe_guc_pc.c:672:13: error: implicit declaration of function ‘xe_mmio_mask_read’; did you mean ‘xe_mmio_read8’? [-Werror=implicit-function-declaration]
  672 |  bool val = xe_mmio_mask_read(&gt->rps, t_attr->reg32(gt), t_attr->mask);
      |             ^~~~~~~~~~~~~~~~~
      |             xe_mmio_read8
../drivers/gpu/drm/xe/xe_guc_pc.c:672:34: error: ‘struct xe_gt’ has no member named ‘rps’
  672 |  bool val = xe_mmio_mask_read(&gt->rps, t_attr->reg32(gt), t_attr->mask);
      |                                  ^~
../drivers/gpu/drm/xe/xe_guc_pc.c:672:47: error: ‘struct xe_gt_bool_throttle_attr’ has no member named ‘reg32’
  672 |  bool val = xe_mmio_mask_read(&gt->rps, t_attr->reg32(gt), t_attr->mask);
      |                                               ^~
../drivers/gpu/drm/xe/xe_guc_pc.c:672:66: error: ‘struct xe_gt_bool_throttle_attr’ has no member named ‘mask’
  672 |  bool val = xe_mmio_mask_read(&gt->rps, t_attr->reg32(gt), t_attr->mask);
      |                                                                  ^~
../drivers/gpu/drm/xe/xe_guc_pc.c: At top level:
../drivers/gpu/drm/xe/xe_guc_pc.c:681:3: error: ‘struct xe_gt_bool_throttle_attr’ has no member named ‘reg32’
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |   ^~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:685:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  685 | static XE_GT_BOOL_ATTR_RO(throttle_reason_status, GT0_PERF_LIMIT_REASONS_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:11: warning: excess elements in struct initializer
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:685:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  685 | static XE_GT_BOOL_ATTR_RO(throttle_reason_status, GT0_PERF_LIMIT_REASONS_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:11: note: (near initialization for ‘attr_throttle_reason_status’)
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:685:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  685 | static XE_GT_BOOL_ATTR_RO(throttle_reason_status, GT0_PERF_LIMIT_REASONS_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:682:3: error: ‘struct xe_gt_bool_throttle_attr’ has no member named ‘mask’
  682 |  .mask = mask__, \
      |   ^~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:685:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  685 | static XE_GT_BOOL_ATTR_RO(throttle_reason_status, GT0_PERF_LIMIT_REASONS_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/regs/xe_gt_regs.h:378:40: warning: excess elements in struct initializer
  378 | #define   GT0_PERF_LIMIT_REASONS_MASK  0xde3
      |                                        ^~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:682:10: note: in definition of macro ‘XE_GT_BOOL_ATTR_RO’
  682 |  .mask = mask__, \
      |          ^~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:685:51: note: in expansion of macro ‘GT0_PERF_LIMIT_REASONS_MASK’
  685 | static XE_GT_BOOL_ATTR_RO(throttle_reason_status, GT0_PERF_LIMIT_REASONS_MASK);
      |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/regs/xe_gt_regs.h:378:40: note: (near initialization for ‘attr_throttle_reason_status’)
  378 | #define   GT0_PERF_LIMIT_REASONS_MASK  0xde3
      |                                        ^~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:682:10: note: in definition of macro ‘XE_GT_BOOL_ATTR_RO’
  682 |  .mask = mask__, \
      |          ^~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:685:51: note: in expansion of macro ‘GT0_PERF_LIMIT_REASONS_MASK’
  685 | static XE_GT_BOOL_ATTR_RO(throttle_reason_status, GT0_PERF_LIMIT_REASONS_MASK);
      |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:3: error: ‘struct xe_gt_bool_throttle_attr’ has no member named ‘reg32’
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |   ^~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:686:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  686 | static XE_GT_BOOL_ATTR_RO(throttle_reason_pl1, POWER_LIMIT_1_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:11: warning: excess elements in struct initializer
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:686:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  686 | static XE_GT_BOOL_ATTR_RO(throttle_reason_pl1, POWER_LIMIT_1_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:11: note: (near initialization for ‘attr_throttle_reason_pl1’)
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:686:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  686 | static XE_GT_BOOL_ATTR_RO(throttle_reason_pl1, POWER_LIMIT_1_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:682:3: error: ‘struct xe_gt_bool_throttle_attr’ has no member named ‘mask’
  682 |  .mask = mask__, \
      |   ^~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:686:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  686 | static XE_GT_BOOL_ATTR_RO(throttle_reason_pl1, POWER_LIMIT_1_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:21:2: warning: excess elements in struct initializer
   21 |  ((u32)(BIT(__n) +      \
      |  ^
../drivers/gpu/drm/xe/xe_guc_pc.c:682:10: note: in definition of macro ‘XE_GT_BOOL_ATTR_RO’
  682 |  .mask = mask__, \
      |          ^~~~~~
../drivers/gpu/drm/xe/regs/xe_gt_regs.h:385:32: note: in expansion of macro ‘REG_BIT’
  385 | #define   POWER_LIMIT_1_MASK   REG_BIT(10)
      |                                ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:686:48: note: in expansion of macro ‘POWER_LIMIT_1_MASK’
  686 | static XE_GT_BOOL_ATTR_RO(throttle_reason_pl1, POWER_LIMIT_1_MASK);
      |                                                ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:21:2: note: (near initialization for ‘attr_throttle_reason_pl1’)
   21 |  ((u32)(BIT(__n) +      \
      |  ^
../drivers/gpu/drm/xe/xe_guc_pc.c:682:10: note: in definition of macro ‘XE_GT_BOOL_ATTR_RO’
  682 |  .mask = mask__, \
      |          ^~~~~~
../drivers/gpu/drm/xe/regs/xe_gt_regs.h:385:32: note: in expansion of macro ‘REG_BIT’
  385 | #define   POWER_LIMIT_1_MASK   REG_BIT(10)
      |                                ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:686:48: note: in expansion of macro ‘POWER_LIMIT_1_MASK’
  686 | static XE_GT_BOOL_ATTR_RO(throttle_reason_pl1, POWER_LIMIT_1_MASK);
      |                                                ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:3: error: ‘struct xe_gt_bool_throttle_attr’ has no member named ‘reg32’
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |   ^~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:687:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  687 | static XE_GT_BOOL_ATTR_RO(throttle_reason_pl2, POWER_LIMIT_2_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:11: warning: excess elements in struct initializer
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:687:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  687 | static XE_GT_BOOL_ATTR_RO(throttle_reason_pl2, POWER_LIMIT_2_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:11: note: (near initialization for ‘attr_throttle_reason_pl2’)
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:687:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  687 | static XE_GT_BOOL_ATTR_RO(throttle_reason_pl2, POWER_LIMIT_2_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:682:3: error: ‘struct xe_gt_bool_throttle_attr’ has no member named ‘mask’
  682 |  .mask = mask__, \
      |   ^~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:687:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  687 | static XE_GT_BOOL_ATTR_RO(throttle_reason_pl2, POWER_LIMIT_2_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:21:2: warning: excess elements in struct initializer
   21 |  ((u32)(BIT(__n) +      \
      |  ^
../drivers/gpu/drm/xe/xe_guc_pc.c:682:10: note: in definition of macro ‘XE_GT_BOOL_ATTR_RO’
  682 |  .mask = mask__, \
      |          ^~~~~~
../drivers/gpu/drm/xe/regs/xe_gt_regs.h:386:32: note: in expansion of macro ‘REG_BIT’
  386 | #define   POWER_LIMIT_2_MASK   REG_BIT(11)
      |                                ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:687:48: note: in expansion of macro ‘POWER_LIMIT_2_MASK’
  687 | static XE_GT_BOOL_ATTR_RO(throttle_reason_pl2, POWER_LIMIT_2_MASK);
      |                                                ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:21:2: note: (near initialization for ‘attr_throttle_reason_pl2’)
   21 |  ((u32)(BIT(__n) +      \
      |  ^
../drivers/gpu/drm/xe/xe_guc_pc.c:682:10: note: in definition of macro ‘XE_GT_BOOL_ATTR_RO’
  682 |  .mask = mask__, \
      |          ^~~~~~
../drivers/gpu/drm/xe/regs/xe_gt_regs.h:386:32: note: in expansion of macro ‘REG_BIT’
  386 | #define   POWER_LIMIT_2_MASK   REG_BIT(11)
      |                                ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:687:48: note: in expansion of macro ‘POWER_LIMIT_2_MASK’
  687 | static XE_GT_BOOL_ATTR_RO(throttle_reason_pl2, POWER_LIMIT_2_MASK);
      |                                                ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:3: error: ‘struct xe_gt_bool_throttle_attr’ has no member named ‘reg32’
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |   ^~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:688:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  688 | static XE_GT_BOOL_ATTR_RO(throttle_reason_pl4, POWER_LIMIT_4_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:11: warning: excess elements in struct initializer
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:688:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  688 | static XE_GT_BOOL_ATTR_RO(throttle_reason_pl4, POWER_LIMIT_4_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:11: note: (near initialization for ‘attr_throttle_reason_pl4’)
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:688:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  688 | static XE_GT_BOOL_ATTR_RO(throttle_reason_pl4, POWER_LIMIT_4_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:682:3: error: ‘struct xe_gt_bool_throttle_attr’ has no member named ‘mask’
  682 |  .mask = mask__, \
      |   ^~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:688:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  688 | static XE_GT_BOOL_ATTR_RO(throttle_reason_pl4, POWER_LIMIT_4_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:21:2: warning: excess elements in struct initializer
   21 |  ((u32)(BIT(__n) +      \
      |  ^
../drivers/gpu/drm/xe/xe_guc_pc.c:682:10: note: in definition of macro ‘XE_GT_BOOL_ATTR_RO’
  682 |  .mask = mask__, \
      |          ^~~~~~
../drivers/gpu/drm/xe/regs/xe_gt_regs.h:384:32: note: in expansion of macro ‘REG_BIT’
  384 | #define   POWER_LIMIT_4_MASK   REG_BIT(8)
      |                                ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:688:48: note: in expansion of macro ‘POWER_LIMIT_4_MASK’
  688 | static XE_GT_BOOL_ATTR_RO(throttle_reason_pl4, POWER_LIMIT_4_MASK);
      |                                                ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:21:2: note: (near initialization for ‘attr_throttle_reason_pl4’)
   21 |  ((u32)(BIT(__n) +      \
      |  ^
../drivers/gpu/drm/xe/xe_guc_pc.c:682:10: note: in definition of macro ‘XE_GT_BOOL_ATTR_RO’
  682 |  .mask = mask__, \
      |          ^~~~~~
../drivers/gpu/drm/xe/regs/xe_gt_regs.h:384:32: note: in expansion of macro ‘REG_BIT’
  384 | #define   POWER_LIMIT_4_MASK   REG_BIT(8)
      |                                ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:688:48: note: in expansion of macro ‘POWER_LIMIT_4_MASK’
  688 | static XE_GT_BOOL_ATTR_RO(throttle_reason_pl4, POWER_LIMIT_4_MASK);
      |                                                ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:3: error: ‘struct xe_gt_bool_throttle_attr’ has no member named ‘reg32’
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |   ^~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:689:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  689 | static XE_GT_BOOL_ATTR_RO(throttle_reason_thermal, THERMAL_LIMIT_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:11: warning: excess elements in struct initializer
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:689:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  689 | static XE_GT_BOOL_ATTR_RO(throttle_reason_thermal, THERMAL_LIMIT_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:11: note: (near initialization for ‘attr_throttle_reason_thermal’)
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:689:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  689 | static XE_GT_BOOL_ATTR_RO(throttle_reason_thermal, THERMAL_LIMIT_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:682:3: error: ‘struct xe_gt_bool_throttle_attr’ has no member named ‘mask’
  682 |  .mask = mask__, \
      |   ^~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:689:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  689 | static XE_GT_BOOL_ATTR_RO(throttle_reason_thermal, THERMAL_LIMIT_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:21:2: warning: excess elements in struct initializer
   21 |  ((u32)(BIT(__n) +      \
      |  ^
../drivers/gpu/drm/xe/xe_guc_pc.c:682:10: note: in definition of macro ‘XE_GT_BOOL_ATTR_RO’
  682 |  .mask = mask__, \
      |          ^~~~~~
../drivers/gpu/drm/xe/regs/xe_gt_regs.h:380:32: note: in expansion of macro ‘REG_BIT’
  380 | #define   THERMAL_LIMIT_MASK   REG_BIT(1)
      |                                ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:689:52: note: in expansion of macro ‘THERMAL_LIMIT_MASK’
  689 | static XE_GT_BOOL_ATTR_RO(throttle_reason_thermal, THERMAL_LIMIT_MASK);
      |                                                    ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:21:2: note: (near initialization for ‘attr_throttle_reason_thermal’)
   21 |  ((u32)(BIT(__n) +      \
      |  ^
../drivers/gpu/drm/xe/xe_guc_pc.c:682:10: note: in definition of macro ‘XE_GT_BOOL_ATTR_RO’
  682 |  .mask = mask__, \
      |          ^~~~~~
../drivers/gpu/drm/xe/regs/xe_gt_regs.h:380:32: note: in expansion of macro ‘REG_BIT’
  380 | #define   THERMAL_LIMIT_MASK   REG_BIT(1)
      |                                ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:689:52: note: in expansion of macro ‘THERMAL_LIMIT_MASK’
  689 | static XE_GT_BOOL_ATTR_RO(throttle_reason_thermal, THERMAL_LIMIT_MASK);
      |                                                    ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:3: error: ‘struct xe_gt_bool_throttle_attr’ has no member named ‘reg32’
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |   ^~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:690:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  690 | static XE_GT_BOOL_ATTR_RO(throttle_reason_prochot, PROCHOT_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:11: warning: excess elements in struct initializer
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:690:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  690 | static XE_GT_BOOL_ATTR_RO(throttle_reason_prochot, PROCHOT_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:11: note: (near initialization for ‘attr_throttle_reason_prochot’)
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:690:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  690 | static XE_GT_BOOL_ATTR_RO(throttle_reason_prochot, PROCHOT_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:682:3: error: ‘struct xe_gt_bool_throttle_attr’ has no member named ‘mask’
  682 |  .mask = mask__, \
      |   ^~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:690:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  690 | static XE_GT_BOOL_ATTR_RO(throttle_reason_prochot, PROCHOT_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:21:2: warning: excess elements in struct initializer
   21 |  ((u32)(BIT(__n) +      \
      |  ^
../drivers/gpu/drm/xe/xe_guc_pc.c:682:10: note: in definition of macro ‘XE_GT_BOOL_ATTR_RO’
  682 |  .mask = mask__, \
      |          ^~~~~~
../drivers/gpu/drm/xe/regs/xe_gt_regs.h:379:27: note: in expansion of macro ‘REG_BIT’
  379 | #define   PROCHOT_MASK    REG_BIT(0)
      |                           ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:690:52: note: in expansion of macro ‘PROCHOT_MASK’
  690 | static XE_GT_BOOL_ATTR_RO(throttle_reason_prochot, PROCHOT_MASK);
      |                                                    ^~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:21:2: note: (near initialization for ‘attr_throttle_reason_prochot’)
   21 |  ((u32)(BIT(__n) +      \
      |  ^
../drivers/gpu/drm/xe/xe_guc_pc.c:682:10: note: in definition of macro ‘XE_GT_BOOL_ATTR_RO’
  682 |  .mask = mask__, \
      |          ^~~~~~
../drivers/gpu/drm/xe/regs/xe_gt_regs.h:379:27: note: in expansion of macro ‘REG_BIT’
  379 | #define   PROCHOT_MASK    REG_BIT(0)
      |                           ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:690:52: note: in expansion of macro ‘PROCHOT_MASK’
  690 | static XE_GT_BOOL_ATTR_RO(throttle_reason_prochot, PROCHOT_MASK);
      |                                                    ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:3: error: ‘struct xe_gt_bool_throttle_attr’ has no member named ‘reg32’
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |   ^~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:691:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  691 | static XE_GT_BOOL_ATTR_RO(throttle_reason_ratl, RATL_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:11: warning: excess elements in struct initializer
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:691:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  691 | static XE_GT_BOOL_ATTR_RO(throttle_reason_ratl, RATL_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:11: note: (near initialization for ‘attr_throttle_reason_ratl’)
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:691:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  691 | static XE_GT_BOOL_ATTR_RO(throttle_reason_ratl, RATL_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:682:3: error: ‘struct xe_gt_bool_throttle_attr’ has no member named ‘mask’
  682 |  .mask = mask__, \
      |   ^~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:691:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  691 | static XE_GT_BOOL_ATTR_RO(throttle_reason_ratl, RATL_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:21:2: warning: excess elements in struct initializer
   21 |  ((u32)(BIT(__n) +      \
      |  ^
../drivers/gpu/drm/xe/xe_guc_pc.c:682:10: note: in definition of macro ‘XE_GT_BOOL_ATTR_RO’
  682 |  .mask = mask__, \
      |          ^~~~~~
../drivers/gpu/drm/xe/regs/xe_gt_regs.h:381:24: note: in expansion of macro ‘REG_BIT’
  381 | #define   RATL_MASK    REG_BIT(5)
      |                        ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:691:49: note: in expansion of macro ‘RATL_MASK’
  691 | static XE_GT_BOOL_ATTR_RO(throttle_reason_ratl, RATL_MASK);
      |                                                 ^~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:21:2: note: (near initialization for ‘attr_throttle_reason_ratl’)
   21 |  ((u32)(BIT(__n) +      \
      |  ^
../drivers/gpu/drm/xe/xe_guc_pc.c:682:10: note: in definition of macro ‘XE_GT_BOOL_ATTR_RO’
  682 |  .mask = mask__, \
      |          ^~~~~~
../drivers/gpu/drm/xe/regs/xe_gt_regs.h:381:24: note: in expansion of macro ‘REG_BIT’
  381 | #define   RATL_MASK    REG_BIT(5)
      |                        ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:691:49: note: in expansion of macro ‘RATL_MASK’
  691 | static XE_GT_BOOL_ATTR_RO(throttle_reason_ratl, RATL_MASK);
      |                                                 ^~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:3: error: ‘struct xe_gt_bool_throttle_attr’ has no member named ‘reg32’
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |   ^~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:692:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  692 | static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_thermalert, VR_THERMALERT_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:11: warning: excess elements in struct initializer
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:692:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  692 | static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_thermalert, VR_THERMALERT_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:11: note: (near initialization for ‘attr_throttle_reason_vr_thermalert’)
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:692:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  692 | static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_thermalert, VR_THERMALERT_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:682:3: error: ‘struct xe_gt_bool_throttle_attr’ has no member named ‘mask’
  682 |  .mask = mask__, \
      |   ^~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:692:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  692 | static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_thermalert, VR_THERMALERT_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:21:2: warning: excess elements in struct initializer
   21 |  ((u32)(BIT(__n) +      \
      |  ^
../drivers/gpu/drm/xe/xe_guc_pc.c:682:10: note: in definition of macro ‘XE_GT_BOOL_ATTR_RO’
  682 |  .mask = mask__, \
      |          ^~~~~~
../drivers/gpu/drm/xe/regs/xe_gt_regs.h:382:32: note: in expansion of macro ‘REG_BIT’
  382 | #define   VR_THERMALERT_MASK   REG_BIT(6)
      |                                ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:692:58: note: in expansion of macro ‘VR_THERMALERT_MASK’
  692 | static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_thermalert, VR_THERMALERT_MASK);
      |                                                          ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:21:2: note: (near initialization for ‘attr_throttle_reason_vr_thermalert’)
   21 |  ((u32)(BIT(__n) +      \
      |  ^
../drivers/gpu/drm/xe/xe_guc_pc.c:682:10: note: in definition of macro ‘XE_GT_BOOL_ATTR_RO’
  682 |  .mask = mask__, \
      |          ^~~~~~
../drivers/gpu/drm/xe/regs/xe_gt_regs.h:382:32: note: in expansion of macro ‘REG_BIT’
  382 | #define   VR_THERMALERT_MASK   REG_BIT(6)
      |                                ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:692:58: note: in expansion of macro ‘VR_THERMALERT_MASK’
  692 | static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_thermalert, VR_THERMALERT_MASK);
      |                                                          ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:3: error: ‘struct xe_gt_bool_throttle_attr’ has no member named ‘reg32’
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |   ^~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:693:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  693 | static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_tdc, VR_TDC_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:11: warning: excess elements in struct initializer
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:693:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  693 | static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_tdc, VR_TDC_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:681:11: note: (near initialization for ‘attr_throttle_reason_vr_tdc’)
  681 |  .reg32 = xe_gt_perf_limit_reasons_reg, \
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:693:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  693 | static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_tdc, VR_TDC_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:682:3: error: ‘struct xe_gt_bool_throttle_attr’ has no member named ‘mask’
  682 |  .mask = mask__, \
      |   ^~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:693:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  693 | static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_tdc, VR_TDC_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:21:2: warning: excess elements in struct initializer
   21 |  ((u32)(BIT(__n) +      \
      |  ^
../drivers/gpu/drm/xe/xe_guc_pc.c:682:10: note: in definition of macro ‘XE_GT_BOOL_ATTR_RO’
  682 |  .mask = mask__, \
      |          ^~~~~~
../drivers/gpu/drm/xe/regs/xe_gt_regs.h:383:26: note: in expansion of macro ‘REG_BIT’
  383 | #define   VR_TDC_MASK    REG_BIT(7)
      |                          ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:693:51: note: in expansion of macro ‘VR_TDC_MASK’
  693 | static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_tdc, VR_TDC_MASK);
      |                                                   ^~~~~~~~~~~
../drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:21:2: note: (near initialization for ‘attr_throttle_reason_vr_tdc’)
   21 |  ((u32)(BIT(__n) +      \
      |  ^
../drivers/gpu/drm/xe/xe_guc_pc.c:682:10: note: in definition of macro ‘XE_GT_BOOL_ATTR_RO’
  682 |  .mask = mask__, \
      |          ^~~~~~
../drivers/gpu/drm/xe/regs/xe_gt_regs.h:383:26: note: in expansion of macro ‘REG_BIT’
  383 | #define   VR_TDC_MASK    REG_BIT(7)
      |                          ^~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:693:51: note: in expansion of macro ‘VR_TDC_MASK’
  693 | static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_tdc, VR_TDC_MASK);
      |                                                   ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:696:3: error: ‘dev_attr_throttle_reason_status’ undeclared here (not in a function); did you mean ‘attr_throttle_reason_status’?
  696 |  &dev_attr_throttle_reason_status.attr,
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |   attr_throttle_reason_status
../drivers/gpu/drm/xe/xe_guc_pc.c:697:3: error: ‘dev_attr_throttle_reason_pl1’ undeclared here (not in a function); did you mean ‘attr_throttle_reason_pl1’?
  697 |  &dev_attr_throttle_reason_pl1.attr,
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |   attr_throttle_reason_pl1
../drivers/gpu/drm/xe/xe_guc_pc.c:698:3: error: ‘dev_attr_throttle_reason_pl2’ undeclared here (not in a function); did you mean ‘attr_throttle_reason_pl2’?
  698 |  &dev_attr_throttle_reason_pl2.attr,
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |   attr_throttle_reason_pl2
../drivers/gpu/drm/xe/xe_guc_pc.c:699:3: error: ‘dev_attr_throttle_reason_pl4’ undeclared here (not in a function); did you mean ‘attr_throttle_reason_pl4’?
  699 |  &dev_attr_throttle_reason_pl4.attr,
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |   attr_throttle_reason_pl4
../drivers/gpu/drm/xe/xe_guc_pc.c:700:3: error: ‘dev_attr_throttle_reason_thermal’ undeclared here (not in a function); did you mean ‘attr_throttle_reason_thermal’?
  700 |  &dev_attr_throttle_reason_thermal.attr,
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |   attr_throttle_reason_thermal
../drivers/gpu/drm/xe/xe_guc_pc.c:701:3: error: ‘dev_attr_throttle_reason_prochot’ undeclared here (not in a function); did you mean ‘attr_throttle_reason_prochot’?
  701 |  &dev_attr_throttle_reason_prochot.attr,
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |   attr_throttle_reason_prochot
../drivers/gpu/drm/xe/xe_guc_pc.c:702:3: error: ‘dev_attr_throttle_reason_ratl’ undeclared here (not in a function); did you mean ‘attr_throttle_reason_ratl’?
  702 |  &dev_attr_throttle_reason_ratl.attr,
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |   attr_throttle_reason_ratl
../drivers/gpu/drm/xe/xe_guc_pc.c:703:3: error: ‘dev_attr_throttle_reason_vr_thermalert’ undeclared here (not in a function); did you mean ‘attr_throttle_reason_vr_thermalert’?
  703 |  &dev_attr_throttle_reason_vr_thermalert.attr,
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |   attr_throttle_reason_vr_thermalert
../drivers/gpu/drm/xe/xe_guc_pc.c:704:3: error: ‘dev_attr_throttle_reason_vr_tdc’ undeclared here (not in a function); did you mean ‘attr_throttle_reason_vr_tdc’?
  704 |  &dev_attr_throttle_reason_vr_tdc.attr,
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |   attr_throttle_reason_vr_tdc
../drivers/gpu/drm/xe/xe_guc_pc.c:695:32: warning: ‘throttle_reason_attrs’ defined but not used [-Wunused-variable]
  695 | static const struct attribute *throttle_reason_attrs[] = {
      |                                ^~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:678:33: warning: ‘attr_throttle_reason_vr_tdc’ defined but not used [-Wunused-variable]
  678 | struct xe_gt_bool_throttle_attr attr_##sysfs_func__ = { \
      |                                 ^~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:693:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  693 | static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_tdc, VR_TDC_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:678:33: warning: ‘attr_throttle_reason_vr_thermalert’ defined but not used [-Wunused-variable]
  678 | struct xe_gt_bool_throttle_attr attr_##sysfs_func__ = { \
      |                                 ^~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:692:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  692 | static XE_GT_BOOL_ATTR_RO(throttle_reason_vr_thermalert, VR_THERMALERT_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:678:33: warning: ‘attr_throttle_reason_ratl’ defined but not used [-Wunused-variable]
  678 | struct xe_gt_bool_throttle_attr attr_##sysfs_func__ = { \
      |                                 ^~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:691:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  691 | static XE_GT_BOOL_ATTR_RO(throttle_reason_ratl, RATL_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:678:33: warning: ‘attr_throttle_reason_prochot’ defined but not used [-Wunused-variable]
  678 | struct xe_gt_bool_throttle_attr attr_##sysfs_func__ = { \
      |                                 ^~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:690:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  690 | static XE_GT_BOOL_ATTR_RO(throttle_reason_prochot, PROCHOT_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:678:33: warning: ‘attr_throttle_reason_thermal’ defined but not used [-Wunused-variable]
  678 | struct xe_gt_bool_throttle_attr attr_##sysfs_func__ = { \
      |                                 ^~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:689:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  689 | static XE_GT_BOOL_ATTR_RO(throttle_reason_thermal, THERMAL_LIMIT_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:678:33: warning: ‘attr_throttle_reason_pl4’ defined but not used [-Wunused-variable]
  678 | struct xe_gt_bool_throttle_attr attr_##sysfs_func__ = { \
      |                                 ^~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:688:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  688 | static XE_GT_BOOL_ATTR_RO(throttle_reason_pl4, POWER_LIMIT_4_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:678:33: warning: ‘attr_throttle_reason_pl2’ defined but not used [-Wunused-variable]
  678 | struct xe_gt_bool_throttle_attr attr_##sysfs_func__ = { \
      |                                 ^~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:687:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  687 | static XE_GT_BOOL_ATTR_RO(throttle_reason_pl2, POWER_LIMIT_2_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:678:33: warning: ‘attr_throttle_reason_pl1’ defined but not used [-Wunused-variable]
  678 | struct xe_gt_bool_throttle_attr attr_##sysfs_func__ = { \
      |                                 ^~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:686:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  686 | static XE_GT_BOOL_ATTR_RO(throttle_reason_pl1, POWER_LIMIT_1_MASK);
      |        ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:678:33: warning: ‘attr_throttle_reason_status’ defined but not used [-Wunused-variable]
  678 | struct xe_gt_bool_throttle_attr attr_##sysfs_func__ = { \
      |                                 ^~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:685:8: note: in expansion of macro ‘XE_GT_BOOL_ATTR_RO’
  685 | static XE_GT_BOOL_ATTR_RO(throttle_reason_status, GT0_PERF_LIMIT_REASONS_MASK);
      |        ^~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_guc_pc.o] Error 1
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:494: drivers/gpu/drm/xe] Error 2
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [../scripts/Makefile.build:494: drivers/gpu/drm] Error 2
make[3]: *** [../scripts/Makefile.build:494: drivers/gpu] Error 2
make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/kernel/Makefile:2025: .] Error 2
make: *** [Makefile:226: __sub-make] Error 2

[10:29:00] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:29:04] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


