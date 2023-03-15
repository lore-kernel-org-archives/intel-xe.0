Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761F9C61DA4
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 18:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D96E10E301;
	Wed, 15 Mar 2023 18:28:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6EEA310E2E7;
 Wed, 15 Mar 2023 18:28:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5D456AA917;
 Wed, 15 Mar 2023 18:28:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 15 Mar 2023 18:28:27 -0000
Message-ID: <167890490737.19837.15807757207806537009@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230315182512.4018018-1-matthew.brost@intel.com>
In-Reply-To: <20230315182512.4018018-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Port_Xe?=
 =?utf-8?q?_to_use_GPUVA_and_implement_NULL_VM_binds?=
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

Series: Port Xe to use GPUVA and implement NULL VM binds
URL   : https://patchwork.freedesktop.org/series/115217/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_vm.c: In function ‘xe_vma_op_work_func’:
../drivers/gpu/drm/xe/xe_vm.c:2722:4: error: label at end of compound statement
 2722 |    default:
      |    ^~~~~~~
make[6]: *** [../scripts/Makefile.build:250: drivers/gpu/drm/xe/xe_vm.o] Error 1
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:500: drivers/gpu/drm/xe] Error 2
make[4]: *** [../scripts/Makefile.build:500: drivers/gpu/drm] Error 2
make[3]: *** [../scripts/Makefile.build:500: drivers/gpu] Error 2
make[2]: *** [../scripts/Makefile.build:500: drivers] Error 2
make[1]: *** [/kernel/Makefile:1992: .] Error 2
make: *** [Makefile:231: __sub-make] Error 2

[18:27:59] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:28:03] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


