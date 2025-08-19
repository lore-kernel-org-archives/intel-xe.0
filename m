Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394EECA0EEB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 16:35:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41BF10E207;
	Tue, 19 Aug 2025 16:35:52 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F35310E0C5;
 Tue, 19 Aug 2025 16:35:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_cgroups=3A_Add_support_for_pin?=
 =?utf-8?q?ned_device_memory?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Aug 2025 16:35:51 -0000
Message-ID: <175562135164.248501.2982832152832410994@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250819114932.597600-5-dev@lankhorst.se>
In-Reply-To: <20250819114932.597600-5-dev@lankhorst.se>
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

Series: cgroups: Add support for pinned device memory
URL   : https://patchwork.freedesktop.org/series/153134/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_bo.c: In function ‘xe_bo_unpin_user’:
../drivers/gpu/drm/xe/xe_bo.c:1709:17: error: implicit declaration of function ‘dmem_cgroup_unpin’; did you mean ‘mem_cgroup_init’? [-Werror=implicit-function-declaration]
 1709 |                 dmem_cgroup_unpin(bo->ttm.resource->css, xe_bo_size(bo));
      |                 ^~~~~~~~~~~~~~~~~
      |                 mem_cgroup_init
../drivers/gpu/drm/xe/xe_bo.c: In function ‘xe_bo_create_user’:
../drivers/gpu/drm/xe/xe_bo.c:2154:39: error: implicit declaration of function ‘dmem_cgroup_try_pin’; did you mean ‘mem_cgroup_tryget’? [-Werror=implicit-function-declaration]
 2154 |                                 ret = dmem_cgroup_try_pin(bo->ttm.resource->css, size);
      |                                       ^~~~~~~~~~~~~~~~~~~
      |                                       mem_cgroup_tryget
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/xe/xe_bo.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:556: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:556: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:556: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:556: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:2011: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[16:35:23] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:35:27] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


