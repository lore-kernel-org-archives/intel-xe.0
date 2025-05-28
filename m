Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3A5C5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 08:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1270D10E57B;
	Wed, 28 May 2025 08:37:47 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B0010E5B8;
 Wed, 28 May 2025 08:37:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EBuild=3A_failure_for_drm/i915/display=3A_Fix_u32_ov?=
 =?utf-8?q?erflow_in_SNPS_PHY_HDMI_PLL_setup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 08:37:46 -0000
Message-ID: <174842146606.27371.10635910061152783113@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250528064557.4172149-1-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20250528064557.4172149-1-dibin.moolakadan.subrahmanian@intel.com>
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

Series: drm/i915/display: Fix u32 overflow in SNPS PHY HDMI PLL setup
URL   : https://patchwork.freedesktop.org/series/149566/
State : failure

== Summary ==

CC      net/bpf/bpf_dummy_struct_ops.o
  LD [M]  sound/soc/codecs/snd-soc-cs40l50.o
  LD [M]  sound/soc/codecs/snd-soc-cs530x.o
  LD [M]  sound/soc/codecs/snd-soc-cs530x-i2c.o
  LD [M]  sound/soc/codecs/snd-soc-es8311.o
  LD [M]  sound/soc/codecs/snd-soc-hda-codec.o
  CC [M]  sound/hda/hdac_regmap.o
  LD [M]  sound/soc/codecs/snd-soc-hdmi-codec.o
  LD [M]  sound/soc/codecs/snd-soc-pcm6240.o
  CC [M]  drivers/gpio/gpio-mc33880.o
  CC      fs/ntfs3/dir.o
  CC      drivers/char/agp/isoch.o
  CC      arch/x86/kernel/cpu/bus_lock.o
  CC [M]  drivers/char/hw_random/ba431-rng.o
  CC [M]  sound/soc/dwc/dwc-i2s.o
  CC [M]  drivers/leds/leds-lp50xx.o
  CC [M]  sound/soc/dwc/dwc-pcm.o
  CC [M]  fs/nls/nls_cp932.o
  CC      crypto/gcm.o
  CC      drivers/acpi/acpica/exnames.o
  CC      drivers/acpi/acpica/exoparg1.o
  CC      drivers/acpi/acpica/exoparg2.o
  LD [M]  drivers/char/tpm/st33zp24/tpm_st33zp24.o
  LD [M]  drivers/char/tpm/st33zp24/tpm_st33zp24_i2c.o
  LD [M]  drivers/char/tpm/st33zp24/tpm_st33zp24_spi.o
  CC      drivers/char/tpm/tpm-chip.o
  CC      fs/udf/file.o
  CC [M]  drivers/video/backlight/max8925_bl.o
  CC [M]  net/sched/act_gact.o
  CC      kernel/trace/rv/reactor_panic.o
  CC      kernel/time/tick-sched.o
  CC      drivers/xen/xenbus/xenbus_dev_frontend.o
  LD [M]  drivers/char/mwave/mwave.o
  CC      drivers/acpi/acpica/exoparg3.o
  CC [M]  fs/nls/nls_euc-jp.o
  CC [M]  fs/nls/nls_cp936.o
  CC [M]  drivers/dma/dw/platform.o
  CC [M]  drivers/xen/xen-pciback/conf_space_header.o
  CC [M]  net/sched/act_mirred.o
  CC [M]  drivers/char/hw_random/via-rng.o
  CC [M]  net/sched/act_sample.o
  CC [M]  net/sched/act_nat.o
  CC [M]  drivers/xen/xen-pciback/conf_space_capability.o
  CC [M]  drivers/gpio/gpio-menz127.o
  CC      fs/ext4/page-io.o
  CC      drivers/char/agp/amd64-agp.o
  CC      drivers/tty/vt/keyboard.o
  CC [M]  net/sched/act_pedit.o
  CC [M]  sound/hda/hdac_controller.o
  CC [M]  drivers/clk/clk-si544.o
  CC      drivers/regulator/event.o
  CC      block/blk-cgroup-fc-appid.o
  CC      fs/ntfs3/fsntfs.o
  CC [M]  drivers/leds/leds-lp8788.o
  CC      kernel/debug/kdb/gen-kdb_cmds.o
  CC      drivers/video/fbdev/core/cfbimgblt.o
  LD [M]  sound/soc/dwc/designware_i2s.o
  AR      kernel/debug/kdb/built-in.a
  CC      kernel/debug/gdbstub.o
  CC [M]  drivers/dma/dw-edma/dw-edma-core.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-byt-match.o
  CC      kernel/cgroup/misc.o
  CC [M]  drivers/dma/dw-edma/dw-edma-v0-core.o
  CC      drivers/acpi/acpica/exoparg6.o
  AR      kernel/trace/rv/built-in.a
  CC      drivers/virtio/virtio_pci_common.o
  CC [M]  sound/hda/hdac_stream.o
  CC [M]  drivers/dma/ioat/init.o
  CC [M]  arch/x86/kvm/cpuid.o
  CC      fs/udf/ialloc.o
  CC [M]  drivers/video/backlight/mp3309c.o
  CC [M]  drivers/dma/sf-pdma/sf-pdma.o
  CC      crypto/aes_generic.o
  CC [M]  drivers/video/backlight/mt6370-backlight.o
  CC [M]  drivers/char/hw_random/virtio-rng.o
  CC      security/lsm_audit.o
  CC [M]  fs/nls/nls_cp949.o
  CC      drivers/pci/pci-driver.o
  CC [M]  drivers/dma/dw/pci.o
  CC [M]  drivers/gpio/gpio-ml-ioh.o
  CC      arch/x86/kernel/cpu/capflags.o
  CC      mm/msync.o
  CC [M]  drivers/leds/leds-lt3593.o
  CC      drivers/acpi/acpica/exprep.o
  AR      arch/x86/kernel/cpu/built-in.a
  CC      arch/x86/kernel/dumpstack_64.o
  CC      fs/ntfs3/frecord.o
  CC [M]  drivers/xen/xen-pciback/conf_space_quirks.o
  CC      drivers/char/agp/intel-agp.o
  CC      drivers/char/tpm/tpm-dev-common.o
  CC [M]  drivers/clk/clk-tps68470.o
  CC [M]  sound/pci/hda/patch_senarytech.o
  CC [M]  drivers/regulator/fixed.o
  CC      block/blk-throttle.o
  CC      fs/ext4/readpage.o
  CC      drivers/xen/xenbus/xenbus_dev_backend.o
  CC      fs/udf/inode.o
  CC [M]  drivers/xen/xenfs/super.o
  CC      drivers/acpi/acpica/exregion.o
  CC [M]  drivers/char/hw_random/xiphera-trng.o
  CC [M]  drivers/video/fbdev/udlfb.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cht-match.o
  CC      crypto/deflate.o
  AR      kernel/debug/built-in.a
  CC      lib/bug.o
  CC      kernel/trace/ring_buffer.o
  AR      kernel/cgroup/built-in.a
  CC      drivers/virtio/virtio_pci_legacy.o
  CC [M]  sound/hda/array.o
  CC      lib/buildid.o
  CC [M]  fs/nls/nls_cp950.o
  CC [M]  drivers/leds/leds-max8997.o
  CC      fs/ntfs3/file.o
  CC [M]  drivers/video/backlight/pandora_bl.o
  LD [M]  drivers/dma/dw/dw_dmac_core.o
  LD [M]  drivers/dma/dw/dw_dmac.o
  CC      lib/clz_tab.o
  LD [M]  drivers/dma/dw/dw_dmac_pci.o
  CC      drivers/tty/vt/vt.o
  CC      crypto/crc32c_generic.o
  CC      kernel/time/timer_migration.o
  CC      arch/x86/kernel/time.o
  CC [M]  drivers/dma/ioat/dma.o
  CC [M]  net/sched/act_skbedit.o
  CC [M]  drivers/clk/clk-twl6040.o
  CC [M]  drivers/regulator/virtual.o
  CC [M]  drivers/gpio/gpio-pca953x.o
  CC      drivers/video/fbdev/core/fb_io_fops.o
  CC [M]  drivers/xen/xen-pciback/vpci.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.o
  CC      mm/page_vma_mapped.o
  CC      lib/zstd/decompress/zstd_ddict.o
  CC      drivers/char/agp/intel-gtt.o
  CC      drivers/char/tpm/tpm-dev.o
  CC      drivers/acpi/acpica/exresnte.o
  CC [M]  drivers/dma/dw-edma/dw-hdma-v0-core.o
  CC [M]  sound/pci/hda/patch_hdmi.o
  CC [M]  sound/hda/hdmi_chmap.o
  CC      security/device_cgroup.o
  CC      drivers/video/fbdev/core/sysfillrect.o
  CC      lib/zstd/decompress/zstd_decompress.o
  CC      net/core/sock_diag.o
  CC      drivers/iommu/amd/iommu.o
  AR      drivers/char/hw_random/built-in.a
  AR      net/bpf/built-in.a
  CC      drivers/xen/xenbus/xenbus_probe_frontend.o
  AR      drivers/gpu/host1x/built-in.a
  CC      lib/zstd/decompress/zstd_decompress_block.o
  CC      drivers/connector/cn_queue.o
  CC [M]  drivers/xen/xenfs/xenstored.o
  CC [M]  fs/nls/nls_cp1250.o
  CC      drivers/virtio/virtio_pci_admin_legacy_io.o
  CC [M]  sound/hda/trace.o
  CC      crypto/lzo.o
  AR      drivers/gpu/drm/tests/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_kunit_helpers.o
  CC      crypto/lzo-rle.o
  CC      fs/ext4/resize.o
  CC [M]  sound/hda/hdac_component.o
  CC      drivers/acpi/acpica/exresolv.o
  CC [M]  drivers/leds/leds-mc13783.o
  CC [M]  drivers/video/backlight/pwm_bl.o
  CC      arch/x86/kernel/ioport.o
  CC [M]  drivers/clk/clk-twl.o
  CC [M]  sound/hda/hdac_i915.o
  CC      drivers/pci/search.o
  CC [M]  drivers/regulator/userspace-consumer.o
  CC      drivers/char/tpm/tpm-interface.o
  CC [M]  drivers/xen/xen-pciback/passthrough.o
  CC [M]  fs/nls/nls_cp1251.o
  CC [M]  drivers/dma/dw-edma/dw-edma-v0-debugfs.o
  CC      fs/ntfs3/fslog.o
  CC [M]  drivers/xen/xenfs/xensyms.o
  CC [M]  drivers/dma/ioat/prep.o
  CC [M]  drivers/dma/ioat/dca.o
  CC      drivers/base/power/sysfs.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-skl-match.o
  CC      drivers/acpi/acpica/exresop.o
  CC      drivers/base/firmware_loader/builtin/main.o
  CC [M]  drivers/block/xen-blkback/blkback.o
  CC      drivers/char/agp/via-agp.o
  CC      mm/pagewalk.o
  CC      crypto/xxhash_generic.o
  CC [M]  drivers/gpio/gpio-pca9570.o
  CC      block/blk-ioprio.o
  CC [M]  drivers/leds/leds-menf21bmc.o
  CC [M]  drivers/dma/dw-edma/dw-hdma-v0-debugfs.o
  CC      drivers/base/power/generic_ops.o
  CC      fs/udf/lowlevel.o
  CC [M]  drivers/clk/clk-wm831x.o
  CC [M]  net/sched/act_csum.o
  CC      drivers/connector/connector.o
  CC [M]  fs/nls/nls_ascii.o
  CC [M]  drivers/video/backlight/qcom-wled.o
  CC      drivers/pci/rom.o
  CC      drivers/virtio/virtio_balloon.o
  CC [M]  drivers/regulator/88pg86x.o
  CC [M]  drivers/gpu/drm/tests/drm_atomic_test.o
  CC      drivers/acpi/acpica/exserial.o
  CC      drivers/video/fbdev/core/syscopyarea.o
  CC [M]  net/sched/act_vlan.o
  CC [M]  drivers/block/xen-blkback/xenbus.o
  CC [M]  arch/x86/kvm/pmu.o
  CC      arch/x86/kernel/dumpstack.o
  CC      kernel/time/vsyscall.o
  AR      drivers/xen/xenbus/built-in.a
  CC      drivers/tty/hvc/hvc_console.o
  LD [M]  drivers/xen/xen-pciback/xen-pciback.o
  CC      drivers/connector/cn_proc.o
  CC      crypto/rng.o
  CC      drivers/tty/serial/8250/8250_core.o
  LD [M]  drivers/xen/xenfs/xenfs.o
  CC      drivers/xen/cpu_hotplug.o
  CC      crypto/drbg.o
  AR      drivers/base/firmware_loader/builtin/built-in.a
  CC      drivers/base/firmware_loader/fallback_table.o
  CC [M]  drivers/char/agp/sis-agp.o
  CC      crypto/jitterentropy.o
  CC [M]  sound/hda/intel-dsp-config.o
  CC      drivers/tty/serdev/core.o
  CC [M]  drivers/gpio/gpio-pcf857x.o
  CC      block/blk-iocost.o
  CC      net/core/dev_ioctl.o
  AR      drivers/tty/ipwireless/built-in.a
  CC      drivers/tty/serdev/serdev-ttyport.o
  CC [M]  drivers/leds/leds-mlxcpld.o
  CC [M]  drivers/dma/dw-edma/dw-edma-pcie.o
  AR      security/built-in.a
  CC      fs/udf/namei.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-kbl-match.o
  CC [M]  fs/nls/nls_iso8859-1.o
  CC      drivers/acpi/acpica/exstore.o
  CC      drivers/xen/grant-table.o
  CC [M]  drivers/dma/ioat/sysfs.o
  AR      drivers/clk/built-in.a
  CC      fs/ext4/super.o
  CC [M]  drivers/regulator/88pm800-regulator.o
  CC [M]  sound/pci/hda/hda_eld.o
  CC      drivers/char/tpm/tpm1-cmd.o
  CC      kernel/time/timekeeping_debug.o
  CC      kernel/bpf/core.o
  CC      drivers/base/power/common.o
  CC [M]  drivers/gpu/drm/tests/drm_atomic_state_test.o
  CC      kernel/events/core.o
  CC      mm/pgtable-generic.o
  CC      drivers/base/firmware_loader/main.o
  CC [M]  drivers/video/backlight/rt4831-backlight.o
  CC      arch/x86/kernel/nmi.o
  CC      drivers/iommu/intel/dmar.o
  AR      drivers/char/agp/built-in.a
  CC      drivers/acpi/acpica/exstoren.o
  CC      drivers/pci/setup-res.o
  CC      drivers/base/firmware_loader/fallback.o
  COPY    drivers/tty/vt/defkeymap.c
  CC      drivers/tty/vt/consolemap.o
  CC [M]  fs/nls/nls_iso8859-2.o
  CC [M]  drivers/leds/leds-mlxreg.o
  CC [M]  net/sched/act_bpf.o
  CC [M]  drivers/virtio/virtio_input.o
  CC      lib/zstd/zstd_common_module.o
  LD [M]  drivers/dma/ioat/ioatdma.o
  CC      drivers/iommu/amd/init.o
  CC [M]  fs/nls/nls_iso8859-3.o
  CC [M]  drivers/gpio/gpio-pcie-idio-24.o
  AR      drivers/misc/eeprom/built-in.a
  CC [M]  drivers/misc/eeprom/at24.o
  CC      fs/udf/partition.o
  CC [M]  drivers/misc/eeprom/at25.o
  LD [M]  drivers/dma/dw-edma/dw-edma.o
  CC      drivers/dma/dmaengine.o
  CC      kernel/time/namespace.o
  CC      drivers/tty/hvc/hvc_irq.o
  CC [M]  sound/pci/hda/hda_component.o
  CC [M]  drivers/regulator/88pm8607.o
  AR      drivers/connector/built-in.a
  CC      drivers/acpi/acpica/exstorob.o
  CC      fs/debugfs/inode.o
  LD [M]  drivers/block/xen-blkback/xen-blkback.o
  CC [M]  drivers/block/drbd/drbd_buildtag.o
  CC [M]  sound/hda/intel-nhlt.o
  CC [M]  drivers/regulator/aat2870-regulator.o
  CC      fs/udf/super.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-bxt-match.o
  CC      drivers/video/fbdev/core/sysimgblt.o
  AR      drivers/tty/serdev/built-in.a
  CC [M]  drivers/regulator/act8865-regulator.o
  CC      fs/tracefs/inode.o
  CC      kernel/trace/trace.o
  CC      crypto/jitterentropy-kcapi.o
  CC [M]  drivers/gpu/drm/tests/drm_bridge_test.o
  CC [M]  drivers/video/backlight/kb3886_bl.o
  CC      drivers/tty/serial/8250/8250_platform.o
  CC [M]  sound/soc/intel/atom/sst/sst.o
  CC [M]  drivers/leds/leds-mt6323.o
  CC [M]  drivers/virtio/virtio_vdpa.o
  CC      mm/rmap.o
  CC      drivers/char/tpm/tpm2-cmd.o
  CC [M]  fs/nls/nls_iso8859-4.o
  CC      drivers/base/power/qos.o
  CC [M]  arch/x86/kvm/mtrr.o
  CC      drivers/acpi/acpica/exsystem.o
  CC      drivers/tty/hvc/hvc_xen.o
  CC [M]  drivers/regulator/ad5398.o
  CC [M]  drivers/gpio/gpio-pci-idio-16.o
  CC [M]  drivers/block/drbd/drbd_bitmap.o
  CC      fs/ntfs3/inode.o
  CC      lib/zstd/common/debug.o
  HOSTCC  drivers/tty/vt/conmakehash
  CC      fs/tracefs/event_inode.o
  AR      kernel/time/built-in.a
  CC [M]  drivers/video/backlight/sky81452-backlight.o
  CC      drivers/dma/virt-dma.o
  CC      lib/zstd/common/entropy_common.o
  CC      drivers/pci/irq.o
  CC      crypto/ghash-generic.o
  CC [M]  drivers/misc/eeprom/max6875.o
  CC [M]  drivers/video/backlight/wm831x_bl.o
  CC [M]  drivers/misc/eeprom/eeprom_93cx6.o
  CC [M]  net/sched/act_connmark.o
  CC      drivers/xen/features.o
  CC      net/core/tso.o
  CC [M]  drivers/leds/leds-nic78bx.o
  CC      drivers/acpi/acpica/extrace.o
  CC [M]  fs/nls/nls_iso8859-5.o
  CC      crypto/ecc.o
  CC [M]  net/sched/act_ctinfo.o
  CC      drivers/tty/vt/defkeymap.o
  CC      lib/zstd/common/error_private.o
  CC [M]  drivers/gpu/drm/tests/drm_buddy_test.o
  CC      arch/x86/kernel/fred.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-glk-match.o
  CC      lib/zstd/common/fse_decompress.o
  CC      fs/debugfs/file.o
  CC [M]  sound/hda/intel-sdw-acpi.o
  CC      drivers/base/firmware_loader/fallback_platform.o
  CC [M]  sound/pci/hda/hda_intel.o
  CONMK   drivers/tty/vt/consolemap_deftbl.c
  CC      drivers/tty/vt/consolemap_deftbl.o
  CC [M]  drivers/gpio/gpio-pisosr.o
  AR      drivers/tty/vt/built-in.a
  CC [M]  arch/x86/kvm/debugfs.o
  CC [M]  net/sched/act_skbmod.o
  CC      block/mq-deadline.o
  CC [M]  drivers/regulator/arizona-ldo1.o
  CC      drivers/acpi/acpica/exutils.o
  CC      drivers/tty/serial/8250/8250_pnp.o
  CC      net/ethtool/ioctl.o
  LD [M]  sound/hda/snd-hda-core.o
  CC [M]  fs/nls/nls_iso8859-6.o
  CC [M]  drivers/leds/leds-pca9532.o
  CC [M]  drivers/virtio/virtio_mem.o
  CC      drivers/video/fbdev/core/fb_sys_fops.o
  AR      drivers/tty/hvc/built-in.a
  LD [M]  sound/hda/snd-intel-dspcfg.o
  CC [M]  drivers/gpio/gpio-rdc321x.o
  CC [M]  sound/soc/intel/atom/sst/sst_ipc.o
  CC [M]  sound/soc/intel/atom/sst/sst_stream.o
  CC      kernel/events/ring_buffer.o
  LD [M]  sound/pci/hda/snd-hda-codec.o
  CC [M]  drivers/block/drbd/drbd_proc.o
  CC      fs/udf/truncate.o
  AR      fs/tracefs/built-in.a
  CC      drivers/iommu/amd/quirks.o
  CC [M]  drivers/video/backlight/arcxcnn_bl.o
  CC [M]  sound/soc/intel/atom/sst/sst_drv_interface.o
  CC      drivers/char/tpm/tpmrm-dev.o
  CC      lib/zstd/common/zstd_common.o
  CC      drivers/iommu/intel/iommu.o
  AR      lib/zstd/built-in.a
  CC [M]  drivers/misc/eeprom/eeprom_93xx46.o
  CC      lib/cmdline.o
  CC      drivers/dma/acpi-dma.o
  CC      drivers/acpi/acpica/hwacpi.o
  CC      drivers/base/firmware_loader/sysfs.o
  CC      drivers/pci/vpd.o
  CC      drivers/xen/balloon.o
  CC [M]  drivers/gpu/drm/tests/drm_cmdline_parser_test.o
  CC [M]  fs/nls/nls_iso8859-7.o
  CC      drivers/xen/manage.o
  CC      drivers/base/power/runtime.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cnl-match.o
  CC      fs/ntfs3/index.o
  CC      drivers/iommu/amd/io_pgtable.o
  CC      lib/cpumask.o
  CC [M]  drivers/regulator/arizona-micsupp.o
  CC      drivers/tty/serial/8250/8250_rsa.o
  CC [M]  drivers/gpio/gpio-sch311x.o
  LD [M]  sound/hda/snd-intel-sdw-acpi.o
  CC [M]  drivers/video/fbdev/core/fb_ddc.o
  CC [M]  arch/x86/kvm/mmu/mmu.o
  CC      drivers/acpi/acpica/hwesleep.o
  CC [M]  drivers/char/xillybus/xillybus_class.o
  CC      kernel/bpf/syscall.o
  CC [M]  drivers/dma/altera-msgdma.o
  CC      mm/vmalloc.o
  CC      drivers/char/tpm/tpm2-space.o
  CC [M]  drivers/leds/leds-pca955x.o
  CC      drivers/char/mem.o
  CC      fs/udf/symlink.o
  CC      arch/x86/kernel/ldt.o
  CC [M]  drivers/video/backlight/rave-sp-backlight.o
  CC [M]  net/sched/act_tunnel_key.o
  CC [M]  sound/soc/intel/atom/sst/sst_loader.o
  CC      net/core/sock_reuseport.o
  CC [M]  fs/nls/nls_cp1255.o
  CC      block/bio-integrity.o
  CC [M]  drivers/dma/idma64.o
  CC      arch/x86/kernel/setup.o
  CC [M]  drivers/misc/eeprom/idt_89hpesx.o
  CC      drivers/acpi/acpica/hwgpe.o
  CC      drivers/base/firmware_loader/sysfs_upload.o
  CC      drivers/acpi/x86/apple.o
  AR      fs/debugfs/built-in.a
  CC      drivers/acpi/acpica/hwregs.o
  LD [M]  sound/pci/hda/snd-hda-codec-generic.o
  LD [M]  sound/pci/hda/snd-hda-codec-realtek.o
  LD [M]  sound/pci/hda/snd-hda-codec-senarytech.o
  CC      drivers/tty/serial/8250/8250_port.o
  LD [M]  sound/pci/hda/snd-hda-codec-hdmi.o
  LD [M]  sound/pci/hda/snd-hda-scodec-component.o
  LD [M]  sound/pci/hda/snd-hda-intel.o
  CC      crypto/ecdh.o
  CC [M]  sound/pci/rme9652/hdsp.o
  CC [M]  drivers/gpio/gpio-sch.o
  CC [M]  drivers/block/drbd/drbd_worker.o
  CC [M]  drivers/regulator/as3711-regulator.o
  CC      mm/vma.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cfl-match.o
  CC      lib/ctype.o
  CC      fs/udf/directory.o
  CC      drivers/pci/setup-bus.o
  CC      drivers/iommu/amd/io_pgtable_v2.o
  CC [M]  fs/nls/nls_iso8859-9.o
  CC      crypto/ecdh_helper.o
  CC      lib/dec_and_lock.o
  CC [M]  drivers/char/xillybus/xillybus_core.o
  CC      drivers/char/tpm/tpm-sysfs.o
  CC      drivers/tty/serial/8250/8250_dma.o
  CC      drivers/xen/time.o
  CC [M]  drivers/virtio/virtio_dma_buf.o
  CC      fs/udf/misc.o
  CC      drivers/acpi/acpica/hwsleep.o
  CC      drivers/base/power/wakeirq.o
  CC [M]  drivers/gpu/drm/tests/drm_connector_test.o
  CC [M]  sound/soc/intel/atom/sst/sst_pvt.o
  CC [M]  drivers/leds/leds-pca963x.o
  AR      drivers/video/backlight/built-in.a
  CC      drivers/acpi/x86/cmos_rtc.o
  CC      fs/ext4/symlink.o
  AR      drivers/video/fbdev/core/built-in.a
  CC      drivers/char/tpm/eventlog/common.o
  CC [M]  drivers/video/fbdev/smscufx.o
  AR      drivers/misc/cb710/built-in.a
  CC [M]  drivers/misc/cb710/core.o
  CC [M]  drivers/dma/plx_dma.o
  AR      drivers/iommu/arm/arm-smmu/built-in.a
  CC [M]  sound/soc/intel/atom/sst-mfld-platform-pcm.o
  AR      drivers/iommu/arm/arm-smmu-v3/built-in.a
  AR      drivers/iommu/arm/built-in.a
  CC      block/blk-integrity.o
  CC [M]  drivers/gpio/gpio-sim.o
  CC      lib/decompress.o
  CC [M]  drivers/regulator/atc260x-regulator.o
  CC [M]  fs/nls/nls_iso8859-13.o
  CC [M]  drivers/misc/eeprom/ee1004.o
  AR      drivers/base/firmware_loader/built-in.a
  CC      arch/x86/kernel/x86_init.o
  CC      fs/ntfs3/lznt.o
  CC      drivers/acpi/acpica/hwvalid.o
  CC      lib/decompress_bunzip2.o
  CC      crypto/xor.o
  CC      net/ethtool/common.o
  CC [M]  net/sched/act_ct.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cml-match.o
  CC      drivers/iommu/amd/ppr.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-icl-match.o
  CC      drivers/acpi/acpica/hwxface.o
  CC      fs/udf/udftime.o
  CC      drivers/acpi/acpica/hwxfsleep.o
  CC      drivers/xen/mem-reservation.o
  CC      drivers/base/regmap/regmap.o
  CC      fs/udf/unicode.o
  AR      drivers/base/test/built-in.a
  CC [M]  drivers/misc/cb710/sgbuf2.o
  CC [M]  drivers/leds/leds-pca995x.o
  CC [M]  fs/nls/nls_iso8859-14.o
  CC      drivers/char/tpm/eventlog/tpm1.o
  CC      drivers/base/power/main.o
  AR      drivers/virtio/built-in.a
  AR      drivers/dma/built-in.a
  CC      fs/ext4/sysfs.o
  CC      lib/decompress_inflate.o
  CC      drivers/acpi/x86/lpss.o
  CC [M]  drivers/regulator/aw37503-regulator.o
  CC      drivers/tty/tty_io.o
  CC      net/core/fib_notifier.o
  CC [M]  drivers/gpio/gpio-siox.o
  CC [M]  sound/soc/intel/atom/sst-mfld-platform-compress.o
  CC      fs/ntfs3/namei.o
  CC [M]  drivers/tty/serial/jsm/jsm_driver.o
  CC [M]  sound/soc/intel/atom/sst/sst_pci.o
  CC [M]  drivers/gpu/drm/tests/drm_damage_helper_test.o
  CC [M]  drivers/gpu/drm/tests/drm_dp_mst_helper_test.o
  CC      kernel/bpf/verifier.o
  CC      kernel/bpf/inode.o
  CC [M]  drivers/gpu/drm/tests/drm_exec_test.o
  CC      drivers/acpi/acpica/hwpci.o
  CC      crypto/hash_info.o
  CC      drivers/xen/pci.o
  CC [M]  drivers/video/fbdev/xen-fbfront.o
  CC      arch/x86/kernel/i8259.o
  CC [M]  drivers/char/xillybus/xillybus_pcie.o
  CC      drivers/iommu/amd/pasid.o
  CC [M]  sound/pci/rme9652/hdspm.o
  CC      drivers/xen/dbgp.o
  CC      kernel/trace/trace_output.o
  CC      crypto/kdf_sp800108.o
  CC      block/t10-pi.o
  CC [M]  fs/nls/nls_iso8859-15.o
  CC      drivers/iommu/intel/pasid.o
  AR      fs/udf/built-in.a
  CC      lib/decompress_unlz4.o
  CC      net/netfilter/core.o
  CC      fs/ext4/xattr.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-tgl-match.o
  CC [M]  drivers/leds/leds-pwm.o
  CC [M]  drivers/gpio/gpio-sloppy-logic-analyzer.o
  CC      drivers/pci/vc.o
  CC      drivers/tty/serial/8250/8250_dwlib.o
  CC [M]  drivers/regulator/axp20x-regulator.o
  CC      drivers/char/tpm/eventlog/tpm2.o
  CC      drivers/acpi/acpica/nsaccess.o
  CC      net/netfilter/nf_log.o
  CC      drivers/gpu/vga/vga_switcheroo.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ehl-match.o
  CC [M]  drivers/tty/serial/jsm/jsm_neo.o
  CC [M]  sound/soc/intel/atom/sst/sst_acpi.o
  CC      fs/ntfs3/record.o
  LD [M]  drivers/misc/cb710/cb710.o
  CC [M]  fs/nls/nls_koi8-r.o
  AR      drivers/misc/lis3lv02d/built-in.a
  CC [M]  drivers/misc/lis3lv02d/lis3lv02d.o
  CC [M]  drivers/block/drbd/drbd_receiver.o
  CC [M]  net/sched/act_gate.o
  CC      lib/decompress_unlzma.o
  CC      drivers/acpi/x86/s2idle.o
  CC [M]  drivers/char/xillybus/xillyusb.o
  CC [M]  net/sched/cls_u32.o
  AR      drivers/iommu/amd/built-in.a
  CC [M]  net/sched/cls_route.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-jsl-match.o
  CC [M]  drivers/gpu/drm/tests/drm_format_helper_test.o
  CC      net/ethtool/netlink.o
  CC [M]  drivers/leds/leds-regulator.o
  CC      drivers/acpi/acpica/nsalloc.o
  CC [M]  crypto/crypto_engine.o
  CC [M]  drivers/gpio/gpio-tangier.o
  CC      block/bio-integrity-auto.o
  CC      net/core/xdp.o
  CC [M]  drivers/video/fbdev/uvesafb.o
  CC      drivers/pci/mmap.o
  CC      arch/x86/kernel/irqinit.o
  CC [M]  fs/nls/nls_koi8-u.o
  CC      kernel/bpf/helpers.o
  CC [M]  drivers/regulator/bcm590xx-regulator.o
  CC      drivers/char/tpm/tpm-buf.o
  AR      drivers/misc/cardreader/built-in.a
  CC [M]  drivers/misc/cardreader/alcor_pci.o
  CC      mm/process_vm_access.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-core.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-pci.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-acpi.o
  CC [M]  sound/soc/intel/atom/sst-atom-controls.o
  CC      drivers/iommu/intel/nested.o
  CC      drivers/xen/acpi.o
  CC      fs/ntfs3/run.o
  CC      drivers/acpi/acpica/nsarguments.o
  CC      kernel/events/callchain.o
  CC      drivers/tty/serial/8250/8250_fintek.o
  CC      lib/decompress_unlzo.o
  AR      drivers/gpu/drm/arm/built-in.a
  CC [M]  drivers/tty/serial/jsm/jsm_tty.o
  CC [M]  drivers/regulator/bd9571mwv-regulator.o
  CC [M]  fs/nls/nls_koi8-ru.o
  CC      drivers/base/power/wakeup.o
  CC [M]  fs/nls/nls_utf8.o
  CC [M]  drivers/tty/serial/jsm/jsm_cls.o
  CC [M]  drivers/leds/leds-tca6507.o
  CC      kernel/events/hw_breakpoint.o
  CC      block/blk-zoned.o
  CC      drivers/pci/devres.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-adl-match.o
  CC      drivers/iommu/iommufd/iova_bitmap.o
  CC      kernel/trace/trace_seq.o
  CC      drivers/acpi/acpica/nsconvert.o
  CC      arch/x86/kernel/jump_label.o
  CC      drivers/base/regmap/regcache.o
  CC [M]  drivers/misc/lis3lv02d/lis3lv02d_i2c.o
  AR      drivers/gpu/vga/built-in.a
  CC      fs/ext4/xattr_hurd.o
  AR      drivers/iommu/riscv/built-in.a
  CC      kernel/trace/trace_stat.o
  CC [M]  drivers/video/fbdev/vga16fb.o
  CC      mm/mseal.o
  CC      drivers/acpi/x86/utils.o
  CC      net/ethtool/bitset.o
  LD [M]  sound/pci/rme9652/snd-hdsp.o
  CC [M]  drivers/gpio/gpio-tpic2810.o
  CC      lib/decompress_unxz.o
  LD [M]  sound/pci/rme9652/snd-hdspm.o
  CC      drivers/acpi/x86/blacklist.o
  CC [M]  crypto/echainiv.o
  CC [M]  sound/pci/ad1889.o
  CC [M]  net/sched/cls_fw.o
  CC      drivers/tty/serial/8250/8250_pcilib.o
  CC      drivers/gpu/drm/clients/drm_client_setup.o
  CC [M]  drivers/gpu/drm/tests/drm_format_test.o
  CC [M]  fs/nls/mac-celtic.o
  CC      drivers/iommu/intel/cache.o
  CC [M]  drivers/misc/cardreader/rtsx_pcr.o
  CC      drivers/xen/xen-acpi-pad.o
  CC      net/netfilter/nf_queue.o
  CC [M]  drivers/regulator/da903x-regulator.o
  CC      drivers/char/tpm/tpm2-sessions.o
  CC      drivers/acpi/acpica/nsdump.o
  CC      fs/ntfs3/super.o
  LD [M]  sound/soc/intel/atom/snd-soc-sst-atom-hifi2-platform.o
  CC      fs/ext4/xattr_trusted.o
  CC      drivers/iommu/intel/prq.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-rpl-match.o
  LD [M]  drivers/tty/serial/jsm/jsm.o
  CC [M]  drivers/gpu/drm/tests/drm_framebuffer_test.o
  CC      net/core/flow_offload.o
  AR      drivers/misc/pvpanic/built-in.a
  CC [M]  drivers/regulator/da9052-regulator.o
  CC [M]  drivers/misc/pvpanic/pvpanic.o
  CC      arch/x86/kernel/irq_work.o
  CC [M]  drivers/leds/leds-ti-lmu-common.o
  CC      lib/decompress_unzstd.o
  CC      fs/ntfs3/upcase.o
  CC [M]  fs/nls/mac-centeuro.o
  CC [M]  arch/x86/kvm/mmu/page_track.o
  CC      fs/btrfs/super.o
  CC [M]  fs/nls/mac-croatian.o
  CC [M]  crypto/ecdsa.o
  AR      net/ipv4/netfilter/built-in.a
  CC      net/xfrm/xfrm_policy.o
  CC [M]  net/ipv4/netfilter/nf_defrag_ipv4.o
  CC      drivers/acpi/acpica/nseval.o
  CC      drivers/iommu/iommufd/driver.o
  CC      drivers/pci/proc.o
  CC      kernel/trace/trace_printk.o
  CC [M]  drivers/gpio/gpio-tps65086.o
  CC      mm/page_alloc.o
  CC      drivers/xen/pcpu.o
  CC [M]  sound/pci/als300.o
  CC      drivers/char/tpm/tpm_ppi.o
  CC      fs/ext4/xattr_user.o
  CC      drivers/gpu/drm/clients/drm_fbdev_client.o
  CC      drivers/base/power/wakeup_stats.o
  CC      lib/dump_stack.o
  CC      kernel/events/uprobes.o
  AR      drivers/acpi/x86/built-in.a
  CC [M]  drivers/misc/cardreader/rts5209.o
  CC [M]  drivers/gpu/drm/tests/drm_gem_shmem_test.o
  CC [M]  net/ipv4/netfilter/nf_socket_ipv4.o
  CC      drivers/base/regmap/regcache-rbtree.o
  AR      drivers/video/fbdev/built-in.a
  CC      drivers/video/hdmi.o
  CC      drivers/acpi/acpica/nsinit.o
  CC [M]  fs/nls/mac-cyrillic.o
  CC [M]  net/ipv4/netfilter/nf_tproxy_ipv4.o
  CC      drivers/tty/serial/8250/8250_early.o
  CC      net/ethtool/strset.o
  CC [M]  drivers/regulator/da9055-regulator.o
  CC [M]  net/sched/cls_basic.o
  ASN.1   crypto/ecdsasignature.asn1.[ch]
  CC [M]  crypto/ecdsa-p1363.o
  CC [M]  arch/x86/kvm/mmu/spte.o
  CC      drivers/base/component.o
  CC [M]  net/ipv4/netfilter/nf_reject_ipv4.o
  CC      block/blk-wbt.o
  CC      arch/x86/kernel/probe_roms.o
  CC      net/ethtool/linkinfo.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-mtl-match.o
  CC      drivers/iommu/intel/trace.o
  CC [M]  drivers/gpio/gpio-tps65912.o
  CC [M]  drivers/leds/leds-tlc591xx.o
  CC [M]  drivers/misc/pvpanic/pvpanic-mmio.o
  CC      fs/ntfs3/xattr.o
  CC      fs/ntfs3/lib/decompress_common.o
  CC      fs/ext4/fast_commit.o
  CC      drivers/base/power/trace.o
  CC      drivers/xen/biomerge.o
  CC      drivers/acpi/acpica/nsload.o
  CC      drivers/pci/pci-sysfs.o
  CC      drivers/char/tpm/eventlog/acpi.o
  CC [M]  fs/nls/mac-gaelic.o
  CC [M]  sound/pci/als4000.o
  CC [M]  drivers/iommu/iommufd/device.o
  CC      drivers/tty/serial/8250/8250_dw.o
  CC      net/ethtool/linkmodes.o
  CC [M]  crypto/ecdsasignature.asn1.o
  AR      drivers/gpu/drm/clients/built-in.a
  CC      drivers/iommu/intel/svm.o
  CC      drivers/base/regmap/regcache-flat.o
  CC [M]  crypto/crypto_user.o
  CC [M]  drivers/gpio/gpio-tps68470.o
  CC [M]  drivers/misc/cardreader/rts5229.o
  CC [M]  drivers/regulator/da9062-regulator.o
  CC [M]  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.o
  CC      drivers/char/tpm/eventlog/efi.o
  CC [M]  drivers/misc/pvpanic/pvpanic-pci.o
  CC      net/netfilter/nf_sockopt.o
  CC [M]  drivers/misc/cardreader/rtl8411.o
  CC      drivers/iommu/iommu.o
  CC [M]  drivers/leds/leds-tps6105x.o
  CC      net/core/gro.o
  CC      drivers/acpi/acpica/nsnames.o
  CC      kernel/trace/pid_list.o
  CC      lib/earlycpio.o
  CC [M]  fs/nls/mac-greek.o
  CC [M]  drivers/misc/cardreader/rts5227.o
  CC      net/netfilter/utils.o
  CC [M]  net/sched/cls_flow.o
  CC      drivers/xen/xen-balloon.o
  CC      lib/extable.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-arl-match.o
  CC      drivers/video/display_timing.o
  CC [M]  net/sched/cls_cgroup.o
  CC      arch/x86/kernel/sys_ia32.o
  CC [M]  net/sched/cls_bpf.o
  CC      drivers/xen/sys-hypervisor.o
  CC [M]  sound/pci/cs4281.o
  CC      fs/ntfs3/lib/lzx_decompress.o
  CC      drivers/base/regmap/regcache-maple.o
  CC [M]  drivers/gpio/gpio-tqmx86.o
  CC      drivers/pci/slot.o
  CC      drivers/acpi/acpica/nsobject.o
  CC      arch/x86/kernel/signal_32.o
  CC      drivers/tty/serial/8250/8250_mid.o
  CC      drivers/char/tpm/tpm_tis_core.o
  CC      net/unix/af_unix.o
  CC      drivers/iommu/intel/irq_remapping.o
  CC [M]  drivers/regulator/da9210-regulator.o
  CC [M]  drivers/block/drbd/drbd_req.o
  CC      drivers/base/power/clock_ops.o
  CC [M]  arch/x86/kvm/mmu/tdp_iter.o
  CC      net/ethtool/rss.o
  CC [M]  drivers/gpio/gpio-twl4030.o
  CC [M]  fs/nls/mac-iceland.o
  CC      drivers/iommu/intel/perfmon.o
  CC [M]  drivers/leds/leds-wm831x-status.o
  CC      lib/flex_proportions.o
  LD [M]  sound/pci/snd-ad1889.o
  CC      drivers/video/videomode.o
  CC      fs/ntfs3/lib/xpress_decompress.o
  CC      drivers/base/regmap/regmap-debugfs.o
  CC [M]  crypto/cmac.o
  CC [M]  drivers/misc/cardreader/rts5249.o
  CC      kernel/trace/tracing_map.o
  CC [M]  drivers/video/vgastate.o
  CC      drivers/acpi/acpica/nsparse.o
  CC [M]  drivers/leds/leds-wm8350.o
  CC      block/blk-mq-debugfs.o
  CC      net/xfrm/xfrm_state.o
  CC [M]  drivers/iommu/iommufd/eventq.o
  CC      drivers/iommu/iommu-traces.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-lnl-match.o
  CC [M]  net/ipv4/netfilter/nf_nat_h323.o
  CC      net/xfrm/xfrm_hash.o
  CC      drivers/iommu/iommu-sysfs.o
  CC      lib/idr.o
  CC      drivers/xen/platform-pci.o
  AR      kernel/events/built-in.a
  CC [M]  fs/nls/mac-inuit.o
  CC      drivers/tty/serial/8250/8250_pci.o
  AR      fs/ntfs3/built-in.a
  CC      net/xfrm/xfrm_input.o
  CC [M]  arch/x86/kvm/mmu/tdp_mmu.o
  CC [M]  drivers/gpu/drm/tests/drm_managed_test.o
  LD [M]  sound/pci/snd-als300.o
  LD [M]  sound/pci/snd-als4000.o
  CC      fs/ext4/orphan.o
  LD [M]  sound/pci/snd-cs4281.o
  CC      drivers/base/core.o
  CC      net/unix/garbage.o
  CC [M]  drivers/misc/cardreader/rts5260.o
  CC [M]  drivers/gpio/gpio-twl6040.o
  CC      arch/x86/kernel/sys_x86_64.o
  CC [M]  drivers/regulator/da9211-regulator.o
  CC      drivers/acpi/acpica/nspredef.o
  CC [M]  crypto/xcbc.o
  CC [M]  drivers/gpu/drm/tests/drm_mm_test.o
  CC      kernel/trace/trace_sched_switch.o
  CC [M]  net/sched/cls_flower.o
  CC      drivers/pci/pci-acpi.o
  CC      kernel/trace/trace_functions.o
  CC      drivers/base/regmap/regmap-i2c.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ptl-match.o
  AR      drivers/base/power/built-in.a
  CC      kernel/trace/trace_preemptirq.o
  CC      net/ethtool/linkstate.o
  CC      lib/iomem_copy.o
  CC [M]  drivers/leds/leds-dac124s085.o
  CC [M]  fs/nls/mac-romanian.o
  CC [M]  crypto/md4.o
  CC      drivers/acpi/acpica/nsprepkg.o
  CC      block/sed-opal.o
  CC      net/netfilter/nf_bpf_link.o
  CC      drivers/xen/swiotlb-xen.o
  CC [M]  drivers/iommu/iommufd/hw_pagetable.o
  CC      block/blk-pm.o
  CC      lib/irq_regs.o
  CC      drivers/char/tpm/tpm_tis.o
  AR      drivers/iommu/intel/built-in.a
  CC      drivers/base/bus.o
  CC [M]  arch/x86/kvm/hyperv.o
  CC [M]  drivers/misc/cardreader/rts5261.o
  AR      drivers/video/built-in.a
  CC      arch/x86/kernel/espfix_64.o
  CC [M]  drivers/gpio/gpio-viperboard.o
  CC [M]  fs/nls/mac-roman.o
  CC [M]  drivers/gpu/drm/tests/drm_modes_test.o
  CC [M]  drivers/regulator/fan53555.o
  CC [M]  arch/x86/kvm/xen.o
  CC [M]  fs/nls/mac-turkish.o
  CC      net/core/netdev-genl.o
  CC      lib/is_single_threaded.o
  CC      fs/ext4/acl.o
  AR      drivers/misc/keba/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_plane_helper_test.o
  CC [M]  drivers/misc/keba/cp500.o
  CC      drivers/acpi/acpica/nsrepair.o
  CC [M]  drivers/leds/leds-spi-byte.o
  CC      net/ipv4/route.o
  CC      kernel/bpf/tnum.o
  CC      net/netfilter/nf_hooks_lwtunnel.o
  CC [M]  crypto/rmd160.o
  CC [M]  net/ipv4/netfilter/nf_nat_pptp.o
  CC      fs/ext4/xattr_security.o
  CC [M]  drivers/gpio/gpio-virtuser.o
  CC      net/xfrm/xfrm_output.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-hda-match.o
  CC [M]  drivers/block/drbd/drbd_actlog.o
  CC      drivers/base/regmap/regmap-spi.o
  CC      net/ethtool/debug.o
  CC      lib/klist.o
  CC [M]  drivers/gpio/gpio-virtio.o
  CC [M]  net/netfilter/nfnetlink.o
  CC      drivers/char/tpm/tpm_crb.o
  CC      net/xfrm/xfrm_sysctl.o
  CC [M]  fs/nls/nls_ucs2_utils.o
  CC [M]  drivers/iommu/iommufd/io_pagetable.o
  CC      drivers/tty/serial/8250/8250_rt288x.o
  CC [M]  drivers/misc/cardreader/rts5228.o
  CC      drivers/base/regmap/regmap-mmio.o
  CC      drivers/acpi/acpica/nsrepair2.o
  CC      mm/shuffle.o
  CC      arch/x86/kernel/ksysfs.o
  CC      drivers/xen/mcelog.o
  CC      mm/page_frag_cache.o
  CC [M]  arch/x86/kvm/smm.o
  CC      drivers/pci/iomap.o
  CC [M]  drivers/gpu/drm/tests/drm_probe_helper_test.o
  CC [M]  drivers/regulator/gpio-regulator.o
  CC      lib/kobject.o
  CC [M]  drivers/leds/uleds.o
  CC      kernel/trace/trace_sched_wakeup.o
  CC [M]  drivers/gpio/gpio-vx855.o
  CC      net/unix/sysctl_net_unix.o
  CC      fs/btrfs/ctree.o
  CC      drivers/tty/serial/serial_core.o
  CC [M]  crypto/sm3.o
  CC      fs/ext4/verity.o
  CC      drivers/acpi/acpica/nssearch.o
  CC      drivers/base/regmap/regmap-irq.o
  CC      net/xfrm/xfrm_replay.o
  CC [M]  drivers/gpio/gpio-wcove.o
  AR      sound/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_rect_test.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.o
  CC      arch/x86/kernel/bootflag.o
  CC [M]  drivers/char/tpm/tpm_tis_spi_main.o
  ASN.1   net/ipv4/netfilter/nf_nat_snmp_basic.asn1.[ch]
  CC [M]  net/ipv4/netfilter/nft_reject_ipv4.o
  CC [M]  drivers/misc/cardreader/rts5264.o
  CC      drivers/base/dd.o
  CC      net/ethtool/wol.o
  CC      drivers/xen/xen-acpi-processor.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ssp-common.o
  CC      block/blk-crypto.o
  CC [M]  drivers/char/tpm/tpm_tis_spi_cr50.o
  CC      net/core/netdev-genl-gen.o
  AR      drivers/gpu/drm/display/built-in.a
  CC [M]  drivers/gpu/drm/display/drm_display_helper_mod.o
  CC      drivers/acpi/acpica/nsutils.o
  CC      kernel/bpf/log.o
  CC [M]  drivers/regulator/isl6271a-regulator.o
  AR      fs/nls/built-in.a
  CC      net/xfrm/xfrm_device.o
  CC [M]  drivers/char/tpm/tpm_tis_i2c_cr50.o
  CC [M]  drivers/tty/serial/8250/8250_exar.o
  CC [M]  crypto/sm3_generic.o
  CC [M]  drivers/iommu/iommufd/ioas.o
  AR      drivers/leds/built-in.a
  CC      block/blk-crypto-profile.o
  CC      kernel/bpf/token.o
  CC      kernel/trace/trace_hwlat.o
  CC      lib/kobject_uevent.o
  CC      drivers/pci/quirks.o
  CC [M]  drivers/gpio/gpio-winbond.o
  CC [M]  drivers/gpio/gpio-wm831x.o
  CC      arch/x86/kernel/e820.o
  CC      net/unix/unix_bpf.o
  CC      fs/ext4/crypto.o
  CC      mm/init-mm.o
  CC      arch/x86/kernel/pci-dma.o
  CC      drivers/pci/ats.o
  CC [M]  net/sched/cls_matchall.o
  CC [M]  drivers/gpu/drm/display/drm_bridge_connector.o
  CC      drivers/acpi/acpica/nswalk.o
  CC [M]  drivers/base/regmap/regmap-slimbus.o
  CC [M]  crypto/streebog_generic.o
  CC [M]  net/sched/em_cmp.o
  CC [M]  drivers/misc/cardreader/rtsx_usb.o
  CC [M]  drivers/block/drbd/drbd_main.o
  CC      drivers/acpi/acpica/nsxfeval.o
  CC      drivers/xen/efi.o
  CC [M]  net/netfilter/nfnetlink_acct.o
  CC      net/ethtool/features.o
  CC      net/core/gso.o
  CC [M]  drivers/regulator/isl9305.o
  CC [M]  net/ipv4/netfilter/nft_fib_ipv4.o
  CC      drivers/tty/n_tty.o
  CC [M]  drivers/char/tpm/tpm_tis_i2c.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-sdca-quirks.o
  CC [M]  drivers/tty/serial/8250/8250_lpss.o
  CC      fs/btrfs/extent-tree.o
  CC [M]  net/unix/diag.o
  CC      drivers/xen/xlate_mmu.o
  CC      mm/memblock.o
  CC [M]  drivers/iommu/iommufd/main.o
  CC      drivers/char/random.o
  CC [M]  drivers/gpu/drm/display/drm_dp_dual_mode_helper.o
  CC      block/blk-crypto-sysfs.o
  CC [M]  arch/x86/kvm/kvm_onhyperv.o
  CC [M]  net/ipv4/netfilter/nft_dup_ipv4.o
  CC      drivers/mfd/88pm860x-core.o
  CC [M]  drivers/gpio/gpio-wm8350.o
  AR      drivers/nfc/built-in.a
  CC      fs/btrfs/print-tree.o
  AR      fs/ext4/built-in.a
  CC      kernel/trace/trace_osnoise.o
  CC [M]  drivers/char/tpm/tpm_i2c_atmel.o
  CC      drivers/tty/tty_ioctl.o
  CC [M]  crypto/wp512.o
  CC [M]  net/netfilter/nfnetlink_queue.o
  CC [M]  drivers/gpio/gpio-wm8994.o
  CC      drivers/acpi/acpica/nsxfname.o
  CC [M]  drivers/base/regmap/regmap-spmi.o
  CC      fs/pstore/inode.o
  LD [M]  sound/soc/intel/common/snd-soc-acpi-intel-match.o
  CC [M]  drivers/regulator/lm363x-regulator.o
  CC [M]  drivers/char/tpm/tpm_i2c_infineon.o
  CC      fs/efivarfs/inode.o
  CC [M]  net/ipv4/netfilter/ip_tables.o
  CC      drivers/char/ttyprintk.o
  CC [M]  net/sched/em_nbyte.o
  CC      block/blk-crypto-fallback.o
  CC [M]  drivers/tty/serial/8250/8250_men_mcb.o
  CC [M]  drivers/block/drbd/drbd_strings.o
  CC [M]  drivers/block/drbd/drbd_nl.o
  CC      net/ethtool/privflags.o
  CC      fs/efivarfs/file.o
  CC      net/xfrm/xfrm_nat_keepalive.o
  CC      fs/efivarfs/super.o
  LD [M]  drivers/misc/cardreader/rtsx_pci.o
  CC [M]  drivers/block/mtip32xx/mtip32xx.o
  CC [M]  drivers/misc/ibmasm/module.o
  CC      lib/logic_pio.o
  CC      arch/x86/kernel/quirks.o
  LD [M]  sound/soc/intel/common/snd-soc-acpi-intel-sdca-quirks.o
  CC [M]  net/ipv4/netfilter/iptable_filter.o
  CC      block/holder.o
  AR      net/unix/built-in.a
  LD [M]  net/unix/unix_diag.o
  CC [M]  crypto/pcbc.o
  CC [M]  sound/soc/sdca/sdca_functions.o
  CC [M]  drivers/block/drbd/drbd_interval.o
  CC [M]  sound/sound_core.o
  CC [M]  drivers/gpio/gpio-ws16c48.o
  CC [M]  drivers/iommu/iommufd/pages.o
  CC      mm/memory_hotplug.o
  CC      drivers/acpi/acpica/nsxfobj.o
  CC      mm/slub.o
  CC      drivers/xen/unpopulated-alloc.o
  CC [M]  drivers/acpi/nfit/core.o
  CC [M]  drivers/gpu/drm/display/drm_dp_helper.o
  CC      kernel/bpf/bpf_iter.o
  CC [M]  drivers/regulator/lp3971.o
  CC      drivers/iommu/dma-iommu.o
  CC [M]  drivers/tty/serial/8250/8250_pci1xxxx.o
  CC      drivers/base/syscore.o
  CC      fs/pstore/platform.o
  CC [M]  drivers/misc/sgi-xp/xp_main.o
  CC [M]  arch/x86/kvm/vmx/vmx.o
  CC      drivers/nvdimm/core.o
  CC [M]  drivers/base/regmap/regmap-w1.o
  CC [M]  drivers/misc/sgi-gru/grufile.o
  CC [M]  drivers/char/tpm/tpm_i2c_nuvoton.o
  CC      net/core/net-sysfs.o
  CC      drivers/mfd/88pm860x-i2c.o
  CC      lib/maple_tree.o
  CC [M]  net/sched/em_u32.o
  CC [M]  drivers/misc/c2port/core.o
  CC [M]  drivers/misc/ibmasm/ibmasmfs.o
  CC [M]  drivers/misc/altera-stapl/altera-jtag.o
  CC [M]  crypto/lrw.o
  CC [M]  drivers/misc/vmw_vmci/vmci_context.o
  CC [M]  drivers/misc/mei/hdcp/mei_hdcp.o
  CC      drivers/pci/iov.o
  CC      net/ethtool/rings.o
  CC      fs/efivarfs/vars.o
  CC [M]  drivers/gpio/gpio-xra1403.o
  CC [M]  drivers/misc/genwqe/card_base.o
  CC [M]  drivers/misc/echo/echo.o
  CC      drivers/acpi/acpica/psargs.o
  CC      drivers/xen/grant-dma-ops.o
  CC [M]  block/kyber-iosched.o
  CC      mm/madvise.o
  CC      arch/x86/kernel/kdebugfs.o
  CC [M]  drivers/regulator/lp3972.o
  CC [M]  drivers/misc/altera-stapl/altera-comp.o
  CC [M]  drivers/tty/serial/8250/8250_pericom.o
  CC      drivers/mfd/wm8400-core.o
  CC      kernel/trace/trace_nop.o
  CC [M]  drivers/misc/altera-stapl/altera.o
  CC [M]  net/netfilter/nfnetlink_log.o
  CC [M]  crypto/xctr.o
  CC [M]  drivers/misc/sgi-xp/xp_uv.o
  CC [M]  drivers/char/tpm/tpm_nsc.o
  CC [M]  drivers/base/regmap/regmap-i3c.o
  CC      kernel/bpf/map_iter.o
  CC [M]  net/sched/em_meta.o
  CC [M]  drivers/misc/sgi-gru/grumain.o
  CC [M]  drivers/misc/ibmasm/event.o
  CC      drivers/acpi/acpica/psloop.o
  CC      net/xfrm/xfrm_proc.o
  CC      fs/pstore/pmsg.o
  AR      fs/efivarfs/built-in.a
  CC      drivers/nvdimm/bus.o
  CC [M]  sound/soc/sdca/sdca_device.o
  CC [M]  drivers/iommu/iommufd/vfio_compat.o
  CC [M]  drivers/misc/mei/pxp/mei_pxp.o
  CC [M]  drivers/misc/ibmasm/command.o
  CC [M]  drivers/xen/evtchn.o
  CC      net/ethtool/channels.o
  CC [M]  drivers/misc/c2port/c2port-duramar2150.o
  CC      drivers/iommu/io-pgtable.o
  CC [M]  drivers/misc/genwqe/card_dev.o
  AR      drivers/gpio/built-in.a
  CC      drivers/iommu/iova.o
  CC [M]  net/ipv4/netfilter/iptable_mangle.o
  CC [M]  crypto/hctr2.o
  CC      fs/btrfs/root-tree.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_dev.o
  CC [M]  drivers/regulator/lp872x.o
  AR      drivers/tty/serial/8250/built-in.a
  CC      drivers/acpi/acpica/psobject.o
  CC      drivers/tty/serial/serial_base_bus.o
  CC      net/xfrm/espintcp.o
  CC [M]  drivers/misc/sgi-xp/xpc_main.o
  CC      drivers/pci/pci-label.o
  CC [M]  drivers/misc/vmw_vmci/vmci_datagram.o
  CC      arch/x86/kernel/alternative.o
  CC [M]  fs/pstore/ram.o
  CC [M]  drivers/gpu/drm/display/drm_dp_mst_topology.o
  CC      kernel/trace/trace_stack.o
  CC [M]  drivers/char/tpm/tpm_atmel.o
  CC      drivers/tty/serial/serial_ctrl.o
  CC [M]  drivers/misc/sgi-xp/xpc_channel.o
  CC [M]  drivers/block/drbd/drbd_state.o
  CC [M]  drivers/misc/ibmasm/remote.o
  CC      kernel/bpf/task_iter.o
  CC      kernel/trace/trace_mmiotrace.o
  CC      drivers/iommu/irq_remapping.o
  CC [M]  block/bfq-iosched.o
  CC [M]  drivers/misc/mei/gsc_proxy/mei_gsc_proxy.o
  CC      drivers/mfd/wm831x-core.o
  CC      drivers/acpi/acpica/psopcode.o
  CC [M]  sound/soc/sdca/sdca_regmap.o
  CC      net/ipv4/inetpeer.o
  CC [M]  drivers/xen/gntdev.o
  CC [M]  drivers/misc/sgi-gru/grufault.o
  CC      drivers/tty/serial/serial_port.o
  CC [M]  drivers/base/regmap/regmap-spi-avmm.o
  CC [M]  crypto/adiantum.o
  CC [M]  net/xfrm/xfrm_algo.o
  CC      drivers/pci/p2pdma.o
  CC [M]  drivers/misc/genwqe/card_ddcb.o
  CC [M]  net/ipv4/netfilter/iptable_nat.o
  CC [M]  net/sched/em_text.o
  CC [M]  drivers/acpi/nfit/intel.o
  CC      drivers/mfd/wm831x-irq.o
  CC      net/ethtool/coalesce.o
  CC [M]  drivers/regulator/lp8788-buck.o
  CC [M]  net/netfilter/nfnetlink_osf.o
  CC [M]  drivers/iommu/iommufd/viommu.o
  CC [M]  drivers/char/tpm/tpm_infineon.o
  CC      kernel/trace/trace_functions_graph.o
  CC      drivers/acpi/acpica/psopinfo.o
  CC [M]  fs/pstore/ram_core.o
  CC [M]  drivers/misc/altera-stapl/altera-lpt.o
  CC [M]  drivers/misc/vmw_vmci/vmci_doorbell.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_msg.o
  CC [M]  drivers/misc/ibmasm/heartbeat.o
  CC      kernel/fork.o
  CC      net/core/hotdata.o
  CC      fs/btrfs/dir-item.o
  CC      drivers/acpi/acpica/psparse.o
  CC [M]  drivers/misc/sgi-gru/grutlbpurge.o
  CC [M]  drivers/misc/sgi-xp/xpc_partition.o
  CC [M]  drivers/misc/mei/init.o
  CC      drivers/nvdimm/dimm_devs.o
  AR      drivers/gpu/drm/renesas/rcar-du/built-in.a
  AR      drivers/gpu/drm/renesas/rz-du/built-in.a
  AR      drivers/gpu/drm/renesas/built-in.a
  CC [M]  sound/ac97_bus.o
  LD [M]  drivers/misc/altera-stapl/altera-stapl.o
  CC      drivers/acpi/acpica/psscope.o
  CC [M]  drivers/misc/sgi-xp/xpc_uv.o
  CC [M]  drivers/misc/sgi-xp/xpnet.o
  CC [M]  crypto/nhpoly1305.o
  AR      drivers/iommu/iommufd/built-in.a
  LD [M]  sound/soc/sdca/snd-soc-sdca.o
  LD [M]  drivers/iommu/iommufd/iommufd.o
  CC [M]  drivers/misc/sgi-gru/gruprocfs.o
  CC      drivers/iommu/hyperv-iommu.o
  CC [M]  drivers/regulator/lp8788-ldo.o
  CC [M]  drivers/acpi/nfit/mce.o
  CC      kernel/bpf/prog_iter.o
  CC      drivers/iommu/virtio-iommu.o
  CC      drivers/tty/serial/earlycon.o
  CC [M]  drivers/misc/uacce/uacce.o
  CC [M]  drivers/misc/ibmasm/r_heartbeat.o
  CC      drivers/char/misc.o
  CC [M]  drivers/xen/gntdev-dmabuf.o
  CC      drivers/mfd/wm831x-otp.o
  CC      drivers/acpi/acpica/pstree.o
  CC [M]  drivers/misc/genwqe/card_sysfs.o
  CC [M]  drivers/char/tpm/xen-tpmfront.o
  CC [M]  net/sched/em_ipt.o
  CC [M]  drivers/misc/ibmasm/dot_command.o
  CC [M]  sound/soc/soc-acpi.o
  CC [M]  fs/pstore/zone.o
  CC      net/ethtool/pause.o
  AR      drivers/base/regmap/built-in.a
  CC      drivers/base/driver.o
  CC [M]  net/ipv4/netfilter/iptable_raw.o
  CC      drivers/mfd/wm831x-auxadc.o
  CC [M]  drivers/misc/genwqe/card_debugfs.o
  CC [M]  fs/netfs/buffered_read.o
  CC      arch/x86/kernel/i8253.o
  CC [M]  drivers/misc/vmw_vmci/vmci_driver.o
  CC      fs/btrfs/file-item.o
  CC [M]  drivers/char/tpm/tpm_vtpm_proxy.o
  CC      kernel/trace/blktrace.o
  CC      drivers/acpi/acpica/psutils.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_sg.o
  CC      mm/page_io.o
  CC      drivers/pci/vgaarb.o
  CC [M]  drivers/misc/mei/hbm.o
  CC [M]  drivers/block/zram/zcomp.o
  CC [M]  drivers/regulator/lp8755.o
  CC [M]  drivers/misc/ibmasm/lowlevel.o
  CC      drivers/tty/serial/max310x.o
  CC [M]  drivers/block/zram/zram_drv.o
  CC [M]  drivers/block/drbd/drbd_nla.o
  CC [M]  fs/netfs/buffered_write.o
  CC [M]  drivers/misc/sgi-gru/grukservices.o
  LD [M]  drivers/acpi/nfit/nfit.o
  CC      drivers/nvdimm/nd_perf.o
  CC [M]  net/xfrm/xfrm_user.o
  LD [M]  drivers/misc/sgi-xp/xp.o
  LD [M]  drivers/misc/sgi-xp/xpc.o
  CC [M]  drivers/regulator/ltc3589.o
  CC      net/ipv4/protocol.o
  CC [M]  crypto/ccm.o
  CC      kernel/bpf/link_iter.o
  CC [M]  crypto/chacha20poly1305.o
  CC      drivers/iommu/iommu-sva.o
  CC      drivers/acpi/acpica/pswalk.o
  CC [M]  drivers/xen/gntalloc.o
  CC      net/core/netdev_rx_queue.o
  CC      arch/x86/kernel/hw_breakpoint.o
  CC      drivers/nvdimm/dimm.o
  CC [M]  drivers/regulator/ltc3676.o
  CC [M]  drivers/misc/genwqe/card_utils.o
  CC      net/ethtool/eee.o
  CC [M]  drivers/regulator/max14577-regulator.o
  CC      drivers/base/class.o
  CC      net/ipv4/ip_input.o
  CC [M]  sound/soc/soc-core.o
  CC [M]  net/netfilter/nfnetlink_hook.o
  CC [M]  net/ipv4/netfilter/iptable_security.o
  CC [M]  drivers/misc/vmw_vmci/vmci_event.o
  CC [M]  drivers/misc/ibmasm/uart.o
  CC [M]  net/ipv4/netfilter/ipt_ah.o
  CC [M]  sound/soc/soc-dapm.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_tty.o
  CC      drivers/mfd/wm831x-i2c.o
  LD [M]  drivers/char/tpm/tpm_tis_spi.o
  AR      drivers/char/tpm/built-in.a
  CC      drivers/char/virtio_console.o
  CC      drivers/acpi/acpica/psxface.o
  AR      net/sched/built-in.a
  CC      net/core/page_pool.o
  CC [M]  net/xfrm/xfrm_compat.o
  CC [M]  fs/pstore/blk.o
  CC [M]  drivers/block/drbd/drbd_debugfs.o
  LD [M]  fs/pstore/ramoops.o
  CC      drivers/iommu/io-pgfault.o
  CC      lib/memcat_p.o
  CC      drivers/char/hpet.o
  CC      mm/swap_state.o
  CC [M]  crypto/aegis128-core.o
  CC      drivers/acpi/acpica/rsaddr.o
  CC      kernel/bpf/hashtab.o
  CC [M]  drivers/gpu/drm/display/drm_dp_tunnel.o
  CC      drivers/tty/serial/sccnxp.o
  CC [M]  drivers/xen/privcmd.o
  CC      net/ipv4/ip_fragment.o
  CC      fs/btrfs/inode-item.o
  CC [M]  drivers/char/uv_mmtimer.o
  LD [M]  drivers/misc/ibmasm/ibmasm.o
  CC [M]  drivers/regulator/max1586.o
  CC [M]  drivers/misc/mei/interrupt.o
  CC      mm/swapfile.o
  CC [M]  drivers/misc/mei/client.o
  CC [M]  drivers/block/zram/backend_lzorle.o
  CC      drivers/base/platform.o
  CC      drivers/pci/doe.o
  CC      net/ethtool/tsinfo.o
  LD [M]  drivers/misc/bcm-vk/bcm_vk.o
  CC [M]  drivers/gpu/drm/display/drm_dsc_helper.o
  CC      drivers/mfd/wm831x-spi.o
  CC      drivers/nvdimm/region_devs.o
  CC      drivers/base/cpu.o
  LD [M]  drivers/misc/genwqe/genwqe_card.o
  CC      net/ipv4/ip_forward.o
  CC      drivers/acpi/acpica/rscalc.o
  CC [M]  drivers/misc/vmw_vmci/vmci_guest.o
  CC [M]  block/bfq-wf2q.o
  CC [M]  net/ipv4/netfilter/ipt_rpfilter.o
  CC [M]  fs/netfs/direct_read.o
  LD [M]  sound/soundcore.o
  CC [M]  drivers/misc/sgi-gru/gruhandles.o
  CC      arch/x86/kernel/tsc.o
  CC [M]  net/netfilter/nf_conntrack_core.o
  AR      net/ipv6/netfilter/built-in.a
  CC      lib/min_heap.o
  CC [M]  net/ipv6/netfilter/ip6_tables.o
  CC [M]  net/netfilter/nf_conntrack_standalone.o
  CC [M]  drivers/block/zram/backend_lzo.o
  CC [M]  net/ipv6/ila/ila_main.o
  CC      net/ethtool/cabletest.o
  CC [M]  drivers/regulator/max77503-regulator.o
  CC [M]  crypto/pcrypt.o
  CC [M]  fs/netfs/direct_write.o
  CC      kernel/trace/fgraph.o
  CC [M]  drivers/char/lp.o
  CC [M]  crypto/cryptd.o
  CC      mm/zswap.o
  LD [M]  fs/pstore/pstore_zone.o
  LD [M]  fs/pstore/pstore_blk.o
  AR      fs/pstore/built-in.a
  CC      drivers/acpi/acpica/rscreate.o
  CC      drivers/mfd/wm8350-core.o
  LD [M]  drivers/block/zram/zram.o
  CC [M]  net/ipv6/netfilter/ip6table_filter.o
  CC      net/packet/af_packet.o
  CC      lib/nmi_backtrace.o
  AR      drivers/iommu/built-in.a
  CC [M]  drivers/misc/sgi-gru/grukdump.o
  CC      drivers/tty/serial/serial_mctrl_gpio.o
  CC [M]  fs/netfs/iterator.o
  CC [M]  drivers/pci/pci-stub.o
  CC      fs/btrfs/disk-io.o
  CC [M]  fs/netfs/locking.o
  LD [M]  drivers/block/drbd/drbd.o
  CC [M]  drivers/block/null_blk/main.o
  CC [M]  fs/netfs/main.o
  CC [M]  drivers/block/null_blk/trace.o
  CC [M]  block/bfq-cgroup.o
  CC [M]  net/ipv4/netfilter/ipt_ECN.o
  CC [M]  net/netfilter/nf_conntrack_expect.o
  CC [M]  drivers/regulator/max77541-regulator.o
  CC      kernel/exec_domain.o
  CC      arch/x86/kvm/kvm-asm-offsets.s
  CC [M]  net/ipv6/ila/ila_common.o
  CC      drivers/nvdimm/region.o
  CC [M]  sound/soc/soc-jack.o
  CC      drivers/base/firmware.o
  CC [M]  drivers/misc/vmw_vmci/vmci_handle_array.o
  CC      lib/objpool.o
  CC      drivers/acpi/acpica/rsdumpinfo.o
  CC [M]  net/netfilter/nf_conntrack_helper.o
  CC      net/core/page_pool_user.o
  CC [M]  drivers/char/applicom.o
  CC [M]  drivers/xen/privcmd-buf.o
  CC [M]  drivers/pci/pci-pf-stub.o
  CC      net/ethtool/tunnels.o
  LD [M]  drivers/misc/sgi-gru/gru.o
  CC [M]  drivers/misc/mei/main.o
  CC      drivers/block/loop.o
  CC      arch/x86/kernel/tsc_msr.o
  CC      kernel/trace/trace_events.o
  CC [M]  net/netfilter/nf_conntrack_proto.o
  CC      kernel/bpf/arraymap.o
  CC      arch/x86/kernel/io_delay.o
  CC      arch/x86/kernel/rtc.o
  CC [M]  net/xfrm/xfrm_ipcomp.o
  CC      drivers/acpi/acpica/rsinfo.o
  CC [M]  crypto/des_generic.o
  CC      arch/x86/kernel/resource.o
  CC [M]  drivers/misc/vmw_vmci/vmci_host.o
  CC [M]  drivers/regulator/max8649.o
  CC      drivers/tty/serial/kgdboc.o
  CC      drivers/mfd/wm8350-regmap.o
  CC [M]  drivers/gpu/drm/display/drm_hdcp_helper.o
  CC [M]  crypto/fcrypt.o
  CC [M]  net/packet/diag.o
  CC [M]  arch/x86/kvm/vmx/pmu_intel.o
  CC [M]  drivers/char/nvram.o
  CC      drivers/acpi/acpica/rsio.o
  CC [M]  drivers/tty/serial/altera_jtaguart.o
  CC      drivers/block/nbd.o
  LD [M]  block/bfq.o
  AR      block/built-in.a
  CC      drivers/mfd/wm8350-gpio.o
  CC      lib/plist.o
  CC [M]  net/netfilter/nf_conntrack_proto_generic.o
  CC      drivers/nvdimm/namespace_devs.o
  CC [M]  drivers/xen/xen-scsiback.o
  CC      drivers/dax/hmem/device.o
  CC [M]  net/ipv4/netfilter/ipt_REJECT.o
  CC [M]  drivers/pci/xen-pcifront.o
  CC      drivers/base/init.o
  CC      lib/radix-tree.o
  CC [M]  fs/nfs/blocklayout/blocklayout.o
  CC [M]  fs/nfs/filelayout/filelayout.o
  CC [M]  net/ipv6/ila/ila_lwt.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_audio_helper.o
  CC [M]  fs/nfs/filelayout/filelayoutdev.o
  CC      drivers/tty/tty_ldisc.o
  CC      drivers/acpi/acpica/rsirq.o
  CC      drivers/tty/tty_buffer.o
  CC      net/ipv6/af_inet6.o
  CC      mm/dmapool.o
  CC      net/ipv6/anycast.o
  CC      net/core/net-procfs.o
  CC [M]  drivers/regulator/max8660.o
  CC [M]  crypto/blowfish_generic.o
  CC [M]  drivers/misc/vmw_vmci/vmci_queue_pair.o
  CC      net/ethtool/fec.o
  CC [M]  sound/soc/soc-utils.o
  CC [M]  fs/netfs/misc.o
  CC [M]  net/ipv6/netfilter/ip6table_mangle.o
  AS      arch/x86/kernel/irqflags.o
  CC [M]  drivers/tty/serial/altera_uart.o
  CC [M]  drivers/block/null_blk/zoned.o
  CC      drivers/acpi/acpica/rslist.o
  CC      drivers/base/map.o
  CC [M]  drivers/misc/mei/dma-ring.o
  CC      arch/x86/kernel/static_call.o
  CC [M]  drivers/misc/mei/bus.o
  CC      kernel/bpf/percpu_freelist.o
  CC      fs/btrfs/transaction.o
  CC [M]  drivers/char/ppdev.o
  CC      drivers/dax/super.o
  CC [M]  drivers/dax/hmem/hmem.o
  CC [M]  drivers/char/tlclk.o
  CC      net/ipv6/ip6_output.o
  CC [M]  net/ipv4/netfilter/ipt_SYNPROXY.o
  AR      drivers/pci/built-in.a
  CC      drivers/tty/tty_port.o
  AR      drivers/gpu/drm/omapdrm/built-in.a
  CC      drivers/acpi/acpica/rsmemory.o
  CC [M]  drivers/misc/vmw_vmci/vmci_resource.o
  CC      drivers/mfd/wm8350-irq.o
  CC [M]  arch/x86/kvm/vmx/vmcs12.o
  CC      drivers/dax/bus.o
  CC [M]  net/ipv6/ila/ila_xlat.o
  CC      kernel/panic.o
  CC [M]  crypto/blowfish_common.o
  CC [M]  fs/nfs/flexfilelayout/flexfilelayout.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_cec_helper.o
  CC      drivers/base/devres.o
  CC [M]  drivers/regulator/max8893.o
  CC [M]  drivers/xen/pvcalls-front.o
  CC [M]  net/xfrm/xfrm_interface_core.o
  CC      kernel/bpf/bpf_lru_list.o
  CC [M]  fs/nfs/flexfilelayout/flexfilelayoutdev.o
  CC      net/core/netpoll.o
  CC [M]  drivers/tty/serial/arc_uart.o
  CC      mm/hugetlb.o
  CC      fs/btrfs/inode.o
  CC      net/ethtool/eeprom.o
  CC [M]  fs/nfs/blocklayout/dev.o
  CC      drivers/acpi/acpica/rsmisc.o
  CC      lib/ratelimit.o
  CC      net/core/fib_rules.o
  CC      net/core/net-traces.o
  CC [M]  net/netfilter/nf_conntrack_proto_tcp.o
  CC [M]  sound/soc/soc-dai.o
  AR      drivers/dax/hmem/built-in.a
  LD [M]  drivers/dax/hmem/dax_hmem.o
  CC [M]  net/netfilter/nf_conntrack_proto_udp.o
  CC      net/devlink/core.o
  CC [M]  net/ipv6/netfilter/ip6table_raw.o
  CC      arch/x86/kernel/process.o
  LD [M]  drivers/block/null_blk/null_blk.o
  LD [M]  fs/nfs/filelayout/nfs_layout_nfsv41_files.o
  CC      kernel/trace/trace_export.o
  AR      net/dsa/built-in.a
  CC      net/strparser/strparser.o
  CC [M]  drivers/tty/serial/fsl_linflexuart.o
  CC      kernel/trace/trace_syscalls.o
  CC [M]  drivers/char/hangcheck-timer.o
  CC      drivers/mfd/wm8350-i2c.o
  CC      kernel/bpf/lpm_trie.o
  CC [M]  fs/netfs/objects.o
  CC      drivers/block/virtio_blk.o
  CC      lib/rbtree.o
  CC [M]  arch/x86/kvm/vmx/nested.o
  LD [M]  net/packet/af_packet_diag.o
  AR      net/packet/built-in.a
  CC      drivers/acpi/acpica/rsserial.o
  CC      drivers/nvdimm/label.o
  CC      kernel/bpf/map_in_map.o
  AR      drivers/gpu/drm/tilcdc/built-in.a
  CC [M]  drivers/regulator/max8907-regulator.o
  CC [M]  fs/lockd/clntlock.o
  CC      kernel/trace/trace_event_perf.o
  CC [M]  crypto/twofish_generic.o
  CC [M]  net/ipv4/netfilter/arp_tables.o
  CC [M]  drivers/misc/mei/bus-fixup.o
  CC [M]  fs/netfs/read_collect.o
  CC      drivers/acpi/acpica/rsutils.o
  CC [M]  drivers/misc/vmw_vmci/vmci_route.o
  CC [M]  drivers/tty/serial/fsl_lpuart.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.o
  CC [M]  fs/lockd/clntproc.o
  CC [M]  fs/netfs/read_pgpriv2.o
  CC      lib/seq_buf.o
  AR      drivers/char/built-in.a
  CC [M]  drivers/tty/serial/lantiq.o
  CC      net/ethtool/stats.o
  CC      drivers/mfd/tps65910.o
  CC      net/core/drop_monitor.o
  CC [M]  drivers/dax/device.o
  CC      drivers/base/attribute_container.o
  LD [M]  drivers/misc/vmw_vmci/vmw_vmci.o
  CC [M]  drivers/misc/mei/debugfs.o
  LD [M]  net/ipv6/ila/ila.o
  CC [M]  fs/smb/common/cifs_arc4.o
  CC      drivers/mfd/tps65912-core.o
  CC [M]  fs/smb/client/trace.o
  CC [M]  fs/smb/common/cifs_md4.o
  CC [M]  drivers/misc/mei/mei-trace.o
  CC [M]  drivers/regulator/max8925-regulator.o
  CC [M]  drivers/regulator/max8952.o
  CC      net/devlink/netlink.o
  CC [M]  net/ipv6/netfilter/ip6table_security.o
  CC [M]  sound/soc/soc-component.o
  CC [M]  fs/nfs/blocklayout/extent_tree.o
  CC [M]  fs/nfs/blocklayout/rpc_pipefs.o
  CC      drivers/acpi/acpica/rsxface.o
  CC [M]  crypto/twofish_common.o
  LD [M]  net/xfrm/xfrm_interface.o
  AR      net/xfrm/built-in.a
  CC      kernel/bpf/bloom_filter.o
  CC      drivers/dma-buf/heaps/system_heap.o
  CC      drivers/block/xen-blkfront.o
  CC      drivers/cxl/core/suspend.o
  CC [M]  net/netfilter/nf_conntrack_proto_icmp.o
  CC      net/ipv4/ip_options.o
  CC      drivers/dma-buf/dma-buf.o
  CC      drivers/acpi/tables.o
  CC [M]  drivers/xen/xen-front-pgdir-shbuf.o
  CC [M]  drivers/dax/kmem.o
  CC      drivers/nvdimm/badrange.o
  CC      drivers/acpi/acpica/tbdata.o
  CC      kernel/trace/trace_events_filter.o
  LD [M]  fs/nfs/flexfilelayout/nfs_layout_flexfiles.o
  CC      net/ipv6/ip6_input.o
  AR      net/strparser/built-in.a
  CC [M]  net/netfilter/nf_conntrack_extend.o
  CC      lib/siphash.o
  CC      arch/x86/kernel/ptrace.o
  CC [M]  net/netfilter/nf_conntrack_acct.o
  CC [M]  drivers/regulator/max8997-regulator.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_helper.o
  CC [M]  drivers/gpu/drm/display/drm_scdc_helper.o
  CC [M]  net/netfilter/nf_conntrack_seqadj.o
  CC      drivers/mfd/tps65912-i2c.o
  CC      net/devlink/netlink_gen.o
  CC      drivers/base/transport_class.o
  CC      drivers/dma-buf/dma-fence.o
  CC      net/ipv4/ip_output.o
  CC [M]  crypto/serpent_generic.o
  AR      drivers/dma-buf/heaps/built-in.a
  CC      mm/hugetlb_vmemmap.o
  CC      kernel/bpf/local_storage.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.o
  CC [M]  net/ipv6/netfilter/ip6table_nat.o
  CC [M]  drivers/tty/serial/max3100.o
  CC [M]  fs/smb/client/cifsfs.o
  CC [M]  drivers/dax/pmem.o
  LD [M]  fs/nfs/blocklayout/blocklayoutdriver.o
  CC [M]  fs/nfs/client.o
  CC [M]  drivers/dax/cxl.o
  CC      lib/string.o
  CC      net/ethtool/phc_vclocks.o
  CC      drivers/acpi/acpica/tbfadt.o
  CC [M]  fs/netfs/read_retry.o
  CC [M]  drivers/cxl/core/port.o
  CC [M]  drivers/misc/mei/pci-me.o
  CC [M]  net/ipv4/netfilter/arpt_mangle.o
  CC      drivers/mfd/tps65912-spi.o
  CC [M]  sound/soc/soc-pcm.o
  CC [M]  fs/lockd/clntxdr.o
  CC [M]  net/netfilter/nf_conntrack_proto_icmpv6.o
  CC [M]  fs/smb/client/cifs_debug.o
  CC      arch/x86/kernel/tls.o
  CC      net/devlink/dev.o
  CC      lib/timerqueue.o
  LD [M]  drivers/xen/xen-evtchn.o
  LD [M]  drivers/xen/xen-gntdev.o
  CC [M]  net/netfilter/nf_conntrack_timeout.o
  LD [M]  drivers/xen/xen-gntalloc.o
  LD [M]  drivers/xen/xen-privcmd.o
  AR      drivers/xen/built-in.a
  CC [M]  net/netfilter/nf_conntrack_timestamp.o
  CC      arch/x86/kernel/step.o
  CC      drivers/base/topology.o
  CC [M]  drivers/regulator/max8998.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.o
  CC [M]  arch/x86/kvm/vmx/posted_intr.o
  CC      net/ethtool/mm.o
  CC      drivers/nvdimm/claim.o
  CC      drivers/acpi/acpica/tbfind.o
  CC [M]  drivers/tty/serial/men_z135_uart.o
  CC      net/8021q/vlan_core.o
  LD [M]  drivers/dax/device_dax.o
  LD [M]  drivers/dax/dax_pmem.o
  LD [M]  drivers/dax/dax_cxl.o
  AR      drivers/dax/built-in.a
  CC [M]  net/netfilter/nf_conntrack_ecache.o
  CC      lib/union_find.o
  CC [M]  drivers/block/floppy.o
  CC      fs/btrfs/file.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_state_helper.o
  CC      lib/vsprintf.o
  CC      drivers/mfd/twl-core.o
  CC      kernel/bpf/queue_stack_maps.o
  CC [M]  drivers/misc/mei/hw-me.o
  CC [M]  fs/romfs/storage.o
  CC      drivers/acpi/acpica/tbinstal.o
  CC [M]  net/netfilter/nf_conntrack_labels.o
  CC [M]  fs/netfs/read_single.o
  CC [M]  net/ipv6/netfilter/nf_defrag_ipv6_hooks.o
  CC [M]  fs/romfs/super.o
  CC [M]  net/ipv6/netfilter/nf_conntrack_reasm.o
  CC      net/core/selftests.o
  CC      fs/btrfs/defrag.o
  CC [M]  net/ipv4/netfilter/arptable_filter.o
  CC      arch/x86/kernel/tboot.o
  CC      drivers/base/container.o
  CC      drivers/dma-buf/dma-fence-array.o
  CC [M]  fs/lockd/host.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.o
  CC [M]  crypto/sm4.o
  CC [M]  drivers/regulator/max20086-regulator.o
  CC [M]  drivers/tty/serial/rp2.o
  CC      kernel/trace/trace_events_trigger.o
  CC [M]  drivers/tty/serial/sc16is7xx.o
  CC      drivers/acpi/acpica/tbprint.o
  CC      drivers/dma-buf/dma-fence-chain.o
  CC [M]  fs/netfs/rolling_buffer.o
  CC      net/ipv4/ip_sockglue.o
  CC      net/core/timestamping.o
  CC      net/ipv6/addrconf.o
  CC      kernel/bpf/ringbuf.o
  CC      kernel/bpf/bpf_local_storage.o
  CC      kernel/bpf/bpf_task_storage.o
  CC      net/ipv4/inet_hashtables.o
  CC      drivers/base/property.o
  CC      mm/mempolicy.o
  CC [M]  fs/smb/client/connect.o
  CC      drivers/acpi/acpica/tbutils.o
  LD [M]  fs/romfs/romfs.o
  CC [M]  drivers/cxl/core/pmem.o
  CC      net/devlink/port.o
  CC [M]  drivers/gpu/drm/display/drm_dp_aux_dev.o
  CC      drivers/nvdimm/btt_devs.o
  CC [M]  net/8021q/vlan.o
  CC [M]  net/ipv4/netfilter/nf_dup_ipv4.o
  CC      net/ipv4/inet_timewait_sock.o
  CC [M]  fs/nfs/dir.o
  CC      net/ethtool/module.o
  CC      drivers/mfd/twl4030-irq.o
  CC [M]  drivers/regulator/max20411-regulator.o
  CC      arch/x86/kernel/i8237.o
  CC      mm/sparse.o
  CC [M]  crypto/sm4_generic.o
  CC      drivers/dma-buf/dma-fence-unwrap.o
  CC      drivers/mfd/twl6030-irq.o
  CC [M]  drivers/gpu/drm/display/drm_dp_cec.o
  CC      drivers/acpi/acpica/tbxface.o
  CC [M]  drivers/cxl/port.o
  CC      net/ipv6/addrlabel.o
  CC [M]  fs/lockd/svc.o
  CC [M]  sound/soc/soc-devres.o
  CC      arch/x86/kernel/stacktrace.o
  CC      mm/sparse-vmemmap.o
  CC      drivers/misc/sram.o
  CC [M]  fs/netfs/write_collect.o
  CC [M]  net/netfilter/nf_conntrack_ovs.o
  CC      drivers/mfd/twl4030-audio.o
  CC [M]  crypto/aes_ti.o
  CC [M]  crypto/camellia_generic.o
  CC [M]  arch/x86/kvm/vmx/main.o
  CC [M]  drivers/misc/mei/gsc-me.o
  CC [M]  drivers/regulator/max77693-regulator.o
  CC      fs/btrfs/extent_map.o
  CC [M]  net/netfilter/nf_conntrack_proto_dccp.o
  CC [M]  drivers/tty/serial/sc16is7xx_spi.o
  CC      drivers/mfd/twl6040.o
  CC      kernel/bpf/bpf_inode_storage.o
  AR      drivers/gpu/drm/imx/built-in.a
  CC      net/netlabel/netlabel_user.o
  CC      drivers/acpi/osi.o
  CC      drivers/dma-buf/dma-resv.o
  CC      kernel/trace/trace_eprobe.o
  CC [M]  drivers/cxl/core/regs.o
  CC [M]  net/ipv6/netfilter/nf_socket_ipv6.o
  CC      drivers/acpi/acpica/tbxfload.o
  CC      mm/mmu_notifier.o
  CC [M]  net/8021q/vlan_dev.o
  CC      arch/x86/kernel/reboot.o
  CC      net/ethtool/cmis_fw_update.o
  CC      net/netlabel/netlabel_kapi.o
  CC      drivers/dma-buf/dma-heap.o
  CC      kernel/cpu.o
  CC [M]  drivers/block/brd.o
  CC      drivers/nvdimm/pfn_devs.o
  CC [M]  fs/autofs/init.o
  CC      drivers/base/cacheinfo.o
  CC [M]  sound/soc/soc-ops.o
  CC [M]  drivers/misc/mei/pci-txe.o
  CC [M]  fs/nfs/file.o
  CC      drivers/base/swnode.o
  CC [M]  drivers/regulator/max77826-regulator.o
  CC      net/core/ptp_classifier.o
  CC [M]  drivers/tty/serial/sc16is7xx_i2c.o
  CC [M]  fs/autofs/inode.o
  CC      drivers/dma-buf/sync_file.o
  CC [M]  arch/x86/kvm/vmx/sgx.o
  LD [M]  drivers/gpu/drm/display/drm_display_helper.o
  CC      fs/btrfs/sysfs.o
  CC      lib/win_minmax.o
  AR      drivers/gpu/drm/panel/built-in.a
  CC [M]  drivers/gpu/drm/panel/panel-auo-a030jtn01.o
  CC [M]  net/ipv4/netfilter/nf_nat_snmp_basic.asn1.o
  AR      drivers/macintosh/built-in.a
  CC [M]  drivers/gpu/drm/panel/panel-ilitek-ili9341.o
  CC [M]  net/ipv4/netfilter/nf_nat_snmp_basic_main.o
  CC      drivers/acpi/acpica/tbxfroot.o
  CC [M]  crypto/cast_common.o
  CC [M]  drivers/cxl/core/memdev.o
  CC [M]  sound/soc/soc-link.o
  CC [M]  crypto/cast5_generic.o
  CC      kernel/bpf/disasm.o
  CC [M]  crypto/cast6_generic.o
  CC      drivers/tty/tty_mutex.o
  CC [M]  crypto/aria_generic.o
  CC [M]  drivers/block/ublk_drv.o
  CC [M]  drivers/misc/ad525x_dpot.o
  CC      net/devlink/sb.o
  CC [M]  drivers/misc/mei/hw-txe.o
  CC [M]  fs/netfs/write_issue.o
  CC      net/ethtool/cmis_cdb.o
  CC [M]  crypto/chacha_generic.o
  CC [M]  drivers/tty/serial/sprd_serial.o
  CC      drivers/mfd/mfd-core.o
  CC      drivers/acpi/acpica/utaddress.o
  CC [M]  fs/lockd/svclock.o
  CC [M]  drivers/regulator/max77857-regulator.o
  CC [M]  arch/x86/kvm/vmx/hyperv.o
  CC [M]  drivers/misc/ad525x_dpot-i2c.o
  CC [M]  fs/autofs/root.o
  CC [M]  drivers/misc/ad525x_dpot-spi.o
  CC [M]  net/8021q/vlan_netlink.o
  CC      drivers/nvdimm/dax_devs.o
  CC      kernel/trace/trace_events_inject.o
  CC      arch/x86/kernel/early-quirks.o
  CC      mm/ksm.o
  CC      net/netlabel/netlabel_domainhash.o
  CC      drivers/dma-buf/sw_sync.o
  CC      lib/xarray.o
  CC [M]  net/netfilter/nf_conntrack_proto_sctp.o
  CC [M]  drivers/gpu/drm/panel/panel-orisetech-ota5601a.o
  CC      drivers/acpi/acpica/utalloc.o
  CC      drivers/tty/tty_ldsem.o
  CC      drivers/tty/tty_baudrate.o
  CC      net/netlabel/netlabel_addrlist.o
  CC      kernel/bpf/mprog.o
  CC      net/netlabel/netlabel_mgmt.o
  CC      drivers/base/faux.o
  LD [M]  net/ipv4/netfilter/nf_nat_snmp_basic.o
  CC      net/ipv4/inet_connection_sock.o
  CC [M]  fs/fuse/dev.o
  CC [M]  drivers/tty/serial/uartlite.o
  CC [M]  net/ipv6/netfilter/nf_tproxy_ipv6.o
  CC [M]  fs/lockd/svcshare.o
  CC [M]  sound/soc/soc-card.o
  CC [M]  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.o
  CC [M]  drivers/regulator/mc13783-regulator.o
  CC      net/ethtool/pse-pd.o
  CC      net/core/netprio_cgroup.o
  CC      drivers/mfd/ezx-pcap.o
  CC [M]  drivers/misc/mei/vsc-tp.o
  CC [M]  drivers/gpu/drm/panel/panel-widechips-ws2401.o
  CC [M]  fs/fuse/dir.o
  CC      drivers/acpi/acpica/utascii.o
  CC [M]  crypto/poly1305_generic.o
  CC [M]  fs/smb/client/dir.o
  CC [M]  fs/autofs/symlink.o
  CC      fs/btrfs/accessors.o
  CC [M]  fs/fuse/file.o
  CC [M]  drivers/cxl/core/mbox.o
  CC [M]  net/8021q/vlan_gvrp.o
  CC [M]  drivers/cxl/core/pci.o
  CC      kernel/trace/trace_events_synth.o
  CC      net/ipv4/tcp.o
  CC [M]  fs/fuse/inode.o
  CC [M]  arch/x86/kvm/vmx/hyperv_evmcs.o
  CC      net/ipv6/route.o
  CC      net/ipv4/tcp_input.o
  CC      kernel/trace/trace_events_hist.o
  CC      drivers/acpi/acpica/utbuffer.o
  CC      drivers/dma-buf/sync_debug.o
  CC [M]  net/ipv6/netfilter/nf_reject_ipv6.o
  CC [M]  fs/nfs/getroot.o
  CC      kernel/bpf/trampoline.o
  CC      drivers/nvdimm/security.o
  CC [M]  drivers/regulator/mc13892-regulator.o
  CC [M]  crypto/michael_mic.o
  CC      arch/x86/kernel/smp.o
  CC      kernel/bpf/btf.o
  AR      drivers/tty/serial/built-in.a
  AR      drivers/block/built-in.a
  CC      drivers/tty/tty_jobctrl.o
  CC [M]  fs/nfs/inode.o
  AR      drivers/gpu/drm/bridge/analogix/built-in.a
  CC [M]  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.o
  AR      drivers/gpu/drm/bridge/cadence/built-in.a
  CC [M]  fs/nfs/super.o
  CC [M]  net/netfilter/nf_conntrack_proto_gre.o
  CC      drivers/base/auxiliary.o
  CC [M]  crypto/crc32_generic.o
  CC [M]  fs/netfs/write_retry.o
  CC [M]  fs/autofs/waitq.o
  CC      drivers/acpi/acpica/utcksum.o
  CC      drivers/nvdimm/e820.o
  CC      net/netlabel/netlabel_unlabeled.o
  CC      net/ethtool/plca.o
  CC      net/core/netclassid_cgroup.o
  CC [M]  fs/lockd/svcproc.o
  CC      net/devlink/dpipe.o
  CC      drivers/dma-buf/udmabuf.o
  CC [M]  sound/soc/soc-compress.o
  CC [M]  net/8021q/vlan_mvrp.o
  CC [M]  fs/lockd/svcsubs.o
  CC      drivers/mfd/da903x.o
  CC [M]  arch/x86/kvm/vmx/vmx_onhyperv.o
  CC [M]  drivers/misc/mei/vsc-fw-loader.o
  CC      drivers/acpi/acpica/utcopy.o
  CC      lib/lockref.o
  CC [M]  drivers/cxl/core/hdm.o
  CC [M]  crypto/authenc.o
  CC      fs/btrfs/xattr.o
  CC [M]  drivers/regulator/mc13xxx-regulator-core.o
  CC      net/dcb/dcbnl.o
  CC      drivers/mfd/da9052-irq.o
  CC [M]  fs/netfs/stats.o
  CC [M]  drivers/nvdimm/pmem.o
  CC      net/ethtool/phy.o
  CC [M]  drivers/gpu/drm/bridge/analogix/analogix_dp_core.o
  CC      lib/bcd.o
  CC      drivers/base/devtmpfs.o
  CC [M]  fs/fuse/control.o
  CC [M]  fs/autofs/expire.o
  CC      drivers/tty/n_null.o
  CC      drivers/mfd/da9052-core.o
  CC      lib/sort.o
  CC      drivers/acpi/acpica/utexcep.o
  CC [M]  fs/smb/client/file.o
  CC [M]  fs/fuse/xattr.o
  CC      mm/page_poison.o
  CC [M]  net/ipv6/netfilter/nf_dup_ipv6.o
  CC [M]  net/8021q/vlanproc.o
  CC [M]  drivers/dma-buf/selftest.o
  CC [M]  arch/x86/kvm/svm/svm.o
  CC      drivers/tty/pty.o
  CC      drivers/tty/tty_audit.o
  CC      drivers/tty/sysrq.o
  CC      lib/parser.o
  CC      arch/x86/kernel/smpboot.o
  CC [M]  sound/soc/soc-generic-dmaengine-pcm.o
  CC [M]  fs/netfs/fscache_cache.o
  CC      kernel/bpf/memalloc.o
  CC [M]  fs/netfs/fscache_cookie.o
  CC [M]  drivers/misc/mei/platform-vsc.o
../drivers/gpu/drm/bridge/analogix/analogix_dp_core.c: In function ‘analogix_dp_probe’:
../drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1589:17: error: label ‘err_disable_clk’ used but not defined
 1589 |                 goto err_disable_clk;
      |                 ^~~~
  LD [M]  drivers/misc/mei/mei.o
make[8]: *** [../scripts/Makefile.build:203: drivers/gpu/drm/bridge/analogix/analogix_dp_core.o] Error 1
make[7]: *** [../scripts/Makefile.build:461: drivers/gpu/drm/bridge/analogix] Error 2
make[6]: *** [../scripts/Makefile.build:461: drivers/gpu/drm/bridge] Error 2
make[5]: *** [../scripts/Makefile.build:461: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:461: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
  CC      arch/x86/kernel/tsc_sync.o
  CC      fs/btrfs/ordered-data.o
  CC      net/netlabel/netlabel_cipso_v4.o
  CC      net/core/lwtunnel.o
  CC      mm/memtest.o
  CC      arch/x86/kernel/setup_percpu.o
  CC      net/core/lwt_bpf.o
  CC      net/dcb/dcbevent.o
  CC [M]  net/netfilter/nf_conntrack_netlink.o
  CC      drivers/acpi/acpica/utdebug.o
  CC [M]  crypto/authencesn.o
  CC [M]  fs/fuse/acl.o
  CC [M]  drivers/dma-buf/st-dma-fence.o
  CC      drivers/base/isa.o
  CC [M]  drivers/regulator/mp8859.o
  CC [M]  drivers/nvdimm/btt.o
  CC [M]  fs/autofs/dev-ioctl.o
  CC      net/devlink/resource.o
  CC      net/ethtool/tsconfig.o
  CC      lib/debug_locks.o
  CC      drivers/mfd/da9052-spi.o
  CC      net/netlabel/netlabel_calipso.o
  CC [M]  fs/lockd/mon.o
  CC      drivers/mfd/da9052-i2c.o
  CC [M]  drivers/cxl/core/pmu.o
  CC [M]  fs/fuse/readdir.o
  CC [M]  drivers/dma-buf/st-dma-fence-chain.o
  AR      net/8021q/built-in.a
  LD [M]  net/8021q/8021q.o
  CC      net/core/dst_cache.o
  CC      drivers/base/node.o
  CC      drivers/acpi/osl.o
  LD [M]  drivers/misc/mei/mei-me.o
  LD [M]  drivers/misc/mei/mei-gsc.o
  LD [M]  drivers/misc/mei/mei-txe.o
  LD [M]  drivers/misc/mei/mei-vsc-hw.o
  LD [M]  drivers/misc/mei/mei-vsc.o
  CC [M]  net/ipv6/netfilter/nft_reject_ipv6.o
  CC [M]  drivers/misc/dummy-irq.o
  CC      drivers/base/memory.o
  CC      mm/migrate.o
  CC      lib/random32.o
  CC      drivers/acpi/acpica/utdecode.o
  CC [M]  sound/soc/soc-ac97.o
  LD [M]  sound/soc/snd-soc-acpi.o
  CC      drivers/base/module.o
  CC [M]  drivers/regulator/mt6311-regulator.o
  LD [M]  fs/autofs/autofs4.o
  CC      arch/x86/kernel/mpparse.o
  CC      drivers/base/auxiliary_sysfs.o
  CC [M]  crypto/lz4.o
  CC      drivers/acpi/utils.o
  CC      drivers/acpi/reboot.o
  CC [M]  net/netfilter/nfnetlink_cttimeout.o
  CC [M]  fs/nfs/io.o
  CC      drivers/base/hypervisor.o
  CC      kernel/trace/trace_events_user.o
  CC      drivers/mfd/lp8788.o
  CC [M]  drivers/misc/ics932s401.o
  CC      drivers/mfd/lp8788-irq.o
  CC [M]  fs/nfs/direct.o
  CC [M]  drivers/tty/n_hdlc.o
  CC      drivers/acpi/acpica/utdelete.o
  CC      lib/bust_spinlocks.o
  AR      net/ethtool/built-in.a
  CC      kernel/trace/bpf_trace.o
  CC [M]  fs/fuse/ioctl.o
  CC [M]  drivers/dma-buf/st-dma-fence-unwrap.o
  CC      arch/x86/kernel/ftrace.o
  CC      kernel/trace/trace_kprobe.o
  CC      net/dns_resolver/dns_key.o
  AR      net/dcb/built-in.a
  CC      kernel/bpf/rqspinlock.o
  CC      net/ipv4/tcp_output.o
  CC      fs/btrfs/extent_io.o
  CC [M]  fs/lockd/trace.o
  CC      drivers/base/soc.o
  CC [M]  drivers/cxl/core/cdat.o
  CC [M]  net/ipv6/netfilter/nft_dup_ipv6.o
  CC [M]  crypto/lz4hc.o
  CC [M]  fs/netfs/fscache_io.o
  CC [M]  drivers/regulator/mt6315-regulator.o
  CC [M]  net/ipv6/netfilter/nft_fib_ipv6.o
  CC      fs/btrfs/volumes.o
  CC      drivers/acpi/acpica/uterror.o
  CC      net/ipv6/ip6_fib.o
  CC [M]  drivers/nvdimm/virtio_pmem.o
  CC      lib/kasprintf.o
  AR      net/netlabel/built-in.a
  CC      fs/btrfs/async-thread.o
  CC [M]  drivers/cxl/acpi.o
  CC [M]  net/netfilter/nfnetlink_cthelper.o
  CC [M]  fs/fuse/iomode.o
  CC      net/devlink/param.o
  CC [M]  drivers/misc/tifm_core.o
  CC [M]  fs/overlayfs/super.o
  CC [M]  fs/9p/vfs_super.o
  LD [M]  sound/soc/snd-soc-core.o
  CC [M]  drivers/tty/n_gsm.o
  CC      net/dns_resolver/dns_query.o
  CC [M]  drivers/dma-buf/st-dma-resv.o
  CC      net/core/gro_cells.o
  CC [M]  fs/fuse/dax.o
  CC [M]  fs/overlayfs/namei.o
  CC      fs/btrfs/ioctl.o
  CC      drivers/acpi/acpica/uteval.o
  CC [M]  crypto/842.o
  CC [M]  fs/overlayfs/util.o
  AS      arch/x86/kernel/ftrace_64.o
  CC      drivers/base/pinctrl.o
  CC [M]  net/ipv6/netfilter/ip6t_ah.o
  CC      drivers/mfd/da9055-core.o
  UPD     arch/x86/kvm/kvm-asm-offsets.h
  CC [M]  net/ipv6/netfilter/ip6t_eui64.o
  CC      fs/btrfs/locking.o
  CC [M]  fs/smb/client/inode.o
  CC [M]  drivers/regulator/mt6323-regulator.o
  CC      lib/bitmap.o
  AR      drivers/dma-buf/built-in.a
  CC [M]  fs/lockd/xdr.o
  LD [M]  drivers/dma-buf/dmabuf_selftests.o
  CC      drivers/base/devcoredump.o
  CC      net/ipv6/ipv6_sockglue.o
  CC [M]  fs/cachefiles/cache.o
  CC      drivers/acpi/acpica/utglobal.o
  CC      arch/x86/kernel/trace_clock.o
  CC [M]  drivers/nvdimm/nd_virtio.o
  CC [M]  fs/vboxsf/dir.o
  CC [M]  arch/x86/kvm/svm/pmu.o
  CC [M]  fs/9p/vfs_inode.o
  CC      net/switchdev/switchdev.o
  CC [M]  crypto/ansi_cprng.o
  CC [M]  fs/nfs/pagelist.o
  CC [M]  fs/vboxsf/file.o
  CC [M]  fs/9p/vfs_inode_dotl.o
  CC      kernel/exit.o
  CC [M]  drivers/tty/moxa.o
  CC      arch/x86/kernel/trace.o
  CC [M]  fs/netfs/fscache_main.o
  CC [M]  drivers/tty/mxser.o
  CC [M]  drivers/cxl/core/ras.o
  CC [M]  drivers/misc/tifm_7xx1.o
  CC [M]  drivers/regulator/mt6331-regulator.o
  CC [M]  net/netfilter/nf_conntrack_amanda.o
  CC      mm/memory-tiers.o
  AR      net/dns_resolver/built-in.a
  CC [M]  fs/fuse/passthrough.o
  CC      net/core/failover.o
  CC      drivers/acpi/nvs.o
  CC      kernel/bpf/arena.o
  CC      drivers/mfd/da9055-i2c.o
  CC      drivers/acpi/acpica/uthex.o
  CC [M]  fs/cachefiles/daemon.o
  CC [M]  fs/overlayfs/inode.o
  CC [M]  drivers/regulator/mt6332-regulator.o
  CC [M]  fs/fuse/sysctl.o
  CC      drivers/mfd/da9063-core.o
  CC [M]  crypto/tcrypt.o
  CC      fs/open.o
  CC      net/l3mdev/l3mdev.o
  CC [M]  fs/9p/vfs_addr.o
  CC      drivers/base/platform-msi.o
  CC      arch/x86/kernel/rethook.o
  CC [M]  drivers/tty/nozomi.o
  CC [M]  fs/lockd/netlink.o
  CC [M]  fs/vboxsf/utils.o
  CC [M]  net/ipv6/netfilter/ip6t_frag.o
  CC      drivers/acpi/acpica/utids.o
  CC [M]  arch/x86/kvm/svm/nested.o
  CC [M]  fs/9p/vfs_file.o
  CC      lib/scatterlist.o
  CC [M]  fs/lockd/clnt4xdr.o
  CC      net/ncsi/ncsi-cmd.o
  CC      net/ncsi/ncsi-rsp.o
  LD [M]  drivers/nvdimm/nd_pmem.o
  LD [M]  drivers/nvdimm/nd_btt.o
  AR      drivers/nvdimm/built-in.a
  CC [M]  drivers/misc/phantom.o
  CC      net/devlink/region.o
  CC      net/ncsi/ncsi-aen.o
  CC [M]  fs/lockd/xdr4.o
  CC [M]  drivers/cxl/core/acpi.o
  CC [M]  arch/x86/kvm/svm/avic.o
  CC      fs/read_write.o
  CC      arch/x86/kernel/vmcore_info_64.o
  CC      drivers/mfd/da9063-irq.o
  CC [M]  drivers/cxl/pmem.o
  CC [M]  fs/fuse/dev_uring.o
  CC [M]  fs/fuse/cuse.o
  CC [M]  fs/smb/client/link.o
  CC      kernel/softirq.o
  CC      drivers/acpi/acpica/utinit.o
  CC [M]  drivers/regulator/mt6357-regulator.o
  CC      fs/file_table.o
  CC      kernel/bpf/range_tree.o
  CC [M]  fs/cachefiles/interface.o
  CC      kernel/trace/error_report-traces.o
  CC [M]  fs/vboxsf/vboxsf_wrappers.o
  AR      net/switchdev/built-in.a
  CC      drivers/base/physical_location.o
  CC      net/ipv6/ndisc.o
  CC      kernel/trace/power-traces.o
  CC      net/devlink/health.o
  CC [M]  fs/overlayfs/file.o
  CC [M]  fs/9p/vfs_dir.o
  CC [M]  drivers/cxl/core/trace.o
  CC      arch/x86/kernel/machine_kexec_64.o
  CC      drivers/mfd/da9063-i2c.o
  CC      drivers/acpi/acpica/utlock.o
  CC [M]  fs/netfs/fscache_volume.o
  CC      mm/migrate_device.o
  CC [M]  drivers/misc/bh1770glc.o
  CC      net/core/skmsg.o
  CC      fs/btrfs/orphan.o
  CC [M]  net/netfilter/nf_conntrack_ftp.o
  CC      drivers/base/trace.o
  CC [M]  net/ipv6/netfilter/ip6t_ipv6header.o
  CC [M]  arch/x86/kvm/svm/sev.o
  CC [M]  drivers/tty/ttynull.o
  CC [M]  drivers/regulator/mt6358-regulator.o
  CC      lib/list_sort.o
  AR      net/l3mdev/built-in.a
  CC      drivers/mfd/max14577.o
  CC      drivers/acpi/wakeup.o
  CC [M]  fs/lockd/svc4proc.o
  CC [M]  net/ipv6/netfilter/ip6t_mh.o
  CC      drivers/acpi/acpica/utmath.o
  CC      net/ncsi/ncsi-manage.o
  CC      net/ipv6/udp.o
  CC      net/ipv6/udplite.o
  CC      drivers/acpi/acpica/utmisc.o
  CC      fs/super.o
  CC      net/devlink/trap.o
  CC [M]  fs/vboxsf/super.o
  CC [M]  fs/nfs/read.o
  CC [M]  fs/fuse/virtio_fs.o
  CC      kernel/bpf/dispatcher.o
  CC [M]  fs/9p/vfs_dentry.o
  CC      lib/uuid.o
  CC      net/ipv4/tcp_timer.o
  CC      drivers/mfd/max77693.o
  CC [M]  drivers/tty/rpmsg_tty.o
  CC [M]  fs/cachefiles/io.o
  CC [M]  fs/overlayfs/dir.o
  CC      kernel/resource.o
  CC      fs/btrfs/export.o
  CC      fs/char_dev.o
  CC      kernel/trace/rpm-traces.o
  CC      drivers/acpi/acpica/utmutex.o
  CC      net/ncsi/ncsi-netlink.o
  CC [M]  crypto/polyval-generic.o
  AS      arch/x86/kernel/relocate_kernel_64.o
  CC      lib/iov_iter.o
  CC      drivers/acpi/sleep.o
  CC      arch/x86/kernel/kexec-bzimage64.o
  CC [M]  fs/smb/client/misc.o
  AR      drivers/base/built-in.a
  CC [M]  fs/smb/client/netmisc.o
  CC [M]  drivers/regulator/mt6359-regulator.o
  CC [M]  crypto/af_alg.o
  CC [M]  drivers/misc/apds990x.o
  CC      drivers/mfd/max77843.o
  CC      drivers/acpi/device_sysfs.o
  CC      fs/stat.o
  CC [M]  fs/9p/v9fs.o
  LD [M]  fs/vboxsf/vboxsf.o
  CC      drivers/acpi/acpica/utnonansi.o
  CC [M]  fs/netfs/fscache_proc.o
  CC [M]  drivers/cxl/security.o
  CC [M]  fs/lockd/procfs.o
  CC [M]  net/ipv6/netfilter/ip6t_hbh.o
  CC [M]  fs/overlayfs/readdir.o
  CC [M]  net/ipv6/netfilter/ip6t_rpfilter.o
  AR      drivers/tty/built-in.a
  CC [M]  fs/overlayfs/copy_up.o
  CC      kernel/bpf/devmap.o
  CC [M]  net/ipv6/netfilter/ip6t_rt.o
  CC      kernel/sysctl.o
  CC [M]  net/ipv6/netfilter/ip6t_srh.o
  CC      net/core/sock_map.o
  CC      fs/btrfs/tree-log.o
  CC [M]  fs/smb/client/smbencrypt.o
  CC [M]  drivers/regulator/mt6360-regulator.o
  CC      drivers/acpi/acpica/utobject.o
  CC      mm/huge_memory.o
  CC      drivers/mfd/max8925-core.o
  CC [M]  drivers/cxl/core/region.o
  CC      arch/x86/kernel/crash_dump_64.o
  LD [M]  fs/fuse/fuse.o
  LD [M]  fs/fuse/virtiofs.o
  CC [M]  fs/nfs/symlink.o
  CC [M]  fs/cachefiles/key.o
  CC      net/ipv6/raw.o
  CC [M]  crypto/algif_hash.o
  CC      net/ipv4/tcp_ipv4.o
  CC [M]  drivers/misc/enclosure.o
  CC [M]  fs/netfs/fscache_stats.o
  CC      net/ipv4/tcp_minisocks.o
  CC [M]  drivers/misc/smpro-errmon.o
  CC [M]  fs/9p/fid.o
  CC      net/ipv4/tcp_cong.o
  CC [M]  net/ipv6/netfilter/ip6t_NPT.o
  LD [M]  fs/lockd/lockd.o
  CC [M]  net/netfilter/nf_conntrack_h323_main.o
  CC      net/devlink/rate.o
  CC      net/core/bpf_sk_storage.o
  CC      kernel/trace/trace_kdb.o
  CC      net/devlink/linecard.o
  CC      drivers/acpi/acpica/utosi.o
  CC      kernel/trace/trace_dynevent.o
  CC      arch/x86/kernel/crash.o
  CC [M]  fs/cachefiles/main.o
  CC      kernel/trace/trace_probe.o
  CC [M]  drivers/regulator/mt6370-regulator.o
  CC [M]  net/ipv6/netfilter/ip6t_REJECT.o
  CC      mm/khugepaged.o
  CC      drivers/mfd/max8925-i2c.o
  CC [M]  net/netfilter/nf_conntrack_h323_asn1.o
  CC [M]  fs/overlayfs/export.o
  CC      mm/page_counter.o
  CC [M]  net/ipv6/netfilter/ip6t_SYNPROXY.o
  CC      net/mctp/af_mctp.o
  CC [M]  fs/smb/client/transport.o
  AR      net/ncsi/built-in.a
  CC      net/mctp/device.o
  CC      net/core/devmem.o
  CC      kernel/capability.o
  CC [M]  net/core/pktgen.o
  CC      net/mctp/route.o
  CC      drivers/acpi/acpica/utownerid.o
  CC      mm/memcontrol.o
  CC      kernel/bpf/cpumap.o
  CC [M]  fs/9p/xattr.o
  CC [M]  fs/nfs/unlink.o
  CC      fs/btrfs/free-space-cache.o
  CC      lib/clz_ctz.o
  CC [M]  fs/overlayfs/params.o
  CC [M]  crypto/algif_skcipher.o
  CC      net/handshake/alert.o
  CC [M]  drivers/misc/smpro-misc.o
  CC [M]  arch/x86/kvm/svm/hyperv.o
  CC      drivers/mfd/max8997.o
  CC      mm/vmpressure.o
  CC      net/handshake/genl.o
  LD [M]  fs/netfs/netfs.o
  CC      drivers/acpi/acpica/utpredef.o
  CC      arch/x86/kernel/module.o
  CC [M]  drivers/misc/hpilo.o
  CC [M]  drivers/regulator/mt6397-regulator.o
  CC [M]  fs/overlayfs/xattrs.o
  CC [M]  net/llc/llc_core.o
  CC      lib/bsearch.o
  CC [M]  net/tls/tls_main.o
  CC [M]  fs/9p/cache.o
  CC [M]  net/llc/llc_input.o
  CC      fs/btrfs/zlib.o
  CC      drivers/acpi/acpica/utresdecode.o
  CC [M]  fs/smb/client/cached_dir.o
  CC      net/ipv6/icmp.o
  CC [M]  drivers/cxl/core/mce.o
  CC      kernel/bpf/offload.o
  CC      net/mctp/neigh.o
  CC      arch/x86/kernel/kgdb.o
  CC [M]  arch/x86/kvm/svm/svm_onhyperv.o
  LD [M]  arch/x86/kvm/kvm.o
  CC      lib/find_bit.o
  CC      kernel/trace/trace_uprobe.o
  LD [M]  net/ipv6/netfilter/nf_defrag_ipv6.o
  CC      drivers/acpi/acpica/utresrc.o
  CC      kernel/bpf/net_namespace.o
  CC      drivers/mfd/max8997-irq.o
  CC      drivers/acpi/device_pm.o
  CC [M]  drivers/regulator/qcom-labibb-regulator.o
  CC [M]  net/netfilter/nf_conntrack_irc.o
  CC [M]  drivers/misc/apds9802als.o
  CC [M]  crypto/algif_rng.o
  LD [M]  fs/overlayfs/overlay.o
  AR      net/devlink/built-in.a
  CC      kernel/ptrace.o
  CC [M]  net/llc/llc_output.o
  CC      kernel/trace/trace_boot.o
  CC      lib/llist.o
  CC [M]  fs/nfs/write.o
  CC [M]  net/netfilter/nf_conntrack_broadcast.o
  CC [M]  fs/9p/acl.o
  CC [M]  fs/cachefiles/namei.o
  CC [M]  fs/smb/client/cifs_unicode.o
  CC [M]  net/key/af_key.o
  CC [M]  drivers/regulator/qcom_spmi-regulator.o
  CC      arch/x86/kernel/early_printk.o
  CC      net/handshake/netlink.o
  CC      mm/swap_cgroup.o
  CC      fs/btrfs/lzo.o
  CC      lib/lwq.o
  CC      lib/memweight.o
  CC [M]  net/bridge/netfilter/nft_meta_bridge.o
  CC      drivers/acpi/acpica/utstate.o
  CC [M]  net/bridge/netfilter/nft_reject_bridge.o
  AR      drivers/cxl/core/built-in.a
  LD [M]  drivers/cxl/core/cxl_core.o
  CC [M]  drivers/cxl/mem.o
  CC      kernel/trace/fprobe.o
  CC [M]  net/sunrpc/auth_gss/auth_gss.o
  CC      fs/exec.o
  CC [M]  net/kcm/kcmsock.o
  CC [M]  net/l2tp/l2tp_core.o
  AS [M]  arch/x86/kvm/vmx/vmenter.o
  CC [M]  net/dccp/ccid.o
  CC      drivers/mfd/max8998.o
  CC [M]  net/l2tp/l2tp_ip.o
  CC [M]  drivers/misc/isl29003.o
  AS [M]  arch/x86/kvm/svm/vmenter.o
  CC      lib/kfifo.o
  CC [M]  net/l2tp/l2tp_netlink.o
  CC [M]  net/kcm/kcmproc.o
  LD [M]  arch/x86/kvm/kvm-intel.o
  CC [M]  net/dccp/feat.o
  CC      drivers/acpi/acpica/utstring.o
  AR      net/mctp/built-in.a
  LD [M]  arch/x86/kvm/kvm-amd.o
  CC [M]  net/dccp/input.o
  CC      kernel/trace/rethook.o
  CC [M]  crypto/algif_aead.o
  CC      arch/x86/kernel/hpet.o
  CC [M]  net/l2tp/l2tp_eth.o
  LD [M]  fs/9p/9p.o
  CC [M]  net/l2tp/l2tp_debugfs.o
  CC [M]  net/tls/tls_sw.o
  CC [M]  drivers/misc/isl29020.o
  CC      arch/x86/kernel/amd_nb.o
  CC      kernel/user.o
  CC      fs/btrfs/zstd.o
  CC [M]  net/bridge/br.o
  CC [M]  drivers/cxl/pci.o
  CC [M]  fs/smb/client/nterr.o
  CC      drivers/acpi/acpica/utstrsuppt.o
  CC [M]  drivers/regulator/qcom_usb_vbus-regulator.o
  CC [M]  net/llc/llc_if.o
  CC      arch/x86/kernel/amd_node.o
  CC      lib/percpu-refcount.o
  CC [M]  fs/cachefiles/security.o
  CC      drivers/acpi/acpica/utstrtoul64.o
  AR      net/core/built-in.a
  CC [M]  net/l2tp/l2tp_ip6.o
  CC      net/ipv4/tcp_metrics.o
  CC [M]  fs/cachefiles/volume.o
  CC      mm/hugetlb_cgroup.o
  CC      drivers/mfd/max8998-irq.o
  CC      lib/rhashtable.o
  CC [M]  net/bridge/netfilter/nf_conntrack_bridge.o
  CC      net/handshake/request.o
  CC [M]  net/tls/tls_proc.o
  CC [M]  drivers/misc/tsl2550.o
  CC [M]  fs/smb/client/cifsencrypt.o
  CC      kernel/bpf/tcx.o
  CC      net/ipv6/mcast.o
  CC [M]  net/netfilter/nf_conntrack_netbios_ns.o
  CC [M]  drivers/misc/ds1682.o
  CC      arch/x86/kernel/kvm.o
  CC [M]  drivers/misc/hmc6352.o
  CC [M]  net/bridge/br_device.o
  CC      drivers/acpi/acpica/utxface.o
  CC [M]  crypto/zstd.o
  CC      mm/memory-failure.o
  CC [M]  drivers/misc/vmw_balloon.o
  CC [M]  net/bridge/netfilter/ebtables.o
  CC      drivers/acpi/acpica/utxfinit.o
  CC [M]  drivers/regulator/palmas-regulator.o
  CC      kernel/trace/trace_fprobe.o
  CC [M]  net/sctp/sm_statetable.o
  CC [M]  net/netfilter/nf_conntrack_snmp.o
  LD [M]  drivers/cxl/cxl_port.o
  LD [M]  drivers/cxl/cxl_acpi.o
  LD [M]  drivers/cxl/cxl_pmem.o
  LD [M]  drivers/cxl/cxl_mem.o
  LD [M]  drivers/cxl/cxl_pci.o
  AR      drivers/cxl/built-in.a
  CC      net/ipv6/reassembly.o
  CC      drivers/mfd/adp5520.o
  CC      net/ipv6/tcp_ipv6.o
  CC      fs/btrfs/compression.o
  CC [M]  net/llc/llc_c_ev.o
  CC [M]  net/llc/llc_c_ac.o
  CC [M]  net/netfilter/nf_conntrack_pptp.o
  CC      drivers/acpi/acpica/utxferror.o
  LD [M]  net/kcm/kcm.o
  CC      mm/kmemleak.o
  CC [M]  fs/cachefiles/xattr.o
  CC [M]  net/bridge/netfilter/ebtable_broute.o
  CC      mm/page_isolation.o
  CC [M]  net/tls/trace.o
  CC [M]  drivers/regulator/pca9450-regulator.o
  CC [M]  net/bridge/br_fdb.o
  CC      kernel/signal.o
  CC [M]  net/sunrpc/auth_gss/gss_mech_switch.o
  CC [M]  fs/cachefiles/error_inject.o
  CC [M]  crypto/essiv.o
  CC      drivers/mfd/tps6586x.o
  CC      drivers/acpi/acpica/utxfmutex.o
  CC [M]  net/rds/af_rds.o
  CC [M]  crypto/curve25519-generic.o
  CC [M]  net/bridge/netfilter/ebtable_filter.o
  CC      kernel/bpf/stackmap.o
  CC      net/ipv6/ping.o
  CC [M]  net/sctp/sm_statefuns.o
  CC [M]  fs/nfs/namespace.o
  CC [M]  net/9p/mod.o
  CC [M]  net/psample/psample.o
  CC [M]  net/dccp/minisocks.o
  CC [M]  net/9p/client.o
  CC [M]  net/sunrpc/auth_gss/svcauth_gss.o
  CC      net/ipv4/tcp_fastopen.o
  CC [M]  net/9p/error.o
  CC [M]  net/vmw_vsock/af_vsock.o
  CC [M]  drivers/misc/lattice-ecp3-config.o
  CC [M]  fs/smb/client/readdir.o
  CC [M]  drivers/regulator/pv88060-regulator.o
  CC      lib/base64.o
  CC [M]  drivers/misc/dw-xdata-pcie.o
  CC      drivers/acpi/acpica/dbcmds.o
  CC [M]  fs/smb/client/ioctl.o
  CC [M]  fs/smb/client/sess.o
  LD [M]  fs/cachefiles/cachefiles.o
  CC      kernel/bpf/cgroup_iter.o
  CC      kernel/sys.o
  ASN.1   crypto/ecrdsa_params.asn1.[ch]
  ASN.1   crypto/ecrdsa_pub_key.asn1.[ch]
  CC [M]  crypto/ecrdsa_params.asn1.o
  CC [M]  crypto/ecrdsa_pub_key.asn1.o
  AR      kernel/trace/built-in.a
  CC [M]  net/bridge/netfilter/ebtable_nat.o
  CC [M]  net/llc/llc_conn.o
  CC [M]  crypto/simd.o
  CC [M]  net/tls/tls_strp.o
  CC [M]  net/bridge/netfilter/ebt_802_3.o
  CC      net/handshake/tlshd.o
  CC      net/devres.o
  CC      net/socket.o
  CC      lib/once.o
  CC      fs/btrfs/delayed-ref.o
  CC      drivers/acpi/acpica/dbconvert.o
  CC      arch/x86/kernel/kvmclock.o
  CC [M]  drivers/misc/xilinx_sdfec.o
  CC [M]  fs/smb/client/export.o
  CC      kernel/bpf/bpf_cgrp_storage.o
  CC [M]  drivers/regulator/pv88080-regulator.o
  CC      drivers/acpi/proc.o
  CC      mm/zpool.o
  CC      net/handshake/trace.o
  CC      drivers/mfd/tps65090.o
  CC      lib/refcount.o
  CC [M]  net/sunrpc/clnt.o
  CC      net/ipv6/exthdrs.o
  CC [M]  net/rds/bind.o
  CC [M]  fs/nfs/mount_clnt.o
  CC [M]  net/netfilter/nf_conntrack_sane.o
  CC [M]  drivers/misc/tps6594-esm.o
  CC      drivers/acpi/acpica/dbdisply.o
  CC      fs/pipe.o
  CC [M]  net/sunrpc/auth_gss/gss_rpc_upcall.o
  CC [M]  net/vmw_vsock/af_vsock_tap.o
  CC      net/compat.o
  CC [M]  fs/nfs/nfstrace.o
  CC      net/sysctl_net.o
  CC [M]  drivers/regulator/pv88090-regulator.o
  CC [M]  net/llc/llc_c_st.o
  CC [M]  net/sunrpc/xprt.o
  CC      net/ipv4/tcp_rate.o
  CC      lib/rcuref.o
  CC [M]  net/sctp/sm_sideeffect.o
  CC      drivers/acpi/acpica/dbexec.o
  CC [M]  net/vmw_vsock/vsock_addr.o
  CC [M]  drivers/misc/tps6594-pfsm.o
  CC      drivers/mfd/aat2870-core.o
  CC      net/ipv4/tcp_recovery.o
  CC      kernel/bpf/cgroup.o
  CC      lib/usercopy.o
  CC [M]  drivers/misc/nsm.o
  CC [M]  crypto/ecdsa-x962.o
  CC [M]  net/dccp/options.o
  CC      lib/errseq.o
  CC      net/ipv4/tcp_ulp.o
  CC      arch/x86/kernel/paravirt.o
  CC      mm/zsmalloc.o
  CC [M]  net/bridge/netfilter/ebt_among.o
  CC [M]  net/tls/tls_device.o
  CC      fs/btrfs/relocation.o
  CC [M]  net/vmw_vsock/vsock_bpf.o
  CC      fs/btrfs/delayed-inode.o
  CC      kernel/umh.o
  CC      net/ipv6/datagram.o
  CC [M]  net/rds/cong.o
  CC [M]  net/netfilter/nf_conntrack_sip.o
  CC      drivers/acpi/acpica/dbhistry.o
  CC [M]  net/netfilter/nf_conntrack_tftp.o
  AR      net/handshake/built-in.a
  CC [M]  net/netfilter/nf_log_syslog.o
  LD [M]  crypto/aegis128.o
  CC [M]  drivers/regulator/pwm-regulator.o
  CC      drivers/acpi/acpica/dbinput.o
  CC      lib/bucket_locks.o
  CC [M]  net/rds/connection.o
  CC [M]  fs/smb/client/unc.o
  CC [M]  fs/smb/client/winucase.o
  CC [M]  fs/smb/client/smb2ops.o
  CC      arch/x86/kernel/paravirt-spinlocks.o
  CC [M]  net/sunrpc/auth_gss/gss_rpc_xdr.o
  CC [M]  crypto/ecrdsa.o
  CC [M]  net/llc/llc_pdu.o
  LD [M]  crypto/crypto_simd.o
  CC [M]  net/9p/protocol.o
  CC [M]  net/rds/info.o
  CC      kernel/bpf/reuseport_array.o
  CC      drivers/mfd/intel-lpss.o
  AR      drivers/misc/built-in.a
  CC      drivers/acpi/acpica/dbmethod.o
  CC      kernel/workqueue.o
  CC [M]  fs/smb/client/smb2maperror.o
  CC [M]  drivers/regulator/tps51632-regulator.o
  CC [M]  net/netfilter/nf_nat_core.o
  CC      mm/early_ioremap.o
  CC      net/ipv4/tcp_offload.o
  CC      drivers/mfd/intel-lpss-pci.o
  CC [M]  net/tls/tls_device_fallback.o
  CC [M]  net/rds/message.o
  CC [M]  net/bridge/netfilter/ebt_arp.o
  CC      crypto/rsapubkey.asn1.o
  CC      kernel/bpf/bpf_struct_ops.o
  CC      drivers/acpi/bus.o
  CC [M]  net/sctp/protocol.o
  CC      crypto/rsaprivkey.asn1.o
  CC [M]  fs/smb/client/smb2transport.o
  CC      drivers/acpi/acpica/dbnames.o
  CC [M]  net/netfilter/nf_nat_proto.o
  LD [M]  crypto/ecdsa_generic.o
  CC [M]  net/vmw_vsock/diag.o
  LD [M]  crypto/ecrdsa_generic.o
  AR      crypto/built-in.a
  CC [M]  net/9p/trans_common.o
  CC      arch/x86/kernel/pvclock.o
  CC      lib/generic-radix-tree.o
  CC [M]  net/llc/llc_sap.o
  CC      drivers/mfd/intel-lpss-acpi.o
  CC [M]  drivers/regulator/pcap-regulator.o
  CC [M]  net/bridge/br_forward.o
  CC [M]  net/sctp/endpointola.o
  CC      drivers/mfd/palmas.o
  CC [M]  net/sunrpc/auth_gss/trace.o
  CC [M]  net/bridge/br_if.o
  CC      lib/bitmap-str.o
  CC [M]  net/sunrpc/socklib.o
  CC      drivers/mfd/rc5t583.o
  CC      kernel/pid.o
  CC      mm/numa.o
  CC      drivers/acpi/acpica/dbobject.o
  CC [M]  net/llc/llc_s_ac.o
  CC [M]  net/sctp/associola.o
  CC      kernel/task_work.o
  CC      net/ipv4/tcp_plb.o
  CC [M]  net/dccp/output.o
  CC [M]  net/dccp/proto.o
  CC [M]  net/9p/trans_fd.o
  CC [M]  net/bridge/netfilter/ebt_ip.o
  CC      mm/numa_memblks.o
  CC      kernel/extable.o
  CC [M]  net/vmw_vsock/vmci_transport.o
  CC [M]  fs/smb/client/smb2misc.o
  CC [M]  drivers/regulator/raa215300.o
  CC [M]  net/sunrpc/xprtsock.o
  CC      net/ipv6/ip6_flowlabel.o
  CC [M]  net/netfilter/nf_nat_helper.o
  CC      drivers/acpi/acpica/dbstats.o
  CC      fs/btrfs/scrub.o
  CC      arch/x86/kernel/pmem.o
  CC [M]  net/sunrpc/sched.o
  CC [M]  net/bridge/br_input.o
  CC      fs/namei.o
  CC      kernel/bpf/cpumask.o
  CC      drivers/acpi/glue.o
  CC [M]  net/bridge/netfilter/ebt_ip6.o
  CC      lib/string_helpers.o
  CC [M]  net/vmw_vsock/vmci_transport_notify.o
  CC [M]  fs/nfs/export.o
  CC [M]  net/bridge/netfilter/ebt_limit.o
  CC      drivers/acpi/acpica/dbutils.o
  CC [M]  fs/nfs/sysfs.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_mech.o
  CC      kernel/bpf/bpf_lsm.o
  CC [M]  net/llc/llc_s_ev.o
  CC [M]  net/netfilter/nf_nat_redirect.o
  CC [M]  net/rds/recv.o
  CC      kernel/params.o
  CC      fs/fcntl.o
  CC [M]  net/bridge/netfilter/ebt_mark_m.o
  CC      fs/ioctl.o
  CC [M]  drivers/regulator/rc5t583-regulator.o
  CC      drivers/mfd/rc5t583-irq.o
  CC      arch/x86/kernel/jailhouse.o
  CC [M]  fs/nfs/fs_context.o
  LD [M]  net/tls/tls.o
  CC      fs/readdir.o
  CC      kernel/kthread.o
  CC      drivers/acpi/acpica/dbxface.o
  CC      mm/balloon_compaction.o
  CC      net/ipv4/datagram.o
  CC [M]  net/9p/trans_xen.o
  CC [M]  net/sctp/transport.o
  CC      fs/btrfs/backref.o
  CC      net/ipv6/inet6_connection_sock.o
  CC      drivers/acpi/acpica/rsdump.o
  CC [M]  net/llc/llc_s_st.o
  CC      fs/btrfs/ulist.o
  CC [M]  net/rds/send.o
  CC [M]  net/bridge/br_ioctl.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_seal.o
  CC [M]  net/dccp/timer.o
  CC [M]  net/vmw_vsock/vmci_transport_notify_qstate.o
  CC      arch/x86/kernel/pcspeaker.o
  CC      fs/select.o
  CC      drivers/mfd/syscon.o
  CC      kernel/bpf/crypto.o
  CC [M]  drivers/regulator/rt4801-regulator.o
  CC [M]  net/dccp/qpolicy.o
  CC      mm/secretmem.o
  CC      arch/x86/kernel/check.o
  CC [M]  net/dccp/ccids/ccid2.o
  CC      lib/hexdump.o
  CC      arch/x86/kernel/uprobes.o
  CC [M]  net/bridge/netfilter/ebt_pkttype.o
  AR      drivers/acpi/acpica/built-in.a
  CC      drivers/acpi/scan.o
  CC [M]  fs/nfs/sysctl.o
  CC      fs/btrfs/qgroup.o
  CC      mm/userfaultfd.o
  CC [M]  net/9p/trans_virtio.o
  CC      lib/kstrtox.o
  CC      drivers/acpi/mipi-disco-img.o
  CC [M]  net/bridge/netfilter/ebt_stp.o
  CC [M]  net/dccp/ackvec.o
  CC      fs/btrfs/send.o
  CC [M]  fs/smb/client/smb2pdu.o
  CC [M]  net/llc/af_llc.o
  CC      net/ipv6/udp_offload.o
  CC [M]  net/sctp/chunk.o
  CC      kernel/bpf/relo_core.o
  CC [M]  net/rds/stats.o
  CC      arch/x86/kernel/perf_regs.o
  CC      drivers/mfd/as3711.o
  CC [M]  fs/nfs/fscache.o
  CC      fs/btrfs/dev-replace.o
  CC      kernel/bpf/btf_iter.o
  CC [M]  net/netfilter/nf_nat_masquerade.o
  CC [M]  drivers/regulator/rt4803.o
  CC [M]  net/rds/sysctl.o
  LD [M]  net/9p/9pnet.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_unseal.o
  CC      drivers/mfd/intel_soc_pmic_crc.o
  CC      kernel/sys_ni.o
  CC [M]  net/vmw_vsock/virtio_transport.o
  CC [M]  net/bridge/netfilter/ebt_vlan.o
  LD [M]  net/9p/9pnet_fd.o
  CC [M]  net/rds/threads.o
  CC      arch/x86/kernel/tracepoint.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_wrap.o
  CC      mm/page_idle.o
  CC      fs/dcache.o
  CC [M]  net/netfilter/nf_nat_ovs.o
  CC      kernel/bpf/btf_relocate.o
  CC      net/ipv4/raw.o
  CC      lib/debug_info.o
  CC      arch/x86/kernel/itmt.o
  CC [M]  net/bridge/br_stp.o
  CC      kernel/bpf/kmem_cache_iter.o
  CC [M]  drivers/regulator/rt4831-regulator.o
  CC      net/ipv4/udp.o
  CC [M]  net/llc/llc_station.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_crypto.o
  CC      fs/inode.o
  CC      net/ipv4/udplite.o
  CC      mm/usercopy.o
  CC      net/ipv6/seg6.o
  CC [M]  net/netfilter/nf_nat_amanda.o
  LD [M]  net/9p/9pnet_xen.o
  LD [M]  net/9p/9pnet_virtio.o
  CC [M]  net/bridge/br_stp_bpdu.o
  CC      lib/iomap.o
  CC      drivers/mfd/intel_soc_pmic_chtwc.o
  CC      mm/memremap.o
  CC      net/ipv6/fib6_notifier.o
  CC [M]  net/bridge/br_stp_if.o
  CC [M]  fs/smb/client/smb2inode.o
  CC [M]  net/sctp/sm_make_chunk.o
  CC [M]  net/dccp/sysctl.o
  CC      arch/x86/kernel/umip.o
  CC      net/ipv4/udp_offload.o
  CC      mm/hmm.o
  CC      fs/attr.o
  CC [M]  net/bridge/netfilter/ebt_arpreply.o
  CC [M]  net/netfilter/nf_nat_ftp.o
  CC      drivers/acpi/resource.o
  CC      fs/bad_inode.o
  CC      fs/btrfs/raid56.o
  CC [M]  drivers/regulator/rt5033-regulator.o
  CC [M]  net/vmw_vsock/virtio_transport_common.o
  CC      fs/file.o
  CC [M]  net/sunrpc/auth.o
  CC      net/ipv4/arp.o
  AR      kernel/bpf/built-in.a
  CC      kernel/nsproxy.o
  CC [M]  net/rds/transport.o
  CC [M]  fs/nfs/nfs2super.o
  CC [M]  fs/smb/client/smb2file.o
  CC [M]  net/sctp/ulpevent.o
  CC [M]  drivers/mfd/88pm800.o
  CC [M]  net/llc/llc_proc.o
  CC      net/ipv6/rpl.o
  CC      drivers/acpi/acpi_processor.o
  CC      arch/x86/kernel/unwind_frame.o
  CC [M]  net/bridge/netfilter/ebt_mark.o
  CC [M]  net/sunrpc/auth_null.o
  CC      kernel/notifier.o
  CC [M]  fs/smb/client/cifsacl.o
  CC [M]  drivers/regulator/rt5120-regulator.o
  CC      net/ipv4/icmp.o
  CC [M]  net/sunrpc/auth_tls.o
  CC [M]  fs/smb/client/fs_context.o
  CC      lib/iomap_copy.o
  CC [M]  net/rds/loop.o
  CC      drivers/acpi/processor_core.o
  CC      drivers/acpi/processor_pdc.o
  CC [M]  net/sctp/inqueue.o
  CC [M]  net/llc/sysctl_net_llc.o
  CC [M]  net/dccp/ipv4.o
  CC [M]  net/netfilter/nf_nat_irc.o
  CC      net/ipv4/devinet.o
  CC      lib/devres.o
  CC [M]  net/vmw_vsock/hyperv_transport.o
  CC [M]  net/bridge/br_stp_timer.o
  CC [M]  drivers/mfd/88pm80x.o
  CC      drivers/acpi/ec.o
  CC [M]  drivers/mfd/88pm805.o
  CC [M]  fs/nfs/proc.o
  CC [M]  net/sctp/outqueue.o
  CC      mm/memfd.o
  CC [M]  fs/smb/client/dns_resolve.o
  CC [M]  net/sunrpc/auth_unix.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_keys.o
  CC      net/ipv6/ioam6.o
  CC [M]  net/bridge/netfilter/ebt_dnat.o
  CC [M]  drivers/regulator/rt5190a-regulator.o
  CC [M]  net/netfilter/nf_nat_sip.o
  CC [M]  net/rds/page.o
  LD [M]  net/llc/llc.o
  CC [M]  drivers/mfd/sm501.o
  CC [M]  net/vmw_vsock/vsock_loopback.o
  CC      arch/x86/kernel/callthunks.o
  LD [M]  net/llc/llc2.o
  CC [M]  net/netfilter/nf_nat_tftp.o
  CC      net/ipv6/sysctl_net_ipv6.o
  CC      lib/check_signature.o
  CC [M]  fs/nfs/nfs2xdr.o
  CC [M]  net/netfilter/nf_synproxy_core.o
  CC      fs/btrfs/uuid-tree.o
  CC      kernel/ksysfs.o
  CC      net/ipv4/af_inet.o
  CC [M]  net/bridge/netfilter/ebt_redirect.o
  CC [M]  drivers/mfd/bcm590xx.o
  CC      fs/filesystems.o
  CC      kernel/cred.o
  CC      net/ipv6/ip6mr.o
  CC [M]  drivers/regulator/rt5739.o
  CC [M]  drivers/regulator/rt5759-regulator.o
  CC [M]  net/netfilter/nf_conncount.o
  LD [M]  net/sunrpc/auth_gss/auth_rpcgss.o
  CC      net/ipv4/igmp.o
  CC      net/ipv6/xfrm6_policy.o
  CC      lib/interval_tree.o
  CC      arch/x86/kernel/cet.o
  CC      kernel/reboot.o
  CC [M]  drivers/regulator/rt6160-regulator.o
  CC      mm/ptdump.o
  CC      net/ipv4/fib_frontend.o
  CC      kernel/async.o
  CC      net/ipv6/xfrm6_state.o
  CC      net/ipv6/xfrm6_input.o
  CC      kernel/range.o
  CC [M]  net/dccp/ipv6.o
  LD [M]  net/vmw_vsock/vsock.o
  CC [M]  drivers/mfd/bd9571mwv.o
  CC      mm/page_reporting.o
  CC      mm/bootmem_info.o
  LD [M]  net/vmw_vsock/vsock_diag.o
  LD [M]  net/vmw_vsock/vmw_vsock_vmci_transport.o
  LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport.o
  LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport_common.o
  LD [M]  net/vmw_vsock/hv_sock.o
  CC [M]  net/sctp/ulpqueue.o
  CC [M]  net/sunrpc/svc.o
  CC      net/ipv6/xfrm6_output.o
  CC      mm/execmem.o
  CC      drivers/acpi/dock.o
  CC [M]  net/bridge/br_netlink.o
  CC      lib/assoc_array.o
  CC      net/ipv4/fib_semantics.o
  CC      kernel/smpboot.o
  ASN.1   fs/smb/client/cifs_spnego_negtokeninit.asn1.[ch]
  CC [M]  fs/smb/client/namespace.o
  CC [M]  net/sctp/tsnmap.o
  CC      mm/shmem_quota.o
  CC      lib/list_debug.o
  CC      fs/btrfs/props.o
  CC [M]  net/bridge/netfilter/ebt_snat.o
  CC      kernel/ucount.o
  CC      fs/btrfs/free-space-tree.o
  CC      net/ipv4/fib_trie.o
  CC      fs/btrfs/tree-checker.o
  CC      fs/namespace.o
  CC      mm/pt_reclaim.o
  CC      arch/x86/kernel/shstk.o
  CC [M]  drivers/regulator/rt6190-regulator.o
  LD [M]  net/sunrpc/auth_gss/rpcsec_gss_krb5.o
  CC [M]  net/bridge/br_netlink_tunnel.o
  CC [M]  fs/nfs/nfs3super.o
  CC [M]  mm/hwpoison-inject.o
  CC [M]  net/bridge/netfilter/ebt_log.o
  CC      lib/debugobjects.o
  CC [M]  drivers/mfd/cros_ec_dev.o
  CC [M]  net/bridge/netfilter/ebt_nflog.o
  CC      drivers/acpi/pci_root.o
  CC [M]  net/rds/rdma.o
  CC [M]  fs/smb/client/reparse.o
  CC [M]  fs/nfs/nfs3client.o
  CC      net/ipv6/xfrm6_protocol.o
  CC [M]  drivers/mfd/cs42l43.o
  CC      arch/x86/kernel/audit_64.o
  CC [M]  net/dccp/diag.o
  CC      fs/seq_file.o
  CC [M]  net/bridge/br_arp_nd_proxy.o
  CC [M]  fs/smb/client/xattr.o
  CC      net/ipv6/netfilter.o
  CC [M]  net/sunrpc/svcsock.o
  CC      net/ipv4/fib_notifier.o
  CC      kernel/regset.o
  CC [M]  fs/nfs/nfs3proc.o
  CC [M]  drivers/regulator/rt6245-regulator.o
  CC [M]  drivers/mfd/cs42l43-i2c.o
  CC      drivers/acpi/pci_link.o
  CC      fs/xattr.o
  CC      drivers/acpi/pci_irq.o
  CC      lib/bitrev.o
  CC [M]  net/sctp/bind_addr.o
  CC [M]  net/bridge/br_sysfs_if.o
  CC      fs/btrfs/space-info.o
  CC      fs/btrfs/block-rsv.o
  CC      lib/linear_ranges.o
  CC      arch/x86/kernel/amd_gart_64.o
  AR      mm/built-in.a
  CC [M]  net/sctp/socket.o
  CC      fs/libfs.o
  CC [M]  net/netfilter/nf_dup_netdev.o
  CC [M]  net/sunrpc/svcauth.o
  CC [M]  fs/smb/client/cifs_spnego.o
  CC      drivers/acpi/acpi_apd.o
  CC      kernel/ksyms_common.o
  CC      drivers/acpi/acpi_platform.o
  CC      drivers/acpi/acpi_pnp.o
  CC [M]  net/rds/tcp.o
  CC [M]  drivers/regulator/rtmv20-regulator.o
  LD [M]  net/dccp/dccp.o
  CC      kernel/groups.o
  CC [M]  fs/nfs/nfs3xdr.o
  CC      fs/btrfs/delalloc-space.o
  CC      kernel/vhost_task.o
  CC      drivers/acpi/power.o
  LD [M]  net/dccp/dccp_ipv4.o
  LD [M]  net/dccp/dccp_ipv6.o
  CC      fs/btrfs/block-group.o
  LD [M]  net/dccp/dccp_diag.o
  CC      fs/fs-writeback.o
  CC [M]  net/bridge/br_sysfs_br.o
  CC      drivers/acpi/event.o
  CC [M]  fs/nfs/nfs3acl.o
  CC      lib/packing.o
  CC [M]  net/bridge/br_nf_core.o
  CC      fs/pnode.o
  CC [M]  drivers/regulator/rtq2134-regulator.o
  CC      fs/btrfs/discard.o
  CC [M]  drivers/mfd/lp873x.o
  CC      drivers/acpi/evged.o
  CC [M]  net/rds/tcp_connect.o
  CC [M]  drivers/regulator/rtq6752-regulator.o
  CC      fs/splice.o
  CC      arch/x86/kernel/aperture_64.o
  CC      net/ipv6/fib6_rules.o
  CC [M]  net/sctp/primitive.o
  CC      fs/sync.o
  CC [M]  net/sunrpc/svcauth_unix.o
  CC [M]  net/rds/tcp_listen.o
  CC      fs/utimes.o
  CC [M]  drivers/regulator/rtq2208-regulator.o
  CC      fs/btrfs/reflink.o
  CC [M]  net/rds/tcp_recv.o
  CC [M]  fs/smb/client/dfs_cache.o
  CC [M]  drivers/mfd/tqmx86.o
  CC      lib/crc-ccitt.o
  CC      fs/d_path.o
  CC      fs/stack.o
  CC      net/ipv6/proc.o
  CC [M]  net/sctp/output.o
  CC      net/ipv6/syncookies.o
  CC [M]  net/sctp/input.o
  CC [M]  net/sunrpc/addr.o
  CC [M]  fs/nfs/nfs4proc.o
  CC [M]  drivers/regulator/sky81452-regulator.o
  CC [M]  net/netfilter/nf_tables_core.o
  CC [M]  net/sunrpc/rpcb_clnt.o
  CC [M]  net/sctp/debug.o
  CC      arch/x86/kernel/mmconf-fam10h_64.o
  CC [M]  net/netfilter/nf_tables_api.o
  CC [M]  net/rds/tcp_send.o
  CC      drivers/acpi/sysfs.o
  CC      fs/fs_struct.o
  CC [M]  net/netfilter/nft_chain_filter.o
  CC [M]  fs/smb/client/dfs.o
  CC [M]  drivers/regulator/slg51000-regulator.o
  CC      kernel/kcmp.o
  CC [M]  fs/nfs/nfs4xdr.o
  CC      lib/crc16.o
  CC [M]  net/bridge/br_multicast.o
  CC [M]  drivers/mfd/arizona-core.o
  CC      arch/x86/kernel/vsmp_64.o
  CC [M]  drivers/regulator/sy7636a-regulator.o
  CC      net/ipv4/inet_fragment.o
  CC [M]  net/rds/tcp_stats.o
  CC [M]  arch/x86/kernel/msr.o
  LD [M]  net/rds/rds.o
  CC      drivers/acpi/property.o
  CC [M]  drivers/regulator/tps6105x-regulator.o
  CC [M]  net/sctp/stream.o
  CC [M]  drivers/regulator/tps62360-regulator.o
  CC [M]  arch/x86/kernel/cpuid.o
  CC [M]  net/netfilter/nf_tables_trace.o
  CC      lib/crc-t10dif.o
  CC      kernel/freezer.o
  CC [M]  net/sctp/auth.o
  CC [M]  net/bridge/br_mdb.o
  CC [M]  fs/nfs/nfs4state.o
  CC [M]  fs/smb/client/netlink.o
  CC [M]  net/netfilter/nft_immediate.o
  CC [M]  fs/smb/client/cifs_swn.o
  CC [M]  drivers/regulator/tps65023-regulator.o
  CC [M]  net/sctp/offload.o
  CC      lib/crc-itu-t.o
  HOSTCC  lib/gen_crc32table
  CC [M]  fs/nfs/nfs4renewd.o
  CC      kernel/profile.o
  CC      net/ipv4/ping.o
  CC [M]  drivers/mfd/arizona-irq.o
  CC [M]  drivers/regulator/tps6507x-regulator.o
  CC      kernel/stacktrace.o
  CC      fs/statfs.o
  CC [M]  drivers/mfd/wm5102-tables.o
  CC [M]  drivers/mfd/wm5110-tables.o
  CC [M]  fs/nfs/nfs4super.o
  CC [M]  drivers/mfd/wm8997-tables.o
  AR      arch/x86/kernel/built-in.a
  CC [M]  fs/smb/client/fscache.o
  CC [M]  drivers/regulator/tps65086-regulator.o
  AR      arch/x86/built-in.a
  CC [M]  net/bridge/br_multicast_eht.o
  CC [M]  net/sunrpc/timer.o
  CC [M]  net/bridge/br_vlan.o
  LD [M]  net/rds/rds_tcp.o
  CC [M]  net/sunrpc/xdr.o
  CC      net/ipv6/calipso.o
  CC      fs/btrfs/subpage.o
  CC [M]  drivers/mfd/wm8998-tables.o
  CC [M]  drivers/mfd/cs47l24-tables.o
  CC      drivers/acpi/debugfs.o
  CC [M]  fs/nfs/nfs4file.o
  CC      fs/fs_pin.o
  CC [M]  net/netfilter/nft_cmp.o
  CC      net/ipv6/seg6_iptunnel.o
  HOSTCC  lib/gen_crc64table
  CC      fs/btrfs/tree-mod-log.o
  CC      drivers/acpi/acpi_lpat.o
  CC [M]  drivers/regulator/tps65090-regulator.o
  CC [M]  net/bridge/br_vlan_tunnel.o
  CC      lib/xxhash.o
  CC      net/ipv6/seg6_local.o
  CC      lib/genalloc.o
  CC [M]  drivers/regulator/tps6524x-regulator.o
  CC [M]  fs/nfs/delegation.o
  CC      fs/nsfs.o
  CC      kernel/dma.o
  CC [M]  fs/smb/client/smb1ops.o
  CC      drivers/acpi/acpi_fpdt.o
  CC      lib/textsearch.o
  CC [M]  drivers/mfd/arizona-i2c.o
  CC      net/ipv4/ip_tunnel_core.o
  CC [M]  net/sunrpc/sunrpc_syms.o
  CC      drivers/acpi/acpi_lpit.o
  CC [M]  fs/smb/client/cifssmb.o
  CC [M]  drivers/mfd/arizona-spi.o
  CC      drivers/acpi/acpi_watchdog.o
  CC [M]  net/sunrpc/cache.o
  CC [M]  drivers/regulator/tps6586x-regulator.o
  CC      fs/fs_types.o
  CC [M]  net/sctp/stream_sched.o
  CC      net/ipv4/gre_offload.o
  CC      lib/percpu_counter.o
  CC [M]  net/netfilter/nft_range.o
  CC [M]  net/sunrpc/rpc_pipe.o
  CC [M]  fs/nfs/nfs4idmap.o
  CC      net/ipv6/seg6_hmac.o
  CC      fs/btrfs/extent-io-tree.o
  CC [M]  fs/smb/client/cifs_spnego_negtokeninit.asn1.o
  CC [M]  net/netfilter/nft_bitwise.o
  CC [M]  drivers/regulator/tps65910-regulator.o
  CC      fs/fs_context.o
  CC      net/ipv6/ioam6_iptunnel.o
  CC [M]  fs/nfs/callback.o
  CC      kernel/smp.o
  CC      lib/iommu-helper.o
  CC [M]  net/sctp/stream_sched_prio.o
  CC      fs/fs_parser.o
  CC      lib/fault-inject.o
  CC      net/ipv4/metrics.o
  CC      drivers/acpi/prmt.o
  CC [M]  net/sunrpc/sysfs.o
  CC [M]  fs/smb/client/asn1.o
  CC [M]  net/bridge/br_vlan_options.o
  CC      net/ipv6/addrconf_core.o
  CC [M]  drivers/regulator/tps65912-regulator.o
  CC [M]  drivers/mfd/wcd934x.o
  CC      net/ipv6/exthdrs_core.o
  CC      lib/error-inject.o
  CC [M]  net/sunrpc/svc_xprt.o
  CC [M]  net/bridge/br_mst.o
  CC      drivers/acpi/acpi_pcc.o
  CC      net/ipv6/ip6_checksum.o
  CC [M]  fs/nfs/callback_xdr.o
  CC      fs/fsopen.o
  CC      lib/syscall.o
  CC [M]  fs/nfs/callback_proc.o
  CC      drivers/acpi/acpi_ffh.o
  CC [M]  drivers/regulator/tps65132-regulator.o
  CC      drivers/acpi/acpi_adxl.o
  CC      fs/init.o
  CC [M]  net/netfilter/nft_byteorder.o
  CC      kernel/uid16.o
  CC [M]  drivers/mfd/wm8994-core.o
  CC [M]  net/netfilter/nft_payload.o
  CC [M]  net/sctp/stream_sched_rr.o
  CC [M]  fs/nfs/nfs4namespace.o
  CC      net/ipv4/netlink.o
  CC      drivers/acpi/ac.o
  CC      lib/dynamic_debug.o
  CC      net/ipv4/nexthop.o
  CC      net/ipv6/ip6_icmp.o
  CC [M]  net/sctp/stream_sched_fc.o
  CC [M]  fs/nfs/nfs4getroot.o
  CC [M]  fs/nfs/nfs4client.o
  CC      fs/btrfs/fs.o
  CC [M]  fs/nfs/nfs4session.o
  CC [M]  drivers/mfd/wm8994-irq.o
  CC      net/ipv4/udp_tunnel_stub.o
  CC      lib/errname.o
  CC      kernel/module_signature.o
  CC [M]  net/bridge/br_switchdev.o
  CC      fs/btrfs/messages.o
  CC [M]  drivers/regulator/tps68470-regulator.o
  CC [M]  net/netfilter/nft_lookup.o
  CC      kernel/kallsyms.o
  CC [M]  drivers/mfd/wm8994-regmap.o
  CC      net/ipv6/output_core.o
  CC      drivers/acpi/button.o
  CC      net/ipv4/sysctl_net_ipv4.o
  CC      fs/btrfs/bio.o
  CC [M]  net/netfilter/nft_dynset.o
  CC      kernel/acct.o
  CC      fs/kernel_read_file.o
  CC [M]  net/sctp/stream_interleave.o
  CC [M]  net/bridge/br_mrp_switchdev.o
  CC      fs/btrfs/lru_cache.o
  CC [M]  drivers/regulator/twl-regulator.o
  CC [M]  drivers/regulator/twl6030-regulator.o
  CC      fs/btrfs/raid-stripe-tree.o
  CC [M]  fs/nfs/dns_resolve.o
  CC [M]  net/netfilter/nft_meta.o
  CC      lib/nlattr.o
  CC [M]  drivers/mfd/madera-core.o
  CC      lib/cpu_rmap.o
  CC      kernel/vmcore_info.o
  CC [M]  net/sctp/proc.o
  CC      kernel/elfcorehdr.o
  CC      drivers/acpi/fan_core.o
  CC [M]  net/netfilter/nft_rt.o
  CC [M]  drivers/mfd/cs47l15-tables.o
  CC [M]  net/sctp/sysctl.o
  CC      fs/btrfs/fiemap.o
  CC      fs/mnt_idmapping.o
  CC      kernel/crash_reserve.o
  CC      lib/closure.o
  CC [M]  drivers/mfd/cs47l35-tables.o
  CC      drivers/acpi/fan_attr.o
  CC [M]  net/sctp/ipv6.o
  CC [M]  net/sunrpc/xprtmultipath.o
  CC      net/ipv4/proc.o
  CC [M]  net/sunrpc/debugfs.o
  CC      lib/dynamic_queue_limits.o
  CC      fs/btrfs/direct-io.o
  CC [M]  drivers/regulator/wm831x-dcdc.o
  CC      lib/glob.o
  LD [M]  fs/smb/client/cifs.o
  CC      kernel/kexec_core.o
  CC [M]  drivers/mfd/cs47l85-tables.o
  CC      fs/remap_range.o
  CC [M]  net/sunrpc/backchannel_rqst.o
  CC      kernel/crash_core.o
  CC [M]  net/bridge/br_mrp.o
  CC      fs/btrfs/acl.o
  CC      net/ipv4/fib_rules.o
  CC [M]  drivers/mfd/cs47l90-tables.o
  CC [M]  drivers/regulator/wm831x-isink.o
  CC      kernel/kexec.o
  CC      drivers/acpi/fan_hwmon.o
  CC [M]  net/netfilter/nft_exthdr.o
  CC      fs/pidfs.o
  CC      fs/buffer.o
  CC [M]  drivers/mfd/cs47l92-tables.o
  CC      drivers/acpi/pci_slot.o
  CC [M]  net/netfilter/nft_last.o
  CC      net/ipv4/ipmr.o
  CC [M]  fs/nfs/nfs4trace.o
  CC [M]  drivers/regulator/wm831x-ldo.o
  CC      net/ipv6/protocol.o
  CC      fs/btrfs/zoned.o
  CC [M]  drivers/mfd/madera-i2c.o
  CC [M]  net/bridge/br_mrp_netlink.o
  CC      fs/mpage.o
  CC [M]  net/sunrpc/stats.o
  CC [M]  drivers/mfd/madera-spi.o
  CC [M]  net/sctp/diag.o
  CC      net/ipv4/ipmr_base.o
  CC      drivers/acpi/processor_driver.o
  CC      fs/proc_namespace.o
  CC      net/ipv4/syncookies.o
  CC      net/ipv6/ip6_offload.o
  CC      drivers/acpi/processor_thermal.o
  CC [M]  drivers/mfd/cs40l50-core.o
  CC      fs/btrfs/verity.o
  CC      lib/digsig.o
  CC      fs/direct-io.o
  CC      net/ipv6/tcpv6_offload.o
  CC [M]  fs/nfs/nfs4sysctl.o
  CC      fs/eventpoll.o
  CC [M]  net/bridge/br_cfm.o
  CC      kernel/kexec_file.o
  CC      drivers/acpi/processor_idle.o
  CC      kernel/compat.o
  CC      drivers/acpi/processor_throttling.o
  CC      fs/anon_inodes.o
  CC [M]  net/sunrpc/sysctl.o
  CC [M]  net/bridge/br_cfm_netlink.o
  CC [M]  drivers/regulator/wm8350-regulator.o
  CC [M]  drivers/mfd/cs40l50-i2c.o
  CC [M]  fs/nfs/pnfs.o
  CC [M]  drivers/mfd/cs40l50-spi.o
  CC [M]  drivers/regulator/wm8400-regulator.o
  CC      fs/signalfd.o
  LD [M]  net/sctp/sctp.o
  CC [M]  fs/nfs/pnfs_dev.o
  CC      fs/timerfd.o
  CC      fs/eventfd.o
  CC      lib/strncpy_from_user.o
  CC      fs/userfaultfd.o
  CC [M]  fs/nfs/pnfs_nfs.o
  CC      fs/aio.o
  CC      kernel/utsname.o
  CC      lib/strnlen_user.o
  CC [M]  drivers/mfd/tps6105x.o
  CC [M]  drivers/regulator/wm8994-regulator.o
  CC [M]  net/netfilter/nft_counter.o
  CC      net/ipv4/netfilter.o
  CC [M]  fs/nfs/nfs42proc.o
  LD [M]  net/sctp/sctp_diag.o
  CC      fs/dax.o
  CC [M]  net/netfilter/nft_objref.o
  CC      net/ipv4/tcp_cubic.o
  CC      net/ipv4/tcp_sigpool.o
  CC      drivers/acpi/processor_perflib.o
  CC      kernel/user_namespace.o
  CC [M]  net/netfilter/nft_inner.o
  CC [M]  drivers/mfd/tps65010.o
  CC      lib/net_utils.o
  CC [M]  net/netfilter/nft_chain_route.o
  CC [M]  net/bridge/br_netfilter_hooks.o
  CC      net/ipv6/exthdrs_offload.o
  CC      drivers/acpi/container.o
  CC [M]  net/bridge/br_netfilter_ipv6.o
  CC      net/ipv6/inet6_hashtables.o
  CC [M]  fs/nfs/nfs42xattr.o
  CC      net/ipv4/tcp_bpf.o
  CC [M]  drivers/mfd/tps6507x.o
  CC      drivers/acpi/thermal_lib.o
  CC      lib/sg_pool.o
  CC      kernel/pid_namespace.o
  CC      net/ipv4/udp_bpf.o
  LD [M]  fs/nfs/nfs.o
  CC      net/ipv6/mcast_snoop.o
  LD [M]  fs/nfs/nfsv2.o
  CC      lib/memregion.o
  CC      net/ipv4/cipso_ipv4.o
  CC      lib/irq_poll.o
  CC [M]  net/netfilter/nf_tables_offload.o
  CC      net/ipv6/tcp_ao.o
  CC      lib/stackdepot.o
  CC [M]  net/netfilter/nft_set_hash.o
  AR      fs/btrfs/built-in.a
  CC      drivers/acpi/thermal.o
  LD [M]  net/bridge/bridge.o
  LD [M]  fs/nfs/nfsv3.o
  CC [M]  drivers/mfd/tps65086.o
  CC [M]  net/ipv6/ah6.o
  CC      net/ipv4/xfrm4_policy.o
  UPD     kernel/config_data
  CC [M]  net/ipv6/esp6.o
  LD [M]  net/sunrpc/sunrpc.o
  CC      fs/locks.o
  CC      net/ipv4/xfrm4_state.o
  CC      drivers/acpi/nhlt.o
  CC      kernel/stop_machine.o
  CC [M]  net/ipv6/esp6_offload.o
  CC      net/ipv4/xfrm4_input.o
  CC [M]  drivers/mfd/tps6594-core.o
  CC      fs/binfmt_script.o
  CC      kernel/audit.o
  CC      fs/binfmt_elf.o
  CC [M]  drivers/mfd/tps6594-i2c.o
  AR      drivers/regulator/built-in.a
  CC      fs/compat_binfmt_elf.o
  CC [M]  net/netfilter/nft_set_bitmap.o
  CC      fs/backing-file.o
  CC [M]  drivers/mfd/tps6594-spi.o
  CC [M]  net/ipv6/ipcomp6.o
  CC      lib/ref_tracker.o
  CC      drivers/acpi/acpi_memhotplug.o
  CC [M]  net/ipv6/xfrm6_tunnel.o
  CC [M]  net/netfilter/nft_set_rbtree.o
  CC      drivers/acpi/ioapic.o
  CC      drivers/acpi/battery.o
  CC [M]  net/netfilter/nft_set_pipapo.o
  CC      drivers/acpi/hed.o
  CC      kernel/auditfilter.o
  CC [M]  drivers/mfd/mc13xxx-core.o
  CC [M]  net/netfilter/nft_set_pipapo_avx2.o
  CC      fs/mbcache.o
  CC      lib/bootconfig.o
  CC [M]  net/netfilter/nft_ct_fast.o
  CC      drivers/acpi/bgrt.o
  CC [M]  drivers/mfd/mc13xxx-spi.o
  CC      net/ipv4/xfrm4_output.o
  CC      drivers/acpi/cppc_acpi.o
  CC      lib/asn1_decoder.o
  CC      drivers/acpi/spcr.o
  CC      kernel/auditsc.o
  LD [M]  net/bridge/br_netfilter.o
  CC      fs/posix_acl.o
  CC      lib/asn1_encoder.o
  CC      fs/coredump.o
  CC      fs/drop_caches.o
  GEN     lib/oid_registry_data.c
  CC      fs/sysctls.o
  CC      kernel/audit_watch.o
  CC      lib/ucs2_string.o
  CC [M]  drivers/mfd/mc13xxx-i2c.o
  CC      net/ipv4/xfrm4_protocol.o
  CC      fs/fhandle.o
  CC [M]  net/netfilter/nft_compat.o
  CC      lib/ubsan.o
  CC      fs/bpf_fs_kfuncs.o
  CC [M]  net/netfilter/nft_connlimit.o
  CC [M]  drivers/mfd/ocelot-core.o
  CC [M]  fs/binfmt_misc.o
  CC [M]  drivers/mfd/ocelot-spi.o
  CC      kernel/audit_fsnotify.o
  CC [M]  net/netfilter/nft_numgen.o
  CC      lib/sbitmap.o
  CC      net/ipv4/tcp_ao.o
  CC      drivers/acpi/acpi_dbg.o
  CC      kernel/audit_tree.o
  CC [M]  net/netfilter/nft_ct.o
  CC      drivers/acpi/viot.o
  CC      lib/group_cpus.o
  CC [M]  net/ipv6/tunnel6.o
  CC [M]  net/ipv6/mip6.o
  CC [M]  net/ipv6/ip6_vti.o
  CC [M]  net/ipv6/sit.o
  CC [M]  drivers/acpi/acpi_ipmi.o
  CC      net/ipv4/bpf_tcp_ca.o
  CC      kernel/kprobes.o
  CC      lib/fw_table.o
  CC [M]  drivers/mfd/axp20x.o
  CC [M]  net/ipv6/ip6_tunnel.o
  CC [M]  net/ipv6/ip6_gre.o
  CC [M]  net/ipv4/ip_tunnel.o
  CC [M]  drivers/mfd/axp20x-i2c.o
  CC [M]  lib/crc7.o
  CC [M]  net/netfilter/nft_flow_offload.o
  CC [M]  lib/crc8.o
  CC      kernel/fail_function.o
  CC      kernel/hung_task.o
  CC [M]  drivers/mfd/lp3943.o
  CC [M]  net/netfilter/nft_limit.o
  CC [M]  net/netfilter/nft_nat.o
  CC [M]  net/ipv4/ipip.o
  CC [M]  lib/bch.o
  CC [M]  net/netfilter/nft_queue.o
  CC [M]  net/netfilter/nft_quota.o
  CC [M]  drivers/acpi/acpi_video.o
  CC      kernel/watchdog.o
  CC [M]  net/netfilter/nft_reject.o
  CC [M]  drivers/mfd/ti-lmu.o
  CC [M]  lib/ts_kmp.o
  CC [M]  net/netfilter/nft_reject_inet.o
  CC      kernel/watchdog_perf.o
  CC [M]  lib/ts_bm.o
  CC [M]  net/ipv6/fou6.o
  CC [M]  drivers/acpi/video_detect.o
  CC [M]  net/ipv4/fou_core.o
  CC [M]  lib/ts_fsm.o
  CC [M]  drivers/mfd/da9062-core.o
  CC [M]  drivers/mfd/da9150-core.o
  CC [M]  drivers/acpi/acpi_tad.o
  CC [M]  net/netfilter/nft_reject_netdev.o
  CC [M]  net/ipv4/fou_nl.o
  CC [M]  drivers/mfd/max77541.o
  CC [M]  drivers/mfd/max8907.o
  CC [M]  net/netfilter/nft_tunnel.o
  CC      kernel/seccomp.o
  CC [M]  net/ipv4/fou_bpf.o
  CC [M]  drivers/acpi/platform_profile.o
  CC [M]  drivers/mfd/mp2629.o
  CC [M]  lib/notifier-error-inject.o
  CC [M]  net/netfilter/nft_log.o
  CC [M]  drivers/acpi/sbshc.o
  CC [M]  net/ipv4/gre_demux.o
  CC [M]  drivers/acpi/sbs.o
  CC [M]  drivers/mfd/mt6360-core.o
  CC [M]  net/ipv4/ip_gre.o
  LD [M]  fs/nfs/nfsv4.o
  CC [M]  drivers/acpi/ec_sys.o
  AR      fs/built-in.a
  CC [M]  net/netfilter/nft_masq.o
  CC [M]  net/ipv6/ip6_udp_tunnel.o
  CC [M]  net/netfilter/nft_redir.o
  CC [M]  lib/pm-notifier-error-inject.o
  CC      kernel/relay.o
  CC [M]  drivers/acpi/pfr_update.o
  CC [M]  drivers/acpi/pfr_telemetry.o
  CC [M]  lib/memory-notifier-error-inject.o
  CC [M]  net/ipv4/udp_tunnel_core.o
  CC      kernel/utsname_sysctl.o
  CC [M]  lib/lru_cache.o
  CC [M]  drivers/acpi/acpi_pad.o
  CC [M]  net/ipv4/udp_tunnel_nic.o
  CC [M]  net/ipv4/ip_vti.o
  CC [M]  drivers/mfd/mt6370.o
  CC [M]  drivers/acpi/acpi_extlog.o
  CC [M]  drivers/mfd/mt6397-core.o
  CC [M]  net/netfilter/nft_hash.o
  CC      kernel/delayacct.o
  CC [M]  drivers/acpi/acpi_configfs.o
  CC [M]  net/ipv4/ah4.o
  CC [M]  net/netfilter/nft_fib.o
  CC      kernel/taskstats.o
  CC      kernel/tsacct.o
  CC [M]  net/netfilter/nft_fib_inet.o
  CC [M]  drivers/mfd/mt6397-irq.o
  CC [M]  net/ipv4/esp4.o
  CC      kernel/tracepoint.o
  CC [M]  drivers/mfd/mt6358-irq.o
  CC [M]  net/netfilter/nft_fib_netdev.o
  CC [M]  net/ipv4/esp4_offload.o
  CC      kernel/latencytop.o
  CC [M]  drivers/mfd/kempld-core.o
  CC [M]  net/ipv4/ipcomp.o
  CC [M]  net/netfilter/nft_socket.o
  CC      kernel/irq_work.o
  CC [M]  net/netfilter/nft_osf.o
  CC [M]  drivers/mfd/intel_quark_i2c_gpio.o
  CC [M]  net/ipv4/xfrm4_tunnel.o
  CC [M]  net/netfilter/nft_tproxy.o
  CC [M]  drivers/mfd/lpc_sch.o
  CC      kernel/static_call.o
  CC [M]  net/ipv4/tunnel4.o
  CC      kernel/static_call_inline.o
  CC [M]  net/ipv4/inet_diag.o
  CC [M]  net/netfilter/nft_xfrm.o
  CC      kernel/user-return-notifier.o
  CC [M]  drivers/mfd/lpc_ich.o
  CC      kernel/padata.o
  CC [M]  net/ipv4/tcp_diag.o
  CC [M]  net/netfilter/nft_synproxy.o
  CC [M]  net/ipv4/udp_diag.o
  CC [M]  drivers/mfd/rdc321x-southbridge.o
  CC [M]  net/ipv4/raw_diag.o
  AR      lib/lib.a
  GEN     lib/crc32table.h
  CC [M]  drivers/mfd/janz-cmodio.o
  GEN     lib/crc64table.h
  CC [M]  net/netfilter/nft_chain_nat.o
  CC      lib/oid_registry.o
  CC      kernel/jump_label.o
  LD [M]  drivers/acpi/video.o
  AR      drivers/acpi/built-in.a
  CC [M]  drivers/mfd/vx855.o
  AR      net/ipv6/built-in.a
  CC      kernel/context_tracking.o
  CC      lib/crc32.o
  CC [M]  drivers/mfd/wl1273-core.o
  CC [M]  net/netfilter/nft_dup_netdev.o
  CC      lib/crc64.o
  CC [M]  net/netfilter/nft_fwd_netdev.o
  CC      kernel/iomem.o
  CC      kernel/rseq.o
  CC [M]  drivers/mfd/si476x-cmd.o
  CC      kernel/watch_queue.o
  CC [M]  drivers/mfd/si476x-prop.o
  CHK     kernel/kheaders_data.tar.xz
  CC [M]  drivers/mfd/si476x-i2c.o
  CC [M]  net/netfilter/nf_flow_table_core.o
  GZIP    kernel/config_data.gz
  CC [M]  net/netfilter/nf_flow_table_ip.o
  CC      kernel/configs.o
  GEN     kernel/kheaders_data.tar.xz
  CC [M]  drivers/mfd/intel_pmc_bxt.o
  CC [M]  net/netfilter/nf_flow_table_offload.o
  LD [M]  net/ipv4/fou.o
  CC [M]  net/netfilter/nf_flow_table_xdp.o
  LD [M]  net/ipv4/gre.o
  CC [M]  drivers/mfd/viperboard.o
  AR      net/ipv4/built-in.a
  CC [M]  net/netfilter/nf_flow_table_inet.o
  CC [M]  drivers/mfd/lm3533-core.o
  CC [M]  drivers/mfd/lm3533-ctrlbank.o
  CC [M]  net/netfilter/x_tables.o
  CC [M]  drivers/mfd/retu-mfd.o
  CC [M]  net/netfilter/xt_tcpudp.o
  CC [M]  drivers/mfd/iqs62x.o
  CC [M]  drivers/mfd/menf21bmc.o
  CC [M]  net/netfilter/xt_mark.o
  CC [M]  drivers/mfd/dln2.o
  CC [M]  net/netfilter/xt_connmark.o
  CC [M]  net/netfilter/xt_nat.o
  CC [M]  drivers/mfd/rt4831.o
  CC [M]  net/netfilter/xt_AUDIT.o
  CC [M]  drivers/mfd/rt5033.o
  CC [M]  drivers/mfd/rt5120.o
  LD [M]  net/ipv4/udp_tunnel.o
  CC [M]  net/netfilter/xt_CHECKSUM.o
  CC [M]  drivers/mfd/sky81452.o
  CC [M]  net/netfilter/xt_CLASSIFY.o
  CC [M]  drivers/mfd/intel_soc_pmic_bxtwc.o
  CC [M]  net/netfilter/xt_CONNSECMARK.o
  AR      lib/built-in.a
  CC [M]  drivers/mfd/intel_soc_pmic_chtdc_ti.o
  CC [M]  net/netfilter/xt_CT.o
  CC [M]  net/netfilter/xt_DSCP.o
  CC [M]  drivers/mfd/intel_soc_pmic_mrfld.o
  CC [M]  net/netfilter/xt_HL.o
  CC [M]  drivers/mfd/rave-sp.o
  CC [M]  drivers/mfd/simple-mfd-i2c.o
  CC [M]  drivers/mfd/smpro-core.o
  CC [M]  net/netfilter/xt_HMARK.o
  CC [M]  net/netfilter/xt_LED.o
  CC [M]  drivers/mfd/intel-m10-bmc-core.o
  CC [M]  net/netfilter/xt_LOG.o
  CC [M]  net/netfilter/xt_NETMAP.o
  CC [M]  drivers/mfd/intel-m10-bmc-spi.o
  CC [M]  net/netfilter/xt_NFLOG.o
  CC [M]  drivers/mfd/atc260x-core.o
  CC [M]  drivers/mfd/atc260x-i2c.o
  CC [M]  net/netfilter/xt_NFQUEUE.o
  CC [M]  net/netfilter/xt_RATEEST.o
  CC [M]  net/netfilter/xt_REDIRECT.o
  CC [M]  net/netfilter/xt_MASQUERADE.o
  CC [M]  net/netfilter/xt_SECMARK.o
  CC [M]  net/netfilter/xt_TPROXY.o
  CC [M]  net/netfilter/xt_TCPMSS.o
  CC [M]  net/netfilter/xt_TCPOPTSTRIP.o
  CC [M]  net/netfilter/xt_TEE.o
  CC [M]  net/netfilter/xt_TRACE.o
  CC [M]  net/netfilter/xt_IDLETIMER.o
  CC [M]  net/netfilter/xt_addrtype.o
  CC [M]  net/netfilter/xt_bpf.o
  CC [M]  net/netfilter/xt_cluster.o
  CC [M]  net/netfilter/xt_comment.o
  AR      kernel/built-in.a
  CC [M]  net/netfilter/xt_connbytes.o
  CC [M]  net/netfilter/xt_connlabel.o
  CC [M]  net/netfilter/xt_connlimit.o
  CC [M]  net/netfilter/xt_conntrack.o
  CC [M]  net/netfilter/xt_cpu.o
  CC [M]  net/netfilter/xt_dccp.o
  CC [M]  net/netfilter/xt_devgroup.o
  CC [M]  net/netfilter/xt_dscp.o
  CC [M]  net/netfilter/xt_ecn.o
  CC [M]  net/netfilter/xt_esp.o
  CC [M]  net/netfilter/xt_hashlimit.o
  CC [M]  net/netfilter/xt_helper.o
  CC [M]  net/netfilter/xt_hl.o
  CC [M]  net/netfilter/xt_ipcomp.o
  CC [M]  net/netfilter/xt_iprange.o
  LD [M]  drivers/mfd/arizona.o
  LD [M]  drivers/mfd/wm8994.o
  LD [M]  drivers/mfd/madera.o
  LD [M]  drivers/mfd/ocelot-soc.o
  LD [M]  drivers/mfd/mt6397.o
  LD [M]  drivers/mfd/si476x-core.o
  CC [M]  net/netfilter/xt_l2tp.o
  AR      drivers/mfd/built-in.a
  CC [M]  net/netfilter/xt_length.o
  CC [M]  net/netfilter/xt_limit.o
  CC [M]  net/netfilter/xt_mac.o
  CC [M]  net/netfilter/xt_multiport.o
  CC [M]  net/netfilter/xt_nfacct.o
  CC [M]  net/netfilter/xt_osf.o
  CC [M]  net/netfilter/xt_owner.o
  CC [M]  net/netfilter/xt_cgroup.o
  CC [M]  net/netfilter/xt_physdev.o
  CC [M]  net/netfilter/xt_pkttype.o
  CC [M]  net/netfilter/xt_policy.o
make[3]: *** [../scripts/Makefile.build:461: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
  CC [M]  net/netfilter/xt_quota.o
  CC [M]  net/netfilter/xt_rateest.o
  CC [M]  net/netfilter/xt_realm.o
  CC [M]  net/netfilter/xt_recent.o
  CC [M]  net/netfilter/xt_sctp.o
  CC [M]  net/netfilter/xt_socket.o
  CC [M]  net/netfilter/xt_state.o
  CC [M]  net/netfilter/xt_statistic.o
  CC [M]  net/netfilter/xt_string.o
  CC [M]  net/netfilter/xt_tcpmss.o
  CC [M]  net/netfilter/xt_time.o
  CC [M]  net/netfilter/xt_u32.o
  LD [M]  net/netfilter/nf_conntrack.o
  LD [M]  net/netfilter/nf_conntrack_h323.o
  LD [M]  net/netfilter/nf_nat.o
  LD [M]  net/netfilter/nf_tables.o
  LD [M]  net/netfilter/nf_flow_table.o
  AR      net/netfilter/built-in.a
  AR      net/built-in.a
  CC [M]  kernel/kheaders.o
make[2]: *** [/kernel/Makefile:2003: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make[1]: Leaving directory '/kernel/build64-debug'
make: *** [Makefile:248: __sub-make] Error 2
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


