Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326BEEB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 08:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024D710E57F;
	Thu, 20 Jul 2023 08:26:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A2B9A10E581;
 Thu, 20 Jul 2023 08:26:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A1C5EAADF5;
 Thu, 20 Jul 2023 08:26:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Thu, 20 Jul 2023 08:26:23 -0000
Message-ID: <168984158365.20753.14701492006053980681@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230720081038.24822-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230720081038.24822-1-niranjana.vishwanathapura@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/?=
 =?utf-8?q?pvc=3A_Add_Wa=5F16017236439?=
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

Series: drm/xe/pvc: Add Wa_16017236439
URL   : https://patchwork.freedesktop.org/series/121028/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[08:26:00] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:26:04] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
ERROR:root:../drivers/gpu/drm/xe/xe_migrate.c: In function ‘xe_migrate_init’:
../drivers/gpu/drm/xe/xe_migrate.c:347:56: error: ‘gt’ undeclared (first use in this function)
  347 |   u32 logical_mask = xe_hw_engine_migrate_logical_mask(gt);
      |                                                        ^~
../drivers/gpu/drm/xe/xe_migrate.c:347:56: note: each undeclared identifier is reported only once for each function it appears in
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_migrate.o] Error 1
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:494: drivers/gpu/drm/xe] Error 2
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [../scripts/Makefile.build:494: drivers/gpu/drm] Error 2
make[3]: *** [../scripts/Makefile.build:494: drivers/gpu] Error 2
make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/kernel/Makefile:2026: .] Error 2
make: *** [Makefile:226: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


