Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42988C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 15:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C7711A514;
	Thu, 25 Apr 2024 15:03:01 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE3D11A512;
 Thu, 25 Apr 2024 15:03:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_series_starting_with_=5B1/2=5D?=
 =?utf-8?q?_drm/xe/pf=3A_Re-initialize_SR-IOV_specific_HW_settings?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Apr 2024 15:03:01 -0000
Message-ID: <171405738105.1667639.14161793264380045561@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240425143927.2265-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240425143927.2265-1-michal.wajdeczko@intel.com>
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

Series: series starting with [1/2] drm/xe/pf: Re-initialize SR-IOV specific HW settings
URL   : https://patchwork.freedesktop.org/series/132916/
State : failure

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
+ export
+ grep -Ei '(^|\W)CI_'
run-parts: executing /workspace/ci/hooks/10-build-W1
declare -x CI_KERNEL_BUILD_DIR="/workspace/kernel/build64-default"
declare -x CI_KERNEL_SRC_DIR="/workspace/kernel"
declare -x CI_TOOLS_SRC_DIR="/workspace/ci"
declare -x CI_WORKSPACE_DIR="/workspace"
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
  UPD     include/generated/utsrelease.h
  UPD     include/generated/compile.h
mkdir -p /workspace/kernel/build64-default/tools/objtool && make O=/workspace/kernel/build64-default subdir=tools/objtool --no-print-directory -C objtool 
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
  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/special.o
  CC      /workspace/kernel/build64-default/tools/objtool/special.o
  CC      /workspace/kernel/build64-default/tools/objtool/builtin-check.o
  CC      /workspace/kernel/build64-default/tools/objtool/elf.o
  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/decode.o
  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/orc.o
  CC      /workspace/kernel/build64-default/tools/objtool/objtool.o
  CC      /workspace/kernel/build64-default/tools/objtool/orc_gen.o
  CC      /workspace/kernel/build64-default/tools/objtool/orc_dump.o
  CC      /workspace/kernel/build64-default/tools/objtool/libstring.o
  CC      /workspace/kernel/build64-default/tools/objtool/libctype.o
  CC      /workspace/kernel/build64-default/tools/objtool/str_error_r.o
  CC      /workspace/kernel/build64-default/tools/objtool/librbtree.o
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
  GEN     xe_wa_oob.c xe_wa_oob.h
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
  CC [M]  drivers/gpu/drm/xe/xe_range_fence.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_sr.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_whitelist.o
  CC [M]  drivers/gpu/drm/xe/xe_rtp.o
  CC [M]  drivers/gpu/drm/xe/xe_ring_ops.o
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
  CC [M]  drivers/gpu/drm/xe/tests/xe_live_test_mod.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_bo_test.o
  HDRTEST drivers/gpu/drm/xe/abi/gsc_proxy_commands_abi.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_dma_buf_test.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_klvs_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_migrate_test.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_mocs_test.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_test_mod.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_errors_abi.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_pci_test.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_rtp_test.o
  HDRTEST drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_relay_communication_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_communication_mmio_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_messages_abi.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_wa_test.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h
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
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mman.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gt/intel_rps.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_gt_types.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_active.h
  HDRTEST drivers/gpu/drm/xe/display/xe_display.h
  HDRTEST drivers/gpu/drm/xe/display/intel_fb_bo.h
  LD [M]  drivers/gpu/drm/xe/tests/xe_live_test.o
  HDRTEST drivers/gpu/drm/xe/display/intel_fbdev_fb.h
  HDRTEST drivers/gpu/drm/xe/instructions/xe_instr_defs.h
  HDRTEST drivers/gpu/drm/xe/instructions/xe_gfx_state_commands.h
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
  LD [M]  drivers/gpu/drm/xe/tests/xe_test.o
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
  HDRTEST drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
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
  HDRTEST drivers/gpu/drm/xe/xe_sa_types.h
  HDRTEST drivers/gpu/drm/xe/xe_sa.h
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
  LD [M]  drivers/gpu/drm/xe/xe.o
  MODPOST drivers/gpu/drm/xe/Module.symvers
  CC [M]  drivers/gpu/drm/xe/xe.mod.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_live_test.mod.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_test.mod.o
  LD [M]  drivers/gpu/drm/xe/tests/xe_test.ko
  LD [M]  drivers/gpu/drm/xe/xe.ko
  LD [M]  drivers/gpu/drm/xe/tests/xe_live_test.ko
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
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/x86/include/generated/uapi/asm/errno.h
  WRAP    arch/x86/include/generated/uapi/asm/fcntl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctls.h
  HOSTCC  arch/x86/tools/relocs_32.o
  WRAP    arch/x86/include/generated/uapi/asm/ipcbuf.h
  HOSTCC  arch/x86/tools/relocs_64.o
  HOSTCC  arch/x86/tools/relocs_common.o
  WRAP    arch/x86/include/generated/uapi/asm/param.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  WRAP    arch/x86/include/generated/uapi/asm/resource.h
  UPD     include/generated/uapi/linux/version.h
  WRAP    arch/x86/include/generated/uapi/asm/socket.h
  WRAP    arch/x86/include/generated/uapi/asm/sockios.h
  WRAP    arch/x86/include/generated/uapi/asm/termbits.h
  WRAP    arch/x86/include/generated/uapi/asm/termios.h
  WRAP    arch/x86/include/generated/uapi/asm/types.h
  UPD     include/generated/compile.h
  HOSTCC  scripts/kallsyms
  WRAP    arch/x86/include/generated/asm/early_ioremap.h
  HOSTCC  scripts/sorttable
  HOSTCC  scripts/asn1_compiler
  WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
  WRAP    arch/x86/include/generated/asm/irq_regs.h
  WRAP    arch/x86/include/generated/asm/kmap_size.h
  HOSTCC  scripts/selinux/mdp/mdp
  HOSTCC  scripts/selinux/genheaders/genheaders
  WRAP    arch/x86/include/generated/asm/local64.h
  WRAP    arch/x86/include/generated/asm/mmiowb.h
  WRAP    arch/x86/include/generated/asm/module.lds.h
  WRAP    arch/x86/include/generated/asm/rwonce.h
  WRAP    arch/x86/include/generated/asm/unaligned.h
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
  CC      init/main.o
  CC      init/do_mounts.o
  CC      init/do_mounts_initrd.o
  HOSTCC  usr/gen_init_cpio
  UPD     init/utsversion-tmp.h
  CC      init/initramfs.o
  CC      init/calibrate.o
  CC      init/init_task.o
  CC      certs/system_keyring.o
  CC      mm/filemap.o
  CC      ipc/util.o
  CC      arch/x86/realmode/init.o
  CC      mm/mempool.o
  CC      init/version.o
  CC      ipc/msgutil.o
  CC      mm/oom_kill.o
  AS      arch/x86/entry/entry.o
  CC      arch/x86/events/amd/core.o
  AS      arch/x86/entry/entry_32.o
  CC      ipc/msg.o
  CC      arch/x86/events/amd/lbr.o
  AR      arch/x86/entry/vsyscall/built-in.a
  CC      security/commoncap.o
  CC      mm/fadvise.o
  CC      security/keys/gc.o
  GEN     security/selinux/flask.h security/selinux/av_permissions.h
  AS      arch/x86/realmode/rm/header.o
  CC      fs/nfs_common/nfsacl.o
  CC      io_uring/io_uring.o
  CC      fs/notify/inotify/inotify_fsnotify.o
  CC      fs/notify/dnotify/dnotify.o
  CC      arch/x86/events/intel/core.o
  CC      fs/iomap/trace.o
  CC      fs/quota/dquot.o
  AR      arch/x86/crypto/built-in.a
  CC      security/integrity/iint.o
  AS      arch/x86/lib/atomic64_cx8_32.o
  CC      arch/x86/events/zhaoxin/core.o
  CC      arch/x86/entry/vdso/vma.o
  CC      arch/x86/mm/pat/set_memory.o
  CC      arch/x86/kernel/fpu/init.o
  CC      block/partitions/core.o
  CC      fs/proc/task_mmu.o
  CC      security/selinux/avc.o
  AR      arch/x86/platform/atom/built-in.a
  AR      drivers/cache/built-in.a
  AS      arch/x86/realmode/rm/trampoline_32.o
  CC      arch/x86/kernel/acpi/boot.o
  CC      arch/x86/kernel/cpu/mce/core.o
  AR      drivers/irqchip/built-in.a
  CC      lib/math/div64.o
  AR      drivers/bus/mhi/built-in.a
  AR      arch/x86/net/built-in.a
  AS      arch/x86/lib/checksum_32.o
  AS      arch/x86/realmode/rm/stack.o
  AR      arch/x86/platform/ce4100/built-in.a
  CC      kernel/sched/core.o
  AR      arch/x86/virt/svm/built-in.a
  CC      lib/math/gcd.o
  CC      security/integrity/integrity_audit.o
  AR      drivers/bus/built-in.a
  CC      arch/x86/platform/efi/memmap.o
  AS      arch/x86/realmode/rm/reboot.o
  CC      arch/x86/lib/cmdline.o
  AR      drivers/pwm/built-in.a
  AR      arch/x86/virt/vmx/built-in.a
  CC      crypto/asymmetric_keys/asymmetric_type.o
  AS      arch/x86/realmode/rm/wakeup_asm.o
  AR      arch/x86/virt/built-in.a
  CC      lib/math/lcm.o
  CC      arch/x86/entry/vdso/extable.o
  CC      drivers/pci/msi/pcidev_msi.o
  CC      drivers/pci/msi/api.o
  CC      arch/x86/realmode/rm/wakemain.o
  CC      arch/x86/kernel/cpu/mtrr/mtrr.o
  CC      lib/math/int_log.o
  AS      arch/x86/lib/cmpxchg8b_emu.o
  GEN     usr/initramfs_data.cpio
  CC      kernel/sched/fair.o
  CC      arch/x86/lib/cpu.o
  CC      arch/x86/realmode/rm/video-mode.o
  CC      lib/math/int_pow.o
  COPY    usr/initramfs_inc_data
  CC      arch/x86/kernel/fpu/bugs.o
  CC      lib/crypto/mpi/generic_mpih-lshift.o
  AS      usr/initramfs_data.o
  CC      lib/zlib_inflate/inffast.o
  CC      lib/math/int_sqrt.o
  HOSTCC  certs/extract-cert
  AR      usr/built-in.a
  CC      lib/math/reciprocal_div.o
  AS      arch/x86/realmode/rm/copy.o
  CC      arch/x86/kernel/fpu/core.o
  CC      kernel/sched/build_policy.o
  AS      arch/x86/realmode/rm/bioscall.o
  CC      arch/x86/realmode/rm/regs.o
  CC      lib/math/rational.o
  CC      arch/x86/realmode/rm/video-vga.o
  CC      lib/zlib_deflate/deflate.o
  CC      fs/notify/inotify/inotify_user.o
  CC      lib/zlib_inflate/inflate.o
  CC      block/partitions/msdos.o
  CC      lib/zlib_deflate/deftree.o
  CC      arch/x86/realmode/rm/video-vesa.o
  CERT    certs/x509_certificate_list
  CC      mm/maccess.o
  CC      arch/x86/platform/efi/quirks.o
  CERT    certs/signing_key.x509
  CC      lib/zlib_deflate/deflate_syms.o
  AS      certs/system_certificates.o
  CC      arch/x86/events/core.o
  CC      arch/x86/realmode/rm/video-bios.o
  CC      fs/nfs_common/grace.o
  LDS     arch/x86/entry/vdso/vdso32/vdso32.lds
  CC      lib/crypto/mpi/generic_mpih-mul1.o
  CC      arch/x86/kernel/fpu/regset.o
  CC      drivers/pci/msi/msi.o
  AS      arch/x86/entry/vdso/vdso32/note.o
  AR      arch/x86/events/zhaoxin/built-in.a
  AR      certs/built-in.a
  AR      init/built-in.a
  CC      arch/x86/kernel/acpi/sleep.o
  AS      arch/x86/kernel/acpi/wakeup_32.o
  CC      security/keys/key.o
  AR      fs/notify/dnotify/built-in.a
  CC      lib/crypto/mpi/generic_mpih-mul2.o
  AS      arch/x86/entry/vdso/vdso32/system_call.o
  CC      arch/x86/kernel/fpu/signal.o
  CC      arch/x86/kernel/acpi/cstate.o
  CC      lib/crypto/mpi/generic_mpih-mul3.o
  AS      arch/x86/entry/vdso/vdso32/sigreturn.o
  CC      ipc/sem.o
  CC      arch/x86/entry/vdso/vdso32/vclock_gettime.o
  CC      ipc/shm.o
  CC      arch/x86/lib/delay.o
  PASYMS  arch/x86/realmode/rm/pasyms.h
  CC      drivers/video/console/dummycon.o
  CC      crypto/asymmetric_keys/restrict.o
  LDS     arch/x86/realmode/rm/realmode.lds
  AR      security/integrity/built-in.a
  CC      ipc/syscall.o
  LD      arch/x86/realmode/rm/realmode.elf
  CC      arch/x86/events/amd/ibs.o
  CC      lib/zlib_inflate/infutil.o
  RELOCS  arch/x86/realmode/rm/realmode.relocs
  OBJCOPY arch/x86/realmode/rm/realmode.bin
  AS      arch/x86/realmode/rmpiggy.o
  CC      io_uring/xattr.o
  CC      io_uring/nop.o
  AR      arch/x86/realmode/built-in.a
  CC      block/partitions/efi.o
  CC      fs/iomap/iter.o
  AS      arch/x86/lib/getuser.o
  CC      arch/x86/entry/syscall_32.o
  AR      lib/math/built-in.a
  CC      arch/x86/entry/common.o
  CC      arch/x86/kernel/apic/apic.o
  LDS     arch/x86/kernel/vmlinux.lds
  CC      arch/x86/kernel/kprobes/core.o
  GEN     arch/x86/lib/inat-tables.c
  CC      block/bdev.o
  CC      io_uring/fs.o
  CC      arch/x86/kernel/cpu/mtrr/if.o
  AR      lib/zlib_deflate/built-in.a
  AS      arch/x86/entry/thunk_32.o
  CC      arch/x86/kernel/kprobes/opt.o
  CC      arch/x86/lib/insn-eval.o
  CC      io_uring/splice.o
  CC      lib/crypto/memneq.o
  CC      arch/x86/platform/efi/efi.o
  CC      lib/zlib_inflate/inftrees.o
  CC      fs/proc/inode.o
  CC      lib/zlib_inflate/inflate_syms.o
  CC      lib/crypto/utils.o
  CC      lib/crypto/chacha.o
  CC      fs/quota/quota_v2.o
  CC      arch/x86/entry/vdso/vdso32/vgetcpu.o
  CC      security/selinux/hooks.o
  CC      drivers/pci/msi/irqdomain.o
  CC      crypto/asymmetric_keys/signature.o
  AR      fs/nfs_common/built-in.a
  CC      lib/crypto/mpi/generic_mpih-rshift.o
  CC      security/keys/keyring.o
  HOSTCC  arch/x86/entry/vdso/vdso2c
  CC      drivers/video/console/vgacon.o
  CC      security/keys/keyctl.o
  CC      arch/x86/kernel/cpu/mce/severity.o
  CC      arch/x86/entry/vdso/vdso32-setup.o
  CC      kernel/sched/build_utility.o
  CC      arch/x86/kernel/cpu/mce/genpool.o
  CC      security/keys/permission.o
  CC      arch/x86/mm/pat/memtype.o
  CC      drivers/video/backlight/backlight.o
  VDSO    arch/x86/entry/vdso/vdso32.so.dbg
  CC      arch/x86/kernel/apic/apic_common.o
  AR      lib/zlib_inflate/built-in.a
  CC      arch/x86/events/amd/uncore.o
  AR      arch/x86/kernel/acpi/built-in.a
  CC      ipc/ipc_sysctl.o
  CC      lib/lzo/lzo1x_compress.o
  CC      lib/lz4/lz4_decompress.o
  CC      arch/x86/kernel/cpu/mtrr/generic.o
  OBJCOPY arch/x86/entry/vdso/vdso32.so
  CC      lib/lzo/lzo1x_decompress_safe.o
  CC      security/lsm_syscalls.o
  VDSO2C  arch/x86/entry/vdso/vdso-image-32.c
  CC      security/min_addr.o
  CC      security/security.o
  CC      arch/x86/entry/vdso/vdso-image-32.o
  CC      crypto/asymmetric_keys/public_key.o
  AR      arch/x86/kernel/kprobes/built-in.a
  AR      fs/notify/inotify/built-in.a
  AR      drivers/idle/built-in.a
  CC      security/lsm_audit.o
  CC      fs/iomap/buffered-io.o
  CC      fs/quota/quota_tree.o
  AS      arch/x86/kernel/head_32.o
  AR      fs/notify/fanotify/built-in.a
  AR      block/partitions/built-in.a
  CC      fs/notify/fsnotify.o
  CC      arch/x86/kernel/fpu/xstate.o
  CC      block/fops.o
  CC      drivers/pci/pcie/portdrv.o
  CC      drivers/pci/hotplug/pci_hotplug_core.o
  CC      io_uring/sync.o
  CC      arch/x86/mm/pat/memtype_interval.o
  CC      fs/proc/root.o
  AR      drivers/pci/controller/dwc/built-in.a
  CC      arch/x86/lib/insn.o
  CC      arch/x86/events/intel/bts.o
  ASN.1   crypto/asymmetric_keys/x509.asn1.[ch]
  AR      drivers/pci/controller/mobiveil/built-in.a
  CC      arch/x86/kernel/apic/apic_noop.o
  ASN.1   crypto/asymmetric_keys/x509_akid.asn1.[ch]
  AR      arch/x86/entry/vdso/built-in.a
  CC      fs/notify/notification.o
  CC      lib/crypto/mpi/generic_mpih-sub1.o
  CC      drivers/pci/pcie/rcec.o
  CC      fs/quota/quota.o
  AR      drivers/pci/controller/built-in.a
  CC      ipc/mqueue.o
  AR      arch/x86/entry/built-in.a
  CC      arch/x86/platform/efi/efi_32.o
  CC      ipc/namespace.o
  CC      lib/crypto/mpi/generic_mpih-add1.o
  CC      arch/x86/kernel/head32.o
  CC      security/selinux/selinuxfs.o
  CC      arch/x86/kernel/cpu/mce/intel.o
  AR      drivers/pci/msi/built-in.a
  AR      lib/lzo/built-in.a
  AR      arch/x86/platform/geode/built-in.a
  AR      drivers/video/fbdev/core/built-in.a
  AR      arch/x86/platform/iris/built-in.a
  CC      security/device_cgroup.o
  CC      drivers/pci/pcie/aspm.o
  CC      arch/x86/platform/intel/iosf_mbi.o
  CC      drivers/video/aperture.o
  CC      drivers/video/cmdline.o
  CC      arch/x86/lib/kaslr.o
  AR      drivers/video/fbdev/omap/built-in.a
  CC      mm/page-writeback.o
  CC      lib/zstd/zstd_decompress_module.o
  CC      crypto/asymmetric_keys/x509_loader.o
  CC      drivers/video/nomodeset.o
  AR      drivers/video/fbdev/omap2/omapfb/dss/built-in.a
  AR      drivers/video/fbdev/omap2/omapfb/displays/built-in.a
  CC      drivers/video/hdmi.o
  AR      drivers/pci/switch/built-in.a
  CC      arch/x86/mm/init.o
  CC      security/keys/process_keys.o
  AR      drivers/video/fbdev/omap2/omapfb/built-in.a
  CC      kernel/locking/mutex.o
  CC      drivers/pci/hotplug/acpi_pcihp.o
  AR      drivers/video/fbdev/omap2/built-in.a
  AR      drivers/video/fbdev/built-in.a
  AR      drivers/video/backlight/built-in.a
  CC      crypto/asymmetric_keys/x509_public_key.o
  CC      arch/x86/lib/memcpy_32.o
  ASN.1   crypto/asymmetric_keys/pkcs7.asn1.[ch]
  CC      lib/crypto/mpi/ec.o
  CC      lib/crypto/aes.o
  CC      fs/notify/group.o
  CC      crypto/asymmetric_keys/pkcs7_trust.o
  AR      drivers/video/console/built-in.a
  CC      lib/zstd/decompress/huf_decompress.o
  CC      crypto/asymmetric_keys/pkcs7_verify.o
  AS      arch/x86/lib/memmove_32.o
  CC      arch/x86/events/intel/ds.o
  CC      fs/proc/base.o
  CC      fs/notify/mark.o
  CC      crypto/asymmetric_keys/x509.asn1.o
  CC      ipc/mq_sysctl.o
  CC      crypto/asymmetric_keys/x509_akid.asn1.o
  CC      crypto/asymmetric_keys/x509_cert_parser.o
  CC      arch/x86/lib/misc.o
  AS      arch/x86/platform/efi/efi_stub_32.o
  CC      mm/folio-compat.o
  CC      arch/x86/kernel/apic/ipi.o
  CC      mm/readahead.o
  CC      arch/x86/platform/efi/runtime-map.o
  CC      arch/x86/kernel/cpu/mtrr/cleanup.o
  AR      arch/x86/mm/pat/built-in.a
  CC      arch/x86/lib/pc-conf-reg.o
  CC      arch/x86/kernel/cpu/mce/amd.o
  CC      arch/x86/kernel/cpu/mce/threshold.o
  CC      arch/x86/kernel/cpu/mtrr/amd.o
  CC      lib/zstd/decompress/zstd_ddict.o
  AR      lib/lz4/built-in.a
  AR      arch/x86/events/amd/built-in.a
  CC      arch/x86/kernel/apic/vector.o
  CC      arch/x86/mm/init_32.o
  AS      arch/x86/lib/putuser.o
  CC      block/bio.o
  CC      fs/iomap/direct-io.o
  CC      fs/quota/kqid.o
  CC      lib/zstd/decompress/zstd_decompress.o
  CC      kernel/locking/semaphore.o
  AS      arch/x86/lib/retpoline.o
  CC      crypto/api.o
  CC      arch/x86/lib/string_32.o
  AR      arch/x86/kernel/fpu/built-in.a
  CC      arch/x86/lib/strstr_32.o
  CC      arch/x86/kernel/cpu/microcode/core.o
  AR      drivers/pci/hotplug/built-in.a
  CC      arch/x86/kernel/cpu/microcode/intel.o
  CC      security/selinux/netlink.o
  CC      crypto/asymmetric_keys/pkcs7.asn1.o
  CC      fs/quota/netlink.o
  AR      arch/x86/platform/intel/built-in.a
  CC      arch/x86/kernel/cpu/cacheinfo.o
  CC      arch/x86/kernel/cpu/microcode/amd.o
  CC      arch/x86/lib/usercopy.o
  CC      arch/x86/lib/usercopy_32.o
  CC      fs/notify/fdinfo.o
  CC      security/keys/request_key.o
  CC      crypto/asymmetric_keys/pkcs7_parser.o
  AR      arch/x86/platform/intel-mid/built-in.a
  CC      security/keys/request_key_auth.o
  CC      arch/x86/events/probe.o
  CC      io_uring/advise.o
  CC      arch/x86/events/utils.o
  AR      arch/x86/platform/intel-quark/built-in.a
  CC      arch/x86/lib/msr-smp.o
  CC      arch/x86/kernel/cpu/scattered.o
  CC      arch/x86/lib/cache-smp.o
  AR      drivers/video/built-in.a
  AR      arch/x86/platform/olpc/built-in.a
  CC      arch/x86/kernel/apic/init.o
  AR      arch/x86/platform/scx200/built-in.a
  CC      lib/xz/xz_dec_syms.o
  CC      io_uring/filetable.o
  CC      crypto/cipher.o
  CC      security/keys/user_defined.o
  CC      arch/x86/kernel/cpu/mtrr/cyrix.o
  CC      security/keys/proc.o
  CC      drivers/pci/pcie/pme.o
  CC      io_uring/openclose.o
  CC      fs/kernfs/mount.o
  AR      ipc/built-in.a
  CC      fs/kernfs/inode.o
  CC      fs/kernfs/dir.o
  AR      arch/x86/platform/efi/built-in.a
  CC      lib/crypto/mpi/mpicoder.o
  AR      fs/notify/built-in.a
  CC      arch/x86/mm/fault.o
  AR      arch/x86/platform/ts5500/built-in.a
  CC      mm/swap.o
  CC      fs/proc/generic.o
  AR      arch/x86/platform/uv/built-in.a
  CC      mm/truncate.o
  AR      crypto/asymmetric_keys/built-in.a
  AR      arch/x86/platform/built-in.a
  CC      arch/x86/lib/msr.o
  CC      fs/kernfs/file.o
  CC      arch/x86/events/intel/knc.o
  CC      security/keys/sysctl.o
  CC      security/keys/keyctl_pkey.o
  CC      lib/zstd/decompress/zstd_decompress_block.o
  AR      fs/quota/built-in.a
  CC      arch/x86/events/intel/lbr.o
  CC      lib/xz/xz_dec_stream.o
  AS      arch/x86/lib/msr-reg.o
  CC      arch/x86/events/intel/p4.o
  CC      fs/iomap/fiemap.o
  CC      arch/x86/events/intel/p6.o
  CC      arch/x86/events/intel/pt.o
  CC      arch/x86/mm/ioremap.o
  CC      arch/x86/events/intel/uncore.o
  CC      fs/iomap/seek.o
  CC      lib/xz/xz_dec_lzma2.o
  CC      fs/iomap/swapfile.o
  CC      arch/x86/events/intel/uncore_nhmex.o
  CC      kernel/locking/rwsem.o
  CC      drivers/pci/access.o
  AR      arch/x86/kernel/cpu/microcode/built-in.a
  CC      kernel/locking/percpu-rwsem.o
  CC      crypto/compress.o
  CC      kernel/locking/spinlock.o
  CC      fs/kernfs/symlink.o
  CC      kernel/locking/osq_lock.o
  CC      drivers/pci/bus.o
  CC      io_uring/uring_cmd.o
  AR      arch/x86/kernel/cpu/mce/built-in.a
  CC      security/selinux/nlmsgtab.o
  CC      security/selinux/netif.o
  CC      arch/x86/kernel/apic/hw_nmi.o
  CC      lib/zstd/zstd_common_module.o
  CC      kernel/locking/qspinlock.o
  CC      lib/zstd/common/debug.o
  CC      lib/dim/dim.o
  AR      drivers/pci/pcie/built-in.a
  CC      arch/x86/kernel/cpu/mtrr/centaur.o
  CC      arch/x86/kernel/cpu/mtrr/legacy.o
  CC      arch/x86/events/intel/uncore_snb.o
  CC      kernel/locking/rtmutex_api.o
  CC      io_uring/epoll.o
  CC      security/selinux/netnode.o
  CC      arch/x86/lib/msr-reg-export.o
  CC      io_uring/statx.o
  CC      drivers/pci/probe.o
  CC      lib/crypto/mpi/mpi-add.o
  CC      fs/proc/array.o
  CC      lib/xz/xz_dec_bcj.o
  CC      arch/x86/events/intel/uncore_snbep.o
  CC      arch/x86/events/intel/uncore_discovery.o
  CC      arch/x86/events/intel/cstate.o
  CC      lib/zstd/common/entropy_common.o
  CC      lib/crypto/mpi/mpi-bit.o
  CC      lib/zstd/common/error_private.o
  AR      security/keys/built-in.a
  CC      arch/x86/kernel/ebda.o
  CC      mm/vmscan.o
  CC      lib/crypto/arc4.o
  CC      lib/crypto/gf128mul.o
  CC      lib/crypto/blake2s.o
  AR      drivers/char/ipmi/built-in.a
  CC      arch/x86/kernel/apic/io_apic.o
  CC      crypto/algapi.o
  CC      lib/zstd/common/fse_decompress.o
  CC      security/selinux/netport.o
  CC      arch/x86/events/rapl.o
  CC      kernel/power/qos.o
  CC      kernel/power/main.o
  AS      arch/x86/lib/hweight.o
  AR      fs/iomap/built-in.a
  AR      arch/x86/kernel/cpu/mtrr/built-in.a
  CC      kernel/power/console.o
  CC      arch/x86/kernel/apic/msi.o
  CC      lib/crypto/blake2s-generic.o
  CC      arch/x86/kernel/cpu/topology_common.o
  CC      lib/dim/net_dim.o
  CC      arch/x86/kernel/cpu/topology_ext.o
  CC      arch/x86/mm/extable.o
  CC      arch/x86/lib/iomem.o
  CC      arch/x86/events/msr.o
  CC      lib/fonts/fonts.o
  CC      kernel/locking/qrwlock.o
  CC      lib/fonts/font_8x16.o
  CC      lib/argv_split.o
  CC      arch/x86/kernel/cpu/topology_amd.o
  CC      sound/core/seq/seq.o
  AR      fs/kernfs/built-in.a
  CC      sound/core/seq/seq_lock.o
  CC      io_uring/net.o
  CC      sound/core/seq/seq_clientmgr.o
  CC      net/core/sock.o
  CC      block/elevator.o
  CC      net/core/request_sock.o
  AR      lib/xz/built-in.a
  CC      net/core/skbuff.o
  CC      net/core/datagram.o
  CC      lib/dim/rdma_dim.o
  CC      security/selinux/status.o
  CC      arch/x86/lib/atomic64_32.o
  CC      net/core/stream.o
  CC      net/core/scm.o
  CC      net/core/gen_stats.o
  CC      net/core/gen_estimator.o
  CC      security/selinux/ss/ebitmap.o
  CC      net/core/net_namespace.o
  CC      arch/x86/lib/inat.o
  CC      sound/core/seq/seq_memory.o
  CC      fs/sysfs/file.o
  CC      sound/core/sound.o
  CC      arch/x86/kernel/platform-quirks.o
  AR      lib/fonts/built-in.a
  AR      sound/i2c/other/built-in.a
  AR      arch/x86/lib/built-in.a
  CC      sound/core/init.o
  AR      sound/i2c/built-in.a
  CC      kernel/printk/printk.o
  AR      arch/x86/lib/lib.a
  CC      kernel/irq/irqdesc.o
  CC      kernel/irq/handle.o
  CC      lib/crypto/mpi/mpi-cmp.o
  CC      kernel/rcu/update.o
  AR      kernel/sched/built-in.a
  CC      arch/x86/kernel/cpu/common.o
  AR      lib/dim/built-in.a
  CC      crypto/scatterwalk.o
  AR      kernel/locking/built-in.a
  AR      sound/drivers/opl3/built-in.a
  CC      crypto/proc.o
  CC      sound/core/seq/seq_queue.o
  AR      sound/drivers/opl4/built-in.a
  CC      kernel/irq/manage.o
  CC      sound/core/memory.o
  CC      kernel/printk/printk_safe.o
  CC      fs/sysfs/dir.o
  CC      drivers/pci/host-bridge.o
  AR      sound/drivers/mpu401/built-in.a
  CC      kernel/printk/nbcon.o
  AR      sound/drivers/vx/built-in.a
  AR      sound/drivers/pcsp/built-in.a
  CC      sound/core/seq/seq_fifo.o
  AR      sound/drivers/built-in.a
  CC      arch/x86/kernel/apic/probe_32.o
  CC      kernel/printk/printk_ringbuffer.o
  AR      kernel/livepatch/built-in.a
  CC      sound/core/seq/seq_prioq.o
  CC      crypto/aead.o
  CC      arch/x86/mm/mmap.o
  CC      sound/core/seq/seq_timer.o
  AR      sound/isa/ad1816a/built-in.a
  CC      lib/zstd/common/zstd_common.o
  AR      sound/isa/ad1848/built-in.a
  CC      crypto/geniv.o
  CC      crypto/lskcipher.o
  AR      sound/isa/cs423x/built-in.a
  CC      crypto/skcipher.o
  AR      sound/isa/es1688/built-in.a
  CC      block/blk-core.o
  AR      sound/isa/galaxy/built-in.a
  CC      fs/proc/fd.o
  AR      arch/x86/kernel/apic/built-in.a
  CC      io_uring/msg_ring.o
  AR      sound/isa/gus/built-in.a
  CC      arch/x86/kernel/cpu/rdrand.o
  CC      net/ethernet/eth.o
  CC      lib/crypto/mpi/mpi-sub-ui.o
  CC      arch/x86/kernel/cpu/match.o
  AR      sound/isa/msnd/built-in.a
  CC      kernel/dma/mapping.o
  CC      arch/x86/kernel/cpu/bugs.o
  CC      fs/devpts/inode.o
  CC      net/core/secure_seq.o
  AR      sound/isa/opti9xx/built-in.a
  CC      fs/sysfs/symlink.o
  CC      kernel/power/process.o
  CC      net/core/flow_dissector.o
  CC      arch/x86/mm/pgtable.o
  CC      kernel/power/suspend.o
  CC      io_uring/timeout.o
  CC      sound/core/control.o
  AR      lib/zstd/built-in.a
  AR      sound/isa/sb/built-in.a
  CC      kernel/dma/direct.o
  AR      sound/isa/wavefront/built-in.a
  CC      mm/shrinker.o
  CC      drivers/pci/remove.o
  AR      sound/pci/ac97/built-in.a
  CC      arch/x86/pci/i386.o
  AR      virt/lib/built-in.a
  AR      sound/isa/wss/built-in.a
  CC      drivers/acpi/acpica/dsargs.o
  AR      sound/pci/ali5451/built-in.a
  CC      mm/shmem.o
  AR      sound/isa/built-in.a
  AR      virt/built-in.a
  CC      mm/util.o
  AR      sound/pci/asihpi/built-in.a
  CC      drivers/pci/pci.o
  AR      sound/pci/au88x0/built-in.a
  AR      sound/pci/aw2/built-in.a
  CC      drivers/acpi/acpica/dscontrol.o
  CC      kernel/printk/sysctl.o
  CC      arch/x86/power/cpu.o
  CC      sound/core/misc.o
  CC      lib/crypto/mpi/mpi-div.o
  AR      sound/pci/ctxfi/built-in.a
  CC      arch/x86/pci/init.o
  CC      arch/x86/pci/pcbios.o
  AR      sound/pci/ca0106/built-in.a
  CC      sound/core/seq/seq_system.o
  AR      sound/pci/cs46xx/built-in.a
  CC      arch/x86/pci/mmconfig_32.o
  CC      lib/bug.o
  CC      sound/core/device.o
  AR      net/802/built-in.a
  CC      security/selinux/ss/hashtab.o
  AR      sound/pci/cs5535audio/built-in.a
  CC      kernel/irq/spurious.o
  CC      security/selinux/ss/symtab.o
  CC      net/sched/sch_generic.o
  AR      sound/pci/lola/built-in.a
  CC      block/blk-sysfs.o
  CC      block/blk-flush.o
  AR      sound/pci/lx6464es/built-in.a
  AR      fs/devpts/built-in.a
  CC      fs/proc/proc_tty.o
  CC      kernel/power/hibernate.o
  AR      sound/pci/echoaudio/built-in.a
  CC      drivers/acpi/acpica/dsdebug.o
  CC      fs/proc/cmdline.o
  AR      sound/pci/emu10k1/built-in.a
  AR      sound/pci/hda/built-in.a
  AR      sound/pci/ice1712/built-in.a
  CC      fs/proc/consoles.o
  CC      fs/sysfs/mount.o
  CC [M]  sound/pci/hda/hda_bind.o
  AR      arch/x86/events/intel/built-in.a
  CC      fs/netfs/buffered_read.o
  AR      arch/x86/events/built-in.a
  CC      crypto/seqiv.o
  CC      fs/ext4/balloc.o
  AR      drivers/acpi/pmic/built-in.a
  CC      sound/core/seq/seq_ports.o
  CC      mm/mmzone.o
  CC      block/blk-settings.o
  CC      sound/core/seq/seq_info.o
  CC      arch/x86/kernel/cpu/aperfmperf.o
  CC      arch/x86/kernel/process_32.o
  CC      arch/x86/mm/physaddr.o
  CC      arch/x86/kernel/cpu/cpuid-deps.o
  CC [M]  sound/pci/hda/hda_codec.o
  CC      lib/crypto/mpi/mpi-inv.o
  CC      kernel/dma/ops_helpers.o
  CC      drivers/acpi/acpica/dsfield.o
  CC      mm/vmstat.o
  CC [M]  sound/pci/hda/hda_jack.o
  CC      arch/x86/power/hibernate_32.o
  CC      kernel/rcu/sync.o
  CC [M]  sound/pci/hda/hda_auto_parser.o
  CC      arch/x86/pci/direct.o
  CC [M]  sound/pci/hda/hda_sysfs.o
  CC      security/selinux/ss/sidtab.o
  CC      arch/x86/pci/mmconfig-shared.o
  CC      kernel/rcu/srcutree.o
  CC      fs/netfs/buffered_write.o
  CC      net/netlink/af_netlink.o
  AR      net/bpf/built-in.a
  CC      kernel/irq/resend.o
  CC      kernel/dma/dummy.o
  CC      sound/core/info.o
  AR      net/ethernet/built-in.a
  CC      fs/jbd2/transaction.o
  CC      io_uring/sqpoll.o
  CC      kernel/entry/common.o
  CC      net/ethtool/ioctl.o
  CC      fs/jbd2/commit.o
  CC      fs/proc/cpuinfo.o
  CC      net/ethtool/common.o
  AS      arch/x86/power/hibernate_asm_32.o
  CC      kernel/entry/syscall_user_dispatch.o
  AR      kernel/printk/built-in.a
  CC      fs/sysfs/group.o
  CC      lib/crypto/mpi/mpi-mod.o
  CC      sound/core/isadma.o
  CC      arch/x86/kernel/cpu/umwait.o
  CC      block/blk-ioc.o
  MKCAP   arch/x86/kernel/cpu/capflags.c
  CC      arch/x86/power/hibernate.o
  CC      drivers/acpi/acpica/dsinit.o
  CC      arch/x86/mm/tlb.o
  CC      arch/x86/mm/cpu_entry_area.o
  CC      crypto/echainiv.o
  CC      crypto/ahash.o
  CC      arch/x86/mm/maccess.o
  CC      fs/ext4/bitmap.o
  CC      sound/core/seq/seq_dummy.o
  CC      crypto/shash.o
  CC      lib/buildid.o
  CC      kernel/irq/chip.o
  CC      lib/clz_tab.o
  CC      kernel/rcu/tree.o
  CC      fs/proc/devices.o
  CC      lib/crypto/mpi/mpi-mul.o
  CC      arch/x86/pci/fixup.o
  CC      sound/core/vmaster.o
  CC      drivers/acpi/acpica/dsmethod.o
  CC      net/core/sysctl_net_core.o
  CC      arch/x86/pci/acpi.o
  CC      kernel/rcu/rcu_segcblist.o
  CC      lib/crypto/mpi/mpih-cmp.o
  CC      kernel/dma/remap.o
  CC      net/core/dev.o
  CC      net/core/dev_addr_lists.o
  CC      kernel/module/main.o
  CC [M]  sound/pci/hda/hda_controller.o
  CC      kernel/time/time.o
  CC      arch/x86/mm/pgprot.o
  CC      kernel/futex/core.o
  CC      kernel/power/snapshot.o
  CC      kernel/time/timer.o
  CC      crypto/akcipher.o
  AR      fs/sysfs/built-in.a
  CC      net/sched/sch_mq.o
  CC      arch/x86/kernel/cpu/powerflags.o
  AR      arch/x86/power/built-in.a
  CC      net/sched/sch_frag.o
  CC      fs/ext4/block_validity.o
  CC      block/blk-map.o
  AR      kernel/entry/built-in.a
  CC      net/netfilter/core.o
  CC      mm/backing-dev.o
  CC      net/ipv4/netfilter/nf_defrag_ipv4.o
  AR      sound/core/seq/built-in.a
  CC      net/xfrm/xfrm_policy.o
  CC      sound/core/ctljack.o
  CC      drivers/acpi/acpica/dsmthdat.o
  CC      security/selinux/ss/avtab.o
  AR      kernel/dma/built-in.a
  CC      fs/proc/interrupts.o
  CC      net/netfilter/nf_log.o
  CC      net/ipv4/route.o
  CC      drivers/acpi/acpica/dsobject.o
  CC      net/ipv4/inetpeer.o
  CC      net/sched/sch_api.o
  CC      net/ipv4/protocol.o
  CC      net/ethtool/netlink.o
  CC      net/ipv4/ip_input.o
  CC      crypto/sig.o
  CC      fs/netfs/direct_read.o
  CC      net/ethtool/bitset.o
  CC      arch/x86/mm/pgtable_32.o
  CC      kernel/irq/dummychip.o
  CC      lib/crypto/mpi/mpih-div.o
  CC      fs/jbd2/recovery.o
  CC      kernel/module/strict_rwx.o
  CC      fs/ext4/dir.o
  CC      io_uring/fdinfo.o
  CC      sound/core/jack.o
  CC      kernel/power/swap.o
  CC      net/ipv4/netfilter/nf_reject_ipv4.o
  CC      net/sched/sch_blackhole.o
  CC      drivers/pci/pci-driver.o
  CC      drivers/acpi/acpica/dsopcode.o
  CC      arch/x86/pci/legacy.o
  CC      net/netfilter/nf_queue.o
  CC      fs/ext4/ext4_jbd2.o
  CC      net/ipv4/netfilter/ip_tables.o
  CC      kernel/futex/syscalls.o
  CC      fs/proc/loadavg.o
  CC      security/selinux/ss/policydb.o
  CC      fs/proc/meminfo.o
  CC [M]  sound/pci/hda/hda_proc.o
  CC      kernel/irq/devres.o
  CC      net/ipv4/ip_fragment.o
  CC      security/selinux/ss/services.o
  CC      kernel/power/user.o
  CC      arch/x86/mm/iomap_32.o
  CC      sound/core/timer.o
  CC      block/blk-merge.o
  CC      drivers/acpi/acpica/dspkginit.o
  CC      fs/proc/stat.o
  CC      kernel/time/hrtimer.o
  CC      net/ipv4/ip_forward.o
  CC      net/ipv4/netfilter/iptable_filter.o
  CC      kernel/irq/autoprobe.o
  CC      kernel/time/timekeeping.o
  CC      kernel/time/ntp.o
  CC      net/netlink/genetlink.o
  CC      net/ethtool/strset.o
  CC      net/core/dst.o
  CC      kernel/irq/irqdomain.o
  CC      mm/mm_init.o
  CC      net/ethtool/linkinfo.o
  CC      fs/netfs/direct_write.o
  CC      net/core/netevent.o
  CC      crypto/kpp.o
  CC      io_uring/tctx.o
  CC      net/core/neighbour.o
  CC      lib/crypto/mpi/mpih-mul.o
  CC      net/core/rtnetlink.o
  CC      net/ethtool/linkmodes.o
  CC      arch/x86/pci/irq.o
  CC      drivers/acpi/acpica/dsutils.o
  CC      fs/proc/uptime.o
  CC      kernel/power/poweroff.o
  CC      arch/x86/pci/common.o
  CC      arch/x86/pci/early.o
  CC      fs/jbd2/checkpoint.o
  CC      arch/x86/pci/bus_numa.o
  CC      net/ethtool/rss.o
  CC      kernel/module/kmod.o
  CC      arch/x86/mm/hugetlbpage.o
  CC      net/netfilter/nf_sockopt.o
  CC      kernel/irq/proc.o
  CC      kernel/futex/pi.o
  CC      fs/ext4/extents.o
  AR      kernel/power/built-in.a
  CC      net/ethtool/linkstate.o
  CC      drivers/pci/search.o
  CC      kernel/cgroup/cgroup.o
  CC      lib/crypto/mpi/mpi-pow.o
  CC      fs/ext4/extents_status.o
  CC      fs/proc/util.o
  CC [M]  sound/pci/hda/hda_hwdep.o
  CC      sound/core/hrtimer.o
  CC      net/netlink/policy.o
  CC      kernel/cgroup/rstat.o
  CC      net/ipv4/netfilter/iptable_mangle.o
  CC      arch/x86/mm/dump_pagetables.o
  CC      mm/percpu.o
  CC [M]  sound/pci/hda/patch_hdmi.o
  CC      fs/proc/version.o
  CC      arch/x86/mm/highmem_32.o
  CC      drivers/acpi/acpica/dswexec.o
  CC      fs/netfs/io.o
  ASN.1   crypto/rsapubkey.asn1.[ch]
  CC      kernel/module/tree_lookup.o
  ASN.1   crypto/rsaprivkey.asn1.[ch]
  CC      net/sched/cls_api.o
  CC      crypto/rsa.o
  CC      fs/proc/softirqs.o
  CC      io_uring/poll.o
  CC      fs/proc/namespaces.o
  CC      net/unix/af_unix.o
  CC      sound/core/seq_device.o
  CC      net/xfrm/xfrm_state.o
  CC      net/unix/garbage.o
  CC      net/unix/sysctl_net_unix.o
  CC      net/netfilter/utils.o
  CC      fs/ramfs/inode.o
  CC      kernel/time/clocksource.o
  CC      drivers/acpi/acpica/dswload.o
  CC      drivers/acpi/acpica/dswload2.o
  CC      arch/x86/pci/amd_bus.o
  CC      fs/proc/self.o
  CC      kernel/irq/migration.o
  CC      block/blk-timeout.o
  CC      crypto/rsa_helper.o
  CC      fs/jbd2/revoke.o
  CC      security/selinux/ss/conditional.o
  CC      lib/crypto/mpi/mpiutil.o
  CC      drivers/pci/rom.o
  CC      net/ethtool/debug.o
  CC      kernel/futex/requeue.o
  CC      net/ethtool/wol.o
  CC      net/ethtool/features.o
  CC      fs/proc/thread_self.o
  CC      fs/netfs/iterator.o
  AR      net/netlink/built-in.a
  CC      fs/netfs/locking.o
  CC      crypto/rsa-pkcs1pad.o
  CC      fs/netfs/main.o
  CC      fs/netfs/misc.o
  CC      fs/jbd2/journal.o
  CC      kernel/irq/cpuhotplug.o
  CC [M]  sound/pci/hda/hda_eld.o
  CC      net/netfilter/nfnetlink.o
  CC      net/ipv4/netfilter/ipt_REJECT.o
  CC      fs/netfs/objects.o
  AR      arch/x86/mm/built-in.a
  AR      arch/x86/pci/built-in.a
  CC      drivers/acpi/acpica/dswscope.o
  CC      lib/crypto/sha1.o
  CC [M]  sound/core/hwdep.o
  CC      fs/ramfs/file-mmu.o
  CC      kernel/module/kallsyms.o
  CC      crypto/acompress.o
  CC      net/ipv6/netfilter/ip6_tables.o
  CC      net/ipv6/af_inet6.o
  CC      fs/netfs/output.o
  CC      net/packet/af_packet.o
  CC      crypto/scompress.o
  CC      block/blk-lib.o
  CC      block/blk-mq.o
  CC      kernel/futex/waitwake.o
  CC      drivers/pci/setup-res.o
  CC      fs/proc/proc_sysctl.o
  AR      kernel/rcu/built-in.a
  CC      kernel/irq/pm.o
  CC      net/ipv6/anycast.o
  CC      fs/ext4/file.o
  CC      io_uring/cancel.o
  CC      kernel/module/procfs.o
  CC      drivers/acpi/acpica/dswstate.o
  CC      kernel/irq/msi.o
  AR      lib/crypto/mpi/built-in.a
  CC      fs/ext4/fsmap.o
  CC      lib/crypto/sha256.o
  AR      sound/pci/korg1212/built-in.a
  CC      fs/hugetlbfs/inode.o
  CC      kernel/time/jiffies.o
  AR      sound/pci/mixart/built-in.a
  CC      kernel/time/timer_list.o
  CC      kernel/time/timeconv.o
  CC      net/ethtool/privflags.o
  CC      kernel/time/timecounter.o
  CC      fs/ext4/fsync.o
  CC      mm/slab_common.o
  AR      fs/ramfs/built-in.a
  CC      security/selinux/ss/mls.o
  CC      net/ipv4/ip_options.o
  AR      sound/pci/nm256/built-in.a
  CC      mm/compaction.o
  CC      mm/show_mem.o
  AR      sound/pci/oxygen/built-in.a
  AR      sound/pci/pcxhr/built-in.a
  CC      fs/fat/cache.o
  CC      crypto/algboss.o
  CC      drivers/acpi/dptf/int340x_thermal.o
  CC      drivers/acpi/acpica/evevent.o
  CC [M]  sound/core/pcm.o
  CC [M]  sound/pci/hda/hda_intel.o
  CC      io_uring/kbuf.o
  CC      drivers/pci/irq.o
  AR      net/unix/built-in.a
  CC      drivers/pci/vpd.o
  LD [M]  sound/pci/hda/snd-hda-codec.o
  CC      drivers/pci/setup-bus.o
  CC      crypto/testmgr.o
  CC      io_uring/rsrc.o
  CC      kernel/cgroup/namespace.o
  CC      drivers/pci/vc.o
  CC      kernel/cgroup/cgroup-v1.o
  CC      kernel/module/sysfs.o
  AR      kernel/futex/built-in.a
  CC      net/netfilter/nfnetlink_log.o
  CC      kernel/cgroup/freezer.o
  CC      drivers/acpi/acpica/evgpe.o
  CC [M]  net/ipv4/netfilter/iptable_nat.o
  AR      fs/netfs/built-in.a
  AR      lib/crypto/built-in.a
  CC      io_uring/rw.o
  CC      lib/cmdline.o
  CC      kernel/cgroup/legacy_freezer.o
  CC      fs/proc/proc_net.o
  CC      kernel/cgroup/pids.o
  CC      kernel/time/alarmtimer.o
  CC      kernel/irq/affinity.o
  CC      lib/cpumask.o
  CC      kernel/cgroup/rdma.o
  CC      block/blk-mq-tag.o
  AR      drivers/acpi/dptf/built-in.a
  CC      block/blk-stat.o
  CC      io_uring/opdef.o
  AR      fs/hugetlbfs/built-in.a
  CC      block/blk-mq-sysfs.o
  CC      fs/proc/kcore.o
  CC      net/xfrm/xfrm_hash.o
  CC      net/core/utils.o
  CC      drivers/acpi/acpica/evgpeblk.o
  CC      drivers/acpi/acpica/evgpeinit.o
  CC      fs/fat/dir.o
  CC      crypto/cmac.o
  CC      net/ethtool/rings.o
  CC      kernel/irq/matrix.o
  CC      fs/proc/vmcore.o
  AR      kernel/module/built-in.a
  CC      net/ipv4/ip_output.o
  CC      fs/fat/fatent.o
  CC      drivers/acpi/acpica/evgpeutil.o
  CC      net/sched/act_api.o
  CC      fs/fat/file.o
  CC [M]  sound/core/pcm_native.o
  CC      kernel/cgroup/cpuset.o
  CC [M]  sound/core/pcm_lib.o
  CC      crypto/hmac.o
  CC      mm/shmem_quota.o
  CC      net/ipv6/netfilter/ip6table_filter.o
  CC      lib/ctype.o
  CC      drivers/pnp/pnpacpi/core.o
  CC      fs/fat/inode.o
  CC      net/ipv6/ip6_output.o
  CC      drivers/pnp/core.o
  CC      lib/dec_and_lock.o
  CC      net/xfrm/xfrm_input.o
  CC      io_uring/notif.o
  CC      net/core/link_watch.o
  CC      security/selinux/ss/context.o
  CC      io_uring/waitid.o
  CC      net/ipv4/ip_sockglue.o
  AR      fs/jbd2/built-in.a
  CC      drivers/acpi/acpica/evglock.o
  CC      net/ipv4/inet_hashtables.o
  CC      net/ipv4/inet_timewait_sock.o
  AR      net/dsa/built-in.a
  CC      lib/decompress.o
  CC      net/ipv4/inet_connection_sock.o
  CC      net/ipv4/tcp.o
  CC      drivers/pnp/pnpacpi/rsparser.o
  CC      net/xfrm/xfrm_output.o
  CC      lib/decompress_bunzip2.o
  AR      net/ipv4/netfilter/built-in.a
  CC      drivers/pci/mmap.o
  LD [M]  sound/pci/hda/snd-hda-codec-hdmi.o
  CC      block/blk-mq-cpumap.o
  CC      lib/decompress_inflate.o
  CC      arch/x86/kernel/cpu/topology.o
  CC      drivers/acpi/acpica/evhandler.o
  CC      drivers/pnp/card.o
  CC      kernel/time/posix-timers.o
  CC      net/netfilter/nf_conntrack_core.o
  LD [M]  sound/pci/hda/snd-hda-intel.o
  CC      net/ethtool/channels.o
  CC      net/ethtool/coalesce.o
  CC      kernel/time/posix-cpu-timers.o
  AR      sound/pci/riptide/built-in.a
  CC      fs/ext4/hash.o
  CC      crypto/crypto_null.o
  CC      drivers/pci/devres.o
  CC      drivers/acpi/tables.o
  CC      drivers/pci/proc.o
  AR      sound/pci/rme9652/built-in.a
  AR      sound/pci/trident/built-in.a
  CC      crypto/md5.o
  CC      security/selinux/netlabel.o
  AR      sound/pci/ymfpci/built-in.a
  AR      sound/pci/vx222/built-in.a
  CC      fs/proc/kmsg.o
  AR      sound/pci/built-in.a
  CC      drivers/pci/pci-sysfs.o
  CC      mm/interval_tree.o
  CC      fs/isofs/namei.o
  CC      crypto/sha256_generic.o
  CC      drivers/acpi/acpica/evmisc.o
  CC      net/ipv6/netfilter/ip6table_mangle.o
  AR      kernel/irq/built-in.a
  AR      net/packet/built-in.a
  CC      kernel/trace/trace_clock.o
  CC      net/core/filter.o
  CC      lib/decompress_unlz4.o
  CC      fs/proc/page.o
  CC      net/sunrpc/auth_gss/auth_gss.o
  AR      sound/ppc/built-in.a
  CC      net/sunrpc/clnt.o
  CC      net/sunrpc/xprt.o
  CC      net/ethtool/pause.o
  CC      net/sunrpc/socklib.o
  CC      arch/x86/kernel/cpu/proc.o
  CC      kernel/time/posix-clock.o
  CC      net/sunrpc/auth_gss/gss_generic_token.o
  CC      crypto/sha512_generic.o
  CC      kernel/time/itimer.o
  CC      kernel/time/clockevents.o
  CC      crypto/sha3_generic.o
  CC      drivers/acpi/acpica/evregion.o
  CC      drivers/pci/slot.o
  CC      io_uring/register.o
  CC      fs/ext4/ialloc.o
  CC      block/blk-mq-sched.o
  CC      crypto/ecb.o
  CC      kernel/trace/ring_buffer.o
  CC      drivers/acpi/acpica/evrgnini.o
  CC      fs/fat/misc.o
  CC      mm/list_lru.o
  CC      lib/decompress_unlzma.o
  CC      kernel/trace/trace.o
  AR      drivers/pnp/pnpacpi/built-in.a
  CC      kernel/trace/trace_output.o
  CC      net/ethtool/eee.o
  CC      drivers/pnp/driver.o
  CC      drivers/acpi/blacklist.o
  AR      sound/arm/built-in.a
  CC      kernel/time/tick-common.o
  CC      net/sunrpc/auth_gss/gss_mech_switch.o
  CC      fs/nfs/client.o
  CC      fs/isofs/inode.o
  CC      fs/isofs/dir.o
  CC      fs/exportfs/expfs.o
  CC      fs/isofs/util.o
  CC      fs/ext4/indirect.o
  CC      kernel/cgroup/misc.o
  AR      security/selinux/built-in.a
  CC      fs/isofs/rock.o
  AR      security/built-in.a
  CC      net/xfrm/xfrm_sysctl.o
  CC      fs/isofs/export.o
  CC      fs/isofs/joliet.o
  AR      fs/proc/built-in.a
  CC      fs/isofs/compress.o
  CC      drivers/pci/pci-acpi.o
  CC      net/netfilter/nf_conntrack_standalone.o
  CC      net/xfrm/xfrm_replay.o
  CC      fs/ext4/inline.o
  CC      drivers/acpi/acpica/evsci.o
  CC      crypto/cbc.o
  CC      drivers/pnp/resource.o
  CC [M]  sound/core/pcm_misc.o
  CC      net/sched/sch_fifo.o
  CC      drivers/pnp/manager.o
  CC      kernel/cgroup/debug.o
  CC      net/ipv6/netfilter/nf_defrag_ipv6_hooks.o
  CC      mm/workingset.o
  CC      lib/decompress_unlzo.o
  AR      fs/exportfs/built-in.a
  CC [M]  sound/core/pcm_memory.o
  CC      lib/decompress_unxz.o
  CC      net/sunrpc/auth_gss/svcauth_gss.o
  CC      crypto/ctr.o
  CC      net/ipv6/netfilter/nf_conntrack_reasm.o
  CC      net/sunrpc/auth_gss/gss_rpc_upcall.o
  CC      fs/fat/nfs.o
  AR      sound/sh/built-in.a
  CC      net/ipv6/netfilter/nf_reject_ipv6.o
  CC      arch/x86/kernel/signal.o
  AR      sound/synth/emux/built-in.a
  CC      fs/fat/namei_vfat.o
  CC      drivers/acpi/acpica/evxface.o
  AR      sound/synth/built-in.a
  CC      drivers/pci/iomap.o
  CC      block/ioctl.o
  CC      drivers/pci/quirks.o
  CC      net/ethtool/tsinfo.o
  CC      kernel/time/tick-broadcast.o
  CC      net/core/sock_diag.o
  CC      fs/lockd/clntlock.o
  CC      mm/debug.o
  CC      drivers/acpi/osi.o
  CC      crypto/gcm.o
  CC      fs/nls/nls_base.o
  CC      drivers/pnp/support.o
  CC      mm/gup.o
  CC      mm/mmap_lock.o
  CC      fs/nls/nls_cp437.o
  CC      drivers/pci/pci-label.o
  AR      fs/isofs/built-in.a
  CC      net/xfrm/xfrm_device.o
  CC      lib/decompress_unzstd.o
  CC      drivers/acpi/osl.o
  CC      net/ethtool/cabletest.o
  AR      fs/unicode/built-in.a
  CC      net/ipv4/tcp_input.o
  CC      fs/autofs/init.o
  CC      net/sunrpc/auth_gss/gss_rpc_xdr.o
  AR      kernel/cgroup/built-in.a
  CC      fs/nfs/dir.o
  CC      net/ipv4/tcp_output.o
  CC      fs/autofs/inode.o
  CC      drivers/acpi/acpica/evxfevnt.o
  CC      drivers/acpi/acpica/evxfgpe.o
  CC      io_uring/truncate.o
  CC      fs/autofs/root.o
  CC      net/sched/cls_cgroup.o
  CC [M]  sound/core/memalloc.o
  CC      crypto/ccm.o
  CC      net/netfilter/nf_conntrack_expect.o
  CC      block/genhd.o
  CC      fs/9p/vfs_super.o
  AR      fs/hostfs/built-in.a
  CC      drivers/pnp/interface.o
  CC      kernel/bpf/core.o
  CC      fs/nls/nls_ascii.o
  CC      fs/nls/nls_iso8859-1.o
  CC      net/netfilter/nf_conntrack_helper.o
  CC      net/sched/ematch.o
  CC      fs/nls/nls_utf8.o
  CC      kernel/time/tick-broadcast-hrtimer.o
  CC      arch/x86/kernel/cpu/feat_ctl.o
  CC      lib/dump_stack.o
  CC      fs/fat/namei_msdos.o
  CC      net/core/dev_ioctl.o
  CC      crypto/aes_generic.o
  CC      fs/ext4/inode.o
  CC      drivers/acpi/acpica/evxfregn.o
  CC      fs/ext4/ioctl.o
  CC      lib/earlycpio.o
  CC      crypto/crc32c_generic.o
  CC      fs/lockd/clntproc.o
  CC      fs/autofs/symlink.o
  CC      mm/highmem.o
  CC      net/ethtool/tunnels.o
  CC      net/ethtool/fec.o
  CC      drivers/pnp/quirks.o
  CC      crypto/authenc.o
  CC      kernel/time/tick-oneshot.o
  AR      fs/nls/built-in.a
  CC      drivers/pnp/system.o
  CC      net/xfrm/xfrm_algo.o
  CC      fs/debugfs/inode.o
  AR      net/wireless/tests/built-in.a
  CC      net/sunrpc/auth_gss/trace.o
  CC      net/wireless/core.o
  AR      net/mac80211/tests/built-in.a
  CC      net/mac80211/main.o
  CC      arch/x86/kernel/signal_32.o
  CC      arch/x86/kernel/cpu/intel.o
  CC      net/ipv6/netfilter/ip6t_ipv6header.o
  CC      drivers/pci/vgaarb.o
  CC      fs/ext4/mballoc.o
  CC      drivers/acpi/acpica/exconcat.o
  CC      fs/9p/vfs_inode.o
  CC      fs/lockd/clntxdr.o
  CC      net/wireless/sysfs.o
  CC      net/core/tso.o
  CC [M]  sound/core/pcm_timer.o
  CC      fs/lockd/host.o
  CC      drivers/acpi/acpica/exconfig.o
  CC      arch/x86/kernel/cpu/intel_pconfig.o
  AR      net/sched/built-in.a
  CC      io_uring/io-wq.o
  CC      fs/lockd/svc.o
  LD [M]  sound/core/snd-hwdep.o
  CC      arch/x86/kernel/cpu/tsx.o
  CC      fs/9p/vfs_inode_dotl.o
  CC      kernel/trace/trace_seq.o
  CC      lib/extable.o
  CC      arch/x86/kernel/traps.o
  CC      kernel/time/tick-sched.o
  CC      net/netlabel/netlabel_user.o
  CC      net/netlabel/netlabel_kapi.o
  CC      net/netfilter/nf_conntrack_proto.o
  CC      fs/autofs/waitq.o
  CC      crypto/authencesn.o
  AR      fs/fat/built-in.a
  AR      drivers/pnp/built-in.a
  AR      sound/core/built-in.a
  CC      fs/debugfs/file.o
  CC      net/rfkill/core.o
  CC      net/rfkill/input.o
  CC      block/ioprio.o
  LD [M]  sound/core/snd-pcm.o
  CC      net/9p/mod.o
  CC      net/9p/client.o
  CC      block/badblocks.o
  CC      net/ipv6/netfilter/ip6t_REJECT.o
  AR      sound/usb/misc/built-in.a
  CC      crypto/lzo.o
  AR      sound/usb/usx2y/built-in.a
  CC      drivers/acpi/acpica/exconvrt.o
  CC      net/dns_resolver/dns_key.o
  CC      lib/flex_proportions.o
  CC      mm/memory.o
  AR      sound/usb/caiaq/built-in.a
  CC      arch/x86/kernel/idt.o
  CC      drivers/acpi/acpica/excreate.o
  CC      net/ethtool/eeprom.o
  AR      sound/usb/6fire/built-in.a
  CC      kernel/trace/trace_stat.o
  AR      sound/usb/hiface/built-in.a
  CC      fs/9p/vfs_addr.o
  AR      sound/usb/bcd2000/built-in.a
  AR      sound/usb/built-in.a
  CC      net/core/sock_reuseport.o
  CC      net/xfrm/xfrm_user.o
  CC      fs/autofs/expire.o
  CC      net/core/fib_notifier.o
  CC      net/core/xdp.o
  AR      sound/firewire/built-in.a
  CC      mm/mincore.o
  CC      drivers/acpi/acpica/exdebug.o
  CC      lib/idr.o
  AR      sound/sparc/built-in.a
  AR      drivers/pci/built-in.a
  CC      lib/irq_regs.o
  CC      crypto/lzo-rle.o
  AR      sound/spi/built-in.a
  CC      net/dns_resolver/dns_query.o
  CC      lib/is_single_threaded.o
  CC      kernel/time/timer_migration.o
  AR      sound/parisc/built-in.a
  CC      net/mac80211/status.o
  CC      fs/tracefs/inode.o
  CC      fs/open.o
  CC      fs/lockd/svclock.o
  CC [M]  fs/efivarfs/inode.o
  AR      sound/pcmcia/vx/built-in.a
  CC      fs/ext4/migrate.o
  AR      sound/pcmcia/pdaudiocf/built-in.a
  CC      net/handshake/alert.o
  AR      sound/mips/built-in.a
  AR      sound/pcmcia/built-in.a
  CC      kernel/trace/trace_printk.o
  CC      net/devres.o
  CC      fs/tracefs/event_inode.o
  CC      fs/nfs/file.o
  AR      sound/soc/built-in.a
  CC      io_uring/futex.o
  AR      sound/atmel/built-in.a
  CC      net/netfilter/nf_conntrack_proto_generic.o
  CC      drivers/acpi/acpica/exdump.o
  CC      block/blk-rq-qos.o
  AR      sound/hda/built-in.a
  CC [M]  sound/hda/hda_bus_type.o
  CC [M]  sound/hda/hdac_bus.o
  AR      kernel/bpf/built-in.a
  CC [M]  sound/hda/hdac_device.o
  CC      net/netfilter/nf_conntrack_proto_tcp.o
  CC      fs/9p/vfs_file.o
  AR      net/ipv6/netfilter/built-in.a
  CC      net/ipv6/ip6_input.o
  CC [M]  fs/efivarfs/file.o
  CC [M]  fs/efivarfs/super.o
  CC      lib/klist.o
  CC      net/ethtool/stats.o
  AR      net/dns_resolver/built-in.a
  CC      crypto/rng.o
  AR      net/rfkill/built-in.a
  CC      net/core/flow_offload.o
  CC      fs/nfs/getroot.o
  CC      net/netlabel/netlabel_domainhash.o
  CC      net/netlabel/netlabel_addrlist.o
  CC      net/netfilter/nf_conntrack_proto_udp.o
  AR      fs/debugfs/built-in.a
  CC      drivers/acpi/acpica/exfield.o
  CC      kernel/trace/pid_list.o
  CC      drivers/acpi/acpica/exfldio.o
  CC      net/sunrpc/auth_gss/gss_krb5_mech.o
  CC      lib/kobject.o
  CC      net/ipv4/tcp_timer.o
  CC      net/ipv4/tcp_ipv4.o
  CC      drivers/acpi/utils.o
  CC [M]  sound/hda/hdac_sysfs.o
  CC      fs/autofs/dev-ioctl.o
  CC      block/disk-events.o
  CC      drivers/acpi/reboot.o
  CC      kernel/events/core.o
  CC      kernel/fork.o
  CC      net/9p/error.o
  CC      block/blk-ia-ranges.o
  CC      crypto/drbg.o
  CC      crypto/jitterentropy.o
  CC      net/netfilter/nf_conntrack_proto_icmp.o
  CC      net/netfilter/nf_conntrack_extend.o
  CC      lib/kobject_uevent.o
  AR      fs/tracefs/built-in.a
  CC      net/netfilter/nf_conntrack_acct.o
  CC      io_uring/napi.o
  CC      fs/ext4/mmp.o
  CC      net/netfilter/nf_conntrack_seqadj.o
  CC      net/netfilter/nf_conntrack_proto_icmpv6.o
  CC      drivers/acpi/acpica/exmisc.o
  CC      net/mac80211/driver-ops.o
  CC      fs/9p/vfs_dir.o
  CC      net/9p/protocol.o
  CC      net/wireless/radiotap.o
  CC      net/handshake/genl.o
  CC      kernel/time/vsyscall.o
  CC      net/wireless/util.o
  CC [M]  fs/efivarfs/vars.o
  CC      net/ethtool/phc_vclocks.o
  CC      net/ipv4/tcp_minisocks.o
  CC      net/ipv4/tcp_cong.o
  AR      drivers/amba/built-in.a
  CC      net/ipv4/tcp_metrics.o
  CC      fs/lockd/svcshare.o
  CC      net/ethtool/mm.o
  CC      fs/lockd/svcproc.o
  CC      kernel/trace/trace_sched_switch.o
  CC [M]  sound/hda/hdac_regmap.o
  CC      drivers/acpi/acpica/exmutex.o
  CC      fs/lockd/svcsubs.o
  AR      net/xfrm/built-in.a
  AR      fs/autofs/built-in.a
  CC      drivers/acpi/acpica/exnames.o
  CC      net/netfilter/nf_conntrack_netlink.o
  CC      lib/logic_pio.o
  CC      fs/nfs/inode.o
  CC      net/ethtool/module.o
  CC      net/sunrpc/auth_gss/gss_krb5_seal.o
  CC      crypto/jitterentropy-kcapi.o
  CC      block/early-lookup.o
  CC      net/sunrpc/auth_gss/gss_krb5_unseal.o
  CC      kernel/time/timekeeping_debug.o
  CC      net/netlabel/netlabel_mgmt.o
  CC      net/wireless/reg.o
  CC      net/core/gro.o
  CC      net/ipv4/tcp_fastopen.o
  CC      net/ipv6/addrconf.o
  CC      net/9p/trans_common.o
  CC      crypto/ghash-generic.o
  CC      net/9p/trans_fd.o
  CC      drivers/acpi/acpica/exoparg1.o
  CC      net/handshake/netlink.o
  CC      lib/maple_tree.o
  AR      io_uring/built-in.a
  CC      fs/9p/vfs_dentry.o
  CC      net/handshake/request.o
  CC      net/netfilter/nf_conntrack_ftp.o
  CC      kernel/events/ring_buffer.o
  CC      fs/9p/v9fs.o
  CC      net/sunrpc/xprtsock.o
  CC [M]  sound/hda/hdac_controller.o
  AR      drivers/clk/actions/built-in.a
  AR      drivers/clk/analogbits/built-in.a
  CC      lib/memcat_p.o
  CC      net/mac80211/sta_info.o
  CC      kernel/exec_domain.o
  CC      arch/x86/kernel/cpu/intel_epb.o
  AR      drivers/clk/bcm/built-in.a
  CC      kernel/time/namespace.o
  CC      fs/read_write.o
  CC      mm/mlock.o
  LD [M]  fs/efivarfs/efivarfs.o
  AR      drivers/clk/imgtec/built-in.a
  CC      fs/file_table.o
  CC      net/ethtool/pse-pd.o
  CC      net/socket.o
  CC      crypto/hash_info.o
  CC      net/9p/trans_virtio.o
  CC      block/bounce.o
  AR      drivers/clk/imx/built-in.a
  CC      arch/x86/kernel/cpu/amd.o
  CC      crypto/rsapubkey.asn1.o
  AR      drivers/clk/ingenic/built-in.a
  CC      arch/x86/kernel/cpu/hygon.o
  CC      drivers/acpi/acpica/exoparg2.o
  AR      drivers/clk/mediatek/built-in.a
  CC      net/sunrpc/auth_gss/gss_krb5_wrap.o
  CC      crypto/rsaprivkey.asn1.o
  CC      kernel/trace/trace_nop.o
  AR      drivers/clk/microchip/built-in.a
  CC      net/netlabel/netlabel_unlabeled.o
  CC      kernel/trace/blktrace.o
  AR      crypto/built-in.a
  CC      kernel/trace/trace_events.o
  AR      drivers/clk/mstar/built-in.a
  CC      fs/ext4/move_extent.o
  CC      net/netlabel/netlabel_cipso_v4.o
  AR      drivers/clk/mvebu/built-in.a
  CC      kernel/panic.o
  AR      drivers/clk/ralink/built-in.a
  CC      fs/ext4/namei.o
  CC      fs/lockd/mon.o
  AR      drivers/clk/renesas/built-in.a
  AR      drivers/clk/socfpga/built-in.a
  CC      fs/ext4/page-io.o
  CC      drivers/acpi/acpica/exoparg3.o
  CC      kernel/cpu.o
  CC      kernel/exit.o
  AR      drivers/clk/sprd/built-in.a
  CC      net/handshake/tlshd.o
  AR      drivers/clk/starfive/built-in.a
  CC      fs/9p/fid.o
  CC      kernel/events/callchain.o
  AR      drivers/clk/sunxi-ng/built-in.a
  CC      arch/x86/kernel/cpu/centaur.o
  CC      net/ethtool/plca.o
  AR      kernel/time/built-in.a
  CC      lib/nmi_backtrace.o
  AR      drivers/clk/ti/built-in.a
  CC      net/core/netdev-genl.o
  CC      lib/objpool.o
  AR      drivers/clk/versatile/built-in.a
  CC      drivers/acpi/acpica/exoparg6.o
  AR      drivers/clk/xilinx/built-in.a
  CC [M]  sound/hda/hdac_stream.o
  CC      kernel/softirq.o
  AR      drivers/clk/built-in.a
  CC      kernel/trace/trace_export.o
  CC      drivers/acpi/acpica/exprep.o
  CC      kernel/resource.o
  CC      kernel/sysctl.o
  CC      kernel/capability.o
  CC      net/ipv4/tcp_rate.o
  CC      mm/mmap.o
  CC [M]  sound/hda/array.o
  CC      net/sunrpc/auth_gss/gss_krb5_crypto.o
  CC      fs/ext4/readpage.o
  CC      kernel/ptrace.o
  CC      kernel/user.o
  CC      net/mac80211/wep.o
  CC      fs/lockd/trace.o
  CC      kernel/signal.o
  AR      net/9p/built-in.a
  CC      fs/9p/xattr.o
  CC      block/bsg.o
  CC      net/wireless/scan.o
  CC [M]  sound/hda/hdmi_chmap.o
  CC [M]  sound/hda/trace.o
  CC      net/sunrpc/sched.o
  CC      arch/x86/kernel/cpu/transmeta.o
  CC      net/netfilter/nf_conntrack_irc.o
  CC      arch/x86/kernel/cpu/zhaoxin.o
  CC      arch/x86/kernel/cpu/vortex.o
  CC      net/sunrpc/auth_gss/gss_krb5_keys.o
  CC      drivers/acpi/acpica/exregion.o
  CC      arch/x86/kernel/cpu/perfctr-watchdog.o
  CC      kernel/events/hw_breakpoint.o
  CC      arch/x86/kernel/cpu/vmware.o
  CC      arch/x86/kernel/cpu/hypervisor.o
  CC      fs/ext4/resize.o
  CC      fs/super.o
  CC      net/sysctl_net.o
  CC      drivers/acpi/acpica/exresnte.o
  CC      arch/x86/kernel/cpu/mshyperv.o
  CC      arch/x86/kernel/cpu/debugfs.o
  CC      net/netlabel/netlabel_calipso.o
  CC      kernel/trace/trace_event_perf.o
  CC      net/handshake/trace.o
  CC      mm/mmu_gather.o
  CC      kernel/trace/trace_events_filter.o
  CC      kernel/events/uprobes.o
  CC      fs/ext4/super.o
  CC      block/blk-cgroup.o
  AR      fs/9p/built-in.a
  CC      net/wireless/nl80211.o
  CC      net/wireless/mlme.o
  CC      lib/plist.o
  CC      drivers/acpi/acpica/exresolv.o
  AR      net/ethtool/built-in.a
  CC      fs/lockd/xdr.o
  CC      lib/radix-tree.o
  CC      lib/ratelimit.o
  AR      net/sunrpc/auth_gss/built-in.a
  CC      kernel/sys.o
  CC      lib/rbtree.o
  CC      lib/seq_buf.o
  CC      net/ipv4/tcp_recovery.o
  CC      net/core/netdev-genl-gen.o
  CC      fs/lockd/clnt4xdr.o
  CC      drivers/dma/dw/core.o
  CC      fs/lockd/xdr4.o
  CC      drivers/acpi/acpica/exresop.o
  CC      fs/lockd/svc4proc.o
  CC      net/ipv6/addrlabel.o
  CC      fs/ext4/symlink.o
  CC [M]  sound/hda/hdac_component.o
  AR      drivers/soc/apple/built-in.a
  CC      net/ipv4/tcp_ulp.o
  CC      net/ipv6/route.o
  AR      drivers/soc/aspeed/built-in.a
  CC      kernel/umh.o
  CC      kernel/workqueue.o
  AR      drivers/soc/bcm/built-in.a
  CC      drivers/virtio/virtio.o
  AR      drivers/soc/fsl/built-in.a
  AR      drivers/soc/fujitsu/built-in.a
  CC      drivers/acpi/acpica/exserial.o
  CC      drivers/tty/vt/vt_ioctl.o
  CC      net/netfilter/nf_conntrack_sip.o
  CC      drivers/tty/hvc/hvc_console.o
  AR      drivers/soc/hisilicon/built-in.a
  AR      drivers/soc/imx/built-in.a
  AR      net/handshake/built-in.a
  AR      drivers/soc/ixp4xx/built-in.a
  AR      drivers/soc/loongson/built-in.a
  CC      lib/siphash.o
  CC      lib/string.o
  CC      drivers/virtio/virtio_ring.o
  AR      drivers/soc/mediatek/built-in.a
  CC      kernel/trace/trace_events_trigger.o
  AR      drivers/soc/microchip/built-in.a
  CC      net/ipv6/ip6_fib.o
  AR      drivers/soc/nuvoton/built-in.a
  CC      drivers/dma/dw/dw.o
  AR      drivers/soc/pxa/built-in.a
  CC      lib/timerqueue.o
  CC      drivers/acpi/acpica/exstore.o
  AR      drivers/soc/amlogic/built-in.a
  CC      net/ipv6/ipv6_sockglue.o
  CC      lib/vsprintf.o
  CC      lib/win_minmax.o
  AR      net/netlabel/built-in.a
  AR      drivers/soc/qcom/built-in.a
  CC      kernel/trace/trace_eprobe.o
  CC      drivers/dma/dw/idma32.o
  CC      mm/mprotect.o
  CC      fs/char_dev.o
  AR      drivers/soc/renesas/built-in.a
  CC      fs/stat.o
  CC      fs/exec.o
  CC      lib/xarray.o
  CC      fs/nfs/super.o
  AR      drivers/soc/rockchip/built-in.a
  CC      net/core/gso.o
  CC      lib/lockref.o
  CC      fs/pipe.o
  CC      net/sunrpc/auth.o
  CC      fs/ext4/sysfs.o
  AR      drivers/soc/sunxi/built-in.a
  CC      net/sunrpc/auth_null.o
  CC      net/sunrpc/auth_tls.o
  AR      drivers/soc/ti/built-in.a
  CC      net/sunrpc/auth_unix.o
  AR      drivers/soc/xilinx/built-in.a
  AR      drivers/soc/built-in.a
  CC      net/sunrpc/svc.o
  CC      net/ipv4/tcp_offload.o
  CC      fs/namei.o
  CC      drivers/acpi/acpica/exstoren.o
  CC      fs/fcntl.o
  CC [M]  sound/hda/hdac_i915.o
  CC      fs/ioctl.o
  CC      block/blk-ioprio.o
  CC      net/mac80211/aead_api.o
  CC      drivers/tty/vt/vc_screen.o
  CC      drivers/dma/dw/acpi.o
  CC      fs/readdir.o
  CC      kernel/pid.o
  CC      mm/mremap.o
  AR      drivers/tty/hvc/built-in.a
  CC      fs/lockd/procfs.o
  CC      kernel/trace/trace_kprobe.o
  CC      fs/select.o
  CC      kernel/trace/error_report-traces.o
  CC      kernel/trace/power-traces.o
  CC      mm/msync.o
  CC      fs/dcache.o
  CC      drivers/acpi/acpica/exstorob.o
  CC      fs/inode.o
  AR      kernel/events/built-in.a
  CC      net/core/net-sysfs.o
  CC      net/core/hotdata.o
  CC      arch/x86/kernel/irq.o
  CC      kernel/trace/rpm-traces.o
  CC      drivers/char/hw_random/core.o
  CC      drivers/char/hw_random/intel-rng.o
  CC      net/mac80211/wpa.o
  CC      block/blk-iolatency.o
  CC      drivers/acpi/acpica/exsystem.o
  CC      fs/attr.o
  CC      lib/bcd.o
  CC [M]  sound/hda/intel-dsp-config.o
  CC      lib/sort.o
  AR      drivers/dma/dw/built-in.a
  CC      drivers/virtio/virtio_anchor.o
  CC      kernel/task_work.o
  CC      drivers/dma/hsu/hsu.o
  AR      drivers/dma/idxd/built-in.a
  AR      fs/lockd/built-in.a
  CC      net/netfilter/nf_nat_core.o
  CC      drivers/virtio/virtio_pci_modern_dev.o
  CC      drivers/virtio/virtio_pci_legacy_dev.o
  CC      kernel/extable.o
  CC      net/netfilter/nf_nat_proto.o
  CC      kernel/params.o
  CC      kernel/kthread.o
  CC      drivers/tty/serial/8250/8250_core.o
  CC      drivers/acpi/acpica/extrace.o
  AR      drivers/iommu/amd/built-in.a
  CC      net/netfilter/nf_nat_helper.o
  CC      drivers/tty/vt/selection.o
  AR      drivers/iommu/intel/built-in.a
  CC      fs/nfs/io.o
  AR      drivers/iommu/arm/arm-smmu/built-in.a
  CC      mm/page_vma_mapped.o
  AR      drivers/iommu/arm/arm-smmu-v3/built-in.a
  AR      drivers/dma/mediatek/built-in.a
  CC      drivers/virtio/virtio_pci_modern.o
  AR      drivers/iommu/arm/built-in.a
  CC      drivers/acpi/acpica/exutils.o
  CC      drivers/acpi/acpica/hwacpi.o
  CC      net/ipv4/tcp_plb.o
  AR      drivers/iommu/iommufd/built-in.a
  CC      net/ipv4/datagram.o
  CC      drivers/iommu/iommu.o
  CC      net/ipv4/raw.o
  CC      net/ipv6/ndisc.o
  CC      lib/parser.o
  CC      drivers/tty/serial/8250/8250_pnp.o
  AR      drivers/dma/hsu/built-in.a
  CC      drivers/char/hw_random/amd-rng.o
  CC [M]  sound/hda/intel-nhlt.o
  AR      drivers/dma/qcom/built-in.a
  AR      drivers/gpu/host1x/built-in.a
  AR      drivers/dma/ti/built-in.a
  CC      drivers/connector/cn_queue.o
  CC      drivers/acpi/nvs.o
  CC [M]  sound/hda/intel-sdw-acpi.o
  CC      drivers/base/power/sysfs.o
  AR      sound/x86/built-in.a
  CC      drivers/base/power/generic_ops.o
  AR      drivers/dma/xilinx/built-in.a
  CC      drivers/base/firmware_loader/builtin/main.o
  CC      fs/ext4/xattr.o
  CC      drivers/dma/dmaengine.o
  CC      drivers/acpi/acpica/hwesleep.o
  CC      net/core/net-procfs.o
  CC      fs/ext4/xattr_hurd.o
  CC      kernel/sys_ni.o
  CC      drivers/tty/vt/keyboard.o
  CC      drivers/virtio/virtio_pci_common.o
  CC      mm/pagewalk.o
  AR      drivers/gpu/vga/built-in.a
  CC      kernel/trace/trace_dynevent.o
  CC      kernel/trace/trace_probe.o
  AR      drivers/gpu/drm/tests/built-in.a
  CC      kernel/trace/trace_uprobe.o
  CC      drivers/tty/serial/8250/8250_port.o
  AR      drivers/base/firmware_loader/builtin/built-in.a
  CC      kernel/nsproxy.o
  CC      drivers/dma/virt-dma.o
  AR      drivers/gpu/drm/arm/built-in.a
  CC      drivers/gpu/drm/display/drm_display_helper_mod.o
  CC      drivers/base/firmware_loader/main.o
  CC      drivers/gpu/drm/display/drm_dp_dual_mode_helper.o
  CC      kernel/trace/rethook.o
  CC      drivers/gpu/drm/display/drm_dp_helper.o
  CC      block/blk-iocost.o
  CC      fs/bad_inode.o
  CC      fs/nfs/direct.o
  CC      lib/debug_locks.o
  CC      drivers/char/hw_random/geode-rng.o
  CC      drivers/base/power/common.o
  CC      drivers/block/loop.o
  LD [M]  sound/hda/snd-hda-core.o
  CC      drivers/block/virtio_blk.o
  LD [M]  sound/hda/snd-intel-dspcfg.o
  CC      drivers/acpi/acpica/hwgpe.o
  CC      net/wireless/ibss.o
  LD [M]  sound/hda/snd-intel-sdw-acpi.o
  CC      net/mac80211/scan.o
  AR      sound/xen/built-in.a
  CC      drivers/iommu/iommu-traces.o
  CC      lib/random32.o
  AR      sound/virtio/built-in.a
  CC      sound/sound_core.o
  CC      fs/file.o
  CC      fs/nfs/pagelist.o
  CC      fs/nfs/read.o
  CC      fs/nfs/symlink.o
  CC      fs/filesystems.o
  CC      drivers/base/power/qos.o
  CC      drivers/gpu/drm/display/drm_dp_mst_topology.o
  CC      net/netfilter/nf_nat_masquerade.o
  CC      drivers/connector/connector.o
  CC      mm/pgtable-generic.o
  CC      arch/x86/kernel/irq_32.o
  CC      lib/bust_spinlocks.o
  CC      arch/x86/kernel/dumpstack_32.o
  CC      arch/x86/kernel/time.o
  CC      drivers/virtio/virtio_pci_legacy.o
  CC      drivers/dma/acpi-dma.o
  CC      fs/ext4/xattr_trusted.o
  CC      fs/ext4/xattr_user.o
  CC      drivers/acpi/acpica/hwregs.o
  CC      sound/last.o
  CC      net/core/netpoll.o
  CC      net/core/fib_rules.o
  CC      kernel/notifier.o
  CC      fs/ext4/fast_commit.o
  CC      fs/namespace.o
  CC      drivers/tty/vt/vt.o
  AR      drivers/base/firmware_loader/built-in.a
  CC      drivers/char/hw_random/via-rng.o
  CC      fs/seq_file.o
  CC      net/ipv6/udp.o
  CC      drivers/acpi/acpica/hwsleep.o
  CC      net/ipv4/udp.o
  CC      arch/x86/kernel/ioport.o
  CC      arch/x86/kernel/dumpstack.o
  AR      drivers/dma/built-in.a
  CC      fs/ext4/orphan.o
  CC      drivers/char/agp/backend.o
  CC      fs/nfs/unlink.o
  CC      lib/kasprintf.o
  CC      fs/ext4/acl.o
  CC      fs/nfs/write.o
  CC      drivers/gpu/drm/display/drm_dsc_helper.o
  CC      drivers/tty/serial/8250/8250_dma.o
  CC      mm/rmap.o
  CC      drivers/virtio/virtio_pci_admin_legacy_io.o
  CC      drivers/base/power/runtime.o
  AR      drivers/char/hw_random/built-in.a
  AR      sound/built-in.a
  CC      drivers/virtio/virtio_input.o
  CC      drivers/char/mem.o
  CC      drivers/virtio/virtio_dma_buf.o
  CC      net/wireless/sme.o
  CC      drivers/base/power/wakeirq.o
  CC      net/ipv6/udplite.o
  CC      drivers/iommu/iommu-sysfs.o
  CC      fs/ext4/xattr_security.o
  CC      drivers/acpi/acpica/hwvalid.o
  CC      fs/xattr.o
  CC      fs/libfs.o
  CC      drivers/connector/cn_proc.o
  CC      lib/bitmap.o
  CC      drivers/base/power/main.o
  CC      drivers/char/agp/generic.o
  CC      drivers/char/random.o
  CC      drivers/tty/serial/8250/8250_dwlib.o
  AR      drivers/block/built-in.a
  CC      net/netfilter/nf_nat_ftp.o
  CC      lib/scatterlist.o
  CC      drivers/acpi/wakeup.o
  CC      drivers/gpu/drm/display/drm_hdcp_helper.o
  CC      net/netfilter/nf_nat_irc.o
  AR      kernel/trace/built-in.a
  CC      drivers/char/misc.o
  CC      kernel/ksysfs.o
  CC      drivers/acpi/acpica/hwxface.o
  AR      drivers/misc/eeprom/built-in.a
  AR      drivers/misc/cb710/built-in.a
  CC      net/sunrpc/svcsock.o
  CC      drivers/base/regmap/regmap.o
  AR      drivers/base/test/built-in.a
  COPY    drivers/tty/vt/defkeymap.c
  AR      drivers/misc/ti-st/built-in.a
  CC      drivers/base/power/wakeup.o
  CC      drivers/base/power/wakeup_stats.o
  AR      drivers/virtio/built-in.a
  AR      drivers/misc/lis3lv02d/built-in.a
  CC      drivers/base/power/trace.o
  AR      drivers/misc/cardreader/built-in.a
  CC      drivers/acpi/sleep.o
  CC      net/mac80211/offchannel.o
  AR      drivers/misc/built-in.a
  CC      drivers/tty/vt/consolemap.o
  CC      drivers/base/component.o
  CC      net/core/net-traces.o
  CC      drivers/tty/serial/8250/8250_pcilib.o
  AR      drivers/tty/ipwireless/built-in.a
  CC      drivers/base/core.o
  HOSTCC  drivers/tty/vt/conmakehash
  CC      drivers/base/bus.o
  CC      drivers/acpi/acpica/hwxfsleep.o
  CC      drivers/iommu/dma-iommu.o
  CC      drivers/base/dd.o
  CC      fs/fs-writeback.o
  CC      net/netfilter/nf_nat_sip.o
  CC      drivers/base/regmap/regcache.o
  CC      drivers/base/regmap/regcache-rbtree.o
  CC      fs/nfs/namespace.o
  CC      drivers/char/virtio_console.o
  CC      drivers/char/hpet.o
  CC      drivers/char/nvram.o
  CC      drivers/char/agp/isoch.o
  AR      drivers/connector/built-in.a
  CC      kernel/cred.o
  CC      kernel/reboot.o
  AR      drivers/mfd/built-in.a
  CC      drivers/gpu/drm/display/drm_hdmi_helper.o
  CC      block/mq-deadline.o
  CC      drivers/acpi/acpica/hwpci.o
  CC      block/kyber-iosched.o
  CC      lib/list_sort.o
  CC      drivers/base/regmap/regcache-flat.o
  CC      drivers/base/regmap/regcache-maple.o
  CC      lib/uuid.o
  CC      drivers/base/regmap/regmap-debugfs.o
  CC      fs/pnode.o
  AR      drivers/nfc/built-in.a
  CC      net/netfilter/x_tables.o
  CC      fs/splice.o
  CC      arch/x86/kernel/nmi.o
  CC      drivers/gpu/drm/ttm/ttm_tt.o
  CC      drivers/base/syscore.o
  CC      drivers/gpu/drm/ttm/ttm_bo.o
  CC      drivers/tty/serial/8250/8250_early.o
  CC      lib/iov_iter.o
  CC      drivers/tty/serial/8250/8250_exar.o
  CC      net/ipv4/udplite.o
  CC      drivers/char/agp/amd64-agp.o
  CC      drivers/gpu/drm/display/drm_scdc_helper.o
  CC      kernel/async.o
  CC      net/ipv6/raw.o
  CC      kernel/range.o
  CC      drivers/acpi/acpica/nsaccess.o
  CC      drivers/tty/vt/defkeymap.o
  CC      drivers/base/driver.o
  CC      drivers/acpi/acpica/nsalloc.o
  CC      drivers/base/class.o
  CC      drivers/base/platform.o
  CC      mm/vmalloc.o
  CC      mm/process_vm_access.o
  CC      drivers/acpi/acpica/nsarguments.o
  CC      kernel/smpboot.o
  CONMK   drivers/tty/vt/consolemap_deftbl.c
  CC      drivers/tty/tty_io.o
  CC      drivers/tty/vt/consolemap_deftbl.o
  CC      kernel/ucount.o
  CC      drivers/acpi/device_sysfs.o
  CC      drivers/tty/n_tty.o
  CC      kernel/regset.o
  CC      drivers/tty/tty_ioctl.o
  CC      drivers/tty/tty_ldisc.o
  CC      drivers/tty/serial/8250/8250_lpss.o
  AR      drivers/tty/vt/built-in.a
  CC      fs/nfs/mount_clnt.o
  CC      net/ipv4/udp_offload.o
  CC      drivers/iommu/iova.o
  CC      drivers/acpi/acpica/nsconvert.o
  CC      drivers/acpi/acpica/nsdump.o
  CC      fs/sync.o
  AR      drivers/gpu/drm/display/built-in.a
  AR      drivers/base/power/built-in.a
  CC      drivers/char/agp/intel-agp.o
  CC      fs/utimes.o
  CC      drivers/acpi/acpica/nseval.o
  CC      fs/d_path.o
  CC      fs/stack.o
  CC      drivers/base/cpu.o
  AR      fs/ext4/built-in.a
  CC      net/mac80211/ht.o
  CC      drivers/tty/serial/8250/8250_mid.o
  CC      drivers/gpu/drm/ttm/ttm_bo_util.o
  AR      drivers/base/regmap/built-in.a
  AR      drivers/dax/hmem/built-in.a
  AR      drivers/gpu/drm/renesas/rcar-du/built-in.a
  AR      drivers/dax/built-in.a
  CC      net/wireless/chan.o
  AR      drivers/gpu/drm/renesas/rz-du/built-in.a
  CC      net/wireless/ethtool.o
  AR      drivers/gpu/drm/renesas/built-in.a
  CC      drivers/tty/serial/8250/8250_pci.o
  CC      drivers/acpi/device_pm.o
  CC      drivers/tty/serial/8250/8250_pericom.o
  AR      drivers/gpu/drm/omapdrm/built-in.a
  AR      drivers/gpu/drm/tilcdc/built-in.a
  CC      fs/fs_struct.o
  CC      mm/page_alloc.o
  CC      drivers/gpu/drm/virtio/virtgpu_drv.o
  AR      drivers/gpu/drm/imx/built-in.a
  CC      fs/statfs.o
  CC      drivers/acpi/acpica/nsinit.o
  CC      kernel/ksyms_common.o
  CC      net/netfilter/xt_tcpudp.o
  AR      drivers/gpu/drm/i2c/built-in.a
  AR      drivers/gpu/drm/panel/built-in.a
  CC      net/netfilter/xt_CONNSECMARK.o
  CC      drivers/gpu/drm/i915/i915_config.o
  CC      net/netfilter/xt_NFLOG.o
  CC      drivers/dma-buf/dma-buf.o
  AR      drivers/gpu/drm/hisilicon/built-in.a
  AR      drivers/gpu/drm/bridge/analogix/built-in.a
  CC      drivers/dma-buf/dma-fence.o
  CC      net/core/selftests.o
  CC      net/ipv4/arp.o
  CC      block/blk-mq-pci.o
  AR      drivers/gpu/drm/bridge/cadence/built-in.a
  AR      drivers/gpu/drm/bridge/imx/built-in.a
  CC      drivers/gpu/drm/ttm/ttm_bo_vm.o
  CC      net/ipv4/icmp.o
  AR      drivers/gpu/drm/bridge/synopsys/built-in.a
  CC      net/sunrpc/svcauth.o
  CC      drivers/acpi/proc.o
  AR      drivers/gpu/drm/bridge/built-in.a
  CC      block/blk-mq-virtio.o
  CC      drivers/char/agp/intel-gtt.o
  CC      block/blk-mq-debugfs.o
  AR      drivers/iommu/built-in.a
  CC      block/blk-pm.o
  AR      drivers/gpu/drm/mxsfb/built-in.a
  CC      drivers/gpu/drm/i915/i915_driver.o
  CC      fs/nfs/nfstrace.o
  AR      drivers/gpu/drm/tiny/built-in.a
  CC      block/holder.o
  CC      drivers/acpi/acpica/nsload.o
  CC      drivers/gpu/drm/virtio/virtgpu_kms.o
  AR      drivers/cxl/core/built-in.a
  CC      drivers/gpu/drm/virtio/virtgpu_gem.o
  AR      drivers/cxl/built-in.a
  CC      drivers/base/firmware.o
  CC      drivers/base/init.o
  CC      drivers/macintosh/mac_hid.o
  CC      fs/nfs/export.o
  CC      arch/x86/kernel/ldt.o
  AR      drivers/scsi/pcmcia/built-in.a
  CC      fs/fs_pin.o
  CC      drivers/acpi/acpica/nsnames.o
  CC      kernel/groups.o
  CC      fs/nsfs.o
  CC      drivers/scsi/scsi.o
  AR      drivers/tty/serial/8250/built-in.a
  CC      net/ipv6/icmp.o
  CC      kernel/kcmp.o
  CC      drivers/tty/serial/serial_core.o
  AR      drivers/nvme/host/built-in.a
  AR      drivers/nvme/common/built-in.a
  AR      drivers/nvme/target/built-in.a
  CC      kernel/freezer.o
  CC      net/netfilter/xt_SECMARK.o
  AR      drivers/nvme/built-in.a
  CC      kernel/profile.o
  CC      net/ipv6/mcast.o
  AR      drivers/gpu/drm/xlnx/built-in.a
  CC      arch/x86/kernel/setup.o
  CC      mm/init-mm.o
  AR      drivers/gpu/drm/gud/built-in.a
  CC      fs/nfs/sysfs.o
  CC      kernel/stacktrace.o
  CC      lib/clz_ctz.o
  CC      drivers/gpu/drm/ttm/ttm_module.o
  CC      lib/bsearch.o
  CC      arch/x86/kernel/x86_init.o
  CC      net/ipv4/devinet.o
  CC      drivers/base/map.o
  CC      net/ipv4/af_inet.o
  CC      arch/x86/kernel/i8259.o
  AR      drivers/macintosh/built-in.a
  CC      net/sunrpc/svcauth_unix.o
  CC      arch/x86/kernel/irqinit.o
  CC      drivers/acpi/acpica/nsobject.o
  AR      block/built-in.a
  CC      net/core/ptp_classifier.o
  CC      drivers/gpu/drm/i915/i915_drm_client.o
  CC      drivers/ata/libata-core.o
  CC      mm/memblock.o
  CC      drivers/gpu/drm/virtio/virtgpu_vram.o
  CC      fs/fs_types.o
  CC      arch/x86/kernel/jump_label.o
  CC      fs/fs_context.o
  CC      kernel/dma.o
  CC      net/core/netprio_cgroup.o
  CC      drivers/gpu/drm/ttm/ttm_execbuf_util.o
  AR      drivers/gpu/drm/solomon/built-in.a
  AR      drivers/net/pse-pd/built-in.a
  AR      drivers/net/phy/qcom/built-in.a
  CC      drivers/net/phy/mdio-boardinfo.o
  CC      drivers/net/phy/stubs.o
  CC      drivers/dma-buf/dma-fence-array.o
  CC      kernel/smp.o
  CC      kernel/uid16.o
  AR      drivers/char/agp/built-in.a
  CC      net/netfilter/xt_TCPMSS.o
  AR      drivers/char/built-in.a
  CC      net/netfilter/xt_conntrack.o
  CC      drivers/base/devres.o
  CC      net/netfilter/xt_policy.o
  CC [M]  drivers/gpu/drm/scheduler/sched_main.o
  CC      mm/slub.o
  CC      drivers/dma-buf/dma-fence-chain.o
  CC      drivers/gpu/drm/virtio/virtgpu_display.o
  CC      drivers/scsi/hosts.o
  CC      net/mac80211/agg-tx.o
  CC      drivers/scsi/scsi_ioctl.o
  CC      drivers/acpi/acpica/nsparse.o
  CC      net/ipv4/igmp.o
  CC      net/core/netclassid_cgroup.o
  CC      net/sunrpc/addr.o
  CC      drivers/dma-buf/dma-fence-unwrap.o
  CC      net/core/dst_cache.o
  CC      lib/find_bit.o
  CC      drivers/acpi/acpica/nspredef.o
  CC      net/ipv4/fib_frontend.o
  CC      net/ipv4/fib_semantics.o
  CC      net/netfilter/xt_state.o
  CC      drivers/gpu/drm/ttm/ttm_range_manager.o
  CC      kernel/kallsyms.o
  CC      drivers/tty/serial/serial_base_bus.o
  CC      net/mac80211/agg-rx.o
  CC      lib/llist.o
  CC      kernel/acct.o
  CC      drivers/gpu/drm/virtio/virtgpu_vq.o
  CC      drivers/ata/libata-scsi.o
  CC      lib/lwq.o
  CC      drivers/gpu/drm/virtio/virtgpu_fence.o
  CC      lib/memweight.o
  CC      fs/fs_parser.o
  CC      net/core/gro_cells.o
  CC      drivers/base/attribute_container.o
  CC      net/sunrpc/rpcb_clnt.o
  CC      arch/x86/kernel/cpu/capflags.o
  CC      drivers/dma-buf/dma-resv.o
  CC      net/ipv4/fib_trie.o
  AR      arch/x86/kernel/cpu/built-in.a
  CC      drivers/acpi/acpica/nsprepkg.o
  CC      arch/x86/kernel/irq_work.o
  CC      arch/x86/kernel/probe_roms.o
  CC [M]  net/netfilter/nf_log_syslog.o
  CC      arch/x86/kernel/sys_ia32.o
  CC      drivers/net/phy/mdio_devres.o
  CC      drivers/base/transport_class.o
  CC      drivers/base/topology.o
  CC      lib/kfifo.o
  CC      mm/madvise.o
  CC      net/sunrpc/timer.o
  CC      drivers/tty/serial/serial_ctrl.o
  CC      drivers/tty/serial/serial_port.o
  CC      drivers/firewire/init_ohci1394_dma.o
  CC      drivers/tty/serial/earlycon.o
  CC      drivers/tty/tty_buffer.o
  CC      drivers/scsi/scsicam.o
  CC      mm/page_io.o
  CC      net/ipv4/fib_notifier.o
  CC [M]  net/netfilter/xt_mark.o
  CC [M]  drivers/gpu/drm/scheduler/sched_fence.o
  CC      drivers/cdrom/cdrom.o
  CC      drivers/gpu/drm/ttm/ttm_resource.o
  CC      drivers/base/container.o
  CC      lib/percpu-refcount.o
  CC      kernel/vmcore_info.o
  CC      drivers/gpu/drm/virtio/virtgpu_object.o
  CC      drivers/acpi/acpica/nsrepair.o
  CC      drivers/gpu/drm/virtio/virtgpu_debugfs.o
  CC      fs/fsopen.o
  CC      drivers/gpu/drm/i915/i915_getparam.o
  CC      fs/init.o
  CC      fs/kernel_read_file.o
  CC      net/ipv6/reassembly.o
  CC      drivers/tty/tty_port.o
  CC      drivers/net/mdio/acpi_mdio.o
  AR      drivers/firewire/built-in.a
  CC      drivers/base/property.o
  CC      net/wireless/mesh.o
  CC [M]  drivers/gpu/drm/scheduler/sched_entity.o
  CC      kernel/elfcorehdr.o
  CC [M]  net/netfilter/xt_nat.o
  CC      fs/mnt_idmapping.o
  AR      drivers/tty/serial/built-in.a
  CC      kernel/crash_reserve.o
  CC      drivers/gpu/drm/ttm/ttm_pool.o
  CC      net/core/failover.o
  CC      drivers/dma-buf/sync_file.o
  CC      drivers/net/phy/phy.o
  CC      fs/nfs/fs_context.o
  CC      drivers/net/phy/phy-c45.o
  CC      drivers/net/phy/phy-core.o
  CC      drivers/scsi/scsi_error.o
  CC      lib/rhashtable.o
  CC      drivers/acpi/acpica/nsrepair2.o
  CC      fs/remap_range.o
  CC      fs/nfs/nfsroot.o
  CC      arch/x86/kernel/ksysfs.o
  CC      fs/nfs/sysctl.o
  CC      fs/nfs/nfs2super.o
  CC      fs/nfs/proc.o
  CC      drivers/net/mdio/fwnode_mdio.o
  CC      fs/nfs/nfs2xdr.o
  CC      fs/nfs/nfs3super.o
  CC      lib/base64.o
  CC      drivers/ata/libata-eh.o
  CC      drivers/gpu/drm/virtio/virtgpu_plane.o
  CC      drivers/ata/libata-transport.o
  CC      drivers/ata/libata-trace.o
  CC      drivers/ata/libata-sata.o
  CC      lib/once.o
  AR      net/core/built-in.a
  CC      drivers/tty/tty_mutex.o
  AR      drivers/dma-buf/built-in.a
  CC      lib/refcount.o
  CC      fs/pidfs.o
  CC      fs/buffer.o
  CC [M]  net/netfilter/xt_LOG.o
  CC      fs/mpage.o
  CC      lib/rcuref.o
  CC      drivers/acpi/acpica/nssearch.o
  CC      lib/usercopy.o
  CC      kernel/kexec_core.o
  LD [M]  drivers/gpu/drm/scheduler/gpu-sched.o
  CC      lib/errseq.o
  CC      net/mac80211/vht.o
  CC      drivers/gpu/drm/drm_aperture.o
  CC      net/wireless/ap.o
  CC      drivers/gpu/drm/i915/i915_ioctl.o
  CC      net/ipv6/tcp_ipv6.o
  CC      net/mac80211/he.o
  CC [M]  drivers/gpu/drm/xe/xe_bb.o
  CC      arch/x86/kernel/bootflag.o
  CC      lib/bucket_locks.o
  CC      arch/x86/kernel/e820.o
  CC      drivers/scsi/scsi_lib.o
  CC      drivers/base/cacheinfo.o
  CC      net/ipv4/inet_fragment.o
  CC      drivers/scsi/constants.o
  CC      net/wireless/trace.o
  CC      drivers/scsi/scsi_lib_dma.o
  CC      drivers/gpu/drm/ttm/ttm_device.o
  CC      drivers/scsi/scsi_scan.o
  CC      drivers/tty/tty_ldsem.o
  CC      net/wireless/ocb.o
  CC      drivers/net/phy/phy_device.o
  AR      drivers/net/mdio/built-in.a
  CC      net/wireless/pmsr.o
  CC      mm/swap_state.o
  CC      fs/nfs/nfs3client.o
  CC      net/sunrpc/xdr.o
  CC      net/sunrpc/sunrpc_syms.o
  CC      drivers/acpi/acpica/nsutils.o
  GEN     drivers/scsi/scsi_devinfo_tbl.c
  CC      drivers/ata/libata-sff.o
  GEN     net/wireless/shipped-certs.c
  CC      drivers/gpu/drm/drm_atomic.o
  CC      fs/proc_namespace.o
  CC      fs/direct-io.o
  CC      drivers/tty/tty_baudrate.o
  AR      drivers/cdrom/built-in.a
  CC      fs/nfs/nfs3proc.o
  CC      drivers/base/swnode.o
  CC      drivers/gpu/drm/i915/i915_irq.o
  CC      net/ipv4/ping.o
  CC      drivers/gpu/drm/virtio/virtgpu_ioctl.o
  CC      lib/generic-radix-tree.o
  CC      drivers/base/auxiliary.o
  CC      fs/nfs/nfs3xdr.o
  CC      drivers/acpi/acpica/nswalk.o
  CC      drivers/acpi/bus.o
  AR      drivers/auxdisplay/built-in.a
  CC      drivers/scsi/scsi_devinfo.o
  CC      drivers/acpi/acpica/nsxfeval.o
  CC      drivers/pcmcia/cs.o
  CC [M]  drivers/gpu/drm/xe/xe_bo.o
  CC      drivers/gpu/drm/i915/i915_mitigations.o
  CC      arch/x86/kernel/pci-dma.o
  CC      drivers/gpu/drm/i915/i915_module.o
  CC      net/ipv4/ip_tunnel_core.o
  CC [M]  net/netfilter/xt_MASQUERADE.o
  CC [M]  net/netfilter/xt_addrtype.o
  CC      drivers/acpi/glue.o
  CC      drivers/gpu/drm/ttm/ttm_sys_manager.o
  CC      drivers/gpu/drm/drm_atomic_uapi.o
  CC      drivers/tty/tty_jobctrl.o
  CC      drivers/acpi/scan.o
  CC      drivers/acpi/mipi-disco-img.o
  CC      drivers/base/devtmpfs.o
  CC      drivers/gpu/drm/ttm/ttm_agp_backend.o
  CC      kernel/crash_core.o
  CC      net/ipv6/ping.o
  CC      mm/swapfile.o
  CC      drivers/acpi/acpica/nsxfname.o
  CC      lib/bitmap-str.o
  CC      drivers/pcmcia/socket_sysfs.o
  CC      drivers/gpu/drm/virtio/virtgpu_prime.o
  CC      drivers/gpu/drm/virtio/virtgpu_trace_points.o
  CC      mm/swap_slots.o
  CC      net/ipv6/exthdrs.o
  CC      drivers/scsi/scsi_sysctl.o
  CC      drivers/scsi/scsi_proc.o
  CC      net/mac80211/s1g.o
  CC      drivers/acpi/acpica/nsxfobj.o
  CC      net/ipv6/datagram.o
  CC      drivers/gpu/drm/virtio/virtgpu_submit.o
  CC      arch/x86/kernel/quirks.o
  CC      lib/string_helpers.o
  CC      drivers/tty/n_null.o
  CC      net/ipv6/ip6_flowlabel.o
  CC      drivers/input/serio/serio.o
  CC      fs/eventpoll.o
  CC      drivers/usb/common/common.o
  CC      drivers/input/serio/i8042.o
  CC      drivers/acpi/resource.o
  AR      drivers/gpu/drm/ttm/built-in.a
  CC      drivers/net/phy/linkmode.o
  CC      drivers/usb/core/usb.o
  CC      drivers/gpu/drm/i915/i915_params.o
  CC      drivers/usb/core/hub.o
  CC      drivers/acpi/acpica/psargs.o
  CC      drivers/usb/core/hcd.o
  CC      drivers/usb/core/urb.o
  CC      fs/anon_inodes.o
  CC      drivers/pcmcia/cardbus.o
  CC      fs/signalfd.o
  CC      net/ipv6/inet6_connection_sock.o
  CC      kernel/kexec.o
  CC      drivers/gpu/drm/drm_auth.o
  CC      drivers/base/module.o
  CC      drivers/net/phy/mdio_bus.o
  CC      net/mac80211/ibss.o
  AR      drivers/net/pcs/built-in.a
  AR      net/netfilter/built-in.a
  AR      drivers/gpu/drm/virtio/built-in.a
  CC      mm/dmapool.o
  CC      drivers/tty/pty.o
  CC      fs/timerfd.o
  CC      drivers/pcmcia/ds.o
  CC      lib/hexdump.o
  CC      drivers/net/phy/mdio_device.o
  CC      drivers/usb/common/debug.o
  CC      drivers/acpi/acpica/psloop.o
  CC      net/ipv4/gre_offload.o
  AR      drivers/net/ethernet/3com/built-in.a
  CC      drivers/scsi/scsi_debugfs.o
  CC      drivers/base/devcoredump.o
  CC      drivers/net/ethernet/8390/ne2k-pci.o
  CC      drivers/net/ethernet/8390/8390.o
  AR      drivers/usb/common/built-in.a
  CC      lib/kstrtox.o
  CC      arch/x86/kernel/topology.o
  AR      drivers/net/ethernet/adaptec/built-in.a
  CC      net/ipv4/metrics.o
  AR      drivers/net/ethernet/agere/built-in.a
  CC      drivers/ata/libata-pmp.o
  CC      arch/x86/kernel/kdebugfs.o
  CC      drivers/acpi/acpi_processor.o
  CC      drivers/acpi/acpica/psobject.o
  CC      drivers/acpi/acpica/psopcode.o
  CC      drivers/acpi/acpica/psopinfo.o
  CC      kernel/utsname.o
  CC      drivers/gpu/drm/i915/i915_pci.o
  CC      drivers/base/platform-msi.o
  CC      drivers/gpu/drm/i915/i915_scatterlist.o
  CC      drivers/base/physical_location.o
  CC      lib/iomap.o
  CC [M]  drivers/gpu/drm/xe/xe_bo_evict.o
  CC      arch/x86/kernel/alternative.o
  CC      net/wireless/shipped-certs.o
  AR      drivers/usb/phy/built-in.a
  CC      arch/x86/kernel/i8253.o
  CC      drivers/base/trace.o
  CC      arch/x86/kernel/hw_breakpoint.o
  CC      arch/x86/kernel/tsc.o
  CC      net/ipv4/netlink.o
  CC      net/ipv4/nexthop.o
  CC      drivers/acpi/acpica/psparse.o
  CC      arch/x86/kernel/tsc_msr.o
  CC      net/ipv6/udp_offload.o
  CC      drivers/input/serio/serport.o
  AR      drivers/net/wireless/admtek/built-in.a
  CC      drivers/input/serio/libps2.o
  CC      drivers/tty/tty_audit.o
  CC      net/ipv6/seg6.o
  AR      drivers/net/wireless/ath/built-in.a
  CC      kernel/pid_namespace.o
  AR      drivers/net/wireless/atmel/built-in.a
  CC      net/ipv6/fib6_notifier.o
  AR      drivers/net/wireless/broadcom/built-in.a
  CC      drivers/pcmcia/pcmcia_resource.o
  CC      net/ipv6/rpl.o
  CC      mm/hugetlb.o
  CC      drivers/gpu/drm/drm_blend.o
  CC      drivers/scsi/scsi_trace.o
  AR      drivers/net/wireless/intel/built-in.a
  CC      net/ipv4/udp_tunnel_stub.o
  AR      drivers/net/wireless/intersil/built-in.a
  CC      net/ipv6/ioam6.o
  CC      net/ipv6/sysctl_net_ipv6.o
  AR      drivers/net/wireless/marvell/built-in.a
  CC      net/ipv6/xfrm6_policy.o
  AR      drivers/net/wireless/mediatek/built-in.a
  CC      drivers/ata/libata-acpi.o
  CC      drivers/ata/libata-pata-timings.o
  CC      arch/x86/kernel/io_delay.o
  AR      drivers/net/wireless/microchip/built-in.a
  CC      fs/nfs/nfs3acl.o
  CC      drivers/acpi/acpica/psscope.o
  AR      drivers/base/built-in.a
  CC      drivers/pcmcia/cistpl.o
  AR      drivers/net/wireless/purelifi/built-in.a
  CC      drivers/net/phy/swphy.o
  AR      drivers/net/ethernet/8390/built-in.a
  AR      drivers/net/ethernet/alacritech/built-in.a
  CC      lib/iomap_copy.o
  AR      drivers/net/wireless/quantenna/built-in.a
  CC      fs/nfs/nfs4proc.o
  AR      drivers/net/ethernet/alteon/built-in.a
  CC      drivers/gpu/drm/i915/i915_suspend.o
  AR      drivers/net/wireless/ralink/built-in.a
  CC      drivers/usb/core/message.o
  CC      drivers/acpi/acpica/pstree.o
  AR      drivers/net/ethernet/amazon/built-in.a
  CC      net/sunrpc/cache.o
  CC      drivers/acpi/acpica/psutils.o
  AR      drivers/net/wireless/realtek/built-in.a
  CC      net/sunrpc/rpc_pipe.o
  CC      drivers/pcmcia/pcmcia_cis.o
  AR      drivers/net/wireless/rsi/built-in.a
  CC      drivers/usb/core/driver.o
  AR      drivers/net/ethernet/amd/built-in.a
  CC      drivers/net/phy/fixed_phy.o
  CC      drivers/gpu/drm/i915/i915_switcheroo.o
  AR      drivers/net/ethernet/aquantia/built-in.a
  CC      arch/x86/kernel/rtc.o
  CC [M]  drivers/gpu/drm/xe/xe_debugfs.o
  AR      drivers/net/wireless/silabs/built-in.a
  CC      net/mac80211/iface.o
  CC      lib/devres.o
  AR      drivers/input/serio/built-in.a
  CC      drivers/gpu/drm/i915/i915_sysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_devcoredump.o
  CC [M]  drivers/gpu/drm/xe/xe_device.o
  AR      drivers/net/wireless/st/built-in.a
  AR      drivers/net/ethernet/arc/built-in.a
  CC      fs/eventfd.o
  AR      drivers/net/ethernet/asix/built-in.a
  AR      drivers/net/wireless/ti/built-in.a
  CC      drivers/tty/sysrq.o
  CC      kernel/stop_machine.o
  AR      drivers/net/wireless/zydas/built-in.a
  AR      drivers/net/ethernet/atheros/built-in.a
  AR      drivers/net/wireless/virtual/built-in.a
  CC      drivers/ata/ahci.o
  CC      kernel/audit.o
  CC      net/mac80211/link.o
  AR      drivers/net/wireless/built-in.a
  AR      drivers/net/ethernet/cadence/built-in.a
  CC      net/ipv4/ip_tunnel.o
  CC      drivers/net/ethernet/broadcom/bnx2.o
  AR      drivers/net/usb/built-in.a
  CC      drivers/net/ethernet/broadcom/tg3.o
  CC      drivers/acpi/processor_core.o
  CC      drivers/acpi/processor_pdc.o
  CC      drivers/gpu/drm/i915/i915_utils.o
  CC      drivers/scsi/scsi_logging.o
  CC      lib/check_signature.o
  AR      drivers/net/ethernet/brocade/built-in.a
  CC      net/ipv6/xfrm6_state.o
  CC      net/ipv6/xfrm6_input.o
  CC      drivers/net/mii.o
  CC      drivers/net/loopback.o
  CC      drivers/ata/libahci.o
  CC      drivers/acpi/acpica/pswalk.o
  CC      lib/interval_tree.o
  CC      net/ipv6/xfrm6_output.o
  CC      drivers/acpi/ec.o
  CC      drivers/pcmcia/rsrc_mgr.o
  CC      net/ipv4/sysctl_net_ipv4.o
  CC      net/ipv4/proc.o
  CC      lib/assoc_array.o
  CC      net/sunrpc/sysfs.o
  CC      drivers/acpi/acpica/psxface.o
  CC      drivers/net/phy/realtek.o
  CC      net/ipv6/xfrm6_protocol.o
  CC      drivers/acpi/acpica/rsaddr.o
  CC      drivers/acpi/dock.o
  CC      drivers/input/keyboard/atkbd.o
  CC      lib/bitrev.o
  CC      drivers/input/mouse/psmouse-base.o
  AR      drivers/input/joystick/built-in.a
  CC      lib/crc-ccitt.o
  AR      drivers/input/tablet/built-in.a
  CC      drivers/gpu/drm/i915/intel_clock_gating.o
  CC      mm/mmu_notifier.o
  CC      drivers/gpu/drm/i915/intel_device_info.o
  CC      drivers/gpu/drm/i915/intel_memory_region.o
  CC      drivers/acpi/pci_root.o
  CC      arch/x86/kernel/resource.o
  CC      drivers/scsi/scsi_pm.o
  AR      drivers/input/touchscreen/built-in.a
  CC      drivers/acpi/acpica/rscalc.o
  AS      arch/x86/kernel/irqflags.o
  CC      drivers/ata/ata_piix.o
  CC      lib/crc16.o
  CC      drivers/gpu/drm/i915/intel_pcode.o
  CC      arch/x86/kernel/static_call.o
  CC      drivers/ata/pata_amd.o
  CC      drivers/acpi/pci_link.o
  CC [M]  drivers/gpu/drm/xe/xe_device_sysfs.o
  AR      drivers/tty/built-in.a
  CC      drivers/usb/core/config.o
  CC [M]  drivers/gpu/drm/xe/xe_dma_buf.o
  CC      drivers/gpu/drm/drm_bridge.o
  CC      net/mac80211/rate.o
  CC      drivers/rtc/lib.o
  CC [M]  drivers/gpu/drm/xe/xe_drm_client.o
  CC [M]  drivers/gpu/drm/xe/xe_exec.o
  CC [M]  drivers/gpu/drm/xe/xe_execlist.o
  CC      drivers/pcmcia/rsrc_nonstatic.o
  CC [M]  drivers/gpu/drm/xe/xe_exec_queue.o
  CC      drivers/gpu/drm/drm_cache.o
  CC      drivers/gpu/drm/drm_client.o
  CC      drivers/gpu/drm/drm_client_modeset.o
  CC      kernel/auditfilter.o
  CC      drivers/usb/core/file.o
  HOSTCC  lib/gen_crc32table
  CC      net/ipv6/netfilter.o
  CC      arch/x86/kernel/process.o
  CC      fs/aio.o
  CC      net/ipv4/fib_rules.o
  CC      drivers/acpi/acpica/rscreate.o
  AR      drivers/net/phy/built-in.a
  CC      net/ipv4/ipmr.o
  CC      lib/xxhash.o
  CC      net/ipv4/ipmr_base.o
  CC      drivers/usb/core/buffer.o
  CC      drivers/rtc/class.o
  AR      drivers/input/keyboard/built-in.a
  CC      drivers/scsi/scsi_bsg.o
  CC      drivers/rtc/interface.o
  CC      drivers/gpu/drm/i915/intel_region_ttm.o
  AR      drivers/input/misc/built-in.a
  CC      drivers/usb/mon/mon_main.o
  CC      net/ipv4/syncookies.o
  CC      drivers/gpu/drm/i915/intel_runtime_pm.o
  CC      drivers/gpu/drm/i915/intel_sbi.o
  CC      drivers/pcmcia/yenta_socket.o
  CC      drivers/input/input.o
  CC      net/sunrpc/svc_xprt.o
  CC      net/mac80211/michael.o
  CC      drivers/gpu/drm/drm_color_mgmt.o
  CC      drivers/acpi/acpica/rsdumpinfo.o
  CC      net/sunrpc/xprtmultipath.o
  CC      lib/genalloc.o
  CC      drivers/i2c/algos/i2c-algo-bit.o
  CC      mm/migrate.o
  CC      drivers/input/input-compat.o
  CC      drivers/input/mouse/synaptics.o
  CC      drivers/scsi/scsi_common.o
  AR      drivers/i3c/built-in.a
  CC      drivers/scsi/scsi_transport_spi.o
  CC      drivers/acpi/pci_irq.o
  CC      drivers/scsi/virtio_scsi.o
  CC      drivers/scsi/sd.o
  CC      drivers/usb/core/sysfs.o
  CC      drivers/acpi/acpi_lpss.o
  CC      drivers/acpi/acpica/rsinfo.o
  CC      drivers/usb/mon/mon_stat.o
  CC      drivers/gpu/drm/drm_connector.o
  CC      drivers/acpi/acpi_apd.o
  CC      drivers/gpu/drm/i915/intel_step.o
  AR      drivers/pcmcia/built-in.a
  CC      drivers/acpi/acpi_platform.o
  CC      drivers/ata/pata_oldpiix.o
  CC      drivers/ata/pata_sch.o
  CC      lib/percpu_counter.o
  CC      kernel/auditsc.o
  CC      arch/x86/kernel/ptrace.o
  CC      drivers/acpi/acpica/rsio.o
  CC      fs/nfs/nfs4xdr.o
  CC      net/mac80211/tkip.o
  CC      fs/nfs/nfs4state.o
  CC      fs/nfs/nfs4renewd.o
  CC      drivers/input/input-mt.o
  CC      drivers/input/input-poller.o
  CC      drivers/gpu/drm/drm_crtc.o
  CC      arch/x86/kernel/tls.o
  CC      drivers/usb/core/endpoint.o
  AR      drivers/net/ethernet/cavium/common/built-in.a
  AR      drivers/net/ethernet/cavium/thunder/built-in.a
  CC      net/ipv6/proc.o
  AR      drivers/net/ethernet/cavium/liquidio/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_force_wake.o
  AR      drivers/net/ethernet/cavium/octeon/built-in.a
  CC      drivers/scsi/sr.o
  CC      lib/audit.o
  AR      drivers/net/ethernet/cavium/built-in.a
  CC      drivers/acpi/acpica/rsirq.o
  CC      drivers/rtc/nvmem.o
  AR      drivers/i2c/algos/built-in.a
  CC      drivers/i2c/busses/i2c-i801.o
  CC      kernel/audit_watch.o
  CC      drivers/ata/pata_mpiix.o
  CC      net/ipv4/tunnel4.o
  CC      mm/page_counter.o
  CC      net/ipv4/ipconfig.o
  AR      drivers/i2c/muxes/built-in.a
  CC      drivers/usb/mon/mon_text.o
  CC      net/ipv4/netfilter.o
  CC      drivers/rtc/dev.o
  CC      drivers/acpi/acpica/rslist.o
  CC      drivers/i2c/i2c-boardinfo.o
  CC      lib/syscall.o
  CC      drivers/acpi/acpica/rsmemory.o
  CC      drivers/acpi/acpi_pnp.o
  CC      drivers/input/ff-core.o
  CC      kernel/audit_fsnotify.o
  CC      drivers/input/mouse/focaltech.o
  CC      net/mac80211/aes_cmac.o
  CC      drivers/gpu/drm/drm_displayid.o
  CC      net/mac80211/aes_gmac.o
  CC      arch/x86/kernel/step.o
  CC      drivers/gpu/drm/i915/intel_uncore.o
  CC      drivers/usb/core/devio.o
  CC      drivers/usb/core/notify.o
  CC      drivers/usb/core/generic.o
  CC      drivers/input/mouse/alps.o
  CC      drivers/input/touchscreen.o
  CC      drivers/acpi/acpica/rsmisc.o
  CC      drivers/input/mouse/byd.o
  CC      mm/hugetlb_cgroup.o
  CC      drivers/scsi/sr_ioctl.o
  CC      mm/early_ioremap.o
  CC      mm/secretmem.o
  CC [M]  drivers/gpu/drm/xe/xe_ggtt.o
  CC      drivers/gpu/drm/drm_drv.o
  CC      drivers/usb/core/quirks.o
  CC      drivers/usb/mon/mon_bin.o
  CC      drivers/usb/core/devices.o
  CC      lib/errname.o
  AR      drivers/net/ethernet/chelsio/built-in.a
  CC      drivers/usb/host/pci-quirks.o
  CC      drivers/rtc/proc.o
  CC      drivers/usb/class/usblp.o
  CC      drivers/usb/storage/scsiglue.o
  CC      drivers/i2c/i2c-core-base.o
  CC      net/ipv6/syncookies.o
  CC      drivers/acpi/power.o
  CC      drivers/usb/host/ehci-hcd.o
  CC      drivers/ata/ata_generic.o
  CC      drivers/usb/storage/protocol.o
  CC      lib/nlattr.o
  CC      net/ipv6/calipso.o
  CC      fs/locks.o
  CC      drivers/input/mouse/logips2pp.o
  CC      drivers/usb/storage/transport.o
  CC      drivers/usb/storage/usb.o
  CC      arch/x86/kernel/i8237.o
  AR      drivers/usb/misc/built-in.a
  CC      kernel/audit_tree.o
  CC      drivers/input/mouse/lifebook.o
  CC      drivers/acpi/acpica/rsserial.o
  AR      drivers/net/ethernet/cisco/built-in.a
  AR      drivers/media/i2c/built-in.a
  AR      drivers/net/ethernet/cortina/built-in.a
  CC      drivers/rtc/sysfs.o
  CC      fs/binfmt_misc.o
  AR      drivers/pps/clients/built-in.a
  CC      drivers/scsi/sr_vendor.o
  AR      drivers/media/tuners/built-in.a
  CC      drivers/input/ff-memless.o
  AR      drivers/pps/generators/built-in.a
  CC      drivers/input/sparse-keymap.o
  CC      drivers/input/vivaldi-fmap.o
  AR      drivers/media/rc/keymaps/built-in.a
  AR      drivers/i2c/busses/built-in.a
  CC      drivers/pps/pps.o
  AR      drivers/media/rc/built-in.a
  CC      drivers/input/input-leds.o
  CC      drivers/input/evdev.o
  CC      drivers/usb/early/ehci-dbgp.o
  CC      drivers/i2c/i2c-core-smbus.o
  CC      arch/x86/kernel/stacktrace.o
  CC      drivers/input/mouse/trackpoint.o
  CC      net/sunrpc/stats.o
  CC      drivers/i2c/i2c-core-acpi.o
  AR      drivers/media/common/b2c2/built-in.a
  CC      fs/binfmt_script.o
  AR      drivers/media/common/saa7146/built-in.a
  CC      kernel/kprobes.o
  AR      drivers/media/common/siano/built-in.a
  CC      drivers/acpi/acpica/rsutils.o
  CC [M]  drivers/gpu/drm/xe/xe_gpu_scheduler.o
  CC      mm/hmm.o
  AR      drivers/media/common/v4l2-tpg/built-in.a
  HOSTCC  drivers/gpu/drm/xe/xe_gen_wa_oob
  CC      mm/memfd.o
  CC      drivers/pps/kapi.o
  AR      drivers/media/common/videobuf2/built-in.a
  AR      drivers/usb/mon/built-in.a
  AR      drivers/media/common/built-in.a
  CC      net/sunrpc/sysctl.o
  AR      drivers/usb/class/built-in.a
  CC      mm/ptdump.o
  AR      drivers/net/ethernet/dec/tulip/built-in.a
  CC      drivers/gpu/drm/drm_dumb_buffers.o
  CC      net/mac80211/fils_aead.o
  CC      net/ipv4/tcp_cubic.o
  AR      drivers/media/platform/allegro-dvt/built-in.a
  CC      drivers/i2c/i2c-smbus.o
  AR      drivers/net/ethernet/dlink/built-in.a
  AR      drivers/net/ethernet/dec/built-in.a
  CC      net/mac80211/cfg.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc_proxy.o
  CC      drivers/usb/host/ehci-pci.o
  AR      drivers/ata/built-in.a
  CC      drivers/rtc/rtc-mc146818-lib.o
  CC      drivers/ptp/ptp_clock.o
  CC      kernel/seccomp.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc_submit.o
  AR      drivers/media/platform/amlogic/meson-ge2d/built-in.a
  AR      drivers/media/platform/amlogic/built-in.a
  CC      drivers/pps/sysfs.o
  CC      drivers/ptp/ptp_chardev.o
  CC      drivers/ptp/ptp_sysfs.o
  AR      drivers/media/platform/amphion/built-in.a
  CC      arch/x86/kernel/reboot.o
  CC      drivers/usb/host/ohci-hcd.o
  AR      drivers/media/platform/aspeed/built-in.a
  CC      net/mac80211/ethtool.o
  AR      drivers/media/platform/atmel/built-in.a
  CC      drivers/acpi/event.o
  CC      lib/cpu_rmap.o
  AR      drivers/media/platform/cadence/built-in.a
  CC      drivers/usb/storage/initializers.o
  CC      lib/dynamic_queue_limits.o
  CC      drivers/acpi/acpica/rsxface.o
  AR      drivers/media/platform/chips-media/coda/built-in.a
  AR      drivers/media/platform/chips-media/wave5/built-in.a
  CC      drivers/gpu/drm/i915/intel_wakeref.o
  CC      drivers/input/mouse/cypress_ps2.o
  CC      drivers/usb/host/ohci-pci.o
  CC      drivers/gpu/drm/i915/vlv_sideband.o
  CC      drivers/usb/host/uhci-hcd.o
  AR      drivers/media/platform/chips-media/built-in.a
  CC      drivers/scsi/sg.o
  AR      drivers/usb/early/built-in.a
  AR      drivers/media/platform/intel/built-in.a
  CC      lib/glob.o
  CC      kernel/relay.o
  AR      net/wireless/built-in.a
  CC      net/mac80211/rx.o
  AR      drivers/media/platform/marvell/built-in.a
  AR      drivers/media/platform/mediatek/jpeg/built-in.a
  AR      drivers/pps/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt.o
  CC      kernel/utsname_sysctl.o
  CC      drivers/ptp/ptp_vclock.o
  AR      drivers/media/platform/microchip/built-in.a
  AR      drivers/media/platform/mediatek/mdp/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_ccs_mode.o
  AR      drivers/media/platform/nuvoton/built-in.a
  CC      arch/x86/kernel/msr.o
  CC      drivers/gpu/drm/i915/vlv_suspend.o
  AR      drivers/media/pci/ttpci/built-in.a
  AR      drivers/media/usb/b2c2/built-in.a
  CC      drivers/acpi/evged.o
  AR      drivers/media/platform/mediatek/vcodec/common/built-in.a
  AR      drivers/media/pci/b2c2/built-in.a
  CC      drivers/gpu/drm/i915/soc/intel_dram.o
  AR      drivers/media/usb/dvb-usb/built-in.a
  AR      drivers/media/platform/mediatek/vcodec/encoder/built-in.a
  CC      kernel/delayacct.o
  AR      drivers/media/usb/dvb-usb-v2/built-in.a
  AR      drivers/i2c/built-in.a
  CC      kernel/taskstats.o
  AR      drivers/media/pci/pluto2/built-in.a
  CC      drivers/usb/core/phy.o
  AR      drivers/media/platform/mediatek/vcodec/decoder/built-in.a
  CC      drivers/acpi/acpica/tbdata.o
  CC      kernel/tsacct.o
  CC      drivers/input/mouse/psmouse-smbus.o
  AR      mm/built-in.a
  CC      drivers/gpu/drm/i915/soc/intel_gmch.o
  AR      drivers/media/platform/mediatek/vcodec/built-in.a
  AR      drivers/media/usb/s2255/built-in.a
  AR      drivers/media/pci/dm1105/built-in.a
  CC      net/ipv6/ah6.o
  CC      kernel/tracepoint.o
  AR      drivers/media/usb/siano/built-in.a
  AR      drivers/net/ethernet/emulex/built-in.a
  AR      drivers/media/pci/pt1/built-in.a
  AR      drivers/media/platform/mediatek/vpu/built-in.a
  AR      drivers/media/pci/pt3/built-in.a
  AR      drivers/media/usb/ttusb-budget/built-in.a
  CC      kernel/irq_work.o
  AR      drivers/media/pci/mantis/built-in.a
  AR      drivers/media/platform/mediatek/mdp3/built-in.a
  CC      net/mac80211/spectmgmt.o
  AR      drivers/media/usb/ttusb-dec/built-in.a
  AR      drivers/media/platform/mediatek/built-in.a
  AR      drivers/media/pci/ngene/built-in.a
  AR      drivers/media/usb/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_clock.o
  AR      drivers/media/pci/ddbridge/built-in.a
  CC      drivers/usb/host/xhci.o
  CC      lib/strncpy_from_user.o
  CC      drivers/rtc/rtc-cmos.o
  CC      drivers/power/supply/power_supply_core.o
  AR      drivers/media/pci/saa7146/built-in.a
  CC      drivers/hwmon/hwmon.o
  CC      drivers/power/supply/power_supply_sysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_debugfs.o
  AR      drivers/media/platform/nvidia/tegra-vde/built-in.a
  CC      drivers/power/supply/power_supply_leds.o
  AR      drivers/media/pci/smipcie/built-in.a
  CC      drivers/usb/storage/sierra_ms.o
  AR      drivers/media/platform/nvidia/built-in.a
  AR      drivers/media/pci/netup_unidvb/built-in.a
  CC      drivers/power/supply/power_supply_hwmon.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_freq.o
  CC      arch/x86/kernel/cpuid.o
  AR      drivers/media/pci/intel/ipu3/built-in.a
  AR      drivers/media/platform/nxp/dw100/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_idle.o
  AR      drivers/media/pci/intel/ivsc/built-in.a
  AR      drivers/media/pci/intel/built-in.a
  AR      drivers/media/platform/nxp/imx-jpeg/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_mcr.o
  CC      drivers/scsi/scsi_sysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_pagefault.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sysfs.o
  CC      net/ipv4/tcp_sigpool.o
  CC      lib/strnlen_user.o
  AR      drivers/media/pci/built-in.a
  CC      drivers/acpi/acpica/tbfadt.o
  AR      drivers/media/platform/nxp/imx8-isi/built-in.a
  AR      drivers/media/platform/nxp/built-in.a
  AR      drivers/input/mouse/built-in.a
  CC      fs/nfs/nfs4super.o
  CC      drivers/usb/core/port.o
  AR      drivers/input/built-in.a
  AR      net/sunrpc/built-in.a
  AR      drivers/media/platform/qcom/camss/built-in.a
  AR      drivers/media/platform/renesas/rcar-vin/built-in.a
  CC      net/mac80211/tx.o
  AR      drivers/media/mmc/siano/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.o
  CC      lib/net_utils.o
  CC      drivers/ptp/ptp_kvm_x86.o
  AR      drivers/media/mmc/built-in.a
  AR      drivers/media/platform/qcom/venus/built-in.a
  AR      drivers/media/platform/renesas/rzg2l-cru/built-in.a
  CC      lib/sg_pool.o
  AR      drivers/media/platform/qcom/built-in.a
  CC      drivers/ptp/ptp_kvm_common.o
  AR      drivers/media/platform/renesas/vsp1/built-in.a
  AR      drivers/media/firewire/built-in.a
  CC      arch/x86/kernel/early-quirks.o
  AR      drivers/thermal/broadcom/built-in.a
  AR      drivers/media/platform/renesas/built-in.a
  CC      fs/nfs/nfs4file.o
  AR      drivers/watchdog/built-in.a
  CC      drivers/md/md.o
  AR      drivers/thermal/samsung/built-in.a
  CC      drivers/usb/storage/option_ms.o
  CC      fs/binfmt_elf.o
  CC      drivers/net/netconsole.o
  CC      drivers/thermal/intel/intel_tcc.o
  CC      drivers/thermal/intel/therm_throt.o
  AR      drivers/media/spi/built-in.a
  CC      drivers/cpufreq/cpufreq.o
  AR      drivers/media/test-drivers/built-in.a
  AR      drivers/power/supply/built-in.a
  AR      drivers/media/platform/rockchip/rga/built-in.a
  CC      drivers/cpuidle/governors/menu.o
  CC      drivers/cpufreq/freq_table.o
  AR      drivers/power/built-in.a
  AR      drivers/media/platform/rockchip/rkisp1/built-in.a
  AR      drivers/mmc/built-in.a
  CC      drivers/acpi/acpica/tbfind.o
  AR      drivers/media/platform/rockchip/built-in.a
  CC      fs/mbcache.o
  CC      fs/posix_acl.o
  CC      drivers/cpuidle/cpuidle.o
  AR      drivers/media/platform/st/sti/bdisp/built-in.a
  AR      drivers/media/platform/samsung/exynos-gsc/built-in.a
  CC      drivers/cpuidle/driver.o
  AR      drivers/rtc/built-in.a
  AR      drivers/media/platform/st/sti/c8sectpfe/built-in.a
  CC      drivers/cpuidle/governor.o
  CC      kernel/static_call.o
  AR      drivers/media/platform/samsung/exynos4-is/built-in.a
  CC      drivers/usb/core/hcd-pci.o
  AR      drivers/media/platform/st/sti/delta/built-in.a
  AR      drivers/media/platform/samsung/s5p-g2d/built-in.a
  AR      drivers/media/platform/samsung/s3c-camif/built-in.a
  AR      drivers/media/platform/st/sti/hva/built-in.a
  CC      drivers/usb/core/usb-acpi.o
  AR      drivers/media/platform/samsung/s5p-jpeg/built-in.a
  AR      drivers/hwmon/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o
  AR      drivers/media/platform/st/stm32/built-in.a
  CC [M]  drivers/thermal/intel/x86_pkg_temp_thermal.o
  CC      net/ipv4/cipso_ipv4.o
  AR      drivers/media/platform/samsung/s5p-mfc/built-in.a
  CC      drivers/acpi/acpica/tbinstal.o
  CC      drivers/cpuidle/governors/haltpoll.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_topology.o
  AR      drivers/media/platform/st/built-in.a
  CC      drivers/gpu/drm/i915/soc/intel_pch.o
  AR      drivers/media/platform/samsung/built-in.a
  CC      net/ipv6/esp6.o
  AR      drivers/media/platform/sunxi/sun4i-csi/built-in.a
  CC      kernel/padata.o
  CC      fs/nfs/delegation.o
  CC      arch/x86/kernel/smp.o
  CC      drivers/acpi/acpica/tbprint.o
  AR      drivers/media/platform/sunxi/sun6i-csi/built-in.a
  CC      arch/x86/kernel/smpboot.o
  AR      drivers/media/platform/sunxi/sun6i-mipi-csi2/built-in.a
  CC      drivers/gpu/drm/i915/i915_memcpy.o
  AR      drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/built-in.a
  CC      fs/coredump.o
  AR      drivers/media/platform/sunxi/sun8i-di/built-in.a
  CC      lib/stackdepot.o
  CC      drivers/md/md-bitmap.o
  CC      kernel/jump_label.o
  CC      drivers/md/md-autodetect.o
  AR      drivers/net/ethernet/broadcom/built-in.a
  AR      drivers/media/platform/sunxi/sun8i-rotate/built-in.a
  AR      drivers/ptp/built-in.a
  CC      drivers/cpufreq/cpufreq_performance.o
  CC      kernel/context_tracking.o
  CC      fs/nfs/nfs4idmap.o
  CC      kernel/iomem.o
  GEN     xe_wa_oob.c xe_wa_oob.h
  AR      drivers/media/platform/sunxi/built-in.a
  CC      arch/x86/kernel/tsc_sync.o
  AR      drivers/net/ethernet/engleder/built-in.a
  CC      arch/x86/kernel/setup_percpu.o
  CC      kernel/rseq.o
  CC      drivers/md/dm.o
  AR      drivers/net/ethernet/ezchip/built-in.a
  CC      drivers/usb/storage/usual-tables.o
  AR      drivers/net/ethernet/fujitsu/built-in.a
  CC      drivers/md/dm-table.o
  AR      drivers/media/platform/ti/am437x/built-in.a
  AR      drivers/net/ethernet/fungible/built-in.a
  CC      drivers/md/dm-target.o
  CC      net/ipv4/xfrm4_policy.o
  AR      drivers/media/platform/ti/cal/built-in.a
  CC      arch/x86/kernel/mpparse.o
  CC      drivers/acpi/acpica/tbutils.o
  AR      drivers/net/ethernet/google/built-in.a
  AR      drivers/media/platform/ti/vpe/built-in.a
  CC      drivers/gpu/drm/drm_edid.o
  AR      drivers/net/ethernet/huawei/built-in.a
  AR      drivers/media/platform/ti/davinci/built-in.a
  CC      drivers/acpi/acpica/tbxface.o
  AR      drivers/scsi/built-in.a
  CC      drivers/cpufreq/cpufreq_userspace.o
  CC      drivers/usb/host/xhci-mem.o
  CC      lib/asn1_decoder.o
  CC      drivers/net/ethernet/intel/e1000/e1000_main.o
  AR      drivers/media/platform/ti/j721e-csi2rx/built-in.a
  GEN     lib/oid_registry_data.c
  AR      drivers/thermal/intel/built-in.a
  AR      drivers/media/platform/ti/omap/built-in.a
  AR      drivers/ufs/built-in.a
  AR      drivers/thermal/st/built-in.a
  AR      drivers/media/platform/verisilicon/built-in.a
  AR      drivers/media/platform/ti/omap3isp/built-in.a
  CC      drivers/usb/host/xhci-ext-caps.o
  AR      drivers/media/platform/ti/built-in.a
  AR      drivers/thermal/qcom/built-in.a
  AR      drivers/thermal/tegra/built-in.a
  CC      drivers/cpuidle/sysfs.o
  AR      drivers/usb/core/built-in.a
  AR      drivers/thermal/mediatek/built-in.a
  CC      drivers/cpuidle/poll_state.o
  CC      drivers/gpu/drm/i915/i915_mm.o
  AR      drivers/media/platform/via/built-in.a
  CC      drivers/thermal/thermal_core.o
  AR      drivers/net/ethernet/i825xx/built-in.a
  AR      drivers/media/platform/xilinx/built-in.a
  AR      drivers/net/ethernet/microsoft/built-in.a
  CC      arch/x86/kernel/trace_clock.o
  CC      arch/x86/kernel/trace.o
  CC      net/ipv6/sit.o
  CC      drivers/thermal/thermal_sysfs.o
  AR      drivers/media/platform/built-in.a
  CC      drivers/usb/host/xhci-ring.o
  CC      drivers/gpu/drm/i915/i915_sw_fence.o
  AR      drivers/net/ethernet/litex/built-in.a
  CC      net/mac80211/key.o
  CC      drivers/gpu/drm/i915/i915_sw_fence_work.o
  CC      lib/ucs2_string.o
  CC      lib/sbitmap.o
  CC      drivers/usb/host/xhci-hub.o
  AR      drivers/usb/storage/built-in.a
  CC      drivers/acpi/acpica/tbxfload.o
  CC      drivers/thermal/thermal_trip.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_ct.o
  CC      drivers/gpu/drm/i915/i915_syncmap.o
  CC      drivers/gpu/drm/i915/i915_user_extensions.o
  AR      drivers/net/ethernet/marvell/octeon_ep/built-in.a
  AR      drivers/leds/trigger/built-in.a
  CC      net/ipv6/addrconf_core.o
  CC      drivers/acpi/acpica/tbxfroot.o
  AR      drivers/media/built-in.a
  AR      drivers/net/ethernet/marvell/octeon_ep_vf/built-in.a
  AR      drivers/leds/blink/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_guc_db_mgr.o
  CC      drivers/thermal/thermal_helpers.o
  CC      drivers/cpufreq/cpufreq_ondemand.o
  AR      drivers/net/ethernet/marvell/octeontx2/built-in.a
  AR      drivers/leds/simple/built-in.a
  CC      drivers/leds/led-core.o
  AR      drivers/cpuidle/governors/built-in.a
  AR      drivers/net/ethernet/marvell/prestera/built-in.a
  CC      drivers/leds/led-class.o
  CC      net/ipv6/exthdrs_core.o
  CC      drivers/net/ethernet/marvell/sky2.o
  CC      drivers/gpu/drm/drm_eld.o
  AR      kernel/built-in.a
  CC      drivers/gpu/drm/drm_encoder.o
  CC      net/ipv6/ip6_checksum.o
  CC      net/ipv6/ip6_icmp.o
  CC      drivers/thermal/thermal_hwmon.o
  CC      drivers/gpu/drm/drm_file.o
  CC      net/ipv4/xfrm4_state.o
  CC      drivers/cpuidle/cpuidle-haltpoll.o
  CC      drivers/gpu/drm/i915/i915_debugfs.o
  CC      drivers/thermal/gov_step_wise.o
  AR      drivers/net/ethernet/mellanox/built-in.a
  CC      fs/nfs/callback.o
  AR      drivers/net/ethernet/micrel/built-in.a
  AR      drivers/net/ethernet/microchip/built-in.a
  CC      fs/nfs/callback_xdr.o
  CC      drivers/gpu/drm/i915/i915_debugfs_params.o
  AR      drivers/net/ethernet/mscc/built-in.a
  CC      fs/drop_caches.o
  CC      drivers/usb/host/xhci-dbg.o
  CC      drivers/leds/led-triggers.o
  CC      drivers/md/dm-linear.o
  AR      drivers/firmware/arm_ffa/built-in.a
  CC      arch/x86/kernel/rethook.o
  CC      drivers/usb/host/xhci-trace.o
  AR      drivers/crypto/stm32/built-in.a
  CC      drivers/md/dm-stripe.o
  AR      drivers/crypto/xilinx/built-in.a
  CC      drivers/usb/host/xhci-debugfs.o
  AR      drivers/firmware/arm_scmi/built-in.a
  CC      drivers/acpi/acpica/utaddress.o
  AR      drivers/crypto/hisilicon/built-in.a
  CC      drivers/clocksource/acpi_pm.o
  CC      drivers/acpi/acpica/utalloc.o
  AR      drivers/firmware/broadcom/built-in.a
  CC      drivers/clocksource/i8253.o
  AR      drivers/firmware/cirrus/built-in.a
  AR      drivers/crypto/intel/keembay/built-in.a
  AR      drivers/crypto/intel/ixp4xx/built-in.a
  AR      drivers/firmware/meson/built-in.a
  AR      drivers/firmware/microchip/built-in.a
  AR      drivers/crypto/intel/built-in.a
  CC      lib/group_cpus.o
  CC      drivers/cpufreq/cpufreq_governor.o
  CC      lib/fw_table.o
  CC      fs/nfs/callback_proc.o
  AR      drivers/crypto/starfive/built-in.a
  CC      fs/sysctls.o
  AR      drivers/crypto/built-in.a
  CC      arch/x86/kernel/vmcore_info_32.o
  AR      drivers/cpuidle/built-in.a
  CC      net/ipv6/output_core.o
  CC      net/ipv6/protocol.o
  CC      drivers/firmware/efi/libstub/efi-stub-helper.o
  CC      drivers/hid/usbhid/hid-core.o
  CC      drivers/md/dm-ioctl.o
  CC      drivers/hid/usbhid/hiddev.o
  CC      drivers/hid/usbhid/hid-pidff.o
  CC      net/ipv4/xfrm4_input.o
  CC      drivers/firmware/efi/efi-bgrt.o
  CC      drivers/firmware/efi/efi.o
  CC      drivers/gpu/drm/drm_fourcc.o
  CC      drivers/thermal/gov_user_space.o
  CC      drivers/acpi/sysfs.o
  CC      drivers/acpi/acpica/utascii.o
  AR      drivers/firmware/imx/built-in.a
  CC      drivers/acpi/property.o
  CC      drivers/net/virtio_net.o
  CC      drivers/acpi/acpi_cmos_rtc.o
  AR      lib/lib.a
  AR      drivers/leds/built-in.a
  GEN     lib/crc32table.h
  CC      drivers/acpi/x86/apple.o
  CC      lib/oid_registry.o
  CC      drivers/hid/hid-core.o
  CC      drivers/hid/hid-input.o
  CC      net/ipv4/xfrm4_output.o
  AR      drivers/net/ethernet/myricom/built-in.a
  CC      drivers/usb/host/xhci-pci.o
  AR      drivers/clocksource/built-in.a
  CC      drivers/acpi/x86/utils.o
  AR      drivers/net/ethernet/natsemi/built-in.a
  CC      net/ipv4/xfrm4_protocol.o
  AR      drivers/firmware/psci/built-in.a
  CC      drivers/firmware/efi/libstub/gop.o
  CC      drivers/firmware/efi/libstub/secureboot.o
  CC      drivers/cpufreq/cpufreq_governor_attr_set.o
  AR      drivers/firmware/qcom/built-in.a
  CC      drivers/firmware/efi/libstub/tpm.o
  CC      drivers/firmware/efi/libstub/file.o
  CC      drivers/acpi/acpica/utbuffer.o
  AR      drivers/platform/x86/amd/built-in.a
  CC      arch/x86/kernel/machine_kexec_32.o
  AR      drivers/platform/surface/built-in.a
  CC      drivers/cpufreq/acpi-cpufreq.o
  CC      lib/crc32.o
  CC      drivers/firmware/efi/libstub/mem.o
  AR      drivers/platform/x86/intel/built-in.a
  CC      drivers/firmware/efi/libstub/random.o
  CC      drivers/platform/x86/wmi.o
  AR      drivers/thermal/built-in.a
  CC      drivers/hid/hid-quirks.o
  CC      drivers/firmware/efi/libstub/randomalloc.o
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs_params.c: In function ‘i915_debugfs_create_int’:
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs_params.c:213:9: error: implicit declaration of function ‘debugfs_create_file_unsafe’; did you mean ‘sysfs_create_file_ns’? [-Werror=implicit-function-declaration]
  213 |  return debugfs_create_file_unsafe(name, mode, parent, value,
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
      |         sysfs_create_file_ns
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs_params.c:213:9: error: returning ‘int’ from a function with return type ‘struct dentry *’ makes pointer from integer without a cast [-Werror=int-conversion]
  213 |  return debugfs_create_file_unsafe(name, mode, parent, value,
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  214 |        RO(mode) ? &i915_param_int_fops_ro :
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  215 |        &i915_param_int_fops);
      |        ~~~~~~~~~~~~~~~~~~~~~
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs_params.c: In function ‘i915_debugfs_create_uint’:
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs_params.c:222:9: error: returning ‘int’ from a function with return type ‘struct dentry *’ makes pointer from integer without a cast [-Werror=int-conversion]
  222 |  return debugfs_create_file_unsafe(name, mode, parent, value,
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  223 |        RO(mode) ? &i915_param_uint_fops_ro :
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  224 |        &i915_param_uint_fops);
      |        ~~~~~~~~~~~~~~~~~~~~~~
  CC      fs/fhandle.o
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs_params.c: In function ‘i915_debugfs_create_charp’:
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs_params.c:231:9: error: implicit declaration of function ‘debugfs_create_file’; did you mean ‘bus_create_file’? [-Werror=implicit-function-declaration]
  231 |  return debugfs_create_file(name, mode, parent, value,
      |         ^~~~~~~~~~~~~~~~~~~
      |         bus_create_file
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs_params.c:231:9: error: returning ‘int’ from a function with return type ‘struct dentry *’ makes pointer from integer without a cast [-Werror=int-conversion]
  231 |  return debugfs_create_file(name, mode, parent, value,
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  232 |        RO(mode) ? &i915_param_charp_fops_ro :
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  233 |        &i915_param_charp_fops);
      |        ~~~~~~~~~~~~~~~~~~~~~~~
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs_params.c: In function ‘i915_debugfs_params’:
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs_params.c:254:8: error: implicit declaration of function ‘debugfs_create_dir’; did you mean ‘kernfs_create_dir’? [-Werror=implicit-function-declaration]
  254 |  dir = debugfs_create_dir("i915_params", minor->debugfs_root);
      |        ^~~~~~~~~~~~~~~~~~
      |        kernfs_create_dir
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs_params.c:254:6: error: assignment to ‘struct dentry *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
  254 |  dir = debugfs_create_dir("i915_params", minor->debugfs_root);
      |      ^
  CC      drivers/net/net_failover.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_debugfs.o
  CC      drivers/platform/x86/wmi-bmof.o
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs_params.c:240:14: error: ‘debugfs_create_bool’ undeclared (first use in this function); did you mean ‘kernfs_create_root’?
  240 |      bool *: debugfs_create_bool,  \
      |              ^~~~~~~~~~~~~~~~~~~
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs_params.c:264:43: note: in expansion of macro ‘_i915_param_create_file’
  264 | #define REGISTER(T, x, unused, mode, ...) _i915_param_create_file(dir, #x, mode, &params->x);
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~
/workspace/kernel/drivers/gpu/drm/i915/i915_params.h:49:2: note: in expansion of macro ‘REGISTER’
   49 |  param(int, modeset, -1, 0400) \
      |  ^~~~~
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs_params.c:265:2: note: in expansion of macro ‘I915_PARAMS_FOR_EACH’
  265 |  I915_PARAMS_FOR_EACH(REGISTER);
      |  ^~~~~~~~~~~~~~~~~~~~
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs_params.c:240:14: note: each undeclared identifier is reported only once for each function it appears in
  240 |      bool *: debugfs_create_bool,  \
      |              ^~~~~~~~~~~~~~~~~~~
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs_params.c:264:43: note: in expansion of macro ‘_i915_param_create_file’
  264 | #define REGISTER(T, x, unused, mode, ...) _i915_param_create_file(dir, #x, mode, &params->x);
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~
/workspace/kernel/drivers/gpu/drm/i915/i915_params.h:49:2: note: in expansion of macro ‘REGISTER’
   49 |  param(int, modeset, -1, 0400) \
      |  ^~~~~
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs_params.c:265:2: note: in expansion of macro ‘I915_PARAMS_FOR_EACH’
  265 |  I915_PARAMS_FOR_EACH(REGISTER);
      |  ^~~~~~~~~~~~~~~~~~~~
At top level:
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs_params.c:228:1: error: ‘i915_debugfs_create_charp’ defined but not used [-Werror=unused-function]
  228 | i915_debugfs_create_charp(const char *name, umode_t mode,
      | ^~~~~~~~~~~~~~~~~~~~~~~~~
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs_params.c:219:1: error: ‘i915_debugfs_create_uint’ defined but not used [-Werror=unused-function]
  219 | i915_debugfs_create_uint(const char *name, umode_t mode,
      | ^~~~~~~~~~~~~~~~~~~~~~~~
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs_params.c:210:1: error: ‘i915_debugfs_create_int’ defined but not used [-Werror=unused-function]
  210 | i915_debugfs_create_int(const char *name, umode_t mode,
      | ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[6]: *** [/workspace/kernel/scripts/Makefile.build:244: drivers/gpu/drm/i915/i915_debugfs_params.o] Error 1
make[6]: *** Waiting for unfinished jobs....
  CC      drivers/md/dm-io.o
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs.c: In function ‘i915_debugfs_register’:
/workspace/kernel/drivers/gpu/drm/i915/i915_debugfs.c:739:2: error: implicit declaration of function ‘debugfs_create_file’; did you mean ‘bus_create_file’? [-Werror=implicit-function-declaration]
  739 |  debugfs_create_file("i915_forcewake_user", S_IRUSR, minor->debugfs_root,
      |  ^~~~~~~~~~~~~~~~~~~
      |  bus_create_file
  CC      drivers/firmware/efi/libstub/pci.o
  CC      drivers/firmware/efi/vars.o
  CC      drivers/firmware/efi/libstub/skip_spaces.o
  CC      drivers/acpi/acpica/utcksum.o
  CC      fs/nfs/nfs4namespace.o
  CC      fs/nfs/nfs4getroot.o
  CC      drivers/acpi/x86/s2idle.o
  CC      drivers/acpi/acpica/utcopy.o
  CC      net/ipv6/ip6_offload.o
  CC      drivers/acpi/acpica/utexcep.o
  AS      arch/x86/kernel/relocate_kernel_32.o
cc1: all warnings being treated as errors
make[6]: *** [/workspace/kernel/scripts/Makefile.build:244: drivers/gpu/drm/i915/i915_debugfs.o] Error 1
make[5]: *** [/workspace/kernel/scripts/Makefile.build:485: drivers/gpu/drm/i915] Error 2
make[5]: *** Waiting for unfinished jobs....
  CC      arch/x86/kernel/crash_dump_32.o
  CC      drivers/platform/x86/eeepc-laptop.o
  CC      drivers/platform/x86/p2sb.o
  CC      fs/nfs/nfs4client.o
  CC      arch/x86/kernel/crash.o
  CC      drivers/firmware/efi/libstub/lib-cmdline.o
  CC      drivers/net/ethernet/intel/e1000/e1000_hw.o
  CC      drivers/firmware/efi/libstub/lib-ctype.o
  CC      drivers/net/ethernet/intel/e1000/e1000_ethtool.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_hwconfig.o
  CC      drivers/net/ethernet/intel/e1000/e1000_param.o
  CC      fs/nfs/nfs4session.o
  CC      drivers/hid/hid-debug.o
  AR      drivers/net/ethernet/neterion/built-in.a
  AR      drivers/net/ethernet/netronome/built-in.a
  AR      lib/built-in.a
  CC      drivers/hid/hidraw.o
  CC      drivers/hid/hid-generic.o
  AR      drivers/net/ethernet/ni/built-in.a
  CC      drivers/firmware/efi/libstub/alignedmem.o
  CC      drivers/cpufreq/amd-pstate.o
  CC      drivers/hid/hid-a4tech.o
  CC      drivers/acpi/acpica/utdebug.o
  CC      drivers/firmware/efi/reboot.o
  CC      drivers/net/ethernet/nvidia/forcedeth.o
  CC      drivers/acpi/acpica/utdecode.o
  CC      drivers/acpi/acpica/utdelete.o
  CC      drivers/net/ethernet/intel/e1000e/82571.o
  CC      drivers/hid/hid-apple.o
  CC      net/ipv6/tcpv6_offload.o
  CC      drivers/net/ethernet/intel/e100.o
  CC      drivers/net/ethernet/intel/e1000e/ich8lan.o
  CC      drivers/cpufreq/amd-pstate-trace.o
  CC      drivers/net/ethernet/intel/e1000e/80003es2lan.o
  CC      drivers/acpi/debugfs.o
  AR      net/ipv4/built-in.a
  CC      drivers/net/ethernet/intel/e1000e/mac.o
  CC      drivers/md/dm-kcopyd.o
  AR      drivers/hid/usbhid/built-in.a
  CC      drivers/acpi/acpica/uterror.o
  CC      drivers/acpi/acpi_lpat.o
  CC      drivers/md/dm-sysfs.o
  CC      drivers/acpi/acpi_pcc.o
  CC      drivers/acpi/ac.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_id_mgr.o
  AR      drivers/usb/host/built-in.a
  AR      drivers/usb/built-in.a
  CC      drivers/acpi/button.o
  CC      drivers/md/dm-stats.o
  CC      drivers/net/ethernet/intel/e1000e/manage.o
  CC      drivers/md/dm-rq.o
  AR      drivers/net/ethernet/oki-semi/built-in.a
  CC      arch/x86/kernel/module.o
  CC      net/ipv6/exthdrs_offload.o
  CC      net/ipv6/inet6_hashtables.o
  CC      net/ipv6/mcast_snoop.o
  AR      drivers/net/ethernet/marvell/built-in.a
  CC      drivers/acpi/acpica/uteval.o
  CC      fs/nfs/dns_resolve.o
  CC      fs/nfs/nfs4trace.o
  CC      fs/nfs/nfs4sysctl.o
  CC      drivers/firmware/efi/libstub/relocate.o
  CC      drivers/md/dm-io-rewind.o
  AR      drivers/platform/x86/built-in.a
  AR      drivers/platform/built-in.a
  CC      arch/x86/kernel/doublefault_32.o
  CC      drivers/acpi/acpica/utglobal.o
  CC      drivers/mailbox/mailbox.o
  CC      drivers/firmware/efi/libstub/printk.o
  CC      drivers/hid/hid-belkin.o
  CC      drivers/acpi/fan_core.o
  CC      drivers/md/dm-builtin.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_klv_helpers.o
  CC      net/mac80211/util.o
  CC      drivers/cpufreq/intel_pstate.o
  CC      drivers/net/ethernet/intel/e1000e/nvm.o
  AR      drivers/net/ethernet/packetengines/built-in.a
  AR      drivers/net/ethernet/qlogic/built-in.a
  CC      drivers/net/ethernet/intel/e1000e/phy.o
  CC      arch/x86/kernel/early_printk.o
  CC      drivers/acpi/acpica/uthex.o
  AR      drivers/net/ethernet/qualcomm/emac/built-in.a
  CC      drivers/acpi/acpica/utids.o
  CC      drivers/md/dm-raid1.o
  AR      drivers/net/ethernet/qualcomm/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_guc_log.o
  CC      drivers/hid/hid-cherry.o
  CC      net/mac80211/parse.o
  CC      net/mac80211/wme.o
  CC      net/mac80211/chan.o
  CC      arch/x86/kernel/hpet.o
  CC      net/mac80211/trace.o
  CC      drivers/net/ethernet/intel/e1000e/param.o
  CC      drivers/net/ethernet/intel/e1000e/ethtool.o
  CC      drivers/mailbox/pcc.o
  CC      drivers/firmware/efi/memattr.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_pc.o
  CC      drivers/firmware/efi/tpm.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_submit.o
  CC      drivers/net/ethernet/realtek/8139too.o
  CC [M]  drivers/gpu/drm/xe/xe_heci_gsc.o
  CC      drivers/net/ethernet/realtek/r8169_main.o
  CC      arch/x86/kernel/amd_nb.o
  CC      drivers/net/ethernet/realtek/r8169_firmware.o
  CC      drivers/acpi/acpica/utinit.o
  AR      drivers/firmware/smccc/built-in.a
  CC      arch/x86/kernel/kvm.o
  AR      drivers/firmware/tegra/built-in.a
  CC      drivers/firmware/efi/memmap.o
  CC      drivers/firmware/efi/capsule.o
  CC      arch/x86/kernel/kvmclock.o
  CC      drivers/firmware/efi/esrt.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine.o
  CC      drivers/net/ethernet/intel/e1000e/netdev.o
  CC      drivers/firmware/efi/libstub/vsprintf.o
  CC      drivers/net/ethernet/intel/e1000e/ptp.o
  AR      drivers/net/ethernet/renesas/built-in.a
  AR      drivers/net/ethernet/intel/e1000/built-in.a
  CC      drivers/firmware/efi/runtime-wrappers.o
  CC      drivers/acpi/fan_attr.o
  CC      drivers/firmware/efi/capsule-loader.o
  CC      drivers/acpi/acpi_video.o
  CC      drivers/acpi/acpica/utlock.o
  CC      drivers/acpi/video_detect.o
  CC      net/mac80211/mlme.o
  AR      drivers/mailbox/built-in.a
  CC      drivers/firmware/efi/libstub/x86-stub.o
  CC      arch/x86/kernel/paravirt.o
  AR      net/ipv6/built-in.a
  AR      drivers/firmware/xilinx/built-in.a
  CC      net/mac80211/tdls.o
  CC      drivers/net/ethernet/realtek/r8169_phy_config.o
  CC      drivers/hid/hid-chicony.o
  CC      drivers/firmware/efi/earlycon.o
  CC      net/mac80211/ocb.o
  CC      drivers/hid/hid-cypress.o
  STUBCPY drivers/firmware/efi/libstub/alignedmem.stub.o
  CC      drivers/md/dm-log.o
  CC      arch/x86/kernel/pvclock.o
  CC      drivers/hid/hid-ezkey.o
  CC      drivers/acpi/acpica/utmath.o
  CC      drivers/hid/hid-gyration.o
  CC      drivers/hid/hid-ite.o
  CC      drivers/hid/hid-kensington.o
  AR      drivers/perf/built-in.a
  CC      drivers/acpi/acpica/utmisc.o
  CC      drivers/acpi/processor_driver.o
  CC      net/mac80211/airtime.o
  CC      net/mac80211/eht.o
  AR      drivers/hwtracing/intel_th/built-in.a
  CC      drivers/md/dm-region-hash.o
  CC      net/mac80211/led.o
  CC      net/mac80211/pm.o
  AR      drivers/net/ethernet/rdc/built-in.a
  AR      drivers/net/ethernet/rocker/built-in.a
  AR      drivers/android/built-in.a
  CC      net/mac80211/rc80211_minstrel_ht.o
  AR      drivers/cpufreq/built-in.a
  AR      drivers/nvmem/layouts/built-in.a
  CC      drivers/nvmem/core.o
  CC      drivers/md/dm-zero.o
  CC      net/mac80211/wbrf.o
  STUBCPY drivers/firmware/efi/libstub/efi-stub-helper.stub.o
  CC      drivers/acpi/acpica/utmutex.o
  CC      arch/x86/kernel/pcspeaker.o
  CC      drivers/acpi/acpica/utnonansi.o
  CC      drivers/acpi/acpica/utobject.o
  STUBCPY drivers/firmware/efi/libstub/file.stub.o
  CC      drivers/acpi/acpica/utosi.o
  STUBCPY drivers/firmware/efi/libstub/gop.stub.o
  AR      drivers/net/ethernet/samsung/built-in.a
  STUBCPY drivers/firmware/efi/libstub/lib-cmdline.stub.o
  CC      drivers/acpi/acpica/utownerid.o
  AR      drivers/net/ethernet/seeq/built-in.a
  STUBCPY drivers/firmware/efi/libstub/lib-ctype.stub.o
  CC      arch/x86/kernel/check.o
  CC      drivers/firmware/dmi_scan.o
  AR      drivers/firmware/efi/built-in.a
  STUBCPY drivers/firmware/efi/libstub/mem.stub.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.o
  CC      arch/x86/kernel/uprobes.o
  CC      drivers/firmware/dmi-id.o
  CC      drivers/acpi/acpica/utpredef.o
  CC      drivers/hid/hid-lg.o
  STUBCPY drivers/firmware/efi/libstub/pci.stub.o
  CC      drivers/acpi/acpica/utresdecode.o
  CC      drivers/hid/hid-lgff.o
  CC      arch/x86/kernel/perf_regs.o
  STUBCPY drivers/firmware/efi/libstub/printk.stub.o
  STUBCPY drivers/firmware/efi/libstub/random.stub.o
  AR      drivers/net/ethernet/silan/built-in.a
  CC      arch/x86/kernel/tracepoint.o
  STUBCPY drivers/firmware/efi/libstub/randomalloc.stub.o
  AR      drivers/net/ethernet/sis/built-in.a
  STUBCPY drivers/firmware/efi/libstub/relocate.stub.o
  CC      drivers/acpi/acpica/utresrc.o
  CC      drivers/acpi/acpica/utstate.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_fence.o
  STUBCPY drivers/firmware/efi/libstub/secureboot.stub.o
  AR      drivers/net/ethernet/sfc/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_huc.o
  CC      drivers/firmware/memmap.o
  STUBCPY drivers/firmware/efi/libstub/skip_spaces.stub.o
  STUBCPY drivers/firmware/efi/libstub/tpm.stub.o
  CC      drivers/acpi/acpica/utstring.o
  CC      drivers/hid/hid-lg4ff.o
  STUBCPY drivers/firmware/efi/libstub/vsprintf.stub.o
  CC      drivers/hid/hid-lg-g15.o
  STUBCPY drivers/firmware/efi/libstub/x86-stub.stub.o
  AR      drivers/net/ethernet/smsc/built-in.a
  AR      drivers/net/ethernet/socionext/built-in.a
  AR      drivers/firmware/efi/libstub/lib.a
  AR      drivers/net/ethernet/stmicro/built-in.a
  AR      drivers/net/ethernet/sun/built-in.a
  CC      drivers/acpi/processor_thermal.o
  AR      drivers/net/ethernet/tehuti/built-in.a
  CC      drivers/acpi/processor_idle.o
  AR      drivers/net/ethernet/vertexcom/built-in.a
  CC      drivers/acpi/acpica/utstrsuppt.o
  AR      drivers/net/ethernet/ti/built-in.a
  AR      drivers/net/ethernet/via/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_huc_debugfs.o
  CC      arch/x86/kernel/itmt.o
  CC      drivers/acpi/acpica/utstrtoul64.o
  CC      drivers/acpi/processor_throttling.o
  AR      drivers/net/ethernet/wangxun/built-in.a
  AR      drivers/nvmem/built-in.a
  AR      drivers/net/ethernet/wiznet/built-in.a
  AR      drivers/net/ethernet/xircom/built-in.a
  AR      drivers/net/ethernet/xilinx/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_irq.o
  CC [M]  drivers/gpu/drm/xe/xe_lrc.o
  CC [M]  drivers/gpu/drm/xe/xe_migrate.o
  AR      drivers/net/ethernet/nvidia/built-in.a
  AR      drivers/net/ethernet/synopsys/built-in.a
  CC      drivers/hid/hid-microsoft.o
  CC [M]  drivers/gpu/drm/xe/xe_mmio.o
  CC [M]  drivers/gpu/drm/xe/xe_mocs.o
  CC      arch/x86/kernel/umip.o
  AR      drivers/net/ethernet/pensando/built-in.a
  CC      drivers/acpi/acpica/utxface.o
  CC      drivers/hid/hid-monterey.o
  CC      drivers/acpi/acpica/utxfinit.o
  CC      drivers/acpi/processor_perflib.o
  CC [M]  drivers/gpu/drm/xe/xe_module.o
  CC [M]  drivers/gpu/drm/xe/xe_pat.o
  CC [M]  drivers/gpu/drm/xe/xe_pci.o
  AR      drivers/md/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_pcode.o
  CC      drivers/acpi/container.o
  CC      drivers/acpi/acpica/utxferror.o
  CC      drivers/acpi/thermal_lib.o
  CC      drivers/hid/hid-ntrig.o
  CC      drivers/acpi/thermal.o
  CC      arch/x86/kernel/unwind_frame.o
  CC      drivers/acpi/acpi_memhotplug.o
  CC      drivers/acpi/acpica/utxfmutex.o
  CC      drivers/hid/hid-pl.o
  CC [M]  drivers/gpu/drm/xe/xe_pm.o
  AR      drivers/firmware/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_preempt_fence.o
  CC      drivers/hid/hid-petalynx.o
  CC      drivers/hid/hid-redragon.o
  CC      drivers/acpi/ioapic.o
  CC      drivers/acpi/battery.o
  CC [M]  drivers/gpu/drm/xe/xe_pt.o
  AR      drivers/net/ethernet/realtek/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_pt_walk.o
  CC      drivers/hid/hid-samsung.o
  CC      drivers/hid/hid-sony.o
  CC      drivers/hid/hid-sunplus.o
  CC      drivers/acpi/bgrt.o
  CC      drivers/hid/hid-topseed.o
  AR      drivers/acpi/acpica/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_query.o
  CC      drivers/acpi/spcr.o
  CC [M]  drivers/gpu/drm/xe/xe_range_fence.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_sr.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_whitelist.o
  CC [M]  drivers/gpu/drm/xe/xe_rtp.o
  CC [M]  drivers/gpu/drm/xe/xe_ring_ops.o
  CC [M]  drivers/gpu/drm/xe/xe_sa.o
  CC [M]  drivers/gpu/drm/xe/xe_sched_job.o
  AR      fs/nfs/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_step.o
  AR      fs/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_sync.o
  CC [M]  drivers/gpu/drm/xe/xe_tile.o
  CC [M]  drivers/gpu/drm/xe/xe_tile_sysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_trace.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_sys_mgr.o
  AR      arch/x86/kernel/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_vram_mgr.o
  AR      arch/x86/built-in.a
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
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_irq.o
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_utils.o
  CC [M]  drivers/gpu/drm/xe/display/intel_fb_bo.o
  CC [M]  drivers/gpu/drm/xe/display/intel_fbdev_fb.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_misc.o
  AR      drivers/acpi/built-in.a
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
  AR      drivers/hid/built-in.a
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
  AR      drivers/net/ethernet/intel/e1000e/built-in.a
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_dcs_backlight.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_vbt.o
  AR      drivers/net/ethernet/intel/built-in.a
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fb.o
  AR      drivers/net/ethernet/built-in.a
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
  AR      drivers/net/built-in.a
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pmdemand.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pps.o
  AR      net/mac80211/built-in.a
  AR      net/built-in.a
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
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs_params.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pipe_crc.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc.o
  CC [M]  drivers/gpu/drm/xe/xe_guc.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_ads.o
  LD [M]  drivers/gpu/drm/xe/xe.o
make[4]: *** [/workspace/kernel/scripts/Makefile.build:485: drivers/gpu/drm] Error 2
make[3]: *** [/workspace/kernel/scripts/Makefile.build:485: drivers/gpu] Error 2
make[2]: *** [/workspace/kernel/scripts/Makefile.build:485: drivers] Error 2
make[1]: *** [/workspace/kernel/Makefile:1919: .] Error 2
make: *** [/workspace/kernel/Makefile:240: __sub-make] Error 2
run-parts: /workspace/ci/hooks/11-build-32b exited with return code 2


