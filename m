Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAAFEE4996
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 13:55:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8468210E36C;
	Tue, 22 Aug 2023 13:55:15 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E3F0910E36C;
 Tue, 22 Aug 2023 13:55:13 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E0761AADEC;
 Tue, 22 Aug 2023 13:55:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Date: Tue, 22 Aug 2023 13:55:13 -0000
Message-ID: <169271251391.20552.10054736685588577549@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230822045825.3900964-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20230822045825.3900964-1-sujaritha.sundaresan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_Add_thr?=
 =?utf-8?q?ottle_reasons_sysfs?=
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

Series: Add throttle reasons sysfs
URL   : https://patchwork.freedesktop.org/series/122723/
State : failure

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
+ pwd
+ ls -la
/workspace
total 492
drwxrwxr-x 10 1003 1003   4096 Aug 22 13:55 .
drwxr-xr-x  1 root root   4096 Aug 22 13:55 ..
-rw-rw-r--  1 1003 1003 389858 Aug 22 13:54 build.log
-rw-rw-r--  1 1003 1003   1278 Aug 22 13:49 checkpatch.log
drwxrwxr-x  5 1003 1003   4096 Aug 22 13:48 ci
drwxrwxr-x  9 1003 1003   4096 Aug 22 13:48 docker
drwxrwxr-x  8 1003 1003   4096 Aug 22 13:48 .git
-rw-rw-r--  1 1003 1003    428 Aug 22 13:49 git_apply.log
drwxrwxr-x  4 1003 1003   4096 Aug 22 13:48 .github
-rw-rw-r--  1 1003 1003    233 Aug 22 13:48 .groovylintrc.json
-rw-rw-r--  1 1003 1003     78 Aug 22 13:55 hooks.log
drwxrwxr-x 31 1003 1003   4096 Aug 22 13:54 kernel
-rw-rw-r--  1 1003 1003  15208 Aug 22 13:49 kernel.mbox
-rw-rw-r--  1 1003 1003  26091 Aug 22 13:50 kunit.log
-rw-rw-r--  1 1003 1003     48 Aug 22 13:49 parent.tag
drwxrwxr-x 45 1003 1003   4096 Aug 22 13:48 pipelines
-rw-rw-r--  1 1003 1003    793 Aug 22 13:48 README.adoc
drwxrwxr-x  3 1003 1003   4096 Aug 22 13:48 scripts
drwxrwxr-x  2 1003 1003   4096 Aug 22 13:48 .vscode
+ uname -a
Linux c2355cdc0734 5.4.0-149-generic #166-Ubuntu SMP Tue Apr 18 16:51:45 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
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
101fd4e85 drm/xe: Add throttle reason sysfs attributes
779f35314 drm/xe: madvise_funcs should use value not property
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
  UPD     include/config/kernel.release
  UPD     include/generated/compile.h
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
  CC [M]  drivers/gpu/drm/xe/xe_exec.o
  CC [M]  drivers/gpu/drm/xe/xe_execlist.o
  CC [M]  drivers/gpu/drm/xe/xe_exec_queue.o
  CC [M]  drivers/gpu/drm/xe/xe_force_wake.o
  CC [M]  drivers/gpu/drm/xe/xe_ggtt.o
  CC [M]  drivers/gpu/drm/xe/xe_gt.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_clock.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_idle_sysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_mcr.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_pagefault.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.o
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
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.o
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
../drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:44:5: error: no previous prototype for ‘read_perf_limit_reasons’ [-Werror=missing-prototypes]
   44 | u32 read_perf_limit_reasons(struct xe_gt *gt)
      |     ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:55:5: error: no previous prototype for ‘xe_read_status’ [-Werror=missing-prototypes]
   55 | u32 xe_read_status(struct xe_gt_throttle *throttle)
      |     ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:63:5: error: no previous prototype for ‘xe_read_reason_pl1’ [-Werror=missing-prototypes]
   63 | u32 xe_read_reason_pl1(struct xe_gt_throttle *throttle)
      |     ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:71:5: error: no previous prototype for ‘xe_read_reason_pl2’ [-Werror=missing-prototypes]
   71 | u32 xe_read_reason_pl2(struct xe_gt_throttle *throttle)
      |     ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:79:5: error: no previous prototype for ‘xe_read_reason_pl4’ [-Werror=missing-prototypes]
   79 | u32 xe_read_reason_pl4(struct xe_gt_throttle *throttle)
      |     ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:87:5: error: no previous prototype for ‘xe_read_reason_thermal’ [-Werror=missing-prototypes]
   87 | u32 xe_read_reason_thermal(struct xe_gt_throttle *throttle)
      |     ^~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:95:5: error: no previous prototype for ‘xe_read_reason_prochot’ [-Werror=missing-prototypes]
   95 | u32 xe_read_reason_prochot(struct xe_gt_throttle *throttle)
      |     ^~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:103:5: error: no previous prototype for ‘xe_read_reason_ratl’ [-Werror=missing-prototypes]
  103 | u32 xe_read_reason_ratl(struct xe_gt_throttle *throttle)
      |     ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:111:5: error: no previous prototype for ‘xe_read_reason_vr_thermalert’ [-Werror=missing-prototypes]
  111 | u32 xe_read_reason_vr_thermalert(struct xe_gt_throttle *throttle)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:119:5: error: no previous prototype for ‘xe_read_reason_vr_tdc’ [-Werror=missing-prototypes]
  119 | u32 xe_read_reason_vr_tdc(struct xe_gt_throttle *throttle)
      |     ^~~~~~~~~~~~~~~~~~~~~
  CC [M]  drivers/gpu/drm/xe/xe_query.o
cc1: all warnings being treated as errors
make[2]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_gt_throttle_sysfs.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/workspace/kernel/Makefile:2026: drivers/gpu/drm/xe] Error 2
make[1]: Leaving directory '/workspace/kernel/build64'
make: *** [Makefile:226: __sub-make] Error 2
+ cleanup
+ '[' 1 -eq 1 ']'
+ ./scripts/config --file /workspace/kernel/build64/.config --enable CONFIG_DRM_XE_DISPLAY
run-parts: /workspace/ci/hooks/10-build-W1 exited with return code 2


