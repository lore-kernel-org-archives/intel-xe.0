Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAC7EE49AB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 06:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C788F10E060;
	Wed, 23 Aug 2023 06:27:09 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id D759610E060;
 Wed, 23 Aug 2023 06:27:07 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D3C92A7DFB;
 Wed, 23 Aug 2023 06:27:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Wed, 23 Aug 2023 06:27:07 -0000
Message-ID: <169277202786.16626.3833553038636290839@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230823054015.1427461-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230823054015.1427461-1-himal.prasad.ghimiray@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Support?=
 =?utf-8?q?ing_RAS_on_XE_=28rev3=29?=
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

Series: Supporting RAS on XE (rev3)
URL   : https://patchwork.freedesktop.org/series/122257/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_hw_error.c: In function ‘xe_assign_hw_err_regs’:
../drivers/gpu/drm/xe/xe_hw_error.c:188:52: error: ‘struct xe_device’ has no member named ‘hw_err_regs’
  188 |  const struct err_msg_cntr_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
      |                                                    ^~
../drivers/gpu/drm/xe/xe_hw_error.c:189:51: error: ‘struct xe_device’ has no member named ‘hw_err_regs’
  189 |  const struct err_msg_cntr_pair **err_stat_gt = xe->hw_err_regs.err_stat_gt;
      |                                                   ^~
../drivers/gpu/drm/xe/xe_hw_error.c: In function ‘xe_gt_hw_error_status_reg_handler’:
../drivers/gpu/drm/xe/xe_hw_error.c:227:26: error: ‘struct xe_device’ has no member named ‘hw_err_regs’
  227 |  err_regs = &gt_to_xe(gt)->hw_err_regs;
      |                          ^~
../drivers/gpu/drm/xe/xe_hw_error.c:248:20: error: dereferencing pointer to incomplete type ‘struct hardware_errors_regs’
  248 |  errstat = err_regs->err_stat_gt[hw_err];
      |                    ^~
../drivers/gpu/drm/xe/xe_hw_error.c: In function ‘xe_hw_error_source_handler’:
../drivers/gpu/drm/xe/xe_hw_error.c:361:30: error: ‘struct xe_device’ has no member named ‘hw_err_regs’
  361 |  err_regs = &tile_to_xe(tile)->hw_err_regs;
      |                              ^~
../drivers/gpu/drm/xe/xe_hw_error.c:362:20: error: dereferencing pointer to incomplete type ‘const struct hardware_errors_regs’
  362 |  errstat = err_regs->dev_err_stat[hw_err];
      |                    ^~
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_hw_error.o] Error 1
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:494: drivers/gpu/drm/xe] Error 2
make[4]: *** [../scripts/Makefile.build:494: drivers/gpu/drm] Error 2
make[3]: *** [../scripts/Makefile.build:494: drivers/gpu] Error 2
make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
make[1]: *** [/kernel/Makefile:2026: .] Error 2
make: *** [Makefile:226: __sub-make] Error 2

[06:26:44] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[06:26:49] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


