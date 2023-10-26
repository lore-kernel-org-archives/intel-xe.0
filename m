Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AFDC25B48
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 04:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C6610E75D;
	Thu, 26 Oct 2023 04:52:13 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 544C910E75D;
 Thu, 26 Oct 2023 04:52:11 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 53B3AA0BA8;
 Thu, 26 Oct 2023 04:52:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 26 Oct 2023 04:52:11 -0000
Message-ID: <169829593133.20471.7794951001242644903@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231026040213.1272993-1-matthew.brost@intel.com>
In-Reply-To: <20231026040213.1272993-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Refacto?=
 =?utf-8?q?r_VM_bind_code?=
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

Series: Refactor VM bind code
URL   : https://patchwork.freedesktop.org/series/125608/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_migrate.c:1253:
../drivers/gpu/drm/xe/tests/xe_migrate.c:91:14: error: initialization of ‘void (*)(struct xe_tile *, struct iosys_map *, void *, u32,  u32,  const struct xe_vm_pgtable_update *)’ {aka ‘void (*)(struct xe_tile *, struct iosys_map *, void *, unsigned int,  unsigned int,  const struct xe_vm_pgtable_update *)’} from incompatible pointer type ‘void (*)(struct xe_migrate_pt_update *, struct xe_tile *, struct iosys_map *, void *, u32,  u32,  const struct xe_vm_pgtable_update *)’ {aka ‘void (*)(struct xe_migrate_pt_update *, struct xe_tile *, struct iosys_map *, void *, unsigned int,  unsigned int,  const struct xe_vm_pgtable_update *)’} [-Werror=incompatible-pointer-types]
   91 |  .populate = sanity_populate_cb,
      |              ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_migrate.c:91:14: note: (near initialization for ‘sanity_ops.populate’)
../drivers/gpu/drm/xe/tests/xe_migrate.c: In function ‘test_pt_update’:
../drivers/gpu/drm/xe/tests/xe_migrate.c:239:10: error: too many arguments to function ‘xe_migrate_update_pgtables’
  239 |  fence = xe_migrate_update_pgtables(m, NULL, NULL, m->q, &update, 1,
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:1223:1: note: declared here
 1223 | xe_migrate_update_pgtables(struct xe_migrate *m,
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_migrate.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:480: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:480: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:480: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:480: drivers] Error 2
make[2]: *** [/kernel/Makefile:1913: .] Error 2
make[1]: *** [/kernel/Makefile:234: __sub-make] Error 2
make: *** [Makefile:234: __sub-make] Error 2

[04:51:47] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:51:51] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


