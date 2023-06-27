Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5AEEB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 13:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792B810E03F;
	Tue, 27 Jun 2023 13:02:52 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 640C810E03F;
 Tue, 27 Jun 2023 13:02:50 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 61D25A00CC;
 Tue, 27 Jun 2023 13:02:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Date: Tue, 27 Jun 2023 13:02:50 -0000
Message-ID: <168787097039.2458.16776123152374522069@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230627115642.2087251-1-anshuman.gupta@intel.com>
In-Reply-To: <20230627115642.2087251-1-anshuman.gupta@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_D3Cold_?=
 =?utf-8?q?Policy_=28rev3=29?=
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

Series: D3Cold Policy (rev3)
URL   : https://patchwork.freedesktop.org/series/118035/
State : failure

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
+ pwd
+ ls -la
/workspace
total 508
drwxrwxr-x 10 1003 1003   4096 Jun 27 13:02 .
drwxr-xr-x  1 root root   4096 Jun 27 13:02 ..
-rw-rw-r--  1 1003 1003 397440 Jun 27 13:02 build.log
-rw-rw-r--  1 1003 1003   1811 Jun 27 12:57 checkpatch.log
drwxrwxr-x  5 1003 1003   4096 Jun 27 12:55 ci
drwxrwxr-x 10 1003 1003   4096 Jun 27 12:55 docker
drwxrwxr-x  8 1003 1003   4096 Jun 27 12:55 .git
-rw-rw-r--  1 1003 1003    428 Jun 27 12:57 git_apply.log
drwxrwxr-x  3 1003 1003   4096 Jun 27 12:55 .github
-rw-rw-r--  1 1003 1003    233 Jun 27 12:55 .groovylintrc.json
-rw-rw-r--  1 1003 1003     78 Jun 27 13:02 hooks.log
drwxrwxr-x 31 1003 1003   4096 Jun 27 13:02 kernel
-rw-rw-r--  1 1003 1003  26259 Jun 27 12:57 kernel.mbox
-rw-rw-r--  1 1003 1003  25980 Jun 27 12:58 kunit.log
drwxrwxr-x 42 1003 1003   4096 Jun 27 12:55 pipelines
-rw-rw-r--  1 1003 1003    793 Jun 27 12:55 README.adoc
drwxrwxr-x  3 1003 1003   4096 Jun 27 12:55 scripts
drwxrwxr-x  2 1003 1003   4096 Jun 27 12:55 .vscode
+ uname -a
Linux e41ab098a68a 5.4.0-149-generic #166-Ubuntu SMP Tue Apr 18 16:51:45 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
+ export
+ grep -Ei '(^|\W)CI_'
declare -x CI_KERNEL_BUILD_DIR="/workspace/kernel/build64"
declare -x CI_KERNEL_IMAGES_DIR="/workspace/kernel/archive/boot"
declare -x CI_KERNEL_MODULES_DIR="/workspace/kernel/archive"
declare -x CI_KERNEL_SRC_DIR="/workspace/kernel"
declare -x CI_SRC_DIR="/workspace/kernel"
declare -x CI_TOOLS_SRC_DIR="/workspace/ci"
declare -x CI_WORKSPACE_DIR="/workspace"
+ '[' -n /workspace ']'
+ git_args='-C /workspace/kernel'
+ git_log_args=
+ git --no-pager -C /workspace/kernel log --format=oneline --abbrev-commit
c8486b1cd drm/xe/pm: Init pcode and restore vram on power lost
c3801972d xe/drm/pm: Toggle d3cold_allowed using vram_usages
a0c073879 drm/xe/pm: Add vram_d3cold_threshold Sysfs
c238b4588 drm/xe/pm: Refactor xe_pm_runtime_init
858f7cad3 drm/xe/pm: Add pci d3cold_capable support
f135580b5 drm/xe: Fix vm refcount races
run-parts: executing /workspace/ci/hooks/10-build-W1
+ SRC_DIR=/workspace/kernel
+ RESTORE_DISPLAY_CONFIG=0
+ '[' -n /workspace/kernel/build64 ']'
+ BUILD_DIR=/workspace/kernel/build64
+ cd /workspace/kernel
+ grep -q -e '^CONFIG_DRM_XE_DISPLAY=[yY]' /workspace/kernel/build64/.config
+ RESTORE_DISPLAY_CONFIG=1
+ trap cleanup EXIT
+ ./scripts/config --file /workspace/kernel/build64/.config --disable CONFIG_DRM_XE_DISPLAY
++ nproc
+ make -j48 O=/workspace/kernel/build64 modules_prepare
make[1]: Entering directory '/workspace/kernel/build64'
  SYNC    include/config/auto.conf.cmd
  GEN     Makefile
  GEN     Makefile
  UPD     include/generated/compile.h
  UPD     include/config/kernel.release
  UPD     include/generated/utsrelease.h
  DESCEND objtool
  CALL    ../scripts/checksyscalls.sh
  HOSTCC  /workspace/kernel/build64/tools/objtool/fixdep.o
  HOSTLD  /workspace/kernel/build64/tools/objtool/fixdep-in.o
  LINK    /workspace/kernel/build64/tools/objtool/fixdep
  INSTALL libsubcmd_headers
  CC      /workspace/kernel/build64/tools/objtool/libsubcmd/exec-cmd.o
  CC      /workspace/kernel/build64/tools/objtool/libsubcmd/help.o
  CC      /workspace/kernel/build64/tools/objtool/libsubcmd/pager.o
  CC      /workspace/kernel/build64/tools/objtool/libsubcmd/parse-options.o
  CC      /workspace/kernel/build64/tools/objtool/libsubcmd/run-command.o
  CC      /workspace/kernel/build64/tools/objtool/libsubcmd/sigchain.o
  CC      /workspace/kernel/build64/tools/objtool/libsubcmd/subcmd-config.o
  LD      /workspace/kernel/build64/tools/objtool/libsubcmd/libsubcmd-in.o
  AR      /workspace/kernel/build64/tools/objtool/libsubcmd/libsubcmd.a
  CC      /workspace/kernel/build64/tools/objtool/weak.o
  CC      /workspace/kernel/build64/tools/objtool/check.o
  CC      /workspace/kernel/build64/tools/objtool/special.o
  CC      /workspace/kernel/build64/tools/objtool/builtin-check.o
  CC      /workspace/kernel/build64/tools/objtool/elf.o
  CC      /workspace/kernel/build64/tools/objtool/objtool.o
  CC      /workspace/kernel/build64/tools/objtool/orc_gen.o
  CC      /workspace/kernel/build64/tools/objtool/orc_dump.o
  CC      /workspace/kernel/build64/tools/objtool/libstring.o
  CC      /workspace/kernel/build64/tools/objtool/libctype.o
  CC      /workspace/kernel/build64/tools/objtool/str_error_r.o
  CC      /workspace/kernel/build64/tools/objtool/librbtree.o
  CC      /workspace/kernel/build64/tools/objtool/arch/x86/special.o
  CC      /workspace/kernel/build64/tools/objtool/arch/x86/decode.o
  LD      /workspace/kernel/build64/tools/objtool/arch/x86/objtool-in.o
  LD      /workspace/kernel/build64/tools/objtool/objtool-in.o
  LINK    /workspace/kernel/build64/tools/objtool/objtool
make[1]: Leaving directory '/workspace/kernel/build64'
++ nproc
+ make -j48 O=/workspace/kernel/build64 M=drivers/gpu/drm/xe W=1
make[1]: Entering directory '/workspace/kernel/build64'
  CC [M]  drivers/gpu/drm/xe/xe_bb.o
  CC [M]  drivers/gpu/drm/xe/xe_bo.o
  CC [M]  drivers/gpu/drm/xe/xe_bo_evict.o
  CC [M]  drivers/gpu/drm/xe/xe_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_devcoredump.o
  CC [M]  drivers/gpu/drm/xe/xe_device.o
  CC [M]  drivers/gpu/drm/xe/xe_device_sysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_dma_buf.o
  CC [M]  drivers/gpu/drm/xe/xe_engine.o
  CC [M]  drivers/gpu/drm/xe/xe_exec.o
  CC [M]  drivers/gpu/drm/xe/xe_execlist.o
  CC [M]  drivers/gpu/drm/xe/xe_force_wake.o
  CC [M]  drivers/gpu/drm/xe/xe_ggtt.o
  CC [M]  drivers/gpu/drm/xe/xe_gt.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_clock.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_idle_sysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_mcr.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_pagefault.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_topology.o
  HOSTCC  drivers/gpu/drm/xe/xe_gen_wa_oob
  CC [M]  drivers/gpu/drm/xe/xe_guc_ads.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_ct.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_hwconfig.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_log.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_pc.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_submit.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_fence.o
  CC [M]  drivers/gpu/drm/xe/xe_huc.o
  CC [M]  drivers/gpu/drm/xe/xe_huc_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_irq.o
  CC [M]  drivers/gpu/drm/xe/xe_lrc.o
  CC [M]  drivers/gpu/drm/xe/xe_migrate.o
  CC [M]  drivers/gpu/drm/xe/xe_mmio.o
  CC [M]  drivers/gpu/drm/xe/xe_mocs.o
  CC [M]  drivers/gpu/drm/xe/xe_module.o
  CC [M]  drivers/gpu/drm/xe/xe_pat.o
  CC [M]  drivers/gpu/drm/xe/xe_pci.o
  CC [M]  drivers/gpu/drm/xe/xe_pcode.o
  CC [M]  drivers/gpu/drm/xe/xe_pm.o
  CC [M]  drivers/gpu/drm/xe/xe_preempt_fence.o
  CC [M]  drivers/gpu/drm/xe/xe_pt.o
  CC [M]  drivers/gpu/drm/xe/xe_pt_walk.o
  CC [M]  drivers/gpu/drm/xe/xe_query.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_sr.o
../drivers/gpu/drm/xe/xe_device_sysfs.c:71:6: error: no previous prototype for ‘xe_device_sysfs_init’ [-Werror=missing-prototypes]
   71 | void xe_device_sysfs_init(struct xe_device *xe)
      |      ^~~~~~~~~~~~~~~~~~~~
  CC [M]  drivers/gpu/drm/xe/xe_reg_whitelist.o
cc1: all warnings being treated as errors
make[2]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_device_sysfs.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: Leaving directory '/workspace/kernel/build64'
make[1]: *** [/workspace/kernel/Makefile:2025: drivers/gpu/drm/xe] Error 2
make: *** [Makefile:226: __sub-make] Error 2
+ cleanup
+ '[' 1 -eq 1 ']'
+ ./scripts/config --file /workspace/kernel/build64/.config --enable CONFIG_DRM_XE_DISPLAY
run-parts: /workspace/ci/hooks/10-build-W1 exited with return code 2


