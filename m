Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC59C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 06:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AEE10E15A;
	Wed, 28 May 2025 06:25:51 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B002510E1A3;
 Wed, 28 May 2025 06:25:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EBuild=3A_failure_for_drm/i915=3A_drop_intel=5Fdpio?=
 =?utf-8?q?=5Fphy=2Eh_include_from_VLV_IOSF_SB?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 06:25:49 -0000
Message-ID: <174841354971.26762.18170463065570176447@1538d3639d33>
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

CC [M]  drivers/regulator/max8649.o
  CC [M]  drivers/tty/serial/sc16is7xx.o
  CC [M]  drivers/misc/ibmasm/ibmasmfs.o
  CC [M]  net/bridge/netfilter/ebt_arp.o
  CC      arch/x86/kernel/early-quirks.o
  CC      lib/scatterlist.o
  CC [M]  crypto/cast6_generic.o
  CC [M]  drivers/regulator/max8660.o
  CC      drivers/iommu/virtio-iommu.o
  CC [M]  drivers/cxl/core/mbox.o
  CC [M]  drivers/block/drbd/drbd_interval.o
  CC [M]  crypto/aria_generic.o
  CC      net/ipv4/devinet.o
  CC      fs/udf/balloc.o
  CC      drivers/mfd/tps65912-spi.o
  CC      drivers/dma-buf/sync_debug.o
  CC      drivers/base/transport_class.o
  CC      drivers/acpi/acpica/utaddress.o
  CC      drivers/mfd/twl-core.o
  AR      fs/hostfs/built-in.a
  CC      fs/udf/dir.o
  COPY    drivers/scsi/aic7xxx/aic79xx_seq.h
  COPY    drivers/scsi/aic7xxx/aic79xx_reg.h
  COPY    drivers/scsi/aic7xxx/aic79xx_reg_print.c
  CC [M]  drivers/scsi/aic7xxx/aic79xx_osm.o
  CC [M]  sound/soc/intel/atom/sst/sst_pci.o
  CC      drivers/nvdimm/btt_devs.o
  CC [M]  drivers/scsi/libsas/sas_event.o
  CC [M]  fs/nls/nls_ascii.o
  CC [M]  crypto/chacha_generic.o
  CC [M]  drivers/block/drbd/drbd_state.o
  CC [M]  net/llc/llc_proc.o
  CC [M]  drivers/cxl/port.o
  CC [M]  drivers/char/applicom.o
  CC [M]  drivers/misc/ibmasm/event.o
  CC      net/ipv6/xfrm6_policy.o
  CC      drivers/acpi/acpica/utalloc.o
  CC      kernel/trace/trace_events_user.o
  CC      drivers/dma-buf/udmabuf.o
  CC [M]  drivers/scsi/megaraid/megaraid_sas_base.o
  CC [M]  drivers/misc/ibmasm/command.o
  CC      mm/dmapool.o
  CC [M]  drivers/regulator/max8893.o
  CC [M]  net/netfilter/nf_conntrack_netbios_ns.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-icl-match.o
  CC      kernel/trace/bpf_trace.o
  CC      fs/ntfs3/dir.o
  CC [M]  net/bridge/netfilter/ebt_ip.o
  CC [M]  drivers/cxl/core/pci.o
  CC [M]  fs/nls/nls_iso8859-1.o
  CC      fs/udf/file.o
  CC [M]  sound/soc/intel/atom/sst/sst_acpi.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_seal.o
  CC [M]  crypto/poly1305_generic.o
  CC [M]  drivers/block/floppy.o
  CC [M]  drivers/char/nvram.o
  CC      kernel/bpf/range_tree.o
  CC      drivers/acpi/acpica/utascii.o
  CC [M]  drivers/block/brd.o
  CC      drivers/iommu/iommu-sva.o
  CC [M]  drivers/char/ppdev.o
  CC      drivers/base/topology.o
  CC [M]  net/bridge/netfilter/ebt_ip6.o
  CC      drivers/nvdimm/pfn_devs.o
  CC      arch/x86/kernel/smp.o
  CC [M]  drivers/char/tlclk.o
  CC      lib/list_sort.o
  CC [M]  drivers/block/ublk_drv.o
  CC [M]  drivers/tty/serial/sc16is7xx_spi.o
  CC [M]  drivers/misc/ibmasm/remote.o
  LD [M]  net/kcm/kcm.o
  CC [M]  net/llc/sysctl_net_llc.o
  CC      drivers/acpi/acpica/utbuffer.o
  CC      drivers/acpi/ec.o
  CC      drivers/mfd/twl4030-irq.o
  CC [M]  fs/nls/nls_iso8859-2.o
  CC      lib/uuid.o
  CC      drivers/acpi/acpica/utcksum.o
  CC [M]  net/bridge/netfilter/ebt_limit.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_unseal.o
  CC [M]  drivers/regulator/max8907-regulator.o
  CC      drivers/nvme/host/zns.o
  CC [M]  drivers/dma-buf/selftest.o
  CC [M]  drivers/scsi/libsas/sas_discover.o
  CC [M]  crypto/michael_mic.o
  LD [M]  sound/soundcore.o
  CC [M]  drivers/tty/serial/sc16is7xx_i2c.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_proc.o
  CC      fs/udf/ialloc.o
  CC [M]  drivers/misc/sgi-xp/xp_main.o
  CC      drivers/acpi/acpica/utcopy.o
  CC      fs/debugfs/inode.o
  CC      fs/ntfs3/fsntfs.o
  CC      lib/iov_iter.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-tgl-match.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-core.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-pci.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-acpi.o
  CC [M]  net/netfilter/nf_conntrack_snmp.o
  CC [M]  sound/soc/intel/atom/sst-mfld-platform-pcm.o
  CC      drivers/iommu/io-pgfault.o
  CC      drivers/base/container.o
  CC      fs/ntfs3/frecord.o
  CC [M]  drivers/cxl/core/hdm.o
  CC      kernel/bpf/dispatcher.o
  CC      mm/hugetlb.o
  CC [M]  drivers/cxl/core/pmu.o
  CC      fs/tracefs/inode.o
  CC [M]  drivers/misc/sgi-xp/xp_uv.o
  CC [M]  fs/nls/nls_iso8859-3.o
  CC [M]  net/netfilter/nf_conntrack_pptp.o
  CC [M]  drivers/misc/ibmasm/heartbeat.o
  CC [M]  drivers/scsi/megaraid/megaraid_sas_fusion.o
  CC [M]  drivers/misc/ibmasm/r_heartbeat.o
  CC [M]  drivers/char/hangcheck-timer.o
  LD [M]  net/llc/llc.o
  CC      net/ipv6/xfrm6_state.o
  LD [M]  net/llc/llc2.o
  CC [M]  drivers/dma-buf/st-dma-fence.o
  CC [M]  sound/soc/intel/atom/sst-mfld-platform-compress.o
  CC [M]  net/sunrpc/socklib.o
  CC      drivers/mfd/twl6030-irq.o
  CC [M]  crypto/crc32_generic.o
  CC      drivers/acpi/acpica/utexcep.o
  CC [M]  drivers/regulator/max8925-regulator.o
  CC [M]  drivers/tty/serial/sprd_serial.o
  CC      fs/udf/inode.o
  CC      arch/x86/kernel/smpboot.o
  CC      drivers/base/property.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_osm_pci.o
  CC      arch/x86/kernel/tsc_sync.o
  CC      drivers/nvme/host/fault_inject.o
  CC [M]  net/bridge/netfilter/ebt_mark_m.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_wrap.o
  CC [M]  fs/nls/nls_iso8859-4.o
  CC [M]  drivers/scsi/libsas/sas_expander.o
  CC [M]  drivers/cxl/core/cdat.o
  CC [M]  drivers/misc/sgi-xp/xpc_main.o
  CC      drivers/nvdimm/dax_devs.o
  CC [M]  net/sunrpc/xprtsock.o
  CC [M]  drivers/misc/ibmasm/dot_command.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ehl-match.o
  AR      drivers/char/built-in.a
  CC [M]  drivers/block/drbd/drbd_nla.o
  CC [M]  drivers/misc/sgi-xp/xpc_channel.o
  CC [M]  crypto/authenc.o
  CC [M]  drivers/dma-buf/st-dma-fence-chain.o
  CC      net/ipv4/af_inet.o
  CC      kernel/trace/trace_kprobe.o
  CC      drivers/nvme/host/hwmon.o
  CC      fs/tracefs/event_inode.o
  CC      drivers/acpi/acpica/utdebug.o
  CC      kernel/bpf/devmap.o
  CC [M]  sound/soc/intel/atom/sst-atom-controls.o
  AR      drivers/iommu/built-in.a
  CC [M]  net/bridge/netfilter/ebt_pkttype.o
  CC [M]  drivers/misc/sgi-xp/xpc_partition.o
  CC      mm/hugetlb_vmemmap.o
  CC [M]  drivers/tty/serial/uartlite.o
  CC [M]  drivers/regulator/max8952.o
  CC [M]  drivers/misc/sgi-xp/xpc_uv.o
  CC      net/ipv6/xfrm6_input.o
  CC      fs/debugfs/file.o
  CC [M]  fs/nls/nls_iso8859-5.o
  CC [M]  drivers/scsi/libsas/sas_scsi_host.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_core.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_crypto.o
  CC [M]  drivers/misc/ibmasm/lowlevel.o
  CC      drivers/mfd/twl4030-audio.o
  CC [M]  drivers/regulator/max8997-regulator.o
  CC [M]  drivers/cxl/acpi.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_93cx6.o
  CC [M]  fs/nls/nls_iso8859-6.o
  CC      fs/ntfs3/file.o
  CC [M]  drivers/scsi/megaraid/megaraid_sas_fp.o
  CC [M]  drivers/block/drbd/drbd_debugfs.o
  CC      drivers/base/cacheinfo.o
  CC      arch/x86/kernel/setup_percpu.o
  CC      mm/mempolicy.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-jsl-match.o
  CC [M]  drivers/dma-buf/st-dma-fence-unwrap.o
  CC      kernel/bpf/cpumap.o
  CC      drivers/nvme/host/auth.o
  CC      drivers/acpi/acpica/utdecode.o
  AR      drivers/nvme/target/built-in.a
  CC [M]  sound/soc/sdca/sdca_functions.o
  CC [M]  drivers/nvme/target/core.o
  CC [M]  crypto/authencesn.o
  CC [M]  drivers/scsi/isci/init.o
  AR      drivers/tty/serial/built-in.a
  AR      fs/tracefs/built-in.a
  CC [M]  net/bridge/netfilter/ebt_stp.o
  CC      drivers/tty/tty_ldsem.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_keys.o
  CC [M]  net/netfilter/nf_conntrack_sane.o
  CC [M]  drivers/misc/ibmasm/uart.o
  LD [M]  net/sunrpc/auth_gss/auth_rpcgss.o
  CC      drivers/nvdimm/security.o
  CC [M]  drivers/scsi/isci/phy.o
  CC      fs/udf/lowlevel.o
  CC [M]  drivers/cxl/core/ras.o
  LD [M]  sound/soc/intel/atom/snd-soc-sst-atom-hifi2-platform.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_pci.o
  CC [M]  fs/nls/nls_iso8859-7.o
  CC [M]  drivers/scsi/isci/request.o
  CC [M]  drivers/dma-buf/st-dma-resv.o
  CC      drivers/acpi/acpica/utdelete.o
  CC [M]  drivers/cxl/core/acpi.o
  CC [M]  drivers/misc/sgi-xp/xpnet.o
  CC [M]  sound/soc/sdca/sdca_device.o
  CC [M]  net/bridge/br_device.o
  CC      lib/clz_ctz.o
  CC [M]  drivers/misc/sgi-gru/grufile.o
  CC      drivers/mfd/twl6040.o
  CC      lib/bsearch.o
  CC [M]  drivers/regulator/max8998.o
  CC [M]  drivers/misc/sgi-gru/grumain.o
  CC      drivers/mfd/mfd-core.o
  LD [M]  drivers/misc/ibmasm/ibmasm.o
  CC      drivers/mfd/ezx-pcap.o
  CC      net/ipv4/igmp.o
  CC [M]  crypto/lz4.o
  CC      drivers/base/swnode.o
  CC      drivers/tty/tty_baudrate.o
  AR      drivers/dma-buf/built-in.a
  CC [M]  sound/soc/intel/common/soc-acpi-intel-adl-match.o
  LD [M]  drivers/dma-buf/dmabuf_selftests.o
  CC [M]  fs/nls/nls_cp1255.o
  CC      drivers/acpi/acpica/uterror.o
  CC [M]  drivers/misc/c2port/core.o
  CC      arch/x86/kernel/mpparse.o
  CC      fs/udf/namei.o
  AR      fs/debugfs/built-in.a
  CC [M]  drivers/scsi/isci/remote_device.o
  CC [M]  drivers/scsi/libsas/sas_task.o
  CC      arch/x86/kernel/ftrace.o
  CC [M]  drivers/misc/altera-stapl/altera-jtag.o
  CC [M]  drivers/scsi/megaraid/megaraid_sas_debugfs.o
  CC [M]  drivers/misc/mei/hdcp/mei_hdcp.o
  CC      fs/ntfs3/fslog.o
  CC [M]  drivers/cxl/core/trace.o
  CC [M]  net/bridge/netfilter/ebt_vlan.o
  CC      drivers/nvdimm/e820.o
  CC [M]  net/netfilter/nf_conntrack_sip.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-rpl-match.o
  CC      net/ipv6/xfrm6_output.o
  CC      drivers/acpi/acpica/uteval.o
  CC      net/ipv4/fib_frontend.o
  CC [M]  crypto/lz4hc.o
  CC      kernel/bpf/offload.o
  CC [M]  fs/nls/nls_iso8859-9.o
  LD [M]  drivers/block/drbd/drbd.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_reg_print.o
  CC      drivers/acpi/dock.o
  AR      drivers/block/built-in.a
  LD [M]  drivers/misc/sgi-xp/xp.o
  CC [M]  drivers/regulator/max20086-regulator.o
  LD [M]  drivers/misc/sgi-xp/xpc.o
  CC      kernel/trace/error_report-traces.o
  CC [M]  drivers/misc/sgi-gru/grufault.o
  CC [M]  drivers/regulator/max20411-regulator.o
  CC [M]  drivers/misc/altera-stapl/altera-comp.o
  CC [M]  drivers/misc/mei/pxp/mei_pxp.o
  CC      lib/find_bit.o
  CC [M]  net/sunrpc/sched.o
  CC [M]  sound/soc/sdca/sdca_regmap.o
  CC [M]  drivers/misc/altera-stapl/altera.o
  CC      drivers/nvme/host/pci.o
  CC [M]  drivers/misc/mei/gsc_proxy/mei_gsc_proxy.o
  CC [M]  drivers/scsi/libsas/sas_ata.o
  CC      drivers/tty/tty_jobctrl.o
  CC [M]  drivers/misc/sgi-gru/grutlbpurge.o
  CC      drivers/acpi/acpica/utglobal.o
  LD [M]  drivers/scsi/megaraid/megaraid_sas.o
  CC [M]  drivers/scsi/isci/port.o
  CC [M]  fs/nls/nls_iso8859-13.o
  CC [M]  crypto/842.o
  CC [M]  drivers/cxl/core/region.o
  AS      arch/x86/kernel/ftrace_64.o
  CC [M]  net/netfilter/nf_conntrack_tftp.o
  CC [M]  drivers/cxl/core/mce.o
  LD [M]  net/sunrpc/auth_gss/rpcsec_gss_krb5.o
  CC [M]  drivers/cxl/pmem.o
  CC [M]  drivers/nvdimm/pmem.o
  CC      drivers/mfd/da903x.o
  CC      fs/udf/partition.o
  CC [M]  net/netfilter/nf_log_syslog.o
  CC      net/ipv6/xfrm6_protocol.o
  CC      net/ipv4/fib_semantics.o
  CC [M]  net/bridge/netfilter/ebt_arpreply.o
  CC      lib/llist.o
  CC      drivers/base/faux.o
  CC [M]  drivers/misc/c2port/c2port-duramar2150.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_core.o
  CC      drivers/tty/n_null.o
  CC      drivers/acpi/acpica/uthex.o
  CC [M]  drivers/nvme/target/configfs.o
  CC      drivers/tty/pty.o
  CC [M]  drivers/regulator/max77693-regulator.o
  CC      lib/lwq.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-mtl-match.o
  CC      arch/x86/kernel/trace_clock.o
  CC      fs/pstore/inode.o
  CC [M]  fs/nls/nls_iso8859-14.o
  CC [M]  drivers/misc/mei/init.o
  CC      drivers/tty/tty_audit.o
  CC [M]  crypto/ansi_cprng.o
  CC      fs/btrfs/super.o
  CC [M]  drivers/misc/vmw_vmci/vmci_context.o
  CC      fs/pstore/platform.o
  CC      fs/udf/super.o
  CC      kernel/trace/power-traces.o
  CC [M]  drivers/misc/sgi-gru/gruprocfs.o
  CC      arch/x86/kernel/trace.o
  CC      drivers/acpi/acpica/utids.o
  CC [M]  drivers/cxl/security.o
  CC      fs/efivarfs/inode.o
  LD [M]  sound/soc/sdca/snd-soc-sdca.o
  CC [M]  drivers/misc/vmw_vmci/vmci_datagram.o
  CC      lib/memweight.o
  CC      net/ipv4/fib_trie.o
  CC      kernel/trace/rpm-traces.o
  CC      drivers/mfd/da9052-irq.o
  CC      mm/sparse.o
  CC      drivers/mfd/da9052-core.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-arl-match.o
  CC [M]  drivers/nvdimm/btt.o
  CC      lib/kfifo.o
  CC [M]  fs/nls/nls_iso8859-15.o
  CC [M]  net/bridge/netfilter/ebt_mark.o
  CC [M]  drivers/regulator/max77826-regulator.o
  CC      drivers/base/auxiliary.o
  CC      mm/sparse-vmemmap.o
  CC [M]  drivers/scsi/isci/host.o
  CC [M]  crypto/tcrypt.o
  CC      drivers/acpi/acpica/utinit.o
  CC [M]  drivers/misc/altera-stapl/altera-lpt.o
  CC      drivers/tty/sysrq.o
  CC [M]  drivers/scsi/isci/task.o
  CC      arch/x86/kernel/rethook.o
  CC [M]  drivers/scsi/libsas/sas_host_smp.o
  CC      fs/efivarfs/file.o
  CC      mm/mmu_notifier.o
  CC      net/ipv4/fib_notifier.o
  CC      kernel/bpf/net_namespace.o
  CC      drivers/mfd/da9052-spi.o
  CC [M]  drivers/misc/sgi-gru/grukservices.o
  CC      net/ipv4/inet_fragment.o
  CC [M]  drivers/misc/mei/hbm.o
  CC [M]  drivers/misc/sgi-gru/gruhandles.o
  CC [M]  fs/nls/nls_koi8-r.o
  CC [M]  drivers/nvme/target/admin-cmd.o
  LD [M]  drivers/misc/altera-stapl/altera-stapl.o
  CC      mm/ksm.o
  CC [M]  drivers/nvme/host/fabrics.o
  CC      drivers/acpi/acpica/utlock.o
  CC      fs/ntfs3/inode.o
  CC [M]  drivers/misc/sgi-gru/grukdump.o
  CC      fs/btrfs/ctree.o
  CC      fs/pstore/pmsg.o
  CC      net/ipv6/netfilter.o
  CC      net/ipv4/ping.o
  CC [M]  drivers/regulator/max77857-regulator.o
  CC      arch/x86/kernel/vmcore_info_64.o
  CC      fs/udf/truncate.o
  CC [M]  net/netfilter/nf_nat_core.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-lnl-match.o
  CC [M]  drivers/misc/vmw_vmci/vmci_doorbell.o
  CC      fs/efivarfs/super.o
  CC      drivers/acpi/acpica/utmath.o
  CC [M]  net/bridge/netfilter/ebt_dnat.o
  AR      drivers/cxl/core/built-in.a
  CC [M]  net/bridge/br_fdb.o
  CC      drivers/mfd/da9052-i2c.o
  CC      drivers/base/devtmpfs.o
  CC [M]  fs/nls/nls_koi8-u.o
  CC [M]  drivers/misc/mei/interrupt.o
  CC [M]  net/l2tp/l2tp_core.o
  CC [M]  net/bridge/br_forward.o
  CC      lib/percpu-refcount.o
  CC [M]  net/bridge/netfilter/ebt_redirect.o
  CC [M]  net/l2tp/l2tp_ip.o
  CC [M]  drivers/tty/n_hdlc.o
  CC [M]  crypto/polyval-generic.o
  CC      kernel/user.o
  CC [M]  fs/pstore/ram.o
  CC      drivers/acpi/acpica/utmisc.o
  LD [M]  drivers/cxl/core/cxl_core.o
  CC      arch/x86/kernel/machine_kexec_64.o
  CC [M]  drivers/cxl/mem.o
  CC      kernel/bpf/tcx.o
  LD [M]  drivers/scsi/libsas/libsas.o
  CC      fs/btrfs/extent-tree.o
  CC [M]  net/bridge/br_if.o
  CC      fs/efivarfs/vars.o
  CC [M]  drivers/scsi/isci/probe_roms.o
  CC      fs/udf/symlink.o
  CC [M]  fs/nls/nls_koi8-ru.o
  CC [M]  drivers/regulator/mc13783-regulator.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_pci.o
  CC      drivers/acpi/acpica/utmutex.o
  CC      kernel/trace/trace_kdb.o
  CC      drivers/mfd/lp8788.o
  CC [M]  drivers/nvme/target/fabrics-cmd.o
  CC [M]  drivers/misc/genwqe/card_base.o
  CC      net/ipv6/fib6_rules.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ptl-match.o
  CC [M]  drivers/nvdimm/virtio_pmem.o
  LD [M]  drivers/misc/sgi-gru/gru.o
  CC      drivers/base/isa.o
  CC [M]  drivers/misc/vmw_vmci/vmci_driver.o
  CC      mm/page_poison.o
  CC [M]  fs/netfs/buffered_read.o
  CC [M]  drivers/tty/n_gsm.o
  CC [M]  fs/nfs/filelayout/filelayout.o
  CC [M]  fs/nfs/filelayout/filelayoutdev.o
  CC      fs/ntfs3/index.o
  CC [M]  fs/pstore/ram_core.o
  CC [M]  drivers/cxl/pci.o
  CC [M]  fs/nls/nls_utf8.o
  AR      fs/efivarfs/built-in.a
  CC [M]  drivers/misc/mei/client.o
  CC      net/ipv6/proc.o
  CC      lib/rhashtable.o
  CC [M]  crypto/af_alg.o
  CC [M]  fs/lockd/clntlock.o
  CC      drivers/acpi/acpica/utnonansi.o
  CC [M]  net/bridge/netfilter/ebt_snat.o
  CC      fs/udf/directory.o
  CC [M]  drivers/nvme/host/fc.o
  CC [M]  drivers/scsi/isci/remote_node_context.o
  AS      arch/x86/kernel/relocate_kernel_64.o
  CC [M]  drivers/regulator/mc13892-regulator.o
  LD [M]  drivers/cxl/cxl_port.o
  CC      arch/x86/kernel/kexec-bzimage64.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_base.o
  CC      kernel/bpf/stackmap.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_reg_print.o
  CC [M]  drivers/nvme/target/discovery.o
  CC      kernel/trace/trace_dynevent.o
  CC [M]  drivers/scsi/isci/remote_node_table.o
  CC      drivers/acpi/acpica/utobject.o
  CC [M]  drivers/nvdimm/nd_virtio.o
  CC [M]  fs/nls/mac-celtic.o
  CC [M]  drivers/misc/genwqe/card_dev.o
  CC [M]  fs/netfs/buffered_write.o
  CC [M]  drivers/misc/vmw_vmci/vmci_event.o
  CC [M]  drivers/misc/vmw_vmci/vmci_guest.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-hda-match.o
  CC      drivers/base/node.o
  CC      net/ipv4/ip_tunnel_core.o
  CC [M]  fs/pstore/zone.o
  CC [M]  net/netfilter/nf_nat_proto.o
  CC      drivers/scsi/scsi.o
  CC [M]  drivers/misc/vmw_vmci/vmci_handle_array.o
  CC      drivers/mfd/lp8788-irq.o
  LD [M]  drivers/cxl/cxl_acpi.o
  CC      kernel/trace/trace_probe.o
  LD [M]  drivers/cxl/cxl_pmem.o
  LD [M]  drivers/cxl/cxl_mem.o
  LD [M]  drivers/cxl/cxl_pci.o
  AR      drivers/cxl/built-in.a
  CC      fs/udf/misc.o
  CC [M]  net/bridge/netfilter/ebt_log.o
  CC      arch/x86/kernel/crash_dump_64.o
  CC      drivers/acpi/acpica/utosi.o
  CC [M]  drivers/regulator/mc13xxx-regulator-core.o
  CC      arch/x86/kernel/crash.o
  CC [M]  drivers/scsi/isci/unsolicited_frame_control.o
  CC [M]  fs/nls/mac-centeuro.o
  CC      fs/btrfs/print-tree.o
  CC [M]  net/dccp/ccid.o
  CC [M]  net/bridge/netfilter/ebt_nflog.o
  LD [M]  drivers/scsi/aic7xxx/aic7xxx.o
  CC [M]  drivers/nvme/target/io-cmd-file.o
  CC [M]  net/dccp/feat.o
  LD [M]  drivers/scsi/aic7xxx/aic79xx.o
  CC [M]  fs/netfs/direct_read.o
  CC [M]  net/sctp/sm_statetable.o
  CC      kernel/trace/trace_uprobe.o
  CC      net/ipv6/syncookies.o
  CC [M]  net/bridge/br_input.o
  LD [M]  fs/nfs/filelayout/nfs_layout_nfsv41_files.o
  CC [M]  fs/nfs/blocklayout/blocklayout.o
  CC      kernel/signal.o
  CC      fs/ntfs3/lznt.o
  CC      kernel/bpf/cgroup_iter.o
  CC      drivers/mfd/da9055-core.o
  CC      drivers/acpi/acpica/utownerid.o
  CC [M]  drivers/tty/moxa.o
  CC      mm/memtest.o
  CC [M]  drivers/misc/genwqe/card_ddcb.o
  CC [M]  fs/nls/mac-croatian.o
  CC      net/ipv6/calipso.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.o
  CC      fs/udf/udftime.o
  CC      lib/base64.o
  CC [M]  fs/lockd/clntproc.o
  CC      arch/x86/kernel/module.o
  CC [M]  drivers/scsi/isci/port_config.o
  LD [M]  drivers/nvdimm/nd_pmem.o
  LD [M]  drivers/nvdimm/nd_btt.o
  AR      drivers/nvdimm/built-in.a
  CC [M]  drivers/misc/echo/echo.o
  CC      lib/once.o
  CC [M]  drivers/misc/vmw_vmci/vmci_host.o
  CC [M]  drivers/misc/mei/main.o
  CC      arch/x86/kernel/kgdb.o
  CC      drivers/acpi/acpica/utpredef.o
  CC      net/ipv6/seg6_iptunnel.o
  CC      drivers/acpi/pci_root.o
  CC [M]  crypto/algif_hash.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ssp-common.o
  CC [M]  drivers/nvme/target/io-cmd-bdev.o
  CC      drivers/scsi/hosts.o
  CC [M]  net/l2tp/l2tp_netlink.o
  CC      drivers/base/memory.o
  CC [M]  fs/nls/mac-cyrillic.o
  CC      mm/migrate.o
  CC [M]  drivers/regulator/mp8859.o
  CC [M]  crypto/algif_skcipher.o
  CC [M]  fs/pstore/blk.o
  CC [M]  net/dccp/input.o
  CC      fs/ntfs3/namei.o
  CC      kernel/bpf/bpf_cgrp_storage.o
  CC      drivers/base/module.o
  CC [M]  net/sctp/sm_statefuns.o
  CC      drivers/acpi/acpica/utresdecode.o
  CC      fs/udf/unicode.o
  CC [M]  net/netfilter/nf_nat_helper.o
  CC      drivers/base/auxiliary_sysfs.o
  CC      drivers/mfd/da9055-i2c.o
  CC [M]  net/netfilter/nf_nat_redirect.o
  CC [M]  fs/netfs/direct_write.o
  CC [M]  drivers/misc/genwqe/card_sysfs.o
  CC [M]  drivers/tty/mxser.o
  CC [M]  fs/lockd/clntxdr.o
  CC [M]  drivers/nvme/host/tcp.o
  CC [M]  fs/nls/mac-gaelic.o
  CC [M]  drivers/misc/vmw_vmci/vmci_queue_pair.o
  LD [M]  drivers/scsi/isci/isci.o
  CC      kernel/trace/trace_boot.o
  CC      drivers/acpi/acpica/utresrc.o
  CC      lib/refcount.o
  CC      net/ipv4/gre_offload.o
  CC [M]  fs/nfs/blocklayout/dev.o
  CC [M]  drivers/nvme/target/pr.o
  LD [M]  fs/pstore/ramoops.o
  CC      fs/btrfs/root-tree.o
  CC [M]  net/sctp/sm_sideeffect.o
  CC [M]  drivers/misc/mei/dma-ring.o
  CC      drivers/mfd/da9063-core.o
  CC [M]  drivers/regulator/mt6311-regulator.o
  CC      arch/x86/kernel/early_printk.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-sdca-quirks.o
  CC      drivers/acpi/pci_link.o
  CC      fs/ntfs3/record.o
  CC [M]  net/netfilter/nf_nat_masquerade.o
  AR      fs/udf/built-in.a
  CC [M]  net/sctp/protocol.o
  CC      drivers/mfd/da9063-irq.o
  CC [M]  drivers/regulator/mt6315-regulator.o
  CC [M]  drivers/misc/genwqe/card_debugfs.o
  CC [M]  fs/nls/mac-greek.o
  CC [M]  drivers/regulator/mt6323-regulator.o
  CC [M]  crypto/algif_rng.o
  CC      drivers/acpi/acpica/utstate.o
  CC [M]  net/sunrpc/auth.o
  CC [M]  drivers/misc/vmw_vmci/vmci_resource.o
  CC      lib/rcuref.o
  CC      kernel/bpf/cgroup.o
  CC [M]  net/netfilter/nf_nat_ovs.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_config.o
  CC [M]  fs/smb/common/cifs_arc4.o
  CC [M]  net/bridge/br_ioctl.o
  LD [M]  fs/pstore/pstore_zone.o
  LD [M]  fs/pstore/pstore_blk.o
  AR      fs/pstore/built-in.a
  CC [M]  fs/smb/client/trace.o
  CC [M]  fs/nfs/blocklayout/extent_tree.o
  LD [M]  drivers/nvme/host/nvme-fabrics.o
  CC      drivers/base/hypervisor.o
  CC [M]  drivers/misc/vmw_vmci/vmci_route.o
  CC      drivers/scsi/scsi_ioctl.o
  CC [M]  drivers/misc/mei/bus.o
  CC      arch/x86/kernel/hpet.o
  CC [M]  fs/netfs/iterator.o
  CC [M]  net/bridge/br_stp.o
  CC      kernel/bpf/reuseport_array.o
  CC      drivers/acpi/acpica/utstring.o
  CC      lib/usercopy.o
  CC [M]  fs/lockd/host.o
  CC      drivers/mfd/da9063-i2c.o
  CC      kernel/trace/fprobe.o
  CC      kernel/bpf/bpf_struct_ops.o
  CC [M]  fs/nls/mac-iceland.o
  CC      drivers/mfd/max14577.o
  CC [M]  drivers/tty/nozomi.o
  CC [M]  net/sunrpc/auth_null.o
  CC      net/ipv4/metrics.o
  CC      fs/ntfs3/run.o
  CC      fs/btrfs/dir-item.o
  CC      net/ipv6/seg6_local.o
  CC      drivers/base/soc.o
  CC [M]  drivers/nvme/target/passthru.o
  LD [M]  sound/soc/intel/common/snd-soc-acpi-intel-match.o
  CC [M]  drivers/misc/genwqe/card_utils.o
  LD [M]  sound/soc/intel/common/snd-soc-acpi-intel-sdca-quirks.o
  CC [M]  drivers/regulator/mt6331-regulator.o
  CC [M]  net/l2tp/l2tp_eth.o
  CC      drivers/acpi/acpica/utstrsuppt.o
  CC [M]  sound/soc/soc-acpi.o
  CC [M]  crypto/algif_aead.o
  CC [M]  fs/smb/common/cifs_md4.o
  CC [M]  drivers/misc/mei/bus-fixup.o
  CC [M]  fs/nls/mac-inuit.o
  CC [M]  net/sunrpc/auth_tls.o
  CC [M]  net/dccp/minisocks.o
  CC      lib/errseq.o
  CC [M]  drivers/misc/mei/debugfs.o
  CC      drivers/scsi/scsicam.o
  CC [M]  fs/nfs/flexfilelayout/flexfilelayout.o
  CC      fs/ntfs3/super.o
  CC      lib/bucket_locks.o
  CC      drivers/acpi/acpica/utstrtoul64.o
  LD [M]  drivers/misc/vmw_vmci/vmw_vmci.o
  CC      drivers/base/pinctrl.o
  CC      drivers/mfd/max77693.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_scsih.o
  CC [M]  fs/nfs/blocklayout/rpc_pipefs.o
  CC      mm/memory-tiers.o
  CC      drivers/acpi/acpica/utxface.o
  CC [M]  drivers/regulator/mt6332-regulator.o
  CC      drivers/acpi/acpica/utxfinit.o
  CC [M]  fs/nls/mac-romanian.o
  CC      drivers/acpi/acpica/utxferror.o
  CC [M]  net/bridge/br_stp_bpdu.o
  CC [M]  drivers/nvme/target/zns.o
  CC      drivers/acpi/acpica/utxfmutex.o
  CC      mm/migrate_device.o
  CC      drivers/acpi/acpica/dbcmds.o
  CC [M]  fs/nfs/flexfilelayout/flexfilelayoutdev.o
  CC [M]  net/l2tp/l2tp_debugfs.o
  LD [M]  drivers/nvme/host/nvme-fc.o
  LD [M]  drivers/nvme/host/nvme-tcp.o
  AR      drivers/nvme/host/built-in.a
  CC      mm/huge_memory.o
  CC [M]  fs/lockd/svc.o
  CC      mm/khugepaged.o
  CC      arch/x86/kernel/amd_nb.o
  CC [M]  fs/lockd/svclock.o
  CC      fs/btrfs/file-item.o
  CC [M]  fs/netfs/locking.o
  CC      kernel/bpf/cpumask.o
  LD [M]  drivers/misc/genwqe/genwqe_card.o
  CC [M]  drivers/misc/mei/mei-trace.o
  CC [M]  fs/nls/mac-roman.o
  CC      arch/x86/kernel/amd_node.o
  CC [M]  drivers/tty/ttynull.o
  CC [M]  net/netfilter/nf_nat_amanda.o
  CC      drivers/base/devcoredump.o
  CC [M]  sound/soc/soc-core.o
  CC [M]  net/sctp/endpointola.o
  CC      lib/generic-radix-tree.o
  CC      net/ipv4/netlink.o
  CC [M]  fs/smb/client/cifsfs.o
  CC [M]  crypto/zstd.o
  CC      kernel/bpf/bpf_lsm.o
  CC      kernel/trace/rethook.o
  CC      drivers/mfd/max77843.o
  CC      arch/x86/kernel/kvm.o
  CC      mm/page_counter.o
  CC [M]  drivers/nvme/target/fabrics-cmd-auth.o
  CC [M]  drivers/regulator/mt6357-regulator.o
  CC      fs/btrfs/inode-item.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_dev.o
  CC [M]  fs/nls/mac-turkish.o
  CC [M]  net/sunrpc/auth_unix.o
  CC [M]  net/rds/af_rds.o
  CC [M]  net/sunrpc/svc.o
  CC      drivers/acpi/acpica/dbconvert.o
  CC [M]  drivers/tty/rpmsg_tty.o
  CC      fs/ntfs3/upcase.o
  CC      arch/x86/kernel/kvmclock.o
  CC      drivers/acpi/acpica/dbdisply.o
  CC [M]  drivers/misc/mei/pci-me.o
  LD [M]  fs/nfs/blocklayout/blocklayoutdriver.o
  CC [M]  net/l2tp/l2tp_ip6.o
  CC [M]  net/dccp/options.o
  CC      net/ipv6/seg6_hmac.o
  CC [M]  crypto/essiv.o
  CC [M]  drivers/misc/mei/hw-me.o
  CC [M]  net/bridge/br_stp_if.o
  CC      drivers/base/platform-msi.o
  CC      lib/bitmap-str.o
  CC [M]  fs/nls/nls_ucs2_utils.o
  CC      kernel/trace/trace_fprobe.o
  CC [M]  net/netfilter/nf_nat_ftp.o
  CC      fs/ntfs3/xattr.o
  CC [M]  net/9p/mod.o
  CC [M]  sound/soc/soc-dapm.o
  CC [M]  sound/soc/soc-jack.o
  CC      drivers/mfd/max8925-core.o
  CC [M]  fs/romfs/storage.o
  CC [M]  fs/netfs/main.o
  CC [M]  drivers/regulator/mt6358-regulator.o
  CC      drivers/mfd/max8925-i2c.o
  CC      net/ipv4/nexthop.o
  AR      drivers/tty/built-in.a
  CC [M]  drivers/nvme/target/auth.o
  CC      drivers/acpi/acpica/dbexec.o
  CC [M]  sound/soc/soc-utils.o
  CC [M]  fs/autofs/init.o
  CC [M]  net/sctp/associola.o
  CC [M]  fs/autofs/inode.o
  CC      net/ipv4/udp_tunnel_stub.o
  CC [M]  fs/autofs/root.o
  CC [M]  net/9p/client.o
  CC [M]  crypto/curve25519-generic.o
  LD [M]  fs/nfs/flexfilelayout/nfs_layout_flexfiles.o
  CC      kernel/bpf/crypto.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_msg.o
  CC [M]  fs/nfs/client.o
  CC [M]  fs/lockd/svcshare.o
  CC      fs/btrfs/disk-io.o
  CC      lib/string_helpers.o
  CC      drivers/scsi/scsi_error.o
  CC      arch/x86/kernel/paravirt.o
  CC [M]  net/sunrpc/svcsock.o
  CC [M]  net/rds/bind.o
  CC      drivers/acpi/acpica/dbhistry.o
  CC [M]  fs/romfs/super.o
  CC      lib/hexdump.o
  CC [M]  drivers/regulator/mt6359-regulator.o
  CC [M]  fs/netfs/misc.o
  CC      drivers/base/physical_location.o
  CC [M]  fs/smb/client/cifs_debug.o
  AR      fs/nls/built-in.a
  CC      fs/btrfs/transaction.o
  CC [M]  net/sunrpc/svcauth.o
  CC      arch/x86/kernel/paravirt-spinlocks.o
  CC      fs/ntfs3/lib/decompress_common.o
  CC [M]  drivers/nvme/target/trace.o
  CC [M]  net/netfilter/nf_nat_irc.o
  CC      arch/x86/kernel/pvclock.o
  ASN.1   crypto/ecrdsa_params.asn1.[ch]
  CC      arch/x86/kernel/pmem.o
  ASN.1   crypto/ecrdsa_pub_key.asn1.[ch]
  CC [M]  crypto/ecrdsa_params.asn1.o
  CC [M]  net/bridge/br_stp_timer.o
  CC [M]  net/psample/psample.o
  CC      drivers/scsi/scsi_lib.o
  CC [M]  crypto/ecrdsa_pub_key.asn1.o
  CC [M]  fs/nfs/dir.o
  CC [M]  crypto/simd.o
  CC      drivers/acpi/acpica/dbinput.o
  CC      drivers/acpi/acpica/dbmethod.o
  CC [M]  fs/autofs/symlink.o
  CC [M]  fs/nfs/file.o
  CC      drivers/mfd/max8997.o
  CC      mm/memcontrol.o
  AR      kernel/trace/built-in.a
  CC [M]  fs/smb/client/connect.o
  CC      fs/ntfs3/lib/lzx_decompress.o
  CC      drivers/base/trace.o
  CC [M]  fs/fuse/dev.o
  CC [M]  net/sctp/transport.o
  CC [M]  fs/lockd/svcproc.o
  CC [M]  drivers/regulator/mt6360-regulator.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_sg.o
  LD [M]  fs/romfs/romfs.o
  CC [M]  fs/fuse/dir.o
  CC [M]  net/dccp/output.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_tty.o
  CC [M]  drivers/nvme/target/loop.o
  CC      drivers/acpi/acpica/dbnames.o
  CC [M]  drivers/misc/mei/gsc-me.o
  CC [M]  drivers/regulator/mt6370-regulator.o
  CC      lib/kstrtox.o
  CC [M]  fs/netfs/objects.o
  CC [M]  fs/autofs/waitq.o
  CC      lib/debug_info.o
  CC [M]  net/dccp/proto.o
  CC      net/ipv6/ioam6_iptunnel.o
  CC      arch/x86/kernel/jailhouse.o
  CC      fs/ntfs3/lib/xpress_decompress.o
  CC      kernel/bpf/relo_core.o
  CC [M]  net/netfilter/nf_nat_sip.o
  CC [M]  net/rds/cong.o
  CC [M]  fs/nfs/getroot.o
  CC [M]  net/bridge/br_netlink.o
  CC      drivers/acpi/pci_irq.o
  CC [M]  fs/fuse/file.o
  AR      drivers/base/built-in.a
  CC [M]  net/sunrpc/svcauth_unix.o
  CC      drivers/acpi/acpica/dbobject.o
  CC [M]  net/bridge/br_netlink_tunnel.o
  CC      kernel/sys.o
  CC [M]  net/sunrpc/addr.o
  CC [M]  net/sunrpc/rpcb_clnt.o
  CC [M]  drivers/misc/mei/pci-txe.o
  CC [M]  crypto/ecdsa-x962.o
  AR      fs/ntfs3/built-in.a
  LD [M]  drivers/misc/bcm-vk/bcm_vk.o
  CC      kernel/umh.o
  CC      net/ipv4/sysctl_net_ipv4.o
  CC      drivers/mfd/max8997-irq.o
  CC [M]  drivers/regulator/mt6397-regulator.o
  CC [M]  drivers/regulator/qcom-labibb-regulator.o
  CC [M]  drivers/nvme/target/fc.o
  CC [M]  fs/netfs/read_collect.o
  CC [M]  net/9p/error.o
  CC      arch/x86/kernel/pcspeaker.o
  CC      drivers/acpi/acpica/dbstats.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_transport.o
  CC [M]  drivers/regulator/qcom_spmi-regulator.o
  CC [M]  net/bridge/br_arp_nd_proxy.o
  CC [M]  drivers/regulator/qcom_usb_vbus-regulator.o
  CC [M]  fs/lockd/svcsubs.o
  CC [M]  sound/soc/soc-dai.o
  CC [M]  fs/autofs/expire.o
  CC [M]  net/sctp/chunk.o
  CC [M]  net/sunrpc/timer.o
  CC [M]  drivers/misc/uacce/uacce.o
  CC [M]  fs/overlayfs/super.o
  CC      fs/btrfs/inode.o
  LD [M]  crypto/aegis128.o
  CC [M]  crypto/ecrdsa.o
  CC      lib/iomap.o
  CC      drivers/acpi/acpica/dbutils.o
  CC [M]  drivers/misc/mei/hw-txe.o
  CC      lib/iomap_copy.o
  CC      fs/btrfs/file.o
  CC [M]  fs/nfs/inode.o
  CC [M]  net/netfilter/nf_nat_tftp.o
  CC      net/ipv6/addrconf_core.o
  CC      arch/x86/kernel/check.o
  CC [M]  fs/9p/vfs_super.o
  CC      drivers/mfd/max8998.o
  CC      kernel/bpf/btf_iter.o
  CC [M]  net/sunrpc/xdr.o
  CC [M]  net/sctp/sm_make_chunk.o
  LD [M]  crypto/crypto_simd.o
  CC [M]  net/dccp/timer.o
  CC [M]  fs/lockd/mon.o
  CC [M]  fs/netfs/read_pgpriv2.o
  CC [M]  fs/9p/vfs_inode.o
  CC [M]  fs/cachefiles/cache.o
  CC [M]  net/9p/protocol.o
  CC      crypto/rsapubkey.asn1.o
  CC      drivers/acpi/acpica/dbxface.o
  CC [M]  fs/autofs/dev-ioctl.o
  CC [M]  drivers/regulator/palmas-regulator.o
  CC [M]  fs/vboxsf/dir.o
  CC      crypto/rsaprivkey.asn1.o
  LD [M]  crypto/ecdsa_generic.o
  LD [M]  crypto/ecrdsa_generic.o
  AR      crypto/built-in.a
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_ctl.o
  CC      net/ipv4/proc.o
  CC [M]  fs/vboxsf/file.o
  CC      lib/devres.o
  CC      arch/x86/kernel/uprobes.o
  CC [M]  fs/lockd/trace.o
  CC [M]  net/rds/connection.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_trigger_diag.o
  CC [M]  net/bridge/br_sysfs_if.o
  CC [M]  fs/lockd/xdr.o
  CC [M]  net/bridge/br_sysfs_br.o
  CC [M]  net/rds/info.o
  CC [M]  drivers/misc/mei/vsc-tp.o
  CC      kernel/bpf/btf_relocate.o
  CC [M]  fs/fuse/inode.o
  CC [M]  sound/soc/soc-component.o
  CC [M]  fs/overlayfs/namei.o
  CC [M]  net/netfilter/nf_synproxy_core.o
  CC [M]  net/rds/message.o
  CC [M]  sound/soc/soc-pcm.o
  CC      drivers/acpi/acpica/rsdump.o
  CC [M]  fs/nfs/super.o
  CC [M]  fs/cachefiles/daemon.o
  CC [M]  net/9p/trans_common.o
  CC [M]  drivers/misc/mei/vsc-fw-loader.o
  CC      drivers/mfd/max8998-irq.o
  CC [M]  fs/netfs/read_retry.o
  LD [M]  fs/autofs/autofs4.o
  CC [M]  sound/soc/soc-devres.o
  CC [M]  fs/fuse/control.o
  CC [M]  net/netfilter/nf_conncount.o
  CC [M]  fs/9p/vfs_inode_dotl.o
  CC      drivers/mfd/adp5520.o
  CC [M]  fs/nfs/io.o
  CC [M]  net/sctp/ulpevent.o
  CC [M]  sound/soc/soc-ops.o
  CC [M]  fs/vboxsf/utils.o
  CC [M]  drivers/nvme/target/tcp.o
  CC [M]  drivers/regulator/pca9450-regulator.o
  CC      lib/check_signature.o
  AR      drivers/acpi/acpica/built-in.a
  CC [M]  fs/smb/client/dir.o
  CC      arch/x86/kernel/perf_regs.o
  CC [M]  fs/vboxsf/vboxsf_wrappers.o
  CC      drivers/acpi/acpi_apd.o
  CC      net/ipv6/exthdrs_core.o
  CC [M]  net/9p/trans_fd.o
  LD [M]  drivers/nvme/target/nvmet.o
  CC [M]  sound/soc/soc-link.o
  CC      lib/interval_tree.o
  CC [M]  fs/lockd/netlink.o
  CC      kernel/bpf/kmem_cache_iter.o
  CC [M]  fs/vboxsf/super.o
  CC      net/ipv4/fib_rules.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.o
  CC [M]  fs/overlayfs/util.o
  CC [M]  net/bridge/br_nf_core.o
  CC [M]  net/rds/recv.o
  CC [M]  fs/cachefiles/interface.o
  CC [M]  fs/9p/vfs_addr.o
  CC [M]  net/dccp/qpolicy.o
  CC [M]  net/sctp/inqueue.o
  CC      arch/x86/kernel/tracepoint.o
  CC      drivers/acpi/acpi_platform.o
  CC [M]  fs/netfs/read_single.o
  CC [M]  drivers/regulator/pv88060-regulator.o
  CC      lib/assoc_array.o
  CC [M]  net/dccp/ccids/ccid2.o
  CC      arch/x86/kernel/itmt.o
  CC [M]  fs/fuse/xattr.o
  CC [M]  net/rds/send.o
  CC      fs/btrfs/defrag.o
  CC [M]  fs/overlayfs/inode.o
  CC [M]  drivers/misc/mei/platform-vsc.o
  CC [M]  drivers/regulator/pv88080-regulator.o
  CC [M]  fs/overlayfs/file.o
  CC [M]  net/sunrpc/sunrpc_syms.o
  CC      mm/vmpressure.o
  CC      fs/open.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.o
  CC      drivers/mfd/tps6586x.o
  CC [M]  fs/lockd/clnt4xdr.o
  CC [M]  fs/9p/vfs_file.o
  CC [M]  net/netfilter/nf_dup_netdev.o
  AR      kernel/bpf/built-in.a
  CC [M]  fs/smb/client/file.o
  CC      kernel/workqueue.o
  LD [M]  fs/vboxsf/vboxsf.o
  CC      drivers/mfd/tps65090.o
  CC      lib/list_debug.o
  CC [M]  net/bridge/br_multicast.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_warpdrive.o
  CC      arch/x86/kernel/umip.o
  CC [M]  fs/overlayfs/dir.o
  CC [M]  fs/netfs/rolling_buffer.o
  CC [M]  net/9p/trans_xen.o
  CC      drivers/mfd/aat2870-core.o
  CC [M]  fs/fuse/acl.o
  LD [M]  drivers/misc/mei/mei.o
  LD [M]  drivers/misc/mei/mei-me.o
  LD [M]  drivers/misc/mei/mei-gsc.o
  LD [M]  drivers/misc/mei/mei-txe.o
  CC      drivers/misc/sram.o
  LD [M]  drivers/misc/mei/mei-vsc-hw.o
  LD [M]  drivers/misc/mei/mei-vsc.o
  CC [M]  fs/cachefiles/io.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.o
  CC [M]  fs/nfs/direct.o
  CC [M]  fs/netfs/write_collect.o
  CC [M]  fs/netfs/write_issue.o
  LD [M]  drivers/nvme/target/nvme-loop.o
  CC [M]  fs/netfs/write_retry.o
  CC      mm/swap_cgroup.o
  CC      lib/debugobjects.o
  CC      drivers/acpi/acpi_pnp.o
  CC [M]  drivers/regulator/pv88090-regulator.o
  CC [M]  drivers/misc/ad525x_dpot.o
  CC [M]  net/sctp/outqueue.o
  CC      net/ipv6/ip6_checksum.o
  CC [M]  drivers/misc/ad525x_dpot-i2c.o
  CC [M]  net/sctp/ulpqueue.o
  CC [M]  fs/lockd/xdr4.o
  LD [M]  drivers/nvme/target/nvmet-fc.o
  LD [M]  drivers/nvme/target/nvmet-tcp.o
  CC [M]  fs/9p/vfs_dir.o
  CC [M]  net/sctp/tsnmap.o
  AR      drivers/nvme/built-in.a
  CC [M]  fs/netfs/stats.o
  CC [M]  drivers/misc/ad525x_dpot-spi.o
  CC [M]  fs/netfs/fscache_cache.o
  CC      kernel/pid.o
  CC [M]  fs/fuse/readdir.o
  CC      drivers/acpi/power.o
  CC      net/ipv4/ipmr.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_debugfs.o
  CC [M]  net/dccp/ackvec.o
  CC [M]  sound/soc/soc-card.o
  CC [M]  fs/nfs/pagelist.o
  CC [M]  drivers/regulator/pwm-regulator.o
  CC [M]  sound/soc/soc-compress.o
  CC      net/ipv4/ipmr_base.o
  CC      arch/x86/kernel/unwind_frame.o
  CC [M]  drivers/regulator/tps51632-regulator.o
  CC      net/ipv4/syncookies.o
  CC [M]  drivers/regulator/pcap-regulator.o
  CC [M]  net/9p/trans_virtio.o
  CC      mm/hugetlb_cgroup.o
  CC      drivers/mfd/intel-lpss.o
  CC [M]  net/sunrpc/cache.o
  CC [M]  drivers/misc/dummy-irq.o
  LD [M]  net/9p/9pnet.o
  CC      fs/btrfs/extent_map.o
  CC [M]  fs/fuse/ioctl.o
  CC      fs/btrfs/sysfs.o
  CC [M]  fs/smb/client/inode.o
  CC [M]  fs/overlayfs/readdir.o
  CC      fs/read_write.o
  CC [M]  fs/9p/vfs_dentry.o
  CC [M]  fs/smb/client/link.o
  CC [M]  net/netfilter/nf_tables_core.o
  CC [M]  fs/cachefiles/key.o
  CC [M]  net/sunrpc/rpc_pipe.o
  CC      kernel/task_work.o
  CC      drivers/acpi/event.o
  LD [M]  drivers/scsi/mpt3sas/mpt3sas.o
  CC      drivers/scsi/constants.o
  CC [M]  fs/nfs/read.o
  CC      lib/bitrev.o
  CC [M]  fs/lockd/svc4proc.o
  CC [M]  drivers/misc/ics932s401.o
  LD [M]  net/9p/9pnet_fd.o
  CC      drivers/scsi/scsi_lib_dma.o
  CC [M]  fs/nfs/symlink.o
  CC [M]  net/rds/stats.o
  CC      fs/btrfs/accessors.o
  CC [M]  net/netfilter/nf_tables_api.o
  CC [M]  drivers/regulator/raa215300.o
  CC [M]  sound/soc/soc-generic-dmaengine-pcm.o
  CC [M]  fs/fuse/iomode.o
  CC      net/ipv4/netfilter.o
  CC [M]  net/dccp/sysctl.o
  CC [M]  fs/netfs/fscache_cookie.o
  CC      fs/btrfs/xattr.o
  CC      arch/x86/kernel/callthunks.o
  CC [M]  fs/9p/v9fs.o
  CC      net/ipv6/ip6_icmp.o
  CC [M]  net/sctp/bind_addr.o
  CC [M]  fs/overlayfs/copy_up.o
  CC      drivers/mfd/intel-lpss-pci.o
  CC      arch/x86/kernel/cet.o
  CC [M]  fs/cachefiles/main.o
  CC      mm/memory-failure.o
  LD [M]  net/9p/9pnet_xen.o
  LD [M]  net/9p/9pnet_virtio.o
  CC      drivers/scsi/scsi_scan.o
  CC [M]  net/bridge/br_mdb.o
  CC [M]  fs/smb/client/misc.o
  CC [M]  fs/nfs/unlink.o
  CC [M]  net/vmw_vsock/af_vsock.o
  CC      lib/linear_ranges.o
  CC [M]  net/sunrpc/sysfs.o
  CC [M]  drivers/misc/tifm_core.o
  CC [M]  drivers/regulator/rc5t583-regulator.o
  CC      drivers/mfd/intel-lpss-acpi.o
  CC [M]  fs/fuse/dax.o
  CC [M]  net/sctp/socket.o
  CC      fs/file_table.o
  CC      mm/kmemleak.o
  CC [M]  net/bridge/br_multicast_eht.o
  CC [M]  sound/soc/soc-ac97.o
  CC [M]  fs/lockd/procfs.o
  CC      drivers/acpi/evged.o
  LD [M]  sound/soc/snd-soc-acpi.o
  CC [M]  fs/9p/fid.o
  CC      drivers/mfd/palmas.o
  CC      lib/packing.o
  CC [M]  net/sunrpc/svc_xprt.o
  CC [M]  net/bridge/br_vlan.o
  CC      arch/x86/kernel/shstk.o
  CC [M]  net/sunrpc/xprtmultipath.o
  CC      fs/btrfs/ordered-data.o
  CC [M]  net/dccp/ipv4.o
  CC [M]  fs/nfs/write.o
  CC      net/ipv6/output_core.o
  CC [M]  drivers/misc/tifm_7xx1.o
  CC      fs/super.o
  CC [M]  fs/fuse/passthrough.o
  CC [M]  fs/overlayfs/export.o
  CC [M]  drivers/regulator/rt4801-regulator.o
  CC      arch/x86/kernel/audit_64.o
  CC      drivers/acpi/sysfs.o
  CC [M]  net/rds/sysctl.o
  CC [M]  drivers/misc/phantom.o
  CC [M]  drivers/regulator/rt4803.o
  LD [M]  fs/lockd/lockd.o
  CC [M]  net/sctp/primitive.o
  CC [M]  net/vmw_vsock/af_vsock_tap.o
  CC      arch/x86/kernel/amd_gart_64.o
  CC [M]  fs/9p/xattr.o
  CC      net/devres.o
  CC [M]  net/vmw_vsock/vsock_addr.o
  CC [M]  net/bridge/br_vlan_tunnel.o
  CC [M]  fs/overlayfs/params.o
  CC [M]  fs/netfs/fscache_io.o
  CC      net/ipv4/tcp_cubic.o
  CC [M]  fs/fuse/sysctl.o
  CC [M]  net/rds/threads.o
  CC      lib/crc-ccitt.o
  CC [M]  fs/9p/cache.o
  CC [M]  fs/smb/client/netmisc.o
  LD [M]  sound/soc/snd-soc-core.o
  GEN     drivers/scsi/scsi_devinfo_tbl.c
  CC      drivers/scsi/scsi_devinfo.o
  CC [M]  fs/cachefiles/namei.o
  CC [M]  fs/fuse/dev_uring.o
  CC      mm/page_isolation.o
  CC [M]  net/sctp/output.o
  CC [M]  fs/netfs/fscache_main.o
  CC [M]  net/dccp/ipv6.o
  CC      fs/char_dev.o
  CC      kernel/extable.o
  CC [M]  net/vmw_vsock/vsock_bpf.o
  CC [M]  fs/netfs/fscache_volume.o
  CC [M]  fs/netfs/fscache_proc.o
  CC [M]  net/sctp/input.o
  CC      mm/zpool.o
  CC      drivers/mfd/rc5t583.o
  CC [M]  fs/cachefiles/security.o
  CC      drivers/acpi/property.o
  CC [M]  drivers/regulator/rt4831-regulator.o
  CC [M]  drivers/misc/bh1770glc.o
  CC [M]  net/bridge/br_vlan_options.o
  CC [M]  fs/cachefiles/volume.o
  CC      net/ipv6/protocol.o
  CC      arch/x86/kernel/aperture_64.o
  CC [M]  fs/overlayfs/xattrs.o
  CC      fs/stat.o
  CC [M]  fs/9p/acl.o
  CC      fs/btrfs/extent_io.o
  CC      lib/crc16.o
  CC      net/ipv6/ip6_offload.o
  CC      kernel/params.o
  CC [M]  net/sctp/debug.o
  CC      arch/x86/kernel/mmconf-fam10h_64.o
  CC      net/socket.o
  CC [M]  net/sctp/stream.o
  CC [M]  net/sctp/auth.o
  CC [M]  net/sctp/offload.o
  CC [M]  drivers/regulator/rt5033-regulator.o
  CC [M]  net/rds/transport.o
  CC [M]  net/netfilter/nft_chain_filter.o
  CC      net/ipv6/tcpv6_offload.o
  CC      net/ipv4/tcp_sigpool.o
  CC [M]  fs/fuse/cuse.o
  CC [M]  fs/smb/client/smbencrypt.o
  CC      mm/zsmalloc.o
  CC [M]  net/netfilter/nf_tables_trace.o
  CC      net/compat.o
  CC [M]  net/rds/loop.o
  CC      drivers/scsi/scsi_netlink.o
  CC      net/ipv6/exthdrs_offload.o
  CC [M]  drivers/regulator/rt5120-regulator.o
  LD [M]  fs/overlayfs/overlay.o
  CC [M]  fs/cachefiles/xattr.o
  CC [M]  fs/smb/client/transport.o
  CC [M]  net/sunrpc/debugfs.o
  CC [M]  net/vmw_vsock/diag.o
  CC      net/ipv4/tcp_bpf.o
  CC [M]  drivers/misc/apds990x.o
  LD [M]  fs/9p/9p.o
  CC [M]  net/sunrpc/backchannel_rqst.o
  CC      net/ipv4/udp_bpf.o
  CC [M]  drivers/misc/enclosure.o
  CC      drivers/mfd/rc5t583-irq.o
  CC      lib/crc-t10dif.o
  CC      arch/x86/kernel/vsmp_64.o
  CC [M]  net/bridge/br_mst.o
  CC      drivers/acpi/debugfs.o
  CC [M]  net/bridge/br_switchdev.o
  CC [M]  fs/nfs/namespace.o
  CC [M]  net/rds/page.o
  CC [M]  fs/fuse/virtio_fs.o
  CC [M]  net/dccp/diag.o
  CC [M]  fs/netfs/fscache_stats.o
  CC [M]  fs/nfs/mount_clnt.o
  CC [M]  arch/x86/kernel/msr.o
  CC      net/sysctl_net.o
  CC [M]  net/netfilter/nft_immediate.o
  CC      net/ipv6/inet6_hashtables.o
  CC [M]  fs/cachefiles/error_inject.o
  CC [M]  net/bridge/br_mrp_switchdev.o
  CC [M]  drivers/regulator/rt5190a-regulator.o
  CC [M]  net/netfilter/nft_cmp.o
  CC      drivers/mfd/syscon.o
  CC      net/ipv6/mcast_snoop.o
  CC [M]  net/sunrpc/stats.o
  CC      net/ipv4/cipso_ipv4.o
  CC [M]  net/vmw_vsock/vmci_transport.o
  CC      drivers/acpi/acpi_lpat.o
  CC      net/ipv6/tcp_ao.o
  CC      kernel/kthread.o
  CC      drivers/acpi/acpi_fpdt.o
  CC [M]  fs/smb/client/cached_dir.o
  CC      lib/crc-itu-t.o
  CC [M]  drivers/misc/smpro-errmon.o
  CC      fs/exec.o
  LD [M]  net/dccp/dccp.o
  CC      fs/pipe.o
  CC      kernel/sys_ni.o
  CC [M]  net/rds/rdma.o
  CC      drivers/scsi/scsi_sysctl.o
  HOSTCC  lib/gen_crc32table
  CC      drivers/acpi/acpi_lpit.o
  CC      drivers/mfd/as3711.o
  CC [M]  fs/smb/client/cifs_unicode.o
  CC [M]  arch/x86/kernel/cpuid.o
  CC      kernel/nsproxy.o
  LD [M]  fs/cachefiles/cachefiles.o
  CC      fs/namei.o
  CC      net/ipv4/xfrm4_policy.o
  CC [M]  drivers/regulator/rt5739.o
  CC      drivers/acpi/acpi_watchdog.o
  CC [M]  drivers/regulator/rt5759-regulator.o
  CC      mm/early_ioremap.o
  CC      fs/fcntl.o
  LD [M]  net/dccp/dccp_ipv4.o
  LD [M]  net/dccp/dccp_ipv6.o
  LD [M]  net/dccp/dccp_diag.o
  CC [M]  drivers/misc/smpro-misc.o
  CC [M]  fs/smb/client/nterr.o
  CC [M]  net/ipv6/ah6.o
  CC      drivers/acpi/prmt.o
  LD [M]  fs/netfs/netfs.o
  CC [M]  net/vmw_vsock/vmci_transport_notify.o
  CC [M]  drivers/misc/hpilo.o
  CC [M]  fs/nfs/nfstrace.o
  LD [M]  fs/fuse/fuse.o
  CC      drivers/scsi/scsi_proc.o
  LD [M]  fs/fuse/virtiofs.o
  CC [M]  net/netfilter/nft_range.o
  CC      mm/numa.o
  CC      fs/btrfs/volumes.o
  CC [M]  net/rds/tcp.o
  CC      drivers/mfd/intel_soc_pmic_crc.o
  CC [M]  net/sctp/stream_sched.o
  CC      drivers/scsi/scsi_debugfs.o
  CC [M]  net/vmw_vsock/vmci_transport_notify_qstate.o
  HOSTCC  lib/gen_crc64table
  AR      arch/x86/kernel/built-in.a
  CC [M]  net/netfilter/nft_bitwise.o
  CC [M]  drivers/regulator/rt6160-regulator.o
  AR      arch/x86/built-in.a
  CC [M]  fs/nfs/export.o
  CC      lib/xxhash.o
  CC      fs/btrfs/async-thread.o
  CC [M]  net/bridge/br_mrp.o
  CC [M]  net/bridge/br_mrp_netlink.o
  CC      fs/ioctl.o
  CC [M]  net/rds/tcp_connect.o
  CC [M]  drivers/regulator/rt6190-regulator.o
  CC      drivers/scsi/scsi_trace.o
  CC      drivers/mfd/intel_soc_pmic_chtwc.o
  CC [M]  net/sctp/stream_sched_prio.o
  CC [M]  fs/smb/client/cifsencrypt.o
  CC      lib/genalloc.o
  CC [M]  drivers/misc/apds9802als.o
  CC      kernel/notifier.o
  CC      mm/numa_memblks.o
  CC [M]  net/ipv6/esp6.o
  CC      drivers/acpi/acpi_pcc.o
  CC      kernel/ksysfs.o
  CC [M]  net/sunrpc/sysctl.o
  CC [M]  net/rds/tcp_listen.o
  CC [M]  drivers/mfd/88pm800.o
  CC      net/ipv4/xfrm4_state.o
  CC [M]  net/rds/tcp_recv.o
  CC [M]  fs/nfs/sysfs.o
  CC [M]  net/rds/tcp_send.o
  CC [M]  net/ipv6/esp6_offload.o
  CC      mm/balloon_compaction.o
  CC [M]  net/ipv6/ipcomp6.o
  CC [M]  net/bridge/br_cfm.o
  CC [M]  net/rds/tcp_stats.o
  CC      fs/btrfs/ioctl.o
  CC      drivers/scsi/scsi_logging.o
  CC      kernel/cred.o
  CC [M]  fs/smb/client/readdir.o
  CC [M]  net/vmw_vsock/virtio_transport.o
  CC [M]  net/sctp/stream_sched_rr.o
  CC      lib/textsearch.o
  CC [M]  fs/nfs/fs_context.o
  CC [M]  fs/smb/client/ioctl.o
  LD [M]  net/rds/rds.o
  CC [M]  drivers/regulator/rt6245-regulator.o
  CC [M]  drivers/misc/isl29003.o
  CC [M]  net/sctp/stream_sched_fc.o
  CC      drivers/acpi/acpi_ffh.o
  CC [M]  fs/nfs/sysctl.o
  CC      kernel/reboot.o
  CC [M]  drivers/mfd/88pm80x.o
  CC      mm/secretmem.o
  CC      lib/percpu_counter.o
  CC [M]  drivers/regulator/rtmv20-regulator.o
  CC [M]  drivers/regulator/rtq2134-regulator.o
  CC [M]  drivers/regulator/rtq6752-regulator.o
  CC      drivers/scsi/scsi_pm.o
  CC      mm/userfaultfd.o
  CC [M]  net/ipv6/xfrm6_tunnel.o
  CC      drivers/acpi/acpi_adxl.o
  CC      lib/iommu-helper.o
  CC      fs/btrfs/locking.o
  CC      drivers/scsi/scsi_dh.o
  CC      fs/readdir.o
  CC      net/ipv4/xfrm4_input.o
  CC [M]  fs/nfs/fscache.o
  CC      drivers/acpi/ac.o
  CC      fs/select.o
  CC [M]  net/netfilter/nft_byteorder.o
  CC      mm/page_idle.o
  CC [M]  drivers/mfd/88pm805.o
  CC [M]  net/sctp/stream_interleave.o
  CC      lib/fault-inject.o
  CC      drivers/scsi/scsi_bsg.o
  CC [M]  drivers/misc/isl29020.o
  CC      fs/dcache.o
  CC      net/ipv4/xfrm4_output.o
  CC      drivers/scsi/scsi_common.o
  CC [M]  net/sctp/proc.o
  LD [M]  net/rds/rds_tcp.o
  CC      drivers/scsi/virtio_scsi.o
  CC [M]  drivers/regulator/rtq2208-regulator.o
  CC      drivers/acpi/button.o
  CC      kernel/async.o
  LD [M]  net/sunrpc/sunrpc.o
  CC [M]  net/bridge/br_cfm_netlink.o
  CC [M]  fs/smb/client/sess.o
  CC      lib/error-inject.o
  CC      fs/btrfs/orphan.o
  CC [M]  fs/nfs/nfs2super.o
  CC [M]  drivers/mfd/sm501.o
  CC      drivers/scsi/sd.o
  CC      drivers/acpi/fan_core.o
  CC [M]  net/vmw_vsock/virtio_transport_common.o
  CC [M]  drivers/misc/tsl2550.o
  CC      mm/usercopy.o
  CC      net/ipv4/xfrm4_protocol.o
  CC      fs/btrfs/export.o
  CC      fs/inode.o
  CC [M]  net/netfilter/nft_payload.o
  CC [M]  net/sctp/sysctl.o
  CC      drivers/scsi/sd_dif.o
  CC      drivers/acpi/fan_attr.o
  CC [M]  drivers/regulator/sky81452-regulator.o
  CC      mm/memremap.o
  CC      fs/btrfs/tree-log.o
  CC [M]  fs/nfs/proc.o
  CC      fs/attr.o
  CC      drivers/scsi/sd_zbc.o
  CC [M]  drivers/misc/ds1682.o
  CC      fs/btrfs/free-space-cache.o
  CC      fs/btrfs/zlib.o
  CC      net/ipv4/tcp_ao.o
  CC      fs/bad_inode.o
  CC      lib/syscall.o
  CC [M]  net/bridge/br_netfilter_hooks.o
  CC [M]  fs/nfs/nfs2xdr.o
  CC [M]  drivers/mfd/bcm590xx.o
  CC      net/ipv4/bpf_tcp_ca.o
  CC [M]  net/ipv6/tunnel6.o
  CC [M]  net/bridge/br_netfilter_ipv6.o
  CC [M]  net/sctp/ipv6.o
  CC      kernel/range.o
  CC [M]  fs/smb/client/export.o
  CC [M]  net/vmw_vsock/hyperv_transport.o
  CC      drivers/acpi/fan_hwmon.o
  CC [M]  net/vmw_vsock/vsock_loopback.o
  CC [M]  net/ipv6/mip6.o
  CC      drivers/acpi/pci_slot.o
  CC [M]  net/ipv6/ip6_vti.o
  CC      kernel/smpboot.o
  CC [M]  drivers/regulator/slg51000-regulator.o
  CC      fs/file.o
  CC      lib/dynamic_debug.o
  CC [M]  net/ipv6/sit.o
  CC [M]  fs/smb/client/unc.o
  CC [M]  net/ipv6/ip6_tunnel.o
  CC [M]  fs/nfs/nfs3super.o
  CC [M]  net/ipv6/ip6_gre.o
  CC      drivers/scsi/sr.o
  LD [M]  net/bridge/bridge.o
  CC [M]  net/netfilter/nft_lookup.o
  CC [M]  drivers/misc/hmc6352.o
  LD [M]  net/vmw_vsock/vsock.o
  CC      drivers/acpi/processor_driver.o
  CC      kernel/ucount.o
  CC [M]  drivers/mfd/bd9571mwv.o
  CC [M]  net/netfilter/nft_dynset.o
  CC      fs/btrfs/lzo.o
  CC      lib/errname.o
  CC [M]  net/ipv6/fou6.o
  CC [M]  net/netfilter/nft_meta.o
  CC [M]  drivers/mfd/cros_ec_dev.o
  CC [M]  net/ipv6/ip6_udp_tunnel.o
  CC [M]  drivers/misc/vmw_balloon.o
  LD [M]  net/vmw_vsock/vsock_diag.o
  CC      fs/filesystems.o
  CC [M]  fs/smb/client/winucase.o
  CC      mm/hmm.o
  CC [M]  drivers/mfd/cs42l43.o
  CC [M]  drivers/misc/lattice-ecp3-config.o
  CC [M]  fs/nfs/nfs3client.o
  CC      fs/btrfs/zstd.o
  CC      drivers/acpi/processor_thermal.o
  CC [M]  drivers/regulator/sy7636a-regulator.o
  CC      lib/nlattr.o
  CC [M]  fs/smb/client/smb2ops.o
  CC      mm/memfd.o
  CC [M]  net/netfilter/nft_rt.o
  CC      fs/btrfs/compression.o
  CC [M]  net/sctp/diag.o
  CC      drivers/acpi/processor_idle.o
  CC [M]  drivers/misc/dw-xdata-pcie.o
  CC [M]  net/netfilter/nft_exthdr.o
  CC      drivers/scsi/sr_ioctl.o
  CC      lib/cpu_rmap.o
  CC      kernel/regset.o
  CC [M]  drivers/mfd/cs42l43-i2c.o
  CC      lib/closure.o
  CC      fs/btrfs/delayed-ref.o
  CC [M]  drivers/misc/xilinx_sdfec.o
  CC      mm/ptdump.o
  CC [M]  fs/nfs/nfs3proc.o
  LD [M]  net/vmw_vsock/vmw_vsock_vmci_transport.o
  LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport.o
  LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport_common.o
  LD [M]  net/vmw_vsock/hv_sock.o
  CC [M]  net/netfilter/nft_last.o
  CC      mm/page_reporting.o
  CC [M]  net/netfilter/nft_counter.o
  CC [M]  drivers/regulator/tps6105x-regulator.o
  LD [M]  net/bridge/br_netfilter.o
  CC      drivers/acpi/processor_throttling.o
  CC      kernel/ksyms_common.o
  CC [M]  drivers/mfd/lp873x.o
  CC      lib/dynamic_queue_limits.o
  CC [M]  fs/smb/client/smb2maperror.o
  CC [M]  fs/nfs/nfs3xdr.o
  CC      drivers/scsi/sr_vendor.o
  CC      mm/bootmem_info.o
  CC [M]  drivers/misc/tps6594-esm.o
  CC      lib/glob.o
  CC [M]  drivers/regulator/tps62360-regulator.o
  CC      drivers/scsi/sg.o
  CC      fs/namespace.o
  CC [M]  fs/nfs/nfs3acl.o
  CC      fs/seq_file.o
  CC      fs/btrfs/relocation.o
  CC      drivers/acpi/processor_perflib.o
  CC [M]  net/ipv4/ip_tunnel.o
  CC [M]  drivers/regulator/tps65023-regulator.o
  CC      fs/btrfs/delayed-inode.o
  CC [M]  drivers/mfd/tqmx86.o
  CC      mm/execmem.o
  CC [M]  net/netfilter/nft_objref.o
  CC      drivers/acpi/container.o
  LD [M]  net/sctp/sctp.o
  CC [M]  net/netfilter/nft_inner.o
  CC      drivers/acpi/thermal_lib.o
  CC [M]  drivers/scsi/raid_class.o
  CC [M]  fs/smb/client/smb2transport.o
  LD [M]  net/sctp/sctp_diag.o
  CC [M]  drivers/misc/tps6594-pfsm.o
  CC [M]  fs/smb/client/smb2misc.o
  CC [M]  drivers/misc/nsm.o
  CC      mm/shmem_quota.o
  CC      kernel/groups.o
  CC [M]  net/netfilter/nft_chain_route.o
  CC [M]  fs/nfs/nfs4proc.o
  CC      mm/pt_reclaim.o
  CC [M]  drivers/regulator/tps6507x-regulator.o
  CC [M]  drivers/scsi/scsi_transport_spi.o
  CC      fs/btrfs/scrub.o
  CC [M]  drivers/regulator/tps65086-regulator.o
  CC      kernel/vhost_task.o
  CC [M]  net/netfilter/nf_tables_offload.o
  CC      kernel/kcmp.o
  CC      fs/xattr.o
  CC      lib/digsig.o
  CC [M]  mm/hwpoison-inject.o
  CC      kernel/freezer.o
  CC      kernel/profile.o
  CC [M]  drivers/scsi/scsi_transport_fc.o
  CC [M]  net/netfilter/nft_set_hash.o
  CC [M]  fs/smb/client/smb2pdu.o
  CC [M]  drivers/mfd/arizona-core.o
  CC [M]  fs/smb/client/smb2inode.o
  CC      kernel/stacktrace.o
  CC      fs/libfs.o
  CC [M]  fs/smb/client/smb2file.o
  CC      drivers/acpi/thermal.o
  CC [M]  drivers/scsi/scsi_transport_iscsi.o
  CC [M]  net/netfilter/nft_set_bitmap.o
  CC [M]  net/netfilter/nft_set_rbtree.o
  CC [M]  net/ipv4/ipip.o
  CC      drivers/acpi/nhlt.o
  CC [M]  fs/smb/client/cifsacl.o
  CC      kernel/dma.o
  CC [M]  drivers/regulator/tps65090-regulator.o
  CC [M]  drivers/mfd/arizona-irq.o
  CC [M]  net/netfilter/nft_set_pipapo.o
  CC [M]  drivers/scsi/scsi_transport_sas.o
  CC      kernel/smp.o
  AR      drivers/misc/built-in.a
  CC [M]  drivers/regulator/tps6524x-regulator.o
  CC      fs/btrfs/backref.o
  CC [M]  fs/nfs/nfs4xdr.o
  AR      net/ipv6/built-in.a
  CC [M]  net/netfilter/nft_set_pipapo_avx2.o
  CC [M]  drivers/scsi/scsi_transport_srp.o
  AR      mm/built-in.a
  CC      kernel/uid16.o
  CC      lib/strncpy_from_user.o
  CC      kernel/module_signature.o
  CC      kernel/kallsyms.o
  CC [M]  fs/smb/client/fs_context.o
  CC      lib/strnlen_user.o
  CC [M]  net/netfilter/nft_ct_fast.o
  CC      lib/net_utils.o
  CC      fs/btrfs/ulist.o
  CC [M]  fs/smb/client/dns_resolve.o
  CC [M]  net/ipv4/fou_core.o
  CC      drivers/acpi/acpi_memhotplug.o
  CC      kernel/acct.o
  CC      fs/fs-writeback.o
  CC [M]  drivers/regulator/tps6586x-regulator.o
  CC      lib/sg_pool.o
  ASN.1   fs/smb/client/cifs_spnego_negtokeninit.asn1.[ch]
  CC [M]  drivers/scsi/iscsi_boot_sysfs.o
  CC [M]  fs/nfs/nfs4state.o
  CC      kernel/vmcore_info.o
  CC [M]  drivers/mfd/wm5102-tables.o
  CC      fs/btrfs/qgroup.o
  CC [M]  drivers/scsi/megaraid.o
  CC      drivers/acpi/ioapic.o
  CC [M]  net/ipv4/fou_nl.o
  CC      fs/pnode.o
  CC [M]  drivers/mfd/wm5110-tables.o
  CC      kernel/elfcorehdr.o
  CC [M]  drivers/scsi/vmw_pvscsi.o
  CC [M]  drivers/regulator/tps65910-regulator.o
  CC      fs/btrfs/send.o
  CC      fs/btrfs/dev-replace.o
  CC [M]  net/ipv4/fou_bpf.o
  CC [M]  fs/smb/client/namespace.o
  CC      drivers/acpi/battery.o
  CC      kernel/crash_reserve.o
  CC [M]  fs/nfs/nfs4renewd.o
  CC      lib/memregion.o
  CC [M]  fs/nfs/nfs4super.o
  CC      fs/splice.o
  CC      drivers/acpi/hed.o
  CC [M]  fs/smb/client/reparse.o
  CC      fs/sync.o
  CC      kernel/kexec_core.o
  CC      drivers/acpi/bgrt.o
  CC [M]  net/netfilter/nft_compat.o
  CC      kernel/crash_core.o
  CC      fs/btrfs/raid56.o
  CC [M]  fs/nfs/nfs4file.o
  CC [M]  fs/smb/client/xattr.o
  CC      fs/btrfs/uuid-tree.o
  CC      kernel/kexec.o
  CC      drivers/acpi/cppc_acpi.o
  CC [M]  fs/nfs/delegation.o
  CC [M]  drivers/scsi/xen-scsifront.o
  CC      fs/utimes.o
  CC [M]  net/ipv4/gre_demux.o
  CC      fs/btrfs/props.o
  CC [M]  drivers/regulator/tps65912-regulator.o
  CC      fs/d_path.o
  CC [M]  fs/nfs/nfs4idmap.o
  CC      lib/irq_poll.o
  CC [M]  drivers/mfd/wm8997-tables.o
  CC [M]  net/netfilter/nft_connlimit.o
  CC      lib/stackdepot.o
  CC [M]  fs/nfs/callback.o
  CC [M]  net/ipv4/ip_gre.o
  CC      fs/stack.o
  CC      kernel/kexec_file.o
  CC      drivers/acpi/spcr.o
  CC [M]  drivers/scsi/storvsc_drv.o
  CC [M]  drivers/regulator/tps65132-regulator.o
  CC [M]  fs/nfs/callback_xdr.o
  CC [M]  fs/smb/client/cifs_spnego.o
  CC      fs/btrfs/free-space-tree.o
  CC      kernel/compat.o
  CC      drivers/acpi/acpi_dbg.o
  CC      drivers/acpi/viot.o
  CC [M]  drivers/mfd/wm8998-tables.o
  CC      kernel/utsname.o
  CC [M]  drivers/mfd/cs47l24-tables.o
  CC [M]  net/netfilter/nft_numgen.o
  CC [M]  fs/smb/client/dfs_cache.o
  CC [M]  drivers/acpi/acpi_ipmi.o
  CC      lib/ref_tracker.o
  CC      fs/btrfs/tree-checker.o
  CC [M]  drivers/scsi/ses.o
  CC      lib/bootconfig.o
  CC [M]  drivers/regulator/tps68470-regulator.o
  CC      fs/btrfs/space-info.o
  CC [M]  net/ipv4/udp_tunnel_core.o
  CC      lib/asn1_decoder.o
  CC      kernel/user_namespace.o
  CC [M]  fs/smb/client/dfs.o
  CC [M]  drivers/regulator/twl-regulator.o
  CC      fs/fs_struct.o
  CC [M]  fs/nfs/callback_proc.o
  CC [M]  drivers/scsi/scsi_debug.o
  CC [M]  drivers/mfd/arizona-i2c.o
  CC      lib/asn1_encoder.o
  GEN     lib/oid_registry_data.c
  CC      kernel/pid_namespace.o
  CC [M]  net/ipv4/udp_tunnel_nic.o
  CC [M]  drivers/regulator/twl6030-regulator.o
  CC      fs/btrfs/block-rsv.o
  CC [M]  net/ipv4/ip_vti.o
  CC      fs/statfs.o
  CC [M]  fs/nfs/nfs4namespace.o
  CC      fs/btrfs/delalloc-space.o
  CC [M]  fs/nfs/nfs4getroot.o
  CC      lib/ucs2_string.o
  CC [M]  fs/nfs/nfs4client.o
  CC      fs/btrfs/block-group.o
  CC [M]  net/ipv4/ah4.o
  CC [M]  drivers/mfd/arizona-spi.o
  CC [M]  net/netfilter/nft_ct.o
  CC [M]  drivers/mfd/wcd934x.o
  CC [M]  fs/nfs/nfs4session.o
  CC      fs/btrfs/discard.o
  CC [M]  drivers/regulator/wm831x-dcdc.o
  CC [M]  drivers/acpi/acpi_video.o
  CC [M]  fs/nfs/dns_resolve.o
  CC      fs/fs_pin.o
  CC [M]  drivers/regulator/wm831x-isink.o
  CC      fs/btrfs/reflink.o
  CC [M]  drivers/regulator/wm831x-ldo.o
  CC [M]  net/ipv4/esp4.o
  CC      fs/nsfs.o
  UPD     kernel/config_data
  CC [M]  fs/smb/client/netlink.o
  CC [M]  fs/smb/client/cifs_swn.o
  CC      lib/ubsan.o
  CC [M]  fs/smb/client/fscache.o
  CC [M]  drivers/acpi/video_detect.o
  CC [M]  net/netfilter/nft_flow_offload.o
  CC [M]  fs/nfs/nfs4trace.o
  CC [M]  fs/smb/client/smb1ops.o
  CC [M]  drivers/acpi/acpi_tad.o
  CC      fs/btrfs/subpage.o
  CC [M]  drivers/mfd/wm8994-core.o
  CC      fs/fs_types.o
  CC [M]  drivers/mfd/wm8994-irq.o
  CC      kernel/stop_machine.o
  CC [M]  drivers/acpi/platform_profile.o
  CC [M]  drivers/mfd/wm8994-regmap.o
  CC [M]  net/ipv4/esp4_offload.o
  CC [M]  drivers/regulator/wm8350-regulator.o
  CC [M]  net/netfilter/nft_limit.o
  CC [M]  drivers/acpi/sbshc.o
  CC [M]  fs/smb/client/cifssmb.o
  CC [M]  drivers/acpi/sbs.o
  CC [M]  net/ipv4/ipcomp.o
  CC [M]  drivers/acpi/ec_sys.o
  CC [M]  drivers/mfd/madera-core.o
  CC [M]  fs/nfs/nfs4sysctl.o
  CC      fs/fs_context.o
  CC      lib/sbitmap.o
  CC [M]  fs/smb/client/cifs_spnego_negtokeninit.asn1.o
  CC [M]  drivers/acpi/pfr_update.o
  CC      fs/btrfs/tree-mod-log.o
  CC      fs/fs_parser.o
  CC      kernel/audit.o
  CC [M]  drivers/acpi/pfr_telemetry.o
  CC [M]  drivers/mfd/cs47l15-tables.o
  CC      lib/group_cpus.o
  CC      fs/btrfs/extent-io-tree.o
  CC      kernel/auditfilter.o
  CC      fs/fsopen.o
  CC      fs/btrfs/fs.o
  CC      kernel/auditsc.o
  CC [M]  net/netfilter/nft_nat.o
  CC [M]  drivers/regulator/wm8400-regulator.o
  CC      fs/init.o
  CC      kernel/audit_watch.o
  CC [M]  drivers/mfd/cs47l35-tables.o
  CC      kernel/audit_fsnotify.o
  CC [M]  fs/nfs/pnfs.o
  CC [M]  net/ipv4/xfrm4_tunnel.o
  CC [M]  net/netfilter/nft_queue.o
  CC [M]  drivers/regulator/wm8994-regulator.o
  CC      kernel/audit_tree.o
  CC [M]  drivers/mfd/cs47l85-tables.o
  CC      fs/kernel_read_file.o
  CC [M]  fs/smb/client/asn1.o
  CC      kernel/kprobes.o
  CC      fs/btrfs/messages.o
  CC [M]  drivers/mfd/cs47l90-tables.o
  CC      lib/fw_table.o
  CC [M]  net/ipv4/tunnel4.o
  CC      fs/btrfs/bio.o
  CC [M]  lib/crc7.o
  CC [M]  drivers/acpi/acpi_pad.o
  CC      fs/btrfs/lru_cache.o
  CC [M]  fs/nfs/pnfs_dev.o
  CC      fs/mnt_idmapping.o
  CC [M]  drivers/mfd/cs47l92-tables.o
  CC      kernel/fail_function.o
  CC [M]  net/netfilter/nft_quota.o
  CC [M]  fs/nfs/pnfs_nfs.o
  CC [M]  net/netfilter/nft_reject.o
  CC [M]  lib/crc8.o
  CC [M]  net/netfilter/nft_reject_inet.o
  CC      fs/remap_range.o
  CC      kernel/hung_task.o
  CC      fs/pidfs.o
  CC [M]  lib/bch.o
  CC [M]  drivers/acpi/acpi_extlog.o
  CC [M]  net/ipv4/inet_diag.o
  CC [M]  lib/ts_kmp.o
  CC [M]  drivers/mfd/madera-i2c.o
  CC      fs/btrfs/raid-stripe-tree.o
  CC [M]  net/netfilter/nft_reject_netdev.o
  CC      fs/btrfs/fiemap.o
  CC [M]  drivers/mfd/madera-spi.o
  CC [M]  net/netfilter/nft_tunnel.o
  CC [M]  net/ipv4/tcp_diag.o
  CC [M]  lib/ts_bm.o
  CC [M]  drivers/acpi/acpi_configfs.o
  CC [M]  lib/ts_fsm.o
  CC      fs/buffer.o
  CC      kernel/watchdog.o
  CC [M]  fs/nfs/nfs42proc.o
  CC [M]  drivers/mfd/cs40l50-core.o
  CC [M]  fs/nfs/nfs42xattr.o
  CC [M]  net/ipv4/udp_diag.o
  CC      fs/mpage.o
  CC      fs/btrfs/direct-io.o
  CC      fs/proc_namespace.o
  CC      kernel/watchdog_perf.o
  CC [M]  net/ipv4/raw_diag.o
  LD [M]  fs/nfs/nfs.o
  CC [M]  net/netfilter/nft_log.o
  CC [M]  drivers/mfd/cs40l50-i2c.o
  LD [M]  fs/nfs/nfsv2.o
  CC [M]  net/netfilter/nft_masq.o
  CC      fs/direct-io.o
  CC [M]  lib/notifier-error-inject.o
  AR      drivers/regulator/built-in.a
  CC [M]  net/netfilter/nft_redir.o
  CC [M]  lib/pm-notifier-error-inject.o
  CC [M]  drivers/mfd/cs40l50-spi.o
  LD [M]  fs/nfs/nfsv3.o
  CC [M]  net/netfilter/nft_hash.o
  CC      fs/eventpoll.o
  CC [M]  net/netfilter/nft_fib.o
  CC [M]  net/netfilter/nft_fib_inet.o
  CC      kernel/seccomp.o
  LD [M]  drivers/scsi/hv_storvsc.o
  CC      fs/btrfs/acl.o
  CC [M]  drivers/mfd/tps6105x.o
  CC      kernel/relay.o
  LD [M]  drivers/acpi/video.o
  AR      drivers/acpi/built-in.a
  CC [M]  drivers/mfd/tps65010.o
  CC      kernel/utsname_sysctl.o
  CC      fs/btrfs/zoned.o
  CC      fs/btrfs/verity.o
  CC      drivers/scsi/scsi_sysfs.o
  CC      kernel/delayacct.o
  CC [M]  lib/memory-notifier-error-inject.o
  CC [M]  net/netfilter/nft_fib_netdev.o
  CC      fs/anon_inodes.o
  CC [M]  drivers/mfd/tps6507x.o
  CC [M]  lib/lru_cache.o
  CC      fs/signalfd.o
  CC [M]  net/netfilter/nft_socket.o
  CC [M]  net/netfilter/nft_osf.o
  CC [M]  drivers/mfd/tps65086.o
  CC      fs/timerfd.o
  CC      kernel/taskstats.o
  CC [M]  net/netfilter/nft_tproxy.o
  CC      kernel/tsacct.o
  CC [M]  net/netfilter/nft_xfrm.o
  CC [M]  drivers/mfd/tps6594-core.o
  CC [M]  net/netfilter/nft_synproxy.o
  CC      kernel/tracepoint.o
  CC      fs/eventfd.o
  CC [M]  drivers/mfd/tps6594-i2c.o
  CC      fs/userfaultfd.o
  CC      kernel/latencytop.o
  CC [M]  net/netfilter/nft_chain_nat.o
  CC      kernel/irq_work.o
  CC [M]  drivers/mfd/tps6594-spi.o
  CC      kernel/static_call.o
  CC      fs/aio.o
  CC      kernel/static_call_inline.o
  CC      fs/dax.o
  CC [M]  drivers/mfd/mc13xxx-core.o
  CC      kernel/user-return-notifier.o
  CC      fs/locks.o
  CC [M]  net/netfilter/nft_dup_netdev.o
  LD [M]  fs/smb/client/cifs.o
  CC      kernel/padata.o
  CC [M]  drivers/mfd/mc13xxx-spi.o
  CC [M]  net/netfilter/nft_fwd_netdev.o
  CC      fs/binfmt_script.o
  CC      fs/binfmt_elf.o
  CC [M]  drivers/mfd/mc13xxx-i2c.o
  CC      kernel/jump_label.o
  CC [M]  net/netfilter/nf_flow_table_core.o
  CC [M]  net/netfilter/nf_flow_table_ip.o
  CC      kernel/context_tracking.o
  CC      fs/compat_binfmt_elf.o
  CC [M]  drivers/mfd/ocelot-core.o
  CC      kernel/iomem.o
  CC [M]  net/netfilter/nf_flow_table_offload.o
  CC [M]  drivers/mfd/ocelot-spi.o
  CC      kernel/rseq.o
  LD [M]  net/ipv4/fou.o
  CC      fs/backing-file.o
  CC      kernel/watch_queue.o
  LD [M]  net/ipv4/gre.o
  LD [M]  net/ipv4/udp_tunnel.o
  AR      net/ipv4/built-in.a
  CHK     kernel/kheaders_data.tar.xz
  AR      lib/lib.a
  CC [M]  net/netfilter/nf_flow_table_xdp.o
  GEN     lib/crc32table.h
  GEN     lib/crc64table.h
  CC      lib/oid_registry.o
  CC [M]  net/netfilter/nf_flow_table_inet.o
  CC      fs/mbcache.o
  CC [M]  drivers/mfd/axp20x.o
  CC [M]  drivers/mfd/axp20x-i2c.o
  GZIP    kernel/config_data.gz
  GEN     kernel/kheaders_data.tar.xz
  CC [M]  drivers/mfd/lp3943.o
  CC [M]  net/netfilter/x_tables.o
  CC [M]  drivers/mfd/ti-lmu.o
  CC      fs/posix_acl.o
  CC      kernel/configs.o
  CC [M]  net/netfilter/xt_tcpudp.o
  CC [M]  drivers/mfd/da9062-core.o
  CC [M]  drivers/mfd/da9150-core.o
  CC      fs/coredump.o
  CC [M]  drivers/mfd/max77541.o
  CC [M]  net/netfilter/xt_mark.o
  AR      drivers/scsi/built-in.a
  CC      fs/drop_caches.o
  CC [M]  net/netfilter/xt_connmark.o
  CC [M]  drivers/mfd/max8907.o
  CC      fs/sysctls.o
  CC [M]  drivers/mfd/mp2629.o
  CC      fs/fhandle.o
  CC [M]  drivers/mfd/mt6360-core.o
  CC [M]  net/netfilter/xt_nat.o
  CC [M]  drivers/mfd/mt6370.o
  CC      fs/bpf_fs_kfuncs.o
  CC [M]  drivers/mfd/mt6397-core.o
  AR      fs/btrfs/built-in.a
  CC [M]  fs/binfmt_misc.o
  CC [M]  net/netfilter/xt_AUDIT.o
  CC [M]  drivers/mfd/mt6397-irq.o
  CC [M]  net/netfilter/xt_CHECKSUM.o
  CC [M]  drivers/mfd/mt6358-irq.o
  CC      lib/crc32.o
  CC      lib/crc64.o
  CC [M]  net/netfilter/xt_CLASSIFY.o
  CC [M]  drivers/mfd/kempld-core.o
  CC [M]  net/netfilter/xt_CONNSECMARK.o
  CC [M]  net/netfilter/xt_CT.o
  CC [M]  drivers/mfd/intel_quark_i2c_gpio.o
  CC [M]  drivers/mfd/lpc_sch.o
  CC [M]  net/netfilter/xt_DSCP.o
  CC [M]  drivers/mfd/lpc_ich.o
  CC [M]  drivers/mfd/rdc321x-southbridge.o
  CC [M]  net/netfilter/xt_HL.o
  CC [M]  drivers/mfd/janz-cmodio.o
  CC [M]  net/netfilter/xt_HMARK.o
  CC [M]  drivers/mfd/vx855.o
  CC [M]  drivers/mfd/wl1273-core.o
  CC [M]  net/netfilter/xt_LED.o
  CC [M]  net/netfilter/xt_LOG.o
  CC [M]  drivers/mfd/si476x-cmd.o
  CC [M]  drivers/mfd/si476x-prop.o
  CC [M]  net/netfilter/xt_NETMAP.o
  CC [M]  drivers/mfd/si476x-i2c.o
  CC [M]  drivers/mfd/intel_pmc_bxt.o
  CC [M]  net/netfilter/xt_NFLOG.o
  CC [M]  net/netfilter/xt_NFQUEUE.o
  LD [M]  fs/nfs/nfsv4.o
  CC [M]  drivers/mfd/viperboard.o
  CC [M]  drivers/mfd/lm3533-core.o
  CC [M]  net/netfilter/xt_RATEEST.o
  CC [M]  drivers/mfd/lm3533-ctrlbank.o
  CC [M]  net/netfilter/xt_REDIRECT.o
  CC [M]  net/netfilter/xt_MASQUERADE.o
  CC [M]  drivers/mfd/retu-mfd.o
  CC [M]  drivers/mfd/iqs62x.o
  AR      kernel/built-in.a
  CC [M]  drivers/mfd/menf21bmc.o
  CC [M]  drivers/mfd/dln2.o
  CC [M]  net/netfilter/xt_SECMARK.o
  CC [M]  drivers/mfd/rt4831.o
  CC [M]  net/netfilter/xt_TPROXY.o
  CC [M]  drivers/mfd/rt5033.o
  CC [M]  drivers/mfd/rt5120.o
  CC [M]  drivers/mfd/sky81452.o
  CC [M]  net/netfilter/xt_TCPMSS.o
  CC [M]  drivers/mfd/intel_soc_pmic_bxtwc.o
  CC [M]  net/netfilter/xt_TCPOPTSTRIP.o
  CC [M]  drivers/mfd/intel_soc_pmic_chtdc_ti.o
  CC [M]  net/netfilter/xt_TEE.o
  AR      lib/built-in.a
  CC [M]  net/netfilter/xt_TRACE.o
  CC [M]  drivers/mfd/intel_soc_pmic_mrfld.o
  CC [M]  drivers/mfd/rave-sp.o
  CC [M]  net/netfilter/xt_IDLETIMER.o
  CC [M]  drivers/mfd/simple-mfd-i2c.o
  CC [M]  net/netfilter/xt_addrtype.o
  CC [M]  drivers/mfd/smpro-core.o
  CC [M]  drivers/mfd/intel-m10-bmc-core.o
  CC [M]  drivers/mfd/intel-m10-bmc-spi.o
  CC [M]  drivers/mfd/atc260x-core.o
  CC [M]  net/netfilter/xt_bpf.o
  CC [M]  drivers/mfd/atc260x-i2c.o
  CC [M]  net/netfilter/xt_cluster.o
  CC [M]  net/netfilter/xt_comment.o
  CC [M]  net/netfilter/xt_connbytes.o
  CC [M]  net/netfilter/xt_connlabel.o
  AR      fs/built-in.a
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
  CC [M]  net/netfilter/xt_l2tp.o
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
  CC [M]  net/netfilter/xt_quota.o
  CC [M]  net/netfilter/xt_rateest.o
  CC [M]  net/netfilter/xt_realm.o
  CC [M]  net/netfilter/xt_recent.o
  CC [M]  net/netfilter/xt_sctp.o
  CC [M]  net/netfilter/xt_socket.o
  CC [M]  net/netfilter/xt_state.o
  CC [M]  net/netfilter/xt_statistic.o
  LD [M]  drivers/mfd/arizona.o
  CC [M]  net/netfilter/xt_string.o
  CC [M]  net/netfilter/xt_tcpmss.o
  LD [M]  drivers/mfd/wm8994.o
  CC [M]  net/netfilter/xt_time.o
  LD [M]  drivers/mfd/madera.o
  LD [M]  drivers/mfd/ocelot-soc.o
  CC [M]  net/netfilter/xt_u32.o
  LD [M]  drivers/mfd/mt6397.o
  LD [M]  drivers/mfd/si476x-core.o
  AR      drivers/mfd/built-in.a
make[3]: *** [../scripts/Makefile.build:461: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
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


