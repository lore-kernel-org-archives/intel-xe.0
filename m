Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82BFC27C5E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 13:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EF310E04B;
	Mon, 10 Jun 2024 13:55:29 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93C510E04B;
 Mon, 10 Jun 2024 13:55:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Only_timeout_jobs_if_they_run_?=
 =?utf-8?q?longer_than_timeout_period?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Jun 2024 13:55:10 -0000
Message-ID: <171802771081.31735.11170999723007983206@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240610135011.2605272-1-matthew.brost@intel.com>
In-Reply-To: <20240610135011.2605272-1-matthew.brost@intel.com>
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

Series: Only timeout jobs if they run longer than timeout period
URL   : https://patchwork.freedesktop.org/series/134677/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_guc_submit.c: In function ‘check_timeout’:
../drivers/gpu/drm/xe/xe_guc_submit.c:956:22: error: implicit declaration of function ‘xe_lrc_ctx_timestamp’; did you mean ‘xe_lrc_update_timestamp’? [-Werror=implicit-function-declaration]
  956 |  u32 ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
      |                      ^~~~~~~~~~~~~~~~~~~~
      |                      xe_lrc_update_timestamp
../drivers/gpu/drm/xe/xe_guc_submit.c:957:26: error: implicit declaration of function ‘xe_lrc_ctx_job_timestamp’; did you mean ‘xe_lrc_update_timestamp’? [-Werror=implicit-function-declaration]
  957 |  u32 ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
      |                          ^~~~~~~~~~~~~~~~~~~~~~~~
      |                          xe_lrc_update_timestamp
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/xe/xe_guc_submit.o] Error 1
make[7]: *** Waiting for unfinished jobs....
../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
  156 | u64 ioread64_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:163:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
  163 | u64 ioread64_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:170:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
  170 | u64 ioread64be_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:178:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
  178 | u64 ioread64be_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:264:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
  264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:272:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
  272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:280:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
  280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
../lib/iomap.c:288:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
  288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_lrc.c: In function ‘xe_lrc_snapshot_capture’:
../drivers/gpu/drm/xe/xe_lrc.c:1581:28: error: implicit declaration of function ‘xe_lrc_ctx_timestamp’; did you mean ‘xe_lrc_update_timestamp’? [-Werror=implicit-function-declaration]
 1581 |  snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
      |                            ^~~~~~~~~~~~~~~~~~~~
      |                            xe_lrc_update_timestamp
../drivers/gpu/drm/xe/xe_lrc.c:1582:32: error: implicit declaration of function ‘xe_lrc_ctx_job_timestamp’; did you mean ‘xe_lrc_update_timestamp’? [-Werror=implicit-function-declaration]
 1582 |  snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~
      |                                xe_lrc_update_timestamp
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/xe/xe_lrc.o] Error 1
make[6]: *** [../scripts/Makefile.build:485: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:485: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:485: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:485: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:1934: .] Error 2
make[1]: *** [/kernel/Makefile:240: __sub-make] Error 2
make: *** [Makefile:240: __sub-make] Error 2

[13:54:42] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:54:46] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


