Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07C5E7AD4F
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 13:55:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B019F10E127;
	Tue,  3 Oct 2023 13:55:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 44EE110E127;
 Tue,  3 Oct 2023 13:55:39 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 42E17AADE1;
 Tue,  3 Oct 2023 13:55:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 03 Oct 2023 13:55:39 -0000
Message-ID: <169634133926.4381.5063195978071113384@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231003125217.3350838-1-lucas.demarchi@intel.com>
In-Reply-To: <20231003125217.3350838-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_xe2=3A_?=
 =?utf-8?q?Add_PAT_programming_=28rev2=29?=
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

Series: xe2: Add PAT programming (rev2)
URL   : https://patchwork.freedesktop.org/series/124430/
State : failure

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
/workspace
+ pwd
+ ls -la
total 916
drwxrwxr-x 10 1003 1003   4096 Oct  3 13:55 .
drwxr-xr-x  1 root root   4096 Oct  3 13:55 ..
-rw-rw-r--  1 1003 1003 795044 Oct  3 13:55 build.log
-rw-rw-r--  1 1003 1003  12526 Oct  3 13:46 checkpatch.log
drwxrwxr-x  5 1003 1003   4096 Oct  3 13:44 ci
drwxrwxr-x  9 1003 1003   4096 Oct  3 13:44 docker
drwxrwxr-x  8 1003 1003   4096 Oct  3 13:44 .git
-rw-rw-r--  1 1003 1003    554 Oct  3 13:46 git_apply.log
drwxrwxr-x  4 1003 1003   4096 Oct  3 13:44 .github
-rw-rw-r--  1 1003 1003    233 Oct  3 13:44 .groovylintrc.json
-rw-rw-r--  1 1003 1003     78 Oct  3 13:55 hooks.log
drwxrwxr-x 31 1003 1003   4096 Oct  3 13:55 kernel
-rw-rw-r--  1 1003 1003  24641 Oct  3 13:46 kernel.mbox
-rw-rw-r--  1 1003 1003  28665 Oct  3 13:48 kunit.log
-rw-rw-r--  1 1003 1003     48 Oct  3 13:46 parent.tag
drwxrwxr-x 45 1003 1003   4096 Oct  3 13:44 pipelines
-rw-rw-r--  1 1003 1003    793 Oct  3 13:44 README.adoc
drwxrwxr-x  3 1003 1003   4096 Oct  3 13:44 scripts
drwxrwxr-x  2 1003 1003   4096 Oct  3 13:44 .vscode
+ uname -a
Linux e545d39c3b85 5.4.0-149-generic #166-Ubuntu SMP Tue Apr 18 16:51:45 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
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
3731dd046 drm/xe/gt: Dump PAT table when failing to initialize
ca58888b7 drm/xe/pat: Add debugfs node to dump PAT
4d2687807 drm/xe/xe2: Add one more bit to encode PAT to ppgtt entries
c4c01d2fa drm/xe/xe2: Program PAT tables
af9e24847 fixup! drm/xe/pat: Prefer the arch/IP names
63ad47d7c drm/xe/xe2: Follow XeHPC for TLB invalidation
248f8b7cc drm/xe/vm: Prefer xe_assert() over XE_WARN_ON()
02ab43e36 drm/xe: Fix exec queue usage for unbinds
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
  UPD     include/config/kernel.release
  UPD     include/generated/compile.h
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
  CC [M]  drivers/gpu/drm/xe/xe_drm_client.o
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
  CC [M]  drivers/gpu/drm/xe/xe_range_fence.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_sr.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_whitelist.o
  CC [M]  drivers/gpu/drm/xe/xe_rtp.o
  CC [M]  drivers/gpu/drm/xe/xe_sa.o
  CC [M]  drivers/gpu/drm/xe/xe_sched_job.o
  CC [M]  drivers/gpu/drm/xe/xe_step.o
  CC [M]  drivers/gpu/drm/xe/xe_sync.o
  CC [M]  drivers/gpu/drm/xe/xe_tile.o
  CC [M]  drivers/gpu/drm/xe/xe_tile_sysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_trace.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_sys_mgr.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_vram_mgr.o
  CC [M]  drivers/gpu/drm/xe/xe_tuning.o
  CC [M]  drivers/gpu/drm/xe/xe_uc.o
  CC [M]  drivers/gpu/drm/xe/xe_uc_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_uc_fw.o
  CC [M]  drivers/gpu/drm/xe/xe_vm_madvise.o
  CC [M]  drivers/gpu/drm/xe/xe_wait_user_fence.o
  CC [M]  drivers/gpu/drm/xe/xe_wopcm.o
  CC [M]  drivers/gpu/drm/xe/xe_pmu.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_klvs_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_errors_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_communication_mmio_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_abi.h
../drivers/gpu/drm/xe/xe_pat.c:161:6: error: no previous prototype for ‘xelp_dump’ [-Werror=missing-prototypes]
  161 | void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
      |      ^~~~~~~~~
  CC [M]  drivers/gpu/drm/xe/tests/xe_bo_test.o
../drivers/gpu/drm/xe/xe_pat.c:193:6: error: no previous prototype for ‘xehp_dump’ [-Werror=missing-prototypes]
  193 | void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
      |      ^~~~~~~~~
../drivers/gpu/drm/xe/xe_pat.c:227:6: error: no previous prototype for ‘xehpc_dump’ [-Werror=missing-prototypes]
  227 | void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
      |      ^~~~~~~~~~
  CC [M]  drivers/gpu/drm/xe/tests/xe_dma_buf_test.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
../drivers/gpu/drm/xe/xe_pat.c:262:6: error: no previous prototype for ‘xelpg_dump’ [-Werror=missing-prototypes]
  262 | void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
      |      ^~~~~~~~~~
  HDRTEST drivers/gpu/drm/xe/abi/guc_messages_abi.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_reg_defs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_guc_regs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_gt_regs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_regs.h
../drivers/gpu/drm/xe/xe_pat.c:320:6: error: no previous prototype for ‘xe2_dump’ [-Werror=missing-prototypes]
  320 | void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
      |      ^~~~~~~~
  HDRTEST drivers/gpu/drm/xe/regs/xe_gpu_commands.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_lrc_layout.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_engine_regs.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_migrate_test.o
  HDRTEST drivers/gpu/drm/xe/tests/xe_test.h
  HDRTEST drivers/gpu/drm/xe/tests/xe_pci_test.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_pci_test.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_rtp_test.o
  HDRTEST drivers/gpu/drm/xe/tests/xe_migrate_test.h
  HDRTEST drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
  HDRTEST drivers/gpu/drm/xe/tests/xe_bo_test.h
  HDRTEST drivers/gpu/drm/xe/xe_assert.h
  HDRTEST drivers/gpu/drm/xe/xe_bb.h
  HDRTEST drivers/gpu/drm/xe/xe_bb_types.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_wa_test.o
  HDRTEST drivers/gpu/drm/xe/xe_bo.h
  HDRTEST drivers/gpu/drm/xe/xe_bo_doc.h
  HDRTEST drivers/gpu/drm/xe/xe_bo_evict.h
  HDRTEST drivers/gpu/drm/xe/xe_bo_types.h
  HDRTEST drivers/gpu/drm/xe/xe_debugfs.h
  HDRTEST drivers/gpu/drm/xe/xe_devcoredump.h
  HDRTEST drivers/gpu/drm/xe/xe_devcoredump_types.h
  HDRTEST drivers/gpu/drm/xe/xe_device.h
  HDRTEST drivers/gpu/drm/xe/xe_device_sysfs.h
  HDRTEST drivers/gpu/drm/xe/xe_device_types.h
  HDRTEST drivers/gpu/drm/xe/xe_dma_buf.h
  HDRTEST drivers/gpu/drm/xe/xe_drm_client.h
  HDRTEST drivers/gpu/drm/xe/xe_drv.h
  HDRTEST drivers/gpu/drm/xe/xe_exec.h
  HDRTEST drivers/gpu/drm/xe/xe_exec_queue.h
  HDRTEST drivers/gpu/drm/xe/xe_exec_queue_types.h
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_pat.o] Error 1
make[3]: *** Waiting for unfinished jobs....
  HDRTEST drivers/gpu/drm/xe/xe_execlist.h
make[2]: *** [/workspace/kernel/Makefile:1913: drivers/gpu/drm/xe] Error 2
make[1]: *** [/workspace/kernel/Makefile:234: __sub-make] Error 2
make[1]: Leaving directory '/workspace/kernel/build64-default'
make: *** [Makefile:234: __sub-make] Error 2
+ cleanup
+ '[' 1 -eq 1 ']'
+ ./scripts/config --file /workspace/kernel/build64-default/.config --enable CONFIG_DRM_XE_DISPLAY
run-parts: /workspace/ci/hooks/10-build-W1 exited with return code 2


