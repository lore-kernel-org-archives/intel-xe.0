Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1103FC61DB2
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 04:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8EC10E388;
	Mon,  9 Jun 2025 04:04:01 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E340F10E3B9;
 Mon,  9 Jun 2025 04:03:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EBuild=3A_failure_for_drm/xe/vm=3A_Add_a_helper_xe?=
 =?utf-8?q?=5Fvm=5Frange=5Ftilemask=5Ftlb=5Finvalidation=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Jun 2025 04:03:59 -0000
Message-ID: <174944183991.58805.11470782968707673245@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250609041616.1723636-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250609041616.1723636-1-himal.prasad.ghimiray@intel.com>
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

Series: drm/xe/vm: Add a helper xe_vm_range_tilemask_tlb_invalidation() (rev2)
URL   : https://patchwork.freedesktop.org/series/149615/
State : failure

== Summary ==

CC [M]  drivers/ras/amd/atl/access.o
  CC [M]  drivers/mfd/atc260x-core.o
  LD [M]  drivers/hv/hv_vmbus.o
  CC [M]  drivers/platform/x86/mxm-wmi.o
  CC [M]  drivers/power/supply/surface_battery.o
  CC [M]  net/netfilter/xt_TCPMSS.o
  CC [M]  drivers/media/rc/keymaps/rc-proteus-2309.o
  CC [M]  drivers/platform/x86/intel/vbtn.o
  CC [M]  drivers/mmc/host/sdhci-xenon.o
  CC [M]  drivers/watchdog/menf21bmc_wdt.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_sysfs_ras_counters.o
  CC [M]  drivers/media/rc/keymaps/rc-purpletv.o
  CC [M]  drivers/perf/cxl_pmu.o
  CC [M]  drivers/platform/chrome/cros_ec_lpc.o
  CC      drivers/ras/ras.o
  CC [M]  drivers/media/rc/keymaps/rc-pv951.o
  CC [M]  drivers/md/raid1.o
  CC [M]  drivers/hid/hid-cypress.o
  CC [M]  drivers/hwmon/adt7411.o
  CC [M]  drivers/hwmon/adt7462.o
  CC      drivers/firmware/sysfb_simplefb.o
  CC [M]  drivers/md/raid10.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/g84.o
  CC [M]  drivers/extcon/extcon-intel-int3496.o
  CC      drivers/gpu/drm/drm_client_event.o
  CC [M]  drivers/firmware/iscsi_ibft.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_topology.o
  CC [M]  drivers/extcon/extcon-intel-cht-wc.o
  CC [M]  drivers/firmware/qemu_fw_cfg.o
  CC [M]  drivers/media/rc/keymaps/rc-rc6-mce.o
  AR      drivers/hv/built-in.a
  LD [M]  drivers/hv/hv_utils.o
  CC [M]  drivers/media/rc/streamzap.o
  CC [M]  drivers/gpu/drm/xe/xe_guc.o
  CC [M]  drivers/staging/fbtft/fb_ssd1331.o
  CC      fs/remap_range.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.o
  CC [M]  drivers/ras/amd/atl/core.o
  CC [M]  drivers/media/rc/keymaps/rc-real-audio-220-32-keys.o
  CC [M]  drivers/power/supply/surface_charger.o
  CC [M]  drivers/watchdog/menz69_wdt.o
  CC [M]  drivers/mfd/atc260x-i2c.o
  CC [M]  drivers/media/rc/ir_toy.o
  CC [M]  drivers/power/supply/ug3105_battery.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_sysfs_rl.o
  CC [M]  drivers/extcon/extcon-intel-mrfld.o
  CC [M]  drivers/power/supply/mm8013.o
  CC [M]  net/netfilter/xt_TCPOPTSTRIP.o
  CC [M]  drivers/extcon/extcon-max14577.o
  CC [M]  drivers/platform/x86/intel/int0002_vgpio.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_workarounds.o
  CC [M]  drivers/powercap/intel_rapl_msr.o
  CC [M]  drivers/net/veth.o
  CC [M]  drivers/mmc/host/sdhci-xenon-phy.o
  CC [M]  drivers/gpu/drm/i915/gt/shmem_utils.o
  CC [M]  drivers/md/raid5.o
  CC      drivers/ras/debugfs.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_timer.o
  CC [M]  drivers/platform/chrome/cros_ec_lpc_mec.o
  CC [M]  net/netfilter/xt_TEE.o
  CC [M]  drivers/md/raid5-cache.o
  CC [M]  drivers/hid/hid-elan.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v2_3.o
  CC [M]  drivers/staging/fbtft/fb_ssd1351.o
  CC [M]  drivers/extcon/extcon-max3355.o
  CC [M]  drivers/media/rc/keymaps/rc-reddo.o
  CC      drivers/gpu/drm/drm_client_modeset.o
  CC [M]  drivers/watchdog/rave-sp-wdt.o
  CC      drivers/gpu/drm/lib/drm_random.o
  CC      drivers/ras/cec.o
  AR      drivers/hwtracing/intel_th/built-in.a
  CC [M]  drivers/hwtracing/intel_th/core.o
  AR      drivers/android/built-in.a
  CC [M]  drivers/media/rc/keymaps/rc-siemens-gigaset-rc20.o
  CC [M]  drivers/ras/amd/atl/dehash.o
  CC [M]  drivers/md/raid5-ppl.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_ads.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_transport.o
  CC [M]  drivers/extcon/extcon-max77693.o
  AR      drivers/firmware/built-in.a
  CC [M]  drivers/ras/amd/fmpm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nv.o
  CC [M]  drivers/hwtracing/intel_th/pci.o
  CC [M]  drivers/md/dm-unstripe.o
  CC [M]  drivers/extcon/extcon-max77843.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.o
  CC [M]  drivers/staging/fbtft/fb_st7735r.o
  CC [M]  drivers/hwmon/adt7470.o
  CC [M]  drivers/net/bareudp.o
  CC [M]  drivers/powercap/intel_rapl_tpmi.o
  CC [M]  drivers/platform/x86/intel/ishtp_eclite.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gf100.o
  LD [M]  drivers/mfd/arizona.o
  LD [M]  drivers/mfd/wm8994.o
  CC [M]  drivers/crypto/intel/qat/qat_common/qat_algs.o
  LD [M]  drivers/mfd/madera.o
  LD [M]  drivers/mfd/ocelot-soc.o
  LD [M]  drivers/mfd/mt6397.o
  LD [M]  drivers/mfd/si476x-core.o
  AR      drivers/mfd/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/arct_reg_init.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.o
  CC [M]  drivers/media/rc/keymaps/rc-snapstream-firefly.o
  CC [M]  drivers/net/nlmon.o
  CC      drivers/gpu/drm/drm_ioc32.o
  AR      drivers/power/supply/built-in.a
  AR      drivers/power/built-in.a
  LD [M]  drivers/mmc/host/sdhci-xenon-driver.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_buf.o
  AR      drivers/mmc/host/built-in.a
  AR      drivers/mmc/built-in.a
  CC [M]  drivers/gpu/drm/i915/gt/sysfs_engines.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.o
  CC [M]  drivers/net/pfcp.o
  CC [M]  drivers/hid/hid-elecom.o
  CC [M]  drivers/platform/chrome/cros_ec_proto.o
  CC [M]  drivers/md/dm-bufio.o
  CC      fs/pidfs.o
  CC [M]  drivers/net/vrf.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_ggtt_gmch.o
  CC      drivers/interconnect/core.o
  AR      drivers/nvmem/layouts/built-in.a
  CC      drivers/nvmem/core.o
  AR      drivers/watchdog/built-in.a
  CC [M]  net/netfilter/xt_TRACE.o
  CC      fs/buffer.o
  CC [M]  drivers/net/vsockmon.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/pllnv04.o
  CC [M]  drivers/ras/amd/atl/denormalize.o
  AR      drivers/powercap/built-in.a
  CC [M]  drivers/net/ntb_netdev.o
  CC      drivers/gpu/drm/drm_panel.o
  CC [M]  drivers/staging/fbtft/fb_st7789v.o
  CC [M]  drivers/extcon/extcon-max8997.o
  CC [M]  drivers/crypto/intel/qat/qat_common/qat_algs_send.o
  CC [M]  drivers/media/rc/keymaps/rc-streamzap.o
  CC [M]  drivers/gpu/drm/i915/gt/gen6_renderstate.o
  CC [M]  drivers/hwtracing/intel_th/acpi.o
  CC [M]  drivers/platform/x86/intel/sdsi.o
  CC [M]  drivers/media/rc/ttusbir.o
  CC [M]  drivers/ras/amd/atl/map.o
  CC      drivers/gpu/drm/drm_pci.o
  CC      drivers/gpu/drm/drm_debugfs.o
  CC [M]  drivers/crypto/intel/qat/qat_common/qat_asym_algs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/pllgt215.o
  CC [M]  drivers/hwmon/adt7475.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mxgpu_nv.o
  CC [M]  drivers/media/rc/winbond-cir.o
  CC [M]  drivers/hid/hid-elo.o
  CC [M]  drivers/platform/x86/nvidia-wmi-ec-backlight.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_2.o
  CC [M]  drivers/platform/x86/xiaomi-wmi.o
  CC [M]  drivers/hwmon/aht10.o
  CC [M]  drivers/hwmon/applesmc.o
  CC [M]  drivers/crypto/intel/qat/qat_common/qat_bl.o
  CC [M]  drivers/crypto/intel/qat/qat_common/qat_comp_algs.o
  CC [M]  drivers/ras/amd/atl/system.o
  CC [M]  drivers/media/rc/keymaps/rc-su3000.o
  CC [M]  net/netfilter/xt_IDLETIMER.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_capture.o
  CC [M]  drivers/staging/fbtft/fb_tinylcd.o
  CC [M]  drivers/ras/amd/atl/umc.o
  CC      drivers/gpu/drm/drm_debugfs_crc.o
  CC [M]  drivers/hwtracing/intel_th/gth.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_ct.o
  CC [M]  drivers/platform/x86/gigabyte-wmi.o
  CC [M]  drivers/platform/x86/acerhdf.o
  CC [M]  drivers/ras/amd/atl/prm.o
  CC [M]  drivers/platform/chrome/cros_ec_trace.o
  CC      drivers/interconnect/bulk.o
  CC [M]  drivers/hwmon/aquacomputer_d5next.o
  CC [M]  drivers/extcon/extcon-palmas.o
  CC      drivers/hte/hte.o
  CC [M]  drivers/md/dm-bio-prison-v1.o
  CC      drivers/interconnect/debugfs-client.o
  CC [M]  drivers/accel/habanalabs/common/mmu/mmu.o
  CC      drivers/dpll/dpll_core.o
  CC [M]  drivers/accel/ivpu/ivpu_drv.o
  CC [M]  drivers/platform/x86/intel/vsec.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.o
  CC [M]  drivers/accel/habanalabs/common/mmu/mmu_v1.o
  CC [M]  drivers/platform/x86/acer-wireless.o
  CC [M]  drivers/accel/ivpu/ivpu_fw.o
  CC [M]  drivers/media/rc/keymaps/rc-tanix-tx3mini.o
  CC [M]  drivers/hid/hid-ft260.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv04.o
  CC [M]  drivers/nvmem/rave-sp-eeprom.o
  CC [M]  drivers/accel/habanalabs/common/mmu/mmu_v2.o
  CC [M]  drivers/gpu/drm/i915/gt/gen7_renderstate.o
  CC [M]  drivers/platform/x86/intel/bytcrc_pwrsrc.o
  CC [M]  drivers/accel/habanalabs/common/mmu/mmu_v2_hr.o
  CC      fs/mpage.o
  CC [M]  drivers/hwmon/as370-hwmon.o
  CC [M]  drivers/staging/fbtft/fb_tls8204.o
  CC [M]  drivers/platform/chrome/cros_kbd_led_backlight.o
  CC [M]  drivers/crypto/intel/qat/qat_common/qat_compression.o
  CC [M]  drivers/gpu/drm/i915/gt/gen8_renderstate.o
  CC [M]  drivers/hid/hid-glorious.o
  CC [M]  drivers/vdpa/vdpa_sim/vdpa_sim.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_db_mgr.o
  CC [M]  drivers/gpu/drm/i915/gt/gen9_renderstate.o
  CC [M]  drivers/hwtracing/intel_th/sth.o
  CC [M]  drivers/extcon/extcon-ptn5150.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v4_0.o
  CC [M]  net/netfilter/xt_addrtype.o
  CC [M]  drivers/platform/x86/intel/bxtwc_tmu.o
  AR      drivers/net/built-in.a
  CC [M]  drivers/md/dm-bio-prison-v2.o
  CC      fs/proc_namespace.o
  CC [M]  drivers/accel/ivpu/ivpu_fw_log.o
  CC [M]  drivers/md/dm-crypt.o
  CC [M]  drivers/media/rc/keymaps/rc-tanix-tx5max.o
  CC [M]  drivers/platform/chrome/cros_ec_chardev.o
  CC      fs/direct-io.o
  AR      drivers/interconnect/built-in.a
  CC [M]  drivers/hid/hid-vivaldi-common.o
  CC [M]  drivers/nvmem/rmem.o
  CC [M]  drivers/hwmon/asc7621.o
  CC      drivers/dpll/dpll_netlink.o
  CC [M]  drivers/media/rc/keymaps/rc-tbs-nec.o
  CC [M]  drivers/vdpa/vdpa_sim/vdpa_sim_net.o
  CC [M]  drivers/accel/habanalabs/common/pci/pci.o
  LD [M]  drivers/ras/amd/atl/amd_atl.o
  AR      drivers/ras/built-in.a
  CC [M]  drivers/staging/fbtft/fb_uc1611.o
  CC [M]  drivers/md/dm-delay.o
  CC [M]  drivers/media/rc/keymaps/rc-technisat-ts35.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_engine_activity.o
  CC [M]  drivers/staging/fbtft/fb_uc1701.o
  AR      drivers/hte/built-in.a
  CC [M]  drivers/crypto/intel/qat/qat_common/qat_crypto.o
  CC [M]  drivers/extcon/extcon-rt8973a.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_busy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v5_0.o
  CC [M]  drivers/parport/share.o
  CC      fs/eventpoll.o
  CC [M]  drivers/extcon/extcon-sm5502.o
  CC [M]  drivers/target/loopback/tcm_loop.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_hwconfig.o
  CC      drivers/dpll/dpll_nl.o
  CC [M]  drivers/extcon/extcon-usb-gpio.o
  CC [M]  drivers/hwtracing/intel_th/msu.o
  CC [M]  net/netfilter/xt_bpf.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv05.o
  CC [M]  drivers/platform/x86/intel/chtdc_ti_pwrbtn.o
  CC [M]  drivers/media/rc/ati_remote.o
  CC [M]  drivers/md/dm-flakey.o
  CC [M]  drivers/platform/x86/acer-wmi.o
  CC [M]  drivers/platform/chrome/cros_ec_lightbar.o
  CC [M]  drivers/accel/ivpu/ivpu_gem.o
  CC [M]  drivers/mtd/parsers/cmdlinepart.o
  CC [M]  drivers/accel/ivpu/ivpu_hw.o
  CC [M]  drivers/nvmem/qcom-spmi-sdam.o
  CC [M]  drivers/spmi/spmi.o
  CC [M]  drivers/vdpa/vdpa_sim/vdpa_sim_blk.o
  CC [M]  drivers/hsi/clients/hsi_char.o
  CC [M]  drivers/mtd/parsers/redboot.o
  CC [M]  drivers/media/rc/keymaps/rc-technisat-usb2.o
  CC [M]  drivers/hid/hid-google-hammer.o
  CC [M]  drivers/mtd/chips/chipreg.o
  CC [M]  drivers/hid/hid-vivaldi.o
  CC [M]  drivers/crypto/intel/qat/qat_common/qat_hal.o
  CC [M]  drivers/mtd/chips/cfi_probe.o
  CC [M]  drivers/crypto/intel/qat/qat_common/qat_mig_dev.o
  CC [M]  drivers/staging/fbtft/fb_upd161704.o
  CC [M]  drivers/crypto/intel/qat/qat_common/qat_uclo.o
  CC [M]  drivers/platform/x86/intel/chtwc_int33fe.o
  CC [M]  drivers/mtd/chips/cfi_util.o
  LD [M]  drivers/nvmem/nvmem-rave-sp-eeprom.o
  CC [M]  drivers/spmi/spmi-devres.o
  CC [M]  drivers/mtd/lpddr/qinfo_probe.o
  CC [M]  drivers/accel/habanalabs/common/habanalabs_drv.o
  CC [M]  drivers/parport/ieee1284.o
  CC [M]  net/netfilter/xt_cluster.o
  CC [M]  drivers/hwmon/asus_rog_ryujin.o
  CC [M]  drivers/extcon/extcon-usbc-cros-ec.o
  CC [M]  drivers/platform/x86/adv_swbutton.o
  AR      drivers/accel/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_guc_id_mgr.o
  LD [M]  drivers/nvmem/nvmem-rmem.o
  LD [M]  drivers/nvmem/nvmem_qcom-spmi-sdam.o
  AR      drivers/nvmem/built-in.a
  CC [M]  drivers/platform/chrome/cros_ec_debugfs.o
  CC [M]  drivers/vdpa/vdpa_user/vduse_dev.o
  CC [M]  drivers/accel/ivpu/ivpu_hw_btrs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv10.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/aldebaran_reg_init.o
  CC [M]  drivers/target/iscsi/iscsi_target_parameters.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_klv_helpers.o
  CC [M]  drivers/media/rc/keymaps/rc-terratec-cinergy-c-pci.o
  CC [M]  drivers/accel/ivpu/ivpu_hw_ip.o
  CC [M]  drivers/extcon/extcon-usbc-tusb320.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_clflush.o
  CC [M]  drivers/md/dm-path-selector.o
  CC [M]  drivers/md/dm-mpath.o
  CC [M]  drivers/media/rc/rc-loopback.o
  CC [M]  drivers/platform/x86/apple-gmux.o
  CC [M]  drivers/slimbus/core.o
  CC [M]  drivers/vdpa/ifcvf/ifcvf_main.o
  CC [M]  drivers/vdpa/virtio_pci/vp_vdpa.o
  CC [M]  drivers/media/rc/xbox_remote.o
  CC [M]  drivers/hsi/hsi_core.o
  CC [M]  drivers/vdpa/alibaba/eni_vdpa.o
  CC [M]  drivers/hwtracing/intel_th/pti.o
  CC [M]  drivers/hid/hid-holtek-kbd.o
  CC [M]  drivers/mtd/lpddr/lpddr_cmds.o
  CC [M]  drivers/hid/hid-holtek-mouse.o
  CC [M]  drivers/accel/habanalabs/common/device.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_log.o
  CC [M]  drivers/platform/x86/intel/crystal_cove_charger.o
  CC [M]  drivers/media/rc/keymaps/rc-terratec-cinergy-s2-hd.o
  CC [M]  drivers/hwmon/atxp1.o
  CC [M]  drivers/vdpa/ifcvf/ifcvf_base.o
  CC [M]  drivers/uio/uio.o
  CC      fs/anon_inodes.o
  LD [M]  drivers/staging/fbtft/fbtft.o
  CC [M]  drivers/mtd/maps/map_funcs.o
  CC [M]  drivers/platform/chrome/cros_ec_sensorhub.o
  AR      drivers/dpll/built-in.a
  CC [M]  drivers/accel/habanalabs/common/context.o
  CC [M]  drivers/mtd/maps/l440gx.o
  CC [M]  drivers/vdpa/solidrun/snet_main.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/aldebaran.o
  CC [M]  drivers/target/tcm_remote/tcm_remote.o
  CC [M]  drivers/vdpa/solidrun/snet_ctrl.o
  CC [M]  net/netfilter/xt_comment.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv1a.o
  CC [M]  drivers/mtd/chips/cfi_cmdset_0020.o
  CC [M]  drivers/parport/ieee1284_ops.o
  CC [M]  drivers/uio/uio_cif.o
  CC [M]  drivers/mtd/maps/amd76xrom.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/soc21.o
  CC [M]  drivers/hwtracing/intel_th/msu-sink.o
  AR      drivers/extcon/built-in.a
  CC [M]  net/netfilter/xt_connbytes.o
  CC [M]  drivers/target/iscsi/iscsi_target_seq_pdu_list.o
  CC [M]  drivers/accel/ivpu/ivpu_ipc.o
  CC [M]  drivers/mtd/maps/esb2rom.o
  CC [M]  drivers/platform/x86/intel/mrfld_pwrbtn.o
  CC [M]  drivers/media/rc/keymaps/rc-terratec-cinergy-xs.o
  CC      drivers/gpu/drm/drm_edid_load.o
  CC      fs/signalfd.o
  CC      fs/timerfd.o
  CC [M]  drivers/slimbus/messaging.o
  CC      fs/eventfd.o
  CC [M]  drivers/hsi/hsi_boardinfo.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_context.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_cnv_dbgfs.o
  CC [M]  drivers/hid/hid-holtekff.o
  CC [M]  drivers/media/rc/keymaps/rc-terratec-slim-2.o
  CC [M]  drivers/target/iscsi/iscsi_target_auth.o
  CC [M]  drivers/platform/chrome/cros_ec_sensorhub_ring.o
  CC [M]  drivers/platform/x86/asus-laptop.o
  CC      fs/userfaultfd.o
  CC      fs/aio.o
  CC [M]  drivers/hwmon/axi-fan-control.o
  CC [M]  drivers/media/rc/keymaps/rc-terratec-slim.o
  CC [M]  drivers/target/iscsi/iscsi_target_datain_values.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_dbgfs.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_pc.o
  CC [M]  drivers/md/dm-ps-round-robin.o
  CC [M]  drivers/hwmon/chipcap2.o
  CC [M]  drivers/vdpa/vdpa_user/iova_domain.o
  CC [M]  drivers/hid/hid-ite.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv20.o
  CC [M]  drivers/mtd/devices/slram.o
  CC [M]  drivers/target/iscsi/iscsi_target_device.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_create.o
  LD [M]  drivers/hwtracing/intel_th/intel_th.o
  LD [M]  drivers/hwtracing/intel_th/intel_th_pci.o
  LD [M]  drivers/hwtracing/intel_th/intel_th_acpi.o
  LD [M]  drivers/hwtracing/intel_th/intel_th_gth.o
  CC [M]  drivers/hid/hid-jabra.o
  CC [M]  drivers/mtd/nand/onenand/onenand_base.o
  LD [M]  drivers/hwtracing/intel_th/intel_th_sth.o
  CC [M]  drivers/platform/x86/intel/punit_ipc.o
  LD [M]  drivers/hwtracing/intel_th/intel_th_msu.o
  LD [M]  drivers/hwtracing/intel_th/intel_th_pti.o
  LD [M]  drivers/hwtracing/intel_th/intel_th_msu_sink.o
  CC [M]  drivers/uio/uio_pdrv_genirq.o
  LD [M]  drivers/vdpa/ifcvf/ifcvf.o
  CC [M]  drivers/mtd/nand/raw/nand_base.o
  CC [M]  drivers/target/iscsi/iscsi_target_erl0.o
  CC [M]  drivers/mtd/nand/raw/nand_legacy.o
  CC [M]  drivers/uio/uio_dmem_genirq.o
  CC [M]  drivers/media/rc/keymaps/rc-tevii-nec.o
  CC [M]  drivers/mtd/maps/ichxrom.o
  CC [M]  drivers/mtd/nand/onenand/onenand_bbt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.o
  CC [M]  drivers/accel/habanalabs/common/asid.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_submit.o
  CC [M]  drivers/hwmon/coretemp.o
  CC      drivers/gpu/drm/drm_privacy_screen.o
  CC [M]  drivers/accel/ivpu/ivpu_job.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.o
  CC [M]  drivers/mtd/devices/phram.o
  CC [M]  drivers/platform/x86/asus-wireless.o
  CC [M]  drivers/parport/procfs.o
  CC [M]  drivers/vdpa/solidrun/snet_hwmon.o
  CC [M]  drivers/platform/x86/intel/plr_tpmi.o
  CC [M]  net/netfilter/xt_connlabel.o
  CC [M]  drivers/gpu/drm/xe/xe_heci_gsc.o
  CC [M]  drivers/slimbus/sched.o
  LD [M]  drivers/hsi/hsi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/soc24.o
  CC [M]  drivers/slimbus/stream.o
  CC      drivers/gpu/drm/drm_privacy_screen_x86.o
  CC [M]  drivers/md/dm-ps-queue-length.o
  CC [M]  drivers/mtd/devices/pmc551.o
  CC [M]  drivers/mtd/chips/cfi_cmdset_0002.o
  CC [M]  drivers/mtd/devices/mtdram.o
  CC [M]  net/netfilter/xt_connlimit.o
  CC [M]  drivers/media/rc/keymaps/rc-tivo.o
  CC      drivers/gpu/drm/../../accel/drm_accel.o
  CC [M]  drivers/mtd/nand/spi/core.o
  CC [M]  drivers/hid/hid-kensington.o
  CC [M]  drivers/hwmon/corsair-cpro.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_fw_counters.o
  CC [M]  drivers/mtd/spi-nor/core.o
  CC [M]  net/netfilter/xt_conntrack.o
  CC [M]  drivers/uio/uio_aec.o
  CC [M]  drivers/mtd/maps/ck804xrom.o
  CC [M]  drivers/mtd/nand/raw/nand_bbt.o
  CC [M]  drivers/mtd/spi-nor/sfdp.o
  CC      drivers/gpu/drm/drm_panel_orientation_quirks.o
  CC [M]  drivers/target/iscsi/iscsi_target_erl1.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_gen4_pm_debugfs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g84.o
  CC [M]  drivers/accel/habanalabs/common/habanalabs_ioctl.o
  CC [M]  drivers/parport/daisy.o
  CC [M]  drivers/mtd/devices/block2mtd.o
  CC [M]  drivers/platform/x86/intel/tpmi_power_domains.o
  LD [M]  drivers/vdpa/vdpa_user/vduse.o
  CC [M]  drivers/mtd/spi-nor/swp.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_gen4_tl.o
  CC [M]  drivers/gpu/drm/xe/xe_huc.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_heartbeat_dbgfs.o
  CC [M]  drivers/media/rc/keymaps/rc-total-media-in-hand-02.o
  CC [M]  drivers/mtd/spi-nor/otp.o
  CC [M]  drivers/md/dm-ps-service-time.o
  CC [M]  drivers/mtd/ubi/vtbl.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_domain.o
  CC [M]  drivers/target/target_core_configfs.o
  CC [M]  drivers/hid/hid-keytouch.o
  CC [M]  drivers/platform/x86/intel/vsec_tpmi.o
  CC [M]  drivers/platform/chrome/cros_ec_sysfs.o
  CC [M]  drivers/mtd/devices/mtd_dataflash.o
  LD [M]  drivers/vdpa/solidrun/snet_vdpa.o
  CC [M]  drivers/hid/hid-lenovo.o
  CC [M]  drivers/accel/ivpu/ivpu_jsm_msg.o
  CC [M]  drivers/vdpa/octeon_ep/octep_vdpa_main.o
  CC [M]  drivers/mtd/nand/onenand/generic.o
  CC [M]  drivers/uio/uio_sercos3.o
  CC [M]  drivers/slimbus/qcom-ctrl.o
  CC [M]  drivers/platform/x86/asus-wmi.o
  CC [M]  drivers/mtd/hyperbus/hyperbus-core.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sienna_cichlid.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.o
  CC [M]  drivers/mtd/maps/physmap-core.o
  CC [M]  drivers/hwmon/corsair-psu.o
  CC [M]  drivers/mtd/chips/cfi_cmdset_0001.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o
  CC [M]  drivers/mtd/ubi/vmt.o
  CC [M]  drivers/media/rc/keymaps/rc-total-media-in-hand.o
  CC [M]  drivers/parport/probe.o
  CC [M]  kernel/kheaders.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.o
  CC [M]  drivers/mtd/nand/spi/otp.o
  CC [M]  drivers/accel/habanalabs/common/command_buffer.o
  CC [M]  net/netfilter/xt_cpu.o
  CC [M]  drivers/accel/habanalabs/common/hw_queue.o
  CC [M]  drivers/platform/chrome/cros_hps_i2c.o
  CC [M]  drivers/block/aoe/aoeblk.o
  CC [M]  drivers/target/iscsi/iscsi_target_erl2.o
  CC [M]  drivers/vfio/pci/virtio/main.o
  CC [M]  drivers/vfio/pci/qat/main.o
  CC [M]  drivers/target/iscsi/iscsi_target_login.o
  LD [M]  drivers/mtd/nand/onenand/onenand.o
  CC [M]  drivers/md/dm-ps-historical-service-time.o
  CC      fs/dax.o
  CC      fs/locks.o
  CC [M]  drivers/hwmon/cros_ec_hwmon.o
  CC      drivers/gpu/drm/drm_gem_shmem_helper.o
  CC [M]  drivers/uio/uio_pci_generic.o
  CC [M]  drivers/mtd/nand/spi/alliancememory.o
  CC [M]  drivers/mtd/nand/spi/ato.o
  CC      drivers/gpu/drm/drm_fbdev_shmem.o
  LD [M]  drivers/slimbus/slimbus.o
  CC [M]  drivers/mtd/nand/spi/esmt.o
  LD [M]  drivers/slimbus/slim-qcom-ctrl.o
  CC [M]  drivers/accel/habanalabs/common/irq.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_heartbeat.o
  CC [M]  drivers/media/rc/keymaps/rc-trekstor.o
  CC [M]  drivers/mtd/devices/mchp23k256.o
  CC [M]  drivers/accel/ivpu/ivpu_mmu.o
  CC [M]  drivers/mtd/chips/gen_probe.o
  CC [M]  drivers/mtd/maps/sbc_gxx.o
  CC [M]  drivers/block/aoe/aoechr.o
  CC [M]  drivers/parport/parport_pc.o
  CC [M]  drivers/block/aoe/aoecmd.o
  CC [M]  drivers/block/aoe/aoedev.o
  CC [M]  drivers/platform/chrome/cros_usbpd_logger.o
  CC [M]  drivers/hwmon/da9052-hwmon.o
  CC [M]  drivers/mtd/nand/spi/foresee.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v4_3.o
  CC [M]  drivers/mtd/devices/mchp48l640.o
  CC [M]  drivers/hid/hid-lg.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.o
  CC [M]  drivers/mtd/ubi/upd.o
  CC [M]  drivers/vdpa/octeon_ep/octep_vdpa_hw.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine.o
  CC [M]  drivers/mtd/spi-nor/sysfs.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_pm_dbgfs.o
  CC [M]  drivers/hid/hid-lg-g15.o
  CC [M]  drivers/platform/x86/intel/smartconnect.o
  CC [M]  drivers/hid/hid-logitech-dj.o
  CC [M]  drivers/uio/uio_netx.o
  CC [M]  net/netfilter/xt_dccp.o
  LD [M]  drivers/vfio/pci/qat/qat_vfio_pci.o
  CC [M]  drivers/hwmon/da9055-hwmon.o
  CC [M]  drivers/uio/uio_mf624.o
  CC [M]  drivers/mtd/ubi/build.o
  CC [M]  drivers/media/rc/keymaps/rc-tt-1500.o
  CC [M]  drivers/md/dm-ps-io-affinity.o
  CC [M]  drivers/mtd/ubi/cdev.o
  CC [M]  drivers/mtd/mtdcore.o
  CC [M]  drivers/mtd/maps/pci.o
  CC [M]  drivers/mtd/nand/raw/nand_timings.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v6_0.o
  CC      fs/binfmt_script.o
  CC [M]  drivers/vfio/pci/virtio/migrate.o
  CC [M]  drivers/vfio/mdev/mdev_core.o
  CC [M]  drivers/vfio/pci/virtio/legacy_io.o
  CC [M]  drivers/platform/chrome/cros_usbpd_notify.o
  CC      fs/binfmt_elf.o
  CC [M]  drivers/mtd/nand/spi/gigadevice.o
  CC [M]  drivers/accel/habanalabs/common/sysfs.o
  CC      fs/compat_binfmt_elf.o
  CC [M]  drivers/mtd/devices/sst25l.o
  CC [M]  drivers/platform/x86/asus-nb-wmi.o
  CC [M]  drivers/mtd/nand/spi/macronix.o
  CC [M]  drivers/vfio/mdev/mdev_sysfs.o
  LD [M]  drivers/platform/x86/intel/intel-hid.o
  LD [M]  drivers/platform/x86/intel/intel-vbtn.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.o
  CC [M]  drivers/accel/ivpu/ivpu_mmu_context.o
  LD [M]  drivers/platform/x86/intel/intel-int0002_vgpio.o
  LD [M]  drivers/platform/x86/intel/intel-ishtp_eclite.o
  CC [M]  drivers/media/rc/keymaps/rc-twinhan1027.o
  LD [M]  drivers/platform/x86/intel/intel-sdsi.o
  LD [M]  drivers/platform/x86/intel/intel-vsec.o
  CC [M]  drivers/mtd/spi-nor/atmel.o
  LD [M]  drivers/platform/x86/intel/intel-bytcrc_pwrsrc.o
  CC [M]  drivers/mtd/chips/jedec_probe.o
  LD [M]  drivers/platform/x86/intel/intel-bxtwc_tmu.o
  LD [M]  drivers/platform/x86/intel/intel-chtdc_ti_pwrbtn.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_telemetry.o
  LD [M]  drivers/platform/x86/intel/intel-chtwc_int33fe.o
  LD [M]  drivers/platform/x86/intel/intel-crystal_cove_charger.o
  LD [M]  drivers/platform/x86/intel/intel-mrfld_pwrbtn.o
  LD [M]  drivers/platform/x86/intel/intel-punit_ipc.o
  CC [M]  drivers/media/rc/keymaps/rc-twinhan-dtv-cab-ci.o
  LD [M]  drivers/platform/x86/intel/intel-plr_tpmi.o
  LD [M]  drivers/platform/x86/intel/intel-tpmi_power_domains.o
  LD [M]  drivers/platform/x86/intel/intel-vsec_tpmi.o
  LD [M]  drivers/platform/x86/intel/intel-smartconnect.o
  AR      drivers/platform/x86/intel/built-in.a
  CC [M]  drivers/accel/ivpu/ivpu_ms.o
  CC [M]  drivers/hwmon/dell-smm-hwmon.o
  CC [M]  drivers/uio/uio_hv_generic.o
  CC [M]  drivers/media/rc/keymaps/rc-vega-s9x.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_tl_debugfs.o
  CC [M]  drivers/mtd/nand/raw/nand_ids.o
  CC [M]  drivers/mtd/maps/nettel.o
  CC [M]  drivers/md/dm-switch.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_transport_debug.o
  CC [M]  drivers/mtd/maps/scb2_flash.o
  CC [M]  drivers/mtd/chips/map_ram.o
  CC [M]  drivers/accel/ivpu/ivpu_pm.o
  LD [M]  drivers/vdpa/octeon_ep/octep_vdpa.o
  CC [M]  drivers/vdpa/vdpa.o
  CC [M]  drivers/hid/hid-logitech-hidpp.o
  CC [M]  drivers/mtd/chips/map_rom.o
  CC [M]  drivers/mtd/ubi/kapi.o
  CC [M]  drivers/accel/ivpu/ivpu_sysfs.o
  CC      drivers/gpu/drm/drm_atomic_helper.o
  CC [M]  drivers/parport/parport_serial.o
  CC [M]  drivers/accel/ivpu/ivpu_trace_points.o
  CC [M]  drivers/block/aoe/aoemain.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.o
  CC [M]  drivers/vfio/mdev/mdev_driver.o
  CC [M]  drivers/target/iscsi/iscsi_target_nego.o
  CC [M]  net/netfilter/xt_devgroup.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_7.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.o
  CC [M]  drivers/mtd/mtdsuper.o
  CC [M]  drivers/target/target_core_device.o
  CC [M]  drivers/mtd/spi-nor/eon.o
  CC [M]  drivers/media/rc/keymaps/rc-videomate-m1f.o
  CC [M]  drivers/mtd/nand/spi/micron.o
  CC [M]  drivers/platform/x86/asus-tf103c-dock.o
  CC [M]  drivers/accel/habanalabs/common/hwmon.o
  CC [M]  drivers/mtd/nand/raw/nand_onfi.o
  CC [M]  drivers/media/rc/keymaps/rc-videomate-s350.o
  CC [M]  drivers/target/target_core_fabric_configfs.o
  CC [M]  drivers/mtd/spi-nor/esmt.o
  CC [M]  drivers/mtd/nand/core.o
  CC [M]  drivers/target/target_core_fabric_lib.o
  LD [M]  drivers/platform/chrome/cros-ec-typec.o
  LD [M]  drivers/platform/chrome/cros_ec_lpcs.o
  LD [M]  drivers/platform/chrome/cros-ec-proto.o
  LD [M]  drivers/platform/chrome/cros-ec-sensorhub.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_gen2_pfvf.o
  CC [M]  drivers/mtd/chips/map_absent.o
  CC [M]  drivers/mtd/ubi/eba.o
  CC [M]  drivers/w1/masters/amd_axi_w1.o
  CC [M]  drivers/w1/masters/matrox_w1.o
  CC [M]  drivers/mtd/nand/raw/nand_jedec.o
  CC [M]  drivers/media/rc/keymaps/rc-videomate-tv-pvr.o
  CC [M]  drivers/mtd/maps/plat-ram.o
  LD [M]  drivers/vfio/pci/virtio/virtio-vfio-pci.o
  CC [M]  drivers/vfio/pci/vfio_pci_core.o
  CC [M]  drivers/md/dm-snap.o
  CC [M]  drivers/hwmon/dme1737.o
  CC [M]  drivers/md/dm-exception-store.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_internal.o
  CC [M]  drivers/md/dm-snap-transient.o
  CC [M]  drivers/md/dm-snap-persistent.o
  CC [M]  drivers/mtd/spi-nor/everspin.o
  CC [M]  drivers/target/iscsi/iscsi_target_nodeattrib.o
  LD [M]  drivers/parport/parport.o
  CC [M]  drivers/mtd/nand/raw/nand_amd.o
  CC      drivers/gpu/drm/drm_atomic_state_helper.o
  CC [M]  drivers/w1/slaves/w1_therm.o
  CC [M]  drivers/mtd/ubi/io.o
  CC [M]  drivers/block/aoe/aoenet.o
  CC [M]  drivers/platform/x86/eeepc-laptop.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_lmem.o
  CC [M]  drivers/mtd/nand/raw/nand_esmt.o
  CC [M]  net/netfilter/xt_dscp.o
  CC [M]  drivers/mtd/nand/spi/paragon.o
  CC      drivers/gpu/drm/drm_bridge_helper.o
  CC      fs/backing-file.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.o
  CC [M]  drivers/mtd/nand/raw/nand_hynix.o
  CC [M]  drivers/accel/ivpu/ivpu_debugfs.o
  CC [M]  drivers/mtd/spi-nor/gigadevice.o
  CC      fs/mbcache.o
  CC [M]  drivers/media/rc/keymaps/rc-videostrong-kii-pro.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_gen4_pfvf.o
  LD [M]  drivers/vfio/mdev/mdev.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_mman.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_pfvf_pf_msg.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_pfvf_pf_proto.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine_group.o
  LD [M]  drivers/mtd/maps/physmap.o
  CC [M]  drivers/mtd/spi-nor/intel.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm200.o
  CC [M]  drivers/w1/masters/ds2490.o
  CC [M]  drivers/md/dm-raid1.o
  CC [M]  drivers/mtd/ubi/wl.o
  CC [M]  drivers/mtd/spi-nor/issi.o
  CC [M]  drivers/hwmon/drivetemp.o
  CC [M]  drivers/accel/habanalabs/common/memory.o
  CC [M]  drivers/mtd/spi-nor/macronix.o
  CC [M]  drivers/md/dm-log.o
  CC [M]  drivers/w1/masters/ds2482.o
  CC [M]  drivers/mtd/nand/raw/nand_macronix.o
  CC [M]  drivers/mtd/nand/raw/nand_micron.o
  CC [M]  net/netfilter/xt_ecn.o
  CC [M]  drivers/mtd/nand/spi/skyhigh.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v5_2.o
  CC [M]  drivers/memstick/core/memstick.o
  CC [M]  drivers/memstick/host/tifm_ms.o
  CC [M]  drivers/media/rc/keymaps/rc-wetek-hub.o
  CC [M]  drivers/w1/w1.o
  CC [M]  drivers/memstick/core/ms_block.o
  CC [M]  drivers/hid/hid-magicmouse.o
  CC [M]  drivers/target/iscsi/iscsi_target_tmr.o
  CC [M]  drivers/platform/x86/eeepc-wmi.o
  CC [M]  drivers/accel/ivpu/ivpu_coredump.o
  LD [M]  drivers/block/aoe/aoe.o
  CC [M]  drivers/memstick/core/mspro_block.o
  CC [M]  drivers/hwmon/ds620.o
  CC      fs/posix_acl.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/lsdma_v6_0.o
  CC [M]  drivers/w1/slaves/w1_smem.o
  CC [M]  drivers/target/target_core_hba.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_object.o
  CC [M]  drivers/media/rc/keymaps/rc-wetek-play2.o
  CC [M]  drivers/w1/w1_int.o
  CC [M]  drivers/target/iscsi/iscsi_target_tpg.o
  CC [M]  drivers/hwmon/ds1621.o
  CC [M]  drivers/mtd/mtdconcat.o
  CC [M]  drivers/target/target_core_pr.o
  CC [M]  drivers/target/target_core_alua.o
  CC [M]  drivers/mtd/nand/raw/nand_sandisk.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gv100.o
  CC [M]  drivers/hid/hid-mcp2200.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_fence.o
  CC [M]  drivers/media/rc/keymaps/rc-winfast.o
  CC [M]  drivers/mtd/spi-nor/micron-st.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/ga100.o
  CC [M]  drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.o
  CC [M]  drivers/target/target_core_tmr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_9.o
  CC [M]  drivers/mtd/nand/spi/toshiba.o
  CC [M]  drivers/w1/masters/w1-gpio.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_pfvf_utils.o
  CC [M]  drivers/dca/dca-core.o
  CC [M]  drivers/ssb/main.o
  CC [M]  drivers/w1/slaves/w1_ds2405.o
  CC [M]  drivers/bcma/main.o
  CC [M]  drivers/vfio/pci/vfio_pci_intrs.o
  LD [M]  drivers/accel/ivpu/intel_vpu.o
  CC [M]  drivers/bcma/scan.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_pages.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.o
  CC [M]  drivers/memstick/host/jmb38x_ms.o
  CC [M]  drivers/platform/x86/meraki-mx100.o
  CC [M]  drivers/mtd/spi-nor/spansion.o
  CC [M]  drivers/hid/hid-mcp2221.o
  CC [M]  drivers/dca/dca-sysfs.o
  CC [M]  drivers/w1/masters/sgi_w1.o
  CC [M]  drivers/target/iscsi/iscsi_target_util.o
  CC [M]  drivers/mtd/ubi/attach.o
  CC [M]  drivers/mtd/nand/raw/nand_samsung.o
  CC [M]  drivers/md/dm-region-hash.o
  CC [M]  drivers/hid/hid-microsoft.o
  CC [M]  net/netfilter/xt_esp.o
  CC [M]  drivers/media/rc/keymaps/rc-x96max.o
  CC [M]  drivers/mtd/nand/bbt.o
  CC [M]  drivers/w1/w1_family.o
  CC [M]  drivers/w1/w1_netlink.o
  CC      drivers/gpu/drm/drm_crtc_helper.o
  CC [M]  drivers/hwmon/emc1403.o
  CC [M]  drivers/target/target_core_tpg.o
  CC [M]  drivers/memstick/host/r592.o
  CC [M]  net/netfilter/xt_hashlimit.o
  CC [M]  drivers/mtd/nand/spi/winbond.o
  CC [M]  drivers/mtd/nand/ecc.o
  CC [M]  drivers/platform/x86/fujitsu-laptop.o
  CC [M]  drivers/mtd/nand/raw/nand_toshiba.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_pfvf_vf_msg.o
  CC [M]  drivers/mtd/spi-nor/sst.o
  CC [M]  drivers/w1/slaves/w1_ds2408.o
  CC [M]  drivers/platform/x86/fujitsu-tablet.o
  CC [M]  drivers/accel/habanalabs/common/command_submission.o
  CC [M]  drivers/platform/x86/gpd-pocket-fan.o
  CC [M]  drivers/mtd/ubi/misc.o
  CC [M]  drivers/w1/masters/w1-uart.o
  CC [M]  drivers/gpu/drm/xe/xe_irq.o
  CC [M]  drivers/w1/slaves/w1_ds2413.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.o
  CC [M]  drivers/memstick/host/rtsx_usb_ms.o
  CC [M]  drivers/hid/hid-monterey.o
  CC [M]  drivers/w1/slaves/w1_ds2406.o
  CC [M]  drivers/vfio/pci/vfio_pci_rdwr.o
  CC [M]  drivers/media/rc/keymaps/rc-xbox-360.o
  CC [M]  drivers/vfio/vfio_main.o
  CC [M]  drivers/mtd/spi-nor/winbond.o
  CC [M]  drivers/platform/x86/uv_sysfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.o
  CC      fs/coredump.o
  LD [M]  drivers/dca/dca.o
  CC [M]  drivers/ssb/scan.o
  CC [M]  drivers/hid/hid-multitouch.o
  CC [M]  drivers/target/iscsi/iscsi_target.o
  CC [M]  drivers/mtd/nand/raw/sm_common.o
  CC [M]  drivers/mtd/nand/spi/xtx.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_phys.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_pfvf_vf_proto.o
  CC [M]  drivers/vhost/net.o
  CC [M]  drivers/bcma/core.o
  CC [M]  drivers/ssb/sprom.o
  CC [M]  drivers/md/dm-log-userspace-base.o
  CC      drivers/gpu/drm/drm_damage_helper.o
  CC [M]  drivers/mtd/ubi/debug.o
  CC [M]  drivers/rpmsg/rpmsg_core.o
  CC [M]  drivers/mtd/mtdpart.o
  CC [M]  drivers/rpmsg/rpmsg_char.o
  CC [M]  drivers/hwmon/emc2103.o
  CC [M]  drivers/target/iscsi/iscsi_target_configfs.o
  CC [M]  drivers/ssb/pci.o
  CC [M]  drivers/md/dm-log-userspace-transfer.o
  CC [M]  drivers/accel/habanalabs/common/firmware_if.o
  CC [M]  drivers/mtd/nand/ecc-sw-hamming.o
  CC [M]  drivers/hid/hid-ntrig.o
  CC [M]  drivers/w1/slaves/w1_ds2423.o
  CC [M]  drivers/media/rc/keymaps/rc-xbox-dvd.o
  CC [M]  drivers/platform/x86/ibm_rtl.o
  CC [M]  drivers/mtd/nand/ecc-sw-bch.o
  CC [M]  drivers/gpu/drm/xe/xe_lrc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_11.o
  CC [M]  drivers/w1/w1_io.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.o
  CC [M]  drivers/mtd/ubi/fastmap.o
  CC [M]  drivers/vfio/pci/vfio_pci_config.o
  CC [M]  net/netfilter/xt_helper.o
  CC [M]  drivers/mtd/spi-nor/xmc.o
  CC [M]  drivers/mtd/nand/raw/cafe_nand.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/lsdma_v7_0.o
  CC [M]  drivers/target/target_core_transport.o
  LD [M]  drivers/mtd/nand/spi/spinand.o
  CC [M]  drivers/mtd/spi-nor/debugfs.o
  CC [M]  drivers/mtd/ubi/block.o
  CC      fs/drop_caches.o
  CC [M]  drivers/rpmsg/rpmsg_ctrl.o
  CC [M]  drivers/media/rc/keymaps/rc-zx-irdec.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp100.o
  CC [M]  drivers/w1/slaves/w1_ds2430.o
  CC [M]  drivers/target/iscsi/iscsi_target_stat.o
  CC [M]  drivers/bcma/sprom.o
  CC [M]  drivers/platform/x86/hdaps.o
  CC [M]  drivers/hid/hid-penmount.o
  CC [M]  drivers/bcma/driver_chipcommon.o
  CC [M]  drivers/rpmsg/rpmsg_ns.o
  CC [M]  drivers/hwmon/emc2305.o
  CC [M]  drivers/ssb/pcihost_wrapper.o
  CC [M]  drivers/md/dm-zero.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_pm.o
  CC [M]  drivers/platform/x86/thinkpad_acpi.o
  CC [M]  drivers/vfio/device_cdev.o
  CC [M]  drivers/vfio/pci/vfio_pci.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_sriov.o
  CC [M]  drivers/platform/x86/think-lmi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp10b.o
  CC [M]  drivers/ipack/devices/ipoctal.o
  CC [M]  drivers/hwmon/emc6w201.o
  CC [M]  drivers/ipack/carriers/tpci200.o
  CC      drivers/gpu/drm/drm_flip_work.o
  CC [M]  drivers/w1/slaves/w1_ds2431.o
  CC [M]  drivers/ntb/hw/idt/ntb_hw_idt.o
  CC [M]  drivers/ntb/hw/intel/ntb_hw_gen1.o
  CC [M]  drivers/ntb/hw/epf/ntb_hw_epf.o
  CC [M]  drivers/ntb/test/ntb_pingpong.o
  CC      drivers/gpu/drm/drm_format_helper.o
  CC [M]  drivers/ntb/hw/mscc/ntb_hw_switchtec.o
  CC [M]  drivers/crypto/intel/qat/qat_common/adf_vf_isr.o
  LD [M]  drivers/mtd/spi-nor/spi-nor.o
  CC      drivers/gpu/drm/drm_gem_atomic_helper.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_region.o
  CC [M]  drivers/mtd/nand/raw/denali.o
  CC [M]  net/netfilter/xt_hl.o
  CC [M]  drivers/w1/slaves/w1_ds2805.o
  CC [M]  drivers/mtd/mtdchar.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.o
  CC [M]  drivers/md/dm-raid.o
  CC [M]  drivers/mtd/nand/raw/denali_pci.o
  CC [M]  drivers/ssb/sdio.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v7_0.o
  CC      drivers/gpu/drm/drm_gem_framebuffer_helper.o
  CC [M]  drivers/vhost/scsi.o
  CC [M]  drivers/mtd/ubi/gluebi.o
  CC [M]  drivers/hid/hid-plantronics.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/tu102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.o
  CC      drivers/gpu/drm/drm_kms_helper_common.o
  CC [M]  drivers/rpmsg/qcom_glink_native.o
  CC [M]  drivers/target/target_core_sbc.o
  CC [M]  drivers/ipack/ipack.o
  CC [M]  drivers/target/iscsi/iscsi_target_transport.o
  CC [M]  drivers/accel/habanalabs/common/security.o
  LD [M]  drivers/media/rc/rc-core.o
  AR      drivers/media/rc/built-in.a
  CC      drivers/gpu/drm/drm_modeset_helper.o
  AR      drivers/media/built-in.a
  LD [M]  drivers/vfio/pci/vfio-pci.o
  CC [M]  net/netfilter/xt_ipcomp.o
  LD [M]  drivers/vfio/pci/vfio-pci-core.o
  CC [M]  drivers/vfio/group.o
  CC [M]  drivers/gpu/drm/xe/xe_migrate.o
  CC [M]  net/netfilter/xt_iprange.o
  CC [M]  drivers/vfio/container.o
  CC [M]  drivers/bcma/driver_chipcommon_pmu.o
  CC [M]  drivers/ntb/test/ntb_tool.o
  CC [M]  drivers/w1/slaves/w1_ds2433.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.o
  CC [M]  drivers/hwmon/f71805f.o
  CC      fs/sysctls.o
  CC [M]  drivers/target/target_core_spc.o
  CC [M]  drivers/accel/habanalabs/common/state_dump.o
  CC [M]  drivers/ntb/test/ntb_perf.o
  CC [M]  drivers/mtd/mtd_blkdevs.o
  CC      drivers/gpu/drm/drm_plane_helper.o
  CC [M]  drivers/ntb/core.o
  CC [M]  drivers/mtd/ubi/nvmem.o
  CC [M]  drivers/accel/habanalabs/common/memory_mgr.o
  CC      fs/fhandle.o
  CC [M]  drivers/mtd/nand/raw/diskonchip.o
  CC [M]  drivers/hid/hid-primax.o
  CC [M]  drivers/mtd/mtdblock.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_shmem.o
  LD [M]  drivers/crypto/intel/qat/qat_common/intel_qat.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/df_v1_7.o
  CC [M]  drivers/ntb/msi.o
  CC [M]  drivers/ssb/driver_chipcommon.o
  CC [M]  drivers/mtd/nand/ecc-mxic.o
  AR      drivers/crypto/built-in.a
  CC [M]  drivers/target/target_core_ua.o
  CC [M]  drivers/vfio/virqfd.o
  CC [M]  drivers/accel/habanalabs/common/decoder.o
  CC [M]  drivers/ntb/hw/intel/ntb_hw_gen3.o
  CC [M]  drivers/bcma/driver_chipcommon_b.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv04.o
  CC [M]  drivers/w1/slaves/w1_ds2438.o
  CC [M]  net/netfilter/xt_l2tp.o
  CC [M]  drivers/target/target_core_rd.o
  CC [M]  drivers/ssb/driver_chipcommon_pmu.o
  CC [M]  drivers/mtd/mtdblock_ro.o
  CC      fs/bpf_fs_kfuncs.o
  CC [M]  net/netfilter/xt_length.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/df_v3_6.o
  LD [M]  drivers/target/iscsi/iscsi_target_mod.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv10.o
  LD [M]  drivers/mtd/ubi/ubi.o
  CC [M]  drivers/vfio/iommufd.o
  CC [M]  drivers/hid/hid-razer.o
  CC [M]  drivers/ntb/hw/intel/ntb_hw_gen4.o
  CC [M]  drivers/ntb/ntb_transport.o
  CC [M]  drivers/hwmon/f71882fg.o
  CC [M]  drivers/hwmon/f75375s.o
  CC [M]  drivers/mcb/mcb-core.o
  CC [M]  drivers/target/target_core_stat.o
  CC [M]  drivers/target/target_core_xcopy.o
  CC [M]  drivers/md/dm-thin.o
  CC [M]  drivers/target/target_core_iblock.o
  CC [M]  drivers/vhost/vsock.o
  CC [M]  drivers/vfio/vfio_iommu_type1.o
  CC [M]  drivers/target/target_core_file.o
  CC [M]  drivers/platform/x86/lenovo-yogabook.o
  CC [M]  drivers/w1/slaves/w1_ds250x.o
  CC [M]  drivers/vhost/vringh.o
  CC [M]  drivers/mcb/mcb-parse.o
  CC [M]  fs/binfmt_misc.o
  LD [M]  drivers/w1/wire.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_shrinker.o
  CC [M]  drivers/gpu/drm/xe/xe_mmio.o
  CC [M]  drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.o
  CC [M]  drivers/hwmon/fam15h_power.o
  CC [M]  drivers/mtd/nand/raw/nandsim.o
  CC [M]  drivers/rpmsg/qcom_glink_ssr.o
  CC [M]  drivers/accel/habanalabs/gaudi2/gaudi2.o
  CC [M]  drivers/mcb/mcb-pci.o
  CC [M]  drivers/w1/slaves/w1_ds2780.o
  CC [M]  drivers/w1/slaves/w1_ds2781.o
  CC [M]  drivers/bcma/driver_chipcommon_sflash.o
  CC      drivers/gpu/drm/drm_probe_helper.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv1a.o
  CC [M]  drivers/thunderbolt/nhi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv20.o
  CC [M]  drivers/thunderbolt/nhi_ops.o
  CC [M]  drivers/md/dm-thin-metadata.o
  CC      drivers/gpu/drm/drm_self_refresh_helper.o
  CC [M]  drivers/hid/hid-redragon.o
  CC [M]  drivers/rpmsg/qcom_glink_rpm.o
  CC [M]  drivers/hwmon/fschmd.o
  LD [M]  drivers/ntb/hw/intel/ntb_hw_intel.o
  CC [M]  drivers/ssb/driver_pcicore.o
  CC [M]  drivers/mtd/nand/raw/gpio.o
  CC [M]  drivers/vhost/vdpa.o
  CC      drivers/gpu/drm/drm_simple_kms_helper.o
  CC [M]  drivers/hwtracing/stm/core.o
  CC [M]  drivers/gpu/drm/xe/xe_mocs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/df_v4_3.o
  CC [M]  net/netfilter/xt_limit.o
  CC [M]  drivers/mtd/ftl.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv25.o
  CC [M]  drivers/gpu/drm/xe/xe_module.o
  CC [M]  drivers/mtd/nand/raw/plat_nand.o
  CC [M]  drivers/gpu/drm/xe/xe_oa.o
  CC [M]  drivers/platform/x86/lenovo-wmi-camera.o
  CC [M]  drivers/gpu/drm/xe/xe_observation.o
  LD [M]  drivers/mtd/nand/nandcore.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv30.o
  CC [M]  drivers/tee/amdtee/core.o
  CC [M]  drivers/bcma/driver_pci.o
  CC [M]  drivers/bcma/driver_pcie2.o
  CC [M]  drivers/mcb/mcb-lpc.o
  CC [M]  drivers/target/target_core_pscsi.o
  CC [M]  drivers/thunderbolt/ctl.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_stolen.o
  CC [M]  drivers/tee/amdtee/call.o
  CC [M]  drivers/hid/hid-roccat.o
  CC [M]  drivers/platform/x86/quickstart.o
  AR      fs/built-in.a
  CC [M]  drivers/bcma/driver_gmac_cmn.o
  CC [M]  drivers/md/dm-verity-verify-sig.o
  CC [M]  drivers/w1/slaves/w1_ds28e04.o
  CC [M]  drivers/tee/amdtee/shm_pool.o
  CC [M]  drivers/hwtracing/stm/policy.o
  CC [M]  drivers/md/dm-verity-target.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv35.o
  CC [M]  drivers/thunderbolt/tb.o
  CC      drivers/gpu/drm/bridge/panel.o
  CC [M]  drivers/mux/core.o
  CC [M]  drivers/thunderbolt/switch.o
  CC [M]  drivers/target/target_core_user.o
  CC      drivers/gpu/drm/drm_fb_helper.o
  CC [M]  drivers/mtd/nand/raw/r852.o
  CC      drivers/gpu/drm/drm_mipi_dsi.o
  LD [M]  drivers/mcb/mcb.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv36.o
  CC [M]  drivers/hwmon/ftsteutates.o
  CC [M]  drivers/platform/x86/meegopad_anx7428.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/df_v4_6_2.o
  CC [M]  drivers/mtd/nand/raw/mxic_nand.o
  LD [M]  drivers/ntb/ntb.o
  CC [M]  drivers/platform/x86/msi-ec.o
  CC [M]  drivers/ssb/driver_gpio.o
  CC [M]  net/netfilter/xt_mac.o
  CC [M]  drivers/hid/hid-roccat-common.o
  CC [M]  drivers/w1/slaves/w1_ds28e17.o
  CC [M]  drivers/gpu/drm/drm_panel_backlight_quirks.o
  CC [M]  drivers/vhost/vhost.o
  CC [M]  drivers/thunderbolt/cap.o
  CC [M]  drivers/platform/x86/msi-wmi.o
  CC [M]  drivers/gpu/drm/drm_exec.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_throttle.o
  LD [M]  drivers/vfio/vfio.o
  CC [M]  drivers/rpmsg/virtio_rpmsg_bus.o
  CC [M]  drivers/thunderbolt/path.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv40.o
  CC [M]  drivers/gpu/drm/drm_gpuvm.o
  CC [M]  drivers/hid/hid-roccat-arvo.o
  CC [M]  drivers/gpu/drm/xe/xe_pat.o
  CC [M]  drivers/hid/hid-roccat-isku.o
  CC [M]  drivers/siox/siox-core.o
  LD [M]  drivers/tee/amdtee/amdtee.o
  CC [M]  drivers/tee/tee_core.o
  CC [M]  drivers/hid/hid-roccat-kone.o
  CC [M]  drivers/siox/siox-bus-gpio.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_tiling.o
  CC [M]  drivers/thunderbolt/tunnel.o
  CC [M]  drivers/bcma/driver_gpio.o
  CC [M]  drivers/bcma/host_pci.o
  CC [M]  drivers/gnss/core.o
  CC [M]  drivers/hwtracing/stm/p_basic.o
  CC [M]  drivers/gpu/drm/drm_gpusvm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv41.o
  LD [M]  drivers/ssb/ssb.o
  CC [M]  net/netfilter/xt_multiport.o
  CC [M]  drivers/gpu/drm/xe/xe_pci.o
  CC [M]  drivers/hwmon/g760a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/df_v4_15.o
  CC [M]  drivers/gnss/serial.o
  CC [M]  drivers/hwmon/g762.o
  CC [M]  drivers/mtd/nand/raw/arasan-nand-controller.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_ttm.o
  CC [M]  drivers/gpu/drm/drm_buddy.o
  CC [M]  drivers/md/dm-cache-target.o
  CC [M]  drivers/gpu/drm/xe/xe_pcode.o
  CC [M]  drivers/mux/adg792a.o
  CC [M]  drivers/thunderbolt/eeprom.o
  CC [M]  drivers/platform/x86/msi-wmi-platform.o
  CC [M]  drivers/bcma/host_soc.o
  CC [M]  drivers/mtd/nftlcore.o
  CC [M]  net/netfilter/xt_nfacct.o
  CC [M]  drivers/hwtracing/stm/p_sys-t.o
  CC [M]  drivers/hwmon/gigabyte_waterforce.o
  LD [M]  drivers/rpmsg/qcom_glink.o
  CC [M]  drivers/hwmon/gl518sm.o
  CC [M]  drivers/accel/habanalabs/gaudi2/gaudi2_security.o
  CC [M]  drivers/hwmon/gl520sm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv44.o
  CC [M]  drivers/hid/hid-roccat-koneplus.o
  CC [M]  drivers/md/dm-cache-metadata.o
  CC [M]  drivers/thunderbolt/domain.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.o
  CC [M]  drivers/hwmon/hih6130.o
  CC [M]  drivers/thunderbolt/dma_port.o
  CC [M]  drivers/md/dm-cache-policy.o
  CC [M]  drivers/thunderbolt/icm.o
  CC [M]  drivers/thunderbolt/property.o
  CC [M]  drivers/platform/x86/pcengines-apuv2.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v7_0.o
  CC [M]  drivers/gpu/drm/drm_gem_dma_helper.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.o
  CC [M]  drivers/hwtracing/stm/dummy_stm.o
  CC [M]  drivers/hid/hid-roccat-konepure.o
  CC [M]  drivers/tee/tee_shm.o
  CC [M]  drivers/hid/hid-roccat-kovaplus.o
  LD [M]  drivers/bcma/bcma.o
  CC [M]  drivers/accel/habanalabs/gaudi2/gaudi2_coresight.o
  CC [M]  drivers/gpu/drm/xe/xe_pm.o
  CC [M]  drivers/mux/adgs1408.o
  CC [M]  drivers/md/dm-cache-background-tracker.o
  CC [M]  drivers/gpu/drm/drm_fbdev_dma.o
  CC [M]  drivers/gnss/mtk.o
  CC [M]  drivers/hwmon/hs3001.o
  CC [M]  drivers/counter/counter-core.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_userptr.o
  CC [M]  drivers/vhost/iotlb.o
  CC [M]  drivers/gpu/drm/drm_fb_dma_helper.o
  LD [M]  drivers/target/target_core_mod.o
  CC [M]  drivers/gnss/sirf.o
  LD [M]  drivers/mtd/nand/raw/nand.o
  CC [M]  net/netfilter/xt_osf.o
  CC [M]  drivers/tee/tee_shm_pool.o
  CC [M]  drivers/gpu/drm/xe/xe_preempt_fence.o
  CC [M]  drivers/mtd/nftlmount.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_wait.o
  CC [M]  drivers/thunderbolt/xdomain.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv46.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gemfs.o
  CC [M]  drivers/hwtracing/stm/console.o
  CC [M]  drivers/gpu/drm/i915/i915_active.o
  CC [M]  drivers/accel/habanalabs/gaudi/gaudi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.o
  CC [M]  drivers/mtd/inftlcore.o
  CC [M]  drivers/platform/x86/barco-p50-gpio.o
  CC [M]  drivers/accel/habanalabs/gaudi/gaudi_security.o
  CC [M]  drivers/gpu/drm/i915/i915_cmd_parser.o
  CC [M]  drivers/thunderbolt/lc.o
  CC [M]  drivers/most/core.o
  CC [M]  drivers/mux/gpio.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv47.o
  LD [M]  drivers/mux/mux-core.o
  CC [M]  drivers/hid/hid-roccat-lua.o
  CC [M]  drivers/thunderbolt/tmu.o
  CC [M]  drivers/gpu/drm/drm_suballoc.o
  CC [M]  drivers/accel/habanalabs/gaudi/gaudi_coresight.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv49.o
  CC [M]  drivers/most/configfs.o
  CC [M]  drivers/gpu/drm/xe/xe_pt.o
  CC [M]  drivers/gpu/drm/i915/i915_deps.o
  CC [M]  drivers/hwmon/i5500_temp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv4e.o
  CC [M]  drivers/counter/counter-sysfs.o
  CC [M]  drivers/hwtracing/stm/heartbeat.o
  CC [M]  drivers/accel/habanalabs/goya/goya.o
  CC [M]  drivers/gpu/drm/drm_gem_vram_helper.o
  LD [M]  drivers/mux/mux-adg792a.o
  CC [M]  drivers/gnss/ubx.o
  CC [M]  drivers/accel/habanalabs/goya/goya_security.o
  CC [M]  drivers/most/most_usb.o
  CC [M]  drivers/hwmon/i5k_amb.o
  CC [M]  drivers/counter/counter-chrdev.o
  CC [M]  drivers/counter/i8254.o
  CC [M]  drivers/md/dm-cache-policy-smq.o
  LD [M]  drivers/vhost/vhost_net.o
  LD [M]  drivers/vhost/vhost_scsi.o
  CC [M]  drivers/thunderbolt/usb4.o
  LD [M]  drivers/vhost/vhost_vsock.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.o
  CC [M]  drivers/hwtracing/stm/ftrace.o
  LD [M]  drivers/vhost/vhost_vdpa.o
  LD [M]  drivers/vhost/vhost_iotlb.o
  CC [M]  drivers/platform/x86/samsung-laptop.o
  CC [M]  net/netfilter/xt_owner.o
  CC [M]  drivers/platform/x86/samsung-q10.o
  CC [M]  drivers/counter/104-quad-8.o
  LD [M]  drivers/tee/tee.o
  LD [M]  drivers/mux/mux-adgs1408.o
  CC [M]  drivers/hid/hid-roccat-pyra.o
  LD [M]  drivers/mux/mux-gpio.o
  CC [M]  drivers/thunderbolt/usb4_port.o
  CC [M]  drivers/most/most_cdev.o
  CC [M]  drivers/platform/x86/toshiba_bluetooth.o
  CC [M]  net/netfilter/xt_cgroup.o
  CC [M]  drivers/gpu/drm/i915/i915_gem.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.o
  CC [M]  drivers/platform/x86/toshiba_haps.o
  CC [M]  drivers/mtd/inftlmount.o
  CC [M]  drivers/counter/interrupt-cnt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/g84.o
  CC [M]  drivers/gpu/drm/xe/xe_pt_walk.o
  CC [M]  drivers/peci/core.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.o
  CC [M]  drivers/thunderbolt/nvm.o
  CC [M]  drivers/hid/hid-roccat-ryos.o
  CC [M]  drivers/accel/habanalabs/goya/goya_hwmgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gt215.o
  LD [M]  drivers/hwtracing/stm/stm_core.o
  LD [M]  drivers/hwtracing/stm/stm_p_basic.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/mcp77.o
  CC [M]  drivers/thunderbolt/retimer.o
  LD [M]  drivers/hwtracing/stm/stm_p_sys-t.o
  LD [M]  drivers/hwtracing/stm/stm_console.o
  LD [M]  drivers/hwtracing/stm/stm_heartbeat.o
  LD [M]  drivers/hwtracing/stm/stm_ftrace.o
  CC [M]  drivers/gpu/drm/i915/i915_gem_evict.o
  CC [M]  drivers/platform/x86/inspur_platform_profile.o
  CC [M]  drivers/gnss/usb.o
  CC [M]  drivers/accel/habanalabs/goya/goya_coresight.o
  CC [M]  drivers/hid/hid-roccat-savu.o
  CC [M]  drivers/accel/habanalabs/common/debugfs.o
  CC [M]  drivers/hwmon/ibmaem.o
  CC [M]  drivers/counter/intel-qep.o
  CC [M]  drivers/mtd/rfd_ftl.o
  CC [M]  drivers/gpu/drm/drm_gem_ttm_helper.o
  CC [M]  drivers/most/most_snd.o
  CC [M]  drivers/gpu/drm/xe/xe_pxp.o
  CC [M]  drivers/gpu/drm/xe/xe_pxp_debugfs.o
  CC [M]  drivers/peci/request.o
  CC [M]  drivers/gpu/drm/i915/i915_gem_gtt.o
  CC [M]  drivers/peci/device.o
  CC [M]  drivers/gpu/drm/xe/xe_pxp_submit.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.o
  CC [M]  net/netfilter/xt_physdev.o
  CC [M]  drivers/hid/hid-rmi.o
  CC [M]  drivers/hwmon/ibmpex.o
  CC [M]  drivers/md/dm-ebs-target.o
  CC [M]  drivers/mtd/ssfdc.o
  LD [M]  drivers/gnss/gnss.o
  CC [M]  drivers/gpu/drm/drm_fbdev_ttm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.o
  CC [M]  drivers/thunderbolt/quirks.o
  LD [M]  drivers/gnss/gnss-serial.o
  CC [M]  drivers/mtd/sm_ftl.o
  CC [M]  drivers/gpu/drm/drm_mipi_dbi.o
  CC [M]  drivers/gpu/drm/i915/i915_gem_ww.o
  CC [M]  drivers/hid/hid-saitek.o
  CC [M]  drivers/platform/x86/classmate-laptop.o
  LD [M]  drivers/gnss/gnss-mtk.o
  CC [M]  drivers/gpu/drm/xe/xe_query.o
  LD [M]  drivers/gnss/gnss-sirf.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.o
  LD [M]  drivers/gnss/gnss-ubx.o
  LD [M]  drivers/gnss/gnss-usb.o
  CC [M]  drivers/hid/hid-samsung.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.o
  CC [M]  drivers/platform/x86/lg-laptop.o
  CC [M]  drivers/thunderbolt/clx.o
  CC [M]  drivers/mtd/mtdoops.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/mcp89.o
  CC [M]  net/netfilter/xt_pkttype.o
  CC [M]  drivers/hid/hid-semitek.o
  CC [M]  drivers/gpu/drm/i915/i915_query.o
  LD [M]  drivers/counter/counter.o
  CC [M]  net/netfilter/xt_policy.o
  CC [M]  drivers/hid/hid-sigmamicro.o
  CC [M]  drivers/peci/sysfs.o
  CC [M]  drivers/mtd/mtdpstore.o
  CC [M]  drivers/gpu/drm/i915/i915_request.o
  CC [M]  drivers/mtd/mtdswap.o
  CC [M]  drivers/platform/x86/panasonic-laptop.o
  LD [M]  drivers/most/most_core.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.o
  CC [M]  drivers/md/dm-era-target.o
  CC [M]  drivers/platform/x86/system76_acpi.o
  CC [M]  drivers/hid/hid-steam.o
  CC [M]  drivers/hwmon/ina209.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.o
  CC [M]  drivers/thunderbolt/acpi.o
  CC [M]  drivers/thunderbolt/debugfs.o
  CC [M]  drivers/gpu/drm/i915/i915_scheduler.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.o
  CC [M]  drivers/hwmon/ina2xx.o
  CC [M]  drivers/peci/cpu.o
  CC [M]  drivers/md/dm-clone-target.o
  CC [M]  drivers/gpu/drm/xe/xe_range_fence.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_sr.o
  CC [M]  drivers/gpu/drm/i915/i915_trace_points.o
  CC [M]  drivers/hid/hid-topre.o
  CC [M]  drivers/gpu/drm/i915/i915_ttm_buddy_manager.o
  LD [M]  drivers/peci/peci.o
  LD [M]  drivers/gpu/drm/drm_dma_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_whitelist.o
  CC [M]  net/netfilter/xt_quota.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.o
  CC [M]  drivers/gpu/drm/i915/i915_vma.o
  CC [M]  drivers/hid/hid-xiaomi.o
  CC [M]  drivers/platform/x86/topstar-laptop.o
  CC [M]  drivers/hwmon/ina238.o
  CC [M]  drivers/gpu/drm/i915/i915_vma_resource.o
  CC [M]  drivers/hid/hid-sensor-hub.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.o
  CC [M]  drivers/hid/hid-sensor-custom.o
  CC [M]  drivers/gpu/drm/xe/xe_ring_ops.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.o
  CC [M]  drivers/hwmon/ina3221.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.o
  LD [M]  drivers/gpu/drm/drm_suballoc_helper.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.o
  CC [M]  drivers/gpu/drm/xe/xe_rtp.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc.o
  LD [M]  drivers/gpu/drm/drm_vram_helper.o
  CC [M]  drivers/md/dm-clone-metadata.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.o
  LD [M]  drivers/gpu/drm/drm_ttm_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.o
  CC [M]  drivers/gpu/drm/xe/xe_sa.o
  LD [M]  drivers/accel/habanalabs/habanalabs.o
  CC [M]  drivers/hwmon/intel-m10-bmc-hwmon.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.o
  CC [M]  drivers/md/dm-log-writes.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm200.o
  CC [M]  drivers/platform/x86/firmware_attributes_class.o
  LD [M]  drivers/thunderbolt/thunderbolt.o
  LD [M]  drivers/mtd/mtd.o
  LD [M]  drivers/mtd/nftl.o
  CC [M]  drivers/platform/x86/serial-multi-instantiate.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm20b.o
  CC [M]  drivers/platform/x86/wireless-hotkey.o
  LD [M]  drivers/mtd/inftl.o
  AR      drivers/gpu/drm/built-in.a
  CC [M]  net/netfilter/xt_rateest.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp100.o
  CC [M]  drivers/gpu/drm/xe/xe_sched_job.o
  LD [M]  drivers/peci/peci-cpu.o
  CC [M]  net/netfilter/xt_realm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.o
  CC [M]  drivers/md/dm-integrity.o
  CC [M]  drivers/platform/x86/intel_ips.o
  CC [M]  net/netfilter/xt_recent.o
  CC [M]  drivers/hwmon/it87.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.o
  CC [M]  drivers/hwmon/jc42.o
  CC [M]  drivers/platform/x86/intel_scu_pltdrv.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_capture.o
  CC [M]  net/netfilter/xt_sctp.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.o
  CC [M]  drivers/hwmon/k8temp.o
  CC [M]  drivers/gpu/drm/xe/xe_shrinker.o
  CC [M]  net/netfilter/xt_socket.o
  CC [M]  drivers/platform/x86/intel_scu_ipcutil.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.o
  CC [M]  drivers/gpu/drm/xe/xe_step.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp10b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.o
  CC [M]  net/netfilter/xt_state.o
  CC [M]  net/netfilter/xt_statistic.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.o
  CC [M]  drivers/md/dm-zoned-target.o
  CC [M]  drivers/md/dm-zoned-metadata.o
  CC [M]  net/netfilter/xt_string.o
  CC [M]  drivers/hwmon/k10temp.o
  CC [M]  drivers/platform/x86/silicom-platform.o
  CC [M]  drivers/md/dm-zoned-reclaim.o
  CC [M]  drivers/hwmon/lenovo-ec-sensors.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.o
  CC [M]  drivers/md/dm-writecache.o
  CC [M]  drivers/gpu/drm/xe/xe_survivability_mode.o
  CC [M]  net/netfilter/xt_tcpmss.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.o
  LD [M]  drivers/hid/hid.o
  LD [M]  drivers/hid/hid-logitech.o
  CC [M]  drivers/gpu/drm/xe/xe_sync.o
  CC [M]  net/netfilter/xt_time.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v11_5_0.o
  CC [M]  drivers/gpu/drm/xe/xe_tile.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.o
  CC [M]  drivers/gpu/drm/xe/xe_tile_sysfs.o
  CC [M]  net/netfilter/xt_u32.o
  CC [M]  drivers/hwmon/lineage-pem.o
  CC [M]  drivers/platform/x86/winmate-fm07-keys.o
  CC [M]  drivers/gpu/drm/xe/xe_trace.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_log.o
  CC [M]  drivers/platform/x86/sel3350-platform.o
  CC [M]  drivers/hwmon/lm63.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.o
  CC [M]  drivers/hwmon/lm70.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gh100.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb100.o
  CC [M]  drivers/gpu/drm/xe/xe_trace_bo.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb202.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v12_0.o
  CC [M]  drivers/hwmon/lm73.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.o
  CC [M]  drivers/gpu/drm/xe/xe_trace_guc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/r535.o
  CC [M]  drivers/gpu/drm/xe/xe_trace_lrc.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v12_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v6_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.o
  CC [M]  drivers/hwmon/lm75.o
  CC [M]  drivers/hwmon/lm77.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_huc.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v6_1.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v6_7.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_huc_fw.o
  CC [M]  drivers/hwmon/lm78.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v8_7.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv04.o
  CC [M]  drivers/hwmon/lm80.o
  CC [M]  drivers/hwmon/lm83.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv10.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v8_10.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv1a.o
  CC [M]  drivers/hwmon/lm85.o
  AR      drivers/platform/x86/built-in.a
  AR      drivers/platform/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v12_0.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_uc.o
  CC [M]  drivers/hwmon/lm87.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.o
  LD [M]  drivers/md/raid456.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v8_14.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.o
  CC [M]  drivers/hwmon/lm90.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gsc.o
  CC [M]  drivers/hwmon/lm92.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv20.o
  LD [M]  net/netfilter/nf_conntrack.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.o
  LD [M]  net/netfilter/nf_conntrack_h323.o
  LD [M]  net/netfilter/nf_nat.o
  LD [M]  net/netfilter/nf_tables.o
  LD [M]  drivers/md/dm-bio-prison.o
  LD [M]  net/netfilter/nf_flow_table.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ih.o
  CC [M]  drivers/gpu/drm/i915/i915_hwmon.o
  CC [M]  drivers/hwmon/lm93.o
  AR      net/netfilter/built-in.a
  AR      net/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_ttm_sys_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/iceland_ih.o
  LD [M]  drivers/md/dm-multipath.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/tonga_ih.o
  CC [M]  drivers/hwmon/lm95234.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv40.o
  LD [M]  drivers/md/dm-round-robin.o
  LD [M]  drivers/md/dm-queue-length.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_vram_mgr.o
  LD [M]  drivers/md/dm-service-time.o
  LD [M]  drivers/md/dm-historical-service-time.o
  CC [M]  drivers/gpu/drm/i915/display/hsw_ips.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/cz_ih.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vega10_ih.o
  CC [M]  drivers/hwmon/lm95241.o
  CC [M]  drivers/gpu/drm/xe/xe_tuning.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv41.o
  LD [M]  drivers/md/dm-io-affinity.o
  LD [M]  drivers/md/dm-snapshot.o
  LD [M]  drivers/md/dm-mirror.o
  LD [M]  drivers/md/dm-log-userspace.o
  LD [M]  drivers/md/dm-thin-pool.o
  LD [M]  drivers/md/dm-verity.o
  CC [M]  drivers/gpu/drm/i915/display/i9xx_plane.o
  CC [M]  drivers/gpu/drm/xe/xe_uc.o
  CC [M]  drivers/hwmon/lm95245.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vega20_ih.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/navi10_ih.o
  CC [M]  drivers/gpu/drm/i915/display/i9xx_display_sr.o
  CC [M]  drivers/hwmon/ltc2945.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/ih_v6_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv44.o
  CC [M]  drivers/gpu/drm/i915/display/i9xx_wm.o
  LD [M]  drivers/md/dm-cache.o
  LD [M]  drivers/md/dm-cache-smq.o
  CC [M]  drivers/hwmon/ltc2947-core.o
  CC [M]  drivers/gpu/drm/xe/xe_uc_fw.o
  CC [M]  drivers/gpu/drm/i915/display/intel_alpm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/ih_v6_1.o
  LD [M]  drivers/md/dm-ebs.o
  CC [M]  drivers/hwmon/ltc2947-i2c.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv49.o
  CC [M]  drivers/gpu/drm/xe/xe_vm.o
  CC [M]  drivers/gpu/drm/i915/display/intel_atomic.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv4e.o
  LD [M]  drivers/md/dm-era.o
  LD [M]  drivers/md/dm-clone.o
  CC [M]  drivers/gpu/drm/xe/xe_vram.o
  CC [M]  drivers/hwmon/ltc2947-spi.o
  CC [M]  drivers/gpu/drm/i915/display/intel_atomic_plane.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/ih_v7_0.o
  LD [M]  drivers/md/dm-zoned.o
  AR      drivers/md/built-in.a
  CC [M]  drivers/hwmon/ltc2990.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv50.o
  CC [M]  drivers/gpu/drm/i915/display/intel_audio.o
  CC [M]  drivers/gpu/drm/xe/xe_vram_freq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.o
  CC [M]  drivers/gpu/drm/i915/display/intel_bios.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/rammcp77.o
  CC [M]  drivers/gpu/drm/xe/xe_vsec.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v3_1.o
  CC [M]  drivers/gpu/drm/xe/xe_wa.o
  CC [M]  drivers/gpu/drm/i915/display/intel_bo.o
  CC [M]  drivers/gpu/drm/i915/display/intel_bw.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v10_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.o
  CC [M]  drivers/gpu/drm/xe/xe_wait_user_fence.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v11_0.o
  CC [M]  drivers/hwmon/ltc2991.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.o
  CC [M]  drivers/hwmon/ltc2992.o
  CC [M]  drivers/gpu/drm/i915/display/intel_cdclk.o
  CC [M]  drivers/gpu/drm/xe/xe_wopcm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.o
  CC [M]  drivers/hwmon/ltc4151.o
  CC [M]  drivers/gpu/drm/i915/display/intel_cmtg.o
  CC [M]  drivers/gpu/drm/xe/xe_hmm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.o
  CC [M]  drivers/gpu/drm/i915/display/intel_color.o
  CC [M]  drivers/hwmon/ltc4215.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v11_0_8.o
  CC [M]  drivers/gpu/drm/xe/xe_svm.o
  CC [M]  drivers/gpu/drm/i915/display/intel_combo_phy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v12_0.o
  CC [M]  drivers/gpu/drm/xe/xe_hwmon.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.o
  CC [M]  drivers/gpu/drm/xe/xe_pmu.o
  CC [M]  drivers/gpu/drm/i915/display/intel_connector.o
  CC [M]  drivers/hwmon/ltc4222.o
  CC [M]  drivers/gpu/drm/i915/display/intel_crtc.o
  CC [M]  drivers/hwmon/ltc4245.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v13_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.o
  CC [M]  drivers/gpu/drm/i915/display/intel_crtc_state_dump.o
  CC [M]  drivers/hwmon/ltc4260.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.o
  CC [M]  drivers/gpu/drm/xe/xe_configfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v14_0.o
  CC [M]  drivers/hwmon/ltc4261.o
  CC [M]  drivers/gpu/drm/i915/display/intel_cursor.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display.o
  CC [M]  drivers/hwmon/ltc4282.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sriov_vf.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/dce_v10_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr2.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_relay.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_conversion.o
  CC [M]  drivers/gpu/drm/xe/xe_memirq.o
  CC [M]  drivers/hwmon/max1111.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/dce_v11_0.o
../drivers/gpu/drm/xe/xe_svm.c: In function ‘xe_svm_handle_pagefault’:
../drivers/gpu/drm/xe/xe_svm.c:826:13: error: redefinition of ‘migrate_try_count’
  826 |         int migrate_try_count = ctx.devmem_only ? 3 : 1;
      |             ^~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_svm.c:824:13: note: previous definition of ‘migrate_try_count’ with type ‘int’
  824 |         int migrate_try_count = ctx.devmem_only ? 3 : 1;
      |             ^~~~~~~~~~~~~~~~~
make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/xe/xe_svm.o] Error 1
make[7]: *** Waiting for unfinished jobs....
  CC [M]  drivers/gpu/drm/i915/display/intel_display_driver.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr3.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_irq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_params.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr3.o
  CC [M]  drivers/hwmon/max127.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_power.o
  CC [M]  drivers/hwmon/max16065.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_power_map.o
  CC [M]  drivers/hwmon/max1619.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_power_well.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr5.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v8_0.o
  CC [M]  drivers/hwmon/max1668.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fuse/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_reset.o
  CC [M]  drivers/hwmon/max197.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_rpm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v9_4.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fuse/nv50.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_rps.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fuse/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fuse/gm107.o
  CC [M]  drivers/hwmon/max31722.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_snapshot.o
  CC [M]  drivers/hwmon/max31730.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/nv10.o
  CC [M]  drivers/hwmon/max31760.o
  CC [M]  drivers/hwmon/max6620.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/g94.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_wa.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dmc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/imu_v11_0.o
  CC [M]  drivers/hwmon/max6621.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gf119.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dmc_wl.o
  CC [M]  drivers/hwmon/max6639.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dpio_phy.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gk104.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dpll.o
  CC [M]  drivers/hwmon/max6650.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dpll_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/ga102.o
  CC [M]  drivers/hwmon/max6697.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dpt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.o
  CC [M]  drivers/hwmon/max31790.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dpt_common.o
  CC [M]  drivers/gpu/drm/i915/display/intel_drrs.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dsb.o
make[6]: *** [../scripts/Makefile.build:554: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
  CC [M]  drivers/gpu/drm/i915/display/intel_dsb_buffer.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v12_0.o
  CC [M]  drivers/hwmon/max31827.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fsp/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/imu_v12_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fb.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fb_bo.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gh100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.o
  CC [M]  drivers/hwmon/mc13783-adc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gb100.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fb_pin.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gb202.o
  CC [M]  drivers/hwmon/mc34vr500.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fbc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fdi.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fifo_underrun.o
  CC [M]  drivers/hwmon/mcp3021.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v4_4.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.o
  CC [M]  drivers/gpu/drm/i915/display/intel_frontbuffer.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.o
  CC [M]  drivers/hwmon/tc654.o
  CC [M]  drivers/hwmon/tps23861.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_global_state.o
  CC [M]  drivers/hwmon/mlxreg-fan.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hdcp.o
  CC [M]  drivers/hwmon/menf21bmc_hwmon.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hdcp_gsc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v7_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hotplug.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.o
  CC [M]  drivers/hwmon/mr75203.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hotplug_irq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mes_v11_0.o
  CC [M]  drivers/hwmon/nct6683.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mes_v12_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hti.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.o
  CC [M]  drivers/gpu/drm/i915/display/intel_link_bw.o
  CC [M]  drivers/hwmon/nct6775-core.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mes_userqueue.o
  CC [M]  drivers/gpu/drm/i915/display/intel_load_detect.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.o
  CC [M]  drivers/hwmon/nct6775-platform.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.o
  CC [M]  drivers/gpu/drm/i915/display/intel_lpe_audio.o
  CC [M]  drivers/hwmon/nct6775-i2c.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/uvd_v5_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.o
  CC [M]  drivers/gpu/drm/i915/display/intel_modeset_lock.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.o
  CC [M]  drivers/gpu/drm/i915/display/intel_modeset_setup.o
  CC [M]  drivers/gpu/drm/i915/display/intel_modeset_verify.o
  CC [M]  drivers/hwmon/nct7802.o
  CC [M]  drivers/gpu/drm/i915/display/intel_overlay.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/client.o
  CC [M]  drivers/hwmon/nct7904.o
  CC [M]  drivers/gpu/drm/i915/display/intel_pch.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.o
  CC [M]  drivers/hwmon/npcm750-pwm-fan.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vce_v3_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.o
  CC [M]  drivers/hwmon/nzxt-kraken2.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vce_v4_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/nvdec.o
  CC [M]  drivers/gpu/drm/i915/display/intel_pch_display.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/nvenc.o
  CC [M]  drivers/gpu/drm/i915/display/intel_pch_refclk.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.o
  CC [M]  drivers/gpu/drm/i915/display/intel_plane_initial.o
  CC [M]  drivers/hwmon/nzxt-kraken3.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_sw_ring.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.o
  CC [M]  drivers/hwmon/nzxt-smart2.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v1_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_pmdemand.o
  CC [M]  drivers/hwmon/pc87360.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v2_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.o
  CC [M]  drivers/hwmon/pc87427.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v2_5.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.o
  CC [M]  drivers/gpu/drm/i915/display/intel_psr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v3_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_quirks.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gh100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v4_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.o
  CC [M]  drivers/hwmon/pcf8591.o
  CC [M]  drivers/gpu/drm/i915/display/intel_sbi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb10x.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb20x.o
  CC [M]  drivers/hwmon/powerz.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.o
  CC [M]  drivers/gpu/drm/i915/display/intel_sprite.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.o
  CC [M]  drivers/gpu/drm/i915/display/intel_sprite_uapi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.o
  CC [M]  drivers/gpu/drm/i915/display/intel_tc.o
  CC [M]  drivers/gpu/drm/i915/display/intel_vblank.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.o
  CC [M]  drivers/gpu/drm/i915/display/intel_vga.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.o
  CC [M]  drivers/hwmon/powr1220.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.o
  CC [M]  drivers/gpu/drm/i915/display/intel_wm.o
  CC [M]  drivers/hwmon/pt5161l.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.o
  CC [M]  drivers/hwmon/pwm-fan.o
  CC [M]  drivers/hwmon/sbtsi_temp.o
  CC [M]  drivers/gpu/drm/i915/display/skl_scaler.o
  CC [M]  drivers/gpu/drm/i915/display/skl_universal_plane.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.o
  CC [M]  drivers/gpu/drm/i915/display/skl_watermark.o
  CC [M]  drivers/hwmon/sch56xx-common.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.o
  CC [M]  drivers/hwmon/sch5627.o
  CC [M]  drivers/gpu/drm/i915/display/vlv_sideband.o
  CC [M]  drivers/hwmon/sch5636.o
  CC [M]  drivers/gpu/drm/i915/display/intel_acpi.o
  CC [M]  drivers/hwmon/sht15.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.o
  CC [M]  drivers/hwmon/sht21.o
  CC [M]  drivers/hwmon/sht3x.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.o
  CC [M]  drivers/hwmon/sht4x.o
  CC [M]  drivers/gpu/drm/i915/display/intel_opregion.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fbdev.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.o
  CC [M]  drivers/hwmon/shtc1.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fbdev_fb.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvjpg.o
  CC [M]  drivers/hwmon/sis5595.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.o
  CC [M]  drivers/hwmon/smpro-hwmon.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_debugfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vpe_v6_1.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ofa.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_debugfs_params.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.o
  CC [M]  drivers/hwmon/smsc47b397.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.o
  CC [M]  drivers/gpu/drm/i915/display/intel_pipe_crc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/client.o
  CC [M]  drivers/gpu/drm/i915/display/dvo_ch7017.o
  CC [M]  drivers/hwmon/smsc47m1.o
  CC [M]  drivers/hwmon/smsc47m192.o
  CC [M]  drivers/hwmon/stts751.o
  CC [M]  drivers/hwmon/surface_fan.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.o
  CC [M]  drivers/hwmon/sy7636a-hwmon.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/athub_v1_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.o
  CC [M]  drivers/gpu/drm/i915/display/dvo_ch7xxx.o
  CC [M]  drivers/hwmon/amc6821.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/athub_v2_0.o
  CC [M]  drivers/gpu/drm/i915/display/dvo_ivch.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/athub_v2_1.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/disp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/athub_v3_0.o
  CC [M]  drivers/hwmon/tc74.o
  CC [M]  drivers/gpu/drm/i915/display/dvo_ns2501.o
  CC [M]  drivers/gpu/drm/i915/display/dvo_sil164.o
  CC [M]  drivers/hwmon/thmc50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/athub_v4_1_0.o
  CC [M]  drivers/hwmon/tmp102.o
  CC [M]  drivers/gpu/drm/i915/display/dvo_tfp410.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fifo.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v9_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.o
  CC [M]  drivers/gpu/drm/i915/display/g4x_dp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/ofa.o
  CC [M]  drivers/hwmon/tmp103.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v11_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.o
  CC [M]  drivers/gpu/drm/i915/display/g4x_hdmi.o
  CC [M]  drivers/hwmon/tmp108.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv04.o
  CC [M]  drivers/gpu/drm/i915/display/icl_dsi.o
  CC [M]  drivers/gpu/drm/i915/display/intel_backlight.o
  CC [M]  drivers/hwmon/tmp401.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv4e.o
  CC [M]  drivers/gpu/drm/i915/display/intel_crt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v11_0_6.o
  CC [M]  drivers/hwmon/tmp421.o
  CC [M]  drivers/gpu/drm/i915/display/intel_cx0_phy.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v13_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v13_0_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/g94.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v13_0_6.o
  CC [M]  drivers/gpu/drm/i915/display/intel_ddi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gf117.o
  CC [M]  drivers/hwmon/tmp464.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v14_0_2.o
  CC [M]  drivers/gpu/drm/i915/display/intel_ddi_buf_trans.o
  CC [M]  drivers/hwmon/tmp513.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gf119.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_device.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.o
  CC [M]  drivers/hwmon/via-cputemp.o
  CC [M]  drivers/hwmon/via686a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mca_v3_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_trace.o
  CC [M]  drivers/hwmon/vt1211.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.o
  CC [M]  drivers/hwmon/vt8231.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dkl_phy.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dp.o
  CC [M]  drivers/hwmon/w83627ehf.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_module.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gk110.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device.o
  CC [M]  drivers/hwmon/w83l785ts.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dp_aux.o
  CC [M]  drivers/hwmon/w83l786ng.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/pad.o
  CC [M]  drivers/hwmon/wm831x-hwmon.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_doorbell.o
  CC [M]  drivers/hwmon/wm8350-hwmon.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padnv04.o
  CC [M]  drivers/hwmon/xgene-hwmon.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padnv4e.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_flat_memory.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padnv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dp_hdcp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dp_link_training.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_cik.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_vi.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dp_mst.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v9.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dp_test.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v10.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dsi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v11.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dsi_vbt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v12.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dvo.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_kernel_queue.o
  CC [M]  drivers/gpu/drm/i915/display/intel_encoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager.o
  CC [M]  drivers/gpu/drm/i915/display/intel_gmbus.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv4e.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hdmi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv50.o
  CC [M]  drivers/gpu/drm/i915/display/intel_lspcon.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager_vi.o
  CC [M]  drivers/gpu/drm/i915/display/intel_lvds.o
  CC [M]  drivers/gpu/drm/i915/display/intel_panel.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager_v9.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process_queue_manager.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bit.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxch.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_cik.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_vi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_v9.o
  CC [M]  drivers/gpu/drm/i915/display/intel_pfit.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_v10.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.o
  CC [M]  drivers/gpu/drm/i915/display/intel_pps.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_v11.o
  CC [M]  drivers/gpu/drm/i915/display/intel_qp_tables.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.o
  CC [M]  drivers/gpu/drm/i915/display/intel_sdvo.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_v12.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_interrupt.o
  LD [M]  drivers/hwmon/nct6775.o
  AR      drivers/hwmon/built-in.a
  CC [M]  drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_events.o
  CC [M]  drivers/gpu/drm/i915/display/intel_snps_phy.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.o
  CC [M]  drivers/gpu/drm/i915/display/intel_tv.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/cik_event_interrupt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v10.o
  CC [M]  drivers/gpu/drm/i915/display/intel_vdsc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.o
  CC [M]  drivers/gpu/drm/i915/display/intel_vrr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v11.o
  CC [M]  drivers/gpu/drm/i915/display/vlv_dsi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_smi_events.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debug.o
  CC [M]  drivers/gpu/drm/i915/display/vlv_dsi_pll.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debugfs.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dp_tunnel.o
  CC [M]  drivers/gpu/drm/i915/i915_perf.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_huc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_tee.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv40.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_cmd.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_irq.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_pm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gh100.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_session.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.o
  CC [M]  drivers/gpu/drm/i915/i915_gpu_error.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/base.o
  CC [M]  drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.o
  CC [M]  drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gk104.o
  CC [M]  drivers/gpu/drm/i915/selftests/i915_random.o
  CC [M]  drivers/gpu/drm/i915/selftests/i915_selftest.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gm107.o
  CC [M]  drivers/gpu/drm/i915/selftests/igt_atomic.o
  CC [M]  drivers/gpu/drm/i915/selftests/igt_flush_test.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.o
  CC [M]  drivers/gpu/drm/i915/selftests/igt_live_test.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp100.o
  CC [M]  drivers/gpu/drm/i915/selftests/igt_mmap.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp102.o
  CC [M]  drivers/gpu/drm/i915/selftests/igt_reset.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.o
  CC [M]  drivers/gpu/drm/i915/selftests/igt_spinner.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.o
  CC [M]  drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.o
  CC [M]  drivers/gpu/drm/i915/selftests/librapl.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.o
  CC [M]  drivers/gpu/drm/i915/i915_vgpu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.o
  CC [M]  drivers/gpu/drm/i915/intel_gvt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/ga102.o
  CC [M]  drivers/gpu/drm/i915/intel_gvt_mmio_table.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_job.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_acp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv04.o
  CC [M]  drivers/gpu/drm/i915/gvt/aperture_gm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../acp/acp_hw.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ioc32.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv11.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv17.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv44.o
  CC [M]  drivers/gpu/drm/i915/gvt/cfg_space.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.o
  CC [M]  drivers/gpu/drm/i915/gvt/cmd_parser.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/g84.o
  CC [M]  drivers/gpu/drm/i915/gvt/debugfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/g98.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gt215.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/arcturus_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/navi10_ppt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gk20a.o
  CC [M]  drivers/gpu/drm/i915/gvt/display.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp10b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/cyan_skillfish_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu12/renoir_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu12/smu_v12_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0.o
  CC [M]  drivers/gpu/drm/i915/gvt/dmabuf.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/aldebaran_ppt.o
  CC [M]  drivers/gpu/drm/i915/gvt/edid.o
  CC [M]  drivers/gpu/drm/i915/gvt/execlist.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/yellow_carp_ppt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv04.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv41.o
  CC [M]  drivers/gpu/drm/i915/gvt/fb_decoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.o
  CC [M]  drivers/gpu/drm/i915/gvt/firmware.o
  CC [M]  drivers/gpu/drm/i915/gvt/gtt.o
  CC [M]  drivers/gpu/drm/i915/gvt/handlers.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv44.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_4_ppt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv50.o
  CC [M]  drivers/gpu/drm/i915/gvt/interrupt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/g84.o
  CC [M]  drivers/gpu/drm/i915/gvt/kvmgt.o
  CC [M]  drivers/gpu/drm/i915/gvt/mmio.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mcp77.o
  CC [M]  drivers/gpu/drm/i915/gvt/mmio_context.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_5_ppt.o
  CC [M]  drivers/gpu/drm/i915/gvt/opregion.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.o
  CC [M]  drivers/gpu/drm/i915/gvt/page_track.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_12_ppt.o
  CC [M]  drivers/gpu/drm/i915/gvt/sched_policy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_0_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_2_ppt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk20a.o
  CC [M]  drivers/gpu/drm/i915/gvt/scheduler.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smumgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm20b.o
  CC [M]  drivers/gpu/drm/i915/gvt/trace_points.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gp100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu8_smumgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/tonga_smumgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gp10b.o
  CC [M]  drivers/gpu/drm/i915/gvt/vgpu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gv100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/fiji_smumgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dkl_phy_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/polaris10_smumgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_crtc_state_dump.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gh100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mem.o
  HDRTEST drivers/gpu/drm/i915/display/hsw_ips.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.o
  HDRTEST drivers/gpu/drm/i915/display/g4x_hdmi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv04.o
  HDRTEST drivers/gpu/drm/i915/display/intel_hdcp_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vega10_smumgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_overlay.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu10_smumgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memgf100.o
  HDRTEST drivers/gpu/drm/i915/display/skl_watermark_regs.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dmc.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/ci_smumgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_cmtg.h
  HDRTEST drivers/gpu/drm/i915/display/intel_vga.h
  HDRTEST drivers/gpu/drm/i915/display/intel_audio.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vega12_smumgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv04.o
  HDRTEST drivers/gpu/drm/i915/display/intel_lvds.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vegam_smumgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv41.o
  HDRTEST drivers/gpu/drm/i915/display/intel_modeset_setup.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu9_smumgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv44.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vega20_smumgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/hwmgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmmcp77.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/processpptables.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/hardwaremanager.o
  HDRTEST drivers/gpu/drm/i915/display/intel_cdclk.h
  HDRTEST drivers/gpu/drm/i915/display/intel_display_limits.h
  HDRTEST drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk104.o
  HDRTEST drivers/gpu/drm/i915/display/intel_hotplug.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dkl_phy.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu8_hwmgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/pppcielanes.o
  HDRTEST drivers/gpu/drm/i915/display/i9xx_wm_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/process_pptables_v1_0.o
  HDRTEST drivers/gpu/drm/i915/display/intel_atomic.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.o
  HDRTEST drivers/gpu/drm/i915/display/i9xx_plane_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgv100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.o
  HDRTEST drivers/gpu/drm/i915/display/intel_color_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgh100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_driver.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomfwctrl.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.o
  HDRTEST drivers/gpu/drm/i915/display/intel_encoder.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_powertune.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dpll.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mxm/mxms.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mxm/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_thermal.o
  HDRTEST drivers/gpu/drm/i915/display/vlv_dsi_pll_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/agp.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dp_mst.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_clockpowergating.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.o
  HDRTEST drivers/gpu/drm/i915/display/intel_fdi_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.o
  HDRTEST drivers/gpu/drm/i915/display/intel_sprite_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.o
  HDRTEST drivers/gpu/drm/i915/display/g4x_dp.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_powertune.o
  HDRTEST drivers/gpu/drm/i915/display/intel_tc.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_thermal.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv04.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_params.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu10_hwmgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv40.o
  HDRTEST drivers/gpu/drm/i915/display/intel_frontbuffer.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/pp_psm.o
  HDRTEST drivers/gpu/drm/i915/display/intel_pch.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_processpptables.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv46.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv4c.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dsi_vbt.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_hwmgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/g84.o
  HDRTEST drivers/gpu/drm/i915/display/intel_psr.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_thermal.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/g92.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/g94.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/pp_overdriver.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu_helper.o
  HDRTEST drivers/gpu/drm/i915/display/intel_crt.h
  HDRTEST drivers/gpu/drm/i915/display/intel_opregion.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_processpptables.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_hwmgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf100.o
  HDRTEST drivers/gpu/drm/i915/display/intel_snps_phy_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf106.o
  HDRTEST drivers/gpu/drm/i915/display/i9xx_wm.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_powertune.o
  HDRTEST drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gp100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_thermal.o
  HDRTEST drivers/gpu/drm/i915/display/intel_global_state.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gh100.o
  HDRTEST drivers/gpu/drm/i915/display/intel_tdf.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/common_baco.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/memx.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gt215.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_baco.o
  HDRTEST drivers/gpu/drm/i915/display/intel_lpe_audio.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_baco.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_baco.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gf119.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu9_baco.o
  HDRTEST drivers/gpu/drm/i915/display/intel_drrs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk110.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/tonga_baco.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/polaris_baco.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk208.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/fiji_baco.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dsb_buffer.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk20a.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm107.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_rps.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ci_baco.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_baco.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.o
  HDRTEST drivers/gpu/drm/i915/display/intel_fbdev.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/amd_powerplay.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/legacy_dpm.o
  HDRTEST drivers/gpu/drm/i915/display/intel_pps_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.o
  HDRTEST drivers/gpu/drm/i915/display/intel_hdmi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_smc.o
  HDRTEST drivers/gpu/drm/i915/display/intel_fdi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gf117.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.o
  HDRTEST drivers/gpu/drm/i915/display/intel_fb.h
  HDRTEST drivers/gpu/drm/i915/display/intel_qp_tables.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_smc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gk104.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dsb_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gk20a.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gm200.o
  HDRTEST drivers/gpu/drm/i915/display/intel_hdcp_shim.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gp10b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm_internal.o
  HDRTEST drivers/gpu/drm/i915/display/intel_vdsc.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.o
  HDRTEST drivers/gpu/drm/i915/display/intel_snps_phy.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fannil.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_core.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fantog.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crtc.o
  HDRTEST drivers/gpu/drm/i915/display/vlv_dsi_pll.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/ic.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_services.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/temp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv40.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_pp_smu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_psr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dvo_dev.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_replay.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/g84.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_quirks.o
  HDRTEST drivers/gpu/drm/i915/display/intel_hdcp.h
  HDRTEST drivers/gpu/drm/i915/display/intel_sdvo_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gt215.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_wb.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf100.o
  HDRTEST drivers/gpu/drm/i915/display/intel_pfit_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.o
  HDRTEST drivers/gpu/drm/i915/display/intel_pch_refclk.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_hdcp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.o
  HDRTEST drivers/gpu/drm/i915/display/intel_modeset_lock.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gm107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dc_spl_translate.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gm200.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_trace.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/conversion.o
  HDRTEST drivers/gpu/drm/i915/display/vlv_sideband.h
  HDRTEST drivers/gpu/drm/i915/display/intel_display_power.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/fixpt31_32.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/nv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/vector.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dce_calcs.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dp_aux_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/custom_float.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/nv40.o
  HDRTEST drivers/gpu/drm/i915/display/i9xx_plane.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/nv41.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dp_aux_backlight.h
  HDRTEST drivers/gpu/drm/i915/display/intel_display_conversion.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/gk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/bw_fixed.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/top/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser_interface.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dpll_mgr.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table_helper.o
  HDRTEST drivers/gpu/drm/i915/display/vlv_dsi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser_common.o
  HDRTEST drivers/gpu/drm/i915/display/intel_plane_initial.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_device.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/gv100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/tu102.o
  HDRTEST drivers/gpu/drm/i915/display/intel_fifo_underrun.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/ga100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table_helper2.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.o
  HDRTEST drivers/gpu/drm/i915/display/intel_cursor.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce60/command_table_helper_dce60.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.o
  HDRTEST drivers/gpu/drm/i915/display/vlv_dsi_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce80/command_table_helper_dce80.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dpt_common.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gpio.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce110/command_table_helper_dce110.o
  HDRTEST drivers/gpu/drm/i915/display/intel_vga_regs.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dp_test.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce112/command_table_helper_dce112.o
  HDRTEST drivers/gpu/drm/i915/display/intel_cx0_phy.h
  HDRTEST drivers/gpu/drm/i915/display/skl_scaler.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/nv40.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce112/command_table_helper2_dce112.o
  HDRTEST drivers/gpu/drm/i915/display/intel_fb_bo.h
  HDRTEST drivers/gpu/drm/i915/display/intel_hti.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gf117.o
  HDRTEST drivers/gpu/drm/i915/display/icl_dsi_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.o
  HDRTEST drivers/gpu/drm/i915/display/intel_atomic_plane.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn10/dcn10_fpu.o
  HDRTEST drivers/gpu/drm/i915/display/skl_watermark.h
  HDRTEST drivers/gpu/drm/i915/display/intel_fbc.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/dcn20_fpu.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_reg_defs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gm20b.o
  HDRTEST drivers/gpu/drm/i915/display/intel_acpi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_vba.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/falcon.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/xtensa.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.o
  HDRTEST drivers/gpu/drm/i915/display/intel_connector.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/bsp/g84.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dpt.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gk104.o
  HDRTEST drivers/gpu/drm/i915/display/intel_quirks.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gm107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/dcn30_fpu.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dp_link_training.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gp100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gp102.o
  HDRTEST drivers/gpu/drm/i915/display/intel_color.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.o
  HDRTEST drivers/gpu/drm/i915/display/intel_crtc.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gv100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dp_tunnel.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.o
  HDRTEST drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_debugfs.h
  HDRTEST drivers/gpu/drm/i915/display/intel_modeset_verify.h
  HDRTEST drivers/gpu/drm/i915/display/intel_display_power_well.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.o
  HDRTEST drivers/gpu/drm/i915/display/bxt_dpio_phy_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gb202.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.o
  HDRTEST drivers/gpu/drm/i915/display/intel_psr_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/cipher/g84.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/acpi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_32.o
  HDRTEST drivers/gpu/drm/i915/display/intel_wm.h
  HDRTEST drivers/gpu/drm/i915/display/intel_pipe_crc.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/dcn31_fpu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn321/dcn321_fpu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn301/dcn301_fpu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn302/dcn302_fpu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.o
  HDRTEST drivers/gpu/drm/i915/display/intel_audio_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/pci.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn303/dcn303_fpu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/dcn314_fpu.o
  HDRTEST drivers/gpu/drm/i915/display/intel_panel.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/user.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn35/dcn35_fpu.o
  HDRTEST drivers/gpu/drm/i915/display/intel_bo.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn351/dcn351_fpu.o
  HDRTEST drivers/gpu/drm/i915/display/intel_cmtg_regs.h
  HDRTEST drivers/gpu/drm/i915/display/intel_vrr_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn401/dcn401_fpu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.o
  HDRTEST drivers/gpu/drm/i915/display/intel_sprite.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/head.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.o
  HDRTEST drivers/gpu/drm/i915/display/intel_wm_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calcs.o
  HDRTEST drivers/gpu/drm/i915/display/intel_tv.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_math.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/vga.o
  HDRTEST drivers/gpu/drm/i915/display/intel_fbdev_fb.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/nv04.o
  HDRTEST drivers/gpu/drm/i915/display/intel_pipe_crc_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.o
  HDRTEST drivers/gpu/drm/i915/display/intel_hti_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce60/dce60_clk_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce100/dce_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_vrr.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/g84.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.o
  HDRTEST drivers/gpu/drm/i915/display/intel_load_detect.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce110/dce110_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gt200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce112/dce112_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_alpm.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce120/dce120_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/display/skl_universal_plane.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn10/rv1_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_mg_phy_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp89.o
  HDRTEST drivers/gpu/drm/i915/display/intel_fbc_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn10/rv2_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.o
  HDRTEST drivers/gpu/drm/i915/display/intel_bw.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gk110.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn20/dcn20_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_irq.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn201/dcn201_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_de.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gm107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21/rn_clk_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.o
  HDRTEST drivers/gpu/drm/i915/display/intel_lvds_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_gmbus_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gp100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gp102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_snapshot.h
  HDRTEST drivers/gpu/drm/i915/display/intel_crt_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/dcn301_smu.o
  HDRTEST drivers/gpu/drm/i915/display/intel_fixed.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn31/dcn31_smu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dvo.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.o
  HDRTEST drivers/gpu/drm/i915/display/intel_sdvo.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dp_aux.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn31/dcn31_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn314/dcn314_smu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn314/dcn314_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_vdsc_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn315/dcn315_smu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn315/dcn315_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_combo_phy.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/nv04.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/nv50.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dvo_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn316/dcn316_smu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn316/dcn316_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_gmbus.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/gf100.o
  HDRTEST drivers/gpu/drm/i915/display/intel_pfit.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/gf119.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/gv100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/user.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dsi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_smu.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dmc_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv04.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn351_clk_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_ddi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn401/dcn401_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usergf100.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_rpm.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn401/dcn401_clk_mgr_smu_msg.o
  HDRTEST drivers/gpu/drm/i915/display/intel_hotplug_irq.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usergf119.o
  HDRTEST drivers/gpu/drm/i915/display/intel_tv_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_audio.o
  HDRTEST drivers/gpu/drm/i915/display/vlv_dpio_phy_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usergv100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_stream_encoder.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_link_encoder.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/cgrp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/chid.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/runq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_clock_source.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv10.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv17.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dsb.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv40.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_scl_filters.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_transform.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv50.o
  HDRTEST drivers/gpu/drm/i915/display/intel_bios.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/g84.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/g98.o
  HDRTEST drivers/gpu/drm/i915/display/intel_pch_display.h
  HDRTEST drivers/gpu/drm/i915/display/intel_cursor_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_backlight.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_opp.o
  HDRTEST drivers/gpu/drm/i915/display/intel_vblank.h
  HDRTEST drivers/gpu/drm/i915/display/intel_sbi_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_dmcu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dp.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_abm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk110.o
  HDRTEST drivers/gpu/drm/i915/display/intel_pmdemand.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_ipp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk208.o
  HDRTEST drivers/gpu/drm/i915/display/intel_backlight_regs.h
  HDRTEST drivers/gpu/drm/i915/display/intel_combo_phy_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_reset.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c.o
  HDRTEST drivers/gpu/drm/i915/display/intel_sbi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gm107.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gm200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gp100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_power_map.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.o
  HDRTEST drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_wa.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gb202.o
  HDRTEST drivers/gpu/drm/i915/display/icl_dsi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_panel_cntl.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.o
  HDRTEST drivers/gpu/drm/i915/display/intel_lspcon.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_hw_lock_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_outbox.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dmc_wl.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dpio_phy.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_replay.o
  HDRTEST drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dp_hdcp.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv15.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_factory.o
  HDRTEST drivers/gpu/drm/i915/display/intel_fb_pin.h
  HDRTEST drivers/gpu/drm/i915/display/i9xx_display_sr.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_gpio.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv17.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_debugfs_params.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.o
  HDRTEST drivers/gpu/drm/i915/display/intel_link_bw.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv25.o
  HDRTEST drivers/gpu/drm/i915/display/intel_pps.h
  HDRTEST drivers/gpu/drm/i915/display/intel_sprite_uapi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_hpd.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_ttm.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_ddc.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_region.h
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_context_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv2a.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_lmem.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv30.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_generic.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv34.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_translate.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv35.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv44.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce60/hw_translate_dce60.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_mman.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce60/hw_factory_dce60.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/g84.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_object_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce80/hw_translate_dce80.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gt200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/mcp79.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gt215.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce80/hw_factory_dce80.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_context.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce110/hw_translate_dce110.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/mcp89.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf104.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_clflush.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce110/hw_factory_dce110.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce120/hw_translate_dce120.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_tiling.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf110.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce120/hw_factory_dce120.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_stolen.h
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn10/hw_translate_dcn10.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf117.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_create.h
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf119.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn10/hw_factory_dcn10.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_ioctls.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn20/hw_translate_dcn20.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gk104.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_domain.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gk110.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_internal.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gk110b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn20/hw_factory_dcn20.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gk208.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_dmabuf.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gm107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn21/hw_translate_dcn21.o
  HDRTEST drivers/gpu/drm/i915/gem/selftests/mock_context.h
  HDRTEST drivers/gpu/drm/i915/gem/selftests/huge_gem_object.h
  HDRTEST drivers/gpu/drm/i915/gem/selftests/mock_gem_object.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn21/hw_factory_dcn21.o
  HDRTEST drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gm20b.o
  HDRTEST drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn30/hw_translate_dcn30.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn30/hw_factory_dcn30.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp102.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_pm.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn315/hw_translate_dcn315.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_shrinker.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn315/hw_factory_dcn315.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn32/hw_translate_dcn32.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp107.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gemfs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn32/hw_factory_dcn32.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp108.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn401/hw_translate_dcn401.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_object.h
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn401/hw_factory_dcn401.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_timeline_types.h
  HDRTEST drivers/gpu/drm/i915/gt/selftest_engine.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce60/dce60_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gv100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce80/dce80_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_breadcrumbs.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv40.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce/dce_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_context_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce100/dce100_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf104.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_execlists_submission.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_pm.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf108.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf110.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce112/dce112_hwseq.o
  HDRTEST drivers/gpu/drm/i915/gt/selftest_rc6.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf117.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_llc_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce120/dce120_hwseq.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_region_lmem.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf119.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_init.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_requests.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn20/dcn20_hwseq.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_ggtt_gmch.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn20/dcn20_init.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_print.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110b.o
  HDRTEST drivers/gpu/drm/i915/gt/gen8_ppgtt.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk208.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn201/dcn201_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk20a.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_mcr.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_timeline.h
  HDRTEST drivers/gpu/drm/i915/gt/gen6_engine_cs.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn201/dcn201_init.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_workarounds_types.h
  HDRTEST drivers/gpu/drm/i915/gt/selftest_rps.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn21/dcn21_hwseq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn21/dcn21_init.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_sa_media.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn30/dcn30_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm20b.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn30/dcn30_init.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_clock_utils.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_rps_types.h
  HDRTEST drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn301/dcn301_hwseq.o
  HDRTEST drivers/gpu/drm/i915/gt/sysfs_engines.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn301/dcn301_init.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn302/dcn302_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn302/dcn302_init.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn303/dcn303_hwseq.o
  HDRTEST drivers/gpu/drm/i915/gt/gen7_renderclear.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_context.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn303/dcn303_init.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_wopcm.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_mocs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgv100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn31/dcn31_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxtu102.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_engine_pm.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_sysfs.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_rc6.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxga102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn31/dcn31_init.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_defines.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn314/dcn314_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn314/dcn314_init.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_ring_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn32/dcn32_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv40.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn32/dcn32_init.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_workarounds.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_engine_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv50.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_pm_irq.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn35/dcn35_hwseq.o
  HDRTEST drivers/gpu/drm/i915/gt/shmem_utils.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn35/dcn35_init.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_engine.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn351/dcn351_hwseq.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_reset_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/g84.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn351/dcn351_init.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mspdec/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_hwseq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_init.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mspdec/g98.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_reset.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mspdec/gt215.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/irq_service.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce60/irq_service_dce60.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce80/irq_service_dce80.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce110/irq_service_dce110.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce120/irq_service_dce120.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mspdec/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn10/irq_service_dcn10.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_uc.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn20/irq_service_dcn20.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mspdec/gk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msppp/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msppp/g98.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn30/irq_service_dcn30.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msppp/gt215.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn302/irq_service_dcn302.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msppp/gf100.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_fw.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn303/irq_service_dcn303.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn31/irq_service_dcn31.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msvld/base.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msvld/g98.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msvld/gt215.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn314/irq_service_dcn314.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msvld/mcp89.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msvld/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn315/irq_service_dcn315.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msvld/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn32/irq_service_dcn32.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn35/irq_service_dcn35.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn351/irq_service_dcn351.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvenc/gm107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn36/irq_service_dcn36.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvenc/tu102.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn401/irq_service_dcn401.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvdec/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvdec/gm107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dpms.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_factory.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvdec/tu102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga102.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
  HDRTEST drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sec/g98.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sec2/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sec2/gp102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sec2/gp108.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_cts.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/hwss/link_hwss_dio.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_huc.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sec2/tu102.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/hwss/link_hwss_dpia.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sec2/ga102.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sec2/r535.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sw/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/hwss/link_hwss_hpo_dp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sw/nv04.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sw/nv10.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/hwss/link_hwss_dio_fixed_vs_pe_retimer.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_hpd.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_ddc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sw/nvsw.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dpcd.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/vp/g84.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_dpia.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.h
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_acpi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training_8b_10b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training_128b_132b.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_debugfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training_dpia.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
  CC [M]  drivers/gpu/drm/nouveau/nouveau_drm.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_hwmon.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training_auxless.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
  CC [M]  drivers/gpu/drm/nouveau/nouveau_ioc32.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training_fixed_vs_pe_retimer.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_led.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_phy.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
  CC [M]  drivers/gpu/drm/nouveau/nouveau_nvif.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_vga.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_edp_panel_control.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
  CC [M]  drivers/gpu/drm/nouveau/nouveau_bo.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_irq_handler.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_dpia_bw.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_bo0039.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/virtual/virtual_link_encoder.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.h
  CC [M]  drivers/gpu/drm/nouveau/nouveau_bo5039.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/virtual/virtual_stream_encoder.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_bo74c1.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/virtual/virtual_link_hwss.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_bo85b5.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dcn20/dcn20_dsc.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_bo9039.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dcn35/dcn35_dsc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dcn401/dcn401_dsc.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_bo90b5.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dc_dsc.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_boa0b5.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/rc_calc.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_hwconfig.h
  CC [M]  drivers/gpu/drm/nouveau/nouveau_gem.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_svm.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_dmem.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_llc.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/rc_calc_dpi.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_mem.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dce60/dce60_resource.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dce80/dce80_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_prime.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_sgdma.o
  HDRTEST drivers/gpu/drm/i915/gt/gen8_engine_cs.h
  CC [M]  drivers/gpu/drm/nouveau/nouveau_ttm.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_sseu_debugfs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dce100/dce100_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_vmm.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_rc6_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dce110/dce110_resource.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dce112/dce112_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_exec.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_context_param.h
  CC [M]  drivers/gpu/drm/nouveau/nouveau_sched.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dce120/dce120_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_uvmm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn10/dcn10_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_backlight.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gpu_commands.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn20/dcn20_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_bios.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_connector.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn201/dcn201_resource.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_engine_user.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn21/dcn21_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_display.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_irq.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn30/dcn30_resource.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gsc.h
  CC [M]  drivers/gpu/drm/nouveau/nouveau_dp.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_rps.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn301/dcn301_resource.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/arb.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_tlb.h
  HDRTEST drivers/gpu/drm/i915/gt/selftest_llc.h
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/crtc.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/cursor.o
  HDRTEST drivers/gpu/drm/i915/gt/gen6_ppgtt.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_ggtt_fencing.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn302/dcn302_resource.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/dac.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn303/dcn303_resource.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/dfp.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_migrate_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn31/dcn31_resource.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/disp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn314/dcn314_resource.o
  HDRTEST drivers/gpu/drm/i915/gt/selftests/mock_timeline.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn315/dcn315_resource.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/hw.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn316/dcn316_resource.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/nouveau_i2c_encoder.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/overlay.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_lrc.h
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/tvnv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn32/dcn32_resource.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_lrc_reg.h
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/tvnv17.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn32/dcn32_resource_helpers.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/disp.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_migrate.h
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/lut.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn321/dcn321_resource.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/core.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn35/dcn35_resource.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/core507d.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn351/dcn351_resource.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn36/dcn36_resource.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.h
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/core827d.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn401/dcn401_resource.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/core907d.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn10/dcn10_optc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn20/dcn20_optc.o
  HDRTEST drivers/gpu/drm/i915/gt/mock_engine.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn201/dcn201_optc.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/core917d.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_engine_stats.h
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/corec37d.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/corec57d.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/coreca7d.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/crc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn30/dcn30_optc.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gtt.h
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/crc907d.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_buffer_pool_types.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_ring.h
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/crcc37d.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn301/dcn301_optc.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/crcc57d.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn31/dcn31_optc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn314/dcn314_optc.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_renderstate.h
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/crcca7d.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn32/dcn32_optc.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/dac507d.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn35/dcn35_optc.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_sseu.h
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/dac907d.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/pior507d.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/sor507d.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn401/dcn401_optc.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/sor907d.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_engine_types.h
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/sorc37d.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dpp/dcn10/dcn10_dpp.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/head.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dpp/dcn10/dcn10_dpp_dscl.o
  HDRTEST drivers/gpu/drm/i915/gt/gen2_engine_cs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dpp/dcn10/dcn10_dpp_cm.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/head507d.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/head827d.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/head907d.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dpp/dcn20/dcn20_dpp.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/head917d.o
  HDRTEST drivers/gpu/drm/i915/gvt/gvt.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dpp/dcn20/dcn20_dpp_cm.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/headc37d.o
  HDRTEST drivers/gpu/drm/i915/gvt/trace.h
  HDRTEST drivers/gpu/drm/i915/gvt/debug.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dpp/dcn201/dcn201_dpp.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/headc57d.o
  HDRTEST drivers/gpu/drm/i915/gvt/edid.h
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/headca7d.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dpp/dcn30/dcn30_dpp.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/wimm.o
  HDRTEST drivers/gpu/drm/i915/gvt/page_track.h
  HDRTEST drivers/gpu/drm/i915/gvt/mmio.h
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/wimmc37b.o
  HDRTEST drivers/gpu/drm/i915/gvt/sched_policy.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dpp/dcn30/dcn30_dpp_cm.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/wndw.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dpp/dcn32/dcn32_dpp.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/wndwc37e.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dpp/dcn35/dcn35_dpp.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/wndwc57e.o
  HDRTEST drivers/gpu/drm/i915/gvt/fb_decoder.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dpp/dcn401/dcn401_dpp.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/wndwc67e.o
  HDRTEST drivers/gpu/drm/i915/gvt/cmd_parser.h
  HDRTEST drivers/gpu/drm/i915/gvt/dmabuf.h
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/wndwca7e.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dpp/dcn401/dcn401_dpp_cm.o
  HDRTEST drivers/gpu/drm/i915/gvt/mmio_context.h
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/base.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/base507c.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dpp/dcn401/dcn401_dpp_dscl.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/base827c.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn10/dcn10_hubbub.o
  HDRTEST drivers/gpu/drm/i915/gvt/display.h
  HDRTEST drivers/gpu/drm/i915/gvt/gtt.h
  HDRTEST drivers/gpu/drm/i915/gvt/scheduler.h
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/base907c.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn20/dcn20_hubbub.o
  HDRTEST drivers/gpu/drm/i915/gvt/reg.h
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/base917c.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/curs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn201/dcn201_hubbub.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn21/dcn21_hubbub.o
  HDRTEST drivers/gpu/drm/i915/gvt/execlist.h
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/curs507a.o
  HDRTEST drivers/gpu/drm/i915/gvt/interrupt.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn30/dcn30_hubbub.o
  HDRTEST drivers/gpu/drm/i915/i915_active.h
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/curs907a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn301/dcn301_hubbub.o
  HDRTEST drivers/gpu/drm/i915/i915_active_types.h
  HDRTEST drivers/gpu/drm/i915/i915_cmd_parser.h
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/cursc37a.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/oimm.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/oimm507b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn31/dcn31_hubbub.o
  HDRTEST drivers/gpu/drm/i915/i915_config.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn32/dcn32_hubbub.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/ovly.o
  HDRTEST drivers/gpu/drm/i915/i915_debugfs.h
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/ovly507e.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn35/dcn35_hubbub.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/ovly827e.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn401/dcn401_hubbub.o
  HDRTEST drivers/gpu/drm/i915/i915_debugfs_params.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn20/dcn20_dccg.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/ovly907e.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn201/dcn201_dccg.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/ovly917e.o
  HDRTEST drivers/gpu/drm/i915/i915_deps.h
  HDRTEST drivers/gpu/drm/i915/i915_driver.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn21/dcn21_dccg.o
  HDRTEST drivers/gpu/drm/i915/i915_drm_client.h
  CC [M]  drivers/gpu/drm/nouveau/nouveau_abi16.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn30/dcn30_dccg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn301/dcn301_dccg.o
  HDRTEST drivers/gpu/drm/i915/i915_drv.h
  HDRTEST drivers/gpu/drm/i915/i915_file_private.h
  CC [M]  drivers/gpu/drm/nouveau/nouveau_chan.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn31/dcn31_dccg.o
  HDRTEST drivers/gpu/drm/i915/i915_gem.h
  CC [M]  drivers/gpu/drm/nouveau/nouveau_dma.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn314/dcn314_dccg.o
  HDRTEST drivers/gpu/drm/i915/i915_gem_evict.h
  HDRTEST drivers/gpu/drm/i915/i915_gem_gtt.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn32/dcn32_dccg.o
  HDRTEST drivers/gpu/drm/i915/i915_gem_ww.h
  HDRTEST drivers/gpu/drm/i915/i915_getparam.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn35/dcn35_dccg.o
  HDRTEST drivers/gpu/drm/i915/i915_gpu_error.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn401/dcn401_dccg.o
  HDRTEST drivers/gpu/drm/i915/i915_gtt_view_types.h
  CC [M]  drivers/gpu/drm/nouveau/nouveau_fence.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hubp/dcn10/dcn10_hubp.o
  HDRTEST drivers/gpu/drm/i915/i915_hwmon.h
  CC [M]  drivers/gpu/drm/nouveau/nv04_fence.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hubp/dcn20/dcn20_hubp.o
  HDRTEST drivers/gpu/drm/i915/i915_ioc32.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hubp/dcn201/dcn201_hubp.o
  HDRTEST drivers/gpu/drm/i915/i915_ioctl.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hubp/dcn21/dcn21_hubp.o
  CC [M]  drivers/gpu/drm/nouveau/nv10_fence.o
  HDRTEST drivers/gpu/drm/i915/i915_iosf_mbi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hubp/dcn30/dcn30_hubp.o
  CC [M]  drivers/gpu/drm/nouveau/nv17_fence.o
  HDRTEST drivers/gpu/drm/i915/i915_irq.h
  CC [M]  drivers/gpu/drm/nouveau/nv50_fence.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hubp/dcn31/dcn31_hubp.o
  HDRTEST drivers/gpu/drm/i915/i915_memcpy.h
  HDRTEST drivers/gpu/drm/i915/i915_mitigations.h
  CC [M]  drivers/gpu/drm/nouveau/nv84_fence.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hubp/dcn32/dcn32_hubp.o
  CC [M]  drivers/gpu/drm/nouveau/nvc0_fence.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hubp/dcn35/dcn35_hubp.o
  CC [M]  drivers/gpu/drm/nouveau/gv100_fence.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hubp/dcn401/dcn401_hubp.o
  LD [M]  drivers/gpu/drm/nouveau/ch7006.o
  LD [M]  drivers/gpu/drm/nouveau/sil164.o
  HDRTEST drivers/gpu/drm/i915/i915_mm.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn10/dcn10_link_encoder.o
  HDRTEST drivers/gpu/drm/i915/i915_params.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn10/dcn10_stream_encoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn20/dcn20_link_encoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn20/dcn20_stream_encoder.o
  HDRTEST drivers/gpu/drm/i915/i915_pci.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn30/dcn30_dio_link_encoder.o
  HDRTEST drivers/gpu/drm/i915/i915_perf.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn30/dcn30_dio_stream_encoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn301/dcn301_dio_link_encoder.o
  HDRTEST drivers/gpu/drm/i915/i915_perf_oa_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn31/dcn31_dio_link_encoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn314/dcn314_dio_stream_encoder.o
  HDRTEST drivers/gpu/drm/i915/i915_perf_types.h
  HDRTEST drivers/gpu/drm/i915/i915_pmu.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn32/dcn32_dio_link_encoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn32/dcn32_dio_stream_encoder.o
  HDRTEST drivers/gpu/drm/i915/i915_priolist_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn35/dcn35_dio_link_encoder.o
  HDRTEST drivers/gpu/drm/i915/i915_pvinfo.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn35/dcn35_dio_stream_encoder.o
  HDRTEST drivers/gpu/drm/i915/i915_query.h
  HDRTEST drivers/gpu/drm/i915/i915_reg.h
  HDRTEST drivers/gpu/drm/i915/i915_reg_defs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn321/dcn321_dio_link_encoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn401/dcn401_dio_link_encoder.o
  HDRTEST drivers/gpu/drm/i915/i915_request.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn401/dcn401_dio_stream_encoder.o
  HDRTEST drivers/gpu/drm/i915/i915_scatterlist.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dwb/dcn30/dcn30_dwb.o
  HDRTEST drivers/gpu/drm/i915/i915_scheduler.h
  HDRTEST drivers/gpu/drm/i915/i915_scheduler_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dwb/dcn30/dcn30_dwb_cm.o
  HDRTEST drivers/gpu/drm/i915/i915_selftest.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dwb/dcn35/dcn35_dwb.o
  HDRTEST drivers/gpu/drm/i915/i915_sw_fence.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hpo/dcn31/dcn31_hpo_dp_stream_encoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hpo/dcn31/dcn31_hpo_dp_link_encoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hpo/dcn32/dcn32_hpo_dp_link_encoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/mmhubbub/dcn20/dcn20_mmhubbub.o
  HDRTEST drivers/gpu/drm/i915/i915_sw_fence_work.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/mmhubbub/dcn32/dcn32_mmhubbub.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/mmhubbub/dcn35/dcn35_mmhubbub.o
  LD [M]  drivers/gpu/drm/nouveau/nouveau.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/mpc/dcn10/dcn10_mpc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/mpc/dcn20/dcn20_mpc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/mpc/dcn30/dcn30_mpc.o
  HDRTEST drivers/gpu/drm/i915/i915_switcheroo.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/mpc/dcn32/dcn32_mpc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/mpc/dcn401/dcn401_mpc.o
  HDRTEST drivers/gpu/drm/i915/i915_syncmap.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/opp/dcn10/dcn10_opp.o
  HDRTEST drivers/gpu/drm/i915/i915_sysfs.h
  HDRTEST drivers/gpu/drm/i915/i915_tasklet.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/opp/dcn20/dcn20_opp.o
  HDRTEST drivers/gpu/drm/i915/i915_trace.h
  HDRTEST drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
  HDRTEST drivers/gpu/drm/i915/i915_user_extensions.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/opp/dcn35/dcn35_opp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/pg/dcn35/dcn35_pg_cntl.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_ipp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer_debug.o
  HDRTEST drivers/gpu/drm/i915/i915_utils.h
  HDRTEST drivers/gpu/drm/i915/i915_vgpu.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_cm_common.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_vmid.o
  HDRTEST drivers/gpu/drm/i915/i915_vma.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dwb.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dwb_scl.o
  HDRTEST drivers/gpu/drm/i915/i915_vma_resource.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_link_encoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_mpc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_opp.o
  HDRTEST drivers/gpu/drm/i915/i915_vma_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_link_encoder.o
  HDRTEST drivers/gpu/drm/i915/intel_clock_gating.h
  HDRTEST drivers/gpu/drm/i915/intel_cpu_info.h
  HDRTEST drivers/gpu/drm/i915/intel_device_info.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_vpg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_afmt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_cm_common.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_mmhubbub.o
  HDRTEST drivers/gpu/drm/i915/intel_gvt.h
  HDRTEST drivers/gpu/drm/i915/intel_mchbar_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_panel_cntl.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_panel_cntl.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_apg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_afmt.o
  HDRTEST drivers/gpu/drm/i915/intel_memory_region.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_vpg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_util.o
  HDRTEST drivers/gpu/drm/i915/intel_pci_config.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_wrapper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_utils.o
  HDRTEST drivers/gpu/drm/i915/intel_pcode.h
  HDRTEST drivers/gpu/drm/i915/intel_region_ttm.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_policy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_translation_helper.o
  HDRTEST drivers/gpu/drm/i915/intel_runtime_pm.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_dc_resource_mgmt.o
  HDRTEST drivers/gpu/drm/i915/intel_step.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_mall_phantom.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml_display_rq_dlg_calc.o
  HDRTEST drivers/gpu/drm/i915/intel_uncore.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_top/dml2_top_interfaces.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.o
  HDRTEST drivers/gpu/drm/i915/intel_uncore_trace.h
  HDRTEST drivers/gpu/drm/i915/intel_wakeref.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o
  HDRTEST drivers/gpu/drm/i915/pxp/intel_pxp_tee.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.o
  HDRTEST drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
  HDRTEST drivers/gpu/drm/i915/pxp/intel_pxp_session.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.o
  HDRTEST drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.o
  HDRTEST drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.o
  HDRTEST drivers/gpu/drm/i915/pxp/intel_pxp_cmd.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.o
  HDRTEST drivers/gpu/drm/i915/pxp/intel_pxp.h
  HDRTEST drivers/gpu/drm/i915/pxp/intel_pxp_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.o
  HDRTEST drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h
  HDRTEST drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
  HDRTEST drivers/gpu/drm/i915/pxp/intel_pxp_huc.h
  HDRTEST drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/dml21_translation_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/dml21_wrapper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/dml21_utils.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce120/dce120_timing_generator.o
  HDRTEST drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_42.h
  HDRTEST drivers/gpu/drm/i915/pxp/intel_pxp_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce112/dce112_compressor.o
  HDRTEST drivers/gpu/drm/i915/selftests/igt_live_test.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_timing_generator.o
  HDRTEST drivers/gpu/drm/i915/selftests/igt_atomic.h
  HDRTEST drivers/gpu/drm/i915/selftests/mock_gem_device.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_compressor.o
  HDRTEST drivers/gpu/drm/i915/selftests/mock_drm.h
  HDRTEST drivers/gpu/drm/i915/selftests/igt_reset.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_opp_regamma_v.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_opp_csc_v.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_timing_generator_v.o
  HDRTEST drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
  HDRTEST drivers/gpu/drm/i915/selftests/lib_sw_fence.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_mem_input_v.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_opp_v.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_transform_v.o
  HDRTEST drivers/gpu/drm/i915/selftests/i915_perf_selftests.h
  HDRTEST drivers/gpu/drm/i915/selftests/mock_uncore.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce80/dce80_timing_generator.o
  HDRTEST drivers/gpu/drm/i915/selftests/mock_gtt.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_timing_generator.o
  HDRTEST drivers/gpu/drm/i915/selftests/i915_mock_selftests.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hdcp/hdcp_msg.o
  HDRTEST drivers/gpu/drm/i915/selftests/mock_request.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/sspl/dc_spl.o
  HDRTEST drivers/gpu/drm/i915/selftests/i915_random.h
  HDRTEST drivers/gpu/drm/i915/selftests/igt_spinner.h
  HDRTEST drivers/gpu/drm/i915/selftests/librapl.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/sspl/dc_spl_scl_filters.o
  HDRTEST drivers/gpu/drm/i915/selftests/mock_region.h
  HDRTEST drivers/gpu/drm/i915/selftests/i915_live_selftests.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/sspl/dc_spl_scl_easf_filters.o
  HDRTEST drivers/gpu/drm/i915/selftests/igt_mmap.h
  HDRTEST drivers/gpu/drm/i915/selftests/igt_flush_test.h
  HDRTEST drivers/gpu/drm/i915/soc/intel_rom.h
  HDRTEST drivers/gpu/drm/i915/soc/intel_dram.h
  HDRTEST drivers/gpu/drm/i915/soc/intel_gmch.h
  HDRTEST drivers/gpu/drm/i915/vlv_iosf_sb.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/sspl/dc_spl_isharp_filters.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/sspl/dc_spl_filters.o
  HDRTEST drivers/gpu/drm/i915/vlv_iosf_sb_reg.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/sspl/spl_fixpt31_32.o
  HDRTEST drivers/gpu/drm/i915/vlv_suspend.h
  LD [M]  drivers/gpu/drm/i915/i915.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/sspl/spl_custom_float.o
  LD [M]  drivers/gpu/drm/i915/kvmgt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dc_edid_parser.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dc_fused_io.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_debug.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_enc_cfg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_exports.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_sink.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stat.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_state.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_surface.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_vm_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_gamma.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_table.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/info_packet/info_packet.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_helpers.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv_stat.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_reg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn20.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn21.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn30.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn301.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn302.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn303.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn31.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn314.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn315.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn316.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn32.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn35.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn351.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn36.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn401.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_ddc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_log.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_psp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp1_execution.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp1_transition.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp2_execution.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp2_transition.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_isp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.o
  LD [M]  drivers/gpu/drm/amd/amdgpu/amdgpu.o
make[5]: *** [../scripts/Makefile.build:554: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:554: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:554: drivers] Error 2
make[2]: *** [/kernel/Makefile:2006: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make[1]: Leaving directory '/kernel/build64-debug'
make: *** [Makefile:248: __sub-make] Error 2
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


