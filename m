Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE31C6FD1D
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 14:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8C510E3BB;
	Fri, 17 Mar 2023 14:37:08 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8F97C10E125;
 Fri, 17 Mar 2023 14:37:06 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8BA0BA0003;
 Fri, 17 Mar 2023 14:37:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mauro Carvalho Chehab" <mauro.chehab@linux.intel.com>
Date: Fri, 17 Mar 2023 14:37:06 -0000
Message-ID: <167906382656.12990.12037439939567976706@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <25959b6c92cae10f414e3fcbc881c4b2e272f3d8.1678873128.git.mchehab@kernel.org>
In-Reply-To: <25959b6c92cae10f414e3fcbc881c4b2e272f3d8.1678873128.git.mchehab@kernel.org>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/?=
 =?utf-8?q?xe-pci=3A_print_a_message_when_probing_a_device_=28rev2=29?=
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

Series: drm/xe/xe-pci: print a message when probing a device (rev2)
URL   : https://patchwork.freedesktop.org/series/115177/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:`.exit.text' referenced in section `.uml.exitcall.exit' of arch/um/drivers/virtio_uml.o: defined in discarded section `.exit.text' of arch/um/drivers/virtio_uml.o
/usr/bin/ld: drivers/gpu/drm/xe/display/intel_gmbus.o: in function `gmbus_func':
intel_gmbus.c:(.text+0xa): undefined reference to `i2c_bit_algo'
/usr/bin/ld: drivers/gpu/drm/xe/display/intel_gmbus.o: in function `gmbus_xfer':
intel_gmbus.c:(.text+0x14f7): undefined reference to `i2c_bit_algo'
collect2: error: ld returned 1 exit status
make[2]: *** [../scripts/Makefile.vmlinux:35: vmlinux] Error 1
make[1]: *** [/kernel/Makefile:1264: vmlinux] Error 2
make: *** [Makefile:242: __sub-make] Error 2

[14:36:38] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:36:43] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


