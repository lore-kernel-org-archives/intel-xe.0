Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849D0C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 11:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDFC10E58C;
	Wed, 28 May 2025 11:45:16 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C5010E57E;
 Wed, 28 May 2025 11:45:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EBuild=3A_failure_for_drm/xe/sched=3A_stop_re-submit?=
 =?utf-8?q?ting_signalled_jobs_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 11:45:15 -0000
Message-ID: <174843271532.27669.3568138050865760325@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250528113328.289392-2-matthew.auld@intel.com>
In-Reply-To: <20250528113328.289392-2-matthew.auld@intel.com>
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

Series: drm/xe/sched: stop re-submitting signalled jobs (rev3)
URL   : https://patchwork.freedesktop.org/series/149426/
State : failure

== Summary ==

CC      kernel/debug/kdb/kdb_io.o
  TEST    lib/test_fortify/read_overflow-memchr.log
  CC      drivers/pci/hotplug/acpiphp_core.o
  CC [M]  drivers/leds/leds-max8997.o
  CC      drivers/video/fbdev/core/fbcon.o
  CC      mm/vma.o
  CC [M]  crypto/sm3_generic.o
  CC      kernel/time/tick-sched.o
  CC [M]  drivers/gpio/gpio-tps65086.o
  TEST    lib/test_fortify/read_overflow-memchr_inv.log
  CC [M]  drivers/char/ipmi/ipmi_smic_sm.o
  TEST    lib/test_fortify/read_overflow-memcmp.log
  CC [M]  drivers/video/backlight/apple_bl.o
  CC      security/integrity/digsig.o
  CC      lib/argv_split.o
  CC [M]  sound/soc/codecs/es8311.o
  CC [M]  net/netfilter/nf_conntrack_proto_icmpv6.o
  CC [M]  crypto/streebog_generic.o
  TEST    lib/test_fortify/read_overflow-memscan.log
  CC      net/core/page_pool_user.o
  CC [M]  drivers/leds/leds-mc13783.o
  CC [M]  net/packet/diag.o
  CC [M]  net/ipv6/netfilter/ip6t_ah.o
  CC [M]  drivers/gpio/gpio-tps65912.o
  CC      net/ipv4/ip_forward.o
  TEST    lib/test_fortify/read_overflow2-memcmp.log
  CC [M]  drivers/char/ipmi/ipmi_bt_sm.o
  CC      arch/x86/kernel/idt.o
  CC      drivers/pci/hotplug/acpiphp_glue.o
  CC      net/devlink/core.o
  CC      kernel/debug/kdb/kdb_main.o
  CC      drivers/acpi/acpica/dsargs.o
  CC      fs/ext4/inode.o
  TEST    lib/test_fortify/read_overflow2-memcpy.log
  CC [M]  crypto/wp512.o
  CC [M]  drivers/video/backlight/as3711_bl.o
  CC      security/integrity/digsig_asymmetric.o
  CC [M]  drivers/leds/leds-menf21bmc.o
  CC [M]  drivers/gpio/gpio-tps68470.o
  CC      drivers/acpi/numa/srat.o
  TEST    lib/test_fortify/read_overflow2-memmove.log
  CC [M]  block/bfq-cgroup.o
  CC      drivers/acpi/acpica/dscontrol.o
  CC      mm/process_vm_access.o
  AR      net/packet/built-in.a
  LD [M]  net/packet/af_packet_diag.o
  CC [M]  drivers/leds/leds-mlxcpld.o
  CC [M]  net/netfilter/nf_conntrack_timeout.o
  CC [M]  drivers/char/ipmi/ipmi_si_hotmod.o
  TEST    lib/test_fortify/read_overflow2_field-memcpy.log
  CC      arch/x86/kernel/irq.o
  CC [M]  sound/soc/codecs/hda.o
  CC [M]  drivers/gpio/gpio-tqmx86.o
  CC [M]  net/ipv6/netfilter/ip6t_eui64.o
  CC [M]  crypto/pcbc.o
  CC      security/integrity/platform_certs/platform_keyring.o
  CC [M]  drivers/pci/hotplug/cpcihp_zt5550.o
  TEST    lib/test_fortify/read_overflow2_field-memmove.log
  CC [M]  drivers/video/backlight/bd6107.o
  CC      drivers/acpi/acpica/dsdebug.o
  CC      net/ipv4/ip_options.o
  CC      net/core/net-procfs.o
  AR      net/dsa/built-in.a
  CC [M]  arch/x86/kvm/../../../virt/kvm/kvm_main.o
  CC      kernel/cgroup/namespace.o
  CC [M]  drivers/leds/leds-mlxreg.o
  TEST    lib/test_fortify/write_overflow-memcpy.log
  CC      kernel/time/timer_migration.o
  CC      drivers/video/fbdev/core/bitblit.o
  CC [M]  drivers/char/ipmi/ipmi_si_hardcode.o
  CC      drivers/acpi/acpica/dsfield.o
  LD [M]  block/bfq.o
  CC      mm/mseal.o
  AR      block/built-in.a
  CC      kernel/time/vsyscall.o
  CC      drivers/acpi/numa/hmat.o
  CC [M]  crypto/lrw.o
  CC [M]  drivers/gpio/gpio-twl4030.o
  TEST    lib/test_fortify/write_overflow-memmove.log
  CC [M]  drivers/pci/hotplug/cpcihp_generic.o
  CC      security/integrity/platform_certs/machine_keyring.o
  CC [M]  drivers/video/backlight/da903x_bl.o
  CC      drivers/acpi/acpica/dsinit.o
  TEST    lib/test_fortify/write_overflow-memset.log
  CC [M]  drivers/video/fbdev/nvidia/nvidia.o
  CC      kernel/debug/kdb/kdb_support.o
  CC [M]  drivers/char/ipmi/ipmi_si_platform.o
  CC [M]  drivers/leds/leds-mt6323.o
  CC [M]  net/ipv6/netfilter/ip6t_frag.o
  CC      net/core/netpoll.o
  CC      drivers/video/fbdev/core/softcursor.o
  CC [M]  sound/soc/codecs/hda-dai.o
  TEST    lib/test_fortify/write_overflow-strcpy-lit.log
  CC [M]  drivers/gpio/gpio-twl6040.o
  CC      mm/page_alloc.o
  CC      drivers/acpi/acpica/dsmethod.o
  CC [M]  drivers/pci/hotplug/acpiphp_ibm.o
  CC [M]  net/netfilter/nf_conntrack_timestamp.o
  CC [M]  crypto/xctr.o
  CC      security/integrity/platform_certs/efi_parser.o
  CC      kernel/cgroup/cgroup-v1.o
  CC [M]  drivers/video/backlight/da9052_bl.o
  CC [M]  drivers/leds/leds-nic78bx.o
  CC [M]  drivers/char/ipmi/ipmi_si_mem_io.o
  TEST    lib/test_fortify/write_overflow-strcpy.log
  CC      drivers/acpi/acpica/dsmthdat.o
  AR      drivers/acpi/numa/built-in.a
  TEST    lib/test_fortify/write_overflow-strncpy-src.log
  CC      net/devlink/netlink.o
  CC [M]  crypto/hctr2.o
  CC      net/ipv4/ip_output.o
  CC [M]  drivers/gpio/gpio-viperboard.o
  CC      drivers/video/fbdev/core/tileblit.o
  CC [M]  drivers/video/fbdev/nvidia/nv_hw.o
  CC      mm/shuffle.o
  AR      drivers/pci/hotplug/built-in.a
  CC      drivers/pci/controller/dwc/pcie-designware.o
  CC      kernel/time/timekeeping_debug.o
  CC      kernel/debug/kdb/kdb_bt.o
  TEST    lib/test_fortify/write_overflow-strncpy.log
  CC [M]  drivers/leds/leds-pca9532.o
  CC      arch/x86/kernel/irq_64.o
  CC [M]  drivers/video/backlight/gpio_backlight.o
  CC      drivers/acpi/acpica/dsobject.o
  CC [M]  sound/soc/codecs/hdmi-codec.o
  CC [M]  net/netfilter/nf_conntrack_ecache.o
  CC [M]  net/ipv6/netfilter/ip6t_ipv6header.o
  CC [M]  drivers/char/ipmi/ipmi_si_port_io.o
  CC      fs/ext4/ioctl.o
  CC      security/integrity/platform_certs/load_uefi.o
  TEST    lib/test_fortify/write_overflow-strscpy.log
  CC [M]  drivers/gpio/gpio-virtuser.o
  CC [M]  crypto/adiantum.o
  CC      drivers/acpi/acpica/dsopcode.o
  CC      drivers/video/fbdev/core/fbcon_rotate.o
  TEST    lib/test_fortify/write_overflow_field-memcpy.log
  CC      arch/x86/kernel/dumpstack_64.o
  GENKDB  kernel/debug/kdb/gen-kdb_cmds.c
  CC      kernel/debug/kdb/kdb_bp.o
  CC      mm/page_frag_cache.o
  CC [M]  drivers/char/ipmi/ipmi_si_pci.o
  CC [M]  drivers/video/backlight/ktd253-backlight.o
  CC      kernel/time/namespace.o
  CC [M]  drivers/leds/leds-pca955x.o
  CC [M]  drivers/video/fbdev/nvidia/nv_setup.o
  TEST    lib/test_fortify/write_overflow_field-memmove.log
  CC      kernel/cgroup/freezer.o
  CC      drivers/acpi/acpica/dspkginit.o
  CC [M]  sound/soc/codecs/pcm6240.o
  CC      net/devlink/netlink_gen.o
  CC      security/integrity/platform_certs/keyring_handler.o
  CC [M]  crypto/nhpoly1305.o
  CC      arch/x86/kernel/time.o
  CC      net/core/fib_rules.o
  TEST    lib/test_fortify/write_overflow_field-memset.log
  CC [M]  net/ipv6/netfilter/ip6t_mh.o
  CC [M]  drivers/char/ipmi/ipmi_ssif.o
  CC [M]  drivers/gpio/gpio-virtio.o
  CC      drivers/pci/controller/dwc/pcie-designware-host.o
  CC      drivers/acpi/acpica/dsutils.o
  AR      kernel/time/built-in.a
  CC      mm/init-mm.o
  CC [M]  drivers/video/backlight/ktd2801-backlight.o
  CAT     lib/test_fortify/test_fortify.log
  CC      lib/bug.o
  CC      fs/ext4/mballoc.o
  CC      kernel/debug/kdb/kdb_debugger.o
  CC      drivers/video/fbdev/core/fbcon_cw.o
  CC [M]  drivers/leds/leds-pca963x.o
  CC [M]  drivers/video/fbdev/nvidia/nv_accel.o
  CC      kernel/cgroup/legacy_freezer.o
  CC      drivers/pnp/pnpacpi/core.o
  CC      arch/x86/kernel/ioport.o
  CC      net/devlink/dev.o
  CC      drivers/acpi/acpica/dswexec.o
  AR      security/integrity/built-in.a
  CC      security/security.o
  CC      fs/jbd2/transaction.o
  CC [M]  crypto/ccm.o
  LD [M]  sound/soc/codecs/snd-soc-ac97.o
  LD [M]  sound/soc/codecs/snd-soc-ak4619.o
  LD [M]  sound/soc/codecs/snd-soc-cs40l50.o
  LD [M]  sound/soc/codecs/snd-soc-cs530x.o
  LD [M]  sound/soc/codecs/snd-soc-cs530x-i2c.o
  CC [M]  drivers/video/backlight/ktz8866.o
  LD [M]  sound/soc/codecs/snd-soc-es8311.o
  LD [M]  sound/soc/codecs/snd-soc-hda-codec.o
  LD [M]  sound/soc/codecs/snd-soc-hdmi-codec.o
  CC [M]  drivers/gpio/gpio-vx855.o
  LD [M]  sound/soc/codecs/snd-soc-pcm6240.o
  CC [M]  net/ipv6/netfilter/ip6t_hbh.o
  CC [M]  net/netfilter/nf_conntrack_labels.o
  CC      lib/buildid.o
  CC [M]  sound/soc/amd/acp-config.o
  CC      drivers/acpi/acpica/dswload.o
  CC      net/ipv4/ip_sockglue.o
  CC [M]  drivers/leds/leds-pca995x.o
  CC      drivers/video/fbdev/core/fbcon_ud.o
  CC      kernel/cgroup/pids.o
  CC [M]  drivers/char/ipmi/ipmi_watchdog.o
  CC      kernel/debug/kdb/kdb_keyboard.o
  CC      arch/x86/kernel/dumpstack.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/eventfd.o
  CC [M]  drivers/video/fbdev/nvidia/nv_of.o
  CC      drivers/pnp/pnpacpi/rsparser.o
  CC [M]  drivers/gpio/gpio-wcove.o
  CC      drivers/acpi/acpica/dswload2.o
  CC [M]  crypto/chacha20poly1305.o
  CC [M]  drivers/video/backlight/lm3509_bl.o
  CC      drivers/pci/controller/dwc/pcie-designware-ep.o
  CC      kernel/cgroup/rdma.o
  CC [M]  drivers/leds/leds-pwm.o
  CC      drivers/acpi/acpica/dswscope.o
  CC      arch/x86/kernel/nmi.o
  CC      lib/clz_tab.o
  CC      net/core/net-traces.o
  CC      drivers/video/fbdev/core/fbcon_ccw.o
  LD [M]  sound/soc/amd/snd-acp-config.o
  CC      lib/cmdline.o
  CC      mm/memblock.o
  CC [M]  drivers/video/fbdev/nvidia/nv_i2c.o
  CC [M]  drivers/char/ipmi/ipmi_poweroff.o
  CC [M]  sound/soc/dwc/dwc-i2s.o
  CC      kernel/debug/kdb/gen-kdb_cmds.o
  CC [M]  drivers/gpio/gpio-winbond.o
  CC [M]  net/ipv6/netfilter/ip6t_rpfilter.o
  AR      kernel/debug/kdb/built-in.a
  CC      kernel/debug/debug_core.o
  AR      drivers/pnp/pnpacpi/built-in.a
  CC      drivers/pnp/core.o
  CC [M]  drivers/video/backlight/lm3533_bl.o
  CC      lib/cpumask.o
  CC      drivers/acpi/acpica/dswstate.o
  CC [M]  crypto/aegis128-core.o
  CC [M]  net/netfilter/nf_conntrack_ovs.o
  CC [M]  drivers/leds/leds-regulator.o
  CC      fs/jbd2/commit.o
  CC      drivers/acpi/acpica/evevent.o
  LD [M]  drivers/char/ipmi/ipmi_si.o
  AR      drivers/char/ipmi/built-in.a
  CC      net/devlink/port.o
  CC      lib/ctype.o
  CC [M]  drivers/gpio/gpio-wm831x.o
  CC      drivers/video/fbdev/core/cfbfillrect.o
  CC [M]  drivers/video/fbdev/nvidia/nv_backlight.o
  CC [M]  drivers/leds/leds-tca6507.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/binary_stats.o
  CC [M]  sound/soc/dwc/dwc-pcm.o
  CC [M]  drivers/video/backlight/lm3630a_bl.o
  CC      kernel/cgroup/cpuset.o
  CC      mm/memory_hotplug.o
  CC      drivers/pci/controller/dwc/pcie-designware-plat.o
  CC [M]  crypto/pcrypt.o
  CC [M]  net/ipv6/netfilter/ip6t_rt.o
  CC      drivers/acpi/acpica/evgpe.o
  CC      lib/dec_and_lock.o
  CC      drivers/pnp/card.o
  CC      net/ipv4/inet_hashtables.o
  CC [M]  drivers/gpio/gpio-wm8350.o
  CC      fs/ext4/migrate.o
  CC      lib/decompress.o
  LD [M]  sound/soc/dwc/designware_i2s.o
  LD [M]  drivers/video/fbdev/nvidia/nvidiafb.o
  CC [M]  drivers/video/backlight/lm3639_bl.o
  CC      net/ipv6/ip6_output.o
  CC      drivers/acpi/acpica/evgpeblk.o
  CC      kernel/debug/gdbstub.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/vfio.o
  CC      lib/decompress_bunzip2.o
  CC      arch/x86/kernel/fred.o
  AR      drivers/pci/controller/dwc/built-in.a
  AR      drivers/pci/controller/mobiveil/built-in.a
  CC [M]  sound/soc/intel/common/soc-acpi-intel-byt-match.o
  AR      drivers/pci/controller/plda/built-in.a
  CC [M]  crypto/cryptd.o
  CC      drivers/pci/controller/vmd.o
  CC [M]  drivers/leds/leds-ti-lmu-common.o
  CC [M]  drivers/leds/leds-tlc591xx.o
  CC      fs/jbd2/recovery.o
  CC [M]  drivers/gpio/gpio-wm8994.o
  CC      drivers/video/fbdev/core/cfbcopyarea.o
  CC      drivers/acpi/acpica/evgpeinit.o
  CC [M]  net/ipv6/netfilter/ip6t_srh.o
  CC      fs/ext4/mmp.o
  CC      lib/decompress_inflate.o
  CC [M]  drivers/video/backlight/lp855x_bl.o
  CC      drivers/acpi/acpica/evgpeutil.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/coalesced_mmio.o
  AR      kernel/debug/built-in.a
  CC      mm/slub.o
  CC [M]  drivers/pci/controller/pci-hyperv.o
  CC      drivers/pnp/driver.o
  CC [M]  drivers/video/backlight/lp8788_bl.o
  CC [M]  drivers/gpio/gpio-ws16c48.o
  CC      fs/jbd2/checkpoint.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cht-match.o
  CC [M]  net/netfilter/nf_conntrack_proto_dccp.o
  CC [M]  drivers/leds/leds-tps6105x.o
  CC      net/devlink/sb.o
  CC      lib/decompress_unlz4.o
  CC [M]  drivers/video/backlight/lv5207lp.o
  CC      arch/x86/kernel/ldt.o
  CC [M]  crypto/des_generic.o
  CC      drivers/acpi/acpica/evglock.o
  CC [M]  drivers/video/backlight/max8925_bl.o
  CC [M]  drivers/gpio/gpio-xra1403.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/async_pf.o
  CC      drivers/acpi/acpica/evhandler.o
  CC      drivers/video/fbdev/core/cfbimgblt.o
  CC      lib/decompress_unlzma.o
  CC [M]  net/ipv6/netfilter/ip6t_NPT.o
  CC [M]  crypto/fcrypt.o
  CC [M]  drivers/leds/leds-wm831x-status.o
  CC      fs/jbd2/revoke.o
  CC      fs/ext4/move_extent.o
  CC      net/ipv4/inet_timewait_sock.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.o
  CC      drivers/pnp/resource.o
  CC      drivers/acpi/acpica/evmisc.o
  AR      drivers/amba/built-in.a
  CC      fs/squashfs/block.o
  CC      net/core/drop_monitor.o
  CC [M]  net/netfilter/nf_conntrack_proto_sctp.o
  CC      arch/x86/kernel/setup.o
  CC [M]  drivers/video/backlight/mp3309c.o
  CC      kernel/cgroup/misc.o
  CC [M]  drivers/pci/controller/pci-hyperv-intf.o
  CC      drivers/acpi/acpica/evregion.o
  CC      lib/decompress_unlzo.o
  CC [M]  drivers/leds/leds-wm8350.o
  CC [M]  crypto/blowfish_generic.o
  AR      drivers/gpio/built-in.a
  CC      drivers/video/fbdev/core/fb_io_fops.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/irqchip.o
  CC      fs/jbd2/journal.o
  CC      fs/squashfs/cache.o
  CC      drivers/acpi/acpica/evrgnini.o
  CC      fs/ext4/namei.o
  CC [M]  net/ipv6/netfilter/ip6t_REJECT.o
  CC      lib/decompress_unxz.o
  CC      net/devlink/dpipe.o
  CC [M]  drivers/video/backlight/mt6370-backlight.o
  CC      security/inode.o
  CC [M]  drivers/video/backlight/pandora_bl.o
  CC [M]  crypto/blowfish_common.o
  CC [M]  drivers/leds/leds-dac124s085.o
  AR      drivers/pci/controller/built-in.a
  CC [M]  sound/soc/intel/common/soc-acpi-intel-skl-match.o
  AR      drivers/pci/switch/built-in.a
  CC      drivers/acpi/acpica/evsci.o
  CC [M]  drivers/pci/switch/switchtec.o
  CC [M]  net/netfilter/nf_conntrack_proto_gre.o
  CC      drivers/pnp/manager.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/dirty_ring.o
  CC      lib/decompress_unzstd.o
  CC      fs/squashfs/dir.o
  CC [M]  sound/hda/ext/hdac_ext_bus.o
  AR      kernel/cgroup/built-in.a
  CC      kernel/trace/rv/rv.o
  CC      net/ipv4/inet_connection_sock.o
  CC      arch/x86/kernel/x86_init.o
  CC      drivers/video/fbdev/core/sysfillrect.o
  CC      drivers/acpi/acpica/evxface.o
  CC [M]  drivers/leds/leds-spi-byte.o
  CC      kernel/trace/rv/monitors/wwnr/wwnr.o
  CC [M]  drivers/video/backlight/pwm_bl.o
  CC      net/core/selftests.o
  CC [M]  crypto/twofish_generic.o
  CC      lib/dump_stack.o
  CC      fs/squashfs/export.o
  CC [M]  net/ipv6/netfilter/ip6t_SYNPROXY.o
  CC      kernel/bpf/core.o
  CC      security/lsm_audit.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-kbl-match.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/pfncache.o
  CC      drivers/pnp/support.o
  CC [M]  drivers/leds/uleds.o
  CC      drivers/acpi/acpica/evxfevnt.o
  CC [M]  sound/hda/ext/hdac_ext_controller.o
  CC      kernel/bpf/syscall.o
  CC      fs/squashfs/file.o
  CC [M]  drivers/video/backlight/qcom-wled.o
  CC [M]  crypto/twofish_common.o
  CC      drivers/pci/access.o
  CC      arch/x86/kernel/i8259.o
  CC      drivers/video/fbdev/core/syscopyarea.o
  CC      lib/earlycpio.o
  CC      mm/madvise.o
  CC      net/devlink/resource.o
  CC      drivers/acpi/acpica/evxfgpe.o
  CC      fs/ext4/page-io.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-bxt-match.o
  CC      lib/extable.o
  AR      drivers/leds/built-in.a
  CC      drivers/pci/bus.o
  CC      drivers/pnp/interface.o
  AR      fs/jbd2/built-in.a
  CC      kernel/trace/rv/rv_reactors.o
  CC      drivers/pci/probe.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/guest_memfd.o
  CC      security/device_cgroup.o
  CC [M]  drivers/video/backlight/rt4831-backlight.o
  CC      fs/squashfs/fragment.o
  LD [M]  net/ipv6/netfilter/nf_defrag_ipv6.o
  CC      net/ipv6/ip6_input.o
  CC [M]  net/netfilter/nf_conntrack_netlink.o
  CC [M]  sound/hda/ext/hdac_ext_stream.o
  CC      lib/flex_proportions.o
  CC      net/core/timestamping.o
  CC      arch/x86/kernel/irqinit.o
  CC      drivers/acpi/acpica/evxfregn.o
  CC      fs/squashfs/id.o
  CC [M]  drivers/video/backlight/kb3886_bl.o
  CC      drivers/pnp/quirks.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-glk-match.o
  CC      mm/page_io.o
  CC      kernel/trace/rv/reactor_printk.o
  CC      lib/idr.o
  CC      fs/ext4/readpage.o
  CC      net/ipv4/tcp.o
  CC [M]  crypto/serpent_generic.o
  CC      drivers/video/fbdev/core/sysimgblt.o
  CC      net/devlink/param.o
  CC      fs/squashfs/inode.o
  CC      drivers/acpi/acpica/exconcat.o
  LD [M]  sound/hda/ext/snd-hda-ext-core.o
  CC [M]  sound/hda/hda_bus_type.o
  CC [M]  crypto/sm4.o
  CC [M]  drivers/video/backlight/sky81452-backlight.o
  CC      drivers/pnp/system.o
  CC      kernel/trace/rv/reactor_panic.o
  CC      arch/x86/kernel/jump_label.o
  CC      lib/iomem_copy.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cnl-match.o
  CC      drivers/acpi/acpica/exconfig.o
  AR      security/built-in.a
  CC      fs/squashfs/namei.o
  CC      arch/x86/kernel/irq_work.o
  CC      arch/x86/kernel/probe_roms.o
  CC [M]  arch/x86/kvm/x86.o
  CC      arch/x86/kernel/sys_ia32.o
  CC      fs/ext4/resize.o
  CC      lib/irq_regs.o
  CC      drivers/pci/host-bridge.o
  CC      mm/swap_state.o
  AR      drivers/pnp/built-in.a
  CC      net/core/ptp_classifier.o
  CC      drivers/acpi/apei/apei-base.o
  CC      drivers/acpi/acpica/exconvrt.o
  AR      kernel/trace/rv/built-in.a
  CC      kernel/trace/trace_clock.o
  CC      kernel/trace/ftrace.o
  CC [M]  drivers/video/backlight/wm831x_bl.o
  CC      lib/is_single_threaded.o
  CC      net/strparser/strparser.o
  CC      fs/squashfs/super.o
  CC      drivers/video/fbdev/core/fb_sys_fops.o
  CC      net/ipv6/addrconf.o
  CC [M]  net/netfilter/nfnetlink_cttimeout.o
  CC [M]  crypto/sm4_generic.o
  CC      drivers/acpi/acpica/excreate.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cfl-match.o
  AR      drivers/clk/actions/built-in.a
  AR      drivers/clk/analogbits/built-in.a
  AR      drivers/clk/bcm/built-in.a
  AR      drivers/clk/imgtec/built-in.a
  AR      drivers/clk/imx/built-in.a
  CC [M]  net/netfilter/nfnetlink_cthelper.o
  AR      drivers/clk/ingenic/built-in.a
  CC      lib/klist.o
  CC [M]  sound/hda/hdac_bus.o
  AR      drivers/clk/mediatek/built-in.a
  AR      drivers/clk/microchip/built-in.a
  AR      drivers/clk/mstar/built-in.a
  AR      drivers/clk/mvebu/built-in.a
  CC      arch/x86/kernel/signal_32.o
  AR      drivers/clk/ralink/built-in.a
  CC      drivers/pci/remove.o
  AR      drivers/clk/renesas/built-in.a
  AR      drivers/clk/socfpga/built-in.a
  AR      drivers/clk/sophgo/built-in.a
  CC      net/devlink/region.o
  AR      drivers/clk/sprd/built-in.a
  CC      drivers/acpi/apei/hest.o
  CC      drivers/acpi/acpica/exdebug.o
  AR      drivers/clk/starfive/built-in.a
  AR      drivers/clk/sunxi-ng/built-in.a
  AR      drivers/clk/ti/built-in.a
  CC [M]  drivers/video/backlight/arcxcnn_bl.o
  CC      mm/swapfile.o
  AR      drivers/clk/versatile/built-in.a
  CC      drivers/clk/x86/clk-fch.o
  CC [M]  crypto/aes_ti.o
  CC      fs/squashfs/symlink.o
  CC      drivers/video/hdmi.o
  CC      kernel/bpf/verifier.o
  CC      lib/kobject.o
  CC      drivers/acpi/acpica/exdump.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cml-match.o
  CC      fs/ext4/super.o
  CC [M]  crypto/camellia_generic.o
  CC      net/core/netprio_cgroup.o
  CC      arch/x86/kernel/sys_x86_64.o
  CC      drivers/clk/x86/clk-lpss-atom.o
  CC      drivers/video/display_timing.o
  CC [M]  drivers/video/backlight/rave-sp-backlight.o
  CC [M]  sound/hda/hdac_device.o
  CC      fs/squashfs/decompressor.o
  CC      drivers/pci/pci.o
  CC      drivers/acpi/acpica/exfield.o
  AR      net/strparser/built-in.a
  CC      drivers/clk/x86/clk-pmc-atom.o
  CC [M]  drivers/video/fbdev/core/fb_ddc.o
  CC      drivers/acpi/apei/erst.o
  CC      lib/kobject_uevent.o
  CC [M]  drivers/video/fbdev/aty/aty128fb.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-icl-match.o
  CC      net/ipv6/addrlabel.o
  CC      drivers/acpi/acpica/exfldio.o
  CC [M]  net/netfilter/nf_conntrack_amanda.o
  AR      drivers/clk/xilinx/built-in.a
  CC [M]  drivers/clk/xilinx/xlnx_vcu.o
  CC      arch/x86/kernel/espfix_64.o
  CC      fs/squashfs/page_actor.o
  AR      drivers/clk/x86/built-in.a
  CC [M]  sound/hda/hdac_sysfs.o
  CC      net/core/netclassid_cgroup.o
  AR      drivers/video/backlight/built-in.a
  CC [M]  sound/hda/hdac_regmap.o
  CC      net/ipv4/tcp_input.o
  CC      net/devlink/health.o
  CC      drivers/acpi/acpica/exmisc.o
  CC      kernel/events/core.o
  CC      drivers/clk/clk-devres.o
  CC      fs/squashfs/file_direct.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-tgl-match.o
  CC      arch/x86/kernel/ksysfs.o
  CC      drivers/acpi/apei/bert.o
  CC      drivers/acpi/acpica/exmutex.o
  CC      kernel/events/ring_buffer.o
  CC [M]  crypto/cast_common.o
  CC [M]  drivers/video/fbdev/aty/radeon_base.o
  CC      kernel/trace/ring_buffer.o
  AR      drivers/video/fbdev/core/built-in.a
  CC [M]  crypto/cast5_generic.o
  CC      mm/zswap.o
  CC      lib/logic_pio.o
  CC      drivers/acpi/apei/ghes.o
  CC      arch/x86/kernel/bootflag.o
  CC [M]  sound/hda/hdac_controller.o
  CC      fs/squashfs/decompressor_single.o
  CC      drivers/acpi/acpica/exnames.o
  CC [M]  net/netfilter/nf_conntrack_ftp.o
  CC      kernel/bpf/inode.o
  CC      drivers/clk/clk-bulk.o
  CC      net/core/lwtunnel.o
  CC      fs/ext4/symlink.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ehl-match.o
  CC      lib/maple_tree.o
  CC      drivers/acpi/acpica/exoparg1.o
  CC      arch/x86/kernel/e820.o
  CC      fs/squashfs/decompressor_multi.o
  CC      drivers/pci/pci-driver.o
  CC [M]  crypto/cast6_generic.o
  CC [M]  sound/hda/hdac_stream.o
  CC      drivers/acpi/pmic/intel_pmic.o
  CC      drivers/acpi/acpica/exoparg2.o
  CC [M]  drivers/video/fbdev/aty/radeon_pm.o
  CC      net/devlink/trap.o
  CC      mm/dmapool.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-jsl-match.o
  CC      kernel/trace/trace.o
  CC      fs/squashfs/decompressor_multi_percpu.o
  CC      net/ipv6/route.o
  CC      drivers/acpi/acpica/exoparg3.o
  CC      drivers/clk/clkdev.o
  CC [M]  crypto/aria_generic.o
  CC [M]  drivers/acpi/apei/einj-core.o
  CC      drivers/acpi/acpica/exoparg6.o
  CC      fs/squashfs/xattr.o
  CC      net/core/lwt_bpf.o
  CC      drivers/acpi/pmic/intel_pmic_bytcrc.o
  CC [M]  net/netfilter/nf_conntrack_h323_main.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-adl-match.o
  CC [M]  drivers/video/fbdev/aty/radeon_monitor.o
  CC      arch/x86/kernel/pci-dma.o
  CC      mm/hugetlb.o
  CC      drivers/acpi/acpica/exprep.o
  CC      drivers/acpi/pmic/intel_pmic_chtcrc.o
  CC [M]  sound/hda/array.o
  CC      drivers/pci/search.o
  CC [M]  drivers/acpi/apei/einj-cxl.o
  CC      drivers/clk/clk.o
  CC      fs/squashfs/xattr_id.o
  CC      drivers/acpi/pmic/intel_pmic_xpower.o
  CC [M]  crypto/chacha_generic.o
  CC      drivers/acpi/acpica/exregion.o
  CC      fs/ramfs/inode.o
  CC      arch/x86/kernel/quirks.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-rpl-match.o
  CC [M]  drivers/video/fbdev/aty/radeon_accel.o
  CC      fs/squashfs/lz4_wrapper.o
  CC [M]  crypto/poly1305_generic.o
  CC      drivers/acpi/pmic/intel_pmic_bxtwc.o
  CC      net/core/dst_cache.o
  CC [M]  sound/hda/hdmi_chmap.o
  CC      drivers/acpi/acpica/exresnte.o
  CC      net/devlink/rate.o
  CC      kernel/trace/trace_output.o
  CC      drivers/pci/rom.o
  AR      drivers/acpi/apei/built-in.a
  CC      net/ipv4/tcp_output.o
  LD [M]  drivers/acpi/apei/einj.o
  CC      fs/ramfs/file-mmu.o
  CC      drivers/dma/hsu/hsu.o
  CC [M]  crypto/michael_mic.o
  CC      drivers/acpi/acpica/exresolv.o
  CC      drivers/acpi/pmic/intel_pmic_chtwc.o
  CC      fs/squashfs/lzo_wrapper.o
  CC [M]  drivers/video/fbdev/aty/radeon_i2c.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-mtl-match.o
  CC      arch/x86/kernel/kdebugfs.o
  CC      drivers/acpi/acpica/exresop.o
  CC [M]  crypto/crc32_generic.o
  AR      fs/ramfs/built-in.a
  CC      drivers/pci/setup-res.o
  CC      drivers/acpi/pmic/intel_pmic_chtdc_ti.o
  CC      net/ipv4/tcp_timer.o
  CC [M]  net/netfilter/nf_conntrack_h323_asn1.o
  CC      fs/squashfs/xz_wrapper.o
  CC      fs/ext4/sysfs.o
  CC [M]  sound/hda/trace.o
  CC [M]  drivers/video/fbdev/aty/radeon_backlight.o
  CC      drivers/acpi/acpica/exserial.o
  CC      net/core/gro_cells.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-arl-match.o
  CC [M]  net/netfilter/nf_conntrack_irc.o
  CC [M]  crypto/authenc.o
  CC      lib/memcat_p.o
  CC      drivers/acpi/pmic/tps68470_pmic.o
  CC      arch/x86/kernel/alternative.o
  CC      drivers/acpi/acpica/exstore.o
  CC      fs/squashfs/zlib_wrapper.o
  AR      drivers/dma/hsu/built-in.a
  AR      drivers/dma/idxd/built-in.a
  CC [M]  drivers/dma/idxd/bus.o
  CC      net/devlink/linecard.o
  CC      lib/min_heap.o
  CC      fs/ext4/xattr.o
  LD [M]  drivers/video/fbdev/aty/radeonfb.o
  CC      drivers/pci/irq.o
  CC [M]  drivers/video/fbdev/mb862xx/mb862xxfbdrv.o
  CC      drivers/acpi/acpica/exstoren.o
  CC [M]  sound/hda/hdac_component.o
  CC [M]  sound/hda/hdac_i915.o
  AR      drivers/acpi/pmic/built-in.a
  CC      drivers/dma/lgm/lgm-dma.o
  CC      lib/nmi_backtrace.o
  CC      kernel/trace/trace_seq.o
  CC      fs/squashfs/zstd_wrapper.o
  CC      kernel/events/callchain.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-lnl-match.o
  CC      net/8021q/vlan_core.o
  CC      drivers/acpi/acpica/exstorob.o
  CC      drivers/clk/clk-divider.o
  CC      drivers/acpi/acpica/exsystem.o
  CC      net/core/failover.o
  CC [M]  arch/x86/kvm/emulate.o
  CC      mm/hugetlb_vmemmap.o
  CC      lib/objpool.o
  CC [M]  drivers/video/fbdev/mb862xx/mb862xxfb_accel.o
  AR      fs/squashfs/built-in.a
  CC [M]  drivers/dma/idxd/init.o
  CC      kernel/trace/trace_stat.o
  CC      drivers/pci/vpd.o
  CC [M]  crypto/authencesn.o
  CC [M]  net/netfilter/nf_conntrack_broadcast.o
  CC      kernel/events/hw_breakpoint.o
  CC      kernel/trace/trace_printk.o
  CC [M]  sound/hda/intel-dsp-config.o
  CC      drivers/pci/setup-bus.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ptl-match.o
  CC      drivers/acpi/acpica/extrace.o
  AR      drivers/dma/lgm/built-in.a
  CC [M]  drivers/video/fbdev/mb862xx/mb862xx-i2c.o
  CC      kernel/bpf/helpers.o
  CC      fs/ext4/xattr_hurd.o
  CC      drivers/clk/clk-fixed-factor.o
  CC      arch/x86/kernel/i8253.o
  CC      drivers/acpi/acpica/exutils.o
  CC      lib/plist.o
  CC      lib/radix-tree.o
  CC [M]  arch/x86/kvm/i8259.o
  CC      net/ipv4/tcp_ipv4.o
  CC [M]  drivers/dma/idxd/irq.o
  LD [M]  drivers/video/fbdev/mb862xx/mb862xxfb.o
  AR      drivers/video/fbdev/built-in.a
  CC [M]  drivers/video/fbdev/macmodes.o
  CC [M]  crypto/lz4.o
  AR      net/devlink/built-in.a
  CC      fs/hugetlbfs/inode.o
  CC      arch/x86/kernel/hw_breakpoint.o
  CC [M]  net/8021q/vlan.o
  CC      fs/ext4/xattr_trusted.o
  CC [M]  drivers/dma/idxd/device.o
  CC      net/core/skmsg.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-hda-match.o
  CC      drivers/acpi/acpica/hwacpi.o
  CC [M]  sound/x86/intel_hdmi_audio.o
  CC      mm/mempolicy.o
  CC [M]  sound/hda/intel-nhlt.o
  CC      drivers/clk/clk-fixed-rate.o
  CC      kernel/trace/pid_list.o
  CC [M]  crypto/lz4hc.o
  CC      net/ipv6/ip6_fib.o
  CC [M]  net/netfilter/nf_conntrack_netbios_ns.o
  CC      drivers/acpi/acpica/hwesleep.o
  CC      fs/ext4/xattr_user.o
  CC      kernel/events/uprobes.o
  CC      arch/x86/kernel/tsc.o
  CC      drivers/pci/vc.o
  CC      drivers/acpi/acpica/hwgpe.o
  CC [M]  drivers/video/fbdev/sm501fb.o
  CC      lib/ratelimit.o
  CC [M]  crypto/842.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.o
  CC [M]  net/8021q/vlan_dev.o
  CC [M]  sound/hda/intel-sdw-acpi.o
  CC      kernel/trace/tracing_map.o
  LD [M]  sound/x86/snd-hdmi-lpe-audio.o
  LD [M]  sound/hda/snd-hda-core.o
  CC      drivers/clk/clk-gate.o
  CC      arch/x86/kernel/tsc_msr.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ssp-common.o
  CC [M]  arch/x86/kvm/irq.o
  CC      net/netlabel/netlabel_user.o
  CC      fs/ext4/fast_commit.o
  CC      drivers/acpi/acpica/hwregs.o
  AR      fs/hugetlbfs/built-in.a
  CC      kernel/trace/trace_sched_switch.o
  CC      lib/rbtree.o
  CC [M]  net/netfilter/nf_conntrack_snmp.o
  CC [M]  crypto/ansi_cprng.o
  CC      net/ipv4/tcp_minisocks.o
  CC      drivers/pci/mmap.o
  CC      kernel/bpf/tnum.o
  CC [M]  drivers/dma/idxd/sysfs.o
  CC      drivers/clk/clk-multiplier.o
  CC      kernel/bpf/log.o
  CC [M]  drivers/video/fbdev/udlfb.o
  CC      drivers/acpi/acpica/hwsleep.o
  LD [M]  sound/hda/snd-intel-dspcfg.o
  LD [M]  sound/hda/snd-intel-sdw-acpi.o
  CC      net/netlabel/netlabel_kapi.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-sdca-quirks.o
  CC      arch/x86/kernel/io_delay.o
  CC [M]  crypto/tcrypt.o
  CC      drivers/acpi/acpica/hwvalid.o
  CC      kernel/bpf/token.o
  CC      lib/seq_buf.o
  CC      lib/siphash.o
  CC [M]  net/8021q/vlan_netlink.o
  CC      drivers/pci/devres.o
  CC      kernel/trace/trace_functions.o
  CC      net/core/sock_map.o
  CC      kernel/bpf/bpf_iter.o
  CC      drivers/clk/clk-mux.o
  CC      drivers/acpi/acpica/hwxface.o
  CC [M]  arch/x86/kvm/lapic.o
  CC      mm/sparse.o
  CC      arch/x86/kernel/rtc.o
  CC      net/netlabel/netlabel_domainhash.o
  CC      fs/ext4/orphan.o
  CC      net/ipv6/ipv6_sockglue.o
  CC      kernel/trace/trace_preemptirq.o
  AR      kernel/events/built-in.a
  CC [M]  net/netfilter/nf_conntrack_pptp.o
  LD [M]  sound/soc/intel/common/snd-soc-acpi-intel-match.o
  CC      drivers/acpi/acpica/hwxfsleep.o
  CC      lib/string.o
  LD [M]  sound/soc/intel/common/snd-soc-acpi-intel-sdca-quirks.o
  CC [M]  sound/soc/intel/atom/sst/sst.o
  CC      kernel/trace/trace_sched_wakeup.o
  CC [M]  drivers/video/fbdev/smscufx.o
  CC [M]  net/8021q/vlan_gvrp.o
  CC [M]  drivers/dma/idxd/submit.o
  CC      lib/timerqueue.o
  CC [M]  drivers/dma/amd/ptdma/ptdma-dev.o
  CC      drivers/pci/proc.o
  AR      drivers/dma/amd/built-in.a
  CC      drivers/clk/clk-composite.o
  CC      net/core/bpf_sk_storage.o
  CC [M]  arch/x86/kvm/i8254.o
  CC      kernel/bpf/map_iter.o
  CC      net/ipv4/tcp_cong.o
  CC      drivers/acpi/acpica/hwpci.o
  CC      lib/union_find.o
  CC      fs/ext4/acl.o
  CC      arch/x86/kernel/resource.o
  CC      lib/vsprintf.o
  CC [M]  crypto/polyval-generic.o
  CC [M]  net/8021q/vlan_mvrp.o
  AS      arch/x86/kernel/irqflags.o
  CC [M]  drivers/dma/amd/ptdma/ptdma-dmaengine.o
  CC      drivers/acpi/acpica/nsaccess.o
  CC      mm/sparse-vmemmap.o
  CC      arch/x86/kernel/static_call.o
  CC [M]  net/8021q/vlanproc.o
  CC      drivers/pci/pci-sysfs.o
  CC      lib/win_minmax.o
  CC [M]  sound/soc/intel/atom/sst/sst_ipc.o
  CC [M]  drivers/dma/idxd/dma.o
  CC [M]  drivers/video/fbdev/xen-fbfront.o
  CC      fs/ext4/xattr_security.o
  CC      kernel/bpf/task_iter.o
  CC      net/netlabel/netlabel_addrlist.o
  CC      lib/xarray.o
  CC      drivers/acpi/acpica/nsalloc.o
  CC      drivers/clk/clk-fractional-divider.o
  CC      kernel/trace/trace_hwlat.o
  CC      mm/mmu_notifier.o
  CC [M]  net/netfilter/nf_conntrack_sane.o
  CC [M]  crypto/af_alg.o
  CC      lib/lockref.o
  CC      drivers/acpi/acpica/nsarguments.o
  CC [M]  net/netfilter/nf_conntrack_sip.o
  AR      net/8021q/built-in.a
  LD [M]  net/8021q/8021q.o
  CC [M]  sound/soc/intel/atom/sst/sst_stream.o
  CC      fs/fat/cache.o
  CC      arch/x86/kernel/process.o
  CC      drivers/acpi/dptf/int340x_thermal.o
  CC      fs/ext4/verity.o
  CC [M]  drivers/dma/amd/ptdma/ptdma-debugfs.o
  CC      net/ipv6/ndisc.o
  CC      kernel/trace/trace_osnoise.o
  CC      net/core/devmem.o
  CC      drivers/pci/slot.o
  CC [M]  drivers/video/fbdev/uvesafb.o
  CC [M]  arch/x86/kvm/ioapic.o
  CC      kernel/bpf/prog_iter.o
  CC [M]  drivers/acpi/dptf/dptf_power.o
  CC      drivers/acpi/acpica/nsconvert.o
  CC      net/netlabel/netlabel_mgmt.o
  CC [M]  drivers/dma/idxd/cdev.o
  CC [M]  net/netfilter/nf_conntrack_tftp.o
  CC      net/ipv4/tcp_metrics.o
  CC [M]  sound/soc/intel/atom/sst-mfld-platform-pcm.o
  CC      mm/ksm.o
  CC      drivers/clk/clk-gpio.o
  CC [M]  sound/soc/intel/atom/sst/sst_drv_interface.o
  CC      fs/fat/dir.o
  CC      fs/ext4/crypto.o
  CC      kernel/fork.o
  CC [M]  drivers/acpi/dptf/dptf_pch_fivr.o
  CC [M]  drivers/dma/amd/ptdma/ptdma-pci.o
  CC      drivers/acpi/acpica/nsdump.o
  CC [M]  net/core/pktgen.o
  CC      drivers/pci/pci-acpi.o
  CC      kernel/bpf/link_iter.o
  CC      lib/bcd.o
  CC [M]  arch/x86/kvm/irq_comm.o
  CC      lib/sort.o
  CC [M]  drivers/clk/clk_kunit_helpers.o
  CC [M]  sound/soc/intel/atom/sst/sst_loader.o
  CC [M]  crypto/algif_hash.o
  AR      fs/ext4/built-in.a
  CC      kernel/bpf/hashtab.o
  CC      drivers/acpi/acpica/nseval.o
  AR      drivers/acpi/dptf/built-in.a
  CC      net/netlabel/netlabel_unlabeled.o
  CC      arch/x86/kernel/ptrace.o
  CC [M]  drivers/video/fbdev/vga16fb.o
  CC      lib/parser.o
  LD [M]  drivers/dma/amd/ptdma/ptdma.o
  CC      drivers/pci/iomap.o
  CC      kernel/bpf/arraymap.o
  CC      fs/exfat/inode.o
  CC [M]  drivers/dma/idxd/debugfs.o
  CC      drivers/acpi/acpica/nsinit.o
  CC      kernel/trace/trace_nop.o
  CC      fs/exfat/namei.o
  CC      drivers/video/videomode.o
  CC [M]  sound/soc/intel/atom/sst/sst_pvt.o
  CC      lib/debug_locks.o
  CC [M]  drivers/clk/clk-cdce706.o
  CC [M]  net/netfilter/nf_log_syslog.o
  CC      fs/fat/fatent.o
  CC [M]  drivers/clk/clk-cs2000-cp.o
  CC      drivers/acpi/acpica/nsload.o
  CC      net/ipv4/tcp_fastopen.o
  CC      lib/random32.o
  CC [M]  crypto/algif_skcipher.o
  CC      drivers/acpi/x86/apple.o
  CC      net/ipv6/udp.o
  CC [M]  drivers/dma/idxd/defaults.o
  CC      lib/bust_spinlocks.o
  CC [M]  drivers/video/vgastate.o
  CC      drivers/pci/quirks.o
  CC      kernel/trace/trace_stack.o
  CC [M]  arch/x86/kvm/cpuid.o
  CC      arch/x86/kernel/tls.o
  CC      net/netlabel/netlabel_cipso_v4.o
  CC      drivers/acpi/acpica/nsnames.o
  CC [M]  sound/soc/intel/atom/sst-mfld-platform-compress.o
  CC      drivers/pci/ats.o
  CC      drivers/pci/iov.o
  CC      fs/exfat/dir.o
  CC [M]  drivers/clk/clk-lmk04832.o
  CC      drivers/acpi/x86/cmos_rtc.o
  CC      lib/kasprintf.o
  CC      mm/page_poison.o
  CC [M]  sound/soc/intel/atom/sst/sst_pci.o
  CC [M]  drivers/dma/idxd/perfmon.o
  CC      kernel/bpf/percpu_freelist.o
  CC [M]  crypto/algif_rng.o
  CC      drivers/acpi/acpica/nsobject.o
  AR      net/core/built-in.a
  CC      drivers/pci/pci-label.o
  CC      kernel/trace/trace_mmiotrace.o
  CC [M]  drivers/acpi/nfit/core.o
  CC [M]  net/netfilter/nf_nat_core.o
  CC      arch/x86/kernel/step.o
  CC      kernel/bpf/bpf_lru_list.o
  CC      fs/fat/file.o
  CC      net/ipv4/tcp_rate.o
  CC      lib/bitmap.o
  CC      net/netlabel/netlabel_calipso.o
  CC      drivers/acpi/acpica/nsparse.o
  AR      drivers/video/built-in.a
  CC [M]  drivers/acpi/nfit/intel.o
  CC      net/ipv6/udplite.o
  CC      drivers/acpi/x86/lpss.o
  CC [M]  drivers/clk/clk-max9485.o
  CC      fs/exfat/super.o
  CC [M]  crypto/algif_aead.o
  CC [M]  sound/soc/intel/atom/sst/sst_acpi.o
  CC      kernel/bpf/lpm_trie.o
  CC      mm/memtest.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-core.o
  LD [M]  drivers/dma/idxd/idxd_bus.o
  LD [M]  drivers/dma/idxd/idxd.o
  AR      sound/built-in.a
  CC      mm/migrate.o
  AR      drivers/dma/mediatek/built-in.a
  AR      drivers/dma/qcom/built-in.a
  CC [M]  drivers/dma/qcom/hidma_mgmt.o
  CC      mm/memory-tiers.o
  CC      arch/x86/kernel/tboot.o
  AR      drivers/dma/stm32/built-in.a
  CC      mm/migrate_device.o
  CC      drivers/acpi/acpica/nspredef.o
  CC      kernel/trace/trace_functions_graph.o
  CC [M]  drivers/clk/clk-palmas.o
  CC      lib/scatterlist.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-pci.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-acpi.o
  CC [M]  sound/soc/intel/atom/sst-atom-controls.o
  CC      drivers/acpi/x86/s2idle.o
  CC      fs/isofs/namei.o
  CC      fs/fat/inode.o
  CC      drivers/acpi/acpica/nsprepkg.o
  CC      fs/exfat/fatent.o
  CC      drivers/acpi/x86/utils.o
  CC [M]  drivers/dma/qcom/hidma_mgmt_sys.o
  CC [M]  crypto/zstd.o
  CC [M]  arch/x86/kvm/pmu.o
  CC      arch/x86/kernel/i8237.o
  CC      drivers/pci/p2pdma.o
  CC      net/ipv6/raw.o
  CC      kernel/bpf/map_in_map.o
  CC [M]  drivers/acpi/nfit/mce.o
  AR      net/netlabel/built-in.a
  AR      drivers/dma/ti/built-in.a
  CC      drivers/acpi/tables.o
  CC [M]  drivers/clk/clk-pwm.o
  CC      net/ipv4/tcp_recovery.o
  CC      fs/isofs/inode.o
  CC      kernel/trace/blktrace.o
  CC      arch/x86/kernel/stacktrace.o
  CC [M]  net/netfilter/nf_nat_proto.o
  CC      net/dcb/dcbnl.o
  CC      drivers/acpi/acpica/nsrepair.o
  CC [M]  crypto/essiv.o
  CC      fs/exfat/cache.o
  LD [M]  sound/soc/intel/atom/snd-soc-sst-atom-hifi2-platform.o
  CC      arch/x86/kernel/reboot.o
  CC [M]  sound/soc/sdca/sdca_functions.o
  CC [M]  drivers/dma/qcom/hidma_ll.o
  CC      arch/x86/kernel/early-quirks.o
  CC      kernel/bpf/bloom_filter.o
  CC [M]  drivers/clk/clk-si5341.o
  CC      fs/exportfs/expfs.o
  CC      drivers/acpi/x86/blacklist.o
  CC      lib/list_sort.o
  LD [M]  drivers/acpi/nfit/nfit.o
  CC [M]  sound/soc/sdca/sdca_device.o
  CC      net/ipv6/icmp.o
  CC      lib/uuid.o
  CC      drivers/acpi/acpica/nsrepair2.o
  CC [M]  crypto/curve25519-generic.o
  CC      fs/exfat/nls.o
  CC      lib/iov_iter.o
  CC      mm/huge_memory.o
  CC      fs/fat/misc.o
  CC      drivers/pci/vgaarb.o
  CC      fs/isofs/dir.o
  CC      net/ipv4/tcp_ulp.o
  CC [M]  drivers/dma/qcom/hidma.o
  AR      drivers/acpi/x86/built-in.a
  CC [M]  drivers/dma/qcom/hidma_dbg.o
  CC      kernel/bpf/local_storage.o
  AR      drivers/dma/xilinx/built-in.a
  CC [M]  drivers/dma/xilinx/xilinx_dma.o
  CC      drivers/acpi/acpica/nssearch.o
  ASN.1   crypto/ecrdsa_params.asn1.[ch]
  ASN.1   crypto/ecrdsa_pub_key.asn1.[ch]
  CC [M]  drivers/clk/clk-si5351.o
  CC [M]  crypto/ecrdsa_params.asn1.o
  AR      fs/exportfs/built-in.a
  CC      arch/x86/kernel/smp.o
  CC      net/ipv6/mcast.o
  CC      fs/exfat/misc.o
  CC [M]  crypto/ecrdsa_pub_key.asn1.o
  CC [M]  crypto/simd.o
  CC      drivers/acpi/acpica/nsutils.o
  CC      net/ipv6/reassembly.o
  CC      mm/khugepaged.o
  CC      fs/isofs/util.o
  CC      lib/clz_ctz.o
  CC [M]  arch/x86/kvm/mtrr.o
  CC [M]  drivers/clk/clk-si544.o
  CC      kernel/trace/fgraph.o
  LD [M]  drivers/dma/qcom/hdma_mgmt.o
  LD [M]  drivers/dma/qcom/hdma.o
  CC      net/dns_resolver/dns_key.o
  CC      net/dcb/dcbevent.o
  CC      net/switchdev/switchdev.o
  CC      drivers/acpi/acpica/nswalk.o
  CC      kernel/bpf/queue_stack_maps.o
  CC [M]  net/netfilter/nf_nat_helper.o
  CC      fs/exfat/file.o
  CC      fs/fat/nfs.o
  CC [M]  sound/soc/sdca/sdca_regmap.o
  CC      fs/isofs/rock.o
  CC      drivers/pci/doe.o
  CC      net/dns_resolver/dns_query.o
  CC      drivers/acpi/acpica/nsxfeval.o
  CC [M]  drivers/clk/clk-tps68470.o
  CC [M]  crypto/ecdsa-x962.o
  LD [M]  crypto/aegis128.o
  CC [M]  drivers/clk/clk-twl6040.o
  CC      lib/bsearch.o
  CC [M]  arch/x86/kvm/debugfs.o
  CC [M]  drivers/dma/xilinx/xdma.o
  CC      net/ipv4/tcp_offload.o
  CC      fs/exfat/balloc.o
  CC      kernel/bpf/ringbuf.o
  CC      arch/x86/kernel/smpboot.o
  CC      fs/fat/namei_vfat.o
  CC      fs/isofs/export.o
  CC [M]  net/netfilter/nf_nat_redirect.o
  LD [M]  sound/soc/sdca/snd-soc-sdca.o
  CC      kernel/trace/trace_events.o
  CC      net/l3mdev/l3mdev.o
  CC      drivers/acpi/acpica/nsxfname.o
  CC [M]  crypto/ecrdsa.o
  CC      fs/nls/nls_base.o
  CC [M]  sound/soc/soc-acpi.o
  AR      net/dcb/built-in.a
  CC [M]  drivers/pci/pci-stub.o
  CC [M]  drivers/clk/clk-twl.o
  AR      net/dns_resolver/built-in.a
  CC      fs/unicode/utf8-norm.o
  CC [M]  arch/x86/kvm/mmu/mmu.o
  CC      mm/page_counter.o
  CC      lib/find_bit.o
  AR      fs/exfat/built-in.a
  CC      fs/isofs/joliet.o
  AR      drivers/soc/apple/built-in.a
  AR      drivers/soc/aspeed/built-in.a
  AR      drivers/soc/bcm/built-in.a
  LD [M]  crypto/crypto_simd.o
  AR      drivers/soc/fsl/built-in.a
  CC      crypto/rsapubkey.asn1.o
  AR      drivers/soc/fujitsu/built-in.a
  AR      drivers/soc/hisilicon/built-in.a
  AR      drivers/soc/imx/built-in.a
  CC      crypto/rsaprivkey.asn1.o
  AR      drivers/soc/ixp4xx/built-in.a
  CC      drivers/acpi/acpica/nsxfobj.o
  AR      drivers/soc/loongson/built-in.a
  AR      drivers/soc/mediatek/built-in.a
  CC      fs/nls/nls_cp437.o
  LD [M]  crypto/ecdsa_generic.o
  AR      drivers/soc/microchip/built-in.a
  LD [M]  crypto/ecrdsa_generic.o
  CC [M]  drivers/clk/clk-wm831x.o
  AR      crypto/built-in.a
  AR      drivers/soc/nuvoton/built-in.a
  CC [M]  drivers/soc/nuvoton/wpcm450-soc.o
  CC [M]  drivers/pci/pci-pf-stub.o
  CC      net/ncsi/ncsi-cmd.o
  CC      kernel/bpf/bpf_local_storage.o
  CC [M]  sound/sound_core.o
  CC      lib/llist.o
  CC [M]  sound/ac97_bus.o
  CC      fs/fat/namei_msdos.o
  CC [M]  drivers/dma/dw/core.o
  CC      fs/unicode/utf8-core.o
  CC      lib/lwq.o
  CC [M]  sound/soc/soc-core.o
  CC      fs/isofs/compress.o
  AR      net/switchdev/built-in.a
  CC [M]  fs/nls/nls_cp737.o
  CC [M]  sound/soc/soc-dapm.o
  AR      drivers/soc/pxa/built-in.a
  CC      drivers/acpi/acpica/psargs.o
  AR      drivers/soc/amlogic/built-in.a
  CC [M]  drivers/pci/xen-pcifront.o
  AR      drivers/soc/qcom/built-in.a
  CC [M]  drivers/soc/qcom/pmic_pdcharger_ulog.o
  CC      arch/x86/kernel/tsc_sync.o
  CC      lib/memweight.o
  AR      net/l3mdev/built-in.a
  AR      drivers/clk/built-in.a
  CC      net/ipv4/tcp_plb.o
  CC [M]  drivers/dma/dw/dw.o
  AR      drivers/soc/renesas/built-in.a
  CC      arch/x86/kernel/setup_percpu.o
  CC      net/ipv6/tcp_ipv6.o
  CC [M]  arch/x86/kvm/mmu/page_track.o
  CC      lib/kfifo.o
  CC [M]  net/netfilter/nf_nat_masquerade.o
  CC      net/ncsi/ncsi-rsp.o
  CC [M]  fs/nls/nls_cp775.o
  CC      drivers/acpi/osi.o
  CC      drivers/acpi/acpica/psloop.o
  CC [M]  drivers/dma/dw-edma/dw-edma-core.o
  COPY    fs/unicode/utf8data.c
  CC      fs/unicode/utf8data.o
  AR      fs/isofs/built-in.a
  CC [M]  drivers/dma/ioat/init.o
  CC      net/mctp/af_mctp.o
  CC      kernel/bpf/bpf_task_storage.o
  CC [M]  drivers/soc/qcom/qcom-pbs.o
  CC      mm/memcontrol.o
  CC      drivers/acpi/acpica/psobject.o
  AR      fs/fat/built-in.a
  CC      drivers/acpi/acpica/psopcode.o
  CC [M]  fs/nls/nls_cp850.o
  CC      net/mctp/device.o
  AR      drivers/pci/built-in.a
  CC      net/ipv6/ping.o
  CC      kernel/trace/trace_export.o
  CC [M]  drivers/dma/dw/idma32.o
  CC [M]  drivers/dma/dw-edma/dw-edma-v0-core.o
  CC      drivers/acpi/acpica/psopinfo.o
  CC      arch/x86/kernel/mpparse.o
  CC [M]  drivers/dma/dw-edma/dw-hdma-v0-core.o
  CC [M]  fs/nls/nls_cp852.o
  AR      fs/unicode/built-in.a
  CC [M]  drivers/dma/dw-edma/dw-edma-v0-debugfs.o
  CC [M]  drivers/dma/ioat/dma.o
  AR      drivers/pmdomain/actions/built-in.a
  AR      drivers/soc/rockchip/built-in.a
  AR      drivers/pmdomain/amlogic/built-in.a
  LD [M]  sound/soundcore.o
  AR      drivers/soc/sunxi/built-in.a
  CC      kernel/trace/trace_syscalls.o
  AR      drivers/pmdomain/apple/built-in.a
  CC      kernel/bpf/bpf_inode_storage.o
  AR      drivers/soc/ti/built-in.a
  AR      drivers/pmdomain/arm/built-in.a
  CC      lib/percpu-refcount.o
  AR      drivers/soc/versatile/built-in.a
  CC      drivers/acpi/acpica/psparse.o
  AR      drivers/pmdomain/bcm/built-in.a
  AR      drivers/soc/xilinx/built-in.a
  AR      drivers/soc/built-in.a
  AR      drivers/pmdomain/imx/built-in.a
  CC      mm/vmpressure.o
  AR      drivers/pmdomain/mediatek/built-in.a
  AR      drivers/pmdomain/qcom/built-in.a
  CC      net/handshake/alert.o
  AR      drivers/pmdomain/renesas/built-in.a
  AR      drivers/pmdomain/rockchip/built-in.a
  AR      drivers/pmdomain/samsung/built-in.a
  CC      net/ipv4/datagram.o
  AR      drivers/pmdomain/st/built-in.a
  CC      net/ncsi/ncsi-aen.o
  AR      drivers/pmdomain/starfive/built-in.a
  CC [M]  fs/nls/nls_cp855.o
  CC      drivers/acpi/acpica/psscope.o
  AR      drivers/pmdomain/sunxi/built-in.a
  AR      drivers/pmdomain/tegra/built-in.a
  AR      drivers/pmdomain/thead/built-in.a
  AR      drivers/pmdomain/ti/built-in.a
  AR      drivers/pmdomain/xilinx/built-in.a
  CC      drivers/pmdomain/core.o
  CC      drivers/acpi/acpica/pstree.o
  CC      lib/rhashtable.o
  CC [M]  net/netfilter/nf_nat_ovs.o
  CC      mm/swap_cgroup.o
  CC [M]  drivers/dma/dw/acpi.o
  CC [M]  drivers/dma/dw-edma/dw-hdma-v0-debugfs.o
  CC      kernel/exec_domain.o
  CC      net/handshake/genl.o
  CC [M]  fs/nls/nls_cp857.o
  CC      drivers/acpi/acpica/psutils.o
  CC      net/ncsi/ncsi-manage.o
  CC      kernel/bpf/disasm.o
  CC [M]  sound/soc/soc-jack.o
  CC [M]  drivers/dma/ioat/prep.o
  CC      arch/x86/kernel/ftrace.o
  CC      kernel/trace/trace_event_perf.o
  CC [M]  drivers/dma/sf-pdma/sf-pdma.o
  CC [M]  net/llc/llc_core.o
  CC      drivers/acpi/acpica/pswalk.o
  CC [M]  net/llc/llc_input.o
  CC      drivers/virtio/virtio.o
  CC [M]  drivers/dma/dw-edma/dw-edma-pcie.o
  CC [M]  fs/nls/nls_cp860.o
  CC [M]  arch/x86/kvm/mmu/spte.o
  CC      net/mctp/route.o
  CC      drivers/virtio/virtio_ring.o
  CC [M]  drivers/dma/dw/platform.o
  CC      drivers/acpi/acpica/psxface.o
  CC      kernel/bpf/mprog.o
  CC [M]  fs/nls/nls_cp861.o
  CC      net/ipv6/exthdrs.o
  CC      net/handshake/netlink.o
  AS      arch/x86/kernel/ftrace_64.o
  CC [M]  drivers/dma/ioat/dca.o
  CC [M]  net/netfilter/nf_nat_amanda.o
  LD [M]  drivers/dma/dw-edma/dw-edma.o
  CC [M]  net/netfilter/nf_nat_ftp.o
  CC      drivers/acpi/acpica/rsaddr.o
  CC      net/ipv4/raw.o
  CC      lib/base64.o
  CC [M]  sound/soc/soc-utils.o
  CC [M]  drivers/dma/dw/pci.o
  CC      lib/once.o
  CC      arch/x86/kernel/trace_clock.o
  CC      drivers/pmdomain/governor.o
  CC [M]  fs/nls/nls_cp862.o
  CC      kernel/trace/trace_events_filter.o
  CC      net/mctp/neigh.o
  CC [M]  sound/soc/soc-dai.o
  CC      drivers/acpi/acpica/rscalc.o
  CC      arch/x86/kernel/trace.o
  CC      kernel/trace/trace_events_trigger.o
  CC [M]  net/llc/llc_output.o
  CC      kernel/bpf/trampoline.o
  CC [M]  drivers/dma/ioat/sysfs.o
  LD [M]  drivers/dma/dw/dw_dmac_core.o
  CC      kernel/panic.o
  CC      lib/refcount.o
  CC [M]  fs/nls/nls_cp863.o
  AR      drivers/pmdomain/built-in.a
  CC      drivers/acpi/acpica/rscreate.o
  CC [M]  fs/nls/nls_cp864.o
  LD [M]  drivers/dma/dw/dw_dmac.o
  LD [M]  drivers/dma/dw/dw_dmac_pci.o
  CC [M]  fs/nls/nls_cp865.o
  CC [M]  fs/nls/nls_cp866.o
  CC [M]  net/netfilter/nf_nat_irc.o
  CC      kernel/trace/trace_eprobe.o
  CC      net/ncsi/ncsi-netlink.o
  LD [M]  drivers/dma/ioat/ioatdma.o
  CC      drivers/dma/dmaengine.o
  CC [M]  arch/x86/kvm/mmu/tdp_iter.o
  CC      mm/hugetlb_cgroup.o
  CC      lib/rcuref.o
  CC [M]  net/netfilter/nf_nat_sip.o
  CC      net/handshake/request.o
  CC      arch/x86/kernel/rethook.o
  CC [M]  net/netfilter/nf_nat_tftp.o
  CC      drivers/xen/events/events_base.o
  CC      drivers/virtio/virtio_anchor.o
  AR      net/mctp/built-in.a
  CC      drivers/xen/xenbus/xenbus_client.o
  CC      arch/x86/kernel/vmcore_info_64.o
  CC [M]  sound/soc/soc-component.o
  CC      drivers/acpi/acpica/rsdumpinfo.o
  CC [M]  fs/nls/nls_cp869.o
  CC      lib/usercopy.o
  CC [M]  net/llc/llc_if.o
  CC      kernel/bpf/btf.o
  CC      kernel/cpu.o
  CC      drivers/xen/xenbus/xenbus_comms.o
  CC      drivers/acpi/acpica/rsinfo.o
  CC      net/ipv4/udp.o
  CC      drivers/virtio/virtio_pci_modern_dev.o
  CC      net/ipv6/datagram.o
  CC      drivers/xen/events/events_2l.o
  CC      arch/x86/kernel/machine_kexec_64.o
  CC      drivers/acpi/osl.o
  CC [M]  arch/x86/kvm/mmu/tdp_mmu.o
  CC [M]  fs/nls/nls_cp874.o
  CC      mm/memory-failure.o
  AR      net/ncsi/built-in.a
  CC      kernel/trace/trace_events_inject.o
  CC [M]  sound/soc/soc-pcm.o
  CC      lib/errseq.o
  AS      arch/x86/kernel/relocate_kernel_64.o
  CC [M]  net/llc/llc_c_ev.o
  CC      drivers/acpi/acpica/rsio.o
  CC      kernel/exit.o
  CC      lib/bucket_locks.o
  CC [M]  net/netfilter/nf_synproxy_core.o
  CC      drivers/dma/virt-dma.o
  CC      drivers/acpi/acpica/rsirq.o
  AR      drivers/xen/xen-pciback/built-in.a
  CC [M]  drivers/xen/xen-pciback/pci_stub.o
  CC      drivers/xen/xenbus/xenbus_xs.o
  CC      drivers/virtio/virtio_pci_legacy_dev.o
  CC      lib/generic-radix-tree.o
  CC [M]  fs/nls/nls_cp932.o
  CC      arch/x86/kernel/kexec-bzimage64.o
  CC      drivers/acpi/acpica/rslist.o
  CC      kernel/trace/trace_events_synth.o
  CC      drivers/xen/events/events_fifo.o
  CC      drivers/acpi/acpica/rsmemory.o
  CC [M]  net/netfilter/nf_conncount.o
  CC [M]  net/llc/llc_c_ac.o
  CC [M]  fs/nls/nls_euc-jp.o
  CC      drivers/dma/acpi-dma.o
  CC      lib/bitmap-str.o
  CC      drivers/virtio/virtio_mmio.o
  CC      kernel/softirq.o
  CC [M]  drivers/xen/xenfs/super.o
  CC      arch/x86/kernel/crash_dump_64.o
  CC      net/handshake/tlshd.o
  CC      drivers/acpi/acpica/rsmisc.o
  CC      kernel/resource.o
  CC      drivers/xen/xenbus/xenbus_probe.o
  CC [M]  drivers/xen/xen-pciback/pciback_ops.o
  AR      drivers/xen/events/built-in.a
  CC      mm/kmemleak.o
  CC      net/ipv6/ip6_flowlabel.o
  CC [M]  fs/nls/nls_cp936.o
  CC [M]  arch/x86/kvm/hyperv.o
  CC [M]  drivers/xen/xenfs/xenstored.o
  CC      arch/x86/kernel/crash.o
  CC      drivers/acpi/acpica/rsserial.o
  CC      drivers/virtio/virtio_pci_modern.o
  CC [M]  sound/soc/soc-devres.o
  CC [M]  drivers/xen/xen-pciback/xenbus.o
  CC      lib/string_helpers.o
  CC      drivers/regulator/core.o
  CC      fs/ntfs3/attrib.o
  CC      net/ipv6/inet6_connection_sock.o
  CC [M]  fs/nls/nls_cp949.o
  CC [M]  drivers/dma/altera-msgdma.o
  CC [M]  net/llc/llc_conn.o
  CC      drivers/xen/cpu_hotplug.o
  CC [M]  drivers/xen/xenfs/xensyms.o
  CC      drivers/acpi/acpica/rsutils.o
  CC      kernel/trace/trace_events_hist.o
  CC      arch/x86/kernel/module.o
  CC      drivers/xen/xenbus/xenbus_probe_backend.o
  CC [M]  fs/nls/nls_cp950.o
  CC      net/handshake/trace.o
  CC      drivers/acpi/acpica/rsxface.o
  CC [M]  net/netfilter/nf_dup_netdev.o
  CC [M]  drivers/xen/xen-pciback/conf_space.o
  CC      drivers/xen/xenbus/xenbus_dev_frontend.o
  CC      net/ipv4/udplite.o
  CC [M]  drivers/dma/idma64.o
  LD [M]  drivers/xen/xenfs/xenfs.o
  CC [M]  sound/soc/soc-ops.o
  CC      kernel/bpf/memalloc.o
  CC      drivers/acpi/utils.o
  CC      mm/page_isolation.o
  CC      arch/x86/kernel/kgdb.o
  CC      drivers/virtio/virtio_pci_common.o
  CC      net/ipv6/udp_offload.o
  CC [M]  fs/nls/nls_cp1250.o
  CC [M]  net/llc/llc_c_st.o
  CC      fs/ntfs3/attrlist.o
  CC      drivers/acpi/acpica/tbdata.o
  CC      lib/hexdump.o
  CC [M]  drivers/xen/xen-pciback/conf_space_header.o
  CC      drivers/virtio/virtio_pci_legacy.o
  CC [M]  drivers/dma/plx_dma.o
  CC      mm/zpool.o
  CC      lib/kstrtox.o
  CC [M]  fs/nls/nls_cp1251.o
  CC [M]  fs/nls/nls_ascii.o
  CC      drivers/xen/xenbus/xenbus_dev_backend.o
  CC      drivers/virtio/virtio_pci_admin_legacy_io.o
  AR      net/handshake/built-in.a
  CC      drivers/acpi/acpica/tbfadt.o
  CC      drivers/virtio/virtio_balloon.o
  AR      drivers/reset/amlogic/built-in.a
  CC      arch/x86/kernel/early_printk.o
  AR      drivers/reset/hisilicon/built-in.a
  CC      kernel/bpf/rqspinlock.o
  CC      fs/ntfs3/bitfunc.o
  CC [M]  sound/soc/soc-link.o
  AR      drivers/reset/starfive/built-in.a
  CC      arch/x86/kernel/hpet.o
  AR      drivers/reset/sti/built-in.a
  AR      drivers/reset/tegra/built-in.a
  CC      drivers/reset/core.o
  CC [M]  net/llc/llc_pdu.o
  CC      lib/debug_info.o
  CC      net/ipv6/seg6.o
  CC [M]  net/netfilter/nf_tables_core.o
  CC [M]  arch/x86/kvm/xen.o
  CC      lib/iomap.o
  CC      drivers/regulator/dummy.o
  CC [M]  drivers/xen/xen-pciback/conf_space_capability.o
  CC      net/ipv4/udp_offload.o
  CC      drivers/acpi/acpica/tbfind.o
  CC      net/ipv6/fib6_notifier.o
  AR      drivers/dma/built-in.a
  CC [M]  net/tls/tls_main.o
  CC      mm/zsmalloc.o
  CC      drivers/xen/xenbus/xenbus_probe_frontend.o
  CC [M]  fs/nls/nls_iso8859-1.o
  CC [M]  drivers/virtio/virtio_input.o
  CC      fs/ntfs3/bitmap.o
  CC      drivers/acpi/acpica/tbinstal.o
  CC      drivers/reset/reset-simple.o
  CC      kernel/trace/trace_events_user.o
  CC [M]  net/netfilter/nf_tables_api.o
  CC [M]  drivers/xen/xen-pciback/conf_space_quirks.o
  CC [M]  sound/soc/soc-card.o
  CC      fs/udf/balloc.o
  CC [M]  net/llc/llc_sap.o
  CC [M]  fs/nls/nls_iso8859-2.o
  CC      drivers/acpi/acpica/tbprint.o
  CC      drivers/regulator/fixed-helper.o
  CC      kernel/sysctl.o
  CC      kernel/bpf/arena.o
  CC      drivers/xen/grant-table.o
  CC      arch/x86/kernel/amd_nb.o
  CC      net/ipv6/rpl.o
  CC [M]  drivers/reset/reset-gpio.o
  CC [M]  drivers/virtio/virtio_vdpa.o
  CC      drivers/acpi/acpica/tbutils.o
  CC      lib/iomap_copy.o
  CC [M]  fs/nls/nls_iso8859-3.o
  CC [M]  drivers/xen/xen-pciback/vpci.o
  CC [M]  sound/soc/soc-compress.o
  CC [M]  arch/x86/kvm/smm.o
  AR      drivers/xen/xenbus/built-in.a
  CC      mm/early_ioremap.o
  CC      drivers/regulator/helpers.o
  CC      fs/udf/dir.o
  CC      lib/devres.o
  CC      drivers/acpi/acpica/tbxface.o
  CC      net/ipv4/arp.o
  CC [M]  drivers/virtio/virtio_mem.o
  CC [M]  drivers/reset/reset-ti-syscon.o
  CC [M]  net/llc/llc_s_ac.o
  CC [M]  fs/nls/nls_iso8859-4.o
  CC [M]  net/tls/tls_sw.o
  CC      arch/x86/kernel/amd_node.o
  CC      fs/ntfs3/dir.o
  CC      kernel/bpf/range_tree.o
  CC [M]  drivers/virtio/virtio_dma_buf.o
  CC      net/ipv6/ioam6.o
  CC      kernel/trace/bpf_trace.o
  CC [M]  net/llc/llc_s_ev.o
  CC [M]  drivers/xen/xen-pciback/passthrough.o
  CC      mm/numa.o
  CC      fs/udf/file.o
  CC      drivers/acpi/acpica/tbxfload.o
  CC      lib/check_signature.o
  CC [M]  fs/nls/nls_iso8859-5.o
  CC [M]  drivers/reset/reset-tps380x.o
  CC [M]  net/tls/tls_proc.o
  CC [M]  net/llc/llc_s_st.o
  CC [M]  sound/soc/soc-generic-dmaengine-pcm.o
  CC      lib/interval_tree.o
  CC      kernel/bpf/dispatcher.o
  CC      drivers/regulator/devres.o
  CC [M]  net/netfilter/nft_chain_filter.o
  CC [M]  fs/nls/nls_iso8859-6.o
  LD [M]  drivers/xen/xen-pciback/xen-pciback.o
  CC      drivers/xen/features.o
  AR      drivers/reset/built-in.a
  CC      fs/udf/ialloc.o
  CC [M]  arch/x86/kvm/kvm_onhyperv.o
  CC      kernel/bpf/devmap.o
  CC      kernel/trace/trace_kprobe.o
  CC [M]  net/key/af_key.o
  CC      mm/numa_memblks.o
  CC      lib/assoc_array.o
  CC      arch/x86/kernel/kvm.o
  CC      mm/balloon_compaction.o
  CC      drivers/acpi/acpica/tbxfroot.o
  CC      fs/ntfs3/fsntfs.o
  AR      drivers/virtio/built-in.a
  CC      net/ipv6/sysctl_net_ipv6.o
  CC [M]  fs/nls/nls_iso8859-7.o
  CC [M]  net/llc/af_llc.o
  CC      fs/udf/inode.o
  CC      drivers/acpi/acpica/utaddress.o
  CC      drivers/acpi/reboot.o
  CC      mm/secretmem.o
  CC [M]  sound/soc/soc-ac97.o
  CC [M]  net/llc/llc_station.o
  CC      drivers/xen/balloon.o
  CC [M]  fs/nls/nls_cp1255.o
  CC      net/ipv4/icmp.o
  CC      drivers/acpi/acpica/utalloc.o
  CC      drivers/regulator/irq_helpers.o
  AR      fs/hostfs/built-in.a
  CC      kernel/capability.o
  CC      lib/list_debug.o
  CC [M]  net/bridge/netfilter/nft_meta_bridge.o
  CC [M]  arch/x86/kvm/vmx/vmx.o
  CC [M]  net/tls/trace.o
  CC      kernel/bpf/cpumap.o
  CC      net/ipv6/ip6mr.o
  CC      fs/ntfs3/frecord.o
  CC      arch/x86/kernel/kvmclock.o
  CC [M]  fs/nls/nls_iso8859-9.o
  CC      drivers/acpi/acpica/utascii.o
  CC      net/ipv4/devinet.o
  CC      mm/userfaultfd.o
  CC      lib/debugobjects.o
  CC [M]  net/llc/llc_proc.o
  CC      drivers/tty/vt/vt_ioctl.o
  CC      drivers/acpi/acpica/utbuffer.o
  LD [M]  sound/soc/snd-soc-acpi.o
  LD [M]  sound/soc/snd-soc-core.o
  CC [M]  fs/nls/nls_iso8859-13.o
  CC [M]  net/netfilter/nf_tables_trace.o
  CC      drivers/tty/hvc/hvc_console.o
  CC [M]  fs/nls/nls_iso8859-14.o
  CC      fs/udf/lowlevel.o
  CC      drivers/regulator/event.o
  CC      drivers/xen/manage.o
  CC      drivers/acpi/acpica/utcksum.o
  CC      kernel/trace/error_report-traces.o
  CC [M]  net/bridge/netfilter/nft_reject_bridge.o
  CC [M]  net/tls/tls_strp.o
  CC      kernel/trace/power-traces.o
  CC [M]  net/netfilter/nft_immediate.o
  CC [M]  drivers/regulator/fixed.o
  CC      arch/x86/kernel/paravirt.o
  CC      drivers/acpi/acpica/utcopy.o
  CC [M]  fs/nls/nls_iso8859-15.o
  CC [M]  net/llc/sysctl_net_llc.o
  CC      kernel/bpf/offload.o
  CC      lib/bitrev.o
  CC      fs/udf/namei.o
  CC      drivers/tty/vt/vc_screen.o
  CC      drivers/acpi/acpica/utexcep.o
  CC      drivers/tty/hvc/hvc_irq.o
  CC [M]  fs/nls/nls_koi8-r.o
  CC [M]  net/tls/tls_device.o
  CC [M]  drivers/regulator/virtual.o
  CC      fs/ntfs3/file.o
  CC      drivers/xen/time.o
  CC      mm/page_idle.o
  CC      kernel/bpf/net_namespace.o
  CC [M]  net/bridge/netfilter/nf_conntrack_bridge.o
  CC [M]  drivers/regulator/userspace-consumer.o
  LD [M]  net/llc/llc.o
  CC      fs/debugfs/inode.o
  CC      lib/linear_ranges.o
  CC [M]  fs/nls/nls_koi8-u.o
  CC      drivers/tty/hvc/hvc_xen.o
  LD [M]  net/llc/llc2.o
  CC      net/ipv4/af_inet.o
  CC      fs/udf/partition.o
  CC      net/ipv4/igmp.o
  CC      drivers/acpi/acpica/utdebug.o
  CC      arch/x86/kernel/paravirt-spinlocks.o
  CC      drivers/tty/vt/selection.o
  CC      lib/packing.o
  CC      drivers/acpi/nvs.o
  CC      arch/x86/kernel/pvclock.o
  CC      drivers/xen/mem-reservation.o
  CC [M]  fs/nls/nls_koi8-ru.o
  CC [M]  net/netfilter/nft_cmp.o
  CC      arch/x86/kernel/pmem.o
  CC      mm/usercopy.o
  CC [M]  drivers/regulator/88pg86x.o
  CC      net/ipv6/xfrm6_policy.o
  CC      drivers/acpi/acpica/utdecode.o
  CC      fs/udf/super.o
  CC [M]  net/sunrpc/auth_gss/auth_gss.o
  CC      mm/memremap.o
  CC      fs/ntfs3/fslog.o
  CC      kernel/trace/rpm-traces.o
  AR      drivers/tty/hvc/built-in.a
  CC [M]  net/sunrpc/auth_gss/gss_mech_switch.o
  CC [M]  fs/nls/nls_utf8.o
  CC [M]  net/sunrpc/auth_gss/svcauth_gss.o
  CC      kernel/bpf/tcx.o
  CC      arch/x86/kvm/kvm-asm-offsets.s
  CC      fs/debugfs/file.o
  CC      drivers/acpi/acpica/utdelete.o
  CC [M]  net/bridge/netfilter/ebtables.o
  CC      drivers/tty/vt/keyboard.o
  CC [M]  drivers/regulator/88pm800-regulator.o
  CC      arch/x86/kernel/jailhouse.o
  CC [M]  net/netfilter/nft_range.o
  CC [M]  fs/nls/mac-celtic.o
  CC      lib/crc-ccitt.o
  CC      mm/hmm.o
  CC      drivers/xen/pci.o
  CC      drivers/acpi/acpica/uterror.o
  CC      fs/udf/truncate.o
  CC      net/ipv6/xfrm6_state.o
  CC [M]  drivers/regulator/88pm8607.o
  CC [M]  net/tls/tls_device_fallback.o
  CC      kernel/bpf/stackmap.o
  CC [M]  fs/nls/mac-centeuro.o
  CC      drivers/acpi/acpica/uteval.o
  CC      arch/x86/kernel/pcspeaker.o
  CC      kernel/bpf/cgroup_iter.o
  CC [M]  net/kcm/kcmsock.o
  CC      kernel/trace/trace_kdb.o
  CC      lib/crc16.o
  CC      drivers/acpi/acpica/utglobal.o
  CC [M]  net/netfilter/nft_bitwise.o
  CC      fs/udf/symlink.o
  CC [M]  fs/nls/mac-croatian.o
  CC      net/ipv4/fib_frontend.o
  CC [M]  drivers/regulator/aat2870-regulator.o
  CC      arch/x86/kernel/check.o
  CC [M]  net/kcm/kcmproc.o
  CC      drivers/tty/serial/8250/8250_core.o
  CC      net/ipv6/xfrm6_input.o
  AR      fs/debugfs/built-in.a
  CC [M]  drivers/tty/serial/jsm/jsm_driver.o
  CC      drivers/xen/dbgp.o
  CC [M]  drivers/tty/serial/jsm/jsm_neo.o
  CC [M]  fs/nls/mac-cyrillic.o
  CC      drivers/acpi/acpica/uthex.o
  CC      mm/memfd.o
  CC      drivers/char/hw_random/core.o
  CC      kernel/trace/trace_dynevent.o
  CC      kernel/bpf/bpf_cgrp_storage.o
  CC      fs/udf/directory.o
  CC      lib/crc-t10dif.o
  CC [M]  net/sunrpc/auth_gss/gss_rpc_upcall.o
  CC      arch/x86/kernel/uprobes.o
  CC [M]  drivers/regulator/act8865-regulator.o
  CC      drivers/acpi/acpica/utids.o
  CC      drivers/tty/vt/vt.o
  CC      drivers/char/agp/backend.o
  CC [M]  fs/nls/mac-gaelic.o
  CC      drivers/xen/acpi.o
  CC [M]  net/bridge/netfilter/ebtable_broute.o
  CC      drivers/tty/serial/serial_core.o
  LD [M]  net/kcm/kcm.o
  CC      drivers/acpi/acpica/utinit.o
  CC [M]  drivers/char/hw_random/timeriomem-rng.o
  CC [M]  drivers/tty/serial/jsm/jsm_tty.o
  CC      fs/udf/misc.o
  LD [M]  net/tls/tls.o
  CC      mm/ptdump.o
  CC      lib/crc-itu-t.o
  CC      drivers/char/agp/generic.o
  CC [M]  net/netfilter/nft_byteorder.o
  CC [M]  fs/nls/mac-greek.o
  CC      drivers/xen/xen-acpi-pad.o
  CC [M]  drivers/regulator/ad5398.o
  CC      fs/ntfs3/inode.o
  CC      arch/x86/kernel/perf_regs.o
  CC      drivers/acpi/acpica/utlock.o
  CC [M]  net/sunrpc/auth_gss/gss_rpc_xdr.o
  CC      kernel/trace/trace_probe.o
  CC [M]  drivers/char/hw_random/intel-rng.o
  CC [M]  fs/nls/mac-iceland.o
  CC      mm/page_reporting.o
  CC      drivers/acpi/acpica/utmath.o
  CC      drivers/tty/serial/8250/8250_platform.o
  CC      kernel/bpf/cgroup.o
  CC      fs/udf/udftime.o
  CC [M]  net/l2tp/l2tp_core.o
  CC      net/ipv6/xfrm6_output.o
  CC      fs/tracefs/inode.o
  HOSTCC  lib/gen_crc32table
  CC [M]  net/bridge/netfilter/ebtable_filter.o
  CC [M]  drivers/tty/serial/jsm/jsm_cls.o
  CC      drivers/xen/pcpu.o
  CC [M]  drivers/regulator/arizona-ldo1.o
  HOSTCC  lib/gen_crc64table
  CC      arch/x86/kernel/tracepoint.o
  CC [M]  net/netfilter/nft_payload.o
  CC      net/ipv4/fib_semantics.o
  CC      lib/xxhash.o
  CC      drivers/acpi/acpica/utmisc.o
  CC [M]  fs/nls/mac-inuit.o
  CC      fs/udf/unicode.o
  CC      drivers/char/agp/isoch.o
  CC [M]  net/sunrpc/auth_gss/trace.o
  CC      drivers/acpi/acpica/utmutex.o
  CC      arch/x86/kernel/itmt.o
  CC      fs/ntfs3/index.o
  CC [M]  drivers/char/hw_random/amd-rng.o
  CC [M]  fs/nls/mac-romanian.o
  CC      drivers/xen/biomerge.o
  CC [M]  drivers/regulator/arizona-micsupp.o
  CC      fs/tracefs/event_inode.o
  CC [M]  net/bridge/netfilter/ebtable_nat.o
  CC      drivers/tty/serial/8250/8250_pnp.o
  CC      kernel/trace/trace_uprobe.o
  CC [M]  arch/x86/kvm/vmx/pmu_intel.o
  CC      drivers/acpi/acpica/utnonansi.o
  CC      mm/bootmem_info.o
  CC      lib/genalloc.o
  CC      net/ipv6/xfrm6_protocol.o
  LD [M]  drivers/tty/serial/jsm/jsm.o
  CC      lib/textsearch.o
  AR      fs/udf/built-in.a
  CC      drivers/tty/serial/8250/8250_rsa.o
  COPY    drivers/tty/vt/defkeymap.c
  CC      drivers/tty/vt/consolemap.o
  CC      drivers/char/agp/amd64-agp.o
  CC [M]  fs/nls/mac-roman.o
  CC [M]  drivers/char/hw_random/ba431-rng.o
  CC [M]  net/netfilter/nft_lookup.o
  CC      drivers/xen/xen-balloon.o
  CC      drivers/acpi/acpica/utobject.o
  CC [M]  drivers/char/tpm/st33zp24/st33zp24.o
  CC [M]  drivers/regulator/as3711-regulator.o
  CC      arch/x86/kernel/umip.o
  CC      drivers/char/tpm/tpm-chip.o
  CC [M]  net/bridge/netfilter/ebt_802_3.o
  AR      fs/tracefs/built-in.a
  CC [M]  net/sunrpc/clnt.o
  CC      drivers/tty/serial/8250/8250_port.o
  CC [M]  fs/nls/mac-turkish.o
  CC [M]  drivers/char/hw_random/via-rng.o
  CC      drivers/acpi/acpica/utosi.o
  CC      mm/execmem.o
  CC      fs/ntfs3/lznt.o
  CC      drivers/char/agp/intel-agp.o
  CC      lib/percpu_counter.o
  CC [M]  arch/x86/kvm/vmx/vmcs12.o
  CC [M]  net/l2tp/l2tp_ip.o
  CC [M]  drivers/regulator/atc260x-regulator.o
  CC      drivers/xen/sys-hypervisor.o
  CC      kernel/bpf/reuseport_array.o
  CC      drivers/acpi/acpica/utownerid.o
  HOSTCC  drivers/tty/vt/conmakehash
  CC      arch/x86/kernel/unwind_frame.o
  CC [M]  drivers/char/hw_random/virtio-rng.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_mech.o
  CC      drivers/tty/vt/defkeymap.o
  CC [M]  fs/nls/nls_ucs2_utils.o
  CC      kernel/trace/trace_boot.o
  CC [M]  net/bridge/netfilter/ebt_among.o
  CC      fs/ntfs3/namei.o
  CC      mm/shmem_quota.o
  CC [M]  drivers/char/tpm/st33zp24/i2c.o
  CONMK   drivers/tty/vt/consolemap_deftbl.c
  CC      kernel/bpf/bpf_struct_ops.o
  CC      drivers/tty/vt/consolemap_deftbl.o
  CC      arch/x86/kernel/callthunks.o
  CC      drivers/acpi/acpica/utpredef.o
  CC      net/ipv6/netfilter.o
  CC      drivers/char/agp/intel-gtt.o
  CC      net/ipv4/fib_trie.o
  AR      drivers/tty/vt/built-in.a
  CC      drivers/tty/serial/serial_base_bus.o
  CC [M]  drivers/regulator/aw37503-regulator.o
  CC [M]  arch/x86/kvm/vmx/nested.o
  CC      drivers/xen/platform-pci.o
  CC [M]  drivers/char/hw_random/xiphera-trng.o
  CC [M]  net/netfilter/nft_dynset.o
  CC      lib/iommu-helper.o
  CC      drivers/acpi/acpica/utresdecode.o
  CC      lib/fault-inject.o
  CC      fs/ntfs3/record.o
  CC      drivers/char/agp/via-agp.o
  CC      drivers/iommu/amd/iommu.o
  CC [M]  drivers/char/tpm/st33zp24/spi.o
  LD [M]  drivers/char/tpm/st33zp24/tpm_st33zp24.o
  CC      mm/pt_reclaim.o
  CC      arch/x86/kernel/cet.o
  AR      drivers/gpu/host1x/built-in.a
  AR      fs/nls/built-in.a
  CC [M]  mm/hwpoison-inject.o
  AR      drivers/char/hw_random/built-in.a
  CC      drivers/tty/serial/serial_ctrl.o
  CC [M]  net/bridge/netfilter/ebt_arp.o
  AR      drivers/gpu/drm/tests/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_kunit_helpers.o
  CC [M]  drivers/regulator/axp20x-regulator.o
  CC      drivers/acpi/acpica/utresrc.o
  CC      drivers/tty/serial/8250/8250_dma.o
  CC      kernel/bpf/cpumask.o
  CC      kernel/trace/fprobe.o
  CC      net/ipv4/fib_notifier.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_seal.o
  CC      drivers/acpi/acpica/utstate.o
  CC      drivers/xen/swiotlb-xen.o
  CC      lib/error-inject.o
  CC [M]  net/l2tp/l2tp_netlink.o
  CC [M]  drivers/char/agp/sis-agp.o
  CC [M]  net/netfilter/nft_meta.o
  CC      fs/ntfs3/run.o
  LD [M]  drivers/char/tpm/st33zp24/tpm_st33zp24_i2c.o
  LD [M]  drivers/char/tpm/st33zp24/tpm_st33zp24_spi.o
  CC      drivers/char/tpm/tpm-dev-common.o
  AR      drivers/gpu/drm/arm/built-in.a
  CC      drivers/acpi/acpica/utstring.o
  CC      drivers/char/tpm/tpm-dev.o
  CC      arch/x86/kernel/shstk.o
  AR      mm/built-in.a
  CC [M]  drivers/regulator/bcm590xx-regulator.o
  CC [M]  drivers/gpu/drm/tests/drm_atomic_test.o
  CC [M]  net/bridge/netfilter/ebt_ip.o
  CC [M]  drivers/gpu/drm/tests/drm_atomic_state_test.o
  CC      drivers/acpi/acpica/utstrsuppt.o
  CC      net/ipv6/fib6_rules.o
  CC [M]  net/l2tp/l2tp_eth.o
  AR      drivers/char/agp/built-in.a
  CC      net/ipv4/inet_fragment.o
  CC      kernel/bpf/bpf_lsm.o
  CC      kernel/ptrace.o
  CC      drivers/char/tpm/tpm-interface.o
  CC      drivers/tty/serial/8250/8250_dwlib.o
  CC      drivers/acpi/wakeup.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_unseal.o
  CC      drivers/acpi/acpica/utstrtoul64.o
  CC      drivers/gpu/drm/clients/drm_client_setup.o
  CC [M]  drivers/regulator/bd9571mwv-regulator.o
  CC      fs/ntfs3/super.o
  CC      lib/syscall.o
  CC      arch/x86/kernel/audit_64.o
  CC      lib/dynamic_debug.o
  CC [M]  drivers/gpu/drm/tests/drm_bridge_test.o
  CC      drivers/acpi/acpica/utxface.o
  CC [M]  net/bridge/netfilter/ebt_ip6.o
  CC      drivers/xen/mcelog.o
  CC      kernel/trace/rethook.o
  CC [M]  net/dccp/ccid.o
  CC      arch/x86/kernel/amd_gart_64.o
  CC      drivers/char/tpm/tpm1-cmd.o
  CC      drivers/iommu/amd/init.o
  CC [M]  drivers/regulator/da903x-regulator.o
  CC [M]  drivers/gpu/drm/tests/drm_buddy_test.o
  CC [M]  net/l2tp/l2tp_debugfs.o
  CC [M]  net/netfilter/nft_rt.o
  CC      drivers/gpu/drm/clients/drm_fbdev_client.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_wrap.o
  CC      net/ipv4/ping.o
  CC [M]  net/l2tp/l2tp_ip6.o
  CC      drivers/tty/serial/8250/8250_fintek.o
  CC      kernel/bpf/crypto.o
  CC      drivers/acpi/acpica/utxfinit.o
  CC [M]  arch/x86/kvm/vmx/posted_intr.o
  CC      drivers/xen/xen-acpi-processor.o
  CC [M]  net/netfilter/nft_exthdr.o
  CC      drivers/acpi/acpica/utxferror.o
  CC      net/ipv6/proc.o
  CC [M]  drivers/regulator/da9052-regulator.o
  CC [M]  net/bridge/netfilter/ebt_limit.o
  CC      arch/x86/kernel/aperture_64.o
  AR      drivers/gpu/drm/clients/built-in.a
  CC      kernel/trace/trace_fprobe.o
  CC      drivers/acpi/acpica/utxfmutex.o
  CC [M]  drivers/gpu/drm/tests/drm_cmdline_parser_test.o
  CC [M]  net/dccp/feat.o
  CC      drivers/tty/serial/8250/8250_pcilib.o
  CC      drivers/char/tpm/tpm2-cmd.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_crypto.o
  CC      drivers/acpi/acpica/dbcmds.o
  CC      drivers/iommu/intel/dmar.o
  CC      kernel/bpf/relo_core.o
  CC      fs/ntfs3/upcase.o
  CC      lib/errname.o
  CC      drivers/xen/efi.o
  CC [M]  net/sctp/sm_statetable.o
  CC      lib/nlattr.o
  CC [M]  net/rds/af_rds.o
  CC [M]  drivers/regulator/da9055-regulator.o
  CC      drivers/iommu/amd/quirks.o
  CC      arch/x86/kernel/mmconf-fam10h_64.o
  CC      kernel/bpf/btf_iter.o
  CC      drivers/acpi/acpica/dbconvert.o
  CC [M]  net/bridge/netfilter/ebt_mark_m.o
  CC      net/ipv4/ip_tunnel_core.o
  CC      fs/ntfs3/xattr.o
  CC [M]  net/netfilter/nft_last.o
  CC      drivers/tty/serial/8250/8250_early.o
  CC      drivers/acpi/acpica/dbdisply.o
  CC      fs/ntfs3/lib/decompress_common.o
  AR      kernel/trace/built-in.a
  CC      drivers/xen/xlate_mmu.o
  CC      drivers/char/tpm/tpmrm-dev.o
  CC      drivers/tty/serial/8250/8250_dw.o
  CC      drivers/tty/serial/8250/8250_mid.o
  CC [M]  drivers/regulator/da9062-regulator.o
  CC      arch/x86/kernel/vsmp_64.o
  CC      drivers/acpi/sleep.o
  CC      net/ipv6/syncookies.o
  CC [M]  net/sctp/sm_statefuns.o
  CC [M]  arch/x86/kvm/vmx/main.o
  CC      kernel/bpf/btf_relocate.o
  CC [M]  drivers/gpu/drm/tests/drm_connector_test.o
  CC      drivers/xen/unpopulated-alloc.o
  CC [M]  net/bridge/netfilter/ebt_pkttype.o
  CC      drivers/iommu/amd/io_pgtable.o
  CC      drivers/acpi/acpica/dbexec.o
  CC [M]  net/rds/bind.o
  CC [M]  drivers/char/mwave/mwavedd.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_keys.o
  CC      drivers/char/tpm/tpm2-space.o
  CC      lib/cpu_rmap.o
  CC [M]  arch/x86/kernel/msr.o
  LD [M]  net/sunrpc/auth_gss/auth_rpcgss.o
  CC      drivers/char/tpm/tpm-sysfs.o
  CC [M]  drivers/regulator/da9210-regulator.o
  CC      fs/ntfs3/lib/lzx_decompress.o
  CC [M]  net/dccp/input.o
  CC      drivers/acpi/acpica/dbhistry.o
  CC [M]  net/netfilter/nft_counter.o
  CC      drivers/tty/serial/8250/8250_pci.o
  CC [M]  arch/x86/kvm/vmx/sgx.o
  CC      drivers/iommu/intel/iommu.o
  CC [M]  drivers/char/mwave/smapi.o
  CC      lib/closure.o
  CC [M]  net/bridge/netfilter/ebt_stp.o
  CC      drivers/iommu/amd/io_pgtable_v2.o
  CC      drivers/xen/grant-dma-ops.o
  CC      drivers/acpi/acpica/dbinput.o
  CC      fs/ntfs3/lib/xpress_decompress.o
  CC [M]  arch/x86/kernel/cpuid.o
  CC [M]  net/bridge/br.o
  CC [M]  net/bridge/br_device.o
  CC      kernel/bpf/kmem_cache_iter.o
  CC [M]  drivers/regulator/da9211-regulator.o
  CC      drivers/char/tpm/eventlog/common.o
  CC      net/ipv4/gre_offload.o
  CC [M]  drivers/char/mwave/tp3780i.o
  CC [M]  drivers/gpu/drm/tests/drm_damage_helper_test.o
  AR      fs/ntfs3/built-in.a
  CC      net/ipv6/calipso.o
  CC      drivers/acpi/acpica/dbmethod.o
  CC      fs/btrfs/super.o
  AR      arch/x86/kernel/built-in.a
  CC [M]  net/netfilter/nft_objref.o
  AR      drivers/gpu/drm/display/built-in.a
  CC [M]  drivers/gpu/drm/display/drm_display_helper_mod.o
  LD [M]  net/sunrpc/auth_gss/rpcsec_gss_krb5.o
  CC [M]  drivers/xen/evtchn.o
  CC [M]  net/sunrpc/xprt.o
  CC [M]  arch/x86/kvm/vmx/hyperv.o
  CC [M]  net/bridge/br_fdb.o
  CC      drivers/iommu/amd/ppr.o
  AR      kernel/bpf/built-in.a
  CC      kernel/user.o
  CC [M]  net/bridge/netfilter/ebt_vlan.o
  CC      drivers/acpi/acpica/dbnames.o
  CC [M]  drivers/regulator/fan53555.o
  CC      lib/dynamic_queue_limits.o
  CC      drivers/char/tpm/eventlog/tpm1.o
  CC [M]  drivers/char/mwave/3780i.o
  CC [M]  net/rds/cong.o
  CC [M]  drivers/gpu/drm/display/drm_bridge_connector.o
  AR      arch/x86/built-in.a
  CC      lib/glob.o
  CC      drivers/tty/serial/8250/8250_rt288x.o
  CC [M]  drivers/gpu/drm/tests/drm_dp_mst_helper_test.o
  CC      drivers/acpi/acpica/dbobject.o
  CC [M]  net/dccp/minisocks.o
  CC [M]  net/sctp/sm_sideeffect.o
  CC      net/ipv4/metrics.o
  CC      drivers/iommu/amd/pasid.o
  CC      kernel/signal.o
  CC [M]  net/netfilter/nft_inner.o
  CC [M]  drivers/xen/gntdev.o
  CC [M]  drivers/regulator/gpio-regulator.o
  LD [M]  drivers/char/mwave/mwave.o
  CC      drivers/char/tpm/eventlog/tpm2.o
  CC [M]  net/bridge/br_forward.o
  CC      drivers/acpi/acpica/dbstats.o
  CC [M]  drivers/gpu/drm/tests/drm_exec_test.o
  CC      net/ipv6/seg6_iptunnel.o
  CC [M]  net/bridge/netfilter/ebt_arpreply.o
  AR      drivers/gpu/drm/renesas/rcar-du/built-in.a
  AR      drivers/gpu/drm/renesas/rz-du/built-in.a
  AR      drivers/gpu/drm/renesas/built-in.a
  CC [M]  net/sctp/protocol.o
  CC [M]  net/dccp/options.o
  CC      drivers/acpi/acpica/dbutils.o
  AR      drivers/iommu/amd/built-in.a
  CC      lib/digsig.o
  CC      drivers/connector/cn_queue.o
  CC [M]  drivers/gpu/drm/display/drm_dp_dual_mode_helper.o
  CC [M]  arch/x86/kvm/vmx/hyperv_evmcs.o
  CC [M]  drivers/regulator/isl6271a-regulator.o
  CC      drivers/char/tpm/tpm-buf.o
  CC [M]  drivers/tty/serial/8250/8250_exar.o
  CC      drivers/acpi/acpica/dbxface.o
  CC [M]  drivers/xen/gntdev-dmabuf.o
  CC [M]  net/netfilter/nft_chain_route.o
  CC [M]  drivers/gpu/drm/tests/drm_format_helper_test.o
  CC [M]  net/rds/connection.o
  CC      drivers/base/power/sysfs.o
  CC      drivers/iommu/intel/pasid.o
  CC [M]  net/bridge/netfilter/ebt_mark.o
  CC [M]  drivers/regulator/isl9305.o
  CC      drivers/connector/connector.o
  CC [M]  arch/x86/kvm/vmx/vmx_onhyperv.o
  CC      drivers/acpi/acpica/rsdump.o
  CC [M]  drivers/gpu/drm/display/drm_dp_helper.o
  CC      lib/strncpy_from_user.o
  CC      net/ipv4/netlink.o
  CC      net/ipv6/seg6_local.o
  CC [M]  drivers/tty/serial/8250/8250_lpss.o
  CC [M]  net/sunrpc/socklib.o
  CC      drivers/char/tpm/tpm2-sessions.o
  CC      fs/pstore/inode.o
  CC [M]  net/sctp/endpointola.o
  AR      drivers/acpi/acpica/built-in.a
  CC      drivers/acpi/device_sysfs.o
  CC [M]  drivers/xen/gntalloc.o
  CC [M]  net/netfilter/nf_tables_offload.o
  CC [M]  drivers/regulator/lm363x-regulator.o
  CC [M]  net/bridge/netfilter/ebt_dnat.o
  CC [M]  net/9p/mod.o
  CC      drivers/base/power/generic_ops.o
  CC [M]  drivers/gpu/drm/tests/drm_format_test.o
  CC      fs/pstore/platform.o
  CC [M]  arch/x86/kvm/svm/svm.o
  CC [M]  drivers/tty/serial/8250/8250_men_mcb.o
  CC      drivers/iommu/intel/nested.o
  CC [M]  net/dccp/output.o
  CC      lib/strnlen_user.o
  CC      kernel/sys.o
  CC [M]  drivers/regulator/lp3971.o
  CC [M]  drivers/xen/privcmd.o
  CC      drivers/char/tpm/tpm_ppi.o
  CC [M]  drivers/tty/serial/8250/8250_pci1xxxx.o
  CC      drivers/acpi/device_pm.o
  CC [M]  net/sctp/associola.o
  CC      drivers/connector/cn_proc.o
  CC [M]  net/9p/client.o
  CC      net/ipv4/nexthop.o
  CC      drivers/iommu/intel/cache.o
  CC [M]  net/bridge/netfilter/ebt_redirect.o
  CC [M]  net/netfilter/nft_set_hash.o
  CC [M]  net/rds/info.o
  CC [M]  drivers/gpu/drm/tests/drm_framebuffer_test.o
  CC [M]  net/sunrpc/xprtsock.o
  CC      drivers/iommu/intel/prq.o
  CC      fs/pstore/pmsg.o
  CC      net/ipv6/seg6_hmac.o
  CC      drivers/base/power/common.o
  CC [M]  drivers/regulator/lp3972.o
  CC      lib/net_utils.o
  CC      drivers/char/tpm/eventlog/acpi.o
  CC [M]  drivers/tty/serial/8250/8250_pericom.o
  CC [M]  drivers/gpu/drm/tests/drm_gem_shmem_test.o
  CC [M]  fs/pstore/ram.o
  AR      drivers/connector/built-in.a
  CC      drivers/gpu/vga/vga_switcheroo.o
  CC      fs/btrfs/ctree.o
  CC [M]  drivers/gpu/drm/display/drm_dp_mst_topology.o
  CC [M]  net/bridge/netfilter/ebt_snat.o
  CC [M]  drivers/regulator/lp872x.o
  AR      drivers/iommu/arm/arm-smmu/built-in.a
  CC      drivers/char/tpm/eventlog/efi.o
  AR      drivers/iommu/arm/arm-smmu-v3/built-in.a
  CC      drivers/iommu/intel/trace.o
  AR      drivers/iommu/arm/built-in.a
  CC      drivers/iommu/iommufd/iova_bitmap.o
  CC      drivers/acpi/proc.o
  AR      drivers/tty/serial/8250/built-in.a
  CC [M]  net/sctp/transport.o
  CC [M]  drivers/xen/privcmd-buf.o
  CC [M]  net/dccp/proto.o
  CC      drivers/tty/serial/serial_port.o
  CC      drivers/base/power/qos.o
  CC      lib/sg_pool.o
  CC [M]  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.o
  CC [M]  fs/pstore/ram_core.o
  CC [M]  net/netfilter/nft_set_bitmap.o
  CC      drivers/char/tpm/tpm_tis_core.o
  CC [M]  net/rds/message.o
  CC [M]  drivers/regulator/lp8788-buck.o
  CC      drivers/acpi/bus.o
  CC      kernel/umh.o
  CC [M]  net/bridge/netfilter/ebt_log.o
  UPD     arch/x86/kvm/kvm-asm-offsets.h
  CC [M]  arch/x86/kvm/svm/pmu.o
  CC [M]  net/9p/error.o
  CC      drivers/iommu/iommufd/driver.o
  CC      drivers/tty/serial/earlycon.o
  AR      drivers/gpu/vga/built-in.a
  CC      lib/memregion.o
  AR      drivers/iommu/riscv/built-in.a
  CC      drivers/tty/serdev/core.o
  CC      drivers/iommu/intel/svm.o
  CC [M]  fs/pstore/zone.o
  CC [M]  drivers/xen/xen-scsiback.o
  CC [M]  net/sunrpc/sched.o
  CC      net/ipv6/ioam6_iptunnel.o
  CC [M]  net/sctp/chunk.o
  CC [M]  drivers/regulator/lp8788-ldo.o
  CC [M]  net/netfilter/nft_set_rbtree.o
  CC      lib/irq_poll.o
  CC      drivers/tty/serial/max310x.o
  CC [M]  net/9p/protocol.o
  CC [M]  arch/x86/kvm/svm/nested.o
  CC [M]  net/bridge/netfilter/ebt_nflog.o
  CC      net/ipv4/udp_tunnel_stub.o
  CC [M]  drivers/gpu/drm/tests/drm_managed_test.o
  CC [M]  drivers/iommu/iommufd/device.o
  CC      drivers/char/tpm/tpm_tis.o
  CC      kernel/workqueue.o
  CC [M]  drivers/regulator/lp8755.o
  CC      drivers/iommu/intel/irq_remapping.o
  CC      drivers/base/power/runtime.o
  CC      fs/btrfs/extent-tree.o
  CC      drivers/tty/serdev/serdev-ttyport.o
  CC [M]  net/sctp/sm_make_chunk.o
  CC      net/ipv6/addrconf_core.o
  CC [M]  drivers/gpu/drm/tests/drm_mm_test.o
  CC [M]  net/rds/recv.o
  CC [M]  fs/pstore/blk.o
  CC [M]  net/dccp/timer.o
  CC      drivers/acpi/glue.o
  CC [M]  net/netfilter/nft_set_pipapo.o
  CC      lib/stackdepot.o
  CC      drivers/tty/serial/sccnxp.o
  CC [M]  net/9p/trans_common.o
  CC      drivers/char/tpm/tpm_crb.o
  CC [M]  net/bridge/br_if.o
  AR      drivers/tty/serdev/built-in.a
  CC      net/ipv4/sysctl_net_ipv4.o
  CC [M]  drivers/regulator/ltc3589.o
  CC [M]  drivers/gpu/drm/display/drm_dp_tunnel.o
  CC [M]  drivers/xen/pvcalls-front.o
  CC [M]  drivers/gpu/drm/tests/drm_modes_test.o
  CC [M]  drivers/gpu/drm/tests/drm_plane_helper_test.o
  CC [M]  arch/x86/kvm/svm/avic.o
  CC      drivers/iommu/intel/perfmon.o
  LD [M]  fs/pstore/ramoops.o
  LD [M]  fs/pstore/pstore_zone.o
  LD [M]  fs/pstore/pstore_blk.o
  AR      fs/pstore/built-in.a
  CC [M]  drivers/regulator/ltc3676.o
  CC [M]  drivers/char/tpm/tpm_tis_spi_main.o
  CC [M]  drivers/iommu/iommufd/eventq.o
  CC [M]  net/9p/trans_fd.o
  CC      drivers/tty/serial/serial_mctrl_gpio.o
  CC      drivers/base/power/wakeirq.o
  CC [M]  drivers/gpu/drm/display/drm_dsc_helper.o
  CC      drivers/iommu/iommu.o
  CC      net/ipv6/exthdrs_core.o
  CC      lib/ref_tracker.o
  CC [M]  drivers/gpu/drm/tests/drm_probe_helper_test.o
  CC      drivers/acpi/scan.o
  CC [M]  net/sctp/ulpevent.o
  CC [M]  drivers/regulator/max14577-regulator.o
  CC [M]  net/rds/send.o
  CC [M]  net/dccp/qpolicy.o
  CC [M]  net/netfilter/nft_set_pipapo_avx2.o
  CC [M]  drivers/char/tpm/tpm_tis_spi_cr50.o
  AR      drivers/iommu/intel/built-in.a
  CC      kernel/pid.o
  CC      net/ipv4/proc.o
  CC      drivers/base/power/main.o
  CC      drivers/tty/serial/kgdboc.o
  CC [M]  net/bridge/br_input.o
  CC      lib/bootconfig.o
  CC [M]  arch/x86/kvm/svm/sev.o
  CC [M]  drivers/gpu/drm/tests/drm_rect_test.o
  CC      drivers/acpi/mipi-disco-img.o
  CC [M]  net/9p/trans_xen.o
  CC [M]  drivers/iommu/iommufd/hw_pagetable.o
  CC [M]  drivers/regulator/max1586.o
  CC [M]  drivers/gpu/drm/display/drm_hdcp_helper.o
  CC [M]  drivers/char/tpm/tpm_tis_i2c_cr50.o
  CC [M]  drivers/xen/xen-front-pgdir-shbuf.o
  CC      fs/btrfs/print-tree.o
  CC [M]  net/sctp/inqueue.o
  CC [M]  net/dccp/ccids/ccid2.o
  CC [M]  drivers/tty/serial/altera_jtaguart.o
  CC      lib/asn1_decoder.o
  CC      drivers/acpi/resource.o
  CC [M]  net/netfilter/nft_ct_fast.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_audio_helper.o
  CC [M]  drivers/iommu/iommufd/io_pagetable.o
  CC [M]  net/netfilter/nft_compat.o
  CC [M]  drivers/regulator/max77503-regulator.o
  CC [M]  net/dccp/ackvec.o
  CC      net/ipv4/fib_rules.o
  CC [M]  net/9p/trans_virtio.o
  CC      drivers/base/firmware_loader/builtin/main.o
  CC [M]  drivers/char/tpm/tpm_tis_i2c.o
  CC      net/ipv6/ip6_checksum.o
  CC [M]  drivers/tty/serial/altera_uart.o
  CC      drivers/base/firmware_loader/fallback_table.o
  LD [M]  drivers/xen/xen-evtchn.o
  LD [M]  drivers/xen/xen-gntdev.o
  LD [M]  drivers/xen/xen-gntalloc.o
  LD [M]  drivers/xen/xen-privcmd.o
  AR      drivers/xen/built-in.a
  CC      kernel/task_work.o
  CC [M]  drivers/iommu/iommufd/ioas.o
  CC [M]  net/sctp/outqueue.o
  CC [M]  net/rds/stats.o
  CC      fs/btrfs/root-tree.o
  AR      drivers/base/firmware_loader/builtin/built-in.a
  CC [M]  net/dccp/sysctl.o
  CC [M]  drivers/regulator/max77541-regulator.o
  CC      drivers/base/power/wakeup.o
  CC      lib/asn1_encoder.o
  CC [M]  net/bridge/br_ioctl.o
  CC      drivers/acpi/acpi_processor.o
  CC [M]  drivers/char/tpm/tpm_i2c_atmel.o
  AR      drivers/tty/ipwireless/built-in.a
  CC      drivers/tty/tty_io.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_cec_helper.o
  CC [M]  drivers/tty/serial/arc_uart.o
  CC      kernel/extable.o
  CC      net/ipv4/ipmr.o
  LD [M]  net/9p/9pnet.o
  LD [M]  net/9p/9pnet_fd.o
  LD [M]  net/9p/9pnet_xen.o
  LD [M]  net/9p/9pnet_virtio.o
  CC [M]  drivers/tty/serial/fsl_linflexuart.o
  CC [M]  net/netfilter/nft_connlimit.o
  CC      drivers/base/firmware_loader/main.o
  CC [M]  drivers/iommu/iommufd/main.o
  CC [M]  drivers/regulator/max8649.o
  CC [M]  drivers/char/tpm/tpm_i2c_infineon.o
  CC      fs/efivarfs/inode.o
  CC [M]  drivers/iommu/iommufd/pages.o
  GEN     lib/oid_registry_data.c
  CC      fs/btrfs/dir-item.o
  CC      lib/ucs2_string.o
  CC      net/ipv6/ip6_icmp.o
  CC [M]  drivers/regulator/max8660.o
  CC [M]  arch/x86/kvm/svm/hyperv.o
  CC [M]  net/dccp/ipv4.o
  CC      fs/efivarfs/file.o
  CC [M]  net/sunrpc/auth.o
  CC [M]  drivers/tty/serial/fsl_lpuart.o
  CC [M]  net/bridge/br_stp.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.o
  CC      drivers/acpi/processor_core.o
  CC      kernel/params.o
  CC      fs/efivarfs/super.o
  CC      drivers/base/power/wakeup_stats.o
  CC [M]  net/rds/sysctl.o
  CC      drivers/base/regmap/regmap.o
  CC [M]  net/netfilter/nft_numgen.o
  CC [M]  drivers/char/tpm/tpm_i2c_nuvoton.o
  CC      lib/ubsan.o
  CC      drivers/base/regmap/regcache.o
  CC [M]  drivers/regulator/max8893.o
  AR      drivers/base/test/built-in.a
  CC      drivers/base/regmap/regcache-rbtree.o
  CC [M]  arch/x86/kvm/svm/svm_onhyperv.o
  CC      fs/btrfs/file-item.o
  CC [M]  drivers/char/tpm/tpm_nsc.o
  CC [M]  net/sctp/ulpqueue.o
  CC      drivers/base/firmware_loader/fallback.o
  CC [M]  drivers/iommu/iommufd/vfio_compat.o
  CC      fs/efivarfs/vars.o
  CC      drivers/base/power/trace.o
  CC      lib/sbitmap.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_helper.o
  CC      drivers/acpi/processor_pdc.o
  CC      net/ipv6/output_core.o
  CC [M]  drivers/regulator/max8907-regulator.o
  CC [M]  net/psample/psample.o
  CC [M]  net/netfilter/nft_ct.o
  CC [M]  net/rds/threads.o
  LD [M]  arch/x86/kvm/kvm.o
  AS [M]  arch/x86/kvm/vmx/vmenter.o
  AS [M]  arch/x86/kvm/svm/vmenter.o
  LD [M]  arch/x86/kvm/kvm-intel.o
  CC      kernel/kthread.o
  LD [M]  arch/x86/kvm/kvm-amd.o
  CC      drivers/base/firmware_loader/fallback_platform.o
  CC [M]  net/bridge/br_stp_bpdu.o
  CC      drivers/base/power/clock_ops.o
  CC [M]  drivers/iommu/iommufd/viommu.o
  CC [M]  drivers/regulator/max8925-regulator.o
  CC [M]  drivers/tty/serial/lantiq.o
  CC [M]  drivers/char/tpm/tpm_atmel.o
  CC      drivers/acpi/ec.o
  AR      fs/efivarfs/built-in.a
  CC [M]  drivers/regulator/max8952.o
  CC [M]  net/sunrpc/auth_null.o
  CC [M]  net/dccp/ipv6.o
  CC      fs/btrfs/inode-item.o
  CC [M]  drivers/regulator/max8997-regulator.o
  CC [M]  net/sctp/tsnmap.o
  CC      drivers/acpi/dock.o
  CC [M]  drivers/gpu/drm/display/drm_scdc_helper.o
  CC      lib/group_cpus.o
  AR      drivers/iommu/iommufd/built-in.a
  LD [M]  drivers/iommu/iommufd/iommufd.o
  CC [M]  net/sunrpc/auth_tls.o
  CC      drivers/iommu/iommu-traces.o
  CC      drivers/base/firmware_loader/sysfs.o
  CC      net/ipv4/ipmr_base.o
  CC [M]  drivers/tty/serial/max3100.o
  CC [M]  drivers/char/tpm/tpm_infineon.o
  CC [M]  drivers/tty/serial/men_z135_uart.o
  CC      fs/btrfs/disk-io.o
  AR      drivers/base/power/built-in.a
  CC [M]  net/bridge/br_stp_if.o
  CC      net/ipv6/protocol.o
  CC [M]  net/vmw_vsock/af_vsock.o
  CC [M]  net/bridge/br_stp_timer.o
  CC [M]  drivers/regulator/max8998.o
  CC      drivers/tty/n_tty.o
  CC [M]  net/rds/transport.o
  CC [M]  net/netfilter/nft_flow_offload.o
  CC [M]  drivers/char/xillybus/xillybus_class.o
  CC      drivers/base/firmware_loader/sysfs_upload.o
  CC [M]  net/sctp/bind_addr.o
  CC [M]  drivers/char/tpm/xen-tpmfront.o
  CC      kernel/sys_ni.o
  CC      lib/fw_table.o
  CC [M]  drivers/tty/serial/rp2.o
  CC [M]  net/sunrpc/auth_unix.o
  CC [M]  lib/crc7.o
  CC      drivers/base/regmap/regcache-flat.o
  CC      drivers/acpi/pci_root.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_state_helper.o
  CC [M]  net/sctp/socket.o
  CC [M]  net/dccp/diag.o
  CC      drivers/iommu/iommu-sysfs.o
  CC [M]  lib/crc8.o
  CC      kernel/nsproxy.o
  CC [M]  drivers/regulator/max20086-regulator.o
  CC      drivers/base/regmap/regcache-maple.o
  CC [M]  net/bridge/br_netlink.o
  CC [M]  drivers/char/tpm/tpm_vtpm_proxy.o
  CC [M]  drivers/char/xillybus/xillybus_core.o
  CC [M]  drivers/tty/serial/sc16is7xx.o
  CC      fs/btrfs/transaction.o
  CC      net/ipv6/ip6_offload.o
  AR      drivers/base/firmware_loader/built-in.a
  CC      net/ipv4/syncookies.o
  CC      drivers/acpi/pci_link.o
  CC [M]  drivers/char/xillybus/xillybus_pcie.o
  CC [M]  net/netfilter/nft_limit.o
  CC      fs/btrfs/inode.o
  CC [M]  net/sunrpc/svc.o
  CC [M]  net/sctp/primitive.o
  CC      drivers/base/regmap/regmap-debugfs.o
  CC [M]  drivers/regulator/max20411-regulator.o
  CC [M]  drivers/gpu/drm/display/drm_dp_aux_dev.o
  CC [M]  lib/bch.o
  LD [M]  net/dccp/dccp.o
  CC [M]  net/sctp/output.o
  LD [M]  net/dccp/dccp_ipv4.o
  LD [M]  net/dccp/dccp_ipv6.o
  LD [M]  net/dccp/dccp_diag.o
  CC      net/ipv4/netfilter.o
  LD [M]  drivers/char/tpm/tpm_tis_spi.o
  AR      drivers/char/tpm/built-in.a
  CC      kernel/notifier.o
  CC      fs/btrfs/file.o
  CC      drivers/iommu/dma-iommu.o
  CC      drivers/iommu/io-pgtable.o
  CC [M]  drivers/block/xen-blkback/blkback.o
  CC [M]  net/vmw_vsock/af_vsock_tap.o
  CC      drivers/acpi/pci_irq.o
  CC [M]  net/rds/loop.o
  CC [M]  drivers/regulator/max77693-regulator.o
  CC      drivers/base/regmap/regmap-i2c.o
  CC [M]  net/netfilter/nft_nat.o
  CC [M]  drivers/tty/serial/sc16is7xx_spi.o
  CC      net/ipv6/tcpv6_offload.o
  CC [M]  drivers/char/xillybus/xillyusb.o
  CC [M]  drivers/gpu/drm/display/drm_dp_cec.o
  CC [M]  net/bridge/br_netlink_tunnel.o
  CC      net/ipv4/tcp_cubic.o
  CC      drivers/acpi/acpi_apd.o
  CC [M]  net/bridge/br_arp_nd_proxy.o
  CC [M]  fs/netfs/buffered_read.o
  CC      drivers/tty/tty_ioctl.o
  CC [M]  drivers/regulator/max77826-regulator.o
  CC [M]  lib/ts_kmp.o
  CC [M]  drivers/tty/serial/sc16is7xx_i2c.o
  CC [M]  fs/netfs/buffered_write.o
  CC [M]  drivers/block/xen-blkback/xenbus.o
  CC      kernel/ksysfs.o
  CC [M]  net/rds/page.o
  CC [M]  net/bridge/br_sysfs_if.o
  CC [M]  net/vmw_vsock/vsock_addr.o
  CC      drivers/acpi/acpi_platform.o
  CC [M]  net/netfilter/nft_queue.o
  CC [M]  lib/ts_bm.o
  CC      net/ipv6/exthdrs_offload.o
  CC      drivers/char/mem.o
  CC      drivers/iommu/iova.o
  CC      drivers/base/regmap/regmap-spi.o
  CC [M]  drivers/regulator/max77857-regulator.o
  CC [M]  drivers/tty/serial/sprd_serial.o
  LD [M]  drivers/gpu/drm/display/drm_display_helper.o
  AR      drivers/gpu/drm/omapdrm/built-in.a
  CC      net/ipv6/inet6_hashtables.o
  AR      drivers/gpu/drm/tilcdc/built-in.a
  AR      drivers/gpu/drm/imx/built-in.a
  AR      drivers/gpu/drm/panel/built-in.a
  CC [M]  drivers/gpu/drm/panel/panel-auo-a030jtn01.o
  CC      net/ipv4/tcp_sigpool.o
  AR      drivers/gpu/drm/bridge/analogix/built-in.a
  CC [M]  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.o
  CC [M]  net/sunrpc/svcsock.o
  CC      kernel/cred.o
  CC [M]  lib/ts_fsm.o
  CC      kernel/reboot.o
  CC      drivers/base/regmap/regmap-mmio.o
  LD [M]  drivers/block/xen-blkback/xen-blkback.o
  CC [M]  net/bridge/br_sysfs_br.o
  CC      drivers/acpi/acpi_pnp.o
  CC [M]  drivers/block/drbd/drbd_buildtag.o
  CC [M]  drivers/tty/serial/uartlite.o
  CC      drivers/char/random.o
  CC      drivers/iommu/irq_remapping.o
  CC [M]  net/bridge/br_nf_core.o
  CC [M]  fs/netfs/direct_read.o
  CC [M]  net/netfilter/nft_quota.o
  CC [M]  drivers/gpu/drm/panel/panel-ilitek-ili9341.o
  CC      net/devres.o
  CC [M]  net/vmw_vsock/vsock_bpf.o
  CC [M]  lib/notifier-error-inject.o
  CC [M]  net/sctp/input.o
  CC [M]  net/netfilter/nft_reject.o
  CC [M]  net/rds/rdma.o
  CC [M]  drivers/regulator/mc13783-regulator.o
  CC [M]  drivers/block/drbd/drbd_bitmap.o
  CC [M]  drivers/gpu/drm/bridge/analogix/analogix_dp_core.o
  CC      drivers/base/regmap/regmap-irq.o
  CC      drivers/acpi/power.o
  AR      drivers/tty/serial/built-in.a
  CC      drivers/tty/tty_ldisc.o
  CC      fs/btrfs/defrag.o
  CC [M]  net/sunrpc/svcauth.o
  CC [M]  drivers/gpu/drm/panel/panel-orisetech-ota5601a.o
  CC      drivers/iommu/hyperv-iommu.o
  CC [M]  lib/pm-notifier-error-inject.o
  CC [M]  drivers/block/mtip32xx/mtip32xx.o
  AR      drivers/misc/eeprom/built-in.a
../drivers/gpu/drm/bridge/analogix/analogix_dp_core.c: In function ‘analogix_dp_probe’:
../drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1589:17: error: label ‘err_disable_clk’ used but not defined
 1589 |                 goto err_disable_clk;
      |                 ^~~~
  CC [M]  drivers/misc/eeprom/at24.o
make[8]: *** [../scripts/Makefile.build:203: drivers/gpu/drm/bridge/analogix/analogix_dp_core.o] Error 1
make[7]: *** [../scripts/Makefile.build:461: drivers/gpu/drm/bridge/analogix] Error 2
make[6]: *** [../scripts/Makefile.build:461: drivers/gpu/drm/bridge] Error 2
make[6]: *** Waiting for unfinished jobs....
  CC [M]  net/bridge/br_multicast.o
  AR      drivers/misc/cb710/built-in.a
  CC [M]  drivers/misc/cb710/core.o
  CC [M]  drivers/regulator/mc13892-regulator.o
  CC      net/ipv6/mcast_snoop.o
  CC [M]  fs/netfs/direct_write.o
  CC      net/ipv4/tcp_bpf.o
  CC [M]  net/vmw_vsock/diag.o
  CC      kernel/async.o
  CC      drivers/acpi/event.o
  CC [M]  net/rds/tcp.o
  CC [M]  lib/memory-notifier-error-inject.o
  CC      drivers/iommu/virtio-iommu.o
  CC [M]  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.o
  CC      drivers/char/ttyprintk.o
  AR      drivers/misc/lis3lv02d/built-in.a
  CC [M]  drivers/misc/lis3lv02d/lis3lv02d.o
  CC      drivers/tty/tty_buffer.o
  CC [M]  drivers/regulator/mc13xxx-regulator-core.o
  CC [M]  drivers/base/regmap/regmap-slimbus.o
  CC [M]  drivers/misc/eeprom/at25.o
  CC [M]  net/sctp/debug.o
  CC [M]  net/netfilter/nft_reject_inet.o
  CC      drivers/base/component.o
  CC [M]  drivers/block/drbd/drbd_proc.o
  CC      fs/btrfs/extent_map.o
  CC [M]  drivers/misc/cb710/sgbuf2.o
  CC [M]  lib/lru_cache.o
  CC [M]  net/vmw_vsock/vmci_transport.o
  CC [M]  fs/netfs/iterator.o
  CC      drivers/char/misc.o
  CC      kernel/range.o
  CC [M]  drivers/gpu/drm/panel/panel-widechips-ws2401.o
  CC      kernel/smpboot.o
  CC      net/ipv6/tcp_ao.o
  CC      drivers/iommu/iommu-sva.o
  CC [M]  drivers/misc/eeprom/max6875.o
  CC [M]  drivers/base/regmap/regmap-spmi.o
  CC      drivers/acpi/evged.o
  CC      drivers/tty/tty_port.o
  CC [M]  net/sunrpc/svcauth_unix.o
  CC [M]  net/sctp/stream.o
  CC [M]  drivers/regulator/mp8859.o
  CC [M]  fs/nfs/filelayout/filelayout.o
  CC [M]  net/rds/tcp_connect.o
  CC      drivers/char/virtio_console.o
  CC [M]  drivers/misc/lis3lv02d/lis3lv02d_i2c.o
  LD [M]  drivers/misc/cb710/cb710.o
  CC [M]  net/rds/tcp_listen.o
  AR      lib/lib.a
  CC [M]  net/rds/tcp_recv.o
  CC [M]  drivers/block/drbd/drbd_worker.o
  GEN     lib/crc32table.h
  GEN     lib/crc64table.h
  CC      lib/oid_registry.o
  CC      fs/btrfs/sysfs.o
make[5]: *** [../scripts/Makefile.build:461: drivers/gpu/drm] Error 2
  CC      net/ipv4/udp_bpf.o
make[4]: *** [../scripts/Makefile.build:461: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
  CC [M]  drivers/base/regmap/regmap-w1.o
  CC      drivers/acpi/sysfs.o
  CC [M]  drivers/misc/eeprom/eeprom_93cx6.o
  CC [M]  net/netfilter/nft_reject_netdev.o
  CC      kernel/ucount.o
  CC [M]  net/vmw_vsock/vmci_transport_notify.o
  CC [M]  fs/netfs/locking.o
  CC [M]  net/sunrpc/addr.o
  CC [M]  drivers/regulator/mt6311-regulator.o
  CC [M]  net/ipv6/ah6.o
  CC      drivers/iommu/io-pgfault.o
  CC      drivers/tty/tty_mutex.o
  CC [M]  net/netfilter/nft_tunnel.o
  CC      kernel/regset.o
  CC      net/socket.o
  CC      lib/crc32.o
  CC      drivers/acpi/property.o
  CC [M]  drivers/misc/eeprom/eeprom_93xx46.o
  CC [M]  drivers/base/regmap/regmap-i3c.o
  CC [M]  net/sctp/auth.o
  CC [M]  drivers/regulator/mt6315-regulator.o
  CC [M]  fs/nfs/filelayout/filelayoutdev.o
  CC      drivers/char/hpet.o
  CC [M]  net/sctp/offload.o
  CC [M]  net/rds/tcp_send.o
  CC [M]  net/vmw_vsock/vmci_transport_notify_qstate.o
  CC [M]  fs/netfs/main.o
  CC      kernel/ksyms_common.o
  CC      drivers/tty/tty_ldsem.o
  AR      drivers/iommu/built-in.a
  CC [M]  net/netfilter/nft_log.o
  CC      fs/btrfs/accessors.o
  CC [M]  net/ipv6/esp6.o
  CC      drivers/base/core.o
  CC [M]  drivers/misc/eeprom/idt_89hpesx.o
  CC [M]  drivers/regulator/mt6323-regulator.o
  CC      lib/crc64.o
  CC      fs/btrfs/xattr.o
  CC [M]  drivers/block/drbd/drbd_receiver.o
  CC      net/ipv4/cipso_ipv4.o
  CC [M]  drivers/char/uv_mmtimer.o
  CC [M]  net/sunrpc/rpcb_clnt.o
  CC [M]  drivers/base/regmap/regmap-spi-avmm.o
  CC [M]  net/vmw_vsock/virtio_transport.o
  CC      kernel/groups.o
  CC      drivers/tty/tty_baudrate.o
  CC [M]  net/bridge/br_mdb.o
  CC [M]  net/sctp/stream_sched.o
  LD [M]  fs/nfs/filelayout/nfs_layout_nfsv41_files.o
  CC      drivers/acpi/debugfs.o
  CC [M]  fs/nfs/blocklayout/blocklayout.o
  CC [M]  drivers/misc/eeprom/ee1004.o
  CC [M]  net/rds/tcp_stats.o
  CC [M]  drivers/regulator/mt6331-regulator.o
  CC [M]  drivers/char/lp.o
  AR      lib/built-in.a
  CC [M]  fs/nfs/blocklayout/dev.o
  CC [M]  net/netfilter/nft_masq.o
  CC      net/compat.o
  CC [M]  fs/lockd/clntlock.o
  CC      fs/btrfs/ordered-data.o
  CC      drivers/tty/tty_jobctrl.o
  AR      drivers/misc/cardreader/built-in.a
  CC [M]  drivers/regulator/mt6332-regulator.o
  CC [M]  drivers/misc/cardreader/alcor_pci.o
  CC      drivers/acpi/acpi_lpat.o
  CC [M]  net/vmw_vsock/virtio_transport_common.o
  AR      drivers/base/regmap/built-in.a
  CC      drivers/acpi/acpi_fpdt.o
  CC [M]  net/sctp/stream_sched_prio.o
  CC [M]  drivers/char/applicom.o
  CC [M]  fs/netfs/misc.o
  CC      kernel/vhost_task.o
  LD [M]  net/rds/rds.o
  LD [M]  net/rds/rds_tcp.o
  CC      kernel/kcmp.o
  CC      net/ipv4/xfrm4_policy.o
  CC [M]  fs/netfs/objects.o
  CC      drivers/acpi/acpi_lpit.o
  CC [M]  net/netfilter/nft_redir.o
  CC [M]  net/bridge/br_multicast_eht.o
  CC [M]  fs/netfs/read_collect.o
  CC [M]  fs/netfs/read_pgpriv2.o
  CC [M]  net/ipv6/esp6_offload.o
  CC [M]  fs/netfs/read_retry.o
  CC [M]  net/sunrpc/timer.o
  CC [M]  net/ipv6/ipcomp6.o
  CC [M]  drivers/misc/cardreader/rtsx_pcr.o
  CC [M]  fs/nfs/blocklayout/extent_tree.o
  CC [M]  net/ipv6/xfrm6_tunnel.o
  CC [M]  drivers/regulator/mt6357-regulator.o
  CC      kernel/freezer.o
  CC      fs/btrfs/extent_io.o
  CC [M]  net/sctp/stream_sched_rr.o
  CC      drivers/tty/n_null.o
  CC [M]  fs/lockd/clntproc.o
  CC      net/ipv4/xfrm4_state.o
  CC      drivers/acpi/acpi_watchdog.o
  CC [M]  drivers/block/drbd/drbd_req.o
  CC      drivers/tty/pty.o
  CC [M]  net/netfilter/nft_hash.o
  CC [M]  fs/nfs/flexfilelayout/flexfilelayout.o
  CC [M]  drivers/char/nvram.o
  CC      drivers/base/bus.o
  CC [M]  drivers/regulator/mt6358-regulator.o
  CC [M]  net/ipv6/tunnel6.o
  CC [M]  drivers/block/zram/zcomp.o
  CC [M]  fs/nfs/blocklayout/rpc_pipefs.o
  CC      net/sysctl_net.o
  CC [M]  net/vmw_vsock/hyperv_transport.o
  CC [M]  fs/netfs/read_single.o
  CC [M]  drivers/block/zram/zram_drv.o
  CC [M]  net/sctp/stream_sched_fc.o
  CC      fs/btrfs/volumes.o
  CC      kernel/profile.o
  CC      drivers/tty/tty_audit.o
  CC [M]  net/sunrpc/xdr.o
  CC      drivers/acpi/prmt.o
  CC      net/ipv4/xfrm4_input.o
  CC [M]  net/bridge/br_vlan.o
  CC [M]  net/netfilter/nft_fib.o
  CC [M]  drivers/block/zram/backend_lzorle.o
  CC [M]  drivers/regulator/mt6359-regulator.o
  CC      drivers/base/dd.o
  CC [M]  drivers/misc/cardreader/rts5209.o
  LD [M]  fs/nfs/blocklayout/blocklayoutdriver.o
  CC [M]  net/netfilter/nft_fib_inet.o
  AR      drivers/misc/pvpanic/built-in.a
  CC [M]  drivers/misc/pvpanic/pvpanic.o
  CC [M]  fs/smb/common/cifs_arc4.o
  CC      drivers/tty/sysrq.o
  CC [M]  fs/lockd/clntxdr.o
  CC [M]  drivers/char/ppdev.o
  CC [M]  net/vmw_vsock/vsock_loopback.o
  CC      kernel/stacktrace.o
  CC [M]  net/sctp/stream_interleave.o
  CC [M]  drivers/regulator/mt6360-regulator.o
  CC [M]  drivers/misc/cardreader/rts5229.o
  CC [M]  drivers/block/drbd/drbd_actlog.o
  CC [M]  net/ipv6/mip6.o
  CC [M]  drivers/misc/pvpanic/pvpanic-mmio.o
  CC [M]  drivers/block/zram/backend_lzo.o
  CC [M]  fs/netfs/rolling_buffer.o
  CC [M]  fs/smb/client/trace.o
  CC [M]  fs/nfs/flexfilelayout/flexfilelayoutdev.o
  CC      drivers/acpi/acpi_pcc.o
  CC [M]  fs/smb/common/cifs_md4.o
  CC [M]  fs/lockd/host.o
  CC [M]  drivers/char/tlclk.o
  CC      drivers/base/syscore.o
  LD [M]  drivers/block/zram/zram.o
  CC [M]  net/bridge/br_vlan_tunnel.o
  CC [M]  net/netfilter/nft_fib_netdev.o
  CC [M]  drivers/misc/cardreader/rtl8411.o
  CC [M]  drivers/block/null_blk/main.o
  CC      net/ipv4/xfrm4_output.o
  CC [M]  drivers/regulator/mt6370-regulator.o
  CC [M]  fs/lockd/svc.o
  CC      drivers/acpi/acpi_ffh.o
  CC [M]  drivers/misc/pvpanic/pvpanic-pci.o
  LD [M]  net/vmw_vsock/vsock.o
  LD [M]  net/vmw_vsock/vsock_diag.o
  LD [M]  net/vmw_vsock/vmw_vsock_vmci_transport.o
  LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport.o
  LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport_common.o
  LD [M]  net/vmw_vsock/hv_sock.o
  CC      net/ipv4/xfrm4_protocol.o
  CC      kernel/dma.o
  CC [M]  net/ipv6/ip6_vti.o
  CC [M]  drivers/tty/n_hdlc.o
  CC [M]  drivers/char/hangcheck-timer.o
  CC [M]  net/bridge/br_vlan_options.o
  CC [M]  drivers/misc/cardreader/rts5227.o
  CC [M]  net/sctp/proc.o
  CC      drivers/acpi/acpi_adxl.o
  LD [M]  fs/nfs/flexfilelayout/nfs_layout_flexfiles.o
  CC [M]  fs/nfs/client.o
  CC [M]  drivers/regulator/mt6397-regulator.o
  CC [M]  net/ipv6/sit.o
  CC [M]  fs/netfs/write_collect.o
  CC      drivers/acpi/ac.o
  CC [M]  net/netfilter/nft_socket.o
  CC [M]  drivers/misc/cardreader/rts5249.o
  CC [M]  drivers/block/drbd/drbd_main.o
  CC      kernel/smp.o
  CC [M]  fs/romfs/storage.o
  CC [M]  net/sunrpc/sunrpc_syms.o
  AR      drivers/char/built-in.a
  CC [M]  net/netfilter/nft_osf.o
  CC [M]  net/netfilter/nft_tproxy.o
  CC      drivers/base/driver.o
  CC [M]  fs/netfs/write_issue.o
  CC [M]  drivers/tty/n_gsm.o
  CC [M]  drivers/regulator/qcom-labibb-regulator.o
  CC [M]  fs/smb/client/cifsfs.o
  CC [M]  drivers/block/null_blk/trace.o
  CC      fs/btrfs/async-thread.o
  CC      drivers/acpi/button.o
  CC [M]  fs/romfs/super.o
  CC [M]  drivers/misc/cardreader/rts5260.o
  CC [M]  fs/lockd/svclock.o
  CC [M]  net/bridge/br_mst.o
  CC      net/ipv4/tcp_ao.o
  CC      drivers/acpi/fan_core.o
  CC [M]  drivers/block/null_blk/zoned.o
  CC      drivers/base/class.o
  CC [M]  net/sctp/sysctl.o
  CC [M]  drivers/regulator/qcom_spmi-regulator.o
  CC [M]  drivers/regulator/qcom_usb_vbus-regulator.o
  CC      drivers/acpi/fan_attr.o
  CC [M]  net/sunrpc/cache.o
  CC [M]  drivers/misc/cardreader/rts5261.o
  CC [M]  net/netfilter/nft_xfrm.o
  CC      fs/btrfs/ioctl.o
  LD [M]  fs/romfs/romfs.o
  CC [M]  fs/netfs/write_retry.o
  CC [M]  drivers/regulator/palmas-regulator.o
  CC [M]  fs/nfs/dir.o
  CC [M]  net/ipv6/ip6_tunnel.o
  CC [M]  drivers/misc/cardreader/rts5228.o
  CC [M]  net/bridge/br_switchdev.o
  CC      kernel/uid16.o
  AR      drivers/misc/keba/built-in.a
  CC [M]  drivers/misc/keba/cp500.o
  CC      drivers/block/loop.o
  CC [M]  net/sunrpc/rpc_pipe.o
  CC      drivers/acpi/fan_hwmon.o
  CC [M]  drivers/regulator/pca9450-regulator.o
  CC [M]  fs/autofs/init.o
  LD [M]  drivers/block/null_blk/null_blk.o
  CC [M]  fs/lockd/svcshare.o
  CC      drivers/base/platform.o
  CC [M]  net/sctp/ipv6.o
  CC [M]  fs/smb/client/cifs_debug.o
  CC [M]  drivers/tty/moxa.o
  CC [M]  drivers/misc/cardreader/rts5264.o
  CC [M]  fs/netfs/stats.o
  CC [M]  net/netfilter/nft_synproxy.o
  CC [M]  drivers/regulator/pv88060-regulator.o
  CC      drivers/base/cpu.o
  CC      drivers/acpi/pci_slot.o
  CC      net/ipv4/bpf_tcp_ca.o
  CC      kernel/module_signature.o
  CC      kernel/kallsyms.o
  CC [M]  net/ipv6/ip6_gre.o
  CC [M]  fs/nfs/file.o
  CC [M]  fs/autofs/inode.o
  CC [M]  net/bridge/br_mrp_switchdev.o
  CC [M]  drivers/misc/cardreader/rtsx_usb.o
  CC [M]  fs/netfs/fscache_cache.o
  CC      drivers/acpi/processor_driver.o
  CC [M]  drivers/regulator/pv88080-regulator.o
  CC [M]  fs/lockd/svcproc.o
  CC [M]  drivers/tty/mxser.o
  CC [M]  net/sunrpc/sysfs.o
  CC [M]  drivers/block/drbd/drbd_strings.o
  CC [M]  drivers/block/drbd/drbd_nl.o
  CC [M]  fs/autofs/root.o
  CC [M]  fs/nfs/getroot.o
  CC [M]  fs/smb/client/connect.o
  CC      kernel/acct.o
  CC [M]  net/netfilter/nft_chain_nat.o
  CC      drivers/base/firmware.o
  CC [M]  net/sctp/diag.o
  CC [M]  drivers/misc/ibmasm/module.o
  CC      drivers/acpi/processor_thermal.o
  LD [M]  net/sctp/sctp.o
  CC      fs/btrfs/locking.o
  CC [M]  net/bridge/br_mrp.o
  CC [M]  drivers/regulator/pv88090-regulator.o
  CC [M]  fs/netfs/fscache_cookie.o
  LD [M]  drivers/misc/cardreader/rtsx_pci.o
  CC      drivers/acpi/processor_idle.o
  CC [M]  net/ipv4/ip_tunnel.o
  CC      drivers/base/init.o
  CC [M]  net/bridge/br_mrp_netlink.o
  CC [M]  drivers/block/drbd/drbd_interval.o
  CC [M]  fs/lockd/svcsubs.o
  CC [M]  drivers/tty/nozomi.o
  CC [M]  fs/autofs/symlink.o
  CC [M]  fs/lockd/mon.o
  CC [M]  net/sunrpc/svc_xprt.o
  CC [M]  fs/lockd/trace.o
  CC      fs/btrfs/orphan.o
  CC      kernel/vmcore_info.o
  CC [M]  drivers/tty/ttynull.o
  CC [M]  drivers/regulator/pwm-regulator.o
  CC [M]  net/netfilter/nft_dup_netdev.o
  CC [M]  drivers/misc/ibmasm/ibmasmfs.o
  CC [M]  fs/nfs/inode.o
  LD [M]  net/sctp/sctp_diag.o
  CC      drivers/block/nbd.o
  CC      drivers/base/map.o
  CC [M]  fs/smb/client/dir.o
  CC [M]  fs/autofs/waitq.o
  CC [M]  drivers/regulator/tps51632-regulator.o
  CC [M]  net/ipv6/fou6.o
  CC      fs/btrfs/export.o
  CC      drivers/acpi/processor_throttling.o
  CC      kernel/elfcorehdr.o
  CC [M]  net/bridge/br_cfm.o
  CC [M]  fs/lockd/xdr.o
  CC [M]  drivers/tty/rpmsg_tty.o
  CC      drivers/acpi/processor_perflib.o
  CC      drivers/base/devres.o
  CC [M]  fs/autofs/expire.o
  CC [M]  net/bridge/br_cfm_netlink.o
  CC [M]  drivers/misc/ibmasm/event.o
  CC [M]  fs/netfs/fscache_io.o
  CC [M]  net/netfilter/nft_fwd_netdev.o
  CC      kernel/crash_reserve.o
  CC [M]  fs/fuse/dev.o
  CC      fs/btrfs/tree-log.o
  CC [M]  net/ipv4/ipip.o
  CC [M]  net/ipv6/ip6_udp_tunnel.o
  AR      drivers/tty/built-in.a
  CC [M]  drivers/misc/sgi-xp/xp_main.o
  CC [M]  drivers/misc/sgi-xp/xp_uv.o
  CC [M]  drivers/misc/ibmasm/command.o
  CC [M]  drivers/regulator/pcap-regulator.o
  CC [M]  drivers/regulator/raa215300.o
  CC [M]  fs/autofs/dev-ioctl.o
  CC [M]  fs/lockd/netlink.o
  CC [M]  fs/lockd/clnt4xdr.o
  CC      kernel/kexec_core.o
  CC      drivers/acpi/container.o
  CC      drivers/base/attribute_container.o
  CC [M]  drivers/block/drbd/drbd_state.o
  CC [M]  net/bridge/br_netfilter_hooks.o
  CC [M]  net/netfilter/nf_flow_table_core.o
  CC [M]  drivers/misc/ibmasm/remote.o
  CC      drivers/base/transport_class.o
  CC [M]  fs/nfs/super.o
  CC [M]  fs/smb/client/file.o
  CC      drivers/base/topology.o
  CC [M]  fs/netfs/fscache_main.o
  CC [M]  net/sunrpc/xprtmultipath.o
  CC [M]  fs/smb/client/inode.o
  CC [M]  drivers/misc/sgi-xp/xpc_main.o
  LD [M]  fs/autofs/autofs4.o
  CC [M]  net/bridge/br_netfilter_ipv6.o
  CC      drivers/acpi/thermal_lib.o
  CC [M]  net/ipv4/fou_core.o
  CC [M]  fs/fuse/dir.o
  CC [M]  drivers/regulator/rc5t583-regulator.o
  CC [M]  net/ipv4/fou_nl.o
  CC [M]  drivers/misc/ibmasm/heartbeat.o
  CC [M]  fs/lockd/xdr4.o
  CC [M]  net/ipv4/fou_bpf.o
  CC      kernel/crash_core.o
  CC [M]  drivers/misc/ibmasm/r_heartbeat.o
  CC [M]  drivers/misc/ibmasm/dot_command.o
  CC      drivers/base/container.o
  AR      net/ipv6/built-in.a
  CC [M]  fs/fuse/file.o
  CC [M]  fs/nfs/io.o
  CC      drivers/acpi/thermal.o
  CC [M]  fs/fuse/inode.o
  CC [M]  drivers/misc/sgi-xp/xpc_channel.o
  CC [M]  fs/nfs/direct.o
  CC      drivers/acpi/nhlt.o
  CC      drivers/base/property.o
  CC [M]  drivers/misc/ibmasm/lowlevel.o
  CC [M]  drivers/regulator/rt4801-regulator.o
  CC [M]  drivers/block/drbd/drbd_nla.o
  LD [M]  net/bridge/bridge.o
  LD [M]  net/bridge/br_netfilter.o
  CC [M]  fs/lockd/svc4proc.o
  CC [M]  net/sunrpc/debugfs.o
  CC      fs/btrfs/free-space-cache.o
  CC [M]  fs/netfs/fscache_volume.o
  CC [M]  drivers/misc/sgi-gru/grufile.o
  CC [M]  fs/smb/client/link.o
  CC [M]  drivers/misc/ibmasm/uart.o
  CC [M]  fs/nfs/pagelist.o
  CC      kernel/kexec.o
  CC      drivers/acpi/acpi_memhotplug.o
  CC      drivers/block/virtio_blk.o
  CC [M]  drivers/misc/sgi-xp/xpc_partition.o
  CC [M]  net/netfilter/nf_flow_table_ip.o
  CC      fs/btrfs/zlib.o
  CC [M]  fs/netfs/fscache_proc.o
  CC [M]  drivers/block/drbd/drbd_debugfs.o
  CC [M]  drivers/misc/c2port/core.o
  CC [M]  net/ipv4/gre_demux.o
  LD [M]  drivers/misc/ibmasm/ibmasm.o
  CC [M]  fs/netfs/fscache_stats.o
  CC      drivers/acpi/ioapic.o
  CC [M]  drivers/misc/sgi-gru/grumain.o
  CC [M]  net/sunrpc/backchannel_rqst.o
  CC [M]  drivers/regulator/rt4803.o
  CC [M]  fs/lockd/procfs.o
  CC [M]  drivers/misc/sgi-xp/xpc_uv.o
  CC      kernel/kexec_file.o
  CC [M]  fs/nfs/read.o
  CC [M]  fs/overlayfs/super.o
  CC [M]  net/sunrpc/stats.o
  CC      drivers/base/cacheinfo.o
  CC      drivers/acpi/battery.o
  CC [M]  fs/fuse/control.o
  CC [M]  fs/overlayfs/namei.o
  CC      kernel/compat.o
  CC [M]  fs/smb/client/misc.o
  CC [M]  fs/smb/client/netmisc.o
  CC [M]  drivers/misc/sgi-xp/xpnet.o
  LD [M]  fs/lockd/lockd.o
  CC [M]  drivers/regulator/rt4831-regulator.o
  CC [M]  drivers/misc/c2port/c2port-duramar2150.o
  CC      drivers/block/xen-blkfront.o
  LD [M]  fs/netfs/netfs.o
  CC [M]  drivers/block/floppy.o
  CC [M]  drivers/misc/sgi-gru/grufault.o
  CC [M]  fs/overlayfs/util.o
  CC      drivers/base/swnode.o
  CC [M]  fs/smb/client/smbencrypt.o
  CC      fs/btrfs/lzo.o
  CC [M]  net/netfilter/nf_flow_table_offload.o
  LD [M]  drivers/block/drbd/drbd.o
  CC      drivers/base/faux.o
  CC      drivers/acpi/hed.o
  CC [M]  fs/fuse/xattr.o
  CC [M]  drivers/block/brd.o
  CC [M]  fs/9p/vfs_super.o
  CC [M]  fs/cachefiles/cache.o
  CC [M]  drivers/regulator/rt5033-regulator.o
  CC [M]  fs/vboxsf/dir.o
  CC      drivers/acpi/bgrt.o
  LD [M]  drivers/misc/sgi-xp/xp.o
  LD [M]  drivers/misc/sgi-xp/xpc.o
  CC [M]  fs/cachefiles/daemon.o
  CC      kernel/utsname.o
  CC      kernel/user_namespace.o
  CC [M]  fs/fuse/acl.o
  CC [M]  fs/nfs/symlink.o
  CC [M]  drivers/misc/altera-stapl/altera-jtag.o
  CC [M]  net/sunrpc/sysctl.o
  CC [M]  net/ipv4/ip_gre.o
  CC [M]  fs/nfs/unlink.o
  CC [M]  fs/nfs/write.o
  CC      drivers/base/auxiliary.o
  CC [M]  fs/9p/vfs_inode.o
  CC [M]  drivers/misc/sgi-gru/grutlbpurge.o
  CC [M]  drivers/regulator/rt5120-regulator.o
  CC [M]  net/netfilter/nf_flow_table_xdp.o
  CC [M]  fs/vboxsf/file.o
  CC [M]  fs/overlayfs/inode.o
  CC [M]  fs/smb/client/transport.o
  CC      fs/open.o
  CC [M]  fs/fuse/readdir.o
  CC [M]  net/netfilter/nf_flow_table_inet.o
  CC      drivers/acpi/cppc_acpi.o
  CC [M]  drivers/misc/altera-stapl/altera-comp.o
  CC [M]  fs/cachefiles/interface.o
  CC      drivers/base/devtmpfs.o
  CC      fs/btrfs/zstd.o
  CC [M]  fs/9p/vfs_inode_dotl.o
  CC [M]  drivers/misc/altera-stapl/altera.o
  CC [M]  drivers/regulator/rt5190a-regulator.o
  CC [M]  drivers/misc/sgi-gru/gruprocfs.o
  CC      fs/btrfs/compression.o
  CC [M]  drivers/misc/altera-stapl/altera-lpt.o
  CC [M]  fs/vboxsf/utils.o
  CC [M]  fs/9p/vfs_addr.o
  CC [M]  drivers/misc/sgi-gru/grukservices.o
  CC [M]  fs/fuse/ioctl.o
  CC [M]  fs/nfs/namespace.o
  CC      kernel/pid_namespace.o
  CC [M]  fs/overlayfs/file.o
  CC [M]  fs/9p/vfs_file.o
  CC [M]  drivers/block/ublk_drv.o
  CC [M]  drivers/misc/sgi-gru/gruhandles.o
  CC [M]  net/netfilter/x_tables.o
  CC [M]  fs/cachefiles/io.o
  CC      drivers/base/isa.o
  CC [M]  drivers/regulator/rt5739.o
  CC [M]  fs/9p/vfs_dir.o
  CC [M]  fs/vboxsf/vboxsf_wrappers.o
  CC [M]  fs/cachefiles/key.o
  CC [M]  fs/vboxsf/super.o
  CC      drivers/acpi/spcr.o
  CC      fs/read_write.o
  CC [M]  fs/cachefiles/main.o
  CC [M]  fs/overlayfs/dir.o
  CC [M]  drivers/regulator/rt5759-regulator.o
  LD [M]  net/sunrpc/sunrpc.o
  CC [M]  net/ipv4/udp_tunnel_core.o
  CC [M]  fs/cachefiles/namei.o
  CC [M]  fs/fuse/iomode.o
  CC      fs/btrfs/delayed-ref.o
  LD [M]  drivers/misc/altera-stapl/altera-stapl.o
  CC [M]  fs/overlayfs/readdir.o
  CC [M]  fs/smb/client/cached_dir.o
  UPD     kernel/config_data
  CC      drivers/base/node.o
  CC      kernel/stop_machine.o
  CC [M]  fs/9p/vfs_dentry.o
  CC      drivers/acpi/acpi_dbg.o
  CC [M]  drivers/misc/sgi-gru/grukdump.o
  CC [M]  fs/nfs/mount_clnt.o
  CC [M]  net/ipv4/udp_tunnel_nic.o
  LD [M]  fs/vboxsf/vboxsf.o
  CC [M]  drivers/misc/mei/hdcp/mei_hdcp.o
  CC [M]  drivers/misc/mei/pxp/mei_pxp.o
  CC      kernel/audit.o
  CC [M]  drivers/misc/vmw_vmci/vmci_context.o
  CC      fs/btrfs/relocation.o
  CC      fs/btrfs/delayed-inode.o
  CC [M]  drivers/regulator/rt6160-regulator.o
  CC [M]  fs/fuse/dax.o
  CC [M]  fs/9p/v9fs.o
  CC      fs/btrfs/scrub.o
  CC      drivers/acpi/viot.o
  LD [M]  drivers/misc/sgi-gru/gru.o
  CC [M]  net/netfilter/xt_tcpudp.o
  AR      drivers/block/built-in.a
  CC [M]  fs/cachefiles/security.o
  CC      fs/file_table.o
  CC [M]  drivers/misc/mei/gsc_proxy/mei_gsc_proxy.o
  CC [M]  fs/fuse/passthrough.o
  CC [M]  drivers/misc/vmw_vmci/vmci_datagram.o
  CC [M]  fs/nfs/nfstrace.o
  CC      drivers/base/memory.o
  CC [M]  drivers/misc/vmw_vmci/vmci_doorbell.o
  CC [M]  fs/smb/client/cifs_unicode.o
  CC [M]  fs/9p/fid.o
  CC [M]  fs/nfs/export.o
  CC [M]  drivers/acpi/acpi_ipmi.o
  CC [M]  drivers/misc/genwqe/card_base.o
  CC [M]  drivers/regulator/rt6190-regulator.o
  CC [M]  fs/cachefiles/volume.o
  CC [M]  fs/overlayfs/copy_up.o
  CC [M]  drivers/misc/vmw_vmci/vmci_driver.o
  CC [M]  net/ipv4/ip_vti.o
  CC [M]  drivers/misc/mei/init.o
  CC      fs/btrfs/backref.o
  CC [M]  fs/9p/xattr.o
  CC [M]  fs/fuse/sysctl.o
  CC      fs/super.o
  CC [M]  net/netfilter/xt_mark.o
  CC [M]  drivers/regulator/rt6245-regulator.o
  CC [M]  fs/nfs/sysfs.o
  CC [M]  fs/smb/client/nterr.o
  CC [M]  drivers/misc/echo/echo.o
  CC [M]  fs/overlayfs/export.o
  CC      kernel/auditfilter.o
  CC [M]  drivers/misc/genwqe/card_dev.o
  CC      drivers/base/module.o
  CC [M]  drivers/misc/vmw_vmci/vmci_event.o
  CC [M]  fs/cachefiles/xattr.o
  CC [M]  net/ipv4/ah4.o
  CC [M]  drivers/acpi/acpi_video.o
  CC [M]  fs/fuse/dev_uring.o
  CC [M]  fs/cachefiles/error_inject.o
  CC [M]  fs/9p/cache.o
  CC [M]  drivers/misc/mei/hbm.o
  CC [M]  drivers/misc/vmw_vmci/vmci_guest.o
  CC [M]  fs/smb/client/cifsencrypt.o
  CC [M]  fs/fuse/cuse.o
  CC      drivers/base/auxiliary_sysfs.o
  CC [M]  net/netfilter/xt_connmark.o
  CC [M]  drivers/misc/genwqe/card_ddcb.o
  CC      fs/char_dev.o
  CC [M]  drivers/misc/genwqe/card_sysfs.o
  CC [M]  drivers/misc/genwqe/card_debugfs.o
  CC [M]  drivers/misc/mei/interrupt.o
  CC      fs/btrfs/ulist.o
  CC [M]  drivers/regulator/rtmv20-regulator.o
  CC [M]  fs/9p/acl.o
  CC [M]  drivers/acpi/video_detect.o
  CC [M]  fs/overlayfs/params.o
  LD [M]  fs/cachefiles/cachefiles.o
  CC      fs/stat.o
  CC [M]  fs/smb/client/readdir.o
  CC      drivers/base/hypervisor.o
  CC [M]  net/ipv4/esp4.o
  CC      kernel/auditsc.o
  CC [M]  drivers/regulator/rtq2134-regulator.o
  CC      fs/btrfs/qgroup.o
  CC [M]  fs/fuse/virtio_fs.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_dev.o
  CC      fs/exec.o
  CC [M]  drivers/misc/vmw_vmci/vmci_handle_array.o
  CC [M]  fs/nfs/fs_context.o
  CC [M]  fs/overlayfs/xattrs.o
  CC [M]  drivers/misc/uacce/uacce.o
  CC [M]  net/netfilter/xt_nat.o
  CC [M]  drivers/misc/genwqe/card_utils.o
  LD [M]  fs/9p/9p.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_msg.o
  CC [M]  drivers/misc/vmw_vmci/vmci_host.o
  CC      kernel/audit_watch.o
  CC [M]  net/ipv4/esp4_offload.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.o
  CC      drivers/base/soc.o
  CC [M]  net/netfilter/xt_AUDIT.o
  CC      fs/btrfs/send.o
  CC [M]  drivers/regulator/rtq6752-regulator.o
  LD [M]  fs/overlayfs/overlay.o
  CC      drivers/misc/sram.o
  CC [M]  drivers/acpi/acpi_tad.o
  CC [M]  drivers/misc/mei/client.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.o
  CC [M]  drivers/misc/vmw_vmci/vmci_queue_pair.o
  LD [M]  drivers/misc/genwqe/genwqe_card.o
  LD [M]  fs/fuse/fuse.o
  CC [M]  drivers/acpi/platform_profile.o
  CC [M]  drivers/misc/mei/main.o
  CC [M]  net/ipv4/ipcomp.o
  CC [M]  fs/smb/client/ioctl.o
  LD [M]  fs/fuse/virtiofs.o
  CC [M]  drivers/misc/mei/dma-ring.o
  CC      kernel/audit_fsnotify.o
  CC      drivers/base/pinctrl.o
  CC [M]  fs/nfs/sysctl.o
  CC [M]  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_sg.o
  CC [M]  drivers/regulator/rtq2208-regulator.o
  CC [M]  net/netfilter/xt_CHECKSUM.o
  CC [M]  net/netfilter/xt_CLASSIFY.o
  CC [M]  drivers/acpi/sbshc.o
  CC [M]  drivers/misc/ad525x_dpot.o
  CC [M]  drivers/misc/mei/bus.o
  CC      drivers/base/devcoredump.o
  CC [M]  drivers/misc/bcm-vk/bcm_vk_tty.o
  CC [M]  drivers/acpi/sbs.o
  CC [M]  drivers/misc/mei/bus-fixup.o
  CC [M]  drivers/misc/vmw_vmci/vmci_resource.o
  CC [M]  fs/nfs/fscache.o
  CC      drivers/base/platform-msi.o
  CC      fs/btrfs/dev-replace.o
  CC      kernel/audit_tree.o
  CC [M]  net/ipv4/xfrm4_tunnel.o
  CC [M]  drivers/regulator/sky81452-regulator.o
  CC [M]  drivers/acpi/ec_sys.o
  CC [M]  drivers/misc/ad525x_dpot-i2c.o
  CC [M]  drivers/acpi/pfr_update.o
  CC [M]  net/ipv4/tunnel4.o
  CC      fs/btrfs/raid56.o
  CC [M]  net/ipv4/inet_diag.o
  CC [M]  fs/smb/client/sess.o
  LD [M]  drivers/misc/bcm-vk/bcm_vk.o
  CC [M]  drivers/acpi/pfr_telemetry.o
  CC [M]  drivers/misc/ad525x_dpot-spi.o
  CC [M]  drivers/misc/mei/debugfs.o
  CC      drivers/base/physical_location.o
  CC [M]  net/netfilter/xt_CONNSECMARK.o
  CC [M]  fs/nfs/nfs2super.o
  CC [M]  drivers/regulator/slg51000-regulator.o
  CC      fs/btrfs/uuid-tree.o
  CC [M]  fs/nfs/proc.o
  CC [M]  drivers/misc/vmw_vmci/vmci_route.o
  CC [M]  net/ipv4/tcp_diag.o
  CC      fs/pipe.o
  CC [M]  fs/smb/client/export.o
  CC [M]  drivers/acpi/acpi_pad.o
  LD [M]  drivers/misc/vmw_vmci/vmw_vmci.o
  CC      kernel/kprobes.o
  CC [M]  drivers/misc/mei/mei-trace.o
  CC      fs/btrfs/props.o
  CC [M]  fs/nfs/nfs2xdr.o
  CC      drivers/base/trace.o
  CC [M]  drivers/regulator/sy7636a-regulator.o
  CC      kernel/fail_function.o
  CC [M]  drivers/regulator/tps6105x-regulator.o
  CC [M]  fs/smb/client/unc.o
  CC [M]  drivers/misc/dummy-irq.o
  CC [M]  net/netfilter/xt_CT.o
  CC      fs/namei.o
  CC [M]  drivers/acpi/acpi_extlog.o
  CC [M]  net/ipv4/udp_diag.o
  CC      kernel/hung_task.o
  CC [M]  drivers/acpi/acpi_configfs.o
  CC [M]  drivers/misc/mei/pci-me.o
  CC [M]  drivers/regulator/tps62360-regulator.o
  CC [M]  fs/nfs/nfs3super.o
  CC      fs/btrfs/free-space-tree.o
  CC [M]  fs/smb/client/winucase.o
  CC [M]  net/ipv4/raw_diag.o
  CC [M]  net/netfilter/xt_DSCP.o
  AR      drivers/base/built-in.a
  CC      kernel/watchdog.o
  CC [M]  net/netfilter/xt_HL.o
  CC [M]  drivers/misc/mei/hw-me.o
  CC      kernel/watchdog_perf.o
  CC [M]  drivers/regulator/tps65023-regulator.o
  CC [M]  net/netfilter/xt_HMARK.o
  CC [M]  drivers/misc/mei/gsc-me.o
  CC      fs/btrfs/tree-checker.o
  CC      fs/fcntl.o
  CC [M]  drivers/misc/ics932s401.o
  CC [M]  fs/smb/client/smb2ops.o
  CC [M]  drivers/regulator/tps6507x-regulator.o
  LD [M]  drivers/acpi/video.o
  AR      drivers/acpi/built-in.a
  CC [M]  fs/nfs/nfs3client.o
  CC      kernel/seccomp.o
  CC [M]  net/netfilter/xt_LED.o
  CC [M]  fs/smb/client/smb2maperror.o
  CC [M]  drivers/regulator/tps65086-regulator.o
  CC [M]  net/netfilter/xt_LOG.o
  CC      fs/ioctl.o
  CC [M]  fs/smb/client/smb2transport.o
  CC [M]  fs/nfs/nfs3proc.o
  CC [M]  drivers/misc/mei/pci-txe.o
  LD [M]  net/ipv4/fou.o
  CC      fs/btrfs/space-info.o
  LD [M]  net/ipv4/gre.o
  LD [M]  net/ipv4/udp_tunnel.o
  AR      net/ipv4/built-in.a
  CC      fs/readdir.o
  CC [M]  drivers/misc/tifm_core.o
  CC [M]  fs/nfs/nfs3xdr.o
  CC [M]  fs/smb/client/smb2misc.o
  CC [M]  net/netfilter/xt_NETMAP.o
  CC [M]  drivers/regulator/tps65090-regulator.o
  CC      fs/select.o
  CC [M]  drivers/misc/mei/hw-txe.o
  CC [M]  fs/nfs/nfs3acl.o
  CC      kernel/relay.o
  CC [M]  drivers/misc/tifm_7xx1.o
  CC [M]  drivers/misc/phantom.o
  CC      fs/dcache.o
  CC [M]  net/netfilter/xt_NFLOG.o
  CC [M]  drivers/regulator/tps6524x-regulator.o
  CC      kernel/utsname_sysctl.o
  CC [M]  net/netfilter/xt_NFQUEUE.o
  CC      fs/btrfs/block-rsv.o
  CC      fs/btrfs/delalloc-space.o
  CC [M]  drivers/regulator/tps6586x-regulator.o
  CC      fs/btrfs/block-group.o
  CC      fs/inode.o
  CC [M]  fs/smb/client/smb2pdu.o
  CC [M]  net/netfilter/xt_RATEEST.o
  CC [M]  net/netfilter/xt_REDIRECT.o
  CC      fs/btrfs/discard.o
  CC      kernel/delayacct.o
  CC [M]  drivers/misc/mei/vsc-tp.o
  CC [M]  drivers/regulator/tps65910-regulator.o
  CC [M]  drivers/misc/bh1770glc.o
  CC [M]  net/netfilter/xt_MASQUERADE.o
  CC [M]  drivers/misc/mei/vsc-fw-loader.o
  CC      fs/attr.o
  CC [M]  fs/nfs/nfs4proc.o
  CC      fs/btrfs/reflink.o
  CC [M]  fs/smb/client/smb2inode.o
  CC [M]  net/netfilter/xt_SECMARK.o
  CC      fs/btrfs/subpage.o
  CC      kernel/taskstats.o
  CC [M]  fs/smb/client/smb2file.o
  CC      fs/bad_inode.o
  CC [M]  drivers/regulator/tps65912-regulator.o
  CC [M]  net/netfilter/xt_TPROXY.o
  CC      fs/file.o
  CC [M]  drivers/misc/apds990x.o
  CC [M]  fs/nfs/nfs4xdr.o
  CC [M]  fs/smb/client/cifsacl.o
  CC      kernel/tsacct.o
  CC [M]  drivers/regulator/tps65132-regulator.o
  CC [M]  net/netfilter/xt_TCPMSS.o
  CC [M]  drivers/misc/mei/platform-vsc.o
  CC      fs/btrfs/tree-mod-log.o
  CC [M]  fs/nfs/nfs4state.o
  CC      fs/btrfs/extent-io-tree.o
  CC [M]  fs/smb/client/fs_context.o
  CC      fs/filesystems.o
  LD [M]  drivers/misc/mei/mei.o
  CC      fs/namespace.o
  CC [M]  drivers/regulator/tps68470-regulator.o
  CC      kernel/tracepoint.o
  CC      fs/btrfs/fs.o
  CC [M]  fs/nfs/nfs4renewd.o
  CC [M]  net/netfilter/xt_TCPOPTSTRIP.o
  CC      fs/seq_file.o
  LD [M]  drivers/misc/mei/mei-me.o
  CC      kernel/latencytop.o
  CC [M]  drivers/misc/enclosure.o
  LD [M]  drivers/misc/mei/mei-gsc.o
  LD [M]  drivers/misc/mei/mei-txe.o
  LD [M]  drivers/misc/mei/mei-vsc-hw.o
  CC      kernel/irq_work.o
  LD [M]  drivers/misc/mei/mei-vsc.o
  CC [M]  fs/nfs/nfs4super.o
  CC      fs/xattr.o
  CC [M]  drivers/regulator/twl-regulator.o
  CC      kernel/static_call.o
  CC      fs/btrfs/messages.o
  CC [M]  drivers/misc/smpro-errmon.o
  CC [M]  fs/nfs/nfs4file.o
  CC [M]  fs/smb/client/dns_resolve.o
  CC [M]  drivers/regulator/twl6030-regulator.o
  CC [M]  net/netfilter/xt_TEE.o
  CC [M]  fs/nfs/delegation.o
  CC [M]  drivers/regulator/wm831x-dcdc.o
  CC      fs/btrfs/bio.o
  CC [M]  drivers/misc/smpro-misc.o
  CC [M]  net/netfilter/xt_TRACE.o
  CC      kernel/static_call_inline.o
  CC [M]  drivers/regulator/wm831x-isink.o
  CC [M]  fs/nfs/nfs4idmap.o
  ASN.1   fs/smb/client/cifs_spnego_negtokeninit.asn1.[ch]
  CC      fs/libfs.o
  CC      fs/fs-writeback.o
  CC [M]  fs/nfs/callback.o
  CC      fs/pnode.o
  CC [M]  fs/smb/client/namespace.o
  CC      fs/btrfs/lru_cache.o
  CC [M]  drivers/misc/hpilo.o
  CC [M]  net/netfilter/xt_IDLETIMER.o
  CC [M]  drivers/misc/apds9802als.o
  CC      kernel/user-return-notifier.o
  CC [M]  drivers/regulator/wm831x-ldo.o
  CC      fs/splice.o
  CC      fs/btrfs/raid-stripe-tree.o
  CC [M]  net/netfilter/xt_addrtype.o
  CC [M]  drivers/regulator/wm8350-regulator.o
  CC      fs/btrfs/fiemap.o
  CC [M]  fs/nfs/callback_xdr.o
  CC      kernel/padata.o
  CC [M]  fs/smb/client/reparse.o
  CC      fs/sync.o
  CC [M]  drivers/misc/isl29003.o
  CC [M]  fs/smb/client/xattr.o
  CC [M]  drivers/misc/isl29020.o
  CC [M]  drivers/regulator/wm8400-regulator.o
  CC [M]  net/netfilter/xt_bpf.o
  CC [M]  fs/smb/client/cifs_spnego.o
  CC [M]  drivers/misc/tsl2550.o
  CC      kernel/jump_label.o
  CC [M]  net/netfilter/xt_cluster.o
  CC [M]  fs/smb/client/dfs_cache.o
  CC      kernel/context_tracking.o
  CC      fs/btrfs/direct-io.o
  CC [M]  net/netfilter/xt_comment.o
  CC      fs/btrfs/acl.o
  CC [M]  drivers/regulator/wm8994-regulator.o
  CC      fs/btrfs/zoned.o
  CC      kernel/iomem.o
  CC [M]  fs/smb/client/dfs.o
  CC [M]  drivers/misc/ds1682.o
  CC [M]  net/netfilter/xt_connbytes.o
  CC      fs/btrfs/verity.o
  CC      fs/utimes.o
  CC [M]  drivers/misc/hmc6352.o
  CC [M]  fs/nfs/callback_proc.o
  CC [M]  drivers/misc/vmw_balloon.o
  CC      kernel/rseq.o
  CC      fs/d_path.o
  CC      kernel/watch_queue.o
  CHK     kernel/kheaders_data.tar.xz
  CC [M]  net/netfilter/xt_connlabel.o
  CC [M]  drivers/misc/lattice-ecp3-config.o
  CC [M]  drivers/misc/dw-xdata-pcie.o
  GEN     kernel/kheaders_data.tar.xz
  CC      fs/stack.o
  GZIP    kernel/config_data.gz
  CC      fs/fs_struct.o
  CC [M]  drivers/misc/xilinx_sdfec.o
  CC [M]  fs/nfs/nfs4namespace.o
  CC [M]  fs/nfs/nfs4getroot.o
  CC [M]  net/netfilter/xt_connlimit.o
  CC [M]  drivers/misc/tps6594-esm.o
  CC [M]  fs/smb/client/netlink.o
  AR      drivers/regulator/built-in.a
  CC [M]  drivers/misc/tps6594-pfsm.o
  CC [M]  fs/nfs/nfs4client.o
  CC      fs/statfs.o
  CC      fs/fs_pin.o
  CC [M]  drivers/misc/nsm.o
  CC      kernel/configs.o
  CC [M]  net/netfilter/xt_conntrack.o
  CC [M]  net/netfilter/xt_cpu.o
  CC [M]  fs/nfs/nfs4session.o
  CC [M]  net/netfilter/xt_dccp.o
  CC      fs/nsfs.o
  CC [M]  fs/smb/client/cifs_swn.o
  CC [M]  fs/nfs/dns_resolve.o
  CC [M]  net/netfilter/xt_devgroup.o
  CC [M]  net/netfilter/xt_dscp.o
  CC [M]  net/netfilter/xt_ecn.o
  CC      fs/fs_types.o
  CC [M]  fs/nfs/nfs4trace.o
  CC [M]  net/netfilter/xt_esp.o
  CC [M]  fs/smb/client/fscache.o
  CC [M]  fs/nfs/nfs4sysctl.o
  CC [M]  net/netfilter/xt_hashlimit.o
  CC [M]  fs/smb/client/smb1ops.o
  AR      kernel/built-in.a
  CC [M]  net/netfilter/xt_helper.o
  CC [M]  fs/nfs/pnfs.o
  AR      drivers/misc/built-in.a
make[3]: *** [../scripts/Makefile.build:461: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
  CC [M]  fs/smb/client/cifssmb.o
  CC [M]  net/netfilter/xt_hl.o
  CC      fs/fs_context.o
  CC [M]  fs/nfs/pnfs_dev.o
  CC [M]  fs/smb/client/cifs_spnego_negtokeninit.asn1.o
  CC [M]  net/netfilter/xt_ipcomp.o
  CC [M]  fs/smb/client/asn1.o
  CC [M]  fs/nfs/pnfs_nfs.o
  CC [M]  net/netfilter/xt_iprange.o
  AR      fs/btrfs/built-in.a
  CC      fs/fs_parser.o
  CC [M]  net/netfilter/xt_l2tp.o
  CC      fs/fsopen.o
  CC      fs/init.o
  CC [M]  fs/nfs/nfs42proc.o
  CC      fs/kernel_read_file.o
  CC [M]  net/netfilter/xt_length.o
  CC [M]  fs/nfs/nfs42xattr.o
  CC [M]  net/netfilter/xt_limit.o
  LD [M]  fs/nfs/nfs.o
  CC      fs/mnt_idmapping.o
  CC [M]  net/netfilter/xt_mac.o
  LD [M]  fs/nfs/nfsv2.o
  CC [M]  net/netfilter/xt_multiport.o
  LD [M]  fs/nfs/nfsv3.o
  CC [M]  net/netfilter/xt_nfacct.o
  CC      fs/remap_range.o
  CC      fs/pidfs.o
  CC      fs/buffer.o
  CC [M]  net/netfilter/xt_osf.o
  CC      fs/mpage.o
  CC      fs/proc_namespace.o
  CC [M]  net/netfilter/xt_owner.o
  CC      fs/direct-io.o
  CC      fs/eventpoll.o
  CC [M]  net/netfilter/xt_cgroup.o
  CC      fs/anon_inodes.o
  CC [M]  net/netfilter/xt_physdev.o
  CC      fs/signalfd.o
  CC [M]  net/netfilter/xt_pkttype.o
  CC      fs/timerfd.o
  CC [M]  net/netfilter/xt_policy.o
  CC      fs/eventfd.o
  CC [M]  net/netfilter/xt_quota.o
  CC      fs/userfaultfd.o
  CC      fs/aio.o
  CC      fs/dax.o
  CC [M]  net/netfilter/xt_rateest.o
  CC [M]  net/netfilter/xt_realm.o
  CC [M]  net/netfilter/xt_recent.o
  CC [M]  net/netfilter/xt_sctp.o
  CC [M]  net/netfilter/xt_socket.o
  CC      fs/locks.o
  CC [M]  net/netfilter/xt_state.o
  CC      fs/binfmt_script.o
  CC      fs/binfmt_elf.o
  CC      fs/compat_binfmt_elf.o
  CC [M]  net/netfilter/xt_statistic.o
  CC      fs/backing-file.o
  LD [M]  fs/smb/client/cifs.o
  CC      fs/mbcache.o
  CC      fs/posix_acl.o
  CC [M]  net/netfilter/xt_string.o
  CC      fs/coredump.o
  CC      fs/drop_caches.o
  CC [M]  net/netfilter/xt_tcpmss.o
  CC      fs/sysctls.o
  CC [M]  net/netfilter/xt_time.o
  CC      fs/fhandle.o
  CC      fs/bpf_fs_kfuncs.o
  CC [M]  net/netfilter/xt_u32.o
  CC [M]  fs/binfmt_misc.o
  LD [M]  net/netfilter/nf_conntrack.o
  LD [M]  net/netfilter/nf_conntrack_h323.o
  LD [M]  net/netfilter/nf_nat.o
  LD [M]  net/netfilter/nf_tables.o
  LD [M]  net/netfilter/nf_flow_table.o
  AR      net/netfilter/built-in.a
  AR      net/built-in.a
  LD [M]  fs/nfs/nfsv4.o
  AR      fs/built-in.a
  CC [M]  kernel/kheaders.o
make[2]: *** [/kernel/Makefile:2003: .] Error 2
make[1]: Leaving directory '/kernel/build64-debug'
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


