Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E77C77B75
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 08:38:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA1C10E1F8;
	Wed,  3 May 2023 08:38:48 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1406810E1F8;
 Wed,  3 May 2023 08:38:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 10E0CAADE4;
 Wed,  3 May 2023 08:38:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Date: Wed, 03 May 2023 08:38:47 -0000
Message-ID: <168310312706.9279.10022708354824267572@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230503083500.645848-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230503083500.645848-1-maarten.lankhorst@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Add_sup?=
 =?utf-8?q?port_for_DRM_cgroup_memory_accounting=2E?=
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

Series: Add support for DRM cgroup memory accounting.
URL   : https://patchwork.freedesktop.org/series/117225/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/tests/xe_pci_test.c:13:
../include/linux/cgroup_drm.h:51:16: warning: ‘struct drm_cgroup’ declared inside parameter list will not be visible outside of this definition or declaration
   51 |         struct drm_cgroup *drm_cg)
      |                ^~~~~~~~~~
../include/linux/cgroup_drm.h: In function ‘drmmcg_register_device’:
../include/linux/cgroup_drm.h:86:36: error: passing argument 2 of ‘drmcg_register_device’ from incompatible pointer type [-Werror=incompatible-pointer-types]
   86 |  return drmcg_register_device(dev, cgdev) ?:
      |                                    ^~~~~
      |                                    |
      |                                    struct drmcgroup_device *
../include/linux/cgroup_drm.h:51:28: note: expected ‘struct drm_cgroup *’ but argument is of type ‘struct drmcgroup_device *’
   51 |         struct drm_cgroup *drm_cg)
      |         ~~~~~~~~~~~~~~~~~~~^~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/tests/xe_pci_test.o] Error 1
make[7]: *** Waiting for unfinished jobs....
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:14,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_bo.c:6:
../include/linux/cgroup_drm.h:51:16: warning: ‘struct drm_cgroup’ declared inside parameter list will not be visible outside of this definition or declaration
   51 |         struct drm_cgroup *drm_cg)
      |                ^~~~~~~~~~
../include/linux/cgroup_drm.h: In function ‘drmmcg_register_device’:
../include/linux/cgroup_drm.h:86:36: error: passing argument 2 of ‘drmcg_register_device’ from incompatible pointer type [-Werror=incompatible-pointer-types]
   86 |  return drmcg_register_device(dev, cgdev) ?:
      |                                    ^~~~~
      |                                    |
      |                                    struct drmcgroup_device *
../include/linux/cgroup_drm.h:51:28: note: expected ‘struct drm_cgroup *’ but argument is of type ‘struct drmcgroup_device *’
   51 |         struct drm_cgroup *drm_cg)
      |         ~~~~~~~~~~~~~~~~~~~^~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:14,
                 from ../drivers/gpu/drm/xe/xe_bo.h:11,
                 from ../drivers/gpu/drm/xe/xe_bo_evict.c:8:
../include/linux/cgroup_drm.h:51:16: warning: ‘struct drm_cgroup’ declared inside parameter list will not be visible outside of this definition or declaration
   51 |         struct drm_cgroup *drm_cg)
      |                ^~~~~~~~~~
../include/linux/cgroup_drm.h: In function ‘drmmcg_register_device’:
../include/linux/cgroup_drm.h:86:36: error: passing argument 2 of ‘drmcg_register_device’ from incompatible pointer type [-Werror=incompatible-pointer-types]
   86 |  return drmcg_register_device(dev, cgdev) ?:
      |                                    ^~~~~
      |                                    |
      |                                    struct drmcgroup_device *
../include/linux/cgroup_drm.h:51:28: note: expected ‘struct drm_cgroup *’ but argument is of type ‘struct drmcgroup_device *’
   51 |         struct drm_cgroup *drm_cg)
      |         ~~~~~~~~~~~~~~~~~~~^~~~~~
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/xe_bb.c:9:
../include/linux/cgroup_drm.h:51:16: warning: ‘struct drm_cgroup’ declared inside parameter list will not be visible outside of this definition or declaration
   51 |         struct drm_cgroup *drm_cg)
      |                ^~~~~~~~~~
../include/linux/cgroup_drm.h: In function ‘drmmcg_register_device’:
../include/linux/cgroup_drm.h:86:36: error: passing argument 2 of ‘drmcg_register_device’ from incompatible pointer type [-Werror=incompatible-pointer-types]
   86 |  return drmcg_register_device(dev, cgdev) ?:
      |                                    ^~~~~
      |                                    |
      |                                    struct drmcgroup_device *
../include/linux/cgroup_drm.h:51:28: note: expected ‘struct drm_cgroup *’ but argument is of type ‘struct drmcgroup_device *’
   51 |         struct drm_cgroup *drm_cg)
      |         ~~~~~~~~~~~~~~~~~~~^~~~~~
cc1: some warnings being treated as errors
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_bb.o] Error 1
make[6]: *** Waiting for unfinished jobs....
cc1: some warnings being treated as errors
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/tests/xe_rtp_test.c:16:
../include/linux/cgroup_drm.h:51:16: warning: ‘struct drm_cgroup’ declared inside parameter list will not be visible outside of this definition or declaration
   51 |         struct drm_cgroup *drm_cg)
      |                ^~~~~~~~~~
../include/linux/cgroup_drm.h: In function ‘drmmcg_register_device’:
../include/linux/cgroup_drm.h:86:36: error: passing argument 2 of ‘drmcg_register_device’ from incompatible pointer type [-Werror=incompatible-pointer-types]
   86 |  return drmcg_register_device(dev, cgdev) ?:
      |                                    ^~~~~
      |                                    |
      |                                    struct drmcgroup_device *
../include/linux/cgroup_drm.h:51:28: note: expected ‘struct drm_cgroup *’ but argument is of type ‘struct drmcgroup_device *’
   51 |         struct drm_cgroup *drm_cg)
      |         ~~~~~~~~~~~~~~~~~~~^~~~~~
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_bo_evict.o] Error 1
In file included from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/tests/xe_wa_test.c:11:
../include/linux/cgroup_drm.h:51:16: warning: ‘struct drm_cgroup’ declared inside parameter list will not be visible outside of this definition or declaration
   51 |         struct drm_cgroup *drm_cg)
      |                ^~~~~~~~~~
../include/linux/cgroup_drm.h: In function ‘drmmcg_register_device’:
../include/linux/cgroup_drm.h:86:36: error: passing argument 2 of ‘drmcg_register_device’ from incompatible pointer type [-Werror=incompatible-pointer-types]
   86 |  return drmcg_register_device(dev, cgdev) ?:
      |                                    ^~~~~
      |                                    |
      |                                    struct drmcgroup_device *
../include/linux/cgroup_drm.h:51:28: note: expected ‘struct drm_cgroup *’ but argument is of type ‘struct drmcgroup_device *’
   51 |         struct drm_cgroup *drm_cg)
      |         ~~~~~~~~~~~~~~~~~~~^~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/tests/xe_wa_test.o] Error 1
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/tests/xe_rtp_test.o] Error 1
make[6]: *** [../scripts/Makefile.build:494: drivers/gpu/drm/xe/tests] Error 2
cc1: some warnings being treated as errors
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_bo.o] Error 1
make[5]: *** [../scripts/Makefile.build:494: drivers/gpu/drm/xe] Error 2
make[4]: *** [../scripts/Makefile.build:494: drivers/gpu/drm] Error 2
make[3]: *** [../scripts/Makefile.build:494: drivers/gpu] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/kernel/Makefile:2025: .] Error 2
make: *** [Makefile:226: __sub-make] Error 2

[08:38:24] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[08:38:28] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


