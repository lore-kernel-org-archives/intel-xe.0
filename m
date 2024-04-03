Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8FDCD1288
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 14:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3532112B7D;
	Wed,  3 Apr 2024 14:32:06 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FEA112B7D;
 Wed,  3 Apr 2024 14:32:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EHooks=3A_success_for_drm/xe/display=3A_check_for_er?=
 =?utf-8?q?ror_on_drmm=5Fmutex=5Finit_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Apr 2024 14:32:05 -0000
Message-ID: <171215472565.1171321.7581159965363223987@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240403140105.1306622-1-arun.r.murthy@intel.com>
In-Reply-To: <20240403140105.1306622-1-arun.r.murthy@intel.com>
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

Series: drm/xe/display: check for error on drmm_mutex_init (rev4)
URL   : https://patchwork.freedesktop.org/series/131300/
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
  CC [M]  drivers/gpu/drm/xe/xe_guc_ads.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_ct.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_db_mgr.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_hwconfig.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_id_mgr.o
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
  GEN     xe_wa_oob.c xe_wa_oob.h
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
  CC [M]  drivers/gpu/drm/xe/xe_hwmon.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_relay.o
  CC [M]  drivers/gpu/drm/xe/xe_memirq.o
  CC [M]  drivers/gpu/drm/xe/xe_sriov.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.o
  CC [M]  drivers/gpu/drm/xe/xe_lmtt.o
  CC [M]  drivers/gpu/drm/xe/xe_lmtt_2l.o
  CC [M]  drivers/gpu/drm/xe/xe_lmtt_ml.o
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
  HDRTEST drivers/gpu/drm/xe/abi/guc_errors_abi.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_live_test_mod.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_bo_test.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_dma_buf_test.o
  HDRTEST drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_relay_communication_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_communication_mmio_abi.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_migrate_test.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_mocs_test.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_messages_abi.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_test_mod.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_pci_test.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_trace.h
  CC [M]  drivers/gpu/drm/xe/tests/xe_rtp_test.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_wa_test.o
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
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
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
  LD [M]  drivers/gpu/drm/xe/tests/xe_live_test.o
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
  HDRTEST drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sriov_printk.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sysfs.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sysfs_types.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
  LD [M]  drivers/gpu/drm/xe/tests/xe_test.o
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
  HDRTEST drivers/gpu/drm/xe/xe_sa.h
  HDRTEST drivers/gpu/drm/xe/xe_sa_types.h
  HDRTEST drivers/gpu/drm/xe/xe_sched_job.h
  HDRTEST drivers/gpu/drm/xe/xe_sched_job_types.h
  HDRTEST drivers/gpu/drm/xe/xe_sriov.h
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
  CC [M]  drivers/gpu/drm/xe/xe_migrate.o
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
  UPD     include/generated/uapi/linux/version.h
  WRAP    arch/x86/include/generated/uapi/asm/fcntl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctls.h
  WRAP    arch/x86/include/generated/uapi/asm/ipcbuf.h
  WRAP    arch/x86/include/generated/uapi/asm/param.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  WRAP    arch/x86/include/generated/uapi/asm/resource.h
  WRAP    arch/x86/include/generated/uapi/asm/socket.h
  WRAP    arch/x86/include/generated/uapi/asm/sockios.h
  WRAP    arch/x86/include/generated/uapi/asm/termbits.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  WRAP    arch/x86/include/generated/uapi/asm/termios.h
  WRAP    arch/x86/include/generated/uapi/asm/types.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  HOSTCC  arch/x86/tools/relocs_32.o
  HOSTCC  arch/x86/tools/relocs_64.o
  WRAP    arch/x86/include/generated/asm/early_ioremap.h
  HOSTCC  arch/x86/tools/relocs_common.o
  WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
  WRAP    arch/x86/include/generated/asm/irq_regs.h
  WRAP    arch/x86/include/generated/asm/kmap_size.h
  UPD     include/generated/compile.h
  WRAP    arch/x86/include/generated/asm/local64.h
  WRAP    arch/x86/include/generated/asm/module.lds.h
  WRAP    arch/x86/include/generated/asm/mmiowb.h
  WRAP    arch/x86/include/generated/asm/rwonce.h
  WRAP    arch/x86/include/generated/asm/unaligned.h
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/sorttable
  HOSTCC  scripts/asn1_compiler
  HOSTCC  scripts/selinux/genheaders/genheaders
  HOSTCC  scripts/selinux/mdp/mdp
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
  CHKSHA1 /workspace/kernel/include/linux/atomic/atomic-instrumented.h
  CHKSHA1 /workspace/kernel/include/linux/atomic/atomic-arch-fallback.h
  CHKSHA1 /workspace/kernel/include/linux/atomic/atomic-long.h
  UPD     include/generated/timeconst.h
  UPD     include/generated/bounds.h
  CC      arch/x86/kernel/asm-offsets.s
  UPD     include/generated/asm-offsets.h
  CALL    /workspace/kernel/scripts/checksyscalls.sh
  LDS     scripts/module.lds
  HOSTCC  usr/gen_init_cpio
  CC      ipc/util.o
  CC      init/main.o
  CC      ipc/msgutil.o
  CC      certs/system_keyring.o
  CC      ipc/msg.o
  CC      ipc/sem.o
  AS      arch/x86/lib/atomic64_cx8_32.o
  CC      ipc/shm.o
  CC      init/do_mounts.o
  AS      arch/x86/lib/checksum_32.o
  CC      arch/x86/lib/cmdline.o
  CC      ipc/syscall.o
  UPD     init/utsversion-tmp.h
  AR      arch/x86/crypto/built-in.a
  CC      ipc/ipc_sysctl.o
  AS      arch/x86/lib/cmpxchg8b_emu.o
  CC      init/do_mounts_initrd.o
  CC      io_uring/io_uring.o
  AR      arch/x86/net/built-in.a
  CC      mm/filemap.o
  CC      arch/x86/power/cpu.o
  CC      arch/x86/pci/i386.o
  AR      net/802/built-in.a
  CC      net/ethernet/eth.o
  CC      net/core/sock.o
  CC      net/sched/sch_generic.o
  CC      arch/x86/realmode/init.o
  CC      block/partitions/core.o
  CC      fs/nfs_common/nfsacl.o
  GEN     security/selinux/flask.h security/selinux/av_permissions.h
  CC      security/keys/gc.o
  AR      virt/lib/built-in.a
  AR      arch/x86/platform/atom/built-in.a
  CC      mm/mempool.o
  CC      net/sched/sch_mq.o
  AR      arch/x86/virt/svm/built-in.a
  CC      security/integrity/iint.o
  AR      drivers/cache/built-in.a
  CC      net/netlink/af_netlink.o
  CC      fs/iomap/trace.o
  CC      arch/x86/events/amd/core.o
  CC      security/selinux/avc.o
  CC      arch/x86/mm/pat/set_memory.o
  CC      arch/x86/kernel/fpu/init.o
  CC      arch/x86/events/intel/core.o
  CC      fs/notify/dnotify/dnotify.o
  CC      sound/core/seq/seq.o
  AR      virt/built-in.a
  AR      drivers/irqchip/built-in.a
  CC      arch/x86/events/intel/bts.o
  AR      arch/x86/platform/ce4100/built-in.a
  AR      arch/x86/virt/vmx/built-in.a
  CC      arch/x86/events/intel/ds.o
  CC      arch/x86/lib/cpu.o
  CC      arch/x86/entry/vdso/vma.o
  AR      arch/x86/virt/built-in.a
  CC      arch/x86/platform/efi/memmap.o
  AR      drivers/pwm/built-in.a
  CC      fs/iomap/iter.o
  AR      drivers/bus/mhi/built-in.a
  CC      init/initramfs.o
  CC      lib/math/div64.o
  CC      init/calibrate.o
  CC      kernel/sched/core.o
  AR      drivers/bus/built-in.a
  CC      crypto/asymmetric_keys/asymmetric_type.o
  CC      lib/math/gcd.o
  CC      drivers/pci/msi/pcidev_msi.o
  CC      arch/x86/platform/efi/quirks.o
  CC      lib/math/lcm.o
  CC      lib/math/int_log.o
  GEN     usr/initramfs_data.cpio
  COPY    usr/initramfs_inc_data
  AS      usr/initramfs_data.o
  CC      lib/math/int_pow.o
  AR      usr/built-in.a
  AR      arch/x86/platform/geode/built-in.a
  HOSTCC  certs/extract-cert
  AR      sound/i2c/other/built-in.a
  CC      arch/x86/kernel/fpu/bugs.o
  CC      ipc/mqueue.o
  AR      sound/i2c/built-in.a
  AR      arch/x86/platform/iris/built-in.a
  CC      lib/math/int_sqrt.o
  CC      arch/x86/lib/delay.o
  CC      arch/x86/platform/intel/iosf_mbi.o
  CC      arch/x86/kernel/fpu/core.o
  CC      lib/math/reciprocal_div.o
  CC      ipc/namespace.o
  CC      sound/core/seq/seq_lock.o
  AS      arch/x86/realmode/rm/header.o
  CC      lib/math/rational.o
  AS      arch/x86/realmode/rm/trampoline_32.o
  CERT    certs/x509_certificate_list
  AS      arch/x86/realmode/rm/stack.o
  CERT    certs/signing_key.x509
  AS      certs/system_certificates.o
  AS      arch/x86/realmode/rm/reboot.o
  CC      security/integrity/integrity_audit.o
  AS      arch/x86/realmode/rm/wakeup_asm.o
  AR      certs/built-in.a
  CC      fs/nfs_common/grace.o
  CC      arch/x86/pci/init.o
  AR      sound/drivers/opl3/built-in.a
  CC      arch/x86/realmode/rm/wakemain.o
  AR      sound/drivers/opl4/built-in.a
  AR      sound/isa/ad1816a/built-in.a
  AS      arch/x86/lib/getuser.o
  AR      sound/drivers/mpu401/built-in.a
  CC      drivers/pci/msi/api.o
  AR      sound/isa/ad1848/built-in.a
  AR      sound/pci/ac97/built-in.a
  AR      sound/drivers/vx/built-in.a
  AR      sound/pci/ali5451/built-in.a
  AR      sound/isa/cs423x/built-in.a
  AR      sound/pci/asihpi/built-in.a
  GEN     arch/x86/lib/inat-tables.c
  CC      security/keys/key.o
  AR      sound/isa/es1688/built-in.a
  CC      sound/core/seq/seq_clientmgr.o
  AR      sound/drivers/pcsp/built-in.a
  CC      arch/x86/entry/vdso/extable.o
  AR      sound/isa/galaxy/built-in.a
  AR      fs/notify/dnotify/built-in.a
  AR      sound/pci/au88x0/built-in.a
  AR      sound/drivers/built-in.a
  AR      sound/pci/aw2/built-in.a
  LDS     arch/x86/entry/vdso/vdso32/vdso32.lds
  CC      crypto/asymmetric_keys/restrict.o
  AR      sound/isa/gus/built-in.a
  CC      security/selinux/hooks.o
  AR      sound/pci/ctxfi/built-in.a
  CC      fs/notify/inotify/inotify_fsnotify.o
  CC      arch/x86/power/hibernate_32.o
  CC      arch/x86/realmode/rm/video-mode.o
  AR      sound/isa/msnd/built-in.a
  CC      arch/x86/lib/insn-eval.o
  AR      sound/pci/ca0106/built-in.a
  CC      drivers/video/console/dummycon.o
  CC      drivers/video/console/vgacon.o
  AR      sound/isa/opti9xx/built-in.a
  AR      sound/pci/cs46xx/built-in.a
  AR      sound/isa/sb/built-in.a
  AR      sound/isa/wavefront/built-in.a
  AR      sound/pci/cs5535audio/built-in.a
  AR      drivers/idle/built-in.a
  AS      arch/x86/power/hibernate_asm_32.o
  AR      sound/isa/wss/built-in.a
  AR      sound/pci/lola/built-in.a
  AR      sound/isa/built-in.a
  CC      drivers/pci/msi/msi.o
  CC      block/partitions/msdos.o
  AR      sound/pci/lx6464es/built-in.a
  AS      arch/x86/realmode/rm/copy.o
  AS      arch/x86/entry/vdso/vdso32/note.o
  AR      sound/pci/echoaudio/built-in.a
  AS      arch/x86/entry/vdso/vdso32/system_call.o
  CC      net/core/request_sock.o
  AR      sound/pci/emu10k1/built-in.a
  AS      arch/x86/realmode/rm/bioscall.o
  CC      security/selinux/selinuxfs.o
  AR      sound/pci/hda/built-in.a
  AR      lib/math/built-in.a
  AR      sound/pci/ice1712/built-in.a
  CC [M]  sound/pci/hda/hda_bind.o
  AS      arch/x86/entry/vdso/vdso32/sigreturn.o
  CC      arch/x86/realmode/rm/regs.o
  CC [M]  sound/pci/hda/hda_codec.o
  AR      arch/x86/entry/vsyscall/built-in.a
  CC      lib/crypto/mpi/generic_mpih-lshift.o
  CC      lib/crypto/memneq.o
  CC      net/sched/sch_frag.o
  CC      lib/crypto/utils.o
  CC      arch/x86/realmode/rm/video-vga.o
  CC      arch/x86/events/amd/lbr.o
  CC [M]  sound/pci/hda/hda_jack.o
  CC      arch/x86/platform/efi/efi.o
  CC      init/init_task.o
  CC      arch/x86/realmode/rm/video-vesa.o
  AR      arch/x86/platform/intel/built-in.a
  CC      fs/notify/inotify/inotify_user.o
  CC      crypto/asymmetric_keys/signature.o
  CC      fs/iomap/buffered-io.o
  AR      sound/pci/korg1212/built-in.a
  CC      arch/x86/mm/pat/memtype.o
  CC      lib/crypto/mpi/generic_mpih-mul1.o
  CC      arch/x86/realmode/rm/video-bios.o
  CC      block/partitions/efi.o
  AR      net/ethernet/built-in.a
  AS      arch/x86/entry/entry.o
  CC      arch/x86/pci/pcbios.o
  AR      net/bpf/built-in.a
  PASYMS  arch/x86/realmode/rm/pasyms.h
  AS      arch/x86/entry/entry_32.o
  CC      net/ethtool/ioctl.o
  AR      security/integrity/built-in.a
  LDS     arch/x86/realmode/rm/realmode.lds
  CC      security/commoncap.o
  LD      arch/x86/realmode/rm/realmode.elf
  AR      fs/nfs_common/built-in.a
  RELOCS  arch/x86/realmode/rm/realmode.relocs
  CC      ipc/mq_sysctl.o
  OBJCOPY arch/x86/realmode/rm/realmode.bin
  AS      arch/x86/realmode/rmpiggy.o
  CC      net/ethtool/common.o
  AR      arch/x86/realmode/built-in.a
  CC      lib/crypto/chacha.o
  CC      net/ethtool/netlink.o
  CC      fs/quota/dquot.o
  CC      fs/quota/quota_v2.o
  CC      fs/quota/quota_tree.o
  CC      fs/proc/task_mmu.o
  CC      arch/x86/power/hibernate.o
  CC      fs/proc/inode.o
  CC      arch/x86/entry/vdso/vdso32/vclock_gettime.o
  AR      drivers/char/ipmi/built-in.a
  CC      net/netfilter/core.o
  CC      net/netfilter/nf_log.o
  CC      net/netfilter/nf_queue.o
  CC      arch/x86/lib/insn.o
  CC      crypto/asymmetric_keys/public_key.o
  CC      net/netfilter/nf_sockopt.o
  CC      arch/x86/kernel/fpu/regset.o
  CC      arch/x86/events/intel/knc.o
  CC      security/keys/keyring.o
  CC      net/ipv4/netfilter/nf_defrag_ipv4.o
  CC      lib/crypto/mpi/generic_mpih-mul2.o
  CC      init/version.o
  CC      net/ipv4/netfilter/nf_reject_ipv4.o
  CC      drivers/pci/msi/irqdomain.o
  AR      ipc/built-in.a
  AR      drivers/video/console/built-in.a
  CC      block/bdev.o
  CC      arch/x86/events/amd/ibs.o
  CC      lib/zlib_inflate/inffast.o
  CC      drivers/video/backlight/backlight.o
  CC      arch/x86/events/amd/uncore.o
  CC      arch/x86/lib/kaslr.o
  CC      sound/core/seq/seq_memory.o
  AR      init/built-in.a
  CC      arch/x86/pci/mmconfig_32.o
  CC      lib/zlib_inflate/inflate.o
  CC      arch/x86/mm/pat/memtype_interval.o
  AR      drivers/video/fbdev/core/built-in.a
  CC      fs/quota/quota.o
  AR      fs/notify/inotify/built-in.a
  AR      drivers/video/fbdev/omap/built-in.a
  CC      fs/notify/fsnotify.o
  AR      drivers/video/fbdev/omap2/omapfb/dss/built-in.a
  AR      fs/notify/fanotify/built-in.a
  CC      lib/zlib_inflate/infutil.o
  AR      drivers/video/fbdev/omap2/omapfb/displays/built-in.a
  AR      drivers/video/fbdev/omap2/omapfb/built-in.a
  CC      arch/x86/platform/efi/efi_32.o
  AR      drivers/video/fbdev/omap2/built-in.a
  AR      arch/x86/power/built-in.a
  CC      arch/x86/entry/vdso/vdso32/vgetcpu.o
  CC      net/sched/sch_api.o
  AR      drivers/video/fbdev/built-in.a
  CC      arch/x86/lib/memcpy_32.o
  CC      fs/notify/notification.o
  CC      arch/x86/kernel/cpu/mce/core.o
  HOSTCC  arch/x86/entry/vdso/vdso2c
  AS      arch/x86/lib/memmove_32.o
  AR      block/partitions/built-in.a
  CC      arch/x86/lib/misc.o
  CC      arch/x86/lib/pc-conf-reg.o
  CC      crypto/api.o
  CC      arch/x86/kernel/acpi/boot.o
  CC      arch/x86/kernel/apic/apic.o
  ASN.1   crypto/asymmetric_keys/x509.asn1.[ch]
  ASN.1   crypto/asymmetric_keys/x509_akid.asn1.[ch]
  CC      crypto/asymmetric_keys/x509_loader.o
  CC      net/netlink/genetlink.o
  CC      fs/quota/kqid.o
  CC      lib/crypto/mpi/generic_mpih-mul3.o
  CC      arch/x86/kernel/kprobes/core.o
  CC      arch/x86/kernel/apic/apic_common.o
  AS      arch/x86/lib/putuser.o
  AS      arch/x86/lib/retpoline.o
  CC      net/netfilter/utils.o
  CC      arch/x86/lib/string_32.o
  CC      arch/x86/kernel/fpu/signal.o
  CC      crypto/asymmetric_keys/x509_public_key.o
  CC      arch/x86/lib/strstr_32.o
  CC      arch/x86/entry/vdso/vdso32-setup.o
  CC      arch/x86/kernel/fpu/xstate.o
  CC      lib/zlib_inflate/inftrees.o
  AR      drivers/pci/msi/built-in.a
  CC      net/ethtool/bitset.o
  CC      drivers/pci/pcie/portdrv.o
  CC      arch/x86/pci/direct.o
  CC      arch/x86/lib/usercopy.o
  CC      arch/x86/lib/usercopy_32.o
  AR      arch/x86/platform/intel-mid/built-in.a
  AR      arch/x86/mm/pat/built-in.a
  CC      drivers/pci/pcie/rcec.o
  CC      arch/x86/mm/init.o
  CC      arch/x86/events/intel/lbr.o
  CC      lib/zlib_inflate/inflate_syms.o
  AR      drivers/video/backlight/built-in.a
  CC      drivers/video/aperture.o
  CC      arch/x86/kernel/cpu/mce/severity.o
  CC      sound/core/seq/seq_queue.o
  AS      arch/x86/platform/efi/efi_stub_32.o
  CC      arch/x86/kernel/kprobes/opt.o
  CC      drivers/pci/hotplug/pci_hotplug_core.o
  CC      arch/x86/platform/efi/runtime-map.o
  CC      drivers/acpi/acpica/dsargs.o
  CC      fs/proc/root.o
  CC      net/core/skbuff.o
  VDSO    arch/x86/entry/vdso/vdso32.so.dbg
  CC      fs/notify/group.o
  OBJCOPY arch/x86/entry/vdso/vdso32.so
  CC      security/keys/keyctl.o
  VDSO2C  arch/x86/entry/vdso/vdso-image-32.c
  CC      arch/x86/entry/vdso/vdso-image-32.o
  CC      fs/proc/base.o
  CC [M]  sound/pci/hda/hda_auto_parser.o
  CC      mm/oom_kill.o
  CC [M]  sound/pci/hda/hda_sysfs.o
  CC      lib/crypto/mpi/generic_mpih-rshift.o
  CC      arch/x86/lib/msr-smp.o
  CC      drivers/video/cmdline.o
  AR      arch/x86/events/amd/built-in.a
  AR      drivers/acpi/pmic/built-in.a
  CC      security/selinux/netlink.o
  CC      arch/x86/events/zhaoxin/core.o
  CC      block/fops.o
  CC      drivers/video/nomodeset.o
  CC      net/ipv4/netfilter/ip_tables.o
  ASN.1   crypto/asymmetric_keys/pkcs7.asn1.[ch]
  CC      crypto/asymmetric_keys/pkcs7_trust.o
  AR      lib/zlib_inflate/built-in.a
  CC      arch/x86/events/core.o
  CC      fs/iomap/direct-io.o
  AR      arch/x86/entry/vdso/built-in.a
  CC      arch/x86/entry/syscall_32.o
  CC      drivers/acpi/acpica/dscontrol.o
  CC      arch/x86/lib/cache-smp.o
  CC      fs/quota/netlink.o
  CC      net/netfilter/nfnetlink.o
  CC      net/netfilter/nfnetlink_log.o
  CC      arch/x86/pci/mmconfig-shared.o
  CC      lib/crypto/mpi/generic_mpih-sub1.o
  CC      arch/x86/kernel/acpi/sleep.o
  CC      drivers/pci/pcie/aspm.o
  CC      arch/x86/lib/msr.o
  AS      arch/x86/kernel/acpi/wakeup_32.o
  CC      arch/x86/mm/init_32.o
  CC      arch/x86/kernel/acpi/cstate.o
  CC      crypto/asymmetric_keys/pkcs7_verify.o
  CC      sound/core/seq/seq_fifo.o
  CC      kernel/sched/fair.o
  CC      drivers/acpi/acpica/dsdebug.o
  AR      arch/x86/platform/efi/built-in.a
  CC      drivers/acpi/acpica/dsfield.o
  AR      arch/x86/platform/intel-quark/built-in.a
  CC      fs/notify/mark.o
  CC      block/bio.o
  AR      arch/x86/platform/olpc/built-in.a
  CC      block/elevator.o
  CC      net/netfilter/nf_conntrack_core.o
  CC      arch/x86/kernel/cpu/mce/genpool.o
  AR      arch/x86/platform/scx200/built-in.a
  LDS     arch/x86/kernel/vmlinux.lds
  AR      arch/x86/kernel/kprobes/built-in.a
  CC      drivers/pci/hotplug/acpi_pcihp.o
  AR      arch/x86/platform/ts5500/built-in.a
  CC      block/blk-core.o
  AR      arch/x86/platform/uv/built-in.a
  CC      arch/x86/pci/fixup.o
  AR      arch/x86/platform/built-in.a
  CC      drivers/pnp/pnpacpi/core.o
  CC      drivers/video/hdmi.o
  CC      drivers/pci/pcie/pme.o
  CC      arch/x86/pci/acpi.o
  AR      arch/x86/kernel/fpu/built-in.a
  CC      drivers/pnp/pnpacpi/rsparser.o
  CC      drivers/pnp/core.o
  CC      net/ethtool/strset.o
  CC      arch/x86/entry/common.o
  CC      io_uring/xattr.o
  AR      arch/x86/events/zhaoxin/built-in.a
  CC      crypto/asymmetric_keys/x509.asn1.o
  CC      net/ipv4/route.o
  CC      net/netlink/policy.o
  CC      arch/x86/kernel/cpu/mce/intel.o
  CC      lib/crypto/mpi/generic_mpih-add1.o
  CC      crypto/asymmetric_keys/x509_akid.asn1.o
  CC [M]  sound/pci/hda/hda_controller.o
  CC      crypto/asymmetric_keys/x509_cert_parser.o
  CC      arch/x86/events/intel/p4.o
  CC      arch/x86/kernel/apic/apic_noop.o
  CC      security/keys/permission.o
  CC      security/keys/process_keys.o
  AR      arch/x86/kernel/acpi/built-in.a
  CC      net/sched/sch_blackhole.o
  CC      arch/x86/pci/legacy.o
  AR      fs/quota/built-in.a
  CC      drivers/acpi/acpica/dsinit.o
  CC      arch/x86/pci/irq.o
  CC      block/blk-sysfs.o
  CC      sound/core/seq/seq_prioq.o
  CC      fs/iomap/fiemap.o
  CC      arch/x86/events/probe.o
  AS      arch/x86/lib/msr-reg.o
  CC      arch/x86/pci/common.o
  CC      arch/x86/pci/early.o
  CC      arch/x86/lib/msr-reg-export.o
  CC      security/selinux/nlmsgtab.o
  AR      drivers/pci/hotplug/built-in.a
  CC      arch/x86/mm/fault.o
  CC      lib/crypto/mpi/ec.o
  CC      arch/x86/kernel/apic/ipi.o
  AS      arch/x86/lib/hweight.o
  CC      fs/notify/fdinfo.o
  CC      drivers/acpi/acpica/dsmethod.o
  CC      arch/x86/lib/iomem.o
  CC      mm/fadvise.o
  CC      arch/x86/kernel/cpu/mce/amd.o
  CC      net/ipv4/netfilter/iptable_filter.o
  CC      arch/x86/events/intel/p6.o
  CC      net/ipv4/inetpeer.o
  CC      crypto/cipher.o
  CC      crypto/asymmetric_keys/pkcs7.asn1.o
  CC      crypto/asymmetric_keys/pkcs7_parser.o
  AR      drivers/amba/built-in.a
  CC [M]  sound/pci/hda/hda_proc.o
  AR      drivers/video/built-in.a
  CC      mm/maccess.o
  AR      drivers/pci/pcie/built-in.a
  CC [M]  sound/pci/hda/hda_hwdep.o
  CC      net/ipv4/netfilter/iptable_mangle.o
  AR      drivers/pci/controller/dwc/built-in.a
  CC      net/core/datagram.o
  AR      drivers/pci/controller/mobiveil/built-in.a
  AR      drivers/pci/controller/built-in.a
  AR      drivers/pci/switch/built-in.a
  AS      arch/x86/entry/thunk_32.o
  CC      drivers/pci/access.o
  AR      drivers/pnp/pnpacpi/built-in.a
  AR      arch/x86/entry/built-in.a
  CC      net/ipv4/netfilter/ipt_REJECT.o
  CC      drivers/pnp/card.o
  CC      drivers/pnp/driver.o
  CC      arch/x86/pci/bus_numa.o
  CC      arch/x86/mm/ioremap.o
  AR      net/netlink/built-in.a
  CC      fs/proc/generic.o
  CC      drivers/pci/bus.o
  CC      io_uring/nop.o
  CC      sound/core/seq/seq_timer.o
  CC      arch/x86/lib/atomic64_32.o
  CC      sound/core/seq/seq_system.o
  CC      drivers/acpi/acpica/dsmthdat.o
  AR      drivers/clk/actions/built-in.a
  CC      arch/x86/lib/inat.o
  CC      fs/iomap/seek.o
  AR      drivers/clk/analogbits/built-in.a
  CC      arch/x86/events/intel/pt.o
  CC      arch/x86/kernel/apic/vector.o
  AR      drivers/clk/bcm/built-in.a
  CC      net/sched/cls_api.o
  AR      drivers/clk/imgtec/built-in.a
  CC      net/ethtool/linkinfo.o
  AR      arch/x86/lib/built-in.a
  AR      drivers/clk/imx/built-in.a
  CC      security/keys/request_key.o
  CC      arch/x86/events/utils.o
  AR      drivers/clk/ingenic/built-in.a
  AR      crypto/asymmetric_keys/built-in.a
  AR      arch/x86/lib/lib.a
  AR      drivers/clk/mediatek/built-in.a
  CC      lib/zlib_deflate/deflate.o
  AR      fs/notify/built-in.a
  CC      kernel/sched/build_policy.o
  AR      drivers/clk/microchip/built-in.a
  CC      lib/zlib_deflate/deftree.o
  CC      drivers/dma/dw/core.o
  AR      drivers/clk/mstar/built-in.a
  AR      drivers/clk/mvebu/built-in.a
  AR      drivers/clk/ralink/built-in.a
  CC      crypto/compress.o
  AR      drivers/clk/renesas/built-in.a
  CC      fs/kernfs/mount.o
  CC      lib/zlib_deflate/deflate_syms.o
  AR      drivers/clk/socfpga/built-in.a
  AR      drivers/clk/sprd/built-in.a
  AR      drivers/clk/starfive/built-in.a
  CC      security/keys/request_key_auth.o
  CC      fs/kernfs/inode.o
  AR      drivers/soc/apple/built-in.a
  AR      drivers/clk/sunxi-ng/built-in.a
  AR      drivers/soc/aspeed/built-in.a
  CC      fs/kernfs/dir.o
  AR      drivers/clk/ti/built-in.a
  AR      drivers/soc/bcm/built-in.a
  CC      security/selinux/netif.o
  AR      drivers/clk/versatile/built-in.a
  CC      mm/page-writeback.o
  AR      drivers/soc/fsl/built-in.a
  CC      drivers/dma/hsu/hsu.o
  AR      drivers/clk/xilinx/built-in.a
  AR      drivers/soc/fujitsu/built-in.a
  AR      drivers/clk/built-in.a
  AR      drivers/soc/hisilicon/built-in.a
  AR      drivers/dma/idxd/built-in.a
  CC      mm/folio-compat.o
  AR      drivers/soc/imx/built-in.a
  CC      drivers/acpi/acpica/dsobject.o
  AR      drivers/soc/ixp4xx/built-in.a
  AR      drivers/soc/loongson/built-in.a
  CC      arch/x86/pci/amd_bus.o
  AR      drivers/soc/mediatek/built-in.a
  CC      lib/crypto/aes.o
  AR      drivers/soc/microchip/built-in.a
  AR      drivers/soc/nuvoton/built-in.a
  CC      lib/crypto/mpi/mpicoder.o
  AR      drivers/soc/pxa/built-in.a
  CC      arch/x86/mm/extable.o
  AR      drivers/soc/amlogic/built-in.a
  CC      drivers/pnp/resource.o
  AR      drivers/soc/qcom/built-in.a
  CC      drivers/pnp/manager.o
  AR      drivers/soc/renesas/built-in.a
  CC      drivers/pnp/support.o
  AR      drivers/soc/rockchip/built-in.a
  AR      drivers/soc/sunxi/built-in.a
  CC      net/netfilter/nf_conntrack_standalone.o
  CC      lib/crypto/mpi/mpi-add.o
  AR      drivers/soc/ti/built-in.a
  CC      lib/crypto/mpi/mpi-bit.o
  CC      drivers/pci/probe.o
  AR      drivers/soc/xilinx/built-in.a
  CC      sound/core/seq/seq_ports.o
  AR      drivers/soc/built-in.a
  CC      sound/core/seq/seq_info.o
  CC [M]  sound/pci/hda/patch_hdmi.o
  CC      lib/crypto/mpi/mpi-cmp.o
  CC      drivers/pci/host-bridge.o
  CC      fs/proc/array.o
  CC      fs/iomap/swapfile.o
  CC      io_uring/fs.o
  CC      drivers/virtio/virtio.o
  CC [M]  net/ipv4/netfilter/iptable_nat.o
  CC      crypto/algapi.o
  CC      block/blk-flush.o
  CC      drivers/acpi/acpica/dsopcode.o
  CC      drivers/pci/remove.o
  CC      drivers/acpi/acpica/dspkginit.o
  CC      net/netfilter/nf_conntrack_expect.o
  CC      io_uring/splice.o
  CC      security/keys/user_defined.o
  AR      lib/zlib_deflate/built-in.a
  CC      lib/lzo/lzo1x_compress.o
  CC      net/ethtool/linkmodes.o
  CC      lib/lzo/lzo1x_decompress_safe.o
  CC      fs/kernfs/file.o
  CC      arch/x86/events/rapl.o
  CC      drivers/pnp/interface.o
  AR      net/ipv4/netfilter/built-in.a
  CC      io_uring/sync.o
  CC      arch/x86/kernel/cpu/mce/threshold.o
  CC      net/xfrm/xfrm_policy.o
  CC      io_uring/advise.o
  AR      arch/x86/pci/built-in.a
  CC      io_uring/filetable.o
  AR      drivers/dma/hsu/built-in.a
  AR      drivers/dma/mediatek/built-in.a
  CC      fs/proc/fd.o
  CC      lib/crypto/mpi/mpi-sub-ui.o
  CC      drivers/dma/dw/dw.o
  CC      arch/x86/events/intel/uncore.o
  CC      arch/x86/events/intel/uncore_nhmex.o
  CC      drivers/acpi/acpica/dsutils.o
  CC      drivers/dma/dw/idma32.o
  CC      fs/proc/proc_tty.o
  CC      io_uring/openclose.o
  CC      sound/core/seq/seq_dummy.o
  CC      arch/x86/mm/mmap.o
  CC      mm/readahead.o
  CC      security/selinux/netnode.o
  CC      arch/x86/kernel/apic/init.o
  CC      arch/x86/kernel/apic/hw_nmi.o
  AR      fs/iomap/built-in.a
  CC      drivers/virtio/virtio_ring.o
  AR      lib/lzo/built-in.a
  CC      net/core/stream.o
  CC      security/selinux/netport.o
  CC      drivers/pci/pci.o
  CC      security/selinux/status.o
  CC      fs/proc/cmdline.o
  CC      security/keys/proc.o
  CC      lib/lz4/lz4_decompress.o
  CC      security/keys/sysctl.o
  CC      drivers/pnp/quirks.o
  CC      crypto/scatterwalk.o
  CC      lib/zstd/zstd_decompress_module.o
  CC      block/blk-settings.o
  CC      drivers/acpi/acpica/dswexec.o
  CC      crypto/proc.o
  CC      arch/x86/mm/pgtable.o
  CC      drivers/dma/dw/acpi.o
  CC      net/ipv4/protocol.o
  CC      net/core/scm.o
  CC      lib/crypto/mpi/mpi-div.o
  AR      sound/core/seq/built-in.a
  CC      sound/core/sound.o
  CC      sound/core/init.o
  CC      lib/crypto/mpi/mpi-inv.o
  CC      arch/x86/events/msr.o
  CC      net/ipv4/ip_input.o
  CC      net/ethtool/rss.o
  CC      lib/crypto/arc4.o
  CC      mm/swap.o
  CC      fs/kernfs/symlink.o
  CC      net/sched/act_api.o
  CC      net/sched/sch_fifo.o
  CC      fs/proc/consoles.o
  CC      arch/x86/kernel/apic/io_apic.o
  CC      lib/zstd/decompress/huf_decompress.o
  CC      arch/x86/mm/physaddr.o
  CC      drivers/pnp/system.o
  CC      drivers/acpi/acpica/dswload.o
  CC      security/keys/keyctl_pkey.o
  CC      lib/crypto/mpi/mpi-mod.o
  CC      net/netfilter/nf_conntrack_helper.o
  AR      arch/x86/kernel/cpu/mce/built-in.a
  CC      drivers/tty/vt/vt_ioctl.o
  CC      drivers/tty/vt/vc_screen.o
  CC      crypto/aead.o
  CC      arch/x86/kernel/cpu/mtrr/mtrr.o
  CC      io_uring/uring_cmd.o
  CC      arch/x86/kernel/cpu/mtrr/if.o
  CC      mm/truncate.o
  CC      io_uring/epoll.o
  CC      io_uring/statx.o
  CC      drivers/tty/hvc/hvc_console.o
  CC [M]  sound/pci/hda/hda_eld.o
  CC      security/lsm_syscalls.o
  CC      security/min_addr.o
  CC      drivers/tty/serial/8250/8250_core.o
  CC      net/ethtool/linkstate.o
  CC      net/core/gen_stats.o
  CC      drivers/tty/serial/8250/8250_pnp.o
  AR      drivers/dma/dw/built-in.a
  AR      drivers/dma/qcom/built-in.a
  AR      drivers/pnp/built-in.a
  CC      drivers/virtio/virtio_anchor.o
  CC      drivers/tty/serial/serial_core.o
  AR      drivers/dma/ti/built-in.a
  CC      drivers/tty/serial/serial_base_bus.o
  AR      drivers/dma/xilinx/built-in.a
  CC      fs/proc/cpuinfo.o
  CC      drivers/dma/dmaengine.o
  CC      drivers/acpi/acpica/dswload2.o
  CC      security/selinux/ss/ebitmap.o
  CC      arch/x86/mm/tlb.o
  AR      fs/kernfs/built-in.a
  CC      net/sched/cls_cgroup.o
  CC      block/blk-ioc.o
  AR      lib/lz4/built-in.a
  CC      net/ethtool/debug.o
  CC      sound/core/memory.o
  CC      arch/x86/events/intel/uncore_snb.o
  CC      net/netfilter/nf_conntrack_proto.o
  CC      sound/core/control.o
  CC      lib/crypto/mpi/mpi-mul.o
  AR      security/keys/built-in.a
  CC [M]  sound/pci/hda/hda_intel.o
  CC      net/ethtool/wol.o
  CC      kernel/locking/mutex.o
  CC      net/ethtool/features.o
  CC      net/core/gen_estimator.o
  CC      drivers/pci/pci-driver.o
  CC      kernel/locking/semaphore.o
  CC      arch/x86/kernel/cpu/mtrr/generic.o
  CC      drivers/acpi/acpica/dswscope.o
  CC      drivers/tty/serial/8250/8250_port.o
  CC      crypto/geniv.o
  CC      fs/proc/devices.o
  CC      drivers/virtio/virtio_pci_modern_dev.o
  CC      sound/core/misc.o
  LD [M]  sound/pci/hda/snd-hda-codec.o
  CC      net/netfilter/nf_conntrack_proto_generic.o
  CC      lib/crypto/mpi/mpih-cmp.o
  CC      drivers/tty/serial/8250/8250_dma.o
  CC      io_uring/net.o
  CC      lib/crypto/mpi/mpih-div.o
  CC      drivers/tty/vt/selection.o
  AR      drivers/tty/hvc/built-in.a
  CC      net/ipv4/ip_fragment.o
  AR      drivers/tty/ipwireless/built-in.a
  CC      net/ipv4/ip_forward.o
  CC      security/security.o
  CC      drivers/acpi/acpica/dswstate.o
  CC      drivers/acpi/acpica/evevent.o
  CC      net/netfilter/nf_conntrack_proto_tcp.o
  CC      lib/zstd/decompress/zstd_ddict.o
  CC      mm/vmscan.o
  CC      drivers/acpi/acpica/evgpe.o
  CC      net/netfilter/nf_conntrack_proto_udp.o
  CC      block/blk-map.o
  CC      drivers/tty/serial/serial_ctrl.o
  CC      drivers/tty/serial/8250/8250_dwlib.o
  CC      lib/crypto/mpi/mpih-mul.o
  CC      lib/zstd/decompress/zstd_decompress.o
  CC      drivers/tty/serial/8250/8250_pcilib.o
  CC      arch/x86/events/intel/uncore_snbep.o
  CC      drivers/char/hw_random/core.o
  CC      arch/x86/mm/cpu_entry_area.o
  CC      arch/x86/kernel/apic/msi.o
  CC      drivers/char/hw_random/intel-rng.o
  CC      net/sched/ematch.o
  CC      net/ethtool/privflags.o
  CC      security/selinux/ss/hashtab.o
  CC      net/ethtool/rings.o
  AR      drivers/iommu/amd/built-in.a
  CC      drivers/dma/virt-dma.o
  AR      drivers/iommu/intel/built-in.a
  AR      drivers/gpu/host1x/built-in.a
  CC      drivers/acpi/acpica/evgpeblk.o
  AR      drivers/iommu/arm/arm-smmu/built-in.a
  CC      fs/proc/interrupts.o
  AR      drivers/iommu/arm/arm-smmu-v3/built-in.a
  AR      drivers/iommu/arm/built-in.a
  CC      drivers/acpi/acpica/evgpeinit.o
  AR      drivers/iommu/iommufd/built-in.a
  CC      net/core/net_namespace.o
  CC      lib/crypto/mpi/mpi-pow.o
  CC      drivers/iommu/iommu.o
  CC      kernel/sched/build_utility.o
  CC      drivers/dma/acpi-dma.o
  CC      drivers/tty/vt/keyboard.o
  CC      drivers/tty/vt/vt.o
  CC      drivers/virtio/virtio_pci_legacy_dev.o
  CC      drivers/virtio/virtio_pci_modern.o
  CC      arch/x86/kernel/cpu/mtrr/cleanup.o
  CC      crypto/lskcipher.o
  AR      drivers/gpu/drm/tests/built-in.a
  AR      drivers/gpu/drm/arm/built-in.a
  CC      arch/x86/kernel/cpu/mtrr/amd.o
  CC      drivers/gpu/drm/display/drm_display_helper_mod.o
  CC      drivers/char/hw_random/amd-rng.o
  CC      block/blk-merge.o
  CC      kernel/locking/rwsem.o
  CC      sound/core/device.o
  CC      security/selinux/ss/symtab.o
  CC      drivers/char/hw_random/geode-rng.o
  CC      drivers/virtio/virtio_pci_common.o
  CC      drivers/pci/search.o
  CC      drivers/acpi/acpica/evgpeutil.o
  CC      kernel/power/qos.o
  CC      kernel/printk/printk.o
  CC      arch/x86/mm/maccess.o
  CC      lib/zstd/decompress/zstd_decompress_block.o
  CC      fs/proc/loadavg.o
  CC      kernel/printk/printk_safe.o
  LD [M]  sound/pci/hda/snd-hda-codec-hdmi.o
  LD [M]  sound/pci/hda/snd-hda-intel.o
  CC      net/xfrm/xfrm_state.o
  AR      sound/pci/mixart/built-in.a
  AR      sound/pci/nm256/built-in.a
  AR      sound/pci/oxygen/built-in.a
  CC      fs/proc/meminfo.o
  AR      sound/pci/pcxhr/built-in.a
  CC      drivers/gpu/drm/display/drm_dp_dual_mode_helper.o
  CC      security/selinux/ss/sidtab.o
  AR      sound/pci/riptide/built-in.a
  CC      drivers/gpu/drm/display/drm_dp_helper.o
  AR      sound/pci/rme9652/built-in.a
  CC      drivers/gpu/drm/display/drm_dp_mst_topology.o
  CC      arch/x86/kernel/apic/probe_32.o
  AR      sound/pci/trident/built-in.a
  AR      sound/pci/ymfpci/built-in.a
  CC      drivers/gpu/drm/ttm/ttm_tt.o
  CC      drivers/gpu/drm/ttm/ttm_bo.o
  AR      sound/pci/vx222/built-in.a
  CC      drivers/gpu/drm/ttm/ttm_bo_util.o
  AR      sound/pci/built-in.a
  CC      drivers/gpu/drm/ttm/ttm_bo_vm.o
  CC      arch/x86/mm/pgprot.o
  CC      drivers/gpu/drm/ttm/ttm_module.o
  CC      lib/crypto/mpi/mpiutil.o
  CC      sound/core/info.o
  CC      net/ipv4/ip_options.o
  CC      drivers/acpi/acpica/evglock.o
  CC      drivers/gpu/drm/ttm/ttm_execbuf_util.o
  CC      arch/x86/events/intel/uncore_discovery.o
  AR      drivers/dma/built-in.a
  CC      drivers/tty/serial/8250/8250_early.o
  CC      arch/x86/kernel/cpu/mtrr/cyrix.o
  CC      net/ethtool/channels.o
  CC      drivers/connector/cn_queue.o
  CC      drivers/iommu/iommu-traces.o
  AR      net/sched/built-in.a
  CC      drivers/char/agp/backend.o
  CC      drivers/char/hw_random/via-rng.o
  AR      sound/ppc/built-in.a
  CC      net/unix/af_unix.o
  CC      drivers/acpi/dptf/int340x_thermal.o
  CC      drivers/acpi/tables.o
  AR      arch/x86/kernel/apic/built-in.a
  AR      sound/arm/built-in.a
  CC      drivers/pci/rom.o
  CC      net/unix/garbage.o
  AR      sound/sh/built-in.a
  CC      net/ethtool/coalesce.o
  CC      kernel/locking/percpu-rwsem.o
  CC      crypto/skcipher.o
  CC      net/netfilter/nf_conntrack_proto_icmp.o
  CC      io_uring/msg_ring.o
  CC      drivers/acpi/acpica/evhandler.o
  CC      fs/proc/stat.o
  CC      drivers/gpu/drm/ttm/ttm_range_manager.o
  CC      drivers/virtio/virtio_pci_legacy.o
  CC      arch/x86/mm/pgtable_32.o
  CC      kernel/irq/irqdesc.o
  AR      drivers/char/hw_random/built-in.a
  CC      net/core/secure_seq.o
  AR      drivers/gpu/vga/built-in.a
  CC      drivers/char/mem.o
  AR      lib/crypto/mpi/built-in.a
  CC      lib/crypto/gf128mul.o
  AR      drivers/acpi/dptf/built-in.a
  CC      arch/x86/kernel/cpu/mtrr/centaur.o
  CC      drivers/char/random.o
  CC      arch/x86/mm/iomap_32.o
  CC      arch/x86/mm/hugetlbpage.o
  CC      kernel/power/main.o
  CC      drivers/char/misc.o
  CC      arch/x86/mm/dump_pagetables.o
  CC      drivers/tty/serial/8250/8250_exar.o
  CC      arch/x86/mm/highmem_32.o
  CC      drivers/acpi/acpica/evmisc.o
  CC      drivers/char/agp/generic.o
  CC      fs/proc/uptime.o
  CC      sound/core/isadma.o
  CC      kernel/locking/spinlock.o
  CC      drivers/pci/setup-res.o
  CC      security/selinux/ss/avtab.o
  CC      arch/x86/events/intel/cstate.o
  CC      drivers/iommu/iommu-sysfs.o
  CC      fs/proc/util.o
  CC      fs/proc/version.o
  CC      drivers/connector/connector.o
  CC      block/blk-timeout.o
  CC      security/selinux/ss/policydb.o
  CC      drivers/acpi/acpica/evregion.o
  CC      fs/proc/softirqs.o
  CC      drivers/pci/irq.o
  CC      block/blk-lib.o
  CC      drivers/virtio/virtio_pci_admin_legacy_io.o
  CC      arch/x86/kernel/cpu/mtrr/legacy.o
  CC      sound/core/vmaster.o
  CC      drivers/gpu/drm/ttm/ttm_resource.o
  CC      security/selinux/ss/services.o
  CC      kernel/locking/osq_lock.o
  CC      lib/crypto/blake2s.o
  CC      security/selinux/ss/conditional.o
  CC      net/ipv4/ip_output.o
  CC      drivers/tty/serial/serial_port.o
  CC      kernel/irq/handle.o
  CC      net/ethtool/pause.o
  CC      io_uring/timeout.o
  CC      net/xfrm/xfrm_hash.o
  CC      arch/x86/kernel/cpu/microcode/core.o
  CC      net/xfrm/xfrm_input.o
  CC      drivers/char/virtio_console.o
  AR      arch/x86/mm/built-in.a
  CC      crypto/seqiv.o
  CC      crypto/echainiv.o
  CC      kernel/locking/qspinlock.o
  COPY    drivers/tty/vt/defkeymap.c
  CC      drivers/gpu/drm/display/drm_dsc_helper.o
  CC      drivers/tty/vt/consolemap.o
  CC      drivers/char/hpet.o
  CC      kernel/printk/nbcon.o
  CC      drivers/tty/serial/8250/8250_lpss.o
  CC      mm/shrinker.o
  AR      arch/x86/kernel/cpu/mtrr/built-in.a
  CC      drivers/tty/serial/8250/8250_mid.o
  CC      drivers/gpu/drm/ttm/ttm_pool.o
  CC      drivers/virtio/virtio_input.o
  CC      drivers/acpi/acpica/evrgnini.o
  CC      lib/zstd/zstd_common_module.o
  CC      fs/proc/namespaces.o
  CC      drivers/char/agp/isoch.o
  CC      lib/crypto/blake2s-generic.o
  CC      net/netfilter/nf_conntrack_extend.o
  CC      drivers/iommu/dma-iommu.o
  CC      kernel/power/console.o
  CC      sound/core/ctljack.o
  CC      net/core/flow_dissector.o
  CC      kernel/power/process.o
  CC      kernel/irq/manage.o
  CC      drivers/pci/vpd.o
  CC      lib/xz/xz_dec_syms.o
  AR      arch/x86/events/intel/built-in.a
  CC      net/xfrm/xfrm_output.o
  AR      arch/x86/events/built-in.a
  CC      fs/proc/self.o
  CC      kernel/printk/printk_ringbuffer.o
  CC      drivers/tty/serial/earlycon.o
  CC      kernel/rcu/update.o
  CC      kernel/locking/rtmutex_api.o
  CC      block/blk-mq.o
  CC      lib/zstd/common/debug.o
  CC      lib/zstd/common/entropy_common.o
  CC      drivers/acpi/acpica/evsci.o
  CC      drivers/connector/cn_proc.o
  CC      kernel/rcu/sync.o
  CC      lib/xz/xz_dec_stream.o
  CC      arch/x86/kernel/cpu/microcode/intel.o
  CC      lib/crypto/sha1.o
  CC      net/ipv6/netfilter/ip6_tables.o
  CC      sound/core/jack.o
  CC      crypto/ahash.o
  CC      lib/zstd/common/error_private.o
  CC      net/xfrm/xfrm_sysctl.o
  CC      drivers/gpu/drm/i915/i915_config.o
  CC      lib/zstd/common/fse_decompress.o
  CC      crypto/shash.o
  CC      net/ethtool/eee.o
  CC      drivers/tty/serial/8250/8250_pci.o
  CC      crypto/akcipher.o
  CC      drivers/virtio/virtio_dma_buf.o
  HOSTCC  drivers/tty/vt/conmakehash
  CC      arch/x86/kernel/cpu/microcode/amd.o
  CC      drivers/char/agp/amd64-agp.o
  CC      security/selinux/ss/mls.o
  CC      sound/core/timer.o
  AR      sound/synth/emux/built-in.a
  AR      sound/synth/built-in.a
  CC      sound/core/hrtimer.o
  CC      drivers/acpi/acpica/evxface.o
  CC      mm/shmem.o
  CC      lib/crypto/sha256.o
  CC      security/selinux/ss/context.o
  CC      net/unix/sysctl_net_unix.o
  CC      drivers/gpu/drm/display/drm_hdcp_helper.o
  CC      fs/proc/thread_self.o
  CC      drivers/gpu/drm/ttm/ttm_device.o
  CC      io_uring/sqpoll.o
  CC      kernel/printk/sysctl.o
  CC      drivers/gpu/drm/i915/i915_driver.o
  CC      drivers/tty/serial/8250/8250_pericom.o
  CC      drivers/tty/vt/defkeymap.o
  CC      lib/xz/xz_dec_lzma2.o
  CC      drivers/pci/setup-bus.o
  CC      lib/xz/xz_dec_bcj.o
  CC      drivers/gpu/drm/ttm/ttm_sys_manager.o
  AR      kernel/printk/built-in.a
  CC      sound/core/seq_device.o
  CC      net/netfilter/nf_conntrack_acct.o
  CONMK   drivers/tty/vt/consolemap_deftbl.c
  CC      drivers/tty/vt/consolemap_deftbl.o
  CC      lib/zstd/common/zstd_common.o
  AR      kernel/sched/built-in.a
  AR      drivers/tty/vt/built-in.a
  CC      mm/util.o
  CC      drivers/tty/tty_io.o
  CC      drivers/gpu/drm/ttm/ttm_agp_backend.o
  CC      io_uring/fdinfo.o
  CC      io_uring/tctx.o
  AR      lib/zstd/built-in.a
  CC      kernel/locking/qrwlock.o
  CC      mm/mmzone.o
  CC      mm/vmstat.o
  CC      drivers/acpi/acpica/evxfevnt.o
  AR      drivers/virtio/built-in.a
  CC      kernel/power/suspend.o
  CC      mm/backing-dev.o
  CC      drivers/iommu/iova.o
  CC      fs/proc/proc_sysctl.o
  AR      lib/crypto/built-in.a
  CC      lib/dim/dim.o
  AS      arch/x86/kernel/head_32.o
  AR      drivers/connector/built-in.a
  CC      crypto/sig.o
  AR      arch/x86/kernel/cpu/microcode/built-in.a
  CC      crypto/kpp.o
  CC      drivers/char/agp/intel-agp.o
  CC      drivers/pci/vc.o
  CC      drivers/base/power/sysfs.o
  CC      arch/x86/kernel/cpu/cacheinfo.o
  CC      kernel/irq/spurious.o
  CC      drivers/pci/mmap.o
  CC      drivers/char/nvram.o
  CC      drivers/gpu/drm/display/drm_hdmi_helper.o
  ASN.1   crypto/rsapubkey.asn1.[ch]
  CC      drivers/base/power/generic_ops.o
  CC      net/netfilter/nf_conntrack_seqadj.o
  CC      net/ethtool/tsinfo.o
  AR      lib/xz/built-in.a
  CC      drivers/base/firmware_loader/builtin/main.o
  CC      arch/x86/kernel/cpu/scattered.o
  CC      security/lsm_audit.o
  CC      net/xfrm/xfrm_replay.o
  CC      drivers/acpi/acpica/evxfgpe.o
  AR      kernel/locking/built-in.a
  AR      net/unix/built-in.a
  CC      io_uring/poll.o
  CC      lib/fonts/fonts.o
  AR      kernel/livepatch/built-in.a
  CC      lib/fonts/font_8x16.o
  CC      net/ipv4/ip_sockglue.o
  CC      kernel/dma/mapping.o
  CC      lib/dim/net_dim.o
  CC      kernel/dma/direct.o
  AR      drivers/gpu/drm/ttm/built-in.a
  CC      mm/mm_init.o
  AR      drivers/tty/serial/8250/built-in.a
  AR      drivers/tty/serial/built-in.a
  ASN.1   crypto/rsaprivkey.asn1.[ch]
  CC      drivers/tty/n_tty.o
  CC      kernel/dma/ops_helpers.o
  AR      drivers/base/firmware_loader/builtin/built-in.a
  CC      drivers/base/firmware_loader/main.o
  CC      security/selinux/netlabel.o
  CC      drivers/base/power/common.o
  CC      kernel/irq/resend.o
  CC      net/core/sysctl_net_core.o
  CC      arch/x86/kernel/cpu/topology_common.o
  CC      arch/x86/kernel/cpu/topology_ext.o
  CC      net/ipv6/netfilter/ip6table_filter.o
  CC      lib/argv_split.o
  AR      lib/fonts/built-in.a
  CC [M]  sound/core/hwdep.o
  CC      mm/percpu.o
  CC      drivers/pci/devres.o
  AR      drivers/gpu/drm/renesas/rcar-du/built-in.a
  CC      drivers/acpi/acpica/evxfregn.o
  AR      drivers/gpu/drm/renesas/rz-du/built-in.a
  AR      drivers/gpu/drm/omapdrm/built-in.a
  AR      drivers/gpu/drm/renesas/built-in.a
  AR      drivers/iommu/built-in.a
  CC      net/ipv6/netfilter/ip6table_mangle.o
  CC      lib/bug.o
  CC      security/device_cgroup.o
  CC      drivers/gpu/drm/display/drm_scdc_helper.o
  CC      lib/buildid.o
  CC      lib/dim/rdma_dim.o
  CC      arch/x86/kernel/cpu/topology_amd.o
  CC      drivers/block/loop.o
  CC      fs/proc/proc_net.o
  CC      drivers/char/agp/intel-gtt.o
  CC      net/core/dev.o
  CC      crypto/rsa.o
  CC      net/ipv6/netfilter/nf_defrag_ipv6_hooks.o
  CC      kernel/rcu/srcutree.o
  CC      drivers/pci/proc.o
  CC      net/netfilter/nf_conntrack_proto_icmpv6.o
  CC      kernel/power/hibernate.o
  CC      drivers/tty/tty_ioctl.o
  CC      kernel/irq/chip.o
  CC      io_uring/cancel.o
  CC      io_uring/kbuf.o
  CC      drivers/gpu/drm/i915/i915_drm_client.o
  AR      drivers/gpu/drm/tilcdc/built-in.a
  CC      net/ethtool/cabletest.o
  CC      drivers/acpi/acpica/exconcat.o
  CC      net/ethtool/tunnels.o
  CC      drivers/gpu/drm/i915/i915_getparam.o
  CC      drivers/base/power/qos.o
  AR      lib/dim/built-in.a
  CC      block/blk-mq-tag.o
  CC      crypto/rsa_helper.o
  CC      drivers/tty/tty_ldisc.o
  CC      kernel/dma/dummy.o
  CC      arch/x86/kernel/cpu/common.o
  CC      kernel/dma/remap.o
  CC      drivers/tty/tty_buffer.o
  CC [M]  sound/core/pcm.o
  CC      drivers/gpu/drm/virtio/virtgpu_drv.o
  CC [M]  sound/core/pcm_native.o
  CC      drivers/gpu/drm/virtio/virtgpu_kms.o
  CC      net/xfrm/xfrm_device.o
  CC      lib/clz_tab.o
  CC      block/blk-stat.o
  CC      lib/cmdline.o
  CC      drivers/base/power/runtime.o
  AR      drivers/base/firmware_loader/built-in.a
  CC      block/blk-mq-sysfs.o
  CC      crypto/rsa-pkcs1pad.o
  CC      drivers/gpu/drm/i915/i915_ioctl.o
  AR      drivers/gpu/drm/display/built-in.a
  CC      lib/cpumask.o
  CC      drivers/acpi/acpica/exconfig.o
  CC      fs/proc/kcore.o
  CC      drivers/base/regmap/regmap.o
  AR      drivers/base/test/built-in.a
  CC      drivers/base/regmap/regcache.o
  AR      drivers/char/agp/built-in.a
  CC      net/ipv6/netfilter/nf_conntrack_reasm.o
  AR      drivers/char/built-in.a
  AR      security/selinux/built-in.a
  CC      net/ipv6/netfilter/nf_reject_ipv6.o
  CC      drivers/base/regmap/regcache-rbtree.o
  CC      drivers/pci/pci-sysfs.o
  CC      net/core/dev_addr_lists.o
  CC      drivers/tty/tty_port.o
  CC      drivers/tty/tty_mutex.o
  AR      security/built-in.a
  AR      kernel/dma/built-in.a
  CC      fs/proc/vmcore.o
  CC      net/ipv6/netfilter/ip6t_ipv6header.o
  CC      drivers/base/regmap/regcache-flat.o
  CC      arch/x86/kernel/head32.o
  CC      kernel/entry/common.o
  CC      drivers/acpi/acpica/exconvrt.o
  CC      kernel/irq/dummychip.o
  CC      kernel/entry/syscall_user_dispatch.o
  CC      drivers/acpi/blacklist.o
  CC      fs/proc/kmsg.o
  CC      block/blk-mq-cpumap.o
  CC      drivers/acpi/acpica/excreate.o
  CC      kernel/module/main.o
  CC      lib/ctype.o
  CC      lib/dec_and_lock.o
  CC      kernel/rcu/tree.o
  CC      net/ipv6/netfilter/ip6t_REJECT.o
  CC      drivers/acpi/acpica/exdebug.o
  CC      net/ipv4/inet_hashtables.o
  CC      drivers/gpu/drm/virtio/virtgpu_gem.o
  CC      block/blk-mq-sched.o
  CC      io_uring/rsrc.o
  CC      net/ethtool/fec.o
  CC      kernel/module/strict_rwx.o
  CC      crypto/acompress.o
  CC      lib/decompress.o
  CC      net/xfrm/xfrm_algo.o
  CC      drivers/block/virtio_blk.o
  CC      net/netfilter/nf_conntrack_netlink.o
  CC      fs/sysfs/file.o
  CC      lib/decompress_bunzip2.o
  CC      fs/devpts/inode.o
  CC      net/netfilter/nf_conntrack_ftp.o
  CC      kernel/power/snapshot.o
  CC [M]  sound/core/pcm_lib.o
  CC      kernel/irq/devres.o
  CC      drivers/gpu/drm/i915/i915_irq.o
  CC      fs/sysfs/dir.o
  CC      drivers/base/power/wakeirq.o
  AR      drivers/misc/eeprom/built-in.a
  AR      drivers/mfd/built-in.a
  AR      drivers/nfc/built-in.a
  CC      drivers/acpi/acpica/exdump.o
  CC      net/ipv6/af_inet6.o
  AR      drivers/misc/cb710/built-in.a
  AR      drivers/misc/ti-st/built-in.a
  CC      drivers/gpu/drm/virtio/virtgpu_vram.o
  CC      net/ipv6/anycast.o
  CC      drivers/base/regmap/regcache-maple.o
  AR      drivers/misc/lis3lv02d/built-in.a
  CC      drivers/tty/tty_ldsem.o
  CC      drivers/base/regmap/regmap-debugfs.o
  CC      net/ethtool/eeprom.o
  AR      drivers/misc/cardreader/built-in.a
  CC      net/ethtool/stats.o
  AR      drivers/misc/built-in.a
  CC      net/ethtool/phc_vclocks.o
  CC      drivers/gpu/drm/virtio/virtgpu_display.o
  CC      mm/slab_common.o
  CC      arch/x86/kernel/cpu/rdrand.o
  CC      arch/x86/kernel/cpu/match.o
  CC      arch/x86/kernel/ebda.o
  CC      crypto/scompress.o
  CC      fs/proc/page.o
  CC      drivers/acpi/acpica/exfield.o
  CC      kernel/module/kmod.o
  CC      kernel/irq/autoprobe.o
  CC      kernel/power/swap.o
  AR      kernel/entry/built-in.a
  CC      kernel/time/time.o
  CC      drivers/base/power/main.o
  CC      fs/sysfs/symlink.o
  CC      drivers/pci/slot.o
  CC      kernel/module/tree_lookup.o
  CC      lib/decompress_inflate.o
  CC      drivers/pci/pci-acpi.o
  CC      fs/sysfs/mount.o
  CC      fs/sysfs/group.o
  CC      drivers/base/power/wakeup.o
  CC      net/netfilter/nf_conntrack_irc.o
  AR      fs/devpts/built-in.a
  CC      drivers/pci/iomap.o
  CC      arch/x86/kernel/cpu/bugs.o
  CC      drivers/tty/tty_baudrate.o
  AR      sound/usb/misc/built-in.a
  CC      drivers/acpi/acpica/exfldio.o
  CC      kernel/futex/core.o
  AR      sound/usb/usx2y/built-in.a
  CC      kernel/futex/syscalls.o
  AR      sound/usb/caiaq/built-in.a
  AR      sound/usb/6fire/built-in.a
  AR      net/ipv6/netfilter/built-in.a
  CC      drivers/gpu/drm/virtio/virtgpu_vq.o
  AR      sound/usb/hiface/built-in.a
  AR      sound/firewire/built-in.a
  CC      kernel/futex/pi.o
  CC      drivers/base/power/wakeup_stats.o
  AR      sound/usb/bcd2000/built-in.a
  AR      sound/usb/built-in.a
  CC      kernel/rcu/rcu_segcblist.o
  CC      drivers/gpu/drm/virtio/virtgpu_fence.o
  CC      block/ioctl.o
  CC      kernel/irq/irqdomain.o
  CC      net/xfrm/xfrm_user.o
  CC      net/ethtool/mm.o
  AR      drivers/block/built-in.a
  CC      kernel/irq/proc.o
  CC      lib/decompress_unlz4.o
  CC      drivers/pci/quirks.o
  AR      fs/proc/built-in.a
  CC      net/ethtool/module.o
  CC      fs/netfs/buffered_read.o
  CC      io_uring/rw.o
  CC      crypto/algboss.o
  CC      net/ethtool/pse-pd.o
  CC      fs/netfs/buffered_write.o
  CC      net/ethtool/plca.o
  CC      crypto/testmgr.o
  AR      drivers/gpu/drm/imx/built-in.a
  CC      net/ipv4/inet_timewait_sock.o
  CC      drivers/acpi/osi.o
  CC      kernel/module/kallsyms.o
  AR      sound/sparc/built-in.a
  CC      drivers/acpi/acpica/exmisc.o
  AR      sound/spi/built-in.a
  CC      net/netfilter/nf_conntrack_sip.o
  CC      crypto/cmac.o
  AR      fs/sysfs/built-in.a
  CC      kernel/module/procfs.o
  CC      fs/ext4/balloc.o
  CC      drivers/tty/tty_jobctrl.o
  CC      drivers/gpu/drm/i915/i915_mitigations.o
  CC      fs/ext4/bitmap.o
  CC [M]  sound/core/pcm_misc.o
  CC      kernel/time/timer.o
  AR      sound/parisc/built-in.a
  CC      lib/decompress_unlzma.o
  CC      net/ipv4/inet_connection_sock.o
  CC      crypto/hmac.o
  CC      net/ipv6/ip6_output.o
  CC      net/ipv4/tcp.o
  CC      drivers/tty/n_null.o
  CC      net/netfilter/nf_nat_core.o
  CC      net/netfilter/nf_nat_proto.o
  CC      kernel/futex/requeue.o
  CC      drivers/acpi/acpica/exmutex.o
  CC [M]  sound/core/pcm_memory.o
  CC      kernel/power/user.o
  CC      fs/netfs/direct_read.o
  CC      mm/compaction.o
  AR      drivers/base/regmap/built-in.a
  CC      fs/netfs/direct_write.o
  CC      kernel/power/poweroff.o
  CC      drivers/acpi/osl.o
  CC      crypto/crypto_null.o
  CC      kernel/irq/migration.o
  CC      block/genhd.o
  CC      block/ioprio.o
  CC      kernel/module/sysfs.o
  CC      drivers/gpu/drm/virtio/virtgpu_object.o
  CC      drivers/gpu/drm/virtio/virtgpu_debugfs.o
  CC      block/badblocks.o
  CC      kernel/irq/cpuhotplug.o
  AR      drivers/gpu/drm/i2c/built-in.a
  AR      drivers/gpu/drm/panel/built-in.a
  CC      mm/show_mem.o
  CC      kernel/time/hrtimer.o
  CC      drivers/gpu/drm/virtio/virtgpu_plane.o
  CC      net/netfilter/nf_nat_helper.o
  CC      drivers/acpi/acpica/exnames.o
  CC      arch/x86/kernel/cpu/aperfmperf.o
  CC      drivers/base/power/trace.o
  CC      drivers/acpi/utils.o
  AR      sound/pcmcia/vx/built-in.a
  AR      sound/mips/built-in.a
  AR      sound/pcmcia/pdaudiocf/built-in.a
  CC      crypto/md5.o
  CC      fs/ext4/block_validity.o
  AR      sound/pcmcia/built-in.a
  AR      net/ethtool/built-in.a
  CC      drivers/tty/pty.o
  AR      drivers/gpu/drm/bridge/analogix/built-in.a
  AR      drivers/gpu/drm/hisilicon/built-in.a
  CC      drivers/base/component.o
  CC      lib/decompress_unlzo.o
  AR      drivers/gpu/drm/bridge/cadence/built-in.a
  CC      io_uring/opdef.o
  AR      drivers/gpu/drm/bridge/imx/built-in.a
  AR      drivers/gpu/drm/mxsfb/built-in.a
  CC      lib/decompress_unxz.o
  AR      drivers/gpu/drm/tiny/built-in.a
  AR      drivers/gpu/drm/bridge/synopsys/built-in.a
  AR      drivers/gpu/drm/bridge/built-in.a
  AR      drivers/gpu/drm/xlnx/built-in.a
  CC      drivers/base/core.o
  CC      drivers/acpi/acpica/exoparg1.o
  CC      kernel/futex/waitwake.o
  CC [M]  sound/core/memalloc.o
  CC      drivers/gpu/drm/i915/i915_module.o
  CC      drivers/gpu/drm/i915/i915_params.o
  CC      net/ipv4/tcp_input.o
  AR      kernel/power/built-in.a
  CC      net/netfilter/nf_nat_masquerade.o
  CC      kernel/cgroup/cgroup.o
  CC      drivers/pci/pci-label.o
  CC      net/ipv4/tcp_output.o
  CC      mm/shmem_quota.o
  AR      kernel/module/built-in.a
  CC      lib/decompress_unzstd.o
  CC      fs/netfs/io.o
  AR      drivers/gpu/drm/gud/built-in.a
  CC      block/blk-rq-qos.o
  CC      crypto/sha256_generic.o
  AR      drivers/gpu/drm/solomon/built-in.a
  CC      drivers/gpu/drm/virtio/virtgpu_ioctl.o
  CC      kernel/irq/pm.o
  CC [M]  drivers/gpu/drm/scheduler/sched_main.o
  CC      arch/x86/kernel/cpu/cpuid-deps.o
  CC [M]  drivers/gpu/drm/scheduler/sched_fence.o
  CC      drivers/acpi/acpica/exoparg2.o
  CC [M]  drivers/gpu/drm/scheduler/sched_entity.o
  CC      net/ipv4/tcp_timer.o
  AR      drivers/base/power/built-in.a
  CC      crypto/sha512_generic.o
  CC      drivers/gpu/drm/virtio/virtgpu_prime.o
  CC      arch/x86/kernel/cpu/umwait.o
  CC      fs/jbd2/transaction.o
  CC      arch/x86/kernel/platform-quirks.o
  CC      drivers/tty/tty_audit.o
  CC      drivers/base/bus.o
  MKCAP   arch/x86/kernel/cpu/capflags.c
  CC      crypto/sha3_generic.o
  AR      kernel/futex/built-in.a
  CC      drivers/gpu/drm/virtio/virtgpu_trace_points.o
  CC      io_uring/notif.o
  AR      drivers/dax/hmem/built-in.a
  AR      drivers/dax/built-in.a
  CC      drivers/dma-buf/dma-buf.o
  CC      drivers/gpu/drm/i915/i915_pci.o
  CC      drivers/gpu/drm/i915/i915_scatterlist.o
  CC      fs/jbd2/commit.o
  CC      net/ipv6/ip6_input.o
  CC      lib/dump_stack.o
  CC      drivers/dma-buf/dma-fence.o
  CC      drivers/acpi/acpica/exoparg3.o
  CC      drivers/pci/vgaarb.o
  CC      drivers/dma-buf/dma-fence-array.o
  CC      drivers/dma-buf/dma-fence-chain.o
  CC      block/disk-events.o
  CC [M]  sound/core/pcm_timer.o
  AR      net/xfrm/built-in.a
  CC      drivers/tty/sysrq.o
  CC      drivers/gpu/drm/virtio/virtgpu_submit.o
  CC      fs/ext4/dir.o
  CC      drivers/acpi/acpica/exoparg6.o
  CC      kernel/irq/msi.o
  CC      kernel/time/timekeeping.o
  CC      lib/earlycpio.o
  CC      kernel/time/ntp.o
  CC      kernel/irq/affinity.o
  AR      kernel/rcu/built-in.a
  CC      net/ipv4/tcp_ipv4.o
  CC      net/packet/af_packet.o
  CC      drivers/acpi/acpica/exprep.o
  AR      net/dsa/built-in.a
  CC      net/sunrpc/auth_gss/auth_gss.o
  CC      drivers/gpu/drm/i915/i915_suspend.o
  CC      net/sunrpc/clnt.o
  AR      net/wireless/tests/built-in.a
  CC      net/sunrpc/auth_gss/gss_generic_token.o
  CC      net/wireless/core.o
  CC      drivers/gpu/drm/i915/i915_switcheroo.o
  CC      drivers/gpu/drm/i915/i915_sysfs.o
  CC      crypto/ecb.o
  CC      net/netfilter/nf_nat_ftp.o
  CC      net/wireless/sysfs.o
  CC      net/sunrpc/xprt.o
  CC      fs/ext4/ext4_jbd2.o
  CC      fs/netfs/iterator.o
  CC      lib/extable.o
  CC      fs/ext4/extents.o
  CC      drivers/gpu/drm/i915/i915_utils.o
  CC      drivers/gpu/drm/i915/intel_clock_gating.o
  LD [M]  sound/core/snd-hwdep.o
  CC      drivers/acpi/acpica/exregion.o
  LD [M]  sound/core/snd-pcm.o
  AR      sound/core/built-in.a
  AR      sound/soc/built-in.a
  CC      drivers/gpu/drm/i915/intel_device_info.o
  AR      sound/atmel/built-in.a
  AR      sound/hda/built-in.a
  CC [M]  sound/hda/hda_bus_type.o
  CC [M]  sound/hda/hdac_bus.o
  CC      net/ipv6/addrconf.o
  LD [M]  drivers/gpu/drm/scheduler/gpu-sched.o
  CC      block/blk-ia-ranges.o
  CC      crypto/cbc.o
  AR      drivers/gpu/drm/virtio/built-in.a
  CC      lib/flex_proportions.o
  CC      drivers/gpu/drm/drm_aperture.o
  CC      io_uring/waitid.o
  CC      mm/interval_tree.o
  CC      fs/ext4/extents_status.o
  AR      drivers/pci/built-in.a
  AR      drivers/tty/built-in.a
  CC      fs/ext4/file.o
  CC      drivers/dma-buf/dma-fence-unwrap.o
  CC      drivers/dma-buf/dma-resv.o
  CC      fs/ext4/fsmap.o
  AR      sound/x86/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_bb.o
  CC      drivers/dma-buf/sync_file.o
  CC      drivers/acpi/acpica/exresnte.o
  CC      io_uring/register.o
  AR      drivers/cxl/core/built-in.a
  AR      drivers/cxl/built-in.a
  CC      block/early-lookup.o
  CC      fs/jbd2/recovery.o
  CC      lib/idr.o
  CC      mm/list_lru.o
  CC      kernel/irq/matrix.o
  CC      net/core/dst.o
  CC      arch/x86/kernel/process_32.o
  CC      drivers/gpu/drm/i915/intel_memory_region.o
  CC      crypto/ctr.o
  CC      drivers/acpi/acpica/exresolv.o
  CC      drivers/base/dd.o
  CC      drivers/base/syscore.o
  CC      crypto/gcm.o
  CC      fs/netfs/locking.o
  CC      drivers/acpi/acpica/exresop.o
  CC      net/ipv4/tcp_minisocks.o
  CC [M]  sound/hda/hdac_device.o
  AR      sound/xen/built-in.a
  CC      kernel/time/clocksource.o
  CC [M]  sound/hda/hdac_sysfs.o
  CC [M]  sound/hda/hdac_regmap.o
  CC      net/netfilter/nf_nat_irc.o
  CC      drivers/macintosh/mac_hid.o
  AR      drivers/scsi/pcmcia/built-in.a
  CC      drivers/scsi/scsi.o
  CC      block/bounce.o
  CC      net/ipv4/tcp_cong.o
  CC [M]  drivers/gpu/drm/xe/xe_bo.o
  CC      io_uring/truncate.o
  CC      lib/irq_regs.o
  CC      fs/ext4/fsync.o
  CC      mm/workingset.o
  AR      drivers/dma-buf/built-in.a
  CC      crypto/ccm.o
  AR      drivers/nvme/common/built-in.a
  CC      drivers/gpu/drm/drm_atomic.o
  AR      drivers/nvme/host/built-in.a
  CC      drivers/acpi/acpica/exserial.o
  AR      drivers/nvme/target/built-in.a
  AR      drivers/nvme/built-in.a
  CC      lib/is_single_threaded.o
  CC      block/bsg.o
  CC      lib/klist.o
  CC      mm/debug.o
  CC      fs/ext4/hash.o
  AR      drivers/macintosh/built-in.a
  CC      io_uring/io-wq.o
  CC      fs/jbd2/checkpoint.o
  CC      drivers/base/driver.o
  CC      drivers/acpi/acpica/exstore.o
  CC      drivers/acpi/acpica/exstoren.o
  CC      drivers/acpi/acpica/exstorob.o
  CC      fs/netfs/main.o
  CC      drivers/acpi/acpica/exsystem.o
  CC      arch/x86/kernel/signal.o
  CC      arch/x86/kernel/signal_32.o
  CC      net/sunrpc/auth_gss/gss_mech_switch.o
  CC      drivers/gpu/drm/i915/intel_pcode.o
  CC      lib/kobject.o
  CC      drivers/acpi/acpica/extrace.o
  CC      net/ipv4/tcp_metrics.o
  CC      kernel/time/jiffies.o
  CC      drivers/ata/libata-core.o
  CC [M]  sound/hda/hdac_controller.o
  AR      kernel/irq/built-in.a
  CC      fs/jbd2/revoke.o
  CC      net/core/netevent.o
  CC      net/netfilter/nf_nat_sip.o
  CC      drivers/ata/libata-scsi.o
  CC      fs/netfs/misc.o
  CC      drivers/acpi/acpica/exutils.o
  CC      net/core/neighbour.o
  CC      net/core/rtnetlink.o
  CC      net/core/utils.o
  CC      net/netfilter/x_tables.o
  CC      kernel/trace/trace_clock.o
  CC      drivers/base/class.o
  CC      crypto/aes_generic.o
  CC      fs/netfs/objects.o
  CC      mm/gup.o
  CC      kernel/time/timer_list.o
  CC      kernel/cgroup/rstat.o
  CC      net/ipv4/tcp_fastopen.o
  CC      block/blk-cgroup.o
  CC      lib/kobject_uevent.o
  CC [M]  sound/hda/hdac_stream.o
  CC      drivers/scsi/hosts.o
  CC      fs/ext4/ialloc.o
  CC      drivers/acpi/acpica/hwacpi.o
  CC      kernel/trace/ring_buffer.o
  CC      drivers/acpi/acpica/hwesleep.o
  CC      kernel/time/timeconv.o
  CC      kernel/bpf/core.o
  CC      net/core/link_watch.o
  AR      net/packet/built-in.a
  CC      net/ipv4/tcp_rate.o
  CC      net/sunrpc/auth_gss/svcauth_gss.o
  CC      kernel/time/timecounter.o
  CC      net/sunrpc/auth_gss/gss_rpc_upcall.o
  CC      mm/mmap_lock.o
  AR      drivers/net/phy/qcom/built-in.a
  CC      drivers/net/phy/mdio-boardinfo.o
  CC      fs/jbd2/journal.o
  CC      drivers/net/phy/stubs.o
  CC      drivers/gpu/drm/i915/intel_region_ttm.o
  CC      fs/ext4/indirect.o
  CC      fs/ext4/inline.o
  CC      net/sunrpc/socklib.o
  CC      mm/highmem.o
  CC      drivers/acpi/acpica/hwgpe.o
  CC      drivers/firewire/init_ohci1394_dma.o
  CC      drivers/base/platform.o
  CC      crypto/crc32c_generic.o
  CC      kernel/time/alarmtimer.o
  CC      drivers/cdrom/cdrom.o
  CC      net/wireless/radiotap.o
  CC      fs/netfs/output.o
  CC      kernel/time/posix-timers.o
  CC      net/sunrpc/xprtsock.o
  CC [M]  drivers/gpu/drm/xe/xe_bo_evict.o
  CC      io_uring/futex.o
  CC [M]  drivers/gpu/drm/xe/xe_debugfs.o
  CC      drivers/acpi/reboot.o
  CC      kernel/cgroup/namespace.o
  CC      net/core/filter.o
  AR      drivers/auxdisplay/built-in.a
  CC      fs/ramfs/inode.o
  CC      drivers/pcmcia/cs.o
  CC [M]  sound/hda/array.o
  CC      drivers/acpi/acpica/hwregs.o
  CC      drivers/scsi/scsi_ioctl.o
  CC      crypto/authenc.o
  CC      lib/logic_pio.o
  CC      lib/maple_tree.o
  AR      drivers/firewire/built-in.a
  CC      net/sunrpc/auth_gss/gss_rpc_xdr.o
  CC      arch/x86/kernel/traps.o
  CC      drivers/net/phy/mdio_devres.o
  CC      net/sunrpc/auth_gss/trace.o
  CC      net/ipv4/tcp_recovery.o
  CC      net/ipv4/tcp_ulp.o
  CC      net/sunrpc/auth_gss/gss_krb5_mech.o
  CC      drivers/gpu/drm/i915/intel_runtime_pm.o
  CC      mm/memory.o
  CC      drivers/acpi/acpica/hwsleep.o
  CC      drivers/acpi/acpica/hwvalid.o
  CC      kernel/cgroup/cgroup-v1.o
  CC      block/blk-ioprio.o
  CC      mm/mincore.o
  CC      net/netfilter/xt_tcpudp.o
  CC [M]  drivers/gpu/drm/xe/xe_devcoredump.o
  CC      net/ipv4/tcp_offload.o
  CC      net/wireless/util.o
  CC      net/wireless/reg.o
  CC      drivers/base/cpu.o
  CC      net/ipv6/addrlabel.o
  CC [M]  sound/hda/hdmi_chmap.o
  AR      fs/netfs/built-in.a
  CC      net/ipv6/route.o
  CC      io_uring/napi.o
  CC      fs/ramfs/file-mmu.o
  CC      net/ipv6/ip6_fib.o
  CC      net/ipv6/ipv6_sockglue.o
  CC      drivers/input/serio/serio.o
  CC      drivers/usb/common/common.o
  CC      drivers/pcmcia/socket_sysfs.o
  CC      kernel/time/posix-cpu-timers.o
  CC      drivers/usb/common/debug.o
  CC      arch/x86/kernel/cpu/powerflags.o
  CC      drivers/acpi/acpica/hwxface.o
  CC      drivers/scsi/scsicam.o
  CC      arch/x86/kernel/cpu/topology.o
  CC      kernel/events/core.o
  CC      drivers/net/phy/phy.o
  CC      crypto/authencesn.o
  CC      kernel/events/ring_buffer.o
  CC      net/sunrpc/auth_gss/gss_krb5_seal.o
  CC      net/sunrpc/auth_gss/gss_krb5_unseal.o
  AR      drivers/cdrom/built-in.a
  CC      kernel/trace/trace.o
  CC      kernel/events/callchain.o
  CC      drivers/acpi/acpica/hwxfsleep.o
  AR      fs/ramfs/built-in.a
  CC      block/blk-iolatency.o
  CC [M]  drivers/gpu/drm/xe/xe_device.o
  CC      block/blk-iocost.o
  CC      fs/hugetlbfs/inode.o
  CC      kernel/trace/trace_output.o
  CC      fs/ext4/inode.o
  AR      drivers/net/pse-pd/built-in.a
  CC      drivers/input/serio/i8042.o
  CC      drivers/base/firmware.o
  CC      kernel/trace/trace_seq.o
  CC      drivers/pcmcia/cardbus.o
  AR      drivers/usb/common/built-in.a
  CC [M]  sound/hda/trace.o
  CC      drivers/usb/core/usb.o
  CC      arch/x86/kernel/cpu/proc.o
  CC      drivers/usb/core/hub.o
  CC      arch/x86/kernel/cpu/feat_ctl.o
  CC      drivers/scsi/scsi_error.o
  CC      drivers/gpu/drm/i915/intel_sbi.o
  CC      drivers/usb/core/hcd.o
  AR      kernel/bpf/built-in.a
  CC      drivers/acpi/acpica/hwpci.o
  CC      net/sunrpc/auth_gss/gss_krb5_wrap.o
  CC      net/ipv6/ndisc.o
  CC      net/netfilter/xt_CONNSECMARK.o
  CC      kernel/cgroup/freezer.o
  CC      drivers/gpu/drm/drm_atomic_uapi.o
  AR      fs/jbd2/built-in.a
  CC      drivers/base/init.o
  CC      drivers/usb/core/urb.o
  CC      net/ipv4/tcp_plb.o
  AR      net/mac80211/tests/built-in.a
  CC      net/mac80211/main.o
  CC      net/sunrpc/auth_gss/gss_krb5_crypto.o
  CC      kernel/time/posix-clock.o
  CC      fs/ext4/ioctl.o
  CC      drivers/pcmcia/ds.o
  CC      net/netlabel/netlabel_user.o
  AR      io_uring/built-in.a
  CC      fs/ext4/mballoc.o
  CC      drivers/gpu/drm/drm_auth.o
  CC      crypto/lzo.o
  CC      drivers/acpi/acpica/nsaccess.o
  CC      arch/x86/kernel/cpu/intel.o
  CC      net/netlabel/netlabel_kapi.o
  CC      fs/fat/cache.o
  CC      drivers/net/phy/phy-c45.o
  CC [M]  drivers/gpu/drm/xe/xe_device_sysfs.o
  CC      drivers/ata/libata-eh.o
  CC [M]  sound/hda/hdac_component.o
  CC      fs/fat/dir.o
  CC      arch/x86/kernel/cpu/intel_pconfig.o
  CC      arch/x86/kernel/cpu/tsx.o
  CC      drivers/base/map.o
  CC      drivers/gpu/drm/i915/intel_step.o
  CC      fs/ext4/migrate.o
  CC      net/rfkill/core.o
  AR      fs/hugetlbfs/built-in.a
  CC      drivers/acpi/acpica/nsalloc.o
  CC      net/rfkill/input.o
  CC      drivers/input/serio/serport.o
  CC      fs/isofs/namei.o
  CC      kernel/trace/trace_stat.o
  CC      drivers/pcmcia/pcmcia_resource.o
  CC      kernel/cgroup/legacy_freezer.o
  CC      crypto/lzo-rle.o
  CC      kernel/time/itimer.o
  CC [M]  drivers/gpu/drm/xe/xe_dma_buf.o
  CC      drivers/gpu/drm/drm_blend.o
  CC      net/netfilter/xt_NFLOG.o
  CC      lib/memcat_p.o
  CC      arch/x86/kernel/cpu/intel_epb.o
  CC      drivers/base/devres.o
  CC      drivers/scsi/scsi_lib.o
  CC      drivers/acpi/acpica/nsarguments.o
  CC      net/sunrpc/auth_gss/gss_krb5_keys.o
  CC      drivers/scsi/constants.o
  CC      net/sunrpc/sched.o
  CC      drivers/acpi/acpica/nsconvert.o
  CC      crypto/rng.o
  CC      net/ipv4/datagram.o
  CC      drivers/usb/core/message.o
  CC      fs/nfs/client.o
  CC [M]  sound/hda/hdac_i915.o
  CC      drivers/gpu/drm/drm_bridge.o
  CC      kernel/cgroup/pids.o
  CC      drivers/input/serio/libps2.o
  CC [M]  drivers/gpu/drm/xe/xe_drm_client.o
  CC      lib/nmi_backtrace.o
  CC      fs/isofs/inode.o
  CC      drivers/pcmcia/cistpl.o
  CC [M]  sound/hda/intel-dsp-config.o
  CC      arch/x86/kernel/cpu/amd.o
  AR      net/rfkill/built-in.a
  CC      mm/mlock.o
  CC      fs/fat/fatent.o
  CC      drivers/acpi/acpica/nsdump.o
  CC      kernel/trace/trace_printk.o
  CC      net/netlabel/netlabel_domainhash.o
  CC      drivers/gpu/drm/i915/intel_uncore.o
  CC      fs/ext4/mmp.o
  CC [M]  sound/hda/intel-nhlt.o
  CC      fs/nfs/dir.o
  CC      drivers/net/phy/phy-core.o
  CC      kernel/time/clockevents.o
  CC      drivers/base/attribute_container.o
  CC      drivers/pcmcia/pcmcia_cis.o
  CC      drivers/scsi/scsi_lib_dma.o
  CC      fs/fat/file.o
  CC [M]  sound/hda/intel-sdw-acpi.o
  CC      drivers/acpi/acpica/nseval.o
  CC      drivers/base/transport_class.o
  CC      kernel/cgroup/rdma.o
  CC      net/netfilter/xt_SECMARK.o
  AR      net/sunrpc/auth_gss/built-in.a
  CC      crypto/drbg.o
  CC      crypto/jitterentropy.o
  CC      drivers/base/topology.o
  CC      block/mq-deadline.o
  AR      drivers/usb/phy/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_exec.o
  AR      drivers/input/serio/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_execlist.o
  CC      drivers/usb/mon/mon_main.o
  CC      drivers/gpu/drm/drm_cache.o
  CC      drivers/usb/mon/mon_stat.o
  CC      block/kyber-iosched.o
  CC      net/ipv4/raw.o
  CC      drivers/acpi/acpica/nsinit.o
  CC      fs/ext4/move_extent.o
  CC      arch/x86/kernel/cpu/hygon.o
  LD [M]  sound/hda/snd-hda-core.o
  CC      kernel/time/tick-common.o
  CC      net/mac80211/status.o
  LD [M]  sound/hda/snd-intel-dspcfg.o
  LD [M]  sound/hda/snd-intel-sdw-acpi.o
  AR      sound/virtio/built-in.a
  CC      sound/sound_core.o
  CC      kernel/fork.o
  CC      drivers/pcmcia/rsrc_mgr.o
  CC      drivers/usb/core/driver.o
  CC [M]  drivers/gpu/drm/xe/xe_exec_queue.o
  CC      fs/ext4/namei.o
  CC      net/ipv6/udp.o
  CC      fs/ext4/page-io.o
  CC      kernel/cgroup/cpuset.o
  CC      fs/isofs/dir.o
  CC      drivers/scsi/scsi_scan.o
  CC      net/wireless/scan.o
  CC      kernel/trace/pid_list.o
  CC      drivers/base/container.o
  CC      sound/last.o
  CC      drivers/net/phy/phy_device.o
  CC      fs/nfs/file.o
  CC      drivers/acpi/acpica/nsload.o
  CC      drivers/usb/mon/mon_text.o
  CC      mm/mmap.o
  CC      mm/mmu_gather.o
  CC      arch/x86/kernel/cpu/centaur.o
  CC      arch/x86/kernel/cpu/transmeta.o
  CC      drivers/pcmcia/rsrc_nonstatic.o
  CC      drivers/usb/mon/mon_bin.o
  CC      crypto/jitterentropy-kcapi.o
  CC      net/netfilter/xt_TCPMSS.o
  CC      drivers/gpu/drm/drm_client.o
  CC      drivers/gpu/drm/drm_client_modeset.o
  CC      fs/fat/inode.o
  CC      net/netlabel/netlabel_addrlist.o
  CC      fs/nfs/getroot.o
  CC      net/sunrpc/auth.o
  CC      drivers/base/property.o
  AR      sound/built-in.a
  CC      drivers/acpi/acpica/nsnames.o
  CC      drivers/base/cacheinfo.o
  CC      drivers/acpi/acpica/nsobject.o
  CC      drivers/ata/libata-transport.o
  CC      drivers/gpu/drm/drm_color_mgmt.o
  CC      kernel/trace/trace_sched_switch.o
  CC      crypto/ghash-generic.o
  CC      fs/isofs/util.o
  CC      arch/x86/kernel/idt.o
  CC      lib/objpool.o
  CC      arch/x86/kernel/cpu/zhaoxin.o
  CC      block/blk-mq-pci.o
  CC      kernel/time/tick-broadcast.o
  CC      kernel/time/tick-broadcast-hrtimer.o
  CC      drivers/input/keyboard/atkbd.o
  CC      kernel/time/tick-oneshot.o
  CC      kernel/time/tick-sched.o
  CC      drivers/acpi/acpica/nsparse.o
  CC      drivers/input/mouse/psmouse-base.o
  CC      drivers/usb/core/config.o
  CC      net/wireless/nl80211.o
  CC      drivers/pcmcia/yenta_socket.o
  CC      crypto/hash_info.o
  CC      kernel/events/hw_breakpoint.o
  CC      arch/x86/kernel/cpu/vortex.o
  CC      crypto/rsapubkey.asn1.o
  CC      lib/plist.o
  AR      drivers/usb/mon/built-in.a
  CC      crypto/rsaprivkey.asn1.o
  GEN     drivers/scsi/scsi_devinfo_tbl.c
  CC      arch/x86/kernel/cpu/perfctr-watchdog.o
  CC      drivers/scsi/scsi_devinfo.o
  AR      crypto/built-in.a
  CC      net/ipv4/udp.o
  CC      fs/ext4/readpage.o
  CC      block/blk-mq-virtio.o
  CC      lib/radix-tree.o
  CC      drivers/usb/host/pci-quirks.o
  CC      drivers/gpu/drm/i915/intel_wakeref.o
  CC      drivers/gpu/drm/drm_connector.o
  CC      net/wireless/mlme.o
  CC      fs/isofs/rock.o
  CC      drivers/acpi/acpica/nspredef.o
  CC      net/netlabel/netlabel_mgmt.o
  CC      drivers/usb/host/ehci-hcd.o
  CC      drivers/acpi/acpica/nsprepkg.o
  CC      drivers/gpu/drm/drm_crtc.o
  CC [M]  drivers/gpu/drm/xe/xe_force_wake.o
  CC      drivers/ata/libata-trace.o
  CC      fs/ext4/resize.o
  CC      arch/x86/kernel/cpu/vmware.o
  CC      block/blk-mq-debugfs.o
  CC      drivers/base/swnode.o
  CC      drivers/usb/class/usblp.o
  CC      net/netfilter/xt_conntrack.o
  CC      fs/fat/misc.o
  CC      net/core/sock_diag.o
  CC      net/netfilter/xt_policy.o
  CC      drivers/acpi/acpica/nsrepair.o
  CC      kernel/trace/trace_nop.o
  AR      drivers/input/keyboard/built-in.a
  CC      net/core/dev_ioctl.o
  AR      drivers/input/joystick/built-in.a
  CC      fs/ext4/super.o
  CC      drivers/net/phy/linkmode.o
  CC      fs/nfs/inode.o
  CC      drivers/usb/host/ehci-pci.o
  CC      kernel/time/timer_migration.o
  CC      drivers/input/mouse/synaptics.o
  CC      drivers/scsi/scsi_sysctl.o
  CC      fs/ext4/symlink.o
  CC      kernel/cgroup/misc.o
  CC      drivers/usb/core/file.o
  CC      arch/x86/kernel/cpu/hypervisor.o
  CC      fs/fat/nfs.o
  CC      lib/ratelimit.o
  CC      net/netlabel/netlabel_unlabeled.o
  CC      fs/isofs/export.o
  CC      fs/ext4/sysfs.o
  CC      drivers/acpi/acpica/nsrepair2.o
  CC      drivers/usb/host/ohci-hcd.o
  CC      net/ipv6/udplite.o
  CC      kernel/events/uprobes.o
  CC [M]  drivers/gpu/drm/xe/xe_ggtt.o
  CC      arch/x86/kernel/cpu/mshyperv.o
  AR      drivers/pcmcia/built-in.a
  CC      drivers/usb/core/buffer.o
  CC      drivers/gpu/drm/i915/vlv_sideband.o
  CC      drivers/base/auxiliary.o
  CC      drivers/base/devtmpfs.o
  CC      lib/rbtree.o
  CC      kernel/trace/blktrace.o
  CC      fs/fat/namei_vfat.o
  CC      mm/mprotect.o
  AR      drivers/usb/class/built-in.a
  CC      net/wireless/ibss.o
  CC      block/blk-pm.o
  CC      net/mac80211/driver-ops.o
  CC      drivers/usb/storage/scsiglue.o
  CC      fs/fat/namei_msdos.o
  CC      drivers/usb/storage/protocol.o
  CC      kernel/cgroup/debug.o
  CC      drivers/ata/libata-sata.o
  CC      drivers/net/phy/mdio_bus.o
  CC      drivers/ata/libata-sff.o
  CC      net/netfilter/xt_state.o
  CC      drivers/acpi/acpica/nssearch.o
  CC      drivers/scsi/scsi_proc.o
  CC      arch/x86/kernel/cpu/debugfs.o
  CC      lib/seq_buf.o
  CC      net/core/tso.o
  AR      drivers/input/tablet/built-in.a
  CC      net/core/sock_reuseport.o
  CC      fs/isofs/joliet.o
  CC      arch/x86/kernel/irq.o
  CC [M]  net/netfilter/nf_log_syslog.o
  CC      drivers/gpu/drm/i915/vlv_suspend.o
  AR      drivers/input/touchscreen/built-in.a
  CC      drivers/usb/storage/transport.o
  CC      drivers/usb/core/sysfs.o
  CC      fs/ext4/xattr.o
  CC      drivers/acpi/acpica/nsutils.o
  CC      drivers/ata/libata-pmp.o
  CC [M]  drivers/gpu/drm/xe/xe_gpu_scheduler.o
  CC      arch/x86/kernel/cpu/capflags.o
  CC      net/ipv6/raw.o
  CC      block/holder.o
  CC      drivers/base/module.o
  CC      net/ipv6/icmp.o
  CC      mm/mremap.o
  AR      arch/x86/kernel/cpu/built-in.a
  CC      fs/isofs/compress.o
  CC      fs/nfs/super.o
  CC      drivers/input/mouse/focaltech.o
  CC      lib/siphash.o
  CC      arch/x86/kernel/irq_32.o
  AR      kernel/cgroup/built-in.a
  CC      drivers/gpu/drm/i915/soc/intel_dram.o
  CC [M]  net/netfilter/xt_mark.o
  CC      net/sunrpc/auth_null.o
  AR      drivers/usb/misc/built-in.a
  CC      drivers/usb/early/ehci-dbgp.o
  CC      net/sunrpc/auth_tls.o
  HOSTCC  drivers/gpu/drm/xe/xe_gen_wa_oob
  CC      net/sunrpc/auth_unix.o
  AR      fs/fat/built-in.a
  CC      net/netlabel/netlabel_cipso_v4.o
  CC      fs/nfs/io.o
  CC      drivers/scsi/scsi_debugfs.o
  CC      drivers/acpi/acpica/nswalk.o
  CC      kernel/time/vsyscall.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc_proxy.o
  CC      drivers/base/devcoredump.o
  CC [M]  net/netfilter/xt_nat.o
  AR      kernel/events/built-in.a
  CC      net/9p/mod.o
  CC      drivers/ata/libata-acpi.o
  CC      net/dns_resolver/dns_key.o
  CC      drivers/usb/core/endpoint.o
  CC      drivers/usb/storage/usb.o
  AR      block/built-in.a
  CC      lib/string.o
  CC      drivers/usb/core/devio.o
  CC      drivers/net/phy/mdio_device.o
  CC      drivers/input/mouse/alps.o
  CC      drivers/acpi/acpica/nsxfeval.o
  CC      net/handshake/alert.o
  CC      drivers/acpi/acpica/nsxfname.o
  CC      mm/msync.o
  CC      kernel/time/timekeeping_debug.o
  CC      drivers/usb/host/ohci-pci.o
  CC      net/ipv4/udplite.o
  CC      net/handshake/genl.o
  CC      net/core/fib_notifier.o
  CC      lib/timerqueue.o
  AR      fs/isofs/built-in.a
  CC      kernel/trace/trace_events.o
  CC      drivers/net/phy/swphy.o
  CC      drivers/net/phy/fixed_phy.o
  CC      drivers/gpu/drm/drm_displayid.o
  AR      drivers/usb/early/built-in.a
  CC      net/sunrpc/svc.o
  CC      drivers/scsi/scsi_trace.o
  CC      drivers/base/platform-msi.o
  CC      lib/vsprintf.o
  CC      net/9p/client.o
  CC      drivers/gpu/drm/drm_drv.o
  CC      drivers/scsi/scsi_logging.o
  CC      net/ipv4/udp_offload.o
  CC      fs/ext4/xattr_hurd.o
  CC      drivers/acpi/acpica/nsxfobj.o
  CC      fs/ext4/xattr_trusted.o
  CC      net/sunrpc/svcsock.o
  CC      net/dns_resolver/dns_query.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc_submit.o
  CC      drivers/gpu/drm/i915/soc/intel_gmch.o
  CC      kernel/time/namespace.o
  CC      drivers/net/mdio/acpi_mdio.o
  CC      arch/x86/kernel/dumpstack_32.o
  CC      drivers/net/mdio/fwnode_mdio.o
  CC      drivers/ata/libata-pata-timings.o
  CC      net/9p/error.o
  CC      net/netlabel/netlabel_calipso.o
  CC      drivers/usb/host/uhci-hcd.o
  CC      mm/page_vma_mapped.o
  CC      drivers/acpi/acpica/psargs.o
  CC      fs/nfs/direct.o
  CC      drivers/usb/host/xhci.o
  CC      drivers/gpu/drm/drm_dumb_buffers.o
  CC      fs/nfs/pagelist.o
  CC [M]  net/netfilter/xt_LOG.o
  CC      fs/nfs/read.o
  CC [M]  drivers/gpu/drm/xe/xe_gt.o
  CC      drivers/base/physical_location.o
  CC      drivers/usb/storage/initializers.o
  CC      fs/nfs/symlink.o
  CC      net/core/xdp.o
  CC      drivers/net/phy/realtek.o
  CC      net/ipv6/mcast.o
  CC      drivers/scsi/scsi_pm.o
  CC      fs/ext4/xattr_user.o
  CC      drivers/scsi/scsi_bsg.o
  CC      net/9p/protocol.o
  CC      drivers/acpi/acpica/psloop.o
  CC      mm/pagewalk.o
  AR      net/dns_resolver/built-in.a
  CC      net/ipv6/reassembly.o
  CC      net/9p/trans_common.o
  CC      arch/x86/kernel/time.o
  AR      kernel/time/built-in.a
  CC      net/handshake/netlink.o
  CC      net/wireless/sme.o
  CC      arch/x86/kernel/ioport.o
  CC      net/handshake/request.o
  CC      arch/x86/kernel/dumpstack.o
  CC      drivers/base/trace.o
  CC      drivers/scsi/scsi_common.o
  CC      drivers/ata/ahci.o
  CC      drivers/gpu/drm/i915/soc/intel_pch.o
  AR      drivers/net/mdio/built-in.a
  CC      net/mac80211/sta_info.o
  CC      drivers/gpu/drm/i915/i915_memcpy.o
  CC      fs/ext4/fast_commit.o
  CC      drivers/input/mouse/byd.o
  CC      net/9p/trans_fd.o
  AR      drivers/net/pcs/built-in.a
  CC      mm/pgtable-generic.o
  CC      kernel/trace/trace_export.o
  AR      drivers/net/ethernet/3com/built-in.a
  CC      drivers/net/ethernet/8390/ne2k-pci.o
  CC      drivers/acpi/acpica/psobject.o
  AR      drivers/net/ethernet/adaptec/built-in.a
  CC      drivers/gpu/drm/i915/i915_mm.o
  CC      drivers/usb/storage/sierra_ms.o
  AR      drivers/net/ethernet/agere/built-in.a
  CC      arch/x86/kernel/nmi.o
  CC      net/9p/trans_virtio.o
  CC      drivers/usb/core/notify.o
  CC      drivers/scsi/scsi_transport_spi.o
  AR      net/netlabel/built-in.a
  CC      kernel/trace/trace_event_perf.o
  CC      net/ipv4/arp.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_ccs_mode.o
  AR      drivers/net/wireless/admtek/built-in.a
  CC      net/ipv4/icmp.o
  AR      drivers/net/wireless/ath/built-in.a
  AR      drivers/net/usb/built-in.a
  CC      net/ipv4/devinet.o
  CC      net/ipv4/af_inet.o
  CC      drivers/scsi/virtio_scsi.o
  AR      drivers/net/wireless/atmel/built-in.a
  AR      drivers/net/wireless/broadcom/built-in.a
  AR      drivers/net/wireless/intel/built-in.a
  AR      drivers/net/wireless/intersil/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_clock.o
  AR      drivers/net/wireless/marvell/built-in.a
  AR      drivers/net/wireless/mediatek/built-in.a
  CC [M]  net/netfilter/xt_MASQUERADE.o
  CC      kernel/exec_domain.o
  CC      drivers/gpu/drm/i915/i915_sw_fence.o
  AR      drivers/net/wireless/microchip/built-in.a
  CC      drivers/acpi/acpica/psopcode.o
  AR      drivers/net/wireless/purelifi/built-in.a
  AR      drivers/net/wireless/quantenna/built-in.a
  AR      drivers/net/phy/built-in.a
  AR      drivers/net/wireless/ralink/built-in.a
  CC      arch/x86/kernel/ldt.o
  CC      net/sunrpc/svcauth.o
  AR      drivers/base/built-in.a
  AR      drivers/net/wireless/realtek/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_debugfs.o
  AR      drivers/net/wireless/rsi/built-in.a
  CC      drivers/input/mouse/logips2pp.o
  AR      drivers/net/wireless/silabs/built-in.a
  AR      drivers/net/wireless/st/built-in.a
  AR      drivers/net/wireless/ti/built-in.a
  AR      drivers/net/wireless/zydas/built-in.a
  AR      drivers/net/wireless/virtual/built-in.a
  AR      drivers/net/wireless/built-in.a
  CC      mm/rmap.o
  CC      net/ipv4/igmp.o
  CC      kernel/trace/trace_events_filter.o
  CC      drivers/usb/storage/option_ms.o
  CC      drivers/usb/storage/usual-tables.o
  CC      drivers/usb/core/generic.o
  CC      drivers/acpi/acpica/psopinfo.o
  CC      drivers/usb/host/xhci-mem.o
  CC      kernel/trace/trace_events_trigger.o
  CC      drivers/input/mouse/lifebook.o
  CC      net/core/flow_offload.o
  CC      drivers/gpu/drm/i915/i915_sw_fence_work.o
  CC      mm/vmalloc.o
  CC      drivers/ata/libahci.o
  CC      drivers/net/ethernet/8390/8390.o
  CC      mm/process_vm_access.o
  CC      kernel/panic.o
  CC      mm/page_alloc.o
  CC      lib/win_minmax.o
  CC      net/handshake/tlshd.o
  CC      drivers/input/mouse/trackpoint.o
  CC      net/mac80211/wep.o
  CC      arch/x86/kernel/setup.o
  CC [M]  net/netfilter/xt_addrtype.o
  CC      drivers/input/mouse/cypress_ps2.o
  CC      drivers/acpi/acpica/psparse.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_freq.o
  CC      drivers/gpu/drm/i915/i915_syncmap.o
  CC      fs/nfs/unlink.o
  CC      arch/x86/kernel/x86_init.o
  AR      drivers/net/ethernet/alacritech/built-in.a
  AR      net/9p/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_idle.o
  CC      net/wireless/chan.o
  CC      drivers/acpi/acpica/psscope.o
  CC      arch/x86/kernel/i8259.o
  CC      lib/xarray.o
  CC      drivers/usb/core/quirks.o
  CC      drivers/gpu/drm/i915/i915_user_extensions.o
  CC      drivers/usb/core/devices.o
  AR      drivers/usb/storage/built-in.a
  CC      kernel/trace/trace_eprobe.o
  CC      drivers/acpi/acpica/pstree.o
  CC      drivers/scsi/sd.o
  CC      net/mac80211/aead_api.o
  CC      fs/nfs/write.o
  CC      drivers/acpi/acpica/psutils.o
  CC      net/sunrpc/svcauth_unix.o
  AR      drivers/net/ethernet/alteon/built-in.a
  CC      net/ipv4/fib_frontend.o
  CC      drivers/net/mii.o
  CC      net/sunrpc/addr.o
  CC      drivers/gpu/drm/i915/i915_debugfs.o
  CC      drivers/usb/host/xhci-ext-caps.o
  CC      net/handshake/trace.o
  CC      drivers/acpi/acpica/pswalk.o
  CC      drivers/input/mouse/psmouse-smbus.o
  CC      net/ipv4/fib_semantics.o
  CC      drivers/usb/host/xhci-ring.o
  CC      drivers/usb/host/xhci-hub.o
  CC      net/ipv6/tcp_ipv6.o
  CC      net/mac80211/wpa.o
  CC      net/core/gro.o
  AR      drivers/net/ethernet/8390/built-in.a
  CC      drivers/gpu/drm/i915/i915_debugfs_params.o
  CC      drivers/rtc/lib.o
  CC      kernel/trace/trace_kprobe.o
  AR      drivers/net/ethernet/amazon/built-in.a
  CC      fs/nfs/namespace.o
  AR      drivers/net/ethernet/amd/built-in.a
  CC      drivers/rtc/class.o
  AR      drivers/net/ethernet/aquantia/built-in.a
  CC      drivers/acpi/acpica/psxface.o
  AR      drivers/net/ethernet/arc/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_mcr.o
  AR      drivers/net/ethernet/asix/built-in.a
  CC      kernel/trace/error_report-traces.o
  AR      drivers/net/ethernet/atheros/built-in.a
  CC      arch/x86/kernel/irqinit.o
  CC      drivers/i2c/algos/i2c-algo-bit.o
  AR      drivers/net/ethernet/cadence/built-in.a
  CC      drivers/usb/core/phy.o
  CC      drivers/gpu/drm/drm_edid.o
  CC      drivers/net/ethernet/broadcom/bnx2.o
  CC      drivers/i2c/busses/i2c-i801.o
  CC      drivers/net/ethernet/broadcom/tg3.o
  AR      net/netfilter/built-in.a
  CC      lib/lockref.o
  CC      drivers/ata/ata_piix.o
  CC      drivers/acpi/nvs.o
  CC      drivers/acpi/acpica/rsaddr.o
  CC      fs/ext4/orphan.o
  CC      lib/bcd.o
  CC      lib/sort.o
  CC      drivers/ata/pata_amd.o
  CC      drivers/ata/pata_oldpiix.o
  CC      drivers/rtc/interface.o
  AR      drivers/input/mouse/built-in.a
  AR      drivers/input/misc/built-in.a
  CC      drivers/input/input.o
  CC      mm/init-mm.o
  CC      lib/parser.o
  CC      drivers/usb/host/xhci-dbg.o
  CC      net/mac80211/scan.o
  AR      drivers/net/ethernet/brocade/built-in.a
  AR      drivers/i3c/built-in.a
  CC      kernel/trace/power-traces.o
  AR      drivers/media/i2c/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_pagefault.o
  AR      drivers/media/tuners/built-in.a
  CC      net/sunrpc/rpcb_clnt.o
  AR      drivers/media/rc/keymaps/built-in.a
  CC      net/sunrpc/timer.o
  AR      drivers/media/rc/built-in.a
  CC      drivers/acpi/acpica/rscalc.o
  CC      drivers/usb/core/port.o
  CC      drivers/usb/host/xhci-trace.o
  AR      drivers/media/common/b2c2/built-in.a
  CC      drivers/gpu/drm/i915/i915_pmu.o
  CC      net/sunrpc/xdr.o
  AR      drivers/media/common/saa7146/built-in.a
  AR      drivers/media/common/siano/built-in.a
  CC      arch/x86/kernel/jump_label.o
  AR      drivers/media/common/v4l2-tpg/built-in.a
  AR      drivers/i2c/algos/built-in.a
  AR      drivers/media/common/videobuf2/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_sysfs.o
  AR      drivers/media/common/built-in.a
  CC      lib/debug_locks.o
  AR      drivers/media/platform/allegro-dvt/built-in.a
  AR      drivers/media/platform/amlogic/meson-ge2d/built-in.a
  AR      drivers/media/platform/amlogic/built-in.a
  CC      fs/nfs/mount_clnt.o
  AR      drivers/media/platform/amphion/built-in.a
  CC      drivers/acpi/wakeup.o
  AR      drivers/media/platform/aspeed/built-in.a
  AR      drivers/media/platform/atmel/built-in.a
  AR      drivers/media/platform/cadence/built-in.a
  AR      drivers/media/platform/chips-media/coda/built-in.a
  CC      drivers/usb/host/xhci-debugfs.o
  CC      drivers/input/input-compat.o
  AR      drivers/media/platform/chips-media/wave5/built-in.a
  CC      drivers/acpi/sleep.o
  AR      drivers/media/platform/chips-media/built-in.a
  CC      lib/random32.o
  AR      drivers/media/platform/intel/built-in.a
  CC      kernel/trace/rpm-traces.o
  AR      net/handshake/built-in.a
  AR      drivers/media/platform/marvell/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.o
  AR      drivers/media/platform/mediatek/jpeg/built-in.a
  AR      drivers/media/platform/mediatek/mdp/built-in.a
  AR      drivers/media/platform/mediatek/vcodec/common/built-in.a
  CC      drivers/acpi/acpica/rscreate.o
  AR      drivers/media/platform/mediatek/vcodec/encoder/built-in.a
  AR      drivers/i2c/busses/built-in.a
  AR      drivers/media/platform/mediatek/vcodec/decoder/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o
  AR      drivers/media/platform/mediatek/vcodec/built-in.a
  AR      drivers/i2c/muxes/built-in.a
  CC      drivers/i2c/i2c-boardinfo.o
  AR      drivers/media/platform/mediatek/vpu/built-in.a
  AR      drivers/media/platform/mediatek/mdp3/built-in.a
  CC      net/wireless/ethtool.o
  AR      drivers/media/platform/mediatek/built-in.a
  AR      drivers/pps/clients/built-in.a
  AR      drivers/pps/generators/built-in.a
  CC      drivers/pps/pps.o
  AR      drivers/media/platform/microchip/built-in.a
  CC      fs/ext4/acl.o
  AR      drivers/media/platform/nuvoton/built-in.a
  AR      drivers/media/platform/nvidia/tegra-vde/built-in.a
  AR      drivers/media/platform/nvidia/built-in.a
  CC      drivers/rtc/nvmem.o
  CC      lib/bust_spinlocks.o
  AR      drivers/media/platform/nxp/dw100/built-in.a
  CC      arch/x86/kernel/irq_work.o
  AR      drivers/media/platform/nxp/imx-jpeg/built-in.a
  AR      drivers/media/platform/nxp/imx8-isi/built-in.a
  CC      lib/kasprintf.o
  AR      drivers/media/platform/nxp/built-in.a
  CC      drivers/scsi/sr.o
  CC      drivers/rtc/dev.o
  CC      arch/x86/kernel/probe_roms.o
  AR      drivers/media/platform/qcom/camss/built-in.a
  CC      drivers/ata/pata_sch.o
  AR      drivers/media/platform/qcom/venus/built-in.a
  CC      drivers/rtc/proc.o
  AR      drivers/media/platform/qcom/built-in.a
  CC      net/core/netdev-genl.o
  CC      net/wireless/mesh.o
  CC      drivers/acpi/acpica/rsdumpinfo.o
  CC      drivers/acpi/device_sysfs.o
  AR      drivers/media/platform/renesas/rcar-vin/built-in.a
  AR      drivers/media/platform/renesas/rzg2l-cru/built-in.a
  CC      drivers/input/input-mt.o
  AR      drivers/media/platform/renesas/vsp1/built-in.a
  AR      drivers/media/platform/renesas/built-in.a
  CC      drivers/pps/kapi.o
  AR      drivers/media/platform/rockchip/rga/built-in.a
  AR      drivers/media/platform/rockchip/rkisp1/built-in.a
  CC      drivers/usb/core/hcd-pci.o
  AR      drivers/media/platform/rockchip/built-in.a
  CC      mm/memblock.o
  AR      drivers/media/platform/samsung/exynos-gsc/built-in.a
  AR      drivers/media/platform/samsung/exynos4-is/built-in.a
  AR      drivers/media/platform/samsung/s3c-camif/built-in.a
  AR      drivers/media/platform/samsung/s5p-g2d/built-in.a
  AR      drivers/media/platform/samsung/s5p-jpeg/built-in.a
  AR      drivers/media/platform/st/sti/bdisp/built-in.a
  AR      drivers/media/platform/samsung/s5p-mfc/built-in.a
  AR      drivers/media/platform/sunxi/sun4i-csi/built-in.a
  AR      drivers/media/platform/st/sti/c8sectpfe/built-in.a
  AR      drivers/media/platform/samsung/built-in.a
  CC      drivers/rtc/sysfs.o
  AR      drivers/media/platform/sunxi/sun6i-csi/built-in.a
  AR      drivers/media/platform/st/sti/delta/built-in.a
  CC      kernel/cpu.o
  CC      net/ipv4/fib_trie.o
  CC      kernel/exit.o
  AR      drivers/media/platform/sunxi/sun6i-mipi-csi2/built-in.a
  AR      drivers/media/platform/st/sti/hva/built-in.a
  AR      drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/built-in.a
  AR      drivers/media/platform/st/stm32/built-in.a
  AR      drivers/media/platform/sunxi/sun8i-di/built-in.a
  AR      drivers/media/platform/st/built-in.a
  CC      drivers/usb/host/xhci-pci.o
  CC      drivers/acpi/acpica/rsinfo.o
  AR      drivers/media/platform/sunxi/sun8i-rotate/built-in.a
  CC      drivers/i2c/i2c-core-base.o
  CC      drivers/ata/pata_mpiix.o
  AR      drivers/media/platform/sunxi/built-in.a
  CC      kernel/softirq.o
  AR      drivers/media/platform/ti/am437x/built-in.a
  AR      drivers/media/platform/ti/cal/built-in.a
  CC      kernel/resource.o
  AR      drivers/media/platform/ti/vpe/built-in.a
  CC      lib/bitmap.o
  AR      drivers/media/platform/ti/davinci/built-in.a
  CC      drivers/pps/sysfs.o
  AR      drivers/media/platform/ti/j721e-csi2rx/built-in.a
  CC      net/ipv6/ping.o
  CC      net/sunrpc/sunrpc_syms.o
  CC      lib/scatterlist.o
  AR      drivers/media/platform/ti/omap/built-in.a
  AR      drivers/media/platform/ti/omap3isp/built-in.a
  AR      drivers/media/platform/ti/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_topology.o
  GEN     xe_wa_oob.c xe_wa_oob.h
  CC      mm/slub.o
  AR      drivers/media/platform/verisilicon/built-in.a
  CC      drivers/gpu/drm/i915/gt/gen2_engine_cs.o
  AR      drivers/media/platform/via/built-in.a
  CC      kernel/trace/trace_dynevent.o
  CC      fs/nfs/nfstrace.o
  AR      drivers/media/platform/xilinx/built-in.a
  AR      drivers/media/platform/built-in.a
  CC      fs/nfs/export.o
  CC      fs/ext4/xattr_security.o
  CC      drivers/scsi/sr_ioctl.o
  CC      drivers/acpi/acpica/rsio.o
  CC      drivers/acpi/device_pm.o
  CC      fs/nfs/sysfs.o
  CC      kernel/trace/trace_probe.o
  AR      drivers/media/pci/ttpci/built-in.a
  AR      drivers/media/usb/b2c2/built-in.a
  AR      drivers/media/pci/b2c2/built-in.a
  CC      drivers/input/input-poller.o
  AR      drivers/media/usb/dvb-usb/built-in.a
  CC      drivers/acpi/proc.o
  AR      drivers/media/pci/pluto2/built-in.a
  AR      drivers/media/usb/dvb-usb-v2/built-in.a
  CC      drivers/ata/ata_generic.o
  AR      drivers/media/pci/dm1105/built-in.a
  AR      drivers/media/usb/s2255/built-in.a
  AR      drivers/media/pci/pt1/built-in.a
  AR      drivers/media/usb/ttusb-budget/built-in.a
  AR      drivers/media/usb/siano/built-in.a
  AR      drivers/media/pci/pt3/built-in.a
  AR      drivers/media/pci/mantis/built-in.a
  CC      kernel/sysctl.o
  AR      drivers/media/usb/ttusb-dec/built-in.a
  AR      drivers/media/usb/built-in.a
  AR      drivers/media/pci/ngene/built-in.a
  AR      drivers/media/pci/ddbridge/built-in.a
  AR      drivers/media/pci/saa7146/built-in.a
  AR      drivers/media/pci/smipcie/built-in.a
  AR      drivers/pps/built-in.a
  CC      drivers/scsi/sr_vendor.o
  CC      kernel/capability.o
  CC      net/core/netdev-genl-gen.o
  AR      drivers/media/pci/netup_unidvb/built-in.a
  CC      drivers/rtc/rtc-mc146818-lib.o
  CC      arch/x86/kernel/sys_ia32.o
  AR      drivers/media/pci/intel/ipu3/built-in.a
  CC      arch/x86/kernel/ksysfs.o
  AR      drivers/media/pci/intel/ivsc/built-in.a
  AR      drivers/media/pci/intel/built-in.a
  CC      drivers/usb/core/usb-acpi.o
  AR      drivers/media/pci/built-in.a
  CC      drivers/acpi/acpica/rsirq.o
  AR      drivers/media/mmc/siano/built-in.a
  AR      drivers/media/mmc/built-in.a
  AR      drivers/media/firewire/built-in.a
  AR      drivers/media/spi/built-in.a
  CC      arch/x86/kernel/bootflag.o
  AR      drivers/media/test-drivers/built-in.a
  AR      drivers/media/built-in.a
  CC      lib/list_sort.o
  CC      net/devres.o
  CC      drivers/i2c/i2c-core-smbus.o
  CC      net/mac80211/offchannel.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_ads.o
  CC      drivers/input/ff-core.o
  CC      lib/uuid.o
  CC      mm/madvise.o
  CC      net/core/gso.o
  CC      drivers/acpi/acpica/rslist.o
  CC      net/sunrpc/cache.o
  CC      net/sunrpc/rpc_pipe.o
  CC      kernel/trace/trace_uprobe.o
  AR      fs/ext4/built-in.a
  CC      drivers/acpi/acpica/rsmemory.o
  CC      net/core/net-sysfs.o
  CC      fs/exportfs/expfs.o
  CC      lib/iov_iter.o
  CC      drivers/scsi/sg.o
  CC      lib/clz_ctz.o
  CC      drivers/gpu/drm/i915/gt/gen6_engine_cs.o
  CC      drivers/scsi/scsi_sysfs.o
  CC      drivers/rtc/rtc-cmos.o
  CC      drivers/acpi/bus.o
  CC      fs/lockd/clntlock.o
  CC      net/core/hotdata.o
  CC      fs/lockd/clntproc.o
  AR      drivers/ata/built-in.a
  CC      net/ipv6/exthdrs.o
  AR      drivers/usb/core/built-in.a
  CC      kernel/ptrace.o
  CC      arch/x86/kernel/e820.o
  CC      kernel/user.o
  CC      lib/bsearch.o
  CC      lib/find_bit.o
  CC      drivers/gpu/drm/i915/gt/gen6_ppgtt.o
  CC      fs/nfs/fs_context.o
  CC      drivers/acpi/acpica/rsmisc.o
  CC      drivers/acpi/acpica/rsserial.o
  AR      drivers/usb/host/built-in.a
  AR      drivers/usb/built-in.a
  CC      mm/page_io.o
  CC      net/socket.o
  CC      drivers/input/touchscreen.o
  CC      net/mac80211/ht.o
  CC      drivers/acpi/glue.o
  CC      kernel/signal.o
  CC      drivers/i2c/i2c-core-acpi.o
  AR      fs/exportfs/built-in.a
  CC      drivers/acpi/scan.o
  CC      net/sysctl_net.o
  CC      fs/nls/nls_base.o
  CC      kernel/trace/rethook.o
  CC      drivers/acpi/acpica/rsutils.o
  CC      fs/nls/nls_cp437.o
  CC      fs/nls/nls_ascii.o
  CC      fs/nls/nls_iso8859-1.o
  CC      net/ipv4/fib_notifier.o
  CC      lib/llist.o
  CC      fs/nls/nls_utf8.o
  CC      kernel/sys.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_ct.o
  CC      drivers/ptp/ptp_clock.o
  CC      drivers/net/loopback.o
  CC      drivers/ptp/ptp_chardev.o
  CC      net/ipv4/inet_fragment.o
  CC      drivers/ptp/ptp_sysfs.o
  CC      drivers/input/ff-memless.o
  AR      drivers/rtc/built-in.a
  CC      drivers/gpu/drm/i915/gt/gen7_renderclear.o
  CC      drivers/ptp/ptp_vclock.o
  CC      lib/lwq.o
  CC      drivers/input/sparse-keymap.o
  CC      net/mac80211/agg-tx.o
  CC      net/wireless/ap.o
  CC      fs/lockd/clntxdr.o
  CC      drivers/gpu/drm/drm_eld.o
  AR      drivers/net/ethernet/cavium/common/built-in.a
  CC      drivers/acpi/acpica/rsxface.o
  AR      drivers/net/ethernet/cavium/thunder/built-in.a
  CC      fs/lockd/host.o
  CC      drivers/gpu/drm/drm_encoder.o
  CC      fs/lockd/svc.o
  CC      arch/x86/kernel/pci-dma.o
  AR      drivers/net/ethernet/cavium/liquidio/built-in.a
  AR      fs/nls/built-in.a
  CC      drivers/acpi/acpica/tbdata.o
  AR      drivers/net/ethernet/cavium/octeon/built-in.a
  CC      drivers/acpi/mipi-disco-img.o
  CC      drivers/input/vivaldi-fmap.o
  AR      drivers/net/ethernet/cavium/built-in.a
  CC      arch/x86/kernel/quirks.o
  CC      net/ipv6/datagram.o
  AR      fs/unicode/built-in.a
  CC      net/ipv6/ip6_flowlabel.o
  CC      net/core/net-procfs.o
  CC      fs/lockd/svclock.o
  CC      drivers/i2c/i2c-smbus.o
  AR      drivers/scsi/built-in.a
  CC      net/sunrpc/sysfs.o
  CC      drivers/gpu/drm/i915/gt/gen8_engine_cs.o
  AR      kernel/trace/built-in.a
  CC      kernel/umh.o
  CC      drivers/acpi/acpica/tbfadt.o
  CC      net/core/netpoll.o
  CC      fs/nfs/nfsroot.o
  CC      fs/autofs/init.o
  CC      net/ipv6/inet6_connection_sock.o
  CC      fs/9p/vfs_super.o
  CC      drivers/input/input-leds.o
  CC      fs/9p/vfs_inode.o
  AR      fs/hostfs/built-in.a
  CC      lib/memweight.o
  CC      fs/debugfs/inode.o
  CC      drivers/gpu/drm/drm_file.o
  CC      drivers/ptp/ptp_kvm_x86.o
  CC      drivers/power/supply/power_supply_core.o
  CC      drivers/ptp/ptp_kvm_common.o
  CC      net/ipv4/ping.o
  CC      lib/kfifo.o
  CC      drivers/acpi/resource.o
  CC      drivers/power/supply/power_supply_sysfs.o
  CC      drivers/acpi/acpica/tbfind.o
  CC      drivers/gpu/drm/drm_fourcc.o
  CC      drivers/gpu/drm/i915/gt/gen8_ppgtt.o
  CC      drivers/power/supply/power_supply_leds.o
  CC      mm/swap_state.o
  CC      drivers/acpi/acpi_processor.o
  CC      arch/x86/kernel/topology.o
  CC      fs/lockd/svcshare.o
  AR      drivers/i2c/built-in.a
  CC      net/ipv4/ip_tunnel_core.o
  CC      drivers/input/evdev.o
  CC      fs/autofs/inode.o
  CC      drivers/acpi/acpica/tbinstal.o
  CC      net/mac80211/agg-rx.o
  CC      drivers/power/supply/power_supply_hwmon.o
  CC      fs/lockd/svcproc.o
  CC      drivers/acpi/acpica/tbprint.o
  CC      fs/9p/vfs_inode_dotl.o
  CC      arch/x86/kernel/kdebugfs.o
  CC      net/core/fib_rules.o
  CC      net/wireless/trace.o
  CC      net/ipv4/gre_offload.o
  CC      drivers/acpi/acpica/tbutils.o
  CC      net/ipv4/metrics.o
  CC      arch/x86/kernel/alternative.o
  CC      net/ipv4/netlink.o
  CC      net/ipv4/nexthop.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_db_mgr.o
  CC      net/ipv6/udp_offload.o
  CC      net/ipv4/udp_tunnel_stub.o
  AR      drivers/ptp/built-in.a
  CC      fs/autofs/root.o
  CC      net/wireless/ocb.o
  CC      fs/lockd/svcsubs.o
  CC      fs/lockd/mon.o
  CC      net/mac80211/vht.o
  CC      lib/percpu-refcount.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_debugfs.o
  CC      drivers/acpi/acpica/tbxface.o
  CC      arch/x86/kernel/i8253.o
  CC      drivers/gpu/drm/drm_framebuffer.o
  CC      fs/debugfs/file.o
  CC      kernel/workqueue.o
  CC      fs/lockd/trace.o
  CC      drivers/hwmon/hwmon.o
  CC      net/sunrpc/svc_xprt.o
  CC      fs/9p/vfs_addr.o
  CC      kernel/pid.o
  AR      drivers/power/supply/built-in.a
  AR      drivers/power/built-in.a
  CC      drivers/acpi/acpica/tbxfload.o
  CC      net/core/net-traces.o
  CC      net/core/selftests.o
  AR      drivers/thermal/broadcom/built-in.a
  AR      drivers/thermal/samsung/built-in.a
  AR      drivers/watchdog/built-in.a
  CC      arch/x86/kernel/hw_breakpoint.o
  CC      drivers/thermal/intel/intel_tcc.o
  CC      arch/x86/kernel/tsc.o
  CC      drivers/thermal/intel/therm_throt.o
  CC      drivers/acpi/acpica/tbxfroot.o
  CC      fs/9p/vfs_file.o
  CC      drivers/md/md.o
  CC      kernel/task_work.o
  CC      net/mac80211/he.o
  CC      mm/swapfile.o
  AR      drivers/input/built-in.a
  CC      drivers/md/md-bitmap.o
  CC      mm/swap_slots.o
  CC      net/wireless/pmsr.o
  CC      drivers/md/md-autodetect.o
  CC      lib/rhashtable.o
  CC      net/core/ptp_classifier.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_hwconfig.o
  CC      fs/nfs/sysctl.o
  CC      fs/autofs/symlink.o
  CC      net/ipv4/ip_tunnel.o
  CC      kernel/extable.o
  CC      drivers/gpu/drm/i915/gt/intel_breadcrumbs.o
  CC      drivers/acpi/acpica/utaddress.o
  CC      drivers/gpu/drm/drm_gem.o
  CC      fs/9p/vfs_dir.o
  CC      net/ipv4/sysctl_net_ipv4.o
  CC      fs/nfs/nfs2super.o
  CC      net/ipv6/seg6.o
  CC      fs/autofs/waitq.o
  CC      fs/nfs/proc.o
  CC      net/core/netprio_cgroup.o
  CC      drivers/gpu/drm/i915/gt/intel_context.o
  CC      net/mac80211/s1g.o
  CC      net/core/netclassid_cgroup.o
  CC      drivers/md/dm.o
  CC      drivers/acpi/acpica/utalloc.o
  AR      fs/debugfs/built-in.a
  CC      fs/9p/vfs_dentry.o
  CC      fs/lockd/xdr.o
  CC      fs/9p/v9fs.o
  CC      fs/9p/fid.o
  AR      drivers/hwmon/built-in.a
  CC      mm/dmapool.o
  CC [M]  drivers/thermal/intel/x86_pkg_temp_thermal.o
  CC      net/core/dst_cache.o
  CC      fs/lockd/clnt4xdr.o
  CC      drivers/net/netconsole.o
  CC      arch/x86/kernel/tsc_msr.o
  CC      drivers/md/dm-table.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_id_mgr.o
  CC      arch/x86/kernel/io_delay.o
  CC      drivers/acpi/acpica/utascii.o
  CC      net/core/gro_cells.o
  CC      net/ipv4/proc.o
  CC      drivers/md/dm-target.o
  CC      fs/tracefs/inode.o
  CC      lib/base64.o
  CC      net/mac80211/ibss.o
  CC      fs/tracefs/event_inode.o
  CC      lib/once.o
  CC [M]  fs/efivarfs/inode.o
  CC      lib/refcount.o
  CC      fs/autofs/expire.o
  CC      lib/rcuref.o
  CC      arch/x86/kernel/rtc.o
  CC      drivers/acpi/acpica/utbuffer.o
  CC      mm/hugetlb.o
  CC      fs/9p/xattr.o
  CC      fs/nfs/nfs2xdr.o
  CC      drivers/acpi/acpica/utcksum.o
  CC      kernel/params.o
  CC      net/ipv6/fib6_notifier.o
  CC      fs/autofs/dev-ioctl.o
  CC      arch/x86/kernel/resource.o
  AR      drivers/thermal/intel/built-in.a
  AR      drivers/thermal/st/built-in.a
  CC      lib/usercopy.o
  AR      drivers/thermal/qcom/built-in.a
  AR      drivers/thermal/tegra/built-in.a
  CC      drivers/gpu/drm/drm_ioctl.o
  AR      drivers/thermal/mediatek/built-in.a
  CC      drivers/thermal/thermal_core.o
  GEN     net/wireless/shipped-certs.c
  CC      net/mac80211/iface.o
  CC      fs/open.o
  CC      drivers/gpu/drm/drm_lease.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_log.o
  CC      net/core/failover.o
  CC      net/wireless/shipped-certs.o
  CC      lib/errseq.o
  CC      lib/bucket_locks.o
  CC      fs/read_write.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_pc.o
  CC      drivers/acpi/acpica/utcopy.o
  CC      fs/lockd/xdr4.o
  CC      net/mac80211/link.o
  CC      net/mac80211/rate.o
  AS      arch/x86/kernel/irqflags.o
  CC [M]  fs/efivarfs/file.o
  CC      arch/x86/kernel/static_call.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_submit.o
  CC      drivers/gpu/drm/i915/gt/intel_context_sseu.o
  AR      drivers/net/ethernet/chelsio/built-in.a
  CC      net/mac80211/michael.o
  AR      drivers/net/ethernet/cisco/built-in.a
  AR      drivers/net/ethernet/cortina/built-in.a
  CC      net/mac80211/tkip.o
  CC      net/sunrpc/xprtmultipath.o
  CC [M]  fs/efivarfs/super.o
  AR      drivers/net/ethernet/dec/tulip/built-in.a
  AR      drivers/net/ethernet/dec/built-in.a
  CC      net/mac80211/aes_cmac.o
  CC      drivers/gpu/drm/i915/gt/intel_engine_cs.o
  AR      drivers/net/ethernet/broadcom/built-in.a
  AR      fs/9p/built-in.a
  CC [M]  fs/efivarfs/vars.o
  AR      drivers/net/ethernet/dlink/built-in.a
  CC      drivers/acpi/acpica/utexcep.o
  CC      drivers/acpi/acpica/utdebug.o
  CC      drivers/acpi/acpica/utdecode.o
  AR      drivers/net/ethernet/emulex/built-in.a
  AR      fs/tracefs/built-in.a
  AR      drivers/net/ethernet/engleder/built-in.a
  CC      net/mac80211/aes_gmac.o
  CC      drivers/md/dm-linear.o
  AR      drivers/net/ethernet/ezchip/built-in.a
  AR      drivers/net/ethernet/fujitsu/built-in.a
  AR      drivers/net/ethernet/fungible/built-in.a
  AR      drivers/net/ethernet/google/built-in.a
  AR      drivers/net/ethernet/huawei/built-in.a
  CC      drivers/net/ethernet/intel/e1000/e1000_main.o
  CC      arch/x86/kernel/process.o
  CC      lib/generic-radix-tree.o
  CC      drivers/net/ethernet/intel/e1000/e1000_hw.o
  AR      fs/autofs/built-in.a
  CC      drivers/net/virtio_net.o
  AR      drivers/net/ethernet/i825xx/built-in.a
  CC      drivers/md/dm-stripe.o
  AR      drivers/net/ethernet/microsoft/built-in.a
  CC      net/ipv4/fib_rules.o
  CC      drivers/net/ethernet/intel/e1000e/82571.o
  AR      drivers/net/ethernet/litex/built-in.a
  CC      drivers/net/ethernet/intel/e1000e/ich8lan.o
  CC      mm/mmu_notifier.o
  CC      drivers/net/ethernet/intel/e1000e/80003es2lan.o
  CC      drivers/acpi/acpica/utdelete.o
  CC      drivers/net/net_failover.o
  CC      drivers/md/dm-ioctl.o
  CC      drivers/net/ethernet/intel/e1000e/mac.o
  CC      net/ipv6/rpl.o
  AR      drivers/net/ethernet/marvell/octeon_ep/built-in.a
  CC      drivers/gpu/drm/drm_managed.o
  AR      drivers/net/ethernet/marvell/octeon_ep_vf/built-in.a
  AR      drivers/net/ethernet/marvell/prestera/built-in.a
  AR      drivers/net/ethernet/marvell/octeontx2/built-in.a
  CC      drivers/net/ethernet/marvell/sky2.o
  CC      net/ipv6/ioam6.o
  CC      kernel/kthread.o
  CC      drivers/net/ethernet/intel/e1000e/manage.o
  CC      lib/bitmap-str.o
  CC [M]  drivers/gpu/drm/xe/xe_heci_gsc.o
  CC      drivers/md/dm-io.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine.o
  LD [M]  fs/efivarfs/efivarfs.o
  CC      drivers/md/dm-kcopyd.o
  CC      net/ipv4/ipmr.o
  CC      drivers/acpi/acpica/uterror.o
  CC      mm/migrate.o
  CC      drivers/thermal/thermal_sysfs.o
  CC      fs/lockd/svc4proc.o
  CC      net/mac80211/fils_aead.o
  AR      drivers/net/ethernet/mellanox/built-in.a
  CC      mm/page_counter.o
  CC      drivers/gpu/drm/i915/gt/intel_engine_heartbeat.o
  AR      drivers/net/ethernet/micrel/built-in.a
  CC      mm/hugetlb_cgroup.o
  CC      net/mac80211/cfg.o
  CC      net/sunrpc/stats.o
  CC      drivers/acpi/processor_core.o
  CC      lib/string_helpers.o
  CC      drivers/acpi/acpica/uteval.o
  CC      drivers/gpu/drm/drm_mm.o
  CC      fs/nfs/nfs3super.o
  CC      arch/x86/kernel/ptrace.o
  CC      net/ipv4/ipmr_base.o
  AR      net/core/built-in.a
  CC      net/ipv4/syncookies.o
  CC      kernel/sys_ni.o
  CC      drivers/net/ethernet/intel/e100.o
  CC      kernel/nsproxy.o
  CC      kernel/notifier.o
  CC      drivers/thermal/thermal_trip.o
  CC      mm/early_ioremap.o
  CC      drivers/acpi/acpica/utglobal.o
  CC      drivers/net/ethernet/intel/e1000e/nvm.o
  CC      drivers/net/ethernet/intel/e1000e/phy.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.o
  CC      drivers/md/dm-sysfs.o
  CC      drivers/acpi/processor_pdc.o
  CC      arch/x86/kernel/tls.o
  CC      kernel/ksysfs.o
  CC      drivers/net/ethernet/intel/e1000/e1000_ethtool.o
  CC      net/sunrpc/sysctl.o
  CC      net/ipv6/sysctl_net_ipv6.o
  CC      drivers/acpi/acpica/uthex.o
  CC      kernel/cred.o
  CC      drivers/thermal/thermal_helpers.o
  CC      arch/x86/kernel/step.o
  CC      mm/secretmem.o
  CC      lib/hexdump.o
  CC      fs/lockd/procfs.o
  AR      drivers/net/ethernet/microchip/built-in.a
  CC      mm/memfd.o
  CC      net/ipv6/xfrm6_policy.o
  CC      drivers/net/ethernet/intel/e1000e/param.o
  CC      drivers/gpu/drm/i915/gt/intel_engine_pm.o
  CC      kernel/reboot.o
  CC      lib/kstrtox.o
  CC      fs/file_table.o
  CC      fs/super.o
  CC      drivers/gpu/drm/i915/gt/intel_engine_user.o
  CC      drivers/acpi/acpica/utids.o
  CC      fs/nfs/nfs3client.o
  CC      fs/nfs/nfs3proc.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_fence.o
  CC      net/ipv6/xfrm6_state.o
  CC      drivers/cpufreq/cpufreq.o
  CC      net/ipv6/xfrm6_input.o
  CC      drivers/cpufreq/freq_table.o
  CC      drivers/cpuidle/governors/menu.o
  CC      kernel/async.o
  CC      drivers/thermal/thermal_hwmon.o
  CC      drivers/cpuidle/governors/haltpoll.o
  CC      drivers/cpuidle/cpuidle.o
  CC      net/ipv4/tunnel4.o
  CC      fs/nfs/nfs3xdr.o
  CC      drivers/gpu/drm/drm_mode_config.o
  CC      fs/nfs/nfs3acl.o
  CC      arch/x86/kernel/i8237.o
  CC      drivers/acpi/acpica/utinit.o
  CC      lib/iomap.o
  CC      fs/char_dev.o
  CC      net/mac80211/ethtool.o
  AR      fs/lockd/built-in.a
  CC      drivers/cpufreq/cpufreq_performance.o
  CC      drivers/acpi/acpica/utlock.o
  CC      net/ipv4/ipconfig.o
  CC      drivers/thermal/gov_step_wise.o
  CC      fs/stat.o
  CC [M]  drivers/gpu/drm/xe/xe_huc.o
  CC      net/ipv6/xfrm6_output.o
  CC      kernel/range.o
  CC      drivers/net/ethernet/intel/e1000e/ethtool.o
  CC      net/ipv4/netfilter.o
  CC      net/mac80211/rx.o
  CC [M]  drivers/gpu/drm/xe/xe_huc_debugfs.o
  CC      mm/ptdump.o
  CC      fs/nfs/nfs4proc.o
  CC      arch/x86/kernel/stacktrace.o
  CC      drivers/acpi/acpica/utmath.o
  CC      net/mac80211/spectmgmt.o
  CC      fs/exec.o
  CC      drivers/net/ethernet/intel/e1000e/netdev.o
  CC      drivers/md/dm-stats.o
  CC      fs/pipe.o
  CC      net/ipv4/tcp_cubic.o
  CC      fs/namei.o
  CC      kernel/smpboot.o
  AR      drivers/mmc/built-in.a
  CC      kernel/ucount.o
  CC      drivers/thermal/gov_user_space.o
  CC      net/ipv6/xfrm6_protocol.o
  AR      drivers/ufs/built-in.a
  CC      drivers/md/dm-rq.o
  AR      drivers/leds/trigger/built-in.a
  AR      drivers/leds/blink/built-in.a
  AR      drivers/leds/simple/built-in.a
  CC      drivers/leds/led-core.o
  CC      drivers/gpu/drm/i915/gt/intel_execlists_submission.o
  CC      lib/iomap_copy.o
  CC      drivers/md/dm-io-rewind.o
  CC      lib/devres.o
  AR      drivers/net/ethernet/marvell/built-in.a
  AR      drivers/firmware/arm_ffa/built-in.a
  CC      drivers/acpi/acpica/utmisc.o
  AR      drivers/firmware/arm_scmi/built-in.a
  CC      drivers/acpi/acpica/utmutex.o
  AR      drivers/firmware/broadcom/built-in.a
  AR      net/sunrpc/built-in.a
  AR      drivers/firmware/cirrus/built-in.a
  AR      drivers/firmware/meson/built-in.a
  CC      fs/fcntl.o
  AR      drivers/cpuidle/governors/built-in.a
  CC      fs/ioctl.o
  AR      drivers/firmware/microchip/built-in.a
  CC      net/ipv6/netfilter.o
  CC      drivers/net/ethernet/intel/e1000/e1000_param.o
  AR      drivers/net/ethernet/mscc/built-in.a
  CC      lib/check_signature.o
  CC      lib/interval_tree.o
  AR      drivers/net/ethernet/myricom/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_irq.o
  CC [M]  drivers/gpu/drm/xe/xe_lrc.o
  AR      mm/built-in.a
  AR      drivers/net/ethernet/natsemi/built-in.a
  CC      drivers/firmware/efi/libstub/efi-stub-helper.o
  CC      drivers/firmware/efi/libstub/gop.o
  CC      drivers/firmware/efi/efi-bgrt.o
  CC      arch/x86/kernel/reboot.o
  CC      drivers/acpi/ec.o
  CC [M]  drivers/gpu/drm/xe/xe_migrate.o
  AR      drivers/thermal/built-in.a
  CC      drivers/cpuidle/driver.o
  CC      net/ipv6/proc.o
  AR      drivers/firmware/imx/built-in.a
  CC      net/ipv6/syncookies.o
  CC      drivers/cpuidle/governor.o
  CC      kernel/regset.o
  CC      arch/x86/kernel/msr.o
  CC      kernel/ksyms_common.o
  CC      drivers/firmware/efi/efi.o
  CC      net/mac80211/tx.o
  CC      fs/readdir.o
  CC      lib/assoc_array.o
  CC      net/mac80211/key.o
  CC      drivers/leds/led-class.o
  CC      drivers/acpi/acpica/utnonansi.o
  CC      net/ipv4/tcp_sigpool.o
  CC      kernel/groups.o
  CC      drivers/acpi/dock.o
  CC      net/ipv6/calipso.o
  CC      drivers/cpuidle/sysfs.o
  CC      fs/select.o
  CC      drivers/cpufreq/cpufreq_userspace.o
  CC      drivers/acpi/acpica/utobject.o
  CC      net/ipv4/cipso_ipv4.o
  CC      kernel/kcmp.o
  CC      drivers/leds/led-triggers.o
  CC      lib/bitrev.o
  CC      fs/dcache.o
  CC      arch/x86/kernel/cpuid.o
  CC      net/ipv4/xfrm4_policy.o
  CC      net/ipv4/xfrm4_state.o
  CC      drivers/acpi/pci_root.o
  CC      drivers/acpi/pci_link.o
  CC      drivers/firmware/efi/libstub/secureboot.o
  CC      drivers/acpi/pci_irq.o
  CC      lib/crc-ccitt.o
  CC      drivers/cpuidle/poll_state.o
  CC      net/ipv6/ah6.o
  CC      drivers/md/dm-builtin.o
  CC      lib/crc16.o
  CC [M]  drivers/gpu/drm/xe/xe_mmio.o
  CC      drivers/cpufreq/cpufreq_ondemand.o
  AR      drivers/firmware/psci/built-in.a
  CC      drivers/acpi/acpica/utosi.o
  CC      drivers/firmware/efi/vars.o
  AR      drivers/net/ethernet/intel/e1000/built-in.a
  AR      drivers/net/ethernet/neterion/built-in.a
  CC      net/mac80211/util.o
  CC      drivers/md/dm-raid1.o
  CC      drivers/cpuidle/cpuidle-haltpoll.o
  CC      net/ipv4/xfrm4_input.o
  CC      net/ipv4/xfrm4_output.o
  AR      drivers/firmware/qcom/built-in.a
  CC      fs/inode.o
  CC      arch/x86/kernel/early-quirks.o
  CC      fs/nfs/nfs4xdr.o
  CC      net/ipv4/xfrm4_protocol.o
  CC      drivers/firmware/efi/reboot.o
  CC      drivers/firmware/efi/memattr.o
  CC      arch/x86/kernel/smp.o
  CC      kernel/freezer.o
  CC      fs/attr.o
  HOSTCC  lib/gen_crc32table
  AR      drivers/crypto/stm32/built-in.a
  AR      drivers/leds/built-in.a
  AR      drivers/crypto/xilinx/built-in.a
  CC      drivers/acpi/acpi_lpss.o
  AR      drivers/crypto/hisilicon/built-in.a
  CC      drivers/acpi/acpi_apd.o
  CC      lib/xxhash.o
  CC      drivers/firmware/efi/libstub/tpm.o
  AR      drivers/crypto/intel/keembay/built-in.a
  AR      drivers/crypto/intel/ixp4xx/built-in.a
  CC      drivers/acpi/acpica/utownerid.o
  AR      drivers/crypto/intel/built-in.a
  AR      drivers/crypto/starfive/built-in.a
  CC      drivers/acpi/acpi_platform.o
  AR      drivers/crypto/built-in.a
  CC      net/ipv6/esp6.o
  AR      drivers/cpuidle/built-in.a
  CC      drivers/acpi/acpi_pnp.o
  CC      drivers/firmware/efi/tpm.o
  CC      drivers/clocksource/acpi_pm.o
  CC      net/ipv6/sit.o
  CC      lib/genalloc.o
  CC      drivers/net/ethernet/intel/e1000e/ptp.o
  CC      drivers/acpi/power.o
  CC      drivers/clocksource/i8253.o
  CC      drivers/cpufreq/cpufreq_governor.o
  CC      drivers/firmware/efi/memmap.o
  CC      drivers/acpi/acpica/utpredef.o
  CC      drivers/cpufreq/cpufreq_governor_attr_set.o
  AR      drivers/net/ethernet/netronome/built-in.a
  AR      drivers/net/ethernet/ni/built-in.a
  CC      drivers/net/ethernet/nvidia/forcedeth.o
  AR      drivers/net/ethernet/oki-semi/built-in.a
  CC      drivers/acpi/event.o
  CC      drivers/acpi/evged.o
  CC      drivers/firmware/efi/capsule.o
  CC      arch/x86/kernel/smpboot.o
  CC      fs/bad_inode.o
  CC      drivers/gpu/drm/i915/gt/intel_ggtt.o
  CC      kernel/profile.o
  CC      drivers/acpi/sysfs.o
  CC      drivers/gpu/drm/i915/gt/intel_ggtt_fencing.o
  CC      lib/percpu_counter.o
  CC      drivers/firmware/efi/esrt.o
  CC      net/ipv6/addrconf_core.o
  AR      drivers/net/ethernet/packetengines/built-in.a
  CC      fs/file.o
  CC      arch/x86/kernel/tsc_sync.o
  CC      drivers/hid/usbhid/hid-core.o
  CC      fs/nfs/nfs4state.o
  CC      drivers/hid/usbhid/hiddev.o
  CC      drivers/acpi/acpica/utresdecode.o
  CC [M]  drivers/gpu/drm/xe/xe_mocs.o
  AR      drivers/clocksource/built-in.a
  CC      drivers/hid/usbhid/hid-pidff.o
  CC      drivers/cpufreq/acpi-cpufreq.o
  CC      drivers/firmware/efi/runtime-wrappers.o
  CC      drivers/firmware/efi/libstub/file.o
  CC      lib/audit.o
  CC      fs/nfs/nfs4renewd.o
  CC [M]  drivers/gpu/drm/xe/xe_module.o
  CC      drivers/md/dm-log.o
  AR      net/ipv4/built-in.a
  CC      drivers/md/dm-region-hash.o
  CC      drivers/gpu/drm/i915/gt/intel_gt.o
  CC      drivers/firmware/efi/libstub/mem.o
  CC      net/ipv6/exthdrs_core.o
  CC      drivers/acpi/property.o
  CC      fs/filesystems.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.o
  CC      drivers/mailbox/mailbox.o
  AR      drivers/platform/x86/amd/built-in.a
  AR      drivers/platform/x86/intel/built-in.a
  CC      drivers/acpi/acpica/utresrc.o
  CC      drivers/platform/x86/wmi.o
  CC      drivers/mailbox/pcc.o
  CC      net/mac80211/parse.o
  CC      net/mac80211/wme.o
  CC [M]  drivers/gpu/drm/xe/xe_pat.o
  CC      drivers/hid/hid-core.o
  CC      drivers/acpi/acpi_cmos_rtc.o
  AR      drivers/platform/surface/built-in.a
  CC      drivers/acpi/acpica/utstate.o
  CC      kernel/stacktrace.o
  CC [M]  drivers/gpu/drm/xe/xe_pci.o
  CC      lib/syscall.o
  AR      drivers/net/ethernet/qlogic/built-in.a
  CC      drivers/cpufreq/amd-pstate.o
  CC      fs/namespace.o
  CC      drivers/acpi/acpica/utstring.o
  CC      drivers/firmware/efi/libstub/random.o
  CC      drivers/firmware/efi/capsule-loader.o
  CC      drivers/firmware/efi/earlycon.o
  CC      drivers/firmware/efi/libstub/randomalloc.o
  CC      kernel/dma.o
  CC      net/mac80211/chan.o
  AR      drivers/net/ethernet/intel/e1000e/built-in.a
  AR      drivers/net/ethernet/intel/built-in.a
  CC      fs/seq_file.o
  CC      arch/x86/kernel/setup_percpu.o
  CC      lib/errname.o
  CC      drivers/acpi/x86/apple.o
  CC      drivers/acpi/x86/utils.o
  CC      net/ipv6/ip6_checksum.o
  CC      drivers/acpi/acpica/utstrsuppt.o
  CC      net/mac80211/trace.o
  CC      arch/x86/kernel/mpparse.o
  AR      drivers/mailbox/built-in.a
  CC      drivers/md/dm-zero.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.o
  AR      drivers/perf/built-in.a
  CC      arch/x86/kernel/trace_clock.o
  CC      fs/xattr.o
  AR      drivers/net/ethernet/qualcomm/emac/built-in.a
  AR      drivers/net/ethernet/qualcomm/built-in.a
  CC      drivers/firmware/efi/libstub/pci.o
  CC      drivers/cpufreq/amd-pstate-trace.o
  CC      drivers/net/ethernet/realtek/8139too.o
  CC      net/mac80211/mlme.o
  CC      drivers/net/ethernet/realtek/r8169_main.o
  AR      net/wireless/built-in.a
  CC      lib/nlattr.o
  AR      drivers/hid/usbhid/built-in.a
  CC      drivers/net/ethernet/realtek/r8169_firmware.o
  CC      drivers/hid/hid-input.o
  CC      drivers/net/ethernet/realtek/r8169_phy_config.o
  CC      drivers/hid/hid-quirks.o
  CC      net/ipv6/ip6_icmp.o
  CC      kernel/smp.o
  CC      lib/cpu_rmap.o
  CC      drivers/platform/x86/wmi-bmof.o
  CC      kernel/uid16.o
  CC      fs/libfs.o
  CC      drivers/acpi/acpica/utstrtoul64.o
  AR      drivers/hwtracing/intel_th/built-in.a
  CC      drivers/firmware/efi/libstub/lib-cmdline.o
  CC      drivers/firmware/efi/libstub/skip_spaces.o
  CC      drivers/firmware/efi/libstub/lib-ctype.o
  AR      drivers/android/built-in.a
  CC      net/mac80211/tdls.o
  CC      drivers/hid/hid-debug.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_clock_utils.o
  CC      net/ipv6/output_core.o
  CC      net/ipv6/protocol.o
  CC      fs/nfs/nfs4super.o
  CC      drivers/hid/hidraw.o
  AR      drivers/firmware/smccc/built-in.a
  CC      drivers/firmware/efi/libstub/alignedmem.o
  CC      arch/x86/kernel/trace.o
  CC      arch/x86/kernel/rethook.o
  CC      drivers/platform/x86/eeepc-laptop.o
  CC      drivers/acpi/x86/s2idle.o
  AR      drivers/md/built-in.a
  CC      drivers/acpi/debugfs.o
  AR      drivers/nvmem/layouts/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_pcode.o
  CC      drivers/nvmem/core.o
  CC      lib/dynamic_queue_limits.o
  CC      net/mac80211/ocb.o
  CC      drivers/acpi/acpica/utxface.o
  CC      drivers/hid/hid-generic.o
  CC      drivers/cpufreq/intel_pstate.o
  CC      drivers/acpi/acpica/utxfinit.o
  CC [M]  drivers/gpu/drm/xe/xe_pm.o
  AR      drivers/firmware/efi/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_preempt_fence.o
  CC      drivers/platform/x86/p2sb.o
  CC      net/ipv6/ip6_offload.o
  CC      arch/x86/kernel/vmcore_info_32.o
  AR      drivers/net/ethernet/renesas/built-in.a
  CC      drivers/gpu/drm/drm_mode_object.o
  CC      drivers/hid/hid-a4tech.o
  CC      drivers/firmware/efi/libstub/relocate.o
  CC      fs/fs-writeback.o
  CC      drivers/firmware/efi/libstub/printk.o
  CC      kernel/kallsyms.o
  CC      drivers/acpi/acpica/utxferror.o
  CC      drivers/hid/hid-apple.o
  AR      drivers/net/ethernet/rdc/built-in.a
  CC      drivers/acpi/acpi_lpat.o
  CC      net/ipv6/tcpv6_offload.o
  CC      lib/glob.o
  AR      drivers/net/ethernet/rocker/built-in.a
  CC      drivers/acpi/acpi_pcc.o
  CC      lib/strncpy_from_user.o
  CC      drivers/hid/hid-belkin.o
  CC      fs/nfs/nfs4file.o
  AR      drivers/net/ethernet/nvidia/built-in.a
  CC      net/mac80211/airtime.o
  CC      drivers/hid/hid-cherry.o
  CC      drivers/hid/hid-chicony.o
  CC      kernel/acct.o
  CC      lib/strnlen_user.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_debugfs.o
  CC      drivers/acpi/ac.o
  CC      kernel/vmcore_info.o
  CC [M]  drivers/gpu/drm/xe/xe_pt.o
  CC      arch/x86/kernel/machine_kexec_32.o
  AS      arch/x86/kernel/relocate_kernel_32.o
  CC      kernel/elfcorehdr.o
  CC      drivers/acpi/acpica/utxfmutex.o
  CC      net/ipv6/exthdrs_offload.o
  CC [M]  drivers/gpu/drm/xe/xe_pt_walk.o
  CC      kernel/crash_reserve.o
  CC      arch/x86/kernel/crash_dump_32.o
  AR      drivers/platform/x86/built-in.a
  CC      fs/pnode.o
  AR      drivers/platform/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_query.o
  CC      fs/nfs/delegation.o
  AR      drivers/nvmem/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.o
  CC      net/mac80211/eht.o
  CC      drivers/acpi/button.o
  AR      drivers/firmware/tegra/built-in.a
  CC      drivers/gpu/drm/drm_modes.o
  CC      fs/nfs/nfs4idmap.o
  AR      drivers/firmware/xilinx/built-in.a
  CC      lib/net_utils.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_irq.o
  CC      arch/x86/kernel/crash.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_mcr.o
  CC      drivers/firmware/efi/libstub/vsprintf.o
  CC      lib/sg_pool.o
  AR      drivers/acpi/acpica/built-in.a
  CC      drivers/acpi/fan_core.o
  CC      drivers/acpi/fan_attr.o
  CC      lib/stackdepot.o
  CC      drivers/hid/hid-cypress.o
  CC [M]  drivers/gpu/drm/xe/xe_range_fence.o
  CC      drivers/firmware/efi/libstub/x86-stub.o
  CC      net/mac80211/led.o
  AR      drivers/net/ethernet/samsung/built-in.a
  CC      fs/nfs/callback.o
  CC      kernel/kexec_core.o
  CC      lib/asn1_decoder.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_pm.o
  CC      arch/x86/kernel/module.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_sr.o
  CC      net/ipv6/inet6_hashtables.o
  CC      arch/x86/kernel/doublefault_32.o
  CC      kernel/crash_core.o
  CC      drivers/gpu/drm/drm_modeset_lock.o
  CC      kernel/kexec.o
  GEN     lib/oid_registry_data.c
  CC      kernel/utsname.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_whitelist.o
  CC      fs/splice.o
  CC      lib/ucs2_string.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.o
  CC      drivers/acpi/acpi_video.o
  CC      net/mac80211/pm.o
  CC      drivers/acpi/video_detect.o
  CC      drivers/firmware/dmi_scan.o
  CC      net/ipv6/mcast_snoop.o
  CC      arch/x86/kernel/early_printk.o
  CC      kernel/pid_namespace.o
  CC      lib/sbitmap.o
  CC      fs/sync.o
  STUBCPY drivers/firmware/efi/libstub/alignedmem.stub.o
  STUBCPY drivers/firmware/efi/libstub/efi-stub-helper.stub.o
  CC      lib/group_cpus.o
  STUBCPY drivers/firmware/efi/libstub/file.stub.o
  STUBCPY drivers/firmware/efi/libstub/gop.stub.o
  STUBCPY drivers/firmware/efi/libstub/lib-cmdline.stub.o
  STUBCPY drivers/firmware/efi/libstub/lib-ctype.stub.o
  CC      drivers/firmware/dmi-id.o
  STUBCPY drivers/firmware/efi/libstub/mem.stub.o
  STUBCPY drivers/firmware/efi/libstub/pci.stub.o
  STUBCPY drivers/firmware/efi/libstub/printk.stub.o
  STUBCPY drivers/firmware/efi/libstub/random.stub.o
  CC      kernel/stop_machine.o
  CC      drivers/acpi/processor_driver.o
  CC      drivers/hid/hid-ezkey.o
  CC      kernel/audit.o
  CC      lib/fw_table.o
  AR      drivers/cpufreq/built-in.a
  AR      drivers/net/ethernet/realtek/built-in.a
  CC      kernel/auditfilter.o
  AR      drivers/net/ethernet/seeq/built-in.a
  AR      drivers/net/ethernet/silan/built-in.a
  CC      kernel/auditsc.o
  CC      fs/utimes.o
  AR      drivers/net/ethernet/sis/built-in.a
  AR      drivers/net/ethernet/sfc/built-in.a
  AR      drivers/net/ethernet/smsc/built-in.a
  AR      drivers/net/ethernet/socionext/built-in.a
  AR      drivers/net/ethernet/stmicro/built-in.a
  STUBCPY drivers/firmware/efi/libstub/randomalloc.stub.o
  AR      drivers/net/ethernet/sun/built-in.a
  STUBCPY drivers/firmware/efi/libstub/relocate.stub.o
  STUBCPY drivers/firmware/efi/libstub/secureboot.stub.o
  CC      fs/nfs/callback_xdr.o
  CC [M]  drivers/gpu/drm/xe/xe_rtp.o
  AR      drivers/net/ethernet/tehuti/built-in.a
  STUBCPY drivers/firmware/efi/libstub/skip_spaces.stub.o
  STUBCPY drivers/firmware/efi/libstub/tpm.stub.o
  AR      drivers/net/ethernet/ti/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_gt_pm_irq.o
  CC      fs/nfs/callback_proc.o
  CC      drivers/gpu/drm/drm_plane.o
  CC [M]  drivers/gpu/drm/xe/xe_ring_ops.o
  STUBCPY drivers/firmware/efi/libstub/vsprintf.stub.o
  AR      drivers/net/ethernet/vertexcom/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_sa.o
  AR      drivers/net/ethernet/via/built-in.a
  STUBCPY drivers/firmware/efi/libstub/x86-stub.stub.o
  CC [M]  drivers/gpu/drm/xe/xe_sched_job.o
  AR      drivers/firmware/efi/libstub/lib.a
  AR      drivers/net/ethernet/wangxun/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_step.o
  CC      arch/x86/kernel/hpet.o
  AR      drivers/net/ethernet/wiznet/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_gt_requests.o
  AR      lib/lib.a
  CC      drivers/gpu/drm/i915/gt/intel_gt_sysfs.o
  CC      net/mac80211/rc80211_minstrel_ht.o
  AR      drivers/net/ethernet/xilinx/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.o
  GEN     lib/crc32table.h
  CC      drivers/gpu/drm/i915/gt/intel_gtt.o
  CC      arch/x86/kernel/amd_nb.o
  AR      drivers/net/ethernet/xircom/built-in.a
  CC      drivers/gpu/drm/drm_prime.o
  CC      drivers/gpu/drm/i915/gt/intel_llc.o
  CC      drivers/gpu/drm/drm_print.o
  CC      fs/d_path.o
  AR      drivers/net/ethernet/synopsys/built-in.a
  AR      drivers/net/ethernet/pensando/built-in.a
  CC      drivers/firmware/memmap.o
  AR      drivers/net/ethernet/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_sync.o
  CC      kernel/audit_watch.o
  CC      lib/oid_registry.o
  CC      drivers/acpi/processor_thermal.o
  CC      kernel/audit_fsnotify.o
  CC [M]  drivers/gpu/drm/xe/xe_tile.o
  CC      drivers/acpi/processor_idle.o
  CC      drivers/hid/hid-gyration.o
  AR      drivers/net/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_lrc.o
  CC      drivers/gpu/drm/drm_property.o
  CC      net/mac80211/wbrf.o
  CC      drivers/gpu/drm/i915/gt/intel_migrate.o
  CC      arch/x86/kernel/kvm.o
  CC      drivers/hid/hid-ite.o
  CC      fs/stack.o
  AR      net/ipv6/built-in.a
  CC      fs/fs_struct.o
  CC      fs/statfs.o
  CC      fs/fs_pin.o
  CC      lib/crc32.o
  CC      fs/nsfs.o
  CC      drivers/acpi/processor_throttling.o
  CC      fs/fs_types.o
  CC [M]  drivers/gpu/drm/xe/xe_tile_sysfs.o
  CC      drivers/gpu/drm/drm_syncobj.o
  CC [M]  drivers/gpu/drm/xe/xe_trace.o
  CC      drivers/gpu/drm/drm_sysfs.o
  AR      drivers/firmware/built-in.a
  CC      drivers/gpu/drm/drm_trace_points.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_sys_mgr.o
  CC      drivers/gpu/drm/i915/gt/intel_mocs.o
  CC      arch/x86/kernel/kvmclock.o
  CC      arch/x86/kernel/paravirt.o
  CC      drivers/acpi/processor_perflib.o
  CC      fs/fs_context.o
  CC      arch/x86/kernel/pvclock.o
  CC      drivers/gpu/drm/i915/gt/intel_ppgtt.o
  CC      drivers/gpu/drm/drm_vblank.o
  CC      fs/fs_parser.o
  CC      drivers/hid/hid-kensington.o
  CC      kernel/audit_tree.o
  CC      fs/fsopen.o
  CC      drivers/gpu/drm/i915/gt/intel_rc6.o
  CC      arch/x86/kernel/pcspeaker.o
  CC      kernel/kprobes.o
  CC      drivers/acpi/container.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.o
  CC      kernel/seccomp.o
  CC      fs/init.o
  CC      fs/nfs/nfs4namespace.o
  CC      kernel/relay.o
  AR      lib/built-in.a
  CC      kernel/utsname_sysctl.o
  CC      drivers/gpu/drm/i915/gt/intel_region_lmem.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_vram_mgr.o
  CC      drivers/gpu/drm/drm_vblank_work.o
  CC      kernel/delayacct.o
  CC      drivers/acpi/thermal_lib.o
  CC      drivers/hid/hid-lg.o
  CC      drivers/hid/hid-lgff.o
  CC [M]  drivers/gpu/drm/xe/xe_tuning.o
  CC      kernel/taskstats.o
  CC      arch/x86/kernel/check.o
  CC      fs/kernel_read_file.o
  CC      arch/x86/kernel/uprobes.o
  CC      drivers/acpi/thermal.o
  CC      arch/x86/kernel/perf_regs.o
  CC      kernel/tsacct.o
  CC      drivers/gpu/drm/drm_vma_manager.o
  CC      drivers/acpi/acpi_memhotplug.o
  CC      arch/x86/kernel/tracepoint.o
  CC      arch/x86/kernel/itmt.o
  CC [M]  drivers/gpu/drm/xe/xe_uc.o
  CC      drivers/gpu/drm/drm_writeback.o
  CC      arch/x86/kernel/umip.o
  CC      drivers/gpu/drm/drm_panel.o
  CC      arch/x86/kernel/unwind_frame.o
  CC      drivers/acpi/ioapic.o
  CC      drivers/hid/hid-lg4ff.o
  CC      drivers/hid/hid-lg-g15.o
  CC      fs/nfs/nfs4getroot.o
  CC      drivers/gpu/drm/i915/gt/intel_renderstate.o
  CC      drivers/acpi/battery.o
  CC      kernel/tracepoint.o
  CC      fs/mnt_idmapping.o
  CC [M]  drivers/gpu/drm/xe/xe_uc_debugfs.o
  CC      fs/remap_range.o
  CC      fs/pidfs.o
  CC      drivers/gpu/drm/i915/gt/intel_reset.o
  CC      fs/nfs/nfs4client.o
  CC [M]  drivers/gpu/drm/xe/xe_uc_fw.o
  CC      kernel/irq_work.o
  CC      fs/buffer.o
  CC      drivers/hid/hid-microsoft.o
  CC      drivers/acpi/bgrt.o
  CC      drivers/hid/hid-monterey.o
  CC      drivers/hid/hid-ntrig.o
  CC      kernel/static_call.o
  CC      kernel/padata.o
  CC      drivers/gpu/drm/drm_pci.o
  CC      drivers/gpu/drm/drm_debugfs.o
  CC      fs/nfs/nfs4session.o
  CC      kernel/jump_label.o
  CC      drivers/hid/hid-pl.o
  CC      drivers/acpi/spcr.o
  CC      drivers/hid/hid-petalynx.o
  CC [M]  drivers/gpu/drm/xe/xe_vm.o
  CC [M]  drivers/gpu/drm/xe/xe_vram_freq.o
  CC [M]  drivers/gpu/drm/xe/xe_wait_user_fence.o
  CC      drivers/gpu/drm/i915/gt/intel_ring.o
  CC      drivers/gpu/drm/drm_debugfs_crc.o
  CC      drivers/gpu/drm/drm_panel_orientation_quirks.o
  CC      fs/mpage.o
  CC      fs/nfs/dns_resolve.o
  CC      drivers/gpu/drm/drm_buddy.o
  CC      drivers/gpu/drm/i915/gt/intel_ring_submission.o
  CC      fs/proc_namespace.o
  CC      fs/direct-io.o
  AR      arch/x86/kernel/built-in.a
  CC      drivers/gpu/drm/drm_gem_shmem_helper.o
  CC      kernel/context_tracking.o
  AR      arch/x86/built-in.a
  CC      kernel/iomem.o
  CC      kernel/rseq.o
  CC      fs/nfs/nfs4trace.o
  CC      drivers/gpu/drm/drm_atomic_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_wa.o
  CC [M]  drivers/gpu/drm/xe/xe_wopcm.o
  CC [M]  drivers/gpu/drm/xe/xe_hwmon.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_relay.o
  CC      fs/eventpoll.o
  CC      fs/anon_inodes.o
  CC      drivers/hid/hid-redragon.o
  CC      drivers/hid/hid-samsung.o
  CC      drivers/hid/hid-sony.o
  CC      fs/nfs/nfs4sysctl.o
  CC      drivers/hid/hid-sunplus.o
  CC      drivers/gpu/drm/drm_atomic_state_helper.o
  CC      drivers/gpu/drm/drm_bridge_connector.o
  CC      drivers/hid/hid-topseed.o
  CC      fs/signalfd.o
  CC      fs/timerfd.o
  CC      fs/eventfd.o
  AR      drivers/acpi/built-in.a
  CC      drivers/gpu/drm/drm_crtc_helper.o
  CC      drivers/gpu/drm/drm_damage_helper.o
  CC      drivers/gpu/drm/i915/gt/intel_rps.o
  CC [M]  drivers/gpu/drm/xe/xe_memirq.o
  CC      fs/aio.o
  CC [M]  drivers/gpu/drm/xe/xe_sriov.o
  CC      drivers/gpu/drm/drm_encoder_slave.o
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_irq.o
  CC      drivers/gpu/drm/drm_flip_work.o
  CC      drivers/gpu/drm/i915/gt/intel_sa_media.o
  CC      drivers/gpu/drm/i915/gt/intel_sseu.o
  CC      drivers/gpu/drm/i915/gt/intel_sseu_debugfs.o
  CC      fs/locks.o
  CC      fs/binfmt_misc.o
  CC      drivers/gpu/drm/drm_format_helper.o
  CC      drivers/gpu/drm/i915/gt/intel_timeline.o
  CC      drivers/gpu/drm/drm_gem_atomic_helper.o
  CC      drivers/gpu/drm/drm_gem_framebuffer_helper.o
  CC      drivers/gpu/drm/drm_kms_helper_common.o
  CC      drivers/gpu/drm/drm_modeset_helper.o
  CC      fs/binfmt_script.o
  CC      drivers/gpu/drm/i915/gt/intel_tlb.o
  CC      drivers/gpu/drm/drm_plane_helper.o
  CC      drivers/gpu/drm/i915/gt/intel_wopcm.o
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_utils.o
  CC      drivers/gpu/drm/drm_probe_helper.o
  AR      kernel/built-in.a
  CC      drivers/gpu/drm/drm_rect.o
  CC      drivers/gpu/drm/drm_self_refresh_helper.o
  CC [M]  drivers/gpu/drm/xe/display/intel_fb_bo.o
  CC      drivers/gpu/drm/drm_simple_kms_helper.o
  CC      fs/binfmt_elf.o
  CC [M]  drivers/gpu/drm/xe/display/intel_fbdev_fb.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display.o
  CC      drivers/gpu/drm/bridge/panel.o
  CC      fs/mbcache.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_misc.o
  CC      drivers/gpu/drm/drm_mipi_dsi.o
  CC [M]  drivers/gpu/drm/drm_exec.o
  CC      drivers/gpu/drm/i915/gt/intel_workarounds.o
  CC      fs/posix_acl.o
  CC      fs/coredump.o
  CC      fs/drop_caches.o
  CC      fs/sysctls.o
  CC [M]  drivers/gpu/drm/drm_gpuvm.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_rps.o
  CC [M]  drivers/gpu/drm/xe/display/xe_dsb_buffer.o
  CC [M]  drivers/gpu/drm/drm_suballoc.o
  CC [M]  drivers/gpu/drm/drm_gem_ttm_helper.o
  CC [M]  drivers/gpu/drm/xe/display/xe_fb_pin.o
  CC      fs/fhandle.o
  AR      drivers/hid/built-in.a
  CC      drivers/gpu/drm/i915/gt/shmem_utils.o
  CC      drivers/gpu/drm/i915/gt/sysfs_engines.o
  CC      drivers/gpu/drm/i915/gt/intel_ggtt_gmch.o
  CC      drivers/gpu/drm/i915/gt/gen6_renderstate.o
  CC      drivers/gpu/drm/i915/gt/gen7_renderstate.o
  CC      drivers/gpu/drm/i915/gt/gen8_renderstate.o
  CC      drivers/gpu/drm/i915/gt/gen9_renderstate.o
  CC [M]  drivers/gpu/drm/xe/display/xe_hdcp_gsc.o
  CC [M]  drivers/gpu/drm/xe/display/xe_plane_initial.o
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_dram.o
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_pch.o
  CC [M]  drivers/gpu/drm/xe/i915-display/icl_dsi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_busy.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_clflush.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic_plane.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_context.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_audio.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_create.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_dmabuf.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_backlight.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_domain.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bios.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_internal.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_lmem.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cdclk.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_mman.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_object.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_color.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_combo_phy.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_connector.o
  LD [M]  drivers/gpu/drm/drm_ttm_helper.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_pages.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc_state_dump.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_phys.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cursor.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cx0_phy.o
  AR      net/mac80211/built-in.a
  AR      net/built-in.a
  LD [M]  drivers/gpu/drm/drm_suballoc_helper.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_pm.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_region.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi_buf_trans.o
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
  CC      drivers/gpu/drm/i915/gem/i915_gem_tiling.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_map.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_well.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_trace.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_wa.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_ttm.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_ttm_move.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dkl_phy.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_userptr.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dmc.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_wait.o
  CC      drivers/gpu/drm/i915/gem/i915_gemfs.o
  CC      drivers/gpu/drm/i915/i915_active.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_aux.o
  CC      drivers/gpu/drm/i915/i915_cmd_parser.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_aux_backlight.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_hdcp.o
  CC      drivers/gpu/drm/i915/i915_deps.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_link_training.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_mst.o
  CC      drivers/gpu/drm/i915/i915_gem.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpll.o
  CC      drivers/gpu/drm/i915/i915_gem_evict.o
  AR      fs/nfs/built-in.a
  AR      fs/built-in.a
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpll_mgr.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpt_common.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_drrs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsb.o
  CC      drivers/gpu/drm/i915/i915_gem_gtt.o
  CC      drivers/gpu/drm/i915/i915_gem_ww.o
  CC      drivers/gpu/drm/i915/i915_query.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_dcs_backlight.o
  CC      drivers/gpu/drm/i915/i915_request.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_vbt.o
  CC      drivers/gpu/drm/i915/i915_scheduler.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fb.o
  CC      drivers/gpu/drm/i915/i915_trace_points.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fbc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fdi.o
  CC      drivers/gpu/drm/i915/i915_ttm_buddy_manager.o
  CC      drivers/gpu/drm/i915/i915_vma.o
  CC      drivers/gpu/drm/i915/i915_vma_resource.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fifo_underrun.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_frontbuffer.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_global_state.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_ads.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_gmbus.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdcp.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdcp_gsc_message.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_capture.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdmi.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_ct.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hotplug.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hotplug_irq.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hti.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_link_bw.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_fw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_lspcon.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_lock.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_log.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_setup.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_rc.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_submission.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_verify.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_panel.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pmdemand.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_huc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pps.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_huc_fw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_psr.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_uc.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_uc_fw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_qp_tables.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_quirks.o
  CC      drivers/gpu/drm/i915/gt/intel_gsc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_snps_phy.o
  CC      drivers/gpu/drm/i915/i915_hwmon.o
  CC      drivers/gpu/drm/i915/display/hsw_ips.o
  CC      drivers/gpu/drm/i915/display/i9xx_plane.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_tc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vblank.o
  CC      drivers/gpu/drm/i915/display/i9xx_wm.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vdsc.o
  CC      drivers/gpu/drm/i915/display/intel_atomic.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vga.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vrr.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_wm.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_scaler.o
  CC      drivers/gpu/drm/i915/display/intel_atomic_plane.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_universal_plane.o
  CC      drivers/gpu/drm/i915/display/intel_audio.o
  CC      drivers/gpu/drm/i915/display/intel_bios.o
  CC      drivers/gpu/drm/i915/display/intel_bw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_watermark.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_acpi.o
  CC      drivers/gpu/drm/i915/display/intel_cdclk.o
  CC      drivers/gpu/drm/i915/display/intel_color.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_opregion.o
  CC      drivers/gpu/drm/i915/display/intel_combo_phy.o
  CC      drivers/gpu/drm/i915/display/intel_connector.o
  CC      drivers/gpu/drm/i915/display/intel_crtc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs_params.o
  CC      drivers/gpu/drm/i915/display/intel_crtc_state_dump.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pipe_crc.o
  CC      drivers/gpu/drm/i915/display/intel_cursor.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc.o
  CC      drivers/gpu/drm/i915/display/intel_display.o
  CC [M]  drivers/gpu/drm/xe/xe_guc.o
  CC      drivers/gpu/drm/i915/display/intel_display_driver.o
  CC      drivers/gpu/drm/i915/display/intel_display_irq.o
  CC      drivers/gpu/drm/i915/display/intel_display_params.o
  CC      drivers/gpu/drm/i915/display/intel_display_power.o
  CC      drivers/gpu/drm/i915/display/intel_display_power_map.o
  CC      drivers/gpu/drm/i915/display/intel_display_power_well.o
  CC      drivers/gpu/drm/i915/display/intel_display_reset.o
  CC      drivers/gpu/drm/i915/display/intel_display_rps.o
  CC      drivers/gpu/drm/i915/display/intel_display_wa.o
  CC      drivers/gpu/drm/i915/display/intel_dmc.o
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
  CC      drivers/gpu/drm/i915/display/intel_hdcp.o
  CC      drivers/gpu/drm/i915/display/intel_global_state.o
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
  CC      drivers/gpu/drm/i915/display/intel_dp.o
  CC      drivers/gpu/drm/i915/display/intel_dp_aux.o
  LD [M]  drivers/gpu/drm/xe/xe.o
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
  CC [M]  sound/core/snd-hwdep.mod.o
  CC [M]  drivers/thermal/intel/x86_pkg_temp_thermal.mod.o
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
  LD [M]  drivers/gpu/drm/drm_exec.ko
  LD [M]  net/netfilter/xt_nat.ko
  LD [M]  sound/pci/hda/snd-hda-intel.ko
  LD [M]  net/netfilter/xt_MASQUERADE.ko
  LD [M]  net/netfilter/xt_addrtype.ko
  LD [M]  drivers/gpu/drm/xe/xe.ko
  LD [M]  sound/pci/hda/snd-hda-codec-hdmi.ko
  LD [M]  net/netfilter/xt_LOG.ko
  LD [M]  net/ipv4/netfilter/iptable_nat.ko
  LD [M]  drivers/gpu/drm/drm_gpuvm.ko
  LD [M]  sound/pci/hda/snd-hda-codec.ko
  LD [M]  net/netfilter/xt_mark.ko
  LD [M]  sound/hda/snd-intel-sdw-acpi.ko
  LD [M]  net/netfilter/nf_log_syslog.ko
  LD [M]  sound/core/snd-hwdep.ko
  LD [M]  drivers/gpu/drm/drm_suballoc_helper.ko
  LD [M]  drivers/gpu/drm/drm_ttm_helper.ko
  LD [M]  drivers/thermal/intel/x86_pkg_temp_thermal.ko
  LD [M]  drivers/gpu/drm/scheduler/gpu-sched.ko
  LD [M]  sound/hda/snd-hda-core.ko
  LD [M]  sound/core/snd-pcm.ko
  LD [M]  sound/hda/snd-intel-dspcfg.ko
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


