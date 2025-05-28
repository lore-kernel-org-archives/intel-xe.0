Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA38C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 06:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8901810E1C9;
	Wed, 28 May 2025 06:37:30 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4831A10E1C9;
 Wed, 28 May 2025 06:37:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EBuild=3A_failure_for_drm/i915=3A_drop_intel=5Fdpio?=
 =?utf-8?q?=5Fphy=2Eh_include_from_VLV_IOSF_SB?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 06:37:29 -0000
Message-ID: <174841424928.26762.1937503867893076418@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250527114854.3687469-1-jani.nikula@intel.com>
In-Reply-To: <20250527114854.3687469-1-jani.nikula@intel.com>
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

Series: drm/i915: drop intel_dpio_phy.h include from VLV IOSF SB
URL   : https://patchwork.freedesktop.org/series/149536/
State : failure

== Summary ==

ASN.1   crypto/ecdsasignature.asn1.[ch]
  CC [M]  crypto/ecdsa-p1363.o
  CC      net/ipv6/udplite.o
  CC      arch/x86/kernel/dumpstack.o
  AR      drivers/virtio/built-in.a
  CC      drivers/iommu/intel/irq_remapping.o
  LD [M]  sound/pci/snd-als4000.o
  CC      kernel/module/tree_lookup.o
  CC      mm/mmap.o
  CC      net/ipv6/raw.o
  AR      net/dns_resolver/built-in.a
  CC      net/ipv6/icmp.o
  CC      drivers/tty/serial/8250/8250_rsa.o
  TEST    lib/test_fortify/write_overflow_field-memmove.log
  CC      drivers/tty/vt/defkeymap.o
  CC [M]  drivers/gpu/drm/tests/drm_buddy_test.o
  CC [M]  drivers/gpio/gpio-virtuser.o
  TEST    lib/test_fortify/write_overflow_field-memset.log
  AR      drivers/leds/built-in.a
  CC      net/switchdev/switchdev.o
  AR      net/devlink/built-in.a
  CC [M]  drivers/block/drbd/drbd_proc.o
  CC      kernel/time/time.o
  AR      fs/ext4/built-in.a
  LD [M]  drivers/char/mwave/mwave.o
  CC      fs/ntfs3/xattr.o
  CC      kernel/futex/core.o
  CC [M]  fs/nls/nls_iso8859-14.o
  CC      drivers/acpi/acpica/psscope.o
  CC [M]  drivers/regulator/act8865-regulator.o
  CONMK   drivers/tty/vt/consolemap_deftbl.c
  CC      drivers/tty/vt/consolemap_deftbl.o
  CC [M]  sound/soc/codecs/cs40l50-codec.o
  CC      net/ipv4/tcp_input.o
  AR      drivers/tty/vt/built-in.a
  CC [M]  net/ipv6/netfilter/ip6t_rpfilter.o
  CC [M]  drivers/dma/dw/pci.o
  LD [M]  drivers/dma/dw/dw_dmac_core.o
  CC      mm/mmu_gather.o
  CC      drivers/pci/slot.o
  CC      drivers/tty/serial/8250/8250_port.o
  CC      drivers/base/firmware_loader/builtin/main.o
  CAT     lib/test_fortify/test_fortify.log
  CC      kernel/futex/syscalls.o
  CC      lib/bug.o
  CC [M]  crypto/ecdsasignature.asn1.o
  CC [M]  net/ipv6/netfilter/ip6t_rt.o
  CC [M]  drivers/block/mtip32xx/mtip32xx.o
  CC [M]  crypto/crypto_user.o
  CC      drivers/char/tpm/tpm1-cmd.o
  CC      kernel/module/debug_kmemleak.o
  LD [M]  sound/pci/snd-cs4281.o
  AR      fs/tracefs/built-in.a
  CC      arch/x86/kernel/nmi.o
  CC      drivers/base/firmware_loader/fallback_table.o
  CC      drivers/acpi/acpica/pstree.o
  CC      block/blk-zoned.o
  CC      net/l3mdev/l3mdev.o
  CC [M]  net/netfilter/nf_conntrack_proto_gre.o
  CC [M]  fs/nls/nls_iso8859-15.o
  CC      fs/btrfs/super.o
  CC [M]  drivers/acpi/nfit/core.o
  CC      fs/btrfs/ctree.o
  CC      drivers/xen/manage.o
  CC      drivers/base/power/runtime.o
  CC [M]  sound/soc/codecs/cs530x.o
  CC      fs/btrfs/extent-tree.o
  CC      drivers/base/power/wakeirq.o
  LD [M]  drivers/dma/dw/dw_dmac.o
  CC [M]  drivers/gpu/drm/tests/drm_cmdline_parser_test.o
  AR      drivers/base/firmware_loader/builtin/built-in.a
  LD [M]  drivers/dma/dw/dw_dmac_pci.o
  CC      drivers/base/power/main.o
  CC [M]  drivers/dma/dw-edma/dw-edma-core.o
  CC      drivers/base/power/wakeup.o
  CC      drivers/acpi/acpica/psutils.o
  CC      lib/buildid.o
  CC [M]  drivers/video/fbdev/vga16fb.o
  CC [M]  drivers/regulator/ad5398.o
  CC      drivers/acpi/acpica/pswalk.o
  CC [M]  drivers/gpio/gpio-virtio.o
  CC      kernel/module/kallsyms.o
  CC      drivers/base/power/wakeup_stats.o
  CC      fs/ntfs3/lib/decompress_common.o
  CC      drivers/iommu/intel/perfmon.o
  CC [M]  fs/nls/nls_koi8-r.o
  CC      net/core/netdev_rx_queue.o
  CC      drivers/base/power/trace.o
  CC      arch/x86/kernel/fred.o
  CC      kernel/futex/pi.o
  CC [M]  drivers/regulator/arizona-ldo1.o
  CC      drivers/pci/pci-acpi.o
  CC [M]  net/netfilter/nf_conntrack_netlink.o
  CC      drivers/acpi/acpica/psxface.o
  CC      kernel/time/timer.o
  CC [M]  net/ipv6/netfilter/ip6t_srh.o
  CC [M]  crypto/cmac.o
  CC      fs/ntfs3/lib/lzx_decompress.o
  CC      drivers/char/tpm/tpm2-cmd.o
  CC [M]  drivers/block/drbd/drbd_worker.o
  CC [M]  fs/nls/nls_koi8-u.o
  CC      lib/clz_tab.o
  AR      net/switchdev/built-in.a
  CC      arch/x86/kernel/ldt.o
  CC      net/core/page_pool.o
  CC      drivers/base/firmware_loader/main.o
  CC      lib/cmdline.o
  CC      net/core/page_pool_user.o
  CC [M]  drivers/gpio/gpio-vx855.o
  CC      mm/mprotect.o
  CC      drivers/acpi/acpica/rsaddr.o
  CC      drivers/char/tpm/tpmrm-dev.o
  CC      kernel/module/procfs.o
  AR      net/l3mdev/built-in.a
  CC      lib/cpumask.o
  CC [M]  drivers/regulator/arizona-micsupp.o
  CC      kernel/futex/requeue.o
  CC      arch/x86/kernel/setup.o
  CC      drivers/xen/time.o
  CC      drivers/char/tpm/tpm2-space.o
  CC [M]  drivers/gpio/gpio-wcove.o
  CC [M]  crypto/xcbc.o
  CC [M]  fs/nls/nls_koi8-ru.o
  CC [M]  sound/soc/codecs/cs530x-i2c.o
  AR      drivers/video/fbdev/built-in.a
  CC      fs/ntfs3/lib/xpress_decompress.o
  AR      drivers/video/built-in.a
  CC      drivers/acpi/acpica/rscalc.o
  CC      drivers/acpi/acpica/rscreate.o
  CC      block/blk-wbt.o
  CC      drivers/tty/serial/8250/8250_dma.o
  CC      block/blk-mq-debugfs.o
  CC      kernel/futex/waitwake.o
  AR      drivers/iommu/intel/built-in.a
  CC      drivers/iommu/iommu-traces.o
  CC [M]  drivers/dma/dw-edma/dw-edma-v0-core.o
  AR      drivers/misc/eeprom/built-in.a
  CC [M]  drivers/misc/eeprom/at24.o
  CC      drivers/mfd/88pm860x-core.o
  CC      fs/btrfs/print-tree.o
  CC      drivers/iommu/iommu-sysfs.o
  CC      kernel/module/sysfs.o
  CC      drivers/acpi/tables.o
  CC [M]  drivers/gpu/drm/tests/drm_connector_test.o
  CC [M]  drivers/dma/ioat/init.o
  AR      fs/ntfs3/built-in.a
  CC      arch/x86/kernel/x86_init.o
  CC [M]  drivers/acpi/nfit/intel.o
  CC [M]  net/ipv6/netfilter/ip6t_NPT.o
  CC [M]  net/ipv6/netfilter/ip6t_REJECT.o
  CC [M]  crypto/md4.o
  CC [M]  drivers/acpi/nfit/mce.o
  CC      drivers/pci/iomap.o
  CC      drivers/tty/serial/8250/8250_dwlib.o
  CC [M]  fs/nls/nls_utf8.o
  CC      drivers/xen/mem-reservation.o
  AR      drivers/nfc/built-in.a
  CC      arch/x86/kernel/i8259.o
  CC [M]  drivers/block/zram/zcomp.o
  CC [M]  drivers/gpio/gpio-winbond.o
  CC [M]  drivers/regulator/as3711-regulator.o
  CC [M]  drivers/block/null_blk/main.o
  CC      drivers/base/power/clock_ops.o
  CC      drivers/char/tpm/tpm-sysfs.o
  CC [M]  sound/soc/codecs/es8311.o
  CC [M]  drivers/block/null_blk/trace.o
  CC      drivers/acpi/acpica/rsdumpinfo.o
  CC      lib/ctype.o
  AR      kernel/futex/built-in.a
  CC      kernel/time/hrtimer.o
  CC      lib/dec_and_lock.o
  CC [M]  drivers/dma/dw-edma/dw-hdma-v0-core.o
  CC      kernel/module/kdb.o
  CC      mm/mremap.o
  CC [M]  drivers/block/zram/zram_drv.o
  CC [M]  drivers/misc/eeprom/at25.o
  CC      drivers/base/firmware_loader/fallback.o
  CC      drivers/pci/quirks.o
  CC [M]  fs/nls/mac-celtic.o
  CC [M]  crypto/rmd160.o
  CC      drivers/acpi/acpica/rsinfo.o
  CC      drivers/pci/ats.o
  CC      arch/x86/kvm/kvm-asm-offsets.s
  CC      lib/decompress.o
  CC      kernel/cgroup/cgroup.o
  AR      drivers/misc/cb710/built-in.a
  LD [M]  drivers/acpi/nfit/nfit.o
  CC [M]  drivers/misc/cb710/core.o
  CC [M]  drivers/gpio/gpio-wm831x.o
  CC      drivers/tty/serial/8250/8250_fintek.o
  CC [M]  drivers/regulator/atc260x-regulator.o
  CC      drivers/tty/serial/8250/8250_pcilib.o
  CC      kernel/cgroup/rstat.o
  CC      drivers/tty/serial/8250/8250_early.o
  CC      lib/decompress_bunzip2.o
  CC [M]  drivers/dma/ioat/dma.o
  CC      drivers/char/tpm/eventlog/common.o
  CC [M]  net/netfilter/nfnetlink_cttimeout.o
  CC      drivers/nvdimm/core.o
  CC      drivers/mfd/88pm860x-i2c.o
  CC      drivers/char/mem.o
  CC      drivers/acpi/acpica/rsio.o
  CC [M]  fs/nls/mac-centeuro.o
  CC      net/core/net-procfs.o
  CC      kernel/module/version.o
  CC      drivers/tty/serial/serial_ctrl.o
  CC      drivers/char/random.o
  CC [M]  sound/soc/codecs/hda.o
  CC      arch/x86/kernel/irqinit.o
  CC [M]  drivers/dma/dw-edma/dw-edma-v0-debugfs.o
  CC      drivers/xen/pci.o
  CC      drivers/nvdimm/bus.o
  CC      drivers/nvdimm/dimm_devs.o
  CC      drivers/iommu/dma-iommu.o
  AR      drivers/base/power/built-in.a
  CC [M]  net/ipv6/netfilter/ip6t_SYNPROXY.o
  CC [M]  sound/soc/codecs/hda-dai.o
  CC      drivers/base/firmware_loader/fallback_platform.o
  CC      drivers/char/ttyprintk.o
  CC      block/sed-opal.o
  CC [M]  drivers/misc/eeprom/max6875.o
  CC [M]  drivers/gpu/drm/tests/drm_damage_helper_test.o
  CC      drivers/nvdimm/nd_perf.o
  CC [M]  drivers/block/drbd/drbd_receiver.o
  CC [M]  drivers/gpio/gpio-wm8350.o
  CC      drivers/acpi/acpica/rsirq.o
  CC [M]  crypto/sm3.o
  CC      drivers/nvdimm/dimm.o
  CC      drivers/nvdimm/region_devs.o
  CC [M]  drivers/regulator/aw37503-regulator.o
  CC [M]  drivers/dma/dw-edma/dw-hdma-v0-debugfs.o
  CC [M]  fs/nls/mac-croatian.o
  CC      lib/decompress_inflate.o
  CC      net/ncsi/ncsi-cmd.o
  CC      drivers/char/tpm/eventlog/tpm1.o
  CC [M]  drivers/block/null_blk/zoned.o
  CC      net/ncsi/ncsi-rsp.o
  CC [M]  drivers/block/zram/backend_lzorle.o
  CC      mm/msync.o
  CC      net/ncsi/ncsi-aen.o
  CC      drivers/acpi/acpica/rslist.o
  CC [M]  drivers/dma/ioat/prep.o
  CC      drivers/tty/serial/8250/8250_dw.o
  CC [M]  drivers/misc/cb710/sgbuf2.o
  CC      net/ipv4/tcp_output.o
  CC [M]  drivers/misc/eeprom/eeprom_93cx6.o
  CC      arch/x86/kernel/jump_label.o
  CC      fs/pstore/inode.o
  CC      drivers/base/firmware_loader/sysfs.o
  AR      kernel/module/built-in.a
  CC      net/core/netpoll.o
  CC [M]  drivers/gpio/gpio-wm8994.o
  CC      kernel/time/sleep_timeout.o
  CC [M]  crypto/sm3_generic.o
  CC [M]  fs/nls/mac-cyrillic.o
  CC      lib/decompress_unlz4.o
  CC [M]  net/netfilter/nfnetlink_cthelper.o
  CC [M]  sound/hda/ext/hdac_ext_bus.o
  CC [M]  drivers/gpu/drm/tests/drm_dp_mst_helper_test.o
  CC      drivers/mfd/wm8400-core.o
  CC [M]  drivers/block/zram/backend_lzo.o
  CC      kernel/time/timekeeping.o
  CC [M]  sound/hda/ext/hdac_ext_controller.o
  CC [M]  drivers/regulator/axp20x-regulator.o
  CC [M]  drivers/dma/dw-edma/dw-edma-pcie.o
  CC [M]  crypto/streebog_generic.o
  CC [M]  sound/soc/codecs/hdmi-codec.o
  CC      drivers/acpi/acpica/rsmemory.o
  AR      drivers/misc/lis3lv02d/built-in.a
  CC [M]  drivers/misc/lis3lv02d/lis3lv02d.o
  CC      drivers/xen/dbgp.o
  LD [M]  net/ipv6/netfilter/nf_defrag_ipv6.o
  CC      net/ipv6/mcast.o
  CC      arch/x86/kernel/irq_work.o
  CC      drivers/char/tpm/eventlog/tpm2.o
  CC      drivers/iommu/io-pgtable.o
  LD [M]  drivers/block/zram/zram.o
  CC      drivers/xen/acpi.o
  CC      drivers/acpi/acpica/rsmisc.o
  CC      mm/page_vma_mapped.o
  CC      lib/decompress_unlzma.o
  CC [M]  fs/nls/mac-gaelic.o
  CC      drivers/tty/serial/8250/8250_mid.o
  CC [M]  drivers/gpio/gpio-ws16c48.o
  CC [M]  sound/hda/ext/hdac_ext_stream.o
  CC [M]  drivers/gpu/drm/tests/drm_exec_test.o
  CC [M]  drivers/block/drbd/drbd_req.o
  CC [M]  drivers/misc/eeprom/eeprom_93xx46.o
  CC      fs/pstore/platform.o
  CC      drivers/mfd/wm831x-core.o
  CC [M]  sound/x86/intel_hdmi_audio.o
  CC      drivers/base/firmware_loader/sysfs_upload.o
  LD [M]  drivers/block/null_blk/null_blk.o
  CC      drivers/acpi/acpica/rsserial.o
  CC      drivers/pci/iov.o
  CC [M]  drivers/dma/ioat/dca.o
  CC [M]  net/netfilter/nf_conntrack_amanda.o
  CC      mm/pagewalk.o
  CC      drivers/tty/serial/8250/8250_pci.o
  CC      mm/pgtable-generic.o
  LD [M]  drivers/misc/cb710/cb710.o
  CC      mm/rmap.o
  CC      net/ncsi/ncsi-manage.o
  CC      block/blk-pm.o
  LD [M]  drivers/dma/dw-edma/dw-edma.o
  CC [M]  crypto/wp512.o
  CC      lib/decompress_unlzo.o
  CC [M]  arch/x86/kvm/vmx/pmu_intel.o
  CC [M]  drivers/regulator/bcm590xx-regulator.o
  CC [M]  drivers/gpio/gpio-xra1403.o
  CC      drivers/acpi/osi.o
  CC      drivers/iommu/iova.o
  CC      drivers/acpi/acpica/rsutils.o
  CC [M]  fs/nls/mac-greek.o
  CC [M]  sound/soc/codecs/pcm6240.o
  AR      drivers/gpu/drm/arm/built-in.a
  CC [M]  net/netfilter/nf_conntrack_ftp.o
  CC      drivers/nvdimm/region.o
  CC      arch/x86/kernel/probe_roms.o
  CC      drivers/char/tpm/tpm-buf.o
  CC      fs/btrfs/root-tree.o
  CC      drivers/char/misc.o
  CC [M]  sound/hda/hda_bus_type.o
  CC [M]  fs/nls/mac-iceland.o
  CC      drivers/char/virtio_console.o
  AR      drivers/misc/cardreader/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_format_helper_test.o
  CC [M]  drivers/misc/cardreader/alcor_pci.o
  CC      drivers/pci/pci-label.o
  CC [M]  drivers/misc/eeprom/idt_89hpesx.o
  CC      drivers/mfd/wm831x-irq.o
  CC [M]  drivers/dma/ioat/sysfs.o
  CC      lib/decompress_unxz.o
  CC      net/ipv6/reassembly.o
  CC      drivers/pci/p2pdma.o
  CC      drivers/acpi/acpica/rsxface.o
  AR      drivers/base/firmware_loader/built-in.a
  CC [M]  crypto/pcbc.o
  CC      drivers/base/regmap/regmap.o
  CC      kernel/cgroup/namespace.o
  CC      drivers/acpi/osl.o
  CC      drivers/xen/xen-acpi-pad.o
  LD [M]  sound/hda/ext/snd-hda-ext-core.o
  CC [M]  fs/nls/mac-inuit.o
  CC [M]  drivers/regulator/bd9571mwv-regulator.o
  LD [M]  sound/x86/snd-hdmi-lpe-audio.o
  CC [M]  drivers/misc/lis3lv02d/lis3lv02d_i2c.o
  CC      net/ncsi/ncsi-netlink.o
  CC      net/ipv6/tcp_ipv6.o
  CC      fs/pstore/pmsg.o
  CC      kernel/time/ntp.o
  CC      arch/x86/kernel/sys_ia32.o
  CC      block/blk-crypto.o
  CC      drivers/nvdimm/namespace_devs.o
  AR      drivers/base/test/built-in.a
  CC      net/core/fib_rules.o
  CC      net/core/net-traces.o
  CC      lib/decompress_unzstd.o
  AR      drivers/gpio/built-in.a
  CC [M]  drivers/block/drbd/drbd_actlog.o
  CC      drivers/char/tpm/tpm2-sessions.o
  CC      net/ipv6/ping.o
  AR      sound/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_format_test.o
  CC [M]  arch/x86/kvm/vmx/vmcs12.o
  LD [M]  drivers/dma/ioat/ioatdma.o
  CC [M]  drivers/dma/sf-pdma/sf-pdma.o
  LD [M]  sound/soc/codecs/snd-soc-ac97.o
  LD [M]  sound/soc/codecs/snd-soc-ak4619.o
  CC      drivers/acpi/acpica/tbdata.o
  LD [M]  sound/soc/codecs/snd-soc-cs40l50.o
  CC      drivers/mfd/wm831x-otp.o
  LD [M]  sound/soc/codecs/snd-soc-cs530x.o
  CC [M]  crypto/lrw.o
  LD [M]  sound/soc/codecs/snd-soc-cs530x-i2c.o
  LD [M]  sound/soc/codecs/snd-soc-es8311.o
  LD [M]  sound/soc/codecs/snd-soc-hda-codec.o
  CC [M]  fs/nls/mac-romanian.o
  LD [M]  sound/soc/codecs/snd-soc-hdmi-codec.o
  CC      fs/btrfs/dir-item.o
  CC [M]  sound/hda/hdac_bus.o
  LD [M]  sound/soc/codecs/snd-soc-pcm6240.o
  CC      drivers/iommu/irq_remapping.o
  CC [M]  drivers/regulator/da903x-regulator.o
  CC [M]  sound/soc/amd/acp-config.o
  CC [M]  drivers/misc/cardreader/rtsx_pcr.o
  CC      fs/btrfs/file-item.o
  CC [M]  drivers/misc/eeprom/ee1004.o
  CC      drivers/xen/pcpu.o
  CC [M]  fs/pstore/ram.o
  CC      drivers/tty/serial/8250/8250_rt288x.o
  CC [M]  sound/hda/hdac_device.o
  AR      drivers/misc/pvpanic/built-in.a
  CC [M]  drivers/misc/pvpanic/pvpanic.o
  CC      drivers/char/hpet.o
  CC      fs/btrfs/inode-item.o
  CC      lib/dump_stack.o
  CC      kernel/time/clocksource.o
  CC      drivers/tty/serdev/core.o
  CC [M]  fs/nls/mac-roman.o
  CC      drivers/gpu/drm/clients/drm_client_setup.o
  CC      drivers/dax/hmem/device.o
  CC      arch/x86/kernel/signal_32.o
  AR      drivers/gpu/drm/display/built-in.a
  CC      drivers/dma/dmaengine.o
  CC [M]  drivers/gpu/drm/display/drm_display_helper_mod.o
  CC [M]  arch/x86/kvm/vmx/nested.o
  CC [M]  crypto/xctr.o
  CC      drivers/mfd/wm831x-auxadc.o
  CC [M]  crypto/hctr2.o
  CC      drivers/acpi/acpica/tbfadt.o
  CC      drivers/pci/vgaarb.o
  CC [M]  drivers/regulator/da9052-regulator.o
  AR      net/ncsi/built-in.a
  CC      drivers/char/tpm/tpm_ppi.o
  CC [M]  crypto/adiantum.o
  CC [M]  drivers/gpu/drm/tests/drm_framebuffer_test.o
  CC [M]  net/netfilter/nf_conntrack_h323_main.o
  CC      block/blk-crypto-profile.o
  CC      drivers/xen/biomerge.o
  CC      mm/vmalloc.o
  CC [M]  fs/pstore/ram_core.o
  CC      drivers/iommu/hyperv-iommu.o
  CC      drivers/iommu/virtio-iommu.o
  CC [M]  fs/nls/mac-turkish.o
  CC      drivers/mfd/wm831x-i2c.o
  CC      net/ipv6/exthdrs.o
  CC      drivers/tty/serial/serial_port.o
  CC [M]  drivers/gpu/drm/display/drm_bridge_connector.o
  CC      drivers/dma/virt-dma.o
  CC      drivers/acpi/acpica/tbfind.o
  CC [M]  drivers/tty/serial/8250/8250_exar.o
  CC      drivers/iommu/iommu-sva.o
  LD [M]  sound/soc/amd/snd-acp-config.o
  CC [M]  drivers/misc/pvpanic/pvpanic-mmio.o
  CC      net/ipv4/tcp_timer.o
  CC      lib/earlycpio.o
  CC [M]  sound/soc/dwc/dwc-i2s.o
  AR      drivers/misc/keba/built-in.a
  CC      kernel/cgroup/cgroup-v1.o
  CC [M]  drivers/misc/keba/cp500.o
  CC      fs/btrfs/disk-io.o
  CC      arch/x86/kernel/sys_x86_64.o
  CC      net/ipv6/datagram.o
  CC      drivers/gpu/drm/clients/drm_fbdev_client.o
  CC      lib/extable.o
  CC      drivers/xen/xen-balloon.o
  CC [M]  drivers/block/drbd/drbd_main.o
  CC [M]  sound/soc/dwc/dwc-pcm.o
  CC [M]  sound/hda/hdac_sysfs.o
  CC      net/ipv6/ip6_flowlabel.o
  CC      drivers/tty/serdev/serdev-ttyport.o
  CC [M]  drivers/dax/hmem/hmem.o
  CC      drivers/char/tpm/eventlog/acpi.o
  CC [M]  crypto/nhpoly1305.o
  CC [M]  drivers/gpu/drm/tests/drm_gem_shmem_test.o
  CC [M]  fs/nls/nls_ucs2_utils.o
  CC [M]  drivers/regulator/da9055-regulator.o
  CC      drivers/acpi/acpica/tbinstal.o
  CC [M]  drivers/block/drbd/drbd_strings.o
  CC      kernel/time/jiffies.o
  CC      drivers/dax/super.o
  CC      drivers/nvdimm/label.o
  CC [M]  fs/pstore/zone.o
  CC      drivers/mfd/wm831x-spi.o
  CC      drivers/dma/acpi-dma.o
  CC      drivers/dma-buf/heaps/system_heap.o
  CC [M]  drivers/misc/cardreader/rts5209.o
  CC [M]  drivers/misc/pvpanic/pvpanic-pci.o
  CC      drivers/nvdimm/badrange.o
  CC      lib/flex_proportions.o
  CC      drivers/cxl/core/suspend.o
  CC      block/blk-crypto-sysfs.o
  CC      drivers/acpi/acpica/tbprint.o
  CC [M]  drivers/tty/serial/8250/8250_lpss.o
  CC      fs/btrfs/transaction.o
  AR      drivers/dax/hmem/built-in.a
  LD [M]  drivers/dax/hmem/dax_hmem.o
  AR      drivers/tty/serdev/built-in.a
  CC      drivers/block/loop.o
  CC      drivers/char/tpm/eventlog/efi.o
  CC      fs/efivarfs/inode.o
  CC [M]  fs/netfs/buffered_read.o
  AR      drivers/gpu/drm/clients/built-in.a
  LD [M]  sound/soc/dwc/designware_i2s.o
  CC [M]  drivers/tty/serial/8250/8250_men_mcb.o
  CC      drivers/char/tpm/tpm_tis_core.o
  CC      drivers/pci/doe.o
  CC      arch/x86/kernel/espfix_64.o
  CC      kernel/cgroup/freezer.o
  CC [M]  sound/hda/hdac_regmap.o
  CC      drivers/iommu/io-pgfault.o
  CC [M]  drivers/misc/cardreader/rts5229.o
  CC [M]  drivers/regulator/da9062-regulator.o
  CC [M]  drivers/gpu/drm/display/drm_dp_dual_mode_helper.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-byt-match.o
  CC [M]  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.o
  CC      drivers/base/regmap/regcache.o
  CC      lib/idr.o
  CC      drivers/mfd/wm8350-core.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cht-match.o
  CC      drivers/xen/sys-hypervisor.o
  CC [M]  sound/soc/intel/atom/sst/sst.o
  CC      drivers/acpi/acpica/tbutils.o
  CC      kernel/time/timer_list.o
  CC [M]  crypto/ccm.o
  CC      net/ipv4/tcp_ipv4.o
  AR      fs/nls/built-in.a
  CC [M]  sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.o
  AR      drivers/dma-buf/heaps/built-in.a
  CC      drivers/dma-buf/dma-buf.o
  CC [M]  drivers/block/drbd/drbd_nl.o
  CC      block/blk-crypto-fallback.o
  CC      fs/efivarfs/file.o
  CC [M]  drivers/gpu/drm/tests/drm_managed_test.o
  CC [M]  drivers/tty/serial/8250/8250_pci1xxxx.o
  CC [M]  drivers/dma/altera-msgdma.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-skl-match.o
  CC      drivers/acpi/acpica/tbxface.o
  CC [M]  drivers/misc/cardreader/rtl8411.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-kbl-match.o
  CC      drivers/dax/bus.o
  CC      arch/x86/kernel/ksysfs.o
  CC [M]  drivers/cxl/core/port.o
  CC      fs/btrfs/inode.o
  CC      drivers/nvdimm/claim.o
  CC [M]  fs/pstore/blk.o
  CC      kernel/cgroup/legacy_freezer.o
  CC [M]  drivers/regulator/da9210-regulator.o
  CC      drivers/xen/platform-pci.o
  CC      kernel/time/timeconv.o
  CC      lib/iomem_copy.o
  CC [M]  net/netfilter/nf_conntrack_h323_asn1.o
  CC      drivers/mfd/wm8350-regmap.o
  CC [M]  sound/soc/intel/atom/sst/sst_ipc.o
  CC      fs/efivarfs/super.o
  CC [M]  drivers/regulator/da9211-regulator.o
  LD [M]  fs/pstore/ramoops.o
  CC [M]  sound/hda/hdac_controller.o
  CC      lib/irq_regs.o
  CC      net/ipv4/tcp_minisocks.o
  AR      drivers/iommu/built-in.a
  CC      mm/vma.o
  CC      net/mctp/af_mctp.o
  CC [M]  crypto/chacha20poly1305.o
  CC      net/ipv6/inet6_connection_sock.o
  CC      drivers/acpi/utils.o
  CC [M]  arch/x86/kvm/vmx/posted_intr.o
  CC [M]  drivers/pci/pci-stub.o
  CC [M]  drivers/gpu/drm/display/drm_dp_helper.o
  LD [M]  fs/pstore/pstore_zone.o
  CC      drivers/base/regmap/regcache-rbtree.o
  CC [M]  drivers/misc/cardreader/rts5227.o
  CC      block/holder.o
  CC      arch/x86/kernel/bootflag.o
  CC      drivers/acpi/acpica/tbxfload.o
  CC [M]  drivers/tty/serial/8250/8250_pericom.o
  CC [M]  drivers/dma/idma64.o
  CC      drivers/nvdimm/btt_devs.o
  CC [M]  fs/netfs/buffered_write.o
  CC [M]  net/netfilter/nf_conntrack_irc.o
  CC      drivers/char/tpm/tpm_tis.o
  CC      drivers/acpi/reboot.o
  CC      drivers/base/component.o
  CC      kernel/time/timecounter.o
  CC      lib/is_single_threaded.o
  CC      drivers/xen/swiotlb-xen.o
  CC      kernel/time/alarmtimer.o
  CC      mm/process_vm_access.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-bxt-match.o
  CC      drivers/base/regmap/regcache-flat.o
  CC      kernel/cgroup/pids.o
  CC [M]  drivers/gpu/drm/tests/drm_mm_test.o
  CC      drivers/mfd/wm8350-gpio.o
  CC [M]  drivers/pci/pci-pf-stub.o
  CC      drivers/mfd/wm8350-irq.o
  CC [M]  sound/soc/intel/atom/sst/sst_stream.o
  CC [M]  drivers/regulator/fan53555.o
  CC      drivers/dma-buf/dma-fence.o
  CC      arch/x86/kernel/e820.o
  AR      fs/pstore/built-in.a
  LD [M]  fs/pstore/pstore_blk.o
  CC      fs/efivarfs/vars.o
  CC      lib/klist.o
  CC [M]  crypto/aegis128-core.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-glk-match.o
  CC [M]  crypto/pcrypt.o
  CC [M]  drivers/misc/cardreader/rts5249.o
  CC      drivers/acpi/acpica/tbxfroot.o
  AR      drivers/tty/serial/8250/built-in.a
  CC [M]  drivers/regulator/gpio-regulator.o
  CC      drivers/tty/serial/earlycon.o
  CC [M]  drivers/dax/device.o
  CC [M]  drivers/regulator/isl6271a-regulator.o
  CC [M]  drivers/misc/ibmasm/module.o
  CC      drivers/char/tpm/tpm_crb.o
  CC      drivers/base/regmap/regcache-maple.o
  CC [M]  drivers/dma/plx_dma.o
  CC      kernel/cgroup/rdma.o
  CC [M]  drivers/dax/kmem.o
  CC [M]  block/kyber-iosched.o
  CC [M]  drivers/gpu/drm/tests/drm_modes_test.o
  CC [M]  sound/hda/hdac_stream.o
  CC      net/mctp/device.o
  CC      kernel/debug/kdb/kdb_io.o
  CC      net/mctp/route.o
  CC [M]  drivers/pci/xen-pcifront.o
  CC      drivers/acpi/acpica/utaddress.o
  CC      lib/kobject.o
  CC      drivers/xen/mcelog.o
  CC [M]  drivers/cxl/core/pmem.o
  CC [M]  drivers/misc/ibmasm/ibmasmfs.o
  CC      kernel/debug/kdb/kdb_main.o
  CC      kernel/debug/kdb/kdb_support.o
  AR      drivers/tty/ipwireless/built-in.a
  CC      net/ipv6/udp_offload.o
  CC [M]  sound/soc/intel/atom/sst/sst_drv_interface.o
  CC      kernel/debug/kdb/kdb_bt.o
  AR      fs/efivarfs/built-in.a
  CC      drivers/tty/serial/max310x.o
  GENKDB  kernel/debug/kdb/gen-kdb_cmds.c
  CC [M]  sound/soc/intel/atom/sst/sst_loader.o
  CC [M]  sound/soc/intel/atom/sst/sst_pvt.o
  CC      drivers/nvdimm/pfn_devs.o
  CC      net/ipv6/seg6.o
  CC      mm/mseal.o
  CC [M]  crypto/cryptd.o
  CC      net/ipv6/fib6_notifier.o
  CC [M]  drivers/regulator/isl9305.o
  AR      drivers/gpu/drm/renesas/rcar-du/built-in.a
  CC [M]  drivers/misc/cardreader/rts5260.o
  CC      drivers/acpi/acpica/utalloc.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cnl-match.o
  AR      drivers/gpu/drm/renesas/rz-du/built-in.a
  AR      drivers/gpu/drm/renesas/built-in.a
  CC [M]  arch/x86/kvm/vmx/main.o
  CC      drivers/base/regmap/regmap-debugfs.o
  CC [M]  fs/netfs/direct_read.o
  CC      drivers/mfd/wm8350-i2c.o
  CC [M]  drivers/char/tpm/tpm_tis_spi_main.o
  CC [M]  drivers/dax/pmem.o
  CC      drivers/base/regmap/regmap-i2c.o
  AR      drivers/dma/built-in.a
  CC [M]  drivers/gpu/drm/display/drm_dp_mst_topology.o
  CC [M]  drivers/gpu/drm/tests/drm_plane_helper_test.o
  CC      kernel/time/posix-timers.o
  CC [M]  net/netfilter/nf_conntrack_broadcast.o
  CC      drivers/acpi/acpica/utascii.o
  CC [M]  drivers/misc/cardreader/rts5261.o
  CC      drivers/xen/xen-acpi-processor.o
  CC      kernel/cgroup/cpuset.o
  CC      net/core/drop_monitor.o
  CC      kernel/debug/debug_core.o
  CC      arch/x86/kernel/pci-dma.o
  AR      drivers/pci/built-in.a
  CC      lib/kobject_uevent.o
  CC [M]  drivers/misc/ibmasm/event.o
  CC      net/ipv4/tcp_cong.o
  CC [M]  drivers/block/drbd/drbd_interval.o
  CC [M]  drivers/regulator/lm363x-regulator.o
  CC [M]  drivers/gpu/drm/tests/drm_probe_helper_test.o
  CC      drivers/xen/efi.o
  CC      drivers/dma-buf/dma-fence-array.o
  CC [M]  drivers/gpu/drm/tests/drm_rect_test.o
  CC      mm/page_alloc.o
  CC      drivers/acpi/acpica/utbuffer.o
  CC      drivers/mfd/tps65910.o
  AR      drivers/gpu/drm/omapdrm/built-in.a
  CC      drivers/mfd/tps65912-core.o
  CC      drivers/mfd/tps65912-i2c.o
  CC [M]  drivers/dax/cxl.o
  CC [M]  drivers/cxl/core/regs.o
  LD [M]  drivers/dax/device_dax.o
  CC [M]  drivers/char/tpm/tpm_tis_spi_cr50.o
  CC [M]  drivers/misc/ibmasm/command.o
  CC [M]  sound/hda/array.o
  CC [M]  sound/hda/hdmi_chmap.o
  CC [M]  block/bfq-iosched.o
  CC      kernel/trace/rv/rv.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cfl-match.o
  CC      kernel/trace/rv/monitors/wwnr/wwnr.o
  CC      kernel/trace/trace_clock.o
  CC      kernel/bpf/core.o
  CC      net/ipv6/rpl.o
  CC      drivers/tty/serial/sccnxp.o
  CC      drivers/tty/serial/serial_mctrl_gpio.o
  CC [M]  sound/soc/intel/atom/sst/sst_pci.o
  CC      drivers/tty/tty_io.o
  CC [M]  arch/x86/kvm/vmx/sgx.o
  CC [M]  crypto/des_generic.o
  CC      drivers/xen/xlate_mmu.o
  CC      net/mctp/neigh.o
  CC      drivers/acpi/acpica/utcksum.o
  CC [M]  drivers/misc/cardreader/rts5228.o
  CC      drivers/nvdimm/dax_devs.o
  AR      drivers/gpu/drm/tilcdc/built-in.a
  CC [M]  drivers/regulator/lp3971.o
  CC [M]  fs/netfs/direct_write.o
  CC [M]  drivers/misc/cardreader/rts5264.o
  CC      kernel/bpf/syscall.o
  CC [M]  drivers/block/drbd/drbd_state.o
  CC      drivers/dma-buf/dma-fence-chain.o
  LD [M]  drivers/dax/dax_pmem.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cml-match.o
  AR      drivers/dax/built-in.a
  LD [M]  drivers/dax/dax_cxl.o
  CC      drivers/base/regmap/regmap-spi.o
  CC [M]  sound/soc/intel/atom/sst-mfld-platform-pcm.o
  CC      drivers/acpi/acpica/utcopy.o
  CC [M]  block/bfq-wf2q.o
  CC [M]  drivers/gpu/drm/display/drm_dp_tunnel.o
  CC [M]  drivers/misc/ibmasm/remote.o
  CC      drivers/tty/serial/kgdboc.o
  CC [M]  drivers/char/tpm/tpm_tis_i2c_cr50.o
  CC      kernel/time/posix-cpu-timers.o
  CC      kernel/debug/kdb/kdb_bp.o
  CC      arch/x86/kernel/quirks.o
  CC      drivers/mfd/tps65912-spi.o
  CC      lib/logic_pio.o
  CC [M]  crypto/fcrypt.o
  CC [M]  sound/soc/intel/atom/sst/sst_acpi.o
  CC      kernel/debug/kdb/kdb_debugger.o
  CC      kernel/debug/kdb/kdb_keyboard.o
  CC [M]  net/netfilter/nf_conntrack_netbios_ns.o
  CC      net/core/selftests.o
  CC      drivers/mfd/twl-core.o
  CC      drivers/dma-buf/dma-fence-unwrap.o
  CC      net/ipv6/ioam6.o
  CC      kernel/trace/rv/rv_reactors.o
  CC [M]  block/bfq-cgroup.o
  CC      drivers/acpi/acpica/utexcep.o
  CC      fs/btrfs/file.o
  CC      kernel/debug/gdbstub.o
  CC [M]  drivers/misc/cardreader/rtsx_usb.o
  CC      lib/maple_tree.o
  CC [M]  drivers/regulator/lp3972.o
  CC [M]  drivers/cxl/core/memdev.o
  CC      drivers/base/regmap/regmap-mmio.o
  CC [M]  arch/x86/kvm/vmx/hyperv.o
  AR      net/mctp/built-in.a
  CC [M]  sound/hda/trace.o
  CC [M]  sound/soc/intel/atom/sst-mfld-platform-compress.o
  CC [M]  drivers/misc/ibmasm/heartbeat.o
  CC      drivers/base/regmap/regmap-irq.o
  CC      drivers/xen/unpopulated-alloc.o
  CC [M]  drivers/base/regmap/regmap-slimbus.o
  CC      kernel/debug/kdb/gen-kdb_cmds.o
  CC [M]  drivers/tty/serial/altera_jtaguart.o
  CC      drivers/base/core.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-icl-match.o
  CC      fs/btrfs/defrag.o
  CC [M]  crypto/blowfish_generic.o
  CC [M]  fs/netfs/iterator.o
  CC      drivers/nvdimm/security.o
  CC [M]  drivers/char/tpm/tpm_tis_i2c.o
  CC [M]  drivers/base/regmap/regmap-spmi.o
  CC      net/ipv6/sysctl_net_ipv6.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-core.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-pci.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-acpi.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-tgl-match.o
  CC [M]  drivers/gpu/drm/display/drm_dsc_helper.o
  CC      net/ipv4/tcp_metrics.o
  CC      kernel/time/posix-clock.o
  CC      drivers/acpi/acpica/utdebug.o
  CC      drivers/dma-buf/dma-resv.o
  CC      kernel/trace/rv/reactor_printk.o
  CC [M]  drivers/misc/ibmasm/r_heartbeat.o
  CC      arch/x86/kernel/kdebugfs.o
  CC [M]  drivers/gpu/drm/display/drm_hdcp_helper.o
  CC [M]  drivers/regulator/lp872x.o
  CC [M]  net/netfilter/nf_conntrack_snmp.o
  AR      kernel/debug/kdb/built-in.a
  CC [M]  sound/soc/intel/atom/sst-atom-controls.o
  CC [M]  sound/sound_core.o
  CC [M]  drivers/regulator/lp8788-buck.o
  CC [M]  drivers/tty/serial/altera_uart.o
  CC      drivers/xen/grant-dma-ops.o
  AR      kernel/debug/built-in.a
  CC      kernel/cgroup/misc.o
  CC [M]  crypto/blowfish_common.o
  CC [M]  sound/hda/hdac_component.o
  CC      kernel/bpf/verifier.o
  CC      drivers/mfd/twl4030-irq.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ehl-match.o
  CC [M]  arch/x86/kvm/vmx/hyperv_evmcs.o
  CC [M]  drivers/char/tpm/tpm_i2c_atmel.o
  CC      kernel/bpf/inode.o
  LD [M]  drivers/misc/cardreader/rtsx_pci.o
  CC [M]  drivers/cxl/core/mbox.o
  CC      drivers/nvdimm/e820.o
  CC [M]  drivers/misc/ibmasm/dot_command.o
  CC      kernel/trace/rv/reactor_panic.o
  CC      drivers/dma-buf/dma-heap.o
  CC      drivers/acpi/acpica/utdecode.o
  CC      drivers/mfd/twl6030-irq.o
  CC [M]  arch/x86/kvm/vmx/vmx_onhyperv.o
  CC [M]  drivers/tty/serial/arc_uart.o
  CC [M]  drivers/base/regmap/regmap-w1.o
  CC [M]  drivers/char/tpm/tpm_i2c_infineon.o
  CC      net/handshake/alert.o
  CC [M]  drivers/char/tpm/tpm_i2c_nuvoton.o
  CC [M]  net/llc/llc_core.o
  CC      net/ipv6/ip6mr.o
  CC      net/ipv4/tcp_fastopen.o
  CC [M]  drivers/regulator/lp8788-ldo.o
  CC [M]  fs/netfs/locking.o
  CC      drivers/block/nbd.o
  CC      net/core/timestamping.o
  CC      drivers/acpi/acpica/utdelete.o
  CC      arch/x86/kernel/alternative.o
  CC      lib/memcat_p.o
  CC [M]  drivers/block/drbd/drbd_nla.o
  CC [M]  drivers/misc/ibmasm/lowlevel.o
  CC [M]  drivers/base/regmap/regmap-i3c.o
  CC [M]  drivers/misc/sgi-xp/xp_main.o
  CC [M]  drivers/xen/evtchn.o
  LD [M]  sound/soc/intel/atom/snd-soc-sst-atom-hifi2-platform.o
  CC      kernel/time/itimer.o
  CC [M]  drivers/base/regmap/regmap-spi-avmm.o
  CC [M]  drivers/misc/sgi-xp/xp_uv.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_audio_helper.o
  CC [M]  drivers/nvdimm/pmem.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-jsl-match.o
  CC [M]  crypto/twofish_generic.o
  CC      net/handshake/genl.o
  AR      kernel/trace/rv/built-in.a
  CC      kernel/trace/ftrace.o
  AR      kernel/cgroup/built-in.a
  CC      net/ipv6/xfrm6_policy.o
  CC [M]  drivers/regulator/lp8755.o
  CC [M]  drivers/tty/serial/fsl_linflexuart.o
  LD [M]  block/bfq.o
  AR      block/built-in.a
  CC      drivers/acpi/nvs.o
  CC      drivers/block/virtio_blk.o
  CC      drivers/acpi/wakeup.o
  CC      fs/btrfs/extent_map.o
  CC [M]  sound/hda/hdac_i915.o
  CC      drivers/dma-buf/sync_file.o
  CC      drivers/acpi/acpica/uterror.o
  CC [M]  drivers/block/drbd/drbd_debugfs.o
  CC [M]  net/netfilter/nf_conntrack_pptp.o
  CC      kernel/trace/ring_buffer.o
  CC      drivers/block/xen-blkfront.o
  CC [M]  arch/x86/kvm/svm/svm.o
  CC [M]  drivers/char/tpm/tpm_nsc.o
  CC      drivers/mfd/twl4030-audio.o
  CC [M]  drivers/misc/ibmasm/uart.o
  CC      net/ipv6/xfrm6_state.o
  CC      net/ipv4/tcp_rate.o
  CC      arch/x86/kernel/i8253.o
  CC [M]  sound/hda/intel-dsp-config.o
  CC      drivers/acpi/acpica/uteval.o
  CC [M]  drivers/tty/serial/fsl_lpuart.o
  CC [M]  crypto/twofish_common.o
  CC [M]  drivers/xen/gntdev.o
  CC [M]  drivers/misc/sgi-xp/xpc_main.o
  CC      drivers/acpi/acpica/utglobal.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_cec_helper.o
  CC [M]  drivers/regulator/ltc3589.o
  CC      kernel/time/clockevents.o
  CC [M]  net/llc/llc_input.o
  CC [M]  fs/netfs/main.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-adl-match.o
  CC [M]  drivers/nvdimm/btt.o
  LD [M]  drivers/misc/ibmasm/ibmasm.o
  CC [M]  arch/x86/kvm/svm/pmu.o
  UPD     arch/x86/kvm/kvm-asm-offsets.h
  AR      drivers/gpu/drm/imx/built-in.a
  CC      fs/btrfs/sysfs.o
  CC [M]  drivers/nvdimm/virtio_pmem.o
  CC [M]  fs/netfs/misc.o
  CC [M]  drivers/cxl/core/pci.o
  AR      drivers/base/regmap/built-in.a
  CC [M]  drivers/char/tpm/tpm_atmel.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.o
  CC      drivers/tty/n_tty.o
  AR      drivers/macintosh/built-in.a
  CC [M]  net/tls/tls_main.o
  CC [M]  drivers/tty/serial/lantiq.o
  CC [M]  net/llc/llc_output.o
  CC      drivers/tty/tty_ioctl.o
  CC      drivers/dma-buf/sw_sync.o
  CC      drivers/base/bus.o
  CC [M]  net/tls/tls_sw.o
  CC      mm/shuffle.o
  CC      drivers/base/dd.o
  CC      arch/x86/kernel/hw_breakpoint.o
  CC      drivers/mfd/twl6040.o
  CC      drivers/acpi/acpica/uthex.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-rpl-match.o
  CC      net/core/ptp_classifier.o
  CC      net/handshake/netlink.o
  CC [M]  net/key/af_key.o
  CC [M]  drivers/regulator/ltc3676.o
  CC [M]  sound/hda/intel-nhlt.o
  CC      kernel/events/core.o
  CC [M]  drivers/cxl/core/hdm.o
  CC      drivers/acpi/acpica/utids.o
  CC [M]  drivers/char/tpm/tpm_infineon.o
  CC [M]  drivers/misc/sgi-xp/xpc_channel.o
  CC [M]  drivers/xen/gntdev-dmabuf.o
  CC [M]  drivers/tty/serial/max3100.o
  CC      fs/btrfs/accessors.o
  CC      drivers/dma-buf/sync_debug.o
  CC      kernel/bpf/helpers.o
  LD [M]  drivers/block/drbd/drbd.o
  CC [M]  drivers/xen/gntalloc.o
  CC      kernel/time/tick-common.o
  CC      mm/page_frag_cache.o
  CC [M]  fs/netfs/objects.o
  CC [M]  net/netfilter/nf_conntrack_sane.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_helper.o
  CC      drivers/base/syscore.o
  CC [M]  net/bridge/netfilter/nft_meta_bridge.o
  CC [M]  net/netfilter/nf_conntrack_sip.o
  CC      drivers/acpi/acpica/utinit.o
  CC      kernel/time/tick-broadcast.o
  CC [M]  net/bridge/netfilter/nft_reject_bridge.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-mtl-match.o
  CC      net/ipv4/tcp_recovery.o
  CC      kernel/bpf/tnum.o
  CC [M]  drivers/regulator/max14577-regulator.o
  CC      drivers/dma-buf/udmabuf.o
  CC [M]  sound/ac97_bus.o
  CC [M]  net/llc/llc_if.o
  CC [M]  drivers/block/floppy.o
  CC [M]  drivers/cxl/core/pmu.o
  CC [M]  drivers/misc/sgi-xp/xpc_partition.o
  CC      kernel/fork.o
  CC [M]  crypto/serpent_generic.o
  CC      arch/x86/kernel/tsc.o
  CC [M]  net/bridge/netfilter/nf_conntrack_bridge.o
  CC [M]  drivers/char/tpm/xen-tpmfront.o
  CC [M]  crypto/sm4.o
  CC      drivers/acpi/acpica/utlock.o
  CC      net/ipv6/xfrm6_input.o
  CC [M]  sound/hda/intel-sdw-acpi.o
  CC      drivers/mfd/mfd-core.o
  CC [M]  drivers/nvdimm/nd_virtio.o
  CC [M]  drivers/misc/sgi-gru/grufile.o
  CC      lib/min_heap.o
  CC [M]  drivers/xen/privcmd.o
  CC [M]  drivers/tty/serial/men_z135_uart.o
  CC      drivers/acpi/acpica/utmath.o
  CC [M]  fs/netfs/read_collect.o
  AR      drivers/scsi/device_handler/built-in.a
  CC      net/core/netprio_cgroup.o
  CC [M]  drivers/scsi/device_handler/scsi_dh_rdac.o
  CC      net/handshake/request.o
  CC      fs/btrfs/xattr.o
  CC      kernel/bpf/log.o
  CC [M]  drivers/regulator/max1586.o
  CC      kernel/time/tick-broadcast-hrtimer.o
  CC      mm/init-mm.o
  CC      drivers/acpi/acpica/utmisc.o
  CC      lib/nmi_backtrace.o
  CC [M]  drivers/misc/sgi-xp/xpc_uv.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-arl-match.o
  CC [M]  drivers/scsi/device_handler/scsi_dh_hp_sw.o
  CC [M]  drivers/gpu/drm/display/drm_scdc_helper.o
  CC      mm/memblock.o
  CC [M]  arch/x86/kvm/svm/nested.o
  CC [M]  drivers/dma-buf/selftest.o
  CC      kernel/trace/trace.o
  CC [M]  net/llc/llc_c_ev.o
  CC      kernel/trace/trace_output.o
  CC [M]  drivers/char/uv_mmtimer.o
  CC [M]  net/bridge/netfilter/ebtables.o
  CC [M]  net/bridge/netfilter/ebtable_broute.o
  CC      drivers/acpi/acpica/utmutex.o
  CC [M]  drivers/char/tpm/tpm_vtpm_proxy.o
  CC      net/ipv4/tcp_ulp.o
  CC [M]  drivers/tty/serial/rp2.o
  CC [M]  drivers/cxl/core/cdat.o
  CC [M]  fs/nfs/filelayout/filelayout.o
  CC [M]  net/tls/tls_proc.o
  CC      drivers/base/driver.o
  CC [M]  fs/nfs/blocklayout/blocklayout.o
  CC [M]  drivers/misc/sgi-gru/grumain.o
  LD [M]  sound/hda/snd-hda-core.o
  LD [M]  sound/hda/snd-intel-dspcfg.o
  LD [M]  sound/hda/snd-intel-sdw-acpi.o
  CC [M]  fs/nfs/flexfilelayout/flexfilelayout.o
  CC      kernel/time/tick-oneshot.o
  CC [M]  drivers/char/lp.o
  AR      drivers/gpu/drm/panel/built-in.a
  CC [M]  drivers/gpu/drm/panel/panel-auo-a030jtn01.o
  CC      lib/objpool.o
  CC [M]  drivers/regulator/max77503-regulator.o
  CC      drivers/acpi/acpica/utnonansi.o
  CC [M]  drivers/dma-buf/st-dma-fence.o
  CC [M]  net/bridge/netfilter/ebtable_filter.o
  CC [M]  drivers/dma-buf/st-dma-fence-chain.o
  CC [M]  drivers/scsi/device_handler/scsi_dh_emc.o
  LD [M]  drivers/nvdimm/nd_pmem.o
  LD [M]  drivers/nvdimm/nd_btt.o
  AR      drivers/nvdimm/built-in.a
  CC      net/core/netclassid_cgroup.o
  CC [M]  drivers/xen/privcmd-buf.o
  CC      drivers/mfd/ezx-pcap.o
  CC      arch/x86/kernel/tsc_msr.o
  CC [M]  net/netfilter/nf_conntrack_tftp.o
  CC      fs/btrfs/ordered-data.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-lnl-match.o
  CC [M]  crypto/sm4_generic.o
  CC      kernel/time/tick-sched.o
  LD [M]  drivers/char/tpm/tpm_tis_spi.o
  CC      mm/memory_hotplug.o
  AR      drivers/char/tpm/built-in.a
  CC      drivers/mfd/da903x.o
  CC [M]  drivers/tty/serial/sc16is7xx.o
  CC [M]  drivers/misc/sgi-xp/xpnet.o
  CC      drivers/acpi/acpica/utobject.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_state_helper.o
  CC      kernel/exec_domain.o
  CC      drivers/base/class.o
  CC [M]  net/llc/llc_c_ac.o
  CC [M]  drivers/gpu/drm/panel/panel-ilitek-ili9341.o
  CC [M]  crypto/aes_ti.o
  CC      drivers/acpi/sleep.o
  CC [M]  drivers/char/applicom.o
  CC      lib/plist.o
  CC      arch/x86/kernel/io_delay.o
  CC [M]  drivers/regulator/max77541-regulator.o
  CC [M]  drivers/scsi/device_handler/scsi_dh_alua.o
  CC      net/ipv4/tcp_offload.o
  CC [M]  fs/netfs/read_pgpriv2.o
  CC      net/ipv6/xfrm6_output.o
  CC [M]  net/tls/trace.o
  CC      lib/radix-tree.o
  CC [M]  fs/lockd/clntlock.o
  CC [M]  drivers/misc/sgi-gru/grufault.o
  CC [M]  drivers/dma-buf/st-dma-fence-unwrap.o
  CC      drivers/acpi/acpica/utosi.o
  CC [M]  fs/lockd/clntproc.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ptl-match.o
  CC      net/handshake/tlshd.o
  CC [M]  drivers/cxl/core/ras.o
  CC [M]  drivers/block/brd.o
  CC [M]  fs/nfs/blocklayout/dev.o
  CC [M]  drivers/xen/xen-scsiback.o
  CC      net/ipv4/tcp_plb.o
  CC [M]  arch/x86/kvm/svm/avic.o
  CC [M]  crypto/camellia_generic.o
  CC [M]  fs/nfs/filelayout/filelayoutdev.o
  CC [M]  net/netfilter/nf_log_syslog.o
  CC      arch/x86/kernel/rtc.o
  CC      net/ipv4/datagram.o
  CC [M]  crypto/cast_common.o
  CC      drivers/acpi/acpica/utownerid.o
  CC [M]  drivers/regulator/max8649.o
  CC [M]  drivers/block/ublk_drv.o
  CC [M]  drivers/gpu/drm/display/drm_dp_aux_dev.o
  LD [M]  drivers/misc/sgi-xp/xp.o
  LD [M]  drivers/misc/sgi-xp/xpc.o
  CC      net/core/lwtunnel.o
  CC      drivers/base/platform.o
  CC [M]  drivers/gpu/drm/panel/panel-orisetech-ota5601a.o
  CC [M]  drivers/char/nvram.o
  CC [M]  fs/netfs/read_retry.o
  CC [M]  drivers/dma-buf/st-dma-resv.o
  CC      fs/btrfs/extent_io.o
  CC      net/ipv6/xfrm6_protocol.o
  CC      kernel/bpf/token.o
  CC [M]  net/tls/tls_strp.o
  CC      drivers/mfd/da9052-irq.o
  CC [M]  drivers/cxl/core/acpi.o
  CC      drivers/acpi/acpica/utpredef.o
  CC [M]  net/llc/llc_conn.o
  CC      drivers/mfd/da9052-core.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-hda-match.o
  CC      net/handshake/trace.o
  CC [M]  drivers/tty/serial/sc16is7xx_spi.o
  CC      arch/x86/kernel/resource.o
  CC [M]  drivers/misc/sgi-gru/grutlbpurge.o
  AR      drivers/scsi/megaraid/built-in.a
  CC [M]  drivers/scsi/megaraid/megaraid_mm.o
  CC [M]  fs/nfs/flexfilelayout/flexfilelayoutdev.o
  CC      kernel/time/timer_migration.o
  CC [M]  drivers/misc/c2port/core.o
  AR      drivers/dma-buf/built-in.a
  LD [M]  drivers/dma-buf/dmabuf_selftests.o
  CC [M]  drivers/scsi/megaraid/megaraid_mbox.o
  CC [M]  drivers/regulator/max8660.o
  CC [M]  drivers/misc/c2port/c2port-duramar2150.o
  CC      drivers/acpi/acpica/utresdecode.o
  CC [M]  fs/lockd/clntxdr.o
  CC      lib/ratelimit.o
  AS      arch/x86/kernel/irqflags.o
  CC [M]  net/llc/llc_c_st.o
  CC [M]  net/bridge/netfilter/ebtable_nat.o
  CC      mm/slub.o
  CC [M]  drivers/gpu/drm/display/drm_dp_cec.o
  CC [M]  crypto/cast5_generic.o
  CC [M]  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.o
  CC [M]  drivers/xen/pvcalls-front.o
  CC [M]  drivers/cxl/core/trace.o
  CC [M]  fs/lockd/host.o
  LD [M]  fs/nfs/filelayout/nfs_layout_nfsv41_files.o
  CC [M]  drivers/cxl/core/region.o
  CC [M]  drivers/regulator/max8893.o
  CC [M]  drivers/tty/serial/sc16is7xx_i2c.o
  CC [M]  fs/nfs/blocklayout/extent_tree.o
  CC [M]  net/netfilter/nf_nat_core.o
  CC [M]  fs/netfs/read_single.o
  CC [M]  drivers/char/ppdev.o
  CC [M]  arch/x86/kvm/svm/sev.o
  CC      drivers/acpi/acpica/utresrc.o
  CC      arch/x86/kernel/static_call.o
  CC [M]  drivers/misc/sgi-gru/gruprocfs.o
  CC      lib/rbtree.o
  CC [M]  drivers/tty/serial/sprd_serial.o
  CC      net/core/lwt_bpf.o
  CC      drivers/acpi/acpica/utstate.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.o
  CC      drivers/mfd/da9052-spi.o
  CC      kernel/time/vsyscall.o
  CC [M]  drivers/gpu/drm/panel/panel-widechips-ws2401.o
  AR      drivers/gpu/drm/bridge/analogix/built-in.a
  CC [M]  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.o
  CC      drivers/base/cpu.o
  AR      drivers/gpu/drm/bridge/cadence/built-in.a
  CC      net/ipv4/raw.o
  CC [M]  drivers/xen/xen-front-pgdir-shbuf.o
  CC      drivers/mfd/da9052-i2c.o
  CC      drivers/acpi/device_sysfs.o
  AR      drivers/block/built-in.a
  CC [M]  net/bridge/netfilter/ebt_802_3.o
  CC [M]  net/tls/tls_device.o
  CC      drivers/acpi/acpica/utstring.o
  AR      net/handshake/built-in.a
  CC [M]  net/bridge/netfilter/ebt_among.o
  CC      kernel/trace/trace_seq.o
  CC      drivers/acpi/acpica/utstrsuppt.o
  AR      drivers/gpu/drm/hisilicon/built-in.a
  CC      fs/btrfs/volumes.o
  CC [M]  net/llc/llc_pdu.o
  CC [M]  drivers/regulator/max8907-regulator.o
  CC      mm/madvise.o
  CC [M]  fs/smb/common/cifs_arc4.o
  CC      lib/seq_buf.o
  LD [M]  fs/nfs/flexfilelayout/nfs_layout_flexfiles.o
  CC [M]  drivers/misc/sgi-gru/grukservices.o
  CC [M]  fs/smb/client/trace.o
  CC [M]  fs/romfs/storage.o
  CC      lib/siphash.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ssp-common.o
  CC [M]  drivers/char/tlclk.o
  CC [M]  crypto/cast6_generic.o
  CC [M]  fs/romfs/super.o
  CC      net/ipv6/netfilter.o
  CC [M]  drivers/tty/serial/uartlite.o
  CC [M]  net/netfilter/nf_nat_proto.o
  CC [M]  arch/x86/kvm/svm/hyperv.o
  CC      kernel/time/timekeeping_debug.o
  CC      arch/x86/kernel/process.o
  CC      drivers/acpi/acpica/utstrtoul64.o
  CC [M]  fs/lockd/svc.o
  CC [M]  drivers/scsi/megaraid/megaraid_sas_base.o
  LD [M]  drivers/gpu/drm/display/drm_display_helper.o
  CC [M]  net/llc/llc_sap.o
  CC [M]  fs/nfs/blocklayout/rpc_pipefs.o
  CC [M]  fs/netfs/rolling_buffer.o
  CC      drivers/mfd/lp8788.o
  CC      drivers/acpi/device_pm.o
  CC [M]  net/llc/llc_s_ac.o
  CC [M]  drivers/gpu/drm/bridge/analogix/analogix_dp_core.o
  CC [M]  drivers/regulator/max8925-regulator.o
  CC [M]  drivers/misc/sgi-gru/gruhandles.o
  CC      fs/btrfs/async-thread.o
  CC      drivers/acpi/acpica/utxface.o
  CC [M]  drivers/scsi/libsas/sas_init.o
  CC      net/core/dst_cache.o
  CC      kernel/trace/trace_stat.o
  CC [M]  drivers/cxl/core/mce.o
  CC [M]  fs/smb/common/cifs_md4.o
  CC [M]  net/bridge/netfilter/ebt_arp.o
  CC [M]  drivers/scsi/libsas/sas_phy.o
  CC [M]  drivers/char/hangcheck-timer.o
  CC [M]  fs/autofs/init.o
  CC      kernel/trace/trace_printk.o
  CC      lib/string.o
  CC      kernel/time/namespace.o
  CC      drivers/base/firmware.o
  AR      drivers/tty/serial/built-in.a
  CC      drivers/tty/tty_ldisc.o
  CC [M]  drivers/regulator/max8952.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-sdca-quirks.o
  CC [M]  crypto/aria_generic.o
  LD [M]  fs/romfs/romfs.o
  CC [M]  net/tls/tls_device_fallback.o
  CC      net/ipv6/fib6_rules.o
  LD [M]  drivers/xen/xen-evtchn.o
  LD [M]  drivers/xen/xen-gntdev.o
  LD [M]  drivers/xen/xen-gntalloc.o
  LD [M]  drivers/xen/xen-privcmd.o
  AR      drivers/xen/built-in.a
  CC [M]  drivers/scsi/megaraid/megaraid_sas_fusion.o
  CC      kernel/events/ring_buffer.o
  CC      lib/timerqueue.o
../drivers/gpu/drm/bridge/analogix/analogix_dp_core.c: In function ‘analogix_dp_probe’:
../drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1589:17: error: label ‘err_disable_clk’ used but not defined
 1589 |                 goto err_disable_clk;
      |                 ^~~~
make[8]: *** [../scripts/Makefile.build:203: drivers/gpu/drm/bridge/analogix/analogix_dp_core.o] Error 1
make[7]: *** [../scripts/Makefile.build:461: drivers/gpu/drm/bridge/analogix] Error 2
make[6]: *** [../scripts/Makefile.build:461: drivers/gpu/drm/bridge] Error 2
make[5]: *** [../scripts/Makefile.build:461: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:461: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
  CC [M]  drivers/cxl/port.o
  LD [M]  sound/soc/intel/common/snd-soc-acpi-intel-match.o
  CC      drivers/tty/tty_buffer.o
  COPY    drivers/scsi/aic7xxx/aic7xxx_seq.h
  COPY    drivers/scsi/aic7xxx/aic7xxx_reg.h
  COPY    drivers/scsi/aic7xxx/aic7xxx_reg_print.c
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_osm.o
  CC      drivers/acpi/acpica/utxfinit.o
  CC [M]  drivers/misc/sgi-gru/grukdump.o
  CC      net/core/gro_cells.o
  CC      net/ipv6/proc.o
  CC      net/ipv6/syncookies.o
  AR      drivers/char/built-in.a
  CC [M]  net/llc/llc_s_ev.o
  CC      lib/union_find.o
  LD [M]  fs/nfs/blocklayout/blocklayoutdriver.o
  CC [M]  fs/nfs/client.o
  CC [M]  fs/autofs/inode.o
  CC [M]  drivers/scsi/libsas/sas_port.o
  CC      drivers/base/init.o
  CC [M]  drivers/regulator/max8997-regulator.o
  AR      drivers/cxl/core/built-in.a
  LD [M]  drivers/cxl/core/cxl_core.o
  CC [M]  net/bridge/netfilter/ebt_ip.o
  CC      drivers/mfd/lp8788-irq.o
  CC      drivers/base/map.o
  CC [M]  net/netfilter/nf_nat_helper.o
  AR      kernel/time/built-in.a
  CC      lib/vsprintf.o
  CC [M]  net/sunrpc/auth_gss/auth_gss.o
  CC [M]  net/kcm/kcmsock.o
  CC [M]  fs/netfs/write_collect.o
  CC      drivers/acpi/acpica/utxferror.o
  CC      drivers/acpi/acpica/utxfmutex.o
  CC [M]  net/l2tp/l2tp_core.o
  CC      net/ipv4/udp.o
  CC [M]  net/l2tp/l2tp_ip.o
  CC [M]  drivers/cxl/acpi.o
  CC [M]  net/llc/llc_s_st.o
  LD [M]  sound/soc/intel/common/snd-soc-acpi-intel-sdca-quirks.o
  CC [M]  crypto/chacha_generic.o
  CC [M]  fs/lockd/svclock.o
  CC      arch/x86/kernel/ptrace.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_proc.o
  CC [M]  sound/soc/sdca/sdca_functions.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_osm_pci.o
  LD [M]  drivers/misc/sgi-gru/gru.o
  CC [M]  arch/x86/kvm/svm/svm_onhyperv.o
  CC      kernel/trace/pid_list.o
  CC [M]  fs/netfs/write_issue.o
  LD [M]  arch/x86/kvm/kvm.o
  CC      drivers/base/devres.o
  CC [M]  drivers/misc/altera-stapl/altera-jtag.o
  CC      drivers/mfd/da9055-core.o
  CC      kernel/bpf/bpf_iter.o
  CC [M]  net/bridge/netfilter/ebt_ip6.o
  CC      kernel/events/callchain.o
  CC      net/core/failover.o
  CC [M]  fs/autofs/root.o
  CC [M]  drivers/scsi/isci/init.o
  CC      net/core/skmsg.o
  CC      drivers/tty/tty_port.o
  CC [M]  drivers/scsi/libsas/sas_event.o
  CC [M]  net/netfilter/nf_nat_redirect.o
  CC      drivers/acpi/acpica/dbcmds.o
  CC      lib/win_minmax.o
  CC [M]  drivers/regulator/max8998.o
  CC [M]  crypto/poly1305_generic.o
  CC [M]  net/sunrpc/auth_gss/gss_mech_switch.o
  CC [M]  fs/lockd/svcshare.o
  CC [M]  net/netfilter/nf_nat_masquerade.o
  CC [M]  drivers/misc/altera-stapl/altera-comp.o
  CC [M]  net/llc/af_llc.o
  CC [M]  fs/lockd/svcproc.o
  CC [M]  drivers/cxl/pmem.o
  CC      kernel/panic.o
  COPY    drivers/scsi/aic7xxx/aic79xx_seq.h
  COPY    drivers/scsi/aic7xxx/aic79xx_reg.h
  COPY    drivers/scsi/aic7xxx/aic79xx_reg_print.c
  CC [M]  drivers/scsi/aic7xxx/aic79xx_osm.o
  CC [M]  drivers/misc/altera-stapl/altera.o
  AS [M]  arch/x86/kvm/vmx/vmenter.o
  CC [M]  fs/netfs/write_retry.o
  AS [M]  arch/x86/kvm/svm/vmenter.o
  CC      drivers/acpi/acpica/dbconvert.o
  LD [M]  net/tls/tls.o
  CC      kernel/events/hw_breakpoint.o
  CC      kernel/trace/tracing_map.o
  CC [M]  fs/autofs/symlink.o
  CC      kernel/trace/trace_sched_switch.o
  LD [M]  arch/x86/kvm/kvm-intel.o
  CC [M]  fs/smb/client/cifsfs.o
  CC      arch/x86/kernel/tls.o
  CC [M]  crypto/michael_mic.o
  CC      drivers/mfd/da9055-i2c.o
  LD [M]  arch/x86/kvm/kvm-amd.o
  CC [M]  drivers/scsi/megaraid/megaraid_sas_fp.o
  CC [M]  fs/autofs/waitq.o
  CC [M]  net/bridge/netfilter/ebt_limit.o
  CC [M]  fs/nfs/dir.o
  CC      net/ipv6/calipso.o
  CC      lib/xarray.o
  CC [M]  drivers/scsi/isci/phy.o
  CC      mm/page_io.o
  CC      kernel/bpf/map_iter.o
  CC [M]  drivers/regulator/max20086-regulator.o
  CC      kernel/bpf/task_iter.o
  CC      drivers/base/attribute_container.o
  CC      drivers/acpi/proc.o
  CC      drivers/acpi/bus.o
  CC      drivers/tty/tty_mutex.o
  CC [M]  net/kcm/kcmproc.o
  CC      drivers/acpi/acpica/dbdisply.o
  CC      fs/btrfs/ioctl.o
  CC [M]  drivers/scsi/libsas/sas_discover.o
  CC [M]  net/llc/llc_station.o
  CC      fs/btrfs/locking.o
  CC      fs/btrfs/orphan.o
  CC [M]  crypto/crc32_generic.o
  CC [M]  sound/soc/sdca/sdca_device.o
  CC [M]  crypto/authenc.o
  CC [M]  drivers/cxl/security.o
  CC [M]  net/netfilter/nf_nat_ovs.o
  CC      drivers/acpi/glue.o
  CC [M]  crypto/authencesn.o
  CC [M]  fs/netfs/stats.o
  CC      drivers/mfd/da9063-core.o
  CC [M]  fs/lockd/svcsubs.o
  CC      arch/x86/kernel/step.o
  CC [M]  fs/autofs/expire.o
  CC [M]  net/l2tp/l2tp_netlink.o
  CC      drivers/acpi/acpica/dbexec.o
  CC [M]  fs/autofs/dev-ioctl.o
  CC [M]  net/bridge/netfilter/ebt_mark_m.o
  CC [M]  crypto/lz4.o
  CC      kernel/trace/trace_functions.o
  CC [M]  drivers/regulator/max20411-regulator.o
  CC [M]  crypto/lz4hc.o
  CC [M]  fs/netfs/fscache_cache.o
  CC [M]  drivers/scsi/isci/request.o
  CC [M]  fs/netfs/fscache_cookie.o
  CC [M]  net/sunrpc/auth_gss/svcauth_gss.o
  CC [M]  sound/soc/sdca/sdca_regmap.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_proc.o
  CC [M]  fs/netfs/fscache_io.o
  CC [M]  drivers/scsi/megaraid/megaraid_sas_debugfs.o
  CC      drivers/base/transport_class.o
  CC      mm/swap_state.o
  CC      drivers/mfd/da9063-irq.o
  CC      drivers/tty/tty_ldsem.o
  CC [M]  drivers/cxl/mem.o
  CC [M]  net/llc/llc_proc.o
  CC      kernel/bpf/prog_iter.o
  CC [M]  drivers/scsi/libsas/sas_expander.o
  CC [M]  crypto/842.o
  CC [M]  fs/netfs/fscache_main.o
  CC      drivers/acpi/acpica/dbhistry.o
  CC [M]  fs/netfs/fscache_volume.o
  CC      arch/x86/kernel/tboot.o
  LD [M]  net/kcm/kcm.o
  CC      lib/lockref.o
  CC      kernel/trace/trace_preemptirq.o
  CC [M]  fs/netfs/fscache_proc.o
  CC      net/ipv6/seg6_iptunnel.o
  CC      net/ipv4/udplite.o
  CC [M]  drivers/scsi/isci/remote_device.o
  CC      kernel/events/uprobes.o
  CC [M]  drivers/scsi/isci/port.o
  CC [M]  drivers/misc/altera-stapl/altera-lpt.o
  CC      net/core/sock_map.o
  CC [M]  fs/nfs/file.o
  CC [M]  drivers/regulator/max77693-regulator.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_osm_pci.o
  CC      net/ipv6/seg6_local.o
  LD [M]  fs/autofs/autofs4.o
  CC      net/ipv4/udp_offload.o
  CC [M]  crypto/ansi_cprng.o
  CC [M]  fs/smb/client/cifs_debug.o
  LD [M]  drivers/misc/altera-stapl/altera-stapl.o
  CC [M]  net/bridge/netfilter/ebt_pkttype.o
  CC      drivers/mfd/da9063-i2c.o
  CC      kernel/bpf/link_iter.o
  CC      mm/swapfile.o
  CC [M]  drivers/misc/mei/hdcp/mei_hdcp.o
  CC      drivers/acpi/acpica/dbinput.o
  LD [M]  drivers/scsi/megaraid/megaraid_sas.o
  CC      drivers/tty/tty_baudrate.o
  CC      mm/zswap.o
  CC      kernel/cpu.o
  CC      lib/bcd.o
  CC [M]  drivers/cxl/pci.o
  CC [M]  fs/lockd/mon.o
  CC      fs/btrfs/export.o
  CC      lib/sort.o
  LD [M]  sound/soc/sdca/snd-soc-sdca.o
  CC      drivers/base/topology.o
  CC [M]  net/netfilter/nf_nat_amanda.o
  CC [M]  sound/soc/soc-acpi.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_core.o
  CC [M]  net/llc/sysctl_net_llc.o
  CC      lib/parser.o
  CC      lib/debug_locks.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_93cx6.o
  CC [M]  crypto/tcrypt.o
  CC      arch/x86/kernel/i8237.o
  CC      mm/dmapool.o
  CC [M]  net/netfilter/nf_nat_ftp.o
  LD [M]  sound/soundcore.o
  CC      drivers/acpi/acpica/dbmethod.o
  CC      lib/random32.o
  CC      net/ipv6/seg6_hmac.o
  CC [M]  drivers/regulator/max77826-regulator.o
  CC      lib/bust_spinlocks.o
  CC      drivers/mfd/max14577.o
  CC      mm/hugetlb.o
  CC [M]  net/l2tp/l2tp_eth.o
  CC [M]  net/netfilter/nf_nat_irc.o
  CC [M]  net/bridge/netfilter/ebt_stp.o
  CC [M]  drivers/misc/mei/pxp/mei_pxp.o
  CC      drivers/mfd/max77693.o
  CC      arch/x86/kernel/stacktrace.o
  CC      kernel/bpf/hashtab.o
  CC [M]  drivers/scsi/isci/host.o
  CC      drivers/mfd/max77843.o
  CC      drivers/acpi/acpica/dbnames.o
  CC      drivers/base/container.o
  CC      drivers/tty/tty_jobctrl.o
  CC      kernel/trace/trace_sched_wakeup.o
  LD [M]  net/llc/llc.o
  CC      net/ipv6/ioam6_iptunnel.o
  LD [M]  net/llc/llc2.o
  CC [M]  net/dccp/ccid.o
  LD [M]  drivers/cxl/cxl_port.o
  LD [M]  drivers/cxl/cxl_acpi.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_pci.o
  LD [M]  drivers/cxl/cxl_pmem.o
  LD [M]  drivers/cxl/cxl_mem.o
  LD [M]  drivers/cxl/cxl_pci.o
  AR      drivers/cxl/built-in.a
  CC [M]  crypto/polyval-generic.o
  CC      lib/kasprintf.o
  CC [M]  drivers/misc/vmw_vmci/vmci_context.o
  CC      kernel/exit.o
  CC      drivers/base/property.o
  CC      fs/btrfs/tree-log.o
  CC [M]  drivers/regulator/max77857-regulator.o
  CC [M]  net/l2tp/l2tp_debugfs.o
  CC [M]  fs/lockd/trace.o
  CC [M]  drivers/misc/mei/gsc_proxy/mei_gsc_proxy.o
  CC [M]  fs/smb/client/connect.o
  CC [M]  fs/netfs/fscache_stats.o
  CC [M]  net/bridge/netfilter/ebt_vlan.o
  CC [M]  sound/soc/soc-core.o
  CC [M]  drivers/scsi/libsas/sas_scsi_host.o
  CC      drivers/acpi/acpica/dbobject.o
  CC [M]  net/bridge/br.o
  CC      drivers/acpi/scan.o
  CC [M]  net/sunrpc/auth_gss/gss_rpc_upcall.o
  CC      arch/x86/kernel/reboot.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_reg_print.o
  CC      fs/btrfs/free-space-cache.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_base.o
  CC [M]  drivers/scsi/isci/task.o
  CC      drivers/acpi/mipi-disco-img.o
  CC      drivers/base/cacheinfo.o
  CC      lib/bitmap.o
  CC      fs/btrfs/zlib.o
  CC      net/ipv4/arp.o
  CC [M]  net/netfilter/nf_nat_sip.o
  CC [M]  crypto/af_alg.o
  CC [M]  net/sctp/sm_statetable.o
  AR      kernel/events/built-in.a
  CC      drivers/acpi/acpica/dbstats.o
  CC      net/ipv4/icmp.o
  CC      drivers/mfd/max8925-core.o
  CC [M]  drivers/regulator/mc13783-regulator.o
  CC      drivers/tty/n_null.o
  CC [M]  drivers/misc/mei/init.o
  CC [M]  fs/nfs/getroot.o
  CC      kernel/trace/trace_hwlat.o
  CC [M]  drivers/misc/vmw_vmci/vmci_datagram.o
  CC      lib/scatterlist.o
  CC      net/ipv4/devinet.o
  CC [M]  net/dccp/feat.o
  CC [M]  net/rds/af_rds.o
  CC      net/core/bpf_sk_storage.o
  CC [M]  net/l2tp/l2tp_ip6.o
  CC [M]  fs/lockd/xdr.o
  CC [M]  net/bridge/netfilter/ebt_arpreply.o
  CC      drivers/acpi/acpica/dbutils.o
  CC [M]  fs/fuse/dev.o
  CC [M]  net/sunrpc/auth_gss/gss_rpc_xdr.o
  CC      drivers/tty/pty.o
  LD [M]  fs/netfs/netfs.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_config.o
  CC      drivers/mfd/max8925-i2c.o
  CC      lib/list_sort.o
  CC      drivers/acpi/resource.o
  CC      drivers/mfd/max8997.o
  CC [M]  net/bridge/netfilter/ebt_mark.o
  CC [M]  drivers/scsi/isci/probe_roms.o
  CC      drivers/mfd/max8997-irq.o
  CC [M]  sound/soc/soc-dapm.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_core.o
  CC [M]  drivers/regulator/mc13892-regulator.o
  CC      drivers/acpi/acpi_processor.o
  CC      net/ipv6/addrconf_core.o
  CC      drivers/acpi/acpica/dbxface.o
  CC [M]  crypto/algif_hash.o
  CC [M]  net/rds/bind.o
  CC      arch/x86/kernel/early-quirks.o
  CC      drivers/base/swnode.o
  CC      kernel/bpf/arraymap.o
  CC [M]  net/sctp/sm_statefuns.o
  CC      lib/uuid.o
  CC      kernel/trace/trace_osnoise.o
  CC [M]  net/netfilter/nf_nat_tftp.o
  CC [M]  drivers/misc/vmw_vmci/vmci_doorbell.o
  CC [M]  drivers/misc/mei/hbm.o
  CC [M]  fs/nfs/inode.o
  CC [M]  drivers/scsi/libsas/sas_task.o
  CC [M]  net/dccp/input.o
  CC [M]  crypto/algif_skcipher.o
  CC      drivers/tty/tty_audit.o
  CC [M]  fs/overlayfs/super.o
  CC [M]  fs/lockd/netlink.o
  CC [M]  fs/overlayfs/namei.o
  CC [M]  drivers/scsi/isci/remote_node_context.o
  CC      drivers/acpi/acpica/rsdump.o
  CC [M]  drivers/misc/vmw_vmci/vmci_driver.o
  CC [M]  drivers/regulator/mc13xxx-regulator-core.o
  CC [M]  net/bridge/netfilter/ebt_dnat.o
  CC [M]  drivers/regulator/mp8859.o
  CC [M]  net/sunrpc/auth_gss/trace.o
  CC      net/ipv4/af_inet.o
  CC      lib/iov_iter.o
  CC [M]  net/bridge/br_device.o
  CC      net/ipv4/igmp.o
  CC [M]  drivers/regulator/mt6311-regulator.o
  CC      net/ipv4/fib_frontend.o
  CC      kernel/bpf/percpu_freelist.o
  CC      drivers/mfd/max8998.o
  AR      drivers/acpi/acpica/built-in.a
  CC      kernel/trace/trace_nop.o
  CC [M]  fs/nfs/super.o
  CC      fs/btrfs/lzo.o
  CC      drivers/tty/sysrq.o
  CC [M]  net/netfilter/nf_synproxy_core.o
  CC [M]  drivers/misc/mei/interrupt.o
  CC      drivers/acpi/processor_core.o
  CC [M]  fs/lockd/clnt4xdr.o
  CC [M]  net/rds/cong.o
  CC      arch/x86/kernel/smp.o
  CC      drivers/base/faux.o
  CC [M]  fs/9p/vfs_super.o
  CC      net/core/devmem.o
  CC [M]  crypto/algif_rng.o
  CC [M]  net/sctp/sm_sideeffect.o
  CC [M]  drivers/scsi/libsas/sas_ata.o
  CC [M]  drivers/misc/vmw_vmci/vmci_event.o
  CC [M]  drivers/misc/mei/client.o
  CC      fs/btrfs/zstd.o
  CC      kernel/bpf/bpf_lru_list.o
  CC [M]  drivers/scsi/isci/remote_node_table.o
  CC [M]  drivers/misc/mei/main.o
  CC      net/ipv6/exthdrs_core.o
  CC [M]  net/sctp/protocol.o
  CC [M]  fs/smb/client/dir.o
  CC      mm/hugetlb_vmemmap.o
  CC [M]  fs/overlayfs/util.o
  CC      mm/mempolicy.o
  CC [M]  net/bridge/netfilter/ebt_redirect.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_scsih.o
  CC      arch/x86/kernel/smpboot.o
  CC [M]  drivers/regulator/mt6315-regulator.o
  CC [M]  drivers/scsi/isci/unsolicited_frame_control.o
  CC [M]  fs/fuse/dir.o
  CC      kernel/bpf/lpm_trie.o
  CC [M]  fs/9p/vfs_inode.o
  CC [M]  fs/9p/vfs_inode_dotl.o
  CC      net/ipv4/fib_semantics.o
  CC      drivers/mfd/max8998-irq.o
  CC [M]  net/rds/connection.o
  CC      kernel/trace/trace_stack.o
  CC      drivers/mfd/adp5520.o
  CC      drivers/acpi/processor_pdc.o
  CC      drivers/base/auxiliary.o
  CC      drivers/base/devtmpfs.o
  CC [M]  fs/lockd/xdr4.o
  CC [M]  crypto/algif_aead.o
  CC [M]  drivers/misc/vmw_vmci/vmci_guest.o
  CC [M]  net/dccp/minisocks.o
  CC [M]  net/core/pktgen.o
  CC [M]  sound/soc/soc-jack.o
  CC [M]  drivers/regulator/mt6323-regulator.o
  CC      fs/btrfs/compression.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_mech.o
  CC      mm/sparse.o
  CC [M]  drivers/scsi/isci/port_config.o
  CC [M]  drivers/tty/n_hdlc.o
  CC [M]  fs/lockd/svc4proc.o
  CC [M]  fs/overlayfs/inode.o
  CC [M]  net/bridge/netfilter/ebt_snat.o
  CC      kernel/softirq.o
  CC [M]  fs/cachefiles/cache.o
  CC      drivers/base/isa.o
  CC      drivers/acpi/ec.o
  CC [M]  drivers/scsi/libsas/sas_host_smp.o
  CC [M]  fs/cachefiles/daemon.o
  CC [M]  net/9p/mod.o
  CC [M]  fs/overlayfs/file.o
  CC [M]  net/bridge/netfilter/ebt_log.o
  CC      net/ipv6/ip6_checksum.o
  CC [M]  fs/9p/vfs_addr.o
  CC [M]  drivers/misc/mei/dma-ring.o
  CC      kernel/trace/trace_mmiotrace.o
  CC [M]  net/sctp/endpointola.o
  CC      kernel/bpf/map_in_map.o
  CC [M]  crypto/zstd.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_transport.o
  CC      kernel/resource.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_pci.o
  CC [M]  fs/smb/client/file.o
  CC      lib/clz_ctz.o
  CC [M]  drivers/regulator/mt6331-regulator.o
  CC      net/ipv6/ip6_icmp.o
  CC [M]  fs/fuse/file.o
  CC      fs/btrfs/delayed-ref.o
  CC [M]  fs/nfs/io.o
  CC [M]  net/netfilter/nf_conncount.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_ctl.o
  CC      lib/bsearch.o
  CC [M]  drivers/tty/n_gsm.o
  CC      arch/x86/kernel/tsc_sync.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_reg_print.o
  LD [M]  drivers/scsi/isci/isci.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_trigger_diag.o
  CC      drivers/mfd/tps6586x.o
  CC [M]  drivers/misc/vmw_vmci/vmci_handle_array.o
  CC      mm/sparse-vmemmap.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_warpdrive.o
  CC [M]  drivers/misc/mei/bus.o
  CC [M]  sound/soc/soc-utils.o
  CC [M]  crypto/essiv.o
  CC [M]  fs/lockd/procfs.o
  CC [M]  net/rds/info.o
  CC      drivers/base/node.o
  CC [M]  net/9p/client.o
  CC [M]  fs/9p/vfs_file.o
  CC      kernel/bpf/bloom_filter.o
  CC [M]  fs/cachefiles/interface.o
  CC [M]  fs/overlayfs/dir.o
  CC [M]  net/9p/error.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_debugfs.o
  CC      arch/x86/kernel/setup_percpu.o
  CC [M]  drivers/regulator/mt6332-regulator.o
  CC      kernel/trace/trace_functions_graph.o
  CC [M]  drivers/misc/vmw_vmci/vmci_host.o
  CC [M]  fs/vboxsf/dir.o
  CC      fs/open.o
  CC [M]  net/bridge/netfilter/ebt_nflog.o
  LD [M]  drivers/scsi/libsas/libsas.o
  LD [M]  drivers/scsi/aic7xxx/aic7xxx.o
  CC [M]  net/sctp/associola.o
  CC      fs/read_write.o
  LD [M]  drivers/scsi/aic7xxx/aic79xx.o
  CC [M]  net/dccp/options.o
  CC [M]  net/dccp/output.o
  CC      drivers/mfd/tps65090.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_seal.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_unseal.o
  CC [M]  fs/nfs/direct.o
  CC [M]  drivers/misc/vmw_vmci/vmci_queue_pair.o
  CC      lib/find_bit.o
  CC [M]  fs/vboxsf/file.o
  CC      drivers/base/memory.o
  LD [M]  fs/lockd/lockd.o
  CC [M]  net/sunrpc/clnt.o
  CC [M]  crypto/curve25519-generic.o
  CC [M]  net/netfilter/nf_dup_netdev.o
  CC      drivers/acpi/dock.o
  CC [M]  fs/9p/vfs_dir.o
  CC      kernel/bpf/local_storage.o
  CC      lib/llist.o
  CC [M]  drivers/regulator/mt6357-regulator.o
  CC      mm/mmu_notifier.o
  ASN.1   crypto/ecrdsa_params.asn1.[ch]
  CC      drivers/acpi/pci_root.o
  CC      kernel/sysctl.o
  CC      fs/btrfs/relocation.o
  CC [M]  net/9p/protocol.o
  CC      mm/ksm.o
  CC      fs/btrfs/delayed-inode.o
  CC      net/ipv6/output_core.o
  CC      lib/lwq.o
  CC      mm/page_poison.o
  CC [M]  sound/soc/soc-dai.o
  CC [M]  sound/soc/soc-component.o
  CC      net/ipv4/fib_trie.o
  CC [M]  fs/cachefiles/io.o
  CC      drivers/mfd/aat2870-core.o
  CC [M]  fs/overlayfs/readdir.o
  CC      arch/x86/kernel/mpparse.o
  CC [M]  drivers/misc/mei/bus-fixup.o
  CC [M]  net/bridge/br_fdb.o
  AR      net/core/built-in.a
  CC      net/ipv4/fib_notifier.o
  ASN.1   crypto/ecrdsa_pub_key.asn1.[ch]
  CC [M]  crypto/ecrdsa_params.asn1.o
  CC      kernel/trace/blktrace.o
  CC [M]  sound/soc/soc-pcm.o
  CC      drivers/scsi/scsi.o
  CC [M]  crypto/ecrdsa_pub_key.asn1.o
  CC [M]  fs/vboxsf/utils.o
  CC      lib/memweight.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_wrap.o
  CC [M]  sound/soc/soc-devres.o
  CC [M]  crypto/simd.o
  CC [M]  drivers/regulator/mt6358-regulator.o
  CC [M]  drivers/tty/moxa.o
  CC [M]  fs/9p/vfs_dentry.o
  CC [M]  net/rds/message.o
  CC      lib/kfifo.o
  CC [M]  fs/fuse/inode.o
  CC [M]  net/sctp/transport.o
  CC [M]  net/psample/psample.o
  CC      drivers/base/module.o
  CC      kernel/trace/fgraph.o
  CC      drivers/mfd/intel-lpss.o
  CC      net/ipv6/protocol.o
  CC      kernel/bpf/queue_stack_maps.o
  LD [M]  drivers/scsi/mpt3sas/mpt3sas.o
  CC      fs/file_table.o
  CC [M]  drivers/misc/mei/debugfs.o
  CC [M]  fs/smb/client/inode.o
  CC [M]  drivers/misc/genwqe/card_base.o
  CC      arch/x86/kernel/ftrace.o
  CC [M]  fs/vboxsf/vboxsf_wrappers.o
  CC [M]  fs/9p/v9fs.o
  CC [M]  fs/cachefiles/key.o
  CC [M]  drivers/regulator/mt6359-regulator.o
  CC      drivers/mfd/intel-lpss-pci.o
  CC [M]  drivers/misc/genwqe/card_dev.o
  CC [M]  net/9p/trans_common.o
  CC      drivers/acpi/pci_link.o
  CC [M]  net/netfilter/nf_tables_core.o
  CC      kernel/bpf/ringbuf.o
  CC [M]  fs/overlayfs/copy_up.o
  CC      drivers/mfd/intel-lpss-acpi.o
  CC [M]  drivers/misc/vmw_vmci/vmci_resource.o
  CC      net/ipv6/ip6_offload.o
  CC [M]  net/dccp/proto.o
  CC      drivers/base/auxiliary_sysfs.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_crypto.o
  CC [M]  drivers/misc/vmw_vmci/vmci_route.o
  CC      mm/memtest.o
  CC [M]  drivers/misc/mei/mei-trace.o
  CC      kernel/bpf/bpf_local_storage.o
  CC [M]  drivers/misc/echo/echo.o
  CC [M]  fs/cachefiles/main.o
  CC [M]  drivers/tty/mxser.o
  CC [M]  crypto/ecdsa-x962.o
  LD [M]  drivers/misc/vmw_vmci/vmw_vmci.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_dev.o
  CC [M]  fs/smb/client/link.o
  CC [M]  fs/cachefiles/namei.o
  CC [M]  fs/nfs/pagelist.o
  CC      lib/percpu-refcount.o
  CC [M]  fs/vboxsf/super.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_msg.o
  CC [M]  fs/9p/fid.o
  CC      drivers/mfd/palmas.o
  AS      arch/x86/kernel/ftrace_64.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_sg.o
  CC      mm/migrate.o
  CC [M]  drivers/regulator/mt6360-regulator.o
  CC      drivers/mfd/rc5t583.o
  CC [M]  net/sctp/chunk.o
  CC [M]  fs/fuse/control.o
  CC [M]  fs/nfs/read.o
  CC      arch/x86/kernel/trace_clock.o
  CC      drivers/acpi/pci_irq.o
  CC      drivers/scsi/hosts.o
  CC [M]  net/9p/trans_fd.o
  CC      fs/btrfs/scrub.o
  CC [M]  drivers/misc/genwqe/card_ddcb.o
  LD [M]  crypto/aegis128.o
  CC [M]  crypto/ecrdsa.o
  CC      drivers/base/hypervisor.o
  CC      kernel/trace/trace_events.o
  CC      drivers/mfd/rc5t583-irq.o
  CC      net/ipv6/tcpv6_offload.o
  CC      arch/x86/kernel/trace.o
  CC [M]  net/rds/recv.o
  CC [M]  drivers/tty/nozomi.o
  CC      fs/btrfs/backref.o
  CC [M]  fs/overlayfs/export.o
  CC [M]  drivers/misc/uacce/uacce.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.o
  CC [M]  fs/9p/xattr.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_tty.o
  LD [M]  fs/vboxsf/vboxsf.o
  CC      kernel/trace/trace_export.o
  CC [M]  sound/soc/soc-ops.o
  CC      net/ipv6/exthdrs_offload.o
  CC      drivers/mfd/syscon.o
  CC [M]  fs/fuse/xattr.o
  CC [M]  drivers/regulator/mt6370-regulator.o
  CC      drivers/mfd/as3711.o
  CC [M]  net/bridge/br_forward.o
  CC      drivers/mfd/intel_soc_pmic_crc.o
  CC      kernel/bpf/bpf_task_storage.o
  CC      drivers/acpi/acpi_apd.o
  CC [M]  net/netfilter/nf_tables_api.o
  CC      lib/rhashtable.o
  LD [M]  crypto/crypto_simd.o
  CC      crypto/rsapubkey.asn1.o
  CC [M]  sound/soc/soc-link.o
  CC [M]  drivers/misc/mei/pci-me.o
  CC      drivers/mfd/intel_soc_pmic_chtwc.o
  CC [M]  net/vmw_vsock/af_vsock.o
  CC      crypto/rsaprivkey.asn1.o
  CC      arch/x86/kernel/rethook.o
  CC      kernel/capability.o
  LD [M]  crypto/ecdsa_generic.o
  LD [M]  crypto/ecrdsa_generic.o
  AR      crypto/built-in.a
  CC [M]  drivers/tty/ttynull.o
  CC      net/ipv4/inet_fragment.o
  CC [M]  net/sctp/sm_make_chunk.o
  CC      drivers/acpi/acpi_platform.o
  CC [M]  fs/fuse/acl.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_keys.o
  CC [M]  drivers/misc/genwqe/card_sysfs.o
  CC      drivers/base/soc.o
  CC [M]  sound/soc/soc-card.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.o
  CC      net/devres.o
  CC [M]  fs/cachefiles/security.o
  CC [M]  fs/overlayfs/params.o
  CC [M]  fs/9p/cache.o
  CC      drivers/scsi/scsi_ioctl.o
  CC [M]  net/9p/trans_xen.o
  LD [M]  drivers/misc/bcm-vk/bcm_vk.o
  CC [M]  net/dccp/timer.o
  CC [M]  drivers/regulator/mt6397-regulator.o
  CC      drivers/base/pinctrl.o
  CC [M]  fs/overlayfs/xattrs.o
  CC [M]  drivers/misc/mei/hw-me.o
  CC [M]  net/dccp/qpolicy.o
  CC      kernel/ptrace.o
  CC [M]  net/bridge/br_if.o
  CC [M]  net/bridge/br_input.o
  CC      kernel/bpf/bpf_inode_storage.o
  CC      arch/x86/kernel/vmcore_info_64.o
  CC      net/ipv6/inet6_hashtables.o
  CC      lib/base64.o
  CC [M]  drivers/tty/rpmsg_tty.o
  CC [M]  fs/smb/client/misc.o
  CC [M]  drivers/mfd/88pm800.o
  CC [M]  fs/9p/acl.o
  CC      kernel/trace/trace_syscalls.o
  CC [M]  drivers/misc/genwqe/card_debugfs.o
  CC [M]  fs/fuse/readdir.o
  CC      drivers/base/devcoredump.o
  LD [M]  net/sunrpc/auth_gss/auth_rpcgss.o
  CC      net/ipv4/ping.o
  CC [M]  fs/nfs/symlink.o
  CC      drivers/scsi/scsicam.o
  CC      mm/memory-tiers.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.o
  CC [M]  drivers/misc/genwqe/card_utils.o
  CC      drivers/misc/sram.o
  CC [M]  fs/cachefiles/volume.o
  CC      mm/migrate_device.o
  CC [M]  drivers/regulator/qcom-labibb-regulator.o
  CC      drivers/scsi/scsi_error.o
  CC [M]  fs/fuse/ioctl.o
  CC      arch/x86/kernel/machine_kexec_64.o
  CC [M]  sound/soc/soc-compress.o
  CC      kernel/user.o
  CC [M]  net/rds/send.o
  CC [M]  net/9p/trans_virtio.o
  AR      drivers/tty/built-in.a
  CC      drivers/acpi/acpi_pnp.o
  CC [M]  fs/nfs/unlink.o
  LD [M]  fs/overlayfs/overlay.o
  CC [M]  fs/nfs/write.o
  CC [M]  fs/nfs/namespace.o
  LD [M]  fs/9p/9p.o
  CC [M]  drivers/mfd/88pm80x.o
  CC [M]  net/sunrpc/xprt.o
  CC      kernel/trace/trace_event_perf.o
  CC      fs/btrfs/ulist.o
  CC [M]  net/dccp/ccids/ccid2.o
  LD [M]  net/9p/9pnet.o
  CC      mm/huge_memory.o
  CC      lib/once.o
  CC [M]  fs/nfs/mount_clnt.o
  CC      kernel/bpf/disasm.o
  CC      drivers/scsi/scsi_lib.o
  CC [M]  fs/smb/client/netmisc.o
  AS      arch/x86/kernel/relocate_kernel_64.o
  CC      drivers/base/platform-msi.o
  CC      kernel/bpf/mprog.o
  CC [M]  fs/smb/client/smbencrypt.o
  CC      kernel/bpf/trampoline.o
  LD [M]  net/sunrpc/auth_gss/rpcsec_gss_krb5.o
  CC      fs/super.o
  CC [M]  fs/cachefiles/xattr.o
  CC [M]  drivers/regulator/qcom_spmi-regulator.o
  CC [M]  net/rds/stats.o
  CC [M]  net/sctp/ulpevent.o
  CC [M]  drivers/misc/ad525x_dpot.o
  CC      fs/btrfs/qgroup.o
  CC [M]  sound/soc/soc-generic-dmaengine-pcm.o
  LD [M]  drivers/misc/genwqe/genwqe_card.o
  CC [M]  net/dccp/ackvec.o
  CC      kernel/trace/trace_events_filter.o
  CC      arch/x86/kernel/kexec-bzimage64.o
  CC      drivers/base/physical_location.o
  CC [M]  net/sunrpc/socklib.o
  CC [M]  net/vmw_vsock/af_vsock_tap.o
  CC      net/ipv4/ip_tunnel_core.o
  CC      drivers/acpi/power.o
  CC [M]  fs/fuse/iomode.o
  CC [M]  drivers/misc/mei/gsc-me.o
  CC      kernel/trace/trace_events_trigger.o
  CC      net/ipv4/gre_offload.o
  CC      arch/x86/kernel/crash_dump_64.o
  CC      net/ipv4/metrics.o
  CC [M]  drivers/misc/mei/pci-txe.o
  CC [M]  net/rds/sysctl.o
  CC      lib/refcount.o
  LD [M]  net/9p/9pnet_fd.o
  LD [M]  net/9p/9pnet_xen.o
  LD [M]  net/9p/9pnet_virtio.o
  CC      drivers/base/trace.o
  CC [M]  net/bridge/br_ioctl.o
  CC      kernel/trace/trace_eprobe.o
  CC [M]  drivers/misc/ad525x_dpot-i2c.o
  CC [M]  drivers/mfd/88pm805.o
  CC      net/ipv6/mcast_snoop.o
  CC [M]  net/netfilter/nft_chain_filter.o
  CC      kernel/bpf/btf.o
  CC [M]  fs/cachefiles/error_inject.o
  CC      drivers/scsi/constants.o
  CC [M]  drivers/regulator/qcom_usb_vbus-regulator.o
  CC [M]  net/sunrpc/xprtsock.o
  CC [M]  fs/smb/client/transport.o
  CC [M]  net/dccp/sysctl.o
  CC [M]  net/sctp/inqueue.o
  CC      fs/char_dev.o
  CC [M]  fs/fuse/dax.o
  CC      lib/rcuref.o
  CC [M]  net/sctp/outqueue.o
  CC [M]  net/sctp/ulpqueue.o
  CC      arch/x86/kernel/crash.o
  CC [M]  net/dccp/ipv4.o
  CC [M]  net/rds/threads.o
  CC [M]  sound/soc/soc-ac97.o
  CC [M]  drivers/mfd/sm501.o
  CC [M]  drivers/misc/mei/hw-txe.o
  CC      drivers/acpi/event.o
  CC [M]  net/bridge/br_stp.o
  CC      net/ipv6/tcp_ao.o
  CC      drivers/acpi/evged.o
  AR      drivers/base/built-in.a
  CC [M]  drivers/regulator/palmas-regulator.o
  CC      lib/usercopy.o
  CC      kernel/bpf/memalloc.o
  CC      kernel/signal.o
  CC      drivers/acpi/sysfs.o
  CC [M]  drivers/misc/ad525x_dpot-spi.o
  CC [M]  net/sctp/tsnmap.o
  CC      fs/stat.o
  CC [M]  net/sctp/bind_addr.o
  LD [M]  fs/cachefiles/cachefiles.o
  CC [M]  net/vmw_vsock/vsock_addr.o
  CC      lib/errseq.o
  CC      lib/bucket_locks.o
  CC      kernel/sys.o
  CC      drivers/acpi/property.o
  CC      arch/x86/kernel/module.o
  CC      lib/generic-radix-tree.o
  CC [M]  drivers/misc/dummy-irq.o
  CC [M]  drivers/regulator/pca9450-regulator.o
  CC [M]  net/sctp/socket.o
  CC [M]  drivers/regulator/pv88060-regulator.o
  CC      drivers/scsi/scsi_lib_dma.o
  CC [M]  net/netfilter/nf_tables_trace.o
  CC      kernel/bpf/rqspinlock.o
  CC      net/ipv4/netlink.o
  LD [M]  sound/soc/snd-soc-acpi.o
  CC [M]  net/sunrpc/sched.o
  CC [M]  drivers/misc/mei/vsc-tp.o
  CC [M]  fs/smb/client/cached_dir.o
  CC [M]  fs/nfs/nfstrace.o
  CC      fs/btrfs/send.o
  CC      kernel/trace/trace_events_inject.o
  CC      arch/x86/kernel/kgdb.o
  CC [M]  net/rds/transport.o
  CC [M]  drivers/mfd/bcm590xx.o
  LD [M]  sound/soc/snd-soc-core.o
  CC      kernel/bpf/arena.o
  CC [M]  net/ipv6/ah6.o
  CC      drivers/scsi/scsi_scan.o
  CC      drivers/acpi/debugfs.o
  CC [M]  drivers/misc/ics932s401.o
  CC [M]  fs/fuse/passthrough.o
  CC      lib/bitmap-str.o
  GEN     drivers/scsi/scsi_devinfo_tbl.c
  CC [M]  net/rds/loop.o
  CC      kernel/bpf/range_tree.o
  CC      kernel/trace/trace_events_synth.o
  CC [M]  net/rds/page.o
  CC      kernel/trace/trace_events_hist.o
  CC [M]  net/rds/rdma.o
  CC      kernel/trace/trace_events_user.o
  CC      fs/exec.o
  CC      net/socket.o
  CC [M]  net/vmw_vsock/vsock_bpf.o
  CC      net/compat.o
  CC [M]  drivers/regulator/pv88080-regulator.o
  CC [M]  drivers/misc/mei/vsc-fw-loader.o
  CC      drivers/acpi/acpi_lpat.o
  CC [M]  drivers/mfd/bd9571mwv.o
  CC      drivers/acpi/acpi_fpdt.o
  CC [M]  net/bridge/br_stp_bpdu.o
  CC      lib/string_helpers.o
  CC [M]  net/sctp/primitive.o
  CC      kernel/trace/bpf_trace.o
  CC [M]  net/dccp/ipv6.o
  CC      arch/x86/kernel/early_printk.o
  CC      mm/khugepaged.o
  CC [M]  fs/fuse/sysctl.o
  CC [M]  net/ipv6/esp6.o
  CC [M]  drivers/mfd/cros_ec_dev.o
  CC      fs/btrfs/dev-replace.o
  CC [M]  net/sunrpc/auth.o
  CC      net/sysctl_net.o
  CC [M]  drivers/regulator/pv88090-regulator.o
  CC      kernel/umh.o
  CC      lib/hexdump.o
  CC      kernel/trace/trace_kprobe.o
  CC      fs/pipe.o
  CC [M]  drivers/misc/tifm_core.o
  CC [M]  drivers/regulator/pwm-regulator.o
  CC [M]  fs/fuse/dev_uring.o
  CC      net/ipv4/nexthop.o
  CC [M]  net/netfilter/nft_immediate.o
  CC [M]  fs/nfs/export.o
  CC [M]  net/sunrpc/auth_null.o
  CC [M]  fs/smb/client/cifs_unicode.o
  CC [M]  net/sctp/output.o
  CC [M]  drivers/misc/tifm_7xx1.o
  CC      drivers/acpi/acpi_lpit.o
  CC [M]  net/sunrpc/auth_tls.o
  CC [M]  drivers/mfd/cs42l43.o
  CC      drivers/scsi/scsi_devinfo.o
  CC      arch/x86/kernel/hpet.o
  CC [M]  drivers/misc/mei/platform-vsc.o
  CC [M]  net/vmw_vsock/diag.o
  CC [M]  drivers/mfd/cs42l43-i2c.o
  CC [M]  drivers/regulator/tps51632-regulator.o
  CC [M]  net/sctp/input.o
  CC [M]  net/bridge/br_stp_if.o
  CC [M]  net/sunrpc/auth_unix.o
  CC [M]  fs/smb/client/nterr.o
  CC [M]  fs/nfs/sysfs.o
  CC      lib/kstrtox.o
  LD [M]  drivers/misc/mei/mei.o
  CC [M]  net/bridge/br_stp_timer.o
  CC [M]  net/rds/tcp.o
  CC      lib/debug_info.o
  CC [M]  fs/smb/client/cifsencrypt.o
  CC [M]  net/sctp/debug.o
  CC [M]  net/rds/tcp_connect.o
  CC      fs/namei.o
  LD [M]  drivers/misc/mei/mei-me.o
  LD [M]  drivers/misc/mei/mei-gsc.o
  LD [M]  drivers/misc/mei/mei-txe.o
  CC [M]  drivers/mfd/lp873x.o
  LD [M]  drivers/misc/mei/mei-vsc-hw.o
  LD [M]  drivers/misc/mei/mei-vsc.o
  CC [M]  fs/fuse/cuse.o
  CC [M]  drivers/misc/phantom.o
  CC      fs/fcntl.o
  CC      lib/iomap.o
  CC      net/ipv4/udp_tunnel_stub.o
  CC [M]  drivers/regulator/pcap-regulator.o
  CC [M]  net/bridge/br_netlink.o
  CC      drivers/scsi/scsi_netlink.o
  CC      kernel/bpf/dispatcher.o
  CC [M]  net/ipv6/esp6_offload.o
  CC      drivers/acpi/acpi_watchdog.o
  CC      lib/iomap_copy.o
  CC [M]  net/dccp/diag.o
  CC [M]  net/netfilter/nft_cmp.o
  CC      arch/x86/kernel/amd_nb.o
  CC [M]  net/vmw_vsock/vmci_transport.o
  CC      kernel/workqueue.o
  CC      kernel/trace/error_report-traces.o
  CC      kernel/pid.o
  CC      fs/btrfs/raid56.o
  CC      kernel/bpf/devmap.o
  CC      mm/page_counter.o
  CC      mm/memcontrol.o
  CC      drivers/acpi/prmt.o
  CC      fs/btrfs/uuid-tree.o
  CC      kernel/task_work.o
  CC [M]  drivers/mfd/tqmx86.o
  CC [M]  drivers/misc/bh1770glc.o
  CC [M]  fs/fuse/virtio_fs.o
  CC [M]  fs/smb/client/readdir.o
  CC [M]  drivers/regulator/raa215300.o
  CC [M]  net/netfilter/nft_range.o
  CC      drivers/scsi/scsi_sysctl.o
  CC [M]  net/rds/tcp_listen.o
  CC      kernel/trace/power-traces.o
  CC      kernel/bpf/cpumap.o
  CC      fs/ioctl.o
  CC      kernel/trace/rpm-traces.o
  CC      drivers/scsi/scsi_proc.o
  CC      lib/devres.o
  CC [M]  drivers/regulator/rc5t583-regulator.o
  CC [M]  net/netfilter/nft_bitwise.o
  LD [M]  net/dccp/dccp.o
  CC      drivers/scsi/scsi_debugfs.o
  CC [M]  net/bridge/br_netlink_tunnel.o
  CC [M]  drivers/misc/apds990x.o
  CC      kernel/bpf/offload.o
  CC      net/ipv4/sysctl_net_ipv4.o
  LD [M]  net/dccp/dccp_ipv4.o
  CC      drivers/scsi/scsi_trace.o
  LD [M]  fs/fuse/fuse.o
  LD [M]  net/dccp/dccp_ipv6.o
  LD [M]  net/dccp/dccp_diag.o
  CC [M]  drivers/misc/enclosure.o
  CC [M]  net/rds/tcp_recv.o
  CC [M]  net/ipv6/ipcomp6.o
  CC [M]  drivers/misc/smpro-errmon.o
  CC      arch/x86/kernel/amd_node.o
  CC [M]  net/vmw_vsock/vmci_transport_notify.o
  CC [M]  drivers/mfd/arizona-core.o
  CC [M]  net/bridge/br_arp_nd_proxy.o
  CC [M]  drivers/regulator/rt4801-regulator.o
  CC      kernel/bpf/net_namespace.o
  CC [M]  net/sctp/stream.o
  CC [M]  net/sunrpc/svc.o
  CC      lib/check_signature.o
  CC [M]  net/netfilter/nft_byteorder.o
  CC [M]  net/bridge/br_sysfs_if.o
  CC [M]  net/rds/tcp_send.o
  CC [M]  net/bridge/br_sysfs_br.o
  CC      drivers/acpi/acpi_pcc.o
  CC      lib/interval_tree.o
  CC [M]  fs/smb/client/ioctl.o
  CC [M]  net/bridge/br_nf_core.o
  CC      kernel/bpf/tcx.o
  CC      fs/btrfs/props.o
  CC [M]  fs/nfs/fs_context.o
  CC [M]  drivers/mfd/arizona-irq.o
  CC [M]  fs/smb/client/sess.o
  CC [M]  drivers/misc/smpro-misc.o
  CC      net/ipv4/proc.o
  CC [M]  drivers/regulator/rt4803.o
  CC [M]  net/netfilter/nft_payload.o
  LD [M]  fs/fuse/virtiofs.o
  CC [M]  net/ipv6/xfrm6_tunnel.o
  CC      lib/assoc_array.o
  CC [M]  drivers/mfd/wm5102-tables.o
  CC      kernel/trace/trace_kdb.o
  CC [M]  drivers/mfd/wm5110-tables.o
  CC      drivers/scsi/scsi_logging.o
  CC [M]  drivers/misc/hpilo.o
  CC [M]  net/rds/tcp_stats.o
  CC [M]  net/netfilter/nft_lookup.o
  CC [M]  net/sctp/auth.o
  CC      net/ipv4/fib_rules.o
  CC      drivers/acpi/acpi_ffh.o
  CC      fs/readdir.o
  CC [M]  net/vmw_vsock/vmci_transport_notify_qstate.o
  CC      fs/btrfs/free-space-tree.o
  CC      mm/vmpressure.o
  CC      arch/x86/kernel/kvm.o
  CC      drivers/scsi/scsi_pm.o
  CC [M]  drivers/misc/apds9802als.o
  CC [M]  drivers/regulator/rt4831-regulator.o
  CC      kernel/bpf/stackmap.o
  CC      kernel/extable.o
  CC      fs/btrfs/tree-checker.o
  CC [M]  drivers/misc/isl29003.o
  CC [M]  fs/smb/client/export.o
  CC [M]  net/ipv6/tunnel6.o
  CC [M]  net/sctp/offload.o
  CC      net/ipv4/ipmr.o
  CC      arch/x86/kernel/kvmclock.o
  CC      kernel/trace/trace_dynevent.o
  CC [M]  fs/smb/client/unc.o
  CC      drivers/acpi/acpi_adxl.o
  CC [M]  net/ipv6/mip6.o
  CC [M]  fs/nfs/sysctl.o
  CC [M]  net/bridge/br_multicast.o
  CC [M]  drivers/misc/isl29020.o
  CC      lib/list_debug.o
  CC [M]  fs/smb/client/winucase.o
  CC [M]  drivers/regulator/rt5033-regulator.o
  CC [M]  net/netfilter/nft_dynset.o
  CC      arch/x86/kernel/paravirt.o
  CC      fs/select.o
  CC [M]  net/sctp/stream_sched.o
  CC      fs/btrfs/space-info.o
  CC [M]  net/vmw_vsock/virtio_transport.o
  LD [M]  net/rds/rds.o
  CC      net/ipv4/ipmr_base.o
  CC      lib/debugobjects.o
  CC [M]  net/bridge/br_mdb.o
  CC      drivers/scsi/scsi_dh.o
  CC [M]  net/ipv6/ip6_vti.o
  CC [M]  fs/nfs/fscache.o
  LD [M]  net/rds/rds_tcp.o
  CC [M]  net/bridge/br_multicast_eht.o
  CC      kernel/params.o
  CC [M]  drivers/mfd/wm8997-tables.o
  CC [M]  drivers/regulator/rt5120-regulator.o
  CC [M]  net/sunrpc/svcsock.o
  CC [M]  net/sctp/stream_sched_prio.o
  CC [M]  net/sunrpc/svcauth.o
  CC [M]  drivers/mfd/wm8998-tables.o
  CC      mm/swap_cgroup.o
  CC      drivers/acpi/ac.o
  CC [M]  drivers/misc/tsl2550.o
  CC      lib/bitrev.o
  CC      kernel/bpf/cgroup_iter.o
  CC [M]  net/bridge/br_vlan.o
  CC      drivers/acpi/button.o
  CC      arch/x86/kernel/paravirt-spinlocks.o
  CC [M]  net/netfilter/nft_meta.o
  CC      lib/linear_ranges.o
  CC [M]  net/ipv6/sit.o
  CC      kernel/bpf/bpf_cgrp_storage.o
  CC [M]  net/netfilter/nft_rt.o
  CC [M]  net/ipv6/ip6_tunnel.o
  CC [M]  net/bridge/br_vlan_tunnel.o
  CC [M]  fs/smb/client/smb2ops.o
  CC      kernel/bpf/cgroup.o
  CC [M]  drivers/regulator/rt5190a-regulator.o
  CC      drivers/acpi/fan_core.o
  CC      kernel/trace/trace_probe.o
  CC [M]  fs/nfs/nfs2super.o
  CC [M]  net/vmw_vsock/virtio_transport_common.o
  CC [M]  drivers/misc/ds1682.o
  CC      net/ipv4/syncookies.o
  CC      kernel/trace/trace_uprobe.o
  CC [M]  net/bridge/br_vlan_options.o
  CC [M]  net/sctp/stream_sched_rr.o
  CC      fs/dcache.o
  CC      fs/btrfs/block-rsv.o
  CC      arch/x86/kernel/pvclock.o
  CC      drivers/scsi/scsi_bsg.o
  CC [M]  net/bridge/br_mst.o
  CC      mm/hugetlb_cgroup.o
  CC [M]  net/netfilter/nft_exthdr.o
  CC      drivers/scsi/scsi_common.o
  CC [M]  net/bridge/br_switchdev.o
  CC      fs/btrfs/delalloc-space.o
  CC [M]  net/sctp/stream_sched_fc.o
  CC [M]  net/netfilter/nft_last.o
  CC      kernel/trace/trace_boot.o
  CC [M]  net/sunrpc/svcauth_unix.o
  CC [M]  drivers/mfd/cs47l24-tables.o
  CC [M]  net/sunrpc/addr.o
  CC      lib/packing.o
  CC      kernel/kthread.o
  CC      drivers/acpi/fan_attr.o
  CC [M]  drivers/misc/hmc6352.o
  CC [M]  drivers/regulator/rt5739.o
  CC [M]  fs/nfs/proc.o
  CC      kernel/trace/fprobe.o
  CC      drivers/acpi/fan_hwmon.o
  CC [M]  net/ipv6/ip6_gre.o
  CC [M]  fs/nfs/nfs2xdr.o
  CC      kernel/sys_ni.o
  CC      net/ipv4/netfilter.o
  CC [M]  fs/smb/client/smb2maperror.o
  CC [M]  fs/smb/client/smb2transport.o
  CC [M]  net/sunrpc/rpcb_clnt.o
  CC      arch/x86/kernel/pmem.o
  CC [M]  drivers/mfd/arizona-i2c.o
  CC      kernel/trace/rethook.o
  CC      kernel/bpf/reuseport_array.o
  CC [M]  net/sunrpc/timer.o
  CC      drivers/scsi/virtio_scsi.o
  CC [M]  drivers/mfd/arizona-spi.o
  CC      mm/memory-failure.o
  CC [M]  net/bridge/br_mrp_switchdev.o
  CC [M]  net/vmw_vsock/hyperv_transport.o
  CC      drivers/acpi/pci_slot.o
  CC      fs/btrfs/block-group.o
  CC [M]  drivers/regulator/rt5759-regulator.o
  CC [M]  net/vmw_vsock/vsock_loopback.o
  CC [M]  net/sctp/stream_interleave.o
  CC [M]  drivers/misc/vmw_balloon.o
  CC      kernel/bpf/bpf_struct_ops.o
  CC [M]  fs/smb/client/smb2misc.o
  CC      kernel/bpf/cpumask.o
  CC      lib/crc-ccitt.o
  CC      mm/kmemleak.o
  CC      kernel/nsproxy.o
  CC [M]  net/netfilter/nft_counter.o
  CC      mm/page_isolation.o
  CC [M]  fs/smb/client/smb2pdu.o
  CC      arch/x86/kernel/jailhouse.o
  CC [M]  net/sctp/proc.o
  CC [M]  drivers/regulator/rt6160-regulator.o
  CC      fs/inode.o
  CC [M]  net/bridge/br_mrp.o
  CC      drivers/scsi/sd.o
  CC [M]  net/bridge/br_mrp_netlink.o
  CC      fs/attr.o
  CC      kernel/bpf/bpf_lsm.o
  CC [M]  drivers/mfd/wcd934x.o
  CC      arch/x86/kernel/pcspeaker.o
  CC      drivers/acpi/processor_driver.o
  CC [M]  fs/nfs/nfs3super.o
  CC [M]  net/sunrpc/xdr.o
  CC [M]  fs/nfs/nfs3client.o
  CC      kernel/trace/trace_fprobe.o
  CC [M]  net/netfilter/nft_objref.o
  CC      kernel/bpf/crypto.o
  CC      kernel/notifier.o
  CC      drivers/acpi/processor_thermal.o
  CC      arch/x86/kernel/check.o
  CC      arch/x86/kernel/uprobes.o
  CC [M]  net/netfilter/nft_inner.o
  CC [M]  fs/smb/client/smb2inode.o
  CC      net/ipv4/tcp_cubic.o
  LD [M]  net/vmw_vsock/vsock.o
  LD [M]  net/vmw_vsock/vsock_diag.o
  LD [M]  net/vmw_vsock/vmw_vsock_vmci_transport.o
  LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport.o
  CC      lib/crc16.o
  LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport_common.o
  LD [M]  net/vmw_vsock/hv_sock.o
  CC [M]  drivers/misc/lattice-ecp3-config.o
  CC      kernel/ksysfs.o
  CC [M]  net/ipv6/fou6.o
  CC [M]  net/netfilter/nft_chain_route.o
  CC [M]  fs/nfs/nfs3proc.o
  CC [M]  drivers/misc/dw-xdata-pcie.o
  CC [M]  net/netfilter/nf_tables_offload.o
  CC [M]  drivers/regulator/rt6190-regulator.o
  CC      mm/zpool.o
  CC [M]  net/bridge/br_cfm.o
  CC      drivers/acpi/processor_idle.o
  CC      drivers/acpi/processor_throttling.o
  CC [M]  net/bridge/br_cfm_netlink.o
  CC [M]  drivers/misc/xilinx_sdfec.o
  CC      arch/x86/kernel/perf_regs.o
  CC      drivers/acpi/processor_perflib.o
  CC      drivers/acpi/container.o
  CC [M]  drivers/mfd/wm8994-core.o
  CC      fs/btrfs/discard.o
  CC      kernel/bpf/relo_core.o
  CC [M]  net/sctp/sysctl.o
  CC [M]  fs/nfs/nfs3xdr.o
  CC      lib/crc-t10dif.o
  CC      mm/zsmalloc.o
  CC      net/ipv4/tcp_sigpool.o
  CC      fs/bad_inode.o
  CC [M]  drivers/regulator/rt6245-regulator.o
  CC [M]  net/sunrpc/sunrpc_syms.o
  CC      kernel/bpf/btf_iter.o
  CC      kernel/cred.o
  CC [M]  net/sunrpc/cache.o
  CC [M]  drivers/mfd/wm8994-irq.o
  CC [M]  drivers/regulator/rtmv20-regulator.o
  CC [M]  drivers/mfd/wm8994-regmap.o
  CC [M]  drivers/regulator/rtq2134-regulator.o
  CC [M]  net/bridge/br_netfilter_hooks.o
  CC [M]  net/netfilter/nft_set_hash.o
  CC      fs/file.o
  CC [M]  drivers/misc/tps6594-esm.o
  CC      arch/x86/kernel/tracepoint.o
  CC [M]  drivers/misc/tps6594-pfsm.o
  CC [M]  drivers/regulator/rtq6752-regulator.o
  CC [M]  net/ipv6/ip6_udp_tunnel.o
  CC      arch/x86/kernel/itmt.o
  CC [M]  drivers/misc/nsm.o
  CC      kernel/reboot.o
  CC      drivers/acpi/thermal_lib.o
  CC [M]  fs/nfs/nfs3acl.o
  CC      net/ipv4/tcp_bpf.o
  AR      kernel/trace/built-in.a
  CC [M]  net/sunrpc/rpc_pipe.o
  CC      mm/early_ioremap.o
  CC      fs/btrfs/reflink.o
  CC      lib/crc-itu-t.o
  CC [M]  fs/smb/client/smb2file.o
  CC      drivers/acpi/thermal.o
  CC [M]  net/sunrpc/sysfs.o
  CC      mm/numa.o
  CC [M]  drivers/mfd/madera-core.o
  CC      drivers/scsi/sd_dif.o
  CC [M]  net/netfilter/nft_set_bitmap.o
  CC      net/ipv4/udp_bpf.o
  CC      arch/x86/kernel/umip.o
  HOSTCC  lib/gen_crc32table
  CC [M]  net/netfilter/nft_set_rbtree.o
  CC [M]  net/sunrpc/svc_xprt.o
  CC [M]  net/bridge/br_netfilter_ipv6.o
  CC      arch/x86/kernel/unwind_frame.o
  CC [M]  net/sctp/ipv6.o
  CC [M]  net/sunrpc/xprtmultipath.o
  CC      kernel/bpf/btf_relocate.o
  CC      drivers/acpi/nhlt.o
  LD [M]  net/bridge/bridge.o
  CC      drivers/acpi/acpi_memhotplug.o
  CC      drivers/acpi/ioapic.o
  HOSTCC  lib/gen_crc64table
  CC      kernel/async.o
  CC      net/ipv4/cipso_ipv4.o
  CC      drivers/acpi/battery.o
  CC      drivers/acpi/hed.o
  CC [M]  drivers/regulator/rtq2208-regulator.o
  AR      drivers/misc/built-in.a
  CC      fs/filesystems.o
  CC      kernel/range.o
  CC      lib/xxhash.o
  CC [M]  fs/nfs/nfs4proc.o
  CC      kernel/bpf/kmem_cache_iter.o
  CC [M]  fs/smb/client/cifsacl.o
  CC      drivers/scsi/sd_zbc.o
  CC      fs/btrfs/subpage.o
  CC [M]  net/sctp/diag.o
  CC      fs/btrfs/tree-mod-log.o
  CC [M]  net/netfilter/nft_set_pipapo.o
  CC      net/ipv4/xfrm4_policy.o
  CC      arch/x86/kernel/callthunks.o
  CC      lib/genalloc.o
  CC      net/ipv4/xfrm4_state.o
  CC      mm/numa_memblks.o
  CC      drivers/scsi/sr.o
  CC      kernel/smpboot.o
  CC      fs/btrfs/extent-io-tree.o
  CC [M]  drivers/mfd/cs47l15-tables.o
  CC [M]  fs/nfs/nfs4xdr.o
  CC      lib/textsearch.o
  CC [M]  net/sunrpc/debugfs.o
  CC [M]  fs/nfs/nfs4state.o
  CC      net/ipv4/xfrm4_input.o
  CC [M]  drivers/regulator/sky81452-regulator.o
  CC [M]  net/sunrpc/backchannel_rqst.o
  CC [M]  fs/nfs/nfs4renewd.o
  CC [M]  net/sunrpc/stats.o
  CC      lib/percpu_counter.o
  CC [M]  fs/smb/client/fs_context.o
  CC      fs/namespace.o
  CC      drivers/scsi/sr_ioctl.o
  CC      arch/x86/kernel/cet.o
  CC [M]  net/netfilter/nft_set_pipapo_avx2.o
  CC [M]  drivers/mfd/cs47l35-tables.o
  CC      mm/balloon_compaction.o
  LD [M]  net/bridge/br_netfilter.o
  CC      kernel/ucount.o
  AR      kernel/bpf/built-in.a
  CC      drivers/scsi/sr_vendor.o
  AR      net/ipv6/built-in.a
  CC [M]  net/sunrpc/sysctl.o
  CC      drivers/acpi/bgrt.o
  CC      lib/iommu-helper.o
  CC [M]  drivers/regulator/slg51000-regulator.o
  CC [M]  fs/smb/client/dns_resolve.o
  CC [M]  fs/nfs/nfs4super.o
  CC [M]  fs/nfs/nfs4file.o
  CC [M]  fs/nfs/delegation.o
  CC [M]  drivers/regulator/sy7636a-regulator.o
  ASN.1   fs/smb/client/cifs_spnego_negtokeninit.asn1.[ch]
  CC      arch/x86/kernel/shstk.o
  CC      drivers/scsi/sg.o
  LD [M]  net/sctp/sctp.o
  CC      kernel/regset.o
  CC [M]  net/netfilter/nft_ct_fast.o
  CC      fs/seq_file.o
  CC [M]  drivers/scsi/raid_class.o
  CC      arch/x86/kernel/audit_64.o
  CC [M]  drivers/regulator/tps6105x-regulator.o
  LD [M]  net/sctp/sctp_diag.o
  CC      net/ipv4/xfrm4_output.o
  CC      lib/fault-inject.o
  CC      mm/secretmem.o
  CC [M]  drivers/mfd/cs47l85-tables.o
  CC      drivers/acpi/cppc_acpi.o
  CC [M]  net/netfilter/nft_compat.o
  CC      fs/xattr.o
  CC [M]  fs/nfs/nfs4idmap.o
  CC [M]  drivers/scsi/scsi_transport_spi.o
  CC      fs/btrfs/fs.o
  CC [M]  drivers/regulator/tps62360-regulator.o
  CC [M]  fs/smb/client/namespace.o
  CC      fs/btrfs/messages.o
  CC      drivers/acpi/spcr.o
  CC [M]  drivers/scsi/scsi_transport_fc.o
  CC      mm/userfaultfd.o
  CC      fs/libfs.o
  CC      kernel/ksyms_common.o
  CC [M]  drivers/regulator/tps65023-regulator.o
  CC [M]  drivers/scsi/scsi_transport_iscsi.o
  CC      lib/error-inject.o
  CC      net/ipv4/xfrm4_protocol.o
  CC      arch/x86/kernel/amd_gart_64.o
  CC [M]  drivers/regulator/tps6507x-regulator.o
  CC [M]  net/netfilter/nft_connlimit.o
  CC      drivers/acpi/acpi_dbg.o
  CC [M]  drivers/mfd/cs47l90-tables.o
  CC      mm/page_idle.o
  CC      fs/btrfs/bio.o
  CC [M]  fs/nfs/callback.o
  CC      kernel/groups.o
  CC [M]  drivers/regulator/tps65086-regulator.o
  CC [M]  fs/nfs/callback_xdr.o
  CC [M]  fs/nfs/callback_proc.o
  CC      mm/usercopy.o
  CC      fs/btrfs/lru_cache.o
  CC      kernel/vhost_task.o
  CC      arch/x86/kernel/aperture_64.o
  CC [M]  net/netfilter/nft_numgen.o
  CC [M]  fs/smb/client/reparse.o
  CC [M]  fs/nfs/nfs4namespace.o
  CC      mm/memremap.o
  CC      lib/syscall.o
  CC [M]  net/netfilter/nft_ct.o
  CC      fs/fs-writeback.o
  CC      fs/btrfs/raid-stripe-tree.o
  CC      mm/hmm.o
  CC [M]  drivers/regulator/tps65090-regulator.o
  CC      lib/dynamic_debug.o
  CC      arch/x86/kernel/mmconf-fam10h_64.o
  CC [M]  drivers/scsi/scsi_transport_sas.o
  LD [M]  net/sunrpc/sunrpc.o
  CC [M]  net/netfilter/nft_flow_offload.o
  CC [M]  drivers/scsi/scsi_transport_srp.o
  CC [M]  drivers/regulator/tps6524x-regulator.o
  CC [M]  drivers/scsi/iscsi_boot_sysfs.o
  CC      mm/memfd.o
  CC [M]  drivers/regulator/tps6586x-regulator.o
  CC      net/ipv4/tcp_ao.o
  CC      arch/x86/kernel/vsmp_64.o
  CC      fs/pnode.o
  CC      mm/ptdump.o
  CC [M]  drivers/mfd/cs47l92-tables.o
  CC      drivers/acpi/viot.o
  CC [M]  drivers/scsi/megaraid.o
  CC      kernel/kcmp.o
  CC [M]  arch/x86/kernel/msr.o
  CC      fs/btrfs/fiemap.o
  CC [M]  fs/smb/client/xattr.o
  CC [M]  drivers/scsi/vmw_pvscsi.o
  CC      fs/btrfs/direct-io.o
  CC [M]  fs/nfs/nfs4getroot.o
  CC [M]  drivers/regulator/tps65910-regulator.o
  CC [M]  fs/smb/client/cifs_spnego.o
  CC      lib/errname.o
  CC [M]  fs/smb/client/dfs_cache.o
  CC      net/ipv4/bpf_tcp_ca.o
  CC      kernel/freezer.o
  CC      fs/splice.o
  CC      fs/btrfs/acl.o
  CC [M]  drivers/acpi/acpi_ipmi.o
  CC [M]  drivers/mfd/madera-i2c.o
  CC      lib/nlattr.o
  CC      lib/cpu_rmap.o
  CC [M]  drivers/regulator/tps65912-regulator.o
  CC [M]  fs/nfs/nfs4client.o
  CC [M]  arch/x86/kernel/cpuid.o
  CC [M]  fs/smb/client/dfs.o
  CC [M]  drivers/scsi/xen-scsifront.o
  CC [M]  drivers/regulator/tps65132-regulator.o
  CC [M]  net/ipv4/ip_tunnel.o
  CC [M]  fs/smb/client/netlink.o
  CC      mm/page_reporting.o
  CC [M]  drivers/acpi/acpi_video.o
  CC [M]  drivers/regulator/tps68470-regulator.o
  CC      kernel/profile.o
  CC [M]  drivers/mfd/madera-spi.o
  CC      mm/bootmem_info.o
  CC      fs/btrfs/zoned.o
  CC [M]  fs/smb/client/cifs_swn.o
  CC [M]  net/ipv4/ipip.o
  CC [M]  fs/nfs/nfs4session.o
  CC [M]  drivers/mfd/cs40l50-core.o
  CC [M]  net/netfilter/nft_limit.o
  CC [M]  drivers/acpi/video_detect.o
  CC      fs/sync.o
  CC      lib/closure.o
  AR      arch/x86/kernel/built-in.a
  AR      arch/x86/built-in.a
  CC [M]  fs/smb/client/fscache.o
  CC [M]  drivers/mfd/cs40l50-i2c.o
  CC      fs/btrfs/verity.o
  CC [M]  fs/nfs/dns_resolve.o
  CC [M]  drivers/regulator/twl-regulator.o
  CC [M]  net/netfilter/nft_nat.o
  CC [M]  fs/nfs/nfs4trace.o
  CC [M]  drivers/acpi/acpi_tad.o
  CC [M]  fs/nfs/nfs4sysctl.o
  CC [M]  net/netfilter/nft_queue.o
  CC [M]  drivers/mfd/cs40l50-spi.o
  CC [M]  drivers/regulator/twl6030-regulator.o
  CC      lib/dynamic_queue_limits.o
  CC [M]  net/netfilter/nft_quota.o
  CC [M]  drivers/scsi/storvsc_drv.o
  CC [M]  drivers/acpi/platform_profile.o
  CC      kernel/stacktrace.o
  CC [M]  net/netfilter/nft_reject.o
  CC [M]  fs/smb/client/smb1ops.o
  CC [M]  fs/smb/client/cifssmb.o
  CC      mm/execmem.o
  CC [M]  fs/nfs/pnfs.o
  CC [M]  net/ipv4/fou_core.o
  CC      kernel/dma.o
  CC [M]  drivers/scsi/ses.o
  CC [M]  drivers/scsi/scsi_debug.o
  CC      fs/utimes.o
  CC [M]  net/ipv4/fou_nl.o
  CC      lib/glob.o
  CC      kernel/smp.o
  CC [M]  drivers/regulator/wm831x-dcdc.o
  CC      fs/d_path.o
  CC      kernel/uid16.o
  CC      fs/stack.o
  CC      fs/fs_struct.o
  CC [M]  fs/nfs/pnfs_dev.o
  CC [M]  drivers/mfd/tps6105x.o
  CC      fs/statfs.o
  CC      fs/fs_pin.o
  CC      lib/digsig.o
  CC [M]  drivers/acpi/sbshc.o
  CC      fs/nsfs.o
  CC [M]  fs/nfs/pnfs_nfs.o
  CC [M]  drivers/regulator/wm831x-isink.o
  CC      lib/strncpy_from_user.o
  CC [M]  net/netfilter/nft_reject_inet.o
  CC      fs/fs_types.o
  CC [M]  net/netfilter/nft_reject_netdev.o
  CC      lib/strnlen_user.o
  CC [M]  drivers/regulator/wm831x-ldo.o
  CC      mm/shmem_quota.o
  CC      kernel/module_signature.o
  CC [M]  drivers/mfd/tps65010.o
  CC [M]  drivers/regulator/wm8350-regulator.o
  CC      lib/net_utils.o
  CC      fs/fs_context.o
  CC      mm/pt_reclaim.o
  CC [M]  mm/hwpoison-inject.o
  CC [M]  fs/nfs/nfs42proc.o
  CC [M]  drivers/mfd/tps6507x.o
  CC      kernel/kallsyms.o
  CC [M]  fs/smb/client/cifs_spnego_negtokeninit.asn1.o
  CC [M]  drivers/regulator/wm8400-regulator.o
  CC [M]  fs/smb/client/asn1.o
  CC [M]  fs/nfs/nfs42xattr.o
  CC [M]  drivers/mfd/tps65086.o
  CC      kernel/acct.o
  CC [M]  net/netfilter/nft_tunnel.o
  CC [M]  net/ipv4/fou_bpf.o
  CC [M]  drivers/acpi/sbs.o
  AR      fs/btrfs/built-in.a
  CC [M]  drivers/regulator/wm8994-regulator.o
  CC [M]  net/netfilter/nft_log.o
  CC      lib/sg_pool.o
  CC      kernel/vmcore_info.o
  CC      fs/fs_parser.o
  CC [M]  net/netfilter/nft_masq.o
  CC [M]  drivers/mfd/tps6594-core.o
  CC [M]  net/netfilter/nft_redir.o
  CC [M]  drivers/acpi/ec_sys.o
  CC      lib/memregion.o
  CC [M]  drivers/acpi/pfr_update.o
  CC [M]  net/ipv4/gre_demux.o
  CC      fs/fsopen.o
  CC      lib/irq_poll.o
  LD [M]  fs/nfs/nfs.o
  CC      kernel/elfcorehdr.o
  CC [M]  net/netfilter/nft_hash.o
  CC      lib/stackdepot.o
  CC [M]  drivers/mfd/tps6594-i2c.o
  AR      mm/built-in.a
  CC [M]  drivers/acpi/pfr_telemetry.o
  CC      fs/init.o
  CC [M]  drivers/mfd/tps6594-spi.o
  CC [M]  drivers/acpi/acpi_pad.o
  CC      kernel/crash_reserve.o
  CC [M]  drivers/mfd/mc13xxx-core.o
  LD [M]  fs/nfs/nfsv2.o
  CC      kernel/kexec_core.o
  CC [M]  net/netfilter/nft_fib.o
  LD [M]  fs/nfs/nfsv3.o
  CC [M]  net/netfilter/nft_fib_inet.o
  CC      kernel/crash_core.o
  CC [M]  net/ipv4/ip_gre.o
  CC [M]  drivers/mfd/mc13xxx-spi.o
  CC      lib/ref_tracker.o
  CC [M]  drivers/acpi/acpi_extlog.o
  CC [M]  drivers/mfd/mc13xxx-i2c.o
  CC [M]  net/ipv4/udp_tunnel_core.o
  CC [M]  net/netfilter/nft_fib_netdev.o
  CC      fs/kernel_read_file.o
  CC      lib/bootconfig.o
  CC [M]  drivers/mfd/ocelot-core.o
  CC [M]  net/netfilter/nft_socket.o
  CC [M]  net/ipv4/udp_tunnel_nic.o
  CC      kernel/kexec.o
  CC      fs/mnt_idmapping.o
  CC [M]  drivers/acpi/acpi_configfs.o
  CC      kernel/kexec_file.o
  CC      fs/remap_range.o
  CC      lib/asn1_decoder.o
  CC [M]  net/netfilter/nft_osf.o
  CC [M]  net/ipv4/ip_vti.o
  CC      fs/pidfs.o
  CC [M]  drivers/mfd/ocelot-spi.o
  CC      kernel/compat.o
  CC [M]  drivers/mfd/axp20x.o
  CC      lib/asn1_encoder.o
  LD [M]  drivers/scsi/hv_storvsc.o
  CC [M]  net/ipv4/ah4.o
  CC      fs/buffer.o
  CC      drivers/scsi/scsi_sysfs.o
  CC [M]  drivers/mfd/axp20x-i2c.o
  GEN     lib/oid_registry_data.c
  CC [M]  net/ipv4/esp4.o
  CC [M]  drivers/mfd/lp3943.o
  CC [M]  net/ipv4/esp4_offload.o
  CC [M]  net/netfilter/nft_tproxy.o
  CC      kernel/utsname.o
  CC [M]  drivers/mfd/ti-lmu.o
  CC      kernel/user_namespace.o
  AR      drivers/regulator/built-in.a
  CC [M]  net/ipv4/ipcomp.o
  CC      fs/mpage.o
  CC [M]  net/ipv4/xfrm4_tunnel.o
  CC      kernel/pid_namespace.o
  CC      fs/proc_namespace.o
  CC      fs/direct-io.o
  CC [M]  drivers/mfd/da9062-core.o
  CC [M]  net/netfilter/nft_xfrm.o
  UPD     kernel/config_data
  CC [M]  net/netfilter/nft_synproxy.o
  CC      fs/eventpoll.o
  LD [M]  fs/smb/client/cifs.o
  CC [M]  net/ipv4/tunnel4.o
  CC      kernel/stop_machine.o
  LD [M]  drivers/acpi/video.o
  AR      drivers/acpi/built-in.a
  CC [M]  drivers/mfd/da9150-core.o
  CC [M]  net/ipv4/inet_diag.o
  CC [M]  drivers/mfd/max77541.o
  CC [M]  net/netfilter/nft_chain_nat.o
  CC      fs/anon_inodes.o
  CC [M]  drivers/mfd/max8907.o
  CC      fs/signalfd.o
  CC      lib/ucs2_string.o
  CC [M]  net/ipv4/tcp_diag.o
  CC      kernel/audit.o
  CC [M]  net/netfilter/nft_dup_netdev.o
  CC [M]  net/netfilter/nft_fwd_netdev.o
  CC [M]  drivers/mfd/mp2629.o
  CC      kernel/auditfilter.o
  CC [M]  net/netfilter/nf_flow_table_core.o
  CC      lib/ubsan.o
  CC [M]  net/netfilter/nf_flow_table_ip.o
  CC      kernel/auditsc.o
  CC      fs/timerfd.o
  CC      lib/sbitmap.o
  CC [M]  net/netfilter/nf_flow_table_offload.o
  CC [M]  net/netfilter/nf_flow_table_xdp.o
  CC [M]  net/ipv4/udp_diag.o
  CC [M]  drivers/mfd/mt6360-core.o
  CC [M]  net/netfilter/nf_flow_table_inet.o
  CC [M]  net/ipv4/raw_diag.o
  CC      lib/group_cpus.o
  CC      fs/eventfd.o
  CC [M]  drivers/mfd/mt6370.o
  CC [M]  net/netfilter/x_tables.o
  CC      fs/userfaultfd.o
  CC [M]  net/netfilter/xt_tcpudp.o
  CC      lib/fw_table.o
  CC      kernel/audit_watch.o
  CC      fs/aio.o
  CC      kernel/audit_fsnotify.o
  CC      fs/dax.o
  CC      fs/locks.o
  CC [M]  lib/crc7.o
  CC      kernel/audit_tree.o
  CC [M]  net/netfilter/xt_mark.o
  CC [M]  lib/crc8.o
  AR      drivers/scsi/built-in.a
  CC      fs/binfmt_script.o
  CC [M]  lib/bch.o
  CC [M]  net/netfilter/xt_connmark.o
  CC      kernel/kprobes.o
  CC [M]  net/netfilter/xt_nat.o
  CC      kernel/fail_function.o
  CC [M]  lib/ts_kmp.o
  CC [M]  drivers/mfd/mt6397-core.o
  CC [M]  lib/ts_bm.o
  CC      fs/binfmt_elf.o
  CC [M]  lib/ts_fsm.o
  CC      fs/compat_binfmt_elf.o
  CC      kernel/hung_task.o
  CC      fs/backing-file.o
  CC [M]  lib/notifier-error-inject.o
  CC      fs/mbcache.o
  CC      fs/posix_acl.o
  CC      fs/coredump.o
  CC      fs/drop_caches.o
  CC [M]  net/netfilter/xt_AUDIT.o
  CC [M]  drivers/mfd/mt6397-irq.o
  CC      kernel/watchdog.o
  CC [M]  net/netfilter/xt_CHECKSUM.o
  CC      fs/sysctls.o
  CC      kernel/watchdog_perf.o
  CC [M]  net/netfilter/xt_CLASSIFY.o
  CC      kernel/seccomp.o
  CC [M]  drivers/mfd/mt6358-irq.o
  CC      fs/fhandle.o
  CC      fs/bpf_fs_kfuncs.o
  CC      kernel/relay.o
  CC [M]  fs/binfmt_misc.o
  CC [M]  drivers/mfd/kempld-core.o
  CC [M]  lib/pm-notifier-error-inject.o
  CC      kernel/utsname_sysctl.o
  CC [M]  net/netfilter/xt_CONNSECMARK.o
  CC [M]  drivers/mfd/intel_quark_i2c_gpio.o
  CC [M]  drivers/mfd/lpc_sch.o
  CC      kernel/delayacct.o
  CC [M]  lib/memory-notifier-error-inject.o
  CC [M]  net/netfilter/xt_CT.o
  CC [M]  net/netfilter/xt_DSCP.o
  LD [M]  fs/nfs/nfsv4.o
  CC [M]  lib/lru_cache.o
  CC      kernel/taskstats.o
  CC [M]  net/netfilter/xt_HL.o
  CC [M]  drivers/mfd/lpc_ich.o
  CC [M]  drivers/mfd/rdc321x-southbridge.o
  CC      kernel/tsacct.o
  CC      kernel/tracepoint.o
  CC      kernel/latencytop.o
  CC [M]  drivers/mfd/janz-cmodio.o
  CC [M]  net/netfilter/xt_HMARK.o
  LD [M]  net/ipv4/fou.o
  LD [M]  net/ipv4/gre.o
  CC [M]  drivers/mfd/vx855.o
  LD [M]  net/ipv4/udp_tunnel.o
  AR      net/ipv4/built-in.a
  CC      kernel/irq_work.o
  CC [M]  drivers/mfd/wl1273-core.o
  CC [M]  net/netfilter/xt_LED.o
  CC      kernel/static_call.o
  CC [M]  net/netfilter/xt_LOG.o
  CC [M]  drivers/mfd/si476x-cmd.o
  CC      kernel/static_call_inline.o
  CC [M]  net/netfilter/xt_NETMAP.o
  CC [M]  drivers/mfd/si476x-prop.o
  CC      kernel/user-return-notifier.o
  CC [M]  net/netfilter/xt_NFLOG.o
  CC [M]  net/netfilter/xt_NFQUEUE.o
  CC [M]  drivers/mfd/si476x-i2c.o
  CC [M]  drivers/mfd/intel_pmc_bxt.o
  CC [M]  net/netfilter/xt_RATEEST.o
  CC [M]  net/netfilter/xt_REDIRECT.o
  CC      kernel/padata.o
  CC [M]  drivers/mfd/viperboard.o
  CC [M]  net/netfilter/xt_MASQUERADE.o
  CC      kernel/jump_label.o
  CC      kernel/context_tracking.o
  CC [M]  net/netfilter/xt_SECMARK.o
  CC [M]  drivers/mfd/lm3533-core.o
  CC [M]  net/netfilter/xt_TPROXY.o
  CC [M]  net/netfilter/xt_TCPMSS.o
  AR      lib/lib.a
  GEN     lib/crc32table.h
  CC [M]  drivers/mfd/lm3533-ctrlbank.o
  GEN     lib/crc64table.h
  CC      lib/oid_registry.o
  CC [M]  net/netfilter/xt_TCPOPTSTRIP.o
  CC [M]  drivers/mfd/retu-mfd.o
  CC      kernel/iomem.o
  CC [M]  net/netfilter/xt_TEE.o
  CC [M]  net/netfilter/xt_TRACE.o
  CC      lib/crc32.o
  CC      kernel/rseq.o
  CC      kernel/watch_queue.o
  CC [M]  net/netfilter/xt_IDLETIMER.o
  CHK     kernel/kheaders_data.tar.xz
  CC [M]  drivers/mfd/iqs62x.o
  CC      lib/crc64.o
  CC [M]  drivers/mfd/menf21bmc.o
  GEN     kernel/kheaders_data.tar.xz
  CC [M]  net/netfilter/xt_addrtype.o
  CC [M]  drivers/mfd/dln2.o
  CC [M]  drivers/mfd/rt4831.o
  CC [M]  drivers/mfd/rt5033.o
  CC [M]  net/netfilter/xt_bpf.o
  GZIP    kernel/config_data.gz
  CC [M]  net/netfilter/xt_cluster.o
  CC [M]  drivers/mfd/rt5120.o
  CC [M]  net/netfilter/xt_comment.o
  CC      kernel/configs.o
  CC [M]  drivers/mfd/sky81452.o
  CC [M]  net/netfilter/xt_connbytes.o
  CC [M]  drivers/mfd/intel_soc_pmic_bxtwc.o
  CC [M]  net/netfilter/xt_connlabel.o
  CC [M]  drivers/mfd/intel_soc_pmic_chtdc_ti.o
  AR      fs/built-in.a
  CC [M]  net/netfilter/xt_connlimit.o
  CC [M]  drivers/mfd/intel_soc_pmic_mrfld.o
  CC [M]  net/netfilter/xt_conntrack.o
  CC [M]  net/netfilter/xt_cpu.o
  CC [M]  drivers/mfd/rave-sp.o
  CC [M]  drivers/mfd/simple-mfd-i2c.o
  CC [M]  net/netfilter/xt_dccp.o
  CC [M]  drivers/mfd/smpro-core.o
  CC [M]  drivers/mfd/intel-m10-bmc-core.o
  CC [M]  net/netfilter/xt_devgroup.o
  CC [M]  net/netfilter/xt_dscp.o
  CC [M]  drivers/mfd/intel-m10-bmc-spi.o
  CC [M]  net/netfilter/xt_ecn.o
  CC [M]  drivers/mfd/atc260x-core.o
  CC [M]  drivers/mfd/atc260x-i2c.o
  CC [M]  net/netfilter/xt_esp.o
  CC [M]  net/netfilter/xt_hashlimit.o
  CC [M]  net/netfilter/xt_helper.o
  CC [M]  net/netfilter/xt_hl.o
  CC [M]  net/netfilter/xt_ipcomp.o
  CC [M]  net/netfilter/xt_iprange.o
  CC [M]  net/netfilter/xt_l2tp.o
  CC [M]  net/netfilter/xt_length.o
  AR      lib/built-in.a
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
  LD [M]  drivers/mfd/arizona.o
  LD [M]  drivers/mfd/wm8994.o
  LD [M]  drivers/mfd/madera.o
  LD [M]  drivers/mfd/ocelot-soc.o
  LD [M]  drivers/mfd/mt6397.o
  LD [M]  drivers/mfd/si476x-core.o
  AR      drivers/mfd/built-in.a
  AR      kernel/built-in.a
  LD [M]  net/netfilter/nf_conntrack.o
  LD [M]  net/netfilter/nf_conntrack_h323.o
  LD [M]  net/netfilter/nf_nat.o
  LD [M]  net/netfilter/nf_tables.o
  LD [M]  net/netfilter/nf_flow_table.o
  AR      net/netfilter/built-in.a
make[3]: *** [../scripts/Makefile.build:461: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
  AR      net/built-in.a
  CC [M]  kernel/kheaders.o
make[2]: *** [/kernel/Makefile:2003: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make[1]: Leaving directory '/kernel/build64-debug'
make: *** [Makefile:248: __sub-make] Error 2
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


