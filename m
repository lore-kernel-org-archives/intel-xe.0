Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD23C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 21:14:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A259110E40C;
	Mon, 27 Nov 2023 21:14:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B3A8810E3FA;
 Mon, 27 Nov 2023 21:14:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A5BBEAADE0;
 Mon, 27 Nov 2023 21:14:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Date: Mon, 27 Nov 2023 21:14:27 -0000
Message-ID: <170111966767.3004.13932528514962380041@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231127195856.4183070-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20231127195856.4183070-1-vinay.belgaumkar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe?=
 =?utf-8?q?=3A_Add_a_flag_that_can_disable_GuC_PM_=28rev3=29?=
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

Series: drm/xe: Add a flag that can disable GuC PM (rev3)
URL   : https://patchwork.freedesktop.org/series/126788/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_guc_pc.c: In function ‘xe_guc_pc_start’:
../drivers/gpu/drm/xe/xe_guc_pc.c:875:14: error: ‘struct intel_device_info’ has no member named ‘skip_guc_pc’
  875 |  if (xe->info.skip_guc_pc) {
      |              ^
../drivers/gpu/drm/xe/xe_guc_pc.c: In function ‘xe_guc_pc_stop’:
../drivers/gpu/drm/xe/xe_guc_pc.c:929:14: error: ‘struct intel_device_info’ has no member named ‘skip_guc_pc’
  929 |  if (xe->info.skip_guc_pc) {
      |              ^
../drivers/gpu/drm/xe/xe_guc_pc.c: In function ‘xe_guc_pc_fini’:
../drivers/gpu/drm/xe/xe_guc_pc.c:957:14: error: ‘struct intel_device_info’ has no member named ‘skip_guc_pc’
  957 |  if (xe->info.skip_guc_pc) {
      |              ^
../drivers/gpu/drm/xe/xe_guc_pc.c: In function ‘xe_guc_pc_init’:
../drivers/gpu/drm/xe/xe_guc_pc.c:982:14: error: ‘struct intel_device_info’ has no member named ‘skip_guc_pc’
  982 |  if (xe->info.skip_guc_pc)
      |              ^
make[7]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_guc_pc.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:480: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:480: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:480: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:480: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:1913: .] Error 2
make[1]: *** [/kernel/Makefile:234: __sub-make] Error 2
make: *** [Makefile:234: __sub-make] Error 2

[21:14:04] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[21:14:09] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


