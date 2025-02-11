Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B21C0219E
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 15:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DA310E6F7;
	Tue, 11 Feb 2025 15:49:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B82C10E0EE;
 Tue, 11 Feb 2025 15:49:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_drm/i915/display=3A_implement_?=
 =?utf-8?q?wa=5F18038517565_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Feb 2025 15:49:36 -0000
Message-ID: <173928897642.974576.5701230456146047499@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250211152400.460496-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250211152400.460496-1-vinod.govindapillai@intel.com>
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

Series: drm/i915/display: implement wa_18038517565 (rev2)
URL   : https://patchwork.freedesktop.org/series/144183/
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
  CC      /workspace/kernel/build64-default/tools/objtool/elf.o
  CC      /workspace/kernel/build64-default/tools/objtool/objtool.o
  CC      /workspace/kernel/build64-default/tools/objtool/orc_gen.o
  CC      /workspace/kernel/build64-default/tools/objtool/orc_dump.o
  CC      /workspace/kernel/build64-default/tools/objtool/libstring.o
  CC      /workspace/kernel/build64-default/tools/objtool/libctype.o
  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/special.o
  CC      /workspace/kernel/build64-default/tools/objtool/str_error_r.o
  CC      /workspace/kernel/build64-default/tools/objtool/librbtree.o
  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/decode.o
  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/orc.o
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
  WRAP    arch/x86/include/generated/uapi/asm/ioctl.h
  WRAP    arch/x86/include/generated/uapi/asm/fcntl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctls.h
  WRAP    arch/x86/include/generated/uapi/asm/ipcbuf.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  WRAP    arch/x86/include/generated/uapi/asm/param.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  WRAP    arch/x86/include/generated/uapi/asm/resource.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  WRAP    arch/x86/include/generated/uapi/asm/socket.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  UPD     include/generated/uapi/linux/version.h
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
  WRAP    arch/x86/include/generated/asm/local64.h
  WRAP    arch/x86/include/generated/asm/mmiowb.h
  WRAP    arch/x86/include/generated/asm/module.lds.h
  HOSTCC  scripts/kallsyms
  WRAP    arch/x86/include/generated/asm/rwonce.h
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
  CHKSHA1 /workspace/kernel/include/linux/atomic/atomic-instrumented.h
  CHKSHA1 /workspace/kernel/include/linux/atomic/atomic-arch-fallback.h
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
  CC      ipc/util.o
  CC      security/commoncap.o
  CC      ipc/msgutil.o
  CC      init/initramfs.o
  CC      block/bdev.o
  CC      security/lsm_syscalls.o
  CC      init/calibrate.o
  CC      ipc/msg.o
  CC      block/fops.o
  CC      mm/filemap.o
  CC      io_uring/io_uring.o
  CC      init/init_task.o
  CC      ipc/sem.o
  CC      security/min_addr.o
  AR      arch/x86/crypto/built-in.a
  AS      arch/x86/lib/atomic64_cx8_32.o
  CC      block/bio.o
  CC      arch/x86/realmode/init.o
  CC      security/keys/gc.o
  AR      arch/x86/net/built-in.a
  CC      arch/x86/pci/i386.o
  CC      security/integrity/iint.o
  CC      arch/x86/power/cpu.o
  CC      arch/x86/video/video-common.o
  HOSTCC  security/selinux/genheaders
  CC      block/partitions/core.o
  AR      virt/lib/built-in.a
  CC      arch/x86/events/amd/core.o
  CC      net/core/sock.o
  CC      lib/math/div64.o
  CC      arch/x86/virt/svm/cmdline.o
  CC      arch/x86/mm/pat/set_memory.o
  AR      arch/x86/platform/atom/built-in.a
  AR      sound/i2c/other/built-in.a
  CC      arch/x86/kernel/fpu/init.o
  AR      arch/x86/virt/vmx/built-in.a
  AR      virt/built-in.a
  AR      drivers/cache/built-in.a
  AR      sound/drivers/opl3/built-in.a
  CC      fs/notify/dnotify/dnotify.o
  CC      sound/core/seq/seq.o
  AR      sound/i2c/built-in.a
  AR      sound/isa/ad1816a/built-in.a
  AR      sound/pci/ac97/built-in.a
  AS      arch/x86/lib/checksum_32.o
  CC      arch/x86/entry/vdso/vma.o
  AR      arch/x86/platform/ce4100/built-in.a
  AR      drivers/irqchip/built-in.a
  AR      sound/drivers/opl4/built-in.a
  CC      lib/math/gcd.o
  AR      sound/isa/ad1848/built-in.a
  CC      arch/x86/kernel/cpu/mce/core.o
  AR      drivers/bus/mhi/built-in.a
  AR      sound/pci/ali5451/built-in.a
  AR      sound/pci/asihpi/built-in.a
  AR      sound/drivers/mpu401/built-in.a
  CC      arch/x86/platform/efi/memmap.o
  AR      drivers/bus/built-in.a
  CC      security/keys/key.o
  AR      sound/isa/cs423x/built-in.a
  CC      kernel/sched/core.o
  CC      arch/x86/lib/cmdline.o
  AR      sound/pci/au88x0/built-in.a
  AR      sound/drivers/vx/built-in.a
  AR      sound/isa/es1688/built-in.a
  AR      drivers/pwm/built-in.a
  AR      sound/drivers/pcsp/built-in.a
  AR      sound/pci/aw2/built-in.a
  AR      sound/isa/galaxy/built-in.a
  AR      sound/drivers/built-in.a
  CC      crypto/asymmetric_keys/asymmetric_type.o
  AR      drivers/leds/trigger/built-in.a
  AR      sound/pci/ctxfi/built-in.a
  AR      sound/isa/gus/built-in.a
  AR      sound/isa/msnd/built-in.a
  AR      sound/pci/ca0106/built-in.a
  AR      drivers/leds/blink/built-in.a
  CC      io_uring/opdef.o
  AR      drivers/leds/simple/built-in.a
  CC      security/keys/keyring.o
  CC      drivers/leds/led-core.o
  AR      sound/pci/cs46xx/built-in.a
  AR      sound/isa/opti9xx/built-in.a
  AR      arch/x86/virt/svm/built-in.a
  AR      arch/x86/virt/built-in.a
  AR      sound/pci/cs5535audio/built-in.a
  AR      sound/isa/sb/built-in.a
  CC      security/keys/keyctl.o
  AR      sound/pci/lola/built-in.a
  AR      sound/isa/wavefront/built-in.a
  AR      sound/pci/lx6464es/built-in.a
  AR      sound/isa/wss/built-in.a
  AR      sound/isa/built-in.a
  CC      lib/math/lcm.o
  AR      sound/pci/echoaudio/built-in.a
  AS      arch/x86/lib/cmpxchg8b_emu.o
  GEN     security/selinux/flask.h security/selinux/av_permissions.h
  AR      sound/pci/emu10k1/built-in.a
  CC      block/partitions/msdos.o
  CC      security/selinux/avc.o
  CC      arch/x86/lib/cpu.o
  CC      sound/pci/hda/hda_bind.o
  CC      lib/math/int_log.o
  CC      ipc/shm.o
  CC      lib/math/int_pow.o
  GEN     usr/initramfs_data.cpio
  COPY    usr/initramfs_inc_data
  AS      usr/initramfs_data.o
  CC      lib/math/int_sqrt.o
  HOSTCC  certs/extract-cert
  AR      usr/built-in.a
  CC      arch/x86/kernel/fpu/bugs.o
  CC      arch/x86/kernel/acpi/boot.o
  CC      lib/math/reciprocal_div.o
  CC      arch/x86/kernel/fpu/core.o
  CC      lib/math/rational.o
  CC      sound/core/seq/seq_lock.o
  CC      arch/x86/lib/delay.o
  AS      arch/x86/realmode/rm/header.o
  AS      arch/x86/realmode/rm/trampoline_32.o
  AR      arch/x86/video/built-in.a
  CC      ipc/syscall.o
  AS      arch/x86/realmode/rm/stack.o
  CC      security/selinux/hooks.o
  AS      arch/x86/realmode/rm/reboot.o
  CERT    certs/x509_certificate_list
  CERT    certs/signing_key.x509
  AS      certs/system_certificates.o
  CC      security/integrity/integrity_audit.o
  AS      arch/x86/realmode/rm/wakeup_asm.o
  AR      certs/built-in.a
  AS      arch/x86/lib/getuser.o
  CC      arch/x86/power/hibernate_32.o
  CC      kernel/sched/fair.o
  CC      drivers/leds/led-class.o
  CC      arch/x86/realmode/rm/wakemain.o
  AS      arch/x86/power/hibernate_asm_32.o
  CC      arch/x86/events/amd/lbr.o
  CC      sound/core/sound.o
  CC      arch/x86/power/hibernate.o
  AR      fs/notify/dnotify/built-in.a
  CC      arch/x86/pci/init.o
  CC      arch/x86/realmode/rm/video-mode.o
  CC      fs/notify/inotify/inotify_fsnotify.o
  CC      crypto/asymmetric_keys/restrict.o
  CC      security/keys/permission.o
  CC      arch/x86/platform/efi/quirks.o
  CC      arch/x86/entry/vdso/extable.o
  AS      arch/x86/realmode/rm/copy.o
  CC      arch/x86/events/intel/core.o
  GEN     arch/x86/lib/inat-tables.c
  CC      arch/x86/kernel/cpu/mtrr/mtrr.o
  CC      block/elevator.o
  CC      arch/x86/lib/insn-eval.o
  AS      arch/x86/realmode/rm/bioscall.o
  AR      lib/math/built-in.a
  CC      arch/x86/realmode/rm/regs.o
  CC      sound/pci/hda/hda_codec.o
  CC      lib/crypto/mpi/generic_mpih-lshift.o
  CC      sound/core/seq/seq_clientmgr.o
  CC      arch/x86/realmode/rm/video-vga.o
  CC      block/partitions/efi.o
  CC      net/ethernet/eth.o
  CC      lib/crypto/mpi/generic_mpih-mul1.o
  CC      lib/crypto/memneq.o
  CC      arch/x86/realmode/rm/video-vesa.o
  AR      net/802/built-in.a
  CC      drivers/leds/led-triggers.o
  CC      crypto/asymmetric_keys/signature.o
  CC      arch/x86/realmode/rm/video-bios.o
  AR      arch/x86/platform/geode/built-in.a
  CC      lib/zlib_inflate/inffast.o
  CC      sound/core/seq/seq_memory.o
  PASYMS  arch/x86/realmode/rm/pasyms.h
  CC      ipc/ipc_sysctl.o
  LDS     arch/x86/entry/vdso/vdso32/vdso32.lds
  CC      net/sched/sch_generic.o
  LDS     arch/x86/realmode/rm/realmode.lds
  CC      arch/x86/kernel/apic/apic.o
  CC      arch/x86/kernel/kprobes/core.o
  LD      arch/x86/realmode/rm/realmode.elf
  RELOCS  arch/x86/realmode/rm/realmode.relocs
  OBJCOPY arch/x86/realmode/rm/realmode.bin
  AS      arch/x86/realmode/rmpiggy.o
  CC      fs/notify/inotify/inotify_user.o
  CC      arch/x86/kernel/kprobes/opt.o
  AR      arch/x86/realmode/built-in.a
  CC      crypto/api.o
  CC      arch/x86/events/intel/bts.o
  CC      arch/x86/mm/pat/memtype.o
  AR      fs/notify/fanotify/built-in.a
  CC      fs/notify/fsnotify.o
  CC      block/blk-core.o
  CC      lib/zlib_inflate/inflate.o
  AR      security/integrity/built-in.a
  CC      arch/x86/pci/pcbios.o
  CC      arch/x86/pci/mmconfig_32.o
  AR      sound/ppc/built-in.a
  AR      arch/x86/power/built-in.a
  CC      fs/nfs_common/nfsacl.o
  CC      init/version.o
  CC      lib/zlib_deflate/deflate.o
  CC      kernel/locking/mutex.o
  CC      security/keys/process_keys.o
  CC      block/blk-sysfs.o
  CC      arch/x86/kernel/acpi/sleep.o
  CC      net/core/request_sock.o
  CC      arch/x86/events/amd/ibs.o
  CC      sound/core/seq/seq_queue.o
  CC      lib/crypto/mpi/generic_mpih-mul2.o
  CC      crypto/asymmetric_keys/public_key.o
  AS      arch/x86/entry/vdso/vdso32/note.o
  AR      init/built-in.a
  AS      arch/x86/entry/vdso/vdso32/system_call.o
  CC      arch/x86/kernel/cpu/mce/severity.o
  AS      arch/x86/entry/vdso/vdso32/sigreturn.o
  CC      arch/x86/kernel/cpu/mtrr/if.o
  CC      arch/x86/entry/vdso/vdso32/vclock_gettime.o
  CC      arch/x86/kernel/fpu/regset.o
  CC      lib/crypto/mpi/generic_mpih-mul3.o
  CC      arch/x86/platform/efi/efi.o
  CC      ipc/mqueue.o
  CC      arch/x86/lib/insn.o
  AR      arch/x86/platform/iris/built-in.a
  CC      lib/crypto/mpi/generic_mpih-rshift.o
  CC      sound/pci/hda/hda_jack.o
  AR      block/partitions/built-in.a
  AR      drivers/leds/built-in.a
  CC      kernel/sched/build_policy.o
  CC      drivers/pci/msi/pcidev_msi.o
  CC      kernel/power/qos.o
  CC      lib/zlib_inflate/infutil.o
  AR      sound/arm/built-in.a
  AR      sound/pci/ice1712/built-in.a
  CC      security/selinux/selinuxfs.o
  CC      fs/notify/notification.o
  CC      arch/x86/lib/kaslr.o
  CC      arch/x86/pci/direct.o
  CC      mm/mempool.o
  CC      fs/nfs_common/grace.o
  CC      lib/zlib_deflate/deftree.o
  CC      arch/x86/kernel/cpu/mtrr/generic.o
  AS      arch/x86/kernel/acpi/wakeup_32.o
  CC      arch/x86/mm/pat/memtype_interval.o
  CC      fs/nfs_common/common.o
  CC      arch/x86/kernel/acpi/cstate.o
  AR      fs/notify/inotify/built-in.a
  CC      sound/core/init.o
  CC      arch/x86/mm/init.o
  CC      sound/pci/hda/hda_auto_parser.o
  ASN.1   crypto/asymmetric_keys/x509.asn1.[ch]
  CC      fs/iomap/trace.o
  ASN.1   crypto/asymmetric_keys/x509_akid.asn1.[ch]
  CC      lib/zlib_inflate/inftrees.o
  CC      crypto/asymmetric_keys/x509_loader.o
  CC      fs/iomap/iter.o
  AR      arch/x86/kernel/kprobes/built-in.a
  CC      arch/x86/lib/memcpy_32.o
  CC      arch/x86/events/zhaoxin/core.o
  AR      net/ethernet/built-in.a
  CC      arch/x86/pci/mmconfig-shared.o
  CC      arch/x86/entry/vdso/vdso32/vgetcpu.o
  AS      arch/x86/lib/memmove_32.o
  CC      arch/x86/kernel/cpu/mce/genpool.o
  CC      arch/x86/lib/misc.o
  CC      sound/core/seq/seq_fifo.o
  HOSTCC  arch/x86/entry/vdso/vdso2c
  CC      lib/crypto/mpi/generic_mpih-sub1.o
  CC      arch/x86/lib/pc-conf-reg.o
  CC      lib/zlib_inflate/inflate_syms.o
  CC      net/sched/sch_mq.o
  CC      arch/x86/kernel/fpu/signal.o
  CC      arch/x86/kernel/cpu/mtrr/cleanup.o
  CC      crypto/asymmetric_keys/x509_public_key.o
  CC      arch/x86/platform/efi/efi_32.o
  CC      security/keys/request_key.o
  CC      drivers/pci/msi/api.o
  AS      arch/x86/lib/putuser.o
  AS      arch/x86/lib/retpoline.o
  CC      arch/x86/lib/string_32.o
  CC      fs/notify/group.o
  CC      fs/notify/mark.o
  CC      kernel/locking/semaphore.o
  CC      arch/x86/lib/strstr_32.o
  CC      lib/zlib_deflate/deflate_syms.o
  CC      arch/x86/lib/usercopy.o
  AR      lib/zlib_inflate/built-in.a
  CC      kernel/locking/rwsem.o
  AR      arch/x86/kernel/acpi/built-in.a
  CC      arch/x86/events/amd/uncore.o
  CC      arch/x86/lib/usercopy_32.o
  AR      sound/sh/built-in.a
  CC      io_uring/kbuf.o
  CC      arch/x86/entry/vdso/vdso32-setup.o
  AR      arch/x86/mm/pat/built-in.a
  CC      arch/x86/kernel/apic/apic_common.o
  CC      kernel/power/main.o
  CC      arch/x86/kernel/fpu/xstate.o
  CC      net/netlink/af_netlink.o
  CC      kernel/printk/printk.o
  AR      fs/nfs_common/built-in.a
  CC      security/selinux/netlink.o
  CC      lib/crypto/mpi/generic_mpih-add1.o
  CC      sound/core/seq/seq_prioq.o
  CC      arch/x86/kernel/cpu/mce/intel.o
  CC      block/blk-flush.o
  CC      mm/oom_kill.o
  CC      net/core/skbuff.o
  CC      drivers/video/console/dummycon.o
  AR      drivers/idle/built-in.a
  ASN.1   crypto/asymmetric_keys/pkcs7.asn1.[ch]
  AR      net/bpf/built-in.a
  CC      crypto/asymmetric_keys/pkcs7_trust.o
  CC      net/ethtool/ioctl.o
  CC      crypto/asymmetric_keys/pkcs7_verify.o
  AR      lib/zlib_deflate/built-in.a
  VDSO    arch/x86/entry/vdso/vdso32.so.dbg
  CC      arch/x86/lib/msr-smp.o
  CC      arch/x86/platform/intel/iosf_mbi.o
  OBJCOPY arch/x86/entry/vdso/vdso32.so
  VDSO2C  arch/x86/entry/vdso/vdso-image-32.c
  CC      arch/x86/entry/vdso/vdso-image-32.o
  CC      kernel/sched/build_utility.o
  CC      arch/x86/lib/cache-smp.o
  CC      arch/x86/mm/init_32.o
  CC      arch/x86/kernel/cpu/mtrr/amd.o
  CC      lib/crypto/mpi/mpicoder.o
  AR      arch/x86/events/zhaoxin/built-in.a
  CC      lib/crypto/mpi/mpi-add.o
  AS      arch/x86/platform/efi/efi_stub_32.o
  CC      arch/x86/pci/fixup.o
  CC      arch/x86/platform/efi/runtime-map.o
  CC      arch/x86/kernel/apic/apic_noop.o
  CC      ipc/namespace.o
  CC      kernel/power/console.o
  CC      drivers/pci/msi/msi.o
  CC      drivers/video/backlight/backlight.o
  CC      security/keys/request_key_auth.o
  CC      security/security.o
  CC      arch/x86/lib/crc32-glue.o
  AR      sound/synth/emux/built-in.a
  CC      sound/pci/hda/hda_sysfs.o
  AR      sound/synth/built-in.a
  LDS     arch/x86/kernel/vmlinux.lds
  CC      fs/iomap/buffered-io.o
  AR      sound/usb/misc/built-in.a
  AR      arch/x86/entry/vdso/built-in.a
  CC      lib/crypto/mpi/mpi-bit.o
  AR      sound/usb/usx2y/built-in.a
  CC      sound/pci/hda/hda_controller.o
  AR      arch/x86/entry/vsyscall/built-in.a
  AS      arch/x86/entry/entry.o
  AR      sound/usb/caiaq/built-in.a
  CC      net/sched/sch_frag.o
  AR      sound/usb/6fire/built-in.a
  AS      arch/x86/entry/entry_32.o
  AR      sound/usb/hiface/built-in.a
  AR      sound/usb/bcd2000/built-in.a
  AR      sound/usb/built-in.a
  CC      crypto/asymmetric_keys/x509.asn1.o
  CC      arch/x86/events/intel/ds.o
  CC      arch/x86/entry/syscall_32.o
  CC      crypto/asymmetric_keys/x509_akid.asn1.o
  CC      lib/crypto/utils.o
  CC      crypto/asymmetric_keys/x509_cert_parser.o
  CC      fs/notify/fdinfo.o
  CC      drivers/video/console/vgacon.o
  CC      kernel/locking/percpu-rwsem.o
  CC      arch/x86/kernel/cpu/mce/amd.o
  CC      sound/core/seq/seq_timer.o
  CC      arch/x86/kernel/apic/ipi.o
  CC      lib/lzo/lzo1x_compress.o
  CC      arch/x86/kernel/cpu/mtrr/cyrix.o
  CC      drivers/pci/msi/irqdomain.o
  AS      arch/x86/lib/crc32-pclmul.o
  CC      kernel/power/process.o
  CC      arch/x86/lib/msr.o
  CC      ipc/mq_sysctl.o
  CC      io_uring/rsrc.o
  AR      arch/x86/platform/intel/built-in.a
  CC      block/blk-settings.o
  CC      block/blk-ioc.o
  CC      lib/lz4/lz4_decompress.o
  CC      lib/zstd/zstd_decompress_module.o
  CC      kernel/power/suspend.o
  CC      net/ethtool/common.o
  AR      arch/x86/events/amd/built-in.a
  CC      net/sched/sch_api.o
  AR      arch/x86/platform/efi/built-in.a
  CC      security/keys/user_defined.o
  AR      arch/x86/kernel/fpu/built-in.a
  CC      kernel/printk/printk_safe.o
  AR      arch/x86/platform/intel-mid/built-in.a
  AR      arch/x86/platform/intel-quark/built-in.a
  CC      security/keys/proc.o
  AR      arch/x86/platform/olpc/built-in.a
  AR      arch/x86/platform/scx200/built-in.a
  CC      lib/crypto/mpi/mpi-cmp.o
  AR      arch/x86/platform/ts5500/built-in.a
  CC      fs/iomap/direct-io.o
  AR      arch/x86/platform/uv/built-in.a
  AR      arch/x86/platform/built-in.a
  CC      arch/x86/mm/fault.o
  CC      crypto/asymmetric_keys/pkcs7.asn1.o
  CC      fs/quota/dquot.o
  CC      crypto/asymmetric_keys/pkcs7_parser.o
  CC      arch/x86/pci/acpi.o
  CC      fs/proc/task_mmu.o
  AR      drivers/video/backlight/built-in.a
  AR      fs/notify/built-in.a
  CC      net/sched/sch_blackhole.o
  CC      fs/kernfs/mount.o
  AR      ipc/built-in.a
  CC      net/sched/cls_api.o
  CC      kernel/locking/spinlock.o
  CC      arch/x86/kernel/apic/vector.o
  CC      kernel/locking/osq_lock.o
  CC      lib/lzo/lzo1x_decompress_safe.o
  CC      lib/zstd/decompress/huf_decompress.o
  CC      arch/x86/kernel/cpu/mtrr/centaur.o
  CC      sound/core/seq/seq_system.o
  CC      security/selinux/nlmsgtab.o
  CC      fs/proc/inode.o
  CC      arch/x86/entry/common.o
  AR      drivers/pci/msi/built-in.a
  CC      drivers/pci/pcie/portdrv.o
  CC      arch/x86/pci/legacy.o
  CC      net/core/datagram.o
  CC      lib/crypto/mpi/mpi-sub-ui.o
  CC      mm/fadvise.o
  CC      kernel/locking/qspinlock.o
  AS      arch/x86/lib/msr-reg.o
  CC      arch/x86/lib/msr-reg-export.o
  AR      crypto/asymmetric_keys/built-in.a
  CC      crypto/cipher.o
  CC      security/keys/sysctl.o
  CC      sound/pci/hda/hda_proc.o
  AR      drivers/video/console/built-in.a
  CC      net/ethtool/netlink.o
  CC      drivers/video/aperture.o
  AR      drivers/video/fbdev/core/built-in.a
  AR      drivers/video/fbdev/omap/built-in.a
  AR      lib/lzo/built-in.a
  AR      drivers/video/fbdev/omap2/omapfb/dss/built-in.a
  CC      drivers/video/cmdline.o
  AR      drivers/video/fbdev/omap2/omapfb/displays/built-in.a
  AR      drivers/video/fbdev/omap2/omapfb/built-in.a
  AR      drivers/video/fbdev/omap2/built-in.a
  CC      block/blk-map.o
  AR      drivers/video/fbdev/built-in.a
  CC      sound/core/seq/seq_ports.o
  CC      fs/kernfs/inode.o
  CC      arch/x86/events/core.o
  AS      arch/x86/lib/hweight.o
  CC      arch/x86/lib/iomem.o
  CC      arch/x86/kernel/cpu/mtrr/legacy.o
  CC      lib/crypto/chacha.o
  CC      fs/kernfs/dir.o
  CC      fs/iomap/fiemap.o
  CC      kernel/power/hibernate.o
  CC      arch/x86/mm/ioremap.o
  CC      arch/x86/kernel/cpu/mce/threshold.o
  CC      security/keys/keyctl_pkey.o
  CC      kernel/locking/rtmutex_api.o
  CC      block/blk-merge.o
  CC      io_uring/notif.o
  CC      kernel/printk/nbcon.o
  CC      drivers/video/nomodeset.o
  CC      arch/x86/pci/irq.o
  CC      lib/crypto/mpi/mpi-div.o
  CC      arch/x86/lib/atomic64_32.o
  AR      lib/lz4/built-in.a
  CC      arch/x86/kernel/apic/init.o
  CC      kernel/irq/irqdesc.o
  AR      arch/x86/kernel/cpu/mtrr/built-in.a
  CC      net/netlink/genetlink.o
  CC      kernel/rcu/update.o
  CC      block/blk-timeout.o
  CC      sound/core/seq/seq_info.o
  CC      arch/x86/lib/inat.o
  CC      crypto/compress.o
  CC      arch/x86/events/intel/knc.o
  AS      arch/x86/entry/thunk.o
  CC      kernel/irq/handle.o
  AR      arch/x86/entry/built-in.a
  CC      drivers/pci/pcie/rcec.o
  CC      lib/crypto/mpi/mpi-mod.o
  CC      kernel/printk/printk_ringbuffer.o
  CC      security/selinux/netif.o
  CC      mm/maccess.o
  AR      arch/x86/lib/built-in.a
  AR      arch/x86/lib/lib.a
  CC      lib/crypto/aes.o
  AR      drivers/char/ipmi/built-in.a
  CC      block/blk-lib.o
  AR      kernel/livepatch/built-in.a
  CC      fs/iomap/seek.o
  CC      drivers/video/hdmi.o
  CC      lib/zstd/decompress/zstd_ddict.o
  CC      security/lsm_audit.o
  CC      fs/iomap/swapfile.o
  CC      net/core/stream.o
  CC      arch/x86/pci/common.o
  CC      mm/page-writeback.o
  CC      arch/x86/kernel/apic/hw_nmi.o
  AR      security/keys/built-in.a
  CC      lib/zstd/decompress/zstd_decompress.o
  CC      fs/proc/root.o
  CC      mm/folio-compat.o
  CC      sound/pci/hda/hda_hwdep.o
  CC      sound/core/seq/seq_dummy.o
  CC      arch/x86/mm/extable.o
  CC      arch/x86/mm/mmap.o
  CC      crypto/algapi.o
  CC      security/device_cgroup.o
  CC      lib/xz/xz_dec_syms.o
  CC      net/ethtool/bitset.o
  AR      sound/pci/korg1212/built-in.a
  CC      lib/crypto/mpi/mpi-mul.o
  CC      kernel/dma/mapping.o
  CC      kernel/dma/direct.o
  CC      lib/dim/dim.o
  CC      kernel/irq/manage.o
  CC      lib/fonts/fonts.o
  CC      drivers/pci/pcie/bwctrl.o
  CC      kernel/locking/qrwlock.o
  CC      security/selinux/netnode.o
  CC      kernel/printk/sysctl.o
  CC      fs/quota/quota_v2.o
  AR      arch/x86/kernel/cpu/mce/built-in.a
  CC      lib/fonts/font_8x16.o
  CC      arch/x86/kernel/cpu/microcode/core.o
  CC      arch/x86/events/intel/lbr.o
  AS      arch/x86/kernel/head_32.o
  CC      fs/kernfs/file.o
  CC      kernel/rcu/sync.o
  CC      sound/core/memory.o
  CC      io_uring/tctx.o
  CC      lib/xz/xz_dec_stream.o
  CC      net/netfilter/core.o
  AR      fs/iomap/built-in.a
  CC      kernel/power/snapshot.o
  CC      net/ipv4/netfilter/nf_defrag_ipv4.o
  CC      arch/x86/kernel/apic/io_apic.o
  AR      sound/firewire/built-in.a
  AR      drivers/video/built-in.a
  CC      arch/x86/kernel/apic/msi.o
  AR      sound/core/seq/built-in.a
  CC      lib/dim/net_dim.o
  CC      drivers/acpi/acpica/dsargs.o
  CC      arch/x86/kernel/apic/probe_32.o
  CC      net/ipv4/route.o
  CC      sound/core/control.o
  CC      kernel/dma/ops_helpers.o
  CC      net/ethtool/strset.o
  CC      sound/pci/hda/hda_intel.o
  AR      kernel/printk/built-in.a
  CC      net/ipv4/inetpeer.o
  CC      net/ipv4/protocol.o
  CC      fs/proc/base.o
  AR      lib/fonts/built-in.a
  AR      sound/pci/mixart/built-in.a
  CC      arch/x86/kernel/head32.o
  CC      arch/x86/kernel/cpu/microcode/intel.o
  AR      kernel/locking/built-in.a
  CC      net/netlink/policy.o
  CC      arch/x86/pci/early.o
  CC      lib/crypto/mpi/mpih-cmp.o
  CC      lib/zstd/decompress/zstd_decompress_block.o
  CC      block/blk-mq.o
  AR      kernel/sched/built-in.a
  CC      fs/quota/quota_tree.o
  CC      drivers/pci/pcie/aspm.o
  CC      arch/x86/mm/pgtable.o
  CC      sound/core/misc.o
  CC      drivers/acpi/acpica/dscontrol.o
  CC      lib/xz/xz_dec_lzma2.o
  CC      security/selinux/netport.o
  CC      crypto/scatterwalk.o
  CC      mm/readahead.o
  CC      net/sched/act_api.o
  CC      net/ipv4/ip_input.o
  CC      net/xfrm/xfrm_policy.o
  CC      lib/argv_split.o
  CC      drivers/pnp/pnpacpi/core.o
  AR      drivers/amba/built-in.a
  AR      sound/sparc/built-in.a
  CC      drivers/pnp/pnpacpi/rsparser.o
  CC      crypto/proc.o
  CC      net/ethtool/linkinfo.o
  CC      drivers/pci/pcie/pme.o
  CC      crypto/aead.o
  CC      lib/crypto/mpi/mpih-div.o
  CC      io_uring/filetable.o
  CC      drivers/acpi/acpica/dsdebug.o
  CC      arch/x86/pci/bus_numa.o
  CC      lib/crypto/mpi/mpih-mul.o
  CC      kernel/dma/remap.o
  CC      fs/kernfs/symlink.o
  CC      fs/proc/generic.o
  CC      fs/sysfs/file.o
  CC      arch/x86/kernel/cpu/microcode/amd.o
  CC      lib/dim/rdma_dim.o
  CC      kernel/irq/spurious.o
  CC      arch/x86/events/intel/p4.o
  AR      sound/spi/built-in.a
  CC      net/ipv4/ip_fragment.o
  CC      net/ipv4/netfilter/nf_reject_ipv4.o
  CC      net/ethtool/linkmodes.o
  AR      net/netlink/built-in.a
  CC      net/ethtool/rss.o
  CC      arch/x86/events/probe.o
  CC      mm/swap.o
  CC      drivers/acpi/acpica/dsfield.o
  CC      lib/xz/xz_dec_bcj.o
  CC      arch/x86/mm/physaddr.o
  CC      lib/crypto/mpi/mpi-pow.o
  AR      sound/parisc/built-in.a
  CC      drivers/pnp/core.o
  CC      block/blk-mq-tag.o
  CC      fs/quota/quota.o
  CC      kernel/rcu/srcutree.o
  CC      net/netfilter/nf_log.o
  AR      lib/dim/built-in.a
  CC      block/blk-stat.o
  CC      lib/zstd/zstd_common_module.o
  AR      sound/pcmcia/vx/built-in.a
  AR      sound/mips/built-in.a
  AR      sound/pcmcia/pdaudiocf/built-in.a
  CC      fs/quota/kqid.o
  AR      sound/pcmcia/built-in.a
  CC      sound/core/device.o
  CC      net/sched/sch_fifo.o
  CC      arch/x86/events/intel/p6.o
  CC      net/unix/af_unix.o
  CC      net/core/scm.o
  AR      drivers/pnp/pnpacpi/built-in.a
  CC      arch/x86/pci/amd_bus.o
  CC      net/core/gen_stats.o
  CC      kernel/irq/resend.o
  CC      security/selinux/status.o
  AR      fs/kernfs/built-in.a
  CC      net/core/gen_estimator.o
  CC      io_uring/rw.o
  CC      drivers/acpi/acpica/dsinit.o
  CC      crypto/geniv.o
  CC      kernel/power/swap.o
  CC      kernel/irq/chip.o
  AR      sound/pci/hda/built-in.a
  CC      io_uring/net.o
  AR      drivers/pci/pcie/built-in.a
  AR      sound/pci/nm256/built-in.a
  AR      lib/xz/built-in.a
  AR      drivers/pci/pwrctrl/built-in.a
  AR      sound/pci/oxygen/built-in.a
  CC      fs/sysfs/dir.o
  AR      drivers/clk/actions/built-in.a
  AR      sound/pci/pcxhr/built-in.a
  CC      drivers/pci/hotplug/pci_hotplug_core.o
  AR      drivers/clk/analogbits/built-in.a
  AR      sound/pci/riptide/built-in.a
  CC      drivers/dma/dw/core.o
  AR      arch/x86/kernel/apic/built-in.a
  AR      drivers/clk/bcm/built-in.a
  CC      arch/x86/mm/tlb.o
  AR      sound/pci/rme9652/built-in.a
  AR      drivers/clk/imgtec/built-in.a
  AR      sound/pci/trident/built-in.a
  CC      drivers/dma/hsu/hsu.o
  AR      drivers/clk/imx/built-in.a
  AR      sound/pci/ymfpci/built-in.a
  AR      drivers/clk/ingenic/built-in.a
  AR      kernel/dma/built-in.a
  AR      sound/pci/vx222/built-in.a
  AR      sound/pci/built-in.a
  AR      drivers/clk/mediatek/built-in.a
  AR      drivers/clk/microchip/built-in.a
  AR      drivers/clk/mstar/built-in.a
  AR      sound/soc/built-in.a
  AR      drivers/soc/apple/built-in.a
  CC      fs/sysfs/symlink.o
  CC      net/ipv4/netfilter/ip_tables.o
  AR      drivers/clk/mvebu/built-in.a
  AR      drivers/soc/aspeed/built-in.a
  CC      kernel/power/user.o
  AR      drivers/clk/ralink/built-in.a
  AR      drivers/soc/bcm/built-in.a
  AR      drivers/clk/renesas/built-in.a
  AR      drivers/soc/fsl/built-in.a
  AR      drivers/clk/socfpga/built-in.a
  AR      drivers/soc/fujitsu/built-in.a
  AR      drivers/clk/sophgo/built-in.a
  AR      drivers/soc/hisilicon/built-in.a
  AR      drivers/soc/imx/built-in.a
  AR      drivers/clk/sprd/built-in.a
  AR      drivers/soc/ixp4xx/built-in.a
  AR      drivers/clk/starfive/built-in.a
  CC      drivers/pnp/card.o
  CC      lib/crypto/mpi/mpiutil.o
  AR      drivers/soc/loongson/built-in.a
  AR      drivers/clk/sunxi-ng/built-in.a
  AR      arch/x86/kernel/cpu/microcode/built-in.a
  CC      arch/x86/kernel/cpu/cacheinfo.o
  AR      drivers/soc/mediatek/built-in.a
  AR      drivers/clk/ti/built-in.a
  AR      drivers/soc/microchip/built-in.a
  AR      drivers/clk/versatile/built-in.a
  CC      kernel/power/poweroff.o
  AR      drivers/clk/xilinx/built-in.a
  AR      drivers/soc/nuvoton/built-in.a
  AR      drivers/clk/built-in.a
  AR      drivers/soc/pxa/built-in.a
  AR      drivers/soc/amlogic/built-in.a
  CC      sound/core/info.o
  CC      net/ethtool/linkstate.o
  CC      drivers/acpi/acpica/dsmethod.o
  AR      drivers/soc/qcom/built-in.a
  CC      lib/zstd/common/debug.o
  CC      security/selinux/ss/ebitmap.o
  AR      drivers/soc/renesas/built-in.a
  AR      drivers/soc/rockchip/built-in.a
  CC      security/selinux/ss/hashtab.o
  AR      drivers/soc/sunxi/built-in.a
  AR      drivers/soc/ti/built-in.a
  CC      fs/proc/array.o
  AR      drivers/soc/versatile/built-in.a
  AR      drivers/soc/xilinx/built-in.a
  AR      drivers/soc/built-in.a
  CC      net/ethtool/debug.o
  CC      mm/truncate.o
  CC      drivers/dma/dw/dw.o
  CC      arch/x86/mm/cpu_entry_area.o
  CC      lib/bug.o
  CC      io_uring/poll.o
  CC      net/sched/cls_cgroup.o
  CC      mm/vmscan.o
  CC      arch/x86/events/intel/pt.o
  CC      mm/shrinker.o
  AR      arch/x86/pci/built-in.a
  AR      drivers/acpi/pmic/built-in.a
  CC      lib/crypto/arc4.o
  CC      net/unix/garbage.o
  CC      fs/quota/netlink.o
  CC      kernel/rcu/tree.o
  AR      drivers/dma/idxd/built-in.a
  CC      drivers/acpi/acpica/dsmthdat.o
  CC      fs/proc/fd.o
  CC      drivers/acpi/acpica/dsobject.o
  CC      lib/zstd/common/entropy_common.o
  CC      net/netfilter/nf_queue.o
  CC      drivers/pci/hotplug/acpi_pcihp.o
  AR      lib/crypto/mpi/built-in.a
  CC      fs/sysfs/mount.o
  CC      sound/core/isadma.o
  AR      drivers/dma/hsu/built-in.a
  CC      net/ipv4/netfilter/iptable_filter.o
  CC      crypto/lskcipher.o
  CC      block/blk-mq-sysfs.o
  CC      net/sched/ematch.o
  CC      arch/x86/events/intel/uncore.o
  CC      kernel/rcu/rcu_segcblist.o
  CC      kernel/irq/dummychip.o
  AR      drivers/dma/amd/built-in.a
  CC      arch/x86/mm/maccess.o
  CC      drivers/pnp/driver.o
  CC      lib/crypto/gf128mul.o
  CC      lib/zstd/common/error_private.o
  CC      lib/zstd/common/fse_decompress.o
  CC      net/core/net_namespace.o
  CC      fs/sysfs/group.o
  CC      arch/x86/kernel/ebda.o
  CC      drivers/dma/dw/idma32.o
  CC      drivers/dma/dw/acpi.o
  CC      drivers/virtio/virtio.o
  CC      fs/devpts/inode.o
  CC      net/ethtool/wol.o
  CC      drivers/acpi/acpica/dsopcode.o
  CC      lib/crypto/blake2s.o
  CC      arch/x86/mm/pgprot.o
  CC      kernel/irq/devres.o
  AR      kernel/power/built-in.a
  CC      net/ipv4/netfilter/iptable_mangle.o
  CC      arch/x86/kernel/cpu/scattered.o
  CC      sound/core/vmaster.o
  CC      lib/buildid.o
  CC      arch/x86/events/intel/uncore_nhmex.o
  CC      drivers/virtio/virtio_ring.o
  CC      arch/x86/kernel/platform-quirks.o
  AR      sound/atmel/built-in.a
  CC      lib/zstd/common/zstd_common.o
  CC      drivers/acpi/dptf/int340x_thermal.o
  CC      sound/core/ctljack.o
  CC      net/netfilter/nf_sockopt.o
  CC      mm/shmem.o
  CC      drivers/pnp/resource.o
  AR      drivers/pci/hotplug/built-in.a
  CC      security/selinux/ss/symtab.o
  AR      lib/zstd/built-in.a
  CC      lib/crypto/blake2s-generic.o
  AR      drivers/pci/controller/dwc/built-in.a
  CC      net/ipv4/netfilter/ipt_REJECT.o
  CC      net/netfilter/utils.o
  AR      drivers/pci/controller/mobiveil/built-in.a
  AR      fs/quota/built-in.a
  AR      drivers/pci/controller/plda/built-in.a
  CC      net/unix/sysctl_net_unix.o
  AR      drivers/pci/controller/built-in.a
  CC      fs/proc/proc_tty.o
  AR      drivers/pci/switch/built-in.a
  CC      block/blk-mq-cpumap.o
  CC      drivers/acpi/acpica/dspkginit.o
  CC      drivers/pci/access.o
  CC      arch/x86/events/utils.o
  CC      lib/clz_tab.o
  CC      security/selinux/ss/sidtab.o
  CC      sound/core/jack.o
  CC      arch/x86/kernel/cpu/topology_common.o
  CC      lib/crypto/sha1.o
  CC      kernel/irq/kexec.o
  AR      fs/sysfs/built-in.a
  CC      drivers/pnp/manager.o
  CC      arch/x86/mm/pgtable_32.o
  CC      net/xfrm/xfrm_state.o
  CC      arch/x86/events/intel/uncore_snb.o
  AR      drivers/dma/dw/built-in.a
  CC      mm/util.o
  CC      crypto/skcipher.o
  AR      drivers/dma/mediatek/built-in.a
  AR      drivers/dma/qcom/built-in.a
  CC      arch/x86/events/intel/uncore_snbep.o
  AR      drivers/dma/stm32/built-in.a
  AR      drivers/dma/ti/built-in.a
  CC      fs/proc/cmdline.o
  CC      fs/proc/consoles.o
  AR      drivers/dma/xilinx/built-in.a
  CC      drivers/dma/dmaengine.o
  AR      drivers/acpi/dptf/built-in.a
  CC      lib/crypto/sha256.o
  CC      arch/x86/mm/iomap_32.o
  CC      net/ethtool/features.o
  AR      fs/devpts/built-in.a
  CC      net/ipv6/netfilter/ip6_tables.o
  CC      net/ipv6/af_inet6.o
  CC      arch/x86/kernel/process_32.o
  AR      net/sched/built-in.a
  CC      net/ipv6/anycast.o
  CC      sound/core/hwdep.o
  CC      io_uring/eventfd.o
  CC      sound/hda/hda_bus_type.o
  CC      drivers/acpi/acpica/dsutils.o
  CC      fs/netfs/buffered_read.o
  CC      fs/ext4/balloc.o
  CC      fs/jbd2/transaction.o
  CC      kernel/irq/autoprobe.o
  CC      arch/x86/mm/hugetlbpage.o
  CC      sound/hda/hdac_bus.o
  CC      arch/x86/kernel/cpu/topology_ext.o
  CC      fs/jbd2/commit.o
  CC      crypto/seqiv.o
  CC      block/blk-mq-sched.o
  CC      drivers/pci/bus.o
  CC      crypto/echainiv.o
  CC      block/ioctl.o
  CC      arch/x86/kernel/cpu/topology_amd.o
  CC      net/packet/af_packet.o
  CC      fs/proc/cpuinfo.o
  AR      net/dsa/built-in.a
  CC [M]  net/ipv4/netfilter/iptable_nat.o
  CC      arch/x86/kernel/cpu/common.o
  CC      arch/x86/kernel/signal.o
  CC      net/core/secure_seq.o
  CC      arch/x86/kernel/cpu/rdrand.o
  CC      arch/x86/mm/dump_pagetables.o
  CC      drivers/acpi/acpica/dswexec.o
  CC      arch/x86/kernel/cpu/match.o
  AR      lib/crypto/built-in.a
  AR      net/unix/built-in.a
  CC      lib/cmdline.o
  CC      net/ethtool/privflags.o
  CC      drivers/pnp/support.o
  CC      net/ethtool/rings.o
  CC      arch/x86/mm/highmem_32.o
  CC      net/ipv4/ip_forward.o
  CC      kernel/irq/irqdomain.o
  CC      sound/core/timer.o
  CC      lib/cpumask.o
  CC      net/netfilter/nfnetlink.o
  CC      io_uring/uring_cmd.o
  CC      drivers/tty/vt/vt_ioctl.o
  CC      drivers/tty/vt/vc_screen.o
  CC      io_uring/openclose.o
  CC      fs/jbd2/recovery.o
  CC      arch/x86/events/rapl.o
  CC      fs/ramfs/inode.o
  CC      net/ethtool/channels.o
  CC      sound/hda/hdac_device.o
  CC      drivers/acpi/acpica/dswload.o
  CC      fs/ext4/bitmap.o
  CC      security/selinux/ss/avtab.o
  CC      arch/x86/kernel/signal_32.o
  CC      drivers/char/hw_random/core.o
  CC      fs/proc/devices.o
  CC      crypto/ahash.o
  CC      drivers/dma/virt-dma.o
  CC      drivers/pci/probe.o
  CC      drivers/virtio/virtio_anchor.o
  CC      fs/netfs/buffered_write.o
  CC      drivers/pnp/interface.o
  CC      net/netfilter/nfnetlink_log.o
  CC      kernel/entry/common.o
  CC      lib/ctype.o
  AR      arch/x86/mm/built-in.a
  CC      drivers/tty/vt/selection.o
  CC      lib/dec_and_lock.o
  CC      drivers/acpi/acpica/dswload2.o
  CC      drivers/pci/host-bridge.o
  CC      net/ipv6/ip6_output.o
  CC      block/genhd.o
  CC      net/ipv4/ip_options.o
  CC      sound/core/hrtimer.o
  CC      lib/decompress.o
  CC      lib/decompress_bunzip2.o
  AR      net/ipv4/netfilter/built-in.a
  CC      arch/x86/kernel/cpu/bugs.o
  CC      fs/ramfs/file-mmu.o
  CC      drivers/dma/acpi-dma.o
  CC      net/ipv6/ip6_input.o
  CC      net/ipv6/netfilter/ip6table_filter.o
  CC      crypto/shash.o
  CC      sound/hda/hdac_sysfs.o
  CC      drivers/char/hw_random/intel-rng.o
  CC      drivers/acpi/x86/apple.o
  CC      fs/proc/interrupts.o
  CC      net/core/flow_dissector.o
  CC      net/netfilter/nf_conntrack_core.o
  CC      drivers/virtio/virtio_pci_modern_dev.o
  CC      drivers/pnp/quirks.o
  CC      fs/jbd2/checkpoint.o
  CC      fs/ext4/block_validity.o
  CC      net/xfrm/xfrm_hash.o
  CC      drivers/acpi/acpica/dswscope.o
  CC      kernel/irq/proc.o
  CC      net/xfrm/xfrm_input.o
  CC      net/ethtool/coalesce.o
  CC      drivers/char/hw_random/amd-rng.o
  CC      drivers/char/agp/backend.o
  CC      drivers/virtio/virtio_pci_legacy_dev.o
  CC      io_uring/sqpoll.o
  CC      kernel/module/main.o
  CC      kernel/time/time.o
  CC      fs/ext4/dir.o
  CC      fs/jbd2/revoke.o
  CC      mm/mmzone.o
  CC      block/ioprio.o
  CC      arch/x86/kernel/traps.o
  CC      arch/x86/events/intel/uncore_discovery.o
  CC      kernel/module/strict_rwx.o
  CC      drivers/tty/vt/keyboard.o
  CC      sound/core/pcm.o
  CC      security/selinux/ss/policydb.o
  CC      drivers/acpi/acpica/dswstate.o
  CC      fs/proc/loadavg.o
  CC      drivers/acpi/x86/cmos_rtc.o
  CC      fs/netfs/direct_read.o
  AR      fs/ramfs/built-in.a
  CC      fs/netfs/direct_write.o
  CC      lib/decompress_inflate.o
  CC      kernel/entry/syscall_user_dispatch.o
  AR      drivers/dma/built-in.a
  CC      lib/decompress_unlz4.o
  CC      sound/core/pcm_native.o
  CC      kernel/module/kmod.o
  AR      kernel/rcu/built-in.a
  CC      arch/x86/kernel/idt.o
  CC      sound/hda/hdac_regmap.o
  CC      kernel/irq/migration.o
  CC      drivers/acpi/acpica/evevent.o
  CC      drivers/virtio/virtio_pci_modern.o
  CC      drivers/pnp/system.o
  CC      drivers/char/hw_random/geode-rng.o
  CC      crypto/akcipher.o
  CC      mm/vmstat.o
  CC      drivers/char/agp/generic.o
  CC      fs/hugetlbfs/inode.o
  CC      kernel/time/timer.o
  CC      net/ethtool/pause.o
  CC      net/ipv6/netfilter/ip6table_mangle.o
  CC      drivers/pci/remove.o
  CC      fs/proc/meminfo.o
  CC      sound/core/pcm_lib.o
  CC      kernel/module/tree_lookup.o
  CC      net/ipv6/addrconf.o
  CC      drivers/char/agp/isoch.o
  CC      fs/jbd2/journal.o
  CC      net/ipv4/ip_output.o
  CC      drivers/acpi/x86/lpss.o
  CC      block/badblocks.o
  CC      drivers/char/agp/amd64-agp.o
  CC      lib/decompress_unlzma.o
  CC      drivers/acpi/acpica/evgpe.o
  CC      lib/decompress_unlzo.o
  AR      kernel/entry/built-in.a
  CC      drivers/pci/pci.o
  CC      kernel/irq/cpuhotplug.o
  CC      fs/ext4/ext4_jbd2.o
  CC      fs/proc/stat.o
  AR      drivers/pnp/built-in.a
  CC      drivers/virtio/virtio_pci_common.o
  CC      arch/x86/events/intel/cstate.o
  CC      security/selinux/ss/services.o
  CC      kernel/time/hrtimer.o
  CC      block/blk-rq-qos.o
  CC      fs/netfs/iterator.o
  CC      arch/x86/kernel/cpu/aperfmperf.o
  CC      arch/x86/events/msr.o
  CC      drivers/char/hw_random/via-rng.o
  CC      io_uring/xattr.o
  CC      sound/hda/hdac_controller.o
  AR      sound/x86/built-in.a
  CC      drivers/tty/vt/vt.o
  CC      net/xfrm/xfrm_output.o
  CC      drivers/acpi/acpica/evgpeblk.o
  CC      drivers/acpi/tables.o
  CC      fs/fat/cache.o
  CC      crypto/sig.o
  CC      net/netfilter/nf_conntrack_standalone.o
  CC      arch/x86/kernel/cpu/cpuid-deps.o
  CC      net/sunrpc/auth_gss/auth_gss.o
  CC      drivers/acpi/x86/s2idle.o
  CC      net/sunrpc/auth_gss/gss_mech_switch.o
  CC      drivers/char/mem.o
  AR      net/packet/built-in.a
  AR      drivers/iommu/amd/built-in.a
  CC      security/selinux/ss/conditional.o
  AR      drivers/char/hw_random/built-in.a
  AR      drivers/iommu/intel/built-in.a
  CC      sound/core/pcm_misc.o
  AR      drivers/iommu/arm/arm-smmu/built-in.a
  CC      net/ipv6/addrlabel.o
  AR      drivers/iommu/arm/arm-smmu-v3/built-in.a
  AR      drivers/iommu/arm/built-in.a
  CC      fs/proc/uptime.o
  AR      drivers/iommu/iommufd/built-in.a
  CC      kernel/irq/pm.o
  CC      drivers/char/agp/intel-agp.o
  CC      net/ethtool/eee.o
  AR      drivers/iommu/riscv/built-in.a
  CC      lib/decompress_unxz.o
  CC      drivers/iommu/iommu.o
  CC      net/core/sysctl_net_core.o
  AR      net/wireless/tests/built-in.a
  CC      net/wireless/core.o
  CC      drivers/acpi/acpica/evgpeinit.o
  CC      net/ipv4/ip_sockglue.o
  CC      block/disk-events.o
  CC      drivers/char/agp/intel-gtt.o
  AR      arch/x86/events/intel/built-in.a
  CC      arch/x86/kernel/cpu/umwait.o
  CC      net/ipv6/netfilter/nf_defrag_ipv6_hooks.o
  CC      security/selinux/ss/mls.o
  CC      mm/backing-dev.o
  AR      arch/x86/events/built-in.a
  CC      drivers/virtio/virtio_pci_legacy.o
  CC      net/ipv6/route.o
  CC      kernel/irq/msi.o
  CC      fs/netfs/locking.o
  CC      io_uring/nop.o
  CC      kernel/module/kallsyms.o
  CC      sound/hda/hdac_stream.o
  AR      fs/hugetlbfs/built-in.a
  COPY    drivers/tty/vt/defkeymap.c
  CC      arch/x86/kernel/irq.o
  CC      lib/decompress_unzstd.o
  CC      drivers/acpi/acpica/evgpeutil.o
  CC      fs/proc/util.o
  CC      fs/fat/dir.o
  CC      crypto/kpp.o
  CC      net/sunrpc/clnt.o
  CC      drivers/pci/pci-driver.o
  CC      net/core/dev.o
  CC      drivers/acpi/x86/utils.o
  CC      net/netfilter/nf_conntrack_expect.o
  CC      drivers/char/random.o
  CC      fs/ext4/extents.o
  CC      net/ipv6/ip6_fib.o
  CC      drivers/virtio/virtio_pci_admin_legacy_io.o
  CC      kernel/time/sleep_timeout.o
  CC      net/sunrpc/xprt.o
  MKCAP   arch/x86/kernel/cpu/capflags.c
  CC      drivers/acpi/acpica/evglock.o
  CC      net/ethtool/tsinfo.o
  CC      drivers/acpi/acpica/evhandler.o
  CC      net/ethtool/cabletest.o
  CC      block/blk-ia-ranges.o
  CC      lib/dump_stack.o
  CC      sound/core/pcm_memory.o
  CC      io_uring/fs.o
  CC      io_uring/splice.o
  CC      fs/proc/version.o
  CC      io_uring/sync.o
  CC      fs/netfs/main.o
  CC      kernel/module/procfs.o
  CC      net/ethtool/tunnels.o
  CC      net/xfrm/xfrm_sysctl.o
  AR      drivers/char/agp/built-in.a
  CC      net/sunrpc/socklib.o
  CC      kernel/irq/affinity.o
  CC      kernel/time/timekeeping.o
  AR      sound/xen/built-in.a
  CC      drivers/tty/vt/consolemap.o
  AR      net/mac80211/tests/built-in.a
  CC      net/mac80211/main.o
  ASN.1   crypto/rsapubkey.asn1.[ch]
  ASN.1   crypto/rsaprivkey.asn1.[ch]
  CC      crypto/rsa.o
  CC      drivers/acpi/x86/blacklist.o
  CC      drivers/acpi/acpica/evmisc.o
  CC      mm/mm_init.o
  CC      sound/hda/array.o
  CC      fs/isofs/namei.o
  CC      drivers/virtio/virtio_input.o
  CC      net/mac80211/status.o
  CC      net/ipv6/netfilter/nf_conntrack_reasm.o
  AR      fs/jbd2/built-in.a
  CC      net/mac80211/driver-ops.o
  CC      fs/proc/softirqs.o
  CC      lib/earlycpio.o
  CC      kernel/module/sysfs.o
  CC      block/early-lookup.o
  CC      kernel/irq/matrix.o
  CC      drivers/acpi/acpica/evregion.o
  CC      lib/extable.o
  AR      drivers/acpi/x86/built-in.a
  CC      sound/core/memalloc.o
  CC      sound/hda/hdmi_chmap.o
  CC      drivers/iommu/iommu-traces.o
  CC      net/sunrpc/auth_gss/svcauth_gss.o
  CC      sound/core/pcm_timer.o
  CC      net/netlabel/netlabel_user.o
  CC      io_uring/msg_ring.o
  AR      sound/virtio/built-in.a
  CC      security/selinux/ss/context.o
  CC      io_uring/advise.o
  CC      crypto/rsa_helper.o
  CC      net/ipv4/inet_hashtables.o
  CC      drivers/pci/search.o
  CC      io_uring/epoll.o
  CC      drivers/acpi/osi.o
  CC      fs/fat/fatent.o
  CC      net/sunrpc/auth_gss/gss_rpc_upcall.o
  CC      lib/flex_proportions.o
  CC      net/netfilter/nf_conntrack_helper.o
  CC      fs/isofs/inode.o
  CC      drivers/char/misc.o
  CC      drivers/char/virtio_console.o
  CC      net/xfrm/xfrm_replay.o
  CC      fs/proc/namespaces.o
  HOSTCC  drivers/tty/vt/conmakehash
  CC      drivers/virtio/virtio_dma_buf.o
  CC      drivers/acpi/acpica/evrgnini.o
  CC      drivers/char/hpet.o
  AR      drivers/gpu/host1x/built-in.a
  CC      crypto/rsa-pkcs1pad.o
  CC      net/ethtool/fec.o
  AR      drivers/gpu/drm/tests/built-in.a
  AR      drivers/gpu/drm/arm/built-in.a
  CC      drivers/tty/vt/defkeymap.o
  AR      drivers/gpu/drm/clients/built-in.a
  CC      block/bounce.o
  CC      drivers/gpu/drm/display/drm_display_helper_mod.o
  CC      lib/idr.o
  AR      kernel/module/built-in.a
  AR      drivers/gpu/vga/built-in.a
  CC      net/ethtool/eeprom.o
  CC      net/ethtool/stats.o
  CC      drivers/gpu/drm/ttm/ttm_tt.o
  CONMK   drivers/tty/vt/consolemap_deftbl.c
  CC      mm/percpu.o
  CC      drivers/tty/vt/consolemap_deftbl.o
  AR      drivers/tty/vt/built-in.a
  CC      drivers/acpi/acpica/evsci.o
  CC      drivers/tty/hvc/hvc_console.o
  CC      fs/netfs/misc.o
  CC      crypto/rsassa-pkcs1.o
  CC      arch/x86/kernel/cpu/powerflags.o
  CC      sound/core/seq_device.o
  CC      net/wireless/sysfs.o
  CC      drivers/pci/rom.o
  CC      security/selinux/netlabel.o
  CC      sound/hda/trace.o
  CC      fs/netfs/objects.o
  CC      lib/iomem_copy.o
  CC      io_uring/statx.o
  AR      drivers/virtio/built-in.a
  CC      drivers/iommu/iommu-sysfs.o
  CC      io_uring/timeout.o
  CC      net/netlabel/netlabel_kapi.o
  CC      kernel/time/ntp.o
  CC      drivers/gpu/drm/display/drm_dp_dual_mode_helper.o
  CC      fs/netfs/read_collect.o
  CC      net/ipv6/netfilter/nf_reject_ipv6.o
  CC      net/core/dev_addr_lists.o
  AR      kernel/irq/built-in.a
  CC      arch/x86/kernel/irq_32.o
  CC      fs/proc/self.o
  CC      drivers/acpi/acpica/evxface.o
  CC      block/bsg.o
  CC      lib/irq_regs.o
  CC      net/mac80211/sta_info.o
  CC      drivers/tty/serial/8250/8250_core.o
  AR      drivers/tty/ipwireless/built-in.a
  CC      drivers/acpi/acpica/evxfevnt.o
  CC      lib/is_single_threaded.o
  CC      fs/fat/file.o
  CC      fs/fat/inode.o
  AR      sound/core/built-in.a
  CC      drivers/tty/serial/serial_core.o
  CC      fs/isofs/dir.o
  CC      crypto/acompress.o
  CC      net/netfilter/nf_conntrack_proto.o
  CC      drivers/pci/setup-res.o
  CC      net/xfrm/xfrm_device.o
  CC      drivers/acpi/acpica/evxfgpe.o
  CC      fs/proc/thread_self.o
  CC      drivers/iommu/dma-iommu.o
  CC      drivers/gpu/drm/ttm/ttm_bo.o
  CC      arch/x86/kernel/dumpstack_32.o
  AR      drivers/tty/hvc/built-in.a
  CC      net/sunrpc/xprtsock.o
  CC      net/sunrpc/sched.o
  CC      net/ethtool/phc_vclocks.o
  CC      drivers/char/nvram.o
  CC      fs/fat/misc.o
  CC      crypto/scompress.o
  CC      fs/isofs/util.o
  CC      net/sunrpc/auth_gss/gss_rpc_xdr.o
  CC      net/mac80211/wep.o
  CC      lib/klist.o
  CC      kernel/time/clocksource.o
  CC      drivers/gpu/drm/display/drm_dp_helper.o
  CC      net/netfilter/nf_conntrack_proto_generic.o
  CC      fs/nfs/client.o
  CC      block/blk-cgroup.o
  CC      net/xfrm/xfrm_nat_keepalive.o
  CC      sound/hda/hdac_component.o
  CC      net/ipv4/inet_timewait_sock.o
  CC      net/xfrm/xfrm_algo.o
  CC      io_uring/fdinfo.o
  CC      fs/isofs/rock.o
  CC      drivers/acpi/acpica/evxfregn.o
  CC      lib/kobject.o
  CC      drivers/acpi/acpica/exconcat.o
  CC      fs/proc/proc_sysctl.o
  CC      fs/netfs/read_pgpriv2.o
  AR      security/selinux/built-in.a
  AR      security/built-in.a
  CC      fs/netfs/read_retry.o
  CC      net/sunrpc/auth.o
  CC      kernel/time/jiffies.o
  CC      net/netlabel/netlabel_domainhash.o
  CC      drivers/pci/irq.o
  CC      drivers/tty/serial/8250/8250_platform.o
  CC      drivers/gpu/drm/i915/i915_config.o
  AR      drivers/gpu/drm/renesas/rcar-du/built-in.a
  CC      drivers/pci/vpd.o
  AR      drivers/gpu/drm/renesas/rz-du/built-in.a
  AR      drivers/gpu/drm/renesas/built-in.a
  CC      net/ipv6/netfilter/ip6t_ipv6header.o
  CC      drivers/pci/setup-bus.o
  CC      arch/x86/kernel/cpu/topology.o
  AR      drivers/char/built-in.a
  CC      drivers/acpi/osl.o
  CC      arch/x86/kernel/time.o
  CC      lib/kobject_uevent.o
  CC      crypto/algboss.o
  CC      drivers/acpi/acpica/exconfig.o
  CC      drivers/gpu/drm/i915/i915_driver.o
  CC      block/blk-ioprio.o
  CC      fs/ext4/extents_status.o
  CC      net/ethtool/mm.o
  CC      drivers/gpu/drm/ttm/ttm_bo_util.o
  CC      drivers/gpu/drm/ttm/ttm_bo_vm.o
  CC      drivers/tty/serial/serial_base_bus.o
  CC      sound/hda/hdac_i915.o
  CC      kernel/time/timer_list.o
  CC      sound/hda/intel-dsp-config.o
  CC      fs/fat/nfs.o
  CC      kernel/time/timeconv.o
  CC      net/netfilter/nf_conntrack_proto_tcp.o
  CC      arch/x86/kernel/ioport.o
  CC      io_uring/cancel.o
  CC      net/wireless/radiotap.o
  CC      net/sunrpc/auth_gss/trace.o
  CC      kernel/time/timecounter.o
  CC      fs/isofs/export.o
  CC      drivers/acpi/acpica/exconvrt.o
  CC      kernel/time/alarmtimer.o
  CC      mm/slab_common.o
  CC      io_uring/waitid.o
  CC      drivers/gpu/drm/display/drm_dp_mst_topology.o
  CC      drivers/iommu/iova.o
  CC      io_uring/register.o
  CC      fs/exportfs/expfs.o
  CC      drivers/tty/serial/8250/8250_pnp.o
  CC      net/xfrm/xfrm_user.o
  CC      fs/netfs/read_single.o
  CC      net/mac80211/aead_api.o
  CC      net/ipv4/inet_connection_sock.o
  CC      net/ipv6/netfilter/ip6t_REJECT.o
  CC      drivers/connector/cn_queue.o
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
  CC      net/core/dst.o
  CC      net/wireless/util.o
  CC      block/blk-iolatency.o
  CC      drivers/acpi/acpica/excreate.o
  CC      block/blk-iocost.o
  CC      drivers/gpu/drm/i915/i915_drm_client.o
  CC      sound/hda/intel-nhlt.o
  CC      crypto/testmgr.o
  CC      fs/nfs/dir.o
  CC      drivers/gpu/drm/ttm/ttm_module.o
  CC      drivers/connector/connector.o
  CC      net/netlabel/netlabel_addrlist.o
  CC      fs/fat/namei_vfat.o
  CC      lib/logic_pio.o
  CC      fs/isofs/joliet.o
  CC      net/ethtool/module.o
  CC      net/sunrpc/auth_null.o
  CC      net/sunrpc/auth_tls.o
  CC      drivers/gpu/drm/i915/i915_getparam.o
  CC      fs/proc/proc_net.o
  AR      fs/exportfs/built-in.a
  CC      net/ipv6/ipv6_sockglue.o
  CC      arch/x86/kernel/cpu/proc.o
  CC      net/ethtool/cmis_fw_update.o
  CC      drivers/acpi/acpica/exdebug.o
  AR      drivers/gpu/drm/omapdrm/built-in.a
  CC      sound/hda/intel-sdw-acpi.o
  CC      drivers/tty/serial/8250/8250_rsa.o
  CC      drivers/gpu/drm/ttm/ttm_execbuf_util.o
  AR      drivers/iommu/built-in.a
  CC      block/mq-deadline.o
  CC      drivers/tty/serial/serial_ctrl.o
  CC      fs/ext4/file.o
  CC      fs/netfs/rolling_buffer.o
  CC      net/rfkill/core.o
  CC      fs/nfs/file.o
  CC      drivers/pci/vc.o
cc1: all warnings being treated as errors
  CC      crypto/cmac.o
make[6]: *** [/workspace/kernel/scripts/Makefile.build:207: drivers/gpu/drm/i915/i915_driver.o] Error 1
make[6]: *** Waiting for unfinished jobs....
  CC      sound/sound_core.o
  CC      kernel/time/posix-timers.o
  CC      drivers/acpi/acpica/exdump.o
  CC      fs/lockd/clntlock.o
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
  CC      lib/maple_tree.o
  CC      fs/proc/kcore.o
  CC      fs/isofs/compress.o
In file included from /workspace/kernel/drivers/gpu/drm/i915/display/intel_display_core.h:23,
                 from /workspace/kernel/drivers/gpu/drm/i915/i915_drv.h:40,
                 from /workspace/kernel/drivers/gpu/drm/i915/i915_getparam.c:11:
/workspace/kernel/drivers/gpu/drm/i915/display/intel_display_power.h: In function ‘intel_display_power_put’:
/workspace/kernel/drivers/gpu/drm/i915/display/intel_display_power.h:228:43: error: passing argument 1 of ‘intel_display_power_put_unchecked’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  228 |         intel_display_power_put_unchecked(display, domain);
      |                                           ^~~~~~~
      |                                           |
      |                                           struct intel_display *
/workspace/kernel/drivers/gpu/drm/i915/display/intel_display_power.h:220:65: note: expected ‘struct drm_i915_private *’ but argument is of type ‘struct intel_display *’
  220 | void intel_display_power_put_unchecked(struct drm_i915_private *dev_priv,
      |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
  AR      sound/hda/built-in.a
  CC      net/ipv6/ndisc.o
  CC      arch/x86/kernel/cpu/feat_ctl.o
  AR      net/ipv6/netfilter/built-in.a
  CC      net/netlabel/netlabel_mgmt.o
  CC      fs/fat/namei_msdos.o
  CC      drivers/tty/serial/8250/8250_port.o
  CC      sound/last.o
  CC      drivers/gpu/drm/ttm/ttm_range_manager.o
  CC      net/netfilter/nf_conntrack_proto_udp.o
  CC      drivers/connector/cn_proc.o
  CC      drivers/acpi/acpica/exfield.o
  CC      drivers/tty/tty_io.o
cc1: all warnings being treated as errors
  CC      crypto/hmac.o
make[6]: *** [/workspace/kernel/scripts/Makefile.build:207: drivers/gpu/drm/i915/i915_drm_client.o] Error 1
  CC      lib/memcat_p.o
  CC      net/ethtool/cmis_cdb.o
  CC      net/mac80211/wpa.o
  CC      drivers/tty/serial/serial_port.o
  CC      io_uring/truncate.o
cc1: all warnings being treated as errors
make[6]: *** [/workspace/kernel/scripts/Makefile.build:207: drivers/gpu/drm/i915/i915_getparam.o] Error 1
make[5]: *** [/workspace/kernel/scripts/Makefile.build:465: drivers/gpu/drm/i915] Error 2
make[5]: *** Waiting for unfinished jobs....
  CC      net/ipv4/tcp.o
  CC      drivers/gpu/drm/display/drm_dsc_helper.o
  CC      fs/nfs/getroot.o
  CC      fs/proc/vmcore.o
  CC      net/rfkill/input.o
  CC      kernel/time/posix-cpu-timers.o
  CC      kernel/time/posix-clock.o
  CC      drivers/pci/mmap.o
  CC      fs/netfs/write_collect.o
  CC      drivers/acpi/utils.o
  CC      arch/x86/kernel/cpu/intel.o
  AR      sound/built-in.a
  CC      kernel/time/itimer.o
  CC      drivers/acpi/acpica/exfldio.o
  CC      kernel/time/clockevents.o
  CC      drivers/tty/serial/8250/8250_dma.o
  CC      net/9p/mod.o
  CC      fs/ext4/fsmap.o
  CC      mm/compaction.o
  CC      net/sunrpc/auth_gss/gss_krb5_mech.o
  AR      fs/isofs/built-in.a
  CC      arch/x86/kernel/cpu/tsx.o
  CC      fs/proc/kmsg.o
  CC      drivers/tty/n_tty.o
  CC      drivers/gpu/drm/ttm/ttm_resource.o
  CC      crypto/crypto_null.o
  CC      crypto/md5.o
  CC      net/core/netevent.o
  AR      net/rfkill/built-in.a
  CC      crypto/sha256_generic.o
  CC      drivers/gpu/drm/display/drm_hdcp_helper.o
  CC      fs/lockd/clntproc.o
  CC      drivers/acpi/acpica/exmisc.o
  CC      io_uring/memmap.o
  AR      fs/fat/built-in.a
  CC      net/core/neighbour.o
  CC      drivers/pci/devres.o
  CC      net/wireless/reg.o
  CC      net/9p/client.o
  CC      fs/netfs/write_issue.o
  CC      arch/x86/kernel/cpu/intel_epb.o
  CC      net/sunrpc/auth_unix.o
  CC      net/netlabel/netlabel_unlabeled.o
  CC      net/sunrpc/auth_gss/gss_krb5_seal.o
  CC      net/ipv4/tcp_input.o
  AR      drivers/connector/built-in.a
  CC      arch/x86/kernel/dumpstack.o
  CC      net/wireless/scan.o
  CC      arch/x86/kernel/cpu/amd.o
  CC      net/ethtool/pse-pd.o
  AR      net/xfrm/built-in.a
  CC      drivers/tty/serial/8250/8250_dwlib.o
  CC      drivers/tty/serial/earlycon.o
  CC      net/sunrpc/auth_gss/gss_krb5_unseal.o
  CC      net/netfilter/nf_conntrack_proto_icmp.o
  CC      fs/proc/page.o
  CC      kernel/time/tick-common.o
  CC      net/netlabel/netlabel_cipso_v4.o
  CC      drivers/acpi/acpica/exmutex.o
  CC      arch/x86/kernel/cpu/hygon.o
  CC      fs/ext4/fsync.o
  CC      net/ipv6/udp.o
  CC      net/wireless/nl80211.o
  CC      fs/ext4/hash.o
  CC      crypto/sha512_generic.o
  CC      block/kyber-iosched.o
  CC      fs/ext4/ialloc.o
  CC      net/dns_resolver/dns_key.o
  CC      net/mac80211/scan.o
  CC      fs/netfs/write_retry.o
  CC      drivers/gpu/drm/ttm/ttm_pool.o
  CC      drivers/gpu/drm/display/drm_hdmi_helper.o
  CC      net/sunrpc/svc.o
  CC      io_uring/alloc_cache.o
  CC      net/wireless/mlme.o
  CC      drivers/acpi/acpica/exnames.o
  CC      drivers/pci/proc.o
  CC      drivers/tty/serial/8250/8250_pcilib.o
  CC      net/netfilter/nf_conntrack_extend.o
  CC      fs/nfs/inode.o
  CC      net/sunrpc/auth_gss/gss_krb5_wrap.o
  CC      arch/x86/kernel/cpu/centaur.o
  CC      net/netlabel/netlabel_calipso.o
  CC      mm/show_mem.o
  AR      fs/proc/built-in.a
  CC      io_uring/io-wq.o
  CC      drivers/acpi/acpica/exoparg1.o
  CC      net/sunrpc/svcsock.o
  CC      drivers/pci/pci-sysfs.o
  CC      net/dns_resolver/dns_query.o
  CC      net/netfilter/nf_conntrack_acct.o
  CC      net/mac80211/offchannel.o
  CC      net/netfilter/nf_conntrack_seqadj.o
  CC      net/core/rtnetlink.o
  CC      net/ethtool/plca.o
  CC      crypto/sha3_generic.o
  CC      drivers/gpu/drm/display/drm_scdc_helper.o
  CC      fs/lockd/clntxdr.o
  CC      fs/lockd/host.o
  CC      io_uring/futex.o
  CC      net/ipv4/tcp_output.o
  CC      kernel/time/tick-broadcast.o
  CC      lib/nmi_backtrace.o
  CC      arch/x86/kernel/cpu/transmeta.o
  CC      block/blk-mq-debugfs.o
  AR      fs/netfs/built-in.a
  CC      fs/nfs/super.o
  CC      net/netfilter/nf_conntrack_proto_icmpv6.o
  CC      drivers/gpu/drm/ttm/ttm_device.o
  CC      drivers/tty/serial/8250/8250_early.o
  CC      drivers/acpi/acpica/exoparg2.o
  CC      crypto/ecb.o
  CC      net/sunrpc/svcauth.o
  CC      net/9p/error.o
  CC      mm/interval_tree.o
  CC      block/blk-pm.o
  AR      net/dns_resolver/built-in.a
  CC      fs/lockd/svc.o
  CC      drivers/tty/tty_ioctl.o
  CC      arch/x86/kernel/cpu/zhaoxin.o
  CC      lib/objpool.o
  CC      lib/plist.o
  CC      kernel/time/tick-broadcast-hrtimer.o
  CC      net/wireless/ibss.o
  CC      net/sunrpc/auth_gss/gss_krb5_crypto.o
  AR      net/netlabel/built-in.a
  CC      net/core/utils.o
  CC      drivers/acpi/acpica/exoparg3.o
  CC      net/9p/protocol.o
  CC      kernel/futex/core.o
  CC      crypto/cbc.o
  AR      drivers/gpu/drm/display/built-in.a
  CC      drivers/tty/serial/8250/8250_exar.o
  CC      fs/nls/nls_base.o
  CC      lib/radix-tree.o
  CC      net/handshake/alert.o
  CC      kernel/time/tick-oneshot.o
  CC      drivers/gpu/drm/ttm/ttm_sys_manager.o
  CC      net/ethtool/phy.o
  CC      crypto/ctr.o
  CC      arch/x86/kernel/cpu/vortex.o
  CC      io_uring/napi.o
  CC      drivers/pci/slot.o
  CC      net/ipv4/tcp_timer.o
  CC      drivers/acpi/acpica/exoparg6.o
  CC      mm/list_lru.o
  CC      block/holder.o
  CC      drivers/gpu/drm/ttm/ttm_agp_backend.o
  CC      net/wireless/sme.o
  CC      drivers/tty/tty_ldisc.o
  CC      fs/ext4/indirect.o
  CC      kernel/futex/syscalls.o
  CC      net/handshake/genl.o
  CC      fs/nls/nls_cp437.o
  CC      net/mac80211/ht.o
  CC      kernel/time/tick-sched.o
  CC      arch/x86/kernel/cpu/perfctr-watchdog.o
  CC      kernel/cgroup/cgroup.o
  CC      net/ipv6/udplite.o
  CC      drivers/acpi/acpica/exprep.o
  CC      crypto/gcm.o
  CC      net/devres.o
  CC      net/socket.o
  CC      net/netfilter/nf_conntrack_netlink.o
  CC      net/9p/trans_common.o
  CC      kernel/cgroup/rstat.o
  CC      lib/ratelimit.o
  CC      drivers/tty/tty_buffer.o
  CC      fs/nls/nls_ascii.o
  CC      fs/lockd/svclock.o
  CC      drivers/pci/pci-acpi.o
  CC      drivers/tty/serial/8250/8250_lpss.o
  CC      drivers/base/power/sysfs.o
  AR      block/built-in.a
  CC      drivers/acpi/acpica/exregion.o
  CC      crypto/ccm.o
  AR      drivers/gpu/drm/ttm/built-in.a
make[4]: *** [/workspace/kernel/scripts/Makefile.build:465: drivers/gpu/drm] Error 2
make[3]: *** [/workspace/kernel/scripts/Makefile.build:465: drivers/gpu] Error 2
make[3]: *** Waiting for unfinished jobs....
  CC      drivers/acpi/reboot.o
  CC      drivers/block/loop.o
  CC      mm/workingset.o
  CC      drivers/base/power/generic_ops.o
  CC      net/handshake/netlink.o
  CC      net/mac80211/agg-tx.o
  CC      drivers/acpi/acpica/exresnte.o
  CC      fs/nfs/io.o
  CC      fs/nls/nls_iso8859-1.o
  CC      net/sunrpc/auth_gss/gss_krb5_keys.o
  CC      net/ethtool/tsconfig.o
  CC      crypto/aes_generic.o
  CC      mm/debug.o
  CC      arch/x86/kernel/cpu/vmware.o
  CC      net/ipv6/raw.o
  AR      fs/unicode/built-in.a
  CC      drivers/tty/tty_port.o
  CC      net/9p/trans_fd.o
  CC      kernel/futex/pi.o
  CC      net/netfilter/nf_conntrack_ftp.o
  CC      drivers/acpi/nvs.o
  CC      net/handshake/request.o
  CC      net/ipv4/tcp_ipv4.o
  CC      drivers/acpi/acpica/exresolv.o
  CC      drivers/acpi/acpica/exresop.o
  CC      drivers/base/firmware_loader/builtin/main.o
  CC      drivers/acpi/wakeup.o
  CC      drivers/base/power/common.o
  CC      fs/nls/nls_utf8.o
  CC      kernel/time/timer_migration.o
  CC      fs/autofs/init.o
  CC      drivers/pci/iomap.o
  CC      fs/nfs/direct.o
  CC      net/9p/trans_virtio.o
  AR      io_uring/built-in.a
  CC      drivers/tty/serial/8250/8250_mid.o
  CC      fs/ext4/inline.o
  CC      fs/autofs/inode.o
  CC      kernel/futex/requeue.o
  CC      lib/rbtree.o
  AR      drivers/base/firmware_loader/builtin/built-in.a
  CC      drivers/base/firmware_loader/main.o
  CC      arch/x86/kernel/cpu/hypervisor.o
  CC      fs/ext4/inode.o
  AR      fs/nls/built-in.a
  CC      fs/autofs/root.o
  CC      net/sysctl_net.o
  CC      drivers/acpi/acpica/exserial.o
  CC      drivers/block/virtio_blk.o
  CC      crypto/authenc.o
  CC      drivers/acpi/acpica/exstore.o
  CC      drivers/acpi/acpica/exstoren.o
  CC      net/netfilter/nf_conntrack_irc.o
  CC      kernel/time/vsyscall.o
  CC      mm/gup.o
  CC      drivers/base/power/qos.o
  CC      drivers/base/power/runtime.o
  CC      net/ipv6/icmp.o
  CC      net/sunrpc/svcauth_unix.o
  CC      net/core/link_watch.o
  CC      arch/x86/kernel/cpu/mshyperv.o
  CC      fs/lockd/svcshare.o
  AR      net/ethtool/built-in.a
  CC      drivers/pci/quirks.o
  CC      drivers/tty/serial/8250/8250_pci.o
  CC      lib/seq_buf.o
  CC      kernel/time/timekeeping_debug.o
  CC      lib/siphash.o
  CC      arch/x86/kernel/cpu/debugfs.o
  CC      drivers/base/regmap/regmap.o
  CC      net/mac80211/agg-rx.o
  AR      net/sunrpc/auth_gss/built-in.a
  AR      drivers/base/test/built-in.a
  CC      drivers/pci/pci-label.o
  CC      kernel/trace/trace_clock.o
  CC      kernel/futex/waitwake.o
  CC      drivers/acpi/acpica/exstorob.o
  CC      net/wireless/chan.o
  CC      fs/lockd/svcproc.o
  CC      drivers/base/power/wakeirq.o
  CC      net/ipv6/mcast.o
  CC      net/netfilter/nf_conntrack_sip.o
  CC      arch/x86/kernel/cpu/bus_lock.o
  CC      kernel/cgroup/namespace.o
  CC      crypto/authencesn.o
  CC      net/handshake/tlshd.o
  CC      drivers/acpi/acpica/exsystem.o
  CC      fs/autofs/symlink.o
  CC      fs/autofs/waitq.o
  CC      kernel/trace/ring_buffer.o
  AR      drivers/base/firmware_loader/built-in.a
  CC      drivers/acpi/acpica/extrace.o
  CC      lib/string.o
  CC      kernel/trace/trace.o
  AR      net/9p/built-in.a
  CC      net/core/filter.o
  CC      fs/lockd/svcsubs.o
  CC      crypto/lzo.o
  CC      net/ipv4/tcp_minisocks.o
  CC      fs/nfs/pagelist.o
  CC      drivers/base/component.o
  CC      net/netfilter/nf_nat_core.o
  CC      net/handshake/trace.o
  CC      lib/timerqueue.o
  CC      kernel/cgroup/cgroup-v1.o
  CC      mm/mmap_lock.o
  AR      drivers/block/built-in.a
  CC      fs/autofs/expire.o
  AR      kernel/futex/built-in.a
  CC      fs/autofs/dev-ioctl.o
  CC      kernel/time/namespace.o
  CC      fs/ext4/ioctl.o
  CC      net/core/sock_diag.o
  CC      net/ipv4/tcp_cong.o
  CC      net/mac80211/vht.o
  CC      net/wireless/ethtool.o
  CC      kernel/cgroup/freezer.o
  CC      drivers/acpi/acpica/exutils.o
  CC      drivers/base/power/main.o
  CC      net/netfilter/nf_nat_proto.o
  CC      net/ipv4/tcp_metrics.o
  CC      lib/union_find.o
  CC      lib/vsprintf.o
  CC      drivers/pci/vgaarb.o
  CC      crypto/lzo-rle.o
  CC      arch/x86/kernel/cpu/capflags.o
  AR      arch/x86/kernel/cpu/built-in.a
  CC      arch/x86/kernel/nmi.o
  CC      drivers/acpi/sleep.o
  CC      fs/nfs/read.o
  CC      drivers/acpi/acpica/hwacpi.o
  CC      drivers/tty/serial/8250/8250_pericom.o
  CC      drivers/acpi/acpica/hwesleep.o
  CC      drivers/acpi/acpica/hwgpe.o
  CC      net/ipv6/reassembly.o
  CC      kernel/trace/trace_output.o
  CC      net/wireless/mesh.o
  CC      kernel/cgroup/legacy_freezer.o
  AR      kernel/time/built-in.a
  CC      net/ipv4/tcp_fastopen.o
  CC      fs/9p/vfs_super.o
  CC      arch/x86/kernel/ldt.o
  AR      fs/hostfs/built-in.a
  AR      fs/autofs/built-in.a
  CC      net/ipv4/tcp_rate.o
  CC      mm/highmem.o
  CC      net/netfilter/nf_nat_helper.o
  CC      fs/ext4/mballoc.o
  CC      crypto/rng.o
  CC      drivers/base/core.o
  CC      fs/lockd/mon.o
  CC      drivers/acpi/acpica/hwregs.o
  CC      fs/nfs/symlink.o
  CC      net/sunrpc/addr.o
  CC      fs/ext4/migrate.o
  AR      drivers/tty/serial/8250/built-in.a
  CC      lib/win_minmax.o
  AR      drivers/tty/serial/built-in.a
  CC      net/ipv6/tcp_ipv6.o
  CC      drivers/tty/tty_mutex.o
  CC      arch/x86/kernel/setup.o
  CC      mm/memory.o
  AR      net/handshake/built-in.a
  CC      crypto/drbg.o
  CC      kernel/cgroup/pids.o
  CC      drivers/base/power/wakeup.o
  CC      net/ipv4/tcp_recovery.o
  AR      drivers/pci/built-in.a
  CC      drivers/acpi/acpica/hwsleep.o
  CC      net/ipv4/tcp_ulp.o
  CC      net/sunrpc/rpcb_clnt.o
  CC      fs/9p/vfs_inode.o
  CC      fs/debugfs/inode.o
  CC      fs/tracefs/inode.o
  CC [M]  fs/efivarfs/inode.o
  CC      fs/debugfs/file.o
  CC      net/ipv4/tcp_offload.o
  CC      kernel/cgroup/rdma.o
  CC      fs/lockd/trace.o
  CC [M]  fs/efivarfs/file.o
  CC      kernel/trace/trace_seq.o
  CC      drivers/acpi/acpica/hwvalid.o
  CC      drivers/tty/tty_ldsem.o
  CC      drivers/base/regmap/regcache.o
  CC      net/wireless/ap.o
  CC      fs/9p/vfs_inode_dotl.o
  CC      net/mac80211/he.o
  CC      net/mac80211/s1g.o
  CC [M]  fs/efivarfs/super.o
  CC      drivers/base/bus.o
  CC      kernel/cgroup/cpuset.o
  CC      fs/lockd/xdr.o
  CC      lib/xarray.o
  CC      mm/mincore.o
  CC      net/core/dev_ioctl.o
  CC [M]  fs/efivarfs/vars.o
  CC      drivers/base/power/wakeup_stats.o
  CC      crypto/jitterentropy.o
  CC      fs/nfs/unlink.o
  CC      drivers/acpi/acpica/hwxface.o
  CC      net/netfilter/nf_nat_masquerade.o
  CC      drivers/acpi/acpica/hwxfsleep.o
  CC      drivers/acpi/acpica/hwpci.o
  CC      kernel/cgroup/misc.o
  CC      kernel/trace/trace_stat.o
  CC      crypto/jitterentropy-kcapi.o
  CC      drivers/base/power/trace.o
  CC      fs/tracefs/event_inode.o
  CC      arch/x86/kernel/x86_init.o
  CC      fs/9p/vfs_addr.o
  CC      drivers/base/dd.o
  CC      drivers/tty/tty_baudrate.o
  CC      mm/mlock.o
  CC      fs/lockd/clnt4xdr.o
  CC      drivers/base/regmap/regcache-rbtree.o
  CC      fs/ext4/mmp.o
  CC      drivers/acpi/acpica/nsaccess.o
  CC      kernel/cgroup/debug.o
  CC      crypto/ghash-generic.o
  CC      net/wireless/trace.o
  CC      fs/nfs/write.o
  CC      lib/lockref.o
  CC      fs/lockd/xdr4.o
  CC      mm/mmap.o
  CC      drivers/tty/tty_jobctrl.o
  CC      lib/bcd.o
  CC      drivers/base/regmap/regcache-flat.o
  AR      fs/debugfs/built-in.a
  CC      drivers/base/regmap/regcache-maple.o
  CC      net/ipv4/tcp_plb.o
  CC      net/core/tso.o
  CC      net/mac80211/ibss.o
  CC      mm/mmu_gather.o
  CC      net/core/sock_reuseport.o
  LD [M]  fs/efivarfs/efivarfs.o
  CC      net/ipv4/datagram.o
  CC      fs/nfs/namespace.o
  CC      fs/ext4/move_extent.o
  CC      drivers/tty/n_null.o
  CC      net/sunrpc/timer.o
  CC      crypto/hash_info.o
  CC      drivers/acpi/acpica/nsalloc.o
  CC      kernel/bpf/core.o
  CC      crypto/rsapubkey.asn1.o
  AR      drivers/base/power/built-in.a
  CC      arch/x86/kernel/i8259.o
  CC      kernel/events/core.o
  CC      crypto/rsaprivkey.asn1.o
  AR      crypto/built-in.a
  CC      net/core/fib_notifier.o
  CC      fs/9p/vfs_file.o
  CC      kernel/fork.o
  CC      fs/nfs/mount_clnt.o
  AR      fs/tracefs/built-in.a
  CC      mm/mprotect.o
  CC      lib/sort.o
  CC      mm/mremap.o
  CC      net/mac80211/iface.o
  CC      mm/msync.o
  CC      drivers/tty/pty.o
  CC      lib/parser.o
  CC      lib/debug_locks.o
  CC      kernel/events/ring_buffer.o
  CC      fs/ext4/namei.o
  CC      drivers/acpi/acpica/nsarguments.o
  CC      drivers/base/regmap/regmap-debugfs.o
  CC      drivers/acpi/acpica/nsconvert.o
  CC      net/wireless/ocb.o
  CC      net/netfilter/nf_nat_ftp.o
  CC      net/ipv4/raw.o
  CC      kernel/trace/trace_printk.o
  CC      fs/lockd/svc4proc.o
  CC      arch/x86/kernel/irqinit.o
  CC      net/ipv6/ping.o
  CC      net/sunrpc/xdr.o
  CC      mm/page_vma_mapped.o
  CC      fs/lockd/procfs.o
  CC      mm/pagewalk.o
  CC      fs/9p/vfs_dir.o
  CC      lib/random32.o
  CC      fs/open.o
  CC      net/ipv4/udp.o
  CC      fs/ext4/page-io.o
  CC      fs/nfs/nfstrace.o
  CC      drivers/acpi/acpica/nsdump.o
  CC      drivers/acpi/device_sysfs.o
  CC      fs/read_write.o
  CC      fs/9p/vfs_dentry.o
  CC      kernel/trace/pid_list.o
  CC      net/ipv6/exthdrs.o
  AR      kernel/cgroup/built-in.a
  CC      fs/file_table.o
  CC      lib/bust_spinlocks.o
  CC      drivers/tty/tty_audit.o
  CC      fs/9p/v9fs.o
  CC      fs/9p/fid.o
  CC      drivers/acpi/device_pm.o
  CC      kernel/events/callchain.o
  CC      drivers/tty/sysrq.o
  CC      drivers/acpi/acpica/nseval.o
  CC      fs/super.o
  CC      net/mac80211/link.o
  AR      drivers/base/regmap/built-in.a
  CC      drivers/base/syscore.o
  CC      arch/x86/kernel/jump_label.o
  CC      net/ipv4/udplite.o
  CC      kernel/exec_domain.o
  CC      kernel/panic.o
  CC      net/sunrpc/sunrpc_syms.o
  CC      net/ipv6/datagram.o
  CC      fs/char_dev.o
  CC      drivers/acpi/acpica/nsinit.o
  CC      net/netfilter/nf_nat_irc.o
  CC      net/wireless/pmsr.o
  CC      net/ipv4/udp_offload.o
  CC      lib/kasprintf.o
  CC      drivers/base/driver.o
  CC      fs/nfs/export.o
  AR      fs/lockd/built-in.a
  CC      net/mac80211/rate.o
  CC      kernel/events/hw_breakpoint.o
  CC      mm/pgtable-generic.o
  CC      kernel/trace/trace_sched_switch.o
  CC      net/sunrpc/cache.o
  GEN     net/wireless/shipped-certs.c
  CC      kernel/events/uprobes.o
  CC      net/ipv4/arp.o
  CC      fs/9p/xattr.o
  CC      net/core/xdp.o
  CC      lib/bitmap.o
  CC      net/netfilter/nf_nat_sip.o
  CC      drivers/acpi/acpica/nsload.o
  CC      arch/x86/kernel/irq_work.o
  CC      kernel/cpu.o
  CC      net/ipv6/ip6_flowlabel.o
  CC      mm/rmap.o
  CC      kernel/trace/trace_nop.o
  CC      net/sunrpc/rpc_pipe.o
  CC      net/mac80211/michael.o
  CC      drivers/base/class.o
  AR      drivers/tty/built-in.a
  CC      net/ipv6/inet6_connection_sock.o
  CC      lib/scatterlist.o
  CC      net/netfilter/x_tables.o
  CC      drivers/acpi/acpica/nsnames.o
  CC      kernel/exit.o
  CC      net/ipv4/icmp.o
  CC      drivers/acpi/proc.o
  CC      net/sunrpc/sysfs.o
  CC      arch/x86/kernel/probe_roms.o
  AR      fs/9p/built-in.a
  CC      drivers/acpi/bus.o
  CC      drivers/base/platform.o
  CC      arch/x86/kernel/sys_ia32.o
  CC      kernel/softirq.o
  CC      net/core/flow_offload.o
  CC      fs/stat.o
  CC      fs/exec.o
  CC      fs/ext4/readpage.o
  CC      drivers/acpi/acpica/nsobject.o
  AR      kernel/bpf/built-in.a
  CC      drivers/acpi/glue.o
  CC      mm/vmalloc.o
  CC      arch/x86/kernel/ksysfs.o
  CC      kernel/trace/blktrace.o
  CC      net/core/gro.o
  CC      mm/vma.o
  CC      net/netfilter/xt_tcpudp.o
  CC      mm/process_vm_access.o
  CC      kernel/resource.o
  CC      fs/ext4/resize.o
  CC      fs/ext4/super.o
  CC      net/wireless/shipped-certs.o
  CC      drivers/acpi/acpica/nsparse.o
  CC      net/sunrpc/svc_xprt.o
  CC      fs/pipe.o
  CC      arch/x86/kernel/bootflag.o
  CC      lib/list_sort.o
  CC      drivers/base/cpu.o
  CC      net/ipv4/devinet.o
  CC      net/ipv4/af_inet.o
  CC      mm/page_alloc.o
  CC      lib/uuid.o
  CC      net/ipv6/udp_offload.o
  CC      fs/namei.o
  CC      kernel/sysctl.o
  CC      fs/nfs/sysfs.o
  CC      lib/iov_iter.o
  CC      fs/ext4/symlink.o
  CC      lib/clz_ctz.o
  CC      drivers/acpi/scan.o
  CC      arch/x86/kernel/e820.o
  CC      drivers/acpi/acpica/nspredef.o
  CC      kernel/trace/trace_events.o
  CC      net/ipv6/seg6.o
  CC      net/core/netdev-genl.o
  CC      net/mac80211/tkip.o
  CC      net/core/netdev-genl-gen.o
  CC      fs/nfs/fs_context.o
  CC      net/ipv6/fib6_notifier.o
  CC      kernel/capability.o
  CC      net/netfilter/xt_CONNSECMARK.o
  CC      net/core/gso.o
  CC      drivers/acpi/acpica/nsprepkg.o
  CC      drivers/acpi/mipi-disco-img.o
  CC      net/sunrpc/xprtmultipath.o
  CC      fs/ext4/sysfs.o
  CC      kernel/trace/trace_export.o
  CC      lib/bsearch.o
  CC      kernel/ptrace.o
  CC      fs/nfs/nfsroot.o
  CC      fs/fcntl.o
  CC      fs/ext4/xattr.o
  CC      drivers/base/firmware.o
  CC      net/core/net-sysfs.o
  CC      kernel/trace/trace_event_perf.o
  CC      net/sunrpc/stats.o
  CC      drivers/acpi/acpica/nsrepair.o
  CC      fs/ioctl.o
  CC      net/ipv6/rpl.o
  CC      mm/page_frag_cache.o
  CC      drivers/acpi/resource.o
  CC      fs/readdir.o
  CC      net/ipv6/ioam6.o
  CC      drivers/base/init.o
  CC      drivers/base/map.o
  CC      net/sunrpc/sysctl.o
  CC      drivers/acpi/acpi_processor.o
  CC      net/ipv4/igmp.o
  CC      kernel/trace/trace_events_filter.o
  CC      fs/ext4/xattr_hurd.o
  CC      net/ipv6/sysctl_net_ipv6.o
  CC      drivers/acpi/acpica/nsrepair2.o
  CC      net/core/hotdata.o
  CC      kernel/trace/trace_events_trigger.o
  CC      arch/x86/kernel/pci-dma.o
  CC      net/netfilter/xt_NFLOG.o
  CC      drivers/base/devres.o
  CC      lib/find_bit.o
  CC      net/netfilter/xt_SECMARK.o
  CC      net/netfilter/xt_TCPMSS.o
  CC      kernel/user.o
  CC      net/netfilter/xt_conntrack.o
  CC      lib/llist.o
  CC      lib/lwq.o
  CC      lib/memweight.o
  CC      drivers/acpi/acpica/nssearch.o
  CC      fs/ext4/xattr_trusted.o
  CC      kernel/signal.o
  CC      net/ipv6/xfrm6_policy.o
  CC      drivers/acpi/acpica/nsutils.o
  CC      kernel/trace/trace_eprobe.o
  CC      net/mac80211/aes_cmac.o
  CC      drivers/base/attribute_container.o
  CC      mm/init-mm.o
  CC      net/core/netdev_rx_queue.o
  CC      fs/ext4/xattr_user.o
  CC      drivers/base/transport_class.o
  CC      arch/x86/kernel/quirks.o
  CC      drivers/acpi/processor_core.o
  CC      drivers/acpi/acpica/nswalk.o
  CC      fs/select.o
  CC      mm/memblock.o
  CC      fs/nfs/sysctl.o
  CC      net/core/net-procfs.o
  CC      drivers/base/topology.o
  CC      arch/x86/kernel/kdebugfs.o
  CC      net/netfilter/xt_policy.o
  CC      drivers/acpi/acpica/nsxfeval.o
  CC      net/ipv4/fib_frontend.o
  CC      mm/slub.o
  CC      kernel/trace/trace_kprobe.o
  CC      drivers/acpi/processor_pdc.o
  CC      fs/nfs/nfs3super.o
  CC      drivers/acpi/acpica/nsxfname.o
  CC      drivers/acpi/acpica/nsxfobj.o
  CC      lib/kfifo.o
  CC      arch/x86/kernel/alternative.o
  CC      net/mac80211/aes_gmac.o
  CC      kernel/sys.o
  CC      fs/ext4/fast_commit.o
  CC      mm/madvise.o
  CC      drivers/acpi/ec.o
  CC      mm/page_io.o
  CC      net/ipv6/xfrm6_state.o
  CC      drivers/base/container.o
  CC      net/mac80211/fils_aead.o
  CC      arch/x86/kernel/i8253.o
  CC      drivers/acpi/acpica/psargs.o
  CC      kernel/umh.o
  CC      lib/percpu-refcount.o
  AR      net/sunrpc/built-in.a
  CC      net/ipv6/xfrm6_input.o
  CC      drivers/base/property.o
  CC      kernel/workqueue.o
  CC      mm/swap_state.o
  CC      net/netfilter/xt_state.o
  CC      drivers/acpi/acpica/psloop.o
  CC      fs/dcache.o
  CC      kernel/trace/error_report-traces.o
  CC      net/mac80211/cfg.o
  CC      lib/rhashtable.o
  CC      mm/swapfile.o
  CC      drivers/acpi/acpica/psobject.o
  CC      arch/x86/kernel/hw_breakpoint.o
  CC      fs/inode.o
  CC      drivers/acpi/dock.o
  CC      net/ipv4/fib_semantics.o
  CC      kernel/trace/power-traces.o
  CC      fs/nfs/nfs3client.o
  CC      net/mac80211/ethtool.o
  CC      lib/base64.o
  CC      kernel/pid.o
  CC      mm/swap_slots.o
  CC      net/ipv6/xfrm6_output.o
  CC      mm/dmapool.o
  CC      net/core/netpoll.o
  CC      fs/attr.o
  CC      drivers/base/cacheinfo.o
  CC      net/mac80211/rx.o
  CC      drivers/acpi/acpica/psopcode.o
  CC      fs/nfs/nfs3proc.o
  CC      arch/x86/kernel/tsc.o
  AR      kernel/events/built-in.a
  CC      drivers/acpi/pci_root.o
  CC      net/mac80211/spectmgmt.o
  CC      net/ipv6/xfrm6_protocol.o
  CC      net/ipv4/fib_trie.o
  CC [M]  net/netfilter/nf_log_syslog.o
  CC      fs/ext4/orphan.o
  CC      net/core/fib_rules.o
  CC      drivers/acpi/pci_link.o
  CC      drivers/acpi/pci_irq.o
  CC      drivers/base/swnode.o
  CC      drivers/acpi/acpica/psopinfo.o
  CC      net/mac80211/tx.o
  CC      fs/nfs/nfs3xdr.o
  CC      arch/x86/kernel/tsc_msr.o
  CC      kernel/trace/rpm-traces.o
  CC      kernel/task_work.o
  CC      mm/hugetlb.o
  CC      net/ipv6/netfilter.o
  CC      lib/once.o
  CC      net/core/net-traces.o
  CC      fs/ext4/acl.o
  CC      drivers/acpi/acpica/psparse.o
  CC      drivers/base/auxiliary.o
  CC      fs/bad_inode.o
  CC      net/ipv4/fib_notifier.o
  CC      mm/mmu_notifier.o
  CC      fs/nfs/nfs3acl.o
  CC      arch/x86/kernel/io_delay.o
  CC      fs/ext4/xattr_security.o
  CC      net/ipv6/proc.o
  CC [M]  net/netfilter/xt_mark.o
  CC      lib/refcount.o
  CC      drivers/acpi/acpica/psscope.o
  CC      mm/migrate.o
  CC      net/mac80211/key.o
  CC      drivers/base/devtmpfs.o
  CC      net/core/selftests.o
  CC      arch/x86/kernel/rtc.o
  CC      net/ipv6/syncookies.o
  CC      arch/x86/kernel/resource.o
  CC      lib/rcuref.o
  CC      mm/page_counter.o
  CC      drivers/acpi/acpi_apd.o
  CC      mm/hugetlb_cgroup.o
  CC      net/ipv4/inet_fragment.o
  CC      fs/nfs/nfs4proc.o
  CC      kernel/trace/trace_dynevent.o
  CC      mm/early_ioremap.o
  CC      net/mac80211/util.o
  CC      lib/usercopy.o
  CC      fs/nfs/nfs4xdr.o
  CC      drivers/acpi/acpica/pstree.o
  CC      kernel/extable.o
  CC      net/ipv4/ping.o
  CC      kernel/trace/trace_probe.o
  AS      arch/x86/kernel/irqflags.o
  CC      mm/secretmem.o
  CC      fs/file.o
  CC      drivers/base/module.o
  CC      lib/errseq.o
  CC      drivers/acpi/acpi_platform.o
  CC      lib/bucket_locks.o
  CC      fs/nfs/nfs4state.o
  CC      net/ipv6/calipso.o
  CC      kernel/params.o
  CC      drivers/acpi/acpica/psutils.o
  CC      arch/x86/kernel/static_call.o
  CC      drivers/base/auxiliary_sysfs.o
  CC      kernel/trace/trace_uprobe.o
  CC [M]  net/netfilter/xt_nat.o
  CC      kernel/kthread.o
  CC      mm/hmm.o
  CC      net/ipv4/ip_tunnel_core.o
  CC      net/core/ptp_classifier.o
  CC      net/ipv4/gre_offload.o
  CC      kernel/sys_ni.o
  CC      drivers/acpi/acpica/pswalk.o
  CC      net/ipv6/ah6.o
  CC      drivers/acpi/acpi_pnp.o
  CC      kernel/trace/rethook.o
  CC      fs/nfs/nfs4renewd.o
  CC      fs/filesystems.o
  CC      arch/x86/kernel/process.o
  CC      lib/generic-radix-tree.o
  CC [M]  net/netfilter/xt_LOG.o
  CC      net/ipv4/metrics.o
  CC      drivers/base/devcoredump.o
  CC      lib/bitmap-str.o
  CC      drivers/acpi/power.o
  CC      net/mac80211/parse.o
  CC      net/core/netprio_cgroup.o
  CC      drivers/acpi/acpica/psxface.o
  CC      fs/nfs/nfs4super.o
  CC      fs/namespace.o
  CC      net/ipv4/netlink.o
  CC      net/ipv6/esp6.o
  CC      net/mac80211/wme.o
  CC      drivers/base/platform-msi.o
  CC      net/ipv4/nexthop.o
  CC      net/ipv4/udp_tunnel_stub.o
  CC      fs/nfs/nfs4file.o
  CC      drivers/acpi/acpica/rsaddr.o
  CC [M]  net/netfilter/xt_MASQUERADE.o
  CC      drivers/base/physical_location.o
  CC      net/ipv6/sit.o
  CC      arch/x86/kernel/ptrace.o
  CC      drivers/acpi/event.o
  CC      lib/string_helpers.o
  CC      net/core/netclassid_cgroup.o
  CC      net/mac80211/chan.o
  CC      drivers/acpi/evged.o
  CC [M]  net/netfilter/xt_addrtype.o
  CC      drivers/base/trace.o
  CC      net/ipv4/ip_tunnel.o
  CC      lib/hexdump.o
  CC      drivers/acpi/acpica/rscalc.o
  CC      arch/x86/kernel/tls.o
  CC      mm/memfd.o
  CC      fs/nfs/delegation.o
  CC      net/mac80211/trace.o
  CC      drivers/acpi/sysfs.o
  CC      net/core/dst_cache.o
  CC      drivers/acpi/acpica/rscreate.o
  AR      net/wireless/built-in.a
  CC      arch/x86/kernel/step.o
  CC      fs/seq_file.o
  CC      lib/kstrtox.o
  CC      drivers/acpi/property.o
  CC      net/mac80211/mlme.o
  CC      drivers/acpi/acpica/rsdumpinfo.o
  CC      mm/ptdump.o
  CC      arch/x86/kernel/i8237.o
  CC      net/mac80211/tdls.o
  CC      fs/xattr.o
  CC      net/ipv6/addrconf_core.o
  CC      net/ipv4/sysctl_net_ipv4.o
  CC      net/ipv6/exthdrs_core.o
  CC      net/mac80211/ocb.o
  AR      kernel/trace/built-in.a
  CC      kernel/nsproxy.o
  CC      mm/execmem.o
  CC      drivers/acpi/acpica/rsinfo.o
  CC      net/core/gro_cells.o
  CC      drivers/acpi/acpica/rsio.o
  AR      drivers/base/built-in.a
  CC      kernel/notifier.o
  CC      arch/x86/kernel/stacktrace.o
  CC      net/ipv6/ip6_checksum.o
  CC      lib/iomap.o
  CC      net/core/failover.o
  CC      fs/nfs/nfs4idmap.o
  CC      arch/x86/kernel/reboot.o
  CC      fs/libfs.o
  CC      net/ipv4/proc.o
  CC      net/mac80211/airtime.o
  CC      lib/iomap_copy.o
  CC      fs/fs-writeback.o
  CC      net/ipv4/fib_rules.o
  CC      kernel/ksysfs.o
  CC      drivers/acpi/debugfs.o
  CC      fs/pnode.o
  CC      drivers/acpi/acpica/rsirq.o
  CC      kernel/cred.o
  CC      fs/splice.o
  CC      net/ipv4/ipmr.o
  AR      net/netfilter/built-in.a
  CC      drivers/acpi/acpi_lpat.o
  CC      lib/devres.o
  CC      drivers/acpi/acpica/rslist.o
  CC      kernel/reboot.o
  CC      drivers/acpi/acpi_pcc.o
  AR      mm/built-in.a
  CC      net/ipv4/ipmr_base.o
  CC      arch/x86/kernel/msr.o
  CC      fs/nfs/callback.o
  CC      lib/check_signature.o
  AR      fs/ext4/built-in.a
  CC      fs/sync.o
  CC      net/mac80211/eht.o
  CC      kernel/async.o
  CC      net/ipv6/ip6_icmp.o
  CC      net/mac80211/led.o
  CC      kernel/range.o
  CC      fs/utimes.o
  CC      net/ipv6/output_core.o
  CC      drivers/acpi/acpica/rsmemory.o
  CC      fs/d_path.o
  CC      kernel/smpboot.o
  CC      lib/interval_tree.o
  CC      drivers/acpi/ac.o
  CC      lib/assoc_array.o
  CC      net/ipv4/syncookies.o
  CC      fs/stack.o
  CC      lib/bitrev.o
  CC      arch/x86/kernel/cpuid.o
  CC      net/mac80211/pm.o
  CC      net/mac80211/rc80211_minstrel_ht.o
  CC      lib/crc-ccitt.o
  CC      fs/nfs/callback_xdr.o
  AR      net/core/built-in.a
  CC      drivers/acpi/acpica/rsmisc.o
  CC      lib/crc16.o
  CC      arch/x86/kernel/early-quirks.o
  CC      fs/fs_struct.o
  CC      drivers/acpi/button.o
  CC      kernel/ucount.o
  CC      net/mac80211/wbrf.o
  CC      net/ipv6/protocol.o
  HOSTCC  lib/gen_crc32table
  CC      drivers/acpi/fan_core.o
  CC      fs/statfs.o
  CC      net/ipv4/tunnel4.o
  CC      fs/nfs/callback_proc.o
  CC      fs/nfs/nfs4namespace.o
  CC      net/ipv4/ipconfig.o
  CC      fs/nfs/nfs4getroot.o
  CC      arch/x86/kernel/smp.o
  CC      drivers/acpi/acpica/rsserial.o
  CC      net/ipv6/ip6_offload.o
  CC      fs/nfs/nfs4client.o
  CC      net/ipv4/netfilter.o
  CC      arch/x86/kernel/smpboot.o
  CC      fs/fs_pin.o
  CC      lib/xxhash.o
  CC      fs/nfs/nfs4session.o
  CC      arch/x86/kernel/tsc_sync.o
  CC      net/ipv4/tcp_cubic.o
  CC      drivers/acpi/fan_attr.o
  CC      lib/genalloc.o
  CC      kernel/regset.o
  CC      fs/nfs/dns_resolve.o
  CC      net/ipv6/tcpv6_offload.o
  CC      drivers/acpi/acpica/rsutils.o
  CC      fs/nsfs.o
  CC      lib/percpu_counter.o
  CC      net/ipv4/tcp_sigpool.o
  CC      fs/fs_types.o
  CC      lib/audit.o
  CC      net/ipv6/exthdrs_offload.o
  CC      kernel/ksyms_common.o
  CC      fs/nfs/nfs4trace.o
  CC      lib/syscall.o
  CC      drivers/acpi/fan_hwmon.o
  CC      net/ipv6/inet6_hashtables.o
  CC      arch/x86/kernel/setup_percpu.o
  CC      net/ipv4/cipso_ipv4.o
  CC      net/ipv4/xfrm4_policy.o
  CC      drivers/acpi/acpica/rsxface.o
  CC      net/ipv6/mcast_snoop.o
  CC      fs/nfs/nfs4sysctl.o
  CC      lib/errname.o
  CC      net/ipv4/xfrm4_state.o
  CC      drivers/acpi/acpica/tbdata.o
  CC      fs/fs_context.o
  CC      drivers/acpi/acpi_video.o
  CC      kernel/groups.o
  CC      drivers/acpi/acpica/tbfadt.o
  CC      arch/x86/kernel/mpparse.o
  CC      drivers/acpi/video_detect.o
  CC      fs/fs_parser.o
  CC      lib/nlattr.o
  CC      kernel/kcmp.o
  CC      net/ipv4/xfrm4_input.o
  CC      arch/x86/kernel/trace_clock.o
  CC      fs/fsopen.o
  CC      lib/cpu_rmap.o
  CC      lib/dynamic_queue_limits.o
  CC      kernel/freezer.o
  CC      drivers/acpi/acpica/tbfind.o
  CC      arch/x86/kernel/trace.o
  CC      drivers/acpi/processor_driver.o
  CC      kernel/profile.o
  CC      lib/glob.o
  CC      fs/init.o
  CC      net/ipv4/xfrm4_output.o
  CC      drivers/acpi/acpica/tbinstal.o
  CC      arch/x86/kernel/rethook.o
  CC      drivers/acpi/processor_thermal.o
  CC      lib/strncpy_from_user.o
  CC      net/ipv4/xfrm4_protocol.o
  CC      drivers/acpi/acpica/tbprint.o
  CC      arch/x86/kernel/vmcore_info_32.o
  CC      drivers/acpi/processor_idle.o
  CC      lib/strnlen_user.o
  CC      kernel/stacktrace.o
  CC      fs/kernel_read_file.o
  CC      drivers/acpi/acpica/tbutils.o
  CC      arch/x86/kernel/machine_kexec_32.o
  CC      drivers/acpi/processor_throttling.o
  CC      lib/net_utils.o
  CC      lib/sg_pool.o
  CC      fs/mnt_idmapping.o
  CC      drivers/acpi/processor_perflib.o
  AS      arch/x86/kernel/relocate_kernel_32.o
  CC      kernel/dma.o
  CC      fs/remap_range.o
  CC      arch/x86/kernel/crash_dump_32.o
  CC      lib/stackdepot.o
  CC      kernel/smp.o
  CC      kernel/uid16.o
  CC      lib/asn1_decoder.o
  GEN     lib/oid_registry_data.c
  CC      drivers/acpi/container.o
  CC      arch/x86/kernel/crash.o
  CC      kernel/kallsyms.o
  CC      fs/pidfs.o
  CC      lib/ucs2_string.o
  CC      arch/x86/kernel/module.o
  CC      drivers/acpi/acpica/tbxface.o
  CC      drivers/acpi/thermal_lib.o
  CC      arch/x86/kernel/doublefault_32.o
  CC      fs/buffer.o
  CC      drivers/acpi/acpica/tbxfload.o
  CC      arch/x86/kernel/early_printk.o
  CC      lib/sbitmap.o
  CC      drivers/acpi/thermal.o
  CC      arch/x86/kernel/hpet.o
  CC      lib/group_cpus.o
  CC      drivers/acpi/acpica/tbxfroot.o
  CC      kernel/acct.o
  CC      drivers/acpi/nhlt.o
  CC      drivers/acpi/acpica/utaddress.o
  AR      net/ipv6/built-in.a
  CC      lib/fw_table.o
  CC      fs/mpage.o
  CC      arch/x86/kernel/amd_nb.o
  CC      fs/proc_namespace.o
  CC      drivers/acpi/acpica/utalloc.o
  CC      arch/x86/kernel/amd_node.o
  CC      kernel/vmcore_info.o
  AR      lib/lib.a
  CC      drivers/acpi/acpi_memhotplug.o
  GEN     lib/crc32table.h
  CC      fs/direct-io.o
  CC      kernel/elfcorehdr.o
  CC      drivers/acpi/acpica/utascii.o
  CC      fs/eventpoll.o
  CC      drivers/acpi/acpica/utbuffer.o
  CC      arch/x86/kernel/kvm.o
  CC      fs/anon_inodes.o
  CC      fs/signalfd.o
  CC      drivers/acpi/acpica/utcksum.o
  CC      kernel/crash_reserve.o
  CC      drivers/acpi/ioapic.o
  CC      arch/x86/kernel/kvmclock.o
  CC      drivers/acpi/battery.o
  CC      drivers/acpi/bgrt.o
  CC      kernel/kexec_core.o
  CC      lib/oid_registry.o
  CC      fs/timerfd.o
  CC      drivers/acpi/acpica/utcopy.o
  CC      arch/x86/kernel/paravirt.o
  CC      lib/crc32.o
  CC      fs/eventfd.o
  AR      net/ipv4/built-in.a
  CC      drivers/acpi/spcr.o
  CC      kernel/crash_core.o
  CC      arch/x86/kernel/pvclock.o
  CC      fs/aio.o
  CC      arch/x86/kernel/pcspeaker.o
  CC      kernel/kexec.o
  CC      fs/locks.o
  CC      drivers/acpi/acpica/utexcep.o
  CC      kernel/utsname.o
  CC      arch/x86/kernel/check.o
  CC      kernel/pid_namespace.o
  CC      drivers/acpi/acpica/utdebug.o
  CC      drivers/acpi/acpica/utdecode.o
  CC      arch/x86/kernel/uprobes.o
  CC      kernel/stop_machine.o
  CC      fs/binfmt_misc.o
  CC      arch/x86/kernel/perf_regs.o
  CC      drivers/acpi/acpica/utdelete.o
  CC      fs/binfmt_script.o
  CC      fs/binfmt_elf.o
  CC      arch/x86/kernel/tracepoint.o
  AR      lib/built-in.a
  CC      drivers/acpi/acpica/uterror.o
  CC      kernel/audit.o
  CC      drivers/acpi/acpica/uteval.o
  CC      kernel/auditfilter.o
  CC      arch/x86/kernel/itmt.o
  CC      kernel/auditsc.o
  CC      drivers/acpi/acpica/utglobal.o
  CC      kernel/audit_watch.o
  CC      kernel/audit_fsnotify.o
  CC      fs/mbcache.o
  CC      drivers/acpi/acpica/uthex.o
  CC      drivers/acpi/acpica/utids.o
  CC      fs/posix_acl.o
  CC      arch/x86/kernel/umip.o
  CC      kernel/audit_tree.o
  CC      arch/x86/kernel/unwind_frame.o
  CC      fs/coredump.o
  CC      fs/drop_caches.o
  CC      drivers/acpi/acpica/utinit.o
  CC      kernel/kprobes.o
  CC      kernel/seccomp.o
  CC      drivers/acpi/acpica/utlock.o
  CC      fs/sysctls.o
  CC      kernel/relay.o
  CC      drivers/acpi/acpica/utmath.o
  CC      fs/fhandle.o
  CC      kernel/utsname_sysctl.o
  CC      drivers/acpi/acpica/utmisc.o
  CC      drivers/acpi/acpica/utmutex.o
  CC      kernel/delayacct.o
  CC      drivers/acpi/acpica/utnonansi.o
  CC      kernel/taskstats.o
  CC      drivers/acpi/acpica/utobject.o
  CC      kernel/tsacct.o
  CC      kernel/tracepoint.o
  CC      drivers/acpi/acpica/utosi.o
  CC      kernel/irq_work.o
  CC      drivers/acpi/acpica/utownerid.o
  CC      drivers/acpi/acpica/utpredef.o
  CC      drivers/acpi/acpica/utresdecode.o
  CC      kernel/static_call.o
  CC      kernel/padata.o
  CC      drivers/acpi/acpica/utresrc.o
  CC      kernel/jump_label.o
  CC      kernel/context_tracking.o
  CC      kernel/iomem.o
  CC      drivers/acpi/acpica/utstate.o
  CC      kernel/rseq.o
  CC      drivers/acpi/acpica/utstring.o
  CC      drivers/acpi/acpica/utstrsuppt.o
  CC      drivers/acpi/acpica/utstrtoul64.o
  CC      drivers/acpi/acpica/utxface.o
  CC      drivers/acpi/acpica/utxfinit.o
  CC      drivers/acpi/acpica/utxferror.o
  CC      drivers/acpi/acpica/utxfmutex.o
  AR      fs/nfs/built-in.a
  AR      arch/x86/kernel/built-in.a
  AR      arch/x86/built-in.a
  AR      drivers/acpi/acpica/built-in.a
  AR      drivers/acpi/built-in.a
make[2]: *** [/workspace/kernel/scripts/Makefile.build:465: drivers] Error 2
make[2]: *** Waiting for unfinished jobs....
  AR      fs/built-in.a
  AR      kernel/built-in.a
  AR      net/mac80211/built-in.a
  AR      net/built-in.a
make[1]: *** [/workspace/kernel/Makefile:1994: .] Error 2
make: *** [/workspace/kernel/Makefile:251: __sub-make] Error 2
run-parts: /workspace/ci/hooks/11-build-32b exited with return code 2


