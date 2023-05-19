Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C18C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 11:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955C010E5ED;
	Fri, 19 May 2023 11:00:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E32DA10E5ED;
 Fri, 19 May 2023 11:00:33 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DF857AA917;
 Fri, 19 May 2023 11:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 19 May 2023 11:00:33 -0000
Message-ID: <168449403391.26994.4087944111468807149@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230519100126.668533-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230519100126.668533-1-zbigniew.kempczynski@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe?=
 =?utf-8?q?=3A_Use_milliseconds_instead_of_jiffies_in_uapi_for_user_fence?=
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

Series: drm/xe: Use milliseconds instead of jiffies in uapi for user fence
URL   : https://patchwork.freedesktop.org/series/118011/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_wait_user_fence.c: In function ‘xe_wait_user_fence_ioctl’:
../drivers/gpu/drm/xe/xe_wait_user_fence.c:159:3: error: expected ‘)’ before ‘return’
  159 |   return -EINVAL;
      |   ^~~~~~
../drivers/gpu/drm/xe/xe_wait_user_fence.c:158:5: note: to match this ‘(’
  158 |  if (XE_IOCTL_ERR(xe, args->timeout > UINT_MAX)
      |     ^
../drivers/gpu/drm/xe/xe_wait_user_fence.c:213:1: error: expected expression before ‘}’ token
  213 | }
      | ^
../drivers/gpu/drm/xe/xe_wait_user_fence.c:108:16: warning: unused variable ‘timeout’ [-Wunused-variable]
  108 |  unsigned long timeout;
      |                ^~~~~~~
../drivers/gpu/drm/xe/xe_wait_user_fence.c:213:1: error: control reaches end of non-void function [-Werror=return-type]
  213 | }
      | ^
At top level:
../drivers/gpu/drm/xe/xe_wait_user_fence.c:82:22: warning: ‘msecs_to_jiffies_timeout’ defined but not used [-Wunused-function]
   82 | static unsigned long msecs_to_jiffies_timeout(const unsigned int m)
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_wait_user_fence.c:17:12: warning: ‘do_compare’ defined but not used [-Wunused-function]
   17 | static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
      |            ^~~~~~~~~~
cc1: some warnings being treated as errors
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_wait_user_fence.o] Error 1
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:494: drivers/gpu/drm/xe] Error 2
make[4]: *** [../scripts/Makefile.build:494: drivers/gpu/drm] Error 2
make[3]: *** [../scripts/Makefile.build:494: drivers/gpu] Error 2
make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
make[1]: *** [/kernel/Makefile:2025: .] Error 2
make: *** [Makefile:226: __sub-make] Error 2

[11:00:06] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:00:10] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


