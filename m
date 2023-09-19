Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610B9CD54B2
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 11:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230F010E39C;
	Tue, 19 Sep 2023 11:06:03 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id AE8E410E39C;
 Tue, 19 Sep 2023 11:06:00 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A0AC0AADE4;
 Tue, 19 Sep 2023 11:06:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Date: Tue, 19 Sep 2023 11:06:00 -0000
Message-ID: <169512156065.3668.9484144506195033744@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230919110541.1243785-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20230919110541.1243785-1-sujaritha.sundaresan@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/123906/
State : failure

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
/workspace
+ pwd
+ ls -la
total 880
drwxrwxr-x 10 1003 1003   4096 Sep 19 11:05 .
drwxr-xr-x  1 root root   4096 Sep 19 11:05 ..
-rw-rw-r--  1 1003 1003 789262 Sep 19 11:05 build.log
-rw-rw-r--  1 1003 1003   2327 Sep 19 10:57 checkpatch.log
drwxrwxr-x  5 1003 1003   4096 Sep 19 10:55 ci
drwxrwxr-x  9 1003 1003   4096 Sep 19 10:55 docker
drwxrwxr-x  8 1003 1003   4096 Sep 19 10:55 .git
-rw-rw-r--  1 1003 1003    363 Sep 19 10:57 git_apply.log
drwxrwxr-x  4 1003 1003   4096 Sep 19 10:55 .github
-rw-rw-r--  1 1003 1003    233 Sep 19 10:55 .groovylintrc.json
-rw-rw-r--  1 1003 1003     78 Sep 19 11:05 hooks.log
drwxrwxr-x 31 1003 1003   4096 Sep 19 11:05 kernel
-rw-rw-r--  1 1003 1003  13570 Sep 19 10:57 kernel.mbox
-rw-rw-r--  1 1003 1003  26482 Sep 19 10:58 kunit.log
-rw-rw-r--  1 1003 1003     48 Sep 19 10:57 parent.tag
drwxrwxr-x 45 1003 1003   4096 Sep 19 10:55 pipelines
-rw-rw-r--  1 1003 1003    793 Sep 19 10:55 README.adoc
drwxrwxr-x  3 1003 1003   4096 Sep 19 10:55 scripts
drwxrwxr-x  2 1003 1003   4096 Sep 19 10:55 .vscode
+ uname -a
Linux 53a82afc424c 5.4.0-149-generic #166-Ubuntu SMP Tue Apr 18 16:51:45 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
+ export
+ grep -Ei '(^|\W)CI_'
declare -x CI_KERNEL_BUILD_DIR="/workspace/kernel/build64-default"
declare -x CI_KERNEL_SRC_DIR="/workspace/kernel"
declare -x CI_TOOLS_SRC_DIR="/workspace/ci"
declare -x CI_WORKSPACE_DIR="/workspace"
+ '[' -n /workspace ']'
+ git_args='-C /workspace/kernel'
+ git_log_args=
+ git --no-pager -C /workspace/kernel log --format=oneline --abbrev-commit
7fbf09916 drm/xe: Add throttle reason sysfs attributes
3d7e02fb9 fixup! drm/xe/pmu: Enable PMU interface
run-parts: executing /workspace/ci/hooks/10-build-W1
+ SRC_DIR=/workspace/kernel
+ RESTORE_DISPLAY_CONFIG=0
+ '[' -n /workspace/kernel/build64-default ']'
+ BUILD_DIR=/workspace/kernel/build64-default
+ cd /workspace/kernel
+ grep -q -e '^CONFIG_DRM_XE_DISPLAY=[yY]' /workspace/kernel/build64-default/.config
+ RESTORE_DISPLAY_CONFIG=1
+ trap cleanup EXIT
+ ./scripts/config --file /workspace/kernel/build64-default/.config --disable CONFIG_DRM_XE_DISPLAY
++ nproc
+ make -j48 O=/workspace/kernel/build64-default modules_prepare
make[1]: Entering directory '/workspace/kernel/build64-default'
  SYNC    include/config/auto.conf.cmd
  GEN     Makefile
  GEN     Makefile
  UPD     include/generated/compile.h
  UPD     include/config/kernel.release
  UPD     include/generated/utsrelease.h
  DESCEND objtool
  CALL    ../scripts/checksyscalls.sh
  HOSTCC  /workspace/kernel/build64-default/tools/objtool/fixdep.o
  HOSTLD  /workspace/kernel/build64-default/tools/objtool/fixdep-in.o
  LINK    /workspace/kernel/build64-default/tools/objtool/fixdep
  INSTALL libsubcmd_headers
  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/exec-cmd.o
  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/help.o
  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/pager.o
  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/parse-options.o
  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/run-command.o
  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/sigchain.o
  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/subcmd-config.o
  LD      /workspace/kernel/build64-default/tools/objtool/libsubcmd/libsubcmd-in.o
  AR      /workspace/kernel/build64-default/tools/objtool/libsubcmd/libsubcmd.a
  CC      /workspace/kernel/build64-default/tools/objtool/weak.o
  CC      /workspace/kernel/build64-default/tools/objtool/check.o
  CC      /workspace/kernel/build64-default/tools/objtool/special.o
  CC      /workspace/kernel/build64-default/tools/objtool/builtin-check.o
  CC      /workspace/kernel/build64-default/tools/objtool/elf.o
  CC      /workspace/kernel/build64-default/tools/objtool/objtool.o
  CC      /workspace/kernel/build64-default/tools/objtool/orc_gen.o
  CC      /workspace/kernel/build64-default/tools/objtool/orc_dump.o
  CC      /workspace/kernel/build64-default/tools/objtool/libstring.o
  CC      /workspace/kernel/build64-default/tools/objtool/libctype.o
  CC      /workspace/kernel/build64-default/tools/objtool/str_error_r.o
  CC      /workspace/kernel/build64-default/tools/objtool/librbtree.o
  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/special.o
  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/decode.o
  LD      /workspace/kernel/build64-default/tools/objtool/arch/x86/objtool-in.o
  LD      /workspace/kernel/build64-default/tools/objtool/objtool-in.o
  LINK    /workspace/kernel/build64-default/tools/objtool/objtool
make[1]: Leaving directory '/workspace/kernel/build64-default'
++ nproc
+ make -j48 O=/workspace/kernel/build64-default M=drivers/gpu/drm/xe W=1
make[1]: Entering directory '/workspace/kernel/build64-default'
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
../drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:43:5: error: no previous prototype for ‘read_perf_limit_reasons’ [-Werror=missing-prototypes]
   43 | u32 read_perf_limit_reasons(struct xe_gt *gt)
      |     ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:54:5: error: no previous prototype for ‘xe_read_status’ [-Werror=missing-prototypes]
   54 | u32 xe_read_status(struct xe_gt_throttle *throttle)
      |     ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:62:5: error: no previous prototype for ‘xe_read_reason_pl1’ [-Werror=missing-prototypes]
   62 | u32 xe_read_reason_pl1(struct xe_gt_throttle *throttle)
      |     ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:70:5: error: no previous prototype for ‘xe_read_reason_pl2’ [-Werror=missing-prototypes]
   70 | u32 xe_read_reason_pl2(struct xe_gt_throttle *throttle)
      |     ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:78:5: error: no previous prototype for ‘xe_read_reason_pl4’ [-Werror=missing-prototypes]
   78 | u32 xe_read_reason_pl4(struct xe_gt_throttle *throttle)
      |     ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:86:5: error: no previous prototype for ‘xe_read_reason_thermal’ [-Werror=missing-prototypes]
   86 | u32 xe_read_reason_thermal(struct xe_gt_throttle *throttle)
      |     ^~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:94:5: error: no previous prototype for ‘xe_read_reason_prochot’ [-Werror=missing-prototypes]
   94 | u32 xe_read_reason_prochot(struct xe_gt_throttle *throttle)
      |     ^~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:102:5: error: no previous prototype for ‘xe_read_reason_ratl’ [-Werror=missing-prototypes]
  102 | u32 xe_read_reason_ratl(struct xe_gt_throttle *throttle)
      |     ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:110:5: error: no previous prototype for ‘xe_read_reason_vr_thermalert’ [-Werror=missing-prototypes]
  110 | u32 xe_read_reason_vr_thermalert(struct xe_gt_throttle *throttle)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:118:5: error: no previous prototype for ‘xe_read_reason_vr_tdc’ [-Werror=missing-prototypes]
  118 | u32 xe_read_reason_vr_tdc(struct xe_gt_throttle *throttle)
      |     ^~~~~~~~~~~~~~~~~~~~~
  CC [M]  drivers/gpu/drm/xe/xe_range_fence.o
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_gt_throttle_sysfs.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/workspace/kernel/Makefile:2032: drivers/gpu/drm/xe] Error 2
make[1]: Leaving directory '/workspace/kernel/build64-default'
make[1]: *** [/workspace/kernel/Makefile:234: __sub-make] Error 2
make: *** [Makefile:234: __sub-make] Error 2
+ cleanup
+ '[' 1 -eq 1 ']'
+ ./scripts/config --file /workspace/kernel/build64-default/.config --enable CONFIG_DRM_XE_DISPLAY
run-parts: /workspace/ci/hooks/10-build-W1 exited with return code 2


