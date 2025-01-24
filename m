Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F22C02181
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 17:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE30010E9DA;
	Fri, 24 Jan 2025 17:05:43 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F71C10E100;
 Fri, 24 Jan 2025 17:05:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_drm/i915=3A_intel=5Fdisplay_co?=
 =?utf-8?q?nversions_and_some_debug_improvements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Jan 2025 17:05:42 -0000
Message-ID: <173773834264.4032717.7124391312525786271@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250124163040.8886-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250124163040.8886-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: intel_display conversions and some debug improvements
URL   : https://patchwork.freedesktop.org/series/143941/
State : failure

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
+ grep -Ei '(^|\W)CI_'
+ export
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
mkdir -p /workspace/kernel/build64-default/tools/objtool && make O=/workspace/kernel/build64-default subdir=tools/objtool --no-print-directory -C objtool 
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
  CC      /workspace/kernel/build64-default/tools/objtool/builtin-check.o
  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/special.o
  CC      /workspace/kernel/build64-default/tools/objtool/elf.o
  CC      /workspace/kernel/build64-default/tools/objtool/objtool.o
  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/decode.o
  CC      /workspace/kernel/build64-default/tools/objtool/orc_gen.o
  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/orc.o
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

Value requested for CONFIG_HAVE_FUNCTION_GRAPH_RETVAL not in final .config
Requested value:  CONFIG_HAVE_FUNCTION_GRAPH_RETVAL=y
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
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/x86/include/generated/uapi/asm/errno.h
  UPD     include/generated/uapi/linux/version.h
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
  UPD     include/generated/compile.h
  HOSTCC  arch/x86/tools/relocs_32.o
  HOSTCC  scripts/kallsyms
  WRAP    arch/x86/include/generated/asm/early_ioremap.h
  HOSTCC  arch/x86/tools/relocs_64.o
  HOSTCC  arch/x86/tools/relocs_common.o
  HOSTCC  scripts/sorttable
  HOSTCC  scripts/asn1_compiler
  WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
  HOSTCC  scripts/selinux/mdp/mdp
  WRAP    arch/x86/include/generated/asm/mmzone.h
  WRAP    arch/x86/include/generated/asm/irq_regs.h
  WRAP    arch/x86/include/generated/asm/kmap_size.h
  WRAP    arch/x86/include/generated/asm/mmiowb.h
  WRAP    arch/x86/include/generated/asm/module.lds.h
  WRAP    arch/x86/include/generated/asm/local64.h
  WRAP    arch/x86/include/generated/asm/rwonce.h
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
  CC      certs/system_keyring.o
  CC      init/do_mounts.o
  UPD     init/utsversion-tmp.h
  CC      mm/filemap.o
  CC      init/do_mounts_initrd.o
  CC      ipc/util.o
  CC      init/initramfs.o
  CC      ipc/msgutil.o
  CC      mm/mempool.o
  CC      security/commoncap.o
  CC      init/calibrate.o
  CC      ipc/msg.o
  CC      io_uring/io_uring.o
  CC      mm/oom_kill.o
  AS      arch/x86/entry/entry.o
  AS      arch/x86/lib/atomic64_cx8_32.o
  CC      ipc/sem.o
  CC      arch/x86/realmode/init.o
  CC      io_uring/opdef.o
  CC      security/lsm_syscalls.o
  AS      arch/x86/lib/checksum_32.o
  AR      arch/x86/crypto/built-in.a
  CC      security/keys/gc.o
  AR      arch/x86/net/built-in.a
  HOSTCC  security/selinux/genheaders
  CC      arch/x86/video/video-common.o
  CC      arch/x86/power/cpu.o
  CC      security/integrity/iint.o
  AR      arch/x86/entry/vsyscall/built-in.a
  CC      arch/x86/pci/i386.o
  CC      fs/nfs_common/nfsacl.o
  CC      arch/x86/events/amd/core.o
  CC      block/partitions/core.o
  CC      arch/x86/mm/pat/set_memory.o
  CC      fs/iomap/trace.o
  AR      arch/x86/platform/atom/built-in.a
  AR      virt/lib/built-in.a
  CC      arch/x86/virt/svm/cmdline.o
  CC      lib/math/div64.o
  AR      drivers/cache/built-in.a
  CC      fs/notify/dnotify/dnotify.o
  CC      io_uring/kbuf.o
  CC      net/core/sock.o
  AR      virt/built-in.a
  CC      arch/x86/kernel/fpu/init.o
  AR      arch/x86/virt/vmx/built-in.a
  CC      sound/core/seq/seq.o
  AR      drivers/irqchip/built-in.a
  HOSTCC  certs/extract-cert
  CC      arch/x86/entry/vdso/vma.o
  CC      arch/x86/lib/cmdline.o
  AR      arch/x86/platform/ce4100/built-in.a
  CC      arch/x86/events/zhaoxin/core.o
  CC      arch/x86/events/intel/core.o
  CC      sound/core/seq/seq_lock.o
  CC      net/ethernet/eth.o
  AR      drivers/bus/mhi/built-in.a
  CC      arch/x86/platform/efi/memmap.o
  CC      kernel/sched/core.o
  AR      drivers/bus/built-in.a
  CC      crypto/asymmetric_keys/asymmetric_type.o
  AR      drivers/pwm/built-in.a
  AR      arch/x86/virt/svm/built-in.a
  AR      drivers/leds/trigger/built-in.a
  AR      arch/x86/virt/built-in.a
  AS      arch/x86/lib/cmpxchg8b_emu.o
  AR      drivers/leds/blink/built-in.a
  AR      drivers/leds/simple/built-in.a
  CC      arch/x86/lib/cpu.o
  CC      drivers/leds/led-core.o
  CC      lib/math/gcd.o
  CC      arch/x86/kernel/cpu/mce/core.o
  GEN     security/selinux/flask.h security/selinux/av_permissions.h
  CC      security/selinux/avc.o
  CC      lib/math/lcm.o
  CC      lib/math/int_log.o
  CC      arch/x86/kernel/cpu/mtrr/mtrr.o
  CC      security/selinux/hooks.o
  GEN     usr/initramfs_data.cpio
  COPY    usr/initramfs_inc_data
  CERT    certs/x509_certificate_list
  AS      usr/initramfs_data.o
  CC      lib/math/int_pow.o
  CERT    certs/signing_key.x509
  CC      arch/x86/kernel/fpu/bugs.o
  AS      certs/system_certificates.o
  AR      usr/built-in.a
  AR      certs/built-in.a
  CC      arch/x86/platform/efi/quirks.o
  CC      arch/x86/platform/efi/efi.o
  CC      arch/x86/kernel/cpu/mtrr/if.o
  CC      lib/math/int_sqrt.o
  CC      arch/x86/kernel/fpu/core.o
  CC      arch/x86/lib/delay.o
  CC      sound/core/seq/seq_clientmgr.o
  AS      arch/x86/realmode/rm/header.o
  CC      lib/math/reciprocal_div.o
  AS      arch/x86/realmode/rm/trampoline_32.o
  AR      arch/x86/video/built-in.a
  CC      arch/x86/kernel/cpu/mtrr/generic.o
  AS      arch/x86/realmode/rm/stack.o
  CC      lib/math/rational.o
  AS      arch/x86/realmode/rm/reboot.o
  CC      security/integrity/integrity_audit.o
  CC      fs/nfs_common/grace.o
  AS      arch/x86/realmode/rm/wakeup_asm.o
  CC      kernel/sched/fair.o
  CC      crypto/asymmetric_keys/restrict.o
  CC      arch/x86/realmode/rm/wakemain.o
  CC      arch/x86/realmode/rm/video-mode.o
  CC      arch/x86/kernel/cpu/mce/severity.o
  CC      arch/x86/entry/vdso/extable.o
  CC      security/keys/key.o
  AR      fs/notify/dnotify/built-in.a
  CC      arch/x86/pci/init.o
  CC      fs/notify/inotify/inotify_fsnotify.o
  CC      security/selinux/selinuxfs.o
  CC      drivers/leds/led-class.o
  CC      block/bdev.o
  CC      sound/core/sound.o
  AS      arch/x86/lib/getuser.o
  GEN     arch/x86/lib/inat-tables.c
  CC      arch/x86/power/hibernate_32.o
  AS      arch/x86/realmode/rm/copy.o
  AS      arch/x86/entry/entry_32.o
  CC      arch/x86/lib/insn-eval.o
  CC      block/partitions/msdos.o
  AS      arch/x86/realmode/rm/bioscall.o
  CC      arch/x86/realmode/rm/regs.o
  CC      sound/core/seq/seq_memory.o
  AR      arch/x86/events/zhaoxin/built-in.a
  CC      security/min_addr.o
  CC      sound/core/seq/seq_queue.o
  CC      arch/x86/realmode/rm/video-vga.o
  CC      crypto/asymmetric_keys/signature.o
  AR      lib/math/built-in.a
  CC      lib/crypto/mpi/generic_mpih-lshift.o
  CC      security/keys/keyring.o
  CC      crypto/asymmetric_keys/public_key.o
  CC      arch/x86/realmode/rm/video-vesa.o
  ASN.1   crypto/asymmetric_keys/x509.asn1.[ch]
  CC      sound/core/seq/seq_fifo.o
  CC      sound/core/seq/seq_prioq.o
  CC      sound/core/seq/seq_timer.o
  CC      arch/x86/events/amd/lbr.o
  CC      arch/x86/realmode/rm/video-bios.o
  CC      sound/core/init.o
  CC      fs/iomap/iter.o
  CC      block/fops.o
  PASYMS  arch/x86/realmode/rm/pasyms.h
  LDS     arch/x86/realmode/rm/realmode.lds
  CC      fs/notify/inotify/inotify_user.o
  CC      drivers/leds/led-triggers.o
  LD      arch/x86/realmode/rm/realmode.elf
  RELOCS  arch/x86/realmode/rm/realmode.relocs
  OBJCOPY arch/x86/realmode/rm/realmode.bin
  AS      arch/x86/realmode/rmpiggy.o
  CC      block/bio.o
  CC      arch/x86/platform/efi/efi_32.o
  AR      arch/x86/realmode/built-in.a
  AR      net/ethernet/built-in.a
  CC      arch/x86/kernel/cpu/mtrr/cleanup.o
  CC      block/elevator.o
  AR      security/integrity/built-in.a
  CC      fs/nfs_common/common.o
  CC      arch/x86/mm/pat/memtype.o
  CC      arch/x86/pci/pcbios.o
  LDS     arch/x86/entry/vdso/vdso32/vdso32.lds
  CC      block/blk-core.o
  CC      block/blk-sysfs.o
  CC      init/init_task.o
  AS      arch/x86/entry/vdso/vdso32/note.o
  AS      arch/x86/entry/vdso/vdso32/system_call.o
  CC      fs/proc/task_mmu.o
  CC      fs/quota/dquot.o
  CC      block/blk-flush.o
  AS      arch/x86/entry/vdso/vdso32/sigreturn.o
  CC      arch/x86/entry/vdso/vdso32/vclock_gettime.o
  AS      arch/x86/power/hibernate_asm_32.o
  CC      lib/crypto/mpi/generic_mpih-mul1.o
  CC      arch/x86/power/hibernate.o
  CC      arch/x86/entry/vdso/vdso32/vgetcpu.o
  CC      arch/x86/kernel/fpu/regset.o
  CC      block/blk-settings.o
  HOSTCC  arch/x86/entry/vdso/vdso2c
  CC      ipc/shm.o
  CC      fs/quota/quota_v2.o
  CC      block/partitions/efi.o
  CC      arch/x86/lib/insn.o
  CC      arch/x86/lib/kaslr.o
  CC      crypto/api.o
  ASN.1   crypto/asymmetric_keys/x509_akid.asn1.[ch]
  CC      arch/x86/lib/memcpy_32.o
  CC      crypto/asymmetric_keys/x509_loader.o
  CC      io_uring/rsrc.o
  CC      arch/x86/kernel/cpu/mtrr/amd.o
  CC      ipc/syscall.o
  CC      ipc/ipc_sysctl.o
  CC      sound/core/seq/seq_system.o
  CC      block/blk-ioc.o
  CC      fs/iomap/buffered-io.o
  CC      arch/x86/kernel/cpu/mce/genpool.o
  CC      crypto/asymmetric_keys/x509_public_key.o
  AR      drivers/leds/built-in.a
  CC      arch/x86/pci/mmconfig_32.o
  CC      sound/core/seq/seq_ports.o
  CC      drivers/pci/msi/pcidev_msi.o
  AS      arch/x86/lib/memmove_32.o
  CC      arch/x86/events/amd/ibs.o
  AR      fs/nfs_common/built-in.a
  CC      arch/x86/lib/misc.o
  CC      sound/core/seq/seq_info.o
  AS      arch/x86/platform/efi/efi_stub_32.o
  CC      fs/iomap/direct-io.o
  CC      arch/x86/platform/efi/runtime-map.o
  CC      arch/x86/lib/pc-conf-reg.o
  AR      net/802/built-in.a
  ASN.1   crypto/asymmetric_keys/pkcs7.asn1.[ch]
  CC      arch/x86/events/amd/uncore.o
  CC      drivers/pci/pcie/portdrv.o
  CC      init/version.o
  CC      lib/crypto/mpi/generic_mpih-mul2.o
  AR      fs/notify/inotify/built-in.a
  CC      arch/x86/entry/vdso/vdso32-setup.o
  AR      fs/notify/fanotify/built-in.a
  CC      security/keys/keyctl.o
  CC      fs/notify/fsnotify.o
  CC      arch/x86/mm/pat/memtype_interval.o
  CC      ipc/mqueue.o
  AS      arch/x86/lib/putuser.o
  AR      arch/x86/power/built-in.a
  CC      arch/x86/kernel/cpu/mtrr/cyrix.o
  AR      drivers/pci/pwrctrl/built-in.a
  CC      drivers/pci/msi/api.o
  AS      arch/x86/lib/retpoline.o
  AR      init/built-in.a
  CC      arch/x86/kernel/cpu/mtrr/centaur.o
  CC      drivers/pci/hotplug/pci_hotplug_core.o
  CC      arch/x86/lib/string_32.o
  CC      kernel/locking/mutex.o
  CC      drivers/pci/msi/msi.o
  CC      drivers/pci/msi/irqdomain.o
  CC      arch/x86/kernel/fpu/signal.o
  CC      arch/x86/lib/strstr_32.o
  CC      fs/notify/notification.o
  CC      arch/x86/lib/usercopy.o
  CC      mm/fadvise.o
  CC      lib/crypto/memneq.o
  VDSO    arch/x86/entry/vdso/vdso32.so.dbg
  AR      drivers/pci/switch/built-in.a
  AR      drivers/pci/controller/dwc/built-in.a
  CC      crypto/asymmetric_keys/pkcs7_trust.o
  CC      arch/x86/kernel/cpu/mce/intel.o
  CC      drivers/pci/hotplug/acpi_pcihp.o
  AR      drivers/pci/controller/mobiveil/built-in.a
  OBJCOPY arch/x86/entry/vdso/vdso32.so
  VDSO2C  arch/x86/entry/vdso/vdso-image-32.c
  CC      security/keys/permission.o
  CC      arch/x86/entry/vdso/vdso-image-32.o
  AR      drivers/pci/controller/plda/built-in.a
  AR      drivers/pci/controller/built-in.a
  CC      fs/iomap/fiemap.o
  AR      block/partitions/built-in.a
  CC      security/security.o
  CC      kernel/sched/build_policy.o
  CC      fs/quota/quota_tree.o
  CC      arch/x86/pci/direct.o
  CC      arch/x86/mm/init.o
  CC      lib/crypto/mpi/generic_mpih-mul3.o
  CC      arch/x86/lib/usercopy_32.o
  CC      sound/core/seq/seq_dummy.o
  AR      arch/x86/entry/vdso/built-in.a
  CC      arch/x86/entry/syscall_32.o
  AR      arch/x86/mm/pat/built-in.a
  CC      arch/x86/entry/common.o
  CC      drivers/pci/access.o
  CC      arch/x86/kernel/cpu/mtrr/legacy.o
  AR      arch/x86/platform/geode/built-in.a
  AR      arch/x86/platform/efi/built-in.a
  CC      crypto/asymmetric_keys/pkcs7_verify.o
  CC      drivers/pci/pcie/rcec.o
  AR      arch/x86/platform/iris/built-in.a
  CC      drivers/video/console/dummycon.o
  CC      drivers/video/backlight/backlight.o
  CC      arch/x86/kernel/cpu/microcode/core.o
  CC      arch/x86/platform/intel/iosf_mbi.o
  CC      arch/x86/events/intel/bts.o
  CC      drivers/video/console/vgacon.o
  CC      net/core/request_sock.o
  CC      arch/x86/lib/msr-smp.o
  CC      arch/x86/kernel/cpu/microcode/intel.o
  CC      arch/x86/kernel/acpi/boot.o
  CC      arch/x86/kernel/cpu/mce/amd.o
  CC      fs/notify/group.o
  CC      arch/x86/kernel/apic/apic.o
  CC      fs/quota/quota.o
  CC      kernel/power/qos.o
  AR      arch/x86/events/amd/built-in.a
  CC      fs/iomap/seek.o
  AR      arch/x86/platform/intel-mid/built-in.a
  CC      mm/maccess.o
  CC      fs/proc/inode.o
  AR      arch/x86/platform/intel-quark/built-in.a
  CC      arch/x86/lib/cache-smp.o
  AR      arch/x86/kernel/cpu/mtrr/built-in.a
  CC      mm/page-writeback.o
  CC      arch/x86/kernel/kprobes/core.o
  AR      drivers/video/fbdev/core/built-in.a
  AR      drivers/pci/hotplug/built-in.a
  CC      arch/x86/kernel/kprobes/opt.o
  CC      arch/x86/kernel/fpu/xstate.o
  CC      kernel/locking/semaphore.o
  AR      drivers/video/fbdev/omap/built-in.a
  CC      arch/x86/pci/mmconfig-shared.o
  AR      drivers/video/fbdev/omap2/omapfb/dss/built-in.a
  CC      crypto/asymmetric_keys/x509.asn1.o
  CC      lib/crypto/mpi/generic_mpih-rshift.o
  AR      drivers/video/fbdev/omap2/omapfb/displays/built-in.a
  AR      drivers/video/fbdev/omap2/omapfb/built-in.a
  AR      drivers/pci/msi/built-in.a
  CC      crypto/asymmetric_keys/x509_akid.asn1.o
  CC      crypto/asymmetric_keys/x509_cert_parser.o
  CC      kernel/power/main.o
  AR      drivers/video/fbdev/omap2/built-in.a
  AR      drivers/video/fbdev/built-in.a
  CC      kernel/locking/rwsem.o
  CC      kernel/locking/percpu-rwsem.o
  CC      block/blk-map.o
  CC      security/keys/process_keys.o
  CC      arch/x86/lib/msr.o
  AR      sound/core/seq/built-in.a
  CC      sound/core/memory.o
  CC      drivers/pci/bus.o
  CC      security/selinux/netlink.o
  CC      arch/x86/pci/fixup.o
  CC      drivers/pci/pcie/bwctrl.o
  CC      kernel/sched/build_utility.o
  AR      arch/x86/platform/intel/built-in.a
  CC      drivers/pci/pcie/aspm.o
  CC      arch/x86/kernel/cpu/microcode/amd.o
  CC      arch/x86/kernel/cpu/mce/threshold.o
  AR      arch/x86/platform/olpc/built-in.a
  CC      arch/x86/mm/init_32.o
  AR      arch/x86/platform/scx200/built-in.a
  AR      arch/x86/platform/ts5500/built-in.a
  AR      arch/x86/platform/uv/built-in.a
  AR      arch/x86/platform/built-in.a
  AR      drivers/video/backlight/built-in.a
  CC      ipc/namespace.o
  AR      sound/i2c/other/built-in.a
  AR      sound/i2c/built-in.a
  CC      arch/x86/events/core.o
  CC      fs/notify/mark.o
  CC      fs/kernfs/mount.o
  AS      arch/x86/entry/thunk.o
  CC      io_uring/notif.o
  AS      arch/x86/lib/msr-reg.o
  AR      arch/x86/entry/built-in.a
  CC      fs/kernfs/inode.o
  CC      fs/iomap/swapfile.o
  CC      ipc/mq_sysctl.o
  CC      fs/kernfs/dir.o
  CC      arch/x86/events/intel/ds.o
  CC      lib/crypto/mpi/generic_mpih-sub1.o
  CC      crypto/asymmetric_keys/pkcs7.asn1.o
  CC      arch/x86/events/intel/knc.o
  CC      arch/x86/lib/msr-reg-export.o
  CC      crypto/asymmetric_keys/pkcs7_parser.o
  CC      security/lsm_audit.o
  CC      fs/proc/root.o
  AR      drivers/video/console/built-in.a
  CC      drivers/video/aperture.o
  CC      net/core/skbuff.o
  CC      sound/core/control.o
  LDS     arch/x86/kernel/vmlinux.lds
  CC      kernel/power/console.o
  AS      arch/x86/kernel/head_32.o
  CC      kernel/locking/spinlock.o
  CC      kernel/power/process.o
  AR      arch/x86/kernel/kprobes/built-in.a
  CC      lib/zlib_inflate/inffast.o
  CC      kernel/power/suspend.o
  CC      arch/x86/kernel/acpi/sleep.o
  AS      arch/x86/lib/hweight.o
  CC      lib/zlib_inflate/inflate.o
  CC      kernel/power/hibernate.o
  CC      arch/x86/lib/iomem.o
  CC      kernel/locking/osq_lock.o
  CC      drivers/pci/probe.o
  CC      kernel/locking/qspinlock.o
  CC      security/selinux/nlmsgtab.o
  CC      fs/quota/kqid.o
  AR      ipc/built-in.a
  AR      sound/drivers/opl3/built-in.a
  CC      block/blk-merge.o
  AR      sound/drivers/opl4/built-in.a
  AR      sound/drivers/vx/built-in.a
  AR      sound/drivers/mpu401/built-in.a
  AR      sound/isa/ad1816a/built-in.a
  AR      sound/drivers/pcsp/built-in.a
  AR      sound/pci/ac97/built-in.a
  AR      sound/drivers/built-in.a
  AR      sound/isa/ad1848/built-in.a
  CC      security/keys/request_key.o
  AR      sound/isa/cs423x/built-in.a
  CC      security/device_cgroup.o
  AR      sound/pci/ali5451/built-in.a
  CC      arch/x86/pci/acpi.o
  AR      sound/isa/es1688/built-in.a
  AR      sound/pci/asihpi/built-in.a
  AR      sound/isa/galaxy/built-in.a
  AR      arch/x86/kernel/fpu/built-in.a
  CC      arch/x86/events/intel/lbr.o
  AR      sound/pci/au88x0/built-in.a
  AR      sound/isa/gus/built-in.a
  AR      sound/isa/msnd/built-in.a
  AR      sound/pci/aw2/built-in.a
  AR      sound/isa/opti9xx/built-in.a
  AR      sound/pci/ctxfi/built-in.a
  AR      sound/isa/sb/built-in.a
  CC      arch/x86/kernel/apic/apic_common.o
  AR      sound/pci/ca0106/built-in.a
  CC      lib/crypto/mpi/generic_mpih-add1.o
  AR      crypto/asymmetric_keys/built-in.a
  AR      sound/isa/wavefront/built-in.a
  AR      sound/pci/cs46xx/built-in.a
  CC      crypto/cipher.o
  CC      arch/x86/pci/legacy.o
  AR      sound/pci/cs5535audio/built-in.a
  AR      sound/isa/wss/built-in.a
  AR      sound/pci/lola/built-in.a
  AR      sound/isa/built-in.a
  AR      sound/pci/lx6464es/built-in.a
  AR      arch/x86/kernel/cpu/microcode/built-in.a
  AR      sound/pci/echoaudio/built-in.a
  AR      sound/pci/emu10k1/built-in.a
  CC      kernel/printk/printk.o
  CC      fs/proc/base.o
  CC      fs/sysfs/file.o
  CC      sound/pci/hda/hda_bind.o
  AR      fs/iomap/built-in.a
  CC      arch/x86/lib/atomic64_32.o
  CC      arch/x86/mm/fault.o
  CC      fs/quota/netlink.o
  CC      arch/x86/kernel/head32.o
  CC      arch/x86/kernel/ebda.o
  CC      arch/x86/lib/inat.o
  CC      fs/notify/fdinfo.o
  AR      arch/x86/lib/built-in.a
  CC      fs/proc/generic.o
  CC      mm/folio-compat.o
  CC      kernel/locking/rtmutex_api.o
  AR      arch/x86/kernel/cpu/mce/built-in.a
  CC      arch/x86/kernel/cpu/cacheinfo.o
  CC      kernel/locking/qrwlock.o
  AR      arch/x86/lib/lib.a
  CC      drivers/video/cmdline.o
  CC      arch/x86/pci/irq.o
  CC      arch/x86/pci/common.o
  CC      fs/proc/array.o
  AS      arch/x86/kernel/acpi/wakeup_32.o
  CC      lib/zlib_inflate/infutil.o
  CC      net/sched/sch_generic.o
  CC      drivers/pci/pcie/pme.o
  CC      arch/x86/kernel/acpi/cstate.o
  CC      arch/x86/kernel/apic/apic_noop.o
  CC      io_uring/tctx.o
  CC      net/netlink/af_netlink.o
  CC      lib/crypto/mpi/mpicoder.o
  CC      fs/kernfs/file.o
  CC      crypto/compress.o
  AR      net/bpf/built-in.a
  CC      net/netlink/genetlink.o
  CC      fs/sysfs/dir.o
  AR      sound/ppc/built-in.a
  CC      security/keys/request_key_auth.o
  CC      block/blk-timeout.o
  CC      lib/zlib_inflate/inftrees.o
  CC      block/blk-lib.o
  CC      sound/core/misc.o
  AR      sound/pci/ice1712/built-in.a
  CC      arch/x86/events/probe.o
  CC      arch/x86/pci/early.o
  CC      lib/zlib_deflate/deflate.o
  CC      security/selinux/netif.o
  CC      kernel/power/snapshot.o
  CC      sound/pci/hda/hda_codec.o
  AR      fs/notify/built-in.a
  CC      lib/zlib_deflate/deftree.o
  CC      net/sched/sch_mq.o
  CC      kernel/irq/irqdesc.o
  CC      lib/zlib_inflate/inflate_syms.o
  CC      arch/x86/kernel/apic/ipi.o
  AR      fs/quota/built-in.a
  CC      kernel/irq/handle.o
  AR      arch/x86/kernel/acpi/built-in.a
  AR      drivers/idle/built-in.a
  CC      security/selinux/netnode.o
  CC      io_uring/filetable.o
  CC      arch/x86/events/intel/p4.o
  CC      mm/readahead.o
  CC      arch/x86/mm/ioremap.o
  CC      drivers/video/nomodeset.o
  CC      kernel/irq/manage.o
  CC      lib/crypto/mpi/mpi-add.o
  CC      drivers/pci/host-bridge.o
  AR      drivers/pci/pcie/built-in.a
  CC      kernel/printk/printk_safe.o
  AR      lib/zlib_inflate/built-in.a
  CC      mm/swap.o
  AR      kernel/locking/built-in.a
  CC      crypto/algapi.o
  CC      arch/x86/events/intel/p6.o
  AR      sound/pci/korg1212/built-in.a
  CC      sound/core/device.o
  CC      arch/x86/kernel/cpu/scattered.o
  CC      fs/sysfs/symlink.o
  CC      io_uring/rw.o
  CC      kernel/printk/nbcon.o
  CC      mm/truncate.o
  CC      kernel/rcu/update.o
  CC      kernel/rcu/sync.o
  CC      security/keys/user_defined.o
  CC      drivers/video/hdmi.o
  CC      crypto/scatterwalk.o
  CC      fs/devpts/inode.o
  CC      net/ethtool/ioctl.o
  CC      lib/zlib_deflate/deflate_syms.o
  CC      security/keys/proc.o
  CC      net/ethtool/common.o
  CC      drivers/pci/remove.o
  CC      arch/x86/events/utils.o
  CC      arch/x86/pci/bus_numa.o
  CC      block/blk-mq.o
  CC      arch/x86/kernel/apic/vector.o
  CC      arch/x86/kernel/apic/init.o
  CC      lib/lzo/lzo1x_compress.o
  CC      lib/crypto/mpi/mpi-bit.o
  CC      fs/kernfs/symlink.o
  CC      arch/x86/kernel/cpu/topology_common.o
  CC      lib/lzo/lzo1x_decompress_safe.o
  CC      sound/core/info.o
  AR      lib/zlib_deflate/built-in.a
  CC      arch/x86/pci/amd_bus.o
  CC      arch/x86/kernel/apic/hw_nmi.o
  CC      net/core/datagram.o
  CC      kernel/power/swap.o
  CC      mm/vmscan.o
  CC      lib/crypto/utils.o
  CC      arch/x86/mm/extable.o
  CC      fs/sysfs/mount.o
  CC      fs/proc/fd.o
  CC      arch/x86/events/intel/pt.o
  CC      lib/crypto/chacha.o
  CC      kernel/rcu/srcutree.o
  CC      sound/pci/hda/hda_jack.o
  AR      kernel/livepatch/built-in.a
  CC      fs/sysfs/group.o
  CC      kernel/dma/mapping.o
  CC      security/keys/sysctl.o
  CC      drivers/pci/pci.o
  CC      net/netfilter/core.o
  CC      security/selinux/netport.o
  CC      arch/x86/kernel/platform-quirks.o
  AR      fs/devpts/built-in.a
  CC      arch/x86/kernel/cpu/topology_ext.o
  CC      arch/x86/kernel/cpu/topology_amd.o
  AR      lib/lzo/built-in.a
  CC      kernel/rcu/tree.o
  CC      arch/x86/events/rapl.o
  CC      net/netfilter/nf_log.o
  CC      kernel/rcu/rcu_segcblist.o
  CC      lib/crypto/mpi/mpi-cmp.o
  AR      drivers/video/built-in.a
  CC      kernel/entry/common.o
  CC      security/selinux/status.o
  CC      io_uring/net.o
  CC      kernel/printk/printk_ringbuffer.o
  CC      sound/core/isadma.o
  CC      net/sched/sch_frag.o
  AR      fs/kernfs/built-in.a
  CC      net/sched/sch_api.o
  CC      sound/core/vmaster.o
  CC      kernel/entry/syscall_user_dispatch.o
  CC      crypto/proc.o
  CC      kernel/irq/spurious.o
  CC      io_uring/poll.o
  AR      arch/x86/pci/built-in.a
  CC      net/netlink/policy.o
  CC      block/blk-mq-tag.o
  CC      lib/crypto/mpi/mpi-sub-ui.o
  CC      arch/x86/kernel/cpu/common.o
  AR      sound/arm/built-in.a
  CC      sound/pci/hda/hda_auto_parser.o
  CC      arch/x86/kernel/cpu/rdrand.o
  CC      lib/lz4/lz4_decompress.o
  AR      kernel/sched/built-in.a
  CC      arch/x86/mm/mmap.o
  CC      security/keys/keyctl_pkey.o
  CC      kernel/printk/sysctl.o
  AR      sound/sh/built-in.a
  CC      arch/x86/kernel/process_32.o
  CC      sound/core/ctljack.o
  AR      fs/sysfs/built-in.a
  CC      arch/x86/kernel/signal.o
  CC      arch/x86/kernel/signal_32.o
  CC      net/ethtool/netlink.o
  CC      block/blk-stat.o
  CC      arch/x86/kernel/apic/io_apic.o
  CC      fs/proc/proc_tty.o
  CC      arch/x86/kernel/apic/msi.o
  CC      arch/x86/events/msr.o
  CC      kernel/dma/direct.o
  CC      kernel/irq/resend.o
  CC      crypto/aead.o
  CC      fs/netfs/buffered_read.o
  CC      arch/x86/kernel/traps.o
  CC      fs/ext4/balloc.o
  CC      security/selinux/ss/ebitmap.o
  AR      kernel/printk/built-in.a
  CC      drivers/pci/pci-driver.o
  AR      sound/synth/emux/built-in.a
  AR      sound/synth/built-in.a
  CC      arch/x86/kernel/apic/probe_32.o
  CC      kernel/power/user.o
  CC      sound/core/jack.o
  CC      lib/crypto/mpi/mpi-div.o
  CC      mm/shrinker.o
  CC      arch/x86/mm/pgtable.o
  AR      kernel/entry/built-in.a
  CC      kernel/power/poweroff.o
  CC      fs/proc/cmdline.o
  CC      arch/x86/events/intel/uncore.o
  AR      security/keys/built-in.a
  CC      net/ethtool/bitset.o
  CC      sound/core/hwdep.o
  CC      fs/proc/consoles.o
  AR      net/netlink/built-in.a
  AR      drivers/char/ipmi/built-in.a
  CC      kernel/irq/chip.o
  CC      arch/x86/events/intel/uncore_nhmex.o
  CC      net/netfilter/nf_queue.o
  CC      fs/jbd2/transaction.o
  CC      net/netfilter/nf_sockopt.o
  CC      net/netfilter/utils.o
  CC      fs/jbd2/commit.o
  CC      drivers/acpi/acpica/dsargs.o
  CC      net/netfilter/nfnetlink.o
  AR      sound/pci/mixart/built-in.a
  CC      fs/jbd2/recovery.o
  CC      arch/x86/kernel/cpu/match.o
  CC      arch/x86/mm/physaddr.o
  CC      arch/x86/events/intel/uncore_snb.o
  CC      net/netfilter/nfnetlink_log.o
  CC      block/blk-mq-sysfs.o
  CC      sound/pci/hda/hda_sysfs.o
  CC      drivers/acpi/acpica/dscontrol.o
  CC      lib/crypto/mpi/mpi-mod.o
  CC      fs/ramfs/inode.o
  AR      kernel/power/built-in.a
  CC      net/core/stream.o
  CC      block/blk-mq-cpumap.o
  AR      lib/lz4/built-in.a
  CC      fs/proc/cpuinfo.o
  CC      security/selinux/ss/hashtab.o
  CC      sound/pci/hda/hda_controller.o
  CC      crypto/geniv.o
  CC      security/selinux/ss/symtab.o
  CC      fs/jbd2/checkpoint.o
  CC      sound/core/timer.o
  CC      fs/netfs/buffered_write.o
  CC      sound/pci/hda/hda_proc.o
  CC      lib/zstd/zstd_decompress_module.o
  CC      arch/x86/kernel/cpu/bugs.o
  CC      lib/xz/xz_dec_syms.o
  CC      crypto/lskcipher.o
  CC      arch/x86/mm/tlb.o
  CC      io_uring/eventfd.o
  AR      drivers/acpi/pmic/built-in.a
  CC      mm/shmem.o
  CC      kernel/dma/ops_helpers.o
  CC      drivers/acpi/acpica/dsdebug.o
  CC      fs/hugetlbfs/inode.o
  CC      net/xfrm/xfrm_policy.o
  CC      net/ipv4/netfilter/nf_defrag_ipv4.o
  CC      net/ipv4/route.o
  CC      net/sched/sch_blackhole.o
  CC      mm/util.o
  CC      security/selinux/ss/sidtab.o
  CC      lib/crypto/mpi/mpi-mul.o
  CC      lib/zstd/decompress/huf_decompress.o
  CC      kernel/irq/dummychip.o
  CC      lib/xz/xz_dec_stream.o
  CC      security/selinux/ss/avtab.o
  CC      fs/proc/devices.o
  CC      kernel/irq/devres.o
  CC      lib/zstd/decompress/zstd_ddict.o
  AR      arch/x86/kernel/apic/built-in.a
  CC      drivers/acpi/acpica/dsfield.o
  CC      net/netfilter/nf_conntrack_core.o
  CC      drivers/acpi/dptf/int340x_thermal.o
  CC      sound/core/hrtimer.o
  CC      arch/x86/kernel/cpu/aperfmperf.o
  CC      net/ethtool/strset.o
  CC      fs/ramfs/file-mmu.o
  CC      net/ipv4/netfilter/nf_reject_ipv4.o
  CC      io_uring/uring_cmd.o
  CC      arch/x86/mm/cpu_entry_area.o
  AR      sound/usb/misc/built-in.a
  AR      sound/usb/usx2y/built-in.a
  AR      sound/usb/caiaq/built-in.a
  AR      sound/usb/6fire/built-in.a
  CC      arch/x86/mm/maccess.o
  AR      sound/usb/hiface/built-in.a
  AR      sound/usb/bcd2000/built-in.a
  CC      kernel/dma/remap.o
  AR      sound/usb/built-in.a
  AR      sound/firewire/built-in.a
  CC      lib/dim/dim.o
  CC      arch/x86/events/intel/uncore_snbep.o
  CC      block/blk-mq-sched.o
  CC      drivers/pnp/pnpacpi/core.o
  AR      drivers/amba/built-in.a
  CC      fs/jbd2/revoke.o
  CC      lib/crypto/aes.o
  CC      lib/dim/net_dim.o
  CC      drivers/pnp/core.o
  CC      drivers/pci/search.o
  CC      security/selinux/ss/policydb.o
  CC      kernel/irq/autoprobe.o
  CC      fs/ext4/bitmap.o
  CC      lib/xz/xz_dec_lzma2.o
  CC      net/core/scm.o
  CC      lib/crypto/mpi/mpih-cmp.o
  AR      drivers/acpi/dptf/built-in.a
  CC      net/xfrm/xfrm_state.o
  CC      drivers/acpi/acpica/dsinit.o
  CC      security/selinux/ss/services.o
  CC      security/selinux/ss/conditional.o
  CC      crypto/skcipher.o
  CC      arch/x86/events/intel/uncore_discovery.o
  CC      net/ethtool/linkinfo.o
  CC      fs/proc/interrupts.o
  CC      fs/netfs/direct_read.o
  CC      lib/xz/xz_dec_bcj.o
  CC      block/ioctl.o
  CC      net/sched/cls_api.o
  CC      mm/mmzone.o
  AR      sound/sparc/built-in.a
  CC      net/ipv4/inetpeer.o
  CC      sound/core/pcm.o
  CC      sound/pci/hda/hda_hwdep.o
  CC      arch/x86/mm/pgprot.o
  AR      fs/ramfs/built-in.a
  CC      fs/jbd2/journal.o
  CC      arch/x86/mm/pgtable_32.o
  AR      kernel/dma/built-in.a
  CC      sound/pci/hda/hda_intel.o
  AR      sound/spi/built-in.a
  CC      security/selinux/ss/mls.o
  CC      lib/crypto/arc4.o
  CC      drivers/acpi/acpica/dsmethod.o
  CC      drivers/pnp/pnpacpi/rsparser.o
  CC      kernel/irq/irqdomain.o
  CC      lib/dim/rdma_dim.o
  CC      sound/core/pcm_native.o
  CC      block/genhd.o
  CC      lib/crypto/mpi/mpih-div.o
  CC      fs/proc/loadavg.o
  CC      arch/x86/kernel/cpu/cpuid-deps.o
  CC      net/netfilter/nf_conntrack_standalone.o
  CC      drivers/pci/rom.o
  CC      fs/ext4/block_validity.o
  AR      lib/xz/built-in.a
  CC      lib/zstd/decompress/zstd_decompress.o
  CC      net/unix/af_unix.o
  AR      drivers/clk/actions/built-in.a
  CC      drivers/dma/dw/core.o
  AR      drivers/clk/analogbits/built-in.a
  CC      lib/zstd/decompress/zstd_decompress_block.o
  AR      fs/hugetlbfs/built-in.a
  CC      drivers/dma/hsu/hsu.o
  AR      drivers/clk/bcm/built-in.a
  CC      lib/zstd/zstd_common_module.o
  AR      drivers/clk/imgtec/built-in.a
  AR      drivers/clk/imx/built-in.a
  AR      drivers/clk/ingenic/built-in.a
  CC      io_uring/openclose.o
  AR      drivers/soc/apple/built-in.a
  AR      drivers/clk/mediatek/built-in.a
  CC      io_uring/sqpoll.o
  AR      drivers/soc/aspeed/built-in.a
  AR      drivers/clk/microchip/built-in.a
  AR      drivers/soc/bcm/built-in.a
  AR      drivers/clk/mstar/built-in.a
  CC      io_uring/xattr.o
  CC      drivers/acpi/acpica/dsmthdat.o
  AR      drivers/soc/fsl/built-in.a
  AR      drivers/clk/mvebu/built-in.a
  AR      lib/dim/built-in.a
  AR      drivers/soc/fujitsu/built-in.a
  CC      drivers/virtio/virtio.o
  AR      drivers/clk/ralink/built-in.a
  CC      net/ipv4/netfilter/ip_tables.o
  AR      drivers/soc/hisilicon/built-in.a
  AR      drivers/soc/imx/built-in.a
  AR      drivers/clk/renesas/built-in.a
  AR      drivers/soc/ixp4xx/built-in.a
  AR      drivers/clk/socfpga/built-in.a
  AR      drivers/soc/loongson/built-in.a
  AR      drivers/clk/sophgo/built-in.a
  AR      drivers/clk/sprd/built-in.a
  AR      drivers/soc/mediatek/built-in.a
  AR      drivers/clk/starfive/built-in.a
  AR      drivers/soc/microchip/built-in.a
  AR      drivers/clk/sunxi-ng/built-in.a
  AR      drivers/soc/nuvoton/built-in.a
  CC      net/ethtool/linkmodes.o
  CC      arch/x86/mm/iomap_32.o
  AR      drivers/clk/ti/built-in.a
  CC      arch/x86/kernel/cpu/umwait.o
  AR      drivers/clk/versatile/built-in.a
  AR      drivers/soc/pxa/built-in.a
  CC      drivers/tty/vt/vt_ioctl.o
  CC      fs/netfs/direct_write.o
  AR      drivers/soc/amlogic/built-in.a
  AR      drivers/clk/xilinx/built-in.a
  AR      drivers/clk/built-in.a
  AR      drivers/soc/qcom/built-in.a
  AR      drivers/soc/renesas/built-in.a
  MKCAP   arch/x86/kernel/cpu/capflags.c
  AR      drivers/soc/rockchip/built-in.a
  CC      arch/x86/kernel/cpu/powerflags.o
  AR      drivers/soc/sunxi/built-in.a
  CC      arch/x86/mm/hugetlbpage.o
  CC      arch/x86/mm/dump_pagetables.o
  AR      drivers/soc/ti/built-in.a
  CC      fs/proc/meminfo.o
  AR      drivers/soc/versatile/built-in.a
  AR      drivers/dma/idxd/built-in.a
  AR      drivers/soc/xilinx/built-in.a
  CC      net/core/gen_stats.o
  CC      drivers/tty/hvc/hvc_console.o
  AR      drivers/soc/built-in.a
  CC      crypto/seqiv.o
  CC      arch/x86/mm/highmem_32.o
  AR      kernel/rcu/built-in.a
  CC      lib/zstd/common/debug.o
  CC      net/ipv4/protocol.o
  CC      drivers/tty/vt/vc_screen.o
  CC      drivers/char/hw_random/core.o
  CC      drivers/acpi/acpica/dsobject.o
  CC      drivers/pci/setup-res.o
  CC      drivers/char/agp/backend.o
  AR      drivers/pnp/pnpacpi/built-in.a
  CC      drivers/pnp/card.o
  CC      lib/crypto/mpi/mpih-mul.o
  CC      mm/vmstat.o
  CC      fs/ext4/dir.o
  CC      net/ethtool/rss.o
  CC      mm/backing-dev.o
  CC      net/ipv4/netfilter/iptable_filter.o
  AR      drivers/dma/hsu/built-in.a
  CC      net/netfilter/nf_conntrack_expect.o
  CC      kernel/irq/proc.o
  CC      drivers/virtio/virtio_ring.o
  CC      kernel/irq/migration.o
  CC      drivers/tty/vt/selection.o
  CC      sound/core/pcm_lib.o
  CC      drivers/acpi/acpica/dsopcode.o
  CC      net/ipv4/ip_input.o
  CC      block/ioprio.o
  CC      fs/fat/cache.o
  CC      net/ipv4/netfilter/iptable_mangle.o
  CC      fs/proc/stat.o
  CC      crypto/echainiv.o
  CC      fs/proc/uptime.o
  CC      drivers/dma/dw/dw.o
  AR      sound/pci/hda/built-in.a
  AR      arch/x86/mm/built-in.a
  CC      arch/x86/events/intel/cstate.o
  AR      sound/pci/nm256/built-in.a
  CC      drivers/acpi/acpica/dspkginit.o
  AR      sound/pci/oxygen/built-in.a
  AR      sound/pci/pcxhr/built-in.a
  CC      fs/netfs/iterator.o
  AR      sound/pci/riptide/built-in.a
  AR      sound/pci/rme9652/built-in.a
  AR      drivers/tty/hvc/built-in.a
  AR      sound/pci/trident/built-in.a
  CC      fs/isofs/namei.o
  AR      sound/pci/ymfpci/built-in.a
  CC      drivers/char/hw_random/intel-rng.o
  CC      fs/proc/util.o
  CC      crypto/ahash.o
  AR      sound/pci/vx222/built-in.a
  AR      sound/pci/built-in.a
  CC      drivers/char/agp/generic.o
  CC      fs/fat/dir.o
  CC      drivers/pci/irq.o
  CC      fs/isofs/inode.o
  CC      drivers/acpi/x86/apple.o
  CC      drivers/char/mem.o
  CC      drivers/pnp/driver.o
  CC      net/xfrm/xfrm_hash.o
  CC      lib/crypto/mpi/mpi-pow.o
  CC      net/core/gen_estimator.o
  CC      io_uring/nop.o
  AR      drivers/dma/amd/built-in.a
  CC      mm/mm_init.o
  CC      kernel/irq/cpuhotplug.o
  CC      drivers/acpi/acpica/dsutils.o
  CC      drivers/char/hw_random/amd-rng.o
  CC      arch/x86/kernel/idt.o
  CC      drivers/char/agp/isoch.o
  CC      drivers/tty/vt/keyboard.o
  CC      fs/proc/version.o
  CC      fs/proc/softirqs.o
  CC      net/core/net_namespace.o
  CC      security/selinux/ss/context.o
  CC      drivers/dma/dw/idma32.o
  CC      fs/ext4/ext4_jbd2.o
  CC      net/ethtool/linkstate.o
  CC      net/core/secure_seq.o
  CC      block/badblocks.o
  CC      net/core/flow_dissector.o
  CC      lib/crypto/mpi/mpiutil.o
  CC      drivers/acpi/x86/cmos_rtc.o
  CC      drivers/pnp/resource.o
  AR      arch/x86/events/intel/built-in.a
  CC      net/core/sysctl_net_core.o
  CC      drivers/tty/serial/8250/8250_core.o
  AR      arch/x86/events/built-in.a
  CC      net/netfilter/nf_conntrack_helper.o
  AR      fs/jbd2/built-in.a
  CC      drivers/tty/serial/8250/8250_platform.o
  CC      drivers/acpi/x86/lpss.o
  CC      drivers/pci/vpd.o
  CC      drivers/acpi/acpica/dswexec.o
  CC      net/core/dev.o
  CC      net/ipv4/netfilter/ipt_REJECT.o
  CC      net/xfrm/xfrm_input.o
  CC      net/sched/act_api.o
  CC      kernel/module/main.o
  CC      block/blk-rq-qos.o
  CC      fs/netfs/locking.o
  CC      drivers/tty/serial/serial_core.o
  CC      lib/zstd/common/entropy_common.o
  AR      sound/parisc/built-in.a
  CC      drivers/acpi/x86/s2idle.o
  CC      crypto/shash.o
  CC      io_uring/fs.o
  CC      kernel/irq/pm.o
  CC      drivers/char/hw_random/geode-rng.o
  CC      drivers/dma/dw/acpi.o
  CC      fs/proc/namespaces.o
  CC      drivers/acpi/tables.o
  CC      net/netfilter/nf_conntrack_proto.o
  CC      drivers/char/agp/amd64-agp.o
  CC      lib/zstd/common/error_private.o
  CC      drivers/tty/serial/serial_base_bus.o
  AR      drivers/tty/ipwireless/built-in.a
  CC      net/unix/garbage.o
  CC      drivers/char/agp/intel-agp.o
  CC      lib/zstd/common/fse_decompress.o
  CC      drivers/acpi/osi.o
  CC      drivers/acpi/acpica/dswload.o
  CC      drivers/acpi/x86/utils.o
  AR      lib/crypto/mpi/built-in.a
  CC      sound/core/pcm_misc.o
  CC      lib/crypto/gf128mul.o
  CC      fs/isofs/dir.o
  CC      fs/ext4/extents.o
  CC      drivers/virtio/virtio_anchor.o
  CC      security/selinux/netlabel.o
  CC      crypto/akcipher.o
  CC      kernel/irq/msi.o
  CC      fs/fat/fatent.o
  CC      mm/percpu.o
  CC      crypto/sig.o
  CC      net/ethtool/debug.o
  CC      drivers/acpi/acpica/dswload2.o
  CC      drivers/pci/setup-bus.o
  CC      block/disk-events.o
  AR      drivers/dma/dw/built-in.a
  CC      drivers/tty/serial/8250/8250_pnp.o
  AR      drivers/dma/mediatek/built-in.a
  CC      drivers/pnp/manager.o
  CC      kernel/irq/affinity.o
  CC      drivers/char/hw_random/via-rng.o
  AR      drivers/dma/qcom/built-in.a
  CC      lib/zstd/common/zstd_common.o
  CC      drivers/tty/vt/vt.o
  AR      drivers/dma/stm32/built-in.a
  AR      drivers/dma/ti/built-in.a
  AR      drivers/dma/xilinx/built-in.a
  CC      drivers/dma/dmaengine.o
  AR      drivers/iommu/amd/built-in.a
  CC      fs/netfs/main.o
  AR      drivers/iommu/intel/built-in.a
  CC      fs/netfs/misc.o
  AR      drivers/gpu/host1x/built-in.a
  AR      lib/zstd/built-in.a
  AR      drivers/iommu/arm/arm-smmu/built-in.a
  CC      fs/netfs/objects.o
  CC      drivers/connector/cn_queue.o
  AR      drivers/iommu/arm/arm-smmu-v3/built-in.a
  AR      drivers/iommu/arm/built-in.a
  CC [M]  net/ipv4/netfilter/iptable_nat.o
  CC      fs/proc/self.o
  AR      drivers/iommu/iommufd/built-in.a
  AR      drivers/iommu/riscv/built-in.a
  CC      drivers/iommu/iommu.o
  CC      io_uring/splice.o
  CC      fs/proc/thread_self.o
  CC      drivers/pci/vc.o
  CC      lib/crypto/blake2s.o
  CC      drivers/acpi/x86/blacklist.o
  CC      drivers/virtio/virtio_pci_modern_dev.o
  CC      fs/proc/proc_sysctl.o
  CC      drivers/char/agp/intel-gtt.o
  CC      sound/core/pcm_memory.o
  AR      drivers/gpu/drm/tests/built-in.a
  AR      drivers/gpu/drm/arm/built-in.a
  CC      fs/nfs/client.o
  AR      drivers/gpu/drm/clients/built-in.a
  CC      fs/exportfs/expfs.o
  CC      drivers/gpu/drm/display/drm_display_helper_mod.o
  CC      fs/isofs/util.o
  CC      drivers/acpi/acpica/dswscope.o
  CC      fs/proc/proc_net.o
  AR      drivers/char/hw_random/built-in.a
  CC      mm/slab_common.o
  CC      drivers/tty/tty_io.o
  CC      net/ethtool/wol.o
  CC      net/unix/sysctl_net_unix.o
  CC      lib/crypto/blake2s-generic.o
  CC      drivers/pnp/support.o
  CC      drivers/tty/n_tty.o
  CC      crypto/kpp.o
  CC      drivers/gpu/drm/display/drm_dp_dual_mode_helper.o
  AR      drivers/acpi/x86/built-in.a
  CC      drivers/acpi/acpica/dswstate.o
  CC      net/xfrm/xfrm_output.o
  CC      net/core/dev_addr_lists.o
  CC      net/ethtool/features.o
  CC      drivers/tty/serial/8250/8250_rsa.o
  CC      block/blk-ia-ranges.o
  CC      net/ethtool/privflags.o
  CC      net/netfilter/nf_conntrack_proto_generic.o
  CC      drivers/virtio/virtio_pci_legacy_dev.o
  CC      net/sched/sch_fifo.o
  AR      fs/exportfs/built-in.a
  CC      fs/isofs/rock.o
  CC      fs/ext4/extents_status.o
  CC      kernel/time/time.o
  CC      kernel/irq/matrix.o
  CC      sound/core/memalloc.o
  CC      io_uring/sync.o
  CC      fs/fat/file.o
  CC      drivers/gpu/drm/ttm/ttm_tt.o
  AR      security/selinux/built-in.a
  CC      drivers/dma/virt-dma.o
  AR      security/built-in.a
  ASN.1   crypto/rsapubkey.asn1.[ch]
  CC      fs/fat/inode.o
  ASN.1   crypto/rsaprivkey.asn1.[ch]
  CC      drivers/tty/serial/serial_ctrl.o
  CC      drivers/connector/connector.o
  CC      lib/crypto/sha1.o
  CC      block/early-lookup.o
  CC      drivers/acpi/acpica/evevent.o
  CC      drivers/pnp/interface.o
  CC      arch/x86/kernel/irq.o
  AR      net/ipv4/netfilter/built-in.a
  CC      net/ipv4/ip_fragment.o
  AR      drivers/char/agp/built-in.a
  CC      drivers/char/random.o
  CC      net/ipv4/ip_forward.o
  CC      kernel/module/strict_rwx.o
  CC      drivers/tty/serial/8250/8250_port.o
  CC      crypto/rsa.o
  CC      drivers/gpu/drm/display/drm_dp_helper.o
  CC      drivers/virtio/virtio_pci_modern.o
  CC      drivers/acpi/acpica/evgpe.o
  CC      lib/fonts/fonts.o
  COPY    drivers/tty/vt/defkeymap.c
  AR      net/unix/built-in.a
  CC      lib/crypto/sha256.o
  AR      drivers/gpu/drm/renesas/rcar-du/built-in.a
  AR      drivers/gpu/drm/renesas/rz-du/built-in.a
  AR      drivers/gpu/drm/omapdrm/built-in.a
  AR      drivers/gpu/drm/renesas/built-in.a
  CC      drivers/dma/acpi-dma.o
  CC      drivers/gpu/drm/i915/i915_config.o
  CC      drivers/pci/mmap.o
  CC      arch/x86/kernel/cpu/topology.o
  CC      kernel/time/timer.o
  CC      drivers/connector/cn_proc.o
  CC      fs/netfs/read_collect.o
  CC      drivers/pnp/quirks.o
  CC      fs/proc/kcore.o
  CC      net/ethtool/rings.o
  CC      block/bounce.o
  CC      drivers/gpu/drm/i915/i915_driver.o
  CC      crypto/rsa_helper.o
  CC      io_uring/msg_ring.o
  CC      block/bsg.o
  CC      lib/fonts/font_8x16.o
  CC      fs/isofs/export.o
  CC      fs/nfs/dir.o
  CC      net/netfilter/nf_conntrack_proto_tcp.o
  CC      sound/core/pcm_timer.o
  CC      drivers/gpu/drm/ttm/ttm_bo.o
  CC      kernel/module/kmod.o
  CC      drivers/acpi/acpica/evgpeblk.o
  CC      block/blk-cgroup.o
  CC      net/sched/cls_cgroup.o
  CC      net/ethtool/channels.o
  CC      drivers/iommu/iommu-traces.o
  CC      net/netfilter/nf_conntrack_proto_udp.o
  CC      block/blk-ioprio.o
  CC      block/blk-iolatency.o
  CC      block/blk-iocost.o
  AR      lib/crypto/built-in.a
  CC      net/netfilter/nf_conntrack_proto_icmp.o
  CC      net/ipv4/ip_options.o
  CC      net/netfilter/nf_conntrack_extend.o
  CC      drivers/pci/devres.o
  CC      mm/compaction.o
  CC      net/xfrm/xfrm_sysctl.o
  AR      kernel/irq/built-in.a
  CC      block/mq-deadline.o
  AR      lib/fonts/built-in.a
  CC      lib/argv_split.o
  CC      crypto/rsa-pkcs1pad.o
  AR      drivers/dma/built-in.a
  CC      net/netfilter/nf_conntrack_acct.o
  CC      drivers/acpi/acpica/evgpeinit.o
  CC      drivers/virtio/virtio_pci_common.o
  CC      fs/fat/misc.o
  CC      drivers/tty/vt/consolemap.o
  CC      drivers/pnp/system.o
  CC      fs/isofs/joliet.o
  HOSTCC  drivers/tty/vt/conmakehash
  CC      sound/core/seq_device.o
  CC      net/netfilter/nf_conntrack_seqadj.o
  CC      fs/isofs/compress.o
In file included from /workspace/kernel/drivers/gpu/drm/i915/display/intel_bw.h:12,
                 from /workspace/kernel/drivers/gpu/drm/i915/i915_driver.c:50:
/workspace/kernel/drivers/gpu/drm/i915/display/intel_display_power.h: In function ‘intel_display_power_put’:
/workspace/kernel/drivers/gpu/drm/i915/display/intel_display_power.h:228:43: error: passing argument 1 of ‘intel_display_power_put_unchecked’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  228 |         intel_display_power_put_unchecked(display, domain);
      |                                           ^~~~~~~
      |                                           |
      |                                           struct intel_display *
/workspace/kernel/drivers/gpu/drm/i915/display/intel_display_power.h:220:65: note: expected ‘struct drm_i915_private *’ but argument is of type ‘struct intel_display *’
  220 | void intel_display_power_put_unchecked(struct drm_i915_private *dev_priv,
      |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
  CC      lib/bug.o
  CC      fs/proc/vmcore.o
  CC      drivers/char/misc.o
  CC      kernel/module/tree_lookup.o
  CC      fs/proc/kmsg.o
  CC      net/netfilter/nf_conntrack_proto_icmpv6.o
  CC      io_uring/advise.o
  CC      drivers/acpi/acpica/evgpeutil.o
  AR      drivers/connector/built-in.a
  CC      lib/buildid.o
  CC      drivers/tty/tty_ioctl.o
  CC      fs/netfs/read_pgpriv2.o
  CC      drivers/gpu/drm/ttm/ttm_bo_util.o
  CC      fs/proc/page.o
  CC      crypto/rsassa-pkcs1.o
  CC      drivers/virtio/virtio_pci_legacy.o
  CC      drivers/pci/proc.o
  AR      drivers/pnp/built-in.a
  CC      kernel/time/hrtimer.o
  CC      drivers/iommu/iommu-sysfs.o
  CC      net/ethtool/coalesce.o
  CC      mm/show_mem.o
  AR      sound/core/built-in.a
  AR      sound/pcmcia/vx/built-in.a
  CC      kernel/time/sleep_timeout.o
  AR      sound/pcmcia/pdaudiocf/built-in.a
  CC      drivers/acpi/acpica/evglock.o
  AR      sound/pcmcia/built-in.a
  CC      drivers/char/virtio_console.o
  CC      net/sched/ematch.o
  AR      sound/mips/built-in.a
  CC      block/kyber-iosched.o
  CC      kernel/time/timekeeping.o
  CC      net/xfrm/xfrm_replay.o
  AR      sound/soc/built-in.a
  AR      sound/atmel/built-in.a
  CC      drivers/tty/serial/8250/8250_dma.o
  AR      drivers/gpu/drm/tilcdc/built-in.a
  CC      drivers/tty/tty_ldisc.o
  CC      sound/hda/hda_bus_type.o
  CC      drivers/gpu/drm/i915/i915_drm_client.o
  CC      mm/interval_tree.o
  CC      fs/fat/nfs.o
  CC      kernel/module/kallsyms.o
cc1: all warnings being treated as errors
  CC      net/ipv6/netfilter/ip6_tables.o
make[6]: *** [/workspace/kernel/scripts/Makefile.build:194: drivers/gpu/drm/i915/i915_driver.o] Error 1
  CC      net/ipv6/af_inet6.o
make[6]: *** Waiting for unfinished jobs....
  CC      arch/x86/kernel/cpu/proc.o
  CC      drivers/tty/vt/defkeymap.o
  CC      drivers/char/hpet.o
  CC      drivers/gpu/drm/display/drm_dp_mst_topology.o
  AR      fs/isofs/built-in.a
  CC      net/packet/af_packet.o
  CC      net/ipv4/ip_output.o
  CC      arch/x86/kernel/cpu/feat_ctl.o
  AR      drivers/gpu/vga/built-in.a
  CC      crypto/acompress.o
  CC      drivers/tty/serial/8250/8250_dwlib.o
  CONMK   drivers/tty/vt/consolemap_deftbl.c
  CC      drivers/tty/vt/consolemap_deftbl.o
  CC      lib/clz_tab.o
  CC      fs/ext4/file.o
  CC      io_uring/epoll.o
  AR      drivers/tty/vt/built-in.a
  CC      lib/cmdline.o
  CC      drivers/acpi/acpica/evhandler.o
  CC      drivers/virtio/virtio_pci_admin_legacy_io.o
  AR      sound/x86/built-in.a
  CC      fs/netfs/read_retry.o
  AR      sound/xen/built-in.a
  CC      drivers/gpu/drm/ttm/ttm_bo_vm.o
  CC      drivers/pci/pci-sysfs.o
  AR      fs/proc/built-in.a
  CC      arch/x86/kernel/cpu/intel.o
  CC      drivers/gpu/drm/virtio/virtgpu_drv.o
  CC      drivers/char/nvram.o
  CC      drivers/iommu/dma-iommu.o
  CC      net/ipv6/netfilter/ip6table_filter.o
  CC      drivers/gpu/drm/virtio/virtgpu_kms.o
  CC      lib/cpumask.o
  CC      drivers/pci/slot.o
  CC      fs/fat/namei_vfat.o
  CC      net/ipv4/ip_sockglue.o
  CC      fs/nfs/file.o
  CC      sound/hda/hdac_bus.o
  CC      kernel/futex/core.o
In file included from /workspace/kernel/drivers/gpu/drm/i915/display/intel_display_core.h:23,
                 from /workspace/kernel/drivers/gpu/drm/i915/i915_drv.h:40,
                 from /workspace/kernel/drivers/gpu/drm/i915/gt/intel_context.h:14,
                 from /workspace/kernel/drivers/gpu/drm/i915/gem/i915_gem_context.h:12,
                 from /workspace/kernel/drivers/gpu/drm/i915/i915_drm_client.c:14:
/workspace/kernel/drivers/gpu/drm/i915/display/intel_display_power.h: In function ‘intel_display_power_put’:
/workspace/kernel/drivers/gpu/drm/i915/display/intel_display_power.h:228:43: error: passing argument 1 of ‘intel_display_power_put_unchecked’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  228 |         intel_display_power_put_unchecked(display, domain);
      |                                           ^~~~~~~
      |                                           |
      |                                           struct intel_display *
/workspace/kernel/drivers/gpu/drm/i915/display/intel_display_power.h:220:65: note: expected ‘struct drm_i915_private *’ but argument is of type ‘struct intel_display *’
  220 | void intel_display_power_put_unchecked(struct drm_i915_private *dev_priv,
      |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
  CC      kernel/futex/syscalls.o
  CC      drivers/acpi/acpica/evmisc.o
  CC      net/netfilter/nf_conntrack_netlink.o
  CC      drivers/pci/pci-acpi.o
  CC      kernel/futex/pi.o
  AR      net/dsa/built-in.a
  CC      fs/lockd/clntlock.o
  AR      drivers/gpu/drm/imx/built-in.a
  CC      drivers/gpu/drm/display/drm_dsc_helper.o
  CC      drivers/iommu/iova.o
  CC      kernel/module/procfs.o
  CC      drivers/tty/serial/8250/8250_pcilib.o
  CC      drivers/virtio/virtio_input.o
  AR      net/sched/built-in.a
  CC      fs/lockd/clntproc.o
  CC      crypto/scompress.o
  CC      net/ethtool/pause.o
  CC      arch/x86/kernel/cpu/tsx.o
  CC      lib/ctype.o
  CC      block/blk-mq-pci.o
cc1: all warnings being treated as errors
  CC      lib/dec_and_lock.o
make[6]: *** [/workspace/kernel/scripts/Makefile.build:194: drivers/gpu/drm/i915/i915_drm_client.o] Error 1
make[5]: *** [/workspace/kernel/scripts/Makefile.build:440: drivers/gpu/drm/i915] Error 2
make[5]: *** Waiting for unfinished jobs....
  CC      arch/x86/kernel/irq_32.o
  CC      drivers/base/power/sysfs.o
  CC      drivers/acpi/acpica/evregion.o
  CC      io_uring/statx.o
  CC      drivers/base/firmware_loader/builtin/main.o
  CC      drivers/base/regmap/regmap.o
  CC      net/xfrm/xfrm_device.o
  CC      drivers/gpu/drm/ttm/ttm_module.o
  CC      lib/decompress.o
  CC      drivers/gpu/drm/virtio/virtgpu_gem.o
  CC      drivers/acpi/acpica/evrgnini.o
  CC      fs/netfs/write_collect.o
  AR      drivers/char/built-in.a
  CC      fs/ext4/fsmap.o
  CC      drivers/base/firmware_loader/main.o
  CC      drivers/gpu/drm/ttm/ttm_execbuf_util.o
  CC      lib/decompress_bunzip2.o
  CC      drivers/gpu/drm/ttm/ttm_range_manager.o
  CC      mm/list_lru.o
  CC      sound/hda/hdac_device.o
  CC      kernel/time/ntp.o
  CC      kernel/module/sysfs.o
  CC      arch/x86/kernel/cpu/intel_epb.o
  AR      drivers/base/firmware_loader/builtin/built-in.a
  CC      drivers/acpi/acpica/evsci.o
  CC      drivers/gpu/drm/ttm/ttm_resource.o
  CC      drivers/gpu/drm/ttm/ttm_pool.o
  CC      drivers/acpi/acpica/evxface.o
  CC      drivers/tty/serial/8250/8250_early.o
  CC      drivers/acpi/osl.o
  CC      kernel/futex/requeue.o
  CC      fs/nls/nls_base.o
  AR      fs/unicode/built-in.a
  CC      drivers/gpu/drm/virtio/virtgpu_vram.o
  CC      fs/autofs/init.o
  CC      drivers/base/power/generic_ops.o
  CC      fs/lockd/clntxdr.o
  CC      fs/lockd/host.o
  CC      net/ipv6/netfilter/ip6table_mangle.o
  CC      drivers/base/regmap/regcache.o
  CC      block/blk-mq-virtio.o
  CC      fs/ext4/fsync.o
  CC      fs/fat/namei_msdos.o
  CC      drivers/pci/iomap.o
  CC      drivers/tty/serial/8250/8250_exar.o
  CC      drivers/virtio/virtio_dma_buf.o
  CC      sound/hda/hdac_sysfs.o
  CC      arch/x86/kernel/cpu/amd.o
  CC      crypto/algboss.o
  CC      net/xfrm/xfrm_nat_keepalive.o
  AR      drivers/iommu/built-in.a
  CC      drivers/pci/quirks.o
  CC      io_uring/timeout.o
  CC      arch/x86/kernel/cpu/hygon.o
  CC      net/ethtool/eee.o
  CC      drivers/tty/serial/8250/8250_lpss.o
  CC      drivers/acpi/acpica/evxfevnt.o
  CC      lib/decompress_inflate.o
  CC      fs/nls/nls_cp437.o
  CC      fs/autofs/inode.o
  CC      drivers/base/power/common.o
  CC      mm/workingset.o
  AR      kernel/module/built-in.a
  CC      lib/decompress_unlz4.o
  CC      fs/netfs/write_issue.o
  CC      drivers/base/regmap/regcache-rbtree.o
  CC      kernel/time/clocksource.o
  CC      block/blk-mq-debugfs.o
  AR      drivers/base/firmware_loader/built-in.a
  CC      kernel/futex/waitwake.o
  CC      net/sunrpc/auth_gss/auth_gss.o
  CC      fs/ext4/hash.o
  CC      drivers/gpu/drm/virtio/virtgpu_display.o
  CC      net/netfilter/nf_conntrack_ftp.o
  CC      drivers/tty/serial/serial_port.o
  CC      arch/x86/kernel/dumpstack_32.o
  CC      fs/autofs/root.o
  AR      drivers/virtio/built-in.a
  CC      net/ipv4/inet_hashtables.o
  CC      net/sunrpc/clnt.o
  CC      net/sunrpc/auth_gss/gss_generic_token.o
  CC      drivers/acpi/acpica/evxfgpe.o
  CC      net/sunrpc/xprt.o
  CC      fs/nls/nls_ascii.o
  CC      drivers/gpu/drm/ttm/ttm_device.o
  CC      fs/nfs/getroot.o
  CC      drivers/gpu/drm/ttm/ttm_sys_manager.o
  CC      drivers/acpi/utils.o
  CC      drivers/gpu/drm/ttm/ttm_agp_backend.o
  CC      drivers/base/power/qos.o
  AR      fs/fat/built-in.a
  CC      drivers/pci/pci-label.o
  CC      sound/hda/hdac_regmap.o
  CC      net/sunrpc/socklib.o
  CC      fs/ext4/ialloc.o
  CC      lib/decompress_unlzma.o
  CC      arch/x86/kernel/cpu/centaur.o
  CC      drivers/tty/serial/8250/8250_mid.o
  CC      net/core/dst.o
  CC      crypto/testmgr.o
  CC      fs/nls/nls_iso8859-1.o
  CC      drivers/gpu/drm/display/drm_hdcp_helper.o
  CC      net/xfrm/xfrm_algo.o
  CC      net/ipv6/netfilter/nf_defrag_ipv6_hooks.o
  CC      net/xfrm/xfrm_user.o
  CC      drivers/acpi/acpica/evxfregn.o
  CC      drivers/tty/serial/8250/8250_pci.o
  CC      net/ethtool/tsinfo.o
  CC      fs/lockd/svc.o
  CC      mm/debug.o
  AR      kernel/futex/built-in.a
  CC      net/ipv4/inet_timewait_sock.o
  CC      io_uring/fdinfo.o
  CC      fs/ext4/indirect.o
  CC      net/ipv6/netfilter/nf_conntrack_reasm.o
  CC      net/ipv6/netfilter/nf_reject_ipv6.o
  CC      arch/x86/kernel/cpu/transmeta.o
  AR      drivers/base/test/built-in.a
  CC      drivers/gpu/drm/virtio/virtgpu_vq.o
  CC      fs/autofs/symlink.o
  AR      net/packet/built-in.a
  CC      net/ethtool/cabletest.o
  CC      block/blk-pm.o
  CC      mm/gup.o
  AR      sound/virtio/built-in.a
  CC      drivers/base/regmap/regcache-flat.o
  CC      net/sunrpc/xprtsock.o
  CC      fs/nls/nls_utf8.o
  CC      kernel/time/jiffies.o
  CC      io_uring/cancel.o
  CC      fs/9p/vfs_super.o
  CC      drivers/acpi/acpica/exconcat.o
  CC      drivers/block/loop.o
  AR      drivers/gpu/drm/ttm/built-in.a
  CC      drivers/acpi/acpica/exconfig.o
  CC      sound/sound_core.o
  CC      drivers/misc/eeprom/eeprom_93cx6.o
  AR      fs/netfs/built-in.a
  CC      sound/last.o
  CC      crypto/cmac.o
  AR      drivers/mfd/built-in.a
  CC      drivers/block/virtio_blk.o
  CC      sound/hda/hdac_controller.o
  CC      drivers/tty/serial/8250/8250_pericom.o
  AR      fs/nls/built-in.a
  CC      net/ipv6/netfilter/ip6t_ipv6header.o
  CC      lib/decompress_unlzo.o
  CC      drivers/gpu/drm/display/drm_hdmi_helper.o
  CC      kernel/time/timer_list.o
  CC      fs/nfs/inode.o
  CC      arch/x86/kernel/cpu/zhaoxin.o
  CC      fs/9p/vfs_inode.o
  CC      drivers/acpi/acpica/exconvrt.o
  CC      net/netfilter/nf_conntrack_irc.o
  CC      fs/autofs/waitq.o
  CC      drivers/base/regmap/regcache-maple.o
  AR      drivers/misc/eeprom/built-in.a
  CC      fs/9p/vfs_inode_dotl.o
  CC      drivers/base/regmap/regmap-debugfs.o
  AR      drivers/misc/cb710/built-in.a
  AR      drivers/misc/lis3lv02d/built-in.a
  CC      drivers/pci/vgaarb.o
  CC      fs/nfs/super.o
  CC      fs/ext4/inline.o
  AR      drivers/misc/cardreader/built-in.a
  CC      block/holder.o
  AR      drivers/misc/keba/built-in.a
  CC      drivers/base/power/runtime.o
  AR      drivers/misc/built-in.a
  CC      sound/hda/hdac_stream.o
  CC      crypto/hmac.o
  CC      io_uring/waitid.o
  AR      fs/hostfs/built-in.a
  CC      net/ipv6/anycast.o
  CC      net/ipv6/ip6_output.o
  CC      net/sunrpc/sched.o
  CC      drivers/base/component.o
  CC      net/core/netevent.o
  CC      arch/x86/kernel/cpu/vortex.o
  CC      fs/lockd/svclock.o
  CC      drivers/gpu/drm/virtio/virtgpu_fence.o
  CC      arch/x86/kernel/time.o
  CC      lib/decompress_unxz.o
  CC      drivers/acpi/acpica/excreate.o
  CC      net/ipv4/inet_connection_sock.o
  CC      drivers/gpu/drm/display/drm_scdc_helper.o
  CC      net/ethtool/tunnels.o
  CC      sound/hda/array.o
  CC      fs/autofs/expire.o
  CC      drivers/base/core.o
  AR      drivers/tty/serial/8250/built-in.a
  CC      drivers/tty/serial/earlycon.o
  CC      kernel/time/timeconv.o
  CC      drivers/base/bus.o
  CC      arch/x86/kernel/cpu/perfctr-watchdog.o
  CC      io_uring/register.o
  CC      net/sunrpc/auth_gss/gss_mech_switch.o
  CC      fs/ext4/inode.o
  CC      net/sunrpc/auth_gss/svcauth_gss.o
  AR      block/built-in.a
  CC      drivers/tty/tty_buffer.o
  CC      drivers/acpi/acpica/exdebug.o
  AR      drivers/base/regmap/built-in.a
  CC      drivers/tty/tty_port.o
  CC      crypto/crypto_null.o
  CC      crypto/md5.o
  CC      net/ipv6/ip6_input.o
  CC      net/core/neighbour.o
  CC      lib/decompress_unzstd.o
  CC      net/ipv6/netfilter/ip6t_REJECT.o
  AR      drivers/block/built-in.a
  CC      kernel/time/timecounter.o
  CC      net/sunrpc/auth.o
  CC      drivers/base/power/wakeirq.o
  CC      net/sunrpc/auth_gss/gss_rpc_upcall.o
  CC      fs/9p/vfs_addr.o
  CC      kernel/time/alarmtimer.o
  CC      drivers/base/power/main.o
  CC      net/netfilter/nf_conntrack_sip.o
  CC      net/ethtool/fec.o
  AR      drivers/pci/built-in.a
  CC      fs/nfs/io.o
  CC      drivers/acpi/acpica/exdump.o
  CC      sound/hda/hdmi_chmap.o
  CC      drivers/base/dd.o
  CC      arch/x86/kernel/ioport.o
  CC      drivers/gpu/drm/virtio/virtgpu_object.o
  CC      fs/9p/vfs_file.o
  CC      drivers/gpu/drm/virtio/virtgpu_debugfs.o
  AR      drivers/tty/serial/built-in.a
  CC      fs/autofs/dev-ioctl.o
  AR      drivers/gpu/drm/display/built-in.a
  CC      fs/nfs/direct.o
  CC      arch/x86/kernel/cpu/vmware.o
  CC      fs/nfs/pagelist.o
  CC      mm/mmap_lock.o
  CC      arch/x86/kernel/cpu/hypervisor.o
  CC      drivers/gpu/drm/virtio/virtgpu_plane.o
  CC      net/core/rtnetlink.o
  CC      crypto/sha256_generic.o
  AR      net/wireless/tests/built-in.a
  CC      drivers/acpi/acpica/exfield.o
  CC      net/wireless/core.o
  CC      drivers/gpu/drm/virtio/virtgpu_ioctl.o
  CC      lib/dump_stack.o
  CC      net/ethtool/eeprom.o
  CC      drivers/gpu/drm/virtio/virtgpu_prime.o
  CC      drivers/tty/tty_mutex.o
  AR      net/xfrm/built-in.a
  CC      drivers/gpu/drm/virtio/virtgpu_trace_points.o
  CC      drivers/gpu/drm/virtio/virtgpu_submit.o
  CC      mm/highmem.o
  AR      drivers/nfc/built-in.a
  CC      fs/lockd/svcshare.o
  CC      sound/hda/trace.o
  CC      kernel/cgroup/cgroup.o
  CC      crypto/sha512_generic.o
  CC      drivers/acpi/acpica/exfldio.o
  CC      net/wireless/sysfs.o
  CC      arch/x86/kernel/dumpstack.o
  CC      fs/debugfs/inode.o
  CC      arch/x86/kernel/cpu/mshyperv.o
  CC      fs/9p/vfs_dir.o
  AR      drivers/dax/hmem/built-in.a
  AR      drivers/dax/built-in.a
  CC      net/netfilter/nf_nat_core.o
  CC      io_uring/truncate.o
  CC      net/sunrpc/auth_gss/gss_rpc_xdr.o
  CC      crypto/sha3_generic.o
  CC      kernel/cgroup/rstat.o
  CC      lib/earlycpio.o
  AR      net/ipv6/netfilter/built-in.a
  AR      fs/autofs/built-in.a
  CC      net/ipv6/addrconf.o
  CC      kernel/time/posix-timers.o
  CC      fs/ext4/ioctl.o
  CC      drivers/tty/tty_ldsem.o
  CC      fs/tracefs/inode.o
  CC      drivers/base/syscore.o
  CC      fs/debugfs/file.o
  CC      lib/extable.o
  CC      net/ipv4/tcp.o
  CC      kernel/trace/trace_clock.o
  CC      net/sunrpc/auth_null.o
  CC      drivers/dma-buf/dma-buf.o
  CC      drivers/acpi/acpica/exmisc.o
  CC      fs/nfs/read.o
  CC      crypto/ecb.o
  AR      drivers/gpu/drm/virtio/built-in.a
make[4]: *** [/workspace/kernel/scripts/Makefile.build:440: drivers/gpu/drm] Error 2
make[3]: *** [/workspace/kernel/scripts/Makefile.build:440: drivers/gpu] Error 2
make[3]: *** Waiting for unfinished jobs....
  CC      drivers/dma-buf/dma-fence.o
  CC      fs/nfs/symlink.o
  CC      net/ethtool/stats.o
  CC [M]  fs/efivarfs/inode.o
  CC      kernel/trace/ring_buffer.o
  CC      mm/memory.o
  CC [M]  fs/efivarfs/file.o
  CC      fs/nfs/unlink.o
  CC      lib/flex_proportions.o
  CC      fs/open.o
  CC      drivers/base/power/wakeup.o
  CC      sound/hda/hdac_component.o
  CC      net/ethtool/phc_vclocks.o
  CC      net/netfilter/nf_nat_proto.o
  CC      fs/lockd/svcproc.o
  CC      fs/9p/vfs_dentry.o
  CC      fs/lockd/svcsubs.o
  CC      drivers/tty/tty_baudrate.o
  CC      drivers/acpi/acpica/exmutex.o
  CC      arch/x86/kernel/cpu/debugfs.o
  CC      fs/ext4/mballoc.o
  CC      crypto/cbc.o
  CC      io_uring/memmap.o
  CC      fs/ext4/migrate.o
  CC      kernel/cgroup/namespace.o
  CC      lib/idr.o
  CC      fs/tracefs/event_inode.o
  CC      fs/read_write.o
  CC      drivers/base/power/wakeup_stats.o
  CC      fs/nfs/write.o
  CC      drivers/acpi/acpica/exnames.o
  CC      net/sunrpc/auth_gss/trace.o
  CC [M]  fs/efivarfs/super.o
  CC      fs/ext4/mmp.o
  CC      crypto/ctr.o
  CC      net/ethtool/mm.o
  CC      fs/9p/v9fs.o
  AR      fs/debugfs/built-in.a
  CC      drivers/tty/tty_jobctrl.o
  CC      fs/ext4/move_extent.o
  CC      sound/hda/hdac_i915.o
  CC      net/ethtool/module.o
  CC      kernel/time/posix-cpu-timers.o
  CC [M]  fs/efivarfs/vars.o
  CC      arch/x86/kernel/cpu/bus_lock.o
  CC      drivers/base/power/trace.o
  CC      lib/iomem_copy.o
  CC      net/sunrpc/auth_gss/gss_krb5_mech.o
  CC      mm/mincore.o
  CC      drivers/acpi/acpica/exoparg1.o
  CC      kernel/time/posix-clock.o
  CC      drivers/dma-buf/dma-fence-array.o
  CC      net/sunrpc/auth_gss/gss_krb5_seal.o
  CC      kernel/cgroup/cgroup-v1.o
  CC      mm/mlock.o
  CC      lib/irq_regs.o
  CC      io_uring/io-wq.o
  CC      net/ipv6/addrlabel.o
  CC      crypto/gcm.o
  CC      fs/9p/fid.o
  CC      fs/lockd/mon.o
  CC      lib/is_single_threaded.o
  CC      sound/hda/intel-dsp-config.o
  CC      lib/klist.o
  AR      fs/tracefs/built-in.a
  CC      drivers/tty/n_null.o
  CC      fs/9p/xattr.o
  CC      net/sunrpc/auth_tls.o
  CC      net/wireless/radiotap.o
  CC      drivers/base/driver.o
  CC      drivers/acpi/acpica/exoparg2.o
  CC      kernel/cgroup/freezer.o
  CC      fs/lockd/trace.o
  CC      drivers/dma-buf/dma-fence-chain.o
  CC      net/netfilter/nf_nat_helper.o
  LD [M]  fs/efivarfs/efivarfs.o
  CC      mm/mmap.o
  CC      net/ipv6/route.o
  CC      net/netfilter/nf_nat_masquerade.o
  AR      drivers/base/power/built-in.a
  CC      lib/kobject.o
  CC      fs/nfs/namespace.o
  CC      drivers/acpi/acpica/exoparg3.o
  CC      kernel/time/itimer.o
  CC      net/sunrpc/auth_gss/gss_krb5_unseal.o
  CC      arch/x86/kernel/cpu/capflags.o
  AR      arch/x86/kernel/cpu/built-in.a
  CC      kernel/bpf/core.o
  CC      net/sunrpc/auth_gss/gss_krb5_wrap.o
  CC      arch/x86/kernel/nmi.o
  CC      net/ipv4/tcp_input.o
  CC      drivers/tty/pty.o
  CC      sound/hda/intel-nhlt.o
  CC      drivers/base/class.o
  CC      net/ethtool/cmis_fw_update.o
  CC      drivers/base/platform.o
  CC      drivers/dma-buf/dma-fence-unwrap.o
  CC      kernel/events/core.o
  CC      fs/file_table.o
  CC      crypto/ccm.o
  CC      arch/x86/kernel/ldt.o
  CC      arch/x86/kernel/setup.o
  AR      fs/9p/built-in.a
  CC      drivers/acpi/acpica/exoparg6.o
  CC      crypto/aes_generic.o
  AR      net/mac80211/tests/built-in.a
  CC      net/netlabel/netlabel_user.o
  CC      net/mac80211/main.o
  CC      net/rfkill/core.o
  CC      net/9p/mod.o
  CC      lib/kobject_uevent.o
  CC      net/dns_resolver/dns_key.o
  CC      net/9p/client.o
  CC      fs/nfs/mount_clnt.o
  CC      kernel/fork.o
  CC      net/wireless/util.o
  CC      sound/hda/intel-sdw-acpi.o
  CC      net/netfilter/nf_nat_ftp.o
  CC      io_uring/futex.o
  CC      net/sunrpc/auth_gss/gss_krb5_crypto.o
  CC      drivers/dma-buf/dma-resv.o
  CC      drivers/acpi/acpica/exprep.o
  CC      net/core/utils.o
  CC      drivers/tty/tty_audit.o
  CC      fs/lockd/xdr.o
  CC      drivers/base/cpu.o
  CC      kernel/time/clockevents.o
  CC      kernel/trace/trace.o
  CC      mm/mmu_gather.o
  CC      arch/x86/kernel/x86_init.o
  CC      net/ethtool/cmis_cdb.o
  CC      lib/logic_pio.o
  CC      net/handshake/alert.o
  CC      fs/ext4/namei.o
  CC      kernel/exec_domain.o
  CC      net/rfkill/input.o
  CC      drivers/acpi/acpica/exregion.o
  CC      net/devres.o
  CC      net/wireless/reg.o
  CC      net/handshake/genl.o
  CC      net/ipv6/ip6_fib.o
  AR      sound/hda/built-in.a
  CC      net/handshake/netlink.o
  AR      sound/built-in.a
  CC      crypto/crc32c_generic.o
  CC      net/dns_resolver/dns_query.o
  CC      net/handshake/request.o
  CC      kernel/cgroup/legacy_freezer.o
  CC      net/netlabel/netlabel_kapi.o
  CC      drivers/acpi/reboot.o
  CC      net/handshake/tlshd.o
  CC      drivers/dma-buf/sync_file.o
  CC      fs/lockd/clnt4xdr.o
  CC      drivers/acpi/acpica/exresnte.o
  CC      kernel/time/tick-common.o
  CC      fs/lockd/xdr4.o
  CC      drivers/tty/sysrq.o
  CC      net/ethtool/pse-pd.o
  CC      drivers/acpi/acpica/exresolv.o
  CC      lib/maple_tree.o
  CC      crypto/authenc.o
  CC      io_uring/napi.o
  CC      net/core/link_watch.o
  CC      drivers/acpi/nvs.o
  CC      arch/x86/kernel/i8259.o
  CC      fs/nfs/nfstrace.o
  AR      net/rfkill/built-in.a
  CC      arch/x86/kernel/irqinit.o
  CC      mm/mprotect.o
  CC      drivers/base/firmware.o
  CC      net/netfilter/nf_nat_irc.o
  CC      fs/super.o
  CC      fs/nfs/export.o
  CC      kernel/time/tick-broadcast.o
  AR      net/dns_resolver/built-in.a
  CC      kernel/events/ring_buffer.o
  CC      net/sunrpc/auth_gss/gss_krb5_keys.o
  CC      net/9p/error.o
  CC      kernel/cgroup/pids.o
  CC      drivers/acpi/acpica/exresop.o
  CC      net/ipv4/tcp_output.o
  CC      fs/char_dev.o
  CC      net/netfilter/nf_nat_sip.o
  AR      drivers/dma-buf/built-in.a
  CC      kernel/time/tick-broadcast-hrtimer.o
  CC      net/core/filter.o
  CC      drivers/base/init.o
  CC      fs/ext4/page-io.o
  CC      mm/mremap.o
  CC      net/socket.o
  CC      kernel/trace/trace_output.o
  CC      lib/memcat_p.o
  CC      net/9p/protocol.o
  CC      drivers/acpi/acpica/exserial.o
  CC      kernel/panic.o
  CC      fs/stat.o
  AR      drivers/tty/built-in.a
  CC      net/sunrpc/auth_unix.o
  CC      kernel/events/callchain.o
  CC      arch/x86/kernel/jump_label.o
  CC      kernel/time/tick-oneshot.o
  CC      crypto/authencesn.o
  CC      net/sunrpc/svc.o
  CC      net/handshake/trace.o
  CC      net/netlabel/netlabel_domainhash.o
  CC      kernel/cgroup/rdma.o
  CC      net/ethtool/plca.o
  CC      kernel/trace/trace_seq.o
  CC      drivers/base/map.o
  CC      fs/lockd/svc4proc.o
  CC      fs/lockd/procfs.o
  CC      fs/ext4/readpage.o
  CC      net/9p/trans_common.o
  AR      kernel/bpf/built-in.a
  CC      net/ipv4/tcp_timer.o
  CC      drivers/base/devres.o
  CC      kernel/trace/trace_stat.o
  CC      drivers/acpi/acpica/exstore.o
  CC      kernel/trace/trace_printk.o
  CC      net/ipv4/tcp_ipv4.o
  CC      net/wireless/scan.o
  CC      kernel/time/tick-sched.o
  AR      io_uring/built-in.a
  CC      net/9p/trans_fd.o
  AR      net/sunrpc/auth_gss/built-in.a
  CC      net/ipv4/tcp_minisocks.o
  CC      net/ipv4/tcp_cong.o
  CC      net/ipv4/tcp_metrics.o
  CC      drivers/acpi/acpica/exstoren.o
  CC      arch/x86/kernel/irq_work.o
  CC      mm/msync.o
  CC      net/mac80211/status.o
  CC      net/ipv6/ipv6_sockglue.o
  CC      net/ipv6/ndisc.o
  CC      kernel/cgroup/cpuset.o
  CC      net/ipv6/udp.o
  CC      arch/x86/kernel/probe_roms.o
  CC      net/ipv4/tcp_fastopen.o
  CC      net/sunrpc/svcsock.o
  CC      drivers/acpi/wakeup.o
  CC      net/wireless/nl80211.o
  CC      net/netfilter/x_tables.o
  CC      crypto/lzo.o
  CC      fs/nfs/sysfs.o
  CC      drivers/acpi/acpica/exstorob.o
  CC      drivers/base/attribute_container.o
  CC      drivers/base/transport_class.o
  CC      net/core/sock_diag.o
  CC      drivers/acpi/acpica/exsystem.o
  CC      net/ethtool/phy.o
  CC      net/sunrpc/svcauth.o
  CC      net/ipv4/tcp_rate.o
  CC      net/netlabel/netlabel_addrlist.o
  CC      kernel/cpu.o
  CC      kernel/time/timer_migration.o
  AR      fs/lockd/built-in.a
  CC      mm/page_vma_mapped.o
  CC      drivers/base/topology.o
  CC      fs/ext4/resize.o
  CC      net/core/dev_ioctl.o
  AR      net/handshake/built-in.a
  CC      kernel/events/hw_breakpoint.o
  CC      drivers/acpi/acpica/extrace.o
  CC      net/core/tso.o
  CC      kernel/events/uprobes.o
  CC      fs/exec.o
  CC      fs/nfs/fs_context.o
  CC      crypto/lzo-rle.o
  CC      arch/x86/kernel/sys_ia32.o
  CC      kernel/trace/pid_list.o
  CC      kernel/cgroup/misc.o
  CC      net/9p/trans_virtio.o
  CC      net/sunrpc/svcauth_unix.o
  CC      lib/nmi_backtrace.o
  CC      drivers/acpi/acpica/exutils.o
  CC      drivers/base/container.o
  CC      drivers/base/property.o
  CC      lib/objpool.o
  CC      mm/pagewalk.o
  CC      drivers/acpi/acpica/hwacpi.o
  CC      net/ipv6/udplite.o
  CC      net/mac80211/driver-ops.o
  CC      net/ipv6/raw.o
  CC      net/sunrpc/addr.o
  CC      drivers/acpi/acpica/hwesleep.o
  AR      net/ethtool/built-in.a
  CC      net/sunrpc/rpcb_clnt.o
  CC      crypto/rng.o
  CC      net/sunrpc/timer.o
  CC      net/sunrpc/xdr.o
  CC      net/netlabel/netlabel_mgmt.o
  CC      fs/pipe.o
  CC      net/sunrpc/sunrpc_syms.o
  CC      arch/x86/kernel/ksysfs.o
  CC      net/sunrpc/cache.o
  CC      net/sunrpc/rpc_pipe.o
  CC      net/ipv6/icmp.o
  CC      fs/nfs/nfsroot.o
  CC      kernel/trace/trace_sched_switch.o
  CC      net/core/sock_reuseport.o
  CC      kernel/time/vsyscall.o
  CC      drivers/acpi/acpica/hwgpe.o
  CC      mm/pgtable-generic.o
  CC      fs/ext4/super.o
  CC      net/sysctl_net.o
  CC      net/netfilter/xt_tcpudp.o
  CC      arch/x86/kernel/bootflag.o
  CC      kernel/cgroup/debug.o
  CC      drivers/acpi/sleep.o
  CC      kernel/trace/trace_nop.o
  CC      drivers/acpi/device_sysfs.o
  CC      drivers/acpi/acpica/hwregs.o
  CC      crypto/drbg.o
  CC      arch/x86/kernel/e820.o
  CC      kernel/time/timekeeping_debug.o
  CC      net/ipv6/mcast.o
  AR      net/9p/built-in.a
  CC      kernel/time/namespace.o
  CC      kernel/exit.o
  CC      drivers/base/cacheinfo.o
  CC      drivers/base/swnode.o
  CC      net/ipv4/tcp_recovery.o
  CC      drivers/base/auxiliary.o
  CC      crypto/jitterentropy.o
  CC      arch/x86/kernel/pci-dma.o
  CC      lib/plist.o
  CC      drivers/acpi/acpica/hwsleep.o
  CC      mm/rmap.o
  CC      fs/nfs/sysctl.o
  CC      lib/radix-tree.o
  CC      net/ipv4/tcp_ulp.o
  CC      net/sunrpc/sysfs.o
  CC      kernel/trace/blktrace.o
  CC      net/netlabel/netlabel_unlabeled.o
  CC      net/netfilter/xt_CONNSECMARK.o
  CC      net/sunrpc/svc_xprt.o
  CC      fs/nfs/nfs3super.o
  CC      mm/vmalloc.o
  AR      kernel/cgroup/built-in.a
  CC      fs/namei.o
  CC      crypto/jitterentropy-kcapi.o
  CC      drivers/acpi/acpica/hwvalid.o
  CC      drivers/acpi/acpica/hwxface.o
  CC      fs/ext4/symlink.o
  CC      arch/x86/kernel/quirks.o
  CC      crypto/ghash-generic.o
  CC      net/core/fib_notifier.o
  CC      kernel/trace/trace_events.o
  CC      mm/vma.o
  CC      lib/ratelimit.o
  AR      kernel/time/built-in.a
  CC      kernel/softirq.o
  CC      fs/ext4/sysfs.o
  CC      crypto/hash_info.o
  CC      kernel/resource.o
  CC      fs/ext4/xattr.o
  CC      net/wireless/mlme.o
  CC      net/mac80211/sta_info.o
  CC      fs/ext4/xattr_hurd.o
  AR      kernel/events/built-in.a
  CC      net/netfilter/xt_NFLOG.o
  CC      net/netfilter/xt_SECMARK.o
  CC      net/wireless/ibss.o
  CC      mm/process_vm_access.o
  CC      drivers/acpi/acpica/hwxfsleep.o
  CC      net/netlabel/netlabel_cipso_v4.o
  CC      net/ipv4/tcp_offload.o
  CC      kernel/sysctl.o
  CC      fs/fcntl.o
  CC      drivers/base/devtmpfs.o
  CC      crypto/rsapubkey.asn1.o
  CC      crypto/rsaprivkey.asn1.o
  AR      crypto/built-in.a
  CC      fs/ext4/xattr_trusted.o
  CC      drivers/acpi/acpica/hwpci.o
  CC      net/mac80211/wep.o
  CC      drivers/base/module.o
  CC      drivers/acpi/device_pm.o
  CC      net/netfilter/xt_TCPMSS.o
  CC      mm/page_alloc.o
  CC      arch/x86/kernel/kdebugfs.o
  CC      net/netlabel/netlabel_calipso.o
  CC      net/core/xdp.o
  CC      lib/rbtree.o
  CC      kernel/capability.o
  CC      net/mac80211/aead_api.o
  CC      fs/nfs/nfs3client.o
  CC      net/ipv4/tcp_plb.o
  CC      drivers/acpi/acpica/nsaccess.o
  CC      drivers/acpi/acpica/nsalloc.o
  CC      drivers/acpi/proc.o
  CC      kernel/ptrace.o
  CC      drivers/acpi/bus.o
  CC      fs/ioctl.o
  CC      lib/seq_buf.o
  CC      drivers/acpi/glue.o
  CC      drivers/acpi/scan.o
  CC      net/mac80211/wpa.o
  CC      drivers/base/auxiliary_sysfs.o
  CC      drivers/base/devcoredump.o
  CC      net/wireless/sme.o
  CC      arch/x86/kernel/alternative.o
  CC      mm/page_frag_cache.o
  CC      lib/siphash.o
  CC      net/ipv4/datagram.o
  CC      arch/x86/kernel/i8253.o
  CC      drivers/acpi/acpica/nsarguments.o
  CC      arch/x86/kernel/hw_breakpoint.o
  CC      net/sunrpc/xprtmultipath.o
  CC      arch/x86/kernel/tsc.o
  CC      mm/init-mm.o
  CC      mm/memblock.o
  CC      mm/slub.o
  CC      kernel/trace/trace_export.o
  CC      lib/string.o
  CC      fs/ext4/xattr_user.o
  CC      net/sunrpc/stats.o
  CC      kernel/user.o
  CC      net/netfilter/xt_conntrack.o
  CC      kernel/signal.o
  CC      kernel/sys.o
  CC      drivers/acpi/acpica/nsconvert.o
  CC      mm/madvise.o
  CC      net/wireless/chan.o
  AR      net/netlabel/built-in.a
  CC      drivers/base/platform-msi.o
  CC      lib/timerqueue.o
  CC      lib/union_find.o
  CC      fs/nfs/nfs3proc.o
  CC      net/wireless/ethtool.o
  CC      net/ipv6/reassembly.o
  CC      net/ipv6/tcp_ipv6.o
  CC      kernel/umh.o
  CC      fs/ext4/fast_commit.o
  CC      net/core/flow_offload.o
  CC      lib/vsprintf.o
  CC      kernel/workqueue.o
  CC      kernel/trace/trace_event_perf.o
  CC      net/sunrpc/sysctl.o
  CC      kernel/trace/trace_events_filter.o
  CC      net/wireless/mesh.o
  CC      fs/readdir.o
  CC      kernel/trace/trace_events_trigger.o
  CC      drivers/acpi/acpica/nsdump.o
  CC      drivers/base/physical_location.o
  CC      net/core/gro.o
  CC      net/ipv6/ping.o
  CC      lib/win_minmax.o
  CC      net/mac80211/scan.o
  CC      lib/xarray.o
  CC      fs/select.o
  CC      drivers/acpi/acpica/nseval.o
  CC      net/ipv4/raw.o
  CC      net/wireless/ap.o
  CC      arch/x86/kernel/tsc_msr.o
  CC      mm/page_io.o
  CC      mm/swap_state.o
  CC      fs/nfs/nfs3xdr.o
  CC      kernel/trace/trace_eprobe.o
  CC      arch/x86/kernel/io_delay.o
  CC      drivers/acpi/acpica/nsinit.o
  CC      drivers/base/trace.o
  CC      fs/ext4/orphan.o
  CC      arch/x86/kernel/rtc.o
  CC      net/core/netdev-genl.o
  CC      fs/ext4/acl.o
  CC      net/netfilter/xt_policy.o
  CC      kernel/trace/trace_kprobe.o
  CC      fs/ext4/xattr_security.o
  CC      kernel/pid.o
  CC      mm/swapfile.o
  CC      net/ipv6/exthdrs.o
  CC      net/netfilter/xt_state.o
  CC      net/mac80211/offchannel.o
  CC      drivers/acpi/acpica/nsload.o
  CC [M]  net/netfilter/nf_log_syslog.o
  CC      kernel/task_work.o
  CC      net/core/netdev-genl-gen.o
  CC      drivers/acpi/mipi-disco-img.o
  CC      lib/lockref.o
  CC      net/mac80211/ht.o
  CC      lib/bcd.o
  CC [M]  net/netfilter/xt_mark.o
  CC      arch/x86/kernel/resource.o
  CC      kernel/trace/error_report-traces.o
  CC      drivers/acpi/acpica/nsnames.o
  CC      net/ipv4/udp.o
  CC      net/wireless/trace.o
  AR      drivers/base/built-in.a
  CC      lib/sort.o
  CC      fs/nfs/nfs3acl.o
  AR      net/sunrpc/built-in.a
  CC [M]  net/netfilter/xt_nat.o
  AS      arch/x86/kernel/irqflags.o
  CC [M]  net/netfilter/xt_LOG.o
  CC      lib/parser.o
  CC      net/core/gso.o
  CC      arch/x86/kernel/static_call.o
  CC      net/core/net-sysfs.o
  CC      drivers/acpi/resource.o
  CC      net/mac80211/agg-tx.o
  CC      drivers/acpi/acpi_processor.o
  CC      net/core/hotdata.o
  CC      drivers/acpi/acpica/nsobject.o
  CC      kernel/trace/power-traces.o
  CC      fs/dcache.o
  CC [M]  net/netfilter/xt_MASQUERADE.o
  CC      lib/debug_locks.o
  CC      arch/x86/kernel/process.o
  CC      kernel/trace/rpm-traces.o
  CC      fs/nfs/nfs4proc.o
  CC      mm/swap_slots.o
  CC      fs/nfs/nfs4xdr.o
  CC [M]  net/netfilter/xt_addrtype.o
  CC      net/ipv6/datagram.o
  CC      drivers/acpi/processor_core.o
  CC      net/ipv6/ip6_flowlabel.o
  CC      net/core/netdev_rx_queue.o
  CC      fs/inode.o
  CC      net/core/net-procfs.o
  CC      fs/attr.o
  CC      net/ipv6/inet6_connection_sock.o
  CC      kernel/extable.o
  CC      kernel/params.o
  CC      drivers/acpi/acpica/nsparse.o
  CC      kernel/kthread.o
  CC      kernel/sys_ni.o
  CC      net/mac80211/agg-rx.o
  CC      net/ipv6/udp_offload.o
  CC      net/mac80211/vht.o
  CC      lib/random32.o
  CC      lib/bust_spinlocks.o
  CC      drivers/acpi/acpica/nspredef.o
  CC      drivers/acpi/acpica/nsprepkg.o
  CC      net/core/netpoll.o
  CC      mm/dmapool.o
  CC      kernel/nsproxy.o
  CC      mm/hugetlb.o
  CC      lib/kasprintf.o
  CC      net/mac80211/he.o
  CC      drivers/acpi/acpica/nsrepair.o
  CC      net/core/fib_rules.o
  CC      fs/bad_inode.o
  CC      net/core/net-traces.o
  CC      fs/file.o
  CC      net/ipv6/seg6.o
  CC      fs/filesystems.o
  CC      net/wireless/ocb.o
  CC      net/wireless/pmsr.o
  CC      fs/namespace.o
  GEN     net/wireless/shipped-certs.c
  CC      mm/mmu_notifier.o
  CC      fs/nfs/nfs4state.o
  CC      kernel/trace/trace_dynevent.o
  CC      arch/x86/kernel/ptrace.o
  CC      drivers/acpi/acpica/nsrepair2.o
  CC      drivers/acpi/processor_pdc.o
  CC      kernel/notifier.o
  CC      net/core/selftests.o
  CC      net/ipv6/fib6_notifier.o
  CC      fs/nfs/nfs4renewd.o
  CC      lib/bitmap.o
  CC      fs/seq_file.o
  CC      net/ipv4/udplite.o
  AR      net/netfilter/built-in.a
  CC      net/core/ptp_classifier.o
  CC      arch/x86/kernel/tls.o
  CC      fs/nfs/nfs4super.o
  CC      drivers/acpi/acpica/nssearch.o
  CC      lib/scatterlist.o
  CC      fs/nfs/nfs4file.o
  CC      net/wireless/shipped-certs.o
  CC      kernel/trace/trace_probe.o
  CC      mm/migrate.o
  CC      net/mac80211/s1g.o
  CC      fs/nfs/delegation.o
  CC      net/ipv4/udp_offload.o
  CC      arch/x86/kernel/step.o
  CC      net/ipv6/rpl.o
  CC      net/core/netprio_cgroup.o
  CC      net/core/netclassid_cgroup.o
  CC      lib/list_sort.o
  CC      fs/nfs/nfs4idmap.o
  CC      drivers/acpi/acpica/nsutils.o
  CC      mm/page_counter.o
  CC      drivers/acpi/acpica/nswalk.o
  CC      drivers/acpi/acpica/nsxfeval.o
  CC      drivers/acpi/acpica/nsxfname.o
  CC      net/ipv4/arp.o
  CC      fs/xattr.o
  CC      kernel/ksysfs.o
  CC      net/ipv4/icmp.o
  CC      net/ipv6/ioam6.o
  CC      kernel/cred.o
  CC      mm/hugetlb_cgroup.o
  CC      drivers/acpi/ec.o
  CC      kernel/trace/trace_uprobe.o
  CC      net/core/dst_cache.o
  CC      kernel/reboot.o
  CC      kernel/async.o
  CC      net/ipv4/devinet.o
  CC      drivers/acpi/acpica/nsxfobj.o
  CC      arch/x86/kernel/i8237.o
  CC      fs/libfs.o
  CC      net/ipv6/sysctl_net_ipv6.o
  CC      drivers/acpi/dock.o
  CC      mm/early_ioremap.o
  CC      net/ipv6/xfrm6_policy.o
  CC      mm/secretmem.o
  CC      drivers/acpi/pci_root.o
  CC      arch/x86/kernel/stacktrace.o
  CC      net/ipv4/af_inet.o
  CC      lib/uuid.o
  CC      fs/fs-writeback.o
  CC      drivers/acpi/acpica/psargs.o
  CC      net/mac80211/ibss.o
  CC      fs/nfs/callback.o
  CC      mm/hmm.o
  CC      kernel/range.o
  CC      drivers/acpi/pci_link.o
  CC      lib/iov_iter.o
  CC      kernel/trace/rethook.o
  CC      drivers/acpi/acpica/psloop.o
  AR      fs/ext4/built-in.a
  CC      arch/x86/kernel/reboot.o
  CC      lib/clz_ctz.o
  CC      net/ipv4/igmp.o
  CC      lib/bsearch.o
  CC      arch/x86/kernel/msr.o
  CC      net/ipv6/xfrm6_state.o
  CC      fs/pnode.o
  CC      net/ipv6/xfrm6_input.o
  CC      drivers/acpi/pci_irq.o
  CC      fs/nfs/callback_xdr.o
  CC      lib/find_bit.o
  CC      drivers/acpi/acpi_apd.o
  CC      net/mac80211/iface.o
  CC      fs/splice.o
  CC      net/core/gro_cells.o
  CC      lib/llist.o
  CC      drivers/acpi/acpica/psobject.o
  CC      net/ipv6/xfrm6_output.o
  CC      drivers/acpi/acpi_platform.o
  CC      mm/memfd.o
  CC      kernel/smpboot.o
  CC      fs/nfs/callback_proc.o
  CC      net/mac80211/link.o
  CC      net/core/failover.o
  CC      fs/sync.o
  CC      mm/ptdump.o
  CC      arch/x86/kernel/cpuid.o
  CC      net/mac80211/rate.o
  CC      fs/utimes.o
  CC      arch/x86/kernel/early-quirks.o
  CC      net/mac80211/michael.o
  CC      mm/execmem.o
  CC      drivers/acpi/acpica/psopcode.o
  CC      kernel/ucount.o
  CC      arch/x86/kernel/smp.o
  CC      net/mac80211/tkip.o
  CC      net/ipv6/xfrm6_protocol.o
  CC      lib/lwq.o
  CC      fs/d_path.o
  CC      fs/stack.o
  CC      net/ipv6/netfilter.o
  CC      kernel/regset.o
  CC      arch/x86/kernel/smpboot.o
  CC      drivers/acpi/acpi_pnp.o
  CC      net/ipv4/fib_frontend.o
  CC      drivers/acpi/acpica/psopinfo.o
  CC      kernel/ksyms_common.o
  CC      lib/memweight.o
  CC      arch/x86/kernel/tsc_sync.o
  CC      drivers/acpi/acpica/psparse.o
  CC      net/mac80211/aes_cmac.o
  AR      kernel/trace/built-in.a
  CC      net/mac80211/aes_gmac.o
  CC      fs/fs_struct.o
  CC      fs/statfs.o
  CC      fs/fs_pin.o
  CC      net/mac80211/fils_aead.o
  CC      fs/nfs/nfs4namespace.o
  CC      kernel/groups.o
  CC      lib/kfifo.o
  CC      fs/nsfs.o
  CC      net/ipv4/fib_semantics.o
  CC      net/ipv6/proc.o
  CC      kernel/kcmp.o
  CC      net/mac80211/cfg.o
  CC      arch/x86/kernel/setup_percpu.o
  CC      net/ipv4/fib_trie.o
  CC      drivers/acpi/power.o
  AR      mm/built-in.a
  CC      arch/x86/kernel/mpparse.o
  CC      net/mac80211/ethtool.o
  CC      net/ipv4/fib_notifier.o
  CC      net/mac80211/rx.o
  CC      drivers/acpi/acpica/psscope.o
  CC      fs/fs_types.o
  CC      fs/fs_context.o
  CC      lib/percpu-refcount.o
  CC      drivers/acpi/event.o
  CC      drivers/acpi/acpica/pstree.o
  CC      net/ipv4/inet_fragment.o
  CC      lib/rhashtable.o
  CC      net/ipv6/syncookies.o
  CC      kernel/freezer.o
  CC      lib/base64.o
  CC      net/ipv6/calipso.o
  CC      kernel/profile.o
  CC      drivers/acpi/evged.o
  CC      arch/x86/kernel/trace_clock.o
  CC      kernel/stacktrace.o
  CC      net/ipv6/ah6.o
  CC      net/mac80211/spectmgmt.o
  CC      drivers/acpi/acpica/psutils.o
  CC      fs/nfs/nfs4getroot.o
  CC      drivers/acpi/sysfs.o
  CC      drivers/acpi/acpica/pswalk.o
  CC      fs/nfs/nfs4client.o
  CC      net/ipv4/ping.o
  AR      net/core/built-in.a
  CC      net/ipv6/esp6.o
  CC      arch/x86/kernel/trace.o
  CC      net/mac80211/tx.o
  CC      drivers/acpi/property.o
  CC      kernel/dma.o
  CC      fs/fs_parser.o
  CC      drivers/acpi/acpica/psxface.o
  CC      fs/nfs/nfs4session.o
  CC      net/mac80211/key.o
  CC      arch/x86/kernel/rethook.o
  CC      arch/x86/kernel/vmcore_info_32.o
  CC      drivers/acpi/acpica/rsaddr.o
  CC      kernel/smp.o
  CC      drivers/acpi/debugfs.o
  CC      fs/fsopen.o
  CC      net/mac80211/util.o
  CC      lib/once.o
  CC      arch/x86/kernel/machine_kexec_32.o
  CC      lib/refcount.o
  CC      fs/nfs/dns_resolve.o
  CC      fs/nfs/nfs4trace.o
  AS      arch/x86/kernel/relocate_kernel_32.o
  CC      fs/init.o
  CC      net/ipv6/sit.o
  CC      fs/nfs/nfs4sysctl.o
  CC      drivers/acpi/acpica/rscalc.o
  CC      lib/rcuref.o
  CC      drivers/acpi/acpi_lpat.o
  CC      fs/kernel_read_file.o
  CC      net/ipv4/ip_tunnel_core.o
  CC      net/ipv4/gre_offload.o
  CC      net/mac80211/parse.o
  CC      net/mac80211/wme.o
  CC      arch/x86/kernel/crash_dump_32.o
  CC      net/mac80211/chan.o
  CC      net/ipv6/addrconf_core.o
  CC      lib/usercopy.o
  CC      fs/mnt_idmapping.o
  CC      net/ipv6/exthdrs_core.o
  CC      drivers/acpi/acpica/rscreate.o
  CC      arch/x86/kernel/crash.o
  CC      net/ipv6/ip6_checksum.o
  CC      drivers/acpi/acpi_pcc.o
  CC      arch/x86/kernel/module.o
  CC      net/mac80211/trace.o
  CC      lib/errseq.o
  CC      fs/remap_range.o
  CC      net/ipv6/ip6_icmp.o
  CC      fs/pidfs.o
  CC      kernel/uid16.o
  CC      lib/bucket_locks.o
  CC      fs/buffer.o
  CC      drivers/acpi/ac.o
  CC      kernel/kallsyms.o
  CC      net/ipv6/output_core.o
  CC      drivers/acpi/acpica/rsdumpinfo.o
  CC      net/ipv6/protocol.o
  CC      arch/x86/kernel/doublefault_32.o
  CC      net/ipv6/ip6_offload.o
  CC      net/ipv6/tcpv6_offload.o
  CC      lib/generic-radix-tree.o
  CC      fs/mpage.o
  CC      net/mac80211/mlme.o
  CC      arch/x86/kernel/early_printk.o
  CC      drivers/acpi/button.o
  CC      net/mac80211/tdls.o
  CC      lib/bitmap-str.o
  CC      net/ipv4/metrics.o
  CC      net/ipv4/netlink.o
  CC      net/mac80211/ocb.o
  CC      drivers/acpi/acpica/rsinfo.o
  CC      net/ipv4/nexthop.o
  CC      arch/x86/kernel/hpet.o
  CC      drivers/acpi/fan_core.o
  CC      lib/string_helpers.o
  CC      drivers/acpi/fan_attr.o
  CC      net/mac80211/airtime.o
  CC      net/ipv4/udp_tunnel_stub.o
  CC      fs/proc_namespace.o
  CC      drivers/acpi/acpica/rsio.o
  CC      kernel/acct.o
  CC      net/ipv4/ip_tunnel.o
  CC      drivers/acpi/fan_hwmon.o
  CC      fs/direct-io.o
  CC      net/mac80211/eht.o
  CC      net/ipv6/exthdrs_offload.o
  CC      lib/hexdump.o
  CC      lib/kstrtox.o
  CC      lib/iomap.o
  CC      net/ipv4/sysctl_net_ipv4.o
  CC      lib/iomap_copy.o
  CC      kernel/vmcore_info.o
  CC      drivers/acpi/acpica/rsirq.o
  CC      net/ipv6/inet6_hashtables.o
  CC      kernel/elfcorehdr.o
  CC      net/ipv4/proc.o
  CC      arch/x86/kernel/amd_nb.o
  CC      arch/x86/kernel/kvm.o
  CC      fs/eventpoll.o
  CC      drivers/acpi/acpica/rslist.o
  CC      drivers/acpi/acpi_video.o
  CC      kernel/crash_reserve.o
  CC      net/mac80211/led.o
  CC      net/ipv4/fib_rules.o
  CC      net/ipv4/ipmr.o
  CC      net/mac80211/pm.o
  CC      arch/x86/kernel/kvmclock.o
  CC      drivers/acpi/acpica/rsmemory.o
  CC      kernel/kexec_core.o
  CC      net/ipv6/mcast_snoop.o
  CC      drivers/acpi/acpica/rsmisc.o
  CC      net/mac80211/rc80211_minstrel_ht.o
  CC      fs/anon_inodes.o
  CC      net/ipv4/ipmr_base.o
  CC      arch/x86/kernel/paravirt.o
  CC      drivers/acpi/video_detect.o
  CC      arch/x86/kernel/pvclock.o
  CC      net/ipv4/syncookies.o
  CC      lib/devres.o
  CC      kernel/crash_core.o
  CC      drivers/acpi/acpica/rsserial.o
  CC      fs/signalfd.o
  CC      kernel/kexec.o
  CC      net/ipv4/tunnel4.o
  CC      net/ipv4/ipconfig.o
  CC      kernel/utsname.o
  CC      drivers/acpi/processor_driver.o
  CC      net/ipv4/netfilter.o
  CC      fs/timerfd.o
  CC      drivers/acpi/acpica/rsutils.o
  CC      lib/check_signature.o
  CC      kernel/pid_namespace.o
  CC      drivers/acpi/acpica/rsxface.o
  CC      net/mac80211/wbrf.o
  CC      lib/interval_tree.o
  CC      arch/x86/kernel/pcspeaker.o
  CC      fs/eventfd.o
  CC      arch/x86/kernel/check.o
  CC      lib/assoc_array.o
  CC      arch/x86/kernel/uprobes.o
  CC      drivers/acpi/processor_thermal.o
  CC      fs/aio.o
  CC      kernel/stop_machine.o
  CC      net/ipv4/tcp_cubic.o
  CC      drivers/acpi/acpica/tbdata.o
  CC      net/ipv4/tcp_sigpool.o
  CC      fs/locks.o
  CC      arch/x86/kernel/perf_regs.o
  CC      lib/bitrev.o
  CC      arch/x86/kernel/tracepoint.o
  CC      net/ipv4/cipso_ipv4.o
  CC      drivers/acpi/acpica/tbfadt.o
  CC      fs/binfmt_misc.o
  CC      arch/x86/kernel/itmt.o
  AR      net/ipv6/built-in.a
  CC      lib/crc-ccitt.o
  CC      net/ipv4/xfrm4_policy.o
  CC      arch/x86/kernel/umip.o
  CC      fs/binfmt_script.o
  CC      lib/crc16.o
  CC      arch/x86/kernel/unwind_frame.o
  AR      fs/nfs/built-in.a
  CC      net/ipv4/xfrm4_state.o
  CC      drivers/acpi/processor_idle.o
  CC      fs/binfmt_elf.o
  CC      drivers/acpi/processor_throttling.o
  CC      kernel/audit.o
  HOSTCC  lib/gen_crc32table
  CC      kernel/auditfilter.o
  CC      drivers/acpi/acpica/tbfind.o
  CC      net/ipv4/xfrm4_input.o
  CC      drivers/acpi/processor_perflib.o
  CC      lib/xxhash.o
  CC      drivers/acpi/container.o
  CC      lib/genalloc.o
  CC      drivers/acpi/acpica/tbinstal.o
  CC      net/ipv4/xfrm4_output.o
  CC      lib/percpu_counter.o
  CC      net/ipv4/xfrm4_protocol.o
  CC      lib/audit.o
  CC      drivers/acpi/thermal_lib.o
  CC      drivers/acpi/thermal.o
  CC      kernel/auditsc.o
  CC      drivers/acpi/nhlt.o
  CC      drivers/acpi/acpi_memhotplug.o
  CC      drivers/acpi/ioapic.o
  CC      drivers/acpi/acpica/tbprint.o
  CC      drivers/acpi/battery.o
  CC      lib/syscall.o
  CC      fs/mbcache.o
  CC      drivers/acpi/acpica/tbutils.o
  CC      kernel/audit_watch.o
  CC      drivers/acpi/bgrt.o
  CC      lib/errname.o
  AR      arch/x86/kernel/built-in.a
  CC      drivers/acpi/acpica/tbxface.o
  CC      lib/nlattr.o
  AR      arch/x86/built-in.a
  CC      drivers/acpi/spcr.o
  CC      fs/posix_acl.o
  CC      kernel/audit_fsnotify.o
  CC      drivers/acpi/acpica/tbxfload.o
  CC      kernel/audit_tree.o
  CC      fs/coredump.o
  CC      lib/cpu_rmap.o
  CC      kernel/kprobes.o
  CC      fs/drop_caches.o
  CC      kernel/seccomp.o
  CC      fs/sysctls.o
  CC      fs/fhandle.o
  AR      net/wireless/built-in.a
  CC      drivers/acpi/acpica/tbxfroot.o
  CC      lib/dynamic_queue_limits.o
  CC      drivers/acpi/acpica/utaddress.o
  CC      kernel/relay.o
  CC      kernel/utsname_sysctl.o
  CC      lib/glob.o
  CC      drivers/acpi/acpica/utalloc.o
  CC      kernel/delayacct.o
  CC      lib/strncpy_from_user.o
  CC      kernel/taskstats.o
  CC      kernel/tsacct.o
  CC      drivers/acpi/acpica/utascii.o
  CC      kernel/tracepoint.o
  CC      lib/strnlen_user.o
  CC      drivers/acpi/acpica/utbuffer.o
  CC      kernel/irq_work.o
  CC      drivers/acpi/acpica/utcksum.o
  CC      kernel/static_call.o
  CC      lib/net_utils.o
  CC      kernel/padata.o
  CC      drivers/acpi/acpica/utcopy.o
  CC      lib/sg_pool.o
  CC      kernel/jump_label.o
  CC      lib/stackdepot.o
  CC      lib/asn1_decoder.o
  CC      kernel/context_tracking.o
  GEN     lib/oid_registry_data.c
  CC      kernel/iomem.o
  CC      drivers/acpi/acpica/utexcep.o
  CC      kernel/rseq.o
  CC      lib/ucs2_string.o
  CC      lib/sbitmap.o
  CC      drivers/acpi/acpica/utdecode.o
  CC      drivers/acpi/acpica/utdebug.o
  CC      lib/group_cpus.o
  CC      drivers/acpi/acpica/utdelete.o
  CC      lib/fw_table.o
  CC      drivers/acpi/acpica/uterror.o
  CC      drivers/acpi/acpica/uteval.o
  CC      drivers/acpi/acpica/utglobal.o
  CC      drivers/acpi/acpica/uthex.o
  AR      lib/lib.a
  CC      drivers/acpi/acpica/utids.o
  CC      drivers/acpi/acpica/utinit.o
  CC      drivers/acpi/acpica/utlock.o
  GEN     lib/crc32table.h
  CC      drivers/acpi/acpica/utmath.o
  AR      net/ipv4/built-in.a
  CC      lib/oid_registry.o
  CC      drivers/acpi/acpica/utmisc.o
  CC      drivers/acpi/acpica/utmutex.o
  CC      lib/crc32.o
  CC      drivers/acpi/acpica/utnonansi.o
  CC      drivers/acpi/acpica/utobject.o
  CC      drivers/acpi/acpica/utosi.o
  CC      drivers/acpi/acpica/utownerid.o
  CC      drivers/acpi/acpica/utpredef.o
  CC      drivers/acpi/acpica/utresdecode.o
  CC      drivers/acpi/acpica/utresrc.o
  CC      drivers/acpi/acpica/utstate.o
  CC      drivers/acpi/acpica/utstring.o
  CC      drivers/acpi/acpica/utstrsuppt.o
  CC      drivers/acpi/acpica/utstrtoul64.o
  CC      drivers/acpi/acpica/utxface.o
  CC      drivers/acpi/acpica/utxfinit.o
  CC      drivers/acpi/acpica/utxferror.o
  CC      drivers/acpi/acpica/utxfmutex.o
  AR      lib/built-in.a
  AR      drivers/acpi/acpica/built-in.a
  AR      drivers/acpi/built-in.a
make[2]: *** [/workspace/kernel/scripts/Makefile.build:440: drivers] Error 2
make[2]: *** Waiting for unfinished jobs....
  AR      fs/built-in.a
  AR      kernel/built-in.a
  AR      net/mac80211/built-in.a
  AR      net/built-in.a
make[1]: *** [/workspace/kernel/Makefile:1989: .] Error 2
make: *** [/workspace/kernel/Makefile:251: __sub-make] Error 2
run-parts: /workspace/ci/hooks/11-build-32b exited with return code 2


