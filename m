Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4E6CDE025
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 16:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD60110EBB6;
	Thu, 26 Sep 2024 16:58:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6788810E037;
 Thu, 26 Sep 2024 16:58:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/pmu=3A_PMU_interface_fo?=
 =?utf-8?q?r_Xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 16:58:08 -0000
Message-ID: <172736988841.1107989.14264951520385129422@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240925232159.2057581-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20240925232159.2057581-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe/pmu: PMU interface for Xe
URL   : https://patchwork.freedesktop.org/series/139121/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[16:57:34] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:57:38] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/tests/xe_pci_test.c:13:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_bb.c:9:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/tests/xe_rtp_test.c:16:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/tests/xe_wa_test.c:11:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_bo.c:6:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_bo_evict.c:8:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_devcoredump.c:14:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_device.c:6:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_device_sysfs.c:12:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_dma_buf.c:17:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_drm_client.c:13:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_exec.c:14:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_execlist.c:14:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_exec_queue.h:10,
                 from ../drivers/gpu/drm/xe/xe_exec_queue.c:6:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_force_wake.c:6:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_ggtt.c:19:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_gsc.c:17:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gsc_debugfs.c:11:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_gsc_proxy.c:17:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_gsc_submit.c:11:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt.c:6:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_gt_ccs_mode.c:9:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_gt_clock.c:12:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_gt_freq.c:16:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_gt_idle.c:8:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_gt_topology.h:9,
                 from ../drivers/gpu/drm/xe/xe_gt_mcr.h:10,
                 from ../drivers/gpu/drm/xe/xe_gt_mcr.c:6:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_gt_pagefault.c:16:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt_sysfs.c:13:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:9:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt_throttle.c:9:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_gt_topology.h:9,
                 from ../drivers/gpu/drm/xe/xe_gt_topology.c:6:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt.h:11,
                 from ../drivers/gpu/drm/xe/xe_guc.h:9,
                 from ../drivers/gpu/drm/xe/xe_guc.c:6:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc_ads.c:16:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc_db_mgr.c:13:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc_ct.c:19:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc_hwconfig.c:12:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc_id_mgr.c:11:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc_log.c:10:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc_pc.c:16:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc_submit.c:20:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_heci_gsc.c:11:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_hw_engine.c:15:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_hw_engine_group.c:8:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:10:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_hw_fence.c:11:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_huc.c:15:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/display/xe_display.h:9,
                 from ../drivers/gpu/drm/xe/xe_irq.c:12:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_lrc.c:18:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_mmio.h:9,
                 from ../drivers/gpu/drm/xe/xe_mmio.c:6:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_migrate.c:21:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_module.c:17:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_oa.c:21:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_mocs.c:9:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_pat.c:13:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/display/xe_display.h:9,
                 from ../drivers/gpu/drm/xe/xe_pci.c:18:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_pcode.c:13:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/display/xe_display.h:9,
                 from ../drivers/gpu/drm/xe/xe_pm.c:13:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_exec_queue.h:10,
                 from ../drivers/gpu/drm/xe/xe_preempt_fence.c:10:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_pt.c:11:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_query.c:16:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_reg_sr.c:18:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_reg_whitelist.c:12:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt.h:11,
                 from ../drivers/gpu/drm/xe/xe_rtp.c:12:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt.h:11,
                 from ../drivers/gpu/drm/xe/xe_ring_ops.c:16:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_sa.c:12:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_sched_job.c:12:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_step.c:10:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_sync.c:17:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_tile.c:8:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_tile.h:9,
                 from ../drivers/gpu/drm/xe/xe_tile_sysfs.c:11:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_trace.h:18,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_trace_guc.h:15,
                 from ../drivers/gpu/drm/xe/xe_trace_guc.c:8:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.h:15,
                 from ../drivers/gpu/drm/xe/xe_trace_bo.c:8:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_ttm_sys_mgr.c:15:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c:18:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:12:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_tuning.c:11:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_uc.c:8:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_vm.h:9,
                 from ../drivers/gpu/drm/xe/xe_vm.c:6:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_vram.c:14:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_uc_fw.c:12:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_vram_freq.c:8:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_wa.h:9,
                 from ../drivers/gpu/drm/xe/xe_wa.c:6:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_wait_user_fence.c:13:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_wopcm.c:9:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_hwmon.c:14:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_vm.h:9,
                 from ../drivers/gpu/drm/xe/xe_hmm.c:14:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_gt_sriov_vf.c:19:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
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
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc_relay.c:18:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_memirq.c:12:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt_sriov_pf.c:11:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_sriov.c:10:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c:9:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h:9,
                 from ../drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c:10:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_mmio.h:9,
                 from ../drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c:15:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:14:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c:10:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_pci_sriov.c:6:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c:8:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_lmtt.c:12:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_sriov_pf.c:8:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_debugfs.c:13:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_huc_debugfs.c:11:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:11:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/tests/xe_kunit_helpers.c:15:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c:13:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt_debugfs.c:13:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt_stats.c:10:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_guc_debugfs.c:11:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:21,
                 from ../drivers/gpu/drm/xe/xe_device.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt.h:11,
                 from ../drivers/gpu/drm/xe/xe_uc_debugfs.c:10:
../drivers/gpu/drm/xe/xe_pmu.h:25:6: warning: no previous prototype for ‘xe_pmu_suspend’ [-Wmissing-prototypes]
   25 | void xe_pmu_suspend(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:26:6: warning: no previous prototype for ‘xe_pmu_resume’ [-Wmissing-prototypes]
   26 | void xe_pmu_resume(struct xe_gt *gt) {}
      |      ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pmu.h:24:13: warning: ‘xe_pmu_unregister’ defined but not used [-Wunused-function]
   24 | static void xe_pmu_unregister(void *arg) {}
      |             ^~~~~~~~~~~~~~~~~
ld: drivers/gpu/drm/xe/xe_bo.o: in function `xe_pmu_suspend':
xe_bo.c:(.text+0x1320): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_bo.o: in function `xe_pmu_resume':
xe_bo.c:(.text+0x1330): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_bo_evict.o: in function `xe_pmu_suspend':
xe_bo_evict.c:(.text+0x0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_bo_evict.o: in function `xe_pmu_resume':
xe_bo_evict.c:(.text+0x10): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_devcoredump.o: in function `xe_pmu_suspend':
xe_devcoredump.c:(.text+0x4e0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_devcoredump.o: in function `xe_pmu_resume':
xe_devcoredump.c:(.text+0x4f0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_device.o: in function `xe_pmu_suspend':
xe_device.c:(.text+0xe40): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_device.o: in function `xe_pmu_resume':
xe_device.c:(.text+0xe50): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_device_sysfs.o: in function `xe_pmu_suspend':
xe_device_sysfs.c:(.text+0x160): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_device_sysfs.o: in function `xe_pmu_resume':
xe_device_sysfs.c:(.text+0x170): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_dma_buf.o: in function `xe_pmu_suspend':
xe_dma_buf.c:(.text+0x490): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_dma_buf.o: in function `xe_pmu_resume':
xe_dma_buf.c:(.text+0x4a0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_drm_client.o: in function `xe_pmu_suspend':
xe_drm_client.c:(.text+0x7c0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_drm_client.o: in function `xe_pmu_resume':
xe_drm_client.c:(.text+0x7d0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_exec.o: in function `xe_pmu_suspend':
xe_exec.c:(.text+0x20): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_exec.o: in function `xe_pmu_resume':
xe_exec.c:(.text+0x30): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_execlist.o: in function `xe_pmu_suspend':
xe_execlist.c:(.text+0xc10): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_execlist.o: in function `xe_pmu_resume':
xe_execlist.c:(.text+0xc20): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_exec_queue.o: in function `xe_pmu_suspend':
xe_exec_queue.c:(.text+0x6a0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_exec_queue.o: in function `xe_pmu_resume':
xe_exec_queue.c:(.text+0x6b0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_force_wake.o: in function `xe_pmu_suspend':
xe_force_wake.c:(.text+0xb0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_force_wake.o: in function `xe_pmu_resume':
xe_force_wake.c:(.text+0xc0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_ggtt.o: in function `xe_pmu_suspend':
xe_ggtt.c:(.text+0x4f0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_ggtt.o: in function `xe_pmu_resume':
xe_ggtt.c:(.text+0x500): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gsc.o: in function `xe_pmu_suspend':
xe_gsc.c:(.text+0xc40): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gsc.o: in function `xe_pmu_resume':
xe_gsc.c:(.text+0xc50): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gsc_debugfs.o: in function `xe_pmu_suspend':
xe_gsc_debugfs.c:(.text+0xb0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gsc_debugfs.o: in function `xe_pmu_resume':
xe_gsc_debugfs.c:(.text+0xc0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gsc_proxy.o: in function `xe_pmu_suspend':
xe_gsc_proxy.c:(.text+0x7e0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gsc_proxy.o: in function `xe_pmu_resume':
xe_gsc_proxy.c:(.text+0x7f0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gsc_submit.o: in function `xe_pmu_suspend':
xe_gsc_submit.c:(.text+0x0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gsc_submit.o: in function `xe_pmu_resume':
xe_gsc_submit.c:(.text+0x10): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt.o: in function `xe_pmu_suspend':
xe_gt.c:(.text+0x450): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt.o: in function `xe_pmu_resume':
xe_gt.c:(.text+0x460): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_ccs_mode.o: in function `xe_pmu_suspend':
xe_gt_ccs_mode.c:(.text+0x270): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_ccs_mode.o: in function `xe_pmu_resume':
xe_gt_ccs_mode.c:(.text+0x280): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_clock.o: in function `xe_pmu_suspend':
xe_gt_clock.c:(.text+0x0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_clock.o: in function `xe_pmu_resume':
xe_gt_clock.c:(.text+0x10): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_freq.o: in function `xe_pmu_suspend':
xe_gt_freq.c:(.text+0x540): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_freq.o: in function `xe_pmu_resume':
xe_gt_freq.c:(.text+0x550): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_idle.o: in function `xe_pmu_suspend':
xe_gt_idle.c:(.text+0x110): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_idle.o: in function `xe_pmu_resume':
xe_gt_idle.c:(.text+0x120): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_mcr.o: in function `xe_pmu_suspend':
xe_gt_mcr.c:(.text+0x520): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_mcr.o: in function `xe_pmu_resume':
xe_gt_mcr.c:(.text+0x530): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_pagefault.o: in function `xe_pmu_suspend':
xe_gt_pagefault.c:(.text+0xe00): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_pagefault.o: in function `xe_pmu_resume':
xe_gt_pagefault.c:(.text+0xe10): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sysfs.o: in function `xe_pmu_suspend':
xe_gt_sysfs.c:(.text+0x30): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sysfs.o: in function `xe_pmu_resume':
xe_gt_sysfs.c:(.text+0x40): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_throttle.o: in function `xe_pmu_suspend':
xe_gt_throttle.c:(.text+0x30): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_throttle.o: in function `xe_pmu_resume':
xe_gt_throttle.c:(.text+0x40): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o: in function `xe_pmu_suspend':
xe_gt_tlb_invalidation.c:(.text+0x540): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o: in function `xe_pmu_resume':
xe_gt_tlb_invalidation.c:(.text+0x550): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_topology.o: in function `xe_pmu_suspend':
xe_gt_topology.c:(.text+0x460): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_topology.o: in function `xe_pmu_resume':
xe_gt_topology.c:(.text+0x470): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_pmu_suspend':
xe_guc.c:(.text+0x7d0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_pmu_resume':
xe_guc.c:(.text+0x7e0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_guc_ads.o: in function `xe_pmu_suspend':
xe_guc_ads.c:(.text+0x7b0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_guc_ads.o: in function `xe_pmu_resume':
xe_guc_ads.c:(.text+0x7c0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_guc_ct.o: in function `xe_pmu_suspend':
xe_guc_ct.c:(.text+0x11e0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_guc_ct.o: in function `xe_pmu_resume':
xe_guc_ct.c:(.text+0x11f0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_guc_db_mgr.o: in function `xe_pmu_suspend':
xe_guc_db_mgr.c:(.text+0x590): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_guc_db_mgr.o: in function `xe_pmu_resume':
xe_guc_db_mgr.c:(.text+0x5a0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_guc_hwconfig.o: in function `xe_pmu_suspend':
xe_guc_hwconfig.c:(.text+0x0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_guc_hwconfig.o: in function `xe_pmu_resume':
xe_guc_hwconfig.c:(.text+0x10): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_guc_id_mgr.o: in function `xe_pmu_suspend':
xe_guc_id_mgr.c:(.text+0x5a0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_guc_id_mgr.o: in function `xe_pmu_resume':
xe_guc_id_mgr.c:(.text+0x5b0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_guc_log.o: in function `xe_pmu_suspend':
xe_guc_log.c:(.text+0x0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_guc_log.o: in function `xe_pmu_resume':
xe_guc_log.c:(.text+0x10): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_guc_pc.o: in function `xe_pmu_suspend':
xe_guc_pc.c:(.text+0x590): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_guc_pc.o: in function `xe_pmu_resume':
xe_guc_pc.c:(.text+0x5a0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_guc_submit.o: in function `xe_pmu_suspend':
xe_guc_submit.c:(.text+0x3430): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_guc_submit.o: in function `xe_pmu_resume':
xe_guc_submit.c:(.text+0x3440): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_heci_gsc.o: in function `xe_pmu_suspend':
xe_heci_gsc.c:(.text+0x30): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_heci_gsc.o: in function `xe_pmu_resume':
xe_heci_gsc.c:(.text+0x40): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_pmu_suspend':
xe_hw_engine.c:(.text+0x3f0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_pmu_resume':
xe_hw_engine.c:(.text+0x400): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.o: in function `xe_pmu_suspend':
xe_hw_engine_class_sysfs.c:(.text+0xa70): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.o: in function `xe_pmu_resume':
xe_hw_engine_class_sysfs.c:(.text+0xa80): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_hw_engine_group.o: in function `xe_pmu_suspend':
xe_hw_engine_group.c:(.text+0x170): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_hw_engine_group.o: in function `xe_pmu_resume':
xe_hw_engine_group.c:(.text+0x180): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_hw_fence.o: in function `xe_pmu_suspend':
xe_hw_fence.c:(.text+0x5c0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_hw_fence.o: in function `xe_pmu_resume':
xe_hw_fence.c:(.text+0x5d0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_huc.o: in function `xe_pmu_suspend':
xe_huc.c:(.text+0x0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_huc.o: in function `xe_pmu_resume':
xe_huc.c:(.text+0x10): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_irq.o: in function `xe_pmu_suspend':
xe_irq.c:(.text+0x1290): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_irq.o: in function `xe_pmu_resume':
xe_irq.c:(.text+0x12a0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_pmu_suspend':
xe_lrc.c:(.text+0x230): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_pmu_resume':
xe_lrc.c:(.text+0x240): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_migrate.o: in function `xe_pmu_suspend':
xe_migrate.c:(.text+0x22f0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_migrate.o: in function `xe_pmu_resume':
xe_migrate.c:(.text+0x2300): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_mmio.o: in function `xe_pmu_suspend':
xe_mmio.c:(.text+0x80): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_mmio.o: in function `xe_pmu_resume':
xe_mmio.c:(.text+0x90): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_mocs.o: in function `xe_pmu_suspend':
xe_mocs.c:(.text+0x1aa0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_mocs.o: in function `xe_pmu_resume':
xe_mocs.c:(.text+0x1ab0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_module.o: in function `xe_pmu_suspend':
xe_module.c:(.text+0x50): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_module.o: in function `xe_pmu_resume':
xe_module.c:(.text+0x60): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_oa.o: in function `xe_pmu_suspend':
xe_oa.c:(.text+0x3430): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_oa.o: in function `xe_pmu_resume':
xe_oa.c:(.text+0x3440): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_pat.o: in function `xe_pmu_suspend':
xe_pat.c:(.text+0xa10): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_pat.o: in function `xe_pmu_resume':
xe_pat.c:(.text+0xa20): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pmu_suspend':
xe_pci.c:(.text+0x1820): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pmu_resume':
xe_pci.c:(.text+0x1830): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_pcode.o: in function `xe_pmu_suspend':
xe_pcode.c:(.text+0x3a0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_pcode.o: in function `xe_pmu_resume':
xe_pcode.c:(.text+0x3b0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_pm.o: in function `xe_pmu_suspend':
xe_pm.c:(.text+0x280): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_pm.o: in function `xe_pmu_resume':
xe_pm.c:(.text+0x290): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_preempt_fence.o: in function `xe_pmu_suspend':
xe_preempt_fence.c:(.text+0x250): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_preempt_fence.o: in function `xe_pmu_resume':
xe_preempt_fence.c:(.text+0x260): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_pt.o: in function `xe_pmu_suspend':
xe_pt.c:(.text+0x2d90): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_pt.o: in function `xe_pmu_resume':
xe_pt.c:(.text+0x2da0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_query.o: in function `xe_pmu_suspend':
xe_query.c:(.text+0x1d40): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_query.o: in function `xe_pmu_resume':
xe_query.c:(.text+0x1d50): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_reg_sr.o: in function `xe_pmu_suspend':
xe_reg_sr.c:(.text+0xd0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_reg_sr.o: in function `xe_pmu_resume':
xe_reg_sr.c:(.text+0xe0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_reg_whitelist.o: in function `xe_pmu_suspend':
xe_reg_whitelist.c:(.text+0x10): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_reg_whitelist.o: in function `xe_pmu_resume':
xe_reg_whitelist.c:(.text+0x20): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_pmu_suspend':
xe_rtp.c:(.text+0x880): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_pmu_resume':
xe_rtp.c:(.text+0x890): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_ring_ops.o: in function `xe_pmu_suspend':
xe_ring_ops.c:(.text+0xd90): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_ring_ops.o: in function `xe_pmu_resume':
xe_ring_ops.c:(.text+0xda0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_sa.o: in function `xe_pmu_suspend':
xe_sa.c:(.text+0x60): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_sa.o: in function `xe_pmu_resume':
xe_sa.c:(.text+0x70): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_sched_job.o: in function `xe_pmu_suspend':
xe_sched_job.c:(.text+0x130): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_sched_job.o: in function `xe_pmu_resume':
xe_sched_job.c:(.text+0x140): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_step.o: in function `xe_pmu_suspend':
xe_step.c:(.text+0x0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_step.o: in function `xe_pmu_resume':
xe_step.c:(.text+0x10): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_sync.o: in function `xe_pmu_suspend':
xe_sync.c:(.text+0x450): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_sync.o: in function `xe_pmu_resume':
xe_sync.c:(.text+0x460): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_tile.o: in function `xe_pmu_suspend':
xe_tile.c:(.text+0x0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_tile.o: in function `xe_pmu_resume':
xe_tile.c:(.text+0x10): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_tile_sysfs.o: in function `xe_pmu_suspend':
xe_tile_sysfs.c:(.text+0x30): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_tile_sysfs.o: in function `xe_pmu_resume':
xe_tile_sysfs.c:(.text+0x40): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_trace.o: in function `xe_pmu_suspend':
xe_trace.c:(.text+0x1eb0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_trace.o: in function `xe_pmu_resume':
xe_trace.c:(.text+0x1ec0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_trace_bo.o: in function `xe_pmu_suspend':
xe_trace_bo.c:(.text+0x10d0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_trace_bo.o: in function `xe_pmu_resume':
xe_trace_bo.c:(.text+0x10e0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_trace_guc.o: in function `xe_pmu_suspend':
xe_trace_guc.c:(.text+0x8f0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_trace_guc.o: in function `xe_pmu_resume':
xe_trace_guc.c:(.text+0x900): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_ttm_sys_mgr.o: in function `xe_pmu_suspend':
xe_ttm_sys_mgr.c:(.text+0x270): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_ttm_sys_mgr.o: in function `xe_pmu_resume':
xe_ttm_sys_mgr.c:(.text+0x280): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_ttm_stolen_mgr.o: in function `xe_pmu_suspend':
xe_ttm_stolen_mgr.c:(.text+0x0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_ttm_stolen_mgr.o: in function `xe_pmu_resume':
xe_ttm_stolen_mgr.c:(.text+0x10): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_ttm_vram_mgr.o: in function `xe_pmu_suspend':
xe_ttm_vram_mgr.c:(.text+0xa20): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_ttm_vram_mgr.o: in function `xe_pmu_resume':
xe_ttm_vram_mgr.c:(.text+0xa30): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_tuning.o: in function `xe_pmu_suspend':
xe_tuning.c:(.text+0xa0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_tuning.o: in function `xe_pmu_resume':
xe_tuning.c:(.text+0xb0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_uc.o: in function `xe_pmu_suspend':
xe_uc.c:(.text+0x0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_uc.o: in function `xe_pmu_resume':
xe_uc.c:(.text+0x10): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_uc_fw.o: in function `xe_pmu_suspend':
xe_uc_fw.c:(.text+0x3f0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_uc_fw.o: in function `xe_pmu_resume':
xe_uc_fw.c:(.text+0x400): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_vm.o: in function `xe_pmu_suspend':
xe_vm.c:(.text+0x1d10): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_vm.o: in function `xe_pmu_resume':
xe_vm.c:(.text+0x1d20): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_vram.o: in function `xe_pmu_suspend':
xe_vram.c:(.text+0x2f0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_vram.o: in function `xe_pmu_resume':
xe_vram.c:(.text+0x300): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_vram_freq.o: in function `xe_pmu_suspend':
xe_vram_freq.c:(.text+0x110): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_vram_freq.o: in function `xe_pmu_resume':
xe_vram_freq.c:(.text+0x120): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_wait_user_fence.o: in function `xe_pmu_suspend':
xe_wait_user_fence.c:(.text+0x0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_wait_user_fence.o: in function `xe_pmu_resume':
xe_wait_user_fence.c:(.text+0x10): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_wa.o: in function `xe_pmu_suspend':
xe_wa.c:(.text+0x70): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_wa.o: in function `xe_pmu_resume':
xe_wa.c:(.text+0x80): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_wopcm.o: in function `xe_pmu_suspend':
xe_wopcm.c:(.text+0x0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_wopcm.o: in function `xe_pmu_resume':
xe_wopcm.c:(.text+0x10): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_hmm.o: in function `xe_pmu_suspend':
xe_hmm.c:(.text+0x0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_hmm.o: in function `xe_pmu_resume':
xe_hmm.c:(.text+0x10): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_hwmon.o: in function `xe_pmu_suspend':
xe_hwmon.c:(.text+0xec0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_hwmon.o: in function `xe_pmu_resume':
xe_hwmon.c:(.text+0xed0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sriov_vf.o: in function `xe_pmu_suspend':
xe_gt_sriov_vf.c:(.text+0x350): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sriov_vf.o: in function `xe_pmu_resume':
xe_gt_sriov_vf.c:(.text+0x360): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_guc_relay.o: in function `xe_pmu_suspend':
xe_guc_relay.c:(.text+0x2a10): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_guc_relay.o: in function `xe_pmu_resume':
xe_guc_relay.c:(.text+0x2a20): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_memirq.o: in function `xe_pmu_suspend':
xe_memirq.c:(.text+0x130): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_memirq.o: in function `xe_pmu_resume':
xe_memirq.c:(.text+0x140): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_sriov.o: in function `xe_pmu_suspend':
xe_sriov.c:(.text+0x30): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_sriov.o: in function `xe_pmu_resume':
xe_sriov.c:(.text+0x40): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sriov_pf.o: in function `xe_pmu_suspend':
xe_gt_sriov_pf.c:(.text+0x0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sriov_pf.o: in function `xe_pmu_resume':
xe_gt_sriov_pf.c:(.text+0x10): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.o: in function `xe_pmu_suspend':
xe_gt_sriov_pf_config.c:(.text+0x1a80): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.o: in function `xe_pmu_resume':
xe_gt_sriov_pf_config.c:(.text+0x1a90): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sriov_pf_control.o: in function `xe_pmu_suspend':
xe_gt_sriov_pf_control.c:(.text+0xeb0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sriov_pf_control.o: in function `xe_pmu_resume':
xe_gt_sriov_pf_control.c:(.text+0xec0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.o: in function `xe_pmu_suspend':
xe_gt_sriov_pf_migration.c:(.text+0x130): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.o: in function `xe_pmu_resume':
xe_gt_sriov_pf_migration.c:(.text+0x140): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.o: in function `xe_pmu_suspend':
xe_gt_sriov_pf_monitor.c:(.text+0x0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.o: in function `xe_pmu_resume':
xe_gt_sriov_pf_monitor.c:(.text+0x10): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.o: in function `xe_pmu_suspend':
xe_gt_sriov_pf_policy.c:(.text+0x7d0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.o: in function `xe_pmu_resume':
xe_gt_sriov_pf_policy.c:(.text+0x7e0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sriov_pf_service.o: in function `xe_pmu_suspend':
xe_gt_sriov_pf_service.c:(.text+0x1790): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sriov_pf_service.o: in function `xe_pmu_resume':
xe_gt_sriov_pf_service.c:(.text+0x17a0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_lmtt.o: in function `xe_pmu_suspend':
xe_lmtt.c:(.text+0xd10): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_lmtt.o: in function `xe_pmu_resume':
xe_lmtt.c:(.text+0xd20): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_pci_sriov.o: in function `xe_pmu_suspend':
xe_pci_sriov.c:(.text+0x280): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_pci_sriov.o: in function `xe_pmu_resume':
xe_pci_sriov.c:(.text+0x290): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_sriov_pf.o: in function `xe_pmu_suspend':
xe_sriov_pf.c:(.text+0x40): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_sriov_pf.o: in function `xe_pmu_resume':
xe_sriov_pf.c:(.text+0x50): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/tests/xe_kunit_helpers.o: in function `xe_pmu_suspend':
xe_kunit_helpers.c:(.text+0x430): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/tests/xe_kunit_helpers.o: in function `xe_pmu_resume':
xe_kunit_helpers.c:(.text+0x440): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_debugfs.o: in function `xe_pmu_suspend':
xe_debugfs.c:(.text+0xd90): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_debugfs.o: in function `xe_pmu_resume':
xe_debugfs.c:(.text+0xda0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_debugfs.o: in function `xe_pmu_suspend':
xe_gt_debugfs.c:(.text+0x8a0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_debugfs.o: in function `xe_pmu_resume':
xe_gt_debugfs.c:(.text+0x8b0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.o: in function `xe_pmu_suspend':
xe_gt_sriov_vf_debugfs.c:(.text+0x0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.o: in function `xe_pmu_resume':
xe_gt_sriov_vf_debugfs.c:(.text+0x10): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_stats.o: in function `xe_pmu_suspend':
xe_gt_stats.c:(.text+0x0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_stats.o: in function `xe_pmu_resume':
xe_gt_stats.c:(.text+0x10): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_guc_debugfs.o: in function `xe_pmu_suspend':
xe_guc_debugfs.c:(.text+0x160): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_guc_debugfs.o: in function `xe_pmu_resume':
xe_guc_debugfs.c:(.text+0x170): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_huc_debugfs.o: in function `xe_pmu_suspend':
xe_huc_debugfs.c:(.text+0xb0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_huc_debugfs.o: in function `xe_pmu_resume':
xe_huc_debugfs.c:(.text+0xc0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_uc_debugfs.o: in function `xe_pmu_suspend':
xe_uc_debugfs.c:(.text+0x0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_uc_debugfs.o: in function `xe_pmu_resume':
xe_uc_debugfs.c:(.text+0x10): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.o: in function `xe_pmu_suspend':
xe_gt_sriov_pf_debugfs.c:(.text+0x1320): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.o: in function `xe_pmu_resume':
xe_gt_sriov_pf_debugfs.c:(.text+0x1330): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/tests/xe_pci_test.o: in function `xe_pmu_suspend':
xe_pci_test.c:(.text+0x1c0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/tests/xe_pci_test.o: in function `xe_pmu_resume':
xe_pci_test.c:(.text+0x1d0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/tests/xe_rtp_test.o: in function `xe_pmu_suspend':
xe_rtp_test.c:(.text+0x8c0): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/tests/xe_rtp_test.o: in function `xe_pmu_resume':
xe_rtp_test.c:(.text+0x8d0): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
ld: drivers/gpu/drm/xe/tests/xe_wa_test.o: in function `xe_pmu_suspend':
xe_wa_test.c:(.text+0x640): multiple definition of `xe_pmu_suspend'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x60): first defined here
ld: drivers/gpu/drm/xe/tests/xe_wa_test.o: in function `xe_pmu_resume':
xe_wa_test.c:(.text+0x650): multiple definition of `xe_pmu_resume'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0x70): first defined here
make[3]: *** [../scripts/Makefile.vmlinux_o:62: vmlinux.o] Error 1
make[2]: *** [/kernel/Makefile:1138: vmlinux_o] Error 2
make[1]: *** [/kernel/Makefile:224: __sub-make] Error 2
make: *** [Makefile:224: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


