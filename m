Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3049EC46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 14:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21E710E04D;
	Mon, 18 Sep 2023 14:18:07 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 67A3B10E011;
 Mon, 18 Sep 2023 14:18:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6659AA0169;
 Mon, 18 Sep 2023 14:18:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Date: Mon, 18 Sep 2023 14:18:05 -0000
Message-ID: <169504668541.32417.7693288629226242288@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230918120229.338270-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20230918120229.338270-1-chaitanya.kumar.borah@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Use_com?=
 =?utf-8?q?mon_wrapper_to_get_step_name?=
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

Series: Use common wrapper to get step name
URL   : https://patchwork.freedesktop.org/series/123857/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[14:17:42] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:17:46] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/tests/xe_pci_test.c:13:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/tests/xe_rtp_test.c:16:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/tests/xe_wa_test.c:11:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_bb.c:9:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.c:17:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo_evict.c:9:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_debugfs.c:14:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_devcoredump.c:12:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_device.c:6:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_device_sysfs.c:12:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_dma_buf.c:18:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_exec.c:15:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_execlist.c:15:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_exec_queue.c:14:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_force_wake.c:6:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_ggtt.c:16:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_gt.c:14:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_gt_clock.c:10:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_gt_debugfs.c:11:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_gt_idle_sysfs.c:8:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_map.h:11,
                 from ../drivers/gpu/drm/xe/xe_vm.h:11,
                 from ../drivers/gpu/drm/xe/xe_trace.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_pagefault.c:22:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:8:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_map.h:11,
                 from ../drivers/gpu/drm/xe/xe_guc_ads.c:18:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_guc_ct.c:15:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_guc_debugfs.c:11:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_guc_hwconfig.c:11:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_map.h:11,
                 from ../drivers/gpu/drm/xe/xe_guc_log.c:12:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_guc_pc.c:15:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_guc_submit.c:17:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_hw_engine.c:13:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_hw_fence.c:12:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_step.c:6:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_huc.c:9:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_huc_debugfs.c:11:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_irq.c:14:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_lrc.c:14:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_mmio.c:17:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_mocs.c:10:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_pci.c:19:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_pm.c:15:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_map.h:11,
                 from ../drivers/gpu/drm/xe/xe_vm.h:11,
                 from ../drivers/gpu/drm/xe/xe_preempt_fence.c:11:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_reg_sr.c:19:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_pt.c:9:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_query.c:14:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_sa.c:13:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_map.h:11,
                 from ../drivers/gpu/drm/xe/xe_vm.h:11,
                 from ../drivers/gpu/drm/xe/xe_ring_ops.c:19:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_sched_job.c:11:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_step.c:258:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
  258 | const char *intel_get_step_name(struct drm_i915_private *i915)
      |                                        ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_step.c:258:13: error: conflicting types for ‘intel_get_step_name’
  258 | const char *intel_get_step_name(struct drm_i915_private *i915)
      |             ^~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_step.c:6:
../drivers/gpu/drm/xe/xe_step.h:20:13: note: previous declaration of ‘intel_get_step_name’ was here
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |             ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_step.c: In function ‘intel_get_step_name’:
../drivers/gpu/drm/xe/xe_step.c:260:26: error: dereferencing pointer to incomplete type ‘struct drm_i915_private’
  260 |  return xe_step_name(i915->info.step.display);
      |                          ^~
../drivers/gpu/drm/xe/xe_step.c:261:1: error: control reaches end of non-void function [-Werror=return-type]
  261 | }
      | ^
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_step.o] Error 1
make[7]: *** Waiting for unfinished jobs....
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_tile.c:8:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_map.h:11,
                 from ../drivers/gpu/drm/xe/xe_vm.h:11,
                 from ../drivers/gpu/drm/xe/xe_trace.h:21,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c:16:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:13:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_uc.c:8:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_uc_fw.c:14:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_wait_user_fence.c:13:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_map.h:11,
                 from ../drivers/gpu/drm/xe/xe_vm.h:11,
                 from ../drivers/gpu/drm/xe/xe_vm.c:6:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_wopcm.c:9:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_wa.c:17:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_map.h:11,
                 from ../drivers/gpu/drm/xe/xe_vm.h:11,
                 from ../drivers/gpu/drm/xe/xe_vm_madvise.c:14:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_migrate.c:18:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_assert.h:14,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_guc.c:14:
../drivers/gpu/drm/xe/xe_step.h:20:40: warning: ‘struct drm_i915_private’ declared inside parameter list will not be visible outside of this definition or declaration
   20 | const char *intel_get_step_name(struct drm_i915_private *i915);
      |                                        ^~~~~~~~~~~~~~~~
make[6]: *** [../scripts/Makefile.build:480: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:480: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:480: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:480: drivers] Error 2
make[2]: *** [/kernel/Makefile:2032: .] Error 2
make[1]: *** [/kernel/Makefile:234: __sub-make] Error 2
make: *** [Makefile:234: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


