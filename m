Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE116C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 13:21:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC9711A464;
	Thu, 25 Apr 2024 13:21:11 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3CB11A465;
 Thu, 25 Apr 2024 13:21:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EHooks=3A_success_for_drm/xe=3A_Add_engine_name_to_t?=
 =?utf-8?q?he_engine_reset_and_cat-err_log?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Apr 2024 13:21:09 -0000
Message-ID: <171405126924.1650662.6810042680587081546@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240425121856.4500-1-nirmoy.das@intel.com>
In-Reply-To: <20240425121856.4500-1-nirmoy.das@intel.com>
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

Series: drm/xe: Add engine name to the engine reset and cat-err log
URL   : https://patchwork.freedesktop.org/series/132907/
State : success

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
+ export
+ grep -Ei '(^|\W)CI_'
declare -x CI_KERNEL_BUILD_DIR="/workspace/kernel/build64-default"
declare -x CI_KERNEL_SRC_DIR="/workspace/kernel"
declare -x CI_TOOLS_SRC_DIR="/workspace/ci"
declare -x CI_WORKSPACE_DIR="/workspace"
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
  UPD     include/generated/compile.h
  UPD     include/config/kernel.release
mkdir -p /workspace/kernel/build64-default/tools/objtool && make O=/workspace/kernel/build64-default subdir=tools/objtool --no-print-directory -C objtool 
  UPD     include/generated/utsrelease.h
  HOSTCC  /workspace/kernel/build64-default/tools/objtool/fixdep.o
  CALL    ../scripts/checksyscalls.sh
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
  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/orc.o
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
  HOSTCC  drivers/gpu/drm/xe/xe_gen_wa_oob
  CC [M]  drivers/gpu/drm/xe/xe_gsc_proxy.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc_submit.o
  CC [M]  drivers/gpu/drm/xe/xe_gt.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_ccs_mode.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_clock.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_freq.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_idle.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_mcr.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_pagefault.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_topology.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_ct.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_db_mgr.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_hwconfig.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_id_mgr.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_klv_helpers.o
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
  CC [M]  drivers/gpu/drm/xe/xe_pt_walk.o
  CC [M]  drivers/gpu/drm/xe/xe_query.o
  CC [M]  drivers/gpu/drm/xe/xe_range_fence.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_sr.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_whitelist.o
  CC [M]  drivers/gpu/drm/xe/xe_rtp.o
  GEN     xe_wa_oob.c xe_wa_oob.h
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
  CC [M]  drivers/gpu/drm/xe/xe_vm.o
  CC [M]  drivers/gpu/drm/xe/xe_vram_freq.o
  CC [M]  drivers/gpu/drm/xe/xe_wait_user_fence.o
  CC [M]  drivers/gpu/drm/xe/xe_wa.o
  CC [M]  drivers/gpu/drm/xe/xe_wopcm.o
  CC [M]  drivers/gpu/drm/xe/xe_hmm.o
  CC [M]  drivers/gpu/drm/xe/xe_hwmon.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_relay.o
  CC [M]  drivers/gpu/drm/xe/xe_memirq.o
  CC [M]  drivers/gpu/drm/xe/xe_sriov.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sriov_pf.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.o
  CC [M]  drivers/gpu/drm/xe/xe_lmtt.o
  CC [M]  drivers/gpu/drm/xe/xe_lmtt_2l.o
  CC [M]  drivers/gpu/drm/xe/xe_lmtt_ml.o
  CC [M]  drivers/gpu/drm/xe/xe_sriov_pf.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_kunit_helpers.o
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_irq.o
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_utils.o
  CC [M]  drivers/gpu/drm/xe/display/intel_fb_bo.o
  CC [M]  drivers/gpu/drm/xe/display/intel_fbdev_fb.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_misc.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_rps.o
  CC [M]  drivers/gpu/drm/xe/display/xe_dsb_buffer.o
  CC [M]  drivers/gpu/drm/xe/display/xe_fb_pin.o
  CC [M]  drivers/gpu/drm/xe/display/xe_hdcp_gsc.o
  CC [M]  drivers/gpu/drm/xe/display/xe_plane_initial.o
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_dram.o
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_pch.o
  CC [M]  drivers/gpu/drm/xe/i915-display/icl_dsi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic_plane.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_audio.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_backlight.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bios.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cdclk.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_color.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_combo_phy.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_connector.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc_state_dump.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cursor.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cx0_phy.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi_buf_trans.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_device.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_driver.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_irq.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_params.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_map.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_well.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_trace.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_wa.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dkl_phy.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dmc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_aux.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_aux_backlight.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_hdcp.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_link_training.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_mst.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpll.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpll_mgr.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpt_common.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_drrs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsb.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_dcs_backlight.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_vbt.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fb.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fbc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fdi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fifo_underrun.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_frontbuffer.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_global_state.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_gmbus.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdcp.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdcp_gsc_message.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdmi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hotplug.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hotplug_irq.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hti.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_link_bw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_lspcon.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_lock.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_setup.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_verify.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_panel.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pmdemand.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pps.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_psr.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_qp_tables.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_quirks.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_snps_phy.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_tc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vblank.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vdsc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vga.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vrr.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dmc_wl.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_wm.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_scaler.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_universal_plane.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_watermark.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_acpi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_opregion.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fbdev.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs_params.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pipe_crc.o
  HDRTEST drivers/gpu/drm/xe/abi/gsc_proxy_commands_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_klvs_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_live_test_mod.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_bo_test.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_dma_buf_test.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_errors_abi.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_migrate_test.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_relay_communication_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_communication_mmio_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_messages_abi.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_mocs_test.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_test_mod.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_trace.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_active_types.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_config.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_debugfs.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/soc/intel_gmch.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_pci_test.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mman.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_rtp_test.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_wa_test.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gt/intel_rps.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_gt_types.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_active.h
  HDRTEST drivers/gpu/drm/xe/display/xe_display.h
  HDRTEST drivers/gpu/drm/xe/display/intel_fb_bo.h
  HDRTEST drivers/gpu/drm/xe/display/intel_fbdev_fb.h
  HDRTEST drivers/gpu/drm/xe/instructions/xe_gfx_state_commands.h
  HDRTEST drivers/gpu/drm/xe/instructions/xe_instr_defs.h
  HDRTEST drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
  HDRTEST drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
  HDRTEST drivers/gpu/drm/xe/instructions/xe_mi_commands.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_gsc_regs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_reg_defs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_guc_regs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_gt_regs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_regs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_pcode_regs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_gpu_commands.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_sriov_regs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_lrc_layout.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_gtt_defs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_engine_regs.h
  HDRTEST drivers/gpu/drm/xe/tests/xe_test.h
  HDRTEST drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
  HDRTEST drivers/gpu/drm/xe/tests/xe_pci_test.h
  HDRTEST drivers/gpu/drm/xe/tests/xe_migrate_test.h
  HDRTEST drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
  HDRTEST drivers/gpu/drm/xe/tests/xe_mocs_test.h
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
  LD [M]  drivers/gpu/drm/xe/tests/xe_live_test.o
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
  HDRTEST drivers/gpu/drm/xe/xe_gpu_scheduler.h
  HDRTEST drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
  HDRTEST drivers/gpu/drm/xe/xe_gsc.h
  HDRTEST drivers/gpu/drm/xe/xe_gsc_proxy.h
  HDRTEST drivers/gpu/drm/xe/xe_gsc_submit.h
  HDRTEST drivers/gpu/drm/xe/xe_gsc_types.h
  HDRTEST drivers/gpu/drm/xe/xe_gt.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_ccs_mode.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_clock.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_debugfs.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_freq.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_idle.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_idle_types.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_mcr.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_pagefault.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_printk.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sriov_pf.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sriov_pf_service_types.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sriov_printk.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sysfs.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sysfs_types.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_topology.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_ads.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_ads_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_ct.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_ct_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_db_mgr.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_debugfs.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_fwif.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_hwconfig.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_hxg_helpers.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_id_mgr.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_klv_helpers.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_log.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_log_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_pc.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_pc_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_relay.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_relay_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_submit.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_submit_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_types.h
  HDRTEST drivers/gpu/drm/xe/xe_heci_gsc.h
  HDRTEST drivers/gpu/drm/xe/xe_hmm.h
  HDRTEST drivers/gpu/drm/xe/xe_huc.h
  HDRTEST drivers/gpu/drm/xe/xe_huc_debugfs.h
  HDRTEST drivers/gpu/drm/xe/xe_huc_types.h
  HDRTEST drivers/gpu/drm/xe/xe_hw_engine.h
  HDRTEST drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
  HDRTEST drivers/gpu/drm/xe/xe_hw_engine_types.h
  HDRTEST drivers/gpu/drm/xe/xe_hw_fence.h
  HDRTEST drivers/gpu/drm/xe/xe_hw_fence_types.h
  HDRTEST drivers/gpu/drm/xe/xe_hwmon.h
  HDRTEST drivers/gpu/drm/xe/xe_irq.h
  HDRTEST drivers/gpu/drm/xe/xe_lmtt.h
  HDRTEST drivers/gpu/drm/xe/xe_lmtt_types.h
  HDRTEST drivers/gpu/drm/xe/xe_lrc.h
  LD [M]  drivers/gpu/drm/xe/tests/xe_test.o
  HDRTEST drivers/gpu/drm/xe/xe_lrc_types.h
  HDRTEST drivers/gpu/drm/xe/xe_macros.h
  HDRTEST drivers/gpu/drm/xe/xe_map.h
  HDRTEST drivers/gpu/drm/xe/xe_memirq.h
  HDRTEST drivers/gpu/drm/xe/xe_memirq_types.h
  HDRTEST drivers/gpu/drm/xe/xe_migrate.h
  HDRTEST drivers/gpu/drm/xe/xe_migrate_doc.h
  HDRTEST drivers/gpu/drm/xe/xe_mmio.h
  HDRTEST drivers/gpu/drm/xe/xe_mocs.h
  HDRTEST drivers/gpu/drm/xe/xe_module.h
  HDRTEST drivers/gpu/drm/xe/xe_pat.h
  HDRTEST drivers/gpu/drm/xe/xe_pci.h
  HDRTEST drivers/gpu/drm/xe/xe_pci_types.h
  HDRTEST drivers/gpu/drm/xe/xe_pcode.h
  HDRTEST drivers/gpu/drm/xe/xe_pcode_api.h
  HDRTEST drivers/gpu/drm/xe/xe_platform_types.h
  HDRTEST drivers/gpu/drm/xe/xe_pm.h
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
  HDRTEST drivers/gpu/drm/xe/xe_sriov.h
  HDRTEST drivers/gpu/drm/xe/xe_sriov_pf.h
  HDRTEST drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
  HDRTEST drivers/gpu/drm/xe/xe_sriov_printk.h
  HDRTEST drivers/gpu/drm/xe/xe_sriov_types.h
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
  HDRTEST drivers/gpu/drm/xe/xe_vm_types.h
  HDRTEST drivers/gpu/drm/xe/xe_vram_freq.h
  HDRTEST drivers/gpu/drm/xe/xe_wa.h
  HDRTEST drivers/gpu/drm/xe/xe_wait_user_fence.h
  HDRTEST drivers/gpu/drm/xe/xe_wopcm.h
  HDRTEST drivers/gpu/drm/xe/xe_wopcm_types.h
  CC [M]  drivers/gpu/drm/xe/xe_gsc.o
  CC [M]  drivers/gpu/drm/xe/xe_guc.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_ads.o
  CC [M]  drivers/gpu/drm/xe/xe_migrate.o
  CC [M]  drivers/gpu/drm/xe/xe_ring_ops.o
  LD [M]  drivers/gpu/drm/xe/xe.o
  MODPOST drivers/gpu/drm/xe/Module.symvers
  CC [M]  drivers/gpu/drm/xe/xe.mod.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_live_test.mod.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_test.mod.o
  LD [M]  drivers/gpu/drm/xe/tests/xe_test.ko
  LD [M]  drivers/gpu/drm/xe/tests/xe_live_test.ko
  LD [M]  drivers/gpu/drm/xe/xe.ko
make[1]: Leaving directory '/workspace/kernel/build64-default'
run-parts: executing /workspace/ci/hooks/11-build-32b
+++ realpath /workspace/ci/hooks/11-build-32b
++ dirname /workspace/ci/hooks/11-build-32b
+ THIS_SCRIPT_DIR=/workspace/ci/hooks
+ SRC_DIR=/workspace/kernel
+ TOOLS_SRC_DIR=/workspace/ci
+ '[' -n /workspace/kernel/build64-default ']'
+ BUILD_DIR=/workspace/kernel/build64-default
+ BUILD_DIR=/workspace/kernel/build64-default/build32
+ cd /workspace/kernel
+ mkdir -p /workspace/kernel/build64-default/build32
++ nproc
+ make -j48 ARCH=i386 O=/workspace/kernel/build64-default/build32 defconfig
make[1]: Entering directory '/workspace/kernel/build64-default/build32'
  GEN     Makefile
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/menu.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTLD  scripts/kconfig/conf
*** Default configuration is based on 'i386_defconfig'
#
# configuration written to .config
#
make[1]: Leaving directory '/workspace/kernel/build64-default/build32'
+ cd /workspace/kernel/build64-default/build32
+ /workspace/kernel/scripts/kconfig/merge_config.sh .config /workspace/ci/kernel/10-xe.fragment
Using .config as base
Merging /workspace/ci/kernel/10-xe.fragment
Value of CONFIG_DRM_XE is redefined by fragment /workspace/ci/kernel/10-xe.fragment:
Previous value: # CONFIG_DRM_XE is not set
New value: CONFIG_DRM_XE=m

Value of CONFIG_SND_DEBUG is redefined by fragment /workspace/ci/kernel/10-xe.fragment:
Previous value: # CONFIG_SND_DEBUG is not set
New value: CONFIG_SND_DEBUG=y

Value of CONFIG_SND_HDA_INTEL is redefined by fragment /workspace/ci/kernel/10-xe.fragment:
Previous value: CONFIG_SND_HDA_INTEL=y
New value: CONFIG_SND_HDA_INTEL=m

Value of CONFIG_SND_HDA_CODEC_HDMI is redefined by fragment /workspace/ci/kernel/10-xe.fragment:
Previous value: # CONFIG_SND_HDA_CODEC_HDMI is not set
New value: CONFIG_SND_HDA_CODEC_HDMI=m

  GEN     Makefile

WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
  Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
  Selected by [m]:
  - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM_XE [=m] && DRM_XE [=m]=m
#
# configuration written to .config
#
Value requested for CONFIG_HAVE_UID16 not in final .config
Requested value:  CONFIG_HAVE_UID16=y
Actual value:     

Value requested for CONFIG_UID16 not in final .config
Requested value:  CONFIG_UID16=y
Actual value:     

Value requested for CONFIG_X86_32 not in final .config
Requested value:  CONFIG_X86_32=y
Actual value:     

Value requested for CONFIG_OUTPUT_FORMAT not in final .config
Requested value:  CONFIG_OUTPUT_FORMAT="elf32-i386"
Actual value:     CONFIG_OUTPUT_FORMAT="elf64-x86-64"

Value requested for CONFIG_ARCH_MMAP_RND_BITS_MIN not in final .config
Requested value:  CONFIG_ARCH_MMAP_RND_BITS_MIN=8
Actual value:     CONFIG_ARCH_MMAP_RND_BITS_MIN=28

Value requested for CONFIG_ARCH_MMAP_RND_BITS_MAX not in final .config
Requested value:  CONFIG_ARCH_MMAP_RND_BITS_MAX=16
Actual value:     CONFIG_ARCH_MMAP_RND_BITS_MAX=32

Value requested for CONFIG_PGTABLE_LEVELS not in final .config
Requested value:  CONFIG_PGTABLE_LEVELS=2
Actual value:     CONFIG_PGTABLE_LEVELS=5

Value requested for CONFIG_X86_BIGSMP not in final .config
Requested value:  # CONFIG_X86_BIGSMP is not set
Actual value:     

Value requested for CONFIG_X86_INTEL_QUARK not in final .config
Requested value:  # CONFIG_X86_INTEL_QUARK is not set
Actual value:     

Value requested for CONFIG_X86_RDC321X not in final .config
Requested value:  # CONFIG_X86_RDC321X is not set
Actual value:     

Value requested for CONFIG_X86_32_NON_STANDARD not in final .config
Requested value:  # CONFIG_X86_32_NON_STANDARD is not set
Actual value:     

Value requested for CONFIG_X86_32_IRIS not in final .config
Requested value:  # CONFIG_X86_32_IRIS is not set
Actual value:     

Value requested for CONFIG_M486SX not in final .config
Requested value:  # CONFIG_M486SX is not set
Actual value:     

Value requested for CONFIG_M486 not in final .config
Requested value:  # CONFIG_M486 is not set
Actual value:     

Value requested for CONFIG_M586 not in final .config
Requested value:  # CONFIG_M586 is not set
Actual value:     

Value requested for CONFIG_M586TSC not in final .config
Requested value:  # CONFIG_M586TSC is not set
Actual value:     

Value requested for CONFIG_M586MMX not in final .config
Requested value:  # CONFIG_M586MMX is not set
Actual value:     

Value requested for CONFIG_M686 not in final .config
Requested value:  CONFIG_M686=y
Actual value:     

Value requested for CONFIG_MPENTIUMII not in final .config
Requested value:  # CONFIG_MPENTIUMII is not set
Actual value:     

Value requested for CONFIG_MPENTIUMIII not in final .config
Requested value:  # CONFIG_MPENTIUMIII is not set
Actual value:     

Value requested for CONFIG_MPENTIUMM not in final .config
Requested value:  # CONFIG_MPENTIUMM is not set
Actual value:     

Value requested for CONFIG_MPENTIUM4 not in final .config
Requested value:  # CONFIG_MPENTIUM4 is not set
Actual value:     

Value requested for CONFIG_MK6 not in final .config
Requested value:  # CONFIG_MK6 is not set
Actual value:     

Value requested for CONFIG_MK7 not in final .config
Requested value:  # CONFIG_MK7 is not set
Actual value:     

Value requested for CONFIG_MCRUSOE not in final .config
Requested value:  # CONFIG_MCRUSOE is not set
Actual value:     

Value requested for CONFIG_MEFFICEON not in final .config
Requested value:  # CONFIG_MEFFICEON is not set
Actual value:     

Value requested for CONFIG_MWINCHIPC6 not in final .config
Requested value:  # CONFIG_MWINCHIPC6 is not set
Actual value:     

Value requested for CONFIG_MWINCHIP3D not in final .config
Requested value:  # CONFIG_MWINCHIP3D is not set
Actual value:     

Value requested for CONFIG_MELAN not in final .config
Requested value:  # CONFIG_MELAN is not set
Actual value:     

Value requested for CONFIG_MGEODEGX1 not in final .config
Requested value:  # CONFIG_MGEODEGX1 is not set
Actual value:     

Value requested for CONFIG_MGEODE_LX not in final .config
Requested value:  # CONFIG_MGEODE_LX is not set
Actual value:     

Value requested for CONFIG_MCYRIXIII not in final .config
Requested value:  # CONFIG_MCYRIXIII is not set
Actual value:     

Value requested for CONFIG_MVIAC3_2 not in final .config
Requested value:  # CONFIG_MVIAC3_2 is not set
Actual value:     

Value requested for CONFIG_MVIAC7 not in final .config
Requested value:  # CONFIG_MVIAC7 is not set
Actual value:     

Value requested for CONFIG_X86_GENERIC not in final .config
Requested value:  # CONFIG_X86_GENERIC is not set
Actual value:     

Value requested for CONFIG_X86_INTERNODE_CACHE_SHIFT not in final .config
Requested value:  CONFIG_X86_INTERNODE_CACHE_SHIFT=5
Actual value:     CONFIG_X86_INTERNODE_CACHE_SHIFT=6

Value requested for CONFIG_X86_L1_CACHE_SHIFT not in final .config
Requested value:  CONFIG_X86_L1_CACHE_SHIFT=5
Actual value:     CONFIG_X86_L1_CACHE_SHIFT=6

Value requested for CONFIG_X86_USE_PPRO_CHECKSUM not in final .config
Requested value:  CONFIG_X86_USE_PPRO_CHECKSUM=y
Actual value:     

Value requested for CONFIG_X86_MINIMUM_CPU_FAMILY not in final .config
Requested value:  CONFIG_X86_MINIMUM_CPU_FAMILY=6
Actual value:     CONFIG_X86_MINIMUM_CPU_FAMILY=64

Value requested for CONFIG_CPU_SUP_TRANSMETA_32 not in final .config
Requested value:  CONFIG_CPU_SUP_TRANSMETA_32=y
Actual value:     

Value requested for CONFIG_CPU_SUP_VORTEX_32 not in final .config
Requested value:  CONFIG_CPU_SUP_VORTEX_32=y
Actual value:     

Value requested for CONFIG_HPET_TIMER not in final .config
Requested value:  # CONFIG_HPET_TIMER is not set
Actual value:     CONFIG_HPET_TIMER=y

Value requested for CONFIG_NR_CPUS_RANGE_END not in final .config
Requested value:  CONFIG_NR_CPUS_RANGE_END=8
Actual value:     CONFIG_NR_CPUS_RANGE_END=512

Value requested for CONFIG_NR_CPUS_DEFAULT not in final .config
Requested value:  CONFIG_NR_CPUS_DEFAULT=8
Actual value:     CONFIG_NR_CPUS_DEFAULT=64

Value requested for CONFIG_X86_ANCIENT_MCE not in final .config
Requested value:  # CONFIG_X86_ANCIENT_MCE is not set
Actual value:     

Value requested for CONFIG_X86_LEGACY_VM86 not in final .config
Requested value:  # CONFIG_X86_LEGACY_VM86 is not set
Actual value:     

Value requested for CONFIG_X86_ESPFIX32 not in final .config
Requested value:  CONFIG_X86_ESPFIX32=y
Actual value:     

Value requested for CONFIG_TOSHIBA not in final .config
Requested value:  # CONFIG_TOSHIBA is not set
Actual value:     

Value requested for CONFIG_X86_REBOOTFIXUPS not in final .config
Requested value:  # CONFIG_X86_REBOOTFIXUPS is not set
Actual value:     

Value requested for CONFIG_MICROCODE_INITRD32 not in final .config
Requested value:  CONFIG_MICROCODE_INITRD32=y
Actual value:     

Value requested for CONFIG_NOHIGHMEM not in final .config
Requested value:  # CONFIG_NOHIGHMEM is not set
Actual value:     

Value requested for CONFIG_HIGHMEM4G not in final .config
Requested value:  CONFIG_HIGHMEM4G=y
Actual value:     

Value requested for CONFIG_HIGHMEM64G not in final .config
Requested value:  # CONFIG_HIGHMEM64G is not set
Actual value:     

Value requested for CONFIG_PAGE_OFFSET not in final .config
Requested value:  CONFIG_PAGE_OFFSET=0xC0000000
Actual value:     

Value requested for CONFIG_HIGHMEM not in final .config
Requested value:  CONFIG_HIGHMEM=y
Actual value:     

Value requested for CONFIG_X86_PAE not in final .config
Requested value:  # CONFIG_X86_PAE is not set
Actual value:     

Value requested for CONFIG_ARCH_FLATMEM_ENABLE not in final .config
Requested value:  CONFIG_ARCH_FLATMEM_ENABLE=y
Actual value:     

Value requested for CONFIG_ARCH_SELECT_MEMORY_MODEL not in final .config
Requested value:  CONFIG_ARCH_SELECT_MEMORY_MODEL=y
Actual value:     

Value requested for CONFIG_ILLEGAL_POINTER_VALUE not in final .config
Requested value:  CONFIG_ILLEGAL_POINTER_VALUE=0
Actual value:     CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000

Value requested for CONFIG_HIGHPTE not in final .config
Requested value:  # CONFIG_HIGHPTE is not set
Actual value:     

Value requested for CONFIG_COMPAT_VDSO not in final .config
Requested value:  # CONFIG_COMPAT_VDSO is not set
Actual value:     

Value requested for CONFIG_FUNCTION_PADDING_CFI not in final .config
Requested value:  CONFIG_FUNCTION_PADDING_CFI=0
Actual value:     CONFIG_FUNCTION_PADDING_CFI=11

Value requested for CONFIG_FUNCTION_PADDING_BYTES not in final .config
Requested value:  CONFIG_FUNCTION_PADDING_BYTES=4
Actual value:     CONFIG_FUNCTION_PADDING_BYTES=16

Value requested for CONFIG_APM not in final .config
Requested value:  # CONFIG_APM is not set
Actual value:     

Value requested for CONFIG_X86_POWERNOW_K6 not in final .config
Requested value:  # CONFIG_X86_POWERNOW_K6 is not set
Actual value:     

Value requested for CONFIG_X86_POWERNOW_K7 not in final .config
Requested value:  # CONFIG_X86_POWERNOW_K7 is not set
Actual value:     

Value requested for CONFIG_X86_GX_SUSPMOD not in final .config
Requested value:  # CONFIG_X86_GX_SUSPMOD is not set
Actual value:     

Value requested for CONFIG_X86_SPEEDSTEP_ICH not in final .config
Requested value:  # CONFIG_X86_SPEEDSTEP_ICH is not set
Actual value:     

Value requested for CONFIG_X86_SPEEDSTEP_SMI not in final .config
Requested value:  # CONFIG_X86_SPEEDSTEP_SMI is not set
Actual value:     

Value requested for CONFIG_X86_CPUFREQ_NFORCE2 not in final .config
Requested value:  # CONFIG_X86_CPUFREQ_NFORCE2 is not set
Actual value:     

Value requested for CONFIG_X86_LONGRUN not in final .config
Requested value:  # CONFIG_X86_LONGRUN is not set
Actual value:     

Value requested for CONFIG_X86_LONGHAUL not in final .config
Requested value:  # CONFIG_X86_LONGHAUL is not set
Actual value:     

Value requested for CONFIG_X86_E_POWERSAVER not in final .config
Requested value:  # CONFIG_X86_E_POWERSAVER is not set
Actual value:     

Value requested for CONFIG_PCI_GOBIOS not in final .config
Requested value:  # CONFIG_PCI_GOBIOS is not set
Actual value:     

Value requested for CONFIG_PCI_GOMMCONFIG not in final .config
Requested value:  # CONFIG_PCI_GOMMCONFIG is not set
Actual value:     

Value requested for CONFIG_PCI_GODIRECT not in final .config
Requested value:  # CONFIG_PCI_GODIRECT is not set
Actual value:     

Value requested for CONFIG_PCI_GOANY not in final .config
Requested value:  CONFIG_PCI_GOANY=y
Actual value:     

Value requested for CONFIG_PCI_BIOS not in final .config
Requested value:  CONFIG_PCI_BIOS=y
Actual value:     

Value requested for CONFIG_ISA not in final .config
Requested value:  # CONFIG_ISA is not set
Actual value:     

Value requested for CONFIG_SCx200 not in final .config
Requested value:  # CONFIG_SCx200 is not set
Actual value:     

Value requested for CONFIG_OLPC not in final .config
Requested value:  # CONFIG_OLPC is not set
Actual value:     

Value requested for CONFIG_ALIX not in final .config
Requested value:  # CONFIG_ALIX is not set
Actual value:     

Value requested for CONFIG_NET5501 not in final .config
Requested value:  # CONFIG_NET5501 is not set
Actual value:     

Value requested for CONFIG_GEOS not in final .config
Requested value:  # CONFIG_GEOS is not set
Actual value:     

Value requested for CONFIG_COMPAT_32 not in final .config
Requested value:  CONFIG_COMPAT_32=y
Actual value:     

Value requested for CONFIG_HAVE_ATOMIC_IOMAP not in final .config
Requested value:  CONFIG_HAVE_ATOMIC_IOMAP=y
Actual value:     

Value requested for CONFIG_ARCH_32BIT_OFF_T not in final .config
Requested value:  CONFIG_ARCH_32BIT_OFF_T=y
Actual value:     

Value requested for CONFIG_ARCH_WANT_IPC_PARSE_VERSION not in final .config
Requested value:  CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
Actual value:     

Value requested for CONFIG_MODULES_USE_ELF_REL not in final .config
Requested value:  CONFIG_MODULES_USE_ELF_REL=y
Actual value:     

Value requested for CONFIG_ARCH_MMAP_RND_BITS not in final .config
Requested value:  CONFIG_ARCH_MMAP_RND_BITS=8
Actual value:     CONFIG_ARCH_MMAP_RND_BITS=28

Value requested for CONFIG_CLONE_BACKWARDS not in final .config
Requested value:  CONFIG_CLONE_BACKWARDS=y
Actual value:     

Value requested for CONFIG_OLD_SIGSUSPEND3 not in final .config
Requested value:  CONFIG_OLD_SIGSUSPEND3=y
Actual value:     

Value requested for CONFIG_OLD_SIGACTION not in final .config
Requested value:  CONFIG_OLD_SIGACTION=y
Actual value:     

Value requested for CONFIG_ARCH_SPLIT_ARG64 not in final .config
Requested value:  CONFIG_ARCH_SPLIT_ARG64=y
Actual value:     

Value requested for CONFIG_FUNCTION_ALIGNMENT not in final .config
Requested value:  CONFIG_FUNCTION_ALIGNMENT=4
Actual value:     CONFIG_FUNCTION_ALIGNMENT=16

Value requested for CONFIG_SELECT_MEMORY_MODEL not in final .config
Requested value:  CONFIG_SELECT_MEMORY_MODEL=y
Actual value:     

Value requested for CONFIG_FLATMEM_MANUAL not in final .config
Requested value:  CONFIG_FLATMEM_MANUAL=y
Actual value:     

Value requested for CONFIG_SPARSEMEM_MANUAL not in final .config
Requested value:  # CONFIG_SPARSEMEM_MANUAL is not set
Actual value:     

Value requested for CONFIG_FLATMEM not in final .config
Requested value:  CONFIG_FLATMEM=y
Actual value:     

Value requested for CONFIG_SPARSEMEM_STATIC not in final .config
Requested value:  CONFIG_SPARSEMEM_STATIC=y
Actual value:     

Value requested for CONFIG_BOUNCE not in final .config
Requested value:  CONFIG_BOUNCE=y
Actual value:     

Value requested for CONFIG_KMAP_LOCAL not in final .config
Requested value:  CONFIG_KMAP_LOCAL=y
Actual value:     

Value requested for CONFIG_HOTPLUG_PCI_COMPAQ not in final .config
Requested value:  # CONFIG_HOTPLUG_PCI_COMPAQ is not set
Actual value:     

Value requested for CONFIG_HOTPLUG_PCI_IBM not in final .config
Requested value:  # CONFIG_HOTPLUG_PCI_IBM is not set
Actual value:     

Value requested for CONFIG_EFI_CAPSULE_QUIRK_QUARK_CSH not in final .config
Requested value:  CONFIG_EFI_CAPSULE_QUIRK_QUARK_CSH=y
Actual value:     

Value requested for CONFIG_PCH_PHUB not in final .config
Requested value:  # CONFIG_PCH_PHUB is not set
Actual value:     

Value requested for CONFIG_SCSI_NSP32 not in final .config
Requested value:  # CONFIG_SCSI_NSP32 is not set
Actual value:     

Value requested for CONFIG_PATA_CS5520 not in final .config
Requested value:  # CONFIG_PATA_CS5520 is not set
Actual value:     

Value requested for CONFIG_PATA_CS5530 not in final .config
Requested value:  # CONFIG_PATA_CS5530 is not set
Actual value:     

Value requested for CONFIG_PATA_CS5535 not in final .config
Requested value:  # CONFIG_PATA_CS5535 is not set
Actual value:     

Value requested for CONFIG_PATA_CS5536 not in final .config
Requested value:  # CONFIG_PATA_CS5536 is not set
Actual value:     

Value requested for CONFIG_PATA_SC1200 not in final .config
Requested value:  # CONFIG_PATA_SC1200 is not set
Actual value:     

Value requested for CONFIG_PCH_GBE not in final .config
Requested value:  # CONFIG_PCH_GBE is not set
Actual value:     

Value requested for CONFIG_INPUT_WISTRON_BTNS not in final .config
Requested value:  # CONFIG_INPUT_WISTRON_BTNS is not set
Actual value:     

Value requested for CONFIG_SERIAL_TIMBERDALE not in final .config
Requested value:  # CONFIG_SERIAL_TIMBERDALE is not set
Actual value:     

Value requested for CONFIG_SERIAL_PCH_UART not in final .config
Requested value:  # CONFIG_SERIAL_PCH_UART is not set
Actual value:     

Value requested for CONFIG_HW_RANDOM_GEODE not in final .config
Requested value:  CONFIG_HW_RANDOM_GEODE=y
Actual value:     

Value requested for CONFIG_SONYPI not in final .config
Requested value:  # CONFIG_SONYPI is not set
Actual value:     

Value requested for CONFIG_PC8736x_GPIO not in final .config
Requested value:  # CONFIG_PC8736x_GPIO is not set
Actual value:     

Value requested for CONFIG_NSC_GPIO not in final .config
Requested value:  # CONFIG_NSC_GPIO is not set
Actual value:     

Value requested for CONFIG_I2C_EG20T not in final .config
Requested value:  # CONFIG_I2C_EG20T is not set
Actual value:     

Value requested for CONFIG_SCx200_ACB not in final .config
Requested value:  # CONFIG_SCx200_ACB is not set
Actual value:     

Value requested for CONFIG_PTP_1588_CLOCK_PCH not in final .config
Requested value:  # CONFIG_PTP_1588_CLOCK_PCH is not set
Actual value:     

Value requested for CONFIG_SBC8360_WDT not in final .config
Requested value:  # CONFIG_SBC8360_WDT is not set
Actual value:     

Value requested for CONFIG_SBC7240_WDT not in final .config
Requested value:  # CONFIG_SBC7240_WDT is not set
Actual value:     

Value requested for CONFIG_MFD_CS5535 not in final .config
Requested value:  # CONFIG_MFD_CS5535 is not set
Actual value:     

Value requested for CONFIG_AGP_ALI not in final .config
Requested value:  # CONFIG_AGP_ALI is not set
Actual value:     

Value requested for CONFIG_AGP_ATI not in final .config
Requested value:  # CONFIG_AGP_ATI is not set
Actual value:     

Value requested for CONFIG_AGP_AMD not in final .config
Requested value:  # CONFIG_AGP_AMD is not set
Actual value:     

Value requested for CONFIG_AGP_NVIDIA not in final .config
Requested value:  # CONFIG_AGP_NVIDIA is not set
Actual value:     

Value requested for CONFIG_AGP_SWORKS not in final .config
Requested value:  # CONFIG_AGP_SWORKS is not set
Actual value:     

Value requested for CONFIG_AGP_EFFICEON not in final .config
Requested value:  # CONFIG_AGP_EFFICEON is not set
Actual value:     

Value requested for CONFIG_SND_PCM not in final .config
Requested value:  CONFIG_SND_PCM=y
Actual value:     CONFIG_SND_PCM=m

Value requested for CONFIG_SND_HWDEP not in final .config
Requested value:  CONFIG_SND_HWDEP=y
Actual value:     CONFIG_SND_HWDEP=m

Value requested for CONFIG_SND_DYNAMIC_MINORS not in final .config
Requested value:  # CONFIG_SND_DYNAMIC_MINORS is not set
Actual value:     CONFIG_SND_DYNAMIC_MINORS=y

Value requested for CONFIG_SND_CS5530 not in final .config
Requested value:  # CONFIG_SND_CS5530 is not set
Actual value:     

Value requested for CONFIG_SND_CS5535AUDIO not in final .config
Requested value:  # CONFIG_SND_CS5535AUDIO is not set
Actual value:     

Value requested for CONFIG_SND_SIS7019 not in final .config
Requested value:  # CONFIG_SND_SIS7019 is not set
Actual value:     

Value requested for CONFIG_SND_HDA not in final .config
Requested value:  CONFIG_SND_HDA=y
Actual value:     CONFIG_SND_HDA=m

Value requested for CONFIG_SND_HDA_CORE not in final .config
Requested value:  CONFIG_SND_HDA_CORE=y
Actual value:     CONFIG_SND_HDA_CORE=m

Value requested for CONFIG_SND_INTEL_DSP_CONFIG not in final .config
Requested value:  CONFIG_SND_INTEL_DSP_CONFIG=y
Actual value:     CONFIG_SND_INTEL_DSP_CONFIG=m

Value requested for CONFIG_SND_INTEL_SOUNDWIRE_ACPI not in final .config
Requested value:  CONFIG_SND_INTEL_SOUNDWIRE_ACPI=y
Actual value:     CONFIG_SND_INTEL_SOUNDWIRE_ACPI=m

Value requested for CONFIG_LEDS_OT200 not in final .config
Requested value:  # CONFIG_LEDS_OT200 is not set
Actual value:     

Value requested for CONFIG_PCH_DMA not in final .config
Requested value:  # CONFIG_PCH_DMA is not set
Actual value:     

Value requested for CONFIG_CLKSRC_I8253 not in final .config
Requested value:  CONFIG_CLKSRC_I8253=y
Actual value:     

Value requested for CONFIG_MAILBOX not in final .config
Requested value:  # CONFIG_MAILBOX is not set
Actual value:     CONFIG_MAILBOX=y

Value requested for CONFIG_CRYPTO_SERPENT_SSE2_586 not in final .config
Requested value:  # CONFIG_CRYPTO_SERPENT_SSE2_586 is not set
Actual value:     

Value requested for CONFIG_CRYPTO_TWOFISH_586 not in final .config
Requested value:  # CONFIG_CRYPTO_TWOFISH_586 is not set
Actual value:     

Value requested for CONFIG_CRYPTO_DEV_GEODE not in final .config
Requested value:  # CONFIG_CRYPTO_DEV_GEODE is not set
Actual value:     

Value requested for CONFIG_CRYPTO_DEV_HIFN_795X not in final .config
Requested value:  # CONFIG_CRYPTO_DEV_HIFN_795X is not set
Actual value:     

Value requested for CONFIG_CRYPTO_LIB_POLY1305_RSIZE not in final .config
Requested value:  CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
Actual value:     CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11

Value requested for CONFIG_AUDIT_GENERIC not in final .config
Requested value:  CONFIG_AUDIT_GENERIC=y
Actual value:     

Value requested for CONFIG_GENERIC_VDSO_32 not in final .config
Requested value:  CONFIG_GENERIC_VDSO_32=y
Actual value:     

Value requested for CONFIG_DEBUG_KMAP_LOCAL not in final .config
Requested value:  # CONFIG_DEBUG_KMAP_LOCAL is not set
Actual value:     

Value requested for CONFIG_DEBUG_HIGHMEM not in final .config
Requested value:  # CONFIG_DEBUG_HIGHMEM is not set
Actual value:     

Value requested for CONFIG_HAVE_DEBUG_STACKOVERFLOW not in final .config
Requested value:  CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
Actual value:     

Value requested for CONFIG_DEBUG_STACKOVERFLOW not in final .config
Requested value:  # CONFIG_DEBUG_STACKOVERFLOW is not set
Actual value:     

Value requested for CONFIG_HAVE_FUNCTION_GRAPH_TRACER not in final .config
Requested value:  CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
Actual value:     

Value requested for CONFIG_HAVE_FUNCTION_GRAPH_RETVAL not in final .config
Requested value:  CONFIG_HAVE_FUNCTION_GRAPH_RETVAL=y
Actual value:     

Value requested for CONFIG_DRM_KUNIT_TEST not in final .config
Requested value:  CONFIG_DRM_KUNIT_TEST=m
Actual value:     

Value requested for CONFIG_DRM_XE_WERROR not in final .config
Requested value:  CONFIG_DRM_XE_WERROR=y
Actual value:     

Value requested for CONFIG_DRM_XE_DEBUG not in final .config
Requested value:  CONFIG_DRM_XE_DEBUG=y
Actual value:     

Value requested for CONFIG_DRM_XE_DEBUG_MEM not in final .config
Requested value:  CONFIG_DRM_XE_DEBUG_MEM=y
Actual value:     

Value requested for CONFIG_DRM_XE_KUNIT_TEST not in final .config
Requested value:  CONFIG_DRM_XE_KUNIT_TEST=m
Actual value:     

++ nproc
+ make -j48 ARCH=i386 olddefconfig
  GEN     Makefile

WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
  Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
  Selected by [m]:
  - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM_XE [=m] && DRM_XE [=m]=m
#
# configuration written to .config
#
++ nproc
+ make -j48 ARCH=i386
  SYNC    include/config/auto.conf.cmd
  GEN     Makefile

WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
  Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
  Selected by [m]:
  - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM_XE [=m] && DRM_XE [=m]=m

WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
  Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
  Selected by [m]:
  - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM_XE [=m] && DRM_XE [=m]=m

WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
  Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
  Selected by [m]:
  - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM_XE [=m] && DRM_XE [=m]=m
  GEN     Makefile
  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/x86/include/generated/uapi/asm/errno.h
  WRAP    arch/x86/include/generated/uapi/asm/fcntl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctl.h
  UPD     include/generated/uapi/linux/version.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctls.h
  WRAP    arch/x86/include/generated/uapi/asm/ipcbuf.h
  WRAP    arch/x86/include/generated/uapi/asm/param.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  WRAP    arch/x86/include/generated/uapi/asm/resource.h
  WRAP    arch/x86/include/generated/uapi/asm/socket.h
  WRAP    arch/x86/include/generated/uapi/asm/sockios.h
  WRAP    arch/x86/include/generated/uapi/asm/termbits.h
  WRAP    arch/x86/include/generated/uapi/asm/termios.h
  WRAP    arch/x86/include/generated/uapi/asm/types.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  UPD     include/generated/compile.h
  WRAP    arch/x86/include/generated/asm/early_ioremap.h
  HOSTCC  arch/x86/tools/relocs_32.o
  WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
  HOSTCC  arch/x86/tools/relocs_64.o
  WRAP    arch/x86/include/generated/asm/irq_regs.h
  WRAP    arch/x86/include/generated/asm/kmap_size.h
  HOSTCC  arch/x86/tools/relocs_common.o
  WRAP    arch/x86/include/generated/asm/local64.h
  WRAP    arch/x86/include/generated/asm/mmiowb.h
  WRAP    arch/x86/include/generated/asm/module.lds.h
  WRAP    arch/x86/include/generated/asm/rwonce.h
  WRAP    arch/x86/include/generated/asm/unaligned.h
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/sorttable
  HOSTCC  scripts/asn1_compiler
  HOSTCC  scripts/selinux/mdp/mdp
  HOSTCC  scripts/selinux/genheaders/genheaders
  HOSTLD  arch/x86/tools/relocs
  UPD     include/config/kernel.release
  UPD     include/generated/utsrelease.h
  CC      scripts/mod/empty.o
  HOSTCC  scripts/mod/mk_elfconfig
  CC      scripts/mod/devicetable-offsets.s
  UPD     scripts/mod/devicetable-offsets.h
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/modpost.o
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTCC  scripts/mod/symsearch.o
  HOSTLD  scripts/mod/modpost
  CC      kernel/bounds.s
  CHKSHA1 /workspace/kernel/include/linux/atomic/atomic-arch-fallback.h
  CHKSHA1 /workspace/kernel/include/linux/atomic/atomic-instrumented.h
  CHKSHA1 /workspace/kernel/include/linux/atomic/atomic-long.h
  UPD     include/generated/timeconst.h
  UPD     include/generated/bounds.h
  CC      arch/x86/kernel/asm-offsets.s
  UPD     include/generated/asm-offsets.h
  CALL    /workspace/kernel/scripts/checksyscalls.sh
  LDS     scripts/module.lds
  CC      security/commoncap.o
  HOSTCC  usr/gen_init_cpio
  CC      security/lsm_syscalls.o
  CC      certs/system_keyring.o
  CC      security/min_addr.o
  CC      security/security.o
  CC      init/main.o
  AS      arch/x86/lib/checksum_32.o
  AS      arch/x86/lib/atomic64_cx8_32.o
  CC      security/lsm_audit.o
  CC      security/device_cgroup.o
  CC      ipc/util.o
  CC      arch/x86/pci/i386.o
  AS      arch/x86/lib/cmpxchg8b_emu.o
  CC      arch/x86/lib/cmdline.o
  CC      arch/x86/power/cpu.o
  CC      init/do_mounts.o
  CC      io_uring/io_uring.o
  CC      arch/x86/lib/cpu.o
  CC      arch/x86/pci/init.o
  GEN     security/selinux/flask.h security/selinux/av_permissions.h
  CC      ipc/msgutil.o
  CC      mm/filemap.o
  UPD     init/utsversion-tmp.h
  CC      security/keys/gc.o
  CC      security/integrity/iint.o
  AR      drivers/irqchip/built-in.a
  AR      virt/lib/built-in.a
  AR      arch/x86/crypto/built-in.a
  CC      block/partitions/core.o
  AR      arch/x86/entry/vsyscall/built-in.a
  CC      security/integrity/integrity_audit.o
  CC      arch/x86/realmode/init.o
  CC      security/selinux/avc.o
  AR      drivers/cache/built-in.a
  AR      arch/x86/net/built-in.a
  AR      arch/x86/platform/atom/built-in.a
  CC      sound/core/seq/seq.o
  CC      net/core/sock.o
  CC      arch/x86/events/amd/core.o
  CC      arch/x86/mm/pat/set_memory.o
  AR      drivers/bus/mhi/built-in.a
  AR      virt/built-in.a
  CC      arch/x86/kernel/fpu/init.o
  AR      sound/i2c/other/built-in.a
  CC      block/bdev.o
  AR      sound/drivers/opl3/built-in.a
  AR      drivers/bus/built-in.a
  CC      fs/notify/dnotify/dnotify.o
  AR      arch/x86/platform/ce4100/built-in.a
  CC      sound/core/sound.o
  CC      ipc/msg.o
  AR      sound/i2c/built-in.a
  CC      net/ethernet/eth.o
  AR      net/802/built-in.a
  CC      arch/x86/entry/vdso/vma.o
  AR      arch/x86/virt/svm/built-in.a
  CC      net/sched/sch_generic.o
  CC      arch/x86/events/intel/core.o
  AR      drivers/pwm/built-in.a
  CC      lib/math/div64.o
  AR      sound/drivers/opl4/built-in.a
  CC      arch/x86/events/zhaoxin/core.o
  CC      net/sched/sch_mq.o
  CC      net/sched/sch_frag.o
  CC      arch/x86/platform/efi/memmap.o
  AR      arch/x86/virt/vmx/built-in.a
  CC      kernel/sched/core.o
  AR      arch/x86/virt/built-in.a
  CC      drivers/pci/msi/pcidev_msi.o
  AR      sound/drivers/mpu401/built-in.a
  AR      sound/drivers/vx/built-in.a
  CC      sound/core/init.o
  AR      sound/drivers/pcsp/built-in.a
  CC      crypto/asymmetric_keys/asymmetric_type.o
  AR      sound/drivers/built-in.a
  CC      crypto/asymmetric_keys/restrict.o
  CC      net/sched/sch_api.o
  CC      lib/math/gcd.o
  CC      lib/math/lcm.o
  CC      lib/math/int_log.o
  GEN     usr/initramfs_data.cpio
  COPY    usr/initramfs_inc_data
  AS      usr/initramfs_data.o
  HOSTCC  certs/extract-cert
  AR      usr/built-in.a
  CC      lib/math/int_pow.o
  CC      arch/x86/kernel/fpu/bugs.o
  CC      lib/math/int_sqrt.o
  CC      arch/x86/lib/delay.o
  CC      lib/math/reciprocal_div.o
  CC      arch/x86/kernel/fpu/core.o
  CC      drivers/pci/pcie/portdrv.o
  CC      sound/core/seq/seq_lock.o
  CC      drivers/pci/pcie/rcec.o
  AS      arch/x86/realmode/rm/header.o
  CC      lib/math/rational.o
  AS      arch/x86/realmode/rm/trampoline_32.o
  CC      drivers/pci/pcie/aspm.o
  CC      arch/x86/events/intel/bts.o
  AS      arch/x86/realmode/rm/stack.o
  CC      arch/x86/events/intel/ds.o
  CERT    certs/x509_certificate_list
  CERT    certs/signing_key.x509
  AS      certs/system_certificates.o
  AS      arch/x86/realmode/rm/reboot.o
  CC      arch/x86/entry/vdso/extable.o
  AR      security/integrity/built-in.a
  CC      drivers/pci/msi/api.o
  AS      arch/x86/realmode/rm/wakeup_asm.o
  AR      certs/built-in.a
  LDS     arch/x86/entry/vdso/vdso32/vdso32.lds
  AS      arch/x86/lib/getuser.o
  CC      arch/x86/pci/pcbios.o
  CC      drivers/pci/hotplug/pci_hotplug_core.o
  AR      arch/x86/platform/geode/built-in.a
  CC      arch/x86/realmode/rm/wakemain.o
  CC      lib/crypto/mpi/generic_mpih-lshift.o
  CC      drivers/pci/pcie/pme.o
  GEN     arch/x86/lib/inat-tables.c
  CC      lib/crypto/memneq.o
  CC      security/keys/key.o
  AR      fs/notify/dnotify/built-in.a
  CC      lib/crypto/utils.o
  CC      fs/notify/inotify/inotify_fsnotify.o
  CC      crypto/asymmetric_keys/signature.o
  CC      arch/x86/lib/insn-eval.o
  CC      arch/x86/realmode/rm/video-mode.o
  CC      arch/x86/power/hibernate_32.o
  CC      arch/x86/platform/efi/quirks.o
  AR      arch/x86/events/zhaoxin/built-in.a
  CC      fs/notify/inotify/inotify_user.o
  CC      block/partitions/msdos.o
  AS      arch/x86/realmode/rm/copy.o
  CC      sound/core/seq/seq_clientmgr.o
  AS      arch/x86/realmode/rm/bioscall.o
  AR      lib/math/built-in.a
  CC      lib/crypto/mpi/generic_mpih-mul1.o
  CC      init/do_mounts_initrd.o
  CC      arch/x86/realmode/rm/regs.o
  AS      arch/x86/entry/entry.o
  CC      arch/x86/realmode/rm/video-vga.o
  CC      arch/x86/mm/pat/memtype.o
  CC      arch/x86/platform/efi/efi.o
  CC      crypto/api.o
  CC      arch/x86/lib/insn.o
  CC      ipc/sem.o
  CC      arch/x86/events/amd/lbr.o
  AR      fs/notify/fanotify/built-in.a
  CC      fs/notify/fsnotify.o
  CC      sound/core/memory.o
  CC      arch/x86/realmode/rm/video-vesa.o
  CC      crypto/asymmetric_keys/public_key.o
  CC      drivers/pci/hotplug/acpi_pcihp.o
  CC      arch/x86/platform/efi/efi_32.o
  CC      lib/crypto/chacha.o
  CC      arch/x86/realmode/rm/video-bios.o
  CC      net/netlink/af_netlink.o
  CC      net/netlink/genetlink.o
  AR      drivers/pci/controller/dwc/built-in.a
  CC      arch/x86/mm/pat/memtype_interval.o
  AR      drivers/pci/controller/mobiveil/built-in.a
  CC      net/netlink/policy.o
  AR      drivers/pci/controller/built-in.a
  CC      fs/notify/notification.o
  AR      net/ethernet/built-in.a
  PASYMS  arch/x86/realmode/rm/pasyms.h
  AR      sound/isa/ad1848/built-in.a
  AR      sound/isa/ad1816a/built-in.a
  LDS     arch/x86/realmode/rm/realmode.lds
  CC      lib/crypto/aes.o
  AR      sound/isa/cs423x/built-in.a
  CC      arch/x86/events/intel/knc.o
  LD      arch/x86/realmode/rm/realmode.elf
  RELOCS  arch/x86/realmode/rm/realmode.relocs
  CC      drivers/pci/msi/msi.o
  AR      net/bpf/built-in.a
  AR      sound/isa/es1688/built-in.a
  OBJCOPY arch/x86/realmode/rm/realmode.bin
  CC      arch/x86/pci/mmconfig_32.o
  AS      arch/x86/realmode/rmpiggy.o
  AR      sound/isa/galaxy/built-in.a
  CC      net/ethtool/ioctl.o
  CC      net/ethtool/common.o
  AR      sound/isa/gus/built-in.a
  AR      arch/x86/realmode/built-in.a
  CC      init/initramfs.o
  AR      sound/isa/msnd/built-in.a
  AS      arch/x86/entry/vdso/vdso32/note.o
  CC      net/netfilter/core.o
  AR      sound/isa/opti9xx/built-in.a
  AS      arch/x86/entry/vdso/vdso32/system_call.o
  AR      sound/isa/sb/built-in.a
  AS      arch/x86/entry/vdso/vdso32/sigreturn.o
  AR      sound/isa/wavefront/built-in.a
  CC      arch/x86/entry/vdso/vdso32/vclock_gettime.o
  AS      arch/x86/power/hibernate_asm_32.o
  AR      sound/isa/wss/built-in.a
  CC      lib/crypto/mpi/generic_mpih-mul2.o
  CC      lib/crypto/mpi/generic_mpih-mul3.o
  AR      sound/isa/built-in.a
  CC      lib/crypto/mpi/generic_mpih-rshift.o
  CC      arch/x86/power/hibernate.o
  CC      security/selinux/hooks.o
  CC      arch/x86/lib/kaslr.o
  CC      net/ipv4/netfilter/nf_defrag_ipv4.o
  CC      arch/x86/kernel/fpu/regset.o
  CC      security/keys/keyring.o
  CC      security/keys/keyctl.o
  CC      arch/x86/kernel/fpu/signal.o
  CC      arch/x86/events/intel/lbr.o
  AR      drivers/pci/pcie/built-in.a
  CC      net/ipv4/netfilter/nf_reject_ipv4.o
  CC      arch/x86/lib/memcpy_32.o
  ASN.1   crypto/asymmetric_keys/x509.asn1.[ch]
  ASN.1   crypto/asymmetric_keys/x509_akid.asn1.[ch]
  CC      block/partitions/efi.o
  CC      crypto/asymmetric_keys/x509_loader.o
  AR      fs/notify/inotify/built-in.a
  CC      net/ipv4/netfilter/ip_tables.o
  AS      arch/x86/lib/memmove_32.o
  CC      arch/x86/lib/misc.o
  CC      arch/x86/pci/direct.o
  AR      drivers/pci/hotplug/built-in.a
  CC      sound/core/control.o
  CC      fs/notify/group.o
  AR      arch/x86/mm/pat/built-in.a
  CC      arch/x86/lib/pc-conf-reg.o
  CC      crypto/asymmetric_keys/x509_public_key.o
  CC      arch/x86/mm/init.o
  CC      lib/crypto/arc4.o
  CC      arch/x86/events/amd/ibs.o
  AS      arch/x86/platform/efi/efi_stub_32.o
  CC      lib/crypto/gf128mul.o
  CC      crypto/cipher.o
  CC      security/keys/permission.o
  CC      arch/x86/kernel/cpu/mce/core.o
  CC      drivers/pci/msi/irqdomain.o
  CC      arch/x86/platform/efi/runtime-map.o
  CC      net/sched/sch_blackhole.o
  CC      net/sched/cls_api.o
  CC      ipc/shm.o
  AS      arch/x86/lib/putuser.o
  CC      arch/x86/entry/vdso/vdso32/vgetcpu.o
  CC      lib/crypto/mpi/generic_mpih-sub1.o
  AS      arch/x86/lib/retpoline.o
  CC      net/ethtool/netlink.o
  CC      net/ethtool/bitset.o
  CC      arch/x86/lib/string_32.o
  AR      arch/x86/power/built-in.a
  CC      ipc/syscall.o
  HOSTCC  arch/x86/entry/vdso/vdso2c
  CC      sound/core/seq/seq_memory.o
  CC      arch/x86/lib/strstr_32.o
  CC      arch/x86/lib/usercopy.o
  CC      arch/x86/lib/usercopy_32.o
  CC      arch/x86/lib/msr-smp.o
  CC      arch/x86/entry/vdso/vdso32-setup.o
  ASN.1   crypto/asymmetric_keys/pkcs7.asn1.[ch]
  CC      crypto/asymmetric_keys/pkcs7_trust.o
  CC      init/calibrate.o
  CC      arch/x86/kernel/fpu/xstate.o
  CC      net/ipv4/route.o
  CC      sound/core/seq/seq_queue.o
  CC      arch/x86/pci/mmconfig-shared.o
  CC      net/sched/act_api.o
  CC      net/sched/sch_fifo.o
  CC      fs/notify/mark.o
  VDSO    arch/x86/entry/vdso/vdso32.so.dbg
  CC      fs/notify/fdinfo.o
  CC      arch/x86/lib/cache-smp.o
  CC      lib/crypto/blake2s.o
  CC      lib/crypto/blake2s-generic.o
  OBJCOPY arch/x86/entry/vdso/vdso32.so
  CC      crypto/compress.o
  VDSO2C  arch/x86/entry/vdso/vdso-image-32.c
  CC      arch/x86/entry/vdso/vdso-image-32.o
  CC      arch/x86/kernel/acpi/boot.o
  CC      lib/crypto/mpi/generic_mpih-add1.o
  CC      arch/x86/kernel/acpi/sleep.o
  CC      init/init_task.o
  CC      sound/core/seq/seq_fifo.o
  AR      block/partitions/built-in.a
  CC      arch/x86/lib/msr.o
  CC      block/fops.o
  CC      crypto/asymmetric_keys/pkcs7_verify.o
  AR      arch/x86/platform/efi/built-in.a
  CC      net/core/request_sock.o
  AR      arch/x86/platform/iris/built-in.a
  CC      arch/x86/platform/intel/iosf_mbi.o
  CC      net/netfilter/nf_log.o
  AR      drivers/pci/msi/built-in.a
  AR      drivers/pci/switch/built-in.a
  CC      net/xfrm/xfrm_policy.o
  CC      drivers/pci/access.o
  CC      net/xfrm/xfrm_state.o
  AR      arch/x86/entry/vdso/built-in.a
  CC      arch/x86/mm/init_32.o
  AS      arch/x86/entry/entry_32.o
  CC      security/keys/process_keys.o
  CC      drivers/pci/bus.o
  CC      crypto/algapi.o
  CC      arch/x86/entry/syscall_32.o
  CC      mm/mempool.o
  CC      net/ipv4/netfilter/iptable_filter.o
  CC      arch/x86/events/intel/p4.o
  CC      net/xfrm/xfrm_hash.o
  AS      arch/x86/kernel/acpi/wakeup_32.o
  CC      arch/x86/kernel/acpi/cstate.o
  CC      fs/nfs_common/nfsacl.o
  CC      fs/iomap/trace.o
  CC      arch/x86/events/amd/uncore.o
  CC      lib/crypto/sha1.o
  CC      crypto/asymmetric_keys/x509.asn1.o
  CC      fs/quota/dquot.o
  CC      crypto/asymmetric_keys/x509_akid.asn1.o
  CC      crypto/asymmetric_keys/x509_cert_parser.o
  CC      sound/core/misc.o
  CC      fs/proc/task_mmu.o
  CC      lib/crypto/mpi/ec.o
  CC      fs/kernfs/mount.o
  CC      security/keys/request_key.o
  CC      ipc/ipc_sysctl.o
  CC      sound/core/seq/seq_prioq.o
  CC      fs/kernfs/inode.o
  CC      arch/x86/events/intel/p6.o
  CC      init/version.o
  AR      fs/notify/built-in.a
  CC      ipc/mqueue.o
  CC      arch/x86/pci/fixup.o
  AR      arch/x86/platform/intel/built-in.a
  CC      arch/x86/events/core.o
  AR      arch/x86/platform/intel-mid/built-in.a
  CC      arch/x86/events/probe.o
  AR      net/netlink/built-in.a
  AR      arch/x86/platform/intel-quark/built-in.a
  CC      lib/crypto/sha256.o
  CC      kernel/sched/fair.o
  AS      arch/x86/lib/msr-reg.o
  AR      arch/x86/platform/olpc/built-in.a
  AR      init/built-in.a
  CC      arch/x86/lib/msr-reg-export.o
  CC      kernel/sched/build_policy.o
  AR      arch/x86/platform/scx200/built-in.a
  CC      kernel/sched/build_utility.o
  AR      arch/x86/platform/ts5500/built-in.a
  AR      arch/x86/kernel/fpu/built-in.a
  AR      arch/x86/platform/uv/built-in.a
  CC      mm/oom_kill.o
  AR      arch/x86/platform/built-in.a
  CC      drivers/video/console/dummycon.o
  AR      drivers/idle/built-in.a
  CC      net/core/skbuff.o
  CC      net/ethtool/strset.o
  CC      drivers/video/backlight/backlight.o
  AR      drivers/char/ipmi/built-in.a
  CC      net/ethtool/linkinfo.o
  CC      drivers/pci/probe.o
  CC      fs/nfs_common/grace.o
  AS      arch/x86/lib/hweight.o
  CC      crypto/asymmetric_keys/pkcs7.asn1.o
  AR      arch/x86/kernel/acpi/built-in.a
  CC      arch/x86/lib/iomem.o
  CC      net/core/datagram.o
  CC      arch/x86/kernel/cpu/mce/severity.o
  CC      crypto/asymmetric_keys/pkcs7_parser.o
  CC      arch/x86/mm/fault.o
  CC      arch/x86/kernel/cpu/mce/genpool.o
  CC      net/ipv4/netfilter/iptable_mangle.o
  CC      io_uring/xattr.o
  CC      net/ipv4/netfilter/ipt_REJECT.o
  CC      block/bio.o
  CC      lib/crypto/mpi/mpicoder.o
  CC      arch/x86/lib/atomic64_32.o
  CC      net/netfilter/nf_queue.o
  CC [M]  net/ipv4/netfilter/iptable_nat.o
  CC      sound/core/seq/seq_timer.o
  CC      sound/core/device.o
  CC      fs/proc/inode.o
  CC      arch/x86/kernel/apic/apic.o
  CC      arch/x86/entry/common.o
  CC      arch/x86/events/intel/pt.o
  CC      fs/kernfs/dir.o
  AR      arch/x86/events/amd/built-in.a
  CC      security/keys/request_key_auth.o
  CC      crypto/scatterwalk.o
  AS      arch/x86/entry/thunk_32.o
  CC      arch/x86/lib/inat.o
  CC      crypto/proc.o
  CC      drivers/video/console/vgacon.o
  CC      lib/crypto/mpi/mpi-add.o
  CC      fs/iomap/iter.o
  CC      net/ethtool/linkmodes.o
  AR      arch/x86/lib/built-in.a
  AR      arch/x86/lib/lib.a
  CC      fs/kernfs/file.o
  AR      crypto/asymmetric_keys/built-in.a
  CC      net/ethtool/rss.o
  CC      arch/x86/pci/acpi.o
  CC      net/xfrm/xfrm_input.o
  AR      fs/nfs_common/built-in.a
  CC      fs/sysfs/file.o
  CC      net/xfrm/xfrm_output.o
  AR      drivers/video/backlight/built-in.a
  CC      crypto/aead.o
  CC      net/sched/cls_cgroup.o
  CC      net/core/stream.o
  CC      arch/x86/kernel/cpu/mce/intel.o
  CC      sound/core/seq/seq_system.o
  CC      lib/crypto/mpi/mpi-bit.o
  CC      security/keys/user_defined.o
  CC      fs/iomap/buffered-io.o
  CC      arch/x86/mm/ioremap.o
  CC      io_uring/nop.o
  AR      sound/pci/ac97/built-in.a
  AR      sound/ppc/built-in.a
  CC      fs/proc/root.o
  CC      lib/crypto/mpi/mpi-cmp.o
  AR      sound/pci/ali5451/built-in.a
  AR      sound/pci/asihpi/built-in.a
  AR      arch/x86/entry/built-in.a
  CC      net/ethtool/linkstate.o
  AR      sound/pci/au88x0/built-in.a
  CC      kernel/locking/mutex.o
  CC      security/keys/proc.o
  AR      sound/pci/aw2/built-in.a
  CC      ipc/namespace.o
  AR      sound/pci/ctxfi/built-in.a
  CC      kernel/locking/semaphore.o
  AR      sound/pci/ca0106/built-in.a
  AR      sound/pci/cs46xx/built-in.a
  AR      sound/pci/cs5535audio/built-in.a
  AR      sound/pci/lola/built-in.a
  AR      net/ipv4/netfilter/built-in.a
  AR      sound/pci/lx6464es/built-in.a
  CC      arch/x86/kernel/kprobes/core.o
  AR      sound/pci/echoaudio/built-in.a
  AR      drivers/video/fbdev/core/built-in.a
  AR      sound/pci/emu10k1/built-in.a
  AR      drivers/video/fbdev/omap/built-in.a
  AR      sound/pci/hda/built-in.a
  CC      security/selinux/selinuxfs.o
  CC      fs/quota/quota_v2.o
  CC [M]  sound/pci/hda/hda_bind.o
  AR      drivers/video/fbdev/omap2/omapfb/dss/built-in.a
  CC      net/ipv4/inetpeer.o
  AR      drivers/video/fbdev/omap2/omapfb/displays/built-in.a
  CC [M]  sound/pci/hda/hda_codec.o
  CC      arch/x86/pci/legacy.o
  AR      drivers/video/fbdev/omap2/omapfb/built-in.a
  CC      net/netfilter/nf_sockopt.o
  AR      drivers/video/fbdev/omap2/built-in.a
  AR      drivers/video/fbdev/built-in.a
  CC [M]  sound/pci/hda/hda_jack.o
  CC      net/ipv4/protocol.o
  CC      drivers/pci/host-bridge.o
  CC      fs/sysfs/dir.o
  CC      sound/core/seq/seq_ports.o
  CC      mm/fadvise.o
  AR      drivers/video/console/built-in.a
  CC      arch/x86/kernel/cpu/mce/amd.o
  CC [M]  sound/pci/hda/hda_auto_parser.o
  CC      drivers/video/aperture.o
  CC      net/core/scm.o
  CC      fs/kernfs/symlink.o
  CC      drivers/pci/remove.o
  CC      net/netfilter/utils.o
  CC      arch/x86/events/intel/uncore.o
  CC      sound/core/seq/seq_info.o
  CC      arch/x86/kernel/cpu/mce/threshold.o
  CC      crypto/geniv.o
  CC      arch/x86/mm/extable.o
  CC      lib/crypto/mpi/mpi-sub-ui.o
  CC      ipc/mq_sysctl.o
  CC      net/xfrm/xfrm_sysctl.o
  CC      net/unix/af_unix.o
  CC      security/keys/sysctl.o
  CC      fs/proc/base.o
  CC      io_uring/fs.o
  CC      net/sched/ematch.o
  CC      block/elevator.o
  CC      net/unix/garbage.o
  CC      fs/sysfs/symlink.o
  CC      net/unix/sysctl_net_unix.o
  CC      fs/quota/quota_tree.o
  CC      arch/x86/pci/irq.o
  CC      net/ipv4/ip_input.o
  CC      drivers/video/cmdline.o
  CC      arch/x86/kernel/apic/apic_common.o
  AR      ipc/built-in.a
  CC      net/ethtool/debug.o
  CC      net/ethtool/wol.o
  CC      fs/iomap/direct-io.o
  CC      fs/iomap/fiemap.o
  CC      drivers/pci/pci.o
  CC      net/netfilter/nfnetlink.o
  CC      arch/x86/kernel/kprobes/opt.o
  CC      mm/maccess.o
  CC      lib/crypto/mpi/mpi-div.o
  AR      fs/kernfs/built-in.a
  CC      fs/quota/quota.o
  CC      lib/crypto/mpi/mpi-inv.o
  CC      sound/core/seq/seq_dummy.o
  CC      lib/crypto/mpi/mpi-mod.o
  CC      security/keys/keyctl_pkey.o
  CC      kernel/locking/rwsem.o
  CC      arch/x86/mm/mmap.o
  CC      arch/x86/pci/common.o
  CC      net/netfilter/nfnetlink_log.o
  CC      net/ipv4/ip_fragment.o
  CC      drivers/pci/pci-driver.o
  CC      crypto/lskcipher.o
  CC      arch/x86/kernel/apic/apic_noop.o
  CC [M]  sound/pci/hda/hda_sysfs.o
  CC      net/core/gen_stats.o
  CC      fs/sysfs/mount.o
  CC      arch/x86/kernel/apic/ipi.o
  CC      net/xfrm/xfrm_replay.o
  CC      net/netfilter/nf_conntrack_core.o
  CC      drivers/video/nomodeset.o
  CC      io_uring/splice.o
  CC      arch/x86/events/intel/uncore_nhmex.o
  CC      arch/x86/kernel/cpu/mtrr/mtrr.o
  AR      sound/core/seq/built-in.a
  CC      arch/x86/kernel/cpu/microcode/core.o
  CC      sound/core/info.o
  CC      arch/x86/kernel/cpu/mtrr/if.o
  CC      drivers/pci/search.o
  CC      lib/crypto/mpi/mpi-mul.o
  CC      arch/x86/kernel/cpu/microcode/intel.o
  CC      arch/x86/kernel/cpu/microcode/amd.o
  AR      net/sched/built-in.a
  CC      arch/x86/mm/pgtable.o
  CC      mm/page-writeback.o
  CC      arch/x86/mm/physaddr.o
  AR      security/keys/built-in.a
  CC      fs/quota/kqid.o
  CC      security/selinux/netlink.o
  CC      net/core/gen_estimator.o
  AR      arch/x86/kernel/cpu/mce/built-in.a
  AR      arch/x86/kernel/kprobes/built-in.a
  CC      arch/x86/kernel/cpu/cacheinfo.o
  CC      arch/x86/kernel/cpu/scattered.o
  LDS     arch/x86/kernel/vmlinux.lds
  CC      net/ipv6/netfilter/ip6_tables.o
  CC      net/ethtool/features.o
  CC      net/ipv6/af_inet6.o
  CC      drivers/video/hdmi.o
  CC      net/ipv6/netfilter/ip6table_filter.o
  CC      block/blk-core.o
  CC      kernel/locking/percpu-rwsem.o
  CC      arch/x86/pci/early.o
  CC      arch/x86/kernel/apic/vector.o
  CC      block/blk-sysfs.o
  CC      net/ipv4/ip_forward.o
  CC      fs/iomap/seek.o
  CC [M]  sound/pci/hda/hda_controller.o
  CC      net/netfilter/nf_conntrack_standalone.o
  CC      kernel/locking/spinlock.o
  CC      crypto/skcipher.o
  CC      arch/x86/pci/bus_numa.o
  CC      net/ethtool/privflags.o
  CC      fs/quota/netlink.o
  CC      fs/sysfs/group.o
  CC      arch/x86/kernel/cpu/topology_common.o
  CC      arch/x86/mm/tlb.o
  CC      lib/crypto/mpi/mpih-cmp.o
  CC [M]  sound/pci/hda/hda_proc.o
  CC      arch/x86/kernel/cpu/mtrr/generic.o
  CC      arch/x86/events/intel/uncore_snb.o
  CC      drivers/pci/rom.o
  CC      net/ipv4/ip_options.o
  CC      io_uring/sync.o
  CC      fs/proc/generic.o
  CC      drivers/pci/setup-res.o
  CC      crypto/seqiv.o
  CC      net/core/net_namespace.o
  CC      sound/core/isadma.o
  CC      arch/x86/mm/cpu_entry_area.o
  AR      arch/x86/kernel/cpu/microcode/built-in.a
  CC      arch/x86/kernel/cpu/topology_ext.o
  CC      net/core/secure_seq.o
  CC      kernel/locking/osq_lock.o
  CC      security/selinux/nlmsgtab.o
  CC      block/blk-flush.o
  CC      lib/zlib_inflate/inffast.o
  AR      drivers/video/built-in.a
  CC      net/core/flow_dissector.o
  CC      arch/x86/kernel/cpu/topology_amd.o
  AR      sound/pci/ice1712/built-in.a
  CC      net/core/sysctl_net_core.o
  AR      sound/pci/korg1212/built-in.a
  CC      lib/zlib_inflate/inflate.o
  CC      fs/iomap/swapfile.o
  AR      sound/pci/mixart/built-in.a
  CC      kernel/locking/qspinlock.o
  AR      kernel/sched/built-in.a
  CC      net/xfrm/xfrm_device.o
  CC      arch/x86/mm/maccess.o
  CC      drivers/acpi/acpica/dsargs.o
  CC      kernel/power/qos.o
  CC      arch/x86/pci/amd_bus.o
  CC      lib/crypto/mpi/mpih-div.o
  AR      net/unix/built-in.a
  CC      sound/core/vmaster.o
  CC      lib/crypto/mpi/mpih-mul.o
  AR      fs/sysfs/built-in.a
  CC      net/ipv6/netfilter/ip6table_mangle.o
  CC      drivers/acpi/acpica/dscontrol.o
  CC      drivers/acpi/acpica/dsdebug.o
  CC      kernel/printk/printk.o
  AR      fs/quota/built-in.a
  CC      arch/x86/kernel/cpu/common.o
  CC      drivers/pci/irq.o
  CC      net/ipv6/netfilter/nf_defrag_ipv6_hooks.o
  CC      net/ipv6/netfilter/nf_conntrack_reasm.o
  CC      arch/x86/mm/pgprot.o
  CC      drivers/pci/vpd.o
  CC      arch/x86/kernel/cpu/rdrand.o
  CC      fs/devpts/inode.o
  CC      fs/netfs/buffered_read.o
  CC      lib/crypto/mpi/mpi-pow.o
  CC      net/ethtool/rings.o
  CC      kernel/locking/rtmutex_api.o
  CC      mm/folio-compat.o
  CC      drivers/pci/setup-bus.o
  CC      fs/netfs/buffered_write.o
  CC      fs/proc/array.o
  CC      arch/x86/events/intel/uncore_snbep.o
  CC      crypto/echainiv.o
  CC      io_uring/advise.o
  CC      drivers/acpi/acpica/dsfield.o
  CC      sound/core/ctljack.o
  CC      arch/x86/kernel/cpu/mtrr/cleanup.o
  CC      lib/zlib_inflate/infutil.o
  CC      drivers/acpi/acpica/dsinit.o
  CC      drivers/pnp/pnpacpi/core.o
  CC      lib/zlib_inflate/inftrees.o
  CC [M]  sound/pci/hda/hda_hwdep.o
  CC      arch/x86/kernel/cpu/mtrr/amd.o
  CC      drivers/pnp/pnpacpi/rsparser.o
  CC      lib/zlib_inflate/inflate_syms.o
  CC      drivers/pci/vc.o
  CC      security/selinux/netif.o
  AR      fs/iomap/built-in.a
  CC      fs/ext4/balloc.o
  CC      net/ipv6/netfilter/nf_reject_ipv6.o
  CC      crypto/ahash.o
  AR      arch/x86/pci/built-in.a
  CC      security/selinux/netnode.o
  CC      arch/x86/mm/pgtable_32.o
  CC      net/netfilter/nf_conntrack_expect.o
  CC      crypto/shash.o
  CC      arch/x86/kernel/apic/init.o
  CC      net/core/dev.o
  CC      lib/zlib_deflate/deflate.o
  CC      sound/core/jack.o
  CC      net/ipv4/ip_output.o
  CC      lib/zlib_deflate/deftree.o
  CC      lib/zlib_deflate/deflate_syms.o
  CC      net/ipv4/ip_sockglue.o
  CC      drivers/acpi/acpica/dsmethod.o
  AR      lib/zlib_inflate/built-in.a
  CC      net/xfrm/xfrm_algo.o
  CC      crypto/akcipher.o
  CC      drivers/pnp/core.o
  AR      fs/devpts/built-in.a
  CC      arch/x86/events/intel/uncore_discovery.o
  CC      lib/crypto/mpi/mpiutil.o
  CC      net/ipv4/inet_hashtables.o
  CC      net/xfrm/xfrm_user.o
  CC      mm/readahead.o
  CC      net/ipv6/netfilter/ip6t_ipv6header.o
  CC      net/ipv6/netfilter/ip6t_REJECT.o
  CC      kernel/power/main.o
  CC      block/blk-settings.o
  CC      arch/x86/kernel/cpu/mtrr/cyrix.o
  CC      drivers/acpi/acpica/dsmthdat.o
  CC [M]  sound/pci/hda/patch_hdmi.o
  CC      fs/ext4/bitmap.o
  CC      fs/jbd2/transaction.o
  CC      arch/x86/kernel/apic/hw_nmi.o
  CC      io_uring/filetable.o
  CC      fs/jbd2/commit.o
  CC      net/ethtool/channels.o
  CC      kernel/locking/qrwlock.o
  CC      arch/x86/events/intel/cstate.o
  CC      drivers/pnp/card.o
  CC      fs/proc/fd.o
  CC      arch/x86/mm/iomap_32.o
  CC      drivers/pnp/driver.o
  CC      mm/swap.o
  AR      drivers/pnp/pnpacpi/built-in.a
  AR      drivers/acpi/pmic/built-in.a
  CC      sound/core/timer.o
  CC      mm/truncate.o
  CC      arch/x86/kernel/cpu/match.o
  CC      net/ethtool/coalesce.o
  CC      drivers/acpi/acpica/dsobject.o
  AR      lib/zlib_deflate/built-in.a
  CC      net/ipv4/inet_timewait_sock.o
  CC      io_uring/openclose.o
  CC      fs/ramfs/inode.o
  AR      lib/crypto/mpi/built-in.a
  AR      lib/crypto/built-in.a
  CC      arch/x86/kernel/cpu/mtrr/centaur.o
  CC      fs/ramfs/file-mmu.o
  CC      lib/lzo/lzo1x_compress.o
  CC      fs/hugetlbfs/inode.o
  CC      fs/fat/cache.o
  CC      crypto/sig.o
  CC      drivers/pci/mmap.o
  AR      kernel/locking/built-in.a
  CC      sound/core/hrtimer.o
  CC      arch/x86/kernel/apic/io_apic.o
  CC      security/selinux/netport.o
  CC      fs/netfs/direct_read.o
  CC      lib/lzo/lzo1x_decompress_safe.o
  CC      arch/x86/mm/hugetlbpage.o
  CC      fs/isofs/namei.o
  CC      drivers/pnp/resource.o
  CC      net/packet/af_packet.o
  CC      mm/vmscan.o
  CC      drivers/acpi/acpica/dsopcode.o
  CC      net/core/dev_addr_lists.o
  CC      kernel/printk/printk_safe.o
  CC      net/netfilter/nf_conntrack_helper.o
  CC      net/core/dst.o
  CC      kernel/power/console.o
  CC [M]  sound/pci/hda/hda_eld.o
  CC      block/blk-ioc.o
  AR      net/dsa/built-in.a
  CC      arch/x86/kernel/cpu/mtrr/legacy.o
  CC      sound/core/seq_device.o
  AR      net/ipv6/netfilter/built-in.a
  CC      net/sunrpc/auth_gss/auth_gss.o
  CC      net/sunrpc/clnt.o
  CC      net/ipv6/anycast.o
  CC      fs/proc/proc_tty.o
  CC      net/ipv6/ip6_output.o
  CC      net/sunrpc/xprt.o
  CC      net/ipv4/inet_connection_sock.o
  AR      fs/ramfs/built-in.a
  AR      lib/lzo/built-in.a
  CC      kernel/power/process.o
  CC      drivers/pnp/manager.o
  CC      lib/lz4/lz4_decompress.o
  CC      drivers/pci/devres.o
  CC      lib/zstd/zstd_decompress_module.o
  CC      drivers/acpi/acpica/dspkginit.o
  AR      arch/x86/events/intel/built-in.a
  CC      arch/x86/events/utils.o
  CC      fs/fat/dir.o
  AR      arch/x86/kernel/cpu/mtrr/built-in.a
  CC      arch/x86/kernel/cpu/bugs.o
  CC      crypto/kpp.o
  CC      net/ethtool/pause.o
  CC      io_uring/uring_cmd.o
  CC      fs/isofs/inode.o
  CC      arch/x86/mm/dump_pagetables.o
  CC      kernel/printk/nbcon.o
  CC      lib/zstd/decompress/huf_decompress.o
  CC      lib/zstd/decompress/zstd_ddict.o
  CC      fs/netfs/direct_write.o
  AR      net/wireless/tests/built-in.a
  CC      net/wireless/core.o
  CC      fs/jbd2/recovery.o
  AR      net/mac80211/tests/built-in.a
  CC      net/mac80211/main.o
  CC      fs/ext4/block_validity.o
  CC      net/netlabel/netlabel_user.o
  CC      net/rfkill/core.o
  CC      net/netlabel/netlabel_kapi.o
  CC [M]  sound/core/hwdep.o
  CC      drivers/acpi/acpica/dsutils.o
  CC      net/netlabel/netlabel_domainhash.o
  CC      net/sunrpc/socklib.o
  CC      fs/proc/cmdline.o
  CC      net/sunrpc/xprtsock.o
  CC      arch/x86/kernel/apic/msi.o
  CC      block/blk-map.o
  CC      security/selinux/status.o
  CC      net/ipv4/tcp.o
  CC      drivers/pnp/support.o
  CC [M]  sound/pci/hda/hda_intel.o
  AR      fs/hugetlbfs/built-in.a
  CC      drivers/pnp/interface.o
  CC      kernel/printk/printk_ringbuffer.o
  CC      net/core/netevent.o
  CC      drivers/pci/proc.o
  CC      arch/x86/events/rapl.o
  CC      net/core/neighbour.o
  CC      net/netfilter/nf_conntrack_proto.o
  CC      drivers/acpi/acpica/dswexec.o
  ASN.1   crypto/rsapubkey.asn1.[ch]
  ASN.1   crypto/rsaprivkey.asn1.[ch]
  CC      crypto/rsa.o
  CC      arch/x86/mm/highmem_32.o
  CC      fs/proc/consoles.o
  AR      net/xfrm/built-in.a
  CC      drivers/pci/pci-sysfs.o
  CC      arch/x86/kernel/apic/probe_32.o
  CC      net/ipv6/ip6_input.o
  CC      drivers/pnp/quirks.o
  CC      kernel/power/suspend.o
  CC      net/ethtool/eee.o
  CC [M]  sound/core/pcm.o
  AR      lib/lz4/built-in.a
  CC      fs/netfs/io.o
  CC      kernel/power/hibernate.o
  CC      kernel/printk/sysctl.o
  CC      fs/ext4/dir.o
  CC      fs/ext4/ext4_jbd2.o
  CC      net/ipv4/tcp_input.o
  CC      drivers/acpi/acpica/dswload.o
  CC      net/rfkill/input.o
  CC      fs/jbd2/checkpoint.o
  CC      net/ipv4/tcp_output.o
  CC      fs/isofs/dir.o
  CC      io_uring/epoll.o
  AR      kernel/printk/built-in.a
  CC      kernel/irq/irqdesc.o
  AR      arch/x86/kernel/apic/built-in.a
  AS      arch/x86/kernel/head_32.o
  CC      fs/fat/fatent.o
  CC      kernel/irq/handle.o
  CC      net/core/rtnetlink.o
  CC      fs/proc/cpuinfo.o
  CC      net/sunrpc/sched.o
  CC      block/blk-merge.o
  CC      arch/x86/kernel/head32.o
  CC      crypto/rsa_helper.o
  CC      lib/zstd/decompress/zstd_decompress.o
  CC      arch/x86/kernel/cpu/aperfmperf.o
  AR      arch/x86/mm/built-in.a
  CC      arch/x86/kernel/ebda.o
  CC      security/selinux/ss/ebitmap.o
  CC      crypto/rsa-pkcs1pad.o
  CC      io_uring/statx.o
  CC      drivers/acpi/acpica/dswload2.o
  CC      net/netlabel/netlabel_addrlist.o
  CC      arch/x86/events/msr.o
  CC      drivers/pnp/system.o
  CC      io_uring/net.o
  CC      net/sunrpc/auth_gss/gss_generic_token.o
  AR      net/rfkill/built-in.a
  CC      net/sunrpc/auth_gss/gss_mech_switch.o
  CC      fs/isofs/util.o
  CC      fs/proc/devices.o
  CC      kernel/irq/manage.o
  CC [M]  sound/core/pcm_native.o
  CC      net/ethtool/tsinfo.o
  LD [M]  sound/pci/hda/snd-hda-codec.o
  LD [M]  sound/pci/hda/snd-hda-codec-hdmi.o
  LD [M]  sound/pci/hda/snd-hda-intel.o
  CC      drivers/pci/slot.o
  AR      sound/pci/nm256/built-in.a
  CC      drivers/acpi/acpica/dswscope.o
  CC      fs/isofs/rock.o
  AR      sound/pci/oxygen/built-in.a
  CC      fs/isofs/export.o
  AR      sound/pci/pcxhr/built-in.a
  CC      fs/proc/interrupts.o
  AR      sound/pci/riptide/built-in.a
  CC      net/netfilter/nf_conntrack_proto_generic.o
  AR      sound/pci/rme9652/built-in.a
  CC      net/netfilter/nf_conntrack_proto_tcp.o
  CC      net/ethtool/cabletest.o
  AR      sound/pci/trident/built-in.a
  AR      sound/pci/ymfpci/built-in.a
  CC      net/ethtool/tunnels.o
  CC      arch/x86/kernel/cpu/cpuid-deps.o
  AR      sound/pci/vx222/built-in.a
  AR      drivers/pnp/built-in.a
  AR      sound/pci/built-in.a
  CC [M]  sound/core/pcm_lib.o
  CC      fs/netfs/iterator.o
  CC      kernel/irq/spurious.o
  CC      mm/shrinker.o
  CC      lib/zstd/decompress/zstd_decompress_block.o
  CC      fs/isofs/joliet.o
  CC      fs/jbd2/revoke.o
  CC      crypto/acompress.o
  AR      net/packet/built-in.a
  CC      net/core/utils.o
  CC      drivers/acpi/acpica/dswstate.o
  AR      arch/x86/events/built-in.a
  CC      net/wireless/sysfs.o
  CC      kernel/rcu/update.o
  CC      fs/fat/file.o
  CC      kernel/power/snapshot.o
  CC      kernel/rcu/sync.o
  CC      fs/proc/loadavg.o
  CC      arch/x86/kernel/cpu/umwait.o
  CC      net/ipv6/addrconf.o
  CC      net/sunrpc/auth_gss/svcauth_gss.o
  AR      kernel/livepatch/built-in.a
  CC      fs/proc/meminfo.o
  CC      security/selinux/ss/hashtab.o
  CC      kernel/dma/mapping.o
  CC      kernel/entry/common.o
  CC      drivers/pci/pci-acpi.o
  CC      kernel/entry/syscall_user_dispatch.o
  CC      net/netlabel/netlabel_mgmt.o
  CC      drivers/acpi/acpica/evevent.o
  CC      net/sunrpc/auth_gss/gss_rpc_upcall.o
  CC      fs/isofs/compress.o
  CC      io_uring/msg_ring.o
  CC      kernel/power/swap.o
  CC      block/blk-timeout.o
  CC      net/netlabel/netlabel_unlabeled.o
  CC      fs/ext4/extents.o
  CC      fs/proc/stat.o
  CC      mm/shmem.o
  CC      security/selinux/ss/symtab.o
  CC      crypto/scompress.o
  CC      fs/jbd2/journal.o
  CC      net/sunrpc/auth_gss/gss_rpc_xdr.o
  CC      fs/netfs/locking.o
  AR      sound/arm/built-in.a
  AR      sound/sh/built-in.a
  CC      drivers/acpi/acpica/evgpe.o
  CC      drivers/acpi/acpica/evgpeblk.o
  CC      security/selinux/ss/sidtab.o
  MKCAP   arch/x86/kernel/cpu/capflags.c
  CC      kernel/irq/resend.o
  CC      net/ethtool/fec.o
  CC      fs/ext4/extents_status.o
  CC      fs/ext4/file.o
  CC      kernel/rcu/srcutree.o
  CC      fs/fat/inode.o
  CC      net/mac80211/status.o
  CC      net/sunrpc/auth_gss/trace.o
  CC      drivers/acpi/dptf/int340x_thermal.o
  CC      net/core/link_watch.o
  CC      net/wireless/radiotap.o
  CC      kernel/dma/direct.o
  CC      drivers/pci/iomap.o
  CC      fs/proc/uptime.o
  CC      drivers/pci/quirks.o
  CC      kernel/power/user.o
  CC      drivers/acpi/acpica/evgpeinit.o
  AR      fs/isofs/built-in.a
  CC      net/sunrpc/auth_gss/gss_krb5_mech.o
  CC      net/netfilter/nf_conntrack_proto_udp.o
  AR      kernel/entry/built-in.a
  CC      kernel/irq/chip.o
  CC      drivers/acpi/tables.o
  CC      block/blk-lib.o
  CC      fs/nfs/client.o
  CC      fs/exportfs/expfs.o
  CC      io_uring/timeout.o
  AR      drivers/acpi/dptf/built-in.a
  CC      drivers/acpi/blacklist.o
  CC      fs/lockd/clntlock.o
  CC      fs/netfs/main.o
  CC      crypto/algboss.o
  CC      crypto/testmgr.o
  CC      drivers/acpi/acpica/evgpeutil.o
  CC      crypto/cmac.o
  CC      fs/proc/util.o
  CC      fs/lockd/clntproc.o
  CC      lib/zstd/zstd_common_module.o
  CC      net/ipv4/tcp_timer.o
  CC      io_uring/sqpoll.o
  CC      fs/netfs/misc.o
  CC      net/ethtool/eeprom.o
  CC      net/ethtool/stats.o
  CC [M]  sound/core/pcm_misc.o
  CC [M]  sound/core/pcm_memory.o
  CC      net/netlabel/netlabel_cipso_v4.o
  CC [M]  sound/core/memalloc.o
  CC      kernel/power/poweroff.o
  AR      fs/exportfs/built-in.a
  CC      net/ipv4/tcp_ipv4.o
  CC      security/selinux/ss/avtab.o
  CC      net/sunrpc/auth.o
  CC      arch/x86/kernel/cpu/powerflags.o
  CC [M]  sound/core/pcm_timer.o
  CC      drivers/acpi/acpica/evglock.o
  CC      kernel/dma/ops_helpers.o
  LD [M]  sound/core/snd-hwdep.o
  CC      block/blk-mq.o
  CC      kernel/module/main.o
  CC      crypto/hmac.o
  CC      kernel/rcu/tree.o
  CC      lib/zstd/common/debug.o
  CC      kernel/time/time.o
  CC      kernel/time/timer.o
  CC      lib/zstd/common/entropy_common.o
  CC      fs/nls/nls_base.o
  CC      fs/proc/version.o
  AR      kernel/power/built-in.a
  CC      fs/proc/softirqs.o
  CC      kernel/futex/core.o
  CC      kernel/irq/dummychip.o
  CC      fs/fat/misc.o
  CC      lib/zstd/common/error_private.o
  CC      lib/zstd/common/fse_decompress.o
  CC      kernel/futex/syscalls.o
  CC      drivers/acpi/acpica/evhandler.o
  CC      net/netfilter/nf_conntrack_proto_icmp.o
  CC      net/core/filter.o
  CC      io_uring/fdinfo.o
  CC      net/mac80211/driver-ops.o
  CC      net/sunrpc/auth_gss/gss_krb5_seal.o
  CC      net/wireless/util.o
  CC      fs/nls/nls_cp437.o
  CC      net/wireless/reg.o
  CC      fs/proc/namespaces.o
  CC      kernel/dma/dummy.o
  CC      io_uring/tctx.o
  CC      kernel/futex/pi.o
  CC      kernel/irq/devres.o
  CC      fs/lockd/clntxdr.o
  CC      fs/netfs/objects.o
  CC      drivers/acpi/osi.o
  CC      crypto/crypto_null.o
  CC      fs/lockd/host.o
  AR      sound/core/built-in.a
  CC      drivers/acpi/acpica/evmisc.o
  CC      mm/util.o
  LD [M]  sound/core/snd-pcm.o
  AR      sound/synth/emux/built-in.a
  AR      sound/synth/built-in.a
  CC      lib/zstd/common/zstd_common.o
  AR      sound/usb/misc/built-in.a
  AR      sound/usb/usx2y/built-in.a
  CC      fs/nfs/dir.o
  AR      sound/usb/caiaq/built-in.a
  AR      sound/usb/6fire/built-in.a
  AR      sound/usb/hiface/built-in.a
  AR      lib/zstd/built-in.a
  AR      sound/usb/bcd2000/built-in.a
  CC      lib/xz/xz_dec_syms.o
  AR      sound/usb/built-in.a
  CC      fs/fat/nfs.o
  AR      sound/firewire/built-in.a
  CC      fs/nls/nls_ascii.o
  AR      sound/sparc/built-in.a
  AR      sound/spi/built-in.a
  CC      net/ethtool/phc_vclocks.o
  AR      sound/parisc/built-in.a
  CC      lib/dim/dim.o
  CC      kernel/futex/requeue.o
  AR      sound/pcmcia/vx/built-in.a
  AR      sound/pcmcia/pdaudiocf/built-in.a
  CC      net/netlabel/netlabel_calipso.o
  CC      kernel/futex/waitwake.o
  AR      sound/pcmcia/built-in.a
  AR      fs/jbd2/built-in.a
  AR      sound/mips/built-in.a
  CC      lib/dim/net_dim.o
  CC      security/selinux/ss/policydb.o
  AR      sound/soc/built-in.a
  AR      sound/atmel/built-in.a
  CC      kernel/irq/autoprobe.o
  CC      drivers/acpi/acpica/evregion.o
  CC      drivers/pci/pci-label.o
  AR      sound/hda/built-in.a
  CC      lib/dim/rdma_dim.o
  CC [M]  sound/hda/hda_bus_type.o
  CC      fs/fat/namei_vfat.o
  CC      kernel/dma/remap.o
  CC      net/mac80211/sta_info.o
  CC      fs/fat/namei_msdos.o
  CC      lib/xz/xz_dec_stream.o
  CC      net/sunrpc/auth_gss/gss_krb5_unseal.o
  CC      net/ipv6/addrlabel.o
  CC      fs/nls/nls_iso8859-1.o
  CC      crypto/md5.o
  CC      block/blk-mq-tag.o
  CC      fs/proc/self.o
  CC      mm/mmzone.o
  CC      fs/lockd/svc.o
  CC      lib/fonts/fonts.o
  CC      lib/argv_split.o
  AR      lib/dim/built-in.a
  CC      net/netfilter/nf_conntrack_extend.o
  CC      lib/bug.o
  CC      io_uring/poll.o
  CC      kernel/irq/irqdomain.o
  CC      drivers/acpi/osl.o
  CC      fs/ext4/fsmap.o
  CC      drivers/acpi/acpica/evrgnini.o
  CC      fs/netfs/output.o
  CC      fs/nls/nls_utf8.o
  CC      kernel/irq/proc.o
  CC      net/ethtool/mm.o
  CC      lib/xz/xz_dec_lzma2.o
  AR      kernel/futex/built-in.a
  CC      lib/xz/xz_dec_bcj.o
  CC      fs/lockd/svclock.o
  AR      kernel/dma/built-in.a
  CC      fs/ext4/fsync.o
  CC [M]  sound/hda/hdac_bus.o
  CC      fs/ext4/hash.o
  CC      drivers/pci/vgaarb.o
  CC      net/ipv6/route.o
  CC      lib/fonts/font_8x16.o
  CC      crypto/sha256_generic.o
  AR      sound/x86/built-in.a
  CC      net/ethtool/module.o
  CC      net/sunrpc/auth_gss/gss_krb5_wrap.o
  CC      fs/proc/thread_self.o
  CC      mm/vmstat.o
  CC      mm/backing-dev.o
  CC      kernel/time/hrtimer.o
  CC      kernel/module/strict_rwx.o
  AR      fs/nls/built-in.a
  CC      mm/mm_init.o
  CC      mm/percpu.o
  AR      net/netlabel/built-in.a
  CC      drivers/acpi/acpica/evsci.o
  CC      mm/slab_common.o
  CC      mm/compaction.o
  CC      fs/lockd/svcshare.o
  AR      lib/fonts/built-in.a
  CC      kernel/time/timekeeping.o
  AR      fs/fat/built-in.a
  AR      drivers/amba/built-in.a
  CC      lib/buildid.o
  CC      kernel/time/ntp.o
  AR      lib/xz/built-in.a
  CC      net/ipv6/ip6_fib.o
  CC      kernel/irq/migration.o
  CC      fs/proc/proc_sysctl.o
  CC      crypto/sha512_generic.o
  CC      io_uring/cancel.o
  CC      drivers/acpi/acpica/evxface.o
  AR      fs/unicode/built-in.a
  CC      kernel/cgroup/cgroup.o
  CC [M]  sound/hda/hdac_device.o
  CC      net/netfilter/nf_conntrack_acct.o
  CC      kernel/cgroup/rstat.o
  CC      fs/ext4/ialloc.o
  CC      kernel/module/kmod.o
  AR      fs/netfs/built-in.a
  CC      fs/nfs/file.o
  CC      net/ipv4/tcp_minisocks.o
  AR      drivers/clk/actions/built-in.a
  CC      net/ipv4/tcp_cong.o
  AR      drivers/clk/analogbits/built-in.a
  AR      drivers/clk/bcm/built-in.a
  CC      net/sunrpc/auth_gss/gss_krb5_crypto.o
  AR      drivers/clk/imgtec/built-in.a
  CC      net/ipv4/tcp_metrics.o
  CC      net/ipv4/tcp_fastopen.o
  AR      drivers/clk/imx/built-in.a
  AR      drivers/clk/ingenic/built-in.a
  AR      drivers/clk/mediatek/built-in.a
  AR      drivers/clk/microchip/built-in.a
  AR      drivers/clk/mstar/built-in.a
  CC      net/ethtool/pse-pd.o
  AR      drivers/clk/mvebu/built-in.a
  AR      drivers/clk/ralink/built-in.a
  CC      lib/clz_tab.o
  CC      kernel/irq/cpuhotplug.o
  AR      drivers/clk/renesas/built-in.a
  AR      drivers/pci/built-in.a
  AR      drivers/clk/socfpga/built-in.a
  CC      lib/cmdline.o
  AR      drivers/clk/sprd/built-in.a
  AR      drivers/clk/starfive/built-in.a
  CC      drivers/dma/dw/core.o
  AR      drivers/clk/sunxi-ng/built-in.a
  AR      drivers/clk/ti/built-in.a
  AR      drivers/clk/versatile/built-in.a
  CC      drivers/acpi/acpica/evxfevnt.o
  AR      drivers/clk/xilinx/built-in.a
  AR      drivers/clk/built-in.a
  CC      drivers/dma/dw/dw.o
  CC      lib/cpumask.o
  CC      drivers/dma/hsu/hsu.o
  CC      block/blk-stat.o
  AR      drivers/dma/idxd/built-in.a
  AR      drivers/dma/mediatek/built-in.a
  CC      io_uring/kbuf.o
  CC      fs/lockd/svcproc.o
  AR      drivers/dma/qcom/built-in.a
  AR      drivers/dma/ti/built-in.a
  CC      kernel/time/clocksource.o
  CC      io_uring/rsrc.o
  CC      kernel/trace/trace_clock.o
  CC      crypto/sha3_generic.o
  AR      drivers/dma/xilinx/built-in.a
  CC      drivers/dma/dw/idma32.o
  CC      kernel/module/tree_lookup.o
  CC      drivers/acpi/acpica/evxfgpe.o
  AR      sound/xen/built-in.a
  CC      kernel/time/jiffies.o
  AR      sound/virtio/built-in.a
  CC      kernel/irq/pm.o
  CC      drivers/acpi/utils.o
  CC      kernel/time/timer_list.o
  CC      security/selinux/ss/services.o
  CC [M]  sound/hda/hdac_sysfs.o
  CC      security/selinux/ss/conditional.o
  CC      fs/proc/proc_net.o
  CC      security/selinux/ss/mls.o
  CC      lib/ctype.o
  CC      net/netfilter/nf_conntrack_seqadj.o
  CC      kernel/trace/ring_buffer.o
  CC      lib/dec_and_lock.o
  CC      drivers/acpi/reboot.o
  CC      drivers/acpi/nvs.o
  CC      drivers/acpi/wakeup.o
  CC      net/sunrpc/auth_gss/gss_krb5_keys.o
  CC      crypto/ecb.o
  CC      net/ethtool/plca.o
  CC      kernel/rcu/rcu_segcblist.o
  CC      drivers/acpi/sleep.o
  CC      fs/ext4/indirect.o
  AR      drivers/dma/hsu/built-in.a
  CC      lib/decompress.o
  CC      io_uring/rw.o
  CC      drivers/acpi/acpica/evxfregn.o
  CC      drivers/acpi/acpica/exconcat.o
  CC      lib/decompress_bunzip2.o
  CC      fs/autofs/init.o
  CC      block/blk-mq-sysfs.o
  CC      kernel/module/kallsyms.o
  CC      block/blk-mq-cpumap.o
  CC      drivers/dma/dw/acpi.o
  CC      arch/x86/kernel/cpu/topology.o
  CC      kernel/bpf/core.o
  CC      net/netfilter/nf_conntrack_proto_icmpv6.o
  CC      net/netfilter/nf_conntrack_netlink.o
  CC      kernel/module/procfs.o
  CC      kernel/irq/msi.o
  CC      drivers/acpi/device_sysfs.o
  CC      drivers/acpi/device_pm.o
  CC      net/ipv4/tcp_rate.o
  CC      kernel/time/timeconv.o
  CC      crypto/cbc.o
  CC      drivers/acpi/proc.o
  CC      net/ipv6/ipv6_sockglue.o
  CC      net/ipv4/tcp_recovery.o
  CC      fs/lockd/svcsubs.o
  CC      kernel/irq/affinity.o
  CC      net/sunrpc/auth_null.o
  CC      net/sunrpc/auth_tls.o
  CC      drivers/acpi/acpica/exconfig.o
  CC      fs/proc/kcore.o
  AR      kernel/rcu/built-in.a
  CC      net/sunrpc/auth_unix.o
  CC      net/ipv6/ndisc.o
  CC [M]  sound/hda/hdac_regmap.o
  CC      net/wireless/scan.o
  AR      net/sunrpc/auth_gss/built-in.a
  CC      net/sunrpc/svc.o
  CC      crypto/ctr.o
  CC      kernel/time/timecounter.o
  CC      fs/autofs/inode.o
  CC      lib/decompress_inflate.o
  CC      kernel/time/alarmtimer.o
  CC      arch/x86/kernel/cpu/proc.o
  CC      fs/9p/vfs_super.o
  AR      fs/hostfs/built-in.a
  CC      crypto/gcm.o
  CC      crypto/ccm.o
  CC      crypto/aes_generic.o
  CC      lib/decompress_unlz4.o
  CC      kernel/module/sysfs.o
  CC      drivers/acpi/acpica/exconvrt.o
  CC      drivers/acpi/acpica/excreate.o
  CC      fs/nfs/getroot.o
  AR      drivers/dma/dw/built-in.a
  CC      drivers/dma/dmaengine.o
  CC      block/blk-mq-sched.o
  CC      drivers/dma/virt-dma.o
  AR      net/ethtool/built-in.a
  CC      drivers/dma/acpi-dma.o
  CC      net/ipv6/udp.o
  CC      mm/show_mem.o
  CC      drivers/acpi/bus.o
  CC      security/selinux/ss/context.o
  CC      kernel/events/core.o
  CC      drivers/acpi/glue.o
  CC      kernel/events/ring_buffer.o
  CC      fs/proc/vmcore.o
  CC      fs/lockd/mon.o
  CC      net/mac80211/wep.o
  CC      drivers/acpi/acpica/exdebug.o
  CC [M]  sound/hda/hdac_controller.o
  CC      fs/lockd/trace.o
  CC      lib/decompress_unlzma.o
  CC      io_uring/opdef.o
  CC      kernel/irq/matrix.o
  CC      arch/x86/kernel/cpu/feat_ctl.o
  CC      lib/decompress_unlzo.o
  CC      lib/decompress_unxz.o
  CC      net/netfilter/nf_conntrack_ftp.o
  CC      fs/9p/vfs_inode.o
  CC      io_uring/notif.o
  CC      fs/autofs/root.o
  CC      io_uring/waitid.o
  CC      drivers/acpi/scan.o
  CC      net/ipv4/tcp_ulp.o
  AR      kernel/module/built-in.a
  CC      kernel/fork.o
  CC      net/ipv4/tcp_offload.o
  CC      fs/nfs/inode.o
  CC [M]  sound/hda/hdac_stream.o
  CC      crypto/crc32c_generic.o
  CC      net/ipv6/udplite.o
  CC      drivers/acpi/acpica/exdump.o
  CC      crypto/authenc.o
  CC      kernel/trace/trace.o
  CC      arch/x86/kernel/cpu/intel.o
  CC      kernel/time/posix-timers.o
  CC      mm/shmem_quota.o
  CC      mm/interval_tree.o
  CC      drivers/acpi/mipi-disco-img.o
  CC      net/core/sock_diag.o
  CC      block/ioctl.o
  CC      net/ipv4/tcp_plb.o
  CC      security/selinux/netlabel.o
  CC      drivers/acpi/acpica/exfield.o
  CC      fs/proc/kmsg.o
  AR      drivers/dma/built-in.a
  CC      net/core/dev_ioctl.o
  CC      lib/decompress_unzstd.o
  AR      drivers/soc/apple/built-in.a
  AR      drivers/soc/aspeed/built-in.a
  CC      fs/proc/page.o
  AR      drivers/soc/bcm/built-in.a
  CC      fs/ext4/inline.o
  AR      drivers/soc/fsl/built-in.a
  AR      drivers/soc/fujitsu/built-in.a
  CC      drivers/virtio/virtio.o
  CC      drivers/virtio/virtio_ring.o
  AR      drivers/soc/hisilicon/built-in.a
  CC      kernel/cgroup/namespace.o
  CC      arch/x86/kernel/cpu/intel_pconfig.o
  AR      drivers/soc/imx/built-in.a
  CC      fs/lockd/xdr.o
  CC      kernel/events/callchain.o
  AR      drivers/soc/ixp4xx/built-in.a
  AR      drivers/soc/loongson/built-in.a
  CC      kernel/cgroup/cgroup-v1.o
  AR      drivers/soc/mediatek/built-in.a
  AR      drivers/soc/microchip/built-in.a
  AR      drivers/soc/nuvoton/built-in.a
  AR      drivers/soc/pxa/built-in.a
  AR      drivers/soc/amlogic/built-in.a
  AR      drivers/soc/qcom/built-in.a
  CC      drivers/virtio/virtio_anchor.o
  AR      drivers/soc/renesas/built-in.a
  CC      fs/autofs/symlink.o
  CC      arch/x86/kernel/cpu/tsx.o
  AR      drivers/soc/rockchip/built-in.a
  CC      net/mac80211/aead_api.o
  AR      drivers/soc/sunxi/built-in.a
  AR      drivers/soc/ti/built-in.a
  CC      drivers/acpi/acpica/exfldio.o
  AR      drivers/soc/xilinx/built-in.a
  AR      drivers/soc/built-in.a
  CC      net/mac80211/wpa.o
  CC      net/mac80211/scan.o
  CC      fs/9p/vfs_inode_dotl.o
  CC      drivers/tty/vt/vt_ioctl.o
  CC      drivers/tty/hvc/hvc_console.o
  CC      drivers/char/hw_random/core.o
  AR      kernel/irq/built-in.a
  CC      drivers/tty/vt/vc_screen.o
  CC      io_uring/register.o
  CC [M]  sound/hda/array.o
  CC      drivers/tty/vt/selection.o
  CC      lib/dump_stack.o
  CC      io_uring/truncate.o
  CC      kernel/exec_domain.o
  AR      kernel/bpf/built-in.a
  CC      mm/list_lru.o
  CC      crypto/authencesn.o
  CC      net/9p/mod.o
  CC      crypto/lzo.o
  CC      net/netfilter/nf_conntrack_irc.o
  CC      net/9p/client.o
  CC      block/genhd.o
  CC      kernel/time/posix-cpu-timers.o
  CC      arch/x86/kernel/cpu/intel_epb.o
  CC      arch/x86/kernel/cpu/amd.o
  CC      kernel/time/posix-clock.o
  CC      kernel/time/itimer.o
  CC      mm/workingset.o
  AR      fs/proc/built-in.a
  CC      kernel/time/clockevents.o
  CC      kernel/events/hw_breakpoint.o
  CC      drivers/acpi/acpica/exmisc.o
  CC      net/core/tso.o
  CC      fs/lockd/clnt4xdr.o
  CC      fs/autofs/waitq.o
  CC      net/wireless/nl80211.o
  CC      arch/x86/kernel/platform-quirks.o
  CC      net/ipv4/datagram.o
  AR      security/selinux/built-in.a
  AR      security/built-in.a
  CC [M]  sound/hda/hdmi_chmap.o
  CC      net/ipv6/raw.o
  CC      net/netfilter/nf_conntrack_sip.o
  CC      net/9p/error.o
  CC      net/sunrpc/svcsock.o
  CC      drivers/tty/serial/8250/8250_core.o
  CC      arch/x86/kernel/cpu/hygon.o
  CC      drivers/char/hw_random/intel-rng.o
  CC      arch/x86/kernel/cpu/centaur.o
  CC      lib/earlycpio.o
  CC      arch/x86/kernel/cpu/transmeta.o
  CC      drivers/acpi/acpica/exmutex.o
  CC      fs/9p/vfs_addr.o
  CC      lib/extable.o
  CC      drivers/tty/serial/serial_core.o
  AR      drivers/tty/hvc/built-in.a
  CC      arch/x86/kernel/cpu/zhaoxin.o
  CC      fs/lockd/xdr4.o
  CC      kernel/trace/trace_output.o
  CC      fs/ext4/inode.o
  CC      fs/lockd/svc4proc.o
  CC      drivers/tty/vt/keyboard.o
  CC      kernel/cgroup/freezer.o
  CC      drivers/virtio/virtio_pci_modern_dev.o
  CC      block/ioprio.o
  CC      kernel/events/uprobes.o
  CC      crypto/lzo-rle.o
  CC      arch/x86/kernel/cpu/vortex.o
  CC      drivers/tty/serial/serial_base_bus.o
  CC      mm/debug.o
  CC      fs/ext4/ioctl.o
  CC      drivers/acpi/acpica/exnames.o
  CC      net/9p/protocol.o
  CC      net/sunrpc/svcauth.o
  CC      fs/autofs/expire.o
  AR      drivers/tty/ipwireless/built-in.a
  CC      fs/autofs/dev-ioctl.o
  CC      lib/flex_proportions.o
  CC      drivers/virtio/virtio_pci_legacy_dev.o
  CC      drivers/acpi/acpica/exoparg1.o
  CC      kernel/time/tick-common.o
  CC      mm/gup.o
  CC      block/badblocks.o
  CC      drivers/tty/serial/serial_ctrl.o
  CC      drivers/tty/vt/vt.o
  CC      drivers/char/hw_random/amd-rng.o
  CC      net/core/sock_reuseport.o
  CC      arch/x86/kernel/cpu/perfctr-watchdog.o
  CC      fs/lockd/procfs.o
  CC [M]  sound/hda/trace.o
  CC      arch/x86/kernel/cpu/vmware.o
  COPY    drivers/tty/vt/defkeymap.c
  CC      arch/x86/kernel/cpu/hypervisor.o
  CC      io_uring/io-wq.o
  CC      drivers/char/hw_random/geode-rng.o
  CC      lib/idr.o
  CC      fs/9p/vfs_file.o
  CC      crypto/rng.o
  CC      net/ipv4/raw.o
  CC      drivers/acpi/acpica/exoparg2.o
  CC      drivers/virtio/virtio_pci_modern.o
  CC      drivers/tty/serial/8250/8250_pnp.o
  CC      mm/mmap_lock.o
  CC      block/blk-rq-qos.o
  CC      net/wireless/mlme.o
  CC      kernel/cgroup/legacy_freezer.o
  CC      block/disk-events.o
  CC      arch/x86/kernel/cpu/mshyperv.o
  CC      block/blk-ia-ranges.o
  CC      fs/nfs/super.o
  CC      mm/highmem.o
  CC      fs/nfs/io.o
  CC      block/early-lookup.o
  CC      net/9p/trans_common.o
  CC      crypto/drbg.o
  AR      fs/autofs/built-in.a
  AR      drivers/iommu/amd/built-in.a
  CC      crypto/jitterentropy.o
  AR      drivers/iommu/intel/built-in.a
  CC      crypto/jitterentropy-kcapi.o
  AR      drivers/iommu/arm/arm-smmu/built-in.a
  AR      drivers/iommu/arm/arm-smmu-v3/built-in.a
  AR      drivers/iommu/iommufd/built-in.a
  AR      drivers/iommu/arm/built-in.a
  CC      drivers/char/hw_random/via-rng.o
  CC      fs/debugfs/inode.o
  CC      lib/irq_regs.o
  CC      block/bounce.o
  CC      drivers/iommu/iommu.o
  CC      drivers/acpi/acpica/exoparg3.o
  CC      net/9p/trans_fd.o
  AR      fs/lockd/built-in.a
  CC      fs/tracefs/inode.o
  CC      lib/is_single_threaded.o
  CC [M]  fs/efivarfs/inode.o
  CC      fs/open.o
  CC      kernel/trace/trace_seq.o
  CC      kernel/time/tick-broadcast.o
  CC      fs/9p/vfs_dir.o
  CC      net/ipv6/icmp.o
  CC      crypto/ghash-generic.o
  CC      drivers/tty/serial/8250/8250_port.o
  CC      net/netfilter/nf_nat_core.o
  CC      kernel/cgroup/pids.o
  AR      drivers/char/hw_random/built-in.a
  CC [M]  sound/hda/hdac_component.o
  CC      drivers/char/agp/backend.o
  CC      kernel/cgroup/rdma.o
  CC      net/ipv6/mcast.o
  CC      drivers/acpi/acpica/exoparg6.o
  CC      drivers/virtio/virtio_pci_common.o
  CC      kernel/cgroup/cpuset.o
  CC      lib/klist.o
  CC      lib/kobject.o
  CC      lib/kobject_uevent.o
  CC      drivers/tty/serial/8250/8250_dma.o
  CC      kernel/cgroup/misc.o
  CC      drivers/tty/serial/serial_port.o
  CC      drivers/char/agp/generic.o
  CC      drivers/tty/tty_io.o
  CC      net/core/fib_notifier.o
  CC      arch/x86/kernel/cpu/debugfs.o
  CC [M]  fs/efivarfs/file.o
  CC      crypto/hash_info.o
  CC      net/mac80211/offchannel.o
  CC      kernel/trace/trace_stat.o
  CC      net/core/xdp.o
  CC [M]  fs/efivarfs/super.o
  CC      crypto/rsapubkey.asn1.o
  CC      drivers/acpi/acpica/exprep.o
  CC      crypto/rsaprivkey.asn1.o
  CC      block/bsg.o
  CC      io_uring/futex.o
  AR      crypto/built-in.a
  CC      fs/9p/vfs_dentry.o
  CC      io_uring/napi.o
  CC      fs/debugfs/file.o
  CC      mm/memory.o
  CC      kernel/time/tick-broadcast-hrtimer.o
  CC      fs/tracefs/event_inode.o
  CC      drivers/tty/n_tty.o
  CC      net/wireless/ibss.o
  CC      kernel/cgroup/debug.o
  CC [M]  sound/hda/hdac_i915.o
  CC      net/wireless/sme.o
  CC      fs/nfs/direct.o
  CC      net/ipv4/udp.o
  CC      block/blk-cgroup.o
  CC      drivers/char/agp/isoch.o
  CC      drivers/acpi/acpica/exregion.o
  CC      net/ipv4/udplite.o
  CC      drivers/tty/serial/8250/8250_dwlib.o
  CC      arch/x86/kernel/cpu/capflags.o
  CC [M]  fs/efivarfs/vars.o
  CC      drivers/virtio/virtio_pci_legacy.o
  CC [M]  sound/hda/intel-dsp-config.o
  CC      net/9p/trans_virtio.o
  AR      arch/x86/kernel/cpu/built-in.a
  CC      arch/x86/kernel/process_32.o
  CC      drivers/tty/serial/8250/8250_pcilib.o
  CC      kernel/time/tick-oneshot.o
  CC      drivers/virtio/virtio_pci_admin_legacy_io.o
  CC      drivers/tty/serial/8250/8250_early.o
  CC      drivers/tty/vt/consolemap.o
  CC      net/sunrpc/svcauth_unix.o
  CC      fs/9p/v9fs.o
  CC      kernel/trace/trace_printk.o
  CC      drivers/tty/serial/8250/8250_exar.o
  CC [M]  sound/hda/intel-nhlt.o
  CC      lib/logic_pio.o
  CC      lib/maple_tree.o
  CC      lib/memcat_p.o
  CC      drivers/acpi/acpica/exresnte.o
  CC      drivers/iommu/iommu-traces.o
  CC [M]  sound/hda/intel-sdw-acpi.o
  CC      kernel/time/tick-sched.o
  CC      net/ipv4/udp_offload.o
  CC      net/ipv4/arp.o
  CC      net/ipv6/reassembly.o
  AR      fs/tracefs/built-in.a
  AR      kernel/events/built-in.a
  CC      net/wireless/chan.o
  CC      fs/read_write.o
  CC      drivers/tty/serial/8250/8250_lpss.o
  CC      drivers/char/agp/amd64-agp.o
  CC      net/netfilter/nf_nat_proto.o
  AR      fs/debugfs/built-in.a
  CC      net/sunrpc/addr.o
  CC      fs/file_table.o
  CC      net/ipv4/icmp.o
  CC      drivers/char/agp/intel-agp.o
  LD [M]  sound/hda/snd-hda-core.o
  CC      drivers/virtio/virtio_input.o
  CC      net/sunrpc/rpcb_clnt.o
  CC      drivers/acpi/acpica/exresolv.o
  CC      drivers/virtio/virtio_dma_buf.o
  CC      net/wireless/ethtool.o
  LD [M]  fs/efivarfs/efivarfs.o
  CC      fs/super.o
  LD [M]  sound/hda/snd-intel-dspcfg.o
  CC      fs/char_dev.o
  CC      drivers/tty/tty_ioctl.o
  CC      net/core/flow_offload.o
  CC      kernel/time/timer_migration.o
  CC      net/netfilter/nf_nat_helper.o
  LD [M]  sound/hda/snd-intel-sdw-acpi.o
  CC      sound/sound_core.o
  CC      fs/9p/fid.o
  CC      arch/x86/kernel/signal.o
  AR      io_uring/built-in.a
  AR      drivers/gpu/host1x/built-in.a
  HOSTCC  drivers/tty/vt/conmakehash
  CC      kernel/trace/pid_list.o
  CC      drivers/connector/cn_queue.o
  AR      drivers/gpu/vga/built-in.a
  CC      kernel/trace/trace_sched_switch.o
  CC      drivers/acpi/acpica/exresop.o
  AR      net/9p/built-in.a
  AR      drivers/gpu/drm/tests/built-in.a
  CC      kernel/trace/trace_nop.o
  AR      drivers/gpu/drm/arm/built-in.a
  CC      drivers/tty/vt/defkeymap.o
  CC      drivers/gpu/drm/display/drm_display_helper_mod.o
  AR      kernel/cgroup/built-in.a
  CC      drivers/tty/serial/8250/8250_mid.o
  CC      drivers/gpu/drm/ttm/ttm_tt.o
  CC      block/blk-ioprio.o
  CC      drivers/tty/serial/8250/8250_pci.o
  CC      sound/last.o
  CC      drivers/iommu/iommu-sysfs.o
  CONMK   drivers/tty/vt/consolemap_deftbl.c
  CC      drivers/char/agp/intel-gtt.o
  CC      drivers/tty/vt/consolemap_deftbl.o
  AR      drivers/tty/vt/built-in.a
  CC      net/ipv6/tcp_ipv6.o
  AR      drivers/virtio/built-in.a
  CC      fs/stat.o
  CC      fs/exec.o
  CC      fs/ext4/mballoc.o
  CC      drivers/acpi/acpica/exserial.o
  CC      drivers/gpu/drm/i915/i915_config.o
  CC      drivers/base/power/sysfs.o
  CC      drivers/gpu/drm/display/drm_dp_dual_mode_helper.o
  CC      drivers/base/power/generic_ops.o
  CC      drivers/gpu/drm/display/drm_dp_helper.o
  CC      drivers/block/loop.o
  CC      drivers/iommu/dma-iommu.o
  CC      fs/9p/xattr.o
  AR      sound/built-in.a
  CC      drivers/block/virtio_blk.o
  CC      drivers/gpu/drm/ttm/ttm_bo.o
  CC      drivers/gpu/drm/i915/i915_driver.o
  CC      fs/ext4/migrate.o
  CC      kernel/trace/blktrace.o
  CC      net/dns_resolver/dns_key.o
  CC      arch/x86/kernel/signal_32.o
  CC      drivers/acpi/acpica/exstore.o
  CC      net/dns_resolver/dns_query.o
  CC      net/ipv6/ping.o
  CC      drivers/iommu/iova.o
  CC      fs/nfs/pagelist.o
  CC      net/core/gro.o
  CC      drivers/connector/connector.o
  CC      block/blk-iolatency.o
  CC      block/blk-iocost.o
  CC      kernel/panic.o
  CC      drivers/connector/cn_proc.o
  CC      drivers/tty/tty_ldisc.o
  CC      net/mac80211/ht.o
  CC      net/netfilter/nf_nat_masquerade.o
  CC      fs/ext4/mmp.o
  CC      drivers/base/power/common.o
  CC      fs/ext4/move_extent.o
  CC      net/ipv4/devinet.o
  CC      net/ipv4/af_inet.o
  CC      drivers/acpi/acpica/exstoren.o
  AR      fs/9p/built-in.a
  CC      fs/pipe.o
  AR      drivers/char/agp/built-in.a
  CC      drivers/char/mem.o
  CC      net/ipv4/igmp.o
  CC      drivers/gpu/drm/display/drm_dp_mst_topology.o
  CC      kernel/time/vsyscall.o
  CC      net/handshake/alert.o
  CC      net/devres.o
  CC      mm/mincore.o
  CC      drivers/tty/serial/8250/8250_pericom.o
  AR      net/dns_resolver/built-in.a
  CC      net/ipv4/fib_frontend.o
  CC      drivers/acpi/acpica/exstorob.o
  CC      drivers/base/power/qos.o
  CC      arch/x86/kernel/traps.o
  CC      drivers/acpi/acpica/exsystem.o
  CC      drivers/gpu/drm/ttm/ttm_bo_util.o
  CC      net/ipv4/fib_semantics.o
  CC      fs/ext4/namei.o
  CC      fs/ext4/page-io.o
  CC      drivers/tty/tty_buffer.o
  CC      kernel/time/timekeeping_debug.o
  CC      drivers/gpu/drm/ttm/ttm_bo_vm.o
  CC      net/core/netdev-genl.o
  AR      drivers/iommu/built-in.a
  CC      drivers/gpu/drm/display/drm_dsc_helper.o
  AR      drivers/misc/eeprom/built-in.a
  CC      net/sunrpc/timer.o
  AR      drivers/misc/cb710/built-in.a
  CC      net/core/netdev-genl-gen.o
  AR      drivers/misc/ti-st/built-in.a
  CC      net/wireless/mesh.o
  CC      net/core/gso.o
  AR      drivers/misc/lis3lv02d/built-in.a
  AR      drivers/misc/cardreader/built-in.a
  CC      drivers/acpi/acpica/extrace.o
  AR      drivers/misc/built-in.a
  CC      drivers/base/firmware_loader/builtin/main.o
  CC      drivers/base/regmap/regmap.o
  AR      drivers/connector/built-in.a
  CC      net/sunrpc/xdr.o
  CC      drivers/gpu/drm/display/drm_hdcp_helper.o
  AR      drivers/block/built-in.a
  CC      fs/ext4/readpage.o
  CC      drivers/char/random.o
  CC      net/ipv4/fib_trie.o
  AR      drivers/tty/serial/8250/built-in.a
  CC      net/ipv4/fib_notifier.o
  CC      drivers/tty/serial/earlycon.o
  CC      net/handshake/genl.o
  CC      net/netfilter/nf_nat_ftp.o
  CC      mm/mlock.o
  CC      drivers/char/misc.o
  CC      mm/mmap.o
  AR      drivers/base/firmware_loader/builtin/built-in.a
  CC      drivers/base/firmware_loader/main.o
  CC      drivers/gpu/drm/i915/i915_drm_client.o
  CC      kernel/trace/trace_events.o
  CC      drivers/acpi/acpica/exutils.o
  CC      net/ipv4/inet_fragment.o
  CC      kernel/time/namespace.o
  CC      net/mac80211/agg-tx.o
  CC      arch/x86/kernel/idt.o
  CC      net/netfilter/nf_nat_irc.o
  CC      drivers/gpu/drm/ttm/ttm_module.o
  CC      net/wireless/ap.o
  CC      drivers/char/virtio_console.o
  CC      net/core/net-sysfs.o
  CC      net/socket.o
  CC      block/mq-deadline.o
  CC      fs/namei.o
  CC      drivers/acpi/acpica/hwacpi.o
  CC      net/mac80211/agg-rx.o
  CC      drivers/base/power/runtime.o
  CC      net/ipv6/exthdrs.o
  CC      net/sunrpc/sunrpc_syms.o
  AR      drivers/tty/serial/built-in.a
  CC      drivers/tty/tty_port.o
  CC      net/handshake/netlink.o
  CC      drivers/base/power/wakeirq.o
  CC      drivers/tty/tty_mutex.o
  CC      net/sysctl_net.o
  CC      drivers/gpu/drm/ttm/ttm_execbuf_util.o
  AR      kernel/time/built-in.a
  CC      kernel/cpu.o
  CC      drivers/acpi/acpica/hwesleep.o
  CC      drivers/acpi/acpica/hwgpe.o
  CC      drivers/gpu/drm/ttm/ttm_range_manager.o
  CC      drivers/gpu/drm/i915/i915_getparam.o
  CC      fs/fcntl.o
  CC      fs/nfs/read.o
  CC      arch/x86/kernel/irq.o
  AR      drivers/base/firmware_loader/built-in.a
  CC      fs/nfs/symlink.o
  CC      net/netfilter/nf_nat_sip.o
  CC      net/ipv4/ping.o
  CC      drivers/char/hpet.o
  CC      net/wireless/trace.o
  CC      net/wireless/ocb.o
  CC      net/mac80211/vht.o
  CC      drivers/base/power/main.o
  CC      drivers/char/nvram.o
  CC      drivers/acpi/acpica/hwregs.o
  CC      net/mac80211/he.o
  AR      drivers/base/test/built-in.a
  CC      fs/ioctl.o
  CC      block/kyber-iosched.o
  CC      kernel/exit.o
  CC      kernel/trace/trace_export.o
  CC      drivers/tty/tty_ldsem.o
  CC      net/ipv4/ip_tunnel_core.o
  CC      drivers/gpu/drm/ttm/ttm_resource.o
  CC      drivers/gpu/drm/ttm/ttm_pool.o
  CC      fs/readdir.o
  CC      fs/ext4/resize.o
  CC      net/ipv4/gre_offload.o
  CC      drivers/gpu/drm/display/drm_hdmi_helper.o
  CC      drivers/acpi/acpica/hwsleep.o
  CC      drivers/acpi/acpica/hwvalid.o
  CC      lib/nmi_backtrace.o
  CC      drivers/tty/tty_baudrate.o
  CC      drivers/base/component.o
  CC      drivers/gpu/drm/i915/i915_ioctl.o
  CC      net/handshake/request.o
  CC      net/ipv4/metrics.o
  CC      fs/nfs/unlink.o
  CC      block/blk-mq-pci.o
  CC      net/ipv6/datagram.o
  AR      drivers/char/built-in.a
  CC      block/blk-mq-virtio.o
  CC      drivers/tty/tty_jobctrl.o
  CC      block/blk-mq-debugfs.o
  CC      drivers/base/core.o
  CC      net/core/hotdata.o
  CC      drivers/acpi/acpica/hwxface.o
  CC      kernel/trace/trace_event_perf.o
  CC      net/wireless/pmsr.o
  CC      drivers/gpu/drm/display/drm_scdc_helper.o
  CC      mm/mmu_gather.o
  CC      drivers/gpu/drm/ttm/ttm_device.o
  CC      block/blk-pm.o
  CC      drivers/base/regmap/regcache.o
  CC      net/netfilter/x_tables.o
  CC      fs/nfs/write.o
  CC      drivers/base/bus.o
  CC      drivers/tty/n_null.o
  CC      fs/select.o
  CC      lib/objpool.o
  CC      fs/ext4/super.o
  CC      fs/ext4/symlink.o
  CC      drivers/base/regmap/regcache-rbtree.o
  CC      drivers/acpi/acpica/hwxfsleep.o
  CC      drivers/base/dd.o
  CC      arch/x86/kernel/irq_32.o
  CC      drivers/base/regmap/regcache-flat.o
  CC      drivers/gpu/drm/i915/i915_irq.o
  CC      drivers/base/power/wakeup.o
  CC      mm/mprotect.o
  CC      fs/ext4/sysfs.o
  CC      drivers/base/syscore.o
  CC      net/sunrpc/cache.o
  CC      fs/ext4/xattr.o
  CC      drivers/base/power/wakeup_stats.o
  CC      fs/ext4/xattr_hurd.o
  CC      fs/dcache.o
  CC      lib/plist.o
  CC      arch/x86/kernel/dumpstack_32.o
  CC      net/mac80211/s1g.o
  CC      drivers/acpi/acpica/hwpci.o
  CC      drivers/acpi/acpica/nsaccess.o
  CC      lib/radix-tree.o
  CC      drivers/gpu/drm/ttm/ttm_sys_manager.o
  CC      drivers/tty/pty.o
  GEN     net/wireless/shipped-certs.c
  CC      block/holder.o
  CC      net/core/net-procfs.o
  CC      drivers/base/driver.o
  AR      drivers/gpu/drm/display/built-in.a
  CC      drivers/base/power/trace.o
  CC      net/ipv4/netlink.o
  AR      drivers/gpu/drm/renesas/rcar-du/built-in.a
  AR      drivers/gpu/drm/omapdrm/built-in.a
  CC      kernel/trace/trace_events_filter.o
  CC      fs/nfs/namespace.o
  AR      drivers/gpu/drm/renesas/rz-du/built-in.a
  AR      drivers/gpu/drm/renesas/built-in.a
  CC      net/core/netpoll.o
  CC      drivers/base/class.o
  CC      net/handshake/tlshd.o
  CC      kernel/softirq.o
  CC      net/wireless/shipped-certs.o
  CC      fs/nfs/mount_clnt.o
  CC      net/core/fib_rules.o
  AR      drivers/gpu/drm/tilcdc/built-in.a
  CC      drivers/base/regmap/regcache-maple.o
  CC      net/handshake/trace.o
  CC      net/netfilter/xt_tcpudp.o
  CC      fs/nfs/nfstrace.o
  CC      drivers/base/regmap/regmap-debugfs.o
  CC      drivers/gpu/drm/virtio/virtgpu_drv.o
  CC      drivers/acpi/acpica/nsalloc.o
  CC      mm/mremap.o
  CC      net/netfilter/xt_CONNSECMARK.o
  CC      net/ipv6/ip6_flowlabel.o
  CC      drivers/gpu/drm/ttm/ttm_agp_backend.o
  CC      arch/x86/kernel/time.o
  AR      drivers/mfd/built-in.a
  AR      drivers/nfc/built-in.a
  AR      drivers/dax/hmem/built-in.a
  AR      drivers/dax/built-in.a
  CC      drivers/acpi/resource.o
  CC      drivers/dma-buf/dma-buf.o
  AR      block/built-in.a
  CC      drivers/dma-buf/dma-fence.o
  AR      drivers/gpu/drm/imx/built-in.a
  CC      net/mac80211/ibss.o
  CC      mm/msync.o
  CC      drivers/tty/tty_audit.o
  CC      fs/ext4/xattr_trusted.o
  CC      fs/ext4/xattr_user.o
  CC      drivers/acpi/acpica/nsarguments.o
  CC      lib/ratelimit.o
  CC      net/ipv6/inet6_connection_sock.o
  CC      fs/nfs/export.o
  CC      fs/nfs/sysfs.o
  CC      drivers/tty/sysrq.o
  CC      fs/inode.o
  CC      arch/x86/kernel/ioport.o
  AR      drivers/base/power/built-in.a
  CC      drivers/base/platform.o
  CC      mm/page_vma_mapped.o
  CC      net/ipv4/nexthop.o
  AR      drivers/base/regmap/built-in.a
  CC      drivers/gpu/drm/virtio/virtgpu_kms.o
  CC      lib/rbtree.o
  CC      lib/seq_buf.o
  CC      net/ipv4/udp_tunnel_stub.o
  CC      drivers/gpu/drm/i915/i915_mitigations.o
  CC      net/netfilter/xt_NFLOG.o
  AR      drivers/gpu/drm/ttm/built-in.a
  CC      kernel/trace/trace_events_trigger.o
  CC      kernel/trace/trace_eprobe.o
  CC      drivers/acpi/acpica/nsconvert.o
  CC      drivers/acpi/acpi_processor.o
  CC      fs/nfs/fs_context.o
  CC      fs/nfs/nfsroot.o
  CC      kernel/resource.o
  CC      lib/siphash.o
  CC      net/ipv6/udp_offload.o
  CC      net/core/net-traces.o
  CC      net/ipv4/ip_tunnel.o
  CC      fs/ext4/fast_commit.o
  CC      kernel/sysctl.o
  CC      net/ipv6/seg6.o
  CC      mm/pagewalk.o
  CC      mm/pgtable-generic.o
  CC      fs/nfs/sysctl.o
  CC      kernel/trace/trace_kprobe.o
  CC      drivers/acpi/acpica/nsdump.o
  CC      net/mac80211/iface.o
  CC      drivers/gpu/drm/i915/i915_module.o
  AR      drivers/gpu/drm/i2c/built-in.a
  AR      drivers/gpu/drm/panel/built-in.a
  AR      net/handshake/built-in.a
  CC      arch/x86/kernel/dumpstack.o
  AR      drivers/gpu/drm/bridge/analogix/built-in.a
  CC      arch/x86/kernel/nmi.o
  AR      drivers/gpu/drm/bridge/cadence/built-in.a
  AR      drivers/gpu/drm/bridge/imx/built-in.a
  CC      kernel/trace/error_report-traces.o
  AR      drivers/gpu/drm/bridge/synopsys/built-in.a
  CC      net/ipv6/fib6_notifier.o
  AR      drivers/gpu/drm/bridge/built-in.a
  AR      drivers/gpu/drm/hisilicon/built-in.a
  CC      mm/rmap.o
  CC      drivers/gpu/drm/i915/i915_params.o
  AR      drivers/gpu/drm/mxsfb/built-in.a
  CC      drivers/dma-buf/dma-fence-array.o
  CC      drivers/acpi/acpica/nseval.o
  CC      drivers/gpu/drm/virtio/virtgpu_gem.o
  CC      net/netfilter/xt_SECMARK.o
  AR      drivers/tty/built-in.a
  CC      drivers/acpi/acpica/nsinit.o
  CC      net/core/selftests.o
  CC      lib/string.o
  CC      net/core/ptp_classifier.o
  CC      drivers/gpu/drm/virtio/virtgpu_vram.o
  CC      drivers/base/cpu.o
  CC      fs/nfs/nfs2super.o
  CC      net/ipv4/sysctl_net_ipv4.o
  CC      drivers/gpu/drm/virtio/virtgpu_display.o
  CC      mm/vmalloc.o
  CC      fs/nfs/proc.o
  CC      lib/timerqueue.o
  CC      mm/process_vm_access.o
  CC      lib/vsprintf.o
  CC      mm/page_alloc.o
  CC      net/ipv6/rpl.o
  CC      drivers/base/firmware.o
  CC      drivers/dma-buf/dma-fence-chain.o
  CC      drivers/acpi/acpica/nsload.o
  CC      kernel/capability.o
  CC      fs/attr.o
  CC      net/sunrpc/rpc_pipe.o
  CC      kernel/ptrace.o
  CC      mm/init-mm.o
  CC      net/mac80211/link.o
  CC      net/ipv6/ioam6.o
  CC      drivers/base/init.o
  CC      drivers/dma-buf/dma-fence-unwrap.o
  CC      drivers/gpu/drm/virtio/virtgpu_vq.o
  CC      drivers/gpu/drm/i915/i915_pci.o
  CC      fs/nfs/nfs2xdr.o
  CC      drivers/base/map.o
  CC      arch/x86/kernel/ldt.o
  CC      arch/x86/kernel/setup.o
  CC      drivers/gpu/drm/i915/i915_scatterlist.o
  CC      drivers/base/devres.o
  CC      drivers/acpi/acpica/nsnames.o
  CC      net/sunrpc/sysfs.o
  CC      fs/bad_inode.o
  CC      net/netfilter/xt_TCPMSS.o
  CC      drivers/base/attribute_container.o
  CC      drivers/gpu/drm/virtio/virtgpu_fence.o
  CC      drivers/dma-buf/dma-resv.o
  AR      drivers/gpu/drm/tiny/built-in.a
  AR      drivers/gpu/drm/xlnx/built-in.a
  AR      drivers/gpu/drm/gud/built-in.a
  CC      net/core/netprio_cgroup.o
  CC      drivers/dma-buf/sync_file.o
  AR      drivers/gpu/drm/solomon/built-in.a
  CC [M]  drivers/gpu/drm/scheduler/sched_main.o
  CC      drivers/base/transport_class.o
  CC      mm/memblock.o
  CC [M]  drivers/gpu/drm/scheduler/sched_fence.o
  CC      drivers/base/topology.o
  CC      fs/nfs/nfs3super.o
  CC      drivers/acpi/acpica/nsobject.o
  CC [M]  drivers/gpu/drm/scheduler/sched_entity.o
  CC      fs/nfs/nfs3client.o
  CC      net/ipv6/sysctl_net_ipv6.o
  CC      kernel/trace/power-traces.o
  CC      fs/nfs/nfs3proc.o
  CC [M]  drivers/gpu/drm/xe/xe_bb.o
  CC      net/ipv6/xfrm6_policy.o
  CC      net/ipv6/xfrm6_state.o
  CC      fs/file.o
  CC      fs/ext4/orphan.o
  CC      net/ipv4/proc.o
  CC      net/core/netclassid_cgroup.o
  CC      kernel/user.o
  CC      net/ipv4/fib_rules.o
  CC      drivers/base/container.o
  AR      drivers/cxl/core/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_bo.o
  CC      kernel/signal.o
  CC      drivers/acpi/acpica/nsparse.o
  AR      drivers/cxl/built-in.a
  CC      mm/slub.o
  CC      drivers/gpu/drm/i915/i915_suspend.o
  CC      mm/madvise.o
  CC      kernel/sys.o
  CC      mm/page_io.o
  CC      net/mac80211/rate.o
  CC      kernel/trace/rpm-traces.o
  CC      drivers/gpu/drm/virtio/virtgpu_object.o
  AR      drivers/dma-buf/built-in.a
  CC      arch/x86/kernel/x86_init.o
  CC      drivers/gpu/drm/drm_aperture.o
  CC      drivers/base/property.o
  CC      kernel/umh.o
  CC      drivers/acpi/processor_core.o
  CC      net/sunrpc/svc_xprt.o
  CC      drivers/base/cacheinfo.o
  CC [M]  drivers/gpu/drm/xe/xe_bo_evict.o
  CC      net/mac80211/michael.o
  CC      drivers/acpi/acpica/nspredef.o
  CC      net/netfilter/xt_conntrack.o
  CC      net/core/dst_cache.o
  CC      net/sunrpc/xprtmultipath.o
  CC      kernel/trace/trace_dynevent.o
  CC      net/ipv6/xfrm6_input.o
  CC      mm/swap_state.o
  CC      fs/nfs/nfs3xdr.o
  CC      arch/x86/kernel/i8259.o
  CC      drivers/acpi/acpica/nsprepkg.o
  CC      net/core/gro_cells.o
  CC      net/mac80211/tkip.o
  LD [M]  drivers/gpu/drm/scheduler/gpu-sched.o
  CC      drivers/acpi/processor_pdc.o
  CC      kernel/workqueue.o
  CC      net/ipv6/xfrm6_output.o
  CC      drivers/acpi/ec.o
  CC      fs/ext4/acl.o
  CC      net/ipv6/xfrm6_protocol.o
  CC      drivers/gpu/drm/virtio/virtgpu_debugfs.o
  CC      lib/win_minmax.o
  CC      mm/swapfile.o
  CC      net/core/failover.o
  CC      net/mac80211/aes_cmac.o
  CC      net/ipv4/ipmr.o
  CC      drivers/acpi/dock.o
  CC      kernel/trace/trace_probe.o
  CC      kernel/pid.o
  CC      drivers/gpu/drm/drm_atomic.o
  CC      arch/x86/kernel/irqinit.o
  CC      drivers/acpi/acpica/nsrepair.o
  CC      drivers/gpu/drm/virtio/virtgpu_plane.o
  CC      drivers/gpu/drm/i915/i915_switcheroo.o
  CC      net/ipv4/ipmr_base.o
  CC      fs/filesystems.o
  CC      arch/x86/kernel/jump_label.o
  CC      lib/xarray.o
  CC      net/netfilter/xt_policy.o
  CC      drivers/base/swnode.o
  CC      drivers/base/auxiliary.o
  CC      net/mac80211/aes_gmac.o
  CC      net/sunrpc/stats.o
  CC      net/ipv4/syncookies.o
  CC      fs/nfs/nfs3acl.o
  CC      fs/ext4/xattr_security.o
  CC      kernel/trace/trace_uprobe.o
  CC      drivers/acpi/acpica/nsrepair2.o
  CC      fs/nfs/nfs4proc.o
  CC      net/ipv4/tunnel4.o
  CC      net/sunrpc/sysctl.o
  CC      drivers/acpi/pci_root.o
  CC      net/ipv6/netfilter.o
  CC      drivers/acpi/pci_link.o
  CC      net/ipv6/proc.o
  CC      drivers/base/devtmpfs.o
  CC      drivers/gpu/drm/virtio/virtgpu_ioctl.o
  CC      drivers/base/module.o
  CC      kernel/trace/rethook.o
  CC      net/ipv6/syncookies.o
  CC      net/netfilter/xt_state.o
  CC [M]  drivers/gpu/drm/xe/xe_debugfs.o
  CC      drivers/gpu/drm/virtio/virtgpu_prime.o
  AR      net/core/built-in.a
  CC      arch/x86/kernel/irq_work.o
  CC      arch/x86/kernel/probe_roms.o
  CC      fs/nfs/nfs4xdr.o
  CC      drivers/acpi/acpica/nssearch.o
  CC      net/mac80211/fils_aead.o
  CC      drivers/base/devcoredump.o
  CC      drivers/acpi/pci_irq.o
  CC      net/ipv6/calipso.o
  CC      drivers/gpu/drm/virtio/virtgpu_trace_points.o
  CC      drivers/gpu/drm/i915/i915_sysfs.o
  CC      drivers/base/platform-msi.o
  CC      fs/nfs/nfs4state.o
  CC [M]  drivers/gpu/drm/xe/xe_devcoredump.o
  CC [M]  net/netfilter/nf_log_syslog.o
  CC      drivers/acpi/acpica/nsutils.o
  CC      net/ipv4/ipconfig.o
  CC      kernel/task_work.o
  CC [M]  net/netfilter/xt_mark.o
  CC      lib/lockref.o
  CC      kernel/extable.o
  CC      drivers/gpu/drm/drm_atomic_uapi.o
  CC      net/ipv4/netfilter.o
  CC      drivers/gpu/drm/i915/i915_utils.o
  CC      drivers/acpi/acpi_lpss.o
  CC      fs/nfs/nfs4renewd.o
  CC      drivers/acpi/acpi_apd.o
  CC      drivers/acpi/acpica/nswalk.o
  CC      drivers/acpi/acpica/nsxfeval.o
  CC [M]  net/netfilter/xt_nat.o
  CC      kernel/params.o
  CC      lib/bcd.o
  CC      kernel/kthread.o
  CC      kernel/sys_ni.o
  CC      drivers/gpu/drm/drm_auth.o
  CC      lib/sort.o
  CC      drivers/gpu/drm/drm_blend.o
  CC      drivers/base/physical_location.o
  CC      mm/swap_slots.o
  CC      lib/parser.o
  CC      net/mac80211/cfg.o
  CC [M]  net/netfilter/xt_LOG.o
  CC      drivers/acpi/acpi_platform.o
  CC      drivers/macintosh/mac_hid.o
  CC [M]  drivers/gpu/drm/xe/xe_device.o
  CC      drivers/acpi/acpica/nsxfname.o
  CC      net/ipv6/ah6.o
  CC      drivers/acpi/acpi_pnp.o
  CC      drivers/gpu/drm/virtio/virtgpu_submit.o
  CC [M]  drivers/gpu/drm/xe/xe_device_sysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_dma_buf.o
  CC      mm/dmapool.o
  CC      arch/x86/kernel/sys_ia32.o
  CC      kernel/nsproxy.o
  CC      drivers/acpi/acpica/nsxfobj.o
  CC      arch/x86/kernel/ksysfs.o
  CC      mm/hugetlb.o
  CC      drivers/gpu/drm/i915/intel_clock_gating.o
  CC      drivers/gpu/drm/drm_bridge.o
  AR      kernel/trace/built-in.a
  CC      kernel/notifier.o
  CC      drivers/acpi/power.o
  CC      lib/debug_locks.o
  CC      drivers/base/trace.o
  CC      net/mac80211/ethtool.o
  CC      net/ipv4/tcp_cubic.o
  CC      net/mac80211/rx.o
  CC      drivers/gpu/drm/i915/intel_device_info.o
  CC      net/ipv4/tcp_sigpool.o
  CC      lib/random32.o
  CC [M]  net/netfilter/xt_MASQUERADE.o
  CC      mm/mmu_notifier.o
  CC      drivers/acpi/acpica/psargs.o
  CC      lib/bust_spinlocks.o
  CC      net/ipv4/cipso_ipv4.o
  CC      arch/x86/kernel/bootflag.o
  CC      net/ipv4/xfrm4_policy.o
  AR      drivers/macintosh/built-in.a
  CC [M]  net/netfilter/xt_addrtype.o
  CC      fs/namespace.o
  CC      fs/nfs/nfs4super.o
  CC      drivers/gpu/drm/drm_cache.o
  CC      drivers/gpu/drm/i915/intel_memory_region.o
  AR      net/netfilter/built-in.a
  CC      fs/nfs/nfs4file.o
  CC      drivers/acpi/event.o
  CC      net/ipv6/esp6.o
  CC      mm/migrate.o
  CC      mm/page_counter.o
  CC      fs/seq_file.o
  AR      fs/ext4/built-in.a
  CC      mm/hugetlb_cgroup.o
  CC      drivers/gpu/drm/i915/intel_pcode.o
  AR      net/sunrpc/built-in.a
  CC      fs/nfs/delegation.o
  CC      drivers/acpi/evged.o
  CC      arch/x86/kernel/e820.o
  CC      arch/x86/kernel/pci-dma.o
  CC      net/ipv6/sit.o
  AR      drivers/gpu/drm/virtio/built-in.a
  CC      fs/xattr.o
  CC      drivers/acpi/sysfs.o
  CC      drivers/acpi/acpica/psloop.o
  CC      net/ipv4/xfrm4_state.o
  CC      drivers/gpu/drm/drm_client.o
  AR      drivers/base/built-in.a
  CC      mm/early_ioremap.o
  CC      net/ipv6/addrconf_core.o
  CC      net/ipv4/xfrm4_input.o
  CC      lib/kasprintf.o
  CC      lib/bitmap.o
  CC      drivers/acpi/property.o
  CC      kernel/ksysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_drm_client.o
  CC      drivers/acpi/acpi_cmos_rtc.o
  CC      mm/secretmem.o
  CC      drivers/gpu/drm/drm_client_modeset.o
  CC      drivers/acpi/acpica/psobject.o
  AR      drivers/scsi/pcmcia/built-in.a
  AR      net/wireless/built-in.a
  CC      drivers/scsi/scsi.o
  CC      drivers/acpi/acpica/psopcode.o
  CC      drivers/acpi/acpica/psopinfo.o
  CC      drivers/gpu/drm/i915/intel_region_ttm.o
  CC      lib/scatterlist.o
  CC      fs/nfs/nfs4idmap.o
  CC      drivers/acpi/x86/apple.o
  CC      drivers/acpi/x86/utils.o
  CC      mm/hmm.o
  CC      drivers/acpi/x86/s2idle.o
  CC      drivers/scsi/hosts.o
  CC      kernel/cred.o
  CC      net/ipv4/xfrm4_output.o
  CC      fs/libfs.o
  CC      fs/nfs/callback.o
  CC      lib/list_sort.o
  CC      drivers/acpi/acpica/psparse.o
  CC      drivers/gpu/drm/i915/intel_runtime_pm.o
  CC      drivers/acpi/acpica/psscope.o
  CC      fs/nfs/callback_xdr.o
  CC      kernel/reboot.o
  CC      kernel/async.o
  CC      drivers/acpi/acpica/pstree.o
  CC      kernel/range.o
  CC      drivers/gpu/drm/i915/intel_sbi.o
  CC      drivers/acpi/acpica/psutils.o
  CC      lib/uuid.o
  CC      fs/nfs/callback_proc.o
  CC      mm/memfd.o
  AR      drivers/nvme/common/built-in.a
  AR      drivers/nvme/host/built-in.a
  CC      lib/iov_iter.o
  AR      drivers/nvme/target/built-in.a
  AR      drivers/nvme/built-in.a
  CC      arch/x86/kernel/quirks.o
  CC      mm/ptdump.o
  CC      drivers/acpi/debugfs.o
  CC      drivers/acpi/acpi_lpat.o
  CC      fs/fs-writeback.o
  CC      lib/clz_ctz.o
  CC      lib/bsearch.o
  CC      lib/find_bit.o
  CC      drivers/acpi/acpica/pswalk.o
  CC      fs/nfs/nfs4namespace.o
  CC      net/mac80211/spectmgmt.o
  CC      fs/nfs/nfs4getroot.o
  CC      drivers/acpi/acpica/psxface.o
  CC      drivers/acpi/acpica/rsaddr.o
  CC      net/ipv4/xfrm4_protocol.o
  CC      fs/pnode.o
  CC      fs/nfs/nfs4client.o
  CC      kernel/smpboot.o
  CC [M]  drivers/gpu/drm/xe/xe_exec.o
  CC [M]  drivers/gpu/drm/xe/xe_execlist.o
  CC      lib/llist.o
  CC      drivers/gpu/drm/i915/intel_step.o
  CC      net/ipv6/exthdrs_core.o
  CC      drivers/scsi/scsi_ioctl.o
  CC      drivers/acpi/acpi_pcc.o
  CC      drivers/acpi/acpica/rscalc.o
  CC [M]  drivers/gpu/drm/xe/xe_exec_queue.o
  CC      lib/lwq.o
  CC      drivers/scsi/scsicam.o
  CC      fs/splice.o
  CC      arch/x86/kernel/topology.o
  CC      drivers/ata/libata-core.o
  CC      drivers/acpi/ac.o
  CC      arch/x86/kernel/kdebugfs.o
  CC      drivers/ata/libata-scsi.o
  CC      kernel/ucount.o
  AR      drivers/net/phy/qcom/built-in.a
  CC      drivers/net/phy/mdio-boardinfo.o
  CC      kernel/regset.o
  CC      drivers/net/phy/stubs.o
  CC      arch/x86/kernel/alternative.o
  AR      drivers/net/pse-pd/built-in.a
  CC      drivers/gpu/drm/i915/intel_uncore.o
  CC      drivers/net/mdio/acpi_mdio.o
  AR      drivers/net/pcs/built-in.a
  CC      drivers/net/phy/mdio_devres.o
  CC      drivers/net/phy/phy.o
  CC      drivers/net/mdio/fwnode_mdio.o
  CC      drivers/acpi/button.o
  CC      drivers/ata/libata-eh.o
  CC      fs/nfs/nfs4session.o
  CC      net/ipv6/ip6_checksum.o
  CC      fs/nfs/dns_resolve.o
  CC      fs/sync.o
  CC      drivers/acpi/acpica/rscreate.o
  CC      kernel/ksyms_common.o
  CC      drivers/gpu/drm/i915/intel_wakeref.o
  CC      drivers/scsi/scsi_error.o
  CC      drivers/gpu/drm/i915/vlv_sideband.o
  CC      drivers/ata/libata-transport.o
  CC      fs/utimes.o
  CC      net/mac80211/tx.o
  CC      kernel/groups.o
  CC      drivers/acpi/acpica/rsdumpinfo.o
  CC      drivers/scsi/scsi_lib.o
  CC      drivers/gpu/drm/i915/vlv_suspend.o
  AR      mm/built-in.a
  CC      net/mac80211/key.o
  CC      net/mac80211/util.o
  CC      fs/nfs/nfs4trace.o
  CC      drivers/acpi/fan_core.o
  CC      net/ipv6/ip6_icmp.o
  CC      drivers/net/phy/phy-c45.o
  CC      net/mac80211/parse.o
  CC      drivers/acpi/acpica/rsinfo.o
  AR      net/ipv4/built-in.a
  CC      drivers/acpi/acpica/rsio.o
  CC      kernel/kcmp.o
  CC      drivers/acpi/fan_attr.o
  CC      drivers/net/phy/phy-core.o
  CC      net/ipv6/output_core.o
  CC      fs/nfs/nfs4sysctl.o
  CC      fs/d_path.o
  CC      drivers/net/phy/phy_device.o
  CC      net/mac80211/wme.o
  CC      net/ipv6/protocol.o
  CC      drivers/net/phy/linkmode.o
  CC      kernel/freezer.o
  CC      drivers/ata/libata-trace.o
  CC      kernel/profile.o
  AR      drivers/net/mdio/built-in.a
  CC      drivers/acpi/acpica/rsirq.o
  CC      drivers/scsi/constants.o
  CC      drivers/acpi/acpica/rslist.o
  CC      fs/stack.o
  CC      lib/memweight.o
  CC      fs/fs_struct.o
  CC      drivers/net/phy/mdio_bus.o
  CC      drivers/net/phy/mdio_device.o
  CC      net/ipv6/ip6_offload.o
  CC      drivers/acpi/acpi_video.o
  CC      arch/x86/kernel/i8253.o
  CC      lib/kfifo.o
  CC      drivers/scsi/scsi_lib_dma.o
  CC      drivers/net/phy/swphy.o
  CC      arch/x86/kernel/hw_breakpoint.o
  CC      fs/statfs.o
  CC      fs/fs_pin.o
  CC      drivers/acpi/video_detect.o
  CC [M]  drivers/gpu/drm/xe/xe_force_wake.o
  CC      drivers/acpi/acpica/rsmemory.o
  CC      kernel/stacktrace.o
  CC      drivers/net/phy/fixed_phy.o
  CC      drivers/gpu/drm/i915/soc/intel_dram.o
  AR      drivers/net/ethernet/3com/built-in.a
  CC      fs/nsfs.o
  CC      fs/fs_types.o
  CC      drivers/net/ethernet/8390/ne2k-pci.o
  CC      fs/fs_context.o
  CC      net/ipv6/tcpv6_offload.o
  CC      drivers/ata/libata-sata.o
  AR      drivers/net/ethernet/adaptec/built-in.a
  CC      drivers/ata/libata-sff.o
  CC      drivers/net/phy/realtek.o
  CC      drivers/scsi/scsi_scan.o
  CC      kernel/dma.o
  CC      net/ipv6/exthdrs_offload.o
  CC      drivers/acpi/acpica/rsmisc.o
  CC      drivers/ata/libata-pmp.o
  GEN     drivers/scsi/scsi_devinfo_tbl.c
  AR      drivers/net/ethernet/agere/built-in.a
  CC      drivers/gpu/drm/i915/soc/intel_gmch.o
  CC      fs/fs_parser.o
  CC      drivers/ata/libata-acpi.o
  CC      drivers/acpi/acpica/rsserial.o
  CC      drivers/gpu/drm/i915/soc/intel_pch.o
  CC      net/mac80211/chan.o
  CC      fs/fsopen.o
  CC      lib/percpu-refcount.o
  CC      drivers/ata/libata-pata-timings.o
  CC      drivers/net/ethernet/8390/8390.o
  CC      drivers/firewire/init_ohci1394_dma.o
  CC      drivers/ata/ahci.o
  CC      drivers/ata/libahci.o
  CC      drivers/gpu/drm/drm_color_mgmt.o
  CC      net/mac80211/trace.o
  CC      fs/init.o
  CC      drivers/cdrom/cdrom.o
  CC      fs/kernel_read_file.o
  CC      net/mac80211/mlme.o
  CC [M]  drivers/gpu/drm/xe/xe_ggtt.o
  CC      arch/x86/kernel/tsc.o
  CC      kernel/smp.o
  CC      drivers/scsi/scsi_devinfo.o
  CC      drivers/acpi/acpica/rsutils.o
  CC      drivers/ata/ata_piix.o
  CC      fs/mnt_idmapping.o
  CC      lib/rhashtable.o
  CC      lib/base64.o
  CC      drivers/acpi/processor_driver.o
  CC      fs/remap_range.o
  CC      drivers/scsi/scsi_sysctl.o
  CC      drivers/scsi/scsi_proc.o
  CC      lib/once.o
  CC      lib/refcount.o
  AR      drivers/net/wireless/admtek/built-in.a
  CC      fs/pidfs.o
  CC      net/ipv6/inet6_hashtables.o
  AR      drivers/net/wireless/ath/built-in.a
  CC      net/ipv6/mcast_snoop.o
  AR      drivers/net/wireless/atmel/built-in.a
  AR      drivers/net/wireless/broadcom/built-in.a
  AR      drivers/firewire/built-in.a
  AR      drivers/net/wireless/intel/built-in.a
  AR      drivers/auxdisplay/built-in.a
  CC      drivers/gpu/drm/i915/i915_memcpy.o
  AR      drivers/net/wireless/intersil/built-in.a
  AR      drivers/net/phy/built-in.a
  CC      drivers/gpu/drm/i915/i915_mm.o
  CC      fs/buffer.o
  AR      drivers/net/wireless/marvell/built-in.a
  AR      drivers/net/usb/built-in.a
  AR      drivers/net/wireless/mediatek/built-in.a
  CC      fs/mpage.o
  CC      drivers/acpi/acpica/rsxface.o
  AR      drivers/net/ethernet/alacritech/built-in.a
  AR      drivers/net/wireless/microchip/built-in.a
  CC      drivers/acpi/acpica/tbdata.o
  CC      drivers/ata/pata_amd.o
  AR      drivers/net/wireless/purelifi/built-in.a
  AR      drivers/net/wireless/quantenna/built-in.a
  CC      kernel/uid16.o
  CC      kernel/kallsyms.o
  CC      drivers/ata/pata_oldpiix.o
  CC      drivers/net/mii.o
  CC      drivers/net/loopback.o
  AR      drivers/net/wireless/ralink/built-in.a
  CC      kernel/acct.o
  CC      drivers/ata/pata_sch.o
  CC      kernel/vmcore_info.o
  AR      drivers/net/wireless/realtek/built-in.a
  AR      drivers/net/wireless/rsi/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gpu_scheduler.o
  CC      drivers/gpu/drm/i915/i915_sw_fence.o
  AR      drivers/net/wireless/silabs/built-in.a
  CC      drivers/gpu/drm/i915/i915_sw_fence_work.o
  AR      drivers/net/ethernet/alteon/built-in.a
  AR      drivers/net/wireless/st/built-in.a
  CC      kernel/elfcorehdr.o
  AR      drivers/net/wireless/ti/built-in.a
  AR      drivers/net/wireless/zydas/built-in.a
  CC      lib/rcuref.o
  AR      drivers/net/ethernet/amazon/built-in.a
  AR      drivers/net/wireless/virtual/built-in.a
  CC      arch/x86/kernel/tsc_msr.o
  AR      drivers/net/wireless/built-in.a
  CC      kernel/crash_reserve.o
  CC      drivers/net/netconsole.o
  CC      drivers/gpu/drm/drm_connector.o
  AR      drivers/net/ethernet/8390/built-in.a
  AR      drivers/net/ethernet/amd/built-in.a
  AR      drivers/net/ethernet/aquantia/built-in.a
  AR      drivers/net/ethernet/arc/built-in.a
  AR      drivers/net/ethernet/asix/built-in.a
  AR      drivers/net/ethernet/atheros/built-in.a
  CC      drivers/gpu/drm/drm_crtc.o
  CC      drivers/acpi/processor_thermal.o
  AR      drivers/net/ethernet/cadence/built-in.a
  CC      drivers/net/ethernet/broadcom/bnx2.o
  CC      drivers/acpi/processor_idle.o
  CC      drivers/acpi/acpica/tbfadt.o
  CC      lib/usercopy.o
  CC      drivers/net/ethernet/broadcom/tg3.o
  HOSTCC  drivers/gpu/drm/xe/xe_gen_wa_oob
  CC      drivers/gpu/drm/i915/i915_syncmap.o
  CC      net/mac80211/tdls.o
  CC      kernel/kexec_core.o
  CC      drivers/acpi/processor_throttling.o
  CC      arch/x86/kernel/io_delay.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc_proxy.o
  CC      lib/errseq.o
  CC      drivers/acpi/acpica/tbfind.o
  CC      drivers/scsi/scsi_debugfs.o
  CC      net/mac80211/ocb.o
  CC      kernel/crash_core.o
  CC      drivers/gpu/drm/drm_displayid.o
  AR      drivers/net/ethernet/brocade/built-in.a
  CC      kernel/kexec.o
  CC      fs/proc_namespace.o
  CC      lib/bucket_locks.o
  CC      drivers/gpu/drm/drm_drv.o
  CC      drivers/ata/pata_mpiix.o
  CC      kernel/utsname.o
  CC      drivers/ata/ata_generic.o
  CC      drivers/acpi/acpica/tbinstal.o
  CC      drivers/gpu/drm/i915/i915_user_extensions.o
  AR      drivers/net/ethernet/cavium/common/built-in.a
  CC      drivers/gpu/drm/i915/i915_debugfs.o
  AR      drivers/net/ethernet/chelsio/built-in.a
  AR      drivers/net/ethernet/cavium/thunder/built-in.a
  CC      kernel/pid_namespace.o
  CC      arch/x86/kernel/rtc.o
  CC      arch/x86/kernel/resource.o
  AR      drivers/net/ethernet/cavium/liquidio/built-in.a
  AR      drivers/cdrom/built-in.a
  AR      drivers/net/ethernet/cisco/built-in.a
  AR      drivers/net/ethernet/cavium/octeon/built-in.a
  AR      drivers/net/ethernet/cortina/built-in.a
  AR      drivers/net/ethernet/cavium/built-in.a
  CC      drivers/pcmcia/cs.o
  CC      fs/direct-io.o
  CC      drivers/usb/common/common.o
  CC      drivers/usb/core/usb.o
  CC      drivers/input/serio/serio.o
  CC      drivers/input/keyboard/atkbd.o
  CC      drivers/input/serio/i8042.o
  AR      drivers/net/ethernet/dec/tulip/built-in.a
  CC      drivers/usb/common/debug.o
  AR      drivers/net/ethernet/dec/built-in.a
  CC      drivers/acpi/processor_perflib.o
  CC      drivers/net/virtio_net.o
  CC      drivers/input/serio/serport.o
  AR      fs/nfs/built-in.a
  AR      drivers/usb/phy/built-in.a
  CC      drivers/input/serio/libps2.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc_submit.o
  CC      kernel/stop_machine.o
  CC      drivers/net/net_failover.o
  AR      net/ipv6/built-in.a
  AS      arch/x86/kernel/irqflags.o
  CC      net/mac80211/airtime.o
  CC [M]  drivers/gpu/drm/xe/xe_gt.o
  CC      kernel/audit.o
  CC      drivers/acpi/acpica/tbprint.o
  CC      drivers/scsi/scsi_trace.o
  CC      lib/generic-radix-tree.o
  CC      drivers/scsi/scsi_logging.o
  CC      kernel/auditfilter.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_ccs_mode.o
  CC      drivers/scsi/scsi_pm.o
  CC      net/mac80211/eht.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_clock.o
  CC      drivers/gpu/drm/drm_dumb_buffers.o
  CC      fs/eventpoll.o
  CC      kernel/auditsc.o
  CC      drivers/scsi/scsi_bsg.o
  CC      kernel/audit_watch.o
  CC      drivers/gpu/drm/i915/i915_debugfs_params.o
  CC      arch/x86/kernel/static_call.o
  CC      drivers/acpi/acpica/tbutils.o
  CC      drivers/rtc/lib.o
  CC      drivers/acpi/acpica/tbxface.o
  AR      drivers/usb/common/built-in.a
  CC      drivers/rtc/class.o
  CC      lib/bitmap-str.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_debugfs.o
  AR      drivers/ata/built-in.a
  CC      drivers/gpu/drm/drm_edid.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_freq.o
  CC      drivers/i2c/algos/i2c-algo-bit.o
  CC      drivers/pcmcia/socket_sysfs.o
  CC      drivers/acpi/container.o
  CC      drivers/scsi/scsi_common.o
  CC      net/mac80211/led.o
  CC      drivers/rtc/interface.o
  CC      drivers/usb/core/hub.o
  AR      drivers/input/keyboard/built-in.a
  CC      net/mac80211/pm.o
  CC      drivers/input/mouse/psmouse-base.o
  CC      arch/x86/kernel/process.o
  CC      drivers/acpi/acpica/tbxfload.o
  CC      drivers/input/mouse/synaptics.o
  CC      drivers/acpi/acpica/tbxfroot.o
  CC      drivers/acpi/acpica/utaddress.o
  AR      drivers/input/joystick/built-in.a
  AR      drivers/input/tablet/built-in.a
  CC      drivers/usb/core/hcd.o
  CC      drivers/rtc/nvmem.o
  AR      drivers/input/touchscreen/built-in.a
  AR      drivers/input/misc/built-in.a
  CC      net/mac80211/rc80211_minstrel_ht.o
  CC      drivers/usb/core/urb.o
  CC      drivers/acpi/acpica/utalloc.o
  CC      drivers/gpu/drm/drm_eld.o
  AR      drivers/input/serio/built-in.a
  CC      kernel/audit_fsnotify.o
  CC      kernel/audit_tree.o
  CC      drivers/gpu/drm/drm_encoder.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_idle.o
  CC      drivers/acpi/acpica/utascii.o
  CC      drivers/scsi/scsi_transport_spi.o
  CC      drivers/scsi/virtio_scsi.o
  AR      drivers/i3c/built-in.a
  CC      drivers/gpu/drm/drm_file.o
  CC      net/mac80211/wbrf.o
  CC      lib/string_helpers.o
  CC      drivers/scsi/sd.o
  CC      fs/anon_inodes.o
  CC      fs/signalfd.o
  CC      drivers/acpi/acpica/utbuffer.o
  CC      lib/hexdump.o
  CC      drivers/acpi/acpica/utcksum.o
  CC      drivers/pcmcia/cardbus.o
  CC      drivers/rtc/dev.o
  CC      drivers/rtc/proc.o
  CC      drivers/usb/mon/mon_main.o
  CC      drivers/gpu/drm/i915/i915_pmu.o
  CC      drivers/gpu/drm/i915/gt/gen2_engine_cs.o
  CC      drivers/usb/mon/mon_stat.o
  AR      drivers/i2c/algos/built-in.a
  CC      fs/timerfd.o
  CC      drivers/i2c/busses/i2c-i801.o
  AR      drivers/i2c/muxes/built-in.a
  CC      drivers/i2c/i2c-boardinfo.o
  CC      kernel/kprobes.o
  CC      drivers/acpi/thermal_lib.o
  CC      drivers/acpi/thermal.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_mcr.o
  CC      drivers/acpi/acpica/utcopy.o
  CC      drivers/gpu/drm/drm_fourcc.o
  CC      drivers/usb/core/message.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_pagefault.o
  CC      drivers/rtc/sysfs.o
  CC      drivers/rtc/rtc-mc146818-lib.o
  CC      drivers/gpu/drm/drm_framebuffer.o
  CC      drivers/gpu/drm/drm_gem.o
  CC      drivers/rtc/rtc-cmos.o
  CC      drivers/acpi/acpica/utexcep.o
  CC      drivers/pcmcia/ds.o
  CC      drivers/usb/host/pci-quirks.o
  CC      fs/eventfd.o
  CC      drivers/usb/host/ehci-hcd.o
  CC      lib/kstrtox.o
  CC      kernel/seccomp.o
  CC      drivers/usb/mon/mon_text.o
  CC      drivers/usb/host/ehci-pci.o
  CC      drivers/gpu/drm/drm_ioctl.o
  CC      lib/iomap.o
  CC      drivers/input/mouse/focaltech.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sysfs.o
  CC      drivers/usb/class/usblp.o
  CC      drivers/acpi/acpi_memhotplug.o
  CC      kernel/relay.o
  CC      drivers/acpi/acpica/utdebug.o
  CC      drivers/gpu/drm/drm_lease.o
  CC      drivers/pcmcia/pcmcia_resource.o
  CC      fs/aio.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.o
  CC      arch/x86/kernel/ptrace.o
  CC      drivers/gpu/drm/i915/gt/gen6_engine_cs.o
  CC      drivers/acpi/ioapic.o
  CC      drivers/pcmcia/cistpl.o
  CC      fs/locks.o
  CC      kernel/utsname_sysctl.o
  CC      drivers/input/input.o
  CC      arch/x86/kernel/tls.o
  CC      drivers/acpi/acpica/utdecode.o
  CC      drivers/acpi/acpica/utdelete.o
  AR      drivers/media/i2c/built-in.a
  CC      drivers/acpi/acpica/uterror.o
  AR      drivers/media/tuners/built-in.a
  AR      drivers/media/rc/keymaps/built-in.a
  AR      drivers/media/rc/built-in.a
  CC      drivers/scsi/sr.o
  AR      drivers/media/common/b2c2/built-in.a
  AR      drivers/media/common/saa7146/built-in.a
  AR      drivers/media/common/siano/built-in.a
  CC      kernel/delayacct.o
  AR      drivers/media/common/v4l2-tpg/built-in.a
  AR      drivers/i2c/busses/built-in.a
  CC      drivers/i2c/i2c-core-base.o
  AR      drivers/media/common/videobuf2/built-in.a
  AR      drivers/media/common/built-in.a
  CC      drivers/input/mouse/alps.o
  AR      drivers/media/platform/allegro-dvt/built-in.a
  CC      drivers/i2c/i2c-core-smbus.o
  AR      drivers/media/platform/amlogic/meson-ge2d/built-in.a
  AR      drivers/media/platform/amlogic/built-in.a
  AR      drivers/media/platform/amphion/built-in.a
  CC      lib/iomap_copy.o
  CC      drivers/i2c/i2c-core-acpi.o
  AR      drivers/media/platform/aspeed/built-in.a
  AR      drivers/media/platform/atmel/built-in.a
  CC      drivers/i2c/i2c-smbus.o
  AR      drivers/media/platform/cadence/built-in.a
  CC      fs/binfmt_misc.o
  AR      drivers/rtc/built-in.a
  CC      fs/binfmt_script.o
  AR      drivers/media/platform/chips-media/coda/built-in.a
  CC      drivers/usb/mon/mon_bin.o
  AR      drivers/media/platform/intel/built-in.a
  AR      drivers/media/platform/chips-media/wave5/built-in.a
  AR      drivers/media/platform/marvell/built-in.a
  CC      fs/binfmt_elf.o
  CC      drivers/scsi/sr_ioctl.o
  AR      drivers/media/platform/chips-media/built-in.a
  CC      drivers/acpi/battery.o
  CC      drivers/acpi/acpica/uteval.o
  AR      drivers/media/platform/mediatek/jpeg/built-in.a
  CC      drivers/input/mouse/byd.o
  CC      drivers/usb/host/ohci-hcd.o
  AR      drivers/media/platform/mediatek/mdp/built-in.a
  CC      drivers/pcmcia/pcmcia_cis.o
  AR      drivers/media/platform/mediatek/vcodec/common/built-in.a
  AR      drivers/pps/clients/built-in.a
  AR      drivers/media/platform/mediatek/vcodec/encoder/built-in.a
  AR      drivers/pps/generators/built-in.a
  AR      drivers/media/platform/mediatek/vcodec/decoder/built-in.a
  CC      drivers/pps/pps.o
  CC      lib/devres.o
  AR      drivers/usb/class/built-in.a
  AR      drivers/media/platform/mediatek/vcodec/built-in.a
  AR      drivers/media/platform/microchip/built-in.a
  AR      drivers/media/platform/mediatek/vpu/built-in.a
  CC      drivers/input/input-compat.o
  CC      drivers/usb/storage/scsiglue.o
  CC      drivers/usb/storage/protocol.o
  AR      drivers/media/platform/mediatek/mdp3/built-in.a
  AR      drivers/media/platform/mediatek/built-in.a
  AR      drivers/media/platform/nuvoton/built-in.a
  CC      drivers/pcmcia/rsrc_mgr.o
  CC      drivers/usb/storage/transport.o
  CC      drivers/usb/storage/usb.o
  CC      kernel/taskstats.o
  AR      drivers/media/platform/nvidia/tegra-vde/built-in.a
  AR      drivers/media/platform/nvidia/built-in.a
  CC      drivers/usb/storage/initializers.o
  AR      drivers/media/platform/nxp/dw100/built-in.a
  AR      drivers/media/platform/nxp/imx-jpeg/built-in.a
  AR      drivers/media/platform/nxp/imx8-isi/built-in.a
  AR      drivers/media/platform/nxp/built-in.a
  AR      drivers/usb/misc/built-in.a
  CC      drivers/pcmcia/rsrc_nonstatic.o
  AR      drivers/media/platform/qcom/camss/built-in.a
  AR      drivers/media/platform/renesas/rcar-vin/built-in.a
  AR      drivers/media/platform/rockchip/rga/built-in.a
  AR      drivers/media/platform/rockchip/rkisp1/built-in.a
  CC      arch/x86/kernel/step.o
  AR      drivers/media/platform/qcom/venus/built-in.a
  AR      drivers/media/platform/renesas/rzg2l-cru/built-in.a
  AR      drivers/media/platform/rockchip/built-in.a
  CC      drivers/gpu/drm/i915/gt/gen6_ppgtt.o
  AR      drivers/media/platform/qcom/built-in.a
  AR      drivers/media/platform/renesas/vsp1/built-in.a
  CC      drivers/gpu/drm/i915/gt/gen7_renderclear.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o
  CC      arch/x86/kernel/i8237.o
  CC      drivers/gpu/drm/i915/gt/gen8_engine_cs.o
  AR      drivers/media/platform/renesas/built-in.a
  AR      drivers/media/platform/samsung/exynos-gsc/built-in.a
  CC      drivers/acpi/acpica/utglobal.o
  AR      drivers/media/platform/samsung/exynos4-is/built-in.a
  CC      drivers/gpu/drm/i915/gt/gen8_ppgtt.o
  CC      drivers/usb/core/driver.o
  AR      drivers/media/platform/samsung/s3c-camif/built-in.a
  CC      drivers/usb/core/config.o
  AR      drivers/media/platform/samsung/s5p-g2d/built-in.a
  AR      drivers/media/platform/samsung/s5p-jpeg/built-in.a
  CC      drivers/usb/core/file.o
  AR      drivers/media/platform/samsung/s5p-mfc/built-in.a
  AR      drivers/net/ethernet/dlink/built-in.a
  AR      drivers/media/platform/samsung/built-in.a
  CC      drivers/usb/core/buffer.o
  AR      drivers/media/platform/st/sti/bdisp/built-in.a
  CC      lib/check_signature.o
  AR      drivers/media/platform/st/sti/c8sectpfe/built-in.a
  AR      drivers/media/platform/st/sti/delta/built-in.a
  AR      drivers/media/platform/st/sti/hva/built-in.a
  AR      drivers/media/platform/st/stm32/built-in.a
  AR      drivers/media/platform/st/built-in.a
  CC      drivers/input/mouse/logips2pp.o
  AR      drivers/media/platform/sunxi/sun4i-csi/built-in.a
  CC      kernel/tsacct.o
  AR      drivers/media/platform/sunxi/sun6i-csi/built-in.a
  CC      kernel/tracepoint.o
  AR      drivers/media/platform/ti/am437x/built-in.a
  AR      drivers/media/platform/sunxi/sun6i-mipi-csi2/built-in.a
  AR      drivers/media/platform/ti/cal/built-in.a
  CC      kernel/irq_work.o
  AR      drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/built-in.a
  AR      drivers/media/platform/ti/vpe/built-in.a
  CC      drivers/pps/kapi.o
  AR      drivers/media/platform/ti/davinci/built-in.a
  AR      drivers/media/platform/sunxi/sun8i-di/built-in.a
  CC      drivers/input/input-mt.o
  CC      drivers/acpi/acpica/uthex.o
  AR      drivers/media/platform/ti/j721e-csi2rx/built-in.a
  AR      drivers/media/platform/sunxi/sun8i-rotate/built-in.a
  AR      drivers/media/platform/sunxi/built-in.a
  AR      drivers/media/platform/ti/omap/built-in.a
  CC      drivers/pcmcia/yenta_socket.o
  CC      lib/interval_tree.o
  AR      drivers/media/platform/ti/omap3isp/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_topology.o
  AR      drivers/media/platform/ti/built-in.a
  AR      drivers/media/platform/verisilicon/built-in.a
  CC      drivers/input/input-poller.o
  CC      drivers/acpi/acpica/utids.o
  AR      drivers/media/platform/via/built-in.a
  AR      drivers/media/platform/xilinx/built-in.a
  CC      drivers/scsi/sr_vendor.o
  AR      drivers/media/platform/built-in.a
  GEN     xe_wa_oob.c xe_wa_oob.h
  CC      drivers/usb/core/sysfs.o
  CC      drivers/acpi/acpica/utinit.o
  CC      drivers/pps/sysfs.o
  AR      drivers/media/pci/ttpci/built-in.a
  AR      drivers/media/pci/b2c2/built-in.a
  AR      drivers/usb/mon/built-in.a
  AR      drivers/media/pci/pluto2/built-in.a
  CC      drivers/acpi/acpica/utlock.o
  CC      drivers/acpi/acpica/utmath.o
  CC      drivers/usb/early/ehci-dbgp.o
  AR      drivers/media/pci/dm1105/built-in.a
  AR      drivers/media/pci/pt1/built-in.a
  CC      drivers/acpi/acpica/utmisc.o
  CC      drivers/acpi/bgrt.o
  CC      arch/x86/kernel/stacktrace.o
  CC      lib/assoc_array.o
  CC      drivers/acpi/acpica/utmutex.o
  AR      drivers/media/pci/pt3/built-in.a
  AR      drivers/media/pci/mantis/built-in.a
  CC      drivers/acpi/acpica/utnonansi.o
  AR      drivers/media/pci/ngene/built-in.a
  AR      drivers/net/ethernet/emulex/built-in.a
  AR      drivers/media/pci/ddbridge/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_breadcrumbs.o
  AR      drivers/media/pci/saa7146/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_context.o
  AR      drivers/media/pci/smipcie/built-in.a
  AR      drivers/media/usb/b2c2/built-in.a
  AR      drivers/media/pci/netup_unidvb/built-in.a
  AR      drivers/media/usb/dvb-usb/built-in.a
  CC      drivers/usb/storage/sierra_ms.o
  AR      drivers/media/usb/dvb-usb-v2/built-in.a
  CC      drivers/usb/storage/option_ms.o
  CC      drivers/input/ff-core.o
  AR      drivers/media/pci/intel/ipu3/built-in.a
  AR      drivers/media/usb/s2255/built-in.a
  CC      drivers/usb/storage/usual-tables.o
  AR      drivers/media/pci/intel/ivsc/built-in.a
  AR      drivers/media/usb/siano/built-in.a
  AR      drivers/media/pci/intel/built-in.a
  CC      arch/x86/kernel/reboot.o
  AR      drivers/media/usb/ttusb-budget/built-in.a
  AR      drivers/media/usb/ttusb-dec/built-in.a
  CC      drivers/acpi/acpica/utobject.o
  CC      arch/x86/kernel/msr.o
  AR      drivers/media/pci/built-in.a
  AR      drivers/media/usb/built-in.a
  CC      lib/bitrev.o
  CC      lib/crc-ccitt.o
  CC      drivers/acpi/spcr.o
  CC      fs/mbcache.o
  CC      drivers/input/mouse/lifebook.o
  CC      drivers/input/mouse/trackpoint.o
  AR      drivers/media/mmc/siano/built-in.a
  AR      drivers/media/firewire/built-in.a
  AR      drivers/media/spi/built-in.a
  AR      drivers/media/mmc/built-in.a
  CC      fs/posix_acl.o
  AR      drivers/media/test-drivers/built-in.a
  CC      fs/coredump.o
  AR      drivers/pps/built-in.a
  AR      drivers/media/built-in.a
  CC      kernel/static_call.o
  CC      fs/drop_caches.o
  CC      drivers/acpi/acpica/utosi.o
  CC      drivers/ptp/ptp_clock.o
  CC      drivers/gpu/drm/i915/gt/intel_context_sseu.o
  CC      drivers/ptp/ptp_chardev.o
  CC      drivers/input/touchscreen.o
  CC      drivers/gpu/drm/i915/gt/intel_engine_cs.o
  CC      arch/x86/kernel/cpuid.o
  CC      kernel/padata.o
  CC      drivers/input/ff-memless.o
  CC      drivers/power/supply/power_supply_core.o
  CC      fs/sysctls.o
  AR      drivers/i2c/built-in.a
  CC      drivers/hwmon/hwmon.o
  CC      drivers/input/mouse/cypress_ps2.o
  CC      fs/fhandle.o
  CC      lib/crc16.o
  CC      drivers/scsi/sg.o
  AR      drivers/thermal/broadcom/built-in.a
  AR      drivers/watchdog/built-in.a
  AR      drivers/thermal/samsung/built-in.a
  CC      drivers/md/md.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_ct.o
  HOSTCC  lib/gen_crc32table
  CC      drivers/thermal/intel/intel_tcc.o
  CC      drivers/cpufreq/cpufreq.o
  CC      drivers/thermal/intel/therm_throt.o
  CC      drivers/scsi/scsi_sysfs.o
  CC      drivers/usb/host/ohci-pci.o
  CC      drivers/usb/host/uhci-hcd.o
  CC      drivers/cpuidle/governors/menu.o
  CC      kernel/jump_label.o
  CC      drivers/cpuidle/cpuidle.o
  CC      drivers/cpuidle/governors/haltpoll.o
  CC      drivers/acpi/acpica/utownerid.o
  CC      drivers/cpufreq/freq_table.o
  CC      drivers/gpu/drm/i915/gt/intel_engine_heartbeat.o
  CC      drivers/usb/core/endpoint.o
  AR      drivers/usb/early/built-in.a
  CC      kernel/context_tracking.o
  CC      drivers/input/mouse/psmouse-smbus.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_db_mgr.o
  AR      drivers/usb/storage/built-in.a
  CC      arch/x86/kernel/early-quirks.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_debugfs.o
  CC      kernel/iomem.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_hwconfig.o
  AR      drivers/thermal/st/built-in.a
  CC      drivers/input/sparse-keymap.o
  CC      lib/xxhash.o
  AR      drivers/thermal/qcom/built-in.a
  AR      drivers/pcmcia/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_engine_pm.o
  CC      drivers/acpi/acpica/utpredef.o
  CC [M]  drivers/thermal/intel/x86_pkg_temp_thermal.o
  CC      drivers/md/md-bitmap.o
  CC      drivers/gpu/drm/drm_managed.o
  AR      drivers/mmc/built-in.a
  AR      drivers/thermal/tegra/built-in.a
  CC      drivers/cpuidle/driver.o
  CC      drivers/input/vivaldi-fmap.o
  CC      lib/genalloc.o
  CC      drivers/input/input-leds.o
  CC      lib/percpu_counter.o
  CC      lib/audit.o
  CC      kernel/rseq.o
  CC      drivers/usb/core/devio.o
  CC      drivers/power/supply/power_supply_sysfs.o
  CC      drivers/ptp/ptp_sysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_id_mgr.o
  CC      drivers/power/supply/power_supply_leds.o
  AR      drivers/net/ethernet/engleder/built-in.a
  AR      drivers/net/ethernet/ezchip/built-in.a
  AR      drivers/net/ethernet/fujitsu/built-in.a
  AR      drivers/net/ethernet/fungible/built-in.a
  CC      arch/x86/kernel/smp.o
  CC      drivers/gpu/drm/i915/gt/intel_engine_user.o
  CC      drivers/acpi/acpica/utresdecode.o
  CC      arch/x86/kernel/smpboot.o
  CC      drivers/input/evdev.o
  CC      drivers/gpu/drm/i915/gt/intel_execlists_submission.o
  CC      drivers/usb/core/notify.o
  CC      drivers/power/supply/power_supply_hwmon.o
  CC      drivers/usb/core/generic.o
  CC      drivers/gpu/drm/drm_mm.o
  CC      drivers/md/md-autodetect.o
  CC      drivers/acpi/acpica/utresrc.o
  CC      drivers/acpi/acpica/utstate.o
  CC      drivers/md/dm.o
  AR      drivers/input/mouse/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_guc_klv_helpers.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_log.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_pc.o
  AR      drivers/hwmon/built-in.a
  AR      drivers/thermal/intel/built-in.a
  AR      drivers/ufs/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_guc_submit.o
  AR      drivers/leds/trigger/built-in.a
  AR      drivers/firmware/arm_ffa/built-in.a
  AR      drivers/firmware/arm_scmi/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_heci_gsc.o
  CC      drivers/thermal/thermal_core.o
  AR      drivers/leds/blink/built-in.a
  AR      drivers/thermal/mediatek/built-in.a
  CC      drivers/leds/led-core.o
  AR      drivers/cpuidle/governors/built-in.a
  AR      drivers/leds/simple/built-in.a
  AR      drivers/firmware/broadcom/built-in.a
  CC      lib/syscall.o
  CC      lib/errname.o
  CC      drivers/clocksource/acpi_pm.o
  CC      drivers/acpi/acpica/utstring.o
  CC      lib/nlattr.o
  CC      drivers/clocksource/i8253.o
  AR      drivers/crypto/stm32/built-in.a
  AR      drivers/firmware/cirrus/built-in.a
  AR      drivers/crypto/xilinx/built-in.a
  CC      drivers/leds/led-class.o
  AR      drivers/crypto/hisilicon/built-in.a
  AR      drivers/firmware/meson/built-in.a
  CC      drivers/leds/led-triggers.o
  AR      drivers/firmware/microchip/built-in.a
  AR      drivers/crypto/intel/keembay/built-in.a
  AR      fs/built-in.a
  AR      drivers/crypto/intel/ixp4xx/built-in.a
  AR      drivers/crypto/intel/built-in.a
  AR      drivers/crypto/starfive/built-in.a
  CC      lib/cpu_rmap.o
  AR      drivers/crypto/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine.o
  CC      drivers/ptp/ptp_vclock.o
  AR      drivers/net/ethernet/google/built-in.a
  AR      drivers/net/ethernet/huawei/built-in.a
  CC      drivers/firmware/efi/libstub/efi-stub-helper.o
  CC      arch/x86/kernel/tsc_sync.o
  CC      drivers/cpuidle/governor.o
  AR      drivers/power/supply/built-in.a
  CC      drivers/net/ethernet/intel/e1000/e1000_main.o
  AR      drivers/net/ethernet/i825xx/built-in.a
  AR      drivers/power/built-in.a
  CC      lib/dynamic_queue_limits.o
  CC      drivers/md/dm-table.o
  CC      drivers/cpufreq/cpufreq_performance.o
  CC      drivers/net/ethernet/intel/e1000/e1000_hw.o
  CC      drivers/cpuidle/sysfs.o
  AR      net/mac80211/built-in.a
  AR      net/built-in.a
  AR      drivers/scsi/built-in.a
  CC      drivers/cpuidle/poll_state.o
  CC      drivers/acpi/acpica/utstrsuppt.o
  CC      drivers/gpu/drm/i915/gt/intel_ggtt.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.o
  AR      kernel/built-in.a
  CC      drivers/firmware/efi/libstub/gop.o
  CC      drivers/cpuidle/cpuidle-haltpoll.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_fence.o
  CC      drivers/hid/usbhid/hid-core.o
  CC [M]  drivers/gpu/drm/xe/xe_huc.o
  CC      drivers/usb/host/xhci.o
  CC      drivers/usb/host/xhci-mem.o
  CC      drivers/hid/hid-core.o
  CC      lib/glob.o
  CC      drivers/gpu/drm/i915/gt/intel_ggtt_fencing.o
  CC      drivers/hid/usbhid/hiddev.o
  CC      lib/strncpy_from_user.o
  CC      drivers/hid/usbhid/hid-pidff.o
  CC      drivers/gpu/drm/i915/gt/intel_gt.o
  CC      drivers/hid/hid-input.o
  CC      drivers/cpufreq/cpufreq_userspace.o
  AR      drivers/clocksource/built-in.a
  CC      lib/strnlen_user.o
  AR      drivers/platform/x86/amd/built-in.a
  AR      drivers/input/built-in.a
  AR      drivers/platform/x86/intel/built-in.a
  CC      lib/net_utils.o
  CC      lib/sg_pool.o
  CC      drivers/platform/x86/wmi.o
  AR      drivers/platform/surface/built-in.a
  CC      drivers/gpu/drm/drm_mode_config.o
  CC      drivers/gpu/drm/drm_mode_object.o
  CC [M]  drivers/gpu/drm/xe/xe_huc_debugfs.o
  AR      drivers/leds/built-in.a
  CC      arch/x86/kernel/setup_percpu.o
  CC      drivers/acpi/acpica/utstrtoul64.o
  CC      drivers/firmware/efi/libstub/secureboot.o
  CC      drivers/hid/hid-quirks.o
  CC      lib/stackdepot.o
  CC      lib/asn1_decoder.o
  CC      drivers/ptp/ptp_kvm_x86.o
  CC      drivers/platform/x86/wmi-bmof.o
  AR      drivers/cpuidle/built-in.a
  CC      drivers/mailbox/mailbox.o
  CC      drivers/mailbox/pcc.o
  AR      drivers/perf/built-in.a
  AR      drivers/hwtracing/intel_th/built-in.a
  AR      drivers/android/built-in.a
  AR      drivers/nvmem/layouts/built-in.a
  CC      drivers/nvmem/core.o
  GEN     lib/oid_registry_data.c
  CC      drivers/cpufreq/cpufreq_ondemand.o
  CC      drivers/acpi/acpica/utxface.o
  CC      drivers/hid/hid-debug.o
  CC      drivers/cpufreq/cpufreq_governor.o
  CC      drivers/net/ethernet/intel/e100.o
  CC      drivers/net/ethernet/intel/e1000e/82571.o
  CC      drivers/gpu/drm/drm_modes.o
  CC      drivers/net/ethernet/intel/e1000e/ich8lan.o
  CC [M]  drivers/gpu/drm/xe/xe_irq.o
  CC      lib/ucs2_string.o
  CC      drivers/usb/core/quirks.o
  CC      drivers/net/ethernet/intel/e1000e/80003es2lan.o
  CC      drivers/md/dm-target.o
  CC      drivers/thermal/thermal_sysfs.o
  CC      drivers/acpi/acpica/utxfinit.o
  CC      lib/sbitmap.o
  CC      drivers/firmware/efi/libstub/tpm.o
  CC      arch/x86/kernel/mpparse.o
  AR      drivers/net/ethernet/microsoft/built-in.a
  CC      drivers/acpi/acpica/utxferror.o
  CC      drivers/gpu/drm/drm_modeset_lock.o
  CC      drivers/usb/core/devices.o
  CC      drivers/ptp/ptp_kvm_common.o
  CC      drivers/gpu/drm/drm_plane.o
  CC [M]  drivers/gpu/drm/xe/xe_lrc.o
  CC      drivers/usb/host/xhci-ext-caps.o
  CC      drivers/platform/x86/eeepc-laptop.o
  AR      drivers/mailbox/built-in.a
  CC      lib/group_cpus.o
  CC      drivers/usb/host/xhci-ring.o
  CC      drivers/platform/x86/p2sb.o
  CC      drivers/firmware/efi/libstub/file.o
  CC      lib/fw_table.o
  CC      drivers/firmware/efi/efi-bgrt.o
  AR      lib/lib.a
  GEN     lib/crc32table.h
  CC      drivers/usb/host/xhci-hub.o
  AR      drivers/hid/usbhid/built-in.a
  CC      drivers/usb/core/phy.o
  CC      drivers/firmware/efi/libstub/mem.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.o
  CC      drivers/cpufreq/cpufreq_governor_attr_set.o
  CC      drivers/md/dm-linear.o
  CC      drivers/acpi/acpica/utxfmutex.o
  CC      drivers/firmware/efi/efi.o
  AR      drivers/firmware/imx/built-in.a
  AR      drivers/net/ethernet/litex/built-in.a
  CC      drivers/gpu/drm/drm_prime.o
  AR      drivers/net/ethernet/broadcom/built-in.a
  CC      arch/x86/kernel/trace_clock.o
  CC      drivers/firmware/efi/libstub/random.o
  CC      drivers/thermal/thermal_trip.o
  CC [M]  drivers/gpu/drm/xe/xe_migrate.o
  CC      drivers/usb/core/port.o
  CC      drivers/usb/core/hcd-pci.o
  AR      drivers/firmware/psci/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.o
  CC [M]  drivers/gpu/drm/xe/xe_mmio.o
  AR      drivers/nvmem/built-in.a
  CC      drivers/gpu/drm/drm_print.o
  CC      drivers/firmware/efi/libstub/randomalloc.o
  CC      drivers/firmware/efi/vars.o
  CC      arch/x86/kernel/trace.o
  CC      drivers/thermal/thermal_helpers.o
  AR      drivers/net/ethernet/marvell/octeon_ep/built-in.a
  AR      drivers/acpi/acpica/built-in.a
  CC      drivers/hid/hidraw.o
  AR      drivers/net/ethernet/marvell/octeon_ep_vf/built-in.a
  CC      lib/oid_registry.o
  CC      drivers/net/ethernet/intel/e1000/e1000_ethtool.o
  AR      drivers/ptp/built-in.a
  AR      drivers/net/ethernet/marvell/octeontx2/built-in.a
  CC      drivers/net/ethernet/intel/e1000/e1000_param.o
  AR      drivers/net/ethernet/marvell/prestera/built-in.a
  CC      drivers/thermal/thermal_hwmon.o
  AR      drivers/acpi/built-in.a
  CC      drivers/firmware/efi/libstub/pci.o
  CC      drivers/net/ethernet/marvell/sky2.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_clock_utils.o
  CC      drivers/hid/hid-generic.o
  CC      arch/x86/kernel/rethook.o
  CC      drivers/gpu/drm/drm_property.o
  CC      drivers/gpu/drm/drm_syncobj.o
  CC      drivers/cpufreq/acpi-cpufreq.o
  CC      drivers/usb/core/usb-acpi.o
  CC      drivers/firmware/efi/libstub/skip_spaces.o
  CC      drivers/firmware/efi/libstub/lib-cmdline.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_debugfs.o
  CC      drivers/cpufreq/amd-pstate.o
  CC      drivers/cpufreq/amd-pstate-trace.o
  CC      drivers/md/dm-stripe.o
  CC      drivers/net/ethernet/intel/e1000e/mac.o
  CC      drivers/firmware/efi/libstub/lib-ctype.o
  CC      drivers/cpufreq/intel_pstate.o
  CC      drivers/hid/hid-a4tech.o
  CC      lib/crc32.o
  CC      drivers/gpu/drm/drm_sysfs.o
  AR      drivers/net/ethernet/mellanox/built-in.a
  CC      drivers/hid/hid-apple.o
  AR      drivers/platform/x86/built-in.a
  CC      drivers/net/ethernet/intel/e1000e/manage.o
  AR      drivers/platform/built-in.a
  CC      drivers/md/dm-ioctl.o
  CC      drivers/thermal/gov_step_wise.o
  CC      drivers/firmware/efi/libstub/alignedmem.o
  CC      drivers/firmware/efi/reboot.o
  CC      drivers/firmware/efi/memattr.o
  CC      drivers/gpu/drm/drm_trace_points.o
  CC      drivers/firmware/efi/libstub/relocate.o
  CC      drivers/hid/hid-belkin.o
  AR      drivers/net/ethernet/micrel/built-in.a
  AR      drivers/net/ethernet/microchip/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_mocs.o
  CC      drivers/firmware/efi/tpm.o
  CC      drivers/md/dm-io.o
  CC      arch/x86/kernel/vmcore_info_32.o
  CC      drivers/hid/hid-cherry.o
  CC      drivers/firmware/efi/libstub/printk.o
  CC      drivers/hid/hid-chicony.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_irq.o
  AR      drivers/net/ethernet/mscc/built-in.a
  CC      drivers/gpu/drm/drm_vblank.o
  AR      drivers/net/ethernet/myricom/built-in.a
  CC      drivers/gpu/drm/drm_vblank_work.o
  CC      drivers/hid/hid-cypress.o
  AR      drivers/usb/core/built-in.a
  CC      drivers/gpu/drm/drm_vma_manager.o
  AR      drivers/net/ethernet/natsemi/built-in.a
  AR      drivers/net/ethernet/neterion/built-in.a
  AR      lib/built-in.a
  AR      drivers/net/ethernet/netronome/built-in.a
  CC      drivers/thermal/gov_user_space.o
  CC      drivers/gpu/drm/drm_writeback.o
  CC      drivers/net/ethernet/intel/e1000e/nvm.o
  CC      drivers/gpu/drm/drm_panel.o
  CC      drivers/md/dm-kcopyd.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_mcr.o
  CC      drivers/usb/host/xhci-dbg.o
  CC      drivers/gpu/drm/drm_pci.o
  CC      drivers/gpu/drm/drm_debugfs.o
  CC      drivers/hid/hid-ezkey.o
  CC      drivers/hid/hid-gyration.o
  CC      drivers/md/dm-sysfs.o
  CC      drivers/gpu/drm/drm_debugfs_crc.o
  CC      drivers/net/ethernet/intel/e1000e/phy.o
  CC      drivers/net/ethernet/intel/e1000e/param.o
  CC      drivers/hid/hid-ite.o
  CC      drivers/firmware/efi/libstub/vsprintf.o
  CC      arch/x86/kernel/machine_kexec_32.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_pm.o
  CC      drivers/hid/hid-kensington.o
  CC      drivers/usb/host/xhci-trace.o
  CC      drivers/firmware/efi/memmap.o
  CC      drivers/firmware/efi/libstub/x86-stub.o
  CC      drivers/gpu/drm/drm_panel_orientation_quirks.o
  AR      drivers/net/ethernet/ni/built-in.a
  CC      drivers/net/ethernet/nvidia/forcedeth.o
  CC      drivers/md/dm-stats.o
  AR      drivers/thermal/built-in.a
  CC      drivers/gpu/drm/drm_buddy.o
  CC [M]  drivers/gpu/drm/xe/xe_module.o
  CC      drivers/gpu/drm/drm_gem_shmem_helper.o
  CC      drivers/hid/hid-lg.o
  CC      drivers/hid/hid-lgff.o
  CC      drivers/net/ethernet/intel/e1000e/ethtool.o
  AR      drivers/net/ethernet/oki-semi/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.o
  AR      drivers/net/ethernet/packetengines/built-in.a
  CC      drivers/md/dm-rq.o
  AR      drivers/net/ethernet/qlogic/built-in.a
  AR      drivers/net/ethernet/qualcomm/emac/built-in.a
  AR      drivers/net/ethernet/qualcomm/built-in.a
  STUBCPY drivers/firmware/efi/libstub/alignedmem.stub.o
  CC      drivers/net/ethernet/realtek/8139too.o
  STUBCPY drivers/firmware/efi/libstub/efi-stub-helper.stub.o
  CC      drivers/gpu/drm/drm_atomic_helper.o
  CC      drivers/md/dm-io-rewind.o
  CC      drivers/hid/hid-lg4ff.o
  CC      drivers/md/dm-builtin.o
  AR      drivers/net/ethernet/renesas/built-in.a
  CC      drivers/net/ethernet/intel/e1000e/netdev.o
  CC      drivers/gpu/drm/drm_atomic_state_helper.o
  AR      drivers/net/ethernet/intel/e1000/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_gt_pm_irq.o
  AS      arch/x86/kernel/relocate_kernel_32.o
  CC      drivers/firmware/efi/capsule.o
  CC [M]  drivers/gpu/drm/xe/xe_pat.o
  CC      drivers/md/dm-raid1.o
  AR      drivers/net/ethernet/rdc/built-in.a
  AR      drivers/net/ethernet/rocker/built-in.a
  AR      drivers/net/ethernet/samsung/built-in.a
  AR      drivers/net/ethernet/seeq/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_pci.o
  AR      drivers/firmware/qcom/built-in.a
  CC      drivers/firmware/efi/esrt.o
  CC      drivers/hid/hid-lg-g15.o
  AR      drivers/firmware/smccc/built-in.a
  AR      drivers/firmware/tegra/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_pcode.o
  CC      drivers/gpu/drm/drm_bridge_connector.o
  STUBCPY drivers/firmware/efi/libstub/file.stub.o
  CC      drivers/gpu/drm/drm_crtc_helper.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_requests.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_sysfs.o
  CC      drivers/firmware/efi/runtime-wrappers.o
  CC      arch/x86/kernel/crash_dump_32.o
  CC      drivers/md/dm-log.o
  CC      arch/x86/kernel/crash.o
  CC      drivers/firmware/efi/capsule-loader.o
  AR      drivers/net/ethernet/silan/built-in.a
  CC      drivers/firmware/efi/earlycon.o
  CC      drivers/md/dm-region-hash.o
  CC      drivers/net/ethernet/intel/e1000e/ptp.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.o
  STUBCPY drivers/firmware/efi/libstub/gop.stub.o
  CC      drivers/net/ethernet/realtek/r8169_main.o
  STUBCPY drivers/firmware/efi/libstub/lib-cmdline.stub.o
  CC      drivers/net/ethernet/realtek/r8169_firmware.o
  CC      drivers/md/dm-zero.o
  STUBCPY drivers/firmware/efi/libstub/lib-ctype.stub.o
  CC      arch/x86/kernel/module.o
  STUBCPY drivers/firmware/efi/libstub/mem.stub.o
  STUBCPY drivers/firmware/efi/libstub/pci.stub.o
  STUBCPY drivers/firmware/efi/libstub/printk.stub.o
  STUBCPY drivers/firmware/efi/libstub/random.stub.o
  CC [M]  drivers/gpu/drm/xe/xe_pm.o
  STUBCPY drivers/firmware/efi/libstub/randomalloc.stub.o
  STUBCPY drivers/firmware/efi/libstub/relocate.stub.o
  CC [M]  drivers/gpu/drm/xe/xe_preempt_fence.o
  STUBCPY drivers/firmware/efi/libstub/secureboot.stub.o
  STUBCPY drivers/firmware/efi/libstub/skip_spaces.stub.o
  STUBCPY drivers/firmware/efi/libstub/tpm.stub.o
  AR      drivers/cpufreq/built-in.a
  STUBCPY drivers/firmware/efi/libstub/vsprintf.stub.o
  STUBCPY drivers/firmware/efi/libstub/x86-stub.stub.o
  CC      drivers/gpu/drm/i915/gt/intel_gtt.o
  AR      drivers/firmware/xilinx/built-in.a
  AR      drivers/firmware/efi/libstub/lib.a
  CC      drivers/usb/host/xhci-debugfs.o
  AR      drivers/net/ethernet/sis/built-in.a
  AR      drivers/net/ethernet/sfc/built-in.a
  AR      drivers/net/ethernet/smsc/built-in.a
  AR      drivers/net/ethernet/socionext/built-in.a
  CC      drivers/hid/hid-microsoft.o
  CC      drivers/gpu/drm/drm_damage_helper.o
  CC      drivers/hid/hid-monterey.o
  AR      drivers/net/ethernet/stmicro/built-in.a
  CC      drivers/gpu/drm/drm_encoder_slave.o
  AR      drivers/net/ethernet/sun/built-in.a
  CC      drivers/gpu/drm/drm_flip_work.o
  CC      arch/x86/kernel/doublefault_32.o
  CC      arch/x86/kernel/early_printk.o
  CC      drivers/usb/host/xhci-pci.o
  AR      drivers/net/ethernet/tehuti/built-in.a
  CC      drivers/firmware/dmi_scan.o
  CC      drivers/hid/hid-ntrig.o
  AR      drivers/net/ethernet/ti/built-in.a
  CC      drivers/gpu/drm/drm_format_helper.o
  CC      drivers/hid/hid-pl.o
  CC      drivers/gpu/drm/drm_gem_atomic_helper.o
  CC      drivers/net/ethernet/realtek/r8169_phy_config.o
  AR      drivers/net/ethernet/vertexcom/built-in.a
  CC      drivers/gpu/drm/drm_gem_framebuffer_helper.o
  CC      drivers/gpu/drm/drm_kms_helper_common.o
  CC      arch/x86/kernel/hpet.o
  CC [M]  drivers/gpu/drm/xe/xe_pt.o
  CC      drivers/hid/hid-petalynx.o
  AR      drivers/firmware/efi/built-in.a
  CC      drivers/firmware/dmi-id.o
  CC      drivers/firmware/memmap.o
  CC [M]  drivers/gpu/drm/xe/xe_pt_walk.o
  AR      drivers/net/ethernet/via/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_query.o
  CC [M]  drivers/gpu/drm/xe/xe_range_fence.o
  AR      drivers/net/ethernet/wangxun/built-in.a
  AR      drivers/net/ethernet/wiznet/built-in.a
  CC      drivers/hid/hid-redragon.o
  CC      arch/x86/kernel/amd_nb.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_sr.o
  AR      drivers/net/ethernet/xilinx/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_llc.o
  AR      drivers/net/ethernet/xircom/built-in.a
  CC      drivers/hid/hid-samsung.o
  CC      drivers/gpu/drm/i915/gt/intel_lrc.o
  CC      drivers/gpu/drm/drm_modeset_helper.o
  AR      drivers/net/ethernet/synopsys/built-in.a
  AR      drivers/net/ethernet/marvell/built-in.a
  CC      drivers/gpu/drm/drm_plane_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_whitelist.o
  AR      drivers/net/ethernet/pensando/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_rtp.o
  CC      drivers/gpu/drm/drm_probe_helper.o
  CC      arch/x86/kernel/kvm.o
  CC      drivers/gpu/drm/drm_rect.o
  CC [M]  drivers/gpu/drm/xe/xe_ring_ops.o
  AR      drivers/md/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_sa.o
  CC      drivers/gpu/drm/drm_self_refresh_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_sched_job.o
  CC [M]  drivers/gpu/drm/xe/xe_step.o
  CC      drivers/gpu/drm/drm_simple_kms_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_sync.o
  CC      drivers/gpu/drm/bridge/panel.o
  CC      drivers/hid/hid-sony.o
  CC      drivers/gpu/drm/drm_mipi_dsi.o
  CC [M]  drivers/gpu/drm/xe/xe_tile.o
  CC      drivers/gpu/drm/i915/gt/intel_migrate.o
  CC      drivers/gpu/drm/i915/gt/intel_mocs.o
  CC      drivers/hid/hid-sunplus.o
  CC [M]  drivers/gpu/drm/xe/xe_tile_sysfs.o
  CC      drivers/gpu/drm/i915/gt/intel_ppgtt.o
  CC      drivers/gpu/drm/i915/gt/intel_rc6.o
  CC      arch/x86/kernel/kvmclock.o
  CC      drivers/hid/hid-topseed.o
  CC [M]  drivers/gpu/drm/drm_exec.o
  CC [M]  drivers/gpu/drm/drm_gpuvm.o
  CC      drivers/gpu/drm/i915/gt/intel_region_lmem.o
  CC      drivers/gpu/drm/i915/gt/intel_renderstate.o
  CC [M]  drivers/gpu/drm/xe/xe_trace.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_sys_mgr.o
  AR      drivers/firmware/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_vram_mgr.o
  CC [M]  drivers/gpu/drm/xe/xe_tuning.o
  CC      arch/x86/kernel/paravirt.o
  CC [M]  drivers/gpu/drm/drm_suballoc.o
  CC [M]  drivers/gpu/drm/drm_gem_ttm_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_uc.o
  CC [M]  drivers/gpu/drm/xe/xe_uc_debugfs.o
  CC      drivers/gpu/drm/i915/gt/intel_reset.o
  CC      drivers/gpu/drm/i915/gt/intel_ring.o
  CC [M]  drivers/gpu/drm/xe/xe_uc_fw.o
  CC      drivers/gpu/drm/i915/gt/intel_ring_submission.o
  CC [M]  drivers/gpu/drm/xe/xe_vm.o
  CC      drivers/gpu/drm/i915/gt/intel_rps.o
  CC [M]  drivers/gpu/drm/xe/xe_vram_freq.o
  CC      arch/x86/kernel/pvclock.o
  CC [M]  drivers/gpu/drm/xe/xe_wait_user_fence.o
  CC [M]  drivers/gpu/drm/xe/xe_wa.o
  CC      arch/x86/kernel/pcspeaker.o
  CC      drivers/gpu/drm/i915/gt/intel_sa_media.o
  CC      arch/x86/kernel/check.o
  CC [M]  drivers/gpu/drm/xe/xe_wopcm.o
  CC [M]  drivers/gpu/drm/xe/xe_hmm.o
  CC [M]  drivers/gpu/drm/xe/xe_hwmon.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_relay.o
  CC [M]  drivers/gpu/drm/xe/xe_memirq.o
  AR      drivers/usb/host/built-in.a
  AR      drivers/usb/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_sriov.o
  CC      drivers/gpu/drm/i915/gt/intel_sseu.o
  CC      drivers/gpu/drm/i915/gt/intel_sseu_debugfs.o
  CC      drivers/gpu/drm/i915/gt/intel_timeline.o
  AR      drivers/net/ethernet/nvidia/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_tlb.o
  CC      arch/x86/kernel/uprobes.o
  CC      arch/x86/kernel/perf_regs.o
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_irq.o
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_utils.o
  CC      drivers/gpu/drm/i915/gt/intel_wopcm.o
  LD [M]  drivers/gpu/drm/drm_ttm_helper.o
  CC      arch/x86/kernel/tracepoint.o
  CC [M]  drivers/gpu/drm/xe/display/intel_fb_bo.o
  CC      arch/x86/kernel/itmt.o
  CC [M]  drivers/gpu/drm/xe/display/intel_fbdev_fb.o
  CC      drivers/gpu/drm/i915/gt/intel_workarounds.o
  AR      drivers/hid/built-in.a
  CC      drivers/gpu/drm/i915/gt/shmem_utils.o
  CC      drivers/gpu/drm/i915/gt/sysfs_engines.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_misc.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_rps.o
  CC      arch/x86/kernel/umip.o
  CC      drivers/gpu/drm/i915/gt/intel_ggtt_gmch.o
  CC [M]  drivers/gpu/drm/xe/display/xe_dsb_buffer.o
  CC      arch/x86/kernel/unwind_frame.o
  CC      drivers/gpu/drm/i915/gt/gen6_renderstate.o
  CC [M]  drivers/gpu/drm/xe/display/xe_fb_pin.o
  CC [M]  drivers/gpu/drm/xe/display/xe_hdcp_gsc.o
  CC      drivers/gpu/drm/i915/gt/gen7_renderstate.o
  CC [M]  drivers/gpu/drm/xe/display/xe_plane_initial.o
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_dram.o
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_pch.o
  LD [M]  drivers/gpu/drm/drm_suballoc_helper.o
  CC [M]  drivers/gpu/drm/xe/i915-display/icl_dsi.o
  CC      drivers/gpu/drm/i915/gt/gen8_renderstate.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic.o
  CC      drivers/gpu/drm/i915/gt/gen9_renderstate.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic_plane.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_audio.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_busy.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_clflush.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_context.o
  AR      drivers/net/ethernet/realtek/built-in.a
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_backlight.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bios.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_create.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bw.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_dmabuf.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_domain.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cdclk.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_color.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_combo_phy.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_connector.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_internal.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_lmem.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_mman.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_object.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_pages.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_phys.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc_state_dump.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cursor.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cx0_phy.o
  AR      arch/x86/kernel/built-in.a
  AR      drivers/net/ethernet/intel/e1000e/built-in.a
  AR      arch/x86/built-in.a
  AR      drivers/net/ethernet/intel/built-in.a
  CC      drivers/gpu/drm/i915/gem/i915_gem_pm.o
  AR      drivers/net/ethernet/built-in.a
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi_buf_trans.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_region.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_shmem.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_shrinker.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_stolen.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_device.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_throttle.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_driver.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_irq.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_params.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power.o
  AR      drivers/net/built-in.a
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_map.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_well.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_tiling.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_trace.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_ttm.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_ttm_move.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_userptr.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_wait.o
  CC      drivers/gpu/drm/i915/gem/i915_gemfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_wa.o
  CC      drivers/gpu/drm/i915/i915_active.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dkl_phy.o
  CC      drivers/gpu/drm/i915/i915_cmd_parser.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dmc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp.o
  CC      drivers/gpu/drm/i915/i915_deps.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_aux.o
  CC      drivers/gpu/drm/i915/i915_gem.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_aux_backlight.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_hdcp.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_link_training.o
  CC      drivers/gpu/drm/i915/i915_gem_evict.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_mst.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpll.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpll_mgr.o
  CC      drivers/gpu/drm/i915/i915_gem_gtt.o
  CC      drivers/gpu/drm/i915/i915_gem_ww.o
  CC      drivers/gpu/drm/i915/i915_query.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpt_common.o
  CC      drivers/gpu/drm/i915/i915_request.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_drrs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsb.o
  CC      drivers/gpu/drm/i915/i915_scheduler.o
  CC      drivers/gpu/drm/i915/i915_trace_points.o
  CC      drivers/gpu/drm/i915/i915_ttm_buddy_manager.o
  CC      drivers/gpu/drm/i915/i915_vma.o
  CC      drivers/gpu/drm/i915/i915_vma_resource.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_dcs_backlight.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_vbt.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fb.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_ads.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fbc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fdi.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_capture.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fifo_underrun.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_frontbuffer.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_global_state.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_gmbus.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_ct.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdcp.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_fw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdcp_gsc_message.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdmi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hotplug.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hotplug_irq.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_log.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hti.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_rc.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_submission.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_huc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_link_bw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_lspcon.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_lock.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_huc_fw.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_uc.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_uc_fw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_setup.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_verify.o
  CC      drivers/gpu/drm/i915/gt/intel_gsc.o
  CC      drivers/gpu/drm/i915/i915_hwmon.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_panel.o
  CC      drivers/gpu/drm/i915/display/hsw_ips.o
  CC      drivers/gpu/drm/i915/display/i9xx_plane.o
  CC      drivers/gpu/drm/i915/display/i9xx_wm.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pmdemand.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pps.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_psr.o
  CC      drivers/gpu/drm/i915/display/intel_atomic.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_qp_tables.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_quirks.o
  CC      drivers/gpu/drm/i915/display/intel_atomic_plane.o
  CC      drivers/gpu/drm/i915/display/intel_audio.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_snps_phy.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_tc.o
  CC      drivers/gpu/drm/i915/display/intel_bios.o
  CC      drivers/gpu/drm/i915/display/intel_bw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vblank.o
  CC      drivers/gpu/drm/i915/display/intel_cdclk.o
  CC      drivers/gpu/drm/i915/display/intel_color.o
  CC      drivers/gpu/drm/i915/display/intel_combo_phy.o
  CC      drivers/gpu/drm/i915/display/intel_connector.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vdsc.o
  CC      drivers/gpu/drm/i915/display/intel_crtc.o
  CC      drivers/gpu/drm/i915/display/intel_crtc_state_dump.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vga.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vrr.o
  CC      drivers/gpu/drm/i915/display/intel_cursor.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dmc_wl.o
  CC      drivers/gpu/drm/i915/display/intel_display.o
  CC      drivers/gpu/drm/i915/display/intel_display_driver.o
  CC      drivers/gpu/drm/i915/display/intel_display_irq.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_wm.o
  CC      drivers/gpu/drm/i915/display/intel_display_params.o
  CC      drivers/gpu/drm/i915/display/intel_display_power.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_scaler.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_universal_plane.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_watermark.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_acpi.o
  CC      drivers/gpu/drm/i915/display/intel_display_power_map.o
  CC      drivers/gpu/drm/i915/display/intel_display_power_well.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_opregion.o
  CC      drivers/gpu/drm/i915/display/intel_display_reset.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs_params.o
  CC      drivers/gpu/drm/i915/display/intel_display_rps.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pipe_crc.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc.o
  CC      drivers/gpu/drm/i915/display/intel_display_wa.o
  CC [M]  drivers/gpu/drm/xe/xe_guc.o
  CC      drivers/gpu/drm/i915/display/intel_dmc.o
  CC      drivers/gpu/drm/i915/display/intel_dmc_wl.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_ads.o
  CC      drivers/gpu/drm/i915/display/intel_dpio_phy.o
  CC      drivers/gpu/drm/i915/display/intel_dpll.o
  CC      drivers/gpu/drm/i915/display/intel_dpll_mgr.o
  CC      drivers/gpu/drm/i915/display/intel_dpt.o
  CC      drivers/gpu/drm/i915/display/intel_dpt_common.o
  CC      drivers/gpu/drm/i915/display/intel_drrs.o
  CC      drivers/gpu/drm/i915/display/intel_dsb.o
  CC      drivers/gpu/drm/i915/display/intel_dsb_buffer.o
  CC      drivers/gpu/drm/i915/display/intel_fb.o
  CC      drivers/gpu/drm/i915/display/intel_fb_bo.o
  CC      drivers/gpu/drm/i915/display/intel_fb_pin.o
  CC      drivers/gpu/drm/i915/display/intel_fbc.o
  CC      drivers/gpu/drm/i915/display/intel_fdi.o
  CC      drivers/gpu/drm/i915/display/intel_fifo_underrun.o
  CC      drivers/gpu/drm/i915/display/intel_frontbuffer.o
  CC      drivers/gpu/drm/i915/display/intel_global_state.o
  CC      drivers/gpu/drm/i915/display/intel_hdcp.o
  CC      drivers/gpu/drm/i915/display/intel_hdcp_gsc.o
  CC      drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.o
  CC      drivers/gpu/drm/i915/display/intel_hotplug.o
  CC      drivers/gpu/drm/i915/display/intel_hotplug_irq.o
  CC      drivers/gpu/drm/i915/display/intel_hti.o
  CC      drivers/gpu/drm/i915/display/intel_link_bw.o
  CC      drivers/gpu/drm/i915/display/intel_load_detect.o
  CC      drivers/gpu/drm/i915/display/intel_lpe_audio.o
  CC      drivers/gpu/drm/i915/display/intel_modeset_lock.o
  CC      drivers/gpu/drm/i915/display/intel_modeset_setup.o
  CC      drivers/gpu/drm/i915/display/intel_modeset_verify.o
  CC      drivers/gpu/drm/i915/display/intel_overlay.o
  CC      drivers/gpu/drm/i915/display/intel_pch_display.o
  CC      drivers/gpu/drm/i915/display/intel_pch_refclk.o
  CC      drivers/gpu/drm/i915/display/intel_plane_initial.o
  CC      drivers/gpu/drm/i915/display/intel_pmdemand.o
  CC      drivers/gpu/drm/i915/display/intel_psr.o
  CC      drivers/gpu/drm/i915/display/intel_quirks.o
  CC      drivers/gpu/drm/i915/display/intel_sprite.o
  CC      drivers/gpu/drm/i915/display/intel_sprite_uapi.o
  CC      drivers/gpu/drm/i915/display/intel_tc.o
  CC      drivers/gpu/drm/i915/display/intel_vblank.o
  CC      drivers/gpu/drm/i915/display/intel_vga.o
  CC      drivers/gpu/drm/i915/display/intel_wm.o
  CC      drivers/gpu/drm/i915/display/skl_scaler.o
  CC      drivers/gpu/drm/i915/display/skl_universal_plane.o
  CC      drivers/gpu/drm/i915/display/skl_watermark.o
  CC      drivers/gpu/drm/i915/display/intel_acpi.o
  CC      drivers/gpu/drm/i915/display/intel_opregion.o
  CC      drivers/gpu/drm/i915/display/intel_display_debugfs.o
  CC      drivers/gpu/drm/i915/display/intel_display_debugfs_params.o
  CC      drivers/gpu/drm/i915/display/intel_pipe_crc.o
  CC      drivers/gpu/drm/i915/display/dvo_ch7017.o
  CC      drivers/gpu/drm/i915/display/dvo_ch7xxx.o
  CC      drivers/gpu/drm/i915/display/dvo_ivch.o
  CC      drivers/gpu/drm/i915/display/dvo_ns2501.o
  CC      drivers/gpu/drm/i915/display/dvo_sil164.o
  CC      drivers/gpu/drm/i915/display/dvo_tfp410.o
  CC      drivers/gpu/drm/i915/display/g4x_dp.o
  CC      drivers/gpu/drm/i915/display/g4x_hdmi.o
  CC      drivers/gpu/drm/i915/display/icl_dsi.o
  CC      drivers/gpu/drm/i915/display/intel_backlight.o
  CC      drivers/gpu/drm/i915/display/intel_crt.o
  CC      drivers/gpu/drm/i915/display/intel_cx0_phy.o
  CC      drivers/gpu/drm/i915/display/intel_ddi.o
  CC      drivers/gpu/drm/i915/display/intel_ddi_buf_trans.o
  CC      drivers/gpu/drm/i915/display/intel_display_device.o
  CC      drivers/gpu/drm/i915/display/intel_display_trace.o
  CC      drivers/gpu/drm/i915/display/intel_dkl_phy.o
  LD [M]  drivers/gpu/drm/xe/xe.o
  CC      drivers/gpu/drm/i915/display/intel_dp.o
  CC      drivers/gpu/drm/i915/display/intel_dp_aux.o
  CC      drivers/gpu/drm/i915/display/intel_dp_aux_backlight.o
  CC      drivers/gpu/drm/i915/display/intel_dp_hdcp.o
  CC      drivers/gpu/drm/i915/display/intel_dp_link_training.o
  CC      drivers/gpu/drm/i915/display/intel_dp_mst.o
  CC      drivers/gpu/drm/i915/display/intel_dsi.o
  CC      drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.o
  CC      drivers/gpu/drm/i915/display/intel_dsi_vbt.o
  CC      drivers/gpu/drm/i915/display/intel_dvo.o
  CC      drivers/gpu/drm/i915/display/intel_gmbus.o
  CC      drivers/gpu/drm/i915/display/intel_hdmi.o
  CC      drivers/gpu/drm/i915/display/intel_lspcon.o
  CC      drivers/gpu/drm/i915/display/intel_lvds.o
  CC      drivers/gpu/drm/i915/display/intel_panel.o
  CC      drivers/gpu/drm/i915/display/intel_pps.o
  CC      drivers/gpu/drm/i915/display/intel_qp_tables.o
  CC      drivers/gpu/drm/i915/display/intel_sdvo.o
  CC      drivers/gpu/drm/i915/display/intel_snps_phy.o
  CC      drivers/gpu/drm/i915/display/intel_tv.o
  CC      drivers/gpu/drm/i915/display/intel_vdsc.o
  CC      drivers/gpu/drm/i915/display/intel_vrr.o
  CC      drivers/gpu/drm/i915/display/vlv_dsi.o
  CC      drivers/gpu/drm/i915/display/vlv_dsi_pll.o
  CC      drivers/gpu/drm/i915/i915_perf.o
  CC      drivers/gpu/drm/i915/pxp/intel_pxp.o
  CC      drivers/gpu/drm/i915/pxp/intel_pxp_huc.o
  CC      drivers/gpu/drm/i915/pxp/intel_pxp_tee.o
  CC      drivers/gpu/drm/i915/i915_gpu_error.o
  CC      drivers/gpu/drm/i915/i915_vgpu.o
  AR      drivers/gpu/drm/i915/built-in.a
  AR      drivers/gpu/drm/built-in.a
  AR      drivers/gpu/built-in.a
  AR      drivers/built-in.a
  AR      built-in.a
  AR      vmlinux.a
  LD      vmlinux.o
  OBJCOPY modules.builtin.modinfo
  GEN     modules.builtin
  MODPOST Module.symvers
  CC      .vmlinux.export.o
  CC [M]  fs/efivarfs/efivarfs.mod.o
  CC [M]  drivers/gpu/drm/drm_exec.mod.o
  CC [M]  drivers/gpu/drm/drm_gpuvm.mod.o
  CC [M]  drivers/gpu/drm/drm_suballoc_helper.mod.o
  CC [M]  drivers/gpu/drm/drm_ttm_helper.mod.o
  CC [M]  drivers/gpu/drm/scheduler/gpu-sched.mod.o
  CC [M]  drivers/gpu/drm/xe/xe.mod.o
  CC [M]  drivers/thermal/intel/x86_pkg_temp_thermal.mod.o
  CC [M]  sound/core/snd-hwdep.mod.o
  CC [M]  sound/core/snd-pcm.mod.o
  CC [M]  sound/pci/hda/snd-hda-codec.mod.o
  CC [M]  sound/pci/hda/snd-hda-codec-hdmi.mod.o
  CC [M]  sound/pci/hda/snd-hda-intel.mod.o
  CC [M]  sound/hda/snd-hda-core.mod.o
  CC [M]  sound/hda/snd-intel-dspcfg.mod.o
  CC [M]  sound/hda/snd-intel-sdw-acpi.mod.o
  CC [M]  net/netfilter/nf_log_syslog.mod.o
  CC [M]  net/netfilter/xt_mark.mod.o
  CC [M]  net/netfilter/xt_nat.mod.o
  CC [M]  net/netfilter/xt_LOG.mod.o
  CC [M]  net/netfilter/xt_MASQUERADE.mod.o
  CC [M]  net/netfilter/xt_addrtype.mod.o
  CC [M]  net/ipv4/netfilter/iptable_nat.mod.o
  LD [M]  fs/efivarfs/efivarfs.ko
  LD [M]  sound/core/snd-pcm.ko
  LD [M]  net/netfilter/xt_LOG.ko
  LD [M]  sound/hda/snd-intel-dspcfg.ko
  LD [M]  sound/pci/hda/snd-hda-intel.ko
  LD [M]  sound/pci/hda/snd-hda-codec-hdmi.ko
  LD [M]  net/netfilter/xt_MASQUERADE.ko
  LD [M]  net/netfilter/xt_addrtype.ko
  LD [M]  drivers/gpu/drm/drm_gpuvm.ko
  LD [M]  drivers/gpu/drm/drm_suballoc_helper.ko
  LD [M]  net/netfilter/xt_mark.ko
  LD [M]  sound/pci/hda/snd-hda-codec.ko
  LD [M]  net/netfilter/nf_log_syslog.ko
  LD [M]  net/netfilter/xt_nat.ko
  LD [M]  drivers/gpu/drm/scheduler/gpu-sched.ko
  LD [M]  net/ipv4/netfilter/iptable_nat.ko
  LD [M]  sound/core/snd-hwdep.ko
  LD [M]  drivers/gpu/drm/drm_exec.ko
  LD [M]  sound/hda/snd-intel-sdw-acpi.ko
  LD [M]  drivers/gpu/drm/drm_ttm_helper.ko
  LD [M]  drivers/gpu/drm/xe/xe.ko
  LD [M]  drivers/thermal/intel/x86_pkg_temp_thermal.ko
  LD [M]  sound/hda/snd-hda-core.ko
  UPD     include/generated/utsversion.h
  CC      init/version-timestamp.o
  LD      .tmp_vmlinux.kallsyms1
  NM      .tmp_vmlinux.kallsyms1.syms
  KSYMS   .tmp_vmlinux.kallsyms1.S
  AS      .tmp_vmlinux.kallsyms1.S
  LD      .tmp_vmlinux.kallsyms2
  NM      .tmp_vmlinux.kallsyms2.syms
  KSYMS   .tmp_vmlinux.kallsyms2.S
  AS      .tmp_vmlinux.kallsyms2.S
  LD      vmlinux
  NM      System.map
  SORTTAB vmlinux
  RELOCS  arch/x86/boot/compressed/vmlinux.relocs
  RSTRIP  vmlinux
  CC      arch/x86/boot/a20.o
  AS      arch/x86/boot/bioscall.o
  CC      arch/x86/boot/cmdline.o
  AS      arch/x86/boot/copy.o
  HOSTCC  arch/x86/boot/mkcpustr
  CC      arch/x86/boot/cpuflags.o
  CC      arch/x86/boot/cpucheck.o
  CC      arch/x86/boot/early_serial_console.o
  CC      arch/x86/boot/edd.o
  CC      arch/x86/boot/main.o
  CC      arch/x86/boot/memory.o
  CC      arch/x86/boot/pm.o
  AS      arch/x86/boot/pmjump.o
  CC      arch/x86/boot/printf.o
  CC      arch/x86/boot/regs.o
  CC      arch/x86/boot/string.o
  CC      arch/x86/boot/tty.o
  CC      arch/x86/boot/video.o
  CC      arch/x86/boot/video-mode.o
  CC      arch/x86/boot/version.o
  CC      arch/x86/boot/video-vga.o
  CC      arch/x86/boot/video-vesa.o
  CC      arch/x86/boot/video-bios.o
  HOSTCC  arch/x86/boot/tools/build
  CPUSTR  arch/x86/boot/cpustr.h
  CC      arch/x86/boot/cpu.o
  LDS     arch/x86/boot/compressed/vmlinux.lds
  AS      arch/x86/boot/compressed/kernel_info.o
  AS      arch/x86/boot/compressed/head_32.o
  VOFFSET arch/x86/boot/compressed/../voffset.h
  CC      arch/x86/boot/compressed/string.o
  CC      arch/x86/boot/compressed/cmdline.o
  CC      arch/x86/boot/compressed/error.o
  OBJCOPY arch/x86/boot/compressed/vmlinux.bin
  HOSTCC  arch/x86/boot/compressed/mkpiggy
  CC      arch/x86/boot/compressed/cpuflags.o
  CC      arch/x86/boot/compressed/early_serial_console.o
  CC      arch/x86/boot/compressed/kaslr.o
  CC      arch/x86/boot/compressed/acpi.o
  CC      arch/x86/boot/compressed/efi.o
  GZIP    arch/x86/boot/compressed/vmlinux.bin.gz
  CC      arch/x86/boot/compressed/misc.o
  MKPIGGY arch/x86/boot/compressed/piggy.S
  AS      arch/x86/boot/compressed/piggy.o
  LD      arch/x86/boot/compressed/vmlinux
  ZOFFSET arch/x86/boot/zoffset.h
  OBJCOPY arch/x86/boot/vmlinux.bin
  AS      arch/x86/boot/header.o
  LD      arch/x86/boot/setup.elf
  OBJCOPY arch/x86/boot/setup.bin
  BUILD   arch/x86/boot/bzImage
Kernel: arch/x86/boot/bzImage is ready  (#1)
run-parts: executing /workspace/ci/hooks/20-kernel-doc
+ SRC_DIR=/workspace/kernel
+ cd /workspace/kernel
+ find drivers/gpu/drm/xe/ -name '*.[ch]' -not -path 'drivers/gpu/drm/xe/display/*'
+ xargs ./scripts/kernel-doc -Werror -none include/uapi/drm/xe_drm.h
All hooks done


