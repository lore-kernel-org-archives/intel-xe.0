Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EB2C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 06:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FCB10E1E7;
	Wed, 28 May 2025 06:50:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF55110E0B7;
 Wed, 28 May 2025 06:50:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EBuild=3A_failure_for_Panel_Replay_+_Adaptive_sync_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 06:50:40 -0000
Message-ID: <174841504090.26775.8536875274734627659@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250526120512.1702815-1-jouni.hogander@intel.com>
In-Reply-To: <20250526120512.1702815-1-jouni.hogander@intel.com>
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

Series: Panel Replay + Adaptive sync (rev2)
URL   : https://patchwork.freedesktop.org/series/149487/
State : failure

== Summary ==

CC      arch/x86/kernel/espfix_64.o
  CC [M]  net/sunrpc/clnt.o
  CC      drivers/virtio/virtio.o
  CC      kernel/bpf/bpf_local_storage.o
  CC [M]  net/llc/llc_pdu.o
  CC      arch/x86/kernel/ksysfs.o
  CC      drivers/pci/slot.o
  CC      fs/ntfs3/bitmap.o
  CC [M]  fs/nls/nls_iso8859-1.o
  CC [M]  net/netfilter/nf_conntrack_proto_dccp.o
  LD [M]  sound/x86/snd-hdmi-lpe-audio.o
  CC      fs/btrfs/extent-tree.o
  CC      drivers/acpi/osl.o
  CC [M]  drivers/gpio/gpio-tps65912.o
  CC [M]  net/llc/llc_sap.o
  CC [M]  net/llc/llc_s_ac.o
  CC      mm/process_vm_access.o
  LD [M]  drivers/dma/idxd/idxd_bus.o
  LD [M]  drivers/dma/idxd/idxd.o
  CC      drivers/acpi/acpica/exoparg6.o
  CC      kernel/trace/trace_events_hist.o
  CC [M]  drivers/leds/leds-pca955x.o
  CC      fs/tracefs/event_inode.o
  CC [M]  net/llc/llc_s_ev.o
  CC      fs/udf/ialloc.o
  CC      lib/maple_tree.o
  CC [M]  net/llc/llc_s_st.o
  CC [M]  sound/hda/hdac_bus.o
  CC      drivers/acpi/acpica/exprep.o
  CC [M]  drivers/clk/clk-cs2000-cp.o
  CC [M]  sound/soc/codecs/es8311.o
  LD [M]  sound/pci/snd-ad1889.o
  LD [M]  sound/pci/snd-als300.o
  LD [M]  sound/pci/snd-als4000.o
  LD [M]  sound/pci/snd-cs4281.o
  CC [M]  arch/x86/kvm/debugfs.o
  CC [M]  net/bridge/netfilter/nf_conntrack_bridge.o
  CC [M]  fs/nls/nls_iso8859-2.o
  CC [M]  drivers/clk/clk-lmk04832.o
  CC      fs/udf/inode.o
  CC [M]  drivers/dma/dw/core.o
  CC      net/ipv6/tcp_ipv6.o
  CC      drivers/pci/pci-acpi.o
  CC [M]  drivers/gpio/gpio-tps68470.o
  CC      arch/x86/kernel/bootflag.o
  CC [M]  crypto/streebog_generic.o
  CC [M]  drivers/dma/dw/dw.o
  CC      net/core/netclassid_cgroup.o
  CC      block/blk-crypto-sysfs.o
  CC [M]  net/llc/af_llc.o
  CC [M]  arch/x86/kvm/mmu/mmu.o
  CC      arch/x86/kernel/e820.o
  CC      drivers/acpi/acpica/exregion.o
  AR      fs/debugfs/built-in.a
  CC [M]  drivers/leds/leds-pca963x.o
  CC      arch/x86/kernel/pci-dma.o
  CC      mm/mseal.o
  CC      net/core/lwtunnel.o
  CC      drivers/virtio/virtio_ring.o
  CC      mm/page_alloc.o
  CC [M]  fs/nls/nls_iso8859-3.o
  CC [M]  net/sunrpc/auth_gss/gss_mech_switch.o
  CC      fs/btrfs/print-tree.o
  CC [M]  sound/hda/hdac_device.o
  CC [M]  net/netfilter/nf_conntrack_proto_sctp.o
  CC      kernel/bpf/bpf_task_storage.o
  CC      net/ipv4/tcp_minisocks.o
  CC [M]  net/bridge/br.o
  CC      fs/ntfs3/dir.o
  AR      fs/tracefs/built-in.a
  CC [M]  net/llc/llc_station.o
  CC [M]  fs/nls/nls_iso8859-4.o
  CC [M]  net/kcm/kcmsock.o
  CC [M]  drivers/gpio/gpio-tqmx86.o
  CC [M]  net/sunrpc/auth_gss/svcauth_gss.o
  CC      kernel/bpf/bpf_inode_storage.o
  CC      drivers/acpi/acpica/exresnte.o
  CC [M]  sound/soc/codecs/hda.o
  CC [M]  crypto/wp512.o
  CC      net/core/lwt_bpf.o
  CC [M]  net/bridge/br_device.o
  CC      block/blk-crypto-fallback.o
  CC [M]  drivers/clk/clk-max9485.o
  CC [M]  net/llc/llc_proc.o
  CC [M]  drivers/dma/dw/idma32.o
  CC [M]  fs/nls/nls_iso8859-5.o
  CC      drivers/acpi/acpica/exresolv.o
  CC      net/ipv6/ping.o
  CC [M]  drivers/leds/leds-pca995x.o
  CC      net/core/dst_cache.o
  CC [M]  net/netfilter/nf_conntrack_proto_gre.o
  CC [M]  net/bridge/netfilter/ebtables.o
  CC [M]  drivers/gpio/gpio-twl4030.o
  CC [M]  sound/soc/codecs/hda-dai.o
  CC      fs/ntfs3/fsntfs.o
  CC      drivers/pci/iomap.o
  CC [M]  drivers/dma/dw-edma/dw-edma-core.o
  CC [M]  drivers/dma/ioat/init.o
  CC [M]  drivers/dma/sf-pdma/sf-pdma.o
  CC [M]  drivers/dma/dw-edma/dw-edma-v0-core.o
  CC [M]  crypto/pcbc.o
  CC [M]  drivers/dma/ioat/dma.o
  CC      fs/udf/lowlevel.o
  CC      drivers/acpi/acpica/exresop.o
  CC [M]  sound/hda/hdac_sysfs.o
  CC [M]  crypto/lrw.o
  CC [M]  fs/nls/nls_iso8859-6.o
  CC [M]  sound/soc/amd/acp-config.o
  CC [M]  drivers/clk/clk-palmas.o
  CC      kernel/bpf/disasm.o
  CC [M]  net/netfilter/nf_conntrack_netlink.o
  CC [M]  drivers/dma/dw/acpi.o
  CC      block/holder.o
  CC [M]  net/bridge/br_fdb.o
  CC      arch/x86/kernel/quirks.o
  CC [M]  net/llc/sysctl_net_llc.o
  CC [M]  drivers/leds/leds-pwm.o
  CC      kernel/trace/trace_events_user.o
  CC [M]  drivers/gpio/gpio-twl6040.o
  CC      drivers/acpi/acpica/exserial.o
  CC      drivers/virtio/virtio_anchor.o
  CC      drivers/acpi/acpica/exstore.o
  CC [M]  drivers/gpio/gpio-viperboard.o
  CC      net/ipv6/exthdrs.o
  CC      fs/udf/namei.o
  CC [M]  fs/nls/nls_iso8859-7.o
  CC      drivers/acpi/acpica/exstoren.o
  CC [M]  net/kcm/kcmproc.o
  CC [M]  arch/x86/kvm/mmu/page_track.o
  CC [M]  crypto/xctr.o
  CC      drivers/acpi/acpica/exstorob.o
  CC [M]  sound/hda/hdac_regmap.o
  CC [M]  arch/x86/kvm/mmu/spte.o
  CC [M]  drivers/clk/clk-pwm.o
  CC      net/core/gro_cells.o
  CC [M]  sound/soc/codecs/hdmi-codec.o
  CC      drivers/pci/quirks.o
  CC      kernel/bpf/mprog.o
  CC [M]  drivers/leds/leds-regulator.o
  CC [M]  drivers/dma/ioat/prep.o
  CC      net/core/failover.o
  CC [M]  drivers/clk/clk-si5341.o
  CC [M]  drivers/gpio/gpio-virtuser.o
  CC      net/core/skmsg.o
  CC      drivers/pci/ats.o
  CC      net/ipv4/tcp_cong.o
  LD [M]  net/llc/llc.o
  CC      drivers/pci/iov.o
  LD [M]  net/llc/llc2.o
  CC      drivers/pci/pci-label.o
  CC      arch/x86/kernel/kdebugfs.o
  CC      fs/udf/partition.o
  CC      net/ipv4/tcp_metrics.o
  CC [M]  fs/nls/nls_cp1255.o
  CC      fs/ntfs3/frecord.o
  CC [M]  block/kyber-iosched.o
  CC      drivers/acpi/acpica/exsystem.o
  CC [M]  drivers/dma/dw-edma/dw-hdma-v0-core.o
  CC      arch/x86/kernel/alternative.o
  CC      arch/x86/kernel/i8253.o
  CC [M]  drivers/dma/dw/platform.o
  LD [M]  sound/soc/amd/snd-acp-config.o
  CC      arch/x86/kernel/hw_breakpoint.o
  CC      arch/x86/kernel/tsc.o
  CC [M]  net/sunrpc/auth_gss/gss_rpc_upcall.o
  CC [M]  crypto/hctr2.o
  CC      net/core/sock_map.o
  CC      mm/shuffle.o
  CC      kernel/trace/bpf_trace.o
  CC [M]  drivers/leds/leds-tca6507.o
  CC      drivers/dma/dmaengine.o
  CC      drivers/virtio/virtio_pci_modern_dev.o
  CC      drivers/acpi/acpica/extrace.o
  CC [M]  net/bridge/netfilter/ebtable_broute.o
  CC [M]  fs/nls/nls_iso8859-9.o
  CC [M]  drivers/dma/dw-edma/dw-edma-v0-debugfs.o
  CC [M]  sound/soc/codecs/pcm6240.o
  CC      fs/ntfs3/file.o
  CC      kernel/bpf/trampoline.o
  CC      fs/udf/super.o
  CC [M]  net/netfilter/nfnetlink_cttimeout.o
  CC [M]  sound/hda/hdac_controller.o
  LD [M]  net/kcm/kcm.o
  CC [M]  net/netfilter/nfnetlink_cthelper.o
  CC [M]  drivers/dma/dw/pci.o
  CC      drivers/acpi/utils.o
  CC [M]  drivers/dma/ioat/dca.o
  CC [M]  drivers/gpio/gpio-virtio.o
  CC [M]  drivers/clk/clk-si5351.o
  CC      fs/btrfs/root-tree.o
  CC      drivers/acpi/acpica/exutils.o
  CC [M]  sound/hda/hdac_stream.o
  CC [M]  net/sunrpc/auth_gss/gss_rpc_xdr.o
  CC [M]  crypto/adiantum.o
  CC [M]  net/bridge/br_forward.o
  CC [M]  fs/nls/nls_iso8859-13.o
  CC      drivers/pci/p2pdma.o
  CC [M]  drivers/dma/dw-edma/dw-hdma-v0-debugfs.o
  CC      fs/pstore/inode.o
  CC      fs/ntfs3/fslog.o
  CC      fs/pstore/platform.o
  CC      lib/memcat_p.o
  CC      mm/page_frag_cache.o
  CC [M]  drivers/leds/leds-ti-lmu-common.o
  CC      drivers/acpi/acpica/hwacpi.o
  CC      fs/pstore/pmsg.o
  LD [M]  drivers/dma/dw/dw_dmac_core.o
  LD [M]  drivers/dma/dw/dw_dmac.o
  CC [M]  block/bfq-iosched.o
  LD [M]  drivers/dma/dw/dw_dmac_pci.o
  CC [M]  net/l2tp/l2tp_core.o
  CC      fs/udf/truncate.o
  CC      fs/udf/symlink.o
  CC [M]  net/bridge/netfilter/ebtable_filter.o
  CC [M]  drivers/dma/ioat/sysfs.o
  CC [M]  drivers/clk/clk-si544.o
  CC      kernel/workqueue.o
  CC      kernel/trace/trace_kprobe.o
  CC [M]  fs/nls/nls_iso8859-14.o
  CC      drivers/acpi/acpica/hwesleep.o
  CC [M]  drivers/gpio/gpio-vx855.o
  CC      drivers/virtio/virtio_pci_legacy_dev.o
  CC [M]  crypto/nhpoly1305.o
  LD [M]  sound/soc/codecs/snd-soc-ac97.o
  LD [M]  sound/soc/codecs/snd-soc-ak4619.o
  CC [M]  net/bridge/br_if.o
  LD [M]  sound/soc/codecs/snd-soc-cs40l50.o
  LD [M]  sound/soc/codecs/snd-soc-cs530x.o
  CC      kernel/pid.o
  LD [M]  sound/soc/codecs/snd-soc-cs530x-i2c.o
  LD [M]  sound/soc/codecs/snd-soc-es8311.o
  LD [M]  sound/soc/codecs/snd-soc-hda-codec.o
  LD [M]  sound/soc/codecs/snd-soc-hdmi-codec.o
  LD [M]  sound/soc/codecs/snd-soc-pcm6240.o
  CC      net/ipv6/datagram.o
  CC [M]  sound/soc/dwc/dwc-i2s.o
  CC      lib/min_heap.o
  CC [M]  drivers/dma/dw-edma/dw-edma-pcie.o
  CC [M]  sound/hda/array.o
  CC      arch/x86/kernel/tsc_msr.o
  CC      fs/btrfs/dir-item.o
  CC      net/ipv4/tcp_fastopen.o
  CC [M]  net/sunrpc/auth_gss/trace.o
  CC [M]  sound/hda/hdmi_chmap.o
  CC      drivers/virtio/virtio_mmio.o
  CC      drivers/acpi/acpica/hwgpe.o
  CC      kernel/bpf/btf.o
  CC [M]  sound/hda/trace.o
  CC [M]  crypto/ccm.o
  CC [M]  net/dccp/ccid.o
  CC      drivers/virtio/virtio_pci_modern.o
  CC      net/core/bpf_sk_storage.o
  CC [M]  fs/nls/nls_iso8859-15.o
  CC [M]  net/netfilter/nf_conntrack_amanda.o
  CC      net/core/devmem.o
  CC      kernel/bpf/memalloc.o
  CC [M]  net/core/pktgen.o
  CC [M]  drivers/leds/leds-tlc591xx.o
  CC      kernel/bpf/rqspinlock.o
  LD [M]  drivers/dma/ioat/ioatdma.o
  CC      fs/udf/directory.o
  CC [M]  net/sunrpc/xprt.o
  CC      drivers/acpi/reboot.o
  CC [M]  drivers/gpio/gpio-wcove.o
  CC [M]  drivers/clk/clk-tps68470.o
  CC [M]  crypto/chacha20poly1305.o
  CC      lib/nmi_backtrace.o
  CC      mm/init-mm.o
  CC [M]  fs/pstore/ram.o
  CC [M]  net/bridge/netfilter/ebtable_nat.o
  CC      drivers/acpi/acpica/hwregs.o
  CC      arch/x86/kernel/io_delay.o
  CC      drivers/pci/vgaarb.o
  CC [M]  fs/nls/nls_koi8-r.o
  CC [M]  drivers/clk/clk-twl6040.o
  CC      kernel/trace/error_report-traces.o
  CC      net/ipv6/ip6_flowlabel.o
  CC [M]  sound/soc/dwc/dwc-pcm.o
  LD [M]  drivers/dma/dw-edma/dw-edma.o
  CC      drivers/dma/virt-dma.o
  CC      arch/x86/kernel/rtc.o
  CC [M]  drivers/leds/leds-tps6105x.o
  CC [M]  fs/pstore/ram_core.o
  CC      arch/x86/kernel/resource.o
  CC      drivers/xen/events/events_base.o
  CC      drivers/regulator/core.o
  CC [M]  drivers/gpio/gpio-winbond.o
  CC      fs/btrfs/file-item.o
  AS      arch/x86/kernel/irqflags.o
  CC      drivers/acpi/acpica/hwsleep.o
  CC      arch/x86/kernel/static_call.o
  CC      mm/memblock.o
  CC      lib/objpool.o
  CC      fs/udf/misc.o
  CC      drivers/regulator/dummy.o
  CC [M]  fs/nls/nls_koi8-u.o
  CC      net/ipv4/tcp_rate.o
  CC [M]  net/dccp/feat.o
  CC      fs/btrfs/inode-item.o
  CC [M]  crypto/aegis128-core.o
  CC [M]  sound/hda/hdac_component.o
  CC      lib/plist.o
  CC      fs/udf/udftime.o
  CC [M]  drivers/clk/clk-twl.o
  CC [M]  sound/hda/hdac_i915.o
  CC      drivers/xen/xenbus/xenbus_client.o
  CC      drivers/virtio/virtio_pci_common.o
  CC [M]  net/bridge/netfilter/ebt_802_3.o
  CC      fs/udf/unicode.o
  CC [M]  net/dccp/input.o
  CC      drivers/acpi/acpica/hwvalid.o
  LD [M]  sound/soc/dwc/designware_i2s.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-byt-match.o
  CC      drivers/dma/acpi-dma.o
  CC      drivers/acpi/acpica/hwxface.o
  CC [M]  drivers/leds/leds-wm831x-status.o
  CC [M]  drivers/gpio/gpio-wm831x.o
  CC [M]  net/dccp/minisocks.o
  CC [M]  fs/nls/nls_koi8-ru.o
  CC [M]  net/netfilter/nf_conntrack_ftp.o
  CC      fs/ntfs3/inode.o
  CC [M]  fs/pstore/zone.o
  CC [M]  arch/x86/kvm/mmu/tdp_iter.o
  CC      lib/radix-tree.o
  AR      sound/built-in.a
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cht-match.o
  CC [M]  sound/hda/intel-dsp-config.o
  CC [M]  arch/x86/kvm/mmu/tdp_mmu.o
  CC [M]  crypto/pcrypt.o
  CC [M]  net/dccp/options.o
  CC [M]  drivers/clk/clk-wm831x.o
  CC [M]  net/dccp/output.o
  CC      arch/x86/kernel/process.o
  CC      kernel/trace/power-traces.o
  CC      lib/ratelimit.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_mech.o
  CC      fs/ntfs3/index.o
  CC      drivers/pci/doe.o
  CC [M]  block/bfq-wf2q.o
  CC [M]  arch/x86/kvm/hyperv.o
  AR      fs/udf/built-in.a
  CC [M]  drivers/leds/leds-wm8350.o
  CC [M]  fs/nls/nls_utf8.o
  CC      fs/btrfs/disk-io.o
  CC [M]  drivers/gpio/gpio-wm8350.o
  CC [M]  net/bridge/netfilter/ebt_among.o
  CC [M]  drivers/dma/altera-msgdma.o
  CC      drivers/virtio/virtio_pci_legacy.o
  CC      drivers/xen/xenbus/xenbus_comms.o
  CC      drivers/acpi/acpica/hwxfsleep.o
  CC      fs/efivarfs/inode.o
  CC      net/ipv6/inet6_connection_sock.o
  CC [M]  net/l2tp/l2tp_ip.o
  CC      fs/efivarfs/file.o
  CC [M]  crypto/cryptd.o
  CC [M]  fs/nls/mac-celtic.o
  CC [M]  arch/x86/kvm/xen.o
  CC      fs/efivarfs/super.o
  AR      drivers/clk/built-in.a
  CC [M]  net/sunrpc/auth_gss/gss_krb5_seal.o
  AR      net/core/built-in.a
  CC [M]  net/dccp/proto.o
  CC [M]  fs/nls/mac-centeuro.o
  CC [M]  drivers/leds/leds-dac124s085.o
  CC [M]  sound/hda/intel-nhlt.o
  CC [M]  drivers/pci/pci-stub.o
  CC      mm/memory_hotplug.o
  AR      drivers/reset/amlogic/built-in.a
  AR      drivers/reset/hisilicon/built-in.a
  AR      drivers/reset/starfive/built-in.a
  CC [M]  sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.o
  AR      drivers/reset/sti/built-in.a
  AR      drivers/reset/tegra/built-in.a
  CC      drivers/reset/core.o
  CC      drivers/regulator/fixed-helper.o
  CC [M]  block/bfq-cgroup.o
  CC      drivers/virtio/virtio_pci_admin_legacy_io.o
  CC [M]  drivers/gpio/gpio-wm8994.o
  CC      net/ipv4/tcp_recovery.o
  CC      kernel/trace/rpm-traces.o
  CC      drivers/xen/events/events_2l.o
  CC      drivers/acpi/acpica/hwpci.o
  CC [M]  arch/x86/kvm/smm.o
  CC      fs/btrfs/transaction.o
  CC      lib/rbtree.o
  CC      kernel/bpf/arena.o
  CC [M]  drivers/dma/idma64.o
  CC [M]  fs/pstore/blk.o
  CC      drivers/xen/xenbus/xenbus_xs.o
  CC      net/ipv4/tcp_ulp.o
  CC [M]  fs/nls/mac-croatian.o
  CC      drivers/regulator/helpers.o
  CC [M]  net/bridge/netfilter/ebt_arp.o
  CC [M]  net/l2tp/l2tp_netlink.o
  CC [M]  drivers/leds/leds-spi-byte.o
  AR      drivers/xen/xen-pciback/built-in.a
  CC [M]  drivers/xen/xen-pciback/pci_stub.o
  CC      drivers/acpi/acpica/nsaccess.o
  CC [M]  drivers/pci/pci-pf-stub.o
  CC [M]  drivers/xen/xenfs/super.o
  CC      kernel/trace/trace_kdb.o
  CC      fs/ntfs3/lznt.o
  CC      fs/efivarfs/vars.o
  CC      drivers/acpi/nvs.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_unseal.o
  CC      lib/seq_buf.o
  CC [M]  drivers/gpio/gpio-ws16c48.o
  CC      drivers/virtio/virtio_balloon.o
  CC      arch/x86/kernel/ptrace.o
  CC [M]  net/netfilter/nf_conntrack_h323_main.o
  CC [M]  crypto/des_generic.o
  CC [M]  fs/nls/mac-cyrillic.o
  CC [M]  drivers/xen/xen-pciback/pciback_ops.o
  CC      drivers/xen/events/events_fifo.o
  CC [M]  sound/hda/intel-sdw-acpi.o
  CC [M]  sound/sound_core.o
  CC [M]  fs/nls/mac-gaelic.o
  AR      block/built-in.a
  LD [M]  block/bfq.o
  CC      fs/ntfs3/namei.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-skl-match.o
  CC      drivers/acpi/acpica/nsalloc.o
  CC [M]  drivers/dma/plx_dma.o
  CC [M]  drivers/pci/xen-pcifront.o
  CC [M]  drivers/leds/uleds.o
  CC      drivers/regulator/devres.o
  CC [M]  arch/x86/kvm/kvm_onhyperv.o
  CC      fs/ntfs3/record.o
  CC      net/ipv6/udp_offload.o
  CC      lib/siphash.o
  CC [M]  drivers/xen/xenfs/xenstored.o
  LD [M]  fs/pstore/ramoops.o
  CC [M]  drivers/gpio/gpio-xra1403.o
  LD [M]  fs/pstore/pstore_zone.o
  LD [M]  fs/pstore/pstore_blk.o
  CC      drivers/reset/reset-simple.o
  AR      fs/pstore/built-in.a
  CC      fs/ntfs3/run.o
  CC      kernel/trace/trace_dynevent.o
  CC [M]  net/bridge/netfilter/ebt_ip.o
  CC [M]  sound/soc/intel/atom/sst/sst.o
  CC      mm/slub.o
  CC      drivers/acpi/acpica/nsarguments.o
  AR      fs/efivarfs/built-in.a
  CC [M]  crypto/fcrypt.o
  CC      fs/ntfs3/super.o
  CC      drivers/regulator/irq_helpers.o
  LD [M]  sound/hda/snd-hda-core.o
  CC      kernel/bpf/range_tree.o
  CC [M]  fs/nls/mac-greek.o
  CC      drivers/xen/xenbus/xenbus_probe.o
  CC      mm/madvise.o
  CC [M]  fs/netfs/buffered_read.o
  LD [M]  sound/hda/snd-intel-dspcfg.o
  CC      net/ipv4/tcp_offload.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_wrap.o
  CC      kernel/bpf/dispatcher.o
  CC [M]  net/l2tp/l2tp_eth.o
  CC [M]  net/l2tp/l2tp_debugfs.o
  CC      mm/page_io.o
  CC [M]  drivers/xen/xen-pciback/xenbus.o
  AR      drivers/xen/events/built-in.a
  CC      kernel/task_work.o
  CC [M]  drivers/virtio/virtio_input.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_crypto.o
  CC [M]  sound/soc/intel/atom/sst/sst_ipc.o
  CC      drivers/tty/vt/vt_ioctl.o
  CC      arch/x86/kernel/tls.o
  CC      drivers/acpi/acpica/nsconvert.o
  CC      drivers/xen/xenbus/xenbus_probe_backend.o
  AR      drivers/dma/built-in.a
  CC      kernel/bpf/devmap.o
  CC [M]  drivers/xen/xenfs/xensyms.o
  LD [M]  sound/hda/snd-intel-sdw-acpi.o
  CC      lib/string.o
  CC [M]  drivers/reset/reset-gpio.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-kbl-match.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_keys.o
  CC      fs/btrfs/inode.o
  CC [M]  fs/nls/mac-iceland.o
  AR      drivers/leds/built-in.a
  CC [M]  net/sunrpc/socklib.o
  CC [M]  net/l2tp/l2tp_ip6.o
  CC [M]  crypto/blowfish_generic.o
  CC [M]  net/dccp/timer.o
  CC [M]  net/bridge/netfilter/ebt_ip6.o
  AR      drivers/pci/built-in.a
  CC      kernel/extable.o
  CC      lib/timerqueue.o
  CC [M]  drivers/virtio/virtio_vdpa.o
  CC [M]  net/bridge/netfilter/ebt_limit.o
  CC [M]  net/sctp/sm_statetable.o
  CC      net/ipv6/seg6.o
  CC      kernel/bpf/cpumap.o
  CC [M]  drivers/virtio/virtio_mem.o
  CC      drivers/acpi/acpica/nsdump.o
  CC [M]  net/sctp/sm_statefuns.o
  AR      drivers/gpio/built-in.a
  CC [M]  drivers/virtio/virtio_dma_buf.o
  CC      fs/btrfs/file.o
  CC      arch/x86/kernel/step.o
  CC [M]  drivers/reset/reset-ti-syscon.o
  CC [M]  fs/nls/mac-inuit.o
  CC [M]  net/bridge/br_input.o
  CC [M]  arch/x86/kvm/vmx/vmx.o
  LD [M]  drivers/xen/xenfs/xenfs.o
  CC      net/ipv4/tcp_plb.o
  CC [M]  net/dccp/qpolicy.o
  CC      drivers/regulator/event.o
  CC      lib/union_find.o
  CC [M]  drivers/xen/xen-pciback/conf_space.o
  CC      drivers/tty/vt/vc_screen.o
  CC      drivers/acpi/acpica/nseval.o
  CC      kernel/trace/trace_probe.o
  CC [M]  sound/soc/intel/atom/sst/sst_stream.o
  CC [M]  fs/nls/mac-romanian.o
  CC      fs/ntfs3/upcase.o
  CC      lib/vsprintf.o
  CC [M]  crypto/blowfish_common.o
  CC      kernel/bpf/offload.o
  CC      drivers/tty/vt/selection.o
  CC [M]  net/sctp/sm_sideeffect.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-bxt-match.o
  CC      drivers/xen/xenbus/xenbus_dev_frontend.o
  CC      fs/btrfs/defrag.o
  CC [M]  sound/soc/intel/atom/sst/sst_drv_interface.o
  CC [M]  drivers/reset/reset-tps380x.o
  CC [M]  sound/soc/intel/atom/sst/sst_loader.o
  CC [M]  fs/netfs/buffered_write.o
  CC [M]  fs/nls/mac-roman.o
  CC      drivers/acpi/acpica/nsinit.o
  CC      arch/x86/kernel/tboot.o
  CC [M]  sound/soc/intel/atom/sst/sst_pvt.o
  CC [M]  net/bridge/netfilter/ebt_mark_m.o
  CC      net/ipv4/datagram.o
  CC [M]  net/rds/af_rds.o
  CC [M]  net/psample/psample.o
  CC [M]  net/9p/mod.o
  CC [M]  net/vmw_vsock/af_vsock.o
  CC [M]  net/netfilter/nf_conntrack_h323_asn1.o
  CC      fs/ntfs3/xattr.o
  CC [M]  net/rds/bind.o
  CC [M]  net/rds/cong.o
  CC      net/ipv6/fib6_notifier.o
  CC [M]  drivers/regulator/fixed.o
  CC      net/ipv4/raw.o
  CC      lib/win_minmax.o
  CC [M]  net/rds/connection.o
  CC [M]  drivers/xen/xen-pciback/conf_space_header.o
  CC      net/ipv4/udp.o
  CC      drivers/acpi/acpica/nsload.o
  AR      drivers/reset/built-in.a
  CC      kernel/params.o
  CC [M]  fs/nls/mac-turkish.o
  CC [M]  fs/netfs/direct_read.o
  LD [M]  net/sunrpc/auth_gss/auth_rpcgss.o
  LD [M]  net/sunrpc/auth_gss/rpcsec_gss_krb5.o
  CC [M]  net/sunrpc/xprtsock.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-glk-match.o
  CC [M]  net/netfilter/nf_conntrack_irc.o
  CC [M]  fs/nfs/filelayout/filelayout.o
  CC [M]  fs/nfs/flexfilelayout/flexfilelayout.o
  CC [M]  crypto/twofish_generic.o
  CC [M]  fs/nfs/blocklayout/blocklayout.o
  CC [M]  fs/nfs/blocklayout/dev.o
  CC      fs/ntfs3/lib/decompress_common.o
  CC [M]  net/dccp/ccids/ccid2.o
  AR      drivers/virtio/built-in.a
  CC      drivers/tty/vt/keyboard.o
  CC      arch/x86/kernel/i8237.o
  CC      drivers/acpi/acpica/nsnames.o
  CC [M]  fs/nfs/filelayout/filelayoutdev.o
  CC      kernel/trace/trace_uprobe.o
  CC [M]  net/bridge/netfilter/ebt_pkttype.o
  CC      drivers/xen/xenbus/xenbus_dev_backend.o
  CC [M]  net/9p/client.o
  CC [M]  drivers/regulator/virtual.o
  CC [M]  fs/nls/nls_ucs2_utils.o
  CC      kernel/bpf/net_namespace.o
  CC [M]  fs/nfs/flexfilelayout/flexfilelayoutdev.o
  CC      drivers/xen/cpu_hotplug.o
  CC      fs/ntfs3/lib/lzx_decompress.o
  CC [M]  drivers/xen/xen-pciback/conf_space_capability.o
  CC      kernel/bpf/tcx.o
  CC      net/ipv6/rpl.o
  CC      kernel/bpf/stackmap.o
  CC      arch/x86/kernel/stacktrace.o
  CC [M]  sound/soc/intel/atom/sst/sst_pci.o
  CC      kernel/bpf/cgroup_iter.o
  CC      drivers/acpi/wakeup.o
  CC [M]  crypto/twofish_common.o
  CC      kernel/trace/trace_boot.o
  CC      drivers/acpi/acpica/nsobject.o
  CC [M]  drivers/regulator/userspace-consumer.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cnl-match.o
  CC      kernel/kthread.o
  CC      fs/btrfs/extent_map.o
  CC      drivers/xen/xenbus/xenbus_probe_frontend.o
  CC [M]  fs/netfs/direct_write.o
  CC [M]  sound/ac97_bus.o
  CC      mm/swap_state.o
  CC      fs/ntfs3/lib/xpress_decompress.o
  CC      net/ipv6/ioam6.o
  CC [M]  net/bridge/netfilter/ebt_stp.o
  CC      drivers/acpi/acpica/nsparse.o
  CC [M]  fs/lockd/clntlock.o
  CC      arch/x86/kernel/reboot.o
  CC [M]  drivers/xen/xen-pciback/conf_space_quirks.o
  CC [M]  net/sctp/protocol.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cfl-match.o
  CC [M]  net/dccp/ackvec.o
  CC [M]  sound/soc/intel/atom/sst/sst_acpi.o
  CC [M]  net/bridge/netfilter/ebt_vlan.o
  CC [M]  fs/nfs/blocklayout/extent_tree.o
  AR      fs/nls/built-in.a
  CC      drivers/tty/vt/vt.o
  CC [M]  drivers/regulator/88pg86x.o
  COPY    drivers/tty/vt/defkeymap.c
  CC [M]  fs/nfs/blocklayout/rpc_pipefs.o
  CC      kernel/sys_ni.o
  CC [M]  net/netfilter/nf_conntrack_broadcast.o
  LD [M]  fs/nfs/filelayout/nfs_layout_nfsv41_files.o
  CC [M]  drivers/regulator/88pm800-regulator.o
  CC [M]  fs/smb/common/cifs_arc4.o
  CC [M]  fs/smb/client/trace.o
  CC [M]  fs/nfs/client.o
  AR      fs/ntfs3/built-in.a
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-core.o
  CC [M]  net/sunrpc/sched.o
  CC      drivers/acpi/acpica/nspredef.o
  CC [M]  fs/smb/client/cifsfs.o
  CC [M]  net/vmw_vsock/af_vsock_tap.o
  CC [M]  fs/netfs/iterator.o
  CC      drivers/acpi/acpica/nsprepkg.o
  CC [M]  net/rds/info.o
  CC [M]  sound/soc/intel/atom/sst-mfld-platform-pcm.o
  CC [M]  fs/romfs/storage.o
  CC      kernel/bpf/bpf_cgrp_storage.o
  CC      fs/btrfs/sysfs.o
  CC [M]  fs/smb/client/cifs_debug.o
  CC      lib/xarray.o
  CC      kernel/trace/fprobe.o
  CC [M]  drivers/xen/xen-pciback/vpci.o
  CC [M]  net/dccp/sysctl.o
  CC [M]  net/netfilter/nf_conntrack_netbios_ns.o
  LD [M]  fs/nfs/flexfilelayout/nfs_layout_flexfiles.o
  CC      kernel/trace/rethook.o
  CC [M]  fs/romfs/super.o
  CC [M]  crypto/serpent_generic.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-pci.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-acpi.o
  CC      lib/lockref.o
  CC [M]  net/9p/error.o
  CC      drivers/acpi/acpica/nsrepair.o
  CC      net/devres.o
  CC [M]  drivers/regulator/88pm8607.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cml-match.o
  CC      fs/btrfs/accessors.o
  CC      net/ipv4/udplite.o
  AR      drivers/xen/xenbus/built-in.a
  CC      drivers/xen/grant-table.o
  CC      drivers/xen/features.o
  CC      mm/swapfile.o
  CC [M]  net/bridge/netfilter/ebt_arpreply.o
  CC      kernel/nsproxy.o
  CC [M]  fs/smb/common/cifs_md4.o
  CC [M]  fs/smb/client/connect.o
  CC      arch/x86/kernel/early-quirks.o
  CC      net/socket.o
  CC      net/ipv4/udp_offload.o
  CC      net/ipv4/arp.o
  LD [M]  fs/nfs/blocklayout/blocklayoutdriver.o
  CC      lib/bcd.o
  CC      net/compat.o
  CC      drivers/acpi/acpica/nsrepair2.o
  CC      net/sysctl_net.o
  CC [M]  drivers/xen/xen-pciback/passthrough.o
  CC [M]  net/bridge/netfilter/ebt_mark.o
  CC      mm/zswap.o
  CC      kernel/bpf/cgroup.o
  CC [M]  fs/lockd/clntproc.o
  CC      net/ipv6/sysctl_net_ipv6.o
  CC [M]  net/sctp/endpointola.o
  CC [M]  drivers/regulator/aat2870-regulator.o
  CC [M]  sound/soc/intel/atom/sst-mfld-platform-compress.o
  LD [M]  fs/romfs/romfs.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-icl-match.o
  CC [M]  fs/netfs/locking.o
  CC      kernel/trace/trace_fprobe.o
  CC [M]  net/9p/protocol.o
  CC [M]  fs/netfs/main.o
  CC [M]  net/vmw_vsock/vsock_addr.o
  CC [M]  net/dccp/ipv4.o
  CC [M]  net/netfilter/nf_conntrack_snmp.o
  CC      drivers/acpi/acpica/nssearch.o
  CC [M]  net/sctp/associola.o
  CC [M]  fs/netfs/misc.o
  CC [M]  fs/netfs/objects.o
  CC      fs/btrfs/xattr.o
  CC [M]  net/sctp/transport.o
  CC      drivers/char/hw_random/core.o
  CC [M]  crypto/sm4.o
  CC      drivers/acpi/sleep.o
  CC [M]  net/rds/message.o
  CC [M]  crypto/sm4_generic.o
  CC [M]  net/sctp/chunk.o
  LD [M]  drivers/xen/xen-pciback/xen-pciback.o
  CC      drivers/acpi/device_sysfs.o
  CC [M]  fs/nfs/dir.o
  CC      drivers/acpi/device_pm.o
  CC [M]  sound/soc/intel/atom/sst-atom-controls.o
  CC [M]  net/bridge/netfilter/ebt_dnat.o
  CC      lib/sort.o
  CC [M]  drivers/regulator/act8865-regulator.o
  CC      drivers/acpi/acpica/nsutils.o
  CC [M]  net/netfilter/nf_conntrack_pptp.o
  CC      drivers/tty/hvc/hvc_console.o
  CC      net/ipv6/ip6mr.o
  CC [M]  net/bridge/br_ioctl.o
  CC      arch/x86/kernel/smp.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-tgl-match.o
  CC      drivers/iommu/amd/iommu.o
  CC      drivers/iommu/intel/dmar.o
  CC      drivers/xen/balloon.o
  AR      drivers/iommu/arm/arm-smmu/built-in.a
  AR      drivers/iommu/arm/arm-smmu-v3/built-in.a
  AR      drivers/iommu/arm/built-in.a
  CC [M]  net/9p/trans_common.o
  CC      drivers/tty/vt/consolemap.o
  CC      drivers/iommu/amd/init.o
  CC      lib/parser.o
  CC      drivers/iommu/amd/quirks.o
  CC      drivers/acpi/acpica/nswalk.o
  CC      arch/x86/kernel/smpboot.o
  CC      arch/x86/kernel/tsc_sync.o
  CC [M]  crypto/aes_ti.o
  CC      net/ipv4/icmp.o
  CC [M]  drivers/regulator/ad5398.o
  AR      kernel/trace/built-in.a
  CC      drivers/acpi/proc.o
  CC      arch/x86/kernel/setup_percpu.o
  CC      fs/btrfs/ordered-data.o
  CC [M]  drivers/char/hw_random/timeriomem-rng.o
  CC [M]  net/netfilter/nf_conntrack_sane.o
  CC [M]  net/vmw_vsock/vsock_bpf.o
  CC      net/ipv4/devinet.o
  LD [M]  sound/soc/intel/atom/snd-soc-sst-atom-hifi2-platform.o
  CC [M]  net/netfilter/nf_conntrack_sip.o
  CC      net/ipv6/xfrm6_policy.o
  CC      drivers/acpi/acpica/nsxfeval.o
  CC [M]  fs/smb/client/dir.o
  CC      net/ipv4/af_inet.o
  CC [M]  net/sctp/sm_make_chunk.o
  CC [M]  fs/lockd/clntxdr.o
  CC [M]  net/bridge/netfilter/ebt_redirect.o
  CC [M]  drivers/regulator/arizona-ldo1.o
  CC      lib/debug_locks.o
  CC      arch/x86/kvm/kvm-asm-offsets.s
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ehl-match.o
  CC [M]  net/bridge/br_stp.o
  CC [M]  crypto/camellia_generic.o
  CC      drivers/tty/hvc/hvc_irq.o
  CC      arch/x86/kernel/mpparse.o
  CC      drivers/iommu/iommufd/iova_bitmap.o
  CC [M]  net/9p/trans_fd.o
  CC      kernel/bpf/reuseport_array.o
  CC      mm/dmapool.o
  HOSTCC  drivers/tty/vt/conmakehash
  CC [M]  drivers/char/hw_random/intel-rng.o
  CC [M]  fs/netfs/read_collect.o
  CC      kernel/bpf/bpf_struct_ops.o
  CC [M]  net/rds/recv.o
  CC      mm/hugetlb.o
  CC      net/ipv4/igmp.o
  CC      lib/random32.o
  CC      drivers/xen/manage.o
  CC [M]  net/dccp/ipv6.o
  CC      drivers/tty/vt/defkeymap.o
  CC      drivers/acpi/acpica/nsxfname.o
  CC      drivers/xen/time.o
  CC      drivers/tty/hvc/hvc_xen.o
  CC [M]  drivers/regulator/arizona-micsupp.o
  CC      net/ipv4/fib_frontend.o
  CC      arch/x86/kernel/ftrace.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-jsl-match.o
  CC [M]  drivers/regulator/as3711-regulator.o
  CC      kernel/bpf/cpumask.o
  CONMK   drivers/tty/vt/consolemap_deftbl.c
  AR      drivers/gpu/host1x/built-in.a
  CC      drivers/tty/vt/consolemap_deftbl.o
  CC [M]  fs/lockd/host.o
  AR      drivers/tty/vt/built-in.a
  CC      drivers/connector/cn_queue.o
  CC      drivers/connector/connector.o
  CC      fs/btrfs/extent_io.o
  CC [M]  arch/x86/kvm/vmx/pmu_intel.o
  CC [M]  net/vmw_vsock/diag.o
  CC [M]  drivers/char/hw_random/amd-rng.o
  AR      drivers/gpu/drm/tests/built-in.a
  CC [M]  net/bridge/netfilter/ebt_snat.o
  CC [M]  drivers/gpu/drm/tests/drm_kunit_helpers.o
  CC      drivers/acpi/acpica/nsxfobj.o
  CC [M]  drivers/gpu/drm/tests/drm_atomic_test.o
  CC      drivers/iommu/iommufd/driver.o
  CC [M]  fs/nfs/file.o
  CC      lib/bust_spinlocks.o
  CC [M]  crypto/cast_common.o
  CC [M]  net/vmw_vsock/vmci_transport.o
  CC      kernel/notifier.o
  CC [M]  fs/netfs/read_pgpriv2.o
  AR      drivers/iommu/riscv/built-in.a
  CC      drivers/connector/cn_proc.o
  CC      drivers/iommu/intel/iommu.o
  CC      net/ipv6/xfrm6_state.o
  CC [M]  net/9p/trans_xen.o
  CC      drivers/acpi/bus.o
  CC [M]  net/vmw_vsock/vmci_transport_notify.o
  CC [M]  drivers/regulator/atc260x-regulator.o
  CC [M]  fs/smb/client/file.o
  CC [M]  fs/autofs/init.o
  AS      arch/x86/kernel/ftrace_64.o
  AR      drivers/tty/hvc/built-in.a
  CC [M]  drivers/char/hw_random/ba431-rng.o
  CC      kernel/bpf/bpf_lsm.o
  CC      drivers/tty/serial/8250/8250_core.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-adl-match.o
  CC      drivers/xen/mem-reservation.o
  CC      drivers/acpi/acpica/psargs.o
  CC [M]  drivers/gpu/drm/tests/drm_atomic_state_test.o
  CC      lib/kasprintf.o
  CC [M]  net/sctp/ulpevent.o
  CC [M]  fs/autofs/inode.o
  CC [M]  net/vmw_vsock/vmci_transport_notify_qstate.o
  CC      drivers/iommu/amd/io_pgtable.o
  CC      drivers/tty/serial/8250/8250_platform.o
  CC [M]  net/bridge/netfilter/ebt_log.o
  AR      drivers/gpu/drm/arm/built-in.a
  CC [M]  net/dccp/diag.o
  CC [M]  fs/lockd/svc.o
  CC      arch/x86/kernel/trace_clock.o
  CC      kernel/bpf/crypto.o
  CC [M]  crypto/cast5_generic.o
  CC      drivers/acpi/glue.o
  CC      drivers/acpi/scan.o
  CC [M]  drivers/iommu/iommufd/device.o
  CC [M]  fs/netfs/read_retry.o
  CC [M]  arch/x86/kvm/vmx/vmcs12.o
  CC [M]  drivers/regulator/aw37503-regulator.o
  CC [M]  drivers/char/hw_random/via-rng.o
  CC      fs/btrfs/volumes.o
  CC [M]  net/netfilter/nf_conntrack_tftp.o
  CC      fs/btrfs/async-thread.o
  CC      drivers/acpi/acpica/psloop.o
  CC [M]  net/9p/trans_virtio.o
  CC      arch/x86/kernel/trace.o
  LD [M]  net/dccp/dccp.o
  CC      net/ipv6/xfrm6_input.o
  CC [M]  net/rds/send.o
  CC      drivers/acpi/acpica/psobject.o
  CC      drivers/gpu/vga/vga_switcheroo.o
  CC      mm/hugetlb_vmemmap.o
  CC      lib/bitmap.o
  AR      drivers/connector/built-in.a
  CC [M]  sound/soc/intel/common/soc-acpi-intel-rpl-match.o
  CC      lib/scatterlist.o
  CC [M]  drivers/gpu/drm/tests/drm_bridge_test.o
  CC [M]  net/rds/stats.o
  CC [M]  drivers/tty/serial/jsm/jsm_driver.o
  CC [M]  drivers/regulator/axp20x-regulator.o
  CC [M]  fs/autofs/root.o
  CC      drivers/tty/serial/8250/8250_pnp.o
  CC [M]  net/sunrpc/auth.o
  CC [M]  drivers/char/hw_random/virtio-rng.o
  CC      drivers/acpi/acpica/psopcode.o
  CC      drivers/iommu/amd/io_pgtable_v2.o
  CC      drivers/xen/pci.o
  CC [M]  net/vmw_vsock/virtio_transport.o
  CC      drivers/tty/serdev/core.o
  CC      drivers/tty/serial/serial_core.o
  CC      mm/mempolicy.o
  CC      arch/x86/kernel/rethook.o
  CC [M]  net/bridge/netfilter/ebt_nflog.o
  CC [M]  arch/x86/kvm/vmx/nested.o
  CC [M]  fs/fuse/dev.o
  CC [M]  net/sctp/inqueue.o
  CC [M]  net/rds/sysctl.o
  CC [M]  fs/netfs/read_single.o
  CC [M]  crypto/cast6_generic.o
  CC [M]  fs/overlayfs/super.o
  LD [M]  net/dccp/dccp_ipv4.o
  LD [M]  net/dccp/dccp_ipv6.o
  LD [M]  net/dccp/dccp_diag.o
  CC      arch/x86/kernel/vmcore_info_64.o
  CC [M]  drivers/iommu/iommufd/eventq.o
  CC [M]  drivers/tty/serial/jsm/jsm_neo.o
  CC      drivers/acpi/acpica/psopinfo.o
  CC [M]  net/netfilter/nf_log_syslog.o
  CC [M]  drivers/gpu/drm/tests/drm_buddy_test.o
  CC [M]  drivers/regulator/bcm590xx-regulator.o
  CC      drivers/tty/serial/8250/8250_rsa.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-mtl-match.o
  CC [M]  fs/nfs/getroot.o
  LD [M]  net/9p/9pnet.o
  CC      mm/sparse.o
  CC [M]  drivers/char/hw_random/xiphera-trng.o
  LD [M]  net/9p/9pnet_fd.o
  LD [M]  net/9p/9pnet_xen.o
  LD [M]  net/9p/9pnet_virtio.o
  CC      net/ipv4/fib_semantics.o
  CC      kernel/bpf/relo_core.o
  CC      drivers/base/power/sysfs.o
  CC      kernel/bpf/btf_iter.o
  CC      net/ipv4/fib_trie.o
  CC [M]  drivers/block/xen-blkback/blkback.o
  CC [M]  fs/autofs/symlink.o
  CC [M]  drivers/block/drbd/drbd_buildtag.o
  CC      drivers/acpi/acpica/psparse.o
  CC      drivers/iommu/amd/ppr.o
  CC      arch/x86/kernel/machine_kexec_64.o
  CC [M]  fs/lockd/svclock.o
  CC [M]  crypto/aria_generic.o
  CC [M]  net/rds/threads.o
  AR      drivers/gpu/vga/built-in.a
  CC [M]  crypto/chacha_generic.o
  CC [M]  fs/netfs/rolling_buffer.o
  CC      lib/list_sort.o
  CC [M]  net/bridge/br_stp_bpdu.o
  CC      drivers/tty/serdev/serdev-ttyport.o
  CC      lib/uuid.o
  CC [M]  net/vmw_vsock/virtio_transport_common.o
  CC      drivers/tty/serial/8250/8250_port.o
  AR      drivers/char/hw_random/built-in.a
  CC [M]  sound/soc/intel/common/soc-acpi-intel-arl-match.o
  CC [M]  net/sctp/outqueue.o
  CC [M]  drivers/block/drbd/drbd_bitmap.o
  CC      drivers/char/agp/backend.o
  CC [M]  drivers/iommu/iommufd/hw_pagetable.o
  CC [M]  drivers/regulator/bd9571mwv-regulator.o
  CC      drivers/xen/dbgp.o
  CC      drivers/acpi/acpica/psscope.o
  CC [M]  drivers/tty/serial/jsm/jsm_tty.o
  CC [M]  drivers/block/mtip32xx/mtip32xx.o
  CC [M]  drivers/block/zram/zcomp.o
  CC [M]  drivers/gpu/drm/tests/drm_cmdline_parser_test.o
  CC      net/ipv6/xfrm6_output.o
  CC      lib/iov_iter.o
  LD [M]  sound/soundcore.o
  CC      drivers/char/agp/generic.o
  CC [M]  fs/autofs/waitq.o
  CC      kernel/ksysfs.o
  CC [M]  fs/overlayfs/namei.o
  CC      drivers/char/agp/isoch.o
  CC      drivers/iommu/intel/pasid.o
  CC [M]  fs/nfs/inode.o
  CC      drivers/iommu/amd/pasid.o
  CC      drivers/char/agp/amd64-agp.o
  CC      drivers/tty/serial/serial_base_bus.o
  CC [M]  fs/smb/client/inode.o
  CC      drivers/base/power/generic_ops.o
  AS      arch/x86/kernel/relocate_kernel_64.o
  CC      drivers/acpi/acpica/pstree.o
  CC      arch/x86/kernel/kexec-bzimage64.o
  CC [M]  net/netfilter/nf_nat_core.o
  AR      drivers/tty/serdev/built-in.a
  CC      drivers/char/agp/intel-agp.o
  CC [M]  drivers/block/zram/zram_drv.o
  CC [M]  crypto/poly1305_generic.o
  CC      drivers/xen/acpi.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-lnl-match.o
  CC      kernel/bpf/btf_relocate.o
  CC [M]  drivers/block/xen-blkback/xenbus.o
  CC [M]  drivers/regulator/da903x-regulator.o
  CC [M]  drivers/iommu/iommufd/io_pagetable.o
  CC      drivers/acpi/acpica/psutils.o
  CC [M]  drivers/block/null_blk/main.o
  CC [M]  net/sunrpc/auth_null.o
  CC [M]  fs/lockd/svcshare.o
  CC      drivers/tty/serial/serial_ctrl.o
  CC      drivers/char/agp/intel-gtt.o
  CC      drivers/tty/serial/8250/8250_dma.o
  CC [M]  drivers/tty/serial/jsm/jsm_cls.o
  CC [M]  net/bridge/br_stp_if.o
  AR      drivers/iommu/amd/built-in.a
  CC [M]  drivers/block/null_blk/trace.o
  CC [M]  fs/autofs/expire.o
  AR      drivers/tty/ipwireless/built-in.a
  CC [M]  fs/nfs/super.o
  CC [M]  fs/netfs/write_collect.o
  CC [M]  fs/smb/client/link.o
  CC [M]  fs/fuse/dir.o
  CC [M]  crypto/michael_mic.o
  CC [M]  drivers/block/drbd/drbd_proc.o
  CC [M]  fs/lockd/svcproc.o
  CC      drivers/acpi/acpica/pswalk.o
  CC [M]  fs/overlayfs/util.o
  CC      drivers/base/power/common.o
  CC      arch/x86/kernel/crash_dump_64.o
  CC      net/ipv6/xfrm6_protocol.o
  CC      fs/btrfs/ioctl.o
  CC [M]  net/rds/transport.o
  CC [M]  net/sctp/ulpqueue.o
  CC      drivers/iommu/intel/nested.o
  CC [M]  drivers/regulator/da9052-regulator.o
  CC      net/ipv4/fib_notifier.o
  CC      mm/sparse-vmemmap.o
  CC      drivers/iommu/iommu.o
  CC [M]  drivers/block/drbd/drbd_worker.o
  CC [M]  crypto/crc32_generic.o
  CC      drivers/acpi/acpica/psxface.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ptl-match.o
  LD [M]  drivers/tty/serial/jsm/jsm.o
  CC      kernel/bpf/kmem_cache_iter.o
  CC [M]  drivers/char/tpm/st33zp24/st33zp24.o
  CC      drivers/iommu/iommu-traces.o
  CC [M]  net/sunrpc/auth_tls.o
  CC [M]  drivers/block/zram/backend_lzorle.o
  CC [M]  fs/smb/client/misc.o
  AR      drivers/misc/eeprom/built-in.a
  CC [M]  drivers/iommu/iommufd/ioas.o
  CC      drivers/xen/xen-acpi-pad.o
  CC [M]  drivers/misc/eeprom/at24.o
  CC [M]  fs/autofs/dev-ioctl.o
  CC      arch/x86/kernel/crash.o
  CC [M]  drivers/gpu/drm/tests/drm_connector_test.o
  CC [M]  net/netfilter/nf_nat_proto.o
  LD [M]  drivers/block/xen-blkback/xen-blkback.o
  CC [M]  fs/smb/client/netmisc.o
  CC      drivers/acpi/acpica/rsaddr.o
  CC      arch/x86/kernel/module.o
  CC      drivers/tty/serial/8250/8250_dwlib.o
  CC [M]  net/vmw_vsock/hyperv_transport.o
  CC      fs/btrfs/locking.o
  CC [M]  net/bridge/br_stp_timer.o
  CC [M]  drivers/block/zram/backend_lzo.o
  CC [M]  crypto/authenc.o
  CC [M]  drivers/regulator/da9055-regulator.o
  CC      drivers/char/agp/via-agp.o
  CC      drivers/base/power/qos.o
  CC      drivers/iommu/intel/cache.o
  CC      drivers/tty/tty_io.o
  CC [M]  fs/lockd/svcsubs.o
  CC [M]  fs/overlayfs/inode.o
  CC [M]  drivers/block/null_blk/zoned.o
  CC [M]  net/bridge/br_netlink.o
  CC      drivers/acpi/acpica/rscalc.o
  CC      drivers/xen/pcpu.o
  CC      net/ipv4/inet_fragment.o
  AR      kernel/bpf/built-in.a
  CC      kernel/cred.o
  CC      fs/btrfs/orphan.o
  LD [M]  drivers/block/zram/zram.o
  CC      lib/clz_ctz.o
  CC [M]  fs/netfs/write_issue.o
  CC [M]  net/bridge/br_netlink_tunnel.o
  CC      net/ipv6/netfilter.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-hda-match.o
  CC [M]  fs/fuse/file.o
  CC      mm/mmu_notifier.o
  CC      fs/btrfs/export.o
  CC [M]  drivers/iommu/iommufd/main.o
  LD [M]  fs/autofs/autofs4.o
  CC [M]  drivers/char/agp/sis-agp.o
  CC      lib/bsearch.o
  CC [M]  drivers/misc/eeprom/at25.o
  CC [M]  net/sctp/tsnmap.o
  CC      arch/x86/kernel/kgdb.o
  CC [M]  net/sunrpc/auth_unix.o
  CC      drivers/acpi/acpica/rscreate.o
  CC      drivers/tty/serial/8250/8250_fintek.o
  CC [M]  drivers/char/tpm/st33zp24/i2c.o
  CC      arch/x86/kernel/early_printk.o
  CC [M]  drivers/regulator/da9062-regulator.o
  CC [M]  drivers/misc/eeprom/max6875.o
  CC [M]  net/rds/loop.o
  CC      lib/find_bit.o
  CC      drivers/tty/n_tty.o
  CC [M]  net/sunrpc/svc.o
  CC      kernel/reboot.o
  CC      kernel/async.o
  CC      drivers/xen/biomerge.o
  CC [M]  net/vmw_vsock/vsock_loopback.o
  CC [M]  fs/nfs/io.o
  CC      arch/x86/kernel/hpet.o
  CC      drivers/mfd/88pm860x-core.o
  AR      drivers/char/agp/built-in.a
  CC      drivers/tty/tty_ioctl.o
  CC [M]  drivers/gpu/drm/tests/drm_damage_helper_test.o
  CC [M]  fs/overlayfs/file.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.o
  CC      drivers/iommu/intel/prq.o
  CC [M]  fs/smb/client/smbencrypt.o
  CC      drivers/tty/serial/8250/8250_pcilib.o
  LD [M]  drivers/block/null_blk/null_blk.o
  CC      drivers/mfd/88pm860x-i2c.o
  CC      kernel/range.o
  CC [M]  crypto/authencesn.o
  CC      drivers/base/power/runtime.o
  CC      drivers/acpi/mipi-disco-img.o
  CC      drivers/acpi/acpica/rsdumpinfo.o
  CC      lib/llist.o
  CC [M]  fs/lockd/mon.o
  CC [M]  drivers/misc/eeprom/eeprom_93cx6.o
  CC [M]  arch/x86/kvm/vmx/posted_intr.o
  CC      mm/ksm.o
  CC [M]  drivers/char/tpm/st33zp24/spi.o
  CC      drivers/iommu/iommu-sysfs.o
  CC [M]  drivers/misc/eeprom/eeprom_93xx46.o
  CC [M]  drivers/iommu/iommufd/pages.o
  CC [M]  net/sctp/bind_addr.o
  AR      drivers/nfc/built-in.a
  CC [M]  drivers/regulator/da9210-regulator.o
  CC      drivers/xen/xen-balloon.o
  CC      net/ipv6/fib6_rules.o
  CC      lib/lwq.o
  CC      kernel/smpboot.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ssp-common.o
  CC      arch/x86/kernel/amd_nb.o
  CC      fs/btrfs/tree-log.o
  CC      drivers/tty/serial/8250/8250_early.o
  CC      drivers/acpi/acpica/rsinfo.o
  CC [M]  net/netfilter/nf_nat_helper.o
  CC [M]  arch/x86/kvm/vmx/main.o
  CC [M]  net/bridge/br_arp_nd_proxy.o
  CC      drivers/tty/tty_ldisc.o
  CC [M]  drivers/block/drbd/drbd_receiver.o
  LD [M]  net/vmw_vsock/vsock.o
  CC [M]  net/rds/page.o
  CC [M]  fs/netfs/write_retry.o
  LD [M]  net/vmw_vsock/vsock_diag.o
  LD [M]  net/vmw_vsock/vmw_vsock_vmci_transport.o
  LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport.o
  LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport_common.o
  LD [M]  net/vmw_vsock/hv_sock.o
  CC      drivers/mfd/wm8400-core.o
  CC [M]  fs/nfs/direct.o
  CC [M]  drivers/gpu/drm/tests/drm_dp_mst_helper_test.o
  CC      lib/memweight.o
  CC      drivers/block/loop.o
  CC [M]  fs/overlayfs/dir.o
  CC      drivers/acpi/acpica/rsio.o
  CC      drivers/iommu/intel/trace.o
  CC [M]  fs/fuse/inode.o
  LD [M]  drivers/char/tpm/st33zp24/tpm_st33zp24.o
  CC      kernel/ucount.o
  LD [M]  drivers/char/tpm/st33zp24/tpm_st33zp24_i2c.o
  CC      fs/btrfs/free-space-cache.o
  CC      drivers/tty/serial/8250/8250_dw.o
  LD [M]  drivers/char/tpm/st33zp24/tpm_st33zp24_spi.o
  CC [M]  crypto/lz4.o
  CC      drivers/char/tpm/tpm-chip.o
  CC      fs/btrfs/zlib.o
  CC      lib/kfifo.o
  AR      drivers/misc/cb710/built-in.a
  CC [M]  drivers/misc/cb710/core.o
  CC [M]  drivers/gpu/drm/tests/drm_exec_test.o
  CC [M]  drivers/regulator/da9211-regulator.o
  CC [M]  drivers/misc/eeprom/idt_89hpesx.o
  CC      drivers/char/tpm/tpm-dev-common.o
  CC      drivers/base/firmware_loader/builtin/main.o
  CC      net/ipv4/ping.o
  CC [M]  fs/smb/client/transport.o
  CC      drivers/base/power/wakeirq.o
  CC [M]  net/rds/rdma.o
  CC [M]  fs/9p/vfs_super.o
  CC [M]  fs/lockd/trace.o
  CC [M]  fs/9p/vfs_inode.o
  CC [M]  fs/netfs/stats.o
  CC      drivers/acpi/acpica/rsirq.o
  CC      drivers/xen/sys-hypervisor.o
  CC [M]  fs/9p/vfs_inode_dotl.o
  CC      drivers/base/regmap/regmap.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-sdca-quirks.o
  CC [M]  arch/x86/kvm/vmx/sgx.o
  CC [M]  net/sctp/socket.o
  CC      arch/x86/kernel/amd_node.o
  CC [M]  net/sunrpc/svcsock.o
  CC      drivers/mfd/wm831x-core.o
  CC      kernel/regset.o
  CC      drivers/mfd/wm831x-irq.o
  CC [M]  crypto/lz4hc.o
  CC [M]  drivers/iommu/iommufd/vfio_compat.o
  CC [M]  drivers/gpu/drm/tests/drm_format_helper_test.o
  CC      drivers/acpi/acpica/rslist.o
  AR      drivers/base/firmware_loader/builtin/built-in.a
  CC      drivers/base/firmware_loader/fallback_table.o
  CC [M]  fs/9p/vfs_addr.o
  CC      drivers/tty/serial/8250/8250_mid.o
  CC [M]  net/bridge/br_sysfs_if.o
  CC [M]  fs/smb/client/cached_dir.o
  CC [M]  drivers/regulator/fan53555.o
  CC [M]  drivers/char/mwave/mwavedd.o
  CC [M]  fs/overlayfs/readdir.o
  CC [M]  drivers/char/xillybus/xillybus_class.o
  CC [M]  crypto/842.o
  CC      net/ipv6/proc.o
  CC      drivers/char/tpm/tpm-dev.o
  CC [M]  drivers/misc/eeprom/ee1004.o
  CC      drivers/iommu/intel/svm.o
  CC      drivers/xen/platform-pci.o
  CC      drivers/base/power/main.o
  CC      mm/page_poison.o
  CC      drivers/tty/tty_buffer.o
  CC      lib/percpu-refcount.o
  CC      drivers/acpi/acpica/rsmemory.o
  CC [M]  fs/nfs/pagelist.o
  CC [M]  drivers/misc/cb710/sgbuf2.o
  CC      kernel/ksyms_common.o
  LD [M]  sound/soc/intel/common/snd-soc-acpi-intel-match.o
  CC [M]  fs/lockd/xdr.o
  LD [M]  sound/soc/intel/common/snd-soc-acpi-intel-sdca-quirks.o
  CC      drivers/char/mem.o
  CC      drivers/char/random.o
  CC      drivers/acpi/resource.o
  CC [M]  sound/soc/sdca/sdca_functions.o
  CC      drivers/char/ttyprintk.o
  CC [M]  fs/netfs/fscache_cache.o
  CC [M]  arch/x86/kvm/vmx/hyperv.o
  CC [M]  net/netfilter/nf_nat_redirect.o
  CC [M]  net/rds/tcp.o
  CC      drivers/tty/serial/8250/8250_pci.o
  CC [M]  fs/9p/vfs_file.o
  CC      drivers/mfd/wm831x-otp.o
  CC      drivers/acpi/acpica/rsmisc.o
  CC      arch/x86/kernel/kvm.o
  CC [M]  drivers/char/mwave/smapi.o
  CC [M]  crypto/ansi_cprng.o
  CC      drivers/char/tpm/tpm-interface.o
  CC [M]  drivers/regulator/gpio-regulator.o
  CC [M]  fs/fuse/control.o
  CC [M]  drivers/iommu/iommufd/viommu.o
  CC      drivers/xen/swiotlb-xen.o
  CC      drivers/base/firmware_loader/main.o
  CC      drivers/block/nbd.o
  CC [M]  drivers/char/xillybus/xillybus_core.o
  CC      drivers/iommu/intel/irq_remapping.o
  CC      kernel/groups.o
  CC [M]  net/bridge/br_sysfs_br.o
  CC [M]  net/sctp/primitive.o
  CC      drivers/gpu/drm/clients/drm_client_setup.o
  AR      drivers/gpu/drm/display/built-in.a
  CC      drivers/acpi/acpica/rsserial.o
  CC [M]  drivers/gpu/drm/display/drm_display_helper_mod.o
  CC [M]  drivers/gpu/drm/tests/drm_format_test.o
  CC [M]  fs/overlayfs/copy_up.o
  AR      drivers/gpu/drm/renesas/rcar-du/built-in.a
  AR      drivers/gpu/drm/renesas/rz-du/built-in.a
  CC      drivers/acpi/acpi_processor.o
  AR      drivers/gpu/drm/renesas/built-in.a
  CC      drivers/acpi/acpica/rsutils.o
  CC [M]  fs/nfs/read.o
  CC      net/ipv4/ip_tunnel_core.o
  CC      net/ipv6/syncookies.o
  CC      lib/rhashtable.o
  AR      drivers/base/test/built-in.a
  CC      net/ipv4/gre_offload.o
  CC [M]  drivers/char/mwave/tp3780i.o
  CC      drivers/mfd/wm831x-auxadc.o
  CC      mm/memtest.o
  CC [M]  fs/9p/vfs_dir.o
  CC [M]  fs/smb/client/cifs_unicode.o
  LD [M]  drivers/misc/cb710/cb710.o
  CC [M]  crypto/tcrypt.o
  AR      drivers/misc/lis3lv02d/built-in.a
  CC [M]  drivers/misc/lis3lv02d/lis3lv02d.o
  CC [M]  fs/lockd/netlink.o
  CC      fs/btrfs/lzo.o
  CC      drivers/base/component.o
  CC [M]  drivers/regulator/isl6271a-regulator.o
  CC [M]  drivers/misc/lis3lv02d/lis3lv02d_i2c.o
  CC [M]  fs/fuse/xattr.o
  AR      drivers/iommu/iommufd/built-in.a
  LD [M]  drivers/iommu/iommufd/iommufd.o
  CC      mm/migrate.o
  CC [M]  arch/x86/kvm/vmx/hyperv_evmcs.o
  CC      drivers/acpi/acpica/rsxface.o
  CC [M]  drivers/gpu/drm/display/drm_bridge_connector.o
  CC      drivers/xen/mcelog.o
  CC [M]  fs/netfs/fscache_cookie.o
  CC [M]  net/rds/tcp_connect.o
  CC [M]  net/netfilter/nf_nat_masquerade.o
  CC      drivers/gpu/drm/clients/drm_fbdev_client.o
  CC      drivers/char/tpm/tpm1-cmd.o
  CC [M]  sound/soc/sdca/sdca_device.o
  CC [M]  drivers/char/mwave/3780i.o
  CC [M]  fs/9p/vfs_dentry.o
  CC      drivers/acpi/processor_core.o
  CC [M]  drivers/gpu/drm/tests/drm_framebuffer_test.o
  CC      drivers/base/power/wakeup.o
  CC      drivers/tty/serial/8250/8250_rt288x.o
  CC [M]  fs/lockd/clnt4xdr.o
  CC      kernel/vhost_task.o
  CC [M]  drivers/regulator/isl9305.o
  CC [M]  fs/fuse/acl.o
  CC      drivers/iommu/intel/perfmon.o
  CC [M]  sound/soc/sdca/sdca_regmap.o
  CC [M]  net/bridge/br_nf_core.o
  CC      drivers/mfd/wm831x-i2c.o
  CC [M]  net/sunrpc/svcauth.o
  CC      drivers/char/tpm/tpm2-cmd.o
  CC [M]  fs/overlayfs/export.o
  CC [M]  fs/smb/client/nterr.o
  CC      drivers/acpi/acpica/tbdata.o
  CC [M]  arch/x86/kvm/vmx/vmx_onhyperv.o
  CC      drivers/acpi/acpica/tbfadt.o
  CC      drivers/base/regmap/regcache.o
  CC      drivers/char/tpm/tpmrm-dev.o
  CC      drivers/acpi/processor_pdc.o
  CC [M]  drivers/char/xillybus/xillybus_pcie.o
  CC      drivers/base/firmware_loader/fallback.o
  CC      arch/x86/kernel/kvmclock.o
  CC      drivers/xen/xen-acpi-processor.o
  CC      fs/btrfs/zstd.o
  CC [M]  fs/fuse/readdir.o
  CC [M]  drivers/tty/serial/8250/8250_exar.o
  AR      drivers/gpu/drm/clients/built-in.a
  CC      drivers/char/tpm/tpm2-space.o
  LD [M]  drivers/char/mwave/mwave.o
  CC [M]  drivers/tty/serial/8250/8250_lpss.o
  CC [M]  fs/9p/v9fs.o
  AR      drivers/misc/cardreader/built-in.a
  CC [M]  drivers/misc/cardreader/alcor_pci.o
  CC [M]  drivers/block/drbd/drbd_req.o
  CC [M]  drivers/gpu/drm/display/drm_dp_dual_mode_helper.o
  CC [M]  drivers/gpu/drm/tests/drm_gem_shmem_test.o
  CC      lib/base64.o
  CC [M]  fs/smb/client/cifsencrypt.o
  CC [M]  net/sunrpc/svcauth_unix.o
  CC [M]  fs/fuse/ioctl.o
  CC [M]  drivers/misc/cardreader/rtsx_pcr.o
  CC      kernel/kcmp.o
  CC [M]  net/sctp/output.o
  CC [M]  drivers/regulator/lm363x-regulator.o
  CC      net/ipv6/calipso.o
  CC      drivers/mfd/wm831x-spi.o
  CC [M]  net/rds/tcp_listen.o
  CC      lib/once.o
  CC [M]  drivers/misc/cardreader/rts5209.o
  CC [M]  drivers/char/xillybus/xillyusb.o
  CC [M]  drivers/gpu/drm/display/drm_dp_helper.o
  CC      fs/btrfs/compression.o
  CC [M]  fs/overlayfs/params.o
  CC      mm/memory-tiers.o
  CC      drivers/tty/serial/serial_port.o
  CC [M]  fs/lockd/xdr4.o
  CC      drivers/acpi/acpica/tbfind.o
  CC      drivers/base/firmware_loader/fallback_platform.o
  LD [M]  sound/soc/sdca/snd-soc-sdca.o
  CC [M]  arch/x86/kvm/svm/svm.o
  CC [M]  fs/nfs/symlink.o
  CC [M]  net/bridge/br_multicast.o
  CC [M]  crypto/polyval-generic.o
  CC      net/ipv4/metrics.o
  CC      drivers/xen/efi.o
  AR      drivers/iommu/intel/built-in.a
  CC      drivers/iommu/dma-iommu.o
  CC      drivers/base/regmap/regcache-rbtree.o
  CC [M]  sound/soc/soc-acpi.o
  CC      drivers/char/misc.o
  CC [M]  fs/9p/fid.o
  CC [M]  crypto/af_alg.o
  CC      drivers/char/tpm/tpm-sysfs.o
  CC [M]  fs/netfs/fscache_io.o
  CC [M]  drivers/tty/serial/8250/8250_men_mcb.o
  CC      arch/x86/kernel/paravirt.o
  CC      drivers/acpi/acpica/tbinstal.o
  CC [M]  crypto/algif_hash.o
  CC      lib/refcount.o
  CC      drivers/mfd/wm8350-core.o
  CC [M]  drivers/regulator/lp3971.o
  CC [M]  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.o
  CC [M]  net/netfilter/nf_nat_ovs.o
  CC      drivers/char/tpm/eventlog/common.o
  CC      drivers/base/power/wakeup_stats.o
  CC [M]  fs/netfs/fscache_main.o
  CC      kernel/freezer.o
  CC      drivers/base/firmware_loader/sysfs.o
  CC [M]  crypto/algif_skcipher.o
  CC [M]  crypto/algif_rng.o
  CC      drivers/tty/serial/earlycon.o
  CC      drivers/acpi/acpica/tbprint.o
  CC      drivers/base/regmap/regcache-flat.o
  CC      drivers/xen/xlate_mmu.o
  CC      drivers/char/virtio_console.o
  CC [M]  fs/fuse/iomode.o
  CC [M]  fs/overlayfs/xattrs.o
  CC [M]  drivers/misc/cardreader/rts5229.o
  CC [M]  drivers/tty/serial/8250/8250_pci1xxxx.o
  CC      lib/rcuref.o
  CC      drivers/char/tpm/eventlog/tpm1.o
  CC [M]  net/sctp/input.o
  CC [M]  fs/lockd/svc4proc.o
  CC [M]  fs/nfs/unlink.o
  CC [M]  fs/9p/xattr.o
  CC [M]  drivers/regulator/lp3972.o
  CC [M]  drivers/block/drbd/drbd_actlog.o
  CC      drivers/iommu/io-pgtable.o
  CC [M]  net/rds/tcp_recv.o
  CC [M]  fs/smb/client/readdir.o
  CC      drivers/base/power/trace.o
  CC      drivers/mfd/wm8350-regmap.o
  CC [M]  sound/soc/soc-core.o
  CC      drivers/acpi/acpica/tbutils.o
  CC [M]  drivers/gpu/drm/display/drm_dp_mst_topology.o
  CC      fs/btrfs/delayed-ref.o
  CC      net/ipv6/seg6_iptunnel.o
  CC      drivers/base/firmware_loader/sysfs_upload.o
  CC      lib/usercopy.o
  CC      mm/migrate_device.o
  CC      drivers/base/regmap/regcache-maple.o
  CC      kernel/profile.o
  CC      kernel/stacktrace.o
  CC      drivers/base/power/clock_ops.o
  CC [M]  sound/soc/soc-dapm.o
  CC      fs/btrfs/relocation.o
  CC [M]  net/sctp/debug.o
  LD [M]  fs/overlayfs/overlay.o
  CC [M]  drivers/misc/cardreader/rtl8411.o
  CC [M]  fs/netfs/fscache_volume.o
  CC      drivers/base/regmap/regmap-debugfs.o
  UPD     arch/x86/kvm/kvm-asm-offsets.h
  CC [M]  fs/fuse/dax.o
  CC [M]  sound/soc/soc-jack.o
  CC      arch/x86/kernel/paravirt-spinlocks.o
  CC      drivers/acpi/acpica/tbxface.o
  CC [M]  drivers/regulator/lp872x.o
  CC      drivers/char/tpm/eventlog/tpm2.o
  CC [M]  fs/9p/cache.o
  CC [M]  drivers/tty/serial/8250/8250_pericom.o
  CC      net/ipv6/seg6_local.o
  CC      net/ipv4/netlink.o
  CC [M]  crypto/algif_aead.o
  CC      drivers/mfd/wm8350-gpio.o
  CC [M]  net/sunrpc/addr.o
  CC      arch/x86/kernel/pvclock.o
  CC      lib/errseq.o
  CC      drivers/acpi/ec.o
  CC      drivers/iommu/iova.o
  CC [M]  drivers/gpu/drm/tests/drm_managed_test.o
  CC [M]  fs/lockd/procfs.o
  CC [M]  net/netfilter/nf_nat_amanda.o
  CC      drivers/xen/unpopulated-alloc.o
  CC [M]  net/rds/tcp_send.o
  CC      lib/bucket_locks.o
  CC      drivers/acpi/acpica/tbxfload.o
  CC [M]  net/netfilter/nf_nat_ftp.o
  CC [M]  fs/nfs/write.o
  AR      drivers/base/firmware_loader/built-in.a
  CC [M]  sound/soc/soc-utils.o
  CC [M]  fs/9p/acl.o
  CC      kernel/dma.o
  CC [M]  drivers/misc/cardreader/rts5227.o
  CC      drivers/nvdimm/core.o
  CC      drivers/base/regmap/regmap-i2c.o
  CC [M]  drivers/gpu/drm/display/drm_dp_tunnel.o
  CC      net/ipv6/seg6_hmac.o
  CC      drivers/mfd/wm8350-irq.o
  AR      drivers/base/power/built-in.a
  CC      kernel/smp.o
  CC      drivers/char/tpm/tpm-buf.o
  CC [M]  net/rds/tcp_stats.o
  CC      drivers/char/hpet.o
  CC [M]  drivers/regulator/lp8788-buck.o
  AR      drivers/tty/serial/8250/built-in.a
  CC      drivers/tty/serial/max310x.o
  CC [M]  fs/fuse/passthrough.o
  CC [M]  drivers/gpu/drm/tests/drm_mm_test.o
  CC [M]  fs/netfs/fscache_proc.o
  CC [M]  fs/smb/client/ioctl.o
  CC [M]  drivers/block/drbd/drbd_main.o
  CC [M]  net/sctp/stream.o
  LD [M]  fs/lockd/lockd.o
  CC [M]  fs/netfs/fscache_stats.o
  CC [M]  crypto/zstd.o
  CC      drivers/acpi/acpica/tbxfroot.o
  CC      arch/x86/kernel/pmem.o
  LD [M]  net/rds/rds.o
  CC [M]  arch/x86/kvm/svm/pmu.o
  CC      mm/huge_memory.o
  CC [M]  drivers/misc/cardreader/rts5249.o
  AR      drivers/misc/pvpanic/built-in.a
  CC      lib/generic-radix-tree.o
  CC [M]  drivers/misc/pvpanic/pvpanic.o
  LD [M]  fs/9p/9p.o
  CC [M]  fs/fuse/sysctl.o
  CC      drivers/block/virtio_blk.o
  CC [M]  drivers/misc/pvpanic/pvpanic-mmio.o
  AR      drivers/gpu/drm/omapdrm/built-in.a
  CC      drivers/acpi/dock.o
  CC      drivers/xen/grant-dma-ops.o
  CC      drivers/base/regmap/regmap-spi.o
  CC      drivers/base/regmap/regmap-mmio.o
  CC      drivers/mfd/wm8350-i2c.o
  CC      drivers/iommu/irq_remapping.o
  CC [M]  drivers/regulator/lp8788-ldo.o
  CC [M]  drivers/gpu/drm/tests/drm_modes_test.o
  CC      drivers/mfd/tps65910.o
  CC [M]  net/netfilter/nf_nat_irc.o
  CC      net/ipv4/nexthop.o
  CC      drivers/nvdimm/bus.o
  CC      drivers/mfd/tps65912-core.o
  CC [M]  net/netfilter/nf_nat_sip.o
  CC      drivers/iommu/hyperv-iommu.o
  CC      drivers/acpi/acpica/utaddress.o
  CC      drivers/mfd/tps65912-i2c.o
  CC [M]  net/sunrpc/rpcb_clnt.o
  CC      arch/x86/kernel/jailhouse.o
  CC [M]  crypto/essiv.o
  LD [M]  net/rds/rds_tcp.o
  CC [M]  sound/soc/soc-dai.o
  CC      drivers/char/tpm/tpm2-sessions.o
  CC      lib/bitmap-str.o
  CC      drivers/tty/serial/sccnxp.o
  CC [M]  fs/fuse/dev_uring.o
  CC [M]  drivers/misc/pvpanic/pvpanic-pci.o
  CC      lib/string_helpers.o
  CC      fs/btrfs/delayed-inode.o
  CC      drivers/acpi/acpica/utalloc.o
  CC      drivers/mfd/tps65912-spi.o
  CC      mm/khugepaged.o
  CC [M]  drivers/misc/cardreader/rts5260.o
  CC [M]  drivers/xen/evtchn.o
  CC      drivers/dax/hmem/device.o
  CC [M]  net/bridge/br_mdb.o
  CC [M]  drivers/misc/cardreader/rts5261.o
  LD [M]  fs/netfs/netfs.o
  CC [M]  drivers/gpu/drm/tests/drm_plane_helper_test.o
  CC [M]  fs/smb/client/sess.o
  CC [M]  drivers/regulator/lp8755.o
  CC [M]  arch/x86/kvm/svm/nested.o
  CC [M]  drivers/gpu/drm/tests/drm_probe_helper_test.o
  CC [M]  drivers/gpu/drm/tests/drm_rect_test.o
  CC      drivers/tty/tty_port.o
  CC [M]  drivers/gpu/drm/display/drm_dsc_helper.o
  CC      drivers/nvdimm/dimm_devs.o
  CC [M]  net/sctp/auth.o
  CC [M]  fs/nfs/namespace.o
  CC      lib/hexdump.o
  CC      arch/x86/kernel/pcspeaker.o
  CC      kernel/uid16.o
  CC      drivers/acpi/acpica/utascii.o
  CC      net/ipv4/udp_tunnel_stub.o
  CC      drivers/base/regmap/regmap-irq.o
  CC [M]  drivers/regulator/ltc3589.o
  CC      drivers/dma-buf/heaps/system_heap.o
  CC      drivers/iommu/virtio-iommu.o
  AR      drivers/macintosh/built-in.a
  CC [M]  crypto/curve25519-generic.o
  CC      drivers/cxl/core/suspend.o
  CC [M]  net/bridge/br_multicast_eht.o
  CC      net/ipv6/ioam6_iptunnel.o
  AR      drivers/scsi/device_handler/built-in.a
  CC [M]  drivers/scsi/device_handler/scsi_dh_rdac.o
  CC      drivers/nvme/common/auth.o
  CC      drivers/mfd/twl-core.o
  CC [M]  net/netfilter/nf_nat_tftp.o
  CC [M]  drivers/char/uv_mmtimer.o
  CC [M]  drivers/misc/cardreader/rts5228.o
  CC [M]  arch/x86/kvm/svm/avic.o
  CC      drivers/acpi/acpica/utbuffer.o
  CC      drivers/char/tpm/tpm_ppi.o
  CC      drivers/tty/serial/serial_mctrl_gpio.o
  CC      drivers/ata/libata-core.o
  CC      arch/x86/kernel/check.o
  CC [M]  drivers/ata/pata_parport/pata_parport.o
  CC [M]  net/sunrpc/timer.o
  CC [M]  fs/fuse/cuse.o
  CC [M]  drivers/scsi/device_handler/scsi_dh_hp_sw.o
  CC [M]  drivers/xen/gntdev.o
  CC [M]  net/sunrpc/xdr.o
  CC [M]  drivers/dax/hmem/hmem.o
  CC      fs/btrfs/scrub.o
  CC [M]  sound/soc/soc-component.o
  CC      fs/btrfs/backref.o
  CC      lib/kstrtox.o
  ASN.1   crypto/ecrdsa_params.asn1.[ch]
  ASN.1   crypto/ecrdsa_pub_key.asn1.[ch]
  CC [M]  crypto/ecrdsa_params.asn1.o
  CC [M]  drivers/regulator/ltc3676.o
  CC      drivers/acpi/acpica/utcksum.o
  CC      drivers/nvme/common/keyring.o
  CC [M]  crypto/ecrdsa_pub_key.asn1.o
  AR      drivers/dma-buf/heaps/built-in.a
  CC      drivers/dma-buf/dma-buf.o
  CC      kernel/module_signature.o
  CC [M]  crypto/simd.o
  CC [M]  drivers/base/regmap/regmap-slimbus.o
  CC      kernel/kallsyms.o
  CC [M]  drivers/misc/cardreader/rts5264.o
  CC      drivers/iommu/iommu-sva.o
  CC [M]  drivers/base/regmap/regmap-spmi.o
  CC      arch/x86/kernel/uprobes.o
  CC      drivers/ata/libata-scsi.o
  CC [M]  net/netfilter/nf_synproxy_core.o
  CC      drivers/char/tpm/eventlog/acpi.o
  CC [M]  drivers/cxl/core/port.o
  AR      drivers/dax/hmem/built-in.a
  LD [M]  drivers/dax/hmem/dax_hmem.o
  CC [M]  drivers/scsi/device_handler/scsi_dh_emc.o
  CC      drivers/dax/super.o
  CC [M]  drivers/gpu/drm/display/drm_hdcp_helper.o
  CC [M]  net/sctp/offload.o
  CC      drivers/acpi/acpica/utcopy.o
  CC      drivers/iommu/io-pgfault.o
  CC      lib/debug_info.o
  CC      net/ipv6/addrconf_core.o
  CC      net/ipv6/exthdrs_core.o
  CC      drivers/char/tpm/eventlog/efi.o
  CC [M]  fs/fuse/virtio_fs.o
  CC      drivers/nvdimm/nd_perf.o
  CC [M]  net/bridge/br_vlan.o
  CC      lib/iomap.o
  CC      drivers/char/tpm/tpm_tis_core.o
  CC [M]  net/sctp/stream_sched.o
  CC      drivers/tty/serial/kgdboc.o
  CC [M]  drivers/regulator/max14577-regulator.o
  CC      drivers/mfd/twl4030-irq.o
  CC      drivers/char/tpm/tpm_tis.o
  CC [M]  fs/nfs/mount_clnt.o
  CC [M]  drivers/xen/gntdev-dmabuf.o
  AR      drivers/nvme/common/built-in.a
  CC [M]  drivers/misc/cardreader/rtsx_usb.o
  CC      drivers/nvme/host/core.o
  CC [M]  fs/smb/client/export.o
  CC [M]  arch/x86/kvm/svm/sev.o
  CC      drivers/acpi/acpica/utexcep.o
  CC [M]  drivers/ata/pata_parport/aten.o
  AR      drivers/nvme/target/built-in.a
  CC [M]  drivers/nvme/target/core.o
  CC      drivers/block/xen-blkfront.o
  CC      arch/x86/kernel/perf_regs.o
  CC [M]  drivers/base/regmap/regmap-w1.o
  CC [M]  drivers/scsi/device_handler/scsi_dh_alua.o
  CC      drivers/char/tpm/tpm_crb.o
  CC [M]  drivers/tty/serial/altera_jtaguart.o
  CC [M]  sound/soc/soc-pcm.o
  CC      drivers/dax/bus.o
  CC [M]  drivers/block/drbd/drbd_strings.o
  CC [M]  drivers/tty/serial/altera_uart.o
  CC [M]  drivers/block/drbd/drbd_nl.o
  CC [M]  crypto/ecdsa-x962.o
  CC      drivers/mfd/twl6030-irq.o
  CC [M]  drivers/ata/pata_parport/bpck.o
  CC [M]  drivers/regulator/max1586.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_audio_helper.o
  CC      net/ipv4/sysctl_net_ipv4.o
  CC      mm/page_counter.o
  CC [M]  drivers/xen/gntalloc.o
  CC      kernel/acct.o
  CC      drivers/dma-buf/dma-fence.o
  CC      drivers/acpi/acpica/utdebug.o
  AR      drivers/iommu/built-in.a
  LD [M]  crypto/aegis128.o
  CC      drivers/base/core.o
  CC [M]  drivers/char/lp.o
  CC [M]  net/sctp/stream_sched_prio.o
  CC [M]  fs/nfs/nfstrace.o
  CC      lib/iomap_copy.o
  CC [M]  drivers/ata/pata_parport/comm.o
  CC [M]  drivers/nvme/target/configfs.o
  CC      drivers/nvdimm/dimm.o
  CC [M]  net/netfilter/nf_conncount.o
  CC      drivers/tty/tty_mutex.o
  LD [M]  fs/fuse/fuse.o
  CC      arch/x86/kernel/tracepoint.o
  CC [M]  fs/smb/client/unc.o
  AR      drivers/scsi/megaraid/built-in.a
  LD [M]  fs/fuse/virtiofs.o
  CC [M]  drivers/scsi/megaraid/megaraid_mm.o
  CC [M]  net/netfilter/nf_dup_netdev.o
  CC [M]  drivers/cxl/core/pmem.o
  CC      fs/btrfs/ulist.o
  CC [M]  crypto/ecrdsa.o
  CC [M]  drivers/regulator/max77503-regulator.o
  CC      mm/memcontrol.o
  CC      net/ipv4/proc.o
  CC      net/ipv6/ip6_checksum.o
  CC [M]  drivers/base/regmap/regmap-i3c.o
  CC [M]  drivers/char/tpm/tpm_tis_spi_main.o
  CC [M]  drivers/tty/serial/arc_uart.o
  CC      lib/devres.o
  CC      drivers/mfd/twl4030-audio.o
  CC      lib/check_signature.o
  LD [M]  drivers/misc/cardreader/rtsx_pci.o
  AR      drivers/misc/keba/built-in.a
  CC [M]  drivers/misc/keba/cp500.o
  CC      drivers/acpi/acpica/utdecode.o
  CC      lib/interval_tree.o
  CC      fs/btrfs/qgroup.o
  CC      arch/x86/kernel/itmt.o
  CC [M]  drivers/xen/privcmd.o
  CC      kernel/vmcore_info.o
  LD [M]  crypto/crypto_simd.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_cec_helper.o
  CC      crypto/rsapubkey.asn1.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.o
  CC [M]  drivers/misc/ibmasm/module.o
  CC [M]  drivers/scsi/megaraid/megaraid_mbox.o
  CC [M]  drivers/misc/ibmasm/ibmasmfs.o
  CC      crypto/rsaprivkey.asn1.o
  AR      drivers/gpu/drm/tilcdc/built-in.a
  CC [M]  drivers/misc/ibmasm/event.o
  CC      drivers/nvdimm/region_devs.o
  CC [M]  drivers/scsi/libsas/sas_init.o
  CC [M]  drivers/dax/device.o
  LD [M]  crypto/ecdsa_generic.o
  CC [M]  drivers/regulator/max77541-regulator.o
  LD [M]  crypto/ecrdsa_generic.o
  AR      crypto/built-in.a
  CC [M]  net/sunrpc/sunrpc_syms.o
  CC      lib/assoc_array.o
  CC [M]  drivers/tty/serial/fsl_linflexuart.o
  CC [M]  drivers/ata/pata_parport/dstr.o
  CC [M]  sound/soc/soc-devres.o
  CC      drivers/acpi/acpica/utdelete.o
  CC [M]  fs/cachefiles/cache.o
  CC [M]  net/sctp/stream_sched_rr.o
  COPY    drivers/scsi/aic7xxx/aic7xxx_seq.h
  COPY    drivers/scsi/aic7xxx/aic7xxx_reg.h
  COPY    drivers/scsi/aic7xxx/aic7xxx_reg_print.c
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_osm.o
  CC [M]  drivers/char/tpm/tpm_tis_spi_cr50.o
  CC [M]  fs/smb/client/winucase.o
  CC [M]  drivers/cxl/core/regs.o
  CC      arch/x86/kernel/umip.o
  CC [M]  fs/cachefiles/daemon.o
  CC      drivers/mfd/twl6040.o
  CC [M]  fs/smb/client/smb2ops.o
  CC [M]  drivers/nvme/target/admin-cmd.o
  CC [M]  fs/cachefiles/interface.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_proc.o
  CC [M]  drivers/base/regmap/regmap-spi-avmm.o
  CC [M]  fs/vboxsf/dir.o
  CC      drivers/dma-buf/dma-fence-array.o
  CC      drivers/acpi/acpica/uterror.o
  CC      fs/open.o
  CC      drivers/dma-buf/dma-fence-chain.o
  CC [M]  drivers/tty/serial/fsl_lpuart.o
  CC [M]  net/sunrpc/cache.o
  CC [M]  drivers/regulator/max8649.o
  CC      net/ipv4/fib_rules.o
  CC [M]  drivers/ata/pata_parport/kbic.o
  CC [M]  drivers/dax/kmem.o
  CC [M]  drivers/misc/ibmasm/command.o
  CC [M]  net/bridge/br_vlan_tunnel.o
  CC      lib/list_debug.o
  CC [M]  arch/x86/kvm/svm/hyperv.o
  CC [M]  drivers/char/tpm/tpm_tis_i2c_cr50.o
  CC      kernel/elfcorehdr.o
  CC      drivers/acpi/acpica/uteval.o
  CC      net/ipv6/ip6_icmp.o
  CC      drivers/mfd/mfd-core.o
  CC      drivers/mfd/ezx-pcap.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_helper.o
  CC      net/ipv6/output_core.o
  CC [M]  drivers/xen/privcmd-buf.o
  CC [M]  net/netfilter/nf_tables_core.o
  CC [M]  sound/soc/soc-ops.o
  CC [M]  net/sctp/stream_sched_fc.o
  CC      arch/x86/kernel/unwind_frame.o
  CC [M]  drivers/scsi/megaraid/megaraid_sas_base.o
  CC [M]  fs/vboxsf/file.o
  CC      lib/debugobjects.o
  CC [M]  drivers/scsi/megaraid/megaraid_sas_fusion.o
  CC [M]  fs/cachefiles/io.o
  CC [M]  drivers/scsi/libsas/sas_phy.o
  CC [M]  drivers/block/drbd/drbd_interval.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_osm_pci.o
  CC      drivers/acpi/acpica/utglobal.o
  CC [M]  drivers/dax/pmem.o
  CC [M]  drivers/misc/ibmasm/remote.o
  CC [M]  drivers/regulator/max8660.o
  CC [M]  net/sctp/stream_interleave.o
  CC      drivers/dma-buf/dma-fence-unwrap.o
  CC      lib/bitrev.o
  CC [M]  drivers/nvme/target/fabrics-cmd.o
  CC      drivers/tty/tty_ldsem.o
  CC [M]  drivers/regulator/max8893.o
  CC [M]  drivers/cxl/core/memdev.o
  CC      drivers/nvdimm/region.o
  AR      drivers/base/regmap/built-in.a
  CC [M]  drivers/tty/serial/lantiq.o
  CC [M]  net/sunrpc/rpc_pipe.o
  CC [M]  arch/x86/kvm/svm/svm_onhyperv.o
  CC      drivers/dma-buf/dma-resv.o
  CC [M]  drivers/char/tpm/tpm_tis_i2c.o
  CC [M]  drivers/ata/pata_parport/epat.o
  CC      drivers/nvme/host/ioctl.o
  CC      drivers/base/bus.o
  CC      kernel/crash_reserve.o
  CC      drivers/acpi/acpica/uthex.o
  CC [M]  drivers/gpu/drm/display/drm_scdc_helper.o
  CC [M]  fs/vboxsf/utils.o
  CC [M]  drivers/scsi/libsas/sas_port.o
  COPY    drivers/scsi/aic7xxx/aic79xx_seq.h
  COPY    drivers/scsi/aic7xxx/aic79xx_reg.h
  COPY    drivers/scsi/aic7xxx/aic79xx_reg_print.c
  CC [M]  drivers/scsi/aic7xxx/aic79xx_osm.o
  CC [M]  drivers/misc/ibmasm/heartbeat.o
  CC [M]  drivers/xen/xen-scsiback.o
  CC [M]  drivers/dax/cxl.o
  CC [M]  net/netfilter/nf_tables_api.o
  CC [M]  fs/vboxsf/vboxsf_wrappers.o
  CC      drivers/mfd/da903x.o
  CC      arch/x86/kernel/callthunks.o
  CC [M]  net/bridge/br_vlan_options.o
  CC [M]  fs/vboxsf/super.o
  CC [M]  drivers/ata/pata_parport/epia.o
  CC      drivers/acpi/acpica/utids.o
  CC      fs/btrfs/send.o
  CC [M]  drivers/scsi/libsas/sas_event.o
  CC [M]  drivers/tty/serial/max3100.o
  CC [M]  drivers/regulator/max8907-regulator.o
  CC [M]  drivers/nvme/target/discovery.o
  CC      drivers/nvme/host/sysfs.o
  CC [M]  sound/soc/soc-link.o
  CC [M]  drivers/scsi/isci/init.o
  CC      drivers/nvdimm/namespace_devs.o
  CC [M]  fs/cachefiles/key.o
  CC      lib/linear_ranges.o
  CC [M]  drivers/block/drbd/drbd_state.o
  CC [M]  drivers/char/tpm/tpm_i2c_atmel.o
  CC [M]  fs/nfs/export.o
  LD [M]  arch/x86/kvm/kvm.o
  CC      kernel/kexec_core.o
  CC      net/ipv4/ipmr.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_base.o
  CC [M]  drivers/scsi/isci/phy.o
  CC [M]  drivers/misc/ibmasm/r_heartbeat.o
  AS [M]  arch/x86/kvm/vmx/vmenter.o
  CC      net/ipv6/protocol.o
  CC      drivers/acpi/acpica/utinit.o
  AS [M]  arch/x86/kvm/svm/vmenter.o
  LD [M]  drivers/dax/device_dax.o
  LD [M]  drivers/dax/dax_pmem.o
  LD [M]  drivers/dax/dax_cxl.o
  AR      drivers/dax/built-in.a
  LD [M]  arch/x86/kvm/kvm-intel.o
  LD [M]  arch/x86/kvm/kvm-amd.o
  CC      drivers/scsi/scsi.o
  CC      net/ipv6/ip6_offload.o
  CC [M]  fs/cachefiles/main.o
  CC [M]  fs/cachefiles/namei.o
  CC [M]  fs/cachefiles/security.o
  CC [M]  sound/soc/soc-card.o
  CC [M]  net/sctp/proc.o
  CC [M]  fs/smb/client/smb2maperror.o
  CC      arch/x86/kernel/cet.o
  CC      drivers/dma-buf/dma-heap.o
  LD [M]  fs/vboxsf/vboxsf.o
  CC [M]  drivers/cxl/port.o
  CC [M]  drivers/cxl/core/mbox.o
  CC [M]  drivers/regulator/max8925-regulator.o
  CC      drivers/acpi/acpica/utlock.o
  CC      drivers/base/dd.o
  CC [M]  drivers/nvme/target/io-cmd-file.o
  CC [M]  drivers/ata/pata_parport/frpw.o
  CC [M]  drivers/misc/ibmasm/dot_command.o
  CC [M]  drivers/tty/serial/men_z135_uart.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_state_helper.o
  CC [M]  net/sunrpc/sysfs.o
  CC [M]  sound/soc/soc-compress.o
  CC [M]  drivers/scsi/libsas/sas_discover.o
  CC      lib/packing.o
  CC [M]  drivers/char/tpm/tpm_i2c_infineon.o
  CC      net/ipv6/tcpv6_offload.o
  CC [M]  drivers/xen/pvcalls-front.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_proc.o
  CC      drivers/ata/libata-eh.o
  CC      drivers/mfd/da9052-irq.o
  CC [M]  net/bridge/br_mst.o
  CC      mm/vmpressure.o
  CC      drivers/mfd/da9052-core.o
  CC      mm/swap_cgroup.o
  CC      drivers/acpi/acpica/utmath.o
  CC      drivers/spi/spi.o
  CC [M]  drivers/scsi/isci/request.o
  CC      drivers/scsi/hosts.o
  CC      kernel/crash_core.o
  CC [M]  fs/cachefiles/volume.o
  CC [M]  fs/nfs/sysfs.o
  CC      arch/x86/kernel/shstk.o
  CC [M]  drivers/misc/ibmasm/lowlevel.o
  CC [M]  drivers/regulator/max8952.o
  CC      drivers/dma-buf/sync_file.o
  CC [M]  drivers/nvme/target/io-cmd-bdev.o
  CC      drivers/nvme/host/pr.o
  CC [M]  drivers/scsi/megaraid/megaraid_sas_fp.o
  CC      drivers/acpi/acpica/utmisc.o
  CC [M]  net/sctp/sysctl.o
  CC [M]  drivers/tty/serial/rp2.o
  CC      arch/x86/kernel/audit_64.o
  CC      mm/hugetlb_cgroup.o
  CC [M]  net/bridge/br_switchdev.o
  AR      drivers/net/phy/mediatek/built-in.a
  AR      drivers/net/phy/qcom/built-in.a
  CC      fs/btrfs/dev-replace.o
  CC [M]  drivers/net/phy/qcom/qcom-phy-lib.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_osm_pci.o
  CC      drivers/ata/libata-transport.o
  CC      lib/crc-ccitt.o
  CC [M]  drivers/char/tpm/tpm_i2c_nuvoton.o
  CC [M]  drivers/misc/sgi-xp/xp_main.o
  CC [M]  drivers/scsi/libsas/sas_expander.o
  CC [M]  fs/smb/client/smb2transport.o
  CC [M]  drivers/ata/pata_parport/friq.o
  CC      drivers/acpi/acpica/utmutex.o
  CC [M]  drivers/misc/ibmasm/uart.o
  CC [M]  drivers/gpu/drm/display/drm_dp_aux_dev.o
  CC [M]  drivers/block/drbd/drbd_nla.o
  CC [M]  net/sunrpc/svc_xprt.o
  CC      drivers/base/syscore.o
  CC      drivers/mfd/da9052-spi.o
  CC      drivers/nvdimm/label.o
  CC [M]  sound/soc/soc-generic-dmaengine-pcm.o
  CC [M]  drivers/misc/sgi-gru/grufile.o
  CC [M]  fs/cachefiles/xattr.o
  CC      arch/x86/kernel/amd_gart_64.o
  CC [M]  fs/smb/client/smb2misc.o
  CC [M]  drivers/regulator/max8997-regulator.o
  CC      net/ipv6/exthdrs_offload.o
  CC [M]  fs/smb/client/smb2pdu.o
  CC [M]  drivers/cxl/core/pci.o
  CC [M]  drivers/nvme/target/pr.o
  CC      drivers/nvme/host/trace.o
  CC      drivers/dma-buf/sw_sync.o
  CC      drivers/acpi/acpica/utnonansi.o
  CC [M]  drivers/tty/serial/sc16is7xx.o
  CC [M]  drivers/xen/xen-front-pgdir-shbuf.o
  LD [M]  drivers/misc/ibmasm/ibmasm.o
  CC      kernel/kexec.o
  CC [M]  drivers/misc/sgi-xp/xp_uv.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_core.o
  CC [M]  drivers/scsi/isci/remote_device.o
  CC [M]  net/sctp/ipv6.o
  CC [M]  drivers/gpu/drm/display/drm_dp_cec.o
  CC      lib/crc16.o
  CC [M]  drivers/char/tpm/tpm_nsc.o
  CC      mm/memory-failure.o
  CC [M]  drivers/scsi/megaraid/megaraid_sas_debugfs.o
  CC      drivers/mfd/da9052-i2c.o
  CC [M]  drivers/block/drbd/drbd_debugfs.o
  CC [M]  drivers/net/phy/qcom/at803x.o
  CC      fs/read_write.o
  CC      net/ipv4/ipmr_base.o
  CC      drivers/acpi/acpica/utobject.o
  CC [M]  drivers/ata/pata_parport/fit2.o
  CC      mm/kmemleak.o
  CC [M]  drivers/misc/sgi-gru/grumain.o
  CC      arch/x86/kernel/aperture_64.o
  CC [M]  net/bridge/br_mrp_switchdev.o
  CC [M]  fs/cachefiles/error_inject.o
  CC [M]  fs/nfs/fs_context.o
  CC [M]  fs/nfs/sysctl.o
  CC [M]  drivers/regulator/max8998.o
  CC      mm/page_isolation.o
  CC [M]  drivers/misc/sgi-xp/xpc_main.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_config.o
  CC      net/ipv6/inet6_hashtables.o
  CC [M]  sound/soc/soc-ac97.o
  CC      fs/btrfs/raid56.o
  CC      drivers/base/driver.o
  CC      drivers/acpi/acpica/utosi.o
  CC      drivers/nvdimm/badrange.o
  CC      drivers/ata/libata-trace.o
  CC      kernel/kexec_file.o
  CC [M]  drivers/nvme/target/passthru.o
  CC      drivers/dma-buf/sync_debug.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_scsih.o
  LD [M]  drivers/scsi/megaraid/megaraid_sas.o
  CC [M]  drivers/tty/serial/sc16is7xx_spi.o
  CC [M]  drivers/char/tpm/tpm_atmel.o
  CC      drivers/ata/libata-sata.o
  CC      lib/crc-t10dif.o
  CC      drivers/mfd/lp8788.o
  LD [M]  drivers/xen/xen-evtchn.o
  LD [M]  drivers/xen/xen-gntdev.o
  CC      drivers/nvme/host/multipath.o
  CC [M]  drivers/cxl/core/hdm.o
  LD [M]  drivers/xen/xen-gntalloc.o
  LD [M]  drivers/xen/xen-privcmd.o
  AR      drivers/xen/built-in.a
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_transport.o
  CC      drivers/nvdimm/claim.o
  CC [M]  drivers/scsi/libsas/sas_scsi_host.o
  CC [M]  drivers/scsi/isci/port.o
  CC [M]  drivers/ata/pata_parport/fit3.o
  CC      arch/x86/kernel/mmconf-fam10h_64.o
  CC      drivers/acpi/acpica/utownerid.o
  LD [M]  fs/cachefiles/cachefiles.o
  CC [M]  drivers/net/phy/qcom/qca83xx.o
  CC      drivers/mfd/lp8788-irq.o
  CC [M]  drivers/char/tpm/tpm_infineon.o
  CC      drivers/spi/spi-mem.o
  CC      drivers/dma-buf/udmabuf.o
  LD [M]  drivers/gpu/drm/display/drm_display_helper.o
  AR      drivers/gpu/drm/imx/built-in.a
  AR      drivers/gpu/drm/panel/built-in.a
  CC [M]  drivers/gpu/drm/panel/panel-auo-a030jtn01.o
  CC [M]  drivers/regulator/max20086-regulator.o
  CC [M]  drivers/tty/serial/sc16is7xx_i2c.o
  CC [M]  drivers/misc/sgi-gru/grufault.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_93cx6.o
  CC [M]  drivers/gpu/drm/panel/panel-ilitek-ili9341.o
  CC [M]  net/bridge/br_mrp.o
  CC      drivers/spi/spi-offload.o
  CC [M]  drivers/misc/sgi-gru/grutlbpurge.o
  CC      drivers/base/class.o
  CC      drivers/acpi/acpica/utpredef.o
  CC [M]  net/sctp/diag.o
  CC [M]  drivers/misc/sgi-xp/xpc_channel.o
  CC [M]  drivers/nvme/target/zns.o
  CC      lib/crc-itu-t.o
  LD [M]  sound/soc/snd-soc-acpi.o
  LD [M]  sound/soc/snd-soc-core.o
  LD [M]  drivers/block/drbd/drbd.o
  CC      drivers/tty/tty_baudrate.o
  CC [M]  drivers/block/floppy.o
  CC [M]  drivers/scsi/libsas/sas_task.o
  CC      kernel/compat.o
  CC [M]  drivers/char/tpm/xen-tpmfront.o
  CC [M]  drivers/regulator/max20411-regulator.o
  CC      arch/x86/kernel/vsmp_64.o
  CC [M]  drivers/nvme/target/fabrics-cmd-auth.o
  CC      net/ipv4/syncookies.o
  CC      drivers/acpi/acpica/utresdecode.o
  CC [M]  drivers/ata/pata_parport/on20.o
  LD [M]  net/sctp/sctp.o
  CC      drivers/mfd/da9055-core.o
  CC      drivers/mfd/da9055-i2c.o
  CC [M]  drivers/net/phy/qcom/qca808x.o
  CC [M]  net/bridge/br_mrp_netlink.o
  CC [M]  net/sunrpc/xprtmultipath.o
  CC [M]  drivers/misc/sgi-xp/xpc_partition.o
  CC [M]  drivers/tty/serial/sprd_serial.o
  CC [M]  drivers/misc/sgi-xp/xpc_uv.o
  CC [M]  drivers/dma-buf/selftest.o
  CC [M]  drivers/scsi/libsas/sas_ata.o
  CC [M]  arch/x86/kernel/msr.o
  CC      drivers/acpi/acpica/utresrc.o
  CC [M]  drivers/scsi/isci/host.o
  CC      drivers/tty/tty_jobctrl.o
  CC [M]  arch/x86/kernel/cpuid.o
  CC      drivers/nvdimm/btt_devs.o
  CC [M]  drivers/gpu/drm/panel/panel-orisetech-ota5601a.o
  CC [M]  net/sunrpc/debugfs.o
  AR      drivers/message/fusion/built-in.a
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_pci.o
  CC [M]  drivers/message/fusion/mptbase.o
  CC      mm/zpool.o
  CC [M]  fs/nfs/fscache.o
  CC      fs/btrfs/uuid-tree.o
  CC [M]  drivers/message/fusion/mptscsih.o
  CC [M]  drivers/misc/sgi-gru/gruprocfs.o
  CC [M]  drivers/cxl/core/pmu.o
  CC      net/ipv6/mcast_snoop.o
  HOSTCC  lib/gen_crc32table
  CC [M]  drivers/regulator/max77693-regulator.o
  CC      kernel/utsname.o
  HOSTCC  lib/gen_crc64table
  CC [M]  drivers/tty/serial/uartlite.o
  CC      drivers/nvme/host/zns.o
  CC [M]  drivers/spi/spi-mux.o
  CC [M]  fs/smb/client/smb2inode.o
  CC [M]  drivers/char/tpm/tpm_vtpm_proxy.o
  CC      drivers/base/platform.o
  CC [M]  drivers/dma-buf/st-dma-fence.o
  CC [M]  drivers/ata/pata_parport/on26.o
  CC      lib/xxhash.o
  LD [M]  net/sctp/sctp_diag.o
  CC      drivers/tty/n_null.o
  CC      drivers/acpi/acpica/utstate.o
  CC [M]  drivers/nvme/target/auth.o
  CC [M]  fs/smb/client/smb2file.o
  CC [M]  drivers/dma-buf/st-dma-fence-chain.o
  CC [M]  fs/smb/client/cifsacl.o
  CC [M]  fs/smb/client/fs_context.o
  CC [M]  drivers/dma-buf/st-dma-fence-unwrap.o
  CC [M]  drivers/nvme/target/trace.o
  CC      drivers/mfd/da9063-core.o
  CC [M]  drivers/net/phy/aquantia/aquantia_main.o
  AR      arch/x86/kernel/built-in.a
  CC      drivers/tty/pty.o
  AR      arch/x86/built-in.a
  CC [M]  drivers/net/phy/aquantia/aquantia_firmware.o
  CC      kernel/user_namespace.o
  CC [M]  fs/smb/client/dns_resolve.o
  CC [M]  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.o
  CC      drivers/acpi/acpica/utstring.o
  CC [M]  net/bridge/br_cfm.o
  CC [M]  drivers/cxl/core/cdat.o
  CC [M]  drivers/misc/sgi-xp/xpnet.o
  CC [M]  drivers/misc/sgi-gru/grukservices.o
  ASN.1   fs/smb/client/cifs_spnego_negtokeninit.asn1.[ch]
  CC [M]  drivers/char/applicom.o
  CC [M]  drivers/gpu/drm/panel/panel-widechips-ws2401.o
  CC [M]  drivers/regulator/max77826-regulator.o
  CC [M]  drivers/spi/spidev.o
  CC [M]  drivers/spi/spi-loopback-test.o
  CC [M]  net/sunrpc/backchannel_rqst.o
  CC      mm/zsmalloc.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_reg_print.o
  LD [M]  drivers/char/tpm/tpm_tis_spi.o
  AR      drivers/char/tpm/built-in.a
  AR      drivers/tty/serial/built-in.a
  CC      drivers/nvme/host/fault_inject.o
  CC [M]  drivers/char/nvram.o
  CC      drivers/tty/tty_audit.o
  CC [M]  drivers/spi/spi-altera-platform.o
  CC      fs/btrfs/props.o
  CC      drivers/mfd/da9063-irq.o
  CC      drivers/acpi/acpica/utstrsuppt.o
  CC      drivers/nvdimm/pfn_devs.o
  CC      drivers/tty/sysrq.o
  CC [M]  drivers/misc/sgi-gru/gruhandles.o
  CC [M]  drivers/tty/n_hdlc.o
  CC [M]  drivers/scsi/isci/task.o
  CC [M]  drivers/nvme/target/loop.o
  CC [M]  drivers/dma-buf/st-dma-resv.o
  CC      lib/genalloc.o
  CC [M]  drivers/scsi/libsas/sas_host_smp.o
  CC [M]  net/sunrpc/stats.o
  CC      mm/early_ioremap.o
  CC      net/ipv4/netfilter.o
  CC [M]  drivers/cxl/acpi.o
  CC [M]  net/netfilter/nft_chain_filter.o
  CC      drivers/acpi/acpica/utstrtoul64.o
  CC [M]  drivers/net/phy/aquantia/aquantia_leds.o
  CC [M]  drivers/regulator/max77857-regulator.o
  CC      drivers/mfd/da9063-i2c.o
  CC      drivers/base/cpu.o
  CC      net/ipv4/tcp_cubic.o
  AR      drivers/dma-buf/built-in.a
  LD [M]  drivers/dma-buf/dmabuf_selftests.o
  CC      mm/numa.o
  CC      net/ipv6/tcp_ao.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_core.o
  AR      drivers/gpu/drm/bridge/analogix/built-in.a
  CC [M]  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.o
  CC [M]  net/bridge/br_cfm_netlink.o
  CC      lib/textsearch.o
  LD [M]  drivers/misc/sgi-xp/xp.o
  LD [M]  drivers/misc/sgi-xp/xpc.o
  AR      drivers/net/pse-pd/built-in.a
  CC      drivers/ata/libata-sff.o
  CC [M]  drivers/cxl/core/ras.o
  CC      drivers/net/mdio/acpi_mdio.o
  CC [M]  drivers/net/phy/realtek/realtek_main.o
  CC [M]  drivers/ata/pata_parport/ktti.o
  CC      drivers/nvme/host/hwmon.o
  CC [M]  drivers/block/brd.o
  CC      net/ipv4/tcp_sigpool.o
  CC [M]  fs/nfs/nfs2super.o
  CC [M]  net/sunrpc/sysctl.o
  CC      drivers/acpi/acpica/utxface.o
  CC      kernel/pid_namespace.o
  CC [M]  drivers/block/ublk_drv.o
  CC      fs/btrfs/free-space-tree.o
  CC [M]  drivers/char/ppdev.o
  CC [M]  drivers/scsi/isci/probe_roms.o
  CC [M]  drivers/spi/spi-altera-core.o
  CC [M]  drivers/gpu/drm/bridge/analogix/analogix_dp_core.o
  CC [M]  net/ipv6/ah6.o
  CC [M]  net/bridge/br_netfilter_hooks.o
  CC [M]  drivers/misc/sgi-gru/grukdump.o
  CC      drivers/net/mdio/fwnode_mdio.o
  CC [M]  drivers/nvme/target/fc.o
  CC      fs/file_table.o
  CC      drivers/mfd/max14577.o
  CC [M]  fs/smb/client/namespace.o
  CC [M]  drivers/net/phy/aquantia/aquantia_hwmon.o
  AR      drivers/gpu/drm/hisilicon/built-in.a
  CC [M]  drivers/regulator/mc13783-regulator.o
  CC [M]  drivers/message/fusion/mptspi.o
  CC [M]  drivers/ata/pata_parport/bpck6.o
  CC [M]  drivers/cxl/core/acpi.o
  LD [M]  drivers/scsi/libsas/libsas.o
  CC      drivers/nvdimm/dax_devs.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_pci.o
  CC [M]  drivers/cxl/core/trace.o
  CC      drivers/scsi/scsi_ioctl.o
  CC [M]  drivers/message/fusion/mptfc.o
  CC      drivers/nvme/host/auth.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_ctl.o
  CC      lib/percpu_counter.o
  CC      mm/numa_memblks.o
  CC [M]  drivers/tty/n_gsm.o
  CC      drivers/acpi/pci_root.o
  CC      drivers/acpi/acpica/utxfinit.o
  AR      drivers/gpu/drm/mxsfb/built-in.a
  CC      drivers/acpi/pci_link.o
  CC [M]  drivers/scsi/isci/remote_node_context.o
  CC [M]  net/netfilter/nf_tables_trace.o
  UPD     kernel/config_data
  LD [M]  drivers/net/phy/realtek/realtek.o
  CC [M]  drivers/scsi/isci/remote_node_table.o
  CC      fs/super.o
  CC [M]  drivers/char/tlclk.o
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
  CC      drivers/base/firmware.o
  CC [M]  drivers/regulator/mc13892-regulator.o
  CC      drivers/nvdimm/security.o
  CC      lib/iommu-helper.o
  CC      drivers/nvdimm/e820.o
  CC [M]  fs/nfs/proc.o
  LD [M]  drivers/misc/sgi-gru/gru.o
  CC [M]  drivers/misc/c2port/core.o
  CC      kernel/stop_machine.o
  CC [M]  fs/nfs/nfs2xdr.o
  CC [M]  drivers/regulator/mc13xxx-regulator-core.o
  CC      drivers/acpi/acpica/utxferror.o
  CC [M]  drivers/cxl/pmem.o
  CC      fs/char_dev.o
  CC [M]  drivers/spi/spi-axi-spi-engine.o
  CC [M]  net/ipv6/esp6.o
  LD [M]  drivers/net/phy/aquantia/aquantia.o
  CC      drivers/net/phy/mdio-boardinfo.o
  CC [M]  drivers/message/fusion/mptsas.o
  CC [M]  drivers/net/mdio/mdio-bcm-unimac.o
  AR      drivers/net/pcs/built-in.a
  CC [M]  drivers/tty/moxa.o
  CC [M]  drivers/nvme/target/tcp.o
  CC [M]  net/bridge/br_netfilter_ipv6.o
  CC      fs/stat.o
  LD [M]  net/sunrpc/sunrpc.o
  CC      fs/btrfs/tree-checker.o
  CC [M]  drivers/nvdimm/pmem.o
  CC [M]  drivers/tty/mxser.o
  CC [M]  net/netfilter/nft_immediate.o
  CC      drivers/mfd/max77693.o
  CC [M]  fs/smb/client/reparse.o
  CC      drivers/acpi/acpica/utxfmutex.o
  CC [M]  drivers/char/hangcheck-timer.o
  CC      lib/fault-inject.o
  CC [M]  drivers/cxl/security.o
  CC [M]  drivers/message/fusion/mptctl.o
  CC [M]  drivers/scsi/isci/unsolicited_frame_control.o
  CC      mm/balloon_compaction.o
  AR      drivers/block/built-in.a
  CC [M]  drivers/regulator/mp8859.o
  CC [M]  drivers/scsi/isci/port_config.o
  CC      drivers/nvme/host/pci.o
  CC [M]  drivers/regulator/mt6311-regulator.o
  CC      drivers/base/init.o
  CC      net/ipv4/tcp_bpf.o
  CC      kernel/audit.o
  CC      drivers/acpi/acpica/dbcmds.o
  CC      drivers/ata/libata-pmp.o
  CC [M]  drivers/misc/altera-stapl/altera-jtag.o
  CC [M]  drivers/misc/vmw_vmci/vmci_context.o
  CC [M]  drivers/misc/mei/hdcp/mei_hdcp.o
  CC [M]  drivers/cxl/core/region.o
  CC [M]  drivers/misc/mei/pxp/mei_pxp.o
  CC [M]  drivers/spi/spi-bitbang.o
  CC [M]  drivers/misc/c2port/c2port-duramar2150.o
  CC [M]  drivers/net/mdio/mdio-bitbang.o
  CC      drivers/net/phy/stubs.o
  AR      drivers/char/built-in.a
  CC [M]  drivers/misc/genwqe/card_base.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_reg_print.o
  CC      net/ipv4/udp_bpf.o
  CC [M]  fs/smb/client/xattr.o
  CC [M]  drivers/misc/altera-stapl/altera-comp.o
  CC [M]  drivers/misc/genwqe/card_dev.o
  CC [M]  fs/nfs/nfs3super.o
  CC      drivers/mfd/max77843.o
  CC      fs/btrfs/space-info.o
  CC      drivers/mfd/max8925-core.o
  CC      drivers/acpi/acpica/dbconvert.o
  CC [M]  fs/nfs/nfs3client.o
  CC [M]  drivers/misc/vmw_vmci/vmci_datagram.o
  CC      drivers/base/map.o
  CC      lib/error-inject.o
  CC      drivers/scsi/scsicam.o
  CC      fs/btrfs/block-rsv.o
  CC [M]  drivers/nvdimm/btt.o
  CC [M]  drivers/regulator/mt6315-regulator.o
  CC [M]  net/netfilter/nft_cmp.o
  CC [M]  drivers/misc/altera-stapl/altera.o
  CC      fs/btrfs/delalloc-space.o
  LD [M]  drivers/scsi/isci/isci.o
  CC [M]  drivers/misc/genwqe/card_ddcb.o
  CC [M]  fs/nfs/nfs3proc.o
  CC [M]  drivers/tty/nozomi.o
  CC      kernel/auditfilter.o
  LD [M]  net/bridge/bridge.o
  LD [M]  net/bridge/br_netfilter.o
  CC      drivers/acpi/acpica/dbdisply.o
  CC [M]  drivers/misc/vmw_vmci/vmci_doorbell.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_trigger_diag.o
  CC      drivers/acpi/pci_irq.o
  CC [M]  drivers/cxl/mem.o
  CC      mm/secretmem.o
  CC [M]  drivers/cxl/core/mce.o
  CC [M]  drivers/misc/echo/echo.o
  CC [M]  drivers/misc/mei/gsc_proxy/mei_gsc_proxy.o
  CC      lib/syscall.o
  LD [M]  drivers/scsi/aic7xxx/aic7xxx.o
  LD [M]  drivers/scsi/aic7xxx/aic79xx.o
  CC [M]  drivers/nvdimm/virtio_pmem.o
  CC      drivers/scsi/scsi_error.o
  CC      drivers/base/devres.o
  CC      drivers/mfd/max8925-i2c.o
  CC      fs/btrfs/block-group.o
  CC [M]  drivers/net/mdio/mdio-cavium.o
  CC [M]  drivers/regulator/mt6323-regulator.o
  CC      drivers/acpi/acpica/dbexec.o
  CC [M]  drivers/spi/spi-butterfly.o
  LD [M]  drivers/nvme/target/nvmet.o
  LD [M]  drivers/nvme/target/nvme-loop.o
  CC [M]  drivers/regulator/mt6331-regulator.o
  LD [M]  drivers/nvme/target/nvmet-fc.o
  LD [M]  drivers/nvme/target/nvmet-tcp.o
  CC      drivers/ata/libata-acpi.o
  CC [M]  drivers/misc/mei/init.o
  CC [M]  drivers/misc/mei/hbm.o
  CC      drivers/acpi/acpi_apd.o
  CC [M]  drivers/nvme/host/fabrics.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_dev.o
  AR      drivers/message/built-in.a
  CC [M]  net/netfilter/nft_range.o
  CC [M]  drivers/misc/uacce/uacce.o
  CC      fs/btrfs/discard.o
  CC      drivers/net/phy/mdio_devres.o
  CC [M]  drivers/regulator/mt6332-regulator.o
  CC [M]  drivers/misc/genwqe/card_sysfs.o
  CC      lib/dynamic_debug.o
  CC [M]  net/ipv6/esp6_offload.o
  AR      drivers/net/ethernet/broadcom/built-in.a
  CC [M]  drivers/net/ethernet/broadcom/b44.o
  CC      drivers/acpi/acpica/dbhistry.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_warpdrive.o
  CC [M]  drivers/net/ethernet/intel/libeth/rx.o
  CC [M]  net/netfilter/nft_bitwise.o
  CC [M]  drivers/net/ethernet/intel/libie/rx.o
  CC [M]  fs/smb/client/cifs_spnego.o
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_main.o
  CC      drivers/net/phy/phy.o
  CC      drivers/net/phy/phy-c45.o
  CC [M]  drivers/misc/vmw_vmci/vmci_driver.o
  CC      mm/userfaultfd.o
  CC [M]  drivers/misc/vmw_vmci/vmci_event.o
  CC      drivers/base/attribute_container.o
  CC [M]  drivers/tty/ttynull.o
  CC [M]  drivers/spi/spi-cadence.o
  CC      drivers/acpi/acpi_platform.o
  CC [M]  fs/nfs/nfs3xdr.o
  CC      mm/page_idle.o
  CC [M]  drivers/misc/mei/interrupt.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_debugfs.o
  CC      fs/exec.o
  CC [M]  drivers/misc/mei/client.o
  CC [M]  drivers/misc/altera-stapl/altera-lpt.o
  CC [M]  drivers/misc/genwqe/card_debugfs.o
  CC      drivers/acpi/acpica/dbinput.o
  CC      kernel/auditsc.o
  CC      net/ipv4/cipso_ipv4.o
  CC      fs/btrfs/reflink.o
  CC [M]  drivers/regulator/mt6357-regulator.o
  CC [M]  drivers/net/ethernet/intel/e1000e/82571.o
  CC [M]  drivers/net/ethernet/broadcom/tg3.o
  CC [M]  drivers/tty/rpmsg_tty.o
  CC [M]  drivers/net/mdio/mdio-gpio.o
  CC      drivers/mfd/max8997.o
  LD [M]  drivers/misc/altera-stapl/altera-stapl.o
  CC [M]  net/netfilter/nft_byteorder.o
  CC [M]  drivers/cxl/pci.o
  CC [M]  drivers/net/mdio/mdio-mscc-miim.o
  AR      drivers/cxl/core/built-in.a
  AR      drivers/net/mctp/built-in.a
  CC [M]  drivers/nvdimm/nd_virtio.o
  CC      drivers/base/transport_class.o
  CC [M]  drivers/net/mctp/mctp-serial.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_msg.o
  CC      lib/errname.o
  CC      drivers/ata/libata-zpodd.o
  CC      drivers/acpi/acpica/dbmethod.o
  CC [M]  drivers/misc/genwqe/card_utils.o
  LD [M]  drivers/cxl/core/cxl_core.o
  CC [M]  drivers/misc/vmw_vmci/vmci_guest.o
  LD [M]  drivers/scsi/mpt3sas/mpt3sas.o
  CC [M]  fs/smb/client/dfs_cache.o
  CC      drivers/mfd/max8997-irq.o
  CC      fs/pipe.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_sg.o
  CC [M]  drivers/spi/spi-ch341.o
  CC [M]  fs/smb/client/dfs.o
  CC [M]  net/ipv6/ipcomp6.o
  CC      drivers/base/topology.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_tty.o
  CC [M]  drivers/net/bonding/bond_main.o
  CC [M]  drivers/spi/spi-cs42l43.o
  CC      drivers/scsi/scsi_lib.o
  CC [M]  drivers/regulator/mt6358-regulator.o
  LD [M]  drivers/net/ethernet/intel/libie/libie.o
  AR      drivers/tty/built-in.a
  CC [M]  drivers/net/bonding/bond_3ad.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.o
  CC      fs/namei.o
  CC [M]  drivers/nvme/host/fc.o
  CC      drivers/acpi/acpica/dbnames.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.o
  CC [M]  drivers/net/mctp/mctp-i3c.o
  LD [M]  drivers/net/ethernet/intel/libeth/libeth.o
  CC      drivers/mfd/max8998.o
  CC [M]  drivers/net/ipvlan/ipvlan_core.o
  CC [M]  drivers/net/ipvlan/ipvlan_main.o
  CC [M]  net/netfilter/nft_payload.o
  CC      fs/btrfs/subpage.o
  LD [M]  drivers/cxl/cxl_port.o
  CC      drivers/ata/libata-pata-timings.o
  LD [M]  drivers/cxl/cxl_acpi.o
  LD [M]  drivers/cxl/cxl_pmem.o
  LD [M]  drivers/cxl/cxl_mem.o
  LD [M]  drivers/cxl/cxl_pci.o
  AR      drivers/cxl/built-in.a
  CC [M]  drivers/misc/mei/main.o
  CC      kernel/audit_watch.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_main.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_csr.o
  AR      drivers/net/ethernet/meta/built-in.a
  CC [M]  drivers/net/ethernet/intel/igb/igb_ethtool.o
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_hw.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_debugfs.o
  CC [M]  drivers/net/ethernet/intel/e1000e/ich8lan.o
  CC      drivers/acpi/acpi_pnp.o
  CC      drivers/base/container.o
  LD [M]  drivers/misc/bcm-vk/bcm_vk.o
  CC      lib/nlattr.o
  CC      drivers/acpi/acpica/dbobject.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_devlink.o
  CC [M]  fs/nfs/nfs3acl.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_ethtool.o
  LD [M]  drivers/nvdimm/nd_pmem.o
  CC      drivers/net/phy/phy-core.o
  LD [M]  drivers/nvdimm/nd_btt.o
  AR      drivers/nvdimm/built-in.a
  LD [M]  drivers/misc/genwqe/genwqe_card.o
  CC [M]  drivers/regulator/mt6359-regulator.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_82575.o
  CC [M]  drivers/net/mdio/mdio-mvusb.o
  AR      drivers/net/ethernet/realtek/built-in.a
  CC [M]  drivers/net/ethernet/realtek/8139cp.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_main.o
  CC [M]  drivers/spi/spi-dln2.o
  CC      mm/usercopy.o
  CC [M]  net/ipv6/xfrm6_tunnel.o
  CC [M]  drivers/net/ethernet/intel/igbvf/vf.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_mac.o
  CC      net/ipv4/xfrm4_policy.o
  CC [M]  drivers/misc/vmw_vmci/vmci_handle_array.o
  CC      drivers/acpi/acpica/dbstats.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_i225.o
  CC      drivers/base/property.o
  CC      net/ipv4/xfrm4_state.o
  CC      drivers/acpi/power.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_base.o
  CC [M]  drivers/net/bonding/bond_alb.o
  CC [M]  drivers/net/mdio/mdio-thunder.o
  CC      drivers/mfd/max8998-irq.o
  CC [M]  drivers/misc/vmw_vmci/vmci_host.o
  CC      fs/btrfs/tree-mod-log.o
  CC [M]  fs/smb/client/netlink.o
  CC [M]  drivers/net/bonding/bond_sysfs.o
  CC [M]  drivers/regulator/mt6360-regulator.o
  CC      drivers/scsi/constants.o
  CC [M]  net/netfilter/nft_lookup.o
  CC      drivers/net/phy/phy_device.o
  CC      kernel/audit_fsnotify.o
  CC      drivers/acpi/acpica/dbutils.o
  CC [M]  drivers/spi/spi-dw-core.o
  CC      drivers/scsi/scsi_lib_dma.o
  CC      drivers/ata/ahci.o
  CC [M]  drivers/misc/mei/dma-ring.o
  CC [M]  drivers/net/ethernet/intel/igbvf/mbx.o
  CC [M]  drivers/net/ipvlan/ipvlan_l3s.o
  CC      drivers/misc/sram.o
  CC      fs/fcntl.o
  CC [M]  fs/nfs/nfs4proc.o
  CC [M]  drivers/net/ethernet/intel/e1000e/80003es2lan.o
  CC      drivers/mfd/adp5520.o
  CC      mm/memremap.o
  CC      kernel/audit_tree.o
  CC      drivers/acpi/acpica/dbxface.o
  CC [M]  drivers/net/team/team_core.o
  CC [M]  net/ipv6/tunnel6.o
  CC [M]  drivers/misc/vmw_vmci/vmci_queue_pair.o
  CC      drivers/mfd/tps6586x.o
  CC      net/ipv4/xfrm4_input.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_fw.o
  CC      mm/hmm.o
  CC [M]  drivers/regulator/mt6370-regulator.o
  AR      drivers/net/mdio/built-in.a
  CC      drivers/ata/libahci.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_main.o
  CC [M]  drivers/net/ethernet/intel/igbvf/ethtool.o
  CC [M]  drivers/net/ethernet/realtek/8139too.o
  CC [M]  drivers/misc/mei/bus.o
  CC      lib/cpu_rmap.o
  CC [M]  net/ipv6/mip6.o
  CC      drivers/scsi/scsi_scan.o
  CC [M]  drivers/regulator/mt6397-regulator.o
  CC [M]  fs/smb/client/cifs_swn.o
  CC      drivers/acpi/event.o
  CC      fs/btrfs/extent-io-tree.o
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_ethtool.o
  CC [M]  net/netfilter/nft_dynset.o
  CC [M]  drivers/net/ethernet/intel/e1000e/mac.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_mac.o
  CC      fs/ioctl.o
  CC      kernel/kprobes.o
  CC [M]  drivers/nvme/host/tcp.o
  CC [M]  drivers/regulator/qcom-labibb-regulator.o
  LD [M]  drivers/nvme/host/nvme-fabrics.o
  LD [M]  drivers/nvme/host/nvme-fc.o
  CC      drivers/acpi/acpica/rsdump.o
  CC      mm/memfd.o
  CC      drivers/base/cacheinfo.o
  CC [M]  fs/smb/client/fscache.o
  CC [M]  drivers/net/ipvlan/ipvtap.o
  CC      fs/btrfs/fs.o
  CC      drivers/mfd/tps65090.o
  CC [M]  drivers/spi/spi-dw-dma.o
  CC      fs/btrfs/messages.o
  CC      lib/closure.o
  CC [M]  drivers/misc/vmw_vmci/vmci_resource.o
  CC      net/ipv4/xfrm4_output.o
  AR      drivers/acpi/acpica/built-in.a
  CC [M]  drivers/misc/ad525x_dpot.o
  CC [M]  net/netfilter/nft_meta.o
  CC [M]  drivers/misc/mei/bus-fixup.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_hw_stats.o
  CC [M]  drivers/net/ethernet/intel/igbvf/netdev.o
  GEN     drivers/scsi/scsi_devinfo_tbl.c
  CC [M]  drivers/net/vmxnet3/vmxnet3_drv.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_nvm.o
  CC [M]  drivers/regulator/qcom_spmi-regulator.o
  CC [M]  drivers/net/vmxnet3/vmxnet3_ethtool.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_nvm.o
  CC [M]  drivers/misc/vmw_vmci/vmci_route.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/vf.o
  CC [M]  drivers/regulator/qcom_usb_vbus-regulator.o
  CC      drivers/base/swnode.o
  CC      net/ipv4/xfrm4_protocol.o
  CC [M]  drivers/net/ethernet/intel/e1000e/manage.o
  CC      mm/ptdump.o
  CC      drivers/net/phy/linkmode.o
  CC [M]  drivers/regulator/palmas-regulator.o
  CC [M]  drivers/net/ethernet/realtek/r8169_main.o
  CC [M]  drivers/net/vmxnet3/vmxnet3_xdp.o
  CC [M]  drivers/net/bonding/bond_sysfs_slave.o
  CC      drivers/mfd/aat2870-core.o
  CC [M]  net/ipv6/ip6_vti.o
  CC [M]  drivers/misc/ad525x_dpot-i2c.o
  LD [M]  drivers/net/ipvlan/ipvlan.o
  CC      fs/btrfs/bio.o
  CC      drivers/acpi/evged.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_phy.o
  CC [M]  drivers/net/ethernet/intel/e1000e/nvm.o
  CC [M]  fs/nfs/nfs4xdr.o
  CC      drivers/base/faux.o
  CC      drivers/scsi/scsi_devinfo.o
  LD [M]  drivers/misc/vmw_vmci/vmw_vmci.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_phy.o
  CC [M]  drivers/misc/mei/debugfs.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_hwmon.o
  CC [M]  fs/smb/client/smb1ops.o
  CC [M]  drivers/net/ethernet/realtek/r8169_firmware.o
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_param.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_irq.o
  CC      lib/dynamic_queue_limits.o
  CC [M]  drivers/net/ethernet/realtek/r8169_phy_config.o
  CC      drivers/net/phy/phy_link_topology.o
  CC      drivers/ata/ahci_platform.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_common.o
  CC [M]  drivers/spi/spi-dw-mmio.o
  CC      mm/page_reporting.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_main.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_mac.o
  CC      drivers/ata/libahci_platform.o
  CC [M]  drivers/net/team/team_nl.o
  CC      drivers/acpi/sysfs.o
  CC      kernel/fail_function.o
  CC [M]  drivers/misc/mei/mei-trace.o
  CC [M]  drivers/net/ethernet/intel/e1000e/phy.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/mbx.o
  CC      drivers/mfd/intel-lpss.o
  AR      drivers/nvme/host/built-in.a
  CC      drivers/scsi/scsi_netlink.o
  CC [M]  fs/smb/client/cifssmb.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_diag.o
  CC      lib/glob.o
  CC [M]  drivers/net/bonding/bond_debugfs.o
  CC [M]  drivers/regulator/pca9450-regulator.o
  CC [M]  drivers/misc/ad525x_dpot-spi.o
  CC      kernel/hung_task.o
  LD [M]  drivers/nvme/host/nvme-tcp.o
  AR      drivers/nvme/built-in.a
  CC      fs/readdir.o
  CC      drivers/mfd/intel-lpss-pci.o
  CC [M]  drivers/net/ethernet/intel/e1000e/param.o
  CC      drivers/mfd/intel-lpss-acpi.o
  CC [M]  drivers/spi/spi-dw-pci.o
  CC      drivers/base/auxiliary.o
  CC      drivers/ata/ata_piix.o
  CC      drivers/acpi/property.o
  CC [M]  drivers/regulator/pv88060-regulator.o
  CC [M]  net/netfilter/nft_rt.o
  LD [M]  drivers/net/ethernet/intel/igbvf/igbvf.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_ethtool.o
  CC      fs/btrfs/lru_cache.o
  LD [M]  drivers/net/ethernet/intel/e1000/e1000.o
  CC [M]  drivers/net/team/team_mode_broadcast.o
  CC      fs/select.o
  CC      drivers/base/devtmpfs.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_mbx.o
  CC      drivers/base/isa.o
  CC [M]  drivers/net/ethernet/realtek/r8169_leds.o
  CC      drivers/ata/pata_sis.o
  CC [M]  drivers/net/ethernet/intel/e1000e/ethtool.o
  CC      net/ipv4/tcp_ao.o
  CC [M]  drivers/regulator/pv88080-regulator.o
  CC [M]  net/ipv6/sit.o
  CC [M]  drivers/net/bonding/bond_netlink.o
  CC      mm/bootmem_info.o
  CC [M]  drivers/misc/dummy-irq.o
  CC      drivers/net/phy/phy_package.o
  CC [M]  drivers/spi/spi-gpio.o
  AR      drivers/net/ethernet/intel/built-in.a
  CC [M]  drivers/net/bonding/bond_options.o
  CC      drivers/mfd/palmas.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/ethtool.o
  CC      lib/digsig.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_netdev.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_ethtool.o
  CC [M]  net/netfilter/nft_exthdr.o
  CC      fs/btrfs/raid-stripe-tree.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_pci.o
  CC      drivers/net/phy/phy_caps.o
  CC      drivers/acpi/debugfs.o
  CC [M]  drivers/net/ethernet/intel/e1000e/netdev.o
  CC [M]  drivers/misc/mei/pci-me.o
  CC      drivers/net/phy/mdio_bus.o
  CC [M]  fs/nfs/nfs4state.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_i210.o
  CC [M]  drivers/net/team/team_mode_roundrobin.o
  CC      lib/strncpy_from_user.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_ptp.o
  CC      drivers/scsi/scsi_sysctl.o
  LD [M]  drivers/net/vmxnet3/vmxnet3.o
  CC [M]  drivers/net/bonding/bond_procfs.o
  CC [M]  net/netfilter/nft_last.o
  CC      net/ipv4/bpf_tcp_ca.o
  CC [M]  drivers/regulator/pv88090-regulator.o
  CC      mm/execmem.o
  CC      kernel/watchdog.o
  CC      drivers/base/node.o
  CC [M]  fs/nfs/nfs4renewd.o
  CC      drivers/scsi/scsi_proc.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_adminq.o
  CC [M]  fs/smb/client/cifs_spnego_negtokeninit.asn1.o
  LD [M]  drivers/net/ethernet/realtek/r8169.o
  CC      fs/btrfs/fiemap.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_phylink.o
  CC [M]  drivers/spi/spi-intel.o
  CC [M]  drivers/net/ethernet/intel/e100.o
  CC      drivers/ata/ata_generic.o
  CC [M]  drivers/net/xen-netback/netback.o
  CC [M]  drivers/misc/mei/hw-me.o
  CC [M]  fs/nfs/nfs4super.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_rpc.o
  CC      drivers/acpi/acpi_lpat.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.o
  CC      mm/shmem_quota.o
  CC      drivers/mfd/rc5t583.o
  CC      drivers/acpi/acpi_fpdt.o
  CC      kernel/watchdog_perf.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_ptp.o
  CC [M]  fs/nfs/nfs4file.o
  CC [M]  drivers/regulator/pwm-regulator.o
  CC [M]  drivers/net/team/team_mode_random.o
  CC [M]  drivers/regulator/tps51632-regulator.o
  CC      lib/strnlen_user.o
  CC [M]  drivers/net/ethernet/intel/e1000e/ptp.o
  CC      mm/pt_reclaim.o
  CC      drivers/scsi/scsi_debugfs.o
  CC [M]  net/netfilter/nft_counter.o
  CC [M]  net/ipv6/ip6_tunnel.o
  CC [M]  fs/nfs/delegation.o
  LD [M]  drivers/net/bonding/bonding.o
  CC [M]  drivers/regulator/pcap-regulator.o
  CC      fs/btrfs/direct-io.o
  CC [M]  drivers/ata/acard-ahci.o
  CC [M]  drivers/net/team/team_mode_activebackup.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_82599.o
  CC [M]  drivers/ata/sata_inic162x.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/ipsec.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_82598.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_dump.o
  CC      fs/btrfs/acl.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_tsn.o
  CC      drivers/mfd/rc5t583-irq.o
  CC [M]  drivers/misc/ics932s401.o
  CC      drivers/base/memory.o
  CC [M]  net/ipv4/ip_tunnel.o
  CC [M]  drivers/spi/spi-intel-pci.o
  CC      kernel/seccomp.o
  CC      drivers/scsi/scsi_trace.o
  CC [M]  drivers/net/usb/catc.o
  CC      drivers/net/phy/mdio_device.o
  CC [M]  drivers/ata/sata_sil24.o
  CC [M]  mm/hwpoison-inject.o
  CC      drivers/acpi/acpi_lpit.o
  CC [M]  drivers/net/usb/kaweth.o
  CC [M]  drivers/net/usb/pegasus.o
  CC [M]  drivers/net/xen-netback/xenbus.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_xdp.o
  CC      lib/net_utils.o
  CC [M]  fs/smb/client/asn1.o
  CC [M]  fs/nfs/nfs4idmap.o
  CC [M]  net/ipv4/ipip.o
  CC      drivers/scsi/scsi_logging.o
  CC [M]  drivers/regulator/raa215300.o
  CC [M]  net/netfilter/nft_objref.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_hwmon.o
  CC      drivers/mfd/syscon.o
  CC [M]  drivers/net/usb/rtl8150.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_common.o
  CC      fs/dcache.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_time.o
  CC [M]  drivers/net/team/team_mode_loadbalance.o
  CC      drivers/base/module.o
  CC [M]  drivers/spi/spi-intel-platform.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_hmc.o
  CC [M]  drivers/net/hyperv/netvsc_drv.o
  CC      fs/btrfs/zoned.o
  CC [M]  drivers/spi/spi-lantiq-ssc.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_phy.o
  CC [M]  drivers/ata/sata_dwc_460ex.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_xsk.o
  CC [M]  drivers/net/xen-netback/interface.o
  AR      mm/built-in.a
  CC      lib/sg_pool.o
  CC [M]  drivers/misc/mei/gsc-me.o
  CC      drivers/mfd/as3711.o
  CC      drivers/mfd/intel_soc_pmic_crc.o
  CC      lib/memregion.o
  CC      drivers/mfd/intel_soc_pmic_chtwc.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_tlv.o
  CC [M]  drivers/spi/spi-ljca.o
  CC      drivers/scsi/scsi_pm.o
  CC      drivers/acpi/acpi_watchdog.o
  CC [M]  drivers/regulator/rc5t583-regulator.o
  CC [M]  drivers/net/ethernet/meta/fbnic/fbnic_txrx.o
  CC [M]  drivers/net/thunderbolt/main.o
  CC [M]  drivers/net/usb/r8152.o
  CC      drivers/base/auxiliary_sysfs.o
  CC      drivers/base/hypervisor.o
  CC [M]  drivers/spi/spi-lm70llp.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_leds.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.o
  CC [M]  drivers/net/thunderbolt/trace.o
  CC      drivers/net/loopback.o
  CC [M]  net/netfilter/nft_inner.o
  CC      drivers/net/phy/swphy.o
  CC [M]  drivers/net/usb/lan78xx.o
  LD [M]  fs/smb/client/cifs.o
  CC      fs/inode.o
  CC      drivers/net/netconsole.o
  CC [M]  drivers/ata/ahci_dwc.o
  CC      drivers/base/soc.o
  CC      kernel/relay.o
  CC [M]  net/ipv6/ip6_gre.o
  CC [M]  drivers/regulator/rt4801-regulator.o
  CC [M]  drivers/misc/mei/pci-txe.o
  CC      kernel/utsname_sysctl.o
  CC      drivers/net/netkit.o
  CC      kernel/delayacct.o
  LD [M]  drivers/net/ethernet/intel/ixgbevf/ixgbevf.o
  CC [M]  drivers/net/xen-netback/hash.o
  CC [M]  drivers/misc/tifm_core.o
  CC      drivers/acpi/prmt.o
  CC [M]  drivers/mfd/88pm800.o
  CC      drivers/net/tun.o
  LD [M]  drivers/net/team/team.o
  CC [M]  drivers/ata/pdc_adma.o
  CC      drivers/acpi/acpi_pcc.o
  CC      drivers/scsi/scsi_dh.o
  CC      lib/irq_poll.o
  CC [M]  fs/nfs/callback.o
  CC [M]  drivers/spi/spi-microchip-core.o
  CC      drivers/scsi/scsi_bsg.o
  LD [M]  drivers/net/ethernet/intel/e1000e/e1000e.o
  CC [M]  drivers/misc/mei/hw-txe.o
  CC      drivers/net/phy/phy_led_triggers.o
  LD [M]  drivers/net/ethernet/intel/igb/igb.o
  CC [M]  drivers/ata/sata_qstor.o
  CC [M]  fs/nfs/callback_xdr.o
  CC [M]  net/ipv6/fou6.o
  CC [M]  drivers/misc/tifm_7xx1.o
  CC [M]  drivers/net/hyperv/netvsc.o
  LD [M]  drivers/net/ethernet/intel/igc/igc.o
  CC      kernel/taskstats.o
  CC [M]  net/ipv4/fou_core.o
  CC [M]  net/netfilter/nft_chain_route.o
  CC      lib/stackdepot.o
  CC [M]  drivers/spi/spi-microchip-core-qspi.o
  CC [M]  drivers/regulator/rt4803.o
  CC [M]  drivers/mfd/88pm80x.o
  CC [M]  drivers/ata/sata_sx4.o
  CC      fs/attr.o
  CC      fs/btrfs/verity.o
  CC [M]  drivers/spi/spi-mxic.o
  CC      drivers/acpi/acpi_ffh.o
  CC      drivers/base/pinctrl.o
  CC      lib/ref_tracker.o
  CC [M]  drivers/net/xen-netback/rx.o
  CC      drivers/net/virtio_net.o
  CC [M]  fs/nfs/callback_proc.o
  CC [M]  net/ipv6/ip6_udp_tunnel.o
  CC      drivers/scsi/scsi_common.o
  CC      drivers/net/xen-netfront.o
  LD [M]  drivers/net/thunderbolt/thunderbolt_net.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_mbx.o
  CC [M]  drivers/mfd/88pm805.o
  CC [M]  drivers/regulator/rt4831-regulator.o
  CC [M]  fs/nfs/nfs4namespace.o
  CC [M]  drivers/regulator/rt5033-regulator.o
  CC [M]  drivers/regulator/rt5120-regulator.o
  CC [M]  drivers/spi/spi-oc-tiny.o
  CC [M]  net/ipv4/fou_nl.o
  CC [M]  net/ipv4/fou_bpf.o
  CC [M]  net/netfilter/nf_tables_offload.o
  CC [M]  drivers/misc/mei/vsc-tp.o
  CC [M]  drivers/misc/phantom.o
  CC      drivers/net/phy/mii_timestamper.o
  CC [M]  drivers/misc/bh1770glc.o
  CC      drivers/base/devcoredump.o
  CC      drivers/net/phy/fixed_phy.o
  CC [M]  drivers/regulator/rt5190a-regulator.o
  CC [M]  fs/nfs/nfs4getroot.o
  CC [M]  drivers/regulator/rt5739.o
  CC [M]  drivers/spi/spi-pci1xxxx.o
  CC      drivers/acpi/acpi_adxl.o
  CC [M]  net/netfilter/nft_set_hash.o
  CC [M]  drivers/net/hyperv/rndis_filter.o
  CC      kernel/tsacct.o
  CC      drivers/scsi/virtio_scsi.o
  LD [M]  drivers/net/ethernet/meta/fbnic/fbnic.o
  CC      lib/bootconfig.o
  CC [M]  drivers/ata/sata_mv.o
  CC [M]  fs/nfs/nfs4client.o
  CC      lib/asn1_decoder.o
  CC      lib/asn1_encoder.o
  GEN     lib/oid_registry_data.c
  CC [M]  drivers/mfd/sm501.o
  CC [M]  drivers/net/usb/asix_devices.o
  CC [M]  drivers/misc/mei/vsc-fw-loader.o
  AR      fs/btrfs/built-in.a
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_lan_hmc.o
  CC [M]  fs/nfs/nfs4session.o
  CC      lib/ucs2_string.o
  CC [M]  drivers/net/usb/asix_common.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_nvm.o
  CC [M]  drivers/mfd/bcm590xx.o
  CC [M]  drivers/net/usb/ax88172a.o
  CC      kernel/tracepoint.o
  CC      fs/bad_inode.o
  CC      drivers/acpi/ac.o
  LD [M]  drivers/net/xen-netback/xen-netback.o
  CC      drivers/scsi/sd.o
  CC      drivers/base/platform-msi.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_x540.o
  CC [M]  net/netfilter/nft_set_bitmap.o
  CC [M]  drivers/net/usb/ax88179_178a.o
  CC [M]  drivers/regulator/rt5759-regulator.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_debugfs.o
  CC      drivers/scsi/sd_dif.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_x550.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_diag.o
  CC [M]  drivers/misc/mei/platform-vsc.o
  CC [M]  drivers/spi/spi-pxa2xx.o
  CC [M]  drivers/mfd/bd9571mwv.o
  CC      lib/ubsan.o
  CC [M]  net/netfilter/nft_set_rbtree.o
  CC      drivers/acpi/button.o
  CC      drivers/base/physical_location.o
  CC      drivers/net/net_failover.o
  CC [M]  drivers/misc/apds990x.o
  CC      kernel/latencytop.o
  CC [M]  drivers/misc/enclosure.o
  CC [M]  drivers/misc/smpro-errmon.o
  CC      drivers/scsi/sd_zbc.o
  CC [M]  drivers/net/phy/phylink.o
  CC [M]  drivers/net/hyperv/netvsc_trace.o
  CC [M]  net/ipv4/gre_demux.o
  CC [M]  drivers/regulator/rt6160-regulator.o
  CC [M]  drivers/net/usb/cdc_ether.o
  AR      net/ipv6/built-in.a
  CC      fs/file.o
  CC [M]  drivers/ata/sata_nv.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_lib.o
  CC [M]  net/netfilter/nft_set_pipapo.o
  CC [M]  drivers/net/hyperv/netvsc_bpf.o
  CC [M]  drivers/net/dummy.o
  CC [M]  net/netfilter/nft_set_pipapo_avx2.o
  CC [M]  fs/nfs/dns_resolve.o
  CC      fs/filesystems.o
  CC [M]  net/ipv4/ip_gre.o
  CC      kernel/irq_work.o
  LD [M]  drivers/misc/mei/mei.o
  CC      drivers/base/trace.o
  LD [M]  drivers/misc/mei/mei-me.o
  CC [M]  drivers/misc/smpro-misc.o
  LD [M]  drivers/misc/mei/mei-gsc.o
  LD [M]  drivers/misc/mei/mei-txe.o
  CC      lib/sbitmap.o
  LD [M]  drivers/misc/mei/mei-vsc-hw.o
  LD [M]  drivers/misc/mei/mei-vsc.o
  CC [M]  drivers/net/ifb.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_txrx.o
  CC [M]  net/netfilter/nft_ct_fast.o
  CC [M]  net/netfilter/nft_compat.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_ptp.o
  CC      drivers/scsi/sr.o
  CC [M]  drivers/regulator/rt6190-regulator.o
  CC [M]  drivers/mfd/cros_ec_dev.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_ptp.o
  CC [M]  net/netfilter/nft_connlimit.o
  CC [M]  drivers/net/phy/ax88796b.o
  CC      lib/group_cpus.o
  CC [M]  drivers/ata/sata_promise.o
  CC      drivers/acpi/fan_core.o
  CC [M]  drivers/misc/hpilo.o
  CC      lib/fw_table.o
  CC [M]  drivers/net/phy/bcm7xxx.o
  CC      kernel/static_call.o
  CC      drivers/scsi/sr_ioctl.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_xsk.o
  CC [M]  net/ipv4/udp_tunnel_core.o
  CC [M]  net/netfilter/nft_numgen.o
  CC [M]  drivers/spi/spi-pxa2xx-dma.o
  CC [M]  fs/nfs/nfs4trace.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_e610.o
  CC [M]  drivers/mfd/cs42l43.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_ddp.o
  AR      drivers/base/built-in.a
  CC [M]  drivers/net/macsec.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_client.o
  CC [M]  net/ipv4/udp_tunnel_nic.o
  CC [M]  drivers/regulator/rt6245-regulator.o
  CC [M]  drivers/mfd/cs42l43-i2c.o
  CC      fs/namespace.o
  CC [M]  drivers/ata/sata_sil.o
  CC [M]  drivers/net/usb/cdc_eem.o
  LD [M]  drivers/net/hyperv/hv_netvsc.o
  CC [M]  drivers/spi/spi-pxa2xx-platform.o
  CC      drivers/acpi/fan_attr.o
  CC [M]  net/netfilter/nft_ct.o
  CC      fs/seq_file.o
  CC [M]  drivers/ata/sata_sis.o
  CC [M]  drivers/mfd/lp873x.o
  CC [M]  drivers/ata/sata_svw.o
  CC [M]  drivers/net/phy/bcm87xx.o
  CC      fs/xattr.o
  CC [M]  drivers/mfd/tqmx86.o
  CC [M]  drivers/net/phy/bcm-phy-lib.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb.o
  CC      fs/libfs.o
  CC [M]  fs/nfs/nfs4sysctl.o
  CC [M]  drivers/misc/apds9802als.o
  CC [M]  drivers/net/usb/dm9601.o
  CC [M]  drivers/net/amt.o
  CC      drivers/scsi/sr_vendor.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.o
  CC [M]  drivers/net/usb/sr9700.o
  CC [M]  drivers/mfd/arizona-core.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_xsk.o
  CC [M]  lib/crc7.o
  CC      kernel/static_call_inline.o
  CC      drivers/scsi/sg.o
  CC      fs/fs-writeback.o
  CC [M]  drivers/regulator/rtmv20-regulator.o
  CC [M]  drivers/mfd/arizona-irq.o
  CC      drivers/acpi/fan_hwmon.o
  CC      kernel/user-return-notifier.o
  CC [M]  drivers/spi/spi-pxa2xx-pci.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb_82598.o
  CC      fs/pnode.o
  CC [M]  lib/crc8.o
  CC [M]  drivers/net/usb/sr9800.o
  CC [M]  lib/bch.o
  CC [M]  drivers/net/macvlan.o
  CC [M]  net/netfilter/nft_flow_offload.o
  CC [M]  fs/nfs/pnfs.o
  CC      fs/splice.o
  CC [M]  drivers/ata/sata_uli.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb_82599.o
  CC [M]  drivers/regulator/rtq2134-regulator.o
  CC [M]  net/ipv4/ip_vti.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_devlink.o
  CC      fs/sync.o
  CC [M]  drivers/misc/isl29003.o
  CC [M]  drivers/regulator/rtq6752-regulator.o
  CC [M]  drivers/mfd/wm5102-tables.o
  CC      drivers/acpi/pci_slot.o
  CC [M]  drivers/net/macvtap.o
  CC [M]  drivers/net/phy/bcm-phy-ptp.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb_nl.o
  CC      kernel/padata.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_sysfs.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_dcb.o
  CC [M]  drivers/spi/spi-sc18is602.o
  CC [M]  drivers/net/usb/smsc75xx.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_dcb_nl.o
  CC [M]  drivers/net/mii.o
  CC [M]  drivers/scsi/raid_class.o
  CC      kernel/jump_label.o
  CC [M]  drivers/net/usb/smsc95xx.o
  CC [M]  drivers/net/phy/broadcom.o
  CC [M]  drivers/scsi/scsi_transport_spi.o
  CC [M]  drivers/mfd/wm5110-tables.o
  CC [M]  drivers/misc/isl29020.o
  CC      drivers/acpi/processor_driver.o
  CC [M]  drivers/ata/sata_via.o
  CC [M]  fs/nfs/pnfs_dev.o
  CC [M]  drivers/spi/spi-sifive.o
  CC [M]  drivers/mfd/wm8997-tables.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_debugfs.o
  CC [M]  drivers/regulator/rtq2208-regulator.o
  CC [M]  drivers/scsi/scsi_transport_fc.o
  CC [M]  drivers/ata/sata_vsc.o
  CC [M]  drivers/spi/spi-tle62x0.o
  CC [M]  drivers/regulator/sky81452-regulator.o
  CC [M]  drivers/spi/spi-xcomm.o
  CC      kernel/context_tracking.o
  CC [M]  drivers/net/mdio.o
  CC      drivers/acpi/processor_thermal.o
  CC [M]  drivers/scsi/scsi_transport_iscsi.o
  CC [M]  net/ipv4/ah4.o
  CC [M]  net/netfilter/nft_limit.o
  CC [M]  drivers/net/phy/dp83640.o
  CC [M]  lib/ts_kmp.o
  CC [M]  drivers/net/tap.o
  CC [M]  drivers/scsi/scsi_transport_sas.o
  CC [M]  drivers/misc/tsl2550.o
  CC      kernel/iomem.o
  CC [M]  drivers/mfd/wm8998-tables.o
  CC [M]  drivers/ata/pata_ali.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_ipsec.o
  CC      kernel/rseq.o
  CC [M]  drivers/net/veth.o
  CC [M]  drivers/net/phy/lxt.o
  CC [M]  drivers/regulator/slg51000-regulator.o
  CC [M]  drivers/spi/spi-xilinx.o
  CC      drivers/acpi/processor_idle.o
  CC      fs/utimes.o
  CC [M]  net/ipv4/esp4.o
  CC [M]  lib/ts_bm.o
  CC      drivers/acpi/processor_throttling.o
  CC      drivers/acpi/processor_perflib.o
  CC [M]  lib/ts_fsm.o
  CC [M]  net/ipv4/esp4_offload.o
  CC [M]  lib/notifier-error-inject.o
  CC      kernel/watch_queue.o
  CC [M]  drivers/mfd/cs47l24-tables.o
  CC [M]  drivers/net/phy/microchip.o
  CC [M]  drivers/net/bareudp.o
  CC [M]  drivers/scsi/scsi_transport_srp.o
  CC      drivers/acpi/container.o
  CC      fs/d_path.o
  CC [M]  net/ipv4/ipcomp.o
  CC [M]  drivers/net/usb/gl620a.o
  CC [M]  net/netfilter/nft_nat.o
  LD [M]  drivers/net/ethernet/intel/i40e/i40e.o
  CC      fs/stack.o
  CC [M]  net/netfilter/nft_queue.o
  CC      drivers/acpi/thermal_lib.o
  CC [M]  drivers/misc/ds1682.o
  CC [M]  drivers/ata/pata_amd.o
  CC [M]  drivers/mfd/arizona-i2c.o
  CC [M]  lib/pm-notifier-error-inject.o
  CC [M]  drivers/spi/spi-zynqmp-gqspi.o
  CC [M]  drivers/net/phy/smsc.o
  CC      fs/fs_struct.o
  CC [M]  drivers/regulator/sy7636a-regulator.o
  CC [M]  drivers/net/usb/net1080.o
  CC [M]  drivers/misc/hmc6352.o
  CC      drivers/acpi/thermal.o
  CC [M]  drivers/mfd/arizona-spi.o
  CC [M]  drivers/regulator/tps6105x-regulator.o
  CC [M]  drivers/misc/vmw_balloon.o
  CC [M]  drivers/ata/pata_artop.o
  CC [M]  net/netfilter/nft_quota.o
  CC [M]  drivers/spi/spi-amd.o
  CC [M]  drivers/scsi/iscsi_boot_sysfs.o
  CC [M]  drivers/regulator/tps62360-regulator.o
  CC [M]  drivers/mfd/wcd934x.o
  CC [M]  fs/nfs/pnfs_nfs.o
  CHK     kernel/kheaders_data.tar.xz
  CC      fs/statfs.o
  CC [M]  fs/nfs/nfs42proc.o
  CC [M]  drivers/net/usb/plusb.o
  GEN     kernel/kheaders_data.tar.xz
  CC [M]  drivers/ata/pata_atiixp.o
  CC [M]  net/netfilter/nft_reject.o
  GZIP    kernel/config_data.gz
  LD [M]  drivers/net/ethernet/intel/ixgbe/ixgbe.o
  CC      fs/fs_pin.o
  CC [M]  lib/memory-notifier-error-inject.o
  AR      drivers/net/ethernet/built-in.a
  CC [M]  drivers/net/usb/rndis_host.o
  CC      fs/nsfs.o
  CC      kernel/configs.o
  CC [M]  fs/nfs/nfs42xattr.o
  LD [M]  fs/nfs/nfs.o
  CC [M]  drivers/misc/lattice-ecp3-config.o
  CC [M]  net/netfilter/nft_reject_inet.o
  CC      drivers/acpi/nhlt.o
  CC [M]  drivers/net/usb/cdc_subset.o
  CC [M]  drivers/misc/dw-xdata-pcie.o
  CC      drivers/acpi/acpi_memhotplug.o
  LD [M]  fs/nfs/nfsv2.o
  CC [M]  drivers/misc/xilinx_sdfec.o
  CC [M]  drivers/net/nlmon.o
  CC [M]  drivers/ata/pata_atp867x.o
  CC [M]  drivers/ata/pata_cmd64x.o
  CC [M]  net/ipv4/xfrm4_tunnel.o
  CC [M]  drivers/ata/pata_cypress.o
  CC [M]  drivers/ata/pata_efar.o
  CC [M]  net/netfilter/nft_reject_netdev.o
  LD [M]  fs/nfs/nfsv3.o
  CC [M]  lib/lru_cache.o
  CC [M]  drivers/spi/spi-slave-time.o
  CC [M]  net/netfilter/nft_tunnel.o
  CC [M]  drivers/regulator/tps65023-regulator.o
  CC [M]  drivers/net/pfcp.o
  CC [M]  drivers/mfd/wm8994-core.o
  CC [M]  net/ipv4/tunnel4.o
  CC [M]  drivers/mfd/wm8994-irq.o
  CC [M]  drivers/regulator/tps6507x-regulator.o
  CC      fs/fs_types.o
  CC [M]  drivers/net/usb/zaurus.o
  CC [M]  net/netfilter/nft_log.o
  CC [M]  drivers/net/vrf.o
  CC [M]  drivers/ata/pata_hpt366.o
  CC [M]  net/ipv4/inet_diag.o
  CC [M]  drivers/misc/tps6594-esm.o
  CC [M]  drivers/net/vsockmon.o
  CC [M]  drivers/ata/pata_hpt37x.o
  CC      fs/fs_context.o
  CC [M]  net/netfilter/nft_masq.o
  CC [M]  drivers/scsi/megaraid.o
  CC [M]  drivers/net/ntb_netdev.o
  CC [M]  drivers/misc/tps6594-pfsm.o
  CC      drivers/acpi/ioapic.o
  CC [M]  drivers/scsi/vmw_pvscsi.o
  CC [M]  drivers/net/usb/mcs7830.o
  CC [M]  drivers/regulator/tps65086-regulator.o
  AR      drivers/net/phy/built-in.a
  CC [M]  drivers/net/usb/usbnet.o
  AR      kernel/built-in.a
  CC      fs/fs_parser.o
  CC [M]  drivers/mfd/wm8994-regmap.o
  CC [M]  drivers/regulator/tps65090-regulator.o
  CC [M]  drivers/spi/spi-slave-system-control.o
  CC [M]  net/netfilter/nft_redir.o
  CC      drivers/acpi/battery.o
  CC [M]  drivers/ata/pata_hpt3x2n.o
  CC      fs/fsopen.o
  CC [M]  drivers/net/usb/int51x1.o
  CC [M]  net/netfilter/nft_hash.o
  CC      drivers/acpi/hed.o
  CC [M]  drivers/misc/nsm.o
  CC [M]  drivers/net/usb/kalmia.o
  CC [M]  drivers/scsi/xen-scsifront.o
  CC [M]  drivers/ata/pata_hpt3x3.o
  CC [M]  net/netfilter/nft_fib.o
  CC [M]  drivers/net/usb/ipheth.o
  CC [M]  drivers/ata/pata_it8213.o
  CC [M]  drivers/ata/pata_it821x.o
  CC      fs/init.o
  CC [M]  net/netfilter/nft_fib_inet.o
  CC [M]  drivers/regulator/tps6524x-regulator.o
  CC [M]  net/netfilter/nft_fib_netdev.o
  CC [M]  net/ipv4/tcp_diag.o
  CC [M]  drivers/net/usb/sierra_net.o
  AR      lib/lib.a
  CC [M]  net/ipv4/udp_diag.o
  CC      fs/kernel_read_file.o
  GEN     lib/crc32table.h
  CC [M]  drivers/regulator/tps6586x-regulator.o
  GEN     lib/crc64table.h
  CC      lib/oid_registry.o
  CC [M]  net/ipv4/raw_diag.o
  CC      fs/mnt_idmapping.o
  CC      fs/remap_range.o
  CC [M]  drivers/net/usb/cx82310_eth.o
  CC [M]  drivers/regulator/tps65910-regulator.o
  CC [M]  drivers/ata/pata_jmicron.o
  CC [M]  drivers/regulator/tps65912-regulator.o
  CC      drivers/acpi/bgrt.o
  CC [M]  drivers/net/usb/cdc_ncm.o
  CC [M]  drivers/regulator/tps65132-regulator.o
  CC [M]  net/netfilter/nft_socket.o
  LD [M]  drivers/spi/spi-dw.o
  LD [M]  drivers/spi/spi-pxa2xx-core.o
  CC [M]  drivers/mfd/madera-core.o
  AR      drivers/spi/built-in.a
  CC [M]  drivers/mfd/cs47l15-tables.o
  CC [M]  drivers/scsi/storvsc_drv.o
  CC [M]  drivers/scsi/ses.o
  CC      fs/pidfs.o
  CC [M]  net/netfilter/nft_osf.o
  CC      fs/buffer.o
  AR      drivers/misc/built-in.a
  CC [M]  net/netfilter/nft_tproxy.o
  CC [M]  drivers/scsi/scsi_debug.o
  CC [M]  drivers/regulator/tps68470-regulator.o
  CC [M]  drivers/mfd/cs47l35-tables.o
  CC [M]  drivers/ata/pata_marvell.o
  CC [M]  drivers/net/usb/huawei_cdc_ncm.o
  CC [M]  drivers/net/usb/lg-vl600.o
  CC [M]  drivers/net/usb/qmi_wwan.o
  CC [M]  drivers/regulator/twl-regulator.o
  CC      fs/mpage.o
  CC [M]  drivers/mfd/cs47l85-tables.o
  CC      drivers/acpi/cppc_acpi.o
  CC [M]  net/netfilter/nft_xfrm.o
  CC [M]  drivers/ata/pata_netcell.o
  CC [M]  drivers/regulator/twl6030-regulator.o
  CC      fs/proc_namespace.o
  CC [M]  drivers/net/usb/cdc_mbim.o
  CC      drivers/acpi/spcr.o
  CC [M]  drivers/mfd/cs47l90-tables.o
  CC [M]  drivers/ata/pata_ninja32.o
  CC      lib/crc32.o
  CC      fs/direct-io.o
  CC [M]  drivers/net/usb/ch9200.o
  CC [M]  net/netfilter/nft_synproxy.o
  LD [M]  fs/nfs/nfsv4.o
  CC [M]  drivers/regulator/wm831x-dcdc.o
  CC [M]  drivers/regulator/wm831x-isink.o
  CC      fs/eventpoll.o
  CC      fs/anon_inodes.o
  CC [M]  drivers/net/usb/aqc111.o
  CC [M]  net/netfilter/nft_chain_nat.o
  CC [M]  drivers/mfd/cs47l92-tables.o
  CC [M]  net/netfilter/nft_dup_netdev.o
  CC      drivers/acpi/acpi_dbg.o
  CC [M]  drivers/ata/pata_ns87415.o
  CC [M]  drivers/mfd/madera-i2c.o
  CC      lib/crc64.o
  CC      drivers/acpi/viot.o
  CC      fs/signalfd.o
  LD [M]  net/ipv4/fou.o
  LD [M]  net/ipv4/gre.o
  LD [M]  net/ipv4/udp_tunnel.o
  AR      net/ipv4/built-in.a
  CC [M]  drivers/net/usb/r8153_ecm.o
  CC [M]  drivers/ata/pata_oldpiix.o
  CC [M]  drivers/mfd/madera-spi.o
  CC [M]  drivers/regulator/wm831x-ldo.o
  CC [M]  drivers/mfd/cs40l50-core.o
  CC [M]  net/netfilter/nft_fwd_netdev.o
  CC [M]  net/netfilter/nf_flow_table_core.o
  CC [M]  drivers/ata/pata_optidma.o
  CC [M]  drivers/acpi/acpi_ipmi.o
  CC      fs/timerfd.o
  CC [M]  drivers/regulator/wm8350-regulator.o
  CC [M]  drivers/mfd/cs40l50-i2c.o
  CC [M]  drivers/regulator/wm8400-regulator.o
  CC [M]  drivers/regulator/wm8994-regulator.o
  CC      fs/eventfd.o
  CC [M]  drivers/ata/pata_pdc2027x.o
  CC [M]  drivers/ata/pata_pdc202xx_old.o
  CC [M]  drivers/mfd/cs40l50-spi.o
  CC      fs/userfaultfd.o
  CC [M]  drivers/mfd/tps6105x.o
  CC [M]  drivers/ata/pata_radisys.o
  CC [M]  drivers/mfd/tps65010.o
  CC [M]  drivers/acpi/acpi_video.o
  CC      fs/aio.o
  CC [M]  net/netfilter/nf_flow_table_ip.o
  CC [M]  drivers/acpi/video_detect.o
  CC      fs/dax.o
  CC [M]  net/netfilter/nf_flow_table_offload.o
  CC [M]  drivers/acpi/acpi_tad.o
  CC [M]  drivers/mfd/tps6507x.o
  CC      fs/locks.o
  CC [M]  drivers/acpi/platform_profile.o
  AR      lib/built-in.a
  CC      fs/binfmt_script.o
  LD [M]  drivers/scsi/hv_storvsc.o
  CC [M]  drivers/acpi/sbshc.o
  AR      drivers/net/built-in.a
  CC [M]  net/netfilter/nf_flow_table_xdp.o
  CC      drivers/scsi/scsi_sysfs.o
  CC [M]  drivers/mfd/tps65086.o
  CC [M]  drivers/acpi/sbs.o
  CC [M]  drivers/mfd/tps6594-core.o
  CC [M]  drivers/ata/pata_rdc.o
  CC      fs/binfmt_elf.o
  CC [M]  net/netfilter/nf_flow_table_inet.o
  CC      fs/compat_binfmt_elf.o
  CC [M]  drivers/ata/pata_sch.o
  CC [M]  drivers/mfd/tps6594-i2c.o
  CC      fs/backing-file.o
  CC [M]  net/netfilter/x_tables.o
  CC [M]  drivers/mfd/tps6594-spi.o
  CC      fs/mbcache.o
  CC      fs/posix_acl.o
  CC [M]  drivers/ata/pata_serverworks.o
  CC [M]  net/netfilter/xt_tcpudp.o
  LD [M]  drivers/net/usb/asix.o
  CC [M]  drivers/acpi/ec_sys.o
  CC      fs/coredump.o
  CC [M]  drivers/ata/pata_sil680.o
  CC [M]  net/netfilter/xt_mark.o
  CC [M]  drivers/mfd/mc13xxx-core.o
  CC [M]  drivers/acpi/pfr_update.o
  CC [M]  drivers/ata/pata_piccolo.o
  CC [M]  drivers/mfd/mc13xxx-spi.o
  CC      fs/drop_caches.o
  CC      fs/sysctls.o
  CC [M]  drivers/mfd/mc13xxx-i2c.o
  CC [M]  net/netfilter/xt_connmark.o
  CC [M]  drivers/mfd/ocelot-core.o
  CC [M]  net/netfilter/xt_nat.o
  CC [M]  drivers/ata/pata_triflex.o
  CC [M]  drivers/acpi/pfr_telemetry.o
  CC [M]  drivers/ata/pata_via.o
  CC [M]  drivers/mfd/ocelot-spi.o
  CC [M]  net/netfilter/xt_AUDIT.o
  CC [M]  drivers/acpi/acpi_pad.o
  CC      fs/fhandle.o
  CC [M]  net/netfilter/xt_CHECKSUM.o
  CC [M]  drivers/acpi/acpi_extlog.o
  CC [M]  net/netfilter/xt_CLASSIFY.o
  CC [M]  drivers/mfd/axp20x.o
  CC [M]  drivers/ata/pata_sl82c105.o
  CC [M]  net/netfilter/xt_CONNSECMARK.o
  CC [M]  drivers/mfd/axp20x-i2c.o
  CC [M]  drivers/acpi/acpi_configfs.o
  CC      fs/bpf_fs_kfuncs.o
  CC [M]  fs/binfmt_misc.o
  CC [M]  drivers/ata/pata_cmd640.o
  CC [M]  net/netfilter/xt_CT.o
  CC [M]  net/netfilter/xt_DSCP.o
  CC [M]  drivers/mfd/lp3943.o
  CC [M]  net/netfilter/xt_HL.o
  CC [M]  drivers/mfd/ti-lmu.o
  CC [M]  drivers/ata/pata_mpiix.o
  CC [M]  drivers/mfd/da9062-core.o
  CC [M]  net/netfilter/xt_HMARK.o
  CC [M]  drivers/mfd/da9150-core.o
  CC [M]  drivers/ata/pata_ns87410.o
  AR      drivers/regulator/built-in.a
  CC [M]  net/netfilter/xt_LED.o
  CC [M]  drivers/mfd/max77541.o
  CC [M]  net/netfilter/xt_LOG.o
  CC [M]  drivers/mfd/max8907.o
  CC [M]  drivers/ata/pata_opti.o
  CC [M]  net/netfilter/xt_NETMAP.o
  CC [M]  drivers/mfd/mp2629.o
  CC [M]  drivers/mfd/mt6360-core.o
  CC [M]  drivers/ata/pata_rz1000.o
  CC [M]  net/netfilter/xt_NFLOG.o
  CC [M]  drivers/ata/pata_acpi.o
  CC [M]  drivers/mfd/mt6370.o
  CC [M]  net/netfilter/xt_NFQUEUE.o
  CC [M]  drivers/ata/pata_legacy.o
  CC [M]  net/netfilter/xt_RATEEST.o
  CC [M]  drivers/mfd/mt6397-core.o
  CC [M]  net/netfilter/xt_REDIRECT.o
  AR      drivers/scsi/built-in.a
  CC [M]  drivers/mfd/mt6397-irq.o
  LD [M]  drivers/acpi/video.o
  CC [M]  drivers/mfd/mt6358-irq.o
  AR      drivers/acpi/built-in.a
  CC [M]  drivers/mfd/kempld-core.o
  CC [M]  net/netfilter/xt_MASQUERADE.o
  CC [M]  net/netfilter/xt_SECMARK.o
  CC [M]  drivers/mfd/intel_quark_i2c_gpio.o
  CC [M]  net/netfilter/xt_TPROXY.o
  CC [M]  net/netfilter/xt_TCPMSS.o
  CC [M]  drivers/mfd/lpc_sch.o
  CC [M]  net/netfilter/xt_TCPOPTSTRIP.o
  CC [M]  net/netfilter/xt_TEE.o
  CC [M]  drivers/mfd/lpc_ich.o
  CC [M]  net/netfilter/xt_TRACE.o
  CC [M]  drivers/mfd/rdc321x-southbridge.o
  CC [M]  drivers/mfd/janz-cmodio.o
  CC [M]  net/netfilter/xt_IDLETIMER.o
  CC [M]  drivers/mfd/vx855.o
  CC [M]  net/netfilter/xt_addrtype.o
  CC [M]  drivers/mfd/wl1273-core.o
  CC [M]  drivers/mfd/si476x-cmd.o
  CC [M]  net/netfilter/xt_bpf.o
  CC [M]  drivers/mfd/si476x-prop.o
  CC [M]  net/netfilter/xt_cluster.o
  CC [M]  net/netfilter/xt_comment.o
  CC [M]  drivers/mfd/si476x-i2c.o
  CC [M]  drivers/mfd/intel_pmc_bxt.o
  CC [M]  net/netfilter/xt_connbytes.o
  CC [M]  drivers/mfd/viperboard.o
  CC [M]  net/netfilter/xt_connlabel.o
  CC [M]  drivers/mfd/lm3533-core.o
  CC [M]  net/netfilter/xt_connlimit.o
  CC [M]  net/netfilter/xt_conntrack.o
  CC [M]  drivers/mfd/lm3533-ctrlbank.o
  CC [M]  net/netfilter/xt_cpu.o
  AR      fs/built-in.a
  CC [M]  net/netfilter/xt_dccp.o
  CC [M]  drivers/mfd/retu-mfd.o
  CC [M]  net/netfilter/xt_devgroup.o
  CC [M]  drivers/mfd/iqs62x.o
  CC [M]  net/netfilter/xt_dscp.o
  CC [M]  drivers/mfd/menf21bmc.o
  CC [M]  drivers/mfd/dln2.o
  CC [M]  net/netfilter/xt_ecn.o
  CC [M]  drivers/mfd/rt4831.o
  CC [M]  net/netfilter/xt_esp.o
  CC [M]  net/netfilter/xt_hashlimit.o
  CC [M]  net/netfilter/xt_helper.o
  CC [M]  drivers/mfd/rt5033.o
  CC [M]  net/netfilter/xt_hl.o
  CC [M]  drivers/mfd/rt5120.o
  CC [M]  net/netfilter/xt_ipcomp.o
  CC [M]  net/netfilter/xt_iprange.o
  CC [M]  drivers/mfd/sky81452.o
  AR      drivers/ata/built-in.a
  CC [M]  net/netfilter/xt_l2tp.o
  CC [M]  drivers/mfd/intel_soc_pmic_bxtwc.o
  CC [M]  net/netfilter/xt_length.o
  CC [M]  net/netfilter/xt_limit.o
  CC [M]  drivers/mfd/intel_soc_pmic_chtdc_ti.o
  CC [M]  net/netfilter/xt_mac.o
  CC [M]  net/netfilter/xt_multiport.o
  CC [M]  net/netfilter/xt_nfacct.o
  CC [M]  net/netfilter/xt_osf.o
  CC [M]  drivers/mfd/intel_soc_pmic_mrfld.o
  CC [M]  net/netfilter/xt_owner.o
  CC [M]  net/netfilter/xt_cgroup.o
  CC [M]  net/netfilter/xt_physdev.o
  CC [M]  net/netfilter/xt_pkttype.o
  CC [M]  drivers/mfd/rave-sp.o
  CC [M]  net/netfilter/xt_policy.o
  CC [M]  drivers/mfd/simple-mfd-i2c.o
  CC [M]  net/netfilter/xt_quota.o
  CC [M]  drivers/mfd/smpro-core.o
  CC [M]  drivers/mfd/intel-m10-bmc-core.o
  CC [M]  net/netfilter/xt_rateest.o
  CC [M]  drivers/mfd/intel-m10-bmc-spi.o
  CC [M]  net/netfilter/xt_realm.o
  CC [M]  net/netfilter/xt_recent.o
  CC [M]  drivers/mfd/atc260x-core.o
  CC [M]  net/netfilter/xt_sctp.o
  CC [M]  drivers/mfd/atc260x-i2c.o
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
make[1]: Leaving directory '/kernel/build64-debug'
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


