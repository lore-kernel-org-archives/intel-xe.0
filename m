Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E72C47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 14:19:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA6D10E564;
	Tue, 16 Jan 2024 14:19:38 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6097610E58E;
 Tue, 16 Jan 2024 14:19:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EBuild=3A_failure_for_drm=3A_drm_debug_and_error_log?=
 =?utf-8?q?ging_improvements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Tue, 16 Jan 2024 14:19:37 -0000
Message-ID: <170541477737.502240.14473710438938457854@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <cover.1705410327.git.jani.nikula@intel.com>
In-Reply-To: <cover.1705410327.git.jani.nikula@intel.com>
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

Series: drm: drm debug and error logging improvements
URL   : https://patchwork.freedesktop.org/series/128830/
State : failure

== Summary ==

+ trap cleanup EXIT
+ cd /kernel
+ git clone https://gitlab.freedesktop.org/drm/xe/ci.git .ci
Cloning into '.ci'...
+ '[' -n '' ']'
++ date +%s
+ echo -e '\e[0Ksection_start:1705414631:build_x86_64[collapsed=true]\r\e[0KBuild x86-64'
+ mkdir -p build64-default
[0Ksection_start:1705414631:build_x86_64[collapsed=true]
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
  UPD     include/generated/uapi/linux/version.h
  WRAP    arch/x86/include/generated/uapi/asm/ipcbuf.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctls.h
  WRAP    arch/x86/include/generated/uapi/asm/param.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  WRAP    arch/x86/include/generated/uapi/asm/resource.h
  WRAP    arch/x86/include/generated/uapi/asm/socket.h
  WRAP    arch/x86/include/generated/uapi/asm/sockios.h
  WRAP    arch/x86/include/generated/uapi/asm/termios.h
  WRAP    arch/x86/include/generated/uapi/asm/termbits.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  WRAP    arch/x86/include/generated/uapi/asm/types.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_32_ia32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
  WRAP    arch/x86/include/generated/asm/early_ioremap.h
  WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
  UPD     include/config/kernel.release
  WRAP    arch/x86/include/generated/asm/irq_regs.h
  UPD     include/generated/compile.h
  WRAP    arch/x86/include/generated/asm/kmap_size.h
  HOSTCC  arch/x86/tools/relocs_32.o
  WRAP    arch/x86/include/generated/asm/local64.h
  HOSTCC  arch/x86/tools/relocs_64.o
  WRAP    arch/x86/include/generated/asm/mmiowb.h
  HOSTCC  arch/x86/tools/relocs_common.o
  HOSTCC  scripts/unifdef
  WRAP    arch/x86/include/generated/asm/module.lds.h
  WRAP    arch/x86/include/generated/asm/rwonce.h
  WRAP    arch/x86/include/generated/asm/unaligned.h
  UPD     include/generated/utsrelease.h
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/sorttable
  HOSTCC  scripts/asn1_compiler
mkdir -p /kernel/build64-default/tools/objtool && make O=/kernel/build64-default subdir=tools/objtool --no-print-directory -C objtool 
  HOSTCC  /kernel/build64-default/tools/objtool/fixdep.o
  HOSTLD  /kernel/build64-default/tools/objtool/fixdep-in.o
  LINK    /kernel/build64-default/tools/objtool/fixdep
  INSTALL /kernel/build64-default/tools/objtool/libsubcmd/include/subcmd/exec-cmd.h
  INSTALL /kernel/build64-default/tools/objtool/libsubcmd/include/subcmd/help.h
  INSTALL /kernel/build64-default/tools/objtool/libsubcmd/include/subcmd/pager.h
  INSTALL /kernel/build64-default/tools/objtool/libsubcmd/include/subcmd/parse-options.h
  INSTALL /kernel/build64-default/tools/objtool/libsubcmd/include/subcmd/run-command.h
  CC      /kernel/build64-default/tools/objtool/libsubcmd/exec-cmd.o
  CC      /kernel/build64-default/tools/objtool/libsubcmd/help.o
  CC      /kernel/build64-default/tools/objtool/libsubcmd/pager.o
  INSTALL libsubcmd_headers
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
  HDRINST usr/include/drm/i915_drm.h
  HDRINST usr/include/drm/pvr_drm.h
  HDRINST usr/include/drm/vgem_drm.h
  HDRINST usr/include/drm/virtgpu_drm.h
  HDRINST usr/include/drm/xe_drm.h
  HDRINST usr/include/drm/omap_drm.h
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
  UPD     scripts/mod/devicetable-offsets.h
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
  HDRINST usr/include/rdma/qedr-abi.h
  HDRINST usr/include/rdma/hns-abi.h
  MKELF   scripts/mod/elfconfig.h
  HDRINST usr/include/rdma/ib_user_ioctl_cmds.h
  HDRINST usr/include/rdma/vmw_pvrdma-abi.h
  HDRINST usr/include/rdma/ib_user_sa.h
  HOSTCC  scripts/mod/modpost.o
  HOSTCC  scripts/mod/file2alias.o
  HDRINST usr/include/rdma/ib_user_ioctl_verbs.h
  HOSTCC  scripts/mod/sumversion.o
  HDRINST usr/include/rdma/mlx5-abi.h
  HDRINST usr/include/rdma/rvt-abi.h
  HDRINST usr/include/rdma/rdma_netlink.h
  HOSTCC  scripts/mod/symsearch.o
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
  HDRINST usr/include/linux/netlink_diag.h
  HDRINST usr/include/linux/const.h
  HDRINST usr/include/linux/firewire-cdev.h
  HDRINST usr/include/linux/vdpa.h
  HDRINST usr/include/linux/if_infiniband.h
  HDRINST usr/include/linux/serial.h
  HDRINST usr/include/linux/iio/types.h
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
  HDRINST usr/include/linux/netfilter/xt_SECMARK.h
  HDRINST usr/include/linux/netfilter/xt_length.h
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
  HDRINST usr/include/linux/netfilter/xt_CT.h
  HDRINST usr/include/linux/netfilter/nfnetlink_cttimeout.h
  HDRINST usr/include/linux/netfilter/xt_CHECKSUM.h
  HDRINST usr/include/linux/netfilter/xt_connbytes.h
  HDRINST usr/include/linux/netfilter/xt_state.h
  HDRINST usr/include/linux/netfilter/xt_mark.h
  HDRINST usr/include/linux/netfilter/nf_tables.h
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
  HDRINST usr/include/linux/usb/g_printer.h
  HDRINST usr/include/linux/usb/midi.h
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
  HDRINST usr/include/linux/cec.h
  HDRINST usr/include/linux/kfd_ioctl.h
  HDRINST usr/include/linux/smc.h
  HDRINST usr/include/linux/qrtr.h
  HDRINST usr/include/linux/screen_info.h
  HDRINST usr/include/linux/nfsacl.h
  HDRINST usr/include/linux/seg6_hmac.h
  HDRINST usr/include/linux/gameport.h
  HDRINST usr/include/linux/wireless.h
  LD      /kernel/build64-default/tools/objtool/libsubcmd/libsubcmd-in.o
  HDRINST usr/include/linux/fdreg.h
  HDRINST usr/include/linux/cciss_defs.h
  HDRINST usr/include/linux/serial_reg.h
  HDRINST usr/include/linux/perf_event.h
  HDRINST usr/include/linux/in6.h
  HDRINST usr/include/linux/hid.h
  HDRINST usr/include/linux/netlink.h
  HDRINST usr/include/linux/fuse.h
  HDRINST usr/include/linux/magic.h
  HDRINST usr/include/linux/ioam6_iptunnel.h
  HDRINST usr/include/linux/stm.h
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
  AR      /kernel/build64-default/tools/objtool/libsubcmd/libsubcmd.a
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
  HDRINST usr/include/linux/raid/md_u.h
  HDRINST usr/include/linux/raid/md_p.h
  HDRINST usr/include/linux/zorro_ids.h
  HDRINST usr/include/linux/nbd.h
  HDRINST usr/include/linux/isst_if.h
  HDRINST usr/include/linux/unistd.h
  HDRINST usr/include/linux/rxrpc.h
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
  CC      /kernel/build64-default/tools/objtool/weak.o
  HDRINST usr/include/linux/mei.h
  CC      /kernel/build64-default/tools/objtool/check.o
  CC      /kernel/build64-default/tools/objtool/special.o
  HDRINST usr/include/linux/fsi.h
  HDRINST usr/include/linux/rds.h
  MKDIR   /kernel/build64-default/tools/objtool/arch/x86/
  CC      /kernel/build64-default/tools/objtool/builtin-check.o
  HDRINST usr/include/linux/if_x25.h
  HDRINST usr/include/linux/param.h
  HDRINST usr/include/linux/netdevice.h
  MKDIR   /kernel/build64-default/tools/objtool/arch/x86/lib/
  CC      /kernel/build64-default/tools/objtool/elf.o
  HDRINST usr/include/linux/binfmts.h
  CC      /kernel/build64-default/tools/objtool/arch/x86/special.o
  HDRINST usr/include/linux/if_pppox.h
  HDRINST usr/include/linux/sockios.h
  HDRINST usr/include/linux/kcm.h
  CC      /kernel/build64-default/tools/objtool/objtool.o
  GEN     /kernel/build64-default/tools/objtool/arch/x86/lib/inat-tables.c
  HDRINST usr/include/linux/virtio_9p.h
  CC      /kernel/build64-default/tools/objtool/orc_gen.o
  HDRINST usr/include/linux/genwqe/genwqe_card.h
  CC      /kernel/build64-default/tools/objtool/orc_dump.o
  HDRINST usr/include/linux/if_tun.h
  CC      /kernel/build64-default/tools/objtool/libstring.o
  CC      /kernel/build64-default/tools/objtool/libctype.o
  HDRINST usr/include/linux/ext4.h
  HDRINST usr/include/linux/if_ether.h
  HDRINST usr/include/linux/kvm_para.h
  CC      /kernel/build64-default/tools/objtool/str_error_r.o
  CC      /kernel/build64-default/tools/objtool/librbtree.o
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
  CC      /kernel/build64-default/tools/objtool/arch/x86/decode.o
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
  HDRINST usr/include/linux/termios.h
  HDRINST usr/include/linux/cgroupstats.h
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
  HDRINST usr/include/linux/dw100.h
  HDRINST usr/include/linux/nfsd_netlink.h
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
  HDRINST usr/include/linux/atmlec.h
  HDRINST usr/include/linux/libc-compat.h
  HDRINST usr/include/linux/signalfd.h
  HDRINST usr/include/linux/seg6_iptunnel.h
  HDRINST usr/include/linux/bpf_common.h
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
  HDRINST usr/include/linux/tipc.h
  HDRINST usr/include/linux/netfilter_arp/arp_tables.h
  HDRINST usr/include/linux/virtio_ids.h
  HDRINST usr/include/linux/l2tp.h
  HDRINST usr/include/linux/devlink.h
  HDRINST usr/include/linux/virtio_gpio.h
  HDRINST usr/include/linux/cyclades.h
  HDRINST usr/include/linux/dcbnl.h
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
  HDRINST usr/include/asm/unistd.h
  HDRINST usr/include/asm/ptrace.h
  HDRINST usr/include/asm/ist.h
  HDRINST usr/include/asm/prctl.h
  HDRINST usr/include/asm/boot.h
  HDRINST usr/include/asm/posix_types_32.h
  HDRINST usr/include/asm/sigcontext.h
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
  HDRINST usr/include/asm/sgx.h
  HDRINST usr/include/asm/sembuf.h
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
  UPD     include/generated/bounds.h
  CC      arch/x86/kernel/asm-offsets.s
  LD      /kernel/build64-default/tools/objtool/arch/x86/objtool-in.o
  UPD     include/generated/asm-offsets.h
  CALL    ../scripts/checksyscalls.sh
  LD      /kernel/build64-default/tools/objtool/objtool-in.o
  LINK    /kernel/build64-default/tools/objtool/objtool
  LDS     scripts/module.lds
  HOSTCC  usr/gen_init_cpio
  AR      certs/built-in.a
  CC      init/main.o
  CC      init/do_mounts.o
  UPD     init/utsversion-tmp.h
  CC      init/do_mounts_initrd.o
  CC      ipc/compat.o
  CC      security/commoncap.o
  CC      init/initramfs.o
  CC      mm/filemap.o
  AS      arch/x86/lib/clear_page_64.o
  AR      arch/x86/video/built-in.a
  CC      ipc/util.o
  CC      init/calibrate.o
  CC      arch/x86/realmode/init.o
  CC      io_uring/io_uring.o
  CC      block/bdev.o
  CC      arch/x86/power/cpu.o
  AR      arch/x86/virt/vmx/built-in.a
  AR      arch/x86/net/built-in.a
  AR      arch/x86/ia32/built-in.a
  CC      block/partitions/core.o
  CC      fs/nfs_common/grace.o
  CC [M]  arch/x86/video/fbdev.o
  CC      arch/x86/pci/i386.o
  AS      arch/x86/crypto/aesni-intel_asm.o
  CC      fs/kernfs/mount.o
  AR      virt/lib/built-in.a
  CC      arch/x86/entry/vsyscall/vsyscall_64.o
  AR      fs/quota/built-in.a
  CC      net/core/sock.o
  CC      security/keys/gc.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/kvm_main.o
  AR      drivers/cache/built-in.a
  CC      net/llc/llc_core.o
  CC      arch/x86/events/amd/core.o
  CC      arch/x86/mm/pat/set_memory.o
  AR      arch/x86/platform/atom/built-in.a
  CC      security/keys/key.o
  CC      fs/sysfs/file.o
  CC      sound/core/seq/seq.o
  CC      fs/iomap/trace.o
  AR      sound/drivers/opl3/built-in.a
  CC [M]  virt/lib/irqbypass.o
  CC      arch/x86/kernel/fpu/init.o
  AR      sound/isa/ad1816a/built-in.a
  AR      arch/x86/virt/built-in.a
  AR      sound/i2c/other/built-in.a
  CC      fs/sysfs/dir.o
  CC      fs/notify/dnotify/dnotify.o
  CC      arch/x86/lib/cmdline.o
  AR      drivers/irqchip/built-in.a
  AR      sound/i2c/built-in.a
  CC      arch/x86/entry/vdso/vma.o
  AR      sound/drivers/opl4/built-in.a
  AR      arch/x86/platform/ce4100/built-in.a
  CC      fs/kernfs/inode.o
  AR      drivers/bus/mhi/built-in.a
  AR      sound/isa/ad1848/built-in.a
  CC      lib/kunit/hooks.o
  AR      sound/isa/cs423x/built-in.a
  CC      fs/notify/inotify/inotify_fsnotify.o
  AR      sound/drivers/vx/built-in.a
  AR      drivers/bus/built-in.a
  AR      sound/drivers/mpu401/built-in.a
  CC      kernel/sched/core.o
  CC      arch/x86/platform/efi/memmap.o
  AR      sound/isa/es1688/built-in.a
  CC      arch/x86/crypto/aesni-intel_glue.o
  CC      block/fops.o
  AR      sound/isa/galaxy/built-in.a
  AR      sound/drivers/pcsp/built-in.a
  CC      crypto/api.o
  AR      sound/drivers/built-in.a
  AR      sound/isa/gus/built-in.a
  AR      drivers/phy/allwinner/built-in.a
  AR      sound/isa/msnd/built-in.a
  AR      drivers/phy/amlogic/built-in.a
  AR      drivers/pinctrl/actions/built-in.a
  AR      sound/isa/opti9xx/built-in.a
  CC      fs/proc/task_mmu.o
  AR      drivers/phy/broadcom/built-in.a
  AR      drivers/pinctrl/bcm/built-in.a
  AR      sound/isa/sb/built-in.a
  AS      arch/x86/lib/cmpxchg16b_emu.o
  AR      sound/isa/wavefront/built-in.a
  AR      drivers/phy/cadence/built-in.a
  AR      drivers/pinctrl/cirrus/built-in.a
  AR      drivers/phy/freescale/built-in.a
  AR      sound/isa/wss/built-in.a
  CC      arch/x86/lib/copy_mc.o
  AR      drivers/pinctrl/freescale/built-in.a
  AR      sound/isa/built-in.a
  AR      drivers/phy/hisilicon/built-in.a
  CC      drivers/pinctrl/intel/pinctrl-baytrail.o
  CC      lib/math/div64.o
  AR      drivers/phy/ingenic/built-in.a
  AR      drivers/phy/intel/built-in.a
  AR      drivers/phy/lantiq/built-in.a
  AR      drivers/phy/marvell/built-in.a
  CC [M]  lib/kunit/test.o
  CC      lib/math/gcd.o
  AR      drivers/phy/mediatek/built-in.a
  GEN     usr/initramfs_data.cpio
  AR      drivers/phy/microchip/built-in.a
  COPY    usr/initramfs_inc_data
  AS      usr/initramfs_data.o
  AR      drivers/phy/motorola/built-in.a
  CC      lib/math/lcm.o
  AR      drivers/phy/mscc/built-in.a
  AR      usr/built-in.a
  AR      drivers/phy/qualcomm/built-in.a
  CC      lib/math/int_log.o
  AR      drivers/phy/ralink/built-in.a
  CC      net/ethernet/eth.o
  AR      drivers/phy/renesas/built-in.a
  AR      drivers/phy/rockchip/built-in.a
  CC      arch/x86/kernel/fpu/bugs.o
  CC      arch/x86/kernel/fpu/core.o
  AR      drivers/phy/samsung/built-in.a
  AR      drivers/phy/socionext/built-in.a
  AR      drivers/phy/st/built-in.a
  CC      lib/math/int_pow.o
  AR      drivers/phy/starfive/built-in.a
  AR      drivers/phy/sunplus/built-in.a
  AR      drivers/phy/tegra/built-in.a
  CC      lib/math/int_sqrt.o
  AS      arch/x86/lib/copy_mc_64.o
  AR      drivers/phy/ti/built-in.a
  AS      arch/x86/lib/copy_page_64.o
  AR      drivers/phy/xilinx/built-in.a
  AR      drivers/pinctrl/mediatek/built-in.a
  CC      drivers/phy/phy-core.o
  CC      fs/proc/inode.o
  AS      arch/x86/lib/copy_user_64.o
  CC      security/keys/keyring.o
  CC      fs/notify/inotify/inotify_user.o
  CC      sound/core/seq/seq_lock.o
  CC      lib/math/reciprocal_div.o
  AR      virt/built-in.a
  AS      arch/x86/lib/copy_user_uncached_64.o
  CC      sound/core/sound.o
  CC      arch/x86/lib/cpu.o
  AS      arch/x86/realmode/rm/header.o
  AS      arch/x86/realmode/rm/trampoline_64.o
  CC      lib/math/rational.o
  AS      arch/x86/realmode/rm/stack.o
  CC      ipc/msgutil.o
  CC      fs/notify/fanotify/fanotify.o
  AS      arch/x86/realmode/rm/reboot.o
  AR      fs/notify/dnotify/built-in.a
  CC      fs/notify/fsnotify.o
  CC      fs/sysfs/symlink.o
  CC      net/802/p8022.o
  CC      arch/x86/pci/init.o
  AS      arch/x86/realmode/rm/wakeup_asm.o
  AR      fs/nfs_common/built-in.a
  CC      net/sched/sch_generic.o
  CC      fs/notify/notification.o
  CC      arch/x86/realmode/rm/wakemain.o
  AS      arch/x86/entry/vsyscall/vsyscall_emu_64.o
  CC      fs/kernfs/dir.o
  CC      net/sched/sch_mq.o
  CC      net/llc/llc_input.o
  CC      arch/x86/realmode/rm/video-mode.o
  AR      arch/x86/entry/vsyscall/built-in.a
  CC      arch/x86/platform/efi/quirks.o
  CC      fs/kernfs/file.o
  CC      net/802/psnap.o
  CC      arch/x86/entry/vdso/extable.o
  CC      arch/x86/entry/vdso/vdso32-setup.o
  CC      arch/x86/power/hibernate_64.o
  CC      block/partitions/ldm.o
  CC      crypto/cipher.o
  AS      arch/x86/realmode/rm/copy.o
  AS      arch/x86/realmode/rm/bioscall.o
  CC      arch/x86/realmode/rm/regs.o
  AS      arch/x86/crypto/aesni-intel_avx-x86_64.o
  CC      arch/x86/events/amd/lbr.o
  CC [M]  lib/kunit/resource.o
  CC      fs/iomap/iter.o
  CC      arch/x86/realmode/rm/video-vga.o
  AS      arch/x86/power/hibernate_asm_64.o
  CC      fs/kernfs/symlink.o
  CC      sound/core/seq/seq_clientmgr.o
  CC      block/bio.o
  AS      arch/x86/lib/csum-copy_64.o
  CC      arch/x86/realmode/rm/video-vesa.o
  CC      block/elevator.o
  AR      sound/pci/ac97/built-in.a
  CC      drivers/pinctrl/intel/pinctrl-intel.o
  CC      arch/x86/lib/csum-partial_64.o
  AR      sound/pci/ali5451/built-in.a
  CC [M]  lib/math/prime_numbers.o
  AR      sound/pci/asihpi/built-in.a
  CC      block/blk-core.o
  CC      arch/x86/power/hibernate.o
  AR      sound/pci/au88x0/built-in.a
  CC      arch/x86/realmode/rm/video-bios.o
  CC      arch/x86/lib/csum-wrappers_64.o
  AR      sound/pci/aw2/built-in.a
  CC      ipc/msg.o
  AS      arch/x86/crypto/aes_ctrby8_avx-x86_64.o
  AR      sound/pci/ctxfi/built-in.a
  AR      sound/pci/ca0106/built-in.a
  PASYMS  arch/x86/realmode/rm/pasyms.h
  AR      sound/pci/cs46xx/built-in.a
  LDS     arch/x86/realmode/rm/realmode.lds
  CC      fs/sysfs/mount.o
  LD      arch/x86/realmode/rm/realmode.elf
  AR      sound/pci/cs5535audio/built-in.a
  RELOCS  arch/x86/realmode/rm/realmode.relocs
  OBJCOPY arch/x86/realmode/rm/realmode.bin
  AS      arch/x86/realmode/rmpiggy.o
  AR      sound/pci/lola/built-in.a
  CC      arch/x86/lib/delay.o
  AR      arch/x86/realmode/built-in.a
  AR      sound/pci/lx6464es/built-in.a
  CC      arch/x86/pci/mmconfig_64.o
  AS [M]  arch/x86/crypto/ghash-clmulni-intel_asm.o
  CC      fs/proc/root.o
  CC      fs/sysfs/group.o
  AR      sound/pci/echoaudio/built-in.a
  CC [M]  arch/x86/crypto/ghash-clmulni-intel_glue.o
  AS      arch/x86/lib/getuser.o
  AR      sound/pci/emu10k1/built-in.a
  AR      sound/pci/hda/built-in.a
  CC [M]  sound/pci/hda/hda_bind.o
  CC      net/802/stp.o
  CC [M]  sound/pci/hda/hda_codec.o
  CC      init/init_task.o
  CC      arch/x86/mm/pat/memtype.o
  CC      fs/iomap/buffered-io.o
  AR      fs/notify/inotify/built-in.a
  CC [M]  sound/pci/hda/hda_jack.o
  CC      fs/notify/group.o
  AR      drivers/phy/built-in.a
  CC      crypto/compress.o
  CC      security/min_addr.o
  LDS     arch/x86/entry/vdso/vdso.lds
  AR      net/ethernet/built-in.a
  AS      arch/x86/entry/vdso/vdso-note.o
  CC      arch/x86/kernel/fpu/regset.o
  CC [M]  sound/pci/hda/hda_auto_parser.o
  CC      arch/x86/entry/vdso/vclock_gettime.o
  CC      net/llc/llc_output.o
  CC      fs/notify/fanotify/fanotify_user.o
  CC [M]  lib/kunit/static_stub.o
  CC [M]  sound/pci/hda/hda_sysfs.o
  CC      security/keys/keyctl.o
  GEN     arch/x86/lib/inat-tables.c
  CC      arch/x86/lib/insn-eval.o
  CC      arch/x86/kernel/fpu/signal.o
  CC      init/version.o
  CC      security/inode.o
  CC      arch/x86/platform/efi/efi.o
  CC      net/netlink/af_netlink.o
  CC      fs/proc/base.o
  CC      arch/x86/events/amd/ibs.o
  AR      lib/math/built-in.a
  CC      net/netlink/genetlink.o
  AR      fs/kernfs/built-in.a
  AR      net/bpf/built-in.a
  CC      arch/x86/events/intel/core.o
  CC      arch/x86/events/intel/bts.o
  AR      arch/x86/power/built-in.a
  CC      net/ethtool/ioctl.o
  CC      block/partitions/msdos.o
  AS [M]  arch/x86/crypto/crc32-pclmul_asm.o
  CC      net/sched/sch_frag.o
  CC [M]  arch/x86/crypto/crc32-pclmul_glue.o
  CC      fs/proc/generic.o
  AR      fs/sysfs/built-in.a
  CC      net/ethtool/common.o
  CC      arch/x86/pci/direct.o
  CC      net/ethtool/netlink.o
  AR      init/built-in.a
  CC      arch/x86/entry/vdso/vgetcpu.o
  CC      crypto/algapi.o
  CC [M]  lib/kunit/string-stream.o
  CC      arch/x86/events/intel/ds.o
  HOSTCC  arch/x86/entry/vdso/vdso2c
  AR      sound/pci/ice1712/built-in.a
  LDS     arch/x86/entry/vdso/vdso32/vdso32.lds
  AS      arch/x86/entry/vdso/vdso32/note.o
  AR      net/802/built-in.a
  CC      block/blk-sysfs.o
  CC      fs/configfs/inode.o
  CC      fs/devpts/inode.o
  CC      fs/configfs/file.o
  CC      fs/proc/array.o
  CC      fs/proc/fd.o
  CC [M]  sound/pci/hda/hda_controller.o
  CC      arch/x86/mm/pat/memtype_interval.o
  CC      sound/core/seq/seq_memory.o
  CC [M]  drivers/pinctrl/intel/pinctrl-cherryview.o
  CC [M]  drivers/pinctrl/intel/pinctrl-broxton.o
  AR      net/llc/built-in.a
  CC      ipc/sem.o
  CC      sound/core/init.o
  CC      fs/iomap/direct-io.o
  CC      arch/x86/lib/insn.o
  CC      arch/x86/kernel/fpu/xstate.o
  AS      arch/x86/entry/vdso/vdso32/system_call.o
  CC [M]  sound/pci/hda/hda_proc.o
  AS [M]  arch/x86/crypto/crct10dif-pcl-asm_64.o
  AS      arch/x86/entry/vdso/vdso32/sigreturn.o
  CC [M]  arch/x86/crypto/crct10dif-pclmul_glue.o
  CC      arch/x86/entry/vdso/vdso32/vclock_gettime.o
  CC      net/sched/sch_api.o
  CC      arch/x86/platform/efi/efi_64.o
  CC [M]  lib/kunit/assert.o
  CC      arch/x86/pci/mmconfig-shared.o
  CC      block/blk-flush.o
  CC      security/keys/permission.o
  AS      arch/x86/lib/memcpy_64.o
  CC      arch/x86/events/intel/knc.o
  AS      arch/x86/lib/memmove_64.o
  CC [M]  lib/kunit/try-catch.o
  CC      arch/x86/events/amd/uncore.o
  AS      arch/x86/lib/memset_64.o
  CC      block/partitions/efi.o
  CC      arch/x86/lib/misc.o
  CC      sound/core/seq/seq_queue.o
  AR      arch/x86/mm/pat/built-in.a
  CC      arch/x86/mm/init.o
  CC      arch/x86/lib/pc-conf-reg.o
  CC      fs/ext4/balloc.o
  CC      fs/jbd2/transaction.o
  CC      fs/configfs/dir.o
  AR      fs/notify/fanotify/built-in.a
  CC      fs/notify/mark.o
  AR      fs/devpts/built-in.a
  CC      fs/ext4/bitmap.o
  CC      net/core/request_sock.o
  CC      net/core/skbuff.o
  CC      net/core/datagram.o
  LD [M]  arch/x86/crypto/ghash-clmulni-intel.o
  AS      arch/x86/lib/putuser.o
  LD [M]  arch/x86/crypto/crc32-pclmul.o
  LD [M]  arch/x86/crypto/crct10dif-pclmul.o
  CC      security/device_cgroup.o
  AS      arch/x86/lib/retpoline.o
  CC      drivers/gpio/gpiolib.o
  AR      arch/x86/crypto/built-in.a
  CC      net/core/stream.o
  CC      arch/x86/lib/usercopy.o
  CC      arch/x86/entry/vdso/vdso32/vgetcpu.o
  CC      drivers/gpio/gpiolib-devres.o
  CC      arch/x86/kernel/cpu/mce/core.o
  CC      drivers/gpio/gpiolib-legacy.o
  CC      arch/x86/kernel/acpi/boot.o
  CC      drivers/gpio/gpiolib-cdev.o
  CC      crypto/scatterwalk.o
  CC      arch/x86/kernel/cpu/mtrr/mtrr.o
  CC      mm/mempool.o
  CC      security/keys/process_keys.o
  CC [M]  lib/kunit/executor.o
  CC      sound/core/memory.o
  CC [M]  drivers/pinctrl/intel/pinctrl-geminilake.o
  VDSO    arch/x86/entry/vdso/vdso64.so.dbg
  CC      arch/x86/kernel/cpu/mtrr/if.o
  VDSO    arch/x86/entry/vdso/vdso32.so.dbg
  OBJCOPY arch/x86/entry/vdso/vdso64.so
  OBJCOPY arch/x86/entry/vdso/vdso32.so
  VDSO2C  arch/x86/entry/vdso/vdso-image-64.c
  VDSO2C  arch/x86/entry/vdso/vdso-image-32.c
  CC      arch/x86/entry/vdso/vdso-image-64.o
  CC      fs/iomap/fiemap.o
  CC      arch/x86/lib/usercopy_64.o
  AS      arch/x86/platform/efi/efi_stub_64.o
  CC      net/core/scm.o
  CC      net/core/gen_stats.o
  AR      arch/x86/platform/efi/built-in.a
  CC [M]  sound/pci/hda/hda_hwdep.o
  AR      arch/x86/platform/geode/built-in.a
  CC      sound/core/seq/seq_fifo.o
  AR      arch/x86/platform/iris/built-in.a
  CC      arch/x86/platform/intel/iosf_mbi.o
  CC      block/blk-settings.o
  CC      arch/x86/entry/vdso/vdso-image-32.o
  CC      arch/x86/pci/fixup.o
  CC      arch/x86/pci/acpi.o
  AR      arch/x86/kernel/fpu/built-in.a
  CC      arch/x86/lib/msr-smp.o
  AS      arch/x86/entry/entry.o
  AR      block/partitions/built-in.a
  AR      sound/pci/korg1212/built-in.a
  CC      block/blk-ioc.o
  AR      sound/pci/mixart/built-in.a
  CC      block/blk-map.o
  CC      net/netlink/policy.o
  CC      sound/core/seq/seq_prioq.o
  AR      arch/x86/events/amd/built-in.a
  CC      fs/proc/proc_tty.o
  AR      arch/x86/platform/intel-mid/built-in.a
  AR      arch/x86/entry/vdso/built-in.a
  CC      arch/x86/events/zhaoxin/core.o
  AS      arch/x86/entry/entry_64.o
  CC      arch/x86/mm/init_64.o
  CC      crypto/proc.o
  CC      fs/notify/fdinfo.o
  CC [M]  lib/kunit/attributes.o
  CC [M]  drivers/pinctrl/intel/pinctrl-sunrisepoint.o
  CC      arch/x86/lib/cache-smp.o
  CC      net/core/gen_estimator.o
  CC      arch/x86/entry/syscall_64.o
  CC      io_uring/xattr.o
  CC      sound/core/seq/seq_timer.o
  CC      arch/x86/entry/common.o
  CC      fs/configfs/symlink.o
  CC      fs/iomap/seek.o
  CC      arch/x86/kernel/cpu/mtrr/generic.o
  CC      net/ethtool/bitset.o
  CC      mm/oom_kill.o
  CC      fs/configfs/mount.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/eventfd.o
  CC      arch/x86/lib/msr.o
  CC      ipc/shm.o
  CC      arch/x86/kernel/cpu/mce/severity.o
  CC      arch/x86/kernel/acpi/sleep.o
  CC [M]  sound/pci/hda/hda_generic.o
  CC      security/keys/request_key.o
  CC      arch/x86/mm/fault.o
  AR      arch/x86/platform/intel/built-in.a
  CC [M]  net/netfilter/ipvs/ip_vs_conn.o
  CC      arch/x86/mm/ioremap.o
  AR      arch/x86/platform/intel-quark/built-in.a
  AR      arch/x86/platform/olpc/built-in.a
  AR      arch/x86/platform/scx200/built-in.a
  CC      net/netfilter/core.o
  AR      arch/x86/platform/ts5500/built-in.a
  AR      arch/x86/platform/uv/built-in.a
  AR      arch/x86/platform/built-in.a
  CC      arch/x86/events/intel/lbr.o
  CC      fs/ext4/block_validity.o
  CC      fs/jbd2/commit.o
  CC      fs/jbd2/recovery.o
  CC      kernel/sched/fair.o
  CC      fs/jbd2/checkpoint.o
  CC      crypto/aead.o
  AR      lib/kunit/built-in.a
  CC      fs/proc/cmdline.o
  LD [M]  lib/kunit/kunit.o
  AR      drivers/pinctrl/intel/built-in.a
  CC      net/core/net_namespace.o
  AR      drivers/pinctrl/mvebu/built-in.a
  CC      net/sched/sch_blackhole.o
  AR      fs/notify/built-in.a
  CC      lib/crypto/memneq.o
  AR      drivers/pinctrl/nomadik/built-in.a
  CC      lib/crypto/utils.o
  AR      drivers/pinctrl/nuvoton/built-in.a
  CC      arch/x86/pci/legacy.o
  AR      drivers/pinctrl/nxp/built-in.a
  AR      drivers/pinctrl/qcom/built-in.a
  CC      net/netlink/diag.o
  AR      drivers/pinctrl/sprd/built-in.a
  AR      drivers/pinctrl/sunplus/built-in.a
  CC      lib/crypto/chacha.o
  AR      drivers/pinctrl/ti/built-in.a
  CC      drivers/pinctrl/core.o
  CC      net/sched/sch_fifo.o
  CC      block/blk-merge.o
  CC      sound/core/seq/seq_system.o
  CC      fs/jbd2/revoke.o
  CC      crypto/geniv.o
  CC      security/keys/request_key_auth.o
  AR      arch/x86/events/zhaoxin/built-in.a
  CC      net/core/secure_seq.o
  CC      fs/configfs/item.o
  AS      arch/x86/entry/thunk_64.o
  CC      net/core/flow_dissector.o
  CC      arch/x86/kernel/cpu/mce/genpool.o
  AS      arch/x86/entry/entry_64_compat.o
  CC      crypto/lskcipher.o
  CC      fs/iomap/swapfile.o
  CC      arch/x86/entry/syscall_32.o
  CC      io_uring/nop.o
  AS      arch/x86/kernel/acpi/wakeup_64.o
  CC      drivers/gpio/gpiolib-sysfs.o
  CC      fs/jbd2/journal.o
  CC      arch/x86/kernel/acpi/apei.o
  AS      arch/x86/lib/msr-reg.o
  CC      arch/x86/lib/msr-reg-export.o
  CC      fs/proc/consoles.o
  CC      fs/proc/cpuinfo.o
  CC      arch/x86/kernel/cpu/mtrr/cleanup.o
  CC      lib/crypto/aes.o
  AS      arch/x86/lib/hweight.o
  CC      arch/x86/lib/iomem.o
  CC      fs/ramfs/inode.o
  CC      arch/x86/pci/irq.o
  CC      fs/ramfs/file-mmu.o
  CC      sound/core/seq/seq_ports.o
  CC      sound/core/seq/seq_info.o
  CC      net/ethtool/strset.o
  CC      fs/ext4/dir.o
  AR      fs/configfs/built-in.a
  CC      arch/x86/mm/extable.o
  CC      security/keys/user_defined.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/binary_stats.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/vfio.o
  CC      arch/x86/kernel/cpu/mce/intel.o
  CC      arch/x86/pci/common.o
  CC      net/ethtool/linkinfo.o
  CC      arch/x86/kernel/acpi/cppc.o
  CC      crypto/skcipher.o
  CC      drivers/gpio/gpiolib-acpi.o
  AR      arch/x86/entry/built-in.a
  CC      arch/x86/events/intel/p4.o
  CC      arch/x86/mm/mmap.o
  CC      net/ethtool/linkmodes.o
  CC      arch/x86/mm/pgtable.o
  AR      net/sched/built-in.a
  CC      ipc/syscall.o
  AR      fs/iomap/built-in.a
  CC      arch/x86/events/intel/p6.o
  AR      net/ipv4/netfilter/built-in.a
  CC      fs/hugetlbfs/inode.o
  CC [M]  net/ipv4/netfilter/nf_defrag_ipv4.o
  AR      net/netlink/built-in.a
  CC      arch/x86/events/intel/pt.o
  CC      fs/proc/devices.o
  CC      fs/proc/interrupts.o
  AS      arch/x86/lib/iomap_copy_64.o
  CC      arch/x86/lib/inat.o
  CC      arch/x86/mm/physaddr.o
  CC      fs/proc/loadavg.o
  CC      io_uring/fs.o
  CC      kernel/sched/build_policy.o
  CC      lib/crypto/gf128mul.o
  CC      arch/x86/kernel/acpi/cstate.o
  AR      arch/x86/lib/built-in.a
  CC      ipc/ipc_sysctl.o
  AR      arch/x86/lib/lib.a
  CC      drivers/gpio/gpiolib-swnode.o
  CC      drivers/pinctrl/pinctrl-utils.o
  CC      fs/proc/meminfo.o
  CC      net/netfilter/nf_log.o
  CC      mm/fadvise.o
  AR      fs/ramfs/built-in.a
  CC      net/core/sysctl_net_core.o
  CC [M]  sound/pci/hda/patch_realtek.o
  CC      security/keys/compat.o
  CC [M]  net/netfilter/ipvs/ip_vs_core.o
  CC      io_uring/splice.o
  AR      arch/x86/kernel/cpu/mtrr/built-in.a
  AR      sound/core/seq/built-in.a
  CC      ipc/mqueue.o
  CC      sound/core/control.o
  CC      block/blk-timeout.o
  CC      block/blk-lib.o
  CC      arch/x86/mm/tlb.o
  CC      arch/x86/kernel/cpu/mce/threshold.o
  CC      fs/proc/stat.o
  CC      io_uring/sync.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/coalesced_mmio.o
  CC      fs/proc/uptime.o
  CC      net/ipv4/route.o
  CC      arch/x86/kernel/apic/apic.o
  CC      arch/x86/pci/early.o
  CC      fs/ext4/ext4_jbd2.o
  CC      arch/x86/pci/bus_numa.o
  CC      drivers/pinctrl/pinmux.o
  CC      arch/x86/pci/amd_bus.o
  CC      net/ipv4/inetpeer.o
  CC      io_uring/advise.o
  CC      net/ethtool/rss.o
  CC      arch/x86/events/intel/uncore.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/async_pf.o
  CC      net/ipv4/protocol.o
  CC      lib/crypto/blake2s.o
  CC      lib/crypto/blake2s-generic.o
  AR      arch/x86/kernel/acpi/built-in.a
  CC [M]  net/ipv4/netfilter/nf_reject_ipv4.o
  CC      fs/ext4/extents.o
  AR      drivers/gpio/built-in.a
  CC      crypto/seqiv.o
  CC      crypto/echainiv.o
  CC [M]  sound/pci/hda/patch_analog.o
  CC      fs/proc/util.o
  CC      net/ipv4/ip_input.o
  CC      arch/x86/events/intel/uncore_nhmex.o
  CC      mm/maccess.o
  CC      security/keys/proc.o
  CC [M]  net/ipv4/netfilter/ip_tables.o
  CC      crypto/ahash.o
  CC      io_uring/filetable.o
  CC      block/blk-mq.o
  CC      net/ethtool/linkstate.o
  CC      fs/ext4/extents_status.o
  AR      fs/hugetlbfs/built-in.a
  CC [M]  net/ipv4/netfilter/iptable_filter.o
  CC      arch/x86/kernel/kprobes/core.o
  CC [M]  net/ipv4/netfilter/iptable_mangle.o
  CC      arch/x86/kernel/kprobes/opt.o
  CC      arch/x86/events/intel/uncore_snb.o
  CC      lib/crypto/blake2s-selftest.o
  CC      arch/x86/kernel/cpu/mce/apei.o
  CC      mm/page-writeback.o
  CC      fs/fat/cache.o
  CC      drivers/pinctrl/pinconf.o
  AR      arch/x86/pci/built-in.a
  CC      mm/folio-compat.o
  CC      arch/x86/events/intel/uncore_snbep.o
  CC      fs/proc/version.o
  CC      fs/fat/dir.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/irqchip.o
  CC      arch/x86/mm/cpu_entry_area.o
  CC      arch/x86/mm/maccess.o
  CC      crypto/shash.o
  CC      lib/crypto/des.o
  AR      fs/jbd2/built-in.a
  CC      net/netfilter/nf_queue.o
  CC [M]  sound/pci/hda/patch_hdmi.o
  CC      fs/proc/softirqs.o
  CC      fs/fat/fatent.o
  CC      security/keys/sysctl.o
  CC      drivers/pinctrl/pinconf-generic.o
  CC [M]  net/ipv4/netfilter/iptable_nat.o
  CC      mm/readahead.o
  CC      net/core/dev.o
  CC      net/ipv4/ip_fragment.o
  CC      ipc/namespace.o
  CC      fs/nfs/client.o
  CC      sound/core/misc.o
  CC      sound/core/device.o
  CC      fs/exportfs/expfs.o
  AR      arch/x86/kernel/cpu/mce/built-in.a
  CC      arch/x86/kernel/cpu/microcode/core.o
  CC      sound/core/info.o
  CC      fs/lockd/clntlock.o
  CC      fs/nls/nls_base.o
  CC      fs/lockd/clntproc.o
  CC      arch/x86/kernel/kprobes/ftrace.o
  CC      net/ethtool/debug.o
  CC      fs/lockd/clntxdr.o
  CC      fs/proc/namespaces.o
  CC      arch/x86/kernel/apic/apic_common.o
  CC      arch/x86/mm/pgprot.o
  CC      io_uring/openclose.o
  AR      sound/ppc/built-in.a
  CC      arch/x86/mm/hugetlbpage.o
  CC      arch/x86/mm/numa.o
  CC      net/ipv4/ip_forward.o
  AR      security/keys/built-in.a
  AR      security/built-in.a
  CC      arch/x86/kernel/cpu/cacheinfo.o
  CC      net/ipv4/ip_options.o
  AR      sound/pci/nm256/built-in.a
  CC      fs/lockd/host.o
  CC [M]  net/ipv4/netfilter/ipt_REJECT.o
  CC [M]  net/netfilter/ipvs/ip_vs_ctl.o
  AR      drivers/pinctrl/built-in.a
  AR      drivers/pwm/built-in.a
  CC      drivers/pci/msi/pcidev_msi.o
  CC      crypto/akcipher.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/dirty_ring.o
  CC      ipc/mq_sysctl.o
  CC      lib/crypto/sha1.o
  CC      drivers/pci/msi/api.o
  CC      crypto/sig.o
  AR      fs/unicode/built-in.a
  CC      fs/proc/self.o
  AR      fs/exportfs/built-in.a
  AR      sound/pci/oxygen/built-in.a
  AR      sound/arm/built-in.a
  AR      sound/sh/built-in.a
  CC      fs/ntfs/aops.o
  AR      sound/pci/pcxhr/built-in.a
  CC      arch/x86/kernel/cpu/microcode/intel.o
  CC      fs/nls/nls_cp437.o
  CC      arch/x86/kernel/cpu/microcode/amd.o
  CC      fs/ext4/file.o
  CC      arch/x86/events/core.o
  CC      fs/proc/thread_self.o
  AR      arch/x86/kernel/kprobes/built-in.a
  CC      fs/ntfs/attrib.o
  CC      arch/x86/kernel/apic/apic_noop.o
  LDS     arch/x86/kernel/vmlinux.lds
  CC      fs/fat/file.o
  CC      mm/swap.o
  CC      sound/core/isadma.o
  AR      ipc/built-in.a
  CC      net/ipv4/ip_output.o
  CC      fs/proc/proc_sysctl.o
  CC [M]  sound/pci/hda/hda_eld.o
  CC      mm/truncate.o
  CC      block/blk-mq-tag.o
  AR      sound/synth/emux/built-in.a
  CC      arch/x86/mm/numa_64.o
  AR      sound/synth/built-in.a
  CC      arch/x86/kernel/apic/ipi.o
  CC      lib/crypto/sha256.o
  CC      net/ethtool/wol.o
  CC      block/blk-stat.o
  CC      fs/lockd/svc.o
  CC      fs/proc/proc_net.o
  CC      net/netfilter/nf_sockopt.o
  CC      fs/nls/nls_ascii.o
  CC      drivers/pci/msi/msi.o
  CC      net/netfilter/utils.o
  CC      crypto/kpp.o
  CC      fs/proc/kcore.o
  CC      arch/x86/mm/amdtopology.o
  CC      io_uring/uring_cmd.o
  CC      arch/x86/kernel/apic/vector.o
  CC      fs/nls/nls_iso8859-1.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/pfncache.o
  CC      arch/x86/kernel/apic/init.o
  CC      arch/x86/mm/srat.o
  CC      kernel/locking/mutex.o
  CC      sound/core/vmaster.o
  CC      net/ipv4/ip_sockglue.o
  CC      sound/core/ctljack.o
  CC [M]  net/netfilter/nfnetlink.o
  CC      arch/x86/events/intel/uncore_discovery.o
  CC      net/xfrm/xfrm_policy.o
  CC      arch/x86/kernel/apic/hw_nmi.o
  AR      arch/x86/kernel/cpu/microcode/built-in.a
  CC      fs/nfs/dir.o
  CC      net/xfrm/xfrm_state.o
  CC      arch/x86/kernel/cpu/scattered.o
  CC      net/xfrm/xfrm_hash.o
  CC      crypto/acompress.o
  CC      net/core/dev_addr_lists.o
  CC      arch/x86/kernel/apic/io_apic.o
  CC      fs/ntfs/collate.o
  CC      net/core/dst.o
  CC      fs/fat/inode.o
  CC [M]  lib/crypto/arc4.o
  AR      sound/pci/riptide/built-in.a
  CC      fs/ext4/fsmap.o
  CC [M]  sound/pci/hda/hda_intel.o
  CC      fs/nls/nls_utf8.o
  CC      mm/vmscan.o
  CC      block/blk-mq-sysfs.o
  CC      arch/x86/kernel/apic/msi.o
  CC      mm/shrinker.o
  AR      sound/pci/rme9652/built-in.a
  CC      fs/fat/misc.o
  CC      net/unix/af_unix.o
  CC      fs/fat/nfs.o
  CC      arch/x86/mm/pkeys.o
  CC      arch/x86/kernel/apic/x2apic_phys.o
  CC      net/ethtool/features.o
  CC      arch/x86/kernel/cpu/topology.o
  CC      arch/x86/mm/pti.o
  CC      sound/core/jack.o
  CC      drivers/pci/msi/irqdomain.o
  CC      fs/proc/kmsg.o
  CC      kernel/sched/build_utility.o
  CC      arch/x86/events/probe.o
  CC      fs/proc/page.o
  CC      drivers/video/console/dummycon.o
  AR      lib/crypto/built-in.a
  LD [M]  lib/crypto/libarc4.o
  CC      fs/ntfs/compress.o
  CC      lib/zlib_inflate/inffast.o
  CC [M]  arch/x86/kvm/x86.o
  CC      lib/zlib_inflate/inflate.o
  CC [M]  fs/nls/nls_ucs2_utils.o
  CC      crypto/scompress.o
  CC      lib/zlib_inflate/infutil.o
  CC      fs/lockd/svclock.o
  CC      arch/x86/events/intel/cstate.o
  CC      lib/zlib_inflate/inftrees.o
  CC      io_uring/epoll.o
  CC      drivers/video/logo/logo.o
  CC      fs/ntfs/debug.o
  CC      io_uring/statx.o
  CC      net/unix/garbage.o
  CC      block/blk-mq-cpumap.o
  CC      arch/x86/kernel/cpu/common.o
  CC      lib/zlib_inflate/inflate_syms.o
  CC      fs/fat/namei_vfat.o
  CC      arch/x86/events/utils.o
  AR      net/ipv6/netfilter/built-in.a
  CC [M]  net/ipv6/netfilter/nf_defrag_ipv6_hooks.o
  CC      block/blk-mq-sched.o
  CC      net/packet/af_packet.o
  CC      block/ioctl.o
  CC      mm/shmem.o
  CC      mm/util.o
  CC      arch/x86/kernel/apic/x2apic_cluster.o
  CC [M]  net/netfilter/nf_conntrack_core.o
  CC      sound/core/timer.o
  CC [M]  net/netfilter/ipvs/ip_vs_sched.o
  CC      drivers/video/console/vgacon.o
  AR      arch/x86/mm/built-in.a
  CC      net/key/af_key.o
  CC      net/unix/sysctl_net_unix.o
  CC [M]  net/netfilter/ipvs/ip_vs_xmit.o
  AR      fs/nls/built-in.a
  AR      fs/hostfs/built-in.a
  AR      drivers/pci/msi/built-in.a
  CC      drivers/pci/pcie/portdrv.o
  CC      fs/debugfs/inode.o
  CC      fs/fat/namei_msdos.o
  HOSTCC  drivers/video/logo/pnmtologo
  CC      net/ethtool/privflags.o
  CC      drivers/pci/hotplug/pci_hotplug_core.o
  CC      kernel/locking/semaphore.o
  AR      drivers/pci/controller/dwc/built-in.a
  AR      fs/proc/built-in.a
  AR      drivers/pci/controller/mobiveil/built-in.a
  CC      drivers/pci/controller/vmd.o
  CC      net/core/netevent.o
  AR      lib/zlib_inflate/built-in.a
  CC      fs/tracefs/inode.o
  CC      crypto/algboss.o
  CC      lib/zlib_deflate/deflate.o
  CC      fs/ext4/fsync.o
  CC      fs/tracefs/event_inode.o
  AR      arch/x86/events/intel/built-in.a
  CC      io_uring/net.o
  CC      fs/ntfs/dir.o
  LD [M]  sound/pci/hda/snd-hda-codec.o
  LOGO    drivers/video/logo/logo_linux_clut224.c
  CC      net/ipv4/inet_hashtables.o
  CC      drivers/video/logo/logo_linux_clut224.o
  LD [M]  sound/pci/hda/snd-hda-codec-generic.o
  CC      block/genhd.o
  LD [M]  sound/pci/hda/snd-hda-codec-realtek.o
  AR      drivers/video/logo/built-in.a
  CC      block/ioprio.o
  LD [M]  sound/pci/hda/snd-hda-codec-analog.o
  LD [M]  sound/pci/hda/snd-hda-codec-hdmi.o
  CC      arch/x86/events/rapl.o
  LD [M]  sound/pci/hda/snd-hda-intel.o
  CC      arch/x86/kernel/cpu/rdrand.o
  AR      sound/pci/trident/built-in.a
  CC      fs/btrfs/super.o
  AR      sound/pci/ymfpci/built-in.a
  CC      arch/x86/kernel/apic/apic_flat_64.o
  AR      sound/pci/vx222/built-in.a
  AR      sound/pci/built-in.a
  AS      arch/x86/kernel/head_64.o
  CC      drivers/video/backlight/backlight.o
  CC      arch/x86/kernel/cpu/match.o
  CC      drivers/video/fbdev/core/fb_notify.o
  CC      block/badblocks.o
  CC      fs/lockd/svcshare.o
  AR      drivers/pci/switch/built-in.a
  CC      arch/x86/kernel/cpu/bugs.o
  CC      net/core/neighbour.o
  CC      drivers/pci/pcie/rcec.o
  CC      arch/x86/kernel/head64.o
  CC      kernel/locking/rwsem.o
  AR      fs/fat/built-in.a
  CC      fs/ext4/hash.o
  CC      fs/ext4/ialloc.o
  AR      drivers/video/console/built-in.a
  CC      fs/debugfs/file.o
  CC      arch/x86/events/msr.o
  CC      drivers/pci/hotplug/acpi_pcihp.o
  CC      drivers/pci/access.o
  CC      crypto/testmgr.o
  CC [M]  net/ipv6/netfilter/nf_conntrack_reasm.o
  CC      drivers/pci/bus.o
  CC      drivers/pci/probe.o
  CC      crypto/cmac.o
  CC      net/ethtool/rings.o
  AR      fs/tracefs/built-in.a
  AR      drivers/pci/controller/built-in.a
  CC      net/ethtool/channels.o
  CC      lib/zlib_deflate/deftree.o
  CC      crypto/hmac.o
  CC      arch/x86/kernel/apic/probe_64.o
  CC      kernel/locking/percpu-rwsem.o
  CC      fs/nfs/file.o
  CC      sound/core/hrtimer.o
  CC      block/blk-rq-qos.o
  CC      block/disk-events.o
  CC      net/unix/diag.o
  CC      fs/ntfs/file.o
  CC      net/xfrm/xfrm_input.o
  CC      sound/core/seq_device.o
  CC [M]  drivers/video/fbdev/core/fb_info.o
  CC      drivers/pci/pcie/aspm.o
  CC      net/unix/scm.o
  AR      drivers/video/backlight/built-in.a
  CC      drivers/video/aperture.o
  CC      crypto/vmac.o
  AR      arch/x86/events/built-in.a
  CC      net/ethtool/coalesce.o
  CC      net/ethtool/pause.o
  CC      drivers/pci/host-bridge.o
  CC      lib/zlib_deflate/deflate_syms.o
  CC [M]  net/netfilter/ipvs/ip_vs_app.o
  CC      drivers/pci/hotplug/pciehp_core.o
  CC      drivers/pci/hotplug/pciehp_ctrl.o
  CC      fs/lockd/svcproc.o
  AR      arch/x86/kernel/apic/built-in.a
  CC      arch/x86/kernel/ebda.o
  CC [M]  net/netfilter/ipvs/ip_vs_sync.o
  CC      drivers/pci/remove.o
  CC      drivers/pci/pci.o
  CC      block/blk-ia-ranges.o
  CC      net/ethtool/eee.o
  AR      fs/debugfs/built-in.a
  CC      drivers/pci/hotplug/pciehp_pci.o
  CC      io_uring/msg_ring.o
  CC [M]  sound/core/control_led.o
  CC      net/xfrm/xfrm_output.o
  AR      net/key/built-in.a
  CC      fs/ntfs/index.o
  CC      fs/ntfs/inode.o
  CC      kernel/locking/irqflag-debug.o
  CC      drivers/pci/hotplug/pciehp_hpc.o
  CC      block/early-lookup.o
  CC [M]  net/netfilter/nf_conntrack_standalone.o
  CC      kernel/locking/mutex-debug.o
  CC [M]  sound/core/hwdep.o
  AR      lib/zlib_deflate/built-in.a
  CC      mm/mmzone.o
  CC      lib/lzo/lzo1x_compress.o
  AR      net/bridge/netfilter/built-in.a
  CC      net/bridge/br.o
  CC [M]  drivers/video/fbdev/core/fbmem.o
  CC      arch/x86/kernel/cpu/aperfmperf.o
  CC [M]  net/netfilter/ipvs/ip_vs_est.o
  CC      net/ipv4/inet_timewait_sock.o
  CC      lib/lzo/lzo1x_decompress_safe.o
  CC [M]  net/netfilter/nf_conntrack_expect.o
  CC      drivers/video/cmdline.o
  CC [M]  arch/x86/kvm/emulate.o
  CC      drivers/video/nomodeset.o
  CC      crypto/xcbc.o
  LD [M]  net/ipv6/netfilter/nf_defrag_ipv6.o
  CC      kernel/locking/lockdep.o
  AR      net/unix/built-in.a
  CC      net/ipv6/af_inet6.o
  CC      net/ipv4/inet_connection_sock.o
  AR      net/dsa/built-in.a
  CC [M]  net/sunrpc/auth_gss/auth_gss.o
  CC      crypto/crypto_null.o
  CC      drivers/pci/pcie/aer.o
  CC      net/sunrpc/clnt.o
  CC      crypto/md5.o
  CC      net/ethtool/tsinfo.o
  CC      drivers/pci/pci-driver.o
  CC      mm/vmstat.o
  CC      net/packet/diag.o
  CC      fs/ext4/indirect.o
  CC      kernel/locking/lockdep_proc.o
  CC      net/ethtool/cabletest.o
  CC      net/sunrpc/xprt.o
  CC      block/bsg.o
  CC      fs/lockd/svcsubs.o
  CC      block/bsg-lib.o
  CC      fs/ntfs/mft.o
  CC      net/xfrm/xfrm_sysctl.o
  CC      fs/nfs/getroot.o
  CC [M]  sound/core/pcm.o
  CC      net/ipv6/anycast.o
  CC      fs/nfs/inode.o
  CC      arch/x86/kernel/cpu/cpuid-deps.o
  AR      lib/lzo/built-in.a
  CC      net/xfrm/xfrm_replay.o
  CC      fs/ntfs/mst.o
  CC      lib/lz4/lz4_compress.o
  CC      io_uring/timeout.o
  CC      drivers/idle/intel_idle.o
  CC      drivers/pci/hotplug/acpiphp_core.o
  CC      drivers/video/hdmi.o
  CC      net/ipv6/ip6_output.o
  CC [M]  drivers/video/fbdev/core/fbcmap.o
  CC      crypto/sha1_generic.o
  CC      fs/ntfs/namei.o
  CC      net/bridge/br_device.o
  CC      net/ipv6/ip6_input.o
  CC      arch/x86/kernel/cpu/umwait.o
  CC      fs/nfs/super.o
  CC      net/8021q/vlan_core.o
  CC      arch/x86/kernel/cpu/proc.o
  CC      net/ethtool/tunnels.o
  CC [M]  net/netfilter/ipvs/ip_vs_proto.o
  CC      net/ethtool/fec.o
  CC      drivers/pci/hotplug/acpiphp_glue.o
  CC [M]  net/netfilter/nf_conntrack_helper.o
  CC      net/core/rtnetlink.o
  CC      block/blk-cgroup.o
  CC      drivers/pci/pcie/err.o
  CC [M]  sound/core/pcm_native.o
  CC      net/bridge/br_fdb.o
  AR      net/packet/built-in.a
  CC [M]  sound/core/pcm_lib.o
  CC      net/xfrm/xfrm_device.o
  AR      kernel/sched/built-in.a
  CC      net/xfrm/xfrm_algo.o
  CC      net/ipv6/addrconf.o
  CC [M]  net/netfilter/nf_conntrack_proto.o
  CC      net/xfrm/xfrm_user.o
  CC      fs/nfs/io.o
  CC      fs/lockd/mon.o
  CC      crypto/sha256_generic.o
  CC      fs/lockd/trace.o
  CC      fs/ntfs/runlist.o
  CC      io_uring/sqpoll.o
  CC      fs/pstore/inode.o
  CC [M]  drivers/video/fbdev/core/modedb.o
  CC      fs/pstore/platform.o
  CC      net/ethtool/eeprom.o
  MKCAP   arch/x86/kernel/cpu/capflags.c
  CC      mm/backing-dev.o
  AR      drivers/idle/built-in.a
  CC      fs/pstore/pmsg.o
  CC      net/ipv4/tcp.o
  CC      fs/ext4/inline.o
  CC      crypto/sha512_generic.o
  CC      drivers/pci/pcie/aer_inject.o
  CC      block/blk-cgroup-rwstat.o
  CC      crypto/sha3_generic.o
  CC      net/ipv4/tcp_input.o
  CC      net/ethtool/stats.o
  CC [M]  net/sunrpc/auth_gss/gss_generic_token.o
  AR      drivers/char/ipmi/built-in.a
  AR      drivers/pci/hotplug/built-in.a
  CC      net/bridge/br_forward.o
  CC      drivers/acpi/acpica/dsargs.o
  CC [M]  net/8021q/vlan.o
  CC      net/bridge/br_if.o
  CC      net/ethtool/phc_vclocks.o
  CC [M]  net/8021q/vlan_dev.o
  AR      fs/pstore/built-in.a
  CC      net/ethtool/mm.o
  CC [M]  net/8021q/vlan_netlink.o
  CC [M]  net/netfilter/ipvs/ip_vs_pe.o
  CC      net/bridge/br_input.o
  CC      fs/ntfs/super.o
  CC      net/bridge/br_ioctl.o
  CC      crypto/blake2b_generic.o
  CC      lib/lz4/lz4hc_compress.o
  CC [M]  drivers/video/fbdev/core/fbcvt.o
  CC      io_uring/fdinfo.o
  CC      fs/lockd/xdr.o
  CC [M]  drivers/video/fbdev/core/fb_cmdline.o
  CC      fs/lockd/clnt4xdr.o
  CC      crypto/ecb.o
  CC      net/sunrpc/socklib.o
  CC      drivers/acpi/acpica/dscontrol.o
  CC      fs/btrfs/ctree.o
  CC      drivers/pnp/pnpacpi/core.o
  CC      drivers/pci/pcie/pme.o
  CC      drivers/pnp/core.o
  CC      drivers/pci/pcie/dpc.o
  CC      fs/nfs/direct.o
  CC      drivers/pnp/card.o
  CC [M]  net/sunrpc/auth_gss/gss_mech_switch.o
  CC      block/blk-throttle.o
  CC      io_uring/tctx.o
  CC [M]  drivers/video/fbdev/core/fb_backlight.o
  CC [M]  arch/x86/kvm/i8259.o
  CC      drivers/acpi/acpica/dsdebug.o
  CC      net/sunrpc/xprtsock.o
  CC      mm/mm_init.o
  CC      mm/percpu.o
  CC      net/ethtool/module.o
  CC      kernel/locking/spinlock.o
  CC      net/ethtool/pse-pd.o
  CC      lib/lz4/lz4_decompress.o
  CC      fs/ext4/inode.o
  CC [M]  drivers/video/fbdev/core/fbmon.o
  CC [M]  net/8021q/vlanproc.o
  CC [M]  drivers/video/fbdev/core/fb_defio.o
  CC [M]  drivers/video/fbdev/core/fb_chrdev.o
  CC      drivers/pnp/pnpacpi/rsparser.o
  CC      drivers/acpi/acpica/dsfield.o
  CC [M]  net/netfilter/nf_conntrack_proto_generic.o
  CC [M]  sound/core/pcm_misc.o
  CC      crypto/cbc.o
  AR      sound/usb/misc/built-in.a
  CC [M]  net/netfilter/ipvs/ip_vs_proto_tcp.o
  AR      sound/firewire/built-in.a
  CC      net/bridge/br_stp.o
  AR      sound/usb/usx2y/built-in.a
  CC [M]  sound/core/pcm_memory.o
  CC [M]  sound/core/memalloc.o
  CC      io_uring/poll.o
  AR      drivers/pci/pcie/built-in.a
  AR      sound/usb/caiaq/built-in.a
  CC      drivers/pci/search.o
  AR      sound/usb/6fire/built-in.a
  AR      sound/usb/hiface/built-in.a
  AR      sound/usb/bcd2000/built-in.a
  AR      sound/usb/built-in.a
  CC      fs/btrfs/extent-tree.o
  CC      fs/btrfs/print-tree.o
  CC [M]  net/sunrpc/auth_gss/svcauth_gss.o
  AR      drivers/video/fbdev/omap/built-in.a
  CC      fs/ntfs/sysctl.o
  CC      fs/ntfs/unistr.o
  CC      fs/ntfs/upcase.o
  AR      net/8021q/built-in.a
  CC      kernel/locking/osq_lock.o
  CC      net/bridge/br_stp_bpdu.o
  CC      kernel/locking/qspinlock.o
  CC      fs/btrfs/root-tree.o
  CC      fs/lockd/xdr4.o
  CC      crypto/pcbc.o
  AR      drivers/video/fbdev/omap2/omapfb/dss/built-in.a
  AR      drivers/video/fbdev/omap2/omapfb/displays/built-in.a
  AR      drivers/video/fbdev/omap2/omapfb/built-in.a
  AR      drivers/video/fbdev/omap2/built-in.a
  CC [M]  drivers/video/fbdev/uvesafb.o
  AR      net/xfrm/built-in.a
  CC [M]  drivers/video/fbdev/core/fb_procfs.o
  CC      net/bridge/br_stp_if.o
  CC      drivers/acpi/acpica/dsinit.o
  CC      net/core/utils.o
  CC      net/core/link_watch.o
  CC [M]  net/netfilter/ipvs/ip_vs_proto_udp.o
  CC [M]  net/netfilter/nf_conntrack_proto_tcp.o
  CC [M]  net/netfilter/ipvs/ip_vs_nfct.o
  CC      block/mq-deadline.o
  CC [M]  sound/core/pcm_timer.o
  LD [M]  sound/core/snd-ctl-led.o
  CC      fs/lockd/svc4proc.o
  CC      drivers/pci/pci-sysfs.o
  CC      net/ethtool/plca.o
  CC      fs/btrfs/dir-item.o
  AR      drivers/pnp/pnpacpi/built-in.a
  LD [M]  net/8021q/8021q.o
  CC      drivers/pnp/driver.o
  CC      net/core/filter.o
  CC      net/ipv4/tcp_output.o
  CC      net/ipv4/tcp_timer.o
  CC      drivers/acpi/acpica/dsmethod.o
  CC      crypto/cts.o
  AR      sound/sparc/built-in.a
  CC      kernel/locking/rtmutex_api.o
  CC      crypto/lrw.o
  AR      fs/ntfs/built-in.a
  CC      io_uring/cancel.o
  CC [M]  drivers/video/fbdev/core/fbsysfs.o
  CC [M]  net/netfilter/nf_conntrack_proto_udp.o
  CC      fs/nfs/pagelist.o
  AR      lib/lz4/built-in.a
  CC      lib/zstd/zstd_compress_module.o
  CC      fs/nfs/read.o
  CC [M]  drivers/video/fbdev/core/fbcon.o
  CC      fs/btrfs/file-item.o
  CC      io_uring/kbuf.o
  CC      crypto/xts.o
  CC      net/bridge/br_stp_timer.o
  CC      drivers/acpi/acpica/dsmthdat.o
  LD [M]  sound/core/snd-hwdep.o
  LD [M]  sound/core/snd-pcm.o
  CC      drivers/pnp/resource.o
  AR      sound/core/built-in.a
  CC      kernel/power/qos.o
  AR      sound/spi/built-in.a
  CC      kernel/power/main.o
  AR      sound/parisc/built-in.a
  CC      kernel/printk/printk.o
  AR      sound/pcmcia/vx/built-in.a
  CC      kernel/printk/printk_safe.o
  AR      sound/pcmcia/pdaudiocf/built-in.a
  AR      sound/pcmcia/built-in.a
  AR      sound/mips/built-in.a
  AR      sound/soc/built-in.a
  AR      sound/atmel/built-in.a
  CC      kernel/printk/nbcon.o
  CC      kernel/printk/printk_ringbuffer.o
  AR      sound/hda/built-in.a
  CC [M]  sound/hda/hda_bus_type.o
  CC      kernel/irq/irqdesc.o
  CC      kernel/irq/handle.o
  CC      fs/ext4/ioctl.o
  CC      lib/xz/xz_dec_syms.o
  CC      lib/raid6/algos.o
  CC      lib/zstd/compress/fse_compress.o
  CC      drivers/acpi/acpica/dsobject.o
  AR      net/ethtool/built-in.a
  CC      drivers/acpi/acpica/dsopcode.o
  CC      drivers/acpi/acpica/dspkginit.o
  CC [M]  net/netfilter/ipvs/ip_vs_rr.o
  CC      io_uring/rsrc.o
  CC      lib/zstd/compress/hist.o
  CC      fs/lockd/procfs.o
  CC      crypto/ctr.o
  CC      fs/btrfs/inode-item.o
  CC      block/kyber-iosched.o
  CC [M]  drivers/video/fbdev/core/bitblit.o
  CC [M]  drivers/video/fbdev/simplefb.o
  CC      drivers/pci/rom.o
  CC      lib/zstd/compress/huf_compress.o
  CC      drivers/acpi/acpica/dsutils.o
  CC      net/ipv6/addrlabel.o
  CC      mm/slab_common.o
  CC      lib/xz/xz_dec_stream.o
  CC      net/ipv6/route.o
  CC      lib/xz/xz_dec_lzma2.o
  CC      kernel/locking/spinlock_debug.o
  CC      fs/btrfs/disk-io.o
  CC [M]  net/sunrpc/auth_gss/gss_rpc_upcall.o
  CC      drivers/pci/setup-res.o
  CC      lib/zstd/compress/zstd_compress.o
  CC      arch/x86/kernel/platform-quirks.o
  CC [M]  sound/hda/hdac_bus.o
  CC      lib/zstd/compress/zstd_compress_literals.o
  CC [M]  drivers/video/fbdev/core/softcursor.o
  CC [M]  drivers/video/fbdev/core/tileblit.o
  AR      drivers/amba/built-in.a
  CC      net/core/sock_diag.o
  CC      block/bfq-iosched.o
  CC      lib/raid6/recov.o
  CC      kernel/rcu/update.o
  AR      kernel/livepatch/built-in.a
  CC      kernel/dma/mapping.o
  CC      kernel/irq/manage.o
  CC      kernel/entry/common.o
  CC      drivers/pnp/manager.o
  CC      net/bridge/br_netlink.o
  CC      kernel/power/console.o
  CC      drivers/acpi/acpica/dswexec.o
  CC      crypto/gcm.o
  CC      kernel/entry/syscall_user_dispatch.o
  AR      fs/lockd/built-in.a
  CC      kernel/locking/qrwlock.o
  CC      kernel/rcu/sync.o
  CC [M]  arch/x86/kvm/irq.o
  CC      net/core/dev_ioctl.o
  CC      fs/nfs/symlink.o
  CC [M]  net/netfilter/nf_conntrack_proto_icmp.o
  CC      lib/xz/xz_dec_bcj.o
  CC      lib/zstd/compress/zstd_compress_sequences.o
  HOSTCC  lib/raid6/mktables
  CC [M]  drivers/video/fbdev/core/fb_logo.o
  CC      net/core/tso.o
  CC      kernel/module/main.o
  LD [M]  net/netfilter/ipvs/ip_vs.o
  CC      kernel/time/time.o
  CC      drivers/acpi/acpica/dswload.o
  CC      drivers/pci/irq.o
  CC      kernel/time/timer.o
  CC      kernel/futex/core.o
  CC      kernel/futex/syscalls.o
  UNROLL  lib/raid6/int1.c
  UNROLL  lib/raid6/int2.c
  UNROLL  lib/raid6/int4.c
  UNROLL  lib/raid6/int8.c
  CC [M]  sound/hda/hdac_device.o
  CC      lib/raid6/recov_ssse3.o
  CC      arch/x86/kernel/cpu/powerflags.o
  CC      lib/zstd/compress/zstd_compress_superblock.o
  CC      lib/zstd/compress/zstd_double_fast.o
  CC      drivers/pnp/support.o
  CC      kernel/dma/direct.o
  CC      arch/x86/kernel/cpu/feat_ctl.o
  AR      lib/xz/built-in.a
  CC      kernel/irq/spurious.o
  CC      lib/raid6/recov_avx2.o
  AR      kernel/locking/built-in.a
  CC      kernel/power/process.o
  CC      net/sunrpc/sched.o
  CC      kernel/cgroup/cgroup.o
  AR      drivers/clk/actions/built-in.a
  AR      drivers/clk/analogbits/built-in.a
  AR      drivers/clk/bcm/built-in.a
  AR      drivers/clk/imgtec/built-in.a
  CC [M]  net/sunrpc/auth_gss/gss_rpc_xdr.o
  CC      fs/ext4/mballoc.o
  AR      drivers/clk/imx/built-in.a
  CC      kernel/rcu/srcutree.o
  AR      drivers/clk/ingenic/built-in.a
  AR      drivers/clk/mediatek/built-in.a
  AR      drivers/clk/microchip/built-in.a
  CC      lib/zstd/compress/zstd_fast.o
  CC      lib/raid6/mmx.o
  AR      drivers/clk/mstar/built-in.a
  CC      block/bfq-wf2q.o
  AR      drivers/clk/mvebu/built-in.a
  CC      drivers/acpi/acpica/dswload2.o
  CC      kernel/printk/sysctl.o
  CC      drivers/acpi/acpica/dswscope.o
  AR      drivers/clk/ralink/built-in.a
  CC      io_uring/rw.o
  AR      drivers/clk/renesas/built-in.a
  CC [M]  arch/x86/kvm/lapic.o
  AR      drivers/clk/socfpga/built-in.a
  CC      kernel/entry/kvm.o
  AR      drivers/clk/sprd/built-in.a
  CC [M]  arch/x86/kvm/i8254.o
  AR      drivers/clk/starfive/built-in.a
  CC      net/core/sock_reuseport.o
  AR      drivers/clk/sunxi-ng/built-in.a
  CC      crypto/pcrypt.o
  AR      drivers/clk/ti/built-in.a
  AR      drivers/clk/versatile/built-in.a
  CC      drivers/pci/vpd.o
  CC      drivers/clk/x86/clk-lpss-atom.o
  CC      drivers/pci/setup-bus.o
  AR      kernel/printk/built-in.a
  CC      drivers/clk/x86/clk-pmc-atom.o
  CC      kernel/irq/resend.o
  CC      drivers/pnp/interface.o
  CC      mm/compaction.o
  CC      lib/raid6/sse1.o
  CC      arch/x86/kernel/cpu/intel.o
  CC      drivers/pnp/quirks.o
  CC [M]  drivers/video/fbdev/core/cfbfillrect.o
  CC      drivers/pnp/system.o
  CC      fs/nfs/unlink.o
  CC      mm/show_mem.o
  CC      drivers/acpi/acpica/dswstate.o
  CC      kernel/futex/pi.o
  CC      lib/raid6/sse2.o
  CC      net/dcb/dcbnl.o
  CC      net/ipv4/tcp_ipv4.o
  CC [M]  sound/hda/hdac_sysfs.o
  CC      lib/raid6/avx2.o
  CC [M]  net/netfilter/nf_conntrack_extend.o
  CC      kernel/futex/requeue.o
  CC      net/ipv4/tcp_minisocks.o
  CC      block/bfq-cgroup.o
  CC      kernel/dma/ops_helpers.o
  CC      kernel/dma/dummy.o
  CC      crypto/cryptd.o
  CC      kernel/power/suspend.o
  CC      net/bridge/br_netlink_tunnel.o
  CC      drivers/acpi/acpica/evevent.o
  AR      drivers/clk/x86/built-in.a
  AR      kernel/entry/built-in.a
  CC      drivers/acpi/acpica/evgpe.o
  AR      drivers/clk/xilinx/built-in.a
  CC      kernel/dma/contiguous.o
  CC      drivers/clk/clk-devres.o
  CC      kernel/irq/chip.o
  CC      fs/btrfs/transaction.o
  CC [M]  net/sunrpc/auth_gss/trace.o
  CC      kernel/module/strict_rwx.o
  CC      fs/btrfs/inode.o
  CC      kernel/rcu/tree.o
  CC      net/dcb/dcbevent.o
  AR      drivers/pnp/built-in.a
  CC [M]  net/netfilter/nf_conntrack_acct.o
  CC      fs/ext4/migrate.o
  CC [M]  sound/hda/hdac_regmap.o
  CC      kernel/futex/waitwake.o
  CC      lib/raid6/avx512.o
  CC      drivers/pci/vc.o
  CC [M]  drivers/video/fbdev/core/cfbcopyarea.o
  CC      block/blk-mq-pci.o
  CC [M]  drivers/video/fbdev/core/cfbimgblt.o
  CC      kernel/dma/swiotlb.o
  CC [M]  sound/hda/hdac_controller.o
  CC      mm/shmem_quota.o
  CC      arch/x86/kernel/cpu/intel_pconfig.o
  CC      kernel/time/hrtimer.o
  CC      drivers/acpi/acpica/evgpeblk.o
  CC      drivers/acpi/acpica/evgpeinit.o
  CC      kernel/module/kmod.o
  CC      drivers/clk/clk-bulk.o
  CC      io_uring/opdef.o
  CC      arch/x86/kernel/cpu/tsx.o
  CC      drivers/pci/mmap.o
  CC      lib/raid6/recov_avx512.o
  CC [M]  sound/hda/hdac_stream.o
  CC      fs/ext4/mmp.o
  CC      net/bridge/br_arp_nd_proxy.o
  CC      kernel/module/tree_lookup.o
  CC      kernel/time/timekeeping.o
  CC      crypto/des_generic.o
  CC      drivers/acpi/acpica/evgpeutil.o
  CC      arch/x86/kernel/cpu/intel_epb.o
  CC      fs/nfs/write.o
  CC      net/core/fib_notifier.o
  CC      kernel/power/hibernate.o
  AR      kernel/futex/built-in.a
  CC      kernel/power/snapshot.o
  CC      drivers/clk/clkdev.o
  CC      drivers/dma/dw/core.o
  CC      kernel/trace/trace_clock.o
  CC      block/blk-mq-virtio.o
  CC      fs/efivarfs/inode.o
  CC      kernel/irq/dummychip.o
  CC [M]  fs/netfs/buffered_read.o
  CC      drivers/dma/hsu/hsu.o
  CC [M]  net/netfilter/nf_conntrack_seqadj.o
  CC      fs/efivarfs/file.o
  CC      kernel/bpf/core.o
  CC      drivers/clk/clk.o
  CC      kernel/irq/devres.o
  AR      net/dcb/built-in.a
  CC      kernel/irq/autoprobe.o
  CC      drivers/pci/setup-irq.o
  CC [M]  drivers/video/fbdev/core/fb_io_fops.o
  CC      crypto/aes_generic.o
  CC      drivers/clk/clk-divider.o
  CC      drivers/acpi/acpica/evglock.o
  TABLE   lib/raid6/tables.c
  CC [M]  fs/fscache/cache.o
  CC      lib/raid6/int1.o
  CC      kernel/module/debug_kmemleak.o
  CC [M]  arch/x86/kvm/ioapic.o
  CC [M]  fs/fscache/cookie.o
  CC      arch/x86/kernel/cpu/amd.o
  CC      kernel/dma/remap.o
  CC [M]  sound/hda/array.o
  CC      io_uring/notif.o
  CC      kernel/trace/ftrace.o
  CC [M]  fs/fscache/io.o
  CC      lib/zstd/compress/zstd_lazy.o
  CC      kernel/rcu/rcu_segcblist.o
  CC      drivers/clk/clk-fixed-factor.o
  CC      kernel/irq/irqdomain.o
  CC      drivers/acpi/acpica/evhandler.o
  CC      crypto/crc32c_generic.o
  CC      fs/efivarfs/super.o
  CC      block/blk-mq-debugfs.o
  CC [M]  net/netfilter/nf_conntrack_proto_icmpv6.o
  AR      drivers/dma/idxd/built-in.a
  CC      arch/x86/kernel/cpu/hygon.o
  CC      arch/x86/kernel/cpu/centaur.o
  CC      drivers/pci/proc.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_mech.o
  CC      net/bridge/br_sysfs_if.o
  CC      kernel/module/kallsyms.o
  AR      drivers/dma/hsu/built-in.a
  CC      arch/x86/kernel/cpu/zhaoxin.o
  CC      drivers/clk/clk-fixed-rate.o
  CC      lib/raid6/int2.o
  CC [M]  drivers/video/fbdev/core/sysfillrect.o
  CC      net/ipv4/tcp_cong.o
  CC      kernel/time/ntp.o
  CC [M]  fs/netfs/io.o
  AR      kernel/dma/built-in.a
  CC      drivers/dma/dw/dw.o
  CC      drivers/acpi/acpica/evmisc.o
  CC      fs/efivarfs/vars.o
  CC      io_uring/waitid.o
  CC      arch/x86/kernel/cpu/perfctr-watchdog.o
  CC      io_uring/io-wq.o
  CC      mm/interval_tree.o
  CC [M]  sound/hda/hdmi_chmap.o
  CC      crypto/crct10dif_common.o
  CC      io_uring/futex.o
  CC      net/ipv4/tcp_metrics.o
  CC      net/ipv6/ip6_fib.o
  CC      lib/zstd/compress/zstd_ldm.o
  CC      drivers/pci/slot.o
  CC [M]  net/netfilter/nf_conntrack_proto_dccp.o
  CC      arch/x86/kernel/cpu/vmware.o
  CC      kernel/time/clocksource.o
  CC [M]  arch/x86/kvm/irq_comm.o
  AR      drivers/dma/mediatek/built-in.a
  CC      kernel/irq/proc.o
  CC      kernel/power/swap.o
  CC      kernel/power/user.o
  CC      kernel/events/core.o
  CC      drivers/acpi/acpica/evregion.o
  CC [M]  arch/x86/kvm/cpuid.o
  CC      lib/fonts/fonts.o
  CC      lib/argv_split.o
  CC      lib/raid6/int4.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_seal.o
  CC      block/blk-pm.o
  CC      kernel/module/procfs.o
  CC [M]  fs/fscache/main.o
  CC      net/core/xdp.o
  CC      crypto/crct10dif_generic.o
  CC      drivers/dma/dw/idma32.o
  CC      kernel/module/sysfs.o
  CC      drivers/pci/pci-acpi.o
  CC      drivers/acpi/numa/srat.o
  CC      drivers/acpi/apei/apei-base.o
  CC      fs/ext4/move_extent.o
  AR      fs/efivarfs/built-in.a
  CC [M]  fs/smb/common/cifs_arc4.o
  CC [M]  drivers/video/fbdev/core/syscopyarea.o
  CC [M]  fs/smb/client/trace.o
  CC      mm/list_lru.o
  CC      drivers/acpi/acpica/evrgnini.o
  CC [M]  fs/smb/client/cifsfs.o
  CC      kernel/cgroup/rstat.o
  CC [M]  fs/smb/client/cifs_debug.o
  CC [M]  sound/hda/trace.o
  CC      arch/x86/kernel/cpu/hypervisor.o
  CC [M]  fs/netfs/iterator.o
  CC      drivers/acpi/apei/hest.o
  CC      net/bridge/br_sysfs_br.o
  CC      lib/fonts/font_8x8.o
  CC      lib/fonts/font_8x16.o
  CC      fs/nfs/namespace.o
  CC      crypto/authenc.o
  CC      kernel/trace/ring_buffer.o
  CC      kernel/irq/migration.o
  CC      kernel/power/poweroff.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_unseal.o
  CC      arch/x86/kernel/cpu/mshyperv.o
  CC      lib/raid6/int8.o
  AR      kernel/bpf/built-in.a
  CC      block/holder.o
  CC      mm/workingset.o
  CC      crypto/authencesn.o
  CC      drivers/dma/dw/acpi.o
  CC [M]  fs/smb/common/cifs_md4.o
  CC      kernel/time/jiffies.o
  CC      drivers/acpi/acpica/evsci.o
  CC      kernel/fork.o
  AR      kernel/module/built-in.a
  CC      net/bridge/br_nf_core.o
  CC      net/ipv4/tcp_fastopen.o
  CC [M]  net/netfilter/nf_conntrack_proto_sctp.o
  CC      kernel/irq/cpuhotplug.o
  AR      io_uring/built-in.a
  CC [M]  sound/hda/hdac_component.o
  AR      drivers/acpi/numa/built-in.a
  AR      drivers/acpi/pmic/built-in.a
  CC      drivers/acpi/dptf/int340x_thermal.o
  CC [M]  sound/hda/hdac_i915.o
  AR      lib/fonts/built-in.a
  CC      lib/bug.o
  AR      kernel/power/built-in.a
  CC      drivers/acpi/acpica/evxface.o
  CC      drivers/pci/quirks.o
  CC      net/core/flow_offload.o
  CC [M]  fs/fscache/volume.o
  CC [M]  fs/netfs/main.o
  CC      fs/ext4/namei.o
  CC      drivers/acpi/apei/erst.o
  CC [M]  drivers/video/fbdev/core/sysimgblt.o
  CC [M]  fs/netfs/objects.o
  CC      drivers/clk/clk-gate.o
  CC      kernel/cgroup/namespace.o
  CC [M]  sound/hda/intel-dsp-config.o
  CC      kernel/time/timer_list.o
  CC      kernel/irq/pm.o
  CC      drivers/clk/clk-multiplier.o
  CC [M]  fs/fscache/proc.o
  CC      drivers/dma/dw/pci.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_wrap.o
  AR      kernel/rcu/built-in.a
  AR      block/built-in.a
  CC      net/core/gro.o
  CC      net/sunrpc/auth.o
  CC [M]  fs/smb/client/connect.o
  CC      kernel/exec_domain.o
  CC      lib/raid6/tables.o
  CC      drivers/acpi/tables.o
  AR      drivers/acpi/dptf/built-in.a
  CC      arch/x86/kernel/cpu/debugfs.o
  CC      drivers/acpi/blacklist.o
  CC      net/core/netdev-genl.o
  CC      drivers/acpi/acpica/evxfevnt.o
  CC      drivers/pci/ats.o
  CC      mm/debug.o
  CC      crypto/lzo.o
  CC      fs/nfs/mount_clnt.o
  CC      net/ipv6/ipv6_sockglue.o
  CC      fs/nfs/nfstrace.o
  CC      kernel/cgroup/cgroup-v1.o
  CC      kernel/time/timeconv.o
  CC [M]  fs/smb/client/dir.o
  CC [M]  fs/smb/client/file.o
  CC      drivers/clk/clk-mux.o
  CC      net/bridge/br_multicast.o
  CC      drivers/acpi/apei/bert.o
  CC [M]  arch/x86/kvm/pmu.o
  CC      drivers/acpi/osi.o
  CC      kernel/trace/trace.o
  CC [M]  sound/hda/intel-nhlt.o
  CC      kernel/time/timecounter.o
  CC      drivers/pci/iov.o
  AR      drivers/dma/dw/built-in.a
  CC      drivers/acpi/acpica/evxfgpe.o
  AR      drivers/dma/qcom/built-in.a
  AR      drivers/dma/ti/built-in.a
  CC [M]  sound/hda/intel-sdw-acpi.o
  CC [M]  net/netfilter/nf_conntrack_netlink.o
  CC [M]  drivers/video/fbdev/core/fb_sys_fops.o
  AR      drivers/dma/xilinx/built-in.a
  CC      arch/x86/kernel/cpu/capflags.o
  LD [M]  fs/netfs/netfs.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_crypto.o
  CC [M]  drivers/dma/ioat/init.o
  CC      lib/zstd/compress/zstd_opt.o
  CC      drivers/pci/pci-label.o
  AR      arch/x86/kernel/cpu/built-in.a
  CC      drivers/acpi/osl.o
  CC [M]  fs/fuse/dev.o
  CC      arch/x86/kernel/process_64.o
  LD [M]  fs/fscache/fscache.o
  CC      kernel/irq/msi.o
  CC [M]  drivers/dma/ioat/dma.o
  CC [M]  fs/fuse/dir.o
  AR      lib/raid6/built-in.a
  CC      lib/buildid.o
  CC      lib/cmdline.o
  CC      net/ipv4/tcp_rate.o
  CC      crypto/lzo-rle.o
  CC      kernel/time/alarmtimer.o
  CC      kernel/time/posix-timers.o
  CC      kernel/cgroup/freezer.o
  CC      lib/zstd/zstd_decompress_module.o
  CC      drivers/clk/clk-composite.o
  CC      mm/gup.o
  CC      drivers/acpi/apei/ghes.o
  CC      drivers/acpi/acpica/evxfregn.o
  CC      fs/btrfs/file.o
  CC      drivers/clk/clk-fractional-divider.o
  CC      lib/zstd/decompress/huf_decompress.o
  CC [M]  arch/x86/kvm/mtrr.o
  CC      kernel/trace/trace_output.o
  LD [M]  sound/hda/snd-hda-core.o
  CC      net/bridge/br_mdb.o
  LD [M]  sound/hda/snd-intel-dspcfg.o
  LD [M]  sound/hda/snd-intel-sdw-acpi.o
  AR      sound/x86/built-in.a
  CC      kernel/panic.o
  AR      sound/xen/built-in.a
  AR      sound/virtio/built-in.a
  CC      sound/sound_core.o
  CC      kernel/irq/affinity.o
  CC      kernel/irq/matrix.o
  CC      crypto/lz4.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_keys.o
  CC      drivers/acpi/acpica/exconcat.o
  LD [M]  drivers/video/fbdev/core/fb.o
  AR      drivers/video/fbdev/core/built-in.a
  CC      drivers/dma/dmaengine.o
  CC      net/core/netdev-genl-gen.o
  AR      drivers/video/fbdev/built-in.a
  AR      drivers/video/built-in.a
  CC      drivers/pci/pci-stub.o
  CC      drivers/acpi/acpica/exconfig.o
  CC      kernel/trace/trace_seq.o
  LD [M]  net/sunrpc/auth_gss/auth_rpcgss.o
  CC      net/sunrpc/auth_null.o
  CC      drivers/acpi/acpica/exconvrt.o
  CC      lib/zstd/decompress/zstd_ddict.o
  AR      drivers/soc/apple/built-in.a
  CC      lib/zstd/decompress/zstd_decompress.o
  AR      drivers/soc/aspeed/built-in.a
  CC      lib/zstd/decompress/zstd_decompress_block.o
  CC      kernel/cgroup/legacy_freezer.o
  CC [M]  drivers/dma/ioat/prep.o
  AR      drivers/soc/bcm/built-in.a
  CC      kernel/cpu.o
  AR      drivers/soc/fsl/built-in.a
  CC      arch/x86/kernel/signal.o
  AR      drivers/soc/fujitsu/built-in.a
  CC      drivers/clk/clk-gpio.o
  CC      net/sunrpc/auth_tls.o
  AR      drivers/soc/hisilicon/built-in.a
  CC [M]  fs/smb/client/inode.o
  AR      drivers/soc/imx/built-in.a
  AR      drivers/soc/ixp4xx/built-in.a
  AR      drivers/soc/loongson/built-in.a
  CC      net/ipv4/tcp_recovery.o
  CC      sound/last.o
  AR      drivers/soc/mediatek/built-in.a
  CC      net/ipv4/tcp_ulp.o
  AR      drivers/soc/microchip/built-in.a
  CC      net/bridge/br_multicast_eht.o
  AR      drivers/soc/nuvoton/built-in.a
  CC      crypto/lz4hc.o
  AR      drivers/soc/pxa/built-in.a
  CC [M]  fs/smb/client/link.o
  CC      net/ipv4/tcp_offload.o
  AR      drivers/soc/amlogic/built-in.a
  AR      drivers/soc/qcom/built-in.a
  CC      crypto/xxhash_generic.o
  AR      drivers/soc/renesas/built-in.a
  AR      drivers/soc/rockchip/built-in.a
  AR      drivers/soc/sifive/built-in.a
  AR      drivers/soc/sunxi/built-in.a
  CC      drivers/acpi/acpica/excreate.o
  AR      drivers/soc/ti/built-in.a
  CC      crypto/rng.o
  AR      drivers/soc/xilinx/built-in.a
  AR      drivers/soc/built-in.a
  AR      drivers/acpi/apei/built-in.a
  CC      arch/x86/kernel/signal_64.o
  CC      kernel/time/posix-cpu-timers.o
  CC      drivers/pci/vgaarb.o
  CC      net/ipv6/ndisc.o
  CC [M]  arch/x86/kvm/hyperv.o
  CC      kernel/time/posix-clock.o
  CC [M]  fs/fuse/file.o
  CC      net/ipv6/udp.o
  CC      net/core/gso.o
  LD [M]  net/sunrpc/auth_gss/rpcsec_gss_krb5.o
  CC [M]  fs/fuse/inode.o
  CC      kernel/exit.o
  CC      fs/ext4/page-io.o
  CC      lib/zstd/zstd_common_module.o
  AR      drivers/clk/built-in.a
  AR      sound/built-in.a
  CC      drivers/acpi/utils.o
  AR      drivers/pmdomain/actions/built-in.a
  AR      drivers/pmdomain/amlogic/built-in.a
  CC      net/l3mdev/l3mdev.o
  AR      drivers/pmdomain/apple/built-in.a
  CC      drivers/acpi/acpica/exdebug.o
  CC      drivers/acpi/reboot.o
  AR      drivers/pmdomain/arm/built-in.a
  AR      kernel/irq/built-in.a
  AR      drivers/pmdomain/bcm/built-in.a
  CC      drivers/acpi/nvs.o
  CC      kernel/cgroup/pids.o
  AR      drivers/pmdomain/imx/built-in.a
  CC      arch/x86/kernel/traps.o
  AR      drivers/pmdomain/mediatek/built-in.a
  CC      net/sunrpc/auth_unix.o
  AR      drivers/pmdomain/qcom/built-in.a
  AR      drivers/pmdomain/renesas/built-in.a
  AR      drivers/pmdomain/rockchip/built-in.a
  CC      drivers/acpi/acpica/exdump.o
  AR      drivers/pmdomain/samsung/built-in.a
  AR      drivers/pmdomain/st/built-in.a
  AR      drivers/pmdomain/starfive/built-in.a
  AR      drivers/pmdomain/sunxi/built-in.a
  CC [M]  drivers/dma/ioat/dca.o
  AR      drivers/pmdomain/tegra/built-in.a
  CC      drivers/dma/virt-dma.o
  AR      drivers/pmdomain/ti/built-in.a
  AR      drivers/pmdomain/xilinx/built-in.a
  AR      drivers/pmdomain/built-in.a
  CC [M]  net/netfilter/nf_nat_core.o
  CC      net/ipv4/tcp_plb.o
  CC      drivers/virtio/virtio.o
  CC      net/sunrpc/svc.o
  CC      crypto/drbg.o
  CC [M]  fs/fuse/control.o
  CC [M]  net/netfilter/nf_nat_proto.o
  CC      drivers/tty/vt/vt_ioctl.o
  CC      drivers/tty/hvc/hvc_console.o
  CC      drivers/acpi/acpica/exfield.o
  CC [M]  arch/x86/kvm/debugfs.o
  CC      kernel/cgroup/cpuset.o
  CC      net/ipv4/datagram.o
  CC      drivers/acpi/wakeup.o
  CC      mm/mmap_lock.o
  AR      drivers/pci/built-in.a
  CC      net/bridge/br_vlan.o
  CC      lib/zstd/common/debug.o
  CC      drivers/char/hw_random/core.o
  CC      net/bridge/br_vlan_tunnel.o
  CC      lib/zstd/common/entropy_common.o
  CC      kernel/time/itimer.o
  CC      lib/zstd/common/error_private.o
  CC      mm/highmem.o
  CC      net/core/net-sysfs.o
  CC      kernel/time/clockevents.o
  CC      kernel/time/tick-common.o
  AR      net/l3mdev/built-in.a
  CC      net/core/page_pool.o
  CC      fs/ext4/readpage.o
  CC [M]  fs/smb/client/misc.o
  CC      drivers/acpi/acpica/exfldio.o
  CC [M]  drivers/dma/ioat/sysfs.o
  CC      drivers/dma/acpi-dma.o
  CC      drivers/tty/vt/vc_screen.o
  CC      arch/x86/kernel/idt.o
  CC      net/sunrpc/svcsock.o
  CC      drivers/virtio/virtio_ring.o
  CC      fs/nfs/export.o
  CC      fs/btrfs/defrag.o
  CC      drivers/char/hw_random/intel-rng.o
  CC      lib/zstd/common/fse_decompress.o
  CC [M]  fs/fuse/xattr.o
  CC      fs/nfs/sysfs.o
  CC      drivers/acpi/sleep.o
  CC      kernel/trace/trace_stat.o
  AR      drivers/tty/hvc/built-in.a
  CC      drivers/tty/serial/8250/8250_core.o
  CC      drivers/tty/serial/serial_core.o
  CC      drivers/acpi/acpica/exmisc.o
  CC      lib/zstd/common/zstd_common.o
  CC      fs/nfs/fs_context.o
  CC      net/ipv4/raw.o
  AR      drivers/tty/ipwireless/built-in.a
  CC [M]  arch/x86/kvm/mmu/mmu.o
  CC      drivers/tty/tty_io.o
  CC      net/bridge/br_vlan_options.o
  CC      fs/nfs/sysctl.o
  CC      drivers/tty/serial/8250/8250_pnp.o
  LD [M]  drivers/dma/ioat/ioatdma.o
  CC      net/sunrpc/svcauth.o
  CC      drivers/char/agp/backend.o
  CC      crypto/jitterentropy.o
  CC      kernel/events/ring_buffer.o
  AR      drivers/dma/built-in.a
  CC      drivers/acpi/device_sysfs.o
  CC      kernel/time/tick-broadcast.o
  CC [M]  net/netfilter/nf_nat_helper.o
  CC      mm/memory.o
  CC      fs/nfs/nfs2super.o
  CC      crypto/jitterentropy-kcapi.o
  CC      kernel/events/callchain.o
  CC      fs/ext4/resize.o
  CC      drivers/tty/serial/serial_base_bus.o
  CC      arch/x86/kernel/irq.o
  AR      drivers/char/hw_random/built-in.a
  CC      drivers/tty/vt/selection.o
  CC [M]  fs/fuse/acl.o
  CC      fs/ext4/super.o
  CC [M]  fs/smb/client/netmisc.o
  CC      drivers/acpi/acpica/exmutex.o
  CC      kernel/softirq.o
  CC [M]  fs/fuse/readdir.o
  CC      kernel/time/tick-broadcast-hrtimer.o
  CC [M]  fs/smb/client/smbencrypt.o
  CC      kernel/trace/trace_printk.o
  CC      net/ipv6/udplite.o
  CC      net/handshake/alert.o
  CC [M]  fs/fuse/ioctl.o
  CC      kernel/resource.o
  CC      drivers/acpi/acpica/exnames.o
  CC      fs/nfs/proc.o
  CC [M]  net/netfilter/nf_nat_redirect.o
  CC      crypto/ghash-generic.o
  CC      drivers/char/agp/generic.o
  CC [M]  net/netfilter/nf_nat_masquerade.o
  CC      drivers/tty/serial/8250/8250_port.o
  CC      fs/nfs/nfs2xdr.o
  CC      drivers/acpi/device_pm.o
  CC      drivers/tty/vt/keyboard.o
  CC      drivers/virtio/virtio_anchor.o
  CC      net/core/net-procfs.o
  CC      kernel/events/hw_breakpoint.o
  CC      net/core/netpoll.o
  CC      kernel/time/tick-oneshot.o
  CC      net/sunrpc/svcauth_unix.o
  CC      net/core/fib_rules.o
  CC      drivers/tty/serial/8250/8250_dma.o
  CC      kernel/events/uprobes.o
  CC      drivers/tty/serial/serial_ctrl.o
  CC      drivers/acpi/acpica/exoparg1.o
  CC      net/handshake/genl.o
  CC      fs/btrfs/extent_map.o
  CC      drivers/tty/n_tty.o
  CC      kernel/sysctl.o
  CC      kernel/trace/pid_list.o
  CC      net/bridge/br_mst.o
  CC      crypto/af_alg.o
  CC      drivers/char/tpm/tpm-chip.o
  CC      drivers/virtio/virtio_pci_modern_dev.o
  LD [M]  fs/fuse/fuse.o
  CC      drivers/char/tpm/tpm-dev-common.o
  CC      fs/btrfs/sysfs.o
  CC      kernel/trace/trace_sched_switch.o
  CC      net/ipv6/raw.o
  CC      kernel/time/tick-sched.o
  CC      drivers/tty/tty_ioctl.o
  CC      drivers/acpi/proc.o
  CC      net/ipv4/udp.o
  CC      drivers/acpi/bus.o
  CC      drivers/acpi/acpica/exoparg2.o
  CC      net/handshake/netlink.o
  CC [M]  fs/overlayfs/super.o
  CC      net/handshake/request.o
  CC [M]  fs/smb/client/transport.o
  CC [M]  fs/overlayfs/namei.o
  AR      kernel/cgroup/built-in.a
  CC      kernel/time/vsyscall.o
  CC      drivers/tty/tty_ldisc.o
  CC      arch/x86/kernel/irq_64.o
  CC      net/handshake/tlshd.o
  CC      fs/open.o
  CC [M]  net/bridge/br_netfilter_hooks.o
  CC      drivers/tty/serial/serial_port.o
  CC [M]  fs/smb/client/cached_dir.o
  CC      drivers/char/agp/isoch.o
  CC      drivers/char/mem.o
  CC      fs/nfs/nfs3super.o
  CC      drivers/acpi/glue.o
  CC      drivers/acpi/acpica/exoparg3.o
  CC      kernel/trace/trace_functions.o
  CC [M]  net/netfilter/x_tables.o
  CC      kernel/time/timekeeping_debug.o
  CC      net/handshake/trace.o
  CC      drivers/char/random.o
  CC      drivers/char/tpm/tpm-dev.o
  CC      drivers/virtio/virtio_pci_legacy_dev.o
  CC      drivers/acpi/scan.o
  CC      drivers/tty/vt/consolemap.o
  CC      fs/nfs/nfs3client.o
  CC      kernel/trace/trace_preemptirq.o
  CC      drivers/tty/tty_buffer.o
  CC      arch/x86/kernel/dumpstack_64.o
  CC      drivers/acpi/acpica/exoparg6.o
  CC      drivers/tty/tty_port.o
  CC      drivers/tty/serial/8250/8250_dwlib.o
  CC      drivers/acpi/acpica/exprep.o
  CC      net/core/net-traces.o
  CC      drivers/tty/serial/8250/8250_pcilib.o
  CC      drivers/acpi/acpica/exregion.o
  CC      drivers/tty/serial/earlycon.o
  CC      drivers/char/agp/intel-agp.o
  CC      drivers/acpi/resource.o
  AR      kernel/events/built-in.a
  CC      drivers/char/agp/intel-gtt.o
  CC      fs/read_write.o
  CC      kernel/capability.o
  HOSTCC  drivers/tty/vt/conmakehash
  CC      net/ipv4/udplite.o
  CC [M]  fs/overlayfs/util.o
  CC      kernel/time/namespace.o
  CC      net/sunrpc/addr.o
  CC      drivers/acpi/acpica/exresnte.o
  CC [M]  fs/overlayfs/inode.o
  CC      crypto/algif_hash.o
  CC      crypto/algif_skcipher.o
  CC      drivers/char/tpm/tpm-interface.o
  CC      fs/file_table.o
  CC      drivers/char/misc.o
  CC      kernel/ptrace.o
  CC      drivers/acpi/acpica/exresolv.o
  CC      drivers/virtio/virtio_pci_modern.o
  CC      drivers/char/tpm/tpm1-cmd.o
  CC      drivers/acpi/acpica/exresop.o
  CC      net/core/selftests.o
  CC      arch/x86/kernel/time.o
  CC      drivers/virtio/virtio_pci_common.o
  CC      drivers/tty/tty_mutex.o
  CC      kernel/trace/trace_nop.o
  CC      fs/nfs/nfs3proc.o
  CC      drivers/tty/serial/8250/8250_early.o
  CC      net/sunrpc/rpcb_clnt.o
  CC      drivers/tty/vt/vt.o
  CC      drivers/tty/tty_ldsem.o
  CC      crypto/xor.o
  CC      fs/btrfs/accessors.o
  CC      drivers/tty/serial/serial_mctrl_gpio.o
  CC      net/core/ptp_classifier.o
  CC      fs/nfs/nfs3xdr.o
  CC      net/core/netprio_cgroup.o
  CC [M]  fs/overlayfs/file.o
  CC      drivers/acpi/acpica/exserial.o
  CC      net/ipv6/icmp.o
  CC      lib/cpumask.o
  AR      kernel/time/built-in.a
  CC      arch/x86/kernel/ioport.o
  CC      arch/x86/kernel/dumpstack.o
  CC [M]  net/bridge/br_netfilter_ipv6.o
  AR      net/handshake/built-in.a
  CC      drivers/char/virtio_console.o
  CC [M]  net/bluetooth/af_bluetooth.o
  AR      drivers/char/agp/built-in.a
  CC      drivers/char/tpm/tpm2-cmd.o
  CC [M]  net/dns_resolver/dns_key.o
  CC      drivers/char/tpm/tpmrm-dev.o
  CC [M]  fs/smb/client/cifs_unicode.o
  CC [M]  net/dns_resolver/dns_query.o
  CC      net/sunrpc/timer.o
  CC      lib/ctype.o
  CC      drivers/char/hpet.o
  CC      drivers/char/tpm/tpm2-space.o
  CC      lib/dec_and_lock.o
  CC      lib/decompress.o
  CC      drivers/tty/tty_baudrate.o
  CC      net/ipv4/udp_offload.o
  CC      net/ipv4/arp.o
  CC      kernel/trace/trace_functions_graph.o
  CC      lib/decompress_bunzip2.o
  CC      drivers/acpi/acpica/exstore.o
  AR      lib/zstd/built-in.a
  AR      net/bridge/built-in.a
  CC      drivers/tty/serial/8250/8250_dw.o
  CC      drivers/tty/serial/8250/8250_exar.o
  CC      arch/x86/kernel/nmi.o
  CC      fs/super.o
  CC      crypto/hash_info.o
  CC      drivers/virtio/virtio_pci_legacy.o
  CC [M]  net/netfilter/xt_tcpudp.o
  CC      net/sunrpc/xdr.o
  CC [M]  drivers/virtio/virtio_mem.o
  CC      arch/x86/kernel/ldt.o
  CC      crypto/simd.o
  CC      net/ipv6/mcast.o
  CC      net/sunrpc/sunrpc_syms.o
  CC      fs/char_dev.o
  CC      fs/btrfs/xattr.o
  CC      fs/stat.o
  AS      arch/x86/kernel/ibt_selftest.o
  CC [M]  fs/overlayfs/dir.o
  CC [M]  net/netfilter/xt_mark.o
  CC [M]  net/netfilter/xt_nat.o
  CC      mm/mincore.o
  CC [M]  fs/overlayfs/readdir.o
  CC      arch/x86/kernel/setup.o
  CC      drivers/acpi/acpica/exstoren.o
  CC      net/ipv6/reassembly.o
  CC      kernel/trace/fgraph.o
  CC      net/core/dst_cache.o
  CC      kernel/trace/blktrace.o
  LD [M]  net/dns_resolver/dns_resolver.o
  CC      net/devres.o
  CC      net/ipv4/icmp.o
  CC      lib/decompress_inflate.o
  CC      net/ipv4/devinet.o
  CC      drivers/char/tpm/tpm-sysfs.o
  CC      drivers/char/tpm/eventlog/common.o
  CC      drivers/acpi/acpica/exstorob.o
  CC      arch/x86/kernel/x86_init.o
  CC [M]  crypto/md4.o
  AR      drivers/virtio/built-in.a
  CC      net/core/gro_cells.o
  CC      net/sunrpc/cache.o
  CC      arch/x86/kernel/i8259.o
  CC      drivers/tty/serial/8250/8250_lpss.o
  CC [M]  fs/smb/client/nterr.o
  CC      fs/btrfs/ordered-data.o
  CC      drivers/char/nvram.o
  LD [M]  net/bridge/br_netfilter.o
  CC [M]  net/bluetooth/hci_core.o
  CC [M]  net/bluetooth/hci_conn.o
  CC      fs/btrfs/extent_io.o
  CC      net/socket.o
  CC      net/ipv4/af_inet.o
  CC      arch/x86/kernel/irqinit.o
  CC      drivers/char/tpm/eventlog/tpm1.o
  CC      drivers/tty/serial/8250/8250_mid.o
  CC      drivers/acpi/acpica/exsystem.o
  CC      lib/decompress_unlz4.o
  CC      kernel/user.o
  AR      fs/nfs/built-in.a
  CC      fs/exec.o
  CC      drivers/tty/tty_jobctrl.o
  CC      net/sunrpc/rpc_pipe.o
  CC      drivers/char/tpm/eventlog/tpm2.o
  CC      drivers/acpi/acpi_processor.o
  CC [M]  fs/smb/client/cifsencrypt.o
  CC      mm/mlock.o
  CC [M]  fs/smb/client/readdir.o
  CC      net/sunrpc/sysfs.o
  CC      net/compat.o
  CC [M]  crypto/ccm.o
  CC      kernel/trace/trace_events.o
  CC [M]  fs/overlayfs/copy_up.o
  CC      kernel/trace/trace_export.o
  CC      drivers/tty/n_null.o
  CC [M]  net/netfilter/xt_REDIRECT.o
  CC [M]  arch/x86/kvm/mmu/page_track.o
  CC      drivers/tty/pty.o
  COPY    drivers/tty/vt/defkeymap.c
  CONMK   drivers/tty/vt/consolemap_deftbl.c
  CC      drivers/char/tpm/tpm_ppi.o
  CC      drivers/tty/vt/defkeymap.o
  CC      fs/ext4/symlink.o
  CC      net/sunrpc/svc_xprt.o
  CC      drivers/acpi/processor_core.o
  CC      drivers/acpi/acpica/extrace.o
  CC      drivers/tty/sysrq.o
  CC      lib/decompress_unlzma.o
  AR      drivers/iommu/amd/built-in.a
  CC      drivers/iommu/intel/dmar.o
  CC      net/ipv4/igmp.o
  AR      drivers/gpu/host1x/built-in.a
  CC      drivers/tty/vt/consolemap_deftbl.o
  CC      net/ipv4/fib_frontend.o
  AR      drivers/gpu/drm/tests/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_kunit_helpers.o
  AR      drivers/tty/vt/built-in.a
  AR      drivers/iommu/arm/arm-smmu/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_buddy_test.o
  AR      drivers/iommu/arm/arm-smmu-v3/built-in.a
  AR      drivers/iommu/arm/built-in.a
  CC      net/ipv6/tcp_ipv6.o
  CC      drivers/acpi/processor_pdc.o
  CC      drivers/iommu/intel/iommu.o
  CC      drivers/tty/serial/8250/8250_pci.o
  CC      arch/x86/kernel/jump_label.o
  CC      drivers/acpi/acpica/exutils.o
  CC      drivers/char/tpm/eventlog/acpi.o
  CC      drivers/char/tpm/eventlog/efi.o
  CC      drivers/char/tpm/tpm_crb.o
  CC [M]  drivers/gpu/drm/tests/drm_cmdline_parser_test.o
  AR      net/core/built-in.a
  CC      net/sysctl_net.o
  CC      lib/decompress_unlzo.o
  CC      net/ipv4/fib_semantics.o
  CC      net/ipv6/ping.o
  CC      fs/ext4/sysfs.o
  CC      arch/x86/kernel/irq_work.o
  CC [M]  arch/x86/kvm/mmu/spte.o
  CC [M]  crypto/arc4.o
  CC      lib/decompress_unxz.o
  CC      fs/pipe.o
  CC      drivers/acpi/acpica/hwacpi.o
  CC      drivers/acpi/acpica/hwesleep.o
  CC [M]  crypto/ecc.o
  AR      drivers/gpu/vga/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_connector_test.o
  CC [M]  crypto/essiv.o
  CC [M]  fs/overlayfs/export.o
  CC      drivers/acpi/ec.o
  CC [M]  net/netfilter/xt_MASQUERADE.o
  CC [M]  net/netfilter/xt_addrtype.o
  CC      drivers/tty/serial/8250/8250_pericom.o
  CC      drivers/iommu/intel/pasid.o
  CC      drivers/acpi/acpica/hwgpe.o
  CC      fs/ext4/xattr.o
  CC [M]  fs/smb/client/ioctl.o
  CC      lib/decompress_unzstd.o
  CC      net/ipv6/exthdrs.o
  CC      net/ipv4/fib_trie.o
  CC      lib/dump_stack.o
  CC      mm/mmap.o
  CC      drivers/iommu/intel/nested.o
  CC      net/ipv4/fib_notifier.o
  CC [M]  fs/smb/client/sess.o
  CC      net/sunrpc/xprtmultipath.o
  AR      drivers/char/tpm/built-in.a
  AR      drivers/char/built-in.a
  CC      drivers/acpi/dock.o
  CC      net/ipv6/datagram.o
  CC [M]  fs/smb/client/export.o
  CC      net/sunrpc/stats.o
  CC [M]  drivers/gpu/drm/tests/drm_damage_helper_test.o
  CC      net/ipv6/ip6_flowlabel.o
  CC      fs/namei.o
  CC      arch/x86/kernel/probe_roms.o
  CC      net/sunrpc/sysctl.o
  CC      drivers/acpi/acpica/hwregs.o
  CC [M]  crypto/ecdh.o
  CC      kernel/trace/trace_event_perf.o
  CC [M]  arch/x86/kvm/mmu/tdp_iter.o
  CC      drivers/acpi/acpica/hwsleep.o
  CC      fs/btrfs/volumes.o
  CC [M]  fs/overlayfs/params.o
  CC      drivers/acpi/acpica/hwvalid.o
  CC [M]  crypto/ecdh_helper.o
  CC      lib/earlycpio.o
  AR      drivers/tty/serial/8250/built-in.a
  AR      drivers/tty/serial/built-in.a
  AR      drivers/tty/built-in.a
  CC      drivers/connector/cn_queue.o
  CC      drivers/base/power/sysfs.o
  CC      drivers/block/loop.o
  CC      lib/extable.o
  CC [M]  drivers/block/nbd.o
  CC      drivers/base/power/generic_ops.o
  CC      kernel/trace/trace_events_filter.o
  CC      mm/mmu_gather.o
  CC      drivers/acpi/acpica/hwxface.o
  CC      arch/x86/kernel/sys_ia32.o
  CC      fs/fcntl.o
  CC      fs/ext4/xattr_hurd.o
  AR      drivers/misc/eeprom/built-in.a
  AR      drivers/misc/cb710/built-in.a
  AR      drivers/misc/ti-st/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_dp_mst_helper_test.o
  CC [M]  drivers/gpu/drm/tests/drm_exec_test.o
  AR      drivers/misc/lis3lv02d/built-in.a
  AR      drivers/misc/cardreader/built-in.a
  CC      drivers/acpi/acpica/hwxfsleep.o
  CC      kernel/trace/trace_events_trigger.o
  CC      drivers/acpi/acpica/hwpci.o
  CC [M]  drivers/misc/mei/hdcp/mei_hdcp.o
  CC      drivers/connector/connector.o
  CC      drivers/base/firmware_loader/builtin/main.o
  CC      drivers/base/regmap/regmap.o
  CC [M]  net/netfilter/xt_conntrack.o
  AR      drivers/base/test/built-in.a
  CC [M]  net/bluetooth/hci_event.o
  CC [M]  net/netfilter/xt_ipvs.o
  CC      fs/ioctl.o
  CC      lib/flex_proportions.o
  CC      kernel/signal.o
  CC      drivers/base/component.o
  LD [M]  crypto/ecdh_generic.o
  CC      drivers/connector/cn_proc.o
  CC [M]  fs/smb/client/unc.o
  AR      crypto/built-in.a
  CC      kernel/sys.o
  CC      kernel/trace/trace_eprobe.o
  CC [M]  drivers/gpu/drm/tests/drm_format_helper_test.o
  CC [M]  arch/x86/kvm/mmu/tdp_mmu.o
  CC      fs/btrfs/async-thread.o
  AR      drivers/base/firmware_loader/builtin/built-in.a
  CC      drivers/acpi/pci_root.o
  CC [M]  fs/overlayfs/xattrs.o
  CC      drivers/base/firmware_loader/main.o
  CC      drivers/base/power/common.o
  CC      drivers/acpi/acpica/nsaccess.o
  CC      drivers/acpi/acpica/nsalloc.o
  CC      drivers/mfd/mfd-core.o
  CC [M]  net/bluetooth/mgmt.o
  AR      drivers/nfc/built-in.a
  CC      mm/mprotect.o
  CC      lib/idr.o
  CC      lib/irq_regs.o
  CC      fs/ext4/xattr_trusted.o
  CC      drivers/base/power/qos.o
  CC      arch/x86/kernel/signal_32.o
  CC      lib/is_single_threaded.o
  CC      lib/klist.o
  CC      drivers/acpi/pci_link.o
  CC      fs/ext4/xattr_user.o
  CC      drivers/iommu/intel/trace.o
  CC      fs/ext4/fast_commit.o
  CC      drivers/acpi/acpica/nsarguments.o
  CC      mm/mremap.o
  CC      drivers/acpi/acpica/nsconvert.o
  CC      net/ipv6/inet6_connection_sock.o
  CC [M]  drivers/misc/mei/pxp/mei_pxp.o
  CC      fs/readdir.o
  AR      net/sunrpc/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_format_test.o
  CC      drivers/acpi/acpica/nsdump.o
  CC      mm/msync.o
  LD [M]  fs/overlayfs/overlay.o
  CC      fs/ext4/orphan.o
  CC [M]  fs/smb/client/winucase.o
  CC      net/ipv4/inet_fragment.o
  CC [M]  fs/smb/client/smb2ops.o
  CC [M]  fs/smb/client/smb2maperror.o
  CC      arch/x86/kernel/sys_x86_64.o
  CC      lib/kobject.o
  AR      drivers/dax/hmem/built-in.a
  CC      drivers/dax/super.o
  CC [M]  fs/smb/client/smb2transport.o
  CC      fs/select.o
  CC [M]  fs/smb/client/smb2misc.o
  CC [M]  fs/smb/client/smb2pdu.o
  AR      drivers/block/built-in.a
  CC      drivers/mfd/intel-lpss.o
  CC      drivers/dma-buf/dma-buf.o
  LD [M]  net/netfilter/nf_conntrack.o
  CC      drivers/dma-buf/dma-fence.o
  CC      drivers/mfd/intel-lpss-pci.o
  CC      drivers/acpi/pci_irq.o
  LD [M]  net/netfilter/nf_nat.o
  CC      drivers/acpi/acpica/nseval.o
  AR      net/netfilter/built-in.a
  AR      drivers/cxl/core/built-in.a
  AR      drivers/cxl/built-in.a
  AR      drivers/connector/built-in.a
  CC      fs/btrfs/ioctl.o
  CC      drivers/base/power/runtime.o
  CC      lib/kobject_uevent.o
  AR      drivers/macintosh/built-in.a
  AR      drivers/base/firmware_loader/built-in.a
  CC      fs/btrfs/locking.o
  CC      drivers/base/core.o
  CC      arch/x86/kernel/espfix_64.o
  CC [M]  drivers/gpu/drm/tests/drm_framebuffer_test.o
  CC      drivers/acpi/acpica/nsinit.o
  CC      kernel/trace/trace_kprobe.o
  CC      fs/dcache.o
  CC [M]  drivers/misc/mei/init.o
  CC      drivers/base/power/wakeirq.o
  CC [M]  fs/smb/client/smb2inode.o
  CC      drivers/acpi/acpi_lpss.o
  CC      drivers/iommu/intel/cap_audit.o
  CC      mm/page_vma_mapped.o
  CC      drivers/base/power/main.o
  CC      drivers/mfd/intel-lpss-acpi.o
  CC      fs/inode.o
  CC      drivers/iommu/intel/irq_remapping.o
  CC      kernel/trace/error_report-traces.o
  CC      drivers/dax/bus.o
  CC      drivers/acpi/acpica/nsload.o
  CC      drivers/acpi/acpica/nsnames.o
  CC      drivers/mfd/intel_soc_pmic_crc.o
  CC      drivers/acpi/acpica/nsobject.o
  CC [M]  drivers/mfd/lpc_sch.o
  CC      drivers/acpi/acpi_apd.o
  CC      net/ipv6/udp_offload.o
  CC [M]  drivers/gpu/drm/tests/drm_gem_shmem_test.o
  CC      fs/attr.o
  CC      fs/bad_inode.o
  CC [M]  drivers/gpu/drm/tests/drm_managed_test.o
  CC [M]  arch/x86/kvm/smm.o
  CC [M]  drivers/misc/mei/hbm.o
  CC      arch/x86/kernel/ksysfs.o
  CC      drivers/base/power/wakeup.o
  CC      drivers/base/power/wakeup_stats.o
  CC      drivers/dma-buf/dma-fence-array.o
  CC      drivers/dma-buf/dma-fence-chain.o
  CC      drivers/base/regmap/regcache.o
  CC      drivers/dma-buf/dma-fence-unwrap.o
  CC      arch/x86/kernel/bootflag.o
  CC      drivers/acpi/acpica/nsparse.o
  CC [M]  arch/x86/kvm/vmx/vmx.o
  CC      drivers/acpi/acpi_platform.o
  CC      lib/logic_pio.o
  CC      drivers/base/power/domain.o
  CC      net/ipv4/ping.o
  CC      kernel/trace/power-traces.o
  CC      drivers/acpi/acpi_pnp.o
  CC      drivers/scsi/scsi.o
  CC [M]  drivers/mfd/lpc_ich.o
  CC      mm/pagewalk.o
  CC      lib/maple_tree.o
  CC      fs/file.o
  CC      drivers/scsi/hosts.o
  AR      drivers/nvme/common/built-in.a
  AR      drivers/misc/built-in.a
  CC [M]  fs/smb/client/smb2file.o
  CC      drivers/nvme/host/core.o
  CC      drivers/acpi/acpica/nspredef.o
  CC      drivers/nvme/host/ioctl.o
  CC      drivers/acpi/power.o
  CC      drivers/base/power/domain_governor.o
  CC      drivers/nvme/host/sysfs.o
  CC      drivers/acpi/acpica/nsprepkg.o
  CC      lib/memcat_p.o
  CC      drivers/dma-buf/dma-resv.o
  CC      fs/filesystems.o
  CC [M]  drivers/gpu/drm/tests/drm_mm_test.o
  AR      drivers/dax/built-in.a
  AR      fs/ext4/built-in.a
  CC      kernel/umh.o
  CC      drivers/ata/libata-core.o
  CC      kernel/workqueue.o
  CC      arch/x86/kernel/e820.o
  CC      drivers/ata/libata-scsi.o
  CC      drivers/iommu/intel/perfmon.o
  CC      drivers/acpi/event.o
  CC      drivers/nvme/host/pr.o
  CC      net/ipv6/seg6.o
  CC [M]  drivers/misc/mei/interrupt.o
  CC [M]  drivers/gpu/drm/tests/drm_modes_test.o
  CC [M]  drivers/misc/mei/client.o
  AR      drivers/mfd/built-in.a
  CC      drivers/base/regmap/regcache-rbtree.o
  CC      drivers/base/regmap/regcache-flat.o
  CC      drivers/nvme/host/trace.o
  CC      drivers/acpi/acpica/nsrepair.o
  CC      kernel/trace/rpm-traces.o
  CC [M]  arch/x86/kvm/kvm-asm-offsets.s
  CC [M]  drivers/gpu/drm/tests/drm_plane_helper_test.o
  CC [M]  drivers/misc/mei/main.o
  CC      drivers/base/power/clock_ops.o
  CC      drivers/acpi/acpica/nsrepair2.o
  CC      drivers/acpi/evged.o
  CC [M]  arch/x86/kvm/vmx/pmu_intel.o
  CC [M]  drivers/gpu/drm/tests/drm_probe_helper_test.o
  CC [M]  drivers/gpu/drm/tests/drm_rect_test.o
  CC [M]  drivers/misc/mei/dma-ring.o
  CC      mm/pgtable-generic.o
  CC      fs/namespace.o
  CC      kernel/trace/trace_dynevent.o
  CC      drivers/dma-buf/sync_file.o
  CC      kernel/pid.o
  CC      drivers/base/regmap/regcache-maple.o
  CC [M]  fs/smb/client/cifsacl.o
  CC      fs/btrfs/orphan.o
  CC      net/ipv6/fib6_notifier.o
  CC      drivers/nvme/host/fault_inject.o
  CC      drivers/scsi/scsi_ioctl.o
  CC      drivers/acpi/acpica/nssearch.o
  CC      drivers/scsi/scsicam.o
  CC      drivers/scsi/scsi_error.o
  CC      net/ipv6/rpl.o
  CC      net/ipv6/ioam6.o
  CC [M]  drivers/misc/mei/bus.o
  CC [M]  drivers/misc/mei/bus-fixup.o
  CC      kernel/task_work.o
  CC      fs/btrfs/export.o
  CC      fs/btrfs/tree-log.o
  CC      drivers/acpi/acpica/nsutils.o
  CC      arch/x86/kernel/pci-dma.o
  AR      drivers/base/power/built-in.a
  CC      drivers/nvme/host/pci.o
  CC      drivers/base/bus.o
  CC      kernel/trace/trace_probe.o
  CC      arch/x86/kernel/quirks.o
  CC [M]  fs/smb/client/fs_context.o
  CC      drivers/base/dd.o
  CC      net/ipv4/ip_tunnel_core.o
  CC      kernel/extable.o
  AR      drivers/iommu/intel/built-in.a
  CC      drivers/base/regmap/regmap-debugfs.o
  AR      drivers/iommu/iommufd/built-in.a
  CC [M]  drivers/misc/mei/debugfs.o
  CC      drivers/iommu/iommu.o
  CC      drivers/base/regmap/regmap-i2c.o
  CC      drivers/dma-buf/sw_sync.o
  CC      drivers/ata/libata-eh.o
  AR      drivers/gpu/drm/arm/built-in.a
  AR      drivers/gpu/drm/display/built-in.a
  CC [M]  drivers/gpu/drm/display/drm_display_helper_mod.o
  CC      drivers/acpi/acpica/nswalk.o
  CC      kernel/params.o
  CC      fs/seq_file.o
  CC      mm/rmap.o
  CC      fs/btrfs/free-space-cache.o
  CC      drivers/scsi/scsi_lib.o
  AR      drivers/gpu/drm/renesas/rcar-du/built-in.a
  AR      drivers/gpu/drm/renesas/built-in.a
  CC      net/ipv6/sysctl_net_ipv6.o
  CC      drivers/base/syscore.o
  CC [M]  drivers/misc/mei/mei-trace.o
  CC      net/ipv4/gre_offload.o
  CC      fs/btrfs/zlib.o
  CC      kernel/kthread.o
  CC      arch/x86/kernel/topology.o
  AR      drivers/nvme/target/built-in.a
  CC      drivers/acpi/acpica/nsxfeval.o
  CC      drivers/base/driver.o
  AR      drivers/gpu/drm/omapdrm/built-in.a
  AR      drivers/gpu/drm/tilcdc/built-in.a
  CC [M]  drivers/misc/mei/pci-me.o
  CC [M]  arch/x86/kvm/vmx/vmcs12.o
  CC [M]  drivers/gpu/drm/display/drm_dp_dual_mode_helper.o
  CC [M]  fs/smb/client/dns_resolve.o
  CC      fs/btrfs/lzo.o
  CC      drivers/acpi/acpica/nsxfname.o
  CC      net/ipv4/metrics.o
  CC      kernel/trace/trace_uprobe.o
  CC      kernel/trace/rethook.o
  CC      drivers/base/regmap/regmap-irq.o
  CC      kernel/sys_ni.o
  CC      drivers/base/class.o
  CC      drivers/base/platform.o
  CC      drivers/scsi/scsi_lib_dma.o
  CC      mm/vmalloc.o
  CC      drivers/dma-buf/sync_debug.o
  CC      fs/btrfs/zstd.o
  CC      drivers/scsi/scsi_scan.o
  CC      drivers/acpi/acpica/nsxfobj.o
  CC [M]  net/bluetooth/hci_sock.o
  CC      arch/x86/kernel/kdebugfs.o
  CC      fs/btrfs/compression.o
  CC      drivers/base/cpu.o
  CC      drivers/ata/libata-transport.o
  CC      fs/xattr.o
  CC [M]  drivers/gpu/drm/display/drm_dp_helper.o
  CC      kernel/nsproxy.o
  AR      drivers/gpu/drm/imx/built-in.a
  CC [M]  drivers/gpu/drm/display/drm_dp_mst_topology.o
  CC      arch/x86/kernel/alternative.o
  AR      drivers/gpu/drm/i2c/built-in.a
  CC [M]  drivers/misc/mei/hw-me.o
  AR      drivers/gpu/drm/panel/built-in.a
  CC      drivers/base/firmware.o
  CC      arch/x86/kernel/i8253.o
  AR      drivers/gpu/drm/bridge/analogix/built-in.a
  CC      net/ipv6/xfrm6_policy.o
  AR      drivers/gpu/drm/bridge/cadence/built-in.a
  CC      net/ipv6/xfrm6_state.o
  AR      drivers/gpu/drm/bridge/imx/built-in.a
  AR      drivers/gpu/drm/hisilicon/built-in.a
  CC      net/ipv4/netlink.o
  AR      drivers/gpu/drm/bridge/synopsys/built-in.a
  CC      net/ipv4/nexthop.o
  AR      drivers/gpu/drm/mxsfb/built-in.a
  AR      drivers/gpu/drm/bridge/built-in.a
  CC      drivers/acpi/acpica/psargs.o
  GEN     drivers/scsi/scsi_devinfo_tbl.c
  CC      fs/libfs.o
  CC      kernel/notifier.o
  CC [M]  drivers/dma-buf/selftest.o
  CC      fs/btrfs/delayed-ref.o
  CC      drivers/scsi/scsi_devinfo.o
  CC      drivers/acpi/acpica/psloop.o
  CC      net/ipv4/udp_tunnel_stub.o
  CC      kernel/ksysfs.o
  CC      drivers/iommu/iommu-traces.o
  CC      arch/x86/kernel/hw_breakpoint.o
  AR      drivers/base/regmap/built-in.a
  CC      drivers/base/init.o
  CC      fs/fs-writeback.o
  CC [M]  drivers/dma-buf/st-dma-fence.o
  ASN.1   fs/smb/client/cifs_spnego_negtokeninit.asn1.[ch]
  CC [M]  fs/smb/client/namespace.o
  CC      drivers/base/map.o
  CC [M]  drivers/misc/mei/gsc-me.o
  CC      drivers/iommu/iommu-sysfs.o
  CC      drivers/base/devres.o
  CC      net/ipv4/sysctl_net_ipv4.o
  CC      fs/btrfs/relocation.o
  CC      drivers/acpi/acpica/psobject.o
  AR      drivers/nvme/host/built-in.a
  CC      arch/x86/kernel/tsc.o
  AR      drivers/nvme/built-in.a
  CC      drivers/ata/libata-trace.o
  CC      drivers/acpi/acpica/psopcode.o
  CC      kernel/cred.o
  CC      drivers/base/attribute_container.o
  CC      drivers/ata/libata-sata.o
  CC      fs/pnode.o
  CC      drivers/scsi/scsi_sysctl.o
  CC      arch/x86/kernel/tsc_msr.o
  CC      mm/page_alloc.o
  CC      drivers/ata/libata-sff.o
  CC [M]  arch/x86/kvm/vmx/hyperv.o
  CC      kernel/reboot.o
  CC      drivers/acpi/acpica/psopinfo.o
  CC      kernel/async.o
  CC      kernel/range.o
  CC      drivers/ata/libata-pmp.o
  CC      fs/splice.o
  AR      kernel/trace/built-in.a
  CC [M]  arch/x86/kvm/vmx/nested.o
  CC      arch/x86/kernel/io_delay.o
  CC      kernel/smpboot.o
  CC [M]  arch/x86/kvm/vmx/posted_intr.o
  CC [M]  drivers/dma-buf/st-dma-fence-chain.o
  CC [M]  drivers/dma-buf/st-dma-fence-unwrap.o
  CC      fs/btrfs/delayed-inode.o
  CC      net/ipv6/xfrm6_input.o
  LD [M]  arch/x86/kvm/kvm.o
  CC [M]  fs/smb/client/smb1ops.o
  CC      drivers/iommu/dma-iommu.o
  CC      net/ipv4/proc.o
  CC [M]  net/bluetooth/hci_sysfs.o
  CC      fs/btrfs/scrub.o
  CC      net/ipv4/syncookies.o
  CC      drivers/base/transport_class.o
  CC      drivers/base/topology.o
  UPD     arch/x86/kvm/kvm-asm-offsets.h
  LD [M]  drivers/misc/mei/mei.o
  AS [M]  arch/x86/kvm/vmx/vmenter.o
  CC      net/ipv4/esp4.o
  CC      drivers/acpi/acpica/psparse.o
  LD [M]  drivers/misc/mei/mei-gsc.o
  CC      drivers/iommu/iova.o
  CC      net/ipv4/esp4_offload.o
  CC      fs/btrfs/backref.o
  CC      lib/nmi_backtrace.o
  LD [M]  drivers/misc/mei/mei-me.o
  CC      fs/btrfs/ulist.o
  CC      drivers/iommu/irq_remapping.o
  CC      drivers/acpi/sysfs.o
  AR      drivers/gpu/drm/tiny/built-in.a
  CC      drivers/ata/libata-acpi.o
  CC      drivers/scsi/scsi_debugfs.o
  CC      drivers/scsi/scsi_trace.o
  CC [M]  drivers/dma-buf/st-dma-resv.o
  CC      fs/sync.o
  CC      kernel/ucount.o
  CC      arch/x86/kernel/rtc.o
  CC      net/ipv4/netfilter.o
  CC      fs/btrfs/qgroup.o
  CC      net/ipv4/inet_diag.o
  CC [M]  fs/smb/client/cifssmb.o
  CC      kernel/regset.o
  CC      drivers/spi/spi.o
  CC      kernel/ksyms_common.o
  CC      drivers/acpi/acpica/psscope.o
  CC      fs/utimes.o
  CC      drivers/ata/libata-pata-timings.o
  CC      drivers/base/container.o
  CC      drivers/acpi/property.o
  AR      drivers/dma-buf/built-in.a
  CC      fs/d_path.o
  LD [M]  drivers/dma-buf/dmabuf_selftests.o
  CC      drivers/net/phy/mdio-boardinfo.o
  CC      drivers/ata/ahci.o
  AR      drivers/firewire/built-in.a
  CC      lib/objpool.o
  CC      drivers/net/phy/stubs.o
  AR      drivers/net/pse-pd/built-in.a
  CC      drivers/net/mdio/acpi_mdio.o
  CC      kernel/groups.o
  CC      fs/stack.o
  AR      drivers/cdrom/built-in.a
  AR      drivers/auxdisplay/built-in.a
  CC [M]  net/bluetooth/l2cap_core.o
  CC      drivers/acpi/acpica/pstree.o
  AR      drivers/net/pcs/built-in.a
  CC [M]  net/bluetooth/l2cap_sock.o
  CC      drivers/acpi/acpica/psutils.o
  CC      arch/x86/kernel/resource.o
  CC      mm/init-mm.o
  CC      kernel/vhost_task.o
  CC      fs/fs_struct.o
  CC      drivers/scsi/scsi_logging.o
  CC      kernel/kcmp.o
  AS      arch/x86/kernel/irqflags.o
  CC      drivers/usb/common/common.o
  CC      arch/x86/kernel/static_call.o
  CC      drivers/usb/common/debug.o
  AR      drivers/iommu/built-in.a
  CC [M]  drivers/gpu/drm/display/drm_dsc_helper.o
  CC      drivers/base/property.o
  CC      arch/x86/kernel/process.o
  CC      kernel/freezer.o
  CC      lib/plist.o
  CC      net/ipv6/xfrm6_output.o
  CC      drivers/scsi/scsi_pm.o
  AR      drivers/net/ethernet/adi/built-in.a
  AR      drivers/net/ethernet/alacritech/built-in.a
  CC      fs/statfs.o
  CC      drivers/base/cacheinfo.o
  AR      drivers/net/ethernet/amazon/built-in.a
  AR      drivers/net/ethernet/aquantia/built-in.a
  CC      drivers/acpi/acpica/pswalk.o
  AR      drivers/net/ethernet/asix/built-in.a
  AR      drivers/net/ethernet/cadence/built-in.a
  CC      drivers/net/mdio/fwnode_mdio.o
  CC      lib/radix-tree.o
  CC      mm/memblock.o
  CC      drivers/base/swnode.o
  AR      drivers/net/usb/built-in.a
  AR      drivers/net/ethernet/broadcom/built-in.a
  CC [M]  drivers/net/usb/pegasus.o
  CC [M]  drivers/net/ethernet/broadcom/b44.o
  CC [M]  drivers/net/ethernet/broadcom/bnx2.o
  CC      drivers/base/auxiliary.o
  CC [M]  drivers/net/ethernet/broadcom/cnic.o
  CC [M]  drivers/net/usb/rtl8150.o
  CC      drivers/usb/core/usb.o
  CC [M]  fs/smb/client/cifs_spnego_negtokeninit.asn1.o
  AR      drivers/usb/phy/built-in.a
  CC      drivers/net/phy/mdio_devres.o
  CC      drivers/usb/host/pci-quirks.o
  CC      drivers/net/phy/phy.o
  CC [M]  net/bluetooth/smp.o
  CC      drivers/usb/host/ehci-hcd.o
  CC      mm/memory_hotplug.o
  CC      drivers/acpi/acpi_cmos_rtc.o
  CC [M]  drivers/net/usb/r8152.o
  CC [M]  drivers/net/ipvlan/ipvlan_core.o
  CC      fs/btrfs/send.o
  CC [M]  drivers/net/usb/asix_devices.o
  CC      drivers/acpi/acpica/psxface.o
  CC      drivers/acpi/x86/apple.o
  CC      mm/madvise.o
  CC      drivers/acpi/x86/utils.o
  CC      drivers/ata/libahci.o
  AR      drivers/usb/common/built-in.a
  CC      net/ipv4/tcp_diag.o
  CC      fs/btrfs/dev-replace.o
  CC      drivers/acpi/acpica/rsaddr.o
  CC      kernel/stacktrace.o
  CC      drivers/scsi/scsi_bsg.o
  CC      lib/ratelimit.o
  CC [M]  drivers/gpu/drm/display/drm_hdcp_helper.o
  CC [M]  net/bluetooth/lib.o
  CC      drivers/acpi/acpica/rscalc.o
  AR      drivers/net/mdio/built-in.a
  CC [M]  drivers/gpu/drm/display/drm_hdmi_helper.o
  CC [M]  drivers/gpu/drm/display/drm_scdc_helper.o
  CC [M]  drivers/net/vxlan/vxlan_core.o
  CC      lib/rbtree.o
  CC      drivers/net/phy/phy-c45.o
  CC      drivers/acpi/x86/s2idle.o
  CC [M]  drivers/gpu/drm/display/drm_dp_aux_dev.o
  CC [M]  drivers/net/usb/asix_common.o
  CC      drivers/base/devtmpfs.o
  CC [M]  drivers/net/ipvlan/ipvlan_main.o
  CC      fs/btrfs/raid56.o
  CC      drivers/acpi/debugfs.o
  CC      drivers/acpi/acpica/rscreate.o
  CC      drivers/base/node.o
  CC      drivers/usb/core/hub.o
  CC      drivers/net/phy/phy-core.o
  CC      net/ipv6/xfrm6_protocol.o
  CC      net/ipv4/udp_diag.o
  CC      drivers/net/loopback.o
  CC      arch/x86/kernel/ptrace.o
  CC [M]  net/bluetooth/ecdh_helper.o
  CC      arch/x86/kernel/tls.o
  CC      lib/seq_buf.o
  CC [M]  drivers/net/vxlan/vxlan_multicast.o
  CC      kernel/dma.o
  CC      kernel/smp.o
  CC      drivers/scsi/scsi_common.o
  CC [M]  drivers/net/vxlan/vxlan_vnifilter.o
  CC      drivers/acpi/acpica/rsdumpinfo.o
  CC [M]  drivers/net/usb/ax88172a.o
  CC      drivers/net/phy/phy_device.o
  CC [M]  net/bluetooth/hci_request.o
  CC      fs/fs_pin.o
  AR      drivers/spi/built-in.a
  CC      net/ipv6/netfilter.o
  CC [M]  net/bluetooth/mgmt_util.o
  CC      kernel/uid16.o
  CC      drivers/acpi/acpica/rsinfo.o
  CC      drivers/base/memory.o
  CC      drivers/usb/storage/scsiglue.o
  CC      fs/btrfs/uuid-tree.o
  CC      drivers/usb/storage/protocol.o
  CC      drivers/usb/storage/transport.o
  CC      lib/siphash.o
  CC      lib/string.o
  CC      kernel/kallsyms.o
  LD [M]  drivers/gpu/drm/display/drm_display_helper.o
  CC      drivers/net/netconsole.o
  AR      drivers/gpu/drm/xlnx/built-in.a
  AR      drivers/gpu/drm/gud/built-in.a
  AR      drivers/gpu/drm/solomon/built-in.a
  CC      drivers/base/module.o
  CC [M]  drivers/gpu/drm/ttm/ttm_tt.o
  CC      drivers/usb/host/ehci-pci.o
  CC      kernel/acct.o
  CC [M]  drivers/gpu/drm/ttm/ttm_bo.o
  CC      drivers/scsi/sd.o
  CC      drivers/acpi/acpica/rsio.o
  CC      drivers/input/serio/serio.o
  CC [M]  drivers/gpu/drm/scheduler/sched_main.o
  CC      drivers/input/serio/i8042.o
  CC [M]  fs/smb/client/asn1.o
  CC      mm/page_io.o
  CC [M]  drivers/gpu/drm/scheduler/sched_fence.o
  CC      drivers/ata/ata_piix.o
  CC      arch/x86/kernel/step.o
  CC      net/ipv4/tcp_cubic.o
  CC [M]  drivers/net/vxlan/vxlan_mdb.o
  CC      lib/timerqueue.o
  CC [M]  net/bluetooth/mgmt_config.o
  CC      drivers/usb/core/hcd.o
  AR      drivers/net/ethernet/cavium/common/built-in.a
  AR      drivers/net/ethernet/cavium/thunder/built-in.a
  CC      drivers/acpi/acpica/rsirq.o
  AR      drivers/net/ethernet/cavium/liquidio/built-in.a
  CC      net/ipv6/fib6_rules.o
  AR      drivers/net/ethernet/cavium/octeon/built-in.a
  CC      net/ipv6/proc.o
  AR      drivers/net/ethernet/cavium/built-in.a
  AR      drivers/net/ethernet/cortina/built-in.a
  AR      drivers/net/ethernet/engleder/built-in.a
  CC      lib/vsprintf.o
  AR      drivers/net/ethernet/ezchip/built-in.a
  CC      drivers/base/pinctrl.o
  AR      drivers/net/ethernet/fungible/built-in.a
  CC [M]  net/bluetooth/hci_codec.o
  CC [M]  drivers/net/ipvlan/ipvlan_l3s.o
  CC      net/ipv4/xfrm4_policy.o
  CC [M]  net/bluetooth/eir.o
  CC      net/ipv4/xfrm4_state.o
  LD [M]  arch/x86/kvm/kvm-intel.o
  CC      drivers/usb/core/urb.o
  CC      drivers/acpi/acpica/rslist.o
  CC      drivers/acpi/acpica/rsmemory.o
  CC      arch/x86/kernel/i8237.o
  CC [M]  drivers/net/usb/ax88179_178a.o
  CC      fs/btrfs/props.o
  CC      drivers/usb/storage/usb.o
  CC      drivers/input/keyboard/atkbd.o
  AR      drivers/input/mouse/built-in.a
  CC      drivers/acpi/acpi_lpat.o
  CC      drivers/rtc/lib.o
  AR      drivers/i3c/built-in.a
  AR      drivers/i2c/algos/built-in.a
  CC [M]  drivers/i2c/algos/i2c-algo-bit.o
  CC      drivers/rtc/class.o
  CC      drivers/rtc/interface.o
  CC      kernel/crash_core.o
  CC      net/ipv4/xfrm4_input.o
  CC      drivers/i2c/busses/i2c-designware-common.o
  CC      drivers/rtc/nvmem.o
  CC      drivers/base/devcoredump.o
  CC      drivers/acpi/acpica/rsmisc.o
  CC      kernel/compat.o
  CC      arch/x86/kernel/stacktrace.o
  CC      fs/btrfs/free-space-tree.o
  CC [M]  drivers/gpu/drm/ttm/ttm_bo_util.o
  CC      drivers/net/phy/linkmode.o
  CC      mm/swap_state.o
  CC      drivers/input/serio/libps2.o
  CC      drivers/base/platform-msi.o
  AR      drivers/ata/built-in.a
  CC      drivers/i2c/busses/i2c-designware-master.o
  LD [M]  fs/smb/client/cifs.o
  CC [M]  drivers/gpu/drm/scheduler/sched_entity.o
  CC      drivers/usb/storage/initializers.o
  CC      drivers/usb/host/ohci-hcd.o
  CC      drivers/rtc/dev.o
  CC      kernel/utsname.o
  CC      net/ipv4/xfrm4_output.o
  CC      drivers/acpi/acpica/rsserial.o
  CC      drivers/rtc/proc.o
  CC      drivers/usb/core/message.o
  CC      drivers/acpi/acpica/rsutils.o
  CC      drivers/usb/core/driver.o
  AR      drivers/net/ethernet/huawei/built-in.a
  CC      net/ipv6/syncookies.o
  CC      drivers/net/phy/mdio_bus.o
  CC      drivers/acpi/acpica/rsxface.o
  CC [M]  drivers/net/ethernet/broadcom/tg3.o
  CC      drivers/acpi/acpica/tbdata.o
  CC [M]  net/bluetooth/hci_sync.o
  CC      arch/x86/kernel/reboot.o
  CC      arch/x86/kernel/msr.o
  CC      drivers/acpi/acpica/tbfadt.o
  CC      arch/x86/kernel/cpuid.o
  LD [M]  drivers/net/ipvlan/ipvlan.o
  CC      mm/swapfile.o
  CC      net/ipv6/mip6.o
  CC [M]  drivers/net/dummy.o
  CC      drivers/usb/storage/sierra_ms.o
  AR      drivers/input/keyboard/built-in.a
  CC      drivers/usb/core/config.o
  CC      drivers/input/input.o
  AR      drivers/i2c/muxes/built-in.a
  CC      drivers/i2c/i2c-boardinfo.o
  CC [M]  drivers/i2c/muxes/i2c-mux-gpio.o
  CC      drivers/i2c/i2c-core-base.o
  CC [M]  drivers/gpu/drm/ttm/ttm_bo_vm.o
  CC [M]  drivers/gpu/drm/ttm/ttm_module.o
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_main.o
  CC      drivers/base/physical_location.o
  CC      drivers/base/trace.o
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_hw.o
  CC      kernel/user_namespace.o
  CC      mm/swap_slots.o
  CC [M]  drivers/net/ethernet/intel/e1000e/82571.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_main.o
  CC      drivers/acpi/acpica/tbfind.o
  AR      drivers/input/serio/built-in.a
  CC      mm/dmapool.o
  CC      drivers/usb/storage/option_ms.o
  CC [M]  drivers/net/ethernet/intel/e1000e/ich8lan.o
  CC      drivers/acpi/acpica/tbinstal.o
  CC      drivers/scsi/sg.o
  CC      mm/hugetlb.o
  CC      net/ipv4/xfrm4_protocol.o
  AR      drivers/media/i2c/built-in.a
  AR      drivers/media/tuners/built-in.a
  LD [M]  drivers/gpu/drm/scheduler/gpu-sched.o
  AR      drivers/media/rc/keymaps/built-in.a
  CC      drivers/acpi/acpica/tbprint.o
  AR      drivers/media/rc/built-in.a
  AR      drivers/ptp/built-in.a
  AR      drivers/media/common/b2c2/built-in.a
  CC      drivers/rtc/sysfs.o
  CC [M]  drivers/ptp/ptp_clock.o
  AR      drivers/media/common/saa7146/built-in.a
  AR      drivers/media/common/siano/built-in.a
  AR      drivers/media/common/v4l2-tpg/built-in.a
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_ethtool.o
  AR      drivers/media/common/videobuf2/built-in.a
  CC      fs/nsfs.o
  AR      drivers/media/common/built-in.a
  CC      kernel/pid_namespace.o
  CC      drivers/i2c/busses/i2c-designware-platdrv.o
  AR      drivers/media/platform/allegro-dvt/built-in.a
  CC      drivers/i2c/busses/i2c-designware-baytrail.o
  LD [M]  drivers/net/vxlan/vxlan.o
  CC [M]  drivers/i2c/busses/i2c-scmi.o
  AR      drivers/media/platform/amlogic/meson-ge2d/built-in.a
  AR      drivers/media/platform/amlogic/built-in.a
  UPD     kernel/config_data
  CC      fs/fs_types.o
  CC      fs/fs_context.o
  AR      drivers/media/platform/amphion/built-in.a
  AR      drivers/media/platform/aspeed/built-in.a
  AR      drivers/media/platform/atmel/built-in.a
  AR      drivers/media/platform/cadence/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.o
  AR      drivers/media/platform/chips-media/built-in.a
  AR      drivers/media/platform/intel/built-in.a
  CC      arch/x86/kernel/early-quirks.o
  AR      drivers/media/platform/marvell/built-in.a
  AR      drivers/net/ethernet/i825xx/built-in.a
  CC [M]  drivers/net/macvlan.o
  CC      drivers/acpi/acpica/tbutils.o
  CC      drivers/usb/storage/usual-tables.o
  AR      drivers/media/platform/mediatek/jpeg/built-in.a
  AR      drivers/power/reset/built-in.a
  AR      drivers/media/platform/mediatek/mdp/built-in.a
  CC      drivers/power/supply/power_supply_core.o
  CC [M]  drivers/ptp/ptp_chardev.o
  AR      drivers/base/built-in.a
  CC      fs/btrfs/tree-checker.o
  CC      drivers/power/supply/power_supply_sysfs.o
  AR      drivers/media/platform/mediatek/vcodec/common/built-in.a
  CC [M]  drivers/gpu/drm/ttm/ttm_execbuf_util.o
  AR      drivers/media/platform/mediatek/vcodec/encoder/built-in.a
  CC [M]  drivers/gpu/drm/ttm/ttm_range_manager.o
  CC [M]  drivers/net/usb/cdc_ether.o
  AR      drivers/media/platform/mediatek/vcodec/decoder/built-in.a
  AR      drivers/media/platform/mediatek/vcodec/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o
  CC      lib/win_minmax.o
  CC [M]  drivers/net/usb/cdc_eem.o
  AR      drivers/media/platform/mediatek/vpu/built-in.a
  CC      kernel/stop_machine.o
  CC      drivers/hwmon/hwmon.o
  AR      drivers/media/platform/mediatek/mdp3/built-in.a
  AR      drivers/media/platform/mediatek/built-in.a
  CC      drivers/net/phy/mdio_device.o
  AR      drivers/media/platform/microchip/built-in.a
  CC [M]  drivers/hwmon/acpi_power_meter.o
  AR      drivers/media/platform/nuvoton/built-in.a
  AR      drivers/media/platform/nvidia/tegra-vde/built-in.a
  AR      drivers/media/platform/nvidia/built-in.a
  AR      drivers/media/platform/nxp/dw100/built-in.a
  CC      drivers/rtc/rtc-mc146818-lib.o
  AR      drivers/media/platform/nxp/imx-jpeg/built-in.a
  AR      drivers/thermal/broadcom/built-in.a
  CC [M]  net/ipv4/ip_tunnel.o
  AR      drivers/media/platform/nxp/imx8-isi/built-in.a
  AR      drivers/thermal/samsung/built-in.a
  AR      drivers/media/platform/nxp/built-in.a
  CC      net/ipv6/addrconf_core.o
  CC      drivers/thermal/intel/intel_tcc.o
  CC      drivers/usb/core/file.o
  AR      drivers/media/platform/qcom/camss/built-in.a
  CC      drivers/usb/core/buffer.o
  AR      drivers/media/platform/qcom/venus/built-in.a
  AR      drivers/media/platform/qcom/built-in.a
  CC      drivers/usb/core/sysfs.o
  CC      drivers/acpi/acpica/tbxface.o
  AR      drivers/media/platform/renesas/rcar-vin/built-in.a
  AR      drivers/media/platform/renesas/rzg2l-cru/built-in.a
  AR      drivers/media/platform/renesas/vsp1/built-in.a
  AR      drivers/media/platform/renesas/built-in.a
  LD [M]  drivers/gpu/drm/amd/amdxcp/amdxcp.o
  CC      drivers/thermal/intel/therm_throt.o
  AR      drivers/thermal/st/built-in.a
  CC      arch/x86/kernel/smp.o
  AR      drivers/media/platform/rockchip/rga/built-in.a
  AR      drivers/media/platform/rockchip/rkisp1/built-in.a
  CC [M]  drivers/i2c/busses/i2c-ccgx-ucsi.o
  CC      lib/xarray.o
  AR      drivers/media/platform/rockchip/built-in.a
  AR      drivers/usb/storage/built-in.a
  AR      drivers/media/platform/samsung/exynos-gsc/built-in.a
  CC [M]  drivers/net/ethernet/intel/igb/igb_ethtool.o
  AR      drivers/media/platform/samsung/exynos4-is/built-in.a
  AR      drivers/media/platform/samsung/s3c-camif/built-in.a
  CC      arch/x86/kernel/smpboot.o
  AR      drivers/media/platform/samsung/s5p-g2d/built-in.a
  AR      drivers/media/platform/samsung/s5p-jpeg/built-in.a
  CC [M]  drivers/net/ethernet/intel/igb/e1000_82575.o
  AR      drivers/media/platform/samsung/s5p-mfc/built-in.a
  CC [M]  drivers/net/ethernet/intel/igb/e1000_mac.o
  AR      drivers/media/platform/samsung/built-in.a
  CC      drivers/input/input-compat.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_main.o
  AR      drivers/media/platform/sunxi/sun4i-csi/built-in.a
  AR      drivers/media/platform/st/sti/bdisp/built-in.a
  AR      drivers/media/platform/sunxi/sun6i-csi/built-in.a
  AR      drivers/media/platform/st/sti/c8sectpfe/built-in.a
  AR      drivers/media/platform/ti/am437x/built-in.a
  AR      drivers/media/platform/sunxi/sun6i-mipi-csi2/built-in.a
  AR      drivers/media/platform/st/sti/delta/built-in.a
  CC [M]  drivers/net/ethernet/intel/igc/igc_mac.o
  CC [M]  drivers/gpu/drm/ttm/ttm_resource.o
  AR      drivers/media/platform/ti/cal/built-in.a
  AR      drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/built-in.a
  AR      drivers/media/platform/st/sti/hva/built-in.a
  AR      drivers/media/platform/ti/vpe/built-in.a
  AR      drivers/media/platform/sunxi/sun8i-di/built-in.a
  AR      drivers/media/platform/st/stm32/built-in.a
  CC      drivers/usb/host/ohci-pci.o
  AR      drivers/media/platform/ti/davinci/built-in.a
  AR      drivers/media/platform/st/built-in.a
  AR      drivers/media/platform/sunxi/sun8i-rotate/built-in.a
  CC [M]  drivers/gpu/drm/ttm/ttm_pool.o
  AR      drivers/media/platform/ti/j721e-csi2rx/built-in.a
  AR      drivers/media/platform/sunxi/built-in.a
  CC [M]  drivers/gpu/drm/ttm/ttm_device.o
  AR      drivers/media/platform/ti/omap/built-in.a
  CC      drivers/net/phy/swphy.o
  CC      drivers/net/phy/fixed_phy.o
  AR      drivers/media/platform/ti/omap3isp/built-in.a
  AR      drivers/media/platform/ti/built-in.a
  CC [M]  drivers/ptp/ptp_sysfs.o
  CC      drivers/acpi/acpica/tbxfload.o
  AR      drivers/media/platform/verisilicon/built-in.a
  AR      drivers/media/platform/via/built-in.a
  CC      drivers/rtc/rtc-cmos.o
  CC      drivers/power/supply/power_supply_leds.o
  AR      drivers/media/platform/xilinx/built-in.a
  AR      drivers/media/platform/built-in.a
  CC      arch/x86/kernel/tsc_sync.o
  CC [M]  drivers/gpu/drm/i915/i915_config.o
  CC      kernel/kprobes.o
  CC      drivers/acpi/acpica/tbxfroot.o
  CC      drivers/scsi/scsi_sysfs.o
  CC      kernel/hung_task.o
  CC [M]  drivers/net/usb/smsc75xx.o
  AR      drivers/media/pci/ttpci/built-in.a
  AR      drivers/media/pci/b2c2/built-in.a
  AR      drivers/media/pci/pluto2/built-in.a
  AR      drivers/media/pci/dm1105/built-in.a
  CC [M]  drivers/net/ethernet/intel/igbvf/vf.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_main.o
  AR      drivers/media/pci/pt1/built-in.a
  AR      drivers/media/pci/pt3/built-in.a
  AR      drivers/media/pci/mantis/built-in.a
  CC      drivers/power/supply/power_supply_hwmon.o
  AR      drivers/media/pci/ngene/built-in.a
  AR      drivers/media/pci/ddbridge/built-in.a
  AR      drivers/media/pci/saa7146/built-in.a
  AR      drivers/media/pci/smipcie/built-in.a
  AR      drivers/media/pci/netup_unidvb/built-in.a
  AR      drivers/media/pci/intel/ipu3/built-in.a
  CC [M]  drivers/hwmon/coretemp.o
  AR      drivers/media/pci/intel/ivsc/built-in.a
  CC      drivers/input/input-mt.o
  AR      drivers/media/pci/intel/built-in.a
  AR      drivers/media/pci/built-in.a
  CC [M]  drivers/i2c/busses/i2c-i801.o
  AR      drivers/media/usb/b2c2/built-in.a
  CC      kernel/watchdog.o
  CC      drivers/usb/core/endpoint.o
  CC [M]  drivers/gpu/drm/i915/i915_driver.o
  AR      drivers/media/usb/dvb-usb/built-in.a
  AR      drivers/media/usb/dvb-usb-v2/built-in.a
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_param.o
  AR      drivers/media/usb/s2255/built-in.a
  AR      drivers/media/usb/siano/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_device.o
  CC      drivers/acpi/acpica/utaddress.o
  AR      drivers/media/usb/ttusb-budget/built-in.a
  CC      fs/btrfs/space-info.o
  CC [M]  drivers/thermal/intel/x86_pkg_temp_thermal.o
  AR      drivers/media/usb/ttusb-dec/built-in.a
  AR      drivers/media/usb/built-in.a
  CC      net/ipv6/exthdrs_core.o
  CC      drivers/usb/host/uhci-hcd.o
  CC      drivers/usb/host/xhci.o
  CC [M]  drivers/gpu/drm/i915/i915_drm_client.o
  AR      drivers/media/mmc/siano/built-in.a
  CC [M]  drivers/net/ethernet/intel/igc/igc_i225.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_base.o
  AR      drivers/media/mmc/built-in.a
  CC [M]  drivers/ptp/ptp_vclock.o
  AR      drivers/media/firewire/built-in.a
  CC [M]  drivers/gpu/drm/i915/i915_getparam.o
  AR      drivers/media/spi/built-in.a
  CC [M]  drivers/gpu/drm/i915/i915_ioctl.o
  AR      drivers/media/test-drivers/built-in.a
  AR      drivers/media/built-in.a
  CC      kernel/watchdog_perf.o
  CC      drivers/watchdog/watchdog_core.o
  CC      mm/hugetlb_vmemmap.o
  CC [M]  drivers/i2c/busses/i2c-isch.o
  CC      mm/mempolicy.o
  CC [M]  drivers/gpu/drm/ttm/ttm_sys_manager.o
  CC [M]  drivers/net/ethernet/intel/e1000e/80003es2lan.o
  CC [M]  drivers/net/phy/phylink.o
  AR      drivers/power/supply/built-in.a
  AR      drivers/power/built-in.a
  CC      drivers/acpi/acpica/utalloc.o
  CC      arch/x86/kernel/setup_percpu.o
  CC      lib/lockref.o
  AR      drivers/rtc/built-in.a
  CC [M]  drivers/net/ethernet/intel/igbvf/mbx.o
  CC      drivers/md/md.o
  CC      drivers/i2c/i2c-core-smbus.o
  CC      drivers/input/input-poller.o
  CC [M]  drivers/md/persistent-data/dm-array.o
  CC      drivers/usb/core/devio.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_bo_test.o
  CC [M]  drivers/md/persistent-data/dm-bitset.o
  CC      lib/bcd.o
  AR      drivers/hwmon/built-in.a
  CC      lib/sort.o
  CC      drivers/usb/core/notify.o
  AR      drivers/thermal/intel/built-in.a
  CC      net/ipv6/ip6_checksum.o
  AR      drivers/thermal/qcom/built-in.a
  CC      drivers/acpi/acpica/utascii.o
  AR      drivers/thermal/tegra/built-in.a
  AR      drivers/thermal/mediatek/built-in.a
  CC      lib/parser.o
  CC      drivers/thermal/thermal_core.o
  CC [M]  drivers/ptp/ptp_kvm_x86.o
  CC [M]  drivers/gpu/drm/ttm/ttm_agp_backend.o
  CC [M]  net/ipv4/udp_tunnel_core.o
  AR      drivers/scsi/built-in.a
  CC      drivers/watchdog/watchdog_dev.o
  CC      drivers/watchdog/softdog.o
  CC [M]  net/bluetooth/coredump.o
  CC      drivers/opp/core.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_nvm.o
  CC      arch/x86/kernel/ftrace.o
  LD [M]  drivers/net/ethernet/intel/e1000/e1000.o
  CC      drivers/opp/cpu.o
  CC [M]  drivers/net/usb/smsc95xx.o
  CC      kernel/seccomp.o
  CC      drivers/input/ff-core.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.o
  CC [M]  drivers/i2c/busses/i2c-ismt.o
  CC [M]  drivers/gpu/drm/i915/i915_irq.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_dma_buf_test.o
  CC      drivers/input/touchscreen.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.o
  CC      drivers/usb/serial/usb-serial.o
  AS      arch/x86/kernel/ftrace_64.o
  CC      drivers/input/ff-memless.o
  CC      drivers/acpi/acpica/utbuffer.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.o
  CC      lib/debug_locks.o
  CC      drivers/acpi/acpica/utcksum.o
  CC [M]  drivers/net/ethernet/intel/igbvf/ethtool.o
  CC      drivers/usb/core/generic.o
  CC [M]  drivers/md/persistent-data/dm-block-manager.o
  CC      mm/sparse.o
  CC      lib/random32.o
  CC [M]  net/ipv4/udp_tunnel_nic.o
  CC [M]  drivers/gpu/drm/vgem/vgem_drv.o
  LD [M]  drivers/gpu/drm/ttm/ttm.o
  CC [M]  drivers/ptp/ptp_kvm_common.o
  CC [M]  drivers/gpu/drm/vgem/vgem_fence.o
  CC [M]  drivers/net/ethernet/intel/e1000e/mac.o
  CC      drivers/usb/core/quirks.o
  CC      drivers/acpi/acpica/utcopy.o
  CC [M]  drivers/gpu/drm/xe/xe_bb.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_migrate_test.o
  CC      fs/btrfs/block-rsv.o
  CC      kernel/relay.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/atombios_crtc.o
  CC      net/ipv6/ip6_icmp.o
  AR      drivers/watchdog/built-in.a
  CC      drivers/opp/debugfs.o
  CC      lib/bust_spinlocks.o
  CC      drivers/cpufreq/cpufreq.o
  CC      drivers/usb/host/xhci-mem.o
  CC      drivers/cpufreq/freq_table.o
  CC      arch/x86/kernel/trace_clock.o
  CC [M]  drivers/md/persistent-data/dm-space-map-common.o
  CC      drivers/input/vivaldi-fmap.o
  CC      arch/x86/kernel/trace.o
  CC      drivers/usb/core/devices.o
  CC [M]  net/bluetooth/sco.o
  CC      drivers/input/input-leds.o
  CC [M]  drivers/md/persistent-data/dm-space-map-disk.o
  CC      drivers/acpi/acpica/utexcep.o
  CC      drivers/cpuidle/governors/menu.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_mocs_test.o
  CC [M]  drivers/net/ethernet/intel/igbvf/netdev.o
  CC      drivers/cpuidle/governors/haltpoll.o
  CC [M]  drivers/i2c/busses/i2c-piix4.o
  CC      drivers/thermal/thermal_sysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_bo.o
  LD [M]  drivers/gpu/drm/vgem/vgem.o
  LD [M]  drivers/ptp/ptp.o
  CC [M]  drivers/net/phy/aquantia_main.o
  AR      drivers/usb/misc/built-in.a
  LD [M]  drivers/ptp/ptp_kvm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.o
  CC      drivers/usb/core/phy.o
  CC      drivers/usb/serial/generic.o
  CC      fs/btrfs/delalloc-space.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/object.o
  CC      lib/kasprintf.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/client.o
  CC      mm/sparse-vmemmap.o
  AR      drivers/opp/built-in.a
  CC      drivers/usb/gadget/udc/core.o
  CC [M]  drivers/gpu/drm/xe/xe_bo_evict.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_nvm.o
  CC [M]  drivers/usb/class/usbtmc.o
  CC      drivers/usb/gadget/udc/trace.o
  CC      drivers/acpi/acpica/utdebug.o
  CC      drivers/cpufreq/cpufreq_performance.o
  CC [M]  drivers/net/usb/mcs7830.o
  CC      arch/x86/kernel/rethook.o
  CC      drivers/cpufreq/cpufreq_ondemand.o
  CC      drivers/input/mousedev.o
  CC [M]  drivers/net/phy/aquantia_hwmon.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_pci_test.o
  CC [M]  drivers/gpu/drm/i915/i915_mitigations.o
  CC      lib/bitmap.o
  CC      drivers/md/md-bitmap.o
  CC      kernel/utsname_sysctl.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_phy.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_phy.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_common.o
  CC      net/ipv6/output_core.o
  CC      drivers/cpufreq/cpufreq_governor.o
  LD [M]  net/ipv4/udp_tunnel.o
  CC      drivers/input/evdev.o
  CC      drivers/acpi/acpica/utdecode.o
  AR      net/ipv4/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_debugfs.o
  CC      drivers/cpufreq/cpufreq_governor_attr_set.o
  CC [M]  drivers/net/ethernet/intel/e1000e/manage.o
  CC      drivers/acpi/acpica/utdelete.o
  CC [M]  drivers/md/persistent-data/dm-space-map-metadata.o
  CC      drivers/thermal/thermal_trip.o
  CC      kernel/delayacct.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/atom.o
  AR      drivers/cpuidle/governors/built-in.a
  CC      drivers/cpuidle/cpuidle.o
  CC      drivers/cpufreq/acpi-cpufreq.o
  CC      drivers/usb/core/port.o
  CC      lib/scatterlist.o
  CC      arch/x86/kernel/crash_core_64.o
  CC      drivers/usb/serial/bus.o
  CC      mm/mmu_notifier.o
  CC      drivers/acpi/acpica/uterror.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/vf.o
  CC      drivers/acpi/acpica/uteval.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/conn.o
  CC [M]  drivers/i2c/busses/i2c-designware-pcidrv.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_rtp_test.o
  CC [M]  drivers/net/phy/ax88796b.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/mbx.o
  CC      drivers/acpi/acpica/utglobal.o
  CC      drivers/cpufreq/intel_pstate.o
  CC      drivers/cpuidle/driver.o
  CC [M]  drivers/net/usb/usbnet.o
  AR      drivers/usb/gadget/function/built-in.a
  CC [M]  drivers/net/ethernet/intel/igc/igc_diag.o
  CC [M]  net/bluetooth/iso.o
  CC [M]  net/bluetooth/a2mp.o
  CC      lib/list_sort.o
  AR      drivers/usb/gadget/legacy/built-in.a
  CC [M]  drivers/gpu/drm/xe/tests/xe_wa_test.o
  CC      kernel/taskstats.o
  CC      drivers/thermal/thermal_helpers.o
  CC      drivers/cpuidle/governor.o
  CC      drivers/usb/host/xhci-ext-caps.o
  CC [M]  drivers/gpu/drm/i915/i915_module.o
  CC      kernel/tsacct.o
  CC      drivers/acpi/acpica/uthex.o
  CC      lib/uuid.o
  CC      drivers/thermal/thermal_hwmon.o
  CC      fs/btrfs/block-group.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_ethtool.o
  AR      drivers/usb/gadget/udc/built-in.a
  CC      arch/x86/kernel/module.o
  CC      drivers/usb/gadget/usbstring.o
  CC [M]  drivers/md/persistent-data/dm-transaction-manager.o
  CC      drivers/usb/core/hcd-pci.o
  CC      drivers/usb/gadget/config.o
  AR      drivers/input/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.o
  CC      drivers/usb/serial/console.o
  CC      drivers/mmc/core/core.o
  CC      drivers/mmc/host/sdhci.o
  CC      net/ipv6/protocol.o
  CC [M]  drivers/net/ethernet/intel/e1000e/nvm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.o
  LD [M]  drivers/net/ethernet/intel/igbvf/igbvf.o
  CC      lib/iov_iter.o
  AR      drivers/ufs/built-in.a
  CC      mm/ksm.o
  CC      kernel/tracepoint.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_mbx.o
  CC      drivers/cpuidle/sysfs.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/device.o
  CC      drivers/acpi/acpica/utids.o
  CC [M]  drivers/net/phy/bcm7xxx.o
  CC      drivers/mmc/host/sdhci-pci-core.o
  CC      drivers/usb/serial/ftdi_sio.o
  CC      net/ipv6/ip6_offload.o
  CC [M]  drivers/net/ethernet/intel/e1000e/phy.o
  CC      drivers/thermal/gov_fair_share.o
  LD [M]  drivers/i2c/busses/i2c-designware-pci.o
  AR      drivers/i2c/busses/built-in.a
  CC      drivers/usb/host/xhci-ring.o
  AR      drivers/net/ethernet/intel/built-in.a
  CC      drivers/i2c/i2c-core-acpi.o
  CC      drivers/thermal/gov_step_wise.o
  CC      drivers/usb/host/xhci-hub.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_i210.o
  CC      lib/clz_ctz.o
  CC [M]  drivers/net/ethernet/intel/e100.o
  CC [M]  drivers/gpu/drm/xe/xe_devcoredump.o
  CC      arch/x86/kernel/early_printk.o
  CC      arch/x86/kernel/hpet.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/ethtool.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_ptp.o
  CC [M]  drivers/md/persistent-data/dm-btree.o
  CC      drivers/acpi/acpica/utinit.o
  CC [M]  drivers/gpu/drm/xe/xe_device.o
  CC      drivers/usb/gadget/epautoconf.o
  CC      drivers/mmc/host/sdhci-pci-o2micro.o
  CC      drivers/usb/core/usb-acpi.o
  CC      drivers/mmc/host/sdhci-pci-arasan.o
  CC [M]  drivers/net/mii.o
  CC [M]  drivers/gpu/drm/i915/i915_params.o
  CC      drivers/cpuidle/poll_state.o
  CC      kernel/latencytop.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.o
  CC      drivers/mmc/core/bus.o
  CC      arch/x86/kernel/amd_nb.o
  CC      drivers/thermal/gov_user_space.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_dump.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_82599.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_ptp.o
  CC      drivers/acpi/acpica/utlock.o
  CC      net/ipv6/tcpv6_offload.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/disp.o
  CC [M]  drivers/net/phy/bcm87xx.o
  CC      drivers/cpuidle/cpuidle-haltpoll.o
  CC [M]  drivers/net/usb/cdc_ncm.o
  CC [M]  drivers/net/usb/r8153_ecm.o
  CC      drivers/usb/gadget/composite.o
  AR      drivers/cpufreq/built-in.a
  CC      arch/x86/kernel/kvm.o
  CC      drivers/usb/gadget/functions.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_object.o
  CC      drivers/i2c/i2c-core-slave.o
  CC [M]  net/bluetooth/amp.o
  CC      net/ipv6/exthdrs_offload.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_hwmon.o
  CC      drivers/acpi/acpica/utmath.o
  CC      drivers/usb/serial/pl2303.o
  AR      drivers/usb/core/built-in.a
  CC [M]  drivers/gpu/drm/i915/i915_pci.o
  CC [M]  drivers/net/ethernet/intel/e1000e/param.o
  AR      drivers/leds/trigger/built-in.a
  CC [M]  drivers/leds/trigger/ledtrig-audio.o
  CC      kernel/irq_work.o
  AR      drivers/thermal/built-in.a
  AR      drivers/leds/blink/built-in.a
  CC      drivers/mmc/host/sdhci-pci-dwc-mshc.o
  CC      drivers/acpi/acpica/utmisc.o
  CC      net/ipv6/inet6_hashtables.o
  CC [M]  net/bluetooth/hci_debugfs.o
  CC      arch/x86/kernel/kvmclock.o
  AR      drivers/cpuidle/built-in.a
  CC [M]  drivers/net/mdio.o
  CC      drivers/mmc/host/sdhci-pci-gli.o
  AR      drivers/firmware/arm_ffa/built-in.a
  CC [M]  drivers/net/phy/bcm-phy-lib.o
  CC      drivers/mmc/core/host.o
  CC [M]  drivers/gpu/drm/xe/xe_device_sysfs.o
  AR      drivers/firmware/arm_scmi/built-in.a
  CC [M]  drivers/md/persistent-data/dm-btree-remove.o
  AR      drivers/firmware/broadcom/built-in.a
  CC [M]  drivers/net/phy/broadcom.o
  AR      drivers/firmware/cirrus/built-in.a
  AR      drivers/firmware/meson/built-in.a
  CC [M]  drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.o
  AR      drivers/firmware/imx/built-in.a
  AR      drivers/firmware/psci/built-in.a
  CC      drivers/md/md-autodetect.o
  CC      drivers/clocksource/acpi_pm.o
  AR      drivers/crypto/stm32/built-in.a
  AR      drivers/crypto/xilinx/built-in.a
  AR      drivers/crypto/hisilicon/built-in.a
  CC      drivers/firmware/efi/libstub/efi-stub-helper.o
  AR      drivers/crypto/intel/keembay/built-in.a
  CC      drivers/clocksource/i8253.o
  AR      drivers/crypto/intel/ixp4xx/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvif/driver.o
  AR      drivers/crypto/intel/built-in.a
  AR      drivers/crypto/starfive/built-in.a
  CC      drivers/md/dm-uevent.o
  CC      drivers/usb/gadget/configfs.o
  AR      drivers/crypto/built-in.a
  CC      drivers/acpi/acpica/utmutex.o
  CC      drivers/firmware/efi/libstub/gop.o
  CC      drivers/hid/usbhid/hid-core.o
  CC      drivers/firmware/efi/libstub/secureboot.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_tsn.o
  AR      drivers/leds/simple/built-in.a
  CC      drivers/leds/led-core.o
  CC      lib/bsearch.o
  CC      drivers/usb/gadget/u_f.o
  CC      net/ipv6/mcast_snoop.o
  CC      kernel/static_call.o
  CC      drivers/i2c/i2c-dev.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_xdp.o
  CC [M]  net/ipv6/ip6_udp_tunnel.o
  AR      drivers/usb/serial/built-in.a
  CC [M]  drivers/net/ethernet/intel/e1000e/ethtool.o
  CC      arch/x86/kernel/paravirt.o
  CC      drivers/acpi/acpica/utnonansi.o
  CC [M]  drivers/gpu/drm/xe/xe_dma_buf.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_display.o
  CC [M]  drivers/gpu/drm/i915/i915_scatterlist.o
  CC [M]  drivers/net/tun.o
  CC      fs/btrfs/discard.o
  AR      drivers/clocksource/built-in.a
  CC      drivers/acpi/acpica/utobject.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.o
  LD [M]  drivers/net/ethernet/intel/igb/igb.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_82598.o
  CC [M]  drivers/net/ethernet/intel/e1000e/netdev.o
  CC      drivers/acpi/acpica/utosi.o
  CC [M]  drivers/md/persistent-data/dm-btree-spine.o
  CC      drivers/mmc/core/mmc.o
  CC [M]  drivers/net/ethernet/intel/e1000e/ptp.o
  CC      drivers/mmc/core/mmc_ops.o
  CC [M]  drivers/gpu/drm/xe/xe_drm_client.o
  CC      drivers/md/dm.o
  CC      drivers/firmware/efi/efi-bgrt.o
  CC [M]  drivers/gpu/drm/xe/xe_exec.o
  CC      lib/find_bit.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/event.o
  LD [M]  drivers/net/usb/asix.o
  CC      mm/slub.o
  CC      drivers/firmware/efi/efi.o
  CC      drivers/acpi/acpica/utownerid.o
  CC      kernel/static_call_inline.o
  CC      drivers/firmware/efi/libstub/tpm.o
  CC      drivers/leds/led-class.o
  CC      drivers/acpi/acpica/utpredef.o
  CC      drivers/leds/led-triggers.o
  CC      drivers/firmware/efi/libstub/file.o
  CC [M]  drivers/net/phy/lxt.o
  CC [M]  drivers/net/phy/realtek.o
  CC      lib/llist.o
  CC      drivers/usb/host/xhci-dbg.o
  CC      lib/lwq.o
  CC      mm/migrate.o
  CC [M]  drivers/i2c/i2c-smbus.o
  CC      drivers/mmc/host/sdhci-acpi.o
  CC      mm/memory-tiers.o
  CC      mm/migrate_device.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/fifo.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.o
  CC [M]  drivers/i2c/i2c-mux.o
  LD [M]  net/bluetooth/bluetooth.o
  CC      drivers/acpi/acpica/utresdecode.o
  CC      lib/memweight.o
  CC      arch/x86/kernel/pvclock.o
  AR      drivers/usb/gadget/built-in.a
  CC      arch/x86/kernel/pcspeaker.o
  AR      drivers/i2c/built-in.a
  CC      arch/x86/kernel/check.o
  CC      drivers/usb/host/xhci-trace.o
  CC      lib/kfifo.o
  LD [M]  drivers/md/persistent-data/dm-persistent-data.o
  CC      drivers/firmware/efi/vars.o
  CC      mm/huge_memory.o
  CC      drivers/mmc/host/cqhci-core.o
  CC      drivers/usb/host/xhci-debugfs.o
  LD [M]  drivers/net/ethernet/intel/igc/igc.o
  CC      drivers/hid/usbhid/hiddev.o
  CC      arch/x86/kernel/uprobes.o
  CC      fs/btrfs/reflink.o
  CC      kernel/user-return-notifier.o
  AR      net/ipv6/built-in.a
  CC      drivers/usb/host/xhci-pci.o
  AR      net/built-in.a
  CC      fs/fs_parser.o
  CC [M]  drivers/gpu/drm/i915/i915_suspend.o
  CC      drivers/firmware/efi/libstub/mem.o
  AR      drivers/leds/built-in.a
  CC [M]  drivers/mmc/host/sdhci-pltfm.o
  CC [M]  drivers/net/phy/smsc.o
  CC      drivers/acpi/acpica/utresrc.o
  CC      drivers/acpi/acpica/utstate.o
  CC      mm/khugepaged.o
  CC [M]  drivers/net/veth.o
  AR      drivers/staging/media/built-in.a
  AR      drivers/staging/built-in.a
  CC      mm/page_counter.o
  CC      lib/percpu-refcount.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/head.o
  CC [M]  drivers/gpu/drm/xe/xe_execlist.o
  CC      drivers/acpi/acpica/utstring.o
  CC      kernel/padata.o
  CC      drivers/md/dm-table.o
  CC      arch/x86/kernel/perf_regs.o
  CC      mm/memcontrol.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_phy.o
  CC      drivers/acpi/acpi_lpit.o
  CC      drivers/mmc/core/sd.o
  CC      mm/vmpressure.o
  CC      drivers/firmware/efi/reboot.o
  CC      fs/fsopen.o
  CC      drivers/mmc/core/sd_ops.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/mem.o
  CC      drivers/mmc/core/sdio.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/mmu.o
  CC      drivers/firmware/efi/memattr.o
  CC      arch/x86/kernel/tracepoint.o
  CC      drivers/acpi/acpica/utstrsuppt.o
  AR      drivers/platform/x86/amd/built-in.a
  CC      drivers/acpi/acpica/utstrtoul64.o
  CC      drivers/platform/x86/intel/pmc/core.o
  CC [M]  drivers/platform/x86/intel/pmt/class.o
  CC      lib/rhashtable.o
  CC      drivers/platform/x86/intel/pmc/core_ssram.o
  CC      drivers/platform/x86/intel/turbo_max_3.o
  CC      drivers/platform/x86/intel/pmc/spt.o
  CC      drivers/firmware/efi/libstub/random.o
  CC      lib/base64.o
  CC      drivers/firmware/efi/libstub/randomalloc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.o
  CC      drivers/acpi/prmt.o
  AR      drivers/hid/usbhid/built-in.a
  CC      drivers/hid/hid-core.o
  CC      drivers/firmware/efi/tpm.o
  CC      drivers/firmware/efi/memmap.o
  CC      drivers/platform/x86/p2sb.o
  CC      drivers/acpi/acpi_pcc.o
  CC      drivers/acpi/acpica/utxface.o
  CC [M]  drivers/platform/x86/intel/vsec.o
  CC      drivers/acpi/acpica/utxfinit.o
  CC      drivers/acpi/acpica/utxferror.o
  CC      mm/swap_cgroup.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/ipsec.o
  AR      drivers/mmc/host/built-in.a
  CC      arch/x86/kernel/itmt.o
  LD [M]  drivers/net/phy/aquantia.o
  CC [M]  drivers/platform/x86/intel/rst.o
  AR      drivers/net/phy/built-in.a
  CC [M]  drivers/gpu/drm/i915/i915_switcheroo.o
  CC      drivers/firmware/efi/libstub/pci.o
  CC      drivers/platform/x86/pmc_atom.o
  CC [M]  drivers/gpu/drm/xe/xe_exec_queue.o
  CC      mm/hugetlb_cgroup.o
  CC      drivers/acpi/ac.o
  CC      kernel/jump_label.o
  CC      mm/kmemleak.o
  CC      fs/btrfs/subpage.o
  CC      drivers/firmware/efi/esrt.o
  CC      fs/init.o
  CC      drivers/mmc/core/sdio_ops.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_bios.o
  CC [M]  drivers/platform/x86/intel/pmt/telemetry.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/outp.o
  CC      drivers/acpi/button.o
  CC      drivers/acpi/acpica/utxfmutex.o
  CC      drivers/acpi/fan_core.o
  CC      fs/btrfs/tree-mod-log.o
  CC      drivers/platform/x86/intel/pmc/cnp.o
  CC      lib/once.o
  AR      drivers/platform/surface/built-in.a
  CC      drivers/mmc/core/sdio_bus.o
  CC      drivers/mmc/core/sdio_cis.o
  CC      drivers/acpi/fan_attr.o
  CC      mm/page_isolation.o
  AR      drivers/usb/host/built-in.a
  AR      drivers/usb/built-in.a
  CC      fs/kernel_read_file.o
  CC      drivers/md/dm-target.o
  AR      drivers/net/ethernet/microsoft/built-in.a
  CC      drivers/firmware/efi/efi-pstore.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.o
  CC      arch/x86/kernel/umip.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/atombios_dp.o
  CC      drivers/mailbox/mailbox.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/timer.o
  AR      drivers/acpi/acpica/built-in.a
  CC      fs/mnt_idmapping.o
  CC      fs/btrfs/extent-io-tree.o
  AR      drivers/net/ethernet/litex/built-in.a
  CC      drivers/firmware/efi/libstub/skip_spaces.o
  CC [M]  drivers/platform/x86/wmi.o
  CC      drivers/acpi/processor_driver.o
  AR      drivers/net/ethernet/microchip/built-in.a
  CC      drivers/firmware/efi/libstub/lib-cmdline.o
  AR      drivers/net/ethernet/mscc/built-in.a
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.o
  AR      drivers/net/ethernet/neterion/built-in.a
  CC      fs/remap_range.o
  AR      drivers/net/ethernet/netronome/built-in.a
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_mbx.o
  CC      mm/early_ioremap.o
  AR      drivers/net/ethernet/ni/built-in.a
  CC [M]  drivers/platform/x86/intel/pmt/crashlog.o
  LD [M]  drivers/platform/x86/intel/pmt/pmt_class.o
  CC      drivers/firmware/efi/libstub/lib-ctype.o
  LD [M]  drivers/platform/x86/intel/pmt/pmt_telemetry.o
  CC      kernel/context_tracking.o
  CC      drivers/platform/x86/intel/pmc/icl.o
  CC      lib/refcount.o
  CC      drivers/platform/x86/intel/pmc/tgl.o
  CC      drivers/platform/x86/intel/pmc/adl.o
  CC      kernel/iomem.o
  CC      drivers/firmware/efi/libstub/alignedmem.o
  CC      kernel/rseq.o
  CC      drivers/mailbox/pcc.o
  CC      drivers/devfreq/devfreq.o
  CC      drivers/powercap/powercap_sys.o
  CC [M]  drivers/gpu/drm/i915/i915_sysfs.o
  CC      drivers/powercap/intel_rapl_common.o
  CC [M]  drivers/devfreq/governor_simpleondemand.o
  CC      lib/rcuref.o
  CC      mm/cma.o
  AR      drivers/net/ethernet/packetengines/built-in.a
  AR      drivers/firmware/qcom/built-in.a
  AR      drivers/net/ethernet/realtek/built-in.a
  CC [M]  drivers/net/ethernet/realtek/8139cp.o
  LD [M]  drivers/net/ethernet/intel/ixgbevf/ixgbevf.o
  AR      drivers/net/ethernet/renesas/built-in.a
  AR      drivers/net/ethernet/sfc/built-in.a
  CC      mm/secretmem.o
  CC      drivers/mmc/core/sdio_io.o
  CC [M]  drivers/net/ethernet/realtek/8139too.o
  CC      mm/userfaultfd.o
  AR      drivers/firmware/smccc/built-in.a
  CC      mm/memremap.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/vmm.o
  CC      arch/x86/kernel/unwind_orc.o
  CC      drivers/mmc/core/sdio_irq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_afmt.o
  CC      lib/usercopy.o
  CC [M]  drivers/gpu/drm/xe/xe_force_wake.o
  CC      drivers/acpi/processor_thermal.o
  CC      drivers/md/dm-linear.o
  CC      drivers/hid/hid-input.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_x540.o
  AR      drivers/firmware/tegra/built-in.a
  CC      drivers/firmware/efi/cper.o
  CC [M]  drivers/devfreq/governor_performance.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_trace_points.o
  CC      lib/errseq.o
  CC      drivers/platform/x86/intel/pmc/mtl.o
  CC [M]  drivers/gpu/drm/xe/xe_ggtt.o
  CC      fs/buffer.o
  CC      drivers/firmware/efi/libstub/relocate.o
  LD [M]  drivers/platform/x86/intel/pmt/pmt_crashlog.o
  LD [M]  drivers/net/ethernet/intel/e1000e/e1000e.o
  CC      mm/hmm.o
  CC      drivers/mmc/core/slot-gpio.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/atombios_encoders.o
  CC      mm/memfd.o
  CC      drivers/firmware/efi/cper_cxl.o
  CC      mm/bootmem_info.o
  CC      drivers/firmware/efi/runtime-wrappers.o
  CC      lib/bucket_locks.o
  CC [M]  drivers/platform/x86/wmi-bmof.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_sa.o
  LD [M]  drivers/platform/x86/intel/intel-rst.o
  CC      drivers/mmc/core/regulator.o
  GZIP    kernel/config_data.gz
  AR      drivers/mailbox/built-in.a
  AR      drivers/perf/built-in.a
  CC      drivers/ras/ras.o
  CC      drivers/mmc/core/debugfs.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_x550.o
  CC      kernel/configs.o
  CC      drivers/firmware/efi/libstub/printk.o
  CC      drivers/firmware/efi/libstub/vsprintf.o
  AR      drivers/firmware/xilinx/built-in.a
  CC [M]  drivers/platform/x86/mxm-wmi.o
  LD [M]  drivers/platform/x86/intel/intel_vsec.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/atombios_i2c.o
  CC      drivers/firmware/efi/dev-path-parser.o
  CC      drivers/mmc/core/block.o
  CC      drivers/acpi/processor_idle.o
  CC [M]  drivers/gpu/drm/i915/i915_utils.o
  CC [M]  drivers/net/ethernet/realtek/r8169_main.o
  CC      drivers/md/dm-stripe.o
  CC      drivers/firmware/efi/libstub/x86-stub.o
  CC      arch/x86/kernel/callthunks.o
  CC [M]  drivers/net/ethernet/realtek/r8169_firmware.o
  CC      drivers/md/dm-ioctl.o
  CC [M]  drivers/gpu/drm/xe/xe_gpu_scheduler.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/user.o
  CC      drivers/platform/x86/intel/pmc/pltdrv.o
  CC      drivers/powercap/intel_rapl_msr.o
  CC      lib/generic-radix-tree.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.o
  CC      drivers/hid/hid-quirks.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/userc361.o
  CC [M]  drivers/platform/x86/intel_ips.o
  CC      drivers/acpi/processor_throttling.o
  CC      fs/mpage.o
  AR      kernel/built-in.a
  CC      drivers/mmc/core/queue.o
  AR      drivers/devfreq/built-in.a
  CC      drivers/firmware/efi/apple-properties.o
  CC      fs/btrfs/fs.o
  CC      fs/proc_namespace.o
  CC [M]  drivers/gpu/drm/ast/ast_drv.o
  CC      drivers/gpu/drm/drm_mipi_dsi.o
  AR      drivers/net/ethernet/smsc/built-in.a
  CC [M]  drivers/net/ethernet/smsc/smsc9420.o
  AR      drivers/net/ethernet/socionext/built-in.a
  AR      drivers/net/ethernet/vertexcom/built-in.a
  CC [M]  drivers/gpu/drm/drm_aperture.o
  CC      arch/x86/kernel/cet.o
  CC      drivers/firmware/efi/libstub/x86-5lvl.o
  CC      drivers/firmware/efi/earlycon.o
  HOSTCC  drivers/gpu/drm/xe/xe_gen_wa_oob
  CC      arch/x86/kernel/mmconf-fam10h_64.o
  CC [M]  drivers/gpu/drm/drm_atomic.o
  CC      fs/direct-io.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.o
  CC      drivers/acpi/processor_perflib.o
  CC      lib/bitmap-str.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc_submit.o
  CC      drivers/acpi/container.o
  AR      drivers/net/ethernet/wangxun/built-in.a
  CC      drivers/acpi/thermal.o
  AR      drivers/net/ethernet/xilinx/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt.o
  CC [M]  drivers/net/ethernet/realtek/r8169_phy_config.o
  CC      drivers/ras/debugfs.o
  AR      drivers/platform/x86/intel/pmc/built-in.a
  AR      drivers/platform/x86/intel/built-in.a
  AR      drivers/platform/x86/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.o
  AR      drivers/net/ethernet/synopsys/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_ccs_mode.o
  CC      lib/string_helpers.o
  AR      drivers/hwtracing/intel_th/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/client.o
  AR      drivers/powercap/built-in.a
  CC      fs/eventpoll.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_clock.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_debugfs.o
  CC      arch/x86/kernel/vsmp_64.o
  CC [M]  drivers/gpu/drm/i915/intel_clock_gating.o
  CC [M]  drivers/gpu/drm/i915/intel_device_info.o
  CC      drivers/firmware/efi/cper-x86.o
  CC      drivers/hid/hid-debug.o
  CC      fs/btrfs/messages.o
  CC      lib/hexdump.o
  STUBCPY drivers/firmware/efi/libstub/alignedmem.stub.o
  CC [M]  drivers/gpu/drm/drm_atomic_uapi.o
  CC      drivers/android/binderfs.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_freq.o
  STUBCPY drivers/firmware/efi/libstub/efi-stub-helper.stub.o
  AR      drivers/ras/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_idle.o
  STUBCPY drivers/firmware/efi/libstub/file.stub.o
  AR      drivers/nvmem/layouts/built-in.a
  STUBCPY drivers/firmware/efi/libstub/gop.stub.o
  CC      drivers/nvmem/core.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_mcr.o
  AR      drivers/platform/built-in.a
  STUBCPY drivers/firmware/efi/libstub/lib-cmdline.stub.o
  STUBCPY drivers/firmware/efi/libstub/lib-ctype.stub.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_pagefault.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/engine.o
  CC [M]  drivers/gpu/drm/drm_auth.o
  CC      drivers/android/binder.o
  STUBCPY drivers/firmware/efi/libstub/mem.stub.o
  STUBCPY drivers/firmware/efi/libstub/pci.stub.o
  STUBCPY drivers/firmware/efi/libstub/printk.stub.o
  CC [M]  drivers/gpu/drm/ast/ast_i2c.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.o
  STUBCPY drivers/firmware/efi/libstub/random.stub.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_lib.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_ptp.o
  STUBCPY drivers/firmware/efi/libstub/randomalloc.stub.o
  STUBCPY drivers/firmware/efi/libstub/relocate.stub.o
  CC [M]  drivers/gpu/drm/ast/ast_main.o
  STUBCPY drivers/firmware/efi/libstub/secureboot.stub.o
  CC [M]  drivers/mtd/chips/chipreg.o
  STUBCPY drivers/firmware/efi/libstub/skip_spaces.stub.o
  STUBCPY drivers/firmware/efi/libstub/tpm.stub.o
  AR      drivers/net/ethernet/pensando/built-in.a
  STUBCPY drivers/firmware/efi/libstub/vsprintf.stub.o
  CC      lib/kstrtox.o
  CC      drivers/firmware/dmi_scan.o
  STUBCPY drivers/firmware/efi/libstub/x86-5lvl.stub.o
  CC      drivers/md/dm-io.o
  STUBCPY drivers/firmware/efi/libstub/x86-stub.stub.o
  AR      drivers/firmware/efi/libstub/lib.a
  CC      fs/btrfs/bio.o
  CC      drivers/firmware/dmi-sysfs.o
  CC      drivers/firmware/dmi-id.o
  CC      drivers/md/dm-kcopyd.o
  AR      arch/x86/kernel/built-in.a
  CC      drivers/firmware/memmap.o
  CC      drivers/acpi/acpi_memhotplug.o
  AR      arch/x86/built-in.a
  CC [M]  drivers/gpu/drm/drm_blend.o
  CC      lib/debug_info.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/enum.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sysfs.o
  AR      drivers/mmc/core/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/event.o
  AR      drivers/mmc/built-in.a
  AR      mm/built-in.a
  CC      drivers/acpi/ioapic.o
  CC [M]  drivers/uio/uio.o
  AR      drivers/firmware/efi/built-in.a
  CC [M]  drivers/vfio/pci/vfio_pci_core.o
  CC      fs/anon_inodes.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.o
  CC [M]  drivers/pps/pps.o
  CC [M]  drivers/vfio/pci/vfio_pci_intrs.o
  CC [M]  drivers/gpu/drm/drm_bridge.o
  CC [M]  drivers/vfio/pci/vfio_pci_rdwr.o
  CC [M]  drivers/pps/kapi.o
  CC [M]  drivers/bluetooth/btusb.o
  CC [M]  drivers/dca/dca-core.o
  CC      drivers/android/binder_alloc.o
  CC [M]  drivers/ssb/main.o
  CC [M]  drivers/bluetooth/btintel.o
  CC [M]  drivers/mtd/mtdcore.o
  CC      drivers/hid/hidraw.o
  CC [M]  drivers/vfio/vfio_main.o
  CC [M]  drivers/pps/sysfs.o
  CC [M]  drivers/gpu/drm/ast/ast_mm.o
  CC [M]  drivers/vfio/group.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o
  CC      drivers/acpi/battery.o
  CC [M]  drivers/bluetooth/btbcm.o
  CC      lib/iomap.o
  CC [M]  drivers/gpu/drm/ast/ast_mode.o
  CC      fs/signalfd.o
  CC [M]  drivers/mtd/mtdsuper.o
  AR      drivers/nvmem/built-in.a
  CC      lib/pci_iomap.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_topology.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_pll.o
  CC      fs/timerfd.o
  GEN     xe_wa_oob.c xe_wa_oob.h
  AR      drivers/firmware/built-in.a
  GEN     xe_wa_oob.c xe_wa_oob.h
  CC [M]  drivers/gpu/drm/xe/xe_guc_ads.o
  CC [M]  drivers/vhost/net.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_ct.o
  CC      lib/iomap_copy.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_db_mgr.o
  CC [M]  drivers/vhost/vhost.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/firmware.o
  CC      fs/btrfs/lru_cache.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/gpuobj.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/intr.o
  CC      fs/btrfs/raid-stripe-tree.o
  LD [M]  drivers/net/ethernet/realtek/r8169.o
  CC [M]  drivers/gpu/drm/i915/intel_memory_region.o
  CC [M]  drivers/gpu/drm/ast/ast_post.o
  CC [M]  drivers/gpu/drm/ast/ast_dp501.o
  CC      lib/devres.o
  CC      drivers/md/dm-sysfs.o
  CC [M]  drivers/vfio/container.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_xsk.o
  LD [M]  drivers/pps/pps_core.o
  CC [M]  drivers/gpu/drm/i915/intel_pcode.o
  CC [M]  drivers/gpu/drm/drm_cache.o
  CC [M]  drivers/gpu/drm/drm_client.o
  CC [M]  drivers/dca/dca-sysfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.o
  CC      fs/eventfd.o
  CC      lib/check_signature.o
  CC [M]  drivers/gpu/drm/ast/ast_dp.o
  CC [M]  drivers/vhost/iotlb.o
  CC      fs/userfaultfd.o
  CC      fs/aio.o
  CC      drivers/hid/hid-generic.o
  CC [M]  drivers/ssb/scan.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/ioctl.o
  CC [M]  drivers/mtd/mtdconcat.o
  CC      lib/interval_tree.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.o
  CC [M]  drivers/gpu/drm/i915/intel_region_ttm.o
  CC      drivers/hid/hid-a4tech.o
  CC [M]  drivers/vfio/pci/vfio_pci_config.o
  CC      drivers/acpi/hed.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_debugfs.o
  CC      lib/assoc_array.o
  CC      lib/list_debug.o
  CC [M]  drivers/gpu/drm/drm_client_modeset.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.o
  CC      fs/btrfs/acl.o
  LD [M]  drivers/dca/dca.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.o
  CC      lib/debugobjects.o
  CC      drivers/md/dm-stats.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/memory.o
  CC [M]  drivers/gpu/drm/i915/intel_runtime_pm.o
  CC [M]  drivers/bluetooth/btrtl.o
  CC      lib/bitrev.o
  CC      drivers/hid/hid-apple.o
  CC [M]  drivers/vfio/virqfd.o
  CC [M]  drivers/vfio/vfio_iommu_type1.o
  CC [M]  drivers/mtd/mtdpart.o
  CC      drivers/acpi/bgrt.o
  CC      drivers/acpi/cppc_acpi.o
  CC      lib/crc16.o
  LD [M]  drivers/vhost/vhost_iotlb.o
  CC      drivers/acpi/spcr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.o
  CC [M]  drivers/ssb/sprom.o
  CC      drivers/md/dm-rq.o
  CC      drivers/hid/hid-belkin.o
  CC      drivers/hid/hid-cherry.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/mm.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_hwconfig.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/object.o
  CC      lib/crc-t10dif.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/oproxy.o
  CC [M]  drivers/mtd/mtdchar.o
  HOSTCC  lib/gen_crc32table
  CC      drivers/md/dm-io-rewind.o
  CC [M]  drivers/ssb/pci.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb.o
  CC      lib/libcrc32c.o
  LD [M]  drivers/gpu/drm/ast/ast.o
  CC      drivers/md/dm-builtin.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_log.o
  CC      lib/xxhash.o
  CC [M]  drivers/gpu/drm/drm_color_mgmt.o
  CC [M]  drivers/ssb/pcihost_wrapper.o
  CC      drivers/hid/hid-chicony.o
  CC      drivers/acpi/acpi_pad.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vf_error.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_sched.o
  LD [M]  drivers/vhost/vhost_net.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_pc.o
../drivers/gpu/drm/i915/intel_runtime_pm.c: In function ‘dump_and_free_wakeref_tracking’:
../drivers/gpu/drm/i915/intel_runtime_pm.c:224:26: error: implicit declaration of function ‘drm_debug_printer’; did you mean ‘drm_dbg_printer’? [-Werror=implicit-function-declaration]
  224 |   struct drm_printer p = drm_debug_printer("i915");
      |                          ^~~~~~~~~~~~~~~~~
      |                          drm_dbg_printer
../drivers/gpu/drm/i915/intel_runtime_pm.c:224:26: error: invalid initializer
cc1: all warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/i915/intel_runtime_pm.o] Error 1
make[7]: *** Waiting for unfinished jobs....
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb_82598.o
  CC      lib/genalloc.o
  CC      lib/percpu_counter.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/option.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_submit.o
  CC [M]  drivers/vfio/pci/vfio_pci.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.o
  LD [M]  drivers/vfio/pci/vfio-pci-core.o
  CC      drivers/hid/hid-cypress.o
  CC      fs/locks.o
  CC [M]  drivers/ssb/driver_chipcommon.o
make[6]: *** [../scripts/Makefile.build:480: drivers/gpu/drm/i915] Error 2
make[6]: *** Waiting for unfinished jobs....
  CC      lib/fault-inject.o
  CC [M]  drivers/ssb/driver_chipcommon_pmu.o
  AR      fs/btrfs/built-in.a
  CC      fs/binfmt_script.o
  CC [M]  drivers/gpu/drm/xe/xe_heci_gsc.o
  CC      drivers/hid/hid-ezkey.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb_82599.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/ramht.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine.o
  CC [M]  drivers/acpi/acpi_video.o
  CC [M]  drivers/acpi/video_detect.o
  CC      lib/syscall.o
  CC [M]  drivers/md/dm-bufio.o
  CC      fs/binfmt_elf.o
  CC [M]  drivers/ssb/driver_pcicore.o
  LD [M]  drivers/vfio/vfio.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/subdev.o
  CC      fs/compat_binfmt_elf.o
  CC [M]  drivers/md/dm-bio-prison-v1.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/uevent.o
  CC [M]  drivers/md/dm-bio-prison-v2.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.o
  CC [M]  drivers/md/dm-crypt.o
  CC      drivers/hid/hid-kensington.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.o
  CC      drivers/hid/hid-lg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.o
  CC      lib/dynamic_debug.o
  CC      lib/errname.o
  CC      fs/mbcache.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb_nl.o
  LD [M]  drivers/vfio/pci/vfio-pci.o
  AR      drivers/acpi/built-in.a
  CC      fs/posix_acl.o
  LD [M]  drivers/mtd/mtd.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_sysfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.o
  AR      drivers/android/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_csa.o
  CC      fs/coredump.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o
  CC      fs/drop_caches.o
  CC      lib/nlattr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.o
  CC      lib/cpu_rmap.o
  CC      lib/dynamic_queue_limits.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_debugfs.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_ipsec.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_fence.o
  CC      drivers/hid/hid-lg-g15.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.o
  CC      lib/glob.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.o
  CC      drivers/hid/hid-microsoft.o
  CC [M]  drivers/gpu/drm/xe/xe_huc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/nvfw/fw.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/nvfw/hs.o
  LD [M]  drivers/ssb/ssb.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/nvfw/ls.o
  CC [M]  drivers/md/dm-thin.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/nvfw/acr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_umc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.o
  CC      drivers/hid/hid-monterey.o
  CC [M]  drivers/md/dm-thin-metadata.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/nvfw/flcn.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_rap.o
  CC      lib/strncpy_from_user.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/base.o
  CC [M]  drivers/gpu/drm/xe/xe_huc_debugfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.o
  CC      fs/sysctls.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_mca.o
  LD [M]  drivers/acpi/video.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_lsdma.o
  CC      fs/fhandle.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.o
  CC      lib/strnlen_user.o
  CC      lib/net_utils.o
  CC      lib/sg_pool.o
  LD [M]  drivers/md/dm-bio-prison.o
  AR      drivers/md/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/cmdq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/fw.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/msgq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.o
  CC [M]  drivers/gpu/drm/xe/xe_irq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/v1.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.o
  CC      lib/stackdepot.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/cik.o
  CC      lib/ucs2_string.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/gm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/cik_ih.o
  AR      drivers/hid/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/dce_v8_0.o
  CC [M]  drivers/gpu/drm/xe/xe_lrc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/gp102.o
  CC [M]  drivers/gpu/drm/xe/xe_migrate.o
  CC [M]  drivers/gpu/drm/xe/xe_mmio.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/tu102.o
  CC      lib/sbitmap.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/ga100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/ga102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/cik_sdma.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/uvd_v4_2.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vce_v2_0.o
  CC      lib/group_cpus.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/si.o
  CC      lib/fw_table.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.o
  CC [M]  lib/asn1_decoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v6_0.o
  LD [M]  drivers/net/ethernet/intel/ixgbe/ixgbe.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v6_0.o
  AR      fs/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/si_ih.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/si_dma.o
  CC [M]  drivers/gpu/drm/xe/xe_mocs.o
  GEN     lib/oid_registry_data.c
  CC [M]  drivers/gpu/drm/amd/amdgpu/dce_v6_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/uvd_v3_1.o
  AR      drivers/net/ethernet/built-in.a
  CC [M]  lib/oid_registry.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vi.o
  AR      drivers/net/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/mxgpu_vi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v6_1.o
  CC [M]  drivers/gpu/drm/xe/xe_module.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.o
  CC [M]  drivers/gpu/drm/xe/xe_pat.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.o
  CC [M]  drivers/gpu/drm/xe/xe_pci.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm20b.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/soc15.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp108.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/emu_soc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mxgpu_ai.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vega10_reg_init.o
  CC [M]  drivers/gpu/drm/xe/xe_pcode.o
  CC [M]  drivers/gpu/drm/xe/xe_pm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gv100.o
  AR      lib/lib.a
  GEN     lib/crc32table.h
  CC      lib/crc32.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp10b.o
  CC [M]  drivers/gpu/drm/xe/xe_preempt_fence.o
  CC [M]  drivers/gpu/drm/xe/xe_pt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/tu102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vega20_reg_init.o
  CC [M]  drivers/gpu/drm/xe/xe_pt_walk.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.o
  CC [M]  drivers/gpu/drm/xe/xe_query.o
  CC [M]  drivers/gpu/drm/xe/xe_range_fence.o
  LD [M]  drivers/md/dm-thin-pool.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_sr.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_whitelist.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_4.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v2_3.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nv.o
  CC [M]  drivers/gpu/drm/xe/xe_rtp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/arct_reg_init.o
  CC [M]  drivers/gpu/drm/xe/xe_ring_ops.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mxgpu_nv.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/nv50.o
  CC [M]  drivers/gpu/drm/xe/xe_sa.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_2.o
  AR      lib/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_sched_job.o
  CC [M]  drivers/gpu/drm/xe/xe_step.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/g84.o
  CC [M]  drivers/gpu/drm/xe/xe_sync.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v4_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v5_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/aldebaran_reg_init.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.o
  CC [M]  drivers/gpu/drm/xe/xe_tile.o
  CC [M]  drivers/gpu/drm/xe/xe_tile_sysfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/aldebaran.o
  CC [M]  drivers/gpu/drm/xe/xe_trace.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/soc21.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/gk20a.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_sys_mgr.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sienna_cichlid.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/gm107.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_vram_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/gm20b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/tu102.o
  CC [M]  drivers/gpu/drm/xe/xe_tuning.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v4_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.o
  CC [M]  drivers/gpu/drm/xe/xe_uc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v6_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_7.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.o
  CC [M]  drivers/gpu/drm/xe/xe_uc_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_uc_fw.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v5_2.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/lsdma_v6_0.o
  CC [M]  drivers/gpu/drm/xe/xe_vm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/bit.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_9.o
  CC [M]  drivers/gpu/drm/xe/xe_vram_freq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.o
  CC [M]  drivers/gpu/drm/xe/xe_wait_user_fence.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_11.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/df_v1_7.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/boost.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/df_v3_6.o
  CC [M]  drivers/gpu/drm/xe/xe_wa.o
  CC [M]  drivers/gpu/drm/xe/xe_wopcm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/df_v4_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/conn.o
  CC [M]  drivers/gpu/drm/xe/xe_hwmon.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/df_v4_6_2.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_relay.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v7_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/cstep.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.o
  CC [M]  drivers/gpu/drm/xe/xe_memirq.o
  CC [M]  drivers/gpu/drm/xe/xe_sriov.o
  CC [M]  drivers/gpu/drm/xe/xe_lmtt.o
  CC [M]  drivers/gpu/drm/xe/xe_lmtt_2l.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/dcb.o
  CC [M]  drivers/gpu/drm/xe/xe_lmtt_ml.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.o
  CC [M]  drivers/gpu/drm/xe/xe_display.o
  CC [M]  drivers/gpu/drm/xe/display/xe_fb_pin.o
  CC [M]  drivers/gpu/drm/xe/display/xe_hdcp_gsc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/disp.o
  CC [M]  drivers/gpu/drm/xe/display/xe_plane_initial.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_rps.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_misc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/dp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.o
  CC [M]  drivers/gpu/drm/xe/display/xe_dsb_buffer.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.o
  CC [M]  drivers/gpu/drm/xe/display/intel_fbdev_fb.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/extdev.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/fan.o
  CC [M]  drivers/gpu/drm/xe/display/intel_fb_bo.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.o
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_irq.o
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_utils.o
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_dram.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.o
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_pch.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/gpio.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.o
  CC [M]  drivers/gpu/drm/xe/i915-display/icl_dsi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/i2c.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v11_5_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v6_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v6_1.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic_plane.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v6_7.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v8_7.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_audio.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_backlight.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v8_10.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v12_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bios.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/image.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bw.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cdclk.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ih.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_color.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/mxm.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_combo_phy.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_connector.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/iceland_ih.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/tonga_ih.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc_state_dump.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/cz_ih.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cursor.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/npde.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/pcir.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vega10_ih.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/perf.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vega20_ih.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/navi10_ih.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cx0_phy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/ih_v6_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/ih_v6_1.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v3_1.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v10_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v11_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/power_budget.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v11_0_8.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v12_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v13_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/dce_v10_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/dce_v11_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/ramcfg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/rammap.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowacpi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi_buf_trans.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs_params.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v8_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowramin.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v9_4.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/timing.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_device.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_driver.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_irq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_params.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/imu_v11_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_map.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/vmap.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_well.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/volt.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_trace.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v4_4.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/vpstate.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_wa.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/xpio.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/M0203.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/M0205.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/M0209.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/P0260.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dkl_phy.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dmc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mes_v10_1.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/base.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_aux.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mes_v11_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/uvd_v5_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_aux_backlight.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/hwsq.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_hdcp.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_link_training.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_mst.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vce_v3_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpll.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vce_v4_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/g94.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpll_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv04.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpt_common.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv40.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_sw_ring.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_drrs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsb.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v1_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v2_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v2_5.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_dcs_backlight.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/g84.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_vbt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fb.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v3_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v4_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fbc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fdi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fifo_underrun.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_frontbuffer.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/pllnv04.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_global_state.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_gmbus.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/pllgt215.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdcp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vpe_v6_1.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdmi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hotplug.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hotplug_irq.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hti.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv04.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_link_bw.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv05.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv10.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv1a.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_lspcon.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv20.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/athub_v1_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g84.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_lock.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_setup.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_verify.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/athub_v2_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_panel.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/athub_v2_1.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/athub_v3_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pipe_crc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v9_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v11_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v11_0_6.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pmdemand.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v13_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pps.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v13_0_3.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_psr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v13_0_6.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_qp_tables.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_quirks.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mca_v3_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_snps_phy.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gv100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_module.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/ga100.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_tc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vblank.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vdsc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vga.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vrr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_pasid.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_doorbell.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_flat_memory.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_wm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_cik.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_scaler.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_vi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_universal_plane.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v9.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v10.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_watermark.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_acpi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp10b.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_opregion.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v11.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/tu102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_kernel_queue.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv04.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv10.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager_vi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager_v9.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fbdev.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process_queue_manager.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv1a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_kunit_helpers.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_cik.o
  CC [M]  drivers/gpu/drm/xe/xe_guc.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_klvs_abi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_vi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_v9.o
  HDRTEST drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_errors_abi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_v10.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_v11.o
  HDRTEST drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_interrupt.o
  HDRTEST drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv20.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv25.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_events.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_relay_communication_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_communication_mmio_abi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv30.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/cik_event_interrupt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_messages_abi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v10.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv35.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v11.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv36.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv40.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv41.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv44.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv46.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv47.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_smi_events.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv49.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debug.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_trace.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv4e.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debugfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_active_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_config.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/g84.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gt215.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/mcp77.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/mcp89.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_debugfs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm200.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm20b.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/soc/intel_gmch.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp10b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_job.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_acp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mman.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../acp/acp_hw.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ioc32.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gt/intel_rps.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/r535.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv04.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_gt_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/arcturus_ppt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv10.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/navi10_ppt.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_active.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv1a.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv20.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv40.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv41.o
  HDRTEST drivers/gpu/drm/xe/display/intel_fb_bo.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv44.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.o
  HDRTEST drivers/gpu/drm/xe/display/intel_fbdev_fb.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv49.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv4e.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/cyan_skillfish_ppt.o
  HDRTEST drivers/gpu/drm/xe/instructions/xe_instr_defs.h
  HDRTEST drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.o
  HDRTEST drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.o
  HDRTEST drivers/gpu/drm/xe/instructions/xe_mi_commands.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/rammcp77.o
  HDRTEST drivers/gpu/drm/xe/regs/xe_gsc_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.o
  HDRTEST drivers/gpu/drm/xe/regs/xe_reg_defs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu12/renoir_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu12/smu_v12_0.o
  HDRTEST drivers/gpu/drm/xe/regs/xe_guc_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.o
  HDRTEST drivers/gpu/drm/xe/regs/xe_gt_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/aldebaran_ppt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.o
  HDRTEST drivers/gpu/drm/xe/regs/xe_regs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_gpu_commands.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/yellow_carp_ppt.o
  HDRTEST drivers/gpu/drm/xe/regs/xe_sriov_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.o
  HDRTEST drivers/gpu/drm/xe/regs/xe_lrc_layout.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_engine_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr2.o
  HDRTEST drivers/gpu/drm/xe/tests/xe_test.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_4_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_5_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_0_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr3.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smumgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr5.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fuse/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fuse/nv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fuse/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu8_smumgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fuse/gm107.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/tonga_smumgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/fiji_smumgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/nv10.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/polaris10_smumgr.o
  HDRTEST drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
  HDRTEST drivers/gpu/drm/xe/tests/xe_pci_test.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/nv50.o
  HDRTEST drivers/gpu/drm/xe/tests/xe_migrate_test.h
  HDRTEST drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/g94.o
  HDRTEST drivers/gpu/drm/xe/tests/xe_mocs_test.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.o
  HDRTEST drivers/gpu/drm/xe/tests/xe_bo_test.h
  HDRTEST drivers/gpu/drm/xe/xe_assert.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gf119.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/ga102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vega10_smumgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu10_smumgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/ci_smumgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vega12_smumgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vegam_smumgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu9_smumgr.o
  HDRTEST drivers/gpu/drm/xe/xe_bb.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vega20_smumgr.o
  HDRTEST drivers/gpu/drm/xe/xe_bb_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/hwmgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/processpptables.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/hardwaremanager.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu8_hwmgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/pppcielanes.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/process_pptables_v1_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.o
  HDRTEST drivers/gpu/drm/xe/xe_bo.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomfwctrl.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_powertune.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv4e.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/g94.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gf117.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_thermal.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_clockpowergating.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gf119.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gk110.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/pad.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padnv04.o
  HDRTEST drivers/gpu/drm/xe/xe_bo_doc.h
  HDRTEST drivers/gpu/drm/xe/xe_bo_evict.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_powertune.o
  HDRTEST drivers/gpu/drm/xe/xe_bo_types.h
  HDRTEST drivers/gpu/drm/xe/xe_debugfs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_thermal.o
  HDRTEST drivers/gpu/drm/xe/xe_devcoredump.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu10_hwmgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/pp_psm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_processpptables.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_hwmgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padnv4e.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padnv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_thermal.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/pp_overdriver.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_processpptables.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_hwmgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.o
  HDRTEST drivers/gpu/drm/xe/xe_devcoredump_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_powertune.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_thermal.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/common_baco.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv4e.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_baco.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_baco.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_baco.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu9_baco.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/tonga_baco.o
  HDRTEST drivers/gpu/drm/xe/xe_device.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/polaris_baco.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/fiji_baco.o
  HDRTEST drivers/gpu/drm/xe/xe_device_sysfs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ci_baco.o
  HDRTEST drivers/gpu/drm/xe/xe_device_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_baco.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bit.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/amd_powerplay.o
  HDRTEST drivers/gpu/drm/xe/xe_display.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/legacy_dpm.o
  HDRTEST drivers/gpu/drm/xe/xe_dma_buf.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_smc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_smc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm_internal.o
  HDRTEST drivers/gpu/drm/xe/xe_drm_client.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv04.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv40.o
  HDRTEST drivers/gpu/drm/xe/xe_drv.h
  HDRTEST drivers/gpu/drm/xe/xe_exec.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.o
  HDRTEST drivers/gpu/drm/xe/xe_exec_queue.h
  HDRTEST drivers/gpu/drm/xe/xe_exec_queue_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crtc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.o
  HDRTEST drivers/gpu/drm/xe/xe_execlist.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_services.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_pp_smu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_psr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_replay.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_hdcp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gm107.o
  HDRTEST drivers/gpu/drm/xe/xe_execlist_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/conversion.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/fixpt31_32.o
  HDRTEST drivers/gpu/drm/xe/xe_force_wake.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/vector.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dce_calcs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.o
  HDRTEST drivers/gpu/drm/xe/xe_force_wake_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/ga102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/custom_float.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/bw_fixed.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv04.o
  HDRTEST drivers/gpu/drm/xe/xe_ggtt.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser_interface.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv11.o
  HDRTEST drivers/gpu/drm/xe/xe_ggtt_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv17.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv44.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser_helper.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/g84.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/g98.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.o
  HDRTEST drivers/gpu/drm/xe/xe_gpu_scheduler.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table_helper.o
  HDRTEST drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser_common.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gt215.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table_helper2.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce60/command_table_helper_dce60.o
  HDRTEST drivers/gpu/drm/xe/xe_gsc.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce80/command_table_helper_dce80.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce110/command_table_helper_dce110.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gk104.o
  HDRTEST drivers/gpu/drm/xe/xe_gsc_submit.h
  HDRTEST drivers/gpu/drm/xe/xe_gsc_types.h
  HDRTEST drivers/gpu/drm/xe/xe_gt.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce112/command_table_helper_dce112.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_ccs_mode.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gk20a.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_clock.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp10b.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_debugfs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce112/command_table_helper2_dce112.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_freq.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_idle.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_idle_types.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_mcr.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_pagefault.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn10/dcn10_fpu.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_printk.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sriov_printk.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/dcn20_fpu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv04.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_sysfs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv41.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_vba.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv44.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/g84.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mcp77.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_sysfs_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm20b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/dcn30_fpu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gp100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_topology.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gp10b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.o
  HDRTEST drivers/gpu/drm/xe/xe_guc.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gv100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_ads.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_ads_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mem.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_ct.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv04.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memgf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_32.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/dcn31_fpu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv41.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn321/dcn321_fpu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv44.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_ct_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmmcp77.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_db_mgr.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_debugfs.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_fwif.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk104.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_hwconfig.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_hxg_helpers.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_log.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn301/dcn301_fpu.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_log_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_pc.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_pc_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn302/dcn302_fpu.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_relay.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn303/dcn303_fpu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_relay_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/dcn314_fpu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_submit.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgv100.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_submit_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn35/dcn35_fpu.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.o
  HDRTEST drivers/gpu/drm/xe/xe_heci_gsc.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.o
  HDRTEST drivers/gpu/drm/xe/xe_huc.h
  HDRTEST drivers/gpu/drm/xe/xe_huc_debugfs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.o
  HDRTEST drivers/gpu/drm/xe/xe_huc_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calcs.o
  HDRTEST drivers/gpu/drm/xe/xe_hw_engine.h
  HDRTEST drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
  HDRTEST drivers/gpu/drm/xe/xe_hw_engine_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_math.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.o
  HDRTEST drivers/gpu/drm/xe/xe_hw_fence.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/clk_mgr.o
  HDRTEST drivers/gpu/drm/xe/xe_hw_fence_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mxm/mxms.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mxm/nv50.o
  HDRTEST drivers/gpu/drm/xe/xe_hwmon.h
  HDRTEST drivers/gpu/drm/xe/xe_irq.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce60/dce60_clk_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce100/dce_clk_mgr.o
  HDRTEST drivers/gpu/drm/xe/xe_lmtt.h
  HDRTEST drivers/gpu/drm/xe/xe_lmtt_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/agp.o
  HDRTEST drivers/gpu/drm/xe/xe_lrc.h
  HDRTEST drivers/gpu/drm/xe/xe_lrc_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce110/dce110_clk_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce112/dce112_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.o
  HDRTEST drivers/gpu/drm/xe/xe_macros.h
  HDRTEST drivers/gpu/drm/xe/xe_map.h
  HDRTEST drivers/gpu/drm/xe/xe_memirq.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.o
  HDRTEST drivers/gpu/drm/xe/xe_memirq_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce120/dce120_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv04.o
  HDRTEST drivers/gpu/drm/xe/xe_migrate.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn10/rv1_clk_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.o
  HDRTEST drivers/gpu/drm/xe/xe_migrate_doc.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn10/rv2_clk_mgr.o
  HDRTEST drivers/gpu/drm/xe/xe_mmio.h
  HDRTEST drivers/gpu/drm/xe/xe_mocs.h
  HDRTEST drivers/gpu/drm/xe/xe_module.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn20/dcn20_clk_mgr.o
  HDRTEST drivers/gpu/drm/xe/xe_pat.h
  HDRTEST drivers/gpu/drm/xe/xe_pci.h
  HDRTEST drivers/gpu/drm/xe/xe_pci_types.h
  HDRTEST drivers/gpu/drm/xe/xe_pcode.h
  HDRTEST drivers/gpu/drm/xe/xe_pcode_api.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn201/dcn201_clk_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21/rn_clk_mgr.o
  HDRTEST drivers/gpu/drm/xe/xe_platform_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv40.o
  HDRTEST drivers/gpu/drm/xe/xe_pm.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv46.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.o
  HDRTEST drivers/gpu/drm/xe/xe_preempt_fence.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv4c.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/g84.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/g92.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/g94.o
  HDRTEST drivers/gpu/drm/xe/xe_preempt_fence_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf106.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gp100.o
  HDRTEST drivers/gpu/drm/xe/xe_pt.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/memx.o
  HDRTEST drivers/gpu/drm/xe/xe_pt_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/dcn301_smu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gt215.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn31/dcn31_smu.o
  HDRTEST drivers/gpu/drm/xe/xe_pt_walk.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn31/dcn31_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gf119.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn314/dcn314_smu.o
  HDRTEST drivers/gpu/drm/xe/xe_query.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn314/dcn314_clk_mgr.o
  HDRTEST drivers/gpu/drm/xe/xe_range_fence.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn315/dcn315_smu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn315/dcn315_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk110.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn316/dcn316_smu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk208.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn316/dcn316_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm107.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.o
  HDRTEST drivers/gpu/drm/xe/xe_reg_sr.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.o
  HDRTEST drivers/gpu/drm/xe/xe_reg_sr_types.h
  HDRTEST drivers/gpu/drm/xe/xe_reg_whitelist.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.o
  HDRTEST drivers/gpu/drm/xe/xe_res_cursor.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_smu.o
  HDRTEST drivers/gpu/drm/xe/xe_ring_ops.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gf117.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_audio.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_stream_encoder.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gk104.o
  HDRTEST drivers/gpu/drm/xe/xe_ring_ops_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gk20a.o
  HDRTEST drivers/gpu/drm/xe/xe_rtp.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_link_encoder.o
  HDRTEST drivers/gpu/drm/xe/xe_rtp_types.h
  HDRTEST drivers/gpu/drm/xe/xe_sa.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gm200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gp10b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_clock_source.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fannil.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_scl_filters.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_transform.o
  HDRTEST drivers/gpu/drm/xe/xe_sa_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_opp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_dmcu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fantog.o
  HDRTEST drivers/gpu/drm/xe/xe_sched_job.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/ic.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_abm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_ipp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/temp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv40.o
  HDRTEST drivers/gpu/drm/xe/xe_sched_job_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c.o
  HDRTEST drivers/gpu/drm/xe/xe_sriov.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/g84.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.o
  HDRTEST drivers/gpu/drm/xe/xe_sriov_printk.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gt215.o
  HDRTEST drivers/gpu/drm/xe/xe_sriov_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.o
  HDRTEST drivers/gpu/drm/xe/xe_step.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gm107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_panel_cntl.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gm200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.o
  HDRTEST drivers/gpu/drm/xe/xe_step_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_hw_lock_mgr.o
  HDRTEST drivers/gpu/drm/xe/xe_sync.h
  HDRTEST drivers/gpu/drm/xe/xe_sync_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/base.o
  HDRTEST drivers/gpu/drm/xe/xe_tile.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/nv04.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/nv40.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_outbox.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/nv41.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/gk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_replay.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/top/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.o
  HDRTEST drivers/gpu/drm/xe/xe_tile_sysfs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_factory.o
  HDRTEST drivers/gpu/drm/xe/xe_tile_sysfs_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_gpio.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/gv100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_hpd.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_ddc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_generic.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_translate.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce60/hw_translate_dce60.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/tu102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/ga100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce60/hw_factory_dce60.o
  HDRTEST drivers/gpu/drm/xe/xe_trace.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce80/hw_translate_dce80.o
  HDRTEST drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
  HDRTEST drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce80/hw_factory_dce80.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce110/hw_translate_dce110.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce110/hw_factory_dce110.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce120/hw_translate_dce120.o
  HDRTEST drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gpio.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce120/hw_factory_dce120.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/nv40.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn10/hw_translate_dcn10.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn10/hw_factory_dcn10.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn20/hw_translate_dcn20.o
  HDRTEST drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn20/hw_factory_dcn20.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn21/hw_translate_dcn21.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn21/hw_factory_dcn21.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn30/hw_translate_dcn30.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn30/hw_factory_dcn30.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn315/hw_translate_dcn315.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn315/hw_factory_dcn315.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gf117.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gm20b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn32/hw_translate_dcn32.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn32/hw_factory_dcn32.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/falcon.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/xtensa.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce/dce_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/bsp/g84.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce100/dce100_hwseq.o
  HDRTEST drivers/gpu/drm/xe/xe_tuning.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce112/dce112_hwseq.o
  HDRTEST drivers/gpu/drm/xe/xe_uc.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce120/dce120_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gm107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce80/dce80_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gp100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gp102.o
  HDRTEST drivers/gpu/drm/xe/xe_uc_debugfs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gv100.o
  HDRTEST drivers/gpu/drm/xe/xe_uc_fw.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn20/dcn20_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn201/dcn201_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn21/dcn21_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn30/dcn30_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/cipher/g84.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/acpi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/base.o
  HDRTEST drivers/gpu/drm/xe/xe_uc_fw_abi.h
  HDRTEST drivers/gpu/drm/xe/xe_uc_fw_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn301/dcn301_hwseq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn302/dcn302_hwseq.o
  HDRTEST drivers/gpu/drm/xe/xe_uc_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn303/dcn303_hwseq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn31/dcn31_hwseq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn314/dcn314_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn32/dcn32_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/pci.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn35/dcn35_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/irq_service.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/user.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce60/irq_service_dce60.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce80/irq_service_dce80.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce110/irq_service_dce110.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce120/irq_service_dce120.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.o
  HDRTEST drivers/gpu/drm/xe/xe_vm.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/head.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn10/irq_service_dcn10.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn20/irq_service_dcn20.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/vga.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/nv04.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/g84.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn30/irq_service_dcn30.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn302/irq_service_dcn302.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn303/irq_service_dcn303.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gt200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn31/irq_service_dcn31.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn314/irq_service_dcn314.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn315/irq_service_dcn315.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn32/irq_service_dcn32.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn35/irq_service_dcn35.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp89.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dpms.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_factory.o
  HDRTEST drivers/gpu/drm/xe/xe_vm_doc.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_resource.o
  HDRTEST drivers/gpu/drm/xe/xe_vm_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gk110.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_cts.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/hwss/link_hwss_dio.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gm107.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.o
  HDRTEST drivers/gpu/drm/xe/xe_vram_freq.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gp100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gp102.o
  HDRTEST drivers/gpu/drm/xe/xe_wa.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.o
  HDRTEST drivers/gpu/drm/xe/xe_wait_user_fence.h
  HDRTEST drivers/gpu/drm/xe/xe_wopcm.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.o
  HDRTEST drivers/gpu/drm/xe/xe_wopcm_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/hwss/link_hwss_dpia.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.o
  LD [M]  drivers/gpu/drm/xe/xe.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/hwss/link_hwss_hpo_dp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/hwss/link_hwss_dio_fixed_vs_pe_retimer.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_hpd.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_ddc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dpcd.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/nv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_dpia.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training_8b_10b.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training_128b_132b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training_dpia.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training_auxless.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training_fixed_vs_pe_retimer.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/gf119.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/gv100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/user.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_phy.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usergf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_edp_panel_control.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_irq_handler.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usergf119.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_dpia_bw.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usergv100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/virtual/virtual_link_encoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/virtual/virtual_stream_encoder.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/cgrp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/chid.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/virtual/virtual_link_hwss.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dcn20/dcn20_dsc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dcn35/dcn35_dsc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dc_dsc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/rc_calc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/rc_calc_dpi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/runq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dce100/dce100_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dce110/dce110_resource.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dce112/dce112_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv10.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv17.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv40.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/g84.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dce120/dce120_resource.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dce80/dce80_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/g98.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn10/dcn10_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn20/dcn20_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk110.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn201/dcn201_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk208.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn21/dcn21_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn30/dcn30_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gm107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn301/dcn301_resource.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn302/dcn302_resource.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn303/dcn303_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn31/dcn31_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gp100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn314/dcn314_resource.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn315/dcn315_resource.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn316/dcn316_resource.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn32/dcn32_resource.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn321/dcn321_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn35/dcn35_resource.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn10/dcn10_optc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn20/dcn20_optc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn201/dcn201_optc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn30/dcn30_optc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn301/dcn301_optc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn31/dcn31_optc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv15.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn314/dcn314_optc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv17.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn32/dcn32_optc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn35/dcn35_optc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv25.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv2a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_init.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv30.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_ipp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv34.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv35.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer_debug.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_dpp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_opp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv44.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hubp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/g84.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_mpc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_dpp_dscl.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gt200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_dpp_cm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/mcp79.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gt215.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/mcp89.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_cm_common.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hubbub.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_stream_encoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_link_encoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_init.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dpp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dpp_cm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_mpc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_opp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubbub.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf110.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf117.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_mmhubbub.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_stream_encoder.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf119.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_link_encoder.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gk110.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dccg.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gk110b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_vmid.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dwb.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gk208.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dwb_scl.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_init.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hubp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gm107.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gm200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gm20b.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hubbub.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_link_encoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_dccg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_init.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp107.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp108.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_hubbub.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_mpc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_hubp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/gv100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_opp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_dpp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ad102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_dccg.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv40.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_link_encoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_init.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hubbub.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hubp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dccg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_mpc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_vpg.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf108.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_afmt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf110.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf117.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf119.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110b.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk208.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dwb.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp_cm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk20a.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dwb_cm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_cm_common.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_mmhubbub.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_link_encoder.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm20b.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_init.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_dccg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_dio_link_encoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_panel_cntl.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_hubbub.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp107.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgv100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn302/dcn302_init.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_init.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxtu102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hubbub.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_init.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hubp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_dccg.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxga102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_dio_link_encoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_panel_cntl.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_apg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv40.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mpeg/g84.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hpo_dp_link_encoder.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mspdec/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mspdec/g98.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mspdec/gt215.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mspdec/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_afmt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/mspdec/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_vpg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_init.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msppp/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_dio_stream_encoder.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msppp/g98.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_dccg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hubbub.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msppp/gt215.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msppp/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_init.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msvld/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_dccg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_mmhubbub.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msvld/g98.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_dpp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hubp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msvld/gt215.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_mpc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_dio_stream_encoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_dio_link_encoder.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msvld/mcp89.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msvld/gf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/msvld/gk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvenc/gm107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hpo_dp_link_encoder.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvenc/tu102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn321/dcn321_dio_link_encoder.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ga102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn35/dcn35_init.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ad102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn35/dcn35_dio_stream_encoder.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvdec/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvdec/gm107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn35/dcn35_dio_link_encoder.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn35/dcn35_dccg.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvdec/tu102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn35/dcn35_hubp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn35/dcn35_hubbub.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ad102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn35/dcn35_mmhubbub.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn35/dcn35_opp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ga100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ad102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn35/dcn35_dpp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn35/dcn35_pg_cntl.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/r535.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn35/dcn35_dwb.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_util.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_wrapper.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_utils.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ofa/ad102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_policy.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ofa/r535.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_translation_helper.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_dc_resource_mgmt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_mall_phantom.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml_display_rq_dlg_calc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/gt200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/gt215.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce120/dce120_timing_generator.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/gf108.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/gf117.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce112/dce112_compressor.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_timing_generator.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sec/g98.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_compressor.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sec2/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_opp_regamma_v.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_opp_csc_v.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sec2/gp102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_timing_generator_v.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sec2/gp108.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sec2/tu102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_mem_input_v.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sec2/ga102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sec2/r535.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sw/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_opp_v.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_transform_v.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sw/nv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce80/dce80_timing_generator.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sw/nv10.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_timing_generator.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_hw_sequencer.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/sw/nvsw.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/vp/g84.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_acpi.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_debugfs.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_drm.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_hwmon.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hdcp/hdcp_msg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_ioc32.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_led.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_nvif.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stat.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_usif.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_vga.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_bo.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_bo0039.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_bo5039.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_sink.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_surface.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_debug.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_bo74c1.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_bo85b5.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_bo9039.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_bo90b5.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_enc_cfg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_exports.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_vm_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_boa0b5.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_gem.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dc_edid_parser.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_gamma.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_svm.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_dmem.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_mem.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_prime.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_table.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_sgdma.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/info_packet/info_packet.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_ttm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_helpers.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_vmm.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_exec.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv_stat.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_sched.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_uvmm.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_backlight.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_bios.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_connector.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_reg.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_display.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn20.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_dp.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/arb.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn21.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn30.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn301.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn302.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn303.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn31.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/crtc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn314.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn315.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/cursor.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn316.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn32.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/dac.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/dfp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn35.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/disp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_ddc.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/hw.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/overlay.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_log.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_psp.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/tvnv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv04/tvnv17.o
  CC [M]  drivers/gpu/drm/nouveau/dispnv50/disp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp1_execution.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp1_transition.o
  CC [M]  drivers/gpu/drm/nouveau/disp


