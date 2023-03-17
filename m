Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87170C6FD1D
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 15:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3CE10E3CA;
	Fri, 17 Mar 2023 15:39:10 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3F21F10E3CA;
 Fri, 17 Mar 2023 15:39:07 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3A43EA0BCB;
 Fri, 17 Mar 2023 15:39:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Date: Fri, 17 Mar 2023 15:39:07 -0000
Message-ID: <167906754723.12997.9548476776376288628@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230317153531.1011865-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20230317153531.1011865-1-balasubramani.vivekanandan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe?=
 =?utf-8?q?=3A_Skip_XY=5FFAST=5FCOLOR_instruction_on_link_copy_engines_=28?=
 =?utf-8?q?rev5=29?=
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

Series: drm/xe: Skip XY_FAST_COLOR instruction on link copy engines (rev5)
URL   : https://patchwork.freedesktop.org/series/114751/
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

[15:38:39] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:38:43] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


