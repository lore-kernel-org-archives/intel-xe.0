Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2460C55822
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 04:35:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6329D10E640;
	Tue,  4 Aug 2026 04:35:55 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A214710E6CC;
 Tue,  4 Aug 2026 04:35:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Migrate_on_fault_for_device_pa?=
 =?utf-8?q?ges_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: mpenttil@redhat.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Aug 2026 04:35:53 -0000
Message-ID: <178581815365.15902.540429025012339040@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260804042631.2175585-1-mpenttil@redhat.com>
In-Reply-To: <20260804042631.2175585-1-mpenttil@redhat.com>
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

Series: Migrate on fault for device pages (rev5)
URL   : https://patchwork.freedesktop.org/series/165953/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../mm/filemap.c:45:
../include/linux/migrate.h: In function ‘hmm_range_fault_mm’:
../include/linux/migrate.h:230:49: error: invalid use of undefined type ‘struct mmu_interval_notifier’
  230 |         return range->notifier ? range->notifier->mm : range->migrate->vma->vm_mm;
      |                                                 ^~
make[4]: *** [../scripts/Makefile.build:289: mm/filemap.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:549: mm] Error 2
make[3]: *** Waiting for unfinished jobs....
In file included from ../fs/iomap/buffered-io.c:10:
../include/linux/migrate.h: In function ‘hmm_range_fault_mm’:
../include/linux/migrate.h:230:49: error: invalid use of undefined type ‘struct mmu_interval_notifier’
  230 |         return range->notifier ? range->notifier->mm : range->migrate->vma->vm_mm;
      |                                                 ^~
make[5]: *** [../scripts/Makefile.build:289: fs/iomap/buffered-io.o] Error 1
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [../scripts/Makefile.build:549: fs/iomap] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:549: fs] Error 2
make[2]: *** [/kernel/Makefile:2187: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[04:35:19] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:35:24] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


