Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55D5C04FF9
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 16:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C51C10EB73;
	Mon, 15 Apr 2024 16:37:27 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5303810E53E;
 Mon, 15 Apr 2024 16:37:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EBuild=3A_success_for_series_starting_with_=5Bv7=2C1?=
 =?utf-8?q?/2=5D_drm/xe=3A_add_a_new_debugfs_file_-_mmio?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koby Elbaz" <kelbaz@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 16:37:26 -0000
Message-ID: <171319904630.1406028.7957821580171644148@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240414081105.1199559-1-kelbaz@habana.ai>
In-Reply-To: <20240414081105.1199559-1-kelbaz@habana.ai>
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

Series: series starting with [v7,1/2] drm/xe: add a new debugfs file - mmio
URL   : https://patchwork.freedesktop.org/series/132409/
State : success

== Summary ==

+ trap cleanup EXIT
+ cd /kernel
+ git clone https://gitlab.freedesktop.org/drm/xe/ci.git .ci
Cloning into '.ci'...
+ '[' -n '' ']'
++ date +%s
+ echo -e '\e[0Ksection_start:1713198375:build_x86_64[collapsed=true]\r\e[0KBuild x86-64'
+ mkdir -p build64-default
[0Ksection_start:1713198375:build_x86_64[collapsed=true]
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
  GEN     Makefile
  UPD     include/generated/uapi/linux/version.h
  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/x86/include/generated/uapi/asm/errno.h
  WRAP    arch/x86/include/generated/uapi/asm/fcntl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctls.h
  WRAP    arch/x86/include/generated/uapi/asm/ipcbuf.h
  WRAP    arch/x86/include/generated/uapi/asm/param.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  WRAP    arch/x86/include/generated/uapi/asm/resource.h
  WRAP    arch/x86/include/generated/uapi/asm/socket.h
  WRAP    arch/x86/include/generated/uapi/asm/sockios.h
  WRAP    arch/x86/include/generated/uapi/asm/termbits.h
  WRAP    arch/x86/include/generated/uapi/asm/termios.h
  WRAP    arch/x86/include/generated/uapi/asm/types.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_32_ia32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
  HYPERCALLS arch/x86/include/generated/asm/xen-hypercalls.h
  UPD     include/config/kernel.release
  UPD     include/generated/compile.h
  HOSTCC  arch/x86/tools/relocs_32.o
  WRAP    arch/x86/include/generated/asm/early_ioremap.h
  WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
  HOSTCC  arch/x86/tools/relocs_64.o
  HOSTCC  arch/x86/tools/relocs_common.o
  WRAP    arch/x86/include/generated/asm/irq_regs.h
  WRAP    arch/x86/include/generated/asm/kmap_size.h
  WRAP    arch/x86/include/generated/asm/mmiowb.h
  WRAP    arch/x86/include/generated/asm/local64.h
  WRAP    arch/x86/include/generated/asm/module.lds.h
  WRAP    arch/x86/include/generated/asm/rwonce.h
  WRAP    arch/x86/include/generated/asm/unaligned.h
  HOSTCC  scripts/unifdef
  UPD     include/generated/utsrelease.h
mkdir -p /kernel/build64-default/tools/objtool && make O=/kernel/build64-default subdir=tools/objtool --no-print-directory -C objtool 
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/sorttable
  HOSTCC  scripts/asn1_compiler
  HOSTCC  scripts/genksyms/genksyms.o
  LEX     scripts/genksyms/lex.lex.c
  YACC    scripts/genksyms/parse.tab.[ch]
  HOSTCC  scripts/selinux/mdp/mdp
  HOSTCC  scripts/selinux/genheaders/genheaders
  HOSTCC  scripts/sign-file
  HOSTCC  scripts/insert-sys-cert
  HOSTCC  /kernel/build64-default/tools/objtool/fixdep.o
  HOSTLD  /kernel/build64-default/tools/objtool/fixdep-in.o
  LINK    /kernel/build64-default/tools/objtool/fixdep
  HOSTCC  scripts/genksyms/parse.tab.o
  HOSTCC  scripts/genksyms/lex.lex.o
  INSTALL /kernel/build64-default/tools/objtool/libsubcmd/include/subcmd/exec-cmd.h
  INSTALL /kernel/build64-default/tools/objtool/libsubcmd/include/subcmd/help.h
  INSTALL /kernel/build64-default/tools/objtool/libsubcmd/include/subcmd/pager.h
  INSTALL /kernel/build64-default/tools/objtool/libsubcmd/include/subcmd/parse-options.h
  INSTALL /kernel/build64-default/tools/objtool/libsubcmd/include/subcmd/run-command.h
  CC      /kernel/build64-default/tools/objtool/libsubcmd/exec-cmd.o
  CC      /kernel/build64-default/tools/objtool/libsubcmd/help.o
  INSTALL libsubcmd_headers
  CC      /kernel/build64-default/tools/objtool/libsubcmd/pager.o
  CC      /kernel/build64-default/tools/objtool/libsubcmd/parse-options.o
  CC      /kernel/build64-default/tools/objtool/libsubcmd/run-command.o
  CC      /kernel/build64-default/tools/objtool/libsubcmd/sigchain.o
  CC      /kernel/build64-default/tools/objtool/libsubcmd/subcmd-config.o
  HOSTLD  arch/x86/tools/relocs
  HDRINST usr/include/video/edid.h
  HDRINST usr/include/video/sisfb.h
  HDRINST usr/include/video/uvesafb.h
  HDRINST usr/include/drm/amdgpu_drm.h
  HDRINST usr/include/drm/qaic_accel.h
  HDRINST usr/include/drm/i915_drm.h
  HDRINST usr/include/drm/vgem_drm.h
  HDRINST usr/include/drm/pvr_drm.h
  HDRINST usr/include/drm/xe_drm.h
  HDRINST usr/include/drm/omap_drm.h
  HDRINST usr/include/drm/virtgpu_drm.h
  HDRINST usr/include/drm/radeon_drm.h
  HDRINST usr/include/drm/tegra_drm.h
  HDRINST usr/include/drm/drm_mode.h
  HDRINST usr/include/drm/ivpu_accel.h
  HDRINST usr/include/drm/exynos_drm.h
  HDRINST usr/include/drm/drm_sarea.h
  HDRINST usr/include/drm/v3d_drm.h
  HDRINST usr/include/drm/qxl_drm.h
  HDRINST usr/include/drm/drm_fourcc.h
  HDRINST usr/include/drm/nouveau_drm.h
  HDRINST usr/include/drm/habanalabs_accel.h
  HDRINST usr/include/drm/vmwgfx_drm.h
  HDRINST usr/include/drm/msm_drm.h
  HDRINST usr/include/drm/etnaviv_drm.h
  HDRINST usr/include/drm/vc4_drm.h
  HDRINST usr/include/drm/panfrost_drm.h
  HDRINST usr/include/drm/lima_drm.h
  HDRINST usr/include/drm/drm.h
  HDRINST usr/include/drm/panthor_drm.h
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
  HDRINST usr/include/rdma/ib_user_sa.h
  HDRINST usr/include/rdma/ib_user_ioctl_verbs.h
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
  HDRINST usr/include/linux/if_packet.h
  HDRINST usr/include/linux/route.h
  HDRINST usr/include/linux/patchkey.h
  HDRINST usr/include/linux/tc_ematch/tc_em_cmp.h
  HDRINST usr/include/linux/tc_ematch/tc_em_ipt.h
  HDRINST usr/include/linux/tc_ematch/tc_em_meta.h
  HDRINST usr/include/linux/tc_ematch/tc_em_nbyte.h
  HDRINST usr/include/linux/tc_ematch/tc_em_text.h
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
  HDRINST usr/include/linux/vesa.h
  HDRINST usr/include/linux/netlink_diag.h
  HDRINST usr/include/linux/const.h
  HDRINST usr/include/linux/firewire-cdev.h
  HDRINST usr/include/linux/vdpa.h
  HDRINST usr/include/linux/if_infiniband.h
  HDRINST usr/include/linux/serial.h
  HDRINST usr/include/linux/iio/types.h
  HDRINST usr/include/linux/iio/buffer.h
  HDRINST usr/include/linux/iio/events.h
  HDRINST usr/include/linux/major.h
  HDRINST usr/include/linux/baycom.h
  HDRINST usr/include/linux/atmppp.h
  HDRINST usr/include/linux/lsm.h
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
  HDRINST usr/include/linux/netfilter/nfnetlink.h
  HDRINST usr/include/linux/netfilter/xt_cgroup.h
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
  HDRINST usr/include/linux/netfilter/xt_osf.h
  HDRINST usr/include/linux/netfilter/xt_NFQUEUE.h
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
  HDRINST usr/include/linux/netfilter/xt_SECMARK.h
  HDRINST usr/include/linux/netfilter/xt_length.h
  HDRINST usr/include/linux/netfilter/nfnetlink_cthelper.h
  HDRINST usr/include/linux/netfilter/xt_quota.h
  HDRINST usr/include/linux/netfilter/xt_CLASSIFY.h
  HDRINST usr/include/linux/netfilter/xt_ipcomp.h
  HDRINST usr/include/linux/netfilter/xt_iprange.h
  HDRINST usr/include/linux/netfilter/xt_LOG.h
  HDRINST usr/include/linux/netfilter/xt_bpf.h
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
  HDRINST usr/include/linux/netfilter/ipset/ip_set.h
  HDRINST usr/include/linux/netfilter/ipset/ip_set_list.h
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
  HOSTLD  scripts/genksyms/genksyms
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
  LD      /kernel/build64-default/tools/objtool/libsubcmd/libsubcmd-in.o
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
  HDRINST usr/include/linux/openat2.h
  HDRINST usr/include/linux/personality.h
  HDRINST usr/include/linux/poll.h
  HDRINST usr/include/linux/posix_acl.h
  HDRINST usr/include/linux/smc_diag.h
  HDRINST usr/include/linux/snmp.h
  HDRINST usr/include/linux/errqueue.h
  HDRINST usr/include/linux/if_tunnel.h
  AR      /kernel/build64-default/tools/objtool/libsubcmd/libsubcmd.a
  HDRINST usr/include/linux/fanotify.h
  HDRINST usr/include/linux/kernel.h
  HDRINST usr/include/linux/rtnetlink.h
  HDRINST usr/include/linux/rpl.h
  HDRINST usr/include/linux/memfd.h
  HDRINST usr/include/linux/serial_core.h
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
  CC      scripts/mod/empty.o
  HDRINST usr/include/linux/if_macsec.h
  HDRINST usr/include/linux/usb/charger.h
  HDRINST usr/include/linux/usb/g_uvc.h
  HOSTCC  scripts/mod/mk_elfconfig
  HDRINST usr/include/linux/usb/gadgetfs.h
  HDRINST usr/include/linux/usb/raw_gadget.h
  HDRINST usr/include/linux/usb/cdc-wdm.h
  HDRINST usr/include/linux/usb/g_printer.h
  HDRINST usr/include/linux/usb/midi.h
  HDRINST usr/include/linux/usb/tmc.h
  HDRINST usr/include/linux/usb/video.h
  CC      scripts/mod/devicetable-offsets.s
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
  CC      /kernel/build64-default/tools/objtool/weak.o
  HDRINST usr/include/linux/in6.h
  CC      /kernel/build64-default/tools/objtool/check.o
  HDRINST usr/include/linux/hid.h
  CC      /kernel/build64-default/tools/objtool/special.o
  HDRINST usr/include/linux/thp7312.h
  CC      /kernel/build64-default/tools/objtool/builtin-check.o
  HDRINST usr/include/linux/netlink.h
  CC      /kernel/build64-default/tools/objtool/elf.o
  MKDIR   /kernel/build64-default/tools/objtool/arch/x86/
  CC      /kernel/build64-default/tools/objtool/objtool.o
  HDRINST usr/include/linux/fuse.h
  CC      /kernel/build64-default/tools/objtool/orc_gen.o
  MKDIR   /kernel/build64-default/tools/objtool/arch/x86/lib/
  HDRINST usr/include/linux/magic.h
  MKDIR   /kernel/build64-default/tools/objtool/arch/x86/
  HDRINST usr/include/linux/ioam6_iptunnel.h
  CC      /kernel/build64-default/tools/objtool/arch/x86/special.o
  CC      /kernel/build64-default/tools/objtool/orc_dump.o
  HDRINST usr/include/linux/stm.h
  HDRINST usr/include/linux/vsockmon.h
  CC      /kernel/build64-default/tools/objtool/libstring.o
  CC      /kernel/build64-default/tools/objtool/arch/x86/orc.o
  GEN     /kernel/build64-default/tools/objtool/arch/x86/lib/inat-tables.c
  HDRINST usr/include/linux/seg6.h
  CC      /kernel/build64-default/tools/objtool/libctype.o
  HDRINST usr/include/linux/idxd.h
  HDRINST usr/include/linux/nitro_enclaves.h
  HDRINST usr/include/linux/ptrace.h
  CC      /kernel/build64-default/tools/objtool/str_error_r.o
  HDRINST usr/include/linux/ioam6_genl.h
  HDRINST usr/include/linux/qnx4_fs.h
  CC      /kernel/build64-default/tools/objtool/librbtree.o
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
  HDRINST usr/include/linux/zorro_ids.h
  HDRINST usr/include/linux/nbd.h
  HDRINST usr/include/linux/isst_if.h
  HDRINST usr/include/linux/rxrpc.h
  HDRINST usr/include/linux/unistd.h
  HDRINST usr/include/linux/if_arp.h
  HDRINST usr/include/linux/atm_zatm.h
  HDRINST usr/include/linux/io_uring.h
  HDRINST usr/include/linux/if_fddi.h
  HDRINST usr/include/linux/bpqether.h
  HDRINST usr/include/linux/sysinfo.h
  HDRINST usr/include/linux/auto_dev-ioctl.h
  HDRINST usr/include/linux/nfs4_mount.h
  HDRINST usr/include/linux/keyboard.h
  HDRINST usr/include/linux/virtio_mmio.h
  HDRINST usr/include/linux/input.h
  HDRINST usr/include/linux/qnxtypes.h
  HDRINST usr/include/linux/mdio.h
  HDRINST usr/include/linux/lwtunnel.h
  HDRINST usr/include/linux/gfs2_ondisk.h
  HDRINST usr/include/linux/eventfd.h
  HDRINST usr/include/linux/nfs4.h
  HDRINST usr/include/linux/ptp_clock.h
  HDRINST usr/include/linux/nubus.h
  HDRINST usr/include/linux/if_bonding.h
  HDRINST usr/include/linux/kcov.h
  HDRINST usr/include/linux/fadvise.h
  HDRINST usr/include/linux/taskstats.h
  CC      /kernel/build64-default/tools/objtool/arch/x86/decode.o
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
  MKELF   scripts/mod/elfconfig.h
  HDRINST usr/include/linux/netdevice.h
  HDRINST usr/include/linux/binfmts.h
  HDRINST usr/include/linux/if_pppox.h
  HDRINST usr/include/linux/sockios.h
  HDRINST usr/include/linux/kcm.h
  HDRINST usr/include/linux/virtio_9p.h
  HOSTCC  scripts/mod/modpost.o
  HDRINST usr/include/linux/genwqe/genwqe_card.h
  HOSTCC  scripts/mod/sumversion.o
  HOSTCC  scripts/mod/symsearch.o
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
  HDRINST usr/include/linux/virtio_config.h
  HDRINST usr/include/linux/hpet.h
  HDRINST usr/include/linux/string.h
  HDRINST usr/include/linux/nsm.h
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
  UPD     scripts/mod/devicetable-offsets.h
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
  HOSTCC  scripts/mod/file2alias.o
  HDRINST usr/include/linux/virtio_pcidev.h
  HDRINST usr/include/linux/termios.h
  HDRINST usr/include/linux/cgroupstats.h
  HDRINST usr/include/linux/mpls.h
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
  HDRINST usr/include/linux/media-bus-format.h
  HDRINST usr/include/linux/kernelcapi.h
  HDRINST usr/include/linux/ppp_defs.h
  HDRINST usr/include/linux/ethtool.h
  HDRINST usr/include/linux/aspeed-video.h
  HDRINST usr/include/linux/hdlc.h
  HDRINST usr/include/linux/fscrypt.h
  HDRINST usr/include/linux/batadv_packet.h
  HDRINST usr/include/linux/uuid.h
  HDRINST usr/include/linux/capi.h
  HDRINST usr/include/linux/mptcp.h
  HDRINST usr/include/linux/virtio_console.h
  HDRINST usr/include/linux/hidraw.h
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
  HDRINST usr/include/linux/fpga-dfl.h
  HDRINST usr/include/linux/userio.h
  HDRINST usr/include/linux/signal.h
  HDRINST usr/include/linux/map_to_14segment.h
  HDRINST usr/include/linux/hdreg.h
  HDRINST usr/include/linux/utime.h
  HDRINST usr/include/linux/usbdevice_fs.h
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
  HDRINST usr/include/linux/bits.h
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
  HDRINST usr/include/regulator/regulator.h
  HDRINST usr/include/sound/intel/avs/tokens.h
  HDRINST usr/include/sound/sof/fw.h
  HDRINST usr/include/sound/sof/abi.h
  HDRINST usr/include/sound/sof/tokens.h
  HDRINST usr/include/sound/sof/header.h
  HDRINST usr/include/sound/usb_stream.h
  HDRINST usr/include/sound/sfnt_info.h
  HDRINST usr/include/sound/asequencer.h
  HDRINST usr/include/sound/tlv.h
  HDRINST usr/include/sound/scarlett2.h
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
  HDRINST usr/include/asm/setup_data.h
  HDRINST usr/include/asm/boot.h
  HDRINST usr/include/asm/sigcontext.h
  HDRINST usr/include/asm/posix_types_32.h
  HDRINST usr/include/asm/kvm_para.h
  HDRINST usr/include/asm/a.out.h
  HDRINST usr/include/asm/mtrr.h
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
  LD      /kernel/build64-default/tools/objtool/arch/x86/objtool-in.o
  HOSTLD  scripts/mod/modpost
  CC      kernel/bounds.s
  CHKSHA1 ../include/linux/atomic/atomic-arch-fallback.h
  CHKSHA1 ../include/linux/atomic/atomic-instrumented.h
  CHKSHA1 ../include/linux/atomic/atomic-long.h
  UPD     include/generated/timeconst.h
  UPD     include/generated/bounds.h
  CC      arch/x86/kernel/asm-offsets.s
  UPD     include/generated/asm-offsets.h
  CALL    ../scripts/checksyscalls.sh
  SYMLINK scripts/gdb/linux/clk.py
  SYMLINK scripts/gdb/linux/config.py
  SYMLINK scripts/gdb/linux/vmalloc.py
  SYMLINK scripts/gdb/linux/genpd.py
  SYMLINK scripts/gdb/linux/tasks.py
  SYMLINK scripts/gdb/linux/modules.py
  SYMLINK scripts/gdb/linux/proc.py
  SYMLINK scripts/gdb/linux/utils.py
  SYMLINK scripts/gdb/linux/timerlist.py
  SYMLINK scripts/gdb/linux/vfs.py
  SYMLINK scripts/gdb/linux/stackdepot.py
  SYMLINK scripts/gdb/linux/radixtree.py
  SYMLINK scripts/gdb/linux/pgtable.py
  SYMLINK scripts/gdb/linux/lists.py
  SYMLINK scripts/gdb/linux/symbols.py
  SYMLINK scripts/gdb/linux/interrupts.py
  SYMLINK scripts/gdb/linux/__init__.py
  SYMLINK scripts/gdb/linux/cpus.py
  SYMLINK scripts/gdb/linux/mm.py
  SYMLINK scripts/gdb/linux/rbtree.py
  SYMLINK scripts/gdb/linux/page_owner.py
  SYMLINK scripts/gdb/linux/device.py
  SYMLINK scripts/gdb/linux/dmesg.py
  SYMLINK scripts/gdb/linux/slab.py
  GEN     scripts/gdb/linux/constants.py
  LD      /kernel/build64-default/tools/objtool/objtool-in.o
  LINK    /kernel/build64-default/tools/objtool/objtool
  LDS     scripts/module.lds
  CC      ipc/compat.o
  CC      ipc/util.o
  CC      ipc/msgutil.o
  HOSTCC  usr/gen_init_cpio
  CC      ipc/msg.o
  CC      ipc/sem.o
  CC      ipc/shm.o
  AS      arch/x86/lib/clear_page_64.o
  CC      block/bdev.o
  CC      ipc/syscall.o
  CC      init/main.o
  CC      arch/x86/lib/cmdline.o
  CC      block/fops.o
  CC      arch/x86/video/fbdev.o
  CC      certs/system_keyring.o
  CC      ipc/ipc_sysctl.o
  CC      arch/x86/pci/i386.o
  CC      io_uring/io_uring.o
  CC      arch/x86/power/cpu.o
  UPD     init/utsversion-tmp.h
  CC      arch/x86/platform/pvh/enlighten.o
  AR      samples/vfio-mdev/built-in.a
  CC      arch/x86/xen/enlighten.o
  CC      security/yama/yama_lsm.o
  CC      mm/kfence/core.o
  GEN     security/selinux/flask.h security/selinux/av_permissions.h
  CC      security/apparmor/apparmorfs.o
  CC      arch/x86/realmode/init.o
  CC      fs/crypto/crypto.o
  CC      security/smack/smack_lsm.o
  CC      block/partitions/core.o
  CC      virt/lib/irqbypass.o
  CC      net/core/sock.o
  CC      fs/verity/enable.o
  AR      drivers/cache/built-in.a
  CC      block/partitions/amiga.o
  CC      security/safesetid/lsm.o
  CC      security/tomoyo/audit.o
  ASN.1   security/keys/trusted-keys/tpm2key.asn1.[ch]
  CC      arch/x86/coco/tdx/tdx.o
  CC      arch/x86/events/amd/core.o
  CC      fs/notify/dnotify/dnotify.o
  CC      security/keys/trusted-keys/trusted_core.o
  CC      arch/x86/mm/pat/set_memory.o
  AR      samples/built-in.a
  CC      arch/x86/kernel/fpu/init.o
  CC      security/selinux/avc.o
  AR      drivers/irqchip/built-in.a
  CC      lib/kunit/hooks.o
  CC [M]  sound/core/seq/seq.o
  CC      arch/x86/entry/vdso/vma.o
  AR      drivers/bus/mhi/built-in.a
  AS      arch/x86/lib/cmpxchg16b_emu.o
  CC      kernel/sched/core.o
  AR      drivers/bus/built-in.a
  CC      crypto/asymmetric_keys/asymmetric_type.o
  AR      drivers/phy/allwinner/built-in.a
  CC      crypto/asymmetric_keys/restrict.o
  AR      drivers/phy/amlogic/built-in.a
  AR      drivers/phy/broadcom/built-in.a
  AR      drivers/phy/cadence/built-in.a
  CC      crypto/asymmetric_keys/signature.o
  AR      drivers/phy/freescale/built-in.a
  AR      drivers/phy/hisilicon/built-in.a
  AR      drivers/phy/ingenic/built-in.a
  AR      drivers/phy/intel/built-in.a
  AR      drivers/phy/lantiq/built-in.a
  GEN     usr/initramfs_data.cpio
  AR      drivers/phy/marvell/built-in.a
  AR      drivers/phy/mediatek/built-in.a
  AR      drivers/phy/microchip/built-in.a
  COPY    usr/initramfs_inc_data
  AS      usr/initramfs_data.o
  AR      drivers/phy/motorola/built-in.a
  AR      drivers/phy/mscc/built-in.a
  AR      usr/built-in.a
  AR      drivers/phy/qualcomm/built-in.a
  CC      crypto/asymmetric_keys/public_key.o
  AR      drivers/phy/ralink/built-in.a
  CC      arch/x86/lib/copy_mc.o
  AR      drivers/phy/realtek/built-in.a
  AR      drivers/phy/renesas/built-in.a
  AR      drivers/phy/rockchip/built-in.a
  CC [M]  lib/kunit/test.o
  AR      drivers/phy/samsung/built-in.a
  AR      drivers/phy/socionext/built-in.a
  AR      drivers/phy/st/built-in.a
  AR      drivers/phy/starfive/built-in.a
  AR      drivers/phy/sunplus/built-in.a
  AR      drivers/phy/tegra/built-in.a
  AR      drivers/phy/ti/built-in.a
  AR      drivers/phy/xilinx/built-in.a
  CC      drivers/phy/phy-core.o
  CC      ipc/mqueue.o
  CC [M]  sound/core/seq/seq_lock.o
  AS      arch/x86/realmode/rm/header.o
  AS      arch/x86/platform/pvh/head.o
  AS      arch/x86/realmode/rm/trampoline_64.o
  AR      arch/x86/platform/pvh/built-in.a
  CC [M]  sound/core/seq/seq_clientmgr.o
  HOSTCC  certs/extract-cert
  POLICY  security/tomoyo/builtin-policy.h
  AS      arch/x86/realmode/rm/stack.o
  CC      arch/x86/kernel/fpu/bugs.o
  CC      arch/x86/kernel/fpu/core.o
  AS      arch/x86/realmode/rm/reboot.o
  ASN.1   crypto/asymmetric_keys/x509.asn1.[ch]
  ASN.1   crypto/asymmetric_keys/x509_akid.asn1.[ch]
  CC      arch/x86/kernel/fpu/regset.o
  CC      arch/x86/power/hibernate_64.o
  CC      security/keys/encrypted-keys/encrypted.o
  AS      arch/x86/realmode/rm/wakeup_asm.o
  AR      fs/notify/dnotify/built-in.a
  CC      security/keys/encrypted-keys/ecryptfs_format.o
  CC      fs/notify/inotify/inotify_fsnotify.o
  CC      security/safesetid/securityfs.o
  CC      arch/x86/realmode/rm/wakemain.o
  AR      virt/lib/built-in.a
  CC      arch/x86/entry/vdso/extable.o
  AR      virt/built-in.a
  COPY    certs/x509.genkey
  AS      arch/x86/lib/copy_mc_64.o
  CC      certs/blacklist.o
  CC      arch/x86/kernel/fpu/signal.o
  CC      fs/notify/inotify/inotify_user.o
  CC      arch/x86/coco/tdx/tdx-shared.o
  CC      arch/x86/realmode/rm/video-mode.o
  AR      security/yama/built-in.a
  AS      arch/x86/coco/tdx/tdcall.o
  CC      fs/verity/hash_algs.o
  AS      arch/x86/lib/copy_page_64.o
  CC      security/keys/trusted-keys/trusted_tpm1.o
  CC      arch/x86/events/amd/lbr.o
  CC      arch/x86/pci/init.o
  CC      net/core/request_sock.o
  AS      arch/x86/lib/copy_user_64.o
  AS      arch/x86/realmode/rm/copy.o
  CC      arch/x86/events/amd/brs.o
  AR      drivers/pinctrl/actions/built-in.a
  AR      drivers/pinctrl/bcm/built-in.a
  AS      arch/x86/realmode/rm/bioscall.o
  CC      security/apparmor/audit.o
  AR      drivers/pinctrl/cirrus/built-in.a
  CC      security/tomoyo/condition.o
  CC      arch/x86/realmode/rm/regs.o
  AR      drivers/pinctrl/freescale/built-in.a
  CC      arch/x86/coco/core.o
  AR      arch/x86/video/built-in.a
  CC      fs/crypto/fname.o
  CC      fs/crypto/hkdf.o
  CC      drivers/pinctrl/intel/pinctrl-baytrail.o
  CC      arch/x86/realmode/rm/video-vga.o
  AS      arch/x86/lib/copy_user_uncached_64.o
  AR      arch/x86/coco/tdx/built-in.a
  CC      crypto/asymmetric_keys/x509_loader.o
  CC      crypto/asymmetric_keys/x509_public_key.o
  CC      mm/kfence/report.o
  CC      arch/x86/kernel/fpu/xstate.o
  CC      arch/x86/xen/mmu.o
  CC      arch/x86/realmode/rm/video-vesa.o
  CC      fs/verity/init.o
  CC      block/partitions/atari.o
  CC      block/partitions/aix.o
  AS      arch/x86/power/hibernate_asm_64.o
  CC      arch/x86/xen/time.o
  CC      mm/filemap.o
  CC      arch/x86/realmode/rm/video-bios.o
  CC      security/selinux/hooks.o
  CC      arch/x86/xen/grant-table.o
  CC      arch/x86/power/hibernate.o
  CC      net/ethernet/eth.o
  CC [M]  lib/kunit/resource.o
  CC      block/bio.o
  AR      arch/x86/coco/built-in.a
  ASN.1   crypto/asymmetric_keys/pkcs7.asn1.[ch]
  PASYMS  arch/x86/realmode/rm/pasyms.h
  CC      fs/notify/fsnotify.o
  CC      fs/notify/fanotify/fanotify.o
  AR      security/safesetid/built-in.a
  LDS     arch/x86/realmode/rm/realmode.lds
  CC      arch/x86/pci/mmconfig_64.o
  CC      crypto/asymmetric_keys/pkcs7_trust.o
  LDS     arch/x86/entry/vdso/vdso.lds
  LD      arch/x86/realmode/rm/realmode.elf
  CC      arch/x86/lib/cpu.o
  RELOCS  arch/x86/realmode/rm/realmode.relocs
  OBJCOPY arch/x86/realmode/rm/realmode.bin
  AS      arch/x86/entry/vdso/vdso-note.o
  AS      arch/x86/realmode/rmpiggy.o
  CC      crypto/asymmetric_keys/pkcs7_verify.o
  CC      crypto/asymmetric_keys/verify_pefile.o
  CC      arch/x86/entry/vdso/vclock_gettime.o
  CC      arch/x86/entry/vsyscall/vsyscall_64.o
  AR      arch/x86/realmode/built-in.a
  GEN     certs/blacklist_hash_list
  CERT    certs/x509_revocation_list
  CERT    certs/x509_certificate_list
  GENKEY  certs/signing_key.pem
Generating a RSA private key
..  ASN.1   crypto/asymmetric_keys/mscode.asn1.[ch]
......  AR      fs/notify/inotify/built-in.a
....  AS      arch/x86/crypto/blake2s-core.o
.  AR      drivers/pinctrl/mediatek/built-in.a
.  CC      arch/x86/mm/pat/memtype.o
  AR      drivers/phy/built-in.a
..  AR      drivers/pinctrl/mvebu/built-in.a
...  CC      fs/crypto/hooks.o
  CC      init/do_mounts.o
..  CC      block/elevator.o
.  CC      drivers/gpio/gpiolib.o
...  CC      arch/x86/crypto/blake2s-glue.o
....  CC      drivers/gpio/gpiolib-devres.o
............  CC      fs/verity/measure.o
........  CC      drivers/gpio/gpiolib-legacy.o
..  CC      ipc/namespace.o
........++++
...  CC      init/do_mounts_initrd.o
........  CC      security/smack/smack_access.o
..........  CC      security/keys/encrypted-keys/masterkey_trusted.o
..  CC      drivers/pinctrl/intel/pinctrl-cherryview.o
...  CC [M]  sound/core/seq/seq_memory.o
....  AR      mm/kfence/built-in.a
..  CC [M]  sound/core/seq/seq_queue.o
.............  CC      drivers/pwm/core.o
.  CC      arch/x86/events/amd/ibs.o
....  CC      arch/x86/entry/vdso/vgetcpu.o
....  AS      arch/x86/lib/csum-copy_64.o
......  CC      block/partitions/cmdline.o
.  CC      arch/x86/crypto/crc32c-intel_glue.o
.  CC      arch/x86/lib/csum-partial_64.o
..  CC      arch/x86/lib/csum-wrappers_64.o
.  GEN     security/apparmor/capability_names.h
  AR      arch/x86/power/built-in.a
..  AS      arch/x86/entry/vdso/vsgx.o
.  CC      security/apparmor/task.o
.  CC      arch/x86/xen/suspend.o
.  CC      security/apparmor/ipc.o
.  CC      certs/blacklist_hashes.o
....  CC      arch/x86/pci/direct.o
........  CC      arch/x86/pci/mmconfig-shared.o
......+  HOSTCC  arch/x86/entry/vdso/vdso2c
+++
writing new private key to 'certs/signing_key.pem'
-----
  CC      arch/x86/lib/delay.o
  CC      fs/crypto/keyring.o
  CC      security/keys/trusted-keys/trusted_tpm2.o
  CC      arch/x86/xen/enlighten_hvm.o
  AS      certs/revocation_certificates.o
  CC [M]  lib/kunit/static_stub.o
  CC      kernel/locking/mutex.o
  CC      crypto/asymmetric_keys/x509.asn1.o
  CC      security/tomoyo/domain.o
  CC      fs/notify/fanotify/fanotify_user.o
  CC      kernel/locking/semaphore.o
  CERT    certs/signing_key.x509
  AS      certs/system_certificates.o
  CC      crypto/asymmetric_keys/x509_akid.asn1.o
  AR      certs/built-in.a
  CC      security/keys/trusted-keys/tpm2key.asn1.o
  CC      ipc/mq_sysctl.o
  CC      crypto/asymmetric_keys/x509_cert_parser.o
  CC [M]  sound/core/seq/seq_fifo.o
  LDS     arch/x86/entry/vdso/vdso32/vdso32.lds
  AS      arch/x86/entry/vsyscall/vsyscall_emu_64.o
  AS      arch/x86/entry/vdso/vdso32/note.o
  AR      arch/x86/entry/vsyscall/built-in.a
  CC      fs/verity/open.o
  CC      crypto/api.o
  AS      arch/x86/entry/vdso/vdso32/system_call.o
  CC [M]  crypto/async_tx/async_tx.o
  AR      security/keys/encrypted-keys/built-in.a
  CC      drivers/pinctrl/intel/pinctrl-intel.o
  CC      init/initramfs.o
  CC      arch/x86/mm/pat/memtype_interval.o
  AS      arch/x86/entry/vdso/vdso32/sigreturn.o
  CC      arch/x86/entry/vdso/vdso32/vclock_gettime.o
  AS      arch/x86/crypto/crc32c-pcl-intel-asm_64.o
  CC      arch/x86/events/intel/core.o
  AR      arch/x86/kernel/fpu/built-in.a
  CC      fs/notify/notification.o
  CC      arch/x86/lib/error-inject.o
  CC      arch/x86/kernel/cpu/mce/core.o
  AS [M]  arch/x86/crypto/aesni-intel_asm.o
  AR      ipc/built-in.a
  AS      arch/x86/lib/getuser.o
  CC      kernel/power/qos.o
  CC      kernel/printk/printk.o
  CC      fs/notify/group.o
  CC      fs/verity/read_metadata.o
  CC [M]  arch/x86/crypto/aesni-intel_glue.o
  GEN     arch/x86/lib/inat-tables.c
  CC      block/partitions/mac.o
  CC [M]  lib/kunit/string-stream.o
  CC      security/smack/smackfs.o
  CC      mm/mempool.o
  CC      arch/x86/pci/xen.o
  CC      fs/notify/mark.o
  CC [M]  sound/pci/hda/hda_bind.o
  AR      security/keys/trusted-keys/built-in.a
  CC [M]  sound/pci/hda/hda_codec.o
  CC [M]  sound/core/seq/seq_prioq.o
  CC      security/keys/gc.o
  CC      fs/crypto/keysetup.o
  CC      init/calibrate.o
  CC      crypto/asymmetric_keys/pkcs7.asn1.o
  CC      arch/x86/lib/insn-eval.o
  AR      arch/x86/mm/pat/built-in.a
  CC      arch/x86/entry/vdso/vdso32/vgetcpu.o
  CC      arch/x86/mm/init.o
  CC      crypto/asymmetric_keys/pkcs7_parser.o
  CC      crypto/asymmetric_keys/mscode_parser.o
  AR      net/ethernet/built-in.a
  CC      drivers/pci/msi/pcidev_msi.o
  CC      arch/x86/entry/vdso/vdso32-setup.o
  AR      drivers/rapidio/switches/built-in.a
  CC      kernel/locking/rwsem.o
  AR      drivers/rapidio/devices/built-in.a
  CC      security/apparmor/lib.o
  CC      io_uring/xattr.o
  CC      drivers/rapidio/rio.o
  CC      kernel/locking/percpu-rwsem.o
  CC      kernel/locking/irqflag-debug.o
  CC      security/tomoyo/environ.o
  AR      fs/notify/fanotify/built-in.a
  CC      net/core/skbuff.o
  CC [M]  lib/kunit/assert.o
  CC      drivers/pci/pcie/portdrv.o
  CC      drivers/pwm/sysfs.o
  CC [M]  lib/kunit/try-catch.o
  CC      block/partitions/ldm.o
  CC      arch/x86/events/amd/iommu.o
  CC      drivers/video/console/dummycon.o
  CC [M]  crypto/async_tx/async_memcpy.o
  CC      drivers/video/backlight/backlight.o
  CC [M]  sound/core/seq/seq_timer.o
  AS [M]  arch/x86/crypto/aesni-intel_avx-x86_64.o
  CC      io_uring/nop.o
  CC      kernel/locking/mutex-debug.o
  CC      arch/x86/xen/mmu_hvm.o
  CC      arch/x86/lib/insn.o
  CC      security/keys/key.o
  CC      drivers/pci/msi/api.o
  CC      fs/verity/verify.o
  CC      crypto/asymmetric_keys/mscode.asn1.o
  AS [M]  arch/x86/crypto/aes_ctrby8_avx-x86_64.o
  VDSO    arch/x86/entry/vdso/vdso64.so.dbg
  CC      init/init_task.o
  CC [M]  drivers/pinctrl/intel/pinctrl-alderlake.o
  AS      arch/x86/lib/memcpy_64.o
  CC      drivers/gpio/gpiolib-cdev.o
  AS [M]  arch/x86/crypto/sha1_avx2_x86_64_asm.o
  VDSO    arch/x86/entry/vdso/vdso32.so.dbg
  OBJCOPY arch/x86/entry/vdso/vdso64.so
  CC      drivers/gpio/gpiolib-sysfs.o
  CC [M]  sound/pci/hda/hda_jack.o
  OBJCOPY arch/x86/entry/vdso/vdso32.so
  VDSO2C  arch/x86/entry/vdso/vdso-image-64.c
  CC      kernel/irq/irqdesc.o
  AS [M]  arch/x86/crypto/sha1_ssse3_asm.o
  CC      lib/math/div64.o
  VDSO2C  arch/x86/entry/vdso/vdso-image-32.c
  CC      fs/notify/fdinfo.o
  CC      arch/x86/entry/vdso/vdso-image-64.o
  AR      crypto/asymmetric_keys/built-in.a
  CC      arch/x86/kernel/cpu/mce/severity.o
  CC      drivers/pwm/pwm-crc.o
  CC [M]  arch/x86/crypto/sha1_ssse3_glue.o
  CC      lib/math/gcd.o
  CC      kernel/power/main.o
  CC      arch/x86/pci/fixup.o
  CC      fs/crypto/keysetup_v1.o
  CC      lib/crypto/mpi/generic_mpih-lshift.o
  CC      io_uring/fs.o
  CC [M]  sound/core/seq/seq_system.o
  AR      arch/x86/events/amd/built-in.a
  CC      security/selinux/selinuxfs.o
  CC      lib/crypto/mpi/generic_mpih-mul1.o
  AS      arch/x86/lib/memmove_64.o
  CC      security/smack/smack_netfilter.o
  CC      lib/crypto/mpi/generic_mpih-mul2.o
  CC [M]  lib/kunit/executor.o
  CC      lib/crypto/mpi/generic_mpih-mul3.o
  CC      lib/math/lcm.o
  CC      security/apparmor/match.o
  CC      security/tomoyo/file.o
  CC      arch/x86/entry/vdso/vdso-image-32.o
  CC      arch/x86/xen/suspend_hvm.o
  CC      drivers/video/console/vgacon.o
  CC      lib/math/int_log.o
  CC [M]  drivers/pinctrl/intel/pinctrl-meteorlake.o
  CC      block/partitions/msdos.o
  CC      lib/crypto/memneq.o
  CC      drivers/pci/pcie/rcec.o
  CC      arch/x86/mm/init_64.o
  CC [M]  crypto/async_tx/async_xor.o
  CC      mm/oom_kill.o
  CC      arch/x86/mm/fault.o
  CC      security/keys/keyring.o
  CC      kernel/locking/lockdep.o
  AS      arch/x86/lib/memset_64.o
  AR      arch/x86/entry/vdso/built-in.a
  AR      fs/notify/built-in.a
  CC      lib/math/int_pow.o
  CC      drivers/rapidio/rio-access.o
  AS      arch/x86/entry/entry.o
  CC      drivers/pwm/pwm-lpss.o
  CC      drivers/pwm/pwm-lpss-pci.o
  CC      arch/x86/events/intel/bts.o
  CC      arch/x86/lib/misc.o
  CC      lib/math/int_sqrt.o
  AS [M]  arch/x86/crypto/sha1_ni_asm.o
  CC      drivers/pci/msi/msi.o
  CC      drivers/pci/msi/irqdomain.o
  AS [M]  arch/x86/crypto/sha256-ssse3-asm.o
  CC      arch/x86/events/intel/ds.o
  CC      arch/x86/events/zhaoxin/core.o
  CC      lib/crypto/mpi/generic_mpih-rshift.o
  AR      drivers/video/backlight/built-in.a
  CC      arch/x86/kernel/cpu/mce/genpool.o
  CC      lib/math/reciprocal_div.o
  CC      arch/x86/events/intel/knc.o
  CC      kernel/printk/printk_safe.o
  CC      fs/crypto/policy.o
  CC      init/version.o
  AS [M]  arch/x86/crypto/sha256-avx-asm.o
  CC [M]  lib/kunit/attributes.o
  CC      mm/fadvise.o
  CC      fs/verity/signature.o
  CC      io_uring/splice.o
  AS [M]  arch/x86/crypto/sha256-avx2-asm.o
  CC      arch/x86/pci/acpi.o
  CC      arch/x86/lib/pc-conf-reg.o
  CC      arch/x86/xen/platform-pci-unplug.o
  CC [M]  arch/x86/crypto/sha256_ssse3_glue.o
  CC      lib/math/rational.o
  CC [M]  drivers/pinctrl/intel/pinctrl-tigerlake.o
  CC      arch/x86/pci/legacy.o
  CC      drivers/gpio/gpiolib-acpi.o
  AS      arch/x86/entry/entry_64.o
  CC      kernel/irq/handle.o
  CC      drivers/pci/pcie/aspm.o
  CC [M]  sound/core/seq/seq_ports.o
  CC      security/apparmor/path.o
  AS      arch/x86/lib/putuser.o
  CC      drivers/pwm/pwm-lpss-platform.o
  CC [M]  sound/pci/hda/hda_auto_parser.o
  CC      drivers/gpio/gpiolib-swnode.o
  AR      init/built-in.a
  AR      security/smack/built-in.a
  CC      lib/crypto/utils.o
  CC      drivers/video/fbdev/core/fb_notify.o
  CC      drivers/video/aperture.o
  CC      lib/crypto/mpi/generic_mpih-sub1.o
  AR      fs/verity/built-in.a
  CC      arch/x86/kernel/cpu/mce/intel.o
  CC      security/tomoyo/gc.o
  CC      security/tomoyo/group.o
  CC [M]  crypto/async_tx/async_pq.o
  CC [M]  lib/kunit/device.o
  CC      block/partitions/osf.o
  CC      arch/x86/entry/syscall_64.o
  CC      drivers/rapidio/rio-driver.o
  CC      arch/x86/events/intel/lbr.o
  CC      drivers/rapidio/rio-sysfs.o
  CC      kernel/power/console.o
  AR      drivers/pinctrl/intel/built-in.a
  AS      arch/x86/lib/retpoline.o
  AR      arch/x86/events/zhaoxin/built-in.a
  AR      drivers/pinctrl/nomadik/built-in.a
  CC      security/keys/keyctl.o
  AR      drivers/pinctrl/nuvoton/built-in.a
  CC      arch/x86/events/intel/p4.o
  AS [M]  arch/x86/crypto/sha256_ni_asm.o
  CC      io_uring/sync.o
  AR      drivers/pinctrl/nxp/built-in.a
  CC      arch/x86/lib/usercopy.o
  AR      drivers/video/console/built-in.a
  CC      arch/x86/lib/usercopy_64.o
  AR      drivers/pinctrl/qcom/built-in.a
  AR      drivers/pwm/built-in.a
  AS [M]  arch/x86/crypto/sha512-ssse3-asm.o
  AR      drivers/pinctrl/sprd/built-in.a
  AS [M]  arch/x86/crypto/sha512-avx-asm.o
  CC      drivers/video/fbdev/core/fb_info.o
  CC      kernel/printk/nbcon.o
  CC      security/selinux/netlink.o
  CC [M]  lib/math/prime_numbers.o
  AR      drivers/pinctrl/sunplus/built-in.a
  AS [M]  arch/x86/crypto/sha512-avx2-asm.o
  CC      drivers/pinctrl/core.o
  AR      drivers/pinctrl/ti/built-in.a
  CC      drivers/pinctrl/pinctrl-utils.o
  AR      drivers/video/fbdev/omap/built-in.a
  CC      arch/x86/xen/setup.o
  CC      arch/x86/pci/irq.o
  AR      drivers/pci/msi/built-in.a
  CC [M]  arch/x86/crypto/sha512_ssse3_glue.o
  CC [M]  crypto/async_tx/async_raid6_recov.o
  CC      security/bpf/hooks.o
  CC      block/blk-core.o
  CC      lib/crypto/mpi/generic_mpih-add1.o
  CC      lib/crypto/mpi/ec.o
  CC      arch/x86/entry/common.o
  CC      arch/x86/pci/numachip.o
  CC      kernel/irq/manage.o
  CC      arch/x86/kernel/cpu/mce/amd.o
  CC [M]  sound/core/seq/seq_info.o
  CC      lib/crypto/mpi/mpicoder.o
  CC      security/apparmor/domain.o
  CC      security/apparmor/policy.o
  CC      block/partitions/sgi.o
  CC      fs/crypto/bio.o
  CC      security/apparmor/policy_unpack.o
  CC      mm/maccess.o
  CC      kernel/power/process.o
  CC      io_uring/advise.o
  CC      drivers/gpio/gpio-mmio.o
  CC      kernel/printk/printk_ringbuffer.o
  CC      drivers/gpio/gpio-crystalcove.o
  CC      security/tomoyo/load_policy.o
  CC [M]  lib/kunit/debugfs.o
  CC      arch/x86/kernel/cpu/mce/threshold.o
  CC      arch/x86/lib/msr-smp.o
  CC      arch/x86/mm/ioremap.o
  CC      mm/page-writeback.o
  CC      security/selinux/nlmsgtab.o
  CC      drivers/pci/pcie/aer.o
  CC      arch/x86/events/core.o
  CC [M]  sound/pci/hda/hda_sysfs.o
  AS [M]  arch/x86/crypto/ghash-clmulni-intel_asm.o
  AR      drivers/rapidio/built-in.a
  CC      kernel/locking/lockdep_proc.o
  LD [M]  sound/core/seq/snd-seq.o
  AR      security/bpf/built-in.a
  CC [M]  sound/core/sound.o
  CC      arch/x86/kernel/acpi/boot.o
  CC      arch/x86/kernel/acpi/sleep.o
  CC [M]  arch/x86/crypto/ghash-clmulni-intel_glue.o
  CC      kernel/locking/spinlock.o
  CC      kernel/rcu/update.o
  CC      drivers/pci/pcie/err.o
  CC      arch/x86/kernel/cpu/mce/apei.o
  CC      security/keys/permission.o
  AR      lib/math/built-in.a
  CC      arch/x86/xen/apic.o
  CC      mm/folio-compat.o
  CC      block/partitions/sun.o
  CC      arch/x86/pci/common.o
  CC      kernel/sched/fair.o
  CC      drivers/video/fbdev/core/fbmem.o
  AS      arch/x86/entry/thunk_64.o
  CC      arch/x86/lib/cache-smp.o
  CC      kernel/printk/sysctl.o
  AR      lib/kunit/built-in.a
  CC      arch/x86/events/intel/p6.o
  LD [M]  lib/kunit/kunit.o
  CC      drivers/video/screen_info_generic.o
  CC      arch/x86/events/intel/pt.o
  CC      io_uring/filetable.o
  CC      drivers/video/screen_info_pci.o
  CC      lib/crypto/mpi/mpi-add.o
  CC      drivers/pinctrl/pinmux.o
  CC      crypto/cipher.o
  CC      security/tomoyo/memory.o
  AS [M]  arch/x86/crypto/polyval-clmulni_asm.o
  CC      fs/crypto/inline_crypt.o
  CC      arch/x86/lib/msr.o
  CC      security/apparmor/procattr.o
  AR      kernel/printk/built-in.a
  AS      arch/x86/entry/entry_64_compat.o
  CC      kernel/power/suspend.o
  CC      arch/x86/entry/syscall_32.o
  CC [M]  arch/x86/crypto/polyval-clmulni_glue.o
  CC      security/tomoyo/mount.o
  CC      lib/crypto/mpi/mpi-bit.o
  CC      drivers/pci/pcie/pme.o
  CC      drivers/video/cmdline.o
  CC      security/selinux/netif.o
  CC      arch/x86/events/probe.o
  CC      arch/x86/kernel/cpu/mce/dev-mcelog.o
  CC      arch/x86/events/utils.o
  CC      drivers/gpio/gpio-palmas.o
  CC      kernel/locking/osq_lock.o
  CC [M]  sound/core/init.o
  CC      drivers/pci/hotplug/pci_hotplug_core.o
  CC      block/partitions/ultrix.o
  CC      kernel/irq/spurious.o
  CC      arch/x86/pci/early.o
  CC      arch/x86/pci/bus_numa.o
  CC      arch/x86/pci/amd_bus.o
  CC [M]  sound/pci/hda/hda_controller.o
  CC [M]  sound/core/memory.o
  CC      kernel/locking/qspinlock.o
  CC      kernel/power/hibernate.o
  CC      security/keys/process_keys.o
  AS [M]  arch/x86/crypto/crc32-pclmul_asm.o
  CC      drivers/pinctrl/pinconf.o
  CC      arch/x86/mm/extable.o
  CC      drivers/video/nomodeset.o
  CC      io_uring/openclose.o
  CC      net/core/datagram.o
  CC      block/blk-sysfs.o
  CC [M]  arch/x86/crypto/crc32-pclmul_glue.o
  CC      arch/x86/xen/pmu.o
  CC      drivers/pci/pcie/dpc.o
  AS      arch/x86/kernel/acpi/wakeup_64.o
  CC      arch/x86/kernel/acpi/apei.o
  CC      crypto/compress.o
  CC      drivers/gpio/gpio-rc5t583.o
  CC      kernel/locking/rtmutex_api.o
  AS      arch/x86/lib/msr-reg.o
  CC      kernel/irq/resend.o
  CC      drivers/gpio/gpio-tps6586x.o
  CC      arch/x86/kernel/apic/apic.o
  CC      arch/x86/xen/suspend_pv.o
  CC      drivers/video/fbdev/core/fbcmap.o
  CC      kernel/rcu/sync.o
  CC      arch/x86/lib/msr-reg-export.o
  CC      arch/x86/kernel/apic/apic_common.o
  CC      security/tomoyo/network.o
  CC      lib/crypto/mpi/mpi-cmp.o
  CC      block/partitions/efi.o
  CC      kernel/power/snapshot.o
  AR      arch/x86/entry/built-in.a
  CC      security/apparmor/lsm.o
  CC      kernel/rcu/srcutree.o
  AR      arch/x86/pci/built-in.a
  AR      arch/x86/kernel/cpu/mce/built-in.a
  CC      block/blk-flush.o
  AR      fs/crypto/built-in.a
  CC      kernel/locking/spinlock_debug.o
  CC      arch/x86/kernel/cpu/mtrr/mtrr.o
  CC      security/selinux/netnode.o
  AR      fs/nfs_common/built-in.a
  CC [M]  fs/nfs_common/grace.o
  CC      drivers/pinctrl/pinconf-generic.o
  CC      drivers/pci/pcie/ptm.o
  AS [M]  arch/x86/crypto/crct10dif-pcl-asm_64.o
  CC      kernel/rcu/tree.o
  CC      drivers/pinctrl/pinctrl-amd.o
  CC      drivers/pci/hotplug/cpci_hotplug_core.o
  CC [M]  arch/x86/crypto/crct10dif-pclmul_glue.o
  CC      arch/x86/events/msr.o
  AS      arch/x86/lib/hweight.o
  CC      arch/x86/kernel/acpi/cppc.o
  CC      arch/x86/mm/mmap.o
  CC      arch/x86/kernel/acpi/cstate.o
  CC      io_uring/uring_cmd.o
  CC      io_uring/epoll.o
  CC      io_uring/statx.o
  CC      kernel/irq/chip.o
  CC      drivers/gpio/gpio-tps65910.o
  CC [M]  arch/x86/events/rapl.o
  CC      kernel/rcu/rcu_segcblist.o
  CC [M]  sound/core/control.o
  CC      arch/x86/events/intel/uncore.o
  CC      arch/x86/kernel/apic/apic_noop.o
  CC [M]  sound/pci/hda/hda_proc.o
  CC      mm/readahead.o
  CC      arch/x86/kernel/apic/ipi.o
  CC      mm/swap.o
  CC      arch/x86/kernel/apic/vector.o
  CC      arch/x86/lib/iomem.o
  CC      crypto/algapi.o
  CC      crypto/scatterwalk.o
  LD [M]  arch/x86/crypto/aesni-intel.o
  CC      arch/x86/kernel/apic/init.o
  LD [M]  arch/x86/crypto/sha1-ssse3.o
  LD [M]  arch/x86/crypto/sha256-ssse3.o
  LD [M]  arch/x86/crypto/sha512-ssse3.o
  CC      lib/crypto/mpi/mpi-sub-ui.o
  CC      block/partitions/karma.o
  LD [M]  arch/x86/crypto/ghash-clmulni-intel.o
  LD [M]  arch/x86/crypto/polyval-clmulni.o
  LD [M]  arch/x86/crypto/crc32-pclmul.o
  LD [M]  arch/x86/crypto/crct10dif-pclmul.o
  CC      security/keys/request_key.o
  AR      arch/x86/crypto/built-in.a
  CC      lib/crypto/mpi/mpi-div.o
  CC      arch/x86/mm/pgtable.o
  CC      security/tomoyo/realpath.o
  CC      arch/x86/ia32/audit.o
  CC      kernel/irq/dummychip.o
  CC      kernel/locking/qrwlock.o
  CC [M]  sound/pci/hda/hda_hwdep.o
  CC      drivers/pci/pcie/edr.o
  CC      fs/iomap/trace.o
  CC      security/selinux/netport.o
  CC      arch/x86/kernel/cpu/mtrr/if.o
  CC      kernel/livepatch/core.o
  CC      drivers/idle/intel_idle.o
  CC      arch/x86/kernel/cpu/mtrr/generic.o
  CC      drivers/video/fbdev/core/modedb.o
  AR      arch/x86/ia32/built-in.a
  AR      drivers/gpio/built-in.a
  CC [M]  sound/core/misc.o
  CC      kernel/livepatch/patch.o
  CC      arch/x86/events/intel/uncore_nhmex.o
  CC      block/blk-settings.o
  CC      security/tomoyo/securityfs_if.o
  CC      security/landlock/setup.o
  CC      kernel/power/swap.o
  CC      security/landlock/syscalls.o
  CC      drivers/pinctrl/pinctrl-sx150x.o
  CC      arch/x86/xen/p2m.o
  AR      arch/x86/kernel/acpi/built-in.a
  CC      drivers/pci/hotplug/cpci_hotplug_pci.o
  CC      arch/x86/kernel/kprobes/core.o
  LDS     arch/x86/kernel/vmlinux.lds
  AR      drivers/video/fbdev/omap2/omapfb/dss/built-in.a
  CC      arch/x86/kernel/kprobes/opt.o
  AR      drivers/video/fbdev/omap2/omapfb/displays/built-in.a
  AR      drivers/video/fbdev/omap2/omapfb/built-in.a
  AR      drivers/video/fbdev/omap2/built-in.a
  CC      arch/x86/kernel/kprobes/ftrace.o
  CC      block/partitions/sysv68.o
  AS      arch/x86/lib/iomap_copy_64.o
  CC      drivers/video/fbdev/imsttfb.o
  CC      net/core/stream.o
  CC      fs/quota/dquot.o
  CC      arch/x86/lib/inat.o
  CC      fs/proc/task_mmu.o
  CC      drivers/video/fbdev/core/fbcvt.o
  CC      lib/crypto/mpi/mpi-inv.o
  CC [M]  sound/pci/hda/hda_beep.o
  AR      drivers/pci/pcie/built-in.a
  CC      drivers/video/fbdev/core/fb_cmdline.o
  CC      security/keys/request_key_auth.o
  CC      fs/kernfs/mount.o
  AR      arch/x86/lib/built-in.a
  CC      fs/kernfs/inode.o
  AR      arch/x86/lib/lib.a
  CC      security/keys/user_defined.o
  CC      io_uring/net.o
  CC      kernel/irq/devres.o
  CC      kernel/irq/autoprobe.o
  CC      security/keys/compat.o
  CC      fs/proc/inode.o
  CC      lib/crypto/chacha.o
  AR      kernel/locking/built-in.a
  CC      security/landlock/object.o
  CC      drivers/pci/hotplug/acpi_pcihp.o
  CC      arch/x86/mm/physaddr.o
  CC      lib/crypto/mpi/mpi-mod.o
  CC      arch/x86/kernel/cpu/microcode/core.o
  CC      security/selinux/status.o
  CC      arch/x86/events/intel/uncore_snb.o
  CC [M]  sound/core/device.o
  CC      fs/iomap/iter.o
  CC      security/tomoyo/tomoyo.o
  AR      drivers/pinctrl/built-in.a
  CC      security/tomoyo/util.o
  CC      arch/x86/kernel/cpu/microcode/intel.o
  AR      drivers/idle/built-in.a
  CC      arch/x86/kernel/cpu/microcode/amd.o
  CC      crypto/proc.o
  CC      drivers/pci/hotplug/pciehp_core.o
  AR      arch/x86/kernel/kprobes/built-in.a
  AR      block/partitions/built-in.a
  AS      arch/x86/kernel/head_64.o
  CC      lib/crypto/aes.o
  CC      lib/crypto/gf128mul.o
  CC      kernel/livepatch/shadow.o
  CC      security/keys/compat_dh.o
  CC      security/landlock/ruleset.o
  GEN     security/apparmor/rlim_names.h
  CC      arch/x86/kernel/cpu/mtrr/cleanup.o
  CC      security/apparmor/secid.o
  CC      fs/sysfs/file.o
  CC      kernel/power/user.o
  CC      fs/sysfs/dir.o
  CC      arch/x86/mm/tlb.o
  CC      fs/proc/root.o
  CC      crypto/aead.o
  CC      arch/x86/kernel/apic/hw_nmi.o
  CC      block/blk-ioc.o
  CC      fs/kernfs/dir.o
  CC      lib/crypto/mpi/mpi-mul.o
  CC      fs/proc/base.o
  CC      security/selinux/ss/ebitmap.o
  CC      lib/crypto/mpi/mpih-cmp.o
  CC [M]  sound/pci/hda/patch_hdmi.o
  CC [M]  sound/pci/hda/hda_eld.o
  CC      arch/x86/xen/enlighten_pv.o
  CC      fs/proc/generic.o
  CC      drivers/video/fbdev/core/fb_backlight.o
  CC      crypto/geniv.o
  CC      fs/iomap/buffered-io.o
  CC      drivers/video/fbdev/core/fbmon.o
  CC      kernel/irq/irqdomain.o
  CC      security/keys/proc.o
  CC      security/landlock/cred.o
  CC      fs/sysfs/symlink.o
  CC      arch/x86/events/intel/uncore_snbep.o
  CC      security/keys/sysctl.o
  CC [M]  sound/core/info.o
  CC      kernel/dma/mapping.o
  CC      security/keys/persistent.o
  CC      drivers/video/hdmi.o
  CC      mm/truncate.o
  CC      drivers/pci/hotplug/pciehp_ctrl.o
  CC      security/keys/dh.o
  CC      kernel/power/wakelock.o
  CC      arch/x86/kernel/apic/io_apic.o
  CC      net/core/scm.o
  CC      security/selinux/ss/hashtab.o
  AR      arch/x86/kernel/cpu/mtrr/built-in.a
  CC      io_uring/msg_ring.o
  CC      net/core/gen_stats.o
  CC      net/core/gen_estimator.o
  CC      security/tomoyo/common.o
  AR      arch/x86/kernel/cpu/microcode/built-in.a
  CC      lib/crypto/blake2s.o
  CC      fs/quota/quota.o
  CC      arch/x86/kernel/cpu/resctrl/core.o
  CC      kernel/livepatch/state.o
  CC      security/apparmor/file.o
  CC      arch/x86/kernel/cpu/sgx/driver.o
  CC      lib/crypto/blake2s-generic.o
  CC      kernel/livepatch/transition.o
  CC      lib/crypto/mpi/mpih-div.o
  CC      mm/vmscan.o
  CC      mm/shrinker.o
  CC      mm/shmem.o
  CC      security/landlock/task.o
  CC      mm/util.o
  CC      kernel/power/poweroff.o
  CC      security/keys/keyctl_pkey.o
  CC      crypto/lskcipher.o
  CC      arch/x86/kernel/cpu/resctrl/rdtgroup.o
  CC      drivers/pci/hotplug/pciehp_pci.o
  CC      arch/x86/mm/cpu_entry_area.o
  CC      security/selinux/ss/symtab.o
  CC      lib/crypto/sha1.o
  CC      fs/proc/array.o
  CC      block/blk-map.o
  CC      kernel/power/energy_model.o
  CC [M]  sound/pci/hda/hda_intel.o
  CC      fs/quota/kqid.o
  CC      io_uring/timeout.o
  CC      fs/sysfs/mount.o
  CC      security/selinux/ss/sidtab.o
  CC [M]  sound/core/info_oss.o
  CC      fs/sysfs/group.o
  CC      kernel/irq/proc.o
  CC      arch/x86/kernel/cpu/sgx/encl.o
  CC      fs/kernfs/file.o
  CC      kernel/irq/migration.o
  CC      lib/crypto/mpi/mpih-mul.o
  AR      security/keys/built-in.a
  CC      kernel/irq/cpuhotplug.o
  CC      arch/x86/events/intel/uncore_discovery.o
  CC      arch/x86/mm/maccess.o
  CC      drivers/video/fbdev/core/fb_defio.o
  CC      kernel/dma/direct.o
  CC      arch/x86/kernel/cpu/sgx/ioctl.o
  CC      security/landlock/fs.o
  CC      security/integrity/ima/ima_fs.o
  CC      security/integrity/ima/ima_queue.o
  CC      security/selinux/ss/avtab.o
  CC      drivers/pci/hotplug/pciehp_hpc.o
  CC      kernel/sched/build_policy.o
  CC      mm/mmzone.o
  AR      kernel/rcu/built-in.a
  CC      kernel/entry/common.o
  CC      security/apparmor/policy_ns.o
  CC      mm/vmstat.o
  AR      kernel/livepatch/built-in.a
  CC      fs/proc/fd.o
  CC      kernel/module/main.o
  CC      kernel/module/strict_rwx.o
  CC      security/commoncap.o
  CC      security/landlock/net.o
  CC [M]  sound/core/isadma.o
  CC      arch/x86/mm/pgprot.o
  CC      lib/crypto/sha256.o
  CC      arch/x86/kernel/cpu/sgx/main.o
  CC      fs/quota/netlink.o
  CC      arch/x86/kernel/cpu/sgx/virt.o
  CC      net/core/net_namespace.o
  CC      fs/iomap/direct-io.o
  CC      fs/proc/proc_tty.o
  CC      kernel/irq/pm.o
  CC      lib/crypto/mpi/mpi-pow.o
  CC      io_uring/sqpoll.o
  CC      arch/x86/kernel/apic/msi.o
  CC      arch/x86/kernel/apic/apic_numachip.o
  CC [M]  sound/core/sound_oss.o
  CC      net/core/secure_seq.o
  AR      fs/sysfs/built-in.a
  CC      net/core/flow_dissector.o
  CC      mm/backing-dev.o
  AR      kernel/power/built-in.a
  AR      security/tomoyo/built-in.a
  CC      kernel/irq/msi.o
  CC      net/core/sysctl_net_core.o
  CC      crypto/skcipher.o
  CC      kernel/dma/ops_helpers.o
  CC      kernel/dma/dummy.o
  CC      security/integrity/ima/ima_init.o
  CC [M]  arch/x86/events/intel/cstate.o
  CC      net/core/dev.o
  CC      security/lsm_syscalls.o
  CC      arch/x86/kernel/apic/x2apic_uv_x.o
  CC      drivers/pci/hotplug/shpchp_core.o
  LD [M]  sound/pci/hda/snd-hda-codec.o
  LD [M]  sound/pci/hda/snd-hda-codec-hdmi.o
  CC      block/blk-merge.o
  LD [M]  sound/pci/hda/snd-hda-intel.o
  CC      arch/x86/mm/hugetlbpage.o
  CC      arch/x86/kernel/cpu/resctrl/monitor.o
  CC      drivers/pci/hotplug/shpchp_ctrl.o
  CC      block/blk-timeout.o
  CC      security/selinux/ss/policydb.o
  CC      fs/proc/cmdline.o
  CC      kernel/entry/syscall_user_dispatch.o
  CC      drivers/video/fbdev/core/fb_chrdev.o
  CC      block/blk-lib.o
  CC      drivers/pci/hotplug/shpchp_pci.o
  CC      fs/kernfs/symlink.o
  CC      drivers/pci/hotplug/shpchp_sysfs.o
  AR      security/landlock/built-in.a
  CC [M]  sound/core/vmaster.o
  CC      drivers/video/fbdev/core/fb_procfs.o
  CC      security/apparmor/label.o
  CC      drivers/pci/hotplug/shpchp_hpc.o
  CC      mm/mm_init.o
  CC      drivers/video/fbdev/core/fbsysfs.o
  CC      kernel/dma/swiotlb.o
  CC      kernel/dma/pool.o
  CC      security/integrity/ima/ima_main.o
  CC      kernel/dma/remap.o
  CC      lib/crypto/mpi/mpiutil.o
  CC      drivers/pci/hotplug/acpiphp_core.o
  AR      fs/quota/built-in.a
  CC      fs/proc/consoles.o
  AR      arch/x86/events/intel/built-in.a
  CC      kernel/irq/affinity.o
  CC      security/apparmor/mount.o
  LD [M]  arch/x86/events/intel/intel-cstate.o
  AR      arch/x86/events/built-in.a
  CC      arch/x86/mm/dump_pagetables.o
  CC      security/min_addr.o
  CC      arch/x86/mm/kmmio.o
  CC      kernel/entry/kvm.o
  CC      io_uring/fdinfo.o
  AR      arch/x86/platform/atom/built-in.a
  AR      arch/x86/platform/ce4100/built-in.a
  CC      arch/x86/net/bpf_jit_comp.o
  CC      lib/zlib_inflate/inffast.o
  CC      arch/x86/platform/efi/memmap.o
  CC      drivers/char/ipmi/ipmi_dmi.o
  CC      security/integrity/evm/evm_main.o
  CC      security/integrity/evm/evm_crypto.o
  AR      fs/kernfs/built-in.a
  CC      arch/x86/kernel/cpu/resctrl/ctrlmondata.o
  CC      fs/iomap/fiemap.o
  CC      drivers/video/fbdev/core/fbcon.o
  AR      arch/x86/platform/geode/built-in.a
  AR      arch/x86/kernel/cpu/sgx/built-in.a
  CC      arch/x86/kernel/cpu/resctrl/pseudo_lock.o
  CC      crypto/seqiv.o
  CC      net/core/dev_addr_lists.o
  CC      lib/zlib_inflate/inflate.o
  CC      drivers/acpi/acpica/dsargs.o
  CC      security/integrity/ima/ima_crypto.o
  CC      drivers/acpi/numa/srat.o
  CC      security/security.o
  CC      lib/zlib_inflate/infutil.o
  CC      fs/proc/cpuinfo.o
  CC [M]  sound/core/ctljack.o
  CC      kernel/irq/matrix.o
  CC      block/blk-mq.o
  CC      arch/x86/kernel/apic/x2apic_phys.o
  CC      block/blk-mq-tag.o
  CC      kernel/module/kmod.o
  CC      net/core/dst.o
  CC      arch/x86/mm/pf_in.o
  AR      kernel/dma/built-in.a
  CC      security/inode.o
  CC      security/integrity/ima/ima_api.o
  CC      drivers/acpi/acpica/dscontrol.o
  CC      kernel/module/livepatch.o
  AR      lib/crypto/mpi/built-in.a
  CC      security/integrity/ima/ima_policy.o
  AR      lib/crypto/built-in.a
  CC      io_uring/tctx.o
  CC      lib/zlib_inflate/inftrees.o
  CC      arch/x86/platform/efi/quirks.o
  CC      drivers/acpi/numa/hmat.o
  CC      drivers/pci/hotplug/acpiphp_glue.o
  CC      security/integrity/iint.o
  CC      arch/x86/kernel/apic/x2apic_cluster.o
  CC      crypto/ahash.o
  CC [M]  sound/core/jack.o
  CC      drivers/pnp/pnpacpi/core.o
  CC      fs/proc/devices.o
  CC      security/integrity/evm/evm_secfs.o
  CC      security/integrity/ima/ima_template.o
  CC      kernel/module/tree_lookup.o
  CC      lib/zlib_inflate/inflate_syms.o
  CC      kernel/module/debug_kmemleak.o
  CC      drivers/char/ipmi/ipmi_plat_data.o
  CC      net/core/netevent.o
  CC      mm/percpu.o
  CC      drivers/acpi/acpica/dsdebug.o
  CC      security/selinux/ss/services.o
  CC      security/selinux/ss/conditional.o
  GEN     security/apparmor/net_names.h
  AR      kernel/entry/built-in.a
  CC      fs/iomap/seek.o
  CC      security/apparmor/policy_compat.o
  GEN     security/apparmor/net_names.h
  CC      net/core/neighbour.o
  CC      kernel/time/time.o
  CC      security/integrity/ima/ima_template_lib.o
  CC      arch/x86/mm/mmio-mod.o
  CC      kernel/time/timer.o
  AR      arch/x86/kernel/cpu/resctrl/built-in.a
  CC      arch/x86/kernel/cpu/cacheinfo.o
  CC      security/integrity/evm/evm_posix_acl.o
  CC      block/blk-stat.o
  CC      fs/configfs/inode.o
  AR      kernel/irq/built-in.a
  CC      fs/proc/interrupts.o
  CC      fs/configfs/file.o
  CC      arch/x86/kernel/cpu/scattered.o
  CC      arch/x86/kernel/apic/apic_flat_64.o
  CC      arch/x86/kernel/apic/probe_64.o
  CC      io_uring/poll.o
  CC      drivers/acpi/acpica/dsfield.o
  CC      io_uring/cancel.o
  CC      io_uring/kbuf.o
  CC      kernel/futex/core.o
  AR      drivers/pci/hotplug/built-in.a
  CC      kernel/module/kallsyms.o
  AR      drivers/pci/endpoint/functions/built-in.a
  CC      arch/x86/platform/efi/efi.o
  CC      drivers/pci/endpoint/pci-ep-cfs.o
  CC      arch/x86/platform/efi/efi_64.o
  AR      lib/zlib_inflate/built-in.a
  CC      drivers/pnp/pnpacpi/rsparser.o
  CC      lib/zlib_deflate/deflate.o
  CC      lib/lzo/lzo1x_compress.o
  CC [M]  sound/core/hwdep.o
  CC      lib/lzo/lzo1x_decompress_safe.o
  AR      security/integrity/evm/built-in.a
  CC      net/core/rtnetlink.o
  CC      fs/proc/loadavg.o
  CC      drivers/acpi/apei/apei-base.o
  CC      fs/proc/meminfo.o
  CC      drivers/acpi/acpica/dsinit.o
  CC      net/core/utils.o
  AR      drivers/acpi/numa/built-in.a
  CC      net/core/link_watch.o
  AR      arch/x86/net/built-in.a
  CC [M]  drivers/char/ipmi/ipmi_msghandler.o
  CC      fs/proc/stat.o
  CC      security/integrity/ima/ima_appraise.o
  CC [M]  drivers/char/ipmi/ipmi_devintf.o
  CC      drivers/video/fbdev/asiliantfb.o
  CC      drivers/video/fbdev/core/bitblit.o
  CC      kernel/sched/build_utility.o
  CC      fs/configfs/dir.o
  CC      fs/iomap/swapfile.o
  CC      security/apparmor/crypto.o
  CC      net/core/filter.o
  CC      security/selinux/ss/mls.o
  CC      crypto/shash.o
  CC      arch/x86/mm/numa.o
  CC      arch/x86/kernel/cpu/topology_common.o
  CC      drivers/acpi/pmic/intel_pmic.o
  CC      drivers/acpi/dptf/int340x_thermal.o
  CC      drivers/acpi/acpica/dsmethod.o
  CC      kernel/futex/syscalls.o
  AR      arch/x86/kernel/apic/built-in.a
  CC      security/lsm_audit.o
  CC      kernel/module/procfs.o
  CC      arch/x86/xen/mmu_pv.o
  CC      io_uring/rsrc.o
  AR      drivers/pnp/pnpacpi/built-in.a
  CC      drivers/pnp/core.o
  CC      kernel/cgroup/cgroup.o
  CC      lib/zlib_deflate/deftree.o
  AR      arch/x86/platform/iris/built-in.a
  AS      arch/x86/platform/efi/efi_stub_64.o
  AR      drivers/amba/built-in.a
  CC      kernel/cgroup/rstat.o
  CC      fs/proc/uptime.o
  CC      fs/proc/util.o
  CC      drivers/acpi/acpica/dsmthdat.o
  AR      lib/lzo/built-in.a
  CC      drivers/acpi/acpica/dsobject.o
  CC      kernel/cgroup/namespace.o
  CC [M]  drivers/acpi/nfit/core.o
  AS      arch/x86/platform/efi/efi_thunk_64.o
  CC      lib/lz4/lz4_decompress.o
  CC      fs/devpts/inode.o
  CC      arch/x86/platform/efi/runtime-map.o
  CC [M]  sound/core/timer.o
  CC      fs/configfs/symlink.o
  AR      drivers/acpi/dptf/built-in.a
  CC      drivers/pci/endpoint/pci-epc-core.o
  CC      drivers/video/fbdev/core/softcursor.o
  CC      drivers/pci/endpoint/pci-epf-core.o
  CC      drivers/acpi/acpica/dsopcode.o
  CC      security/integrity/ima/ima_modsig.o
  CC      kernel/module/sysfs.o
  CC      drivers/acpi/apei/hest.o
  CC      net/core/sock_diag.o
  CC      arch/x86/kernel/cpu/topology_ext.o
  CC      drivers/acpi/pmic/intel_pmic_bytcrc.o
  CC      fs/proc/version.o
  CC      lib/zlib_deflate/deflate_syms.o
  CC      arch/x86/kernel/cpu/topology_amd.o
  CC      fs/ext4/balloc.o
  CC      security/apparmor/capability.o
  CC      drivers/pnp/card.o
  CC      kernel/futex/pi.o
  AR      fs/iomap/built-in.a
  CC      lib/zstd/zstd_compress_module.o
  CC      lib/zstd/compress/fse_compress.o
  CC      security/selinux/ss/context.o
  CC      drivers/acpi/acpica/dspkginit.o
  CC      drivers/video/fbdev/vesafb.o
  CC      arch/x86/purgatory/purgatory.o
  CC      fs/configfs/mount.o
  CC      kernel/time/hrtimer.o
  AS      arch/x86/purgatory/stack.o
  AR      fs/devpts/built-in.a
  AR      arch/x86/platform/efi/built-in.a
  CC      lib/zstd/compress/hist.o
  CC      drivers/acpi/acpica/dsutils.o
  AS      arch/x86/purgatory/setup-x86_64.o
  CC      drivers/video/fbdev/core/tileblit.o
  CC      drivers/pci/controller/dwc/pcie-designware.o
  CC      mm/slab_common.o
  CC      arch/x86/platform/intel/iosf_mbi.o
  CC      drivers/pci/controller/dwc/pcie-designware-host.o
  CC      kernel/module/kdb.o
  CC      crypto/akcipher.o
  CC      arch/x86/purgatory/sha256.o
  CC      crypto/sig.o
  CC      io_uring/rw.o
  CC      arch/x86/mm/numa_64.o
  CC      crypto/kpp.o
  CC      fs/proc/softirqs.o
  CC      security/integrity/ima/ima_kexec.o
  CC      security/integrity/ima/ima_asymmetric_keys.o
  CC      block/blk-mq-sysfs.o
  AS      arch/x86/purgatory/entry64.o
  CC      arch/x86/kernel/cpu/common.o
  CC      drivers/acpi/pmic/intel_pmic_chtcrc.o
  CC      arch/x86/purgatory/string.o
  CC      drivers/acpi/acpica/dswexec.o
  CC      kernel/cgroup/cgroup-v1.o
  CC      drivers/pci/endpoint/pci-epc-mem.o
  CC      drivers/acpi/acpica/dswload.o
  CC      block/blk-mq-cpumap.o
  AR      lib/zlib_deflate/built-in.a
  CC      net/core/dev_ioctl.o
  CC      kernel/futex/requeue.o
  CC      drivers/video/fbdev/efifb.o
  CC      drivers/acpi/apei/erst.o
  CC      kernel/module/version.o
  LD      arch/x86/purgatory/purgatory.ro
  CC      arch/x86/mm/amdtopology.o
  CC      fs/proc/namespaces.o
  LD      arch/x86/purgatory/purgatory.chk
  AR      lib/lz4/built-in.a
  AS      arch/x86/purgatory/kexec-purgatory.o
  CC      fs/configfs/item.o
  CC      security/device_cgroup.o
  CC      security/selinux/xfrm.o
  AR      arch/x86/purgatory/built-in.a
  CC      net/core/tso.o
  CC      lib/zstd/compress/huf_compress.o
  CC      fs/proc/self.o
  CC      drivers/video/fbdev/core/fbcon_rotate.o
  CC      security/apparmor/resource.o
  CC      security/apparmor/net.o
  CC      drivers/pnp/driver.o
  AR      drivers/pci/controller/mobiveil/built-in.a
  CC      drivers/acpi/pmic/intel_pmic_chtwc.o
  CC      drivers/acpi/acpica/dswload2.o
  CC      drivers/acpi/pmic/tps68470_pmic.o
  CC [M]  sound/core/pcm.o
  CC [M]  drivers/char/ipmi/ipmi_si_intf.o
  CC [M]  sound/core/pcm_native.o
  CC      security/integrity/ima/ima_queue_keys.o
  CC      lib/zstd/compress/zstd_compress.o
  CC      fs/ext4/bitmap.o
  AR      arch/x86/platform/intel/built-in.a
  CC      kernel/futex/waitwake.o
  AR      arch/x86/platform/intel-mid/built-in.a
  AR      arch/x86/platform/intel-quark/built-in.a
  CC      io_uring/opdef.o
  CC      kernel/time/timekeeping.o
  CC      arch/x86/mm/srat.o
  CC      block/blk-mq-sched.o
  AR      arch/x86/platform/olpc/built-in.a
  CC      drivers/acpi/acpica/dswscope.o
  CC      block/ioctl.o
  CC      drivers/pci/controller/dwc/pcie-designware-ep.o
  CC      kernel/time/ntp.o
  CC      net/core/sock_reuseport.o
  AR      arch/x86/platform/scx200/built-in.a
  CC      fs/proc/thread_self.o
  CC      crypto/dh.o
  AR      arch/x86/platform/ts5500/built-in.a
  CC      crypto/dh_helper.o
  CC      arch/x86/platform/uv/bios_uv.o
  AR      drivers/pci/endpoint/built-in.a
  ASN.1   crypto/rsapubkey.asn1.[ch]
  CC      kernel/time/clocksource.o
  CC      arch/x86/platform/uv/uv_irq.o
  AR      drivers/acpi/pmic/built-in.a
  CC      drivers/video/fbdev/core/fbcon_cw.o
  CC      arch/x86/platform/uv/uv_time.o
  AR      kernel/module/built-in.a
  AR      fs/configfs/built-in.a
  CC      arch/x86/platform/uv/uv_nmi.o
  CC      drivers/acpi/apei/bert.o
  CC [M]  drivers/acpi/nfit/intel.o
  CC      drivers/acpi/tables.o
  CC      drivers/acpi/blacklist.o
  CC      drivers/acpi/acpica/dswstate.o
  CC      security/integrity/ima/ima_efi.o
  CC      drivers/pnp/resource.o
  AR      drivers/pci/switch/built-in.a
  CC      security/selinux/netlabel.o
  CC      security/selinux/ima.o
  CC      drivers/pnp/manager.o
  CC      drivers/pnp/support.o
  CC      fs/ext4/block_validity.o
  AR      kernel/futex/built-in.a
  CC      fs/ext4/dir.o
  CC      fs/ext4/ext4_jbd2.o
  CC [M]  drivers/char/ipmi/ipmi_kcs_sm.o
  CC      arch/x86/mm/numa_emulation.o
  AR      security/apparmor/built-in.a
  CC      fs/proc/proc_sysctl.o
  CC      io_uring/notif.o
  CC      drivers/acpi/apei/ghes.o
  CC      net/core/fib_notifier.o
  CC      net/core/xdp.o
  CC      drivers/pci/controller/dwc/pcie-designware-plat.o
  ASN.1   crypto/rsaprivkey.asn1.[ch]
  CC      crypto/rsa.o
  CC      drivers/pci/controller/vmd.o
  CC      lib/zstd/compress/zstd_compress_literals.o
  CC      drivers/acpi/acpica/evevent.o
  CC      drivers/acpi/osi.o
  CC      arch/x86/kernel/cpu/rdrand.o
  CC      kernel/time/jiffies.o
  CC      mm/compaction.o
  CC      arch/x86/mm/pkeys.o
  CC      mm/show_mem.o
  CC      kernel/cgroup/freezer.o
  CC      lib/zstd/compress/zstd_compress_sequences.o
  CC [M]  drivers/acpi/nfit/mce.o
  CC      drivers/video/fbdev/core/fbcon_ud.o
  CC      drivers/pnp/interface.o
  CC      arch/x86/kernel/cpu/match.o
  CC      drivers/pnp/quirks.o
  CC      security/integrity/ima/ima_iint.o
  CC      arch/x86/mm/pti.o
  CC      kernel/time/timer_list.o
  CC      arch/x86/mm/mem_encrypt.o
  CC      drivers/acpi/acpica/evgpe.o
  CC      drivers/acpi/acpica/evgpeblk.o
  CC      arch/x86/mm/mem_encrypt_amd.o
  CC      mm/shmem_quota.o
  CC      drivers/pnp/system.o
  CC [M]  drivers/char/ipmi/ipmi_smic_sm.o
  AR      arch/x86/platform/uv/built-in.a
  CC      fs/jbd2/transaction.o
  AR      arch/x86/platform/built-in.a
  AR      drivers/pci/controller/dwc/built-in.a
  CC      crypto/rsa_helper.o
  CC      fs/squashfs/block.o
  CC      drivers/video/fbdev/core/fbcon_ccw.o
  CC      lib/zstd/compress/zstd_compress_superblock.o
  CC      block/genhd.o
  CC      drivers/video/fbdev/core/cfbfillrect.o
  CC      drivers/video/fbdev/core/cfbcopyarea.o
  CC      drivers/video/fbdev/core/cfbimgblt.o
  CC      drivers/video/fbdev/core/fb_io_fops.o
  CC      drivers/video/fbdev/core/sysfillrect.o
  CC      crypto/rsa-pkcs1pad.o
  CC      fs/jbd2/commit.o
  AR      security/selinux/built-in.a
  CC      fs/jbd2/recovery.o
  CC      lib/zstd/compress/zstd_double_fast.o
  CC      drivers/acpi/osl.o
  CC      io_uring/waitid.o
  CC      drivers/video/fbdev/core/syscopyarea.o
  AR      drivers/pci/controller/built-in.a
  CC [M]  drivers/char/ipmi/ipmi_bt_sm.o
  CC      fs/squashfs/cache.o
  CC      drivers/video/fbdev/core/sysimgblt.o
  CC      drivers/pci/access.o
  CC      fs/ext4/extents.o
  LD [M]  drivers/acpi/nfit/nfit.o
  CC      drivers/acpi/acpica/evgpeinit.o
  CC      fs/squashfs/dir.o
  CC      drivers/video/fbdev/core/fb_sys_fops.o
  CC [M]  sound/core/pcm_lib.o
  CC      fs/ext4/extents_status.o
  CC      kernel/time/timeconv.o
  CC      fs/squashfs/export.o
  CC      fs/ext4/file.o
  AR      drivers/pnp/built-in.a
  CC      arch/x86/xen/irq.o
  CC      fs/squashfs/file.o
  CC      fs/ramfs/inode.o
  AR      security/integrity/ima/built-in.a
  CC      io_uring/register.o
  CC      arch/x86/kernel/cpu/bugs.o
  CC      security/integrity/integrity_audit.o
  CC      arch/x86/kernel/cpu/aperfmperf.o
  CC [M]  drivers/char/ipmi/ipmi_si_hotmod.o
  CC      fs/squashfs/fragment.o
  CC      drivers/acpi/acpica/evgpeutil.o
  AR      drivers/acpi/apei/built-in.a
  CC      kernel/cgroup/legacy_freezer.o
  CC      net/core/flow_offload.o
  CC      drivers/acpi/acpica/evglock.o
  CC      net/core/gro.o
  CC      crypto/acompress.o
  CC      kernel/cgroup/pids.o
  CC      fs/squashfs/id.o
  CC      kernel/cgroup/rdma.o
  CC      fs/squashfs/inode.o
  CC [M]  sound/core/pcm_misc.o
  CC [M]  drivers/char/ipmi/ipmi_si_hardcode.o
  CC      arch/x86/mm/mem_encrypt_identity.o
  CC [M]  drivers/char/ipmi/ipmi_si_platform.o
  CC      fs/proc/proc_net.o
  CC      drivers/pci/bus.o
  CC      arch/x86/xen/multicalls.o
  CC [M]  sound/core/pcm_memory.o
  CC      drivers/acpi/acpica/evhandler.o
  CC      security/integrity/digsig.o
  CC      block/ioprio.o
  CC      fs/ramfs/file-mmu.o
  CC      kernel/time/timecounter.o
  CC      kernel/cgroup/cpuset.o
  CC [M]  sound/core/memalloc.o
  CC      fs/proc/kcore.o
  CC      security/integrity/digsig_asymmetric.o
  CC      security/integrity/platform_certs/platform_keyring.o
  AR      kernel/sched/built-in.a
  AS      arch/x86/mm/mem_encrypt_boot.o
  AR      arch/x86/virt/svm/built-in.a
  CC      drivers/acpi/acpica/evmisc.o
  CC      net/core/netdev-genl.o
  CC      fs/proc/vmcore.o
  AR      arch/x86/virt/vmx/built-in.a
  CC      kernel/time/alarmtimer.o
  CC      lib/xz/xz_dec_syms.o
  CC      kernel/time/posix-timers.o
  CC      arch/x86/kernel/cpu/cpuid-deps.o
  AR      arch/x86/virt/built-in.a
  CC      arch/x86/kernel/cpu/umwait.o
  CC      lib/xz/xz_dec_stream.o
  CC      crypto/scompress.o
  CC      security/integrity/platform_certs/machine_keyring.o
  CC      kernel/cgroup/misc.o
  CC      fs/squashfs/namei.o
  CC      security/integrity/platform_certs/efi_parser.o
  AR      arch/x86/mm/built-in.a
  AR      drivers/video/fbdev/core/built-in.a
  CC      lib/raid6/algos.o
  CC      fs/ext4/fsmap.o
  AR      drivers/video/fbdev/built-in.a
  CC      lib/raid6/recov.o
  HOSTCC  lib/raid6/mktables
  CC [M]  drivers/char/ipmi/ipmi_si_port_io.o
  AR      drivers/video/built-in.a
  CC      fs/jbd2/checkpoint.o
  CC [M]  sound/core/pcm_timer.o
  CC      io_uring/truncate.o
  CC      drivers/acpi/acpica/evregion.o
  CC      drivers/acpi/utils.o
  CC      lib/dim/dim.o
  CC      lib/dim/net_dim.o
  AS      arch/x86/xen/xen-asm.o
  CC      kernel/debug/kdb/kdb_io.o
  UNROLL  lib/raid6/int1.c
  AR      fs/ramfs/built-in.a
  MKCAP   arch/x86/kernel/cpu/capflags.c
  CC      fs/proc/kmsg.o
  CC      fs/proc/page.o
  CC      io_uring/io-wq.o
  CC      arch/x86/xen/enlighten_pvh.o
  CC [M]  sound/core/seq_device.o
  CC      arch/x86/xen/trace.o
  CC      arch/x86/xen/smp.o
  CC      mm/interval_tree.o
  CC      arch/x86/kernel/head64.o
  CC      net/core/netdev-genl-gen.o
  CC      arch/x86/kernel/ebda.o
  CC      block/badblocks.o
  CC      drivers/pci/probe.o
  CC      lib/xz/xz_dec_lzma2.o
  CC      arch/x86/kernel/platform-quirks.o
  CC      fs/ext4/fsync.o
  CC      fs/squashfs/super.o
  CC      fs/ext4/hash.o
  AR      drivers/clk/actions/built-in.a
  CC      fs/ext4/ialloc.o
  AR      drivers/clk/analogbits/built-in.a
  CC      security/integrity/platform_certs/load_uefi.o
  AR      drivers/clk/bcm/built-in.a
  CC      drivers/acpi/acpica/evrgnini.o
  AR      drivers/clk/imgtec/built-in.a
  AR      drivers/clk/imx/built-in.a
  CC      drivers/acpi/acpica/evsci.o
  CC      lib/zstd/compress/zstd_fast.o
  AR      drivers/clk/ingenic/built-in.a
  CC      fs/ext4/indirect.o
  CC      fs/ext4/inline.o
  CC [M]  drivers/char/ipmi/ipmi_si_mem_io.o
  CC      fs/proc/bootconfig.o
  AR      drivers/clk/mediatek/built-in.a
  AR      drivers/clk/microchip/built-in.a
  CC      fs/hugetlbfs/inode.o
  AR      drivers/clk/mstar/built-in.a
  CC      mm/list_lru.o
  AR      drivers/clk/mvebu/built-in.a
  CC [M]  sound/core/compress_offload.o
  AR      drivers/clk/ralink/built-in.a
  AR      drivers/clk/renesas/built-in.a
  AR      drivers/clk/socfpga/built-in.a
  CC      drivers/acpi/reboot.o
  AR      drivers/clk/sprd/built-in.a
  LD [M]  sound/core/snd.o
  CC      arch/x86/kernel/process_64.o
  CC      fs/jbd2/revoke.o
  CC      fs/squashfs/symlink.o
  AR      drivers/clk/starfive/built-in.a
  UNROLL  lib/raid6/int2.c
  UNROLL  lib/raid6/int4.c
  CC      kernel/debug/debug_core.o
  AR      drivers/clk/sunxi-ng/built-in.a
  UNROLL  lib/raid6/int8.c
  CC      lib/raid6/recov_ssse3.o
  CC      kernel/debug/gdbstub.o
  AR      drivers/clk/ti/built-in.a
  CC      drivers/acpi/acpica/evxface.o
  CC      io_uring/futex.o
  CC      drivers/acpi/acpica/evxfevnt.o
  CC      arch/x86/xen/smp_pv.o
  AR      drivers/clk/versatile/built-in.a
  CC      crypto/algboss.o
  CC      lib/dim/rdma_dim.o
  CC      drivers/clk/x86/clk-fch.o
  CC      drivers/clk/x86/clk-lpss-atom.o
  AR      drivers/clk/xilinx/built-in.a
  CC      net/core/gso.o
  CC      lib/raid6/recov_avx2.o
  CC      lib/xz/xz_dec_bcj.o
  CC      net/core/net-sysfs.o
  CC      net/core/hotdata.o
  AR      fs/proc/built-in.a
  CC      fs/squashfs/decompressor.o
  CC      fs/ext4/inode.o
  CC      kernel/trace/rv/rv.o
  CC      drivers/acpi/nvs.o
  CC      kernel/bpf/core.o
  CC [M]  drivers/char/ipmi/ipmi_si_pci.o
  CC      security/integrity/platform_certs/keyring_handler.o
  CC      kernel/trace/rv/monitors/wwnr/wwnr.o
  CC      kernel/time/posix-cpu-timers.o
  CC      fs/squashfs/page_actor.o
  CC      kernel/time/posix-clock.o
  CC      fs/ext4/ioctl.o
  CC      kernel/debug/kdb/kdb_main.o
  CC      kernel/debug/kdb/kdb_support.o
  CC [M]  drivers/char/ipmi/ipmi_ssif.o
  CC      io_uring/napi.o
  CC      arch/x86/xen/smp_hvm.o
  CC      kernel/trace/rv/rv_reactors.o
  CC      net/core/page_pool.o
  AR      lib/xz/built-in.a
  CC      drivers/acpi/acpica/evxfgpe.o
  CC      mm/workingset.o
  CC      block/blk-rq-qos.o
  CC      arch/x86/xen/spinlock.o
  CC      fs/jbd2/journal.o
  CC      drivers/clk/x86/clk-pmc-atom.o
  CC      kernel/debug/kdb/kdb_bt.o
  CC      lib/raid6/mmx.o
  CC      lib/raid6/sse1.o
  GENKDB  kernel/debug/kdb/gen-kdb_cmds.c
  CC      fs/squashfs/file_direct.o
  AR      fs/hugetlbfs/built-in.a
  CC      drivers/pci/host-bridge.o
  CC      lib/raid6/sse2.o
  CC      drivers/pci/remove.o
  AR      lib/dim/built-in.a
  CC      fs/squashfs/decompressor_single.o
  CC      kernel/time/itimer.o
  CC      arch/x86/kernel/cpu/powerflags.o
  CC      drivers/pci/pci.o
  CC      kernel/debug/kdb/kdb_bp.o
  CC      crypto/testmgr.o
  CC      kernel/debug/kdb/kdb_debugger.o
  LD [M]  sound/core/snd-hwdep.o
  LD [M]  sound/core/snd-timer.o
  LD [M]  sound/core/snd-pcm.o
  AR      security/integrity/built-in.a
  LD [M]  sound/core/snd-seq-device.o
  LD [M]  sound/core/snd-compress.o
  AR      security/built-in.a
  CC      fs/ext4/mballoc.o
  CC      mm/debug.o
  CC      kernel/time/clockevents.o
  CC      lib/raid6/avx2.o
  CC      drivers/clk/clk-devres.o
  CC      kernel/trace/rv/reactor_printk.o
  CC      kernel/trace/rv/reactor_panic.o
  CC      kernel/bpf/syscall.o
  CC [M]  sound/soc/codecs/hdac_hda.o
  CC      drivers/dma/hsu/hsu.o
  CC      mm/gup.o
  AR      drivers/dma/idxd/built-in.a
  AR      drivers/clk/x86/built-in.a
  CC      block/disk-events.o
  AR      kernel/cgroup/built-in.a
  CC      arch/x86/xen/vga.o
  CC      arch/x86/xen/efi.o
  CC      drivers/acpi/acpica/evxfregn.o
  CC      fs/squashfs/decompressor_multi.o
  AR      drivers/soc/apple/built-in.a
  CC      fs/squashfs/decompressor_multi_percpu.o
  CC      block/blk-ia-ranges.o
  CC [M]  sound/hda/ext/hdac_ext_bus.o
  AR      drivers/soc/aspeed/built-in.a
  CC      kernel/events/core.o
  CC      kernel/events/ring_buffer.o
  AR      drivers/soc/bcm/built-in.a
  CC      kernel/events/callchain.o
  CC      lib/zstd/compress/zstd_lazy.o
  CC      kernel/fork.o
  AR      drivers/soc/fsl/built-in.a
  AR      drivers/soc/fujitsu/built-in.a
  AR      drivers/soc/hisilicon/built-in.a
  AR      drivers/soc/imx/built-in.a
  AR      drivers/soc/ixp4xx/built-in.a
  CC      kernel/debug/kdb/kdb_keyboard.o
  CC [M]  sound/hda/hda_bus_type.o
  CC [M]  sound/hda/ext/hdac_ext_controller.o
  AR      drivers/soc/loongson/built-in.a
  CC [M]  sound/hda/hdac_bus.o
  AR      drivers/soc/mediatek/built-in.a
  CC [M]  sound/hda/hdac_device.o
  AR      drivers/soc/microchip/built-in.a
  AR      drivers/soc/nuvoton/built-in.a
  LD [M]  drivers/char/ipmi/ipmi_si.o
  AR      drivers/char/ipmi/built-in.a
  AR      drivers/soc/pxa/built-in.a
  CC      kernel/time/tick-common.o
  CC      lib/raid6/avx512.o
  AR      drivers/soc/amlogic/built-in.a
  AR      io_uring/built-in.a
  CC      lib/raid6/recov_avx512.o
  AR      drivers/soc/qcom/built-in.a
  CC      kernel/bpf/verifier.o
  AR      drivers/soc/renesas/built-in.a
  CC      kernel/time/tick-broadcast.o
  AR      drivers/soc/rockchip/built-in.a
  AR      kernel/trace/rv/built-in.a
  CC      crypto/hmac.o
  CC      drivers/clk/clk-bulk.o
  CC      drivers/dma/lgm/lgm-dma.o
  CC      kernel/trace/trace_clock.o
  AR      drivers/soc/sunxi/built-in.a
  AR      drivers/dma/mediatek/built-in.a
  CC      kernel/events/hw_breakpoint.o
  CC      kernel/trace/ftrace.o
  AR      drivers/soc/ti/built-in.a
  AR      drivers/soc/xilinx/built-in.a
  CC      net/core/page_pool_user.o
  AR      drivers/soc/built-in.a
  CC      lib/zstd/compress/zstd_ldm.o
  CC      drivers/acpi/acpica/exconcat.o
  CC      lib/zstd/compress/zstd_opt.o
  CC      kernel/time/tick-broadcast-hrtimer.o
  CC      kernel/time/tick-oneshot.o
  CC      fs/squashfs/xattr.o
  CC      fs/squashfs/xattr_id.o
  CC      lib/zstd/zstd_decompress_module.o
  AR      arch/x86/xen/built-in.a
  CC      kernel/time/tick-sched.o
  CC      kernel/debug/kdb/gen-kdb_cmds.o
  CC      fs/ext4/migrate.o
  CC      net/core/net-procfs.o
  CC      fs/ext4/mmp.o
  CC      fs/ext4/move_extent.o
  AR      drivers/dma/hsu/built-in.a
  LD [M]  sound/soc/codecs/snd-soc-hdac-hda.o
  AR      drivers/pmdomain/actions/built-in.a
  CC      fs/ext4/namei.o
  AR      drivers/pmdomain/amlogic/built-in.a
  CC      block/early-lookup.o
  TABLE   lib/raid6/tables.c
  CC      drivers/virtio/virtio.o
  CC      fs/ext4/page-io.o
  CC      lib/raid6/int1.o
  AR      drivers/pmdomain/apple/built-in.a
  AR      drivers/pmdomain/arm/built-in.a
  CC      crypto/crypto_null.o
  CC      drivers/acpi/acpica/exconfig.o
  CC [M]  sound/soc/amd/acp-config.o
  AR      drivers/pmdomain/bcm/built-in.a
  AR      kernel/debug/kdb/built-in.a
  AR      kernel/debug/built-in.a
  CC      drivers/virtio/virtio_ring.o
  AR      drivers/pmdomain/imx/built-in.a
  CC      kernel/time/timer_migration.o
  CC      fs/squashfs/lz4_wrapper.o
  AR      drivers/pmdomain/mediatek/built-in.a
  CC      drivers/virtio/virtio_anchor.o
  CC      drivers/virtio/virtio_pci_modern_dev.o
  AR      drivers/dma/qcom/built-in.a
  AR      drivers/pmdomain/qcom/built-in.a
  CC      kernel/time/vsyscall.o
  CC [M]  sound/hda/ext/hdac_ext_stream.o
  CC      lib/zstd/decompress/huf_decompress.o
  CC      kernel/trace/ring_buffer.o
  AR      drivers/pmdomain/renesas/built-in.a
  AR      drivers/pmdomain/rockchip/built-in.a
  CC      net/core/netpoll.o
  AR      drivers/pmdomain/samsung/built-in.a
  CC      drivers/xen/events/events_base.o
  CC      drivers/clk/clkdev.o
  AR      drivers/pmdomain/st/built-in.a
  CC      drivers/xen/events/events_2l.o
  AR      drivers/pmdomain/starfive/built-in.a
  AR      drivers/dma/lgm/built-in.a
  CC      drivers/clk/clk.o
  CC      kernel/time/timekeeping_debug.o
  AR      drivers/pmdomain/sunxi/built-in.a
  AR      drivers/dma/ti/built-in.a
  CC      kernel/events/uprobes.o
  AR      drivers/dma/xilinx/built-in.a
  AR      drivers/pmdomain/tegra/built-in.a
  AR      drivers/pmdomain/ti/built-in.a
  CC      arch/x86/kernel/cpu/topology.o
  CC      drivers/acpi/acpica/exconvrt.o
  AR      drivers/pmdomain/xilinx/built-in.a
  CC [M]  drivers/dma/dw/core.o
  CC [M]  drivers/dma/dw/dw.o
  CC      drivers/pmdomain/core.o
  CC      lib/raid6/int2.o
  CC      block/bsg.o
  CC      kernel/bpf/inode.o
  CC      crypto/md5.o
  CC      kernel/time/namespace.o
  CC      kernel/bpf/helpers.o
  CC      fs/ext4/readpage.o
  CC      fs/squashfs/lzo_wrapper.o
  CC      kernel/exec_domain.o
  CC      mm/mmap_lock.o
  CC [M]  drivers/dma/dw/idma32.o
  AR      fs/jbd2/built-in.a
  CC      drivers/pci/pci-driver.o
  CC      drivers/pci/search.o
  CC      arch/x86/kernel/cpu/proc.o
  CC      drivers/acpi/acpica/excreate.o
  CC      crypto/sha1_generic.o
  CC      drivers/acpi/acpica/exdebug.o
  CC [M]  drivers/dma/dw/acpi.o
  CC      drivers/acpi/wakeup.o
  CC      fs/ext4/resize.o
  CC      fs/ext4/super.o
  LD [M]  sound/soc/amd/snd-acp-config.o
  CC      lib/raid6/int4.o
  LD [M]  sound/hda/ext/snd-hda-ext-core.o
  CC [M]  sound/hda/hdac_sysfs.o
  CC      drivers/xen/events/events_fifo.o
  CC [M]  sound/hda/hdac_regmap.o
  CC [M]  sound/hda/hdac_controller.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-byt-match.o
  CC      kernel/trace/trace.o
  CC      drivers/acpi/acpica/exdump.o
  CC      drivers/acpi/acpica/exfield.o
  CC      drivers/acpi/acpica/exfldio.o
  CC      drivers/acpi/sleep.o
  CC      fs/squashfs/xz_wrapper.o
  CC      drivers/acpi/device_sysfs.o
  AR      kernel/time/built-in.a
  CC      fs/ext4/symlink.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/kvm_main.o
  CC      lib/raid6/int8.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/eventfd.o
  CC      net/core/fib_rules.o
  CC      block/bsg-lib.o
  CC      kernel/bpf/tnum.o
  CC      net/core/net-traces.o
  CC      drivers/virtio/virtio_pci_legacy_dev.o
  CC      drivers/virtio/virtio_mmio.o
  CC      drivers/virtio/virtio_pci_modern.o
  CC      drivers/acpi/device_pm.o
  CC      block/blk-cgroup.o
  CC      fs/ext4/sysfs.o
  CC [M]  drivers/dma/dw/platform.o
  CC      kernel/panic.o
  CC      crypto/sha256_generic.o
  CC      drivers/acpi/acpica/exmisc.o
  CC      lib/fonts/fonts.o
  CC      block/blk-cgroup-rwstat.o
  CC      lib/fonts/font_8x8.o
  CC      lib/fonts/font_8x16.o
  CC      fs/squashfs/zlib_wrapper.o
  CC      fs/squashfs/zstd_wrapper.o
  CC      drivers/pmdomain/governor.o
  CC      lib/raid6/tables.o
  CC      fs/ext4/xattr.o
  CC      fs/ext4/xattr_hurd.o
  CC      drivers/virtio/virtio_pci_common.o
  CC      kernel/cpu.o
  CC      kernel/bpf/log.o
  CC      kernel/exit.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cht-match.o
  CC      lib/zstd/decompress/zstd_ddict.o
  CC [M]  sound/hda/hdac_stream.o
  CC      mm/highmem.o
  CC      mm/memory.o
  AR      drivers/xen/events/built-in.a
  CC      drivers/xen/xenbus/xenbus_client.o
  CC      drivers/xen/xenbus/xenbus_comms.o
  CC      drivers/acpi/acpica/exmutex.o
  CC [M]  sound/hda/array.o
  CC      crypto/sha512_generic.o
  CC      drivers/clk/clk-divider.o
  CC      drivers/pci/rom.o
  CC      net/802/fc.o
  LD [M]  drivers/dma/dw/dw_dmac_core.o
  LD [M]  drivers/dma/dw/dw_dmac.o
  CC      drivers/dma/dmaengine.o
  CC      lib/fonts/font_acorn_8x8.o
  CC [M]  drivers/dma/ioat/init.o
  CC      drivers/acpi/proc.o
  CC [M]  drivers/dma/ioat/dma.o
  CC      fs/ext4/xattr_trusted.o
  AR      drivers/pmdomain/built-in.a
  CC      kernel/trace/trace_output.o
  CC      drivers/dma/virt-dma.o
  CC [M]  sound/soc/intel/atom/sst/sst.o
  CC [M]  sound/soc/intel/atom/sst/sst_ipc.o
  CC [M]  sound/soc/intel/atom/sst/sst_stream.o
  AR      fs/squashfs/built-in.a
  CC      fs/ext4/xattr_user.o
  CC [M]  sound/soc/intel/atom/sst/sst_drv_interface.o
  CC      lib/fonts/font_6x10.o
  CC [M]  lib/reed_solomon/reed_solomon.o
  CC      drivers/acpi/acpica/exnames.o
  CC      fs/ext4/fast_commit.o
  CC      lib/fonts/font_ter16x32.o
  CC      drivers/virtio/virtio_pci_legacy.o
  CC      crypto/sha3_generic.o
  CC      kernel/bpf/token.o
  CC      drivers/clk/clk-fixed-factor.o
  AR      lib/raid6/built-in.a
  CC      drivers/pci/setup-res.o
  CC      drivers/xen/xenbus/xenbus_xs.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.o
  CC      lib/argv_split.o
  CC      drivers/clk/clk-fixed-rate.o
  CC      drivers/clk/clk-gate.o
  CC      drivers/clk/clk-multiplier.o
  CC      drivers/acpi/acpica/exoparg1.o
  CC [M]  sound/hda/hdmi_chmap.o
  CC      block/blk-throttle.o
  CC      mm/mincore.o
  AR      lib/fonts/built-in.a
  CC      drivers/xen/cpu_hotplug.o
  CC      lib/bug.o
  CC      drivers/xen/xenbus/xenbus_probe.o
  CC      drivers/virtio/virtio_pci_admin_legacy_io.o
  CC      drivers/xen/grant-table.o
  CC      drivers/pci/irq.o
  CC [M]  drivers/dma/ioat/prep.o
  CC [M]  drivers/dma/ioat/dca.o
  CC [M]  sound/soc/intel/atom/sst/sst_loader.o
  CC [M]  sound/soc/intel/atom/sst/sst_pvt.o
  CC      drivers/xen/features.o
  CC      drivers/dma/acpi-dma.o
  CC      lib/buildid.o
  CC      drivers/regulator/core.o
  CC      drivers/clk/clk-mux.o
  CC      kernel/bpf/bpf_iter.o
  CC      drivers/acpi/bus.o
  CC      drivers/acpi/acpica/exoparg2.o
  CC      net/802/fddi.o
  CC [M]  sound/soc/intel/atom/sst-mfld-platform-pcm.o
  CC      kernel/softirq.o
  CC      drivers/clk/clk-composite.o
  CC      fs/ext4/orphan.o
  CC      crypto/blake2b_generic.o
  CC [M]  drivers/dma/ioat/sysfs.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/binary_stats.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/vfio.o
  CC [M]  sound/soc/intel/atom/sst-mfld-platform-compress.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-skl-match.o
  CC [M]  sound/soc/intel/atom/sst-atom-controls.o
  CC      drivers/clk/clk-fractional-divider.o
  CC      drivers/acpi/acpica/exoparg3.o
  CC      drivers/clk/clk-gpio.o
  CC      drivers/pci/vpd.o
  CC      mm/mlock.o
  CC      drivers/xen/balloon.o
  CC      drivers/virtio/virtio_balloon.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/coalesced_mmio.o
  AR      kernel/events/built-in.a
  CC      lib/clz_tab.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/async_pf.o
  CC      drivers/xen/xenbus/xenbus_probe_backend.o
  CC      drivers/acpi/acpica/exoparg6.o
  CC [M]  drivers/dma/idma64.o
  CC      drivers/acpi/acpica/exprep.o
  CC      drivers/acpi/acpica/exregion.o
  CC      drivers/acpi/acpica/exresnte.o
  CC [M]  sound/hda/trace.o
  LD [M]  drivers/dma/ioat/ioatdma.o
  CC [M]  drivers/clk/clk-tps68470.o
  CC      drivers/xen/manage.o
  CC      drivers/xen/time.o
  CC      kernel/resource.o
  CC      drivers/acpi/acpica/exresolv.o
  CC      fs/ext4/acl.o
  CC [M]  sound/soc/intel/atom/sst/sst_acpi.o
  CC [M]  drivers/virtio/virtio_mem.o
  CC      fs/fat/cache.o
  CC      fs/ecryptfs/dentry.o
  CC      kernel/trace/trace_seq.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-kbl-match.o
  CC      arch/x86/kernel/cpu/feat_ctl.o
  CC      drivers/acpi/glue.o
  CC [M]  sound/hda/hdac_component.o
  CC      drivers/xen/xenbus/xenbus_dev_frontend.o
  CC      lib/zstd/decompress/zstd_decompress.o
  CC [M]  sound/hda/hdac_i915.o
  CC      fs/exportfs/expfs.o
  CC      mm/mmap.o
  AR      drivers/reset/hisilicon/built-in.a
  CC      drivers/tty/vt/vt_ioctl.o
  AR      drivers/reset/starfive/built-in.a
  CC      drivers/xen/xenbus/xenbus_dev_backend.o
  CC      drivers/acpi/acpica/exresop.o
  CC      drivers/reset/core.o
  CC      crypto/ecb.o
  CC      drivers/reset/reset-simple.o
  CC      mm/mmu_gather.o
  AR      drivers/clk/built-in.a
  CC [M]  net/802/p8022.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-bxt-match.o
  CC [M]  net/802/psnap.o
  CC      block/blk-ioprio.o
  CC [M]  net/802/stp.o
  CC      kernel/trace/trace_stat.o
  CC      drivers/acpi/scan.o
  CC      drivers/tty/vt/vc_screen.o
  CC      kernel/trace/trace_printk.o
  CC      fs/ecryptfs/file.o
  CC      drivers/pci/setup-bus.o
  AR      drivers/dma/built-in.a
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-core.o
  CC      fs/fat/dir.o
  CC      arch/x86/kernel/signal.o
  LD [M]  sound/soc/intel/atom/sst/snd-intel-sst-acpi.o
  CC      drivers/pci/vc.o
  LD [M]  sound/soc/intel/atom/snd-soc-sst-atom-hifi2-platform.o
  CC      fs/ecryptfs/inode.o
  CC      drivers/char/hw_random/core.o
  CC      drivers/char/agp/backend.o
  CC      fs/ext4/xattr_security.o
  CC      drivers/acpi/acpica/exserial.o
  CC      fs/ext4/verity.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-glk-match.o
  CC      net/core/drop_monitor.o
  CC      crypto/cbc.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cnl-match.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/irqchip.o
  CC      drivers/xen/mem-reservation.o
  CC      drivers/xen/xenbus/xenbus_probe_frontend.o
  CC      drivers/acpi/mipi-disco-img.o
  CC      arch/x86/kernel/cpu/intel.o
  CC      block/blk-iocost.o
  AR      fs/exportfs/built-in.a
  CC      drivers/tty/vt/selection.o
  CC      arch/x86/kernel/cpu/intel_pconfig.o
  CC      drivers/acpi/acpica/exstore.o
  CC [M]  sound/hda/intel-dsp-config.o
  CC      drivers/acpi/resource.o
  CC      drivers/xen/pci.o
  CC      kernel/trace/pid_list.o
  CC      drivers/acpi/acpica/exstoren.o
  CC      drivers/pci/mmap.o
  AR      drivers/virtio/built-in.a
  CC      drivers/acpi/acpica/exstorob.o
  CC      fs/ecryptfs/main.o
  CC      drivers/acpi/acpica/exsystem.o
  CC      drivers/tty/vt/keyboard.o
  CC [M]  sound/hda/intel-nhlt.o
  CC      arch/x86/kernel/signal_64.o
  CC      fs/nls/nls_base.o
  CC      crypto/cts.o
  AR      drivers/reset/built-in.a
  CC      fs/nls/nls_cp437.o
  CC      kernel/sysctl.o
  CC [M]  fs/nls/nls_iso8859-1.o
  CC [M]  fs/nls/nls_ucs2_utils.o
  CC      drivers/tty/vt/vt.o
  CC      crypto/xts.o
  CC      drivers/char/agp/generic.o
  CC      lib/zstd/decompress/zstd_decompress_block.o
  CC      drivers/iommu/intel/dmar.o
  CC      drivers/iommu/intel/iommu.o
  CC      drivers/iommu/amd/iommu.o
  AR      drivers/gpu/host1x/built-in.a
  CC      kernel/bpf/map_iter.o
  CC      drivers/char/agp/isoch.o
  CC      kernel/bpf/task_iter.o
  CC      drivers/acpi/acpica/extrace.o
  AR      drivers/char/hw_random/built-in.a
  CC      drivers/gpu/vga/vga_switcheroo.o
  AR      net/802/built-in.a
  CC      mm/mprotect.o
  CC      kernel/trace/tracing_map.o
  CC      net/sched/sch_generic.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/dirty_ring.o
  CC      net/sched/sch_mq.o
  AR      drivers/iommu/arm/arm-smmu/built-in.a
  AR      drivers/iommu/arm/arm-smmu-v3/built-in.a
  AR      drivers/iommu/arm/built-in.a
  CC      drivers/regulator/dummy.o
  CC      drivers/xen/dbgp.o
  CC      fs/fat/fatent.o
  AR      drivers/gpu/drm/tests/built-in.a
  CC      block/mq-deadline.o
  CC [M]  drivers/gpu/drm/tests/drm_kunit_helpers.o
  AR      drivers/iommu/iommufd/built-in.a
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cfl-match.o
  CC [M]  drivers/gpu/drm/tests/drm_buddy_test.o
  CC      drivers/xen/acpi.o
  CC      fs/ecryptfs/super.o
  CC      drivers/acpi/acpica/exutils.o
  CC      drivers/connector/cn_queue.o
  CC [M]  sound/hda/intel-sdw-acpi.o
  CC      net/core/timestamping.o
  CC      drivers/pci/devres.o
  CC      kernel/bpf/prog_iter.o
  CC      net/netlink/af_netlink.o
  CC      crypto/ctr.o
  CC      drivers/acpi/acpi_processor.o
  CC      net/netlink/genetlink.o
  CC      kernel/capability.o
  AR      drivers/xen/xenbus/built-in.a
  CC      kernel/ptrace.o
  CC      drivers/iommu/intel/pasid.o
  CC      net/bpf/test_run.o
  AR      fs/nls/built-in.a
  CC      fs/ext4/crypto.o
  CC      net/ethtool/ioctl.o
  CC      net/ethtool/common.o
  CC      net/netfilter/core.o
  CC      drivers/acpi/acpica/hwacpi.o
  CC      net/ethtool/netlink.o
  CC      net/netfilter/nf_log.o
  CC      drivers/regulator/fixed-helper.o
  AR      net/ipv4/netfilter/built-in.a
  CC [M]  net/ipv4/netfilter/nf_defrag_ipv4.o
  CC      crypto/gcm.o
  CC      drivers/pci/proc.o
  CC      fs/ecryptfs/mmap.o
  CC      drivers/xen/xen-acpi-pad.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/pfncache.o
  CC      kernel/trace/trace_sched_switch.o
  AR      drivers/gpu/drm/arm/built-in.a
  LD [M]  sound/hda/snd-hda-core.o
  CC [M]  net/ipv4/netfilter/ip_tables.o
  CC      drivers/pci/pci-sysfs.o
  COPY    drivers/tty/vt/defkeymap.c
  CC      crypto/aes_generic.o
  CC      mm/mremap.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-cml-match.o
  CC      drivers/acpi/acpica/hwesleep.o
  CC      drivers/char/agp/amd64-agp.o
  LD [M]  sound/hda/snd-intel-dspcfg.o
  LD [M]  sound/hda/snd-intel-sdw-acpi.o
  CC      drivers/iommu/iommu.o
  CC      kernel/bpf/link_iter.o
  CC      crypto/deflate.o
  CC      drivers/connector/connector.o
  CC      kernel/user.o
  AR      fs/ext4/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_cmdline_parser_test.o
  CC      drivers/acpi/processor_core.o
  CC      drivers/iommu/iommu-traces.o
  AR      drivers/gpu/vga/built-in.a
  CC      block/bio-integrity.o
  CC      drivers/acpi/acpica/hwgpe.o
  CC      block/blk-integrity.o
  CC      drivers/regulator/helpers.o
  CC      fs/fat/file.o
  CC      drivers/iommu/iommu-sysfs.o
  CC      drivers/iommu/amd/init.o
  CC      drivers/acpi/processor_pdc.o
  CC      drivers/xen/pcpu.o
  CC      lib/zstd/zstd_common_module.o
  CC      lib/zstd/common/debug.o
  CC      drivers/connector/cn_proc.o
  CC      fs/ecryptfs/read_write.o
  CC      net/ethtool/bitset.o
  CC      net/core/ptp_classifier.o
  CC      lib/zstd/common/entropy_common.o
  CC      fs/fat/inode.o
  CC [M]  net/ipv4/netfilter/iptable_filter.o
  CC [M]  arch/x86/kvm/x86.o
  CC      drivers/acpi/acpica/hwregs.o
  CC      fs/ecryptfs/crypto.o
  CC      net/sched/sch_frag.o
  CC      drivers/char/agp/intel-agp.o
  CC      net/core/netprio_cgroup.o
  CC      kernel/bpf/hashtab.o
  CC      kernel/trace/trace_functions.o
  CC      drivers/char/tpm/tpm-chip.o
  CC      kernel/bpf/arraymap.o
  CC      drivers/tty/vt/consolemap.o
  CC      kernel/bpf/percpu_freelist.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-icl-match.o
  CC      drivers/pci/slot.o
  CC      kernel/signal.o
  CC      mm/msync.o
  CC      crypto/crc32c_generic.o
  CC      kernel/bpf/bpf_lru_list.o
  CC      drivers/acpi/acpica/hwsleep.o
  CC      drivers/xen/biomerge.o
  CC      kernel/bpf/lpm_trie.o
  CC      net/ipv4/route.o
  CC      net/xfrm/xfrm_policy.o
  CC      net/ipv4/inetpeer.o
  CC      drivers/iommu/dma-iommu.o
  CC      drivers/acpi/ec.o
  CC      net/netfilter/nf_queue.o
  AR      drivers/gpu/drm/display/built-in.a
  CC      lib/zstd/common/error_private.o
  CC [M]  drivers/gpu/drm/display/drm_display_helper_mod.o
  CC [M]  net/ipv4/netfilter/iptable_nat.o
  CC      drivers/char/agp/intel-gtt.o
  CC      lib/zstd/common/fse_decompress.o
  CC      drivers/iommu/io-pgtable.o
  CC      drivers/acpi/acpica/hwvalid.o
  CC      arch/x86/kernel/traps.o
  CC      drivers/iommu/intel/nested.o
  CC      net/xfrm/xfrm_state.o
  CC      crypto/crct10dif_common.o
  CC [M]  drivers/gpu/drm/tests/drm_connector_test.o
  CC      drivers/regulator/devres.o
  AR      drivers/connector/built-in.a
  CC      drivers/pci/pci-acpi.o
  CC [M]  drivers/gpu/drm/display/drm_dp_dual_mode_helper.o
  CC      net/bpf/bpf_dummy_struct_ops.o
  CC      block/t10-pi.o
  AR      drivers/gpu/drm/renesas/rcar-du/built-in.a
  HOSTCC  drivers/tty/vt/conmakehash
  CC      fs/ecryptfs/keystore.o
  AR      drivers/gpu/drm/omapdrm/built-in.a
  AR      drivers/gpu/drm/renesas/rz-du/built-in.a
  CC      kernel/trace/trace_preemptirq.o
  CC      fs/fat/misc.o
  AR      drivers/gpu/drm/renesas/built-in.a
  CC      kernel/trace/trace_sched_wakeup.o
  CC      kernel/trace/trace_hwlat.o
  CC      drivers/xen/xen-balloon.o
  CC      mm/page_vma_mapped.o
  CC      drivers/char/mem.o
  CC      kernel/sys.o
  AR      drivers/gpu/drm/tilcdc/built-in.a
  CC      net/ethtool/strset.o
  CC      mm/pagewalk.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-tgl-match.o
  CC      drivers/char/tpm/tpm-dev-common.o
  CC      net/netlink/policy.o
  CC      drivers/pci/iomap.o
  CC      drivers/acpi/acpica/hwxface.o
  CC      lib/zstd/common/zstd_common.o
  CC      drivers/tty/vt/defkeymap.o
  CC      net/core/netclassid_cgroup.o
  CONMK   drivers/tty/vt/consolemap_deftbl.c
  CC      net/core/lwtunnel.o
  AR      lib/zstd/built-in.a
  CC      drivers/iommu/iova.o
  CC      lib/cmdline.o
  CC      lib/cpumask.o
  CC      drivers/iommu/amd/quirks.o
  CC      drivers/tty/vt/consolemap_deftbl.o
  CC [M]  drivers/gpu/drm/tests/drm_damage_helper_test.o
  AR      drivers/tty/vt/built-in.a
  CC      net/sched/sch_api.o
  CC      arch/x86/kernel/cpu/tsx.o
  CC      crypto/crct10dif_generic.o
  CC      drivers/tty/hvc/hvc_console.o
  CC      drivers/iommu/irq_remapping.o
  CC      drivers/iommu/intel/trace.o
  CC      drivers/char/tpm/tpm-dev.o
  AR      drivers/gpu/drm/imx/built-in.a
  CC      drivers/acpi/dock.o
  CC      drivers/acpi/pci_root.o
  AR      net/bpf/built-in.a
  CC      drivers/acpi/pci_link.o
  CC      drivers/acpi/acpica/hwxfsleep.o
  CC      drivers/char/agp/via-agp.o
  CC      kernel/trace/trace_osnoise.o
  CC      drivers/iommu/amd/io_pgtable.o
  CC      fs/fat/nfs.o
  CC      mm/pgtable-generic.o
  CC      drivers/char/random.o
  CC      drivers/iommu/virtio-iommu.o
  CC      drivers/regulator/irq_helpers.o
  CC [M]  drivers/regulator/tps68470-regulator.o
  CC      arch/x86/kernel/idt.o
  CC [M]  drivers/gpu/drm/display/drm_dp_helper.o
  AR      net/netlink/built-in.a
  CC      net/core/lwt_bpf.o
  CC      drivers/xen/sys-hypervisor.o
  CC      arch/x86/kernel/irq.o
  CC      crypto/crc64_rocksoft_generic.o
  CC      net/unix/af_unix.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-ehl-match.o
  CC      fs/ecryptfs/kthread.o
  CC      kernel/trace/trace_nop.o
  CC      lib/ctype.o
  CC      net/ethtool/linkinfo.o
  CC      kernel/bpf/map_in_map.o
  CC      net/netfilter/nf_sockopt.o
  CC      net/unix/garbage.o
  CC      arch/x86/kernel/cpu/intel_epb.o
  CC      drivers/char/tpm/tpm-interface.o
  CC      drivers/pci/quirks.o
  CC      drivers/char/tpm/tpm1-cmd.o
  CC [M]  drivers/gpu/drm/tests/drm_dp_mst_helper_test.o
  CC      block/blk-mq-pci.o
  CC      lib/dec_and_lock.o
  CC      block/blk-mq-virtio.o
  AR      drivers/char/agp/built-in.a
  CC      drivers/acpi/acpica/hwpci.o
  CC      drivers/acpi/acpica/nsaccess.o
  CC      fs/fat/namei_vfat.o
  CC      crypto/lzo.o
  CC      drivers/iommu/intel/cap_audit.o
  CC      crypto/lzo-rle.o
  CC      drivers/iommu/amd/io_pgtable_v2.o
  CC      fs/fat/namei_msdos.o
  CC      net/core/dst_cache.o
  CC      net/core/gro_cells.o
  CC      fs/ecryptfs/debug.o
  CC      fs/ecryptfs/messaging.o
  CC      mm/rmap.o
  CC      drivers/acpi/pci_irq.o
  CC      drivers/xen/platform-pci.o
  CC      lib/decompress.o
  CC      drivers/tty/hvc/hvc_irq.o
  CC      kernel/bpf/bloom_filter.o
  CC      drivers/iommu/intel/svm.o
  CC      arch/x86/kernel/irq_64.o
  CC      arch/x86/kernel/dumpstack_64.o
  CC      lib/decompress_bunzip2.o
  CC      arch/x86/kernel/time.o
  CC      arch/x86/kernel/cpu/amd.o
  CC      net/core/failover.o
  CC      drivers/acpi/acpica/nsalloc.o
  CC      net/ethtool/linkmodes.o
  CC      net/netfilter/utils.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-jsl-match.o
  CC [M]  drivers/gpu/drm/tests/drm_exec_test.o
  AR      drivers/regulator/built-in.a
  CC      crypto/xxhash_generic.o
  CC      net/ethtool/rss.o
  CC      crypto/rng.o
  CC      drivers/base/power/sysfs.o
  CC      drivers/char/ttyprintk.o
  AR      drivers/iommu/amd/built-in.a
  CC      drivers/tty/hvc/hvc_xen.o
  CC      arch/x86/kernel/ioport.o
  CC      drivers/acpi/acpica/nsarguments.o
  CC      block/blk-zoned.o
  CC      net/core/skmsg.o
  CC      drivers/char/tpm/tpm2-cmd.o
  CC      kernel/bpf/local_storage.o
  CC      kernel/bpf/queue_stack_maps.o
  AR      fs/fat/built-in.a
  CC      net/core/sock_map.o
  CC      fs/ecryptfs/miscdev.o
  CC [M]  drivers/gpu/drm/tests/drm_format_helper_test.o
  CC      drivers/char/tpm/tpmrm-dev.o
  CC      drivers/xen/swiotlb-xen.o
  CC      drivers/xen/mcelog.o
  CC      drivers/iommu/iommu-sva.o
  CC      lib/decompress_inflate.o
  CC      drivers/base/firmware_loader/builtin/main.o
  CC      lib/decompress_unlz4.o
  CC      drivers/xen/xen-acpi-processor.o
  CC      drivers/char/tpm/tpm2-space.o
  CC      block/blk-wbt.o
  CC      net/core/bpf_sk_storage.o
  CC      drivers/acpi/acpica/nsconvert.o
  CC      kernel/trace/trace_stack.o
  CC [M]  net/core/selftests.o
  CC      drivers/char/misc.o
  CC      net/netfilter/nf_bpf_link.o
  CC      net/ipv4/protocol.o
  CC      drivers/iommu/intel/irq_remapping.o
  CC      drivers/base/firmware_loader/fallback_table.o
  CC      drivers/base/firmware_loader/main.o
  CC      net/sched/sch_blackhole.o
  CC      crypto/drbg.o
  CC      lib/decompress_unlzma.o
  CC      net/ethtool/linkstate.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-adl-match.o
  AR      drivers/base/firmware_loader/builtin/built-in.a
  CC      net/xfrm/xfrm_hash.o
  CC      net/ethtool/debug.o
  CC      drivers/base/firmware_loader/fallback.o
  CC      net/netfilter/nf_hooks_lwtunnel.o
  CC [M]  drivers/gpu/drm/tests/drm_format_test.o
  CC [M]  drivers/gpu/drm/display/drm_dp_mst_topology.o
  CC      drivers/acpi/acpica/nsdump.o
  AR      fs/ecryptfs/built-in.a
  CC      drivers/char/virtio_console.o
  CC      drivers/char/hpet.o
  CC      fs/unicode/utf8-norm.o
  CC      drivers/tty/serial/8250/8250_core.o
  CC      fs/unicode/utf8-core.o
  AR      drivers/tty/hvc/built-in.a
  CC      kernel/bpf/ringbuf.o
  CC      drivers/base/power/generic_ops.o
  CC      arch/x86/kernel/dumpstack.o
  CC      drivers/tty/serial/serial_core.o
  CC      drivers/tty/serial/serial_base_bus.o
  CC      drivers/pci/ats.o
  CC      drivers/tty/serial/serial_ctrl.o
  CC      drivers/xen/efi.o
  CC      crypto/jitterentropy.o
  CC      drivers/tty/serial/serial_port.o
  CC      arch/x86/kernel/nmi.o
  CC      lib/decompress_unlzo.o
  CC      drivers/acpi/acpica/nseval.o
  CC      drivers/iommu/io-pgfault.o
  CC      kernel/trace/trace_mmiotrace.o
  CC      drivers/char/tpm/tpm-sysfs.o
  CC      net/unix/sysctl_net_unix.o
  CC      net/xfrm/xfrm_input.o
  CC      net/unix/unix_bpf.o
  CC [M]  net/netfilter/nfnetlink.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-rpl-match.o
  CC      net/sched/cls_api.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-mtl-match.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-arl-match.o
  COPY    fs/unicode/utf8data.c
  CC [M]  sound/soc/intel/common/soc-acpi-intel-lnl-match.o
  CC [M]  sound/soc/intel/common/soc-acpi-intel-hda-match.o
  CC [M]  drivers/gpu/drm/tests/drm_framebuffer_test.o
  CC      drivers/tty/serial/earlycon.o
  CC      net/ethtool/wol.o
  CC [M]  drivers/gpu/drm/tests/drm_gem_shmem_test.o
  CC      drivers/base/firmware_loader/sysfs.o
  CC      drivers/char/tpm/eventlog/common.o
  CC [M]  drivers/gpu/drm/tests/drm_managed_test.o
  CC      drivers/char/tpm/eventlog/tpm1.o
  CC      drivers/iommu/intel/perfmon.o
  CC      drivers/acpi/acpica/nsinit.o
  CC      drivers/acpi/acpica/nsload.o
  CC      fs/unicode/utf8data.o
  CC      lib/decompress_unxz.o
  CC      drivers/base/power/common.o
  CC      net/ipv4/ip_input.o
  CC      mm/vmalloc.o
  CC      drivers/xen/xlate_mmu.o
  CC      crypto/jitterentropy-kcapi.o
  CC      kernel/bpf/bpf_local_storage.o
  CC      kernel/bpf/bpf_task_storage.o
  CC      net/ipv4/ip_fragment.o
  CC      block/blk-mq-debugfs.o
  CC      drivers/pci/iov.o
  CC      drivers/tty/serdev/core.o
  CC      arch/x86/kernel/cpu/hygon.o
  CC      net/sched/act_api.o
  AR      drivers/tty/ipwireless/built-in.a
  CC      drivers/base/power/qos.o
  CC      kernel/trace/trace_functions_graph.o
  CC      arch/x86/kernel/cpu/centaur.o
  CC      drivers/acpi/acpica/nsnames.o
  CC [M]  drivers/gpu/drm/tests/drm_mm_test.o
  AR      drivers/gpu/drm/i2c/built-in.a
  CC      drivers/tty/serial/8250/8250_pnp.o
  CC      net/xfrm/xfrm_output.o
  CC      drivers/tty/serdev/serdev-ttyport.o
  CC      kernel/umh.o
  CC      drivers/acpi/acpica/nsobject.o
  CC      drivers/acpi/acpica/nsparse.o
  CC      lib/decompress_unzstd.o
  CC [M]  drivers/gpu/drm/tests/drm_modes_test.o
  CC      kernel/bpf/bpf_inode_storage.o
  CC      drivers/tty/serial/max310x.o
  CC      drivers/tty/serial/sccnxp.o
  CC      drivers/base/firmware_loader/sysfs_upload.o
  CC      drivers/char/tpm/eventlog/tpm2.o
  CC      lib/dump_stack.o
  AR      net/ipv6/netfilter/built-in.a
  CC      net/ipv6/af_inet6.o
  CC      net/ipv6/anycast.o
  AR      net/unix/built-in.a
  CC [M]  net/ipv6/netfilter/nf_defrag_ipv6_hooks.o
  CC      block/blk-mq-debugfs-zoned.o
  CC      crypto/ghash-generic.o
  CC      net/ethtool/features.o
  AR      net/core/built-in.a
  CC [M]  net/netfilter/nf_conntrack_core.o
  AR      drivers/gpu/drm/panel/built-in.a
  CC [M]  sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.o
  CC      drivers/tty/serial/serial_mctrl_gpio.o
  AR      drivers/gpu/drm/bridge/analogix/built-in.a
  AR      drivers/iommu/intel/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_plane_helper_test.o
  CC      arch/x86/kernel/cpu/zhaoxin.o
  AR      drivers/iommu/built-in.a
  AR      drivers/gpu/drm/bridge/cadence/built-in.a
  AR      fs/unicode/built-in.a
  AR      drivers/gpu/drm/bridge/imx/built-in.a
  CC      drivers/acpi/acpica/nspredef.o
  CC      drivers/acpi/acpi_lpss.o
  CC      net/sched/sch_fifo.o
  CC      mm/process_vm_access.o
  CC      fs/fuse/dev.o
  CC      mm/page_alloc.o
  AR      drivers/gpu/drm/bridge/synopsys/built-in.a
  AR      drivers/gpu/drm/bridge/built-in.a
  CC      mm/shuffle.o
  CC      fs/fuse/dir.o
  CC      drivers/tty/serial/8250/8250_port.o
  CC      drivers/xen/unpopulated-alloc.o
  CC      drivers/pci/pci-label.o
  CC      lib/earlycpio.o
  CC      net/sched/ematch.o
  CC      crypto/xor.o
  CC [M]  net/sched/sch_fq_codel.o
  CC      drivers/char/tpm/tpm_ppi.o
  CC      crypto/hash_info.o
  CC      drivers/acpi/acpica/nsprepkg.o
  CC      drivers/acpi/acpica/nsrepair.o
  CC      kernel/trace/blktrace.o
  CC      arch/x86/kernel/ldt.o
  AR      drivers/tty/serdev/built-in.a
  CC      crypto/kdf_sp800108.o
  CC      drivers/tty/serial/8250/8250_dma.o
  LD [M]  sound/soc/intel/common/snd-soc-acpi-intel-match.o
  CC      mm/init-mm.o
  AR      drivers/gpu/drm/hisilicon/built-in.a
  CC      arch/x86/kernel/cpu/perfctr-watchdog.o
  CC      kernel/bpf/disasm.o
  CC      drivers/tty/serial/kgdb_nmi.o
  CC      block/sed-opal.o
  AR      drivers/gpu/drm/mxsfb/built-in.a
  CC      net/ipv6/ip6_output.o
  CC      lib/extable.o
  CC      drivers/block/loop.o
  AR      drivers/base/firmware_loader/built-in.a
  CC [M]  sound/soc/sof/intel/hda.o
  CC [M]  drivers/gpu/drm/tests/drm_probe_helper_test.o
  CC [M]  net/netfilter/nf_conntrack_standalone.o
  CC      net/ethtool/privflags.o
  CC [M]  net/netfilter/nf_conntrack_expect.o
  CC      mm/memblock.o
  CC [M]  net/netfilter/nf_conntrack_helper.o
  CC      drivers/block/virtio_blk.o
  CC      drivers/acpi/acpica/nsrepair2.o
  CC      drivers/pci/p2pdma.o
  CC      drivers/acpi/acpica/nssearch.o
  CC      drivers/tty/serial/kgdboc.o
  CC      net/ipv4/ip_forward.o
  CC      kernel/trace/fgraph.o
  AR      drivers/misc/eeprom/built-in.a
  CC      drivers/mfd/88pm860x-core.o
  CC [M]  drivers/gpu/drm/display/drm_dsc_helper.o
  CC      kernel/trace/trace_events.o
  CC      drivers/char/tpm/eventlog/acpi.o
  CC      drivers/base/power/runtime.o
  AR      drivers/misc/cb710/built-in.a
  CC      drivers/xen/grant-dma-ops.o
  CC      lib/flex_proportions.o
  AR      drivers/misc/ti-st/built-in.a
  AR      drivers/misc/lis3lv02d/built-in.a
  AR      drivers/misc/cardreader/built-in.a
  CC      drivers/mfd/88pm860x-i2c.o
  CC      drivers/mfd/wm8400-core.o
  AR      drivers/misc/pvpanic/built-in.a
  CC      drivers/acpi/acpica/nsutils.o
  CC [M]  drivers/gpu/drm/tests/drm_rect_test.o
  CC [M]  crypto/cmac.o
  CC [M]  drivers/misc/mei/hdcp/mei_hdcp.o
  CC      kernel/bpf/mprog.o
  CC      drivers/acpi/acpica/nswalk.o
  CC [M]  net/ipv6/netfilter/nf_conntrack_reasm.o
  CC      net/xfrm/xfrm_sysctl.o
  CC      arch/x86/kernel/setup.o
  CC      kernel/bpf/trampoline.o
  CC      kernel/bpf/btf.o
  CC      kernel/bpf/memalloc.o
  CC      arch/x86/kernel/cpu/vmware.o
  CC      lib/idr.o
  CC      net/ethtool/rings.o
  CC [M]  drivers/misc/mei/pxp/mei_pxp.o
  AR      sound/built-in.a
  CC      kernel/bpf/arena.o
  CC      kernel/workqueue.o
  CC      net/packet/af_packet.o
  CC [M]  sound/soc/sof/intel/hda-loader.o
  CC      drivers/acpi/acpica/nsxfeval.o
  CC      drivers/char/tpm/eventlog/efi.o
  AR      net/sched/built-in.a
  CC [M]  drivers/gpu/drm/display/drm_dp_tunnel.o
  CC      drivers/tty/serial/8250/8250_dwlib.o
  AR      drivers/xen/built-in.a
  CC      drivers/tty/serial/8250/8250_fintek.o
  CC      net/xfrm/xfrm_replay.o
  CC      drivers/block/xen-blkfront.o
  CC      drivers/tty/serial/8250/8250_pcilib.o
  CC      fs/fuse/file.o
  CC [M]  crypto/ccm.o
  CC [M]  crypto/cryptd.o
  CC      drivers/tty/serial/8250/8250_early.o
  CC      net/ipv4/ip_options.o
  CC      drivers/pci/vgaarb.o
  CC      block/blk-pm.o
  CC      kernel/trace/trace_export.o
  CC [M]  sound/soc/sof/intel/hda-stream.o
  CC      arch/x86/kernel/cpu/hypervisor.o
  CC [M]  drivers/gpu/drm/display/drm_hdcp_helper.o
  CC [M]  drivers/misc/mei/gsc_proxy/mei_gsc_proxy.o
  CC      kernel/bpf/dispatcher.o
  CC      mm/memory_hotplug.o
  CC      lib/irq_regs.o
  CC      kernel/bpf/devmap.o
  CC      mm/slub.o
  CC      drivers/misc/sram.o
  CC      arch/x86/kernel/x86_init.o
  CC [M]  crypto/polyval-generic.o
  CC      drivers/mfd/wm831x-core.o
  CC      drivers/mfd/wm831x-irq.o
  CC [M]  drivers/misc/enclosure.o
  CC      drivers/char/tpm/tpm_tis_core.o
  CC      drivers/base/power/wakeirq.o
  CC      net/ethtool/channels.o
  CC      drivers/acpi/acpica/nsxfname.o
  CC      lib/is_single_threaded.o
  CC      net/ethtool/coalesce.o
  CC      drivers/tty/serial/8250/8250_dw.o
  CC      drivers/acpi/acpica/nsxfobj.o
  CC      drivers/acpi/acpica/psargs.o
  CC [M]  net/netfilter/nf_conntrack_proto.o
  CC [M]  drivers/block/nbd.o
  AR      fs/hostfs/built-in.a
  CC      drivers/tty/tty_io.o
  CC      arch/x86/kernel/cpu/mshyperv.o
  CC      mm/madvise.o
  CC      net/ipv6/ip6_input.o
  CC      block/blk-crypto.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_helper.o
  CC      lib/klist.o
  CC      kernel/trace/trace_syscalls.o
  CC      kernel/trace/trace_event_perf.o
  CC [M]  drivers/misc/mei/init.o
  CC      drivers/acpi/acpica/psloop.o
  CC      drivers/acpi/acpica/psobject.o
  CC      arch/x86/kernel/i8259.o
  CC      arch/x86/kernel/irqinit.o
  CC [M]  sound/soc/sof/intel/hda-trace.o
  CC [M]  arch/x86/kvm/emulate.o
  CC      kernel/bpf/cpumap.o
  LD [M]  net/ipv6/netfilter/nf_defrag_ipv6.o
  CC      drivers/pci/doe.o
  CC [M]  drivers/gpu/drm/display/drm_scdc_helper.o
  CC      drivers/tty/n_tty.o
  CC [M]  sound/soc/sof/amd/acp.o
  CC [M]  crypto/simd.o
  CC      drivers/tty/serial/8250/8250_mid.o
  CC      lib/kobject.o
  CC      drivers/base/power/main.o
  CC      lib/kobject_uevent.o
  CC      net/ethtool/pause.o
  CC      drivers/mfd/wm831x-otp.o
  CC      arch/x86/kernel/jump_label.o
  CC      drivers/mfd/wm831x-auxadc.o
  CC      drivers/mfd/wm831x-i2c.o
  CC      drivers/tty/tty_ioctl.o
  CC      net/ipv6/addrconf.o
  CC [M]  sound/soc/sof/intel/hda-dsp.o
  CC      net/xfrm/xfrm_device.o
  CC      net/ethtool/eee.o
  CC      lib/logic_pio.o
  CC      drivers/acpi/acpica/psopcode.o
  CC      block/blk-crypto-profile.o
  CC      block/blk-crypto-sysfs.o
  CC [M]  drivers/gpu/drm/display/drm_dp_aux_dev.o
  CC      drivers/char/tpm/tpm_tis.o
  CC      arch/x86/kernel/irq_work.o
  CC      drivers/char/tpm/tpm_crb.o
  CC      net/ipv4/ip_output.o
  CC      kernel/trace/trace_events_filter.o
  CC [M]  drivers/misc/mei/hbm.o
  CC      kernel/bpf/offload.o
  CC      drivers/acpi/acpica/psopinfo.o
  CC      fs/fuse/inode.o
  CC      drivers/acpi/acpica/psparse.o
  CC      arch/x86/kernel/cpu/acrn.o
  CC      drivers/tty/serial/8250/8250_pci.o
  CC      net/ethtool/tsinfo.o
  CC      drivers/mfd/wm831x-spi.o
  CC      net/ethtool/cabletest.o
  CC      drivers/mfd/wm8350-core.o
  CC      net/ethtool/tunnels.o
  CC      drivers/base/regmap/regmap.o
  CC      drivers/base/regmap/regcache.o
  CC      drivers/acpi/acpica/psscope.o
  AR      drivers/nfc/built-in.a
  LD [M]  crypto/crypto_simd.o
  CC      drivers/tty/tty_ldisc.o
  CC      crypto/rsapubkey.asn1.o
  CC [M]  sound/soc/sof/amd/acp-loader.o
  CC      crypto/rsaprivkey.asn1.o
  CC [M]  drivers/pci/pci-stub.o
  CC      drivers/tty/tty_buffer.o
  CC      net/ethtool/fec.o
  CC      drivers/tty/tty_port.o
  CC      drivers/base/power/wakeup.o
  CC      net/xfrm/xfrm_proc.o
  CC [M]  arch/x86/kvm/i8259.o
  CC [M]  sound/soc/sof/intel/hda-ipc.o
  CC      block/blk-crypto-fallback.o
  AR      crypto/built-in.a
  CC [M]  sound/soc/sof/intel/hda-ctrl.o
  CC      arch/x86/kernel/cpu/debugfs.o
  AR      drivers/block/built-in.a
  CC [M]  sound/soc/sof/intel/hda-pcm.o
  CC [M]  arch/x86/kvm/irq.o
  CC [M]  net/netfilter/nf_conntrack_proto_generic.o
  AR      drivers/base/test/built-in.a
  CC      kernel/pid.o
  CC      net/ipv4/ip_sockglue.o
  CC      drivers/acpi/acpica/pstree.o
  AR      drivers/char/tpm/built-in.a
  LD [M]  drivers/gpu/drm/display/drm_display_helper.o
  CC [M]  sound/soc/sof/amd/acp-ipc.o
  CC [M]  drivers/char/lp.o
  AR      drivers/gpu/drm/tiny/built-in.a
  AR      net/packet/built-in.a
  CC      net/ipv4/inet_hashtables.o
  CC      net/ipv4/inet_timewait_sock.o
  AR      drivers/gpu/drm/xlnx/built-in.a
  CC      mm/page_io.o
  CC      net/devlink/core.o
  AR      drivers/gpu/drm/gud/built-in.a
  AR      drivers/gpu/drm/solomon/built-in.a
  CC [M]  drivers/gpu/drm/ttm/ttm_tt.o
  CC      drivers/mfd/wm8350-regmap.o
  CC      net/devlink/netlink.o
  AR      drivers/pci/built-in.a
  CC      drivers/base/regmap/regcache-rbtree.o
  CC      drivers/acpi/acpica/psutils.o
  CC [M]  drivers/misc/mei/interrupt.o
  CC      drivers/nvdimm/core.o
  CC      drivers/mfd/wm8350-gpio.o
  CC      lib/maple_tree.o
  CC      drivers/nvdimm/bus.o
  CC      drivers/nvdimm/dimm_devs.o
  CC      drivers/mfd/wm8350-irq.o
  CC      arch/x86/kernel/cpu/capflags.o
  CC      drivers/mfd/wm8350-i2c.o
  CC      net/ethtool/eeprom.o
  CC [M]  sound/soc/sof/intel/hda-dai.o
  CC      drivers/acpi/acpica/pswalk.o
  CC [M]  sound/soc/sof/amd/acp-pcm.o
  AR      arch/x86/kernel/cpu/built-in.a
  CC      block/holder.o
  CC      arch/x86/kernel/probe_roms.o
  CC [M]  net/xfrm/xfrm_algo.o
  CC      drivers/nvdimm/nd_perf.o
  CC [M]  drivers/gpu/drm/scheduler/sched_main.o
  CC      drivers/tty/tty_mutex.o
  CC [M]  drivers/char/ppdev.o
  CC [M]  sound/soc/sof/amd/acp-stream.o
  CC      net/ethtool/stats.o
  CC [M]  sound/soc/sof/intel/hda-dai-ops.o
  CC      drivers/tty/serial/8250/8250_rt288x.o
  CC [M]  net/netfilter/nf_conntrack_proto_tcp.o
  CC      drivers/acpi/acpi_apd.o
  CC      net/devlink/netlink_gen.o
  CC      kernel/trace/trace_events_trigger.o
  CC      fs/debugfs/inode.o
  CC [M]  net/netfilter/nf_conntrack_proto_udp.o
  CC      drivers/acpi/acpi_platform.o
  CC      drivers/base/regmap/regcache-flat.o
  CC      drivers/acpi/acpica/psxface.o
  CC      fs/fuse/control.o
  CC      kernel/bpf/net_namespace.o
  CC      mm/swap_state.o
  CC [M]  sound/soc/sof/amd/acp-trace.o
  CC [M]  sound/soc/sof/amd/acp-common.o
  CC [M]  arch/x86/kvm/lapic.o
  CC [M]  sound/soc/sof/amd/acp-probes.o
  CC      drivers/base/power/wakeup_stats.o
  CC      arch/x86/kernel/sys_ia32.o
  CC      net/ipv6/addrlabel.o
  CC      drivers/acpi/acpica/rsaddr.o
  CC [M]  drivers/misc/mei/client.o
  CC [M]  sound/soc/sof/intel/hda-bus.o
  CC      drivers/acpi/acpica/rscalc.o
  AR      drivers/char/built-in.a
  CC      drivers/mfd/tps65910.o
  CC [M]  drivers/misc/mei/main.o
  CC      drivers/dax/super.o
  CC      drivers/dax/hmem/device.o
  CC      drivers/dax/bus.o
  CC [M]  drivers/gpu/drm/ttm/ttm_bo.o
  CC      net/ipv6/route.o
  CC      drivers/base/regmap/regcache-maple.o
  CC [M]  sound/soc/sof/intel/skl.o
  AR      block/built-in.a
  CC      drivers/base/power/trace.o
  CC [M]  sound/soc/sof/intel/hda-loader-skl.o
  CC      net/ipv6/ip6_fib.o
  CC [M]  sound/soc/sof/amd/pci-rn.o
  CC      fs/fuse/xattr.o
  CC      drivers/base/component.o
  CC      net/ipv4/inet_connection_sock.o
  AR      drivers/tty/serial/8250/built-in.a
  CC      drivers/base/power/clock_ops.o
  AR      drivers/tty/serial/built-in.a
  CC      drivers/dma-buf/heaps/system_heap.o
  CC      drivers/tty/tty_ldsem.o
  CC      drivers/dma-buf/dma-buf.o
  CC      drivers/nvdimm/dimm.o
  CC      drivers/acpi/acpica/rscreate.o
  CC      fs/debugfs/file.o
  CC      kernel/bpf/tcx.o
  CC      net/ethtool/phc_vclocks.o
  CC      net/devlink/dev.o
  CC      kernel/trace/trace_eprobe.o
  AR      drivers/misc/built-in.a
  CC      arch/x86/kernel/signal_32.o
  CC      net/ipv4/tcp.o
  CC      net/ipv4/tcp_input.o
  CC      mm/swapfile.o
  CC [M]  net/netfilter/nf_conntrack_proto_icmp.o
  CC      drivers/mfd/tps65912-core.o
  CC      drivers/mfd/tps65912-i2c.o
  CC [M]  net/xfrm/xfrm_user.o
  CC      net/devlink/port.o
  CC [M]  drivers/misc/mei/dma-ring.o
  CC      net/ethtool/mm.o
  CC [M]  drivers/gpu/drm/scheduler/sched_fence.o
  CC      net/ipv6/ipv6_sockglue.o
  CC [M]  net/netfilter/nf_conntrack_extend.o
  CC [M]  sound/soc/sof/xtensa/core.o
  CC      fs/fuse/acl.o
  CC [M]  sound/soc/sof/amd/renoir.o
  CC [M]  net/netfilter/nf_conntrack_acct.o
  CC      drivers/base/regmap/regmap-debugfs.o
  CC      drivers/base/core.o
  CC [M]  drivers/dax/hmem/hmem.o
  AR      drivers/dma-buf/heaps/built-in.a
  CC      net/ipv6/ndisc.o
  CC      kernel/trace/trace_events_inject.o
  CC      drivers/tty/tty_baudrate.o
  CC      drivers/acpi/acpica/rsdumpinfo.o
  CC [M]  drivers/misc/mei/bus.o
  CC      drivers/nvdimm/region_devs.o
  CC      net/devlink/sb.o
  AR      drivers/base/power/built-in.a
  CC      net/devlink/dpipe.o
  CC      net/devlink/resource.o
  CC      arch/x86/kernel/sys_x86_64.o
  CC      drivers/base/bus.o
  CC [M]  sound/soc/sof/intel/apl.o
  CC      drivers/base/dd.o
  CC      drivers/acpi/acpica/rsinfo.o
  CC      kernel/bpf/stackmap.o
  CC [M]  drivers/gpu/drm/ttm/ttm_bo_util.o
  AR      drivers/cxl/core/built-in.a
  AR      drivers/macintosh/built-in.a
  CC [M]  drivers/macintosh/mac_hid.o
  CC [M]  drivers/cxl/core/port.o
  CC      kernel/bpf/cgroup_iter.o
  CC      kernel/bpf/bpf_cgrp_storage.o
  CC [M]  drivers/gpu/drm/scheduler/sched_entity.o
  CC      net/ipv6/udp.o
  CC      fs/fuse/readdir.o
  AR      drivers/dax/hmem/built-in.a
  LD [M]  drivers/dax/hmem/dax_hmem.o
  CC      drivers/base/regmap/regmap-i2c.o
  CC      drivers/mfd/tps65912-spi.o
  LD [M]  sound/soc/sof/amd/snd-sof-amd-acp.o
  CC [M]  drivers/dax/device.o
  CC      fs/fuse/ioctl.o
  CC      drivers/base/regmap/regmap-spi.o
  CC      drivers/acpi/acpica/rsio.o
  CC      drivers/tty/tty_jobctrl.o
  CC      drivers/dma-buf/dma-fence.o
  CC      drivers/acpi/acpica/rsirq.o
  AR      fs/debugfs/built-in.a
  CC      fs/tracefs/inode.o
  CC      kernel/trace/trace_events_synth.o
  CC      net/ipv6/udplite.o
  CC      mm/swap_slots.o
  LD [M]  sound/soc/sof/amd/snd-sof-amd-renoir.o
  LD [M]  sound/soc/sof/xtensa/snd-sof-xtensa-dsp.o
  CC [M]  drivers/misc/mei/bus-fixup.o
  CC      drivers/acpi/acpi_pnp.o
  CC [M]  sound/soc/sof/core.o
  CC      drivers/acpi/acpica/rslist.o
  CC      arch/x86/kernel/espfix_64.o
  CC [M]  sound/soc/sof/ops.o
  CC      drivers/mfd/twl-core.o
  CC [M]  net/netfilter/nf_conntrack_seqadj.o
  CC      net/ethtool/module.o
  AR      drivers/dax/built-in.a
  LD [M]  drivers/dax/device_dax.o
  CC [M]  sound/soc/sof/loader.o
  CC      kernel/bpf/cgroup.o
  AR      net/xfrm/built-in.a
  CC [M]  sound/soc/sof/intel/cnl.o
  CC      drivers/mfd/twl4030-irq.o
  CC      drivers/acpi/power.o
  CC [M]  arch/x86/kvm/i8254.o
  CC [M]  sound/soc/sof/intel/tgl.o
  CC      drivers/nvdimm/region.o
  CC      drivers/base/syscore.o
  CC [M]  sound/soc/sof/intel/icl.o
  CC [M]  net/netfilter/nf_conntrack_proto_icmpv6.o
  CC      drivers/acpi/acpica/rsmemory.o
  CC [M]  drivers/gpu/drm/ttm/ttm_bo_vm.o
  LD [M]  drivers/gpu/drm/scheduler/gpu-sched.o
  CC      drivers/acpi/event.o
  CC      fs/tracefs/event_inode.o
  CC      drivers/base/regmap/regmap-mmio.o
  CC [M]  drivers/misc/mei/debugfs.o
  CC [M]  drivers/misc/mei/mei-trace.o
  CC      drivers/base/driver.o
  CC      drivers/dma-buf/dma-fence-array.o
  CC      drivers/tty/n_null.o
  CC [M]  drivers/gpu/drm/radeon/radeon_drv.o
  CC      kernel/bpf/reuseport_array.o
  CC      fs/fuse/iomode.o
  CC      drivers/acpi/acpica/rsmisc.o
  CC      arch/x86/kernel/ksysfs.o
  CC      net/ipv6/raw.o
  CC      mm/zswap.o
  CC      lib/memcat_p.o
  CC [M]  drivers/cxl/core/pmem.o
  CC      drivers/mfd/twl6030-irq.o
  CC [M]  drivers/cxl/core/regs.o
  CC      drivers/mfd/twl4030-audio.o
  CC      net/ipv4/tcp_output.o
  CC      mm/dmapool.o
  CC      net/devlink/param.o
  CC      net/ethtool/pse-pd.o
  CC      net/ipv6/icmp.o
  CC      drivers/nvdimm/namespace_devs.o
  CC      drivers/base/class.o
  CC      drivers/tty/pty.o
  CC      drivers/dma-buf/dma-fence-chain.o
  CC      drivers/nvdimm/label.o
  CC [M]  sound/soc/sof/ipc.o
  CC [M]  arch/x86/kvm/ioapic.o
  CC [M]  sound/soc/sof/intel/mtl.o
  CC      drivers/acpi/acpica/rsserial.o
  CC      drivers/acpi/evged.o
  CC [M]  sound/soc/sof/pcm.o
  AR      fs/tracefs/built-in.a
  CC      mm/hugetlb.o
  CC      drivers/base/regmap/regmap-irq.o
  CC      fs/fuse/passthrough.o
  CC      net/ipv6/mcast.o
  CC [M]  sound/soc/sof/intel/lnl.o
  CC      arch/x86/kernel/bootflag.o
  CC      arch/x86/kernel/e820.o
  CC      lib/nmi_backtrace.o
  CC      drivers/base/platform.o
  CC [M]  sound/sound_core.o
  CC [M]  drivers/gpu/drm/radeon/radeon_device.o
  CC [M]  drivers/gpu/drm/ttm/ttm_module.o
  CC [M]  sound/soc/sof/intel/hda-common-ops.o
  CC [M]  drivers/gpu/drm/ttm/ttm_execbuf_util.o
  CC      kernel/trace/trace_events_hist.o
  CC      kernel/bpf/bpf_struct_ops.o
  CC      drivers/acpi/acpica/rsutils.o
  CC [M]  drivers/gpu/drm/ttm/ttm_range_manager.o
  CC      drivers/acpi/sysfs.o
  CC      net/ipv4/tcp_timer.o
  CC [M]  net/netfilter/nf_conntrack_timeout.o
  CC [M]  sound/soc/sof/intel/telemetry.o
  CC      net/ethtool/plca.o
  CC      drivers/dma-buf/dma-fence-unwrap.o
  CC [M]  sound/soc/sof/intel/hda-probes.o
  CC      drivers/tty/tty_audit.o
  CC [M]  drivers/misc/mei/pci-me.o
  CC [M]  sound/soc/sof/intel/hda-mlink.o
  CC [M]  drivers/cxl/core/memdev.o
  CC [M]  drivers/cxl/core/mbox.o
  CC      net/ipv4/tcp_ipv4.o
  CC      drivers/mfd/twl6040.o
  CC      net/ipv4/tcp_minisocks.o
  CC      lib/objpool.o
  AR      fs/fuse/built-in.a
  CC      net/devlink/region.o
  CC      arch/x86/kernel/pci-dma.o
  CC      drivers/acpi/acpica/rsxface.o
  CC      arch/x86/kernel/quirks.o
  CC      arch/x86/kernel/topology.o
  CC [M]  arch/x86/kvm/irq_comm.o
  CC      net/ipv6/reassembly.o
  CC      fs/btrfs/super.o
  CC [M]  sound/soc/sof/pm.o
  CC      drivers/nvdimm/badrange.o
  LD [M]  sound/soundcore.o
  CC [M]  drivers/gpu/drm/ttm/ttm_resource.o
  CC      lib/plist.o
  AR      drivers/base/regmap/built-in.a
  CC      drivers/acpi/acpica/tbdata.o
  CC      drivers/tty/sysrq.o
  CC      drivers/dma-buf/dma-resv.o
  CC      lib/radix-tree.o
  CC [M]  drivers/misc/mei/hw-me.o
  AR      drivers/scsi/device_handler/built-in.a
  CC [M]  sound/soc/sof/intel/hda-codec.o
  CC      arch/x86/kernel/kdebugfs.o
  CC      drivers/acpi/acpica/tbfadt.o
  CC      drivers/base/cpu.o
  CC [M]  drivers/scsi/device_handler/scsi_dh_rdac.o
  CC      drivers/acpi/acpica/tbfind.o
  CC      drivers/base/firmware.o
  CC [M]  drivers/gpu/drm/radeon/radeon_asic.o
  CC      kernel/bpf/cpumask.o
  CC      lib/ratelimit.o
  CC      mm/hugetlb_vmemmap.o
  CC [M]  drivers/gpu/drm/ttm/ttm_pool.o
  AR      net/ethtool/built-in.a
  CC      drivers/dma-buf/dma-heap.o
  CC [M]  sound/soc/sof/debug.o
  CC      drivers/mfd/mfd-core.o
  CC      kernel/task_work.o
  CC      kernel/trace/bpf_trace.o
  CC      drivers/acpi/acpica/tbinstal.o
  CC [M]  drivers/cxl/core/pci.o
  CC [M]  drivers/cxl/core/hdm.o
  CC      drivers/nvdimm/claim.o
  CC [M]  sound/soc/sof/topology.o
  CC [M]  drivers/cxl/core/pmu.o
  CC [M]  drivers/cxl/core/cdat.o
  CC      drivers/mfd/ezx-pcap.o
  CC      arch/x86/kernel/alternative.o
  CC      drivers/acpi/acpica/tbprint.o
  CC      drivers/mfd/da903x.o
  CC      arch/x86/kernel/i8253.o
  CC      arch/x86/kernel/hw_breakpoint.o
  CC      net/devlink/health.o
  CC [M]  net/netfilter/nf_conntrack_timestamp.o
  CC      drivers/dma-buf/sync_file.o
  CC      kernel/bpf/bpf_lsm.o
  CC      net/ipv6/tcp_ipv6.o
  CC [M]  drivers/scsi/device_handler/scsi_dh_emc.o
  CC [M]  drivers/scsi/device_handler/scsi_dh_alua.o
  CC      lib/rbtree.o
  CC      kernel/extable.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_device.o
  CC      drivers/ata/libata-core.o
  AR      drivers/nvme/common/built-in.a
  CC      drivers/ata/libata-scsi.o
  CC      drivers/nvme/host/core.o
  CC [M]  drivers/gpu/drm/radeon/radeon_kms.o
  CC      drivers/acpi/acpica/tbutils.o
  CC      net/devlink/trap.o
  CC [M]  arch/x86/kvm/cpuid.o
  CC      drivers/dma-buf/sw_sync.o
  CC      drivers/base/init.o
  CC [M]  sound/soc/sof/intel/pci-tgl.o
  CC      lib/seq_buf.o
  CC      arch/x86/kernel/tsc.o
  CC      net/ipv4/tcp_cong.o
  CC [M]  drivers/gpu/drm/ttm/ttm_device.o
  CC      kernel/bpf/relo_core.o
  CC [M]  sound/soc/sof/control.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.o
  AR      drivers/tty/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.o
  CC      drivers/acpi/acpica/tbxface.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.o
  CC [M]  drivers/cxl/core/trace.o
  CC      kernel/trace/trace_kprobe.o
  CC [M]  sound/soc/sof/trace.o
  CC      drivers/acpi/acpica/tbxfload.o
  CC      lib/siphash.o
  CC      arch/x86/kernel/tsc_msr.o
  CC [M]  net/netfilter/nf_conntrack_ecache.o
  CC      arch/x86/kernel/io_delay.o
  CC      drivers/nvdimm/btt_devs.o
  CC      arch/x86/kernel/rtc.o
  CC      net/ipv4/tcp_metrics.o
  CC      net/devlink/rate.o
  CC [M]  drivers/misc/mei/gsc-me.o
  CC      drivers/base/map.o
  LD [M]  drivers/misc/mei/mei.o
  CC [M]  drivers/gpu/drm/ttm/ttm_sys_manager.o
  AR      drivers/scsi/megaraid/built-in.a
  CC [M]  drivers/gpu/drm/radeon/radeon_atombios.o
  CC [M]  sound/soc/sof/intel/pci-mtl.o
  CC [M]  drivers/gpu/drm/radeon/radeon_agp.o
  CC      drivers/acpi/property.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_base.o
  CC      drivers/mfd/da9052-irq.o
  CC      drivers/dma-buf/sync_debug.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_config.o
  CC      drivers/mfd/da9052-core.o
  CC      drivers/mfd/da9052-spi.o
  CC      net/devlink/linecard.o
  CC      drivers/dma-buf/udmabuf.o
  CC [M]  net/netfilter/nf_conntrack_labels.o
  CC [M]  net/netfilter/nf_conntrack_proto_dccp.o
  CC      fs/btrfs/ctree.o
  CC      drivers/acpi/acpica/tbxfroot.o
  TEST    lib/test_fortify/read_overflow2-memmove.log
  CC [M]  drivers/gpu/drm/ttm/ttm_agp_backend.o
  CC      mm/mempolicy.o
  CC      drivers/base/devres.o
  CC      arch/x86/kernel/resource.o
  CC      drivers/nvdimm/pfn_devs.o
  AS      arch/x86/kernel/irqflags.o
  LD [M]  drivers/misc/mei/mei-me.o
  LD [M]  drivers/misc/mei/mei-gsc.o
  CC      mm/sparse.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/atombios_crtc.o
  CC      drivers/ata/libata-eh.o
  AR      kernel/bpf/built-in.a
  CC      drivers/nvdimm/dax_devs.o
  TEST    lib/test_fortify/read_overflow-memcmp.log
  CC      net/ipv4/tcp_fastopen.o
  CC      arch/x86/kernel/static_call.o
  CC      net/ipv4/tcp_rate.o
  CC      drivers/acpi/acpica/utaddress.o
  CC [M]  sound/soc/sof/intel/pci-lnl.o
  CC      drivers/acpi/acpica/utalloc.o
  CC [M]  drivers/cxl/core/region.o
  CC      drivers/mfd/da9052-i2c.o
  CC      kernel/params.o
  AR      net/dsa/built-in.a
  CC      drivers/base/attribute_container.o
  CC      drivers/spi/spi.o
  CC      drivers/nvme/host/ioctl.o
  CC      drivers/mfd/lp8788.o
  TEST    lib/test_fortify/write_overflow-memmove.log
  CC      drivers/nvdimm/security.o
  CC      kernel/trace/error_report-traces.o
  CC [M]  drivers/dma-buf/selftest.o
  CC      drivers/acpi/acpi_cmos_rtc.o
  CC      drivers/spi/spi-mem.o
  CC      drivers/ata/libata-transport.o
  TEST    lib/test_fortify/read_overflow2_field-memcpy.log
  CC      drivers/acpi/acpica/utascii.o
  CC      drivers/acpi/acpica/utbuffer.o
  CC      kernel/kthread.o
  LD [M]  drivers/gpu/drm/ttm/ttm.o
  CC      net/strparser/strparser.o
  CC [M]  drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.o
  CC      drivers/ata/libata-trace.o
  AR      net/wireless/tests/built-in.a
  CC      drivers/ata/libata-sata.o
  AR      net/wireless/built-in.a
  LD [M]  sound/soc/sof/intel/snd-sof-intel-hda-common.o
  LD [M]  sound/soc/sof/intel/snd-sof-intel-hda-mlink.o
  CC      drivers/acpi/x86/apple.o
  CC      drivers/base/transport_class.o
  TEST    lib/test_fortify/read_overflow-memscan.log
  LD [M]  sound/soc/sof/intel/snd-sof-intel-hda.o
  CC      net/netlabel/netlabel_user.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_scsih.o
  LD [M]  sound/soc/sof/intel/snd-sof-pci-intel-tgl.o
  LD [M]  sound/soc/sof/intel/snd-sof-pci-intel-mtl.o
  LD [M]  sound/soc/sof/intel/snd-sof-pci-intel-lnl.o
  CC      net/netlabel/netlabel_kapi.o
  CC [M]  sound/soc/sof/iomem-utils.o
  CC [M]  arch/x86/kvm/pmu.o
  CC      arch/x86/kernel/process.o
  CC      kernel/sys_ni.o
  CC      net/ipv4/tcp_recovery.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.o
  CC [M]  drivers/dma-buf/st-dma-fence.o
  CC      net/ipv6/ping.o
  CC      drivers/acpi/acpica/utcksum.o
  CC      kernel/trace/power-traces.o
  CC [M]  net/netfilter/nf_conntrack_proto_sctp.o
  TEST    lib/test_fortify/write_overflow_field-memcpy.log
  CC      kernel/nsproxy.o
  CC [M]  drivers/gpu/drm/radeon/atombios_crtc.o
  CC      net/ipv4/tcp_ulp.o
  CC      kernel/trace/rpm-traces.o
  CC      net/ipv6/exthdrs.o
  CC      kernel/trace/trace_kdb.o
  AR      net/devlink/built-in.a
  CC      net/ipv6/datagram.o
  CC      drivers/nvdimm/e820.o
  CC      drivers/acpi/acpica/utcopy.o
  TEST    lib/test_fortify/read_overflow2-memcmp.log
  CC      arch/x86/kernel/ptrace.o
  CC      drivers/mfd/lp8788-irq.o
  CC [M]  drivers/gpu/drm/radeon/radeon_combios.o
  LD [M]  drivers/gpu/drm/amd/amdxcp/amdxcp.o
  CC [M]  sound/soc/sof/sof-audio.o
  CC      kernel/notifier.o
  CC [M]  sound/soc/sof/stream-ipc.o
  CC [M]  drivers/dma-buf/st-dma-fence-chain.o
  CC [M]  drivers/gpu/drm/vgem/vgem_drv.o
  CC      arch/x86/kernel/tls.o
  CC      drivers/base/topology.o
  CC [M]  drivers/gpu/drm/vgem/vgem_fence.o
  TEST    lib/test_fortify/write_overflow-strcpy-lit.log
  CC      drivers/nvme/host/sysfs.o
  CC      arch/x86/kernel/step.o
  CC      drivers/acpi/acpica/utexcep.o
  CC [M]  drivers/gpu/drm/radeon/atom.o
  AR      drivers/nvdimm/built-in.a
  CC      drivers/ata/libata-sff.o
  CC      net/netlabel/netlabel_domainhash.o
  CC [M]  drivers/gpu/drm/i915/i915_config.o
  CC [M]  drivers/gpu/drm/i915/i915_driver.o
  CC      net/netlabel/netlabel_addrlist.o
  CC      net/netlabel/netlabel_mgmt.o
  CC      net/netlabel/netlabel_unlabeled.o
  CC      net/ipv4/tcp_offload.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_live_test_mod.o
  CC      drivers/mfd/da9055-core.o
  LD [M]  drivers/cxl/core/cxl_core.o
  TEST    lib/test_fortify/read_overflow2-memcpy.log
  CC [M]  drivers/cxl/acpi.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_bo_test.o
  CC      drivers/mfd/da9055-i2c.o
  CC      mm/sparse-vmemmap.o
  CC      fs/btrfs/extent-tree.o
  AR      net/strparser/built-in.a
  CC      drivers/ata/libata-pmp.o
  CC      net/rfkill/core.o
  CC [M]  net/netfilter/nf_conntrack_netlink.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/atom.o
  CC [M]  sound/soc/sof/fw-file-profile.o
  CC      drivers/acpi/x86/utils.o
  CC      drivers/base/container.o
  LD [M]  drivers/gpu/drm/vgem/vgem.o
  CC      net/ipv4/tcp_plb.o
  CC      drivers/acpi/acpica/utdebug.o
  CC      drivers/nvme/host/pr.o
  TEST    lib/test_fortify/write_overflow-strscpy.log
  CC [M]  drivers/dma-buf/st-dma-fence-unwrap.o
  AR      drivers/nvme/target/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvif/object.o
  CC      drivers/ata/libata-acpi.o
  CC [M]  drivers/spi/spi-intel.o
  CC      kernel/trace/trace_dynevent.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/client.o
  CC [M]  drivers/dma-buf/st-dma-resv.o
  CC [M]  sound/soc/sof/ipc3.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_dma_buf_test.o
  CC      kernel/trace/trace_probe.o
  CC [M]  arch/x86/kvm/mtrr.o
  CC [M]  drivers/gpu/drm/ast/ast_ddc.o
  TEST    lib/test_fortify/write_overflow-memcpy.log
  CC [M]  sound/soc/sof/ipc3-loader.o
  CC      arch/x86/kernel/tboot.o
  CC      drivers/mfd/da9063-core.o
  CC      drivers/base/property.o
  CC      net/ipv4/datagram.o
  CC      mm/mmu_notifier.o
  CC      drivers/acpi/x86/s2idle.o
  CC      kernel/ksysfs.o
  CC      kernel/cred.o
  CC [M]  drivers/cxl/port.o
  LD [M]  drivers/cxl/cxl_acpi.o
  TEST    lib/test_fortify/read_overflow-memchr.log
  CC      drivers/base/cacheinfo.o
  CC      arch/x86/kernel/i8237.o
  AR      drivers/dma-buf/built-in.a
  CC      net/netlabel/netlabel_cipso_v4.o
  CC [M]  drivers/gpu/drm/radeon/radeon_fence.o
  LD [M]  drivers/dma-buf/dmabuf_selftests.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_migrate_test.o
  CC      net/ipv4/raw.o
  CC      drivers/acpi/acpica/utdecode.o
  CC      drivers/acpi/acpica/utdelete.o
  CC [M]  drivers/gpu/drm/radeon/radeon_ttm.o
  TEST    lib/test_fortify/write_overflow_field-memset.log
  CC [M]  drivers/gpu/drm/radeon/radeon_object.o
  CC      drivers/base/swnode.o
  CC      net/netlabel/netlabel_calipso.o
  CC      kernel/trace/trace_uprobe.o
  CC      kernel/trace/trace_boot.o
  CC      drivers/ata/libata-zpodd.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/conn.o
  CC      net/ipv6/ip6_flowlabel.o
  CC [M]  drivers/gpu/drm/i915/i915_drm_client.o
  CC      drivers/nvme/host/trace.o
  CC      drivers/mfd/da9063-irq.o
  TEST    lib/test_fortify/read_overflow-memchr_inv.log
  CC      drivers/mfd/da9063-i2c.o
  CC      net/ipv4/udp.o
  CC      net/rfkill/input.o
  CC [M]  drivers/gpu/drm/ast/ast_dp501.o
  CC [M]  drivers/spi/spi-intel-pci.o
  CC [M]  sound/soc/sof/ipc3-topology.o
  CC      drivers/scsi/scsi.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_mocs_test.o
  CC      drivers/acpi/acpica/uterror.o
  AR      drivers/cxl/built-in.a
  CC      drivers/base/auxiliary.o
  TEST    lib/test_fortify/write_overflow-strcpy.log
  LD [M]  drivers/cxl/cxl_port.o
  CC      mm/ksm.o
  CC      arch/x86/kernel/stacktrace.o
  CC      mm/page_poison.o
  CC      drivers/acpi/acpica/uteval.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.o
  CC [M]  sound/soc/sof/ipc3-control.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.o
  CC      drivers/scsi/hosts.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_object.o
  CC      kernel/trace/fprobe.o
  AR      drivers/net/phy/qcom/built-in.a
  AR      net/rfkill/built-in.a
  CC [M]  drivers/net/phy/aquantia/aquantia_main.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/device.o
  CC      net/ipv4/udplite.o
  TEST    lib/test_fortify/read_overflow2_field-memmove.log
  CC      kernel/reboot.o
  CC      drivers/net/pse-pd/pse_core.o
  CC      net/ipv4/udp_offload.o
  CC [M]  arch/x86/kvm/debugfs.o
  CC      drivers/acpi/acpica/utglobal.o
  CC [M]  drivers/spi/spi-pxa2xx.o
  CC      net/dcb/dcbnl.o
  CC      drivers/mfd/max14577.o
  CC      net/dns_resolver/dns_key.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_test_mod.o
  CC      drivers/ata/libata-pata-timings.o
  AR      net/mpls/built-in.a
  CC [M]  drivers/gpu/drm/ast/ast_dp.o
  CC [M]  drivers/net/phy/aquantia/aquantia_firmware.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/disp.o
  CC [M]  drivers/gpu/drm/radeon/radeon_gart.o
  CC      drivers/nvme/host/multipath.o
  AR      drivers/message/fusion/built-in.a
  CC [M]  net/netfilter/nf_nat_core.o
  AR      drivers/message/built-in.a
  CC [M]  drivers/gpu/drm/ast/ast_drv.o
  CC [M]  drivers/gpu/drm/ast/ast_main.o
  TEST    lib/test_fortify/write_overflow_field-memmove.log
  CC      drivers/acpi/debugfs.o
  CC      arch/x86/kernel/reboot.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_transport.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.o
  CC      drivers/base/devtmpfs.o
  CC [M]  drivers/gpu/drm/i915/i915_getparam.o
  CC      net/ipv4/arp.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_pci_test.o
  CC      net/ipv4/icmp.o
  TEST    lib/test_fortify/write_overflow-strncpy.log
  CC      net/dns_resolver/dns_query.o
  CC [M]  drivers/gpu/drm/ast/ast_mm.o
  AR      net/netlabel/built-in.a
  CC      drivers/acpi/acpica/uthex.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/driver.o
  CC [M]  sound/soc/sof/ipc3-pcm.o
  CC      drivers/acpi/acpica/utids.o
  CC      drivers/acpi/acpica/utinit.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_display.o
  CC      drivers/acpi/acpica/utlock.o
  CC      drivers/acpi/acpi_lpat.o
  CC [M]  arch/x86/kvm/mmu/mmu.o
  TEST    lib/test_fortify/write_overflow-memset.log
  CC      drivers/base/node.o
  CC      kernel/trace/rethook.o
  CC [M]  drivers/net/phy/aquantia/aquantia_hwmon.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_rtp_test.o
  CC [M]  drivers/gpu/drm/radeon/radeon_legacy_crtc.o
  CC      fs/btrfs/print-tree.o
  CC      net/ipv6/inet6_connection_sock.o
  CC [M]  drivers/spi/spi-pxa2xx-dma.o
  CC      net/ipv6/udp_offload.o
  CC [M]  drivers/gpu/drm/ast/ast_mode.o
  CC      drivers/acpi/acpica/utmath.o
  TEST    lib/test_fortify/write_overflow-strncpy-src.log
  CC      net/ipv4/devinet.o
  CC      drivers/mfd/max77693.o
  CC      net/ipv4/af_inet.o
  CC      drivers/nvme/host/zns.o
  CC      net/ipv4/igmp.o
  CC      drivers/nvme/host/hwmon.o
  CC      arch/x86/kernel/early-quirks.o
  CC      drivers/acpi/acpica/utmisc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.o
  AR      drivers/net/pse-pd/built-in.a
  CC      net/ipv6/seg6.o
  CC      drivers/base/memory.o
  CC      drivers/scsi/scsi_ioctl.o
  CC      drivers/mfd/max77843.o
  CC      drivers/nvme/host/pci.o
  CC      drivers/ata/ahci.o
  CC [M]  drivers/gpu/drm/i915/i915_ioctl.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/event.o
  CC      arch/x86/kernel/smp.o
  CC      lib/timerqueue.o
  CC      arch/x86/kernel/smpboot.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_ctl.o
  CC      arch/x86/kernel/tsc_sync.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_trigger_diag.o
  CC [M]  sound/soc/sof/ipc3-dtrace.o
  CC      kernel/trace/trace_fprobe.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_wa_test.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.o
  LD [M]  drivers/net/phy/aquantia/aquantia.o
  CC      drivers/net/phy/mdio-boardinfo.o
  CC      drivers/acpi/acpica/utmutex.o
  AR      net/dns_resolver/built-in.a
  CC [M]  drivers/gpu/drm/i915/i915_irq.o
  CC [M]  drivers/spi/spi-pxa2xx-pci.o
  CC      drivers/net/phy/stubs.o
  CC      drivers/base/module.o
  AR      drivers/net/mdio/built-in.a
  CC [M]  drivers/net/mdio/acpi_mdio.o
  CC      fs/btrfs/root-tree.o
  CC      lib/vsprintf.o
  CC      fs/pstore/inode.o
  AR      drivers/firewire/built-in.a
  CC [M]  drivers/net/mdio/fwnode_mdio.o
  AR      drivers/net/pcs/built-in.a
  CC [M]  arch/x86/kvm/mmu/page_track.o
  CC      drivers/cdrom/cdrom.o
  CC      drivers/mfd/max8925-core.o
  CC      mm/memtest.o
  CC [M]  drivers/gpu/drm/radeon/radeon_legacy_encoders.o
  CC      mm/migrate.o
  CC [M]  sound/soc/sof/ipc4.o
  CC      net/dcb/dcbevent.o
  CC      drivers/acpi/acpica/utnonansi.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/fifo.o
  CC [M]  net/netfilter/nf_nat_proto.o
  CC      drivers/scsi/scsicam.o
  CC [M]  drivers/gpu/drm/ast/ast_post.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_warpdrive.o
  CC [M]  drivers/scsi/mpt3sas/mpt3sas_debugfs.o
  CC [M]  drivers/gpu/drm/i915/i915_mitigations.o
  CC      drivers/scsi/scsi_error.o
  LD [M]  drivers/gpu/drm/xe/tests/xe_live_test.o
  CC      arch/x86/kernel/setup_percpu.o
  LD [M]  drivers/gpu/drm/xe/tests/xe_test.o
  CC      net/ipv4/fib_frontend.o
  CC [M]  drivers/gpu/drm/xe/xe_bb.o
  CC      drivers/ata/libahci.o
  CC      drivers/base/hypervisor.o
  CC      arch/x86/kernel/mpparse.o
  LD [M]  drivers/spi/spi-pxa2xx-platform.o
  AR      drivers/spi/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_bo.o
  CC [M]  drivers/gpu/drm/xe/xe_bo_evict.o
  CC      drivers/base/pinctrl.o
  CC      drivers/acpi/acpica/utobject.o
  AR      drivers/net/ethernet/3com/built-in.a
  CC      drivers/gpu/drm/drm_panel_orientation_quirks.o
  AR      drivers/net/ethernet/8390/built-in.a
  CC      fs/pstore/platform.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.o
  AR      drivers/net/ethernet/adaptec/built-in.a
  CC      net/ipv6/fib6_notifier.o
  CC      drivers/mfd/max8925-i2c.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.o
  AR      drivers/net/ethernet/adi/built-in.a
  CC      drivers/mfd/max8997.o
  AR      drivers/net/ethernet/agere/built-in.a
  AR      kernel/trace/built-in.a
  CC      fs/efivarfs/inode.o
  CC      kernel/async.o
  AR      drivers/net/ethernet/alacritech/built-in.a
  AR      drivers/net/ethernet/alteon/built-in.a
  CC      fs/btrfs/dir-item.o
  AR      drivers/net/ethernet/amazon/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvif/head.o
  CC      drivers/scsi/scsi_lib.o
  CC      drivers/net/phy/mii_timestamper.o
  AR      drivers/nvme/host/built-in.a
  CC      mm/memory-tiers.o
  AR      drivers/net/ethernet/amd/built-in.a
  AR      drivers/nvme/built-in.a
  CC      drivers/base/devcoredump.o
  CC      net/ipv4/fib_semantics.o
  AR      drivers/net/ethernet/aquantia/built-in.a
  CC      drivers/acpi/acpica/utosi.o
  CC      mm/migrate_device.o
  AR      drivers/net/ethernet/arc/built-in.a
  CC      arch/x86/kernel/ftrace.o
  CC [M]  arch/x86/kvm/mmu/spte.o
  AR      drivers/net/ethernet/asix/built-in.a
  CC      drivers/gpu/drm/drm_mipi_dsi.o
  LD [M]  drivers/scsi/mpt3sas/mpt3sas.o
  CC [M]  sound/soc/sof/ipc4-loader.o
  CC [M]  sound/soc/sof/ipc4-topology.o
  CC      mm/huge_memory.o
  AR      drivers/net/ethernet/atheros/built-in.a
  CC [M]  drivers/gpu/drm/radeon/radeon_connectors.o
  AR      drivers/net/ethernet/cadence/built-in.a
  CC [M]  arch/x86/kvm/mmu/tdp_iter.o
  CC      net/ipv6/rpl.o
  AR      drivers/net/ethernet/broadcom/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvif/mem.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/mmu.o
  CC [M]  drivers/net/ethernet/broadcom/tg3.o
  LD [M]  drivers/gpu/drm/ast/ast.o
  CC [M]  drivers/gpu/drm/i915/i915_module.o
  CC [M]  sound/soc/sof/ipc4-control.o
  CC [M]  drivers/gpu/drm/xe/xe_debugfs.o
  CC      lib/win_minmax.o
  AR      net/dcb/built-in.a
  AR      drivers/net/ethernet/brocade/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_devcoredump.o
  AR      drivers/net/ethernet/cavium/common/built-in.a
  CC      fs/efivarfs/file.o
  AR      drivers/net/ethernet/cavium/thunder/built-in.a
  CC      drivers/acpi/acpica/utownerid.o
  AR      drivers/net/ethernet/cavium/liquidio/built-in.a
  AR      drivers/net/ethernet/cavium/octeon/built-in.a
  AR      drivers/net/ethernet/cavium/built-in.a
  CC [M]  net/netfilter/nf_nat_helper.o
  CC      fs/efivarfs/super.o
  CC [M]  drivers/gpu/drm/xe/xe_device.o
  AS      arch/x86/kernel/ftrace_64.o
  CC      lib/xarray.o
  CC      lib/lockref.o
  CC      kernel/range.o
  CC      fs/pstore/pmsg.o
  CC      mm/khugepaged.o
  CC      net/ipv4/fib_trie.o
  CC      drivers/acpi/acpica/utpredef.o
  CC      mm/page_counter.o
  CC      drivers/mfd/max8997-irq.o
  CC      kernel/smpboot.o
  CC      drivers/mfd/max8998.o
  CC      mm/memcontrol.o
  CC      fs/btrfs/file-item.o
  AR      drivers/cdrom/built-in.a
  CC      drivers/mfd/max8998-irq.o
  CC      arch/x86/kernel/trace_clock.o
  CC      drivers/mfd/adp5520.o
  CC [M]  sound/soc/sof/ipc4-pcm.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/outp.o
  CC      arch/x86/kernel/trace.o
  CC      drivers/mfd/tps6586x.o
  CC      drivers/base/platform-msi.o
  CC      arch/x86/kernel/rethook.o
  CC      drivers/base/physical_location.o
  CC      net/ipv6/ioam6.o
  CC [M]  drivers/net/phy/mdio_devres.o
  CC      drivers/acpi/acpica/utresdecode.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_bios.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/timer.o
  CC [M]  drivers/gpu/drm/drm_aperture.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.o
  CC [M]  drivers/gpu/drm/i915/i915_params.o
  CC      drivers/acpi/acpica/utresrc.o
  CC      mm/vmpressure.o
  CC [M]  drivers/gpu/drm/radeon/radeon_encoders.o
  CC [M]  drivers/gpu/drm/radeon/radeon_display.o
  CC [M]  fs/pstore/ram.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/vmm.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/user.o
  CC      fs/efivarfs/vars.o
  CC [M]  drivers/gpu/drm/xe/xe_device_sysfs.o
  CC      drivers/ata/ahci_platform.o
  CC [M]  drivers/gpu/drm/xe/xe_dma_buf.o
  CC      drivers/acpi/acpica/utstate.o
  CC [M]  drivers/gpu/drm/xe/xe_drm_client.o
  CC      drivers/mfd/tps65090.o
  CC      drivers/mfd/aat2870-core.o
  CC [M]  drivers/gpu/drm/radeon/radeon_cursor.o
  CC      drivers/acpi/acpica/utstring.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/userc361.o
  CC      arch/x86/kernel/vmcore_info_64.o
  CC      arch/x86/kernel/machine_kexec_64.o
  CC      drivers/mfd/intel-lpss.o
  CC      kernel/ucount.o
  CC [M]  net/netfilter/nf_nat_masquerade.o
  CC      net/ipv4/fib_notifier.o
  CC [M]  net/netfilter/nf_tables_core.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/client.o
  CC      drivers/scsi/constants.o
  CC [M]  net/netfilter/nf_tables_api.o
  CC      drivers/base/trace.o
  CC [M]  arch/x86/kvm/mmu/tdp_mmu.o
  CC [M]  arch/x86/kvm/hyperv.o
  CC      drivers/acpi/acpica/utstrsuppt.o
  CC      lib/bcd.o
  AR      fs/efivarfs/built-in.a
  CC [M]  fs/pstore/ram_core.o
  CC [M]  drivers/gpu/drm/xe/xe_exec.o
  CC [M]  net/netfilter/nft_chain_filter.o
  AR      drivers/net/ethernet/chelsio/built-in.a
  CC [M]  drivers/gpu/drm/radeon/radeon_i2c.o
  AS      arch/x86/kernel/relocate_kernel_64.o
  CC [M]  drivers/gpu/drm/radeon/radeon_clocks.o
  CC      arch/x86/kernel/kexec-bzimage64.o
  CC      lib/sort.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/atombios_dp.o
  CC [M]  drivers/gpu/drm/i915/i915_pci.o
  CC      drivers/ata/libahci_platform.o
  CC      drivers/ata/ata_piix.o
  CC      lib/parser.o
  CC [M]  drivers/gpu/drm/radeon/radeon_gem.o
  CC [M]  drivers/net/phy/phylink.o
  CC      net/ipv4/inet_fragment.o
  CC      kernel/regset.o
  CC      kernel/ksyms_common.o
  CC [M]  drivers/gpu/drm/xe/xe_execlist.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_afmt.o
  CC [M]  sound/soc/sof/ipc4-mtrace.o
  CC      fs/btrfs/inode-item.o
  CC      fs/btrfs/disk-io.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_trace_points.o
  CC      net/switchdev/switchdev.o
  CC      drivers/acpi/acpica/utstrtoul64.o
  CC      net/ncsi/ncsi-cmd.o
  CC      net/l3mdev/l3mdev.o
  CC      net/ncsi/ncsi-rsp.o
  CC      net/ncsi/ncsi-aen.o
  CC [M]  drivers/gpu/drm/radeon/radeon_ring.o
  CC      net/ipv6/sysctl_net_ipv6.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/engine.o
  CC [M]  drivers/gpu/drm/radeon/radeon_irq_kms.o
  CC [M]  drivers/gpu/drm/xe/xe_exec_queue.o
  AR      drivers/base/built-in.a
  CC      net/ipv4/ping.o
  CC [M]  fs/pstore/zone.o
  CC      arch/x86/kernel/crash_dump_64.o
  CC      lib/debug_locks.o
  CC      drivers/acpi/acpica/utxface.o
  CC      drivers/mfd/intel-lpss-pci.o
  CC [M]  drivers/gpu/drm/xe/xe_force_wake.o
  CC      kernel/groups.o
  CC      kernel/vhost_task.o
  CC      net/ipv4/ip_tunnel_core.o
  CC      drivers/scsi/scsi_lib_dma.o
  CC      net/ipv4/gre_offload.o
  CC      lib/random32.o
  CC [M]  drivers/gpu/drm/i915/i915_scatterlist.o
  CC      net/ipv4/metrics.o
  CC [M]  sound/soc/sof/ipc4-telemetry.o
  CC      drivers/acpi/acpica/utxfinit.o
  CC      drivers/ata/pata_sis.o
  CC      drivers/acpi/acpica/utxferror.o
  CC      net/ipv4/netlink.o
  CC      net/xdp/xsk.o
  CC      net/ipv4/nexthop.o
  CC      net/xdp/xdp_umem.o
  CC      mm/swap_cgroup.o
  CC      net/ipv6/ip6mr.o
  CC      drivers/mfd/intel-lpss-acpi.o
  CC      arch/x86/kernel/crash.o
  CC      arch/x86/kernel/module.o
  CC      arch/x86/kernel/kgdb.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/enum.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/event.o
  CC [M]  net/netfilter/nf_tables_trace.o
  CC [M]  drivers/gpu/drm/xe/xe_ggtt.o
  CC      fs/btrfs/transaction.o
  CC      lib/bust_spinlocks.o
  CC      mm/hugetlb_cgroup.o
  CC      mm/memory-failure.o
  CC [M]  drivers/gpu/drm/radeon/radeon_cs.o
  CC      drivers/scsi/scsi_scan.o
  CC      net/ncsi/ncsi-manage.o
  CC      net/ipv4/udp_tunnel_stub.o
  CC [M]  fs/netfs/buffered_read.o
  GEN     drivers/scsi/scsi_devinfo_tbl.c
  CC      drivers/acpi/acpica/utxfmutex.o
  CC [M]  fs/netfs/buffered_write.o
  AR      net/l3mdev/built-in.a
  CC      drivers/scsi/scsi_devinfo.o
  CC      net/xdp/xsk_queue.o
  CC      net/xdp/xskmap.o
  CC [M]  sound/soc/sof/sof-client.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/firmware.o
  CC      drivers/mfd/palmas.o
  CC [M]  drivers/gpu/drm/i915/i915_suspend.o
  CC [M]  drivers/gpu/drm/i915/i915_switcheroo.o
  CC [M]  drivers/gpu/drm/i915/i915_sysfs.o
  CC      lib/kasprintf.o
  AR      net/switchdev/built-in.a
  CC [M]  drivers/gpu/drm/i915/i915_utils.o
  CC      drivers/acpi/acpica/dbcmds.o
  CC      net/ipv4/sysctl_net_ipv4.o
  CC [M]  fs/pstore/blk.o
  CC [M]  arch/x86/kvm/xen.o
  CC      drivers/mfd/rc5t583.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/atombios_encoders.o
  CC      kernel/kcmp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_sa.o
  CC      drivers/acpi/acpica/dbconvert.o
  CC      drivers/acpi/acpica/dbdisply.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/atombios_i2c.o
  CC      arch/x86/kernel/early_printk.o
  CC [M]  drivers/gpu/drm/xe/xe_gpu_scheduler.o
  CC [M]  drivers/net/phy/phy.o
  CC      drivers/ata/ata_generic.o
  HOSTCC  drivers/gpu/drm/xe/xe_gen_wa_oob
  CC      drivers/mfd/rc5t583-irq.o
  CC      lib/bitmap.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/gpuobj.o
  CC      drivers/scsi/scsi_sysctl.o
  CC      net/xdp/xsk_buff_pool.o
  CC [M]  drivers/gpu/drm/radeon/radeon_bios.o
  CC [M]  net/netfilter/nft_immediate.o
  CC      mm/kmemleak.o
  CC      kernel/freezer.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.o
  CC      drivers/scsi/scsi_proc.o
  CC      arch/x86/kernel/hpet.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc_proxy.o
  CC      drivers/acpi/acpica/dbexec.o
  CC [M]  fs/nfs/client.o
  CC      drivers/scsi/scsi_debugfs.o
  CC [M]  net/netfilter/nft_cmp.o
  CC      net/ipv4/proc.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc_submit.o
  CC      kernel/profile.o
  CC [M]  sound/soc/sof/sof-utils.o
  CC [M]  drivers/gpu/drm/i915/intel_clock_gating.o
  CC [M]  fs/netfs/direct_read.o
  CC      net/ncsi/ncsi-netlink.o
  CC      arch/x86/kernel/amd_nb.o
  CC [M]  fs/nfs/dir.o
  CC      mm/page_isolation.o
  CC      mm/zpool.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.o
  AR      drivers/auxdisplay/built-in.a
  CC      net/ipv4/fib_rules.o
  CC [M]  drivers/net/phy/phy-c45.o
  CC [M]  drivers/ata/acard-ahci.o
  CC [M]  fs/netfs/direct_write.o
  CC      fs/btrfs/inode.o
  CC      drivers/acpi/acpica/dbhistry.o
  LD [M]  fs/pstore/ramoops.o
  LD [M]  fs/pstore/pstore_zone.o
  CC [M]  drivers/ata/ahci_dwc.o
  LD [M]  fs/pstore/pstore_blk.o
  CC      fs/btrfs/file.o
  AR      fs/pstore/built-in.a
  CC      drivers/scsi/scsi_trace.o
  CC      drivers/mfd/syscon.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/intr.o
  CC      mm/zbud.o
  CC      net/mptcp/protocol.o
  CC      net/mctp/af_mctp.o
  CC      net/mctp/device.o
  CC [M]  drivers/net/phy/phy-core.o
  CC [M]  drivers/gpu/drm/radeon/radeon_benchmark.o
  CC [M]  fs/netfs/io.o
  CC      net/mptcp/subflow.o
  CC [M]  arch/x86/kvm/smm.o
  CC      lib/scatterlist.o
  AR      drivers/net/ethernet/cirrus/built-in.a
  CC      arch/x86/kernel/kvm.o
  CC      arch/x86/kernel/kvmclock.o
  CC      drivers/acpi/acpica/dbinput.o
  CC [M]  sound/soc/sof/sof-pci-dev.o
  CC [M]  drivers/gpu/drm/xe/xe_gt.o
  CC [M]  drivers/gpu/drm/drm_atomic.o
  CC [M]  net/netfilter/nft_range.o
  CC      kernel/stacktrace.o
  CC      drivers/scsi/scsi_logging.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/ioctl.o
  CC [M]  fs/lockd/clntlock.o
  CC [M]  fs/smb/common/cifs_arc4.o
  CC [M]  fs/smb/common/cifs_md4.o
  CC [M]  fs/lockd/clntproc.o
  CC      mm/zsmalloc.o
  CC      mm/early_ioremap.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/memory.o
  AR      net/ncsi/built-in.a
  CC [M]  fs/smb/client/trace.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/mm.o
  CC [M]  fs/netfs/iterator.o
  CC [M]  fs/autofs/init.o
  AR      drivers/ata/built-in.a
  CC      net/ipv6/xfrm6_policy.o
  CC [M]  drivers/gpu/drm/i915/intel_device_info.o
  CC      drivers/acpi/acpica/dbmethod.o
  CC [M]  fs/netfs/locking.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/object.o
  CC [M]  fs/netfs/main.o
  CC [M]  fs/netfs/misc.o
  CC      drivers/mfd/as3711.o
  HOSTCC  drivers/gpu/drm/radeon/mkregtable
  CC [M]  drivers/gpu/drm/radeon/rs400.o
  MKREG   drivers/gpu/drm/radeon/rs600_reg_safe.h
  CC      drivers/scsi/scsi_pm.o
  AR      net/xdp/built-in.a
  CC      kernel/dma.o
  AR      drivers/net/ethernet/cisco/built-in.a
  CC      drivers/acpi/acpica/dbnames.o
  AR      drivers/net/ethernet/cortina/built-in.a
  CC      arch/x86/kernel/paravirt.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_ccs_mode.o
  AR      drivers/net/ethernet/dec/tulip/built-in.a
  CC      net/mctp/route.o
  AR      drivers/net/ethernet/dec/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_clock.o
  CC      net/mctp/neigh.o
  CC      arch/x86/kernel/paravirt-spinlocks.o
  CC [M]  drivers/gpu/drm/i915/intel_memory_region.o
  AR      drivers/net/ethernet/dlink/built-in.a
  CC [M]  sound/soc/sof/sof-client-probes.o
  CC [M]  fs/autofs/inode.o
  CC [M]  arch/x86/kvm/vmx/vmx.o
  AR      drivers/net/ethernet/emulex/built-in.a
  CC      arch/x86/kernel/pvclock.o
  CC      net/ipv4/ipmr.o
  CC [M]  drivers/gpu/drm/drm_atomic_uapi.o
  AR      drivers/net/ethernet/engleder/built-in.a
  CC      lib/list_sort.o
  CC [M]  drivers/net/phy/phy_device.o
  CC [M]  fs/netfs/objects.o
  CC [M]  fs/nfs/file.o
  AR      drivers/net/ethernet/ezchip/built-in.a
  CC      arch/x86/kernel/pmem.o
  CC [M]  drivers/net/phy/linkmode.o
  AR      drivers/net/ethernet/fungible/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/oproxy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.o
  AR      drivers/net/ethernet/google/built-in.a
  CC      net/mptcp/options.o
  AR      drivers/net/ethernet/huawei/built-in.a
  CC      drivers/acpi/acpica/dbobject.o
  CC      drivers/mfd/intel_soc_pmic_crc.o
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_main.o
  CC [M]  fs/netfs/output.o
  CC [M]  drivers/net/ethernet/intel/e1000e/82571.o
  CC      mm/balloon_compaction.o
  CC      lib/uuid.o
  CC      drivers/acpi/acpica/dbstats.o
  CC      net/ipv6/xfrm6_state.o
  CC      drivers/scsi/scsi_dh.o
  CC      net/ipv6/xfrm6_input.o
  CC [M]  drivers/gpu/drm/radeon/rs690.o
  CC [M]  drivers/gpu/drm/i915/intel_pcode.o
  CC      net/handshake/alert.o
  CC      net/handshake/genl.o
  CC      kernel/smp.o
  CC      net/handshake/netlink.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_debugfs.o
  CC      lib/iov_iter.o
  CC      net/handshake/request.o
  CC      net/mptcp/token.o
  CC [M]  drivers/net/ethernet/intel/e1000e/ich8lan.o
  CC [M]  fs/autofs/root.o
  CC [M]  drivers/gpu/drm/i915/intel_region_ttm.o
  CC [M]  sound/soc/sof/sof-client-probes-ipc3.o
  CC      drivers/acpi/acpica/dbutils.o
  CC      mm/secretmem.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_freq.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_idle.o
  CC      drivers/mfd/intel_soc_pmic_chtwc.o
  CC      net/mptcp/crypto.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/option.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/ramht.o
  CC [M]  fs/lockd/clntxdr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/subdev.o
  CC [M]  fs/nfs/getroot.o
  AR      net/mctp/built-in.a
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_hw.o
  CC      drivers/acpi/acpica/dbxface.o
  CC [M]  net/netfilter/nft_bitwise.o
  CC      arch/x86/kernel/jailhouse.o
  MKREG   drivers/gpu/drm/radeon/rv515_reg_safe.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.o
  CC      drivers/usb/common/common.o
  CC      drivers/usb/core/usb.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_pll.o
  CC [M]  drivers/mfd/lpc_ich.o
  CC      net/ipv6/xfrm6_output.o
  CC      drivers/usb/common/debug.o
  CC [M]  drivers/gpu/drm/radeon/r520.o
  CC      net/ipv4/ipmr_base.o
  CC      drivers/scsi/scsi_bsg.o
  CC      net/mptcp/ctrl.o
  LD [M]  fs/netfs/netfs.o
  CC [M]  sound/soc/sof/sof-client-probes-ipc4.o
  CC [M]  net/llc/llc_core.o
  CC [M]  drivers/gpu/drm/i915/intel_runtime_pm.o
  CC [M]  net/bridge/br.o
  CC      net/handshake/tlshd.o
  CC      net/mptcp/pm.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_mcr.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_pagefault.o
  CC      net/ipv6/xfrm6_protocol.o
  CC [M]  fs/autofs/symlink.o
  CC      mm/userfaultfd.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sysfs.o
  CC [M]  fs/smb/client/cifsfs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/uevent.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/nvfw/fw.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.o
  CC [M]  fs/lockd/host.o
  CC      drivers/acpi/acpica/rsdump.o
  CC      net/mptcp/diag.o
  CC      arch/x86/kernel/eisa.o
  AR      drivers/mfd/built-in.a
  CC      drivers/input/serio/serio.o
  CC      drivers/scsi/scsi_common.o
  LD [M]  sound/soc/sof/snd-sof.o
  CC [M]  fs/nfs/inode.o
  CC      drivers/input/keyboard/atkbd.o
  CC [M]  drivers/net/phy/mdio_bus.o
  CC      kernel/uid16.o
  AR      drivers/input/mouse/built-in.a
  CC [M]  fs/autofs/waitq.o
  LD [M]  sound/soc/sof/snd-sof-utils.o
  CC [M]  drivers/gpu/drm/radeon/r600.o
  LD [M]  sound/soc/sof/snd-sof-pci.o
  CC [M]  net/netfilter/nft_byteorder.o
  CC [M]  drivers/net/phy/mdio_device.o
  CC      drivers/usb/core/hub.o
  LD [M]  sound/soc/sof/snd-sof-probes.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.o
  CC [M]  fs/nfs/super.o
  CC      fs/btrfs/defrag.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o
  AR      drivers/acpi/acpica/built-in.a
  CC [M]  sound/soc/soc-acpi.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_main.o
  CC      drivers/acpi/acpi_fpdt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/nvfw/hs.o
  CC      drivers/usb/common/led.o
  CC [M]  sound/soc/soc-core.o
  CC      net/ipv4/syncookies.o
  CC [M]  net/bridge/br_device.o
  CC      net/ipv4/netfilter.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/nvfw/ls.o
  CC      arch/x86/kernel/pcspeaker.o
  CC      net/mptcp/mib.o
  CC      net/mptcp/pm_netlink.o
  CC [M]  drivers/net/ethernet/intel/e1000e/80003es2lan.o
  CC [M]  drivers/gpu/drm/i915/intel_sbi.o
  CC [M]  drivers/net/ethernet/intel/e1000e/mac.o
  CC [M]  fs/smb/client/cifs_debug.o
  CC      net/ipv4/tcp_cubic.o
  AR      drivers/net/fddi/built-in.a
  CC      drivers/scsi/virtio_scsi.o
  CC      net/ipv6/netfilter.o
  CC      lib/clz_ctz.o
  CC      fs/btrfs/extent_map.o
  CC [M]  net/llc/llc_input.o
  CC      lib/bsearch.o
  CC [M]  fs/autofs/expire.o
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_ethtool.o
  CC      arch/x86/kernel/check.o
  CC      net/handshake/trace.o
  CC [M]  fs/autofs/dev-ioctl.o
  CC      lib/find_bit.o
  CC [M]  sound/soc/soc-dapm.o
  CC      drivers/acpi/acpi_lpit.o
  CC [M]  fs/lockd/svc.o
  CC [M]  net/netfilter/nft_payload.o
  CC      kernel/module_signature.o
  AR      drivers/input/keyboard/built-in.a
  AR      drivers/input/joystick/built-in.a
  CC      drivers/input/serio/i8042.o
  AR      drivers/input/tablet/built-in.a
  CC      mm/page_idle.o
  CC      fs/btrfs/sysfs.o
  CC      kernel/kallsyms.o
  CC      drivers/input/touchscreen/elants_i2c.o
  AR      drivers/usb/common/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_topology.o
  CC      drivers/input/serio/libps2.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/nvfw/acr.o
  AR      drivers/usb/phy/built-in.a
  CC      drivers/usb/dwc2/core.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.o
  CC [M]  net/sunrpc/clnt.o
  CC [M]  sound/soc/soc-jack.o
  CC      fs/open.o
  CC [M]  fs/overlayfs/super.o
  CC [M]  fs/overlayfs/namei.o
  CC [M]  drivers/gpu/drm/i915/intel_step.o
  CC [M]  drivers/net/phy/swphy.o
  CC      arch/x86/kernel/uprobes.o
  CC      drivers/acpi/prmt.o
  CC      drivers/scsi/sd.o
  CC      arch/x86/kernel/perf_regs.o
  CC [M]  drivers/net/ethernet/intel/e1000e/manage.o
  CC      fs/btrfs/accessors.o
  CC      fs/btrfs/xattr.o
  LD [M]  fs/autofs/autofs4.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.o
  CC      lib/llist.o
  CC      mm/usercopy.o
  CC      net/ipv6/fib6_rules.o
  CC [M]  drivers/net/phy/phy_led_triggers.o
  GEN     xe_wa_oob.c xe_wa_oob.h
  CC [M]  drivers/gpu/drm/xe/xe_guc_ct.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_db_mgr.o
  CC [M]  fs/smb/client/connect.o
  CC      lib/lwq.o
  CC [M]  net/llc/llc_output.o
  CC      net/mptcp/sockopt.o
  CC [M]  drivers/gpu/drm/radeon/rv770.o
  CC [M]  fs/nfs/io.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/nvfw/flcn.o
  AR      net/handshake/built-in.a
  CC      lib/memweight.o
  CC [M]  arch/x86/kvm/kvm-asm-offsets.s
  AR      drivers/input/touchscreen/built-in.a
  CC [M]  net/bridge/br_fdb.o
  CC [M]  arch/x86/kvm/vmx/pmu_intel.o
  CC      drivers/input/misc/uinput.o
  CC [M]  drivers/net/phy/ax88796b.o
  CC [M]  net/netfilter/nft_lookup.o
  CC      net/ipv4/tcp_sigpool.o
  CC      drivers/usb/dwc2/core_intr.o
  CC      drivers/usb/dwc2/platform.o
  CC [M]  net/bridge/br_forward.o
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_param.o
  CC      arch/x86/kernel/tracepoint.o
  CC      net/mptcp/pm_userspace.o
  CC      lib/kfifo.o
  CC      drivers/acpi/acpi_pcc.o
  CC [M]  drivers/gpu/drm/i915/intel_uncore.o
  CC [M]  fs/overlayfs/util.o
  CC      net/ipv6/proc.o
  CC [M]  sound/soc/soc-utils.o
  CC [M]  drivers/net/ethernet/intel/e1000e/nvm.o
  CC [M]  drivers/net/phy/bcm7xxx.o
  CC      fs/btrfs/ordered-data.o
  CC [M]  drivers/gpu/drm/i915/intel_wakeref.o
  CC [M]  fs/lockd/svclock.o
  CC [M]  drivers/gpu/drm/drm_auth.o
  CC      kernel/acct.o
  CC      net/ipv4/tcp_bpf.o
  CC      drivers/usb/core/hcd.o
  AR      drivers/input/serio/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/base.o
  CC [M]  fs/nfs/direct.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.o
  CC      arch/x86/kernel/itmt.o
  CC      drivers/rtc/lib.o
  CC      arch/x86/kernel/umip.o
  CC      drivers/acpi/acpi_ffh.o
  AR      drivers/input/misc/built-in.a
  CC      drivers/acpi/acpi_adxl.o
  CC      arch/x86/kernel/unwind_frame.o
  CC      mm/memremap.o
  CC      drivers/input/input.o
  CC [M]  drivers/gpu/drm/radeon/radeon_test.o
  CC      lib/percpu-refcount.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/cmdq.o
  CC      net/mptcp/fastopen.o
  AR      drivers/i2c/algos/built-in.a
  AR      drivers/net/ethernet/i825xx/built-in.a
  CC [M]  drivers/i2c/algos/i2c-algo-bit.o
  LD [M]  net/llc/llc.o
  CC [M]  drivers/net/phy/bcm84881.o
  CC [M]  sound/soc/soc-dai.o
  CC [M]  arch/x86/kvm/vmx/vmcs12.o
  LD [M]  drivers/net/ethernet/intel/e1000/e1000.o
  AR      drivers/i3c/built-in.a
  CC      drivers/usb/dwc2/drd.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_debugfs.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_main.o
  CC      fs/read_write.o
  CC      lib/rhashtable.o
  CC      drivers/scsi/sd_dif.o
  CC      drivers/scsi/sd_zbc.o
  CC [M]  fs/overlayfs/inode.o
  CC [M]  drivers/net/phy/bcm87xx.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_ethtool.o
  CC      mm/hmm.o
  AR      drivers/net/hamradio/built-in.a
  CC [M]  drivers/net/ethernet/intel/e1000e/phy.o
  CC [M]  drivers/net/ethernet/intel/e1000e/param.o
  CC [M]  drivers/gpu/drm/i915/vlv_sideband.o
  CC      kernel/vmcore_info.o
  CC      net/ipv4/udp_bpf.o
  CC      net/ipv6/syncookies.o
  CC [M]  fs/nfs/pagelist.o
  CC [M]  net/netfilter/nft_dynset.o
  CC      drivers/acpi/ac.o
  CC      arch/x86/kernel/sev.o
  CC      drivers/rtc/class.o
  CC [M]  fs/lockd/svcshare.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/fw.o
  CC      mm/memfd.o
  CC [M]  net/bridge/br_if.o
  CC [M]  drivers/net/phy/bcm-phy-lib.o
  CC      lib/base64.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_hwconfig.o
  CC [M]  arch/x86/kvm/vmx/nested.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_82575.o
  MKREG   drivers/gpu/drm/radeon/r200_reg_safe.h
  CC      drivers/usb/dwc2/params.o
  CC [M]  drivers/gpu/drm/radeon/radeon_legacy_tv.o
  CC      net/mptcp/sched.o
  CC      fs/btrfs/extent_io.o
  CC      fs/btrfs/volumes.o
  CC      net/mptcp/mptcp_pm_gen.o
  CC      lib/once.o
  CC      arch/x86/kernel/callthunks.o
  CC      lib/refcount.o
  CC [M]  drivers/gpu/drm/drm_blend.o
  CC      mm/ptdump.o
  CC      drivers/acpi/button.o
  CC [M]  net/bridge/br_input.o
  CC [M]  fs/overlayfs/file.o
  CC [M]  sound/soc/soc-component.o
  CC [M]  sound/soc/soc-pcm.o
  CC      drivers/usb/core/urb.o
  CC      drivers/i2c/busses/i2c-designware-common.o
  CC      drivers/scsi/sr.o
  CC      drivers/scsi/sr_ioctl.o
  CC      drivers/input/input-compat.o
  CC [M]  net/sunrpc/xprt.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_id_mgr.o
  CC      kernel/elfcorehdr.o
  CC [M]  drivers/gpu/drm/i915/vlv_suspend.o
  CC [M]  net/netfilter/nft_meta.o
  CC [M]  drivers/gpu/drm/drm_bridge.o
  CC      drivers/rtc/interface.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.o
  CC [M]  fs/smb/client/dir.o
  CC [M]  fs/lockd/svcproc.o
  CC [M]  fs/smb/client/file.o
  CC [M]  drivers/net/ethernet/intel/e1000e/ethtool.o
  CC [M]  drivers/net/phy/bcm-phy-ptp.o
  CC      arch/x86/kernel/audit_64.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/msgq.o
  CC      arch/x86/kernel/amd_gart_64.o
  CC      mm/page_reporting.o
  CC      drivers/input/input-mt.o
  CC      fs/btrfs/async-thread.o
  MKREG   drivers/gpu/drm/radeon/r600_reg_safe.h
  CC [M]  drivers/gpu/drm/radeon/radeon_pm.o
  CC      lib/rcuref.o
  CC      drivers/usb/dwc2/hcd.o
  CC      net/mptcp/syncookies.o
  CC [M]  fs/overlayfs/dir.o
  CC      drivers/usb/dwc2/hcd_intr.o
  CC      drivers/rtc/nvmem.o
  CC      drivers/acpi/fan_core.o
  CC      drivers/scsi/sr_vendor.o
  CC [M]  net/netfilter/nft_rt.o
  CC [M]  drivers/net/phy/broadcom.o
  CC [M]  drivers/net/ethernet/intel/e1000e/netdev.o
  CC [M]  fs/nfs/read.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_mac.o
  CC      lib/usercopy.o
  CC      net/ipv6/calipso.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_klv_helpers.o
  AR      drivers/net/ethernet/microsoft/built-in.a
  CC      net/ipv4/cipso_ipv4.o
  CC      drivers/rtc/dev.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.o
  CC [M]  drivers/net/phy/fixed_phy.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.o
  CC      kernel/crash_reserve.o
  CC [M]  drivers/gpu/drm/i915/soc/intel_dram.o
  CC      drivers/usb/core/message.o
  CC      drivers/usb/core/driver.o
  CC      arch/x86/kernel/aperture_64.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/v1.o
  CC [M]  fs/lockd/svcsubs.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_log.o
  CC [M]  fs/nfs/symlink.o
  CC      drivers/input/input-poller.o
  CC      drivers/i2c/busses/i2c-designware-master.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/gm200.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_pc.o
  CC      drivers/acpi/fan_attr.o
  CC [M]  fs/lockd/mon.o
  CC      lib/errseq.o
  CC      mm/bootmem_info.o
  CC      drivers/scsi/sg.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/gp102.o
  CC [M]  drivers/gpu/drm/radeon/atombios_dp.o
  CC      net/mptcp/bpf.o
  CC      lib/bucket_locks.o
  CC [M]  fs/overlayfs/readdir.o
  CC [M]  drivers/gpu/drm/drm_cache.o
  CC [M]  net/bridge/br_ioctl.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_mac.o
  CC      drivers/i2c/busses/i2c-designware-platdrv.o
  CC      drivers/input/ff-core.o
  CC      drivers/i2c/busses/i2c-designware-baytrail.o
  CC [M]  net/netfilter/nft_exthdr.o
  CC      kernel/kexec_core.o
  CC [M]  drivers/i2c/busses/i2c-i801.o
  CC [M]  net/netfilter/nft_last.o
  CC [M]  net/netfilter/nft_counter.o
  CC [M]  drivers/net/phy/lxt.o
  CC      kernel/crash_core.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_i225.o
  CC      drivers/rtc/proc.o
  CC [M]  sound/soc/soc-devres.o
  CC      drivers/acpi/pci_slot.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_nvm.o
  CC      arch/x86/kernel/mmconf-fam10h_64.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_base.o
  AR      mm/built-in.a
  CC      net/ipv4/xfrm4_policy.o
  CC      net/ipv4/xfrm4_state.o
  CC [M]  drivers/gpu/drm/i915/soc/intel_gmch.o
  CC      drivers/input/touchscreen.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_phy.o
  CC      net/ipv6/seg6_iptunnel.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/tu102.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_mbx.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_submit.o
  CC [M]  fs/overlayfs/copy_up.o
  CC      drivers/usb/host/pci-quirks.o
  CC      drivers/rtc/sysfs.o
  CC      drivers/usb/host/ehci-hcd.o
  CC      drivers/rtc/rtc-mc146818-lib.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.o
  CC      lib/generic-radix-tree.o
  CC [M]  drivers/gpu/drm/radeon/r600_hdmi.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_nvm.o
  CC      arch/x86/kernel/vsmp_64.o
  AR      drivers/i2c/busses/built-in.a
  AR      net/mptcp/built-in.a
  CC [M]  drivers/net/ethernet/intel/igc/igc_phy.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_diag.o
  CC      drivers/acpi/processor_driver.o
  CC      net/devres.o
  CC      drivers/usb/host/ehci-pci.o
  CC      drivers/usb/storage/scsiglue.o
  CC      drivers/usb/serial/usb-serial.o
  CC      drivers/usb/dwc2/hcd_queue.o
  CC [M]  drivers/net/phy/realtek.o
  CC [M]  drivers/net/phy/smsc.o
  CC [M]  fs/lockd/trace.o
  CC [M]  net/sunrpc/socklib.o
  CC [M]  net/bridge/br_stp.o
  CC [M]  fs/lockd/xdr.o
  CC      fs/btrfs/ioctl.o
  CC      drivers/input/vivaldi-fmap.o
  CC      drivers/usb/host/ehci-platform.o
  CC      drivers/usb/core/config.o
  CC [M]  drivers/scsi/raid_class.o
  AR      drivers/i2c/muxes/built-in.a
  CC      drivers/usb/core/file.o
  CC [M]  fs/nfs/unlink.o
  CC      drivers/i2c/i2c-boardinfo.o
  CC [M]  sound/soc/soc-ops.o
  CC [M]  arch/x86/kvm/vmx/posted_intr.o
  CC [M]  net/netfilter/nft_objref.o
  CC [M]  fs/overlayfs/export.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/ga100.o
  CC      net/ipv4/xfrm4_input.o
  CC      kernel/kexec.o
  CC      net/ipv4/xfrm4_output.o
  CC [M]  drivers/gpu/drm/i915/soc/intel_pch.o
  CC [M]  arch/x86/kernel/msr.o
  CC      drivers/input/mousedev.o
  CC      lib/bitmap-str.o
  CC [M]  fs/lockd/procfs.o
  CC      drivers/acpi/processor_thermal.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_i210.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_ethtool.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_ptp.o
  CC [M]  arch/x86/kernel/cpuid.o
  CC [M]  drivers/gpu/drm/radeon/dce3_1_afmt.o
  CC [M]  sound/soc/soc-link.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vf_error.o
  CC      drivers/rtc/rtc-cmos.o
  CC      drivers/usb/core/buffer.o
  CC [M]  fs/smb/client/inode.o
  CC [M]  fs/overlayfs/params.o
  CC [M]  net/sunrpc/xprtsock.o
  CC      drivers/usb/storage/protocol.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_hwmon.o
  CC      drivers/usb/dwc2/hcd_ddma.o
  CC      drivers/i2c/i2c-core-base.o
  AR      drivers/net/ethernet/litex/built-in.a
  LD [M]  fs/lockd/lockd.o
  CC      kernel/kexec_file.o
  AR      drivers/net/ethernet/marvell/octeon_ep/built-in.a
  CC [M]  drivers/net/ethernet/intel/e1000e/ptp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/ga102.o
  CC      drivers/usb/serial/generic.o
  AR      drivers/net/ethernet/marvell/octeon_ep_vf/built-in.a
  CC [M]  net/sunrpc/sched.o
  CC [M]  fs/overlayfs/xattrs.o
  AR      drivers/net/ethernet/mellanox/built-in.a
  CC      drivers/i2c/i2c-core-smbus.o
  CC [M]  fs/smb/client/link.o
  AR      drivers/net/ethernet/marvell/octeontx2/built-in.a
  CC      drivers/acpi/processor_idle.o
  AR      drivers/net/ethernet/micrel/built-in.a
  CC      drivers/input/evdev.o
  CC [M]  net/netfilter/nft_inner.o
  CC [M]  net/sunrpc/auth.o
  CC [M]  net/bridge/br_stp_bpdu.o
  AR      drivers/net/ethernet/marvell/prestera/built-in.a
  CC [M]  net/bridge/br_stp_if.o
  AR      drivers/net/ethernet/marvell/built-in.a
  AR      arch/x86/kernel/built-in.a
  CC [M]  drivers/scsi/scsi_transport_sas.o
  AR      drivers/net/ethernet/mscc/built-in.a
  CC      drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.o
  AR      drivers/net/ethernet/myricom/built-in.a
  CC [M]  arch/x86/kvm/vmx/sgx.o
  AR      drivers/net/ethernet/natsemi/built-in.a
  CC [M]  drivers/gpu/drm/i915/i915_memcpy.o
  CC [M]  arch/x86/kvm/vmx/hyperv.o
  CC      drivers/usb/core/sysfs.o
  CC      lib/string_helpers.o
  CC [M]  drivers/scsi/ses.o
  CC      drivers/usb/core/endpoint.o
  CC      net/socket.o
  CC [M]  fs/nfs/write.o
  CC [M]  arch/x86/kvm/vmx/hyperv_evmcs.o
  CC [M]  drivers/gpu/drm/xe/xe_heci_gsc.o
  CC      net/ipv6/seg6_local.o
  CC      lib/hexdump.o
  CC      drivers/acpi/processor_throttling.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_sched.o
  LD [M]  drivers/net/phy/libphy.o
  CC [M]  drivers/gpu/drm/radeon/evergreen.o
  AR      drivers/net/phy/built-in.a
  AR      drivers/rtc/built-in.a
  MKREG   drivers/gpu/drm/radeon/evergreen_reg_safe.h
  MKREG   drivers/gpu/drm/radeon/cayman_reg_safe.h
  CC [M]  drivers/gpu/drm/radeon/evergreen_hdmi.o
  AR      drivers/media/i2c/built-in.a
  CC [M]  drivers/media/i2c/ov13858.o
  CC [M]  drivers/gpu/drm/i915/i915_mm.o
  AR      drivers/media/tuners/built-in.a
  CC [M]  drivers/media/tuners/mc44s803.o
  AR      drivers/media/rc/keymaps/built-in.a
  LD [M]  fs/overlayfs/overlay.o
  CC [M]  net/sunrpc/auth_null.o
  CC [M]  drivers/media/rc/rc-main.o
  CC [M]  sound/soc/soc-card.o
  LD [M]  arch/x86/kvm/kvm.o
  CC      drivers/usb/storage/transport.o
  AR      drivers/pps/clients/built-in.a
  AR      drivers/pps/generators/built-in.a
  CC      drivers/pps/pps.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.o
  CC      drivers/usb/dwc2/debugfs.o
  CC      drivers/usb/storage/usb.o
  LD [M]  drivers/net/ethernet/intel/igb/igb.o
  CC [M]  drivers/net/ethernet/intel/igbvf/vf.o
  CC      kernel/compat.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_ptp.o
  CC      net/ipv4/xfrm4_protocol.o
  LD [M]  drivers/net/ethernet/intel/e1000e/e1000e.o
  CC [M]  drivers/input/sparse-keymap.o
  CC      drivers/usb/storage/initializers.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_main.o
  CC [M]  net/netfilter/nft_chain_route.o
  CC      drivers/usb/storage/sierra_ms.o
  CC      drivers/usb/core/devio.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.o
  CC      drivers/usb/serial/bus.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_common.o
  CC [M]  net/bridge/br_stp_timer.o
  CC [M]  net/netfilter/nf_tables_offload.o
  AR      drivers/usb/misc/built-in.a
  CC [M]  sound/soc/soc-topology.o
  CC      drivers/acpi/processor_perflib.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.o
  UPD     arch/x86/kvm/kvm-asm-offsets.h
  AS [M]  arch/x86/kvm/vmx/vmenter.o
  CC      drivers/usb/early/ehci-dbgp.o
  LD [M]  arch/x86/kvm/kvm-intel.o
  CC      fs/btrfs/locking.o
  CC      lib/kstrtox.o
  CC [M]  drivers/media/i2c/ov13b10.o
  AR      arch/x86/built-in.a
  CC      drivers/pps/kapi.o
  CC      fs/btrfs/orphan.o
  CC [M]  drivers/gpu/drm/i915/i915_sw_fence.o
  AR      drivers/usb/dwc2/built-in.a
  CC      drivers/net/ethernet/microchip/vcap/vcap_api.o
  CC      drivers/usb/storage/option_ms.o
  CC [M]  drivers/media/tuners/mt20xx.o
  CC [M]  net/bridge/br_netlink.o
  CC [M]  drivers/media/rc/rc-ir-raw.o
  CC      drivers/usb/host/ohci-hcd.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.o
  CC [M]  sound/soc/soc-compress.o
  CC      drivers/usb/serial/console.o
  CC [M]  drivers/net/ethernet/intel/igbvf/mbx.o
  CC      kernel/utsname.o
  CC      drivers/scsi/scsi_sysfs.o
  CC [M]  fs/nfs/namespace.o
  CC [M]  net/sunrpc/auth_tls.o
  CC [M]  net/sunrpc/auth_unix.o
  CC [M]  drivers/input/input-leds.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_fence.o
  CC [M]  fs/smb/client/misc.o
  CC      lib/debug_info.o
  CC      drivers/i2c/i2c-core-acpi.o
  CC      net/ipv6/seg6_hmac.o
  CC      drivers/pps/sysfs.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_dump.o
  CC [M]  drivers/gpu/drm/xe/xe_huc.o
  CC      fs/btrfs/export.o
  CC [M]  fs/nfs/mount_clnt.o
  CC      drivers/i2c/i2c-dev.o
  CC      drivers/ptp/ptp_clock.o
  CC      drivers/usb/gadget/udc/core.o
  AR      drivers/usb/gadget/function/built-in.a
  CC [M]  net/netfilter/nft_set_hash.o
  CC      drivers/usb/storage/usual-tables.o
  CC [M]  net/netfilter/nft_set_bitmap.o
  CC      kernel/user_namespace.o
  CC [M]  net/netfilter/nft_set_rbtree.o
  CC      drivers/usb/gadget/udc/trace.o
  CC      drivers/usb/serial/ftdi_sio.o
  CC      drivers/acpi/container.o
  CC [M]  drivers/net/ethernet/intel/igbvf/ethtool.o
  CC [M]  drivers/gpu/drm/i915/i915_sw_fence_work.o
  CC [M]  net/bridge/br_netlink_tunnel.o
  CC [M]  net/bridge/br_arp_nd_proxy.o
  CC [M]  drivers/input/joydev.o
  CC      drivers/usb/early/xhci-dbc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.o
  CC [M]  drivers/gpu/drm/radeon/radeon_trace_points.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.o
  CC      net/ipv4/bpf_tcp_ca.o
  AR      drivers/pps/built-in.a
  CC      drivers/usb/core/notify.o
  CC      drivers/usb/core/generic.o
  LD [M]  sound/soc/snd-soc-acpi.o
  CC [M]  drivers/media/rc/lirc_dev.o
  CC [M]  drivers/gpu/drm/i915/i915_syncmap.o
  AR      drivers/usb/storage/built-in.a
  LD [M]  sound/soc/snd-soc-core.o
  CC      net/compat.o
  CC      fs/file_table.o
  CC [M]  drivers/gpu/drm/xe/xe_huc_debugfs.o
  CC      fs/super.o
  CC      drivers/usb/roles/class.o
  CC      net/sysctl_net.o
  CC [M]  fs/nfs/nfstrace.o
  CC [M]  drivers/net/ethernet/intel/igbvf/netdev.o
  CC      drivers/acpi/thermal_lib.o
  CC      lib/iomap.o
  CC [M]  drivers/usb/class/usbtmc.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_tsn.o
  CC      drivers/ptp/ptp_chardev.o
  CC      drivers/usb/host/ohci-pci.o
  CC [M]  drivers/media/tuners/tuner-simple.o
  CC      lib/iomap_copy.o
  CC [M]  net/bridge/br_sysfs_if.o
  CC      fs/btrfs/tree-log.o
  CC [M]  net/netfilter/nft_set_pipapo.o
  AR      drivers/usb/early/built-in.a
  CC      drivers/usb/core/quirks.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm20b.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.o
  AR      drivers/input/built-in.a
  CC [M]  drivers/i2c/i2c-smbus.o
  CC [M]  drivers/i2c/i2c-mux.o
  CC      drivers/usb/serial/pl2303.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.o
  CC      fs/btrfs/free-space-cache.o
  CC      net/ipv6/ioam6_iptunnel.o
  CC      net/ipv6/addrconf_core.o
  AR      drivers/scsi/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_irq.o
  CC      net/ipv6/exthdrs_core.o
  CC [M]  drivers/gpu/drm/drm_client.o
  CC [M]  fs/smb/client/netmisc.o
  CC      lib/devres.o
  CC      lib/check_signature.o
  CC      drivers/usb/host/ohci-platform.o
  CC [M]  drivers/gpu/drm/radeon/ni.o
  AR      net/ipv4/built-in.a
  CC [M]  drivers/net/ethernet/intel/ixgbevf/vf.o
  CC      kernel/pid_namespace.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/mbx.o
  CC [M]  drivers/gpu/drm/i915/i915_user_extensions.o
  AR      drivers/usb/roles/built-in.a
  CC      fs/char_dev.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_main.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_ethtool.o
  AR      drivers/usb/gadget/udc/built-in.a
  AR      drivers/net/ethernet/intel/built-in.a
  CC      drivers/ptp/ptp_sysfs.o
  CC      drivers/ptp/ptp_vclock.o
  AR      drivers/usb/gadget/legacy/built-in.a
  CC      drivers/net/ethernet/microchip/vcap/vcap_tc.o
  CC      drivers/usb/gadget/usbstring.o
  CC      drivers/acpi/thermal.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_xdp.o
  CC      drivers/usb/core/devices.o
  CC [M]  drivers/net/ethernet/intel/e100.o
  AR      drivers/media/rc/built-in.a
  LD [M]  drivers/media/rc/rc-core.o
  CC      drivers/acpi/acpi_memhotplug.o
  AR      drivers/media/common/b2c2/built-in.a
  AR      drivers/media/platform/allegro-dvt/built-in.a
  AR      drivers/media/common/saa7146/built-in.a
  CC [M]  net/sunrpc/svc.o
  AR      drivers/media/common/siano/built-in.a
  AR      drivers/media/platform/amlogic/meson-ge2d/built-in.a
  AR      drivers/media/platform/amlogic/built-in.a
  CC [M]  drivers/usb/typec/ucsi/ucsi.o
  AR      drivers/media/common/v4l2-tpg/built-in.a
  AR      drivers/media/common/videobuf2/built-in.a
  CC [M]  net/bridge/br_sysfs_br.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp108.o
  AR      drivers/media/platform/amphion/built-in.a
  CC [M]  drivers/gpu/drm/i915/i915_ioc32.o
  AR      drivers/media/common/built-in.a
  AR      drivers/media/platform/aspeed/built-in.a
  CC      fs/btrfs/zlib.o
  CC [M]  fs/smb/client/smbencrypt.o
  AR      drivers/media/platform/atmel/built-in.a
  CC      fs/btrfs/lzo.o
  AR      drivers/media/platform/cadence/built-in.a
  AR      drivers/usb/serial/built-in.a
  CC [M]  drivers/gpu/drm/drm_client_modeset.o
  AR      drivers/media/platform/chips-media/coda/built-in.a
  AR      drivers/media/platform/chips-media/wave5/built-in.a
  AR      drivers/media/platform/chips-media/built-in.a
  CC      drivers/usb/host/uhci-hcd.o
  AR      drivers/media/platform/intel/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_lrc.o
  CC [M]  drivers/gpu/drm/xe/xe_migrate.o
  AR      drivers/media/platform/marvell/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_mmio.o
  LD [M]  drivers/net/ethernet/intel/igbvf/igbvf.o
  CC [M]  drivers/gpu/drm/xe/xe_mocs.o
  AR      drivers/media/platform/mediatek/jpeg/built-in.a
  CC      lib/interval_tree.o
  AR      drivers/media/platform/mediatek/mdp/built-in.a
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_adminq.o
  CC      lib/assoc_array.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_common.o
  CC [M]  drivers/media/tuners/tuner-types.o
  AR      drivers/media/platform/mediatek/vcodec/common/built-in.a
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_hmc.o
  AR      drivers/i2c/built-in.a
  UPD     kernel/config_data
  CC      drivers/usb/gadget/config.o
  AR      drivers/media/platform/mediatek/vcodec/encoder/built-in.a
  CC      drivers/usb/core/phy.o
  CC      drivers/acpi/ioapic.o
  CC [M]  net/netfilter/nft_set_pipapo_avx2.o
  AR      drivers/media/platform/mediatek/vcodec/decoder/built-in.a
  CC      drivers/power/reset/restart-poweroff.o
  CC      drivers/acpi/battery.o
  AR      drivers/media/platform/mediatek/vcodec/built-in.a
  CC [M]  drivers/net/ethernet/intel/ixgbevf/ethtool.o
  CC      drivers/usb/gadget/epautoconf.o
  AR      drivers/media/platform/mediatek/vpu/built-in.a
  CC [M]  net/netfilter/nft_compat.o
  AR      drivers/media/platform/mediatek/mdp3/built-in.a
  AR      drivers/media/platform/mediatek/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gv100.o
  LD [M]  drivers/net/ethernet/intel/igc/igc.o
  AR      drivers/media/platform/microchip/built-in.a
  CC      fs/stat.o
  CC      drivers/usb/gadget/composite.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.o
  AR      drivers/ptp/built-in.a
  CC      drivers/usb/gadget/functions.o
  AR      drivers/media/platform/nuvoton/built-in.a
  CC      fs/exec.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.o
  AR      drivers/media/platform/nvidia/tegra-vde/built-in.a
  CC [M]  fs/nfs/export.o
  AR      drivers/media/platform/nvidia/built-in.a
  CC [M]  drivers/gpu/drm/radeon/atombios_encoders.o
  CC [M]  drivers/gpu/drm/radeon/radeon_semaphore.o
  CC      kernel/stop_machine.o
  AR      drivers/media/platform/nxp/dw100/built-in.a
  CC      net/ipv6/ip6_checksum.o
  AR      drivers/media/platform/nxp/imx-jpeg/built-in.a
  AR      drivers/media/platform/nxp/imx8-isi/built-in.a
  AR      drivers/media/platform/nxp/built-in.a
  CC [M]  drivers/gpu/drm/i915/i915_debugfs.o
  AR      drivers/media/platform/qcom/camss/built-in.a
  AR      drivers/media/platform/qcom/venus/built-in.a
  AR      drivers/media/platform/qcom/built-in.a
  AR      drivers/media/platform/renesas/rcar-vin/built-in.a
  AR      drivers/media/platform/renesas/rzg2l-cru/built-in.a
  AR      drivers/power/reset/built-in.a
  AR      drivers/media/platform/renesas/vsp1/built-in.a
  CC      drivers/power/supply/power_supply_core.o
  CC [M]  net/bridge/br_nf_core.o
  AR      drivers/media/platform/renesas/built-in.a
  CC [M]  fs/smb/client/transport.o
  CC [M]  fs/smb/client/cached_dir.o
  CC      lib/list_debug.o
  AR      drivers/media/platform/rockchip/rga/built-in.a
  CC      drivers/power/supply/power_supply_sysfs.o
  AR      drivers/media/platform/rockchip/rkisp1/built-in.a
  AR      drivers/media/platform/rockchip/built-in.a
  CC      drivers/power/supply/power_supply_leds.o
  AR      drivers/media/platform/samsung/exynos-gsc/built-in.a
  CC      drivers/power/supply/power_supply_hwmon.o
  AR      drivers/media/platform/samsung/exynos4-is/built-in.a
  CC [M]  drivers/usb/typec/ucsi/debugfs.o
  CC      drivers/power/supply/samsung-sdi-battery.o
  AR      drivers/media/platform/samsung/s3c-camif/built-in.a
  AR      drivers/media/platform/samsung/s5p-g2d/built-in.a
  AR      drivers/media/platform/samsung/s5p-jpeg/built-in.a
  CC      drivers/power/supply/charger-manager.o
  AR      drivers/net/ethernet/microchip/vcap/built-in.a
  AR      drivers/media/platform/samsung/s5p-mfc/built-in.a
  AR      drivers/media/platform/samsung/built-in.a
  AR      drivers/net/ethernet/microchip/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp10b.o
  CC [M]  drivers/media/tuners/tda18271-maps.o
  CC      fs/btrfs/zstd.o
  CC      lib/debugobjects.o
  CC      kernel/audit.o
  CC      drivers/usb/gadget/configfs.o
  AR      drivers/media/platform/st/sti/bdisp/built-in.a
  CC [M]  net/sunrpc/svcsock.o
  AR      drivers/media/platform/st/sti/c8sectpfe/built-in.a
  CC [M]  net/sunrpc/svcauth.o
  CC      drivers/usb/core/port.o
  CC [M]  drivers/usb/typec/ucsi/trace.o
  AR      drivers/media/platform/st/sti/delta/built-in.a
  CC [M]  drivers/usb/typec/ucsi/psy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.o
  AR      drivers/net/ethernet/neterion/built-in.a
  CC      fs/btrfs/compression.o
  CC      fs/pipe.o
  AR      drivers/media/platform/st/sti/hva/built-in.a
  CC      fs/namei.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_82599.o
  AR      drivers/media/platform/st/stm32/built-in.a
  CC      fs/fcntl.o
  CC      lib/bitrev.o
  AR      drivers/media/platform/st/built-in.a
  CC      drivers/usb/host/xhci.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.o
  AR      drivers/media/platform/sunxi/sun4i-csi/built-in.a
  AR      drivers/media/platform/sunxi/sun6i-csi/built-in.a
  CC      net/ipv6/ip6_icmp.o
  AR      drivers/media/platform/sunxi/sun6i-mipi-csi2/built-in.a
  CC [M]  net/bridge/br_multicast.o
  AR      drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/built-in.a
  AR      drivers/media/platform/sunxi/sun8i-di/built-in.a
  CC [M]  drivers/media/tuners/tda18271-common.o
  CC [M]  net/netfilter/nft_nat.o
  CC      drivers/acpi/hed.o
  CC      drivers/hwmon/hwmon.o
  AR      drivers/media/platform/sunxi/sun8i-rotate/built-in.a
  AR      drivers/media/platform/sunxi/built-in.a
  CC [M]  drivers/hwmon/acpi_power_meter.o
  CC [M]  drivers/gpu/drm/i915/i915_debugfs_params.o
  CC [M]  drivers/hwmon/coretemp.o
  CC      fs/btrfs/delayed-ref.o
  AR      drivers/media/platform/ti/am437x/built-in.a
  AR      drivers/media/platform/verisilicon/built-in.a
  CC      drivers/usb/gadget/u_f.o
  AR      drivers/media/platform/ti/cal/built-in.a
  CC [M]  drivers/gpu/drm/radeon/radeon_sa.o
  CC [M]  drivers/usb/typec/ucsi/ucsi_acpi.o
  CC      kernel/auditfilter.o
  AR      drivers/media/platform/via/built-in.a
  CC      fs/btrfs/relocation.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/tu102.o
  CC      fs/btrfs/delayed-inode.o
  AR      drivers/media/platform/ti/vpe/built-in.a
  AR      drivers/media/platform/ti/davinci/built-in.a
  AR      drivers/media/platform/ti/j721e-csi2rx/built-in.a
  AR      drivers/media/platform/ti/omap/built-in.a
  CC [M]  drivers/media/tuners/tda18271-fe.o
  AR      drivers/media/platform/ti/omap3isp/built-in.a
  AR      drivers/media/platform/ti/built-in.a
  CC      net/ipv6/output_core.o
  AR      drivers/thermal/broadcom/built-in.a
  AR      drivers/media/platform/xilinx/built-in.a
  AR      drivers/thermal/samsung/built-in.a
  AR      drivers/power/supply/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_csa.o
  AR      drivers/media/platform/built-in.a
  AR      drivers/power/built-in.a
  CC [M]  drivers/thermal/intel/int340x_thermal/int3400_thermal.o
  CC      drivers/thermal/intel/intel_tcc.o
  CC [M]  drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.o
  CC      drivers/thermal/intel/therm_throt.o
  CC [M]  drivers/thermal/intel/int340x_thermal/int3402_thermal.o
  CC      drivers/usb/core/hcd-pci.o
  CC      lib/linear_ranges.o
  CC [M]  drivers/gpu/drm/xe/xe_module.o
  AR      drivers/media/pci/ttpci/built-in.a
  AR      drivers/media/pci/b2c2/built-in.a
  CC      drivers/usb/core/usb-acpi.o
  AR      drivers/media/pci/pluto2/built-in.a
  CC      fs/ioctl.o
  AR      drivers/media/pci/dm1105/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_pat.o
  AR      drivers/media/pci/pt1/built-in.a
  CC      net/ipv6/protocol.o
  AR      drivers/media/pci/pt3/built-in.a
  CC      net/ipv6/ip6_offload.o
  AR      drivers/thermal/st/built-in.a
  CC      drivers/acpi/bgrt.o
  CC      net/ipv6/tcpv6_offload.o
  CC [M]  drivers/media/tuners/tda827x.o
  AR      drivers/media/pci/mantis/built-in.a
  LD [M]  drivers/usb/typec/ucsi/typec_ucsi.o
  CC [M]  fs/nfs/sysfs.o
  AR      drivers/media/pci/ngene/built-in.a
  CC [M]  drivers/usb/typec/class.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_82598.o
  CC [M]  fs/smb/client/cifs_unicode.o
  CC [M]  fs/smb/client/nterr.o
  AR      drivers/media/pci/ddbridge/built-in.a
  CC [M]  fs/smb/client/cifsencrypt.o
  AR      drivers/media/pci/saa7146/built-in.a
  CC [M]  drivers/gpu/drm/i915/i915_pmu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga100.o
  CC [M]  drivers/gpu/drm/i915/gt/gen2_engine_cs.o
  AR      drivers/media/pci/smipcie/built-in.a
  CC [M]  drivers/gpu/drm/radeon/atombios_i2c.o
  CC [M]  drivers/gpu/drm/i915/gt/gen6_engine_cs.o
  AR      drivers/media/pci/netup_unidvb/built-in.a
  AR      drivers/usb/gadget/built-in.a
  CC [M]  net/netfilter/nft_chain_nat.o
  CC [M]  drivers/gpu/drm/i915/gt/gen6_ppgtt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o
  AR      drivers/media/pci/intel/ipu3/built-in.a
  CC      lib/packing.o
  AR      drivers/media/pci/intel/ivsc/built-in.a
  AR      drivers/thermal/tegra/built-in.a
  AR      drivers/thermal/qcom/built-in.a
  AR      drivers/media/pci/intel/built-in.a
  AR      drivers/net/ethernet/netronome/built-in.a
  CC      kernel/auditsc.o
  AR      drivers/media/pci/built-in.a
  CC      net/ipv6/exthdrs_offload.o
  CC [M]  net/bridge/br_mdb.o
  CC [M]  drivers/usb/typec/mux.o
  CC [M]  net/bridge/br_multicast_eht.o
  CC      net/ipv6/inet6_hashtables.o
  CC [M]  drivers/usb/typec/bus.o
  CC [M]  drivers/thermal/intel/int340x_thermal/int3403_thermal.o
  CC      drivers/acpi/cppc_acpi.o
  CC [M]  drivers/thermal/intel/int340x_thermal/processor_thermal_device.o
  CC [M]  drivers/media/tuners/tda8290.o
  CC      kernel/audit_watch.o
  AR      drivers/hwmon/built-in.a
  CC      drivers/usb/host/xhci-mem.o
  CC [M]  drivers/thermal/intel/int340x_thermal/int3401_thermal.o
  CC      fs/readdir.o
  CC      kernel/audit_fsnotify.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.o
  AR      drivers/usb/core/built-in.a
  CC [M]  drivers/gpu/drm/radeon/si.o
  CC [M]  drivers/gpu/drm/xe/xe_pci.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/base.o
  CC [M]  drivers/media/tuners/tda9887.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/nv50.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_phy.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.o
  CC [M]  drivers/media/tuners/tea5761.o
  CC      lib/crc-ccitt.o
  CC [M]  drivers/usb/typec/pd.o
  AR      drivers/net/ethernet/ni/built-in.a
  LD [M]  drivers/net/ethernet/intel/ixgbevf/ixgbevf.o
  CC      drivers/usb/host/xhci-ext-caps.o
  CC      fs/select.o
  CC      drivers/usb/host/xhci-ring.o
  AR      drivers/media/usb/b2c2/built-in.a
  CC      drivers/usb/host/xhci-hub.o
  CC [M]  drivers/gpu/drm/i915/gt/gen7_renderclear.o
  AR      drivers/media/usb/dvb-usb/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.o
  AR      drivers/media/usb/dvb-usb-v2/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.o
  AR      drivers/media/usb/s2255/built-in.a
  CC [M]  net/netfilter/x_tables.o
  AR      drivers/media/usb/ttusb-budget/built-in.a
  AR      drivers/media/usb/siano/built-in.a
  AR      drivers/media/usb/ttusb-dec/built-in.a
  CC [M]  drivers/gpu/drm/i915/gt/gen8_engine_cs.o
  CC      drivers/thermal/intel/intel_hfi.o
  AR      drivers/media/usb/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_pcode.o
  CC      lib/crc16.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_mbx.o
  CC [M]  drivers/gpu/drm/radeon/radeon_prime.o
  CC      net/ipv6/mcast_snoop.o
  CC [M]  drivers/thermal/intel/int340x_thermal/processor_thermal_device_pci_legacy.o
  CC [M]  fs/smb/client/readdir.o
  CC [M]  net/sunrpc/svcauth_unix.o
  CC [M]  drivers/thermal/intel/int340x_thermal/processor_thermal_device_pci.o
  CC [M]  fs/nfs/fs_context.o
  CC [M]  net/sunrpc/addr.o
  CC      kernel/audit_tree.o
  CC      fs/btrfs/scrub.o
  CC [M]  drivers/thermal/intel/int340x_thermal/processor_thermal_rapl.o
  CC [M]  net/sunrpc/rpcb_clnt.o
  CC      drivers/usb/host/xhci-dbg.o
  CC [M]  net/bridge/br_switchdev.o
  CC      drivers/acpi/spcr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/g84.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.o
  CC [M]  drivers/media/tuners/tea5767.o
  CC      lib/crc-t10dif.o
  CC [M]  drivers/media/tuners/xc2028.o
  CC [M]  drivers/media/tuners/xc4000.o
  CC [M]  drivers/thermal/intel/intel_powerclamp.o
  CC [M]  drivers/usb/typec/retimer.o
  CC [M]  drivers/media/tuners/xc5000.o
  CC [M]  drivers/usb/typec/port-mapper.o
  AR      drivers/net/ethernet/nvidia/built-in.a
  CC      fs/btrfs/backref.o
  CC      drivers/watchdog/watchdog_core.o
  AR      drivers/thermal/mediatek/built-in.a
  CC      drivers/thermal/thermal_core.o
  CC [M]  drivers/thermal/intel/int340x_thermal/processor_thermal_rfim.o
  CC [M]  drivers/thermal/intel/int340x_thermal/processor_thermal_mbox.o
  CC [M]  drivers/gpu/drm/xe/xe_pm.o
  CC      fs/dcache.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/gk20a.o
  HOSTCC  lib/gen_crc32table
  CC      fs/btrfs/ulist.o
  CC [M]  drivers/thermal/intel/int340x_thermal/processor_thermal_wt_req.o
  CC [M]  fs/nfs/sysctl.o
  CC      drivers/acpi/acpi_dbg.o
  CC [M]  drivers/gpu/drm/i915/gt/gen8_ppgtt.o
  CC      drivers/net/ppp/ppp_generic.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_x540.o
  HOSTCC  lib/gen_crc64table
  CC [M]  drivers/thermal/intel/int340x_thermal/processor_thermal_wt_hint.o
  CC [M]  drivers/thermal/intel/int340x_thermal/processor_thermal_power_floor.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/gm107.o
  CC      kernel/kprobes.o
  CC      kernel/hung_task.o
  CC [M]  drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_lan_hmc.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_breadcrumbs.o
  CC      kernel/watchdog.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_x550.o
  CC      lib/libcrc32c.o
  CC      lib/crc64-rocksoft.o
  CC      drivers/net/slip/slhc.o
  AR      drivers/net/ethernet/oki-semi/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.o
  CC      fs/inode.o
  CC      lib/xxhash.o
  CC [M]  net/bridge/br_mrp_switchdev.o
  CC [M]  fs/smb/client/ioctl.o
  AR      net/ipv6/built-in.a
  AR      drivers/net/wan/framer/built-in.a
  LD [M]  drivers/usb/typec/typec.o
  AR      drivers/net/wan/built-in.a
  AR      drivers/net/ethernet/packetengines/built-in.a
  CC [M]  fs/smb/client/sess.o
  CC      drivers/md/md.o
  AR      drivers/accessibility/braille/built-in.a
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_nvm.o
  AR      drivers/accessibility/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_preempt_fence.o
  CC      drivers/watchdog/watchdog_dev.o
  CC      drivers/watchdog/watchdog_pretimeout.o
  CC      drivers/acpi/viot.o
  CC [M]  net/netfilter/xt_tcpudp.o
  CC [M]  net/netfilter/xt_nat.o
  CC      fs/attr.o
  CC      fs/bad_inode.o
  CC [M]  net/netfilter/xt_MASQUERADE.o
  CC [M]  net/bridge/br_mrp.o
  CC [M]  drivers/gpu/drm/radeon/cik.o
  CC      kernel/watchdog_perf.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/gm20b.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_lib.o
  CC      kernel/seccomp.o
  CC      kernel/relay.o
  CC      drivers/watchdog/pretimeout_noop.o
  CC [M]  drivers/thermal/intel/x86_pkg_temp_thermal.o
  CC [M]  drivers/thermal/intel/intel_soc_dts_iosf.o
  CC      drivers/watchdog/softdog.o
  CC [M]  drivers/gpu/drm/xe/xe_pt.o
  AR      drivers/net/wireless/admtek/built-in.a
  AR      drivers/net/wireless/ath/built-in.a
  CC      lib/genalloc.o
  LD [M]  fs/nfs/nfs.o
  CC      lib/percpu_counter.o
  CC      drivers/usb/host/xhci-trace.o
  AR      drivers/net/wireless/atmel/built-in.a
  CC [M]  drivers/acpi/acpi_ipmi.o
  CC      drivers/thermal/thermal_sysfs.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_ptp.o
  AR      drivers/net/wireless/broadcom/built-in.a
  CC [M]  net/sunrpc/timer.o
  AR      drivers/net/wireless/intel/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.o
  CC      drivers/usb/host/xhci-dbgcap.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_context.o
  LD [M]  drivers/media/tuners/tda18271.o
  AR      drivers/net/wireless/intersil/built-in.a
  CC [M]  drivers/gpu/drm/i915/gt/intel_context_sseu.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_xsk.o
  AR      drivers/media/mmc/siano/built-in.a
  AR      drivers/net/wireless/marvell/built-in.a
  CC [M]  net/sunrpc/xdr.o
  AR      drivers/media/mmc/built-in.a
  AR      drivers/net/wireless/mediatek/built-in.a
  CC [M]  net/sunrpc/sunrpc_syms.o
  AR      drivers/media/firewire/built-in.a
  AR      drivers/net/wireless/microchip/built-in.a
  CC      drivers/thermal/thermal_trip.o
  CC      fs/btrfs/qgroup.o
  AR      drivers/media/spi/built-in.a
  AR      drivers/net/wireless/purelifi/built-in.a
  AR      drivers/media/test-drivers/built-in.a
  CC      drivers/thermal/thermal_helpers.o
  AR      drivers/net/wireless/quantenna/built-in.a
  AR      drivers/net/wireless/ralink/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/tu102.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_debugfs.o
  CC      kernel/utsname_sysctl.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.o
  CC [M]  drivers/media/v4l2-core/v4l2-async.o
  CC [M]  drivers/thermal/intel/intel_pch_thermal.o
  AR      drivers/net/wireless/realtek/built-in.a
  CC [M]  drivers/media/mc/mc-device.o
  CC [M]  drivers/media/mc/mc-devnode.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb.o
  AR      drivers/net/wireless/rsi/built-in.a
  CC      drivers/thermal/thermal_netlink.o
  AR      drivers/net/wireless/silabs/built-in.a
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb_82598.o
  CC [M]  net/netfilter/xt_addrtype.o
  AR      drivers/net/wireless/st/built-in.a
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb_82599.o
  AR      drivers/net/wireless/ti/built-in.a
  AR      drivers/watchdog/built-in.a
  CC [M]  fs/smb/client/export.o
  CC [M]  fs/smb/client/unc.o
  AR      drivers/net/wireless/zydas/built-in.a
  AR      drivers/net/wireless/virtual/built-in.a
  AR      drivers/net/wireless/built-in.a
  CC [M]  fs/smb/client/winucase.o
  CC      fs/file.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_engine_cs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.o
  CC [M]  fs/smb/client/smb2ops.o
  CC      fs/filesystems.o
  CC [M]  drivers/acpi/acpi_video.o
  CC      kernel/delayacct.o
  CC      drivers/md/md-bitmap.o
  CC      drivers/md/md-autodetect.o
  AR      drivers/net/slip/built-in.a
  CC [M]  net/bridge/br_mrp_netlink.o
  CC      drivers/thermal/thermal_hwmon.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_umc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.o
  CC      drivers/md/dm-init.o
  CC      drivers/md/dm-uevent.o
  CC      lib/iommu-helper.o
  CC      drivers/thermal/gov_fair_share.o
  CC [M]  drivers/media/mc/mc-entity.o
  AR      drivers/thermal/intel/built-in.a
  AR      drivers/net/ppp/built-in.a
  CC      drivers/md/dm-zone.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb_nl.o
  CC [M]  net/sunrpc/cache.o
  CC [M]  net/sunrpc/rpc_pipe.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_rap.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/bit.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/boost.o
  CC      kernel/taskstats.o
  CC      kernel/tsacct.o
  CC      lib/fault-inject.o
  CC      drivers/thermal/gov_bang_bang.o
  CC [M]  net/netfilter/xt_conntrack.o
  CC      fs/namespace.o
  CC [M]  drivers/media/mc/mc-request.o
  CC [M]  drivers/gpu/drm/xe/xe_pt_walk.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_sysfs.o
  CC      kernel/tracepoint.o
  CC [M]  drivers/gpu/drm/xe/xe_query.o
  CC [M]  fs/smb/client/smb2maperror.o
  CC [M]  net/sunrpc/sysfs.o
  CC [M]  drivers/media/v4l2-core/v4l2-fwnode.o
  CC [M]  net/sunrpc/svc_xprt.o
  CC      drivers/thermal/gov_step_wise.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.o
  CC      drivers/usb/host/xhci-dbgtty.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.o
  CC      drivers/usb/host/xhci-debugfs.o
  CC [M]  fs/smb/client/smb2transport.o
  CC      kernel/irq_work.o
  CC [M]  net/bridge/br_cfm.o
  AR      drivers/isdn/hardware/built-in.a
  AR      drivers/isdn/built-in.a
  CC      drivers/thermal/gov_user_space.o
  CC [M]  drivers/gpu/drm/xe/xe_range_fence.o
  CC [M]  net/sunrpc/xprtmultipath.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/conn.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_sr.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_whitelist.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_diag.o
  CC [M]  net/bridge/br_cfm_netlink.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_txrx.o
  CC [M]  drivers/gpu/drm/drm_color_mgmt.o
  CC [M]  drivers/media/v4l2-core/v4l2-dv-timings.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_debugfs.o
  CC      lib/error-inject.o
  CC      kernel/static_call.o
  CC      drivers/md/dm-ima.o
  AR      drivers/net/ethernet/qlogic/built-in.a
  CC [M]  drivers/media/mc/mc-dev-allocator.o
  CC [M]  drivers/gpu/drm/xe/xe_rtp.o
  CC [M]  drivers/gpu/drm/xe/xe_ring_ops.o
  CC      drivers/thermal/gov_power_allocator.o
  CC [M]  drivers/gpu/drm/radeon/r600_dpm.o
  CC [M]  drivers/gpu/drm/xe/xe_sa.o
  CC [M]  drivers/gpu/drm/drm_connector.o
  CC [M]  drivers/acpi/video_detect.o
  CC [M]  drivers/acpi/acpi_tad.o
  CC [M]  drivers/acpi/acpi_pad.o
  LD [M]  net/netfilter/nf_conntrack.o
  CC [M]  net/sunrpc/debugfs.o
  LD [M]  net/netfilter/nf_nat.o
  LD [M]  net/netfilter/nf_tables.o
  CC      fs/btrfs/send.o
  CC [M]  net/sunrpc/stats.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_engine_heartbeat.o
  CC      kernel/static_call_inline.o
  AR      net/netfilter/built-in.a
  CC      drivers/usb/host/xhci-pci.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.o
  CC      fs/seq_file.o
  CC [M]  drivers/media/dvb-core/dvbdev.o
  CC [M]  drivers/media/dvb-core/dmxdev.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/cstep.o
  CC [M]  drivers/media/dvb-core/dvb_demux.o
  CC      fs/xattr.o
  CC      lib/syscall.o
  CC      lib/dynamic_debug.o
  CC      lib/errname.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_ptp.o
  CC [M]  net/sunrpc/sysctl.o
  LD [M]  drivers/net/ethernet/intel/ixgbe/ixgbe.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_ddp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/dcb.o
  CC      fs/libfs.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_client.o
  CC      kernel/numa.o
  CC      kernel/user-return-notifier.o
  CC [M]  fs/smb/client/smb2misc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_mca.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.o
  CC [M]  net/bridge/br_netfilter_hooks.o
  CC [M]  drivers/gpu/drm/drm_crtc.o
  CC [M]  net/bridge/br_netfilter_ipv6.o
  LD [M]  net/bridge/bridge.o
  CC      drivers/md/dm-audit.o
  CC      kernel/padata.o
  CC [M]  drivers/gpu/drm/xe/xe_sched_job.o
  LD [M]  drivers/media/mc/mc.o
  AR      drivers/acpi/built-in.a
  CC [M]  fs/smb/client/smb2pdu.o
  CC [M]  drivers/media/v4l2-core/v4l2-dev.o
  CC      drivers/thermal/devfreq_cooling.o
  CC [M]  fs/smb/client/smb2inode.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_lsdma.o
  CC [M]  fs/smb/client/smb2file.o
  CC [M]  fs/smb/client/cifsacl.o
  CC [M]  fs/smb/client/fs_context.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.o
  CC      fs/fs-writeback.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.o
  CC [M]  drivers/gpu/drm/drm_displayid.o
  CC [M]  drivers/gpu/drm/xe/xe_step.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/disp.o
  CC [M]  drivers/gpu/drm/radeon/rs780_dpm.o
  LD [M]  drivers/acpi/video.o
  AR      drivers/usb/host/built-in.a
  AR      drivers/usb/built-in.a
  CC [M]  drivers/media/dvb-core/dvb_ca_en50221.o
  CC [M]  drivers/gpu/drm/radeon/rv6xx_dpm.o
  CC      drivers/edac/edac_mc.o
  CC      fs/pnode.o
  CC      fs/splice.o
  CC      drivers/edac/edac_device.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_engine_pm.o
  CC      fs/sync.o
  CC [M]  drivers/gpu/drm/drm_drv.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.o
  CC      lib/nlattr.o
  CC      lib/cpu_rmap.o
  CC      fs/btrfs/dev-replace.o
  CC      drivers/md/dm.o
  CC      drivers/md/dm-table.o
  CC [M]  fs/smb/client/dns_resolve.o
  CC [M]  drivers/media/dvb-core/dvb_frontend.o
  CC      fs/utimes.o
  CC      fs/d_path.o
  CC [M]  drivers/gpu/drm/xe/xe_sync.o
  GEN     drivers/eisa/devlist.h
  CC [M]  drivers/gpu/drm/i915/gt/intel_engine_user.o
  AR      drivers/net/ethernet/realtek/built-in.a
  AR      drivers/net/ethernet/qualcomm/emac/built-in.a
  CC [M]  drivers/net/ethernet/realtek/8139cp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/dp.o
  CC      drivers/eisa/pci_eisa.o
  AR      drivers/net/ethernet/qualcomm/built-in.a
  CC      drivers/md/dm-target.o
  CC      fs/stack.o
  CC      kernel/jump_label.o
  CC [M]  drivers/gpu/drm/xe/xe_tile.o
  AR      drivers/net/ethernet/renesas/built-in.a
  ASN.1   fs/smb/client/cifs_spnego_negtokeninit.asn1.[ch]
  CC [M]  drivers/gpu/drm/xe/xe_tile_sysfs.o
  AR      drivers/media/built-in.a
  CC      kernel/context_tracking.o
  CC      fs/btrfs/raid56.o
  AR      drivers/thermal/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_trace.o
  CC      drivers/md/dm-linear.o
  CC      kernel/iomem.o
  CC      drivers/opp/core.o
  CC      drivers/edac/edac_mc_sysfs.o
  LD [M]  net/sunrpc/sunrpc.o
  CC      drivers/edac/edac_module.o
  CC      drivers/edac/edac_device_sysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_sys_mgr.o
  CC      drivers/edac/wq.o
  CC [M]  drivers/media/v4l2-core/v4l2-ioctl.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_aca.o
  CC      drivers/eisa/virtual_root.o
  LD [M]  net/bridge/br_netfilter.o
  CC [M]  drivers/gpu/drm/radeon/rv770_dpm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/extdev.o
  AR      net/built-in.a
  CC [M]  drivers/gpu/drm/drm_dumb_buffers.o
  CC [M]  drivers/media/dvb-core/dvb_net.o
  AR      drivers/net/ethernet/rdc/built-in.a
  CC      lib/dynamic_queue_limits.o
  CC [M]  fs/smb/client/namespace.o
  CC      fs/fs_struct.o
  CC      lib/glob.o
  CC      fs/statfs.o
  CC [M]  fs/smb/client/reparse.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.o
  CC [M]  drivers/gpu/drm/drm_edid.o
  CC      drivers/edac/edac_pci.o
  CC      fs/fs_pin.o
  CC [M]  drivers/media/v4l2-core/v4l2-device.o
  CC [M]  fs/smb/client/smb1ops.o
  CC      fs/nsfs.o
  CC      fs/fs_types.o
  AR      drivers/net/ethernet/rocker/built-in.a
  CC      drivers/md/dm-stripe.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_execlists_submission.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_ggtt.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.o
  CC [M]  drivers/gpu/drm/drm_eld.o
  CC [M]  fs/smb/client/cifssmb.o
  CC [M]  drivers/media/dvb-core/dvb_ringbuffer.o
  CC      kernel/rseq.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_xsk.o
  CC      fs/fs_context.o
  CC      drivers/eisa/eisa-bus.o
  CC      fs/btrfs/uuid-tree.o
  CC      fs/btrfs/props.o
  CC      lib/digsig.o
  CC      lib/strncpy_from_user.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.o
  AR      drivers/net/ethernet/samsung/built-in.a
  CC [M]  drivers/net/ethernet/realtek/8139too.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/fan.o
  CC      drivers/edac/edac_pci_sysfs.o
  CC      drivers/opp/cpu.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.o
  CC      drivers/opp/debugfs.o
  CC [M]  drivers/media/v4l2-core/v4l2-fh.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.o
  CC      lib/strnlen_user.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/gpio.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/cik.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/cik_ih.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/dce_v8_0.o
  CC [M]  drivers/net/ethernet/realtek/r8169_main.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_devlink.o
  CC      lib/net_utils.o
  CC      fs/fs_parser.o
  CC      drivers/md/dm-ioctl.o
  CC      fs/fsopen.o
  CC      fs/init.o
  CC [M]  drivers/gpu/drm/radeon/rv730_dpm.o
  CC      kernel/watch_queue.o
  CC      drivers/md/dm-io.o
  CC      fs/kernel_read_file.o
  CC      fs/mnt_idmapping.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_clock_utils.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/i2c.o
  CC [M]  drivers/media/v4l2-core/v4l2-event.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_debugfs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.o
  CC [M]  drivers/media/v4l2-core/v4l2-subdev.o
  CC [M]  drivers/gpu/drm/drm_encoder.o
  AR      drivers/eisa/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/image.o
  CC      fs/remap_range.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.o
  CC [M]  drivers/net/ethernet/realtek/r8169_firmware.o
  LD [M]  drivers/media/dvb-core/dvb-core.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.o
  CC [M]  drivers/net/ethernet/realtek/r8169_phy_config.o
  AR      drivers/opp/built-in.a
  CC      fs/btrfs/free-space-tree.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/mxm.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_vram_mgr.o
  CC      drivers/edac/ghes_edac.o
  CC      fs/btrfs/tree-checker.o
  CC      drivers/cpufreq/cpufreq.o
  CC [M]  drivers/gpu/drm/xe/xe_tuning.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/cik_sdma.o
  AR      drivers/net/mctp/built-in.a
  CC [M]  fs/smb/client/cifs_spnego_negtokeninit.asn1.o
  AR      drivers/net/ethernet/seeq/built-in.a
  CC      fs/pidfs.o
  AR      drivers/net/ethernet/silan/built-in.a
  AR      drivers/net/ethernet/sis/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/uvd_v4_2.o
  CC [M]  drivers/edac/igen6_edac.o
  CC      fs/buffer.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vce_v2_0.o
  AR      drivers/net/ethernet/sfc/built-in.a
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_dcb.o
  CC      lib/sg_pool.o
  CC      lib/memregion.o
  CC      lib/irq_poll.o
  CC [M]  drivers/net/ethernet/intel/i40e/i40e_dcb_nl.o
  CC [M]  drivers/gpu/drm/xe/xe_uc.o
  CC [M]  drivers/edac/skx_common.o
  CC [M]  drivers/gpu/drm/radeon/rv740_dpm.o
  CC [M]  drivers/gpu/drm/xe/xe_uc_debugfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/si.o
  CC      fs/mpage.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v6_0.o
  GZIP    kernel/config_data.gz
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/npde.o
  CC      fs/proc_namespace.o
  CC [M]  drivers/edac/i10nm_base.o
  CC      fs/direct-io.o
  CC [M]  drivers/gpu/drm/xe/xe_uc_fw.o
  CC      lib/stackdepot.o
  CC      drivers/md/dm-kcopyd.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/pcir.o
  CC      fs/eventpoll.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_irq.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_mcr.o
  CC [M]  drivers/gpu/drm/drm_file.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_pm.o
  CC      kernel/configs.o
  CC      fs/anon_inodes.o
  CC [M]  drivers/gpu/drm/drm_fourcc.o
  CC      drivers/md/dm-sysfs.o
  CC      drivers/md/dm-stats.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v6_0.o
  CC [M]  drivers/gpu/drm/xe/xe_vm.o
  CC      lib/ref_tracker.o
  CC [M]  drivers/gpu/drm/xe/xe_vram_freq.o
  CC      drivers/cpufreq/freq_table.o
  CC [M]  drivers/media/v4l2-core/v4l2-common.o
  CC [M]  drivers/gpu/drm/drm_framebuffer.o
  CC [M]  drivers/media/v4l2-core/v4l2-ctrls-core.o
  CC [M]  drivers/gpu/drm/radeon/rv770_smc.o
  CC [M]  fs/smb/client/asn1.o
  CC [M]  drivers/gpu/drm/radeon/cypress_dpm.o
  AR      drivers/edac/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/si_ih.o
  CC      fs/btrfs/space-info.o
  CC [M]  drivers/gpu/drm/radeon/btc_dpm.o
  CC [M]  drivers/media/v4l2-core/v4l2-ctrls-api.o
  CC [M]  drivers/media/v4l2-core/v4l2-ctrls-request.o
  AR      kernel/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/si_dma.o
  CC      drivers/cpufreq/cpufreq_stats.o
  CC      fs/signalfd.o
  CC      lib/bootconfig.o
  CC      lib/asn1_decoder.o
  LD [M]  drivers/net/ethernet/realtek/r8169.o
  CC      lib/asn1_encoder.o
  AR      drivers/net/ethernet/smsc/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/dce_v6_0.o
  AR      drivers/net/ethernet/socionext/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/perf.o
  CC [M]  drivers/gpu/drm/drm_gem.o
  CC [M]  drivers/media/v4l2-core/v4l2-ctrls-defs.o
  AR      drivers/net/ethernet/stmicro/built-in.a
  LD [M]  drivers/edac/i10nm_edac.o
  CC [M]  drivers/gpu/drm/radeon/sumo_dpm.o
  CC      drivers/md/dm-rq.o
  CC [M]  drivers/gpu/drm/xe/xe_wait_user_fence.o
  CC [M]  drivers/media/v4l2-core/v4l2-compat-ioctl32.o
  CC [M]  drivers/media/v4l2-core/v4l2-mc.o
  CC [M]  drivers/gpu/drm/drm_ioctl.o
  CC [M]  drivers/media/v4l2-core/v4l2-spi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.o
  GEN     lib/oid_registry_data.c
  CC [M]  drivers/gpu/drm/xe/xe_wa.o
  LD [M]  drivers/net/ethernet/intel/i40e/i40e.o
  CC [M]  drivers/gpu/drm/radeon/sumo_smc.o
  CC [M]  drivers/gpu/drm/radeon/trinity_dpm.o
  AR      drivers/net/ethernet/sun/built-in.a
  CC      lib/ucs2_string.o
  AR      drivers/net/ethernet/tehuti/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.o
  CC      lib/ubsan.o
  AR      drivers/net/ethernet/ti/built-in.a
  CC      lib/sbitmap.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/power_budget.o
  AR      drivers/net/ethernet/vertexcom/built-in.a
  CC      lib/group_cpus.o
  AR      drivers/net/ethernet/via/built-in.a
  AR      drivers/net/ethernet/wangxun/built-in.a
  CC      lib/fw_table.o
  AR      drivers/net/ethernet/wiznet/built-in.a
  CC      fs/timerfd.o
  AR      drivers/net/ethernet/xilinx/built-in.a
  CC [M]  drivers/gpu/drm/drm_lease.o
  CC      fs/eventfd.o
  AR      drivers/net/ethernet/synopsys/built-in.a
  CC [M]  drivers/gpu/drm/drm_managed.o
  CC [M]  drivers/gpu/drm/xe/xe_wopcm.o
  AR      drivers/net/ethernet/pensando/built-in.a
  CC      drivers/cpufreq/cpufreq_performance.o
  CC      fs/userfaultfd.o
  AR      drivers/net/ethernet/built-in.a
  LD [M]  fs/smb/client/cifs.o
  CC [M]  lib/crc-itu-t.o
  CC [M]  lib/bch.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/ramcfg.o
  CC [M]  drivers/gpu/drm/radeon/trinity_smc.o
  CC [M]  drivers/gpu/drm/radeon/ni_dpm.o
  CC [M]  drivers/gpu/drm/xe/xe_hmm.o
  CC      fs/aio.o
  CC      fs/btrfs/block-rsv.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/uvd_v3_1.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vi.o
  CC [M]  drivers/media/v4l2-core/v4l2-trace.o
  CC [M]  drivers/gpu/drm/radeon/si_smc.o
  CC      fs/dax.o
  CC      drivers/net/loopback.o
  CC      drivers/cpufreq/cpufreq_powersave.o
  CC [M]  drivers/net/usb/pegasus.o
  GEN     lib/test_fortify.log
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/rammap.o
  GEN     lib/crc32table.h
  CC      fs/locks.o
  CC      drivers/md/dm-io-rewind.o
  CC      fs/binfmt_script.o
  CC      fs/binfmt_elf.o
  GEN     lib/crc64table.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.o
  CC      drivers/net/netconsole.o
  CC      drivers/cpuidle/cpuidle.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_pm_irq.o
  CC      drivers/cpuidle/governors/ladder.o
  CC      drivers/cpuidle/governors/menu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowacpi.o
  CC [M]  drivers/gpu/drm/xe/xe_hwmon.o
  CC [M]  drivers/gpu/drm/radeon/si_dpm.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_requests.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mxgpu_vi.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_relay.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.o
  CC      drivers/cpufreq/cpufreq_userspace.o
  CC [M]  drivers/media/v4l2-core/v4l2-i2c.o
  CC      drivers/cpufreq/cpufreq_ondemand.o
  CC      drivers/cpufreq/cpufreq_conservative.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.o
  CC      lib/oid_registry.o
  CC [M]  drivers/gpu/drm/radeon/kv_smc.o
  CC      lib/string.o
  CC      fs/compat_binfmt_elf.o
  CC [M]  drivers/gpu/drm/xe/xe_memirq.o
  CC [M]  drivers/gpu/drm/radeon/kv_dpm.o
  CC      fs/backing-file.o
  CC      fs/mbcache.o
  CC      drivers/cpuidle/governors/teo.o
  CC      drivers/net/tun.o
  CC      drivers/cpufreq/cpufreq_governor.o
  CC      fs/posix_acl.o
  CC      fs/coredump.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_sysfs.o
  CC      drivers/cpuidle/governors/haltpoll.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v6_1.o
  CC [M]  drivers/gpu/drm/xe/xe_sriov.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.o
  CC      drivers/md/dm-builtin.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowramin.o
  CC [M]  drivers/md/raid0.o
  CC      fs/btrfs/delalloc-space.o
  CC      drivers/cpufreq/cpufreq_governor_attr_set.o
  CC [M]  drivers/gpu/drm/radeon/ci_smc.o
  CC [M]  drivers/net/usb/rtl8150.o
  CC      fs/btrfs/block-group.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gtt.o
  CC      fs/btrfs/discard.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_llc.o
  CC [M]  drivers/net/usb/r8152.o
  CC      fs/drop_caches.o
  CC      fs/sysctls.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/timing.o
  CC [M]  drivers/gpu/drm/radeon/ci_dpm.o
  CC      fs/fhandle.o
  CC      lib/crc32.o
  CC [M]  fs/binfmt_misc.o
  CC [M]  drivers/gpu/drm/radeon/dce6_afmt.o
  CC [M]  drivers/gpu/drm/radeon/radeon_vm.o
  CC [M]  drivers/gpu/drm/xe/xe_lmtt.o
  CC      drivers/net/virtio_net.o
  CC      drivers/cpufreq/acpi-cpufreq.o
  CC [M]  drivers/gpu/drm/xe/xe_lmtt_2l.o
  CC      drivers/cpufreq/amd-pstate.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_lrc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/soc15.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_migrate.o
  AR      drivers/cpuidle/governors/built-in.a
  CC      drivers/net/xen-netfront.o
  CC      drivers/net/net_failover.o
  CC [M]  drivers/net/mii.o
  CC      drivers/cpuidle/driver.o
  CC      lib/crc64.o
  CC      drivers/mmc/core/core.o
  LD [M]  drivers/media/v4l2-core/videodev.o
  CC      drivers/mmc/core/bus.o
  CC      drivers/cpufreq/amd-pstate-trace.o
  CC [M]  drivers/gpu/drm/radeon/radeon_ucode.o
  CC [M]  drivers/gpu/drm/xe/xe_lmtt_ml.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.o
  CC      drivers/mmc/core/host.o
  CC      drivers/cpufreq/powernow-k8.o
  CC      fs/btrfs/reflink.o
  CC      drivers/cpuidle/governor.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_mocs.o
  CC      drivers/cpuidle/sysfs.o
  CC      drivers/cpuidle/poll_state.o
  CC [M]  drivers/gpu/drm/radeon/radeon_ib.o
  CC [M]  drivers/net/usb/asix_devices.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_ppgtt.o
  CC [M]  drivers/net/usb/asix_common.o
  CC [M]  drivers/gpu/drm/drm_mm.o
  CC [M]  drivers/net/usb/ax88172a.o
  AR      drivers/ufs/built-in.a
  CC [M]  drivers/gpu/drm/radeon/radeon_sync.o
  CC [M]  drivers/gpu/drm/drm_mode_config.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/emu_soc.o
  CC [M]  drivers/md/raid1.o
  CC [M]  drivers/gpu/drm/radeon/radeon_audio.o
  CC      drivers/cpufreq/pcc-cpufreq.o
  CC [M]  drivers/gpu/drm/radeon/radeon_dp_auxch.o
  CC      drivers/mmc/host/sdhci.o
  CC      drivers/leds/trigger/ledtrig-disk.o
  AR      drivers/firmware/arm_ffa/built-in.a
  AR      drivers/firmware/arm_scmi/built-in.a
  CC      drivers/mmc/host/sdhci-pci-core.o
  AR      drivers/firmware/broadcom/built-in.a
  CC [M]  drivers/gpu/drm/i915/gt/intel_rc6.o
  AR      lib/lib.a
  AR      drivers/firmware/cirrus/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_sriov_pf.o
  AR      lib/built-in.a
  AR      drivers/firmware/meson/built-in.a
  CC [M]  drivers/gpu/drm/radeon/radeon_mn.o
  AR      drivers/firmware/microchip/built-in.a
  CC [M]  drivers/net/mdio.o
  CC      fs/btrfs/subpage.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/vmap.o
  CC      drivers/mmc/host/sdhci-pci-o2micro.o
  AR      drivers/cpuidle/built-in.a
  CC [M]  drivers/gpu/drm/radeon/r600_dma.o
  AR      drivers/crypto/ccp/built-in.a
  AR      drivers/crypto/stm32/built-in.a
  CC      drivers/firmware/efi/libstub/efi-stub-helper.o
  CC      drivers/firmware/efi/libstub/gop.o
  CC      fs/btrfs/tree-mod-log.o
  AR      drivers/crypto/xilinx/built-in.a
  AR      drivers/crypto/hisilicon/built-in.a
  AR      drivers/crypto/intel/keembay/built-in.a
  AR      drivers/crypto/starfive/built-in.a
  CC [M]  drivers/md/raid10.o
  CC      drivers/cpufreq/speedstep-centrino.o
  AR      drivers/crypto/intel/ixp4xx/built-in.a
  AR      drivers/crypto/intel/built-in.a
  AR      drivers/crypto/built-in.a
  CC      drivers/clocksource/acpi_pm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mxgpu_ai.o
  CC [M]  drivers/hid/usbhid/hid-core.o
  CC      drivers/cpufreq/intel_pstate.o
  CC [M]  drivers/hid/intel-ish-hid/ishtp/init.o
  AR      drivers/hid/built-in.a
  CC [M]  drivers/gpu/drm/xe/tests/xe_kunit_helpers.o
  CC [M]  drivers/gpu/drm/radeon/rv770_dma.o
  CC [M]  drivers/net/usb/ax88179_178a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_0.o
  AR      drivers/staging/media/built-in.a
  AR      drivers/firmware/imx/built-in.a
  CC      drivers/staging/vme_user/vme.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_region_lmem.o
  CC [M]  drivers/hid/intel-ish-hid/ishtp/hbm.o
  CC [M]  drivers/net/usb/cdc_ether.o
  CC [M]  drivers/gpu/drm/radeon/evergreen_dma.o
  CC [M]  drivers/hid/intel-ish-hid/ishtp/client.o
  CC [M]  drivers/gpu/drm/radeon/ni_dma.o
  CC [M]  drivers/staging/iio/impedance-analyzer/ad5933.o
  CC [M]  drivers/gpu/drm/radeon/si_dma.o
  CC      drivers/leds/trigger/ledtrig-mtd.o
  CC      drivers/firmware/efi/efi-bgrt.o
  AR      drivers/leds/blink/built-in.a
  CC [M]  drivers/gpu/drm/drm_mode_object.o
  AR      drivers/leds/simple/built-in.a
  CC      drivers/leds/led-core.o
  CC      drivers/firmware/efi/libstub/secureboot.o
  CC      drivers/mmc/core/mmc.o
  CC      drivers/clocksource/i8253.o
  CC [M]  drivers/hid/usbhid/hiddev.o
  CC      drivers/clocksource/numachip.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/volt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/vpstate.o
  CC [M]  drivers/net/usb/cdc_eem.o
  CC      drivers/leds/trigger/ledtrig-cpu.o
  CC [M]  drivers/md/raid5.o
  CC [M]  drivers/hid/usbhid/hid-pidff.o
  CC [M]  drivers/gpu/drm/radeon/cik_sdma.o
  CC      drivers/mmc/host/sdhci-pci-arasan.o
  CC [M]  drivers/net/veth.o
  CC [M]  drivers/gpu/drm/radeon/radeon_uvd.o
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_irq.o
  CC [M]  drivers/hid/intel-ish-hid/ishtp/bus.o
  CC [M]  drivers/gpu/drm/radeon/uvd_v1_0.o
  CC [M]  drivers/gpu/drm/radeon/uvd_v2_2.o
  CC      drivers/firmware/efi/libstub/tpm.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_renderstate.o
  CC      drivers/firmware/efi/libstub/file.o
  CC      drivers/firmware/efi/libstub/mem.o
  CC      drivers/firmware/efi/libstub/random.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vega10_reg_init.o
  CC      fs/btrfs/extent-io-tree.o
  CC      fs/btrfs/fs.o
  CC      fs/btrfs/messages.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_reset.o
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_utils.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_ring.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/xpio.o
  CC [M]  drivers/gpu/drm/drm_modes.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/M0203.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_ring_submission.o
  CC      drivers/leds/trigger/ledtrig-panic.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_rps.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/M0205.o
  AR      drivers/clocksource/built-in.a
  CC [M]  drivers/net/usb/smsc75xx.o
  CC [M]  drivers/gpu/drm/radeon/uvd_v3_1.o
  CC      drivers/leds/led-class.o
  CC [M]  drivers/net/usb/smsc95xx.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_sa_media.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vega20_reg_init.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/M0209.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_sseu.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_sseu_debugfs.o
  CC [M]  drivers/md/raid5-cache.o
  CC [M]  drivers/gpu/drm/xe/display/intel_fb_bo.o
  CC      drivers/firmware/efi/libstub/randomalloc.o
  CC      drivers/mmc/core/mmc_ops.o
  CC      drivers/mmc/core/sd.o
  CC      drivers/mmc/core/sd_ops.o
  AR      drivers/cpufreq/built-in.a
  CC [M]  drivers/gpu/drm/xe/display/intel_fbdev_fb.o
  CC [M]  drivers/gpu/drm/drm_modeset_lock.o
  CC [M]  drivers/gpu/drm/drm_plane.o
  CC      drivers/firmware/efi/libstub/pci.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/P0260.o
  AR      drivers/leds/trigger/built-in.a
  CC      drivers/leds/led-triggers.o
  CC      drivers/mmc/host/sdhci-pci-dwc-mshc.o
  CC [M]  drivers/hid/intel-ish-hid/ishtp/dma-if.o
  CC [M]  drivers/gpu/drm/radeon/uvd_v4_2.o
  CC      fs/btrfs/bio.o
  CC [M]  drivers/md/raid5-ppl.o
  AR      drivers/staging/vme_user/built-in.a
  AR      drivers/net/built-in.a
  AR      drivers/staging/built-in.a
  CC [M]  drivers/hid/hid-core.o
  CC      drivers/firmware/efi/libstub/skip_spaces.o
  CC      drivers/firmware/efi/libstub/lib-cmdline.o
  AR      drivers/platform/x86/amd/built-in.a
  AR      drivers/platform/mellanox/built-in.a
  AR      drivers/platform/x86/dell/built-in.a
  AR      drivers/platform/chrome/built-in.a
  AR      drivers/firmware/psci/built-in.a
  AR      drivers/platform/x86/hp/built-in.a
  CC      drivers/mailbox/mailbox.o
  CC [M]  drivers/hid/hid-input.o
  AR      drivers/firmware/qcom/built-in.a
  LD [M]  drivers/hid/usbhid/usbhid.o
  CC      drivers/mailbox/pcc.o
  CC [M]  drivers/platform/x86/intel/int3472/discrete.o
  CC [M]  drivers/platform/x86/intel/int3472/clk_and_regulator.o
  CC [M]  drivers/hid/hid-quirks.o
  CC [M]  drivers/platform/x86/intel/pmc/core.o
  CC [M]  drivers/platform/x86/intel/int3472/led.o
  CC [M]  drivers/platform/x86/intel/pmt/class.o
  CC      drivers/firmware/efi/libstub/lib-ctype.o
  CC      drivers/firmware/efi/libstub/alignedmem.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/base.o
  CC [M]  drivers/net/usb/rndis_host.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/hwsq.o
  AR      drivers/platform/surface/built-in.a
  CC [M]  drivers/net/usb/mcs7830.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_4.o
  CC      drivers/mmc/core/sdio.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v2_3.o
  CC [M]  drivers/hid/intel-ish-hid/ishtp/client-buffers.o
  CC [M]  drivers/gpu/drm/radeon/radeon_vce.o
  CC      drivers/mmc/host/sdhci-pci-gli.o
  CC      drivers/mmc/host/sdhci-acpi.o
  CC      drivers/mmc/host/cqhci-core.o
  CC      drivers/platform/x86/p2sb.o
  CC [M]  drivers/gpu/drm/drm_prime.o
  CC      drivers/platform/x86/intel_scu_ipc.o
  CC      drivers/platform/x86/intel_scu_pcidrv.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display.o
  CC [M]  drivers/net/usb/usbnet.o
  CC [M]  drivers/platform/x86/intel/speed_select_if/isst_if_common.o
  CC      fs/btrfs/lru_cache.o
  CC [M]  drivers/net/usb/cdc_ncm.o
  CC      drivers/firmware/efi/libstub/relocate.o
  CC      drivers/firmware/efi/libstub/printk.o
  CC [M]  drivers/net/usb/r8153_ecm.o
  CC [M]  drivers/md/dm-path-selector.o
  CC      drivers/mmc/host/cqhci-crypto.o
  CC [M]  drivers/platform/x86/intel/pmc/core_ssram.o
  CC [M]  drivers/platform/x86/intel/pmc/spt.o
  CC [M]  drivers/platform/x86/intel/int3472/common.o
  AR      drivers/leds/built-in.a
  CC [M]  drivers/platform/x86/intel/uncore-frequency/uncore-frequency.o
  CC      drivers/hwspinlock/hwspinlock_core.o
  CC [M]  drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.o
  CC [M]  drivers/gpu/drm/drm_print.o
  CC [M]  drivers/mmc/host/sdhci-pltfm.o
  CC [M]  drivers/platform/x86/intel/pmc/cnp.o
  CC [M]  drivers/platform/x86/intel/pmc/icl.o
  CC [M]  drivers/hid/intel-ish-hid/ipc/ipc.o
  AR      drivers/mailbox/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.o
  CC      fs/btrfs/raid-stripe-tree.o
  CC      drivers/remoteproc/remoteproc_core.o
  CC      drivers/platform/x86/pmc_atom.o
  CC [M]  drivers/platform/x86/intel/pmt/telemetry.o
  CC [M]  drivers/platform/x86/intel/pmc/tgl.o
  CC [M]  drivers/hid/intel-ish-hid/ipc/pci-ish.o
  CC      drivers/remoteproc/remoteproc_coredump.o
  CC [M]  drivers/hid/hid-debug.o
  CC [M]  drivers/platform/x86/intel/int3472/tps68470.o
  CC [M]  drivers/hid/hidraw.o
  CC      drivers/firmware/efi/libstub/vsprintf.o
  CC      drivers/firmware/efi/libstub/x86-stub.o
  CC      drivers/mmc/core/sdio_ops.o
  CC [M]  drivers/platform/x86/wmi.o
  CC [M]  drivers/gpu/drm/radeon/vce_v1_0.o
  CC [M]  drivers/platform/x86/wmi-bmof.o
  CC      drivers/firmware/efi/efi.o
  CC [M]  drivers/md/dm-mpath.o
  CC [M]  drivers/hid/hid-generic.o
  CC [M]  drivers/hid/hid-sensor-hub.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_misc.o
  CC      drivers/platform/x86/intel/turbo_max_3.o
  CC [M]  drivers/platform/x86/intel/speed_select_if/isst_if_mmio.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_timeline.o
  CC      drivers/mmc/core/sdio_bus.o
  CC [M]  drivers/platform/x86/intel/pmc/adl.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_tlb.o
  CC [M]  drivers/hid/intel-ish-hid/ishtp-hid.o
  AR      drivers/virt/vboxguest/built-in.a
  CC [M]  drivers/platform/x86/intel/speed_select_if/isst_if_mbox_pci.o
  AR      drivers/virt/coco/tdx-guest/built-in.a
  AR      drivers/virt/coco/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/nv.o
  AR      drivers/virt/built-in.a
  CC [M]  drivers/gpu/drm/xe/display/xe_display_rps.o
  CC [M]  drivers/gpu/drm/drm_property.o
  CC [M]  drivers/gpu/drm/xe/display/xe_dsb_buffer.o
  CC [M]  drivers/gpu/drm/radeon/vce_v2_0.o
  CC      drivers/firmware/efi/vars.o
  AR      drivers/devfreq/event/built-in.a
  CC      drivers/devfreq/devfreq.o
  CC      drivers/devfreq/devfreq-event.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.o
  CC      drivers/firmware/efi/libstub/x86-5lvl.o
  CC      drivers/devfreq/governor_simpleondemand.o
  LD [M]  drivers/platform/x86/intel/uncore-frequency/intel-uncore-frequency.o
  LD [M]  drivers/platform/x86/intel/uncore-frequency/intel-uncore-frequency-common.o
  CC [M]  drivers/gpu/drm/radeon/radeon_fbdev.o
  CC [M]  drivers/gpu/drm/radeon/radeon_atpx_handler.o
  CC [M]  drivers/gpu/drm/xe/display/xe_fb_pin.o
  AR      drivers/mmc/host/built-in.a
  CC [M]  drivers/platform/x86/intel/speed_select_if/isst_if_mbox_msr.o
  AR      drivers/hwspinlock/built-in.a
  CC [M]  drivers/platform/x86/mxm-wmi.o
  CC      drivers/mmc/core/sdio_cis.o
  CC      drivers/devfreq/governor_performance.o
  CC      drivers/extcon/extcon.o
  CC [M]  drivers/platform/x86/intel/int3472/tps68470_board_data.o
  CC      drivers/extcon/devres.o
  CC [M]  drivers/hid/intel-ish-hid/ishtp-hid-client.o
  LD [M]  drivers/hid/intel-ish-hid/intel-ishtp.o
  CC [M]  drivers/md/dm-ps-round-robin.o
  CC [M]  drivers/platform/x86/intel/pmc/mtl.o
  CC      drivers/firmware/efi/reboot.o
  CC      drivers/remoteproc/remoteproc_debugfs.o
  LD [M]  drivers/hid/intel-ish-hid/intel-ish-ipc.o
  CC [M]  drivers/hid/hid-sensor-custom.o
  CC [M]  drivers/gpu/drm/radeon/radeon_acpi.o
  CC [M]  drivers/platform/x86/intel/pmt/crashlog.o
  CC      fs/btrfs/acl.o
  CC      drivers/firmware/efi/libstub/unaccepted_memory.o
  CC      drivers/mmc/core/sdio_io.o
  LD [M]  drivers/platform/x86/intel/pmt/pmt_class.o
  LD [M]  drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.o
  LD [M]  drivers/platform/x86/intel/pmt/pmt_telemetry.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/arct_reg_init.o
  CC      drivers/remoteproc/remoteproc_sysfs.o
  CC      drivers/mmc/core/sdio_irq.o
  AR      drivers/memory/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/mxgpu_nv.o
  MKREG   drivers/gpu/drm/radeon/r100_reg_safe.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_2.o
  CC [M]  drivers/gpu/drm/xe/display/xe_hdcp_gsc.o
  CC [M]  drivers/platform/x86/intel_ips.o
  CC      fs/btrfs/zoned.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v4_0.o
  MKREG   drivers/gpu/drm/radeon/rn50_reg_safe.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v5_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/aldebaran_reg_init.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_wopcm.o
  LD [M]  drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.o
  MKREG   drivers/gpu/drm/radeon/r300_reg_safe.h
  CC [M]  drivers/gpu/drm/i915/gt/intel_workarounds.o
  CC [M]  drivers/gpu/drm/i915/gt/shmem_utils.o
  CC      drivers/devfreq/governor_powersave.o
  CC [M]  drivers/platform/x86/intel/hid.o
  CC [M]  drivers/gpu/drm/xe/display/xe_plane_initial.o
  AR      drivers/firmware/smccc/built-in.a
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_dram.o
  CC [M]  drivers/gpu/drm/drm_syncobj.o
  CC      drivers/devfreq/governor_userspace.o
  LD [M]  drivers/net/usb/asix.o
  CC      drivers/firmware/efi/libstub/bitmap.o
  CC      drivers/firmware/efi/memattr.o
  CC      drivers/firmware/efi/tpm.o
  CC      drivers/powercap/powercap_sys.o
  CC [M]  drivers/platform/x86/intel/pmc/arl.o
  CC [M]  drivers/platform/x86/intel/pmc/lnl.o
  MKREG   drivers/gpu/drm/radeon/r420_reg_safe.h
  CC      drivers/firmware/efi/libstub/find.o
  STUBCPY drivers/firmware/efi/libstub/alignedmem.stub.o
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_pch.o
  CC      drivers/devfreq/governor_passive.o
  CC [M]  drivers/gpu/drm/drm_sysfs.o
  LD [M]  drivers/platform/x86/intel/pmt/pmt_crashlog.o
  STUBCPY drivers/firmware/efi/libstub/bitmap.stub.o
  CC [M]  drivers/gpu/drm/drm_trace_points.o
  AR      drivers/perf/built-in.a
  CC [M]  drivers/gpu/drm/drm_vblank.o
  CC [M]  drivers/platform/x86/intel/vsec.o
  LD [M]  drivers/hid/hid.o
  STUBCPY drivers/firmware/efi/libstub/efi-stub-helper.stub.o
  CC      fs/btrfs/verity.o
  CC [M]  drivers/gpu/drm/drm_vblank_work.o
  CC [M]  drivers/gpu/drm/drm_vma_manager.o
  STUBCPY drivers/firmware/efi/libstub/file.stub.o
  AR      drivers/firmware/tegra/built-in.a
  CC      drivers/remoteproc/remoteproc_virtio.o
  STUBCPY drivers/firmware/efi/libstub/find.stub.o
  STUBCPY drivers/firmware/efi/libstub/gop.stub.o
  AR      drivers/firmware/xilinx/built-in.a
  CC      drivers/firmware/dmi_scan.o
  STUBCPY drivers/firmware/efi/libstub/lib-cmdline.stub.o
  CC [M]  drivers/gpu/drm/i915/gt/sysfs_engines.o
  STUBCPY drivers/firmware/efi/libstub/lib-ctype.stub.o
  LD [M]  drivers/hid/intel-ish-hid/intel-ishtp-hid.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_ggtt_gmch.o
  AR      drivers/ras/amd/atl/built-in.a
  CC      drivers/ras/ras.o
  STUBCPY drivers/firmware/efi/libstub/mem.stub.o
  CC      drivers/firmware/efi/memmap.o
  STUBCPY drivers/firmware/efi/libstub/pci.stub.o
  STUBCPY drivers/firmware/efi/libstub/printk.stub.o
  STUBCPY drivers/firmware/efi/libstub/random.stub.o
  STUBCPY drivers/firmware/efi/libstub/randomalloc.stub.o
  STUBCPY drivers/firmware/efi/libstub/relocate.stub.o
  STUBCPY drivers/firmware/efi/libstub/secureboot.stub.o
  STUBCPY drivers/firmware/efi/libstub/skip_spaces.stub.o
  STUBCPY drivers/firmware/efi/libstub/tpm.stub.o
  AR      drivers/extcon/built-in.a
  CC [M]  drivers/gpu/drm/radeon/rs600.o
  STUBCPY drivers/firmware/efi/libstub/unaccepted_memory.stub.o
  CC      drivers/firmware/dmi-sysfs.o
  STUBCPY drivers/firmware/efi/libstub/vsprintf.stub.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/aldebaran.o
  STUBCPY drivers/firmware/efi/libstub/x86-5lvl.stub.o
  STUBCPY drivers/firmware/efi/libstub/x86-stub.stub.o
  AR      drivers/firmware/efi/libstub/lib.a
  AR      drivers/hwtracing/intel_th/built-in.a
  CC [M]  drivers/hwtracing/intel_th/core.o
  AR      drivers/android/built-in.a
  CC [M]  drivers/hwtracing/intel_th/pci.o
  AR      drivers/nvmem/layouts/built-in.a
  CC      drivers/mmc/core/slot-gpio.o
  CC      drivers/nvmem/core.o
  CC      drivers/firmware/edd.o
  LD [M]  drivers/md/raid456.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/g94.o
  LD [M]  drivers/md/dm-multipath.o
  CC      drivers/firmware/dmi-id.o
  LD [M]  drivers/md/dm-round-robin.o
  AR      drivers/md/built-in.a
  CC      drivers/interconnect/core.o
  CC      drivers/hte/hte.o
  CC      drivers/ras/debugfs.o
  CC      drivers/interconnect/bulk.o
  CC [M]  drivers/platform/x86/intel/pmc/pltdrv.o
  CC [M]  drivers/gpu/drm/i915/gt/gen6_renderstate.o
  AR      drivers/accel/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/soc21.o
  CC      drivers/mmc/core/regulator.o
  CC [M]  drivers/parport/share.o
  CC [M]  drivers/gpu/drm/xe/i915-display/icl_dsi.o
  CC [M]  drivers/gpu/drm/radeon/rv515.o
  CC      drivers/powercap/idle_inject.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sienna_cichlid.o
  CC [M]  drivers/gpu/drm/i915/gt/gen7_renderstate.o
  CC [M]  drivers/gpu/drm/i915/gt/gen8_renderstate.o
  CC [M]  drivers/gpu/drm/radeon/r200.o
  LD [M]  drivers/platform/x86/intel/pmc/intel_pmc_core.o
  CC      drivers/ras/cec.o
  CC      drivers/interconnect/debugfs-client.o
  CC      drivers/firmware/efi/esrt.o
  AR      drivers/devfreq/built-in.a
  CC      drivers/firmware/efi/cper.o
  CC      drivers/firmware/memmap.o
  CC [M]  drivers/mtd/parsers/cmdlinepart.o
  CC [M]  drivers/gpu/drm/i915/gt/gen9_renderstate.o
  CC [M]  drivers/mtd/chips/chipreg.o
  CC      drivers/remoteproc/remoteproc_elf_loader.o
  CC [M]  drivers/gpu/drm/drm_writeback.o
  CC [M]  drivers/gpu/drm/lib/drm_random.o
  CC      drivers/mmc/core/debugfs.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_busy.o
  CC      drivers/mmc/core/crypto.o
  CC [M]  drivers/gpu/drm/drm_ioc32.o
  CC      drivers/remoteproc/remoteproc_cdev.o
  CC [M]  drivers/gpu/drm/radeon/r600_cs.o
  CC      drivers/firmware/sysfb.o
  LD [M]  drivers/platform/x86/intel/pmc/intel_pmc_core_pltdrv.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.o
  CC [M]  drivers/platform/x86/intel/rst.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_clflush.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic_plane.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.o
  CC [M]  drivers/gpu/drm/drm_panel.o
  CC [M]  drivers/vfio/pci/vfio_pci_core.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v4_3.o
  CC [M]  drivers/dca/dca-core.o
  CC [M]  drivers/dca/dca-sysfs.o
  CC [M]  drivers/vfio/pci/vfio_pci_intrs.o
  CC [M]  drivers/vfio/pci/vfio_pci_rdwr.o
  CC      drivers/firmware/efi/cper_cxl.o
  CC      drivers/firmware/efi/runtime-wrappers.o
  CC [M]  drivers/hwtracing/intel_th/gth.o
  CC      drivers/firmware/efi/dev-path-parser.o
  CC [M]  drivers/vfio/pci/vfio_pci_config.o
  CC [M]  drivers/mtd/maps/map_funcs.o
  AR      fs/btrfs/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v6_0.o
  CC [M]  drivers/gpu/drm/drm_pci.o
  AR      fs/built-in.a
  AR      drivers/nvmem/built-in.a
  CC [M]  drivers/vhost/net.o
  AR      drivers/hte/built-in.a
  CC [M]  drivers/vhost/vhost.o
  CC [M]  drivers/gpu/drm/drm_debugfs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv04.o
  CC [M]  drivers/powercap/intel_rapl_common.o
  CC [M]  drivers/gpu/drm/drm_debugfs_crc.o
  CC [M]  drivers/soundwire/bus_type.o
  CC [M]  drivers/gpu/drm/drm_edid_load.o
  CC [M]  drivers/parport/ieee1284.o
  LD [M]  drivers/platform/x86/intel/intel-hid.o
  AR      drivers/ras/built-in.a
  CC [M]  drivers/parport/ieee1284_ops.o
  LD [M]  drivers/platform/x86/intel/intel_vsec.o
  CC [M]  drivers/powercap/intel_rapl_msr.o
  LD [M]  drivers/platform/x86/intel/intel-rst.o
  CC [M]  drivers/mtd/nand/core.o
  AR      drivers/platform/x86/intel/built-in.a
  CC [M]  drivers/mtd/nand/bbt.o
  CC [M]  drivers/mtd/nand/ecc.o
  AR      drivers/platform/x86/built-in.a
  AR      drivers/remoteproc/built-in.a
  CC      drivers/firmware/efi/apple-properties.o
  AR      drivers/platform/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv40.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_context.o
  CC [M]  drivers/vfio/pci/vfio_pci.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_create.o
  CC [M]  drivers/gpu/drm/radeon/evergreen_cs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_7.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v5_2.o
  AR      drivers/powercap/built-in.a
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.o
  AR      drivers/mmc/core/built-in.a
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_audio.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_domain.o
  AR      drivers/mmc/built-in.a
  LD [M]  drivers/hwtracing/intel_th/intel_th.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o
  LD [M]  drivers/hwtracing/intel_th/intel_th_pci.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/lsdma_v6_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_backlight.o
  CC [M]  drivers/soundwire/bus.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/g84.o
  CC      drivers/firmware/efi/rci2-table.o
  CC [M]  drivers/soundwire/master.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.o
  CC [M]  drivers/vfio/vfio_main.o
  AR      drivers/interconnect/built-in.a
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bios.o
  LD [M]  drivers/hwtracing/intel_th/intel_th_gth.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_internal.o
  CC [M]  drivers/soundwire/slave.o
  CC [M]  drivers/soundwire/mipi_disco.o
  CC [M]  drivers/parport/procfs.o
  LD [M]  drivers/dca/dca.o
  CC [M]  drivers/gpu/drm/../../accel/drm_accel.o
  CC [M]  drivers/parport/daisy.o
  CC [M]  drivers/gpu/drm/drm_exec.o
  CC [M]  drivers/gpu/drm/drm_gpuvm.o
  CC [M]  drivers/mtd/nand/ecc-sw-hamming.o
  CC      drivers/firmware/efi/mokvar-table.o
  CC [M]  drivers/vfio/group.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bw.o
  CC [M]  drivers/mtd/nand/ecc-sw-bch.o
  CC [M]  drivers/vfio/container.o
  CC [M]  drivers/gpu/drm/drm_buddy.o
  CC [M]  drivers/mtd/nand/ecc-mxic.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_9.o
  CC [M]  drivers/vfio/virqfd.o
  CC [M]  drivers/gpu/drm/radeon/r100.o
  CC [M]  drivers/gpu/drm/radeon/r300.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.o
  CC [M]  drivers/iio/accel/hid-sensor-accel-3d.o
  CC [M]  drivers/thunderbolt/nhi.o
  CC [M]  drivers/thunderbolt/nhi_ops.o
  CC [M]  drivers/mtd/spi-nor/core.o
  CC [M]  drivers/thunderbolt/ctl.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.o
  CC [M]  drivers/thunderbolt/tb.o
  LD [M]  drivers/vfio/pci/vfio-pci.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gf100.o
  CC [M]  drivers/gpu/drm/drm_gem_shmem_helper.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_lmem.o
  CC [M]  drivers/vfio/vfio_iommu_type1.o
  CC [M]  drivers/parport/probe.o
  LD [M]  drivers/vfio/pci/vfio-pci-core.o
  CC [M]  drivers/parport/parport_pc.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_mman.o
  CC [M]  drivers/mtd/spi-nor/sfdp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk104.o
  CC      drivers/firmware/efi/sysfb_efi.o
  CC [M]  drivers/mtd/spi-nor/swp.o
  CC [M]  drivers/soundwire/stream.o
  CC [M]  drivers/mtd/mtdcore.o
  CC [M]  drivers/mtd/mtdsuper.o
  CC [M]  drivers/gpu/drm/drm_suballoc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/pllnv04.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/pllgt215.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_object.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_11.o
  CC [M]  drivers/vhost/iotlb.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_pages.o
  CC [M]  drivers/soundwire/sysfs_slave.o
  CC [M]  drivers/iio/buffer/industrialio-triggered-buffer.o
  CC [M]  drivers/gpu/drm/radeon/r420.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv04.o
  CC [M]  drivers/iio/buffer/kfifo_buf.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/lsdma_v7_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v7_0.o
  CC [M]  drivers/thunderbolt/switch.o
  CC [M]  drivers/thunderbolt/cap.o
  CC [M]  drivers/thunderbolt/path.o
  CC [M]  drivers/mtd/mtdconcat.o
  CC      drivers/firmware/efi/earlycon.o
  CC [M]  drivers/soundwire/sysfs_slave_dpn.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_phys.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_pm.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_region.o
  LD [M]  drivers/mtd/nand/nandcore.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.o
  CC [M]  drivers/mtd/mtdpart.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_shmem.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/df_v1_7.o
  CC [M]  drivers/soundwire/debugfs.o
  CC [M]  drivers/thunderbolt/tunnel.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/df_v3_6.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/df_v4_3.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cdclk.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_color.o
  LD [M]  drivers/vfio/vfio.o
  CC [M]  drivers/soundwire/irq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv05.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_combo_phy.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_connector.o
  CC [M]  drivers/soundwire/generic_bandwidth_allocation.o
  CC [M]  drivers/iio/common/hid-sensors/hid-sensor-attributes.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv10.o
  CC [M]  drivers/gpu/drm/drm_gem_ttm_helper.o
  LD [M]  drivers/vhost/vhost_net.o
  LD [M]  drivers/vhost/vhost_iotlb.o
  CC [M]  drivers/gpu/drm/drm_atomic_helper.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_shrinker.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc_state_dump.o
  CC      drivers/firmware/efi/cper-x86.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cursor.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cx0_phy.o
  CC [M]  drivers/mtd/spi-nor/otp.o
  CC      drivers/firmware/efi/unaccepted_memory.o
  CC [M]  drivers/mtd/spi-nor/sysfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi_buf_trans.o
  CC [M]  drivers/mtd/spi-nor/atmel.o
  CC [M]  drivers/soundwire/cadence_master.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_device.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/df_v4_6_2.o
  LD [M]  drivers/parport/parport.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_stolen.o
  LD [M]  drivers/gpu/drm/radeon/radeon.o
  CC [M]  drivers/mtd/spi-nor/eon.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv1a.o
  CC [M]  drivers/soundwire/intel.o
  CC [M]  drivers/mtd/spi-nor/esmt.o
  CC [M]  drivers/mtd/spi-nor/everspin.o
  CC [M]  drivers/gpu/drm/drm_atomic_state_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v7_0.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_throttle.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_tiling.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv20.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_ttm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.o
  CC [M]  drivers/mtd/mtdchar.o
  CC [M]  drivers/firmware/efi/efi-pstore.o
  CC [M]  drivers/gpu/drm/drm_bridge_connector.o
  CC [M]  drivers/soundwire/intel_ace2x.o
  CC [M]  drivers/gpu/drm/drm_crtc_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.o
  CC [M]  drivers/gpu/drm/drm_damage_helper.o
  CC [M]  drivers/mtd/spi-nor/gigadevice.o
  CC [M]  drivers/mtd/spi-nor/intel.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.o
  AR      drivers/firmware/efi/built-in.a
  CC [M]  drivers/soundwire/intel_ace2x_debugfs.o
  CC [M]  drivers/soundwire/intel_auxdevice.o
  CC [M]  drivers/gpu/drm/drm_encoder_slave.o
  CC [M]  drivers/iio/common/hid-sensors/hid-sensor-trigger.o
  CC [M]  drivers/thunderbolt/eeprom.o
  CC [M]  drivers/mtd/spi-nor/issi.o
  CC [M]  drivers/thunderbolt/domain.o
  CC [M]  drivers/mtd/spi-nor/macronix.o
  CC [M]  drivers/mtd/spi-nor/micron-st.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_driver.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g84.o
  CC [M]  drivers/mtd/spi-nor/spansion.o
  CC [M]  drivers/thunderbolt/dma_port.o
  CC [M]  drivers/gpu/drm/drm_flip_work.o
  LD [M]  drivers/iio/common/hid-sensors/hid-sensor-iio-common.o
  CC [M]  drivers/thunderbolt/icm.o
  CC [M]  drivers/iio/gyro/hid-sensor-gyro-3d.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.o
  AR      drivers/firmware/built-in.a
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_irq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.o
  CC [M]  drivers/gpu/drm/drm_format_helper.o
  CC [M]  drivers/mtd/spi-nor/sst.o
  CC [M]  drivers/soundwire/intel_init.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_userptr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.o
  CC [M]  drivers/gpu/drm/drm_gem_atomic_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_wait.o
  LD [M]  drivers/mtd/mtd.o
  CC [M]  drivers/mtd/spi-nor/winbond.o
  CC [M]  drivers/soundwire/dmi-quirks.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.o
  CC [M]  drivers/mtd/spi-nor/xilinx.o
  CC [M]  drivers/thunderbolt/property.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gemfs.o
  CC [M]  drivers/mtd/spi-nor/xmc.o
  CC [M]  drivers/gpu/drm/drm_gem_framebuffer_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.o
  CC [M]  drivers/thunderbolt/xdomain.o
  CC [M]  drivers/gpu/drm/i915/i915_active.o
  CC [M]  drivers/gpu/drm/drm_kms_helper_common.o
  CC [M]  drivers/soundwire/intel_bus_common.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.o
  CC [M]  drivers/gpu/drm/i915/i915_cmd_parser.o
  LD [M]  drivers/soundwire/soundwire-bus.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_params.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.o
  CC [M]  drivers/gpu/drm/i915/i915_deps.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.o
  CC [M]  drivers/gpu/drm/drm_modeset_helper.o
  CC [M]  drivers/gpu/drm/i915/i915_gem.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_map.o
  CC [M]  drivers/mtd/spi-nor/debugfs.o
  LD [M]  drivers/soundwire/soundwire-generic-allocation.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.o
  CC [M]  drivers/gpu/drm/drm_plane_helper.o
  CC [M]  drivers/iio/light/hid-sensor-als.o
  CC [M]  drivers/iio/light/hid-sensor-prox.o
  LD [M]  drivers/soundwire/soundwire-cadence.o
  CC [M]  drivers/gpu/drm/drm_probe_helper.o
  CC [M]  drivers/iio/magnetometer/hid-sensor-magn-3d.o
  CC [M]  drivers/gpu/drm/drm_rect.o
  CC [M]  drivers/gpu/drm/drm_self_refresh_helper.o
  CC [M]  drivers/gpu/drm/drm_simple_kms_helper.o
  CC [M]  drivers/gpu/drm/i915/i915_gem_evict.o
  CC [M]  drivers/gpu/drm/i915/i915_gem_gtt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.o
  CC [M]  drivers/thunderbolt/lc.o
  CC [M]  drivers/gpu/drm/i915/i915_gem_ww.o
  CC [M]  drivers/gpu/drm/i915/i915_query.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.o
  CC [M]  drivers/thunderbolt/tmu.o
  LD [M]  drivers/soundwire/soundwire-intel.o
  CC [M]  drivers/gpu/drm/i915/i915_request.o
  CC [M]  drivers/gpu/drm/i915/i915_scheduler.o
  CC [M]  drivers/thunderbolt/usb4.o
  CC [M]  drivers/gpu/drm/i915/i915_trace_points.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_well.o
  CC [M]  drivers/gpu/drm/i915/i915_ttm_buddy_manager.o
  CC [M]  drivers/gpu/drm/i915/i915_vma.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_trace.o
  CC [M]  drivers/iio/orientation/hid-sensor-incl-3d.o
  CC [M]  drivers/thunderbolt/usb4_port.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.o
  CC [M]  drivers/iio/orientation/hid-sensor-rotation.o
  CC [M]  drivers/gpu/drm/bridge/panel.o
  LD [M]  drivers/mtd/spi-nor/spi-nor.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_wa.o
  CC [M]  drivers/thunderbolt/nvm.o
  CC [M]  drivers/thunderbolt/retimer.o
  CC [M]  drivers/iio/position/hid-sensor-custom-intel-hinge.o
  CC [M]  drivers/thunderbolt/quirks.o
  CC [M]  drivers/gpu/drm/drm_fbdev_generic.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dkl_phy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dmc.o
  CC [M]  drivers/gpu/drm/drm_fb_helper.o
  LD [M]  drivers/gpu/drm/drm.o
  CC [M]  drivers/gpu/drm/i915/i915_vma_resource.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm200.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_aux.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_aux_backlight.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gv100.o
  CC [M]  drivers/thunderbolt/clx.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.o
  LD [M]  drivers/gpu/drm/drm_shmem_helper.o
  LD [M]  drivers/gpu/drm/drm_suballoc_helper.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_hdcp.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_link_training.o
  CC [M]  drivers/thunderbolt/acpi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_mst.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.o
  LD [M]  drivers/gpu/drm/drm_ttm_helper.o
  CC [M]  drivers/iio/industrialio-core.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.o
  CC [M]  drivers/thunderbolt/debugfs.o
  CC [M]  drivers/iio/industrialio-event.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpll.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpll_mgr.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc.o
  CC [M]  drivers/iio/inkern.o
  CC [M]  drivers/iio/industrialio-buffer.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpt_common.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_capture.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.o
  AR      drivers/gpu/drm/built-in.a
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v11_5_0.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/ga100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_drrs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsb.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp100.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_log.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_dcs_backlight.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v6_0.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp10b.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.o
  LD [M]  drivers/thunderbolt/thunderbolt.o
  CC [M]  drivers/iio/industrialio-trigger.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v6_1.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_vbt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/tu102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v6_7.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_huc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fb.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fbc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fdi.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_huc_fw.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v8_7.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_uc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v8_10.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v12_0.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.o
  LD [M]  drivers/gpu/drm/drm_kms_helper.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gsc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fifo_underrun.o
  CC [M]  drivers/gpu/drm/i915/i915_hwmon.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_frontbuffer.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.o
  CC [M]  drivers/gpu/drm/i915/display/hsw_ips.o
  CC [M]  drivers/gpu/drm/i915/display/i9xx_plane.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_global_state.o
  CC [M]  drivers/gpu/drm/i915/display/i9xx_wm.o
  CC [M]  drivers/gpu/drm/i915/display/intel_atomic.o
  CC [M]  drivers/gpu/drm/i915/display/intel_atomic_plane.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv04.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_gmbus.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ih.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdcp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/iceland_ih.o
  CC [M]  drivers/gpu/drm/i915/display/intel_audio.o
  CC [M]  drivers/gpu/drm/i915/display/intel_bios.o
  CC [M]  drivers/gpu/drm/i915/display/intel_bw.o
  CC [M]  drivers/gpu/drm/i915/display/intel_cdclk.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/tonga_ih.o
  CC [M]  drivers/gpu/drm/i915/display/intel_color.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv10.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv1a.o
  CC [M]  drivers/gpu/drm/i915/display/intel_combo_phy.o
  CC [M]  drivers/gpu/drm/i915/display/intel_connector.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/cz_ih.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdcp_gsc_message.o
  LD [M]  drivers/iio/industrialio.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vega10_ih.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv20.o
  CC [M]  drivers/gpu/drm/i915/display/intel_crtc.o
  CC [M]  drivers/gpu/drm/i915/display/intel_crtc_state_dump.o
  CC [M]  drivers/gpu/drm/i915/display/intel_cursor.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vega20_ih.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_driver.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/navi10_ih.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_irq.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_params.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdmi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv25.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/ih_v6_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hotplug.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hotplug_irq.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_power.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hti.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/ih_v6_1.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_link_bw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_lspcon.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_power_map.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_power_well.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv30.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_reset.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/ih_v7_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_rps.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_wa.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dmc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_lock.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v3_1.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_setup.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dpio_phy.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv35.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_verify.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v10_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dpll.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v11_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dpll_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v11_0_8.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dpt.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dpt_common.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_panel.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v12_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv36.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv40.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v13_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.o
  CC [M]  drivers/gpu/drm/i915/display/intel_drrs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v14_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv41.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dsb.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dsb_buffer.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/dce_v10_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pmdemand.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pps.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_psr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/dce_v11_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv44.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_qp_tables.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fb.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_quirks.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_snps_phy.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_tc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vblank.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vdsc.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fb_bo.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fb_pin.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fbc.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fdi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vga.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fifo_underrun.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vrr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_wm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv46.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv47.o
  CC [M]  drivers/gpu/drm/i915/display/intel_frontbuffer.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v8_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv49.o
  CC [M]  drivers/gpu/drm/i915/display/intel_global_state.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hdcp.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hdcp_gsc.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_scaler.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hotplug.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v9_4.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hotplug_irq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv4e.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hti.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.o
  CC [M]  drivers/gpu/drm/i915/display/intel_link_bw.o
  CC [M]  drivers/gpu/drm/i915/display/intel_load_detect.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_universal_plane.o
  CC [M]  drivers/gpu/drm/i915/display/intel_lpe_audio.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_watermark.o
  CC [M]  drivers/gpu/drm/i915/display/intel_modeset_lock.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_acpi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/imu_v11_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/g84.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gt215.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_opregion.o
  CC [M]  drivers/gpu/drm/i915/display/intel_modeset_setup.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fbdev.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs_params.o
  CC [M]  drivers/gpu/drm/i915/display/intel_modeset_verify.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/mcp77.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pipe_crc.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/mcp89.o
  CC [M]  drivers/gpu/drm/i915/display/intel_overlay.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.o
  CC [M]  drivers/gpu/drm/i915/display/intel_pch_display.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.o
  CC [M]  drivers/gpu/drm/i915/display/intel_pch_refclk.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.o
  CC [M]  drivers/gpu/drm/xe/xe_guc.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_ads.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.o
  CC [M]  drivers/gpu/drm/i915/display/intel_plane_initial.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.o
  CC [M]  drivers/gpu/drm/i915/display/intel_pmdemand.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk20a.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.o
  CC [M]  drivers/gpu/drm/i915/display/intel_psr.o
  CC [M]  drivers/gpu/drm/i915/display/intel_quirks.o
  CC [M]  drivers/gpu/drm/i915/display/intel_sprite.o
  HDRTEST drivers/gpu/drm/xe/abi/gsc_proxy_commands_abi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm200.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_klvs_abi.h
  CC [M]  drivers/gpu/drm/i915/display/intel_sprite_uapi.o
  HDRTEST drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_errors_abi.h
  CC [M]  drivers/gpu/drm/i915/display/intel_tc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v4_4.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.o
  HDRTEST drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_relay_communication_abi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm20b.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp100.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_communication_mmio_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_messages_abi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp10b.o
  CC [M]  drivers/gpu/drm/i915/display/intel_vblank.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h
  CC [M]  drivers/gpu/drm/i915/display/intel_vga.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h
  CC [M]  drivers/gpu/drm/i915/display/intel_wm.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h
  CC [M]  drivers/gpu/drm/i915/display/skl_scaler.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.o
  CC [M]  drivers/gpu/drm/i915/display/skl_universal_plane.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_trace.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_active_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h
  CC [M]  drivers/gpu/drm/i915/display/skl_watermark.o
  CC [M]  drivers/gpu/drm/i915/display/intel_acpi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/r535.o
  CC [M]  drivers/gpu/drm/i915/display/intel_opregion.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_config.h
  CC [M]


