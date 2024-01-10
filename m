Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049DAC4707B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 16:59:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B463D10E616;
	Wed, 10 Jan 2024 16:59:35 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B342910E610;
 Wed, 10 Jan 2024 16:59:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EBuild=3A_success_for_series_starting_with_=5BCI=2C1?=
 =?utf-8?q?/2=5D_Revert_=22mei/hdcp=3A_Also_enable_for_XE=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 10 Jan 2024 16:59:34 -0000
Message-ID: <170490597471.240792.7320840745077614546@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240110155645.523818-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240110155645.523818-1-thomas.hellstrom@linux.intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [CI,1/2] Revert "mei/hdcp: Also enable for XE"
URL   : https://patchwork.freedesktop.org/series/128437/
State : success

== Summary ==

+ trap cleanup EXIT
+ cd /kernel
+ git clone https://gitlab.freedesktop.org/drm/xe/ci.git .ci
Cloning into '.ci'...
+ '[' -n '' ']'
++ date +%s
+ echo -e '\e[0Ksection_start:1704905523:build_x86_64[collapsed=true]\r\e[0KBuild x86-64'
+ mkdir -p build64-default
[0Ksection_start:1704905523:build_x86_64[collapsed=true]
[0KBuild x86-64
+ cp .ci/kernel/kconfig build64-default/.config
+ make O=build64-default olddefconfig
make[1]: Entering directory '/kernel/build64-default'
  GEN     Makefile
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/menu.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#
make[1]: Leaving directory '/kernel/build64-default'
++ nproc
+ make O=build64-default -j48
make[1]: Entering directory '/kernel/build64-default'
  GEN     arch/x86/include/generated/asm/orc_hash.h
  GEN     Makefile
  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/x86/include/generated/uapi/asm/errno.h
  WRAP    arch/x86/include/generated/uapi/asm/fcntl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctls.h
  WRAP    arch/x86/include/generated/uapi/asm/ipcbuf.h
  WRAP    arch/x86/include/generated/uapi/asm/param.h
  UPD     include/generated/uapi/linux/version.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  WRAP    arch/x86/include/generated/uapi/asm/resource.h
  WRAP    arch/x86/include/generated/uapi/asm/socket.h
  WRAP    arch/x86/include/generated/uapi/asm/sockios.h
  WRAP    arch/x86/include/generated/uapi/asm/termbits.h
  WRAP    arch/x86/include/generated/uapi/asm/termios.h
  WRAP    arch/x86/include/generated/uapi/asm/types.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_32_ia32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
  WRAP    arch/x86/include/generated/asm/early_ioremap.h
  WRAP    arch/x86/include/generated/asm/irq_regs.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
  WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
  WRAP    arch/x86/include/generated/asm/kmap_size.h
  WRAP    arch/x86/include/generated/asm/mmiowb.h
  WRAP    arch/x86/include/generated/asm/local64.h
  WRAP    arch/x86/include/generated/asm/module.lds.h
  WRAP    arch/x86/include/generated/asm/rwonce.h
  WRAP    arch/x86/include/generated/asm/unaligned.h
  HOSTCC  arch/x86/tools/relocs_32.o
  UPD     include/config/kernel.release
  HOSTCC  arch/x86/tools/relocs_64.o
  UPD     include/generated/compile.h
  HOSTCC  arch/x86/tools/relocs_common.o
  HOSTCC  scripts/unifdef
mkdir -p /kernel/build64-default/tools/objtool && make O=/kernel/build64-default subdir=tools/objtool --no-print-directory -C objtool 
  UPD     include/generated/utsrelease.h
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/sorttable
  HOSTCC  scripts/asn1_compiler
  HOSTCC  /kernel/build64-default/tools/objtool/fixdep.o
  HOSTLD  /kernel/build64-default/tools/objtool/fixdep-in.o
  LINK    /kernel/build64-default/tools/objtool/fixdep
  INSTALL /kernel/build64-default/tools/objtool/libsubcmd/include/subcmd/exec-cmd.h
  INSTALL /kernel/build64-default/tools/objtool/libsubcmd/include/subcmd/help.h
  INSTALL /kernel/build64-default/tools/objtool/libsubcmd/include/subcmd/pager.h
  INSTALL /kernel/build64-default/tools/objtool/libsubcmd/include/subcmd/parse-options.h
  INSTALL /kernel/build64-default/tools/objtool/libsubcmd/include/subcmd/run-command.h
  CC      /kernel/build64-default/tools/objtool/libsubcmd/exec-cmd.o
  INSTALL libsubcmd_headers
  CC      /kernel/build64-default/tools/objtool/libsubcmd/help.o
  CC      /kernel/build64-default/tools/objtool/libsubcmd/pager.o
  CC      /kernel/build64-default/tools/objtool/libsubcmd/parse-options.o
  CC      /kernel/build64-default/tools/objtool/libsubcmd/run-command.o
  CC      /kernel/build64-default/tools/objtool/libsubcmd/sigchain.o
  CC      /kernel/build64-default/tools/objtool/libsubcmd/subcmd-config.o
  HOSTLD  arch/x86/tools/relocs
  CC      scripts/mod/empty.o
  HOSTCC  scripts/mod/mk_elfconfig
  CC      scripts/mod/devicetable-offsets.s
  HDRINST usr/include/video/edid.h
  HDRINST usr/include/video/sisfb.h
  HDRINST usr/include/video/uvesafb.h
  HDRINST usr/include/drm/amdgpu_drm.h
  HDRINST usr/include/drm/qaic_accel.h
  HDRINST usr/include/drm/pvr_drm.h
  HDRINST usr/include/drm/i915_drm.h
  HDRINST usr/include/drm/vgem_drm.h
  HDRINST usr/include/drm/virtgpu_drm.h
  HDRINST usr/include/drm/xe_drm.h
  HDRINST usr/include/drm/radeon_drm.h
  HDRINST usr/include/drm/omap_drm.h
  HDRINST usr/include/drm/tegra_drm.h
  HDRINST usr/include/drm/drm_mode.h
  HDRINST usr/include/drm/ivpu_accel.h
  HDRINST usr/include/drm/drm_sarea.h
  HDRINST usr/include/drm/exynos_drm.h
  HDRINST usr/include/drm/v3d_drm.h
  HDRINST usr/include/drm/qxl_drm.h
  HDRINST usr/include/drm/drm_fourcc.h
  HDRINST usr/include/drm/nouveau_drm.h
  HDRINST usr/include/drm/habanalabs_accel.h
  HDRINST usr/include/drm/vmwgfx_drm.h
  HDRINST usr/include/drm/msm_drm.h
  HDRINST usr/include/drm/etnaviv_drm.h
  HDRINST usr/include/drm/vc4_drm.h
  HDRINST usr/include/drm/lima_drm.h
  HDRINST usr/include/drm/panfrost_drm.h
  HDRINST usr/include/drm/drm.h
  HDRINST usr/include/drm/armada_drm.h
  HDRINST usr/include/mtd/inftl-user.h
  HDRINST usr/include/mtd/nftl-user.h
  HDRINST usr/include/mtd/mtd-user.h
  HDRINST usr/include/mtd/ubi-user.h
  HDRINST usr/include/mtd/mtd-abi.h
  HDRINST usr/include/xen/gntdev.h
  HDRINST usr/include/xen/gntalloc.h
  HDRINST usr/include/xen/evtchn.h
  HDRINST usr/include/xen/privcmd.h
  HDRINST usr/include/asm-generic/auxvec.h
  HDRINST usr/include/asm-generic/bitsperlong.h
  HDRINST usr/include/asm-generic/posix_types.h
  HDRINST usr/include/asm-generic/ioctls.h
  HDRINST usr/include/asm-generic/mman.h
  HDRINST usr/include/asm-generic/shmbuf.h
  HDRINST usr/include/asm-generic/bpf_perf_event.h
  HDRINST usr/include/asm-generic/types.h
  HDRINST usr/include/asm-generic/poll.h
  HDRINST usr/include/asm-generic/msgbuf.h
  HDRINST usr/include/asm-generic/swab.h
  HDRINST usr/include/asm-generic/statfs.h
  HDRINST usr/include/asm-generic/unistd.h
  HDRINST usr/include/asm-generic/hugetlb_encode.h
  HDRINST usr/include/asm-generic/resource.h
  HDRINST usr/include/asm-generic/param.h
  HDRINST usr/include/asm-generic/termbits-common.h
  HDRINST usr/include/asm-generic/sockios.h
  HDRINST usr/include/asm-generic/kvm_para.h
  HDRINST usr/include/asm-generic/errno.h
  HDRINST usr/include/asm-generic/termios.h
  HDRINST usr/include/asm-generic/mman-common.h
  HDRINST usr/include/asm-generic/ioctl.h
  HDRINST usr/include/asm-generic/socket.h
  HDRINST usr/include/asm-generic/signal-defs.h
  HDRINST usr/include/asm-generic/termbits.h
  HDRINST usr/include/asm-generic/int-ll64.h
  HDRINST usr/include/asm-generic/signal.h
  HDRINST usr/include/asm-generic/siginfo.h
  HDRINST usr/include/asm-generic/stat.h
  HDRINST usr/include/asm-generic/int-l64.h
  HDRINST usr/include/asm-generic/errno-base.h
  HDRINST usr/include/asm-generic/fcntl.h
  HDRINST usr/include/asm-generic/setup.h
  HDRINST usr/include/asm-generic/ipcbuf.h
  HDRINST usr/include/asm-generic/sembuf.h
  HDRINST usr/include/asm-generic/ucontext.h
  HDRINST usr/include/rdma/mlx5_user_ioctl_cmds.h
  HDRINST usr/include/rdma/irdma-abi.h
  HDRINST usr/include/rdma/mana-abi.h
  HDRINST usr/include/rdma/hfi/hfi1_user.h
  HDRINST usr/include/rdma/hfi/hfi1_ioctl.h
  HDRINST usr/include/rdma/rdma_user_rxe.h
  HDRINST usr/include/rdma/rdma_user_ioctl.h
  HDRINST usr/include/rdma/mlx5_user_ioctl_verbs.h
  HDRINST usr/include/rdma/bnxt_re-abi.h
  HDRINST usr/include/rdma/hns-abi.h
  HDRINST usr/include/rdma/qedr-abi.h
  HDRINST usr/include/rdma/ib_user_ioctl_cmds.h
  HDRINST usr/include/rdma/vmw_pvrdma-abi.h
  UPD     scripts/mod/devicetable-offsets.h
  HDRINST usr/include/rdma/ib_user_ioctl_verbs.h
  HDRINST usr/include/rdma/ib_user_sa.h
  HDRINST usr/include/rdma/rvt-abi.h
  HDRINST usr/include/rdma/mlx5-abi.h
  HDRINST usr/include/rdma/rdma_netlink.h
  HDRINST usr/include/rdma/erdma-abi.h
  HDRINST usr/include/rdma/rdma_user_ioctl_cmds.h
  HDRINST usr/include/rdma/rdma_user_cm.h
  HDRINST usr/include/rdma/ib_user_verbs.h
  HDRINST usr/include/rdma/efa-abi.h
  HDRINST usr/include/rdma/siw-abi.h
  HDRINST usr/include/rdma/mlx4-abi.h
  HDRINST usr/include/rdma/mthca-abi.h
  HDRINST usr/include/rdma/ib_user_mad.h
  HDRINST usr/include/rdma/ocrdma-abi.h
  HDRINST usr/include/rdma/cxgb4-abi.h
  HDRINST usr/include/misc/xilinx_sdfec.h
  HDRINST usr/include/misc/uacce/hisi_qm.h
  HDRINST usr/include/misc/uacce/uacce.h
  HDRINST usr/include/misc/cxl.h
  HDRINST usr/include/misc/ocxl.h
  HDRINST usr/include/misc/fastrpc.h
  HDRINST usr/include/misc/pvpanic.h
  HDRINST usr/include/linux/i8k.h
  HDRINST usr/include/linux/acct.h
  HDRINST usr/include/linux/atmmpc.h
  HDRINST usr/include/linux/fs.h
  HDRINST usr/include/linux/cifs/cifs_mount.h
  HDRINST usr/include/linux/cifs/cifs_netlink.h
  MKELF   scripts/mod/elfconfig.h
  HDRINST usr/include/linux/if_packet.h
  HDRINST usr/include/linux/route.h
  HDRINST usr/include/linux/patchkey.h
  HDRINST usr/include/linux/tc_ematch/tc_em_cmp.h
  HDRINST usr/include/linux/tc_ematch/tc_em_ipt.h
  HOSTCC  scripts/mod/modpost.o
  HDRINST usr/include/linux/tc_ematch/tc_em_meta.h
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/sumversion.o
  HDRINST usr/include/linux/tc_ematch/tc_em_nbyte.h
  HDRINST usr/include/linux/tc_ematch/tc_em_text.h
  HOSTCC  scripts/mod/symsearch.o
  HDRINST usr/include/linux/virtio_pmem.h
  HDRINST usr/include/linux/rkisp1-config.h
  HDRINST usr/include/linux/vhost.h
  HDRINST usr/include/linux/cec-funcs.h
  HDRINST usr/include/linux/ppdev.h
  HDRINST usr/include/linux/isdn/capicmd.h
  HDRINST usr/include/linux/virtio_fs.h
  HDRINST usr/include/linux/netfilter_ipv6.h
  HDRINST usr/include/linux/lirc.h
  HDRINST usr/include/linux/mroute6.h
  HDRINST usr/include/linux/nl80211-vnd-intel.h
  HDRINST usr/include/linux/ivtvfb.h
  HDRINST usr/include/linux/auxvec.h
  HDRINST usr/include/linux/dm-log-userspace.h
  HDRINST usr/include/linux/dccp.h
  HDRINST usr/include/linux/virtio_scmi.h
  HDRINST usr/include/linux/atmarp.h
  HDRINST usr/include/linux/arcfb.h
  HDRINST usr/include/linux/nbd-netlink.h
  HDRINST usr/include/linux/sched/types.h
  HDRINST usr/include/linux/tcp.h
  HDRINST usr/include/linux/neighbour.h
  HDRINST usr/include/linux/dlm_device.h
  HDRINST usr/include/linux/wmi.h
  HDRINST usr/include/linux/btrfs_tree.h
  HDRINST usr/include/linux/virtio_crypto.h
  HDRINST usr/include/linux/vbox_err.h
  HDRINST usr/include/linux/edd.h
  HDRINST usr/include/linux/loop.h
  HDRINST usr/include/linux/nvme_ioctl.h
  HDRINST usr/include/linux/mmtimer.h
  HDRINST usr/include/linux/if_pppol2tp.h
  HDRINST usr/include/linux/mtio.h
  HDRINST usr/include/linux/if_arcnet.h
  HDRINST usr/include/linux/romfs_fs.h
  HDRINST usr/include/linux/posix_types.h
  HDRINST usr/include/linux/rtc.h
  HDRINST usr/include/linux/landlock.h
  HDRINST usr/include/linux/gpio.h
  HDRINST usr/include/linux/selinux_netlink.h
  HDRINST usr/include/linux/pps.h
  HDRINST usr/include/linux/ndctl.h
  HDRINST usr/include/linux/virtio_gpu.h
  HDRINST usr/include/linux/android/binderfs.h
  HDRINST usr/include/linux/android/binder.h
  HDRINST usr/include/linux/virtio_vsock.h
  HDRINST usr/include/linux/sound.h
  HDRINST usr/include/linux/vtpm_proxy.h
  HDRINST usr/include/linux/nfs_fs.h
  HDRINST usr/include/linux/elf-fdpic.h
  HDRINST usr/include/linux/adfs_fs.h
  HDRINST usr/include/linux/target_core_user.h
  HDRINST usr/include/linux/netlink_diag.h
  HDRINST usr/include/linux/const.h
  HDRINST usr/include/linux/firewire-cdev.h
  HDRINST usr/include/linux/vdpa.h
  HDRINST usr/include/linux/if_infiniband.h
  HDRINST usr/include/linux/iio/types.h
  HDRINST usr/include/linux/serial.h
  HDRINST usr/include/linux/iio/buffer.h
  HDRINST usr/include/linux/iio/events.h
  HDRINST usr/include/linux/baycom.h
  HDRINST usr/include/linux/major.h
  HDRINST usr/include/linux/atmppp.h
  HDRINST usr/include/linux/ipv6_route.h
  HDRINST usr/include/linux/spi/spidev.h
  HDRINST usr/include/linux/spi/spi.h
  HDRINST usr/include/linux/virtio_ring.h
  HDRINST usr/include/linux/hdlc/ioctl.h
  HDRINST usr/include/linux/remoteproc_cdev.h
  HDRINST usr/include/linux/hyperv.h
  HDRINST usr/include/linux/rpl_iptunnel.h
  HDRINST usr/include/linux/sync_file.h
  HDRINST usr/include/linux/igmp.h
  HDRINST usr/include/linux/v4l2-dv-timings.h
  HDRINST usr/include/linux/virtio_i2c.h
  HDRINST usr/include/linux/xfrm.h
  HDRINST usr/include/linux/capability.h
  HDRINST usr/include/linux/gtp.h
  HDRINST usr/include/linux/xdp_diag.h
  HDRINST usr/include/linux/pkt_cls.h
  HDRINST usr/include/linux/suspend_ioctls.h
  HDRINST usr/include/linux/vt.h
  HDRINST usr/include/linux/loadpin.h
  HDRINST usr/include/linux/dlm_plock.h
  HDRINST usr/include/linux/fb.h
  HDRINST usr/include/linux/max2175.h
  HDRINST usr/include/linux/sunrpc/debug.h
  HDRINST usr/include/linux/gsmmux.h
  HDRINST usr/include/linux/watchdog.h
  HDRINST usr/include/linux/vhost_types.h
  HDRINST usr/include/linux/vduse.h
  HDRINST usr/include/linux/ila.h
  HDRINST usr/include/linux/tdx-guest.h
  HDRINST usr/include/linux/close_range.h
  HDRINST usr/include/linux/ivtv.h
  HDRINST usr/include/linux/cryptouser.h
  HDRINST usr/include/linux/netfilter/xt_string.h
  HDRINST usr/include/linux/netfilter/nfnetlink_compat.h
  HDRINST usr/include/linux/netfilter/nf_nat.h
  HDRINST usr/include/linux/netfilter/xt_recent.h
  HDRINST usr/include/linux/netfilter/xt_addrtype.h
  HDRINST usr/include/linux/netfilter/nf_conntrack_tcp.h
  HDRINST usr/include/linux/netfilter/xt_MARK.h
  HDRINST usr/include/linux/netfilter/xt_SYNPROXY.h
  HDRINST usr/include/linux/netfilter/xt_multiport.h
  HDRINST usr/include/linux/netfilter/xt_cgroup.h
  HDRINST usr/include/linux/netfilter/nfnetlink.h
  HDRINST usr/include/linux/netfilter/nf_synproxy.h
  HDRINST usr/include/linux/netfilter/xt_TCPOPTSTRIP.h
  HDRINST usr/include/linux/netfilter/nfnetlink_log.h
  HDRINST usr/include/linux/netfilter/xt_TPROXY.h
  HDRINST usr/include/linux/netfilter/xt_u32.h
  HDRINST usr/include/linux/netfilter/nfnetlink_osf.h
  HDRINST usr/include/linux/netfilter/xt_ecn.h
  HDRINST usr/include/linux/netfilter/xt_esp.h
  HDRINST usr/include/linux/netfilter/nfnetlink_hook.h
  HDRINST usr/include/linux/netfilter/xt_mac.h
  HDRINST usr/include/linux/netfilter/xt_comment.h
  HDRINST usr/include/linux/netfilter/xt_NFQUEUE.h
  HDRINST usr/include/linux/netfilter/xt_osf.h
  HDRINST usr/include/linux/netfilter/xt_hashlimit.h
  HDRINST usr/include/linux/netfilter/nf_conntrack_sctp.h
  HDRINST usr/include/linux/netfilter/xt_socket.h
  HDRINST usr/include/linux/netfilter/xt_connmark.h
  HDRINST usr/include/linux/netfilter/xt_sctp.h
  HDRINST usr/include/linux/netfilter/xt_tcpudp.h
  HDRINST usr/include/linux/netfilter/xt_DSCP.h
  HDRINST usr/include/linux/netfilter/xt_time.h
  HDRINST usr/include/linux/netfilter/xt_IDLETIMER.h
  HDRINST usr/include/linux/netfilter/xt_policy.h
  HDRINST usr/include/linux/netfilter/xt_rpfilter.h
  HDRINST usr/include/linux/netfilter/xt_nfacct.h
  HDRINST usr/include/linux/netfilter/xt_length.h
  HDRINST usr/include/linux/netfilter/xt_SECMARK.h
  HDRINST usr/include/linux/netfilter/nfnetlink_cthelper.h
  HDRINST usr/include/linux/netfilter/xt_quota.h
  HDRINST usr/include/linux/netfilter/xt_CLASSIFY.h
  HDRINST usr/include/linux/netfilter/xt_ipcomp.h
  HDRINST usr/include/linux/netfilter/xt_iprange.h
  HDRINST usr/include/linux/netfilter/xt_bpf.h
  HDRINST usr/include/linux/netfilter/xt_LOG.h
  HDRINST usr/include/linux/netfilter/xt_rateest.h
  HDRINST usr/include/linux/netfilter/xt_CONNSECMARK.h
  HDRINST usr/include/linux/netfilter/xt_HMARK.h
  HDRINST usr/include/linux/netfilter/xt_CONNMARK.h
  HDRINST usr/include/linux/netfilter/xt_pkttype.h
  HDRINST usr/include/linux/netfilter/xt_ipvs.h
  HDRINST usr/include/linux/netfilter/xt_devgroup.h
  HDRINST usr/include/linux/netfilter/xt_AUDIT.h
  HDRINST usr/include/linux/netfilter/xt_realm.h
  HDRINST usr/include/linux/netfilter/nf_conntrack_common.h
  HDRINST usr/include/linux/netfilter/xt_set.h
  HDRINST usr/include/linux/netfilter/xt_LED.h
  HDRINST usr/include/linux/netfilter/xt_connlabel.h
  HDRINST usr/include/linux/netfilter/xt_owner.h
  HDRINST usr/include/linux/netfilter/xt_dccp.h
  HDRINST usr/include/linux/netfilter/xt_limit.h
  HDRINST usr/include/linux/netfilter/xt_conntrack.h
  HDRINST usr/include/linux/netfilter/xt_TEE.h
  HDRINST usr/include/linux/netfilter/xt_RATEEST.h
  HDRINST usr/include/linux/netfilter/xt_connlimit.h
  HDRINST usr/include/linux/netfilter/ipset/ip_set_list.h
  HDRINST usr/include/linux/netfilter/ipset/ip_set.h
  HDRINST usr/include/linux/netfilter/ipset/ip_set_hash.h
  HDRINST usr/include/linux/netfilter/ipset/ip_set_bitmap.h
  HDRINST usr/include/linux/netfilter/x_tables.h
  HDRINST usr/include/linux/netfilter/xt_dscp.h
  HDRINST usr/include/linux/netfilter/nf_conntrack_ftp.h
  HDRINST usr/include/linux/netfilter/xt_cluster.h
  HDRINST usr/include/linux/netfilter/nf_conntrack_tuple_common.h
  HDRINST usr/include/linux/netfilter/nf_log.h
  HDRINST usr/include/linux/netfilter/xt_tcpmss.h
  HDRINST usr/include/linux/netfilter/xt_NFLOG.h
  HDRINST usr/include/linux/netfilter/xt_l2tp.h
  HDRINST usr/include/linux/netfilter/xt_helper.h
  HDRINST usr/include/linux/netfilter/xt_statistic.h
  HDRINST usr/include/linux/netfilter/nfnetlink_queue.h
  HDRINST usr/include/linux/netfilter/nfnetlink_cttimeout.h
  HDRINST usr/include/linux/netfilter/xt_CT.h
  HDRINST usr/include/linux/netfilter/xt_CHECKSUM.h
  HDRINST usr/include/linux/netfilter/xt_connbytes.h
  HDRINST usr/include/linux/netfilter/xt_state.h
  HDRINST usr/include/linux/netfilter/nf_tables.h
  HDRINST usr/include/linux/netfilter/xt_mark.h
  HDRINST usr/include/linux/netfilter/xt_cpu.h
  HDRINST usr/include/linux/netfilter/nf_tables_compat.h
  HDRINST usr/include/linux/netfilter/xt_physdev.h
  HDRINST usr/include/linux/netfilter/nfnetlink_conntrack.h
  HDRINST usr/include/linux/netfilter/nfnetlink_acct.h
  HDRINST usr/include/linux/netfilter/xt_TCPMSS.h
  HDRINST usr/include/linux/tty_flags.h
  HDRINST usr/include/linux/if_phonet.h
  HDRINST usr/include/linux/elf-em.h
  HDRINST usr/include/linux/vm_sockets.h
  HDRINST usr/include/linux/dlmconstants.h
  HDRINST usr/include/linux/bsg.h
  HDRINST usr/include/linux/matroxfb.h
  HDRINST usr/include/linux/sysctl.h
  HDRINST usr/include/linux/unix_diag.h
  HDRINST usr/include/linux/pcitest.h
  HDRINST usr/include/linux/mman.h
  HDRINST usr/include/linux/if_plip.h
  HDRINST usr/include/linux/virtio_balloon.h
  HDRINST usr/include/linux/pidfd.h
  HDRINST usr/include/linux/f2fs.h
  HDRINST usr/include/linux/x25.h
  HDRINST usr/include/linux/if_cablemodem.h
  HDRINST usr/include/linux/utsname.h
  HDRINST usr/include/linux/counter.h
  HDRINST usr/include/linux/atm_tcp.h
  HDRINST usr/include/linux/atalk.h
  HDRINST usr/include/linux/virtio_rng.h
  HDRINST usr/include/linux/vboxguest.h
  HDRINST usr/include/linux/bpf_perf_event.h
  HDRINST usr/include/linux/ipmi_ssif_bmc.h
  HDRINST usr/include/linux/nfs_mount.h
  HDRINST usr/include/linux/sonet.h
  HDRINST usr/include/linux/netfilter.h
  HDRINST usr/include/linux/keyctl.h
  HDRINST usr/include/linux/nl80211.h
  HDRINST usr/include/linux/misc/bcm_vk.h
  HDRINST usr/include/linux/audit.h
  HDRINST usr/include/linux/tipc_config.h
  HDRINST usr/include/linux/tipc_sockets_diag.h
  HDRINST usr/include/linux/futex.h
  HDRINST usr/include/linux/sev-guest.h
  HDRINST usr/include/linux/ublk_cmd.h
  HDRINST usr/include/linux/types.h
  HDRINST usr/include/linux/virtio_input.h
  HDRINST usr/include/linux/if_slip.h
  HDRINST usr/include/linux/personality.h
  HDRINST usr/include/linux/openat2.h
  HDRINST usr/include/linux/poll.h
  HDRINST usr/include/linux/posix_acl.h
  HDRINST usr/include/linux/smc_diag.h
  HDRINST usr/include/linux/snmp.h
  HDRINST usr/include/linux/errqueue.h
  HDRINST usr/include/linux/if_tunnel.h
  HDRINST usr/include/linux/fanotify.h
  HDRINST usr/include/linux/kernel.h
  HDRINST usr/include/linux/rtnetlink.h
  HDRINST usr/include/linux/rpl.h
  HDRINST usr/include/linux/memfd.h
  HDRINST usr/include/linux/serial_core.h
  LD      /kernel/build64-default/tools/objtool/libsubcmd/libsubcmd-in.o
  HDRINST usr/include/linux/dns_resolver.h
  HDRINST usr/include/linux/pr.h
  HDRINST usr/include/linux/atm_eni.h
  HDRINST usr/include/linux/lp.h
  HDRINST usr/include/linux/virtio_mem.h
  HDRINST usr/include/linux/ultrasound.h
  HDRINST usr/include/linux/sctp.h
  HDRINST usr/include/linux/uio.h
  HDRINST usr/include/linux/tcp_metrics.h
  HDRINST usr/include/linux/wwan.h
  HDRINST usr/include/linux/atmbr2684.h
  HDRINST usr/include/linux/in_route.h
  HDRINST usr/include/linux/qemu_fw_cfg.h
  HDRINST usr/include/linux/if_macsec.h
  HDRINST usr/include/linux/usb/charger.h
  HDRINST usr/include/linux/usb/g_uvc.h
  HDRINST usr/include/linux/usb/gadgetfs.h
  HDRINST usr/include/linux/usb/raw_gadget.h
  HDRINST usr/include/linux/usb/cdc-wdm.h
  HDRINST usr/include/linux/usb/midi.h
  HDRINST usr/include/linux/usb/g_printer.h
  HDRINST usr/include/linux/usb/tmc.h
  HDRINST usr/include/linux/usb/video.h
  HDRINST usr/include/linux/usb/functionfs.h
  HDRINST usr/include/linux/usb/audio.h
  HDRINST usr/include/linux/usb/ch11.h
  HDRINST usr/include/linux/usb/ch9.h
  HDRINST usr/include/linux/usb/cdc.h
  HDRINST usr/include/linux/jffs2.h
  HDRINST usr/include/linux/ax25.h
  HDRINST usr/include/linux/auto_fs.h
  HDRINST usr/include/linux/tiocl.h
  HDRINST usr/include/linux/scc.h
  HDRINST usr/include/linux/psci.h
  HDRINST usr/include/linux/swab.h
  AR      /kernel/build64-default/tools/objtool/libsubcmd/libsubcmd.a
  HDRINST usr/include/linux/cec.h
  HDRINST usr/include/linux/kfd_ioctl.h
  HDRINST usr/include/linux/smc.h
  HDRINST usr/include/linux/qrtr.h
  HDRINST usr/include/linux/screen_info.h
  HDRINST usr/include/linux/nfsacl.h
  HDRINST usr/include/linux/seg6_hmac.h
  HDRINST usr/include/linux/gameport.h
  HDRINST usr/include/linux/wireless.h
  HDRINST usr/include/linux/fdreg.h
  HDRINST usr/include/linux/cciss_defs.h
  HDRINST usr/include/linux/serial_reg.h
  HDRINST usr/include/linux/perf_event.h
  HDRINST usr/include/linux/in6.h
  HDRINST usr/include/linux/hid.h
  HDRINST usr/include/linux/netlink.h
  HDRINST usr/include/linux/fuse.h
  HDRINST usr/include/linux/magic.h
  HDRINST usr/include/linux/stm.h
  HDRINST usr/include/linux/ioam6_iptunnel.h
  HDRINST usr/include/linux/vsockmon.h
  HDRINST usr/include/linux/seg6.h
  HDRINST usr/include/linux/idxd.h
  HDRINST usr/include/linux/nitro_enclaves.h
  HDRINST usr/include/linux/ptrace.h
  HDRINST usr/include/linux/ioam6_genl.h
  HDRINST usr/include/linux/qnx4_fs.h
  HDRINST usr/include/linux/fsl_mc.h
  HDRINST usr/include/linux/net_tstamp.h
  HDRINST usr/include/linux/msg.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_TTL.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_ttl.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_ah.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_ECN.h
  HDRINST usr/include/linux/netfilter_ipv4/ip_tables.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_ecn.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_CLUSTERIP.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_REJECT.h
  HDRINST usr/include/linux/netfilter_ipv4/ipt_LOG.h
  HDRINST usr/include/linux/sem.h
  HDRINST usr/include/linux/net_namespace.h
  HDRINST usr/include/linux/radeonfb.h
  HDRINST usr/include/linux/tee.h
  HDRINST usr/include/linux/udp.h
  HDRINST usr/include/linux/virtio_bt.h
  HDRINST usr/include/linux/v4l2-subdev.h
  HDRINST usr/include/linux/posix_acl_xattr.h
  HDRINST usr/include/linux/v4l2-mediabus.h
  HDRINST usr/include/linux/atmapi.h
  HDRINST usr/include/linux/raid/md_p.h
  HDRINST usr/include/linux/raid/md_u.h
  CC      /kernel/build64-default/tools/objtool/weak.o
  HDRINST usr/include/linux/zorro_ids.h
  HDRINST usr/include/linux/nbd.h
  HDRINST usr/include/linux/isst_if.h
  CC      /kernel/build64-default/tools/objtool/check.o
  HDRINST usr/include/linux/rxrpc.h
  HDRINST usr/include/linux/unistd.h
  CC      /kernel/build64-default/tools/objtool/special.o
  HDRINST usr/include/linux/if_arp.h
  HDRINST usr/include/linux/atm_zatm.h
  HDRINST usr/include/linux/io_uring.h
  HDRINST usr/include/linux/if_fddi.h
  CC      /kernel/build64-default/tools/objtool/builtin-check.o
  MKDIR   /kernel/build64-default/tools/objtool/arch/x86/
  CC      /kernel/build64-default/tools/objtool/elf.o
  HDRINST usr/include/linux/bpqether.h
  HDRINST usr/include/linux/auto_dev-ioctl.h
  HDRINST usr/include/linux/sysinfo.h
  HDRINST usr/include/linux/nfs4_mount.h
  CC      /kernel/build64-default/tools/objtool/objtool.o
  HDRINST usr/include/linux/keyboard.h
  MKDIR   /kernel/build64-default/tools/objtool/arch/x86/lib/
  CC      /kernel/build64-default/tools/objtool/orc_gen.o
  CC      /kernel/build64-default/tools/objtool/arch/x86/special.o
  CC      /kernel/build64-default/tools/objtool/orc_dump.o
  HDRINST usr/include/linux/virtio_mmio.h
  HDRINST usr/include/linux/input.h
  CC      /kernel/build64-default/tools/objtool/libstring.o
  HDRINST usr/include/linux/qnxtypes.h
  GEN     /kernel/build64-default/tools/objtool/arch/x86/lib/inat-tables.c
  CC      /kernel/build64-default/tools/objtool/libctype.o
  HDRINST usr/include/linux/mdio.h
  CC      /kernel/build64-default/tools/objtool/str_error_r.o
  HDRINST usr/include/linux/lwtunnel.h
  CC      /kernel/build64-default/tools/objtool/librbtree.o
  HDRINST usr/include/linux/gfs2_ondisk.h
  HDRINST usr/include/linux/eventfd.h
  HDRINST usr/include/linux/nfs4.h
  HDRINST usr/include/linux/ptp_clock.h
  HDRINST usr/include/linux/nubus.h
  HDRINST usr/include/linux/if_bonding.h
  HDRINST usr/include/linux/kcov.h
  HDRINST usr/include/linux/fadvise.h
  HDRINST usr/include/linux/taskstats.h
  HDRINST usr/include/linux/veth.h
  HDRINST usr/include/linux/atm.h
  HDRINST usr/include/linux/ipmi.h
  HDRINST usr/include/linux/kdev_t.h
  HDRINST usr/include/linux/mount.h
  HDRINST usr/include/linux/shm.h
  HDRINST usr/include/linux/resource.h
  HDRINST usr/include/linux/prctl.h
  HDRINST usr/include/linux/watch_queue.h
  HDRINST usr/include/linux/sched.h
  HDRINST usr/include/linux/phonet.h
  HDRINST usr/include/linux/random.h
  HDRINST usr/include/linux/tty.h
  HDRINST usr/include/linux/apm_bios.h
  HDRINST usr/include/linux/fd.h
  HDRINST usr/include/linux/um_timetravel.h
  HDRINST usr/include/linux/tls.h
  HDRINST usr/include/linux/rpmsg_types.h
  HDRINST usr/include/linux/pfrut.h
  HDRINST usr/include/linux/mei.h
  HDRINST usr/include/linux/fsi.h
  HDRINST usr/include/linux/rds.h
  HDRINST usr/include/linux/if_x25.h
  HDRINST usr/include/linux/param.h
  HDRINST usr/include/linux/netdevice.h
  HDRINST usr/include/linux/binfmts.h
  HDRINST usr/include/linux/if_pppox.h
  HDRINST usr/include/linux/sockios.h
  HDRINST usr/include/linux/kcm.h
  HDRINST usr/include/linux/virtio_9p.h
  HDRINST usr/include/linux/genwqe/genwqe_card.h
  HDRINST usr/include/linux/if_tun.h
  HDRINST usr/include/linux/ext4.h
  HDRINST usr/include/linux/if_ether.h
  HDRINST usr/include/linux/kvm_para.h
  HDRINST usr/include/linux/kernel-page-flags.h
  HDRINST usr/include/linux/cdrom.h
  HDRINST usr/include/linux/un.h
  HDRINST usr/include/linux/module.h
  HDRINST usr/include/linux/mqueue.h
  HDRINST usr/include/linux/a.out.h
  HDRINST usr/include/linux/input-event-codes.h
  HDRINST usr/include/linux/coda.h
  HDRINST usr/include/linux/rio_mport_cdev.h
  HDRINST usr/include/linux/ipsec.h
  HDRINST usr/include/linux/blkpg.h
  HDRINST usr/include/linux/blkzoned.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_arpreply.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_redirect.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_nflog.h
  CC      /kernel/build64-default/tools/objtool/arch/x86/decode.o
  HDRINST usr/include/linux/netfilter_bridge/ebt_802_3.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_nat.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_mark_m.h
  HDRINST usr/include/linux/netfilter_bridge/ebtables.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_vlan.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_limit.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_log.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_stp.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_pkttype.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_ip.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_ip6.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_arp.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_mark_t.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_among.h
  HDRINST usr/include/linux/reiserfs_fs.h
  HDRINST usr/include/linux/cciss_ioctl.h
  HDRINST usr/include/linux/fsmap.h
  HDRINST usr/include/linux/smiapp.h
  HDRINST usr/include/linux/switchtec_ioctl.h
  HDRINST usr/include/linux/atmdev.h
  HDRINST usr/include/linux/hpet.h
  HDRINST usr/include/linux/virtio_config.h
  HDRINST usr/include/linux/string.h
  HDRINST usr/include/linux/kfd_sysfs.h
  HDRINST usr/include/linux/inet_diag.h
  HDRINST usr/include/linux/netdev.h
  HDRINST usr/include/linux/xattr.h
  HDRINST usr/include/linux/iommufd.h
  HDRINST usr/include/linux/user_events.h
  HDRINST usr/include/linux/errno.h
  HDRINST usr/include/linux/icmp.h
  HDRINST usr/include/linux/i2o-dev.h
  HDRINST usr/include/linux/pg.h
  HDRINST usr/include/linux/if_bridge.h
  HDRINST usr/include/linux/thermal.h
  HDRINST usr/include/linux/uinput.h
  HDRINST usr/include/linux/handshake.h
  HDRINST usr/include/linux/dqblk_xfs.h
  HDRINST usr/include/linux/v4l2-common.h
  HDRINST usr/include/linux/nvram.h
  HDRINST usr/include/linux/if_vlan.h
  HDRINST usr/include/linux/uhid.h
  HDRINST usr/include/linux/omap3isp.h
  HDRINST usr/include/linux/rose.h
  HDRINST usr/include/linux/phantom.h
  HDRINST usr/include/linux/dpll.h
  HDRINST usr/include/linux/ipmi_msgdefs.h
  HDRINST usr/include/linux/bcm933xx_hcs.h
  HDRINST usr/include/linux/bpf.h
  HDRINST usr/include/linux/mempolicy.h
  HDRINST usr/include/linux/efs_fs_sb.h
  HDRINST usr/include/linux/nexthop.h
  HDRINST usr/include/linux/net_dropmon.h
  HDRINST usr/include/linux/surface_aggregator/cdev.h
  HDRINST usr/include/linux/surface_aggregator/dtx.h
  HDRINST usr/include/linux/net.h
  HDRINST usr/include/linux/mii.h
  HDRINST usr/include/linux/virtio_pcidev.h
  HDRINST usr/include/linux/cgroupstats.h
  HDRINST usr/include/linux/termios.h
  HDRINST usr/include/linux/mpls.h
  HDRINST usr/include/linux/iommu.h
  HDRINST usr/include/linux/toshiba.h
  HDRINST usr/include/linux/virtio_scsi.h
  HDRINST usr/include/linux/zorro.h
  HDRINST usr/include/linux/chio.h
  HDRINST usr/include/linux/pkt_sched.h
  HDRINST usr/include/linux/cramfs_fs.h
  HDRINST usr/include/linux/nfs3.h
  HDRINST usr/include/linux/vfio_ccw.h
  HDRINST usr/include/linux/atm_nicstar.h
  HDRINST usr/include/linux/ncsi.h
  HDRINST usr/include/linux/virtio_net.h
  HDRINST usr/include/linux/ioctl.h
  HDRINST usr/include/linux/stddef.h
  HDRINST usr/include/linux/limits.h
  HDRINST usr/include/linux/ipmi_bmc.h
  HDRINST usr/include/linux/netfilter_arp.h
  HDRINST usr/include/linux/if_addr.h
  HDRINST usr/include/linux/rpmsg.h
  HDRINST usr/include/linux/kernelcapi.h
  HDRINST usr/include/linux/media-bus-format.h
  HDRINST usr/include/linux/ppp_defs.h
  HDRINST usr/include/linux/ethtool.h
  HDRINST usr/include/linux/aspeed-video.h
  HDRINST usr/include/linux/hdlc.h
  HDRINST usr/include/linux/fscrypt.h
  HDRINST usr/include/linux/batadv_packet.h
  HDRINST usr/include/linux/uuid.h
  HDRINST usr/include/linux/capi.h
  HDRINST usr/include/linux/mptcp.h
  HDRINST usr/include/linux/hidraw.h
  HDRINST usr/include/linux/virtio_console.h
  HDRINST usr/include/linux/irqnr.h
  HDRINST usr/include/linux/coresight-stm.h
  HDRINST usr/include/linux/cxl_mem.h
  HDRINST usr/include/linux/iso_fs.h
  HDRINST usr/include/linux/virtio_blk.h
  HDRINST usr/include/linux/udf_fs_i.h
  HDRINST usr/include/linux/coff.h
  HDRINST usr/include/linux/dma-buf.h
  HDRINST usr/include/linux/ife.h
  HDRINST usr/include/linux/agpgart.h
  HDRINST usr/include/linux/socket.h
  HDRINST usr/include/linux/nilfs2_ondisk.h
  HDRINST usr/include/linux/connector.h
  HDRINST usr/include/linux/auto_fs4.h
  HDRINST usr/include/linux/bt-bmc.h
  HDRINST usr/include/linux/map_to_7segment.h
  HDRINST usr/include/linux/tc_act/tc_skbedit.h
  HDRINST usr/include/linux/tc_act/tc_ctinfo.h
  HDRINST usr/include/linux/tc_act/tc_defact.h
  HDRINST usr/include/linux/tc_act/tc_gact.h
  HDRINST usr/include/linux/tc_act/tc_vlan.h
  HDRINST usr/include/linux/tc_act/tc_skbmod.h
  HDRINST usr/include/linux/tc_act/tc_sample.h
  HDRINST usr/include/linux/tc_act/tc_tunnel_key.h
  HDRINST usr/include/linux/tc_act/tc_gate.h
  HDRINST usr/include/linux/tc_act/tc_mirred.h
  HDRINST usr/include/linux/tc_act/tc_nat.h
  HDRINST usr/include/linux/tc_act/tc_csum.h
  HDRINST usr/include/linux/tc_act/tc_connmark.h
  HDRINST usr/include/linux/tc_act/tc_ife.h
  HDRINST usr/include/linux/tc_act/tc_mpls.h
  HDRINST usr/include/linux/tc_act/tc_ct.h
  HDRINST usr/include/linux/tc_act/tc_pedit.h
  HDRINST usr/include/linux/tc_act/tc_bpf.h
  HDRINST usr/include/linux/tc_act/tc_ipt.h
  HDRINST usr/include/linux/netrom.h
  HDRINST usr/include/linux/joystick.h
  HDRINST usr/include/linux/falloc.h
  HDRINST usr/include/linux/cycx_cfm.h
  HDRINST usr/include/linux/omapfb.h
  HDRINST usr/include/linux/msdos_fs.h
  HDRINST usr/include/linux/virtio_types.h
  HDRINST usr/include/linux/mroute.h
  HDRINST usr/include/linux/psample.h
  HDRINST usr/include/linux/ipv6.h
  HDRINST usr/include/linux/nfsd_netlink.h
  HDRINST usr/include/linux/dw100.h
  HDRINST usr/include/linux/psp-sev.h
  HDRINST usr/include/linux/vfio.h
  HDRINST usr/include/linux/if_ppp.h
  HDRINST usr/include/linux/byteorder/big_endian.h
  HDRINST usr/include/linux/byteorder/little_endian.h
  HDRINST usr/include/linux/comedi.h
  HDRINST usr/include/linux/scif_ioctl.h
  HDRINST usr/include/linux/timerfd.h
  HDRINST usr/include/linux/time_types.h
  HDRINST usr/include/linux/firewire-constants.h
  HDRINST usr/include/linux/virtio_snd.h
  HDRINST usr/include/linux/ppp-ioctl.h
  HDRINST usr/include/linux/fib_rules.h
  HDRINST usr/include/linux/gen_stats.h
  HDRINST usr/include/linux/virtio_iommu.h
  HDRINST usr/include/linux/genetlink.h
  HDRINST usr/include/linux/uvcvideo.h
  HDRINST usr/include/linux/pfkeyv2.h
  HDRINST usr/include/linux/soundcard.h
  HDRINST usr/include/linux/times.h
  HDRINST usr/include/linux/nfc.h
  HDRINST usr/include/linux/affs_hardblocks.h
  HDRINST usr/include/linux/nilfs2_api.h
  HDRINST usr/include/linux/rseq.h
  HDRINST usr/include/linux/caif/caif_socket.h
  HDRINST usr/include/linux/caif/if_caif.h
  HDRINST usr/include/linux/i2c-dev.h
  HDRINST usr/include/linux/cuda.h
  HDRINST usr/include/linux/mei_uuid.h
  HDRINST usr/include/linux/cn_proc.h
  HDRINST usr/include/linux/parport.h
  HDRINST usr/include/linux/v4l2-controls.h
  HDRINST usr/include/linux/hsi/cs-protocol.h
  HDRINST usr/include/linux/hsi/hsi_char.h
  HDRINST usr/include/linux/seg6_genl.h
  HDRINST usr/include/linux/am437x-vpfe.h
  HDRINST usr/include/linux/amt.h
  HDRINST usr/include/linux/netconf.h
  HDRINST usr/include/linux/erspan.h
  HDRINST usr/include/linux/nsfs.h
  HDRINST usr/include/linux/xilinx-v4l2-controls.h
  HDRINST usr/include/linux/aspeed-p2a-ctrl.h
  HDRINST usr/include/linux/vfio_zdev.h
  HDRINST usr/include/linux/serio.h
  HDRINST usr/include/linux/acrn.h
  HDRINST usr/include/linux/nfs2.h
  HDRINST usr/include/linux/mptcp_pm.h
  HDRINST usr/include/linux/virtio_pci.h
  HDRINST usr/include/linux/ipc.h
  HDRINST usr/include/linux/ethtool_netlink.h
  HDRINST usr/include/linux/kd.h
  HDRINST usr/include/linux/elf.h
  HDRINST usr/include/linux/videodev2.h
  HDRINST usr/include/linux/if_alg.h
  HDRINST usr/include/linux/sonypi.h
  HDRINST usr/include/linux/fsverity.h
  HDRINST usr/include/linux/if.h
  HDRINST usr/include/linux/btrfs.h
  HDRINST usr/include/linux/vm_sockets_diag.h
  HDRINST usr/include/linux/netfilter_bridge.h
  HDRINST usr/include/linux/packet_diag.h
  HDRINST usr/include/linux/netfilter_ipv4.h
  HDRINST usr/include/linux/kvm.h
  HDRINST usr/include/linux/pci.h
  HDRINST usr/include/linux/if_addrlabel.h
  HDRINST usr/include/linux/hdlcdrv.h
  HDRINST usr/include/linux/cfm_bridge.h
  HDRINST usr/include/linux/fiemap.h
  HDRINST usr/include/linux/dm-ioctl.h
  HDRINST usr/include/linux/aspeed-lpc-ctrl.h
  HDRINST usr/include/linux/atmioc.h
  HDRINST usr/include/linux/dlm.h
  HDRINST usr/include/linux/pci_regs.h
  HDRINST usr/include/linux/cachefiles.h
  HDRINST usr/include/linux/membarrier.h
  HDRINST usr/include/linux/nfs_idmap.h
  HDRINST usr/include/linux/ip.h
  HDRINST usr/include/linux/atm_he.h
  HDRINST usr/include/linux/nfsd/export.h
  HDRINST usr/include/linux/nfsd/stats.h
  HDRINST usr/include/linux/nfsd/debug.h
  HDRINST usr/include/linux/nfsd/cld.h
  HDRINST usr/include/linux/ip_vs.h
  HDRINST usr/include/linux/vmcore.h
  HDRINST usr/include/linux/vbox_vmmdev_types.h
  HDRINST usr/include/linux/dvb/osd.h
  HDRINST usr/include/linux/dvb/dmx.h
  HDRINST usr/include/linux/dvb/net.h
  HDRINST usr/include/linux/dvb/frontend.h
  HDRINST usr/include/linux/dvb/ca.h
  HDRINST usr/include/linux/dvb/version.h
  HDRINST usr/include/linux/dvb/video.h
  HDRINST usr/include/linux/dvb/audio.h
  HDRINST usr/include/linux/nfs.h
  HDRINST usr/include/linux/if_link.h
  HDRINST usr/include/linux/wait.h
  HDRINST usr/include/linux/icmpv6.h
  HDRINST usr/include/linux/media.h
  HDRINST usr/include/linux/seg6_local.h
  HDRINST usr/include/linux/tps6594_pfsm.h
  HDRINST usr/include/linux/openvswitch.h
  HDRINST usr/include/linux/atmsap.h
  HDRINST usr/include/linux/bpfilter.h
  HDRINST usr/include/linux/fpga-dfl.h
  HDRINST usr/include/linux/userio.h
  HDRINST usr/include/linux/signal.h
  HDRINST usr/include/linux/map_to_14segment.h
  HDRINST usr/include/linux/hdreg.h
  HDRINST usr/include/linux/usbdevice_fs.h
  HDRINST usr/include/linux/utime.h
  HDRINST usr/include/linux/timex.h
  HDRINST usr/include/linux/if_fc.h
  HDRINST usr/include/linux/reiserfs_xattr.h
  HDRINST usr/include/linux/hw_breakpoint.h
  HDRINST usr/include/linux/quota.h
  HDRINST usr/include/linux/ioprio.h
  HDRINST usr/include/linux/eventpoll.h
  HDRINST usr/include/linux/atmclip.h
  HDRINST usr/include/linux/can.h
  HDRINST usr/include/linux/if_team.h
  HDRINST usr/include/linux/usbip.h
  HDRINST usr/include/linux/stat.h
  HDRINST usr/include/linux/fou.h
  HDRINST usr/include/linux/hash_info.h
  HDRINST usr/include/linux/ppp-comp.h
  HDRINST usr/include/linux/ip6_tunnel.h
  HDRINST usr/include/linux/tipc_netlink.h
  HDRINST usr/include/linux/in.h
  HDRINST usr/include/linux/wireguard.h
  HDRINST usr/include/linux/btf.h
  HDRINST usr/include/linux/batman_adv.h
  HDRINST usr/include/linux/fcntl.h
  HDRINST usr/include/linux/if_ltalk.h
  HDRINST usr/include/linux/i2c.h
  HDRINST usr/include/linux/atm_idt77105.h
  HDRINST usr/include/linux/kexec.h
  HDRINST usr/include/linux/arm_sdei.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6_tables.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_ah.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_NPT.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_rt.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_REJECT.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_opts.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_srh.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_LOG.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_mh.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_HL.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_hl.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_frag.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_ipv6header.h
  HDRINST usr/include/linux/minix_fs.h
  HDRINST usr/include/linux/aio_abi.h
  HDRINST usr/include/linux/pktcdvd.h
  HDRINST usr/include/linux/libc-compat.h
  HDRINST usr/include/linux/atmlec.h
  HDRINST usr/include/linux/signalfd.h
  HDRINST usr/include/linux/bpf_common.h
  HDRINST usr/include/linux/seg6_iptunnel.h
  HDRINST usr/include/linux/synclink.h
  HDRINST usr/include/linux/mpls_iptunnel.h
  HDRINST usr/include/linux/mctp.h
  HDRINST usr/include/linux/if_xdp.h
  HDRINST usr/include/linux/llc.h
  HDRINST usr/include/linux/atmsvc.h
  HDRINST usr/include/linux/sed-opal.h
  HDRINST usr/include/linux/sock_diag.h
  HDRINST usr/include/linux/time.h
  HDRINST usr/include/linux/securebits.h
  HDRINST usr/include/linux/fsl_hypervisor.h
  HDRINST usr/include/linux/if_hippi.h
  HDRINST usr/include/linux/seccomp.h
  HDRINST usr/include/linux/oom.h
  HDRINST usr/include/linux/filter.h
  HDRINST usr/include/linux/inotify.h
  HDRINST usr/include/linux/rfkill.h
  HDRINST usr/include/linux/reboot.h
  HDRINST usr/include/linux/can/vxcan.h
  HDRINST usr/include/linux/can/j1939.h
  HDRINST usr/include/linux/can/netlink.h
  HDRINST usr/include/linux/can/bcm.h
  HDRINST usr/include/linux/can/raw.h
  HDRINST usr/include/linux/can/gw.h
  HDRINST usr/include/linux/can/error.h
  HDRINST usr/include/linux/can/isotp.h
  HDRINST usr/include/linux/if_eql.h
  HDRINST usr/include/linux/psp-dbc.h
  HDRINST usr/include/linux/hiddev.h
  HDRINST usr/include/linux/blktrace_api.h
  HDRINST usr/include/linux/ccs.h
  HDRINST usr/include/linux/ioam6.h
  HDRINST usr/include/linux/hsr_netlink.h
  HDRINST usr/include/linux/mmc/ioctl.h
  HDRINST usr/include/linux/bfs_fs.h
  HDRINST usr/include/linux/npcm-video.h
  HDRINST usr/include/linux/rio_cm_cdev.h
  HDRINST usr/include/linux/uleds.h
  HDRINST usr/include/linux/mrp_bridge.h
  HDRINST usr/include/linux/adb.h
  HDRINST usr/include/linux/pmu.h
  HDRINST usr/include/linux/udmabuf.h
  HDRINST usr/include/linux/kcmp.h
  HDRINST usr/include/linux/dma-heap.h
  HDRINST usr/include/linux/userfaultfd.h
  HDRINST usr/include/linux/netfilter_arp/arpt_mangle.h
  HDRINST usr/include/linux/netfilter_arp/arp_tables.h
  HDRINST usr/include/linux/tipc.h
  HDRINST usr/include/linux/virtio_ids.h
  HDRINST usr/include/linux/l2tp.h
  HDRINST usr/include/linux/devlink.h
  HDRINST usr/include/linux/virtio_gpio.h
  HDRINST usr/include/linux/dcbnl.h
  HDRINST usr/include/linux/cyclades.h
  HDRINST usr/include/sound/intel/avs/tokens.h
  HDRINST usr/include/sound/sof/fw.h
  HDRINST usr/include/sound/sof/abi.h
  HDRINST usr/include/sound/sof/tokens.h
  HDRINST usr/include/sound/sof/header.h
  HDRINST usr/include/sound/usb_stream.h
  HDRINST usr/include/sound/sfnt_info.h
  HDRINST usr/include/sound/asequencer.h
  HDRINST usr/include/sound/tlv.h
  HDRINST usr/include/sound/asound.h
  HDRINST usr/include/sound/asoc.h
  HDRINST usr/include/sound/sb16_csp.h
  HDRINST usr/include/sound/compress_offload.h
  HDRINST usr/include/sound/hdsp.h
  HDRINST usr/include/sound/emu10k1.h
  HDRINST usr/include/sound/snd_ar_tokens.h
  HDRINST usr/include/sound/snd_sst_tokens.h
  HDRINST usr/include/sound/asound_fm.h
  HDRINST usr/include/sound/hdspm.h
  HDRINST usr/include/sound/compress_params.h
  HDRINST usr/include/sound/firewire.h
  HDRINST usr/include/sound/skl-tplg-interface.h
  HDRINST usr/include/scsi/scsi_bsg_ufs.h
  HDRINST usr/include/scsi/scsi_netlink_fc.h
  HDRINST usr/include/scsi/scsi_bsg_mpi3mr.h
  HDRINST usr/include/scsi/fc/fc_ns.h
  HDRINST usr/include/scsi/fc/fc_fs.h
  HDRINST usr/include/scsi/fc/fc_els.h
  HDRINST usr/include/scsi/fc/fc_gs.h
  HDRINST usr/include/scsi/scsi_bsg_fc.h
  HDRINST usr/include/scsi/cxlflash_ioctl.h
  HDRINST usr/include/scsi/scsi_netlink.h
  HDRINST usr/include/linux/version.h
  HDRINST usr/include/asm/processor-flags.h
  HDRINST usr/include/asm/auxvec.h
  HDRINST usr/include/asm/svm.h
  HDRINST usr/include/asm/bitsperlong.h
  HDRINST usr/include/asm/kvm_perf.h
  HDRINST usr/include/asm/mce.h
  HDRINST usr/include/asm/posix_types.h
  HDRINST usr/include/asm/msr.h
  HDRINST usr/include/asm/sigcontext32.h
  HDRINST usr/include/asm/mman.h
  HDRINST usr/include/asm/shmbuf.h
  HDRINST usr/include/asm/e820.h
  HDRINST usr/include/asm/posix_types_64.h
  HDRINST usr/include/asm/vsyscall.h
  HDRINST usr/include/asm/msgbuf.h
  HDRINST usr/include/asm/swab.h
  HDRINST usr/include/asm/statfs.h
  HDRINST usr/include/asm/posix_types_x32.h
  HDRINST usr/include/asm/ptrace.h
  HDRINST usr/include/asm/unistd.h
  HDRINST usr/include/asm/ist.h
  HDRINST usr/include/asm/prctl.h
  HDRINST usr/include/asm/boot.h
  HDRINST usr/include/asm/sigcontext.h
  HDRINST usr/include/asm/posix_types_32.h
  HDRINST usr/include/asm/kvm_para.h
  HDRINST usr/include/asm/mtrr.h
  HDRINST usr/include/asm/a.out.h
  HDRINST usr/include/asm/amd_hsmp.h
  HDRINST usr/include/asm/hwcap2.h
  HDRINST usr/include/asm/ptrace-abi.h
  HDRINST usr/include/asm/vm86.h
  HDRINST usr/include/asm/vmx.h
  HDRINST usr/include/asm/ldt.h
  HDRINST usr/include/asm/perf_regs.h
  HDRINST usr/include/asm/kvm.h
  HDRINST usr/include/asm/debugreg.h
  HDRINST usr/include/asm/signal.h
  HDRINST usr/include/asm/bootparam.h
  HDRINST usr/include/asm/siginfo.h
  HDRINST usr/include/asm/hw_breakpoint.h
  HDRINST usr/include/asm/stat.h
  HDRINST usr/include/asm/setup.h
  HDRINST usr/include/asm/sembuf.h
  HDRINST usr/include/asm/sgx.h
  HDRINST usr/include/asm/ucontext.h
  HDRINST usr/include/asm/byteorder.h
  HDRINST usr/include/asm/unistd_64.h
  HDRINST usr/include/asm/ioctls.h
  HDRINST usr/include/asm/bpf_perf_event.h
  HDRINST usr/include/asm/types.h
  HDRINST usr/include/asm/poll.h
  HDRINST usr/include/asm/resource.h
  HDRINST usr/include/asm/param.h
  HDRINST usr/include/asm/sockios.h
  HDRINST usr/include/asm/errno.h
  HDRINST usr/include/asm/unistd_x32.h
  HDRINST usr/include/asm/termios.h
  HDRINST usr/include/asm/ioctl.h
  HDRINST usr/include/asm/socket.h
  HDRINST usr/include/asm/unistd_32.h
  HDRINST usr/include/asm/termbits.h
  HDRINST usr/include/asm/fcntl.h
  HDRINST usr/include/asm/ipcbuf.h
  HOSTLD  scripts/mod/modpost
  CC      kernel/bounds.s
  CHKSHA1 ../include/linux/atomic/atomic-arch-fallback.h
  CHKSHA1 ../include/linux/atomic/atomic-instrumented.h
  CHKSHA1 ../include/linux/atomic/atomic-long.h
  UPD     include/generated/timeconst.h
  LD      /kernel/build64-default/tools/objtool/arch/x86/objtool-in.o
  UPD     include/generated/bounds.h
  CC      arch/x86/kernel/asm-offsets.s
  UPD     include/generated/asm-offsets.h
  CALL    ../scripts/checksyscalls.sh
  LD      /kernel/build64-default/tools/objtool/objtool-in.o
  LINK    /kernel/build64-default/tools/objtool/objtool
  LDS     scripts/module.lds
  CC      mm/filemap.o
  CC      mm/mempool.o
  AR      certs/built-in.a
  HOSTCC  usr/gen_init_cpio
  CC      mm/oom_kill.o
  CC      init/main.o
  CC      security/commoncap.o
  CC      io_uring/io_uring.o
  AS      arch/x86/lib/clear_page_64.o
  CC      security/min_addr.o
  CC      mm/fadvise.o
  CC      ipc/compat.o
  CC      io_uring/xattr.o
  UPD     init/utsversion-tmp.h
  CC      security/inode.o
  CC      arch/x86/pci/i386.o
  CC      security/device_cgroup.o
  CC      init/do_mounts.o
  CC      mm/maccess.o
  CC      arch/x86/lib/cmdline.o
  AR      arch/x86/video/built-in.a
  CC      block/bdev.o
  CC      arch/x86/pci/init.o
  CC      ipc/util.o
  CC      io_uring/nop.o
  AR      virt/lib/built-in.a
  CC      arch/x86/power/cpu.o
  CC      arch/x86/realmode/init.o
  AR      drivers/cache/built-in.a
  CC      ipc/msgutil.o
  CC [M]  arch/x86/video/fbdev.o
  AR      drivers/irqchip/built-in.a
  CC      block/partitions/core.o
  AR      arch/x86/virt/vmx/built-in.a
  CC      security/keys/gc.o
  AS      arch/x86/crypto/aesni-intel_asm.o
  CC      net/llc/llc_core.o
  CC [M]  virt/lib/irqbypass.o
  CC      net/802/p8022.o
  CC      net/core/sock.o
  CC      net/ethernet/eth.o
  AR      sound/i2c/other/built-in.a
  CC      arch/x86/events/amd/core.o
  CC      fs/notify/dnotify/dnotify.o
  AR      arch/x86/virt/built-in.a
  CC      sound/core/seq/seq.o
  CC      arch/x86/kernel/fpu/init.o
  AR      sound/i2c/built-in.a
  CC      arch/x86/mm/pat/set_memory.o
  CC      arch/x86/kernel/cpu/mce/core.o
  AR      drivers/bus/mhi/built-in.a
  CC      arch/x86/kernel/acpi/boot.o
  CC      kernel/locking/mutex.o
  CC      lib/kunit/hooks.o
  AR      drivers/bus/built-in.a
  CC      arch/x86/entry/vdso/vma.o
  CC      net/802/psnap.o
  CC      kernel/sched/core.o
  CC      arch/x86/crypto/aesni-intel_glue.o
  CC      mm/kasan/common.o
  AR      drivers/phy/allwinner/built-in.a
  CC      crypto/api.o
  AR      drivers/phy/amlogic/built-in.a
  AS      arch/x86/lib/cmpxchg16b_emu.o
  AR      drivers/phy/broadcom/built-in.a
  AR      drivers/phy/cadence/built-in.a
  CC      arch/x86/lib/copy_mc.o
  AR      drivers/phy/freescale/built-in.a
  AR      drivers/phy/hisilicon/built-in.a
  AR      drivers/phy/ingenic/built-in.a
  AR      drivers/phy/intel/built-in.a
  AR      drivers/phy/lantiq/built-in.a
  GEN     usr/initramfs_data.cpio
  AR      drivers/phy/marvell/built-in.a
  CC [M]  lib/kunit/test.o
  AR      drivers/phy/mediatek/built-in.a
  COPY    usr/initramfs_inc_data
  AS      usr/initramfs_data.o
  AR      drivers/phy/microchip/built-in.a
  AR      drivers/phy/motorola/built-in.a
  AR      usr/built-in.a
  AR      drivers/phy/mscc/built-in.a
  AR      drivers/phy/qualcomm/built-in.a
  AR      sound/drivers/opl3/built-in.a
  AR      drivers/phy/ralink/built-in.a
  AR      sound/drivers/opl4/built-in.a
  CC      arch/x86/kernel/fpu/bugs.o
  AR      drivers/phy/renesas/built-in.a
  AR      sound/drivers/mpu401/built-in.a
  AR      drivers/phy/rockchip/built-in.a
  AR      sound/drivers/vx/built-in.a
  AR      drivers/phy/samsung/built-in.a
  AR      drivers/phy/socionext/built-in.a
  AR      sound/drivers/pcsp/built-in.a
  AR      drivers/phy/st/built-in.a
  AR      sound/drivers/built-in.a
  AR      drivers/phy/starfive/built-in.a
  AS      arch/x86/lib/copy_mc_64.o
  AR      drivers/phy/sunplus/built-in.a
  AR      drivers/phy/tegra/built-in.a
  AS      arch/x86/lib/copy_page_64.o
  AR      drivers/phy/ti/built-in.a
  AR      sound/isa/ad1816a/built-in.a
  AR      drivers/phy/xilinx/built-in.a
  CC      drivers/phy/phy-core.o
  AS      arch/x86/lib/copy_user_64.o
  AR      sound/isa/ad1848/built-in.a
  AR      arch/x86/ia32/built-in.a
  CC      sound/core/seq/seq_lock.o
  CC      sound/core/seq/seq_clientmgr.o
  AR      sound/isa/cs423x/built-in.a
  AS      arch/x86/lib/copy_user_uncached_64.o
  CC      arch/x86/kernel/fpu/core.o
  AR      sound/isa/es1688/built-in.a
  AS      arch/x86/realmode/rm/header.o
  CC      arch/x86/lib/cpu.o
  AR      sound/isa/galaxy/built-in.a
  AR      virt/built-in.a
  AR      sound/isa/gus/built-in.a
  AR      sound/isa/msnd/built-in.a
  CC      arch/x86/kernel/fpu/regset.o
  AS      arch/x86/realmode/rm/trampoline_64.o
  CC      arch/x86/kernel/fpu/signal.o
  AR      arch/x86/platform/atom/built-in.a
  AR      sound/isa/opti9xx/built-in.a
  AR      sound/isa/sb/built-in.a
  CC      arch/x86/kernel/fpu/xstate.o
  AR      arch/x86/platform/ce4100/built-in.a
  AS      arch/x86/realmode/rm/stack.o
  AR      sound/isa/wavefront/built-in.a
  CC      arch/x86/platform/efi/memmap.o
  CC      arch/x86/platform/efi/quirks.o
  CC      security/keys/key.o
  AR      sound/isa/wss/built-in.a
  AR      fs/notify/dnotify/built-in.a
  AR      sound/isa/built-in.a
  AS      arch/x86/realmode/rm/reboot.o
  CC      arch/x86/pci/mmconfig_64.o
  CC      fs/notify/inotify/inotify_fsnotify.o
  AS      arch/x86/realmode/rm/wakeup_asm.o
  CC      arch/x86/platform/efi/efi.o
  CC      mm/page-writeback.o
  CC      mm/kasan/report.o
  CC      arch/x86/realmode/rm/wakemain.o
  CC      arch/x86/pci/direct.o
  CC      fs/notify/inotify/inotify_user.o
  CC      mm/kasan/init.o
  CC      net/llc/llc_input.o
  CC      arch/x86/pci/mmconfig-shared.o
  CC      arch/x86/realmode/rm/video-mode.o
  CC      net/llc/llc_output.o
  CC      arch/x86/entry/vdso/extable.o
  CC      net/802/stp.o
  CC      arch/x86/power/hibernate_64.o
  CC      arch/x86/platform/efi/efi_64.o
  CC      crypto/cipher.o
  AS      arch/x86/realmode/rm/copy.o
  CC      block/partitions/ldm.o
  AS      arch/x86/realmode/rm/bioscall.o
  CC      arch/x86/realmode/rm/regs.o
  AS      arch/x86/crypto/aesni-intel_avx-x86_64.o
  CC      arch/x86/realmode/rm/video-vga.o
  CC      sound/core/seq/seq_memory.o
  CC      arch/x86/events/amd/lbr.o
  CC [M]  lib/kunit/resource.o
  CC      arch/x86/lib/delay.o
  CC      block/fops.o
  CC      arch/x86/realmode/rm/video-vesa.o
  CC      arch/x86/kernel/acpi/sleep.o
  CC      ipc/msg.o
  CC      arch/x86/kernel/cpu/mtrr/mtrr.o
  CC      kernel/locking/semaphore.o
  CC      kernel/power/qos.o
  CC      arch/x86/realmode/rm/video-bios.o
  CC      kernel/printk/printk.o
  AR      net/ethernet/built-in.a
  CC      init/do_mounts_initrd.o
  AS      arch/x86/crypto/aes_ctrby8_avx-x86_64.o
  PASYMS  arch/x86/realmode/rm/pasyms.h
  LDS     arch/x86/realmode/rm/realmode.lds
  CC      arch/x86/kernel/cpu/mtrr/if.o
  LD      arch/x86/realmode/rm/realmode.elf
  RELOCS  arch/x86/realmode/rm/realmode.relocs
  OBJCOPY arch/x86/realmode/rm/realmode.bin
  AS      arch/x86/realmode/rmpiggy.o
  AR      arch/x86/realmode/built-in.a
  AS [M]  arch/x86/crypto/ghash-clmulni-intel_asm.o
  CC      sound/core/sound.o
  AR      arch/x86/net/built-in.a
  CC [M]  arch/x86/crypto/ghash-clmulni-intel_glue.o
  AS      arch/x86/platform/efi/efi_stub_64.o
  AS      arch/x86/lib/getuser.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/kvm_main.o
  GEN     arch/x86/lib/inat-tables.c
  CC      arch/x86/pci/fixup.o
  CC      init/initramfs.o
  CC      arch/x86/pci/acpi.o
  CC      arch/x86/lib/insn-eval.o
  AS [M]  arch/x86/crypto/crc32-pclmul_asm.o
  CC      arch/x86/entry/vdso/vdso32-setup.o
  LDS     arch/x86/entry/vdso/vdso.lds
  CC      arch/x86/events/amd/ibs.o
  CC      crypto/compress.o
  CC      crypto/algapi.o
  AR      drivers/phy/built-in.a
  CC      arch/x86/kernel/cpu/mtrr/generic.o
  CC      security/keys/keyring.o
  AR      drivers/pinctrl/actions/built-in.a
  CC [M]  arch/x86/kvm/../../../virt/kvm/eventfd.o
  AR      drivers/pinctrl/bcm/built-in.a
  AR      net/llc/built-in.a
  AR      drivers/pinctrl/cirrus/built-in.a
  AS      arch/x86/power/hibernate_asm_64.o
  CC      security/keys/keyctl.o
  AR      drivers/pinctrl/freescale/built-in.a
  CC      arch/x86/mm/pat/memtype.o
  AR      net/802/built-in.a
  CC      arch/x86/power/hibernate.o
  CC      drivers/pinctrl/intel/pinctrl-baytrail.o
  CC      crypto/scatterwalk.o
  CC      mm/kasan/generic.o
  CC [M]  lib/kunit/static_stub.o
  CC      arch/x86/kernel/cpu/mce/severity.o
  CC      drivers/gpio/gpiolib.o
  CC      drivers/pinctrl/intel/pinctrl-intel.o
  AR      fs/notify/inotify/built-in.a
  CC      kernel/locking/rwsem.o
  CC      fs/notify/fanotify/fanotify.o
  AS      arch/x86/kernel/acpi/wakeup_64.o
  AR      arch/x86/platform/efi/built-in.a
  CC [M]  drivers/pinctrl/intel/pinctrl-cherryview.o
  AR      arch/x86/platform/geode/built-in.a
  CC      arch/x86/kernel/acpi/apei.o
  AR      arch/x86/platform/iris/built-in.a
  AR      arch/x86/kernel/fpu/built-in.a
  CC      arch/x86/pci/legacy.o
  CC      arch/x86/platform/intel/iosf_mbi.o
  CC      arch/x86/pci/irq.o
  CC      kernel/locking/percpu-rwsem.o
  CC      arch/x86/pci/common.o
  CC      arch/x86/lib/insn.o
  CC      sound/core/seq/seq_queue.o
  CC      arch/x86/kernel/cpu/microcode/core.o
  CC      arch/x86/kernel/cpu/cacheinfo.o
  CC      lib/math/div64.o
  AS      arch/x86/entry/vdso/vdso-note.o
  CC      lib/crypto/memneq.o
  CC [M]  arch/x86/crypto/crc32-pclmul_glue.o
  CC      arch/x86/entry/vdso/vclock_gettime.o
  CC      lib/math/gcd.o
  CC      block/partitions/msdos.o
  CC      lib/zlib_inflate/inffast.o
  CC      lib/math/lcm.o
  CC      kernel/power/main.o
  CC      lib/math/int_log.o
  CC      lib/zlib_inflate/inflate.o
  CC      arch/x86/entry/vdso/vgetcpu.o
  CC      lib/math/int_pow.o
  CC [M]  lib/kunit/string-stream.o
  CC      arch/x86/events/intel/core.o
  CC [M]  lib/kunit/assert.o
  CC      fs/notify/fanotify/fanotify_user.o
  CC      arch/x86/events/intel/bts.o
  CC      lib/math/int_sqrt.o
  CC      ipc/sem.o
  CC      init/calibrate.o
  CC      mm/folio-compat.o
  AS      arch/x86/lib/memcpy_64.o
  CC      lib/math/reciprocal_div.o
  AR      arch/x86/power/built-in.a
  CC      mm/readahead.o
  AS      arch/x86/lib/memmove_64.o
  AS      arch/x86/lib/memset_64.o
  CC      arch/x86/kernel/acpi/cppc.o
  CC      arch/x86/kernel/cpu/mce/genpool.o
  CC      arch/x86/lib/misc.o
  CC      lib/math/rational.o
  CC      kernel/locking/irqflag-debug.o
  CC      arch/x86/lib/pc-conf-reg.o
  CC      arch/x86/kernel/cpu/mtrr/cleanup.o
  CC      lib/crypto/utils.o
  HOSTCC  arch/x86/entry/vdso/vdso2c
  CC      lib/crypto/chacha.o
  AS [M]  arch/x86/crypto/crct10dif-pcl-asm_64.o
  CC      arch/x86/mm/init.o
  AR      arch/x86/platform/intel/built-in.a
  CC [M]  arch/x86/crypto/crct10dif-pclmul_glue.o
  CC      arch/x86/mm/pat/memtype_interval.o
  AR      arch/x86/platform/intel-mid/built-in.a
  CC      mm/kasan/report_generic.o
  CC      arch/x86/events/amd/uncore.o
  AR      arch/x86/platform/intel-quark/built-in.a
  LD [M]  arch/x86/crypto/ghash-clmulni-intel.o
  AR      arch/x86/platform/olpc/built-in.a
  CC      arch/x86/mm/init_64.o
  AR      arch/x86/platform/scx200/built-in.a
  CC      arch/x86/kernel/cpu/microcode/intel.o
  CC      init/init_task.o
  AS      arch/x86/lib/putuser.o
  CC      sound/core/seq/seq_fifo.o
  AR      arch/x86/platform/ts5500/built-in.a
  CC      sound/core/seq/seq_prioq.o
  AR      arch/x86/platform/uv/built-in.a
  AS      arch/x86/lib/retpoline.o
  CC      crypto/proc.o
  AR      arch/x86/platform/built-in.a
  CC      arch/x86/mm/fault.o
  CC      arch/x86/entry/vsyscall/vsyscall_64.o
  CC      arch/x86/lib/usercopy.o
  CC      arch/x86/mm/ioremap.o
  CC      security/keys/permission.o
  CC      arch/x86/mm/extable.o
  CC      lib/crypto/aes.o
  CC      arch/x86/events/intel/ds.o
  LDS     arch/x86/entry/vdso/vdso32/vdso32.lds
  CC      lib/zlib_inflate/infutil.o
  CC      arch/x86/lib/usercopy_64.o
  CC [M]  lib/kunit/try-catch.o
  AS      arch/x86/entry/vdso/vdso32/note.o
  AS      arch/x86/entry/vdso/vdso32/system_call.o
  CC      block/partitions/efi.o
  AS      arch/x86/entry/vdso/vdso32/sigreturn.o
  CC      arch/x86/lib/msr-smp.o
  CC [M]  lib/math/prime_numbers.o
  CC      arch/x86/entry/vdso/vdso32/vclock_gettime.o
  CC [M]  drivers/pinctrl/intel/pinctrl-broxton.o
  CC      arch/x86/pci/early.o
  CC      arch/x86/pci/bus_numa.o
  CC      arch/x86/kernel/cpu/mce/intel.o
  CC      arch/x86/events/zhaoxin/core.o
  CC      arch/x86/kernel/acpi/cstate.o
  CC      arch/x86/events/intel/knc.o
  CC      kernel/power/console.o
  CC      arch/x86/pci/amd_bus.o
  CC      lib/zlib_deflate/deflate.o
  CC      kernel/locking/mutex-debug.o
  LD [M]  arch/x86/crypto/crc32-pclmul.o
  LD [M]  arch/x86/crypto/crct10dif-pclmul.o
  CC      kernel/printk/printk_safe.o
  AR      arch/x86/crypto/built-in.a
  AR      arch/x86/mm/pat/built-in.a
  CC      lib/zlib_deflate/deftree.o
  CC      arch/x86/events/intel/lbr.o
  CC      lib/zlib_inflate/inftrees.o
  CC      arch/x86/events/intel/p4.o
  CC      crypto/aead.o
  AS      arch/x86/entry/entry.o
  CC      drivers/gpio/gpiolib-devres.o
  CC      init/version.o
  CC      security/keys/process_keys.o
  CC      sound/core/seq/seq_timer.o
  CC      drivers/gpio/gpiolib-legacy.o
  CC      mm/kasan/shadow.o
  CC      lib/zlib_inflate/inflate_syms.o
  CC      net/core/request_sock.o
  CC [M]  lib/kunit/executor.o
  CC      drivers/gpio/gpiolib-cdev.o
  CC      arch/x86/kernel/cpu/microcode/amd.o
  AR      arch/x86/kernel/cpu/mtrr/built-in.a
  CC      block/bio.o
  AS      arch/x86/entry/vsyscall/vsyscall_emu_64.o
  AR      arch/x86/entry/vsyscall/built-in.a
  AS      arch/x86/entry/entry_64.o
  CC      arch/x86/lib/cache-smp.o
  CC      lib/crypto/gf128mul.o
  CC      arch/x86/entry/vdso/vdso32/vgetcpu.o
  CC      arch/x86/entry/syscall_64.o
  CC      net/sched/sch_generic.o
  AR      init/built-in.a
  CC      block/elevator.o
  CC      arch/x86/mm/mmap.o
  AR      lib/math/built-in.a
  CC [M]  drivers/pinctrl/intel/pinctrl-geminilake.o
  CC      lib/lzo/lzo1x_compress.o
  CC [M]  drivers/pinctrl/intel/pinctrl-sunrisepoint.o
  CC      kernel/locking/lockdep.o
  AR      fs/notify/fanotify/built-in.a
  CC      fs/notify/fsnotify.o
  AR      arch/x86/events/amd/built-in.a
  CC      arch/x86/lib/msr.o
  CC      arch/x86/events/core.o
  VDSO    arch/x86/entry/vdso/vdso64.so.dbg
  CC      kernel/power/process.o
  AR      arch/x86/kernel/acpi/built-in.a
  AR      drivers/pwm/built-in.a
  VDSO    arch/x86/entry/vdso/vdso32.so.dbg
  CC      arch/x86/kernel/cpu/mce/threshold.o
  OBJCOPY arch/x86/entry/vdso/vdso64.so
  OBJCOPY arch/x86/entry/vdso/vdso32.so
  CC      lib/lz4/lz4_compress.o
  VDSO2C  arch/x86/entry/vdso/vdso-image-64.c
  CC      kernel/printk/nbcon.o
  VDSO2C  arch/x86/entry/vdso/vdso-image-32.c
  CC      arch/x86/entry/vdso/vdso-image-64.o
  CC      lib/lz4/lz4hc_compress.o
  AR      arch/x86/events/zhaoxin/built-in.a
  AR      block/partitions/built-in.a
  CC      mm/kasan/quarantine.o
  CC      lib/lz4/lz4_decompress.o
  CC [M]  lib/kunit/attributes.o
  AR      lib/zlib_inflate/built-in.a
  CC      lib/crypto/blake2s.o
  AR      arch/x86/pci/built-in.a
  CC      lib/crypto/blake2s-generic.o
  CC      sound/core/seq/seq_system.o
  CC      arch/x86/kernel/cpu/mce/apei.o
  CC      drivers/gpio/gpiolib-sysfs.o
  CC      arch/x86/events/probe.o
  CC      arch/x86/entry/vdso/vdso-image-32.o
  CC      arch/x86/kernel/apic/apic.o
  CC      arch/x86/events/utils.o
  CC      crypto/geniv.o
  CC      arch/x86/kernel/apic/apic_common.o
  CC      arch/x86/events/rapl.o
  AS      arch/x86/lib/msr-reg.o
  CC      arch/x86/lib/msr-reg-export.o
  CC      arch/x86/events/intel/p6.o
  CC      lib/crypto/blake2s-selftest.o
  CC      lib/zlib_deflate/deflate_syms.o
  CC      kernel/printk/printk_ringbuffer.o
  CC      lib/lzo/lzo1x_decompress_safe.o
  AR      arch/x86/entry/vdso/built-in.a
  CC      fs/notify/notification.o
  CC      arch/x86/entry/common.o
  CC      fs/notify/group.o
  AR      drivers/pinctrl/intel/built-in.a
  CC      arch/x86/mm/pgtable.o
  CC      arch/x86/events/msr.o
  AR      drivers/pinctrl/mediatek/built-in.a
  CC      fs/notify/mark.o
  AR      drivers/pinctrl/mvebu/built-in.a
  AR      drivers/pinctrl/nomadik/built-in.a
  AR      drivers/pinctrl/nuvoton/built-in.a
  CC      security/keys/request_key.o
  CC      net/core/skbuff.o
  CC      arch/x86/events/intel/pt.o
  AR      arch/x86/kernel/cpu/microcode/built-in.a
  AR      drivers/pinctrl/nxp/built-in.a
  CC      arch/x86/events/intel/uncore.o
  CC      arch/x86/kernel/cpu/scattered.o
  AR      drivers/pinctrl/qcom/built-in.a
  CC      crypto/lskcipher.o
  AR      drivers/pinctrl/sprd/built-in.a
  CC      ipc/shm.o
  CC      crypto/skcipher.o
  AR      drivers/pinctrl/sunplus/built-in.a
  AR      drivers/pinctrl/ti/built-in.a
  CC      drivers/pinctrl/core.o
  CC      lib/crypto/des.o
  CC      sound/core/seq/seq_ports.o
  AS      arch/x86/lib/hweight.o
  CC      sound/core/seq/seq_info.o
  AR      lib/kunit/built-in.a
  CC [M]  arch/x86/kvm/../../../virt/kvm/binary_stats.o
  CC      arch/x86/lib/iomem.o
  LD [M]  lib/kunit/kunit.o
  CC      kernel/irq/irqdesc.o
  CC      ipc/syscall.o
  AR      arch/x86/kernel/cpu/mce/built-in.a
  CC      kernel/irq/handle.o
  CC      arch/x86/kernel/apic/apic_noop.o
  AR      mm/kasan/built-in.a
  CC      kernel/power/suspend.o
  CC      mm/swap.o
  AR      lib/zlib_deflate/built-in.a
  CC      arch/x86/kernel/apic/ipi.o
  CC      drivers/pinctrl/pinctrl-utils.o
  CC      arch/x86/mm/physaddr.o
  CC      io_uring/fs.o
  CC      kernel/printk/sysctl.o
  CC      drivers/gpio/gpiolib-acpi.o
  AR      lib/lzo/built-in.a
  CC      crypto/seqiv.o
  CC      lib/zstd/zstd_compress_module.o
  CC      fs/notify/fdinfo.o
  CC      arch/x86/events/intel/uncore_nhmex.o
  CC      arch/x86/kernel/cpu/topology.o
  CC      kernel/locking/lockdep_proc.o
  AS      arch/x86/entry/thunk_64.o
  CC      kernel/irq/manage.o
  CC      kernel/irq/spurious.o
  AS      arch/x86/lib/iomap_copy_64.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/vfio.o
  CC      kernel/locking/spinlock.o
  AS      arch/x86/entry/entry_64_compat.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/coalesced_mmio.o
  CC      arch/x86/lib/inat.o
  CC      arch/x86/entry/syscall_32.o
  CC      arch/x86/mm/tlb.o
  AR      kernel/printk/built-in.a
  CC      kernel/locking/osq_lock.o
  CC      net/core/datagram.o
  CC      security/keys/request_key_auth.o
  AR      arch/x86/lib/built-in.a
  AR      arch/x86/lib/lib.a
  CC      arch/x86/kernel/cpu/common.o
  CC      kernel/power/hibernate.o
  CC      kernel/power/snapshot.o
  CC      block/blk-core.o
  CC      block/blk-sysfs.o
  CC      net/sched/sch_mq.o
  CC      crypto/echainiv.o
  AR      sound/core/seq/built-in.a
  CC      drivers/pci/msi/pcidev_msi.o
  CC      sound/core/init.o
  CC      drivers/pci/pcie/portdrv.o
  CC      arch/x86/kernel/apic/vector.o
  CC      drivers/pci/pcie/rcec.o
  CC      arch/x86/mm/cpu_entry_area.o
  CC      security/keys/user_defined.o
  AR      lib/lz4/built-in.a
  CC      fs/nfs_common/grace.o
  CC      security/keys/compat.o
  CC      lib/zstd/compress/fse_compress.o
  CC      sound/core/memory.o
  CC      kernel/irq/resend.o
  CC      lib/zstd/compress/hist.o
  CC      net/sched/sch_frag.o
  AR      fs/notify/built-in.a
  CC      net/core/stream.o
  CC      lib/crypto/sha1.o
  CC      drivers/pinctrl/pinmux.o
  CC      io_uring/splice.o
  CC      kernel/power/swap.o
  CC      arch/x86/events/intel/uncore_snb.o
  CC      io_uring/sync.o
  AR      arch/x86/entry/built-in.a
  CC      kernel/rcu/update.o
  CC      kernel/rcu/sync.o
  CC      lib/zstd/compress/huf_compress.o
  CC      drivers/pinctrl/pinconf.o
  CC      kernel/locking/qspinlock.o
  CC      arch/x86/kernel/cpu/rdrand.o
  CC      lib/zstd/compress/zstd_compress.o
  AR      kernel/livepatch/built-in.a
  CC      security/keys/proc.o
  CC      kernel/dma/mapping.o
  CC      security/keys/sysctl.o
  CC      ipc/ipc_sysctl.o
  CC      drivers/pci/msi/api.o
  CC      crypto/ahash.o
  CC      drivers/gpio/gpiolib-swnode.o
  CC      arch/x86/kernel/cpu/match.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/async_pf.o
  CC      arch/x86/kernel/apic/init.o
  CC      drivers/idle/intel_idle.o
  AR      drivers/char/ipmi/built-in.a
  CC      drivers/video/console/dummycon.o
  CC      kernel/sched/fair.o
  CC      drivers/video/console/vgacon.o
  CC      arch/x86/mm/maccess.o
  CC      arch/x86/mm/pgprot.o
  CC      drivers/pci/msi/msi.o
  CC      kernel/sched/build_policy.o
  CC      lib/crypto/sha256.o
  CC      drivers/pci/pcie/aspm.o
  AR      fs/nfs_common/built-in.a
  CC      fs/iomap/trace.o
  CC      arch/x86/kernel/apic/hw_nmi.o
  CC      kernel/sched/build_utility.o
  CC      sound/core/control.o
  CC      kernel/irq/chip.o
  CC      arch/x86/kernel/apic/io_apic.o
  CC      arch/x86/mm/hugetlbpage.o
  CC      drivers/pinctrl/pinconf-generic.o
  CC      kernel/locking/rtmutex_api.o
  CC      io_uring/advise.o
  CC      kernel/irq/dummychip.o
  CC      sound/core/misc.o
  CC      arch/x86/kernel/cpu/bugs.o
  CC      kernel/power/user.o
  CC      ipc/mqueue.o
  AR      fs/quota/built-in.a
  CC      fs/iomap/iter.o
  AR      security/keys/built-in.a
  AR      security/built-in.a
  CC      arch/x86/events/intel/uncore_snbep.o
  AR      drivers/gpio/built-in.a
  CC      arch/x86/events/intel/uncore_discovery.o
  CC      block/blk-flush.o
  CC      arch/x86/mm/kasan_init_64.o
  CC      arch/x86/kernel/cpu/aperfmperf.o
  CC      ipc/namespace.o
  CC      arch/x86/kernel/cpu/cpuid-deps.o
  CC      net/sched/sch_api.o
  CC      ipc/mq_sysctl.o
  CC      mm/truncate.o
  CC      fs/proc/task_mmu.o
  CC      net/core/scm.o
  CC      kernel/power/poweroff.o
  CC      block/blk-settings.o
  CC      arch/x86/kernel/apic/msi.o
  CC      mm/vmscan.o
  CC [M]  lib/crypto/arc4.o
  CC      kernel/dma/direct.o
  CC      crypto/shash.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/irqchip.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/dirty_ring.o
  CC      kernel/dma/ops_helpers.o
  AR      drivers/pinctrl/built-in.a
  CC      crypto/akcipher.o
  CC      block/blk-ioc.o
  CC      fs/kernfs/mount.o
  AR      drivers/video/console/built-in.a
  CC      drivers/pci/msi/irqdomain.o
  CC      drivers/video/logo/logo.o
  CC      drivers/acpi/acpica/dsargs.o
  HOSTCC  drivers/video/logo/pnmtologo
  CC      kernel/rcu/srcutree.o
  CC      drivers/video/backlight/backlight.o
  AR      drivers/idle/built-in.a
  CC      io_uring/filetable.o
  CC      drivers/video/aperture.o
  CC      drivers/video/fbdev/core/fb_notify.o
  CC      io_uring/openclose.o
  CC      drivers/pnp/pnpacpi/core.o
  CC      drivers/pci/pcie/aer.o
  CC      fs/iomap/buffered-io.o
  CC      drivers/pnp/pnpacpi/rsparser.o
  AR      kernel/power/built-in.a
  CC      arch/x86/kernel/cpu/umwait.o
  CC      drivers/pnp/core.o
  AR      lib/crypto/built-in.a
  LD [M]  lib/crypto/libarc4.o
  CC      drivers/pci/pcie/err.o
  CC      arch/x86/mm/numa.o
  CC      kernel/entry/common.o
  CC      kernel/irq/devres.o
  CC      kernel/entry/syscall_user_dispatch.o
  AR      drivers/video/fbdev/omap/built-in.a
  CC      sound/core/device.o
  CC      drivers/acpi/acpica/dscontrol.o
  AR      drivers/video/fbdev/omap2/omapfb/dss/built-in.a
  AR      drivers/video/fbdev/omap2/omapfb/displays/built-in.a
  CC      sound/core/info.o
  AR      drivers/video/fbdev/omap2/omapfb/built-in.a
  AR      drivers/video/fbdev/omap2/built-in.a
  CC      fs/proc/inode.o
  LOGO    drivers/video/logo/logo_linux_clut224.c
  CC [M]  drivers/video/fbdev/uvesafb.o
  CC      drivers/video/logo/logo_linux_clut224.o
  AR      drivers/video/logo/built-in.a
  CC      drivers/video/cmdline.o
  CC      crypto/sig.o
  CC      fs/kernfs/inode.o
  CC      drivers/acpi/acpica/dsdebug.o
  CC      block/blk-map.o
  CC      kernel/locking/spinlock_debug.o
  CC      fs/proc/root.o
  CC      kernel/dma/dummy.o
  CC      net/core/gen_stats.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/pfncache.o
  CC      io_uring/uring_cmd.o
  AR      drivers/pci/msi/built-in.a
  CC      lib/zstd/compress/zstd_compress_literals.o
  CC      drivers/pci/hotplug/pci_hotplug_core.o
  CC      sound/core/isadma.o
  CC      drivers/pci/hotplug/acpi_pcihp.o
  CC [M]  drivers/video/fbdev/core/fb_info.o
  CC      drivers/pci/hotplug/pciehp_core.o
  CC      arch/x86/kernel/apic/x2apic_phys.o
  CC      net/core/gen_estimator.o
  CC      kernel/irq/autoprobe.o
  CC      fs/proc/base.o
  AR      drivers/pci/controller/dwc/built-in.a
  CC      drivers/pci/hotplug/pciehp_ctrl.o
  CC      drivers/video/nomodeset.o
  AR      drivers/pci/controller/mobiveil/built-in.a
  CC      drivers/pci/controller/vmd.o
  CC      drivers/pci/hotplug/pciehp_pci.o
  AR      drivers/video/backlight/built-in.a
  CC      arch/x86/kernel/cpu/proc.o
  CC      drivers/video/hdmi.o
  CC      drivers/acpi/acpica/dsfield.o
  CC      sound/core/vmaster.o
  CC      kernel/locking/qrwlock.o
  CC      crypto/kpp.o
  AR      ipc/built-in.a
  AR      drivers/pnp/pnpacpi/built-in.a
  CC      crypto/acompress.o
  CC      drivers/pnp/card.o
  CC      arch/x86/kernel/apic/x2apic_cluster.o
  CC [M]  arch/x86/kvm/x86.o
  CC      kernel/entry/kvm.o
  CC      kernel/dma/contiguous.o
  CC      kernel/rcu/tree.o
  CC      net/sched/sch_blackhole.o
  CC      drivers/pci/pcie/aer_inject.o
  CC [M]  arch/x86/kvm/emulate.o
  CC      drivers/pci/pcie/pme.o
  CC      net/netlink/af_netlink.o
  CC      fs/proc/generic.o
  CC      fs/kernfs/dir.o
  CC      arch/x86/mm/numa_64.o
  CC      kernel/dma/swiotlb.o
  CC      kernel/irq/irqdomain.o
  CC      drivers/acpi/acpica/dsinit.o
  CC      lib/zstd/compress/zstd_compress_sequences.o
  CC      arch/x86/kernel/apic/apic_flat_64.o
  MKCAP   arch/x86/kernel/cpu/capflags.c
  CC      arch/x86/events/intel/cstate.o
  CC [M]  drivers/video/fbdev/core/fbmem.o
  CC      drivers/pnp/driver.o
  CC      drivers/pnp/resource.o
  CC [M]  drivers/video/fbdev/core/fbcmap.o
  CC      fs/kernfs/file.o
  CC      block/blk-merge.o
  CC      drivers/acpi/numa/srat.o
  CC      block/blk-timeout.o
  CC      net/core/net_namespace.o
  CC      drivers/pci/hotplug/pciehp_hpc.o
  AR      kernel/locking/built-in.a
  CC      sound/core/ctljack.o
  CC      block/blk-lib.o
  CC      io_uring/epoll.o
  AR      sound/pci/ac97/built-in.a
  AR      sound/pci/ali5451/built-in.a
  CC      io_uring/statx.o
  CC      crypto/scompress.o
  AR      sound/pci/asihpi/built-in.a
  CC      drivers/pci/hotplug/acpiphp_core.o
  AR      sound/pci/au88x0/built-in.a
  AR      sound/pci/aw2/built-in.a
  CC      lib/xz/xz_dec_syms.o
  CC      arch/x86/kernel/kprobes/core.o
  CC      lib/xz/xz_dec_stream.o
  AR      sound/pci/ctxfi/built-in.a
  CC      lib/zstd/compress/zstd_compress_superblock.o
  AR      sound/pci/ca0106/built-in.a
  CC      drivers/acpi/acpica/dsmethod.o
  CC      arch/x86/mm/amdtopology.o
  AR      drivers/pci/controller/built-in.a
  AR      sound/pci/cs46xx/built-in.a
  CC      lib/xz/xz_dec_lzma2.o
  CC      drivers/acpi/acpica/dsmthdat.o
  AR      sound/pci/cs5535audio/built-in.a
  AR      sound/pci/lola/built-in.a
  AR      sound/pci/lx6464es/built-in.a
  AR      sound/pci/echoaudio/built-in.a
  AR      sound/pci/emu10k1/built-in.a
  AR      sound/pci/hda/built-in.a
  CC [M]  sound/pci/hda/hda_bind.o
  CC      lib/xz/xz_dec_bcj.o
  CC      net/sched/sch_fifo.o
  AR      kernel/entry/built-in.a
  AR      sound/pci/ice1712/built-in.a
  CC      fs/kernfs/symlink.o
  CC      kernel/rcu/rcu_segcblist.o
  CC      drivers/pci/pcie/dpc.o
  CC      arch/x86/kernel/apic/probe_64.o
  CC      lib/zstd/compress/zstd_double_fast.o
  CC      fs/iomap/direct-io.o
  CC [M]  sound/pci/hda/hda_codec.o
  CC      crypto/algboss.o
  CC      sound/core/jack.o
  CC [M]  arch/x86/kvm/i8259.o
  AR      arch/x86/events/intel/built-in.a
  CC      fs/iomap/fiemap.o
  AR      arch/x86/events/built-in.a
  CC      lib/zstd/compress/zstd_fast.o
  CC      lib/zstd/compress/zstd_lazy.o
  CC      crypto/testmgr.o
  CC      drivers/acpi/acpica/dsobject.o
  AR      drivers/acpi/numa/built-in.a
  CC      lib/zstd/compress/zstd_ldm.o
  LDS     arch/x86/kernel/vmlinux.lds
  AS      arch/x86/kernel/head_64.o
  CC      block/blk-mq.o
  CC      block/blk-mq-tag.o
  CC [M]  sound/pci/hda/hda_jack.o
  CC [M]  sound/pci/hda/hda_auto_parser.o
  AR      drivers/pci/switch/built-in.a
  CC      arch/x86/mm/srat.o
  CC [M]  drivers/video/fbdev/core/modedb.o
  CC      kernel/dma/remap.o
  CC      net/core/secure_seq.o
  CC      net/core/flow_dissector.o
  CC      lib/raid6/algos.o
  CC      kernel/irq/proc.o
  CC      lib/raid6/recov.o
  CC      io_uring/net.o
  HOSTCC  lib/raid6/mktables
  AR      lib/xz/built-in.a
  AR      arch/x86/kernel/apic/built-in.a
  CC      crypto/cmac.o
  CC      lib/fonts/fonts.o
  AR      fs/kernfs/built-in.a
  CC      drivers/pnp/manager.o
  UNROLL  lib/raid6/int1.c
  CC      fs/sysfs/file.o
  CC      drivers/pci/hotplug/acpiphp_glue.o
  CC      arch/x86/kernel/kprobes/opt.o
  CC      kernel/irq/migration.o
  CC      arch/x86/kernel/kprobes/ftrace.o
  CC      drivers/acpi/apei/apei-base.o
  AR      drivers/pci/pcie/built-in.a
  AR      net/bpf/built-in.a
  CC [M]  arch/x86/kvm/irq.o
  CC      drivers/acpi/acpica/dsopcode.o
  CC      io_uring/msg_ring.o
  CC      sound/core/timer.o
  AR      net/sched/built-in.a
  CC      drivers/acpi/apei/hest.o
  AR      drivers/amba/built-in.a
  AR      drivers/clk/actions/built-in.a
  AR      drivers/clk/analogbits/built-in.a
  CC      crypto/hmac.o
  AR      drivers/clk/bcm/built-in.a
  AR      drivers/clk/imgtec/built-in.a
  CC      block/blk-stat.o
  AR      drivers/clk/imx/built-in.a
  AR      drivers/clk/ingenic/built-in.a
  CC      crypto/vmac.o
  AR      kernel/dma/built-in.a
  AR      drivers/clk/mediatek/built-in.a
  AR      drivers/clk/microchip/built-in.a
  CC      kernel/module/main.o
  AR      drivers/clk/mstar/built-in.a
  AR      drivers/clk/mvebu/built-in.a
  CC      arch/x86/mm/pkeys.o
  AR      drivers/clk/ralink/built-in.a
  CC      lib/fonts/font_8x8.o
  AR      drivers/clk/renesas/built-in.a
  CC      fs/proc/array.o
  AR      drivers/clk/socfpga/built-in.a
  CC      fs/proc/fd.o
  CC      lib/fonts/font_8x16.o
  AR      drivers/clk/sprd/built-in.a
  UNROLL  lib/raid6/int2.c
  UNROLL  lib/raid6/int4.c
  AR      drivers/clk/starfive/built-in.a
  UNROLL  lib/raid6/int8.c
  CC      lib/raid6/recov_ssse3.o
  AR      drivers/clk/sunxi-ng/built-in.a
  AR      drivers/clk/ti/built-in.a
  AR      drivers/clk/versatile/built-in.a
  CC      fs/iomap/seek.o
  CC      lib/raid6/recov_avx2.o
  CC      drivers/clk/x86/clk-lpss-atom.o
  AR      drivers/clk/xilinx/built-in.a
  CC      drivers/pnp/support.o
  CC      drivers/clk/x86/clk-pmc-atom.o
  CC      mm/shrinker.o
  CC      kernel/irq/cpuhotplug.o
  CC      fs/proc/proc_tty.o
  CC      drivers/acpi/acpica/dspkginit.o
  AR      drivers/acpi/pmic/built-in.a
  CC      kernel/module/strict_rwx.o
  CC      kernel/module/kmod.o
  CC      block/blk-mq-sysfs.o
  CC      fs/sysfs/dir.o
  CC [M]  drivers/video/fbdev/core/fbcvt.o
  CC      drivers/acpi/dptf/int340x_thermal.o
  AR      arch/x86/kernel/kprobes/built-in.a
  CC      arch/x86/kernel/cpu/powerflags.o
  CC [M]  drivers/video/fbdev/simplefb.o
  CC      sound/core/hrtimer.o
  CC      fs/sysfs/symlink.o
  CC [M]  arch/x86/kvm/lapic.o
  CC      fs/iomap/swapfile.o
  CC      fs/sysfs/mount.o
  CC      drivers/acpi/apei/erst.o
  AR      lib/fonts/built-in.a
  CC      sound/core/seq_device.o
  AR      drivers/pci/hotplug/built-in.a
  CC      drivers/pci/access.o
  CC      arch/x86/mm/pti.o
  CC      drivers/clk/clk-devres.o
  CC      drivers/acpi/acpica/dsutils.o
  CC      drivers/clk/clk-bulk.o
  CC      lib/zstd/compress/zstd_opt.o
  CC      net/ethtool/ioctl.o
  CC      drivers/pnp/interface.o
  CC      io_uring/timeout.o
  AR      drivers/clk/x86/built-in.a
  CC      drivers/pnp/quirks.o
  CC      lib/zstd/zstd_decompress_module.o
  CC      lib/raid6/mmx.o
  CC      drivers/acpi/acpica/dswexec.o
  CC      drivers/acpi/acpica/dswload.o
  CC      kernel/irq/pm.o
  CC      net/core/sysctl_net_core.o
  CC      net/netlink/genetlink.o
  CC      lib/raid6/sse1.o
  CC      drivers/pci/bus.o
  CC      lib/raid6/sse2.o
  AR      drivers/acpi/dptf/built-in.a
  CC      drivers/acpi/tables.o
  CC      drivers/acpi/blacklist.o
  CC      drivers/acpi/osi.o
  AR      kernel/sched/built-in.a
  CC      lib/zstd/decompress/huf_decompress.o
  CC [M]  arch/x86/kvm/i8254.o
  CC [M]  arch/x86/kvm/ioapic.o
  CC      net/core/dev.o
  CC      net/core/dev_addr_lists.o
  CC [M]  sound/pci/hda/hda_sysfs.o
  CC [M]  drivers/video/fbdev/core/fb_cmdline.o
  CC      net/core/dst.o
  CC      fs/proc/cmdline.o
  AR      fs/iomap/built-in.a
  CC      fs/sysfs/group.o
  CC      crypto/xcbc.o
  CC [M]  drivers/video/fbdev/core/fb_backlight.o
  CC      crypto/crypto_null.o
  CC      io_uring/sqpoll.o
  CC [M]  sound/core/control_led.o
  CC      drivers/clk/clkdev.o
  CC      drivers/clk/clk.o
  CC      net/core/netevent.o
  CC      drivers/acpi/acpica/dswload2.o
  CC      mm/shmem.o
  CC      drivers/acpi/acpica/dswscope.o
  AR      arch/x86/mm/built-in.a
  CC      net/core/neighbour.o
  CC      mm/util.o
  AR      sound/ppc/built-in.a
  CC      drivers/clk/clk-divider.o
  CC      drivers/acpi/apei/bert.o
  CC      net/ethtool/common.o
  CC      drivers/pnp/system.o
  CC      kernel/irq/msi.o
  CC      drivers/acpi/osl.o
  CC      lib/raid6/avx2.o
  CC      fs/proc/consoles.o
  CC      drivers/pci/probe.o
  CC [M]  net/netfilter/ipvs/ip_vs_conn.o
  AR      net/ipv4/netfilter/built-in.a
  CC [M]  net/ipv4/netfilter/nf_defrag_ipv4.o
  CC [M]  sound/pci/hda/hda_controller.o
  CC      net/xfrm/xfrm_policy.o
  AR      sound/arm/built-in.a
  CC      arch/x86/kernel/head64.o
  CC      drivers/acpi/acpica/dswstate.o
  CC      net/ipv4/route.o
  CC      net/unix/af_unix.o
  CC      crypto/md5.o
  AR      fs/sysfs/built-in.a
  CC      fs/proc/cpuinfo.o
  CC      arch/x86/kernel/ebda.o
  CC      drivers/pci/host-bridge.o
  CC [M]  drivers/video/fbdev/core/fbmon.o
  CC      drivers/acpi/utils.o
  CC      lib/zstd/decompress/zstd_ddict.o
  CC [M]  sound/pci/hda/hda_proc.o
  AR      drivers/pnp/built-in.a
  CC      drivers/acpi/apei/ghes.o
  CC [M]  net/netfilter/ipvs/ip_vs_core.o
  CC [M]  sound/core/hwdep.o
  AR      sound/sh/built-in.a
  CC      net/core/rtnetlink.o
  CC      net/core/utils.o
  AR      sound/synth/emux/built-in.a
  AR      sound/synth/built-in.a
  CC      drivers/clk/clk-fixed-factor.o
  CC [M]  net/netfilter/ipvs/ip_vs_ctl.o
  CC      kernel/module/tree_lookup.o
  CC      arch/x86/kernel/cpu/feat_ctl.o
  CC      arch/x86/kernel/cpu/intel.o
  CC      io_uring/fdinfo.o
  CC      drivers/acpi/acpica/evevent.o
  CC      net/netfilter/core.o
  CC      lib/raid6/avx512.o
  AR      kernel/rcu/built-in.a
  CC      crypto/sha1_generic.o
  CC      drivers/acpi/acpica/evgpe.o
  CC      io_uring/tctx.o
  CC      fs/proc/devices.o
  CC      net/netlink/policy.o
  CC      arch/x86/kernel/platform-quirks.o
  CC [M]  sound/core/pcm.o
  CC      drivers/acpi/acpica/evgpeblk.o
  AR      sound/pci/korg1212/built-in.a
  CC [M]  sound/core/pcm_native.o
  CC      lib/zstd/decompress/zstd_decompress.o
  CC      block/blk-mq-cpumap.o
  CC      kernel/module/debug_kmemleak.o
  CC      kernel/module/kallsyms.o
  CC      kernel/irq/affinity.o
  CC [M]  sound/pci/hda/hda_hwdep.o
  CC      arch/x86/kernel/process_64.o
  CC [M]  sound/core/pcm_lib.o
  CC [M]  net/ipv4/netfilter/nf_reject_ipv4.o
  CC      net/core/link_watch.o
  CC      net/netfilter/nf_log.o
  CC      drivers/acpi/acpica/evgpeinit.o
  CC      crypto/sha256_generic.o
  CC      io_uring/poll.o
  CC      block/blk-mq-sched.o
  CC [M]  sound/core/pcm_misc.o
  CC      fs/proc/interrupts.o
  CC      lib/raid6/recov_avx512.o
  CC      drivers/clk/clk-fixed-rate.o
  CC      fs/proc/loadavg.o
  CC      net/ethtool/netlink.o
  CC      net/ethtool/bitset.o
  CC [M]  drivers/video/fbdev/core/fb_defio.o
  AR      drivers/acpi/apei/built-in.a
  CC      net/core/filter.o
  CC      net/ipv4/inetpeer.o
  CC      net/netlink/diag.o
  CC      drivers/acpi/reboot.o
  CC      io_uring/cancel.o
  CC      arch/x86/kernel/cpu/intel_pconfig.o
  CC      drivers/acpi/nvs.o
  CC      drivers/pci/remove.o
  CC      kernel/irq/matrix.o
  CC      drivers/acpi/acpica/evgpeutil.o
  CC [M]  drivers/video/fbdev/core/fb_chrdev.o
  CC      fs/configfs/inode.o
  CC [M]  sound/pci/hda/hda_generic.o
  CC      fs/configfs/file.o
  CC      arch/x86/kernel/cpu/tsx.o
  CC      drivers/clk/clk-gate.o
  CC      net/ethtool/strset.o
  CC      crypto/sha512_generic.o
  CC      kernel/module/procfs.o
  CC      fs/proc/meminfo.o
  CC      drivers/clk/clk-multiplier.o
  CC      arch/x86/kernel/cpu/intel_epb.o
  TABLE   lib/raid6/tables.c
  CC      net/ipv4/protocol.o
  CC      lib/raid6/int1.o
  CC      fs/devpts/inode.o
  CC      drivers/acpi/acpica/evglock.o
  CC      arch/x86/kernel/signal.o
  CC      drivers/pci/pci.o
  CC      net/core/sock_diag.o
  AR      sound/usb/misc/built-in.a
  AR      sound/usb/usx2y/built-in.a
  CC      net/xfrm/xfrm_state.o
  AR      sound/usb/caiaq/built-in.a
  CC      block/ioctl.o
  CC      mm/mmzone.o
  AR      sound/usb/6fire/built-in.a
  CC      drivers/pci/pci-driver.o
  AR      sound/usb/hiface/built-in.a
  CC      drivers/pci/search.o
  CC      drivers/pci/pci-sysfs.o
  AR      sound/usb/bcd2000/built-in.a
  AR      sound/usb/built-in.a
  CC      mm/vmstat.o
  CC [M]  net/ipv4/netfilter/ip_tables.o
  CC [M]  arch/x86/kvm/irq_comm.o
  AR      sound/firewire/built-in.a
  CC      fs/configfs/dir.o
  CC [M]  sound/pci/hda/patch_realtek.o
  AR      sound/sparc/built-in.a
  CC [M]  sound/pci/hda/patch_analog.o
  CC [M]  net/ipv4/netfilter/iptable_filter.o
  CC      kernel/module/sysfs.o
  CC      kernel/time/time.o
  CC      drivers/clk/clk-mux.o
  AR      net/netlink/built-in.a
  CC      crypto/sha3_generic.o
  CC      io_uring/kbuf.o
  CC      net/xfrm/xfrm_hash.o
  CC      arch/x86/kernel/cpu/amd.o
  CC      io_uring/rsrc.o
  CC      drivers/acpi/acpica/evhandler.o
  CC [M]  net/netfilter/ipvs/ip_vs_sched.o
  CC      net/unix/garbage.o
  CC      net/xfrm/xfrm_input.o
  CC [M]  drivers/video/fbdev/core/fb_procfs.o
  CC      kernel/futex/core.o
  CC      fs/proc/stat.o
  CC      lib/raid6/int2.o
  CC      kernel/futex/syscalls.o
  AR      kernel/irq/built-in.a
  CC      kernel/futex/pi.o
  CC      kernel/cgroup/cgroup.o
  CC      net/ethtool/linkinfo.o
  AR      fs/devpts/built-in.a
  CC      fs/ext4/balloc.o
  CC      kernel/cgroup/rstat.o
  CC      lib/raid6/int4.o
  CC      fs/ext4/bitmap.o
  CC      drivers/acpi/acpica/evmisc.o
  CC      drivers/pci/rom.o
  CC      net/unix/sysctl_net_unix.o
  AR      kernel/module/built-in.a
  AR      sound/spi/built-in.a
  AR      sound/parisc/built-in.a
  CC      drivers/clk/clk-composite.o
  AR      sound/pcmcia/vx/built-in.a
  CC      crypto/blake2b_generic.o
  AR      sound/pcmcia/pdaudiocf/built-in.a
  AR      sound/pcmcia/built-in.a
  CC      crypto/ecb.o
  CC      block/genhd.o
  CC      fs/jbd2/transaction.o
  CC      fs/ramfs/inode.o
  CC      lib/argv_split.o
  CC      fs/proc/uptime.o
  CC      fs/hugetlbfs/inode.o
  CC      fs/ramfs/file-mmu.o
  CC [M]  arch/x86/kvm/cpuid.o
  CC [M]  net/ipv4/netfilter/iptable_mangle.o
  CC [M]  drivers/video/fbdev/core/fbsysfs.o
  CC      kernel/time/timer.o
  CC [M]  sound/core/pcm_memory.o
  CC      drivers/acpi/acpica/evregion.o
  CC      arch/x86/kernel/cpu/hygon.o
  CC      fs/configfs/symlink.o
  CC      drivers/acpi/acpica/evrgnini.o
  CC [M]  net/ipv4/netfilter/iptable_nat.o
  CC      lib/raid6/int8.o
  CC [M]  net/netfilter/ipvs/ip_vs_xmit.o
  CC      drivers/pci/setup-res.o
  AR      net/ipv6/netfilter/built-in.a
  CC      drivers/pci/irq.o
  CC [M]  net/ipv6/netfilter/nf_defrag_ipv6_hooks.o
  CC      fs/ext4/block_validity.o
  CC      net/ipv6/af_inet6.o
  CC      net/packet/af_packet.o
  CC [M]  net/ipv6/netfilter/nf_conntrack_reasm.o
  CC      net/ethtool/linkmodes.o
  CC      net/packet/diag.o
  CC      kernel/futex/requeue.o
  CC      kernel/futex/waitwake.o
  CC      fs/proc/util.o
  CC      fs/ext4/dir.o
  CC      crypto/cbc.o
  CC      mm/backing-dev.o
  CC      drivers/clk/clk-fractional-divider.o
  CC      net/ipv6/anycast.o
  CC      net/unix/diag.o
  AR      fs/ramfs/built-in.a
  CC      fs/fat/cache.o
  CC      drivers/acpi/acpica/evsci.o
  CC      net/unix/scm.o
  CC [M]  net/netfilter/ipvs/ip_vs_app.o
  CC      arch/x86/kernel/cpu/centaur.o
  CC      fs/configfs/mount.o
  CC      io_uring/rw.o
  CC [M]  sound/core/memalloc.o
  CC      arch/x86/kernel/cpu/zhaoxin.o
  CC      drivers/pci/vpd.o
  CC [M]  drivers/video/fbdev/core/fbcon.o
  CC      fs/proc/version.o
  CC      lib/raid6/tables.o
  CC      drivers/pci/setup-bus.o
  CC [M]  net/ipv4/netfilter/ipt_REJECT.o
  CC      drivers/acpi/acpica/evxface.o
  CC      crypto/pcbc.o
  CC      crypto/cts.o
  CC      drivers/acpi/acpica/evxfevnt.o
  CC [M]  sound/core/pcm_timer.o
  CC      block/ioprio.o
  CC      drivers/clk/clk-gpio.o
  CC      net/xfrm/xfrm_output.o
  AR      kernel/futex/built-in.a
  CC [M]  drivers/video/fbdev/core/bitblit.o
  CC      lib/bug.o
  AR      fs/hugetlbfs/built-in.a
  CC      fs/nfs/client.o
  CC      fs/ext4/ext4_jbd2.o
  CC      io_uring/opdef.o
  CC      net/ethtool/rss.o
  CC      fs/fat/dir.o
  CC      arch/x86/kernel/cpu/perfctr-watchdog.o
  CC      fs/proc/softirqs.o
  CC      fs/configfs/item.o
  CC      fs/ext4/extents.o
  CC      fs/jbd2/commit.o
  LD [M]  sound/core/snd-ctl-led.o
  AR      sound/mips/built-in.a
  AR      sound/pci/mixart/built-in.a
  CC      drivers/acpi/acpica/evxfgpe.o
  CC      fs/nfs/dir.o
  CC      net/ethtool/linkstate.o
  AR      net/unix/built-in.a
  CC      net/key/af_key.o
  CC      fs/exportfs/expfs.o
  AR      sound/pci/nm256/built-in.a
  AR      net/bridge/netfilter/built-in.a
  CC      net/bridge/br.o
  CC      net/ethtool/debug.o
  CC      net/ethtool/wol.o
  CC      net/bridge/br_device.o
  LD [M]  net/ipv6/netfilter/nf_defrag_ipv6.o
  CC      net/bridge/br_fdb.o
  LD [M]  sound/core/snd-hwdep.o
  AR      drivers/clk/built-in.a
  LD [M]  sound/core/snd-pcm.o
  CC      net/xfrm/xfrm_sysctl.o
  CC      kernel/cgroup/namespace.o
  CC      crypto/lrw.o
  AR      sound/core/built-in.a
  AR      lib/raid6/built-in.a
  CC      fs/jbd2/recovery.o
  CC      arch/x86/kernel/signal_64.o
  CC      kernel/trace/trace_clock.o
  CC      fs/jbd2/checkpoint.o
  CC [M]  sound/pci/hda/patch_hdmi.o
  CC      fs/proc/namespaces.o
  CC      mm/mm_init.o
  CC      net/ipv6/ip6_output.o
  CC      block/badblocks.o
  AR      fs/configfs/built-in.a
  CC      kernel/time/hrtimer.o
  CC      net/ipv6/ip6_input.o
  CC      arch/x86/kernel/cpu/vmware.o
  CC      net/bridge/br_forward.o
  CC      net/ethtool/features.o
  CC      net/ipv4/ip_input.o
  CC [M]  net/netfilter/ipvs/ip_vs_sync.o
  CC      drivers/acpi/acpica/evxfregn.o
  CC [M]  drivers/video/fbdev/core/softcursor.o
  AR      sound/pci/oxygen/built-in.a
  CC [M]  drivers/video/fbdev/core/tileblit.o
  AR      fs/exportfs/built-in.a
  CC      fs/lockd/clntlock.o
  CC      net/ethtool/privflags.o
  CC      fs/lockd/clntproc.o
  CC      io_uring/notif.o
  CC      kernel/trace/ftrace.o
  CC      kernel/cgroup/cgroup-v1.o
  CC      net/ethtool/rings.o
  CC      net/ipv4/ip_fragment.o
  CC      crypto/xts.o
  CC      drivers/acpi/acpica/exconcat.o
  CC [M]  drivers/video/fbdev/core/fb_logo.o
  CC      net/ipv4/ip_forward.o
  CC      net/ipv6/addrconf.o
  CC      drivers/pci/vc.o
  CC      fs/proc/self.o
  CC      fs/ext4/extents_status.o
  CC [M]  sound/pci/hda/hda_eld.o
  CC      arch/x86/kernel/cpu/hypervisor.o
  CC [M]  net/netfilter/ipvs/ip_vs_est.o
  CC      fs/fat/fatent.o
  CC      net/xfrm/xfrm_replay.o
  CC      fs/jbd2/revoke.o
  CC      net/xfrm/xfrm_device.o
  CC      fs/jbd2/journal.o
  CC      arch/x86/kernel/traps.o
  CC      kernel/trace/ring_buffer.o
  CC      block/blk-rq-qos.o
  CC      net/bridge/br_if.o
  CC      fs/nfs/file.o
  CC [M]  net/netfilter/ipvs/ip_vs_proto.o
  CC      arch/x86/kernel/cpu/mshyperv.o
  CC      net/ethtool/channels.o
  CC      drivers/acpi/acpica/exconfig.o
  CC      fs/proc/thread_self.o
  CC      net/bridge/br_input.o
  CC      net/bridge/br_ioctl.o
  CC      drivers/pci/mmap.o
  CC [M]  arch/x86/kvm/pmu.o
  CC      io_uring/waitid.o
  CC      crypto/ctr.o
  CC      kernel/time/timekeeping.o
  CC      net/core/dev_ioctl.o
  CC      mm/percpu.o
  CC [M]  drivers/video/fbdev/core/cfbfillrect.o
  CC      drivers/acpi/acpica/exconvrt.o
  CC      fs/lockd/clntxdr.o
  CC      net/ipv4/ip_options.o
  CC      net/bridge/br_stp.o
  AR      net/packet/built-in.a
  AR      net/dsa/built-in.a
  CC      net/ipv6/addrlabel.o
  CC      fs/lockd/host.o
  CC      io_uring/io-wq.o
  CC      net/core/tso.o
  CC      arch/x86/kernel/cpu/debugfs.o
  CC      block/disk-events.o
  CC      fs/proc/proc_sysctl.o
  CC      mm/slab_common.o
  CC      net/core/sock_reuseport.o
  CC [M]  net/netfilter/ipvs/ip_vs_pe.o
  CC      mm/compaction.o
  CC      fs/fat/file.o
  CC [M]  sound/pci/hda/hda_intel.o
  CC      mm/show_mem.o
  LD [M]  sound/pci/hda/snd-hda-codec.o
  CC      drivers/pci/setup-irq.o
  CC      crypto/gcm.o
  CC      drivers/pci/proc.o
  CC      drivers/acpi/acpica/excreate.o
  AR      net/key/built-in.a
  LD [M]  sound/pci/hda/snd-hda-codec-generic.o
  CC      kernel/cgroup/freezer.o
  CC      net/netfilter/nf_queue.o
  CC      net/ethtool/coalesce.o
  CC      net/xfrm/xfrm_algo.o
  CC      lib/buildid.o
  CC      io_uring/futex.o
  CC      drivers/acpi/acpica/exdebug.o
  CC      fs/fat/inode.o
  CC      arch/x86/kernel/cpu/capflags.o
  CC      mm/shmem_quota.o
  AR      arch/x86/kernel/cpu/built-in.a
  CC [M]  drivers/video/fbdev/core/cfbcopyarea.o
  CC      arch/x86/kernel/idt.o
  CC      fs/nfs/getroot.o
  AR      sound/soc/built-in.a
  CC      drivers/pci/slot.o
  CC      fs/ext4/file.o
  CC      net/bridge/br_stp_bpdu.o
  CC [M]  arch/x86/kvm/mtrr.o
  CC      block/blk-ia-ranges.o
  CC      fs/ext4/fsmap.o
  CC [M]  net/netfilter/ipvs/ip_vs_proto_tcp.o
  CC      net/core/fib_notifier.o
  CC      fs/lockd/svc.o
  CC      kernel/trace/trace.o
  CC      drivers/acpi/acpica/exdump.o
  LD [M]  sound/pci/hda/snd-hda-codec-realtek.o
  AR      sound/pci/pcxhr/built-in.a
  CC [M]  arch/x86/kvm/hyperv.o
  CC      kernel/time/ntp.o
  CC [M]  net/netfilter/ipvs/ip_vs_proto_udp.o
  CC      fs/fat/misc.o
  CC      fs/fat/nfs.o
  CC      net/ipv6/route.o
  CC      net/ipv4/ip_output.o
  CC      net/ipv6/ip6_fib.o
  CC      kernel/trace/trace_output.o
  CC      kernel/cgroup/legacy_freezer.o
  CC      lib/cmdline.o
  CC      fs/nfs/inode.o
  CC      drivers/acpi/acpica/exfield.o
  CC      fs/nfs/super.o
  CC      crypto/pcrypt.o
  CC [M]  net/netfilter/ipvs/ip_vs_nfct.o
  AR      sound/pci/riptide/built-in.a
  CC      fs/ext4/fsync.o
  CC      arch/x86/kernel/irq.o
  CC      net/ethtool/pause.o
  CC      drivers/acpi/acpica/exfldio.o
  CC      net/bridge/br_stp_if.o
  CC      fs/lockd/svclock.o
  CC      drivers/pci/pci-acpi.o
  CC      net/xfrm/xfrm_user.o
  CC [M]  arch/x86/kvm/debugfs.o
  CC [M]  drivers/video/fbdev/core/cfbimgblt.o
  CC      fs/proc/proc_net.o
  CC      block/early-lookup.o
  CC      net/netfilter/nf_sockopt.o
  CC      mm/interval_tree.o
  AR      io_uring/built-in.a
  CC      fs/nfs/io.o
  CC      drivers/acpi/acpica/exmisc.o
  AR      sound/atmel/built-in.a
  CC      kernel/trace/trace_seq.o
  AR      sound/hda/built-in.a
  AR      fs/jbd2/built-in.a
  AR      sound/x86/built-in.a
  CC [M]  sound/hda/hda_bus_type.o
  CC      net/ethtool/eee.o
  CC      fs/ext4/hash.o
  AR      sound/xen/built-in.a
  LD [M]  sound/pci/hda/snd-hda-codec-analog.o
  CC      kernel/time/clocksource.o
  CC      fs/ext4/ialloc.o
  CC      net/core/xdp.o
  LD [M]  sound/pci/hda/snd-hda-codec-hdmi.o
  CC      kernel/trace/trace_stat.o
  LD [M]  sound/pci/hda/snd-hda-intel.o
  AR      sound/pci/rme9652/built-in.a
  CC      net/bridge/br_stp_timer.o
  AR      sound/pci/trident/built-in.a
  AR      sound/pci/ymfpci/built-in.a
  AR      sound/pci/vx222/built-in.a
  AR      sound/pci/built-in.a
  CC      crypto/cryptd.o
  CC      crypto/des_generic.o
  CC      fs/fat/namei_vfat.o
  CC      kernel/cgroup/pids.o
  CC      crypto/aes_generic.o
  CC      crypto/crc32c_generic.o
  CC      lib/zstd/decompress/zstd_decompress_block.o
  CC      mm/list_lru.o
  CC      drivers/acpi/acpica/exmutex.o
  CC      fs/ext4/indirect.o
  CC [M]  net/netfilter/ipvs/ip_vs_rr.o
  CC      fs/nfs/direct.o
  CC      net/bridge/br_netlink.o
  CC      block/bsg.o
  CC      fs/fat/namei_msdos.o
  CC      net/ethtool/tsinfo.o
  CC      fs/proc/kcore.o
  CC [M]  sound/hda/hdac_bus.o
  CC [M]  arch/x86/kvm/mmu/mmu.o
  CC      fs/nfs/pagelist.o
  CC [M]  drivers/video/fbdev/core/fb_io_fops.o
  CC      crypto/crct10dif_common.o
  CC      kernel/trace/trace_printk.o
  CC      fs/proc/kmsg.o
  CC      lib/zstd/zstd_common_module.o
  CC      lib/zstd/common/debug.o
  CC      drivers/pci/quirks.o
  CC      mm/workingset.o
  CC      kernel/trace/pid_list.o
  CC      net/core/flow_offload.o
  CC      kernel/cgroup/cpuset.o
  CC      fs/proc/page.o
  CC      net/core/gro.o
  CC      net/core/netdev-genl.o
  CC      drivers/acpi/acpica/exnames.o
  CC      mm/debug.o
  CC      net/bridge/br_netlink_tunnel.o
  CC      fs/lockd/svcshare.o
  CC      net/ethtool/cabletest.o
  CC      kernel/time/jiffies.o
  CC      crypto/crct10dif_generic.o
  CC      net/bridge/br_arp_nd_proxy.o
  CC      crypto/authenc.o
  CC      block/bsg-lib.o
  CC [M]  drivers/video/fbdev/core/sysfillrect.o
  CC      arch/x86/kernel/irq_64.o
  CC      net/bridge/br_sysfs_if.o
  CC      arch/x86/kernel/dumpstack_64.o
  CC      net/ipv6/ipv6_sockglue.o
  CC      drivers/acpi/acpica/exoparg1.o
  CC [M]  sound/hda/hdac_device.o
  CC [M]  sound/hda/hdac_sysfs.o
  AR      fs/fat/built-in.a
  CC      kernel/trace/trace_sched_switch.o
  CC [M]  drivers/video/fbdev/core/syscopyarea.o
  CC      net/ethtool/tunnels.o
  CC      kernel/events/core.o
  CC      kernel/fork.o
  LD [M]  net/netfilter/ipvs/ip_vs.o
  CC      kernel/bpf/core.o
  CC      mm/gup.o
  CC      kernel/time/timer_list.o
  CC [M]  arch/x86/kvm/mmu/page_track.o
  CC      lib/cpumask.o
  CC [M]  arch/x86/kvm/mmu/spte.o
  CC      kernel/exec_domain.o
  CC      net/netfilter/utils.o
  CC      drivers/acpi/acpica/exoparg2.o
  CC      mm/mmap_lock.o
  CC      mm/highmem.o
  AR      fs/proc/built-in.a
  CC      net/ipv6/ndisc.o
  CC      net/ipv4/ip_sockglue.o
  CC      arch/x86/kernel/time.o
  AR      sound/virtio/built-in.a
  CC      kernel/panic.o
  CC [M]  arch/x86/kvm/mmu/tdp_iter.o
  CC      drivers/acpi/acpica/exoparg3.o
  CC      fs/nfs/read.o
  CC      sound/sound_core.o
  CC      fs/lockd/svcproc.o
  CC      fs/ext4/inline.o
  CC      block/blk-cgroup.o
  CC      drivers/dma/dw/core.o
  CC      fs/lockd/svcsubs.o
  CC      drivers/dma/hsu/hsu.o
  CC      crypto/authencesn.o
  AR      drivers/dma/idxd/built-in.a
  CC      net/bridge/br_sysfs_br.o
  CC [M]  sound/hda/hdac_regmap.o
  AR      drivers/dma/mediatek/built-in.a
  AR      drivers/dma/qcom/built-in.a
  CC [M]  sound/hda/hdac_controller.o
  CC      drivers/acpi/acpica/exoparg6.o
  CC [M]  drivers/video/fbdev/core/sysimgblt.o
  AR      net/xfrm/built-in.a
  CC      fs/ext4/inode.o
  CC      drivers/dma/dw/dw.o
  CC      lib/ctype.o
  CC      kernel/time/timeconv.o
  CC      crypto/lzo.o
  CC      crypto/lzo-rle.o
  CC      arch/x86/kernel/ioport.o
  CC      crypto/lz4.o
  AR      drivers/soc/apple/built-in.a
  AR      drivers/soc/aspeed/built-in.a
  AR      drivers/pmdomain/actions/built-in.a
  CC      crypto/lz4hc.o
  AR      drivers/soc/bcm/built-in.a
  AR      drivers/pmdomain/amlogic/built-in.a
  AR      drivers/pmdomain/apple/built-in.a
  AR      drivers/soc/fsl/built-in.a
  AR      drivers/pmdomain/arm/built-in.a
  AR      drivers/soc/fujitsu/built-in.a
  AR      drivers/pmdomain/bcm/built-in.a
  AR      drivers/pmdomain/imx/built-in.a
  AR      drivers/soc/hisilicon/built-in.a
  CC      drivers/virtio/virtio.o
  AR      drivers/pmdomain/mediatek/built-in.a
  AR      drivers/pmdomain/qcom/built-in.a
  AR      drivers/soc/imx/built-in.a
  CC      drivers/tty/vt/vt_ioctl.o
  CC      drivers/tty/hvc/hvc_console.o
  CC      drivers/tty/vt/vc_screen.o
  CC      net/core/netdev-genl-gen.o
  AR      drivers/pmdomain/renesas/built-in.a
  AR      drivers/soc/ixp4xx/built-in.a
  AR      drivers/pmdomain/rockchip/built-in.a
  AR      drivers/soc/loongson/built-in.a
  AR      drivers/pmdomain/samsung/built-in.a
  AR      drivers/soc/mediatek/built-in.a
  AR      drivers/pmdomain/st/built-in.a
  AR      drivers/soc/microchip/built-in.a
  AR      drivers/soc/nuvoton/built-in.a
  AR      drivers/pmdomain/starfive/built-in.a
  AR      drivers/soc/pxa/built-in.a
  AR      drivers/soc/amlogic/built-in.a
  AR      drivers/pmdomain/sunxi/built-in.a
  AR      drivers/soc/qcom/built-in.a
  AR      drivers/pmdomain/tegra/built-in.a
  CC      drivers/tty/serial/8250/8250_core.o
  AR      drivers/soc/renesas/built-in.a
  AR      drivers/pmdomain/ti/built-in.a
  AR      drivers/soc/rockchip/built-in.a
  AR      drivers/pmdomain/xilinx/built-in.a
  AR      drivers/pmdomain/built-in.a
  AR      drivers/soc/sifive/built-in.a
  AR      drivers/soc/sunxi/built-in.a
  CC      net/ethtool/fec.o
  AR      drivers/soc/ti/built-in.a
  CC [M]  drivers/video/fbdev/core/fb_sys_fops.o
  AR      drivers/soc/xilinx/built-in.a
  AR      drivers/soc/built-in.a
  CC      drivers/acpi/acpica/exprep.o
  CC      drivers/virtio/virtio_ring.o
  CC      drivers/acpi/acpica/exregion.o
  CC [M]  sound/hda/hdac_stream.o
  CC      drivers/acpi/acpica/exresnte.o
  CC      fs/nfs/symlink.o
  CC      kernel/time/timecounter.o
  CC [M]  net/netfilter/nfnetlink.o
  CC      kernel/time/alarmtimer.o
  CC      sound/last.o
  CC      crypto/xxhash_generic.o
  CC      kernel/time/posix-timers.o
  CC      crypto/rng.o
  CC      drivers/pci/ats.o
  CC      net/ipv6/udp.o
  CC      fs/nfs/unlink.o
  AR      drivers/dma/hsu/built-in.a
  CC      kernel/trace/trace_functions.o
  CC      drivers/char/hw_random/core.o
  CC      arch/x86/kernel/dumpstack.o
  CC      drivers/char/agp/backend.o
  CC      drivers/char/tpm/tpm-chip.o
  CC      drivers/char/hw_random/intel-rng.o
  CC      drivers/char/mem.o
  CC      lib/zstd/common/entropy_common.o
  CC      net/core/gso.o
  CC      lib/zstd/common/error_private.o
  CC      drivers/acpi/acpica/exresolv.o
  CC      drivers/acpi/acpica/exresop.o
  CC      fs/lockd/mon.o
  AR      drivers/tty/ipwireless/built-in.a
  CC      drivers/tty/tty_io.o
  CC      drivers/char/random.o
  CC      drivers/dma/dw/idma32.o
  CC      drivers/char/agp/generic.o
  CC      lib/zstd/common/fse_decompress.o
  CC      net/ipv6/udplite.o
  AR      drivers/tty/hvc/built-in.a
  CC      drivers/tty/n_tty.o
  CC      drivers/tty/serial/8250/8250_pnp.o
  CC      net/ipv6/raw.o
  LD [M]  drivers/video/fbdev/core/fb.o
  CC      net/bridge/br_nf_core.o
  AR      drivers/video/fbdev/core/built-in.a
  AR      drivers/video/fbdev/built-in.a
  AR      drivers/video/built-in.a
  CC      drivers/tty/vt/selection.o
  CC      kernel/cpu.o
  CC      fs/nfs/write.o
  CC      drivers/char/misc.o
  CC      drivers/pci/iov.o
  CC      net/ethtool/eeprom.o
  CC      drivers/acpi/acpica/exserial.o
  CC [M]  sound/hda/array.o
  CC      kernel/exit.o
  CC      crypto/drbg.o
  CC      drivers/char/virtio_console.o
  AR      kernel/cgroup/built-in.a
  CC      kernel/softirq.o
  CC      lib/zstd/common/zstd_common.o
  CC      fs/nfs/namespace.o
  CC      drivers/char/agp/isoch.o
  CC      arch/x86/kernel/nmi.o
  AR      drivers/char/hw_random/built-in.a
  CC      net/ipv4/inet_hashtables.o
  CC      arch/x86/kernel/ldt.o
  CC      drivers/char/hpet.o
  CC      drivers/char/tpm/tpm-dev-common.o
  CC      drivers/dma/dw/acpi.o
  CC      kernel/time/posix-cpu-timers.o
  CC      kernel/trace/trace_preemptirq.o
  CC      mm/memory.o
  CC      drivers/char/nvram.o
  CC      block/blk-cgroup-rwstat.o
  CC      drivers/virtio/virtio_anchor.o
  AR      kernel/bpf/built-in.a
  CC      drivers/tty/vt/keyboard.o
  CC      drivers/tty/serial/8250/8250_port.o
  CC      drivers/acpi/acpica/exstore.o
  AR      lib/zstd/built-in.a
  CC [M]  net/netfilter/nf_conntrack_core.o
  CC      lib/dec_and_lock.o
  AR      drivers/iommu/amd/built-in.a
  CC      drivers/iommu/intel/dmar.o
  CC      net/core/net-sysfs.o
  CC [M]  sound/hda/hdmi_chmap.o
  CC      drivers/iommu/intel/iommu.o
  CC      fs/lockd/trace.o
  CC      drivers/iommu/intel/pasid.o
  CC      drivers/char/tpm/tpm-dev.o
  CC      kernel/trace/trace_nop.o
  CC      lib/decompress.o
  CC      net/ipv6/icmp.o
  CC [M]  sound/hda/trace.o
  CC      net/bridge/br_multicast.o
  CC      lib/decompress_bunzip2.o
  AR      drivers/gpu/host1x/built-in.a
  CC      drivers/char/agp/intel-agp.o
  AR      drivers/gpu/drm/tests/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_kunit_helpers.o
  CC      drivers/char/agp/intel-gtt.o
  CC      drivers/dma/dw/pci.o
  CC      drivers/acpi/acpica/exstoren.o
  CC      kernel/events/ring_buffer.o
  CC      net/ethtool/stats.o
  CC      drivers/virtio/virtio_pci_modern_dev.o
  CC      net/bridge/br_mdb.o
  CC [M]  net/netfilter/nf_conntrack_standalone.o
  CC      drivers/pci/pci-label.o
  CC      fs/nls/nls_base.o
  AR      fs/unicode/built-in.a
  CC      block/blk-throttle.o
  CC      fs/ntfs/aops.o
  AS      arch/x86/kernel/ibt_selftest.o
  AR      drivers/iommu/arm/arm-smmu/built-in.a
  AR      drivers/iommu/arm/arm-smmu-v3/built-in.a
  CC      arch/x86/kernel/setup.o
  AR      drivers/iommu/arm/built-in.a
  CC      fs/ntfs/attrib.o
  CC [M]  net/netfilter/nf_conntrack_expect.o
  CC      drivers/char/tpm/tpm-interface.o
  CC      drivers/tty/tty_ioctl.o
  CC      drivers/tty/tty_ldisc.o
  CC [M]  net/netfilter/nf_conntrack_helper.o
  CC      drivers/acpi/acpica/exstorob.o
  CC      kernel/trace/trace_functions_graph.o
  CC      crypto/jitterentropy.o
  CC      fs/ntfs/collate.o
  CC      kernel/time/posix-clock.o
  CC      crypto/jitterentropy-kcapi.o
  CC [M]  sound/hda/hdac_component.o
  AR      drivers/dma/dw/built-in.a
  AR      drivers/dma/ti/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_buddy_test.o
  CC      lib/decompress_inflate.o
  AR      drivers/dma/xilinx/built-in.a
  CC [M]  drivers/dma/ioat/init.o
  CC [M]  drivers/gpu/drm/tests/drm_cmdline_parser_test.o
  CC [M]  net/netfilter/nf_conntrack_proto.o
  CC      drivers/pci/pci-stub.o
  CC      net/bridge/br_multicast_eht.o
  CC      fs/lockd/xdr.o
  CC      crypto/ghash-generic.o
  CC      fs/nls/nls_cp437.o
  CC      drivers/virtio/virtio_pci_legacy_dev.o
  CC      drivers/acpi/acpica/exsystem.o
  CC      net/ipv6/mcast.o
  AR      drivers/char/agp/built-in.a
  CC      kernel/resource.o
  CC      drivers/tty/vt/consolemap.o
  HOSTCC  drivers/tty/vt/conmakehash
  CC      drivers/iommu/intel/nested.o
  CC      kernel/sysctl.o
  CC      lib/decompress_unlz4.o
  CC      fs/nls/nls_ascii.o
  CC      net/ethtool/phc_vclocks.o
  CC      drivers/tty/tty_buffer.o
  CC      fs/nls/nls_iso8859-1.o
  CC      drivers/char/tpm/tpm1-cmd.o
  CC      kernel/time/itimer.o
  CC      drivers/acpi/wakeup.o
  CC      arch/x86/kernel/x86_init.o
  CC      kernel/trace/fgraph.o
  CC      net/ethtool/mm.o
  CC [M]  sound/hda/hdac_i915.o
  CC      fs/ntfs/compress.o
  CC      kernel/capability.o
  CC      crypto/af_alg.o
  CC      drivers/acpi/acpica/extrace.o
  CC      net/ipv4/inet_timewait_sock.o
  CC      net/core/page_pool.o
  CC      drivers/tty/serial/8250/8250_dma.o
  CC      drivers/tty/serial/8250/8250_dwlib.o
  CC      fs/lockd/clnt4xdr.o
  CC      drivers/pci/vgaarb.o
  CC      crypto/algif_hash.o
  CC      drivers/virtio/virtio_pci_modern.o
  CC      arch/x86/kernel/i8259.o
  CC      fs/nfs/mount_clnt.o
  CC      kernel/trace/blktrace.o
  CC [M]  sound/hda/intel-dsp-config.o
  CC      lib/decompress_unlzma.o
  CC      fs/nls/nls_utf8.o
  CC      block/mq-deadline.o
  AR      drivers/gpu/drm/arm/built-in.a
  AR      drivers/gpu/drm/display/built-in.a
  CC [M]  drivers/dma/ioat/dma.o
  CC [M]  drivers/gpu/drm/display/drm_display_helper_mod.o
  CC      drivers/acpi/acpica/exutils.o
  CC [M]  net/netfilter/nf_conntrack_proto_generic.o
  CC [M]  drivers/gpu/drm/display/drm_dp_dual_mode_helper.o
  CC      drivers/iommu/intel/trace.o
  CC      kernel/time/clockevents.o
  CC      fs/ext4/ioctl.o
  CC      kernel/events/callchain.o
  CC      drivers/tty/vt/vt.o
  CC      drivers/acpi/sleep.o
  CC      fs/lockd/xdr4.o
  CC      net/bridge/br_vlan.o
  CC [M]  net/netfilter/nf_conntrack_proto_tcp.o
  CC      drivers/char/tpm/tpm2-cmd.o
  CC      net/bridge/br_vlan_tunnel.o
  CC      fs/lockd/svc4proc.o
  CC [M]  drivers/dma/ioat/prep.o
  CC      arch/x86/kernel/irqinit.o
  CC      drivers/tty/tty_port.o
  CC      drivers/acpi/device_sysfs.o
  CC      kernel/events/hw_breakpoint.o
  CC      drivers/tty/serial/8250/8250_pcilib.o
  CC [M]  fs/nls/nls_ucs2_utils.o
  CC      drivers/acpi/acpica/hwacpi.o
  CC      drivers/virtio/virtio_pci_common.o
  CC      drivers/virtio/virtio_pci_legacy.o
  CC [M]  arch/x86/kvm/mmu/tdp_mmu.o
  CC      drivers/tty/serial/8250/8250_early.o
  CC      net/ethtool/module.o
  CC      fs/ext4/mballoc.o
  CC [M]  drivers/gpu/drm/tests/drm_connector_test.o
  CC [M]  sound/hda/intel-nhlt.o
  CC      lib/decompress_unlzo.o
  CC      kernel/trace/trace_events.o
  CC      fs/ntfs/debug.o
  CC [M]  drivers/gpu/drm/tests/drm_damage_helper_test.o
  AR      drivers/pci/built-in.a
  CC      drivers/connector/cn_queue.o
  CC      drivers/base/power/sysfs.o
  CC      net/ipv4/inet_connection_sock.o
  CC      drivers/base/power/generic_ops.o
  CC      fs/nfs/nfstrace.o
  CC      drivers/acpi/acpica/hwesleep.o
  CC      drivers/base/firmware_loader/builtin/main.o
  CC      kernel/time/tick-common.o
  CC [M]  drivers/gpu/drm/display/drm_dp_helper.o
  CC      net/core/net-procfs.o
  AR      fs/nls/built-in.a
  CC      drivers/base/firmware_loader/main.o
  AR      fs/hostfs/built-in.a
  CC      fs/nfs/export.o
  AR      drivers/iommu/iommufd/built-in.a
  CC      drivers/iommu/intel/cap_audit.o
  CC      kernel/ptrace.o
  CC      net/ipv6/reassembly.o
  CC [M]  drivers/gpu/drm/tests/drm_dp_mst_helper_test.o
  CC      drivers/tty/serial/8250/8250_dw.o
  CC      drivers/base/regmap/regmap.o
  CC [M]  drivers/gpu/drm/tests/drm_exec_test.o
  CC      arch/x86/kernel/jump_label.o
  CC [M]  drivers/virtio/virtio_mem.o
  CC      crypto/algif_skcipher.o
  CC      lib/decompress_unxz.o
  CC      crypto/xor.o
  CC      fs/ntfs/dir.o
  CC      block/kyber-iosched.o
  AR      drivers/base/firmware_loader/builtin/built-in.a
  COPY    drivers/tty/vt/defkeymap.c
  CC      fs/debugfs/inode.o
  CC      drivers/char/tpm/tpmrm-dev.o
  CC      drivers/tty/serial/8250/8250_exar.o
  CC      drivers/tty/serial/serial_core.o
  CC [M]  sound/hda/intel-sdw-acpi.o
  CC      drivers/acpi/acpica/hwgpe.o
  CC      fs/debugfs/file.o
  CC [M]  drivers/dma/ioat/dca.o
  CC      fs/lockd/procfs.o
  CC      net/ethtool/pse-pd.o
  CC      drivers/base/power/common.o
  CC      drivers/base/power/qos.o
  CC      lib/decompress_unzstd.o
  CC      kernel/events/uprobes.o
  CC      arch/x86/kernel/irq_work.o
  CC      fs/ntfs/file.o
  CC      drivers/connector/connector.o
  CONMK   drivers/tty/vt/consolemap_deftbl.c
  CC [M]  net/netfilter/nf_conntrack_proto_udp.o
  CC      crypto/hash_info.o
  CC [M]  net/netfilter/nf_conntrack_proto_icmp.o
  CC      kernel/time/tick-broadcast.o
  CC      net/core/netpoll.o
  CC      kernel/time/tick-broadcast-hrtimer.o
  CC      drivers/acpi/acpica/hwregs.o
  CC      kernel/user.o
  CC      drivers/char/tpm/tpm2-space.o
  LD [M]  sound/hda/snd-hda-core.o
  AR      drivers/base/test/built-in.a
  CC      drivers/base/component.o
  LD [M]  sound/hda/snd-intel-dspcfg.o
  LD [M]  sound/hda/snd-intel-sdw-acpi.o
  CC      fs/tracefs/inode.o
  CC [M]  drivers/gpu/drm/tests/drm_format_helper_test.o
  AR      sound/built-in.a
  AR      drivers/base/firmware_loader/built-in.a
  CC      drivers/iommu/intel/irq_remapping.o
  CC      fs/pstore/inode.o
  CC      drivers/base/power/runtime.o
  CC      drivers/iommu/intel/perfmon.o
  CC [M]  drivers/dma/ioat/sysfs.o
  AR      fs/lockd/built-in.a
  CC      fs/pstore/platform.o
  CC      mm/mincore.o
  CC      drivers/dma/dmaengine.o
  CC      drivers/tty/serial/8250/8250_lpss.o
  CC      drivers/base/core.o
  CC      fs/btrfs/super.o
  CC      lib/dump_stack.o
  CC      crypto/simd.o
  CC      drivers/acpi/acpica/hwsleep.o
  CC      net/bridge/br_vlan_options.o
  CC      kernel/time/tick-oneshot.o
  AR      fs/debugfs/built-in.a
  CC      kernel/time/tick-sched.o
  CC      fs/ntfs/index.o
  CC      net/ipv6/tcp_ipv6.o
  CC      net/ethtool/plca.o
  CC      net/ipv6/ping.o
  CC      mm/mlock.o
  CC      fs/pstore/pmsg.o
  CC      net/ipv6/exthdrs.o
  CC      arch/x86/kernel/probe_roms.o
  CC      drivers/base/power/wakeirq.o
  CC [M]  arch/x86/kvm/smm.o
  CC      drivers/tty/vt/defkeymap.o
  CC      fs/tracefs/event_inode.o
  CC      drivers/acpi/acpica/hwvalid.o
  CC      block/bfq-iosched.o
  CC [M]  drivers/gpu/drm/display/drm_dp_mst_topology.o
  CC [M]  net/sunrpc/auth_gss/auth_gss.o
  CC [M]  drivers/gpu/drm/display/drm_dsc_helper.o
  CC      drivers/char/tpm/tpm-sysfs.o
  LD [M]  drivers/dma/ioat/ioatdma.o
  CC      drivers/char/tpm/eventlog/common.o
  CC      lib/earlycpio.o
  CC      lib/extable.o
  CC      drivers/char/tpm/eventlog/tpm1.o
  CC      drivers/tty/vt/consolemap_deftbl.o
  CC      drivers/connector/cn_proc.o
  AR      drivers/tty/vt/built-in.a
  CC [M]  net/sunrpc/auth_gss/gss_generic_token.o
  CC [M]  drivers/gpu/drm/display/drm_hdcp_helper.o
  CC      drivers/tty/serial/8250/8250_mid.o
  CC      kernel/trace/trace_export.o
  CC [M]  crypto/md4.o
  CC      drivers/tty/serial/8250/8250_pci.o
  CC      kernel/time/vsyscall.o
  AR      drivers/virtio/built-in.a
  CC      block/bfq-wf2q.o
  CC      lib/flex_proportions.o
  CC      net/ipv4/tcp.o
  CC      mm/mmap.o
  CC [M]  net/netfilter/nf_conntrack_extend.o
  AR      fs/pstore/built-in.a
  CC      drivers/acpi/acpica/hwxface.o
  CC      fs/ntfs/inode.o
  CC [M]  net/netfilter/nf_conntrack_acct.o
  CC      net/bridge/br_mst.o
  CC [M]  drivers/gpu/drm/tests/drm_format_test.o
  CC      arch/x86/kernel/sys_ia32.o
  CC      drivers/base/power/main.o
  CC [M]  drivers/gpu/drm/tests/drm_framebuffer_test.o
  CC      drivers/tty/serial/serial_base_bus.o
  CC      net/ipv6/datagram.o
  AR      drivers/iommu/intel/built-in.a
  CC      drivers/iommu/iommu.o
  CC      net/sunrpc/clnt.o
  CC      lib/idr.o
  CC      kernel/time/timekeeping_debug.o
  AR      net/ethtool/built-in.a
  CC [M]  net/netfilter/nf_conntrack_seqadj.o
  CC      net/core/fib_rules.o
  CC      drivers/dma/virt-dma.o
  CC      drivers/tty/serial/8250/8250_pericom.o
  AR      kernel/events/built-in.a
  CC      drivers/acpi/acpica/hwxfsleep.o
  CC      lib/irq_regs.o
  CC      net/sunrpc/xprt.o
  CC      net/ipv6/ip6_flowlabel.o
  CC [M]  net/sunrpc/auth_gss/gss_mech_switch.o
  AR      fs/tracefs/built-in.a
  CC      drivers/char/tpm/eventlog/tpm2.o
  CC [M]  net/sunrpc/auth_gss/svcauth_gss.o
  CC [M]  net/sunrpc/auth_gss/gss_rpc_upcall.o
  CC      kernel/trace/trace_event_perf.o
  CC [M]  crypto/ccm.o
  CC [M]  net/netfilter/nf_conntrack_proto_icmpv6.o
  CC      net/8021q/vlan_core.o
  CC      drivers/base/power/wakeup.o
  CC      block/bfq-cgroup.o
  CC [M]  arch/x86/kvm/vmx/vmx.o
  CC      drivers/base/regmap/regcache.o
  CC [M]  drivers/gpu/drm/tests/drm_gem_shmem_test.o
  CC      drivers/tty/serial/serial_ctrl.o
  CC      drivers/acpi/acpica/hwpci.o
  CC [M]  drivers/gpu/drm/tests/drm_managed_test.o
  CC      lib/is_single_threaded.o
  AR      drivers/connector/built-in.a
  CC      drivers/block/loop.o
  CC [M]  net/netfilter/nf_conntrack_proto_dccp.o
  CC      mm/mmu_gather.o
  CC      kernel/time/namespace.o
  CC      arch/x86/kernel/signal_32.o
  CC [M]  crypto/arc4.o
  CC      lib/klist.o
  CC      drivers/dma/acpi-dma.o
  CC      block/blk-mq-pci.o
  AR      drivers/tty/serial/8250/built-in.a
  CC      block/blk-mq-virtio.o
  CC [M]  net/bridge/br_netfilter_hooks.o
  CC      drivers/char/tpm/tpm_ppi.o
  CC      lib/kobject.o
  CC      drivers/acpi/acpica/nsaccess.o
  CC      net/dcb/dcbnl.o
  CC      kernel/trace/trace_events_filter.o
  CC      fs/ntfs/mft.o
  CC      net/dcb/dcbevent.o
  CC      block/blk-mq-debugfs.o
  CC      drivers/tty/serial/serial_port.o
  CC      lib/kobject_uevent.o
  CC      fs/efivarfs/inode.o
  CC [M]  net/netfilter/nf_conntrack_proto_sctp.o
  CC [M]  crypto/ecc.o
  CC      drivers/base/regmap/regcache-rbtree.o
  CC      fs/efivarfs/file.o
  CC [M]  drivers/gpu/drm/tests/drm_mm_test.o
  AR      drivers/misc/eeprom/built-in.a
  CC      arch/x86/kernel/sys_x86_64.o
  AR      drivers/misc/cb710/built-in.a
  AR      drivers/misc/ti-st/built-in.a
  AR      drivers/misc/lis3lv02d/built-in.a
  AR      drivers/misc/cardreader/built-in.a
  AR      kernel/time/built-in.a
  CC [M]  drivers/misc/mei/hdcp/mei_hdcp.o
  CC      arch/x86/kernel/espfix_64.o
  CC      fs/btrfs/ctree.o
  CC      drivers/iommu/iommu-traces.o
  CC [M]  fs/netfs/buffered_read.o
  CC      drivers/iommu/iommu-sysfs.o
  CC [M]  fs/netfs/io.o
  CC [M]  net/bridge/br_netfilter_ipv6.o
  CC      fs/nfs/sysfs.o
  CC      drivers/acpi/acpica/nsalloc.o
  CC      drivers/acpi/acpica/nsarguments.o
  CC [M]  net/8021q/vlan.o
  CC      net/ipv6/inet6_connection_sock.o
  AR      drivers/dma/built-in.a
  CC      kernel/trace/trace_events_trigger.o
  CC      mm/mprotect.o
  CC      net/core/net-traces.o
  CC      net/ipv4/tcp_input.o
  CC      drivers/char/tpm/eventlog/acpi.o
  CC      drivers/base/power/wakeup_stats.o
  CC      lib/logic_pio.o
  CC      drivers/tty/serial/earlycon.o
  CC      fs/ext4/migrate.o
  CC      kernel/trace/trace_eprobe.o
  CC      drivers/base/regmap/regcache-flat.o
  CC      fs/nfs/fs_context.o
  CC      mm/mremap.o
  CC      fs/ntfs/mst.o
  CC      fs/efivarfs/super.o
  CC [M]  drivers/gpu/drm/tests/drm_modes_test.o
  CC [M]  drivers/gpu/drm/tests/drm_plane_helper_test.o
  CC      drivers/acpi/acpica/nsconvert.o
  CC      fs/ext4/mmp.o
  CC      fs/btrfs/extent-tree.o
  CC      block/blk-pm.o
  CC      drivers/iommu/dma-iommu.o
  CC      arch/x86/kernel/ksysfs.o
  CC [M]  net/sunrpc/auth_gss/gss_rpc_xdr.o
  CC      lib/maple_tree.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_helper.o
  CC      drivers/base/power/domain.o
  CC [M]  drivers/misc/mei/pxp/mei_pxp.o
  CC      drivers/base/power/domain_governor.o
  CC [M]  drivers/block/nbd.o
  CC      drivers/char/tpm/eventlog/efi.o
  CC      drivers/base/power/clock_ops.o
  CC      drivers/base/regmap/regcache-maple.o
  CC      drivers/base/regmap/regmap-debugfs.o
  CC      kernel/trace/trace_kprobe.o
  CC      drivers/tty/serial/serial_mctrl_gpio.o
  CC      net/ipv6/udp_offload.o
  CC [M]  fs/netfs/iterator.o
  CC      drivers/acpi/acpica/nsdump.o
  CC [M]  net/netfilter/nf_conntrack_netlink.o
  CC      fs/ntfs/namei.o
  CC [M]  fs/netfs/main.o
  CC      fs/nfs/sysctl.o
  CC [M]  net/8021q/vlan_dev.o
  CC      net/ipv6/seg6.o
  CC      fs/efivarfs/vars.o
  CC [M]  drivers/gpu/drm/tests/drm_probe_helper_test.o
  CC [M]  fs/netfs/objects.o
  CC      fs/ext4/move_extent.o
  CC      block/holder.o
  CC      drivers/char/tpm/tpm_crb.o
  CC      fs/nfs/nfs2super.o
  CC      arch/x86/kernel/bootflag.o
  CC      arch/x86/kernel/e820.o
  CC      drivers/acpi/acpica/nseval.o
  CC      drivers/iommu/iova.o
  CC      lib/memcat_p.o
  AR      net/dcb/built-in.a
  CC [M]  net/sunrpc/auth_gss/trace.o
  CC [M]  drivers/gpu/drm/display/drm_scdc_helper.o
  AR      drivers/gpu/vga/built-in.a
  CC [M]  crypto/essiv.o
  CC      kernel/trace/error_report-traces.o
  CC [M]  drivers/misc/mei/init.o
  CC      net/l3mdev/l3mdev.o
  CC      net/handshake/alert.o
  CC      net/ipv4/tcp_output.o
  CC      drivers/base/regmap/regmap-i2c.o
  CC      net/core/selftests.o
  AR      net/bridge/built-in.a
  CC [M]  net/bluetooth/af_bluetooth.o
  LD [M]  net/bridge/br_netfilter.o
  CC      mm/msync.o
  CC [M]  net/dns_resolver/dns_key.o
  CC      fs/ntfs/runlist.o
  CC      fs/ntfs/super.o
  AR      drivers/tty/serial/built-in.a
  CC [M]  net/dns_resolver/dns_query.o
  CC      drivers/tty/tty_mutex.o
  CC      lib/nmi_backtrace.o
  CC      drivers/acpi/acpica/nsinit.o
  CC      kernel/trace/power-traces.o
  CC [M]  drivers/gpu/drm/tests/drm_rect_test.o
  CC      net/handshake/genl.o
  AR      fs/efivarfs/built-in.a
  CC      fs/ext4/namei.o
  AR      block/built-in.a
  CC      drivers/iommu/irq_remapping.o
  CC      net/handshake/netlink.o
  CC [M]  net/bluetooth/hci_core.o
  LD [M]  fs/netfs/netfs.o
  CC      kernel/signal.o
  CC      drivers/base/regmap/regmap-irq.o
  CC      mm/page_vma_mapped.o
  AR      drivers/char/tpm/built-in.a
  AR      drivers/char/built-in.a
  CC [M]  fs/fscache/cache.o
  CC [M]  fs/fscache/cookie.o
  CC      drivers/mfd/mfd-core.o
  CC [M]  drivers/misc/mei/hbm.o
  CC [M]  fs/fscache/io.o
  CC      net/ipv6/fib6_notifier.o
  CC [M]  drivers/gpu/drm/display/drm_dp_aux_dev.o
  CC      drivers/mfd/intel-lpss.o
  CC      drivers/mfd/intel-lpss-pci.o
  CC [M]  net/8021q/vlan_netlink.o
  CC      drivers/acpi/acpica/nsload.o
  CC      drivers/tty/tty_ldsem.o
  CC [M]  crypto/ecdh.o
  AR      drivers/base/power/built-in.a
  CC      fs/nfs/proc.o
  CC [M]  crypto/ecdh_helper.o
  CC      drivers/mfd/intel-lpss-acpi.o
  AR      net/l3mdev/built-in.a
  LD [M]  net/dns_resolver/dns_resolver.o
  CC      kernel/trace/rpm-traces.o
  CC      arch/x86/kernel/pci-dma.o
  CC      net/devres.o
  CC      lib/objpool.o
  CC      drivers/base/bus.o
  CC      net/handshake/request.o
  AR      drivers/iommu/built-in.a
  CC      drivers/acpi/acpica/nsnames.o
  CC      fs/ntfs/sysctl.o
  CC      drivers/base/dd.o
  CC      kernel/trace/trace_dynevent.o
  CC      drivers/acpi/acpica/nsobject.o
  CC      kernel/trace/trace_probe.o
  CC      fs/btrfs/print-tree.o
  AR      drivers/nfc/built-in.a
  CC      net/handshake/tlshd.o
  CC [M]  fs/fscache/main.o
  CC      net/core/ptp_classifier.o
  CC      drivers/acpi/acpica/nsparse.o
  CC      fs/btrfs/root-tree.o
  AR      drivers/gpu/drm/renesas/rcar-du/built-in.a
  CC      drivers/mfd/intel_soc_pmic_crc.o
  AR      drivers/gpu/drm/renesas/built-in.a
  CC [M]  net/bluetooth/hci_conn.o
  CC      fs/ntfs/unistr.o
  AR      drivers/gpu/drm/omapdrm/built-in.a
  CC [M]  net/bluetooth/hci_event.o
  CC [M]  net/bluetooth/mgmt.o
  LD [M]  crypto/ecdh_generic.o
  AR      drivers/misc/built-in.a
  CC      drivers/tty/tty_baudrate.o
  AR      crypto/built-in.a
  CC      net/socket.o
  CC      net/compat.o
  CC      drivers/tty/tty_jobctrl.o
  CC      mm/pagewalk.o
  CC      arch/x86/kernel/quirks.o
  CC      net/ipv6/rpl.o
  AR      drivers/gpu/drm/tilcdc/built-in.a
  CC      drivers/acpi/acpica/nspredef.o
  AR      drivers/gpu/drm/imx/built-in.a
  CC [M]  net/8021q/vlanproc.o
  LD [M]  drivers/gpu/drm/display/drm_display_helper.o
  AR      drivers/gpu/drm/i2c/built-in.a
  AR      drivers/base/regmap/built-in.a
  CC      drivers/tty/n_null.o
  CC      fs/btrfs/dir-item.o
  CC      drivers/tty/pty.o
  CC      fs/btrfs/file-item.o
  AR      drivers/gpu/drm/panel/built-in.a
  AR      drivers/gpu/drm/hisilicon/built-in.a
  AR      drivers/gpu/drm/bridge/analogix/built-in.a
  CC [M]  drivers/misc/mei/interrupt.o
  CC      net/handshake/trace.o
  AR      drivers/gpu/drm/bridge/cadence/built-in.a
  AR      drivers/gpu/drm/bridge/imx/built-in.a
  AR      drivers/gpu/drm/bridge/synopsys/built-in.a
  AR      drivers/gpu/drm/bridge/built-in.a
  AR      drivers/gpu/drm/mxsfb/built-in.a
  CC [M]  net/netfilter/nf_nat_core.o
  CC      fs/nfs/nfs2xdr.o
  AR      drivers/gpu/drm/tiny/built-in.a
  AR      drivers/block/built-in.a
  AR      drivers/gpu/drm/xlnx/built-in.a
  CC [M]  drivers/misc/mei/client.o
  AR      drivers/gpu/drm/gud/built-in.a
  CC      net/ipv6/ioam6.o
  AR      drivers/gpu/drm/solomon/built-in.a
  AR      drivers/dax/hmem/built-in.a
  CC      drivers/dax/super.o
  CC [M]  drivers/gpu/drm/ttm/ttm_tt.o
  CC      drivers/base/syscore.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_mech.o
  CC      mm/pgtable-generic.o
  CC [M]  net/bluetooth/hci_sock.o
  CC      kernel/trace/trace_uprobe.o
  CC      drivers/acpi/acpica/nsprepkg.o
  CC      drivers/base/driver.o
  CC      fs/ntfs/upcase.o
  CC      fs/nfs/nfs3super.o
  CC [M]  drivers/gpu/drm/ttm/ttm_bo.o
  CC [M]  drivers/mfd/lpc_sch.o
  CC      drivers/tty/sysrq.o
  CC [M]  net/netfilter/nf_nat_proto.o
  CC      net/core/netprio_cgroup.o
  CC      arch/x86/kernel/topology.o
  CC      arch/x86/kernel/kdebugfs.o
  CC      drivers/acpi/acpica/nsrepair.o
  CC      drivers/base/class.o
  AR      net/8021q/built-in.a
  LD [M]  net/8021q/8021q.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_seal.o
  CC      net/sysctl_net.o
  CC [M]  fs/fscache/volume.o
  CC      fs/ext4/page-io.o
  CC      fs/nfs/nfs3client.o
  CC [M]  net/netfilter/nf_nat_helper.o
  CC      drivers/dax/bus.o
  CC      arch/x86/kernel/alternative.o
  CC [M]  drivers/mfd/lpc_ich.o
  CC [M]  arch/x86/kvm/kvm-asm-offsets.s
  CC [M]  drivers/gpu/drm/scheduler/sched_main.o
  AR      fs/ntfs/built-in.a
  CC [M]  net/bluetooth/hci_sysfs.o
  CC [M]  arch/x86/kvm/vmx/pmu_intel.o
  CC      kernel/trace/rethook.o
  CC [M]  drivers/gpu/drm/ttm/ttm_bo_util.o
  CC [M]  net/netfilter/nf_nat_redirect.o
  CC [M]  drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.o
  CC [M]  drivers/gpu/drm/scheduler/sched_fence.o
  CC [M]  drivers/gpu/drm/scheduler/sched_entity.o
  CC      mm/rmap.o
  CC [M]  net/bluetooth/l2cap_core.o
  CC      drivers/acpi/acpica/nsrepair2.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o
  CC      arch/x86/kernel/i8253.o
  AR      net/handshake/built-in.a
  CC      net/core/dst_cache.o
  CC      drivers/acpi/acpica/nssearch.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_unseal.o
  CC      net/core/gro_cells.o
  AR      drivers/tty/built-in.a
  CC      drivers/base/platform.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_wrap.o
  CC      fs/nfs/nfs3proc.o
  CC      fs/ext4/readpage.o
  LD [M]  drivers/gpu/drm/amd/amdxcp/amdxcp.o
  CC [M]  net/netfilter/nf_nat_masquerade.o
  CC      fs/btrfs/inode-item.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_device.o
  CC      drivers/base/cpu.o
  CC      drivers/dma-buf/dma-buf.o
  CC      fs/btrfs/disk-io.o
  AR      drivers/mfd/built-in.a
  CC [M]  net/bluetooth/l2cap_sock.o
  CC [M]  net/bluetooth/smp.o
  CC [M]  net/bluetooth/lib.o
  CC [M]  fs/fscache/proc.o
  CC      drivers/dma-buf/dma-fence.o
  CC      net/ipv4/tcp_timer.o
  CC      drivers/dma-buf/dma-fence-array.o
  CC      drivers/acpi/acpica/nsutils.o
  CC [M]  drivers/misc/mei/main.o
  CC      net/ipv6/sysctl_net_ipv6.o
  CC      drivers/acpi/acpica/nswalk.o
  CC [M]  drivers/gpu/drm/i915/i915_config.o
  CC [M]  drivers/gpu/drm/ttm/ttm_bo_vm.o
  CC      drivers/acpi/acpica/nsxfeval.o
  CC [M]  drivers/gpu/drm/i915/i915_driver.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_bo_test.o
  CC      fs/nfs/nfs3xdr.o
  CC [M]  drivers/gpu/drm/xe/xe_bb.o
  CC      net/ipv6/xfrm6_policy.o
  AR      drivers/dax/built-in.a
  AR      drivers/cxl/core/built-in.a
  AR      drivers/cxl/built-in.a
  CC [M]  drivers/gpu/drm/xe/tests/xe_dma_buf_test.o
  CC [M]  drivers/misc/mei/dma-ring.o
  CC [M]  net/netfilter/x_tables.o
  AR      kernel/trace/built-in.a
  CC [M]  net/sunrpc/auth_gss/gss_krb5_crypto.o
  CC      kernel/sys.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_keys.o
  CC [M]  net/bluetooth/ecdh_helper.o
  CC      arch/x86/kernel/hw_breakpoint.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_migrate_test.o
  CC      arch/x86/kernel/tsc.o
  CC      drivers/acpi/device_pm.o
  CC [M]  drivers/gpu/drm/ttm/ttm_module.o
  LD [M]  drivers/gpu/drm/scheduler/gpu-sched.o
  CC [M]  arch/x86/kvm/vmx/vmcs12.o
  CC [M]  drivers/gpu/drm/ttm/ttm_execbuf_util.o
  CC      net/ipv4/tcp_ipv4.o
  AR      net/core/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.o
  CC [M]  drivers/gpu/drm/i915/i915_drm_client.o
  CC      fs/btrfs/transaction.o
  CC      arch/x86/kernel/tsc_msr.o
  CC      drivers/acpi/acpica/nsxfname.o
  LD [M]  fs/fscache/fscache.o
  CC      kernel/umh.o
  CC [M]  net/bluetooth/hci_request.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.o
  CC      fs/ext4/resize.o
  CC      drivers/base/firmware.o
  CC [M]  fs/smb/common/cifs_arc4.o
  CC      lib/plist.o
  CC [M]  fs/smb/common/cifs_md4.o
  CC      drivers/dma-buf/dma-fence-chain.o
  CC [M]  drivers/gpu/drm/xe/xe_bo.o
  CC      lib/radix-tree.o
  CC      lib/ratelimit.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_mocs_test.o
  CC [M]  drivers/misc/mei/bus.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.o
  CC      fs/ext4/super.o
  CC      drivers/base/init.o
  CC [M]  drivers/misc/mei/bus-fixup.o
  CC [M]  drivers/gpu/drm/xe/xe_bo_evict.o
  CC [M]  drivers/gpu/drm/xe/xe_debugfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/atombios_crtc.o
  CC [M]  drivers/gpu/drm/xe/xe_devcoredump.o
  CC      drivers/acpi/acpica/nsxfobj.o
  CC      drivers/dma-buf/dma-fence-unwrap.o
  CC [M]  drivers/gpu/drm/xe/xe_device.o
  CC      drivers/acpi/acpica/psargs.o
  CC      kernel/workqueue.o
  CC [M]  drivers/gpu/drm/ttm/ttm_range_manager.o
  CC [M]  arch/x86/kvm/vmx/hyperv.o
  CC [M]  drivers/gpu/drm/ttm/ttm_resource.o
  CC      drivers/base/map.o
  LD [M]  net/sunrpc/auth_gss/auth_rpcgss.o
  CC      net/ipv6/xfrm6_state.o
  LD [M]  net/sunrpc/auth_gss/rpcsec_gss_krb5.o
  CC [M]  fs/smb/client/trace.o
  CC      net/sunrpc/socklib.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_pci_test.o
  CC      arch/x86/kernel/io_delay.o
  CC [M]  drivers/gpu/drm/ttm/ttm_pool.o
  CC      drivers/dma-buf/dma-resv.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.o
  CC      kernel/pid.o
  CC      net/ipv6/xfrm6_input.o
  CC [M]  net/bluetooth/mgmt_util.o
  CC      net/ipv6/xfrm6_output.o
  CC      net/ipv4/tcp_minisocks.o
  CC      net/ipv6/xfrm6_protocol.o
  CC      drivers/dma-buf/sync_file.o
  CC      drivers/acpi/acpica/psloop.o
  CC      mm/vmalloc.o
  CC [M]  drivers/gpu/drm/i915/i915_getparam.o
  CC [M]  drivers/misc/mei/debugfs.o
  CC      drivers/base/devres.o
  CC [M]  drivers/gpu/drm/ttm/ttm_device.o
  CC      arch/x86/kernel/rtc.o
  CC      kernel/task_work.o
  CC      drivers/acpi/acpica/psobject.o
  AR      fs/nfs/built-in.a
  CC      drivers/acpi/proc.o
  CC      net/ipv6/netfilter.o
  CC      lib/rbtree.o
  CC      drivers/acpi/acpica/psopcode.o
  CC [M]  drivers/misc/mei/mei-trace.o
  CC [M]  net/netfilter/xt_tcpudp.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_rtp_test.o
  CC [M]  drivers/gpu/drm/ttm/ttm_sys_manager.o
  CC      drivers/acpi/acpica/psopinfo.o
  CC [M]  drivers/gpu/drm/xe/xe_device_sysfs.o
  CC      drivers/dma-buf/sw_sync.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/atom.o
  CC [M]  arch/x86/kvm/vmx/nested.o
  CC [M]  drivers/gpu/drm/xe/xe_dma_buf.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_wa_test.o
  CC      net/ipv6/fib6_rules.o
  CC      lib/seq_buf.o
  CC      lib/siphash.o
  CC      lib/string.o
  CC [M]  net/bluetooth/mgmt_config.o
  CC      net/sunrpc/xprtsock.o
  CC      arch/x86/kernel/resource.o
  CC [M]  net/netfilter/xt_mark.o
  CC      drivers/dma-buf/sync_debug.o
  CC      fs/btrfs/inode.o
  CC [M]  drivers/gpu/drm/i915/i915_ioctl.o
  CC      kernel/extable.o
  CC [M]  drivers/gpu/drm/i915/i915_irq.o
  CC      drivers/acpi/acpica/psparse.o
  AS      arch/x86/kernel/irqflags.o
  CC      fs/btrfs/file.o
  CC [M]  drivers/gpu/drm/ttm/ttm_agp_backend.o
  CC      arch/x86/kernel/static_call.o
  CC      fs/btrfs/defrag.o
  CC [M]  net/netfilter/xt_nat.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.o
  CC      drivers/base/attribute_container.o
  CC      net/ipv6/proc.o
  CC [M]  fs/fuse/dev.o
  CC [M]  drivers/gpu/drm/i915/i915_mitigations.o
  CC      lib/timerqueue.o
  CC [M]  drivers/misc/mei/pci-me.o
  CC [M]  drivers/gpu/drm/i915/i915_module.o
  CC      kernel/params.o
  CC      fs/btrfs/extent_map.o
  CC [M]  net/netfilter/xt_REDIRECT.o
  CC      arch/x86/kernel/process.o
  CC [M]  fs/fuse/dir.o
  CC [M]  drivers/dma-buf/selftest.o
  CC [M]  net/bluetooth/hci_codec.o
  CC      lib/vsprintf.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.o
  CC      drivers/acpi/acpica/psscope.o
  CC      net/ipv4/tcp_cong.o
  CC [M]  drivers/gpu/drm/xe/xe_drm_client.o
  CC [M]  net/netfilter/xt_MASQUERADE.o
  CC      fs/btrfs/sysfs.o
  CC      lib/win_minmax.o
  CC [M]  net/bluetooth/eir.o
  CC      kernel/kthread.o
  CC      kernel/sys_ni.o
  CC      kernel/nsproxy.o
  LD [M]  drivers/gpu/drm/ttm/ttm.o
  CC [M]  net/netfilter/xt_addrtype.o
  CC [M]  drivers/gpu/drm/vgem/vgem_drv.o
  CC      net/ipv4/tcp_metrics.o
  CC      drivers/base/transport_class.o
  CC [M]  drivers/gpu/drm/vgem/vgem_fence.o
  CC [M]  net/bluetooth/hci_sync.o
  CC      kernel/notifier.o
  CC      lib/xarray.o
  CC      arch/x86/kernel/ptrace.o
  CC      drivers/acpi/acpica/pstree.o
  CC      lib/lockref.o
  CC [M]  drivers/misc/mei/hw-me.o
  CC [M]  drivers/dma-buf/st-dma-fence.o
  CC      lib/bcd.o
  CC [M]  net/netfilter/xt_conntrack.o
  CC [M]  drivers/gpu/drm/xe/xe_exec.o
  CC      lib/sort.o
  CC      kernel/ksysfs.o
  CC [M]  net/netfilter/xt_ipvs.o
  CC      lib/parser.o
  CC [M]  drivers/dma-buf/st-dma-fence-chain.o
  CC [M]  drivers/dma-buf/st-dma-fence-unwrap.o
  CC      drivers/base/topology.o
  CC      drivers/acpi/acpica/psutils.o
  CC [M]  net/bluetooth/coredump.o
  CC      net/ipv6/syncookies.o
  CC      net/ipv6/mip6.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_object.o
  CC [M]  drivers/gpu/drm/xe/xe_execlist.o
  LD [M]  drivers/gpu/drm/vgem/vgem.o
  CC [M]  fs/smb/client/cifsfs.o
  CC [M]  fs/smb/client/cifs_debug.o
  CC      drivers/acpi/acpica/pswalk.o
  CC [M]  fs/smb/client/connect.o
  CC [M]  drivers/gpu/drm/i915/i915_params.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.o
  CC      kernel/cred.o
  CC      kernel/reboot.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.o
  CC      net/ipv6/addrconf_core.o
  CC [M]  fs/smb/client/dir.o
  CC      kernel/async.o
  CC      net/ipv4/tcp_fastopen.o
  CC      drivers/acpi/acpica/psxface.o
  CC      kernel/range.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/object.o
  CC      kernel/smpboot.o
  CC [M]  fs/fuse/file.o
  CC      drivers/acpi/acpica/rsaddr.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/client.o
  CC      net/ipv4/tcp_rate.o
  CC      kernel/ucount.o
  CC      arch/x86/kernel/tls.o
  CC      kernel/regset.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/conn.o
  CC      kernel/ksyms_common.o
  CC      drivers/base/container.o
  CC [M]  drivers/gpu/drm/xe/xe_exec_queue.o
  CC      drivers/acpi/acpica/rscalc.o
  CC [M]  drivers/dma-buf/st-dma-resv.o
  CC [M]  drivers/gpu/drm/xe/xe_force_wake.o
  CC      drivers/acpi/acpica/rscreate.o
  CC [M]  drivers/gpu/drm/ast/ast_drv.o
  CC      mm/page_alloc.o
  CC [M]  drivers/gpu/drm/xe/xe_ggtt.o
  LD [M]  net/netfilter/nf_conntrack.o
  CC      kernel/groups.o
  LD [M]  net/netfilter/nf_nat.o
  CC [M]  fs/fuse/inode.o
  AR      net/netfilter/built-in.a
  CC      fs/btrfs/accessors.o
  CC [M]  fs/fuse/control.o
  CC [M]  drivers/gpu/drm/i915/i915_pci.o
  CC      arch/x86/kernel/step.o
  CC      drivers/gpu/drm/drm_mipi_dsi.o
  CC      fs/ext4/symlink.o
  CC [M]  fs/overlayfs/super.o
  CC      drivers/base/property.o
  CC [M]  net/bluetooth/sco.o
  CC [M]  fs/overlayfs/namei.o
  CC [M]  net/bluetooth/iso.o
  CC [M]  fs/overlayfs/util.o
  CC [M]  drivers/gpu/drm/i915/i915_scatterlist.o
  CC      kernel/vhost_task.o
  CC [M]  drivers/misc/mei/gsc-me.o
  CC [M]  drivers/gpu/drm/ast/ast_i2c.o
  CC      mm/init-mm.o
  CC [M]  fs/smb/client/file.o
  CC [M]  drivers/gpu/drm/ast/ast_main.o
  CC      fs/btrfs/xattr.o
  CC      net/sunrpc/sched.o
  AR      drivers/dma-buf/built-in.a
  LD [M]  drivers/dma-buf/dmabuf_selftests.o
  CC [M]  net/bluetooth/a2mp.o
  CC      drivers/acpi/acpica/rsdumpinfo.o
  CC      drivers/acpi/acpica/rsinfo.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/device.o
  CC [M]  fs/overlayfs/inode.o
  CC      net/ipv6/exthdrs_core.o
  CC      lib/debug_locks.o
  CC [M]  net/bluetooth/amp.o
  CC      lib/random32.o
  CC      drivers/base/cacheinfo.o
  CC      kernel/kcmp.o
  CC      mm/memblock.o
  CC      net/ipv4/tcp_recovery.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_display.o
  CC [M]  drivers/gpu/drm/ast/ast_mm.o
  CC      arch/x86/kernel/i8237.o
  CC      drivers/acpi/acpica/rsio.o
  CC      net/ipv4/tcp_ulp.o
  CC [M]  drivers/gpu/drm/ast/ast_mode.o
  CC      arch/x86/kernel/stacktrace.o
  CC      fs/ext4/sysfs.o
  AR      drivers/macintosh/built-in.a
  CC      drivers/scsi/scsi.o
  AR      drivers/nvme/common/built-in.a
  CC      drivers/nvme/host/core.o
  AR      drivers/nvme/target/built-in.a
  CC      drivers/scsi/hosts.o
  CC      drivers/scsi/scsi_ioctl.o
  LD [M]  drivers/misc/mei/mei.o
  CC      fs/ext4/xattr.o
  CC      lib/bust_spinlocks.o
  LD [M]  drivers/misc/mei/mei-me.o
  CC [M]  drivers/gpu/drm/xe/xe_gpu_scheduler.o
  LD [M]  drivers/misc/mei/mei-gsc.o
  CC      drivers/nvme/host/ioctl.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.o
  CC [M]  fs/smb/client/inode.o
  CC [M]  drivers/gpu/drm/ast/ast_post.o
  CC [M]  fs/smb/client/link.o
  CC      arch/x86/kernel/reboot.o
  CC      fs/btrfs/ordered-data.o
  CC [M]  drivers/gpu/drm/i915/i915_suspend.o
  CC      drivers/acpi/acpica/rsirq.o
  CC      arch/x86/kernel/msr.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/disp.o
  CC [M]  fs/overlayfs/file.o
  CC [M]  fs/overlayfs/dir.o
  CC      mm/memory_hotplug.o
  CC      kernel/freezer.o
  CC      net/ipv6/ip6_checksum.o
  CC      mm/madvise.o
  HOSTCC  drivers/gpu/drm/xe/xe_gen_wa_oob
  CC [M]  arch/x86/kvm/vmx/posted_intr.o
  CC      drivers/base/swnode.o
  CC      fs/btrfs/extent_io.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc_submit.o
  CC      drivers/base/auxiliary.o
  LD [M]  arch/x86/kvm/kvm.o
  CC      lib/kasprintf.o
  CC [M]  net/bluetooth/hci_debugfs.o
  CC      drivers/acpi/acpica/rslist.o
  CC      drivers/base/devtmpfs.o
  CC      drivers/base/node.o
  CC      mm/page_io.o
  CC [M]  fs/fuse/xattr.o
  CC      kernel/stacktrace.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.o
  CC [M]  drivers/gpu/drm/xe/xe_gt.o
  CC      net/ipv4/tcp_offload.o
  CC [M]  drivers/gpu/drm/drm_aperture.o
  CC      lib/bitmap.o
  CC      drivers/scsi/scsicam.o
  CC      drivers/base/memory.o
  CC      arch/x86/kernel/cpuid.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/driver.o
  CC      drivers/nvme/host/sysfs.o
  CC      drivers/acpi/bus.o
  CC      drivers/acpi/acpica/rsmemory.o
  CC [M]  drivers/gpu/drm/i915/i915_switcheroo.o
  CC      drivers/acpi/glue.o
  CC [M]  drivers/gpu/drm/i915/i915_sysfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.o
  CC      drivers/acpi/scan.o
  CC      drivers/acpi/acpica/rsmisc.o
  CC      drivers/acpi/acpica/rsserial.o
  CC      drivers/nvme/host/pr.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_ccs_mode.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/event.o
  CC [M]  fs/overlayfs/readdir.o
  CC      net/ipv6/ip6_icmp.o
  CC [M]  drivers/gpu/drm/drm_atomic.o
  CC      drivers/scsi/scsi_error.o
  CC      kernel/dma.o
  CC [M]  fs/fuse/acl.o
  CC [M]  drivers/gpu/drm/ast/ast_dp501.o
  CC      drivers/acpi/resource.o
  CC      drivers/base/module.o
  UPD     arch/x86/kvm/kvm-asm-offsets.h
  AS [M]  arch/x86/kvm/vmx/vmenter.o
  LD [M]  arch/x86/kvm/kvm-intel.o
  CC [M]  drivers/gpu/drm/ast/ast_dp.o
  CC      drivers/acpi/acpica/rsutils.o
  CC      arch/x86/kernel/early-quirks.o
  CC      drivers/nvme/host/trace.o
  CC      kernel/smp.o
  CC [M]  drivers/gpu/drm/i915/i915_utils.o
  CC      drivers/acpi/acpica/rsxface.o
  CC [M]  fs/overlayfs/copy_up.o
  CC      lib/scatterlist.o
  CC [M]  drivers/gpu/drm/i915/intel_clock_gating.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/fifo.o
  CC      drivers/ata/libata-core.o
  CC      mm/swap_state.o
  CC      drivers/acpi/acpica/tbdata.o
  CC      drivers/spi/spi.o
  CC      drivers/acpi/acpi_processor.o
  CC      drivers/scsi/scsi_lib.o
  CC      kernel/uid16.o
  CC      fs/ext4/xattr_hurd.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_clock.o
  CC      drivers/base/pinctrl.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_bios.o
  CC      drivers/net/phy/mdio-boardinfo.o
  CC      drivers/nvme/host/fault_inject.o
  CC      fs/btrfs/volumes.o
  CC [M]  drivers/gpu/drm/drm_atomic_uapi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.o
  CC [M]  fs/fuse/readdir.o
  CC      fs/btrfs/async-thread.o
  CC      kernel/kallsyms.o
  CC      net/ipv4/tcp_plb.o
  CC      drivers/net/phy/stubs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/atombios_dp.o
  LD [M]  net/bluetooth/bluetooth.o
  CC      drivers/acpi/processor_core.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_afmt.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/head.o
  CC      net/ipv6/output_core.o
  CC      arch/x86/kernel/smp.o
  LD [M]  drivers/gpu/drm/ast/ast.o
  CC      net/ipv6/protocol.o
  CC [M]  fs/fuse/ioctl.o
  CC      net/sunrpc/auth.o
  CC      drivers/acpi/acpica/tbfadt.o
  CC      net/sunrpc/auth_null.o
  CC      drivers/base/devcoredump.o
  CC      net/ipv6/ip6_offload.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/mem.o
  CC      drivers/nvme/host/pci.o
  CC      arch/x86/kernel/smpboot.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_debugfs.o
  CC      fs/ext4/xattr_trusted.o
  CC [M]  fs/overlayfs/export.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/mmu.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/outp.o
  CC [M]  drivers/gpu/drm/i915/intel_device_info.o
  CC      lib/list_sort.o
  CC      drivers/net/phy/mdio_devres.o
  CC      lib/uuid.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/timer.o
  CC      drivers/acpi/acpica/tbfind.o
  CC      drivers/acpi/acpica/tbinstal.o
  CC      fs/btrfs/ioctl.o
  AR      drivers/firewire/built-in.a
  CC [M]  drivers/gpu/drm/i915/intel_memory_region.o
  AR      drivers/net/pse-pd/built-in.a
  CC [M]  drivers/gpu/drm/i915/intel_pcode.o
  CC      drivers/net/mdio/acpi_mdio.o
  CC [M]  drivers/gpu/drm/i915/intel_region_ttm.o
  CC      arch/x86/kernel/tsc_sync.o
  CC      mm/swapfile.o
  CC      lib/iov_iter.o
  CC      drivers/net/mdio/fwnode_mdio.o
  AR      drivers/cdrom/built-in.a
  CC      drivers/acpi/acpica/tbprint.o
  CC      kernel/acct.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_trace_points.o
  CC      drivers/base/platform-msi.o
  CC      net/ipv4/datagram.o
  LD [M]  fs/fuse/fuse.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/atombios_encoders.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_sa.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/atombios_i2c.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.o
  CC      kernel/crash_core.o
  CC      net/ipv4/raw.o
  CC      fs/open.o
  CC [M]  drivers/gpu/drm/drm_auth.o
  CC      drivers/acpi/acpica/tbutils.o
  CC      fs/btrfs/locking.o
  CC      arch/x86/kernel/setup_percpu.o
  CC      drivers/acpi/acpica/tbxface.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/vmm.o
  CC      fs/ext4/xattr_user.o
  CC      mm/swap_slots.o
  CC [M]  drivers/gpu/drm/i915/intel_runtime_pm.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_freq.o
  CC      drivers/net/phy/phy.o
  CC [M]  fs/overlayfs/params.o
  CC      drivers/acpi/acpica/tbxfload.o
  CC      kernel/compat.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/user.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_idle.o
  CC      net/ipv4/udp.o
  CC      drivers/scsi/scsi_lib_dma.o
  CC      drivers/ata/libata-scsi.o
  CC      drivers/base/physical_location.o
  CC      net/ipv4/udplite.o
  AR      drivers/net/mdio/built-in.a
  CC      drivers/acpi/acpica/tbxfroot.o
  CC      drivers/acpi/acpica/utaddress.o
  AR      drivers/net/pcs/built-in.a
  AR      drivers/net/ethernet/adi/built-in.a
  CC      drivers/ata/libata-eh.o
  AR      drivers/net/ethernet/alacritech/built-in.a
  AR      drivers/net/ethernet/amazon/built-in.a
  CC      net/ipv6/tcpv6_offload.o
  AR      drivers/net/ethernet/aquantia/built-in.a
  AR      drivers/net/ethernet/asix/built-in.a
  AR      drivers/net/usb/built-in.a
  CC [M]  drivers/net/usb/pegasus.o
  CC      arch/x86/kernel/ftrace.o
  AR      drivers/net/ethernet/cadence/built-in.a
  AR      drivers/net/ethernet/broadcom/built-in.a
  CC [M]  drivers/net/ethernet/broadcom/b44.o
  CC [M]  drivers/net/ipvlan/ipvlan_core.o
  AR      drivers/net/ethernet/cortina/built-in.a
  AR      drivers/net/ethernet/cavium/common/built-in.a
  CC [M]  drivers/net/ipvlan/ipvlan_main.o
  AR      drivers/net/ethernet/cavium/thunder/built-in.a
  AS      arch/x86/kernel/ftrace_64.o
  AR      drivers/net/ethernet/cavium/liquidio/built-in.a
  CC      fs/ext4/fast_commit.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/userc361.o
  AR      drivers/net/ethernet/cavium/octeon/built-in.a
  AR      drivers/net/ethernet/cavium/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.o
  CC      kernel/utsname.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.o
  CC [M]  fs/smb/client/misc.o
  CC [M]  drivers/gpu/drm/i915/intel_sbi.o
  CC      mm/dmapool.o
  CC [M]  drivers/net/ipvlan/ipvlan_l3s.o
  CC      drivers/scsi/scsi_scan.o
  CC      net/ipv6/exthdrs_offload.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.o
  CC      net/ipv6/inet6_hashtables.o
  CC      drivers/acpi/acpica/utalloc.o
  CC [M]  drivers/net/vxlan/vxlan_core.o
  CC      drivers/net/loopback.o
  CC      drivers/base/trace.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_mcr.o
  CC [M]  fs/overlayfs/xattrs.o
  GEN     drivers/scsi/scsi_devinfo_tbl.c
  CC      kernel/user_namespace.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/client.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_pll.o
  CC      net/ipv4/udp_offload.o
  CC      fs/btrfs/orphan.o
  CC      net/ipv4/arp.o
  AR      drivers/spi/built-in.a
  CC      net/ipv6/mcast_snoop.o
  CC      drivers/acpi/acpica/utascii.o
  CC      arch/x86/kernel/trace_clock.o
  CC      net/ipv4/icmp.o
  AR      drivers/nvme/host/built-in.a
  AR      drivers/nvme/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.o
  CC      mm/hugetlb.o
  AR      drivers/auxdisplay/built-in.a
  CC      arch/x86/kernel/trace.o
  CC      mm/hugetlb_vmemmap.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.o
  CC      drivers/net/phy/phy-c45.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.o
  AR      drivers/net/ethernet/engleder/built-in.a
  CC      drivers/ata/libata-transport.o
  AR      drivers/net/ethernet/ezchip/built-in.a
  CC      net/ipv4/devinet.o
  LD [M]  fs/overlayfs/overlay.o
  CC      drivers/ata/libata-trace.o
  CC [M]  drivers/gpu/drm/i915/intel_step.o
  CC [M]  drivers/gpu/drm/drm_blend.o
  CC      drivers/acpi/acpica/utbuffer.o
  AR      drivers/base/built-in.a
  CC [M]  drivers/gpu/drm/i915/intel_uncore.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.o
  CC      lib/clz_ctz.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/engine.o
  CC [M]  drivers/net/usb/rtl8150.o
  CC      drivers/ata/libata-sata.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_pagefault.o
  CC      net/sunrpc/auth_tls.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sysfs.o
  CC      lib/bsearch.o
  CC      kernel/pid_namespace.o
  CC      drivers/net/netconsole.o
  CC [M]  drivers/gpu/drm/drm_bridge.o
  CC [M]  drivers/gpu/drm/i915/intel_wakeref.o
  CC      arch/x86/kernel/rethook.o
  CC [M]  drivers/net/usb/r8152.o
  CC      drivers/scsi/scsi_devinfo.o
  LD [M]  drivers/net/ipvlan/ipvlan.o
  CC [M]  drivers/net/dummy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.o
  CC      drivers/acpi/acpica/utcksum.o
  CC [M]  net/ipv6/ip6_udp_tunnel.o
  AR      net/ipv6/built-in.a
  CC      drivers/acpi/acpica/utcopy.o
  CC [M]  drivers/gpu/drm/drm_cache.o
  CC [M]  drivers/gpu/drm/drm_client.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.o
  CC [M]  drivers/net/ethernet/broadcom/bnx2.o
  CC      lib/find_bit.o
  CC      drivers/scsi/scsi_sysctl.o
  CC [M]  fs/smb/client/netmisc.o
  CC      mm/mempolicy.o
  CC [M]  drivers/net/macvlan.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.o
  CC      arch/x86/kernel/crash_core_64.o
  CC      drivers/acpi/acpica/utexcep.o
  CC      drivers/ata/libata-sff.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.o
  CC      arch/x86/kernel/module.o
  CC      net/sunrpc/auth_unix.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/enum.o
  CC      net/sunrpc/svc.o
  CC      drivers/net/phy/phy-core.o
  CC      lib/llist.o
  CC      fs/ext4/orphan.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vf_error.o
  CC [M]  drivers/net/ethernet/broadcom/cnic.o
  UPD     kernel/config_data
  CC [M]  drivers/net/ethernet/broadcom/tg3.o
  CC      kernel/stop_machine.o
  CC      drivers/acpi/acpica/utdebug.o
  CC      net/ipv4/af_inet.o
  CC      lib/lwq.o
  CC      arch/x86/kernel/early_printk.o
  CC [M]  fs/smb/client/smbencrypt.o
  CC [M]  drivers/gpu/drm/i915/vlv_sideband.o
  CC [M]  drivers/net/mii.o
  CC      drivers/scsi/scsi_debugfs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/event.o
  CC [M]  drivers/net/vxlan/vxlan_multicast.o
  CC      drivers/ata/libata-pmp.o
  CC      drivers/acpi/processor_pdc.o
  CC      fs/btrfs/export.o
  CC      lib/memweight.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/firmware.o
  CC [M]  drivers/net/mdio.o
  CC [M]  drivers/net/usb/asix_devices.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_sched.o
  CC      drivers/scsi/scsi_trace.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o
  CC [M]  drivers/gpu/drm/drm_client_modeset.o
  CC      lib/kfifo.o
  CC      drivers/scsi/scsi_logging.o
  CC      fs/btrfs/tree-log.o
  CC [M]  drivers/net/tun.o
  CC      drivers/acpi/acpica/utdecode.o
  CC      arch/x86/kernel/hpet.o
  CC [M]  drivers/net/vxlan/vxlan_vnifilter.o
  CC      drivers/acpi/acpica/utdelete.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/gpuobj.o
  CC      net/ipv4/igmp.o
  CC      drivers/net/phy/phy_device.o
  CC      net/ipv4/fib_frontend.o
  CC [M]  drivers/gpu/drm/i915/vlv_suspend.o
  CC      kernel/kprobes.o
  CC      drivers/ata/libata-acpi.o
  CC      drivers/acpi/acpica/uterror.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.o
  CC      net/ipv4/fib_semantics.o
  AR      fs/ext4/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_topology.o
  CC      drivers/acpi/acpica/uteval.o
  CC      drivers/usb/common/common.o
  CC      drivers/scsi/scsi_pm.o
  CC      drivers/usb/common/debug.o
  CC      drivers/scsi/scsi_bsg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.o
  CC      fs/read_write.o
  CC      drivers/input/serio/serio.o
  CC      lib/percpu-refcount.o
  CC      drivers/input/serio/i8042.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/intr.o
  CC      drivers/usb/core/usb.o
  CC      drivers/input/serio/libps2.o
  CC [M]  drivers/net/vxlan/vxlan_mdb.o
  CC [M]  fs/smb/client/transport.o
  CC      drivers/ata/libata-pata-timings.o
  CC      net/ipv4/fib_trie.o
  CC      kernel/hung_task.o
  CC      drivers/ata/ahci.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/ioctl.o
  CC [M]  fs/smb/client/cached_dir.o
  CC      arch/x86/kernel/amd_nb.o
  CC      drivers/acpi/acpica/utglobal.o
  CC [M]  fs/smb/client/cifs_unicode.o
  CC      kernel/watchdog.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/memory.o
  CC [M]  drivers/net/veth.o
  GEN     xe_wa_oob.c xe_wa_oob.h
  GEN     xe_wa_oob.c xe_wa_oob.h
  CC [M]  drivers/gpu/drm/xe/xe_guc_ads.o
  CC      drivers/scsi/scsi_common.o
  AR      drivers/usb/common/built-in.a
  CC      drivers/ata/libahci.o
  CC [M]  drivers/gpu/drm/i915/soc/intel_dram.o
  CC      drivers/net/phy/linkmode.o
  CC      lib/rhashtable.o
  CC [M]  drivers/gpu/drm/i915/soc/intel_gmch.o
  CC [M]  fs/smb/client/nterr.o
  CC      drivers/acpi/acpica/uthex.o
  CC      mm/sparse.o
  CC      drivers/ata/ata_piix.o
  CC      mm/sparse-vmemmap.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/mm.o
  CC      net/sunrpc/svcsock.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/object.o
  CC      drivers/acpi/ec.o
  CC      arch/x86/kernel/kvm.o
  CC      drivers/acpi/dock.o
  CC      drivers/scsi/sd.o
  CC      drivers/usb/core/hub.o
  CC      drivers/acpi/acpica/utids.o
  CC      drivers/acpi/acpica/utinit.o
  CC      drivers/scsi/sg.o
  CC      drivers/usb/core/hcd.o
  AR      drivers/input/serio/built-in.a
  CC [M]  fs/smb/client/cifsencrypt.o
  CC      arch/x86/kernel/kvmclock.o
  CC      drivers/acpi/pci_root.o
  CC      drivers/acpi/pci_link.o
  CC      drivers/acpi/acpica/utlock.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.o
  CC      kernel/watchdog_perf.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/oproxy.o
  CC      kernel/seccomp.o
  CC [M]  fs/smb/client/readdir.o
  CC [M]  drivers/gpu/drm/i915/soc/intel_pch.o
  CC      drivers/net/phy/mdio_bus.o
  CC [M]  drivers/net/usb/asix_common.o
  CC      drivers/acpi/acpica/utmath.o
  CC      mm/mmu_notifier.o
  CC [M]  fs/smb/client/ioctl.o
  CC      fs/btrfs/free-space-cache.o
  CC      fs/btrfs/zlib.o
  CC [M]  drivers/net/usb/ax88172a.o
  AR      drivers/usb/phy/built-in.a
  CC [M]  drivers/gpu/drm/i915/i915_memcpy.o
  CC [M]  drivers/gpu/drm/i915/i915_mm.o
  CC      drivers/usb/host/pci-quirks.o
  CC      drivers/usb/storage/scsiglue.o
  CC      drivers/usb/serial/usb-serial.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_ct.o
  CC      drivers/usb/serial/generic.o
  AR      drivers/net/ethernet/fungible/built-in.a
  AR      drivers/net/ethernet/huawei/built-in.a
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_main.o
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_hw.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/option.o
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_ethtool.o
  CC      lib/base64.o
  CC      arch/x86/kernel/paravirt.o
  CC      arch/x86/kernel/pvclock.o
  CC      drivers/acpi/acpica/utmisc.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_db_mgr.o
  CC      lib/once.o
  LD [M]  drivers/net/vxlan/vxlan.o
  CC      drivers/acpi/pci_irq.o
  CC [M]  fs/smb/client/sess.o
  CC      arch/x86/kernel/pcspeaker.o
  CC      drivers/usb/storage/protocol.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/ramht.o
  CC [M]  fs/smb/client/export.o
  CC      drivers/acpi/acpi_lpss.o
  AR      drivers/ata/built-in.a
  CC      drivers/input/keyboard/atkbd.o
  CC      fs/btrfs/lzo.o
  CC      drivers/acpi/acpica/utmutex.o
  CC      mm/ksm.o
  CC      drivers/acpi/acpica/utnonansi.o
  CC [M]  drivers/net/usb/ax88179_178a.o
  CC      drivers/acpi/acpi_apd.o
  CC      drivers/usb/core/urb.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.o
  CC      lib/refcount.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.o
  CC      lib/rcuref.o
  CC      drivers/usb/host/ehci-hcd.o
  CC      fs/btrfs/zstd.o
  CC      drivers/net/phy/mdio_device.o
  CC [M]  drivers/gpu/drm/i915/i915_sw_fence.o
  CC      drivers/usb/host/ehci-pci.o
  CC      net/ipv4/fib_notifier.o
  CC      drivers/usb/host/ohci-hcd.o
  CC [M]  drivers/gpu/drm/i915/i915_sw_fence_work.o
  CC      drivers/usb/core/message.o
  CC      arch/x86/kernel/check.o
  CC [M]  fs/smb/client/unc.o
  CC      lib/usercopy.o
  CC      drivers/usb/core/driver.o
  CC [M]  fs/smb/client/winucase.o
  CC      lib/errseq.o
  CC      lib/bucket_locks.o
  CC      drivers/usb/core/config.o
  CC      drivers/usb/host/ohci-pci.o
  CC      drivers/acpi/acpica/utobject.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.o
  CC      drivers/usb/storage/transport.o
  CC      drivers/rtc/lib.o
  CC [M]  fs/smb/client/smb2ops.o
  AR      drivers/i2c/algos/built-in.a
  CC      kernel/relay.o
  CC [M]  drivers/i2c/algos/i2c-algo-bit.o
  CC      lib/generic-radix-tree.o
  CC      mm/slub.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/subdev.o
  CC      drivers/usb/serial/bus.o
  CC      drivers/i2c/busses/i2c-designware-common.o
  CC      drivers/i2c/i2c-boardinfo.o
  AR      drivers/i2c/muxes/built-in.a
  CC      drivers/acpi/acpi_platform.o
  CC [M]  drivers/i2c/muxes/i2c-mux-gpio.o
  CC      drivers/i2c/i2c-core-base.o
  CC      net/sunrpc/svcauth.o
  CC      drivers/scsi/scsi_sysfs.o
  CC      arch/x86/kernel/uprobes.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_debugfs.o
  CC      drivers/acpi/acpica/utosi.o
  CC      lib/bitmap-str.o
  CC      drivers/net/phy/swphy.o
  CC      drivers/usb/serial/console.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_csa.o
  CC      arch/x86/kernel/perf_regs.o
  AR      drivers/input/keyboard/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o
  CC      drivers/acpi/acpi_pnp.o
  CC      drivers/usb/core/file.o
  AR      drivers/input/mouse/built-in.a
  CC      drivers/input/input.o
  CC      drivers/rtc/class.o
  CC      drivers/acpi/power.o
  CC      net/ipv4/inet_fragment.o
  CC      fs/btrfs/compression.o
  CC      fs/btrfs/delayed-ref.o
  CC      lib/string_helpers.o
  AR      drivers/net/ethernet/i825xx/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_guc_hwconfig.o
  CC [M]  drivers/gpu/drm/i915/i915_syncmap.o
  CC [M]  drivers/net/usb/cdc_ether.o
  CC      drivers/acpi/acpica/utownerid.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_log.o
  CC      drivers/i2c/i2c-core-smbus.o
  CC [M]  fs/smb/client/smb2maperror.o
  CC      drivers/i2c/i2c-core-acpi.o
  CC      drivers/i2c/i2c-core-slave.o
  CC      drivers/usb/storage/usb.o
  CC      lib/hexdump.o
  CC      drivers/usb/storage/initializers.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/uevent.o
  CC      kernel/utsname_sysctl.o
  CC      kernel/delayacct.o
  CC      drivers/i2c/busses/i2c-designware-master.o
  CC      drivers/usb/core/buffer.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.o
  CC      drivers/acpi/acpica/utpredef.o
  CC      drivers/usb/storage/sierra_ms.o
  CC      drivers/net/phy/fixed_phy.o
  CC      drivers/usb/serial/ftdi_sio.o
  CC      drivers/input/input-compat.o
  CC      drivers/usb/storage/option_ms.o
  CC      arch/x86/kernel/tracepoint.o
  CC      lib/kstrtox.o
  CC      drivers/rtc/interface.o
  CC      arch/x86/kernel/itmt.o
  CC      arch/x86/kernel/umip.o
  CC      net/ipv4/ping.o
  CC [M]  drivers/gpu/drm/i915/i915_user_extensions.o
  CC      kernel/taskstats.o
  CC      drivers/acpi/acpica/utresdecode.o
  CC      drivers/rtc/nvmem.o
  CC      drivers/acpi/event.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_pc.o
  CC      lib/debug_info.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.o
  CC      fs/file_table.o
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_param.o
  AR      drivers/scsi/built-in.a
  CC [M]  drivers/net/ethernet/intel/e1000e/82571.o
  CC      lib/iomap.o
  CC      net/ipv4/ip_tunnel_core.o
  AR      drivers/i3c/built-in.a
  CC [M]  drivers/net/ethernet/intel/e1000e/ich8lan.o
  CC      drivers/acpi/evged.o
  CC      drivers/usb/core/sysfs.o
  CC      net/sunrpc/svcauth_unix.o
  CC [M]  drivers/net/usb/cdc_eem.o
  CC      net/sunrpc/addr.o
  CC [M]  drivers/gpu/drm/i915/i915_ioc32.o
  CC      drivers/acpi/acpica/utresrc.o
  CC      drivers/usb/serial/pl2303.o
  CC      lib/pci_iomap.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/nvfw/fw.o
  CC      drivers/i2c/busses/i2c-designware-platdrv.o
  CC      arch/x86/kernel/unwind_orc.o
  CC      drivers/usb/storage/usual-tables.o
  AR      drivers/media/i2c/built-in.a
  CC      drivers/usb/host/uhci-hcd.o
  AR      drivers/media/tuners/built-in.a
  AR      drivers/media/rc/keymaps/built-in.a
  AR      drivers/media/rc/built-in.a
  CC      arch/x86/kernel/callthunks.o
  CC      arch/x86/kernel/cet.o
  CC [M]  drivers/net/phy/phylink.o
  AR      drivers/media/common/b2c2/built-in.a
  CC      arch/x86/kernel/mmconf-fam10h_64.o
  AR      drivers/media/common/saa7146/built-in.a
  CC      drivers/usb/host/xhci.o
  AR      drivers/media/common/siano/built-in.a
  AR      drivers/media/common/v4l2-tpg/built-in.a
  CC      drivers/input/input-mt.o
  AR      drivers/media/common/videobuf2/built-in.a
  AR      drivers/media/common/built-in.a
  CC      drivers/i2c/i2c-dev.o
  AR      drivers/media/platform/allegro-dvt/built-in.a
  CC [M]  fs/smb/client/smb2transport.o
  AR      drivers/media/platform/amlogic/meson-ge2d/built-in.a
  AR      drivers/media/platform/amlogic/built-in.a
  AR      drivers/media/platform/amphion/built-in.a
  CC      fs/super.o
  CC      fs/btrfs/relocation.o
  AR      drivers/media/platform/aspeed/built-in.a
  AR      drivers/media/platform/atmel/built-in.a
  AR      drivers/media/platform/cadence/built-in.a
  AR      drivers/media/platform/chips-media/built-in.a
  CC      drivers/acpi/sysfs.o
  AR      drivers/media/platform/intel/built-in.a
  CC      drivers/acpi/property.o
  CC      drivers/acpi/acpi_cmos_rtc.o
  AR      drivers/media/platform/marvell/built-in.a
  CC      drivers/acpi/acpica/utstate.o
  AR      drivers/media/platform/mediatek/jpeg/built-in.a
  AR      drivers/media/platform/mediatek/mdp/built-in.a
  AR      drivers/media/platform/mediatek/vcodec/common/built-in.a
  AR      drivers/media/platform/mediatek/vcodec/encoder/built-in.a
  AR      drivers/media/platform/microchip/built-in.a
  AR      drivers/media/platform/nuvoton/built-in.a
  AR      drivers/media/platform/mediatek/vcodec/decoder/built-in.a
  AR      drivers/media/platform/mediatek/vcodec/built-in.a
  AR      drivers/media/platform/mediatek/vpu/built-in.a
  CC      drivers/acpi/x86/apple.o
  AR      drivers/media/platform/mediatek/mdp3/built-in.a
  AR      drivers/media/platform/nvidia/tegra-vde/built-in.a
  AR      drivers/media/platform/mediatek/built-in.a
  AR      drivers/media/platform/nvidia/built-in.a
  CC      net/ipv4/gre_offload.o
  AR      drivers/media/platform/nxp/dw100/built-in.a
  CC      kernel/tsacct.o
  AR      drivers/usb/storage/built-in.a
  AR      drivers/media/platform/qcom/camss/built-in.a
  AR      drivers/media/platform/nxp/imx-jpeg/built-in.a
  CC      drivers/input/input-poller.o
  AR      drivers/media/platform/qcom/venus/built-in.a
  AR      drivers/media/platform/qcom/built-in.a
  AR      drivers/media/platform/nxp/imx8-isi/built-in.a
  AR      drivers/media/platform/nxp/built-in.a
  CC      kernel/tracepoint.o
  CC      kernel/latencytop.o
  CC      net/ipv4/metrics.o
  AR      drivers/media/platform/renesas/rcar-vin/built-in.a
  CC      fs/btrfs/delayed-inode.o
  AR      drivers/media/platform/renesas/rzg2l-cru/built-in.a
  AR      drivers/media/platform/renesas/vsp1/built-in.a
  AR      drivers/media/platform/renesas/built-in.a
  CC      net/ipv4/netlink.o
  AR      drivers/media/platform/rockchip/rga/built-in.a
  AR      drivers/media/platform/rockchip/rkisp1/built-in.a
  AR      drivers/media/platform/rockchip/built-in.a
  CC [M]  drivers/net/usb/smsc75xx.o
  AR      drivers/media/platform/samsung/exynos-gsc/built-in.a
  CC      drivers/input/ff-core.o
  AR      drivers/media/platform/samsung/exynos4-is/built-in.a
  AR      drivers/media/platform/samsung/s3c-camif/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_guc_submit.o
  AR      drivers/media/platform/samsung/s5p-g2d/built-in.a
  CC [M]  drivers/gpu/drm/i915/i915_debugfs.o
  AR      drivers/media/platform/samsung/s5p-jpeg/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/nvfw/hs.o
  CC      drivers/rtc/dev.o
  CC      drivers/acpi/acpica/utstring.o
  AR      drivers/media/platform/st/sti/bdisp/built-in.a
  CC      drivers/rtc/proc.o
  AR      drivers/media/platform/samsung/s5p-mfc/built-in.a
  AR      drivers/media/platform/st/sti/c8sectpfe/built-in.a
  AR      drivers/media/platform/samsung/built-in.a
  CC      drivers/rtc/sysfs.o
  AR      drivers/media/platform/st/sti/delta/built-in.a
  CC [M]  drivers/net/usb/smsc95xx.o
  CC      drivers/usb/core/endpoint.o
  CC      arch/x86/kernel/vsmp_64.o
  CC      drivers/i2c/busses/i2c-designware-baytrail.o
  AR      drivers/media/platform/st/sti/hva/built-in.a
  CC      lib/iomap_copy.o
  LD [M]  drivers/net/ethernet/intel/e1000/e1000.o
  AR      drivers/media/platform/st/stm32/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.o
  CC [M]  drivers/net/usb/mcs7830.o
  AR      drivers/usb/serial/built-in.a
  AR      drivers/media/platform/st/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.o
  CC      net/sunrpc/rpcb_clnt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/nvfw/ls.o
  AR      drivers/media/platform/sunxi/sun4i-csi/built-in.a
  AR      drivers/media/platform/sunxi/sun6i-csi/built-in.a
  AR      drivers/media/platform/sunxi/sun6i-mipi-csi2/built-in.a
  AR      drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/built-in.a
  AR      drivers/media/pci/ttpci/built-in.a
  AR      drivers/media/pci/b2c2/built-in.a
  AR      drivers/media/platform/sunxi/sun8i-di/built-in.a
  AR      drivers/media/pci/pluto2/built-in.a
  AR      drivers/media/platform/sunxi/sun8i-rotate/built-in.a
  AR      drivers/media/platform/sunxi/built-in.a
  AR      drivers/media/pci/dm1105/built-in.a
  AR      drivers/media/pci/pt1/built-in.a
  AR      drivers/media/pci/pt3/built-in.a
  AR      drivers/media/platform/ti/am437x/built-in.a
  AR      drivers/media/pci/mantis/built-in.a
  AR      drivers/media/platform/ti/cal/built-in.a
  CC      lib/devres.o
  CC [M]  drivers/net/usb/usbnet.o
  AR      drivers/media/pci/ngene/built-in.a
  AR      drivers/media/platform/ti/vpe/built-in.a
  AR      drivers/media/platform/ti/davinci/built-in.a
  CC [M]  drivers/net/usb/cdc_ncm.o
  AR      drivers/media/pci/ddbridge/built-in.a
  AR      drivers/media/platform/ti/j721e-csi2rx/built-in.a
  AR      drivers/media/pci/saa7146/built-in.a
  CC      mm/migrate.o
  AR      drivers/media/platform/ti/omap/built-in.a
  AR      drivers/media/pci/smipcie/built-in.a
  CC [M]  drivers/net/usb/r8153_ecm.o
  AR      drivers/media/platform/ti/omap3isp/built-in.a
  AR      drivers/media/platform/ti/built-in.a
  AR      drivers/media/pci/netup_unidvb/built-in.a
  CC      drivers/input/touchscreen.o
  AR      drivers/media/pci/intel/ipu3/built-in.a
  CC      kernel/irq_work.o
  AR      drivers/media/pci/intel/ivsc/built-in.a
  AR      drivers/media/platform/verisilicon/built-in.a
  AR      drivers/media/pci/intel/built-in.a
  CC [M]  drivers/gpu/drm/i915/i915_debugfs_params.o
  AR      drivers/media/platform/via/built-in.a
  AR      drivers/media/pci/built-in.a
  CC      drivers/input/ff-memless.o
  CC      kernel/static_call.o
  AR      drivers/media/platform/xilinx/built-in.a
  AR      drivers/media/platform/built-in.a
  CC      drivers/acpi/acpica/utstrsuppt.o
  CC      drivers/input/vivaldi-fmap.o
  CC      drivers/usb/core/devio.o
  AR      drivers/media/usb/b2c2/built-in.a
  AR      drivers/media/usb/dvb-usb/built-in.a
  AR      drivers/media/usb/dvb-usb-v2/built-in.a
  CC      kernel/static_call_inline.o
  AR      drivers/media/usb/s2255/built-in.a
  CC      kernel/user-return-notifier.o
  AR      drivers/media/usb/siano/built-in.a
  AR      drivers/media/usb/ttusb-budget/built-in.a
  AR      arch/x86/kernel/built-in.a
  CC      drivers/acpi/acpica/utstrtoul64.o
  AR      drivers/media/usb/ttusb-dec/built-in.a
  AR      drivers/media/usb/built-in.a
  AR      arch/x86/built-in.a
  AR      drivers/media/mmc/siano/built-in.a
  CC [M]  drivers/gpu/drm/drm_color_mgmt.o
  CC      drivers/rtc/rtc-mc146818-lib.o
  AR      drivers/media/mmc/built-in.a
  AR      drivers/usb/misc/built-in.a
  CC [M]  drivers/gpu/drm/i915/i915_pmu.o
  AR      drivers/media/firewire/built-in.a
  CC [M]  drivers/gpu/drm/i915/gt/gen2_engine_cs.o
  CC      drivers/usb/gadget/udc/core.o
  AR      drivers/media/spi/built-in.a
  AR      drivers/media/test-drivers/built-in.a
  AR      drivers/media/built-in.a
  CC      drivers/input/input-leds.o
  AR      drivers/usb/gadget/function/built-in.a
  CC      drivers/input/mousedev.o
  CC [M]  drivers/i2c/busses/i2c-scmi.o
  CC      drivers/acpi/acpica/utxface.o
  CC      kernel/padata.o
  CC      drivers/usb/gadget/udc/trace.o
  CC      drivers/acpi/acpica/utxfinit.o
  CC      net/ipv4/nexthop.o
  CC      kernel/jump_label.o
  CC [M]  drivers/i2c/busses/i2c-ccgx-ucsi.o
  CC      net/sunrpc/timer.o
  CC      drivers/input/evdev.o
  CC      net/sunrpc/xdr.o
  CC      lib/check_signature.o
  AR      drivers/usb/gadget/legacy/built-in.a
  CC      drivers/usb/gadget/usbstring.o
  CC      lib/interval_tree.o
  CC      kernel/context_tracking.o
  CC      drivers/acpi/acpica/utxferror.o
  CC      mm/memory-tiers.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/nvfw/acr.o
  CC      net/ipv4/udp_tunnel_stub.o
  CC      net/ipv4/sysctl_net_ipv4.o
  CC      net/sunrpc/sunrpc_syms.o
  CC      mm/migrate_device.o
  CC      lib/assoc_array.o
  CC      drivers/rtc/rtc-cmos.o
  CC [M]  drivers/net/ethernet/intel/e1000e/80003es2lan.o
  CC      fs/char_dev.o
  CC      drivers/usb/host/xhci-mem.o
  CC      kernel/iomem.o
  CC      kernel/rseq.o
  CC [M]  fs/smb/client/smb2misc.o
  CC      drivers/usb/core/notify.o
  CC [M]  drivers/net/phy/aquantia_main.o
  CC [M]  drivers/gpu/drm/i915/gt/gen6_engine_cs.o
  CC [M]  drivers/net/ethernet/intel/e1000e/mac.o
  AR      drivers/ptp/built-in.a
  CC [M]  drivers/ptp/ptp_clock.o
  CC      drivers/acpi/acpica/utxfmutex.o
  CC [M]  drivers/ptp/ptp_chardev.o
  CC      fs/stat.o
  CC      lib/list_debug.o
  CC      net/ipv4/proc.o
  CC [M]  drivers/i2c/busses/i2c-i801.o
  AR      drivers/power/reset/built-in.a
  CC      drivers/power/supply/power_supply_core.o
  CC      drivers/power/supply/power_supply_sysfs.o
  CC      drivers/power/supply/power_supply_leds.o
  CC      drivers/hwmon/hwmon.o
  CC      drivers/power/supply/power_supply_hwmon.o
  CC      lib/debugobjects.o
  CC      drivers/usb/gadget/config.o
  CC      drivers/usb/host/xhci-ext-caps.o
  CC [M]  drivers/hwmon/acpi_power_meter.o
  CC      fs/btrfs/scrub.o
  AR      drivers/acpi/acpica/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.o
  CC      drivers/acpi/x86/utils.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_umc.o
  CC      drivers/usb/core/generic.o
  CC [M]  drivers/i2c/busses/i2c-isch.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/nvfw/flcn.o
  AR      drivers/input/built-in.a
  CC      mm/huge_memory.o
  CC      drivers/acpi/x86/s2idle.o
  AR      drivers/usb/gadget/udc/built-in.a
  LD [M]  drivers/net/usb/asix.o
  AR      drivers/thermal/broadcom/built-in.a
  AR      drivers/thermal/samsung/built-in.a
  CC      drivers/watchdog/watchdog_core.o
  CC      drivers/thermal/intel/intel_tcc.o
  CC      drivers/thermal/intel/therm_throt.o
  AR      drivers/thermal/st/built-in.a
  CC [M]  drivers/thermal/intel/x86_pkg_temp_thermal.o
  CC [M]  drivers/gpu/drm/i915/gt/gen6_ppgtt.o
  CC      mm/khugepaged.o
  CC      lib/bitrev.o
  GZIP    kernel/config_data.gz
  CC      kernel/configs.o
  CC [M]  drivers/usb/class/usbtmc.o
  AR      drivers/rtc/built-in.a
  CC [M]  drivers/net/phy/aquantia_hwmon.o
  CC [M]  drivers/gpu/drm/drm_connector.o
  CC      drivers/md/md.o
  CC [M]  drivers/md/persistent-data/dm-array.o
  CC [M]  drivers/gpu/drm/xe/xe_heci_gsc.o
  CC [M]  drivers/md/persistent-data/dm-bitset.o
  CC [M]  drivers/md/persistent-data/dm-block-manager.o
  CC [M]  drivers/gpu/drm/drm_crtc.o
  CC [M]  fs/smb/client/smb2pdu.o
  CC [M]  drivers/ptp/ptp_sysfs.o
  CC [M]  fs/smb/client/smb2inode.o
  CC [M]  drivers/i2c/i2c-smbus.o
  CC [M]  drivers/gpu/drm/drm_displayid.o
  CC      drivers/acpi/debugfs.o
  CC [M]  drivers/gpu/drm/i915/gt/gen7_renderclear.o
  CC      drivers/acpi/acpi_lpat.o
  CC      drivers/usb/gadget/epautoconf.o
  CC [M]  fs/smb/client/smb2file.o
  CC      drivers/usb/core/quirks.o
  AR      drivers/power/supply/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/base.o
  AR      drivers/power/built-in.a
  CC [M]  fs/smb/client/cifsacl.o
  CC [M]  drivers/i2c/i2c-mux.o
  CC [M]  drivers/ptp/ptp_vclock.o
  AR      kernel/built-in.a
  AR      drivers/net/ethernet/microsoft/built-in.a
  CC [M]  drivers/net/ethernet/intel/e1000e/manage.o
  AR      drivers/net/ethernet/litex/built-in.a
  CC [M]  drivers/net/ethernet/intel/e1000e/nvm.o
  CC      drivers/usb/core/devices.o
  CC      lib/crc16.o
  CC [M]  drivers/i2c/busses/i2c-ismt.o
  AR      drivers/net/ethernet/microchip/built-in.a
  AR      drivers/net/ethernet/mscc/built-in.a
  AR      drivers/net/ethernet/neterion/built-in.a
  AR      drivers/net/ethernet/netronome/built-in.a
  CC      lib/crc-t10dif.o
  AR      drivers/net/ethernet/ni/built-in.a
  CC      drivers/usb/core/phy.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/cmdq.o
  HOSTCC  lib/gen_crc32table
  CC [M]  drivers/hwmon/coretemp.o
  CC      net/ipv4/syncookies.o
  CC [M]  drivers/i2c/busses/i2c-piix4.o
  CC [M]  fs/smb/client/fs_context.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.o
  CC [M]  drivers/net/phy/ax88796b.o
  CC      drivers/usb/core/port.o
  AR      drivers/net/ethernet/packetengines/built-in.a
  AR      drivers/thermal/intel/built-in.a
  CC      mm/page_counter.o
  CC      drivers/acpi/acpi_lpit.o
  AR      drivers/thermal/qcom/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.o
  CC      drivers/watchdog/watchdog_dev.o
  AR      drivers/thermal/tegra/built-in.a
  AR      drivers/thermal/mediatek/built-in.a
  CC [M]  drivers/md/persistent-data/dm-space-map-common.o
  CC      fs/btrfs/backref.o
  CC      drivers/thermal/thermal_core.o
  CC      drivers/usb/gadget/composite.o
  CC      drivers/acpi/prmt.o
  CC [M]  drivers/net/phy/bcm7xxx.o
  CC      net/sunrpc/cache.o
  CC      mm/memcontrol.o
  AR      drivers/hwmon/built-in.a
  CC      drivers/usb/core/hcd-pci.o
  CC      mm/vmpressure.o
  CC      drivers/usb/host/xhci-ring.o
  CC      drivers/usb/core/usb-acpi.o
  CC      lib/libcrc32c.o
  CC [M]  drivers/md/persistent-data/dm-space-map-disk.o
  CC      mm/swap_cgroup.o
  CC [M]  drivers/ptp/ptp_kvm_x86.o
  CC      lib/xxhash.o
  CC      mm/hugetlb_cgroup.o
  CC      lib/genalloc.o
  CC      fs/btrfs/ulist.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/fw.o
  CC      drivers/acpi/acpi_pcc.o
  CC [M]  drivers/gpu/drm/i915/gt/gen8_engine_cs.o
  CC [M]  drivers/net/ethernet/intel/e1000e/phy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_rap.o
  CC      mm/kmemleak.o
  CC      drivers/opp/core.o
  CC      drivers/thermal/thermal_sysfs.o
  CC      drivers/opp/cpu.o
  CC      drivers/usb/gadget/functions.o
  CC [M]  drivers/net/ethernet/intel/e1000e/param.o
  CC      mm/page_isolation.o
  CC      drivers/cpufreq/cpufreq.o
  CC      mm/early_ioremap.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.o
  CC      drivers/cpufreq/freq_table.o
  CC      drivers/watchdog/softdog.o
  CC [M]  drivers/net/phy/bcm87xx.o
  CC [M]  drivers/i2c/busses/i2c-designware-pcidrv.o
  CC [M]  drivers/ptp/ptp_kvm_common.o
  CC [M]  drivers/net/ethernet/intel/e1000e/ethtool.o
  CC      fs/btrfs/qgroup.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_fence.o
  CC      drivers/cpuidle/governors/menu.o
  CC      drivers/cpuidle/cpuidle.o
  CC [M]  drivers/gpu/drm/drm_drv.o
  CC [M]  drivers/md/persistent-data/dm-space-map-metadata.o
  AR      drivers/usb/core/built-in.a
  CC      drivers/cpuidle/governors/haltpoll.o
  CC      drivers/cpuidle/driver.o
  CC      lib/percpu_counter.o
  CC      drivers/acpi/ac.o
  CC      net/ipv4/esp4.o
  CC [M]  fs/smb/client/dns_resolve.o
  CC      mm/cma.o
  CC      drivers/opp/debugfs.o
  CC      drivers/mmc/core/core.o
  CC      lib/fault-inject.o
  AR      drivers/ufs/built-in.a
  CC      drivers/mmc/core/bus.o
  CC      drivers/thermal/thermal_trip.o
  AR      drivers/watchdog/built-in.a
  CC      net/ipv4/esp4_offload.o
  CC [M]  drivers/md/persistent-data/dm-transaction-manager.o
  CC      mm/secretmem.o
  CC      drivers/thermal/thermal_helpers.o
  CC      drivers/cpufreq/cpufreq_performance.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.o
  CC      lib/syscall.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/msgq.o
  LD [M]  drivers/ptp/ptp.o
  LD [M]  drivers/ptp/ptp_kvm.o
  CC [M]  drivers/net/phy/bcm-phy-lib.o
  CC      drivers/mmc/core/host.o
  CC [M]  drivers/gpu/drm/i915/gt/gen8_ppgtt.o
  CC [M]  drivers/gpu/drm/drm_dumb_buffers.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_breadcrumbs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.o
  ASN.1   fs/smb/client/cifs_spnego_negtokeninit.asn1.[ch]
  CC [M]  fs/smb/client/namespace.o
  CC      drivers/acpi/button.o
  CC [M]  fs/smb/client/smb1ops.o
  CC [M]  drivers/md/persistent-data/dm-btree.o
  AR      drivers/cpuidle/governors/built-in.a
  LD [M]  drivers/i2c/busses/i2c-designware-pci.o
  CC      lib/dynamic_debug.o
  CC      mm/userfaultfd.o
  AR      drivers/i2c/busses/built-in.a
  AR      drivers/i2c/built-in.a
  CC      lib/errname.o
  CC      mm/memremap.o
  CC [M]  fs/smb/client/cifssmb.o
  CC [M]  drivers/net/ethernet/intel/e1000e/netdev.o
  CC      net/ipv4/netfilter.o
  CC [M]  drivers/gpu/drm/xe/xe_huc.o
  CC      net/ipv4/inet_diag.o
  CC [M]  drivers/gpu/drm/xe/xe_huc_debugfs.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_context.o
  CC      drivers/usb/gadget/configfs.o
  CC      drivers/usb/gadget/u_f.o
  CC      drivers/mmc/host/sdhci.o
  CC      lib/nlattr.o
  CC      drivers/thermal/thermal_hwmon.o
  AR      drivers/opp/built-in.a
  CC      drivers/cpuidle/governor.o
  CC      lib/checksum.o
  CC      lib/cpu_rmap.o
  CC [M]  drivers/md/persistent-data/dm-btree-remove.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_main.o
  CC [M]  drivers/net/ethernet/intel/e1000e/ptp.o
  CC      drivers/mmc/host/sdhci-pci-core.o
  CC      mm/hmm.o
  CC      lib/dynamic_queue_limits.o
  CC      drivers/cpuidle/sysfs.o
  CC      fs/btrfs/send.o
  CC      net/sunrpc/rpc_pipe.o
  CC      drivers/cpufreq/cpufreq_ondemand.o
  CC      net/sunrpc/sysfs.o
  CC      drivers/acpi/fan_core.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/v1.o
  CC      drivers/mmc/core/mmc.o
  CC      lib/glob.o
  AR      drivers/net/ethernet/realtek/built-in.a
  CC [M]  drivers/net/ethernet/realtek/8139cp.o
  CC      net/ipv4/tcp_diag.o
  CC [M]  drivers/net/ethernet/realtek/8139too.o
  CC      drivers/acpi/fan_attr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.o
  AR      drivers/net/ethernet/renesas/built-in.a
  AR      drivers/net/ethernet/sfc/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_irq.o
  CC      drivers/thermal/gov_fair_share.o
  CC [M]  drivers/net/phy/broadcom.o
  CC      drivers/mmc/core/mmc_ops.o
  CC      drivers/mmc/core/sd.o
  CC [M]  drivers/gpu/drm/xe/xe_lrc.o
  AR      drivers/net/ethernet/smsc/built-in.a
  CC [M]  drivers/net/ethernet/smsc/smsc9420.o
  CC      mm/memfd.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_context_sseu.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_engine_cs.o
  CC      drivers/cpufreq/cpufreq_governor.o
  CC      drivers/cpuidle/poll_state.o
  CC      drivers/usb/host/xhci-hub.o
  CC [M]  drivers/md/persistent-data/dm-btree-spine.o
  CC      drivers/cpufreq/cpufreq_governor_attr_set.o
  CC      drivers/usb/host/xhci-dbg.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_engine_heartbeat.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_mca.o
  AR      drivers/net/ethernet/socionext/built-in.a
  CC      drivers/mmc/core/sd_ops.o
  CC      drivers/cpuidle/cpuidle-haltpoll.o
  AR      drivers/usb/gadget/built-in.a
  CC      drivers/acpi/processor_driver.o
  CC [M]  fs/smb/client/cifs_spnego_negtokeninit.asn1.o
  CC [M]  drivers/net/phy/lxt.o
  AR      drivers/net/ethernet/vertexcom/built-in.a
  CC      drivers/cpufreq/acpi-cpufreq.o
  CC      drivers/cpufreq/intel_pstate.o
  CC      drivers/thermal/gov_step_wise.o
  CC      drivers/thermal/gov_user_space.o
  CC [M]  drivers/gpu/drm/xe/xe_migrate.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/gm200.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_ethtool.o
  CC      lib/strncpy_from_user.o
  AR      drivers/net/ethernet/wangxun/built-in.a
  AR      drivers/leds/trigger/built-in.a
  CC [M]  drivers/leds/trigger/ledtrig-audio.o
  CC      lib/strnlen_user.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.o
  CC      net/sunrpc/svc_xprt.o
  CC      net/ipv4/udp_diag.o
  CC [M]  drivers/net/phy/realtek.o
  CC      net/ipv4/tcp_cubic.o
  CC [M]  drivers/gpu/drm/xe/xe_mmio.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_lsdma.o
  AR      drivers/firmware/arm_ffa/built-in.a
  CC      drivers/mmc/core/sdio.o
  AR      drivers/firmware/arm_scmi/built-in.a
  CC      lib/net_utils.o
  LD [M]  drivers/md/persistent-data/dm-persistent-data.o
  AR      drivers/firmware/broadcom/built-in.a
  AR      drivers/firmware/cirrus/built-in.a
  AR      drivers/crypto/stm32/built-in.a
  AR      drivers/firmware/meson/built-in.a
  CC      drivers/mmc/host/sdhci-pci-o2micro.o
  AR      drivers/crypto/xilinx/built-in.a
  AR      drivers/cpuidle/built-in.a
  AR      drivers/crypto/hisilicon/built-in.a
  CC      drivers/clocksource/acpi_pm.o
  CC      lib/sg_pool.o
  AR      drivers/crypto/intel/keembay/built-in.a
  AR      drivers/crypto/intel/ixp4xx/built-in.a
  AR      drivers/crypto/intel/built-in.a
  AR      drivers/crypto/starfive/built-in.a
  CC      drivers/firmware/efi/libstub/efi-stub-helper.o
  AR      drivers/thermal/built-in.a
  AR      drivers/crypto/built-in.a
  CC      drivers/firmware/efi/libstub/gop.o
  CC      drivers/acpi/processor_thermal.o
  AR      drivers/leds/blink/built-in.a
  CC      drivers/firmware/efi/libstub/secureboot.o
  CC      drivers/clocksource/i8253.o
  AR      drivers/leds/simple/built-in.a
  CC [M]  drivers/gpu/drm/i915/gt/intel_engine_pm.o
  CC      drivers/leds/led-core.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_engine_user.o
  CC      drivers/mmc/core/sdio_ops.o
  CC      drivers/md/md-bitmap.o
  CC      net/sunrpc/xprtmultipath.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_execlists_submission.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/gp102.o
  CC      net/sunrpc/stats.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_main.o
  CC      drivers/md/md-autodetect.o
  AR      drivers/net/ethernet/xilinx/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/tu102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/ga100.o
  CC [M]  drivers/net/ethernet/realtek/r8169_main.o
  CC [M]  drivers/net/ethernet/realtek/r8169_firmware.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.o
  CC      drivers/mmc/host/sdhci-pci-arasan.o
  CC      lib/stackdepot.o
  AR      drivers/clocksource/built-in.a
  AR      drivers/net/ethernet/synopsys/built-in.a
  AR      drivers/net/ethernet/pensando/built-in.a
  CC      lib/ucs2_string.o
  CC      drivers/mmc/host/sdhci-pci-dwc-mshc.o
  CC [M]  drivers/gpu/drm/xe/xe_mocs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.o
  CC [M]  drivers/net/phy/smsc.o
  CC      drivers/mmc/host/sdhci-pci-gli.o
  CC      drivers/acpi/processor_idle.o
  CC      drivers/md/dm-uevent.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/ga102.o
  CC      drivers/acpi/processor_throttling.o
  CC      drivers/acpi/processor_perflib.o
  CC      drivers/leds/led-class.o
  CC      drivers/firmware/efi/libstub/tpm.o
  CC      drivers/acpi/container.o
  CC      drivers/hid/usbhid/hid-core.o
  CC      drivers/usb/host/xhci-trace.o
  CC      drivers/mmc/core/sdio_bus.o
  CC      drivers/hid/usbhid/hiddev.o
  CC      drivers/mmc/core/sdio_cis.o
  CC      net/ipv4/xfrm4_policy.o
  AR      drivers/staging/media/built-in.a
  AR      drivers/staging/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.o
  CC      mm/bootmem_info.o
  CC      drivers/md/dm.o
  AR      drivers/platform/x86/amd/built-in.a
  CC [M]  drivers/gpu/drm/i915/gt/intel_ggtt.o
  CC      drivers/platform/x86/intel/pmc/core.o
  CC [M]  drivers/platform/x86/intel/pmt/class.o
  CC      drivers/platform/x86/intel/turbo_max_3.o
  CC      lib/sbitmap.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.o
  CC [M]  drivers/platform/x86/intel/pmt/telemetry.o
  AR      drivers/cpufreq/built-in.a
  CC      drivers/mailbox/mailbox.o
  CC      drivers/platform/x86/p2sb.o
  CC      drivers/mailbox/pcc.o
  CC      drivers/leds/led-triggers.o
  CC      net/ipv4/xfrm4_state.o
  CC      drivers/md/dm-table.o
  CC      lib/group_cpus.o
  CC      drivers/platform/x86/pmc_atom.o
  CC      net/sunrpc/sysctl.o
  CC      drivers/firmware/efi/libstub/file.o
  CC [M]  drivers/gpu/drm/xe/xe_module.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.o
  CC [M]  fs/smb/client/asn1.o
  CC      drivers/acpi/thermal.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.o
  AR      mm/built-in.a
  CC      drivers/mmc/host/sdhci-acpi.o
  LD [M]  drivers/net/phy/aquantia.o
  CC      drivers/mmc/core/sdio_io.o
  AR      drivers/net/phy/built-in.a
  CC [M]  drivers/net/ethernet/intel/igb/e1000_82575.o
  CC [M]  drivers/platform/x86/intel/pmt/crashlog.o
  CC [M]  drivers/platform/x86/wmi.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_mac.o
  CC [M]  drivers/platform/x86/wmi-bmof.o
  CC      drivers/firmware/efi/efi-bgrt.o
  CC      drivers/firmware/efi/efi.o
  CC      drivers/mmc/core/sdio_irq.o
  CC      drivers/platform/x86/intel/pmc/core_ssram.o
  CC      drivers/firmware/efi/libstub/mem.o
  LD [M]  drivers/platform/x86/intel/pmt/pmt_class.o
  CC      drivers/acpi/acpi_memhotplug.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm20b.o
  CC      lib/fw_table.o
  CC [M]  lib/asn1_decoder.o
  CC      drivers/usb/host/xhci-debugfs.o
  CC      drivers/md/dm-target.o
  GEN     lib/oid_registry_data.c
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.o
  LD [M]  drivers/platform/x86/intel/pmt/pmt_telemetry.o
  AR      drivers/mailbox/built-in.a
  CC      drivers/firmware/efi/libstub/random.o
  CC      drivers/mmc/host/cqhci-core.o
  CC [M]  drivers/gpu/drm/xe/xe_pat.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp108.o
  AR      drivers/leds/built-in.a
  AR      net/sunrpc/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_pci.o
  CC      net/ipv4/xfrm4_input.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gv100.o
  CC      drivers/md/dm-linear.o
  CC [M]  drivers/platform/x86/mxm-wmi.o
  CC      net/ipv4/xfrm4_output.o
  CC      drivers/usb/host/xhci-pci.o
  LD [M]  drivers/net/ethernet/intel/e1000e/e1000e.o
  CC      drivers/firmware/efi/vars.o
  AR      drivers/hid/usbhid/built-in.a
  CC      drivers/hid/hid-core.o
  CC      drivers/hid/hid-input.o
  CC [M]  drivers/gpu/drm/xe/xe_pcode.o
  CC      drivers/hid/hid-quirks.o
  CC [M]  drivers/gpu/drm/xe/xe_pm.o
  LD [M]  drivers/platform/x86/intel/pmt/pmt_crashlog.o
  CC      drivers/platform/x86/intel/pmc/spt.o
  CC [M]  drivers/platform/x86/intel_ips.o
  CC      drivers/acpi/ioapic.o
  CC      drivers/platform/x86/intel/pmc/cnp.o
  CC      net/ipv4/xfrm4_protocol.o
  CC      drivers/hid/hid-debug.o
  CC [M]  net/ipv4/ip_tunnel.o
  CC      drivers/devfreq/devfreq.o
  CC      fs/btrfs/dev-replace.o
  CC      drivers/acpi/battery.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.o
  CC      drivers/mmc/core/slot-gpio.o
  CC [M]  lib/oid_registry.o
  CC [M]  drivers/devfreq/governor_simpleondemand.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp10b.o
  LD [M]  fs/smb/client/cifs.o
  CC      drivers/firmware/efi/libstub/randomalloc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/tu102.o
  CC [M]  drivers/gpu/drm/drm_edid.o
  AR      drivers/firmware/imx/built-in.a
  CC [M]  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.o
  CC      drivers/firmware/efi/reboot.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga100.o
  CC      drivers/powercap/powercap_sys.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/cik.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_mac.o
  AR      drivers/perf/built-in.a
  CC [M]  drivers/net/ethernet/intel/igc/igc_i225.o
  CC      drivers/firmware/efi/memattr.o
  CC [M]  drivers/devfreq/governor_performance.o
  AR      drivers/firmware/psci/built-in.a
  CC      drivers/powercap/intel_rapl_common.o
  CC      fs/exec.o
  CC      drivers/platform/x86/intel/pmc/icl.o
  CC [M]  drivers/net/ethernet/realtek/r8169_phy_config.o
  CC      drivers/ras/ras.o
  CC      drivers/hid/hidraw.o
  CC      drivers/ras/debugfs.o
  CC      drivers/powercap/intel_rapl_msr.o
  CC      drivers/md/dm-stripe.o
  CC      drivers/firmware/efi/libstub/pci.o
  CC      drivers/firmware/efi/tpm.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_nvm.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt.o
  AR      lib/lib.a
  GEN     lib/crc32table.h
  CC      lib/crc32.o
  CC [M]  drivers/gpu/drm/xe/xe_preempt_fence.o
  CC      drivers/mmc/core/regulator.o
  CC      drivers/hid/hid-generic.o
  CC [M]  drivers/gpu/drm/xe/xe_pt.o
  CC [M]  drivers/mmc/host/sdhci-pltfm.o
  AR      drivers/hwtracing/intel_th/built-in.a
  CC [M]  drivers/net/ethernet/intel/igb/e1000_phy.o
  CC      drivers/android/binderfs.o
  CC      drivers/firmware/efi/memmap.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_mbx.o
  CC      drivers/hid/hid-a4tech.o
  AR      drivers/usb/host/built-in.a
  AR      drivers/usb/built-in.a
  AR      drivers/nvmem/layouts/built-in.a
  CC      drivers/nvmem/core.o
  CC      drivers/firmware/efi/libstub/skip_spaces.o
  CC [M]  drivers/gpu/drm/xe/xe_pt_walk.o
  CC [M]  drivers/mtd/chips/chipreg.o
  CC      drivers/firmware/efi/libstub/lib-cmdline.o
  CC      drivers/firmware/efi/esrt.o
  CC      drivers/firmware/efi/libstub/lib-ctype.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_i210.o
  CC      drivers/platform/x86/intel/pmc/tgl.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/cik_ih.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/dce_v8_0.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.o
  CC [M]  drivers/gpu/drm/xe/xe_query.o
  CC      drivers/acpi/hed.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.o
  CC      drivers/hid/hid-apple.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_base.o
  CC [M]  drivers/gpu/drm/drm_eld.o
  CC      drivers/md/dm-ioctl.o
  CC      drivers/firmware/efi/libstub/alignedmem.o
  CC      drivers/platform/x86/intel/pmc/adl.o
  AR      lib/built-in.a
  CC      drivers/platform/x86/intel/pmc/mtl.o
  LD [M]  drivers/net/ethernet/realtek/r8169.o
  CC      drivers/mmc/core/debugfs.o
  CC [M]  drivers/uio/uio.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.o
  CC      drivers/mmc/core/block.o
  CC      drivers/md/dm-io.o
  CC      drivers/md/dm-kcopyd.o
  AR      drivers/devfreq/built-in.a
  CC      drivers/platform/x86/intel/pmc/pltdrv.o
  AR      drivers/ras/built-in.a
  CC      drivers/acpi/bgrt.o
  AR      drivers/mmc/host/built-in.a
  CC [M]  drivers/platform/x86/intel/vsec.o
  CC [M]  drivers/vfio/pci/vfio_pci_core.o
  CC [M]  drivers/gpu/drm/xe/xe_range_fence.o
  CC      fs/btrfs/raid56.o
  CC [M]  drivers/pps/pps.o
  CC [M]  drivers/pps/kapi.o
  AR      drivers/powercap/built-in.a
  CC [M]  drivers/bluetooth/btusb.o
  CC [M]  drivers/vfio/pci/vfio_pci_intrs.o
  CC      drivers/md/dm-sysfs.o
  CC [M]  drivers/vfio/pci/vfio_pci_rdwr.o
  CC      drivers/md/dm-stats.o
  CC [M]  drivers/vfio/pci/vfio_pci_config.o
  CC [M]  drivers/mtd/mtdcore.o
  AR      drivers/platform/surface/built-in.a
  CC      drivers/android/binder.o
  CC [M]  drivers/dca/dca-core.o
  CC      drivers/android/binder_alloc.o
  CC      drivers/firmware/efi/efi-pstore.o
  CC [M]  drivers/pps/sysfs.o
  CC [M]  drivers/gpu/drm/drm_encoder.o
  CC      drivers/acpi/cppc_acpi.o
  CC      drivers/firmware/efi/libstub/relocate.o
  AR      drivers/nvmem/built-in.a
  CC [M]  drivers/gpu/drm/drm_file.o
  CC [M]  drivers/platform/x86/intel/rst.o
  CC      drivers/hid/hid-belkin.o
  CC [M]  drivers/mtd/mtdsuper.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_ptp.o
  AR      drivers/platform/x86/intel/pmc/built-in.a
  CC [M]  drivers/net/ethernet/intel/igb/igb_hwmon.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/cik_sdma.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_sr.o
  CC      drivers/acpi/spcr.o
  CC [M]  net/ipv4/udp_tunnel_core.o
  CC [M]  drivers/mtd/mtdconcat.o
  AR      drivers/platform/x86/intel/built-in.a
  CC [M]  net/ipv4/udp_tunnel_nic.o
  AR      drivers/firmware/qcom/built-in.a
  AR      drivers/firmware/smccc/built-in.a
  CC [M]  drivers/mtd/mtdpart.o
  CC      drivers/acpi/acpi_pad.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/base.o
  CC      drivers/firmware/efi/cper.o
  CC [M]  drivers/ssb/main.o
  CC [M]  drivers/ssb/scan.o
  CC      drivers/firmware/efi/cper_cxl.o
  CC      drivers/firmware/efi/runtime-wrappers.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_nvm.o
  LD [M]  drivers/pps/pps_core.o
  CC [M]  drivers/vhost/net.o
  CC [M]  drivers/vhost/vhost.o
  CC      drivers/firmware/efi/dev-path-parser.o
  CC      drivers/md/dm-rq.o
  CC [M]  drivers/vhost/iotlb.o
  CC [M]  drivers/dca/dca-sysfs.o
  CC      drivers/md/dm-io-rewind.o
  CC      drivers/firmware/efi/libstub/printk.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_whitelist.o
  CC      drivers/md/dm-builtin.o
  CC      fs/pipe.o
  LD [M]  drivers/platform/x86/intel/intel_vsec.o
  CC      drivers/firmware/efi/libstub/vsprintf.o
  LD [M]  drivers/platform/x86/intel/intel-rst.o
  AR      drivers/platform/x86/built-in.a
  AR      drivers/platform/built-in.a
  CC      drivers/firmware/efi/libstub/x86-stub.o
  CC      drivers/firmware/efi/apple-properties.o
  CC [M]  drivers/vfio/vfio_main.o
  CC [M]  drivers/ssb/sprom.o
  CC      fs/namei.o
  CC      drivers/hid/hid-cherry.o
  CC      drivers/firmware/efi/libstub/x86-5lvl.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/uvd_v4_2.o
  CC [M]  drivers/mtd/mtdchar.o
  AR      net/ipv4/built-in.a
  CC [M]  drivers/ssb/pci.o
  CC      drivers/hid/hid-chicony.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/nv50.o
  CC      drivers/hid/hid-cypress.o
  CC [M]  drivers/vfio/group.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_phy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vce_v2_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/g84.o
  LD [M]  drivers/dca/dca.o
  CC [M]  drivers/ssb/pcihost_wrapper.o
  CC [M]  drivers/vfio/container.o
  CC [M]  drivers/gpu/drm/xe/xe_rtp.o
  CC [M]  drivers/vfio/virqfd.o
  CC [M]  drivers/md/dm-bufio.o
  CC [M]  drivers/vfio/pci/vfio_pci.o
  CC [M]  drivers/net/ethernet/intel/igbvf/vf.o
  CC [M]  drivers/acpi/acpi_video.o
  CC [M]  drivers/gpu/drm/xe/xe_ring_ops.o
  CC [M]  drivers/acpi/video_detect.o
  STUBCPY drivers/firmware/efi/libstub/alignedmem.stub.o
  CC      drivers/firmware/efi/earlycon.o
  STUBCPY drivers/firmware/efi/libstub/efi-stub-helper.stub.o
  CC      drivers/firmware/efi/cper-x86.o
  STUBCPY drivers/firmware/efi/libstub/file.stub.o
  CC [M]  drivers/md/dm-bio-prison-v1.o
  CC [M]  drivers/gpu/drm/drm_fourcc.o
  CC [M]  drivers/ssb/driver_chipcommon.o
  CC [M]  drivers/gpu/drm/drm_framebuffer.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_diag.o
  CC      drivers/mmc/core/queue.o
  CC [M]  drivers/md/dm-bio-prison-v2.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_ethtool.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_ptp.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_dump.o
  AR      drivers/firmware/tegra/built-in.a
  AR      drivers/firmware/xilinx/built-in.a
  CC [M]  drivers/gpu/drm/drm_gem.o
  CC      drivers/firmware/dmi_scan.o
  STUBCPY drivers/firmware/efi/libstub/gop.stub.o
  STUBCPY drivers/firmware/efi/libstub/lib-cmdline.stub.o
  STUBCPY drivers/firmware/efi/libstub/lib-ctype.stub.o
  STUBCPY drivers/firmware/efi/libstub/mem.stub.o
  LD [M]  drivers/net/ethernet/intel/igb/igb.o
  STUBCPY drivers/firmware/efi/libstub/pci.stub.o
  STUBCPY drivers/firmware/efi/libstub/printk.stub.o
  CC [M]  drivers/bluetooth/btintel.o
  STUBCPY drivers/firmware/efi/libstub/random.stub.o
  STUBCPY drivers/firmware/efi/libstub/randomalloc.stub.o
  STUBCPY drivers/firmware/efi/libstub/relocate.stub.o
  CC [M]  drivers/gpu/drm/drm_ioctl.o
  STUBCPY drivers/firmware/efi/libstub/secureboot.stub.o
  STUBCPY drivers/firmware/efi/libstub/skip_spaces.stub.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_tsn.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_clock_utils.o
  LD [M]  net/ipv4/udp_tunnel.o
  STUBCPY drivers/firmware/efi/libstub/tpm.stub.o
  STUBCPY drivers/firmware/efi/libstub/vsprintf.stub.o
  AR      net/built-in.a
  STUBCPY drivers/firmware/efi/libstub/x86-5lvl.stub.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_xdp.o
  CC      drivers/hid/hid-ezkey.o
  STUBCPY drivers/firmware/efi/libstub/x86-stub.stub.o
  AR      drivers/firmware/efi/libstub/lib.a
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_debugfs.o
  LD [M]  drivers/vfio/pci/vfio-pci-core.o
  LD [M]  drivers/vfio/pci/vfio-pci.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/si.o
  CC      drivers/firmware/dmi-sysfs.o
  CC      drivers/hid/hid-kensington.o
  CC [M]  drivers/ssb/driver_chipcommon_pmu.o
  CC [M]  drivers/gpu/drm/xe/xe_sa.o
  CC      fs/btrfs/uuid-tree.o
  CC [M]  drivers/gpu/drm/xe/xe_sched_job.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_irq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.o
  AR      drivers/firmware/efi/built-in.a
  CC      fs/btrfs/props.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/gk20a.o
  CC [M]  drivers/bluetooth/btbcm.o
  CC      fs/fcntl.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_mcr.o
  CC [M]  drivers/vfio/vfio_iommu_type1.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/gm107.o
  CC [M]  drivers/net/ethernet/intel/igbvf/mbx.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_main.o
  CC [M]  drivers/md/dm-crypt.o
  LD [M]  drivers/mtd/mtd.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_common.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/vf.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/mbx.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/ethtool.o
  CC [M]  drivers/ssb/driver_pcicore.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/gm20b.o
  AR      drivers/mmc/core/built-in.a
  AR      drivers/mmc/built-in.a
  CC      fs/ioctl.o
  LD [M]  drivers/vhost/vhost_iotlb.o
  LD [M]  drivers/vhost/vhost_net.o
  CC      fs/btrfs/free-space-tree.o
  AR      drivers/acpi/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v6_0.o
  CC      fs/readdir.o
  CC [M]  drivers/gpu/drm/drm_lease.o
  CC [M]  drivers/gpu/drm/drm_managed.o
  CC      drivers/firmware/dmi-id.o
  CC      drivers/hid/hid-lg.o
  CC      drivers/hid/hid-lg-g15.o
  LD [M]  drivers/acpi/video.o
  CC [M]  drivers/gpu/drm/drm_mm.o
  CC      drivers/hid/hid-microsoft.o
  CC      fs/select.o
  CC      drivers/hid/hid-monterey.o
  CC      fs/dcache.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_pm.o
  CC [M]  drivers/net/ethernet/intel/igbvf/ethtool.o
  CC [M]  drivers/net/ethernet/intel/igbvf/netdev.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/ipsec.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/tu102.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_pm_irq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.o
  CC      fs/inode.o
  CC [M]  drivers/gpu/drm/drm_mode_config.o
  CC [M]  drivers/gpu/drm/drm_mode_object.o
  LD [M]  drivers/ssb/ssb.o
  CC [M]  drivers/gpu/drm/xe/xe_step.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_82599.o
  AR      drivers/net/ethernet/intel/built-in.a
  CC      fs/btrfs/tree-checker.o
  CC      fs/attr.o
  CC      drivers/firmware/memmap.o
  LD [M]  drivers/net/ethernet/intel/igc/igc.o
  CC [M]  drivers/net/ethernet/intel/e100.o
  CC      fs/btrfs/space-info.o
  CC      fs/btrfs/block-rsv.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_requests.o
  CC      fs/btrfs/delalloc-space.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_sysfs.o
  CC [M]  drivers/gpu/drm/drm_modes.o
  CC [M]  drivers/gpu/drm/xe/xe_sync.o
  CC [M]  drivers/gpu/drm/xe/xe_tile.o
  CC      fs/bad_inode.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v6_0.o
  CC      fs/file.o
  CC [M]  drivers/md/dm-thin.o
  CC [M]  drivers/md/dm-thin-metadata.o
  LD [M]  drivers/md/dm-bio-prison.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.o
  LD [M]  drivers/vfio/vfio.o
  AR      drivers/md/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/bit.o
  CC [M]  drivers/bluetooth/btrtl.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/si_ih.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/si_dma.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/boost.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.o
  CC      fs/filesystems.o
  CC      fs/btrfs/block-group.o
  AR      drivers/hid/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/conn.o
  AR      drivers/firmware/built-in.a
  CC      fs/btrfs/discard.o
  CC      fs/btrfs/reflink.o
  CC [M]  drivers/gpu/drm/drm_modeset_lock.o
  CC [M]  drivers/gpu/drm/drm_plane.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gtt.o
  CC [M]  drivers/gpu/drm/drm_prime.o
  CC      fs/namespace.o
  CC      fs/seq_file.o
  CC      fs/btrfs/subpage.o
  CC [M]  drivers/gpu/drm/xe/xe_tile_sysfs.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_llc.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_lrc.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_migrate.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_mocs.o
  CC [M]  drivers/gpu/drm/xe/xe_trace.o
  AR      drivers/android/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_ttm_sys_mgr.o
  CC      fs/xattr.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_ppgtt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/cstep.o
  CC      fs/libfs.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_82598.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_phy.o
  CC      fs/fs-writeback.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/dcb.o
  CC      fs/pnode.o
  CC      fs/btrfs/tree-mod-log.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/disp.o
  CC      fs/btrfs/extent-io-tree.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/dp.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_rc6.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_vram_mgr.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_mbx.o
  CC [M]  drivers/gpu/drm/drm_print.o
  CC [M]  drivers/gpu/drm/drm_property.o
  CC      fs/btrfs/fs.o
  CC      fs/splice.o
  LD [M]  drivers/net/ethernet/intel/igbvf/igbvf.o
  CC      fs/sync.o
  CC      fs/utimes.o
  CC      fs/btrfs/messages.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_region_lmem.o
  CC      fs/btrfs/bio.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_renderstate.o
  CC      fs/d_path.o
  CC      fs/stack.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_x540.o
  CC [M]  drivers/gpu/drm/xe/xe_tuning.o
  CC      fs/btrfs/lru_cache.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/dce_v6_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/extdev.o
  CC      fs/btrfs/raid-stripe-tree.o
  CC      fs/fs_struct.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_reset.o
  CC [M]  drivers/gpu/drm/drm_syncobj.o
  LD [M]  drivers/net/ethernet/intel/ixgbevf/ixgbevf.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/fan.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/gpio.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_ring.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_x550.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_lib.o
  CC      fs/btrfs/acl.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_ptp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/i2c.o
  CC      fs/statfs.o
  CC [M]  drivers/gpu/drm/xe/xe_uc.o
  LD [M]  drivers/md/dm-thin-pool.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_xsk.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/uvd_v3_1.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb_82598.o
  CC      fs/fs_pin.o
  CC [M]  drivers/gpu/drm/xe/xe_uc_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_uc_fw.o
  CC      fs/nsfs.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb_82599.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb_nl.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_sysfs.o
  CC      fs/fs_types.o
  CC      fs/fs_context.o
  CC      fs/fs_parser.o
  CC      fs/fsopen.o
  CC [M]  drivers/gpu/drm/xe/xe_vm.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_ring_submission.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/image.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_debugfs.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_rps.o
  CC [M]  drivers/gpu/drm/xe/xe_vram_freq.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_ipsec.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.o
  CC      fs/init.o
  CC [M]  drivers/gpu/drm/drm_sysfs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/mxm.o
  CC      fs/kernel_read_file.o
  CC [M]  drivers/gpu/drm/xe/xe_wait_user_fence.o
  CC      fs/mnt_idmapping.o
  CC      fs/remap_range.o
  CC      fs/buffer.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/npde.o
  CC [M]  drivers/gpu/drm/xe/xe_wa.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_sa_media.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_sseu.o
  CC      fs/mpage.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_sseu_debugfs.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_timeline.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/pcir.o
  CC      fs/proc_namespace.o
  CC      fs/direct-io.o
  AR      fs/btrfs/built-in.a
  CC      fs/eventpoll.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/perf.o
  CC      fs/anon_inodes.o
  CC      fs/signalfd.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_tlb.o
  CC      fs/timerfd.o
  CC [M]  drivers/gpu/drm/drm_trace_points.o
  CC      fs/eventfd.o
  CC [M]  drivers/gpu/drm/drm_vblank.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mxgpu_vi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v6_1.o
  CC      fs/userfaultfd.o
  CC [M]  drivers/gpu/drm/xe/xe_wopcm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/soc15.o
  CC [M]  drivers/gpu/drm/drm_vblank_work.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/power_budget.o
  CC      fs/aio.o
  CC      fs/locks.o
  CC [M]  drivers/gpu/drm/xe/xe_hwmon.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_relay.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/emu_soc.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_wopcm.o
  CC [M]  drivers/gpu/drm/drm_vma_manager.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/ramcfg.o
  CC [M]  drivers/gpu/drm/xe/xe_memirq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mxgpu_ai.o
  CC      fs/binfmt_script.o
  CC      fs/binfmt_elf.o
  CC      fs/compat_binfmt_elf.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_workarounds.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/rammap.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.o
  CC      fs/mbcache.o
  CC [M]  drivers/gpu/drm/drm_writeback.o
  CC [M]  drivers/gpu/drm/i915/gt/shmem_utils.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowacpi.o
  CC [M]  drivers/gpu/drm/i915/gt/sysfs_engines.o
  CC      fs/posix_acl.o
  CC [M]  drivers/gpu/drm/lib/drm_random.o
  CC [M]  drivers/gpu/drm/xe/xe_sriov.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowramin.o
  CC [M]  drivers/gpu/drm/drm_ioc32.o
  CC      fs/coredump.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.o
  CC      fs/drop_caches.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/timing.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_ggtt_gmch.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.o
  CC      fs/sysctls.o
  CC [M]  drivers/gpu/drm/i915/gt/gen6_renderstate.o
  CC [M]  drivers/gpu/drm/drm_panel.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vega10_reg_init.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vega20_reg_init.o
  CC [M]  drivers/gpu/drm/i915/gt/gen7_renderstate.o
  LD [M]  drivers/net/ethernet/intel/ixgbe/ixgbe.o
  CC      fs/fhandle.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/vmap.o
  CC [M]  drivers/gpu/drm/drm_pci.o
  CC [M]  drivers/gpu/drm/drm_debugfs.o
  CC [M]  drivers/gpu/drm/i915/gt/gen8_renderstate.o
  CC [M]  drivers/gpu/drm/i915/gt/gen9_renderstate.o
  AR      drivers/net/ethernet/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_lmtt.o
  AR      drivers/net/built-in.a
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_busy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_4.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_clflush.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v2_3.o
  CC [M]  drivers/gpu/drm/xe/xe_lmtt_2l.o
  CC [M]  drivers/gpu/drm/xe/xe_lmtt_ml.o
  CC [M]  drivers/gpu/drm/drm_debugfs_crc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nv.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/volt.o
  CC [M]  drivers/gpu/drm/drm_edid_load.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/vpstate.o
  CC [M]  drivers/gpu/drm/xe/xe_display.o
  CC [M]  drivers/gpu/drm/xe/display/xe_fb_pin.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/xpio.o
  CC [M]  drivers/gpu/drm/xe/display/xe_hdcp_gsc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/arct_reg_init.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_context.o
  CC [M]  drivers/gpu/drm/xe/display/xe_plane_initial.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/M0203.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_create.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/M0205.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/M0209.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_domain.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_rps.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_internal.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/P0260.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_lmem.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mxgpu_nv.o
  CC [M]  drivers/gpu/drm/drm_panel_orientation_quirks.o
  CC [M]  drivers/gpu/drm/drm_exec.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/base.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_mman.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_2.o
  CC [M]  drivers/gpu/drm/drm_gpuvm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/hwsq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v4_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v5_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/aldebaran_reg_init.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_object.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.o
  CC [M]  drivers/gpu/drm/drm_buddy.o
  CC [M]  drivers/gpu/drm/drm_gem_shmem_helper.o
  CC [M]  drivers/gpu/drm/drm_suballoc.o
  CC [M]  drivers/gpu/drm/drm_gem_ttm_helper.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/aldebaran.o
  AR      fs/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/g94.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.o
  CC [M]  drivers/gpu/drm/drm_atomic_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/soc21.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_pages.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_phys.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv04.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv40.o
  CC [M]  drivers/gpu/drm/drm_atomic_state_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sienna_cichlid.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_pm.o
  CC [M]  drivers/gpu/drm/drm_bridge_connector.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_region.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_misc.o
  CC [M]  drivers/gpu/drm/xe/display/xe_dsb_buffer.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.o
  CC [M]  drivers/gpu/drm/xe/display/intel_fbdev_fb.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v4_3.o
  CC [M]  drivers/gpu/drm/xe/display/intel_fb_bo.o
  CC [M]  drivers/gpu/drm/drm_crtc_helper.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_shmem.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_shrinker.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/g84.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_stolen.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.o
  CC [M]  drivers/gpu/drm/drm_damage_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v6_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_7.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v5_2.o
  CC [M]  drivers/gpu/drm/drm_encoder_slave.o
  CC [M]  drivers/gpu/drm/drm_flip_work.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_throttle.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.o
  CC [M]  drivers/gpu/drm/drm_format_helper.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk104.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_tiling.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/lsdma_v6_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_9.o
  CC [M]  drivers/gpu/drm/drm_gem_atomic_helper.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/pllnv04.o
  CC [M]  drivers/gpu/drm/drm_gem_framebuffer_helper.o
  CC [M]  drivers/gpu/drm/drm_kms_helper_common.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.o
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_irq.o
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_utils.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_11.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/pllgt215.o
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_dram.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_ttm.o
  CC [M]  drivers/gpu/drm/drm_modeset_helper.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/df_v1_7.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/df_v3_6.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.o
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_pch.o
  CC [M]  drivers/gpu/drm/xe/i915-display/icl_dsi.o
  CC [M]  drivers/gpu/drm/drm_plane_helper.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv05.o
  CC [M]  drivers/gpu/drm/drm_probe_helper.o
  CC [M]  drivers/gpu/drm/drm_rect.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv10.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.o
  CC [M]  drivers/gpu/drm/drm_self_refresh_helper.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv1a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/df_v4_3.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/df_v4_6_2.o
  CC [M]  drivers/gpu/drm/drm_simple_kms_helper.o
  CC [M]  drivers/gpu/drm/bridge/panel.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv20.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_userptr.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_wait.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gemfs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g84.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic_plane.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v7_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_audio.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.o
  CC [M]  drivers/gpu/drm/drm_fbdev_generic.o
  CC [M]  drivers/gpu/drm/drm_fb_helper.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.o
  CC [M]  drivers/gpu/drm/i915/i915_active.o
  CC [M]  drivers/gpu/drm/i915/i915_cmd_parser.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.o
  CC [M]  drivers/gpu/drm/i915/i915_deps.o
  LD [M]  drivers/gpu/drm/drm.o
  LD [M]  drivers/gpu/drm/drm_shmem_helper.o
  LD [M]  drivers/gpu/drm/drm_suballoc_helper.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_backlight.o
  CC [M]  drivers/gpu/drm/i915/i915_gem.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bios.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.o
  LD [M]  drivers/gpu/drm/drm_ttm_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.o
  AR      drivers/gpu/drm/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.o
  CC [M]  drivers/gpu/drm/i915/i915_gem_evict.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bw.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gv100.o
  CC [M]  drivers/gpu/drm/i915/i915_gem_gtt.o
  CC [M]  drivers/gpu/drm/i915/i915_gem_ww.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cdclk.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_color.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/ga100.o
  CC [M]  drivers/gpu/drm/i915/i915_query.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.o
  CC [M]  drivers/gpu/drm/i915/i915_request.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.o
  CC [M]  drivers/gpu/drm/i915/i915_scheduler.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.o
  CC [M]  drivers/gpu/drm/i915/i915_trace_points.o
  CC [M]  drivers/gpu/drm/i915/i915_ttm_buddy_manager.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_combo_phy.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp10b.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.o
  CC [M]  drivers/gpu/drm/i915/i915_vma.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/tu102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.o
  CC [M]  drivers/gpu/drm/i915/i915_vma_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv04.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv10.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv1a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv20.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv25.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv30.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_connector.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv35.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.o
  LD [M]  drivers/gpu/drm/drm_kms_helper.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv36.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv40.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv41.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv44.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv46.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv47.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv49.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv4e.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/g84.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc_state_dump.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gt215.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cursor.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cx0_phy.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/mcp77.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/mcp89.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v11_5_0.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_capture.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi_buf_trans.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk20a.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_log.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v6_0.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v6_1.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm20b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v6_7.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v8_7.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs_params.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp10b.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_huc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v8_10.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v12_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_device.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_driver.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/r535.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_irq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ih.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_params.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/iceland_ih.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_huc_fw.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_uc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/tonga_ih.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv10.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/cz_ih.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_map.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gsc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv1a.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv20.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vega10_ih.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vega20_ih.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/navi10_ih.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv40.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_well.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/ih_v6_0.o
  CC [M]  drivers/gpu/drm/i915/i915_hwmon.o
  CC [M]  drivers/gpu/drm/i915/display/hsw_ips.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv41.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/ih_v6_1.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_trace.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv44.o
  CC [M]  drivers/gpu/drm/i915/display/i9xx_plane.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv49.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv4e.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v3_1.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_wa.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dkl_phy.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv50.o
  CC [M]  drivers/gpu/drm/i915/display/i9xx_wm.o
  CC [M]  drivers/gpu/drm/i915/display/intel_atomic.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/rammcp77.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v10_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dmc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v11_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.o
  CC [M]  drivers/gpu/drm/i915/display/intel_atomic_plane.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v11_0_8.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v12_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v13_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/dce_v10_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_aux.o
  CC [M]  drivers/gpu/drm/i915/display/intel_audio.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/dce_v11_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr2.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr3.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_aux_backlight.o
  CC [M]  drivers/gpu/drm/i915/display/intel_bios.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_hdcp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr3.o
  CC [M]  drivers/gpu/drm/i915/display/intel_bw.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr5.o
  CC [M]  drivers/gpu/drm/i915/display/intel_cdclk.o
  CC [M]  drivers/gpu/drm/i915/display/intel_color.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_link_training.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fuse/base.o
  CC [M]  drivers/gpu/drm/i915/display/intel_combo_phy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v8_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fuse/nv50.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_mst.o
  CC [M]  drivers/gpu/drm/i915/display/intel_connector.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v9_4.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fuse/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fuse/gm107.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpll.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpll_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/nv10.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpt_common.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/imu_v11_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/nv50.o
  CC [M]  drivers/gpu/drm/i915/display/intel_crtc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/g94.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_drrs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gf119.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsb.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gk104.o
  CC [M]  drivers/gpu/drm/i915/display/intel_crtc_state_dump.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/ga102.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_dcs_backlight.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.o
  CC [M]  drivers/gpu/drm/i915/display/intel_cursor.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_vbt.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fb.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_driver.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fbc.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_irq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_params.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v4_4.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fdi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fifo_underrun.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_frontbuffer.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_power.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_global_state.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_gmbus.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdcp.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdmi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv04.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_power_map.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv4e.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_power_well.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_reset.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/g94.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_rps.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gf117.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_wa.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dmc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hotplug.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gf119.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dpio_phy.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dpll.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gk104.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hotplug_irq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dpll_mgr.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dpt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gk110.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hti.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_link_bw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_lspcon.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/pad.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padnv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mes_v10_1.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padnv4e.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_lock.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_setup.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padnv50.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_verify.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mes_v11_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_panel.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dpt_common.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pipe_crc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pmdemand.o
  CC [M]  drivers/gpu/drm/i915/display/intel_drrs.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dsb.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dsb_buffer.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/uvd_v5_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pps.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_psr.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_qp_tables.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv4e.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fb.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv50.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fb_bo.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_quirks.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_snps_phy.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fb_pin.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fbc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bit.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fdi.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fifo_underrun.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_tc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vblank.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vdsc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vga.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vrr.o
  CC [M]  drivers/gpu/drm/i915/display/intel_frontbuffer.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.o
  CC [M]  drivers/gpu/drm/i915/display/intel_global_state.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hdcp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_wm.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hdcp_gsc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vce_v3_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_scaler.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vce_v4_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_sw_ring.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v1_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hotplug.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hotplug_irq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v2_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hti.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v2_5.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v3_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_universal_plane.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_watermark.o
  CC [M]  drivers/gpu/drm/i915/display/intel_link_bw.o
  CC [M]  drivers/gpu/drm/i915/display/intel_load_detect.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv40.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_acpi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v4_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_opregion.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.o
  CC [M]  drivers/gpu/drm/i915/display/intel_lpe_audio.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gm107.o
  CC [M]  drivers/gpu/drm/i915/display/intel_modeset_lock.o
  CC [M]  drivers/gpu/drm/i915/display/intel_modeset_setup.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gm200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp100.o
  CC [M]  drivers/gpu/drm/i915/display/intel_modeset_verify.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_overlay.o
  CC [M]  drivers/gpu/drm/i915/display/intel_pch_display.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.o
  CC [M]  drivers/gpu/drm/i915/display/intel_pch_refclk.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp102.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fbdev.o
  CC [M]  drivers/gpu/drm/i915/display/intel_plane_initial.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_kunit_helpers.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/ga102.o
  CC [M]  drivers/gpu/drm/i915/display/intel_pmdemand.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv04.o
  CC [M]  drivers/gpu/drm/i915/display/intel_psr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv11.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv17.o
  CC [M]  drivers/gpu/drm/i915/display/intel_quirks.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv44.o
  CC [M]  drivers/gpu/drm/xe/xe_guc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/g84.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_klvs_abi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/g98.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gt215.o
  HDRTEST drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_errors_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
  CC [M]  drivers/gpu/drm/i915/display/intel_sprite.o
  CC [M]  drivers/gpu/drm/i915/display/intel_sprite_uapi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h
  CC [M]  drivers/gpu/drm/i915/display/intel_tc.o
  HDRTEST drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_relay_communication_abi.h
  CC [M]  drivers/gpu/drm/i915/display/intel_vblank.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_communication_mmio_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_messages_abi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gf100.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h
  CC [M]  drivers/gpu/drm/i915/display/intel_vga.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h
  CC [M]  drivers/gpu/drm/i915/display/intel_wm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gk104.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h
  CC [M]  drivers/gpu/drm/i915/display/skl_scaler.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vpe_v6_1.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp100.o
  CC [M]  drivers/gpu/drm/i915/display/skl_universal_plane.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp10b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.o
  CC [M]  drivers/gpu/drm/i915/display/skl_watermark.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv04.o
  CC [M]  drivers/gpu/drm/i915/display/intel_acpi.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h
  CC [M]  drivers/gpu/drm/i915/display/intel_opregion.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv41.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv44.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_trace.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_active_types.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_config.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
  CC [M]  drivers/gpu/drm/i915/display/intel_fbdev.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/athub_v1_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/athub_v2_0.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/athub_v2_1.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/athub_v3_0.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_debugfs.h
  CC [M]  drivers/gpu/drm/i915/display/intel_fbdev_fb.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v9_0.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/soc/intel_gmch.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
  CC [M]  drivers/gpu/drm/i915/display/intel_display_debugfs.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
  CC [M]  drivers/gpu/drm/i915/display/intel_display_debugfs_params.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv50.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mman.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/g84.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v11_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mcp77.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gt/intel_rps.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
  CC [M]  drivers/gpu/drm/i915/display/intel_pipe_crc.o
  CC [M]  drivers/gpu/drm/i915/display/dvo_ch7017.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v11_0_6.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_gt_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v13_0.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_active.h
  CC [M]  drivers/gpu/drm/i915/display/dvo_ch7xxx.o
  HDRTEST drivers/gpu/drm/xe/display/intel_fb_bo.h
  HDRTEST drivers/gpu/drm/xe/display/intel_fbdev_fb.h
  CC [M]  drivers/gpu/drm/i915/display/dvo_ivch.o
  HDRTEST drivers/gpu/drm/xe/instructions/xe_instr_defs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk104.o
  HDRTEST drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v13_0_3.o
  CC [M]  drivers/gpu/drm/i915/display/dvo_ns2501.o
  HDRTEST drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk20a.o
  HDRTEST drivers/gpu/drm/xe/instructions/xe_mi_commands.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_gsc_regs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_reg_defs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v13_0_6.o
  HDRTEST drivers/gpu/drm/xe/regs/xe_guc_regs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_gt_regs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm200.o
  HDRTEST drivers/gpu/drm/xe/regs/xe_gpu_commands.h
  CC [M]  drivers/gpu/drm/i915/display/dvo_sil164.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mca_v3_0.o
  HDRTEST drivers/gpu/drm/xe/regs/xe_sriov_regs.h
  CC [M]  drivers/gpu/drm/i915/display/dvo_tfp410.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm20b.o
  CC [M]  drivers/gpu/drm/i915/display/g4x_dp.o
  HDRTEST drivers/gpu/drm/xe/regs/xe_lrc_layout.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_module.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.o
  HDRTEST drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gp100.o
  HDRTEST drivers/gpu/drm/xe/regs/xe_engine_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gp10b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_pasid.o
  CC [M]  drivers/gpu/drm/i915/display/g4x_hdmi.o
  HDRTEST drivers/gpu/drm/xe/tests/xe_test.h
  CC [M]  drivers/gpu/drm/i915/display/icl_dsi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gv100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_doorbell.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_flat_memory.o
  CC [M]  drivers/gpu/drm/i915/display/intel_backlight.o
  CC [M]  drivers/gpu/drm/i915/display/intel_crt.o
  CC [M]  drivers/gpu/drm/i915/display/intel_cx0_phy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager.o
  HDRTEST drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_cik.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_vi.o
  HDRTEST drivers/gpu/drm/xe/tests/xe_pci_test.h
  HDRTEST drivers/gpu/drm/xe/tests/xe_migrate_test.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v9.o
  CC [M]  drivers/gpu/drm/i915/display/intel_ddi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v10.o
  HDRTEST drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
  HDRTEST drivers/gpu/drm/xe/tests/xe_mocs_test.h
  HDRTEST drivers/gpu/drm/xe/tests/xe_bo_test.h
  CC [M]  drivers/gpu/drm/i915/display/intel_ddi_buf_trans.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v11.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.o
  HDRTEST drivers/gpu/drm/xe/xe_assert.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mem.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_kernel_queue.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager_vi.o
  HDRTEST drivers/gpu/drm/xe/xe_bb.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv50.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_device.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memgf100.o
  HDRTEST drivers/gpu/drm/xe/xe_bb_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager_v9.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_trace.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dkl_phy.o
  HDRTEST drivers/gpu/drm/xe/xe_bo.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process_queue_manager.o
  HDRTEST drivers/gpu/drm/xe/xe_bo_doc.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_cik.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dp_aux.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_vi.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_v9.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_v10.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_v11.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_interrupt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_events.o
  HDRTEST drivers/gpu/drm/xe/xe_bo_evict.h
  HDRTEST drivers/gpu/drm/xe/xe_bo_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/cik_event_interrupt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.o
  HDRTEST drivers/gpu/drm/xe/xe_debugfs.h
  HDRTEST drivers/gpu/drm/xe/xe_devcoredump.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv41.o
  HDRTEST drivers/gpu/drm/xe/xe_devcoredump_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v10.o
  HDRTEST drivers/gpu/drm/xe/xe_device.h
  CC [M]  drivers/gpu/drm/i915/display/intel_dp_hdcp.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dp_link_training.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v11.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv44.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dp_mst.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_smi_events.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dsi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.o
  HDRTEST drivers/gpu/drm/xe/xe_device_sysfs.h
  HDRTEST drivers/gpu/drm/xe/xe_device_types.h
  CC [M]  drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debug.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dsi_vbt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debugfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.o
  HDRTEST drivers/gpu/drm/xe/xe_display.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.o
  HDRTEST drivers/gpu/drm/xe/xe_dma_buf.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dvo.o
  HDRTEST drivers/gpu/drm/xe/xe_drm_client.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmmcp77.o
  CC [M]  drivers/gpu/drm/i915/display/intel_gmbus.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.o
  HDRTEST drivers/gpu/drm/xe/xe_drv.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.o
  HDRTEST drivers/gpu/drm/xe/xe_exec.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk104.o
  HDRTEST drivers/gpu/drm/xe/xe_exec_queue.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hdmi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.o
  HDRTEST drivers/gpu/drm/xe/xe_exec_queue_types.h
  HDRTEST drivers/gpu/drm/xe/xe_execlist.h
  HDRTEST drivers/gpu/drm/xe/xe_execlist_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.o
  CC [M]  drivers/gpu/drm/i915/display/intel_lspcon.o
  HDRTEST drivers/gpu/drm/xe/xe_force_wake.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_job.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_acp.o
  CC [M]  drivers/gpu/drm/i915/display/intel_lvds.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../acp/acp_hw.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ioc32.o
  HDRTEST drivers/gpu/drm/xe/xe_force_wake_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgv100.o
  HDRTEST drivers/gpu/drm/xe/xe_ggtt.h
  HDRTEST drivers/gpu/drm/xe/xe_ggtt_types.h
  HDRTEST drivers/gpu/drm/xe/xe_gpu_scheduler.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.o
  CC [M]  drivers/gpu/drm/i915/display/intel_panel.o
  HDRTEST drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.o
  CC [M]  drivers/gpu/drm/i915/display/intel_pps.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.o
  CC [M]  drivers/gpu/drm/i915/display/intel_qp_tables.o
  HDRTEST drivers/gpu/drm/xe/xe_gsc.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/arcturus_ppt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/navi10_ppt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mxm/mxms.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.o
  CC [M]  drivers/gpu/drm/i915/display/intel_sdvo.o
  HDRTEST drivers/gpu/drm/xe/xe_gsc_submit.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/cyan_skillfish_ppt.o
  HDRTEST drivers/gpu/drm/xe/xe_gsc_types.h
  HDRTEST drivers/gpu/drm/xe/xe_gt.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_ccs_mode.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mxm/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_clock.h
  CC [M]  drivers/gpu/drm/i915/display/intel_snps_phy.o
  CC [M]  drivers/gpu/drm/i915/display/intel_tv.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/agp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.o
  CC [M]  drivers/gpu/drm/i915/display/intel_vdsc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu12/renoir_ppt.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_debugfs.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_freq.h
  CC [M]  drivers/gpu/drm/i915/display/intel_vrr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu12/smu_v12_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/aldebaran_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/yellow_carp_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_4_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_5_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv40.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0.o
  CC [M]  drivers/gpu/drm/i915/display/vlv_dsi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv46.o
  CC [M]  drivers/gpu/drm/i915/display/vlv_dsi_pll.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_idle.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv4c.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_idle_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_0_ppt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/g84.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_mcr.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_pagefault.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_printk.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/g92.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_sriov_printk.h
  CC [M]  drivers/gpu/drm/i915/i915_perf.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/g94.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf106.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gp100.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_huc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/memx.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smumgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gt215.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_tee.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu8_smumgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gf100.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_sysfs.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sysfs_types.h
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_cmd.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gf119.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk110.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/tonga_smumgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/fiji_smumgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk208.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/polaris10_smumgr.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_irq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_pm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vega10_smumgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu10_smumgr.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_session.o
  CC [M]  drivers/gpu/drm/i915/i915_gpu_error.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/ci_smumgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vega12_smumgr.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
  CC [M]  drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gf117.o
  CC [M]  drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vegam_smumgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gk104.o
  CC [M]  drivers/gpu/drm/i915/selftests/i915_random.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu9_smumgr.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_topology.h
  CC [M]  drivers/gpu/drm/i915/selftests/i915_selftest.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vega20_smumgr.o
  CC [M]  drivers/gpu/drm/i915/selftests/igt_atomic.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/hwmgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/processpptables.o
  CC [M]  drivers/gpu/drm/i915/selftests/igt_flush_test.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gp10b.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/hardwaremanager.o
  CC [M]  drivers/gpu/drm/i915/selftests/igt_live_test.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fannil.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu8_hwmgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.o
  CC [M]  drivers/gpu/drm/i915/selftests/igt_mmap.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fantog.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/ic.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/temp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv40.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv50.o
  CC [M]  drivers/gpu/drm/i915/selftests/igt_reset.o
  HDRTEST drivers/gpu/drm/xe/xe_guc.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/pppcielanes.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_ads.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/process_pptables_v1_0.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_ads_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/g84.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_ct.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_ct_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gt215.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomfwctrl.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf100.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_db_mgr.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_debugfs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.o
  CC [M]  drivers/gpu/drm/i915/selftests/igt_spinner.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_fwif.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_hwconfig.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_hxg_helpers.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_log.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_log_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gm107.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_pc.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_powertune.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_thermal.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gm200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.o
  CC [M]  drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.o
  CC [M]  drivers/gpu/drm/i915/selftests/librapl.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/base.o
  CC [M]  drivers/gpu/drm/i915/i915_vgpu.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_pc_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_clockpowergating.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/nv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_relay.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/nv40.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dkl_phy_regs.h
  HDRTEST drivers/gpu/drm/i915/display/intel_crtc_state_dump.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_relay_types.h
  HDRTEST drivers/gpu/drm/i915/display/hsw_ips.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_submit.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_submit_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/nv41.o
  HDRTEST drivers/gpu/drm/i915/display/g4x_hdmi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/gk20a.o
  HDRTEST drivers/gpu/drm/i915/display/intel_hdcp_regs.h
  HDRTEST drivers/gpu/drm/i915/display/intel_overlay.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/top/base.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display.h
  HDRTEST drivers/gpu/drm/xe/xe_heci_gsc.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_powertune.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.o
  HDRTEST drivers/gpu/drm/xe/xe_huc.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.o
  HDRTEST drivers/gpu/drm/xe/xe_huc_debugfs.h
  HDRTEST drivers/gpu/drm/i915/display/skl_watermark_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/base.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dmc.h
  HDRTEST drivers/gpu/drm/i915/display/intel_vga.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.o
  HDRTEST drivers/gpu/drm/i915/display/intel_audio.h
  HDRTEST drivers/gpu/drm/xe/xe_huc_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_lvds.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_thermal.o
  HDRTEST drivers/gpu/drm/i915/display/intel_modeset_setup.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu10_hwmgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_cdclk.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/pp_psm.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_limits.h
  HDRTEST drivers/gpu/drm/xe/xe_hw_engine.h
  HDRTEST drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.h
  HDRTEST drivers/gpu/drm/i915/display/intel_hotplug.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/gv100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_processpptables.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_hwmgr.o
  HDRTEST drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_thermal.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dkl_phy.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/tu102.o
  HDRTEST drivers/gpu/drm/i915/display/intel_atomic.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/ga100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/pp_overdriver.o
  HDRTEST drivers/gpu/drm/i915/display/intel_color_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu_helper.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_driver.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_processpptables.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dpll.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_hwmgr.o
  HDRTEST drivers/gpu/drm/i915/display/vlv_dsi_pll_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_powertune.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dp_mst.h
  HDRTEST drivers/gpu/drm/i915/display/intel_fdi_regs.h
  HDRTEST drivers/gpu/drm/i915/display/g4x_dp.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_thermal.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/common_baco.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gpio.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_baco.o
  HDRTEST drivers/gpu/drm/i915/display/intel_tc.h
  HDRTEST drivers/gpu/drm/i915/display/intel_display_params.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/nv40.o
  HDRTEST drivers/gpu/drm/i915/display/intel_frontbuffer.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_baco.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_baco.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu9_baco.o
  HDRTEST drivers/gpu/drm/xe/xe_hw_engine_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dsi_vbt.h
  HDRTEST drivers/gpu/drm/i915/display/intel_psr.h
  HDRTEST drivers/gpu/drm/i915/display/intel_crt.h
  HDRTEST drivers/gpu/drm/xe/xe_hw_fence.h
  HDRTEST drivers/gpu/drm/i915/display/intel_opregion.h
  HDRTEST drivers/gpu/drm/i915/display/intel_snps_phy_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gf117.o
  HDRTEST drivers/gpu/drm/i915/display/i9xx_wm.h
  HDRTEST drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
  HDRTEST drivers/gpu/drm/i915/display/intel_global_state.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk104.o
  HDRTEST drivers/gpu/drm/i915/display/intel_lpe_audio.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.o
  HDRTEST drivers/gpu/drm/i915/display/intel_drrs.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dsb_buffer.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gm20b.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/falcon.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_rps.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/tonga_baco.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/xtensa.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/polaris_baco.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/bsp/g84.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/fiji_baco.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ci_baco.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.o
  HDRTEST drivers/gpu/drm/xe/xe_hw_fence_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_baco.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gk104.o
  HDRTEST drivers/gpu/drm/xe/xe_hwmon.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/amd_powerplay.o
  HDRTEST drivers/gpu/drm/xe/xe_irq.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gm107.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/legacy_dpm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gp100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gp102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gv100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_smc.o
  HDRTEST drivers/gpu/drm/xe/xe_lmtt.h
  HDRTEST drivers/gpu/drm/xe/xe_lmtt_types.h
  HDRTEST drivers/gpu/drm/xe/xe_lrc.h
  HDRTEST drivers/gpu/drm/xe/xe_lrc_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_fbdev.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.o
  HDRTEST drivers/gpu/drm/xe/xe_macros.h
  HDRTEST drivers/gpu/drm/i915/display/intel_pps_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.o
  HDRTEST drivers/gpu/drm/i915/display/intel_hdmi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.o
  HDRTEST drivers/gpu/drm/i915/display/intel_fdi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.o
  HDRTEST drivers/gpu/drm/xe/xe_map.h
  HDRTEST drivers/gpu/drm/i915/display/intel_fb.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/cipher/g84.o
  HDRTEST drivers/gpu/drm/i915/display/intel_qp_tables.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/acpi.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dsb_regs.h
  HDRTEST drivers/gpu/drm/i915/display/intel_vdsc.h
  HDRTEST drivers/gpu/drm/i915/display/intel_snps_phy.h
  HDRTEST drivers/gpu/drm/xe/xe_memirq.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_core.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/pci.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_smc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.o
  HDRTEST drivers/gpu/drm/i915/display/vlv_dsi_pll.h
  HDRTEST drivers/gpu/drm/xe/xe_memirq_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dvo_dev.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.o
  HDRTEST drivers/gpu/drm/i915/display/intel_hdcp.h
  HDRTEST drivers/gpu/drm/i915/display/intel_sdvo_regs.h
  HDRTEST drivers/gpu/drm/i915/display/intel_pch_refclk.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm_internal.o
  HDRTEST drivers/gpu/drm/i915/display/intel_modeset_lock.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/user.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_trace.h
  HDRTEST drivers/gpu/drm/i915/display/intel_display_power.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dp_aux_regs.h
  HDRTEST drivers/gpu/drm/i915/display/i9xx_plane.h
  HDRTEST drivers/gpu/drm/xe/xe_migrate.h
  HDRTEST drivers/gpu/drm/xe/xe_migrate_doc.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crtc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.o
  HDRTEST drivers/gpu/drm/xe/xe_mmio.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dp_aux_backlight.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_services.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dpll_mgr.h
  HDRTEST drivers/gpu/drm/i915/display/vlv_dsi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmi.o
  HDRTEST drivers/gpu/drm/xe/xe_mocs.h
  HDRTEST drivers/gpu/drm/xe/xe_module.h
  HDRTEST drivers/gpu/drm/i915/display/intel_plane_initial.h
  HDRTEST drivers/gpu/drm/xe/xe_pat.h
  HDRTEST drivers/gpu/drm/xe/xe_pci.h
  HDRTEST drivers/gpu/drm/xe/xe_pci_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/head.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_pp_smu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_psr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_replay.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_device.h
  HDRTEST drivers/gpu/drm/xe/xe_pcode.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_hdcp.o
  HDRTEST drivers/gpu/drm/xe/xe_pcode_api.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.o
  HDRTEST drivers/gpu/drm/xe/xe_platform_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_fifo_underrun.h
  HDRTEST drivers/gpu/drm/xe/xe_pm.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/vga.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/nv04.o
  HDRTEST drivers/gpu/drm/xe/xe_preempt_fence.h
  HDRTEST drivers/gpu/drm/i915/display/intel_cursor.h
  HDRTEST drivers/gpu/drm/i915/display/vlv_dsi_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/g84.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dpt_common.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/conversion.o
  HDRTEST drivers/gpu/drm/i915/display/intel_cx0_phy.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gt200.o
  HDRTEST drivers/gpu/drm/xe/xe_preempt_fence_types.h
  HDRTEST drivers/gpu/drm/i915/display/skl_scaler.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.o
  HDRTEST drivers/gpu/drm/i915/display/intel_fb_bo.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/fixpt31_32.o
  HDRTEST drivers/gpu/drm/i915/display/intel_hti.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/vector.o
  HDRTEST drivers/gpu/drm/i915/display/icl_dsi_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp89.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.o
  HDRTEST drivers/gpu/drm/xe/xe_pt.h
  HDRTEST drivers/gpu/drm/xe/xe_pt_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gk110.o
  HDRTEST drivers/gpu/drm/i915/display/intel_atomic_plane.h
  HDRTEST drivers/gpu/drm/i915/display/skl_watermark.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dce_calcs.o
  HDRTEST drivers/gpu/drm/i915/display/intel_fbc.h
  HDRTEST drivers/gpu/drm/i915/display/intel_display_reg_defs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gm107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/custom_float.o
  HDRTEST drivers/gpu/drm/xe/xe_pt_walk.h
  HDRTEST drivers/gpu/drm/i915/display/intel_acpi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.o
  HDRTEST drivers/gpu/drm/i915/display/intel_connector.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/bw_fixed.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dpt.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gp100.o
  HDRTEST drivers/gpu/drm/xe/xe_query.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gp102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.o
  HDRTEST drivers/gpu/drm/i915/display/intel_quirks.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dp_link_training.h
  HDRTEST drivers/gpu/drm/i915/display/intel_color.h
  HDRTEST drivers/gpu/drm/i915/display/intel_crtc.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser_interface.o
  HDRTEST drivers/gpu/drm/xe/xe_range_fence.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser_helper.o
  HDRTEST drivers/gpu/drm/xe/xe_reg_sr.h
  HDRTEST drivers/gpu/drm/i915/display/intel_display_debugfs.h
  HDRTEST drivers/gpu/drm/i915/display/intel_modeset_verify.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_power_well.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.o
  HDRTEST drivers/gpu/drm/i915/display/intel_psr_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table_helper.o
  HDRTEST drivers/gpu/drm/i915/display/intel_wm.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.o
  HDRTEST drivers/gpu/drm/xe/xe_reg_sr_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_pipe_crc.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.o
  HDRTEST drivers/gpu/drm/xe/xe_reg_whitelist.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser_common.o
  HDRTEST drivers/gpu/drm/xe/xe_res_cursor.h
  HDRTEST drivers/gpu/drm/xe/xe_ring_ops.h
  HDRTEST drivers/gpu/drm/i915/display/intel_audio_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/nv04.o
  HDRTEST drivers/gpu/drm/i915/display/intel_panel.h
  HDRTEST drivers/gpu/drm/xe/xe_ring_ops_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table_helper2.o
  HDRTEST drivers/gpu/drm/xe/xe_rtp.h
  HDRTEST drivers/gpu/drm/xe/xe_rtp_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.o
  HDRTEST drivers/gpu/drm/i915/display/intel_sprite.h
  HDRTEST drivers/gpu/drm/xe/xe_sa.h
  HDRTEST drivers/gpu/drm/xe/xe_sa_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce60/command_table_helper_dce60.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce80/command_table_helper_dce80.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce110/command_table_helper_dce110.o
  HDRTEST drivers/gpu/drm/i915/display/intel_wm_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce112/command_table_helper_dce112.o
  HDRTEST drivers/gpu/drm/i915/display/intel_tv.h
  HDRTEST drivers/gpu/drm/i915/display/intel_fbdev_fb.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/nv50.o
  HDRTEST drivers/gpu/drm/xe/xe_sched_job.h
  HDRTEST drivers/gpu/drm/i915/display/intel_hti_regs.h
  HDRTEST drivers/gpu/drm/xe/xe_sched_job_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_vrr.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce112/command_table_helper2_dce112.o
  HDRTEST drivers/gpu/drm/xe/xe_sriov.h
  HDRTEST drivers/gpu/drm/i915/display/intel_load_detect.h
  HDRTEST drivers/gpu/drm/xe/xe_sriov_printk.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
  HDRTEST drivers/gpu/drm/xe/xe_sriov_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.o
  HDRTEST drivers/gpu/drm/xe/xe_step.h
  HDRTEST drivers/gpu/drm/xe/xe_step_types.h
  HDRTEST drivers/gpu/drm/i915/display/skl_universal_plane.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/gf119.o
  HDRTEST drivers/gpu/drm/xe/xe_sync.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn10/dcn10_fpu.o
  HDRTEST drivers/gpu/drm/xe/xe_sync_types.h
  HDRTEST drivers/gpu/drm/xe/xe_tile.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/dcn20_fpu.o
  HDRTEST drivers/gpu/drm/xe/xe_tile_sysfs.h
  HDRTEST drivers/gpu/drm/i915/display/intel_mg_phy_regs.h
  HDRTEST drivers/gpu/drm/xe/xe_tile_sysfs_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_bw.h
  HDRTEST drivers/gpu/drm/xe/xe_trace.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/gv100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/user.o
  HDRTEST drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
  HDRTEST drivers/gpu/drm/i915/display/intel_display_irq.h
  HDRTEST drivers/gpu/drm/i915/display/intel_de.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_vba.o
  HDRTEST drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
  HDRTEST drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
  HDRTEST drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_lvds_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.o
  HDRTEST drivers/gpu/drm/xe/xe_tuning.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv04.o
  HDRTEST drivers/gpu/drm/i915/display/intel_gmbus_regs.h
  HDRTEST drivers/gpu/drm/xe/xe_uc.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usergf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usergf119.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dvo.h
  HDRTEST drivers/gpu/drm/xe/xe_uc_debugfs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.o
  HDRTEST drivers/gpu/drm/i915/display/intel_sdvo.h
  HDRTEST drivers/gpu/drm/xe/xe_uc_fw.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.o
  HDRTEST drivers/gpu/drm/xe/xe_uc_fw_abi.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dp_aux.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/dcn30_fpu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.o
  HDRTEST drivers/gpu/drm/i915/display/intel_vdsc_regs.h
  HDRTEST drivers/gpu/drm/i915/display/intel_combo_phy.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usergv100.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dvo_regs.h
  HDRTEST drivers/gpu/drm/xe/xe_uc_fw_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.o
  HDRTEST drivers/gpu/drm/xe/xe_uc_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_gmbus.h
  HDRTEST drivers/gpu/drm/xe/xe_vm.h
  HDRTEST drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
  HDRTEST drivers/gpu/drm/xe/xe_vm_doc.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dsi.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dmc_regs.h
  HDRTEST drivers/gpu/drm/xe/xe_vm_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_ddi.h
  HDRTEST drivers/gpu/drm/i915/display/intel_hotplug_irq.h
  HDRTEST drivers/gpu/drm/xe/xe_vram_freq.h
  HDRTEST drivers/gpu/drm/i915/display/intel_tv_regs.h
  HDRTEST drivers/gpu/drm/xe/xe_wa.h
  HDRTEST drivers/gpu/drm/xe/xe_wait_user_fence.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.o
  HDRTEST drivers/gpu/drm/xe/xe_wopcm.h
  HDRTEST drivers/gpu/drm/xe/xe_wopcm_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dsb.h
  HDRTEST drivers/gpu/drm/i915/display/intel_bios.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.o
  LD [M]  drivers/gpu/drm/xe/xe.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/cgrp.o
  HDRTEST drivers/gpu/drm/i915/display/intel_pch_display.h
  HDRTEST drivers/gpu/drm/i915/display/intel_display_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.o
  HDRTEST drivers/gpu/drm/i915/display/intel_backlight.h
  HDRTEST drivers/gpu/drm/i915/display/intel_vblank.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dp.h
  HDRTEST drivers/gpu/drm/i915/display/intel_pmdemand.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/chid.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/runq.o
  HDRTEST drivers/gpu/drm/i915/display/intel_backlight_regs.h
  HDRTEST drivers/gpu/drm/i915/display/intel_combo_phy_regs.h
  HDRTEST drivers/gpu/drm/i915/display/intel_display_reset.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_power_map.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv10.o
  HDRTEST drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv17.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_wa.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv40.o
  HDRTEST drivers/gpu/drm/i915/display/icl_dsi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv50.o
  HDRTEST drivers/gpu/drm/i915/display/intel_lspcon.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_32.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dpio_phy.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dp_hdcp.h
  HDRTEST drivers/gpu/drm/i915/display/intel_fb_pin.h
  HDRTEST drivers/gpu/drm/i915/display/intel_display_debugfs_params.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/g84.o
  HDRTEST drivers/gpu/drm/i915/display/intel_link_bw.h
  HDRTEST drivers/gpu/drm/i915/display/intel_pps.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/g98.o
  HDRTEST drivers/gpu/drm/i915/display/intel_sprite_uapi.h
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_ttm.h
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_region.h
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_context_types.h
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_lmem.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_mman.h
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_object_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_context.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk110.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/dcn31_fpu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_clflush.h
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_tiling.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn321/dcn321_fpu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn301/dcn301_fpu.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_stolen.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk208.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk20a.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gm107.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_create.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn302/dcn302_fpu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gm200.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn303/dcn303_fpu.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_ioctls.h
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_domain.h
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_internal.h
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_dmabuf.h
  HDRTEST drivers/gpu/drm/i915/gem/selftests/mock_context.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/dcn314_fpu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gp100.o
  HDRTEST drivers/gpu/drm/i915/gem/selftests/huge_gem_object.h
  HDRTEST drivers/gpu/drm/i915/gem/selftests/mock_gem_object.h
  HDRTEST drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn35/dcn35_fpu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.o
  HDRTEST drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_userptr.h
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_pm.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_shrinker.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gemfs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_object.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv15.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_timeline_types.h
  HDRTEST drivers/gpu/drm/i915/gt/selftest_engine.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_breadcrumbs.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calcs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_math.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv17.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_context_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv25.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv2a.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv30.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_execlists_submission.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_pm.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv34.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/gt/selftest_rc6.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_llc_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv35.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce60/dce60_clk_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce100/dce_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_region_lmem.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_requests.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv44.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce110/dce110_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_ggtt_gmch.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce112/dce112_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_print.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/g84.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce120/dce120_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gt200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn10/rv1_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/mcp79.o
  HDRTEST drivers/gpu/drm/i915/gt/gen8_ppgtt.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_mcr.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gt215.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/mcp89.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_timeline.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.o
  HDRTEST drivers/gpu/drm/i915/gt/gen6_engine_cs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn10/rv2_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf110.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_workarounds_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf117.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf119.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gk110.o
  HDRTEST drivers/gpu/drm/i915/gt/selftest_rps.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_sa_media.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gk110b.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gk208.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_clock_utils.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_rps_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn20/dcn20_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gm107.o
  HDRTEST drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn201/dcn201_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/gt/sysfs_engines.h
  HDRTEST drivers/gpu/drm/i915/gt/gen7_renderclear.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gm200.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_context.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gm20b.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_wopcm.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_mocs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp107.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_sysfs.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_engine_pm.h
  HDRTEST drivers/gpu/drm/i915/gt/intel_rc6.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21/rn_clk_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_defines.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_ring_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp108.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_workarounds.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_engine_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gv100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_pm_irq.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/dcn301_smu.o
  HDRTEST drivers/gpu/drm/i915/gt/shmem_utils.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn31/dcn31_smu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ad102.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_engine.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn31/dcn31_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv40.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_reset_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn314/dcn314_smu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_gt_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf108.o
  HDRTEST drivers/gpu/drm/i915/gt/intel_reset.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf110.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf117.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn314/dcn314_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf119.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn315/dcn315_smu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn315/dcn315_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn316/dcn316_smu.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_uc.h
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk208.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn316/dcn316_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_fw.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm20b.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp100.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp102.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
  HDRTEST drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp104.o
  HDRTEST drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
  HDRTEST drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
  HDRTEST drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/


