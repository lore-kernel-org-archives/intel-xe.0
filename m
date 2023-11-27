Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94518C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 14:48:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579B710E08E;
	Mon, 27 Nov 2023 14:48:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 032A510E08E;
 Mon, 27 Nov 2023 14:48:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F3795A0003;
 Mon, 27 Nov 2023 14:48:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Mon, 27 Nov 2023 14:48:28 -0000
Message-ID: <170109650899.3004.18018557003957859988@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231127141125.2913415-1-riana.tauro@intel.com>
In-Reply-To: <20231127141125.2913415-1-riana.tauro@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_Engine_?=
 =?utf-8?q?Busyness?=
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

Series: Engine Busyness
URL   : https://patchwork.freedesktop.org/series/126919/
State : failure

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
/workspace
+ pwd
+ ls -la
total 952
drwxrwxr-x 12 1003 1003   4096 Nov 27 14:48 .
drwxr-xr-x  1 root root   4096 Nov 27 14:48 ..
-rw-rw-r--  1 1003 1003 799752 Nov 27 14:48 build.log
-rw-rw-r--  1 1003 1003   2675 Nov 27 14:39 checkpatch.log
drwxrwxr-x  5 1003 1003   4096 Nov 27 14:37 ci
drwxrwxr-x  9 1003 1003   4096 Nov 27 14:37 docker
drwxrwxr-x  8 1003 1003   4096 Nov 27 14:37 .git
-rw-rw-r--  1 1003 1003    742 Nov 27 14:39 git_apply.log
drwxrwxr-x  4 1003 1003   4096 Nov 27 14:37 .github
-rw-rw-r--  1 1003 1003    233 Nov 27 14:37 .groovylintrc.json
-rw-rw-r--  1 1003 1003     78 Nov 27 14:48 hooks.log
drwxrwxr-x 31 1003 1003   4096 Nov 27 14:48 kernel
-rw-rw-r--  1 1003 1003  55722 Nov 27 14:39 kernel.mbox
-rw-rw-r--  1 1003 1003  28940 Nov 27 14:40 kunit.log
-rw-rw-r--  1 1003 1003     48 Nov 27 14:39 parent.tag
-rw-rw-r--  1 1003 1003    270 Nov 27 14:39 parent_tag_mismatch_alert.txt
drwxrwxr-x 44 1003 1003   4096 Nov 27 14:37 pipelines
-rw-rw-r--  1 1003 1003    793 Nov 27 14:37 README.adoc
drwxrwxr-x  3 1003 1003   4096 Nov 27 14:37 scripts
drwxrwxr-x  3 1003 1003   4096 Nov 27 14:37 src
drwxrwxr-x  2 1003 1003   4096 Nov 27 14:37 vars
drwxrwxr-x  2 1003 1003   4096 Nov 27 14:37 .vscode
+ uname -a
Linux 19767ae0af39 5.4.0-164-generic #181-Ubuntu SMP Fri Sep 1 13:41:22 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
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
8f11e6113 RFC drm/xe/guc: Handle runtime suspend issues for engine busyness
85ee8e178 RFC drm/xe/guc: Dynamically enable/disable engine busyness stats
e64137d3b RFC drm/xe/pmu: Add PMU counters for engine busy ticks
104cefe81 RFC drm/xe/uapi: Add configs for Engine busyness
75a8af35b RFC drm/xe/guc: Add PMU counter for total active ticks
1f0ff0d4f RFC drm/xe/guc: Expose engine busyness only for supported GuC version
847cf12ac RFC drm/xe/guc: Add interface for engine busyness ticks
ead33731f RFC drm/xe: Move user engine class mappings to header
7c4b213b5 drm/xe: Internally change the compute_mode and no_dma_fence mode naming
run-parts: executing /workspace/ci/hooks/10-build-W1
+ SRC_DIR=/workspace/kernel
+ RESTORE_DISPLAY_CONFIG=0
+ '[' -n /workspace/kernel/build64-default ']'
+ BUILD_DIR=/workspace/kernel/build64-default
+ cd /workspace/kernel
++ nproc
+ make -j48 O=/workspace/kernel/build64-default modules_prepare
make[1]: Entering directory '/workspace/kernel/build64-default'
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
  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/subcmd-config.o
  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/sigchain.o
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
  CC [M]  drivers/gpu/drm/xe/xe_gpu_scheduler.o
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
  CC [M]  drivers/gpu/drm/xe/xe_guc_engine_busyness.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_hwconfig.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_log.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_pc.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_submit.o
  CC [M]  drivers/gpu/drm/xe/xe_heci_gsc.o
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
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_devcoredump.c:7:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/xe_bb.c:10:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_debugfs.c:13:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/xe_device_sysfs.c:12:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_bo_evict.c:8:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_force_wake.c:6:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_gt.h:12,
                 from ../drivers/gpu/drm/xe/xe_gt_sysfs.c:13:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/xe_gt_idle_sysfs.c:8:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/xe_gt_debugfs.c:11:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_device_sysfs.o] Error 1
make[3]: *** Waiting for unfinished jobs....
In file included from ../drivers/gpu/drm/xe/xe_gt_types.h:11,
                 from ../drivers/gpu/drm/xe/xe_gt_topology.h:9,
                 from ../drivers/gpu/drm/xe/xe_gt_topology.c:6:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_ggtt.c:15:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_dma_buf.c:17:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_exec.c:14:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_gt_sysfs.o] Error 1
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/xe_gt_clock.c:10:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/xe_device.c:6:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_devcoredump.o] Error 1
In file included from ../drivers/gpu/drm/xe/xe_gt_types.h:11,
                 from ../drivers/gpu/drm/xe/xe_pmu.h:9,
                 from ../drivers/gpu/drm/xe/xe_module.c:15:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_gt.h:12,
                 from ../drivers/gpu/drm/xe/xe_gt_mcr.c:9:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/xe_guc_debugfs.c:11:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_heci_gsc.c:12:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_execlist.c:16:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_gt.h:12,
                 from ../drivers/gpu/drm/xe/xe_gt.c:6:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_gt.h:12,
                 from ../drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:10:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_gt_idle_sysfs.o] Error 1
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_module.o] Error 1
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc_log.c:10:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/xe_huc_debugfs.c:11:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_bb.o] Error 1
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc_engine_busyness.c:9:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_gt.h:12,
                 from ../drivers/gpu/drm/xe/xe_pcode.c:13:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_guc_debugfs.o] Error 1
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_gt_clock.o] Error 1
cc1: all warnings being treated as errors
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_huc_debugfs.o] Error 1
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_huc.c:9:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_force_wake.o] Error 1
cc1: all warnings being treated as errors
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/xe_irq.c:14:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc_ads.c:13:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_gt_topology.o] Error 1
cc1: all warnings being treated as errors
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_bo_evict.o] Error 1
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_heci_gsc.o] Error 1
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc_pc.c:14:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_hw_engine.h:9,
                 from ../drivers/gpu/drm/xe/xe_hw_engine.c:6:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_drm_client.c:12:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_debugfs.o] Error 1
cc1: all warnings being treated as errors
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_mmio.h:13,
                 from ../drivers/gpu/drm/xe/xe_mmio.c:8:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc_hwconfig.c:10:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_gt_debugfs.o] Error 1
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/xe_pci.c:19:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_guc_log.o] Error 1
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_pm.c:13:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_exec_queue_types.h:14,
                 from ../drivers/gpu/drm/xe/xe_exec_queue.h:9,
                 from ../drivers/gpu/drm/xe/xe_preempt_fence.c:10:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_pcode.o] Error 1
cc1: all warnings being treated as errors
cc1: all warnings being treated as errors
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_mocs.c:9:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_exec_queue_types.h:14,
                 from ../drivers/gpu/drm/xe/xe_exec_queue.h:9,
                 from ../drivers/gpu/drm/xe/xe_exec_queue.c:6:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_dma_buf.o] Error 1
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_huc.o] Error 1
cc1: all warnings being treated as errors
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_device.h:15,
                 from ../drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:8:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_bo.c:6:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_guc_hwconfig.o] Error 1
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_hw_fence.c:11:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_guc_engine_busyness.o] Error 1
cc1: all warnings being treated as errors
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_drm_client.o] Error 1
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_preempt_fence.o] Error 1
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_exec.o] Error 1
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_gt_mcr.o] Error 1
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.o] Error 1
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_gt_pagefault.c:15:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_ggtt.o] Error 1
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc_ct.c:14:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_mmio.o] Error 1
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_guc_submit.c:17:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_hw_fence.o] Error 1
cc1: all warnings being treated as errors
cc1: all warnings being treated as errors
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_device.o] Error 1
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_pci.o] Error 1
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_pm.o] Error 1
cc1: all warnings being treated as errors
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_mocs.o] Error 1
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_execlist.o] Error 1
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_gt.o] Error 1
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_guc_pc.o] Error 1
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o] Error 1
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_hw_engine.o] Error 1
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_assert.h:13,
                 from ../drivers/gpu/drm/xe/xe_pat.c:9:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_gt_pagefault.o] Error 1
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_irq.o] Error 1
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_guc_ads.o] Error 1
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_pt.c:8:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_exec_queue.o] Error 1
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_pat.o] Error 1
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_guc_ct.o] Error 1
In file included from ../drivers/gpu/drm/xe/xe_devcoredump_types.h:12,
                 from ../drivers/gpu/drm/xe/xe_device_types.h:15,
                 from ../drivers/gpu/drm/xe/xe_vm_types.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.h:13,
                 from ../drivers/gpu/drm/xe/xe_lrc.c:16:
../drivers/gpu/drm/xe/xe_hw_engine_types.h:71:35: error: ‘xe_user_to_engine_class’ defined but not used [-Werror=unused-const-variable=]
   71 | static const enum xe_engine_class xe_user_to_engine_class[] = {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine_types.h:63:18: error: ‘xe_engine_to_user_class’ defined but not used [-Werror=unused-const-variable=]
   63 | static const u16 xe_engine_to_user_class[] = {
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_pt.o] Error 1
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_bo.o] Error 1
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_guc_submit.o] Error 1
cc1: all warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_lrc.o] Error 1
make[2]: *** [/workspace/kernel/Makefile:1913: drivers/gpu/drm/xe] Error 2
make[1]: *** [/workspace/kernel/Makefile:234: __sub-make] Error 2
make[1]: Leaving directory '/workspace/kernel/build64-default'
make: *** [Makefile:234: __sub-make] Error 2
run-parts: /workspace/ci/hooks/10-build-W1 exited with return code 2


