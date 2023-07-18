Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547F7C0015E
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 15:17:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E9910E36B;
	Tue, 18 Jul 2023 15:17:07 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 515F210E36C;
 Tue, 18 Jul 2023 15:17:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4E948AADEC;
 Tue, 18 Jul 2023 15:17:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Tue, 18 Jul 2023 15:17:05 -0000
Message-ID: <168969342531.22204.3381406496243488231@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230718132646.3079349-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230718132646.3079349-1-himal.prasad.ghimiray@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Notify_?=
 =?utf-8?q?userspace_about_uevent_failure?=
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

Series: Notify userspace about uevent failure
URL   : https://patchwork.freedesktop.org/series/120918/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_debugfs.c:8:
../include/linux/fault-inject.h:94:1: error: unknown type name ‘bool’
   94 | bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order);
      | ^~~~
../include/linux/fault-inject.h:94:29: error: unknown type name ‘gfp_t’
   94 | bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order);
      |                             ^~~~~
../include/linux/fault-inject.h:96:43: error: unknown type name ‘gfp_t’
   96 | int should_failslab(struct kmem_cache *s, gfp_t gfpflags);
      |                                           ^~~~~
../include/linux/fault-inject.h:100:15: error: unknown type name ‘bool’
  100 | static inline bool __should_failslab(struct kmem_cache *s, gfp_t gfpflags)
      |               ^~~~
../include/linux/fault-inject.h:100:60: error: unknown type name ‘gfp_t’
  100 | static inline bool __should_failslab(struct kmem_cache *s, gfp_t gfpflags)
      |                                                            ^~~~~
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_debugfs.o] Error 1
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:494: drivers/gpu/drm/xe] Error 2
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [../scripts/Makefile.build:494: drivers/gpu/drm] Error 2
make[3]: *** [../scripts/Makefile.build:494: drivers/gpu] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/kernel/Makefile:2026: .] Error 2
make: *** [Makefile:226: __sub-make] Error 2

[15:16:42] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[15:16:46] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


