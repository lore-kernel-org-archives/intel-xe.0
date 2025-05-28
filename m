Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5243C5AE59
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 07:00:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990ED10E2AE;
	Wed, 28 May 2025 07:00:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AB210E1A9;
 Wed, 28 May 2025 07:00:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EBuild=3A_failure_for_drm/i915/sbi=3A_move_under_dis?=
 =?utf-8?q?play=2C_cleanup_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 07:00:40 -0000
Message-ID: <174841564060.26775.16411960972990655821@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1748343520.git.jani.nikula@intel.com>
In-Reply-To: <cover.1748343520.git.jani.nikula@intel.com>
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

Series: drm/i915/sbi: move under display, cleanup (rev2)
URL   : https://patchwork.freedesktop.org/series/148960/
State : failure

== Summary ==

CC      net/core/net-traces.o
  CC [M]  net/dccp/timer.o
  CC      kernel/trace/trace_output.o
  CC      net/ipv4/tcp_ipv4.o
  CC      drivers/virtio/virtio_ring.o
  CC [M]  drivers/gpio/gpio-twl6040.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_mech.o
  CC      block/blk-pm.o
  CC      drivers/acpi/acpica/exoparg3.o
  CC      arch/x86/kernel/kdebugfs.o
  CC      drivers/acpi/numa/srat.o
  CC      mm/page_alloc.o
  CC [M]  sound/hda/intel-dsp-config.o
  CC [M]  sound/hda/intel-nhlt.o
  CC [M]  drivers/dma/idxd/debugfs.o
  CC [M]  fs/netfs/stats.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cnl-match.o
  CC      lib/decompress.o
  CC [M]  net/tls/tls_device_fallback.o
  CC [M]  net/bridge/netfilter/ebt_802_3.o
  CC      fs/btrfs/extent_io.o
  CC [M]  crypto/pcbc.o
  CC [M]  net/bridge/netfilter/ebt_among.o
  CC      lib/decompress_bunzip2.o
  CC      kernel/time/timer_migration.o
  CC [M]  crypto/lrw.o
  CC      drivers/acpi/acpica/exoparg6.o
  CC [M]  drivers/leds/leds-pwm.o
  CC [M]  crypto/xctr.o
  CC [M]  drivers/clk/clk_kunit_helpers.o
  CC [M]  crypto/hctr2.o
  CC [M]  drivers/video/backlight/ktd253-backlight.o
  CC [M]  net/llc/llc_s_ev.o
  CC      drivers/acpi/apei/apei-base.o
  CC      drivers/video/fbdev/core/fbcon_ud.o
  CC [M]  drivers/gpio/gpio-viperboard.o
  CC      kernel/trace/trace_seq.o
  CC      drivers/pci/slot.o
  CC      drivers/xen/xenbus/xenbus_probe.o
  CC [M]  net/l2tp/l2tp_debugfs.o
  CC      drivers/acpi/acpica/exprep.o
  CC      arch/x86/kernel/alternative.o
  CC [M]  drivers/clk/clk-cdce706.o
  CC      drivers/acpi/apei/hest.o
  CC [M]  drivers/dma/idxd/defaults.o
  CC      drivers/pmdomain/governor.o
  CC [M]  drivers/gpio/gpio-virtuser.o
  CC      block/blk-crypto.o
  CC [M]  drivers/leds/leds-regulator.o
  CC      drivers/acpi/numa/hmat.o
  CC      drivers/xen/events/events_2l.o
  CC      lib/decompress_inflate.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cfl-match.o
  CC      drivers/acpi/pmic/intel_pmic.o
  CC [M]  net/sctp/endpointola.o
  CC [M]  sound/hda/intel-sdw-acpi.o
  CC [M]  arch/x86/kvm/pmu.o
  CC [M]  sound/soc/intel/atom/sst/sst.o
  CC      kernel/bpf/tnum.o
  CC [M]  crypto/adiantum.o
  CC [M]  net/netfilter/nf_conntrack_h323_main.o
  CC      drivers/acpi/acpica/exregion.o
  CC [M]  fs/netfs/fscache_cache.o
  CC      kernel/bpf/log.o
  CC [M]  drivers/video/backlight/ktd2801-backlight.o
  CC [M]  net/bridge/netfilter/ebt_arp.o
  CC [M]  net/bridge/netfilter/ebt_ip.o
  CC [M]  drivers/gpio/gpio-virtio.o
  CC      net/ipv6/sysctl_net_ipv6.o
  CC [M]  net/llc/llc_s_st.o
  CC      drivers/video/fbdev/core/fbcon_ccw.o
  CC      net/ipv4/tcp_minisocks.o
  CC [M]  net/dccp/qpolicy.o
  CC      lib/decompress_unlz4.o
  AR      drivers/pmdomain/built-in.a
  CC      drivers/acpi/apei/erst.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_seal.o
  CC [M]  net/dccp/ccids/ccid2.o
  CC [M]  drivers/leds/leds-tca6507.o
  CC [M]  drivers/dma/idxd/perfmon.o
  CC      drivers/acpi/acpica/exresnte.o
  CC      drivers/pci/pci-acpi.o
  CC [M]  drivers/clk/clk-cs2000-cp.o
  CC      drivers/xen/xenbus/xenbus_probe_backend.o
  CC      drivers/xen/events/events_fifo.o
  CC [M]  net/l2tp/l2tp_ip6.o
  CC      kernel/time/vsyscall.o
  CC      drivers/virtio/virtio_anchor.o
  CC      drivers/regulator/helpers.o
  CC [M]  drivers/video/backlight/ktz8866.o
  CC [M]  crypto/nhpoly1305.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cml-match.o
  CC      drivers/acpi/acpica/exresolv.o
  LD [M]  net/tls/tls.o
  CC      kernel/panic.o
  CC      drivers/acpi/pmic/intel_pmic_bytcrc.o
  LD [M]  sound/hda/snd-hda-core.o
  LD [M]  sound/hda/snd-intel-dspcfg.o
  LD [M]  sound/hda/snd-intel-sdw-acpi.o
  CC [M]  net/bridge/br.o
  CC      kernel/trace/trace_stat.o
  CC [M]  drivers/gpio/gpio-vx855.o
  CC [M]  net/llc/af_llc.o
  CC      lib/decompress_unlzma.o
  CC      block/blk-crypto-profile.o
  CC [M]  net/bridge/br_device.o
  CC      drivers/regulator/devres.o
  CC      drivers/video/fbdev/core/cfbfillrect.o
  CC [M]  net/bridge/netfilter/ebt_ip6.o
  CC      net/ipv6/ip6mr.o
  CC      kernel/time/timekeeping_debug.o
  AR      drivers/acpi/numa/built-in.a
  CC      mm/shuffle.o
  CC [M]  net/sctp/associola.o
  AR      drivers/reset/amlogic/built-in.a
  AR      drivers/reset/hisilicon/built-in.a
  AR      drivers/reset/starfive/built-in.a
  AR      drivers/reset/sti/built-in.a
  CC [M]  fs/netfs/fscache_cookie.o
  AR      drivers/reset/tegra/built-in.a
  CC      drivers/acpi/acpica/exresop.o
  CC      drivers/reset/core.o
  CC [M]  sound/soc/intel/atom/sst/sst_ipc.o
  CC [M]  drivers/clk/clk-lmk04832.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_unseal.o
  CC [M]  crypto/ccm.o
  LD [M]  drivers/dma/idxd/idxd_bus.o
  LD [M]  drivers/dma/idxd/idxd.o
  CC [M]  drivers/dma/amd/ptdma/ptdma-dev.o
  CC [M]  drivers/leds/leds-ti-lmu-common.o
  CC      drivers/acpi/pmic/intel_pmic_chtcrc.o
  CC      arch/x86/kernel/i8253.o
  CC [M]  crypto/chacha20poly1305.o
  AR      drivers/xen/events/built-in.a
  CC      net/ipv4/tcp_cong.o
  CC [M]  drivers/video/backlight/lm3509_bl.o
  CC      fs/btrfs/volumes.o
  CC [M]  drivers/leds/leds-tlc591xx.o
  CC      drivers/xen/xenbus/xenbus_dev_frontend.o
  CC [M]  drivers/gpio/gpio-wcove.o
  CC      net/ipv4/tcp_metrics.o
  CC [M]  arch/x86/kvm/mtrr.o
  CC      drivers/virtio/virtio_pci_modern_dev.o
  CC [M]  net/dccp/ackvec.o
  CC      drivers/acpi/acpica/exserial.o
  CC      lib/decompress_unlzo.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-icl-match.o
  CC [M]  net/netfilter/nf_conntrack_h323_asn1.o
  CC      drivers/acpi/apei/bert.o
  CC      drivers/pci/iomap.o
  CC      drivers/xen/xenbus/xenbus_dev_backend.o
  CC      kernel/time/namespace.o
  CC      drivers/acpi/pmic/intel_pmic_xpower.o
  CC      arch/x86/kernel/hw_breakpoint.o
  CC [M]  sound/soc/intel/atom/sst/sst_stream.o
  CC [M]  net/bridge/netfilter/ebt_limit.o
  CC      net/core/drop_monitor.o
  AR      sound/built-in.a
  CC [M]  net/sunrpc/xprt.o
  CC      drivers/acpi/apei/ghes.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_wrap.o
  CC [M]  drivers/dma/amd/ptdma/ptdma-dmaengine.o
  CC      drivers/acpi/acpica/exstore.o
  CC      block/blk-crypto-sysfs.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_crypto.o
  CC [M]  drivers/video/backlight/lm3533_bl.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-tgl-match.o
  CC [M]  net/llc/llc_station.o
  CC [M]  crypto/aegis128-core.o
  CC      kernel/bpf/token.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ehl-match.o
  CC      lib/decompress_unxz.o
  CC [M]  drivers/clk/clk-max9485.o
  CC      kernel/bpf/bpf_iter.o
  CC      drivers/regulator/irq_helpers.o
  CC [M]  drivers/gpio/gpio-winbond.o
  CC [M]  drivers/leds/leds-tps6105x.o
  CC      drivers/video/fbdev/core/cfbcopyarea.o
  CC [M]  net/netfilter/nf_conntrack_irc.o
  CC      kernel/trace/trace_printk.o
  CC [M]  net/dccp/sysctl.o
  CC      kernel/bpf/map_iter.o
  CC [M]  arch/x86/kvm/debugfs.o
  CC      block/blk-crypto-fallback.o
  CC [M]  net/sctp/transport.o
  AR      kernel/time/built-in.a
  CC      drivers/reset/reset-simple.o
  CC      drivers/acpi/pmic/intel_pmic_bxtwc.o
  CC      drivers/acpi/acpica/exstoren.o
  CC [M]  fs/nfs/filelayout/filelayout.o
  CC [M]  fs/lockd/clntlock.o
  CC [M]  fs/nfs/blocklayout/blocklayout.o
  CC [M]  sound/soc/intel/atom/sst/sst_drv_interface.o
  CC [M]  fs/nfs/flexfilelayout/flexfilelayout.o
  CC      drivers/virtio/virtio_pci_legacy_dev.o
  CC      lib/decompress_unzstd.o
  CC      drivers/pci/quirks.o
  CC      mm/page_frag_cache.o
  CC      drivers/xen/xenbus/xenbus_probe_frontend.o
  CC [M]  fs/netfs/fscache_io.o
  CC [M]  net/bridge/netfilter/ebt_mark_m.o
  CC      drivers/acpi/acpica/exstorob.o
  CC [M]  drivers/dma/amd/ptdma/ptdma-debugfs.o
  CC [M]  crypto/pcrypt.o
  CC [M]  drivers/video/backlight/lm3630a_bl.o
  CC [M]  drivers/gpio/gpio-wm831x.o
  CC [M]  drivers/clk/clk-palmas.o
  CC [M]  drivers/leds/leds-wm831x-status.o
  CC      mm/init-mm.o
  CC [M]  fs/nfs/blocklayout/dev.o
  CC [M]  net/llc/llc_proc.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-jsl-match.o
  CC      drivers/acpi/pmic/intel_pmic_chtwc.o
  CC [M]  fs/netfs/fscache_main.o
  CC      drivers/video/display_timing.o
  CC      drivers/video/videomode.o
  CC      arch/x86/kernel/tsc.o
  CC      drivers/regulator/event.o
  CC      lib/dump_stack.o
  CC [M]  arch/x86/kvm/mmu/mmu.o
  CC      kernel/bpf/task_iter.o
  CC      block/holder.o
  CC      drivers/acpi/acpica/exsystem.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_keys.o
  LD [M]  net/sunrpc/auth_gss/auth_rpcgss.o
  CC      lib/earlycpio.o
  CC [M]  drivers/reset/reset-gpio.o
  CC      lib/extable.o
  CC      kernel/bpf/prog_iter.o
  CC      net/ipv4/tcp_fastopen.o
  CC [M]  net/dccp/ipv4.o
  CC [M]  sound/soc/intel/atom/sst/sst_loader.o
  CC      kernel/trace/pid_list.o
  CC [M]  drivers/gpio/gpio-wm8350.o
  CC      lib/flex_proportions.o
  CC [M]  drivers/leds/leds-wm8350.o
  CC [M]  crypto/cryptd.o
  CC [M]  fs/nfs/filelayout/filelayoutdev.o
  CC      drivers/video/fbdev/core/cfbimgblt.o
  CC [M]  drivers/acpi/apei/einj-core.o
  CC [M]  drivers/clk/clk-pwm.o
  CC      drivers/acpi/pmic/intel_pmic_chtdc_ti.o
  CC      drivers/virtio/virtio_mmio.o
  CC [M]  net/bridge/netfilter/ebt_pkttype.o
  CC [M]  net/sctp/chunk.o
  CC      drivers/acpi/acpica/extrace.o
  CC [M]  fs/nfs/client.o
  CC [M]  drivers/video/backlight/lm3639_bl.o
  CC [M]  net/netfilter/nf_conntrack_broadcast.o
  CC      mm/memblock.o
  CC      kernel/bpf/link_iter.o
  CC [M]  fs/nfs/dir.o
  CC [M]  drivers/dma/amd/ptdma/ptdma-pci.o
  CC [M]  net/llc/sysctl_net_llc.o
  AR      drivers/xen/xenbus/built-in.a
  CC [M]  net/netfilter/nf_conntrack_netbios_ns.o
  AR      drivers/xen/xen-pciback/built-in.a
  CC [M]  crypto/des_generic.o
  CC [M]  drivers/xen/xen-pciback/pci_stub.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-adl-match.o
  CC [M]  fs/smb/common/cifs_arc4.o
  CC      net/ipv6/xfrm6_policy.o
  CC [M]  drivers/reset/reset-ti-syscon.o
  CC      drivers/acpi/pmic/tps68470_pmic.o
  CC [M]  drivers/regulator/fixed.o
  CC      drivers/acpi/acpica/exutils.o
  CC [M]  fs/lockd/clntproc.o
  CC [M]  drivers/video/backlight/lp855x_bl.o
  CC [M]  drivers/gpio/gpio-wm8994.o
  CC      lib/idr.o
  CC      net/core/selftests.o
  CC [M]  drivers/leds/leds-dac124s085.o
  CC [M]  fs/smb/client/trace.o
  CC [M]  drivers/clk/clk-si5341.o
  CC [M]  block/kyber-iosched.o
  CC [M]  sound/soc/intel/atom/sst/sst_pvt.o
  CC      kernel/trace/tracing_map.o
  CC [M]  fs/nfs/blocklayout/extent_tree.o
  CC [M]  drivers/acpi/apei/einj-cxl.o
  CC [M]  net/bridge/netfilter/ebt_stp.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-rpl-match.o
  CC      drivers/virtio/virtio_pci_modern.o
  CC      arch/x86/kernel/tsc_msr.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-mtl-match.o
  CC [M]  drivers/reset/reset-tps380x.o
  LD [M]  drivers/dma/amd/ptdma/ptdma.o
  CC [M]  fs/netfs/fscache_volume.o
  AR      drivers/dma/amd/built-in.a
  LD [M]  net/llc/llc.o
  LD [M]  net/llc/llc2.o
  AR      drivers/dma/mediatek/built-in.a
  CC [M]  arch/x86/kvm/mmu/page_track.o
  AR      drivers/dma/qcom/built-in.a
  CC      drivers/acpi/acpica/hwacpi.o
  CC [M]  drivers/dma/qcom/hidma_mgmt.o
  AR      drivers/acpi/pmic/built-in.a
  CC [M]  fs/netfs/fscache_proc.o
  CC [M]  sound/sound_core.o
  CC [M]  fs/nfs/flexfilelayout/flexfilelayoutdev.o
  CC [M]  net/sctp/sm_make_chunk.o
  CC [M]  drivers/regulator/virtual.o
  CC [M]  crypto/fcrypt.o
  CC      kernel/bpf/hashtab.o
  CC      net/ipv4/tcp_rate.o
  CC [M]  fs/smb/common/cifs_md4.o
  LD [M]  fs/nfs/filelayout/nfs_layout_nfsv41_files.o
  CC [M]  net/sctp/ulpevent.o
  CC [M]  drivers/gpio/gpio-ws16c48.o
  CC [M]  net/bridge/br_fdb.o
  CC      drivers/video/fbdev/core/fb_io_fops.o
  CC      drivers/pci/ats.o
  CC [M]  drivers/video/fbdev/sm501fb.o
  CC [M]  fs/smb/client/cifsfs.o
  CC [M]  drivers/leds/leds-spi-byte.o
  LD [M]  net/sunrpc/auth_gss/rpcsec_gss_krb5.o
  CC [M]  net/sunrpc/socklib.o
  CC [M]  drivers/video/backlight/lp8788_bl.o
  CC      fs/btrfs/async-thread.o
  CC      drivers/acpi/acpica/hwesleep.o
  CC      lib/iomem_copy.o
  CC      net/ipv6/xfrm6_state.o
  CC      arch/x86/kernel/io_delay.o
  AR      drivers/reset/built-in.a
  CC      mm/memory_hotplug.o
  CC [M]  drivers/xen/xen-pciback/pciback_ops.o
  CC      lib/irq_regs.o
  CC [M]  net/sctp/inqueue.o
  CC [M]  net/bridge/netfilter/ebt_vlan.o
  CC [M]  drivers/clk/clk-si5351.o
  CC      mm/slub.o
  CC [M]  drivers/gpio/gpio-xra1403.o
  CC [M]  net/netfilter/nf_conntrack_snmp.o
  CC [M]  crypto/blowfish_generic.o
  CC      drivers/acpi/acpica/hwgpe.o
  AR      drivers/acpi/apei/built-in.a
  CC      kernel/trace/trace_sched_switch.o
  LD [M]  drivers/acpi/apei/einj.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-arl-match.o
  CC [M]  sound/ac97_bus.o
  CC [M]  drivers/regulator/userspace-consumer.o
  CC [M]  sound/soc/intel/atom/sst/sst_pci.o
  CC [M]  fs/nfs/blocklayout/rpc_pipefs.o
  CC [M]  drivers/leds/uleds.o
  CC [M]  net/dccp/ipv6.o
  CC [M]  drivers/video/fbdev/udlfb.o
  CC [M]  drivers/dma/qcom/hidma_mgmt_sys.o
  CC [M]  drivers/video/backlight/lv5207lp.o
  CC [M]  block/bfq-iosched.o
  CC      lib/is_single_threaded.o
  CC [M]  drivers/clk/clk-si544.o
  CC      arch/x86/kernel/rtc.o
  CC [M]  fs/smb/client/cifs_debug.o
  CC      drivers/virtio/virtio_pci_common.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-lnl-match.o
  CC      drivers/acpi/acpica/hwregs.o
  CC      fs/btrfs/ioctl.o
  CC [M]  drivers/xen/xen-pciback/xenbus.o
  LD [M]  fs/nfs/flexfilelayout/nfs_layout_flexfiles.o
  CC      drivers/pci/iov.o
  CC      arch/x86/kernel/resource.o
  CC      net/ipv6/xfrm6_input.o
  CC [M]  fs/netfs/fscache_stats.o
  CC [M]  drivers/xen/xen-pciback/conf_space.o
  CC [M]  fs/lockd/clntxdr.o
  CC [M]  drivers/clk/clk-tps68470.o
  AS      arch/x86/kernel/irqflags.o
  CC      drivers/video/fbdev/core/sysfillrect.o
  CC [M]  crypto/blowfish_common.o
  CC      net/core/timestamping.o
  CC      lib/klist.o
  CC [M]  drivers/regulator/88pg86x.o
  CC [M]  sound/soc/intel/atom/sst/sst_acpi.o
  CC [M]  drivers/clk/clk-twl6040.o
  AR      drivers/leds/built-in.a
  CC [M]  net/bridge/netfilter/ebt_arpreply.o
  CC      drivers/pci/pci-label.o
  CC      arch/x86/kernel/static_call.o
  AR      drivers/gpio/built-in.a
  CC      drivers/video/fbdev/core/syscopyarea.o
  CC [M]  net/sunrpc/xprtsock.o
  CC      kernel/trace/trace_functions.o
  CC      drivers/pci/p2pdma.o
  CC [M]  drivers/video/backlight/max8925_bl.o
  CC      drivers/acpi/acpica/hwsleep.o
  CC      net/ipv4/tcp_recovery.o
  CC [M]  net/rds/af_rds.o
  CC      drivers/pci/vgaarb.o
  CC [M]  drivers/xen/xen-pciback/conf_space_header.o
  CC      drivers/acpi/dptf/int340x_thermal.o
  CC [M]  drivers/dma/qcom/hidma_ll.o
  LD [M]  fs/nfs/blocklayout/blocklayoutdriver.o
  CC      drivers/pci/doe.o
  CC [M]  net/sctp/outqueue.o
  CC [M]  net/bridge/netfilter/ebt_mark.o
  CC      lib/kobject.o
  CC [M]  sound/soc/intel/atom/sst-mfld-platform-pcm.o
  CC [M]  net/rds/bind.o
  CC      kernel/bpf/arraymap.o
  CC      drivers/virtio/virtio_pci_legacy.o
  CC      drivers/video/fbdev/core/sysimgblt.o
  CC      drivers/acpi/acpica/hwvalid.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ptl-match.o
  CC [M]  net/bridge/br_forward.o
  CC [M]  net/rds/cong.o
  CC [M]  drivers/regulator/88pm800-regulator.o
  CC [M]  net/netfilter/nf_conntrack_pptp.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-core.o
  CC [M]  drivers/clk/clk-twl.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-pci.o
  CC [M]  drivers/acpi/dptf/dptf_power.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-acpi.o
  CC      kernel/cpu.o
  CC      drivers/virtio/virtio_pci_admin_legacy_io.o
  CC [M]  drivers/video/backlight/mp3309c.o
  CC [M]  fs/lockd/host.o
  CC [M]  crypto/twofish_generic.o
  LD [M]  fs/netfs/netfs.o
  CC      kernel/exit.o
  CC      drivers/acpi/acpica/hwxface.o
  CC [M]  drivers/xen/xenfs/super.o
  CC      drivers/tty/vt/vt_ioctl.o
  CC      arch/x86/kernel/process.o
  CC [M]  fs/nfs/file.o
  CC      mm/madvise.o
  CC [M]  net/dccp/diag.o
  CC [M]  drivers/xen/xen-pciback/conf_space_capability.o
  CC [M]  drivers/dma/qcom/hidma.o
  CC      drivers/video/fbdev/core/fb_sys_fops.o
  CC      kernel/trace/trace_preemptirq.o
  CC      drivers/tty/vt/vc_screen.o
  CC [M]  fs/smb/client/connect.o
  CC [M]  drivers/regulator/88pm8607.o
  CC      drivers/tty/vt/selection.o
  CC      net/ipv4/tcp_ulp.o
  CC [M]  net/bridge/netfilter/ebt_dnat.o
  CC [M]  drivers/clk/clk-wm831x.o
  CC      lib/kobject_uevent.o
  CC [M]  drivers/acpi/dptf/dptf_pch_fivr.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-hda-match.o
  CC [M]  drivers/dma/qcom/hidma_dbg.o
  CC      net/core/ptp_classifier.o
  CC [M]  net/netfilter/nf_conntrack_sane.o
  CC [M]  crypto/twofish_common.o
  CC [M]  drivers/pci/pci-stub.o
  CC      drivers/acpi/acpica/hwxfsleep.o
  CC [M]  drivers/video/vgastate.o
  CC [M]  drivers/video/backlight/mt6370-backlight.o
  CC      kernel/trace/trace_sched_wakeup.o
  CC [M]  drivers/xen/xenfs/xenstored.o
  CC [M]  sound/soc/intel/atom/sst-mfld-platform-compress.o
  CC      drivers/acpi/x86/apple.o
  CC      net/ipv6/xfrm6_output.o
  CC [M]  drivers/xen/xen-pciback/conf_space_quirks.o
  CC [M]  drivers/regulator/aat2870-regulator.o
  CC      net/ipv4/tcp_offload.o
  CC [M]  net/sctp/ulpqueue.o
  CC      drivers/virtio/virtio_balloon.o
  CC      drivers/xen/cpu_hotplug.o
  CC [M]  fs/romfs/storage.o
  CC      kernel/bpf/percpu_freelist.o
  AR      drivers/acpi/dptf/built-in.a
  CC      kernel/trace/trace_hwlat.o
  CC [M]  fs/lockd/svc.o
  AR      drivers/clk/built-in.a
  LD [M]  drivers/dma/qcom/hdma_mgmt.o
  LD [M]  net/dccp/dccp.o
  CC      net/ipv6/xfrm6_protocol.o
  AR      drivers/dma/stm32/built-in.a
  CC      fs/btrfs/locking.o
  LD [M]  net/dccp/dccp_ipv4.o
  LD [M]  drivers/dma/qcom/hdma.o
  LD [M]  net/dccp/dccp_ipv6.o
  LD [M]  net/dccp/dccp_diag.o
  CC [M]  net/sunrpc/sched.o
  AR      drivers/dma/ti/built-in.a
  AR      drivers/dma/xilinx/built-in.a
  CC [M]  drivers/dma/xilinx/xilinx_dma.o
  CC      drivers/acpi/acpica/hwpci.o
  CC [M]  drivers/pci/pci-pf-stub.o
  CC [M]  drivers/video/fbdev/core/fb_ddc.o
  CC [M]  fs/smb/client/dir.o
  CC [M]  drivers/xen/xenfs/xensyms.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.o
  CC [M]  drivers/video/backlight/pandora_bl.o
  CC [M]  net/bridge/netfilter/ebt_redirect.o
  CC      net/core/netprio_cgroup.o
  CC      drivers/acpi/x86/cmos_rtc.o
  CC      kernel/bpf/bpf_lru_list.o
  CC [M]  sound/soc/intel/atom/sst-atom-controls.o
  CC      lib/logic_pio.o
  CC      drivers/tty/vt/keyboard.o
  CC [M]  net/rds/connection.o
  CC [M]  drivers/xen/xen-pciback/vpci.o
  CC [M]  drivers/dma/xilinx/xdma.o
  LD [M]  sound/soundcore.o
  CC [M]  net/9p/mod.o
  CC [M]  net/psample/psample.o
  CC [M]  net/netfilter/nf_conntrack_sip.o
  CC [M]  fs/nfs/getroot.o
  CC [M]  fs/romfs/super.o
  CC [M]  drivers/regulator/act8865-regulator.o
  CC      drivers/acpi/acpica/nsaccess.o
  CC [M]  block/bfq-wf2q.o
  CC      drivers/acpi/x86/lpss.o
  CC [M]  block/bfq-cgroup.o
  CC      arch/x86/kernel/ptrace.o
  CC [M]  drivers/pci/xen-pcifront.o
  CC      kernel/bpf/lpm_trie.o
  CC [M]  fs/nfs/inode.o
  CC      net/core/netclassid_cgroup.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ssp-common.o
  CC      kernel/trace/trace_osnoise.o
  CC      drivers/acpi/x86/s2idle.o
  CC [M]  drivers/virtio/virtio_input.o
  LD [M]  drivers/xen/xenfs/xenfs.o
  CC [M]  fs/lockd/svclock.o
  CC      lib/maple_tree.o
  CC      drivers/acpi/x86/utils.o
  CC      drivers/acpi/x86/blacklist.o
  CC      fs/btrfs/orphan.o
  CC [M]  drivers/video/backlight/pwm_bl.o
  CC      drivers/acpi/acpica/nsalloc.o
  CC      net/ipv6/netfilter.o
  CC [M]  fs/autofs/init.o
  CC [M]  net/sctp/tsnmap.o
  CC [M]  drivers/xen/xen-pciback/passthrough.o
  CC      drivers/tty/vt/vt.o
  CC [M]  net/rds/info.o
  CC [M]  arch/x86/kvm/mmu/spte.o
  CC      kernel/bpf/map_in_map.o
  AR      drivers/video/fbdev/core/built-in.a
  CC [M]  drivers/video/fbdev/smscufx.o
  CC [M]  net/bridge/netfilter/ebt_snat.o
  CC [M]  net/9p/client.o
  CC [M]  drivers/regulator/ad5398.o
  LD [M]  sound/soc/intel/atom/snd-soc-sst-atom-hifi2-platform.o
  LD [M]  fs/romfs/romfs.o
  CC      mm/page_io.o
  CC      drivers/xen/grant-table.o
  CC      kernel/bpf/bloom_filter.o
  CC [M]  crypto/serpent_generic.o
  CC      kernel/trace/trace_nop.o
  CC      drivers/acpi/acpica/nsarguments.o
  COPY    drivers/tty/vt/defkeymap.c
  CC      net/ipv6/fib6_rules.o
  CC [M]  drivers/dma/dw/core.o
  LD [M]  block/bfq.o
  CC [M]  drivers/virtio/virtio_vdpa.o
  AR      block/built-in.a
  CC [M]  drivers/dma/dw-edma/dw-edma-core.o
  CC [M]  fs/lockd/svcshare.o
  CC [M]  net/bridge/netfilter/ebt_log.o
  CC [M]  net/bridge/netfilter/ebt_nflog.o
  CC      fs/btrfs/export.o
  AR      drivers/pci/built-in.a
  CC [M]  fs/nfs/super.o
  CC      arch/x86/kernel/tls.o
  CC [M]  net/rds/message.o
  CC [M]  fs/autofs/inode.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-sdca-quirks.o
  CC      net/ipv4/tcp_plb.o
  CC [M]  net/vmw_vsock/af_vsock.o
  CC [M]  drivers/video/backlight/qcom-wled.o
  CC      net/devres.o
  CC      drivers/acpi/acpica/nsconvert.o
  LD [M]  drivers/xen/xen-pciback/xen-pciback.o
  CC      kernel/bpf/local_storage.o
  CC [M]  net/vmw_vsock/af_vsock_tap.o
  CC      net/socket.o
  CC [M]  drivers/regulator/arizona-ldo1.o
  CC      net/compat.o
  CC [M]  drivers/acpi/nfit/core.o
  CC      arch/x86/kernel/step.o
  CC [M]  net/rds/recv.o
  AR      drivers/acpi/x86/built-in.a
  CC [M]  drivers/acpi/nfit/intel.o
  CC      net/core/lwtunnel.o
  CC [M]  fs/smb/client/file.o
  CC [M]  net/sctp/bind_addr.o
  CC [M]  fs/nfs/io.o
  CC [M]  net/9p/error.o
  CC      drivers/acpi/acpica/nsdump.o
  CC      mm/swap_state.o
  CC [M]  net/vmw_vsock/vsock_addr.o
  CC      drivers/acpi/acpica/nseval.o
  CC [M]  fs/autofs/root.o
  CC [M]  drivers/video/fbdev/xen-fbfront.o
  CC [M]  fs/lockd/svcproc.o
  CC [M]  fs/autofs/symlink.o
  CC [M]  drivers/video/backlight/rt4831-backlight.o
  CC [M]  fs/lockd/svcsubs.o
  CC      fs/btrfs/tree-log.o
  CC [M]  arch/x86/kvm/mmu/tdp_iter.o
  CC [M]  drivers/regulator/arizona-micsupp.o
  CC [M]  drivers/virtio/virtio_mem.o
  CC      arch/x86/kernel/tboot.o
  LD [M]  sound/soc/intel/common/snd-soc-acpi-intel-match.o
  LD [M]  sound/soc/intel/common/snd-soc-acpi-intel-sdca-quirks.o
  CC [M]  net/bridge/br_if.o
  CC [M]  net/netfilter/nf_conntrack_tftp.o
  CC [M]  net/vmw_vsock/vsock_bpf.o
  CC [M]  sound/soc/sdca/sdca_functions.o
  CC      arch/x86/kernel/i8237.o
  CC      kernel/trace/trace_stack.o
  CC      kernel/softirq.o
  CC      drivers/acpi/acpica/nsinit.o
  CC      drivers/xen/features.o
  CC [M]  drivers/dma/dw-edma/dw-edma-v0-core.o
  CC [M]  crypto/sm4.o
  CC [M]  fs/fuse/dev.o
  CC [M]  drivers/dma/dw/dw.o
  CC      kernel/bpf/queue_stack_maps.o
  CC [M]  fs/nfs/direct.o
  CC [M]  sound/soc/sdca/sdca_device.o
  CC [M]  drivers/regulator/as3711-regulator.o
  CC [M]  sound/soc/sdca/sdca_regmap.o
  CC      kernel/bpf/ringbuf.o
  CC [M]  drivers/regulator/atc260x-regulator.o
  CC      net/ipv6/proc.o
  CC [M]  drivers/video/backlight/kb3886_bl.o
  CC [M]  net/sctp/socket.o
  CC      net/core/lwt_bpf.o
  CC      drivers/acpi/acpica/nsload.o
  CC [M]  fs/autofs/waitq.o
  CC      net/ipv6/syncookies.o
  CC [M]  arch/x86/kvm/mmu/tdp_mmu.o
  CC [M]  drivers/video/fbdev/uvesafb.o
  CC      net/ipv4/datagram.o
  CC [M]  net/9p/protocol.o
  CC      arch/x86/kernel/stacktrace.o
  CC [M]  drivers/video/fbdev/vga16fb.o
  CC      net/core/dst_cache.o
  CC      mm/swapfile.o
  CC      lib/memcat_p.o
  CC [M]  net/bridge/br_input.o
  CC [M]  drivers/dma/dw-edma/dw-hdma-v0-core.o
  CC      kernel/trace/trace_mmiotrace.o
  CC      drivers/acpi/acpica/nsnames.o
  CC [M]  drivers/acpi/nfit/mce.o
  CC      drivers/tty/hvc/hvc_console.o
  CC      drivers/tty/vt/consolemap.o
  CC      drivers/xen/balloon.o
  CC      kernel/resource.o
  CC      drivers/xen/manage.o
  CC [M]  crypto/sm4_generic.o
  CC [M]  drivers/regulator/aw37503-regulator.o
  CC [M]  net/rds/send.o
  HOSTCC  drivers/tty/vt/conmakehash
  CC [M]  drivers/dma/dw/idma32.o
  CC [M]  net/vmw_vsock/diag.o
  CC      net/ipv6/calipso.o
  CC [M]  fs/lockd/mon.o
  CC [M]  drivers/video/backlight/sky81452-backlight.o
  CC      lib/min_heap.o
  CC [M]  fs/lockd/trace.o
  CC      arch/x86/kernel/reboot.o
  CC [M]  drivers/virtio/virtio_dma_buf.o
  CC      kernel/sysctl.o
  CC      drivers/acpi/acpica/nsobject.o
  LD [M]  sound/soc/sdca/snd-soc-sdca.o
  CC [M]  fs/autofs/expire.o
  CC      kernel/bpf/bpf_local_storage.o
  CC [M]  drivers/dma/dw-edma/dw-edma-v0-debugfs.o
  CC [M]  crypto/aes_ti.o
  CC      mm/zswap.o
  CC [M]  fs/lockd/xdr.o
  CC [M]  net/netfilter/nf_log_syslog.o
  CC [M]  sound/soc/soc-acpi.o
  LD [M]  drivers/acpi/nfit/nfit.o
  CC      kernel/capability.o
  CC      kernel/ptrace.o
  CC      kernel/trace/trace_functions_graph.o
  CC [M]  drivers/regulator/axp20x-regulator.o
  CC      net/ipv6/seg6_iptunnel.o
  CC      mm/dmapool.o
  CC [M]  net/9p/trans_common.o
  CC      drivers/acpi/acpica/nsparse.o
  CC [M]  drivers/dma/dw/acpi.o
  CC [M]  crypto/camellia_generic.o
  CC [M]  drivers/video/backlight/wm831x_bl.o
  CC [M]  net/rds/stats.o
  CC [M]  net/vmw_vsock/vmci_transport.o
  CC      lib/nmi_backtrace.o
  CC      drivers/tty/hvc/hvc_irq.o
  AR      drivers/video/fbdev/built-in.a
  CC [M]  net/sunrpc/auth.o
  CC      drivers/tty/serial/8250/8250_core.o
  CC [M]  fs/smb/client/inode.o
  CC [M]  drivers/tty/serial/jsm/jsm_driver.o
  CC [M]  fs/autofs/dev-ioctl.o
  CC      drivers/tty/vt/defkeymap.o
  CC      drivers/tty/serial/8250/8250_platform.o
  CC      drivers/xen/time.o
  CC [M]  drivers/dma/dw-edma/dw-hdma-v0-debugfs.o
  CC      drivers/acpi/acpica/nspredef.o
  CC      drivers/tty/serial/serial_core.o
  CC      net/core/gro_cells.o
  AR      drivers/virtio/built-in.a
  CC      kernel/bpf/bpf_task_storage.o
  CC [M]  fs/nfs/pagelist.o
  CC [M]  fs/fuse/dir.o
  CC      fs/btrfs/free-space-cache.o
  CC      net/core/failover.o
  CC      net/ipv4/raw.o
  CONMK   drivers/tty/vt/consolemap_deftbl.c
  CC      drivers/tty/vt/consolemap_deftbl.o
  AR      drivers/tty/vt/built-in.a
  CC      mm/hugetlb.o
  CC [M]  drivers/tty/serial/jsm/jsm_neo.o
  CC      arch/x86/kernel/early-quirks.o
  CC [M]  drivers/regulator/bcm590xx-regulator.o
  CC [M]  fs/lockd/netlink.o
  CC [M]  drivers/video/backlight/arcxcnn_bl.o
  CC      net/core/skmsg.o
  CC      drivers/tty/hvc/hvc_xen.o
  CC [M]  sound/soc/soc-core.o
  CC [M]  net/bridge/br_ioctl.o
  CC [M]  arch/x86/kvm/hyperv.o
  CC [M]  net/9p/trans_fd.o
  CC      drivers/xen/mem-reservation.o
  CC      drivers/acpi/acpica/nsprepkg.o
  CC      lib/objpool.o
  CC      mm/hugetlb_vmemmap.o
  CC [M]  fs/nfs/read.o
  CC [M]  fs/overlayfs/super.o
  CC [M]  drivers/dma/dw/platform.o
  CC      kernel/trace/blktrace.o
  CC [M]  net/netfilter/nf_nat_core.o
  CC [M]  drivers/dma/dw-edma/dw-edma-pcie.o
  CC [M]  net/sctp/primitive.o
  CC [M]  fs/overlayfs/namei.o
  CC      drivers/char/hw_random/core.o
  CC [M]  crypto/cast_common.o
  LD [M]  fs/autofs/autofs4.o
  CC      drivers/tty/serial/8250/8250_pnp.o
  CC [M]  drivers/char/hw_random/timeriomem-rng.o
  CC      drivers/acpi/acpica/nsrepair.o
  CC      drivers/tty/serial/8250/8250_rsa.o
  CC [M]  net/vmw_vsock/vmci_transport_notify.o
  CC      kernel/bpf/bpf_inode_storage.o
  CC [M]  drivers/video/backlight/rave-sp-backlight.o
  CC [M]  drivers/regulator/bd9571mwv-regulator.o
  CC [M]  fs/lockd/clnt4xdr.o
  CC      drivers/acpi/acpica/nsrepair2.o
  CC [M]  net/rds/sysctl.o
  CC [M]  drivers/tty/serial/jsm/jsm_tty.o
  CC      lib/plist.o
  CC      drivers/acpi/tables.o
  CC [M]  fs/overlayfs/util.o
  CC [M]  drivers/dma/dw/pci.o
  AR      drivers/tty/hvc/built-in.a
  CC [M]  fs/overlayfs/inode.o
  CC [M]  arch/x86/kvm/xen.o
  CC      lib/radix-tree.o
  CC [M]  fs/overlayfs/file.o
  CC      kernel/bpf/disasm.o
  CC [M]  fs/fuse/file.o
  CC      drivers/xen/pci.o
  CC      net/core/sock_map.o
  LD [M]  drivers/dma/dw-edma/dw-edma.o
  CC [M]  fs/fuse/inode.o
  CC      net/ipv6/seg6_local.o
  CC      kernel/trace/fgraph.o
  CC [M]  crypto/cast5_generic.o
  CC [M]  fs/fuse/control.o
  CC [M]  net/bridge/br_stp.o
  CC      arch/x86/kernel/smp.o
  CC      drivers/tty/serial/8250/8250_port.o
  CC [M]  net/9p/trans_xen.o
  CC      drivers/char/agp/backend.o
  CC      drivers/acpi/acpica/nssearch.o
  CC [M]  drivers/char/tpm/st33zp24/st33zp24.o
  CC      mm/mempolicy.o
  CC [M]  drivers/char/hw_random/intel-rng.o
  CC [M]  drivers/regulator/da903x-regulator.o
  CC [M]  net/vmw_vsock/vmci_transport_notify_qstate.o
  CC [M]  arch/x86/kvm/smm.o
  LD [M]  drivers/dma/dw/dw_dmac_core.o
  LD [M]  drivers/dma/dw/dw_dmac.o
  LD [M]  drivers/dma/dw/dw_dmac_pci.o
  AR      drivers/video/backlight/built-in.a
  AR      drivers/video/built-in.a
  CC [M]  drivers/dma/ioat/init.o
  CC [M]  net/rds/threads.o
  CC [M]  net/sunrpc/auth_null.o
  CC      drivers/acpi/osi.o
  CC      lib/ratelimit.o
  CC      drivers/acpi/acpica/nsutils.o
  CC [M]  fs/lockd/xdr4.o
  CC [M]  drivers/tty/serial/jsm/jsm_cls.o
  CC      fs/btrfs/zlib.o
  CC [M]  drivers/char/mwave/mwavedd.o
  CC [M]  drivers/dma/sf-pdma/sf-pdma.o
  CC      kernel/bpf/mprog.o
  CC      net/ipv4/udp.o
  CC      net/core/bpf_sk_storage.o
  CC      net/ipv4/udplite.o
  CC      drivers/xen/dbgp.o
  CC [M]  net/sctp/output.o
  CC [M]  drivers/char/hw_random/amd-rng.o
  CC [M]  fs/overlayfs/dir.o
  CC [M]  fs/smb/client/link.o
  CC [M]  arch/x86/kvm/kvm_onhyperv.o
  CC [M]  net/9p/trans_virtio.o
  CC      lib/rbtree.o
  CC [M]  crypto/cast6_generic.o
  CC [M]  drivers/regulator/da9052-regulator.o
  CC      net/ipv6/seg6_hmac.o
  CC      drivers/acpi/acpica/nswalk.o
  CC [M]  net/bridge/br_stp_bpdu.o
  CC [M]  fs/nfs/symlink.o
  CC      kernel/trace/trace_events.o
  CC      net/ipv6/ioam6_iptunnel.o
  CC [M]  net/vmw_vsock/virtio_transport.o
  CC      drivers/char/agp/generic.o
  CC [M]  fs/nfs/unlink.o
  CC [M]  net/netfilter/nf_nat_proto.o
  CC [M]  drivers/char/tpm/st33zp24/i2c.o
  CC [M]  drivers/char/mwave/smapi.o
  LD [M]  drivers/tty/serial/jsm/jsm.o
  CC [M]  net/sunrpc/auth_tls.o
  CC      net/core/devmem.o
  CC      drivers/char/agp/isoch.o
  CC      drivers/acpi/acpica/nsxfeval.o
  CC [M]  drivers/dma/ioat/dma.o
  CC      net/sysctl_net.o
  CC [M]  drivers/char/hw_random/ba431-rng.o
  CC      arch/x86/kernel/smpboot.o
  CC      lib/seq_buf.o
  CC [M]  drivers/char/hw_random/via-rng.o
  CC      drivers/xen/acpi.o
  CC [M]  fs/fuse/xattr.o
  CC      arch/x86/kernel/tsc_sync.o
  CC      kernel/bpf/trampoline.o
  CC [M]  sound/soc/soc-dapm.o
  CC      fs/btrfs/lzo.o
  CC [M]  fs/lockd/svc4proc.o
  CC [M]  crypto/aria_generic.o
  CC [M]  drivers/regulator/da9055-regulator.o
  CC [M]  fs/fuse/acl.o
  CC [M]  net/core/pktgen.o
  CC      fs/btrfs/zstd.o
  CC [M]  drivers/char/mwave/tp3780i.o
  CC [M]  drivers/char/xillybus/xillybus_class.o
  CC [M]  drivers/char/tpm/st33zp24/spi.o
  CC [M]  net/sctp/input.o
  CC [M]  fs/overlayfs/readdir.o
  CC      drivers/char/agp/amd64-agp.o
  CC [M]  drivers/char/hw_random/virtio-rng.o
  CC [M]  fs/lockd/procfs.o
  CC [M]  net/netfilter/nf_nat_helper.o
  CC [M]  net/sctp/debug.o
  CC [M]  net/rds/transport.o
  CC      drivers/acpi/acpica/nsxfname.o
  LD [M]  net/9p/9pnet.o
  CC [M]  net/bridge/br_stp_if.o
  LD [M]  net/9p/9pnet_fd.o
  LD [M]  net/9p/9pnet_xen.o
  LD [M]  net/9p/9pnet_virtio.o
  CC      drivers/tty/serial/8250/8250_dma.o
  CC      drivers/char/agp/intel-agp.o
  CC      drivers/tty/serdev/core.o
  CC [M]  arch/x86/kvm/vmx/vmx.o
  CC [M]  net/bridge/br_stp_timer.o
  LD [M]  drivers/char/tpm/st33zp24/tpm_st33zp24.o
  CC [M]  fs/overlayfs/copy_up.o
  AR      drivers/tty/ipwireless/built-in.a
  CC [M]  net/sctp/stream.o
  CC [M]  fs/smb/client/misc.o
  CC [M]  net/vmw_vsock/virtio_transport_common.o
  CC [M]  net/sunrpc/auth_unix.o
  CC [M]  drivers/dma/ioat/prep.o
  CC [M]  fs/overlayfs/export.o
  CC [M]  fs/fuse/readdir.o
  CC [M]  fs/nfs/write.o
  CC      lib/siphash.o
  CC      kernel/bpf/btf.o
  CC [M]  drivers/regulator/da9062-regulator.o
  CC      net/ipv6/addrconf_core.o
  CC [M]  drivers/char/mwave/3780i.o
  CC      mm/sparse.o
  CC      drivers/tty/serdev/serdev-ttyport.o
  CC      drivers/xen/xen-acpi-pad.o
  CC      kernel/user.o
  CC [M]  drivers/char/hw_random/xiphera-trng.o
  CC [M]  crypto/chacha_generic.o
  LD [M]  drivers/char/tpm/st33zp24/tpm_st33zp24_i2c.o
  LD [M]  drivers/char/tpm/st33zp24/tpm_st33zp24_spi.o
  CC      drivers/char/tpm/tpm-chip.o
  CC [M]  drivers/char/xillybus/xillybus_core.o
  LD [M]  fs/lockd/lockd.o
  CC      drivers/iommu/amd/iommu.o
  CC      drivers/iommu/intel/dmar.o
  CC      drivers/acpi/acpica/nsxfobj.o
  CC      drivers/char/agp/intel-gtt.o
  AR      drivers/iommu/arm/arm-smmu/built-in.a
  CC      lib/string.o
  AR      drivers/iommu/arm/arm-smmu-v3/built-in.a
  AR      drivers/iommu/arm/built-in.a
  CC      drivers/iommu/intel/iommu.o
  CC      kernel/trace/trace_export.o
  CC      fs/btrfs/compression.o
  CC      drivers/acpi/osl.o
  CC      arch/x86/kernel/setup_percpu.o
  CC [M]  fs/smb/client/netmisc.o
  CC [M]  net/rds/loop.o
  CC      kernel/signal.o
  CC [M]  net/bridge/br_netlink.o
  CC      kernel/sys.o
  CC      lib/timerqueue.o
  CC [M]  crypto/poly1305_generic.o
  CC      drivers/acpi/acpica/psargs.o
  CC      net/ipv6/exthdrs_core.o
  CC      lib/union_find.o
  CC      kernel/umh.o
  CC [M]  fs/fuse/ioctl.o
  CC      drivers/tty/serial/8250/8250_dwlib.o
  AR      drivers/tty/serdev/built-in.a
  CC      drivers/xen/pcpu.o
  AR      drivers/char/hw_random/built-in.a
  CC [M]  drivers/regulator/da9210-regulator.o
  CC      lib/vsprintf.o
  CC [M]  sound/soc/soc-jack.o
  CC [M]  fs/overlayfs/params.o
  CC [M]  net/sunrpc/svc.o
  LD [M]  drivers/char/mwave/mwave.o
  CC      drivers/iommu/iommufd/iova_bitmap.o
  AR      drivers/iommu/riscv/built-in.a
  CC      drivers/iommu/iommufd/driver.o
  CC [M]  drivers/dma/ioat/dca.o
  CC      arch/x86/kernel/mpparse.o
  CC      drivers/iommu/iommu.o
  CC [M]  drivers/dma/ioat/sysfs.o
  CC      kernel/trace/trace_syscalls.o
  CC [M]  fs/smb/client/smbencrypt.o
  AR      drivers/gpu/host1x/built-in.a
  CC      drivers/acpi/acpica/psloop.o
  CC [M]  fs/9p/vfs_super.o
  CC [M]  crypto/michael_mic.o
  CC      drivers/char/tpm/tpm-dev-common.o
  AR      drivers/gpu/drm/tests/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_kunit_helpers.o
  CC      drivers/dma/dmaengine.o
  CC [M]  net/netfilter/nf_nat_redirect.o
  CC [M]  net/sctp/auth.o
  CC      drivers/xen/biomerge.o
  CC [M]  fs/9p/vfs_inode.o
  CC [M]  drivers/regulator/da9211-regulator.o
  CC      kernel/bpf/memalloc.o
  CC      net/ipv4/udp_offload.o
  CC      mm/sparse-vmemmap.o
  CC [M]  drivers/char/xillybus/xillybus_pcie.o
  LD [M]  drivers/dma/ioat/ioatdma.o
  CC [M]  net/rds/page.o
  CC [M]  net/bridge/br_netlink_tunnel.o
  CC [M]  fs/smb/client/transport.o
  CC      drivers/acpi/acpica/psobject.o
  CC      drivers/char/agp/via-agp.o
  CC      drivers/iommu/intel/pasid.o
  CC [M]  fs/overlayfs/xattrs.o
  CC      fs/btrfs/delayed-ref.o
  AR      drivers/gpu/drm/arm/built-in.a
  CC      arch/x86/kernel/ftrace.o
  CC      drivers/iommu/iommu-traces.o
  CC      arch/x86/kvm/kvm-asm-offsets.s
  CC [M]  crypto/crc32_generic.o
  CC      drivers/tty/serial/8250/8250_fintek.o
  CC [M]  drivers/iommu/iommufd/device.o
  AR      net/core/built-in.a
  CC      drivers/iommu/amd/init.o
  CC [M]  net/vmw_vsock/hyperv_transport.o
  CC      kernel/bpf/rqspinlock.o
  CC [M]  fs/fuse/iomode.o
  CC [M]  net/rds/rdma.o
  CC      drivers/char/tpm/tpm-dev.o
  CC      kernel/trace/trace_event_perf.o
  CC [M]  sound/soc/soc-utils.o
  CC      drivers/xen/xen-balloon.o
  CC      lib/win_minmax.o
  CC      drivers/acpi/acpica/psopcode.o
  CC      net/ipv6/ip6_checksum.o
  CC [M]  arch/x86/kvm/vmx/pmu_intel.o
  CC [M]  drivers/char/xillybus/xillyusb.o
  CC      drivers/gpu/drm/clients/drm_client_setup.o
  CC [M]  drivers/regulator/fan53555.o
  CC [M]  drivers/char/agp/sis-agp.o
  CC [M]  crypto/authenc.o
  LD [M]  fs/overlayfs/overlay.o
  CC      drivers/gpu/drm/clients/drm_fbdev_client.o
  CC [M]  drivers/gpu/drm/tests/drm_atomic_test.o
  CC      lib/xarray.o
  CC [M]  fs/9p/vfs_inode_dotl.o
  CC      drivers/tty/serial/8250/8250_pcilib.o
  CC      drivers/acpi/acpica/psopinfo.o
  CC [M]  fs/nfs/namespace.o
  CC [M]  drivers/gpu/drm/tests/drm_atomic_state_test.o
  CC      mm/mmu_notifier.o
  AS      arch/x86/kernel/ftrace_64.o
  CC [M]  fs/fuse/dax.o
  CC [M]  drivers/gpu/drm/tests/drm_bridge_test.o
  CC [M]  crypto/authencesn.o
  CC      drivers/char/tpm/tpm-interface.o
  CC [M]  net/sctp/offload.o
  CC [M]  net/bridge/br_arp_nd_proxy.o
  CC      drivers/iommu/iommu-sysfs.o
  CC      drivers/dma/virt-dma.o
  CC      drivers/acpi/acpica/psparse.o
  CC [M]  net/vmw_vsock/vsock_loopback.o
  CC [M]  fs/9p/vfs_addr.o
  CC      arch/x86/kernel/trace_clock.o
  CC      drivers/dma/acpi-dma.o
  CC [M]  sound/soc/soc-dai.o
  AR      drivers/char/agp/built-in.a
  CC      drivers/xen/sys-hypervisor.o
  CC [M]  drivers/dma/altera-msgdma.o
  CC      mm/ksm.o
  CC [M]  drivers/regulator/gpio-regulator.o
  CC      fs/btrfs/relocation.o
  CC [M]  fs/nfs/mount_clnt.o
  AR      drivers/gpu/drm/clients/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_buddy_test.o
  CC [M]  drivers/gpu/drm/tests/drm_cmdline_parser_test.o
  CC      drivers/xen/platform-pci.o
  CC      drivers/tty/tty_io.o
  CC [M]  net/netfilter/nf_nat_masquerade.o
  CC      arch/x86/kernel/trace.o
  CC [M]  net/sunrpc/svcsock.o
  CC [M]  drivers/regulator/isl6271a-regulator.o
  CC [M]  net/rds/tcp.o
  CC      drivers/connector/cn_queue.o
  CC [M]  drivers/iommu/iommufd/eventq.o
  CC [M]  net/bridge/br_sysfs_if.o
  CC      kernel/trace/trace_events_filter.o
  CC      drivers/char/tpm/tpm1-cmd.o
  CC      drivers/acpi/acpica/psscope.o
  CC [M]  drivers/regulator/isl9305.o
  CC      drivers/connector/connector.o
  CC      drivers/iommu/intel/nested.o
  CC      net/ipv4/arp.o
  CC [M]  fs/smb/client/cached_dir.o
  CC [M]  net/netfilter/nf_nat_ovs.o
  CC      drivers/tty/serial/8250/8250_early.o
  CC      fs/btrfs/delayed-inode.o
  CC [M]  fs/9p/vfs_file.o
  CC [M]  net/sctp/stream_sched.o
  CC [M]  fs/fuse/passthrough.o
  CC      net/ipv6/ip6_icmp.o
  CC [M]  crypto/lz4.o
  CC      fs/btrfs/scrub.o
  CC      arch/x86/kernel/rethook.o
  CC      drivers/tty/serial/serial_base_bus.o
  CC      drivers/iommu/dma-iommu.o
  CC      drivers/acpi/acpica/pstree.o
  CC      drivers/connector/cn_proc.o
  CC      net/ipv6/output_core.o
  LD [M]  net/vmw_vsock/vsock.o
  LD [M]  net/vmw_vsock/vsock_diag.o
  CC      drivers/xen/swiotlb-xen.o
  LD [M]  net/vmw_vsock/vmw_vsock_vmci_transport.o
  CC [M]  sound/soc/soc-component.o
  CC      mm/page_poison.o
  LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport.o
  LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport_common.o
  LD [M]  net/vmw_vsock/hv_sock.o
  CC      net/ipv6/protocol.o
  CC      mm/memtest.o
  CC [M]  fs/fuse/sysctl.o
  CC      fs/btrfs/backref.o
  CC      lib/lockref.o
  CC [M]  drivers/regulator/lm363x-regulator.o
  CC [M]  drivers/dma/idma64.o
  CC [M]  drivers/iommu/iommufd/hw_pagetable.o
  CC      kernel/workqueue.o
  CC      drivers/tty/n_tty.o
  CC      drivers/tty/serial/8250/8250_dw.o
  CC      drivers/acpi/acpica/psutils.o
  CC      kernel/bpf/arena.o
  CC [M]  drivers/regulator/lp3971.o
  CC [M]  fs/nfs/nfstrace.o
  CC      drivers/iommu/intel/cache.o
  CC [M]  crypto/lz4hc.o
  CC      lib/bcd.o
  CC      drivers/iommu/amd/quirks.o
  CC      arch/x86/kernel/vmcore_info_64.o
  CC [M]  net/bridge/br_sysfs_br.o
  CC [M]  fs/9p/vfs_dir.o
  CC [M]  fs/nfs/export.o
  CC      lib/sort.o
  CC      drivers/gpu/vga/vga_switcheroo.o
  CC [M]  fs/smb/client/cifs_unicode.o
  CC      drivers/char/tpm/tpm2-cmd.o
  CC [M]  net/rds/tcp_connect.o
  CC      drivers/acpi/acpica/pswalk.o
  CC [M]  fs/fuse/dev_uring.o
  CC [M]  net/sctp/stream_sched_prio.o
  CC      drivers/xen/mcelog.o
  CC      fs/btrfs/ulist.o
  AR      drivers/gpu/drm/display/built-in.a
  CC [M]  drivers/gpu/drm/display/drm_display_helper_mod.o
  CC [M]  drivers/iommu/iommufd/io_pagetable.o
  CC [M]  fs/nfs/sysfs.o
  AR      drivers/connector/built-in.a
  CC      arch/x86/kernel/machine_kexec_64.o
  CC      drivers/char/tpm/tpmrm-dev.o
  CC [M]  drivers/gpu/drm/display/drm_bridge_connector.o
  CC [M]  crypto/842.o
  CC [M]  drivers/dma/plx_dma.o
  CC      drivers/acpi/acpica/psxface.o
  CC      lib/parser.o
  CC      drivers/tty/serial/8250/8250_mid.o
  CC [M]  drivers/gpu/drm/tests/drm_connector_test.o
  CC      mm/migrate.o
  CC [M]  arch/x86/kvm/vmx/vmcs12.o
  CC [M]  drivers/gpu/drm/display/drm_dp_dual_mode_helper.o
  CC [M]  drivers/regulator/lp3972.o
  CC      drivers/iommu/amd/io_pgtable.o
  CC [M]  net/netfilter/nf_nat_amanda.o
  CC [M]  fs/9p/vfs_dentry.o
  AR      drivers/gpu/drm/renesas/rcar-du/built-in.a
  AR      drivers/gpu/drm/renesas/rz-du/built-in.a
  AR      drivers/gpu/drm/renesas/built-in.a
  CC      drivers/acpi/acpica/rsaddr.o
  CC      kernel/trace/trace_events_trigger.o
  CC [M]  drivers/iommu/iommufd/ioas.o
  CC      kernel/bpf/range_tree.o
  CC      drivers/char/tpm/tpm2-space.o
  CC [M]  net/rds/tcp_listen.o
  CC [M]  sound/soc/soc-pcm.o
  CC      drivers/tty/serial/8250/8250_pci.o
  CC      drivers/acpi/acpica/rscalc.o
  CC [M]  sound/soc/soc-devres.o
  CC      drivers/iommu/intel/prq.o
  CC      net/ipv6/ip6_offload.o
  CC [M]  crypto/ansi_cprng.o
  CC [M]  fs/smb/client/nterr.o
  CC      drivers/xen/xen-acpi-processor.o
  CC      net/ipv6/tcpv6_offload.o
  CC      drivers/tty/serial/8250/8250_rt288x.o
  CC [M]  drivers/iommu/iommufd/main.o
  CC      lib/debug_locks.o
  CC [M]  fs/fuse/cuse.o
  CC [M]  fs/smb/client/cifsencrypt.o
  CC [M]  net/bridge/br_nf_core.o
  CC      drivers/iommu/intel/trace.o
  CC      drivers/iommu/intel/svm.o
  CC      kernel/pid.o
  CC [M]  drivers/iommu/iommufd/pages.o
  AR      drivers/dma/built-in.a
  CC      drivers/iommu/intel/irq_remapping.o
  AS      arch/x86/kernel/relocate_kernel_64.o
  CC      drivers/char/tpm/tpm-sysfs.o
  CC [M]  fs/9p/v9fs.o
  CC      drivers/tty/tty_ioctl.o
  CC [M]  net/sctp/stream_sched_rr.o
  CC      net/ipv4/icmp.o
  CC [M]  drivers/regulator/lp872x.o
  CC      arch/x86/kernel/kexec-bzimage64.o
  CC      drivers/acpi/acpica/rscreate.o
  AR      drivers/gpu/vga/built-in.a
  CC      lib/random32.o
  CC      drivers/iommu/io-pgtable.o
  CC      drivers/iommu/amd/io_pgtable_v2.o
  CC      drivers/iommu/iova.o
  CC [M]  fs/9p/fid.o
  CC [M]  net/sunrpc/svcauth.o
  CC      fs/btrfs/qgroup.o
  CC [M]  net/netfilter/nf_nat_ftp.o
  CC [M]  drivers/gpu/drm/tests/drm_damage_helper_test.o
  CC [M]  drivers/gpu/drm/tests/drm_dp_mst_helper_test.o
  CC      kernel/bpf/dispatcher.o
  CC [M]  drivers/regulator/lp8788-buck.o
  CC      drivers/xen/efi.o
  CC [M]  crypto/tcrypt.o
  CC [M]  drivers/gpu/drm/display/drm_dp_helper.o
  CC      lib/bust_spinlocks.o
  CC      drivers/tty/tty_ldisc.o
  CC      drivers/iommu/intel/perfmon.o
  CC      kernel/bpf/devmap.o
  CC [M]  fs/fuse/virtio_fs.o
  CC [M]  drivers/tty/serial/8250/8250_exar.o
  CC      mm/memory-tiers.o
  CC      drivers/char/tpm/eventlog/common.o
  CC [M]  net/rds/tcp_recv.o
  CC      drivers/acpi/acpica/rsdumpinfo.o
  CC [M]  net/sctp/stream_sched_fc.o
  CC [M]  sound/soc/soc-ops.o
  CC      drivers/char/mem.o
  CC      drivers/tty/tty_buffer.o
  CC [M]  net/bridge/br_multicast.o
  CC      drivers/acpi/utils.o
  CC      arch/x86/kernel/crash_dump_64.o
  CC      net/ipv6/exthdrs_offload.o
  CC      drivers/xen/xlate_mmu.o
  CC [M]  fs/9p/xattr.o
  CC      drivers/iommu/amd/ppr.o
  CC [M]  drivers/regulator/lp8788-ldo.o
  CC [M]  crypto/polyval-generic.o
  CC      kernel/trace/trace_eprobe.o
  CC      lib/kasprintf.o
  CC [M]  net/bridge/br_mdb.o
  CC [M]  arch/x86/kvm/vmx/nested.o
  CC [M]  arch/x86/kvm/vmx/posted_intr.o
  CC [M]  net/bridge/br_multicast_eht.o
  CC [M]  net/bridge/br_vlan.o
  CC      drivers/acpi/acpica/rsinfo.o
  CC [M]  fs/cachefiles/cache.o
  CC [M]  drivers/gpu/drm/tests/drm_exec_test.o
  CC [M]  fs/vboxsf/dir.o
  CC [M]  fs/vboxsf/file.o
  CC [M]  net/netfilter/nf_nat_irc.o
  CC [M]  drivers/iommu/iommufd/vfio_compat.o
  CC [M]  fs/cachefiles/daemon.o
  CC [M]  fs/smb/client/readdir.o
  CC      fs/btrfs/send.o
  CC      drivers/char/tpm/eventlog/tpm1.o
  CC      drivers/acpi/acpica/rsio.o
  CC      arch/x86/kernel/crash.o
  CC [M]  fs/vboxsf/utils.o
  CC [M]  drivers/tty/serial/8250/8250_lpss.o
  CC      drivers/char/random.o
  CC [M]  fs/nfs/fs_context.o
  CC      lib/bitmap.o
  CC [M]  fs/9p/cache.o
  CC [M]  drivers/iommu/iommufd/viommu.o
  AR      drivers/iommu/intel/built-in.a
  CC [M]  fs/nfs/sysctl.o
  CC [M]  drivers/regulator/lp8755.o
  CC      drivers/iommu/amd/pasid.o
  CC      drivers/tty/serial/serial_ctrl.o
  CC      net/ipv6/inet6_hashtables.o
  CC [M]  fs/cachefiles/interface.o
  CC [M]  net/sctp/stream_interleave.o
  CC [M]  drivers/gpu/drm/tests/drm_format_helper_test.o
  CC      drivers/acpi/acpica/rsirq.o
  LD [M]  fs/fuse/fuse.o
  LD [M]  fs/fuse/virtiofs.o
  CC [M]  fs/cachefiles/io.o
  CC [M]  fs/nfs/fscache.o
  CC      kernel/bpf/cpumap.o
  CC      kernel/bpf/offload.o
  CC [M]  sound/soc/soc-link.o
  CC      drivers/char/ttyprintk.o
  CC      net/ipv6/mcast_snoop.o
  CC [M]  net/rds/tcp_send.o
  CC [M]  net/sctp/proc.o
  CC      drivers/xen/unpopulated-alloc.o
  CC [M]  drivers/regulator/ltc3589.o
  CC      mm/migrate_device.o
  CC      drivers/base/power/sysfs.o
  CC [M]  net/sunrpc/svcauth_unix.o
  CC      drivers/base/firmware_loader/builtin/main.o
  CC      kernel/trace/trace_events_inject.o
  CC [M]  net/netfilter/nf_nat_sip.o
  CC      arch/x86/kernel/module.o
  CC [M]  fs/9p/acl.o
  CC      drivers/char/tpm/eventlog/tpm2.o
  CC [M]  drivers/tty/serial/8250/8250_men_mcb.o
  CC      drivers/acpi/acpica/rslist.o
  CC      drivers/base/firmware_loader/fallback_table.o
  CC [M]  fs/vboxsf/vboxsf_wrappers.o
  CC [M]  crypto/af_alg.o
  CC      kernel/trace/trace_events_synth.o
  CC [M]  net/sunrpc/addr.o
  AR      drivers/iommu/iommufd/built-in.a
  LD [M]  drivers/iommu/iommufd/iommufd.o
  CC      net/ipv4/devinet.o
  CC      drivers/base/regmap/regmap.o
  AR      drivers/iommu/amd/built-in.a
  CC      drivers/base/power/generic_ops.o
  CC      drivers/iommu/irq_remapping.o
  CC      kernel/trace/trace_events_hist.o
  CC [M]  net/sctp/sysctl.o
  CC [M]  drivers/gpu/drm/display/drm_dp_mst_topology.o
  CC      drivers/base/regmap/regcache.o
  CC      drivers/acpi/acpica/rsmemory.o
  CC [M]  fs/smb/client/ioctl.o
  CC      drivers/char/tpm/tpm-buf.o
  CC      kernel/bpf/net_namespace.o
  AR      drivers/base/firmware_loader/builtin/built-in.a
  CC      drivers/base/regmap/regcache-rbtree.o
  CC      lib/scatterlist.o
  CC [M]  drivers/tty/serial/8250/8250_pci1xxxx.o
  CC      drivers/base/power/common.o
  CC [M]  drivers/regulator/ltc3676.o
  CC      arch/x86/kernel/kgdb.o
  CC [M]  sound/soc/soc-card.o
  CC [M]  fs/cachefiles/key.o
  LD [M]  fs/9p/9p.o
  CC [M]  fs/vboxsf/super.o
  CC      drivers/tty/serial/serial_port.o
  CC      drivers/xen/grant-dma-ops.o
  CC      drivers/acpi/acpica/rsmisc.o
  CC      drivers/base/power/qos.o
  CC      arch/x86/kernel/early_printk.o
  CC      drivers/base/power/runtime.o
  CC      arch/x86/kernel/hpet.o
  CC [M]  drivers/gpu/drm/tests/drm_format_test.o
  CC [M]  net/rds/tcp_stats.o
  CC      kernel/bpf/tcx.o
  CC [M]  arch/x86/kvm/vmx/main.o
  CC [M]  arch/x86/kvm/vmx/sgx.o
  CC [M]  net/netfilter/nf_nat_tftp.o
  AR      drivers/base/test/built-in.a
  CC      drivers/base/firmware_loader/main.o
  CC      net/ipv6/tcp_ao.o
  CC      drivers/iommu/hyperv-iommu.o
  CC [M]  net/sunrpc/rpcb_clnt.o
  CC      drivers/acpi/reboot.o
  CC      drivers/acpi/acpica/rsserial.o
  CC [M]  net/sctp/ipv6.o
  CC [M]  drivers/regulator/max14577-regulator.o
  CC      kernel/task_work.o
  CC [M]  drivers/tty/serial/8250/8250_pericom.o
  CC      drivers/acpi/acpica/rsutils.o
  LD [M]  fs/vboxsf/vboxsf.o
  CC      drivers/iommu/virtio-iommu.o
  CC      drivers/iommu/iommu-sva.o
  LD [M]  net/rds/rds.o
  CC [M]  drivers/xen/evtchn.o
  CC      kernel/bpf/stackmap.o
  CC      drivers/tty/tty_port.o
  CC [M]  fs/nfs/nfs2super.o
  CC [M]  fs/cachefiles/main.o
  CC [M]  net/ipv6/ah6.o
  CC [M]  net/ipv6/esp6.o
  CC      mm/huge_memory.o
  CC      drivers/char/tpm/tpm2-sessions.o
  CC [M]  net/sunrpc/timer.o
  CC      kernel/trace/trace_events_user.o
  CC      drivers/base/firmware_loader/fallback.o
  CC [M]  drivers/gpu/drm/display/drm_dp_tunnel.o
  CC [M]  sound/soc/soc-compress.o
  CC [M]  net/bridge/br_vlan_tunnel.o
  CC [M]  drivers/gpu/drm/tests/drm_framebuffer_test.o
  CC [M]  fs/cachefiles/namei.o
  CC [M]  fs/smb/client/sess.o
  CC [M]  fs/nfs/proc.o
  LD [M]  net/rds/rds_tcp.o
  CC [M]  fs/cachefiles/security.o
  CC [M]  drivers/gpu/drm/display/drm_dsc_helper.o
  CC      lib/list_sort.o
  CC [M]  crypto/algif_hash.o
  CC      drivers/acpi/acpica/rsxface.o
  CC [M]  crypto/algif_skcipher.o
  CC      lib/uuid.o
  CC [M]  drivers/block/xen-blkback/blkback.o
  CC [M]  net/netfilter/nf_synproxy_core.o
  CC [M]  drivers/block/drbd/drbd_buildtag.o
  CC [M]  drivers/regulator/max1586.o
  AR      drivers/tty/serial/8250/built-in.a
  CC      arch/x86/kernel/amd_nb.o
  CC      drivers/tty/serial/earlycon.o
  CC [M]  drivers/block/mtip32xx/mtip32xx.o
  CC [M]  drivers/block/zram/zcomp.o
  CC [M]  net/netfilter/nf_conncount.o
  CC      drivers/base/power/wakeirq.o
  CC      lib/iov_iter.o
  AR      drivers/misc/eeprom/built-in.a
  CC [M]  drivers/misc/eeprom/at24.o
  CC [M]  drivers/xen/gntdev.o
  CC      fs/btrfs/dev-replace.o
  AR      drivers/misc/cb710/built-in.a
  AR      drivers/misc/lis3lv02d/built-in.a
  CC [M]  drivers/misc/cb710/core.o
  CC [M]  drivers/misc/lis3lv02d/lis3lv02d.o
  CC      drivers/tty/tty_mutex.o
  CC      drivers/base/regmap/regcache-flat.o
  CC [M]  drivers/gpu/drm/tests/drm_gem_shmem_test.o
  CC      drivers/iommu/io-pgfault.o
  CC [M]  net/netfilter/nf_dup_netdev.o
  CC [M]  drivers/block/zram/zram_drv.o
  CC [M]  drivers/block/drbd/drbd_bitmap.o
  CC      drivers/base/firmware_loader/fallback_platform.o
  CC      drivers/char/tpm/tpm_ppi.o
  CC      drivers/acpi/acpica/tbdata.o
  CC      kernel/bpf/cgroup_iter.o
  AR      drivers/misc/cardreader/built-in.a
  CC [M]  drivers/misc/cardreader/alcor_pci.o
  CC      net/ipv4/af_inet.o
  CC      drivers/tty/serial/max310x.o
  CC [M]  drivers/block/zram/backend_lzorle.o
  CC [M]  net/sctp/diag.o
  CC [M]  drivers/regulator/max77503-regulator.o
  CC [M]  net/bridge/br_vlan_options.o
  CC [M]  crypto/algif_rng.o
  CC [M]  sound/soc/soc-generic-dmaengine-pcm.o
  CC [M]  fs/nfs/nfs2xdr.o
  CC      lib/clz_ctz.o
  CC [M]  net/bridge/br_mst.o
  CC [M]  fs/smb/client/export.o
  CC      drivers/base/regmap/regcache-maple.o
  CC [M]  net/sunrpc/xdr.o
  LD [M]  net/sctp/sctp.o
  CC      net/ipv4/igmp.o
  CC      arch/x86/kernel/amd_node.o
  CC [M]  fs/cachefiles/volume.o
  CC [M]  fs/cachefiles/xattr.o
  CC      kernel/trace/bpf_trace.o
  CC      drivers/base/firmware_loader/sysfs.o
  CC [M]  drivers/misc/lis3lv02d/lis3lv02d_i2c.o
  CC [M]  net/netfilter/nf_tables_core.o
  CC [M]  drivers/misc/eeprom/at25.o
  CC      drivers/base/power/main.o
  CC      drivers/tty/tty_ldsem.o
  CC [M]  drivers/block/xen-blkback/xenbus.o
  CC      drivers/char/tpm/eventlog/acpi.o
  CC [M]  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.o
  CC [M]  drivers/xen/gntdev-dmabuf.o
  CC      drivers/acpi/acpica/tbfadt.o
  CC [M]  fs/smb/client/unc.o
  CC      kernel/bpf/bpf_cgrp_storage.o
  CC [M]  drivers/regulator/max77541-regulator.o
  CC [M]  fs/smb/client/winucase.o
  CC [M]  drivers/misc/cb710/sgbuf2.o
  CC      drivers/mfd/88pm860x-core.o
  CC [M]  drivers/gpu/drm/display/drm_hdcp_helper.o
  CC      fs/btrfs/raid56.o
  CC [M]  net/ipv6/esp6_offload.o
  CC [M]  drivers/misc/cardreader/rtsx_pcr.o
  AR      drivers/iommu/built-in.a
  CC [M]  fs/cachefiles/error_inject.o
  CC [M]  sound/soc/soc-ac97.o
  CC      drivers/base/component.o
  CC      drivers/base/regmap/regmap-debugfs.o
  CC      drivers/tty/serial/sccnxp.o
  CC      drivers/acpi/acpica/tbfind.o
  CC [M]  crypto/algif_aead.o
  CC [M]  drivers/block/zram/backend_lzo.o
  LD [M]  net/sctp/sctp_diag.o
  CC [M]  crypto/zstd.o
  CC      drivers/tty/serial/serial_mctrl_gpio.o
  CC      drivers/acpi/acpica/tbinstal.o
  CC      drivers/base/core.o
  CC [M]  drivers/gpu/drm/tests/drm_managed_test.o
  CC [M]  drivers/misc/eeprom/max6875.o
  CC      lib/bsearch.o
  CC      drivers/acpi/acpica/tbprint.o
  CC      drivers/base/firmware_loader/sysfs_upload.o
  CC [M]  net/ipv6/ipcomp6.o
  CC      drivers/char/tpm/eventlog/efi.o
  CC      drivers/char/tpm/tpm_tis_core.o
  CC [M]  net/bridge/br_switchdev.o
  CC      drivers/char/tpm/tpm_tis.o
  CC [M]  drivers/regulator/max8649.o
  CC      arch/x86/kernel/kvm.o
  LD [M]  drivers/block/zram/zram.o
  CC      drivers/acpi/acpica/tbutils.o
  CC      fs/open.o
  CC [M]  fs/nfs/nfs3super.o
  CC [M]  drivers/xen/gntalloc.o
  CC      lib/find_bit.o
  CC [M]  arch/x86/kvm/vmx/hyperv.o
  CC      drivers/base/regmap/regmap-i2c.o
  CC      kernel/bpf/cgroup.o
  CC [M]  drivers/block/drbd/drbd_proc.o
  CC      drivers/char/misc.o
  LD [M]  fs/cachefiles/cachefiles.o
  CC      arch/x86/kernel/kvmclock.o
  CC [M]  drivers/misc/eeprom/eeprom_93cx6.o
  CC [M]  fs/smb/client/smb2ops.o
  CC [M]  fs/nfs/nfs3client.o
  AR      drivers/misc/pvpanic/built-in.a
  CC [M]  drivers/misc/pvpanic/pvpanic.o
  LD [M]  drivers/misc/cb710/cb710.o
  CC [M]  drivers/misc/pvpanic/pvpanic-mmio.o
  LD [M]  drivers/block/xen-blkback/xen-blkback.o
  CC      drivers/acpi/acpica/tbxface.o
  CC [M]  net/netfilter/nf_tables_api.o
  CC      lib/llist.o
  CC [M]  arch/x86/kvm/vmx/hyperv_evmcs.o
  CC      drivers/tty/serial/kgdboc.o
  CC [M]  drivers/misc/cardreader/rts5209.o
  CC      drivers/char/virtio_console.o
  AR      drivers/gpu/drm/omapdrm/built-in.a
  CC [M]  drivers/gpu/drm/display/drm_hdmi_audio_helper.o
  LD [M]  sound/soc/snd-soc-acpi.o
  CC      arch/x86/kernel/paravirt.o
  CC      kernel/trace/trace_kprobe.o
  CC [M]  fs/nfs/nfs3proc.o
  CC [M]  net/netfilter/nft_chain_filter.o
  LD [M]  sound/soc/snd-soc-core.o
  CC [M]  crypto/essiv.o
  CC      kernel/bpf/reuseport_array.o
  CC      drivers/base/regmap/regmap-spi.o
  CC      drivers/mfd/88pm860x-i2c.o
  CC [M]  drivers/gpu/drm/tests/drm_mm_test.o
  CC      lib/lwq.o
  CC [M]  drivers/regulator/max8660.o
  CC [M]  crypto/curve25519-generic.o
  AR      drivers/base/firmware_loader/built-in.a
  CC      drivers/tty/tty_baudrate.o
  CC [M]  drivers/misc/cardreader/rts5229.o
  CC [M]  net/ipv6/xfrm6_tunnel.o
  CC [M]  drivers/xen/privcmd.o
  CC      drivers/char/tpm/tpm_crb.o
  CC      drivers/base/power/wakeup.o
  CC [M]  fs/nfs/nfs3xdr.o
  CC [M]  drivers/misc/eeprom/eeprom_93xx46.o
  CC      drivers/acpi/acpica/tbxfload.o
  CC [M]  drivers/misc/cardreader/rtl8411.o
  CC [M]  net/bridge/br_mrp_switchdev.o
  CC      lib/memweight.o
  CC      drivers/base/regmap/regmap-mmio.o
  CC [M]  drivers/misc/pvpanic/pvpanic-pci.o
  CC      drivers/base/power/wakeup_stats.o
  CC [M]  drivers/tty/serial/altera_jtaguart.o
  CC      fs/btrfs/uuid-tree.o
  CC [M]  drivers/tty/serial/altera_uart.o
  CC [M]  drivers/xen/privcmd-buf.o
  CC [M]  arch/x86/kvm/vmx/vmx_onhyperv.o
  CC      mm/khugepaged.o
  CC      drivers/tty/tty_jobctrl.o
  CC [M]  drivers/gpu/drm/tests/drm_modes_test.o
  CC      drivers/base/regmap/regmap-irq.o
  CC      lib/kfifo.o
  CC [M]  drivers/misc/cardreader/rts5227.o
  CC [M]  drivers/tty/serial/arc_uart.o
  CC [M]  drivers/block/drbd/drbd_worker.o
  CC      fs/read_write.o
  ASN.1   crypto/ecrdsa_params.asn1.[ch]
  ASN.1   crypto/ecrdsa_pub_key.asn1.[ch]
  CC [M]  crypto/ecrdsa_params.asn1.o
  CC [M]  drivers/regulator/max8893.o
  CC [M]  crypto/ecrdsa_pub_key.asn1.o
  CC [M]  drivers/tty/serial/fsl_linflexuart.o
  CC [M]  crypto/simd.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_cec_helper.o
  CC [M]  drivers/tty/serial/fsl_lpuart.o
  CC [M]  drivers/regulator/max8907-regulator.o
  CC      drivers/acpi/acpica/tbxfroot.o
  CC [M]  net/sunrpc/sunrpc_syms.o
  CC [M]  net/bridge/br_mrp.o
  CC      drivers/tty/n_null.o
  CC [M]  net/ipv6/tunnel6.o
  CC [M]  net/bridge/br_mrp_netlink.o
  CC [M]  fs/nfs/nfs3acl.o
  CC [M]  drivers/char/tpm/tpm_tis_spi_main.o
  CC [M]  drivers/misc/eeprom/idt_89hpesx.o
  CC      arch/x86/kernel/paravirt-spinlocks.o
  CC [M]  net/bridge/br_cfm.o
  CC      drivers/tty/pty.o
  CC      drivers/mfd/wm8400-core.o
  CC [M]  drivers/regulator/max8925-regulator.o
  CC [M]  net/sunrpc/cache.o
  CC      net/ipv4/fib_frontend.o
  CC [M]  net/ipv6/mip6.o
  AR      drivers/nfc/built-in.a
  CC      drivers/mfd/wm831x-core.o
  CC [M]  fs/smb/client/smb2maperror.o
  CC      drivers/char/hpet.o
  CC      arch/x86/kernel/pvclock.o
  CC [M]  drivers/misc/cardreader/rts5249.o
  CC [M]  drivers/gpu/drm/tests/drm_plane_helper_test.o
  CC [M]  arch/x86/kvm/svm/svm.o
  CC [M]  drivers/xen/xen-scsiback.o
  CC      drivers/acpi/acpica/utaddress.o
  CC      lib/percpu-refcount.o
  CC [M]  fs/smb/client/smb2transport.o
  CC      arch/x86/kernel/pmem.o
  CC      drivers/base/power/trace.o
  CC      fs/btrfs/props.o
  CC      drivers/base/power/clock_ops.o
  CC      kernel/trace/error_report-traces.o
  AR      drivers/misc/keba/built-in.a
  CC [M]  drivers/misc/keba/cp500.o
  CC [M]  net/sunrpc/rpc_pipe.o
  CC      drivers/nvdimm/core.o
  CC [M]  drivers/misc/eeprom/ee1004.o
  CC      drivers/dax/hmem/device.o
  CC [M]  drivers/char/tpm/tpm_tis_spi_cr50.o
  CC [M]  drivers/regulator/max8952.o
  CC [M]  drivers/base/regmap/regmap-slimbus.o
  CC      drivers/acpi/acpica/utalloc.o
  CC      drivers/dax/super.o
  CC [M]  drivers/char/tpm/tpm_tis_i2c_cr50.o
  CC [M]  drivers/block/null_blk/main.o
  CC      drivers/dax/bus.o
  CC [M]  drivers/gpu/drm/tests/drm_probe_helper_test.o
  CC [M]  drivers/regulator/max8997-regulator.o
  CC      kernel/bpf/bpf_struct_ops.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.o
  CC [M]  drivers/misc/cardreader/rts5260.o
  CC [M]  fs/nfs/nfs4proc.o
  CC [M]  drivers/tty/serial/lantiq.o
  CC [M]  crypto/ecdsa-x962.o
  CC [M]  drivers/block/drbd/drbd_receiver.o
  CC      kernel/extable.o
  CC [M]  net/netfilter/nf_tables_trace.o
  CC      arch/x86/kernel/jailhouse.o
  CC [M]  drivers/xen/pvcalls-front.o
  CC      drivers/mfd/wm831x-irq.o
  CC      drivers/acpi/acpica/utascii.o
  CC [M]  drivers/char/uv_mmtimer.o
  CC      fs/file_table.o
  CC [M]  net/bridge/br_cfm_netlink.o
  CC      drivers/nvdimm/bus.o
  CC      lib/rhashtable.o
  CC      kernel/bpf/cpumask.o
  CC      fs/btrfs/free-space-tree.o
  CC      drivers/tty/tty_audit.o
  CC      drivers/mfd/wm831x-otp.o
  CC      drivers/block/loop.o
  CC [M]  drivers/block/null_blk/trace.o
  CC      drivers/mfd/wm831x-auxadc.o
  AR      drivers/base/power/built-in.a
  CC      drivers/mfd/wm831x-i2c.o
  CC      drivers/acpi/acpica/utbuffer.o
  CC [M]  drivers/char/tpm/tpm_tis_i2c.o
  UPD     arch/x86/kvm/kvm-asm-offsets.h
  CC [M]  net/ipv6/ip6_vti.o
  CC [M]  drivers/xen/xen-front-pgdir-shbuf.o
  LD [M]  crypto/aegis128.o
  CC [M]  crypto/ecrdsa.o
  CC [M]  drivers/gpu/drm/tests/drm_rect_test.o
  AR      drivers/gpu/drm/tilcdc/built-in.a
  CC [M]  drivers/base/regmap/regmap-spmi.o
  CC [M]  drivers/dax/device.o
  CC      kernel/trace/power-traces.o
  CC [M]  drivers/dax/hmem/hmem.o
  CC [M]  drivers/misc/cardreader/rts5261.o
  CC [M]  drivers/tty/serial/max3100.o
  AR      drivers/gpu/drm/imx/built-in.a
  CC [M]  drivers/block/drbd/drbd_req.o
  CC      arch/x86/kernel/pcspeaker.o
  CC      mm/page_counter.o
  CC [M]  drivers/regulator/max8998.o
  CC [M]  net/ipv6/sit.o
  CC      mm/memcontrol.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_helper.o
  CC      fs/btrfs/tree-checker.o
  CC      drivers/acpi/acpica/utcksum.o
  LD [M]  crypto/crypto_simd.o
  CC [M]  drivers/misc/cardreader/rts5228.o
  CC [M]  net/ipv6/ip6_tunnel.o
  CC [M]  drivers/regulator/max20086-regulator.o
  CC [M]  arch/x86/kvm/svm/pmu.o
  CC [M]  fs/nfs/nfs4xdr.o
  CC      lib/base64.o
  CC [M]  fs/smb/client/smb2misc.o
  CC      crypto/rsapubkey.asn1.o
  CC      fs/super.o
  CC      arch/x86/kernel/check.o
  AR      drivers/dax/hmem/built-in.a
  CC      crypto/rsaprivkey.asn1.o
  LD [M]  drivers/dax/hmem/dax_hmem.o
  LD [M]  crypto/ecdsa_generic.o
  CC      kernel/params.o
  CC [M]  drivers/block/drbd/drbd_actlog.o
  CC      kernel/bpf/bpf_lsm.o
  CC [M]  drivers/block/drbd/drbd_main.o
  LD [M]  crypto/ecrdsa_generic.o
  AR      crypto/built-in.a
  CC      arch/x86/kernel/uprobes.o
  CC [M]  drivers/dax/kmem.o
  CC      drivers/acpi/acpica/utcopy.o
  CC      kernel/kthread.o
  CC [M]  drivers/char/tpm/tpm_i2c_atmel.o
  CC [M]  drivers/block/null_blk/zoned.o
  CC      net/ipv4/fib_semantics.o
  CC [M]  net/ipv6/ip6_gre.o
  CC      drivers/mfd/wm831x-spi.o
  CC      fs/btrfs/space-info.o
  CC [M]  net/bridge/br_netfilter_hooks.o
  CC [M]  arch/x86/kvm/svm/nested.o
  CC [M]  drivers/base/regmap/regmap-w1.o
  CC      drivers/block/nbd.o
  CC [M]  net/sunrpc/sysfs.o
  CC      kernel/bpf/crypto.o
  CC [M]  drivers/tty/serial/men_z135_uart.o
  CC [M]  net/bridge/br_netfilter_ipv6.o
  CC [M]  drivers/misc/cardreader/rts5264.o
  CC      drivers/base/bus.o
  CC      lib/once.o
  CC      drivers/base/dd.o
  CC [M]  drivers/regulator/max20411-regulator.o
  CC [M]  drivers/gpu/drm/display/drm_scdc_helper.o
  CC [M]  drivers/misc/ibmasm/module.o
  CC      drivers/acpi/acpica/utexcep.o
  CC [M]  arch/x86/kvm/svm/avic.o
  CC      drivers/nvdimm/dimm_devs.o
  CC [M]  drivers/misc/ibmasm/ibmasmfs.o
  CC [M]  drivers/dax/pmem.o
  CC [M]  drivers/misc/ibmasm/event.o
  CC      drivers/mfd/wm8350-core.o
  CC [M]  drivers/char/tpm/tpm_i2c_infineon.o
  CC [M]  drivers/char/lp.o
  LD [M]  drivers/xen/xen-evtchn.o
  LD [M]  drivers/xen/xen-gntdev.o
  CC      arch/x86/kernel/perf_regs.o
  CC      drivers/acpi/acpica/utdebug.o
  LD [M]  drivers/xen/xen-gntalloc.o
  CC [M]  drivers/block/drbd/drbd_strings.o
  LD [M]  drivers/xen/xen-privcmd.o
  AR      drivers/xen/built-in.a
  CC [M]  drivers/gpu/drm/display/drm_hdmi_state_helper.o
  CC [M]  drivers/tty/serial/rp2.o
  CC      drivers/block/virtio_blk.o
  CC [M]  drivers/base/regmap/regmap-i3c.o
  CC [M]  drivers/misc/cardreader/rtsx_usb.o
  LD [M]  drivers/block/null_blk/null_blk.o
  CC [M]  net/ipv6/fou6.o
  CC [M]  arch/x86/kvm/svm/sev.o
  CC [M]  drivers/regulator/max77693-regulator.o
  CC [M]  drivers/regulator/max77826-regulator.o
  CC [M]  drivers/block/drbd/drbd_nl.o
  CC      lib/refcount.o
  CC [M]  fs/smb/client/smb2pdu.o
  CC      kernel/bpf/relo_core.o
  CC      fs/char_dev.o
  CC [M]  net/sunrpc/svc_xprt.o
  CC      kernel/trace/rpm-traces.o
  LD [M]  net/bridge/bridge.o
  CC [M]  drivers/dax/cxl.o
  AR      drivers/gpu/drm/panel/built-in.a
  CC [M]  drivers/gpu/drm/panel/panel-auo-a030jtn01.o
  CC [M]  drivers/misc/ibmasm/command.o
  CC      fs/btrfs/block-rsv.o
  CC [M]  drivers/base/regmap/regmap-spi-avmm.o
  CC [M]  drivers/block/drbd/drbd_interval.o
  CC [M]  drivers/block/drbd/drbd_state.o
  CC [M]  drivers/char/tpm/tpm_i2c_nuvoton.o
  CC      drivers/acpi/acpica/utdecode.o
  CC      kernel/sys_ni.o
  CC      lib/rcuref.o
  CC [M]  drivers/misc/ibmasm/remote.o
  CC      arch/x86/kernel/tracepoint.o
  CC [M]  net/ipv6/ip6_udp_tunnel.o
  CC      kernel/bpf/btf_iter.o
  CC      drivers/acpi/acpica/utdelete.o
  CC      kernel/trace/trace_kdb.o
  CC [M]  drivers/block/drbd/drbd_nla.o
  CC [M]  drivers/regulator/max77857-regulator.o
  LD [M]  net/bridge/br_netfilter.o
  CC      kernel/bpf/btf_relocate.o
  CC [M]  drivers/tty/serial/sc16is7xx.o
  AR      drivers/gpu/drm/bridge/analogix/built-in.a
  CC [M]  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.o
  AR      drivers/gpu/drm/hisilicon/built-in.a
  CC      net/ipv4/fib_trie.o
  CC      drivers/mfd/wm8350-regmap.o
  CC      mm/vmpressure.o
  CC      lib/usercopy.o
  CC      drivers/mfd/wm8350-gpio.o
  LD [M]  drivers/dax/device_dax.o
  LD [M]  drivers/dax/dax_pmem.o
  LD [M]  drivers/dax/dax_cxl.o
  AR      drivers/dax/built-in.a
  CC [M]  drivers/gpu/drm/display/drm_dp_aux_dev.o
  CC      drivers/mfd/wm8350-irq.o
  CC [M]  net/netfilter/nft_immediate.o
  CC      drivers/nvdimm/nd_perf.o
  AR      drivers/gpu/drm/mxsfb/built-in.a
  CC      arch/x86/kernel/itmt.o
  CC [M]  drivers/regulator/mc13783-regulator.o
  CC      lib/errseq.o
  CC      kernel/nsproxy.o
  CC      drivers/base/syscore.o
  CC      drivers/acpi/acpica/uterror.o
  CC      kernel/notifier.o
  CC [M]  drivers/gpu/drm/panel/panel-ilitek-ili9341.o
  CC      kernel/ksysfs.o
  CC [M]  drivers/regulator/mc13892-regulator.o
  LD [M]  drivers/misc/cardreader/rtsx_pci.o
  CC      arch/x86/kernel/umip.o
  CC [M]  drivers/misc/ibmasm/heartbeat.o
  CC [M]  drivers/char/applicom.o
  CC [M]  drivers/char/tpm/tpm_nsc.o
  CC      drivers/acpi/acpica/uteval.o
  CC [M]  drivers/regulator/mc13xxx-regulator-core.o
  CC [M]  fs/smb/client/smb2inode.o
  CC [M]  drivers/regulator/mp8859.o
  CC      drivers/mfd/wm8350-i2c.o
  CC [M]  drivers/misc/ibmasm/r_heartbeat.o
  CC      kernel/bpf/kmem_cache_iter.o
  CC [M]  arch/x86/kvm/svm/hyperv.o
  CC      fs/btrfs/delalloc-space.o
  CC      lib/bucket_locks.o
  CC [M]  drivers/block/drbd/drbd_debugfs.o
  CC [M]  fs/nfs/nfs4state.o
  AR      drivers/base/regmap/built-in.a
  CC [M]  drivers/misc/sgi-xp/xp_main.o
  CC [M]  drivers/misc/sgi-gru/grufile.o
  CC [M]  drivers/char/tpm/tpm_atmel.o
  CC [M]  drivers/misc/c2port/core.o
  CC [M]  drivers/misc/altera-stapl/altera-jtag.o
  CC [M]  drivers/gpu/drm/bridge/analogix/analogix_dp_core.o
  CC [M]  drivers/misc/sgi-xp/xp_uv.o
  CC [M]  fs/smb/client/smb2file.o
  CC      kernel/trace/trace_dynevent.o
  CC      drivers/gpu/drm/sysfb/drm_sysfb.o
  CC      drivers/base/driver.o
  CC      drivers/acpi/acpica/utglobal.o
  CC [M]  drivers/gpu/drm/display/drm_dp_cec.o
  CC [M]  drivers/tty/serial/sc16is7xx_spi.o
  CC      arch/x86/kernel/unwind_frame.o
  CC [M]  drivers/gpu/drm/panel/panel-orisetech-ota5601a.o
  CC [M]  net/netfilter/nft_cmp.o
  CC [M]  drivers/misc/ibmasm/dot_command.o
  CC [M]  drivers/tty/serial/sc16is7xx_i2c.o
  AR      drivers/gpu/drm/bridge/cadence/built-in.a
  CC [M]  drivers/misc/sgi-xp/xpc_main.o
  CC [M]  arch/x86/kvm/svm/svm_onhyperv.o
  CC [M]  drivers/misc/sgi-xp/xpc_channel.o
  CC [M]  drivers/misc/sgi-xp/xpc_partition.o
  CC      drivers/mfd/tps65910.o
  CC      fs/stat.o
  AR      kernel/bpf/built-in.a
  CC      drivers/gpu/drm/sysfb/drm_sysfb_modeset.o
  AR      drivers/gpu/drm/tiny/built-in.a
  CC [M]  drivers/gpu/drm/tiny/bochs.o
  CC      drivers/nvdimm/dimm.o
  AR      net/ipv6/built-in.a
  CC [M]  drivers/misc/altera-stapl/altera-comp.o
  CC [M]  net/sunrpc/xprtmultipath.o
  CC      drivers/acpi/acpica/uthex.o
  CC [M]  drivers/char/tpm/tpm_infineon.o
  CC      arch/x86/kernel/callthunks.o
  CC [M]  drivers/tty/serial/sprd_serial.o
  CC [M]  drivers/misc/altera-stapl/altera.o
../drivers/gpu/drm/bridge/analogix/analogix_dp_core.c: In function ‘analogix_dp_probe’:
../drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1589:17: error: label ‘err_disable_clk’ used but not defined
 1589 |                 goto err_disable_clk;
      |                 ^~~~
  CC      arch/x86/kernel/cet.o
  CC      lib/generic-radix-tree.o
make[8]: *** [../scripts/Makefile.build:203: drivers/gpu/drm/bridge/analogix/analogix_dp_core.o] Error 1
make[7]: *** [../scripts/Makefile.build:461: drivers/gpu/drm/bridge/analogix] Error 2
make[6]: *** [../scripts/Makefile.build:461: drivers/gpu/drm/bridge] Error 2
make[6]: *** Waiting for unfinished jobs....
  CC      arch/x86/kernel/shstk.o
  CC [M]  drivers/regulator/mt6311-regulator.o
  CC      drivers/acpi/nvs.o
  CC [M]  drivers/gpu/drm/tiny/cirrus-qemu.o
  CC [M]  net/netfilter/nft_range.o
  CC [M]  drivers/char/nvram.o
  CC      fs/btrfs/block-group.o
  CC [M]  drivers/misc/sgi-gru/grumain.o
  CC [M]  drivers/misc/ibmasm/lowlevel.o
  CC      drivers/base/class.o
  CC      drivers/acpi/acpica/utids.o
  CC [M]  drivers/misc/ibmasm/uart.o
  CC      mm/swap_cgroup.o
  CC [M]  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.o
  CC [M]  drivers/misc/c2port/c2port-duramar2150.o
  CC      drivers/gpu/drm/sysfb/drm_sysfb_screen_info.o
  CC [M]  drivers/misc/sgi-gru/grufault.o
  CC [M]  drivers/char/tpm/xen-tpmfront.o
  CC [M]  net/sunrpc/debugfs.o
  CC [M]  net/sunrpc/backchannel_rqst.o
  CC      drivers/mfd/tps65912-core.o
  LD [M]  arch/x86/kvm/kvm.o
  CC [M]  drivers/misc/sgi-gru/grutlbpurge.o
  AS [M]  arch/x86/kvm/vmx/vmenter.o
  CC [M]  drivers/gpu/drm/panel/panel-widechips-ws2401.o
  CC      drivers/nvdimm/region_devs.o
  CC      fs/exec.o
  AS [M]  arch/x86/kvm/svm/vmenter.o
  CC [M]  drivers/char/tpm/tpm_vtpm_proxy.o
  CC      drivers/block/xen-blkfront.o
  CC      kernel/trace/trace_probe.o
  CC [M]  drivers/tty/serial/uartlite.o
  CC      kernel/cred.o
  CC [M]  drivers/misc/sgi-xp/xpc_uv.o
  CC [M]  drivers/block/floppy.o
  CC [M]  drivers/regulator/mt6315-regulator.o
  CC      drivers/tty/sysrq.o
  LD [M]  arch/x86/kvm/kvm-intel.o
  LD [M]  arch/x86/kvm/kvm-amd.o
  LD [M]  drivers/gpu/drm/display/drm_display_helper.o
  CC [M]  drivers/char/ppdev.o
  CC [M]  drivers/misc/mei/hdcp/mei_hdcp.o
  CC [M]  fs/smb/client/cifsacl.o
  CC      lib/bitmap-str.o
  CC      drivers/acpi/acpica/utinit.o
  CC      drivers/mfd/tps65912-i2c.o
  CC [M]  drivers/misc/mei/pxp/mei_pxp.o
  CC [M]  drivers/gpu/drm/tiny/gm12u320.o
  CC      arch/x86/kernel/audit_64.o
  LD [M]  drivers/misc/ibmasm/ibmasm.o
  CC [M]  drivers/char/tlclk.o
  CC      arch/x86/kernel/amd_gart_64.o
  CC      arch/x86/kernel/aperture_64.o
  CC      arch/x86/kernel/mmconf-fam10h_64.o
  CC      kernel/trace/trace_uprobe.o
  CC [M]  net/netfilter/nft_bitwise.o
  CC      mm/hugetlb_cgroup.o
  CC      drivers/base/platform.o
  CC      kernel/reboot.o
  CC [M]  fs/nfs/nfs4renewd.o
  CC      drivers/acpi/acpica/utlock.o
  CC      drivers/nvdimm/region.o
  CC [M]  net/sunrpc/stats.o
  CC      arch/x86/kernel/vsmp_64.o
  CC      net/ipv4/fib_notifier.o
  CC [M]  arch/x86/kernel/msr.o
  CC [M]  net/sunrpc/sysctl.o
  CC      drivers/gpu/drm/sysfb/simpledrm.o
  CC [M]  drivers/regulator/mt6323-regulator.o
  CC      net/ipv4/inet_fragment.o
  CC [M]  drivers/char/hangcheck-timer.o
  CC [M]  drivers/misc/sgi-gru/gruprocfs.o
  LD [M]  drivers/char/tpm/tpm_tis_spi.o
  AR      drivers/char/tpm/built-in.a
  LD [M]  drivers/block/drbd/drbd.o
  CC      mm/memory-failure.o
  CC [M]  drivers/gpu/drm/tiny/panel-mipi-dbi.o
  AR      drivers/tty/serial/built-in.a
  CC      drivers/mfd/tps65912-spi.o
  CC [M]  drivers/block/brd.o
  CC [M]  arch/x86/kernel/cpuid.o
  CC [M]  fs/nfs/nfs4super.o
  CC [M]  fs/nfs/nfs4file.o
  CC [M]  drivers/block/ublk_drv.o
  CC      drivers/nvdimm/namespace_devs.o
  CC      drivers/nvdimm/label.o
  CC      drivers/acpi/acpica/utmath.o
  CC [M]  drivers/misc/mei/gsc_proxy/mei_gsc_proxy.o
  CC      drivers/acpi/wakeup.o
  CC      lib/string_helpers.o
  CC [M]  fs/nfs/delegation.o
  CC [M]  drivers/misc/altera-stapl/altera-lpt.o
  CC      drivers/acpi/acpica/utmisc.o
  CC [M]  drivers/misc/sgi-xp/xpnet.o
  CC      fs/btrfs/discard.o
  CC [M]  drivers/misc/vmw_vmci/vmci_context.o
  CC      mm/kmemleak.o
  LD [M]  drivers/misc/altera-stapl/altera-stapl.o
  CC [M]  net/netfilter/nft_byteorder.o
  CC [M]  drivers/misc/genwqe/card_base.o
  CC      mm/page_isolation.o
  CC [M]  net/netfilter/nft_payload.o
  CC [M]  drivers/tty/n_hdlc.o
  AR      drivers/char/built-in.a
  CC      mm/zpool.o
  CC      mm/zsmalloc.o
  CC [M]  fs/nfs/nfs4idmap.o
  CC      drivers/mfd/twl-core.o
  CC [M]  drivers/misc/genwqe/card_dev.o
  CC [M]  fs/smb/client/fs_context.o
  AR      arch/x86/kernel/built-in.a
  CC      net/ipv4/ping.o
  AR      arch/x86/built-in.a
  CC [M]  drivers/regulator/mt6331-regulator.o
  CC [M]  drivers/misc/sgi-gru/grukservices.o
  CC      drivers/acpi/acpica/utmutex.o
  CC [M]  drivers/misc/vmw_vmci/vmci_datagram.o
  CC      drivers/acpi/acpica/utnonansi.o
  CC [M]  fs/nfs/callback.o
  AR      drivers/gpu/drm/sysfb/built-in.a
  CC [M]  drivers/misc/genwqe/card_ddcb.o
  CC [M]  drivers/gpu/drm/tiny/hx8357d.o
  CC [M]  drivers/misc/echo/echo.o
  CC [M]  drivers/misc/mei/init.o
  CC      drivers/acpi/acpica/utobject.o
  CC      drivers/mfd/twl4030-irq.o
  CC      drivers/base/cpu.o
  CC      drivers/acpi/acpica/utosi.o
  CC [M]  fs/smb/client/dns_resolve.o
  CC      fs/pipe.o
  CC      fs/btrfs/reflink.o
  CC      drivers/acpi/sleep.o
  CC      kernel/trace/trace_boot.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_dev.o
  CC      drivers/dma-buf/heaps/system_heap.o
  CC      drivers/cxl/core/suspend.o
  LD [M]  drivers/misc/sgi-xp/xp.o
  LD [M]  drivers/misc/sgi-xp/xpc.o
  AR      drivers/macintosh/built-in.a
  CC [M]  drivers/misc/mei/hbm.o
  CC      drivers/mfd/twl6030-irq.o
  CC [M]  drivers/regulator/mt6332-regulator.o
  CC [M]  drivers/tty/n_gsm.o
  CC [M]  drivers/misc/uacce/uacce.o
  ASN.1   fs/smb/client/cifs_spnego_negtokeninit.asn1.[ch]
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.o
  CC      drivers/misc/sram.o
  CC      drivers/acpi/device_sysfs.o
  CC      lib/hexdump.o
  CC [M]  fs/nfs/callback_xdr.o
  CC      fs/btrfs/subpage.o
  CC [M]  drivers/tty/moxa.o
  CC [M]  fs/smb/client/namespace.o
  CC      drivers/acpi/acpica/utownerid.o
  CC      drivers/dma-buf/dma-buf.o
  CC [M]  fs/smb/client/reparse.o
  CC [M]  fs/smb/client/xattr.o
  CC [M]  drivers/gpu/drm/tiny/ili9163.o
  CC [M]  drivers/misc/vmw_vmci/vmci_doorbell.o
  CC      lib/kstrtox.o
  CC [M]  drivers/misc/ad525x_dpot.o
  CC [M]  drivers/misc/genwqe/card_sysfs.o
  LD [M]  net/sunrpc/sunrpc.o
  CC [M]  drivers/misc/sgi-gru/gruhandles.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.o
  CC [M]  fs/nfs/callback_proc.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.o
  CC [M]  net/netfilter/nft_lookup.o
  CC [M]  fs/nfs/nfs4namespace.o
  CC      kernel/async.o
  AR      drivers/block/built-in.a
  CC      drivers/base/firmware.o
  CC      drivers/acpi/acpica/utpredef.o
  CC      drivers/dma-buf/dma-fence.o
  CC      drivers/acpi/acpica/utresdecode.o
  CC      fs/namei.o
  AR      drivers/dma-buf/heaps/built-in.a
  CC      drivers/acpi/acpica/utresrc.o
  CC [M]  drivers/regulator/mt6357-regulator.o
  CC      drivers/nvdimm/badrange.o
  CC      kernel/trace/fprobe.o
  CC [M]  fs/nfs/nfs4getroot.o
  CC [M]  fs/nfs/nfs4client.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_msg.o
  CC      drivers/acpi/device_pm.o
  CC      drivers/acpi/proc.o
  CC      mm/early_ioremap.o
  CC      drivers/acpi/acpica/utstate.o
  CC [M]  drivers/cxl/core/port.o
  CC      lib/debug_info.o
  CC      fs/fcntl.o
  CC      drivers/acpi/bus.o
  CC      lib/iomap.o
  CC [M]  drivers/misc/genwqe/card_debugfs.o
  CC [M]  drivers/gpu/drm/tiny/ili9225.o
  AR      drivers/scsi/device_handler/built-in.a
  CC [M]  drivers/scsi/device_handler/scsi_dh_rdac.o
  CC      drivers/mfd/twl4030-audio.o
  AR      drivers/scsi/megaraid/built-in.a
  CC      drivers/nvme/common/auth.o
  CC [M]  drivers/scsi/megaraid/megaraid_mm.o
  CC [M]  drivers/misc/mei/interrupt.o
  CC [M]  drivers/misc/sgi-gru/grukdump.o
  CC [M]  drivers/ata/pata_parport/pata_parport.o
  CC [M]  drivers/misc/vmw_vmci/vmci_driver.o
  CC      drivers/spi/spi.o
  AR      drivers/net/phy/mediatek/built-in.a
  AR      drivers/message/fusion/built-in.a
  AR      drivers/firewire/built-in.a
  CC [M]  drivers/message/fusion/mptbase.o
  CC [M]  drivers/firewire/nosy.o
  AR      drivers/net/phy/qcom/built-in.a
  CC [M]  drivers/net/phy/qcom/qcom-phy-lib.o
  CC [M]  drivers/scsi/megaraid/megaraid_mbox.o
  CC      drivers/acpi/acpica/utstring.o
  CC [M]  drivers/net/phy/qcom/at803x.o
  CC      drivers/base/init.o
  CC      drivers/nvme/common/keyring.o
  CC [M]  drivers/regulator/mt6358-regulator.o
  CC      net/ipv4/ip_tunnel_core.o
  CC [M]  drivers/cxl/core/pmem.o
  CC [M]  drivers/net/phy/qcom/qca83xx.o
  CC      fs/btrfs/tree-mod-log.o
  CC [M]  fs/smb/client/cifs_spnego.o
  CC      drivers/mfd/twl6040.o
  CC [M]  drivers/misc/ad525x_dpot-i2c.o
  CC      drivers/acpi/acpica/utstrsuppt.o
  CC      drivers/spi/spi-mem.o
  CC      mm/numa.o
  CC      drivers/mfd/mfd-core.o
  CC [M]  drivers/cxl/core/regs.o
  CC [M]  drivers/misc/genwqe/card_utils.o
  CC [M]  drivers/misc/ad525x_dpot-spi.o
  CC      drivers/spi/spi-offload.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_sg.o
  CC [M]  drivers/scsi/device_handler/scsi_dh_hp_sw.o
  CC [M]  drivers/gpu/drm/tiny/ili9341.o
  CC      drivers/acpi/acpica/utstrtoul64.o
  LD [M]  drivers/misc/sgi-gru/gru.o
  CC      drivers/nvdimm/claim.o
  CC [M]  drivers/misc/vmw_vmci/vmci_event.o
  CC      drivers/acpi/acpica/utxface.o
  CC [M]  net/netfilter/nft_dynset.o
  CC      drivers/base/map.o
  CC [M]  drivers/tty/mxser.o
  CC [M]  drivers/misc/vmw_vmci/vmci_guest.o
  CC      drivers/acpi/glue.o
  CC [M]  drivers/spi/spi-mux.o
  CC [M]  drivers/regulator/mt6359-regulator.o
  CC      fs/ioctl.o
  CC      lib/iomap_copy.o
  CC      drivers/dma-buf/dma-fence-array.o
  CC      kernel/trace/rethook.o
  CC [M]  drivers/misc/mei/client.o
  CC      drivers/base/devres.o
  CC [M]  drivers/misc/dummy-irq.o
  CC      drivers/dma-buf/dma-fence-chain.o
  CC      drivers/mfd/ezx-pcap.o
  AR      drivers/nvme/common/built-in.a
  CC      drivers/nvme/host/core.o
  CC [M]  drivers/net/phy/qcom/qca808x.o
  CC [M]  drivers/spi/spidev.o
  CC      drivers/nvme/host/ioctl.o
  CC      drivers/dma-buf/dma-fence-unwrap.o
  CC      drivers/acpi/acpica/utxfinit.o
  CC [M]  drivers/ata/pata_parport/aten.o
  CC      fs/btrfs/extent-io-tree.o
  CC      mm/numa_memblks.o
  CC      lib/devres.o
  CC [M]  drivers/misc/vmw_vmci/vmci_handle_array.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_tty.o
  CC      fs/btrfs/fs.o
  CC [M]  drivers/scsi/device_handler/scsi_dh_emc.o
  CC [M]  drivers/scsi/libsas/sas_init.o
  CC [M]  drivers/misc/mei/main.o
  CC [M]  fs/smb/client/dfs_cache.o
  CC [M]  drivers/gpu/drm/tiny/ili9486.o
  CC      mm/balloon_compaction.o
  CC      drivers/acpi/acpica/utxferror.o
  LD [M]  drivers/misc/genwqe/genwqe_card.o
  CC      mm/secretmem.o
  CC [M]  drivers/scsi/megaraid/megaraid_sas_base.o
  CC [M]  drivers/misc/mei/dma-ring.o
  CC [M]  fs/nfs/nfs4session.o
  CC [M]  drivers/regulator/mt6360-regulator.o
  CC [M]  drivers/tty/nozomi.o
  CC      drivers/ata/libata-core.o
  CC      drivers/ata/libata-scsi.o
  CC      mm/userfaultfd.o
  CC [M]  drivers/message/fusion/mptscsih.o
  CC      fs/readdir.o
  CC      kernel/trace/trace_fprobe.o
  CC      drivers/cdrom/cdrom.o
  CC [M]  fs/smb/client/dfs.o
  CC [M]  drivers/cxl/core/memdev.o
  CC [M]  net/netfilter/nft_meta.o
  AR      drivers/net/pse-pd/built-in.a
  CC      drivers/base/attribute_container.o
  CC [M]  drivers/gpu/drm/tiny/mi0283qt.o
  AR      drivers/nvme/target/built-in.a
  CC [M]  drivers/nvme/target/core.o
  CC      lib/check_signature.o
  CC [M]  drivers/nvme/target/configfs.o
  CC      drivers/dma-buf/dma-resv.o
  LD [M]  drivers/misc/bcm-vk/bcm_vk.o
  CC [M]  drivers/misc/vmw_vmci/vmci_host.o
  CC      drivers/nvdimm/btt_devs.o
  CC      mm/page_idle.o
  CC [M]  drivers/net/phy/aquantia/aquantia_main.o
  CC [M]  drivers/ata/pata_parport/bpck.o
  CC [M]  drivers/scsi/device_handler/scsi_dh_alua.o
  CC      drivers/dma-buf/dma-heap.o
  CC      net/ipv4/gre_offload.o
  CC [M]  drivers/regulator/mt6370-regulator.o
  CC      mm/usercopy.o
  CC [M]  drivers/scsi/libsas/sas_phy.o
  CC      drivers/acpi/acpica/utxfmutex.o
  CC      drivers/mfd/da903x.o
  CC      mm/memremap.o
  CC [M]  drivers/regulator/mt6397-regulator.o
  CC      lib/interval_tree.o
  CC [M]  drivers/regulator/qcom-labibb-regulator.o
  CC [M]  drivers/scsi/libsas/sas_port.o
  COPY    drivers/scsi/aic7xxx/aic7xxx_seq.h
  COPY    drivers/scsi/aic7xxx/aic7xxx_reg.h
  COPY    drivers/scsi/aic7xxx/aic7xxx_reg_print.c
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_osm.o
  CC [M]  drivers/scsi/libsas/sas_event.o
  CC      fs/btrfs/messages.o
  CC [M]  drivers/spi/spi-loopback-test.o
  CC [M]  drivers/cxl/core/mbox.o
  CC [M]  drivers/gpu/drm/tiny/repaper.o
  CC      drivers/base/transport_class.o
  CC [M]  drivers/misc/mei/bus.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_proc.o
  CC      lib/assoc_array.o
  CC      drivers/nvdimm/pfn_devs.o
  CC      drivers/ata/libata-eh.o
  CC [M]  drivers/misc/vmw_vmci/vmci_queue_pair.o
  CC      drivers/acpi/acpica/dbcmds.o
  CC [M]  drivers/tty/ttynull.o
  CC [M]  drivers/misc/ics932s401.o
  CC [M]  drivers/misc/vmw_vmci/vmci_resource.o
  CC      fs/btrfs/bio.o
  CC      fs/select.o
  CC [M]  drivers/scsi/isci/init.o
  AR      kernel/trace/built-in.a
  CC [M]  fs/smb/client/netlink.o
  CC      kernel/range.o
  CC [M]  fs/nfs/dns_resolve.o
  CC [M]  drivers/net/phy/aquantia/aquantia_firmware.o
  CC [M]  drivers/regulator/qcom_spmi-regulator.o
  CC [M]  drivers/regulator/qcom_usb_vbus-regulator.o
  CC [M]  drivers/net/phy/aquantia/aquantia_leds.o
  CC      mm/hmm.o
  CC      drivers/dma-buf/sync_file.o
  CC [M]  drivers/message/fusion/mptspi.o
  CC      drivers/ata/libata-transport.o
  CC [M]  drivers/ata/pata_parport/comm.o
  CC      fs/dcache.o
  CC      net/ipv4/metrics.o
  CC [M]  drivers/scsi/libsas/sas_discover.o
  CC      fs/inode.o
  CC      kernel/smpboot.o
  CC [M]  drivers/cxl/core/pci.o
  CC      lib/list_debug.o
  CC [M]  drivers/scsi/megaraid/megaraid_sas_fusion.o
  CC [M]  drivers/cxl/port.o
  CC      drivers/acpi/acpica/dbconvert.o
  CC [M]  drivers/tty/rpmsg_tty.o
  CC      lib/debugobjects.o
  CC [M]  net/netfilter/nft_rt.o
  CC [M]  drivers/scsi/megaraid/megaraid_sas_fp.o
  CC      drivers/mfd/da9052-irq.o
  CC      drivers/base/topology.o
  CC [M]  fs/smb/client/cifs_swn.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_osm_pci.o
  CC      net/ipv4/netlink.o
  CC [M]  drivers/misc/vmw_vmci/vmci_route.o
  CC      drivers/acpi/acpica/dbdisply.o
make[5]: *** [../scripts/Makefile.build:461: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:461: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
  CC      net/ipv4/nexthop.o
  CC [M]  drivers/scsi/megaraid/megaraid_sas_debugfs.o
  CC [M]  fs/nfs/nfs4trace.o
  AR      drivers/cdrom/built-in.a
  CC      fs/btrfs/lru_cache.o
  CC [M]  drivers/regulator/palmas-regulator.o
  CC [M]  drivers/misc/mei/bus-fixup.o
  CC      drivers/mfd/da9052-core.o
  CC [M]  drivers/scsi/isci/phy.o
  CC      drivers/net/mdio/acpi_mdio.o
  CC [M]  drivers/net/phy/aquantia/aquantia_hwmon.o
  CC [M]  drivers/spi/spi-altera-platform.o
  CC      kernel/ucount.o
  AR      drivers/net/pcs/built-in.a
  CC      mm/memfd.o
  CC [M]  drivers/nvme/target/admin-cmd.o
  CC      drivers/base/container.o
  AR      drivers/tty/built-in.a
  CC      mm/ptdump.o
  CC      lib/bitrev.o
  CC      drivers/base/property.o
  CC      drivers/ata/libata-trace.o
  CC [M]  drivers/ata/pata_parport/dstr.o
  CC      drivers/dma-buf/sw_sync.o
  CC      drivers/acpi/acpica/dbexec.o
  CC      drivers/nvdimm/dax_devs.o
  CC      mm/page_reporting.o
  CC [M]  drivers/message/fusion/mptfc.o
  CC [M]  drivers/scsi/libsas/sas_expander.o
  CC      mm/bootmem_info.o
  CC      drivers/acpi/scan.o
  COPY    drivers/scsi/aic7xxx/aic79xx_seq.h
  COPY    drivers/scsi/aic7xxx/aic79xx_reg.h
  COPY    drivers/scsi/aic7xxx/aic79xx_reg_print.c
  CC      drivers/acpi/acpica/dbhistry.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_osm.o
  CC      fs/btrfs/raid-stripe-tree.o
  CC [M]  drivers/cxl/acpi.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_base.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_proc.o
  CC [M]  net/netfilter/nft_exthdr.o
  CC      kernel/regset.o
  CC [M]  drivers/message/fusion/mptsas.o
  CC      drivers/acpi/acpica/dbinput.o
  LD [M]  drivers/misc/vmw_vmci/vmw_vmci.o
  CC [M]  drivers/spi/spi-altera-core.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_config.o
  CC [M]  drivers/misc/mei/debugfs.o
  CC [M]  drivers/cxl/core/hdm.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_scsih.o
  CC [M]  drivers/misc/mei/mei-trace.o
  CC [M]  drivers/message/fusion/mptctl.o
  CC [M]  drivers/misc/tifm_core.o
  CC      drivers/nvme/host/sysfs.o
  CC      drivers/net/mdio/fwnode_mdio.o
  LD [M]  drivers/net/phy/aquantia/aquantia.o
  CC [M]  drivers/net/phy/realtek/realtek_main.o
  CC [M]  drivers/regulator/pca9450-regulator.o
  CC      drivers/mfd/da9052-spi.o
  CC [M]  drivers/misc/tifm_7xx1.o
  CC      lib/linear_ranges.o
  CC [M]  fs/smb/client/fscache.o
  CC [M]  drivers/net/mdio/mdio-bcm-unimac.o
  CC [M]  drivers/scsi/isci/request.o
  CC      fs/btrfs/fiemap.o
  CC [M]  drivers/net/mdio/mdio-bitbang.o
  CC      drivers/dma-buf/sync_debug.o
  CC      drivers/acpi/acpica/dbmethod.o
  CC [M]  drivers/nvme/target/fabrics-cmd.o
  CC [M]  drivers/ata/pata_parport/kbic.o
  CC [M]  drivers/misc/phantom.o
  CC [M]  drivers/regulator/pv88060-regulator.o
  CC      kernel/ksyms_common.o
  CC      drivers/acpi/mipi-disco-img.o
  AR      drivers/net/ethernet/broadcom/built-in.a
  CC [M]  drivers/net/ethernet/broadcom/b44.o
  AR      drivers/net/mctp/built-in.a
  CC [M]  drivers/net/mctp/mctp-serial.o
  LD [M]  drivers/scsi/megaraid/megaraid_sas.o
  CC      drivers/net/phy/mdio-boardinfo.o
  CC [M]  drivers/net/mctp/mctp-i3c.o
  CC      drivers/nvdimm/security.o
  CC      drivers/nvdimm/e820.o
  CC      mm/execmem.o
  CC      drivers/acpi/resource.o
  CC [M]  drivers/scsi/isci/remote_device.o
  CC      drivers/acpi/acpi_processor.o
  CC      drivers/mfd/da9052-i2c.o
  CC      drivers/acpi/acpica/dbnames.o
  CC      drivers/nvme/host/pr.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_osm_pci.o
  CC [M]  drivers/spi/spi-axi-spi-engine.o
  CC      drivers/dma-buf/udmabuf.o
  CC [M]  drivers/ata/pata_parport/epat.o
  CC [M]  drivers/cxl/core/pmu.o
  CC      drivers/base/cacheinfo.o
  CC [M]  drivers/cxl/core/cdat.o
  CC      lib/packing.o
  CC      lib/crc-ccitt.o
  CC [M]  drivers/cxl/core/ras.o
  CC [M]  drivers/net/ethernet/broadcom/tg3.o
  CC [M]  net/netfilter/nft_last.o
  CC [M]  drivers/nvme/target/discovery.o
  CC      kernel/groups.o
  LD [M]  drivers/net/phy/realtek/realtek.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_transport.o
  CC [M]  drivers/regulator/pv88080-regulator.o
  CC [M]  drivers/misc/bh1770glc.o
  CC      fs/btrfs/direct-io.o
  CC [M]  drivers/nvme/target/io-cmd-file.o
  CC [M]  drivers/ata/pata_parport/epia.o
  CC [M]  drivers/ata/pata_parport/frpw.o
  CC [M]  fs/nfs/nfs4sysctl.o
  CC [M]  drivers/nvdimm/pmem.o
  CC [M]  drivers/misc/mei/pci-me.o
  CC      drivers/acpi/acpica/dbobject.o
  CC [M]  drivers/scsi/libsas/sas_scsi_host.o
  CC [M]  fs/smb/client/smb1ops.o
  CC      net/ipv4/udp_tunnel_stub.o
  CC      mm/shmem_quota.o
  CC [M]  drivers/scsi/isci/port.o
  CC [M]  drivers/net/mdio/mdio-cavium.o
  CC      drivers/mfd/lp8788.o
  CC      drivers/base/swnode.o
  CC [M]  drivers/net/ethernet/intel/libeth/rx.o
  CC [M]  drivers/cxl/core/acpi.o
  CC [M]  drivers/net/mdio/mdio-gpio.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_core.o
  CC      drivers/mfd/lp8788-irq.o
  CC      drivers/nvme/host/trace.o
  CC [M]  drivers/dma-buf/selftest.o
  CC      drivers/mfd/da9055-core.o
  CC      drivers/acpi/acpica/dbstats.o
  CC      drivers/mfd/da9055-i2c.o
  CC [M]  drivers/spi/spi-bitbang.o
  CC      drivers/net/phy/stubs.o
  CC      drivers/mfd/da9063-core.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_93cx6.o
  CC      drivers/mfd/da9063-irq.o
  CC      drivers/acpi/acpica/dbutils.o
  AR      drivers/message/built-in.a
  CC      lib/crc16.o
  CC [M]  drivers/ata/pata_parport/friq.o
  CC      drivers/nvme/host/multipath.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_pci.o
  CC [M]  drivers/regulator/pv88090-regulator.o
  CC [M]  drivers/misc/mei/hw-me.o
  CC [M]  net/netfilter/nft_counter.o
  CC [M]  drivers/nvme/target/io-cmd-bdev.o
  CC      drivers/acpi/acpica/dbxface.o
  CC [M]  drivers/nvme/target/pr.o
  CC [M]  net/netfilter/nft_objref.o
  CC [M]  drivers/cxl/core/trace.o
  CC      fs/btrfs/acl.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_csr.o
  CC      mm/pt_reclaim.o
  CC      drivers/acpi/processor_core.o
  CC      fs/attr.o
  CC      drivers/net/phy/mdio_devres.o
  CC [M]  drivers/nvdimm/btt.o
  CC [M]  drivers/dma-buf/st-dma-fence.o
  CC [M]  drivers/regulator/pwm-regulator.o
  CC [M]  drivers/regulator/tps51632-regulator.o
  CC [M]  drivers/net/ethernet/intel/libie/rx.o
  CC [M]  fs/nfs/pnfs.o
  CC [M]  drivers/nvdimm/virtio_pmem.o
  CC      kernel/vhost_task.o
  CC [M]  drivers/nvdimm/nd_virtio.o
  CC [M]  fs/smb/client/cifssmb.o
  CC      drivers/acpi/acpica/rsdump.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_ctl.o
  CC [M]  drivers/dma-buf/st-dma-fence-chain.o
  CC [M]  drivers/scsi/isci/host.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_reg_print.o
  CC      drivers/mfd/da9063-i2c.o
  CC [M]  drivers/dma-buf/st-dma-fence-unwrap.o
  CC [M]  drivers/net/mdio/mdio-mscc-miim.o
  CC      fs/btrfs/zoned.o
  CC      lib/crc-t10dif.o
  CC      drivers/base/faux.o
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_main.o
  CC      fs/btrfs/verity.o
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_hw.o
  AR      drivers/acpi/acpica/built-in.a
  CC [M]  drivers/net/bonding/bond_main.o
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_ethtool.o
  CC [M]  drivers/scsi/libsas/sas_task.o
  CC [M]  drivers/misc/apds990x.o
  CC      net/ipv4/sysctl_net_ipv4.o
  CC [M]  drivers/spi/spi-butterfly.o
  CC [M]  mm/hwpoison-inject.o
  CC [M]  fs/smb/client/cifs_spnego_negtokeninit.asn1.o
  CC [M]  drivers/misc/enclosure.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_debugfs.o
  CC [M]  drivers/net/bonding/bond_3ad.o
  CC [M]  drivers/dma-buf/st-dma-resv.o
  LD [M]  drivers/net/ethernet/intel/libeth/libeth.o
  CC      drivers/base/auxiliary.o
  CC      drivers/mfd/max14577.o
  CC [M]  drivers/ata/pata_parport/fit2.o
  CC [M]  net/netfilter/nft_inner.o
  CC      drivers/base/devtmpfs.o
  CC [M]  drivers/regulator/pcap-regulator.o
  CC      kernel/kcmp.o
  CC [M]  drivers/nvme/target/passthru.o
  CC [M]  fs/nfs/pnfs_dev.o
  CC      drivers/acpi/processor_pdc.o
  CC [M]  fs/nfs/pnfs_nfs.o
  CC      drivers/acpi/ec.o
  CC      drivers/nvme/host/zns.o
  CC      drivers/net/phy/phy.o
  CC [M]  drivers/cxl/core/region.o
  AR      drivers/dma-buf/built-in.a
  LD [M]  drivers/dma-buf/dmabuf_selftests.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_core.o
  CC      drivers/net/phy/phy-c45.o
  CC      lib/crc-itu-t.o
  CC [M]  drivers/spi/spi-cadence.o
  CC      drivers/base/isa.o
  CC      drivers/acpi/dock.o
  AR      mm/built-in.a
  LD [M]  drivers/net/ethernet/intel/libie/libie.o
  CC      kernel/freezer.o
  CC [M]  drivers/net/mdio/mdio-mvusb.o
  CC      kernel/profile.o
  CC [M]  drivers/misc/mei/gsc-me.o
  CC [M]  drivers/regulator/raa215300.o
  CC [M]  drivers/nvme/target/zns.o
  HOSTCC  lib/gen_crc32table
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_devlink.o
  CC [M]  drivers/ata/pata_parport/fit3.o
  CC [M]  fs/smb/client/asn1.o
  CC      drivers/base/node.o
  CC [M]  drivers/scsi/isci/task.o
  CC [M]  drivers/ata/pata_parport/on20.o
  CC [M]  drivers/cxl/pmem.o
  CC      drivers/acpi/pci_root.o
  CC [M]  drivers/ata/pata_parport/on26.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_pci.o
  LD [M]  drivers/nvdimm/nd_pmem.o
  CC [M]  drivers/scsi/isci/probe_roms.o
  LD [M]  drivers/nvdimm/nd_btt.o
  CC      drivers/acpi/pci_link.o
  CC      drivers/mfd/max77693.o
  AR      drivers/nvdimm/built-in.a
  CC [M]  drivers/regulator/rc5t583-regulator.o
  CC [M]  drivers/regulator/rt4801-regulator.o
  CC [M]  drivers/scsi/libsas/sas_ata.o
  CC      net/ipv4/proc.o
  CC [M]  net/netfilter/nft_chain_route.o
  CC      drivers/nvme/host/fault_inject.o
  CC [M]  drivers/spi/spi-ch341.o
  CC      drivers/ata/libata-sata.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_trigger_diag.o
  CC [M]  drivers/misc/mei/pci-txe.o
  HOSTCC  lib/gen_crc64table
  CC      lib/xxhash.o
  CC [M]  drivers/scsi/libsas/sas_host_smp.o
  CC [M]  net/netfilter/nf_tables_offload.o
  CC [M]  drivers/net/mdio/mdio-thunder.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_ethtool.o
  CC [M]  drivers/nvme/target/fabrics-cmd-auth.o
  CC [M]  drivers/net/bonding/bond_alb.o
  CC [M]  drivers/net/ipvlan/ipvlan_core.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_fw.o
  CC      lib/genalloc.o
  AR      fs/btrfs/built-in.a
  CC [M]  drivers/cxl/core/mce.o
  CC      drivers/mfd/max77843.o
  CC      drivers/net/phy/phy-core.o
  CC [M]  fs/nfs/nfs42proc.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_reg_print.o
  CC [M]  drivers/regulator/rt4803.o
  CC      lib/textsearch.o
  CC      drivers/net/phy/phy_device.o
  CC      drivers/ata/libata-sff.o
  CC [M]  drivers/spi/spi-cs42l43.o
  CC [M]  drivers/scsi/isci/remote_node_context.o
  CC [M]  drivers/nvme/target/auth.o
  CC      kernel/stacktrace.o
  CC      net/ipv4/fib_rules.o
  CC [M]  drivers/misc/smpro-errmon.o
  CC      net/ipv4/ipmr.o
  CC      net/ipv4/ipmr_base.o
  CC [M]  drivers/misc/mei/hw-txe.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_warpdrive.o
  CC      lib/percpu_counter.o
  LD [M]  drivers/scsi/aic7xxx/aic7xxx.o
  CC      drivers/base/memory.o
  CC [M]  drivers/regulator/rt4831-regulator.o
  CC      drivers/acpi/pci_irq.o
  CC      drivers/scsi/scsi.o
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_param.o
  CC      drivers/base/module.o
  AR      drivers/net/mdio/built-in.a
  CC      drivers/nvme/host/hwmon.o
  CC      drivers/nvme/host/auth.o
  CC      drivers/net/phy/linkmode.o
  CC      lib/iommu-helper.o
  CC [M]  drivers/net/ethernet/intel/e1000e/82571.o
  CC      drivers/mfd/max8925-core.o
  CC [M]  net/netfilter/nft_set_hash.o
  CC [M]  drivers/regulator/rt5033-regulator.o
  CC [M]  drivers/regulator/rt5120-regulator.o
  CC [M]  drivers/ata/pata_parport/ktti.o
  LD [M]  fs/smb/client/cifs.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_main.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_ethtool.o
  CC      kernel/dma.o
  CC      drivers/nvme/host/pci.o
  CC [M]  drivers/misc/mei/vsc-tp.o
  CC [M]  drivers/net/ipvlan/ipvlan_main.o
  CC [M]  drivers/nvme/target/trace.o
  CC [M]  drivers/net/team/team_core.o
  LD [M]  drivers/scsi/libsas/libsas.o
  CC      fs/bad_inode.o
  CC [M]  drivers/scsi/isci/remote_node_table.o
  CC [M]  drivers/spi/spi-dln2.o
  CC      drivers/ata/libata-pmp.o
  CC [M]  drivers/scsi/isci/unsolicited_frame_control.o
  CC [M]  drivers/net/vmxnet3/vmxnet3_drv.o
  AR      drivers/cxl/core/built-in.a
  LD [M]  drivers/cxl/core/cxl_core.o
  CC [M]  drivers/cxl/security.o
  CC      drivers/base/auxiliary_sysfs.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_debugfs.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_82575.o
  AR      drivers/net/ethernet/realtek/built-in.a
  CC [M]  drivers/net/ethernet/realtek/8139cp.o
  CC [M]  drivers/ata/pata_parport/bpck6.o
  CC      drivers/ata/libata-acpi.o
  CC      drivers/acpi/acpi_apd.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_hw_stats.o
  CC      drivers/base/hypervisor.o
  CC      drivers/net/phy/phy_link_topology.o
  CC      lib/fault-inject.o
  CC [M]  drivers/misc/mei/vsc-fw-loader.o
  CC [M]  drivers/net/ethernet/intel/e1000e/ich8lan.o
  CC [M]  fs/nfs/nfs42xattr.o
  CC      drivers/mfd/max8925-i2c.o
  CC [M]  drivers/regulator/rt5190a-regulator.o
  LD [M]  drivers/net/ethernet/intel/e1000/e1000.o
  AR      drivers/net/ethernet/meta/built-in.a
  CC      net/ipv4/syncookies.o
  CC [M]  drivers/nvme/target/loop.o
  CC [M]  drivers/regulator/rt5739.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_mac.o
  CC      kernel/smp.o
  CC [M]  drivers/net/bonding/bond_sysfs.o
  CC [M]  drivers/cxl/mem.o
  CC      net/ipv4/netfilter.o
  CC [M]  drivers/spi/spi-dw-core.o
  CC [M]  drivers/scsi/isci/port_config.o
  LD [M]  drivers/scsi/mpt3sas/mpt3sas.o
  CC [M]  drivers/misc/mei/platform-vsc.o
  CC      drivers/acpi/acpi_platform.o
  CC      kernel/uid16.o
  CC [M]  drivers/net/bonding/bond_sysfs_slave.o
  CC [M]  drivers/misc/smpro-misc.o
  LD [M]  drivers/scsi/aic7xxx/aic79xx.o
  CC [M]  drivers/net/ipvlan/ipvlan_l3s.o
  CC      fs/file.o
  CC      kernel/module_signature.o
  LD [M]  fs/nfs/nfs.o
  CC [M]  drivers/net/vmxnet3/vmxnet3_ethtool.o
  CC      fs/filesystems.o
  CC [M]  drivers/net/ipvlan/ipvtap.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_hwmon.o
  CC [M]  net/netfilter/nft_set_bitmap.o
  CC      drivers/ata/libata-zpodd.o
  CC      drivers/base/soc.o
  CC      net/ipv4/tcp_cubic.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_irq.o
  CC      lib/error-inject.o
  CC [M]  drivers/misc/hpilo.o
  CC      drivers/scsi/hosts.o
  CC [M]  drivers/nvme/target/fc.o
  CC      kernel/kallsyms.o
  CC [M]  drivers/cxl/pci.o
  CC [M]  drivers/regulator/rt5759-regulator.o
  CC      fs/namespace.o
  LD [M]  fs/nfs/nfsv2.o
  CC      net/ipv4/tcp_sigpool.o
  LD [M]  drivers/misc/mei/mei.o
  LD [M]  drivers/misc/mei/mei-me.o
  LD [M]  drivers/misc/mei/mei-gsc.o
  LD [M]  drivers/misc/mei/mei-txe.o
  LD [M]  drivers/misc/mei/mei-vsc-hw.o
  LD [M]  drivers/misc/mei/mei-vsc.o
  CC [M]  drivers/net/ethernet/intel/e1000e/80003es2lan.o
  LD [M]  drivers/scsi/isci/isci.o
  CC      net/ipv4/tcp_bpf.o
  CC [M]  drivers/net/team/team_nl.o
  CC      drivers/mfd/max8997.o
  CC [M]  drivers/net/ethernet/realtek/8139too.o
  LD [M]  fs/nfs/nfsv3.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_main.o
  CC      net/ipv4/udp_bpf.o
  CC      drivers/net/phy/phy_package.o
  LD [M]  fs/nfs/nfsv4.o
  CC [M]  drivers/nvme/host/fabrics.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_nvm.o
  CC [M]  drivers/net/team/team_mode_broadcast.o
  CC [M]  drivers/spi/spi-dw-dma.o
  CC [M]  drivers/net/ethernet/intel/igbvf/vf.o
  CC      fs/seq_file.o
  CC      drivers/acpi/acpi_pnp.o
  CC [M]  drivers/net/bonding/bond_debugfs.o
  CC      drivers/scsi/scsi_ioctl.o
  CC      drivers/ata/libata-pata-timings.o
  CC      drivers/acpi/power.o
  CC [M]  drivers/net/ethernet/intel/igbvf/mbx.o
  CC      lib/syscall.o
  CC      drivers/net/phy/phy_caps.o
  CC      drivers/mfd/max8997-irq.o
  CC [M]  drivers/misc/apds9802als.o
  CC      drivers/base/pinctrl.o
  CC [M]  net/netfilter/nft_set_rbtree.o
  LD [M]  drivers/net/ipvlan/ipvlan.o
  CC [M]  drivers/regulator/rt6160-regulator.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_main.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_common.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_mac.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_netdev.o
  CC [M]  drivers/net/ethernet/realtek/r8169_main.o
  LD [M]  drivers/cxl/cxl_port.o
  LD [M]  drivers/cxl/cxl_acpi.o
  LD [M]  drivers/cxl/cxl_pmem.o
  LD [M]  drivers/cxl/cxl_mem.o
  LD [M]  drivers/cxl/cxl_pci.o
  CC      drivers/net/phy/mdio_bus.o
  CC [M]  drivers/net/ethernet/intel/igbvf/ethtool.o
  AR      drivers/cxl/built-in.a
  CC [M]  drivers/net/vmxnet3/vmxnet3_xdp.o
  CC [M]  drivers/spi/spi-dw-mmio.o
  CC      fs/xattr.o
  CC [M]  drivers/net/bonding/bond_netlink.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_82599.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_mac.o
  CC [M]  drivers/net/ethernet/realtek/r8169_firmware.o
  CC      lib/dynamic_debug.o
  CC [M]  drivers/net/team/team_mode_roundrobin.o
  CC      net/ipv4/cipso_ipv4.o
  CC      drivers/base/devcoredump.o
  CC [M]  drivers/misc/isl29003.o
  CC      drivers/net/phy/mdio_device.o
  CC [M]  drivers/net/ethernet/intel/e1000e/mac.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_82598.o
  CC [M]  drivers/spi/spi-dw-pci.o
  CC      drivers/acpi/event.o
  CC [M]  drivers/spi/spi-gpio.o
  CC [M]  drivers/net/bonding/bond_options.o
  CC [M]  drivers/regulator/rt6190-regulator.o
  CC      drivers/mfd/max8998.o
  CC      kernel/acct.o
  CC [M]  drivers/regulator/rt6245-regulator.o
  CC [M]  drivers/net/ethernet/intel/e1000e/manage.o
  CC      drivers/scsi/scsicam.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_phy.o
  CC      lib/errname.o
  CC      drivers/ata/ahci.o
  CC      drivers/mfd/max8998-irq.o
  CC [M]  drivers/net/xen-netback/netback.o
  CC [M]  drivers/net/usb/catc.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/vf.o
  CC      drivers/mfd/adp5520.o
  CC [M]  drivers/nvme/target/tcp.o
  CC [M]  drivers/net/ethernet/intel/igbvf/netdev.o
  CC [M]  net/netfilter/nft_set_pipapo.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/mbx.o
  CC [M]  drivers/nvme/host/fc.o
  CC [M]  drivers/net/bonding/bond_procfs.o
  CC [M]  drivers/misc/isl29020.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/ethtool.o
  CC [M]  drivers/net/team/team_mode_random.o
  CC      drivers/net/phy/swphy.o
  CC      drivers/base/platform-msi.o
  CC      drivers/net/phy/phy_led_triggers.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_pci.o
  CC      drivers/base/physical_location.o
  LD [M]  drivers/net/vmxnet3/vmxnet3.o
  CC [M]  drivers/spi/spi-intel.o
  CC      drivers/scsi/scsi_error.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_main.o
  CC      drivers/scsi/scsi_lib.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_ethtool.o
  AR      drivers/net/ethernet/intel/built-in.a
  CC      drivers/base/trace.o
  CC [M]  drivers/regulator/rtmv20-regulator.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_mbx.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_adminq.o
  CC      kernel/vmcore_info.o
  CC [M]  drivers/net/xen-netback/xenbus.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.o
  CC [M]  drivers/net/ethernet/intel/e1000e/nvm.o
  CC [M]  drivers/spi/spi-intel-pci.o
  CC [M]  drivers/nvme/host/tcp.o
  CC      drivers/acpi/evged.o
  CC      drivers/ata/libahci.o
  CC [M]  net/netfilter/nft_set_pipapo_avx2.o
  CC [M]  drivers/net/ethernet/intel/e100.o
  CC      drivers/ata/ahci_platform.o
  CC [M]  drivers/misc/tsl2550.o
  CC [M]  drivers/net/usb/kaweth.o
  CC [M]  drivers/net/hyperv/netvsc_drv.o
  CC [M]  drivers/spi/spi-intel-platform.o
  CC [M]  drivers/misc/ds1682.o
  CC [M]  drivers/net/hyperv/netvsc.o
  CC      net/ipv4/xfrm4_policy.o
  CC [M]  drivers/net/team/team_mode_activebackup.o
  CC      drivers/net/phy/mii_timestamper.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_i210.o
  CC [M]  drivers/net/thunderbolt/main.o
  CC      drivers/mfd/tps6586x.o
  CC      drivers/net/phy/fixed_phy.o
  CC      lib/nlattr.o
  LD [M]  drivers/net/bonding/bonding.o
  CC      fs/libfs.o
  CC [M]  drivers/regulator/rtq2134-regulator.o
  AR      drivers/base/built-in.a
  CC [M]  drivers/net/usb/pegasus.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_phylink.o
  CC [M]  drivers/spi/spi-lantiq-ssc.o
  CC [M]  net/netfilter/nft_ct_fast.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/ipsec.o
  CC      drivers/acpi/sysfs.o
  CC      drivers/net/loopback.o
  CC      kernel/elfcorehdr.o
  CC      drivers/acpi/property.o
  CC      drivers/scsi/constants.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_ptp.o
  CC [M]  drivers/net/ethernet/realtek/r8169_phy_config.o
  CC      fs/fs-writeback.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_i225.o
  CC      drivers/net/netconsole.o
  CC [M]  drivers/misc/hmc6352.o
  CC [M]  drivers/regulator/rtq6752-regulator.o
  CC      drivers/net/netkit.o
  CC      drivers/scsi/scsi_lib_dma.o
  CC      drivers/net/tun.o
  CC [M]  drivers/net/xen-netback/interface.o
  CC [M]  drivers/net/ethernet/intel/e1000e/phy.o
  LD [M]  drivers/nvme/target/nvmet.o
  LD [M]  drivers/nvme/target/nvme-loop.o
  LD [M]  drivers/net/ethernet/intel/igbvf/igbvf.o
  LD [M]  drivers/nvme/target/nvmet-fc.o
  CC [M]  drivers/net/ethernet/realtek/r8169_leds.o
  LD [M]  drivers/nvme/target/nvmet-tcp.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_phy.o
  CC [M]  drivers/net/team/team_mode_loadbalance.o
  CC [M]  net/netfilter/nft_compat.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_common.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_base.o
  CC      net/ipv4/xfrm4_state.o
  CC [M]  drivers/spi/spi-ljca.o
  CC      kernel/crash_reserve.o
  LD [M]  drivers/nvme/host/nvme-fabrics.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_hwmon.o
  CC [M]  drivers/misc/vmw_balloon.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_rpc.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_hmc.o
  CC      drivers/mfd/tps65090.o
  CC [M]  net/netfilter/nft_connlimit.o
  CC [M]  drivers/regulator/rtq2208-regulator.o
  CC [M]  drivers/misc/lattice-ecp3-config.o
  CC      fs/pnode.o
  CC      kernel/kexec_core.o
  CC      drivers/acpi/debugfs.o
  CC [M]  drivers/net/usb/rtl8150.o
  CC [M]  drivers/net/phy/phylink.o
  CC      fs/splice.o
  CC [M]  drivers/net/phy/ax88796b.o
  CC [M]  drivers/net/thunderbolt/trace.o
  CC [M]  drivers/net/xen-netback/hash.o
  CC      drivers/scsi/scsi_scan.o
  CC      lib/cpu_rmap.o
  CC      drivers/mfd/aat2870-core.o
  CC      drivers/ata/libahci_platform.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_xsk.o
  LD [M]  drivers/net/ethernet/realtek/r8169.o
  CC      net/ipv4/xfrm4_input.o
  CC [M]  drivers/misc/dw-xdata-pcie.o
  CC [M]  drivers/net/xen-netback/rx.o
  CC [M]  drivers/spi/spi-lm70llp.o
  CC [M]  drivers/net/hyperv/rndis_filter.o
  CC [M]  drivers/spi/spi-microchip-core.o
  CC      lib/closure.o
  CC [M]  drivers/net/usb/r8152.o
  AR      drivers/nvme/host/built-in.a
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_lan_hmc.o
  LD [M]  drivers/nvme/host/nvme-fc.o
  LD [M]  drivers/nvme/host/nvme-tcp.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_nvm.o
  CC [M]  drivers/net/usb/lan78xx.o
  AR      drivers/nvme/built-in.a
  CC      drivers/ata/ata_piix.o
  LD [M]  drivers/net/team/team.o
  CC [M]  drivers/net/hyperv/netvsc_trace.o
  CC      drivers/net/virtio_net.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.o
  CC      kernel/crash_core.o
  CC      drivers/mfd/intel-lpss.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_time.o
  CC      lib/dynamic_queue_limits.o
  CC      net/ipv4/xfrm4_output.o
  CC [M]  net/netfilter/nft_numgen.o
  LD [M]  drivers/net/ethernet/intel/ixgbevf/ixgbevf.o
  CC [M]  drivers/regulator/sky81452-regulator.o
  CC [M]  drivers/misc/xilinx_sdfec.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_mbx.o
  CC      drivers/ata/pata_sis.o
  CC [M]  drivers/net/ethernet/intel/e1000e/param.o
  CC      lib/glob.o
  CC [M]  drivers/net/phy/bcm7xxx.o
  CC      net/ipv4/xfrm4_protocol.o
  CC      drivers/acpi/acpi_lpat.o
  CC      drivers/acpi/acpi_fpdt.o
  CC [M]  drivers/net/phy/bcm87xx.o
  CC      net/ipv4/tcp_ao.o
  CC [M]  drivers/net/usb/asix_devices.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_tlv.o
  CC [M]  drivers/net/phy/bcm-phy-lib.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_phy.o
  LD [M]  drivers/net/thunderbolt/thunderbolt_net.o
  CC [M]  drivers/net/phy/bcm-phy-ptp.o
  CC      drivers/acpi/acpi_lpit.o
  CC [M]  drivers/spi/spi-microchip-core-qspi.o
  CC [M]  drivers/net/ethernet/intel/e1000e/ethtool.o
  CC [M]  drivers/regulator/slg51000-regulator.o
  CC [M]  drivers/net/ethernet/intel/e1000e/netdev.o
  CC      drivers/ata/ata_generic.o
  LD [M]  drivers/net/xen-netback/xen-netback.o
  CC [M]  drivers/net/hyperv/netvsc_bpf.o
  LD [M]  drivers/net/ethernet/intel/igb/igb.o
  CC [M]  drivers/regulator/sy7636a-regulator.o
  CC [M]  drivers/net/phy/broadcom.o
  CC      lib/digsig.o
  CC [M]  drivers/misc/tps6594-esm.o
  CC      fs/sync.o
  CC      drivers/mfd/intel-lpss-pci.o
  CC      kernel/kexec.o
  CC [M]  net/netfilter/nft_ct.o
  CC      kernel/kexec_file.o
  CC [M]  drivers/net/phy/dp83640.o
  CC [M]  drivers/net/usb/asix_common.o
  CC [M]  drivers/net/usb/ax88172a.o
  GEN     drivers/scsi/scsi_devinfo_tbl.c
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_txrx.o
  CC      drivers/scsi/scsi_devinfo.o
  CC      kernel/compat.o
  CC [M]  drivers/regulator/tps6105x-regulator.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_x540.o
  CC [M]  drivers/regulator/tps62360-regulator.o
  CC      lib/strncpy_from_user.o
  CC [M]  drivers/ata/acard-ahci.o
  CC [M]  drivers/net/usb/ax88179_178a.o
  CC      net/ipv4/bpf_tcp_ca.o
  CC [M]  drivers/spi/spi-mxic.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_x550.o
  CC      drivers/acpi/acpi_watchdog.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_diag.o
  CC [M]  net/ipv4/ip_tunnel.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_ethtool.o
  CC [M]  drivers/misc/tps6594-pfsm.o
  CC [M]  drivers/net/phy/lxt.o
  CC [M]  drivers/net/phy/microchip.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_nvm.o
  CC [M]  drivers/net/phy/smsc.o
  CC      drivers/scsi/scsi_netlink.o
  CC      fs/utimes.o
  CC      drivers/mfd/intel-lpss-acpi.o
  CC      drivers/scsi/scsi_sysctl.o
  CC      lib/strnlen_user.o
  CC      lib/net_utils.o
  CC      drivers/acpi/prmt.o
  CC [M]  drivers/net/usb/cdc_ether.o
  CC      drivers/mfd/palmas.o
  LD [M]  drivers/net/hyperv/hv_netvsc.o
  CC [M]  net/netfilter/nft_flow_offload.o
  CC [M]  drivers/regulator/tps65023-regulator.o
  CC [M]  drivers/net/usb/cdc_eem.o
  CC      lib/sg_pool.o
  CC [M]  drivers/net/ethernet/intel/e1000e/ptp.o
  CC      drivers/scsi/scsi_proc.o
  CC [M]  drivers/ata/sata_inic162x.o
  CC [M]  drivers/misc/nsm.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_debugfs.o
  CC      lib/memregion.o
  CC      drivers/net/xen-netfront.o
  CC      kernel/utsname.o
  CC [M]  drivers/spi/spi-oc-tiny.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_ptp.o
  CC [M]  drivers/net/usb/dm9601.o
  CC      fs/d_path.o
  CC      drivers/mfd/rc5t583.o
  CC [M]  drivers/regulator/tps6507x-regulator.o
  CC      drivers/mfd/rc5t583-irq.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_lib.o
  CC      drivers/mfd/syscon.o
  CC      kernel/user_namespace.o
  CC [M]  net/netfilter/nft_limit.o
  CC      fs/stack.o
  CC      fs/fs_struct.o
  CC      lib/irq_poll.o
  CC      drivers/scsi/scsi_debugfs.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_diag.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_ptp.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_xsk.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_e610.o
  CC [M]  drivers/ata/sata_sil24.o
  CC      kernel/pid_namespace.o
  CC [M]  net/netfilter/nft_nat.o
  CC [M]  net/ipv4/ipip.o
  CC      drivers/scsi/scsi_trace.o
  CC [M]  drivers/ata/sata_dwc_460ex.o
  CC [M]  drivers/spi/spi-pci1xxxx.o
  CC      drivers/acpi/acpi_pcc.o
  UPD     kernel/config_data
  CC [M]  drivers/net/ethernet/intel/igc/igc_dump.o
  AR      drivers/misc/built-in.a
  CC [M]  drivers/net/ethernet/intel/igc/igc_tsn.o
  CC [M]  drivers/net/usb/sr9700.o
  CC      fs/statfs.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb.o
  CC      fs/fs_pin.o
  CC [M]  net/netfilter/nft_queue.o
  CC [M]  drivers/net/usb/sr9800.o
  CC      drivers/mfd/as3711.o
  CC [M]  drivers/regulator/tps65086-regulator.o
  AR      drivers/net/phy/built-in.a
  CC      kernel/stop_machine.o
  CC [M]  net/ipv4/fou_core.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb_82598.o
  LD [M]  drivers/net/ethernet/meta/fbnic/fbnic.o
  CC      drivers/scsi/scsi_logging.o
  CC [M]  net/netfilter/nft_quota.o
  CC      drivers/mfd/intel_soc_pmic_crc.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_txrx.o
  CC [M]  drivers/ata/ahci_dwc.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_xdp.o
  CC [M]  net/ipv4/fou_nl.o
  CC [M]  drivers/regulator/tps65090-regulator.o
  CC      drivers/scsi/scsi_pm.o
  CC      kernel/audit.o
  CC [M]  drivers/regulator/tps6524x-regulator.o
  CC      kernel/auditfilter.o
  CC [M]  net/ipv4/fou_bpf.o
  CC      drivers/net/net_failover.o
  CC      drivers/acpi/acpi_ffh.o
  CC      lib/stackdepot.o
  CC [M]  drivers/net/usb/smsc75xx.o
  CC      drivers/mfd/intel_soc_pmic_chtwc.o
  CC      fs/nsfs.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_ptp.o
  CC [M]  drivers/spi/spi-pxa2xx.o
  CC [M]  drivers/mfd/88pm800.o
  CC [M]  drivers/regulator/tps6586x-regulator.o
  CC [M]  net/netfilter/nft_reject.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_leds.o
  CC      drivers/acpi/acpi_adxl.o
  CC [M]  drivers/ata/pdc_adma.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb_82599.o
  CC [M]  drivers/spi/spi-pxa2xx-dma.o
  CC [M]  drivers/net/usb/smsc95xx.o
  CC      fs/fs_types.o
  CC [M]  drivers/ata/sata_qstor.o
  CC      kernel/auditsc.o
  CC      drivers/acpi/ac.o
  CC [M]  net/netfilter/nft_reject_inet.o
  CC [M]  drivers/regulator/tps65910-regulator.o
  CC [M]  drivers/net/dummy.o
  CC      drivers/scsi/scsi_dh.o
  CC [M]  drivers/regulator/tps65912-regulator.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_ddp.o
  CC [M]  drivers/ata/sata_sx4.o
  CC      drivers/scsi/scsi_bsg.o
  CC [M]  drivers/mfd/88pm80x.o
  CC      fs/fs_context.o
  CC [M]  drivers/regulator/tps65132-regulator.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_client.o
  CC [M]  drivers/regulator/tps68470-regulator.o
  CC [M]  drivers/net/usb/gl620a.o
  CC      lib/ref_tracker.o
  CC      drivers/acpi/button.o
  CC [M]  net/netfilter/nft_reject_netdev.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb_nl.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.o
  CC [M]  net/netfilter/nft_tunnel.o
  CC      drivers/acpi/fan_core.o
  CC [M]  drivers/mfd/88pm805.o
  LD [M]  drivers/net/ethernet/intel/e1000e/e1000e.o
  CC      fs/fs_parser.o
  CC [M]  net/ipv4/gre_demux.o
  CC [M]  drivers/net/ifb.o
  CC [M]  net/netfilter/nft_log.o
  CC      drivers/acpi/fan_attr.o
  CC [M]  drivers/net/macsec.o
  CC [M]  drivers/ata/sata_mv.o
  CC      lib/bootconfig.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_sysfs.o
  CC      kernel/audit_watch.o
  CC      fs/fsopen.o
  LD [M]  drivers/net/ethernet/intel/igc/igc.o
  CC      kernel/audit_fsnotify.o
  CC [M]  net/ipv4/ip_gre.o
  CC      lib/asn1_decoder.o
  CC [M]  drivers/spi/spi-pxa2xx-platform.o
  CC      drivers/scsi/scsi_common.o
  CC      lib/asn1_encoder.o
  CC      fs/init.o
  CC [M]  drivers/net/amt.o
  CC      drivers/acpi/fan_hwmon.o
  CC [M]  drivers/regulator/twl-regulator.o
  CC      drivers/scsi/virtio_scsi.o
  CC [M]  drivers/ata/sata_nv.o
  CC      drivers/acpi/pci_slot.o
  CC [M]  drivers/spi/spi-pxa2xx-pci.o
  CC [M]  drivers/mfd/sm501.o
  GEN     lib/oid_registry_data.c
  CC      fs/kernel_read_file.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_debugfs.o
  CC [M]  net/ipv4/udp_tunnel_core.o
  CC      lib/ucs2_string.o
  CC [M]  drivers/spi/spi-sc18is602.o
  CC [M]  drivers/ata/sata_promise.o
  CC [M]  drivers/mfd/bcm590xx.o
  CC [M]  drivers/regulator/twl6030-regulator.o
  CC      kernel/audit_tree.o
  CC      drivers/acpi/processor_driver.o
  CC [M]  drivers/net/macvlan.o
  CC [M]  drivers/spi/spi-sifive.o
  CC [M]  net/ipv4/udp_tunnel_nic.o
  CC [M]  drivers/net/usb/net1080.o
  CC [M]  drivers/regulator/wm831x-dcdc.o
  CC [M]  drivers/ata/sata_sil.o
  CC      fs/mnt_idmapping.o
  CC [M]  drivers/net/usb/plusb.o
  CC [M]  drivers/spi/spi-tle62x0.o
  CC [M]  drivers/net/macvtap.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_xsk.o
  CC [M]  drivers/ata/sata_sis.o
  CC [M]  drivers/regulator/wm831x-isink.o
  CC [M]  drivers/spi/spi-xcomm.o
  CC [M]  drivers/net/mii.o
  CC [M]  net/netfilter/nft_masq.o
  CC [M]  drivers/regulator/wm831x-ldo.o
  CC [M]  drivers/net/mdio.o
  CC [M]  drivers/mfd/bd9571mwv.o
  CC      drivers/scsi/sd.o
  CC      lib/ubsan.o
  CC [M]  drivers/net/usb/rndis_host.o
  CC [M]  net/netfilter/nft_redir.o
  CC [M]  drivers/mfd/cros_ec_dev.o
  CC [M]  drivers/regulator/wm8350-regulator.o
  CC [M]  drivers/ata/sata_svw.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_devlink.o
  CC      drivers/acpi/processor_thermal.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_ipsec.o
  CC [M]  net/netfilter/nft_hash.o
  CC      lib/sbitmap.o
  CC [M]  drivers/net/usb/cdc_subset.o
  CC [M]  drivers/ata/sata_uli.o
  CC [M]  drivers/net/tap.o
  CC [M]  drivers/net/veth.o
  CC [M]  drivers/regulator/wm8400-regulator.o
  CC      lib/group_cpus.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_dcb.o
  CC [M]  drivers/regulator/wm8994-regulator.o
  CC      drivers/acpi/processor_idle.o
  CC [M]  net/netfilter/nft_fib.o
  CC [M]  drivers/spi/spi-xilinx.o
  CC [M]  drivers/mfd/cs42l43.o
  CC [M]  net/netfilter/nft_fib_inet.o
  CC      kernel/kprobes.o
  CC      drivers/acpi/processor_throttling.o
  CC      fs/remap_range.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_dcb_nl.o
  CC [M]  drivers/ata/sata_via.o
  CC      drivers/scsi/sd_dif.o
  CC [M]  drivers/net/bareudp.o
  CC      drivers/scsi/sd_zbc.o
  CC [M]  drivers/net/nlmon.o
  CC      drivers/scsi/sr.o
  CC      lib/fw_table.o
  CC [M]  drivers/net/pfcp.o
  CC      drivers/scsi/sr_ioctl.o
  CC      drivers/acpi/processor_perflib.o
  CC [M]  drivers/spi/spi-zynqmp-gqspi.o
  CC [M]  net/ipv4/ip_vti.o
  CC      kernel/fail_function.o
  CC      drivers/scsi/sr_vendor.o
  CC [M]  drivers/ata/sata_vsc.o
  CC      kernel/hung_task.o
  CC [M]  drivers/net/vrf.o
  CC [M]  drivers/mfd/cs42l43-i2c.o
  CC [M]  drivers/net/vsockmon.o
  CC [M]  net/ipv4/ah4.o
  CC [M]  drivers/net/usb/zaurus.o
  CC [M]  drivers/net/ntb_netdev.o
  CC      fs/pidfs.o
  CC [M]  drivers/spi/spi-amd.o
  CC      drivers/scsi/sg.o
  CC [M]  drivers/spi/spi-slave-time.o
  CC [M]  drivers/ata/pata_ali.o
  CC [M]  net/netfilter/nft_fib_netdev.o
  CC      kernel/watchdog.o
  CC [M]  drivers/ata/pata_amd.o
  CC [M]  drivers/scsi/raid_class.o
  CC [M]  lib/crc7.o
  CC      kernel/watchdog_perf.o
  CC [M]  net/netfilter/nft_socket.o
  CC [M]  lib/crc8.o
  CC [M]  drivers/scsi/scsi_transport_spi.o
  CC      drivers/acpi/container.o
  CC [M]  net/ipv4/esp4.o
  CC [M]  drivers/ata/pata_artop.o
  CC [M]  drivers/mfd/lp873x.o
  CC [M]  drivers/mfd/tqmx86.o
  LD [M]  drivers/net/ethernet/intel/ixgbe/ixgbe.o
  CC      fs/buffer.o
  CC [M]  net/netfilter/nft_osf.o
  CC      drivers/acpi/thermal_lib.o
  CC [M]  lib/bch.o
  CC [M]  net/netfilter/nft_tproxy.o
  CC [M]  drivers/net/usb/mcs7830.o
  CC      kernel/seccomp.o
  CC [M]  drivers/net/usb/usbnet.o
  CC      kernel/relay.o
  CC [M]  drivers/spi/spi-slave-system-control.o
  CC      fs/mpage.o
  CC [M]  drivers/ata/pata_atiixp.o
  CC      fs/proc_namespace.o
  CC [M]  drivers/ata/pata_atp867x.o
  AR      drivers/regulator/built-in.a
  CC [M]  net/ipv4/esp4_offload.o
  CC [M]  drivers/scsi/scsi_transport_fc.o
  LD [M]  drivers/net/ethernet/intel/i40e/i40e.o
  CC [M]  net/netfilter/nft_xfrm.o
  CC [M]  drivers/net/usb/int51x1.o
  CC      drivers/acpi/thermal.o
  CC      kernel/utsname_sysctl.o
  AR      drivers/net/ethernet/built-in.a
  CC [M]  drivers/mfd/arizona-core.o
  CC      drivers/acpi/nhlt.o
  CC [M]  lib/ts_kmp.o
  CC      kernel/delayacct.o
  CC      drivers/acpi/acpi_memhotplug.o
  CC [M]  net/netfilter/nft_synproxy.o
  CC      kernel/taskstats.o
  CC [M]  lib/ts_bm.o
  CC [M]  drivers/net/usb/kalmia.o
  CC [M]  net/netfilter/nft_chain_nat.o
  CC [M]  drivers/net/usb/ipheth.o
  CC      kernel/tsacct.o
  CC [M]  drivers/net/usb/sierra_net.o
  CC [M]  drivers/mfd/arizona-irq.o
  CC [M]  drivers/net/usb/cx82310_eth.o
  CC [M]  net/ipv4/ipcomp.o
  CC [M]  drivers/scsi/scsi_transport_iscsi.o
  CC [M]  drivers/ata/pata_cmd64x.o
  CC      drivers/acpi/ioapic.o
  CC [M]  drivers/ata/pata_cypress.o
  CC [M]  net/netfilter/nft_dup_netdev.o
  CC [M]  net/ipv4/xfrm4_tunnel.o
  CC      kernel/tracepoint.o
  CC [M]  lib/ts_fsm.o
  CC      drivers/acpi/battery.o
  CC [M]  drivers/ata/pata_efar.o
  CC      drivers/acpi/hed.o
  CC      drivers/acpi/bgrt.o
  CC [M]  lib/notifier-error-inject.o
  CC [M]  net/ipv4/tunnel4.o
  LD [M]  drivers/spi/spi-dw.o
  LD [M]  drivers/spi/spi-pxa2xx-core.o
  AR      drivers/spi/built-in.a
  CC [M]  drivers/net/usb/cdc_ncm.o
  CC      fs/direct-io.o
  CC [M]  net/netfilter/nft_fwd_netdev.o
  CC [M]  drivers/mfd/wm5102-tables.o
  CC [M]  net/ipv4/inet_diag.o
  CC [M]  drivers/mfd/wm5110-tables.o
  CC      drivers/acpi/cppc_acpi.o
  CC [M]  drivers/mfd/wm8997-tables.o
  CC      drivers/acpi/spcr.o
  CC [M]  net/ipv4/tcp_diag.o
  CC [M]  drivers/net/usb/huawei_cdc_ncm.o
  CC [M]  net/ipv4/udp_diag.o
  CC [M]  drivers/ata/pata_hpt366.o
  CC      kernel/latencytop.o
  CC [M]  lib/pm-notifier-error-inject.o
  CC [M]  drivers/net/usb/lg-vl600.o
  CC      fs/eventpoll.o
  CC      kernel/irq_work.o
  CC      fs/anon_inodes.o
  CC [M]  drivers/ata/pata_hpt37x.o
  CC [M]  drivers/net/usb/qmi_wwan.o
  CC      kernel/static_call.o
  CC [M]  drivers/net/usb/cdc_mbim.o
  CC [M]  drivers/mfd/wm8998-tables.o
  CC [M]  drivers/scsi/scsi_transport_sas.o
  CC [M]  drivers/mfd/cs47l24-tables.o
  CC      fs/signalfd.o
  CC [M]  drivers/ata/pata_hpt3x2n.o
  CC [M]  net/ipv4/raw_diag.o
  CC [M]  drivers/mfd/arizona-i2c.o
  CC [M]  net/netfilter/nf_flow_table_core.o
  CC      drivers/acpi/acpi_dbg.o
  CC [M]  lib/memory-notifier-error-inject.o
  CC [M]  drivers/scsi/scsi_transport_srp.o
  CC      kernel/static_call_inline.o
  CC [M]  drivers/scsi/iscsi_boot_sysfs.o
  CC [M]  drivers/mfd/arizona-spi.o
  CC      kernel/user-return-notifier.o
  CC [M]  net/netfilter/nf_flow_table_ip.o
  CC [M]  drivers/scsi/megaraid.o
  CC      kernel/padata.o
  CC [M]  drivers/net/usb/ch9200.o
  CC [M]  net/netfilter/nf_flow_table_offload.o
  CC      fs/timerfd.o
  CC [M]  drivers/mfd/wcd934x.o
  CC [M]  drivers/scsi/vmw_pvscsi.o
  CC [M]  lib/lru_cache.o
  CC      drivers/acpi/viot.o
  CC [M]  net/netfilter/nf_flow_table_xdp.o
  CC      kernel/jump_label.o
  CC      fs/eventfd.o
  CC [M]  net/netfilter/nf_flow_table_inet.o
  CC [M]  net/netfilter/x_tables.o
  CC      fs/userfaultfd.o
  CC [M]  drivers/mfd/wm8994-core.o
  CC [M]  drivers/ata/pata_hpt3x3.o
  CC [M]  net/netfilter/xt_tcpudp.o
  CC      kernel/context_tracking.o
  CC [M]  net/netfilter/xt_mark.o
  CC [M]  drivers/scsi/xen-scsifront.o
  CC [M]  drivers/ata/pata_it8213.o
  CC [M]  net/netfilter/xt_connmark.o
  CC      fs/aio.o
  CC [M]  net/netfilter/xt_nat.o
  CC [M]  drivers/scsi/storvsc_drv.o
  CC [M]  drivers/scsi/ses.o
  CC      fs/dax.o
  CC [M]  drivers/acpi/acpi_ipmi.o
  AR      drivers/net/built-in.a
  CC      kernel/iomem.o
  CC [M]  drivers/ata/pata_it821x.o
  CC      fs/locks.o
  CC [M]  drivers/scsi/scsi_debug.o
  CC [M]  net/netfilter/xt_AUDIT.o
  CC      kernel/rseq.o
  CC      kernel/watch_queue.o
  CHK     kernel/kheaders_data.tar.xz
  CC [M]  drivers/net/usb/aqc111.o
  CC [M]  drivers/acpi/acpi_video.o
  CC      fs/binfmt_script.o
  GEN     kernel/kheaders_data.tar.xz
  CC [M]  drivers/ata/pata_jmicron.o
  GZIP    kernel/config_data.gz
  CC [M]  net/netfilter/xt_CHECKSUM.o
  CC [M]  drivers/mfd/wm8994-irq.o
  CC [M]  net/netfilter/xt_CLASSIFY.o
  CC [M]  drivers/net/usb/r8153_ecm.o
  CC [M]  net/netfilter/xt_CONNSECMARK.o
  CC [M]  drivers/acpi/video_detect.o
  CC [M]  drivers/ata/pata_marvell.o
  CC [M]  drivers/acpi/acpi_tad.o
  CC [M]  drivers/mfd/wm8994-regmap.o
  CC      fs/binfmt_elf.o
  CC      kernel/configs.o
  AR      lib/lib.a
  CC [M]  drivers/mfd/madera-core.o
  GEN     lib/crc32table.h
  CC [M]  drivers/acpi/platform_profile.o
  GEN     lib/crc64table.h
  CC      lib/oid_registry.o
  CC [M]  drivers/ata/pata_netcell.o
  CC [M]  drivers/ata/pata_ninja32.o
  CC [M]  drivers/mfd/cs47l15-tables.o
  CC      fs/compat_binfmt_elf.o
  LD [M]  net/ipv4/fou.o
  LD [M]  net/ipv4/gre.o
  LD [M]  net/ipv4/udp_tunnel.o
  AR      net/ipv4/built-in.a
  CC [M]  drivers/acpi/sbshc.o
  CC      fs/backing-file.o
  CC [M]  drivers/acpi/sbs.o
  CC [M]  drivers/ata/pata_ns87415.o
  CC [M]  drivers/acpi/ec_sys.o
  CC [M]  drivers/mfd/cs47l35-tables.o
  CC      lib/crc32.o
  CC [M]  drivers/acpi/pfr_update.o
  CC [M]  drivers/ata/pata_oldpiix.o
  CC [M]  drivers/mfd/cs47l85-tables.o
  CC      lib/crc64.o
  CC [M]  drivers/acpi/pfr_telemetry.o
  CC [M]  drivers/ata/pata_optidma.o
  CC [M]  drivers/acpi/acpi_pad.o
  CC [M]  drivers/ata/pata_pdc2027x.o
  CC      fs/mbcache.o
  CC [M]  drivers/mfd/cs47l90-tables.o
  CC [M]  drivers/ata/pata_pdc202xx_old.o
  CC [M]  net/netfilter/xt_CT.o
  CC      fs/posix_acl.o
  CC      fs/coredump.o
  CC [M]  drivers/mfd/cs47l92-tables.o
  CC [M]  net/netfilter/xt_DSCP.o
  CC [M]  drivers/acpi/acpi_extlog.o
  CC [M]  drivers/ata/pata_radisys.o
  CC [M]  drivers/acpi/acpi_configfs.o
  CC      fs/drop_caches.o
  LD [M]  drivers/net/usb/asix.o
  LD [M]  drivers/scsi/hv_storvsc.o
  CC [M]  net/netfilter/xt_HL.o
  CC      fs/sysctls.o
  CC [M]  drivers/mfd/madera-i2c.o
  CC [M]  drivers/ata/pata_rdc.o
  CC [M]  net/netfilter/xt_HMARK.o
  CC      drivers/scsi/scsi_sysfs.o
  CC      fs/fhandle.o
  CC      fs/bpf_fs_kfuncs.o
  CC [M]  net/netfilter/xt_LED.o
  CC [M]  drivers/mfd/madera-spi.o
  CC [M]  drivers/ata/pata_sch.o
  CC [M]  net/netfilter/xt_LOG.o
  AR      kernel/built-in.a
  CC [M]  drivers/mfd/cs40l50-core.o
  CC [M]  net/netfilter/xt_NETMAP.o
  CC [M]  fs/binfmt_misc.o
  CC [M]  net/netfilter/xt_NFLOG.o
  CC [M]  drivers/ata/pata_serverworks.o
  CC [M]  net/netfilter/xt_NFQUEUE.o
  CC [M]  net/netfilter/xt_RATEEST.o
  CC [M]  drivers/mfd/cs40l50-i2c.o
  CC [M]  drivers/ata/pata_sil680.o
  AR      lib/built-in.a
  CC [M]  net/netfilter/xt_REDIRECT.o
  CC [M]  drivers/mfd/cs40l50-spi.o
  CC [M]  drivers/ata/pata_piccolo.o
  CC [M]  drivers/mfd/tps6105x.o
  CC [M]  drivers/ata/pata_triflex.o
  CC [M]  drivers/ata/pata_via.o
  CC [M]  net/netfilter/xt_MASQUERADE.o
  CC [M]  net/netfilter/xt_SECMARK.o
  CC [M]  drivers/mfd/tps65010.o
  CC [M]  drivers/ata/pata_sl82c105.o
  CC [M]  drivers/mfd/tps6507x.o
  CC [M]  drivers/ata/pata_cmd640.o
  CC [M]  net/netfilter/xt_TPROXY.o
  CC [M]  drivers/ata/pata_mpiix.o
  CC [M]  drivers/mfd/tps65086.o
  CC [M]  drivers/mfd/tps6594-core.o
  CC [M]  net/netfilter/xt_TCPMSS.o
  LD [M]  drivers/acpi/video.o
  AR      drivers/acpi/built-in.a
  CC [M]  drivers/ata/pata_ns87410.o
  CC [M]  net/netfilter/xt_TCPOPTSTRIP.o
  CC [M]  drivers/mfd/tps6594-i2c.o
  CC [M]  net/netfilter/xt_TEE.o
  CC [M]  net/netfilter/xt_TRACE.o
  CC [M]  drivers/mfd/tps6594-spi.o
  CC [M]  drivers/ata/pata_opti.o
  CC [M]  drivers/ata/pata_rz1000.o
  CC [M]  net/netfilter/xt_IDLETIMER.o
  CC [M]  net/netfilter/xt_addrtype.o
  CC [M]  drivers/ata/pata_acpi.o
  CC [M]  drivers/mfd/mc13xxx-core.o
  CC [M]  drivers/ata/pata_legacy.o
  CC [M]  net/netfilter/xt_bpf.o
  CC [M]  drivers/mfd/mc13xxx-spi.o
  CC [M]  drivers/mfd/mc13xxx-i2c.o
  CC [M]  drivers/mfd/ocelot-core.o
  CC [M]  net/netfilter/xt_cluster.o
  CC [M]  drivers/mfd/ocelot-spi.o
  CC [M]  net/netfilter/xt_comment.o
  CC [M]  drivers/mfd/axp20x.o
  CC [M]  net/netfilter/xt_connbytes.o
  CC [M]  net/netfilter/xt_connlabel.o
  CC [M]  net/netfilter/xt_connlimit.o
  CC [M]  net/netfilter/xt_conntrack.o
  CC [M]  drivers/mfd/axp20x-i2c.o
  CC [M]  net/netfilter/xt_cpu.o
  CC [M]  net/netfilter/xt_dccp.o
  CC [M]  net/netfilter/xt_devgroup.o
  CC [M]  drivers/mfd/lp3943.o
  CC [M]  net/netfilter/xt_dscp.o
  CC [M]  drivers/mfd/ti-lmu.o
  CC [M]  net/netfilter/xt_ecn.o
  CC [M]  drivers/mfd/da9062-core.o
  CC [M]  drivers/mfd/da9150-core.o
  CC [M]  net/netfilter/xt_esp.o
  CC [M]  drivers/mfd/max77541.o
  CC [M]  drivers/mfd/max8907.o
  CC [M]  net/netfilter/xt_hashlimit.o
  CC [M]  drivers/mfd/mp2629.o
  CC [M]  drivers/mfd/mt6360-core.o
  CC [M]  net/netfilter/xt_helper.o
  CC [M]  drivers/mfd/mt6370.o
  CC [M]  drivers/mfd/mt6397-core.o
  CC [M]  net/netfilter/xt_hl.o
  CC [M]  drivers/mfd/mt6397-irq.o
  CC [M]  drivers/mfd/mt6358-irq.o
  AR      fs/built-in.a
  CC [M]  drivers/mfd/kempld-core.o
  CC [M]  net/netfilter/xt_ipcomp.o
  CC [M]  drivers/mfd/intel_quark_i2c_gpio.o
  AR      drivers/scsi/built-in.a
  CC [M]  net/netfilter/xt_iprange.o
  CC [M]  drivers/mfd/lpc_sch.o
  CC [M]  net/netfilter/xt_l2tp.o
  CC [M]  drivers/mfd/lpc_ich.o
  CC [M]  net/netfilter/xt_length.o
  CC [M]  drivers/mfd/rdc321x-southbridge.o
  CC [M]  net/netfilter/xt_limit.o
  CC [M]  net/netfilter/xt_mac.o
  CC [M]  drivers/mfd/janz-cmodio.o
  CC [M]  net/netfilter/xt_multiport.o
  CC [M]  net/netfilter/xt_nfacct.o
  CC [M]  net/netfilter/xt_osf.o
  CC [M]  net/netfilter/xt_owner.o
  CC [M]  drivers/mfd/vx855.o
  CC [M]  net/netfilter/xt_cgroup.o
  CC [M]  net/netfilter/xt_physdev.o
  CC [M]  net/netfilter/xt_pkttype.o
  CC [M]  drivers/mfd/wl1273-core.o
  CC [M]  net/netfilter/xt_policy.o
  CC [M]  drivers/mfd/si476x-cmd.o
  AR      drivers/ata/built-in.a
  CC [M]  drivers/mfd/si476x-prop.o
  CC [M]  net/netfilter/xt_quota.o
  CC [M]  drivers/mfd/si476x-i2c.o
  CC [M]  drivers/mfd/intel_pmc_bxt.o
  CC [M]  net/netfilter/xt_rateest.o
  CC [M]  drivers/mfd/viperboard.o
  CC [M]  net/netfilter/xt_realm.o
  CC [M]  drivers/mfd/lm3533-core.o
  CC [M]  drivers/mfd/lm3533-ctrlbank.o
  CC [M]  net/netfilter/xt_recent.o
  CC [M]  net/netfilter/xt_sctp.o
  CC [M]  drivers/mfd/retu-mfd.o
  CC [M]  drivers/mfd/iqs62x.o
  CC [M]  net/netfilter/xt_socket.o
  CC [M]  net/netfilter/xt_state.o
  CC [M]  drivers/mfd/menf21bmc.o
  CC [M]  net/netfilter/xt_statistic.o
  CC [M]  drivers/mfd/dln2.o
  CC [M]  net/netfilter/xt_string.o
  CC [M]  drivers/mfd/rt4831.o
  CC [M]  net/netfilter/xt_tcpmss.o
  CC [M]  drivers/mfd/rt5033.o
  CC [M]  net/netfilter/xt_time.o
  CC [M]  drivers/mfd/rt5120.o
  CC [M]  net/netfilter/xt_u32.o
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
  LD [M]  drivers/mfd/ocelot-soc.o
  LD [M]  drivers/mfd/mt6397.o
  AR      drivers/mfd/built-in.a
  LD [M]  net/netfilter/nf_conntrack.o
  LD [M]  net/netfilter/nf_conntrack_h323.o
  LD [M]  net/netfilter/nf_nat.o
  LD [M]  net/netfilter/nf_tables.o
  LD [M]  net/netfilter/nf_flow_table.o
  AR      net/netfilter/built-in.a
  LD [M]  drivers/mfd/si476x-core.o
  AR      net/built-in.a
make[3]: *** [../scripts/Makefile.build:461: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
  CC [M]  kernel/kheaders.o
make[2]: *** [/kernel/Makefile:2003: .] Error 2
make[1]: Leaving directory '/kernel/build64-debug'
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


