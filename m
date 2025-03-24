Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0322AC36002
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 12:43:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A1510E2FC;
	Mon, 24 Mar 2025 12:43:40 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B4F10E2EC;
 Mon, 24 Mar 2025 12:43:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EHooks=3A_success_for_drm/display=3A_dp=3A_add_new_D?=
 =?utf-8?q?PCD_access_functions_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dmitry Baryshkov" <lumag@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Mar 2025 12:43:39 -0000
Message-ID: <174282021968.71771.14814106587528017643@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250324-drm-rework-dpcd-access-v4-0-e80ff89593df@oss.qualcomm.com>
In-Reply-To: <20250324-drm-rework-dpcd-access-v4-0-e80ff89593df@oss.qualcomm.com>
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

Series: drm/display: dp: add new DPCD access functions (rev3)
URL   : https://patchwork.freedesktop.org/series/146000/
State : success

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
+ export
+ grep -Ei '(^|\W)CI_'
declare -x CI_KERNEL_BUILD_DIR="/workspace/kernel/build64-default"
declare -x CI_KERNEL_SRC_DIR="/workspace/kernel"
declare -x CI_TOOLS_SRC_DIR="/workspace/ci"
declare -x CI_WORKSPACE_DIR="/workspace"
run-parts: executing /workspace/ci/hooks/10-build-W1
+ SRC_DIR=/workspace/kernel
+ RESTORE_DISPLAY_CONFIG=0
+ '[' -n /workspace/kernel/build64-default ']'
+ BUILD_DIR=/workspace/kernel/build64-default
+ cd /workspace/kernel
++ nproc
+ make -j48 O=/workspace/kernel/build64-default modules_prepare
make[1]: Entering directory '/workspace/kernel/build64-default'
  GEN     Makefile
  DESCEND objtool
  CALL    ../scripts/checksyscalls.sh
  INSTALL libsubcmd_headers
  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/exec-cmd.o
  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/help.o
  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/pager.o
  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/parse-options.o
  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/run-command.o
  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/sigchain.o
  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/subcmd-config.o
  LD      /workspace/kernel/build64-default/tools/objtool/libsubcmd/libsubcmd-in.o
  AR      /workspace/kernel/build64-default/tools/objtool/libsubcmd/libsubcmd.a
  CC      /workspace/kernel/build64-default/tools/objtool/weak.o
  CC      /workspace/kernel/build64-default/tools/objtool/check.o
  CC      /workspace/kernel/build64-default/tools/objtool/special.o
  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/special.o
  CC      /workspace/kernel/build64-default/tools/objtool/builtin-check.o
  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/decode.o
  CC      /workspace/kernel/build64-default/tools/objtool/elf.o
  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/orc.o
  CC      /workspace/kernel/build64-default/tools/objtool/objtool.o
  CC      /workspace/kernel/build64-default/tools/objtool/orc_gen.o
  CC      /workspace/kernel/build64-default/tools/objtool/orc_dump.o
  CC      /workspace/kernel/build64-default/tools/objtool/libstring.o
  CC      /workspace/kernel/build64-default/tools/objtool/libctype.o
  CC      /workspace/kernel/build64-default/tools/objtool/str_error_r.o
  CC      /workspace/kernel/build64-default/tools/objtool/librbtree.o
  LD      /workspace/kernel/build64-default/tools/objtool/arch/x86/objtool-in.o
  LD      /workspace/kernel/build64-default/tools/objtool/objtool-in.o
  LINK    /workspace/kernel/build64-default/tools/objtool/objtool
make[1]: Leaving directory '/workspace/kernel/build64-default'
++ nproc
+ make -j48 O=/workspace/kernel/build64-default W=1 drivers/gpu/drm/xe
make[1]: Entering directory '/workspace/kernel/build64-default'
make[2]: Nothing to be done for 'drivers/gpu/drm/xe'.
make[1]: Leaving directory '/workspace/kernel/build64-default'
run-parts: executing /workspace/ci/hooks/11-build-32b
+++ realpath /workspace/ci/hooks/11-build-32b
++ dirname /workspace/ci/hooks/11-build-32b
+ THIS_SCRIPT_DIR=/workspace/ci/hooks
+ SRC_DIR=/workspace/kernel
+ TOOLS_SRC_DIR=/workspace/ci
+ '[' -n /workspace/kernel/build64-default ']'
+ BUILD_DIR=/workspace/kernel/build64-default
+ BUILD_DIR=/workspace/kernel/build64-default/build32
+ cd /workspace/kernel
+ mkdir -p /workspace/kernel/build64-default/build32
++ nproc
+ make -j48 ARCH=i386 O=/workspace/kernel/build64-default/build32 defconfig
make[1]: Entering directory '/workspace/kernel/build64-default/build32'
  GEN     Makefile
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/menu.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTLD  scripts/kconfig/conf
*** Default configuration is based on 'i386_defconfig'
#
# configuration written to .config
#
make[1]: Leaving directory '/workspace/kernel/build64-default/build32'
+ cd /workspace/kernel/build64-default/build32
+ /workspace/kernel/scripts/kconfig/merge_config.sh .config /workspace/ci/kernel/fragments/10-xe.fragment
Using .config as base
Merging /workspace/ci/kernel/fragments/10-xe.fragment
Value of CONFIG_DRM_XE is redefined by fragment /workspace/ci/kernel/fragments/10-xe.fragment:
Previous value: # CONFIG_DRM_XE is not set
New value: CONFIG_DRM_XE=m

  GEN     Makefile

WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
  Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
  Selected by [m]:
  - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_XE [=m] && DRM_XE [=m]=m [=m] && HAS_IOPORT [=y]
#
# configuration written to .config
#
Value requested for CONFIG_HAVE_UID16 not in final .config
Requested value:  CONFIG_HAVE_UID16=y
Actual value:     

Value requested for CONFIG_UID16 not in final .config
Requested value:  CONFIG_UID16=y
Actual value:     

Value requested for CONFIG_X86_32 not in final .config
Requested value:  CONFIG_X86_32=y
Actual value:     

Value requested for CONFIG_OUTPUT_FORMAT not in final .config
Requested value:  CONFIG_OUTPUT_FORMAT="elf32-i386"
Actual value:     CONFIG_OUTPUT_FORMAT="elf64-x86-64"

Value requested for CONFIG_ARCH_MMAP_RND_BITS_MIN not in final .config
Requested value:  CONFIG_ARCH_MMAP_RND_BITS_MIN=8
Actual value:     CONFIG_ARCH_MMAP_RND_BITS_MIN=28

Value requested for CONFIG_ARCH_MMAP_RND_BITS_MAX not in final .config
Requested value:  CONFIG_ARCH_MMAP_RND_BITS_MAX=16
Actual value:     CONFIG_ARCH_MMAP_RND_BITS_MAX=32

Value requested for CONFIG_PGTABLE_LEVELS not in final .config
Requested value:  CONFIG_PGTABLE_LEVELS=2
Actual value:     CONFIG_PGTABLE_LEVELS=5

Value requested for CONFIG_X86_BIGSMP not in final .config
Requested value:  # CONFIG_X86_BIGSMP is not set
Actual value:     

Value requested for CONFIG_X86_INTEL_QUARK not in final .config
Requested value:  # CONFIG_X86_INTEL_QUARK is not set
Actual value:     

Value requested for CONFIG_X86_RDC321X not in final .config
Requested value:  # CONFIG_X86_RDC321X is not set
Actual value:     

Value requested for CONFIG_X86_32_NON_STANDARD not in final .config
Requested value:  # CONFIG_X86_32_NON_STANDARD is not set
Actual value:     

Value requested for CONFIG_X86_32_IRIS not in final .config
Requested value:  # CONFIG_X86_32_IRIS is not set
Actual value:     

Value requested for CONFIG_M486SX not in final .config
Requested value:  # CONFIG_M486SX is not set
Actual value:     

Value requested for CONFIG_M486 not in final .config
Requested value:  # CONFIG_M486 is not set
Actual value:     

Value requested for CONFIG_M586 not in final .config
Requested value:  # CONFIG_M586 is not set
Actual value:     

Value requested for CONFIG_M586TSC not in final .config
Requested value:  # CONFIG_M586TSC is not set
Actual value:     

Value requested for CONFIG_M586MMX not in final .config
Requested value:  # CONFIG_M586MMX is not set
Actual value:     

Value requested for CONFIG_M686 not in final .config
Requested value:  CONFIG_M686=y
Actual value:     

Value requested for CONFIG_MPENTIUMII not in final .config
Requested value:  # CONFIG_MPENTIUMII is not set
Actual value:     

Value requested for CONFIG_MPENTIUMIII not in final .config
Requested value:  # CONFIG_MPENTIUMIII is not set
Actual value:     

Value requested for CONFIG_MPENTIUMM not in final .config
Requested value:  # CONFIG_MPENTIUMM is not set
Actual value:     

Value requested for CONFIG_MPENTIUM4 not in final .config
Requested value:  # CONFIG_MPENTIUM4 is not set
Actual value:     

Value requested for CONFIG_MK6 not in final .config
Requested value:  # CONFIG_MK6 is not set
Actual value:     

Value requested for CONFIG_MK7 not in final .config
Requested value:  # CONFIG_MK7 is not set
Actual value:     

Value requested for CONFIG_MCRUSOE not in final .config
Requested value:  # CONFIG_MCRUSOE is not set
Actual value:     

Value requested for CONFIG_MEFFICEON not in final .config
Requested value:  # CONFIG_MEFFICEON is not set
Actual value:     

Value requested for CONFIG_MWINCHIPC6 not in final .config
Requested value:  # CONFIG_MWINCHIPC6 is not set
Actual value:     

Value requested for CONFIG_MWINCHIP3D not in final .config
Requested value:  # CONFIG_MWINCHIP3D is not set
Actual value:     

Value requested for CONFIG_MELAN not in final .config
Requested value:  # CONFIG_MELAN is not set
Actual value:     

Value requested for CONFIG_MGEODEGX1 not in final .config
Requested value:  # CONFIG_MGEODEGX1 is not set
Actual value:     

Value requested for CONFIG_MGEODE_LX not in final .config
Requested value:  # CONFIG_MGEODE_LX is not set
Actual value:     

Value requested for CONFIG_MCYRIXIII not in final .config
Requested value:  # CONFIG_MCYRIXIII is not set
Actual value:     

Value requested for CONFIG_MVIAC3_2 not in final .config
Requested value:  # CONFIG_MVIAC3_2 is not set
Actual value:     

Value requested for CONFIG_MVIAC7 not in final .config
Requested value:  # CONFIG_MVIAC7 is not set
Actual value:     

Value requested for CONFIG_X86_GENERIC not in final .config
Requested value:  # CONFIG_X86_GENERIC is not set
Actual value:     

Value requested for CONFIG_X86_INTERNODE_CACHE_SHIFT not in final .config
Requested value:  CONFIG_X86_INTERNODE_CACHE_SHIFT=5
Actual value:     CONFIG_X86_INTERNODE_CACHE_SHIFT=6

Value requested for CONFIG_X86_L1_CACHE_SHIFT not in final .config
Requested value:  CONFIG_X86_L1_CACHE_SHIFT=5
Actual value:     CONFIG_X86_L1_CACHE_SHIFT=6

Value requested for CONFIG_X86_USE_PPRO_CHECKSUM not in final .config
Requested value:  CONFIG_X86_USE_PPRO_CHECKSUM=y
Actual value:     

Value requested for CONFIG_X86_MINIMUM_CPU_FAMILY not in final .config
Requested value:  CONFIG_X86_MINIMUM_CPU_FAMILY=6
Actual value:     CONFIG_X86_MINIMUM_CPU_FAMILY=64

Value requested for CONFIG_CPU_SUP_TRANSMETA_32 not in final .config
Requested value:  CONFIG_CPU_SUP_TRANSMETA_32=y
Actual value:     

Value requested for CONFIG_CPU_SUP_VORTEX_32 not in final .config
Requested value:  CONFIG_CPU_SUP_VORTEX_32=y
Actual value:     

Value requested for CONFIG_HPET_TIMER not in final .config
Requested value:  # CONFIG_HPET_TIMER is not set
Actual value:     CONFIG_HPET_TIMER=y

Value requested for CONFIG_NR_CPUS_RANGE_END not in final .config
Requested value:  CONFIG_NR_CPUS_RANGE_END=8
Actual value:     CONFIG_NR_CPUS_RANGE_END=512

Value requested for CONFIG_NR_CPUS_DEFAULT not in final .config
Requested value:  CONFIG_NR_CPUS_DEFAULT=8
Actual value:     CONFIG_NR_CPUS_DEFAULT=64

Value requested for CONFIG_X86_ANCIENT_MCE not in final .config
Requested value:  # CONFIG_X86_ANCIENT_MCE is not set
Actual value:     

Value requested for CONFIG_X86_LEGACY_VM86 not in final .config
Requested value:  # CONFIG_X86_LEGACY_VM86 is not set
Actual value:     

Value requested for CONFIG_X86_ESPFIX32 not in final .config
Requested value:  CONFIG_X86_ESPFIX32=y
Actual value:     

Value requested for CONFIG_TOSHIBA not in final .config
Requested value:  # CONFIG_TOSHIBA is not set
Actual value:     

Value requested for CONFIG_X86_REBOOTFIXUPS not in final .config
Requested value:  # CONFIG_X86_REBOOTFIXUPS is not set
Actual value:     

Value requested for CONFIG_MICROCODE_INITRD32 not in final .config
Requested value:  CONFIG_MICROCODE_INITRD32=y
Actual value:     

Value requested for CONFIG_NOHIGHMEM not in final .config
Requested value:  # CONFIG_NOHIGHMEM is not set
Actual value:     

Value requested for CONFIG_HIGHMEM4G not in final .config
Requested value:  CONFIG_HIGHMEM4G=y
Actual value:     

Value requested for CONFIG_HIGHMEM64G not in final .config
Requested value:  # CONFIG_HIGHMEM64G is not set
Actual value:     

Value requested for CONFIG_VMSPLIT_3G not in final .config
Requested value:  CONFIG_VMSPLIT_3G=y
Actual value:     

Value requested for CONFIG_VMSPLIT_3G_OPT not in final .config
Requested value:  # CONFIG_VMSPLIT_3G_OPT is not set
Actual value:     

Value requested for CONFIG_VMSPLIT_2G not in final .config
Requested value:  # CONFIG_VMSPLIT_2G is not set
Actual value:     

Value requested for CONFIG_VMSPLIT_2G_OPT not in final .config
Requested value:  # CONFIG_VMSPLIT_2G_OPT is not set
Actual value:     

Value requested for CONFIG_VMSPLIT_1G not in final .config
Requested value:  # CONFIG_VMSPLIT_1G is not set
Actual value:     

Value requested for CONFIG_PAGE_OFFSET not in final .config
Requested value:  CONFIG_PAGE_OFFSET=0xC0000000
Actual value:     

Value requested for CONFIG_HIGHMEM not in final .config
Requested value:  CONFIG_HIGHMEM=y
Actual value:     

Value requested for CONFIG_X86_PAE not in final .config
Requested value:  # CONFIG_X86_PAE is not set
Actual value:     

Value requested for CONFIG_ARCH_FLATMEM_ENABLE not in final .config
Requested value:  CONFIG_ARCH_FLATMEM_ENABLE=y
Actual value:     

Value requested for CONFIG_ARCH_SELECT_MEMORY_MODEL not in final .config
Requested value:  CONFIG_ARCH_SELECT_MEMORY_MODEL=y
Actual value:     

Value requested for CONFIG_ILLEGAL_POINTER_VALUE not in final .config
Requested value:  CONFIG_ILLEGAL_POINTER_VALUE=0
Actual value:     CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000

Value requested for CONFIG_HIGHPTE not in final .config
Requested value:  # CONFIG_HIGHPTE is not set
Actual value:     

Value requested for CONFIG_COMPAT_VDSO not in final .config
Requested value:  # CONFIG_COMPAT_VDSO is not set
Actual value:     

Value requested for CONFIG_FUNCTION_PADDING_CFI not in final .config
Requested value:  CONFIG_FUNCTION_PADDING_CFI=0
Actual value:     CONFIG_FUNCTION_PADDING_CFI=11

Value requested for CONFIG_FUNCTION_PADDING_BYTES not in final .config
Requested value:  CONFIG_FUNCTION_PADDING_BYTES=4
Actual value:     CONFIG_FUNCTION_PADDING_BYTES=16

Value requested for CONFIG_APM not in final .config
Requested value:  # CONFIG_APM is not set
Actual value:     

Value requested for CONFIG_X86_POWERNOW_K6 not in final .config
Requested value:  # CONFIG_X86_POWERNOW_K6 is not set
Actual value:     

Value requested for CONFIG_X86_POWERNOW_K7 not in final .config
Requested value:  # CONFIG_X86_POWERNOW_K7 is not set
Actual value:     

Value requested for CONFIG_X86_GX_SUSPMOD not in final .config
Requested value:  # CONFIG_X86_GX_SUSPMOD is not set
Actual value:     

Value requested for CONFIG_X86_SPEEDSTEP_ICH not in final .config
Requested value:  # CONFIG_X86_SPEEDSTEP_ICH is not set
Actual value:     

Value requested for CONFIG_X86_SPEEDSTEP_SMI not in final .config
Requested value:  # CONFIG_X86_SPEEDSTEP_SMI is not set
Actual value:     

Value requested for CONFIG_X86_CPUFREQ_NFORCE2 not in final .config
Requested value:  # CONFIG_X86_CPUFREQ_NFORCE2 is not set
Actual value:     

Value requested for CONFIG_X86_LONGRUN not in final .config
Requested value:  # CONFIG_X86_LONGRUN is not set
Actual value:     

Value requested for CONFIG_X86_LONGHAUL not in final .config
Requested value:  # CONFIG_X86_LONGHAUL is not set
Actual value:     

Value requested for CONFIG_X86_E_POWERSAVER not in final .config
Requested value:  # CONFIG_X86_E_POWERSAVER is not set
Actual value:     

Value requested for CONFIG_PCI_GOBIOS not in final .config
Requested value:  # CONFIG_PCI_GOBIOS is not set
Actual value:     

Value requested for CONFIG_PCI_GOMMCONFIG not in final .config
Requested value:  # CONFIG_PCI_GOMMCONFIG is not set
Actual value:     

Value requested for CONFIG_PCI_GODIRECT not in final .config
Requested value:  # CONFIG_PCI_GODIRECT is not set
Actual value:     

Value requested for CONFIG_PCI_GOANY not in final .config
Requested value:  CONFIG_PCI_GOANY=y
Actual value:     

Value requested for CONFIG_PCI_BIOS not in final .config
Requested value:  CONFIG_PCI_BIOS=y
Actual value:     

Value requested for CONFIG_ISA not in final .config
Requested value:  # CONFIG_ISA is not set
Actual value:     

Value requested for CONFIG_SCx200 not in final .config
Requested value:  # CONFIG_SCx200 is not set
Actual value:     

Value requested for CONFIG_OLPC not in final .config
Requested value:  # CONFIG_OLPC is not set
Actual value:     

Value requested for CONFIG_ALIX not in final .config
Requested value:  # CONFIG_ALIX is not set
Actual value:     

Value requested for CONFIG_NET5501 not in final .config
Requested value:  # CONFIG_NET5501 is not set
Actual value:     

Value requested for CONFIG_GEOS not in final .config
Requested value:  # CONFIG_GEOS is not set
Actual value:     

Value requested for CONFIG_COMPAT_32 not in final .config
Requested value:  CONFIG_COMPAT_32=y
Actual value:     

Value requested for CONFIG_HAVE_ATOMIC_IOMAP not in final .config
Requested value:  CONFIG_HAVE_ATOMIC_IOMAP=y
Actual value:     

Value requested for CONFIG_ARCH_32BIT_OFF_T not in final .config
Requested value:  CONFIG_ARCH_32BIT_OFF_T=y
Actual value:     

Value requested for CONFIG_ARCH_WANT_IPC_PARSE_VERSION not in final .config
Requested value:  CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
Actual value:     

Value requested for CONFIG_MODULES_USE_ELF_REL not in final .config
Requested value:  CONFIG_MODULES_USE_ELF_REL=y
Actual value:     

Value requested for CONFIG_ARCH_MMAP_RND_BITS not in final .config
Requested value:  CONFIG_ARCH_MMAP_RND_BITS=8
Actual value:     CONFIG_ARCH_MMAP_RND_BITS=28

Value requested for CONFIG_CLONE_BACKWARDS not in final .config
Requested value:  CONFIG_CLONE_BACKWARDS=y
Actual value:     

Value requested for CONFIG_OLD_SIGSUSPEND3 not in final .config
Requested value:  CONFIG_OLD_SIGSUSPEND3=y
Actual value:     

Value requested for CONFIG_OLD_SIGACTION not in final .config
Requested value:  CONFIG_OLD_SIGACTION=y
Actual value:     

Value requested for CONFIG_ARCH_SPLIT_ARG64 not in final .config
Requested value:  CONFIG_ARCH_SPLIT_ARG64=y
Actual value:     

Value requested for CONFIG_FUNCTION_ALIGNMENT not in final .config
Requested value:  CONFIG_FUNCTION_ALIGNMENT=4
Actual value:     CONFIG_FUNCTION_ALIGNMENT=16

Value requested for CONFIG_SELECT_MEMORY_MODEL not in final .config
Requested value:  CONFIG_SELECT_MEMORY_MODEL=y
Actual value:     

Value requested for CONFIG_FLATMEM_MANUAL not in final .config
Requested value:  CONFIG_FLATMEM_MANUAL=y
Actual value:     

Value requested for CONFIG_SPARSEMEM_MANUAL not in final .config
Requested value:  # CONFIG_SPARSEMEM_MANUAL is not set
Actual value:     

Value requested for CONFIG_FLATMEM not in final .config
Requested value:  CONFIG_FLATMEM=y
Actual value:     

Value requested for CONFIG_SPARSEMEM_STATIC not in final .config
Requested value:  CONFIG_SPARSEMEM_STATIC=y
Actual value:     

Value requested for CONFIG_BOUNCE not in final .config
Requested value:  CONFIG_BOUNCE=y
Actual value:     

Value requested for CONFIG_KMAP_LOCAL not in final .config
Requested value:  CONFIG_KMAP_LOCAL=y
Actual value:     

Value requested for CONFIG_HOTPLUG_PCI_COMPAQ not in final .config
Requested value:  # CONFIG_HOTPLUG_PCI_COMPAQ is not set
Actual value:     

Value requested for CONFIG_HOTPLUG_PCI_IBM not in final .config
Requested value:  # CONFIG_HOTPLUG_PCI_IBM is not set
Actual value:     

Value requested for CONFIG_EFI_CAPSULE_QUIRK_QUARK_CSH not in final .config
Requested value:  CONFIG_EFI_CAPSULE_QUIRK_QUARK_CSH=y
Actual value:     

Value requested for CONFIG_PCH_PHUB not in final .config
Requested value:  # CONFIG_PCH_PHUB is not set
Actual value:     

Value requested for CONFIG_SCSI_NSP32 not in final .config
Requested value:  # CONFIG_SCSI_NSP32 is not set
Actual value:     

Value requested for CONFIG_PATA_CS5520 not in final .config
Requested value:  # CONFIG_PATA_CS5520 is not set
Actual value:     

Value requested for CONFIG_PATA_CS5530 not in final .config
Requested value:  # CONFIG_PATA_CS5530 is not set
Actual value:     

Value requested for CONFIG_PATA_CS5535 not in final .config
Requested value:  # CONFIG_PATA_CS5535 is not set
Actual value:     

Value requested for CONFIG_PATA_CS5536 not in final .config
Requested value:  # CONFIG_PATA_CS5536 is not set
Actual value:     

Value requested for CONFIG_PATA_SC1200 not in final .config
Requested value:  # CONFIG_PATA_SC1200 is not set
Actual value:     

Value requested for CONFIG_PCH_GBE not in final .config
Requested value:  # CONFIG_PCH_GBE is not set
Actual value:     

Value requested for CONFIG_INPUT_WISTRON_BTNS not in final .config
Requested value:  # CONFIG_INPUT_WISTRON_BTNS is not set
Actual value:     

Value requested for CONFIG_SERIAL_TIMBERDALE not in final .config
Requested value:  # CONFIG_SERIAL_TIMBERDALE is not set
Actual value:     

Value requested for CONFIG_SERIAL_PCH_UART not in final .config
Requested value:  # CONFIG_SERIAL_PCH_UART is not set
Actual value:     

Value requested for CONFIG_HW_RANDOM_GEODE not in final .config
Requested value:  CONFIG_HW_RANDOM_GEODE=y
Actual value:     

Value requested for CONFIG_SONYPI not in final .config
Requested value:  # CONFIG_SONYPI is not set
Actual value:     

Value requested for CONFIG_PC8736x_GPIO not in final .config
Requested value:  # CONFIG_PC8736x_GPIO is not set
Actual value:     

Value requested for CONFIG_NSC_GPIO not in final .config
Requested value:  # CONFIG_NSC_GPIO is not set
Actual value:     

Value requested for CONFIG_I2C_EG20T not in final .config
Requested value:  # CONFIG_I2C_EG20T is not set
Actual value:     

Value requested for CONFIG_SCx200_ACB not in final .config
Requested value:  # CONFIG_SCx200_ACB is not set
Actual value:     

Value requested for CONFIG_PTP_1588_CLOCK_PCH not in final .config
Requested value:  # CONFIG_PTP_1588_CLOCK_PCH is not set
Actual value:     

Value requested for CONFIG_SBC8360_WDT not in final .config
Requested value:  # CONFIG_SBC8360_WDT is not set
Actual value:     

Value requested for CONFIG_SBC7240_WDT not in final .config
Requested value:  # CONFIG_SBC7240_WDT is not set
Actual value:     

Value requested for CONFIG_MFD_CS5535 not in final .config
Requested value:  # CONFIG_MFD_CS5535 is not set
Actual value:     

Value requested for CONFIG_AGP_ALI not in final .config
Requested value:  # CONFIG_AGP_ALI is not set
Actual value:     

Value requested for CONFIG_AGP_ATI not in final .config
Requested value:  # CONFIG_AGP_ATI is not set
Actual value:     

Value requested for CONFIG_AGP_AMD not in final .config
Requested value:  # CONFIG_AGP_AMD is not set
Actual value:     

Value requested for CONFIG_AGP_NVIDIA not in final .config
Requested value:  # CONFIG_AGP_NVIDIA is not set
Actual value:     

Value requested for CONFIG_AGP_SWORKS not in final .config
Requested value:  # CONFIG_AGP_SWORKS is not set
Actual value:     

Value requested for CONFIG_AGP_EFFICEON not in final .config
Requested value:  # CONFIG_AGP_EFFICEON is not set
Actual value:     

Value requested for CONFIG_SND_CS5530 not in final .config
Requested value:  # CONFIG_SND_CS5530 is not set
Actual value:     

Value requested for CONFIG_SND_CS5535AUDIO not in final .config
Requested value:  # CONFIG_SND_CS5535AUDIO is not set
Actual value:     

Value requested for CONFIG_SND_SIS7019 not in final .config
Requested value:  # CONFIG_SND_SIS7019 is not set
Actual value:     

Value requested for CONFIG_LEDS_OT200 not in final .config
Requested value:  # CONFIG_LEDS_OT200 is not set
Actual value:     

Value requested for CONFIG_PCH_DMA not in final .config
Requested value:  # CONFIG_PCH_DMA is not set
Actual value:     

Value requested for CONFIG_CLKSRC_I8253 not in final .config
Requested value:  CONFIG_CLKSRC_I8253=y
Actual value:     

Value requested for CONFIG_MAILBOX not in final .config
Requested value:  # CONFIG_MAILBOX is not set
Actual value:     CONFIG_MAILBOX=y

Value requested for CONFIG_CRYPTO_SERPENT_SSE2_586 not in final .config
Requested value:  # CONFIG_CRYPTO_SERPENT_SSE2_586 is not set
Actual value:     

Value requested for CONFIG_CRYPTO_TWOFISH_586 not in final .config
Requested value:  # CONFIG_CRYPTO_TWOFISH_586 is not set
Actual value:     

Value requested for CONFIG_CRYPTO_DEV_GEODE not in final .config
Requested value:  # CONFIG_CRYPTO_DEV_GEODE is not set
Actual value:     

Value requested for CONFIG_CRYPTO_DEV_HIFN_795X not in final .config
Requested value:  # CONFIG_CRYPTO_DEV_HIFN_795X is not set
Actual value:     

Value requested for CONFIG_CRYPTO_LIB_POLY1305_RSIZE not in final .config
Requested value:  CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
Actual value:     CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11

Value requested for CONFIG_AUDIT_GENERIC not in final .config
Requested value:  CONFIG_AUDIT_GENERIC=y
Actual value:     

Value requested for CONFIG_GENERIC_VDSO_32 not in final .config
Requested value:  CONFIG_GENERIC_VDSO_32=y
Actual value:     

Value requested for CONFIG_DEBUG_KMAP_LOCAL not in final .config
Requested value:  # CONFIG_DEBUG_KMAP_LOCAL is not set
Actual value:     

Value requested for CONFIG_DEBUG_HIGHMEM not in final .config
Requested value:  # CONFIG_DEBUG_HIGHMEM is not set
Actual value:     

Value requested for CONFIG_HAVE_DEBUG_STACKOVERFLOW not in final .config
Requested value:  CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
Actual value:     

Value requested for CONFIG_DEBUG_STACKOVERFLOW not in final .config
Requested value:  # CONFIG_DEBUG_STACKOVERFLOW is not set
Actual value:     

Value requested for CONFIG_HAVE_FUNCTION_GRAPH_TRACER not in final .config
Requested value:  CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
Actual value:     

Value requested for CONFIG_HAVE_FUNCTION_GRAPH_FREGS not in final .config
Requested value:  CONFIG_HAVE_FUNCTION_GRAPH_FREGS=y
Actual value:     

Value requested for CONFIG_HAVE_FTRACE_GRAPH_FUNC not in final .config
Requested value:  CONFIG_HAVE_FTRACE_GRAPH_FUNC=y
Actual value:     

Value requested for CONFIG_DRM_KUNIT_TEST not in final .config
Requested value:  CONFIG_DRM_KUNIT_TEST=m
Actual value:     

Value requested for CONFIG_DRM_XE_WERROR not in final .config
Requested value:  CONFIG_DRM_XE_WERROR=y
Actual value:     

Value requested for CONFIG_DRM_XE_DEBUG not in final .config
Requested value:  CONFIG_DRM_XE_DEBUG=y
Actual value:     

Value requested for CONFIG_DRM_XE_DEBUG_MEM not in final .config
Requested value:  CONFIG_DRM_XE_DEBUG_MEM=y
Actual value:     

Value requested for CONFIG_DRM_XE_KUNIT_TEST not in final .config
Requested value:  CONFIG_DRM_XE_KUNIT_TEST=m
Actual value:     

++ nproc
+ make -j48 ARCH=i386 olddefconfig
  GEN     Makefile

WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
  Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
  Selected by [m]:
  - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_XE [=m] && DRM_XE [=m]=m [=m] && HAS_IOPORT [=y]
#
# configuration written to .config
#
++ nproc
+ make -j48 ARCH=i386
  SYNC    include/config/auto.conf.cmd
  GEN     Makefile

WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
  Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
  Selected by [m]:
  - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_XE [=m] && DRM_XE [=m]=m [=m] && HAS_IOPORT [=y]

WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
  Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
  Selected by [m]:
  - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_XE [=m] && DRM_XE [=m]=m [=m] && HAS_IOPORT [=y]

WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
  Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
  Selected by [m]:
  - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_XE [=m] && DRM_XE [=m]=m [=m] && HAS_IOPORT [=y]
  GEN     Makefile
  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/x86/include/generated/uapi/asm/errno.h
  WRAP    arch/x86/include/generated/uapi/asm/fcntl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctls.h
  WRAP    arch/x86/include/generated/uapi/asm/ipcbuf.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  UPD     include/generated/uapi/linux/version.h
  WRAP    arch/x86/include/generated/uapi/asm/param.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  WRAP    arch/x86/include/generated/uapi/asm/resource.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  WRAP    arch/x86/include/generated/uapi/asm/socket.h
  WRAP    arch/x86/include/generated/uapi/asm/sockios.h
  WRAP    arch/x86/include/generated/uapi/asm/termbits.h
  WRAP    arch/x86/include/generated/uapi/asm/termios.h
  WRAP    arch/x86/include/generated/uapi/asm/types.h
  UPD     include/generated/compile.h
  HOSTCC  arch/x86/tools/relocs_32.o
  HOSTCC  arch/x86/tools/relocs_64.o
  HOSTCC  arch/x86/tools/relocs_common.o
  WRAP    arch/x86/include/generated/asm/early_ioremap.h
  WRAP    arch/x86/include/generated/asm/fprobe.h
  WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
  WRAP    arch/x86/include/generated/asm/mmzone.h
  WRAP    arch/x86/include/generated/asm/irq_regs.h
  WRAP    arch/x86/include/generated/asm/kmap_size.h
  HOSTCC  scripts/kallsyms
  WRAP    arch/x86/include/generated/asm/local64.h
  HOSTCC  scripts/sorttable
  WRAP    arch/x86/include/generated/asm/mmiowb.h
  HOSTCC  scripts/asn1_compiler
  WRAP    arch/x86/include/generated/asm/module.lds.h
  WRAP    arch/x86/include/generated/asm/rwonce.h
  HOSTCC  scripts/selinux/mdp/mdp
  HOSTLD  arch/x86/tools/relocs
  UPD     include/config/kernel.release
  UPD     include/generated/utsrelease.h
  CC      scripts/mod/empty.o
  HOSTCC  scripts/mod/mk_elfconfig
  CC      scripts/mod/devicetable-offsets.s
  UPD     scripts/mod/devicetable-offsets.h
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/modpost.o
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTCC  scripts/mod/symsearch.o
  HOSTLD  scripts/mod/modpost
  CC      kernel/bounds.s
  CHKSHA1 /workspace/kernel/include/linux/atomic/atomic-arch-fallback.h
  CHKSHA1 /workspace/kernel/include/linux/atomic/atomic-instrumented.h
  CHKSHA1 /workspace/kernel/include/linux/atomic/atomic-long.h
  UPD     include/generated/timeconst.h
  UPD     include/generated/bounds.h
  CC      arch/x86/kernel/asm-offsets.s
  UPD     include/generated/asm-offsets.h
  CALL    /workspace/kernel/scripts/checksyscalls.sh
  LDS     scripts/module.lds
  CC      init/main.o
  HOSTCC  usr/gen_init_cpio
  CC      init/do_mounts.o
  CC      certs/system_keyring.o
  UPD     init/utsversion-tmp.h
  CC      init/do_mounts_initrd.o
  CC      ipc/util.o
  CC      init/initramfs.o
  CC      ipc/msgutil.o
  CC      mm/filemap.o
  CC      security/commoncap.o
  CC      ipc/msg.o
  CC      init/calibrate.o
  CC      security/lsm_syscalls.o
  CC      mm/mempool.o
  CC      io_uring/io_uring.o
  CC      block/bdev.o
  CC      security/min_addr.o
  CC      ipc/sem.o
  CC      init/init_task.o
  CC      arch/x86/realmode/init.o
  CC      arch/x86/power/cpu.o
  CC      arch/x86/pci/i386.o
  AR      arch/x86/crypto/built-in.a
  CC      arch/x86/video/video-common.o
  AR      arch/x86/net/built-in.a
  AS      arch/x86/lib/atomic64_cx8_32.o
  CC      security/integrity/iint.o
  CC      security/keys/gc.o
  HOSTCC  security/selinux/genheaders
  CC      block/partitions/core.o
  AR      arch/x86/entry/vsyscall/built-in.a
  CC      fs/nfs_common/nfsacl.o
  AR      virt/lib/built-in.a
  CC      arch/x86/events/zhaoxin/core.o
  AR      arch/x86/platform/atom/built-in.a
  CC      arch/x86/events/intel/core.o
  CC      arch/x86/virt/svm/cmdline.o
  CC      arch/x86/events/amd/core.o
  CC      lib/math/div64.o
  CC      sound/core/sound.o
  CC      arch/x86/mm/pat/set_memory.o
  CC      arch/x86/kernel/fpu/init.o
  AR      drivers/cache/built-in.a
  CC      net/core/sock.o
  AR      virt/built-in.a
  CC      fs/notify/dnotify/dnotify.o
  CC      sound/core/seq/seq.o
  CC      net/core/request_sock.o
  AS      arch/x86/realmode/rm/header.o
  AR      arch/x86/platform/ce4100/built-in.a
  CC      arch/x86/entry/vdso/vma.o
  AR      drivers/irqchip/built-in.a
  AS      arch/x86/lib/checksum_32.o
  CC      sound/core/seq/seq_lock.o
  CC      arch/x86/platform/efi/memmap.o
  AS      arch/x86/realmode/rm/trampoline_32.o
  CC      kernel/sched/core.o
  AR      drivers/bus/mhi/built-in.a
  AR      drivers/bus/built-in.a
  CC      arch/x86/lib/cmdline.o
  AS      arch/x86/realmode/rm/stack.o
  CC      crypto/asymmetric_keys/asymmetric_type.o
  AR      drivers/pwm/built-in.a
  AS      arch/x86/realmode/rm/reboot.o
  AR      drivers/leds/trigger/built-in.a
  AR      arch/x86/virt/svm/built-in.a
  AR      drivers/leds/blink/built-in.a
  AS      arch/x86/realmode/rm/wakeup_asm.o
  AR      drivers/leds/simple/built-in.a
  AR      arch/x86/virt/vmx/built-in.a
  AR      arch/x86/virt/built-in.a
  CC      drivers/leds/led-core.o
  CC      arch/x86/realmode/rm/wakemain.o
  CC      sound/core/seq/seq_clientmgr.o
  CC      lib/math/gcd.o
  AS      arch/x86/lib/cmpxchg8b_emu.o
  GEN     security/selinux/flask.h security/selinux/av_permissions.h
  CC      security/selinux/avc.o
  CC      arch/x86/lib/cpu.o
  CC      arch/x86/realmode/rm/video-mode.o
  CC      lib/math/lcm.o
  CC      lib/math/int_log.o
  AS      arch/x86/realmode/rm/copy.o
  AR      sound/i2c/other/built-in.a
  GEN     usr/initramfs_data.cpio
  AR      sound/i2c/built-in.a
  CC      sound/core/seq/seq_memory.o
  COPY    usr/initramfs_inc_data
  AS      arch/x86/realmode/rm/bioscall.o
  AS      usr/initramfs_data.o
  HOSTCC  certs/extract-cert
  CC      lib/math/int_pow.o
  AR      usr/built-in.a
  CC      arch/x86/realmode/rm/regs.o
  CC      arch/x86/kernel/fpu/bugs.o
  CC      arch/x86/realmode/rm/video-vga.o
  CC      io_uring/opdef.o
  CC      security/keys/key.o
  CC      lib/math/int_sqrt.o
  CC      arch/x86/realmode/rm/video-vesa.o
  CC      arch/x86/kernel/fpu/core.o
  CC      lib/math/reciprocal_div.o
  CC      arch/x86/realmode/rm/video-bios.o
  CC      block/partitions/msdos.o
  CC      lib/math/rational.o
  CC      arch/x86/lib/delay.o
  CC      block/partitions/efi.o
  AR      arch/x86/video/built-in.a
  CC      drivers/leds/led-class.o
  PASYMS  arch/x86/realmode/rm/pasyms.h
  CC      net/core/skbuff.o
  CERT    certs/x509_certificate_list
  LDS     arch/x86/realmode/rm/realmode.lds
  CERT    certs/signing_key.x509
  CC      kernel/sched/fair.o
  AS      certs/system_certificates.o
  CC      io_uring/kbuf.o
  LD      arch/x86/realmode/rm/realmode.elf
  CC      security/integrity/integrity_audit.o
  RELOCS  arch/x86/realmode/rm/realmode.relocs
  AR      certs/built-in.a
  OBJCOPY arch/x86/realmode/rm/realmode.bin
  CC      fs/nfs_common/grace.o
  AS      arch/x86/realmode/rmpiggy.o
  CC      kernel/sched/build_policy.o
  CC      block/fops.o
  AR      arch/x86/realmode/built-in.a
  CC      arch/x86/platform/efi/quirks.o
  CC      fs/nfs_common/common.o
  CC      security/keys/keyring.o
  CC      arch/x86/pci/init.o
  AR      arch/x86/platform/geode/built-in.a
  AR      sound/isa/ad1816a/built-in.a
  AR      fs/notify/dnotify/built-in.a
  AR      sound/drivers/opl3/built-in.a
  AR      sound/isa/ad1848/built-in.a
  CC      crypto/asymmetric_keys/restrict.o
  CC      arch/x86/entry/vdso/extable.o
  CC      fs/notify/inotify/inotify_fsnotify.o
  AR      sound/drivers/opl4/built-in.a
  AR      sound/isa/cs423x/built-in.a
  AR      sound/pci/ac97/built-in.a
  CC      fs/notify/inotify/inotify_user.o
  AR      sound/drivers/mpu401/built-in.a
  AR      sound/isa/es1688/built-in.a
  AR      sound/pci/ali5451/built-in.a
  AR      sound/drivers/vx/built-in.a
  AR      sound/isa/galaxy/built-in.a
  AR      sound/pci/asihpi/built-in.a
  AR      sound/drivers/pcsp/built-in.a
  AR      sound/pci/au88x0/built-in.a
  CC      arch/x86/power/hibernate_32.o
  AR      sound/isa/gus/built-in.a
  AR      sound/drivers/built-in.a
  AR      sound/isa/msnd/built-in.a
  AR      sound/pci/aw2/built-in.a
  CC      arch/x86/pci/pcbios.o
  AR      sound/isa/opti9xx/built-in.a
  AR      sound/pci/ctxfi/built-in.a
  AR      sound/isa/sb/built-in.a
  AR      sound/pci/ca0106/built-in.a
  AR      sound/ppc/built-in.a
  AS      arch/x86/lib/getuser.o
  CC      drivers/leds/led-triggers.o
  AR      sound/isa/wavefront/built-in.a
  AR      sound/pci/cs46xx/built-in.a
  AR      arch/x86/events/zhaoxin/built-in.a
  AR      sound/isa/wss/built-in.a
  AR      sound/pci/cs5535audio/built-in.a
  AR      sound/isa/built-in.a
  GEN     arch/x86/lib/inat-tables.c
  CC      sound/core/init.o
  AR      sound/pci/lola/built-in.a
  CC      arch/x86/lib/insn-eval.o
  AR      sound/pci/lx6464es/built-in.a
  CC      net/ethernet/eth.o
  AR      lib/math/built-in.a
  AR      sound/pci/echoaudio/built-in.a
  AR      sound/pci/emu10k1/built-in.a
  CC      lib/crypto/mpi/generic_mpih-lshift.o
  AR      sound/pci/ice1712/built-in.a
  CC      sound/pci/hda/hda_bind.o
  CC      arch/x86/kernel/cpu/mce/core.o
  CC      arch/x86/kernel/acpi/boot.o
  CC      arch/x86/kernel/apic/apic.o
  CC      lib/crypto/mpi/generic_mpih-mul1.o
  CC      security/security.o
  CC      lib/crypto/mpi/generic_mpih-mul2.o
  CC      drivers/pci/msi/pcidev_msi.o
  AR      fs/notify/fanotify/built-in.a
  CC      io_uring/rsrc.o
  CC      crypto/asymmetric_keys/signature.o
  CC      drivers/video/console/dummycon.o
  CC      drivers/video/backlight/backlight.o
  CC      arch/x86/events/amd/lbr.o
  CC      drivers/pci/msi/api.o
  CC      arch/x86/mm/pat/memtype.o
  AR      drivers/idle/built-in.a
  CC      net/core/datagram.o
  AR      drivers/char/ipmi/built-in.a
  CC      arch/x86/kernel/apic/apic_common.o
  AR      security/integrity/built-in.a
  CC      net/core/stream.o
  CC      net/core/scm.o
  AR      fs/nfs_common/built-in.a
  CC      drivers/pci/msi/msi.o
  CC      init/version.o
  AR      drivers/video/fbdev/core/built-in.a
  CC      sound/core/seq/seq_queue.o
  AR      drivers/video/fbdev/omap/built-in.a
  AR      drivers/video/fbdev/omap2/omapfb/dss/built-in.a
  AR      drivers/video/fbdev/omap2/omapfb/displays/built-in.a
  AR      drivers/video/fbdev/omap2/omapfb/built-in.a
  CC      arch/x86/kernel/apic/apic_noop.o
  AR      drivers/video/fbdev/omap2/built-in.a
  LDS     arch/x86/entry/vdso/vdso32/vdso32.lds
  AR      drivers/video/fbdev/built-in.a
  AS      arch/x86/power/hibernate_asm_32.o
  CC      arch/x86/pci/mmconfig_32.o
  AR      block/partitions/built-in.a
  AS      arch/x86/entry/vdso/vdso32/note.o
  AS      arch/x86/entry/vdso/vdso32/system_call.o
  CC      arch/x86/platform/efi/efi.o
  CC      arch/x86/power/hibernate.o
  CC      arch/x86/events/amd/ibs.o
  AS      arch/x86/entry/vdso/vdso32/sigreturn.o
  CC      arch/x86/entry/vdso/vdso32/vclock_gettime.o
  AR      drivers/leds/built-in.a
  CC      arch/x86/events/amd/uncore.o
  CC      drivers/pci/msi/irqdomain.o
  CC      drivers/acpi/acpica/dsargs.o
  AR      init/built-in.a
  AR      drivers/acpi/pmic/built-in.a
  CC      arch/x86/kernel/fpu/regset.o
  CC      sound/pci/hda/hda_codec.o
  CC      lib/zlib_inflate/inffast.o
  CC      crypto/asymmetric_keys/public_key.o
  CC      lib/crypto/mpi/generic_mpih-mul3.o
  CC      ipc/shm.o
  AR      fs/notify/inotify/built-in.a
  CC      fs/notify/fsnotify.o
  CC      block/bio.o
  CC      block/elevator.o
  CC      arch/x86/lib/insn.o
  CC      security/selinux/hooks.o
  CC      lib/zlib_deflate/deflate.o
  CC      arch/x86/kernel/fpu/signal.o
  CC      net/core/gen_stats.o
  CC      drivers/video/console/vgacon.o
  CC      lib/zlib_inflate/inflate.o
  CC      lib/zlib_deflate/deftree.o
  CC      security/keys/keyctl.o
  CC      kernel/sched/build_utility.o
  CC      drivers/acpi/acpica/dscontrol.o
  CC      arch/x86/lib/kaslr.o
  CC      arch/x86/kernel/acpi/sleep.o
  AR      drivers/video/backlight/built-in.a
  AS      arch/x86/kernel/acpi/wakeup_32.o
  CC      crypto/api.o
  AR      net/802/built-in.a
  CC      arch/x86/mm/pat/memtype_interval.o
  CC      arch/x86/pci/direct.o
  CC      sound/core/seq/seq_fifo.o
  CC      net/core/gen_estimator.o
  AR      arch/x86/power/built-in.a
  CC      arch/x86/kernel/apic/ipi.o
  CC      arch/x86/entry/vdso/vdso32/vgetcpu.o
  CC      lib/crypto/mpi/generic_mpih-rshift.o
  AR      net/ethernet/built-in.a
  HOSTCC  arch/x86/entry/vdso/vdso2c
  CC      arch/x86/lib/memcpy_32.o
  CC      fs/iomap/trace.o
  ASN.1   crypto/asymmetric_keys/x509.asn1.[ch]
  ASN.1   crypto/asymmetric_keys/x509_akid.asn1.[ch]
  CC      crypto/asymmetric_keys/x509_loader.o
  AS      arch/x86/lib/memmove_32.o
  CC      arch/x86/lib/misc.o
  CC      drivers/acpi/acpica/dsdebug.o
  CC      fs/quota/dquot.o
  AR      drivers/pci/msi/built-in.a
  CC      arch/x86/lib/pc-conf-reg.o
  CC      drivers/pci/pcie/portdrv.o
  CC      fs/proc/task_mmu.o
  CC      drivers/pci/pcie/rcec.o
  AR      drivers/pci/pwrctrl/built-in.a
  CC      fs/notify/notification.o
  CC      lib/zlib_inflate/infutil.o
  CC      arch/x86/kernel/kprobes/core.o
  CC      crypto/asymmetric_keys/x509_public_key.o
  CC      arch/x86/platform/efi/efi_32.o
  AS      arch/x86/lib/putuser.o
  CC      arch/x86/pci/mmconfig-shared.o
  CC      drivers/acpi/acpica/dsfield.o
  CC      lib/zlib_deflate/deflate_syms.o
  AS      arch/x86/lib/retpoline.o
  CC      arch/x86/lib/string_32.o
  AS      arch/x86/entry/entry.o
  CC      arch/x86/entry/vdso/vdso32-setup.o
  CC      arch/x86/kernel/fpu/xstate.o
  CC      security/selinux/selinuxfs.o
  CC      arch/x86/lib/strstr_32.o
  CC      arch/x86/lib/usercopy.o
  CC      sound/core/memory.o
  AR      arch/x86/events/amd/built-in.a
  CC      fs/proc/inode.o
  CC      crypto/cipher.o
  CC      arch/x86/kernel/acpi/cstate.o
  AR      arch/x86/mm/pat/built-in.a
  CC      arch/x86/mm/init.o
  CC      arch/x86/kernel/cpu/mce/severity.o
  CC      arch/x86/kernel/apic/vector.o
  CC      lib/crypto/mpi/generic_mpih-sub1.o
  CC      lib/zlib_inflate/inftrees.o
  CC      fs/quota/quota_v2.o
  CC      sound/core/seq/seq_prioq.o
  AR      sound/arm/built-in.a
  CC      security/selinux/netlink.o
  CC      ipc/syscall.o
  AR      drivers/video/console/built-in.a
  CC      fs/kernfs/mount.o
  CC      drivers/video/aperture.o
  CC      lib/crypto/memneq.o
  AR      lib/zlib_deflate/built-in.a
  VDSO    arch/x86/entry/vdso/vdso32.so.dbg
  CC      fs/sysfs/file.o
  CC      lib/zlib_inflate/inflate_syms.o
  OBJCOPY arch/x86/entry/vdso/vdso32.so
  CC      arch/x86/lib/usercopy_32.o
  VDSO2C  arch/x86/entry/vdso/vdso-image-32.c
  CC      arch/x86/entry/vdso/vdso-image-32.o
  CC      fs/sysfs/dir.o
  CC      fs/devpts/inode.o
  CC      drivers/acpi/acpica/dsinit.o
  CC      mm/oom_kill.o
  CC      fs/notify/group.o
  ASN.1   crypto/asymmetric_keys/pkcs7.asn1.[ch]
  CC      crypto/asymmetric_keys/pkcs7_trust.o
  CC      fs/notify/mark.o
  CC      security/keys/permission.o
  CC      drivers/pci/pcie/bwctrl.o
  CC      arch/x86/events/intel/bts.o
  CC      drivers/acpi/acpica/dsmethod.o
  AR      arch/x86/entry/vdso/built-in.a
  AS      arch/x86/entry/entry_32.o
  AS      arch/x86/platform/efi/efi_stub_32.o
  CC      arch/x86/lib/msr-smp.o
  CC      arch/x86/platform/efi/runtime-map.o
  AR      arch/x86/kernel/acpi/built-in.a
  CC      fs/iomap/iter.o
  CC      security/lsm_audit.o
  CC      arch/x86/entry/syscall_32.o
  CC      block/blk-core.o
  AR      lib/zlib_inflate/built-in.a
  CC      fs/kernfs/inode.o
  CC      fs/notify/fdinfo.o
  CC      lib/crypto/mpi/generic_mpih-add1.o
  AR      arch/x86/platform/iris/built-in.a
  CC      lib/crypto/utils.o
  CC      kernel/locking/mutex.o
  CC      sound/pci/hda/hda_jack.o
  CC      arch/x86/kernel/kprobes/opt.o
  CC      sound/core/seq/seq_timer.o
  CC      crypto/asymmetric_keys/pkcs7_verify.o
  CC      sound/pci/hda/hda_auto_parser.o
  CC      arch/x86/pci/fixup.o
  CC      security/keys/process_keys.o
  CC      ipc/ipc_sysctl.o
  CC      security/selinux/nlmsgtab.o
  CC      arch/x86/lib/cache-smp.o
  CC      io_uring/notif.o
  CC      arch/x86/platform/intel/iosf_mbi.o
  CC      drivers/acpi/acpica/dsmthdat.o
  CC      arch/x86/kernel/cpu/mce/genpool.o
  CC      drivers/video/cmdline.o
  CC      drivers/pci/pcie/aspm.o
  CC      fs/sysfs/symlink.o
  CC      arch/x86/mm/init_32.o
  CC      lib/lzo/lzo1x_compress.o
  CC      fs/quota/quota_tree.o
  CC      arch/x86/lib/crc32-glue.o
  AR      fs/devpts/built-in.a
  CC      io_uring/tctx.o
  CC      lib/lzo/lzo1x_decompress_safe.o
  AR      arch/x86/kernel/fpu/built-in.a
  CC      fs/quota/quota.o
  CC      crypto/compress.o
  AS      arch/x86/lib/crc32-pclmul.o
  CC      fs/sysfs/mount.o
  CC      security/selinux/netif.o
  CC      lib/crypto/mpi/mpicoder.o
  CC      crypto/asymmetric_keys/x509.asn1.o
  CC      crypto/asymmetric_keys/x509_akid.asn1.o
  CC      drivers/pci/hotplug/pci_hotplug_core.o
  CC      crypto/asymmetric_keys/x509_cert_parser.o
  CC      ipc/mqueue.o
  CC      fs/iomap/buffered-io.o
  AR      arch/x86/platform/efi/built-in.a
  AR      fs/notify/built-in.a
  AR      drivers/pci/controller/dwc/built-in.a
  CC      ipc/namespace.o
  AR      drivers/pci/controller/mobiveil/built-in.a
  AR      drivers/pci/controller/plda/built-in.a
  AR      drivers/pci/controller/built-in.a
  CC      drivers/acpi/acpica/dsobject.o
  CC      fs/kernfs/dir.o
  CC      ipc/mq_sysctl.o
  CC      arch/x86/lib/msr.o
  CC      fs/proc/root.o
  CC      arch/x86/events/intel/ds.o
  CC      sound/core/seq/seq_system.o
  CC      arch/x86/kernel/apic/init.o
  AR      lib/lzo/built-in.a
  CC      sound/core/control.o
  CC      arch/x86/events/core.o
  AR      arch/x86/kernel/kprobes/built-in.a
  CC      arch/x86/pci/acpi.o
  CC      arch/x86/entry/common.o
  CC      crypto/algapi.o
  CC      arch/x86/kernel/cpu/mce/intel.o
  AR      arch/x86/platform/intel/built-in.a
  AR      arch/x86/platform/intel-mid/built-in.a
  AR      arch/x86/platform/intel-quark/built-in.a
  CC      fs/netfs/buffered_read.o
  AR      arch/x86/platform/olpc/built-in.a
  CC      fs/ext4/balloc.o
  CC      io_uring/filetable.o
  AR      arch/x86/platform/scx200/built-in.a
  CC      drivers/video/nomodeset.o
  AR      arch/x86/platform/ts5500/built-in.a
  AR      drivers/pci/switch/built-in.a
  AR      arch/x86/platform/uv/built-in.a
  CC      io_uring/rw.o
  AR      arch/x86/platform/built-in.a
  CC      io_uring/net.o
  CC      security/device_cgroup.o
  CC      arch/x86/kernel/cpu/mtrr/mtrr.o
  CC      sound/core/misc.o
  CC      drivers/acpi/acpica/dsopcode.o
  CC      crypto/asymmetric_keys/pkcs7.asn1.o
  CC      drivers/video/hdmi.o
  CC      security/keys/request_key.o
  CC      crypto/asymmetric_keys/pkcs7_parser.o
  CC      mm/fadvise.o
  CC      sound/pci/hda/hda_sysfs.o
  CC      lib/crypto/mpi/mpi-add.o
  CC      fs/sysfs/group.o
  CC      mm/maccess.o
  CC      kernel/locking/semaphore.o
  CC      fs/quota/kqid.o
  CC      arch/x86/mm/fault.o
  CC      arch/x86/kernel/apic/hw_nmi.o
  CC      security/keys/request_key_auth.o
  CC      drivers/acpi/dptf/int340x_thermal.o
  CC      sound/core/seq/seq_ports.o
  CC      drivers/acpi/x86/apple.o
  CC      drivers/pci/hotplug/acpi_pcihp.o
  CC      kernel/locking/rwsem.o
  CC      fs/proc/base.o
  CC      drivers/pci/pcie/pme.o
  CC      arch/x86/kernel/cpu/mce/amd.o
  CC      drivers/acpi/x86/cmos_rtc.o
  AS      arch/x86/lib/msr-reg.o
  CC      arch/x86/lib/msr-reg-export.o
  CC      fs/ext4/bitmap.o
  CC      drivers/acpi/acpica/dspkginit.o
  LDS     arch/x86/kernel/vmlinux.lds
  CC      drivers/acpi/tables.o
  CC      arch/x86/pci/legacy.o
  AR      crypto/asymmetric_keys/built-in.a
  CC      fs/iomap/direct-io.o
  AS      arch/x86/entry/thunk.o
  CC      fs/quota/netlink.o
  CC      security/keys/user_defined.o
  AR      arch/x86/entry/built-in.a
  CC      block/blk-sysfs.o
  AS      arch/x86/lib/hweight.o
  AR      drivers/acpi/dptf/built-in.a
  CC      arch/x86/kernel/apic/io_apic.o
  CC      arch/x86/lib/iomem.o
  AS      arch/x86/kernel/head_32.o
  AR      sound/sh/built-in.a
  CC      arch/x86/kernel/cpu/mce/threshold.o
  CC      lib/crypto/mpi/mpi-bit.o
  AR      sound/synth/emux/built-in.a
  AR      sound/synth/built-in.a
  CC      arch/x86/kernel/cpu/mtrr/if.o
  CC      crypto/scatterwalk.o
  CC      arch/x86/kernel/apic/msi.o
  AR      fs/sysfs/built-in.a
  CC      fs/proc/generic.o
  CC      sound/pci/hda/hda_controller.o
  CC      kernel/power/qos.o
  CC      net/sched/sch_generic.o
  CC      security/selinux/netnode.o
  CC      arch/x86/events/probe.o
  CC      arch/x86/kernel/cpu/mtrr/generic.o
  AR      drivers/video/built-in.a
  CC      fs/kernfs/file.o
  CC      arch/x86/kernel/cpu/mtrr/cleanup.o
  AR      kernel/sched/built-in.a
  CC      net/core/net_namespace.o
  CC      fs/kernfs/symlink.o
  CC      mm/page-writeback.o
  CC      drivers/acpi/acpica/dsutils.o
  CC      fs/netfs/buffered_write.o
  CC      arch/x86/kernel/apic/probe_32.o
  AR      drivers/pci/hotplug/built-in.a
  CC      fs/proc/array.o
  AR      ipc/built-in.a
  CC      drivers/acpi/x86/lpss.o
  CC      arch/x86/kernel/cpu/mtrr/amd.o
  CC      sound/core/seq/seq_info.o
  CC      arch/x86/lib/atomic64_32.o
  CC      crypto/proc.o
  AR      sound/usb/misc/built-in.a
  AR      sound/usb/usx2y/built-in.a
  AR      sound/usb/caiaq/built-in.a
  CC      arch/x86/kernel/cpu/microcode/core.o
  AR      sound/usb/6fire/built-in.a
  CC      arch/x86/lib/inat.o
  AR      sound/usb/hiface/built-in.a
  AR      sound/usb/bcd2000/built-in.a
  AR      sound/usb/built-in.a
  CC      net/netlink/af_netlink.o
  CC      fs/ext4/block_validity.o
  CC      kernel/power/main.o
  AR      drivers/pci/pcie/built-in.a
  CC      kernel/locking/percpu-rwsem.o
  CC      drivers/pci/access.o
  CC      arch/x86/pci/irq.o
  CC      arch/x86/pci/common.o
  CC      security/keys/proc.o
  AR      arch/x86/lib/built-in.a
  AR      arch/x86/lib/lib.a
  CC      block/blk-flush.o
  CC      arch/x86/kernel/cpu/microcode/intel.o
  CC      lib/crypto/mpi/mpi-cmp.o
  CC      arch/x86/kernel/cpu/microcode/amd.o
  CC      drivers/acpi/acpica/dswexec.o
  CC      drivers/acpi/x86/s2idle.o
  CC      arch/x86/mm/ioremap.o
  CC      drivers/pnp/pnpacpi/core.o
  CC      arch/x86/kernel/head32.o
  AR      fs/quota/built-in.a
  CC      sound/core/seq/seq_dummy.o
  CC      security/selinux/netport.o
  CC      arch/x86/pci/early.o
  CC      arch/x86/events/intel/knc.o
  CC      security/keys/sysctl.o
  AR      sound/firewire/built-in.a
  CC      sound/pci/hda/hda_proc.o
  CC      drivers/pci/bus.o
  CC      block/blk-settings.o
  CC      kernel/locking/spinlock.o
  CC      fs/jbd2/transaction.o
  CC      fs/netfs/direct_read.o
  CC      crypto/aead.o
  CC      fs/iomap/fiemap.o
  CC      fs/jbd2/commit.o
  CC      mm/folio-compat.o
  AR      net/bpf/built-in.a
  CC      drivers/acpi/acpica/dswload.o
  CC      fs/proc/fd.o
  CC      net/ethtool/ioctl.o
  AR      fs/kernfs/built-in.a
  CC      fs/proc/proc_tty.o
  AR      arch/x86/kernel/cpu/mce/built-in.a
  CC      crypto/geniv.o
  CC      arch/x86/kernel/cpu/mtrr/cyrix.o
  CC      block/blk-ioc.o
  AR      sound/sparc/built-in.a
  CC      io_uring/poll.o
  CC      block/blk-map.o
  CC      net/ethtool/common.o
  CC      crypto/lskcipher.o
  CC      kernel/locking/osq_lock.o
  CC      lib/crypto/mpi/mpi-sub-ui.o
  CC      fs/ext4/dir.o
  CC      sound/core/device.o
  CC      drivers/pnp/pnpacpi/rsparser.o
  AR      sound/core/seq/built-in.a
  CC      net/netlink/genetlink.o
  CC      fs/iomap/seek.o
  CC      fs/ext4/ext4_jbd2.o
  CC      security/keys/keyctl_pkey.o
  CC      block/blk-merge.o
  CC      kernel/printk/printk.o
  CC      sound/core/info.o
  AR      sound/spi/built-in.a
  CC      arch/x86/kernel/cpu/mtrr/centaur.o
  CC      net/core/secure_seq.o
  CC      net/core/flow_dissector.o
  CC      kernel/locking/qspinlock.o
  CC      kernel/power/console.o
  CC      arch/x86/mm/extable.o
  CC      drivers/acpi/acpica/dswload2.o
  CC      drivers/acpi/x86/utils.o
  CC      crypto/skcipher.o
  CC      arch/x86/kernel/cpu/mtrr/legacy.o
  CC      arch/x86/events/intel/lbr.o
  CC      drivers/pci/probe.o
  AR      arch/x86/kernel/apic/built-in.a
  CC      arch/x86/pci/bus_numa.o
  AR      arch/x86/kernel/cpu/microcode/built-in.a
  CC      security/selinux/status.o
  CC      arch/x86/pci/amd_bus.o
  CC      net/netlink/policy.o
  CC      fs/ramfs/inode.o
  AR      sound/parisc/built-in.a
  CC      arch/x86/events/utils.o
  CC      fs/netfs/direct_write.o
  CC      drivers/acpi/osi.o
  CC      drivers/acpi/osl.o
  CC      kernel/power/process.o
  CC      arch/x86/kernel/cpu/cacheinfo.o
  CC      lib/crypto/mpi/mpi-div.o
  AR      drivers/amba/built-in.a
  CC      arch/x86/kernel/ebda.o
  CC      drivers/acpi/acpica/dswscope.o
  CC      kernel/irq/irqdesc.o
  CC      fs/proc/cmdline.o
  CC      kernel/locking/rtmutex_api.o
  CC      net/sched/sch_mq.o
  AR      security/keys/built-in.a
  CC      security/selinux/ss/ebitmap.o
  AR      arch/x86/kernel/cpu/mtrr/built-in.a
  CC      fs/iomap/swapfile.o
  CC      sound/pci/hda/hda_hwdep.o
  CC      mm/readahead.o
  CC      lib/crypto/mpi/mpi-mod.o
  CC      kernel/power/suspend.o
  CC      sound/core/isadma.o
  CC      kernel/locking/qrwlock.o
  CC      kernel/printk/printk_safe.o
  AR      drivers/pnp/pnpacpi/built-in.a
  CC      fs/netfs/iterator.o
  CC      net/core/sysctl_net_core.o
  CC      drivers/pnp/core.o
  CC      drivers/pnp/card.o
  CC      drivers/acpi/acpica/dswstate.o
  CC      drivers/acpi/x86/blacklist.o
  AR      sound/pcmcia/vx/built-in.a
  CC      lib/crypto/mpi/mpi-mul.o
  CC      net/ethtool/netlink.o
  AR      sound/pcmcia/pdaudiocf/built-in.a
  AR      sound/pcmcia/built-in.a
  AR      drivers/clk/actions/built-in.a
  AR      drivers/clk/analogbits/built-in.a
  CC      arch/x86/mm/mmap.o
  AR      drivers/clk/bcm/built-in.a
  AR      drivers/clk/imgtec/built-in.a
  AR      drivers/clk/imx/built-in.a
  CC      fs/jbd2/recovery.o
  AR      drivers/clk/ingenic/built-in.a
  CC      drivers/dma/dw/core.o
  AR      drivers/clk/mediatek/built-in.a
  AR      arch/x86/pci/built-in.a
  AR      drivers/clk/microchip/built-in.a
  CC      io_uring/eventfd.o
  AR      drivers/clk/mstar/built-in.a
  CC      fs/proc/consoles.o
  AR      drivers/clk/mvebu/built-in.a
  CC      fs/ramfs/file-mmu.o
  AR      drivers/clk/ralink/built-in.a
  CC      arch/x86/events/rapl.o
  CC      lib/crypto/mpi/mpih-cmp.o
  AR      drivers/clk/renesas/built-in.a
  CC      sound/core/vmaster.o
  AR      drivers/clk/socfpga/built-in.a
  CC      drivers/acpi/utils.o
  AR      drivers/clk/sophgo/built-in.a
  CC      arch/x86/mm/pgtable.o
  AR      drivers/clk/sprd/built-in.a
  AR      drivers/clk/starfive/built-in.a
  CC      mm/swap.o
  AR      drivers/clk/sunxi-ng/built-in.a
  AR      drivers/clk/ti/built-in.a
  AR      sound/mips/built-in.a
  AR      drivers/clk/versatile/built-in.a
  CC      drivers/acpi/acpica/evevent.o
  AR      drivers/clk/xilinx/built-in.a
  AR      drivers/clk/built-in.a
  AR      drivers/soc/apple/built-in.a
  CC      drivers/dma/dw/dw.o
  AR      drivers/soc/aspeed/built-in.a
  CC      kernel/irq/handle.o
  CC      crypto/seqiv.o
  AR      drivers/soc/bcm/built-in.a
  CC      drivers/dma/dw/idma32.o
  AR      drivers/soc/fsl/built-in.a
  CC      arch/x86/kernel/cpu/scattered.o
  AR      drivers/soc/fujitsu/built-in.a
  CC      sound/pci/hda/hda_intel.o
  AR      drivers/soc/hisilicon/built-in.a
  AR      fs/iomap/built-in.a
  AR      drivers/soc/imx/built-in.a
  CC      fs/proc/cpuinfo.o
  AR      drivers/soc/ixp4xx/built-in.a
  CC      fs/ext4/extents.o
  AR      drivers/soc/loongson/built-in.a
  CC      fs/ext4/extents_status.o
  AR      drivers/acpi/x86/built-in.a
  CC      net/ethtool/bitset.o
  CC      arch/x86/events/msr.o
  AR      drivers/soc/mediatek/built-in.a
  CC      block/blk-timeout.o
  AR      drivers/soc/microchip/built-in.a
  AR      drivers/soc/nuvoton/built-in.a
  AR      drivers/soc/pxa/built-in.a
  CC      drivers/dma/dw/acpi.o
  AR      drivers/soc/amlogic/built-in.a
  AR      drivers/soc/qcom/built-in.a
  AR      drivers/soc/renesas/built-in.a
  CC      lib/lz4/lz4_decompress.o
  CC      crypto/echainiv.o
  CC      drivers/pci/host-bridge.o
  AR      drivers/soc/rockchip/built-in.a
  AR      drivers/soc/sunxi/built-in.a
  CC      fs/jbd2/checkpoint.o
  AR      drivers/soc/ti/built-in.a
  AR      drivers/soc/versatile/built-in.a
  AR      drivers/soc/xilinx/built-in.a
  AR      drivers/soc/built-in.a
  CC      net/ethtool/strset.o
  AR      kernel/locking/built-in.a
  CC      sound/core/ctljack.o
  CC      arch/x86/events/intel/p4.o
  CC      mm/truncate.o
  CC      drivers/acpi/reboot.o
  CC      drivers/acpi/acpica/evgpe.o
  CC      block/blk-lib.o
  CC      lib/crypto/chacha.o
  AR      net/netlink/built-in.a
  CC      net/sched/sch_frag.o
  CC      drivers/pnp/driver.o
  CC      fs/hugetlbfs/inode.o
  CC      drivers/dma/hsu/hsu.o
  CC      lib/crypto/mpi/mpih-div.o
  AR      drivers/dma/idxd/built-in.a
  CC      fs/netfs/locking.o
  AR      sound/soc/built-in.a
  CC      arch/x86/kernel/cpu/topology_common.o
  CC      fs/proc/devices.o
  AR      sound/atmel/built-in.a
  CC      mm/vmscan.o
  CC      kernel/power/hibernate.o
  AR      fs/ramfs/built-in.a
  CC      io_uring/uring_cmd.o
  CC      security/selinux/ss/hashtab.o
  CC      kernel/irq/manage.o
  CC      drivers/acpi/nvs.o
  CC      arch/x86/mm/physaddr.o
  CC      net/netfilter/core.o
  CC      net/xfrm/xfrm_policy.o
  CC      net/ipv4/netfilter/nf_defrag_ipv4.o
  CC      net/unix/af_unix.o
  CC      net/xfrm/xfrm_state.o
  CC      sound/core/jack.o
  CC      fs/proc/interrupts.o
  CC      net/ipv6/netfilter/ip6_tables.o
  CC      drivers/acpi/acpica/evgpeblk.o
  CC      crypto/ahash.o
  CC      net/netfilter/nf_log.o
  CC      arch/x86/kernel/cpu/topology_ext.o
  CC      kernel/printk/nbcon.o
  CC      kernel/rcu/update.o
  CC      drivers/pci/remove.o
  CC      net/core/dev.o
  AR      drivers/dma/dw/built-in.a
  CC      mm/shrinker.o
  CC      sound/hda/hda_bus_type.o
  CC      net/xfrm/xfrm_hash.o
  CC      drivers/pnp/resource.o
  CC      drivers/pci/pci.o
  CC      security/selinux/ss/symtab.o
  AR      drivers/dma/amd/built-in.a
  CC      net/core/dev_addr_lists.o
  CC      kernel/printk/printk_ringbuffer.o
  CC      kernel/printk/sysctl.o
  AR      sound/pci/korg1212/built-in.a
  CC      arch/x86/mm/tlb.o
  CC      block/blk-mq.o
  CC      io_uring/openclose.o
  CC      fs/jbd2/revoke.o
  CC      security/selinux/ss/sidtab.o
  AR      drivers/dma/hsu/built-in.a
  AR      drivers/dma/mediatek/built-in.a
  CC      fs/proc/loadavg.o
  AR      drivers/dma/qcom/built-in.a
  CC      drivers/acpi/acpica/evgpeinit.o
  AR      drivers/dma/stm32/built-in.a
  CC      arch/x86/kernel/cpu/topology_amd.o
  CC      lib/crypto/mpi/mpih-mul.o
  AR      drivers/dma/ti/built-in.a
  CC      fs/netfs/main.o
  AR      drivers/dma/xilinx/built-in.a
  CC      drivers/dma/dmaengine.o
  CC      sound/core/hwdep.o
  CC      fs/netfs/misc.o
  CC      arch/x86/events/intel/p6.o
  CC      net/packet/af_packet.o
  AR      kernel/livepatch/built-in.a
  CC      kernel/irq/spurious.o
  CC      net/ethtool/linkinfo.o
  CC      net/ethtool/linkmodes.o
  CC      lib/crypto/mpi/mpi-pow.o
  AR      lib/lz4/built-in.a
  CC      kernel/irq/resend.o
  CC      net/sched/sch_api.o
  CC      sound/hda/hdac_bus.o
  AR      sound/pci/hda/built-in.a
  CC      fs/ext4/file.o
  CC      drivers/pnp/manager.o
  AR      sound/pci/mixart/built-in.a
  AR      sound/pci/nm256/built-in.a
  AR      sound/pci/oxygen/built-in.a
  AR      sound/pci/pcxhr/built-in.a
  AR      sound/pci/riptide/built-in.a
  CC      drivers/acpi/acpica/evgpeutil.o
  AR      sound/pci/rme9652/built-in.a
  AR      sound/pci/trident/built-in.a
  CC      net/ipv6/af_inet6.o
  AR      sound/pci/ymfpci/built-in.a
  AR      sound/pci/vx222/built-in.a
  CC      kernel/rcu/sync.o
  AR      sound/pci/built-in.a
  CC      arch/x86/kernel/cpu/common.o
  CC      net/netfilter/nf_queue.o
  CC      net/ipv4/netfilter/nf_reject_ipv4.o
  CC      kernel/power/snapshot.o
  CC      kernel/rcu/srcutree.o
  CC      fs/proc/meminfo.o
  CC      crypto/shash.o
  AR      kernel/printk/built-in.a
  CC      net/ipv6/anycast.o
  CC      net/ipv6/ip6_output.o
  CC      kernel/rcu/tree.o
  CC      net/ipv4/netfilter/ip_tables.o
  CC      drivers/acpi/wakeup.o
  CC      drivers/pci/pci-driver.o
  CC      kernel/irq/chip.o
  AR      fs/hugetlbfs/built-in.a
  CC      net/unix/garbage.o
  CC      sound/core/timer.o
  CC      drivers/acpi/acpica/evglock.o
  CC      kernel/power/swap.o
  CC      fs/jbd2/journal.o
  CC      io_uring/sqpoll.o
  CC      arch/x86/events/intel/pt.o
  CC      kernel/dma/mapping.o
  CC      drivers/virtio/virtio.o
  CC      drivers/pnp/support.o
  CC      drivers/tty/vt/vt_ioctl.o
  CC      lib/crypto/mpi/mpiutil.o
  CC      arch/x86/mm/cpu_entry_area.o
  CC      net/unix/sysctl_net_unix.o
  CC      sound/hda/hdac_device.o
  CC      kernel/rcu/rcu_segcblist.o
  CC      drivers/acpi/acpica/evhandler.o
  CC      security/selinux/ss/avtab.o
  CC      net/ethtool/rss.o
  CC      drivers/virtio/virtio_ring.o
  CC      fs/proc/stat.o
  CC      net/ipv6/netfilter/ip6table_filter.o
  CC      drivers/dma/virt-dma.o
  CC      drivers/virtio/virtio_anchor.o
  CC      crypto/akcipher.o
  CC      drivers/pnp/interface.o
  CC      drivers/acpi/acpica/evmisc.o
  AR      lib/crypto/mpi/built-in.a
  CC      lib/crypto/aes.o
  CC      arch/x86/mm/maccess.o
  CC      fs/netfs/objects.o
  CC      net/ipv4/route.o
  CC      net/ethtool/linkstate.o
  CC      kernel/irq/dummychip.o
  CC      fs/proc/uptime.o
  CC      net/netfilter/nf_sockopt.o
  CC      drivers/pci/search.o
  CC      net/sched/sch_blackhole.o
  CC      kernel/dma/direct.o
  CC      arch/x86/mm/pgprot.o
  CC      lib/zstd/zstd_decompress_module.o
  CC      drivers/char/hw_random/core.o
  AR      net/unix/built-in.a
  CC      net/core/dst.o
  CC      drivers/char/mem.o
  CC      drivers/acpi/acpica/evregion.o
  CC      drivers/char/agp/backend.o
  CC      drivers/dma/acpi-dma.o
  CC      arch/x86/kernel/cpu/rdrand.o
  CC      kernel/dma/ops_helpers.o
  CC      drivers/tty/vt/vc_screen.o
  CC      drivers/char/hw_random/intel-rng.o
  CC      sound/hda/hdac_sysfs.o
  CC      arch/x86/kernel/cpu/match.o
  CC      drivers/pnp/quirks.o
  CC      arch/x86/mm/pgtable_32.o
  CC      arch/x86/events/intel/uncore.o
  CC      kernel/irq/devres.o
  CC      mm/shmem.o
  CC      lib/crypto/arc4.o
  CC      kernel/power/user.o
  CC      sound/core/hrtimer.o
  CC      net/ipv4/netfilter/iptable_filter.o
  CC      block/blk-mq-tag.o
  CC      net/sched/cls_api.o
  CC      lib/zstd/decompress/huf_decompress.o
  CC      fs/proc/util.o
  CC      crypto/sig.o
  CC      security/selinux/ss/policydb.o
  CC      drivers/acpi/acpica/evrgnini.o
  CC      io_uring/xattr.o
  CC      net/xfrm/xfrm_input.o
  CC      net/ipv6/netfilter/ip6table_mangle.o
  CC      fs/netfs/read_collect.o
  CC      arch/x86/kernel/platform-quirks.o
  CC      arch/x86/kernel/cpu/bugs.o
  CC      arch/x86/kernel/process_32.o
  CC      lib/crypto/gf128mul.o
  CC      drivers/pci/rom.o
  CC      kernel/irq/kexec.o
  CC      fs/ext4/fsmap.o
  CC      drivers/char/agp/generic.o
  CC      lib/crypto/blake2s.o
  AR      sound/x86/built-in.a
  CC      sound/core/pcm.o
  CC      sound/core/pcm_native.o
  CC      net/ethtool/debug.o
  CC      net/netfilter/utils.o
  AR      drivers/dma/built-in.a
  CC      drivers/char/hw_random/amd-rng.o
  AR      sound/xen/built-in.a
  CC      kernel/irq/autoprobe.o
  AR      sound/virtio/built-in.a
  CC      kernel/irq/irqdomain.o
  CC      sound/hda/hdac_regmap.o
  CC      drivers/pci/setup-res.o
  CC      arch/x86/mm/iomap_32.o
  CC      drivers/acpi/acpica/evsci.o
  CC      drivers/tty/vt/selection.o
  CC      fs/proc/version.o
  CC      sound/sound_core.o
  CC      drivers/pnp/system.o
  CC      kernel/power/poweroff.o
  CC      drivers/char/hw_random/geode-rng.o
  CC      kernel/dma/remap.o
  CC      net/ipv4/inetpeer.o
  CC      drivers/virtio/virtio_pci_modern_dev.o
  CC      lib/xz/xz_dec_syms.o
  CC      net/sched/act_api.o
  CC      lib/crypto/blake2s-generic.o
  CC      crypto/kpp.o
  AR      kernel/power/built-in.a
  CC      drivers/acpi/acpica/evxface.o
  CC      drivers/acpi/acpica/evxfevnt.o
  CC      net/ipv6/ip6_input.o
  CC      net/xfrm/xfrm_output.o
  CC      io_uring/nop.o
  CC      net/ipv4/protocol.o
  CC      sound/hda/hdac_controller.o
  AR      net/packet/built-in.a
  AR      fs/jbd2/built-in.a
  CC      fs/ext4/fsync.o
  CC      kernel/entry/common.o
  CC      net/ipv4/netfilter/iptable_mangle.o
  CC      block/blk-stat.o
  ASN.1   crypto/rsapubkey.asn1.[ch]
  CC      fs/ext4/hash.o
  CC      fs/ext4/ialloc.o
  CC      arch/x86/mm/hugetlbpage.o
  CC      drivers/char/agp/isoch.o
  CC      net/core/netevent.o
  CC      lib/xz/xz_dec_stream.o
  AR      drivers/pnp/built-in.a
  CC      fs/proc/softirqs.o
  CC      net/sched/sch_fifo.o
  CC      drivers/pci/irq.o
  CC      net/core/neighbour.o
  CC      drivers/tty/vt/keyboard.o
  CC      drivers/char/hw_random/via-rng.o
  CC      mm/util.o
  CC      lib/crypto/sha1.o
  AR      kernel/dma/built-in.a
  CC      net/ipv4/ip_input.o
  CC      net/ipv4/netfilter/ipt_REJECT.o
  CC      lib/zstd/decompress/zstd_ddict.o
  CC      net/ipv6/netfilter/nf_defrag_ipv6_hooks.o
  CC      drivers/acpi/acpica/evxfgpe.o
  CC      net/ethtool/wol.o
  CC      fs/netfs/read_pgpriv2.o
  CC      arch/x86/events/intel/uncore_nhmex.o
  CC      lib/zstd/decompress/zstd_decompress.o
  CC      block/blk-mq-sysfs.o
  CC      drivers/virtio/virtio_pci_legacy_dev.o
  CC      kernel/irq/proc.o
  CC      lib/xz/xz_dec_lzma2.o
  CC      net/netfilter/nfnetlink.o
  ASN.1   crypto/rsaprivkey.asn1.[ch]
  CC      crypto/rsa.o
  AR      drivers/char/hw_random/built-in.a
  CC      lib/crypto/sha256.o
  CC      io_uring/fs.o
  CC      fs/proc/namespaces.o
  CC      io_uring/splice.o
  CC      arch/x86/mm/dump_pagetables.o
  AR      drivers/iommu/amd/built-in.a
  AR      drivers/iommu/intel/built-in.a
  AR      drivers/iommu/arm/arm-smmu/built-in.a
  AR      drivers/iommu/arm/arm-smmu-v3/built-in.a
  AR      drivers/iommu/arm/built-in.a
  CC      drivers/virtio/virtio_pci_modern.o
  AR      drivers/iommu/iommufd/built-in.a
  CC      lib/zstd/decompress/zstd_decompress_block.o
  AR      drivers/iommu/riscv/built-in.a
  CC      sound/hda/hdac_stream.o
  CC      drivers/iommu/iommu.o
  CC      arch/x86/kernel/cpu/aperfmperf.o
  CC      drivers/acpi/acpica/evxfregn.o
  CC      drivers/iommu/iommu-traces.o
  CC      drivers/char/agp/amd64-agp.o
  CC      sound/hda/array.o
  CC      drivers/pci/vpd.o
  CC      sound/hda/hdmi_chmap.o
  CC      lib/xz/xz_dec_bcj.o
  CC      kernel/entry/syscall_user_dispatch.o
  CC      drivers/tty/hvc/hvc_console.o
  AR      kernel/rcu/built-in.a
  CC      lib/dim/dim.o
  CC      arch/x86/events/intel/uncore_snb.o
  CC      drivers/acpi/sleep.o
  CC      fs/proc/self.o
  CC      drivers/acpi/acpica/exconcat.o
  CC      sound/core/pcm_lib.o
  AR      lib/crypto/built-in.a
  CC      block/blk-mq-cpumap.o
  CC      fs/netfs/read_retry.o
  CC      net/netfilter/nfnetlink_log.o
  CC      crypto/rsa_helper.o
  CC      crypto/rsa-pkcs1pad.o
  CC      net/ethtool/features.o
  CC [M]  net/ipv4/netfilter/iptable_nat.o
  CC      kernel/module/main.o
  CC      net/ipv6/addrconf.o
  CC      kernel/irq/migration.o
  CC      net/xfrm/xfrm_sysctl.o
  CC      mm/mmzone.o
  AR      lib/xz/built-in.a
  CC      arch/x86/kernel/cpu/cpuid-deps.o
  CC      net/ethtool/privflags.o
  CC      lib/dim/net_dim.o
  CC      drivers/acpi/acpica/exconfig.o
  CC      fs/netfs/read_single.o
  CC      arch/x86/mm/highmem_32.o
  CC      drivers/acpi/device_sysfs.o
  CC      io_uring/sync.o
  CC      net/core/rtnetlink.o
  CC      drivers/virtio/virtio_pci_common.o
  CC      net/ipv6/netfilter/nf_conntrack_reasm.o
  CC      drivers/tty/vt/vt.o
  CC      net/sched/cls_cgroup.o
  AR      kernel/entry/built-in.a
  CC      security/selinux/ss/services.o
  CC      drivers/connector/cn_queue.o
  AR      drivers/gpu/host1x/built-in.a
  CC      drivers/connector/connector.o
  AR      drivers/gpu/vga/built-in.a
  CC      drivers/char/agp/intel-agp.o
  CC      drivers/pci/setup-bus.o
  CC      security/selinux/ss/conditional.o
  CC      net/xfrm/xfrm_replay.o
  CC      fs/proc/thread_self.o
  CC      net/netfilter/nf_conntrack_core.o
  CC      net/core/utils.o
  AR      drivers/gpu/drm/tests/built-in.a
  AR      drivers/gpu/drm/arm/built-in.a
  CC      drivers/char/random.o
  CC      net/ipv4/ip_fragment.o
  AR      drivers/gpu/drm/clients/built-in.a
  CC      kernel/irq/cpuhotplug.o
  CC      drivers/acpi/acpica/exconvrt.o
  CC      drivers/gpu/drm/display/drm_display_helper_mod.o
  CC      arch/x86/kernel/cpu/umwait.o
  CC      sound/hda/trace.o
  AR      drivers/tty/hvc/built-in.a
  AR      net/dsa/built-in.a
  CC      drivers/gpu/drm/display/drm_dp_dual_mode_helper.o
  MKCAP   arch/x86/kernel/cpu/capflags.c
  CC      mm/vmstat.o
  CC      block/blk-mq-sched.o
  CC      crypto/rsassa-pkcs1.o
  CC      fs/ext4/indirect.o
  CC      arch/x86/events/intel/uncore_snbep.o
  CC      net/netfilter/nf_conntrack_standalone.o
  AR      arch/x86/mm/built-in.a
  CC      arch/x86/kernel/cpu/powerflags.o
  CC      crypto/acompress.o
  CC      net/xfrm/xfrm_device.o
  CC      arch/x86/kernel/signal.o
  CC      fs/ext4/inline.o
  CC      fs/proc/proc_sysctl.o
  CC      drivers/acpi/acpica/excreate.o
  CC      fs/netfs/rolling_buffer.o
  CC      io_uring/msg_ring.o
  CC      drivers/pci/vc.o
  CC      fs/proc/proc_net.o
  CC      net/ethtool/rings.o
  AR      net/ipv4/netfilter/built-in.a
  CC      drivers/acpi/acpica/exdebug.o
  CC      drivers/char/agp/intel-gtt.o
  CC      lib/dim/rdma_dim.o
  CC      kernel/module/strict_rwx.o
  CC      drivers/virtio/virtio_pci_legacy.o
  CC      kernel/irq/pm.o
  CC      drivers/virtio/virtio_pci_admin_legacy_io.o
  CC      drivers/connector/cn_proc.o
  CC      net/sched/ematch.o
  CC      drivers/iommu/iommu-sysfs.o
  CC      drivers/tty/serial/8250/8250_core.o
  CC      fs/fat/cache.o
  CC      drivers/gpu/drm/display/drm_dp_helper.o
  CC      drivers/gpu/drm/display/drm_dp_mst_topology.o
  CC      sound/hda/hdac_component.o
  CC      drivers/acpi/acpica/exdump.o
  AR      lib/dim/built-in.a
  AR      drivers/tty/ipwireless/built-in.a
  CC      sound/core/pcm_misc.o
  CC      kernel/irq/msi.o
  CC      kernel/module/kmod.o
  CC      block/ioctl.o
  CC      net/ethtool/channels.o
  CC      arch/x86/kernel/cpu/topology.o
  CC      net/ipv6/netfilter/nf_reject_ipv6.o
  CC      crypto/scompress.o
  CC      lib/zstd/zstd_common_module.o
  CC      net/core/link_watch.o
  CC      net/ipv4/ip_forward.o
  CC      lib/zstd/common/debug.o
  CC      net/ipv4/ip_options.o
  CC      sound/hda/hdac_i915.o
  CC      arch/x86/kernel/cpu/proc.o
  CC      net/core/filter.o
  CC      net/core/sock_diag.o
  CC      drivers/acpi/acpica/exfield.o
  CC      drivers/acpi/device_pm.o
  CC      io_uring/advise.o
  CC      drivers/virtio/virtio_input.o
  CC      fs/netfs/write_collect.o
  COPY    drivers/tty/vt/defkeymap.c
  CC      arch/x86/kernel/signal_32.o
  CC      net/xfrm/xfrm_nat_keepalive.o
  CC      sound/last.o
  CC      arch/x86/kernel/traps.o
  CC      drivers/pci/mmap.o
  CC      drivers/iommu/dma-iommu.o
  CC      mm/backing-dev.o
  CC      lib/zstd/common/entropy_common.o
  CC      sound/core/pcm_memory.o
  CC      net/ipv6/addrlabel.o
  AR      drivers/char/agp/built-in.a
  CC      drivers/char/misc.o
  CC      net/core/dev_ioctl.o
  CC      fs/fat/dir.o
  CC      net/sunrpc/auth_gss/auth_gss.o
  CC      security/selinux/ss/mls.o
  CC      lib/zstd/common/error_private.o
  CC      lib/zstd/common/fse_decompress.o
  CC      drivers/acpi/acpica/exfldio.o
  CC      drivers/tty/serial/serial_core.o
  AR      net/sched/built-in.a
  CC      drivers/tty/serial/8250/8250_platform.o
  CC      crypto/algboss.o
  AR      drivers/connector/built-in.a
  CC      kernel/module/tree_lookup.o
  CC      drivers/base/power/sysfs.o
  CC      fs/proc/kcore.o
  CC      sound/hda/intel-dsp-config.o
  CC      fs/proc/vmcore.o
  CC      sound/core/memalloc.o
  CC      fs/ext4/inode.o
  CC      block/genhd.o
  CC      drivers/tty/vt/consolemap.o
  CC      drivers/pci/devres.o
  CC      net/netfilter/nf_conntrack_expect.o
  CC      net/ethtool/coalesce.o
  CC      kernel/irq/affinity.o
  CC      io_uring/epoll.o
  CC      drivers/virtio/virtio_dma_buf.o
  AR      net/wireless/tests/built-in.a
  CC      net/wireless/core.o
  CC      drivers/char/virtio_console.o
  CC      arch/x86/kernel/cpu/feat_ctl.o
  CC      drivers/acpi/acpica/exmisc.o
  CC      lib/zstd/common/zstd_common.o
  CC      drivers/gpu/drm/display/drm_dsc_helper.o
  CC      drivers/acpi/proc.o
  AR      lib/zstd/built-in.a
  CC      drivers/base/power/generic_ops.o
  CC      lib/fonts/fonts.o
  CC      arch/x86/events/intel/uncore_discovery.o
  CC      net/xfrm/xfrm_algo.o
  CC      net/ipv6/netfilter/ip6t_ipv6header.o
  CC      lib/argv_split.o
  CC      drivers/base/firmware_loader/builtin/main.o
  CC      kernel/module/kallsyms.o
  CC      kernel/module/procfs.o
  CC      fs/netfs/write_issue.o
  CC      fs/netfs/write_retry.o
  CC      arch/x86/kernel/idt.o
  CC      mm/mm_init.o
  CC      net/ipv4/ip_output.o
  CC      kernel/irq/matrix.o
  CC      drivers/tty/serial/8250/8250_pnp.o
  CC      drivers/acpi/acpica/exmutex.o
  CC      sound/hda/intel-nhlt.o
  HOSTCC  drivers/tty/vt/conmakehash
  CC      crypto/testmgr.o
  AR      drivers/base/firmware_loader/builtin/built-in.a
  CC      drivers/base/firmware_loader/main.o
  CC      drivers/acpi/bus.o
  CC      lib/fonts/font_8x16.o
  CC      fs/ext4/ioctl.o
  AR      drivers/virtio/built-in.a
  CC      drivers/tty/serial/8250/8250_rsa.o
  CC      drivers/base/power/common.o
  CC      drivers/gpu/drm/ttm/ttm_tt.o
  AR      net/mac80211/tests/built-in.a
  CC      drivers/iommu/iova.o
  CC      net/mac80211/main.o
  CC      security/selinux/ss/context.o
  CC      io_uring/statx.o
  CC      drivers/pci/proc.o
  CC      net/ethtool/pause.o
  CC      sound/core/pcm_timer.o
  CC      net/sunrpc/clnt.o
  CC      drivers/tty/vt/defkeymap.o
  CC      fs/proc/kmsg.o
  CC      drivers/acpi/acpica/exnames.o
  CC      drivers/gpu/drm/ttm/ttm_bo.o
  CC      net/ipv4/ip_sockglue.o
  AR      lib/fonts/built-in.a
  CC      lib/bug.o
  CONMK   drivers/tty/vt/consolemap_deftbl.c
  CC      fs/fat/fatent.o
  CC      drivers/tty/vt/consolemap_deftbl.o
  AR      drivers/tty/vt/built-in.a
  CC      net/ethtool/eee.o
  CC      kernel/module/sysfs.o
  CC      fs/isofs/namei.o
  CC      sound/hda/intel-sdw-acpi.o
  CC      block/ioprio.o
  CC      drivers/char/hpet.o
  CC      fs/proc/page.o
  CC      crypto/cmac.o
  CC      drivers/base/power/qos.o
  CC      net/mac80211/status.o
  CC      arch/x86/events/intel/cstate.o
  CC      net/netfilter/nf_conntrack_helper.o
  CC      net/core/tso.o
  CC      drivers/tty/serial/8250/8250_port.o
  CC      drivers/acpi/acpica/exoparg1.o
  CC      drivers/tty/serial/8250/8250_dma.o
  CC      fs/fat/file.o
  CC      net/xfrm/xfrm_user.o
  CC      net/mac80211/driver-ops.o
  CC      block/badblocks.o
  CC      sound/core/seq_device.o
  CC      net/ipv6/netfilter/ip6t_REJECT.o
  CC      io_uring/timeout.o
  AR      fs/netfs/built-in.a
  CC      net/wireless/sysfs.o
  AR      sound/hda/built-in.a
  AR      drivers/base/firmware_loader/built-in.a
  AR      drivers/iommu/built-in.a
  CC      drivers/gpu/drm/display/drm_hdcp_helper.o
  CC      drivers/tty/serial/serial_base_bus.o
  CC      lib/buildid.o
  CC      fs/ext4/mballoc.o
  CC      net/sunrpc/xprt.o
  CC      drivers/char/nvram.o
  CC      arch/x86/kernel/irq.o
  AR      kernel/irq/built-in.a
  CC      drivers/tty/tty_io.o
  CC      mm/percpu.o
  CC      security/selinux/netlabel.o
  CC      crypto/hmac.o
  CC      drivers/pci/pci-sysfs.o
  CC      net/sunrpc/auth_gss/gss_mech_switch.o
  CC      fs/isofs/inode.o
  CC      drivers/base/regmap/regmap.o
  AR      kernel/module/built-in.a
  CC      drivers/acpi/acpica/exoparg2.o
  CC      kernel/time/time.o
  CC      drivers/acpi/acpica/exoparg3.o
  AR      fs/proc/built-in.a
  CC      drivers/gpu/drm/ttm/ttm_bo_util.o
  CC      net/ipv6/route.o
  CC      kernel/time/timer.o
  CC      net/ethtool/tsinfo.o
  AR      sound/core/built-in.a
  AR      sound/built-in.a
  CC      net/netlabel/netlabel_user.o
  CC      drivers/base/power/runtime.o
  CC      kernel/time/hrtimer.o
  AR      arch/x86/events/intel/built-in.a
  CC      drivers/tty/serial/serial_ctrl.o
  AR      arch/x86/events/built-in.a
  CC      drivers/block/loop.o
  CC      net/ipv6/ip6_fib.o
  CC      drivers/acpi/acpica/exoparg6.o
  CC      net/ipv6/ipv6_sockglue.o
  CC      block/blk-rq-qos.o
  CC      lib/clz_tab.o
  CC      drivers/gpu/drm/display/drm_hdmi_helper.o
  CC      fs/fat/inode.o
  CC      lib/cmdline.o
  CC      drivers/gpu/drm/ttm/ttm_bo_vm.o
  CC      crypto/crypto_null.o
  CC      net/wireless/radiotap.o
  AR      drivers/char/built-in.a
  CC      drivers/pci/slot.o
  CC      net/mac80211/sta_info.o
  CC      lib/cpumask.o
  CC      fs/isofs/dir.o
  CC      arch/x86/kernel/cpu/intel.o
  CC      io_uring/fdinfo.o
  CC      net/netfilter/nf_conntrack_proto.o
  CC      drivers/acpi/acpica/exprep.o
  AR      net/ipv6/netfilter/built-in.a
  CC      drivers/acpi/acpica/exregion.o
  CC      fs/fat/misc.o
  CC      net/netlabel/netlabel_kapi.o
  CC      net/core/sock_reuseport.o
  CC      net/ipv4/inet_hashtables.o
  CC      mm/slab_common.o
  AR      security/selinux/built-in.a
  CC      drivers/acpi/glue.o
  CC      net/sunrpc/socklib.o
  AR      security/built-in.a
  CC      drivers/gpu/drm/display/drm_scdc_helper.o
  CC      crypto/md5.o
  CC      net/sunrpc/auth_gss/svcauth_gss.o
  CC      drivers/base/power/wakeirq.o
  CC      drivers/acpi/scan.o
  CC      net/rfkill/core.o
  CC      drivers/acpi/acpica/exresnte.o
  CC      block/disk-events.o
  CC      lib/ctype.o
  CC      lib/dec_and_lock.o
  CC      drivers/gpu/drm/ttm/ttm_module.o
  CC      drivers/tty/serial/8250/8250_dwlib.o
  CC      net/ethtool/cabletest.o
  CC      drivers/pci/pci-acpi.o
  CC      net/9p/mod.o
  CC      arch/x86/kernel/cpu/tsx.o
  CC      fs/isofs/util.o
  CC      net/netlabel/netlabel_domainhash.o
  CC      io_uring/cancel.o
  CC      drivers/acpi/mipi-disco-img.o
  CC      lib/decompress.o
  CC      lib/decompress_bunzip2.o
  CC      lib/decompress_inflate.o
  CC      drivers/acpi/acpica/exresolv.o
  CC      crypto/sha256_generic.o
  CC      kernel/futex/core.o
  CC      arch/x86/kernel/irq_32.o
  CC      drivers/base/power/main.o
  CC      arch/x86/kernel/cpu/intel_epb.o
  CC      net/dns_resolver/dns_key.o
  CC      net/wireless/util.o
  CC      net/handshake/alert.o
  CC      drivers/gpu/drm/ttm/ttm_execbuf_util.o
  CC      lib/decompress_unlz4.o
  CC      net/9p/client.o
  CC      kernel/time/sleep_timeout.o
  CC      arch/x86/kernel/dumpstack_32.o
  CC      drivers/block/virtio_blk.o
  CC      fs/fat/nfs.o
  AR      drivers/gpu/drm/display/built-in.a
  CC      drivers/misc/eeprom/eeprom_93cx6.o
  CC      block/blk-ia-ranges.o
  CC      net/netfilter/nf_conntrack_proto_generic.o
  CC      drivers/acpi/acpica/exresop.o
  CC      drivers/tty/serial/8250/8250_pcilib.o
  CC      net/sunrpc/xprtsock.o
  CC      fs/isofs/rock.o
  CC      net/mac80211/wep.o
  CC      arch/x86/kernel/cpu/amd.o
  CC      net/rfkill/input.o
  AR      net/xfrm/built-in.a
  CC      drivers/tty/n_tty.o
  CC      net/ipv6/ndisc.o
  CC      net/netfilter/nf_conntrack_proto_tcp.o
  CC      net/sunrpc/auth_gss/gss_rpc_upcall.o
  CC      mm/compaction.o
  CC      crypto/sha512_generic.o
  CC      kernel/time/timekeeping.o
  CC      kernel/futex/syscalls.o
  CC      kernel/cgroup/cgroup.o
  CC      drivers/pci/iomap.o
  CC      net/netfilter/nf_conntrack_proto_udp.o
  AR      drivers/mfd/built-in.a
  CC      net/ipv4/inet_timewait_sock.o
  CC      io_uring/waitid.o
  CC      drivers/gpu/drm/i915/i915_config.o
  CC      net/dns_resolver/dns_query.o
  CC      net/netfilter/nf_conntrack_proto_icmp.o
  CC      lib/decompress_unlzma.o
  AR      drivers/misc/eeprom/built-in.a
  CC      net/ethtool/tunnels.o
  AR      drivers/misc/cb710/built-in.a
  CC      drivers/tty/tty_ioctl.o
  AR      drivers/misc/lis3lv02d/built-in.a
  CC      drivers/acpi/acpica/exserial.o
  AR      drivers/misc/cardreader/built-in.a
  AR      drivers/misc/keba/built-in.a
  AR      drivers/misc/built-in.a
  CC      fs/fat/namei_vfat.o
  CC      fs/fat/namei_msdos.o
  CC      drivers/gpu/drm/ttm/ttm_range_manager.o
  CC      drivers/base/regmap/regcache.o
  CC      drivers/acpi/resource.o
  CC      drivers/gpu/drm/i915/i915_driver.o
  CC      fs/nfs/client.o
  CC      drivers/tty/serial/8250/8250_early.o
  CC      net/netlabel/netlabel_addrlist.o
  CC      fs/ext4/migrate.o
  CC      block/early-lookup.o
  AR      net/rfkill/built-in.a
  CC      block/bounce.o
  CC      drivers/acpi/acpica/exstore.o
  CC      drivers/tty/tty_ldisc.o
  CC      drivers/pci/quirks.o
  CC      fs/isofs/export.o
  CC      crypto/sha3_generic.o
  CC      net/sunrpc/auth_gss/gss_rpc_xdr.o
  CC      arch/x86/kernel/cpu/hygon.o
  CC      net/handshake/genl.o
  AR      net/dns_resolver/built-in.a
  CC      net/ipv6/udp.o
  CC      net/core/fib_notifier.o
  AR      drivers/block/built-in.a
  CC      block/bsg.o
  CC      kernel/futex/pi.o
  CC      drivers/tty/serial/serial_port.o
  CC      drivers/gpu/drm/ttm/ttm_resource.o
  CC      lib/decompress_unlzo.o
  CC      drivers/tty/serial/8250/8250_exar.o
  CC      drivers/base/power/wakeup.o
  CC      drivers/acpi/acpica/exstoren.o
  CC      drivers/tty/serial/8250/8250_lpss.o
  CC      io_uring/register.o
  CC      net/9p/error.o
  CC      net/netfilter/nf_conntrack_extend.o
  AR      drivers/base/test/built-in.a
  CC      net/sunrpc/sched.o
  CC      drivers/base/regmap/regcache-rbtree.o
  CC      kernel/cgroup/rstat.o
  CC      fs/isofs/joliet.o
  CC      net/ipv4/inet_connection_sock.o
  CC      crypto/ecb.o
  CC      mm/show_mem.o
  CC      arch/x86/kernel/cpu/centaur.o
  CC      drivers/tty/serial/earlycon.o
  CC      fs/nfs/dir.o
  CC      drivers/gpu/drm/i915/i915_drm_client.o
  CC      drivers/acpi/acpica/exstorob.o
  CC      net/sunrpc/auth_gss/trace.o
  CC      fs/ext4/mmp.o
  CC      net/ethtool/fec.o
  CC      net/9p/protocol.o
  AR      drivers/nfc/built-in.a
  CC      net/ipv6/udplite.o
  AR      fs/fat/built-in.a
  CC      kernel/time/ntp.o
  CC      drivers/gpu/drm/ttm/ttm_pool.o
  CC      fs/nfs/file.o
  CC      lib/decompress_unxz.o
  CC      block/blk-cgroup.o
  CC      net/netlabel/netlabel_mgmt.o
  CC      net/handshake/netlink.o
  CC      net/netfilter/nf_conntrack_acct.o
  CC      crypto/cbc.o
  CC      arch/x86/kernel/cpu/transmeta.o
  CC      net/mac80211/aead_api.o
  CC      kernel/futex/requeue.o
  AR      drivers/dax/hmem/built-in.a
  CC      drivers/acpi/acpica/exsystem.o
  AR      drivers/dax/built-in.a
  CC      net/9p/trans_common.o
  CC      drivers/acpi/acpi_processor.o
  CC      kernel/trace/trace_clock.o
  CC      fs/isofs/compress.o
  CC      net/sunrpc/auth.o
  CC      net/ipv4/tcp.o
  CC      drivers/base/regmap/regcache-flat.o
  CC      arch/x86/kernel/cpu/zhaoxin.o
  CC      kernel/trace/ring_buffer.o
  CC      drivers/tty/serial/8250/8250_mid.o
  CC      drivers/pci/pci-label.o
  CC      drivers/base/component.o
  CC      arch/x86/kernel/time.o
  CC      lib/decompress_unzstd.o
  CC      net/mac80211/wpa.o
  CC      net/core/xdp.o
  CC      net/core/flow_offload.o
  CC      drivers/acpi/acpica/extrace.o
  CC      kernel/cgroup/namespace.o
  CC      crypto/ctr.o
  CC      drivers/base/power/wakeup_stats.o
  CC      drivers/base/regmap/regcache-maple.o
  CC      drivers/tty/tty_buffer.o
  CC      fs/ext4/move_extent.o
  CC      drivers/tty/serial/8250/8250_pci.o
  CC      kernel/bpf/core.o
  CC      net/9p/trans_fd.o
  CC      kernel/events/core.o
  CC      arch/x86/kernel/cpu/vortex.o
  CC      kernel/time/clocksource.o
  CC      kernel/futex/waitwake.o
  CC      kernel/events/ring_buffer.o
  CC      mm/interval_tree.o
  CC      net/ethtool/eeprom.o
  CC      drivers/gpu/drm/i915/i915_getparam.o
  CC      drivers/gpu/drm/ttm/ttm_device.o
  CC      drivers/acpi/acpica/exutils.o
  AR      drivers/gpu/drm/renesas/rcar-du/built-in.a
  AR      drivers/gpu/drm/renesas/rz-du/built-in.a
  AR      drivers/gpu/drm/renesas/built-in.a
  CC      net/sunrpc/auth_null.o
  CC      lib/dump_stack.o
  CC      io_uring/truncate.o
  CC      crypto/gcm.o
  CC      lib/earlycpio.o
  AR      fs/isofs/built-in.a
  CC      net/netfilter/nf_conntrack_seqadj.o
  CC      net/ipv4/tcp_input.o
  CC      net/ipv6/raw.o
  AR      drivers/gpu/drm/omapdrm/built-in.a
  CC      drivers/base/power/trace.o
  CC      drivers/gpu/drm/i915/i915_ioctl.o
  CC      kernel/events/callchain.o
  CC      arch/x86/kernel/cpu/perfctr-watchdog.o
  CC      drivers/dma-buf/dma-buf.o
  CC      net/handshake/request.o
  CC      drivers/dma-buf/dma-fence.o
  CC      net/mac80211/scan.o
  CC      drivers/pci/vgaarb.o
  CC      net/netlabel/netlabel_unlabeled.o
  CC      kernel/time/jiffies.o
  CC      net/wireless/reg.o
  CC      drivers/acpi/acpica/hwacpi.o
  CC      drivers/base/regmap/regmap-debugfs.o
  CC      fs/ext4/namei.o
  CC      block/blk-ioprio.o
  AR      kernel/futex/built-in.a
  CC      fs/ext4/page-io.o
  CC      drivers/gpu/drm/ttm/ttm_sys_manager.o
  CC      lib/extable.o
  CC      fs/ext4/readpage.o
  CC      kernel/time/timer_list.o
  CC      drivers/acpi/acpica/hwesleep.o
  CC      net/9p/trans_virtio.o
  CC      mm/list_lru.o
  CC      net/core/gro.o
  CC      net/core/netdev-genl.o
  CC      arch/x86/kernel/ioport.o
  CC      drivers/gpu/drm/ttm/ttm_backup.o
  AR      drivers/base/power/built-in.a
  CC      arch/x86/kernel/cpu/vmware.o
  CC      kernel/fork.o
  CC      io_uring/memmap.o
  CC      net/ethtool/stats.o
  CC      net/sunrpc/auth_gss/gss_krb5_mech.o
  CC      net/netfilter/nf_conntrack_proto_icmpv6.o
  CC      drivers/dma-buf/dma-fence-array.o
  CC      net/sunrpc/auth_tls.o
  CC      net/wireless/scan.o
  CC      kernel/trace/trace.o
  CC      crypto/ccm.o
  CC      drivers/base/core.o
  CC      drivers/tty/serial/8250/8250_pericom.o
  CC      net/netfilter/nf_conntrack_netlink.o
  CC      drivers/acpi/acpica/hwgpe.o
  CC      drivers/gpu/drm/i915/i915_irq.o
  CC      lib/flex_proportions.o
  CC      mm/workingset.o
  AR      drivers/base/regmap/built-in.a
  CC      net/mac80211/offchannel.o
  CC      block/blk-iolatency.o
  AR      drivers/pci/built-in.a
  CC      drivers/acpi/processor_core.o
  CC      kernel/exec_domain.o
  CC      kernel/panic.o
  AR      drivers/cxl/core/built-in.a
  AR      drivers/cxl/built-in.a
  CC      net/devres.o
  CC      kernel/time/timeconv.o
  CC      arch/x86/kernel/dumpstack.o
  CC      lib/idr.o
  CC      drivers/dma-buf/dma-fence-chain.o
  CC      lib/iomem_copy.o
  CC      drivers/acpi/acpica/hwregs.o
  CC      drivers/acpi/acpica/hwsleep.o
  CC      drivers/gpu/drm/ttm/ttm_agp_backend.o
  CC      net/handshake/tlshd.o
  CC      kernel/cgroup/cgroup-v1.o
  CC      block/blk-iocost.o
  CC      io_uring/alloc_cache.o
  CC      drivers/base/bus.o
  CC      net/handshake/trace.o
  CC      net/netlabel/netlabel_cipso_v4.o
  CC      arch/x86/kernel/cpu/hypervisor.o
  AR      drivers/tty/serial/8250/built-in.a
  AR      drivers/tty/serial/built-in.a
  CC      drivers/tty/tty_port.o
  CC      kernel/time/timecounter.o
  CC      fs/nfs/getroot.o
  CC      kernel/time/alarmtimer.o
  CC      drivers/tty/tty_mutex.o
  CC      mm/debug.o
  CC      lib/irq_regs.o
  CC      crypto/aes_generic.o
  CC      arch/x86/kernel/cpu/mshyperv.o
  CC      kernel/events/hw_breakpoint.o
  CC      net/ipv6/icmp.o
  CC      lib/is_single_threaded.o
  CC      net/sunrpc/auth_gss/gss_krb5_seal.o
  CC      drivers/acpi/acpica/hwvalid.o
  AR      net/9p/built-in.a
  CC      arch/x86/kernel/cpu/debugfs.o
  CC      net/netfilter/nf_conntrack_ftp.o
  CC      drivers/dma-buf/dma-fence-unwrap.o
  CC      net/ethtool/phc_vclocks.o
  CC      block/mq-deadline.o
  CC      drivers/macintosh/mac_hid.o
  CC      arch/x86/kernel/cpu/bus_lock.o
  CC      block/kyber-iosched.o
  AR      drivers/gpu/drm/ttm/built-in.a
  CC      drivers/base/dd.o
  CC      net/wireless/nl80211.o
  CC      kernel/events/uprobes.o
  CC      fs/ext4/resize.o
  CC      io_uring/io-wq.o
  CC      net/core/netdev-genl-gen.o
  CC      drivers/gpu/drm/i915/i915_mitigations.o
  CC      lib/klist.o
  CC      drivers/acpi/acpica/hwxface.o
  AR      kernel/bpf/built-in.a
  CC      kernel/cgroup/freezer.o
  CC      drivers/gpu/drm/i915/i915_module.o
  CC      net/core/gso.o
  CC      drivers/tty/tty_ldsem.o
  CC      mm/gup.o
  CC      crypto/authenc.o
  CC      drivers/dma-buf/dma-resv.o
  CC      mm/mmap_lock.o
  CC      kernel/trace/trace_output.o
  CC      lib/kobject.o
  CC      net/ipv4/tcp_output.o
  AR      drivers/macintosh/built-in.a
  CC      net/sunrpc/auth_gss/gss_krb5_unseal.o
  CC      fs/nfs/inode.o
  CC      drivers/acpi/acpica/hwxfsleep.o
  CC      kernel/time/posix-timers.o
  CC      drivers/acpi/acpica/hwpci.o
  CC      net/netlabel/netlabel_calipso.o
  CC      drivers/base/syscore.o
  CC      kernel/trace/trace_seq.o
  CC      arch/x86/kernel/nmi.o
  CC      net/socket.o
  CC      net/ethtool/mm.o
  CC      arch/x86/kernel/cpu/capflags.o
  AR      arch/x86/kernel/cpu/built-in.a
  CC      net/ipv6/mcast.o
  AR      net/handshake/built-in.a
  CC      crypto/authencesn.o
  CC      fs/ext4/super.o
  CC      drivers/tty/tty_baudrate.o
  CC      fs/ext4/symlink.o
  CC      net/sunrpc/auth_unix.o
  CC      net/sunrpc/auth_gss/gss_krb5_wrap.o
  CC      fs/nfs/super.o
  CC      drivers/acpi/processor_pdc.o
  CC      drivers/acpi/acpica/nsaccess.o
  CC      kernel/cgroup/legacy_freezer.o
  AR      drivers/scsi/pcmcia/built-in.a
  CC      drivers/scsi/scsi.o
  CC      kernel/time/posix-cpu-timers.o
  CC      lib/kobject_uevent.o
  CC      net/core/net-sysfs.o
  CC      net/mac80211/ht.o
  CC      drivers/dma-buf/sync_file.o
  CC      drivers/gpu/drm/i915/i915_params.o
  CC      drivers/gpu/drm/i915/i915_pci.o
  CC      drivers/scsi/hosts.o
  CC      net/ipv4/tcp_timer.o
  CC      net/netfilter/nf_conntrack_irc.o
  AR      drivers/nvme/common/built-in.a
  CC      io_uring/futex.o
  AR      drivers/nvme/host/built-in.a
  AR      drivers/nvme/target/built-in.a
  AR      drivers/nvme/built-in.a
  CC      net/sunrpc/svc.o
  CC      net/sunrpc/svcsock.o
  CC      net/sunrpc/svcauth.o
  CC      drivers/tty/tty_jobctrl.o
  CC      kernel/cpu.o
  CC      drivers/acpi/acpica/nsalloc.o
  CC      net/ipv4/tcp_ipv4.o
  CC      net/ipv4/tcp_minisocks.o
  CC      net/sysctl_net.o
  CC      drivers/base/driver.o
  CC      kernel/time/posix-clock.o
  CC      arch/x86/kernel/ldt.o
  AR      net/netlabel/built-in.a
  CC      mm/highmem.o
  CC      kernel/cgroup/pids.o
  CC      kernel/trace/trace_stat.o
  CC      drivers/acpi/acpica/nsarguments.o
  CC      net/ethtool/module.o
  CC      drivers/scsi/scsi_ioctl.o
  CC      kernel/trace/trace_printk.o
  AR      drivers/dma-buf/built-in.a
  CC      lib/logic_pio.o
  CC      block/blk-mq-debugfs.o
  CC      crypto/lzo.o
  CC      block/blk-pm.o
  CC      kernel/exit.o
  CC      net/sunrpc/auth_gss/gss_krb5_crypto.o
  CC      net/core/hotdata.o
  CC      drivers/base/class.o
  CC      drivers/tty/n_null.o
  CC      drivers/acpi/acpica/nsconvert.o
  CC      io_uring/napi.o
  CC      drivers/gpu/drm/i915/i915_scatterlist.o
  CC      drivers/base/platform.o
  CC      kernel/time/itimer.o
  CC      fs/ext4/sysfs.o
  CC      net/sunrpc/auth_gss/gss_krb5_keys.o
  CC      drivers/ata/libata-core.o
  CC      kernel/cgroup/rdma.o
  CC      block/holder.o
  CC      drivers/tty/pty.o
  CC      net/netfilter/nf_conntrack_sip.o
  AR      drivers/net/phy/mediatek/built-in.a
  CC      drivers/scsi/scsicam.o
  AR      drivers/net/phy/qcom/built-in.a
  CC      drivers/net/phy/realtek/realtek_main.o
  CC      lib/maple_tree.o
  CC      crypto/lzo-rle.o
  CC      drivers/net/phy/mdio-boardinfo.o
  CC      drivers/scsi/scsi_error.o
  CC      arch/x86/kernel/setup.o
  CC      net/netfilter/nf_nat_core.o
  CC      drivers/acpi/acpica/nsdump.o
  CC      arch/x86/kernel/x86_init.o
  CC      kernel/cgroup/cpuset.o
  CC      mm/memory.o
  CC      kernel/cgroup/misc.o
  CC      kernel/trace/pid_list.o
  CC      arch/x86/kernel/i8259.o
  AR      drivers/gpu/drm/tilcdc/built-in.a
  CC      net/sunrpc/svcauth_unix.o
  CC      drivers/gpu/drm/virtio/virtgpu_drv.o
  AR      drivers/net/pse-pd/built-in.a
  CC      drivers/net/mdio/acpi_mdio.o
  CC      drivers/acpi/acpica/nseval.o
  CC      net/ethtool/cmis_fw_update.o
  CC      drivers/gpu/drm/i915/i915_switcheroo.o
  AR      drivers/net/pcs/built-in.a
  CC      drivers/net/phy/realtek/realtek_hwmon.o
  CC      net/core/netdev_rx_queue.o
  AR      block/built-in.a
  CC      drivers/net/phy/stubs.o
  CC      fs/ext4/xattr.o
  CC      drivers/ata/libata-scsi.o
  CC      drivers/ata/libata-eh.o
  CC      net/ethtool/cmis_cdb.o
  CC      drivers/base/cpu.o
  CC      fs/nfs/io.o
  CC      crypto/rng.o
  CC      net/mac80211/agg-tx.o
  CC      arch/x86/kernel/irqinit.o
  CC      kernel/time/clockevents.o
  CC      drivers/tty/tty_audit.o
  CC      drivers/acpi/acpica/nsinit.o
  CC      drivers/firewire/init_ohci1394_dma.o
  CC      lib/memcat_p.o
  CC      drivers/scsi/scsi_lib.o
  AR      drivers/net/ethernet/3com/built-in.a
  CC      net/ipv6/reassembly.o
  CC      drivers/net/ethernet/8390/ne2k-pci.o
  AR      net/sunrpc/auth_gss/built-in.a
  CC      net/ipv6/tcp_ipv6.o
  CC      drivers/scsi/constants.o
  CC      fs/nfs/direct.o
  CC      net/ipv6/ping.o
  AR      io_uring/built-in.a
  CC      net/ethtool/pse-pd.o
  CC      drivers/gpu/drm/virtio/virtgpu_kms.o
  CC      net/ipv4/tcp_cong.o
  CC      kernel/trace/trace_sched_switch.o
  CC      drivers/tty/sysrq.o
  CC      arch/x86/kernel/jump_label.o
  CC      net/mac80211/agg-rx.o
  CC      drivers/acpi/acpica/nsload.o
  CC      kernel/cgroup/debug.o
  AR      drivers/net/ethernet/adaptec/built-in.a
  CC      drivers/net/mdio/fwnode_mdio.o
  CC      fs/exportfs/expfs.o
  AR      drivers/net/phy/realtek/built-in.a
  CC      drivers/ata/libata-transport.o
  CC      kernel/time/tick-common.o
  CC      fs/ext4/xattr_hurd.o
  CC      drivers/net/phy/mdio_devres.o
  AR      drivers/net/wireless/admtek/built-in.a
  AR      drivers/net/wireless/ath/built-in.a
  AR      drivers/net/wireless/atmel/built-in.a
  CC      drivers/gpu/drm/i915/i915_sysfs.o
  AR      drivers/net/wireless/broadcom/built-in.a
  AR      drivers/net/wireless/intel/built-in.a
  AR      drivers/net/wireless/intersil/built-in.a
  CC      drivers/base/firmware.o
  CC      crypto/drbg.o
  AR      drivers/net/wireless/marvell/built-in.a
  AR      drivers/firewire/built-in.a
  AR      drivers/net/wireless/mediatek/built-in.a
  AR      drivers/net/wireless/microchip/built-in.a
  CC      drivers/net/ethernet/8390/8390.o
  AR      drivers/net/wireless/purelifi/built-in.a
  CC      crypto/jitterentropy.o
  CC      net/core/net-procfs.o
  AR      drivers/net/wireless/quantenna/built-in.a
  AR      kernel/events/built-in.a
  AR      drivers/net/wireless/ralink/built-in.a
  CC      drivers/net/phy/phy.o
  AR      drivers/net/wireless/realtek/built-in.a
  CC      drivers/gpu/drm/virtio/virtgpu_gem.o
  AR      drivers/net/wireless/rsi/built-in.a
  CC      net/sunrpc/addr.o
  CC      fs/ext4/xattr_trusted.o
  CC      drivers/acpi/acpica/nsnames.o
  AR      drivers/net/wireless/silabs/built-in.a
  AR      drivers/net/wireless/st/built-in.a
  AR      drivers/net/wireless/ti/built-in.a
  AR      drivers/net/wireless/zydas/built-in.a
  AR      drivers/net/wireless/virtual/built-in.a
  AR      drivers/net/wireless/built-in.a
  CC      net/ipv4/tcp_metrics.o
  CC      fs/lockd/clntlock.o
  CC      fs/nfs/pagelist.o
  CC      fs/nfs/read.o
  CC      fs/lockd/clntproc.o
  CC      fs/nls/nls_base.o
  CC      arch/x86/kernel/irq_work.o
  CC      net/netfilter/nf_nat_proto.o
  CC      drivers/base/init.o
  AR      drivers/gpu/drm/imx/built-in.a
  CC      kernel/trace/trace_nop.o
  AR      fs/exportfs/built-in.a
  CC      crypto/jitterentropy-kcapi.o
  CC      fs/ext4/xattr_user.o
  CC      drivers/acpi/acpica/nsobject.o
  CC      kernel/softirq.o
  AR      drivers/net/ethernet/agere/built-in.a
  CC      net/mac80211/vht.o
  CC      net/ethtool/plca.o
  AR      kernel/cgroup/built-in.a
  CC      net/ipv4/tcp_fastopen.o
  CC      fs/nfs/symlink.o
  AR      drivers/tty/built-in.a
  CC      drivers/net/phy/phy-c45.o
  CC      lib/nmi_backtrace.o
  CC      fs/nls/nls_cp437.o
  AR      drivers/net/mdio/built-in.a
  CC      mm/mincore.o
  CC      net/wireless/mlme.o
  AR      drivers/net/usb/built-in.a
  CC      fs/ext4/fast_commit.o
  CC      drivers/acpi/acpica/nsparse.o
  CC      net/netfilter/nf_nat_helper.o
  CC      drivers/cdrom/cdrom.o
  CC      kernel/time/tick-broadcast.o
  CC      drivers/gpu/drm/virtio/virtgpu_vram.o
  CC      drivers/gpu/drm/i915/i915_utils.o
  CC      arch/x86/kernel/probe_roms.o
  CC      crypto/ghash-generic.o
  CC      net/ipv4/tcp_rate.o
  CC      drivers/base/map.o
  CC      fs/nls/nls_ascii.o
  CC      net/ipv4/tcp_recovery.o
  CC      net/mac80211/he.o
  CC      drivers/scsi/scsi_lib_dma.o
  CC      net/sunrpc/rpcb_clnt.o
  CC      net/core/netpoll.o
  AR      drivers/net/ethernet/8390/built-in.a
  CC      kernel/trace/blktrace.o
  CC      drivers/net/phy/phy-core.o
  AR      drivers/net/ethernet/alacritech/built-in.a
  AR      drivers/net/ethernet/alteon/built-in.a
  AR      drivers/net/ethernet/amazon/built-in.a
  CC      drivers/acpi/acpica/nspredef.o
  CC      drivers/acpi/ec.o
  AR      drivers/net/ethernet/amd/built-in.a
  AR      drivers/net/ethernet/aquantia/built-in.a
  AR      drivers/net/ethernet/arc/built-in.a
  AR      drivers/net/ethernet/asix/built-in.a
  AR      drivers/net/ethernet/atheros/built-in.a
  AR      drivers/net/ethernet/cadence/built-in.a
  CC      drivers/net/ethernet/broadcom/bnx2.o
  CC      kernel/resource.o
  CC      net/core/fib_rules.o
  CC      net/wireless/ibss.o
  CC      crypto/hash_info.o
  CC      crypto/rsapubkey.asn1.o
  AR      drivers/auxdisplay/built-in.a
  CC      net/ipv6/exthdrs.o
  AR      drivers/net/ethernet/brocade/built-in.a
  CC      crypto/rsaprivkey.asn1.o
  CC      drivers/base/devres.o
  CC      fs/nls/nls_iso8859-1.o
  CC      drivers/net/phy/phy_device.o
  AR      crypto/built-in.a
  CC      net/netfilter/nf_nat_masquerade.o
  CC      drivers/ata/libata-trace.o
  CC      kernel/time/tick-broadcast-hrtimer.o
  CC      drivers/acpi/acpica/nsprepkg.o
  CC      mm/mlock.o
  CC      fs/lockd/clntxdr.o
  CC      drivers/gpu/drm/virtio/virtgpu_display.o
  CC      net/ethtool/phy.o
  CC      arch/x86/kernel/sys_ia32.o
  CC      fs/lockd/host.o
  CC      net/sunrpc/timer.o
  CC      kernel/sysctl.o
  CC      net/wireless/sme.o
  CC      drivers/scsi/scsi_scan.o
  CC      fs/nls/nls_utf8.o
  CC      drivers/gpu/drm/i915/intel_clock_gating.o
  CC      arch/x86/kernel/ksysfs.o
  CC      arch/x86/kernel/bootflag.o
  CC      kernel/capability.o
  CC      net/ipv4/tcp_ulp.o
  CC      kernel/time/tick-oneshot.o
  CC      kernel/time/tick-sched.o
  CC      drivers/acpi/acpica/nsrepair.o
  CC      net/core/net-traces.o
  CC      drivers/acpi/dock.o
  AR      fs/nls/built-in.a
  CC      drivers/gpu/drm/i915/intel_cpu_info.o
  CC      kernel/trace/trace_events.o
  CC      drivers/base/attribute_container.o
  CC      fs/nfs/unlink.o
  CC      fs/lockd/svc.o
  CC      drivers/gpu/drm/virtio/virtgpu_vq.o
  CC      drivers/acpi/pci_root.o
  CC      kernel/ptrace.o
  CC      lib/objpool.o
  CC      net/wireless/chan.o
  CC      drivers/acpi/acpica/nsrepair2.o
  CC      drivers/gpu/drm/i915/intel_device_info.o
  CC      net/netfilter/nf_nat_ftp.o
  CC      drivers/net/phy/linkmode.o
  CC      fs/ext4/orphan.o
  CC      arch/x86/kernel/e820.o
  CC      drivers/ata/libata-sata.o
  CC      drivers/base/transport_class.o
  AR      drivers/cdrom/built-in.a
  CC      kernel/time/timer_migration.o
  CC      drivers/net/ethernet/broadcom/tg3.o
  CC      net/ethtool/tsconfig.o
  AR      fs/unicode/built-in.a
  CC      arch/x86/kernel/pci-dma.o
  CC      fs/autofs/init.o
  CC      arch/x86/kernel/quirks.o
  CC      kernel/trace/trace_export.o
  CC      fs/lockd/svclock.o
  CC      drivers/gpu/drm/virtio/virtgpu_fence.o
  CC      drivers/pcmcia/cs.o
  CC      net/sunrpc/xdr.o
  CC      mm/mmap.o
  CC      arch/x86/kernel/kdebugfs.o
  CC      drivers/acpi/acpica/nssearch.o
  CC      fs/ext4/acl.o
  CC      drivers/base/topology.o
  CC      drivers/base/container.o
  CC      net/wireless/ethtool.o
  CC      drivers/gpu/drm/virtio/virtgpu_object.o
  CC      fs/autofs/inode.o
  CC      net/ipv6/datagram.o
  GEN     drivers/scsi/scsi_devinfo_tbl.c
  CC      fs/9p/vfs_super.o
  CC      drivers/scsi/scsi_devinfo.o
  CC      net/ipv4/tcp_offload.o
  CC      net/mac80211/s1g.o
  AR      fs/hostfs/built-in.a
  AR      drivers/gpu/drm/panel/built-in.a
  CC      drivers/acpi/acpica/nsutils.o
  CC      drivers/gpu/drm/virtio/virtgpu_debugfs.o
  CC      drivers/ata/libata-sff.o
  CC      fs/nfs/write.o
  CC      drivers/net/phy/phy_link_topology.o
  CC      lib/plist.o
  CC      drivers/pcmcia/socket_sysfs.o
  CC      fs/ext4/xattr_security.o
  CC      drivers/gpu/drm/i915/intel_memory_region.o
  CC      net/ipv6/ip6_flowlabel.o
  CC      drivers/acpi/pci_link.o
  CC      drivers/base/property.o
  CC      drivers/gpu/drm/virtio/virtgpu_plane.o
  CC      net/core/selftests.o
  CC      drivers/gpu/drm/i915/intel_pcode.o
  CC      mm/mmu_gather.o
  CC      mm/mprotect.o
  CC      drivers/acpi/pci_irq.o
  CC      net/netfilter/nf_nat_irc.o
  CC      drivers/net/phy/mdio_bus.o
  CC      kernel/trace/trace_event_perf.o
  CC      arch/x86/kernel/alternative.o
  CC      drivers/usb/common/common.o
  CC      mm/mremap.o
  CC      drivers/net/mii.o
  CC      drivers/acpi/acpica/nswalk.o
  AR      net/ethtool/built-in.a
  AR      drivers/net/ethernet/cavium/common/built-in.a
  AR      drivers/net/ethernet/cavium/thunder/built-in.a
  CC      drivers/usb/core/usb.o
  AR      drivers/net/ethernet/cavium/liquidio/built-in.a
  CC      fs/autofs/root.o
  AR      drivers/net/ethernet/cavium/octeon/built-in.a
  AR      drivers/net/ethernet/cavium/built-in.a
  CC      fs/9p/vfs_inode.o
  CC      fs/9p/vfs_inode_dotl.o
  CC      fs/9p/vfs_addr.o
  CC      drivers/usb/core/hub.o
  CC      drivers/scsi/scsi_sysctl.o
  CC      kernel/time/vsyscall.o
  CC      fs/lockd/svcshare.o
  CC      lib/radix-tree.o
  CC      drivers/pcmcia/cardbus.o
  CC      drivers/acpi/acpica/nsxfeval.o
  CC      drivers/acpi/acpica/nsxfname.o
  CC      net/mac80211/ibss.o
  CC      fs/9p/vfs_file.o
  CC      net/ipv6/inet6_connection_sock.o
  CC      drivers/gpu/drm/virtio/virtgpu_ioctl.o
  AR      drivers/usb/phy/built-in.a
  CC      drivers/usb/mon/mon_main.o
  CC      net/ipv4/tcp_plb.o
  CC      drivers/usb/common/debug.o
  AR      drivers/gpu/drm/bridge/analogix/built-in.a
  AR      drivers/gpu/drm/bridge/cadence/built-in.a
  CC      kernel/time/timekeeping_debug.o
  AR      drivers/gpu/drm/bridge/imx/built-in.a
  AR      drivers/gpu/drm/bridge/synopsys/built-in.a
  AR      drivers/gpu/drm/bridge/built-in.a
  CC      net/wireless/mesh.o
  CC      drivers/ata/libata-pmp.o
  AR      drivers/usb/common/built-in.a
  CC      drivers/pcmcia/ds.o
  CC      drivers/net/loopback.o
  CC      drivers/scsi/scsi_proc.o
  CC      drivers/net/netconsole.o
  CC      drivers/gpu/drm/i915/intel_region_ttm.o
  CC      kernel/trace/trace_events_filter.o
  CC      kernel/user.o
  CC      drivers/pcmcia/pcmcia_resource.o
  CC      net/netfilter/nf_nat_sip.o
  CC      fs/autofs/symlink.o
  CC      drivers/usb/mon/mon_stat.o
  CC      net/ipv6/udp_offload.o
  CC      drivers/acpi/acpica/nsxfobj.o
  CC      net/wireless/ap.o
  CC      drivers/base/cacheinfo.o
  CC      drivers/input/serio/serio.o
  CC      drivers/input/keyboard/atkbd.o
  CC      drivers/rtc/lib.o
  CC      mm/msync.o
  CC      drivers/net/phy/mdio_device.o
  CC      lib/ratelimit.o
  CC      arch/x86/kernel/i8253.o
  CC      drivers/ata/libata-acpi.o
  AR      fs/ext4/built-in.a
  CC      drivers/usb/core/hcd.o
  CC      fs/lockd/svcproc.o
  CC      drivers/rtc/class.o
  CC      drivers/scsi/scsi_debugfs.o
  CC      drivers/usb/core/urb.o
  CC      net/sunrpc/sunrpc_syms.o
  AR      drivers/net/ethernet/chelsio/built-in.a
  CC      fs/debugfs/inode.o
  CC      net/ipv4/datagram.o
  CC      fs/9p/vfs_dir.o
  CC      lib/rbtree.o
  CC      drivers/acpi/acpica/psargs.o
  CC      kernel/time/namespace.o
  CC      net/mac80211/iface.o
  CC      kernel/signal.o
  CC      drivers/rtc/interface.o
  CC      drivers/usb/mon/mon_text.o
  CC      drivers/gpu/drm/virtio/virtgpu_prime.o
  CC      fs/autofs/waitq.o
  CC      arch/x86/kernel/hw_breakpoint.o
  AR      drivers/gpu/drm/hisilicon/built-in.a
  CC      drivers/usb/mon/mon_bin.o
  CC      net/core/ptp_classifier.o
  CC      drivers/acpi/acpi_apd.o
  CC      lib/seq_buf.o
  CC      fs/9p/vfs_dentry.o
  CC      drivers/gpu/drm/i915/intel_runtime_pm.o
  CC      drivers/input/serio/i8042.o
  CC      drivers/base/swnode.o
  CC      drivers/usb/core/message.o
  CC      mm/page_vma_mapped.o
  CC      fs/autofs/expire.o
  CC      drivers/acpi/acpica/psloop.o
  CC      fs/lockd/svcsubs.o
  CC      drivers/scsi/scsi_trace.o
  CC      net/ipv6/seg6.o
  CC      net/wireless/trace.o
  AR      drivers/net/ethernet/cisco/built-in.a
  CC      kernel/trace/trace_events_trigger.o
  CC      drivers/i2c/algos/i2c-algo-bit.o
  CC      drivers/net/phy/swphy.o
  CC      mm/pagewalk.o
  CC      mm/pgtable-generic.o
  CC      drivers/pcmcia/cistpl.o
  AR      kernel/time/built-in.a
  AR      drivers/input/keyboard/built-in.a
  CC      fs/nfs/namespace.o
  CC      mm/rmap.o
  CC      drivers/input/mouse/psmouse-base.o
  CC      drivers/input/mouse/synaptics.o
  CC      drivers/usb/host/pci-quirks.o
  CC      drivers/ata/libata-pata-timings.o
  CC      drivers/acpi/acpica/psobject.o
  CC      net/sunrpc/cache.o
  CC      net/netfilter/x_tables.o
  CC      fs/debugfs/file.o
  CC      drivers/gpu/drm/virtio/virtgpu_trace_points.o
  CC      lib/siphash.o
  CC      mm/vmalloc.o
  CC      drivers/input/mouse/focaltech.o
  CC      fs/9p/v9fs.o
  CC      net/netfilter/xt_tcpudp.o
  CC      drivers/pcmcia/pcmcia_cis.o
  CC      arch/x86/kernel/tsc.o
  CC      net/ipv4/raw.o
  CC      drivers/gpu/drm/i915/intel_sbi.o
  CC      net/wireless/ocb.o
  CC      drivers/scsi/scsi_logging.o
  CC      fs/autofs/dev-ioctl.o
  AR      drivers/usb/mon/built-in.a
  CC      fs/tracefs/inode.o
  CC      drivers/net/phy/fixed_phy.o
  CC      net/core/netprio_cgroup.o
  CC      drivers/acpi/acpica/psopcode.o
  CC      drivers/base/faux.o
  CC      lib/string.o
  CC      net/sunrpc/rpc_pipe.o
  CC      net/ipv6/fib6_notifier.o
  CC      arch/x86/kernel/tsc_msr.o
  AR      drivers/i2c/algos/built-in.a
  CC      drivers/i2c/busses/i2c-i801.o
  CC      drivers/rtc/nvmem.o
  AR      drivers/i3c/built-in.a
  CC      drivers/pcmcia/rsrc_mgr.o
  CC      drivers/acpi/acpi_platform.o
  CC      net/sunrpc/sysfs.o
  CC      lib/timerqueue.o
  AR      drivers/gpu/drm/mxsfb/built-in.a
  CC      drivers/ata/ahci.o
  AR      drivers/gpu/drm/tiny/built-in.a
  CC      drivers/usb/class/usblp.o
  CC      fs/lockd/mon.o
  AR      drivers/net/ethernet/cortina/built-in.a
  CC      drivers/pcmcia/rsrc_nonstatic.o
  CC      drivers/usb/storage/scsiglue.o
  CC      net/sunrpc/svc_xprt.o
  CC      drivers/input/serio/serport.o
  CC      drivers/acpi/acpica/psopinfo.o
  CC      drivers/usb/host/ehci-hcd.o
  CC      kernel/trace/trace_eprobe.o
  CC      drivers/base/auxiliary.o
  CC      fs/9p/fid.o
  CC      lib/union_find.o
  CC      drivers/gpu/drm/virtio/virtgpu_submit.o
  CC      drivers/base/devtmpfs.o
  CC      drivers/base/module.o
  CC      lib/vsprintf.o
  CC      drivers/usb/core/driver.o
  CC      fs/nfs/mount_clnt.o
  CC      drivers/rtc/dev.o
  CC      lib/win_minmax.o
  CC      drivers/acpi/acpica/psparse.o
  CC      drivers/gpu/drm/i915/intel_step.o
  CC      net/netfilter/xt_CONNSECMARK.o
  CC      drivers/input/mouse/alps.o
  CC      drivers/scsi/scsi_pm.o
  AR      fs/debugfs/built-in.a
  CC      kernel/sys.o
  AR      drivers/gpu/drm/xlnx/built-in.a
  AR      drivers/i2c/muxes/built-in.a
  CC      drivers/usb/core/config.o
  AR      fs/autofs/built-in.a
  AR      drivers/input/joystick/built-in.a
  CC      fs/lockd/trace.o
  CC      fs/tracefs/event_inode.o
  CC      drivers/input/serio/libps2.o
  CC      net/netfilter/xt_NFLOG.o
  CC      net/wireless/pmsr.o
  CC      drivers/i2c/i2c-boardinfo.o
  CC      arch/x86/kernel/io_delay.o
  CC      drivers/usb/host/ehci-pci.o
  AR      drivers/net/phy/built-in.a
  CC      net/core/netclassid_cgroup.o
  CC      fs/nfs/nfstrace.o
  CC      net/ipv6/rpl.o
  CC      net/ipv6/ioam6.o
  CC      drivers/usb/storage/protocol.o
  CC      drivers/acpi/acpica/psscope.o
  CC      fs/9p/xattr.o
  AR      drivers/media/i2c/built-in.a
  CC      drivers/ata/libahci.o
  AR      drivers/media/tuners/built-in.a
  AR      drivers/usb/class/built-in.a
  CC      drivers/pcmcia/yenta_socket.o
  CC      net/ipv4/udp.o
  AR      drivers/media/rc/keymaps/built-in.a
  AR      drivers/media/rc/built-in.a
  AR      drivers/media/common/b2c2/built-in.a
  AR      drivers/media/common/saa7146/built-in.a
  AR      drivers/media/common/siano/built-in.a
  AR      drivers/media/common/v4l2-tpg/built-in.a
  CC      arch/x86/kernel/rtc.o
  AR      drivers/i2c/busses/built-in.a
  AR      drivers/media/common/videobuf2/built-in.a
  AR      drivers/media/common/built-in.a
  AR      drivers/gpu/drm/virtio/built-in.a
  AR      drivers/gpu/drm/gud/built-in.a
  CC      net/netfilter/xt_SECMARK.o
  CC      drivers/rtc/proc.o
  CC      drivers/rtc/sysfs.o
  AR      drivers/media/platform/allegro-dvt/built-in.a
  CC      drivers/base/auxiliary_sysfs.o
  AR      drivers/media/platform/amlogic/meson-ge2d/built-in.a
  AR      drivers/media/platform/amlogic/built-in.a
  CC      drivers/base/devcoredump.o
  CC      drivers/input/mouse/byd.o
  AR      drivers/media/platform/amphion/built-in.a
  CC [M]  fs/efivarfs/inode.o
  CC      drivers/gpu/drm/i915/intel_uncore.o
  AR      drivers/media/platform/aspeed/built-in.a
  CC      net/mac80211/link.o
  AR      drivers/media/platform/atmel/built-in.a
  AR      drivers/media/platform/broadcom/built-in.a
  CC      drivers/scsi/scsi_bsg.o
  AR      drivers/media/platform/cadence/built-in.a
  AR      drivers/media/platform/chips-media/coda/built-in.a
  CC      drivers/acpi/acpica/pstree.o
  AR      drivers/media/platform/chips-media/wave5/built-in.a
  AR      drivers/media/platform/chips-media/built-in.a
  AR      drivers/media/platform/imagination/built-in.a
  AR      drivers/input/tablet/built-in.a
  AR      drivers/media/platform/intel/built-in.a
  CC      drivers/gpu/drm/i915/intel_uncore_trace.o
  AR      drivers/media/platform/marvell/built-in.a
  AR      drivers/media/platform/mediatek/jpeg/built-in.a
  CC      drivers/scsi/scsi_common.o
  AR      drivers/media/platform/mediatek/mdp/built-in.a
  AR      drivers/input/serio/built-in.a
  CC      drivers/scsi/scsi_transport_spi.o
  AR      drivers/media/platform/mediatek/vcodec/common/built-in.a
  AR      drivers/media/platform/mediatek/vcodec/encoder/built-in.a
  AR      drivers/media/platform/mediatek/vcodec/decoder/built-in.a
  AR      drivers/media/platform/mediatek/vcodec/built-in.a
  AR      drivers/net/ethernet/dec/tulip/built-in.a
  AR      drivers/net/ethernet/dec/built-in.a
  CC      arch/x86/kernel/resource.o
  AR      drivers/media/platform/mediatek/vpu/built-in.a
  CC      kernel/trace/trace_kprobe.o
  AR      drivers/media/platform/mediatek/mdp3/built-in.a
  CC      net/core/dst_cache.o
  CC      fs/open.o
  AR      drivers/media/platform/mediatek/built-in.a
  CC      drivers/i2c/i2c-core-base.o
  AR      drivers/media/platform/microchip/built-in.a
  AR      drivers/media/platform/nuvoton/built-in.a
  CC      drivers/ata/ata_piix.o
  AR      drivers/media/platform/nvidia/tegra-vde/built-in.a
  AR      drivers/media/platform/nvidia/built-in.a
  AR      drivers/media/platform/nxp/dw100/built-in.a
  AR      drivers/media/platform/nxp/imx-jpeg/built-in.a
  CC      drivers/acpi/acpi_pnp.o
  CC      net/core/gro_cells.o
  AR      drivers/media/platform/nxp/imx8-isi/built-in.a
  AR      drivers/media/platform/nxp/built-in.a
  CC      kernel/trace/error_report-traces.o
  AR      fs/tracefs/built-in.a
  AR      drivers/media/platform/qcom/camss/built-in.a
  CC      drivers/usb/storage/transport.o
  CC      net/mac80211/rate.o
  CC      drivers/input/mouse/logips2pp.o
  AR      drivers/media/platform/qcom/venus/built-in.a
  AR      drivers/media/platform/qcom/built-in.a
  AR      drivers/media/platform/raspberrypi/pisp_be/built-in.a
  CC      net/netfilter/xt_TCPMSS.o
  CC      drivers/acpi/acpica/psutils.o
  AR      drivers/media/platform/raspberrypi/rp1-cfe/built-in.a
  AR      drivers/media/platform/raspberrypi/built-in.a
  AR      fs/9p/built-in.a
  CC      drivers/gpu/drm/i915/intel_wakeref.o
  AR      drivers/media/platform/renesas/rcar-vin/built-in.a
  CC      drivers/i2c/i2c-core-smbus.o
  AS      arch/x86/kernel/irqflags.o
  AR      drivers/media/platform/renesas/rzg2l-cru/built-in.a
  AR      drivers/media/platform/renesas/vsp1/built-in.a
  CC      arch/x86/kernel/static_call.o
  AR      drivers/media/platform/renesas/built-in.a
  CC      drivers/usb/core/file.o
  CC      drivers/gpu/drm/i915/vlv_sideband.o
  CC      fs/lockd/xdr.o
  AR      drivers/media/platform/rockchip/rga/built-in.a
  CC      drivers/rtc/rtc-mc146818-lib.o
  AR      drivers/media/platform/rockchip/rkisp1/built-in.a
  CC [M]  fs/efivarfs/file.o
  AR      drivers/media/platform/rockchip/built-in.a
  CC      drivers/rtc/rtc-cmos.o
  CC      drivers/scsi/virtio_scsi.o
  CC      drivers/net/virtio_net.o
  AR      drivers/media/platform/samsung/exynos-gsc/built-in.a
  AR      drivers/media/platform/samsung/exynos4-is/built-in.a
  AR      drivers/media/platform/samsung/s3c-camif/built-in.a
  AR      drivers/media/platform/samsung/s5p-g2d/built-in.a
  AR      drivers/media/platform/samsung/s5p-jpeg/built-in.a
  CC      drivers/base/platform-msi.o
  AR      drivers/media/platform/samsung/s5p-mfc/built-in.a
  AR      drivers/media/platform/samsung/built-in.a
  CC      drivers/acpi/acpica/pswalk.o
  AR      drivers/media/platform/st/sti/bdisp/built-in.a
  AR      drivers/media/platform/st/sti/c8sectpfe/built-in.a
  AR      drivers/media/platform/st/sti/delta/built-in.a
  AR      drivers/media/platform/st/sti/hva/built-in.a
  CC      drivers/ata/pata_amd.o
  AR      drivers/media/platform/st/stm32/built-in.a
  AR      drivers/media/platform/st/built-in.a
  AR      drivers/media/platform/sunxi/sun4i-csi/built-in.a
  CC      drivers/ata/pata_oldpiix.o
  AR      drivers/media/platform/sunxi/sun6i-csi/built-in.a
  AR      drivers/media/platform/sunxi/sun6i-mipi-csi2/built-in.a
  AR      drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/built-in.a
  AR      drivers/media/platform/sunxi/sun8i-di/built-in.a
  AR      drivers/media/platform/sunxi/sun8i-rotate/built-in.a
  CC      drivers/usb/core/buffer.o
  AR      drivers/media/platform/sunxi/built-in.a
  AR      drivers/media/platform/ti/am437x/built-in.a
  CC      drivers/net/net_failover.o
  AR      drivers/media/platform/ti/cal/built-in.a
  CC      net/core/failover.o
  AR      drivers/media/platform/ti/vpe/built-in.a
  AR      drivers/usb/misc/built-in.a
  AR      drivers/media/platform/ti/davinci/built-in.a
  CC      net/ipv6/sysctl_net_ipv6.o
  AR      drivers/media/platform/ti/j721e-csi2rx/built-in.a
  AR      drivers/media/platform/ti/omap/built-in.a
  CC      arch/x86/kernel/process.o
  AR      drivers/media/platform/ti/omap3isp/built-in.a
  AR      drivers/media/platform/ti/built-in.a
  AR      drivers/media/platform/verisilicon/built-in.a
  AR      drivers/media/platform/via/built-in.a
  AR      drivers/media/platform/xilinx/built-in.a
  AR      drivers/media/platform/built-in.a
  CC      drivers/input/mouse/lifebook.o
  AR      drivers/media/pci/ttpci/built-in.a
  CC      drivers/acpi/acpica/psxface.o
  AR      drivers/pcmcia/built-in.a
  CC      drivers/base/physical_location.o
  AR      drivers/media/pci/b2c2/built-in.a
  AR      drivers/media/pci/pluto2/built-in.a
  CC      lib/xarray.o
  AR      drivers/media/pci/dm1105/built-in.a
  AR      drivers/media/pci/pt1/built-in.a
  AR      drivers/media/pci/pt3/built-in.a
  CC      net/sunrpc/xprtmultipath.o
  CC      drivers/acpi/power.o
  CC      drivers/input/mouse/trackpoint.o
  CC      mm/vma.o
  AR      drivers/media/pci/mantis/built-in.a
  AR      drivers/media/pci/ngene/built-in.a
  AR      drivers/media/pci/ddbridge/built-in.a
  AR      drivers/media/pci/saa7146/built-in.a
  CC      drivers/acpi/event.o
  GEN     net/wireless/shipped-certs.c
  AR      drivers/media/pci/smipcie/built-in.a
  CC      drivers/usb/early/ehci-dbgp.o
  CC      drivers/i2c/i2c-core-acpi.o
  AR      drivers/media/pci/netup_unidvb/built-in.a
  CC [M]  fs/efivarfs/super.o
  AR      drivers/media/pci/intel/ipu3/built-in.a
  CC      drivers/i2c/i2c-smbus.o
  AR      drivers/media/pci/intel/ivsc/built-in.a
  AR      drivers/media/pci/intel/built-in.a
  AR      drivers/media/pci/built-in.a
  AR      drivers/pps/clients/built-in.a
  AR      drivers/media/usb/b2c2/built-in.a
  CC      drivers/pps/pps.o
  CC      drivers/usb/storage/usb.o
  AR      drivers/media/usb/dvb-usb/built-in.a
  CC      drivers/ptp/ptp_clock.o
  AR      drivers/media/usb/dvb-usb-v2/built-in.a
  AR      drivers/media/usb/s2255/built-in.a
  AR      drivers/media/usb/siano/built-in.a
  AR      drivers/media/usb/ttusb-budget/built-in.a
  CC      arch/x86/kernel/ptrace.o
  AR      drivers/media/usb/ttusb-dec/built-in.a
  AR      drivers/media/usb/built-in.a
  CC      net/mac80211/michael.o
  AR      drivers/media/mmc/siano/built-in.a
  AR      drivers/media/mmc/built-in.a
  AR      drivers/media/firewire/built-in.a
  CC      drivers/acpi/acpica/rsaddr.o
  CC      drivers/usb/core/sysfs.o
  AR      drivers/media/spi/built-in.a
  CC      fs/read_write.o
  CC      net/netfilter/xt_conntrack.o
  AR      drivers/media/test-drivers/built-in.a
  AR      drivers/media/built-in.a
  AR      drivers/rtc/built-in.a
  CC      drivers/acpi/evged.o
  AR      drivers/input/touchscreen/built-in.a
  CC      drivers/acpi/acpica/rscalc.o
  CC      net/sunrpc/stats.o
  CC      fs/file_table.o
  CC      drivers/scsi/sd.o
  CC      drivers/base/trace.o
  CC      drivers/ata/pata_sch.o
  CC      fs/lockd/clnt4xdr.o
  CC      fs/nfs/export.o
  CC      drivers/usb/core/endpoint.o
  CC      drivers/usb/storage/initializers.o
  CC      drivers/input/mouse/cypress_ps2.o
  AR      drivers/gpu/drm/solomon/built-in.a
  CC      kernel/trace/power-traces.o
  CC      net/ipv4/udplite.o
  AR      net/core/built-in.a
  CC      drivers/scsi/sr.o
  CC      drivers/ata/pata_mpiix.o
  CC      net/ipv6/xfrm6_policy.o
  CC      kernel/umh.o
  CC      drivers/gpu/drm/i915/vlv_suspend.o
  CC      drivers/usb/host/ohci-hcd.o
  CC      drivers/pps/kapi.o
  CC      arch/x86/kernel/tls.o
  CC      drivers/acpi/acpica/rscreate.o
  CC      drivers/hwmon/hwmon.o
  CC      drivers/power/supply/power_supply_core.o
  CC      arch/x86/kernel/step.o
  CC      drivers/gpu/drm/i915/soc/intel_dram.o
  AR      drivers/usb/early/built-in.a
  AR      drivers/thermal/broadcom/built-in.a
  CC      drivers/acpi/acpica/rsdumpinfo.o
  AR      drivers/thermal/renesas/built-in.a
  AR      drivers/thermal/samsung/built-in.a
  CC      mm/process_vm_access.o
  CC [M]  fs/efivarfs/vars.o
  CC      drivers/thermal/intel/intel_tcc.o
  AR      drivers/i2c/built-in.a
  CC      drivers/pps/sysfs.o
  CC      fs/lockd/xdr4.o
  CC      fs/super.o
  CC      lib/lockref.o
  CC      net/ipv6/xfrm6_state.o
  AR      drivers/input/misc/built-in.a
  CC      drivers/ptp/ptp_chardev.o
  CC      drivers/thermal/intel/therm_throt.o
  CC      drivers/usb/storage/sierra_ms.o
  CC      drivers/acpi/acpica/rsinfo.o
  CC      drivers/acpi/sysfs.o
  AR      drivers/base/built-in.a
  CC      net/ipv4/udp_offload.o
  CC      drivers/acpi/property.o
  CC      drivers/input/input.o
  CC      lib/bcd.o
  CC      net/mac80211/tkip.o
  CC      net/ipv4/arp.o
  CC      drivers/usb/core/devio.o
  CC      drivers/input/mouse/psmouse-smbus.o
  AR      drivers/net/ethernet/dlink/built-in.a
  CC      drivers/scsi/sr_ioctl.o
  AR      drivers/net/ethernet/emulex/built-in.a
  CC      drivers/scsi/sr_vendor.o
  CC      drivers/usb/storage/option_ms.o
  AR      drivers/pps/built-in.a
  CC      lib/sort.o
  AR      drivers/thermal/st/built-in.a
  CC      kernel/workqueue.o
  CC      mm/page_alloc.o
  CC      drivers/ata/ata_generic.o
  CC      lib/parser.o
  CC      net/netfilter/xt_policy.o
  CC      drivers/acpi/acpica/rsio.o
  CC      fs/nfs/sysfs.o
  CC      kernel/trace/rpm-traces.o
  CC      drivers/ptp/ptp_sysfs.o
  CC      drivers/usb/storage/usual-tables.o
  CC      fs/char_dev.o
  CC      arch/x86/kernel/i8237.o
  CC      net/ipv6/xfrm6_input.o
  CC      fs/lockd/svc4proc.o
  LD [M]  fs/efivarfs/efivarfs.o
  CC      drivers/usb/core/notify.o
  CC      kernel/trace/trace_dynevent.o
  CC      drivers/power/supply/power_supply_sysfs.o
  CC      fs/nfs/fs_context.o
  CC      drivers/acpi/acpica/rsirq.o
  CC [M]  drivers/thermal/intel/x86_pkg_temp_thermal.o
  AR      drivers/watchdog/built-in.a
  CC      net/sunrpc/sysctl.o
  CC      lib/debug_locks.o
  AR      drivers/net/ethernet/engleder/built-in.a
  CC      drivers/usb/core/generic.o
  CC      net/wireless/shipped-certs.o
  CC      arch/x86/kernel/stacktrace.o
  CC      net/ipv6/xfrm6_output.o
  AR      drivers/thermal/qcom/built-in.a
  CC      kernel/pid.o
  AR      drivers/input/mouse/built-in.a
  CC      net/ipv4/icmp.o
  CC      fs/nfs/nfsroot.o
  CC      lib/random32.o
  CC      kernel/trace/trace_probe.o
  CC      drivers/gpu/drm/i915/soc/intel_gmch.o
  CC      drivers/acpi/debugfs.o
  AR      drivers/usb/storage/built-in.a
  AR      drivers/hwmon/built-in.a
  CC      mm/page_frag_cache.o
  AR      drivers/thermal/tegra/built-in.a
  CC      fs/stat.o
  CC      drivers/acpi/acpica/rslist.o
  CC      fs/lockd/procfs.o
  CC      drivers/power/supply/power_supply_leds.o
  CC      arch/x86/kernel/reboot.o
  CC      net/ipv4/devinet.o
  AR      drivers/ata/built-in.a
  CC      drivers/usb/host/ohci-pci.o
  CC      fs/nfs/sysctl.o
  CC      drivers/gpu/drm/i915/soc/intel_pch.o
  CC      drivers/scsi/sg.o
  CC      net/mac80211/aes_cmac.o
  CC      fs/exec.o
  AR      drivers/thermal/mediatek/built-in.a
  CC      mm/init-mm.o
  CC      lib/bust_spinlocks.o
  CC      drivers/ptp/ptp_vclock.o
  CC      drivers/input/input-compat.o
  CC      net/ipv4/af_inet.o
  CC      drivers/acpi/acpica/rsmemory.o
  CC      fs/nfs/nfs3super.o
  AR      drivers/thermal/intel/built-in.a
  CC      drivers/thermal/thermal_core.o
  CC      net/netfilter/xt_state.o
  CC      drivers/md/md.o
  AR      drivers/net/ethernet/ezchip/built-in.a
  CC [M]  drivers/gpu/drm/scheduler/sched_main.o
  CC      drivers/ptp/ptp_kvm_x86.o
  CC      lib/kasprintf.o
  CC      drivers/power/supply/power_supply_hwmon.o
  CC      drivers/gpu/drm/i915/soc/intel_rom.o
  CC      drivers/usb/core/quirks.o
  CC      kernel/task_work.o
  CC      net/ipv6/xfrm6_protocol.o
  AR      net/sunrpc/built-in.a
  CC      drivers/cpufreq/cpufreq.o
  CC      drivers/acpi/acpica/rsmisc.o
  CC      drivers/cpuidle/governors/menu.o
  CC      net/mac80211/aes_gmac.o
  AR      fs/lockd/built-in.a
  CC      drivers/usb/host/uhci-hcd.o
  CC      drivers/acpi/acpica/rsserial.o
  AR      drivers/net/ethernet/broadcom/built-in.a
  CC [M]  drivers/gpu/drm/scheduler/sched_fence.o
  AR      drivers/net/ethernet/fujitsu/built-in.a
  AR      drivers/net/ethernet/fungible/built-in.a
  AR      drivers/mmc/built-in.a
  CC      fs/pipe.o
  AR      drivers/net/ethernet/google/built-in.a
  CC      drivers/cpuidle/cpuidle.o
  AR      drivers/net/ethernet/hisilicon/built-in.a
  AR      drivers/net/ethernet/huawei/built-in.a
  CC      lib/bitmap.o
  HOSTCC  drivers/gpu/drm/xe/xe_gen_wa_oob
  CC      drivers/input/input-mt.o
  CC      arch/x86/kernel/msr.o
  CC      drivers/net/ethernet/intel/e1000/e1000_main.o
  CC      drivers/net/ethernet/intel/e1000e/82571.o
  CC      drivers/net/ethernet/intel/e100.o
  CC      drivers/ptp/ptp_kvm_common.o
  AR      drivers/power/supply/built-in.a
  CC      arch/x86/kernel/cpuid.o
  AR      drivers/power/built-in.a
  GEN     xe_wa_oob.c xe_wa_oob.h
  CC      net/ipv6/netfilter.o
  CC [M]  drivers/gpu/drm/xe/xe_bb.o
  CC      net/ipv4/igmp.o
  CC      fs/namei.o
  CC      mm/memblock.o
  CC      lib/scatterlist.o
  AR      drivers/ufs/built-in.a
  CC      drivers/thermal/thermal_sysfs.o
  CC      drivers/net/ethernet/intel/e1000e/ich8lan.o
  CC      kernel/trace/trace_uprobe.o
  CC      drivers/cpuidle/governors/haltpoll.o
  CC      net/ipv4/fib_frontend.o
  CC      drivers/acpi/acpica/rsutils.o
  CC      drivers/gpu/drm/i915/i915_memcpy.o
  CC      drivers/usb/core/devices.o
  CC      drivers/usb/core/phy.o
  CC      drivers/net/ethernet/intel/e1000e/80003es2lan.o
  CC      drivers/net/ethernet/intel/e1000e/mac.o
  CC      drivers/gpu/drm/i915/i915_mm.o
  CC      drivers/cpufreq/freq_table.o
  CC [M]  net/netfilter/nf_log_syslog.o
  CC      fs/fcntl.o
  CC [M]  drivers/gpu/drm/scheduler/sched_entity.o
  CC      lib/list_sort.o
  CC      drivers/usb/core/port.o
  CC      net/ipv6/proc.o
  CC      arch/x86/kernel/early-quirks.o
  CC      drivers/scsi/scsi_sysfs.o
  CC      net/ipv4/fib_semantics.o
  CC      drivers/acpi/acpica/rsxface.o
  CC      drivers/input/input-poller.o
  CC      fs/nfs/nfs3client.o
  AR      drivers/ptp/built-in.a
  AR      drivers/firmware/arm_ffa/built-in.a
  AR      drivers/firmware/arm_scmi/built-in.a
  AR      drivers/firmware/broadcom/built-in.a
  CC      net/mac80211/fils_aead.o
  AR      drivers/crypto/stm32/built-in.a
  AR      drivers/crypto/xilinx/built-in.a
  AR      drivers/firmware/cirrus/test/built-in.a
  AR      drivers/firmware/cirrus/built-in.a
  AR      drivers/crypto/hisilicon/built-in.a
  CC      drivers/net/ethernet/intel/e1000e/manage.o
  AR      drivers/firmware/meson/built-in.a
  AR      drivers/crypto/intel/keembay/built-in.a
  CC      drivers/acpi/acpica/tbdata.o
  AR      drivers/firmware/microchip/built-in.a
  AR      drivers/crypto/intel/ixp4xx/built-in.a
  AR      drivers/crypto/intel/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_bo.o
  AR      drivers/crypto/starfive/built-in.a
  CC      drivers/acpi/acpica/tbfadt.o
  AR      drivers/crypto/built-in.a
  CC      drivers/firmware/efi/efi-bgrt.o
  CC      drivers/gpu/drm/i915/i915_sw_fence.o
  CC      drivers/usb/core/hcd-pci.o
  CC      drivers/firmware/efi/libstub/efi-stub-helper.o
  CC      drivers/thermal/thermal_trip.o
  CC [M]  net/netfilter/xt_mark.o
  CC      drivers/acpi/acpi_lpat.o
  CC [M]  drivers/gpu/drm/xe/xe_bo_evict.o
  CC      net/ipv4/fib_trie.o
  CC      kernel/extable.o
  AR      drivers/cpuidle/governors/built-in.a
  CC      drivers/cpuidle/driver.o
  CC      drivers/cpuidle/governor.o
  LD [M]  drivers/gpu/drm/scheduler/gpu-sched.o
  AR      drivers/net/ethernet/i825xx/built-in.a
  CC      drivers/input/ff-core.o
  CC      net/mac80211/cfg.o
  CC      kernel/trace/rethook.o
  CC      fs/ioctl.o
  AR      drivers/firmware/imx/built-in.a
  AR      drivers/firmware/psci/built-in.a
  CC      lib/uuid.o
  AR      drivers/firmware/qcom/built-in.a
  CC      fs/nfs/nfs3proc.o
  CC      drivers/acpi/acpica/tbfind.o
  CC      drivers/thermal/thermal_helpers.o
  CC      drivers/acpi/acpica/tbinstal.o
  CC [M]  drivers/gpu/drm/xe/xe_devcoredump.o
  CC      drivers/acpi/acpi_pcc.o
  CC      drivers/usb/host/xhci.o
  CC      lib/iov_iter.o
  CC      drivers/gpu/drm/i915/i915_sw_fence_work.o
  AR      drivers/firmware/smccc/built-in.a
  CC      mm/slub.o
  CC      drivers/input/touchscreen.o
  AR      drivers/firmware/tegra/built-in.a
  CC      mm/madvise.o
  CC      drivers/usb/host/xhci-mem.o
  CC      arch/x86/kernel/smp.o
  CC      net/mac80211/ethtool.o
  CC      net/ipv6/syncookies.o
  CC      drivers/cpufreq/cpufreq_performance.o
  CC      fs/readdir.o
  CC      drivers/cpuidle/sysfs.o
  CC      net/ipv4/fib_notifier.o
  CC      drivers/usb/core/usb-acpi.o
  CC      net/mac80211/rx.o
  CC      drivers/thermal/thermal_thresholds.o
  CC      drivers/firmware/efi/libstub/gop.o
  CC      lib/clz_ctz.o
  CC      drivers/acpi/acpica/tbprint.o
  CC      drivers/gpu/drm/i915/i915_syncmap.o
  AR      drivers/net/ethernet/microsoft/built-in.a
  CC      fs/select.o
  AR      drivers/firmware/xilinx/built-in.a
  AR      drivers/scsi/built-in.a
  CC      kernel/params.o
  CC      drivers/firmware/efi/libstub/secureboot.o
  CC      drivers/firmware/efi/efi.o
  CC      drivers/net/ethernet/intel/e1000e/nvm.o
  CC      drivers/net/ethernet/intel/e1000/e1000_hw.o
  CC      drivers/acpi/acpica/tbutils.o
  CC      fs/nfs/nfs3xdr.o
  CC      drivers/gpu/drm/i915/i915_user_extensions.o
  CC      drivers/cpufreq/cpufreq_userspace.o
  CC      drivers/net/ethernet/intel/e1000/e1000_ethtool.o
  CC      drivers/gpu/drm/drm_atomic.o
  CC      drivers/firmware/dmi_scan.o
  AR      kernel/trace/built-in.a
  CC      drivers/acpi/ac.o
  AR      drivers/net/ethernet/litex/built-in.a
  CC      drivers/thermal/thermal_netlink.o
  CC      drivers/input/ff-memless.o
  CC [M]  net/netfilter/xt_nat.o
  CC      drivers/input/sparse-keymap.o
  CC      drivers/cpuidle/poll_state.o
  CC      drivers/input/vivaldi-fmap.o
  CC      drivers/input/input-leds.o
  CC      drivers/thermal/thermal_hwmon.o
  CC      drivers/gpu/drm/i915/i915_debugfs.o
  CC      drivers/acpi/acpica/tbxface.o
  CC      drivers/md/md-bitmap.o
  CC      drivers/cpufreq/cpufreq_ondemand.o
  CC      drivers/firmware/efi/libstub/tpm.o
  CC      drivers/cpuidle/cpuidle-haltpoll.o
  CC      arch/x86/kernel/smpboot.o
  CC      drivers/firmware/efi/libstub/file.o
  AR      drivers/usb/core/built-in.a
  CC      lib/bsearch.o
  CC      kernel/kthread.o
  CC      drivers/usb/host/xhci-ext-caps.o
  CC      drivers/gpu/drm/drm_atomic_uapi.o
  CC      drivers/gpu/drm/drm_auth.o
  CC      drivers/firmware/dmi-id.o
  CC      arch/x86/kernel/tsc_sync.o
  CC      drivers/gpu/drm/i915/i915_debugfs_params.o
  CC      drivers/clocksource/acpi_pm.o
  CC      drivers/acpi/acpica/tbxfload.o
  AR      drivers/net/ethernet/marvell/octeon_ep/built-in.a
  AR      drivers/net/ethernet/marvell/octeon_ep_vf/built-in.a
  AR      drivers/net/ethernet/marvell/octeontx2/built-in.a
  AR      drivers/net/ethernet/marvell/prestera/built-in.a
  AR      drivers/net/ethernet/mellanox/built-in.a
  CC      drivers/cpufreq/cpufreq_governor.o
  CC      drivers/net/ethernet/marvell/sky2.o
  CC      drivers/firmware/efi/libstub/mem.o
  AR      drivers/cpuidle/built-in.a
  CC      mm/page_io.o
  CC      drivers/input/evdev.o
  CC      net/ipv6/calipso.o
  CC      fs/dcache.o
  CC      drivers/acpi/button.o
  CC      drivers/md/md-autodetect.o
  CC      drivers/firmware/efi/libstub/random.o
  CC      fs/nfs/nfs3acl.o
  CC [M]  drivers/gpu/drm/xe/xe_device.o
  CC [M]  net/netfilter/xt_LOG.o
  CC      drivers/net/ethernet/intel/e1000e/phy.o
  CC      drivers/hid/usbhid/hid-core.o
  CC      drivers/cpufreq/cpufreq_governor_attr_set.o
  CC      net/ipv4/inet_fragment.o
  CC      drivers/hid/hid-core.o
  CC      drivers/acpi/acpica/tbxfroot.o
  CC      drivers/hid/hid-input.o
  CC      drivers/clocksource/i8253.o
  CC      drivers/net/ethernet/intel/e1000e/param.o
  CC      drivers/thermal/gov_step_wise.o
  CC      drivers/net/ethernet/intel/e1000e/ethtool.o
  CC      net/ipv4/ping.o
  CC      drivers/firmware/efi/vars.o
  CC      drivers/acpi/fan_core.o
  CC      drivers/acpi/fan_attr.o
  CC [M]  net/netfilter/xt_MASQUERADE.o
  CC      mm/swap_state.o
  CC      drivers/md/dm.o
  AR      drivers/platform/x86/amd/built-in.a
  AR      drivers/platform/x86/intel/built-in.a
  CC      drivers/platform/x86/wmi.o
  CC      drivers/net/ethernet/intel/e1000/e1000_param.o
  CC      arch/x86/kernel/setup_percpu.o
  CC      drivers/acpi/acpica/utaddress.o
  AR      drivers/clocksource/built-in.a
  AR      drivers/net/ethernet/meta/built-in.a
  AR      drivers/net/ethernet/micrel/built-in.a
  CC      net/ipv6/ah6.o
  CC      lib/find_bit.o
  CC      drivers/cpufreq/acpi-cpufreq.o
  CC      net/ipv6/esp6.o
  CC      drivers/firmware/efi/libstub/randomalloc.o
  CC      drivers/gpu/drm/i915/i915_pmu.o
  CC      mm/swapfile.o
  CC      fs/nfs/nfs4proc.o
  AR      drivers/thermal/built-in.a
  CC      fs/inode.o
  CC      net/ipv4/ip_tunnel_core.o
  CC      drivers/hid/usbhid/hiddev.o
  CC      drivers/cpufreq/amd-pstate.o
  CC      kernel/sys_ni.o
  CC      drivers/gpu/drm/i915/gt/gen2_engine_cs.o
  CC [M]  drivers/gpu/drm/xe/xe_device_sysfs.o
  CC      arch/x86/kernel/mpparse.o
  AR      drivers/input/built-in.a
  CC      lib/llist.o
  CC      net/ipv6/sit.o
  CC      drivers/md/dm-table.o
  CC      drivers/acpi/acpica/utalloc.o
  AR      net/wireless/built-in.a
  CC      drivers/gpu/drm/i915/gt/gen6_engine_cs.o
  CC      fs/attr.o
  CC      lib/lwq.o
  CC      kernel/nsproxy.o
  CC      drivers/gpu/drm/drm_blend.o
  CC      lib/memweight.o
  CC      kernel/notifier.o
  CC      fs/bad_inode.o
  CC      net/ipv6/addrconf_core.o
  CC      drivers/platform/x86/wmi-bmof.o
  CC      mm/swap_slots.o
  CC      drivers/firmware/efi/libstub/pci.o
  CC      lib/kfifo.o
  CC      fs/nfs/nfs4xdr.o
  CC      drivers/acpi/acpica/utascii.o
  CC      drivers/gpu/drm/i915/gt/gen6_ppgtt.o
  CC      drivers/platform/x86/eeepc-laptop.o
  CC      drivers/acpi/fan_hwmon.o
  CC [M]  net/netfilter/xt_addrtype.o
  CC      drivers/usb/host/xhci-ring.o
  CC      drivers/firmware/memmap.o
  AR      drivers/platform/surface/built-in.a
  CC      drivers/hid/hid-quirks.o
  CC      drivers/firmware/efi/reboot.o
  CC [M]  drivers/gpu/drm/xe/xe_dma_buf.o
  CC      arch/x86/kernel/trace_clock.o
  AR      drivers/net/ethernet/intel/e1000/built-in.a
  CC      drivers/platform/x86/p2sb.o
  CC      drivers/acpi/acpica/utbuffer.o
  CC      drivers/gpu/drm/i915/gt/gen7_renderclear.o
  CC      drivers/gpu/drm/i915/gt/gen8_engine_cs.o
  CC      drivers/hid/usbhid/hid-pidff.o
  CC      drivers/acpi/acpi_video.o
  CC      drivers/mailbox/mailbox.o
  AR      drivers/perf/built-in.a
  CC      drivers/cpufreq/amd-pstate-trace.o
  CC      drivers/md/dm-target.o
  CC      drivers/firmware/efi/libstub/skip_spaces.o
  CC      drivers/mailbox/pcc.o
  CC [M]  drivers/gpu/drm/xe/xe_drm_client.o
  CC      arch/x86/kernel/trace.o
  CC      net/ipv6/exthdrs_core.o
  CC      drivers/firmware/efi/memattr.o
  CC      kernel/ksysfs.o
  CC      drivers/md/dm-linear.o
  CC      arch/x86/kernel/rethook.o
  CC      net/mac80211/spectmgmt.o
  CC      drivers/firmware/efi/tpm.o
  CC      drivers/firmware/efi/libstub/lib-cmdline.o
  CC      drivers/firmware/efi/memmap.o
  CC      fs/nfs/nfs4state.o
  CC      drivers/acpi/acpica/utcksum.o
  CC      drivers/firmware/efi/libstub/lib-ctype.o
  CC      drivers/net/ethernet/intel/e1000e/netdev.o
  CC      drivers/usb/host/xhci-hub.o
  CC      drivers/firmware/efi/libstub/alignedmem.o
  CC      lib/percpu-refcount.o
  CC      drivers/firmware/efi/libstub/relocate.o
  CC      net/ipv4/gre_offload.o
  CC      fs/file.o
  CC      drivers/gpu/drm/drm_bridge.o
  CC      drivers/firmware/efi/capsule.o
  CC      drivers/acpi/video_detect.o
  CC      mm/dmapool.o
  AR      drivers/net/ethernet/microchip/built-in.a
  CC      lib/rhashtable.o
  CC      drivers/gpu/drm/i915/gt/gen8_ppgtt.o
  CC      drivers/gpu/drm/drm_cache.o
  CC      drivers/usb/host/xhci-dbg.o
  CC      drivers/cpufreq/intel_pstate.o
  CC      drivers/firmware/efi/esrt.o
  CC      drivers/acpi/processor_driver.o
  CC      drivers/acpi/acpica/utcopy.o
  AR      drivers/mailbox/built-in.a
  CC      drivers/md/dm-stripe.o
  CC      arch/x86/kernel/vmcore_info_32.o
  CC      kernel/cred.o
  AR      drivers/net/ethernet/mscc/built-in.a
  CC      kernel/reboot.o
  AR      drivers/platform/x86/built-in.a
  AR      drivers/net/ethernet/myricom/built-in.a
  AR      drivers/platform/built-in.a
  CC      drivers/acpi/processor_thermal.o
  CC      drivers/firmware/efi/libstub/printk.o
  CC      drivers/usb/host/xhci-trace.o
  CC      lib/base64.o
  CC      fs/nfs/nfs4renewd.o
  CC      mm/hugetlb.o
  CC      drivers/gpu/drm/drm_color_mgmt.o
  AR      drivers/net/ethernet/marvell/built-in.a
  CC      net/ipv6/ip6_checksum.o
  CC      drivers/net/ethernet/intel/e1000e/ptp.o
  AR      net/netfilter/built-in.a
  CC      net/ipv4/metrics.o
  CC      lib/once.o
  CC [M]  drivers/gpu/drm/xe/xe_eu_stall.o
  CC      fs/filesystems.o
  AR      drivers/hwtracing/intel_th/built-in.a
  CC      net/ipv4/netlink.o
  CC      net/ipv6/ip6_icmp.o
  CC      net/mac80211/tx.o
  CC      drivers/firmware/efi/runtime-wrappers.o
  CC      drivers/acpi/acpica/utexcep.o
  CC      arch/x86/kernel/machine_kexec_32.o
  CC      net/ipv4/nexthop.o
  CC      drivers/md/dm-ioctl.o
  CC      drivers/usb/host/xhci-debugfs.o
  CC      fs/namespace.o
  CC      fs/seq_file.o
  CC      drivers/gpu/drm/drm_connector.o
  CC      net/ipv6/output_core.o
  AR      drivers/hid/usbhid/built-in.a
  CC      drivers/hid/hid-debug.o
  CC      drivers/firmware/efi/capsule-loader.o
  CC      kernel/async.o
  CC      mm/mmu_notifier.o
  CC      drivers/firmware/efi/libstub/vsprintf.o
  CC      net/ipv4/udp_tunnel_stub.o
  AR      drivers/net/ethernet/natsemi/built-in.a
  CC      fs/xattr.o
  CC      drivers/md/dm-io.o
  CC      fs/nfs/nfs4super.o
  CC [M]  drivers/gpu/drm/xe/xe_exec.o
  CC      drivers/acpi/acpica/utdebug.o
  CC      drivers/hid/hidraw.o
  CC      kernel/range.o
  CC      mm/migrate.o
  CC      drivers/firmware/efi/libstub/x86-stub.o
  CC      drivers/md/dm-kcopyd.o
  CC      drivers/gpu/drm/drm_crtc.o
  CC      lib/refcount.o
  AR      drivers/net/ethernet/neterion/built-in.a
  CC      drivers/firmware/efi/earlycon.o
  CC      drivers/acpi/acpica/utdecode.o
  CC      drivers/usb/host/xhci-pci.o
  CC      drivers/acpi/acpica/utdelete.o
  CC      drivers/acpi/acpica/uterror.o
  CC      kernel/smpboot.o
  AR      drivers/net/ethernet/netronome/built-in.a
  CC      drivers/acpi/processor_idle.o
  AS      arch/x86/kernel/relocate_kernel_32.o
  CC      arch/x86/kernel/crash_dump_32.o
  CC      lib/rcuref.o
  AR      drivers/net/ethernet/ni/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_exec_queue.o
  CC      drivers/net/ethernet/nvidia/forcedeth.o
  AR      drivers/net/ethernet/oki-semi/built-in.a
  CC      drivers/hid/hid-generic.o
  AR      drivers/android/built-in.a
  CC      drivers/gpu/drm/drm_displayid.o
  CC      drivers/hid/hid-a4tech.o
  CC      fs/nfs/nfs4file.o
  CC      net/ipv4/ip_tunnel.o
  CC      kernel/ucount.o
  CC      lib/usercopy.o
  CC      drivers/gpu/drm/i915/gt/intel_breadcrumbs.o
  CC      drivers/gpu/drm/i915/gt/intel_context.o
  CC      drivers/md/dm-sysfs.o
  CC      fs/libfs.o
  CC      drivers/firmware/efi/libstub/smbios.o
  CC [M]  drivers/gpu/drm/xe/xe_execlist.o
  CC      drivers/acpi/acpica/uteval.o
  CC      drivers/gpu/drm/drm_drv.o
  CC      net/ipv6/protocol.o
  CC      drivers/acpi/acpica/utglobal.o
  CC      net/ipv4/sysctl_net_ipv4.o
  CC      fs/nfs/delegation.o
  CC      mm/page_counter.o
  CC      drivers/gpu/drm/i915/gt/intel_context_sseu.o
  STUBCPY drivers/firmware/efi/libstub/alignedmem.stub.o
  CC      arch/x86/kernel/crash.o
  CC [M]  drivers/gpu/drm/xe/xe_force_wake.o
  CC      drivers/gpu/drm/i915/gt/intel_engine_cs.o
  CC      lib/errseq.o
  CC [M]  drivers/gpu/drm/xe/xe_ggtt.o
  AR      drivers/firmware/efi/built-in.a
  AR      drivers/nvmem/layouts/built-in.a
  CC      drivers/hid/hid-apple.o
  CC      drivers/nvmem/core.o
  AR      drivers/net/ethernet/packetengines/built-in.a
  CC      net/ipv4/proc.o
  CC      net/mac80211/key.o
  CC      lib/bucket_locks.o
  CC      kernel/regset.o
  CC      net/ipv6/ip6_offload.o
  CC      drivers/acpi/processor_throttling.o
  CC      drivers/acpi/acpica/uthex.o
  CC [M]  drivers/gpu/drm/xe/xe_gpu_scheduler.o
  CC      fs/fs-writeback.o
  AR      drivers/cpufreq/built-in.a
  CC      drivers/acpi/acpica/utids.o
  CC      net/ipv4/fib_rules.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc.o
  CC      drivers/acpi/processor_perflib.o
  CC      drivers/md/dm-stats.o
  CC      drivers/gpu/drm/i915/gt/intel_engine_heartbeat.o
  CC      fs/nfs/nfs4idmap.o
  STUBCPY drivers/firmware/efi/libstub/efi-stub-helper.stub.o
  STUBCPY drivers/firmware/efi/libstub/file.stub.o
  STUBCPY drivers/firmware/efi/libstub/gop.stub.o
  STUBCPY drivers/firmware/efi/libstub/lib-cmdline.stub.o
  CC      drivers/hid/hid-belkin.o
  STUBCPY drivers/firmware/efi/libstub/lib-ctype.stub.o
  STUBCPY drivers/firmware/efi/libstub/mem.stub.o
  STUBCPY drivers/firmware/efi/libstub/pci.stub.o
  STUBCPY drivers/firmware/efi/libstub/printk.stub.o
  STUBCPY drivers/firmware/efi/libstub/random.stub.o
  CC      kernel/ksyms_common.o
  STUBCPY drivers/firmware/efi/libstub/randomalloc.stub.o
  CC      net/ipv6/tcpv6_offload.o
  STUBCPY drivers/firmware/efi/libstub/relocate.stub.o
  CC      lib/generic-radix-tree.o
  CC      drivers/acpi/container.o
  STUBCPY drivers/firmware/efi/libstub/secureboot.stub.o
  CC      lib/bitmap-str.o
  STUBCPY drivers/firmware/efi/libstub/skip_spaces.stub.o
  STUBCPY drivers/firmware/efi/libstub/smbios.stub.o
  STUBCPY drivers/firmware/efi/libstub/tpm.stub.o
  STUBCPY drivers/firmware/efi/libstub/vsprintf.stub.o
  STUBCPY drivers/firmware/efi/libstub/x86-stub.stub.o
  AR      drivers/firmware/efi/libstub/lib.a
  CC      drivers/acpi/acpica/utinit.o
  CC      drivers/md/dm-rq.o
  CC      fs/nfs/callback.o
  AR      drivers/firmware/built-in.a
  CC      arch/x86/kernel/module.o
  CC      drivers/gpu/drm/drm_dumb_buffers.o
  AR      drivers/usb/host/built-in.a
  AR      drivers/usb/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_engine_pm.o
  CC      net/ipv4/ipmr.o
  CC      fs/pnode.o
  CC      drivers/acpi/thermal_lib.o
  CC      net/mac80211/util.o
  CC      net/mac80211/parse.o
  CC      drivers/acpi/acpica/utlock.o
  CC      net/mac80211/wme.o
  AR      drivers/net/ethernet/qlogic/built-in.a
  CC      mm/hugetlb_cgroup.o
  CC      mm/early_ioremap.o
  CC      drivers/hid/hid-cherry.o
  CC      net/mac80211/chan.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc_debugfs.o
  CC      lib/string_helpers.o
  CC      drivers/acpi/acpica/utmath.o
  CC      mm/secretmem.o
  CC      mm/hmm.o
  CC      net/mac80211/trace.o
  CC      fs/nfs/callback_xdr.o
  AR      drivers/nvmem/built-in.a
  CC      fs/splice.o
  CC      drivers/gpu/drm/drm_edid.o
  CC      kernel/groups.o
  CC      kernel/kcmp.o
  CC      drivers/gpu/drm/i915/gt/intel_engine_user.o
  AR      drivers/net/ethernet/qualcomm/emac/built-in.a
  AR      drivers/net/ethernet/qualcomm/built-in.a
  CC      drivers/md/dm-io-rewind.o
  CC      drivers/net/ethernet/realtek/8139too.o
  CC      arch/x86/kernel/doublefault_32.o
  CC      drivers/net/ethernet/realtek/r8169_main.o
  CC      drivers/acpi/thermal.o
  CC      drivers/md/dm-builtin.o
  CC      fs/nfs/callback_proc.o
  CC      drivers/acpi/acpica/utmisc.o
  CC      net/ipv4/ipmr_base.o
  CC      drivers/hid/hid-chicony.o
  CC      net/ipv4/syncookies.o
  CC      fs/sync.o
  CC      net/mac80211/mlme.o
  CC      lib/hexdump.o
  CC      kernel/freezer.o
  CC      arch/x86/kernel/early_printk.o
  CC      drivers/acpi/nhlt.o
  CC      drivers/net/ethernet/realtek/r8169_firmware.o
  CC      drivers/gpu/drm/i915/gt/intel_execlists_submission.o
  CC      fs/nfs/nfs4namespace.o
  CC      net/ipv6/exthdrs_offload.o
  CC      drivers/acpi/acpica/utmutex.o
  CC      fs/utimes.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc_proxy.o
  AR      drivers/net/ethernet/renesas/built-in.a
  CC      fs/d_path.o
  CC      drivers/net/ethernet/realtek/r8169_phy_config.o
  CC      drivers/acpi/acpica/utnonansi.o
  CC      lib/kstrtox.o
  CC      drivers/md/dm-raid1.o
  CC      mm/memfd.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc_submit.o
  CC      drivers/hid/hid-cypress.o
  CC      arch/x86/kernel/hpet.o
  AR      drivers/net/ethernet/rdc/built-in.a
  CC      net/ipv4/tunnel4.o
  CC      arch/x86/kernel/amd_nb.o
  CC      drivers/hid/hid-ezkey.o
  CC      mm/ptdump.o
  CC      drivers/acpi/acpica/utobject.o
  CC      drivers/gpu/drm/i915/gt/intel_ggtt.o
  CC      fs/nfs/nfs4getroot.o
  CC      net/ipv4/ipconfig.o
  CC      net/ipv6/inet6_hashtables.o
  CC      drivers/gpu/drm/drm_eld.o
  CC      drivers/acpi/acpica/utosi.o
  CC      net/ipv6/mcast_snoop.o
  CC      drivers/md/dm-log.o
  CC      kernel/profile.o
  CC      lib/iomap.o
  CC      mm/execmem.o
  CC      kernel/stacktrace.o
  AR      drivers/net/ethernet/intel/e1000e/built-in.a
  AR      drivers/net/ethernet/intel/built-in.a
  CC      net/ipv4/netfilter.o
  CC      drivers/acpi/acpi_memhotplug.o
  CC      arch/x86/kernel/amd_node.o
  AR      drivers/net/ethernet/nvidia/built-in.a
  CC      drivers/acpi/acpica/utownerid.o
  CC      drivers/gpu/drm/i915/gt/intel_ggtt_fencing.o
  CC      drivers/gpu/drm/drm_encoder.o
  CC      drivers/acpi/acpica/utpredef.o
  CC      fs/stack.o
  CC      drivers/gpu/drm/drm_file.o
  CC      net/ipv4/tcp_cubic.o
  CC      drivers/md/dm-region-hash.o
  CC      drivers/gpu/drm/i915/gt/intel_gt.o
  CC      kernel/dma.o
  CC      arch/x86/kernel/kvm.o
  CC      drivers/acpi/ioapic.o
  AR      drivers/net/ethernet/rocker/built-in.a
  CC      kernel/smp.o
  CC      drivers/hid/hid-gyration.o
  CC      drivers/md/dm-zero.o
  CC      lib/iomap_copy.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.o
  CC      drivers/gpu/drm/drm_fourcc.o
  CC      kernel/uid16.o
  CC      net/mac80211/tdls.o
  CC [M]  drivers/gpu/drm/xe/xe_gt.o
  CC      fs/nfs/nfs4client.o
  CC      fs/nfs/nfs4session.o
  CC      drivers/gpu/drm/drm_framebuffer.o
  CC      lib/devres.o
  CC      drivers/acpi/acpica/utresdecode.o
  AR      drivers/net/ethernet/samsung/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.o
  CC      kernel/kallsyms.o
  CC      net/mac80211/ocb.o
  CC      lib/check_signature.o
  AR      mm/built-in.a
  CC      fs/nfs/dns_resolve.o
  CC      fs/fs_struct.o
  AR      drivers/net/ethernet/seeq/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_ccs_mode.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_clock_utils.o
  CC      drivers/acpi/battery.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_debugfs.o
  CC      drivers/hid/hid-ite.o
  CC      net/ipv4/tcp_sigpool.o
  CC      drivers/acpi/acpica/utresrc.o
  CC      fs/statfs.o
  CC      arch/x86/kernel/kvmclock.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.o
  CC      fs/nfs/nfs4trace.o
  CC      drivers/hid/hid-kensington.o
  CC      net/mac80211/airtime.o
  CC      lib/interval_tree.o
  CC      fs/nfs/nfs4sysctl.o
  CC      drivers/acpi/bgrt.o
  CC      fs/fs_pin.o
  CC      arch/x86/kernel/paravirt.o
  CC      kernel/acct.o
  AR      drivers/md/built-in.a
  AR      drivers/net/ethernet/silan/built-in.a
  CC      drivers/acpi/acpica/utstate.o
  CC      drivers/hid/hid-lg.o
  AR      net/ipv6/built-in.a
  CC      fs/nsfs.o
  CC      drivers/hid/hid-lgff.o
  CC      lib/assoc_array.o
  CC      net/ipv4/cipso_ipv4.o
  CC      drivers/gpu/drm/drm_gem.o
  CC      fs/fs_types.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_clock.o
  CC      lib/bitrev.o
  CC      drivers/acpi/acpica/utstring.o
  CC      fs/fs_context.o
  CC      arch/x86/kernel/pvclock.o
  CC      drivers/acpi/spcr.o
  AR      drivers/net/ethernet/sis/built-in.a
  AR      drivers/net/ethernet/sfc/built-in.a
  CC      kernel/vmcore_info.o
  CC      drivers/acpi/acpica/utstrsuppt.o
  CC      net/mac80211/eht.o
  CC      lib/crc-ccitt.o
  AR      drivers/net/ethernet/smsc/built-in.a
  CC      fs/fs_parser.o
  CC      fs/fsopen.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_freq.o
  CC      net/ipv4/xfrm4_policy.o
  CC      net/ipv4/xfrm4_state.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_irq.o
  CC      drivers/gpu/drm/drm_ioctl.o
  CC      kernel/elfcorehdr.o
  CC      fs/init.o
  CC      lib/crc16.o
  CC      net/ipv4/xfrm4_input.o
  CC      kernel/crash_reserve.o
  CC      drivers/hid/hid-lg4ff.o
  CC      net/ipv4/xfrm4_output.o
  CC      drivers/acpi/acpica/utstrtoul64.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_idle.o
  CC      net/mac80211/led.o
  CC      net/ipv4/xfrm4_protocol.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_mcr.o
  CC      drivers/hid/hid-lg-g15.o
  CC      fs/kernel_read_file.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_mcr.o
  HOSTCC  lib/gen_crc32table
  CC [M]  drivers/gpu/drm/xe/xe_gt_pagefault.o
  CC      arch/x86/kernel/pcspeaker.o
  AR      drivers/net/ethernet/realtek/built-in.a
  CC      lib/xxhash.o
  AR      drivers/net/ethernet/socionext/built-in.a
  AR      drivers/net/ethernet/stmicro/built-in.a
  AR      drivers/net/ethernet/sun/built-in.a
  AR      drivers/net/ethernet/tehuti/built-in.a
  CC      drivers/gpu/drm/drm_lease.o
  AR      drivers/net/ethernet/ti/built-in.a
  CC      drivers/gpu/drm/drm_managed.o
  AR      drivers/net/ethernet/vertexcom/built-in.a
  AR      drivers/net/ethernet/via/built-in.a
  CC      kernel/kexec_core.o
  AR      drivers/net/ethernet/wangxun/built-in.a
  CC      fs/mnt_idmapping.o
  CC      net/mac80211/pm.o
  AR      drivers/net/ethernet/wiznet/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_gt_pm.o
  CC      drivers/acpi/acpica/utxface.o
  AR      drivers/net/ethernet/xilinx/built-in.a
  CC      drivers/gpu/drm/drm_mm.o
  AR      drivers/net/ethernet/xircom/built-in.a
  AR      drivers/net/ethernet/synopsys/built-in.a
  AR      drivers/net/ethernet/pensando/built-in.a
  CC      drivers/hid/hid-microsoft.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sysfs.o
  AR      drivers/net/ethernet/built-in.a
  CC      fs/remap_range.o
  CC      drivers/hid/hid-monterey.o
  CC      kernel/crash_core.o
  AR      drivers/net/built-in.a
  CC      drivers/gpu/drm/drm_mode_config.o
  CC      lib/genalloc.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_throttle.o
  CC      arch/x86/kernel/check.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.o
  CC      net/mac80211/rc80211_minstrel_ht.o
  CC      kernel/kexec.o
  CC      drivers/gpu/drm/drm_mode_object.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o
  CC      drivers/hid/hid-ntrig.o
  CC      fs/pidfs.o
  CC      drivers/acpi/acpica/utxfinit.o
  CC      lib/percpu_counter.o
  CC      drivers/gpu/drm/drm_modes.o
  CC      lib/audit.o
  CC      drivers/gpu/drm/drm_modeset_lock.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_pm_irq.o
  CC      kernel/utsname.o
  CC      drivers/gpu/drm/drm_plane.o
  CC      arch/x86/kernel/uprobes.o
  CC      drivers/acpi/acpica/utxferror.o
  CC      drivers/hid/hid-pl.o
  CC      lib/syscall.o
  CC      fs/buffer.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_requests.o
  CC      kernel/pid_namespace.o
  CC      net/mac80211/wbrf.o
  CC      arch/x86/kernel/perf_regs.o
  CC      drivers/acpi/acpica/utxfmutex.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_topology.o
  CC      lib/errname.o
  CC      drivers/hid/hid-petalynx.o
  CC      fs/mpage.o
  CC      kernel/stop_machine.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_sysfs.o
  CC      kernel/audit.o
  CC      kernel/auditfilter.o
  CC      drivers/gpu/drm/drm_prime.o
  CC      arch/x86/kernel/tracepoint.o
  CC      fs/proc_namespace.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.o
  CC      drivers/hid/hid-redragon.o
  AR      net/ipv4/built-in.a
  CC      lib/nlattr.o
  CC      drivers/hid/hid-samsung.o
  CC      drivers/gpu/drm/drm_print.o
  CC      arch/x86/kernel/itmt.o
  CC      drivers/hid/hid-sony.o
  CC      fs/direct-io.o
  CC      arch/x86/kernel/umip.o
  CC [M]  drivers/gpu/drm/xe/xe_guc.o
  CC      drivers/gpu/drm/i915/gt/intel_gtt.o
  CC      drivers/hid/hid-sunplus.o
  AR      drivers/acpi/acpica/built-in.a
  CC      drivers/gpu/drm/drm_property.o
  AR      drivers/acpi/built-in.a
  CC      arch/x86/kernel/unwind_frame.o
  CC      fs/eventpoll.o
  CC      lib/cpu_rmap.o
  CC      drivers/hid/hid-topseed.o
  CC      drivers/gpu/drm/i915/gt/intel_llc.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_ads.o
  CC      fs/anon_inodes.o
  CC      lib/dynamic_queue_limits.o
  CC      kernel/auditsc.o
  CC      drivers/gpu/drm/drm_rect.o
  CC      lib/glob.o
  CC      drivers/gpu/drm/i915/gt/intel_lrc.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_buf.o
  CC      drivers/gpu/drm/i915/gt/intel_migrate.o
  CC      kernel/audit_watch.o
  CC      fs/signalfd.o
  CC      lib/strncpy_from_user.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_capture.o
  CC      drivers/gpu/drm/drm_syncobj.o
  CC      kernel/audit_fsnotify.o
  CC      kernel/audit_tree.o
  CC      lib/strnlen_user.o
  CC      fs/timerfd.o
  CC      drivers/gpu/drm/i915/gt/intel_mocs.o
  CC      lib/net_utils.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_ct.o
  CC      kernel/kprobes.o
  CC      drivers/gpu/drm/drm_sysfs.o
  CC      drivers/gpu/drm/i915/gt/intel_ppgtt.o
  CC      kernel/seccomp.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_db_mgr.o
  CC      drivers/gpu/drm/i915/gt/intel_rc6.o
  CC      drivers/gpu/drm/drm_trace_points.o
  CC      kernel/relay.o
  AR      arch/x86/kernel/built-in.a
  AR      arch/x86/built-in.a
  CC      lib/sg_pool.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_engine_activity.o
  CC      drivers/gpu/drm/i915/gt/intel_region_lmem.o
  AR      fs/nfs/built-in.a
  CC      fs/eventfd.o
  CC      fs/aio.o
  CC      kernel/utsname_sysctl.o
  CC      lib/stackdepot.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_hwconfig.o
  CC      fs/locks.o
  CC      drivers/gpu/drm/i915/gt/intel_renderstate.o
  CC      kernel/delayacct.o
  CC      drivers/gpu/drm/i915/gt/intel_reset.o
  AR      drivers/hid/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_ring.o
  CC      lib/asn1_decoder.o
  CC      fs/binfmt_misc.o
  CC      drivers/gpu/drm/drm_vblank.o
  GEN     lib/oid_registry_data.c
  CC [M]  drivers/gpu/drm/xe/xe_guc_id_mgr.o
  CC      kernel/taskstats.o
  CC      fs/binfmt_script.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_klv_helpers.o
  CC      drivers/gpu/drm/drm_vblank_work.o
  CC      fs/binfmt_elf.o
  CC      lib/ucs2_string.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_log.o
  CC      drivers/gpu/drm/i915/gt/intel_ring_submission.o
  CC      drivers/gpu/drm/drm_vma_manager.o
  CC      kernel/tsacct.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_pc.o
  CC      lib/sbitmap.o
  CC      drivers/gpu/drm/i915/gt/intel_rps.o
  CC      kernel/tracepoint.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_submit.o
  CC      kernel/irq_work.o
  CC      fs/mbcache.o
  CC      kernel/static_call.o
  CC      drivers/gpu/drm/i915/gt/intel_sa_media.o
  CC      fs/posix_acl.o
  CC      drivers/gpu/drm/drm_writeback.o
  CC      lib/group_cpus.o
  CC      fs/coredump.o
  CC      lib/fw_table.o
  CC      kernel/padata.o
  CC      drivers/gpu/drm/i915/gt/intel_sseu.o
  CC      fs/drop_caches.o
  CC      drivers/gpu/drm/drm_panel.o
  CC [M]  drivers/gpu/drm/xe/xe_heci_gsc.o
  CC      kernel/jump_label.o
  CC [M]  drivers/gpu/drm/xe/xe_huc.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine.o
  CC      drivers/gpu/drm/drm_pci.o
  CC      fs/sysctls.o
  CC      kernel/context_tracking.o
  CC      drivers/gpu/drm/i915/gt/intel_sseu_debugfs.o
  CC      kernel/iomem.o
  AR      lib/lib.a
  CC      fs/fhandle.o
  CC      drivers/gpu/drm/i915/gt/intel_timeline.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.o
  CC      kernel/rseq.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine_group.o
  CC      drivers/gpu/drm/drm_debugfs.o
  GEN     lib/crc32table.h
  CC      drivers/gpu/drm/i915/gt/intel_tlb.o
  CC      drivers/gpu/drm/drm_debugfs_crc.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_fence.o
  CC      lib/oid_registry.o
  CC [M]  drivers/gpu/drm/xe/xe_irq.o
  CC      drivers/gpu/drm/drm_panel_orientation_quirks.o
  CC      drivers/gpu/drm/i915/gt/intel_wopcm.o
  CC [M]  drivers/gpu/drm/xe/xe_lrc.o
  CC      drivers/gpu/drm/i915/gt/intel_workarounds.o
  CC      drivers/gpu/drm/i915/gt/shmem_utils.o
  CC      drivers/gpu/drm/drm_buddy.o
  CC      lib/crc32.o
  CC      drivers/gpu/drm/i915/gt/sysfs_engines.o
  CC      drivers/gpu/drm/drm_gem_shmem_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_migrate.o
  CC [M]  drivers/gpu/drm/xe/xe_mmio.o
  CC      drivers/gpu/drm/i915/gt/intel_ggtt_gmch.o
  CC      drivers/gpu/drm/drm_atomic_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_mocs.o
  CC      drivers/gpu/drm/drm_atomic_state_helper.o
  CC      drivers/gpu/drm/i915/gt/gen6_renderstate.o
  CC [M]  drivers/gpu/drm/xe/xe_module.o
  CC [M]  drivers/gpu/drm/xe/xe_oa.o
  CC      drivers/gpu/drm/i915/gt/gen7_renderstate.o
  CC [M]  drivers/gpu/drm/xe/xe_observation.o
  CC      drivers/gpu/drm/drm_bridge_helper.o
  CC      drivers/gpu/drm/i915/gt/gen8_renderstate.o
  CC      drivers/gpu/drm/drm_crtc_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_pat.o
  AR      lib/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_pci.o
  CC      drivers/gpu/drm/drm_damage_helper.o
  CC      drivers/gpu/drm/i915/gt/gen9_renderstate.o
  CC [M]  drivers/gpu/drm/xe/xe_pcode.o
  CC      drivers/gpu/drm/drm_flip_work.o
  CC [M]  drivers/gpu/drm/xe/xe_pm.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_busy.o
  CC      drivers/gpu/drm/drm_format_helper.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_clflush.o
  CC [M]  drivers/gpu/drm/xe/xe_preempt_fence.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_context.o
  CC      drivers/gpu/drm/drm_gem_atomic_helper.o
  AR      kernel/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_pt.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_create.o
  CC      drivers/gpu/drm/drm_gem_framebuffer_helper.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_dmabuf.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_domain.o
  CC [M]  drivers/gpu/drm/xe/xe_pt_walk.o
  CC      drivers/gpu/drm/drm_kms_helper_common.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o
  CC [M]  drivers/gpu/drm/xe/xe_pxp.o
  CC      drivers/gpu/drm/drm_modeset_helper.o
  AR      fs/built-in.a
  CC      drivers/gpu/drm/i915/gem/i915_gem_internal.o
  CC [M]  drivers/gpu/drm/xe/xe_pxp_debugfs.o
  CC      drivers/gpu/drm/drm_plane_helper.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_lmem.o
  AR      net/mac80211/built-in.a
  CC      drivers/gpu/drm/drm_probe_helper.o
  AR      net/built-in.a
  CC      drivers/gpu/drm/drm_self_refresh_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_pxp_submit.o
  CC      drivers/gpu/drm/drm_simple_kms_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_query.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_mman.o
  CC      drivers/gpu/drm/bridge/panel.o
  CC [M]  drivers/gpu/drm/xe/xe_range_fence.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_object.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_sr.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_pages.o
  CC      drivers/gpu/drm/drm_mipi_dsi.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_whitelist.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_phys.o
  CC [M]  drivers/gpu/drm/drm_exec.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_pm.o
  CC [M]  drivers/gpu/drm/xe/xe_ring_ops.o
  CC [M]  drivers/gpu/drm/drm_gpuvm.o
  CC [M]  drivers/gpu/drm/xe/xe_rtp.o
  CC [M]  drivers/gpu/drm/drm_suballoc.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_region.o
  CC [M]  drivers/gpu/drm/xe/xe_sa.o
  CC [M]  drivers/gpu/drm/xe/xe_sched_job.o
  CC [M]  drivers/gpu/drm/xe/xe_shrinker.o
  CC [M]  drivers/gpu/drm/drm_gem_ttm_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_step.o
  CC [M]  drivers/gpu/drm/xe/xe_survivability_mode.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_shmem.o
  CC [M]  drivers/gpu/drm/xe/xe_sync.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_shrinker.o
  CC [M]  drivers/gpu/drm/xe/xe_tile.o
  CC [M]  drivers/gpu/drm/xe/xe_tile_sysfs.o
  CC [M]  drivers/gpu/drm/xe/xe_trace.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_stolen.o
  CC [M]  drivers/gpu/drm/xe/xe_trace_bo.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_throttle.o
  CC [M]  drivers/gpu/drm/xe/xe_trace_guc.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_tiling.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_ttm.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_ttm_move.o
  CC [M]  drivers/gpu/drm/xe/xe_trace_lrc.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_userptr.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_wait.o
  CC      drivers/gpu/drm/i915/gem/i915_gemfs.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_sys_mgr.o
  LD [M]  drivers/gpu/drm/drm_suballoc_helper.o
  CC      drivers/gpu/drm/i915/i915_active.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_vram_mgr.o
  CC [M]  drivers/gpu/drm/xe/xe_tuning.o
  CC      drivers/gpu/drm/i915/i915_cmd_parser.o
  CC [M]  drivers/gpu/drm/xe/xe_uc.o
  CC      drivers/gpu/drm/i915/i915_deps.o
  LD [M]  drivers/gpu/drm/drm_ttm_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_uc_fw.o
  CC      drivers/gpu/drm/i915/i915_gem.o
  CC [M]  drivers/gpu/drm/xe/xe_vm.o
  CC      drivers/gpu/drm/i915/i915_gem_evict.o
  CC [M]  drivers/gpu/drm/xe/xe_vram.o
  CC [M]  drivers/gpu/drm/xe/xe_vram_freq.o
  CC [M]  drivers/gpu/drm/xe/xe_vsec.o
  CC [M]  drivers/gpu/drm/xe/xe_wa.o
  CC      drivers/gpu/drm/i915/i915_gem_gtt.o
  CC      drivers/gpu/drm/i915/i915_gem_ww.o
  CC [M]  drivers/gpu/drm/xe/xe_wait_user_fence.o
  CC [M]  drivers/gpu/drm/xe/xe_wopcm.o
  CC [M]  drivers/gpu/drm/xe/xe_hmm.o
  CC      drivers/gpu/drm/i915/i915_query.o
  CC [M]  drivers/gpu/drm/xe/xe_hwmon.o
  CC [M]  drivers/gpu/drm/xe/xe_pmu.o
  CC      drivers/gpu/drm/i915/i915_request.o
  CC      drivers/gpu/drm/i915/i915_scheduler.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sriov_vf.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_relay.o
  CC      drivers/gpu/drm/i915/i915_trace_points.o
  CC [M]  drivers/gpu/drm/xe/xe_memirq.o
  CC [M]  drivers/gpu/drm/xe/xe_sriov.o
  CC      drivers/gpu/drm/i915/i915_ttm_buddy_manager.o
  CC [M]  drivers/gpu/drm/xe/xe_sriov_vf.o
  CC      drivers/gpu/drm/i915/i915_vma.o
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_irq.o
  CC      drivers/gpu/drm/i915/i915_vma_resource.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.o
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_utils.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.o
  CC [M]  drivers/gpu/drm/xe/display/intel_bo.o
  CC [M]  drivers/gpu/drm/xe/display/intel_fb_bo.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_ads.o
  CC [M]  drivers/gpu/drm/xe/display/intel_fbdev_fb.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_capture.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_misc.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_ct.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_rpm.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_rps.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_wa.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_fw.o
  CC [M]  drivers/gpu/drm/xe/display/xe_dsb_buffer.o
  CC [M]  drivers/gpu/drm/xe/display/xe_fb_pin.o
  CC [M]  drivers/gpu/drm/xe/display/xe_hdcp_gsc.o
  CC [M]  drivers/gpu/drm/xe/display/xe_plane_initial.o
  CC [M]  drivers/gpu/drm/xe/display/xe_tdf.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.o
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_dram.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_log.o
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_pch.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.o
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_rom.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_rc.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_submission.o
  CC [M]  drivers/gpu/drm/xe/i915-display/icl_dsi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_alpm.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_huc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic_plane.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_audio.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_backlight.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bios.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_huc_fw.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_uc.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cdclk.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cmtg.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_uc_fw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_color.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_combo_phy.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_connector.o
  CC      drivers/gpu/drm/i915/gt/intel_gsc.o
  CC      drivers/gpu/drm/i915/i915_hwmon.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc.o
  CC      drivers/gpu/drm/i915/display/hsw_ips.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc_state_dump.o
  CC      drivers/gpu/drm/i915/display/i9xx_plane.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cursor.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cx0_phy.o
  CC      drivers/gpu/drm/i915/display/i9xx_display_sr.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi_buf_trans.o
  CC      drivers/gpu/drm/i915/display/i9xx_wm.o
  CC      drivers/gpu/drm/i915/display/intel_alpm.o
  CC      drivers/gpu/drm/i915/display/intel_atomic.o
  CC      drivers/gpu/drm/i915/display/intel_atomic_plane.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display.o
  CC      drivers/gpu/drm/i915/display/intel_audio.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_conversion.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_device.o
  CC      drivers/gpu/drm/i915/display/intel_bios.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_driver.o
  CC      drivers/gpu/drm/i915/display/intel_bo.o
  CC      drivers/gpu/drm/i915/display/intel_bw.o
  CC      drivers/gpu/drm/i915/display/intel_cdclk.o
  CC      drivers/gpu/drm/i915/display/intel_cmtg.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_irq.o
  CC      drivers/gpu/drm/i915/display/intel_color.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_params.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power.o
  CC      drivers/gpu/drm/i915/display/intel_combo_phy.o
  CC      drivers/gpu/drm/i915/display/intel_connector.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_map.o
  CC      drivers/gpu/drm/i915/display/intel_crtc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_well.o
  CC      drivers/gpu/drm/i915/display/intel_crtc_state_dump.o
  CC      drivers/gpu/drm/i915/display/intel_cursor.o
  CC      drivers/gpu/drm/i915/display/intel_display.o
  CC      drivers/gpu/drm/i915/display/intel_display_conversion.o
  CC      drivers/gpu/drm/i915/display/intel_display_driver.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_trace.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_wa.o
  CC      drivers/gpu/drm/i915/display/intel_display_irq.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dkl_phy.o
  CC      drivers/gpu/drm/i915/display/intel_display_params.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dmc.o
  CC      drivers/gpu/drm/i915/display/intel_display_power.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dmc_wl.o
  CC      drivers/gpu/drm/i915/display/intel_display_power_map.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp.o
  CC      drivers/gpu/drm/i915/display/intel_display_power_well.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_aux.o
  CC      drivers/gpu/drm/i915/display/intel_display_reset.o
  CC      drivers/gpu/drm/i915/display/intel_display_rpm.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_aux_backlight.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_hdcp.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_link_training.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_mst.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_test.o
  CC      drivers/gpu/drm/i915/display/intel_display_rps.o
  CC      drivers/gpu/drm/i915/display/intel_display_snapshot.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpll.o
  CC      drivers/gpu/drm/i915/display/intel_display_wa.o
  CC      drivers/gpu/drm/i915/display/intel_dmc.o
  CC      drivers/gpu/drm/i915/display/intel_dmc_wl.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpll_mgr.o
  CC      drivers/gpu/drm/i915/display/intel_dpio_phy.o
  CC      drivers/gpu/drm/i915/display/intel_dpll.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpt_common.o
  CC      drivers/gpu/drm/i915/display/intel_dpll_mgr.o
  CC      drivers/gpu/drm/i915/display/intel_dpt.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_drrs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsb.o
  CC      drivers/gpu/drm/i915/display/intel_dpt_common.o
  CC      drivers/gpu/drm/i915/display/intel_drrs.o
  CC      drivers/gpu/drm/i915/display/intel_dsb.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi.o
  CC      drivers/gpu/drm/i915/display/intel_dsb_buffer.o
  CC      drivers/gpu/drm/i915/display/intel_fb.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_dcs_backlight.o
  CC      drivers/gpu/drm/i915/display/intel_fb_bo.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_vbt.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_encoder.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fb.o
  CC      drivers/gpu/drm/i915/display/intel_fb_pin.o
  CC      drivers/gpu/drm/i915/display/intel_fbc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fbc.o
  CC      drivers/gpu/drm/i915/display/intel_fdi.o
  CC      drivers/gpu/drm/i915/display/intel_fifo_underrun.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fdi.o
  CC      drivers/gpu/drm/i915/display/intel_frontbuffer.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fifo_underrun.o
  CC      drivers/gpu/drm/i915/display/intel_global_state.o
  CC      drivers/gpu/drm/i915/display/intel_hdcp.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_frontbuffer.o
  CC      drivers/gpu/drm/i915/display/intel_hdcp_gsc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_global_state.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_gmbus.o
  CC      drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdcp.o
  CC      drivers/gpu/drm/i915/display/intel_hotplug.o
  CC      drivers/gpu/drm/i915/display/intel_hotplug_irq.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdcp_gsc_message.o
  CC      drivers/gpu/drm/i915/display/intel_hti.o
  CC      drivers/gpu/drm/i915/display/intel_link_bw.o
  CC      drivers/gpu/drm/i915/display/intel_load_detect.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdmi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hotplug.o
  CC      drivers/gpu/drm/i915/display/intel_lpe_audio.o
  CC      drivers/gpu/drm/i915/display/intel_modeset_lock.o
  CC      drivers/gpu/drm/i915/display/intel_modeset_setup.o
  CC      drivers/gpu/drm/i915/display/intel_modeset_verify.o
  CC      drivers/gpu/drm/i915/display/intel_overlay.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hotplug_irq.o
  CC      drivers/gpu/drm/i915/display/intel_pch_display.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hti.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_link_bw.o
  CC      drivers/gpu/drm/i915/display/intel_pch_refclk.o
  CC      drivers/gpu/drm/i915/display/intel_plane_initial.o
  CC      drivers/gpu/drm/i915/display/intel_pmdemand.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_lspcon.o
  CC      drivers/gpu/drm/i915/display/intel_psr.o
  CC      drivers/gpu/drm/i915/display/intel_quirks.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_lock.o
  CC      drivers/gpu/drm/i915/display/intel_sprite.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_setup.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_verify.o
  CC      drivers/gpu/drm/i915/display/intel_sprite_uapi.o
  CC      drivers/gpu/drm/i915/display/intel_tc.o
  CC      drivers/gpu/drm/i915/display/intel_vblank.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_panel.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pfit.o
  CC      drivers/gpu/drm/i915/display/intel_vga.o
  CC      drivers/gpu/drm/i915/display/intel_wm.o
  CC      drivers/gpu/drm/i915/display/skl_scaler.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pmdemand.o
  CC      drivers/gpu/drm/i915/display/skl_universal_plane.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pps.o
  CC      drivers/gpu/drm/i915/display/skl_watermark.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_psr.o
  CC      drivers/gpu/drm/i915/display/intel_acpi.o
  CC      drivers/gpu/drm/i915/display/intel_opregion.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_qp_tables.o
  CC      drivers/gpu/drm/i915/display/intel_display_debugfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_quirks.o
  CC      drivers/gpu/drm/i915/display/intel_display_debugfs_params.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_snps_hdmi_pll.o
  CC      drivers/gpu/drm/i915/display/intel_pipe_crc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_snps_phy.o
  CC      drivers/gpu/drm/i915/display/dvo_ch7017.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_tc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vblank.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vdsc.o
  CC      drivers/gpu/drm/i915/display/dvo_ch7xxx.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vga.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vrr.o
  CC      drivers/gpu/drm/i915/display/dvo_ivch.o
  CC      drivers/gpu/drm/i915/display/dvo_ns2501.o
  CC      drivers/gpu/drm/i915/display/dvo_sil164.o
  CC      drivers/gpu/drm/i915/display/dvo_tfp410.o
  CC      drivers/gpu/drm/i915/display/g4x_dp.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_wm.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_scaler.o
  CC      drivers/gpu/drm/i915/display/g4x_hdmi.o
  CC      drivers/gpu/drm/i915/display/icl_dsi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_universal_plane.o
  CC      drivers/gpu/drm/i915/display/intel_backlight.o
  CC      drivers/gpu/drm/i915/display/intel_crt.o
  CC      drivers/gpu/drm/i915/display/intel_cx0_phy.o
  CC      drivers/gpu/drm/i915/display/intel_ddi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_watermark.o
  CC      drivers/gpu/drm/i915/display/intel_ddi_buf_trans.o
  CC      drivers/gpu/drm/i915/display/intel_display_device.o
  CC      drivers/gpu/drm/i915/display/intel_display_trace.o
  CC      drivers/gpu/drm/i915/display/intel_dkl_phy.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_acpi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_opregion.o
  CC      drivers/gpu/drm/i915/display/intel_dp.o
  CC [M]  drivers/gpu/drm/xe/xe_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_stats.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_debugfs.o
  CC      drivers/gpu/drm/i915/display/intel_dp_aux.o
  CC [M]  drivers/gpu/drm/xe/xe_huc_debugfs.o
  CC      drivers/gpu/drm/i915/display/intel_dp_aux_backlight.o
  CC [M]  drivers/gpu/drm/xe/xe_uc_debugfs.o
  CC      drivers/gpu/drm/i915/display/intel_dp_hdcp.o
  CC      drivers/gpu/drm/i915/display/intel_dp_link_training.o
  CC      drivers/gpu/drm/i915/display/intel_dp_mst.o
  CC      drivers/gpu/drm/i915/display/intel_dp_test.o
  CC      drivers/gpu/drm/i915/display/intel_dsi.o
  CC      drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs_params.o
  CC      drivers/gpu/drm/i915/display/intel_dsi_vbt.o
  CC      drivers/gpu/drm/i915/display/intel_dvo.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pipe_crc.o
  CC      drivers/gpu/drm/i915/display/intel_encoder.o
  CC      drivers/gpu/drm/i915/display/intel_gmbus.o
  CC      drivers/gpu/drm/i915/display/intel_hdmi.o
  CC      drivers/gpu/drm/i915/display/intel_lspcon.o
  CC      drivers/gpu/drm/i915/display/intel_lvds.o
  CC      drivers/gpu/drm/i915/display/intel_panel.o
  CC      drivers/gpu/drm/i915/display/intel_pfit.o
  CC      drivers/gpu/drm/i915/display/intel_pps.o
  CC      drivers/gpu/drm/i915/display/intel_qp_tables.o
  CC      drivers/gpu/drm/i915/display/intel_sdvo.o
  CC      drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.o
  CC      drivers/gpu/drm/i915/display/intel_snps_phy.o
  CC      drivers/gpu/drm/i915/display/intel_tv.o
  CC      drivers/gpu/drm/i915/display/intel_vdsc.o
  CC      drivers/gpu/drm/i915/display/intel_vrr.o
  CC      drivers/gpu/drm/i915/display/vlv_dsi.o
  CC      drivers/gpu/drm/i915/display/vlv_dsi_pll.o
  CC      drivers/gpu/drm/i915/i915_perf.o
  CC      drivers/gpu/drm/i915/pxp/intel_pxp.o
  CC      drivers/gpu/drm/i915/pxp/intel_pxp_huc.o
  CC      drivers/gpu/drm/i915/pxp/intel_pxp_tee.o
  CC      drivers/gpu/drm/i915/i915_gpu_error.o
  CC      drivers/gpu/drm/i915/i915_vgpu.o
  LD [M]  drivers/gpu/drm/xe/xe.o
  AR      drivers/gpu/drm/i915/built-in.a
  AR      drivers/gpu/drm/built-in.a
  AR      drivers/gpu/built-in.a
  AR      drivers/built-in.a
  AR      built-in.a
  AR      vmlinux.a
  LD      vmlinux.o
  OBJCOPY modules.builtin.modinfo
  GEN     modules.builtin
  MODPOST Module.symvers
  CC      .vmlinux.export.o
  CC [M]  fs/efivarfs/efivarfs.mod.o
  CC [M]  .module-common.o
  CC [M]  drivers/gpu/drm/drm_exec.mod.o
  CC [M]  drivers/gpu/drm/drm_gpuvm.mod.o
  CC [M]  drivers/gpu/drm/drm_suballoc_helper.mod.o
  CC [M]  drivers/gpu/drm/drm_ttm_helper.mod.o
  CC [M]  drivers/gpu/drm/scheduler/gpu-sched.mod.o
  CC [M]  drivers/gpu/drm/xe/xe.mod.o
  CC [M]  drivers/thermal/intel/x86_pkg_temp_thermal.mod.o
  CC [M]  net/netfilter/nf_log_syslog.mod.o
  CC [M]  net/netfilter/xt_mark.mod.o
  CC [M]  net/netfilter/xt_nat.mod.o
  CC [M]  net/netfilter/xt_LOG.mod.o
  CC [M]  net/netfilter/xt_MASQUERADE.mod.o
  CC [M]  net/netfilter/xt_addrtype.mod.o
  CC [M]  net/ipv4/netfilter/iptable_nat.mod.o
  LD [M]  fs/efivarfs/efivarfs.ko
  LD [M]  drivers/gpu/drm/drm_suballoc_helper.ko
  LD [M]  drivers/gpu/drm/drm_ttm_helper.ko
  LD [M]  drivers/gpu/drm/scheduler/gpu-sched.ko
  LD [M]  net/netfilter/nf_log_syslog.ko
  LD [M]  net/netfilter/xt_mark.ko
  LD [M]  net/netfilter/xt_nat.ko
  LD [M]  net/netfilter/xt_LOG.ko
  LD [M]  net/netfilter/xt_MASQUERADE.ko
  LD [M]  net/netfilter/xt_addrtype.ko
  LD [M]  net/ipv4/netfilter/iptable_nat.ko
  LD [M]  drivers/gpu/drm/drm_exec.ko
  LD [M]  drivers/gpu/drm/drm_gpuvm.ko
  LD [M]  drivers/thermal/intel/x86_pkg_temp_thermal.ko
  LD [M]  drivers/gpu/drm/xe/xe.ko
  UPD     include/generated/utsversion.h
  CC      init/version-timestamp.o
  KSYMS   .tmp_vmlinux0.kallsyms.S
  AS      .tmp_vmlinux0.kallsyms.o
  LD      .tmp_vmlinux1
  NM      .tmp_vmlinux1.syms
  KSYMS   .tmp_vmlinux1.kallsyms.S
  AS      .tmp_vmlinux1.kallsyms.o
  LD      .tmp_vmlinux2
  NM      .tmp_vmlinux2.syms
  KSYMS   .tmp_vmlinux2.kallsyms.S
  AS      .tmp_vmlinux2.kallsyms.o
  LD      vmlinux
  NM      System.map
  SORTTAB vmlinux
  RELOCS  arch/x86/boot/compressed/vmlinux.relocs
  RSTRIP  vmlinux
  CC      arch/x86/boot/a20.o
  AS      arch/x86/boot/bioscall.o
  CC      arch/x86/boot/cmdline.o
  AS      arch/x86/boot/copy.o
  HOSTCC  arch/x86/boot/mkcpustr
  CC      arch/x86/boot/cpuflags.o
  CC      arch/x86/boot/cpucheck.o
  CC      arch/x86/boot/early_serial_console.o
  CC      arch/x86/boot/edd.o
  CC      arch/x86/boot/main.o
  CC      arch/x86/boot/memory.o
  CC      arch/x86/boot/pm.o
  AS      arch/x86/boot/pmjump.o
  CC      arch/x86/boot/printf.o
  CC      arch/x86/boot/regs.o
  CC      arch/x86/boot/string.o
  CC      arch/x86/boot/tty.o
  CC      arch/x86/boot/video.o
  CC      arch/x86/boot/video-mode.o
  CC      arch/x86/boot/version.o
  CC      arch/x86/boot/video-vga.o
  CC      arch/x86/boot/video-vesa.o
  CC      arch/x86/boot/video-bios.o
  HOSTCC  arch/x86/boot/tools/build
  CPUSTR  arch/x86/boot/cpustr.h
  CC      arch/x86/boot/cpu.o
  LDS     arch/x86/boot/compressed/vmlinux.lds
  AS      arch/x86/boot/compressed/kernel_info.o
  AS      arch/x86/boot/compressed/head_32.o
  VOFFSET arch/x86/boot/compressed/../voffset.h
  CC      arch/x86/boot/compressed/string.o
  CC      arch/x86/boot/compressed/cmdline.o
  CC      arch/x86/boot/compressed/error.o
  OBJCOPY arch/x86/boot/compressed/vmlinux.bin
  HOSTCC  arch/x86/boot/compressed/mkpiggy
  CC      arch/x86/boot/compressed/cpuflags.o
  CC      arch/x86/boot/compressed/early_serial_console.o
  CC      arch/x86/boot/compressed/kaslr.o
  CC      arch/x86/boot/compressed/acpi.o
  CC      arch/x86/boot/compressed/efi.o
  GZIP    arch/x86/boot/compressed/vmlinux.bin.gz
  CC      arch/x86/boot/compressed/misc.o
  MKPIGGY arch/x86/boot/compressed/piggy.S
  AS      arch/x86/boot/compressed/piggy.o
  LD      arch/x86/boot/compressed/vmlinux
  ZOFFSET arch/x86/boot/zoffset.h
  OBJCOPY arch/x86/boot/vmlinux.bin
  AS      arch/x86/boot/header.o
  LD      arch/x86/boot/setup.elf
  OBJCOPY arch/x86/boot/setup.bin
  BUILD   arch/x86/boot/bzImage
Kernel: arch/x86/boot/bzImage is ready  (#1)
run-parts: executing /workspace/ci/hooks/20-kernel-doc
+ SRC_DIR=/workspace/kernel
+ cd /workspace/kernel
+ find drivers/gpu/drm/xe/ -name '*.[ch]' -not -path 'drivers/gpu/drm/xe/display/*'
+ xargs ./scripts/kernel-doc -Werror -none include/uapi/drm/xe_drm.h
All hooks done


