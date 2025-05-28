Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90BAC5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 09:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E9C10E59F;
	Wed, 28 May 2025 09:12:39 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7AB10E59F;
 Wed, 28 May 2025 09:12:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EBuild=3A_failure_for_drm/xe/guc=3A_Resend_potential?=
 =?utf-8?q?ly_lost_H2G_MMIO_request?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 09:12:37 -0000
Message-ID: <174842355782.27372.394300843123433153@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250528090021.329-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250528090021.329-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/guc: Resend potentially lost H2G MMIO request
URL   : https://patchwork.freedesktop.org/series/149575/
State : failure

== Summary ==

AR      drivers/xen/events/built-in.a
  CC      kernel/time/vsyscall.o
  CC      drivers/xen/xenbus/xenbus_client.o
  CC      fs/squashfs/file_direct.o
  CC [M]  drivers/dma/idxd/submit.o
  CC      drivers/regulator/fixed-helper.o
  CC [M]  drivers/video/fbdev/core/fb_ddc.o
  CC      kernel/bpf/inode.o
  CC      net/handshake/alert.o
  CC [M]  net/llc/llc_core.o
  CC      net/handshake/genl.o
  CC      drivers/acpi/acpica/exfldio.o
  CC      drivers/acpi/pmic/intel_pmic_chtwc.o
  CC      mm/highmem.o
  CC [M]  net/llc/llc_input.o
  CC [M]  drivers/reset/reset-tps380x.o
  CC [M]  drivers/gpio/gpio-ml-ioh.o
  CC      kernel/exec_domain.o
  CC      drivers/virtio/virtio_pci_modern_dev.o
  CC [M]  drivers/leds/leds-max8997.o
  CC [M]  sound/pci/hda/hda_hwdep.o
  AR      drivers/xen/xen-pciback/built-in.a
  CC [M]  drivers/xen/xen-pciback/pci_stub.o
  CC [M]  net/xfrm/xfrm_interface_core.o
  CC      lib/earlycpio.o
  CC [M]  drivers/video/backlight/sky81452-backlight.o
  CC      block/blk-crypto.o
  CC [M]  net/netfilter/nf_conntrack_timestamp.o
  CC [M]  net/ipv6/netfilter/ip6t_hbh.o
  CC      block/blk-crypto-profile.o
  CC [M]  net/netfilter/nf_conntrack_ecache.o
  CC      fs/squashfs/decompressor_single.o
  CC      drivers/pci/host-bridge.o
  CC      drivers/regulator/helpers.o
  CC [M]  net/netfilter/nf_conntrack_labels.o
  CC      drivers/acpi/acpica/exmisc.o
  CC      lib/extable.o
  AR      net/ncsi/built-in.a
  CC      drivers/regulator/devres.o
  CC      net/core/fib_notifier.o
  CC      drivers/acpi/pmic/intel_pmic_chtdc_ti.o
  AR      drivers/reset/built-in.a
  CC      drivers/xen/xenbus/xenbus_comms.o
  CC [M]  net/sched/cls_flow.o
  CC      mm/memory.o
  CC      drivers/xen/xenbus/xenbus_xs.o
  CC [M]  sound/pci/hda/hda_beep.o
  CC [M]  drivers/gpio/gpio-pca953x.o
  CC      crypto/drbg.o
  AR      drivers/video/fbdev/core/built-in.a
  CC [M]  drivers/leds/leds-mc13783.o
  CC      fs/squashfs/decompressor_multi.o
  CC      kernel/trace/trace_seq.o
  CC      net/ipv4/inet_hashtables.o
  CC      drivers/acpi/acpica/exmutex.o
  CC      kernel/time/timekeeping_debug.o
  CC [M]  net/sched/cls_cgroup.o
  AR      drivers/video/fbdev/built-in.a
  CC      arch/x86/kernel/fred.o
  CC      fs/ext4/page-io.o
  CC      fs/squashfs/decompressor_multi_percpu.o
  CC [M]  drivers/dma/idxd/dma.o
  CC      lib/flex_proportions.o
  CC [M]  drivers/video/backlight/wm831x_bl.o
  CC      drivers/acpi/pmic/tps68470_pmic.o
  CC      kernel/time/namespace.o
  CC      block/blk-crypto-sysfs.o
  CC [M]  net/tls/tls_main.o
  CC      drivers/virtio/virtio_pci_legacy_dev.o
  CC      drivers/regulator/irq_helpers.o
  CC      net/core/xdp.o
  CC      drivers/acpi/acpica/exnames.o
  CC      kernel/events/uprobes.o
  CC [M]  net/llc/llc_output.o
  CC [M]  drivers/xen/xen-pciback/pciback_ops.o
  CC      drivers/pci/remove.o
  CC [M]  drivers/leds/leds-menf21bmc.o
  CC      lib/idr.o
  CC [M]  net/tls/tls_sw.o
  CC      fs/fat/cache.o
  CC [M]  drivers/xen/xen-pciback/xenbus.o
  CC      drivers/tty/vt/vt_ioctl.o
  CC      net/ipv6/udplite.o
  CC [M]  net/ipv6/netfilter/ip6t_rpfilter.o
  CC      fs/fat/dir.o
  CC      net/ipv4/inet_timewait_sock.o
  CC      net/handshake/netlink.o
  CC [M]  net/netfilter/nf_conntrack_ovs.o
  CC      fs/squashfs/xattr.o
  CC [M]  net/netfilter/nf_conntrack_proto_dccp.o
  AR      drivers/acpi/pmic/built-in.a
  CC      net/ipv6/raw.o
  CC      kernel/trace/trace_stat.o
  CC      drivers/acpi/acpica/exoparg1.o
  CC      block/blk-crypto-fallback.o
  LD [M]  net/xfrm/xfrm_interface.o
  AR      net/xfrm/built-in.a
  CC [M]  drivers/video/backlight/arcxcnn_bl.o
  CC      arch/x86/kernel/ldt.o
  CC      net/ipv4/inet_connection_sock.o
  CC [M]  drivers/gpio/gpio-pca9570.o
  AR      kernel/time/built-in.a
  CC      drivers/xen/xenbus/xenbus_probe.o
  CC      net/ipv6/icmp.o
  CC      fs/ext4/readpage.o
  CC [M]  sound/pci/hda/hda_generic.o
  CC [M]  net/llc/llc_if.o
  CC [M]  net/sched/cls_bpf.o
  CC      drivers/regulator/event.o
  CC      crypto/jitterentropy.o
  CC [M]  drivers/leds/leds-mlxcpld.o
  CC      crypto/jitterentropy-kcapi.o
  CC [M]  drivers/leds/leds-mlxreg.o
  CC [M]  net/tls/tls_proc.o
  CC      crypto/ghash-generic.o
  CC      drivers/acpi/acpica/exoparg2.o
  CC      lib/iomem_copy.o
  CC      drivers/virtio/virtio_mmio.o
  AR      drivers/dma/mediatek/built-in.a
  CC [M]  drivers/dma/amd/ptdma/ptdma-dev.o
  AR      drivers/dma/amd/built-in.a
  CC [M]  drivers/dma/amd/ptdma/ptdma-dmaengine.o
  CC      block/holder.o
  CC      fs/squashfs/xattr_id.o
  CC [M]  drivers/dma/idxd/cdev.o
  CC [M]  drivers/xen/xen-pciback/conf_space.o
  CC      drivers/pci/pci.o
  CC      drivers/clk/clk-divider.o
  CC [M]  drivers/dma/amd/ptdma/ptdma-debugfs.o
  CC      lib/irq_regs.o
  CC      kernel/panic.o
  CC [M]  net/ipv6/netfilter/ip6t_rt.o
  CC      kernel/trace/trace_printk.o
  CC [M]  drivers/video/backlight/rave-sp-backlight.o
  CC [M]  drivers/gpio/gpio-pcf857x.o
  CC [M]  net/netfilter/nf_conntrack_proto_sctp.o
  CC      drivers/acpi/acpica/exoparg3.o
  CC [M]  drivers/leds/leds-mt6323.o
  CC      lib/is_single_threaded.o
  CC      net/handshake/request.o
  CC      crypto/ecc.o
  CC      arch/x86/kernel/setup.o
  CC [M]  drivers/regulator/fixed.o
  CC      fs/ext4/resize.o
  CC [M]  net/ipv6/netfilter/ip6t_srh.o
  CC      fs/squashfs/lz4_wrapper.o
  CC      drivers/tty/vt/vc_screen.o
  CC      drivers/tty/hvc/hvc_console.o
  CC      net/core/flow_offload.o
  CC      fs/squashfs/lzo_wrapper.o
  CC [M]  net/llc/llc_c_ev.o
  CC [M]  arch/x86/kvm/vmx/nested.o
  CC      fs/squashfs/xz_wrapper.o
  CC      drivers/virtio/virtio_pci_modern.o
  CC      drivers/acpi/acpica/exoparg6.o
  CC [M]  drivers/xen/xen-pciback/conf_space_header.o
  CC      net/ipv6/mcast.o
  CC      drivers/xen/xenbus/xenbus_probe_backend.o
  CC      lib/klist.o
  CC      net/ipv6/reassembly.o
  CC [M]  drivers/leds/leds-nic78bx.o
  CC [M]  block/kyber-iosched.o
  CC [M]  net/sched/cls_flower.o
  CC [M]  net/llc/llc_c_ac.o
  CC      net/ipv6/tcp_ipv6.o
  CC      fs/fat/fatent.o
  CC [M]  drivers/gpio/gpio-pcie-idio-24.o
  AR      kernel/events/built-in.a
  CC [M]  drivers/gpio/gpio-pci-idio-16.o
  CC [M]  drivers/regulator/virtual.o
  CC [M]  drivers/gpio/gpio-pisosr.o
  CC [M]  drivers/dma/idxd/debugfs.o
  AR      drivers/video/backlight/built-in.a
  CC      drivers/acpi/acpica/exprep.o
  CC      net/ipv6/ping.o
  AR      drivers/video/built-in.a
  CC      drivers/tty/hvc/hvc_irq.o
  CC [M]  net/sched/cls_matchall.o
  CC [M]  drivers/dma/amd/ptdma/ptdma-pci.o
  CC [M]  drivers/leds/leds-pca9532.o
  CC      drivers/clk/clk-fixed-factor.o
  CC      fs/squashfs/zlib_wrapper.o
  CC      drivers/tty/vt/selection.o
  CC [M]  net/netfilter/nf_conntrack_proto_gre.o
  CC [M]  arch/x86/kvm/vmx/posted_intr.o
  CC      lib/kobject.o
  CC [M]  net/netfilter/nf_conntrack_netlink.o
  CC [M]  net/tls/trace.o
  CC      arch/x86/kernel/x86_init.o
  CC      kernel/trace/pid_list.o
  CC [M]  net/tls/tls_strp.o
  CC      drivers/acpi/acpica/exregion.o
  CC [M]  net/ipv6/netfilter/ip6t_NPT.o
  CC      kernel/cpu.o
  CC      drivers/tty/hvc/hvc_xen.o
  CC [M]  drivers/xen/xen-pciback/conf_space_capability.o
  CC      net/handshake/tlshd.o
  CC [M]  drivers/xen/xen-pciback/conf_space_quirks.o
  CC      lib/kobject_uevent.o
  CC      fs/ext4/super.o
  CC [M]  drivers/gpio/gpio-rdc321x.o
  LD [M]  drivers/dma/amd/ptdma/ptdma.o
  CC [M]  drivers/regulator/userspace-consumer.o
  CC [M]  drivers/gpio/gpio-sch311x.o
  CC      fs/squashfs/zstd_wrapper.o
  CC      drivers/clk/clk-fixed-rate.o
  CC      drivers/xen/xenbus/xenbus_dev_frontend.o
  CC [M]  drivers/gpio/gpio-sch.o
  CC [M]  drivers/dma/idxd/defaults.o
  CC      drivers/acpi/acpica/exresnte.o
  CC [M]  drivers/leds/leds-pca955x.o
  CC [M]  drivers/gpio/gpio-sim.o
  CC      net/ipv4/tcp.o
  CC      drivers/virtio/virtio_pci_common.o
  CC [M]  net/ipv6/netfilter/ip6t_REJECT.o
  CC      drivers/xen/xenbus/xenbus_dev_backend.o
  CC      net/core/gro.o
  AR      drivers/dma/qcom/built-in.a
  CC      crypto/ecdh.o
  CC [M]  drivers/dma/qcom/hidma_mgmt.o
  CC [M]  net/llc/llc_conn.o
  CC [M]  net/sched/em_cmp.o
  CC      drivers/xen/xenbus/xenbus_probe_frontend.o
  CC [M]  block/bfq-iosched.o
  CC      kernel/trace/tracing_map.o
  CC [M]  drivers/dma/idxd/perfmon.o
  CC [M]  drivers/xen/xen-pciback/vpci.o
  CC      drivers/tty/vt/keyboard.o
  CC      arch/x86/kernel/i8259.o
  CC      drivers/acpi/acpica/exresolv.o
  CC      mm/mincore.o
  CC      drivers/virtio/virtio_pci_legacy.o
  CC      drivers/tty/vt/vt.o
  AR      drivers/tty/hvc/built-in.a
  CC [M]  drivers/leds/leds-pca963x.o
  CC      fs/fat/file.o
  CC [M]  drivers/xen/xenfs/super.o
  CC [M]  drivers/regulator/88pg86x.o
  AR      fs/squashfs/built-in.a
  CC [M]  arch/x86/kvm/vmx/main.o
  CC      lib/logic_pio.o
  CC      drivers/acpi/dptf/int340x_thermal.o
  CC [M]  net/tls/tls_device.o
  CC      drivers/clk/clk-gate.o
  LD [M]  drivers/dma/idxd/idxd_bus.o
  CC      net/ipv6/exthdrs.o
  CC      crypto/ecdh_helper.o
  CC [M]  arch/x86/kvm/vmx/sgx.o
  CC [M]  drivers/gpio/gpio-siox.o
  CC      drivers/acpi/acpica/exresop.o
  CC      net/ipv6/datagram.o
  CC      drivers/pci/pci-driver.o
  CC [M]  sound/pci/hda/patch_realtek.o
  CC [M]  drivers/xen/xenfs/xenstored.o
  CC [M]  net/sched/em_nbyte.o
  CC [M]  drivers/dma/qcom/hidma_mgmt_sys.o
  CC      net/ipv4/tcp_input.o
  CC      net/handshake/trace.o
  CC      drivers/virtio/virtio_pci_admin_legacy_io.o
  CC [M]  drivers/xen/xen-pciback/passthrough.o
  CC [M]  net/ipv6/netfilter/ip6t_SYNPROXY.o
  CC      drivers/char/hw_random/core.o
  CC [M]  drivers/regulator/88pm800-regulator.o
  CC [M]  block/bfq-wf2q.o
  CC [M]  drivers/acpi/dptf/dptf_power.o
  CC      lib/maple_tree.o
  CC      drivers/pci/search.o
  CC      drivers/acpi/acpica/exserial.o
  LD [M]  drivers/dma/idxd/idxd.o
  CC [M]  drivers/leds/leds-pca995x.o
  CC      arch/x86/kernel/irqinit.o
  CC      drivers/acpi/x86/apple.o
  CC [M]  net/llc/llc_c_st.o
  CC      arch/x86/kernel/jump_label.o
  CC      lib/memcat_p.o
  CC      crypto/xor.o
  AR      drivers/xen/xenbus/built-in.a
  CC      lib/min_heap.o
  CC      kernel/trace/trace_sched_switch.o
  CC [M]  net/sched/em_u32.o
  CC [M]  drivers/gpio/gpio-sloppy-logic-analyzer.o
  CC [M]  drivers/xen/xenfs/xensyms.o
  CC      drivers/acpi/acpica/exstore.o
  CC      drivers/clk/clk-multiplier.o
  CC [M]  sound/soc/codecs/ac97.o
  CC [M]  net/netfilter/nfnetlink_cttimeout.o
  CC      mm/mlock.o
  CC [M]  drivers/acpi/dptf/dptf_pch_fivr.o
  CC      fs/fat/inode.o
  LD [M]  drivers/xen/xen-pciback/xen-pciback.o
  CC      arch/x86/kernel/irq_work.o
  CC      drivers/clk/clk-mux.o
  CC [M]  arch/x86/kvm/vmx/hyperv.o
  CC [M]  drivers/acpi/nfit/core.o
  CC [M]  drivers/regulator/88pm8607.o
  CC      drivers/acpi/x86/cmos_rtc.o
  CC [M]  drivers/dma/qcom/hidma_ll.o
  CC      net/core/netdev-genl.o
  CC [M]  drivers/acpi/nfit/intel.o
  AR      drivers/dma/stm32/built-in.a
  CC      drivers/clk/clk-composite.o
  CC [M]  drivers/leds/leds-pwm.o
  CC      drivers/clk/clk-fractional-divider.o
  CC [M]  drivers/gpio/gpio-tangier.o
  CC      drivers/clk/clk-gpio.o
  CC      fs/exfat/inode.o
  CC [M]  net/llc/llc_pdu.o
  CC      drivers/acpi/acpica/exstoren.o
  CC      drivers/virtio/virtio_balloon.o
  LD [M]  drivers/xen/xenfs/xenfs.o
  CC      drivers/xen/cpu_hotplug.o
  CC [M]  net/key/af_key.o
  CC [M]  net/sched/em_meta.o
  CC [M]  drivers/char/hw_random/timeriomem-rng.o
  CC [M]  net/tls/tls_device_fallback.o
  CC [M]  drivers/clk/clk_kunit_helpers.o
  CC      crypto/hash_info.o
  CC [M]  sound/soc/codecs/ak4619.o
  CC      net/ipv4/tcp_output.o
  CC      kernel/bpf/helpers.o
  CC [M]  drivers/char/hw_random/intel-rng.o
  LD [M]  net/ipv6/netfilter/nf_defrag_ipv6.o
  AR      net/handshake/built-in.a
  CC      kernel/exit.o
  AR      drivers/acpi/dptf/built-in.a
  CC      crypto/kdf_sp800108.o
  CC [M]  arch/x86/kvm/vmx/hyperv_evmcs.o
  CC      drivers/pci/rom.o
  CC [M]  drivers/clk/clk-cdce706.o
  CC      kernel/trace/trace_functions.o
  CC      drivers/acpi/acpica/exstorob.o
  CC [M]  drivers/regulator/aat2870-regulator.o
  CC [M]  drivers/leds/leds-regulator.o
  CC      arch/x86/kernel/probe_roms.o
  CC [M]  drivers/dma/qcom/hidma.o
  CC [M]  drivers/clk/clk-cs2000-cp.o
  CC      drivers/acpi/x86/lpss.o
  CC [M]  arch/x86/kvm/vmx/vmx_onhyperv.o
  CC      drivers/xen/grant-table.o
  CC      kernel/trace/trace_preemptirq.o
  CC [M]  drivers/clk/clk-lmk04832.o
  CC      mm/mmap.o
  CC      fs/fat/misc.o
  CC [M]  net/llc/llc_sap.o
  CC [M]  net/netfilter/nfnetlink_cthelper.o
  COPY    drivers/tty/vt/defkeymap.c
  CC      drivers/acpi/acpica/exsystem.o
  CC      drivers/tty/vt/consolemap.o
  CC [M]  drivers/virtio/virtio_input.o
  CC      fs/exfat/namei.o
  CC [M]  drivers/char/hw_random/amd-rng.o
  CC      net/ipv6/ip6_flowlabel.o
  CC      fs/isofs/namei.o
  CC [M]  sound/soc/codecs/cs40l50-codec.o
  CC [M]  drivers/gpio/gpio-tpic2810.o
  CC [M]  drivers/dma/qcom/hidma_dbg.o
  CC [M]  drivers/gpio/gpio-tps65086.o
  CC [M]  drivers/clk/clk-max9485.o
  CC [M]  drivers/leds/leds-tca6507.o
  CC [M]  crypto/crypto_engine.o
  CC [M]  drivers/regulator/act8865-regulator.o
  HOSTCC  drivers/tty/vt/conmakehash
  CC      net/core/netdev-genl-gen.o
  CC [M]  sound/pci/hda/patch_senarytech.o
  CC      drivers/pci/setup-res.o
  CC      drivers/acpi/acpica/extrace.o
  CC [M]  block/bfq-cgroup.o
  CC [M]  drivers/regulator/ad5398.o
  CC      mm/mmu_gather.o
  CC      drivers/char/agp/backend.o
  CC [M]  net/sched/em_text.o
  CC [M]  drivers/gpio/gpio-tps65912.o
  CC [M]  drivers/virtio/virtio_vdpa.o
  CC      kernel/trace/trace_sched_wakeup.o
  CC [M]  drivers/char/hw_random/ba431-rng.o
  CC      arch/x86/kernel/sys_ia32.o
  CC      fs/isofs/inode.o
  CC      drivers/acpi/x86/s2idle.o
  CC [M]  sound/soc/codecs/cs530x.o
  CC      arch/x86/kernel/signal_32.o
  CC      drivers/acpi/x86/utils.o
  CC      fs/fat/nfs.o
  LD [M]  drivers/dma/qcom/hdma_mgmt.o
  LD [M]  drivers/dma/qcom/hdma.o
  CC      drivers/acpi/acpica/exutils.o
  CC [M]  drivers/char/tpm/st33zp24/st33zp24.o
  AR      drivers/dma/ti/built-in.a
  CC [M]  net/llc/llc_s_ac.o
  AR      drivers/dma/xilinx/built-in.a
  CC [M]  drivers/dma/xilinx/xilinx_dma.o
  CC      fs/fat/namei_vfat.o
  CC [M]  drivers/dma/xilinx/xdma.o
  CC [M]  drivers/clk/clk-palmas.o
  CC      kernel/trace/trace_hwlat.o
  CC      fs/exfat/dir.o
  CC [M]  sound/pci/hda/patch_hdmi.o
  CC      drivers/xen/features.o
  CC      net/core/gso.o
  CC [M]  arch/x86/kvm/svm/svm.o
  CC [M]  net/netfilter/nf_conntrack_amanda.o
  CC [M]  drivers/leds/leds-ti-lmu-common.o
  CC [M]  drivers/gpio/gpio-tps68470.o
  CC [M]  sound/pci/hda/hda_eld.o
  CC      fs/ext4/symlink.o
  CC      drivers/tty/vt/defkeymap.o
  LD [M]  net/tls/tls.o
  CC [M]  drivers/leds/leds-tlc591xx.o
  AR      block/built-in.a
  CC [M]  drivers/regulator/arizona-ldo1.o
  CC      drivers/char/tpm/tpm-chip.o
  CC [M]  drivers/char/hw_random/via-rng.o
  CC [M]  drivers/acpi/nfit/mce.o
  CC      drivers/acpi/acpica/hwacpi.o
  CC      fs/fat/namei_msdos.o
  LD [M]  block/bfq.o
  CC      fs/exportfs/expfs.o
  CC [M]  crypto/echainiv.o
  CONMK   drivers/tty/vt/consolemap_deftbl.c
  CC      drivers/tty/vt/consolemap_deftbl.o
  CC [M]  net/sched/em_ipt.o
  CC      drivers/acpi/tables.o
  CC      drivers/pci/irq.o
  AR      drivers/tty/vt/built-in.a
  CC      drivers/tty/serial/8250/8250_core.o
  CC      drivers/tty/serdev/core.o
  CC      drivers/acpi/x86/blacklist.o
  CC      fs/nls/nls_base.o
  CC      drivers/char/agp/generic.o
  CC      arch/x86/kernel/sys_x86_64.o
  CC      drivers/acpi/acpica/hwesleep.o
  CC      drivers/char/tpm/tpm-dev-common.o
  CC [M]  drivers/clk/clk-pwm.o
  CC [M]  drivers/virtio/virtio_mem.o
  CC [M]  drivers/gpio/gpio-tqmx86.o
  CC      mm/mprotect.o
  CC [M]  net/llc/llc_s_ev.o
  CC [M]  drivers/char/hw_random/virtio-rng.o
  CC      kernel/bpf/tnum.o
  CC [M]  drivers/tty/serial/jsm/jsm_driver.o
  CC      fs/isofs/dir.o
  CC      drivers/pci/vpd.o
  CC      drivers/tty/serial/serial_core.o
  CC [M]  drivers/char/hw_random/xiphera-trng.o
  CC      kernel/trace/trace_osnoise.o
  CC      kernel/bpf/log.o
  CC [M]  drivers/regulator/arizona-micsupp.o
  CC      net/ipv6/inet6_connection_sock.o
  CC [M]  drivers/char/tpm/st33zp24/i2c.o
  LD [M]  drivers/acpi/nfit/nfit.o
  CC      drivers/char/tpm/tpm-dev.o
  CC [M]  drivers/leds/leds-tps6105x.o
  CC      fs/exfat/super.o
  CC [M]  sound/soc/codecs/cs530x-i2c.o
  CC      kernel/bpf/token.o
  CC      drivers/xen/balloon.o
  CC [M]  crypto/ecdsa.o
  CC      drivers/acpi/acpica/hwgpe.o
  CC      drivers/acpi/osi.o
  AR      drivers/acpi/x86/built-in.a
  CC      kernel/bpf/bpf_iter.o
  AR      fs/fat/built-in.a
  CC      drivers/tty/serial/serial_base_bus.o
  CC [M]  drivers/clk/clk-si5341.o
  CC      drivers/tty/serial/8250/8250_platform.o
  AR      fs/exportfs/built-in.a
  AR      drivers/tty/ipwireless/built-in.a
  CC [M]  drivers/tty/serial/jsm/jsm_neo.o
  CC [M]  net/netfilter/nf_conntrack_ftp.o
  CC      kernel/trace/trace_nop.o
  CC [M]  drivers/gpio/gpio-twl4030.o
  CC      arch/x86/kernel/espfix_64.o
  CC      drivers/tty/serial/8250/8250_pnp.o
  CC [M]  drivers/dma/dw/core.o
  AR      drivers/char/hw_random/built-in.a
  CC      fs/nls/nls_cp437.o
  CC      drivers/acpi/acpica/hwregs.o
  CC [M]  drivers/dma/dw/dw.o
  CC [M]  drivers/clk/clk-si5351.o
  CC      kernel/softirq.o
  CC      fs/isofs/util.o
  CC [M]  net/llc/llc_s_st.o
  ASN.1   crypto/ecdsasignature.asn1.[ch]
  CC [M]  crypto/ecdsa-p1363.o
  CC      arch/x86/kernel/ksysfs.o
  CC      drivers/tty/serdev/serdev-ttyport.o
  CC [M]  net/bridge/netfilter/nft_meta_bridge.o
  CC [M]  drivers/leds/leds-wm831x-status.o
  CC [M]  drivers/char/tpm/st33zp24/spi.o
  CC [M]  sound/soc/codecs/es8311.o
  CC      lib/nmi_backtrace.o
  CC [M]  drivers/regulator/as3711-regulator.o
  CC      mm/mremap.o
  CC      net/core/net-sysfs.o
  CC [M]  sound/pci/hda/hda_component.o
  AR      net/sched/built-in.a
  CC      net/core/hotdata.o
  CC      fs/isofs/rock.o
  CC      drivers/tty/serial/8250/8250_rsa.o
  CC      net/core/netdev_rx_queue.o
  CC [M]  fs/nls/nls_cp737.o
  CC      fs/exfat/fatent.o
  CC      drivers/acpi/acpica/hwsleep.o
  CC      drivers/char/agp/isoch.o
  CC [M]  drivers/regulator/atc260x-regulator.o
  LD [M]  drivers/char/tpm/st33zp24/tpm_st33zp24.o
  CC      drivers/pci/setup-bus.o
  CC      net/ipv4/tcp_timer.o
  CC [M]  net/bridge/netfilter/nft_reject_bridge.o
  CC [M]  drivers/gpio/gpio-twl6040.o
  CC [M]  drivers/regulator/aw37503-regulator.o
  CC      net/ipv4/tcp_ipv4.o
  CC [M]  net/bridge/netfilter/nf_conntrack_bridge.o
  CC [M]  crypto/ecdsasignature.asn1.o
  CC [M]  sound/hda/ext/hdac_ext_bus.o
  CC [M]  drivers/virtio/virtio_dma_buf.o
  CC [M]  crypto/crypto_user.o
  CC [M]  sound/x86/intel_hdmi_audio.o
  AR      drivers/tty/serdev/built-in.a
  CC      arch/x86/kernel/bootflag.o
  CC [M]  drivers/tty/serial/jsm/jsm_tty.o
  CC [M]  drivers/dma/dw-edma/dw-edma-core.o
  CC      drivers/xen/manage.o
  CC [M]  drivers/leds/leds-wm8350.o
  CC [M]  drivers/tty/serial/jsm/jsm_cls.o
  CC [M]  drivers/dma/ioat/init.o
  CC      lib/objpool.o
  CC [M]  fs/nls/nls_cp775.o
  CC      drivers/acpi/acpica/hwvalid.o
  CC [M]  net/llc/af_llc.o
  LD [M]  drivers/char/tpm/st33zp24/tpm_st33zp24_i2c.o
  LD [M]  drivers/char/tpm/st33zp24/tpm_st33zp24_spi.o
  CC      drivers/pci/vc.o
  CC      drivers/char/tpm/tpm-interface.o
  CC [M]  sound/soc/amd/acp-config.o
  CC [M]  drivers/dma/dw-edma/dw-edma-v0-core.o
  CC      drivers/tty/serial/8250/8250_port.o
  CC      fs/ext4/sysfs.o
  CC [M]  drivers/clk/clk-si544.o
  CC      kernel/bpf/map_iter.o
  CC      fs/isofs/export.o
  CC [M]  sound/soc/codecs/hda.o
  CC      net/ipv6/udp_offload.o
  CC      fs/exfat/cache.o
  CC [M]  net/netfilter/nf_conntrack_h323_main.o
  CC      drivers/char/agp/amd64-agp.o
  CC      drivers/pci/mmap.o
  CC [M]  drivers/gpio/gpio-viperboard.o
  CC      drivers/acpi/acpica/hwxface.o
  CC [M]  drivers/regulator/axp20x-regulator.o
  CC [M]  drivers/dma/dw/idma32.o
  CC      arch/x86/kernel/e820.o
  CC [M]  sound/pci/hda/hda_intel.o
  CC [M]  fs/nls/nls_cp850.o
  CC [M]  drivers/leds/leds-dac124s085.o
  CC      kernel/trace/trace_stack.o
  CC      mm/msync.o
  CC      lib/plist.o
  UPD     arch/x86/kvm/kvm-asm-offsets.h
  CC [M]  arch/x86/kvm/svm/pmu.o
  CC [M]  drivers/dma/dw-edma/dw-hdma-v0-core.o
  CC [M]  drivers/dma/dw-edma/dw-edma-v0-debugfs.o
  CC      lib/radix-tree.o
  CC [M]  drivers/clk/clk-tps68470.o
  CC [M]  crypto/cmac.o
  LD [M]  drivers/tty/serial/jsm/jsm.o
  CC [M]  sound/hda/ext/hdac_ext_controller.o
  CC [M]  net/bridge/br.o
  CC      drivers/char/agp/intel-agp.o
  AR      drivers/virtio/built-in.a
  CC      fs/isofs/joliet.o
  CC [M]  sound/hda/hda_bus_type.o
  CC      drivers/acpi/acpica/hwxfsleep.o
  LD [M]  sound/x86/snd-hdmi-lpe-audio.o
  CC      drivers/tty/serial/8250/8250_dma.o
  CC      fs/ext4/xattr.o
  CC [M]  arch/x86/kvm/svm/nested.o
  CC [M]  net/bridge/br_device.o
  CC [M]  drivers/dma/ioat/dma.o
  CC      drivers/pci/devres.o
  CC [M]  sound/hda/hdac_bus.o
  CC [M]  net/bridge/br_fdb.o
  CC [M]  fs/nls/nls_cp852.o
  CC      fs/exfat/nls.o
  CC [M]  net/bridge/br_forward.o
  CC [M]  drivers/gpio/gpio-virtuser.o
  CC [M]  drivers/dma/ioat/prep.o
  CC [M]  drivers/dma/ioat/dca.o
  CC      drivers/xen/time.o
  CC [M]  net/bridge/netfilter/ebtables.o
  CC      kernel/bpf/task_iter.o
  LD [M]  sound/soc/amd/snd-acp-config.o
  CC [M]  drivers/gpio/gpio-virtio.o
  CC      fs/isofs/compress.o
  CC [M]  drivers/regulator/bcm590xx-regulator.o
  CC      drivers/char/tpm/tpm1-cmd.o
  CC [M]  drivers/leds/leds-spi-byte.o
  CC [M]  drivers/char/mwave/mwavedd.o
  CC      net/ipv6/seg6.o
  CC [M]  net/llc/llc_station.o
  CC [M]  sound/soc/codecs/hda-dai.o
  CC      mm/page_vma_mapped.o
  CC [M]  drivers/clk/clk-twl6040.o
  CC [M]  crypto/xcbc.o
  CC      net/ipv6/fib6_notifier.o
  CC      kernel/trace/trace_mmiotrace.o
  CC [M]  drivers/dma/dw/acpi.o
  CC [M]  fs/nls/nls_cp855.o
  CC [M]  drivers/gpio/gpio-vx855.o
  CC [M]  net/llc/llc_proc.o
  CC      drivers/acpi/acpica/hwpci.o
  CC [M]  drivers/dma/dw-edma/dw-hdma-v0-debugfs.o
  CC      drivers/char/agp/intel-gtt.o
  CC [M]  net/bridge/br_if.o
  CC      net/core/page_pool.o
  CC [M]  crypto/md4.o
  CC      drivers/xen/mem-reservation.o
  CC      fs/exfat/misc.o
  CC      drivers/tty/serial/8250/8250_dwlib.o
  CC [M]  drivers/leds/uleds.o
  CC [M]  drivers/dma/ioat/sysfs.o
  CC [M]  sound/hda/ext/hdac_ext_stream.o
  LD [M]  sound/pci/hda/snd-hda-codec.o
  CC [M]  drivers/char/mwave/smapi.o
  CC      drivers/acpi/acpica/nsaccess.o
  LD [M]  sound/pci/hda/snd-hda-codec-generic.o
  CC      net/ipv4/tcp_minisocks.o
  LD [M]  sound/pci/hda/snd-hda-codec-realtek.o
  AR      fs/isofs/built-in.a
  CC [M]  drivers/regulator/bd9571mwv-regulator.o
  CC      kernel/resource.o
  CC [M]  arch/x86/kvm/svm/avic.o
  LD [M]  sound/pci/hda/snd-hda-codec-senarytech.o
  LD [M]  sound/pci/hda/snd-hda-codec-hdmi.o
  LD [M]  sound/pci/hda/snd-hda-scodec-component.o
  CC [M]  fs/nls/nls_cp857.o
  LD [M]  sound/pci/hda/snd-hda-intel.o
  CC      arch/x86/kernel/pci-dma.o
  CC [M]  sound/pci/rme9652/hdsp.o
  CC      arch/x86/kernel/quirks.o
  CC [M]  net/netfilter/nf_conntrack_h323_asn1.o
  CC [M]  arch/x86/kvm/svm/sev.o
  CC [M]  net/netfilter/nf_conntrack_irc.o
  CC      drivers/char/tpm/tpm2-cmd.o
  CC [M]  drivers/clk/clk-twl.o
  CC      drivers/pci/proc.o
  CC      lib/ratelimit.o
  CC [M]  drivers/gpio/gpio-wcove.o
  CC [M]  drivers/dma/dw-edma/dw-edma-pcie.o
  CC [M]  drivers/gpio/gpio-winbond.o
  CC      kernel/bpf/prog_iter.o
  CC [M]  drivers/gpio/gpio-wm831x.o
  CC      kernel/trace/trace_functions_graph.o
  CC      kernel/trace/blktrace.o
  CC [M]  drivers/clk/clk-wm831x.o
  CC      net/ipv6/rpl.o
  CC      mm/pagewalk.o
  CC [M]  crypto/rmd160.o
  CC      drivers/acpi/acpica/nsalloc.o
  CC [M]  sound/soc/codecs/hdmi-codec.o
  CC [M]  drivers/dma/dw/platform.o
  CC      mm/pgtable-generic.o
  CC [M]  net/llc/sysctl_net_llc.o
  CC      fs/exfat/file.o
  CC [M]  fs/nls/nls_cp860.o
  CC [M]  drivers/char/mwave/tp3780i.o
  CC      lib/rbtree.o
  LD [M]  drivers/dma/ioat/ioatdma.o
  CC [M]  arch/x86/kvm/svm/hyperv.o
  CC      drivers/acpi/acpica/nsarguments.o
  CC      drivers/char/agp/via-agp.o
  CC [M]  drivers/regulator/da903x-regulator.o
  CC      kernel/sysctl.o
  CC      mm/rmap.o
  AR      drivers/leds/built-in.a
  CC      drivers/xen/pci.o
  CC      fs/ext4/xattr_hurd.o
  CC      kernel/capability.o
  LD [M]  net/llc/llc.o
  CC [M]  fs/nls/nls_cp861.o
  CC      drivers/pci/pci-sysfs.o
  CC [M]  drivers/dma/sf-pdma/sf-pdma.o
  CC      fs/ext4/xattr_trusted.o
  CC      drivers/dma/dmaengine.o
  CC [M]  net/bridge/br_input.o
  CC [M]  drivers/gpio/gpio-wm8350.o
  CC      drivers/tty/serial/8250/8250_fintek.o
  CC      drivers/acpi/acpica/nsconvert.o
  LD [M]  drivers/dma/dw-edma/dw-edma.o
  CC      drivers/dma/virt-dma.o
  LD [M]  sound/hda/ext/snd-hda-ext-core.o
  CC      kernel/ptrace.o
  CC [M]  sound/hda/hdac_device.o
  CC [M]  net/bridge/br_ioctl.o
  AR      drivers/clk/built-in.a
  CC      drivers/tty/tty_io.o
  CC [M]  drivers/dma/dw/pci.o
  LD [M]  net/llc/llc2.o
  CC      lib/seq_buf.o
  CC      fs/exfat/balloc.o
  CC      arch/x86/kernel/kdebugfs.o
  CC      kernel/bpf/link_iter.o
  CC      net/core/page_pool_user.o
  CC [M]  crypto/sm3.o
  CC [M]  drivers/char/mwave/3780i.o
  CC [M]  drivers/char/agp/sis-agp.o
  CC      drivers/char/tpm/tpmrm-dev.o
  CC      net/core/net-procfs.o
  CC [M]  fs/nls/nls_cp862.o
  CC      net/ipv6/ioam6.o
  CC      drivers/char/tpm/tpm2-space.o
  CC [M]  drivers/regulator/da9052-regulator.o
  CC      net/core/netpoll.o
  CC [M]  sound/soc/codecs/pcm6240.o
  CC      drivers/char/tpm/tpm-sysfs.o
  CC      net/ipv6/sysctl_net_ipv6.o
  CC      fs/unicode/utf8-norm.o
  CC [M]  fs/nls/nls_cp863.o
  CC      drivers/acpi/acpica/nsdump.o
  AR      sound/built-in.a
  CC      drivers/xen/dbgp.o
  CC      fs/ext4/xattr_user.o
  CC      arch/x86/kernel/alternative.o
  CC      fs/ext4/fast_commit.o
  CC [M]  fs/nls/nls_cp864.o
  CC      drivers/dma/acpi-dma.o
  CC      drivers/tty/serial/8250/8250_pcilib.o
  CC [M]  drivers/gpio/gpio-wm8994.o
  CC [M]  net/netfilter/nf_conntrack_broadcast.o
  CC [M]  net/bridge/netfilter/ebtable_broute.o
  LD [M]  drivers/dma/dw/dw_dmac_core.o
  LD [M]  drivers/dma/dw/dw_dmac.o
  LD [M]  drivers/dma/dw/dw_dmac_pci.o
  CC [M]  fs/nls/nls_cp865.o
  CC [M]  sound/pci/rme9652/hdspm.o
  CC      kernel/bpf/hashtab.o
  AR      fs/exfat/built-in.a
  CC      arch/x86/kernel/i8253.o
  AR      drivers/char/agp/built-in.a
  LD [M]  drivers/char/mwave/mwave.o
  CC      arch/x86/kernel/hw_breakpoint.o
  CC      kernel/bpf/arraymap.o
  CC      arch/x86/kernel/tsc.o
  CC      drivers/acpi/acpica/nseval.o
  CC      drivers/pci/slot.o
  CC      kernel/bpf/percpu_freelist.o
  CC      net/ipv4/tcp_cong.o
  CC      fs/unicode/utf8-core.o
  COPY    fs/unicode/utf8data.c
  CC      arch/x86/kernel/tsc_msr.o
  CC      kernel/bpf/bpf_lru_list.o
  CC      drivers/iommu/amd/iommu.o
  CC      lib/siphash.o
  CC      drivers/iommu/intel/dmar.o
  CC [M]  drivers/regulator/da9055-regulator.o
  AR      drivers/iommu/arm/arm-smmu/built-in.a
  CC      kernel/trace/fgraph.o
  AR      drivers/iommu/arm/arm-smmu-v3/built-in.a
  CC      drivers/tty/serial/serial_ctrl.o
  AR      drivers/iommu/arm/built-in.a
  CC      drivers/tty/serial/serial_port.o
  CC      drivers/char/tpm/eventlog/common.o
  CC      drivers/tty/n_tty.o
  CC      drivers/xen/acpi.o
  CC      kernel/trace/trace_events.o
  CC [M]  sound/hda/hdac_sysfs.o
  CC [M]  net/bridge/netfilter/ebtable_filter.o
  CC [M]  drivers/gpio/gpio-ws16c48.o
  CC      drivers/acpi/acpica/nsinit.o
  CC [M]  drivers/regulator/da9062-regulator.o
  CC [M]  fs/nls/nls_cp866.o
  CC [M]  net/bridge/netfilter/ebtable_nat.o
  CC [M]  net/bridge/netfilter/ebt_802_3.o
  CC [M]  drivers/gpio/gpio-xra1403.o
  CC      drivers/acpi/osl.o
  LD [M]  sound/pci/rme9652/snd-hdsp.o
  CC      lib/string.o
  LD [M]  sound/soc/codecs/snd-soc-ac97.o
  LD [M]  sound/soc/codecs/snd-soc-ak4619.o
  LD [M]  sound/soc/codecs/snd-soc-cs40l50.o
  LD [M]  sound/soc/codecs/snd-soc-cs530x.o
  CC [M]  sound/hda/hdac_regmap.o
  LD [M]  sound/soc/codecs/snd-soc-cs530x-i2c.o
  LD [M]  sound/soc/codecs/snd-soc-es8311.o
  LD [M]  sound/soc/codecs/snd-soc-hda-codec.o
  LD [M]  sound/soc/codecs/snd-soc-hdmi-codec.o
  LD [M]  sound/soc/codecs/snd-soc-pcm6240.o
  CC      drivers/iommu/amd/init.o
  CC [M]  crypto/sm3_generic.o
  CC [M]  net/bridge/netfilter/ebt_among.o
  CC [M]  sound/soc/dwc/dwc-i2s.o
  CC [M]  sound/soc/dwc/dwc-pcm.o
  CC [M]  sound/hda/hdac_controller.o
  CC      drivers/tty/serial/8250/8250_early.o
  CC [M]  drivers/dma/altera-msgdma.o
  CC [M]  sound/hda/hdac_stream.o
  CC      drivers/acpi/utils.o
  CC      drivers/tty/serial/earlycon.o
  CC      lib/timerqueue.o
  CC      drivers/acpi/acpica/nsload.o
  CC [M]  sound/hda/array.o
  CC [M]  fs/nls/nls_cp869.o
  CC [M]  arch/x86/kvm/svm/svm_onhyperv.o
  CC      drivers/iommu/intel/iommu.o
  CC      fs/unicode/utf8data.o
  CC      drivers/char/tpm/eventlog/tpm1.o
  CC      arch/x86/kernel/io_delay.o
  CC      net/ipv6/ip6mr.o
  CC      drivers/pci/pci-acpi.o
  CC      net/ipv6/xfrm6_policy.o
  CC [M]  drivers/regulator/da9210-regulator.o
  CC [M]  fs/nls/nls_cp874.o
  CC [M]  drivers/char/xillybus/xillybus_class.o
  CC      lib/union_find.o
  CC      drivers/acpi/acpica/nsnames.o
  CC [M]  net/bridge/netfilter/ebt_arp.o
  CC      kernel/trace/trace_export.o
  CC      drivers/tty/serial/max310x.o
  CC [M]  net/netfilter/nf_conntrack_netbios_ns.o
  CC [M]  fs/nls/nls_cp932.o
  CC      lib/vsprintf.o
  CC      fs/ext4/orphan.o
  CC      drivers/tty/serial/sccnxp.o
  CC      drivers/tty/serial/8250/8250_dw.o
  CC [M]  net/bridge/br_stp.o
  CC      kernel/bpf/lpm_trie.o
  CC      drivers/xen/xen-acpi-pad.o
  CC [M]  net/sunrpc/auth_gss/auth_gss.o
  AR      drivers/gpio/built-in.a
  CC      net/ipv6/xfrm6_state.o
  CC      mm/vmalloc.o
  CC      net/ipv6/xfrm6_input.o
  CC      mm/vma.o
  LD [M]  sound/soc/dwc/designware_i2s.o
  CC [M]  crypto/streebog_generic.o
  CC      arch/x86/kernel/rtc.o
  CC      net/core/fib_rules.o
  CC [M]  sound/hda/hdmi_chmap.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-byt-match.o
  CC [M]  drivers/dma/idma64.o
  CC [M]  crypto/wp512.o
  CC [M]  sound/soc/intel/atom/sst/sst.o
  CC      drivers/char/tpm/eventlog/tpm2.o
  LD [M]  arch/x86/kvm/kvm.o
  CC [M]  sound/hda/trace.o
  CC      drivers/acpi/acpica/nsobject.o
  AS [M]  arch/x86/kvm/vmx/vmenter.o
  LD [M]  sound/pci/rme9652/snd-hdspm.o
  AR      fs/unicode/built-in.a
  CC [M]  sound/soc/intel/atom/sst/sst_ipc.o
  CC      drivers/xen/pcpu.o
  AS [M]  arch/x86/kvm/svm/vmenter.o
  CC [M]  fs/nls/nls_euc-jp.o
  CC [M]  sound/pci/ad1889.o
  CC [M]  drivers/regulator/da9211-regulator.o
  LD [M]  arch/x86/kvm/kvm-intel.o
  CC      net/ipv6/xfrm6_output.o
  CC      drivers/acpi/reboot.o
  LD [M]  arch/x86/kvm/kvm-amd.o
  CC      net/ipv6/xfrm6_protocol.o
  CC [M]  sound/hda/hdac_component.o
  CC [M]  net/netfilter/nf_conntrack_snmp.o
  CC      net/ipv4/tcp_metrics.o
  CC [M]  net/kcm/kcmsock.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cht-match.o
  CC [M]  drivers/char/xillybus/xillybus_core.o
  CC      net/core/net-traces.o
  CC      net/ipv6/netfilter.o
  CC      drivers/tty/serial/8250/8250_mid.o
  CC      fs/ext4/acl.o
  CC [M]  net/sunrpc/auth_gss/gss_mech_switch.o
  CC [M]  net/bridge/netfilter/ebt_ip.o
  CC      drivers/acpi/acpica/nsparse.o
  CC      net/core/drop_monitor.o
  CC [M]  net/bridge/br_stp_bpdu.o
  CC [M]  sound/sound_core.o
  CC      net/ipv4/tcp_fastopen.o
  CC      drivers/xen/biomerge.o
  CC      drivers/pci/iomap.o
  CC [M]  crypto/pcbc.o
  CC [M]  drivers/dma/plx_dma.o
  CC      drivers/tty/tty_ioctl.o
  CC [M]  fs/nls/nls_cp936.o
  CC      arch/x86/kernel/resource.o
  CC      drivers/char/tpm/tpm-buf.o
  CC      fs/ext4/xattr_security.o
  CC      kernel/bpf/map_in_map.o
  CC [M]  drivers/char/xillybus/xillybus_pcie.o
  CC [M]  drivers/regulator/fan53555.o
  CC      drivers/char/mem.o
  CC [M]  net/kcm/kcmproc.o
  CC      drivers/acpi/acpica/nspredef.o
  CC [M]  sound/pci/als300.o
  AS      arch/x86/kernel/irqflags.o
  CC [M]  sound/soc/intel/atom/sst/sst_stream.o
  CC      mm/process_vm_access.o
  CC      drivers/tty/serial/8250/8250_pci.o
  CC [M]  sound/soc/intel/atom/sst/sst_drv_interface.o
  CC [M]  sound/hda/hdac_i915.o
  CC      kernel/trace/trace_syscalls.o
  CC      drivers/xen/xen-balloon.o
  CC [M]  crypto/lrw.o
  CC      drivers/acpi/acpica/nsprepkg.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.o
  CC      drivers/iommu/amd/quirks.o
  CC [M]  fs/nls/nls_cp949.o
  AR      drivers/gpu/host1x/built-in.a
  CC [M]  net/bridge/netfilter/ebt_ip6.o
  CC      arch/x86/kernel/static_call.o
  CC      drivers/gpu/vga/vga_switcheroo.o
  CC      fs/ntfs3/attrib.o
  CC      drivers/iommu/intel/pasid.o
  CC [M]  net/bridge/br_stp_if.o
  AR      drivers/dma/built-in.a
  CC      drivers/tty/serial/8250/8250_rt288x.o
  CC      kernel/bpf/bloom_filter.o
  CC [M]  drivers/char/xillybus/xillyusb.o
  CC      fs/ext4/verity.o
  AR      drivers/gpu/drm/tests/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_kunit_helpers.o
  CC [M]  drivers/tty/serial/8250/8250_exar.o
  CC [M]  drivers/regulator/gpio-regulator.o
  CC      kernel/bpf/local_storage.o
  CC      drivers/tty/tty_ldisc.o
  CC      drivers/pci/quirks.o
  CC [M]  drivers/gpu/drm/tests/drm_atomic_test.o
  CC [M]  sound/pci/als4000.o
  CC      drivers/iommu/amd/io_pgtable.o
  CC      drivers/acpi/acpica/nsrepair.o
  CC [M]  net/netfilter/nf_conntrack_pptp.o
  CC      net/ipv6/fib6_rules.o
  CC      drivers/iommu/amd/io_pgtable_v2.o
  CC      drivers/char/tpm/tpm2-sessions.o
  CC      drivers/iommu/amd/ppr.o
  CC [M]  crypto/xctr.o
  CC      net/ipv6/proc.o
  CC [M]  drivers/tty/serial/8250/8250_lpss.o
  CC      drivers/char/tpm/tpm_ppi.o
  CC      drivers/iommu/amd/pasid.o
  CC [M]  sound/soc/intel/atom/sst/sst_loader.o
  CC      drivers/acpi/acpica/nsrepair2.o
  CC      net/ipv4/tcp_rate.o
  CC      net/ipv4/tcp_recovery.o
  CC [M]  fs/nls/nls_cp950.o
  CC [M]  net/sunrpc/auth_gss/svcauth_gss.o
  LD [M]  net/kcm/kcm.o
  CC      net/ipv4/tcp_ulp.o
  CC      drivers/iommu/iommufd/iova_bitmap.o
  CC      kernel/trace/trace_event_perf.o
  CC [M]  drivers/gpu/drm/tests/drm_atomic_state_test.o
  CC      drivers/xen/sys-hypervisor.o
  CC      net/ipv6/syncookies.o
  CC      arch/x86/kernel/process.o
  CC [M]  sound/hda/intel-dsp-config.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-skl-match.o
  CC [M]  drivers/regulator/isl6271a-regulator.o
  CC      fs/ext4/crypto.o
  CC      lib/win_minmax.o
  CC [M]  net/bridge/netfilter/ebt_limit.o
  CC [M]  sound/soc/intel/atom/sst-mfld-platform-pcm.o
  CC      drivers/tty/serial/serial_mctrl_gpio.o
  AR      drivers/iommu/riscv/built-in.a
  CC [M]  net/sunrpc/auth_gss/gss_rpc_upcall.o
  CC [M]  crypto/hctr2.o
  CC [M]  net/bridge/br_stp_timer.o
  CC      drivers/acpi/acpica/nssearch.o
  CC [M]  fs/nls/nls_cp1250.o
  CC [M]  sound/pci/cs4281.o
  CC      net/ipv6/calipso.o
  CC [M]  sound/soc/intel/atom/sst-mfld-platform-compress.o
  CC [M]  net/sunrpc/clnt.o
  CC      drivers/iommu/intel/nested.o
  CC [M]  sound/soc/intel/atom/sst-atom-controls.o
  CC [M]  fs/nls/nls_cp1251.o
  CC [M]  sound/soc/intel/atom/sst/sst_pvt.o
  AR      drivers/iommu/amd/built-in.a
  CC      drivers/iommu/intel/cache.o
  CC [M]  sound/hda/intel-nhlt.o
  CC      drivers/pci/ats.o
  CC [M]  drivers/tty/serial/8250/8250_men_mcb.o
  CC      lib/xarray.o
  CC      kernel/trace/trace_events_filter.o
  AR      drivers/gpu/drm/arm/built-in.a
  CC      kernel/bpf/queue_stack_maps.o
  CC      lib/lockref.o
  AR      drivers/gpu/vga/built-in.a
  CC      lib/bcd.o
  CC      fs/ntfs3/attrlist.o
  CC [M]  net/bridge/br_netlink.o
  CC      drivers/acpi/acpica/nsutils.o
  CC      drivers/char/tpm/eventlog/acpi.o
  CC [M]  drivers/gpu/drm/tests/drm_bridge_test.o
  CC      drivers/xen/platform-pci.o
  CC [M]  drivers/regulator/isl9305.o
  CC [M]  net/netfilter/nf_conntrack_sane.o
  CC      net/core/selftests.o
  AR      fs/ext4/built-in.a
  CC [M]  net/bridge/br_netlink_tunnel.o
  CC      mm/mseal.o
  CC [M]  crypto/adiantum.o
  CC      drivers/iommu/iommufd/driver.o
  CC [M]  net/bridge/br_arp_nd_proxy.o
  CC      drivers/iommu/iommu.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-kbl-match.o
  CC [M]  drivers/regulator/lm363x-regulator.o
  CC [M]  fs/nls/nls_ascii.o
  CC [M]  net/bridge/netfilter/ebt_mark_m.o
  CC      drivers/gpu/drm/clients/drm_client_setup.o
  CC [M]  drivers/tty/serial/8250/8250_pci1xxxx.o
  CC      drivers/acpi/acpica/nswalk.o
  CC      drivers/acpi/nvs.o
  CC [M]  drivers/regulator/lp3971.o
  CC [M]  fs/nls/nls_iso8859-1.o
  LD [M]  sound/pci/snd-ad1889.o
  LD [M]  sound/pci/snd-als300.o
  LD [M]  sound/pci/snd-als4000.o
  CC [M]  drivers/regulator/lp3972.o
  LD [M]  sound/pci/snd-cs4281.o
  CC [M]  net/bridge/netfilter/ebt_pkttype.o
  CC [M]  drivers/regulator/lp872x.o
  CC [M]  net/sunrpc/xprt.o
  CC [M]  drivers/regulator/lp8788-buck.o
  CC      kernel/bpf/ringbuf.o
  CC [M]  crypto/nhpoly1305.o
  CC [M]  drivers/regulator/lp8788-ldo.o
  CC      drivers/char/tpm/eventlog/efi.o
  CC      fs/ntfs3/bitfunc.o
  CC [M]  fs/nls/nls_iso8859-2.o
  CC      drivers/xen/swiotlb-xen.o
  CC [M]  drivers/gpu/drm/tests/drm_buddy_test.o
  CC [M]  sound/hda/intel-sdw-acpi.o
  CC      drivers/gpu/drm/clients/drm_fbdev_client.o
  CC      net/core/timestamping.o
  CC      drivers/iommu/intel/prq.o
  CC      drivers/tty/tty_buffer.o
  CC      drivers/acpi/acpica/nsxfeval.o
  CC [M]  sound/soc/intel/atom/sst/sst_pci.o
  CC [M]  net/netfilter/nf_conntrack_sip.o
  CC [M]  fs/nls/nls_iso8859-3.o
  CC      drivers/iommu/intel/trace.o
  CC [M]  net/sunrpc/auth_gss/gss_rpc_xdr.o
  CC      mm/page_alloc.o
  CC      net/ipv4/tcp_offload.o
  CC      drivers/pci/iov.o
  CC [M]  net/sunrpc/socklib.o
  CC      drivers/char/random.o
  CC      arch/x86/kernel/ptrace.o
  CC      drivers/tty/tty_port.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-bxt-match.o
  CC [M]  drivers/regulator/lp8755.o
  CC      net/ipv6/seg6_iptunnel.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-glk-match.o
  CC [M]  crypto/ccm.o
  CC      kernel/trace/trace_events_trigger.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cnl-match.o
  CC [M]  drivers/tty/serial/8250/8250_pericom.o
  CC [M]  drivers/iommu/iommufd/device.o
  CC      drivers/char/tpm/tpm_tis_core.o
  CC      net/core/ptp_classifier.o
  CC      kernel/trace/trace_eprobe.o
  CC      fs/ntfs3/bitmap.o
  CC [M]  crypto/chacha20poly1305.o
  CC      arch/x86/kernel/tls.o
  CC      net/core/netprio_cgroup.o
  CC [M]  fs/nls/nls_iso8859-4.o
  LD [M]  sound/soc/intel/atom/snd-soc-sst-atom-hifi2-platform.o
  CC      drivers/char/ttyprintk.o
  CC [M]  net/bridge/netfilter/ebt_stp.o
  CC      lib/sort.o
  CC      kernel/trace/trace_events_inject.o
  CC      drivers/acpi/acpica/nsxfname.o
  AR      drivers/gpu/drm/clients/built-in.a
  CC      drivers/iommu/iommu-traces.o
  CC [M]  fs/nls/nls_iso8859-5.o
  CC [M]  sound/soc/intel/atom/sst/sst_acpi.o
  CC      drivers/xen/mcelog.o
  CC      kernel/bpf/bpf_local_storage.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cfl-match.o
  CC [M]  drivers/gpu/drm/tests/drm_cmdline_parser_test.o
  LD [M]  sound/hda/snd-hda-core.o
  LD [M]  sound/hda/snd-intel-dspcfg.o
  LD [M]  sound/hda/snd-intel-sdw-acpi.o
  CC      drivers/char/misc.o
  CC [M]  fs/nls/nls_iso8859-6.o
  CC      net/ipv6/seg6_local.o
  CC      fs/ntfs3/dir.o
  CC      lib/parser.o
  AR      drivers/tty/serial/8250/built-in.a
  CC      drivers/tty/serial/kgdboc.o
  CC [M]  net/sunrpc/xprtsock.o
  CC [M]  net/l2tp/l2tp_core.o
  CC [M]  drivers/regulator/ltc3589.o
  CC      drivers/iommu/intel/svm.o
  CC      mm/shuffle.o
  CC      net/core/netclassid_cgroup.o
  CC      kernel/bpf/bpf_task_storage.o
  CC [M]  net/sunrpc/auth_gss/trace.o
  CC      net/ipv4/tcp_plb.o
  CC      mm/page_frag_cache.o
  CC [M]  crypto/aegis128-core.o
  CC [M]  net/sunrpc/sched.o
  CC [M]  drivers/iommu/iommufd/eventq.o
  CC      arch/x86/kernel/step.o
  CC      drivers/acpi/acpica/nsxfobj.o
  CC [M]  fs/nls/nls_iso8859-7.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-core.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-pci.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-acpi.o
  CC      drivers/xen/xen-acpi-processor.o
  CC      fs/udf/balloc.o
  CC      fs/debugfs/inode.o
  AR      fs/hostfs/built-in.a
  CC [M]  net/bridge/netfilter/ebt_vlan.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cml-match.o
  CC      drivers/pci/pci-label.o
  CC [M]  fs/nls/nls_cp1255.o
  CC      net/ipv4/datagram.o
  CC [M]  drivers/iommu/iommufd/hw_pagetable.o
  CC      lib/debug_locks.o
  CC      fs/debugfs/file.o
  CC [M]  drivers/iommu/iommufd/io_pagetable.o
  CC      arch/x86/kernel/tboot.o
  CC [M]  drivers/tty/serial/altera_jtaguart.o
  CC [M]  fs/nls/nls_iso8859-9.o
  CC      fs/ntfs3/fsntfs.o
  CC [M]  drivers/regulator/ltc3676.o
  CC [M]  net/dccp/ccid.o
  CC      drivers/connector/cn_queue.o
  CC [M]  fs/nls/nls_iso8859-13.o
  CC [M]  net/dccp/feat.o
  CC      drivers/pci/p2pdma.o
  CC      drivers/char/tpm/tpm_tis.o
  CC      kernel/trace/trace_events_synth.o
  CC [M]  net/dccp/input.o
  CC      drivers/iommu/intel/irq_remapping.o
  CC      drivers/acpi/acpica/psargs.o
  CC      mm/init-mm.o
  CC [M]  net/dccp/minisocks.o
  CC      drivers/iommu/intel/perfmon.o
  CC      lib/random32.o
  CC [M]  crypto/pcrypt.o
  CC      drivers/char/tpm/tpm_crb.o
  CC      kernel/bpf/bpf_inode_storage.o
  CC      kernel/user.o
  CC      kernel/bpf/disasm.o
  CC      drivers/xen/efi.o
  CC      lib/bust_spinlocks.o
  CC [M]  net/sunrpc/auth.o
  CC      drivers/tty/tty_mutex.o
  CC [M]  net/sunrpc/auth_null.o
  CC [M]  net/netfilter/nf_conntrack_tftp.o
  CC      fs/udf/dir.o
  CC      net/ipv4/raw.o
  CC [M]  net/bridge/netfilter/ebt_arpreply.o
  CC      drivers/tty/tty_ldsem.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-icl-match.o
  CC [M]  drivers/tty/serial/altera_uart.o
  CC      drivers/char/virtio_console.o
  CC [M]  fs/nls/nls_iso8859-14.o
  CC      drivers/acpi/acpica/psloop.o
  CC      arch/x86/kernel/i8237.o
  CC [M]  drivers/gpu/drm/tests/drm_connector_test.o
  CC [M]  drivers/regulator/max14577-regulator.o
  CC      net/core/lwtunnel.o
  CC      net/ipv4/udp.o
  CC      drivers/base/power/sysfs.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-tgl-match.o
  CC [M]  crypto/cryptd.o
  CC      lib/kasprintf.o
  CC [M]  drivers/iommu/iommufd/ioas.o
  CC      fs/ntfs3/frecord.o
  CC      net/ipv6/seg6_hmac.o
  CC      drivers/base/firmware_loader/builtin/main.o
  CC      drivers/connector/connector.o
  CC      drivers/xen/xlate_mmu.o
  CC [M]  drivers/char/tpm/tpm_tis_spi_main.o
  CC      drivers/xen/unpopulated-alloc.o
  CC [M]  fs/nls/nls_iso8859-15.o
  CC [M]  drivers/char/tpm/tpm_tis_spi_cr50.o
  CC      fs/udf/file.o
  CC      arch/x86/kernel/stacktrace.o
  CC      fs/ntfs3/file.o
  CC      mm/memblock.o
  CC      drivers/acpi/acpica/psobject.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_mech.o
  CC      kernel/bpf/mprog.o
  CC [M]  drivers/tty/serial/arc_uart.o
  CC [M]  net/dccp/options.o
  CC      drivers/connector/cn_proc.o
  CC [M]  drivers/tty/serial/fsl_linflexuart.o
  CC      lib/bitmap.o
  AR      fs/debugfs/built-in.a
  CC [M]  net/l2tp/l2tp_ip.o
  CC      fs/ntfs3/fslog.o
  CC [M]  net/bridge/netfilter/ebt_mark.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_seal.o
  CC      drivers/base/power/generic_ops.o
  CC      drivers/pci/vgaarb.o
  AR      drivers/iommu/intel/built-in.a
  CC      drivers/acpi/wakeup.o
  CC [M]  drivers/regulator/max1586.o
  CC      drivers/base/power/common.o
  CC [M]  fs/nls/nls_koi8-r.o
  AR      drivers/base/firmware_loader/builtin/built-in.a
  CC      drivers/base/firmware_loader/fallback_table.o
  CC      drivers/acpi/acpica/psopcode.o
  CC      arch/x86/kernel/reboot.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ehl-match.o
  CC [M]  drivers/iommu/iommufd/main.o
  CC      net/core/lwt_bpf.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-jsl-match.o
  CC [M]  drivers/char/tpm/tpm_tis_i2c_cr50.o
  CC      drivers/acpi/sleep.o
  CC      fs/udf/ialloc.o
  CC      net/core/dst_cache.o
  CC      kernel/bpf/trampoline.o
  CC      drivers/xen/grant-dma-ops.o
  CC [M]  drivers/tty/serial/fsl_lpuart.o
  CC      kernel/trace/trace_events_hist.o
  CC [M]  net/netfilter/nf_log_syslog.o
  CC      drivers/acpi/acpica/psopinfo.o
  CC [M]  drivers/char/tpm/tpm_tis_i2c.o
  CC [M]  crypto/des_generic.o
  CC [M]  fs/nls/nls_koi8-u.o
  CC [M]  drivers/gpu/drm/tests/drm_damage_helper_test.o
  CC [M]  sound/ac97_bus.o
  CC [M]  drivers/char/tpm/tpm_i2c_atmel.o
  CC [M]  drivers/iommu/iommufd/pages.o
  CC [M]  drivers/regulator/max77503-regulator.o
  CC [M]  net/bridge/br_sysfs_if.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-adl-match.o
  CC [M]  net/bridge/netfilter/ebt_dnat.o
  CC      net/ipv6/ioam6_iptunnel.o
  CC      lib/scatterlist.o
  CC [M]  drivers/iommu/iommufd/vfio_compat.o
  CC      net/ipv6/addrconf_core.o
  CC      drivers/acpi/acpica/psparse.o
  AR      drivers/connector/built-in.a
  CC      kernel/bpf/btf.o
  CC [M]  drivers/iommu/iommufd/viommu.o
  CC      fs/udf/inode.o
  CC      drivers/base/power/qos.o
  CC      drivers/pci/doe.o
  CC [M]  net/bridge/br_sysfs_br.o
  CC [M]  crypto/fcrypt.o
  CC [M]  fs/nls/nls_koi8-ru.o
  CC      kernel/signal.o
  CC [M]  drivers/pci/pci-stub.o
  CC      kernel/trace/trace_events_user.o
  CC      drivers/base/firmware_loader/main.o
  CC [M]  drivers/gpu/drm/tests/drm_dp_mst_helper_test.o
  CC [M]  drivers/xen/evtchn.o
  CC      drivers/acpi/acpica/psscope.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_unseal.o
  CC      mm/memory_hotplug.o
  CC [M]  net/sctp/sm_statetable.o
  CC      lib/list_sort.o
  CC      net/core/gro_cells.o
  CC [M]  drivers/gpu/drm/tests/drm_exec_test.o
  CC      net/ipv4/udplite.o
  CC [M]  drivers/char/tpm/tpm_i2c_infineon.o
  CC [M]  net/bridge/br_nf_core.o
  CC [M]  drivers/regulator/max77541-regulator.o
  AR      drivers/gpu/drm/display/built-in.a
  CC [M]  drivers/gpu/drm/display/drm_display_helper_mod.o
  CC      net/ipv4/udp_offload.o
  CC      arch/x86/kernel/early-quirks.o
  CC      drivers/char/hpet.o
  CC [M]  fs/nls/nls_utf8.o
  CC      net/ipv4/arp.o
  CC      drivers/acpi/acpica/pstree.o
  CC [M]  drivers/block/xen-blkback/blkback.o
  CC [M]  net/dccp/output.o
  CC [M]  crypto/blowfish_generic.o
  CC [M]  net/l2tp/l2tp_netlink.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-rpl-match.o
  CC [M]  drivers/block/xen-blkback/xenbus.o
  CC      fs/ntfs3/inode.o
  CC [M]  net/bridge/netfilter/ebt_redirect.o
  CC [M]  net/bridge/netfilter/ebt_snat.o
  CC [M]  drivers/regulator/max8649.o
  CC [M]  net/netfilter/nf_nat_core.o
  CC      lib/uuid.o
  AR      drivers/gpu/drm/renesas/rcar-du/built-in.a
  CC [M]  drivers/gpu/drm/display/drm_bridge_connector.o
  AR      drivers/gpu/drm/renesas/rz-du/built-in.a
  CC      lib/iov_iter.o
  AR      drivers/gpu/drm/renesas/built-in.a
  CC [M]  drivers/tty/serial/lantiq.o
  CC      fs/ntfs3/index.o
  AR      drivers/iommu/iommufd/built-in.a
  LD [M]  drivers/iommu/iommufd/iommufd.o
  CC      drivers/iommu/iommu-sysfs.o
  CC      net/ipv4/icmp.o
  CC [M]  drivers/gpu/drm/tests/drm_format_helper_test.o
  CC [M]  drivers/xen/gntdev.o
  CC      drivers/acpi/acpica/psutils.o
  CC [M]  fs/nls/mac-celtic.o
  CC      drivers/iommu/dma-iommu.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_wrap.o
  CC      fs/ntfs3/lznt.o
  CC [M]  drivers/pci/pci-pf-stub.o
  CC [M]  drivers/char/tpm/tpm_i2c_nuvoton.o
  CC      kernel/bpf/memalloc.o
  CC [M]  net/sctp/sm_statefuns.o
  CC [M]  crypto/blowfish_common.o
  CC [M]  drivers/gpu/drm/display/drm_dp_dual_mode_helper.o
  CC      drivers/base/regmap/regmap.o
  AR      drivers/misc/eeprom/built-in.a
  AR      drivers/misc/cb710/built-in.a
  CC [M]  drivers/misc/eeprom/at24.o
  CC [M]  drivers/misc/cb710/core.o
  CC      net/ipv6/exthdrs_core.o
  CC      drivers/acpi/acpica/pswalk.o
  CC      drivers/base/power/runtime.o
  CC      fs/udf/lowlevel.o
  CC [M]  drivers/regulator/max8660.o
  CC [M]  fs/nls/mac-centeuro.o
  CC [M]  drivers/tty/serial/max3100.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-mtl-match.o
  CC      mm/slub.o
  CC      drivers/base/firmware_loader/fallback.o
  CC      net/core/failover.o
  CC      net/ipv6/ip6_checksum.o
  CC [M]  drivers/misc/eeprom/at25.o
  CC      arch/x86/kernel/smp.o
  CC [M]  net/bridge/netfilter/ebt_log.o
  CC [M]  drivers/pci/xen-pcifront.o
  CC      drivers/acpi/acpica/psxface.o
  CC [M]  net/netfilter/nf_nat_proto.o
  CC      net/ipv4/devinet.o
  CC      drivers/base/power/wakeirq.o
  CC [M]  drivers/gpu/drm/display/drm_dp_helper.o
  LD [M]  drivers/block/xen-blkback/xen-blkback.o
  CC [M]  drivers/char/tpm/tpm_nsc.o
  CC [M]  drivers/block/drbd/drbd_buildtag.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_crypto.o
  AR      drivers/gpu/drm/omapdrm/built-in.a
  CC      fs/ntfs3/namei.o
  CC [M]  drivers/xen/gntdev-dmabuf.o
  CC [M]  fs/nls/mac-croatian.o
  CC [M]  net/sctp/sm_sideeffect.o
  CC [M]  drivers/block/mtip32xx/mtip32xx.o
  CC [M]  crypto/twofish_generic.o
  CC      fs/udf/namei.o
  CC      drivers/acpi/acpica/rsaddr.o
  CC      net/core/skmsg.o
  CC [M]  drivers/tty/serial/men_z135_uart.o
  CC      lib/clz_ctz.o
  CC [M]  drivers/gpu/drm/tests/drm_format_test.o
  CC      kernel/trace/bpf_trace.o
  CC [M]  net/l2tp/l2tp_eth.o
  CC [M]  drivers/regulator/max8893.o
  CC [M]  drivers/misc/eeprom/max6875.o
  CC      kernel/sys.o
  CC      drivers/base/firmware_loader/fallback_platform.o
  CC      net/core/sock_map.o
  CC      fs/udf/partition.o
  CC [M]  drivers/misc/cb710/sgbuf2.o
  CC [M]  drivers/block/drbd/drbd_bitmap.o
  AR      drivers/gpu/drm/tilcdc/built-in.a
  CC [M]  sound/soc/intel/common/soc-acpi-intel-arl-match.o
  CC      mm/madvise.o
  CC [M]  fs/nls/mac-cyrillic.o
  CC      drivers/acpi/acpica/rscalc.o
  CC [M]  net/dccp/proto.o
  CC [M]  drivers/char/tpm/tpm_atmel.o
  AR      drivers/pci/built-in.a
  CC      drivers/acpi/acpica/rscreate.o
  CC [M]  net/bridge/netfilter/ebt_nflog.o
  CC      kernel/umh.o
  CC      drivers/tty/tty_baudrate.o
  CC      fs/ntfs3/record.o
  CC [M]  drivers/gpu/drm/tests/drm_framebuffer_test.o
  CC      drivers/iommu/io-pgtable.o
  CC [M]  crypto/twofish_common.o
  CC [M]  drivers/xen/gntalloc.o
  CC [M]  drivers/tty/serial/rp2.o
  CC      drivers/base/power/main.o
  CC      lib/bsearch.o
  CC [M]  fs/nls/mac-gaelic.o
  CC [M]  drivers/regulator/max8907-regulator.o
  CC      drivers/base/firmware_loader/sysfs.o
  CC [M]  drivers/misc/eeprom/eeprom_93cx6.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_keys.o
  CC      fs/ntfs3/run.o
  LD [M]  net/sunrpc/auth_gss/auth_rpcgss.o
  CC      fs/ntfs3/super.o
  CC      fs/udf/super.o
  CC      arch/x86/kernel/smpboot.o
  CC      net/ipv6/ip6_icmp.o
  CC [M]  net/l2tp/l2tp_debugfs.o
  CC      fs/ntfs3/upcase.o
  CC [M]  drivers/char/tpm/tpm_infineon.o
  CC      fs/udf/truncate.o
  CC [M]  net/rds/af_rds.o
  CC      drivers/acpi/acpica/rsdumpinfo.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-lnl-match.o
  CC      fs/ntfs3/xattr.o
  CC [M]  net/rds/bind.o
  CC [M]  drivers/gpu/drm/tests/drm_gem_shmem_test.o
  LD [M]  drivers/misc/cb710/cb710.o
  CC [M]  fs/nls/mac-greek.o
  CC      fs/ntfs3/lib/decompress_common.o
  CC [M]  crypto/serpent_generic.o
  CC [M]  crypto/sm4.o
  CC [M]  drivers/xen/privcmd.o
  CC      drivers/base/regmap/regcache.o
  CC [M]  net/bridge/br_multicast.o
  CC [M]  crypto/sm4_generic.o
  CC [M]  drivers/tty/serial/sc16is7xx.o
  CC      drivers/iommu/iova.o
  CC [M]  drivers/regulator/max8925-regulator.o
  CC      drivers/acpi/acpica/rsinfo.o
  CC [M]  net/netfilter/nf_nat_helper.o
  CC      drivers/base/firmware_loader/sysfs_upload.o
  CC [M]  net/sctp/protocol.o
  CC      lib/find_bit.o
  CC [M]  net/dccp/timer.o
  CC      drivers/base/regmap/regcache-rbtree.o
  CC [M]  drivers/gpu/drm/display/drm_dp_mst_topology.o
  CC      drivers/acpi/device_sysfs.o
  CC [M]  drivers/gpu/drm/display/drm_dp_tunnel.o
  CC [M]  drivers/misc/eeprom/eeprom_93xx46.o
  CC      drivers/base/regmap/regcache-flat.o
  CC [M]  fs/nls/mac-iceland.o
  CC [M]  drivers/char/tpm/xen-tpmfront.o
  CC [M]  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.o
  CC [M]  drivers/block/drbd/drbd_proc.o
  CC      kernel/trace/trace_kprobe.o
  CC      drivers/acpi/acpica/rsio.o
  CC [M]  crypto/aes_ti.o
  CC      kernel/trace/error_report-traces.o
  CC      lib/llist.o
  CC [M]  net/l2tp/l2tp_ip6.o
  CC [M]  fs/nls/mac-inuit.o
  CC [M]  drivers/block/zram/zcomp.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ptl-match.o
  CC      fs/ntfs3/lib/lzx_decompress.o
  CC      net/ipv4/af_inet.o
  CC      lib/lwq.o
  CC      arch/x86/kernel/tsc_sync.o
  CC      drivers/acpi/acpica/rsirq.o
  CC [M]  drivers/regulator/max8952.o
  CC      fs/udf/symlink.o
  CC      drivers/acpi/acpica/rslist.o
  AR      drivers/base/test/built-in.a
  CC [M]  drivers/block/null_blk/main.o
  CC      drivers/block/loop.o
  CC      drivers/block/nbd.o
  CC [M]  drivers/block/null_blk/trace.o
  CC [M]  drivers/misc/eeprom/idt_89hpesx.o
  CC [M]  net/rds/cong.o
  LD [M]  net/sunrpc/auth_gss/rpcsec_gss_krb5.o
  CC [M]  drivers/block/zram/zram_drv.o
  CC      net/ipv6/output_core.o
  CC [M]  net/sunrpc/auth_tls.o
  CC [M]  drivers/block/null_blk/zoned.o
  CC [M]  drivers/char/uv_mmtimer.o
  CC      kernel/bpf/rqspinlock.o
  CC      drivers/base/power/wakeup.o
  AR      drivers/base/firmware_loader/built-in.a
  CC [M]  drivers/block/zram/backend_lzorle.o
  CC [M]  fs/nls/mac-romanian.o
  CC [M]  drivers/char/lp.o
  CC      net/core/bpf_sk_storage.o
  CC      lib/memweight.o
  CC      kernel/bpf/arena.o
  CC      drivers/base/regmap/regcache-maple.o
  CC [M]  drivers/char/tpm/tpm_vtpm_proxy.o
  CC      drivers/iommu/irq_remapping.o
  CC [M]  drivers/tty/serial/sc16is7xx_spi.o
  CC      fs/ntfs3/lib/xpress_decompress.o
  CC [M]  drivers/block/zram/backend_lzo.o
  CC      arch/x86/kernel/setup_percpu.o
  CC      drivers/acpi/acpica/rsmemory.o
  CC [M]  fs/nls/mac-roman.o
  CC      lib/kfifo.o
  CC [M]  crypto/camellia_generic.o
  CC [M]  crypto/cast_common.o
  CC [M]  net/dccp/qpolicy.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-hda-match.o
  CC      fs/udf/directory.o
  CC [M]  net/dccp/ccids/ccid2.o
  CC [M]  drivers/regulator/max8997-regulator.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.o
  CC [M]  drivers/block/drbd/drbd_worker.o
  CC [M]  drivers/xen/privcmd-buf.o
  CC [M]  net/sctp/endpointola.o
  AR      fs/ntfs3/built-in.a
  CC [M]  fs/nls/mac-turkish.o
  CC [M]  net/dccp/ackvec.o
  CC      lib/percpu-refcount.o
  CC      mm/page_io.o
  CC      drivers/acpi/acpica/rsmisc.o
  CC [M]  drivers/xen/xen-scsiback.o
  CC      drivers/base/regmap/regmap-debugfs.o
  CC [M]  drivers/regulator/max8998.o
  CC      kernel/workqueue.o
  CC [M]  drivers/tty/serial/sc16is7xx_i2c.o
  CC [M]  drivers/misc/eeprom/ee1004.o
  CC [M]  net/netfilter/nf_nat_redirect.o
  LD [M]  drivers/char/tpm/tpm_tis_spi.o
  CC      kernel/bpf/range_tree.o
  AR      drivers/char/tpm/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_managed_test.o
  CC [M]  drivers/char/applicom.o
  CC [M]  net/sunrpc/auth_unix.o
  CC [M]  drivers/tty/serial/sprd_serial.o
  CC [M]  drivers/gpu/drm/display/drm_dsc_helper.o
  AR      drivers/gpu/drm/imx/built-in.a
  CC      drivers/block/virtio_blk.o
  CC [M]  net/sctp/associola.o
  CC      lib/rhashtable.o
  CC [M]  fs/nls/nls_ucs2_utils.o
  CC      drivers/acpi/acpica/rsserial.o
  CC      drivers/iommu/hyperv-iommu.o
  CC      drivers/base/regmap/regmap-i2c.o
  LD [M]  drivers/block/zram/zram.o
  CC [M]  net/sctp/transport.o
  CC      lib/base64.o
  CC      arch/x86/kernel/mpparse.o
  CC      drivers/mfd/88pm860x-core.o
  CC      arch/x86/kernel/ftrace.o
  CC      fs/udf/misc.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ssp-common.o
  LD [M]  drivers/block/null_blk/null_blk.o
  CC      drivers/mfd/88pm860x-i2c.o
  CC      drivers/base/power/wakeup_stats.o
  CC [M]  drivers/gpu/drm/tests/drm_mm_test.o
  CC [M]  drivers/tty/serial/uartlite.o
  AS      arch/x86/kernel/ftrace_64.o
  CC [M]  crypto/cast5_generic.o
  CC      fs/udf/udftime.o
  AR      drivers/gpu/drm/panel/built-in.a
  CC [M]  drivers/gpu/drm/panel/panel-auo-a030jtn01.o
  CC [M]  drivers/gpu/drm/panel/panel-ilitek-ili9341.o
  CC      kernel/pid.o
  CC      drivers/acpi/acpica/rsutils.o
  CC      net/ipv6/protocol.o
  CC [M]  drivers/gpu/drm/panel/panel-orisetech-ota5601a.o
  CC [M]  net/rds/connection.o
  AR      drivers/misc/lis3lv02d/built-in.a
  CC [M]  drivers/misc/lis3lv02d/lis3lv02d.o
  CC      kernel/trace/power-traces.o
  CC [M]  drivers/misc/lis3lv02d/lis3lv02d_i2c.o
  CC [M]  drivers/regulator/max20086-regulator.o
  CC [M]  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.o
  CC      mm/swap_state.o
  CC [M]  net/rds/info.o
  CC      kernel/bpf/dispatcher.o
  CC [M]  drivers/char/nvram.o
  CC      drivers/iommu/virtio-iommu.o
  AR      drivers/nfc/built-in.a
  CC      drivers/nvdimm/core.o
  CC      net/ipv6/ip6_offload.o
  CC [M]  drivers/xen/pvcalls-front.o
  CC      drivers/dax/hmem/device.o
  CC      net/core/devmem.o
  CC [M]  net/sunrpc/svc.o
  CC      drivers/tty/tty_jobctrl.o
  CC      drivers/acpi/acpica/rsxface.o
  CC      net/ipv4/igmp.o
  CC      drivers/base/power/trace.o
  AR      drivers/misc/cardreader/built-in.a
  CC [M]  drivers/misc/cardreader/alcor_pci.o
  CC      fs/udf/unicode.o
  CC [M]  drivers/gpu/drm/tests/drm_modes_test.o
  AR      fs/nls/built-in.a
  CC      arch/x86/kernel/trace_clock.o
  CC      drivers/mfd/wm8400-core.o
  CC [M]  net/rds/message.o
  CC      kernel/bpf/devmap.o
  AR      drivers/tty/serial/built-in.a
  CC [M]  sound/soc/intel/common/soc-acpi-intel-sdca-quirks.o
  CC [M]  net/rds/recv.o
  CC      drivers/base/regmap/regmap-spi.o
  CC [M]  net/bridge/br_mdb.o
  CC [M]  net/dccp/sysctl.o
  CC [M]  crypto/cast6_generic.o
  CC      arch/x86/kernel/trace.o
  CC [M]  crypto/aria_generic.o
  CC [M]  drivers/gpu/drm/panel/panel-widechips-ws2401.o
  CC [M]  drivers/regulator/max20411-regulator.o
  CC      lib/once.o
  CC      mm/swapfile.o
  CC [M]  drivers/gpu/drm/display/drm_hdcp_helper.o
  CC [M]  net/sctp/chunk.o
  CC      drivers/nvdimm/bus.o
  CC      kernel/task_work.o
  CC      drivers/block/xen-blkfront.o
  CC [M]  net/netfilter/nf_nat_masquerade.o
  CC [M]  net/sctp/sm_make_chunk.o
  CC      mm/zswap.o
  CC      drivers/acpi/acpica/tbdata.o
  CC      drivers/base/power/clock_ops.o
  CC      drivers/iommu/iommu-sva.o
  CC [M]  drivers/gpu/drm/tests/drm_plane_helper_test.o
  CC [M]  drivers/dax/hmem/hmem.o
  AR      fs/udf/built-in.a
  CC      drivers/dma-buf/heaps/system_heap.o
  CC [M]  drivers/block/drbd/drbd_receiver.o
  CC      fs/tracefs/inode.o
  CC [M]  net/core/pktgen.o
  CC [M]  drivers/char/ppdev.o
  CC      drivers/tty/n_null.o
  CC      arch/x86/kernel/rethook.o
  LD [M]  sound/soc/intel/common/snd-soc-acpi-intel-match.o
  CC [M]  net/rds/send.o
  CC      drivers/mfd/wm831x-core.o
  CC [M]  drivers/regulator/max77693-regulator.o
  CC [M]  drivers/misc/cardreader/rtsx_pcr.o
  LD [M]  sound/soundcore.o
  CC      net/ipv6/tcpv6_offload.o
  CC      drivers/acpi/device_pm.o
  CC      drivers/base/component.o
  CC      mm/dmapool.o
  CC      kernel/trace/rpm-traces.o
  CC      lib/refcount.o
  LD [M]  sound/soc/intel/common/snd-soc-acpi-intel-sdca-quirks.o
  CC [M]  net/sunrpc/svcsock.o
  CC      net/ipv6/exthdrs_offload.o
  CC [M]  net/netfilter/nf_nat_ovs.o
  CC      drivers/base/regmap/regmap-mmio.o
  CC      net/ipv4/fib_frontend.o
  CC [M]  sound/soc/sdca/sdca_functions.o
  CC [M]  net/dccp/ipv4.o
  CC      drivers/tty/pty.o
  CC [M]  crypto/chacha_generic.o
  AR      drivers/dax/hmem/built-in.a
  LD [M]  drivers/dax/hmem/dax_hmem.o
  CC      drivers/dax/super.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_audio_helper.o
  CC [M]  drivers/gpu/drm/tests/drm_probe_helper_test.o
  CC [M]  net/netfilter/nf_nat_amanda.o
  CC      arch/x86/kernel/vmcore_info_64.o
  CC      drivers/acpi/acpica/tbfadt.o
  AR      drivers/dma-buf/heaps/built-in.a
  CC      kernel/bpf/cpumap.o
  CC      drivers/dma-buf/dma-buf.o
  CC      kernel/trace/trace_kdb.o
  CC [M]  drivers/char/tlclk.o
  CC      kernel/extable.o
  CC      lib/rcuref.o
  CC      fs/tracefs/event_inode.o
  CC [M]  drivers/regulator/max77826-regulator.o
  AR      drivers/base/power/built-in.a
  CC [M]  net/bridge/br_multicast_eht.o
  CC [M]  drivers/xen/xen-front-pgdir-shbuf.o
  CC      drivers/iommu/io-pgfault.o
  CC [M]  net/netfilter/nf_nat_ftp.o
  CC      net/ipv4/fib_semantics.o
  CC [M]  crypto/poly1305_generic.o
  CC      drivers/acpi/acpica/tbfind.o
  CC      drivers/mfd/wm831x-irq.o
  CC [M]  crypto/michael_mic.o
  CC      arch/x86/kernel/machine_kexec_64.o
  CC      lib/usercopy.o
  CC      drivers/nvdimm/dimm_devs.o
  CC [M]  crypto/crc32_generic.o
  CC      drivers/tty/tty_audit.o
  CC [M]  drivers/gpu/drm/tests/drm_rect_test.o
  CC [M]  net/netfilter/nf_nat_irc.o
  CC      net/ipv6/inet6_hashtables.o
  CC      drivers/mfd/wm831x-otp.o
  CC      drivers/mfd/wm831x-auxadc.o
  CC      drivers/base/regmap/regmap-irq.o
  CC [M]  net/dccp/ipv6.o
  CC      drivers/acpi/acpica/tbinstal.o
  CC [M]  drivers/char/hangcheck-timer.o
  CC [M]  sound/soc/sdca/sdca_device.o
  CC [M]  drivers/regulator/max77857-regulator.o
  CC      kernel/params.o
  CC [M]  drivers/misc/cardreader/rts5209.o
  CC [M]  sound/soc/sdca/sdca_regmap.o
  CC [M]  net/sctp/ulpevent.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_cec_helper.o
  CC      drivers/dax/bus.o
  CC      net/ipv6/mcast_snoop.o
  CC      lib/errseq.o
  CC      kernel/trace/trace_dynevent.o
  CC      kernel/bpf/offload.o
  CC      fs/btrfs/super.o
  CC      net/ipv6/tcp_ao.o
  AR      fs/tracefs/built-in.a
  CC [M]  crypto/authenc.o
  CC      kernel/bpf/net_namespace.o
  CC      drivers/cxl/core/suspend.o
  CC      lib/bucket_locks.o
  CC      drivers/acpi/acpica/tbprint.o
  CC      kernel/bpf/tcx.o
  CC      net/ipv4/fib_trie.o
  CC [M]  net/rds/stats.o
  AR      drivers/macintosh/built-in.a
  CC [M]  net/rds/sysctl.o
  CC      drivers/tty/sysrq.o
  AR      drivers/scsi/device_handler/built-in.a
  CC [M]  drivers/scsi/device_handler/scsi_dh_rdac.o
  LD [M]  drivers/xen/xen-evtchn.o
  LD [M]  drivers/xen/xen-gntdev.o
  LD [M]  drivers/xen/xen-gntalloc.o
  LD [M]  drivers/xen/xen-privcmd.o
  CC [M]  net/dccp/diag.o
  AR      drivers/xen/built-in.a
  AR      drivers/iommu/built-in.a
  CC [M]  net/netfilter/nf_nat_sip.o
  AS      arch/x86/kernel/relocate_kernel_64.o
  CC      arch/x86/kernel/kexec-bzimage64.o
  CC      kernel/trace/trace_probe.o
  CC [M]  net/rds/threads.o
  CC [M]  net/rds/transport.o
  CC [M]  net/bridge/br_vlan.o
  CC      net/ipv4/fib_notifier.o
  CC      mm/hugetlb.o
  AR      drivers/char/built-in.a
  CC      lib/generic-radix-tree.o
  CC      drivers/dma-buf/dma-fence.o
  CC [M]  drivers/misc/cardreader/rts5229.o
  CC      fs/pstore/inode.o
  CC      drivers/mfd/wm831x-i2c.o
  CC      fs/efivarfs/inode.o
  CC      drivers/acpi/acpica/tbutils.o
  CC [M]  drivers/regulator/mc13783-regulator.o
  CC      fs/pstore/platform.o
  AR      net/core/built-in.a
  AR      drivers/gpu/drm/bridge/analogix/built-in.a
  CC [M]  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.o
  LD [M]  sound/soc/sdca/snd-soc-sdca.o
  AR      drivers/gpu/drm/bridge/cadence/built-in.a
  AR      drivers/misc/pvpanic/built-in.a
  CC [M]  drivers/misc/pvpanic/pvpanic.o
  CC [M]  drivers/base/regmap/regmap-slimbus.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.o
  CC      fs/efivarfs/file.o
  CC [M]  drivers/scsi/device_handler/scsi_dh_hp_sw.o
  CC [M]  net/sctp/inqueue.o
  CC      drivers/acpi/acpica/tbxface.o
  CC      drivers/nvdimm/nd_perf.o
  CC [M]  sound/soc/soc-acpi.o
  CC [M]  drivers/misc/cardreader/rtl8411.o
  CC [M]  drivers/cxl/core/port.o
  CC [M]  drivers/gpu/drm/bridge/analogix/analogix_dp_core.o
  CC      mm/hugetlb_vmemmap.o
  AR      drivers/misc/keba/built-in.a
  CC      lib/bitmap-str.o
  CC [M]  drivers/misc/keba/cp500.o
  CC      arch/x86/kernel/crash_dump_64.o
  CC      drivers/acpi/acpica/tbxfload.o
  CC      arch/x86/kernel/crash.o
  CC      arch/x86/kernel/module.o
  CC      drivers/mfd/wm831x-spi.o
  CC [M]  drivers/block/drbd/drbd_req.o
  CC      fs/pstore/pmsg.o
  CC [M]  crypto/authencesn.o
  CC [M]  drivers/regulator/mc13892-regulator.o
  CC [M]  drivers/misc/ibmasm/module.o
  CC [M]  drivers/dax/device.o
  CC [M]  net/rds/loop.o
  LD [M]  net/dccp/dccp.o
  LD [M]  net/dccp/dccp_ipv4.o
  LD [M]  net/dccp/dccp_ipv6.o
  LD [M]  net/dccp/dccp_diag.o
  AR      drivers/gpu/drm/bridge/imx/built-in.a
  CC      fs/efivarfs/super.o
  AR      drivers/gpu/drm/bridge/synopsys/built-in.a
  CC [M]  crypto/lz4.o
  CC      drivers/mfd/wm8350-core.o
  CC [M]  net/netfilter/nf_nat_tftp.o
  CC [M]  net/sunrpc/svcauth.o
  CC [M]  net/ipv6/ah6.o
  CC [M]  drivers/misc/pvpanic/pvpanic-mmio.o
  CC      kernel/trace/trace_uprobe.o
  CC [M]  drivers/tty/n_hdlc.o
  CC [M]  drivers/scsi/device_handler/scsi_dh_emc.o
  CC [M]  net/sunrpc/svcauth_unix.o
  CC      drivers/dma-buf/dma-fence-array.o
  CC [M]  drivers/base/regmap/regmap-spmi.o
  CC [M]  drivers/misc/cardreader/rts5227.o
../drivers/gpu/drm/bridge/analogix/analogix_dp_core.c: In function ‘analogix_dp_probe’:
../drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1589:17: error: label ‘err_disable_clk’ used but not defined
 1589 |                 goto err_disable_clk;
      |                 ^~~~
  CC [M]  net/netfilter/nf_synproxy_core.o
make[8]: *** [../scripts/Makefile.build:203: drivers/gpu/drm/bridge/analogix/analogix_dp_core.o] Error 1
make[7]: *** [../scripts/Makefile.build:461: drivers/gpu/drm/bridge/analogix] Error 2
make[6]: *** [../scripts/Makefile.build:461: drivers/gpu/drm/bridge] Error 2
make[6]: *** Waiting for unfinished jobs....
  CC      drivers/dma-buf/dma-fence-chain.o
  CC [M]  drivers/cxl/core/pmem.o
  CC      drivers/dma-buf/dma-fence-unwrap.o
  CC      kernel/bpf/stackmap.o
  CC [M]  fs/pstore/ram.o
  CC      drivers/acpi/acpica/tbxfroot.o
  CC [M]  drivers/cxl/core/regs.o
  CC [M]  drivers/cxl/core/memdev.o
  CC [M]  drivers/base/regmap/regmap-w1.o
  CC      fs/efivarfs/vars.o
  CC [M]  net/netfilter/nf_conncount.o
  CC      arch/x86/kernel/kgdb.o
  CC [M]  net/netfilter/nf_dup_netdev.o
  CC [M]  drivers/misc/ibmasm/ibmasmfs.o
  CC [M]  net/9p/mod.o
  CC [M]  net/sctp/outqueue.o
  CC [M]  net/9p/client.o
  CC [M]  drivers/regulator/mc13xxx-regulator-core.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_helper.o
  CC [M]  sound/soc/soc-core.o
  CC [M]  drivers/dax/kmem.o
  CC [M]  drivers/scsi/device_handler/scsi_dh_alua.o
  CC      kernel/kthread.o
  CC [M]  drivers/misc/pvpanic/pvpanic-pci.o
  CC      lib/string_helpers.o
  CC [M]  crypto/lz4hc.o
  CC      drivers/acpi/acpica/utaddress.o
  CC      drivers/nvdimm/dimm.o
  CC [M]  net/psample/psample.o
  CC [M]  drivers/misc/cardreader/rts5249.o
  CC [M]  net/rds/page.o
  CC [M]  drivers/tty/n_gsm.o
  CC [M]  net/rds/rdma.o
  CC [M]  crypto/842.o
  CC      kernel/bpf/cgroup_iter.o
  CC [M]  drivers/block/drbd/drbd_actlog.o
  CC [M]  net/sctp/ulpqueue.o
  AR      fs/efivarfs/built-in.a
  CC      drivers/dma-buf/dma-resv.o
  CC      drivers/dma-buf/dma-heap.o
  CC [M]  fs/pstore/ram_core.o
  CC [M]  drivers/block/drbd/drbd_main.o
  CC      drivers/acpi/acpica/utalloc.o
  CC      drivers/mfd/wm8350-regmap.o
  CC [M]  net/ipv6/esp6.o
  CC [M]  drivers/dax/pmem.o
  CC [M]  drivers/cxl/core/mbox.o
  CC [M]  drivers/base/regmap/regmap-i3c.o
  CC [M]  drivers/misc/ibmasm/event.o
  CC      arch/x86/kernel/early_printk.o
  CC      drivers/acpi/acpica/utascii.o
  CC [M]  net/ipv6/esp6_offload.o
  CC [M]  net/vmw_vsock/af_vsock.o
  CC [M]  drivers/block/floppy.o
  CC [M]  drivers/misc/cardreader/rts5260.o
  CC [M]  crypto/ansi_cprng.o
  CC      drivers/nvdimm/region_devs.o
  CC      net/ipv4/inet_fragment.o
  CC [M]  drivers/tty/moxa.o
  CC [M]  drivers/gpu/drm/display/drm_scdc_helper.o
  CC [M]  net/bridge/br_vlan_tunnel.o
  CC [M]  drivers/regulator/mp8859.o
  CC      lib/hexdump.o
  CC [M]  drivers/misc/ibmasm/command.o
  CC      kernel/bpf/bpf_cgrp_storage.o
  CC      drivers/acpi/acpica/utbuffer.o
  CC      kernel/trace/trace_boot.o
  CC [M]  net/vmw_vsock/af_vsock_tap.o
  CC [M]  net/ipv6/ipcomp6.o
  AR      drivers/scsi/megaraid/built-in.a
  CC [M]  drivers/scsi/megaraid/megaraid_mm.o
  CC [M]  drivers/base/regmap/regmap-spi-avmm.o
  CC      drivers/mfd/wm8350-gpio.o
  CC [M]  drivers/misc/ibmasm/remote.o
  CC      lib/kstrtox.o
  CC      net/ipv4/ping.o
  CC [M]  drivers/misc/sgi-xp/xp_main.o
  CC [M]  fs/pstore/zone.o
  CC      kernel/sys_ni.o
  CC      arch/x86/kernel/hpet.o
  CC [M]  drivers/dax/cxl.o
  CC [M]  net/rds/tcp.o
  CC      drivers/acpi/acpica/utcksum.o
  CC [M]  crypto/tcrypt.o
  CC [M]  drivers/misc/cardreader/rts5261.o
  CC [M]  crypto/polyval-generic.o
  CC [M]  drivers/tty/mxser.o
  CC [M]  drivers/tty/nozomi.o
  CC      drivers/dma-buf/sync_file.o
  CC [M]  drivers/tty/ttynull.o
  CC [M]  drivers/regulator/mt6311-regulator.o
  CC [M]  net/sctp/tsnmap.o
  CC [M]  drivers/misc/sgi-xp/xp_uv.o
  CC      mm/mempolicy.o
  CC [M]  net/sunrpc/addr.o
  CC [M]  drivers/misc/ibmasm/heartbeat.o
  CC [M]  drivers/misc/ibmasm/r_heartbeat.o
  CC [M]  net/netfilter/nf_tables_core.o
  CC      mm/sparse.o
  CC      lib/debug_info.o
  CC      drivers/acpi/acpica/utcopy.o
  CC [M]  drivers/tty/rpmsg_tty.o
  LD [M]  drivers/dax/device_dax.o
  LD [M]  drivers/dax/dax_pmem.o
  LD [M]  drivers/dax/dax_cxl.o
  AR      drivers/dax/built-in.a
  CC [M]  net/netfilter/nf_tables_api.o
  CC      kernel/bpf/cgroup.o
  CC      kernel/trace/fprobe.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_state_helper.o
  CC [M]  net/9p/error.o
  CC [M]  drivers/misc/sgi-gru/grufile.o
  CC [M]  drivers/misc/ibmasm/dot_command.o
  CC [M]  drivers/misc/sgi-gru/grumain.o
  CC [M]  drivers/misc/sgi-gru/grufault.o
  CC [M]  drivers/cxl/core/pci.o
  CC [M]  drivers/block/drbd/drbd_strings.o
  CC [M]  drivers/misc/cardreader/rts5228.o
  CC [M]  net/vmw_vsock/vsock_addr.o
  CC [M]  drivers/scsi/megaraid/megaraid_mbox.o
  CC      drivers/mfd/wm8350-irq.o
  CC [M]  drivers/misc/ibmasm/lowlevel.o
  CC [M]  net/bridge/br_vlan_options.o
  CC [M]  drivers/regulator/mt6315-regulator.o
  CC      drivers/acpi/acpica/utexcep.o
  AR      drivers/base/regmap/built-in.a
  CC      drivers/base/core.o
  CC [M]  drivers/misc/sgi-xp/xpc_main.o
  CC      fs/btrfs/ctree.o
  CC [M]  net/rds/tcp_connect.o
  CC [M]  net/ipv6/xfrm6_tunnel.o
  CC      drivers/acpi/acpica/utdebug.o
  CC      arch/x86/kernel/amd_nb.o
  CC      drivers/nvme/common/auth.o
  CC      drivers/nvme/host/core.o
  CC      drivers/nvdimm/region.o
  CC [M]  fs/pstore/blk.o
  CC      drivers/dma-buf/sw_sync.o
  CC      drivers/acpi/acpica/utdecode.o
  CC [M]  sound/soc/soc-dapm.o
  CC [M]  drivers/block/brd.o
  CC [M]  drivers/block/ublk_drv.o
  CC [M]  net/sctp/bind_addr.o
  CC [M]  drivers/cxl/core/hdm.o
  AR      drivers/tty/built-in.a
  CC      lib/iomap.o
  CC [M]  drivers/misc/cardreader/rts5264.o
  CC [M]  drivers/misc/ibmasm/uart.o
  CC [M]  net/9p/protocol.o
  CC [M]  drivers/regulator/mt6323-regulator.o
  AR      drivers/nvme/target/built-in.a
  CC [M]  drivers/nvme/target/core.o
  CC [M]  drivers/misc/sgi-gru/grutlbpurge.o
  CC      arch/x86/kernel/amd_node.o
  CC      drivers/mfd/wm8350-i2c.o
  CC [M]  drivers/nvme/target/configfs.o
  CC [M]  drivers/block/drbd/drbd_nl.o
  CC      drivers/nvme/host/ioctl.o
  CC [M]  net/rds/tcp_listen.o
  CC      net/ipv4/ip_tunnel_core.o
  CC      drivers/acpi/acpica/utdelete.o
  CC      arch/x86/kernel/kvm.o
  CC [M]  drivers/gpu/drm/display/drm_dp_aux_dev.o
  CC [M]  fs/netfs/buffered_read.o
  CC [M]  fs/nfs/filelayout/filelayout.o
  CC [M]  fs/nfs/filelayout/filelayoutdev.o
  CC [M]  net/sunrpc/rpcb_clnt.o
  CC      kernel/nsproxy.o
  CC [M]  crypto/af_alg.o
  CC      drivers/nvdimm/namespace_devs.o
  CC      kernel/trace/rethook.o
  LD [M]  drivers/misc/ibmasm/ibmasm.o
  CC [M]  drivers/misc/sgi-xp/xpc_channel.o
  CC [M]  net/sctp/socket.o
  CC      drivers/base/bus.o
  CC [M]  net/sctp/primitive.o
  CC [M]  net/bridge/br_mst.o
  CC [M]  drivers/misc/c2port/core.o
  CC [M]  drivers/misc/cardreader/rtsx_usb.o
  CC [M]  net/vmw_vsock/vsock_bpf.o
  CC      lib/iomap_copy.o
  CC      drivers/dma-buf/sync_debug.o
  CC [M]  drivers/regulator/mt6331-regulator.o
  LD [M]  fs/pstore/ramoops.o
  LD [M]  fs/pstore/pstore_zone.o
  LD [M]  fs/pstore/pstore_blk.o
  CC      drivers/acpi/acpica/uterror.o
  AR      fs/pstore/built-in.a
  CC      drivers/nvme/common/keyring.o
  CC [M]  drivers/cxl/port.o
  CC [M]  drivers/scsi/megaraid/megaraid_sas_base.o
  CC      drivers/mfd/tps65910.o
  CC [M]  drivers/misc/sgi-gru/gruprocfs.o
  CC [M]  drivers/cxl/core/pmu.o
  CC [M]  net/sunrpc/timer.o
  CC      drivers/acpi/proc.o
  CC      lib/devres.o
  CC      drivers/acpi/acpica/uteval.o
  CC      kernel/bpf/reuseport_array.o
  CC [M]  net/ipv6/tunnel6.o
  CC [M]  drivers/gpu/drm/display/drm_dp_cec.o
  CC [M]  net/9p/trans_common.o
  CC      kernel/bpf/bpf_struct_ops.o
  CC      kernel/trace/trace_fprobe.o
  CC      drivers/dma-buf/udmabuf.o
  CC [M]  drivers/misc/sgi-xp/xpc_partition.o
  CC [M]  drivers/misc/altera-stapl/altera-jtag.o
  CC [M]  drivers/misc/mei/hdcp/mei_hdcp.o
  CC [M]  drivers/misc/vmw_vmci/vmci_context.o
  CC [M]  net/rds/tcp_recv.o
  CC      mm/sparse-vmemmap.o
  CC [M]  drivers/misc/genwqe/card_base.o
  CC [M]  drivers/regulator/mt6332-regulator.o
  CC [M]  net/sctp/output.o
  CC      drivers/mfd/tps65912-core.o
  CC      drivers/acpi/acpica/utglobal.o
  CC      drivers/mfd/tps65912-i2c.o
  CC [M]  drivers/misc/sgi-gru/grukservices.o
  CC      drivers/mfd/tps65912-spi.o
  CC      arch/x86/kernel/kvmclock.o
  AR      drivers/nvme/common/built-in.a
  CC [M]  drivers/misc/sgi-gru/gruhandles.o
  CC [M]  drivers/misc/c2port/c2port-duramar2150.o
  CC [M]  fs/lockd/clntlock.o
  CC [M]  fs/netfs/buffered_write.o
  LD [M]  fs/nfs/filelayout/nfs_layout_nfsv41_files.o
  CC [M]  fs/netfs/direct_read.o
  CC [M]  fs/nfs/blocklayout/blocklayout.o
  LD [M]  drivers/misc/cardreader/rtsx_pci.o
  CC [M]  net/vmw_vsock/diag.o
  CC [M]  drivers/misc/altera-stapl/altera-comp.o
  CC [M]  net/bridge/br_switchdev.o
  CC [M]  drivers/misc/sgi-xp/xpc_uv.o
  CC      lib/check_signature.o
  CC      kernel/bpf/cpumask.o
  CC [M]  drivers/cxl/core/cdat.o
  CC [M]  net/9p/trans_fd.o
  CC [M]  drivers/misc/altera-stapl/altera.o
  CC      fs/btrfs/extent-tree.o
  CC [M]  drivers/regulator/mt6357-regulator.o
  CC      drivers/acpi/acpica/uthex.o
  CC [M]  drivers/nvme/target/admin-cmd.o
  CC [M]  drivers/dma-buf/selftest.o
  CC [M]  drivers/misc/altera-stapl/altera-lpt.o
  CC      net/ipv4/gre_offload.o
  CC [M]  fs/lockd/clntproc.o
  CC [M]  drivers/misc/mei/pxp/mei_pxp.o
  CC [M]  fs/nfs/flexfilelayout/flexfilelayout.o
  CC [M]  drivers/misc/genwqe/card_dev.o
  AR      drivers/block/built-in.a
  CC [M]  fs/nfs/flexfilelayout/flexfilelayoutdev.o
  CC      drivers/base/dd.o
  CC      lib/interval_tree.o
  CC      drivers/mfd/twl-core.o
  CC      drivers/base/syscore.o
  CC      mm/mmu_notifier.o
  CC      drivers/base/driver.o
  LD [M]  drivers/gpu/drm/display/drm_display_helper.o
  CC [M]  crypto/algif_hash.o
  CC [M]  drivers/cxl/core/ras.o
make[5]: *** [../scripts/Makefile.build:461: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:461: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
  CC      drivers/nvme/host/sysfs.o
  CC      drivers/nvdimm/label.o
  CC      kernel/notifier.o
  CC      arch/x86/kernel/paravirt.o
  CC [M]  sound/soc/soc-jack.o
  CC [M]  net/sunrpc/xdr.o
  CC      drivers/acpi/acpica/utids.o
  AR      kernel/trace/built-in.a
  CC [M]  drivers/misc/sgi-gru/grukdump.o
  CC [M]  net/rds/tcp_send.o
  CC [M]  drivers/misc/vmw_vmci/vmci_datagram.o
  CC [M]  net/ipv6/mip6.o
  CC [M]  sound/soc/soc-utils.o
  CC [M]  net/sunrpc/sunrpc_syms.o
  CC [M]  drivers/dma-buf/st-dma-fence.o
  CC [M]  net/vmw_vsock/vmci_transport.o
  CC      lib/assoc_array.o
  CC [M]  drivers/regulator/mt6358-regulator.o
  CC      kernel/bpf/bpf_lsm.o
  CC [M]  drivers/misc/mei/gsc_proxy/mei_gsc_proxy.o
  CC      drivers/acpi/acpica/utinit.o
  CC      drivers/nvme/host/pr.o
  CC      drivers/base/class.o
  CC [M]  drivers/misc/sgi-xp/xpnet.o
  CC [M]  fs/nfs/blocklayout/dev.o
  CC [M]  sound/soc/soc-dai.o
  CC [M]  drivers/misc/genwqe/card_ddcb.o
  CC [M]  net/bridge/br_mrp_switchdev.o
  CC [M]  fs/netfs/direct_write.o
  CC [M]  net/9p/trans_xen.o
  CC [M]  drivers/nvme/target/fabrics-cmd.o
  CC [M]  drivers/misc/genwqe/card_sysfs.o
  CC [M]  sound/soc/soc-component.o
  CC      net/ipv4/metrics.o
  CC [M]  drivers/cxl/core/acpi.o
  CC [M]  drivers/dma-buf/st-dma-fence-chain.o
  CC      drivers/acpi/acpica/utlock.o
  LD [M]  drivers/misc/sgi-gru/gru.o
  CC [M]  sound/soc/soc-pcm.o
  CC [M]  net/ipv6/ip6_vti.o
  CC [M]  crypto/algif_skcipher.o
  CC [M]  drivers/scsi/megaraid/megaraid_sas_fusion.o
  CC      mm/ksm.o
  CC [M]  drivers/regulator/mt6359-regulator.o
  CC [M]  fs/lockd/clntxdr.o
  CC      drivers/mfd/twl4030-irq.o
  CC [M]  net/netfilter/nft_chain_filter.o
  CC      lib/list_debug.o
  CC [M]  drivers/misc/vmw_vmci/vmci_doorbell.o
  CC [M]  drivers/misc/mei/init.o
  CC      kernel/bpf/crypto.o
  CC      arch/x86/kernel/paravirt-spinlocks.o
  CC      net/ipv4/netlink.o
  CC      drivers/nvdimm/badrange.o
  CC [M]  net/rds/tcp_stats.o
  CC [M]  drivers/nvme/target/discovery.o
  CC      drivers/acpi/acpica/utmath.o
  CC [M]  drivers/scsi/libsas/sas_init.o
  CC [M]  fs/smb/common/cifs_arc4.o
  LD [M]  drivers/misc/altera-stapl/altera-stapl.o
  CC [M]  fs/smb/client/trace.o
  CC      lib/debugobjects.o
  CC      lib/bitrev.o
  CC [M]  drivers/block/drbd/drbd_interval.o
  CC [M]  net/vmw_vsock/vmci_transport_notify.o
  CC [M]  drivers/cxl/core/trace.o
  CC      drivers/nvme/host/trace.o
  CC      arch/x86/kernel/pvclock.o
  CC      lib/linear_ranges.o
  LD [M]  drivers/misc/sgi-xp/xp.o
  CC      arch/x86/kernel/pmem.o
  LD [M]  drivers/misc/sgi-xp/xpc.o
  CC      kernel/ksysfs.o
  CC      lib/packing.o
  CC      drivers/mfd/twl6030-irq.o
  CC [M]  net/9p/trans_virtio.o
  CC [M]  drivers/misc/genwqe/card_debugfs.o
  CC      drivers/base/platform.o
  CC [M]  drivers/dma-buf/st-dma-fence-unwrap.o
  CC [M]  drivers/block/drbd/drbd_state.o
  CC [M]  drivers/misc/vmw_vmci/vmci_driver.o
  CC      drivers/acpi/acpica/utmisc.o
  CC [M]  net/bridge/br_mrp.o
  CC [M]  fs/netfs/iterator.o
  CC [M]  drivers/regulator/mt6360-regulator.o
  LD [M]  fs/nfs/flexfilelayout/nfs_layout_flexfiles.o
  CC      drivers/base/cpu.o
  CC [M]  crypto/algif_rng.o
  CC [M]  net/ipv6/sit.o
  CC [M]  drivers/cxl/core/region.o
  CC [M]  fs/nfs/blocklayout/extent_tree.o
  CC      net/ipv4/nexthop.o
  CC      arch/x86/kernel/jailhouse.o
  CC [M]  fs/lockd/host.o
  CC [M]  drivers/nvme/target/io-cmd-file.o
  CC      drivers/acpi/acpica/utmutex.o
  CC [M]  fs/smb/common/cifs_md4.o
  CC [M]  drivers/misc/mei/hbm.o
  CC      kernel/cred.o
  CC [M]  drivers/scsi/libsas/sas_phy.o
  LD [M]  net/rds/rds.o
  LD [M]  net/rds/rds_tcp.o
  CC [M]  drivers/nvme/target/io-cmd-bdev.o
  CC [M]  net/vmw_vsock/vmci_transport_notify_qstate.o
  COPY    drivers/scsi/aic7xxx/aic7xxx_seq.h
  COPY    drivers/scsi/aic7xxx/aic7xxx_reg.h
  COPY    drivers/scsi/aic7xxx/aic7xxx_reg_print.c
  CC [M]  drivers/misc/genwqe/card_utils.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_osm.o
  CC [M]  drivers/dma-buf/st-dma-resv.o
  CC      drivers/base/firmware.o
  CC [M]  net/sctp/input.o
  CC [M]  drivers/misc/vmw_vmci/vmci_event.o
  CC [M]  drivers/regulator/mt6370-regulator.o
  CC [M]  net/ipv6/ip6_tunnel.o
  CC      kernel/bpf/relo_core.o
  CC      net/devres.o
  CC      lib/crc-ccitt.o
  CC      drivers/nvdimm/claim.o
  CC      mm/page_poison.o
  CC      fs/btrfs/print-tree.o
  CC      drivers/acpi/acpica/utnonansi.o
  CC      drivers/base/init.o
  CC      kernel/reboot.o
  CC [M]  fs/lockd/svc.o
  CC      arch/x86/kernel/pcspeaker.o
  LD [M]  net/9p/9pnet.o
  LD [M]  net/9p/9pnet_fd.o
  LD [M]  net/9p/9pnet_xen.o
  CC [M]  net/bridge/br_mrp_netlink.o
  LD [M]  net/9p/9pnet_virtio.o
  CC [M]  crypto/algif_aead.o
  CC [M]  fs/lockd/svclock.o
  CC      drivers/mfd/twl4030-audio.o
  CC      drivers/nvme/host/multipath.o
  AR      drivers/dma-buf/built-in.a
  LD [M]  drivers/dma-buf/dmabuf_selftests.o
  CC [M]  drivers/scsi/libsas/sas_port.o
  CC [M]  net/sunrpc/cache.o
  CC [M]  drivers/misc/echo/echo.o
  CC [M]  fs/netfs/locking.o
  CC [M]  drivers/scsi/megaraid/megaraid_sas_fp.o
  CC [M]  drivers/regulator/mt6397-regulator.o
  CC      drivers/acpi/acpica/utobject.o
  CC [M]  fs/netfs/main.o
  CC [M]  drivers/regulator/qcom-labibb-regulator.o
  CC [M]  net/sunrpc/rpc_pipe.o
  CC [M]  drivers/nvme/target/pr.o
  CC      drivers/acpi/acpica/utosi.o
  CC [M]  sound/soc/soc-devres.o
  CC [M]  fs/nfs/blocklayout/rpc_pipefs.o
  CC      mm/memtest.o
  CC [M]  sound/soc/soc-ops.o
  CC [M]  drivers/nvme/target/passthru.o
  CC [M]  net/vmw_vsock/virtio_transport.o
  CC      arch/x86/kernel/check.o
  CC      drivers/base/map.o
  LD [M]  drivers/misc/genwqe/genwqe_card.o
  CC [M]  fs/nfs/client.o
  CC      lib/crc16.o
  CC [M]  drivers/misc/mei/interrupt.o
  CC [M]  drivers/misc/vmw_vmci/vmci_guest.o
  CC [M]  net/netfilter/nf_tables_trace.o
  CC      drivers/acpi/acpica/utownerid.o
  CC      fs/btrfs/root-tree.o
  CC      fs/btrfs/dir-item.o
  CC [M]  net/ipv6/ip6_gre.o
  CC [M]  drivers/cxl/acpi.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_proc.o
  CC      drivers/mfd/twl6040.o
  CC      kernel/bpf/btf_iter.o
  CC      drivers/acpi/bus.o
  CC [M]  drivers/scsi/libsas/sas_event.o
  CC [M]  fs/lockd/svcshare.o
  CC [M]  drivers/scsi/isci/init.o
  CC [M]  crypto/zstd.o
  CC      drivers/acpi/acpica/utpredef.o
  CC      drivers/acpi/acpica/utresdecode.o
  CC      drivers/base/devres.o
  CC [M]  net/netfilter/nft_immediate.o
  CC      kernel/bpf/btf_relocate.o
  CC [M]  drivers/regulator/qcom_spmi-regulator.o
  CC      drivers/nvdimm/btt_devs.o
  CC      arch/x86/kernel/uprobes.o
  CC [M]  net/bridge/br_cfm.o
  CC      mm/migrate.o
  CC      net/ipv4/udp_tunnel_stub.o
  CC [M]  drivers/misc/mei/client.o
  CC [M]  drivers/scsi/megaraid/megaraid_sas_debugfs.o
  CC [M]  net/netfilter/nft_cmp.o
  CC [M]  net/sctp/debug.o
  CC [M]  drivers/block/drbd/drbd_nla.o
  CC      arch/x86/kernel/perf_regs.o
  CC [M]  fs/nfs/dir.o
  CC      lib/crc-t10dif.o
  CC      net/ipv4/sysctl_net_ipv4.o
  LD [M]  fs/nfs/blocklayout/blocklayoutdriver.o
  CC [M]  drivers/misc/vmw_vmci/vmci_handle_array.o
  CC [M]  drivers/nvme/target/zns.o
  CC [M]  drivers/cxl/core/mce.o
  CC      drivers/acpi/acpica/utresrc.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_osm_pci.o
  CC [M]  net/vmw_vsock/virtio_transport_common.o
  CC [M]  crypto/essiv.o
  CC      drivers/nvdimm/pfn_devs.o
  CC [M]  fs/lockd/svcproc.o
  CC [M]  fs/smb/client/cifsfs.o
  CC      drivers/nvdimm/dax_devs.o
  CC [M]  sound/soc/soc-link.o
  CC      drivers/nvdimm/security.o
  CC      fs/btrfs/file-item.o
  CC      lib/crc-itu-t.o
  CC      drivers/nvme/host/zns.o
  CC      drivers/nvdimm/e820.o
  CC [M]  drivers/misc/vmw_vmci/vmci_host.o
  CC [M]  drivers/scsi/isci/phy.o
  CC      net/ipv4/proc.o
  CC      drivers/acpi/acpica/utstate.o
  CC [M]  net/sctp/stream.o
  CC [M]  drivers/regulator/qcom_usb_vbus-regulator.o
  CC      kernel/bpf/kmem_cache_iter.o
  LD [M]  drivers/scsi/megaraid/megaraid_sas.o
  CC [M]  fs/nfs/file.o
  CC [M]  net/sctp/auth.o
  CC [M]  drivers/scsi/libsas/sas_discover.o
  CC      arch/x86/kernel/tracepoint.o
  CC [M]  drivers/block/drbd/drbd_debugfs.o
  AR      drivers/cxl/core/built-in.a
  CC      net/ipv4/fib_rules.o
  CC      drivers/mfd/mfd-core.o
  LD [M]  drivers/cxl/core/cxl_core.o
  CC [M]  drivers/cxl/pmem.o
  CC [M]  fs/netfs/misc.o
  CC [M]  drivers/nvme/target/fabrics-cmd-auth.o
  CC      drivers/base/attribute_container.o
  CC      drivers/mfd/ezx-pcap.o
  COPY    drivers/scsi/aic7xxx/aic79xx_seq.h
  CC [M]  drivers/misc/mei/main.o
  COPY    drivers/scsi/aic7xxx/aic79xx_reg.h
  COPY    drivers/scsi/aic7xxx/aic79xx_reg_print.c
  CC [M]  drivers/scsi/aic7xxx/aic79xx_osm.o
  CC [M]  net/sunrpc/sysfs.o
  CC [M]  drivers/scsi/isci/request.o
  CC      drivers/acpi/acpica/utstring.o
  CC [M]  net/sunrpc/svc_xprt.o
  CC [M]  net/netfilter/nft_range.o
  CC [M]  net/bridge/br_cfm_netlink.o
  CC [M]  crypto/curve25519-generic.o
  CC      net/socket.o
  CC [M]  drivers/nvme/target/auth.o
  CC      drivers/nvme/host/fault_inject.o
  HOSTCC  lib/gen_crc32table
  CC [M]  drivers/scsi/libsas/sas_expander.o
  CC [M]  drivers/cxl/security.o
  CC [M]  drivers/misc/vmw_vmci/vmci_queue_pair.o
  HOSTCC  lib/gen_crc64table
  CC      arch/x86/kernel/itmt.o
  CC [M]  fs/lockd/svcsubs.o
  CC [M]  net/sunrpc/xprtmultipath.o
  CC      lib/xxhash.o
  CC [M]  sound/soc/soc-card.o
  CC [M]  drivers/regulator/palmas-regulator.o
  AR      kernel/bpf/built-in.a
  CC      drivers/acpi/acpica/utstrsuppt.o
  CC [M]  fs/romfs/storage.o
  CC      kernel/async.o
  CC [M]  fs/autofs/init.o
  CC [M]  fs/autofs/inode.o
  CC [M]  net/ipv6/fou6.o
  CC [M]  sound/soc/soc-compress.o
  CC      arch/x86/kernel/umip.o
  ASN.1   crypto/ecrdsa_params.asn1.[ch]
  ASN.1   crypto/ecrdsa_pub_key.asn1.[ch]
  CC [M]  crypto/ecrdsa_params.asn1.o
  CC      fs/btrfs/inode-item.o
  CC [M]  drivers/nvdimm/pmem.o
  CC [M]  drivers/regulator/pca9450-regulator.o
  CC [M]  crypto/ecrdsa_pub_key.asn1.o
  CC [M]  fs/smb/client/cifs_debug.o
  CC [M]  net/ipv6/ip6_udp_tunnel.o
  CC      drivers/acpi/acpica/utstrtoul64.o
  CC [M]  crypto/simd.o
  CC      net/ipv4/ipmr.o
  CC      drivers/acpi/glue.o
  CC      drivers/base/transport_class.o
  CC [M]  net/netfilter/nft_bitwise.o
  CC [M]  drivers/cxl/mem.o
  CC      fs/btrfs/disk-io.o
  CC [M]  drivers/misc/vmw_vmci/vmci_resource.o
  CC [M]  drivers/nvme/target/trace.o
  CC [M]  net/sctp/offload.o
  CC [M]  fs/romfs/super.o
  CC      kernel/range.o
  CC      drivers/mfd/da903x.o
  CC      arch/x86/kernel/unwind_frame.o
  CC      drivers/acpi/acpica/utxface.o
  CC      arch/x86/kernel/callthunks.o
  CC [M]  fs/netfs/objects.o
  CC [M]  drivers/misc/mei/dma-ring.o
  CC      net/ipv4/ipmr_base.o
  CC [M]  net/bridge/br_netfilter_hooks.o
  CC      mm/memory-tiers.o
  CC [M]  fs/autofs/root.o
  CC [M]  net/netfilter/nft_byteorder.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_proc.o
  LD [M]  drivers/block/drbd/drbd.o
  CC      lib/genalloc.o
  CC [M]  drivers/scsi/isci/remote_device.o
  CC      net/compat.o
  CC      kernel/smpboot.o
  CC      drivers/nvme/host/hwmon.o
  CC [M]  net/vmw_vsock/hyperv_transport.o
  CC      mm/migrate_device.o
  CC [M]  fs/fuse/dev.o
  CC      kernel/ucount.o
  CC      fs/btrfs/transaction.o
  CC [M]  drivers/regulator/pv88060-regulator.o
  CC      drivers/acpi/acpica/utxfinit.o
  CC [M]  fs/fuse/dir.o
  CC [M]  drivers/nvdimm/btt.o
  CC [M]  sound/soc/soc-generic-dmaengine-pcm.o
  CC [M]  drivers/cxl/pci.o
  CC [M]  drivers/nvme/target/loop.o
  CC      drivers/base/topology.o
  CC [M]  drivers/nvdimm/virtio_pmem.o
  CC [M]  sound/soc/soc-ac97.o
  CC [M]  drivers/nvdimm/nd_virtio.o
  CC [M]  drivers/misc/mei/bus.o
  LD [M]  fs/romfs/romfs.o
  CC      net/sysctl_net.o
  CC      drivers/acpi/acpica/utxferror.o
  CC      drivers/nvme/host/auth.o
  CC [M]  crypto/ecdsa-x962.o
  CC [M]  fs/netfs/read_collect.o
  CC [M]  net/vmw_vsock/vsock_loopback.o
  CC [M]  fs/lockd/mon.o
  CC [M]  drivers/misc/vmw_vmci/vmci_route.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_osm_pci.o
  CC [M]  net/bridge/br_netfilter_ipv6.o
  CC [M]  net/sctp/stream_sched.o
  CC [M]  drivers/scsi/libsas/sas_scsi_host.o
  CC [M]  fs/smb/client/connect.o
  CC [M]  fs/smb/client/dir.o
  CC      arch/x86/kernel/cet.o
  CC [M]  drivers/scsi/isci/port.o
  CC [M]  drivers/regulator/pv88080-regulator.o
  CC [M]  fs/autofs/symlink.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_base.o
  LD [M]  drivers/misc/vmw_vmci/vmw_vmci.o
  CC      mm/huge_memory.o
  CC [M]  fs/nfs/getroot.o
  CC      kernel/regset.o
  CC      drivers/mfd/da9052-irq.o
  CC      drivers/base/container.o
  CC      drivers/acpi/acpica/utxfmutex.o
  AR      net/ipv6/built-in.a
  CC [M]  net/sctp/stream_sched_prio.o
  CC      lib/textsearch.o
  CC      net/ipv4/syncookies.o
  CC      mm/khugepaged.o
  CC      net/ipv4/netfilter.o
  LD [M]  crypto/aegis128.o
  CC [M]  crypto/ecrdsa.o
  CC [M]  net/netfilter/nft_payload.o
  CC [M]  net/sunrpc/debugfs.o
  CC      drivers/mfd/da9052-core.o
  LD [M]  drivers/cxl/cxl_port.o
  LD [M]  drivers/cxl/cxl_acpi.o
  LD [M]  drivers/cxl/cxl_pmem.o
  LD [M]  drivers/cxl/cxl_mem.o
  LD [M]  drivers/cxl/cxl_pci.o
  AR      drivers/cxl/built-in.a
  CC      drivers/acpi/scan.o
  CC [M]  drivers/scsi/libsas/sas_task.o
  CC [M]  drivers/nvme/target/fc.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_core.o
  LD [M]  net/vmw_vsock/vsock.o
  CC      fs/btrfs/inode.o
  LD [M]  net/vmw_vsock/vsock_diag.o
  LD [M]  net/vmw_vsock/vmw_vsock_vmci_transport.o
  LD [M]  sound/soc/snd-soc-acpi.o
  LD [M]  sound/soc/snd-soc-core.o
  LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport.o
  LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport_common.o
  LD [M]  net/vmw_vsock/hv_sock.o
  CC      net/ipv4/tcp_cubic.o
  LD [M]  crypto/crypto_simd.o
  CC [M]  net/netfilter/nft_lookup.o
  CC [M]  fs/autofs/waitq.o
  CC      drivers/base/property.o
  CC      kernel/ksyms_common.o
  CC [M]  net/netfilter/nft_dynset.o
  CC [M]  drivers/regulator/pv88090-regulator.o
  CC      arch/x86/kernel/shstk.o
  CC      drivers/nvme/host/pci.o
  CC [M]  net/sunrpc/backchannel_rqst.o
  CC      drivers/acpi/mipi-disco-img.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_config.o
  CC      net/ipv4/tcp_sigpool.o
  CC [M]  fs/lockd/trace.o
  CC      crypto/rsapubkey.asn1.o
  CC      drivers/acpi/acpica/dbcmds.o
  CC [M]  drivers/misc/mei/bus-fixup.o
  CC      crypto/rsaprivkey.asn1.o
  CC [M]  drivers/misc/mei/debugfs.o
  CC      drivers/acpi/acpica/dbconvert.o
  LD [M]  crypto/ecdsa_generic.o
  LD [M]  crypto/ecrdsa_generic.o
  AR      crypto/built-in.a
  CC      net/ipv4/tcp_bpf.o
  LD [M]  net/bridge/bridge.o
  LD [M]  net/bridge/br_netfilter.o
  CC      mm/page_counter.o
  CC      lib/percpu_counter.o
  CC [M]  drivers/nvme/target/tcp.o
  CC [M]  fs/nfs/inode.o
  CC [M]  drivers/scsi/isci/host.o
  CC [M]  net/netfilter/nft_meta.o
  LD [M]  drivers/nvdimm/nd_pmem.o
  LD [M]  drivers/nvdimm/nd_btt.o
  AR      drivers/nvdimm/built-in.a
  CC [M]  drivers/misc/bcm-vk/bcm_vk_dev.o
  CC      drivers/mfd/da9052-spi.o
  CC      mm/memcontrol.o
  CC [M]  net/sctp/stream_sched_rr.o
  CC      arch/x86/kernel/audit_64.o
  CC [M]  drivers/scsi/libsas/sas_ata.o
  CC      kernel/groups.o
  LD [M]  drivers/nvme/target/nvmet.o
  CC [M]  fs/netfs/read_pgpriv2.o
  LD [M]  drivers/nvme/target/nvme-loop.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_93cx6.o
  CC [M]  fs/fuse/file.o
  CC      drivers/acpi/acpica/dbdisply.o
  CC [M]  fs/overlayfs/super.o
  CC      fs/btrfs/file.o
  CC [M]  fs/overlayfs/namei.o
  CC [M]  drivers/regulator/pwm-regulator.o
  CC [M]  fs/autofs/expire.o
  CC [M]  fs/netfs/read_retry.o
  CC [M]  fs/nfs/super.o
  CC [M]  drivers/misc/uacce/uacce.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_scsih.o
  CC      lib/iommu-helper.o
  CC [M]  drivers/misc/mei/mei-trace.o
  CC [M]  fs/lockd/xdr.o
  CC [M]  fs/nfs/io.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_pci.o
  CC [M]  fs/fuse/inode.o
  CC      drivers/mfd/da9052-i2c.o
  CC [M]  fs/autofs/dev-ioctl.o
  CC      arch/x86/kernel/amd_gart_64.o
  CC [M]  drivers/regulator/tps51632-regulator.o
  CC      drivers/acpi/acpica/dbexec.o
  CC      drivers/acpi/acpica/dbhistry.o
  CC      lib/fault-inject.o
  CC      drivers/acpi/acpica/dbinput.o
  CC [M]  fs/lockd/netlink.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.o
  CC      drivers/misc/sram.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_msg.o
  CC [M]  drivers/misc/ad525x_dpot.o
  CC      drivers/acpi/acpica/dbmethod.o
  CC      drivers/base/cacheinfo.o
  CC [M]  net/sctp/stream_sched_fc.o
  CC [M]  net/sunrpc/stats.o
  CC      mm/vmpressure.o
  CC [M]  drivers/scsi/aic7xxx/aic7xxx_reg_print.o
  CC [M]  drivers/scsi/isci/task.o
  CC [M]  net/sctp/stream_interleave.o
  CC      drivers/base/swnode.o
  CC [M]  fs/netfs/read_single.o
  CC      lib/error-inject.o
  CC [M]  drivers/nvme/host/fabrics.o
  CC      drivers/mfd/lp8788.o
  CC [M]  fs/overlayfs/util.o
  CC [M]  drivers/regulator/pcap-regulator.o
  CC      kernel/vhost_task.o
  CC      arch/x86/kernel/aperture_64.o
  CC [M]  fs/fuse/control.o
  CC [M]  fs/9p/vfs_super.o
  LD [M]  fs/autofs/autofs4.o
  CC      drivers/acpi/acpica/dbnames.o
  CC [M]  net/sctp/proc.o
  CC      drivers/scsi/scsi.o
  CC [M]  fs/fuse/xattr.o
  CC [M]  fs/smb/client/file.o
  CC [M]  fs/smb/client/inode.o
  CC [M]  fs/nfs/direct.o
  LD [M]  drivers/nvme/target/nvmet-fc.o
  LD [M]  drivers/nvme/target/nvmet-tcp.o
  CC [M]  drivers/scsi/libsas/sas_host_smp.o
  CC [M]  drivers/misc/mei/pci-me.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_transport.o
  CC [M]  drivers/misc/mei/hw-me.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_ctl.o
  CC [M]  net/netfilter/nft_rt.o
  CC      mm/swap_cgroup.o
  CC [M]  fs/lockd/clnt4xdr.o
  CC      drivers/mfd/lp8788-irq.o
  CC      net/ipv4/udp_bpf.o
  CC [M]  fs/cachefiles/cache.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_core.o
  CC      lib/syscall.o
  CC [M]  net/sctp/sysctl.o
  CC [M]  fs/cachefiles/daemon.o
  CC      drivers/acpi/acpica/dbobject.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_sg.o
  CC [M]  drivers/regulator/raa215300.o
  CC [M]  drivers/scsi/isci/probe_roms.o
  CC      kernel/kcmp.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_pci.o
  CC [M]  fs/9p/vfs_inode.o
  CC      lib/dynamic_debug.o
  CC [M]  fs/vboxsf/dir.o
  CC      lib/errname.o
  CC [M]  fs/cachefiles/interface.o
  CC      arch/x86/kernel/mmconf-fam10h_64.o
  CC [M]  net/sctp/ipv6.o
  CC [M]  fs/cachefiles/io.o
  CC [M]  fs/fuse/acl.o
  CC [M]  fs/netfs/rolling_buffer.o
  CC      arch/x86/kernel/vsmp_64.o
  CC      drivers/acpi/acpica/dbstats.o
  CC [M]  fs/nfs/pagelist.o
  CC      drivers/acpi/acpica/dbutils.o
  CC [M]  fs/cachefiles/key.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.o
  CC [M]  drivers/misc/ad525x_dpot-i2c.o
  CC      drivers/base/faux.o
  CC [M]  fs/overlayfs/inode.o
  CC      drivers/mfd/da9055-core.o
  CC      net/ipv4/cipso_ipv4.o
  CC      fs/btrfs/defrag.o
  CC [M]  net/netfilter/nft_exthdr.o
  CC [M]  fs/lockd/xdr4.o
  CC [M]  fs/lockd/svc4proc.o
  CC [M]  fs/netfs/write_collect.o
  CC [M]  drivers/regulator/rc5t583-regulator.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_tty.o
  CC [M]  fs/fuse/readdir.o
  CC      drivers/acpi/acpica/dbxface.o
  CC [M]  fs/smb/client/link.o
  CC [M]  drivers/scsi/aic7xxx/aic79xx_reg_print.o
  CC      net/ipv4/xfrm4_policy.o
  LD [M]  drivers/scsi/libsas/libsas.o
  CC [M]  fs/netfs/write_issue.o
  CC [M]  drivers/scsi/isci/remote_node_context.o
  CC      kernel/freezer.o
  CC [M]  fs/vboxsf/file.o
  CC [M]  fs/9p/vfs_inode_dotl.o
  CC      drivers/base/auxiliary.o
  CC [M]  arch/x86/kernel/msr.o
  CC [M]  fs/vboxsf/utils.o
  CC [M]  drivers/nvme/host/fc.o
  CC [M]  fs/lockd/procfs.o
  CC      drivers/base/devtmpfs.o
  CC [M]  net/sunrpc/sysctl.o
  CC [M]  fs/smb/client/misc.o
  CC [M]  fs/netfs/write_retry.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_trigger_diag.o
  CC      mm/hugetlb_cgroup.o
  CC      net/ipv4/xfrm4_state.o
  CC [M]  net/sctp/diag.o
  LD [M]  drivers/scsi/aic7xxx/aic7xxx.o
  CC [M]  drivers/misc/mei/gsc-me.o
  CC      drivers/acpi/resource.o
  CC [M]  fs/cachefiles/main.o
  CC [M]  drivers/regulator/rt4801-regulator.o
  CC      drivers/mfd/da9055-i2c.o
  LD [M]  drivers/misc/bcm-vk/bcm_vk.o
  CC      drivers/acpi/acpica/rsdump.o
  CC [M]  fs/overlayfs/file.o
  CC [M]  drivers/nvme/host/tcp.o
  CC [M]  fs/smb/client/netmisc.o
  CC      drivers/scsi/hosts.o
  CC [M]  fs/fuse/ioctl.o
  CC [M]  arch/x86/kernel/cpuid.o
  CC [M]  net/netfilter/nft_last.o
  CC [M]  fs/nfs/read.o
  CC [M]  fs/smb/client/smbencrypt.o
  LD [M]  drivers/nvme/host/nvme-fabrics.o
  CC [M]  drivers/scsi/isci/remote_node_table.o
  CC [M]  fs/vboxsf/vboxsf_wrappers.o
  LD [M]  fs/lockd/lockd.o
  CC [M]  drivers/scsi/isci/unsolicited_frame_control.o
  CC [M]  fs/cachefiles/namei.o
  CC [M]  fs/nfs/symlink.o
  CC      mm/memory-failure.o
  CC [M]  fs/9p/vfs_addr.o
  CC      drivers/acpi/acpi_processor.o
  CC      mm/kmemleak.o
  CC      drivers/base/isa.o
  CC [M]  drivers/misc/ad525x_dpot-spi.o
  AR      drivers/acpi/acpica/built-in.a
  AR      drivers/nvme/host/built-in.a
  CC      fs/btrfs/extent_map.o
  CC [M]  fs/vboxsf/super.o
  CC [M]  drivers/scsi/isci/port_config.o
  CC [M]  fs/netfs/stats.o
  CC      drivers/mfd/da9063-core.o
  CC [M]  drivers/misc/mei/pci-txe.o
  CC [M]  fs/cachefiles/security.o
  CC [M]  fs/fuse/iomode.o
  CC [M]  fs/overlayfs/dir.o
  CC      lib/nlattr.o
  CC      kernel/profile.o
  CC [M]  drivers/misc/dummy-irq.o
  CC [M]  fs/smb/client/transport.o
  CC [M]  drivers/regulator/rt4803.o
  CC [M]  fs/netfs/fscache_cache.o
  CC      drivers/scsi/scsi_ioctl.o
  AR      arch/x86/kernel/built-in.a
  CC      net/ipv4/xfrm4_input.o
  AR      arch/x86/built-in.a
  LD [M]  net/sctp/sctp.o
  CC      fs/open.o
  CC [M]  drivers/misc/ics932s401.o
  CC [M]  drivers/misc/tifm_core.o
  CC [M]  drivers/regulator/rt4831-regulator.o
  CC      fs/btrfs/sysfs.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_warpdrive.o
  CC      drivers/base/node.o
  LD [M]  net/sctp/sctp_diag.o
  CC [M]  fs/9p/vfs_file.o
  CC [M]  net/netfilter/nft_counter.o
  CC      net/ipv4/xfrm4_output.o
  CC [M]  fs/fuse/dax.o
  CC      kernel/stacktrace.o
  CC [M]  fs/fuse/passthrough.o
  LD [M]  net/sunrpc/sunrpc.o
  CC [M]  drivers/regulator/rt5033-regulator.o
  CC      lib/cpu_rmap.o
  CC      drivers/mfd/da9063-irq.o
  CC [M]  drivers/misc/mei/hw-txe.o
  CC      fs/btrfs/accessors.o
  CC [M]  fs/nfs/unlink.o
  CC [M]  fs/nfs/write.o
  CC      fs/read_write.o
  CC      kernel/dma.o
  LD [M]  fs/vboxsf/vboxsf.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_debugfs.o
  CC      drivers/acpi/processor_core.o
  CC      drivers/base/memory.o
  CC [M]  net/netfilter/nft_objref.o
  CC [M]  fs/cachefiles/volume.o
  LD [M]  drivers/scsi/isci/isci.o
  CC [M]  drivers/misc/tifm_7xx1.o
  CC      kernel/smp.o
  CC [M]  net/netfilter/nft_inner.o
  CC [M]  net/netfilter/nft_chain_route.o
  LD [M]  drivers/scsi/aic7xxx/aic79xx.o
  CC      net/ipv4/xfrm4_protocol.o
  CC [M]  fs/smb/client/cached_dir.o
  CC [M]  drivers/regulator/rt5120-regulator.o
  CC      net/ipv4/tcp_ao.o
  CC      kernel/uid16.o
  CC [M]  drivers/misc/phantom.o
  CC [M]  fs/nfs/namespace.o
  CC [M]  drivers/misc/bh1770glc.o
  CC      drivers/mfd/da9063-i2c.o
  CC [M]  fs/cachefiles/xattr.o
  CC [M]  fs/overlayfs/readdir.o
  CC [M]  fs/9p/vfs_dir.o
  CC      drivers/scsi/scsicam.o
  CC      drivers/base/module.o
  CC [M]  fs/cachefiles/error_inject.o
  CC [M]  fs/nfs/mount_clnt.o
  CC      drivers/acpi/processor_pdc.o
  CC      fs/file_table.o
  CC      drivers/base/auxiliary_sysfs.o
  LD [M]  drivers/scsi/mpt3sas/mpt3sas.o
  CC [M]  fs/netfs/fscache_cookie.o
  CC      lib/closure.o
  CC      fs/super.o
  CC [M]  fs/9p/vfs_dentry.o
  LD [M]  drivers/nvme/host/nvme-fc.o
  CC      fs/char_dev.o
  CC [M]  drivers/misc/mei/vsc-tp.o
  CC [M]  fs/nfs/nfstrace.o
  CC      fs/stat.o
  CC [M]  fs/overlayfs/copy_up.o
  LD [M]  drivers/nvme/host/nvme-tcp.o
  CC      drivers/base/hypervisor.o
  AR      drivers/nvme/built-in.a
  CC      fs/btrfs/xattr.o
  CC      net/ipv4/bpf_tcp_ca.o
  CC      fs/btrfs/ordered-data.o
  CC      mm/page_isolation.o
  CC [M]  net/netfilter/nf_tables_offload.o
  CC [M]  drivers/regulator/rt5190a-regulator.o
  CC [M]  net/ipv4/ip_tunnel.o
  CC      kernel/module_signature.o
  CC      drivers/mfd/max14577.o
  CC [M]  net/ipv4/ipip.o
  CC [M]  fs/smb/client/cifs_unicode.o
  CC      fs/exec.o
  CC      mm/zpool.o
  CC      drivers/base/soc.o
  CC      drivers/scsi/scsi_error.o
  CC [M]  fs/fuse/sysctl.o
  CC      kernel/kallsyms.o
  CC      drivers/mfd/max77693.o
  CC      drivers/acpi/ec.o
  CC      mm/zsmalloc.o
  CC      drivers/scsi/scsi_lib.o
  CC      kernel/acct.o
  CC      drivers/base/pinctrl.o
  CC      kernel/vmcore_info.o
  CC      lib/dynamic_queue_limits.o
  CC [M]  fs/9p/v9fs.o
  LD [M]  fs/cachefiles/cachefiles.o
  CC      lib/glob.o
  CC [M]  fs/netfs/fscache_io.o
  CC [M]  fs/overlayfs/export.o
  CC [M]  drivers/misc/mei/vsc-fw-loader.o
  CC [M]  fs/9p/fid.o
  CC [M]  drivers/misc/apds990x.o
  CC [M]  fs/9p/xattr.o
  CC [M]  fs/9p/cache.o
  CC [M]  net/netfilter/nft_set_hash.o
  CC [M]  fs/netfs/fscache_main.o
  CC      drivers/base/devcoredump.o
  CC [M]  fs/fuse/dev_uring.o
  CC [M]  drivers/regulator/rt5739.o
  CC      fs/btrfs/extent_io.o
  CC      drivers/mfd/max77843.o
  CC      drivers/mfd/max8925-core.o
  CC [M]  fs/9p/acl.o
  CC      lib/digsig.o
  CC [M]  net/netfilter/nft_set_bitmap.o
  CC [M]  fs/smb/client/nterr.o
  CC      drivers/base/platform-msi.o
  CC [M]  net/ipv4/fou_core.o
  CC [M]  net/netfilter/nft_set_rbtree.o
  CC [M]  drivers/misc/enclosure.o
  CC      drivers/acpi/dock.o
  CC [M]  fs/fuse/cuse.o
  CC      kernel/elfcorehdr.o
  CC [M]  drivers/regulator/rt5759-regulator.o
  CC      drivers/mfd/max8925-i2c.o
  CC      drivers/scsi/constants.o
  CC [M]  fs/overlayfs/params.o
  CC      kernel/crash_reserve.o
  CC      drivers/scsi/scsi_lib_dma.o
  CC [M]  fs/overlayfs/xattrs.o
  CC [M]  net/netfilter/nft_set_pipapo.o
  CC [M]  fs/nfs/export.o
  CC      drivers/acpi/pci_root.o
  CC [M]  fs/netfs/fscache_volume.o
  CC [M]  drivers/regulator/rt6160-regulator.o
  CC [M]  fs/smb/client/cifsencrypt.o
  CC [M]  drivers/misc/smpro-errmon.o
  CC      fs/btrfs/volumes.o
  CC      fs/pipe.o
  CC      drivers/scsi/scsi_scan.o
  CC [M]  fs/nfs/sysfs.o
  CC [M]  drivers/misc/mei/platform-vsc.o
  CC [M]  fs/smb/client/readdir.o
  CC      drivers/acpi/pci_link.o
  CC [M]  fs/smb/client/ioctl.o
  LD [M]  fs/9p/9p.o
  CC [M]  fs/nfs/fs_context.o
  CC [M]  net/netfilter/nft_set_pipapo_avx2.o
  CC [M]  net/ipv4/fou_nl.o
  CC      drivers/acpi/pci_irq.o
  CC      fs/namei.o
  GEN     drivers/scsi/scsi_devinfo_tbl.c
  CC      fs/fcntl.o
  CC      mm/early_ioremap.o
  CC      drivers/acpi/acpi_apd.o
  CC [M]  net/ipv4/fou_bpf.o
  CC [M]  fs/nfs/sysctl.o
  CC [M]  fs/fuse/virtio_fs.o
  CC      drivers/base/physical_location.o
  CC      drivers/scsi/scsi_devinfo.o
  CC [M]  net/netfilter/nft_ct_fast.o
  CC      drivers/scsi/scsi_netlink.o
  CC [M]  net/ipv4/gre_demux.o
  CC      lib/strncpy_from_user.o
  CC [M]  fs/nfs/fscache.o
  CC      kernel/kexec_core.o
  CC      drivers/mfd/max8997.o
  CC [M]  drivers/regulator/rt6190-regulator.o
  CC      drivers/scsi/scsi_sysctl.o
  CC      drivers/mfd/max8997-irq.o
  LD [M]  fs/overlayfs/overlay.o
  CC [M]  net/ipv4/ip_gre.o
  CC [M]  fs/smb/client/sess.o
  LD [M]  drivers/misc/mei/mei.o
  LD [M]  drivers/misc/mei/mei-me.o
  LD [M]  drivers/misc/mei/mei-gsc.o
  LD [M]  drivers/misc/mei/mei-txe.o
  CC      lib/strnlen_user.o
  LD [M]  drivers/misc/mei/mei-vsc-hw.o
  LD [M]  drivers/misc/mei/mei-vsc.o
  CC [M]  drivers/misc/smpro-misc.o
  CC      drivers/scsi/scsi_proc.o
  CC      lib/net_utils.o
  CC      drivers/base/trace.o
  CC [M]  drivers/regulator/rt6245-regulator.o
  CC      mm/numa.o
  CC [M]  net/netfilter/nft_compat.o
  CC [M]  fs/smb/client/export.o
  CC      fs/ioctl.o
  CC      mm/numa_memblks.o
  CC [M]  drivers/misc/hpilo.o
  CC      mm/balloon_compaction.o
  CC      mm/secretmem.o
  CC [M]  fs/netfs/fscache_proc.o
  CC      drivers/acpi/acpi_platform.o
  CC      fs/btrfs/async-thread.o
  CC      drivers/mfd/max8998.o
  CC      kernel/crash_core.o
  CC [M]  net/netfilter/nft_connlimit.o
  CC      fs/btrfs/ioctl.o
  CC      mm/userfaultfd.o
  CC [M]  fs/nfs/nfs2super.o
  CC [M]  drivers/regulator/rtmv20-regulator.o
  CC      drivers/acpi/acpi_pnp.o
  CC      drivers/scsi/scsi_debugfs.o
  CC      fs/readdir.o
  LD [M]  fs/fuse/fuse.o
  CC      fs/btrfs/locking.o
  CC      drivers/mfd/max8998-irq.o
  CC      drivers/acpi/power.o
  CC [M]  drivers/regulator/rtq2134-regulator.o
  CC      fs/select.o
  CC [M]  fs/smb/client/unc.o
  CC [M]  fs/netfs/fscache_stats.o
  CC [M]  drivers/misc/apds9802als.o
  CC      mm/page_idle.o
  CC [M]  fs/nfs/proc.o
  AR      drivers/base/built-in.a
  LD [M]  fs/fuse/virtiofs.o
  CC      mm/usercopy.o
  CC [M]  fs/nfs/nfs2xdr.o
  CC      fs/btrfs/orphan.o
  CC      fs/dcache.o
  CC      fs/btrfs/export.o
  CC      drivers/mfd/adp5520.o
  CC      lib/sg_pool.o
  CC [M]  net/netfilter/nft_numgen.o
  CC      drivers/acpi/event.o
  CC [M]  fs/nfs/nfs3super.o
  CC      kernel/kexec.o
  CC      fs/inode.o
  CC      fs/attr.o
  CC      fs/bad_inode.o
  CC      drivers/scsi/scsi_trace.o
  CC [M]  net/netfilter/nft_ct.o
  CC      fs/file.o
  CC [M]  net/ipv4/udp_tunnel_core.o
  CC      lib/memregion.o
  CC [M]  net/ipv4/udp_tunnel_nic.o
  CC [M]  net/ipv4/ip_vti.o
  CC [M]  drivers/misc/isl29003.o
  CC      drivers/mfd/tps6586x.o
  CC      fs/btrfs/tree-log.o
  CC [M]  drivers/regulator/rtq6752-regulator.o
  CC [M]  fs/smb/client/winucase.o
  CC [M]  drivers/regulator/rtq2208-regulator.o
  CC [M]  fs/nfs/nfs3client.o
  CC [M]  drivers/regulator/sky81452-regulator.o
  CC      drivers/mfd/tps65090.o
  CC      kernel/kexec_file.o
  CC      fs/filesystems.o
  CC [M]  drivers/regulator/slg51000-regulator.o
  CC      drivers/acpi/evged.o
  CC [M]  net/netfilter/nft_flow_offload.o
  CC      drivers/acpi/sysfs.o
  CC      drivers/acpi/property.o
  CC      lib/irq_poll.o
  CC [M]  fs/smb/client/smb2ops.o
  CC      drivers/acpi/debugfs.o
  CC      drivers/mfd/aat2870-core.o
  CC [M]  fs/nfs/nfs3proc.o
  CC      drivers/scsi/scsi_logging.o
  CC      kernel/compat.o
  CC      mm/memremap.o
  LD [M]  fs/netfs/netfs.o
  CC [M]  drivers/misc/isl29020.o
  CC      fs/btrfs/free-space-cache.o
  CC      mm/hmm.o
  CC [M]  drivers/misc/tsl2550.o
  CC [M]  fs/smb/client/smb2maperror.o
  CC      drivers/scsi/scsi_pm.o
  CC [M]  drivers/regulator/sy7636a-regulator.o
  CC [M]  fs/nfs/nfs3xdr.o
  CC      mm/memfd.o
  CC      kernel/utsname.o
  CC [M]  drivers/misc/ds1682.o
  CC [M]  fs/smb/client/smb2transport.o
  CC      kernel/user_namespace.o
  CC      drivers/scsi/scsi_dh.o
  CC [M]  drivers/regulator/tps6105x-regulator.o
  CC      fs/btrfs/zlib.o
  CC [M]  net/netfilter/nft_limit.o
  CC      fs/namespace.o
  CC [M]  net/netfilter/nft_nat.o
  CC      drivers/scsi/scsi_bsg.o
  CC [M]  drivers/misc/hmc6352.o
  CC      mm/ptdump.o
  CC [M]  fs/nfs/nfs3acl.o
  CC      lib/stackdepot.o
  CC      drivers/mfd/intel-lpss.o
  CC [M]  net/ipv4/ah4.o
  CC      drivers/acpi/acpi_lpat.o
  CC      lib/ref_tracker.o
  CC      mm/page_reporting.o
  CC      fs/seq_file.o
  CC      drivers/scsi/scsi_common.o
  CC      fs/btrfs/lzo.o
  CC [M]  fs/nfs/nfs4proc.o
  CC      kernel/pid_namespace.o
  CC      fs/btrfs/zstd.o
  UPD     kernel/config_data
  CC      fs/btrfs/compression.o
  CC [M]  fs/nfs/nfs4xdr.o
  CC      drivers/mfd/intel-lpss-pci.o
  CC      lib/bootconfig.o
  CC      mm/bootmem_info.o
  CC [M]  drivers/regulator/tps62360-regulator.o
  CC [M]  fs/smb/client/smb2misc.o
  CC      drivers/acpi/acpi_fpdt.o
  CC      fs/btrfs/delayed-ref.o
  CC [M]  drivers/regulator/tps65023-regulator.o
  CC      lib/asn1_decoder.o
  CC      kernel/stop_machine.o
  CC      fs/xattr.o
  CC [M]  drivers/misc/vmw_balloon.o
  CC      drivers/mfd/intel-lpss-acpi.o
  CC      drivers/mfd/palmas.o
  CC [M]  fs/smb/client/smb2pdu.o
  CC      drivers/mfd/rc5t583.o
  CC [M]  net/ipv4/esp4.o
  CC      fs/btrfs/relocation.o
  CC [M]  net/ipv4/esp4_offload.o
  CC [M]  fs/nfs/nfs4state.o
  CC [M]  drivers/misc/lattice-ecp3-config.o
  CC      kernel/audit.o
  CC      drivers/mfd/rc5t583-irq.o
  CC [M]  drivers/regulator/tps6507x-regulator.o
  CC      kernel/auditfilter.o
  CC [M]  net/netfilter/nft_queue.o
  CC      lib/asn1_encoder.o
  CC [M]  fs/smb/client/smb2inode.o
  CC      drivers/scsi/virtio_scsi.o
  CC      drivers/acpi/acpi_lpit.o
  CC [M]  drivers/regulator/tps65086-regulator.o
  CC      drivers/scsi/sd.o
  CC [M]  net/ipv4/ipcomp.o
  CC [M]  drivers/regulator/tps65090-regulator.o
  CC [M]  net/netfilter/nft_quota.o
  CC      drivers/acpi/acpi_watchdog.o
  CC      fs/libfs.o
  GEN     lib/oid_registry_data.c
  CC [M]  drivers/regulator/tps6524x-regulator.o
  CC      mm/execmem.o
  CC [M]  fs/nfs/nfs4renewd.o
  CC      drivers/mfd/syscon.o
  CC [M]  fs/nfs/nfs4super.o
  CC      drivers/acpi/prmt.o
  CC      mm/shmem_quota.o
  CC      fs/btrfs/delayed-inode.o
  CC [M]  fs/nfs/nfs4file.o
  CC      lib/ucs2_string.o
  CC      drivers/acpi/acpi_pcc.o
  CC      drivers/mfd/as3711.o
  CC [M]  net/netfilter/nft_reject.o
  CC      drivers/mfd/intel_soc_pmic_crc.o
  CC      drivers/acpi/acpi_ffh.o
  CC      drivers/scsi/sd_dif.o
  CC [M]  fs/nfs/delegation.o
  CC [M]  drivers/misc/dw-xdata-pcie.o
  CC      drivers/mfd/intel_soc_pmic_chtwc.o
  CC [M]  fs/nfs/nfs4idmap.o
  CC [M]  drivers/misc/xilinx_sdfec.o
  CC [M]  drivers/mfd/88pm800.o
  CC [M]  drivers/misc/tps6594-esm.o
  CC      lib/ubsan.o
  CC      lib/sbitmap.o
  CC [M]  drivers/misc/tps6594-pfsm.o
  CC      fs/fs-writeback.o
  CC      fs/pnode.o
  CC      drivers/scsi/sd_zbc.o
  CC [M]  drivers/regulator/tps6586x-regulator.o
  CC [M]  drivers/misc/nsm.o
  CC      lib/group_cpus.o
  CC      fs/splice.o
  CC      kernel/auditsc.o
  CC      drivers/acpi/acpi_adxl.o
  CC      fs/btrfs/scrub.o
  CC [M]  net/ipv4/xfrm4_tunnel.o
  CC      mm/pt_reclaim.o
  CC      fs/sync.o
  CC [M]  drivers/mfd/88pm80x.o
  CC [M]  mm/hwpoison-inject.o
  CC [M]  drivers/mfd/88pm805.o
  CC [M]  fs/nfs/callback.o
  CC      lib/fw_table.o
  CC [M]  drivers/regulator/tps65910-regulator.o
  CC [M]  fs/nfs/callback_xdr.o
  CC      fs/btrfs/backref.o
  CC [M]  lib/crc7.o
  CC [M]  drivers/regulator/tps65912-regulator.o
  CC [M]  fs/smb/client/smb2file.o
  CC      fs/btrfs/ulist.o
  CC [M]  fs/nfs/callback_proc.o
  CC      fs/btrfs/qgroup.o
  CC      fs/utimes.o
  CC [M]  drivers/mfd/sm501.o
  CC [M]  net/ipv4/tunnel4.o
  CC      fs/btrfs/send.o
  CC      kernel/audit_watch.o
  CC      drivers/scsi/sr.o
  CC [M]  drivers/mfd/bcm590xx.o
  CC      fs/d_path.o
  AR      drivers/misc/built-in.a
  CC      fs/btrfs/dev-replace.o
  CC [M]  lib/crc8.o
  CC [M]  net/netfilter/nft_reject_inet.o
  AR      mm/built-in.a
  CC [M]  lib/bch.o
  CC [M]  lib/ts_kmp.o
  CC [M]  lib/ts_bm.o
  CC [M]  fs/smb/client/cifsacl.o
  CC      drivers/acpi/ac.o
  CC [M]  drivers/mfd/bd9571mwv.o
  CC      fs/stack.o
  CC [M]  lib/ts_fsm.o
  CC [M]  net/netfilter/nft_reject_netdev.o
  CC      drivers/acpi/button.o
  CC      fs/fs_struct.o
  CC [M]  fs/smb/client/fs_context.o
  CC      drivers/acpi/fan_core.o
  CC [M]  drivers/regulator/tps65132-regulator.o
  CC [M]  drivers/mfd/cros_ec_dev.o
  CC [M]  fs/smb/client/dns_resolve.o
  CC      drivers/acpi/fan_attr.o
  CC      kernel/audit_fsnotify.o
  CC [M]  drivers/regulator/tps68470-regulator.o
  CC [M]  net/ipv4/inet_diag.o
  CC      drivers/scsi/sr_ioctl.o
  CC [M]  net/netfilter/nft_tunnel.o
  CC [M]  drivers/mfd/cs42l43.o
  CC [M]  drivers/regulator/twl-regulator.o
  CC      drivers/scsi/sr_vendor.o
  CC      fs/statfs.o
  CC      drivers/scsi/sg.o
  CC      drivers/acpi/fan_hwmon.o
  ASN.1   fs/smb/client/cifs_spnego_negtokeninit.asn1.[ch]
  CC      fs/btrfs/raid56.o
  CC [M]  drivers/scsi/raid_class.o
  CC [M]  net/ipv4/tcp_diag.o
  CC      fs/fs_pin.o
  CC [M]  net/netfilter/nft_log.o
  CC [M]  drivers/scsi/scsi_transport_spi.o
  CC [M]  drivers/regulator/twl6030-regulator.o
  CC [M]  fs/smb/client/namespace.o
  CC [M]  fs/smb/client/reparse.o
  CC [M]  drivers/scsi/scsi_transport_fc.o
  CC [M]  net/ipv4/udp_diag.o
  CC [M]  drivers/mfd/cs42l43-i2c.o
  CC [M]  fs/smb/client/xattr.o
  CC      fs/btrfs/uuid-tree.o
  CC [M]  net/ipv4/raw_diag.o
  CC      fs/btrfs/props.o
  CC [M]  drivers/regulator/wm831x-dcdc.o
  CC      fs/nsfs.o
  CC      kernel/audit_tree.o
  CC [M]  fs/smb/client/cifs_spnego.o
  CC      drivers/acpi/pci_slot.o
  CC      drivers/acpi/processor_driver.o
  CC [M]  drivers/scsi/scsi_transport_iscsi.o
  CC [M]  net/netfilter/nft_masq.o
  CC      kernel/kprobes.o
  CC [M]  drivers/scsi/scsi_transport_sas.o
  CC [M]  fs/smb/client/dfs_cache.o
  CC [M]  drivers/scsi/scsi_transport_srp.o
  CC [M]  lib/notifier-error-inject.o
  CC      kernel/fail_function.o
  CC [M]  net/netfilter/nft_redir.o
  CC      drivers/acpi/processor_thermal.o
  CC [M]  fs/nfs/nfs4namespace.o
  CC      fs/btrfs/free-space-tree.o
  CC [M]  fs/nfs/nfs4getroot.o
  CC [M]  net/netfilter/nft_hash.o
  CC      kernel/hung_task.o
  CC      fs/btrfs/tree-checker.o
  CC [M]  drivers/mfd/lp873x.o
  CC [M]  drivers/scsi/iscsi_boot_sysfs.o
  CC      kernel/watchdog.o
  CC      fs/fs_types.o
  CC [M]  lib/pm-notifier-error-inject.o
  CC [M]  fs/nfs/nfs4client.o
  CC [M]  drivers/regulator/wm831x-isink.o
  CC [M]  fs/smb/client/dfs.o
  CC [M]  drivers/scsi/megaraid.o
  CC [M]  fs/nfs/nfs4session.o
  CC      fs/btrfs/space-info.o
  CC [M]  fs/smb/client/netlink.o
  CC [M]  drivers/mfd/tqmx86.o
  CC [M]  drivers/scsi/vmw_pvscsi.o
  CC [M]  fs/smb/client/cifs_swn.o
  CC      kernel/watchdog_perf.o
  CC [M]  fs/nfs/dns_resolve.o
  CC      drivers/acpi/processor_idle.o
  CC [M]  lib/memory-notifier-error-inject.o
  CC      drivers/acpi/processor_throttling.o
  CC [M]  drivers/regulator/wm831x-ldo.o
  CC [M]  net/netfilter/nft_fib.o
  CC      drivers/acpi/processor_perflib.o
  CC [M]  fs/smb/client/fscache.o
  CC      fs/fs_context.o
  CC [M]  fs/nfs/nfs4trace.o
  CC [M]  drivers/scsi/xen-scsifront.o
  CC [M]  fs/nfs/nfs4sysctl.o
  CC      fs/btrfs/block-rsv.o
  CC [M]  drivers/regulator/wm8350-regulator.o
  CC [M]  drivers/scsi/storvsc_drv.o
  CC [M]  drivers/scsi/ses.o
  CC [M]  lib/lru_cache.o
  CC [M]  net/netfilter/nft_fib_inet.o
  CC      drivers/acpi/container.o
  CC [M]  drivers/scsi/scsi_debug.o
  CC      fs/fs_parser.o
  CC [M]  drivers/mfd/arizona-core.o
  CC [M]  drivers/regulator/wm8400-regulator.o
  LD [M]  net/ipv4/fou.o
  CC      kernel/seccomp.o
  CC      fs/fsopen.o
  LD [M]  net/ipv4/gre.o
  LD [M]  net/ipv4/udp_tunnel.o
  AR      net/ipv4/built-in.a
  CC [M]  drivers/mfd/arizona-irq.o
  CC [M]  fs/nfs/pnfs.o
  CC [M]  drivers/mfd/wm5102-tables.o
  CC      fs/init.o
  CC [M]  fs/smb/client/smb1ops.o
  CC [M]  drivers/regulator/wm8994-regulator.o
  CC      fs/btrfs/delalloc-space.o
  CC      kernel/relay.o
  CC [M]  fs/nfs/pnfs_dev.o
  CC      fs/btrfs/block-group.o
  CC      fs/kernel_read_file.o
  CC [M]  fs/nfs/pnfs_nfs.o
  CC [M]  fs/smb/client/cifssmb.o
  CC      kernel/utsname_sysctl.o
  CC      fs/mnt_idmapping.o
  CC [M]  fs/nfs/nfs42proc.o
  CC      fs/btrfs/discard.o
  CC [M]  fs/smb/client/cifs_spnego_negtokeninit.asn1.o
  CC [M]  fs/nfs/nfs42xattr.o
  CC [M]  fs/smb/client/asn1.o
  CC [M]  net/netfilter/nft_fib_netdev.o
  CC [M]  net/netfilter/nft_socket.o
  CC [M]  drivers/mfd/wm5110-tables.o
  CC      fs/btrfs/reflink.o
  LD [M]  fs/nfs/nfsv2.o
  LD [M]  fs/nfs/nfs.o
  CC [M]  net/netfilter/nft_osf.o
  LD [M]  fs/nfs/nfsv3.o
  CC      drivers/acpi/thermal_lib.o
  CC      fs/btrfs/subpage.o
  CC [M]  net/netfilter/nft_tproxy.o
  CC      kernel/delayacct.o
  CC [M]  drivers/mfd/wm8997-tables.o
  CC      fs/remap_range.o
  CC      kernel/taskstats.o
  CC [M]  drivers/mfd/wm8998-tables.o
  AR      lib/lib.a
  CC      kernel/tsacct.o
  CC      drivers/acpi/thermal.o
  GEN     lib/crc32table.h
  GEN     lib/crc64table.h
  CC      lib/oid_registry.o
  CC [M]  drivers/mfd/cs47l24-tables.o
  CC [M]  drivers/mfd/arizona-i2c.o
  CC      kernel/tracepoint.o
  CC      fs/btrfs/tree-mod-log.o
  CC      kernel/latencytop.o
  CC      kernel/irq_work.o
  CC [M]  net/netfilter/nft_xfrm.o
  CC      kernel/static_call.o
  CC      fs/pidfs.o
  CC      fs/btrfs/extent-io-tree.o
  CC [M]  drivers/mfd/arizona-spi.o
  CC      drivers/acpi/nhlt.o
  CC      drivers/acpi/acpi_memhotplug.o
  CC [M]  drivers/mfd/wcd934x.o
  CC [M]  net/netfilter/nft_synproxy.o
  CC      drivers/acpi/ioapic.o
  CC      fs/btrfs/fs.o
  CC      fs/btrfs/messages.o
  CC      kernel/static_call_inline.o
  CC [M]  net/netfilter/nft_chain_nat.o
  CC      drivers/acpi/battery.o
  CC [M]  net/netfilter/nft_dup_netdev.o
  AR      drivers/regulator/built-in.a
  CC [M]  drivers/mfd/wm8994-core.o
  CC      kernel/user-return-notifier.o
  CC      kernel/padata.o
  CC [M]  net/netfilter/nft_fwd_netdev.o
  CC      fs/buffer.o
  CC [M]  drivers/mfd/wm8994-irq.o
  CC      fs/mpage.o
  CC      lib/crc32.o
  CC      fs/proc_namespace.o
  CC      kernel/jump_label.o
  CC      lib/crc64.o
  CC      fs/direct-io.o
  CC      fs/eventpoll.o
  CC      drivers/acpi/hed.o
  CC      fs/anon_inodes.o
  CC [M]  net/netfilter/nf_flow_table_core.o
  CC      kernel/context_tracking.o
  CC [M]  drivers/mfd/wm8994-regmap.o
  CC [M]  drivers/mfd/madera-core.o
  CC      drivers/acpi/bgrt.o
  CC      fs/btrfs/bio.o
  CC      fs/signalfd.o
  CC [M]  net/netfilter/nf_flow_table_ip.o
  CC      fs/timerfd.o
  CC      fs/eventfd.o
  CC [M]  net/netfilter/nf_flow_table_offload.o
  CC      drivers/acpi/cppc_acpi.o
  LD [M]  drivers/scsi/hv_storvsc.o
  CC [M]  drivers/mfd/cs47l15-tables.o
  CC [M]  net/netfilter/nf_flow_table_xdp.o
  CC      drivers/acpi/spcr.o
  CC      drivers/scsi/scsi_sysfs.o
  CC [M]  drivers/mfd/cs47l35-tables.o
  CC      fs/userfaultfd.o
  CC      fs/aio.o
  CC      fs/btrfs/lru_cache.o
  CC [M]  drivers/mfd/cs47l85-tables.o
  CC [M]  net/netfilter/nf_flow_table_inet.o
  CC      drivers/acpi/acpi_dbg.o
  CC [M]  drivers/mfd/cs47l90-tables.o
  CC      fs/btrfs/raid-stripe-tree.o
  CC [M]  drivers/mfd/cs47l92-tables.o
  CC      kernel/iomem.o
  CC      kernel/rseq.o
  CC      fs/dax.o
  CC [M]  net/netfilter/x_tables.o
  CC      fs/btrfs/fiemap.o
  CC      fs/locks.o
  AR      lib/built-in.a
  CC [M]  drivers/mfd/madera-i2c.o
  CC      drivers/acpi/viot.o
  CC      fs/binfmt_script.o
  CC      kernel/watch_queue.o
  CC      fs/btrfs/direct-io.o
  CC [M]  drivers/acpi/acpi_ipmi.o
  CC      fs/binfmt_elf.o
  CC [M]  net/netfilter/xt_tcpudp.o
  CC      fs/btrfs/acl.o
  CC [M]  drivers/mfd/madera-spi.o
  CC      fs/btrfs/zoned.o
  CC      fs/compat_binfmt_elf.o
  CC      fs/backing-file.o
  CC      fs/btrfs/verity.o
  CHK     kernel/kheaders_data.tar.xz
  CC [M]  drivers/mfd/cs40l50-core.o
  CC [M]  drivers/mfd/cs40l50-i2c.o
  CC [M]  net/netfilter/xt_mark.o
  CC [M]  drivers/acpi/acpi_video.o
  GEN     kernel/kheaders_data.tar.xz
  CC [M]  drivers/acpi/video_detect.o
  CC [M]  net/netfilter/xt_connmark.o
  CC [M]  net/netfilter/xt_nat.o
  CC [M]  drivers/mfd/cs40l50-spi.o
  CC [M]  drivers/mfd/tps6105x.o
  CC [M]  drivers/mfd/tps65010.o
  CC [M]  net/netfilter/xt_AUDIT.o
  CC      fs/mbcache.o
  CC [M]  drivers/mfd/tps6507x.o
  CC [M]  drivers/acpi/acpi_tad.o
  CC [M]  drivers/mfd/tps65086.o
  GZIP    kernel/config_data.gz
  CC      fs/posix_acl.o
  CC [M]  net/netfilter/xt_CHECKSUM.o
  LD [M]  fs/smb/client/cifs.o
  CC [M]  drivers/mfd/tps6594-core.o
  CC [M]  drivers/acpi/platform_profile.o
  CC      kernel/configs.o
  CC [M]  drivers/mfd/tps6594-i2c.o
  CC [M]  drivers/acpi/sbshc.o
  CC      fs/coredump.o
  CC [M]  net/netfilter/xt_CLASSIFY.o
  CC [M]  drivers/mfd/tps6594-spi.o
  CC      fs/drop_caches.o
  CC [M]  drivers/acpi/sbs.o
  CC      fs/sysctls.o
  AR      drivers/scsi/built-in.a
  CC      fs/fhandle.o
  CC      fs/bpf_fs_kfuncs.o
  CC [M]  drivers/acpi/ec_sys.o
  CC [M]  net/netfilter/xt_CONNSECMARK.o
  CC [M]  fs/binfmt_misc.o
  CC [M]  drivers/acpi/pfr_update.o
  CC [M]  drivers/mfd/mc13xxx-core.o
  CC [M]  net/netfilter/xt_CT.o
  CC [M]  drivers/acpi/pfr_telemetry.o
  CC [M]  drivers/mfd/mc13xxx-spi.o
  CC [M]  drivers/mfd/mc13xxx-i2c.o
  CC [M]  net/netfilter/xt_DSCP.o
  CC [M]  drivers/acpi/acpi_pad.o
  CC [M]  drivers/mfd/ocelot-core.o
  CC [M]  net/netfilter/xt_HL.o
  CC [M]  drivers/acpi/acpi_extlog.o
  AR      kernel/built-in.a
  CC [M]  drivers/acpi/acpi_configfs.o
  CC [M]  net/netfilter/xt_HMARK.o
  CC [M]  net/netfilter/xt_LED.o
  CC [M]  drivers/mfd/ocelot-spi.o
  CC [M]  net/netfilter/xt_LOG.o
  CC [M]  drivers/mfd/axp20x.o
  CC [M]  net/netfilter/xt_NETMAP.o
  CC [M]  net/netfilter/xt_NFLOG.o
  CC [M]  drivers/mfd/axp20x-i2c.o
  CC [M]  net/netfilter/xt_NFQUEUE.o
  CC [M]  drivers/mfd/lp3943.o
  CC [M]  net/netfilter/xt_RATEEST.o
  CC [M]  drivers/mfd/ti-lmu.o
  CC [M]  drivers/mfd/da9062-core.o
  CC [M]  net/netfilter/xt_REDIRECT.o
  CC [M]  net/netfilter/xt_MASQUERADE.o
  AR      drivers/acpi/built-in.a
  CC [M]  drivers/mfd/da9150-core.o
  CC [M]  net/netfilter/xt_SECMARK.o
  CC [M]  drivers/mfd/max77541.o
  CC [M]  net/netfilter/xt_TPROXY.o
  CC [M]  drivers/mfd/max8907.o
  CC [M]  net/netfilter/xt_TCPMSS.o
  CC [M]  drivers/mfd/mp2629.o
  CC [M]  net/netfilter/xt_TCPOPTSTRIP.o
  CC [M]  drivers/mfd/mt6360-core.o
  CC [M]  net/netfilter/xt_TEE.o
  CC [M]  drivers/mfd/mt6370.o
  CC [M]  net/netfilter/xt_TRACE.o
  CC [M]  net/netfilter/xt_IDLETIMER.o
  CC [M]  drivers/mfd/mt6397-core.o
  CC [M]  net/netfilter/xt_addrtype.o
  AR      fs/btrfs/built-in.a
  CC [M]  drivers/mfd/mt6397-irq.o
  CC [M]  net/netfilter/xt_bpf.o
  LD [M]  drivers/acpi/video.o
  CC [M]  net/netfilter/xt_cluster.o
  CC [M]  drivers/mfd/mt6358-irq.o
  CC [M]  net/netfilter/xt_comment.o
  CC [M]  drivers/mfd/kempld-core.o
  CC [M]  net/netfilter/xt_connbytes.o
  CC [M]  net/netfilter/xt_connlabel.o
  CC [M]  drivers/mfd/intel_quark_i2c_gpio.o
  LD [M]  fs/nfs/nfsv4.o
  CC [M]  drivers/mfd/lpc_sch.o
  CC [M]  net/netfilter/xt_connlimit.o
  CC [M]  drivers/mfd/lpc_ich.o
  CC [M]  drivers/mfd/rdc321x-southbridge.o
  CC [M]  net/netfilter/xt_conntrack.o
  CC [M]  net/netfilter/xt_cpu.o
  CC [M]  drivers/mfd/janz-cmodio.o
  CC [M]  drivers/mfd/vx855.o
  CC [M]  net/netfilter/xt_dccp.o
  CC [M]  drivers/mfd/wl1273-core.o
  CC [M]  net/netfilter/xt_devgroup.o
  CC [M]  drivers/mfd/si476x-cmd.o
  CC [M]  net/netfilter/xt_dscp.o
  CC [M]  net/netfilter/xt_ecn.o
  CC [M]  drivers/mfd/si476x-prop.o
  CC [M]  drivers/mfd/si476x-i2c.o
  AR      fs/built-in.a
  CC [M]  net/netfilter/xt_esp.o
  CC [M]  net/netfilter/xt_hashlimit.o
  CC [M]  net/netfilter/xt_helper.o
  CC [M]  drivers/mfd/intel_pmc_bxt.o
  CC [M]  net/netfilter/xt_hl.o
  CC [M]  drivers/mfd/viperboard.o
  CC [M]  net/netfilter/xt_ipcomp.o
  CC [M]  drivers/mfd/lm3533-core.o
  CC [M]  net/netfilter/xt_iprange.o
  CC [M]  net/netfilter/xt_l2tp.o
  CC [M]  drivers/mfd/lm3533-ctrlbank.o
  CC [M]  drivers/mfd/retu-mfd.o
  CC [M]  net/netfilter/xt_length.o
  CC [M]  drivers/mfd/iqs62x.o
  CC [M]  drivers/mfd/menf21bmc.o
  CC [M]  net/netfilter/xt_limit.o
  CC [M]  drivers/mfd/dln2.o
  CC [M]  net/netfilter/xt_mac.o
  CC [M]  drivers/mfd/rt4831.o
  CC [M]  net/netfilter/xt_multiport.o
  CC [M]  drivers/mfd/rt5033.o
  CC [M]  drivers/mfd/rt5120.o
  CC [M]  net/netfilter/xt_nfacct.o
  CC [M]  net/netfilter/xt_osf.o
  CC [M]  drivers/mfd/sky81452.o
  CC [M]  drivers/mfd/intel_soc_pmic_bxtwc.o
  CC [M]  drivers/mfd/intel_soc_pmic_chtdc_ti.o
  CC [M]  net/netfilter/xt_owner.o
  CC [M]  net/netfilter/xt_cgroup.o
  CC [M]  drivers/mfd/intel_soc_pmic_mrfld.o
  CC [M]  drivers/mfd/rave-sp.o
  CC [M]  net/netfilter/xt_physdev.o
  CC [M]  net/netfilter/xt_pkttype.o
  CC [M]  drivers/mfd/simple-mfd-i2c.o
  CC [M]  net/netfilter/xt_policy.o
  CC [M]  drivers/mfd/smpro-core.o
  CC [M]  net/netfilter/xt_quota.o
  CC [M]  net/netfilter/xt_rateest.o
  CC [M]  drivers/mfd/intel-m10-bmc-core.o
  CC [M]  net/netfilter/xt_realm.o
  CC [M]  drivers/mfd/intel-m10-bmc-spi.o
  CC [M]  drivers/mfd/atc260x-core.o
  CC [M]  net/netfilter/xt_recent.o
  CC [M]  drivers/mfd/atc260x-i2c.o
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
  AR      drivers/mfd/built-in.a
  LD [M]  net/netfilter/nf_conntrack.o
  LD [M]  net/netfilter/nf_conntrack_h323.o
  LD [M]  net/netfilter/nf_nat.o
  LD [M]  net/netfilter/nf_tables.o
  LD [M]  net/netfilter/nf_flow_table.o
  AR      net/netfilter/built-in.a
  LD [M]  drivers/mfd/si476x-core.o
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


