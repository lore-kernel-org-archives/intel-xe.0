Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8BECD4F3D
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 17:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9046D10E426;
	Wed, 20 May 2026 17:37:08 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4676710E0C9;
 Wed, 20 May 2026 17:37:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_GuC_paging_engine_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 May 2026 17:37:08 -0000
Message-ID: <177929862828.92320.628843783770094407@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260520172846.291708-12-matthew.auld@intel.com>
In-Reply-To: <20260520172846.291708-12-matthew.auld@intel.com>
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

Series: GuC paging engine support
URL   : https://patchwork.freedesktop.org/series/166960/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[17:36:34] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:36:38] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
ERROR:root:../drivers/gpu/drm/xe/xe_gt_sriov_vf.c: In function ‘vf_cache_num_paging_engines’:
../drivers/gpu/drm/xe/xe_gt_sriov_vf.c:680:50: error: ‘UC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY’ undeclared (first use in this function); did you mean ‘GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY’?
  680 |         err = guc_action_query_single_klv32(guc, UC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY,
      |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                  GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY
../drivers/gpu/drm/xe/xe_gt_sriov_vf.c:680:50: note: each undeclared identifier is reported only once for each function it appears in
make[7]: *** [../scripts/Makefile.build:289: drivers/gpu/drm/xe/xe_gt_sriov_vf.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:548: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:548: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:548: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:548: drivers] Error 2
make[2]: *** [/kernel/Makefile:2143: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


