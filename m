Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD00E7E635
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 13:22:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3F910E3E2;
	Tue, 26 Sep 2023 13:22:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4A7F710E3E2;
 Tue, 26 Sep 2023 13:22:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 494EDAADE1;
 Tue, 26 Sep 2023 13:22:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Tue, 26 Sep 2023 13:22:04 -0000
Message-ID: <169573452429.20978.16161186384418570925@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230926125540.7-1-francois.dugast@intel.com>
In-Reply-To: <20230926125540.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_uAPI_Al?=
 =?utf-8?q?ignment_-_take_1_v3?=
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

Series: uAPI Alignment - take 1 v3
URL   : https://patchwork.freedesktop.org/series/124271/
State : failure

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
+ pwd
+ ls -la
/workspace
total 1052
drwxrwxr-x 10 1003 1003   4096 Sep 26 13:21 .
drwxr-xr-x  1 root root   4096 Sep 26 13:21 ..
-rw-rw-r--  1 1003 1003 789644 Sep 26 13:21 build.log
-rw-rw-r--  1 1003 1003   3252 Sep 26 13:13 checkpatch.log
drwxrwxr-x  5 1003 1003   4096 Sep 26 13:11 ci
drwxrwxr-x  9 1003 1003   4096 Sep 26 13:11 docker
drwxrwxr-x  8 1003 1003   4096 Sep 26 13:11 .git
-rw-rw-r--  1 1003 1003   2027 Sep 26 13:12 git_apply.log
drwxrwxr-x  4 1003 1003   4096 Sep 26 13:11 .github
-rw-rw-r--  1 1003 1003    233 Sep 26 13:11 .groovylintrc.json
-rw-rw-r--  1 1003 1003     78 Sep 26 13:21 hooks.log
drwxrwxr-x 31 1003 1003   4096 Sep 26 13:21 kernel
-rw-rw-r--  1 1003 1003 191915 Sep 26 13:12 kernel.mbox
-rw-rw-r--  1 1003 1003  26482 Sep 26 13:14 kunit.log
-rw-rw-r--  1 1003 1003     48 Sep 26 13:12 parent.tag
drwxrwxr-x 45 1003 1003   4096 Sep 26 13:11 pipelines
-rw-rw-r--  1 1003 1003    793 Sep 26 13:11 README.adoc
drwxrwxr-x  3 1003 1003   4096 Sep 26 13:11 scripts
drwxrwxr-x  2 1003 1003   4096 Sep 26 13:11 .vscode
+ uname -a
Linux 9c074123938c 5.4.0-149-generic #166-Ubuntu SMP Tue Apr 18 16:51:45 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
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
d59f38a61 drm/xe/uapi: Add _FLAG to uAPI constants usable for flags
af9c72343 drm/xe/uapi: Add missing DRM_ prefix in uAPI constants
710037287 drm/xe: Remove useless query config num_params
9de056a38 drm/xe: Extend uAPI to query HuC micro-controler firmware version
52b8b9bd9 drm/xe/uapi: Add pad to drm_xe_engine_class_instance
3cb79850c drm/xe/uapi: Document DRM_XE_DEVICE_QUERY_HWCONFIG
20a107a92 drm/xe: Add uAPI to query micro-controler firmware version
683faf5bb drm/xe: Extend drm_xe_vm_bind_op
08186f954 drm/xe/uapi: Crystal Reference Clock updates
d5409402f drm/xe/uapi: Add documentation for query
b299740d9 drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
2697244ab drm/xe/uapi: Rename gts to gt_list
7452f1dba drm/xe/uapi: Remove unused field of drm_xe_query_gt
ca379205e drm/xe/uapi: Replace useless 'instance' per unique gt_id
24f54cc08 drm/xe/uapi: Document drm_xe_query_gt
2961873bd drm/xe: Fix VM bind out-sync signaling ordering
3f291a866 drm/xe: Remove async worker and rework sync binds
7f6aba850 drm/xe/uapi: Kill DRM_XE_UFENCE_WAIT_VM_ERROR
6f0a08ad9 drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
d3e147345 drm/xe/uapi: Use common drm_xe_ext_set_property extension
8c238f901 drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
4d868dd83 drm/xe: Rename exec_queue_kill_compute to xe_vm_remove_compute_exec_queue
a187384b9 drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE implementation
9fbf6c3c5 drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
f65de3dac drm/xe/uapi: Remove MMIO ioctl
a3e7c95d7 drm/xe/vm: Remove VM_BIND_OP macro
07c2354d3 drm/xe/uapi: Separate VM_BIND's operation and flag
cefcdc6e5 drm/xe: Correlate engine and cpu timestamps with better accuracy
ac53f74e2 drm/xe: Set the correct type for xe_to_user_engine_class
cb15bb2d5 drm/xe: Fix array bounds check for queries
fc8ec3c56 drm/xe: Add Wa_18028616096
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
  CC [M]  drivers/gpu/drm/xe/tests/xe_bo_test.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_dma_buf_test.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_abi.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_migrate_test.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_pci_test.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_rtp_test.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_messages_abi.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_reg_defs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_guc_regs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_gt_regs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_regs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_gpu_commands.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_lrc_layout.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_engine_regs.h
  HDRTEST drivers/gpu/drm/xe/tests/xe_test.h
  HDRTEST drivers/gpu/drm/xe/tests/xe_pci_test.h
  HDRTEST drivers/gpu/drm/xe/tests/xe_migrate_test.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_wa_test.o
  HDRTEST drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
  HDRTEST drivers/gpu/drm/xe/tests/xe_bo_test.h
  HDRTEST drivers/gpu/drm/xe/xe_assert.h
  HDRTEST drivers/gpu/drm/xe/xe_bb.h
  HDRTEST drivers/gpu/drm/xe/xe_bb_types.h
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
  HDRTEST drivers/gpu/drm/xe/xe_execlist.h
  HDRTEST drivers/gpu/drm/xe/xe_execlist_types.h
  HDRTEST drivers/gpu/drm/xe/xe_force_wake.h
  HDRTEST drivers/gpu/drm/xe/xe_force_wake_types.h
  HDRTEST drivers/gpu/drm/xe/xe_ggtt.h
  HDRTEST drivers/gpu/drm/xe/xe_ggtt_types.h
  HDRTEST drivers/gpu/drm/xe/xe_gt.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_clock.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_debugfs.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_mcr.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_pagefault.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_printk.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sysfs.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sysfs_types.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_topology.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_ads.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_ads_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_ct.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_ct_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_debugfs.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_fwif.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_hwconfig.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_log.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_log_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_pc.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_pc_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_submit.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_submit_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_types.h
  HDRTEST drivers/gpu/drm/xe/xe_huc.h
  HDRTEST drivers/gpu/drm/xe/xe_huc_types.h
  HDRTEST drivers/gpu/drm/xe/xe_huc_debugfs.h
  HDRTEST drivers/gpu/drm/xe/xe_hw_engine.h
  HDRTEST drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
  HDRTEST drivers/gpu/drm/xe/xe_hw_engine_types.h
  HDRTEST drivers/gpu/drm/xe/xe_hw_fence.h
  HDRTEST drivers/gpu/drm/xe/xe_hw_fence_types.h
  HDRTEST drivers/gpu/drm/xe/xe_irq.h
  HDRTEST drivers/gpu/drm/xe/xe_lrc.h
  HDRTEST drivers/gpu/drm/xe/xe_lrc_types.h
  HDRTEST drivers/gpu/drm/xe/xe_macros.h
  HDRTEST drivers/gpu/drm/xe/xe_map.h
  HDRTEST drivers/gpu/drm/xe/xe_migrate.h
  HDRTEST drivers/gpu/drm/xe/xe_migrate_doc.h
  HDRTEST drivers/gpu/drm/xe/xe_mmio.h
  HDRTEST drivers/gpu/drm/xe/xe_mocs.h
  HDRTEST drivers/gpu/drm/xe/xe_pat.h
  HDRTEST drivers/gpu/drm/xe/xe_module.h
  HDRTEST drivers/gpu/drm/xe/xe_pci.h
  HDRTEST drivers/gpu/drm/xe/xe_pci_types.h
  HDRTEST drivers/gpu/drm/xe/xe_pcode.h
  HDRTEST drivers/gpu/drm/xe/xe_pcode_api.h
  HDRTEST drivers/gpu/drm/xe/xe_platform_types.h
  HDRTEST drivers/gpu/drm/xe/xe_pm.h
  HDRTEST drivers/gpu/drm/xe/xe_pmu.h
  HDRTEST drivers/gpu/drm/xe/xe_pmu_types.h
  HDRTEST drivers/gpu/drm/xe/xe_preempt_fence.h
  HDRTEST drivers/gpu/drm/xe/xe_preempt_fence_types.h
  HDRTEST drivers/gpu/drm/xe/xe_pt.h
  HDRTEST drivers/gpu/drm/xe/xe_pt_types.h
  HDRTEST drivers/gpu/drm/xe/xe_pt_walk.h
  HDRTEST drivers/gpu/drm/xe/xe_query.h
  HDRTEST drivers/gpu/drm/xe/xe_range_fence.h
  HDRTEST drivers/gpu/drm/xe/xe_reg_sr.h
  HDRTEST drivers/gpu/drm/xe/xe_reg_sr_types.h
  HDRTEST drivers/gpu/drm/xe/xe_reg_whitelist.h
  HDRTEST drivers/gpu/drm/xe/xe_res_cursor.h
  HDRTEST drivers/gpu/drm/xe/xe_ring_ops.h
  HDRTEST drivers/gpu/drm/xe/xe_ring_ops_types.h
  HDRTEST drivers/gpu/drm/xe/xe_rtp.h
  HDRTEST drivers/gpu/drm/xe/xe_rtp_types.h
  HDRTEST drivers/gpu/drm/xe/xe_sa.h
  HDRTEST drivers/gpu/drm/xe/xe_sa_types.h
  HDRTEST drivers/gpu/drm/xe/xe_sched_job.h
  HDRTEST drivers/gpu/drm/xe/xe_sched_job_types.h
  HDRTEST drivers/gpu/drm/xe/xe_step.h
  HDRTEST drivers/gpu/drm/xe/xe_step_types.h
  HDRTEST drivers/gpu/drm/xe/xe_sync.h
  HDRTEST drivers/gpu/drm/xe/xe_sync_types.h
  HDRTEST drivers/gpu/drm/xe/xe_tile.h
  HDRTEST drivers/gpu/drm/xe/xe_tile_sysfs.h
  HDRTEST drivers/gpu/drm/xe/xe_tile_sysfs_types.h
  HDRTEST drivers/gpu/drm/xe/xe_trace.h
  HDRTEST drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
  HDRTEST drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
  HDRTEST drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
  HDRTEST drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
  HDRTEST drivers/gpu/drm/xe/xe_tuning.h
  HDRTEST drivers/gpu/drm/xe/xe_uc.h
  HDRTEST drivers/gpu/drm/xe/xe_uc_debugfs.h
  HDRTEST drivers/gpu/drm/xe/xe_uc_fw.h
  HDRTEST drivers/gpu/drm/xe/xe_uc_fw_abi.h
  HDRTEST drivers/gpu/drm/xe/xe_uc_fw_types.h
  HDRTEST drivers/gpu/drm/xe/xe_uc_types.h
  HDRTEST drivers/gpu/drm/xe/xe_vm.h
  HDRTEST drivers/gpu/drm/xe/xe_vm_doc.h
  HDRTEST drivers/gpu/drm/xe/xe_vm_madvise.h
  HDRTEST drivers/gpu/drm/xe/xe_vm_types.h
  HDRTEST drivers/gpu/drm/xe/xe_wa.h
  HDRTEST drivers/gpu/drm/xe/xe_wait_user_fence.h
  HDRTEST drivers/gpu/drm/xe/xe_wopcm.h
  HDRTEST drivers/gpu/drm/xe/xe_wopcm_types.h
  GEN     xe_wa_oob.c xe_wa_oob.h
  GEN     xe_wa_oob.c xe_wa_oob.h
  CC [M]  drivers/gpu/drm/xe/xe_guc.o
  CC [M]  drivers/gpu/drm/xe/xe_migrate.o
  CC [M]  drivers/gpu/drm/xe/xe_ring_ops.o
  CC [M]  drivers/gpu/drm/xe/xe_vm.o
  CC [M]  drivers/gpu/drm/xe/xe_wa.o
  LD [M]  drivers/gpu/drm/xe/xe.o
  MODPOST drivers/gpu/drm/xe/Module.symvers
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests/xe_bo_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests/xe_dma_buf_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests/xe_migrate_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests/xe_pci_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests/xe_rtp_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests/xe_wa_test.o
  CC [M]  drivers/gpu/drm/xe/xe.mod.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_bo_test.mod.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_dma_buf_test.mod.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_migrate_test.mod.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_pci_test.mod.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_rtp_test.mod.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_wa_test.mod.o
  LD [M]  drivers/gpu/drm/xe/tests/xe_bo_test.ko
  LD [M]  drivers/gpu/drm/xe/tests/xe_rtp_test.ko
  LD [M]  drivers/gpu/drm/xe/xe.ko
  LD [M]  drivers/gpu/drm/xe/tests/xe_pci_test.ko
  LD [M]  drivers/gpu/drm/xe/tests/xe_migrate_test.ko
  LD [M]  drivers/gpu/drm/xe/tests/xe_dma_buf_test.ko
  LD [M]  drivers/gpu/drm/xe/tests/xe_wa_test.ko
make[1]: Leaving directory '/workspace/kernel/build64-default'
+ cleanup
+ '[' 1 -eq 1 ']'
+ ./scripts/config --file /workspace/kernel/build64-default/.config --enable CONFIG_DRM_XE_DISPLAY
run-parts: executing /workspace/ci/hooks/20-kernel-doc
+ SRC_DIR=/workspace/kernel
+ cd /workspace/kernel
+ find drivers/gpu/drm/xe/ -name '*.[ch]' -not -path 'drivers/gpu/drm/xe/display/*'
+ xargs ./scripts/kernel-doc -Werror -none include/uapi/drm/xe_drm.h
include/uapi/drm/xe_drm.h:267: warning: Incorrect use of kernel-doc format:          * Command streamer cycles as read from the command streamer
include/uapi/drm/xe_drm.h:276: warning: Incorrect use of kernel-doc format:          * CPU timestamp in ns. The timestamp is captured before reading the
include/uapi/drm/xe_drm.h:282: warning: Incorrect use of kernel-doc format:          * Time delta in ns captured around reading the lower dword of the
include/uapi/drm/xe_drm.h:288: warning: Incorrect use of kernel-doc format:          * Reference clock id for CPU timestamp. For definition, see
include/uapi/drm/xe_drm.h:297: warning: Function parameter or member 'eci' not described in 'drm_xe_query_cs_cycles'
include/uapi/drm/xe_drm.h:297: warning: Function parameter or member 'rsvd' not described in 'drm_xe_query_cs_cycles'
include/uapi/drm/xe_drm.h:297: warning: Function parameter or member 'cs_cycles' not described in 'drm_xe_query_cs_cycles'
include/uapi/drm/xe_drm.h:297: warning: Function parameter or member 'cs_reference_clock' not described in 'drm_xe_query_cs_cycles'
include/uapi/drm/xe_drm.h:297: warning: Function parameter or member 'cpu_timestamp' not described in 'drm_xe_query_cs_cycles'
include/uapi/drm/xe_drm.h:297: warning: Function parameter or member 'cpu_delta' not described in 'drm_xe_query_cs_cycles'
include/uapi/drm/xe_drm.h:297: warning: Function parameter or member 'clockid' not described in 'drm_xe_query_cs_cycles'
include/uapi/drm/xe_drm.h:297: warning: Function parameter or member 'width' not described in 'drm_xe_query_cs_cycles'
include/uapi/drm/xe_drm.h:494: warning: Function parameter or member 'uc_type' not described in 'drm_xe_query_uc_fw_version'
include/uapi/drm/xe_drm.h:494: warning: Function parameter or member 'major_ver' not described in 'drm_xe_query_uc_fw_version'
include/uapi/drm/xe_drm.h:494: warning: Function parameter or member 'minor_ver' not described in 'drm_xe_query_uc_fw_version'
include/uapi/drm/xe_drm.h:494: warning: Function parameter or member 'patch_ver' not described in 'drm_xe_query_uc_fw_version'
include/uapi/drm/xe_drm.h:494: warning: Function parameter or member 'branch_ver' not described in 'drm_xe_query_uc_fw_version'
17 warnings as Errors
run-parts: /workspace/ci/hooks/20-kernel-doc exited with return code 123


