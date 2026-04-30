Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA10DCD13D3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 19:06:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FF010F423;
	Thu, 30 Apr 2026 19:06:45 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D74610F423;
 Thu, 30 Apr 2026 19:06:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_mm=2C_drm/ttm=2C_drm/xe=3A_Avo?=
 =?utf-8?q?id_reclaim/eviction_loops_under_fragmentation_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Apr 2026 19:06:44 -0000
Message-ID: <177757600457.29832.2954029064187356191@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260430182335.2132382-1-matthew.brost@intel.com>
In-Reply-To: <20260430182335.2132382-1-matthew.brost@intel.com>
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

Series: mm, drm/ttm, drm/xe: Avoid reclaim/eviction loops under fragmentation (rev2)
URL   : https://patchwork.freedesktop.org/series/165329/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../mm/shrinker.c: In function ‘shrink_slab’:
../mm/shrinker.c:633:57: warning: passing argument 3 of ‘shrink_slab_memcg’ makes pointer from integer without a cast [-Wint-conversion]
  633 |                 return shrink_slab_memcg(gfp_mask, nid, order, memcg, priority);
      |                                                         ^~~~~
      |                                                         |
      |                                                         s8 {aka signed char}
../mm/shrinker.c:592:44: note: expected ‘struct mem_cgroup *’ but argument is of type ‘s8’ {aka ‘signed char’}
  592 |                         struct mem_cgroup *memcg, int priority)
      |                         ~~~~~~~~~~~~~~~~~~~^~~~~
../mm/shrinker.c:633:64: warning: passing argument 4 of ‘shrink_slab_memcg’ makes integer from pointer without a cast [-Wint-conversion]
  633 |                 return shrink_slab_memcg(gfp_mask, nid, order, memcg, priority);
      |                                                                ^~~~~
      |                                                                |
      |                                                                struct mem_cgroup *
../mm/shrinker.c:592:55: note: expected ‘int’ but argument is of type ‘struct mem_cgroup *’
  592 |                         struct mem_cgroup *memcg, int priority)
      |                                                   ~~~~^~~~~~~~
../mm/shrinker.c:633:24: error: too many arguments to function ‘shrink_slab_memcg’
  633 |                 return shrink_slab_memcg(gfp_mask, nid, order, memcg, priority);
      |                        ^~~~~~~~~~~~~~~~~
../mm/shrinker.c:591:22: note: declared here
  591 | static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
      |                      ^~~~~~~~~~~~~~~~~
make[4]: *** [../scripts/Makefile.build:289: mm/shrinker.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:548: mm] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:2141: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[19:06:10] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:06:15] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


