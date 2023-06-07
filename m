Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CFFC7EE29
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 11:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CD910E010;
	Wed,  7 Jun 2023 11:20:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A1F6710E010;
 Wed,  7 Jun 2023 11:20:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9F1C6AA01E;
 Wed,  7 Jun 2023 11:20:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Date: Wed, 07 Jun 2023 11:20:35 -0000
Message-ID: <168613683564.21185.11141299779340196415@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230607110328.3739706-1-anshuman.gupta@intel.com>
In-Reply-To: <20230607110328.3739706-1-anshuman.gupta@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_D3Cold_?=
 =?utf-8?q?Policy_=28rev2=29?=
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

Series: D3Cold Policy (rev2)
URL   : https://patchwork.freedesktop.org/series/118035/
State : failure

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
/workspace
+ pwd
+ ls -la
total 504
drwxrwxr-x 10 1003 1003   4096 Jun  7 11:20 .
drwxr-xr-x  1 root root   4096 Jun  7 11:20 ..
-rw-rw-r--  1 1003 1003 396983 Jun  7 11:20 build.log
-rw-rw-r--  1 1003 1003   1810 Jun  7 11:15 checkpatch.log
drwxrwxr-x  5 1003 1003   4096 Jun  7 11:13 ci
drwxrwxr-x 10 1003 1003   4096 Jun  7 11:13 docker
drwxrwxr-x  8 1003 1003   4096 Jun  7 11:13 .git
-rw-rw-r--  1 1003 1003    558 Jun  7 11:14 git_apply.log
drwxrwxr-x  3 1003 1003   4096 Jun  7 11:13 .github
-rw-rw-r--  1 1003 1003    233 Jun  7 11:13 .groovylintrc.json
-rw-rw-r--  1 1003 1003     78 Jun  7 11:20 hooks.log
drwxrwxr-x 31 1003 1003   4096 Jun  7 11:19 kernel
-rw-rw-r--  1 1003 1003  25611 Jun  7 11:14 kernel.mbox
-rw-rw-r--  1 1003 1003  25980 Jun  7 11:16 kunit.log
drwxrwxr-x 39 1003 1003   4096 Jun  7 11:13 pipelines
-rw-rw-r--  1 1003 1003    793 Jun  7 11:13 README.adoc
drwxrwxr-x  3 1003 1003   4096 Jun  7 11:13 scripts
drwxrwxr-x  2 1003 1003   4096 Jun  7 11:13 .vscode
+ uname -a
Linux edc9e6c476cf 5.4.0-149-generic #166-Ubuntu SMP Tue Apr 18 16:51:45 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
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
3568eb7a1 drm/xe/pm: Init pcode and restore vram on power lost
0c9d7b1d6 xe/drm/pm: Toggle d3cold_allowed using vram_usages
ede55dbe1 drm/xe/pm: Add vram_d3cold_threshold Sysfs
e4f6fe2f5 drm/xe/pm: Refactor xe_pm_runtime_init
57fad5271 drm/xe/pm: Add pci d3cold_capable support
0f657f7b7 drm/xe/display: Allow scanout of bos that can be migrated to lmem
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
../drivers/gpu/drm/xe/xe_device_sysfs.c:63:5: error: no previous prototype for ‘xe_device_sysfs_init’ [-Werror=missing-prototypes]
   63 | int xe_device_sysfs_init(struct xe_device *xe)
      |     ^~~~~~~~~~~~~~~~~~~~
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


