Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3061EC47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 21:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C136A10E163;
	Tue, 23 Jan 2024 21:41:52 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3AE10E14B;
 Tue, 23 Jan 2024 21:41:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EBuild=3A_success_for_drm/xe=3A_Prefer_BIT/GENMASK_m?=
 =?utf-8?q?acros_over_shifts_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 23 Jan 2024 21:41:51 -0000
Message-ID: <170604611141.684313.11352179558688821286@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240123212317.1600836-1-matthew.brost@intel.com>
In-Reply-To: <20240123212317.1600836-1-matthew.brost@intel.com>
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

Series: drm/xe: Prefer BIT/GENMASK macros over shifts (rev2)
URL   : https://patchwork.freedesktop.org/series/129099/
State : success

== Summary ==

+ trap cleanup EXIT
+ cd /kernel
+ git clone https://gitlab.freedesktop.org/drm/xe/ci.git .ci
Cloning into '.ci'...
+ '[' -n '' ']'
++ date +%s
+ echo -e '\e[0Ksection_start:1706045688:build_x86_64[collapsed=true]\r\e[0KBuild x86-64'
+ mkdir -p build64-default
[0Ksection_start:1706045688:build_x86_64[collapsed=true]
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
.config:459:warning: symbol value 'm' invalid for FSCACHE
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
  WRAP    arch/x86/include/generated/uapi/asm/ioctls.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctl.h
  UPD     include/generated/uapi/linux/version.h
  WRAP    arch/x86/include/generated/uapi/asm/ipcbuf.h
  WRAP    arch/x86/include/generated/uapi/asm/param.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  WRAP    arch/x86/include/generated/uapi/asm/resource.h
  WRAP    arch/x86/include/generated/uapi/asm/socket.h
  WRAP    arch/x86/include/generated/uapi/asm/sockios.h
  WRAP    arch/x86/include/generated/uapi/asm/termbits.h
  WRAP    arch/x86/include/generated/uapi/asm/termios.h
  WRAP    arch/x86/include/generated/uapi/asm/types.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  UPD     include/config/kernel.release
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_32_ia32.h
  WRAP    arch/x86/include/generated/asm/early_ioremap.h
  SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
  HOSTCC  arch/x86/tools/relocs_32.o
  HOSTCC  arch/x86/tools/relocs_64.o
  WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
  WRAP    arch/x86/include/generated/asm/irq_regs.h
  HOSTCC  arch/x86/tools/relocs_common.o
  WRAP    arch/x86/include/generated/asm/kmap_size.h
  UPD     include/generated/compile.h
  WRAP    arch/x86/include/generated/asm/local64.h
  WRAP    arch/x86/include/generated/asm/mmiowb.h
  HOSTCC  scripts/unifdef
  WRAP    arch/x86/include/generated/asm/module.lds.h
  WRAP    arch/x86/include/generated/asm/rwonce.h
  WRAP    arch/x86/include/generated/asm/unaligned.h
  UPD     include/generated/utsrelease.h
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/asn1_compiler
  HOSTCC  scripts/sorttable
mkdir -p /kernel/build64-default/tools/objtool && make O=/kernel/build64-default subdir=tools/objtool --no-print-directory -C objtool 
  HOSTCC  /kernel/build64-default/tools/objtool/fixdep.o
  HOSTLD  /kernel/build64-default/tools/objtool/fixdep-in.o
  LINK    /kernel/build64-default/tools/objtool/fixdep
  INSTALL /kernel/build64-default/tools/objtool/libsubcmd/include/subcmd/exec-cmd.h
  INSTALL /kernel/build64-default/tools/objtool/libsubcmd/include/subcmd/help.h
  INSTALL /kernel/build64-default/tools/objtool/libsubcmd/include/subcmd/parse-options.h
  INSTALL /kernel/build64-default/tools/objtool/libsubcmd/include/subcmd/pager.h
  INSTALL /kernel/build64-default/tools/objtool/libsubcmd/include/subcmd/run-command.h
  CC      /kernel/build64-default/tools/objtool/libsubcmd/exec-cmd.o
  CC      /kernel/build64-default/tools/objtool/libsubcmd/help.o
  CC      /kernel/build64-default/tools/objtool/libsubcmd/pager.o
  CC      /kernel/build64-default/tools/objtool/libsubcmd/parse-options.o
  INSTALL libsubcmd_headers
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
  HDRINST usr/include/drm/etnaviv_drm.h
  HDRINST usr/include/drm/msm_drm.h
  HDRINST usr/include/drm/vc4_drm.h
  HDRINST usr/include/drm/panfrost_drm.h
  HDRINST usr/include/drm/lima_drm.h
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
  UPD     scripts/mod/devicetable-offsets.h
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
  MKELF   scripts/mod/elfconfig.h
  HDRINST usr/include/misc/uacce/uacce.h
  HDRINST usr/include/misc/cxl.h
  HDRINST usr/include/misc/ocxl.h
  HDRINST usr/include/misc/fastrpc.h
  HDRINST usr/include/misc/pvpanic.h
  HOSTCC  scripts/mod/modpost.o
  HOSTCC  scripts/mod/file2alias.o
  HDRINST usr/include/linux/i8k.h
  HDRINST usr/include/linux/acct.h
  HOSTCC  scripts/mod/sumversion.o
  HDRINST usr/include/linux/atmmpc.h
  HOSTCC  scripts/mod/symsearch.o
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
  HDRINST usr/include/linux/sync_file.h
  HDRINST usr/include/linux/rpl_iptunnel.h
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
  HDRINST usr/include/linux/netfilter/nfnetlink_log.h
  HDRINST usr/include/linux/netfilter/xt_TCPOPTSTRIP.h
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
  HDRINST usr/include/linux/netfilter/xt_NFLOG.h
  HDRINST usr/include/linux/netfilter/xt_tcpmss.h
  HDRINST usr/include/linux/netfilter/xt_l2tp.h
  HDRINST usr/include/linux/netfilter/xt_helper.h
  HDRINST usr/include/linux/netfilter/xt_statistic.h
  HDRINST usr/include/linux/netfilter/nfnetlink_queue.h
  HDRINST usr/include/linux/netfilter/nfnetlink_cttimeout.h
  HDRINST usr/include/linux/netfilter/xt_CT.h
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
  HDRINST usr/include/linux/futex.h
  HDRINST usr/include/linux/tipc_sockets_diag.h
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
  HDRINST usr/include/linux/tiocl.h
  HDRINST usr/include/linux/auto_fs.h
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
  HDRINST usr/include/linux/in6.h
  HDRINST usr/include/linux/hid.h
  HDRINST usr/include/linux/thp7312.h
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
  LD      /kernel/build64-default/tools/objtool/libsubcmd/libsubcmd-in.o
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
  AR      /kernel/build64-default/tools/objtool/libsubcmd/libsubcmd.a
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
  HDRINST usr/include/linux/un.h
  HDRINST usr/include/linux/cdrom.h
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
  HDRINST usr/include/linux/netfilter_bridge/ebt_log.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_limit.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_stp.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_pkttype.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_ip.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_ip6.h
  CC      /kernel/build64-default/tools/objtool/weak.o
  HDRINST usr/include/linux/netfilter_bridge/ebt_arp.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_mark_t.h
  HDRINST usr/include/linux/netfilter_bridge/ebt_among.h
  CC      /kernel/build64-default/tools/objtool/check.o
  HDRINST usr/include/linux/reiserfs_fs.h
  CC      /kernel/build64-default/tools/objtool/special.o
  MKDIR   /kernel/build64-default/tools/objtool/arch/x86/
  HDRINST usr/include/linux/cciss_ioctl.h
  CC      /kernel/build64-default/tools/objtool/builtin-check.o
  CC      /kernel/build64-default/tools/objtool/elf.o
  HDRINST usr/include/linux/fsmap.h
  CC      /kernel/build64-default/tools/objtool/objtool.o
  HDRINST usr/include/linux/smiapp.h
  MKDIR   /kernel/build64-default/tools/objtool/arch/x86/lib/
  CC      /kernel/build64-default/tools/objtool/orc_gen.o
  HDRINST usr/include/linux/switchtec_ioctl.h
  CC      /kernel/build64-default/tools/objtool/arch/x86/special.o
  CC      /kernel/build64-default/tools/objtool/orc_dump.o
  HDRINST usr/include/linux/atmdev.h
  GEN     /kernel/build64-default/tools/objtool/arch/x86/lib/inat-tables.c
  CC      /kernel/build64-default/tools/objtool/libstring.o
  HDRINST usr/include/linux/hpet.h
  HDRINST usr/include/linux/virtio_config.h
  HDRINST usr/include/linux/string.h
  CC      /kernel/build64-default/tools/objtool/libctype.o
  HDRINST usr/include/linux/nsm.h
  CC      /kernel/build64-default/tools/objtool/str_error_r.o
  CC      /kernel/build64-default/tools/objtool/librbtree.o
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
  CC      /kernel/build64-default/tools/objtool/arch/x86/decode.o
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
  HDRINST usr/include/linux/batadv_packet.h
  HDRINST usr/include/linux/fscrypt.h
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
  HDRINST usr/include/linux/virtio_pci.h
  HDRINST usr/include/linux/mptcp_pm.h
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
  HDRINST usr/include/linux/netfilter_ipv6/ip6t_ah.h
  HDRINST usr/include/linux/netfilter_ipv6/ip6_tables.h
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
  HDRINST usr/include/linux/can/j1939.h
  HDRINST usr/include/linux/can/vxcan.h
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
  HOSTLD  scripts/mod/modpost
  CC      kernel/bounds.s
  CHKSHA1 ../include/linux/atomic/atomic-arch-fallback.h
  CHKSHA1 ../include/linux/atomic/atomic-long.h
  CHKSHA1 ../include/linux/atomic/atomic-instrumented.h
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
  CC      io_uring/io_uring.o
  CC      init/main.o
  CC      block/bdev.o
  CC      security/commoncap.o
  CC      io_uring/xattr.o
  AS      arch/x86/lib/clear_page_64.o
  CC      io_uring/nop.o
  CC      security/min_addr.o
  CC      ipc/compat.o
  CC      io_uring/fs.o
  CC      block/fops.o
  CC      arch/x86/lib/cmdline.o
  AR      arch/x86/video/built-in.a
  CC      ipc/util.o
  AS      arch/x86/lib/cmpxchg16b_emu.o
  CC      security/inode.o
  CC      io_uring/splice.o
  UPD     init/utsversion-tmp.h
  CC      mm/filemap.o
  CC      arch/x86/power/cpu.o
  CC      init/do_mounts.o
  CC      ipc/msgutil.o
  AR      arch/x86/virt/vmx/built-in.a
  CC      arch/x86/pci/i386.o
  AR      virt/lib/built-in.a
  AR      drivers/cache/built-in.a
  CC [M]  arch/x86/video/fbdev.o
  CC      arch/x86/realmode/init.o
  CC      security/keys/gc.o
  CC      net/ethernet/eth.o
  AR      drivers/irqchip/built-in.a
  AR      fs/quota/built-in.a
  CC      arch/x86/events/amd/core.o
  CC      block/partitions/core.o
  CC      fs/nfs_common/grace.o
  CC      net/core/sock.o
  CC      net/llc/llc_core.o
  CC [M]  virt/lib/irqbypass.o
  CC      fs/iomap/trace.o
  AS      arch/x86/crypto/aesni-intel_asm.o
  CC      net/core/request_sock.o
  CC      net/core/skbuff.o
  CC      fs/notify/dnotify/dnotify.o
  AR      sound/i2c/other/built-in.a
  CC      sound/core/seq/seq.o
  AR      arch/x86/virt/built-in.a
  CC      arch/x86/mm/pat/set_memory.o
  CC      arch/x86/kernel/fpu/init.o
  CC      net/802/p8022.o
  AR      drivers/bus/mhi/built-in.a
  CC      ipc/msg.o
  AR      sound/i2c/built-in.a
  CC      arch/x86/pci/init.o
  AR      drivers/bus/built-in.a
  CC      lib/kunit/hooks.o
  CC      arch/x86/entry/vdso/vma.o
  CC      fs/notify/inotify/inotify_fsnotify.o
  CC      arch/x86/entry/vdso/extable.o
  CC      kernel/sched/core.o
  CC      arch/x86/crypto/aesni-intel_glue.o
  AR      drivers/phy/allwinner/built-in.a
  CC      crypto/api.o
  AR      drivers/phy/amlogic/built-in.a
  AR      drivers/phy/broadcom/built-in.a
  CC      arch/x86/lib/copy_mc.o
  AR      drivers/phy/cadence/built-in.a
  AR      drivers/phy/freescale/built-in.a
  AR      drivers/phy/hisilicon/built-in.a
  AR      drivers/phy/ingenic/built-in.a
  AR      drivers/phy/intel/built-in.a
  AR      drivers/phy/lantiq/built-in.a
  AR      drivers/phy/marvell/built-in.a
  AR      drivers/phy/mediatek/built-in.a
  CC [M]  lib/kunit/test.o
  AR      drivers/phy/microchip/built-in.a
  AR      drivers/phy/motorola/built-in.a
  AR      drivers/phy/mscc/built-in.a
  GEN     usr/initramfs_data.cpio
  AR      drivers/phy/qualcomm/built-in.a
  COPY    usr/initramfs_inc_data
  AS      usr/initramfs_data.o
  AR      drivers/phy/ralink/built-in.a
  AR      drivers/phy/renesas/built-in.a
  AR      usr/built-in.a
  AR      drivers/phy/rockchip/built-in.a
  CC      lib/math/div64.o
  AR      drivers/phy/samsung/built-in.a
  CC      arch/x86/kernel/fpu/bugs.o
  AR      drivers/phy/socionext/built-in.a
  AR      drivers/phy/st/built-in.a
  AR      drivers/phy/starfive/built-in.a
  CC      lib/math/gcd.o
  AR      drivers/phy/sunplus/built-in.a
  AS      arch/x86/lib/copy_mc_64.o
  AR      drivers/phy/tegra/built-in.a
  AS      arch/x86/lib/copy_page_64.o
  AR      drivers/phy/ti/built-in.a
  AR      drivers/phy/xilinx/built-in.a
  CC      drivers/phy/phy-core.o
  AS      arch/x86/lib/copy_user_64.o
  CC      lib/math/lcm.o
  AS      arch/x86/lib/copy_user_uncached_64.o
  CC      arch/x86/kernel/fpu/core.o
  CC      arch/x86/lib/cpu.o
  CC      lib/math/int_log.o
  CC      sound/core/seq/seq_lock.o
  CC      fs/notify/inotify/inotify_user.o
  AR      virt/built-in.a
  CC      lib/math/int_pow.o
  AS      arch/x86/realmode/rm/header.o
  CC      lib/math/int_sqrt.o
  CC      security/keys/key.o
  AS      arch/x86/realmode/rm/trampoline_64.o
  CC      arch/x86/entry/vdso/vdso32-setup.o
  CC      arch/x86/entry/vsyscall/vsyscall_64.o
  CC      arch/x86/events/amd/lbr.o
  AS      arch/x86/realmode/rm/stack.o
  CC      ipc/sem.o
  AS      arch/x86/realmode/rm/reboot.o
  CC      ipc/shm.o
  CC      lib/math/reciprocal_div.o
  AR      fs/notify/dnotify/built-in.a
  AS      arch/x86/realmode/rm/wakeup_asm.o
  CC      arch/x86/realmode/rm/wakemain.o
  CC      fs/notify/fanotify/fanotify.o
  CC      fs/notify/fanotify/fanotify_user.o
  CC      arch/x86/pci/mmconfig_64.o
  CC      io_uring/sync.o
  AR      fs/nfs_common/built-in.a
  CC      security/keys/keyring.o
  CC      lib/math/rational.o
  CC      arch/x86/realmode/rm/video-mode.o
  CC      kernel/locking/mutex.o
  CC [M]  lib/math/prime_numbers.o
  CC      net/802/psnap.o
  CC      net/llc/llc_input.o
  CC      kernel/locking/semaphore.o
  CC      net/llc/llc_output.o
  CC      arch/x86/mm/init.o
  CC      arch/x86/power/hibernate_64.o
  AS      arch/x86/realmode/rm/copy.o
  AS      arch/x86/realmode/rm/bioscall.o
  CC      crypto/cipher.o
  CC      block/partitions/ldm.o
  CC      arch/x86/realmode/rm/regs.o
  CC      security/device_cgroup.o
  CC      arch/x86/realmode/rm/video-vga.o
  CC [M]  lib/kunit/resource.o
  CC      block/partitions/msdos.o
  AS      arch/x86/crypto/aesni-intel_avx-x86_64.o
  CC      arch/x86/mm/init_64.o
  CC      fs/proc/task_mmu.o
  CC      fs/iomap/iter.o
  AS      arch/x86/lib/csum-copy_64.o
  CC      arch/x86/realmode/rm/video-vesa.o
  CC      arch/x86/lib/csum-partial_64.o
  CC      sound/core/seq/seq_clientmgr.o
  CC      fs/iomap/buffered-io.o
  CC [M]  lib/kunit/static_stub.o
  LDS     arch/x86/entry/vdso/vdso.lds
  CC      arch/x86/realmode/rm/video-bios.o
  CC      arch/x86/lib/csum-wrappers_64.o
  AS      arch/x86/entry/vdso/vdso-note.o
  CC      arch/x86/events/amd/ibs.o
  CC      ipc/syscall.o
  CC      arch/x86/entry/vdso/vclock_gettime.o
  CC      lib/crypto/memneq.o
  PASYMS  arch/x86/realmode/rm/pasyms.h
  LDS     arch/x86/realmode/rm/realmode.lds
  AR      net/ethernet/built-in.a
  LD      arch/x86/realmode/rm/realmode.elf
  CC      lib/zlib_inflate/inffast.o
  RELOCS  arch/x86/realmode/rm/realmode.relocs
  OBJCOPY arch/x86/realmode/rm/realmode.bin
  AS      arch/x86/realmode/rmpiggy.o
  CC      lib/zlib_inflate/inflate.o
  AS      arch/x86/crypto/aes_ctrby8_avx-x86_64.o
  AR      arch/x86/realmode/built-in.a
  CC      lib/zlib_inflate/infutil.o
  AS [M]  arch/x86/crypto/ghash-clmulni-intel_asm.o
  CC [M]  arch/x86/crypto/ghash-clmulni-intel_glue.o
  CC      arch/x86/events/amd/uncore.o
  AR      lib/math/built-in.a
  CC      lib/crypto/utils.o
  AR      drivers/phy/built-in.a
  CC      init/do_mounts_initrd.o
  CC      lib/zlib_deflate/deflate.o
  CC      arch/x86/pci/direct.o
  CC      arch/x86/lib/delay.o
  AR      drivers/pinctrl/actions/built-in.a
  AR      drivers/pinctrl/bcm/built-in.a
  CC      drivers/gpio/gpiolib.o
  AR      arch/x86/ia32/built-in.a
  AR      drivers/pinctrl/cirrus/built-in.a
  CC      arch/x86/mm/pat/memtype.o
  CC      lib/zlib_inflate/inftrees.o
  AR      drivers/pinctrl/freescale/built-in.a
  AS      arch/x86/entry/vsyscall/vsyscall_emu_64.o
  AR      arch/x86/platform/atom/built-in.a
  CC      crypto/compress.o
  CC      drivers/pinctrl/intel/pinctrl-baytrail.o
  AR      arch/x86/platform/ce4100/built-in.a
  AR      arch/x86/entry/vsyscall/built-in.a
  AR      fs/notify/inotify/built-in.a
  CC      lib/zlib_inflate/inflate_syms.o
  CC      arch/x86/platform/efi/memmap.o
  CC      arch/x86/platform/efi/quirks.o
  AR      drivers/pinctrl/mediatek/built-in.a
  AS      arch/x86/power/hibernate_asm_64.o
  CC      arch/x86/power/hibernate.o
  AR      arch/x86/net/built-in.a
  CC      io_uring/advise.o
  CC      net/802/stp.o
  CC      fs/notify/fsnotify.o
  AR      arch/x86/platform/geode/built-in.a
  CC [M]  arch/x86/kvm/../../../virt/kvm/kvm_main.o
  AR      net/llc/built-in.a
  CC      block/bio.o
  CC      sound/core/sound.o
  CC      sound/core/init.o
  CC [M]  lib/kunit/string-stream.o
  CC      lib/crypto/chacha.o
  CC      arch/x86/entry/vdso/vgetcpu.o
  AS      arch/x86/lib/getuser.o
  CC      security/keys/keyctl.o
  GEN     arch/x86/lib/inat-tables.c
  HOSTCC  arch/x86/entry/vdso/vdso2c
  CC      arch/x86/mm/fault.o
  CC      mm/mempool.o
  CC      arch/x86/kernel/fpu/regset.o
  CC      arch/x86/lib/insn-eval.o
  CC      security/keys/permission.o
  CC      arch/x86/platform/efi/efi.o
  CC      block/partitions/efi.o
  AS [M]  arch/x86/crypto/crc32-pclmul_asm.o
  CC      sound/core/seq/seq_memory.o
  CC      lib/crypto/aes.o
  CC [M]  arch/x86/crypto/crc32-pclmul_glue.o
  CC      mm/oom_kill.o
  AS      arch/x86/entry/entry.o
  AR      lib/zlib_inflate/built-in.a
  CC      fs/iomap/direct-io.o
  CC      kernel/locking/rwsem.o
  CC      lib/lzo/lzo1x_compress.o
  AR      fs/notify/fanotify/built-in.a
  AR      arch/x86/platform/iris/built-in.a
  CC      arch/x86/kernel/cpu/mce/core.o
  CC      crypto/algapi.o
  LDS     arch/x86/entry/vdso/vdso32/vdso32.lds
  CC      init/initramfs.o
  CC      arch/x86/pci/mmconfig-shared.o
  AS      arch/x86/entry/vdso/vdso32/note.o
  AS      arch/x86/entry/vdso/vdso32/system_call.o
  AS      arch/x86/entry/vdso/vdso32/sigreturn.o
  CC      arch/x86/kernel/cpu/mce/severity.o
  CC      arch/x86/entry/vdso/vdso32/vclock_gettime.o
  CC [M]  lib/kunit/assert.o
  CC      arch/x86/kernel/cpu/mce/genpool.o
  CC      sound/core/seq/seq_queue.o
  CC      arch/x86/mm/pat/memtype_interval.o
  CC      lib/zlib_deflate/deftree.o
  CC      init/calibrate.o
  AR      arch/x86/power/built-in.a
  CC      sound/core/memory.o
  CC      arch/x86/kernel/cpu/mce/intel.o
  CC      sound/core/seq/seq_fifo.o
  CC      sound/core/seq/seq_prioq.o
  AR      net/802/built-in.a
  CC      ipc/ipc_sysctl.o
  AR      arch/x86/events/amd/built-in.a
  CC      lib/crypto/gf128mul.o
  CC      arch/x86/events/intel/core.o
  CC      fs/notify/notification.o
  CC      drivers/pinctrl/intel/pinctrl-intel.o
  CC      arch/x86/kernel/fpu/signal.o
  CC      arch/x86/kernel/fpu/xstate.o
  AS [M]  arch/x86/crypto/crct10dif-pcl-asm_64.o
  CC      lib/zlib_deflate/deflate_syms.o
  CC [M]  arch/x86/crypto/crct10dif-pclmul_glue.o
  CC      arch/x86/events/intel/bts.o
  CC      net/sched/sch_generic.o
  CC      lib/crypto/blake2s.o
  CC      lib/lzo/lzo1x_decompress_safe.o
  CC      net/netlink/af_netlink.o
  CC      arch/x86/lib/insn.o
  AR      net/bpf/built-in.a
  CC      block/elevator.o
  AR      block/partitions/built-in.a
  CC [M]  arch/x86/kvm/../../../virt/kvm/eventfd.o
  CC      arch/x86/platform/efi/efi_64.o
  AS      arch/x86/entry/entry_64.o
  CC [M]  lib/kunit/try-catch.o
  CC      arch/x86/entry/vdso/vdso32/vgetcpu.o
  CC      net/netlink/genetlink.o
  CC      ipc/mqueue.o
  CC      net/netlink/policy.o
  VDSO    arch/x86/entry/vdso/vdso64.so.dbg
  AR      arch/x86/mm/pat/built-in.a
  CC      arch/x86/mm/ioremap.o
  AS      arch/x86/lib/memcpy_64.o
  CC      sound/core/control.o
  CC      net/netlink/diag.o
  AS      arch/x86/lib/memmove_64.o
  VDSO    arch/x86/entry/vdso/vdso32.so.dbg
  OBJCOPY arch/x86/entry/vdso/vdso64.so
  OBJCOPY arch/x86/entry/vdso/vdso32.so
  CC      block/blk-core.o
  CC      security/keys/process_keys.o
  VDSO2C  arch/x86/entry/vdso/vdso-image-64.c
  CC      init/init_task.o
  AS      arch/x86/lib/memset_64.o
  VDSO2C  arch/x86/entry/vdso/vdso-image-32.c
  CC      arch/x86/entry/vdso/vdso-image-64.o
  CC      arch/x86/pci/fixup.o
  AR      lib/zlib_deflate/built-in.a
  CC      arch/x86/lib/misc.o
  CC      drivers/gpio/gpiolib-devres.o
  CC      drivers/gpio/gpiolib-legacy.o
  CC      net/core/datagram.o
  CC      sound/core/seq/seq_timer.o
  CC      fs/iomap/fiemap.o
  CC      arch/x86/kernel/cpu/mce/threshold.o
  LD [M]  arch/x86/crypto/ghash-clmulni-intel.o
  CC      arch/x86/lib/pc-conf-reg.o
  CC      block/blk-sysfs.o
  LD [M]  arch/x86/crypto/crc32-pclmul.o
  CC      net/core/stream.o
  CC      fs/proc/inode.o
  LD [M]  arch/x86/crypto/crct10dif-pclmul.o
  CC      ipc/namespace.o
  CC      fs/notify/group.o
  AR      arch/x86/crypto/built-in.a
  CC      lib/crypto/blake2s-generic.o
  CC [M]  lib/kunit/executor.o
  CC      arch/x86/entry/syscall_64.o
  AR      lib/lzo/built-in.a
  CC      arch/x86/entry/vdso/vdso-image-32.o
  AS      arch/x86/lib/putuser.o
  CC      kernel/locking/percpu-rwsem.o
  CC      crypto/scatterwalk.o
  CC      fs/iomap/seek.o
  AS      arch/x86/lib/retpoline.o
  CC      arch/x86/lib/usercopy.o
  CC      net/sched/sch_mq.o
  CC [M]  lib/kunit/attributes.o
  CC      fs/proc/root.o
  CC      fs/proc/base.o
  AR      arch/x86/entry/vdso/built-in.a
  CC      sound/core/seq/seq_system.o
  CC      lib/crypto/blake2s-selftest.o
  CC      drivers/gpio/gpiolib-cdev.o
  CC      arch/x86/lib/usercopy_64.o
  CC      mm/fadvise.o
  CC [M]  drivers/pinctrl/intel/pinctrl-cherryview.o
  CC      io_uring/filetable.o
  CC      ipc/mq_sysctl.o
  CC      sound/core/seq/seq_ports.o
  CC      init/version.o
  CC      lib/crypto/des.o
  CC      net/ethtool/ioctl.o
  CC      arch/x86/events/intel/ds.o
  CC      net/ethtool/common.o
  AR      arch/x86/kernel/fpu/built-in.a
  CC      net/ethtool/netlink.o
  CC      crypto/proc.o
  CC      net/ethtool/bitset.o
  AS      arch/x86/platform/efi/efi_stub_64.o
  CC      fs/kernfs/mount.o
  CC      fs/sysfs/file.o
  AR      arch/x86/platform/efi/built-in.a
  CC      arch/x86/platform/intel/iosf_mbi.o
  CC      arch/x86/entry/common.o
  CC      arch/x86/mm/extable.o
  CC      fs/notify/mark.o
  CC      net/ethtool/strset.o
  CC      fs/sysfs/dir.o
  AR      init/built-in.a
  CC      io_uring/openclose.o
  CC      fs/iomap/swapfile.o
  CC [M]  lib/kunit/device.o
  CC      kernel/locking/irqflag-debug.o
  CC      security/keys/request_key.o
  AS      arch/x86/entry/thunk_64.o
  CC      arch/x86/pci/acpi.o
  CC      sound/core/seq/seq_info.o
  CC      fs/notify/fdinfo.o
  CC      kernel/locking/mutex-debug.o
  CC      arch/x86/kernel/cpu/mce/apei.o
  CC      io_uring/uring_cmd.o
  CC      fs/proc/generic.o
  CC      fs/proc/array.o
  AR      sound/drivers/opl3/built-in.a
  AR      sound/drivers/opl4/built-in.a
  AR      sound/drivers/mpu401/built-in.a
  AR      sound/drivers/vx/built-in.a
  AR      sound/drivers/pcsp/built-in.a
  CC      net/core/scm.o
  AR      sound/drivers/built-in.a
  AR      sound/isa/ad1816a/built-in.a
  AR      sound/isa/ad1848/built-in.a
  AR      sound/isa/cs423x/built-in.a
  AR      sound/isa/es1688/built-in.a
  AR      sound/isa/galaxy/built-in.a
  AR      sound/isa/gus/built-in.a
  AR      sound/isa/msnd/built-in.a
  AR      sound/isa/opti9xx/built-in.a
  CC      arch/x86/lib/msr-smp.o
  AR      sound/isa/sb/built-in.a
  AR      sound/isa/wavefront/built-in.a
  AR      sound/isa/wss/built-in.a
  AR      sound/isa/built-in.a
  AR      sound/pci/ac97/built-in.a
  AR      sound/pci/ali5451/built-in.a
  CC [M]  arch/x86/kvm/../../../virt/kvm/binary_stats.o
  AR      sound/pci/asihpi/built-in.a
  AR      sound/pci/au88x0/built-in.a
  CC      crypto/aead.o
  AR      sound/pci/aw2/built-in.a
  AR      sound/pci/ctxfi/built-in.a
  CC      io_uring/epoll.o
  AR      sound/pci/ca0106/built-in.a
  CC      block/blk-flush.o
  CC      mm/maccess.o
  CC      net/sched/sch_frag.o
  AR      sound/pci/cs46xx/built-in.a
  CC      fs/kernfs/inode.o
  AR      sound/pci/cs5535audio/built-in.a
  AR      ipc/built-in.a
  AR      lib/kunit/built-in.a
  AR      sound/pci/lola/built-in.a
  LD [M]  lib/kunit/kunit.o
  CC      io_uring/statx.o
  CC      fs/sysfs/symlink.o
  AR      sound/pci/lx6464es/built-in.a
  CC      sound/core/misc.o
  AR      sound/pci/echoaudio/built-in.a
  CC      block/blk-settings.o
  AR      sound/pci/emu10k1/built-in.a
  AR      sound/core/seq/built-in.a
  CC      arch/x86/lib/cache-smp.o
  AR      arch/x86/platform/intel/built-in.a
  CC      block/blk-ioc.o
  CC      sound/core/device.o
  AR      sound/pci/ice1712/built-in.a
  AR      sound/pci/hda/built-in.a
  CC      lib/crypto/sha1.o
  AR      arch/x86/platform/intel-mid/built-in.a
  CC      sound/core/info.o
  CC [M]  sound/pci/hda/hda_bind.o
  AR      arch/x86/platform/intel-quark/built-in.a
  AR      arch/x86/platform/olpc/built-in.a
  AS      arch/x86/entry/entry_64_compat.o
  CC      kernel/locking/lockdep.o
  CC      kernel/locking/lockdep_proc.o
  AR      arch/x86/platform/scx200/built-in.a
  CC      net/ethtool/linkinfo.o
  AR      arch/x86/kernel/cpu/mce/built-in.a
  AR      arch/x86/platform/ts5500/built-in.a
  CC [M]  sound/pci/hda/hda_codec.o
  CC      arch/x86/kernel/cpu/mtrr/mtrr.o
  AR      arch/x86/platform/uv/built-in.a
  CC      arch/x86/entry/syscall_32.o
  AR      arch/x86/platform/built-in.a
  AR      fs/iomap/built-in.a
  CC      arch/x86/mm/mmap.o
  CC      arch/x86/kernel/cpu/mtrr/if.o
  CC      lib/crypto/sha256.o
  CC      arch/x86/pci/legacy.o
  CC      arch/x86/lib/msr.o
  CC [M]  drivers/pinctrl/intel/pinctrl-broxton.o
  AS      arch/x86/lib/msr-reg.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/vfio.o
  CC      security/keys/request_key_auth.o
  AR      fs/notify/built-in.a
  CC      sound/core/isadma.o
  CC      fs/proc/fd.o
  CC      fs/kernfs/dir.o
  CC      net/ethtool/linkmodes.o
  CC      io_uring/net.o
  CC      arch/x86/kernel/cpu/mtrr/generic.o
  CC      net/ethtool/rss.o
  CC      fs/sysfs/mount.o
  CC      drivers/gpio/gpiolib-sysfs.o
  CC      drivers/gpio/gpiolib-acpi.o
  CC [M]  drivers/pinctrl/intel/pinctrl-geminilake.o
  CC      block/blk-map.o
  CC      net/ethtool/linkstate.o
  CC [M]  sound/pci/hda/hda_jack.o
  CC      fs/kernfs/file.o
  CC      crypto/geniv.o
  CC      mm/page-writeback.o
  CC      fs/kernfs/symlink.o
  AR      net/netlink/built-in.a
  CC      arch/x86/lib/msr-reg-export.o
  CC [M]  net/netfilter/ipvs/ip_vs_conn.o
  AS      arch/x86/lib/hweight.o
  AR      sound/pci/korg1212/built-in.a
  CC      arch/x86/lib/iomem.o
  CC      arch/x86/events/intel/knc.o
  AR      sound/pci/mixart/built-in.a
  AS      arch/x86/lib/iomap_copy_64.o
  CC      io_uring/msg_ring.o
  CC      net/core/gen_stats.o
  CC      io_uring/timeout.o
  CC      io_uring/sqpoll.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/coalesced_mmio.o
  CC      io_uring/fdinfo.o
  AR      arch/x86/entry/built-in.a
  CC      crypto/lskcipher.o
  AR      sound/ppc/built-in.a
  CC      arch/x86/mm/pgtable.o
  CC      arch/x86/pci/irq.o
  CC      crypto/skcipher.o
  AR      sound/pci/nm256/built-in.a
  CC      sound/core/vmaster.o
  CC [M]  lib/crypto/arc4.o
  CC      arch/x86/mm/physaddr.o
  CC      arch/x86/events/zhaoxin/core.o
  CC      net/ethtool/debug.o
  CC      lib/lz4/lz4_compress.o
  CC      security/keys/user_defined.o
  CC      lib/lz4/lz4hc_compress.o
  CC      arch/x86/events/core.o
  CC [M]  drivers/pinctrl/intel/pinctrl-sunrisepoint.o
  CC      net/sched/sch_api.o
  CC      kernel/sched/fair.o
  CC      net/core/gen_estimator.o
  CC      fs/proc/proc_tty.o
  AR      drivers/pinctrl/intel/built-in.a
  CC      fs/proc/cmdline.o
  CC      arch/x86/pci/common.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/async_pf.o
  CC      arch/x86/lib/inat.o
  CC      net/sched/sch_blackhole.o
  CC      fs/sysfs/group.o
  CC      kernel/locking/spinlock.o
  AR      arch/x86/lib/built-in.a
  AR      arch/x86/lib/lib.a
  AR      lib/crypto/built-in.a
  LD [M]  lib/crypto/libarc4.o
  CC      kernel/locking/osq_lock.o
  CC      arch/x86/pci/early.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/irqchip.o
  CC      arch/x86/events/probe.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/dirty_ring.o
  CC      arch/x86/kernel/cpu/mtrr/cleanup.o
  CC      arch/x86/events/utils.o
  CC      arch/x86/events/intel/lbr.o
  CC      lib/zstd/zstd_compress_module.o
  CC      arch/x86/events/intel/p4.o
  CC      security/keys/compat.o
  AR      fs/kernfs/built-in.a
  CC      kernel/locking/qspinlock.o
  CC      sound/core/ctljack.o
  CC      lib/zstd/compress/fse_compress.o
  CC [M]  sound/pci/hda/hda_auto_parser.o
  CC      drivers/gpio/gpiolib-swnode.o
  CC      lib/zstd/compress/hist.o
  AR      drivers/pinctrl/mvebu/built-in.a
  AR      drivers/pinctrl/nomadik/built-in.a
  CC      security/keys/proc.o
  CC      block/blk-merge.o
  AR      drivers/pinctrl/nuvoton/built-in.a
  AR      drivers/pinctrl/nxp/built-in.a
  CC      security/keys/sysctl.o
  CC      fs/proc/consoles.o
  AR      drivers/pinctrl/qcom/built-in.a
  CC      net/core/net_namespace.o
  AR      drivers/pinctrl/sprd/built-in.a
  CC      net/sched/sch_fifo.o
  AR      drivers/pinctrl/sunplus/built-in.a
  AR      arch/x86/events/zhaoxin/built-in.a
  AR      drivers/pinctrl/ti/built-in.a
  CC      arch/x86/mm/tlb.o
  CC      drivers/pinctrl/core.o
  CC      arch/x86/kernel/cpu/microcode/core.o
  CC      kernel/locking/rtmutex_api.o
  CC      io_uring/tctx.o
  CC      io_uring/poll.o
  CC      io_uring/cancel.o
  CC      net/ethtool/wol.o
  CC      arch/x86/kernel/cpu/microcode/intel.o
  CC      arch/x86/mm/cpu_entry_area.o
  CC      arch/x86/events/intel/p6.o
  CC      crypto/seqiv.o
  CC      io_uring/kbuf.o
  AR      fs/sysfs/built-in.a
  CC      lib/xz/xz_dec_syms.o
  CC      fs/configfs/inode.o
  CC      lib/xz/xz_dec_stream.o
  CC      arch/x86/pci/bus_numa.o
  CC      fs/configfs/file.o
  CC      lib/zstd/compress/huf_compress.o
  CC      fs/configfs/dir.o
  CC      arch/x86/pci/amd_bus.o
  CC      sound/core/jack.o
  CC      lib/xz/xz_dec_lzma2.o
  CC      kernel/sched/build_policy.o
  AR      drivers/gpio/built-in.a
  CC [M]  arch/x86/kvm/../../../virt/kvm/pfncache.o
  CC      lib/raid6/algos.o
  CC      lib/fonts/fonts.o
  CC      fs/proc/cpuinfo.o
  CC      lib/raid6/recov.o
  CC      arch/x86/events/rapl.o
  HOSTCC  lib/raid6/mktables
  AR      security/keys/built-in.a
  AR      security/built-in.a
  CC      kernel/sched/build_utility.o
  CC      fs/devpts/inode.o
  CC [M]  net/netfilter/ipvs/ip_vs_core.o
  CC      fs/ext4/balloc.o
  AR      arch/x86/kernel/cpu/mtrr/built-in.a
  CC [M]  net/netfilter/ipvs/ip_vs_ctl.o
  CC      fs/ext4/bitmap.o
  UNROLL  lib/raid6/int1.c
  CC      arch/x86/events/intel/pt.o
  CC      io_uring/rsrc.o
  UNROLL  lib/raid6/int2.c
  CC      arch/x86/kernel/cpu/microcode/amd.o
  CC      arch/x86/mm/maccess.o
  CC      arch/x86/kernel/cpu/cacheinfo.o
  CC      crypto/echainiv.o
  CC [M]  sound/pci/hda/hda_sysfs.o
  CC      lib/fonts/font_8x8.o
  CC      lib/fonts/font_8x16.o
  CC      net/netfilter/core.o
  CC      lib/lz4/lz4_decompress.o
  UNROLL  lib/raid6/int4.c
  CC      arch/x86/events/intel/uncore.o
  CC      io_uring/rw.o
  CC      mm/folio-compat.o
  CC [M]  sound/pci/hda/hda_controller.o
  CC      mm/readahead.o
  CC      fs/ext4/block_validity.o
  CC      lib/xz/xz_dec_bcj.o
  CC      arch/x86/kernel/cpu/scattered.o
  CC      net/core/secure_seq.o
  UNROLL  lib/raid6/int8.c
  CC      net/core/flow_dissector.o
  CC      net/ethtool/features.o
  CC      arch/x86/mm/pgprot.o
  CC      net/ethtool/privflags.o
  CC      sound/core/timer.o
  CC      fs/proc/devices.o
  AR      arch/x86/pci/built-in.a
  CC      io_uring/opdef.o
  CC      arch/x86/kernel/acpi/boot.o
  CC      drivers/pinctrl/pinctrl-utils.o
  CC      arch/x86/kernel/acpi/sleep.o
  CC      lib/raid6/recov_ssse3.o
  AS      arch/x86/kernel/acpi/wakeup_64.o
  CC      io_uring/notif.o
  AR      net/sched/built-in.a
  CC      block/blk-timeout.o
  CC      arch/x86/mm/hugetlbpage.o
  AR      net/ipv4/netfilter/built-in.a
  CC [M]  net/ipv4/netfilter/nf_defrag_ipv4.o
  CC      drivers/pinctrl/pinmux.o
  CC [M]  net/ipv4/netfilter/nf_reject_ipv4.o
  AR      lib/fonts/built-in.a
  CC      net/ethtool/rings.o
  CC      io_uring/waitid.o
  AR      fs/devpts/built-in.a
  AR      lib/xz/built-in.a
  CC      block/blk-lib.o
  CC      fs/jbd2/transaction.o
  CC      fs/configfs/symlink.o
  CC [M]  arch/x86/kvm/x86.o
  CC      fs/jbd2/commit.o
  CC      crypto/ahash.o
  CC      lib/zstd/compress/zstd_compress.o
  CC      fs/jbd2/recovery.o
  CC [M]  net/ipv4/netfilter/ip_tables.o
  CC      kernel/locking/spinlock_debug.o
  CC      arch/x86/events/msr.o
  AR      arch/x86/kernel/cpu/microcode/built-in.a
  CC      fs/jbd2/checkpoint.o
  CC      fs/proc/interrupts.o
  CC      drivers/pinctrl/pinconf.o
  CC      lib/argv_split.o
  CC      arch/x86/kernel/apic/apic.o
  CC      lib/raid6/recov_avx2.o
  CC      fs/proc/loadavg.o
  CC      arch/x86/mm/numa.o
  CC      arch/x86/kernel/cpu/topology.o
  CC      mm/swap.o
  CC      block/blk-mq.o
  CC      arch/x86/mm/numa_64.o
  CC      kernel/locking/qrwlock.o
  CC      fs/proc/meminfo.o
  CC      fs/configfs/mount.o
  CC      fs/jbd2/revoke.o
  CC      block/blk-mq-tag.o
  AR      lib/lz4/built-in.a
  CC      kernel/power/qos.o
  CC [M]  net/netfilter/ipvs/ip_vs_sched.o
  CC      io_uring/register.o
  CC      kernel/power/main.o
  CC      fs/proc/stat.o
  CC [M]  sound/pci/hda/hda_proc.o
  CC [M]  net/netfilter/ipvs/ip_vs_xmit.o
  CC      io_uring/io-wq.o
  CC      fs/ext4/dir.o
  CC [M]  net/netfilter/ipvs/ip_vs_app.o
  CC      kernel/power/console.o
  CC      arch/x86/kernel/acpi/apei.o
  CC      net/core/sysctl_net_core.o
  CC      arch/x86/events/intel/uncore_nhmex.o
  CC      net/ethtool/channels.o
  CC      drivers/pinctrl/pinconf-generic.o
  CC      mm/truncate.o
  CC      crypto/shash.o
  CC      crypto/akcipher.o
  CC      sound/core/hrtimer.o
  CC [M]  arch/x86/kvm/emulate.o
  CC      crypto/sig.o
  CC      arch/x86/kernel/cpu/common.o
  CC      arch/x86/kernel/cpu/rdrand.o
  CC      arch/x86/mm/amdtopology.o
  CC      fs/jbd2/journal.o
  CC      lib/raid6/mmx.o
  CC      mm/vmscan.o
  CC      lib/raid6/sse1.o
  AR      kernel/locking/built-in.a
  CC [M]  net/ipv4/netfilter/iptable_filter.o
  CC [M]  sound/pci/hda/hda_hwdep.o
  CC      lib/raid6/sse2.o
  CC      fs/configfs/item.o
  CC      mm/shrinker.o
  CC      net/ethtool/coalesce.o
  CC      fs/proc/uptime.o
  CC      fs/ext4/ext4_jbd2.o
  CC      arch/x86/kernel/acpi/cppc.o
  CC      fs/ext4/extents.o
  CC [M]  arch/x86/kvm/i8259.o
  CC      arch/x86/kernel/cpu/match.o
  AR      drivers/pinctrl/built-in.a
  AR      drivers/pwm/built-in.a
  CC      crypto/kpp.o
  CC      sound/core/seq_device.o
  CC      drivers/pci/msi/pcidev_msi.o
  CC      crypto/acompress.o
  CC      drivers/pci/msi/api.o
  CC      block/blk-stat.o
  CC      drivers/pci/pcie/portdrv.o
  CC      arch/x86/mm/srat.o
  CC [M]  net/ipv4/netfilter/iptable_mangle.o
  CC      kernel/power/process.o
  CC      fs/ext4/extents_status.o
  CC      block/blk-mq-sysfs.o
  CC      drivers/video/console/dummycon.o
  CC [M]  net/ipv4/netfilter/iptable_nat.o
  CC      drivers/idle/intel_idle.o
  CC      drivers/video/logo/logo.o
  AR      fs/configfs/built-in.a
  CC [M]  net/ipv4/netfilter/ipt_REJECT.o
  CC      fs/proc/util.o
  CC [M]  sound/pci/hda/hda_generic.o
  HOSTCC  drivers/video/logo/pnmtologo
  CC      arch/x86/events/intel/uncore_snb.o
  CC      io_uring/futex.o
  CC      lib/raid6/avx2.o
  AR      sound/pci/oxygen/built-in.a
  CC      arch/x86/mm/pkeys.o
  AR      sound/arm/built-in.a
  CC [M]  arch/x86/kvm/irq.o
  CC      net/core/dev.o
  CC      arch/x86/kernel/apic/apic_common.o
  CC      arch/x86/kernel/acpi/cstate.o
  CC [M]  sound/core/control_led.o
  CC      fs/ext4/file.o
  CC      lib/raid6/avx512.o
  CC      lib/raid6/recov_avx512.o
  CC      arch/x86/mm/pti.o
  AR      sound/sh/built-in.a
  CC      arch/x86/kernel/kprobes/core.o
  LDS     arch/x86/kernel/vmlinux.lds
  CC      net/netfilter/nf_log.o
  AS      arch/x86/kernel/head_64.o
  CC      crypto/scompress.o
  LOGO    drivers/video/logo/logo_linux_clut224.c
  CC      drivers/pci/msi/msi.o
  CC      drivers/video/logo/logo_linux_clut224.o
  CC      net/ethtool/pause.o
  CC      lib/zstd/compress/zstd_compress_literals.o
  CC      fs/proc/version.o
  CC      net/netfilter/nf_queue.o
  CC      mm/shmem.o
  AR      drivers/video/logo/built-in.a
  CC      arch/x86/kernel/kprobes/opt.o
  AR      sound/synth/emux/built-in.a
  AR      sound/synth/built-in.a
  CC      drivers/video/console/vgacon.o
  CC      kernel/printk/printk.o
  CC      lib/zstd/compress/zstd_compress_sequences.o
  CC      kernel/printk/printk_safe.o
  CC      drivers/pci/pcie/rcec.o
  CC      kernel/printk/nbcon.o
  CC      arch/x86/kernel/cpu/bugs.o
  CC [M]  net/netfilter/ipvs/ip_vs_sync.o
  CC [M]  arch/x86/kvm/lapic.o
  CC      block/blk-mq-cpumap.o
  CC      arch/x86/kernel/apic/apic_noop.o
  CC      drivers/video/backlight/backlight.o
  CC      fs/ext4/fsmap.o
  CC      block/blk-mq-sched.o
  CC      kernel/power/suspend.o
  CC [M]  arch/x86/kvm/i8254.o
  AR      arch/x86/kernel/acpi/built-in.a
  CC      arch/x86/kernel/cpu/aperfmperf.o
  CC      lib/zstd/compress/zstd_compress_superblock.o
  CC      arch/x86/events/intel/uncore_snbep.o
  CC      lib/zstd/compress/zstd_double_fast.o
  CC      fs/proc/softirqs.o
  CC      fs/ext4/fsync.o
  TABLE   lib/raid6/tables.c
  CC [M]  net/netfilter/ipvs/ip_vs_est.o
  CC      lib/raid6/int1.o
  CC      mm/util.o
  CC      net/ipv4/route.o
  CC [M]  sound/core/hwdep.o
  CC      kernel/irq/irqdesc.o
  AR      arch/x86/mm/built-in.a
  CC      mm/mmzone.o
  AR      drivers/idle/built-in.a
  CC      lib/raid6/int2.o
  CC      fs/ext4/hash.o
  CC      kernel/printk/printk_ringbuffer.o
  CC      crypto/algboss.o
  AR      io_uring/built-in.a
  CC [M]  net/netfilter/ipvs/ip_vs_proto.o
  CC      arch/x86/kernel/apic/ipi.o
  CC      drivers/pci/pcie/aspm.o
  CC      arch/x86/kernel/kprobes/ftrace.o
  CC      arch/x86/kernel/apic/vector.o
  CC      arch/x86/kernel/apic/init.o
  CC      drivers/pci/msi/irqdomain.o
  CC      net/ethtool/eee.o
  CC      fs/proc/namespaces.o
  CC      block/ioctl.o
  AR      fs/jbd2/built-in.a
  CC      fs/ramfs/inode.o
  CC      net/netfilter/nf_sockopt.o
  AR      drivers/video/console/built-in.a
  CC      drivers/video/fbdev/core/fb_notify.o
  AR      drivers/video/fbdev/omap/built-in.a
  CC      fs/ext4/ialloc.o
  CC      net/ipv4/inetpeer.o
  CC      lib/zstd/compress/zstd_fast.o
  CC [M]  drivers/video/fbdev/uvesafb.o
  AR      drivers/video/fbdev/omap2/omapfb/dss/built-in.a
  AR      drivers/video/fbdev/omap2/omapfb/displays/built-in.a
  AR      drivers/video/fbdev/omap2/omapfb/built-in.a
  AR      drivers/video/backlight/built-in.a
  AR      drivers/video/fbdev/omap2/built-in.a
  CC      kernel/printk/sysctl.o
  CC      arch/x86/kernel/cpu/cpuid-deps.o
  CC      net/netfilter/utils.o
  CC [M]  sound/core/pcm.o
  AR      kernel/sched/built-in.a
  AR      drivers/char/ipmi/built-in.a
  CC      lib/raid6/int4.o
  AR      sound/pci/pcxhr/built-in.a
  CC      lib/raid6/int8.o
  CC [M]  arch/x86/kvm/ioapic.o
  CC      kernel/rcu/update.o
  CC      kernel/irq/handle.o
  CC      net/ethtool/tsinfo.o
  CC      kernel/rcu/sync.o
  AR      arch/x86/kernel/kprobes/built-in.a
  CC      block/genhd.o
  CC [M]  net/netfilter/ipvs/ip_vs_pe.o
  CC      kernel/power/hibernate.o
  CC      block/ioprio.o
  CC      drivers/pci/pcie/aer.o
  CC      kernel/irq/manage.o
  CC [M]  arch/x86/kvm/irq_comm.o
  CC      fs/ext4/indirect.o
  CC      crypto/testmgr.o
  CC      kernel/rcu/srcutree.o
  AR      drivers/pci/msi/built-in.a
  CC      drivers/pci/hotplug/pci_hotplug_core.o
  CC [M]  arch/x86/kvm/cpuid.o
  CC      fs/proc/self.o
  CC      drivers/pci/hotplug/acpi_pcihp.o
  CC      fs/ramfs/file-mmu.o
  CC      arch/x86/kernel/cpu/umwait.o
  CC      fs/ext4/inline.o
  CC      arch/x86/kernel/head64.o
  CC [M]  net/netfilter/nfnetlink.o
  CC [M]  drivers/video/fbdev/core/fb_info.o
  AR      kernel/printk/built-in.a
  CC      net/ipv4/protocol.o
  CC      fs/proc/thread_self.o
  CC      kernel/rcu/tree.o
  CC      arch/x86/kernel/ebda.o
  CC      kernel/irq/spurious.o
  AR      sound/pci/riptide/built-in.a
  AR      sound/pci/rme9652/built-in.a
  AR      sound/pci/trident/built-in.a
  AR      sound/pci/ymfpci/built-in.a
  CC      kernel/irq/resend.o
  CC      block/badblocks.o
  CC      lib/raid6/tables.o
  CC [M]  sound/core/pcm_native.o
  AR      kernel/livepatch/built-in.a
  CC      kernel/rcu/rcu_segcblist.o
  CC      net/ipv4/ip_input.o
  CC      fs/proc/proc_sysctl.o
  AR      fs/ramfs/built-in.a
  CC      arch/x86/kernel/apic/hw_nmi.o
  CC      arch/x86/kernel/platform-quirks.o
  CC      kernel/dma/mapping.o
  CC      net/ethtool/cabletest.o
  CC      arch/x86/events/intel/uncore_discovery.o
  CC      kernel/dma/direct.o
  CC      mm/vmstat.o
  CC      kernel/dma/ops_helpers.o
  CC      fs/ext4/inode.o
  CC      drivers/pci/hotplug/pciehp_core.o
  CC      fs/hugetlbfs/inode.o
  CC [M]  sound/pci/hda/patch_realtek.o
  CC      mm/backing-dev.o
  AR      sound/pci/vx222/built-in.a
  CC      net/xfrm/xfrm_policy.o
  CC      arch/x86/kernel/cpu/proc.o
  AR      sound/usb/misc/built-in.a
  AR      sound/usb/usx2y/built-in.a
  CC [M]  net/netfilter/ipvs/ip_vs_proto_tcp.o
  MKCAP   arch/x86/kernel/cpu/capflags.c
  CC      net/xfrm/xfrm_state.o
  AR      sound/usb/caiaq/built-in.a
  CC      drivers/pci/pcie/err.o
  AR      sound/usb/6fire/built-in.a
  AR      sound/usb/hiface/built-in.a
  AR      sound/usb/bcd2000/built-in.a
  AR      sound/usb/built-in.a
  CC      kernel/power/snapshot.o
  CC      drivers/acpi/acpica/dsargs.o
  CC      drivers/acpi/numa/srat.o
  CC      drivers/acpi/apei/apei-base.o
  AR      drivers/acpi/pmic/built-in.a
  CC      kernel/irq/chip.o
  CC [M]  drivers/video/fbdev/core/fbmem.o
  CC      drivers/acpi/acpica/dscontrol.o
  AR      sound/firewire/built-in.a
  CC      kernel/power/swap.o
  CC      drivers/acpi/acpica/dsdebug.o
  AR      lib/raid6/built-in.a
  CC      drivers/acpi/apei/hest.o
  CC [M]  net/netfilter/nf_conntrack_core.o
  CC [M]  arch/x86/kvm/pmu.o
  CC      kernel/power/user.o
  CC      net/unix/af_unix.o
  CC      arch/x86/kernel/apic/io_apic.o
  CC      block/blk-rq-qos.o
  CC [M]  arch/x86/kvm/mtrr.o
  CC [M]  net/netfilter/ipvs/ip_vs_proto_udp.o
  CC      drivers/video/aperture.o
  CC      drivers/acpi/acpica/dsfield.o
  CC      net/ipv4/ip_fragment.o
  CC      lib/bug.o
  CC [M]  sound/core/pcm_lib.o
  CC      drivers/pci/hotplug/pciehp_ctrl.o
  CC      lib/zstd/compress/zstd_lazy.o
  CC      drivers/pci/pcie/aer_inject.o
  CC      arch/x86/events/intel/cstate.o
  CC      kernel/irq/dummychip.o
  CC      mm/mm_init.o
  CC      kernel/dma/dummy.o
  CC      mm/percpu.o
  CC      net/ethtool/tunnels.o
  AR      drivers/acpi/numa/built-in.a
  CC      mm/slab_common.o
  CC      net/ipv4/ip_forward.o
  CC      fs/ext4/ioctl.o
  CC      drivers/acpi/apei/erst.o
  CC      drivers/acpi/acpica/dsinit.o
  CC      fs/ext4/mballoc.o
  CC      crypto/cmac.o
  CC [M]  drivers/video/fbdev/core/fbcmap.o
  CC      kernel/power/poweroff.o
  CC      kernel/irq/devres.o
  CC      net/ipv4/ip_options.o
  AR      net/ipv6/netfilter/built-in.a
  CC      fs/proc/proc_net.o
  CC [M]  net/ipv6/netfilter/nf_defrag_ipv6_hooks.o
  AR      fs/hugetlbfs/built-in.a
  CC      drivers/pnp/pnpacpi/core.o
  CC      block/disk-events.o
  CC      drivers/pnp/core.o
  CC      drivers/pnp/pnpacpi/rsparser.o
  CC      net/packet/af_packet.o
  CC      kernel/dma/contiguous.o
  CC      net/key/af_key.o
  CC      drivers/acpi/acpica/dsmethod.o
  AR      net/bridge/netfilter/built-in.a
  CC      net/bridge/br.o
  CC      net/bridge/br_device.o
  AR      drivers/amba/built-in.a
  CC      fs/proc/kcore.o
  CC      fs/proc/kmsg.o
  CC [M]  net/ipv6/netfilter/nf_conntrack_reasm.o
  CC      drivers/pci/pcie/pme.o
  CC      drivers/pci/hotplug/pciehp_pci.o
  CC      drivers/acpi/apei/bert.o
  AR      arch/x86/events/intel/built-in.a
  AR      arch/x86/events/built-in.a
  CC      drivers/pnp/card.o
  CC      crypto/hmac.o
  CC      kernel/irq/autoprobe.o
  AR      kernel/power/built-in.a
  CC      crypto/vmac.o
  CC [M]  net/netfilter/ipvs/ip_vs_nfct.o
  CC      drivers/acpi/acpica/dsmthdat.o
  CC      net/ipv4/ip_output.o
  CC      arch/x86/kernel/apic/msi.o
  CC      drivers/pci/hotplug/pciehp_hpc.o
  CC      net/ipv4/ip_sockglue.o
  CC      net/ipv4/inet_hashtables.o
  CC [M]  drivers/video/fbdev/core/modedb.o
  CC      net/ipv4/inet_timewait_sock.o
  CC      kernel/dma/swiotlb.o
  CC      drivers/acpi/apei/ghes.o
  CC [M]  drivers/video/fbdev/core/fbcvt.o
  CC      net/ethtool/fec.o
  CC [M]  sound/core/pcm_misc.o
  CC      block/blk-ia-ranges.o
  AR      drivers/pnp/pnpacpi/built-in.a
  CC      block/early-lookup.o
  CC      block/bsg.o
  CC      arch/x86/kernel/cpu/powerflags.o
  CC      drivers/acpi/acpica/dsobject.o
  CC      drivers/pci/pcie/dpc.o
  CC      net/packet/diag.o
  CC [M]  drivers/video/fbdev/simplefb.o
  CC      kernel/irq/irqdomain.o
  CC [M]  sound/pci/hda/patch_analog.o
  CC      drivers/pnp/driver.o
  CC      net/ethtool/eeprom.o
  CC      fs/proc/page.o
  CC      drivers/pnp/resource.o
  CC      net/ethtool/stats.o
  CC [M]  net/netfilter/ipvs/ip_vs_rr.o
  AR      drivers/pci/controller/dwc/built-in.a
  AR      drivers/pci/controller/mobiveil/built-in.a
  CC      drivers/pci/controller/vmd.o
  CC      net/bridge/br_fdb.o
  CC      net/bridge/br_forward.o
  CC      crypto/xcbc.o
  CC      drivers/acpi/acpica/dsopcode.o
  CC      arch/x86/kernel/apic/x2apic_phys.o
  CC      fs/ext4/migrate.o
  CC [M]  sound/core/pcm_memory.o
  CC      net/bridge/br_if.o
  CC      net/unix/garbage.o
  CC      net/unix/sysctl_net_unix.o
  LD [M]  net/ipv6/netfilter/nf_defrag_ipv6.o
  CC      net/xfrm/xfrm_hash.o
  CC      net/ipv6/af_inet6.o
  CC      net/xfrm/xfrm_input.o
  CC      block/bsg-lib.o
  CC [M]  drivers/video/fbdev/core/fb_cmdline.o
  CC      lib/buildid.o
  CC      drivers/pnp/manager.o
  CC      drivers/pci/hotplug/acpiphp_core.o
  AR      drivers/clk/actions/built-in.a
  AR      drivers/pci/pcie/built-in.a
  AR      drivers/clk/analogbits/built-in.a
  AR      drivers/pci/switch/built-in.a
  AR      drivers/clk/bcm/built-in.a
  AR      drivers/clk/imgtec/built-in.a
  CC      drivers/dma/dw/core.o
  AR      drivers/clk/imx/built-in.a
  CC      mm/compaction.o
  AR      drivers/clk/ingenic/built-in.a
  CC      drivers/acpi/acpica/dspkginit.o
  AR      drivers/clk/mediatek/built-in.a
  CC      drivers/pci/hotplug/acpiphp_glue.o
  AR      drivers/clk/microchip/built-in.a
  AR      drivers/clk/mstar/built-in.a
  AR      drivers/clk/mvebu/built-in.a
  AR      drivers/acpi/apei/built-in.a
  AR      drivers/clk/ralink/built-in.a
  CC [M]  drivers/video/fbdev/core/fb_backlight.o
  AR      drivers/clk/renesas/built-in.a
  CC [M]  sound/pci/hda/patch_hdmi.o
  AR      drivers/soc/apple/built-in.a
  CC      kernel/entry/common.o
  CC      kernel/dma/remap.o
  AR      drivers/clk/socfpga/built-in.a
  AR      drivers/clk/sprd/built-in.a
  AR      drivers/soc/aspeed/built-in.a
  AR      drivers/clk/starfive/built-in.a
  AR      drivers/soc/bcm/built-in.a
  CC      crypto/crypto_null.o
  AR      drivers/soc/fsl/built-in.a
  AR      drivers/clk/sunxi-ng/built-in.a
  AR      drivers/soc/fujitsu/built-in.a
  AR      drivers/clk/ti/built-in.a
  AR      drivers/clk/versatile/built-in.a
  AR      drivers/soc/hisilicon/built-in.a
  CC      drivers/clk/x86/clk-lpss-atom.o
  AR      drivers/soc/imx/built-in.a
  AR      drivers/soc/ixp4xx/built-in.a
  AR      drivers/soc/loongson/built-in.a
  AR      fs/proc/built-in.a
  CC      kernel/entry/syscall_user_dispatch.o
  CC      arch/x86/kernel/apic/x2apic_cluster.o
  AR      drivers/soc/mediatek/built-in.a
  AR      drivers/soc/microchip/built-in.a
  CC      kernel/entry/kvm.o
  CC      net/unix/diag.o
  AR      drivers/soc/nuvoton/built-in.a
  CC      net/core/dev_addr_lists.o
  AR      drivers/soc/pxa/built-in.a
  AR      drivers/soc/amlogic/built-in.a
  CC [M]  sound/core/memalloc.o
  AR      drivers/soc/qcom/built-in.a
  AR      kernel/rcu/built-in.a
  CC      kernel/irq/proc.o
  CC      lib/cmdline.o
  AR      drivers/soc/renesas/built-in.a
  CC      lib/cpumask.o
  CC      fs/ext4/mmp.o
  CC      drivers/pci/access.o
  AR      drivers/soc/rockchip/built-in.a
  AR      drivers/soc/sunxi/built-in.a
  AR      drivers/pci/controller/built-in.a
  AR      drivers/soc/ti/built-in.a
  CC      fs/ext4/move_extent.o
  CC      drivers/acpi/acpica/dsutils.o
  AR      drivers/soc/xilinx/built-in.a
  AR      drivers/soc/built-in.a
  CC      net/ethtool/phc_vclocks.o
  LD [M]  net/netfilter/ipvs/ip_vs.o
  AR      drivers/clk/xilinx/built-in.a
  CC      net/ethtool/mm.o
  CC [M]  drivers/video/fbdev/core/fbmon.o
  AR      net/key/built-in.a
  CC [M]  net/netfilter/nf_conntrack_standalone.o
  CC      mm/show_mem.o
  CC      drivers/pnp/support.o
  CC      drivers/pnp/interface.o
  CC      drivers/video/cmdline.o
  CC      lib/ctype.o
  CC [M]  arch/x86/kvm/debugfs.o
  CC      fs/ext4/namei.o
  CC [M]  net/netfilter/nf_conntrack_expect.o
  AR      drivers/pmdomain/actions/built-in.a
  AR      drivers/pmdomain/amlogic/built-in.a
  AR      drivers/pmdomain/apple/built-in.a
  CC      block/blk-cgroup.o
  AR      drivers/pmdomain/arm/built-in.a
  CC      net/unix/scm.o
  AR      drivers/pmdomain/bcm/built-in.a
  AR      drivers/pmdomain/imx/built-in.a
  CC      crypto/md5.o
  CC      drivers/clk/x86/clk-pmc-atom.o
  AR      kernel/dma/built-in.a
  AR      drivers/pmdomain/mediatek/built-in.a
  CC      crypto/sha1_generic.o
  AR      drivers/pmdomain/qcom/built-in.a
  AR      drivers/pmdomain/renesas/built-in.a
  AR      drivers/pmdomain/rockchip/built-in.a
  CC      kernel/module/main.o
  AR      drivers/pmdomain/samsung/built-in.a
  AR      drivers/pmdomain/st/built-in.a
  CC      drivers/pci/bus.o
  AR      drivers/pmdomain/starfive/built-in.a
  AR      drivers/pmdomain/sunxi/built-in.a
  CC      block/blk-cgroup-rwstat.o
  CC      kernel/module/strict_rwx.o
  AR      drivers/pmdomain/tegra/built-in.a
  CC      drivers/acpi/acpica/dswexec.o
  AR      drivers/pmdomain/ti/built-in.a
  AR      drivers/pmdomain/xilinx/built-in.a
  CC      drivers/pmdomain/core.o
  CC      kernel/module/kmod.o
  CC      drivers/virtio/virtio.o
  CC      arch/x86/kernel/apic/apic_flat_64.o
  CC      net/ipv4/inet_connection_sock.o
  CC      drivers/virtio/virtio_ring.o
  CC      kernel/irq/migration.o
  AR      drivers/pci/hotplug/built-in.a
  CC      drivers/virtio/virtio_anchor.o
  CC      drivers/dma/dw/dw.o
  CC [M]  arch/x86/kvm/mmu/mmu.o
  CC      drivers/dma/dw/idma32.o
  AR      net/packet/built-in.a
  CC      drivers/virtio/virtio_pci_modern_dev.o
  CC [M]  drivers/video/fbdev/core/fb_defio.o
  AR      kernel/entry/built-in.a
  CC [M]  drivers/video/fbdev/core/fb_chrdev.o
  CC      drivers/pnp/quirks.o
  CC [M]  sound/core/pcm_timer.o
  CC      lib/dec_and_lock.o
  CC      drivers/pci/probe.o
  CC      fs/ext4/page-io.o
  CC      drivers/acpi/acpica/dswload.o
  CC      net/xfrm/xfrm_output.o
  CC      drivers/pnp/system.o
  CC      net/core/dst.o
  CC [M]  net/netfilter/nf_conntrack_helper.o
  CC      net/ethtool/module.o
  CC      arch/x86/kernel/apic/probe_64.o
  CC      crypto/sha256_generic.o
  AR      drivers/clk/x86/built-in.a
  CC      drivers/clk/clk-devres.o
  CC      net/core/netevent.o
  CC      drivers/clk/clk-bulk.o
  CC      net/ipv6/anycast.o
  CC      mm/shmem_quota.o
  CC      drivers/pmdomain/governor.o
  CC      drivers/acpi/acpica/dswload2.o
  CC      net/bridge/br_input.o
  CC      drivers/pci/host-bridge.o
  CC      drivers/pci/remove.o
  CC      drivers/pci/pci.o
  CC      kernel/irq/cpuhotplug.o
  CC      kernel/irq/pm.o
  CC      arch/x86/kernel/cpu/feat_ctl.o
  AR      net/unix/built-in.a
  CC      mm/interval_tree.o
  CC      lib/decompress.o
  CC      drivers/clk/clkdev.o
  CC      drivers/acpi/dptf/int340x_thermal.o
  CC [M]  arch/x86/kvm/mmu/page_track.o
  CC [M]  drivers/video/fbdev/core/fb_procfs.o
  CC [M]  arch/x86/kvm/mmu/spte.o
  CC      block/blk-throttle.o
  CC      drivers/dma/dw/acpi.o
  LD [M]  sound/core/snd-ctl-led.o
  LD [M]  sound/core/snd-hwdep.o
  LD [M]  sound/core/snd-pcm.o
  CC      drivers/acpi/acpica/dswscope.o
  CC [M]  sound/pci/hda/hda_eld.o
  CC      drivers/acpi/acpica/dswstate.o
  AR      arch/x86/kernel/apic/built-in.a
  AR      sound/core/built-in.a
  CC      net/ipv6/ip6_output.o
  CC      arch/x86/kernel/process_64.o
  CC      drivers/virtio/virtio_pci_legacy_dev.o
  CC      net/ipv6/ip6_input.o
  AR      drivers/pnp/built-in.a
  AR      net/dsa/built-in.a
  CC      crypto/sha512_generic.o
  CC      block/mq-deadline.o
  CC      arch/x86/kernel/signal.o
  CC      arch/x86/kernel/signal_64.o
  CC      net/ethtool/pse-pd.o
  CC [M]  drivers/video/fbdev/core/fbsysfs.o
  CC [M]  drivers/video/fbdev/core/fbcon.o
  CC [M]  drivers/video/fbdev/core/bitblit.o
  CC [M]  arch/x86/kvm/mmu/tdp_iter.o
  CC      net/ethtool/plca.o
  CC      block/kyber-iosched.o
  CC [M]  sound/pci/hda/hda_intel.o
  CC      arch/x86/kernel/cpu/intel.o
  CC      drivers/pci/pci-driver.o
  AR      drivers/acpi/dptf/built-in.a
  CC      arch/x86/kernel/traps.o
  CC      arch/x86/kernel/idt.o
  CC      drivers/acpi/acpica/evevent.o
  CC      drivers/clk/clk.o
  AR      drivers/pmdomain/built-in.a
  CC      drivers/clk/clk-divider.o
  LD [M]  sound/pci/hda/snd-hda-codec.o
  CC      net/bridge/br_ioctl.o
  LD [M]  sound/pci/hda/snd-hda-codec-generic.o
  CC      kernel/irq/msi.o
  CC      kernel/irq/affinity.o
  CC      fs/ext4/readpage.o
  CC      net/bridge/br_stp.o
  CC      drivers/dma/dw/pci.o
  CC [M]  arch/x86/kvm/mmu/tdp_mmu.o
  CC      crypto/sha3_generic.o
  CC      arch/x86/kernel/cpu/intel_pconfig.o
  CC      drivers/virtio/virtio_pci_modern.o
  CC      net/core/neighbour.o
  CC [M]  net/netfilter/nf_conntrack_proto.o
  CC      drivers/acpi/acpica/evgpe.o
  CC      net/bridge/br_stp_bpdu.o
  CC      net/ipv6/addrconf.o
  CC      crypto/blake2b_generic.o
  CC      fs/ext4/resize.o
  CC      kernel/module/tree_lookup.o
  CC [M]  drivers/video/fbdev/core/softcursor.o
  CC [M]  drivers/video/fbdev/core/tileblit.o
  CC [M]  drivers/video/fbdev/core/fb_logo.o
  CC      mm/list_lru.o
  AR      sound/sparc/built-in.a
  CC      kernel/module/debug_kmemleak.o
  AR      sound/spi/built-in.a
  LD [M]  sound/pci/hda/snd-hda-codec-realtek.o
  CC      net/xfrm/xfrm_sysctl.o
  CC      net/xfrm/xfrm_replay.o
  CC      net/ipv4/tcp.o
  CC      net/xfrm/xfrm_device.o
  CC      lib/zstd/compress/zstd_ldm.o
  CC      kernel/time/time.o
  CC      kernel/time/timer.o
  CC      lib/zstd/compress/zstd_opt.o
  CC      arch/x86/kernel/irq.o
  CC      drivers/clk/clk-fixed-factor.o
  CC      kernel/futex/core.o
  AR      drivers/dma/dw/built-in.a
  CC      drivers/acpi/acpica/evgpeblk.o
  CC      drivers/dma/hsu/hsu.o
  CC      kernel/cgroup/cgroup.o
  AR      net/ethtool/built-in.a
  CC      kernel/module/kallsyms.o
  CC      kernel/cgroup/rstat.o
  CC      crypto/ecb.o
  CC      mm/workingset.o
  CC      arch/x86/kernel/cpu/tsx.o
  CC      kernel/time/hrtimer.o
  CC [M]  net/netfilter/nf_conntrack_proto_generic.o
  CC      drivers/virtio/virtio_pci_common.o
  CC      kernel/trace/trace_clock.o
  CC      fs/fat/cache.o
  CC      lib/zstd/zstd_decompress_module.o
  CC      kernel/irq/matrix.o
  CC      net/bridge/br_stp_if.o
  CC [M]  drivers/video/fbdev/core/cfbfillrect.o
  CC      drivers/acpi/acpica/evgpeinit.o
  CC      lib/zstd/decompress/huf_decompress.o
  CC      block/bfq-iosched.o
  CC      kernel/trace/ftrace.o
  CC      drivers/virtio/virtio_pci_legacy.o
  CC      kernel/bpf/core.o
  CC      net/ipv6/addrlabel.o
  LD [M]  sound/pci/hda/snd-hda-codec-analog.o
  CC      crypto/cbc.o
  LD [M]  sound/pci/hda/snd-hda-codec-hdmi.o
  CC      kernel/trace/ring_buffer.o
  LD [M]  sound/pci/hda/snd-hda-intel.o
  AR      sound/pci/built-in.a
  CC      drivers/virtio/virtio_pci_admin_legacy_io.o
  CC      kernel/trace/trace.o
  CC      kernel/trace/trace_output.o
  AR      sound/parisc/built-in.a
  AR      sound/pcmcia/vx/built-in.a
  CC      net/bridge/br_stp_timer.o
  AR      sound/pcmcia/pdaudiocf/built-in.a
  AR      sound/pcmcia/built-in.a
  CC      arch/x86/kernel/cpu/intel_epb.o
  CC      net/ipv6/route.o
  CC [M]  drivers/video/fbdev/core/cfbcopyarea.o
  AR      sound/mips/built-in.a
  AR      drivers/dma/hsu/built-in.a
  AR      sound/soc/built-in.a
  AR      drivers/dma/idxd/built-in.a
  AR      sound/atmel/built-in.a
  AR      drivers/dma/mediatek/built-in.a
  AR      sound/hda/built-in.a
  CC      kernel/module/procfs.o
  AR      sound/x86/built-in.a
  AR      drivers/dma/qcom/built-in.a
  CC [M]  sound/hda/hda_bus_type.o
  CC [M]  sound/hda/hdac_bus.o
  CC      net/ipv6/ip6_fib.o
  CC      drivers/acpi/acpica/evgpeutil.o
  CC      kernel/futex/syscalls.o
  AR      drivers/dma/ti/built-in.a
  AR      drivers/dma/xilinx/built-in.a
  AR      sound/xen/built-in.a
  CC [M]  drivers/dma/ioat/init.o
  AR      sound/virtio/built-in.a
  CC [M]  drivers/dma/ioat/dma.o
  CC      drivers/pci/search.o
  CC      fs/fat/dir.o
  CC      net/ipv4/tcp_input.o
  CC      mm/debug.o
  CC [M]  drivers/virtio/virtio_mem.o
  CC      crypto/pcbc.o
  CC      net/xfrm/xfrm_algo.o
  CC      net/xfrm/xfrm_user.o
  CC      sound/sound_core.o
  CC [M]  net/netfilter/nf_conntrack_proto_tcp.o
  CC      fs/ext4/super.o
  CC      drivers/acpi/acpica/evglock.o
  CC      kernel/cgroup/namespace.o
  CC      drivers/clk/clk-fixed-rate.o
  CC      arch/x86/kernel/cpu/amd.o
  CC      drivers/clk/clk-gate.o
  CC      kernel/module/sysfs.o
  CC      kernel/time/timekeeping.o
  AR      kernel/irq/built-in.a
  CC [M]  drivers/video/fbdev/core/cfbimgblt.o
  CC [M]  arch/x86/kvm/hyperv.o
  CC      sound/last.o
  CC      net/bridge/br_netlink.o
  CC [M]  sound/hda/hdac_device.o
  CC      arch/x86/kernel/irq_64.o
  CC      drivers/acpi/acpica/evhandler.o
  CC      crypto/cts.o
  CC [M]  sound/hda/hdac_sysfs.o
  CC [M]  drivers/video/fbdev/core/fb_io_fops.o
  CC      crypto/lrw.o
  CC      arch/x86/kernel/dumpstack_64.o
  CC      drivers/pci/pci-sysfs.o
  CC      net/bridge/br_netlink_tunnel.o
  CC      kernel/futex/pi.o
  CC      drivers/clk/clk-multiplier.o
  CC      drivers/clk/clk-mux.o
  CC      mm/gup.o
  CC [M]  drivers/dma/ioat/prep.o
  CC [M]  drivers/dma/ioat/dca.o
  CC      kernel/cgroup/cgroup-v1.o
  CC      kernel/futex/requeue.o
  CC      drivers/video/nomodeset.o
  CC [M]  net/netfilter/nf_conntrack_proto_udp.o
  CC      drivers/acpi/acpica/evmisc.o
  AR      kernel/module/built-in.a
  CC [M]  net/netfilter/nf_conntrack_proto_icmp.o
  CC [M]  net/netfilter/nf_conntrack_extend.o
  CC      arch/x86/kernel/cpu/hygon.o
  CC [M]  net/netfilter/nf_conntrack_acct.o
  CC      fs/fat/fatent.o
  CC      mm/mmap_lock.o
  CC      net/core/rtnetlink.o
  CC      drivers/clk/clk-composite.o
  CC [M]  drivers/video/fbdev/core/sysfillrect.o
  CC      arch/x86/kernel/time.o
  CC      crypto/xts.o
  CC      drivers/acpi/acpica/evregion.o
  CC      kernel/events/core.o
  CC      drivers/video/hdmi.o
  CC      kernel/fork.o
  CC [M]  sound/hda/hdac_regmap.o
  CC [M]  drivers/video/fbdev/core/syscopyarea.o
  CC      drivers/acpi/acpica/evrgnini.o
  CC      kernel/exec_domain.o
  AR      drivers/virtio/built-in.a
  CC      block/bfq-wf2q.o
  CC      drivers/tty/vt/vt_ioctl.o
  CC      kernel/futex/waitwake.o
  CC      drivers/tty/vt/vc_screen.o
  AR      kernel/bpf/built-in.a
  CC      drivers/tty/hvc/hvc_console.o
  CC      kernel/time/ntp.o
  CC [M]  net/netfilter/nf_conntrack_seqadj.o
  CC      lib/zstd/decompress/zstd_ddict.o
  CC      drivers/acpi/acpica/evsci.o
  CC      kernel/trace/trace_seq.o
  CC      arch/x86/kernel/cpu/centaur.o
  CC      drivers/pci/rom.o
  CC      drivers/clk/clk-fractional-divider.o
  CC [M]  drivers/dma/ioat/sysfs.o
  CC      mm/highmem.o
  CC      kernel/trace/trace_stat.o
  CC      kernel/trace/trace_printk.o
  CC      drivers/acpi/acpica/evxface.o
  CC      arch/x86/kernel/ioport.o
  CC      arch/x86/kernel/cpu/zhaoxin.o
  CC      kernel/cgroup/freezer.o
  CC      kernel/panic.o
  CC      drivers/pci/setup-res.o
  CC [M]  drivers/video/fbdev/core/sysimgblt.o
  CC      drivers/acpi/acpica/evxfevnt.o
  CC      arch/x86/kernel/cpu/perfctr-watchdog.o
  CC      crypto/ctr.o
  CC [M]  sound/hda/hdac_controller.o
  CC      arch/x86/kernel/cpu/vmware.o
  CC      mm/memory.o
  CC      net/bridge/br_arp_nd_proxy.o
  CC      drivers/pci/irq.o
  AR      net/xfrm/built-in.a
  CC      net/ipv4/tcp_output.o
  CC      kernel/cpu.o
  CC      fs/fat/file.o
  CC      kernel/exit.o
  AR      kernel/futex/built-in.a
  CC      drivers/clk/clk-gpio.o
  CC      lib/decompress_bunzip2.o
  CC      kernel/cgroup/legacy_freezer.o
  CC      arch/x86/kernel/cpu/hypervisor.o
  CC [M]  net/sunrpc/auth_gss/auth_gss.o
  CC      net/8021q/vlan_core.o
  CC [M]  arch/x86/kvm/smm.o
  CC      net/ipv6/ipv6_sockglue.o
  CC      drivers/pci/vpd.o
  CC [M]  net/8021q/vlan.o
  CC      kernel/time/clocksource.o
  CC      drivers/acpi/acpica/evxfgpe.o
  CC      net/sunrpc/clnt.o
  LD [M]  drivers/dma/ioat/ioatdma.o
  AR      drivers/tty/hvc/built-in.a
  CC      drivers/dma/dmaengine.o
  CC      block/bfq-cgroup.o
  CC [M]  sound/hda/hdac_stream.o
  CC      block/blk-mq-pci.o
  CC      block/blk-mq-virtio.o
  CC      drivers/pci/setup-bus.o
  CC      kernel/trace/pid_list.o
  CC      drivers/tty/vt/selection.o
  CC      kernel/trace/trace_sched_switch.o
  CC      drivers/acpi/acpica/evxfregn.o
  CC      arch/x86/kernel/cpu/mshyperv.o
  CC      kernel/time/jiffies.o
  CC      crypto/gcm.o
  CC [M]  sound/hda/array.o
  AR      drivers/clk/built-in.a
  CC      arch/x86/kernel/cpu/debugfs.o
  CC      kernel/trace/trace_functions.o
  CC      drivers/tty/vt/keyboard.o
  CC      block/blk-mq-debugfs.o
  CC      drivers/pci/vc.o
  CC [M]  net/netfilter/nf_conntrack_proto_icmpv6.o
  CC      arch/x86/kernel/dumpstack.o
  CC [M]  drivers/video/fbdev/core/fb_sys_fops.o
  CC [M]  sound/hda/hdmi_chmap.o
  CC      drivers/acpi/acpica/exconcat.o
  CC      net/ipv6/ndisc.o
  CC      kernel/trace/trace_preemptirq.o
  CC      kernel/cgroup/pids.o
  CC      fs/fat/inode.o
  CC      kernel/events/ring_buffer.o
  CC      net/ipv4/tcp_timer.o
  CC      arch/x86/kernel/cpu/capflags.o
  CC      kernel/cgroup/cpuset.o
  CC      net/ipv4/tcp_ipv4.o
  CC      arch/x86/kernel/nmi.o
  CC      kernel/time/timer_list.o
  CC      drivers/tty/serial/8250/8250_core.o
  CC      drivers/acpi/acpica/exconfig.o
  CC      drivers/tty/serial/8250/8250_pnp.o
  CC      block/blk-pm.o
  CC      mm/mincore.o
  CC      net/bridge/br_sysfs_if.o
  CC [M]  sound/hda/trace.o
  CC      lib/zstd/decompress/zstd_decompress.o
  CC      net/core/utils.o
  CC [M]  sound/hda/hdac_component.o
  CC      kernel/events/callchain.o
  CC [M]  arch/x86/kvm/vmx/vmx.o
  CC      drivers/pci/mmap.o
  CC [M]  net/8021q/vlan_dev.o
  AR      arch/x86/kernel/cpu/built-in.a
  CC [M]  arch/x86/kvm/kvm-asm-offsets.s
  CC      drivers/acpi/acpica/exconvrt.o
  CC      net/sunrpc/xprt.o
  CC      drivers/dma/virt-dma.o
  CC      net/bridge/br_sysfs_br.o
  CC      crypto/pcrypt.o
  CC      lib/zstd/decompress/zstd_decompress_block.o
  CC [M]  net/8021q/vlan_netlink.o
  LD [M]  drivers/video/fbdev/core/fb.o
  CC [M]  arch/x86/kvm/vmx/pmu_intel.o
  AR      drivers/video/fbdev/core/built-in.a
  AR      drivers/video/fbdev/built-in.a
  CC      kernel/trace/trace_nop.o
  CC      mm/mlock.o
  AR      drivers/video/built-in.a
  CC [M]  arch/x86/kvm/vmx/vmcs12.o
  CC      drivers/tty/vt/consolemap.o
  CC      kernel/softirq.o
  CC      lib/zstd/zstd_common_module.o
  CC      kernel/time/timeconv.o
  CC      block/holder.o
  CC      lib/zstd/common/debug.o
  CC      kernel/resource.o
  CC      drivers/tty/serial/8250/8250_port.o
  CC      drivers/acpi/acpica/excreate.o
  CC      drivers/acpi/acpica/exdebug.o
  CC [M]  net/netfilter/nf_conntrack_proto_dccp.o
  CC [M]  sound/hda/hdac_i915.o
  CC      lib/zstd/common/entropy_common.o
  CC      net/ipv6/udp.o
  CC      kernel/events/hw_breakpoint.o
  CC      drivers/pci/setup-irq.o
  CC [M]  arch/x86/kvm/vmx/nested.o
  CC      arch/x86/kernel/ldt.o
  CC [M]  net/8021q/vlanproc.o
  CC      net/ipv6/udplite.o
  CC [M]  net/sunrpc/auth_gss/gss_generic_token.o
  CC      net/core/link_watch.o
  CC [M]  net/netfilter/nf_conntrack_proto_sctp.o
  HOSTCC  drivers/tty/vt/conmakehash
  CC      fs/fat/misc.o
  CC      drivers/dma/acpi-dma.o
  CC      crypto/cryptd.o
  CC [M]  arch/x86/kvm/vmx/posted_intr.o
  AS      arch/x86/kernel/ibt_selftest.o
  CC      drivers/acpi/acpica/exdump.o
  CC      drivers/acpi/acpica/exfield.o
  CC      lib/zstd/common/error_private.o
  CC      lib/zstd/common/fse_decompress.o
  CC      kernel/time/timecounter.o
  CC      kernel/sysctl.o
  CC      kernel/trace/trace_functions_graph.o
  CC      net/core/filter.o
  CC      lib/zstd/common/zstd_common.o
  CC      kernel/time/alarmtimer.o
  CC      kernel/events/uprobes.o
  CC      mm/mmap.o
  CC      mm/mmu_gather.o
  CC      kernel/capability.o
  AR      block/built-in.a
  AR      net/8021q/built-in.a
  CC [M]  arch/x86/kvm/vmx/hyperv.o
  CC      net/ipv4/tcp_minisocks.o
  CC      drivers/tty/vt/vt.o
  CC [M]  sound/hda/intel-dsp-config.o
  CC      drivers/char/hw_random/core.o
  CC [M]  sound/hda/intel-nhlt.o
  CC      drivers/pci/proc.o
  CC      drivers/acpi/acpica/exfldio.o
  CC      drivers/char/hw_random/intel-rng.o
  CC      net/bridge/br_nf_core.o
  CC [M]  net/sunrpc/auth_gss/gss_mech_switch.o
  CC      fs/fat/nfs.o
  LD [M]  net/8021q/8021q.o
  AR      drivers/dma/built-in.a
  CC [M]  net/sunrpc/auth_gss/svcauth_gss.o
  CC      kernel/trace/fgraph.o
  CC      fs/fat/namei_vfat.o
  CC      net/dcb/dcbnl.o
  AR      drivers/iommu/amd/built-in.a
  CC      net/dcb/dcbevent.o
  CC      drivers/iommu/intel/dmar.o
  CC      fs/fat/namei_msdos.o
  CC      net/core/sock_diag.o
  CC      arch/x86/kernel/setup.o
  CC      kernel/ptrace.o
  AR      drivers/iommu/arm/arm-smmu/built-in.a
  CC      arch/x86/kernel/x86_init.o
  AR      drivers/iommu/arm/arm-smmu-v3/built-in.a
  AR      drivers/iommu/arm/built-in.a
  CC      fs/nfs/client.o
  CC      drivers/acpi/acpica/exmisc.o
  CC      crypto/des_generic.o
  CC      net/core/dev_ioctl.o
  CC      fs/nfs/dir.o
  CC      net/ipv4/tcp_cong.o
  AR      drivers/iommu/iommufd/built-in.a
  CC      drivers/iommu/iommu.o
  CC [M]  sound/hda/intel-sdw-acpi.o
  CC      kernel/user.o
  CC [M]  net/netfilter/nf_conntrack_netlink.o
  LD [M]  sound/hda/snd-hda-core.o
  CC      drivers/iommu/iommu-traces.o
  CC      drivers/pci/slot.o
  CC      net/ipv6/raw.o
  CC      drivers/iommu/intel/iommu.o
  CC      kernel/time/posix-timers.o
  AR      drivers/char/hw_random/built-in.a
  CC      drivers/char/agp/backend.o
  CC      drivers/tty/serial/8250/8250_dma.o
  CC      drivers/char/agp/generic.o
  CC      drivers/acpi/acpica/exmutex.o
  CC      drivers/tty/serial/8250/8250_dwlib.o
  CC      net/ipv6/icmp.o
  AR      kernel/cgroup/built-in.a
  CC      crypto/aes_generic.o
  CC      arch/x86/kernel/i8259.o
  CC      kernel/trace/blktrace.o
  CC      arch/x86/kernel/irqinit.o
  CC      arch/x86/kernel/jump_label.o
  CC      arch/x86/kernel/irq_work.o
  AR      lib/zstd/built-in.a
  CC      net/sunrpc/socklib.o
  CC      lib/decompress_inflate.o
  CC      net/bridge/br_multicast.o
  CC      net/ipv4/tcp_metrics.o
  LD [M]  sound/hda/snd-intel-dspcfg.o
  CC      drivers/acpi/acpica/exnames.o
  LD [M]  sound/hda/snd-intel-sdw-acpi.o
  AR      sound/built-in.a
  CC      fs/nfs/file.o
  CC      kernel/trace/trace_events.o
  AR      fs/fat/built-in.a
  CC      kernel/time/posix-cpu-timers.o
  CC      drivers/char/tpm/tpm-chip.o
  CC      fs/exportfs/expfs.o
  CC      fs/lockd/clntlock.o
  CC      drivers/char/tpm/tpm-dev-common.o
  CC      drivers/iommu/iommu-sysfs.o
  CC      fs/lockd/clntproc.o
  CC      drivers/pci/pci-acpi.o
  CC      drivers/tty/serial/8250/8250_pcilib.o
  CC      drivers/tty/serial/8250/8250_early.o
  CC      drivers/iommu/dma-iommu.o
  CC      net/l3mdev/l3mdev.o
  CC      net/handshake/alert.o
  CC      drivers/tty/serial/8250/8250_dw.o
  CC      drivers/acpi/acpica/exoparg1.o
  CC [M]  net/bluetooth/af_bluetooth.o
  CC      drivers/pci/quirks.o
  CC      lib/decompress_unlz4.o
  CC      net/handshake/genl.o
  CC      drivers/iommu/intel/pasid.o
  CC      drivers/char/tpm/tpm-dev.o
  CC      drivers/iommu/iova.o
  AR      net/dcb/built-in.a
  CC      crypto/crc32c_generic.o
  CC      fs/ext4/symlink.o
  CC      kernel/time/posix-clock.o
  CC      drivers/char/agp/isoch.o
  AR      fs/exportfs/built-in.a
  CC      net/ipv4/tcp_fastopen.o
  CC      crypto/crct10dif_common.o
  COPY    drivers/tty/vt/defkeymap.c
  CONMK   drivers/tty/vt/consolemap_deftbl.c
  CC      drivers/tty/vt/defkeymap.o
  CC      arch/x86/kernel/probe_roms.o
  CC      kernel/trace/trace_export.o
  CC [M]  net/bluetooth/hci_core.o
  CC      drivers/acpi/acpica/exoparg2.o
  CC      drivers/iommu/irq_remapping.o
  CC      drivers/acpi/acpica/exoparg3.o
  CC      drivers/char/tpm/tpm-interface.o
  CC      drivers/tty/vt/consolemap_deftbl.o
  CC      drivers/tty/serial/8250/8250_exar.o
  AR      drivers/tty/vt/built-in.a
  CC      crypto/crct10dif_generic.o
  AR      kernel/events/built-in.a
  CC      drivers/iommu/intel/nested.o
  CC      drivers/tty/serial/8250/8250_lpss.o
  CC [M]  net/bluetooth/hci_conn.o
  CC      lib/decompress_unlzma.o
  CC [M]  net/sunrpc/auth_gss/gss_rpc_upcall.o
  CC      mm/mprotect.o
  CC      mm/mremap.o
  CC      kernel/trace/trace_event_perf.o
  AR      net/l3mdev/built-in.a
  CC      crypto/authenc.o
  CC [M]  net/dns_resolver/dns_key.o
  CC      crypto/authencesn.o
  CC [M]  net/bluetooth/hci_event.o
  CC      net/devres.o
  CC      kernel/trace/trace_events_filter.o
  CC      kernel/time/itimer.o
  CC      kernel/trace/trace_events_trigger.o
  CC      drivers/acpi/acpica/exoparg6.o
  CC      kernel/time/clockevents.o
  CC      net/ipv6/mcast.o
  CC      crypto/lzo.o
  CC      fs/ext4/sysfs.o
  AR      drivers/tty/ipwireless/built-in.a
  CC      drivers/tty/tty_io.o
  CC      drivers/char/agp/intel-agp.o
  CC      crypto/lzo-rle.o
  CC      arch/x86/kernel/sys_ia32.o
  CC [M]  net/dns_resolver/dns_query.o
  CC      fs/lockd/clntxdr.o
  CC [M]  net/netfilter/nf_nat_core.o
  CC      fs/lockd/host.o
  CC      fs/lockd/svc.o
  CC      drivers/char/mem.o
  CC      drivers/acpi/acpica/exprep.o
  CC      drivers/tty/serial/8250/8250_mid.o
  CC      fs/lockd/svclock.o
  CC      net/handshake/netlink.o
  CC [M]  net/netfilter/nf_nat_proto.o
  CC      net/handshake/request.o
  CC      lib/decompress_unlzo.o
  CC [M]  net/bluetooth/mgmt.o
  CC      drivers/char/tpm/tpm1-cmd.o
  CC      fs/nfs/getroot.o
  CC      drivers/iommu/intel/trace.o
  CC      drivers/char/random.o
  CC      crypto/lz4.o
  CC      crypto/lz4hc.o
  CC      net/ipv4/tcp_rate.o
  CC      drivers/tty/n_tty.o
  CC      fs/lockd/svcshare.o
  CC      drivers/acpi/acpica/exregion.o
  CC [M]  net/sunrpc/auth_gss/gss_rpc_xdr.o
  CC [M]  net/sunrpc/auth_gss/trace.o
  CC      arch/x86/kernel/signal_32.o
  CC      kernel/time/tick-common.o
  CC      drivers/char/agp/intel-gtt.o
  CC      crypto/xxhash_generic.o
  CC      kernel/trace/trace_eprobe.o
  CC      drivers/iommu/intel/cap_audit.o
  LD [M]  net/dns_resolver/dns_resolver.o
  CC      crypto/rng.o
  CC      net/socket.o
  CC      fs/ext4/xattr.o
  CC      net/compat.o
  CC      lib/decompress_unxz.o
  CC      fs/nls/nls_base.o
  CC [M]  arch/x86/kvm/vmx/hyperv_evmcs.o
  CC      fs/nls/nls_cp437.o
  LD [M]  arch/x86/kvm/kvm.o
  CC      drivers/tty/serial/8250/8250_pci.o
  CC      arch/x86/kernel/sys_x86_64.o
  CC      drivers/pci/ats.o
  CC      mm/msync.o
  CC      drivers/acpi/acpica/exresnte.o
  CC      lib/decompress_unzstd.o
  CC      drivers/tty/tty_ioctl.o
  CC      drivers/char/tpm/tpm2-cmd.o
  CC      net/ipv6/reassembly.o
  CC [M]  net/bluetooth/hci_sock.o
  CC      kernel/trace/trace_kprobe.o
  CC      fs/nls/nls_ascii.o
  CC      arch/x86/kernel/espfix_64.o
  AR      fs/unicode/built-in.a
  AR      drivers/gpu/host1x/built-in.a
  CC      fs/ntfs/aops.o
  AR      fs/hostfs/built-in.a
  AR      drivers/gpu/drm/tests/built-in.a
  CC      lib/dump_stack.o
  CC      fs/nfs/inode.o
  CC [M]  drivers/gpu/drm/tests/drm_kunit_helpers.o
  CC      drivers/acpi/acpica/exresolv.o
  CC [M]  drivers/gpu/drm/tests/drm_buddy_test.o
  CC [M]  drivers/gpu/drm/tests/drm_cmdline_parser_test.o
  AR      drivers/gpu/vga/built-in.a
  CC      net/handshake/tlshd.o
  CC      drivers/iommu/intel/irq_remapping.o
  CC      fs/nls/nls_iso8859-1.o
  CC      crypto/drbg.o
  CC      fs/debugfs/inode.o
  CC      fs/lockd/svcproc.o
  CC      fs/lockd/svcsubs.o
  CC      kernel/time/tick-broadcast.o
  CC      lib/earlycpio.o
  UPD     arch/x86/kvm/kvm-asm-offsets.h
  AR      drivers/char/agp/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_connector_test.o
  AS [M]  arch/x86/kvm/vmx/vmenter.o
  CC      mm/page_vma_mapped.o
  LD [M]  arch/x86/kvm/kvm-intel.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_mech.o
  CC      mm/pagewalk.o
  CC      drivers/char/tpm/tpmrm-dev.o
  CC      drivers/pci/iov.o
  CC      drivers/char/tpm/tpm2-space.o
  CC      net/ipv4/tcp_recovery.o
  CC [M]  net/netfilter/nf_nat_helper.o
  CC      drivers/char/misc.o
  CC      drivers/char/tpm/tpm-sysfs.o
  CC      drivers/char/virtio_console.o
  CC      drivers/char/tpm/eventlog/common.o
  CC      drivers/acpi/acpica/exresop.o
  CC      crypto/jitterentropy.o
  CC      net/ipv6/tcp_ipv6.o
  CC      fs/ntfs/attrib.o
  CC      lib/extable.o
  AR      drivers/gpu/drm/arm/built-in.a
  CC      fs/nls/nls_utf8.o
  CC [M]  fs/nls/nls_ucs2_utils.o
  CC      lib/flex_proportions.o
  CC      fs/lockd/mon.o
  CC      arch/x86/kernel/ksysfs.o
  CC      fs/tracefs/inode.o
  CC      drivers/acpi/tables.o
  CC      fs/tracefs/event_inode.o
  CC      net/bridge/br_mdb.o
  CC      drivers/tty/serial/8250/8250_pericom.o
  CC      fs/nfs/super.o
  CC      drivers/acpi/acpica/exserial.o
  CC [M]  drivers/gpu/drm/tests/drm_damage_helper_test.o
  CC      fs/ntfs/collate.o
  CC      drivers/acpi/blacklist.o
  CC      kernel/time/tick-broadcast-hrtimer.o
  CC      fs/debugfs/file.o
  CC      fs/ntfs/compress.o
  CC      lib/idr.o
  CC      net/ipv6/ping.o
  CC      net/handshake/trace.o
  CC      kernel/time/tick-oneshot.o
  CC      drivers/acpi/acpica/exstore.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_seal.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_unseal.o
  CC      drivers/char/tpm/eventlog/tpm1.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_wrap.o
  AR      fs/nls/built-in.a
  CC      drivers/acpi/acpica/exstoren.o
  CC      net/sysctl_net.o
  CC      fs/ext4/xattr_hurd.o
  CC [M]  drivers/gpu/drm/tests/drm_dp_mst_helper_test.o
  CC      fs/ntfs/debug.o
  CC      fs/ntfs/dir.o
  CC      drivers/pci/pci-label.o
  CC      mm/pgtable-generic.o
  CC      arch/x86/kernel/bootflag.o
  CC      fs/btrfs/super.o
  CC      drivers/iommu/intel/perfmon.o
  CC      drivers/pci/pci-stub.o
  CC      crypto/jitterentropy-kcapi.o
  CC      crypto/ghash-generic.o
  AR      drivers/tty/serial/8250/built-in.a
  CC      drivers/tty/serial/serial_core.o
  CC      net/ipv4/tcp_ulp.o
  CC      net/ipv4/tcp_offload.o
  CC      net/core/tso.o
  CC      mm/rmap.o
  CC      net/core/sock_reuseport.o
  CC      drivers/char/tpm/eventlog/tpm2.o
  CC      net/ipv4/tcp_plb.o
  CC      drivers/acpi/acpica/exstorob.o
  CC [M]  net/netfilter/nf_nat_redirect.o
  CC      mm/vmalloc.o
  CC      lib/irq_regs.o
  CC      net/core/fib_notifier.o
  CC      fs/btrfs/ctree.o
  CC      kernel/trace/error_report-traces.o
  CC      drivers/char/hpet.o
  CC      kernel/time/tick-sched.o
  CC [M]  drivers/gpu/drm/tests/drm_exec_test.o
  AR      fs/tracefs/built-in.a
  CC      net/ipv6/exthdrs.o
  CC      lib/is_single_threaded.o
  CC      fs/lockd/trace.o
  CC      kernel/signal.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_crypto.o
  CC      net/ipv4/datagram.o
  CC [M]  drivers/gpu/drm/tests/drm_format_helper_test.o
  CC      kernel/time/vsyscall.o
  CC      drivers/char/tpm/tpm_ppi.o
  CC      arch/x86/kernel/e820.o
  CC      drivers/acpi/acpica/exsystem.o
  CC      fs/ext4/xattr_trusted.o
  CC      fs/btrfs/extent-tree.o
  CC      drivers/pci/vgaarb.o
  AR      fs/debugfs/built-in.a
  CC [M]  net/bluetooth/hci_sysfs.o
  CC      fs/pstore/inode.o
  CC      crypto/af_alg.o
  CC      fs/nfs/io.o
  CC      fs/nfs/direct.o
  CC      lib/klist.o
  CC      fs/pstore/platform.o
  CC      fs/btrfs/print-tree.o
  CC      fs/nfs/pagelist.o
  CC [M]  drivers/gpu/drm/tests/drm_format_test.o
  CC [M]  drivers/gpu/drm/tests/drm_framebuffer_test.o
  CC [M]  drivers/gpu/drm/tests/drm_gem_shmem_test.o
  CC      drivers/acpi/acpica/extrace.o
  CC      kernel/trace/power-traces.o
  CC      net/bridge/br_multicast_eht.o
  CC      fs/ntfs/file.o
  CC      arch/x86/kernel/pci-dma.o
  AR      net/handshake/built-in.a
  CC      fs/lockd/xdr.o
  AR      drivers/iommu/intel/built-in.a
  AR      drivers/iommu/built-in.a
  CC      lib/kobject.o
  CC      drivers/connector/cn_queue.o
  CC      drivers/base/power/sysfs.o
  CC      drivers/connector/connector.o
  CC      net/core/xdp.o
  CC      drivers/base/power/generic_ops.o
  CC      drivers/char/tpm/eventlog/acpi.o
  CC      fs/ext4/xattr_user.o
  CC      drivers/acpi/acpica/exutils.o
  CC      kernel/time/timekeeping_debug.o
  CC      lib/kobject_uevent.o
  CC      drivers/char/nvram.o
  CC [M]  net/netfilter/nf_nat_masquerade.o
  CC      fs/pstore/pmsg.o
  CC [M]  net/bluetooth/l2cap_core.o
  CC [M]  net/sunrpc/auth_gss/gss_krb5_keys.o
  CC      drivers/base/power/common.o
  CC      drivers/connector/cn_proc.o
  CC      net/ipv4/raw.o
  CC      fs/ntfs/index.o
  AR      drivers/gpu/drm/display/built-in.a
  CC [M]  drivers/gpu/drm/display/drm_display_helper_mod.o
  CC [M]  drivers/gpu/drm/display/drm_dp_dual_mode_helper.o
  CC [M]  drivers/gpu/drm/tests/drm_managed_test.o
  CC      net/core/flow_offload.o
  CC      fs/btrfs/root-tree.o
  AR      drivers/pci/built-in.a
  AR      drivers/gpu/drm/renesas/rcar-du/built-in.a
  CC      fs/btrfs/dir-item.o
  AR      drivers/gpu/drm/renesas/built-in.a
  CC      arch/x86/kernel/quirks.o
  CC      drivers/acpi/acpica/hwacpi.o
  CC      lib/logic_pio.o
  CC      net/ipv6/datagram.o
  CC      net/bridge/br_vlan.o
  CC      net/bridge/br_vlan_tunnel.o
  CC      fs/lockd/clnt4xdr.o
  AR      drivers/gpu/drm/omapdrm/built-in.a
  CC      net/bridge/br_vlan_options.o
  AR      drivers/gpu/drm/tilcdc/built-in.a
  CC      drivers/base/power/qos.o
  AR      drivers/gpu/drm/imx/built-in.a
  CC      drivers/block/loop.o
  CC      net/ipv6/ip6_flowlabel.o
  CC      drivers/tty/serial/serial_base_bus.o
  CC      drivers/char/tpm/eventlog/efi.o
  AR      fs/pstore/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_mm_test.o
  CC      fs/ext4/fast_commit.o
  CC      kernel/time/namespace.o
  CC      drivers/acpi/acpica/hwesleep.o
  CC [M]  drivers/gpu/drm/display/drm_dp_helper.o
  CC [M]  drivers/gpu/drm/display/drm_dp_mst_topology.o
  CC      drivers/base/power/runtime.o
  CC [M]  drivers/gpu/drm/display/drm_dsc_helper.o
  CC [M]  drivers/gpu/drm/display/drm_hdcp_helper.o
  CC      fs/ext4/orphan.o
  CC [M]  drivers/block/nbd.o
  CC [M]  drivers/gpu/drm/tests/drm_modes_test.o
  LD [M]  net/sunrpc/auth_gss/auth_rpcgss.o
  CC      crypto/algif_hash.o
  CC      fs/ntfs/inode.o
  CC      net/bridge/br_mst.o
  LD [M]  net/sunrpc/auth_gss/rpcsec_gss_krb5.o
  CC      net/sunrpc/xprtsock.o
  CC      kernel/trace/rpm-traces.o
  CC      drivers/base/power/wakeirq.o
  CC      net/sunrpc/sched.o
  CC [M]  net/bluetooth/l2cap_sock.o
  CC      drivers/acpi/acpica/hwgpe.o
  CC [M]  drivers/gpu/drm/display/drm_hdmi_helper.o
  CC      lib/maple_tree.o
  CC      arch/x86/kernel/topology.o
  CC      fs/nfs/read.o
  CC      drivers/tty/serial/serial_ctrl.o
  CC      drivers/char/tpm/tpm_crb.o
  CC [M]  drivers/gpu/drm/tests/drm_plane_helper_test.o
  AR      drivers/connector/built-in.a
  CC [M]  net/bluetooth/smp.o
  CC [M]  net/netfilter/x_tables.o
  AR      drivers/gpu/drm/i2c/built-in.a
  CC      net/core/gro.o
  AR      kernel/time/built-in.a
  CC      arch/x86/kernel/kdebugfs.o
  AR      drivers/gpu/drm/panel/built-in.a
  CC      fs/nfs/symlink.o
  AR      drivers/gpu/drm/bridge/analogix/built-in.a
  AR      drivers/gpu/drm/bridge/cadence/built-in.a
  CC      fs/lockd/xdr4.o
  AR      drivers/gpu/drm/bridge/imx/built-in.a
  AR      drivers/gpu/drm/bridge/synopsys/built-in.a
  AR      drivers/gpu/drm/bridge/built-in.a
  CC      drivers/base/firmware_loader/builtin/main.o
  CC      drivers/base/firmware_loader/main.o
  AR      drivers/gpu/drm/hisilicon/built-in.a
  CC      drivers/acpi/acpica/hwregs.o
  CC [M]  drivers/gpu/drm/display/drm_scdc_helper.o
  CC [M]  drivers/gpu/drm/tests/drm_probe_helper_test.o
  CC      fs/lockd/svc4proc.o
  CC      mm/page_alloc.o
  CC      arch/x86/kernel/alternative.o
  CC [M]  drivers/gpu/drm/display/drm_dp_aux_dev.o
  CC      net/sunrpc/auth.o
  CC      drivers/tty/serial/serial_port.o
  CC      drivers/tty/serial/earlycon.o
  CC      drivers/base/power/main.o
  CC      kernel/trace/trace_dynevent.o
  CC      net/ipv4/udp.o
  AR      drivers/base/firmware_loader/builtin/built-in.a
  AR      drivers/misc/eeprom/built-in.a
  CC      kernel/trace/trace_probe.o
  CC      arch/x86/kernel/i8253.o
  AR      drivers/misc/cb710/built-in.a
  CC      mm/init-mm.o
  AR      drivers/misc/ti-st/built-in.a
  CC      mm/memblock.o
  AR      drivers/misc/lis3lv02d/built-in.a
  CC      crypto/algif_skcipher.o
  CC      mm/memory_hotplug.o
  CC      net/ipv6/inet6_connection_sock.o
  CC [M]  drivers/misc/mei/pxp/mei_pxp.o
  CC [M]  drivers/misc/mei/hdcp/mei_hdcp.o
  CC [M]  net/bluetooth/lib.o
  CC      drivers/acpi/acpica/hwsleep.o
  CC      net/ipv4/udplite.o
  CC      net/sunrpc/auth_null.o
  CC      drivers/acpi/acpica/hwvalid.o
  AR      drivers/char/tpm/built-in.a
  AR      drivers/char/built-in.a
  CC      fs/ntfs/mft.o
  CC      net/ipv6/udp_offload.o
  CC [M]  net/bridge/br_netfilter_hooks.o
  CC [M]  drivers/gpu/drm/tests/drm_rect_test.o
  CC      fs/ntfs/mst.o
  CC      drivers/acpi/acpica/hwxface.o
  CC      drivers/tty/serial/serial_mctrl_gpio.o
  CC      fs/nfs/unlink.o
  CC      fs/nfs/write.o
  CC      net/core/netdev-genl.o
  CC      drivers/mfd/mfd-core.o
  CC [M]  net/bridge/br_netfilter_ipv6.o
  CC      drivers/tty/tty_ldisc.o
  AR      fs/ext4/built-in.a
  AR      drivers/base/firmware_loader/built-in.a
  CC      net/core/netdev-genl-gen.o
  CC      drivers/base/regmap/regmap.o
  AR      drivers/base/test/built-in.a
  CC      drivers/base/regmap/regcache.o
  CC [M]  net/netfilter/xt_tcpudp.o
  CC [M]  net/netfilter/xt_mark.o
  CC      drivers/misc/mei/init.o
  CC      fs/lockd/procfs.o
  CC      drivers/base/regmap/regcache-rbtree.o
  CC      drivers/base/component.o
  CC      drivers/acpi/acpica/hwxfsleep.o
  CC      drivers/acpi/osi.o
  CC      drivers/acpi/osl.o
  CC      drivers/misc/mei/hbm.o
  CC      crypto/xor.o
  CC      drivers/mfd/intel-lpss.o
  CC      net/sunrpc/auth_tls.o
  CC      fs/ntfs/namei.o
  CC      drivers/acpi/utils.o
  CC      net/ipv4/udp_offload.o
  AR      net/bridge/built-in.a
  AR      drivers/gpu/drm/mxsfb/built-in.a
  CC      fs/ntfs/runlist.o
  AR      drivers/gpu/drm/tiny/built-in.a
  CC      crypto/hash_info.o
  AR      drivers/block/built-in.a
  CC      drivers/misc/mei/interrupt.o
  CC      drivers/acpi/acpica/hwpci.o
  CC      arch/x86/kernel/hw_breakpoint.o
  CC [M]  net/netfilter/xt_nat.o
  CC      arch/x86/kernel/tsc.o
  AR      drivers/gpu/drm/xlnx/built-in.a
  CC      net/sunrpc/auth_unix.o
  CC      fs/btrfs/file-item.o
  AR      drivers/tty/serial/built-in.a
  CC      mm/slub.o
  CC      net/ipv6/seg6.o
  CC      crypto/simd.o
  CC      kernel/trace/trace_uprobe.o
  CC      net/ipv4/arp.o
  CC [M]  net/netfilter/xt_REDIRECT.o
  CC      drivers/tty/tty_buffer.o
  CC      drivers/base/regmap/regcache-flat.o
  CC [M]  crypto/md4.o
  AR      fs/lockd/built-in.a
  CC      drivers/base/regmap/regcache-maple.o
  LD [M]  drivers/gpu/drm/display/drm_display_helper.o
  CC [M]  net/netfilter/xt_MASQUERADE.o
  CC      drivers/base/power/wakeup.o
  CC [M]  net/netfilter/xt_addrtype.o
  AR      drivers/gpu/drm/gud/built-in.a
  CC      drivers/misc/mei/client.o
  AR      drivers/gpu/drm/solomon/built-in.a
  CC      drivers/acpi/reboot.o
  CC [M]  drivers/gpu/drm/ttm/ttm_tt.o
  CC      net/sunrpc/svc.o
  CC      drivers/acpi/acpica/nsaccess.o
  CC [M]  drivers/gpu/drm/ttm/ttm_bo.o
  CC      drivers/base/power/wakeup_stats.o
  CC      drivers/mfd/intel-lpss-pci.o
  CC      drivers/tty/tty_port.o
  CC      drivers/base/power/clock_ops.o
  CC      fs/ntfs/super.o
  CC      net/core/gso.o
  CC      drivers/misc/mei/main.o
  CC      drivers/misc/mei/dma-ring.o
  CC      drivers/misc/mei/bus.o
  CC      net/core/net-sysfs.o
  CC      drivers/mfd/intel-lpss-acpi.o
  CC      mm/madvise.o
  CC      net/sunrpc/svcsock.o
  CC      drivers/base/regmap/regmap-debugfs.o
  CC      drivers/acpi/acpica/nsalloc.o
  CC      drivers/base/regmap/regmap-i2c.o
  CC      drivers/misc/mei/bus-fixup.o
  CC      net/core/page_pool.o
  CC [M]  crypto/ccm.o
  CC      drivers/tty/tty_mutex.o
  CC      fs/ntfs/sysctl.o
  CC      drivers/base/regmap/regmap-irq.o
  CC      drivers/acpi/nvs.o
  CC [M]  crypto/arc4.o
  CC      drivers/acpi/acpica/nsarguments.o
  CC      net/sunrpc/svcauth.o
  CC      drivers/mfd/intel_soc_pmic_crc.o
  LD [M]  net/bridge/br_netfilter.o
  CC [M]  drivers/mfd/lpc_sch.o
  CC      arch/x86/kernel/tsc_msr.o
  CC [M]  net/bluetooth/ecdh_helper.o
  CC      net/ipv6/fib6_notifier.o
  CC      drivers/tty/tty_ldsem.o
  CC      drivers/misc/mei/debugfs.o
  CC      drivers/base/core.o
  CC      arch/x86/kernel/io_delay.o
  CC      drivers/acpi/wakeup.o
  CC      net/ipv6/rpl.o
  CC [M]  drivers/gpu/drm/scheduler/sched_main.o
  CC [M]  net/netfilter/xt_conntrack.o
  CC      drivers/acpi/sleep.o
  CC [M]  drivers/gpu/drm/ttm/ttm_bo_util.o
  CC      drivers/acpi/acpica/nsconvert.o
  CC [M]  drivers/gpu/drm/scheduler/sched_fence.o
  AR      drivers/base/power/built-in.a
  CC      drivers/base/bus.o
  CC      arch/x86/kernel/rtc.o
  AR      drivers/nfc/built-in.a
  CC      mm/page_io.o
  CC      drivers/misc/mei/mei-trace.o
  CC      fs/btrfs/inode-item.o
  CC      net/ipv6/ioam6.o
  CC [M]  drivers/gpu/drm/ttm/ttm_bo_vm.o
  CC [M]  drivers/gpu/drm/scheduler/sched_entity.o
  CC      drivers/misc/mei/pci-me.o
  CC      mm/swap_state.o
  CC      fs/nfs/namespace.o
  CC      arch/x86/kernel/resource.o
  CC      net/ipv4/icmp.o
  AS      arch/x86/kernel/irqflags.o
  CC      net/ipv4/devinet.o
  CC      arch/x86/kernel/static_call.o
  CC [M]  net/bluetooth/hci_request.o
  CC [M]  drivers/gpu/drm/ttm/ttm_module.o
  CC      arch/x86/kernel/process.o
  CC      fs/ntfs/unistr.o
  CC      drivers/misc/mei/hw-me.o
  CC [M]  drivers/mfd/lpc_ich.o
  CC [M]  crypto/ecc.o
  CC      drivers/acpi/acpica/nsdump.o
  CC      fs/btrfs/disk-io.o
  AR      drivers/base/regmap/built-in.a
  CC      kernel/trace/rethook.o
  AR      drivers/dax/hmem/built-in.a
  CC      drivers/dax/super.o
  CC      arch/x86/kernel/ptrace.o
  CC      net/core/page_pool_user.o
  CC      drivers/dax/bus.o
  CC      drivers/tty/tty_baudrate.o
  CC      drivers/acpi/device_sysfs.o
  CC      drivers/acpi/device_pm.o
  CC      net/ipv6/sysctl_net_ipv6.o
  CC      fs/nfs/mount_clnt.o
  CC      drivers/acpi/acpica/nseval.o
  CC      net/sunrpc/svcauth_unix.o
  CC      net/sunrpc/addr.o
  CC [M]  net/bluetooth/mgmt_util.o
  CC      drivers/tty/tty_jobctrl.o
  AR      drivers/mfd/built-in.a
  CC [M]  drivers/gpu/drm/ttm/ttm_execbuf_util.o
  CC      lib/memcat_p.o
  CC      arch/x86/kernel/tls.o
  CC      mm/swapfile.o
  CC      drivers/base/dd.o
  CC      net/sunrpc/rpcb_clnt.o
  CC [M]  drivers/gpu/drm/ttm/ttm_range_manager.o
  CC [M]  drivers/misc/mei/gsc-me.o
  CC      drivers/tty/n_null.o
  CC      mm/swap_slots.o
  CC [M]  net/netfilter/xt_ipvs.o
  CC [M]  net/bluetooth/mgmt_config.o
  CC      fs/ntfs/upcase.o
  CC      net/sunrpc/timer.o
  CC [M]  drivers/gpu/drm/ttm/ttm_resource.o
  CC      drivers/acpi/acpica/nsinit.o
  AR      kernel/trace/built-in.a
  CC      kernel/sys.o
  CC [M]  drivers/gpu/drm/ttm/ttm_pool.o
  CC      drivers/tty/pty.o
  LD [M]  drivers/gpu/drm/scheduler/gpu-sched.o
  CC      lib/nmi_backtrace.o
  CC      arch/x86/kernel/step.o
  CC [M]  drivers/gpu/drm/ttm/ttm_device.o
  CC      fs/btrfs/transaction.o
  CC      net/core/net-procfs.o
  CC      fs/nfs/nfstrace.o
  CC      mm/dmapool.o
  CC      drivers/acpi/acpica/nsload.o
  AR      drivers/dax/built-in.a
  CC      drivers/acpi/acpica/nsnames.o
  CC [M]  drivers/gpu/drm/ttm/ttm_sys_manager.o
  CC      drivers/acpi/proc.o
  CC      net/core/netpoll.o
  CC [M]  crypto/essiv.o
  CC      lib/objpool.o
  CC      net/ipv6/xfrm6_policy.o
  CC [M]  crypto/ecdh.o
  CC      drivers/acpi/bus.o
  CC [M]  drivers/gpu/drm/ttm/ttm_agp_backend.o
  CC      arch/x86/kernel/i8237.o
  CC      net/ipv4/af_inet.o
  AR      fs/ntfs/built-in.a
  CC      net/ipv6/xfrm6_state.o
  CC      arch/x86/kernel/stacktrace.o
  CC      drivers/base/syscore.o
  CC      net/core/fib_rules.o
  CC      drivers/acpi/glue.o
  CC [M]  net/bluetooth/hci_codec.o
  CC [M]  crypto/ecdh_helper.o
  CC      lib/plist.o
  LD [M]  drivers/misc/mei/mei-gsc.o
  CC      drivers/dma-buf/dma-buf.o
  AR      drivers/cxl/core/built-in.a
  AR      drivers/misc/mei/built-in.a
  AR      drivers/cxl/built-in.a
  CC      lib/radix-tree.o
  CC      lib/ratelimit.o
  CC      drivers/dma-buf/dma-fence.o
  CC      net/sunrpc/xdr.o
  AR      drivers/misc/cardreader/built-in.a
  AR      drivers/misc/built-in.a
  CC      drivers/dma-buf/dma-fence-array.o
  CC      drivers/acpi/scan.o
  CC      drivers/acpi/acpica/nsobject.o
  CC      net/sunrpc/sunrpc_syms.o
  AR      drivers/macintosh/built-in.a
  CC      mm/hugetlb.o
  CC      net/sunrpc/cache.o
  CC      drivers/tty/sysrq.o
  CC      drivers/dma-buf/dma-fence-chain.o
  CC      drivers/scsi/scsi.o
  CC      drivers/scsi/hosts.o
  CC      lib/rbtree.o
  CC      drivers/scsi/scsi_ioctl.o
  CC      drivers/dma-buf/dma-fence-unwrap.o
  CC      lib/seq_buf.o
  CC      drivers/base/driver.o
  AR      drivers/nvme/common/built-in.a
  CC      lib/siphash.o
  CC      drivers/nvme/host/core.o
  AR      drivers/nvme/target/built-in.a
  CC      drivers/nvme/host/ioctl.o
  CC      fs/efivarfs/inode.o
  CC      net/core/net-traces.o
  LD [M]  net/netfilter/nf_conntrack.o
  LD [M]  net/netfilter/nf_nat.o
  CC      fs/efivarfs/file.o
  LD [M]  drivers/gpu/drm/ttm/ttm.o
  AR      net/netfilter/built-in.a
  CC      fs/efivarfs/super.o
  CC      drivers/acpi/acpica/nsparse.o
  CC      arch/x86/kernel/reboot.o
  CC      fs/efivarfs/vars.o
  LD [M]  crypto/ecdh_generic.o
  AR      crypto/built-in.a
  CC      lib/string.o
  CC      mm/hugetlb_vmemmap.o
  CC      drivers/base/class.o
  CC      drivers/dma-buf/dma-resv.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o
  CC [M]  fs/netfs/buffered_read.o
  CC      drivers/acpi/mipi-disco-img.o
  CC      lib/timerqueue.o
  CC [M]  fs/smb/common/cifs_arc4.o
  CC [M]  fs/fuse/dev.o
  CC      lib/vsprintf.o
  CC      lib/win_minmax.o
  CC [M]  fs/smb/client/trace.o
  CC [M]  fs/fuse/dir.o
  CC [M]  fs/smb/client/cifsfs.o
  CC      drivers/acpi/acpica/nspredef.o
  CC [M]  fs/smb/client/cifs_debug.o
  CC [M]  fs/fuse/file.o
  CC      lib/xarray.o
  CC [M]  net/bluetooth/eir.o
  CC      net/ipv6/xfrm6_input.o
  CC      net/ipv6/xfrm6_output.o
  CC      drivers/base/platform.o
  CC      drivers/dma-buf/sync_file.o
  CC [M]  net/bluetooth/hci_sync.o
  CC      drivers/acpi/acpica/nsprepkg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_device.o
  CC [M]  fs/netfs/buffered_write.o
  AR      drivers/tty/built-in.a
  CC      drivers/acpi/resource.o
  CC      drivers/ata/libata-core.o
  CC [M]  fs/overlayfs/super.o
  CC      drivers/ata/libata-scsi.o
  AR      fs/efivarfs/built-in.a
  CC [M]  fs/overlayfs/namei.o
  CC [M]  drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.o
  CC [M]  fs/overlayfs/util.o
  CC [M]  fs/smb/common/cifs_md4.o
  CC      fs/open.o
  CC      net/sunrpc/rpc_pipe.o
  CC      arch/x86/kernel/msr.o
  CC      drivers/base/cpu.o
  CC      mm/mempolicy.o
  CC      lib/lockref.o
  CC      drivers/scsi/scsicam.o
  CC      drivers/acpi/acpi_processor.o
  CC      drivers/acpi/processor_core.o
  CC      fs/btrfs/inode.o
  CC      drivers/acpi/acpica/nsrepair.o
  CC      fs/btrfs/file.o
  CC      kernel/umh.o
  CC      drivers/scsi/scsi_error.o
  CC      mm/sparse.o
  CC      lib/bcd.o
  CC      drivers/dma-buf/sw_sync.o
  CC      lib/sort.o
  CC [M]  fs/smb/client/connect.o
  CC      lib/parser.o
  LD [M]  drivers/gpu/drm/amd/amdxcp/amdxcp.o
  CC      net/ipv4/igmp.o
  CC      lib/debug_locks.o
  CC      lib/random32.o
  CC      drivers/acpi/acpica/nsrepair2.o
  CC      fs/read_write.o
  CC      drivers/base/firmware.o
  CC      drivers/scsi/scsi_lib.o
  CC [M]  drivers/gpu/drm/i915/i915_config.o
  CC      fs/file_table.o
  CC      arch/x86/kernel/cpuid.o
  CC      drivers/acpi/processor_pdc.o
  CC [M]  net/bluetooth/coredump.o
  CC [M]  fs/smb/client/dir.o
  CC      kernel/workqueue.o
  CC      arch/x86/kernel/early-quirks.o
  CC [M]  net/bluetooth/sco.o
  CC      net/ipv6/xfrm6_protocol.o
  CC      lib/bust_spinlocks.o
  CC      lib/kasprintf.o
  CC      drivers/base/init.o
  CC      drivers/scsi/scsi_lib_dma.o
  CC      drivers/acpi/acpica/nssearch.o
  CC      drivers/acpi/acpica/nsutils.o
  CC      drivers/acpi/acpica/nswalk.o
  CC      net/ipv4/fib_frontend.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_bo_test.o
  CC [M]  drivers/gpu/drm/i915/i915_driver.o
  CC [M]  fs/overlayfs/inode.o
  CC      drivers/acpi/acpica/nsxfeval.o
  CC      net/sunrpc/sysfs.o
  CC      drivers/base/map.o
  CC      drivers/dma-buf/sync_debug.o
  CC      mm/sparse-vmemmap.o
  CC      lib/bitmap.o
  CC [M]  fs/netfs/direct_read.o
  CC      arch/x86/kernel/smp.o
  CC      drivers/acpi/acpica/nsxfname.o
  CC      drivers/acpi/acpica/nsxfobj.o
  CC [M]  fs/netfs/direct_write.o
  CC      fs/super.o
  CC      net/ipv6/netfilter.o
  CC      drivers/acpi/acpica/psargs.o
  CC      drivers/acpi/acpica/psloop.o
  CC      kernel/pid.o
  CC      lib/scatterlist.o
  CC      lib/list_sort.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_dma_buf_test.o
  CC [M]  fs/fuse/inode.o
  CC [M]  fs/netfs/io.o
  CC      net/ipv6/fib6_rules.o
  CC      fs/nfs/export.o
  CC      net/ipv6/proc.o
  CC      drivers/base/devres.o
  CC      drivers/nvme/host/sysfs.o
  CC      drivers/ata/libata-eh.o
  CC      drivers/ata/libata-transport.o
  CC      drivers/nvme/host/pr.o
  CC      drivers/nvme/host/trace.o
  CC      drivers/ata/libata-trace.o
  CC [M]  drivers/dma-buf/selftest.o
  CC      net/sunrpc/svc_xprt.o
  CC [M]  net/bluetooth/iso.o
  CC      fs/char_dev.o
  CC      mm/mmu_notifier.o
  CC      drivers/acpi/acpica/psobject.o
  CC [M]  fs/overlayfs/file.o
  CC      mm/ksm.o
  CC [M]  fs/netfs/iterator.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_migrate_test.o
  CC      mm/migrate.o
  CC      net/ipv6/syncookies.o
  CC      mm/memory-tiers.o
  CC      fs/stat.o
  CC [M]  fs/netfs/locking.o
  CC      mm/migrate_device.o
  CC      net/ipv4/fib_semantics.o
  CC [M]  drivers/dma-buf/st-dma-fence.o
  CC      drivers/acpi/acpica/psopcode.o
  CC [M]  net/bluetooth/a2mp.o
  CC      drivers/scsi/scsi_scan.o
  CC      arch/x86/kernel/smpboot.o
  CC      net/ipv4/fib_trie.o
  CC      drivers/base/attribute_container.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_mocs_test.o
  CC      lib/uuid.o
  CC      net/core/selftests.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.o
  CC      drivers/nvme/host/fault_inject.o
  CC [M]  net/bluetooth/amp.o
  CC [M]  fs/netfs/main.o
  CC      lib/iov_iter.o
  CC [M]  fs/smb/client/file.o
  CC [M]  fs/overlayfs/dir.o
  CC [M]  drivers/gpu/drm/i915/i915_drm_client.o
  CC      drivers/acpi/acpica/psopinfo.o
  CC [M]  fs/smb/client/inode.o
  CC [M]  drivers/gpu/drm/i915/i915_getparam.o
  CC      drivers/nvme/host/pci.o
  CC [M]  fs/smb/client/link.o
  CC      net/ipv6/mip6.o
  CC [M]  fs/netfs/misc.o
  CC      fs/exec.o
  CC      net/ipv6/addrconf_core.o
  CC [M]  net/bluetooth/hci_debugfs.o
  CC [M]  fs/fuse/control.o
  CC [M]  drivers/dma-buf/st-dma-fence-chain.o
  CC      drivers/acpi/acpica/psparse.o
  CC      drivers/acpi/acpica/psscope.o
  CC [M]  drivers/gpu/drm/i915/i915_ioctl.o
  CC      arch/x86/kernel/tsc_sync.o
  CC      fs/nfs/sysfs.o
  CC      drivers/acpi/ec.o
  CC      arch/x86/kernel/setup_percpu.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_test_mod.o
  CC      mm/huge_memory.o
  CC [M]  drivers/dma-buf/st-dma-fence-unwrap.o
  CC      drivers/base/transport_class.o
  CC      fs/pipe.o
  CC      drivers/acpi/acpica/pstree.o
  CC      net/ipv6/exthdrs_core.o
  CC      fs/namei.o
  CC      arch/x86/kernel/ftrace.o
  AS      arch/x86/kernel/ftrace_64.o
  CC [M]  fs/smb/client/misc.o
  CC      arch/x86/kernel/trace_clock.o
  CC [M]  fs/netfs/objects.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_pci_test.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.o
  CC      arch/x86/kernel/trace.o
  CC [M]  fs/fuse/xattr.o
  CC [M]  drivers/gpu/drm/i915/i915_irq.o
  GEN     drivers/scsi/scsi_devinfo_tbl.c
  CC      drivers/scsi/scsi_devinfo.o
  CC [M]  fs/fuse/acl.o
  CC [M]  fs/fuse/readdir.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.o
  CC [M]  fs/fuse/ioctl.o
  CC      drivers/base/topology.o
  CC      drivers/acpi/acpica/psutils.o
  CC      mm/khugepaged.o
  CC      kernel/task_work.o
  CC [M]  fs/overlayfs/readdir.o
  CC      drivers/scsi/scsi_sysctl.o
  CC [M]  drivers/dma-buf/st-dma-resv.o
  CC [M]  fs/netfs/output.o
  CC [M]  fs/overlayfs/copy_up.o
  CC [M]  drivers/gpu/drm/i915/i915_mitigations.o
  CC      net/ipv4/fib_notifier.o
  CC      drivers/base/container.o
  CC      net/core/ptp_classifier.o
  CC      net/sunrpc/xprtmultipath.o
  CC      net/ipv6/ip6_checksum.o
  CC      net/sunrpc/stats.o
  CC      drivers/spi/spi.o
  CC      drivers/ata/libata-sata.o
  CC      fs/nfs/fs_context.o
  CC      drivers/acpi/acpica/pswalk.o
  CC      arch/x86/kernel/rethook.o
  CC [M]  drivers/gpu/drm/i915/i915_module.o
  AR      drivers/dma-buf/built-in.a
  CC [M]  drivers/gpu/drm/xe/tests/xe_rtp_test.o
  LD [M]  drivers/dma-buf/dmabuf_selftests.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/atombios_crtc.o
  CC [M]  drivers/net/phy/aquantia/aquantia_main.o
  CC      arch/x86/kernel/crash_core_64.o
  CC [M]  drivers/net/phy/aquantia/aquantia_firmware.o
  CC      drivers/base/property.o
  CC [M]  drivers/net/phy/aquantia/aquantia_hwmon.o
  CC      fs/nfs/sysctl.o
  AR      drivers/net/pse-pd/built-in.a
  CC      drivers/net/mdio/acpi_mdio.o
  LD [M]  net/bluetooth/bluetooth.o
  AR      drivers/net/pcs/built-in.a
  CC      drivers/net/mdio/fwnode_mdio.o
  CC      arch/x86/kernel/module.o
  CC      net/ipv6/ip6_icmp.o
  CC      drivers/acpi/acpica/psxface.o
  CC      drivers/scsi/scsi_debugfs.o
  CC      kernel/extable.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_wa_test.o
  CC      drivers/net/phy/mdio-boardinfo.o
  CC      net/sunrpc/sysctl.o
  CC [M]  drivers/gpu/drm/i915/i915_params.o
  LD [M]  fs/fuse/fuse.o
  CC      lib/clz_ctz.o
  CC      fs/fcntl.o
  LD [M]  fs/netfs/netfs.o
  CC      lib/bsearch.o
  CC      arch/x86/kernel/early_printk.o
  AR      drivers/firewire/built-in.a
  AR      drivers/nvme/host/built-in.a
  CC      fs/ioctl.o
  CC [M]  drivers/gpu/drm/i915/i915_pci.o
  CC      drivers/scsi/scsi_trace.o
  AR      drivers/nvme/built-in.a
  CC      kernel/params.o
  CC      kernel/kthread.o
  CC      fs/nfs/nfs2super.o
  CC      drivers/acpi/acpica/rsaddr.o
  CC      kernel/sys_ni.o
  CC      net/ipv4/inet_fragment.o
  CC [M]  fs/overlayfs/export.o
  CC      net/core/netprio_cgroup.o
  CC      net/ipv6/output_core.o
  CC [M]  fs/smb/client/netmisc.o
  CC [M]  drivers/gpu/drm/i915/i915_scatterlist.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/atom.o
  CC      arch/x86/kernel/hpet.o
  CC      fs/btrfs/defrag.o
  CC      net/ipv6/protocol.o
  CC      net/ipv6/ip6_offload.o
  CC      net/core/dst_cache.o
  CC      net/ipv6/tcpv6_offload.o
  AR      drivers/net/mdio/built-in.a
  LD [M]  drivers/net/phy/aquantia/aquantia.o
  CC [M]  drivers/gpu/drm/i915/i915_suspend.o
  CC      net/core/gro_cells.o
  CC      fs/readdir.o
  CC      drivers/acpi/acpica/rscalc.o
  CC      drivers/net/phy/stubs.o
  CC      drivers/ata/libata-sff.o
  CC [M]  drivers/gpu/drm/vgem/vgem_drv.o
  CC [M]  fs/smb/client/smbencrypt.o
  CC      drivers/ata/libata-pmp.o
  CC [M]  drivers/gpu/drm/vgem/vgem_fence.o
  LD [M]  drivers/gpu/drm/xe/tests/xe_test.o
  CC [M]  drivers/gpu/drm/xe/xe_bb.o
  CC      drivers/ata/libata-acpi.o
  CC      lib/find_bit.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.o
  CC      mm/page_counter.o
  CC [M]  fs/smb/client/transport.o
  AR      net/sunrpc/built-in.a
  CC      drivers/base/cacheinfo.o
  CC      drivers/base/swnode.o
  CC      net/ipv6/exthdrs_offload.o
  CC      net/ipv4/ping.o
  CC      net/ipv4/ip_tunnel_core.o
  CC      drivers/scsi/scsi_logging.o
  CC      lib/llist.o
  CC      drivers/acpi/acpica/rscreate.o
  CC [M]  fs/overlayfs/params.o
  CC      lib/lwq.o
  CC      mm/memcontrol.o
  AR      drivers/cdrom/built-in.a
  CC      fs/select.o
  CC      drivers/base/auxiliary.o
  CC      fs/nfs/proc.o
  CC      kernel/nsproxy.o
  CC      fs/nfs/nfs2xdr.o
  CC      kernel/notifier.o
  CC      kernel/ksysfs.o
  CC      lib/memweight.o
  LD [M]  drivers/gpu/drm/vgem/vgem.o
  CC      drivers/net/phy/mdio_devres.o
  CC      lib/kfifo.o
  CC      fs/dcache.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/object.o
  CC      drivers/acpi/acpica/rsdumpinfo.o
  CC      fs/inode.o
  CC      drivers/acpi/acpica/rsinfo.o
  CC      drivers/acpi/acpica/rsio.o
  CC      lib/percpu-refcount.o
  CC [M]  drivers/gpu/drm/xe/xe_bo.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/client.o
  CC      arch/x86/kernel/amd_nb.o
  CC      drivers/acpi/acpica/rsirq.o
  CC [M]  drivers/gpu/drm/ast/ast_drv.o
  CC      drivers/net/phy/phy.o
  AR      net/core/built-in.a
  CC [M]  drivers/gpu/drm/i915/i915_switcheroo.o
  CC [M]  drivers/gpu/drm/xe/xe_bo_evict.o
  CC      kernel/cred.o
  AR      drivers/auxdisplay/built-in.a
  CC      drivers/ata/libata-pata-timings.o
  CC      drivers/usb/common/common.o
  CC      drivers/base/devtmpfs.o
  CC      drivers/usb/common/debug.o
  CC [M]  fs/smb/client/cached_dir.o
  CC      drivers/acpi/acpica/rslist.o
  CC      drivers/net/phy/phy-c45.o
  CC      drivers/scsi/scsi_pm.o
  CC      drivers/usb/core/usb.o
  CC      net/ipv4/gre_offload.o
  CC      net/ipv4/metrics.o
  CC      drivers/usb/core/hub.o
  CC      net/ipv4/netlink.o
  CC      arch/x86/kernel/kvm.o
  CC      net/ipv6/inet6_hashtables.o
  CC [M]  fs/smb/client/cifs_unicode.o
  CC      drivers/base/node.o
  CC [M]  fs/smb/client/nterr.o
  CC [M]  fs/overlayfs/xattrs.o
  AR      drivers/spi/built-in.a
  CC      drivers/input/serio/serio.o
  CC      drivers/input/keyboard/atkbd.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.o
  CC      drivers/acpi/acpica/rsmemory.o
  CC      drivers/rtc/lib.o
  CC      drivers/rtc/class.o
  CC      lib/rhashtable.o
  AR      drivers/i2c/algos/built-in.a
  CC [M]  drivers/i2c/algos/i2c-algo-bit.o
  CC      fs/btrfs/extent_map.o
  AR      drivers/i3c/built-in.a
  AR      drivers/media/i2c/built-in.a
  CC      drivers/acpi/acpica/rsmisc.o
  AR      drivers/media/tuners/built-in.a
  AR      drivers/media/rc/keymaps/built-in.a
  AR      drivers/media/rc/built-in.a
  AR      drivers/media/common/b2c2/built-in.a
  CC      net/ipv4/nexthop.o
  AR      drivers/media/common/saa7146/built-in.a
  AR      drivers/media/common/siano/built-in.a
  CC      net/ipv4/udp_tunnel_stub.o
  CC      drivers/acpi/acpica/rsserial.o
  CC      arch/x86/kernel/kvmclock.o
  AR      drivers/media/common/v4l2-tpg/built-in.a
  AR      drivers/media/common/videobuf2/built-in.a
  AR      drivers/media/common/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvif/conn.o
  CC      lib/base64.o
  AR      drivers/media/platform/allegro-dvt/built-in.a
  AR      drivers/media/platform/amlogic/meson-ge2d/built-in.a
  CC      lib/once.o
  AR      drivers/media/platform/amlogic/built-in.a
  CC [M]  fs/smb/client/cifsencrypt.o
  AR      drivers/usb/common/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_object.o
  CC [M]  drivers/gpu/drm/ast/ast_i2c.o
  CC      drivers/usb/core/hcd.o
  AR      drivers/media/platform/amphion/built-in.a
  AR      drivers/media/platform/aspeed/built-in.a
  CC      drivers/usb/core/urb.o
  CC      lib/refcount.o
  AR      drivers/media/platform/atmel/built-in.a
  CC      drivers/ata/ahci.o
  AR      drivers/media/platform/cadence/built-in.a
  AR      drivers/media/platform/chips-media/coda/built-in.a
  CC      drivers/scsi/scsi_bsg.o
  LD [M]  fs/overlayfs/overlay.o
  AR      drivers/media/platform/chips-media/wave5/built-in.a
  AR      drivers/media/platform/chips-media/built-in.a
  CC      kernel/reboot.o
  CC      lib/rcuref.o
  CC      fs/attr.o
  CC      drivers/i2c/busses/i2c-designware-common.o
  AR      drivers/media/platform/intel/built-in.a
  AR      drivers/media/platform/marvell/built-in.a
  AR      drivers/media/platform/mediatek/jpeg/built-in.a
  AR      drivers/media/platform/mediatek/mdp/built-in.a
  CC [M]  drivers/gpu/drm/i915/i915_sysfs.o
  AR      drivers/media/platform/microchip/built-in.a
  AR      drivers/media/platform/mediatek/vcodec/common/built-in.a
  CC      drivers/acpi/acpica/rsutils.o
  CC      fs/nfs/nfs3super.o
  AR      drivers/media/platform/mediatek/vcodec/encoder/built-in.a
  CC      lib/usercopy.o
  AR      drivers/media/platform/mediatek/vcodec/decoder/built-in.a
  AR      drivers/input/mouse/built-in.a
  AR      drivers/media/platform/mediatek/vcodec/built-in.a
  CC      drivers/input/serio/i8042.o
  CC      lib/errseq.o
  AR      drivers/media/platform/mediatek/vpu/built-in.a
  AR      drivers/media/pci/ttpci/built-in.a
  CC      drivers/base/memory.o
  CC      fs/bad_inode.o
  AR      drivers/media/platform/mediatek/mdp3/built-in.a
  AR      drivers/media/pci/b2c2/built-in.a
  AR      drivers/media/platform/mediatek/built-in.a
  CC      drivers/rtc/interface.o
  AR      drivers/media/pci/pluto2/built-in.a
  AR      drivers/media/pci/dm1105/built-in.a
  AR      drivers/media/pci/pt1/built-in.a
  CC      drivers/usb/core/message.o
  AR      drivers/media/platform/nuvoton/built-in.a
  CC      drivers/usb/core/driver.o
  AR      drivers/media/pci/pt3/built-in.a
  CC      drivers/rtc/nvmem.o
  AR      drivers/media/platform/nvidia/tegra-vde/built-in.a
  AR      drivers/media/pci/mantis/built-in.a
  AR      drivers/media/platform/nvidia/built-in.a
  CC      drivers/rtc/dev.o
  AR      drivers/media/pci/ngene/built-in.a
  AR      drivers/media/platform/nxp/dw100/built-in.a
  AR      drivers/media/pci/ddbridge/built-in.a
  AR      drivers/media/platform/nxp/imx-jpeg/built-in.a
  CC      net/ipv4/sysctl_net_ipv4.o
  AR      drivers/media/pci/saa7146/built-in.a
  AR      drivers/media/usb/b2c2/built-in.a
  AR      drivers/media/platform/nxp/imx8-isi/built-in.a
  AR      drivers/media/platform/nxp/built-in.a
  AR      drivers/media/pci/smipcie/built-in.a
  AR      drivers/media/usb/dvb-usb/built-in.a
  AR      drivers/media/pci/netup_unidvb/built-in.a
  AR      drivers/media/usb/dvb-usb-v2/built-in.a
  AR      drivers/media/platform/qcom/camss/built-in.a
  AR      drivers/media/platform/renesas/rcar-vin/built-in.a
  CC      drivers/input/input.o
  AR      drivers/media/platform/renesas/rzg2l-cru/built-in.a
  AR      drivers/media/pci/intel/ipu3/built-in.a
  AR      drivers/media/usb/s2255/built-in.a
  CC      drivers/net/phy/phy-core.o
  AR      drivers/media/platform/qcom/venus/built-in.a
  AR      drivers/media/pci/intel/ivsc/built-in.a
  CC [M]  drivers/gpu/drm/i915/i915_utils.o
  CC      drivers/acpi/acpica/rsxface.o
  AR      drivers/media/pci/intel/built-in.a
  AR      drivers/media/platform/qcom/built-in.a
  AR      drivers/media/usb/siano/built-in.a
  AR      drivers/media/platform/renesas/vsp1/built-in.a
  AR      drivers/media/pci/built-in.a
  AR      drivers/media/platform/renesas/built-in.a
  AR      drivers/media/usb/ttusb-budget/built-in.a
  CC      fs/file.o
  AR      drivers/input/keyboard/built-in.a
  AR      drivers/media/usb/ttusb-dec/built-in.a
  CC      drivers/net/phy/phy_device.o
  CC      drivers/net/phy/linkmode.o
  AR      drivers/media/usb/built-in.a
  AR      drivers/media/platform/rockchip/rga/built-in.a
  CC      net/ipv6/mcast_snoop.o
  AR      drivers/media/platform/rockchip/rkisp1/built-in.a
  CC      drivers/acpi/acpica/tbdata.o
  AR      drivers/media/platform/rockchip/built-in.a
  CC      drivers/gpu/drm/drm_mipi_dsi.o
  AR      drivers/media/platform/samsung/exynos-gsc/built-in.a
  CC      drivers/input/input-compat.o
  AR      drivers/media/platform/samsung/exynos4-is/built-in.a
  AR      drivers/media/platform/samsung/s3c-camif/built-in.a
  CC      fs/filesystems.o
  CC      drivers/acpi/acpica/tbfadt.o
  AR      drivers/media/platform/samsung/s5p-g2d/built-in.a
  AR      drivers/media/platform/samsung/s5p-jpeg/built-in.a
  AR      drivers/media/platform/samsung/s5p-mfc/built-in.a
  AR      drivers/media/platform/samsung/built-in.a
  CC [M]  fs/smb/client/readdir.o
  CC      drivers/base/module.o
  CC      arch/x86/kernel/paravirt.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/device.o
  AR      drivers/media/platform/st/sti/bdisp/built-in.a
  AR      drivers/media/platform/st/sti/c8sectpfe/built-in.a
  CC      arch/x86/kernel/pvclock.o
  AR      drivers/media/platform/st/sti/delta/built-in.a
  CC      drivers/scsi/scsi_common.o
  AR      drivers/media/platform/st/sti/hva/built-in.a
  AR      drivers/media/platform/st/stm32/built-in.a
  CC [M]  drivers/gpu/drm/ast/ast_main.o
  CC      fs/namespace.o
  AR      drivers/media/platform/st/built-in.a
  CC [M]  drivers/gpu/drm/ast/ast_mm.o
  CC      fs/seq_file.o
  CC      drivers/ata/libahci.o
  AR      drivers/media/platform/sunxi/sun4i-csi/built-in.a
  CC      lib/bucket_locks.o
  AR      drivers/media/platform/sunxi/sun6i-csi/built-in.a
  CC      drivers/ata/ata_piix.o
  CC      drivers/rtc/proc.o
  AR      drivers/media/platform/sunxi/sun6i-mipi-csi2/built-in.a
  AR      drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/built-in.a
  AR      drivers/media/platform/sunxi/sun8i-di/built-in.a
  AR      drivers/media/platform/sunxi/sun8i-rotate/built-in.a
  AR      drivers/media/platform/sunxi/built-in.a
  CC      fs/btrfs/sysfs.o
  AR      drivers/media/platform/ti/am437x/built-in.a
  AR      drivers/media/platform/ti/cal/built-in.a
  CC      drivers/i2c/busses/i2c-designware-master.o
  CC      fs/btrfs/accessors.o
  AR      drivers/media/platform/ti/vpe/built-in.a
  CC      lib/generic-radix-tree.o
  CC      drivers/acpi/acpica/tbfind.o
  AR      drivers/media/platform/ti/davinci/built-in.a
  CC      kernel/async.o
  AR      drivers/media/platform/ti/j721e-csi2rx/built-in.a
  CC [M]  drivers/gpu/drm/i915/intel_clock_gating.o
  AR      drivers/media/platform/ti/omap/built-in.a
  CC [M]  drivers/gpu/drm/ast/ast_mode.o
  AR      drivers/media/platform/ti/omap3isp/built-in.a
  AR      drivers/media/platform/ti/built-in.a
  CC      kernel/range.o
  CC      drivers/base/pinctrl.o
  AR      drivers/media/platform/verisilicon/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_debugfs.o
  CC [M]  fs/smb/client/ioctl.o
  AR      drivers/media/platform/via/built-in.a
  AR      drivers/media/platform/xilinx/built-in.a
  CC      fs/nfs/nfs3client.o
  AR      drivers/media/platform/built-in.a
  AR      drivers/media/firewire/built-in.a
  AR      drivers/media/mmc/siano/built-in.a
  AR      drivers/media/mmc/built-in.a
  AR      drivers/net/ethernet/adi/built-in.a
  AR      drivers/i2c/muxes/built-in.a
  AR      drivers/media/spi/built-in.a
  AR      drivers/net/ethernet/alacritech/built-in.a
  CC [M]  drivers/i2c/muxes/i2c-mux-gpio.o
  AR      drivers/media/test-drivers/built-in.a
  AR      drivers/media/built-in.a
  AR      drivers/net/ethernet/amazon/built-in.a
  CC      drivers/scsi/sd.o
  CC      drivers/i2c/i2c-boardinfo.o
  AR      drivers/net/ethernet/aquantia/built-in.a
  CC [M]  drivers/gpu/drm/i915/intel_device_info.o
  AR      drivers/net/ethernet/asix/built-in.a
  CC [M]  drivers/gpu/drm/i915/intel_memory_region.o
  CC      drivers/usb/core/config.o
  AR      drivers/ptp/built-in.a
  AR      drivers/net/ethernet/cadence/built-in.a
  AR      drivers/power/reset/built-in.a
  CC [M]  drivers/ptp/ptp_clock.o
  CC      drivers/power/supply/power_supply_core.o
  AR      drivers/net/ethernet/broadcom/built-in.a
  CC [M]  drivers/gpu/drm/i915/intel_pcode.o
  CC [M]  drivers/net/ethernet/broadcom/b44.o
  CC      drivers/acpi/acpica/tbinstal.o
  CC      drivers/power/supply/power_supply_sysfs.o
  CC      drivers/rtc/sysfs.o
  CC      drivers/rtc/rtc-mc146818-lib.o
  CC      drivers/input/serio/libps2.o
  AR      drivers/net/ethernet/cavium/common/built-in.a
  CC      lib/bitmap-str.o
  CC [M]  fs/smb/client/sess.o
  AR      drivers/net/ethernet/cavium/thunder/built-in.a
  CC      arch/x86/kernel/pcspeaker.o
  AR      drivers/net/ethernet/cavium/liquidio/built-in.a
  AR      drivers/net/ethernet/cavium/octeon/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvif/disp.o
  AR      drivers/net/ethernet/cavium/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.o
  CC      arch/x86/kernel/check.o
  CC [M]  net/ipv6/ip6_udp_tunnel.o
  CC      drivers/power/supply/power_supply_leds.o
  CC [M]  drivers/gpu/drm/ast/ast_post.o
  CC      kernel/smpboot.o
  CC      drivers/base/devcoredump.o
  CC [M]  drivers/gpu/drm/ast/ast_dp501.o
  CC      net/ipv4/proc.o
  CC      arch/x86/kernel/uprobes.o
  CC      drivers/power/supply/power_supply_hwmon.o
  CC      drivers/acpi/acpica/tbprint.o
  CC      drivers/input/input-mt.o
  CC      drivers/usb/core/file.o
  CC      arch/x86/kernel/perf_regs.o
  CC [M]  drivers/gpu/drm/xe/xe_devcoredump.o
  CC      drivers/usb/core/buffer.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/driver.o
  CC      kernel/ucount.o
  CC      drivers/i2c/busses/i2c-designware-platdrv.o
  CC      net/ipv4/syncookies.o
  CC      drivers/usb/core/sysfs.o
  CC      drivers/input/input-poller.o
  CC      net/ipv4/esp4.o
  CC      lib/string_helpers.o
  CC      fs/btrfs/xattr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.o
  CC      drivers/acpi/acpica/tbutils.o
  AR      drivers/input/serio/built-in.a
  CC      drivers/rtc/rtc-cmos.o
  CC      drivers/input/ff-core.o
  CC      drivers/net/phy/mdio_bus.o
  CC      fs/nfs/nfs3proc.o
  CC [M]  drivers/ptp/ptp_chardev.o
  CC      drivers/i2c/i2c-core-base.o
  CC      kernel/regset.o
  CC      drivers/base/platform-msi.o
  AR      drivers/power/supply/built-in.a
  CC      drivers/acpi/dock.o
  CC      kernel/ksyms_common.o
  AR      drivers/power/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvif/event.o
  CC      kernel/groups.o
  CC [M]  fs/smb/client/export.o
  AR      drivers/ata/built-in.a
  CC      drivers/i2c/i2c-core-smbus.o
  CC      drivers/acpi/acpica/tbxface.o
  CC      net/ipv4/esp4_offload.o
  CC      kernel/vhost_task.o
  AR      drivers/usb/phy/built-in.a
  CC [M]  fs/smb/client/unc.o
  CC [M]  drivers/gpu/drm/i915/intel_region_ttm.o
  AR      drivers/net/usb/built-in.a
  CC [M]  drivers/net/usb/pegasus.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_display.o
  CC [M]  drivers/net/usb/rtl8150.o
  CC      drivers/usb/core/endpoint.o
  CC [M]  drivers/net/usb/r8152.o
  CC [M]  drivers/gpu/drm/i915/intel_runtime_pm.o
  CC [M]  drivers/net/ipvlan/ipvlan_core.o
  CC      arch/x86/kernel/tracepoint.o
  AR      net/ipv6/built-in.a
  CC [M]  drivers/gpu/drm/ast/ast_dp.o
  CC      arch/x86/kernel/itmt.o
  CC      drivers/usb/core/devio.o
  CC      drivers/input/touchscreen.o
  CC [M]  drivers/gpu/drm/xe/xe_device.o
  CC      drivers/usb/core/notify.o
  CC [M]  drivers/ptp/ptp_sysfs.o
  CC      drivers/scsi/sg.o
  CC      drivers/acpi/acpica/tbxfload.o
  CC      kernel/kcmp.o
  CC      drivers/base/physical_location.o
  CC      drivers/i2c/busses/i2c-designware-baytrail.o
  CC      lib/hexdump.o
  CC      fs/xattr.o
  CC      net/ipv4/netfilter.o
  CC      drivers/usb/core/generic.o
  CC [M]  drivers/net/ethernet/broadcom/bnx2.o
  CC      drivers/base/trace.o
  CC [M]  drivers/ptp/ptp_vclock.o
  AR      drivers/rtc/built-in.a
  CC      mm/vmpressure.o
  CC [M]  drivers/gpu/drm/xe/xe_device_sysfs.o
  CC      lib/kstrtox.o
  CC [M]  drivers/i2c/busses/i2c-scmi.o
  CC      net/ipv4/inet_diag.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/fifo.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/head.o
  CC      drivers/acpi/pci_root.o
  CC      drivers/usb/host/pci-quirks.o
  CC      drivers/acpi/acpica/tbxfroot.o
  CC      drivers/input/ff-memless.o
  CC      net/ipv4/tcp_diag.o
  CC      drivers/usb/storage/scsiglue.o
  CC      arch/x86/kernel/umip.o
  CC [M]  fs/smb/client/winucase.o
  CC      drivers/input/vivaldi-fmap.o
  CC      fs/btrfs/ordered-data.o
  CC [M]  fs/smb/client/smb2ops.o
  CC      net/ipv4/udp_diag.o
  CC      drivers/net/phy/mdio_device.o
  CC      drivers/acpi/acpica/utaddress.o
  CC [M]  drivers/ptp/ptp_kvm_x86.o
  CC [M]  drivers/ptp/ptp_kvm_common.o
  CC      fs/nfs/nfs3xdr.o
  CC      lib/debug_info.o
  LD [M]  drivers/gpu/drm/ast/ast.o
  CC      kernel/freezer.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.o
  CC      arch/x86/kernel/unwind_orc.o
  CC      net/ipv4/tcp_cubic.o
  CC      drivers/usb/serial/usb-serial.o
  CC      arch/x86/kernel/callthunks.o
  CC      drivers/usb/serial/generic.o
  CC      kernel/stacktrace.o
  CC      drivers/usb/serial/bus.o
  CC      net/ipv4/xfrm4_policy.o
  CC [M]  drivers/gpu/drm/i915/intel_sbi.o
  AR      drivers/base/built-in.a
  CC      arch/x86/kernel/cet.o
  CC      kernel/dma.o
  CC      drivers/hwmon/hwmon.o
  CC      arch/x86/kernel/mmconf-fam10h_64.o
  CC [M]  drivers/gpu/drm/i915/intel_step.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.o
  CC [M]  drivers/gpu/drm/xe/xe_dma_buf.o
  CC      drivers/acpi/acpica/utalloc.o
  CC      mm/swap_cgroup.o
  CC [M]  drivers/hwmon/acpi_power_meter.o
  CC [M]  drivers/i2c/busses/i2c-ccgx-ucsi.o
  CC [M]  drivers/net/ipvlan/ipvlan_main.o
  AR      drivers/usb/misc/built-in.a
  CC      net/ipv4/xfrm4_state.o
  CC      drivers/input/input-leds.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/mem.o
  CC      net/ipv4/xfrm4_input.o
  CC      net/ipv4/xfrm4_output.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.o
  CC      drivers/usb/host/ehci-hcd.o
  CC      drivers/usb/storage/protocol.o
  CC [M]  drivers/hwmon/coretemp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_bios.o
  CC [M]  drivers/i2c/busses/i2c-i801.o
  CC      drivers/net/phy/swphy.o
  LD [M]  drivers/ptp/ptp.o
  CC      drivers/acpi/acpica/utascii.o
  LD [M]  drivers/ptp/ptp_kvm.o
  CC [M]  fs/smb/client/smb2maperror.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/mmu.o
  CC      drivers/scsi/scsi_sysfs.o
  CC      kernel/smp.o
  CC      drivers/usb/serial/console.o
  CC      drivers/usb/storage/transport.o
  CC      drivers/acpi/pci_link.o
  CC      arch/x86/kernel/vsmp_64.o
  CC      kernel/uid16.o
  CC [M]  drivers/net/ipvlan/ipvlan_l3s.o
  CC      drivers/usb/core/quirks.o
  CC      lib/iomap.o
  CC [M]  fs/smb/client/smb2transport.o
  CC      drivers/usb/gadget/udc/core.o
  CC      drivers/input/mousedev.o
  CC      drivers/acpi/acpica/utbuffer.o
  CC      mm/hugetlb_cgroup.o
  CC [M]  fs/smb/client/smb2misc.o
  CC [M]  fs/smb/client/smb2pdu.o
  CC      drivers/usb/gadget/udc/trace.o
  CC [M]  drivers/gpu/drm/xe/xe_drm_client.o
  CC      lib/pci_iomap.o
  CC      net/ipv4/xfrm4_protocol.o
  CC [M]  net/ipv4/ip_tunnel.o
  CC [M]  drivers/gpu/drm/i915/intel_uncore.o
  CC [M]  net/ipv4/udp_tunnel_core.o
  AR      drivers/usb/gadget/function/built-in.a
  CC [M]  drivers/gpu/drm/i915/intel_wakeref.o
  CC      kernel/kallsyms.o
  AR      drivers/usb/gadget/legacy/built-in.a
  CC      drivers/usb/gadget/usbstring.o
  CC [M]  drivers/gpu/drm/i915/vlv_sideband.o
  CC      drivers/net/phy/fixed_phy.o
  CC [M]  drivers/gpu/drm/i915/vlv_suspend.o
  CC      drivers/acpi/acpica/utcksum.o
  CC      drivers/input/evdev.o
  AR      arch/x86/kernel/built-in.a
  AR      arch/x86/built-in.a
  AR      drivers/hwmon/built-in.a
  CC      drivers/usb/serial/ftdi_sio.o
  CC [M]  drivers/gpu/drm/xe/xe_exec.o
  CC      fs/btrfs/extent_io.o
  CC      kernel/acct.o
  CC      drivers/usb/serial/pl2303.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/outp.o
  CC      drivers/acpi/pci_irq.o
  CC      drivers/usb/core/devices.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.o
  AR      fs/nfs/built-in.a
  CC      kernel/crash_core.o
  CC      fs/libfs.o
  CC      drivers/acpi/acpi_lpss.o
  CC [M]  net/ipv4/udp_tunnel_nic.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/timer.o
  CC      drivers/acpi/acpica/utcopy.o
  CC      drivers/acpi/acpica/utexcep.o
  CC      lib/iomap_copy.o
  CC      drivers/usb/storage/usb.o
  CC      kernel/compat.o
  CC      kernel/utsname.o
  CC [M]  drivers/i2c/busses/i2c-isch.o
  CC [M]  drivers/gpu/drm/i915/soc/intel_dram.o
  CC [M]  fs/smb/client/smb2inode.o
  CC      lib/devres.o
  CC      mm/kmemleak.o
  LD [M]  drivers/net/ipvlan/ipvlan.o
  AR      drivers/scsi/built-in.a
  CC [M]  drivers/net/vxlan/vxlan_core.o
  AR      drivers/thermal/broadcom/built-in.a
  AR      drivers/thermal/samsung/built-in.a
  CC      drivers/thermal/intel/intel_tcc.o
  AR      drivers/thermal/st/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_execlist.o
  AR      drivers/net/ethernet/cortina/built-in.a
  CC      drivers/thermal/intel/therm_throt.o
  AR      drivers/net/ethernet/engleder/built-in.a
  CC      drivers/watchdog/watchdog_core.o
  CC      drivers/acpi/acpica/utdebug.o
  AR      drivers/net/ethernet/ezchip/built-in.a
  CC [M]  drivers/gpu/drm/i915/soc/intel_gmch.o
  AR      drivers/usb/gadget/udc/built-in.a
  CC      drivers/usb/gadget/config.o
  CC [M]  drivers/net/phy/phylink.o
  CC [M]  drivers/md/persistent-data/dm-array.o
  CC [M]  drivers/md/persistent-data/dm-bitset.o
  CC      drivers/opp/core.o
  CC      drivers/cpufreq/cpufreq.o
  CC      drivers/usb/core/phy.o
  CC      drivers/cpuidle/governors/menu.o
  CC      drivers/mmc/core/core.o
  AR      drivers/ufs/built-in.a
  CC      drivers/mmc/core/bus.o
  AR      drivers/input/built-in.a
  CC      drivers/mmc/core/host.o
  CC      drivers/mmc/core/mmc.o
  CC      drivers/cpuidle/cpuidle.o
  CC      drivers/mmc/host/sdhci.o
  CC      drivers/mmc/core/mmc_ops.o
  CC      drivers/cpuidle/driver.o
  CC [M]  drivers/gpu/drm/xe/xe_exec_queue.o
  AR      drivers/leds/trigger/built-in.a
  CC [M]  drivers/leds/trigger/ledtrig-audio.o
  AR      drivers/leds/blink/built-in.a
  CC [M]  fs/smb/client/smb2file.o
  AR      drivers/leds/simple/built-in.a
  CC [M]  fs/smb/client/cifsacl.o
  CC      drivers/acpi/acpica/utdecode.o
  CC      kernel/user_namespace.o
  CC [M]  drivers/gpu/drm/nouveau/nvif/vmm.o
  CC      drivers/acpi/acpica/utdelete.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/atombios_dp.o
  AR      drivers/usb/serial/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_force_wake.o
  CC      lib/check_signature.o
  CC [M]  drivers/i2c/busses/i2c-ismt.o
  CC      drivers/usb/storage/initializers.o
  CC      drivers/leds/led-core.o
  CC      drivers/cpuidle/governors/haltpoll.o
  CC      lib/interval_tree.o
  CC      mm/page_isolation.o
  CC [M]  drivers/md/persistent-data/dm-block-manager.o
  CC      fs/fs-writeback.o
  CC      drivers/acpi/acpica/uterror.o
  CC      drivers/usb/gadget/epautoconf.o
  CC      drivers/acpi/acpica/uteval.o
  CC [M]  drivers/gpu/drm/i915/soc/intel_pch.o
  CC      drivers/leds/led-class.o
  CC      drivers/usb/core/port.o
  CC [M]  drivers/gpu/drm/i915/i915_memcpy.o
  CC      drivers/cpufreq/freq_table.o
  CC      lib/assoc_array.o
  CC      drivers/watchdog/watchdog_dev.o
  CC      drivers/usb/gadget/composite.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_afmt.o
  CC [M]  drivers/thermal/intel/x86_pkg_temp_thermal.o
  CC [M]  drivers/net/usb/asix_devices.o
  LD [M]  net/ipv4/udp_tunnel.o
  AR      net/ipv4/built-in.a
  AR      net/built-in.a
  CC [M]  drivers/net/ethernet/broadcom/cnic.o
  CC [M]  drivers/usb/class/usbtmc.o
  CC [M]  drivers/gpu/drm/i915/i915_mm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_trace_points.o
  CC [M]  drivers/net/ethernet/broadcom/tg3.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/atombios_encoders.o
  AR      drivers/firmware/arm_ffa/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_sa.o
  CC [M]  drivers/gpu/drm/xe/xe_ggtt.o
  AR      drivers/firmware/arm_scmi/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvif/user.o
  CC      drivers/acpi/acpica/utglobal.o
  AR      drivers/firmware/broadcom/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvif/userc361.o
  CC      drivers/usb/storage/sierra_ms.o
  AR      drivers/firmware/cirrus/built-in.a
  AR      drivers/firmware/meson/built-in.a
  AR      drivers/firmware/microchip/built-in.a
  CC      kernel/pid_namespace.o
  CC      drivers/firmware/efi/efi-bgrt.o
  UPD     kernel/config_data
  CC      drivers/opp/cpu.o
  CC      drivers/firmware/efi/libstub/efi-stub-helper.o
  CC [M]  drivers/gpu/drm/xe/xe_gpu_scheduler.o
  AR      drivers/cpuidle/governors/built-in.a
  CC      drivers/cpuidle/governor.o
  CC [M]  drivers/md/persistent-data/dm-space-map-common.o
  CC      drivers/usb/host/ehci-pci.o
  CC      drivers/leds/led-triggers.o
  CC [M]  drivers/net/phy/ax88796b.o
  CC      drivers/cpufreq/cpufreq_performance.o
  CC [M]  drivers/i2c/busses/i2c-piix4.o
  CC      drivers/mmc/core/sd.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/atombios_i2c.o
  CC      drivers/mmc/core/sd_ops.o
  CC      drivers/usb/host/ohci-hcd.o
  CC      drivers/acpi/acpica/uthex.o
  CC      drivers/net/loopback.o
  CC      lib/list_debug.o
  AR      drivers/thermal/intel/built-in.a
  AR      drivers/thermal/qcom/built-in.a
  AR      drivers/thermal/tegra/built-in.a
  CC      drivers/usb/core/hcd-pci.o
  AR      drivers/thermal/mediatek/built-in.a
  CC      drivers/thermal/thermal_core.o
  AR      drivers/crypto/stm32/built-in.a
  AR      drivers/crypto/xilinx/built-in.a
  AR      drivers/crypto/hisilicon/built-in.a
  AR      drivers/crypto/intel/keembay/built-in.a
  CC      drivers/watchdog/softdog.o
  CC      drivers/usb/core/usb-acpi.o
  AR      drivers/crypto/intel/ixp4xx/built-in.a
  AR      drivers/crypto/intel/built-in.a
  AR      drivers/crypto/starfive/built-in.a
  AR      drivers/crypto/built-in.a
  CC      lib/debugobjects.o
  AR      drivers/net/ethernet/fungible/built-in.a
  CC      mm/early_ioremap.o
  CC [M]  drivers/gpu/drm/i915/i915_sw_fence.o
  CC [M]  fs/smb/client/fs_context.o
  CC [M]  drivers/gpu/drm/i915/i915_sw_fence_work.o
  HOSTCC  drivers/gpu/drm/xe/xe_gen_wa_oob
  CC [M]  drivers/gpu/drm/i915/i915_syncmap.o
  CC      drivers/firmware/efi/efi.o
  CC      drivers/opp/debugfs.o
  CC      drivers/acpi/acpica/utids.o
  CC      drivers/usb/host/ohci-pci.o
  CC      drivers/usb/storage/option_ms.o
  CC      drivers/cpuidle/sysfs.o
  CC      drivers/acpi/acpica/utinit.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/client.o
  CC      drivers/usb/gadget/functions.o
  CC      drivers/usb/host/uhci-hcd.o
  CC      drivers/cpufreq/cpufreq_ondemand.o
  CC [M]  drivers/net/usb/asix_common.o
  CC      drivers/firmware/efi/libstub/gop.o
  CC      kernel/stop_machine.o
  CC [M]  drivers/net/phy/bcm7xxx.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc_proxy.o
  CC      mm/cma.o
  CC [M]  fs/smb/client/dns_resolve.o
  CC      drivers/mmc/core/sdio.o
  AR      drivers/leds/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gsc_submit.o
  CC      drivers/usb/host/xhci.o
  CC [M]  drivers/md/persistent-data/dm-space-map-disk.o
  AR      drivers/watchdog/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/engine.o
  CC      fs/btrfs/volumes.o
  CC      drivers/usb/gadget/configfs.o
  CC      drivers/acpi/acpica/utlock.o
  ASN.1   fs/smb/client/cifs_spnego_negtokeninit.asn1.[ch]
  CC      drivers/acpi/acpica/utmath.o
  CC      kernel/kprobes.o
  CC [M]  drivers/i2c/busses/i2c-designware-pcidrv.o
  CC [M]  drivers/net/phy/bcm87xx.o
  CC      drivers/cpuidle/poll_state.o
  AR      drivers/usb/core/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt.o
  CC      drivers/cpufreq/cpufreq_governor.o
  AR      drivers/opp/built-in.a
  CC      drivers/md/md.o
  CC      drivers/md/md-bitmap.o
  CC      mm/secretmem.o
  CC      drivers/md/md-autodetect.o
  CC      drivers/usb/gadget/u_f.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.o
  CC      mm/userfaultfd.o
  CC      drivers/mmc/core/sdio_ops.o
  CC      drivers/md/dm-uevent.o
  CC      drivers/mmc/host/sdhci-pci-core.o
  CC      drivers/usb/storage/usual-tables.o
  CC      drivers/cpuidle/cpuidle-haltpoll.o
  CC      drivers/acpi/acpica/utmisc.o
  CC [M]  fs/smb/client/namespace.o
  CC      lib/bitrev.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.o
  AR      drivers/firmware/imx/built-in.a
  CC [M]  drivers/net/usb/ax88172a.o
  AR      drivers/firmware/psci/built-in.a
  CC      drivers/md/dm.o
  CC [M]  drivers/gpu/drm/i915/i915_user_extensions.o
  CC      drivers/md/dm-table.o
  CC      drivers/firmware/efi/libstub/secureboot.o
  CC      drivers/firmware/efi/vars.o
  CC      drivers/firmware/efi/reboot.o
  CC      mm/memremap.o
  CC [M]  drivers/md/persistent-data/dm-space-map-metadata.o
  CC      drivers/thermal/thermal_sysfs.o
  CC      drivers/thermal/thermal_trip.o
  CC      drivers/thermal/thermal_helpers.o
  CC      drivers/acpi/acpica/utmutex.o
  CC [M]  drivers/net/usb/ax88179_178a.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/enum.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/event.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/firmware.o
  CC [M]  drivers/net/phy/bcm-phy-lib.o
  CC      lib/crc16.o
  AR      drivers/usb/storage/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/gpuobj.o
  LD [M]  drivers/i2c/busses/i2c-designware-pci.o
  CC      drivers/cpufreq/cpufreq_governor_attr_set.o
  AR      drivers/i2c/busses/built-in.a
  AR      drivers/cpuidle/built-in.a
  CC      drivers/i2c/i2c-core-acpi.o
  CC      mm/hmm.o
  CC [M]  drivers/gpu/drm/i915/i915_ioc32.o
  CC [M]  fs/smb/client/smb1ops.o
  CC      drivers/md/dm-target.o
  CC [M]  fs/smb/client/cifssmb.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/intr.o
  CC [M]  drivers/net/vxlan/vxlan_multicast.o
  CC      drivers/cpufreq/acpi-cpufreq.o
  CC      drivers/mmc/core/sdio_bus.o
  CC [M]  drivers/md/persistent-data/dm-transaction-manager.o
  CC      drivers/md/dm-linear.o
  CC      drivers/acpi/acpica/utnonansi.o
  AR      drivers/firmware/qcom/built-in.a
  CC      drivers/firmware/efi/memattr.o
  CC      drivers/firmware/efi/libstub/tpm.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_ccs_mode.o
  AR      drivers/usb/gadget/built-in.a
  AR      drivers/firmware/smccc/built-in.a
  CC      fs/pnode.o
  CC      mm/memfd.o
  CC [M]  drivers/net/vxlan/vxlan_vnifilter.o
  CC      fs/splice.o
  CC      drivers/mmc/core/sdio_cis.o
  CC      drivers/net/netconsole.o
  CC      drivers/md/dm-stripe.o
  CC      lib/crc-t10dif.o
  CC      drivers/thermal/thermal_hwmon.o
  AR      drivers/firmware/tegra/built-in.a
  AR      drivers/firmware/xilinx/built-in.a
  CC [M]  drivers/net/phy/broadcom.o
  CC      drivers/firmware/efi/tpm.o
  CC      drivers/acpi/acpica/utobject.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.o
  CC      kernel/hung_task.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/ioctl.o
  CC [M]  drivers/net/phy/lxt.o
  CC      mm/bootmem_info.o
  CC      drivers/mmc/host/sdhci-pci-o2micro.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/memory.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/mm.o
  CC      drivers/md/dm-ioctl.o
  HOSTCC  lib/gen_crc32table
  CC      drivers/usb/host/xhci-mem.o
  CC [M]  drivers/md/persistent-data/dm-btree.o
  CC      fs/btrfs/async-thread.o
  CC      drivers/md/dm-io.o
  CC      drivers/md/dm-kcopyd.o
  CC      fs/btrfs/ioctl.o
  CC      drivers/i2c/i2c-core-slave.o
  CC      drivers/mmc/host/sdhci-pci-arasan.o
  CC      drivers/i2c/i2c-dev.o
  CC      drivers/firmware/efi/libstub/file.o
  CC [M]  drivers/gpu/drm/i915/i915_debugfs.o
  CC      drivers/clocksource/acpi_pm.o
  CC      drivers/clocksource/i8253.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_clock.o
  CC      drivers/acpi/acpica/utosi.o
  CC      lib/libcrc32c.o
  CC      drivers/hid/usbhid/hid-core.o
  CC [M]  drivers/net/usb/cdc_ether.o
  CC      drivers/cpufreq/intel_pstate.o
  CC      drivers/thermal/gov_fair_share.o
  CC      drivers/mmc/core/sdio_io.o
  CC      drivers/hid/usbhid/hiddev.o
  CC      lib/xxhash.o
  CC      drivers/firmware/efi/memmap.o
  CC      lib/genalloc.o
  CC      fs/sync.o
  AR      mm/built-in.a
  CC      fs/utimes.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_debugfs.o
  CC      drivers/acpi/acpica/utownerid.o
  CC [M]  drivers/net/phy/realtek.o
  CC      drivers/mmc/core/sdio_irq.o
  CC [M]  drivers/net/phy/smsc.o
  CC      drivers/mmc/host/sdhci-pci-dwc-mshc.o
  CC      kernel/watchdog.o
  CC [M]  drivers/gpu/drm/i915/i915_debugfs_params.o
  CC      lib/percpu_counter.o
  CC [M]  drivers/i2c/i2c-smbus.o
  CC [M]  fs/smb/client/cifs_spnego_negtokeninit.asn1.o
  CC      lib/fault-inject.o
  CC [M]  drivers/md/persistent-data/dm-btree-remove.o
  AR      drivers/clocksource/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_freq.o
  CC      drivers/mmc/host/sdhci-pci-gli.o
  CC      drivers/firmware/efi/libstub/mem.o
  CC      drivers/thermal/gov_step_wise.o
  CC      drivers/thermal/gov_user_space.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.o
  CC [M]  drivers/md/persistent-data/dm-btree-spine.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/object.o
  CC [M]  drivers/i2c/i2c-mux.o
  CC      drivers/acpi/acpica/utpredef.o
  CC [M]  drivers/net/vxlan/vxlan_mdb.o
  CC      drivers/usb/host/xhci-ext-caps.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/oproxy.o
  CC      fs/btrfs/locking.o
  CC      drivers/mmc/core/slot-gpio.o
  AR      drivers/net/ethernet/huawei/built-in.a
  CC      drivers/md/dm-sysfs.o
  CC      lib/syscall.o
  CC [M]  drivers/net/usb/cdc_eem.o
  CC      drivers/usb/host/xhci-ring.o
  CC      fs/btrfs/orphan.o
  CC [M]  drivers/net/dummy.o
  CC      drivers/mmc/host/sdhci-acpi.o
  CC      drivers/acpi/acpi_apd.o
  CC      kernel/watchdog_perf.o
  CC      drivers/acpi/acpica/utresdecode.o
  CC      fs/btrfs/export.o
  CC      lib/dynamic_debug.o
  AR      drivers/staging/media/built-in.a
  AR      drivers/staging/built-in.a
  CC [M]  fs/smb/client/asn1.o
  CC      lib/errname.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_idle.o
  CC [M]  drivers/gpu/drm/i915/i915_pmu.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_mcr.o
  CC      drivers/mmc/host/cqhci-core.o
  CC [M]  drivers/mmc/host/sdhci-pltfm.o
  CC      drivers/firmware/efi/esrt.o
  CC      drivers/mmc/core/regulator.o
  CC [M]  drivers/net/usb/smsc75xx.o
  AR      drivers/thermal/built-in.a
  CC      drivers/firmware/efi/libstub/random.o
  AR      drivers/platform/x86/amd/built-in.a
  AR      drivers/platform/surface/built-in.a
  CC      drivers/md/dm-stats.o
  CC      kernel/seccomp.o
  CC [M]  drivers/platform/x86/intel/pmc/core.o
  CC [M]  drivers/platform/x86/intel/pmt/class.o
  CC      drivers/platform/x86/intel/turbo_max_3.o
  AR      drivers/hid/usbhid/built-in.a
  CC      drivers/hid/hid-core.o
  LD [M]  drivers/md/persistent-data/dm-persistent-data.o
  CC      drivers/hid/hid-input.o
  CC      drivers/acpi/acpica/utresrc.o
  CC [M]  drivers/platform/x86/intel/pmt/telemetry.o
  AR      drivers/net/phy/built-in.a
  CC      drivers/acpi/acpica/utstate.o
  CC      kernel/relay.o
  CC      lib/nlattr.o
  CC [M]  drivers/gpu/drm/drm_aperture.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/option.o
  AR      drivers/i2c/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/ramht.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/subdev.o
  CC      drivers/mailbox/mailbox.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/core/uevent.o
  CC [M]  drivers/platform/x86/intel/pmc/core_ssram.o
  CC      drivers/devfreq/devfreq.o
  CC [M]  drivers/platform/x86/intel/pmc/spt.o
  CC      drivers/usb/host/xhci-hub.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_pll.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_pagefault.o
  CC [M]  drivers/gpu/drm/drm_atomic.o
  CC      drivers/mmc/core/debugfs.o
  CC      drivers/acpi/acpica/utstring.o
  CC [M]  drivers/gpu/drm/drm_atomic_uapi.o
  AR      drivers/cpufreq/built-in.a
  CC      drivers/md/dm-rq.o
  CC      drivers/platform/x86/p2sb.o
  CC [M]  drivers/platform/x86/intel/pmc/cnp.o
  CC [M]  drivers/net/usb/smsc95xx.o
  CC [M]  drivers/net/usb/mcs7830.o
  CC [M]  drivers/platform/x86/intel/pmc/icl.o
  CC [M]  drivers/net/usb/usbnet.o
  CC      drivers/firmware/efi/efi-pstore.o
  CC [M]  drivers/gpu/drm/i915/gt/gen2_engine_cs.o
  CC      drivers/firmware/efi/cper.o
  CC      drivers/acpi/acpica/utstrsuppt.o
  CC      drivers/firmware/efi/libstub/randomalloc.o
  CC [M]  drivers/platform/x86/intel/pmt/crashlog.o
  CC      fs/btrfs/tree-log.o
  CC      drivers/platform/x86/pmc_atom.o
  CC      drivers/acpi/acpica/utstrtoul64.o
  CC [M]  drivers/gpu/drm/drm_auth.o
  LD [M]  fs/smb/client/cifs.o
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_main.o
  AR      drivers/mmc/host/built-in.a
  CC      drivers/mailbox/pcc.o
  AR      drivers/net/ethernet/i825xx/built-in.a
  CC [M]  drivers/platform/x86/wmi.o
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_hw.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sysfs.o
  CC [M]  drivers/net/usb/cdc_ncm.o
  CC      kernel/utsname_sysctl.o
  CC      kernel/delayacct.o
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_ethtool.o
  CC [M]  drivers/net/usb/r8153_ecm.o
  CC      drivers/mmc/core/block.o
  CC [M]  drivers/gpu/drm/i915/gt/gen6_engine_cs.o
  CC      drivers/mmc/core/queue.o
  CC [M]  drivers/platform/x86/wmi-bmof.o
  CC      drivers/acpi/acpica/utxface.o
  CC      drivers/acpi/acpica/utxfinit.o
  CC [M]  drivers/platform/x86/intel/pmc/tgl.o
  CC [M]  drivers/gpu/drm/i915/gt/gen6_ppgtt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/nvfw/fw.o
  CC      lib/cpu_rmap.o
  CC      lib/dynamic_queue_limits.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/nvfw/hs.o
  CC [M]  drivers/platform/x86/intel/pmc/adl.o
  CC [M]  drivers/net/ethernet/intel/e1000/e1000_param.o
  LD [M]  drivers/platform/x86/intel/pmt/pmt_class.o
  LD [M]  drivers/platform/x86/intel/pmt/pmt_telemetry.o
  LD [M]  drivers/platform/x86/intel/pmt/pmt_crashlog.o
  LD [M]  drivers/net/vxlan/vxlan.o
  CC [M]  drivers/platform/x86/intel/vsec.o
  CC      drivers/firmware/efi/libstub/pci.o
  CC      drivers/acpi/acpi_platform.o
  CC      lib/glob.o
  CC [M]  drivers/net/macvlan.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/nvfw/ls.o
  CC [M]  drivers/platform/x86/intel/pmc/mtl.o
  CC      drivers/acpi/acpica/utxferror.o
  CC      fs/d_path.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.o
  CC      drivers/acpi/acpica/utxfmutex.o
  CC [M]  drivers/platform/x86/intel/rst.o
  CC      kernel/taskstats.o
  CC      kernel/tsacct.o
  CC [M]  drivers/gpu/drm/drm_blend.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.o
  CC [M]  drivers/net/mii.o
  CC      drivers/hid/hid-quirks.o
  CC      fs/stack.o
  CC [M]  drivers/gpu/drm/i915/gt/gen7_renderclear.o
  AR      drivers/mailbox/built-in.a
  CC [M]  drivers/devfreq/governor_simpleondemand.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o
  CC [M]  drivers/gpu/drm/i915/gt/gen8_engine_cs.o
  CC      drivers/firmware/efi/cper_cxl.o
  CC [M]  drivers/platform/x86/intel/pmc/arl.o
  CC      drivers/md/dm-io-rewind.o
  CC      kernel/tracepoint.o
  CC [M]  drivers/platform/x86/mxm-wmi.o
  AR      drivers/acpi/acpica/built-in.a
  CC      lib/strncpy_from_user.o
  CC      lib/strnlen_user.o
  AR      drivers/net/ethernet/microsoft/built-in.a
  CC [M]  drivers/platform/x86/intel_ips.o
  CC      drivers/acpi/acpi_pnp.o
  CC [M]  drivers/devfreq/governor_performance.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.o
  AR      drivers/net/ethernet/litex/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.o
  CC      drivers/usb/host/xhci-dbg.o
  CC [M]  drivers/net/mdio.o
  AR      drivers/net/ethernet/microchip/built-in.a
  CC      drivers/firmware/efi/libstub/skip_spaces.o
  CC [M]  drivers/net/tun.o
  CC      drivers/hid/hid-debug.o
  CC      drivers/hid/hidraw.o
  CC      drivers/firmware/efi/libstub/lib-cmdline.o
  CC      kernel/latencytop.o
  AR      drivers/platform/x86/intel/built-in.a
  LD [M]  drivers/platform/x86/intel/intel_vsec.o
  CC      fs/fs_struct.o
  CC      kernel/irq_work.o
  LD [M]  drivers/platform/x86/intel/intel-rst.o
  CC      drivers/acpi/power.o
  CC      kernel/static_call.o
  CC [M]  drivers/platform/x86/intel/pmc/lnl.o
  CC      lib/net_utils.o
  CC      kernel/static_call_inline.o
  CC      drivers/firmware/efi/libstub/lib-ctype.o
  CC      drivers/firmware/efi/libstub/alignedmem.o
  CC [M]  drivers/gpu/drm/drm_bridge.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/nvfw/acr.o
  CC      fs/btrfs/free-space-cache.o
  CC      fs/statfs.o
  CC      drivers/acpi/event.o
  CC [M]  drivers/gpu/drm/i915/gt/gen8_ppgtt.o
  CC      fs/btrfs/zlib.o
  CC      fs/fs_pin.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_topology.o
  CC      lib/sg_pool.o
  CC      drivers/hid/hid-generic.o
  AR      drivers/devfreq/built-in.a
  CC      fs/btrfs/lzo.o
  LD [M]  drivers/net/usb/asix.o
  CC      kernel/numa.o
  CC      lib/stackdepot.o
  CC      drivers/firmware/efi/runtime-wrappers.o
  CC      kernel/user-return-notifier.o
  CC      drivers/md/dm-builtin.o
  CC      drivers/firmware/efi/dev-path-parser.o
  CC      drivers/usb/host/xhci-trace.o
  CC      fs/nsfs.o
  CC      drivers/acpi/evged.o
  CC      fs/fs_types.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.o
  AR      drivers/mmc/core/built-in.a
  AR      drivers/mmc/built-in.a
  CC      lib/ref_tracker.o
  CC      drivers/firmware/efi/apple-properties.o
  CC [M]  drivers/gpu/drm/drm_cache.o
  CC      kernel/padata.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_breadcrumbs.o
  GEN     xe_wa_oob.c xe_wa_oob.h
  CC      drivers/firmware/efi/libstub/relocate.o
  GEN     xe_wa_oob.c xe_wa_oob.h
  CC [M]  drivers/gpu/drm/xe/xe_guc_ads.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_context.o
  CC      kernel/jump_label.o
  CC      drivers/firmware/efi/earlycon.o
  CC [M]  drivers/platform/x86/intel/pmc/pltdrv.o
  CC      fs/fs_context.o
  CC      drivers/powercap/powercap_sys.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.o
  CC      drivers/powercap/intel_rapl_common.o
  CC      drivers/firmware/dmi_scan.o
  CC      lib/ucs2_string.o
  CC      drivers/hid/hid-a4tech.o
  CC      drivers/firmware/efi/libstub/printk.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_context_sseu.o
  CC      drivers/acpi/sysfs.o
  CC      kernel/context_tracking.o
  CC      fs/fs_parser.o
  CC      fs/fsopen.o
  CC [M]  drivers/gpu/drm/drm_client.o
  CC      lib/sbitmap.o
  CC [M]  drivers/gpu/drm/drm_client_modeset.o
  CC [M]  drivers/gpu/drm/drm_color_mgmt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.o
  CC      fs/init.o
  CC [M]  drivers/net/veth.o
  CC      drivers/hid/hid-apple.o
  CC      fs/kernel_read_file.o
  CC      fs/mnt_idmapping.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/nvfw/flcn.o
  CC [M]  drivers/gpu/drm/drm_connector.o
  CC      fs/remap_range.o
  CC      drivers/acpi/property.o
  CC [M]  drivers/md/dm-bufio.o
  CC      fs/buffer.o
  CC      lib/group_cpus.o
  CC      drivers/firmware/efi/cper-x86.o
  CC      drivers/firmware/efi/libstub/vsprintf.o
  LD [M]  drivers/platform/x86/intel/pmc/intel_pmc_core.o
  LD [M]  drivers/platform/x86/intel/pmc/intel_pmc_core_pltdrv.o
  AR      drivers/platform/x86/built-in.a
  AR      drivers/platform/built-in.a
  AR      drivers/perf/built-in.a
  CC      drivers/ras/ras.o
  CC      lib/fw_table.o
  CC      drivers/ras/debugfs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vf_error.o
  CC      drivers/hid/hid-belkin.o
  CC      drivers/hid/hid-cherry.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/cmdq.o
  LD [M]  drivers/net/ethernet/intel/e1000/e1000.o
  CC      drivers/firmware/efi/libstub/x86-stub.o
  CC      kernel/iomem.o
  CC      kernel/rseq.o
  CC [M]  drivers/net/ethernet/intel/e1000e/82571.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_engine_cs.o
  CC [M]  drivers/md/dm-bio-prison-v1.o
  AR      drivers/hwtracing/intel_th/built-in.a
  CC      drivers/hid/hid-chicony.o
  CC      fs/mpage.o
  CC      drivers/firmware/efi/libstub/x86-5lvl.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_engine_heartbeat.o
  CC [M]  drivers/net/ethernet/intel/e1000e/ich8lan.o
  CC      drivers/powercap/intel_rapl_msr.o
  CC [M]  lib/crc-itu-t.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_engine_pm.o
  CC [M]  drivers/gpu/drm/drm_crtc.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_engine_user.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_execlists_submission.o
  CC      fs/btrfs/zstd.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_ct.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_sched.o
  GZIP    kernel/config_data.gz
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/fw.o
  CC [M]  lib/asn1_decoder.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_db_mgr.o
  AR      drivers/firmware/efi/built-in.a
  CC      kernel/configs.o
  CC [M]  drivers/gpu/drm/drm_displayid.o
  CC      drivers/firmware/dmi-sysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_hwconfig.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_main.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_log.o
  CC      fs/proc_namespace.o
  STUBCPY drivers/firmware/efi/libstub/alignedmem.stub.o
  CC [M]  drivers/gpu/drm/drm_drv.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.o
  CC      drivers/acpi/acpi_cmos_rtc.o
  STUBCPY drivers/firmware/efi/libstub/efi-stub-helper.stub.o
  CC      drivers/usb/host/xhci-debugfs.o
  CC [M]  drivers/gpu/drm/drm_dumb_buffers.o
  CC      drivers/acpi/x86/apple.o
  AR      drivers/net/ethernet/mscc/built-in.a
  CC      drivers/hid/hid-cypress.o
  CC      drivers/acpi/x86/utils.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_ggtt.o
  STUBCPY drivers/firmware/efi/libstub/file.stub.o
  STUBCPY drivers/firmware/efi/libstub/gop.stub.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.o
  AR      drivers/ras/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_guc_pc.o
  STUBCPY drivers/firmware/efi/libstub/lib-cmdline.stub.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_submit.o
  STUBCPY drivers/firmware/efi/libstub/lib-ctype.stub.o
  CC      drivers/usb/host/xhci-pci.o
  CC      fs/direct-io.o
  STUBCPY drivers/firmware/efi/libstub/mem.stub.o
  STUBCPY drivers/firmware/efi/libstub/pci.stub.o
  CC      drivers/hid/hid-ezkey.o
  CC      fs/eventpoll.o
  STUBCPY drivers/firmware/efi/libstub/printk.stub.o
  CC [M]  drivers/md/dm-bio-prison-v2.o
  AR      drivers/powercap/built-in.a
  STUBCPY drivers/firmware/efi/libstub/random.stub.o
  CC [M]  drivers/md/dm-crypt.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_ethtool.o
  STUBCPY drivers/firmware/efi/libstub/randomalloc.stub.o
  STUBCPY drivers/firmware/efi/libstub/relocate.stub.o
  STUBCPY drivers/firmware/efi/libstub/secureboot.stub.o
  AR      kernel/built-in.a
  STUBCPY drivers/firmware/efi/libstub/skip_spaces.stub.o
  CC [M]  drivers/md/dm-thin.o
  STUBCPY drivers/firmware/efi/libstub/tpm.stub.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.o
  STUBCPY drivers/firmware/efi/libstub/vsprintf.stub.o
  STUBCPY drivers/firmware/efi/libstub/x86-5lvl.stub.o
  GEN     lib/oid_registry_data.c
  STUBCPY drivers/firmware/efi/libstub/x86-stub.stub.o
  AR      drivers/firmware/efi/libstub/lib.a
  CC [M]  lib/oid_registry.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.o
  CC      fs/btrfs/compression.o
  CC      drivers/acpi/x86/s2idle.o
  CC      drivers/firmware/dmi-id.o
  CC      fs/anon_inodes.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_main.o
  CC [M]  drivers/net/ethernet/intel/igbvf/vf.o
  CC [M]  drivers/md/dm-thin-metadata.o
  CC [M]  drivers/net/ethernet/intel/igbvf/mbx.o
  CC [M]  drivers/gpu/drm/drm_edid.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_main.o
  CC [M]  drivers/gpu/drm/drm_eld.o
  CC      drivers/hid/hid-kensington.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_common.o
  CC [M]  drivers/gpu/drm/xe/xe_heci_gsc.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/msgq.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/vf.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/mbx.o
  CC      drivers/hid/hid-lg.o
  AR      lib/lib.a
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.o
  GEN     lib/crc32table.h
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_clock_utils.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/v1.o
  CC      lib/crc32.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_debugfs.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.o
  CC      drivers/acpi/debugfs.o
  CC      drivers/firmware/memmap.o
  CC      fs/signalfd.o
  CC      drivers/android/binderfs.o
  CC [M]  drivers/gpu/drm/drm_encoder.o
  CC      drivers/android/binder.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_irq.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/gm200.o
  CC      drivers/hid/hid-lg-g15.o
  CC      drivers/hid/hid-microsoft.o
  CC [M]  drivers/net/ethernet/intel/igbvf/ethtool.o
  CC      drivers/android/binder_alloc.o
  AR      drivers/nvmem/layouts/built-in.a
  CC      drivers/nvmem/core.o
  AR      drivers/usb/host/built-in.a
  AR      drivers/usb/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.o
  CC      fs/timerfd.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/gp102.o
  CC      drivers/acpi/acpi_lpat.o
  LD [M]  drivers/md/dm-bio-prison.o
  AR      lib/built-in.a
  CC      drivers/hid/hid-monterey.o
  AR      drivers/firmware/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/tu102.o
  AR      drivers/md/built-in.a
  CC [M]  drivers/mtd/chips/chipreg.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_mcr.o
  CC [M]  drivers/net/ethernet/intel/e1000e/80003es2lan.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/ethtool.o
  CC      fs/eventfd.o
  CC      fs/userfaultfd.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/ga100.o
  CC      fs/aio.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_pm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/falcon/ga102.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.o
  CC      drivers/acpi/acpi_lpit.o
  CC      fs/locks.o
  CC      drivers/acpi/prmt.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_pm_irq.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_fence.o
  CC      fs/btrfs/delayed-ref.o
  CC      fs/binfmt_script.o
  AR      drivers/net/ethernet/intel/built-in.a
  CC [M]  drivers/net/ethernet/intel/e100.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_82599.o
  CC      drivers/acpi/acpi_pcc.o
  CC [M]  drivers/net/ethernet/intel/igbvf/netdev.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_82575.o
  CC [M]  drivers/gpu/drm/drm_file.o
  CC [M]  drivers/gpu/drm/xe/xe_huc.o
  CC [M]  drivers/gpu/drm/xe/xe_huc_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_irq.o
  CC [M]  drivers/gpu/drm/drm_fourcc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.o
  CC [M]  drivers/mtd/mtdcore.o
  LD [M]  drivers/md/dm-thin-pool.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_requests.o
  AR      drivers/hid/built-in.a
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_82598.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_sysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_lrc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_mac.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.o
  AR      drivers/nvmem/built-in.a
  CC [M]  drivers/uio/uio.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.o
  CC      fs/binfmt_elf.o
  CC [M]  drivers/gpu/drm/xe/xe_migrate.o
  CC [M]  drivers/mtd/mtdsuper.o
  CC [M]  drivers/vfio/pci/vfio_pci_core.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_csa.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm20b.o
  CC [M]  drivers/net/ethernet/intel/e1000e/mac.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gtt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.o
  CC      drivers/acpi/ac.o
  CC [M]  drivers/gpu/drm/drm_framebuffer.o
  CC      fs/btrfs/relocation.o
  CC      fs/btrfs/delayed-inode.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_llc.o
  CC [M]  drivers/vfio/pci/vfio_pci_intrs.o
  CC [M]  drivers/gpu/drm/xe/xe_mmio.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_lrc.o
  CC [M]  drivers/gpu/drm/xe/xe_mocs.o
  CC [M]  drivers/vfio/vfio_main.o
  CC [M]  drivers/mtd/mtdconcat.o
  CC [M]  drivers/gpu/drm/drm_gem.o
  CC [M]  drivers/vfio/group.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp108.o
  CC [M]  drivers/mtd/mtdpart.o
  CC [M]  drivers/bluetooth/btusb.o
  CC [M]  drivers/pps/pps.o
  CC [M]  drivers/dca/dca-core.o
  CC      drivers/acpi/button.o
  CC [M]  drivers/ssb/main.o
  CC [M]  drivers/bluetooth/btintel.o
  CC [M]  drivers/bluetooth/btbcm.o
  CC [M]  drivers/gpu/drm/drm_ioctl.o
  CC [M]  drivers/ssb/scan.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_phy.o
  CC [M]  drivers/pps/kapi.o
  CC [M]  drivers/gpu/drm/xe/xe_module.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o
  CC [M]  drivers/net/ethernet/intel/ixgbevf/ipsec.o
  CC [M]  drivers/mtd/mtdchar.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_migrate.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_nvm.o
  CC [M]  drivers/vfio/pci/vfio_pci_rdwr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.o
  CC [M]  drivers/pps/sysfs.o
  CC [M]  drivers/gpu/drm/drm_lease.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_mac.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.o
  CC [M]  drivers/ssb/sprom.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_i225.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_base.o
  CC [M]  drivers/net/ethernet/intel/e1000e/manage.o
  CC [M]  drivers/net/ethernet/intel/e1000e/nvm.o
  LD [M]  drivers/net/ethernet/intel/igbvf/igbvf.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gv100.o
  CC [M]  drivers/vfio/pci/vfio_pci_config.o
  CC [M]  drivers/gpu/drm/drm_managed.o
  CC [M]  drivers/gpu/drm/drm_mm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp10b.o
  CC [M]  drivers/gpu/drm/drm_mode_config.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.o
  CC [M]  drivers/dca/dca-sysfs.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_mocs.o
  CC [M]  drivers/gpu/drm/xe/xe_pat.o
  CC      drivers/acpi/fan_core.o
  CC [M]  drivers/ssb/pci.o
  CC      fs/compat_binfmt_elf.o
  CC [M]  drivers/ssb/pcihost_wrapper.o
  CC [M]  drivers/vfio/container.o
  LD [M]  drivers/pps/pps_core.o
  CC      fs/backing-file.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_nvm.o
  CC [M]  drivers/gpu/drm/drm_mode_object.o
  CC [M]  drivers/ssb/driver_chipcommon.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.o
  CC [M]  drivers/bluetooth/btrtl.o
  CC [M]  drivers/ssb/driver_chipcommon_pmu.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_phy.o
  CC [M]  drivers/gpu/drm/xe/xe_pci.o
  CC [M]  drivers/gpu/drm/xe/xe_pcode.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_mbx.o
  CC      fs/btrfs/scrub.o
  LD [M]  drivers/mtd/mtd.o
  LD [M]  drivers/dca/dca.o
  CC [M]  drivers/net/ethernet/intel/e1000e/phy.o
  CC [M]  drivers/vhost/net.o
  CC [M]  drivers/vhost/vhost.o
  AR      drivers/net/ethernet/neterion/built-in.a
  CC [M]  drivers/net/ethernet/intel/igc/igc_phy.o
  CC      drivers/acpi/fan_attr.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_ppgtt.o
  CC      drivers/acpi/processor_driver.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/tu102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga100.o
  CC [M]  drivers/gpu/drm/drm_modes.o
  AR      drivers/net/ethernet/netronome/built-in.a
  CC [M]  drivers/gpu/drm/drm_modeset_lock.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_diag.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_mbx.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_rc6.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.o
  AR      drivers/android/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/base.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_ethtool.o
  CC [M]  drivers/gpu/drm/drm_plane.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_x540.o
  CC [M]  drivers/net/ethernet/intel/e1000e/param.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/nv50.o
  CC [M]  drivers/vfio/pci/vfio_pci.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_region_lmem.o
  CC [M]  drivers/ssb/driver_pcicore.o
  AR      drivers/net/ethernet/ni/built-in.a
  AR      drivers/net/ethernet/packetengines/built-in.a
  AR      drivers/net/ethernet/realtek/built-in.a
  CC [M]  drivers/gpu/drm/drm_prime.o
  CC [M]  drivers/net/ethernet/realtek/8139cp.o
  CC [M]  drivers/net/ethernet/intel/igb/e1000_i210.o
  CC [M]  drivers/net/ethernet/realtek/8139too.o
  CC [M]  drivers/vhost/iotlb.o
  CC      drivers/acpi/processor_thermal.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_renderstate.o
  LD [M]  drivers/vfio/pci/vfio-pci-core.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_umc.o
  CC      drivers/acpi/processor_idle.o
  CC      drivers/acpi/processor_throttling.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.o
  CC [M]  drivers/gpu/drm/drm_print.o
  CC [M]  drivers/gpu/drm/xe/xe_pm.o
  CC [M]  drivers/net/ethernet/realtek/r8169_main.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_ptp.o
  CC      fs/mbcache.o
  CC [M]  drivers/net/ethernet/realtek/r8169_firmware.o
  LD [M]  drivers/net/ethernet/intel/ixgbevf/ixgbevf.o
  CC [M]  drivers/net/ethernet/realtek/r8169_phy_config.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_reset.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_ring.o
  CC [M]  drivers/net/ethernet/intel/e1000e/ethtool.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_x550.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/g84.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_lib.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/gk20a.o
  LD [M]  drivers/vfio/pci/vfio-pci.o
  CC [M]  drivers/vfio/virqfd.o
  LD [M]  drivers/ssb/ssb.o
  CC [M]  drivers/gpu/drm/xe/xe_preempt_fence.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/gm107.o
  CC [M]  drivers/gpu/drm/xe/xe_pt.o
  CC [M]  drivers/net/ethernet/intel/igb/igb_hwmon.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/gm20b.o
  CC [M]  drivers/vfio/vfio_iommu_type1.o
  CC      fs/btrfs/backref.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/tu102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.o
  AR      drivers/net/ethernet/renesas/built-in.a
  CC      drivers/acpi/processor_perflib.o
  AR      drivers/net/ethernet/sfc/built-in.a
  CC [M]  drivers/gpu/drm/i915/gt/intel_ring_submission.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_rps.o
  CC [M]  drivers/gpu/drm/drm_property.o
  CC [M]  drivers/net/ethernet/intel/e1000e/netdev.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.o
  CC [M]  drivers/gpu/drm/xe/xe_pt_walk.o
  CC [M]  drivers/gpu/drm/xe/xe_query.o
  CC [M]  drivers/gpu/drm/drm_syncobj.o
  CC [M]  drivers/gpu/drm/drm_sysfs.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_ptp.o
  CC [M]  drivers/net/ethernet/intel/e1000e/ptp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_rap.o
  LD [M]  drivers/vhost/vhost_net.o
  CC      fs/btrfs/ulist.o
  CC [M]  drivers/gpu/drm/xe/xe_range_fence.o
  CC      fs/btrfs/qgroup.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/bit.o
  LD [M]  drivers/vhost/vhost_iotlb.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_xsk.o
  LD [M]  drivers/vfio/vfio.o
  AR      drivers/net/ethernet/smsc/built-in.a
  AR      drivers/net/ethernet/socionext/built-in.a
  CC [M]  drivers/net/ethernet/smsc/smsc9420.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_ptp.o
  AR      drivers/net/ethernet/vertexcom/built-in.a
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb.o
  CC      fs/btrfs/send.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb_82598.o
  CC [M]  drivers/gpu/drm/drm_trace_points.o
  CC [M]  drivers/gpu/drm/drm_vblank.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/boost.o
  AR      drivers/net/ethernet/wangxun/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/conn.o
  AR      drivers/net/ethernet/xilinx/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/cstep.o
  CC      fs/posix_acl.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/dcb.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_sr.o
  CC      drivers/acpi/container.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/disp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/dp.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_whitelist.o
  CC [M]  drivers/gpu/drm/drm_vblank_work.o
  CC      fs/btrfs/dev-replace.o
  CC      drivers/acpi/thermal_lib.o
  CC      fs/btrfs/raid56.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb_82599.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_sa_media.o
  AR      drivers/net/ethernet/synopsys/built-in.a
  LD [M]  drivers/net/ethernet/intel/igb/igb.o
  AR      drivers/net/ethernet/pensando/built-in.a
  CC [M]  drivers/gpu/drm/i915/gt/intel_sseu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/extdev.o
  CC      fs/btrfs/uuid-tree.o
  CC      fs/btrfs/props.o
  CC [M]  drivers/gpu/drm/drm_vma_manager.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/fan.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/gpio.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.o
  CC [M]  drivers/gpu/drm/drm_writeback.o
  CC      fs/coredump.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_dump.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/i2c.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/image.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_sseu_debugfs.o
  CC      fs/btrfs/free-space-tree.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_timeline.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_dcb_nl.o
  CC [M]  drivers/gpu/drm/xe/xe_rtp.o
  CC      drivers/acpi/thermal.o
  CC [M]  drivers/gpu/drm/lib/drm_random.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.o
  CC      drivers/acpi/acpi_memhotplug.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_sysfs.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_debugfs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/mxm.o
  CC [M]  drivers/gpu/drm/drm_ioc32.o
  CC [M]  drivers/net/ethernet/intel/ixgbe/ixgbe_ipsec.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_mca.o
  CC      drivers/acpi/ioapic.o
  CC      drivers/acpi/battery.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_tsn.o
  CC      drivers/acpi/hed.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.o
  CC [M]  drivers/net/ethernet/intel/igc/igc_xdp.o
  CC [M]  drivers/gpu/drm/drm_panel.o
  CC [M]  drivers/gpu/drm/drm_pci.o
  CC      fs/drop_caches.o
  CC      fs/btrfs/tree-checker.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_tlb.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_wopcm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/npde.o
  CC      fs/btrfs/space-info.o
  CC [M]  drivers/gpu/drm/drm_debugfs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/pcir.o
  LD [M]  drivers/net/ethernet/realtek/r8169.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/perf.o
  CC      drivers/acpi/bgrt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_lsdma.o
  CC      fs/btrfs/block-rsv.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.o
  CC      fs/sysctls.o
  CC [M]  drivers/gpu/drm/xe/xe_ring_ops.o
  CC      fs/btrfs/delalloc-space.o
  CC [M]  drivers/gpu/drm/xe/xe_sa.o
  CC [M]  drivers/gpu/drm/drm_debugfs_crc.o
  CC      fs/btrfs/block-group.o
  CC [M]  drivers/gpu/drm/drm_edid_load.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.o
  CC      fs/fhandle.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.o
  CC [M]  drivers/gpu/drm/drm_panel_orientation_quirks.o
  CC      fs/btrfs/discard.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/power_budget.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_workarounds.o
  CC [M]  drivers/gpu/drm/drm_exec.o
  CC [M]  drivers/gpu/drm/drm_gpuvm.o
  CC [M]  drivers/gpu/drm/drm_buddy.o
  CC [M]  drivers/gpu/drm/drm_gem_shmem_helper.o
  CC [M]  drivers/gpu/drm/drm_suballoc.o
  CC [M]  drivers/gpu/drm/drm_gem_ttm_helper.o
  CC [M]  drivers/gpu/drm/drm_atomic_helper.o
  CC      drivers/acpi/cppc_acpi.o
  CC      drivers/acpi/spcr.o
  CC [M]  drivers/gpu/drm/drm_atomic_state_helper.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/ramcfg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.o
  CC [M]  drivers/gpu/drm/xe/xe_sched_job.o
  LD [M]  drivers/net/ethernet/intel/igc/igc.o
  CC [M]  drivers/gpu/drm/i915/gt/shmem_utils.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/rammap.o
  CC      fs/btrfs/reflink.o
  CC [M]  drivers/gpu/drm/i915/gt/sysfs_engines.o
  CC      drivers/acpi/acpi_pad.o
  CC [M]  drivers/gpu/drm/drm_bridge_connector.o
  CC      fs/btrfs/subpage.o
  CC [M]  drivers/gpu/drm/drm_crtc_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_step.o
  CC [M]  drivers/gpu/drm/drm_damage_helper.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/cik.o
  CC [M]  drivers/gpu/drm/xe/xe_sync.o
  CC      fs/btrfs/tree-mod-log.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_ggtt_gmch.o
  LD [M]  drivers/net/ethernet/intel/ixgbe/ixgbe.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowacpi.o
  CC [M]  drivers/gpu/drm/xe/xe_tile.o
  CC [M]  drivers/gpu/drm/i915/gt/gen6_renderstate.o
  CC [M]  drivers/gpu/drm/drm_encoder_slave.o
  CC      fs/btrfs/extent-io-tree.o
  CC [M]  drivers/gpu/drm/drm_flip_work.o
  CC [M]  drivers/gpu/drm/i915/gt/gen7_renderstate.o
  CC [M]  drivers/gpu/drm/drm_format_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/cik_ih.o
  CC      fs/btrfs/fs.o
  CC [M]  drivers/gpu/drm/drm_gem_atomic_helper.o
  CC [M]  drivers/acpi/acpi_video.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/dce_v8_0.o
  CC [M]  drivers/gpu/drm/drm_gem_framebuffer_helper.o
  CC      fs/btrfs/messages.o
  CC [M]  drivers/gpu/drm/drm_kms_helper_common.o
  CC      fs/btrfs/bio.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.o
  CC [M]  drivers/gpu/drm/drm_modeset_helper.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.o
  CC      fs/btrfs/lru_cache.o
  LD [M]  drivers/net/ethernet/intel/e1000e/e1000e.o
  CC [M]  drivers/gpu/drm/drm_plane_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.o
  CC [M]  drivers/gpu/drm/drm_probe_helper.o
  AR      drivers/net/ethernet/built-in.a
  CC [M]  drivers/gpu/drm/i915/gt/gen8_renderstate.o
  CC [M]  drivers/gpu/drm/drm_rect.o
  AR      drivers/net/built-in.a
  CC [M]  drivers/gpu/drm/drm_self_refresh_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_tile_sysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_trace.o
  CC [M]  drivers/acpi/video_detect.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/cik_sdma.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/uvd_v4_2.o
  CC      fs/btrfs/raid-stripe-tree.o
  CC [M]  drivers/gpu/drm/drm_simple_kms_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_sys_mgr.o
  CC [M]  drivers/gpu/drm/bridge/panel.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowramin.o
  CC [M]  drivers/gpu/drm/i915/gt/gen9_renderstate.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vce_v2_0.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_busy.o
  CC [M]  drivers/gpu/drm/drm_fbdev_generic.o
  CC      fs/btrfs/acl.o
  CC [M]  drivers/gpu/drm/drm_fb_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_clflush.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_context.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_create.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_vram_mgr.o
  LD [M]  drivers/gpu/drm/drm.o
  CC [M]  drivers/gpu/drm/xe/xe_tuning.o
  LD [M]  drivers/gpu/drm/drm_shmem_helper.o
  LD [M]  drivers/gpu/drm/drm_suballoc_helper.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.o
  LD [M]  drivers/gpu/drm/drm_ttm_helper.o
  AR      drivers/gpu/drm/built-in.a
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_domain.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_internal.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_lmem.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_mman.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/timing.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/therm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/si.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v6_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v6_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/si_ih.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/si_dma.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/vmap.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/dce_v6_0.o
  CC [M]  drivers/gpu/drm/xe/xe_uc.o
  CC [M]  drivers/gpu/drm/xe/xe_uc_debugfs.o
  AR      drivers/acpi/built-in.a
  CC [M]  drivers/gpu/drm/amd/amdgpu/uvd_v3_1.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mxgpu_vi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v6_1.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/soc15.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/emu_soc.o
  CC [M]  drivers/gpu/drm/xe/xe_uc_fw.o
  LD [M]  drivers/acpi/video.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mxgpu_ai.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/volt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vega10_reg_init.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_object.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_pages.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_phys.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_pm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vega20_reg_init.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_4.o
  CC [M]  drivers/gpu/drm/xe/xe_vm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/vpstate.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/xpio.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_region.o
  AR      fs/btrfs/built-in.a
  AR      fs/built-in.a
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/M0203.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/M0205.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/M0209.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bios/P0260.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/base.o
  CC [M]  drivers/gpu/drm/xe/xe_vram_freq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v2_3.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_shmem.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_shrinker.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nv.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/hwsq.o
  LD [M]  drivers/gpu/drm/drm_kms_helper.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_stolen.o
  CC [M]  drivers/gpu/drm/xe/xe_wait_user_fence.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/arct_reg_init.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_throttle.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mxgpu_nv.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_tiling.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_2.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v4_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v5_0.o
  CC [M]  drivers/gpu/drm/xe/xe_wa.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/aldebaran_reg_init.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/aldebaran.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/soc21.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sienna_cichlid.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/g94.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.o
  CC [M]  drivers/gpu/drm/xe/xe_wopcm.o
  CC [M]  drivers/gpu/drm/xe/xe_hwmon.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v4_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv04.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_relay.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v6_0.o
  CC [M]  drivers/gpu/drm/xe/xe_memirq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_7.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/hdp_v5_2.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv40.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/lsdma_v6_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_9.o
  CC [M]  drivers/gpu/drm/xe/xe_sriov.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/nbio_v7_11.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_ttm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/df_v1_7.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/df_v3_6.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/g84.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/df_v4_3.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/df_v4_6_2.o
  CC [M]  drivers/gpu/drm/xe/xe_lmtt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v7_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.o
  CC [M]  drivers/gpu/drm/xe/xe_lmtt_2l.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_userptr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gem_wait.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.o
  CC [M]  drivers/gpu/drm/xe/xe_lmtt_ml.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.o
  CC [M]  drivers/gpu/drm/xe/xe_display.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gf100.o
  CC [M]  drivers/gpu/drm/xe/display/xe_fb_pin.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.o
  CC [M]  drivers/gpu/drm/i915/gem/i915_gemfs.o
  CC [M]  drivers/gpu/drm/xe/display/xe_hdcp_gsc.o
  CC [M]  drivers/gpu/drm/xe/display/xe_plane_initial.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.o
  CC [M]  drivers/gpu/drm/i915/i915_active.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.o
  CC [M]  drivers/gpu/drm/i915/i915_cmd_parser.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_rps.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_misc.o
  CC [M]  drivers/gpu/drm/xe/display/xe_dsb_buffer.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/pllnv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.o
  CC [M]  drivers/gpu/drm/i915/i915_deps.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.o
  CC [M]  drivers/gpu/drm/i915/i915_gem.o
  CC [M]  drivers/gpu/drm/i915/i915_gem_evict.o
  CC [M]  drivers/gpu/drm/xe/display/intel_fbdev_fb.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.o
  CC [M]  drivers/gpu/drm/i915/i915_gem_gtt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/clk/pllgt215.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.o
  CC [M]  drivers/gpu/drm/xe/display/intel_fb_bo.o
  CC [M]  drivers/gpu/drm/i915/i915_gem_ww.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv04.o
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_irq.o
  CC [M]  drivers/gpu/drm/i915/i915_query.o
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_utils.o
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_dram.o
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_pch.o
  CC [M]  drivers/gpu/drm/xe/i915-display/icl_dsi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv05.o
  CC [M]  drivers/gpu/drm/i915/i915_request.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic_plane.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfxhub_v11_5_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv10.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v6_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v6_1.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_audio.o
  CC [M]  drivers/gpu/drm/i915/i915_scheduler.o
  CC [M]  drivers/gpu/drm/i915/i915_trace_points.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v6_7.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_backlight.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v8_7.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv1a.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv20.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v8_10.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umc_v12_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g84.o
  CC [M]  drivers/gpu/drm/i915/i915_ttm_buddy_manager.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bios.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ih.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/iceland_ih.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/tonga_ih.o
  CC [M]  drivers/gpu/drm/i915/i915_vma.o
  CC [M]  drivers/gpu/drm/i915/i915_vma_resource.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cdclk.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/cz_ih.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vega10_ih.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_color.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vega20_ih.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/navi10_ih.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_combo_phy.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/mcp89.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/ih_v6_0.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/ih_v6_1.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v3_1.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v10_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v11_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v11_0_8.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v12_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gv100.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_capture.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_connector.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v13_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/dce_v10_0.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/ga100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/dce_v11_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v8_0.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v9_4.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp100.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_log.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp10b.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc_state_dump.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fault/tu102.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cursor.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/imu_v11_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cx0_phy.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv10.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv1a.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_huc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv20.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi_buf_trans.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv25.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v4_4.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_huc_fw.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_uc.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.o
  CC [M]  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.o
  CC [M]  drivers/gpu/drm/i915/gt/intel_gsc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv30.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs_params.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.o
  CC [M]  drivers/gpu/drm/i915/i915_hwmon.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv35.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv36.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv40.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv41.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_device.o
  CC [M]  drivers/gpu/drm/i915/display/hsw_ips.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv44.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_driver.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mes_v10_1.o
  CC [M]  drivers/gpu/drm/i915/display/i9xx_plane.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mes_v11_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv46.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv47.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/uvd_v5_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_irq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.o
  CC [M]  drivers/gpu/drm/i915/display/i9xx_wm.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_params.o
  CC [M]  drivers/gpu/drm/i915/display/intel_atomic.o
  CC [M]  drivers/gpu/drm/i915/display/intel_atomic_plane.o
  CC [M]  drivers/gpu/drm/i915/display/intel_audio.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv49.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_map.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vce_v3_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_bios.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv4e.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vce_v4_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/g84.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_well.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_trace.o
  CC [M]  drivers/gpu/drm/i915/display/intel_bw.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gt215.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_sw_ring.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/mcp77.o
  CC [M]  drivers/gpu/drm/i915/display/intel_cdclk.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_wa.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dkl_phy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v1_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dmc.o
  CC [M]  drivers/gpu/drm/i915/display/intel_color.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/mcp89.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v2_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v2_5.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v3_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v4_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp.o
  CC [M]  drivers/gpu/drm/i915/display/intel_combo_phy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_aux.o
  CC [M]  drivers/gpu/drm/i915/display/intel_connector.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_aux_backlight.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_hdcp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.o
  CC [M]  drivers/gpu/drm/i915/display/intel_crtc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_link_training.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_crtc_state_dump.o
  CC [M]  drivers/gpu/drm/i915/display/intel_cursor.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_mst.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpll.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm20b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpll_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/vpe_v6_1.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp10b.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpt_common.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_drrs.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_driver.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_irq.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsb.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_params.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_power.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_power_map.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_power_well.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_dcs_backlight.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/athub_v1_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/athub_v2_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/athub_v2_1.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/athub_v3_0.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_reset.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_rps.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/r535.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_wa.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dmc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v9_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_vbt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v11_0.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dpio_phy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v11_0_6.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v13_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fb.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fbc.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dpll.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v13_0_3.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/smuio_v13_0_6.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fdi.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dpll_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv04.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fifo_underrun.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv10.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv1a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/mca_v3_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dpt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_module.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_frontbuffer.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv20.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_global_state.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_gmbus.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dpt_common.o
  CC [M]  drivers/gpu/drm/i915/display/intel_drrs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_pasid.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dsb.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_doorbell.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_flat_memory.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dsb_buffer.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdcp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv40.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdmi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fb.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv41.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv44.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hotplug.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fb_bo.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv49.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_cik.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fb_pin.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv4e.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_vi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v9.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v10.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fbc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hotplug_irq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v11.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fdi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_kernel_queue.o
  CC [M]  drivers/gpu/drm/i915/display/intel_fifo_underrun.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hti.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_link_bw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_lspcon.o
  CC [M]  drivers/gpu/drm/i915/display/intel_frontbuffer.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager_vi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_lock.o
  CC [M]  drivers/gpu/drm/i915/display/intel_global_state.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager_v9.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process_queue_manager.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hdcp.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hdcp_gsc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/rammcp77.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hotplug.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_cik.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_setup.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_vi.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hotplug_irq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_v9.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hti.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_v10.o
  CC [M]  drivers/gpu/drm/i915/display/intel_link_bw.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager_v11.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_verify.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_panel.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_interrupt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_events.o
  CC [M]  drivers/gpu/drm/i915/display/intel_load_detect.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/cik_event_interrupt.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pipe_crc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pmdemand.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v10.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v11.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_smi_events.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debug.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pps.o
  CC [M]  drivers/gpu/drm/i915/display/intel_lpe_audio.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debugfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.o
  CC [M]  drivers/gpu/drm/i915/display/intel_modeset_lock.o
  CC [M]  drivers/gpu/drm/i915/display/intel_modeset_setup.o
  CC [M]  drivers/gpu/drm/i915/display/intel_modeset_verify.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_psr.o
  CC [M]  drivers/gpu/drm/i915/display/intel_overlay.o
  CC [M]  drivers/gpu/drm/i915/display/intel_pch_display.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_qp_tables.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.o
  CC [M]  drivers/gpu/drm/i915/display/intel_pch_refclk.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_quirks.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_snps_phy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_tc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.o
  CC [M]  drivers/gpu/drm/i915/display/intel_plane_initial.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vblank.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.o
  CC [M]  drivers/gpu/drm/i915/display/intel_pmdemand.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr2.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr3.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr3.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vdsc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr5.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fuse/base.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vga.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_job.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_acp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../acp/acp_hw.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fuse/nv50.o
  CC [M]  drivers/gpu/drm/i915/display/intel_psr.o
  CC [M]  drivers/gpu/drm/i915/display/intel_quirks.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vrr.o
  CC [M]  drivers/gpu/drm/i915/display/intel_sprite.o
  CC [M]  drivers/gpu/drm/i915/display/intel_sprite_uapi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_wm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ioc32.o
  CC [M]  drivers/gpu/drm/i915/display/intel_tc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fuse/gf100.o
  CC [M]  drivers/gpu/drm/i915/display/intel_vblank.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_scaler.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/fuse/gm107.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/arcturus_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/navi10_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/nv10.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_universal_plane.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_watermark.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_acpi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_opregion.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/nv50.o
  CC [M]  drivers/gpu/drm/i915/display/intel_vga.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/cyan_skillfish_ppt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/g94.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fbdev.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gf119.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu12/renoir_ppt.o
  CC [M]  drivers/gpu/drm/i915/display/intel_wm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu12/smu_v12_0.o
  CC [M]  drivers/gpu/drm/i915/display/skl_scaler.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/aldebaran_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/yellow_carp_ppt.o
  CC [M]  drivers/gpu/drm/xe/tests/xe_kunit_helpers.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_4_ppt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/ga102.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc.o
  CC [M]  drivers/gpu/drm/i915/display/skl_universal_plane.o
  CC [M]  drivers/gpu/drm/xe/xe_guc.o
  HDRTEST drivers/gpu/drm/xe/abi/gsc_proxy_commands_abi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_klvs_abi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.o
  HDRTEST drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_5_ppt.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_errors_abi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_0_ppt.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.o
  HDRTEST drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_relay_communication_abi.h
  HDRTEST drivers/gpu/drm/xe/abi/guc_communication_mmio_abi.h
  CC [M]  drivers/gpu/drm/i915/display/skl_watermark.o
  CC [M]  drivers/gpu/drm/i915/display/intel_acpi.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_abi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
  CC [M]  drivers/gpu/drm/i915/display/intel_opregion.o
  HDRTEST drivers/gpu/drm/xe/abi/guc_messages_abi.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smumgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv04.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu8_smumgr.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h
  CC [M]  drivers/gpu/drm/i915/display/intel_fbdev.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv4e.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h
  CC [M]  drivers/gpu/drm/i915/display/intel_fbdev_fb.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/tonga_smumgr.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_debugfs.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/g94.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/fiji_smumgr.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_trace.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gf117.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/polaris10_smumgr.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gf119.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gk110.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vega10_smumgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/pad.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_active_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu10_smumgr.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h
  CC [M]  drivers/gpu/drm/i915/display/intel_display_debugfs_params.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_config.h
  CC [M]  drivers/gpu/drm/i915/display/intel_pipe_crc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/ci_smumgr.o
  CC [M]  drivers/gpu/drm/i915/display/dvo_ch7017.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vega12_smumgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padnv04.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vegam_smumgr.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_debugfs.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
  CC [M]  drivers/gpu/drm/i915/display/dvo_ch7xxx.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu9_smumgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vega20_smumgr.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/hwmgr.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/soc/intel_gmch.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padnv4e.o
  CC [M]  drivers/gpu/drm/i915/display/dvo_ivch.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padnv50.o
  CC [M]  drivers/gpu/drm/i915/display/dvo_ns2501.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/processpptables.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/hardwaremanager.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu8_hwmgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/pppcielanes.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/process_pptables_v1_0.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomctrl.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.o
  CC [M]  drivers/gpu/drm/i915/display/dvo_sil164.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppatomfwctrl.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv4e.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
  CC [M]  drivers/gpu/drm/i915/display/dvo_tfp410.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_powertune.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.o
  CC [M]  drivers/gpu/drm/i915/display/g4x_dp.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bit.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_thermal.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mman.h
  CC [M]  drivers/gpu/drm/i915/display/g4x_hdmi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_clockpowergating.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.o
  CC [M]  drivers/gpu/drm/i915/display/icl_dsi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_powertune.o
  CC [M]  drivers/gpu/drm/i915/display/intel_backlight.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_thermal.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu10_hwmgr.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
  CC [M]  drivers/gpu/drm/i915/display/intel_crt.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/pp_psm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/gt/intel_rps.h
  CC [M]  drivers/gpu/drm/i915/display/intel_cx0_phy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_processpptables.o
  CC [M]  drivers/gpu/drm/i915/display/intel_ddi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_hwmgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_thermal.o
  CC [M]  drivers/gpu/drm/i915/display/intel_ddi_buf_trans.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/pp_overdriver.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu_helper.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/intel_gt_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/gf100.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_processpptables.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_hwmgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.o
  CC [M]  drivers/gpu/drm/i915/display/intel_display_device.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv04.o
  HDRTEST drivers/gpu/drm/xe/compat-i915-headers/i915_active.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_powertune.o
  HDRTEST drivers/gpu/drm/xe/display/intel_fb_bo.h
  CC [M]  drivers/gpu/drm/i915/display/intel_display_trace.o
  HDRTEST drivers/gpu/drm/xe/display/intel_fbdev_fb.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv40.o
  HDRTEST drivers/gpu/drm/xe/instructions/xe_instr_defs.h
  HDRTEST drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_thermal.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/common_baco.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dkl_phy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_baco.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_baco.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_baco.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dp_aux.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu9_baco.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/tonga_baco.o
  HDRTEST drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.o
  HDRTEST drivers/gpu/drm/xe/instructions/xe_mi_commands.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/polaris_baco.o
  HDRTEST drivers/gpu/drm/xe/regs/xe_gsc_regs.h
  CC [M]  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.o
  HDRTEST drivers/gpu/drm/xe/regs/xe_reg_defs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/fiji_baco.o
  HDRTEST drivers/gpu/drm/xe/regs/xe_guc_regs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_gt_regs.h
  HDRTEST drivers/gpu/drm/xe/regs/xe_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ci_baco.o
  HDRTEST drivers/gpu/drm/xe/regs/xe_gpu_commands.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gf100.o
  HDRTEST drivers/gpu/drm/xe/regs/xe_sriov_regs.h
  CC [M]  drivers/gpu/drm/i915/display/intel_dp_hdcp.o
  HDRTEST drivers/gpu/drm/xe/regs/xe_lrc_layout.h
  CC [M]  drivers/gpu/drm/i915/display/intel_dp_link_training.o
  HDRTEST drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
  CC [M]  drivers/gpu/drm/i915/display/intel_dp_mst.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_baco.o
  HDRTEST drivers/gpu/drm/xe/regs/xe_engine_regs.h
  HDRTEST drivers/gpu/drm/xe/tests/xe_test.h
  CC [M]  drivers/gpu/drm/i915/display/intel_dsi.o
  HDRTEST drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gm107.o
  HDRTEST drivers/gpu/drm/xe/tests/xe_pci_test.h
  HDRTEST drivers/gpu/drm/xe/tests/xe_migrate_test.h
  HDRTEST drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/amd_powerplay.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/legacy_dpm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_smc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_smc.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dsi_vbt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.o
  CC [M]  drivers/gpu/drm/i915/display/intel_dvo.o
  CC [M]  drivers/gpu/drm/i915/display/intel_gmbus.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm_internal.o
  CC [M]  drivers/gpu/drm/i915/display/intel_hdmi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp100.o
  HDRTEST drivers/gpu/drm/xe/tests/xe_mocs_test.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp102.o
  HDRTEST drivers/gpu/drm/xe/tests/xe_bo_test.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.o
  HDRTEST drivers/gpu/drm/xe/xe_assert.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.o
  CC [M]  drivers/gpu/drm/i915/display/intel_lspcon.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/ltc/ga102.o
  HDRTEST drivers/gpu/drm/xe/xe_bb.h
  HDRTEST drivers/gpu/drm/xe/xe_bb_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.o
  HDRTEST drivers/gpu/drm/xe/xe_bo.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crtc.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.o
  CC [M]  drivers/gpu/drm/i915/display/intel_lvds.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv04.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv11.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv17.o
  CC [M]  drivers/gpu/drm/i915/display/intel_panel.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv44.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_services.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o
  CC [M]  drivers/gpu/drm/i915/display/intel_pps.o
  CC [M]  drivers/gpu/drm/i915/display/intel_qp_tables.o
  HDRTEST drivers/gpu/drm/xe/xe_bo_doc.h
  HDRTEST drivers/gpu/drm/xe/xe_bo_evict.h
  HDRTEST drivers/gpu/drm/xe/xe_bo_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_pp_smu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_psr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/g84.o
  CC [M]  drivers/gpu/drm/i915/display/intel_sdvo.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_replay.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/g98.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gt215.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gf100.o
  CC [M]  drivers/gpu/drm/i915/display/intel_snps_phy.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_wb.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.o
  CC [M]  drivers/gpu/drm/i915/display/intel_tv.o
  HDRTEST drivers/gpu/drm/xe/xe_debugfs.h
  CC [M]  drivers/gpu/drm/i915/display/intel_vdsc.o
  HDRTEST drivers/gpu/drm/xe/xe_devcoredump.h
  CC [M]  drivers/gpu/drm/i915/display/intel_vrr.o
  HDRTEST drivers/gpu/drm/xe/xe_devcoredump_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gk20a.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp100.o
  HDRTEST drivers/gpu/drm/xe/xe_device.h
  CC [M]  drivers/gpu/drm/i915/display/vlv_dsi.o
  CC [M]  drivers/gpu/drm/i915/display/vlv_dsi_pll.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp10b.o
  CC [M]  drivers/gpu/drm/i915/i915_perf.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_hdcp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.o
  HDRTEST drivers/gpu/drm/xe/xe_device_sysfs.h
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp.o
  HDRTEST drivers/gpu/drm/xe/xe_device_types.h
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_huc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/conversion.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/fixpt31_32.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/vector.o
  HDRTEST drivers/gpu/drm/xe/xe_display.h
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_tee.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dce_calcs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv04.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv41.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_cmd.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv44.o
  HDRTEST drivers/gpu/drm/xe/xe_dma_buf.h
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/custom_float.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/bw_fixed.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser_interface.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_irq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/g84.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mcp77.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser_common.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_pm.o
  CC [M]  drivers/gpu/drm/i915/pxp/intel_pxp_session.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.o
  HDRTEST drivers/gpu/drm/xe/xe_drm_client.h
  CC [M]  drivers/gpu/drm/i915/i915_gpu_error.o
  CC [M]  drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table_helper2.o
  HDRTEST drivers/gpu/drm/xe/xe_drv.h
  HDRTEST drivers/gpu/drm/xe/xe_exec.h
  CC [M]  drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.o
  CC [M]  drivers/gpu/drm/i915/selftests/i915_random.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.o
  HDRTEST drivers/gpu/drm/xe/xe_exec_queue.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce60/command_table_helper_dce60.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce80/command_table_helper_dce80.o
  CC [M]  drivers/gpu/drm/i915/selftests/i915_selftest.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce110/command_table_helper_dce110.o
  CC [M]  drivers/gpu/drm/i915/selftests/igt_atomic.o
  CC [M]  drivers/gpu/drm/i915/selftests/igt_flush_test.o
  HDRTEST drivers/gpu/drm/xe/xe_exec_queue_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk20a.o
  CC [M]  drivers/gpu/drm/i915/selftests/igt_live_test.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm20b.o
  HDRTEST drivers/gpu/drm/xe/xe_execlist.h
  HDRTEST drivers/gpu/drm/xe/xe_execlist_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce112/command_table_helper_dce112.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/bios/dce112/command_table_helper2_dce112.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
  CC [M]  drivers/gpu/drm/i915/selftests/igt_mmap.o
  HDRTEST drivers/gpu/drm/xe/xe_force_wake.h
  HDRTEST drivers/gpu/drm/xe/xe_force_wake_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.o
  CC [M]  drivers/gpu/drm/i915/selftests/igt_reset.o
  CC [M]  drivers/gpu/drm/i915/selftests/igt_spinner.o
  CC [M]  drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn10/dcn10_fpu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/dcn20_fpu.o
  CC [M]  drivers/gpu/drm/i915/selftests/librapl.o
  HDRTEST drivers/gpu/drm/xe/xe_ggtt.h
  HDRTEST drivers/gpu/drm/xe/xe_ggtt_types.h
  HDRTEST drivers/gpu/drm/xe/xe_gpu_scheduler.h
  CC [M]  drivers/gpu/drm/i915/i915_vgpu.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dkl_phy_regs.h
  HDRTEST drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gp100.o
  HDRTEST drivers/gpu/drm/xe/xe_gsc.h
  HDRTEST drivers/gpu/drm/xe/xe_gsc_proxy.h
  HDRTEST drivers/gpu/drm/i915/display/intel_crtc_state_dump.h
  HDRTEST drivers/gpu/drm/xe/xe_gsc_submit.h
  HDRTEST drivers/gpu/drm/i915/display/hsw_ips.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gp10b.o
  HDRTEST drivers/gpu/drm/i915/display/g4x_hdmi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gv100.o
  HDRTEST drivers/gpu/drm/i915/display/intel_hdcp_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.o
  HDRTEST drivers/gpu/drm/i915/display/intel_overlay.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_vba.o
  HDRTEST drivers/gpu/drm/xe/xe_gsc_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_display.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mem.o
  HDRTEST drivers/gpu/drm/i915/display/skl_watermark_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dmc.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv04.o
  HDRTEST drivers/gpu/drm/xe/xe_gt.h
  HDRTEST drivers/gpu/drm/i915/display/intel_vga.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memgf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.o
  HDRTEST drivers/gpu/drm/i915/display/intel_audio.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_ccs_mode.h
  HDRTEST drivers/gpu/drm/i915/display/intel_lvds.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_clock.h
  HDRTEST drivers/gpu/drm/i915/display/intel_modeset_setup.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_debugfs.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_freq.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_idle.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_idle_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_cdclk.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_mcr.h
  HDRTEST drivers/gpu/drm/i915/display/intel_display_limits.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_pagefault.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/dcn30_fpu.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_printk.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sriov_printk.h
  HDRTEST drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.h
  HDRTEST drivers/gpu/drm/i915/display/intel_hotplug.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sysfs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv04.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dkl_phy.h
  HDRTEST drivers/gpu/drm/i915/display/intel_atomic.h
  HDRTEST drivers/gpu/drm/i915/display/intel_color_regs.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_sysfs_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_display_driver.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dpll.h
  HDRTEST drivers/gpu/drm/i915/display/vlv_dsi_pll_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dp_mst.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv41.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.o
  HDRTEST drivers/gpu/drm/i915/display/intel_fdi_regs.h
  HDRTEST drivers/gpu/drm/i915/display/g4x_dp.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
  HDRTEST drivers/gpu/drm/xe/xe_gt_topology.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv44.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.o
  HDRTEST drivers/gpu/drm/i915/display/intel_tc.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmmcp77.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_params.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk104.o
  HDRTEST drivers/gpu/drm/xe/xe_gt_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_ads.h
  HDRTEST drivers/gpu/drm/i915/display/intel_frontbuffer.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_ads_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_ct.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_32.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_ct_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dsi_vbt.h
  HDRTEST drivers/gpu/drm/i915/display/intel_psr.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.o
  HDRTEST drivers/gpu/drm/i915/display/intel_crt.h
  HDRTEST drivers/gpu/drm/i915/display/intel_opregion.h
  HDRTEST drivers/gpu/drm/i915/display/intel_snps_phy_regs.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_db_mgr.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgv100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/dcn31_fpu.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_debugfs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.o
  HDRTEST drivers/gpu/drm/i915/display/i9xx_wm.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_fwif.h
  HDRTEST drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
  HDRTEST drivers/gpu/drm/i915/display/intel_global_state.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_hwconfig.h
  HDRTEST drivers/gpu/drm/i915/display/intel_lpe_audio.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_hxg_helpers.h
  HDRTEST drivers/gpu/drm/i915/display/intel_drrs.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_log.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_log_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn321/dcn321_fpu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn301/dcn301_fpu.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dsb_buffer.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn302/dcn302_fpu.o
  HDRTEST drivers/gpu/drm/xe/xe_guc_pc.h
  HDRTEST drivers/gpu/drm/i915/display/intel_display_rps.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_pc_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_relay.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_relay_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_submit.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_submit_types.h
  HDRTEST drivers/gpu/drm/xe/xe_guc_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn303/dcn303_fpu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/dcn314_fpu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.o
  HDRTEST drivers/gpu/drm/xe/xe_heci_gsc.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn35/dcn35_fpu.o
  HDRTEST drivers/gpu/drm/xe/xe_huc.h
  HDRTEST drivers/gpu/drm/xe/xe_huc_debugfs.h
  HDRTEST drivers/gpu/drm/xe/xe_huc_types.h
  HDRTEST drivers/gpu/drm/xe/xe_hw_engine.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.o
  HDRTEST drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calcs.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.o
  HDRTEST drivers/gpu/drm/xe/xe_hw_engine_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mxm/mxms.o
  HDRTEST drivers/gpu/drm/i915/display/intel_fbdev.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mxm/nv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/agp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_math.o
  HDRTEST drivers/gpu/drm/i915/display/intel_pps_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.o
  HDRTEST drivers/gpu/drm/i915/display/intel_hdmi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.o
  HDRTEST drivers/gpu/drm/xe/xe_hw_fence.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv04.o
  HDRTEST drivers/gpu/drm/i915/display/intel_fdi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv40.o
  HDRTEST drivers/gpu/drm/xe/xe_hw_fence_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_fb.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv46.o
  HDRTEST drivers/gpu/drm/xe/xe_hwmon.h
  HDRTEST drivers/gpu/drm/xe/xe_irq.h
  HDRTEST drivers/gpu/drm/i915/display/intel_qp_tables.h
  HDRTEST drivers/gpu/drm/xe/xe_lmtt.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dsb_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv4c.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_vdsc.h
  HDRTEST drivers/gpu/drm/xe/xe_lmtt_types.h
  HDRTEST drivers/gpu/drm/xe/xe_lrc.h
  HDRTEST drivers/gpu/drm/i915/display/intel_snps_phy.h
  HDRTEST drivers/gpu/drm/i915/display/intel_display_core.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce60/dce60_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/display/vlv_dsi_pll.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce100/dce_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/g84.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dvo_dev.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce110/dce110_clk_mgr.o
  HDRTEST drivers/gpu/drm/xe/xe_lrc_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_hdcp.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce112/dce112_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_sdvo_regs.h
  HDRTEST drivers/gpu/drm/xe/xe_macros.h
  HDRTEST drivers/gpu/drm/i915/display/intel_pch_refclk.h
  HDRTEST drivers/gpu/drm/xe/xe_map.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/g92.o
  HDRTEST drivers/gpu/drm/i915/display/intel_modeset_lock.h
  HDRTEST drivers/gpu/drm/i915/display/intel_display_trace.h
  HDRTEST drivers/gpu/drm/xe/xe_memirq.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce120/dce120_clk_mgr.o
  HDRTEST drivers/gpu/drm/xe/xe_memirq_types.h
  HDRTEST drivers/gpu/drm/xe/xe_migrate.h
  HDRTEST drivers/gpu/drm/i915/display/intel_display_power.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/g94.o
  HDRTEST drivers/gpu/drm/xe/xe_migrate_doc.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn10/rv1_clk_mgr.o
  HDRTEST drivers/gpu/drm/xe/xe_mmio.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn10/rv2_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dp_aux_regs.h
  HDRTEST drivers/gpu/drm/i915/display/i9xx_plane.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dp_aux_backlight.h
  HDRTEST drivers/gpu/drm/xe/xe_mocs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf100.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dpll_mgr.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn20/dcn20_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf106.o
  HDRTEST drivers/gpu/drm/i915/display/vlv_dsi.h
  HDRTEST drivers/gpu/drm/i915/display/intel_plane_initial.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gp100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.o
  HDRTEST drivers/gpu/drm/xe/xe_module.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/memx.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn201/dcn201_clk_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21/rn_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gt215.o
  HDRTEST drivers/gpu/drm/xe/xe_pat.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gf100.o
  HDRTEST drivers/gpu/drm/xe/xe_pci.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gf119.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk110.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk208.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_device.h
  HDRTEST drivers/gpu/drm/xe/xe_pci_types.h
  HDRTEST drivers/gpu/drm/xe/xe_pcode.h
  HDRTEST drivers/gpu/drm/xe/xe_pcode_api.h
  HDRTEST drivers/gpu/drm/i915/display/intel_fifo_underrun.h
  HDRTEST drivers/gpu/drm/xe/xe_platform_types.h
  HDRTEST drivers/gpu/drm/xe/xe_pm.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk20a.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.o
  HDRTEST drivers/gpu/drm/i915/display/intel_cursor.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/display/vlv_dsi_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/dcn301_smu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn31/dcn31_smu.o
  HDRTEST drivers/gpu/drm/xe/xe_preempt_fence.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm200.o
  HDRTEST drivers/gpu/drm/xe/xe_preempt_fence_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dpt_common.h
  HDRTEST drivers/gpu/drm/i915/display/intel_cx0_phy.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn31/dcn31_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn314/dcn314_smu.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn314/dcn314_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/display/skl_scaler.h
  HDRTEST drivers/gpu/drm/i915/display/intel_fb_bo.h
  HDRTEST drivers/gpu/drm/xe/xe_pt.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn315/dcn315_smu.o
  HDRTEST drivers/gpu/drm/xe/xe_pt_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_hti.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn315/dcn315_clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn316/dcn316_smu.o
  HDRTEST drivers/gpu/drm/i915/display/icl_dsi_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gf117.o
  HDRTEST drivers/gpu/drm/xe/xe_pt_walk.h
  HDRTEST drivers/gpu/drm/i915/display/intel_atomic_plane.h
  HDRTEST drivers/gpu/drm/i915/display/skl_watermark.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gk104.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gk20a.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gm200.o
  HDRTEST drivers/gpu/drm/i915/display/intel_fbc.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/privring/gp10b.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_reg_defs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.o
  HDRTEST drivers/gpu/drm/i915/display/intel_acpi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fannil.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn316/dcn316_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_connector.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fantog.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dpt.h
  HDRTEST drivers/gpu/drm/i915/display/intel_quirks.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dp_link_training.h
  HDRTEST drivers/gpu/drm/i915/display/intel_color.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/ic.o
  HDRTEST drivers/gpu/drm/xe/xe_query.h
  HDRTEST drivers/gpu/drm/xe/xe_range_fence.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_smu.o
  HDRTEST drivers/gpu/drm/xe/xe_reg_sr.h
  HDRTEST drivers/gpu/drm/i915/display/intel_crtc.h
  HDRTEST drivers/gpu/drm/xe/xe_reg_sr_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_display_debugfs.h
  HDRTEST drivers/gpu/drm/xe/xe_reg_whitelist.h
  HDRTEST drivers/gpu/drm/xe/xe_res_cursor.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/temp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv40.o
  HDRTEST drivers/gpu/drm/i915/display/intel_modeset_verify.h
  HDRTEST drivers/gpu/drm/i915/display/intel_display_power_well.h
  HDRTEST drivers/gpu/drm/xe/xe_ring_ops.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.o
  HDRTEST drivers/gpu/drm/xe/xe_ring_ops_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_audio.o
  HDRTEST drivers/gpu/drm/xe/xe_rtp.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_stream_encoder.o
  HDRTEST drivers/gpu/drm/i915/display/intel_psr_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv50.o
  HDRTEST drivers/gpu/drm/xe/xe_rtp_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_link_encoder.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/g84.o
  HDRTEST drivers/gpu/drm/xe/xe_sa.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.o
  HDRTEST drivers/gpu/drm/i915/display/intel_wm.h
  HDRTEST drivers/gpu/drm/xe/xe_sa_types.h
  HDRTEST drivers/gpu/drm/xe/xe_sched_job.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gt215.o
  HDRTEST drivers/gpu/drm/xe/xe_sched_job_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.o
  HDRTEST drivers/gpu/drm/xe/xe_sriov.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_clock_source.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_scl_filters.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_transform.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gm107.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_opp.o
  HDRTEST drivers/gpu/drm/xe/xe_sriov_printk.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_dmcu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_abm.o
  HDRTEST drivers/gpu/drm/xe/xe_sriov_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_ipp.o
  HDRTEST drivers/gpu/drm/xe/xe_step.h
  HDRTEST drivers/gpu/drm/xe/xe_step_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.o
  HDRTEST drivers/gpu/drm/xe/xe_sync.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c.o
  HDRTEST drivers/gpu/drm/i915/display/intel_pipe_crc.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/base.o
  HDRTEST drivers/gpu/drm/xe/xe_sync_types.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/nv04.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_sw.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/nv40.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/nv41.o
  HDRTEST drivers/gpu/drm/i915/display/intel_audio_regs.h
  HDRTEST drivers/gpu/drm/i915/display/intel_panel.h
  HDRTEST drivers/gpu/drm/i915/display/intel_sprite.h
  HDRTEST drivers/gpu/drm/i915/display/intel_wm_types.h
  HDRTEST drivers/gpu/drm/xe/xe_tile.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/timer/gk20a.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/top/base.o
  HDRTEST drivers/gpu/drm/i915/display/intel_tv.h
  HDRTEST drivers/gpu/drm/xe/xe_tile_sysfs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.o
  HDRTEST drivers/gpu/drm/i915/display/intel_fbdev_fb.h
  HDRTEST drivers/gpu/drm/i915/display/intel_hti_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/base.o
  HDRTEST drivers/gpu/drm/xe/xe_tile_sysfs_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_vrr.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.o
  HDRTEST drivers/gpu/drm/xe/xe_trace.h
  HDRTEST drivers/gpu/drm/i915/display/intel_load_detect.h
  HDRTEST drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/gv100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/tu102.o
  HDRTEST drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
  HDRTEST drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
  HDRTEST drivers/gpu/drm/i915/display/skl_universal_plane.h
  HDRTEST drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_mg_phy_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/ga100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_panel_cntl.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_hw_lock_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gpio.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_outbox.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_replay.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/nv40.o
  HDRTEST drivers/gpu/drm/i915/display/intel_bw.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_base.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gf117.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_irq.h
  HDRTEST drivers/gpu/drm/xe/xe_tuning.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_factory.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_gpio.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_hpd.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_ddc.o
  HDRTEST drivers/gpu/drm/xe/xe_uc.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_generic.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gm20b.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_translate.o
  HDRTEST drivers/gpu/drm/i915/display/intel_de.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce60/hw_translate_dce60.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce60/hw_factory_dce60.o
  HDRTEST drivers/gpu/drm/xe/xe_uc_debugfs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce80/hw_translate_dce80.o
  HDRTEST drivers/gpu/drm/i915/display/intel_lvds_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce80/hw_factory_dce80.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce110/hw_translate_dce110.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce110/hw_factory_dce110.o
  HDRTEST drivers/gpu/drm/i915/display/intel_gmbus_regs.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce120/hw_translate_dce120.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/falcon.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dce120/hw_factory_dce120.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/xtensa.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn10/hw_translate_dcn10.o
  HDRTEST drivers/gpu/drm/xe/xe_uc_fw.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/bsp/g84.o
  HDRTEST drivers/gpu/drm/xe/xe_uc_fw_abi.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn10/hw_factory_dcn10.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn20/hw_translate_dcn20.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dvo.h
  HDRTEST drivers/gpu/drm/xe/xe_uc_fw_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn20/hw_factory_dcn20.o
  HDRTEST drivers/gpu/drm/xe/xe_uc_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn21/hw_translate_dcn21.o
  HDRTEST drivers/gpu/drm/xe/xe_vm.h
  HDRTEST drivers/gpu/drm/xe/xe_vm_doc.h
  HDRTEST drivers/gpu/drm/i915/display/intel_sdvo.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.o
  HDRTEST drivers/gpu/drm/xe/xe_vm_types.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dp_aux.h
  HDRTEST drivers/gpu/drm/i915/display/intel_vdsc_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gk104.o
  HDRTEST drivers/gpu/drm/i915/display/intel_combo_phy.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gm107.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dvo_regs.h
  HDRTEST drivers/gpu/drm/i915/display/intel_gmbus.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gm200.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gp100.o
  HDRTEST drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gp102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn21/hw_factory_dcn21.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dsi.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dmc_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/gv100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn30/hw_translate_dcn30.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn30/hw_factory_dcn30.o
  HDRTEST drivers/gpu/drm/xe/xe_vram_freq.h
  HDRTEST drivers/gpu/drm/xe/xe_wa.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.o
  HDRTEST drivers/gpu/drm/i915/display/intel_ddi.h
  HDRTEST drivers/gpu/drm/i915/display/intel_hotplug_irq.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn315/hw_translate_dcn315.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn315/hw_factory_dcn315.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn32/hw_translate_dcn32.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.o
  HDRTEST drivers/gpu/drm/xe/xe_wait_user_fence.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/cipher/g84.o
  HDRTEST drivers/gpu/drm/i915/display/intel_tv_regs.h
  HDRTEST drivers/gpu/drm/i915/display/intel_dsb.h
  HDRTEST drivers/gpu/drm/i915/display/intel_bios.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/dcn32/hw_factory_dcn32.o
  HDRTEST drivers/gpu/drm/xe/xe_wopcm.h
  HDRTEST drivers/gpu/drm/xe/xe_wopcm_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce/dce_hwseq.o
  HDRTEST drivers/gpu/drm/i915/display/intel_pch_display.h
  LD [M]  drivers/gpu/drm/xe/xe.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/acpi.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce100/dce100_hwseq.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce112/dce112_hwseq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce120/dce120_hwseq.o
  HDRTEST drivers/gpu/drm/i915/display/intel_backlight.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce80/dce80_hwseq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_init.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn20/dcn20_hwseq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn20/dcn20_init.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn201/dcn201_hwseq.o
  HDRTEST drivers/gpu/drm/i915/display/intel_vblank.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/pci.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dp.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn201/dcn201_init.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/device/user.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn21/dcn21_hwseq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn21/dcn21_init.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/base.o
  HDRTEST drivers/gpu/drm/i915/display/intel_pmdemand.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn30/dcn30_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn30/dcn30_init.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.o
  HDRTEST drivers/gpu/drm/i915/display/intel_backlight_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmi.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/head.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.o
  HDRTEST drivers/gpu/drm/i915/display/intel_combo_phy_regs.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/vga.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn301/dcn301_hwseq.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_reset.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/nv04.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_power_map.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn301/dcn301_init.o
  HDRTEST drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/g84.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_wa.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gt200.o
  HDRTEST drivers/gpu/drm/i915/display/icl_dsi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn302/dcn302_hwseq.o
  HDRTEST drivers/gpu/drm/i915/display/intel_lspcon.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn302/dcn302_init.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn303/dcn303_hwseq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn303/dcn303_init.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dpio_phy.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn31/dcn31_hwseq.o
  HDRTEST drivers/gpu/drm/i915/display/intel_dp_hdcp.h
  HDRTEST drivers/gpu/drm/i915/display/intel_fb_pin.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn31/dcn31_init.o
  HDRTEST drivers/gpu/drm/i915/display/intel_display_debugfs_params.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn314/dcn314_hwseq.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn314/dcn314_init.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn32/dcn32_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp89.o
  HDRTEST drivers/gpu/drm/i915/display/intel_link_bw.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn32/dcn32_init.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn35/dcn35_hwseq.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn35/dcn35_init.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gk110.o
  HDRTEST drivers/gpu/drm/i915/display/intel_pps.h
  HDRTEST drivers/gpu/drm/i915/display/intel_sprite_uapi.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gm107.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/irq_service.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_ttm.h
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_region.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce60/irq_service_dce60.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gp100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce80/irq_service_dce80.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_context_types.h
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce110/irq_service_dce110.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce120/irq_service_dce120.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn10/irq_service_dcn10.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gp102.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_lmem.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn20/irq_service_dcn20.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_mman.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn21/irq_service_dcn21.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn30/irq_service_dcn30.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn302/irq_service_dcn302.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn303/irq_service_dcn303.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn31/irq_service_dcn31.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_object_types.h
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_context.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn314/irq_service_dcn314.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/nv04.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/nv50.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn315/irq_service_dcn315.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn32/irq_service_dcn32.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn35/irq_service_dcn35.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/gf100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/gf119.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dpms.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_clflush.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/gv100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_factory.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_resource.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/user.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_tiling.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv04.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv50.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usergf100.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_stolen.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usergf119.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/dma/usergv100.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_cts.o
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_create.h
  HDRTEST drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/cgrp.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../disp


