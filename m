Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BF2EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 14:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DC410E501;
	Thu, 15 Jun 2023 14:22:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id CF27C10E501;
 Thu, 15 Jun 2023 14:22:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CBA85AADD5;
 Thu, 15 Jun 2023 14:22:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Thu, 15 Jun 2023 14:22:23 -0000
Message-ID: <168683894383.10726.18254852603205393082@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_drm/xe?=
 =?utf-8?q?=3A_Add_engine_scheduler_control_interface?=
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

Series: drm/xe: Add engine scheduler control interface
URL   : https://patchwork.freedesktop.org/series/119392/
State : failure

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
/workspace
+ pwd
+ ls -la
total 528
drwxrwxr-x 10 1003 1003   4096 Jun 15 14:22 .
drwxr-xr-x  1 root root   4096 Jun 15 14:22 ..
-rw-rw-r--  1 1003 1003 397078 Jun 15 14:21 build.log
-rw-rw-r--  1 1003 1003   4977 Jun 15 14:16 checkpatch.log
drwxrwxr-x  5 1003 1003   4096 Jun 15 14:15 ci
drwxrwxr-x 10 1003 1003   4096 Jun 15 14:15 docker
drwxrwxr-x  8 1003 1003   4096 Jun 15 14:15 .git
-rw-rw-r--  1 1003 1003    685 Jun 15 14:16 git_apply.log
drwxrwxr-x  3 1003 1003   4096 Jun 15 14:15 .github
-rw-rw-r--  1 1003 1003    233 Jun 15 14:15 .groovylintrc.json
-rw-rw-r--  1 1003 1003     78 Jun 15 14:22 hooks.log
drwxrwxr-x 31 1003 1003   4096 Jun 15 14:21 kernel
-rw-rw-r--  1 1003 1003  45488 Jun 15 14:16 kernel.mbox
-rw-rw-r--  1 1003 1003  25980 Jun 15 14:18 kunit.log
drwxrwxr-x 40 1003 1003   4096 Jun 15 14:15 pipelines
-rw-rw-r--  1 1003 1003    793 Jun 15 14:15 README.adoc
drwxrwxr-x  3 1003 1003   4096 Jun 15 14:15 scripts
drwxrwxr-x  2 1003 1003   4096 Jun 15 14:15 .vscode
+ uname -a
Linux d55a39662963 5.4.0-149-generic #166-Ubuntu SMP Tue Apr 18 16:51:45 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
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
e966556bb drm/xe: Add min/max cap for engine scheduler properties
7b81a3a37 drm/xe: Add sysfs for preempt reset timeout
c2685e795 drm/xe: Add timeslice duration engine property to sysfs
bd6f915bc drm/xe: Add job timeout engine property to sysfs
3fb11cb89 drm/xe: Add sysfs for default engine scheduler properties
3938e4f64 drm/xe: Add sysfs entries for engines under its GT
6d2981d42 drm/xe/mtl: Add some initial MTL workarounds
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
  CC [M]  drivers/gpu/drm/xe/xe_dma_buf.o
  CC [M]  drivers/gpu/drm/xe/xe_engine.o
  CC [M]  drivers/gpu/drm/xe/xe_exec.o
  CC [M]  drivers/gpu/drm/xe/xe_execlist.o
  CC [M]  drivers/gpu/drm/xe/xe_force_wake.o
  CC [M]  drivers/gpu/drm/xe/xe_ggtt.o
  CC [M]  drivers/gpu/drm/xe/xe_gt.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_clock.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_debugfs.o
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
  CC [M]  drivers/gpu/drm/xe/xe_reg_whitelist.o
  CC [M]  drivers/gpu/drm/xe/xe_rtp.o
  CC [M]  drivers/gpu/drm/xe/xe_sa.o
../drivers/gpu/drm/xe/xe_gt_sysfs.c:510:5: error: no previous prototype for ‘xe_add_engine_defaults’ [-Werror=missing-prototypes]
  510 | int xe_add_engine_defaults(struct kobject *parent)
      |     ^~~~~~~~~~~~~~~~~~~~~~
  CC [M]  drivers/gpu/drm/xe/xe_sched_job.o
  CC [M]  drivers/gpu/drm/xe/xe_step.o
  CC [M]  drivers/gpu/drm/xe/xe_sync.o
  CC [M]  drivers/gpu/drm/xe/xe_tile.o
  CC [M]  drivers/gpu/drm/xe/xe_trace.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_sys_mgr.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_vram_mgr.o
cc1: all warnings being treated as errors
  CC [M]  drivers/gpu/drm/xe/xe_tuning.o
  CC [M]  drivers/gpu/drm/xe/xe_uc.o
make[2]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_gt_sysfs.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/workspace/kernel/Makefile:2025: drivers/gpu/drm/xe] Error 2
make[1]: Leaving directory '/workspace/kernel/build64'
make: *** [Makefile:226: __sub-make] Error 2
+ cleanup
+ '[' 1 -eq 1 ']'
+ ./scripts/config --file /workspace/kernel/build64/.config --enable CONFIG_DRM_XE_DISPLAY
run-parts: /workspace/ci/hooks/10-build-W1 exited with return code 2


