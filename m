Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0930C369CB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 18:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFF810E08C;
	Wed, 23 Apr 2025 18:06:01 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFD310E08C;
 Wed, 23 Apr 2025 18:06:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_series_starting_with_=5Bv3=2C1?=
 =?utf-8?q?/2=5D_drm/i915/display=3A_Ensure_enough_lines_between_delayed_VBl?=
 =?utf-8?q?ank_and_VBlank?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Apr 2025 18:06:00 -0000
Message-ID: <174543156043.1595.10356006591650663350@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250423102704.1368310-1-jouni.hogander@intel.com>
In-Reply-To: <20250423102704.1368310-1-jouni.hogander@intel.com>
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

Series: series starting with [v3,1/2] drm/i915/display: Ensure enough lines between delayed VBlank and VBlank
URL   : https://patchwork.freedesktop.org/series/148126/
State : failure

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
+ export
+ grep -Ei '(^|\W)CI_'
declare -x CI_KERNEL_BUILD_DIR="/workspace/kernel/build64-debug"
declare -x CI_KERNEL_SRC_DIR="/workspace/kernel"
declare -x CI_TOOLS_SRC_DIR="/workspace/ci"
declare -x CI_WORKSPACE_DIR="/workspace"
run-parts: executing /workspace/ci/hooks/10-build-W1
+ SRC_DIR=/workspace/kernel
+ RESTORE_DISPLAY_CONFIG=0
+ '[' -n /workspace/kernel/build64-debug ']'
+ BUILD_DIR=/workspace/kernel/build64-debug
+ cd /workspace/kernel
++ nproc
+ make -j25 O=/workspace/kernel/build64-debug modules_prepare
make[1]: Entering directory '/workspace/kernel/build64-debug'
  GEN     Makefile
  DESCEND objtool
  CALL    ../scripts/checksyscalls.sh
  INSTALL libsubcmd_headers
  CC      /workspace/kernel/build64-debug/tools/objtool/libsubcmd/exec-cmd.o
  CC      /workspace/kernel/build64-debug/tools/objtool/libsubcmd/help.o
  CC      /workspace/kernel/build64-debug/tools/objtool/libsubcmd/pager.o
  CC      /workspace/kernel/build64-debug/tools/objtool/libsubcmd/parse-options.o
  CC      /workspace/kernel/build64-debug/tools/objtool/libsubcmd/run-command.o
  CC      /workspace/kernel/build64-debug/tools/objtool/libsubcmd/sigchain.o
  CC      /workspace/kernel/build64-debug/tools/objtool/libsubcmd/subcmd-config.o
  LD      /workspace/kernel/build64-debug/tools/objtool/libsubcmd/libsubcmd-in.o
  AR      /workspace/kernel/build64-debug/tools/objtool/libsubcmd/libsubcmd.a
  CC      /workspace/kernel/build64-debug/tools/objtool/weak.o
  CC      /workspace/kernel/build64-debug/tools/objtool/check.o
  CC      /workspace/kernel/build64-debug/tools/objtool/special.o
  CC      /workspace/kernel/build64-debug/tools/objtool/builtin-check.o
  CC      /workspace/kernel/build64-debug/tools/objtool/elf.o
  CC      /workspace/kernel/build64-debug/tools/objtool/arch/x86/special.o
  CC      /workspace/kernel/build64-debug/tools/objtool/objtool.o
  CC      /workspace/kernel/build64-debug/tools/objtool/arch/x86/decode.o
  CC      /workspace/kernel/build64-debug/tools/objtool/orc_gen.o
  CC      /workspace/kernel/build64-debug/tools/objtool/orc_dump.o
  CC      /workspace/kernel/build64-debug/tools/objtool/arch/x86/orc.o
  CC      /workspace/kernel/build64-debug/tools/objtool/libstring.o
  CC      /workspace/kernel/build64-debug/tools/objtool/libctype.o
  CC      /workspace/kernel/build64-debug/tools/objtool/str_error_r.o
  CC      /workspace/kernel/build64-debug/tools/objtool/librbtree.o
  LD      /workspace/kernel/build64-debug/tools/objtool/arch/x86/objtool-in.o
  LD      /workspace/kernel/build64-debug/tools/objtool/objtool-in.o
  LINK    /workspace/kernel/build64-debug/tools/objtool/objtool
make[1]: Leaving directory '/workspace/kernel/build64-debug'
++ nproc
+ make -j25 O=/workspace/kernel/build64-debug W=1 drivers/gpu/drm/xe
make[1]: Entering directory '/workspace/kernel/build64-debug'
make[2]: Nothing to be done for 'drivers/gpu/drm/xe'.
make[1]: Leaving directory '/workspace/kernel/build64-debug'
run-parts: executing /workspace/ci/hooks/11-build-32b
+++ realpath /workspace/ci/hooks/11-build-32b
++ dirname /workspace/ci/hooks/11-build-32b
+ THIS_SCRIPT_DIR=/workspace/ci/hooks
+ SRC_DIR=/workspace/kernel
+ TOOLS_SRC_DIR=/workspace/ci
+ '[' -n /workspace/kernel/build64-debug ']'
+ BUILD_DIR=/workspace/kernel/build64-debug
+ BUILD_DIR=/workspace/kernel/build64-debug/build32
+ cd /workspace/kernel
+ mkdir -p /workspace/kernel/build64-debug/build32
++ nproc
+ make -j25 ARCH=i386 O=/workspace/kernel/build64-debug/build32 defconfig
make[1]: Entering directory '/workspace/kernel/build64-debug/build32'
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
make[1]: Leaving directory '/workspace/kernel/build64-debug/build32'
+ cd /workspace/kernel/build64-debug/build32
+ /workspace/kernel/scripts/kconfig/merge_config.sh .config /workspace/ci/kernel/fragments/10-xe.fragment
Using .config as base
Merging /workspace/ci/kernel/fragments/10-xe.fragment
Value of CONFIG_DRM_XE is redefined by fragment /workspace/ci/kernel/fragments/10-xe.fragment:
Previous value: # CONFIG_DRM_XE is not set
New value: CONFIG_DRM_XE=m

  GEN     Makefile
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

Value requested for CONFIG_X86_INTEL_QUARK not in final .config
Requested value:  # CONFIG_X86_INTEL_QUARK is not set
Actual value:     

Value requested for CONFIG_X86_RDC321X not in final .config
Requested value:  # CONFIG_X86_RDC321X is not set
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

Value requested for CONFIG_MATOM not in final .config
Requested value:  # CONFIG_MATOM is not set
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

Value requested for CONFIG_HIGHMEM4G not in final .config
Requested value:  # CONFIG_HIGHMEM4G is not set
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

Value requested for CONFIG_X86_DISABLED_FEATURE_PCID not in final .config
Requested value:  CONFIG_X86_DISABLED_FEATURE_PCID=y
Actual value:     

Value requested for CONFIG_X86_DISABLED_FEATURE_PKU not in final .config
Requested value:  CONFIG_X86_DISABLED_FEATURE_PKU=y
Actual value:     

Value requested for CONFIG_X86_DISABLED_FEATURE_OSPKE not in final .config
Requested value:  CONFIG_X86_DISABLED_FEATURE_OSPKE=y
Actual value:     

Value requested for CONFIG_X86_DISABLED_FEATURE_LA57 not in final .config
Requested value:  CONFIG_X86_DISABLED_FEATURE_LA57=y
Actual value:     

Value requested for CONFIG_X86_DISABLED_FEATURE_PTI not in final .config
Requested value:  CONFIG_X86_DISABLED_FEATURE_PTI=y
Actual value:     

Value requested for CONFIG_X86_DISABLED_FEATURE_IBT not in final .config
Requested value:  CONFIG_X86_DISABLED_FEATURE_IBT=y
Actual value:     

Value requested for CONFIG_X86_DISABLED_FEATURE_INVLPGB not in final .config
Requested value:  CONFIG_X86_DISABLED_FEATURE_INVLPGB=y
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

Value requested for CONFIG_KMAP_LOCAL not in final .config
Requested value:  CONFIG_KMAP_LOCAL=y
Actual value:     

Value requested for CONFIG_HAVE_EISA not in final .config
Requested value:  CONFIG_HAVE_EISA=y
Actual value:     

Value requested for CONFIG_EISA not in final .config
Requested value:  # CONFIG_EISA is not set
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
+ make -j25 ARCH=i386 olddefconfig
  GEN     Makefile
#
# configuration written to .config
#
++ nproc
+ make -j25 ARCH=i386
  SYNC    include/config/auto.conf.cmd
  GEN     Makefile
  GEN     Makefile
  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/x86/include/generated/uapi/asm/errno.h
  WRAP    arch/x86/include/generated/uapi/asm/fcntl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctls.h
  WRAP    arch/x86/include/generated/uapi/asm/ipcbuf.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  WRAP    arch/x86/include/generated/uapi/asm/param.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  WRAP    arch/x86/include/generated/uapi/asm/resource.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  WRAP    arch/x86/include/generated/uapi/asm/socket.h
  WRAP    arch/x86/include/generated/uapi/asm/sockios.h
  WRAP    arch/x86/include/generated/uapi/asm/termbits.h
  UPD     include/generated/uapi/linux/version.h
  WRAP    arch/x86/include/generated/uapi/asm/termios.h
  WRAP    arch/x86/include/generated/uapi/asm/types.h
  UPD     arch/x86/include/generated/asm/cpufeaturemasks.h
  WRAP    arch/x86/include/generated/asm/early_ioremap.h
  WRAP    arch/x86/include/generated/asm/fprobe.h
  WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
  HOSTCC  arch/x86/tools/relocs_32.o
  WRAP    arch/x86/include/generated/asm/mmzone.h
  HOSTCC  arch/x86/tools/relocs_64.o
  UPD     include/generated/compile.h
  WRAP    arch/x86/include/generated/asm/irq_regs.h
  HOSTCC  arch/x86/tools/relocs_common.o
  WRAP    arch/x86/include/generated/asm/kmap_size.h
  WRAP    arch/x86/include/generated/asm/local64.h
  WRAP    arch/x86/include/generated/asm/mmiowb.h
  WRAP    arch/x86/include/generated/asm/module.lds.h
  WRAP    arch/x86/include/generated/asm/rwonce.h
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/sorttable
  HOSTCC  scripts/asn1_compiler
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
  HOSTCC  usr/gen_init_cpio
  CC      init/main.o
  CC      init/do_mounts.o
  CC      certs/system_keyring.o
  CC      init/do_mounts_initrd.o
  UPD     init/utsversion-tmp.h
  CC      mm/filemap.o
  CC      io_uring/io_uring.o
  CC      arch/x86/realmode/init.o
  AS      arch/x86/lib/atomic64_cx8_32.o
  CC      ipc/util.o
  CC      security/keys/gc.o
  CC      block/partitions/core.o
  AR      arch/x86/crypto/built-in.a
  CC      net/core/sock.o
  CC      arch/x86/mm/pat/set_memory.o
  CC      arch/x86/events/amd/core.o
  AR      drivers/cache/built-in.a
  CC      arch/x86/kernel/fpu/init.o
  AR      lib/math/tests/built-in.a
  AR      sound/i2c/other/built-in.a
  CC      fs/notify/dnotify/dnotify.o
  AS      arch/x86/lib/checksum_32.o
  AR      drivers/irqchip/built-in.a
  CC      sound/core/seq/seq.o
  CC      lib/math/div64.o
  CC      arch/x86/entry/vdso/vma.o
  AR      virt/lib/built-in.a
  AR      sound/i2c/built-in.a
  AR      virt/built-in.a
  AR      drivers/bus/mhi/built-in.a
  HOSTCC  security/selinux/genheaders
  CC      arch/x86/kernel/fpu/bugs.o
  AR      drivers/bus/built-in.a
  CC      kernel/sched/core.o
  CC      arch/x86/lib/cmdline.o
  AR      drivers/pwm/built-in.a
  CC      crypto/asymmetric_keys/asymmetric_type.o
  AR      drivers/leds/trigger/built-in.a
  AR      drivers/leds/blink/built-in.a
  AR      drivers/leds/simatic/built-in.a
  CC      drivers/leds/led-core.o
  AS      arch/x86/lib/cmpxchg8b_emu.o
  CC      lib/math/gcd.o
  CC      block/bdev.o
  CC      arch/x86/lib/cpu.o
  CC      lib/math/lcm.o
  GEN     security/selinux/flask.h security/selinux/av_permissions.h
  CC      security/selinux/avc.o
  GEN     usr/initramfs_data.cpio
  CC      lib/math/int_log.o
  COPY    usr/initramfs_inc_data
  AS      usr/initramfs_data.o
  AR      usr/built-in.a
  CC      net/core/request_sock.o
  HOSTCC  certs/extract-cert
  CC      lib/math/int_pow.o
  CC      lib/math/int_sqrt.o
  CC      lib/math/reciprocal_div.o
  CC      arch/x86/kernel/fpu/core.o
  AS      arch/x86/realmode/rm/header.o
  AS      arch/x86/realmode/rm/trampoline_32.o
  CC      arch/x86/lib/delay.o
  CC      lib/math/rational.o
  AS      arch/x86/realmode/rm/stack.o
  CC      sound/core/seq/seq_lock.o
  AS      arch/x86/realmode/rm/reboot.o
  AS      arch/x86/realmode/rm/wakeup_asm.o
  CERT    certs/x509_certificate_list
  CERT    certs/signing_key.x509
  AS      certs/system_certificates.o
  CC      arch/x86/realmode/rm/wakemain.o
  AR      certs/built-in.a
  CC      init/initramfs.o
  CC      drivers/leds/led-class.o
  CC      arch/x86/realmode/rm/video-mode.o
  CC      arch/x86/entry/vdso/extable.o
  CC      security/keys/key.o
  AR      fs/notify/dnotify/built-in.a
  CC      fs/notify/inotify/inotify_fsnotify.o
  AR      sound/drivers/opl3/built-in.a
  AR      sound/drivers/opl4/built-in.a
  AR      sound/drivers/mpu401/built-in.a
  AS      arch/x86/lib/getuser.o
  CC      block/partitions/msdos.o
  AR      sound/drivers/vx/built-in.a
  AS      arch/x86/realmode/rm/copy.o
  AR      sound/drivers/pcsp/built-in.a
  GEN     arch/x86/lib/inat-tables.c
  AS      arch/x86/realmode/rm/bioscall.o
  AR      sound/drivers/built-in.a
  CC      arch/x86/lib/insn-eval.o
  CC      arch/x86/mm/pat/memtype.o
  CC      arch/x86/realmode/rm/regs.o
  AR      lib/math/built-in.a
  CC      lib/crypto/mpi/generic_mpih-lshift.o
  CC      sound/core/seq/seq_clientmgr.o
  CC      ipc/msgutil.o
  CC      arch/x86/realmode/rm/video-vga.o
  CC      arch/x86/realmode/rm/video-vesa.o
  CC      arch/x86/realmode/rm/video-bios.o
  CC      arch/x86/events/amd/lbr.o
  CC      crypto/asymmetric_keys/restrict.o
  CC      ipc/msg.o
  CC      drivers/leds/led-triggers.o
  PASYMS  arch/x86/realmode/rm/pasyms.h
  LDS     arch/x86/realmode/rm/realmode.lds
  CC      lib/crypto/memneq.o
  LD      arch/x86/realmode/rm/realmode.elf
  RELOCS  arch/x86/realmode/rm/realmode.relocs
  OBJCOPY arch/x86/realmode/rm/realmode.bin
  AS      arch/x86/realmode/rmpiggy.o
  AR      arch/x86/realmode/built-in.a
  CC      fs/notify/inotify/inotify_user.o
  CC      block/partitions/efi.o
  AR      arch/x86/platform/atom/built-in.a
  AR      sound/isa/ad1816a/built-in.a
  AR      arch/x86/platform/ce4100/built-in.a
  AR      sound/isa/ad1848/built-in.a
  CC      arch/x86/platform/efi/memmap.o
  AR      sound/isa/cs423x/built-in.a
  AR      sound/isa/es1688/built-in.a
  AR      sound/isa/galaxy/built-in.a
  AR      sound/isa/gus/built-in.a
  AR      sound/isa/msnd/built-in.a
  AR      sound/isa/opti9xx/built-in.a
  CC      arch/x86/mm/pat/memtype_interval.o
  CC      lib/crypto/mpi/generic_mpih-mul1.o
  AR      sound/isa/sb/built-in.a
  AR      sound/isa/wavefront/built-in.a
  AR      sound/isa/wss/built-in.a
  AR      sound/isa/built-in.a
  LDS     arch/x86/entry/vdso/vdso32/vdso32.lds
  CC      ipc/sem.o
  AS      arch/x86/entry/vdso/vdso32/note.o
  AS      arch/x86/entry/vdso/vdso32/system_call.o
  AS      arch/x86/entry/vdso/vdso32/sigreturn.o
  CC      kernel/locking/mutex.o
  CC      arch/x86/entry/vdso/vdso32/vclock_gettime.o
  CC      init/calibrate.o
  CC      security/selinux/hooks.o
  CC      kernel/sched/fair.o
  CC      arch/x86/lib/insn.o
  AR      fs/notify/fanotify/built-in.a
  CC      security/keys/keyring.o
  CC      net/ethernet/eth.o
  CC      kernel/sched/build_policy.o
  CC      crypto/asymmetric_keys/signature.o
  CC      init/init_task.o
  AR      drivers/leds/built-in.a
  CC      drivers/pci/msi/pcidev_msi.o
  CC      arch/x86/events/amd/ibs.o
  CC      lib/crypto/mpi/generic_mpih-mul2.o
  CC      arch/x86/lib/kaslr.o
  CC      arch/x86/platform/efi/quirks.o
  CC      arch/x86/kernel/fpu/regset.o
  AR      block/partitions/built-in.a
  CC      block/fops.o
  CC      arch/x86/entry/vdso/vdso32/vgetcpu.o
  CC      arch/x86/lib/memcpy_32.o
  CC      sound/core/seq/seq_memory.o
  AR      fs/notify/inotify/built-in.a
  CC      crypto/asymmetric_keys/public_key.o
  CC      fs/notify/fsnotify.o
  AS      arch/x86/lib/memmove_32.o
  HOSTCC  arch/x86/entry/vdso/vdso2c
  AR      arch/x86/mm/pat/built-in.a
  CC      arch/x86/mm/init.o
  CC      arch/x86/lib/misc.o
  CC      arch/x86/lib/pc-conf-reg.o
  CC      lib/crypto/mpi/generic_mpih-mul3.o
  AS      arch/x86/lib/putuser.o
  CC      drivers/pci/msi/api.o
  CC      arch/x86/platform/efi/efi.o
  AS      arch/x86/lib/retpoline.o
  CC      init/version.o
  CC      arch/x86/lib/string_32.o
  CC      arch/x86/lib/strstr_32.o
  CC      arch/x86/lib/usercopy.o
  AR      init/built-in.a
  CC      kernel/power/qos.o
  CC      kernel/locking/semaphore.o
  CC      arch/x86/kernel/fpu/signal.o
  CC      mm/mempool.o
  CC      arch/x86/entry/vdso/vdso32-setup.o
  CC      lib/crypto/mpi/generic_mpih-rshift.o
  ASN.1   crypto/asymmetric_keys/x509.asn1.[ch]
  ASN.1   crypto/asymmetric_keys/x509_akid.asn1.[ch]
  CC      crypto/asymmetric_keys/x509_loader.o
  CC      arch/x86/lib/usercopy_32.o
  CC      kernel/power/main.o
  CC      net/core/skbuff.o
  CC      sound/core/seq/seq_queue.o
  AR      net/ethernet/built-in.a
  CC      security/keys/keyctl.o
  CC      crypto/asymmetric_keys/x509_public_key.o
  CC      fs/notify/notification.o
  CC      arch/x86/events/amd/uncore.o
  VDSO    arch/x86/entry/vdso/vdso32.so.dbg
  AR      arch/x86/net/built-in.a
  CC      block/bio.o
  ASN.1   crypto/asymmetric_keys/pkcs7.asn1.[ch]
  OBJCOPY arch/x86/entry/vdso/vdso32.so
  CC      drivers/pci/msi/msi.o
  VDSO2C  arch/x86/entry/vdso/vdso-image-32.c
  CC      arch/x86/entry/vdso/vdso-image-32.o
  AR      lib/tests/built-in.a
  CC      ipc/shm.o
  CC      sound/core/sound.o
  CC      arch/x86/lib/msr-smp.o
  AR      arch/x86/entry/vdso/built-in.a
  CC      kernel/locking/rwsem.o
  AR      arch/x86/entry/vsyscall/built-in.a
  CC      lib/crypto/mpi/generic_mpih-sub1.o
  AS      arch/x86/entry/entry.o
  CC      arch/x86/platform/efi/efi_32.o
  AS      arch/x86/entry/entry_32.o
  CC      arch/x86/lib/cache-smp.o
  CC      arch/x86/entry/syscall_32.o
  CC      mm/oom_kill.o
  CC      arch/x86/lib/crc32-glue.o
  CC      crypto/asymmetric_keys/pkcs7_trust.o
  CC      fs/notify/group.o
  CC      arch/x86/mm/init_32.o
  CC      sound/core/seq/seq_fifo.o
  CC      fs/nfs_common/nfsacl.o
  CC      arch/x86/kernel/cpu/mce/core.o
  CC      io_uring/opdef.o
  CC      arch/x86/kernel/fpu/xstate.o
  CC      kernel/power/console.o
  CC      lib/crypto/mpi/generic_mpih-add1.o
  AS      arch/x86/lib/crc32-pclmul.o
  CC      drivers/pci/msi/irqdomain.o
  CC      arch/x86/lib/msr.o
  AS      arch/x86/platform/efi/efi_stub_32.o
  CC      arch/x86/platform/efi/runtime-map.o
  AR      arch/x86/events/amd/built-in.a
  CC      arch/x86/events/intel/core.o
  CC      security/keys/permission.o
  CC      crypto/asymmetric_keys/pkcs7_verify.o
  CC      kernel/locking/percpu-rwsem.o
  CC      sound/core/seq/seq_prioq.o
  CC      fs/notify/mark.o
  CC      ipc/syscall.o
  CC      lib/crypto/mpi/mpicoder.o
  CC      fs/nfs_common/grace.o
  AS      arch/x86/entry/thunk.o
  CC      io_uring/kbuf.o
  CC      arch/x86/mm/fault.o
  AR      arch/x86/entry/built-in.a
  CC      kernel/power/process.o
  CC      crypto/asymmetric_keys/x509.asn1.o
  CC      fs/nfs_common/common.o
  CC      crypto/asymmetric_keys/x509_akid.asn1.o
  CC      crypto/asymmetric_keys/x509_cert_parser.o
  CC      security/keys/process_keys.o
  CC      arch/x86/kernel/cpu/mtrr/mtrr.o
  AR      arch/x86/platform/efi/built-in.a
  AS      arch/x86/lib/msr-reg.o
  AR      arch/x86/platform/geode/built-in.a
  AR      arch/x86/platform/iris/built-in.a
  CC      kernel/locking/spinlock.o
  CC      arch/x86/lib/msr-reg-export.o
  CC      arch/x86/platform/intel/iosf_mbi.o
  AR      drivers/pci/msi/built-in.a
  CC      drivers/pci/pcie/portdrv.o
  CC      block/elevator.o
  CC      sound/core/seq/seq_timer.o
  AS      arch/x86/lib/hweight.o
  CC      arch/x86/lib/iomem.o
  CC      ipc/ipc_sysctl.o
  CC      lib/crypto/mpi/mpi-add.o
  CC      arch/x86/events/intel/bts.o
  AR      fs/nfs_common/built-in.a
  CC      mm/fadvise.o
  CC      fs/notify/fdinfo.o
  CC      kernel/printk/printk.o
  AR      arch/x86/kernel/fpu/built-in.a
  CC      kernel/locking/osq_lock.o
  CC      kernel/locking/qspinlock.o
  CC      crypto/asymmetric_keys/pkcs7.asn1.o
  CC      crypto/asymmetric_keys/pkcs7_parser.o
  CC      security/selinux/selinuxfs.o
  CC      arch/x86/lib/atomic64_32.o
  CC      arch/x86/kernel/cpu/mce/severity.o
  CC      arch/x86/kernel/cpu/mtrr/if.o
  CC      arch/x86/lib/inat.o
  CC      kernel/power/suspend.o
  AR      arch/x86/platform/intel/built-in.a
  CC      kernel/power/hibernate.o
  CC      ipc/mqueue.o
  AR      arch/x86/platform/intel-mid/built-in.a
  AR      arch/x86/platform/intel-quark/built-in.a
  AR      arch/x86/lib/built-in.a
  AR      arch/x86/platform/olpc/built-in.a
  CC      io_uring/rsrc.o
  AR      arch/x86/lib/lib.a
  AR      arch/x86/platform/scx200/built-in.a
  AR      arch/x86/platform/ts5500/built-in.a
  CC      drivers/pci/pcie/rcec.o
  CC      kernel/power/snapshot.o
  CC      sound/core/seq/seq_system.o
  AR      arch/x86/platform/uv/built-in.a
  CC      lib/crypto/mpi/mpi-bit.o
  AR      arch/x86/platform/built-in.a
  CC      arch/x86/mm/ioremap.o
  CC      security/keys/request_key.o
  AR      net/802/built-in.a
  CC      kernel/sched/build_utility.o
  AR      crypto/asymmetric_keys/built-in.a
  CC      crypto/api.o
  AR      sound/pci/ac97/built-in.a
  AR      drivers/pci/pwrctrl/built-in.a
  AR      sound/pci/ali5451/built-in.a
  CC      drivers/pci/pcie/bwctrl.o
  AR      sound/pci/asihpi/built-in.a
  AR      sound/pci/au88x0/built-in.a
  CC      mm/maccess.o
  AR      sound/pci/aw2/built-in.a
  CC      kernel/locking/rtmutex_api.o
  CC      block/blk-core.o
  AR      sound/pci/ctxfi/built-in.a
  AR      sound/pci/ca0106/built-in.a
  AR      sound/pci/cs46xx/built-in.a
  CC      arch/x86/kernel/cpu/mtrr/generic.o
  AR      sound/pci/cs5535audio/built-in.a
  AR      sound/pci/lola/built-in.a
  AR      fs/notify/built-in.a
  AR      sound/pci/lx6464es/built-in.a
  CC      crypto/cipher.o
  CC      fs/iomap/trace.o
  AR      sound/pci/echoaudio/built-in.a
  AR      sound/pci/emu10k1/built-in.a
  CC      sound/pci/hda/hda_bind.o
  CC      sound/core/seq/seq_ports.o
  CC      arch/x86/kernel/cpu/mce/genpool.o
  AR      sound/pci/ice1712/built-in.a
  CC      lib/crypto/mpi/mpi-cmp.o
  CC      arch/x86/virt/svm/cmdline.o
  AR      arch/x86/virt/svm/built-in.a
  AR      arch/x86/virt/vmx/built-in.a
  AR      arch/x86/virt/built-in.a
  CC      lib/vdso/datastore.o
  CC      arch/x86/mm/extable.o
  CC      security/keys/request_key_auth.o
  CC      security/integrity/iint.o
  CC      drivers/pci/pcie/aspm.o
  CC      net/core/datagram.o
  CC      mm/page-writeback.o
  CC      crypto/algapi.o
  CC      net/core/stream.o
  CC      arch/x86/kernel/cpu/mce/intel.o
  CC      lib/crypto/mpi/mpi-sub-ui.o
  CC      ipc/namespace.o
  CC      sound/core/seq/seq_info.o
  CC      arch/x86/kernel/cpu/mtrr/cleanup.o
  AR      lib/vdso/built-in.a
  CC      lib/crypto/mpi/mpi-div.o
  CC      arch/x86/events/intel/ds.o
  CC      kernel/power/swap.o
  CC      security/selinux/netlink.o
  CC      io_uring/notif.o
  CC      security/keys/user_defined.o
  CC      security/integrity/integrity_audit.o
  CC      kernel/locking/qrwlock.o
  CC      sound/pci/hda/hda_codec.o
  CC      arch/x86/mm/mmap.o
  CC      fs/iomap/iter.o
  CC      kernel/printk/printk_safe.o
  CC      fs/iomap/buffered-io.o
  CC      arch/x86/kernel/cpu/mce/amd.o
  CC      ipc/mq_sysctl.o
  CC      net/sched/sch_generic.o
  CC      sound/core/seq/seq_dummy.o
  CC      security/keys/proc.o
  CC      lib/crypto/mpi/mpi-mod.o
  CC      arch/x86/kernel/cpu/mtrr/amd.o
  AR      kernel/locking/built-in.a
  CC      net/sched/sch_mq.o
  CC      arch/x86/kernel/cpu/mtrr/cyrix.o
  AR      ipc/built-in.a
  CC      arch/x86/mm/pgtable.o
  CC      crypto/scatterwalk.o
  CC      arch/x86/events/zhaoxin/core.o
  CC      drivers/pci/pcie/pme.o
  CC      block/blk-sysfs.o
  CC      kernel/printk/nbcon.o
  AR      security/integrity/built-in.a
  CC      net/sched/sch_frag.o
  CC      block/blk-flush.o
  AR      sound/core/seq/built-in.a
  CC      sound/core/init.o
  CC      net/core/scm.o
  CC      kernel/power/user.o
  CC      drivers/video/console/dummycon.o
  CC      security/selinux/nlmsgtab.o
  CC      security/keys/sysctl.o
  CC      lib/crypto/mpi/mpi-mul.o
  CC      arch/x86/kernel/cpu/mtrr/centaur.o
  CC      mm/folio-compat.o
  CC      arch/x86/mm/physaddr.o
  AR      drivers/pci/pcie/built-in.a
  CC      drivers/pci/hotplug/pci_hotplug_core.o
  CC      io_uring/tctx.o
  CC      kernel/printk/printk_ringbuffer.o
  CC      crypto/proc.o
  AR      arch/x86/events/zhaoxin/built-in.a
  CC      drivers/video/console/vgacon.o
  CC      drivers/video/backlight/backlight.o
  CC      arch/x86/kernel/cpu/mce/threshold.o
  CC      sound/pci/hda/hda_jack.o
  CC      block/blk-settings.o
  CC      arch/x86/mm/tlb.o
  CC      arch/x86/events/intel/knc.o
  CC      arch/x86/kernel/cpu/mtrr/legacy.o
  CC      lib/crypto/mpi/mpih-cmp.o
  CC      kernel/power/poweroff.o
  CC      sound/core/memory.o
  CC      arch/x86/kernel/acpi/boot.o
  CC      mm/readahead.o
  CC      security/keys/keyctl_pkey.o
  CC      security/commoncap.o
  CC      security/selinux/netif.o
  CC      fs/iomap/direct-io.o
  AR      kernel/power/built-in.a
  CC      security/selinux/netnode.o
  CC      crypto/aead.o
  AR      arch/x86/kernel/cpu/mtrr/built-in.a
  AR      sound/ppc/built-in.a
  CC      io_uring/filetable.o
  CC      net/core/gen_stats.o
  CC      drivers/pci/hotplug/acpi_pcihp.o
  CC      kernel/printk/sysctl.o
  CC      io_uring/rw.o
  CC      net/sched/sch_api.o
  CC      net/netlink/af_netlink.o
  CC      lib/crypto/mpi/mpih-div.o
  CC      sound/core/control.o
  CC      arch/x86/events/intel/lbr.o
  AR      drivers/video/console/built-in.a
  AR      kernel/printk/built-in.a
  AR      drivers/pci/controller/dwc/built-in.a
  CC      arch/x86/events/intel/p4.o
  AR      drivers/pci/controller/mobiveil/built-in.a
  CC      sound/pci/hda/hda_auto_parser.o
  AR      drivers/pci/controller/plda/built-in.a
  CC      block/blk-ioc.o
  AR      drivers/pci/controller/built-in.a
  CC      net/netlink/genetlink.o
  AR      security/keys/built-in.a
  AR      drivers/video/backlight/built-in.a
  CC      crypto/geniv.o
  AR      drivers/video/fbdev/core/built-in.a
  AR      drivers/video/fbdev/omap/built-in.a
  AR      arch/x86/kernel/cpu/mce/built-in.a
  AR      drivers/video/fbdev/omap2/omapfb/dss/built-in.a
  CC      arch/x86/kernel/cpu/microcode/core.o
  AR      drivers/video/fbdev/omap2/omapfb/displays/built-in.a
  AR      drivers/video/fbdev/omap2/omapfb/built-in.a
  AR      drivers/video/fbdev/omap2/built-in.a
  AR      drivers/video/fbdev/built-in.a
  CC      drivers/video/aperture.o
  CC      arch/x86/mm/cpu_entry_area.o
  AR      drivers/pci/hotplug/built-in.a
  AR      drivers/pci/switch/built-in.a
  CC      drivers/pci/access.o
  CC      drivers/video/cmdline.o
  CC      mm/swap.o
  CC      arch/x86/kernel/acpi/sleep.o
  CC      lib/crypto/mpi/mpih-mul.o
  CC      drivers/video/nomodeset.o
  CC      net/core/gen_estimator.o
  AR      net/bpf/built-in.a
  CC      fs/iomap/ioend.o
  CC      net/netlink/policy.o
  CC      block/blk-map.o
  CC      security/selinux/netport.o
  CC      arch/x86/kernel/cpu/microcode/intel.o
  CC      arch/x86/pci/i386.o
  AR      sound/arm/built-in.a
  CC      arch/x86/mm/maccess.o
  AR      kernel/sched/built-in.a
  CC      sound/core/misc.o
  CC      kernel/irq/irqdesc.o
  CC      kernel/rcu/update.o
  CC      crypto/lskcipher.o
  CC      io_uring/net.o
  CC      sound/pci/hda/hda_sysfs.o
  CC      net/ethtool/ioctl.o
  CC      drivers/video/hdmi.o
  CC      arch/x86/events/intel/p6.o
  CC      drivers/pci/bus.o
  CC      arch/x86/mm/pgprot.o
  AS      arch/x86/kernel/acpi/wakeup_32.o
  CC      arch/x86/kernel/acpi/cstate.o
  CC      kernel/rcu/sync.o
  CC      lib/crypto/mpi/mpi-pow.o
  CC      lib/crypto/mpi/mpiutil.o
  CC      sound/core/device.o
  CC      net/core/net_namespace.o
  CC      kernel/irq/handle.o
  CC      sound/pci/hda/hda_controller.o
  CC      arch/x86/pci/init.o
  CC      sound/pci/hda/hda_proc.o
  CC      arch/x86/kernel/cpu/microcode/amd.o
  CC      net/sched/sch_blackhole.o
  CC      block/blk-merge.o
  CC      arch/x86/mm/pgtable_32.o
  CC      net/sched/cls_api.o
  CC      fs/iomap/fiemap.o
  AR      arch/x86/kernel/acpi/built-in.a
  CC      net/sched/act_api.o
  CC      mm/truncate.o
  AR      drivers/video/built-in.a
  AR      sound/sh/built-in.a
  AR      kernel/livepatch/built-in.a
  CC      security/selinux/status.o
  CC      io_uring/poll.o
  CC      arch/x86/events/intel/pt.o
  CC      drivers/pci/probe.o
  CC      lib/zlib_inflate/inffast.o
  CC      sound/core/info.o
  AR      lib/crypto/mpi/built-in.a
  CC      lib/crypto/utils.o
  CC      kernel/irq/manage.o
  AR      net/netlink/built-in.a
  CC      lib/zlib_inflate/inflate.o
  CC      fs/quota/dquot.o
  CC      arch/x86/pci/pcbios.o
  CC      arch/x86/mm/iomap_32.o
  CC      fs/iomap/seek.o
  CC      lib/crypto/chacha.o
  CC      crypto/skcipher.o
  CC      net/ethtool/common.o
  CC      lib/crypto/aes.o
  AR      drivers/idle/built-in.a
  AR      arch/x86/kernel/cpu/microcode/built-in.a
  CC      mm/vmscan.o
  CC      arch/x86/kernel/cpu/cacheinfo.o
  CC      security/lsm_syscalls.o
  CC      lib/zlib_inflate/infutil.o
  CC      sound/core/isadma.o
  CC      arch/x86/mm/hugetlbpage.o
  CC      sound/core/vmaster.o
  CC      security/selinux/ss/ebitmap.o
  CC      arch/x86/pci/mmconfig_32.o
  CC      sound/pci/hda/hda_hwdep.o
  CC      net/core/secure_seq.o
  CC      fs/iomap/swapfile.o
  CC      lib/zlib_inflate/inftrees.o
  CC      lib/crypto/arc4.o
  CC      arch/x86/events/intel/uncore.o
  CC      lib/zlib_inflate/inflate_syms.o
  AR      sound/pci/korg1212/built-in.a
  CC      arch/x86/kernel/apic/apic.o
  CC      kernel/rcu/srcutree.o
  CC      io_uring/eventfd.o
  CC      arch/x86/pci/direct.o
  CC      kernel/irq/spurious.o
  CC      lib/crypto/gf128mul.o
  CC      sound/core/ctljack.o
  AR      arch/x86/mm/built-in.a
  CC      drivers/pci/host-bridge.o
  CC      net/ethtool/netlink.o
  CC      fs/quota/quota_v2.o
  CC      crypto/seqiv.o
  AR      lib/zlib_inflate/built-in.a
  CC      crypto/echainiv.o
  CC      crypto/ahash.o
  CC      sound/pci/hda/hda_intel.o
  CC      arch/x86/kernel/cpu/scattered.o
  AR      drivers/char/ipmi/built-in.a
  CC      arch/x86/power/cpu.o
  AR      fs/iomap/built-in.a
  CC      mm/shrinker.o
  CC      block/blk-timeout.o
  CC      kernel/irq/resend.o
  CC      block/blk-lib.o
  CC      lib/crypto/blake2s.o
  CC      sound/core/jack.o
  CC      io_uring/uring_cmd.o
  CC      security/selinux/ss/hashtab.o
  CC      arch/x86/kernel/cpu/topology_common.o
  CC      kernel/irq/chip.o
  CC      drivers/pci/remove.o
  CC      fs/quota/quota_tree.o
  CC      kernel/irq/dummychip.o
  CC      arch/x86/pci/mmconfig-shared.o
  CC      lib/crypto/blake2s-generic.o
  CC      net/sched/sch_fifo.o
  CC      net/core/flow_dissector.o
  CC      security/selinux/ss/symtab.o
  CC      security/min_addr.o
  CC      kernel/rcu/tree.o
  CC      arch/x86/events/core.o
  CC      arch/x86/kernel/kprobes/core.o
  CC      lib/crypto/sha1.o
  CC      arch/x86/kernel/cpu/topology_ext.o
  CC      lib/zlib_deflate/deflate.o
  CC      security/selinux/ss/sidtab.o
  CC      lib/crypto/sha256.o
  CC      arch/x86/events/intel/uncore_nhmex.o
  CC      sound/core/hwdep.o
  CC      crypto/shash.o
  CC      block/blk-mq.o
  CC      net/ethtool/bitset.o
  CC      drivers/pci/pci.o
  CC      arch/x86/video/video-common.o
  CC      arch/x86/kernel/cpu/topology_amd.o
  CC      fs/quota/quota.o
  AR      sound/pci/hda/built-in.a
  CC      kernel/irq/devres.o
  CC      arch/x86/power/hibernate_32.o
  AR      sound/pci/mixart/built-in.a
  AR      sound/pci/nm256/built-in.a
  CC      arch/x86/pci/fixup.o
  CC      kernel/irq/kexec.o
  AR      sound/pci/oxygen/built-in.a
  AR      sound/pci/pcxhr/built-in.a
  AR      sound/pci/riptide/built-in.a
  AR      sound/pci/rme9652/built-in.a
  AR      sound/pci/trident/built-in.a
  AR      sound/pci/ymfpci/built-in.a
  AR      sound/pci/vx222/built-in.a
  AR      sound/pci/built-in.a
  CC      net/sched/cls_cgroup.o
  AR      lib/crypto/built-in.a
  CC      kernel/irq/autoprobe.o
  CC      io_uring/openclose.o
  AR      sound/synth/emux/built-in.a
  AR      sound/synth/built-in.a
  CC      io_uring/sqpoll.o
  CC      sound/core/timer.o
  CC      lib/zlib_deflate/deftree.o
  CC      arch/x86/kernel/cpu/common.o
  CC      drivers/pci/pci-driver.o
  AR      arch/x86/video/built-in.a
  CC      arch/x86/kernel/kprobes/opt.o
  CC      lib/zlib_deflate/deflate_syms.o
  CC      mm/shmem.o
  CC      crypto/akcipher.o
  CC      security/selinux/ss/avtab.o
  CC      arch/x86/kernel/apic/apic_common.o
  AS      arch/x86/power/hibernate_asm_32.o
  CC      arch/x86/power/hibernate.o
  CC      arch/x86/events/intel/uncore_snb.o
  CC      block/blk-mq-tag.o
  CC      kernel/irq/irqdomain.o
  CC      arch/x86/pci/acpi.o
  CC      kernel/rcu/rcu_segcblist.o
  CC      net/ethtool/strset.o
  AR      lib/zlib_deflate/built-in.a
  CC      lib/lzo/lzo1x_compress.o
  CC      kernel/irq/proc.o
  CC      fs/quota/kqid.o
  CC      net/core/sysctl_net_core.o
  CC      arch/x86/kernel/apic/apic_noop.o
  CC      lib/lzo/lzo1x_compress_safe.o
  AR      arch/x86/power/built-in.a
  CC      net/sched/ematch.o
  AR      arch/x86/kernel/kprobes/built-in.a
  CC      crypto/sig.o
  CC      kernel/dma/mapping.o
  AR      sound/usb/misc/built-in.a
  AR      sound/usb/usx2y/built-in.a
  AR      sound/usb/caiaq/built-in.a
  AR      sound/usb/6fire/built-in.a
  CC      fs/quota/netlink.o
  AR      sound/usb/hiface/built-in.a
  CC      arch/x86/pci/legacy.o
  CC      arch/x86/kernel/apic/ipi.o
  AR      sound/usb/bcd2000/built-in.a
  AR      sound/usb/built-in.a
  CC      kernel/dma/direct.o
  CC      arch/x86/events/probe.o
  CC      io_uring/xattr.o
  CC      arch/x86/kernel/cpu/rdrand.o
  CC      sound/core/hrtimer.o
  CC      arch/x86/events/intel/uncore_snbep.o
  CC      drivers/acpi/acpica/dsargs.o
  AR      drivers/acpi/pmic/built-in.a
  CC      block/blk-stat.o
  CC      arch/x86/pci/irq.o
  CC      security/selinux/ss/policydb.o
  CC      arch/x86/kernel/cpu/match.o
  CC      lib/lzo/lzo1x_decompress_safe.o
  CC      lib/lz4/lz4_decompress.o
  CC      kernel/irq/migration.o
  CC      security/security.o
  CC      net/ethtool/linkinfo.o
  CC      drivers/acpi/acpica/dscontrol.o
  CC      sound/core/pcm.o
  CC      arch/x86/events/intel/uncore_discovery.o
  CC      crypto/kpp.o
  CC      arch/x86/kernel/cpu/bugs.o
  AR      lib/lzo/built-in.a
  CC      fs/proc/task_mmu.o
  CC      drivers/pci/search.o
  AR      fs/quota/built-in.a
  CC      arch/x86/kernel/apic/vector.o
  CC      io_uring/nop.o
  CC      kernel/irq/cpuhotplug.o
  AR      net/sched/built-in.a
  CC      net/core/dev.o
  AR      sound/firewire/built-in.a
  CC      security/selinux/ss/services.o
  CC      drivers/acpi/acpica/dsdebug.o
  CC      fs/kernfs/mount.o
  CC      drivers/acpi/dptf/int340x_thermal.o
  CC      block/blk-mq-sysfs.o
  CC      drivers/acpi/acpica/dsfield.o
  CC      arch/x86/pci/common.o
  CC      mm/util.o
  CC      net/ethtool/linkmodes.o
  AR      drivers/acpi/dptf/built-in.a
  LDS     arch/x86/kernel/vmlinux.lds
  ASN.1   crypto/rsapubkey.asn1.[ch]
  ASN.1   crypto/rsaprivkey.asn1.[ch]
  CC      crypto/rsa.o
  CC      crypto/rsa_helper.o
  CC      security/lsm_audit.o
  CC      drivers/pci/rom.o
  CC      sound/core/pcm_native.o
  AR      kernel/rcu/built-in.a
  CC      fs/proc/inode.o
  CC      io_uring/fs.o
  AR      lib/lz4/built-in.a
  CC      lib/zstd/zstd_decompress_module.o
  CC      net/core/dev_api.o
  CC      drivers/acpi/acpica/dsinit.o
  CC      fs/kernfs/inode.o
  CC      net/core/dev_addr_lists.o
  CC      block/blk-mq-cpumap.o
  CC      kernel/irq/pm.o
  CC      lib/zstd/decompress/huf_decompress.o
  CC      drivers/acpi/acpica/dsmethod.o
  CC      kernel/dma/ops_helpers.o
  CC      arch/x86/kernel/cpu/aperfmperf.o
  CC      arch/x86/pci/early.o
  CC      drivers/pci/setup-res.o
  CC      arch/x86/kernel/apic/init.o
  CC      arch/x86/events/intel/cstate.o
  CC      arch/x86/kernel/apic/hw_nmi.o
  CC      io_uring/splice.o
  CC      fs/proc/root.o
  CC      net/ethtool/rss.o
  CC      mm/mmzone.o
  CC      drivers/acpi/acpica/dsmthdat.o
  CC      crypto/rsa-pkcs1pad.o
  CC      fs/kernfs/dir.o
  CC      security/selinux/ss/conditional.o
  AS      arch/x86/kernel/head_32.o
  CC      block/blk-mq-sched.o
  CC      net/netfilter/core.o
  CC      io_uring/sync.o
  CC      kernel/dma/remap.o
  CC      kernel/irq/msi.o
  CC      fs/sysfs/file.o
  CC      arch/x86/pci/bus_numa.o
  CC      arch/x86/kernel/cpu/cpuid-deps.o
  CC      drivers/pci/irq.o
  CC      arch/x86/kernel/apic/io_apic.o
  CC      drivers/acpi/acpica/dsobject.o
  CC      mm/vmstat.o
  CC      drivers/acpi/acpica/dsopcode.o
  CC      fs/sysfs/dir.o
  AR      arch/x86/events/intel/built-in.a
  CC      arch/x86/events/utils.o
  CC      arch/x86/kernel/cpu/umwait.o
  CC      fs/kernfs/file.o
  CC      fs/proc/base.o
  AR      kernel/dma/built-in.a
  CC      lib/xz/xz_dec_syms.o
  CC      drivers/acpi/x86/apple.o
  CC      arch/x86/pci/amd_bus.o
  CC      drivers/acpi/acpica/dspkginit.o
  CC      net/ethtool/linkstate.o
  CC      io_uring/msg_ring.o
  CC      net/core/dst.o
  CC      drivers/pci/vpd.o
  CC      block/ioctl.o
  CC      fs/sysfs/symlink.o
  CC      lib/xz/xz_dec_stream.o
  CC      sound/core/pcm_lib.o
  CC      crypto/rsassa-pkcs1.o
  CC      kernel/irq/affinity.o
  CC      fs/kernfs/symlink.o
  MKCAP   arch/x86/kernel/cpu/capflags.c
  CC      drivers/acpi/acpica/dsutils.o
  CC      arch/x86/events/rapl.o
  CC      drivers/acpi/x86/cmos_rtc.o
  CC      arch/x86/kernel/cpu/powerflags.o
  CC      fs/devpts/inode.o
  CC      net/netfilter/nf_log.o
  CC      lib/zstd/decompress/zstd_ddict.o
  CC      security/selinux/ss/mls.o
  CC      lib/xz/xz_dec_lzma2.o
  AR      arch/x86/pci/built-in.a
  CC      arch/x86/kernel/apic/msi.o
  CC      arch/x86/kernel/apic/probe_32.o
  CC      lib/zstd/decompress/zstd_decompress.o
  CC      kernel/irq/matrix.o
  CC      fs/sysfs/mount.o
  CC      drivers/acpi/acpica/dswexec.o
  CC      io_uring/advise.o
  CC      drivers/pci/setup-bus.o
  CC      mm/backing-dev.o
  CC      net/ethtool/debug.o
  CC      drivers/acpi/x86/lpss.o
  CC      block/genhd.o
  AR      fs/kernfs/built-in.a
  CC      drivers/acpi/x86/s2idle.o
  CC      drivers/acpi/acpica/dswload.o
  CC      drivers/acpi/tables.o
  CC      sound/core/pcm_misc.o
  CC      mm/mm_init.o
  AR      fs/devpts/built-in.a
  CC      arch/x86/events/msr.o
  CC      lib/xz/xz_dec_bcj.o
  CC      fs/sysfs/group.o
  CC      crypto/acompress.o
  AR      arch/x86/kernel/apic/built-in.a
  CC      drivers/acpi/x86/utils.o
  CC      drivers/acpi/acpica/dswload2.o
  CC      net/netfilter/nf_queue.o
  CC      fs/proc/generic.o
  CC      lib/zstd/decompress/zstd_decompress_block.o
  CC      security/selinux/ss/context.o
  CC      io_uring/statx.o
  CC      net/ipv4/netfilter/nf_defrag_ipv4.o
/workspace/kernel/drivers/acpi/tables.c:399:1: error: ‘nonstring’ attribute ignored on objects of type ‘const char[][4]’ [-Werror=attributes]
  399 | static const char table_sigs[][ACPI_NAMESEG_SIZE] __initconst __nonstring = {
      | ^~~~~~
  CC      drivers/pci/vc.o
  CC      net/ethtool/wol.o
  CC      sound/core/pcm_memory.o
  CC      sound/core/memalloc.o
  CC      drivers/acpi/acpica/dswscope.o
cc1: all warnings being treated as errors
  AR      fs/sysfs/built-in.a
make[4]: *** [/workspace/kernel/scripts/Makefile.build:203: drivers/acpi/tables.o] Error 1
make[4]: *** Waiting for unfinished jobs....
  CC      arch/x86/kernel/cpu/topology.o
  CC      security/device_cgroup.o
  CC      net/core/netevent.o
  AR      kernel/irq/built-in.a
  CC      kernel/entry/common.o
  CC      drivers/acpi/x86/blacklist.o
  AR      arch/x86/events/built-in.a
  CC      mm/percpu.o
  AR      lib/xz/built-in.a
  CC      net/core/neighbour.o
  CC      block/ioprio.o
  CC      crypto/scompress.o
  CC      drivers/acpi/acpica/dswstate.o
  CC      fs/proc/array.o
  CC      io_uring/timeout.o
  CC      net/core/rtnetlink.o
  CC      lib/dim/dim.o
  AR      drivers/acpi/x86/built-in.a
  CC      net/ipv4/route.o
  CC      drivers/pci/mmap.o
  CC      drivers/pnp/pnpacpi/core.o
  CC      kernel/module/main.o
  CC      kernel/time/time.o
  CC      drivers/acpi/acpica/evevent.o
  CC      security/selinux/netlabel.o
  CC      sound/core/pcm_timer.o
  CC      net/core/utils.o
  CC      net/netfilter/nf_sockopt.o
  CC      net/ethtool/features.o
  CC      net/ipv4/netfilter/nf_reject_ipv4.o
  CC      lib/dim/net_dim.o
  CC      block/badblocks.o
  CC      kernel/entry/syscall_user_dispatch.o
  CC      fs/proc/fd.o
  CC      drivers/acpi/acpica/evgpe.o
  CC      crypto/algboss.o
  CC      drivers/pnp/pnpacpi/rsparser.o
  CC      drivers/pci/devres.o
  CC      sound/core/seq_device.o
  CC      io_uring/fdinfo.o
  CC      drivers/acpi/acpica/evgpeblk.o
  AR      kernel/entry/built-in.a
  CC      drivers/pci/proc.o
  CC      net/netfilter/utils.o
  CC      kernel/time/timer.o
  CC      block/blk-rq-qos.o
  CC      lib/dim/rdma_dim.o
  CC      net/ethtool/privflags.o
  CC      arch/x86/kernel/head32.o
  CC      drivers/acpi/acpica/evgpeinit.o
  CC      net/ipv4/inetpeer.o
  AR      sound/core/built-in.a
  CC      fs/proc/proc_tty.o
  CC      arch/x86/kernel/cpu/proc.o
  AR      security/selinux/built-in.a
  AR      sound/sparc/built-in.a
  AR      drivers/pnp/pnpacpi/built-in.a
  CC      crypto/testmgr.o
  AR      security/built-in.a
  AR      sound/spi/built-in.a
  CC      drivers/pnp/core.o
  CC      net/ethtool/rings.o
  AR      sound/parisc/built-in.a
  AR      sound/pcmcia/vx/built-in.a
  AR      sound/pcmcia/pdaudiocf/built-in.a
  AR      sound/pcmcia/built-in.a
  AR      sound/mips/built-in.a
  AR      sound/soc/built-in.a
  AR      sound/atmel/built-in.a
  CC      net/ipv4/netfilter/ip_tables.o
  CC      sound/hda/hda_bus_type.o
  AR      lib/dim/built-in.a
  AR      sound/x86/built-in.a
  AR      sound/xen/built-in.a
  CC      arch/x86/kernel/ebda.o
  CC      mm/slab_common.o
  CC      io_uring/cancel.o
  CC      drivers/acpi/acpica/evgpeutil.o
  CC      lib/zstd/zstd_common_module.o
  CC      drivers/pci/pci-sysfs.o
  CC      crypto/cmac.o
  CC      fs/proc/cmdline.o
  CC      drivers/acpi/acpica/evglock.o
  CC      sound/hda/hdac_bus.o
  CC      block/disk-events.o
  CC      drivers/pnp/card.o
  CC      io_uring/waitid.o
  CC      kernel/module/strict_rwx.o
  CC      drivers/pci/slot.o
  CC      kernel/futex/core.o
  CC      net/core/link_watch.o
  CC      kernel/futex/syscalls.o
  CC      drivers/acpi/acpica/evhandler.o
  CC      net/netfilter/nfnetlink.o
  CC      crypto/hmac.o
  CC      fs/proc/consoles.o
  CC      net/ethtool/channels.o
  CC      fs/netfs/buffered_read.o
  CC      fs/ext4/balloc.o
  CC      block/blk-ia-ranges.o
  CC      net/xfrm/xfrm_policy.o
  CC      kernel/module/kmod.o
  CC      drivers/acpi/acpica/evmisc.o
  CC      sound/hda/hdac_device.o
  CC      drivers/pnp/driver.o
  CC      lib/zstd/common/debug.o
  CC      lib/zstd/common/entropy_common.o
  CC      net/netfilter/nfnetlink_log.o
  CC      net/xfrm/xfrm_state.o
  CC      io_uring/register.o
  CC      fs/proc/cpuinfo.o
  CC      net/ipv4/netfilter/iptable_filter.o
  CC      kernel/time/hrtimer.o
  CC      crypto/crypto_null.o
  AR      sound/virtio/built-in.a
  CC      crypto/md5.o
  CC      drivers/acpi/acpica/evregion.o
  CC      lib/zstd/common/error_private.o
  CC      drivers/pci/pci-acpi.o
  CC      lib/zstd/common/fse_decompress.o
  CC      arch/x86/kernel/cpu/feat_ctl.o
  CC      kernel/futex/pi.o
  CC      fs/netfs/buffered_write.o
  CC      drivers/pnp/resource.o
  CC      block/early-lookup.o
  CC      fs/proc/devices.o
  CC      kernel/cgroup/cgroup.o
  CC      kernel/module/tree_lookup.o
  CC      net/ethtool/coalesce.o
  CC      fs/jbd2/transaction.o
  CC      crypto/sha256_generic.o
  CC      drivers/acpi/acpica/evrgnini.o
  CC      io_uring/truncate.o
  CC      arch/x86/kernel/cpu/intel.o
  CC      lib/zstd/common/zstd_common.o
  CC      sound/hda/hdac_sysfs.o
  AR      lib/zstd/built-in.a
  CC      lib/fonts/fonts.o
  CC      mm/compaction.o
  CC      kernel/futex/requeue.o
  CC      net/ipv4/netfilter/iptable_mangle.o
  CC      drivers/acpi/acpica/evsci.o
  CC      kernel/module/kallsyms.o
  CC      fs/proc/interrupts.o
  CC      block/bsg.o
  CC      lib/fonts/font_8x16.o
  CC      crypto/sha512_generic.o
  CC      drivers/pci/iomap.o
  CC      net/core/filter.o
  CC      arch/x86/kernel/cpu/tsx.o
  CC      net/netfilter/nf_conntrack_core.o
  CC      fs/ext4/bitmap.o
  CC      drivers/pnp/manager.o
  CC      fs/netfs/direct_read.o
  CC      drivers/acpi/acpica/evxface.o
  CC      drivers/pnp/support.o
  AR      lib/fonts/built-in.a
  CC      lib/argv_split.o
  CC      io_uring/memmap.o
  CC      kernel/time/sleep_timeout.o
  CC      sound/hda/hdac_regmap.o
  CC      fs/proc/loadavg.o
  CC      kernel/futex/waitwake.o
  CC      net/ethtool/pause.o
  CC      arch/x86/kernel/cpu/intel_epb.o
  CC      drivers/pci/quirks.o
  CC      kernel/module/procfs.o
  CC      block/blk-cgroup.o
  CC      lib/bug.o
  CC      drivers/acpi/acpica/evxfevnt.o
  CC      crypto/sha3_generic.o
  CC      arch/x86/kernel/platform-quirks.o
  CC      fs/ext4/block_validity.o
  CC      drivers/pnp/interface.o
  CC      kernel/time/timekeeping.o
  CC      net/ipv4/netfilter/ipt_REJECT.o
  CC      fs/jbd2/commit.o
  CC      fs/proc/meminfo.o
  CC      arch/x86/kernel/cpu/amd.o
  CC      fs/netfs/direct_write.o
  CC      io_uring/alloc_cache.o
  CC      drivers/acpi/acpica/evxfgpe.o
  CC      sound/hda/hdac_controller.o
  AR      kernel/futex/built-in.a
  CC      mm/show_mem.o
  CC      kernel/module/sysfs.o
  CC      net/unix/af_unix.o
  CC      lib/buildid.o
  CC      drivers/pnp/quirks.o
  CC      net/ethtool/eee.o
  CC      crypto/ecb.o
  CC      drivers/acpi/acpica/evxfregn.o
  CC      fs/ext4/dir.o
  CC      fs/proc/stat.o
  CC      io_uring/io-wq.o
  CC      fs/netfs/iterator.o
  CC      arch/x86/kernel/cpu/hygon.o
  CC [M]  net/ipv4/netfilter/iptable_nat.o
  CC      crypto/cbc.o
  CC      sound/hda/hdac_stream.o
  AR      kernel/module/built-in.a
  CC      net/ethtool/tsinfo.o
  CC      lib/clz_tab.o
  CC      fs/jbd2/recovery.o
  CC      kernel/cgroup/rstat.o
  CC      mm/interval_tree.o
  CC      lib/cmdline.o
  CC      block/blk-ioprio.o
  CC      drivers/pnp/system.o
  CC      drivers/acpi/acpica/exconcat.o
  CC      net/netfilter/nf_conntrack_standalone.o
  CC      lib/cpumask.o
  CC      fs/proc/uptime.o
  CC      kernel/time/ntp.o
  CC      arch/x86/kernel/cpu/centaur.o
  CC      crypto/ctr.o
  CC      arch/x86/kernel/cpu/transmeta.o
  CC      fs/ext4/ext4_jbd2.o
  CC      fs/netfs/locking.o
  AR      drivers/pnp/built-in.a
  CC      fs/ramfs/inode.o
  CC      net/core/sock_diag.o
  CC      drivers/pci/pci-label.o
  CC      crypto/gcm.o
  CC      block/blk-iolatency.o
  CC      lib/ctype.o
  CC      fs/proc/util.o
  CC      net/netfilter/nf_conntrack_expect.o
  CC      lib/dec_and_lock.o
  CC      drivers/acpi/acpica/exconfig.o
  CC      sound/hda/array.o
  CC      mm/list_lru.o
  AR      net/ipv4/netfilter/built-in.a
  CC      net/ipv4/protocol.o
  CC      arch/x86/kernel/cpu/zhaoxin.o
  CC      io_uring/futex.o
  CC      lib/decompress.o
  CC      fs/jbd2/checkpoint.o
  CC      net/ethtool/cabletest.o
  CC      lib/decompress_bunzip2.o
  CC      kernel/time/clocksource.o
  CC      sound/sound_core.o
  CC      kernel/cgroup/namespace.o
  CC      fs/netfs/main.o
  CC      fs/proc/version.o
  CC      arch/x86/kernel/cpu/vortex.o
  CC      drivers/pci/vgaarb.o
  CC      fs/ramfs/file-mmu.o
  CC      net/xfrm/xfrm_hash.o
  CC      sound/hda/hdmi_chmap.o
  CC      net/unix/garbage.o
  CC      drivers/acpi/acpica/exconvrt.o
  CC      fs/ext4/extents.o
  CC      mm/workingset.o
  CC      crypto/ccm.o
  CC      arch/x86/kernel/cpu/perfctr-watchdog.o
  CC      lib/decompress_inflate.o
  CC      net/packet/af_packet.o
  CC      net/netfilter/nf_conntrack_helper.o
  CC      net/ipv6/netfilter/ip6_tables.o
  CC      io_uring/epoll.o
  CC      fs/proc/softirqs.o
  CC      net/ipv4/ip_input.o
  CC      kernel/cgroup/cgroup-v1.o
  CC      net/xfrm/xfrm_input.o
  CC      fs/jbd2/revoke.o
  CC      kernel/time/jiffies.o
  CC      block/blk-iocost.o
  AR      fs/ramfs/built-in.a
  CC      net/ipv6/netfilter/ip6table_filter.o
  CC      kernel/trace/trace_clock.o
  CC      net/ethtool/tunnels.o
  CC      lib/decompress_unlz4.o
  CC      drivers/acpi/acpica/excreate.o
  CC      sound/hda/trace.o
  CC      fs/proc/namespaces.o
  CC      kernel/time/timer_list.o
  AR      drivers/pci/built-in.a
  CC      arch/x86/kernel/cpu/vmware.o
  CC      arch/x86/kernel/process_32.o
  CC      mm/debug.o
  CC      kernel/trace/ring_buffer.o
  CC      net/unix/sysctl_net_unix.o
  CC      crypto/aes_generic.o
  CC      io_uring/napi.o
  CC      lib/decompress_unlzma.o
  CC      drivers/acpi/acpica/exdebug.o
  CC      fs/netfs/misc.o
  CC      fs/jbd2/journal.o
  CC      net/netfilter/nf_conntrack_proto.o
  CC      kernel/time/timeconv.o
  CC      kernel/cgroup/freezer.o
  CC      arch/x86/kernel/cpu/hypervisor.o
  CC      fs/proc/self.o
  CC      net/ipv4/ip_fragment.o
  CC      lib/decompress_unlzo.o
  CC      drivers/acpi/acpica/exdump.o
  CC      sound/last.o
  CC      sound/hda/hdac_component.o
  CC      mm/gup.o
  CC      crypto/authenc.o
  CC      net/ethtool/fec.o
  CC      kernel/time/timecounter.o
  CC      kernel/time/alarmtimer.o
  CC      arch/x86/kernel/cpu/mshyperv.o
  CC      net/xfrm/xfrm_output.o
  CC      net/ethtool/eeprom.o
  CC      drivers/acpi/acpica/exfield.o
  AR      net/dsa/built-in.a
  CC      crypto/authencesn.o
  CC      fs/proc/thread_self.o
  CC      lib/decompress_unxz.o
  CC      net/ipv6/netfilter/ip6table_mangle.o
  AR      net/unix/built-in.a
  CC      net/core/dev_ioctl.o
  CC      kernel/cgroup/legacy_freezer.o
  CC      sound/hda/hdac_i915.o
  CC      drivers/acpi/acpica/exfldio.o
  CC      fs/proc/proc_sysctl.o
  CC      lib/decompress_unzstd.o
  CC      fs/proc/proc_net.o
  CC      kernel/cgroup/pids.o
  CC      fs/netfs/objects.o
  CC      net/netfilter/nf_conntrack_proto_generic.o
  CC      arch/x86/kernel/cpu/debugfs.o
  CC      block/mq-deadline.o
  AR      io_uring/built-in.a
  CC      sound/hda/intel-dsp-config.o
  CC      net/ipv4/ip_forward.o
  CC      drivers/acpi/acpica/exmisc.o
  CC      net/ethtool/stats.o
  CC      kernel/time/posix-timers.o
  CC      kernel/trace/trace.o
  CC      net/core/tso.o
  CC      net/ipv4/ip_options.o
  CC      crypto/lzo.o
  AR      net/packet/built-in.a
  CC      net/ipv6/af_inet6.o
  CC      lib/dump_stack.o
  CC      drivers/acpi/acpica/exmutex.o
  CC      net/xfrm/xfrm_sysctl.o
  CC      kernel/cgroup/rdma.o
  CC      arch/x86/kernel/cpu/bus_lock.o
  CC      net/ipv6/netfilter/nf_defrag_ipv6_hooks.o
  CC      sound/hda/intel-nhlt.o
  CC      kernel/cgroup/cpuset.o
  CC      fs/ext4/extents_status.o
  CC      drivers/acpi/acpica/exnames.o
  CC      fs/netfs/read_collect.o
  CC      mm/mmap_lock.o
  CC      crypto/lzo-rle.o
  CC      net/netfilter/nf_conntrack_proto_tcp.o
  CC      lib/earlycpio.o
  CC      lib/extable.o
  CC      kernel/cgroup/misc.o
  CC      net/core/sock_reuseport.o
  CC      drivers/acpi/acpica/exoparg1.o
  CC      block/kyber-iosched.o
  CC      sound/hda/intel-sdw-acpi.o
  CC      arch/x86/kernel/signal.o
  AR      fs/jbd2/built-in.a
  CC      fs/ext4/file.o
  CC      net/ipv6/netfilter/nf_conntrack_reasm.o
  CC      net/ethtool/phc_vclocks.o
  CC      fs/proc/kcore.o
  CC      arch/x86/kernel/cpu/capflags.o
  AR      arch/x86/kernel/cpu/built-in.a
  CC      kernel/time/posix-cpu-timers.o
  CC      fs/hugetlbfs/inode.o
  CC      net/xfrm/xfrm_replay.o
  CC      net/ipv4/ip_output.o
  CC      lib/flex_proportions.o
  CC      crypto/rng.o
  CC      mm/highmem.o
  CC      kernel/bpf/core.o
  CC      drivers/acpi/acpica/exoparg2.o
  AR      sound/hda/built-in.a
  CC      kernel/time/posix-clock.o
  AR      sound/built-in.a
  CC      net/xfrm/xfrm_device.o
  CC      lib/idr.o
  CC      net/ipv4/ip_sockglue.o
  AR      drivers/amba/built-in.a
  CC      crypto/drbg.o
  CC      fs/netfs/read_pgpriv2.o
  CC      arch/x86/kernel/signal_32.o
  CC      drivers/acpi/acpica/exoparg3.o
  CC      fs/proc/kmsg.o
  CC      fs/netfs/read_retry.o
  CC      lib/iomem_copy.o
  CC      mm/memory.o
  CC      arch/x86/kernel/traps.o
  CC      net/core/fib_notifier.o
  CC      lib/irq_regs.o
  CC      drivers/acpi/acpica/exoparg6.o
  CC      net/ipv4/inet_hashtables.o
  CC      kernel/time/itimer.o
  CC      kernel/cgroup/debug.o
  CC      block/blk-mq-debugfs.o
  CC      block/blk-pm.o
  CC      fs/ext4/fsmap.o
  CC      net/ipv6/netfilter/nf_reject_ipv6.o
  CC      lib/is_single_threaded.o
  CC      net/netfilter/nf_conntrack_proto_udp.o
  CC      fs/proc/page.o
  CC      net/xfrm/xfrm_nat_keepalive.o
  CC      kernel/trace/trace_output.o
  CC      crypto/jitterentropy.o
  CC      net/ethtool/mm.o
  CC      drivers/acpi/acpica/exprep.o
  CC      crypto/jitterentropy-kcapi.o
  AR      fs/hugetlbfs/built-in.a
  CC      fs/fat/cache.o
  CC      net/ipv6/anycast.o
  CC      lib/klist.o
  CC      fs/netfs/read_single.o
  CC      drivers/acpi/acpica/exregion.o
  CC      net/ipv6/netfilter/ip6t_ipv6header.o
  AR      kernel/cgroup/built-in.a
  CC      net/core/xdp.o
  CC      fs/netfs/rolling_buffer.o
  CC      lib/kobject.o
  CC      kernel/time/clockevents.o
  CC      arch/x86/kernel/idt.o
  CC      block/holder.o
  AR      fs/proc/built-in.a
  CC      kernel/trace/trace_seq.o
  CC      crypto/ghash-generic.o
  CC      drivers/acpi/acpica/exresnte.o
  CC      fs/netfs/write_collect.o
  CC      net/netfilter/nf_conntrack_proto_icmp.o
  CC      fs/fat/dir.o
  CC      net/xfrm/xfrm_algo.o
  CC      net/ethtool/module.o
  CC      mm/mincore.o
  CC      lib/kobject_uevent.o
  CC      kernel/time/tick-common.o
  CC      drivers/acpi/acpica/exresolv.o
  CC      lib/logic_pio.o
  CC      crypto/hash_info.o
  CC      arch/x86/kernel/irq.o
  CC      fs/isofs/namei.o
  CC      crypto/rsapubkey.asn1.o
  AR      block/built-in.a
  CC      fs/ext4/fsync.o
  CC      crypto/rsaprivkey.asn1.o
  CC      net/ipv4/inet_timewait_sock.o
  CC      net/ethtool/cmis_fw_update.o
  AR      crypto/built-in.a
  CC      net/xfrm/xfrm_user.o
  CC      kernel/trace/trace_stat.o
  CC      drivers/acpi/acpica/exresop.o
  CC      net/netfilter/nf_conntrack_extend.o
  CC      kernel/events/core.o
  CC      fs/fat/fatent.o
  CC      lib/maple_tree.o
  CC      net/ipv6/netfilter/ip6t_REJECT.o
  CC      drivers/acpi/acpica/exserial.o
  AR      drivers/clk/actions/built-in.a
  AR      drivers/clk/analogbits/built-in.a
  AR      drivers/clk/bcm/built-in.a
  AR      drivers/clk/imgtec/built-in.a
  AR      drivers/clk/imx/built-in.a
  AR      drivers/clk/ingenic/built-in.a
  AR      drivers/clk/mediatek/built-in.a
  CC      fs/netfs/write_issue.o
  AR      drivers/clk/microchip/built-in.a
  CC      net/core/flow_offload.o
  AR      drivers/clk/mstar/built-in.a
  CC      fs/isofs/inode.o
  AR      drivers/clk/mvebu/built-in.a
  AR      drivers/clk/ralink/built-in.a
  AR      drivers/clk/renesas/built-in.a
  AR      drivers/clk/socfpga/built-in.a
  CC      kernel/trace/trace_printk.o
  AR      drivers/clk/sophgo/built-in.a
  AR      drivers/clk/sprd/built-in.a
  AR      drivers/clk/starfive/built-in.a
  AR      drivers/clk/sunxi-ng/built-in.a
  AR      drivers/clk/ti/built-in.a
  AR      drivers/clk/versatile/built-in.a
  AR      drivers/clk/xilinx/built-in.a
  AR      drivers/clk/built-in.a
  CC      net/ethtool/cmis_cdb.o
  CC      fs/ext4/hash.o
  CC      drivers/acpi/acpica/exstore.o
  CC      fs/nfs/client.o
  CC      net/sunrpc/auth_gss/auth_gss.o
  CC      kernel/events/ring_buffer.o
  CC      arch/x86/kernel/irq_32.o
  CC      kernel/time/tick-broadcast.o
  CC      net/sunrpc/clnt.o
  CC      net/netfilter/nf_conntrack_acct.o
  CC      net/ipv4/inet_connection_sock.o
  CC      fs/fat/file.o
  CC      drivers/acpi/acpica/exstoren.o
  CC      net/ipv6/ip6_output.o
  CC      kernel/trace/pid_list.o
  CC      arch/x86/kernel/dumpstack_32.o
  CC      fs/ext4/ialloc.o
  CC      drivers/acpi/acpica/exstorob.o
  CC      kernel/time/tick-broadcast-hrtimer.o
  CC      net/sunrpc/xprt.o
  AR      net/ipv6/netfilter/built-in.a
  CC      net/core/gro.o
  AR      kernel/bpf/built-in.a
  CC      fs/exportfs/expfs.o
  CC      mm/mlock.o
  CC      kernel/events/callchain.o
  CC      fs/netfs/write_retry.o
  CC      net/sunrpc/auth_gss/gss_mech_switch.o
  CC      fs/isofs/dir.o
  CC      lib/memcat_p.o
  CC      drivers/acpi/acpica/exsystem.o
  CC      kernel/time/tick-oneshot.o
  CC      net/netfilter/nf_conntrack_seqadj.o
  CC      net/ethtool/pse-pd.o
  CC      fs/fat/inode.o
  CC      arch/x86/kernel/time.o
  CC      arch/x86/kernel/ioport.o
  CC      drivers/acpi/acpica/extrace.o
  CC      kernel/trace/trace_sched_switch.o
  AR      net/xfrm/built-in.a
  CC      fs/nfs/dir.o
  CC      drivers/dma/dw/core.o
  CC      kernel/time/tick-sched.o
  CC      fs/isofs/util.o
  AR      net/wireless/tests/built-in.a
  CC      net/wireless/core.o
  AR      fs/netfs/built-in.a
  CC      drivers/dma/dw/dw.o
  CC      fs/nfs/file.o
  CC      drivers/acpi/acpica/exutils.o
  AR      fs/exportfs/built-in.a
  CC      kernel/trace/trace_nop.o
  CC      mm/mmap.o
  CC      net/ipv4/tcp.o
  CC      arch/x86/kernel/dumpstack.o
  CC      net/sunrpc/auth_gss/svcauth_gss.o
  CC      fs/isofs/rock.o
  CC      drivers/acpi/acpica/hwacpi.o
  CC      net/ipv6/ip6_input.o
  CC      net/core/netdev-genl.o
  CC      net/netfilter/nf_conntrack_proto_icmpv6.o
  CC      net/ethtool/plca.o
  CC      kernel/fork.o
  CC      drivers/acpi/acpica/hwesleep.o
  CC      kernel/trace/blktrace.o
  CC      fs/fat/misc.o
  CC      kernel/time/timer_migration.o
  CC      lib/nmi_backtrace.o
  CC      drivers/dma/dw/idma32.o
  CC      fs/ext4/indirect.o
  CC      arch/x86/kernel/nmi.o
  AR      drivers/soc/apple/built-in.a
  AR      drivers/soc/aspeed/built-in.a
  AR      drivers/soc/bcm/built-in.a
  CC      drivers/acpi/acpica/hwgpe.o
  AR      drivers/soc/fsl/built-in.a
  AR      drivers/soc/fujitsu/built-in.a
  AR      drivers/soc/hisilicon/built-in.a
  AR      drivers/soc/imx/built-in.a
  AR      drivers/soc/ixp4xx/built-in.a
  AR      drivers/soc/loongson/built-in.a
  CC      drivers/virtio/virtio.o
  AR      drivers/soc/mediatek/built-in.a
  CC      kernel/events/hw_breakpoint.o
  AR      drivers/soc/microchip/built-in.a
  CC      fs/isofs/export.o
  AR      drivers/soc/nuvoton/built-in.a
  AR      drivers/soc/pxa/built-in.a
  AR      drivers/soc/amlogic/built-in.a
  AR      drivers/soc/qcom/built-in.a
  AR      drivers/soc/renesas/built-in.a
  AR      drivers/soc/rockchip/built-in.a
  AR      drivers/soc/sunxi/built-in.a
  AR      drivers/soc/ti/built-in.a
  AR      drivers/soc/versatile/built-in.a
  AR      drivers/soc/xilinx/built-in.a
  AR      drivers/soc/built-in.a
  CC      drivers/virtio/virtio_ring.o
  CC      net/wireless/sysfs.o
  CC      drivers/acpi/acpica/hwregs.o
  CC      fs/fat/nfs.o
  CC      net/ethtool/phy.o
  CC      mm/mmu_gather.o
  AR      net/mac80211/tests/built-in.a
  CC      net/mac80211/main.o
  CC      fs/isofs/joliet.o
  CC      drivers/dma/dw/acpi.o
  CC      net/ipv6/addrconf.o
  CC      arch/x86/kernel/ldt.o
  CC      net/core/netdev-genl-gen.o
  CC      drivers/acpi/acpica/hwsleep.o
  CC      net/netfilter/nf_conntrack_netlink.o
  CC      drivers/dma/hsu/hsu.o
  CC      net/sunrpc/auth_gss/gss_rpc_upcall.o
  CC      kernel/trace/trace_events.o
  CC      net/mac80211/status.o
  CC      drivers/acpi/acpica/hwvalid.o
  CC      fs/fat/namei_vfat.o
  CC      kernel/time/vsyscall.o
  CC      fs/nfs/getroot.o
  CC      fs/isofs/compress.o
  CC      mm/mprotect.o
  CC      lib/objpool.o
  CC      net/ethtool/tsconfig.o
  CC      fs/ext4/inline.o
  CC      net/core/gso.o
  CC      drivers/acpi/acpica/hwxface.o
  CC      arch/x86/kernel/setup.o
  CC      kernel/time/timekeeping_debug.o
  AR      drivers/dma/hsu/built-in.a
  CC      net/mac80211/driver-ops.o
  CC      net/ipv4/tcp_input.o
  AR      drivers/dma/dw/built-in.a
  AR      drivers/dma/idxd/built-in.a
  AR      drivers/dma/amd/built-in.a
  AR      drivers/dma/mediatek/built-in.a
  CC      drivers/virtio/virtio_anchor.o
  AR      drivers/dma/qcom/built-in.a
  AR      drivers/dma/stm32/built-in.a
  AR      drivers/dma/ti/built-in.a
  AR      drivers/dma/xilinx/built-in.a
  CC      drivers/dma/dmaengine.o
  CC      lib/plist.o
  CC      drivers/acpi/acpica/hwxfsleep.o
  CC      lib/radix-tree.o
  CC      net/sunrpc/auth_gss/gss_rpc_xdr.o
  AR      fs/isofs/built-in.a
  CC      net/sunrpc/socklib.o
  CC      drivers/tty/vt/vt_ioctl.o
  CC      fs/nfs/inode.o
  CC      kernel/time/namespace.o
  CC      mm/mremap.o
  CC      drivers/virtio/virtio_pci_modern_dev.o
  CC      fs/fat/namei_msdos.o
  CC      kernel/events/uprobes.o
  CC      drivers/acpi/acpica/hwpci.o
  AR      net/ethtool/built-in.a
  CC      net/core/net-sysfs.o
  CC      drivers/tty/hvc/hvc_console.o
  CC      arch/x86/kernel/x86_init.o
  CC      net/sunrpc/xprtsock.o
  CC      net/wireless/radiotap.o
  CC      net/netfilter/nf_conntrack_ftp.o
  CC      lib/ratelimit.o
  CC      kernel/trace/trace_export.o
  AR      kernel/time/built-in.a
  CC      net/ipv6/addrlabel.o
  CC      drivers/dma/virt-dma.o
  CC      lib/rbtree.o
  CC      fs/ext4/inode.o
  CC      fs/lockd/clntlock.o
  CC      drivers/acpi/acpica/nsaccess.o
  CC      net/sunrpc/auth_gss/trace.o
  CC      drivers/tty/vt/vc_screen.o
  CC      drivers/char/hw_random/core.o
  AR      fs/fat/built-in.a
  CC      arch/x86/kernel/i8259.o
  CC      drivers/virtio/virtio_pci_legacy_dev.o
  CC      drivers/char/agp/backend.o
  AR      drivers/tty/hvc/built-in.a
  CC      drivers/tty/vt/selection.o
  CC      mm/msync.o
  CC      lib/seq_buf.o
  CC      drivers/char/hw_random/intel-rng.o
  CC      drivers/dma/acpi-dma.o
  CC      kernel/trace/trace_event_perf.o
  CC      drivers/acpi/acpica/nsalloc.o
  CC      arch/x86/kernel/irqinit.o
  CC      drivers/virtio/virtio_pci_modern.o
  CC      net/mac80211/sta_info.o
  CC      net/netlabel/netlabel_user.o
  CC      net/wireless/util.o
  CC      drivers/tty/vt/keyboard.o
  CC      net/core/hotdata.o
  CC      lib/siphash.o
  CC      mm/page_vma_mapped.o
  CC      drivers/char/hw_random/amd-rng.o
  CC      kernel/trace/trace_events_filter.o
  CC      drivers/acpi/acpica/nsarguments.o
  CC      net/netfilter/nf_conntrack_irc.o
  AR      kernel/events/built-in.a
  CC      fs/lockd/clntproc.o
  CC      fs/ext4/ioctl.o
  AR      drivers/dma/built-in.a
  CC      net/core/netdev_rx_queue.o
  CC      fs/nls/nls_base.o
  CC      drivers/char/agp/generic.o
  CC      lib/string.o
  CC      drivers/acpi/acpica/nsconvert.o
  CC      net/sunrpc/auth_gss/gss_krb5_mech.o
  CC      arch/x86/kernel/jump_label.o
  CC      lib/timerqueue.o
  CC      fs/nfs/super.o
  CC      drivers/char/hw_random/geode-rng.o
  CC      drivers/virtio/virtio_pci_common.o
  CC      lib/union_find.o
  CC      fs/nls/nls_cp437.o
  CC      mm/pagewalk.o
  CC      lib/vsprintf.o
  CC      drivers/acpi/acpica/nsdump.o
  CC      net/netlabel/netlabel_kapi.o
  CC      net/core/net-procfs.o
  CC      fs/nls/nls_ascii.o
  CC      arch/x86/kernel/irq_work.o
  CC      drivers/acpi/acpica/nseval.o
  CC      net/netfilter/nf_conntrack_sip.o
  CC      drivers/tty/vt/vt.o
  CC      net/rfkill/core.o
  CC      drivers/char/hw_random/via-rng.o
  CC      drivers/char/agp/isoch.o
  CC      net/rfkill/input.o
  CC      fs/lockd/clntxdr.o
  CC      fs/nls/nls_iso8859-1.o
  CC      kernel/trace/trace_events_trigger.o
  CC      fs/nls/nls_utf8.o
  CC      drivers/acpi/acpica/nsinit.o
  CC      drivers/virtio/virtio_pci_legacy.o
  CC      net/sunrpc/auth_gss/gss_krb5_seal.o
  AR      drivers/char/hw_random/built-in.a
  CC      net/ipv6/route.o
  CC      net/wireless/reg.o
  CC      net/ipv4/tcp_output.o
  CC      mm/pgtable-generic.o
  CC      drivers/tty/serial/8250/8250_core.o
  AR      fs/nls/built-in.a
  CC      drivers/tty/serial/serial_core.o
  CC      fs/lockd/host.o
  CC      drivers/acpi/acpica/nsload.o
  CC      drivers/acpi/acpica/nsnames.o
  CC      net/core/netpoll.o
  CC      fs/nfs/io.o
  CC      drivers/char/agp/amd64-agp.o
  CC      arch/x86/kernel/probe_roms.o
  AR      net/rfkill/built-in.a
  CC      lib/win_minmax.o
  CC      net/netlabel/netlabel_domainhash.o
  CC      drivers/virtio/virtio_pci_admin_legacy_io.o
  CC      net/netfilter/nf_nat_core.o
  CC      drivers/acpi/acpica/nsobject.o
  CC      net/mac80211/wep.o
  COPY    drivers/tty/vt/defkeymap.c
  CC      net/sunrpc/auth_gss/gss_krb5_unseal.o
  CC      mm/rmap.o
  CC      kernel/trace/trace_eprobe.o
  CC      arch/x86/kernel/sys_ia32.o
  CC      drivers/acpi/acpica/nsparse.o
  CC      drivers/tty/serial/8250/8250_platform.o
  CC      drivers/char/agp/intel-agp.o
  CC      drivers/virtio/virtio_input.o
  CC      fs/ext4/mballoc.o
  CC      net/sunrpc/sched.o
  CC      fs/nfs/direct.o
  CC      net/ipv4/tcp_timer.o
  CC      fs/lockd/svc.o
  CC      drivers/acpi/acpica/nspredef.o
  CC      net/9p/mod.o
  CC      net/9p/client.o
  CC      lib/xarray.o
  CC      net/netlabel/netlabel_addrlist.o
  CC      drivers/tty/vt/consolemap.o
  CC      net/core/fib_rules.o
  CC      arch/x86/kernel/ksysfs.o
  CC      drivers/acpi/acpica/nsprepkg.o
  CC      drivers/tty/serial/8250/8250_pnp.o
  CC      drivers/virtio/virtio_dma_buf.o
  CC      drivers/char/agp/intel-gtt.o
  CC      net/mac80211/aead_api.o
  CC      net/sunrpc/auth_gss/gss_krb5_wrap.o
  CC      net/netfilter/nf_nat_proto.o
  CC      kernel/trace/trace_kprobe.o
  CC      drivers/acpi/acpica/nsrepair.o
  CC      fs/lockd/svclock.o
  CC      arch/x86/kernel/bootflag.o
  AR      drivers/tty/ipwireless/built-in.a
  AR      drivers/virtio/built-in.a
  CC      lib/lockref.o
  CC      net/ipv6/ip6_fib.o
  CC      net/mac80211/wpa.o
  CC      drivers/tty/serial/8250/8250_rsa.o
  CC      kernel/exec_domain.o
  HOSTCC  drivers/tty/vt/conmakehash
  CC      drivers/acpi/acpica/nsrepair2.o
  CC      mm/vmalloc.o
  CC      drivers/tty/vt/defkeymap.o
  CC      fs/ext4/migrate.o
  CC      net/ipv4/tcp_ipv4.o
  CC      net/netlabel/netlabel_mgmt.o
  AR      drivers/char/agp/built-in.a
  CC      drivers/char/mem.o
  CC      lib/bcd.o
  CC      lib/sort.o
  CC      arch/x86/kernel/e820.o
  CONMK   drivers/tty/vt/consolemap_deftbl.c
  CC      drivers/tty/vt/consolemap_deftbl.o
  AR      drivers/tty/vt/built-in.a
  CC      net/ipv4/tcp_minisocks.o
  CC      net/sunrpc/auth_gss/gss_krb5_crypto.o
  CC      drivers/acpi/acpica/nssearch.o
  CC      drivers/tty/serial/8250/8250_port.o
  CC      net/netlabel/netlabel_unlabeled.o
  CC      lib/parser.o
  CC      fs/nfs/pagelist.o
  CC      net/9p/error.o
  CC      mm/vma.o
  CC      net/core/net-traces.o
  CC      drivers/acpi/acpica/nsutils.o
  CC      lib/debug_locks.o
  CC      net/netfilter/nf_nat_helper.o
  CC      net/9p/protocol.o
  CC      fs/lockd/svcshare.o
  CC      lib/random32.o
  CC      drivers/char/random.o
  CC      arch/x86/kernel/pci-dma.o
  CC      fs/nfs/read.o
  CC      net/mac80211/scan.o
  CC      drivers/acpi/acpica/nswalk.o
  CC      net/core/selftests.o
  CC      kernel/trace/error_report-traces.o
  CC      net/sunrpc/auth_gss/gss_krb5_keys.o
  CC      lib/bust_spinlocks.o
  CC      drivers/acpi/acpica/nsxfeval.o
  CC      net/ipv6/ipv6_sockglue.o
  CC      arch/x86/kernel/quirks.o
  CC      net/9p/trans_common.o
  CC      net/wireless/scan.o
  CC      net/netlabel/netlabel_cipso_v4.o
  CC      drivers/tty/serial/serial_base_bus.o
  CC      drivers/tty/tty_io.o
  CC      lib/kasprintf.o
  CC      drivers/acpi/acpica/nsxfname.o
  CC      fs/lockd/svcproc.o
  CC      kernel/trace/power-traces.o
  CC      drivers/tty/serial/8250/8250_dma.o
  CC      net/dns_resolver/dns_key.o
  CC      net/9p/trans_fd.o
  CC      lib/bitmap.o
  CC      drivers/char/misc.o
  CC      drivers/acpi/acpica/nsxfobj.o
  CC      net/sunrpc/auth.o
  CC      arch/x86/kernel/kdebugfs.o
  CC      net/dns_resolver/dns_query.o
  AR      net/sunrpc/auth_gss/built-in.a
  CC      net/9p/trans_virtio.o
  CC      fs/ext4/mmp.o
  CC      mm/process_vm_access.o
  CC      drivers/acpi/acpica/psargs.o
  CC      net/ipv4/tcp_cong.o
  CC      fs/nfs/symlink.o
  CC      drivers/char/virtio_console.o
  CC      drivers/tty/serial/serial_ctrl.o
  CC      drivers/tty/serial/8250/8250_dwlib.o
  CC      arch/x86/kernel/alternative.o
  CC      lib/scatterlist.o
  CC      net/netlabel/netlabel_calipso.o
  CC      drivers/tty/serial/serial_port.o
  CC      net/netfilter/nf_nat_masquerade.o
  AR      net/dns_resolver/built-in.a
  CC      fs/lockd/svcsubs.o
  CC      drivers/tty/serial/earlycon.o
  CC      drivers/acpi/acpica/psloop.o
  CC      fs/ext4/move_extent.o
  CC      net/ipv6/ndisc.o
  CC      net/mac80211/offchannel.o
  CC      mm/page_alloc.o
  CC      net/core/ptp_classifier.o
  CC      net/wireless/nl80211.o
  CC      drivers/tty/serial/8250/8250_pcilib.o
  CC      drivers/acpi/acpica/psobject.o
  CC      kernel/trace/rpm-traces.o
  CC      kernel/panic.o
  CC      fs/nfs/unlink.o
  AR      net/9p/built-in.a
  CC      kernel/cpu.o
  CC      mm/page_frag_cache.o
  CC      mm/init-mm.o
  CC      drivers/acpi/acpica/psopcode.o
  CC      lib/list_sort.o
  AR      net/netlabel/built-in.a
  CC      drivers/tty/serial/8250/8250_early.o
  CC      net/ipv4/tcp_metrics.o
  CC      arch/x86/kernel/i8253.o
  CC      fs/lockd/mon.o
  CC      lib/uuid.o
  CC      drivers/char/hpet.o
  CC      drivers/char/nvram.o
  CC      fs/ext4/namei.o
  CC      lib/iov_iter.o
  CC      lib/clz_ctz.o
  CC      drivers/acpi/acpica/psopinfo.o
  CC      drivers/acpi/acpica/psparse.o
  CC      net/sunrpc/auth_null.o
  CC      net/sunrpc/auth_tls.o
  CC      net/ipv4/tcp_fastopen.o
  CC      net/netfilter/nf_nat_ftp.o
  CC      kernel/trace/trace_dynevent.o
  AR      drivers/iommu/amd/built-in.a
  AR      drivers/iommu/intel/built-in.a
  AR      drivers/iommu/arm/arm-smmu/built-in.a
  AR      drivers/iommu/arm/arm-smmu-v3/built-in.a
  AR      drivers/iommu/arm/built-in.a
  AR      drivers/iommu/iommufd/built-in.a
  CC      arch/x86/kernel/hw_breakpoint.o
  AR      drivers/iommu/riscv/built-in.a
  CC      drivers/iommu/iommu.o
  CC      net/wireless/mlme.o
  CC      drivers/tty/serial/8250/8250_exar.o
  CC      drivers/acpi/acpica/psscope.o
  CC      net/mac80211/ht.o
  AR      drivers/char/built-in.a
  AR      fs/unicode/built-in.a
  CC      fs/nfs/write.o
  CC      drivers/acpi/acpica/pstree.o
  CC      net/sunrpc/auth_unix.o
  CC      arch/x86/kernel/tsc.o
  CC      net/mac80211/agg-tx.o
  CC      fs/lockd/trace.o
  CC      kernel/trace/trace_probe.o
  CC      net/ipv6/udp.o
  CC      net/ipv4/tcp_rate.o
  CC      fs/autofs/init.o
  AR      drivers/gpu/host1x/built-in.a
  CC      drivers/acpi/acpica/psutils.o
  CC      net/core/netprio_cgroup.o
  CC      net/netfilter/nf_nat_irc.o
  CC      drivers/tty/serial/8250/8250_lpss.o
  CC      net/sunrpc/svc.o
  AR      drivers/gpu/drm/tests/built-in.a
  AR      drivers/gpu/drm/arm/built-in.a
  AR      drivers/gpu/drm/clients/built-in.a
  CC      drivers/gpu/drm/display/drm_display_helper_mod.o
  AR      drivers/gpu/vga/built-in.a
  CC      fs/lockd/xdr.o
  CC      drivers/acpi/acpica/pswalk.o
  CC      drivers/gpu/drm/display/drm_dp_dual_mode_helper.o
  CC      fs/autofs/inode.o
  CC      drivers/iommu/iommu-traces.o
  CC      lib/bsearch.o
  CC      drivers/tty/n_tty.o
  CC      arch/x86/kernel/tsc_msr.o
  CC      drivers/acpi/acpica/psxface.o
  CC      drivers/tty/serial/8250/8250_mid.o
  CC      fs/9p/vfs_super.o
  CC      mm/memblock.o
  CC      net/wireless/ibss.o
  CC      net/ipv4/tcp_recovery.o
  CC      net/core/netclassid_cgroup.o
  CC      net/netfilter/nf_nat_sip.o
  CC      drivers/acpi/acpica/rsaddr.o
  CC      arch/x86/kernel/io_delay.o
  CC      kernel/trace/trace_uprobe.o
  CC      drivers/gpu/drm/display/drm_dp_helper.o
  CC      fs/autofs/root.o
  CC      fs/ext4/page-io.o
  CC      drivers/acpi/acpica/rscalc.o
  CC      fs/lockd/netlink.o
  CC      arch/x86/kernel/rtc.o
  CC      drivers/tty/serial/8250/8250_pci.o
  CC      fs/9p/vfs_inode.o
  CC      fs/ext4/readpage.o
  CC      drivers/iommu/iommu-sysfs.o
  CC      net/netfilter/x_tables.o
  CC      net/mac80211/agg-rx.o
  CC      net/ipv4/tcp_ulp.o
  CC      fs/nfs/namespace.o
  CC      lib/find_bit.o
  CC      drivers/acpi/acpica/rscreate.o
  CC      net/core/dst_cache.o
  CC      net/ipv4/tcp_offload.o
  CC      net/ipv6/udplite.o
  CC      arch/x86/kernel/resource.o
  CC      fs/lockd/clnt4xdr.o
  CC      drivers/iommu/dma-iommu.o
  CC      fs/autofs/symlink.o
  CC      drivers/tty/tty_ioctl.o
  CC      net/sunrpc/svcsock.o
  CC      drivers/acpi/acpica/rsdumpinfo.o
  CC      mm/slub.o
  AS      arch/x86/kernel/irqflags.o
  CC      lib/llist.o
  CC      arch/x86/kernel/static_call.o
  CC      net/mac80211/vht.o
  CC      fs/nfs/mount_clnt.o
  CC      lib/lwq.o
  CC      fs/ext4/resize.o
  CC      drivers/acpi/acpica/rsinfo.o
  CC      fs/9p/vfs_inode_dotl.o
  CC      lib/memweight.o
  CC      arch/x86/kernel/process.o
  CC      lib/kfifo.o
  CC      fs/autofs/waitq.o
  CC      drivers/gpu/drm/display/drm_dp_mst_topology.o
  CC      drivers/acpi/acpica/rsio.o
  CC      net/handshake/alert.o
  CC      kernel/trace/rethook.o
  CC      drivers/tty/serial/8250/8250_pericom.o
  AR      fs/hostfs/built-in.a
  CC      fs/nfs/nfstrace.o
  CC      net/ipv6/raw.o
  CC      net/core/gro_cells.o
  CC      net/mac80211/he.o
  CC      drivers/connector/cn_queue.o
  CC      fs/lockd/xdr4.o
  CC      drivers/acpi/acpica/rsirq.o
  CC      net/ipv4/tcp_plb.o
  CC      fs/9p/vfs_addr.o
  CC      drivers/acpi/acpica/rslist.o
  CC      lib/percpu-refcount.o
  CC      net/mac80211/s1g.o
  AR      kernel/trace/built-in.a
  CC      kernel/exit.o
  AR      drivers/tty/serial/8250/built-in.a
  CC      fs/autofs/expire.o
  AR      drivers/tty/serial/built-in.a
  CC      drivers/iommu/iova.o
  CC      drivers/tty/tty_ldisc.o
  CC      mm/madvise.o
  CC      arch/x86/kernel/ptrace.o
  CC      net/core/failover.o
  CC      drivers/acpi/acpica/rsmemory.o
  CC      drivers/connector/connector.o
  CC      net/handshake/genl.o
  CC      net/netfilter/xt_tcpudp.o
  CC      fs/9p/vfs_file.o
  CC      net/mac80211/ibss.o
  CC      lib/rhashtable.o
  CC      fs/lockd/svc4proc.o
  CC      drivers/tty/tty_buffer.o
  CC      fs/autofs/dev-ioctl.o
  CC      net/sunrpc/svcauth.o
  CC      net/ipv4/datagram.o
  CC      fs/ext4/super.o
  CC      drivers/acpi/acpica/rsmisc.o
  CC      net/ipv6/icmp.o
  CC      net/handshake/netlink.o
  CC      net/mac80211/iface.o
  CC      arch/x86/kernel/tls.o
  CC      fs/9p/vfs_dir.o
  AR      net/core/built-in.a
  CC      net/sunrpc/svcauth_unix.o
  AR      drivers/iommu/built-in.a
  CC      net/wireless/sme.o
  CC      drivers/tty/tty_port.o
  CC      drivers/connector/cn_proc.o
  CC      kernel/softirq.o
  AR      fs/autofs/built-in.a
  CC      mm/page_io.o
  CC      lib/base64.o
  CC      fs/lockd/procfs.o
  CC      drivers/acpi/acpica/rsserial.o
  CC      net/netfilter/xt_CONNSECMARK.o
  CC      lib/once.o
  CC      drivers/gpu/drm/ttm/ttm_tt.o
  CC      net/ipv4/raw.o
  CC      fs/9p/vfs_dentry.o
  CC      drivers/acpi/acpica/rsutils.o
  CC      arch/x86/kernel/step.o
  CC      fs/ext4/symlink.o
  CC      drivers/tty/tty_mutex.o
  CC      drivers/gpu/drm/ttm/ttm_bo.o
  CC      lib/refcount.o
  CC      net/handshake/request.o
  AR      fs/lockd/built-in.a
  CC      drivers/gpu/drm/display/drm_dsc_helper.o
  CC      net/ipv6/mcast.o
  CC      lib/rcuref.o
  CC      drivers/gpu/drm/i915/i915_config.o
  CC      drivers/acpi/acpica/rsxface.o
  CC      mm/swap_state.o
  CC      lib/usercopy.o
  CC      fs/9p/v9fs.o
  CC      drivers/gpu/drm/i915/i915_driver.o
  CC      drivers/tty/tty_ldsem.o
  CC      arch/x86/kernel/i8237.o
  CC      net/ipv6/reassembly.o
  CC      kernel/resource.o
  CC      net/netfilter/xt_NFLOG.o
  CC      net/devres.o
  AR      drivers/connector/built-in.a
  CC      drivers/acpi/acpica/tbdata.o
  CC      lib/errseq.o
  CC      fs/9p/fid.o
  CC      drivers/base/power/sysfs.o
  CC      lib/bucket_locks.o
  CC      fs/nfs/export.o
  CC      arch/x86/kernel/stacktrace.o
  CC      drivers/gpu/drm/ttm/ttm_bo_util.o
  CC      drivers/base/firmware_loader/builtin/main.o
  CC      drivers/gpu/drm/display/drm_hdcp_helper.o
  CC      net/sunrpc/addr.o
  CC      drivers/tty/tty_baudrate.o
  CC      net/ipv4/udp.o
  CC      drivers/acpi/acpica/tbfadt.o
  AR      drivers/base/firmware_loader/builtin/built-in.a
  CC      drivers/base/firmware_loader/main.o
  CC      drivers/base/power/generic_ops.o
  CC      net/handshake/tlshd.o
  CC      lib/generic-radix-tree.o
  CC      drivers/acpi/acpica/tbfind.o
  CC      fs/9p/xattr.o
  CC      arch/x86/kernel/reboot.o
  CC      mm/swapfile.o
  CC      net/netfilter/xt_SECMARK.o
  CC      net/mac80211/link.o
  CC      net/wireless/chan.o
  CC      drivers/tty/tty_jobctrl.o
  CC      fs/debugfs/inode.o
  CC      kernel/sysctl.o
  CC      drivers/base/power/common.o
  CC      drivers/gpu/drm/display/drm_hdmi_helper.o
  CC      drivers/acpi/acpica/tbinstal.o
  CC      lib/bitmap-str.o
  CC      drivers/block/loop.o
  CC      drivers/gpu/drm/ttm/ttm_bo_vm.o
  CC      lib/string_helpers.o
  CC      drivers/gpu/drm/i915/i915_drm_client.o
  AR      fs/9p/built-in.a
  CC      drivers/gpu/drm/display/drm_scdc_helper.o
  CC      net/sunrpc/rpcb_clnt.o
  CC      drivers/acpi/acpica/tbprint.o
  AR      drivers/base/firmware_loader/built-in.a
  CC      net/sunrpc/timer.o
  CC      fs/nfs/sysfs.o
  CC      arch/x86/kernel/msr.o
  CC      drivers/base/power/qos.o
  CC      drivers/tty/n_null.o
  CC      net/handshake/trace.o
  CC      net/socket.o
  CC      net/netfilter/xt_TCPMSS.o
  AR      drivers/gpu/drm/renesas/rcar-du/built-in.a
  AR      drivers/gpu/drm/renesas/rz-du/built-in.a
  AR      drivers/gpu/drm/renesas/built-in.a
  CC      net/mac80211/rate.o
  CC      drivers/acpi/acpica/tbutils.o
  CC      drivers/gpu/drm/ttm/ttm_module.o
  CC      fs/debugfs/file.o
  CC      drivers/tty/pty.o
  CC      arch/x86/kernel/cpuid.o
  CC      drivers/acpi/acpica/tbxface.o
  CC      lib/hexdump.o
  AR      drivers/gpu/drm/display/built-in.a
  CC      net/wireless/ethtool.o
  CC      drivers/gpu/drm/ttm/ttm_execbuf_util.o
  CC      kernel/capability.o
  CC      lib/kstrtox.o
  CC      drivers/block/virtio_blk.o
  CC      net/ipv6/tcp_ipv6.o
  CC      drivers/base/power/runtime.o
  CC      drivers/gpu/drm/i915/i915_getparam.o
  CC      fs/nfs/fs_context.o
  CC      drivers/acpi/acpica/tbxfload.o
  CC      arch/x86/kernel/early-quirks.o
  CC      mm/dmapool.o
  CC      drivers/tty/tty_audit.o
  CC      drivers/misc/eeprom/eeprom_93cx6.o
  CC      lib/iomap.o
  CC      arch/x86/kernel/smp.o
  AR      net/handshake/built-in.a
  CC      net/sunrpc/xdr.o
  CC      drivers/gpu/drm/ttm/ttm_range_manager.o
  CC      net/netfilter/xt_conntrack.o
  AR      fs/debugfs/built-in.a
  CC      fs/nfs/nfsroot.o
  CC      drivers/acpi/acpica/tbxfroot.o
  AR      drivers/gpu/drm/omapdrm/built-in.a
  CC      kernel/ptrace.o
  CC      kernel/user.o
  CC      net/ipv4/udplite.o
  AR      drivers/misc/eeprom/built-in.a
  AR      drivers/misc/cb710/built-in.a
  AR      drivers/misc/lis3lv02d/built-in.a
  AR      drivers/misc/cardreader/built-in.a
  CC      lib/iomap_copy.o
  AR      drivers/misc/keba/built-in.a
  AR      drivers/misc/built-in.a
  AR      drivers/gpu/drm/tilcdc/built-in.a
  CC      drivers/gpu/drm/i915/i915_ioctl.o
  CC      net/netfilter/xt_policy.o
  CC      drivers/acpi/acpica/utaddress.o
  CC      mm/hugetlb.o
  CC      mm/mmu_notifier.o
  CC      drivers/tty/sysrq.o
  CC      net/netfilter/xt_state.o
  AR      drivers/block/built-in.a
  CC      lib/devres.o
  CC [M]  net/netfilter/nf_log_syslog.o
  CC      drivers/base/power/wakeirq.o
  CC      drivers/gpu/drm/ttm/ttm_resource.o
  CC      fs/ext4/sysfs.o
  CC      drivers/acpi/acpica/utalloc.o
  CC      mm/migrate.o
  CC      arch/x86/kernel/smpboot.o
  CC      net/mac80211/michael.o
  CC      lib/check_signature.o
  CC      net/sunrpc/sunrpc_syms.o
  CC      drivers/base/power/main.o
  CC      fs/tracefs/inode.o
  CC      net/ipv4/udp_offload.o
  CC      lib/interval_tree.o
  CC      kernel/signal.o
  CC      drivers/acpi/acpica/utascii.o
  CC      drivers/gpu/drm/i915/i915_irq.o
  AR      drivers/mfd/built-in.a
  CC      drivers/acpi/acpica/utbuffer.o
  CC      drivers/acpi/acpica/utcksum.o
  CC      fs/nfs/sysctl.o
  CC      lib/assoc_array.o
  CC      net/mac80211/tkip.o
  AR      drivers/tty/built-in.a
  CC      fs/tracefs/event_inode.o
  CC      drivers/base/regmap/regmap.o
  CC      drivers/gpu/drm/ttm/ttm_pool.o
  CC      drivers/gpu/drm/ttm/ttm_device.o
  CC      arch/x86/kernel/tsc_sync.o
  AR      drivers/nfc/built-in.a
  CC      drivers/base/power/wakeup.o
  CC      drivers/acpi/acpica/utcopy.o
  CC      drivers/gpu/drm/virtio/virtgpu_drv.o
  CC      drivers/gpu/drm/ttm/ttm_sys_manager.o
  CC      net/ipv6/ping.o
  CC [M]  fs/efivarfs/inode.o
  CC [M]  net/netfilter/xt_mark.o
  CC      arch/x86/kernel/setup_percpu.o
  CC      drivers/acpi/acpica/utexcep.o
  CC      lib/bitrev.o
  CC      net/wireless/mesh.o
  CC [M]  fs/efivarfs/file.o
  CC      fs/nfs/nfs3super.o
  CC [M]  net/netfilter/xt_nat.o
  CC      net/sysctl_net.o
  AR      drivers/base/test/built-in.a
  CC      net/mac80211/aes_cmac.o
  AR      fs/tracefs/built-in.a
  CC      fs/ext4/xattr.o
  AR      drivers/dax/hmem/built-in.a
  AR      drivers/dax/built-in.a
  CC      drivers/acpi/acpica/utdebug.o
  CC      drivers/gpu/drm/i915/i915_mitigations.o
  CC      net/ipv4/arp.o
  CC      lib/crc-ccitt.o
  CC      drivers/gpu/drm/virtio/virtgpu_kms.o
  CC      lib/crc16.o
  CC      arch/x86/kernel/mpparse.o
  CC      drivers/gpu/drm/ttm/ttm_backup.o
  CC      net/sunrpc/cache.o
  CC      drivers/acpi/acpica/utdecode.o
  CC      net/mac80211/aes_gmac.o
  CC      drivers/gpu/drm/virtio/virtgpu_gem.o
  CC      drivers/base/power/wakeup_stats.o
  CC      fs/ext4/xattr_hurd.o
  AR      drivers/gpu/drm/imx/built-in.a
  CC      fs/ext4/xattr_trusted.o
  HOSTCC  lib/gen_crc32table
  CC      drivers/acpi/acpica/utdelete.o
  CC      lib/xxhash.o
  CC      net/ipv6/exthdrs.o
  CC [M]  fs/efivarfs/super.o
  CC      net/ipv6/datagram.o
  CC      drivers/base/power/trace.o
  CC      lib/genalloc.o
  CC      drivers/gpu/drm/i915/i915_module.o
  CC      fs/nfs/nfs3client.o
  CC      drivers/acpi/acpica/uterror.o
  CC      kernel/sys.o
  CC      drivers/dma-buf/dma-buf.o
  CC [M]  net/netfilter/xt_LOG.o
  AR      drivers/gpu/drm/panel/built-in.a
  CC      drivers/dma-buf/dma-fence.o
  CC      arch/x86/kernel/trace_clock.o
  CC      drivers/gpu/drm/virtio/virtgpu_vram.o
  CC      lib/percpu_counter.o
  CC      net/wireless/ap.o
  CC [M]  fs/efivarfs/vars.o
  CC      net/mac80211/fils_aead.o
  CC      arch/x86/kernel/trace.o
  CC      drivers/acpi/acpica/uteval.o
  CC      mm/page_counter.o
  CC      drivers/gpu/drm/ttm/ttm_agp_backend.o
  CC      fs/nfs/nfs3proc.o
  AR      drivers/base/power/built-in.a
  CC      net/sunrpc/rpc_pipe.o
  CC      drivers/base/regmap/regcache.o
  CC      mm/hugetlb_cgroup.o
  CC      drivers/gpu/drm/virtio/virtgpu_display.o
  CC      drivers/acpi/acpica/utglobal.o
  CC      lib/audit.o
  CC      net/ipv4/icmp.o
  CC      arch/x86/kernel/rethook.o
  CC [M]  net/netfilter/xt_MASQUERADE.o
  CC      fs/ext4/xattr_user.o
  CC      fs/open.o
  CC      drivers/gpu/drm/i915/i915_params.o
  AR      drivers/gpu/drm/bridge/analogix/built-in.a
  CC      drivers/acpi/acpica/uthex.o
  AR      drivers/gpu/drm/bridge/cadence/built-in.a
  AR      drivers/gpu/drm/bridge/imx/built-in.a
  AR      drivers/cxl/core/built-in.a
  AR      drivers/gpu/drm/bridge/synopsys/built-in.a
  AR      drivers/cxl/built-in.a
  AR      drivers/gpu/drm/bridge/built-in.a
  CC      drivers/base/component.o
  CC      net/ipv4/devinet.o
  LD [M]  fs/efivarfs/efivarfs.o
  CC      lib/syscall.o
  CC      net/sunrpc/sysfs.o
  CC      drivers/dma-buf/dma-fence-array.o
  AR      drivers/gpu/drm/hisilicon/built-in.a
  CC      fs/read_write.o
  CC      net/ipv4/af_inet.o
  CC      net/ipv6/ip6_flowlabel.o
  AR      drivers/gpu/drm/ttm/built-in.a
  CC      net/mac80211/cfg.o
  CC      arch/x86/kernel/vmcore_info_32.o
  CC      net/ipv6/inet6_connection_sock.o
  CC      drivers/acpi/acpica/utids.o
  CC      drivers/gpu/drm/virtio/virtgpu_vq.o
  CC      drivers/base/regmap/regcache-rbtree.o
  CC      kernel/umh.o
  CC      fs/ext4/fast_commit.o
  CC      mm/early_ioremap.o
  CC      drivers/dma-buf/dma-fence-chain.o
  CC      lib/errname.o
  CC      drivers/macintosh/mac_hid.o
  CC      lib/nlattr.o
  CC      drivers/acpi/acpica/utinit.o
  CC      drivers/gpu/drm/i915/i915_pci.o
  CC      fs/nfs/nfs3xdr.o
  AR      drivers/scsi/pcmcia/built-in.a
  CC      drivers/scsi/scsi.o
  CC [M]  net/netfilter/xt_addrtype.o
  CC      fs/ext4/orphan.o
  CC      net/wireless/trace.o
  CC      drivers/base/regmap/regcache-flat.o
  CC      drivers/acpi/acpica/utlock.o
  CC      arch/x86/kernel/machine_kexec_32.o
  CC      drivers/dma-buf/dma-fence-unwrap.o
  AR      drivers/macintosh/built-in.a
  CC      drivers/dma-buf/dma-resv.o
  CC      drivers/base/regmap/regcache-maple.o
  CC      net/sunrpc/svc_xprt.o
  CC      kernel/workqueue.o
  CC      mm/secretmem.o
  CC      drivers/acpi/acpica/utmath.o
  CC      net/wireless/ocb.o
  AR      drivers/gpu/drm/mxsfb/built-in.a
  AS      arch/x86/kernel/relocate_kernel_32.o
  CC      net/ipv6/udp_offload.o
  CC      drivers/gpu/drm/virtio/virtgpu_fence.o
  CC      fs/ext4/acl.o
  CC      drivers/scsi/hosts.o
  CC      drivers/gpu/drm/i915/i915_scatterlist.o
  CC      drivers/acpi/acpica/utmisc.o
  CC      fs/nfs/nfs3acl.o
  CC      lib/cpu_rmap.o
  CC      arch/x86/kernel/module.o
  CC      drivers/base/regmap/regmap-debugfs.o
  CC      drivers/gpu/drm/i915/i915_switcheroo.o
  CC      net/ipv4/igmp.o
  CC      net/ipv6/seg6.o
  CC      drivers/dma-buf/sync_file.o
  AR      drivers/gpu/drm/sysfb/built-in.a
  CC      drivers/base/core.o
  AR      net/netfilter/built-in.a
  CC      fs/file_table.o
  CC      drivers/acpi/acpica/utmutex.o
  CC      lib/dynamic_queue_limits.o
  CC      drivers/gpu/drm/virtio/virtgpu_object.o
  CC      mm/hmm.o
  CC      lib/glob.o
  CC      net/wireless/pmsr.o
  CC      drivers/scsi/scsi_ioctl.o
  CC      arch/x86/kernel/doublefault_32.o
  CC      fs/ext4/xattr_security.o
  CC      drivers/acpi/acpica/utnonansi.o
  CC      kernel/pid.o
  CC      drivers/scsi/scsicam.o
  AR      drivers/dma-buf/built-in.a
  CC      net/mac80211/ethtool.o
  AR      drivers/base/regmap/built-in.a
  CC      net/ipv4/fib_frontend.o
  CC      net/sunrpc/xprtmultipath.o
  CC      arch/x86/kernel/early_printk.o
  CC      drivers/acpi/acpica/utobject.o
  CC      drivers/gpu/drm/i915/i915_sysfs.o
  CC      fs/nfs/nfs4proc.o
  CC      drivers/gpu/drm/virtio/virtgpu_debugfs.o
  CC      net/ipv6/fib6_notifier.o
  CC      mm/memfd.o
  AR      fs/ext4/built-in.a
  CC      fs/super.o
  CC      lib/strncpy_from_user.o
  CC      drivers/base/bus.o
  CC      drivers/scsi/scsi_error.o
  AR      drivers/gpu/drm/tiny/built-in.a
  CC      drivers/acpi/acpica/utosi.o
  CC      kernel/task_work.o
  AR      drivers/nvme/common/built-in.a
  AR      drivers/nvme/host/built-in.a
  AR      drivers/nvme/target/built-in.a
  AR      drivers/nvme/built-in.a
  CC      net/sunrpc/stats.o
  CC      net/ipv4/fib_semantics.o
  CC      drivers/ata/libata-core.o
  CC      arch/x86/kernel/hpet.o
  CC      drivers/acpi/acpica/utownerid.o
  CC      drivers/gpu/drm/virtio/virtgpu_plane.o
  CC      lib/strnlen_user.o
  CC      drivers/gpu/drm/i915/i915_utils.o
  CC      drivers/acpi/acpica/utpredef.o
  CC      arch/x86/kernel/amd_nb.o
  CC      drivers/acpi/acpica/utresdecode.o
  CC      arch/x86/kernel/amd_node.o
  CC      drivers/ata/libata-scsi.o
  CC      mm/execmem.o
  CC      drivers/scsi/scsi_lib.o
  CC      net/ipv6/rpl.o
  CC      drivers/scsi/constants.o
  CC      drivers/acpi/acpica/utresrc.o
  CC      drivers/ata/libata-eh.o
  CC      drivers/scsi/scsi_lib_dma.o
  CC      lib/net_utils.o
  CC      drivers/scsi/scsi_scan.o
  CC      kernel/extable.o
  CC      net/mac80211/rx.o
  CC      drivers/base/dd.o
  GEN     drivers/scsi/scsi_devinfo_tbl.c
  CC      drivers/gpu/drm/virtio/virtgpu_ioctl.o
  CC      drivers/ata/libata-transport.o
  CC      drivers/ata/libata-trace.o
  CC      drivers/acpi/acpica/utstate.o
  AR      drivers/net/pse-pd/built-in.a
  AR      drivers/net/phy/mediatek/built-in.a
  AR      drivers/net/phy/qcom/built-in.a
  GEN     net/wireless/shipped-certs.c
  CC      lib/sg_pool.o
  CC      drivers/net/phy/realtek/realtek_main.o
  CC      drivers/gpu/drm/i915/intel_clock_gating.o
  AR      mm/built-in.a
  CC      lib/stackdepot.o
  CC      kernel/params.o
  CC      arch/x86/kernel/kvm.o
  CC      drivers/acpi/acpica/utstring.o
  CC      net/ipv6/ioam6.o
  CC      fs/char_dev.o
  CC      net/mac80211/spectmgmt.o
  CC      net/sunrpc/sysctl.o
  CC      drivers/acpi/acpica/utstrsuppt.o
  CC      drivers/gpu/drm/virtio/virtgpu_prime.o
  CC      drivers/acpi/acpica/utstrtoul64.o
  CC      net/mac80211/tx.o
  CC      drivers/base/syscore.o
  CC      drivers/gpu/drm/i915/intel_cpu_info.o
  CC      net/ipv4/fib_trie.o
  AR      drivers/gpu/drm/xlnx/built-in.a
  CC      fs/stat.o
  CC      drivers/gpu/drm/virtio/virtgpu_trace_points.o
  CC      drivers/acpi/acpica/utxface.o
  CC      lib/asn1_decoder.o
  CC      drivers/base/driver.o
  CC      net/mac80211/key.o
  CC      kernel/kthread.o
  CC      fs/nfs/nfs4xdr.o
  AR      drivers/net/phy/realtek/built-in.a
  CC      drivers/net/phy/mdio-boardinfo.o
  CC      drivers/gpu/drm/i915/intel_device_info.o
  CC      net/ipv4/fib_notifier.o
  CC      drivers/acpi/acpica/utxfinit.o
  AR      net/sunrpc/built-in.a
  CC      drivers/net/mdio/acpi_mdio.o
  CC      drivers/ata/libata-sata.o
  CC      arch/x86/kernel/kvmclock.o
  CC      net/ipv4/inet_fragment.o
  GEN     lib/oid_registry_data.c
  CC      lib/ucs2_string.o
  CC      fs/exec.o
  CC      drivers/scsi/scsi_devinfo.o
  CC      drivers/acpi/acpica/utxferror.o
  CC      drivers/base/class.o
  CC      drivers/gpu/drm/virtio/virtgpu_submit.o
  CC      net/ipv6/sysctl_net_ipv6.o
  CC      lib/sbitmap.o
  CC      drivers/firewire/init_ohci1394_dma.o
  CC      drivers/acpi/acpica/utxfmutex.o
  CC      drivers/scsi/scsi_sysctl.o
  CC      arch/x86/kernel/paravirt.o
  CC      drivers/net/mdio/fwnode_mdio.o
  CC      drivers/gpu/drm/i915/intel_memory_region.o
  AR      drivers/gpu/drm/gud/built-in.a
  CC      drivers/gpu/drm/i915/intel_pcode.o
  AR      drivers/acpi/acpica/built-in.a
  CC      kernel/sys_ni.o
make[3]: *** [/workspace/kernel/scripts/Makefile.build:461: drivers/acpi] Error 2
  CC      drivers/net/phy/stubs.o
make[3]: *** Waiting for unfinished jobs....
  CC      drivers/base/platform.o
  CC      net/mac80211/util.o
  CC      drivers/net/phy/mdio_devres.o
  AR      drivers/gpu/drm/virtio/built-in.a
  CC      net/ipv6/xfrm6_policy.o
  CC      arch/x86/kernel/pvclock.o
  AR      drivers/firewire/built-in.a
  CC      net/ipv4/ping.o
  AR      drivers/net/pcs/built-in.a
  AR      drivers/net/ethernet/3com/built-in.a
  CC      drivers/net/ethernet/8390/ne2k-pci.o
  CC      kernel/nsproxy.o
  CC      lib/group_cpus.o
  CC      drivers/net/ethernet/8390/8390.o
  AR      drivers/net/wireless/admtek/built-in.a
  AR      drivers/net/wireless/ath/built-in.a
  CC      drivers/scsi/scsi_proc.o
  AR      drivers/net/wireless/atmel/built-in.a
  AR      drivers/net/wireless/broadcom/built-in.a
  AR      drivers/net/wireless/intel/built-in.a
  AR      drivers/net/wireless/intersil/built-in.a
  AR      drivers/net/wireless/marvell/built-in.a
  AR      drivers/net/wireless/mediatek/built-in.a
  CC      fs/pipe.o
  AR      drivers/net/wireless/microchip/built-in.a
  AR      drivers/net/wireless/purelifi/built-in.a
  CC      drivers/base/cpu.o
  AR      drivers/net/wireless/quantenna/built-in.a
  AR      drivers/net/wireless/ralink/built-in.a
  AR      drivers/net/wireless/realtek/built-in.a
  AR      drivers/net/mdio/built-in.a
  CC      drivers/gpu/drm/i915/intel_region_ttm.o
  AR      drivers/net/wireless/rsi/built-in.a
  AR      drivers/net/wireless/silabs/built-in.a
  AR      drivers/net/wireless/st/built-in.a
  AR      drivers/net/wireless/ti/built-in.a
  CC      arch/x86/kernel/pcspeaker.o
  AR      drivers/net/wireless/zydas/built-in.a
  AR      drivers/net/wireless/virtual/built-in.a
  AR      drivers/net/wireless/built-in.a
  AR      drivers/gpu/drm/solomon/built-in.a
  CC      kernel/notifier.o
  CC      lib/fw_table.o
  CC      drivers/scsi/scsi_debugfs.o
  AR      drivers/net/usb/built-in.a
  CC      net/ipv6/xfrm6_state.o
  CC      net/ipv4/ip_tunnel_core.o
  CC      drivers/net/phy/phy.o
  CC      arch/x86/kernel/check.o
  CC      drivers/scsi/scsi_trace.o
  CC      drivers/ata/libata-sff.o
  CC      drivers/scsi/scsi_logging.o
  CC      kernel/ksysfs.o
  CC      fs/namei.o
  CC      net/ipv6/xfrm6_input.o
  CC [M]  drivers/gpu/drm/scheduler/sched_main.o
  CC      drivers/net/mii.o
  CC      drivers/scsi/scsi_pm.o
  AR      lib/lib.a
  GEN     lib/crc32table.h
  CC      lib/oid_registry.o
  CC      drivers/base/firmware.o
  AR      drivers/net/ethernet/8390/built-in.a
  AR      drivers/net/ethernet/adaptec/built-in.a
  CC      arch/x86/kernel/uprobes.o
  AR      drivers/net/ethernet/agere/built-in.a
  AR      drivers/net/ethernet/alacritech/built-in.a
  AR      drivers/net/ethernet/alteon/built-in.a
  AR      drivers/net/ethernet/amazon/built-in.a
  AR      drivers/net/ethernet/amd/built-in.a
  AR      drivers/net/ethernet/aquantia/built-in.a
  CC      drivers/gpu/drm/i915/intel_runtime_pm.o
  AR      drivers/net/ethernet/arc/built-in.a
  AR      drivers/net/ethernet/asix/built-in.a
  CC      fs/nfs/nfs4state.o
  AR      drivers/net/ethernet/atheros/built-in.a
  AR      drivers/net/ethernet/cadence/built-in.a
  CC      drivers/net/ethernet/broadcom/bnx2.o
  CC      kernel/cred.o
  AR      drivers/net/ethernet/brocade/built-in.a
  CC      drivers/net/phy/phy-c45.o
  CC      net/mac80211/parse.o
  CC      drivers/base/init.o
  CC      drivers/base/map.o
  CC      lib/crc32.o
  CC      fs/nfs/nfs4renewd.o
  CC      net/mac80211/wme.o
  CC      fs/fcntl.o
  HOSTCC  drivers/gpu/drm/xe/xe_gen_wa_oob
  CC      drivers/scsi/scsi_bsg.o
  GEN     xe_wa_oob.c xe_wa_oob.h
  CC [M]  drivers/gpu/drm/xe/xe_bb.o
  AR      lib/built-in.a
  CC [M]  drivers/gpu/drm/scheduler/sched_fence.o
  CC      net/ipv4/gre_offload.o
  CC      drivers/gpu/drm/drm_atomic.o
  CC      net/wireless/shipped-certs.o
  CC      kernel/reboot.o
  CC      drivers/base/devres.o
  CC      drivers/ata/libata-pmp.o
  CC [M]  drivers/gpu/drm/scheduler/sched_entity.o
  CC      drivers/scsi/scsi_common.o
  CC      net/ipv6/xfrm6_output.o
  CC      drivers/gpu/drm/i915/intel_sbi.o
  AR      drivers/net/ethernet/cavium/common/built-in.a
  AR      drivers/net/ethernet/cavium/thunder/built-in.a
  CC      fs/nfs/nfs4super.o
  AR      drivers/net/ethernet/cavium/liquidio/built-in.a
  AR      drivers/net/ethernet/cavium/octeon/built-in.a
  AR      drivers/net/ethernet/cavium/built-in.a
  CC      arch/x86/kernel/perf_regs.o
  CC      fs/ioctl.o
  CC      drivers/net/loopback.o
  CC      drivers/net/netconsole.o
  CC [M]  drivers/gpu/drm/xe/xe_bo.o
  CC      drivers/net/phy/phy-core.o
  CC      fs/readdir.o
  CC      drivers/scsi/scsi_transport_spi.o
  CC      drivers/base/attribute_container.o
  CC      net/ipv6/xfrm6_protocol.o
  CC      drivers/gpu/drm/i915/intel_step.o
  LD [M]  drivers/gpu/drm/scheduler/gpu-sched.o
  CC      net/ipv4/metrics.o
  CC      kernel/async.o
  AR      net/wireless/built-in.a
  AR      drivers/net/ethernet/chelsio/built-in.a
  CC      drivers/base/transport_class.o
  CC      drivers/ata/libata-acpi.o
  CC      arch/x86/kernel/tracepoint.o
  CC      fs/nfs/nfs4file.o
  CC      fs/nfs/delegation.o
  CC      net/ipv6/netfilter.o
  CC      drivers/net/virtio_net.o
  CC      drivers/net/phy/phy_device.o
  CC      kernel/range.o
  CC      fs/select.o
  CC      arch/x86/kernel/itmt.o
  CC      drivers/gpu/drm/i915/intel_uncore.o
  CC      drivers/gpu/drm/drm_atomic_uapi.o
  CC      drivers/base/topology.o
  CC      fs/dcache.o
  CC      drivers/net/net_failover.o
  CC      kernel/smpboot.o
  CC      drivers/net/ethernet/broadcom/tg3.o
  CC      net/ipv4/netlink.o
  CC      net/mac80211/chan.o
  AR      drivers/net/ethernet/cisco/built-in.a
  CC      fs/nfs/nfs4idmap.o
  CC      drivers/scsi/virtio_scsi.o
  CC      arch/x86/kernel/umip.o
  CC      drivers/scsi/sd.o
  CC      fs/nfs/callback.o
  CC      drivers/ata/libata-pata-timings.o
  CC      drivers/base/container.o
  CC      drivers/net/phy/linkmode.o
  CC      kernel/ucount.o
  CC [M]  drivers/gpu/drm/xe/xe_bo_evict.o
  CC      drivers/base/property.o
  CC      net/ipv6/proc.o
  CC      net/ipv4/nexthop.o
  CC      net/mac80211/trace.o
  CC      net/ipv6/syncookies.o
  CC      net/ipv6/calipso.o
  AR      drivers/net/ethernet/cortina/built-in.a
  CC      net/mac80211/mlme.o
  CC      kernel/regset.o
  CC      arch/x86/kernel/unwind_frame.o
  CC      fs/nfs/callback_xdr.o
  CC      drivers/gpu/drm/i915/intel_uncore_trace.o
  CC      drivers/scsi/sr.o
  CC      net/ipv6/ah6.o
  CC      drivers/net/phy/phy_link_topology.o
  CC      kernel/ksyms_common.o
  CC      drivers/ata/ahci.o
  CC      net/ipv4/udp_tunnel_stub.o
  CC      drivers/gpu/drm/drm_auth.o
  AR      drivers/net/ethernet/dec/tulip/built-in.a
  AR      drivers/net/ethernet/dec/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_devcoredump.o
  CC      drivers/net/phy/phy_package.o
  CC      drivers/base/cacheinfo.o
  AR      arch/x86/kernel/built-in.a
  AR      arch/x86/built-in.a
  CC      drivers/scsi/sr_ioctl.o
  CC      net/ipv6/esp6.o
  CC      net/ipv4/ip_tunnel.o
  CC      drivers/gpu/drm/i915/intel_wakeref.o
  CC      kernel/groups.o
  CC      fs/nfs/callback_proc.o
  CC      drivers/gpu/drm/drm_blend.o
  AR      drivers/net/ethernet/dlink/built-in.a
  AR      drivers/net/ethernet/emulex/built-in.a
  AR      drivers/net/ethernet/engleder/built-in.a
  CC      drivers/gpu/drm/i915/vlv_sideband.o
  CC      drivers/base/swnode.o
  CC      drivers/ata/libahci.o
  CC      net/mac80211/tdls.o
  CC      fs/inode.o
  CC      net/ipv4/sysctl_net_ipv4.o
  CC      kernel/kcmp.o
  AR      drivers/net/ethernet/ezchip/built-in.a
  CC      net/mac80211/ocb.o
  AR      drivers/net/ethernet/fujitsu/built-in.a
  CC      drivers/gpu/drm/drm_bridge.o
  CC      drivers/scsi/sr_vendor.o
  CC [M]  drivers/gpu/drm/xe/xe_device.o
  CC      drivers/gpu/drm/drm_cache.o
  CC      drivers/gpu/drm/i915/vlv_suspend.o
  CC      drivers/scsi/sg.o
  CC      drivers/net/phy/phy_caps.o
  AR      drivers/net/ethernet/fungible/built-in.a
  CC      fs/nfs/nfs4namespace.o
  CC [M]  drivers/gpu/drm/xe/xe_device_sysfs.o
  CC      drivers/base/faux.o
  CC      fs/nfs/nfs4getroot.o
  CC      net/mac80211/airtime.o
  CC      kernel/freezer.o
  CC      net/ipv6/sit.o
  CC      fs/attr.o
  CC      net/ipv6/addrconf_core.o
  CC      drivers/base/auxiliary.o
  CC      net/ipv4/proc.o
  CC      drivers/net/phy/mdio_bus.o
  AR      drivers/net/ethernet/google/built-in.a
  CC      drivers/gpu/drm/i915/soc/intel_dram.o
  CC [M]  drivers/gpu/drm/xe/xe_dma_buf.o
  CC      drivers/ata/ata_piix.o
  CC      net/mac80211/eht.o
  CC      kernel/profile.o
  CC      drivers/base/devtmpfs.o
  CC      fs/nfs/nfs4client.o
  CC      fs/bad_inode.o
  CC      net/ipv6/exthdrs_core.o
  CC      drivers/ata/pata_amd.o
  CC      fs/nfs/nfs4session.o
  CC      drivers/scsi/scsi_sysfs.o
  AR      drivers/net/ethernet/hisilicon/built-in.a
  CC      drivers/gpu/drm/drm_color_mgmt.o
  CC      net/ipv4/fib_rules.o
  CC      drivers/base/module.o
  CC      kernel/stacktrace.o
  CC      drivers/gpu/drm/drm_connector.o
  CC      drivers/gpu/drm/i915/soc/intel_gmch.o
  CC [M]  drivers/gpu/drm/xe/xe_drm_client.o
  CC      drivers/ata/pata_oldpiix.o
  CC      drivers/net/phy/mdio_device.o
  AR      drivers/net/ethernet/huawei/built-in.a
  CC      drivers/base/auxiliary_sysfs.o
  CC      net/mac80211/led.o
  CC      fs/nfs/dns_resolve.o
  CC      net/ipv6/ip6_checksum.o
  CC      kernel/dma.o
  CC [M]  drivers/gpu/drm/xe/xe_eu_stall.o
  CC      fs/file.o
  CC      drivers/base/devcoredump.o
  CC      drivers/gpu/drm/i915/soc/intel_rom.o
  CC      net/ipv6/ip6_icmp.o
  CC      drivers/net/ethernet/intel/e1000/e1000_main.o
  CC      drivers/gpu/drm/i915/i915_memcpy.o
  CC      drivers/net/ethernet/intel/e1000e/82571.o
  CC      net/ipv4/ipmr.o
  CC      kernel/smp.o
  AR      drivers/scsi/built-in.a
  CC      drivers/net/ethernet/intel/e1000/e1000_hw.o
  CC      drivers/net/ethernet/intel/e1000e/ich8lan.o
  CC      fs/filesystems.o
  CC      drivers/net/ethernet/intel/e100.o
  CC      drivers/ata/pata_sch.o
  CC      drivers/base/platform-msi.o
  CC      drivers/net/phy/swphy.o
  AR      drivers/net/ethernet/i825xx/built-in.a
  CC      fs/nfs/nfs4trace.o
  CC      drivers/gpu/drm/drm_crtc.o
  CC      net/mac80211/pm.o
  CC      drivers/gpu/drm/i915/i915_mm.o
  CC      net/ipv4/ipmr_base.o
  CC      net/ipv6/output_core.o
  CC      drivers/base/physical_location.o
  CC      drivers/net/ethernet/intel/e1000/e1000_ethtool.o
  CC      fs/namespace.o
  CC [M]  drivers/gpu/drm/xe/xe_exec.o
  CC      drivers/ata/pata_mpiix.o
  CC      kernel/uid16.o
  CC      drivers/net/ethernet/intel/e1000e/80003es2lan.o
  CC      drivers/base/trace.o
  CC      drivers/ata/ata_generic.o
  CC      drivers/net/phy/fixed_phy.o
  CC      fs/seq_file.o
  CC      fs/nfs/nfs4sysctl.o
  CC [M]  drivers/gpu/drm/xe/xe_exec_queue.o
  CC      drivers/gpu/drm/i915/i915_sw_fence.o
  CC [M]  drivers/gpu/drm/xe/xe_execlist.o
  CC      drivers/net/ethernet/intel/e1000/e1000_param.o
  CC      net/ipv6/protocol.o
  CC      kernel/kallsyms.o
  AR      drivers/net/ethernet/microsoft/built-in.a
  CC      drivers/net/ethernet/intel/e1000e/mac.o
  AR      drivers/base/built-in.a
  AR      drivers/ata/built-in.a
  CC      net/mac80211/rc80211_minstrel_ht.o
  CC      drivers/gpu/drm/drm_displayid.o
  AR      drivers/net/ethernet/litex/built-in.a
  CC      net/mac80211/wbrf.o
  CC      net/ipv4/syncookies.o
  CC      drivers/gpu/drm/i915/i915_sw_fence_work.o
  CC      drivers/gpu/drm/drm_drv.o
  CC      kernel/acct.o
  AR      drivers/net/phy/built-in.a
  CC      net/ipv6/ip6_offload.o
  CC [M]  drivers/gpu/drm/xe/xe_force_wake.o
  CC      fs/xattr.o
  AR      drivers/net/ethernet/marvell/octeon_ep/built-in.a
  CC      net/ipv6/tcpv6_offload.o
  CC [M]  drivers/gpu/drm/xe/xe_ggtt.o
  AR      drivers/net/ethernet/marvell/octeon_ep_vf/built-in.a
  AR      drivers/net/ethernet/marvell/octeontx2/built-in.a
  CC      drivers/gpu/drm/i915/i915_syncmap.o
  CC      net/ipv4/tunnel4.o
  AR      drivers/net/ethernet/marvell/prestera/built-in.a
  CC      drivers/net/ethernet/marvell/sky2.o
  CC      fs/libfs.o
  CC      kernel/vmcore_info.o
  AR      drivers/net/ethernet/broadcom/built-in.a
  CC      drivers/net/ethernet/intel/e1000e/manage.o
  CC      drivers/gpu/drm/i915/i915_user_extensions.o
  CC      drivers/gpu/drm/drm_dumb_buffers.o
  CC [M]  drivers/gpu/drm/xe/xe_gpu_scheduler.o
  CC      net/ipv6/exthdrs_offload.o
  CC      net/ipv4/ipconfig.o
  CC      fs/fs-writeback.o
  AR      drivers/net/ethernet/intel/e1000/built-in.a
  CC      drivers/gpu/drm/i915/i915_debugfs.o
  CC      drivers/net/ethernet/intel/e1000e/nvm.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc.o
  CC      net/ipv6/inet6_hashtables.o
  CC      net/ipv4/netfilter.o
  AR      drivers/net/ethernet/mellanox/built-in.a
  CC      net/ipv6/mcast_snoop.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc_debugfs.o
  CC      kernel/elfcorehdr.o
  CC      fs/pnode.o
  CC      drivers/net/ethernet/intel/e1000e/phy.o
  AR      fs/nfs/built-in.a
  AR      drivers/net/ethernet/meta/built-in.a
  CC      drivers/net/ethernet/intel/e1000e/param.o
  CC      drivers/gpu/drm/i915/i915_debugfs_params.o
  CC      drivers/net/ethernet/intel/e1000e/ethtool.o
  CC      kernel/kexec_core.o
  CC      drivers/gpu/drm/drm_edid.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc_proxy.o
  CC      drivers/gpu/drm/i915/i915_pmu.o
  CC      net/ipv4/tcp_cubic.o
  AR      drivers/net/ethernet/micrel/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gsc_submit.o
  CC [M]  drivers/gpu/drm/xe/xe_gt.o
  CC      drivers/net/ethernet/intel/e1000e/netdev.o
  CC      drivers/gpu/drm/i915/gt/gen2_engine_cs.o
  CC      kernel/kexec.o
  CC      net/ipv4/tcp_sigpool.o
  AR      drivers/net/ethernet/microchip/built-in.a
  AR      drivers/net/ethernet/mscc/built-in.a
  CC      fs/splice.o
  AR      drivers/net/ethernet/myricom/built-in.a
  CC      net/ipv4/cipso_ipv4.o
  CC      kernel/utsname.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_ccs_mode.o
  CC      drivers/gpu/drm/drm_eld.o
  CC      net/ipv4/xfrm4_policy.o
  CC      drivers/net/ethernet/intel/e1000e/ptp.o
  CC      kernel/pid_namespace.o
  CC      net/ipv4/xfrm4_state.o
  CC      drivers/gpu/drm/drm_encoder.o
  AR      net/mac80211/built-in.a
  AR      drivers/net/ethernet/natsemi/built-in.a
  CC      net/ipv4/xfrm4_input.o
  CC      fs/sync.o
  AR      net/ipv6/built-in.a
  CC      kernel/stop_machine.o
  CC      drivers/gpu/drm/i915/gt/gen6_engine_cs.o
  CC      kernel/audit.o
  CC      drivers/gpu/drm/drm_file.o
  CC      drivers/gpu/drm/i915/gt/gen6_ppgtt.o
  CC      net/ipv4/xfrm4_output.o
  CC      fs/utimes.o
  AR      drivers/net/ethernet/marvell/built-in.a
  CC      kernel/auditfilter.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_clock.o
  CC      drivers/gpu/drm/i915/gt/gen7_renderclear.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_freq.o
  CC      net/ipv4/xfrm4_protocol.o
  AR      drivers/net/ethernet/neterion/built-in.a
  CC      fs/d_path.o
  CC      kernel/auditsc.o
  CC      drivers/gpu/drm/drm_fourcc.o
  CC      kernel/audit_watch.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_idle.o
  CC      drivers/gpu/drm/i915/gt/gen8_engine_cs.o
  AR      drivers/net/ethernet/netronome/built-in.a
  CC      drivers/gpu/drm/drm_framebuffer.o
  CC      kernel/audit_fsnotify.o
  CC      drivers/gpu/drm/i915/gt/gen8_ppgtt.o
  CC      fs/stack.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_mcr.o
  CC      drivers/gpu/drm/i915/gt/intel_breadcrumbs.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_pagefault.o
  AR      drivers/net/ethernet/ni/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_sysfs.o
  CC      drivers/gpu/drm/drm_gem.o
  CC      drivers/net/ethernet/nvidia/forcedeth.o
  CC      kernel/audit_tree.o
  CC      drivers/gpu/drm/i915/gt/intel_context.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_throttle.o
  AR      drivers/net/ethernet/oki-semi/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_context_sseu.o
  AR      drivers/net/ethernet/packetengines/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_engine_cs.o
  CC      fs/fs_struct.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o
  AR      net/ipv4/built-in.a
  CC      kernel/kprobes.o
  AR      net/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_engine_heartbeat.o
  CC      drivers/gpu/drm/i915/gt/intel_engine_pm.o
  AR      drivers/net/ethernet/qlogic/built-in.a
  CC      fs/statfs.o
  AR      drivers/net/ethernet/qualcomm/emac/built-in.a
  AR      drivers/net/ethernet/qualcomm/built-in.a
  CC      drivers/gpu/drm/drm_ioctl.o
  CC      drivers/net/ethernet/realtek/8139too.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_topology.o
  CC      fs/fs_pin.o
  CC      drivers/net/ethernet/realtek/r8169_main.o
  AR      drivers/net/ethernet/renesas/built-in.a
  CC      drivers/gpu/drm/drm_lease.o
  CC      kernel/seccomp.o
  CC      drivers/net/ethernet/realtek/r8169_firmware.o
  CC [M]  drivers/gpu/drm/xe/xe_guc.o
  CC      fs/nsfs.o
  CC      drivers/gpu/drm/i915/gt/intel_engine_user.o
  AR      drivers/net/ethernet/rdc/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_execlists_submission.o
  CC      drivers/net/ethernet/realtek/r8169_phy_config.o
  CC      drivers/gpu/drm/drm_managed.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_ads.o
  CC      fs/fs_types.o
  AR      drivers/net/ethernet/rocker/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_ggtt.o
  CC      kernel/relay.o
  CC      drivers/gpu/drm/drm_mm.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_buf.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_capture.o
  AR      drivers/net/ethernet/samsung/built-in.a
  CC      fs/fs_context.o
  CC      kernel/utsname_sysctl.o
  CC      drivers/gpu/drm/drm_mode_config.o
  CC      fs/fs_parser.o
  CC      kernel/delayacct.o
  CC      fs/fsopen.o
  AR      drivers/net/ethernet/seeq/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_guc_ct.o
  CC      drivers/gpu/drm/drm_mode_object.o
  CC      drivers/gpu/drm/i915/gt/intel_ggtt_fencing.o
  CC      kernel/taskstats.o
  AR      drivers/net/ethernet/silan/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_gt.o
  AR      drivers/net/ethernet/sis/built-in.a
  AR      drivers/net/ethernet/sfc/built-in.a
  CC      kernel/tsacct.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_db_mgr.o
  CC      fs/init.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.o
  CC      fs/kernel_read_file.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_engine_activity.o
  CC      fs/mnt_idmapping.o
  CC      kernel/tracepoint.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.o
  CC      drivers/gpu/drm/drm_modes.o
  CC      drivers/gpu/drm/drm_modeset_lock.o
  CC      kernel/irq_work.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_clock_utils.o
  AR      drivers/net/ethernet/smsc/built-in.a
  CC      fs/remap_range.o
  CC      kernel/static_call.o
  AR      drivers/net/ethernet/nvidia/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_gt_debugfs.o
  CC      drivers/gpu/drm/drm_plane.o
  AR      drivers/net/ethernet/socionext/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_guc_hwconfig.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_id_mgr.o
  CC      fs/pidfs.o
  CC      kernel/padata.o
  CC      drivers/gpu/drm/drm_prime.o
  CC      kernel/jump_label.o
  CC      drivers/gpu/drm/drm_print.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_klv_helpers.o
  AR      drivers/net/ethernet/stmicro/built-in.a
  CC      drivers/gpu/drm/drm_property.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_irq.o
  CC      drivers/gpu/drm/drm_rect.o
  CC      kernel/context_tracking.o
  AR      drivers/net/ethernet/sun/built-in.a
  CC      kernel/iomem.o
  CC      fs/buffer.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_log.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_mcr.o
  AR      drivers/net/ethernet/tehuti/built-in.a
  AR      drivers/net/ethernet/realtek/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_guc_pc.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_submit.o
  CC      drivers/gpu/drm/drm_syncobj.o
  CC      fs/mpage.o
  CC      kernel/rseq.o
  CC [M]  drivers/gpu/drm/xe/xe_heci_gsc.o
  CC [M]  drivers/gpu/drm/xe/xe_huc.o
  AR      drivers/net/ethernet/ti/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_gt_pm.o
  CC      fs/proc_namespace.o
  AR      drivers/net/ethernet/vertexcom/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.o
  CC      drivers/gpu/drm/drm_sysfs.o
  AR      drivers/net/ethernet/intel/e1000e/built-in.a
  CC      fs/direct-io.o
  AR      drivers/net/ethernet/intel/built-in.a
  CC      drivers/gpu/drm/drm_trace_points.o
  AR      drivers/net/ethernet/via/built-in.a
  AR      drivers/net/ethernet/wangxun/built-in.a
  AR      drivers/net/ethernet/wiznet/built-in.a
  AR      drivers/net/ethernet/xilinx/built-in.a
  AR      drivers/net/ethernet/xircom/built-in.a
  AR      drivers/net/ethernet/synopsys/built-in.a
  AR      drivers/net/ethernet/pensando/built-in.a
  CC      drivers/gpu/drm/drm_vblank.o
  CC      fs/eventpoll.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_pm_irq.o
  AR      drivers/net/ethernet/built-in.a
  CC      drivers/gpu/drm/drm_vblank_work.o
  CC      fs/anon_inodes.o
  AR      drivers/net/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_requests.o
  CC      fs/signalfd.o
  CC      drivers/gpu/drm/drm_vma_manager.o
  AR      kernel/built-in.a
  CC      fs/timerfd.o
  CC      drivers/gpu/drm/drm_writeback.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_sysfs.o
  CC      fs/eventfd.o
  CC      drivers/gpu/drm/drm_panel.o
  CC      fs/aio.o
  CC      fs/locks.o
  CC      fs/binfmt_misc.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.o
  CC      fs/binfmt_script.o
  CC      drivers/gpu/drm/i915/gt/intel_gtt.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine_group.o
  CC      drivers/gpu/drm/i915/gt/intel_llc.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_fence.o
  CC      fs/binfmt_elf.o
  CC      drivers/gpu/drm/drm_pci.o
  CC      fs/mbcache.o
  CC      drivers/gpu/drm/drm_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_irq.o
  CC      drivers/gpu/drm/i915/gt/intel_lrc.o
  CC      drivers/gpu/drm/drm_debugfs_crc.o
  CC      drivers/gpu/drm/i915/gt/intel_migrate.o
  CC      drivers/gpu/drm/drm_panel_orientation_quirks.o
  CC      fs/posix_acl.o
  CC [M]  drivers/gpu/drm/xe/xe_lrc.o
  CC      fs/coredump.o
  CC      drivers/gpu/drm/i915/gt/intel_mocs.o
  CC      fs/drop_caches.o
  CC      fs/sysctls.o
  CC [M]  drivers/gpu/drm/xe/xe_migrate.o
  CC      drivers/gpu/drm/i915/gt/intel_ppgtt.o
  CC      fs/fhandle.o
  CC      drivers/gpu/drm/drm_buddy.o
  CC [M]  drivers/gpu/drm/xe/xe_mmio.o
  CC      drivers/gpu/drm/i915/gt/intel_rc6.o
  CC      drivers/gpu/drm/drm_gem_shmem_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_mocs.o
  CC      drivers/gpu/drm/drm_atomic_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_module.o
  CC      drivers/gpu/drm/drm_atomic_state_helper.o
  CC      drivers/gpu/drm/i915/gt/intel_region_lmem.o
  CC [M]  drivers/gpu/drm/xe/xe_oa.o
  CC      drivers/gpu/drm/drm_bridge_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_observation.o
  CC      drivers/gpu/drm/i915/gt/intel_renderstate.o
  CC      drivers/gpu/drm/drm_crtc_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_pat.o
  CC [M]  drivers/gpu/drm/xe/xe_pci.o
  CC      drivers/gpu/drm/drm_damage_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_pcode.o
  CC      drivers/gpu/drm/drm_flip_work.o
  CC [M]  drivers/gpu/drm/xe/xe_pm.o
  CC      drivers/gpu/drm/drm_format_helper.o
  CC      drivers/gpu/drm/i915/gt/intel_reset.o
  CC [M]  drivers/gpu/drm/xe/xe_preempt_fence.o
  CC      drivers/gpu/drm/drm_gem_atomic_helper.o
  CC      drivers/gpu/drm/drm_gem_framebuffer_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_pt.o
  CC      drivers/gpu/drm/i915/gt/intel_ring.o
  CC      drivers/gpu/drm/drm_kms_helper_common.o
  CC      drivers/gpu/drm/i915/gt/intel_ring_submission.o
  CC [M]  drivers/gpu/drm/xe/xe_pt_walk.o
  CC      drivers/gpu/drm/drm_modeset_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_pxp.o
  AR      fs/built-in.a
  CC      drivers/gpu/drm/drm_plane_helper.o
  CC      drivers/gpu/drm/i915/gt/intel_rps.o
  CC [M]  drivers/gpu/drm/xe/xe_pxp_debugfs.o
  CC      drivers/gpu/drm/i915/gt/intel_sa_media.o
  CC [M]  drivers/gpu/drm/xe/xe_pxp_submit.o
  CC      drivers/gpu/drm/i915/gt/intel_sseu.o
  CC [M]  drivers/gpu/drm/xe/xe_query.o
  CC      drivers/gpu/drm/i915/gt/intel_sseu_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_range_fence.o
  CC      drivers/gpu/drm/drm_probe_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_sr.o
  CC      drivers/gpu/drm/i915/gt/intel_timeline.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_whitelist.o
  CC      drivers/gpu/drm/i915/gt/intel_tlb.o
  CC      drivers/gpu/drm/drm_self_refresh_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_ring_ops.o
  CC      drivers/gpu/drm/drm_simple_kms_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_rtp.o
  CC      drivers/gpu/drm/bridge/panel.o
  CC [M]  drivers/gpu/drm/xe/xe_sa.o
  CC      drivers/gpu/drm/drm_mipi_dsi.o
  CC [M]  drivers/gpu/drm/xe/xe_sched_job.o
  CC [M]  drivers/gpu/drm/xe/xe_shrinker.o
  CC      drivers/gpu/drm/i915/gt/intel_wopcm.o
  CC [M]  drivers/gpu/drm/drm_exec.o
  CC [M]  drivers/gpu/drm/drm_gpuvm.o
  CC [M]  drivers/gpu/drm/xe/xe_step.o
  CC [M]  drivers/gpu/drm/xe/xe_survivability_mode.o
  CC      drivers/gpu/drm/i915/gt/intel_workarounds.o
  CC [M]  drivers/gpu/drm/xe/xe_sync.o
  CC [M]  drivers/gpu/drm/drm_suballoc.o
  CC [M]  drivers/gpu/drm/xe/xe_tile.o
  CC      drivers/gpu/drm/i915/gt/shmem_utils.o
  CC [M]  drivers/gpu/drm/xe/xe_tile_sysfs.o
  CC [M]  drivers/gpu/drm/drm_gem_ttm_helper.o
  CC      drivers/gpu/drm/i915/gt/sysfs_engines.o
  CC [M]  drivers/gpu/drm/xe/xe_trace.o
  CC      drivers/gpu/drm/i915/gt/intel_ggtt_gmch.o
  CC      drivers/gpu/drm/i915/gt/gen6_renderstate.o
  CC [M]  drivers/gpu/drm/xe/xe_trace_bo.o
  CC [M]  drivers/gpu/drm/xe/xe_trace_guc.o
  CC      drivers/gpu/drm/i915/gt/gen7_renderstate.o
  CC [M]  drivers/gpu/drm/xe/xe_trace_lrc.o
  CC      drivers/gpu/drm/i915/gt/gen8_renderstate.o
  CC      drivers/gpu/drm/i915/gt/gen9_renderstate.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_busy.o
  LD [M]  drivers/gpu/drm/drm_suballoc_helper.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_clflush.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_sys_mgr.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_context.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_vram_mgr.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_create.o
  CC [M]  drivers/gpu/drm/xe/xe_tuning.o
  LD [M]  drivers/gpu/drm/drm_ttm_helper.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_dmabuf.o
  CC [M]  drivers/gpu/drm/xe/xe_uc.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_domain.o
  CC [M]  drivers/gpu/drm/xe/xe_uc_fw.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o
  CC [M]  drivers/gpu/drm/xe/xe_vm.o
  CC [M]  drivers/gpu/drm/xe/xe_vram.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_internal.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_lmem.o
  CC [M]  drivers/gpu/drm/xe/xe_vram_freq.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_mman.o
  CC [M]  drivers/gpu/drm/xe/xe_vsec.o
  CC [M]  drivers/gpu/drm/xe/xe_wa.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_object.o
  CC [M]  drivers/gpu/drm/xe/xe_wait_user_fence.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_pages.o
  CC [M]  drivers/gpu/drm/xe/xe_wopcm.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_phys.o
  CC [M]  drivers/gpu/drm/xe/xe_hmm.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_pm.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_region.o
  CC [M]  drivers/gpu/drm/xe/xe_hwmon.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_shmem.o
  CC [M]  drivers/gpu/drm/xe/xe_pmu.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_shrinker.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sriov_vf.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_stolen.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_relay.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_throttle.o
  CC [M]  drivers/gpu/drm/xe/xe_memirq.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_tiling.o
  CC [M]  drivers/gpu/drm/xe/xe_sriov.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_ttm.o
  CC [M]  drivers/gpu/drm/xe/xe_sriov_vf.o
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_irq.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_ttm_move.o
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_utils.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.o
  CC [M]  drivers/gpu/drm/xe/display/intel_bo.o
  CC [M]  drivers/gpu/drm/xe/display/intel_fb_bo.o
  CC [M]  drivers/gpu/drm/xe/display/intel_fbdev_fb.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_userptr.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_wait.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_misc.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_rpm.o
  CC      drivers/gpu/drm/i915/gem/i915_gemfs.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_rps.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_wa.o
  CC      drivers/gpu/drm/i915/i915_active.o
  CC      drivers/gpu/drm/i915/i915_cmd_parser.o
  CC [M]  drivers/gpu/drm/xe/display/xe_dsb_buffer.o
  CC [M]  drivers/gpu/drm/xe/display/xe_fb_pin.o
  CC      drivers/gpu/drm/i915/i915_deps.o
  CC [M]  drivers/gpu/drm/xe/display/xe_hdcp_gsc.o
  CC      drivers/gpu/drm/i915/i915_gem.o
  CC [M]  drivers/gpu/drm/xe/display/xe_plane_initial.o
  CC      drivers/gpu/drm/i915/i915_gem_evict.o
  CC [M]  drivers/gpu/drm/xe/display/xe_tdf.o
  CC      drivers/gpu/drm/i915/i915_gem_gtt.o
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_dram.o
  CC      drivers/gpu/drm/i915/i915_gem_ww.o
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_rom.o
  CC [M]  drivers/gpu/drm/xe/i915-display/icl_dsi.o
  CC      drivers/gpu/drm/i915/i915_query.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_alpm.o
  CC      drivers/gpu/drm/i915/i915_request.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic.o
  CC      drivers/gpu/drm/i915/i915_scheduler.o
  CC      drivers/gpu/drm/i915/i915_trace_points.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic_plane.o
  CC      drivers/gpu/drm/i915/i915_ttm_buddy_manager.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_audio.o
  CC      drivers/gpu/drm/i915/i915_vma.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_backlight.o
  CC      drivers/gpu/drm/i915/i915_vma_resource.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bios.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bw.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cdclk.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cmtg.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_color.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_combo_phy.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_connector.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_ads.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_capture.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc_state_dump.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cursor.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_ct.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_fw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cx0_phy.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_log.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi_buf_trans.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_rc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_conversion.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_device.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_submission.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_driver.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_huc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_irq.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_huc_fw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_params.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_uc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_map.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_well.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_trace.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_uc_fw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_wa.o
  CC      drivers/gpu/drm/i915/gt/intel_gsc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dkl_phy.o
  CC      drivers/gpu/drm/i915/i915_hwmon.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dmc.o
  CC      drivers/gpu/drm/i915/display/hsw_ips.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dmc_wl.o
  CC      drivers/gpu/drm/i915/display/i9xx_plane.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp.o
  CC      drivers/gpu/drm/i915/display/i9xx_display_sr.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_aux.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_aux_backlight.o
  CC      drivers/gpu/drm/i915/display/i9xx_wm.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_hdcp.o
  CC      drivers/gpu/drm/i915/display/intel_alpm.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_link_training.o
  CC      drivers/gpu/drm/i915/display/intel_atomic.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_mst.o
  CC      drivers/gpu/drm/i915/display/intel_atomic_plane.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_test.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpll.o
  CC      drivers/gpu/drm/i915/display/intel_audio.o
  CC      drivers/gpu/drm/i915/display/intel_bios.o
  CC      drivers/gpu/drm/i915/display/intel_bo.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpll_mgr.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpt_common.o
  CC      drivers/gpu/drm/i915/display/intel_bw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_drrs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsb.o
  CC      drivers/gpu/drm/i915/display/intel_cdclk.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi.o
  CC      drivers/gpu/drm/i915/display/intel_cmtg.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_dcs_backlight.o
  CC      drivers/gpu/drm/i915/display/intel_color.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_vbt.o
  CC      drivers/gpu/drm/i915/display/intel_combo_phy.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_encoder.o
  CC      drivers/gpu/drm/i915/display/intel_connector.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fb.o
  CC      drivers/gpu/drm/i915/display/intel_crtc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fbc.o
  CC      drivers/gpu/drm/i915/display/intel_crtc_state_dump.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fdi.o
  CC      drivers/gpu/drm/i915/display/intel_cursor.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fifo_underrun.o
  CC      drivers/gpu/drm/i915/display/intel_display.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_frontbuffer.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_global_state.o
  CC      drivers/gpu/drm/i915/display/intel_display_conversion.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_gmbus.o
  CC      drivers/gpu/drm/i915/display/intel_display_driver.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdcp.o
  CC      drivers/gpu/drm/i915/display/intel_display_irq.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdcp_gsc_message.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdmi.o
  CC      drivers/gpu/drm/i915/display/intel_display_params.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hotplug.o
  CC      drivers/gpu/drm/i915/display/intel_display_power.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hotplug_irq.o
  CC      drivers/gpu/drm/i915/display/intel_display_power_map.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hti.o
  CC      drivers/gpu/drm/i915/display/intel_display_power_well.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_link_bw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_lspcon.o
  CC      drivers/gpu/drm/i915/display/intel_display_reset.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_lock.o
  CC      drivers/gpu/drm/i915/display/intel_display_rpm.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_setup.o
  CC      drivers/gpu/drm/i915/display/intel_display_rps.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_verify.o
  CC      drivers/gpu/drm/i915/display/intel_display_snapshot.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_panel.o
  CC      drivers/gpu/drm/i915/display/intel_display_wa.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pfit.o
  CC      drivers/gpu/drm/i915/display/intel_dmc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pmdemand.o
  CC      drivers/gpu/drm/i915/display/intel_dmc_wl.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pch.o
  CC      drivers/gpu/drm/i915/display/intel_dpio_phy.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pps.o
  CC      drivers/gpu/drm/i915/display/intel_dpll.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_psr.o
  CC      drivers/gpu/drm/i915/display/intel_dpll_mgr.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_qp_tables.o
  CC      drivers/gpu/drm/i915/display/intel_dpt.o
  CC      drivers/gpu/drm/i915/display/intel_dpt_common.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_quirks.o
  CC      drivers/gpu/drm/i915/display/intel_drrs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_snps_hdmi_pll.o
  CC      drivers/gpu/drm/i915/display/intel_dsb.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_snps_phy.o
  CC      drivers/gpu/drm/i915/display/intel_dsb_buffer.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_tc.o
  CC      drivers/gpu/drm/i915/display/intel_fb.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vblank.o
  CC      drivers/gpu/drm/i915/display/intel_fb_bo.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vdsc.o
  CC      drivers/gpu/drm/i915/display/intel_fb_pin.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vga.o
  CC      drivers/gpu/drm/i915/display/intel_fbc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vrr.o
  CC      drivers/gpu/drm/i915/display/intel_fdi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_wm.o
  CC      drivers/gpu/drm/i915/display/intel_fifo_underrun.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_scaler.o
  CC      drivers/gpu/drm/i915/display/intel_frontbuffer.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_universal_plane.o
  CC      drivers/gpu/drm/i915/display/intel_global_state.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_watermark.o
  CC      drivers/gpu/drm/i915/display/intel_hdcp.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_acpi.o
  CC      drivers/gpu/drm/i915/display/intel_hdcp_gsc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_opregion.o
  CC      drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.o
  CC [M]  drivers/gpu/drm/xe/xe_debugfs.o
  CC      drivers/gpu/drm/i915/display/intel_hotplug.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_debugfs.o
  CC      drivers/gpu/drm/i915/display/intel_hotplug_irq.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.o
  CC      drivers/gpu/drm/i915/display/intel_hti.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_stats.o
  CC      drivers/gpu/drm/i915/display/intel_link_bw.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_debugfs.o
  CC      drivers/gpu/drm/i915/display/intel_load_detect.o
  CC [M]  drivers/gpu/drm/xe/xe_huc_debugfs.o
  CC      drivers/gpu/drm/i915/display/intel_lpe_audio.o
  CC [M]  drivers/gpu/drm/xe/xe_uc_debugfs.o
  CC      drivers/gpu/drm/i915/display/intel_modeset_lock.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs.o
  CC      drivers/gpu/drm/i915/display/intel_modeset_setup.o
  CC      drivers/gpu/drm/i915/display/intel_modeset_verify.o
  CC      drivers/gpu/drm/i915/display/intel_overlay.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs_params.o
  CC      drivers/gpu/drm/i915/display/intel_pch.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pipe_crc.o
  CC      drivers/gpu/drm/i915/display/intel_pch_display.o
  CC      drivers/gpu/drm/i915/display/intel_pch_refclk.o
  CC      drivers/gpu/drm/i915/display/intel_plane_initial.o
  CC      drivers/gpu/drm/i915/display/intel_pmdemand.o
  CC      drivers/gpu/drm/i915/display/intel_psr.o
  CC      drivers/gpu/drm/i915/display/intel_quirks.o
  CC      drivers/gpu/drm/i915/display/intel_sprite.o
  CC      drivers/gpu/drm/i915/display/intel_sprite_uapi.o
  CC      drivers/gpu/drm/i915/display/intel_tc.o
  CC      drivers/gpu/drm/i915/display/intel_vblank.o
  CC      drivers/gpu/drm/i915/display/intel_vga.o
  CC      drivers/gpu/drm/i915/display/intel_wm.o
  CC      drivers/gpu/drm/i915/display/skl_scaler.o
  CC      drivers/gpu/drm/i915/display/skl_universal_plane.o
  CC      drivers/gpu/drm/i915/display/skl_watermark.o
  CC      drivers/gpu/drm/i915/display/intel_acpi.o
  CC      drivers/gpu/drm/i915/display/intel_opregion.o
  CC      drivers/gpu/drm/i915/display/intel_display_debugfs.o
  CC      drivers/gpu/drm/i915/display/intel_display_debugfs_params.o
  CC      drivers/gpu/drm/i915/display/intel_pipe_crc.o
  CC      drivers/gpu/drm/i915/display/dvo_ch7017.o
  CC      drivers/gpu/drm/i915/display/dvo_ch7xxx.o
  CC      drivers/gpu/drm/i915/display/dvo_ivch.o
  CC      drivers/gpu/drm/i915/display/dvo_ns2501.o
  CC      drivers/gpu/drm/i915/display/dvo_sil164.o
  CC      drivers/gpu/drm/i915/display/dvo_tfp410.o
  CC      drivers/gpu/drm/i915/display/g4x_dp.o
  CC      drivers/gpu/drm/i915/display/g4x_hdmi.o
  CC      drivers/gpu/drm/i915/display/icl_dsi.o
  CC      drivers/gpu/drm/i915/display/intel_backlight.o
  CC      drivers/gpu/drm/i915/display/intel_crt.o
  LD [M]  drivers/gpu/drm/xe/xe.o
  CC      drivers/gpu/drm/i915/display/intel_cx0_phy.o
  CC      drivers/gpu/drm/i915/display/intel_ddi.o
  CC      drivers/gpu/drm/i915/display/intel_ddi_buf_trans.o
  CC      drivers/gpu/drm/i915/display/intel_display_device.o
  CC      drivers/gpu/drm/i915/display/intel_display_trace.o
  CC      drivers/gpu/drm/i915/display/intel_dkl_phy.o
  CC      drivers/gpu/drm/i915/display/intel_dp.o
  CC      drivers/gpu/drm/i915/display/intel_dp_aux.o
  CC      drivers/gpu/drm/i915/display/intel_dp_aux_backlight.o
  CC      drivers/gpu/drm/i915/display/intel_dp_hdcp.o
  CC      drivers/gpu/drm/i915/display/intel_dp_link_training.o
  CC      drivers/gpu/drm/i915/display/intel_dp_test.o
  CC      drivers/gpu/drm/i915/display/intel_dp_mst.o
  CC      drivers/gpu/drm/i915/display/intel_dsi.o
  CC      drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.o
  CC      drivers/gpu/drm/i915/display/intel_dsi_vbt.o
  CC      drivers/gpu/drm/i915/display/intel_dvo.o
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
  AR      drivers/gpu/drm/i915/built-in.a
  AR      drivers/gpu/drm/built-in.a
  AR      drivers/gpu/built-in.a
make[2]: *** [/workspace/kernel/scripts/Makefile.build:461: drivers] Error 2
make[1]: *** [/workspace/kernel/Makefile:2011: .] Error 2
make: *** [/workspace/kernel/Makefile:248: __sub-make] Error 2
run-parts: /workspace/ci/hooks/11-build-32b exited with return code 2


