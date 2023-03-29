Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7B2C74A5B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Mar 2023 18:09:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A92C10EBE9;
	Wed, 29 Mar 2023 18:09:03 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 34D9210E176;
 Wed, 29 Mar 2023 18:09:02 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 312F8AADE0;
 Wed, 29 Mar 2023 18:09:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Wed, 29 Mar 2023 18:09:02 -0000
Message-ID: <168011334219.23903.16651385836939909532@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230329173334.4015124-1-matthew.d.roper@intel.com>
In-Reply-To: <20230329173334.4015124-1-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Minor_b?=
 =?utf-8?q?atchbuffer_handling_fixes_=28rev2=29?=
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

Series: Minor batchbuffer handling fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/115812/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from /usr/include/stdlib.h:1013,
                 from ../arch/um/os-Linux/helper.c:6:
/usr/include/x86_64-linux-gnu/bits/stdlib-float.h: In function ‘atof’:
/usr/include/x86_64-linux-gnu/bits/stdlib-float.h:26:1: error: SSE register return with SSE disabled
   26 | {
      | ^
In file included from /usr/include/stdlib.h:1013,
                 from ../arch/um/os-Linux/irq.c:8:
/usr/include/x86_64-linux-gnu/bits/stdlib-float.h: In function ‘atof’:
/usr/include/x86_64-linux-gnu/bits/stdlib-float.h:26:1: error: SSE register return with SSE disabled
   26 | {
      | ^
In file included from /usr/include/stdlib.h:1013,
                 from ../arch/um/os-Linux/execvp.c:24:
/usr/include/x86_64-linux-gnu/bits/stdlib-float.h: In function ‘atof’:
/usr/include/x86_64-linux-gnu/bits/stdlib-float.h:26:1: error: SSE register return with SSE disabled
   26 | {
      | ^
In file included from /usr/include/stdlib.h:1013,
                 from ../arch/x86/um/os-Linux/registers.c:8:
/usr/include/x86_64-linux-gnu/bits/stdlib-float.h: In function ‘atof’:
/usr/include/x86_64-linux-gnu/bits/stdlib-float.h:26:1: error: SSE register return with SSE disabled
   26 | {
      | ^
In file included from /usr/include/stdlib.h:1013,
                 from ../arch/um/drivers/fd.c:7:
/usr/include/x86_64-linux-gnu/bits/stdlib-float.h: In function ‘atof’:
/usr/include/x86_64-linux-gnu/bits/stdlib-float.h:26:1: error: SSE register return with SSE disabled
   26 | {
      | ^
In file included from /usr/include/stdlib.h:1013,
                 from ../arch/um/os-Linux/file.c:8:
/usr/include/x86_64-linux-gnu/bits/stdlib-float.h: In function ‘atof’:
/usr/include/x86_64-linux-gnu/bits/stdlib-float.h:26:1: error: SSE register return with SSE disabled
   26 | {
      | ^
make[3]: *** [../scripts/Makefile.build:252: arch/um/os-Linux/execvp.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[4]: *** [../scripts/Makefile.build:252: arch/x86/um/os-Linux/registers.o] Error 1
make[3]: *** [../scripts/Makefile.build:494: arch/x86/um/os-Linux] Error 2
make[3]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:252: arch/um/os-Linux/irq.o] Error 1
make[3]: *** [../scripts/Makefile.build:252: arch/um/drivers/fd.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:252: arch/um/os-Linux/helper.o] Error 1
make[3]: *** [../scripts/Makefile.build:252: arch/um/os-Linux/file.o] Error 1
In file included from /usr/include/stdlib.h:1013,
                 from ../arch/um/os-Linux/skas/process.c:7:
/usr/include/x86_64-linux-gnu/bits/stdlib-float.h: In function ‘atof’:
/usr/include/x86_64-linux-gnu/bits/stdlib-float.h:26:1: error: SSE register return with SSE disabled
   26 | {
      | ^
make[4]: *** [../scripts/Makefile.build:252: arch/um/os-Linux/skas/process.o] Error 1
make[3]: *** [../scripts/Makefile.build:494: arch/um/os-Linux/skas] Error 2
make[2]: *** [../scripts/Makefile.build:494: arch/um/os-Linux] Error 2
make[2]: *** Waiting for unfinished jobs....
make[2]: *** [../scripts/Makefile.build:494: arch/um/drivers] Error 2
make[2]: *** [../scripts/Makefile.build:494: arch/x86/um] Error 2
In file included from /usr/include/stdlib.h:1013,
                 from arch/um/kernel/config.c:7:
/usr/include/x86_64-linux-gnu/bits/stdlib-float.h: In function ‘atof’:
/usr/include/x86_64-linux-gnu/bits/stdlib-float.h:26:1: error: SSE register return with SSE disabled
   26 | {
      | ^
make[3]: *** [../scripts/Makefile.build:252: arch/um/kernel/config.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [../scripts/Makefile.build:494: arch/um/kernel] Error 2
make[1]: *** [/kernel/Makefile:2025: .] Error 2
make: *** [Makefile:226: __sub-make] Error 2

[18:08:34] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:08:38] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


