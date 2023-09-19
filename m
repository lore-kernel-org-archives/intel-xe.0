Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EE7CE79A8
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 16:28:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C4A10E133;
	Tue, 19 Sep 2023 16:28:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2621210E133;
 Tue, 19 Sep 2023 16:28:30 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 24362AA01E;
 Tue, 19 Sep 2023 16:28:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Tue, 19 Sep 2023 16:28:30 -0000
Message-ID: <169514091014.3667.14492282538765154697@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
In-Reply-To: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_Add_OA_?=
 =?utf-8?q?functionality_to_Xe_=28rev6=29?=
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

Series: Add OA functionality to Xe (rev6)
URL   : https://patchwork.freedesktop.org/series/121084/
State : failure

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
+ pwd
+ ls -la
/workspace
total 1076
drwxrwxr-x 10 1003 1003   4096 Sep 19 16:28 .
drwxr-xr-x  1 root root   4096 Sep 19 16:28 ..
-rw-rw-r--  1 1003 1003 789718 Sep 19 16:28 build.log
-rw-rw-r--  1 1003 1003   5489 Sep 19 16:19 checkpatch.log
drwxrwxr-x  5 1003 1003   4096 Sep 19 16:17 ci
drwxrwxr-x  9 1003 1003   4096 Sep 19 16:17 docker
drwxrwxr-x  8 1003 1003   4096 Sep 19 16:17 .git
-rw-rw-r--  1 1003 1003   1355 Sep 19 16:19 git_apply.log
drwxrwxr-x  4 1003 1003   4096 Sep 19 16:17 .github
-rw-rw-r--  1 1003 1003    233 Sep 19 16:17 .groovylintrc.json
-rw-rw-r--  1 1003 1003     78 Sep 19 16:28 hooks.log
drwxrwxr-x 31 1003 1003   4096 Sep 19 16:27 kernel
-rw-rw-r--  1 1003 1003 209217 Sep 19 16:19 kernel.mbox
-rw-rw-r--  1 1003 1003  26482 Sep 19 16:21 kunit.log
-rw-rw-r--  1 1003 1003     48 Sep 19 16:19 parent.tag
drwxrwxr-x 45 1003 1003   4096 Sep 19 16:17 pipelines
-rw-rw-r--  1 1003 1003    793 Sep 19 16:17 README.adoc
drwxrwxr-x  3 1003 1003   4096 Sep 19 16:17 scripts
drwxrwxr-x  2 1003 1003   4096 Sep 19 16:17 .vscode
+ uname -a
Linux 7864c87979a7 5.4.0-149-generic #166-Ubuntu SMP Tue Apr 18 16:51:45 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
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
915866552 drm/xe/uapi: Convert OA property key/value pairs to a struct
28114c1e1 drm/xe/uapi: Use OA unit id to identify OA unit
5a9b1d54b drm/xe/uapi: Drop OA_IOCTL_VERSION
8516dd55c drm/xe/uapi: More OA uapi fixes/additions
fd2e16bcb drm/xe/oa: Remove filtering reports on context id
0904e0bef drm/xe/oa: Make xe_oa_timestamp_frequency per gt
53b7fa776 drm/xe/uapi: Remove OA format names from OA uapi
ac80af02e drm/xe/uapi: Simplify OA configs in uapi
608a27016 drm/xe/uapi: Multiplex PERF ops through a single PERF ioctl
091754c18 drm/xe/uapi: "Perf" layer to support multiple perf counter stream types
b725b4c7e drm/xe/oa: Override GuC RC with OA on PVC
28086b4b9 drm/xe/oa: Implement queries
724ef3c8a drm/xe/oa: Read file_operation
779cd1d01 drm/xe/oa: Expose OA stream fd
16aba32a9 drm/xe/oa: OA stream initialization
9d835612f drm/xe/oa: Start implementing OA stream open ioctl
07959d2ac drm/xe/oa: Add/remove config ioctl's
fb603a692 drm/xe/oa: Module init/exit and probe/remove
e003a1a12 drm/xe/oa: Add registers and GPU commands used by OA
a75037184 drm/xe/oa: Add OA types
d26d60548 drm/xe/uapi: Introduce OA (observability architecture) uapi
fac2e20c7 Revert "FIXME: drm/i915/hpd: skip intel_hpd_poll_fini() for non-display paths"
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
  CC [M]  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o
  HOSTCC  drivers/gpu/drm/xe/xe_gen_wa_oob
  CC [M]  drivers/gpu/drm/xe/xe_gt_topology.o
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
  CC [M]  drivers/gpu/drm/xe/xe_oa.o
  CC [M]  drivers/gpu/drm/xe/xe_pat.o
  CC [M]  drivers/gpu/drm/xe/xe_pci.o
  CC [M]  drivers/gpu/drm/xe/xe_pcode.o
  CC [M]  drivers/gpu/drm/xe/xe_perf.o
  CC [M]  drivers/gpu/drm/xe/xe_pm.o
  CC [M]  drivers/gpu/drm/xe/xe_preempt_fence.o
  CC [M]  drivers/gpu/drm/xe/xe_pt.o
  CC [M]  drivers/gpu/drm/xe/xe_pt_walk.o
../drivers/gpu/drm/xe/xe_perf.c:9:5: error: no previous prototype for ‘xe_oa_ioctl’ [-Werror=missing-prototypes]
    9 | int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_perf_param *arg, struct drm_file *file)
      |     ^~~~~~~~~~~
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_perf.o] Error 1
make[3]: *** Waiting for unfinished jobs....
../drivers/gpu/drm/xe/xe_guc_pc.c:821: warning: expecting prototype for xe_guc_pc_override_gucrc_mode(). Prototype was for xe_guc_pc_unset_gucrc_mode() instead
make[2]: *** [/workspace/kernel/Makefile:2032: drivers/gpu/drm/xe] Error 2
make[1]: *** [/workspace/kernel/Makefile:234: __sub-make] Error 2
make[1]: Leaving directory '/workspace/kernel/build64-default'
make: *** [Makefile:234: __sub-make] Error 2
+ cleanup
+ '[' 1 -eq 1 ']'
+ ./scripts/config --file /workspace/kernel/build64-default/.config --enable CONFIG_DRM_XE_DISPLAY
run-parts: /workspace/ci/hooks/10-build-W1 exited with return code 2


