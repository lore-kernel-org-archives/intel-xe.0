Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624A0C5AE59
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 07:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2004C10E59F;
	Wed, 28 May 2025 07:20:29 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5035F10E59C;
 Wed, 28 May 2025 07:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EBuild=3A_failure_for_PCI=3A_VF_resizable_BAR_=28rev?=
 =?utf-8?q?8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 07:20:28 -0000
Message-ID: <174841682831.26775.13998211531449780801@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250527120637.665506-1-michal.winiarski@intel.com>
In-Reply-To: <20250527120637.665506-1-michal.winiarski@intel.com>
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

Series: PCI: VF resizable BAR (rev8)
URL   : https://patchwork.freedesktop.org/series/138887/
State : failure

== Summary ==

CC      drivers/acpi/pmic/intel_pmic_chtdc_ti.o
  CC [M]  net/ipv4/netfilter/nf_nat_snmp_basic.asn1.o
  CC [M]  drivers/video/backlight/wm831x_bl.o
  CC [M]  net/ipv4/netfilter/nf_nat_snmp_basic_main.o
  TABLE   lib/raid6/tables.c
  CC      lib/raid6/int1.o
  CC      lib/fonts/font_8x16.o
  CC      net/devlink/core.o
  CC      mm/highmem.o
  CC      crypto/sha1_generic.o
  CC [M]  arch/x86/kvm/lapic.o
  CC [M]  lib/842/842_compress.o
  CC [M]  drivers/dma/dw/dw.o
  CC      kernel/cgroup/rdma.o
  CC [M]  drivers/video/backlight/arcxcnn_bl.o
  CC [M]  net/ipv6/netfilter/nf_defrag_ipv6_hooks.o
  CC [M]  drivers/video/backlight/rave-sp-backlight.o
  CC [M]  drivers/dma/dw/idma32.o
  CC      drivers/acpi/acpica/hwgpe.o
  CC [M]  lib/reed_solomon/reed_solomon.o
  CC      lib/raid6/int2.o
  CC [M]  drivers/clk/clk-palmas.o
  TEST    lib/test_fortify/read_overflow-memchr.log
  CC [M]  drivers/clk/clk-pwm.o
  CC [M]  net/sched/cls_matchall.o
  CC      drivers/acpi/pmic/tps68470_pmic.o
  CC      kernel/time/alarmtimer.o
  CC      kernel/fork.o
  CC [M]  arch/x86/kvm/i8254.o
  CC      fs/ext4/inline.o
  CC [M]  drivers/leds/leds-lp8788.o
  CC [M]  drivers/gpio/gpio-max7300.o
  CC [M]  drivers/dma/dw-edma/dw-edma-core.o
  TEST    lib/test_fortify/read_overflow-memchr_inv.log
  CC      mm/memory.o
  CC      net/devlink/netlink.o
  CC [M]  drivers/gpio/gpio-max7301.o
  CC      kernel/debug/kdb/kdb_keyboard.o
  CC      drivers/acpi/acpica/hwregs.o
  CC      lib/fonts/font_acorn_8x8.o
  CC [M]  net/xfrm/xfrm_algo.o
  CC [M]  drivers/video/fbdev/smscufx.o
  CC      lib/fonts/font_6x10.o
  CC      arch/x86/kernel/cpu/bus_lock.o
  CC      lib/fonts/font_ter16x32.o
  CC      kernel/cgroup/cpuset.o
  TEST    lib/test_fortify/read_overflow-memcmp.log
  CC      lib/raid6/int4.o
  LD [M]  net/ipv4/netfilter/nf_nat_snmp_basic.o
  CC      net/ipv4/ip_fragment.o
  CC [M]  drivers/video/fbdev/xen-fbfront.o
  CC      block/blk-iocost.o
  CC      crypto/sha256_generic.o
  CC [M]  drivers/clk/clk-si5341.o
  CC [M]  net/sched/em_cmp.o
  AR      drivers/acpi/pmic/built-in.a
  CC [M]  net/sched/em_nbyte.o
  CC      mm/mincore.o
  CC [M]  drivers/leds/leds-lt3593.o
  CC [M]  drivers/dma/ioat/init.o
  CC      kernel/trace/ring_buffer.o
  AR      drivers/video/backlight/built-in.a
  CC      drivers/acpi/acpica/hwsleep.o
  CC [M]  drivers/leds/leds-max8997.o
  TEST    lib/test_fortify/read_overflow-memscan.log
  TEST    lib/test_fortify/read_overflow2-memcmp.log
  CC [M]  drivers/dma/dw/acpi.o
  CC      arch/x86/kernel/signal_64.o
  CC [M]  lib/842/842_decompress.o
  CC [M]  sound/core/compress_offload.o
  CC [M]  drivers/gpio/gpio-max730x.o
  AR      lib/fonts/built-in.a
  CC      lib/raid6/int8.o
  CC      kernel/bpf/syscall.o
  CC [M]  net/netfilter/nf_conntrack_proto_icmpv6.o
  CC [M]  drivers/video/fbdev/uvesafb.o
  CC [M]  net/sched/em_u32.o
  CC      lib/zstd/compress/zstd_preSplit.o
  TEST    lib/test_fortify/read_overflow2-memcpy.log
  CC      mm/mlock.o
  CC      drivers/acpi/acpica/hwvalid.o
  CC      kernel/debug/kdb/gen-kdb_cmds.o
  CC      mm/mmap.o
  CC [M]  sound/pci/rme9652/hdspm.o
  CC      lib/raid6/tables.o
  AR      kernel/debug/kdb/built-in.a
  AR      kernel/debug/built-in.a
  CC      net/devlink/netlink_gen.o
  CC      kernel/cgroup/misc.o
  LD [M]  sound/core/snd.o
  TEST    lib/test_fortify/read_overflow2-memmove.log
  CC [M]  net/xfrm/xfrm_user.o
  CC      kernel/trace/trace.o
  CC      fs/ext4/inode.o
  CC      lib/zstd/zstd_decompress_module.o
  CC      mm/mmu_gather.o
  CC      crypto/sha512_generic.o
  CC      drivers/acpi/acpica/hwxface.o
  CC      net/core/netdev-genl-gen.o
  CC      kernel/exec_domain.o
  CC      kernel/time/posix-timers.o
  CC [M]  drivers/dma/dw-edma/dw-edma-v0-core.o
  CC [M]  drivers/leds/leds-mc13783.o
  CC [M]  net/ipv6/netfilter/nf_conntrack_reasm.o
  CC [M]  drivers/dma/dw/platform.o
  CC      net/devlink/dev.o
  CC      lib/zstd/decompress/huf_decompress.o
  CC [M]  drivers/clk/clk-si5351.o
  CC      net/ipv6/ip6_output.o
  TEST    lib/test_fortify/read_overflow2_field-memcpy.log
  CC [M]  drivers/dma/ioat/dma.o
  CC      drivers/pci/pci-driver.o
  CC [M]  drivers/gpio/gpio-max732x.o
  CC      arch/x86/kernel/cpu/capflags.o
  AR      drivers/pmdomain/actions/built-in.a
  CC      drivers/virtio/virtio.o
  AR      drivers/pmdomain/amlogic/built-in.a
  CC      net/ipv4/ip_forward.o
  CC [M]  net/sched/em_meta.o
  AR      arch/x86/kernel/cpu/built-in.a
  AR      drivers/pmdomain/apple/built-in.a
  CC      arch/x86/kernel/traps.o
  AR      drivers/pmdomain/arm/built-in.a
  AR      drivers/pmdomain/bcm/built-in.a
  AR      drivers/pmdomain/imx/built-in.a
  AR      drivers/pmdomain/mediatek/built-in.a
  TEST    lib/test_fortify/read_overflow2_field-memmove.log
  AR      drivers/pmdomain/qcom/built-in.a
  AR      drivers/pmdomain/renesas/built-in.a
  AR      drivers/pmdomain/rockchip/built-in.a
  CC      kernel/bpf/verifier.o
  AR      drivers/pmdomain/samsung/built-in.a
  CC [M]  drivers/leds/leds-menf21bmc.o
  AR      drivers/pmdomain/st/built-in.a
  AR      drivers/pmdomain/starfive/built-in.a
  AR      drivers/pmdomain/sunxi/built-in.a
  LD [M]  sound/core/snd-ctl-led.o
  LD [M]  sound/core/snd-hwdep.o
  LD [M]  sound/core/snd-timer.o
  LD [M]  sound/core/snd-hrtimer.o
  AR      drivers/pmdomain/tegra/built-in.a
  LD [M]  sound/core/snd-pcm.o
  LD [M]  sound/core/snd-pcm-dmaengine.o
  AR      drivers/pmdomain/thead/built-in.a
  CC      arch/x86/kernel/idt.o
  LD [M]  sound/core/snd-seq-device.o
  CC      drivers/acpi/acpica/hwxfsleep.o
  CC [M]  net/netfilter/nf_conntrack_timeout.o
  LD [M]  sound/core/snd-rawmidi.o
  AR      drivers/pmdomain/ti/built-in.a
  LD [M]  sound/core/snd-compress.o
  CC      fs/squashfs/block.o
  AR      drivers/pmdomain/xilinx/built-in.a
  CC [M]  net/netfilter/nf_conntrack_timestamp.o
  CC      drivers/pmdomain/core.o
  CC      drivers/acpi/x86/apple.o
  CC      fs/ramfs/inode.o
  CC      drivers/acpi/x86/cmos_rtc.o
  CC      fs/hugetlbfs/inode.o
  CC [M]  drivers/dma/dw/pci.o
  CC [M]  net/netfilter/nf_conntrack_ecache.o
  CC      net/core/gso.o
  CC [M]  drivers/dma/dw-edma/dw-hdma-v0-core.o
  TEST    lib/test_fortify/write_overflow-memcpy.log
  AR      lib/raid6/built-in.a
  CC      arch/x86/kernel/irq.o
  CC [M]  drivers/video/fbdev/vga16fb.o
  CC [M]  arch/x86/kvm/ioapic.o
  CC [M]  drivers/gpio/gpio-mb86s7x.o
  CC      crypto/sha3_generic.o
  TEST    lib/test_fortify/write_overflow-memmove.log
  AR      security/built-in.a
  CC [M]  drivers/clk/clk-si544.o
  CC [M]  drivers/dma/ioat/prep.o
  CC      drivers/acpi/acpica/hwpci.o
  CC [M]  drivers/leds/leds-mlxcpld.o
  CC      block/mq-deadline.o
  CC      kernel/time/posix-cpu-timers.o
  CC      kernel/bpf/inode.o
  CC      arch/x86/kernel/irq_64.o
  LD [M]  drivers/dma/dw/dw_dmac_core.o
  LD [M]  drivers/dma/dw/dw_dmac.o
  LD [M]  drivers/dma/dw/dw_dmac_pci.o
  CC      kernel/panic.o
  TEST    lib/test_fortify/write_overflow-memset.log
  CC      kernel/trace/trace_output.o
  CC      fs/squashfs/cache.o
  CC      fs/ramfs/file-mmu.o
  CC      drivers/virtio/virtio_ring.o
  CC [M]  net/xfrm/xfrm_compat.o
  CC      kernel/trace/trace_seq.o
  CC [M]  drivers/dma/dw-edma/dw-edma-v0-debugfs.o
  CC      fs/squashfs/dir.o
  CC      drivers/acpi/acpica/nsaccess.o
  CC      net/ipv4/ip_options.o
  LD [M]  sound/pci/rme9652/snd-hdsp.o
  LD [M]  sound/pci/rme9652/snd-hdspm.o
  CC [M]  drivers/gpio/gpio-mc33880.o
  CC [M]  sound/pci/ad1889.o
  CC [M]  net/sched/em_text.o
  CC      drivers/acpi/x86/lpss.o
  CC      fs/ext4/ioctl.o
  CC [M]  drivers/gpio/gpio-menz127.o
  TEST    lib/test_fortify/write_overflow-strcpy-lit.log
  CC      drivers/pci/search.o
  CC [M]  drivers/leds/leds-mlxreg.o
  CC [M]  drivers/clk/clk-tps68470.o
  CC [M]  net/sched/em_ipt.o
  CC [M]  arch/x86/kvm/irq_comm.o
  CC      crypto/blake2b_generic.o
  CC      drivers/acpi/acpica/nsalloc.o
  TEST    lib/test_fortify/write_overflow-strcpy.log
  AR      kernel/cgroup/built-in.a
  CC      kernel/trace/trace_stat.o
  CC [M]  net/ipv6/netfilter/nf_socket_ipv6.o
  CC [M]  drivers/dma/sf-pdma/sf-pdma.o
  AR      drivers/video/fbdev/built-in.a
  CC      drivers/video/nomodeset.o
  AR      fs/ramfs/built-in.a
  CC      fs/squashfs/export.o
  CC [M]  drivers/dma/ioat/dca.o
  CC      fs/ext4/mballoc.o
  CC      drivers/acpi/acpica/nsarguments.o
  CC      net/devlink/port.o
  AR      fs/hugetlbfs/built-in.a
  CC      kernel/cpu.o
  CC      fs/squashfs/file.o
  CC [M]  drivers/clk/clk-twl6040.o
  CC [M]  drivers/gpio/gpio-ml-ioh.o
  CC [M]  drivers/dma/dw-edma/dw-hdma-v0-debugfs.o
  CC      lib/zstd/decompress/zstd_ddict.o
  CC      kernel/time/posix-clock.o
  CC      net/core/net-sysfs.o
  TEST    lib/test_fortify/write_overflow-strncpy-src.log
  CC [M]  drivers/leds/leds-mt6323.o
  CC      block/bio-integrity.o
  CC [M]  sound/pci/als300.o
  CC      fs/squashfs/fragment.o
  CC      lib/zstd/decompress/zstd_decompress.o
  CC [M]  drivers/dma/dw-edma/dw-edma-pcie.o
  CC [M]  net/netfilter/nf_conntrack_labels.o
  CC [M]  net/netfilter/nf_conntrack_ovs.o
  CC      drivers/pmdomain/governor.o
  CC      kernel/bpf/helpers.o
  CC      drivers/acpi/acpica/nsconvert.o
  CC      kernel/time/itimer.o
  CC      net/core/hotdata.o
  CC      drivers/acpi/x86/s2idle.o
  CC      net/core/netdev_rx_queue.o
  TEST    lib/test_fortify/write_overflow-strncpy.log
  CC [M]  net/xfrm/xfrm_ipcomp.o
  CC [M]  drivers/dma/ioat/sysfs.o
  CC      drivers/acpi/acpica/nsdump.o
  CC      drivers/pci/rom.o
  CC      crypto/ecb.o
  CC      drivers/xen/events/events_base.o
  CC      drivers/video/hdmi.o
  CC [M]  drivers/clk/clk-twl.o
  TEST    lib/test_fortify/write_overflow-strscpy.log
  CC [M]  drivers/leds/leds-nic78bx.o
  TEST    lib/test_fortify/write_overflow_field-memcpy.log
  CC      drivers/xen/events/events_2l.o
  CC      drivers/xen/events/events_fifo.o
  CC      arch/x86/kernel/dumpstack_64.o
  CC [M]  drivers/gpio/gpio-pca953x.o
  AR      drivers/pmdomain/built-in.a
  CC      drivers/dma/dmaengine.o
  CC      lib/zstd/decompress/zstd_decompress_block.o
  CC [M]  drivers/gpio/gpio-pca9570.o
  CC      drivers/dma/virt-dma.o
  CC [M]  sound/pci/als4000.o
  CC      fs/squashfs/id.o
  CC [M]  drivers/gpio/gpio-pcf857x.o
  LD [M]  drivers/dma/dw-edma/dw-edma.o
  CC [M]  net/ipv6/netfilter/nf_tproxy_ipv6.o
  CC      arch/x86/kernel/time.o
  AR      net/sched/built-in.a
  CC [M]  drivers/gpio/gpio-pcie-idio-24.o
  CC [M]  drivers/leds/leds-pca9532.o
  CC [M]  sound/pci/cs4281.o
  TEST    lib/test_fortify/write_overflow_field-memmove.log
  CC      drivers/acpi/acpica/nseval.o
  CC [M]  drivers/acpi/nfit/core.o
  CC      net/ipv4/ip_output.o
  CC      crypto/cbc.o
  CC [M]  arch/x86/kvm/cpuid.o
  LD [M]  drivers/dma/ioat/ioatdma.o
  CC      arch/x86/kernel/ioport.o
  CC [M]  drivers/clk/clk-wm831x.o
  CC      drivers/acpi/tables.o
  CC      kernel/bpf/tnum.o
  CC      drivers/virtio/virtio_anchor.o
  CC      kernel/time/clockevents.o
  CC      block/blk-integrity.o
  CC      fs/squashfs/inode.o
  TEST    lib/test_fortify/write_overflow_field-memset.log
  CC      net/ipv4/ip_sockglue.o
  CC      kernel/exit.o
  CC      drivers/acpi/acpica/nsinit.o
  CC      drivers/video/display_timing.o
  CC      drivers/dma/acpi-dma.o
  CC [M]  net/xfrm/xfrm_interface_core.o
  LD [M]  sound/pci/snd-ad1889.o
  CC      block/t10-pi.o
  CC      drivers/pci/setup-res.o
  CC [M]  drivers/gpio/gpio-pci-idio-16.o
  CC      net/devlink/sb.o
  CC      net/devlink/dpipe.o
  CC      drivers/acpi/x86/utils.o
  CAT     lib/test_fortify/test_fortify.log
  CC [M]  net/netfilter/nf_conntrack_proto_dccp.o
  CC      fs/ext4/migrate.o
  CC      mm/mprotect.o
  CC      kernel/events/ring_buffer.o
  CC      crypto/cts.o
  CC      kernel/bpf/log.o
  CC [M]  drivers/leds/leds-pca955x.o
  CC      kernel/trace/trace_printk.o
  CC [M]  arch/x86/kvm/pmu.o
  CC      block/bio-integrity-auto.o
  CC      drivers/acpi/osi.o
  CC      block/blk-zoned.o
  CC      drivers/acpi/osl.o
  LD [M]  sound/pci/snd-als300.o
  LD [M]  sound/pci/snd-als4000.o
  LD [M]  sound/pci/snd-cs4281.o
  CC      drivers/acpi/acpica/nsload.o
  AR      drivers/clk/built-in.a
  CC      block/blk-wbt.o
  CC      arch/x86/kernel/dumpstack.o
  CC      kernel/bpf/token.o
  CC      fs/squashfs/namei.o
  CC [M]  net/ipv6/netfilter/nf_reject_ipv6.o
  CC [M]  sound/soc/codecs/ac97.o
  CC      drivers/video/videomode.o
  CC      drivers/acpi/utils.o
  CC      drivers/virtio/virtio_pci_modern_dev.o
  CC [M]  drivers/video/vgastate.o
  CC [M]  drivers/gpio/gpio-pisosr.o
  CC      drivers/acpi/x86/blacklist.o
  CC      lib/argv_split.o
  CC      drivers/acpi/acpica/nsnames.o
  CC      kernel/time/tick-common.o
  CC      net/core/page_pool.o
  CC      crypto/xts.o
  CC      fs/fat/cache.o
  CC      lib/bug.o
  CC      lib/buildid.o
  CC      block/blk-mq-debugfs.o
  CC      fs/squashfs/super.o
  CC [M]  drivers/dma/altera-msgdma.o
  CC      arch/x86/kernel/nmi.o
  CC [M]  sound/soc/codecs/ak4619.o
  CC      fs/exfat/inode.o
  CC      drivers/pci/irq.o
  CC      fs/exfat/namei.o
  CC      fs/ext4/mmp.o
  CC [M]  drivers/leds/leds-pca963x.o
  CC      fs/exfat/dir.o
  CC [M]  net/netfilter/nf_conntrack_proto_sctp.o
  AR      drivers/xen/events/built-in.a
  CC      drivers/acpi/acpica/nsobject.o
  CC      drivers/xen/xenbus/xenbus_client.o
  CC [M]  net/netfilter/nf_conntrack_proto_gre.o
  AR      drivers/acpi/x86/built-in.a
  CC      fs/exfat/super.o
  CC [M]  drivers/gpio/gpio-rdc321x.o
  CC      fs/isofs/namei.o
  CC      kernel/events/callchain.o
  LD [M]  net/xfrm/xfrm_interface.o
  AR      net/xfrm/built-in.a
  CC      lib/zstd/zstd_common_module.o
  CC      fs/fat/dir.o
  CC      mm/mremap.o
  CC      kernel/trace/pid_list.o
  CC      crypto/ctr.o
  CC      block/sed-opal.o
  CC      net/ipv4/inet_hashtables.o
  CC      drivers/acpi/acpica/nsparse.o
  CC      fs/exportfs/expfs.o
  CC      drivers/virtio/virtio_pci_legacy_dev.o
  CC [M]  drivers/acpi/nfit/intel.o
  CC      mm/msync.o
  CC [M]  drivers/gpio/gpio-sch311x.o
  CC      lib/zstd/common/debug.o
  CC [M]  sound/soc/codecs/cs40l50-codec.o
  CC      fs/squashfs/symlink.o
  CC      drivers/virtio/virtio_mmio.o
  CC      mm/page_vma_mapped.o
  CC [M]  drivers/dma/idma64.o
  CC      kernel/time/tick-broadcast.o
  AR      drivers/video/built-in.a
  CC      kernel/bpf/bpf_iter.o
  CC [M]  drivers/leds/leds-pca995x.o
  CC      fs/ext4/move_extent.o
  CC [M]  arch/x86/kvm/mtrr.o
  CC      kernel/bpf/map_iter.o
  CC      kernel/trace/tracing_map.o
  CC      drivers/regulator/core.o
  CC      fs/isofs/inode.o
  CC [M]  drivers/gpio/gpio-sch.o
  CC      net/devlink/resource.o
  CC [M]  drivers/leds/leds-pwm.o
  CC      crypto/gcm.o
  CC [M]  net/ipv6/netfilter/nf_dup_ipv6.o
  CC      drivers/acpi/acpica/nspredef.o
  CC      drivers/pci/vpd.o
  CC      kernel/events/hw_breakpoint.o
  CC      drivers/virtio/virtio_pci_modern.o
  CC      arch/x86/kernel/fred.o
  CC [M]  sound/hda/ext/hdac_ext_bus.o
  CC      fs/exfat/fatent.o
  CC [M]  sound/hda/ext/hdac_ext_controller.o
  CC      lib/zstd/common/entropy_common.o
  CC      net/ipv6/ip6_input.o
  CC [M]  sound/hda/ext/hdac_ext_stream.o
  CC      drivers/acpi/acpica/nsprepkg.o
  CC      drivers/virtio/virtio_pci_common.o
  CC [M]  drivers/leds/leds-regulator.o
  CC [M]  drivers/acpi/nfit/mce.o
  CC      drivers/regulator/dummy.o
  CC      fs/squashfs/decompressor.o
  CC      fs/nls/nls_base.o
  CC [M]  sound/soc/codecs/cs530x.o
  CC      lib/zstd/common/error_private.o
  CC      fs/nls/nls_cp437.o
  CC      kernel/trace/trace_sched_switch.o
  CC      lib/zstd/common/fse_decompress.o
  CC      drivers/xen/xenbus/xenbus_comms.o
  CC      lib/zstd/common/zstd_common.o
  CC      fs/squashfs/page_actor.o
  AR      fs/exportfs/built-in.a
  CC [M]  drivers/gpio/gpio-sim.o
  CC      fs/fat/fatent.o
  AR      drivers/xen/xen-pciback/built-in.a
  CC [M]  drivers/xen/xen-pciback/pci_stub.o
  CC      fs/ext4/namei.o
  CC      drivers/acpi/acpica/nsrepair.o
  CC [M]  drivers/dma/plx_dma.o
  CC      kernel/bpf/task_iter.o
  CC      arch/x86/kernel/ldt.o
  CC [M]  arch/x86/kvm/debugfs.o
  CC      kernel/softirq.o
  CC      net/core/page_pool_user.o
  CC      mm/pagewalk.o
  CC [M]  net/netfilter/nf_conntrack_netlink.o
  CC [M]  drivers/gpio/gpio-siox.o
  CC [M]  fs/nls/nls_cp737.o
  CC      crypto/aes_generic.o
  CC      fs/exfat/cache.o
  CC [M]  drivers/leds/leds-tca6507.o
  CC [M]  fs/nls/nls_cp775.o
  CC      net/ipv4/inet_timewait_sock.o
  CC      block/blk-pm.o
  CC      kernel/time/tick-broadcast-hrtimer.o
  CC      net/core/net-procfs.o
  CC      fs/isofs/dir.o
  AR      lib/zstd/built-in.a
  CC      lib/clz_tab.o
  CC      fs/isofs/util.o
  CC      drivers/acpi/acpica/nsrepair2.o
  LD [M]  drivers/acpi/nfit/nfit.o
  CC      fs/ext4/page-io.o
  CC      fs/ext4/readpage.o
  CC      lib/cmdline.o
  CC      fs/isofs/rock.o
  CC      fs/ext4/resize.o
  CC      drivers/pci/setup-bus.o
  CC      net/core/netpoll.o
  CC      fs/squashfs/file_direct.o
  CC      lib/cpumask.o
  CC      fs/exfat/nls.o
  LD [M]  sound/hda/ext/snd-hda-ext-core.o
  CC [M]  sound/hda/hda_bus_type.o
  CC      drivers/xen/xenbus/xenbus_xs.o
  CC [M]  drivers/gpio/gpio-sloppy-logic-analyzer.o
  CC      fs/exfat/misc.o
  CC      fs/exfat/file.o
  CC      drivers/virtio/virtio_pci_legacy.o
  CC      arch/x86/kernel/setup.o
  CC      kernel/trace/trace_functions.o
  AR      drivers/dma/built-in.a
  CC [M]  net/netfilter/nfnetlink_cttimeout.o
  CC [M]  fs/nls/nls_cp850.o
  CC      kernel/time/tick-oneshot.o
  CC [M]  net/ipv6/netfilter/nft_reject_ipv6.o
  CC      drivers/acpi/acpica/nssearch.o
  CC [M]  arch/x86/kvm/mmu/mmu.o
  CC      crypto/deflate.o
  CC      fs/ext4/super.o
  CC      net/ipv6/addrconf.o
  CC [M]  net/ipv6/netfilter/nft_dup_ipv6.o
  CC      net/devlink/param.o
  CC      drivers/acpi/acpica/nsutils.o
  CC [M]  sound/soc/codecs/cs530x-i2c.o
  CC      kernel/events/uprobes.o
  CC [M]  drivers/xen/xen-pciback/pciback_ops.o
  CC [M]  drivers/xen/xenfs/super.o
  CC [M]  drivers/leds/leds-ti-lmu-common.o
  CC      drivers/xen/xenbus/xenbus_probe.o
  CC      mm/pgtable-generic.o
  CC      fs/squashfs/decompressor_single.o
  CC      drivers/xen/cpu_hotplug.o
  CC [M]  drivers/gpio/gpio-tangier.o
  CC      fs/isofs/export.o
  CC      block/blk-crypto.o
  AR      net/dsa/built-in.a
  CC [M]  drivers/xen/xenfs/xenstored.o
  CC [M]  fs/nls/nls_cp852.o
  CC      lib/ctype.o
  CC      net/ipv4/inet_connection_sock.o
  CC      fs/fat/file.o
  CC      drivers/virtio/virtio_pci_admin_legacy_io.o
  CC      drivers/virtio/virtio_balloon.o
  CC      kernel/time/tick-sched.o
  CC      net/core/fib_rules.o
  CC [M]  drivers/xen/xenfs/xensyms.o
  CC [M]  drivers/gpio/gpio-tpic2810.o
  CC      net/strparser/strparser.o
  CC      lib/dec_and_lock.o
  CC      drivers/acpi/acpica/nswalk.o
  CC      crypto/crc32c_generic.o
  CC [M]  sound/hda/hdac_bus.o
  CC      fs/exfat/balloc.o
  CC      drivers/xen/xenbus/xenbus_probe_backend.o
  CC      kernel/trace/trace_preemptirq.o
  CC [M]  sound/soc/codecs/es8311.o
  CC      lib/decompress.o
  CC [M]  drivers/gpio/gpio-tps65086.o
  CC [M]  drivers/gpio/gpio-tps65912.o
  CC      fs/isofs/joliet.o
  CC [M]  fs/nls/nls_cp855.o
  CC      fs/squashfs/decompressor_multi.o
  CC      crypto/lzo.o
  CC      kernel/bpf/prog_iter.o
  CC [M]  net/ipv6/netfilter/nft_fib_ipv6.o
  CC [M]  drivers/xen/xen-pciback/xenbus.o
  CC      fs/squashfs/decompressor_multi_percpu.o
  CC      lib/decompress_bunzip2.o
  CC      drivers/acpi/acpica/nsxfeval.o
  CC [M]  drivers/virtio/virtio_input.o
  CC      fs/unicode/utf8-norm.o
  CC [M]  drivers/gpio/gpio-tps68470.o
  CC [M]  drivers/leds/leds-tlc591xx.o
  CC      mm/rmap.o
  LD [M]  drivers/xen/xenfs/xenfs.o
  CC      fs/unicode/utf8-core.o
  CC [M]  drivers/xen/xen-pciback/conf_space.o
  CC [M]  arch/x86/kvm/mmu/page_track.o
  CC      arch/x86/kernel/x86_init.o
  CC      fs/ntfs3/attrib.o
  CC      fs/udf/balloc.o
  CC      drivers/pci/vc.o
  CC [M]  net/netfilter/nfnetlink_cthelper.o
  AR      fs/hostfs/built-in.a
  CC      fs/debugfs/inode.o
  CC [M]  arch/x86/kvm/mmu/spte.o
  CC      net/ipv6/addrlabel.o
  AR      fs/exfat/built-in.a
  CC [M]  fs/nls/nls_cp857.o
  CC      fs/debugfs/file.o
  CC [M]  arch/x86/kvm/mmu/tdp_iter.o
  CC      crypto/lzo-rle.o
  CC      fs/udf/dir.o
  CC      fs/isofs/compress.o
  CC      block/blk-crypto-profile.o
  CC [M]  arch/x86/kvm/mmu/tdp_mmu.o
  CC      fs/squashfs/xattr.o
  CC      drivers/regulator/fixed-helper.o
  CC      fs/tracefs/inode.o
  CC [M]  sound/soc/codecs/hda.o
  CC      lib/decompress_inflate.o
  CC      drivers/acpi/acpica/nsxfname.o
  CC [M]  drivers/gpio/gpio-tqmx86.o
  CC      drivers/xen/xenbus/xenbus_dev_frontend.o
  CC      kernel/trace/trace_sched_wakeup.o
  CC [M]  sound/soc/codecs/hda-dai.o
  CC [M]  net/netfilter/nf_conntrack_amanda.o
  CC [M]  sound/hda/hdac_device.o
  CC      fs/fat/inode.o
  CC [M]  drivers/virtio/virtio_vdpa.o
  CC      fs/ntfs3/attrlist.o
  CC [M]  drivers/leds/leds-tps6105x.o
  CC      net/devlink/region.o
  CC [M]  fs/nls/nls_cp860.o
  CC      kernel/time/timer_migration.o
  CC      drivers/pci/mmap.o
  CC [M]  drivers/xen/xen-pciback/conf_space_header.o
  COPY    fs/unicode/utf8data.c
  CC      fs/unicode/utf8data.o
  CC      crypto/xxhash_generic.o
  AR      net/strparser/built-in.a
  CC      fs/udf/file.o
  CC      fs/udf/ialloc.o
  CC      fs/ntfs3/bitfunc.o
  CC      crypto/rng.o
  CC      fs/squashfs/xattr_id.o
  CC      lib/decompress_unlz4.o
  AR      kernel/events/built-in.a
  CC [M]  net/ipv6/netfilter/ip6t_ah.o
  CC      arch/x86/kernel/i8259.o
  CC      drivers/regulator/helpers.o
  AR      fs/isofs/built-in.a
  CC [M]  arch/x86/kvm/hyperv.o
  CC      drivers/xen/xenbus/xenbus_dev_backend.o
  CC [M]  drivers/gpio/gpio-twl4030.o
  CC      drivers/acpi/acpica/nsxfobj.o
  CC [M]  fs/nls/nls_cp861.o
  CC      fs/tracefs/event_inode.o
  CC      net/core/net-traces.o
  CC      drivers/xen/xenbus/xenbus_probe_frontend.o
  CC      drivers/acpi/acpica/psargs.o
  CC [M]  drivers/gpio/gpio-twl6040.o
  CC      drivers/pci/devres.o
  CC      drivers/acpi/acpica/psloop.o
  CC [M]  drivers/leds/leds-wm831x-status.o
  CC [M]  fs/nls/nls_cp862.o
  CC      block/blk-crypto-sysfs.o
  CC      fs/squashfs/lz4_wrapper.o
  CC      mm/vmalloc.o
  CC      kernel/trace/trace_hwlat.o
  CC      lib/decompress_unlzma.o
  CC      net/8021q/vlan_core.o
  CC [M]  arch/x86/kvm/xen.o
  CC [M]  fs/nls/nls_cp863.o
  CC      net/netlabel/netlabel_user.o
  CC [M]  drivers/xen/xen-pciback/conf_space_capability.o
  CC [M]  sound/soc/codecs/hdmi-codec.o
  CC      fs/ntfs3/bitmap.o
  CC [M]  drivers/virtio/virtio_mem.o
  CC      net/netlabel/netlabel_kapi.o
  CC      fs/udf/inode.o
  CC      kernel/bpf/link_iter.o
  CC      net/core/drop_monitor.o
  AR      fs/debugfs/built-in.a
  CC      drivers/acpi/acpica/psobject.o
  CC      net/ipv4/tcp.o
  AR      fs/unicode/built-in.a
  CC [M]  net/netfilter/nf_conntrack_ftp.o
  CC [M]  sound/soc/amd/acp-config.o
  CC      fs/squashfs/lzo_wrapper.o
  CC      kernel/trace/trace_osnoise.o
  CC      fs/squashfs/xz_wrapper.o
  CC      fs/udf/lowlevel.o
  CC      fs/btrfs/super.o
  CC [M]  sound/hda/hdac_sysfs.o
  CC      net/core/selftests.o
  CC [M]  drivers/leds/leds-wm8350.o
  CC [M]  drivers/gpio/gpio-viperboard.o
  CC [M]  fs/nls/nls_cp864.o
  CC      arch/x86/kernel/irqinit.o
  CC      mm/vma.o
  CC      lib/decompress_unlzo.o
  CC      block/blk-crypto-fallback.o
  CC [M]  net/ipv6/netfilter/ip6t_eui64.o
  CC      crypto/drbg.o
  AR      fs/tracefs/built-in.a
  CC      fs/fat/misc.o
  CC      drivers/pci/proc.o
  CC      drivers/acpi/acpica/psopcode.o
  CC      drivers/pci/pci-sysfs.o
  CC [M]  net/ipv6/netfilter/ip6t_frag.o
  CC      kernel/time/vsyscall.o
  CC [M]  drivers/xen/xen-pciback/conf_space_quirks.o
  CC      drivers/regulator/devres.o
  CC      kernel/trace/trace_nop.o
  CC [M]  sound/x86/intel_hdmi_audio.o
  CC      fs/squashfs/zlib_wrapper.o
  CC      fs/btrfs/ctree.o
  CC      fs/udf/namei.o
  CC      net/devlink/health.o
  AR      drivers/xen/xenbus/built-in.a
  CC      net/ipv6/route.o
  CC      kernel/bpf/hashtab.o
  CC [M]  sound/soc/codecs/pcm6240.o
  CC [M]  net/8021q/vlan.o
  CC      drivers/acpi/acpica/psopinfo.o
  CC [M]  fs/nls/nls_cp865.o
  CC [M]  sound/hda/hdac_regmap.o
  CC [M]  drivers/leds/leds-dac124s085.o
  CC      lib/decompress_unxz.o
  CC      kernel/time/timekeeping_debug.o
  CC [M]  arch/x86/kvm/smm.o
  CC [M]  drivers/gpio/gpio-virtuser.o
  CC      fs/ntfs3/dir.o
  LD [M]  sound/soc/amd/snd-acp-config.o
  CC      net/netlabel/netlabel_domainhash.o
  CC      arch/x86/kernel/jump_label.o
  CC      drivers/acpi/acpica/psparse.o
  CC      block/holder.o
  CC      arch/x86/kernel/irq_work.o
  CC [M]  drivers/xen/xen-pciback/vpci.o
  CC [M]  fs/nls/nls_cp866.o
  CC [M]  drivers/gpio/gpio-virtio.o
  CC      fs/squashfs/zstd_wrapper.o
  CC [M]  net/8021q/vlan_dev.o
  CC      lib/decompress_unzstd.o
  CC      kernel/trace/trace_stack.o
  CC [M]  net/ipv6/netfilter/ip6t_ipv6header.o
  LD [M]  sound/soc/codecs/snd-soc-ac97.o
  CC [M]  drivers/virtio/virtio_dma_buf.o
  CC      net/ipv4/tcp_input.o
  CC      kernel/resource.o
  CC [M]  drivers/leds/leds-spi-byte.o
  CC      fs/btrfs/extent-tree.o
  CC      drivers/pci/slot.o
  CC      arch/x86/kernel/probe_roms.o
  CC      kernel/time/namespace.o
  CC      crypto/jitterentropy.o
  CC      fs/udf/partition.o
  CC      fs/fat/nfs.o
  CC      drivers/acpi/acpica/psscope.o
  CC      net/ipv6/ip6_fib.o
  CC      crypto/jitterentropy-kcapi.o
  LD [M]  sound/x86/snd-hdmi-lpe-audio.o
  LD [M]  sound/soc/codecs/snd-soc-ak4619.o
  CC      net/ipv4/tcp_output.o
  AR      drivers/reset/amlogic/built-in.a
  CC      fs/ntfs3/fsntfs.o
  AR      drivers/reset/hisilicon/built-in.a
  AR      drivers/reset/starfive/built-in.a
  AR      drivers/reset/sti/built-in.a
  CC [M]  fs/nls/nls_cp869.o
  AR      drivers/reset/tegra/built-in.a
  LD [M]  sound/soc/codecs/snd-soc-cs40l50.o
  CC      drivers/regulator/irq_helpers.o
  LD [M]  sound/soc/codecs/snd-soc-cs530x.o
  CC      drivers/reset/core.o
  LD [M]  sound/soc/codecs/snd-soc-cs530x-i2c.o
  LD [M]  sound/soc/codecs/snd-soc-es8311.o
  LD [M]  sound/soc/codecs/snd-soc-hda-codec.o
  LD [M]  sound/soc/codecs/snd-soc-hdmi-codec.o
  LD [M]  sound/soc/codecs/snd-soc-pcm6240.o
  CC      mm/process_vm_access.o
  CC [M]  drivers/gpio/gpio-vx855.o
  CC [M]  sound/soc/dwc/dwc-i2s.o
  CC [M]  fs/nls/nls_cp874.o
  CC      lib/dump_stack.o
  CC [M]  sound/hda/hdac_controller.o
  CC [M]  net/netfilter/nf_conntrack_h323_main.o
  AR      fs/squashfs/built-in.a
  CC      fs/ntfs3/frecord.o
  CC [M]  drivers/xen/xen-pciback/passthrough.o
  CC      net/devlink/trap.o
  CC      drivers/acpi/acpica/pstree.o
  CC      drivers/reset/reset-simple.o
  CC      crypto/ghash-generic.o
  CC      kernel/sysctl.o
  CC      fs/ntfs3/file.o
  CC [M]  drivers/leds/uleds.o
  CC [M]  block/kyber-iosched.o
  CC      kernel/trace/trace_mmiotrace.o
  AR      kernel/time/built-in.a
  CC [M]  net/netfilter/nf_conntrack_h323_asn1.o
  CC      fs/ext4/symlink.o
  CC      fs/udf/super.o
  CC      drivers/regulator/event.o
  CC      fs/fat/namei_vfat.o
  AR      drivers/virtio/built-in.a
  CC      fs/ext4/sysfs.o
  CC      net/netlabel/netlabel_addrlist.o
  CC [M]  fs/nls/nls_cp932.o
  CC      drivers/acpi/acpica/psutils.o
  CC [M]  net/ipv6/netfilter/ip6t_mh.o
  CC [M]  net/8021q/vlan_netlink.o
  CC [M]  drivers/gpio/gpio-wcove.o
  CC      fs/fat/namei_msdos.o
  CC      arch/x86/kernel/sys_ia32.o
  CC      drivers/pci/pci-acpi.o
  CC      crypto/ecc.o
  CC      fs/ext4/xattr.o
  CC      kernel/bpf/arraymap.o
  LD [M]  drivers/xen/xen-pciback/xen-pciback.o
  CC      drivers/tty/vt/vt_ioctl.o
  CC      drivers/xen/grant-table.o
  CC [M]  sound/hda/hdac_stream.o
  CC [M]  sound/soc/dwc/dwc-pcm.o
  CC      lib/earlycpio.o
  CC      drivers/acpi/acpica/pswalk.o
  CC [M]  sound/hda/array.o
  AR      drivers/leds/built-in.a
  CC      kernel/bpf/percpu_freelist.o
  CC      fs/ext4/xattr_hurd.o
  CC      crypto/ecdh.o
  CC [M]  fs/nls/nls_euc-jp.o
  CC [M]  net/8021q/vlan_gvrp.o
  CC      lib/extable.o
  CC      kernel/trace/trace_functions_graph.o
  CC [M]  drivers/reset/reset-gpio.o
  CC      mm/mseal.o
  CC [M]  arch/x86/kvm/kvm_onhyperv.o
  CC [M]  drivers/regulator/fixed.o
  CC      net/core/timestamping.o
  CC      net/netlabel/netlabel_mgmt.o
  CC      net/netlabel/netlabel_unlabeled.o
  CC [M]  drivers/gpio/gpio-winbond.o
  CC      kernel/trace/blktrace.o
  CC      drivers/acpi/acpica/psxface.o
  CC      drivers/char/hw_random/core.o
  CC      drivers/iommu/amd/iommu.o
  CC      drivers/char/agp/backend.o
  CC [M]  drivers/char/hw_random/timeriomem-rng.o
  CC      arch/x86/kernel/signal_32.o
  CC      drivers/char/agp/generic.o
  LD [M]  sound/soc/dwc/designware_i2s.o
  CC [M]  net/ipv6/netfilter/ip6t_hbh.o
  AR      fs/fat/built-in.a
  CC [M]  net/8021q/vlan_mvrp.o
  CC      net/dcb/dcbnl.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-byt-match.o
  CC      lib/flex_proportions.o
  CC [M]  block/bfq-iosched.o
  CC      fs/ntfs3/fslog.o
  CC [M]  fs/nls/nls_cp936.o
  CC [M]  drivers/reset/reset-ti-syscon.o
  CC [M]  sound/soc/intel/atom/sst/sst.o
  CC      drivers/acpi/acpica/rsaddr.o
  CC      net/dcb/dcbevent.o
  CC      fs/udf/truncate.o
  CC      net/devlink/rate.o
  CC [M]  drivers/regulator/virtual.o
  CC      net/core/ptp_classifier.o
  CC      drivers/pci/iomap.o
  CC      mm/page_alloc.o
  CC [M]  drivers/gpio/gpio-wm831x.o
  CC [M]  drivers/reset/reset-tps380x.o
  CC      lib/idr.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cht-match.o
  CC [M]  sound/hda/hdmi_chmap.o
  CC      kernel/bpf/bpf_lru_list.o
  CC      drivers/tty/vt/vc_screen.o
  CC      mm/shuffle.o
  CC      drivers/acpi/acpica/rscalc.o
  CC [M]  fs/nls/nls_cp949.o
  CC      fs/pstore/inode.o
  CC      arch/x86/kernel/sys_x86_64.o
  CC      kernel/bpf/lpm_trie.o
  CC      kernel/capability.o
  CC [M]  net/8021q/vlanproc.o
  CC      fs/pstore/platform.o
  CC [M]  net/netfilter/nf_conntrack_irc.o
  CC      net/core/netprio_cgroup.o
  CC      fs/ext4/xattr_trusted.o
  CC      fs/udf/symlink.o
  CC      drivers/xen/features.o
  CC [M]  arch/x86/kvm/vmx/vmx.o
  CC [M]  drivers/char/hw_random/intel-rng.o
  CC      crypto/ecdh_helper.o
  AR      drivers/reset/built-in.a
  CC      drivers/char/agp/isoch.o
  CC [M]  drivers/gpio/gpio-wm8350.o
  CC      fs/btrfs/print-tree.o
  CC [M]  drivers/char/tpm/st33zp24/st33zp24.o
  AR      drivers/gpu/host1x/built-in.a
  CC [M]  drivers/regulator/userspace-consumer.o
  CC      lib/iomem_copy.o
  CC      net/netlabel/netlabel_cipso_v4.o
  CC [M]  net/ipv6/netfilter/ip6t_rpfilter.o
  CC      drivers/acpi/acpica/rscreate.o
  CC [M]  drivers/char/tpm/st33zp24/i2c.o
  AR      drivers/gpu/drm/tests/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_kunit_helpers.o
  CC      arch/x86/kernel/espfix_64.o
  CC      lib/irq_regs.o
  CC      drivers/acpi/acpica/rsdumpinfo.o
  CC      fs/ext4/xattr_user.o
  CC [M]  sound/soc/intel/atom/sst/sst_ipc.o
  CC      drivers/tty/vt/selection.o
  CC      drivers/pci/quirks.o
  CC [M]  fs/nls/nls_cp950.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.o
  CC      fs/btrfs/root-tree.o
  CC      fs/udf/directory.o
  CC      arch/x86/kernel/ksysfs.o
  CC      fs/btrfs/dir-item.o
  CC [M]  drivers/char/hw_random/amd-rng.o
  CC      drivers/char/agp/amd64-agp.o
  CC      crypto/xor.o
  AR      net/8021q/built-in.a
  LD [M]  net/8021q/8021q.o
  CC [M]  sound/soc/intel/atom/sst-mfld-platform-pcm.o
  CC [M]  net/netfilter/nf_conntrack_broadcast.o
  CC [M]  drivers/gpio/gpio-wm8994.o
  CC      fs/btrfs/file-item.o
  CC      kernel/trace/fgraph.o
  CC      drivers/tty/hvc/hvc_console.o
  CC      lib/is_single_threaded.o
  CC [M]  drivers/regulator/88pg86x.o
  CC      net/netlabel/netlabel_calipso.o
  CC      drivers/acpi/acpica/rsinfo.o
  CC [M]  sound/hda/trace.o
  CC      fs/pstore/pmsg.o
  CC      drivers/tty/hvc/hvc_irq.o
  CC      net/core/netclassid_cgroup.o
  CC      net/ipv6/ipv6_sockglue.o
  CC      drivers/xen/balloon.o
  CC      kernel/bpf/map_in_map.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-skl-match.o
  CC [M]  net/netfilter/nf_conntrack_netbios_ns.o
  CC      fs/ext4/fast_commit.o
  CC [M]  fs/nls/nls_cp1250.o
  CC      fs/ext4/orphan.o
  CC      drivers/char/agp/intel-agp.o
  CC [M]  net/ipv6/netfilter/ip6t_rt.o
  CC      net/devlink/linecard.o
  CC [M]  sound/soc/intel/atom/sst/sst_stream.o
  CC [M]  drivers/char/tpm/st33zp24/spi.o
  CC      lib/klist.o
  CC      drivers/tty/vt/keyboard.o
  CC [M]  sound/soc/intel/atom/sst/sst_drv_interface.o
  AR      net/dcb/built-in.a
  CC      drivers/char/tpm/tpm-chip.o
  CC      arch/x86/kernel/bootflag.o
  CC      drivers/acpi/acpica/rsio.o
  CC      drivers/iommu/amd/init.o
  CC [M]  drivers/char/hw_random/ba431-rng.o
  CC [M]  drivers/gpu/drm/tests/drm_atomic_test.o
  CC [M]  drivers/char/mwave/mwavedd.o
  CC [M]  drivers/gpio/gpio-ws16c48.o
  CC      fs/udf/misc.o
  CC      drivers/pci/ats.o
  CC [M]  fs/pstore/ram.o
  CC [M]  drivers/char/mwave/smapi.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-kbl-match.o
  CC [M]  drivers/regulator/88pm800-regulator.o
  CC      crypto/hash_info.o
  CC      net/ipv4/tcp_timer.o
  CC [M]  drivers/regulator/88pm8607.o
  CC [M]  fs/pstore/ram_core.o
  CC      drivers/acpi/acpica/rsirq.o
  CC [M]  fs/nls/nls_cp1251.o
  CC      fs/ntfs3/inode.o
  CC [M]  drivers/regulator/aat2870-regulator.o
  CC      crypto/kdf_sp800108.o
  CC      kernel/bpf/bloom_filter.o
  CC      lib/kobject.o
  CC      arch/x86/kernel/e820.o
  CC      drivers/char/agp/intel-gtt.o
  CC [M]  sound/hda/hdac_component.o
  CC      drivers/acpi/acpica/rslist.o
  CC      kernel/bpf/local_storage.o
  CC      kernel/trace/trace_events.o
  CC [M]  drivers/char/hw_random/via-rng.o
  LD [M]  drivers/char/tpm/st33zp24/tpm_st33zp24.o
  LD [M]  drivers/char/tpm/st33zp24/tpm_st33zp24_i2c.o
  LD [M]  drivers/char/tpm/st33zp24/tpm_st33zp24_spi.o
  CC      arch/x86/kernel/pci-dma.o
  CC      drivers/acpi/acpica/rsmemory.o
  CC      drivers/tty/hvc/hvc_xen.o
  CC      kernel/ptrace.o
  CC [M]  drivers/gpio/gpio-xra1403.o
  CC [M]  drivers/gpu/drm/tests/drm_atomic_state_test.o
  CC      fs/ext4/acl.o
  CC      net/ipv6/ndisc.o
  AR      drivers/gpu/drm/arm/built-in.a
  CC [M]  sound/soc/intel/atom/sst/sst_loader.o
  CC      net/ipv6/udp.o
  CC [M]  drivers/char/mwave/tp3780i.o
  CC [M]  fs/nls/nls_ascii.o
  CC      fs/btrfs/inode-item.o
  CC      fs/udf/udftime.o
  CC [M]  net/netfilter/nf_conntrack_snmp.o
  CC      net/ipv6/udplite.o
  CC [M]  drivers/char/mwave/3780i.o
  CC      drivers/iommu/amd/quirks.o
  CC [M]  sound/hda/hdac_i915.o
  CC [M]  net/ipv6/netfilter/ip6t_srh.o
  CC      net/core/lwtunnel.o
  CC      drivers/acpi/acpica/rsmisc.o
  CC      drivers/xen/manage.o
  CC      drivers/char/tpm/tpm-dev-common.o
  CC [M]  drivers/regulator/act8865-regulator.o
  AR      net/netlabel/built-in.a
  CC      fs/btrfs/disk-io.o
  CC [M]  fs/pstore/zone.o
  CC [M]  drivers/char/hw_random/virtio-rng.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-bxt-match.o
  CC [M]  block/bfq-wf2q.o
  CC [M]  crypto/crypto_engine.o
  CC      fs/ntfs3/index.o
  CC      drivers/iommu/intel/dmar.o
  CC      lib/kobject_uevent.o
  CC [M]  fs/nls/nls_iso8859-1.o
  CC      drivers/pci/iov.o
  CC      fs/btrfs/transaction.o
  CC      fs/ext4/xattr_security.o
  CC [M]  drivers/gpu/drm/tests/drm_bridge_test.o
  CC      fs/udf/unicode.o
  CC      drivers/tty/vt/vt.o
  CC [M]  drivers/gpu/drm/tests/drm_buddy_test.o
  CC      drivers/acpi/acpica/rsserial.o
  CC [M]  sound/soc/intel/atom/sst/sst_pvt.o
  AR      net/devlink/built-in.a
  AR      drivers/iommu/arm/arm-smmu/built-in.a
  AR      drivers/tty/hvc/built-in.a
  CC      drivers/iommu/iommufd/iova_bitmap.o
  CC      fs/btrfs/inode.o
  CC      drivers/char/agp/via-agp.o
  AR      drivers/iommu/arm/arm-smmu-v3/built-in.a
  AR      drivers/iommu/arm/built-in.a
  CC      mm/page_frag_cache.o
  CC      drivers/xen/time.o
  AR      drivers/gpio/built-in.a
  CC [M]  sound/soc/intel/common/soc-acpi-intel-glk-match.o
  LD [M]  drivers/char/mwave/mwave.o
  CC [M]  drivers/char/hw_random/xiphera-trng.o
  CC      mm/init-mm.o
  CC      kernel/bpf/queue_stack_maps.o
  CC      drivers/char/tpm/tpm-dev.o
  CC      net/ipv4/tcp_ipv4.o
  CC      drivers/xen/mem-reservation.o
  CC [M]  drivers/regulator/ad5398.o
  CC      drivers/iommu/amd/io_pgtable.o
  CC [M]  fs/nls/nls_iso8859-2.o
  CC      drivers/acpi/acpica/rsutils.o
  CC      drivers/iommu/intel/iommu.o
  CC [M]  drivers/gpu/drm/tests/drm_cmdline_parser_test.o
  CC      arch/x86/kernel/quirks.o
  CC [M]  sound/hda/intel-dsp-config.o
  AR      sound/built-in.a
  CC      drivers/char/tpm/tpm-interface.o
  CC      net/core/lwt_bpf.o
  CC [M]  net/ipv6/netfilter/ip6t_NPT.o
  CC [M]  drivers/char/agp/sis-agp.o
  CC [M]  block/bfq-cgroup.o
  CC      fs/ext4/verity.o
  CC      fs/ext4/crypto.o
  CC      drivers/pci/pci-label.o
  CC      mm/memblock.o
  AR      fs/udf/built-in.a
  AR      drivers/char/hw_random/built-in.a
  CC      mm/memory_hotplug.o
  CC      mm/slub.o
  CC      drivers/pci/p2pdma.o
  CC [M]  crypto/echainiv.o
  CC      drivers/pci/vgaarb.o
  CC [M]  sound/soc/intel/atom/sst-mfld-platform-compress.o
  CC [M]  fs/nls/nls_iso8859-3.o
  CC      drivers/acpi/acpica/rsxface.o
  CC [M]  net/netfilter/nf_conntrack_pptp.o
  CC      fs/ntfs3/lznt.o
  CC [M]  fs/pstore/blk.o
  CC      kernel/bpf/ringbuf.o
  CC      drivers/iommu/iommufd/driver.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cnl-match.o
  CC [M]  drivers/regulator/arizona-ldo1.o
  CC      drivers/xen/pci.o
  CC [M]  drivers/char/xillybus/xillybus_class.o
  CC [M]  net/netfilter/nf_conntrack_sane.o
  CC [M]  net/ipv6/netfilter/ip6t_REJECT.o
  CC [M]  fs/nls/nls_iso8859-4.o
  CC      lib/logic_pio.o
  CC [M]  sound/soc/intel/atom/sst/sst_pci.o
  CC      drivers/iommu/amd/io_pgtable_v2.o
  AR      drivers/char/agp/built-in.a
  CC      mm/madvise.o
  CC      net/ipv6/raw.o
  CC      fs/efivarfs/inode.o
  CC      arch/x86/kernel/kdebugfs.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cfl-match.o
  CC [M]  crypto/ecdsa.o
  CC      drivers/char/mem.o
  AR      fs/ext4/built-in.a
  COPY    drivers/tty/vt/defkeymap.c
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cml-match.o
  AR      block/built-in.a
  CC      net/ipv4/tcp_minisocks.o
  LD [M]  block/bfq.o
  CC      drivers/acpi/acpica/tbdata.o
  CC      drivers/iommu/amd/ppr.o
  LD [M]  fs/pstore/ramoops.o
  CC [M]  net/netfilter/nf_conntrack_sip.o
  CC [M]  sound/hda/intel-nhlt.o
  CC      fs/ntfs3/namei.o
  CC      drivers/iommu/amd/pasid.o
  CC      kernel/trace/trace_export.o
  CC [M]  fs/nls/nls_iso8859-5.o
  CC      drivers/char/tpm/tpm1-cmd.o
  CC [M]  drivers/regulator/arizona-micsupp.o
  CC [M]  drivers/char/xillybus/xillybus_core.o
  CC      net/core/dst_cache.o
  CC      net/ipv4/tcp_cong.o
  CC      mm/page_io.o
  CC      lib/maple_tree.o
  CC      fs/efivarfs/file.o
  CC      kernel/bpf/bpf_local_storage.o
  CC      drivers/gpu/vga/vga_switcheroo.o
  CC      drivers/char/random.o
  CC [M]  sound/soc/intel/atom/sst/sst_acpi.o
  LD [M]  fs/pstore/pstore_zone.o
  LD [M]  fs/pstore/pstore_blk.o
  AR      fs/pstore/built-in.a
  ASN.1   crypto/ecdsasignature.asn1.[ch]
  AR      drivers/iommu/riscv/built-in.a
  CC [M]  crypto/ecdsa-p1363.o
  CC      drivers/acpi/acpica/tbfadt.o
  CC      net/ipv4/tcp_metrics.o
  CC      arch/x86/kernel/alternative.o
  CC [M]  drivers/regulator/as3711-regulator.o
  CC [M]  drivers/iommu/iommufd/device.o
  CC      kernel/bpf/bpf_task_storage.o
  CC [M]  net/ipv6/netfilter/ip6t_SYNPROXY.o
  CC [M]  drivers/gpu/drm/tests/drm_connector_test.o
  CC      lib/memcat_p.o
  CC [M]  fs/nls/nls_iso8859-6.o
  CC      drivers/pci/doe.o
  CC      drivers/acpi/reboot.o
  CC      drivers/xen/dbgp.o
  CC      net/ipv4/tcp_fastopen.o
  CC      drivers/tty/vt/consolemap.o
  CC      drivers/iommu/iommu.o
  CC [M]  fs/netfs/buffered_read.o
  AR      drivers/iommu/amd/built-in.a
  CC [M]  crypto/ecdsasignature.asn1.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-icl-match.o
  CC      fs/ntfs3/record.o
  CC      drivers/acpi/acpica/tbfind.o
  CC      kernel/trace/trace_syscalls.o
  HOSTCC  drivers/tty/vt/conmakehash
  CC [M]  sound/soc/intel/common/soc-acpi-intel-tgl-match.o
  CC [M]  sound/hda/intel-sdw-acpi.o
  CC      fs/efivarfs/super.o
  LD [M]  sound/hda/snd-hda-core.o
  CC [M]  crypto/crypto_user.o
  CC [M]  fs/netfs/buffered_write.o
  CC [M]  fs/nls/nls_iso8859-7.o
  CC [M]  fs/nls/nls_cp1255.o
  CC [M]  drivers/gpu/drm/tests/drm_damage_helper_test.o
  CC      drivers/char/ttyprintk.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-core.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-pci.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-acpi.o
  CC [M]  drivers/regulator/atc260x-regulator.o
  CC [M]  sound/soc/intel/atom/sst-atom-controls.o
  CC      net/core/gro_cells.o
  CC      drivers/acpi/acpica/tbinstal.o
  CC [M]  fs/netfs/direct_read.o
  CC      net/ipv4/tcp_rate.o
  CC      drivers/char/tpm/tpm2-cmd.o
  CC [M]  fs/netfs/direct_write.o
  CC      drivers/xen/acpi.o
  CC      arch/x86/kernel/i8253.o
  CC [M]  fs/nls/nls_iso8859-9.o
  CC      drivers/tty/serdev/core.o
  CC      drivers/tty/serial/8250/8250_core.o
  CC [M]  drivers/char/xillybus/xillybus_pcie.o
  CC      kernel/bpf/bpf_inode_storage.o
  CC      drivers/acpi/acpica/tbprint.o
  CC      fs/ntfs3/run.o
  CC [M]  drivers/tty/serial/jsm/jsm_driver.o
  CC      drivers/tty/serial/8250/8250_platform.o
  CC      drivers/tty/serial/8250/8250_pnp.o
  AR      drivers/gpu/vga/built-in.a
  CC      drivers/iommu/intel/pasid.o
  CC      fs/efivarfs/vars.o
  CC      kernel/trace/trace_event_perf.o
  AR      drivers/tty/ipwireless/built-in.a
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ehl-match.o
  CC      drivers/tty/serial/8250/8250_rsa.o
  CC [M]  drivers/regulator/aw37503-regulator.o
  CC [M]  drivers/pci/pci-stub.o
  LD [M]  sound/hda/snd-intel-dspcfg.o
  LD [M]  net/ipv6/netfilter/nf_defrag_ipv6.o
  LD [M]  sound/hda/snd-intel-sdw-acpi.o
  CC      kernel/bpf/disasm.o
  CC [M]  drivers/char/xillybus/xillyusb.o
  CC      arch/x86/kvm/kvm-asm-offsets.s
  CC      drivers/tty/vt/defkeymap.o
  CC      mm/swap_state.o
  CC [M]  drivers/iommu/iommufd/eventq.o
  CC      drivers/tty/tty_io.o
  CC [M]  crypto/cmac.o
  CC      drivers/iommu/iommu-traces.o
  CC      drivers/acpi/acpica/tbutils.o
  CC [M]  drivers/gpu/drm/tests/drm_dp_mst_helper_test.o
  CC      drivers/char/misc.o
  CC [M]  fs/netfs/iterator.o
  CC [M]  fs/nls/nls_iso8859-13.o
  CC      net/ipv6/icmp.o
  LD [M]  sound/soc/intel/atom/snd-soc-sst-atom-hifi2-platform.o
  CC      kernel/trace/trace_events_filter.o
  CONMK   drivers/tty/vt/consolemap_deftbl.c
  CC      drivers/tty/vt/consolemap_deftbl.o
  CC [M]  fs/netfs/locking.o
  CC      drivers/iommu/intel/nested.o
  AR      drivers/tty/vt/built-in.a
  CC      drivers/acpi/acpica/tbxface.o
  CC [M]  crypto/xcbc.o
  CC [M]  crypto/md4.o
  CC [M]  net/netfilter/nf_conntrack_tftp.o
  CC      arch/x86/kernel/hw_breakpoint.o
  CC [M]  drivers/tty/serial/jsm/jsm_neo.o
  CC      net/ipv4/tcp_recovery.o
  CC      fs/btrfs/file.o
  AR      fs/efivarfs/built-in.a
  CC [M]  drivers/pci/pci-pf-stub.o
  CC      drivers/char/tpm/tpmrm-dev.o
  CC      drivers/acpi/acpica/tbxfload.o
  CC [M]  crypto/rmd160.o
  CC [M]  crypto/sm3.o
  CC [M]  net/netfilter/nf_log_syslog.o
  CC      kernel/bpf/mprog.o
  CC      arch/x86/kernel/tsc.o
  CC      drivers/xen/xen-acpi-pad.o
  CC      fs/ntfs3/super.o
  CC [M]  drivers/regulator/axp20x-regulator.o
  CC      drivers/tty/serial/serial_core.o
  CC [M]  fs/nls/nls_iso8859-14.o
  CC      drivers/char/virtio_console.o
  CC      net/core/failover.o
  CC      drivers/tty/serdev/serdev-ttyport.o
  CC      drivers/char/hpet.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-jsl-match.o
  CC      arch/x86/kernel/tsc_msr.o
  CC      drivers/gpu/drm/clients/drm_client_setup.o
  CC [M]  drivers/iommu/iommufd/hw_pagetable.o
  CC      drivers/acpi/nvs.o
  CC [M]  drivers/gpu/drm/tests/drm_exec_test.o
  CC [M]  arch/x86/kvm/vmx/pmu_intel.o
  CC [M]  drivers/gpu/drm/tests/drm_format_helper_test.o
  CC      drivers/tty/serial/8250/8250_port.o
  AR      drivers/gpu/drm/display/built-in.a
  CC [M]  drivers/gpu/drm/display/drm_display_helper_mod.o
  CC      net/ipv4/tcp_ulp.o
  CC      drivers/tty/n_tty.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-adl-match.o
  CC [M]  drivers/gpu/drm/display/drm_bridge_connector.o
  CC      kernel/trace/trace_events_trigger.o
  CC      drivers/char/tpm/tpm2-space.o
  CC [M]  drivers/pci/xen-pcifront.o
  CC      drivers/iommu/intel/cache.o
  CC [M]  fs/nls/nls_iso8859-15.o
  AR      drivers/gpu/drm/renesas/rcar-du/built-in.a
  AR      drivers/gpu/drm/renesas/rz-du/built-in.a
  CC      drivers/acpi/acpica/tbxfroot.o
  CC [M]  arch/x86/kvm/vmx/vmcs12.o
  AR      drivers/gpu/drm/renesas/built-in.a
  CC [M]  fs/netfs/main.o
  CC      drivers/xen/pcpu.o
  CC [M]  crypto/sm3_generic.o
  CC [M]  drivers/tty/serial/jsm/jsm_tty.o
  CC      drivers/iommu/intel/prq.o
  AR      drivers/tty/serdev/built-in.a
  CC      drivers/gpu/drm/clients/drm_fbdev_client.o
  CC      net/ipv4/tcp_offload.o
  CC      mm/swapfile.o
  CC [M]  crypto/streebog_generic.o
  CC [M]  drivers/regulator/bcm590xx-regulator.o
  CC      kernel/bpf/trampoline.o
  CC      net/ipv6/mcast.o
  CC      drivers/acpi/wakeup.o
  CC      kernel/trace/trace_eprobe.o
  CC      drivers/acpi/acpica/utaddress.o
  CC      mm/zswap.o
  CC      fs/ntfs3/upcase.o
  CC [M]  drivers/tty/serial/jsm/jsm_cls.o
  CC      kernel/trace/trace_events_inject.o
  CC [M]  drivers/gpu/drm/tests/drm_format_test.o
  CC [M]  drivers/iommu/iommufd/io_pagetable.o
  CC [M]  fs/nls/nls_koi8-r.o
  CC [M]  drivers/char/uv_mmtimer.o
  CC [M]  drivers/regulator/bd9571mwv-regulator.o
  CC      arch/x86/kernel/io_delay.o
  CC [M]  net/netfilter/nf_nat_core.o
  CC      lib/min_heap.o
  CC [M]  fs/nfs/filelayout/filelayout.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-rpl-match.o
  CC [M]  fs/lockd/clntlock.o
  CC      drivers/char/tpm/tpm-sysfs.o
  CC [M]  arch/x86/kvm/vmx/nested.o
  CC      drivers/acpi/acpica/utalloc.o
  CC [M]  fs/nfs/filelayout/filelayoutdev.o
  CC      drivers/xen/biomerge.o
  CC      kernel/trace/trace_events_synth.o
  CC      net/core/skmsg.o
  CC [M]  crypto/wp512.o
  AR      drivers/pci/built-in.a
  CC      fs/btrfs/defrag.o
  AR      drivers/gpu/drm/clients/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_framebuffer_test.o
  CC [M]  drivers/gpu/drm/display/drm_dp_dual_mode_helper.o
  CC [M]  fs/nfs/blocklayout/blocklayout.o
  CC [M]  fs/nfs/blocklayout/dev.o
  CC [M]  fs/nls/nls_koi8-u.o
  CC [M]  net/netfilter/nf_nat_proto.o
  CC [M]  fs/nfs/flexfilelayout/flexfilelayout.o
  CC      drivers/tty/tty_ioctl.o
  CC [M]  drivers/gpu/drm/display/drm_dp_helper.o
  CC [M]  fs/nfs/blocklayout/extent_tree.o
  CC      fs/ntfs3/xattr.o
  CC      drivers/iommu/intel/trace.o
  CC [M]  drivers/gpu/drm/tests/drm_gem_shmem_test.o
  CC [M]  drivers/regulator/da903x-regulator.o
  LD [M]  drivers/tty/serial/jsm/jsm.o
  CC      drivers/acpi/acpica/utascii.o
  CC      drivers/iommu/iommu-sysfs.o
  CC      kernel/user.o
  CC      mm/dmapool.o
  CC      arch/x86/kernel/rtc.o
  CC [M]  fs/nfs/flexfilelayout/flexfilelayoutdev.o
  CC [M]  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.o
  CC      drivers/tty/serial/8250/8250_dma.o
  CC      drivers/tty/serial/8250/8250_dwlib.o
  CC      drivers/xen/xen-balloon.o
  CC [M]  drivers/gpu/drm/tests/drm_managed_test.o
  CC      drivers/char/tpm/eventlog/common.o
  CC [M]  drivers/iommu/iommufd/ioas.o
  CC [M]  fs/nls/nls_koi8-ru.o
  CC      kernel/bpf/btf.o
  CC      drivers/acpi/acpica/utbuffer.o
  CC      net/dns_resolver/dns_key.o
  CC      net/switchdev/switchdev.o
  CC      net/l3mdev/l3mdev.o
  CC      lib/nmi_backtrace.o
  CC [M]  crypto/pcbc.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-mtl-match.o
  CC [M]  net/netfilter/nf_nat_helper.o
  CC      net/dns_resolver/dns_query.o
  CC [M]  drivers/regulator/da9052-regulator.o
  CC      net/ipv6/reassembly.o
  CC      drivers/acpi/acpica/utcksum.o
  CC [M]  fs/netfs/misc.o
  CC [M]  fs/nls/nls_utf8.o
  CC [M]  fs/nfs/blocklayout/rpc_pipefs.o
  CC      fs/ntfs3/lib/decompress_common.o
  CC [M]  drivers/char/lp.o
  CC      fs/btrfs/extent_map.o
  CC [M]  drivers/gpu/drm/display/drm_dp_mst_topology.o
  CC      drivers/char/tpm/eventlog/tpm1.o
  CC      drivers/iommu/intel/svm.o
  CC [M]  crypto/lrw.o
  CC      arch/x86/kernel/resource.o
  CC      net/ipv4/tcp_plb.o
  AS      arch/x86/kernel/irqflags.o
  CC [M]  fs/lockd/clntproc.o
  LD [M]  fs/nfs/filelayout/nfs_layout_nfsv41_files.o
  CC      drivers/tty/serial/8250/8250_fintek.o
  CC [M]  drivers/char/applicom.o
  CC [M]  drivers/regulator/da9055-regulator.o
  CC [M]  fs/netfs/objects.o
  CC      lib/objpool.o
  AR      drivers/gpu/drm/omapdrm/built-in.a
  CC [M]  drivers/regulator/da9062-regulator.o
  CC [M]  net/netfilter/nf_nat_redirect.o
  CC      mm/hugetlb.o
  CC      drivers/acpi/acpica/utcopy.o
  CC [M]  drivers/iommu/iommufd/main.o
  CC      kernel/trace/trace_events_hist.o
  CC      drivers/xen/sys-hypervisor.o
  CC [M]  arch/x86/kvm/vmx/posted_intr.o
  CC      fs/ntfs3/lib/lzx_decompress.o
  CC [M]  net/netfilter/nf_nat_masquerade.o
  CC [M]  fs/smb/common/cifs_arc4.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-arl-match.o
  CC [M]  fs/smb/client/trace.o
  CC [M]  fs/smb/common/cifs_md4.o
  CC [M]  fs/nls/mac-celtic.o
  CC      arch/x86/kernel/static_call.o
  CC [M]  fs/smb/client/cifsfs.o
  CC [M]  drivers/regulator/da9210-regulator.o
  CC      arch/x86/kernel/process.o
  CC [M]  fs/lockd/clntxdr.o
  CC [M]  crypto/xctr.o
  CC      drivers/acpi/acpica/utexcep.o
  CC [M]  fs/nls/mac-centeuro.o
  CC      drivers/char/tpm/eventlog/tpm2.o
  CC      drivers/tty/serial/8250/8250_pcilib.o
  CC [M]  drivers/gpu/drm/tests/drm_mm_test.o
  CC      drivers/iommu/intel/irq_remapping.o
  AR      net/dns_resolver/built-in.a
  CC [M]  crypto/hctr2.o
  CC      lib/plist.o
  CC [M]  fs/lockd/host.o
  CC      lib/radix-tree.o
  CC      fs/ntfs3/lib/xpress_decompress.o
  CC [M]  fs/lockd/svc.o
  LD [M]  fs/nfs/blocklayout/blocklayoutdriver.o
  LD [M]  fs/nfs/flexfilelayout/nfs_layout_flexfiles.o
  AR      net/l3mdev/built-in.a
  CC [M]  fs/netfs/read_collect.o
  CC      drivers/tty/serial/8250/8250_early.o
  CC [M]  fs/nfs/client.o
  CC [M]  fs/netfs/read_pgpriv2.o
  CC      drivers/tty/serial/8250/8250_dw.o
  CC [M]  fs/nfs/dir.o
  CC      drivers/xen/platform-pci.o
  CC      drivers/tty/serial/8250/8250_mid.o
  CC [M]  drivers/gpu/drm/display/drm_dp_tunnel.o
  CC      fs/btrfs/sysfs.o
  CC      drivers/acpi/acpica/utdebug.o
  CC      drivers/xen/swiotlb-xen.o
  CC      net/core/sock_map.o
  CC      drivers/acpi/sleep.o
  CC [M]  net/netfilter/nf_nat_ovs.o
  CC [M]  drivers/regulator/da9211-regulator.o
  CC [M]  fs/nls/mac-croatian.o
  CC      kernel/bpf/memalloc.o
  AR      fs/ntfs3/built-in.a
  CC [M]  sound/soc/intel/common/soc-acpi-intel-lnl-match.o
  CC      kernel/bpf/rqspinlock.o
  AR      net/switchdev/built-in.a
  CC [M]  net/netfilter/nf_nat_amanda.o
  CC [M]  fs/lockd/svclock.o
  CC      kernel/bpf/arena.o
  CC [M]  drivers/iommu/iommufd/pages.o
  CC [M]  fs/nls/mac-cyrillic.o
  CC [M]  drivers/gpu/drm/tests/drm_modes_test.o
  CC      drivers/tty/tty_ldisc.o
  CC      drivers/connector/cn_queue.o
  CC      drivers/char/tpm/tpm-buf.o
  CC [M]  crypto/adiantum.o
  CC      net/ipv6/tcp_ipv6.o
  CC [M]  drivers/char/nvram.o
  CC      drivers/connector/connector.o
  CC [M]  fs/netfs/read_retry.o
  CC      net/ipv4/datagram.o
  CC      drivers/acpi/device_sysfs.o
  CC      drivers/char/tpm/tpm2-sessions.o
  CC      drivers/tty/serial/8250/8250_pci.o
  CC      drivers/acpi/acpica/utdecode.o
  CC      net/ncsi/ncsi-cmd.o
  CC      drivers/tty/serial/serial_base_bus.o
  CC [M]  fs/nls/mac-gaelic.o
  CC      drivers/acpi/acpica/utdelete.o
  CC      net/ncsi/ncsi-rsp.o
  CC [M]  drivers/regulator/fan53555.o
  CC      drivers/xen/mcelog.o
  CC [M]  drivers/gpu/drm/tests/drm_plane_helper_test.o
  CC      drivers/iommu/intel/perfmon.o
  CC      fs/btrfs/accessors.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ptl-match.o
  CC      lib/ratelimit.o
  CC [M]  net/netfilter/nf_nat_ftp.o
  CC      fs/btrfs/xattr.o
  CC [M]  crypto/nhpoly1305.o
  CC      mm/hugetlb_vmemmap.o
  CC      arch/x86/kernel/ptrace.o
  CC      kernel/signal.o
  CC [M]  drivers/char/ppdev.o
  CC      lib/rbtree.o
  CC      drivers/tty/tty_buffer.o
  CC      drivers/acpi/acpica/uterror.o
  CC [M]  fs/nls/mac-greek.o
  CC      kernel/bpf/range_tree.o
  AR      drivers/gpu/drm/tilcdc/built-in.a
  CC [M]  drivers/char/tlclk.o
  CC [M]  fs/lockd/svcshare.o
  CC [M]  drivers/char/hangcheck-timer.o
  CC [M]  drivers/regulator/gpio-regulator.o
  CC      net/core/bpf_sk_storage.o
  CC [M]  fs/smb/client/cifs_debug.o
  CC      net/ncsi/ncsi-aen.o
  CC [M]  fs/netfs/read_single.o
  CC [M]  drivers/iommu/iommufd/vfio_compat.o
  CC [M]  fs/nfs/file.o
  CC [M]  fs/nfs/getroot.o
  CC      net/ipv4/raw.o
  CC      drivers/char/tpm/tpm_ppi.o
  CC [M]  fs/netfs/rolling_buffer.o
  CC [M]  drivers/gpu/drm/tests/drm_probe_helper_test.o
  CC [M]  fs/nls/mac-iceland.o
  CC      drivers/xen/xen-acpi-processor.o
  CC [M]  drivers/gpu/drm/tests/drm_rect_test.o
  CC      drivers/acpi/acpica/uteval.o
  CC      drivers/base/power/sysfs.o
  CC      drivers/xen/efi.o
  CC      lib/seq_buf.o
  CC      net/mctp/af_mctp.o
  CC [M]  drivers/gpu/drm/display/drm_dsc_helper.o
  CC      drivers/connector/cn_proc.o
  CC      kernel/trace/trace_events_user.o
  CC [M]  fs/romfs/storage.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-hda-match.o
  CC [M]  fs/autofs/init.o
  CC [M]  crypto/ccm.o
  CC      net/ipv4/udp.o
  AR      drivers/iommu/intel/built-in.a
  CC      kernel/trace/bpf_trace.o
  CC [M]  net/netfilter/nf_nat_irc.o
  CC [M]  fs/nls/mac-inuit.o
  CC [M]  fs/fuse/dev.o
  CC [M]  drivers/regulator/isl6271a-regulator.o
  CC      drivers/acpi/acpica/utglobal.o
  CC [M]  net/netfilter/nf_nat_sip.o
  CC [M]  fs/smb/client/connect.o
  CC      drivers/tty/serial/8250/8250_rt288x.o
  CC [M]  fs/lockd/svcproc.o
  CC      fs/btrfs/ordered-data.o
  CC      arch/x86/kernel/tls.o
  CC      net/core/devmem.o
  AR      drivers/gpu/drm/imx/built-in.a
  CC      drivers/acpi/acpica/uthex.o
  CC [M]  drivers/regulator/isl9305.o
  CC      drivers/acpi/acpica/utids.o
  CC      drivers/char/tpm/eventlog/acpi.o
  CC      drivers/xen/xlate_mmu.o
  CC      net/ncsi/ncsi-manage.o
  CC [M]  fs/nls/mac-romanian.o
  CC [M]  drivers/iommu/iommufd/viommu.o
  CC [M]  fs/nls/mac-roman.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.o
  CC [M]  fs/romfs/super.o
  CC      drivers/base/firmware_loader/builtin/main.o
  CC [M]  fs/autofs/inode.o
  CC      drivers/base/firmware_loader/fallback_table.o
  CC      kernel/bpf/dispatcher.o
  CC [M]  fs/netfs/write_collect.o
  CC [M]  drivers/tty/serial/8250/8250_exar.o
  CC      drivers/tty/serial/serial_ctrl.o
  CC      drivers/base/power/generic_ops.o
  CC      lib/siphash.o
  CC      drivers/acpi/acpica/utinit.o
  CC [M]  sound/sound_core.o
  CC      arch/x86/kernel/step.o
  CC [M]  crypto/chacha20poly1305.o
  CC      drivers/tty/serial/serial_port.o
  CC      drivers/base/power/common.o
  CC [M]  drivers/regulator/lm363x-regulator.o
  AR      drivers/connector/built-in.a
  CC      net/ncsi/ncsi-netlink.o
  CC [M]  drivers/tty/serial/8250/8250_lpss.o
  CC [M]  fs/smb/client/dir.o
  CC      drivers/char/tpm/eventlog/efi.o
  CC      drivers/tty/tty_port.o
  CC [M]  fs/nls/mac-turkish.o
  CC [M]  arch/x86/kvm/vmx/main.o
  CC [M]  net/netfilter/nf_nat_tftp.o
  CC      net/mctp/device.o
  CC      net/mctp/route.o
  CC      kernel/sys.o
  AR      drivers/iommu/iommufd/built-in.a
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ssp-common.o
  LD [M]  drivers/iommu/iommufd/iommufd.o
  CC      drivers/acpi/acpica/utlock.o
  CC      drivers/iommu/dma-iommu.o
  CC [M]  drivers/gpu/drm/display/drm_hdcp_helper.o
  AR      drivers/base/firmware_loader/builtin/built-in.a
  CC      drivers/acpi/device_pm.o
  CC [M]  fs/autofs/root.o
  CC      mm/mempolicy.o
  CC [M]  fs/autofs/symlink.o
  CC [M]  fs/lockd/svcsubs.o
  CC [M]  net/core/pktgen.o
  CC      lib/string.o
  LD [M]  fs/romfs/romfs.o
  CC [M]  fs/smb/client/file.o
  CC      net/ipv6/ping.o
  CC [M]  net/netfilter/nf_synproxy_core.o
  CC [M]  fs/smb/client/inode.o
  CC      kernel/bpf/devmap.o
  CC      drivers/xen/unpopulated-alloc.o
  CC      arch/x86/kernel/tboot.o
  CC [M]  arch/x86/kvm/vmx/sgx.o
  CC      drivers/acpi/acpica/utmath.o
  CC [M]  fs/nls/nls_ucs2_utils.o
  CC      drivers/char/tpm/tpm_tis_core.o
  CC [M]  fs/nfs/inode.o
  CC      fs/btrfs/extent_io.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_audio_helper.o
  CC [M]  crypto/aegis128-core.o
  CC      lib/timerqueue.o
  CC [M]  drivers/regulator/lp3971.o
  CC      drivers/tty/tty_mutex.o
  CC [M]  drivers/tty/serial/8250/8250_men_mcb.o
  CC      drivers/base/firmware_loader/main.o
  CC [M]  fs/overlayfs/super.o
  CC [M]  fs/overlayfs/namei.o
  CC      net/ipv4/udplite.o
  CC      drivers/base/power/qos.o
  CC [M]  net/netfilter/nf_conncount.o
  CC      drivers/acpi/acpica/utmisc.o
  CC      drivers/tty/serial/earlycon.o
  CC      net/mctp/neigh.o
  CC [M]  fs/autofs/waitq.o
  CC      lib/union_find.o
  CC      drivers/xen/grant-dma-ops.o
  CC [M]  fs/netfs/write_issue.o
  CC      net/ipv4/udp_offload.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-sdca-quirks.o
  CC      lib/vsprintf.o
  CC      drivers/tty/tty_ldsem.o
  CC [M]  drivers/tty/serial/8250/8250_pci1xxxx.o
  CC      drivers/acpi/acpica/utmutex.o
  CC      drivers/tty/tty_baudrate.o
  CC      arch/x86/kernel/i8237.o
  CC [M]  fs/fuse/dir.o
  CC [M]  drivers/regulator/lp3972.o
  CC [M]  crypto/pcrypt.o
  CC      drivers/acpi/acpica/utnonansi.o
  CC [M]  drivers/tty/serial/8250/8250_pericom.o
  AR      net/ncsi/built-in.a
  CC [M]  arch/x86/kvm/vmx/hyperv.o
  CC [M]  fs/netfs/write_retry.o
  CC      mm/sparse.o
  CC      net/handshake/alert.o
  AR      fs/nls/built-in.a
  CC [M]  net/netfilter/nf_dup_netdev.o
  CC [M]  fs/nfs/super.o
  CC [M]  fs/smb/client/link.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_cec_helper.o
  CC [M]  drivers/block/xen-blkback/blkback.o
  CC [M]  fs/overlayfs/util.o
  CC      arch/x86/kernel/stacktrace.o
  CC      kernel/bpf/cpumap.o
  CC [M]  drivers/xen/evtchn.o
  CC [M]  fs/smb/client/misc.o
  CC [M]  fs/lockd/mon.o
  CC [M]  fs/overlayfs/inode.o
  CC [M]  fs/smb/client/netmisc.o
  CC [M]  fs/autofs/expire.o
  CC      drivers/iommu/io-pgtable.o
  CC      drivers/acpi/acpica/utobject.o
  CC      drivers/char/tpm/tpm_tis.o
  AR      net/mctp/built-in.a
  CC [M]  drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.o
  CC      net/ipv6/exthdrs.o
  CC      kernel/trace/trace_kprobe.o
  CC [M]  crypto/cryptd.o
  LD [M]  sound/soc/intel/common/snd-soc-acpi-intel-match.o
  LD [M]  sound/soc/intel/common/snd-soc-acpi-intel-sdca-quirks.o
  CC [M]  crypto/des_generic.o
  CC [M]  sound/soc/sdca/sdca_functions.o
  AR      drivers/tty/serial/8250/built-in.a
  CC      drivers/tty/serial/max310x.o
  CC [M]  drivers/regulator/lp872x.o
  CC      net/ipv6/datagram.o
  CC      drivers/base/firmware_loader/fallback.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_helper.o
  CC [M]  net/netfilter/nf_tables_core.o
  CC      drivers/base/power/runtime.o
  CC      arch/x86/kernel/reboot.o
  CC [M]  fs/lockd/trace.o
  CC      drivers/acpi/acpica/utosi.o
  CC [M]  fs/lockd/xdr.o
  AR      drivers/gpu/drm/panel/built-in.a
  CC [M]  drivers/gpu/drm/panel/panel-auo-a030jtn01.o
  AR      drivers/gpu/drm/bridge/analogix/built-in.a
  CC [M]  arch/x86/kvm/vmx/hyperv_evmcs.o
  CC [M]  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.o
  CC [M]  fs/netfs/stats.o
  AR      drivers/gpu/drm/bridge/cadence/built-in.a
  CC [M]  drivers/xen/gntdev.o
  AR      drivers/gpu/drm/hisilicon/built-in.a
  CC      drivers/tty/tty_jobctrl.o
  CC [M]  fs/autofs/dev-ioctl.o
  CC      drivers/char/tpm/tpm_crb.o
  CC [M]  fs/nfs/io.o
  CC [M]  fs/fuse/file.o
  CC      drivers/base/regmap/regmap.o
  CC [M]  drivers/xen/gntdev-dmabuf.o
  CC [M]  fs/overlayfs/file.o
  CC      drivers/iommu/iova.o
  CC      drivers/acpi/acpica/utownerid.o
  CC [M]  crypto/fcrypt.o
  CC [M]  crypto/blowfish_generic.o
  CC [M]  drivers/block/xen-blkback/xenbus.o
  CC      net/ipv4/arp.o
  CC      fs/btrfs/volumes.o
  CC [M]  net/netfilter/nf_tables_api.o
  CC      mm/sparse-vmemmap.o
  CC [M]  crypto/blowfish_common.o
  CC      drivers/base/firmware_loader/fallback_platform.o
  AR      drivers/misc/eeprom/built-in.a
  CC [M]  drivers/misc/eeprom/at24.o
  CC [M]  drivers/regulator/lp8788-buck.o
  AR      net/core/built-in.a
  CC [M]  drivers/misc/eeprom/at25.o
  CC      drivers/tty/serial/sccnxp.o
  CC      kernel/bpf/offload.o
  CC      fs/btrfs/async-thread.o
  CC      kernel/trace/error_report-traces.o
  CC      drivers/acpi/acpica/utpredef.o
  CC [M]  drivers/gpu/drm/panel/panel-ilitek-ili9341.o
  CC [M]  net/llc/llc_core.o
  CC      kernel/trace/power-traces.o
  CC [M]  drivers/gpu/drm/display/drm_scdc_helper.o
  CC [M]  arch/x86/kvm/vmx/vmx_onhyperv.o
  CC      kernel/trace/rpm-traces.o
  CC      net/handshake/genl.o
  CC [M]  fs/netfs/fscache_cache.o
  CC [M]  drivers/char/tpm/tpm_tis_spi_main.o
  CC [M]  fs/smb/client/smbencrypt.o
  CC [M]  fs/lockd/netlink.o
  CC [M]  drivers/gpu/drm/bridge/analogix/analogix_dp_core.o
  LD [M]  fs/autofs/autofs4.o
  CC [M]  crypto/twofish_generic.o
  CC      net/ipv6/ip6_flowlabel.o
  CC [M]  fs/smb/client/transport.o
  CC [M]  drivers/block/drbd/drbd_buildtag.o
  CC [M]  sound/soc/sdca/sdca_device.o
  CC [M]  fs/fuse/inode.o
  CC      arch/x86/kernel/early-quirks.o
  CC      drivers/acpi/acpica/utresdecode.o
  CC [M]  fs/nfs/direct.o
  CC      net/ipv6/inet6_connection_sock.o
  CC      drivers/base/firmware_loader/sysfs.o
  CC [M]  fs/overlayfs/dir.o
  CC [M]  net/llc/llc_input.o
  CC      drivers/base/power/wakeirq.o
  CC [M]  drivers/xen/gntalloc.o
  CC [M]  drivers/regulator/lp8788-ldo.o
  CC      net/ipv6/udp_offload.o
  CC [M]  net/llc/llc_output.o
  CC [M]  drivers/misc/eeprom/max6875.o
  CC      mm/mmu_notifier.o
  CC      lib/win_minmax.o
  CC      kernel/trace/trace_kdb.o
  CC      drivers/acpi/acpica/utresrc.o
  CC      drivers/iommu/irq_remapping.o
  CC [M]  drivers/gpu/drm/panel/panel-orisetech-ota5601a.o
  CC [M]  drivers/block/drbd/drbd_bitmap.o
  CC      drivers/tty/serial/serial_mctrl_gpio.o
  CC [M]  sound/soc/sdca/sdca_regmap.o
  CC      net/handshake/netlink.o
  CC [M]  fs/fuse/control.o
  CC [M]  arch/x86/kvm/svm/svm.o
  LD [M]  drivers/block/xen-blkback/xen-blkback.o
../drivers/gpu/drm/bridge/analogix/analogix_dp_core.c: In function ‘analogix_dp_probe’:
../drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1589:17: error: label ‘err_disable_clk’ used but not defined
 1589 |                 goto err_disable_clk;
      |                 ^~~~
  CC      drivers/iommu/hyperv-iommu.o
  CC [M]  drivers/char/tpm/tpm_tis_spi_cr50.o
  CC [M]  crypto/twofish_common.o
make[8]: *** [../scripts/Makefile.build:203: drivers/gpu/drm/bridge/analogix/analogix_dp_core.o] Error 1
make[7]: *** [../scripts/Makefile.build:461: drivers/gpu/drm/bridge/analogix] Error 2
make[6]: *** [../scripts/Makefile.build:461: drivers/gpu/drm/bridge] Error 2
make[6]: *** Waiting for unfinished jobs....
  CC [M]  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.o
  CC [M]  fs/lockd/clnt4xdr.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_state_helper.o
  CC [M]  fs/nfs/pagelist.o
  CC [M]  net/llc/llc_if.o
  CC      drivers/acpi/acpica/utstate.o
  CC [M]  drivers/regulator/lp8755.o
  CC      drivers/base/firmware_loader/sysfs_upload.o
  CC      arch/x86/kernel/smp.o
  CC [M]  net/llc/llc_c_ev.o
  CC      drivers/tty/n_null.o
  CC [M]  drivers/xen/privcmd.o
  CC [M]  drivers/regulator/ltc3589.o
  CC [M]  drivers/misc/eeprom/eeprom_93cx6.o
  CC [M]  fs/netfs/fscache_cookie.o
  CC      drivers/base/power/main.o
  CC [M]  fs/overlayfs/readdir.o
  CC      lib/xarray.o
  CC      fs/btrfs/ioctl.o
  CC      drivers/acpi/proc.o
  CC [M]  drivers/block/mtip32xx/mtip32xx.o
  CC      kernel/trace/trace_dynevent.o
  CC      drivers/acpi/acpica/utstring.o
  CC [M]  fs/smb/client/cached_dir.o
  CC [M]  drivers/xen/privcmd-buf.o
  CC      net/ipv6/seg6.o
  CC [M]  drivers/char/tpm/tpm_tis_i2c_cr50.o
  CC [M]  drivers/gpu/drm/panel/panel-widechips-ws2401.o
  CC [M]  drivers/char/tpm/tpm_tis_i2c.o
  CC [M]  fs/9p/vfs_super.o
  AR      drivers/base/test/built-in.a
  CC      drivers/iommu/virtio-iommu.o
  CC [M]  fs/9p/vfs_inode.o
  LD [M]  sound/soc/sdca/snd-soc-sdca.o
  CC      kernel/bpf/net_namespace.o
  CC      drivers/tty/serial/kgdboc.o
  CC      mm/ksm.o
  CC      net/ipv4/icmp.o
  CC      drivers/mfd/88pm860x-core.o
  CC [M]  fs/lockd/xdr4.o
  CC      lib/lockref.o
  CC      drivers/acpi/acpica/utstrsuppt.o
  CC      drivers/base/regmap/regcache.o
  CC [M]  sound/soc/soc-acpi.o
  CC [M]  drivers/regulator/ltc3676.o
  CC [M]  fs/9p/vfs_inode_dotl.o
  CC [M]  fs/fuse/xattr.o
  AR      drivers/base/firmware_loader/built-in.a
  CC [M]  drivers/gpu/drm/display/drm_dp_aux_dev.o
  CC      drivers/base/regmap/regcache-rbtree.o
  CC      drivers/base/power/wakeup.o
  CC      kernel/umh.o
  CC [M]  drivers/xen/xen-scsiback.o
  CC [M]  drivers/misc/eeprom/eeprom_93xx46.o
  AR      drivers/misc/cb710/built-in.a
  CC [M]  drivers/misc/cb710/core.o
  CC [M]  net/llc/llc_c_ac.o
  CC [M]  fs/overlayfs/copy_up.o
  CC      drivers/acpi/acpica/utstrtoul64.o
  CC      net/handshake/request.o
  CC      drivers/tty/pty.o
  CC [M]  drivers/misc/cb710/sgbuf2.o
  CC [M]  drivers/char/tpm/tpm_i2c_atmel.o
  CC [M]  drivers/block/drbd/drbd_proc.o
  CC      drivers/base/regmap/regcache-flat.o
  CC      drivers/base/regmap/regcache-maple.o
  CC [M]  fs/smb/client/cifs_unicode.o
  CC      drivers/base/component.o
  AR      drivers/nfc/built-in.a
  CC [M]  drivers/tty/serial/altera_jtaguart.o
  CC [M]  crypto/serpent_generic.o
  CC      arch/x86/kernel/smpboot.o
  CC      net/ipv6/fib6_notifier.o
  CC      drivers/iommu/iommu-sva.o
  CC      drivers/mfd/88pm860x-i2c.o
  CC [M]  drivers/regulator/max14577-regulator.o
  CC [M]  fs/fuse/acl.o
  CC      net/ipv6/rpl.o
  CC      drivers/acpi/acpica/utxface.o
  CC      kernel/trace/trace_probe.o
  CC [M]  drivers/misc/eeprom/idt_89hpesx.o
  CC      kernel/bpf/tcx.o
  CC [M]  fs/lockd/svc4proc.o
  CC [M]  fs/9p/vfs_addr.o
  CC [M]  fs/fuse/readdir.o
  CC      arch/x86/kernel/tsc_sync.o
  CC [M]  fs/netfs/fscache_io.o
  CC [M]  drivers/gpu/drm/display/drm_dp_cec.o
  AR      drivers/misc/lis3lv02d/built-in.a
  CC [M]  drivers/misc/lis3lv02d/lis3lv02d.o
  CC      kernel/bpf/stackmap.o
  CC [M]  fs/netfs/fscache_main.o
  CC [M]  sound/soc/soc-core.o
  CC      lib/bcd.o
  CC [M]  fs/netfs/fscache_volume.o
  CC [M]  drivers/char/tpm/tpm_i2c_infineon.o
  CC      lib/sort.o
  CC      drivers/base/regmap/regmap-debugfs.o
  CC [M]  fs/fuse/ioctl.o
  CC [M]  drivers/tty/serial/altera_uart.o
  CC [M]  fs/fuse/iomode.o
  CC [M]  fs/nfs/read.o
  CC [M]  fs/9p/vfs_file.o
  CC      net/handshake/tlshd.o
  CC [M]  drivers/xen/pvcalls-front.o
  CC [M]  net/netfilter/nft_chain_filter.o
  CC [M]  sound/ac97_bus.o
  CC      kernel/bpf/cgroup_iter.o
  CC      drivers/acpi/acpica/utxfinit.o
  CC [M]  drivers/regulator/max1586.o
  CC [M]  fs/overlayfs/export.o
  CC      drivers/mfd/wm8400-core.o
  CC [M]  net/llc/llc_conn.o
  LD [M]  drivers/misc/cb710/cb710.o
  CC      mm/page_poison.o
  CC [M]  net/netfilter/nf_tables_trace.o
  CC [M]  fs/smb/client/nterr.o
  CC      kernel/trace/trace_uprobe.o
  CC [M]  drivers/block/zram/zcomp.o
  CC      drivers/base/power/wakeup_stats.o
  CC      lib/parser.o
  CC      net/ipv6/ioam6.o
  CC [M]  drivers/misc/eeprom/ee1004.o
  CC      mm/memtest.o
  CC [M]  drivers/block/drbd/drbd_worker.o
  CC      drivers/iommu/io-pgfault.o
  UPD     arch/x86/kvm/kvm-asm-offsets.h
  CC [M]  arch/x86/kvm/svm/pmu.o
  CC      drivers/acpi/acpica/utxferror.o
  CC [M]  drivers/block/zram/zram_drv.o
  CC      mm/migrate.o
  CC      mm/memory-tiers.o
  CC      drivers/base/regmap/regmap-i2c.o
  CC [M]  fs/smb/client/cifsencrypt.o
  CC [M]  drivers/char/tpm/tpm_i2c_nuvoton.o
  CC [M]  fs/lockd/procfs.o
  CC [M]  drivers/tty/serial/arc_uart.o
  CC [M]  fs/9p/vfs_dir.o
  CC      fs/btrfs/orphan.o
  CC      fs/btrfs/locking.o
  CC      drivers/acpi/acpica/utxfmutex.o
  CC      arch/x86/kernel/setup_percpu.o
  CC [M]  drivers/tty/serial/fsl_linflexuart.o
  CC [M]  drivers/regulator/max77503-regulator.o
  CC [M]  crypto/sm4.o
  CC      kernel/bpf/bpf_cgrp_storage.o
  CC      drivers/base/power/trace.o
  CC      net/ipv4/devinet.o
  LD [M]  drivers/gpu/drm/display/drm_display_helper.o
make[5]: *** [../scripts/Makefile.build:461: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:461: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
  CC      drivers/acpi/acpica/dbcmds.o
  CC [M]  fs/overlayfs/params.o
  CC [M]  drivers/block/drbd/drbd_receiver.o
  LD [M]  sound/soundcore.o
  CC      fs/btrfs/export.o
  CC [M]  drivers/misc/lis3lv02d/lis3lv02d_i2c.o
  CC [M]  sound/soc/soc-dapm.o
  CC      net/ipv6/sysctl_net_ipv6.o
  CC      lib/debug_locks.o
  CC [M]  fs/fuse/dax.o
  CC      lib/random32.o
  CC      kernel/workqueue.o
  CC [M]  fs/9p/vfs_dentry.o
  CC [M]  drivers/block/zram/backend_lzorle.o
  CC      fs/btrfs/tree-log.o
  CC      drivers/mfd/wm831x-core.o
  CC      fs/btrfs/free-space-cache.o
  CC [M]  net/llc/llc_c_st.o
  LD [M]  fs/lockd/lockd.o
  CC      drivers/base/regmap/regmap-spi.o
  CC [M]  arch/x86/kvm/svm/nested.o
  CC [M]  net/tls/tls_main.o
  CC [M]  fs/netfs/fscache_proc.o
  CC      fs/btrfs/zlib.o
  CC      drivers/acpi/acpica/dbconvert.o
  CC [M]  net/tls/tls_sw.o
  CC      net/handshake/trace.o
  CC [M]  arch/x86/kvm/svm/avic.o
  CC [M]  drivers/tty/serial/fsl_lpuart.o
  CC [M]  fs/netfs/fscache_stats.o
  CC [M]  drivers/char/tpm/tpm_nsc.o
  CC [M]  drivers/regulator/max77541-regulator.o
  AR      drivers/iommu/built-in.a
  CC [M]  sound/soc/soc-jack.o
  CC [M]  net/tls/tls_proc.o
  AR      drivers/misc/cardreader/built-in.a
  CC [M]  drivers/misc/cardreader/alcor_pci.o
  CC      lib/bust_spinlocks.o
  CC [M]  drivers/block/zram/backend_lzo.o
  CC [M]  crypto/sm4_generic.o
  CC      drivers/acpi/acpica/dbdisply.o
  CC [M]  sound/soc/soc-utils.o
  CC      kernel/bpf/cgroup.o
  CC      arch/x86/kernel/mpparse.o
  CC      kernel/bpf/reuseport_array.o
  CC      kernel/trace/trace_boot.o
  CC [M]  fs/9p/v9fs.o
  CC [M]  drivers/block/drbd/drbd_req.o
  CC [M]  fs/overlayfs/xattrs.o
  CC      kernel/trace/fprobe.o
  CC [M]  fs/nfs/symlink.o
  CC      drivers/acpi/acpica/dbexec.o
  CC      net/ipv6/ip6mr.o
  CC      drivers/base/power/clock_ops.o
  CC [M]  drivers/xen/xen-front-pgdir-shbuf.o
  CC      kernel/pid.o
  LD [M]  drivers/block/zram/zram.o
  CC      drivers/acpi/bus.o
  CC      drivers/tty/tty_audit.o
  CC [M]  fs/smb/client/readdir.o
  CC [M]  drivers/regulator/max8649.o
  CC [M]  net/llc/llc_pdu.o
  CC [M]  crypto/aes_ti.o
  CC [M]  drivers/char/tpm/tpm_atmel.o
  CC      drivers/mfd/wm831x-irq.o
  CC [M]  fs/9p/fid.o
  CC      lib/kasprintf.o
  CC      drivers/base/regmap/regmap-mmio.o
  CC      drivers/acpi/acpica/dbhistry.o
  CC      drivers/mfd/wm831x-otp.o
  LD [M]  fs/netfs/netfs.o
  CC [M]  fs/fuse/passthrough.o
  CC      mm/migrate_device.o
  CC      mm/huge_memory.o
  LD [M]  fs/overlayfs/overlay.o
  CC [M]  fs/fuse/sysctl.o
  CC [M]  fs/nfs/unlink.o
  AR      net/handshake/built-in.a
  CC      lib/bitmap.o
  CC [M]  drivers/misc/cardreader/rtsx_pcr.o
  CC      arch/x86/kernel/ftrace.o
  CC [M]  fs/fuse/dev_uring.o
  CC [M]  crypto/camellia_generic.o
  CC      drivers/base/regmap/regmap-irq.o
  CC [M]  fs/fuse/cuse.o
  CC      drivers/mfd/wm831x-auxadc.o
  CC [M]  fs/nfs/write.o
  CC [M]  fs/nfs/namespace.o
  CC [M]  net/netfilter/nft_immediate.o
  CC      kernel/task_work.o
  CC [M]  arch/x86/kvm/svm/sev.o
  CC      kernel/extable.o
  CC [M]  drivers/base/regmap/regmap-slimbus.o
  CC      drivers/acpi/acpica/dbinput.o
  CC      lib/scatterlist.o
  CC      lib/list_sort.o
  CC [M]  drivers/regulator/max8660.o
  CC [M]  drivers/char/tpm/tpm_infineon.o
  AR      drivers/base/power/built-in.a
  CC [M]  drivers/tty/serial/lantiq.o
  CC [M]  drivers/base/regmap/regmap-spmi.o
  CC [M]  fs/9p/xattr.o
  CC [M]  net/llc/llc_sap.o
  CC      drivers/acpi/acpica/dbmethod.o
  LD [M]  drivers/xen/xen-evtchn.o
  LD [M]  drivers/xen/xen-gntdev.o
  LD [M]  drivers/xen/xen-gntalloc.o
  CC [M]  drivers/char/tpm/xen-tpmfront.o
  LD [M]  drivers/xen/xen-privcmd.o
  AR      drivers/xen/built-in.a
  CC      kernel/params.o
  CC [M]  drivers/base/regmap/regmap-w1.o
  CC [M]  drivers/regulator/max8893.o
  CC      kernel/kthread.o
  CC [M]  drivers/regulator/max8907-regulator.o
  CC [M]  net/key/af_key.o
  CC      kernel/trace/rethook.o
  AR      drivers/misc/pvpanic/built-in.a
  CC [M]  drivers/misc/pvpanic/pvpanic.o
  CC      drivers/acpi/acpica/dbnames.o
  CC      drivers/mfd/wm831x-i2c.o
  CC [M]  drivers/misc/cardreader/rts5209.o
  AS      arch/x86/kernel/ftrace_64.o
  CC      net/ipv4/af_inet.o
  CC [M]  drivers/regulator/max8925-regulator.o
  CC [M]  net/netfilter/nft_cmp.o
  CC [M]  drivers/tty/serial/max3100.o
  CC [M]  fs/smb/client/ioctl.o
  CC [M]  sound/soc/soc-dai.o
  CC [M]  net/llc/llc_s_ac.o
  CC [M]  fs/9p/cache.o
  CC      mm/khugepaged.o
  CC      drivers/acpi/glue.o
  CC      kernel/trace/trace_fprobe.o
  CC [M]  fs/fuse/virtio_fs.o
  CC      drivers/acpi/scan.o
  CC [M]  net/tls/trace.o
  CC [M]  fs/cachefiles/cache.o
  CC [M]  drivers/misc/pvpanic/pvpanic-mmio.o
  CC [M]  fs/vboxsf/dir.o
  CC [M]  crypto/cast_common.o
  CC [M]  fs/vboxsf/file.o
  CC [M]  fs/cachefiles/daemon.o
  CC [M]  drivers/char/tpm/tpm_vtpm_proxy.o
  CC      arch/x86/kernel/trace_clock.o
  AR      drivers/misc/keba/built-in.a
  CC [M]  drivers/misc/keba/cp500.o
  CC [M]  arch/x86/kvm/svm/hyperv.o
  CC      drivers/acpi/acpica/dbobject.o
  CC [M]  drivers/tty/serial/men_z135_uart.o
  CC [M]  drivers/base/regmap/regmap-i3c.o
  CC      fs/btrfs/lzo.o
  CC      kernel/sys_ni.o
  CC      drivers/acpi/mipi-disco-img.o
  CC      net/ipv4/igmp.o
  CC [M]  net/tls/tls_strp.o
  CC      drivers/mfd/wm831x-spi.o
  CC      arch/x86/kernel/trace.o
  CC [M]  fs/nfs/mount_clnt.o
  CC [M]  drivers/regulator/max8952.o
  CC      lib/uuid.o
  CC [M]  fs/9p/acl.o
  CC [M]  drivers/misc/cardreader/rts5229.o
  CC      kernel/bpf/bpf_struct_ops.o
  CC      drivers/acpi/acpica/dbstats.o
  CC [M]  fs/smb/client/sess.o
  CC [M]  drivers/misc/pvpanic/pvpanic-pci.o
  CC      lib/iov_iter.o
  CC      lib/clz_ctz.o
  CC      arch/x86/kernel/rethook.o
  CC      drivers/acpi/resource.o
  CC [M]  net/netfilter/nft_range.o
  CC [M]  fs/vboxsf/utils.o
  CC [M]  drivers/block/null_blk/main.o
  CC [M]  net/llc/llc_s_ev.o
  CC      mm/page_counter.o
  CC [M]  drivers/block/null_blk/trace.o
  CC [M]  crypto/cast5_generic.o
  LD [M]  drivers/char/tpm/tpm_tis_spi.o
  AR      drivers/char/tpm/built-in.a
  AR      drivers/char/built-in.a
  CC      drivers/acpi/acpica/dbutils.o
  CC      fs/btrfs/zstd.o
  CC [M]  drivers/tty/serial/rp2.o
  CC [M]  fs/cachefiles/interface.o
  CC      drivers/base/core.o
  CC      drivers/mfd/wm8350-core.o
  CC      drivers/base/bus.o
  CC [M]  drivers/misc/cardreader/rtl8411.o
  CC [M]  sound/soc/soc-component.o
  CC [M]  drivers/misc/ibmasm/module.o
  CC      net/ipv6/xfrm6_policy.o
  CC      drivers/tty/sysrq.o
  CC [M]  sound/soc/soc-pcm.o
  CC [M]  drivers/block/drbd/drbd_actlog.o
  CC      drivers/block/loop.o
  CC [M]  fs/nfs/nfstrace.o
  CC [M]  fs/nfs/export.o
  CC [M]  net/netfilter/nft_bitwise.o
  CC [M]  arch/x86/kvm/svm/svm_onhyperv.o
  CC [M]  drivers/regulator/max8997-regulator.o
  CC [M]  net/netfilter/nft_byteorder.o
  CC      drivers/acpi/acpi_processor.o
  CC [M]  sound/soc/soc-devres.o
  LD [M]  fs/9p/9p.o
  LD [M]  fs/fuse/fuse.o
  AR      kernel/trace/built-in.a
  CC      drivers/acpi/processor_core.o
  LD [M]  fs/fuse/virtiofs.o
  CC [M]  drivers/misc/cardreader/rts5227.o
  CC [M]  drivers/base/regmap/regmap-spi-avmm.o
  CC [M]  drivers/regulator/max8998.o
  CC      drivers/acpi/acpica/dbxface.o
  CC      arch/x86/kernel/vmcore_info_64.o
  CC [M]  net/llc/llc_s_st.o
  CC [M]  drivers/misc/sgi-xp/xp_main.o
  CC [M]  net/netfilter/nft_payload.o
  CC [M]  fs/vboxsf/vboxsf_wrappers.o
  CC [M]  net/tls/tls_device.o
  CC [M]  drivers/regulator/max20086-regulator.o
  CC      drivers/mfd/wm8350-regmap.o
  CC      drivers/acpi/processor_pdc.o
  CC [M]  drivers/misc/ibmasm/ibmasmfs.o
  CC      fs/btrfs/compression.o
  CC      drivers/mfd/wm8350-gpio.o
  CC [M]  drivers/tty/serial/sc16is7xx.o
  CC      kernel/nsproxy.o
  CC      kernel/bpf/cpumask.o
  CC [M]  crypto/cast6_generic.o
  CC [M]  drivers/tty/n_hdlc.o
  CC      arch/x86/kernel/machine_kexec_64.o
  CC [M]  fs/cachefiles/io.o
  CC [M]  drivers/misc/cardreader/rts5249.o
  CC      drivers/mfd/wm8350-irq.o
  CC      drivers/acpi/acpica/rsdump.o
  LD [M]  arch/x86/kvm/kvm.o
  AS [M]  arch/x86/kvm/vmx/vmenter.o
  CC      lib/bsearch.o
  CC      net/ipv6/xfrm6_state.o
  AS [M]  arch/x86/kvm/svm/vmenter.o
  CC      lib/find_bit.o
  CC      net/ipv6/xfrm6_input.o
  LD [M]  arch/x86/kvm/kvm-intel.o
  CC      lib/llist.o
  CC      net/ipv6/xfrm6_output.o
  LD [M]  arch/x86/kvm/kvm-amd.o
  CC [M]  net/llc/af_llc.o
  CC [M]  fs/smb/client/export.o
  CC [M]  sound/soc/soc-ops.o
  CC [M]  fs/vboxsf/super.o
  CC      drivers/acpi/ec.o
  CC [M]  fs/nfs/sysfs.o
  AS      arch/x86/kernel/relocate_kernel_64.o
  CC      mm/memcontrol.o
  CC      arch/x86/kernel/kexec-bzimage64.o
  CC [M]  drivers/misc/sgi-xp/xp_uv.o
  CC      kernel/notifier.o
  CC [M]  drivers/regulator/max20411-regulator.o
  CC      drivers/block/nbd.o
  AR      drivers/base/regmap/built-in.a
  CC      net/ipv6/xfrm6_protocol.o
  CC [M]  drivers/misc/ibmasm/event.o
  CC [M]  drivers/regulator/max77693-regulator.o
  CC [M]  drivers/block/null_blk/zoned.o
  AR      drivers/acpi/acpica/built-in.a
  CC      net/ipv6/netfilter.o
  CC [M]  crypto/aria_generic.o
  CC      fs/open.o
  CC      mm/vmpressure.o
  CC [M]  fs/cachefiles/key.o
  CC      drivers/base/dd.o
  CC [M]  drivers/tty/serial/sc16is7xx_spi.o
  CC      kernel/bpf/bpf_lsm.o
  CC [M]  sound/soc/soc-link.o
  CC      net/ipv4/fib_frontend.o
  CC      net/ipv4/fib_semantics.o
  CC [M]  net/llc/llc_station.o
  CC [M]  fs/cachefiles/main.o
  CC [M]  drivers/misc/cardreader/rts5260.o
  CC      kernel/ksysfs.o
  CC      drivers/mfd/wm8350-i2c.o
  CC [M]  drivers/block/drbd/drbd_main.o
  CC [M]  net/netfilter/nft_lookup.o
  CC [M]  drivers/regulator/max77826-regulator.o
  CC [M]  drivers/misc/sgi-xp/xpc_main.o
  CC [M]  drivers/misc/ibmasm/command.o
  CC [M]  net/bridge/netfilter/nft_meta_bridge.o
  CC      fs/btrfs/delayed-ref.o
  CC      drivers/base/syscore.o
  LD [M]  fs/vboxsf/vboxsf.o
  CC [M]  net/tls/tls_device_fallback.o
  CC [M]  net/bridge/netfilter/nft_reject_bridge.o
  CC [M]  net/netfilter/nft_dynset.o
  CC      fs/read_write.o
  CC [M]  sound/soc/soc-card.o
  CC      arch/x86/kernel/crash_dump_64.o
  CC      lib/lwq.o
  CC [M]  fs/smb/client/unc.o
  CC [M]  crypto/chacha_generic.o
  CC [M]  sound/soc/soc-compress.o
  CC [M]  drivers/tty/serial/sc16is7xx_i2c.o
  CC [M]  net/llc/llc_proc.o
  CC      fs/btrfs/relocation.o
  CC [M]  net/llc/sysctl_net_llc.o
  CC [M]  drivers/misc/cardreader/rts5261.o
  CC [M]  drivers/block/drbd/drbd_strings.o
  CC      drivers/mfd/tps65910.o
  LD [M]  drivers/block/null_blk/null_blk.o
  CC [M]  net/bridge/netfilter/nf_conntrack_bridge.o
  CC [M]  drivers/tty/serial/sprd_serial.o
  CC      mm/swap_cgroup.o
  CC [M]  drivers/block/drbd/drbd_nl.o
  CC [M]  drivers/regulator/max77857-regulator.o
  CC [M]  fs/nfs/fs_context.o
  CC [M]  drivers/misc/ibmasm/remote.o
  CC      lib/memweight.o
  CC [M]  fs/cachefiles/namei.o
  CC [M]  drivers/misc/sgi-gru/grufile.o
  CC      drivers/mfd/tps65912-core.o
  CC      arch/x86/kernel/crash.o
  LD [M]  net/llc/llc.o
  CC [M]  crypto/poly1305_generic.o
  CC [M]  fs/smb/client/winucase.o
  CC [M]  fs/smb/client/smb2ops.o
  CC      lib/kfifo.o
  CC [M]  drivers/misc/sgi-gru/grumain.o
  CC      kernel/bpf/crypto.o
  CC [M]  drivers/misc/sgi-gru/grufault.o
  CC [M]  drivers/misc/cardreader/rts5228.o
  CC [M]  drivers/misc/sgi-xp/xpc_channel.o
  CC      drivers/block/virtio_blk.o
  CC      drivers/base/driver.o
  CC      drivers/acpi/dock.o
  CC [M]  fs/smb/client/smb2maperror.o
  CC      fs/btrfs/delayed-inode.o
  CC [M]  drivers/misc/sgi-xp/xpc_partition.o
  CC [M]  drivers/tty/serial/uartlite.o
  CC [M]  drivers/misc/cardreader/rts5264.o
  CC      drivers/mfd/tps65912-i2c.o
  CC      fs/file_table.o
  CC [M]  fs/nfs/sysctl.o
  CC      net/ipv6/fib6_rules.o
  LD [M]  net/llc/llc2.o
  CC      kernel/cred.o
  CC      drivers/acpi/pci_root.o
  CC      kernel/reboot.o
  CC      drivers/base/class.o
  CC      arch/x86/kernel/module.o
  CC [M]  net/netfilter/nft_meta.o
  CC [M]  drivers/misc/ibmasm/heartbeat.o
  CC [M]  crypto/michael_mic.o
  CC [M]  drivers/regulator/mc13783-regulator.o
  CC [M]  sound/soc/soc-generic-dmaengine-pcm.o
  CC [M]  net/sunrpc/auth_gss/auth_gss.o
  CC [M]  net/bridge/br.o
  CC [M]  net/kcm/kcmsock.o
  CC [M]  fs/cachefiles/security.o
  CC [M]  crypto/crc32_generic.o
  CC [M]  drivers/regulator/mc13892-regulator.o
  CC [M]  crypto/authenc.o
  CC [M]  drivers/block/drbd/drbd_interval.o
  CC      drivers/block/xen-blkfront.o
  CC [M]  net/bridge/netfilter/ebtables.o
  CC [M]  drivers/misc/sgi-xp/xpc_uv.o
  CC [M]  drivers/misc/ibmasm/r_heartbeat.o
  CC      drivers/mfd/tps65912-spi.o
  CC [M]  fs/cachefiles/volume.o
  CC [M]  drivers/misc/sgi-gru/grutlbpurge.o
  CC      kernel/async.o
  CC [M]  crypto/authencesn.o
  CC [M]  drivers/misc/cardreader/rtsx_usb.o
  CC      arch/x86/kernel/kgdb.o
  AR      drivers/tty/serial/built-in.a
  CC      lib/percpu-refcount.o
  CC [M]  drivers/tty/n_gsm.o
  CC      drivers/mfd/twl-core.o
  CC [M]  net/bridge/netfilter/ebtable_broute.o
  CC      drivers/acpi/pci_link.o
  CC [M]  drivers/misc/c2port/core.o
  CC [M]  net/sunrpc/auth_gss/gss_mech_switch.o
  CC      kernel/range.o
  LD [M]  net/tls/tls.o
  CC      fs/btrfs/scrub.o
  CC      net/ipv6/proc.o
  CC [M]  drivers/block/drbd/drbd_state.o
  CC      drivers/base/platform.o
  CC      kernel/smpboot.o
  CC      lib/rhashtable.o
  CC [M]  drivers/regulator/mc13xxx-regulator-core.o
  CC [M]  drivers/misc/sgi-gru/gruprocfs.o
  CC      kernel/bpf/relo_core.o
  CC      kernel/bpf/btf_iter.o
  CC [M]  drivers/misc/ibmasm/dot_command.o
  CC [M]  drivers/misc/sgi-xp/xpnet.o
  CC      net/ipv4/fib_trie.o
  CC      fs/super.o
  CC [M]  sound/soc/soc-ac97.o
  CC      arch/x86/kernel/early_printk.o
  CC      mm/hugetlb_cgroup.o
  CC      arch/x86/kernel/hpet.o
  CC [M]  drivers/misc/c2port/c2port-duramar2150.o
  CC [M]  drivers/block/floppy.o
  CC [M]  fs/cachefiles/xattr.o
  CC      arch/x86/kernel/amd_nb.o
  CC [M]  drivers/block/brd.o
  CC [M]  net/bridge/netfilter/ebtable_filter.o
  CC      fs/btrfs/backref.o
  CC [M]  net/netfilter/nft_rt.o
  CC [M]  drivers/block/drbd/drbd_nla.o
  CC      drivers/acpi/pci_irq.o
  CC [M]  fs/nfs/fscache.o
  CC [M]  drivers/block/drbd/drbd_debugfs.o
  CC [M]  drivers/regulator/mp8859.o
  CC      mm/memory-failure.o
  CC [M]  drivers/misc/ibmasm/lowlevel.o
  CC [M]  drivers/misc/sgi-gru/grukservices.o
  CC [M]  crypto/lz4.o
  CC      drivers/mfd/twl4030-irq.o
  LD [M]  drivers/misc/cardreader/rtsx_pci.o
  CC [M]  net/kcm/kcmproc.o
  CC      kernel/bpf/btf_relocate.o
  CC      mm/kmemleak.o
  CC      mm/page_isolation.o
  CC      drivers/mfd/twl6030-irq.o
  CC      mm/zpool.o
  CC      drivers/mfd/twl4030-audio.o
  CC      mm/zsmalloc.o
  CC      kernel/bpf/kmem_cache_iter.o
  CC      net/ipv6/syncookies.o
  CC      fs/char_dev.o
  CC [M]  crypto/lz4hc.o
  CC [M]  net/l2tp/l2tp_core.o
  LD [M]  drivers/misc/sgi-xp/xp.o
  LD [M]  drivers/misc/sgi-xp/xpc.o
  CC [M]  net/l2tp/l2tp_ip.o
  CC      lib/base64.o
  CC [M]  drivers/misc/ibmasm/uart.o
  CC      drivers/base/cpu.o
  CC      drivers/acpi/acpi_apd.o
  CC      drivers/base/firmware.o
  CC [M]  net/l2tp/l2tp_netlink.o
  CC [M]  drivers/misc/altera-stapl/altera-jtag.o
  CC [M]  fs/cachefiles/error_inject.o
  LD [M]  sound/soc/snd-soc-acpi.o
  LD [M]  sound/soc/snd-soc-core.o
  CC      net/ipv4/fib_notifier.o
  CC [M]  drivers/misc/altera-stapl/altera-comp.o
  CC [M]  drivers/regulator/mt6311-regulator.o
  CC [M]  drivers/misc/mei/hdcp/mei_hdcp.o
  CC      drivers/acpi/acpi_platform.o
  CC [M]  drivers/misc/altera-stapl/altera.o
  CC [M]  fs/nfs/nfs2super.o
  CC      lib/once.o
  CC [M]  drivers/misc/altera-stapl/altera-lpt.o
  CC [M]  net/sunrpc/auth_gss/svcauth_gss.o
  CC      net/ipv4/inet_fragment.o
  CC [M]  drivers/misc/mei/pxp/mei_pxp.o
  CC      arch/x86/kernel/amd_node.o
  CC [M]  net/netfilter/nft_exthdr.o
  CC      drivers/acpi/acpi_pnp.o
  CC [M]  drivers/tty/moxa.o
  CC [M]  crypto/842.o
  CC [M]  net/bridge/netfilter/ebtable_nat.o
  CC [M]  net/dccp/ccid.o
  CC      net/ipv6/calipso.o
  AR      kernel/bpf/built-in.a
  LD [M]  drivers/misc/ibmasm/ibmasm.o
  CC      kernel/ucount.o
  CC      fs/btrfs/ulist.o
  CC [M]  net/bridge/br_device.o
  CC [M]  drivers/block/ublk_drv.o
  CC      kernel/regset.o
  CC [M]  net/l2tp/l2tp_eth.o
  CC      lib/refcount.o
  CC      drivers/mfd/twl6040.o
  LD [M]  net/kcm/kcm.o
  CC [M]  drivers/misc/vmw_vmci/vmci_context.o
  CC [M]  drivers/misc/genwqe/card_base.o
  LD [M]  fs/cachefiles/cachefiles.o
  CC [M]  drivers/misc/echo/echo.o
  CC [M]  drivers/regulator/mt6315-regulator.o
  CC      drivers/acpi/power.o
  CC [M]  drivers/misc/sgi-gru/gruhandles.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_dev.o
  CC [M]  crypto/ansi_cprng.o
  CC [M]  drivers/misc/vmw_vmci/vmci_datagram.o
  CC [M]  drivers/tty/mxser.o
  CC [M]  crypto/tcrypt.o
  CC [M]  drivers/misc/mei/gsc_proxy/mei_gsc_proxy.o
  CC      drivers/acpi/event.o
  LD [M]  drivers/block/drbd/drbd.o
  CC [M]  fs/smb/client/smb2transport.o
  CC [M]  net/netfilter/nft_last.o
  CC [M]  net/l2tp/l2tp_debugfs.o
  CC [M]  net/netfilter/nft_counter.o
  CC      fs/btrfs/qgroup.o
  CC [M]  drivers/misc/uacce/uacce.o
  CC      lib/rcuref.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.o
  CC      drivers/base/init.o
  CC [M]  fs/nfs/proc.o
  CC [M]  fs/nfs/nfs2xdr.o
  CC [M]  net/l2tp/l2tp_ip6.o
  CC      lib/usercopy.o
  CC      arch/x86/kernel/kvm.o
  CC [M]  net/bridge/netfilter/ebt_802_3.o
  CC      kernel/ksyms_common.o
  CC [M]  drivers/misc/sgi-gru/grukdump.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_msg.o
  CC [M]  net/bridge/br_fdb.o
  CC [M]  net/netfilter/nft_objref.o
  CC [M]  drivers/regulator/mt6323-regulator.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_sg.o
  CC [M]  net/sunrpc/auth_gss/gss_rpc_upcall.o
  CC [M]  net/bridge/br_forward.o
  CC [M]  net/dccp/feat.o
  CC      net/ipv6/seg6_iptunnel.o
  CC [M]  drivers/misc/genwqe/card_dev.o
  CC [M]  drivers/misc/mei/init.o
  CC      mm/early_ioremap.o
  CC      net/ipv4/ping.o
  CC [M]  drivers/misc/mei/hbm.o
  CC      drivers/base/map.o
  CC [M]  net/bridge/netfilter/ebt_among.o
  CC [M]  crypto/polyval-generic.o
  CC [M]  net/sctp/sm_statetable.o
  CC [M]  crypto/af_alg.o
  CC      lib/errseq.o
  CC      drivers/mfd/mfd-core.o
  CC [M]  net/sctp/sm_statefuns.o
  CC [M]  net/netfilter/nft_inner.o
  CC      fs/btrfs/send.o
  CC      lib/bucket_locks.o
  CC      kernel/groups.o
  CC [M]  drivers/misc/vmw_vmci/vmci_doorbell.o
  LD [M]  drivers/misc/altera-stapl/altera-stapl.o
  CC      arch/x86/kernel/kvmclock.o
  CC [M]  drivers/tty/nozomi.o
  CC [M]  crypto/algif_hash.o
  CC      drivers/acpi/evged.o
  LD [M]  drivers/misc/sgi-gru/gru.o
  CC      drivers/base/devres.o
  CC      net/ipv4/ip_tunnel_core.o
  CC      kernel/vhost_task.o
  CC [M]  net/rds/af_rds.o
  AR      drivers/block/built-in.a
  CC [M]  drivers/regulator/mt6331-regulator.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.o
  CC [M]  net/9p/mod.o
  CC [M]  net/sctp/sm_sideeffect.o
  CC [M]  net/rds/bind.o
  CC      fs/stat.o
  CC [M]  net/9p/client.o
  CC [M]  net/sunrpc/auth_gss/gss_rpc_xdr.o
  CC      lib/generic-radix-tree.o
  CC      net/ipv4/gre_offload.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_tty.o
  CC      mm/numa.o
  CC [M]  fs/nfs/nfs3super.o
  CC [M]  fs/smb/client/smb2misc.o
  CC      drivers/base/attribute_container.o
  CC [M]  drivers/misc/vmw_vmci/vmci_driver.o
  CC [M]  net/dccp/input.o
  CC      drivers/base/transport_class.o
  CC [M]  drivers/misc/genwqe/card_ddcb.o
  CC      drivers/base/topology.o
  CC      drivers/acpi/sysfs.o
  CC [M]  net/rds/cong.o
  CC [M]  net/bridge/netfilter/ebt_arp.o
  CC [M]  fs/nfs/nfs3client.o
  CC [M]  net/sunrpc/clnt.o
  CC      kernel/kcmp.o
  CC [M]  fs/nfs/nfs3proc.o
  CC      drivers/acpi/property.o
  CC [M]  net/bridge/br_if.o
  CC [M]  drivers/regulator/mt6332-regulator.o
  CC [M]  drivers/misc/mei/interrupt.o
  CC [M]  net/netfilter/nft_chain_route.o
  CC      kernel/freezer.o
  CC      drivers/misc/sram.o
  CC      drivers/mfd/ezx-pcap.o
  CC      arch/x86/kernel/paravirt.o
  CC      kernel/profile.o
  CC      lib/bitmap-str.o
  LD [M]  drivers/misc/bcm-vk/bcm_vk.o
  CC      kernel/stacktrace.o
  CC [M]  drivers/tty/ttynull.o
  CC      drivers/base/container.o
  CC      mm/numa_memblks.o
  CC      fs/btrfs/dev-replace.o
  CC [M]  net/sctp/protocol.o
  CC [M]  net/sunrpc/auth_gss/trace.o
  CC [M]  net/netfilter/nf_tables_offload.o
  CC [M]  drivers/misc/mei/client.o
  CC [M]  net/rds/connection.o
  CC [M]  drivers/misc/vmw_vmci/vmci_event.o
  CC [M]  net/rds/info.o
  CC [M]  net/sctp/endpointola.o
  CC [M]  drivers/misc/genwqe/card_sysfs.o
  CC      fs/exec.o
  CC [M]  drivers/regulator/mt6357-regulator.o
  CC      fs/pipe.o
  CC      net/ipv6/seg6_local.o
  CC [M]  drivers/regulator/mt6358-regulator.o
  CC [M]  net/bridge/netfilter/ebt_ip.o
  CC [M]  net/netfilter/nft_set_hash.o
  CC [M]  drivers/regulator/mt6359-regulator.o
  CC [M]  crypto/algif_skcipher.o
  CC [M]  drivers/regulator/mt6360-regulator.o
  CC      drivers/base/property.o
  CC [M]  drivers/tty/rpmsg_tty.o
  CC [M]  fs/nfs/nfs3xdr.o
  CC [M]  net/netfilter/nft_set_bitmap.o
  CC      fs/btrfs/raid56.o
  CC [M]  net/bridge/br_input.o
  CC [M]  drivers/misc/vmw_vmci/vmci_guest.o
  CC [M]  fs/smb/client/smb2pdu.o
  CC      lib/string_helpers.o
  CC [M]  drivers/misc/genwqe/card_debugfs.o
  CC [M]  crypto/algif_rng.o
  CC      mm/balloon_compaction.o
  CC      lib/hexdump.o
  CC      drivers/mfd/da903x.o
  CC [M]  net/dccp/minisocks.o
  CC      net/ipv4/metrics.o
  CC      fs/namei.o
  CC      drivers/acpi/debugfs.o
  CC      arch/x86/kernel/paravirt-spinlocks.o
  CC [M]  drivers/misc/ad525x_dpot.o
  CC      kernel/dma.o
  CC [M]  net/psample/psample.o
  CC [M]  drivers/misc/ad525x_dpot-i2c.o
  CC      fs/fcntl.o
  CC      fs/ioctl.o
  AR      drivers/tty/built-in.a
  CC [M]  net/sunrpc/auth_gss/gss_krb5_mech.o
  CC [M]  drivers/regulator/mt6370-regulator.o
  CC [M]  drivers/misc/ad525x_dpot-spi.o
  CC [M]  net/rds/message.o
  CC      fs/readdir.o
  CC [M]  net/9p/error.o
  CC [M]  net/dccp/options.o
  CC      arch/x86/kernel/pvclock.o
  CC [M]  net/sctp/associola.o
  CC [M]  net/9p/protocol.o
  CC      drivers/base/cacheinfo.o
  CC [M]  net/9p/trans_common.o
  CC [M]  drivers/misc/mei/main.o
  CC [M]  net/bridge/netfilter/ebt_ip6.o
  CC [M]  fs/smb/client/smb2inode.o
  CC [M]  drivers/misc/genwqe/card_utils.o
  CC [M]  drivers/misc/mei/dma-ring.o
  CC      drivers/base/swnode.o
  CC [M]  crypto/algif_aead.o
  CC [M]  net/netfilter/nft_set_rbtree.o
  CC      drivers/acpi/acpi_lpat.o
  CC      lib/kstrtox.o
  CC [M]  drivers/regulator/mt6397-regulator.o
  CC      drivers/base/faux.o
  CC [M]  drivers/misc/vmw_vmci/vmci_handle_array.o
  CC      drivers/base/auxiliary.o
  CC      kernel/smp.o
  CC      arch/x86/kernel/pmem.o
  CC [M]  drivers/misc/vmw_vmci/vmci_host.o
  CC [M]  crypto/zstd.o
  CC [M]  crypto/essiv.o
  CC      drivers/mfd/da9052-irq.o
  CC [M]  crypto/curve25519-generic.o
  CC [M]  fs/nfs/nfs3acl.o
  CC      mm/secretmem.o
  CC      net/ipv4/netlink.o
  CC [M]  net/sctp/transport.o
  CC      kernel/uid16.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_seal.o
  CC      kernel/module_signature.o
  CC [M]  net/vmw_vsock/af_vsock.o
  CC      drivers/acpi/acpi_fpdt.o
  CC [M]  net/vmw_vsock/af_vsock_tap.o
  CC      drivers/acpi/acpi_lpit.o
  CC [M]  net/dccp/output.o
  CC      net/ipv6/seg6_hmac.o
  CC      lib/debug_info.o
  CC      fs/btrfs/uuid-tree.o
  CC [M]  net/bridge/netfilter/ebt_limit.o
  CC      arch/x86/kernel/jailhouse.o
  CC      fs/select.o
  CC [M]  drivers/regulator/qcom-labibb-regulator.o
  CC [M]  net/9p/trans_fd.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_unseal.o
  CC [M]  net/rds/recv.o
  CC      fs/btrfs/props.o
  CC [M]  net/bridge/netfilter/ebt_mark_m.o
  CC [M]  drivers/misc/mei/bus.o
  CC [M]  net/vmw_vsock/vsock_addr.o
  CC [M]  drivers/regulator/qcom_spmi-regulator.o
  LD [M]  drivers/misc/genwqe/genwqe_card.o
  CC      drivers/base/devtmpfs.o
  CC [M]  fs/nfs/nfs4proc.o
  CC      drivers/mfd/da9052-core.o
  CC      drivers/acpi/acpi_watchdog.o
  CC [M]  drivers/misc/mei/bus-fixup.o
  CC      net/devres.o
  CC [M]  net/bridge/br_ioctl.o
  CC      drivers/acpi/prmt.o
  CC [M]  drivers/misc/vmw_vmci/vmci_queue_pair.o
  ASN.1   crypto/ecrdsa_params.asn1.[ch]
  ASN.1   crypto/ecrdsa_pub_key.asn1.[ch]
  CC [M]  net/dccp/proto.o
  CC [M]  crypto/ecrdsa_params.asn1.o
  CC      net/ipv4/nexthop.o
  CC [M]  crypto/ecrdsa_pub_key.asn1.o
  CC [M]  drivers/regulator/qcom_usb_vbus-regulator.o
  CC      mm/userfaultfd.o
  CC [M]  drivers/regulator/palmas-regulator.o
  CC [M]  drivers/misc/dummy-irq.o
  CC [M]  crypto/simd.o
  CC      lib/iomap.o
  CC      drivers/acpi/acpi_pcc.o
  CC [M]  net/netfilter/nft_set_pipapo.o
  CC      arch/x86/kernel/pcspeaker.o
  CC      kernel/kallsyms.o
  CC [M]  fs/smb/client/smb2file.o
  CC      lib/iomap_copy.o
  CC      drivers/acpi/acpi_ffh.o
  CC [M]  drivers/misc/ics932s401.o
  CC [M]  net/9p/trans_xen.o
  CC [M]  drivers/misc/tifm_core.o
  CC      net/ipv6/ioam6_iptunnel.o
  CC      drivers/acpi/acpi_adxl.o
  CC [M]  net/sctp/chunk.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_wrap.o
  CC [M]  fs/smb/client/cifsacl.o
  CC [M]  net/bridge/netfilter/ebt_pkttype.o
  CC      fs/dcache.o
  CC [M]  fs/nfs/nfs4xdr.o
  CC      kernel/acct.o
  CC      drivers/mfd/da9052-spi.o
  CC [M]  net/rds/send.o
  CC      drivers/base/isa.o
  CC      fs/btrfs/free-space-tree.o
  CC      drivers/mfd/da9052-i2c.o
  CC      net/socket.o
  CC [M]  drivers/misc/mei/debugfs.o
  CC      arch/x86/kernel/check.o
  CC      mm/page_idle.o
  CC [M]  drivers/misc/vmw_vmci/vmci_resource.o
  CC      net/ipv4/udp_tunnel_stub.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_crypto.o
  CC [M]  net/vmw_vsock/vsock_bpf.o
  CC [M]  net/bridge/netfilter/ebt_stp.o
  CC      drivers/base/node.o
  CC [M]  drivers/regulator/pca9450-regulator.o
  CC [M]  drivers/misc/mei/mei-trace.o
  CC      drivers/base/memory.o
  CC      drivers/mfd/lp8788.o
  CC [M]  net/9p/trans_virtio.o
  CC      fs/btrfs/tree-checker.o
  CC      lib/devres.o
  CC      drivers/base/module.o
  CC [M]  net/rds/stats.o
  CC [M]  crypto/ecdsa-x962.o
  CC [M]  drivers/misc/vmw_vmci/vmci_route.o
  CC [M]  net/rds/sysctl.o
  CC      arch/x86/kernel/uprobes.o
  CC      kernel/vmcore_info.o
  CC      kernel/elfcorehdr.o
  CC [M]  drivers/regulator/pv88060-regulator.o
  CC      drivers/acpi/ac.o
  LD [M]  net/9p/9pnet.o
  CC      mm/usercopy.o
  CC [M]  net/sctp/sm_make_chunk.o
  CC      net/ipv6/addrconf_core.o
  CC      drivers/acpi/button.o
  CC      net/compat.o
  CC [M]  drivers/regulator/pv88080-regulator.o
  CC      kernel/crash_reserve.o
  CC      kernel/kexec_core.o
  CC      fs/btrfs/space-info.o
  LD [M]  crypto/aegis128.o
  CC      arch/x86/kernel/perf_regs.o
  LD [M]  net/9p/9pnet_fd.o
  CC [M]  net/netfilter/nft_set_pipapo_avx2.o
  CC      arch/x86/kernel/tracepoint.o
  CC [M]  net/netfilter/nft_ct_fast.o
  CC [M]  fs/nfs/nfs4state.o
  LD [M]  drivers/misc/vmw_vmci/vmw_vmci.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_keys.o
  CC      net/sysctl_net.o
  CC [M]  net/dccp/timer.o
  CC      fs/inode.o
  CC [M]  net/netfilter/nft_compat.o
  CC [M]  crypto/ecrdsa.o
  CC [M]  fs/smb/client/fs_context.o
  CC [M]  net/bridge/netfilter/ebt_vlan.o
  CC [M]  net/vmw_vsock/diag.o
  CC [M]  net/bridge/br_stp.o
  CC [M]  net/sctp/ulpevent.o
  LD [M]  net/9p/9pnet_xen.o
  CC [M]  fs/nfs/nfs4renewd.o
  CC      lib/check_signature.o
  CC      mm/memremap.o
  CC [M]  net/rds/threads.o
  CC      drivers/mfd/lp8788-irq.o
  LD [M]  net/sunrpc/auth_gss/auth_rpcgss.o
  LD [M]  crypto/crypto_simd.o
  CC      net/ipv4/sysctl_net_ipv4.o
  CC      net/ipv6/exthdrs_core.o
  CC [M]  drivers/regulator/pv88090-regulator.o
  CC [M]  fs/smb/client/dns_resolve.o
  CC [M]  drivers/regulator/pwm-regulator.o
  LD [M]  net/9p/9pnet_virtio.o
  CC      arch/x86/kernel/itmt.o
  CC      drivers/base/auxiliary_sysfs.o
  CC [M]  net/sctp/inqueue.o
  CC [M]  net/dccp/qpolicy.o
  CC      crypto/rsapubkey.asn1.o
  CC      mm/hmm.o
  CC      drivers/acpi/fan_core.o
  CC [M]  drivers/misc/mei/pci-me.o
  CC      lib/interval_tree.o
  CC      arch/x86/kernel/umip.o
  CC      crypto/rsaprivkey.asn1.o
  LD [M]  crypto/ecdsa_generic.o
  CC [M]  net/dccp/ccids/ccid2.o
  LD [M]  crypto/ecrdsa_generic.o
  CC      arch/x86/kernel/unwind_frame.o
  AR      crypto/built-in.a
  CC [M]  net/dccp/ackvec.o
  CC      fs/attr.o
  CC      arch/x86/kernel/callthunks.o
  CC      kernel/crash_core.o
  CC      drivers/base/hypervisor.o
  CC [M]  fs/nfs/nfs4super.o
  CC      drivers/mfd/da9055-core.o
  CC [M]  net/bridge/netfilter/ebt_arpreply.o
  CC      drivers/base/soc.o
  CC [M]  net/vmw_vsock/vmci_transport.o
  CC      drivers/base/pinctrl.o
  CC      drivers/mfd/da9055-i2c.o
  CC [M]  net/bridge/netfilter/ebt_mark.o
  CC      lib/assoc_array.o
  CC [M]  net/sctp/outqueue.o
  CC      net/ipv4/proc.o
  CC      fs/btrfs/block-rsv.o
  CC [M]  drivers/regulator/tps51632-regulator.o
  CC      drivers/acpi/fan_attr.o
  CC [M]  net/sctp/ulpqueue.o
  CC      kernel/kexec.o
  CC [M]  drivers/misc/mei/hw-me.o
  CC      drivers/mfd/da9063-core.o
  CC [M]  net/dccp/sysctl.o
  CC [M]  net/vmw_vsock/vmci_transport_notify.o
  CC [M]  net/netfilter/nft_connlimit.o
  CC [M]  net/rds/transport.o
  CC      fs/btrfs/delalloc-space.o
  CC [M]  net/vmw_vsock/vmci_transport_notify_qstate.o
  CC      lib/list_debug.o
  ASN.1   fs/smb/client/cifs_spnego_negtokeninit.asn1.[ch]
  CC      kernel/kexec_file.o
  LD [M]  net/sunrpc/auth_gss/rpcsec_gss_krb5.o
  CC [M]  net/sunrpc/xprt.o
  CC [M]  net/bridge/netfilter/ebt_dnat.o
  CC      drivers/acpi/fan_hwmon.o
  CC      net/ipv4/fib_rules.o
  CC      fs/btrfs/block-group.o
  CC      arch/x86/kernel/cet.o
  CC [M]  drivers/misc/tifm_7xx1.o
  CC      lib/debugobjects.o
  CC      net/ipv6/ip6_checksum.o
  CC [M]  net/bridge/br_stp_bpdu.o
  CC [M]  drivers/regulator/pcap-regulator.o
  CC [M]  net/netfilter/nft_numgen.o
  CC [M]  fs/smb/client/namespace.o
  CC [M]  net/sunrpc/socklib.o
  CC [M]  net/netfilter/nft_ct.o
  CC [M]  net/sunrpc/xprtsock.o
  CC [M]  net/rds/loop.o
  CC      drivers/base/devcoredump.o
  CC      drivers/mfd/da9063-irq.o
  CC [M]  drivers/regulator/raa215300.o
  CC [M]  drivers/misc/phantom.o
  CC [M]  net/rds/page.o
  CC      drivers/base/platform-msi.o
  CC      drivers/mfd/da9063-i2c.o
  CC [M]  drivers/misc/bh1770glc.o
  CC      mm/memfd.o
  CC      fs/bad_inode.o
  CC [M]  net/netfilter/nft_flow_offload.o
  CC [M]  drivers/misc/apds990x.o
  CC      arch/x86/kernel/shstk.o
  CC      drivers/acpi/pci_slot.o
  CC      drivers/mfd/max14577.o
  CC      drivers/mfd/max77693.o
  CC [M]  net/bridge/netfilter/ebt_redirect.o
  CC [M]  net/sctp/tsnmap.o
  CC [M]  net/vmw_vsock/virtio_transport.o
  CC      net/ipv6/ip6_icmp.o
  CC      drivers/base/physical_location.o
  CC      mm/ptdump.o
  CC [M]  net/bridge/br_stp_if.o
  CC [M]  drivers/regulator/rc5t583-regulator.o
  CC      kernel/compat.o
  CC      fs/btrfs/discard.o
  CC      kernel/utsname.o
  CC [M]  net/dccp/ipv4.o
  CC [M]  net/netfilter/nft_limit.o
  CC [M]  net/dccp/ipv6.o
  CC      kernel/user_namespace.o
  CC      fs/file.o
  CC      fs/filesystems.o
  CC [M]  fs/smb/client/reparse.o
  CC      drivers/base/trace.o
  CC [M]  drivers/regulator/rt4801-regulator.o
  CC      lib/bitrev.o
  CC [M]  net/rds/rdma.o
  CC      kernel/pid_namespace.o
  CC [M]  net/netfilter/nft_nat.o
  CC      drivers/acpi/processor_driver.o
  CC [M]  net/sunrpc/sched.o
  CC [M]  net/sctp/bind_addr.o
  CC [M]  net/vmw_vsock/virtio_transport_common.o
  CC      net/ipv6/output_core.o
  CC [M]  net/bridge/br_stp_timer.o
  CC      arch/x86/kernel/audit_64.o
  CC [M]  net/bridge/netfilter/ebt_snat.o
  CC [M]  net/bridge/netfilter/ebt_log.o
  CC      fs/btrfs/reflink.o
  CC [M]  drivers/misc/enclosure.o
  CC [M]  net/bridge/br_netlink.o
  CC      mm/page_reporting.o
  CC [M]  drivers/regulator/rt4803.o
  CC [M]  drivers/misc/mei/gsc-me.o
  CC      fs/btrfs/subpage.o
  CC      fs/namespace.o
  CC [M]  drivers/misc/smpro-errmon.o
  CC [M]  net/bridge/netfilter/ebt_nflog.o
  CC [M]  net/rds/tcp.o
  CC [M]  drivers/regulator/rt4831-regulator.o
  CC      lib/linear_ranges.o
  CC [M]  drivers/regulator/rt5033-regulator.o
  CC      drivers/mfd/max77843.o
  UPD     kernel/config_data
  CC [M]  net/rds/tcp_connect.o
  CC      net/ipv4/ipmr.o
  CC      drivers/acpi/processor_thermal.o
  CC      lib/packing.o
  AR      drivers/base/built-in.a
  CC      mm/bootmem_info.o
  CC [M]  fs/smb/client/xattr.o
  CC [M]  net/rds/tcp_listen.o
  CC      net/ipv4/ipmr_base.o
  CC      arch/x86/kernel/amd_gart_64.o
  CC [M]  net/sctp/socket.o
  CC      fs/seq_file.o
  CC [M]  drivers/misc/mei/pci-txe.o
  CC [M]  fs/nfs/nfs4file.o
  CC [M]  fs/nfs/delegation.o
  CC [M]  drivers/misc/mei/hw-txe.o
  CC [M]  net/netfilter/nft_queue.o
  CC      lib/crc-ccitt.o
  CC [M]  net/bridge/br_netlink_tunnel.o
  CC      arch/x86/kernel/aperture_64.o
  CC [M]  net/bridge/br_arp_nd_proxy.o
  CC      mm/execmem.o
  CC      arch/x86/kernel/mmconf-fam10h_64.o
  CC [M]  net/vmw_vsock/hyperv_transport.o
  CC      arch/x86/kernel/vsmp_64.o
  CC      fs/btrfs/tree-mod-log.o
  CC      lib/crc16.o
  CC      drivers/mfd/max8925-core.o
  CC [M]  drivers/misc/smpro-misc.o
  CC [M]  drivers/regulator/rt5120-regulator.o
  CC      lib/crc-t10dif.o
  CC      fs/xattr.o
  CC [M]  fs/nfs/nfs4idmap.o
  CC      drivers/acpi/processor_idle.o
  CC      net/ipv6/protocol.o
  CC      kernel/stop_machine.o
  CC      drivers/mfd/max8925-i2c.o
  CC      fs/libfs.o
  CC      fs/fs-writeback.o
  CC      mm/shmem_quota.o
  CC      net/ipv4/syncookies.o
  CC [M]  drivers/misc/hpilo.o
  CC [M]  arch/x86/kernel/msr.o
  CC [M]  net/rds/tcp_recv.o
  CC      drivers/acpi/processor_throttling.o
  CC [M]  drivers/misc/apds9802als.o
  CC [M]  net/sctp/primitive.o
  CC      kernel/audit.o
  CC [M]  net/netfilter/nft_quota.o
  CC [M]  drivers/misc/mei/vsc-tp.o
  CC      mm/pt_reclaim.o
  CC [M]  net/dccp/diag.o
  CC      kernel/auditfilter.o
  LD [M]  net/dccp/dccp.o
  CC [M]  net/netfilter/nft_reject.o
  CC [M]  net/rds/tcp_send.o
  CC [M]  fs/smb/client/cifs_spnego.o
  LD [M]  net/dccp/dccp_ipv4.o
  CC      kernel/auditsc.o
  CC [M]  net/sctp/output.o
  CC [M]  net/vmw_vsock/vsock_loopback.o
  CC [M]  net/sctp/input.o
  CC [M]  drivers/regulator/rt5190a-regulator.o
  CC      fs/btrfs/extent-io-tree.o
  CC      kernel/audit_watch.o
  CC      net/ipv6/ip6_offload.o
  CC [M]  mm/hwpoison-inject.o
  CC [M]  drivers/regulator/rt5739.o
  CC      lib/crc-itu-t.o
  CC [M]  net/netfilter/nft_reject_inet.o
  CC [M]  drivers/regulator/rt5759-regulator.o
  CC [M]  net/rds/tcp_stats.o
  CC [M]  drivers/regulator/rt6160-regulator.o
  CC [M]  drivers/regulator/rt6190-regulator.o
  CC      drivers/mfd/max8997.o
  LD [M]  net/dccp/dccp_ipv6.o
  CC      drivers/mfd/max8997-irq.o
  CC [M]  arch/x86/kernel/cpuid.o
  CC [M]  net/bridge/br_sysfs_if.o
  CC [M]  drivers/regulator/rt6245-regulator.o
  CC      kernel/audit_fsnotify.o
  CC      drivers/acpi/processor_perflib.o
  CC      net/ipv4/netfilter.o
  CC [M]  net/sctp/debug.o
  CC      fs/pnode.o
  CC      kernel/audit_tree.o
  CC      fs/splice.o
  CC [M]  fs/nfs/callback.o
  CC [M]  fs/smb/client/dfs_cache.o
  LD [M]  net/rds/rds.o
  AR      mm/built-in.a
  CC [M]  net/bridge/br_sysfs_br.o
  CC      drivers/mfd/max8998.o
  HOSTCC  lib/gen_crc32table
  LD [M]  net/vmw_vsock/vsock.o
  LD [M]  net/vmw_vsock/vsock_diag.o
  LD [M]  net/vmw_vsock/vmw_vsock_vmci_transport.o
  CC [M]  net/netfilter/nft_reject_netdev.o
  LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport.o
  LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport_common.o
  LD [M]  net/vmw_vsock/hv_sock.o
  CC [M]  net/sctp/stream.o
  AR      arch/x86/kernel/built-in.a
  CC      net/ipv6/tcpv6_offload.o
  LD [M]  net/dccp/dccp_diag.o
  AR      arch/x86/built-in.a
  HOSTCC  lib/gen_crc64table
  CC      net/ipv4/tcp_cubic.o
  CC [M]  drivers/misc/mei/vsc-fw-loader.o
  CC      lib/xxhash.o
  CC      net/ipv6/exthdrs_offload.o
  CC      fs/btrfs/fs.o
  CC      net/ipv4/tcp_sigpool.o
  CC      net/ipv6/inet6_hashtables.o
  CC      fs/sync.o
  CC      net/ipv6/mcast_snoop.o
  CC      fs/utimes.o
  CC [M]  net/netfilter/nft_tunnel.o
  CC      net/ipv6/tcp_ao.o
  CC [M]  net/netfilter/nft_log.o
  CC      net/ipv4/tcp_bpf.o
  CC [M]  net/ipv6/ah6.o
  CC      net/ipv4/udp_bpf.o
  LD [M]  net/rds/rds_tcp.o
  CC [M]  drivers/regulator/rtmv20-regulator.o
  CC      drivers/mfd/max8998-irq.o
  CC      drivers/mfd/adp5520.o
  CC [M]  drivers/misc/isl29003.o
  CC      fs/d_path.o
  CC      fs/stack.o
  CC [M]  drivers/misc/isl29020.o
  CC [M]  fs/nfs/callback_xdr.o
  CC [M]  drivers/regulator/rtq2134-regulator.o
  CC [M]  net/sctp/auth.o
  CC [M]  net/ipv6/esp6.o
  CC      lib/genalloc.o
  CC      fs/fs_struct.o
  CC      drivers/acpi/container.o
  CC      lib/textsearch.o
  CC      fs/btrfs/messages.o
  CC [M]  drivers/regulator/rtq6752-regulator.o
  CC      fs/statfs.o
  CC [M]  fs/smb/client/dfs.o
  CC      fs/fs_pin.o
  CC [M]  fs/smb/client/netlink.o
  CC [M]  net/netfilter/nft_masq.o
  CC [M]  net/sctp/offload.o
  CC      drivers/mfd/tps6586x.o
  CC [M]  drivers/regulator/rtq2208-regulator.o
  CC      drivers/acpi/thermal_lib.o
  CC [M]  drivers/misc/mei/platform-vsc.o
  CC [M]  net/bridge/br_nf_core.o
  CC [M]  net/sctp/stream_sched.o
  CC      fs/btrfs/bio.o
  CC      drivers/acpi/thermal.o
  CC [M]  fs/smb/client/cifs_swn.o
  CC      kernel/kprobes.o
  CC [M]  net/bridge/br_multicast.o
  CC      fs/nsfs.o
  CC      fs/fs_types.o
  CC      lib/percpu_counter.o
  CC [M]  net/netfilter/nft_redir.o
  CC      fs/btrfs/lru_cache.o
  CC [M]  net/netfilter/nft_hash.o
  CC [M]  drivers/misc/tsl2550.o
  LD [M]  drivers/misc/mei/mei.o
  CC [M]  net/ipv6/esp6_offload.o
  CC      lib/iommu-helper.o
  CC      lib/fault-inject.o
  CC      kernel/fail_function.o
  CC [M]  net/netfilter/nft_fib.o
  CC [M]  drivers/misc/ds1682.o
  CC [M]  fs/nfs/callback_proc.o
  CC [M]  drivers/regulator/sky81452-regulator.o
  CC [M]  net/netfilter/nft_fib_inet.o
  CC [M]  net/ipv6/ipcomp6.o
  CC [M]  drivers/misc/hmc6352.o
  CC      net/ipv4/cipso_ipv4.o
  CC      drivers/acpi/nhlt.o
  CC [M]  fs/smb/client/fscache.o
  CC [M]  net/sunrpc/auth.o
  LD [M]  drivers/misc/mei/mei-me.o
  LD [M]  drivers/misc/mei/mei-gsc.o
  LD [M]  drivers/misc/mei/mei-txe.o
  LD [M]  drivers/misc/mei/mei-vsc-hw.o
  CC      fs/fs_context.o
  LD [M]  drivers/misc/mei/mei-vsc.o
  CC [M]  fs/smb/client/smb1ops.o
  CC      kernel/hung_task.o
  CC      drivers/mfd/tps65090.o
  CC      drivers/mfd/aat2870-core.o
  CC      drivers/mfd/intel-lpss.o
  CC      drivers/mfd/intel-lpss-pci.o
  CC      fs/btrfs/raid-stripe-tree.o
  CC      net/ipv4/xfrm4_policy.o
  CC [M]  fs/smb/client/cifssmb.o
  CC [M]  drivers/regulator/slg51000-regulator.o
  CC [M]  fs/nfs/nfs4namespace.o
  CC [M]  drivers/misc/vmw_balloon.o
  CC [M]  drivers/misc/lattice-ecp3-config.o
  CC      drivers/mfd/intel-lpss-acpi.o
  CC [M]  fs/smb/client/cifs_spnego_negtokeninit.asn1.o
  CC      kernel/watchdog.o
  CC [M]  fs/nfs/nfs4getroot.o
  CC [M]  fs/smb/client/asn1.o
  CC [M]  net/netfilter/nft_fib_netdev.o
  CC [M]  net/ipv6/xfrm6_tunnel.o
  CC [M]  net/sctp/stream_sched_prio.o
  CC      kernel/watchdog_perf.o
  CC [M]  fs/nfs/nfs4client.o
  CC      drivers/acpi/acpi_memhotplug.o
  CC [M]  net/sunrpc/auth_null.o
  CC      drivers/mfd/palmas.o
  CC [M]  net/sctp/stream_sched_rr.o
  CC      lib/error-inject.o
  CC      lib/syscall.o
  CC [M]  drivers/regulator/sy7636a-regulator.o
  CC      drivers/acpi/ioapic.o
  CC [M]  net/netfilter/nft_socket.o
  CC      fs/btrfs/fiemap.o
  CC [M]  net/sctp/stream_sched_fc.o
  CC [M]  net/sunrpc/auth_tls.o
  CC [M]  net/bridge/br_mdb.o
  CC [M]  net/sctp/stream_interleave.o
  CC      fs/btrfs/direct-io.o
  CC      drivers/mfd/rc5t583.o
  CC [M]  fs/nfs/nfs4session.o
  CC [M]  drivers/regulator/tps6105x-regulator.o
  CC      lib/dynamic_debug.o
  CC [M]  net/bridge/br_multicast_eht.o
  CC      lib/errname.o
  CC [M]  net/netfilter/nft_osf.o
  CC      fs/fs_parser.o
  CC      drivers/mfd/rc5t583-irq.o
  CC [M]  drivers/misc/dw-xdata-pcie.o
  CC [M]  net/ipv6/tunnel6.o
  CC [M]  drivers/misc/xilinx_sdfec.o
  CC [M]  drivers/misc/tps6594-esm.o
  CC [M]  net/ipv6/mip6.o
  CC      fs/fsopen.o
  CC      drivers/acpi/battery.o
  CC [M]  net/sctp/proc.o
  CC [M]  net/ipv6/ip6_vti.o
  CC      fs/btrfs/acl.o
  CC [M]  fs/nfs/dns_resolve.o
  CC [M]  drivers/misc/tps6594-pfsm.o
  CC [M]  drivers/regulator/tps62360-regulator.o
  CC      drivers/mfd/syscon.o
  CC      lib/nlattr.o
  CC      drivers/acpi/hed.o
  CC [M]  net/sunrpc/auth_unix.o
  CC [M]  net/bridge/br_vlan.o
  CC [M]  drivers/regulator/tps65023-regulator.o
  CC      net/ipv4/xfrm4_state.o
  CC [M]  net/sctp/sysctl.o
  CC      fs/btrfs/zoned.o
  CC [M]  net/sunrpc/svc.o
  CC [M]  net/ipv6/sit.o
  CC [M]  fs/nfs/nfs4trace.o
  CC      drivers/mfd/as3711.o
  CC [M]  net/ipv6/ip6_tunnel.o
  CC      lib/cpu_rmap.o
  CC      net/ipv4/xfrm4_input.o
  CC [M]  net/sunrpc/svcsock.o
  CC      kernel/seccomp.o
  CC [M]  net/sctp/ipv6.o
  CC      lib/closure.o
  CC [M]  net/bridge/br_vlan_tunnel.o
  CC [M]  fs/nfs/nfs4sysctl.o
  CC      fs/btrfs/verity.o
  CC      drivers/acpi/bgrt.o
  CC [M]  drivers/misc/nsm.o
  CC [M]  drivers/regulator/tps6507x-regulator.o
  CC [M]  net/netfilter/nft_tproxy.o
  CC      net/ipv4/xfrm4_output.o
  CC [M]  net/bridge/br_vlan_options.o
  CC [M]  net/bridge/br_mst.o
  CC      net/ipv4/xfrm4_protocol.o
  CC      drivers/acpi/cppc_acpi.o
  CC [M]  net/netfilter/nft_xfrm.o
  CC [M]  net/bridge/br_switchdev.o
  CC [M]  net/ipv6/ip6_gre.o
  CC      net/ipv4/tcp_ao.o
  CC      lib/dynamic_queue_limits.o
  CC [M]  drivers/regulator/tps65086-regulator.o
  CC      kernel/relay.o
  CC [M]  drivers/regulator/tps65090-regulator.o
  CC      drivers/mfd/intel_soc_pmic_crc.o
  CC [M]  net/bridge/br_mrp_switchdev.o
  CC [M]  drivers/regulator/tps6524x-regulator.o
  CC [M]  fs/nfs/pnfs.o
  CC [M]  fs/nfs/pnfs_dev.o
  CC [M]  drivers/regulator/tps6586x-regulator.o
  CC [M]  net/ipv6/fou6.o
  CC      fs/init.o
  CC      kernel/utsname_sysctl.o
  CC [M]  drivers/regulator/tps65910-regulator.o
  CC [M]  net/bridge/br_mrp.o
  CC [M]  net/sunrpc/svcauth.o
  CC      kernel/delayacct.o
  CC [M]  drivers/regulator/tps65912-regulator.o
  CC      drivers/acpi/spcr.o
  CC [M]  net/sunrpc/svcauth_unix.o
  AR      drivers/misc/built-in.a
  CC [M]  fs/nfs/pnfs_nfs.o
  CC      drivers/acpi/acpi_dbg.o
  CC      drivers/mfd/intel_soc_pmic_chtwc.o
  CC      drivers/acpi/viot.o
  CC      fs/kernel_read_file.o
  CC      fs/mnt_idmapping.o
  CC      net/ipv4/bpf_tcp_ca.o
  CC [M]  net/netfilter/nft_synproxy.o
  CC [M]  net/sctp/diag.o
  CC [M]  net/sunrpc/addr.o
  CC      kernel/taskstats.o
  CC [M]  drivers/acpi/acpi_ipmi.o
  CC      fs/remap_range.o
  CC [M]  net/ipv6/ip6_udp_tunnel.o
  CC      lib/glob.o
  CC [M]  net/sunrpc/rpcb_clnt.o
  CC [M]  drivers/regulator/tps65132-regulator.o
  CC [M]  net/ipv4/ip_tunnel.o
  CC [M]  drivers/mfd/88pm800.o
  LD [M]  net/sctp/sctp.o
  CC      lib/digsig.o
  CC      fs/pidfs.o
  CC [M]  net/sunrpc/timer.o
  CC      kernel/tsacct.o
  CC [M]  net/netfilter/nft_chain_nat.o
  CC [M]  net/ipv4/ipip.o
  CC      fs/buffer.o
  CC      lib/strncpy_from_user.o
  AR      fs/btrfs/built-in.a
  CC [M]  net/sunrpc/xdr.o
  CC      kernel/tracepoint.o
  CC      fs/mpage.o
  CC [M]  net/netfilter/nft_dup_netdev.o
  CC      lib/strnlen_user.o
  CC      fs/proc_namespace.o
  CC [M]  net/sunrpc/sunrpc_syms.o
  CC [M]  net/bridge/br_mrp_netlink.o
  LD [M]  fs/smb/client/cifs.o
  CC      fs/direct-io.o
  CC      lib/net_utils.o
  CC [M]  drivers/mfd/88pm80x.o
  CC [M]  fs/nfs/nfs42proc.o
  CC [M]  net/ipv4/fou_core.o
  CC [M]  drivers/regulator/tps68470-regulator.o
  CC [M]  net/netfilter/nft_fwd_netdev.o
  CC [M]  drivers/acpi/acpi_video.o
  CC      kernel/latencytop.o
  CC      fs/eventpoll.o
  CC      fs/anon_inodes.o
  CC [M]  net/bridge/br_cfm.o
  CC [M]  fs/nfs/nfs42xattr.o
  CC [M]  net/bridge/br_cfm_netlink.o
  CC      lib/sg_pool.o
  CC [M]  net/sunrpc/cache.o
  LD [M]  net/sctp/sctp_diag.o
  CC      lib/memregion.o
  CC      fs/signalfd.o
  CC [M]  net/ipv4/fou_nl.o
  LD [M]  fs/nfs/nfs.o
  LD [M]  fs/nfs/nfsv2.o
  CC [M]  drivers/regulator/twl-regulator.o
  CC      fs/timerfd.o
  CC      fs/eventfd.o
  CC [M]  net/bridge/br_netfilter_hooks.o
  CC      kernel/irq_work.o
  CC [M]  net/sunrpc/rpc_pipe.o
  CC [M]  net/bridge/br_netfilter_ipv6.o
  CC [M]  net/ipv4/fou_bpf.o
  CC [M]  drivers/acpi/video_detect.o
  CC      fs/userfaultfd.o
  CC [M]  drivers/regulator/twl6030-regulator.o
  CC [M]  drivers/mfd/88pm805.o
  CC      lib/irq_poll.o
  CC [M]  net/netfilter/nf_flow_table_core.o
  CC [M]  drivers/regulator/wm831x-dcdc.o
  CC [M]  net/ipv4/gre_demux.o
  LD [M]  fs/nfs/nfsv3.o
  CC [M]  net/sunrpc/sysfs.o
  CC [M]  drivers/regulator/wm831x-isink.o
  CC [M]  net/netfilter/nf_flow_table_ip.o
  AR      net/ipv6/built-in.a
  CC [M]  drivers/acpi/acpi_tad.o
  CC      kernel/static_call.o
  CC [M]  drivers/acpi/platform_profile.o
  CC [M]  net/netfilter/nf_flow_table_offload.o
  CC [M]  net/ipv4/ip_gre.o
  CC [M]  drivers/regulator/wm831x-ldo.o
  CC      fs/aio.o
  CC      kernel/static_call_inline.o
  CC [M]  drivers/mfd/sm501.o
  CC [M]  drivers/mfd/bcm590xx.o
  CC [M]  drivers/acpi/sbshc.o
  CC [M]  drivers/mfd/bd9571mwv.o
  CC [M]  net/netfilter/nf_flow_table_xdp.o
  CC [M]  drivers/mfd/cros_ec_dev.o
  CC [M]  net/netfilter/nf_flow_table_inet.o
  CC [M]  drivers/mfd/cs42l43.o
  CC      fs/dax.o
  CC      lib/stackdepot.o
  CC [M]  net/sunrpc/svc_xprt.o
  CC [M]  drivers/acpi/sbs.o
  CC      kernel/user-return-notifier.o
  CC [M]  net/sunrpc/xprtmultipath.o
  CC [M]  net/netfilter/x_tables.o
  CC [M]  drivers/mfd/cs42l43-i2c.o
  LD [M]  net/bridge/bridge.o
  CC      lib/ref_tracker.o
  CC [M]  drivers/acpi/ec_sys.o
  CC [M]  drivers/regulator/wm8350-regulator.o
  CC      fs/locks.o
  CC [M]  drivers/acpi/pfr_update.o
  CC [M]  drivers/mfd/lp873x.o
  CC [M]  net/netfilter/xt_tcpudp.o
  CC      lib/bootconfig.o
  CC [M]  drivers/mfd/tqmx86.o
  CC [M]  net/sunrpc/debugfs.o
  CC [M]  net/ipv4/udp_tunnel_core.o
  CC      kernel/padata.o
  CC [M]  net/sunrpc/backchannel_rqst.o
  CC [M]  drivers/regulator/wm8400-regulator.o
  CC [M]  net/netfilter/xt_mark.o
  CC      lib/asn1_decoder.o
  CC      kernel/jump_label.o
  CC [M]  drivers/acpi/pfr_telemetry.o
  CC      fs/binfmt_script.o
  CC [M]  net/netfilter/xt_connmark.o
  CC [M]  drivers/regulator/wm8994-regulator.o
  CC      fs/binfmt_elf.o
  CC [M]  drivers/mfd/arizona-core.o
  CC [M]  net/ipv4/udp_tunnel_nic.o
  CC [M]  net/netfilter/xt_nat.o
  CC [M]  net/sunrpc/stats.o
  CC      fs/compat_binfmt_elf.o
  CC      lib/asn1_encoder.o
  LD [M]  net/bridge/br_netfilter.o
  GEN     lib/oid_registry_data.c
  CC [M]  net/netfilter/xt_AUDIT.o
  CC [M]  drivers/mfd/arizona-irq.o
  CC [M]  net/sunrpc/sysctl.o
  CC [M]  drivers/acpi/acpi_pad.o
  CC      kernel/context_tracking.o
  CC [M]  drivers/mfd/wm5102-tables.o
  CC [M]  net/ipv4/ip_vti.o
  CC      fs/backing-file.o
  CC      fs/mbcache.o
  CC      lib/ucs2_string.o
  CC [M]  drivers/mfd/wm5110-tables.o
  CC [M]  net/netfilter/xt_CHECKSUM.o
  CC      lib/ubsan.o
  CC      lib/sbitmap.o
  CC [M]  net/netfilter/xt_CLASSIFY.o
  CC [M]  drivers/acpi/acpi_extlog.o
  CC [M]  drivers/mfd/wm8997-tables.o
  CC [M]  drivers/acpi/acpi_configfs.o
  CC      fs/posix_acl.o
  CC      lib/group_cpus.o
  CC [M]  net/ipv4/ah4.o
  CC [M]  net/ipv4/esp4.o
  CC [M]  drivers/mfd/wm8998-tables.o
  CC      fs/coredump.o
  CC      lib/fw_table.o
  CC      fs/drop_caches.o
  CC [M]  net/ipv4/esp4_offload.o
  CC [M]  net/ipv4/ipcomp.o
  CC [M]  net/ipv4/xfrm4_tunnel.o
  CC      fs/sysctls.o
  CC [M]  drivers/mfd/cs47l24-tables.o
  CC      fs/fhandle.o
  CC [M]  lib/crc7.o
  CC      fs/bpf_fs_kfuncs.o
  CC [M]  drivers/mfd/arizona-i2c.o
  CC [M]  net/ipv4/tunnel4.o
  LD [M]  fs/nfs/nfsv4.o
  CC [M]  net/netfilter/xt_CONNSECMARK.o
  CC      kernel/iomem.o
  CC [M]  net/netfilter/xt_CT.o
  CC [M]  net/ipv4/inet_diag.o
  CC [M]  net/netfilter/xt_DSCP.o
  CC [M]  net/ipv4/tcp_diag.o
  CC [M]  lib/crc8.o
  LD [M]  drivers/acpi/video.o
  CC [M]  net/netfilter/xt_HL.o
  AR      drivers/acpi/built-in.a
  CC [M]  net/ipv4/udp_diag.o
  AR      drivers/regulator/built-in.a
  CC [M]  lib/bch.o
  CC [M]  net/ipv4/raw_diag.o
  CC [M]  net/netfilter/xt_HMARK.o
  CC [M]  drivers/mfd/arizona-spi.o
  CC      kernel/rseq.o
  CC [M]  lib/ts_kmp.o
  CC      kernel/watch_queue.o
  CC [M]  lib/ts_bm.o
  CC [M]  fs/binfmt_misc.o
  CC [M]  net/netfilter/xt_LED.o
  CC [M]  lib/ts_fsm.o
  CC [M]  lib/notifier-error-inject.o
  CHK     kernel/kheaders_data.tar.xz
  CC [M]  drivers/mfd/wcd934x.o
  CC [M]  net/netfilter/xt_LOG.o
  CC [M]  drivers/mfd/wm8994-core.o
  CC [M]  lib/pm-notifier-error-inject.o
  GZIP    kernel/config_data.gz
  CC [M]  net/netfilter/xt_NETMAP.o
  GEN     kernel/kheaders_data.tar.xz
  CC      kernel/configs.o
  CC [M]  lib/memory-notifier-error-inject.o
  CC [M]  net/netfilter/xt_NFLOG.o
  CC [M]  drivers/mfd/wm8994-irq.o
  CC [M]  lib/lru_cache.o
  CC [M]  drivers/mfd/wm8994-regmap.o
  CC [M]  net/netfilter/xt_NFQUEUE.o
  CC [M]  net/netfilter/xt_RATEEST.o
  CC [M]  drivers/mfd/madera-core.o
  CC [M]  net/netfilter/xt_REDIRECT.o
  CC [M]  drivers/mfd/cs47l15-tables.o
  CC [M]  net/netfilter/xt_MASQUERADE.o
  CC [M]  drivers/mfd/cs47l35-tables.o
  LD [M]  net/ipv4/fou.o
  CC [M]  net/netfilter/xt_SECMARK.o
  CC [M]  drivers/mfd/cs47l85-tables.o
  LD [M]  net/ipv4/gre.o
  CC [M]  net/netfilter/xt_TPROXY.o
  LD [M]  net/sunrpc/sunrpc.o
  LD [M]  net/ipv4/udp_tunnel.o
  CC [M]  drivers/mfd/cs47l90-tables.o
  CC [M]  net/netfilter/xt_TCPMSS.o
  CC [M]  net/netfilter/xt_TCPOPTSTRIP.o
  CC [M]  drivers/mfd/cs47l92-tables.o
  AR      net/ipv4/built-in.a
  CC [M]  drivers/mfd/madera-i2c.o
  CC [M]  drivers/mfd/madera-spi.o
  CC [M]  net/netfilter/xt_TEE.o
  AR      lib/lib.a
  CC [M]  net/netfilter/xt_TRACE.o
  GEN     lib/crc32table.h
  CC [M]  net/netfilter/xt_IDLETIMER.o
  CC [M]  drivers/mfd/cs40l50-core.o
  GEN     lib/crc64table.h
  CC      lib/oid_registry.o
  CC [M]  net/netfilter/xt_addrtype.o
  CC [M]  net/netfilter/xt_bpf.o
  CC      lib/crc32.o
  CC [M]  net/netfilter/xt_cluster.o
  CC      lib/crc64.o
  CC [M]  net/netfilter/xt_comment.o
  CC [M]  drivers/mfd/cs40l50-i2c.o
  CC [M]  net/netfilter/xt_connbytes.o
  CC [M]  drivers/mfd/cs40l50-spi.o
  CC [M]  net/netfilter/xt_connlabel.o
  CC [M]  drivers/mfd/tps6105x.o
  CC [M]  drivers/mfd/tps65010.o
  CC [M]  drivers/mfd/tps6507x.o
  CC [M]  net/netfilter/xt_connlimit.o
  AR      fs/built-in.a
  CC [M]  drivers/mfd/tps65086.o
  CC [M]  net/netfilter/xt_conntrack.o
  CC [M]  drivers/mfd/tps6594-core.o
  CC [M]  net/netfilter/xt_cpu.o
  CC [M]  drivers/mfd/tps6594-i2c.o
  CC [M]  net/netfilter/xt_dccp.o
  CC [M]  drivers/mfd/tps6594-spi.o
  CC [M]  net/netfilter/xt_devgroup.o
  CC [M]  net/netfilter/xt_dscp.o
  CC [M]  drivers/mfd/mc13xxx-core.o
  CC [M]  net/netfilter/xt_ecn.o
  AR      kernel/built-in.a
  CC [M]  drivers/mfd/mc13xxx-spi.o
  CC [M]  drivers/mfd/mc13xxx-i2c.o
  CC [M]  net/netfilter/xt_esp.o
  CC [M]  net/netfilter/xt_hashlimit.o
  CC [M]  net/netfilter/xt_helper.o
  CC [M]  drivers/mfd/ocelot-core.o
  CC [M]  drivers/mfd/ocelot-spi.o
  CC [M]  net/netfilter/xt_hl.o
  CC [M]  drivers/mfd/axp20x.o
  CC [M]  drivers/mfd/axp20x-i2c.o
  CC [M]  net/netfilter/xt_ipcomp.o
  CC [M]  net/netfilter/xt_iprange.o
  CC [M]  drivers/mfd/lp3943.o
  CC [M]  drivers/mfd/ti-lmu.o
  CC [M]  net/netfilter/xt_l2tp.o
  CC [M]  drivers/mfd/da9062-core.o
  AR      lib/built-in.a
  CC [M]  net/netfilter/xt_length.o
  CC [M]  drivers/mfd/da9150-core.o
  CC [M]  drivers/mfd/max77541.o
  CC [M]  drivers/mfd/max8907.o
  CC [M]  drivers/mfd/mp2629.o
  CC [M]  net/netfilter/xt_limit.o
  CC [M]  net/netfilter/xt_mac.o
  CC [M]  drivers/mfd/mt6360-core.o
  CC [M]  drivers/mfd/mt6370.o
  CC [M]  net/netfilter/xt_multiport.o
  CC [M]  drivers/mfd/mt6397-core.o
  CC [M]  net/netfilter/xt_nfacct.o
  CC [M]  net/netfilter/xt_osf.o
  CC [M]  drivers/mfd/mt6397-irq.o
  CC [M]  net/netfilter/xt_owner.o
  CC [M]  drivers/mfd/mt6358-irq.o
  CC [M]  net/netfilter/xt_cgroup.o
  CC [M]  net/netfilter/xt_physdev.o
  CC [M]  drivers/mfd/kempld-core.o
  CC [M]  net/netfilter/xt_pkttype.o
  CC [M]  drivers/mfd/intel_quark_i2c_gpio.o
  CC [M]  net/netfilter/xt_policy.o
  CC [M]  drivers/mfd/lpc_sch.o
  CC [M]  net/netfilter/xt_quota.o
  CC [M]  drivers/mfd/lpc_ich.o
  CC [M]  net/netfilter/xt_rateest.o
  CC [M]  drivers/mfd/rdc321x-southbridge.o
  CC [M]  drivers/mfd/janz-cmodio.o
  CC [M]  drivers/mfd/vx855.o
  CC [M]  drivers/mfd/wl1273-core.o
  CC [M]  net/netfilter/xt_realm.o
  CC [M]  net/netfilter/xt_recent.o
  CC [M]  drivers/mfd/si476x-cmd.o
  CC [M]  drivers/mfd/si476x-prop.o
  CC [M]  net/netfilter/xt_sctp.o
  CC [M]  drivers/mfd/si476x-i2c.o
  CC [M]  net/netfilter/xt_socket.o
  CC [M]  drivers/mfd/intel_pmc_bxt.o
  CC [M]  drivers/mfd/viperboard.o
  CC [M]  net/netfilter/xt_state.o
  CC [M]  net/netfilter/xt_statistic.o
  CC [M]  net/netfilter/xt_string.o
  CC [M]  drivers/mfd/lm3533-core.o
  CC [M]  net/netfilter/xt_tcpmss.o
  CC [M]  drivers/mfd/lm3533-ctrlbank.o
  CC [M]  net/netfilter/xt_time.o
  CC [M]  drivers/mfd/retu-mfd.o
  CC [M]  drivers/mfd/iqs62x.o
  CC [M]  net/netfilter/xt_u32.o
  CC [M]  drivers/mfd/menf21bmc.o
  CC [M]  drivers/mfd/dln2.o
  CC [M]  drivers/mfd/rt4831.o
  CC [M]  drivers/mfd/rt5033.o
  CC [M]  drivers/mfd/rt5120.o
  CC [M]  drivers/mfd/sky81452.o
  CC [M]  drivers/mfd/intel_soc_pmic_bxtwc.o
  CC [M]  drivers/mfd/intel_soc_pmic_chtdc_ti.o
  CC [M]  drivers/mfd/intel_soc_pmic_mrfld.o
  CC [M]  drivers/mfd/rave-sp.o
  CC [M]  drivers/mfd/simple-mfd-i2c.o
  CC [M]  drivers/mfd/smpro-core.o
  CC [M]  drivers/mfd/intel-m10-bmc-core.o
  CC [M]  drivers/mfd/intel-m10-bmc-spi.o
  CC [M]  drivers/mfd/atc260x-core.o
  CC [M]  drivers/mfd/atc260x-i2c.o
  LD [M]  drivers/mfd/arizona.o
  LD [M]  drivers/mfd/wm8994.o
  LD [M]  drivers/mfd/madera.o
  LD [M]  drivers/mfd/mt6397.o
  AR      drivers/mfd/built-in.a
  LD [M]  drivers/mfd/ocelot-soc.o
  LD [M]  net/netfilter/nf_conntrack.o
  LD [M]  net/netfilter/nf_conntrack_h323.o
  LD [M]  net/netfilter/nf_nat.o
  LD [M]  net/netfilter/nf_tables.o
  LD [M]  net/netfilter/nf_flow_table.o
  AR      net/netfilter/built-in.a
  AR      net/built-in.a
  LD [M]  drivers/mfd/si476x-core.o
make[3]: *** [../scripts/Makefile.build:461: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
  CC [M]  kernel/kheaders.o
make[2]: *** [/kernel/Makefile:2003: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make[1]: Leaving directory '/kernel/build64-debug'
make: *** [Makefile:248: __sub-make] Error 2
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


