Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89752C197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 20:34:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51AFA10EB8C;
	Thu, 27 Feb 2025 20:34:18 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E7510EB7C;
 Thu, 27 Feb 2025 20:34:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EHooks=3A_success_for_drm/i915/xe3lpd=3A_Map_POWER?=
 =?utf-8?q?=5FDOMAIN=5FAUDIO=5FPLAYBACK_to_DC=5Foff?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Feb 2025 20:34:17 -0000
Message-ID: <174068845771.2854856.18062421420754817088@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250227-xe3lpd-power-domain-audio-playback-v1-1-5765f21da977@intel.com>
In-Reply-To: <20250227-xe3lpd-power-domain-audio-playback-v1-1-5765f21da977@intel.com>
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

Series: drm/i915/xe3lpd: Map POWER_DOMAIN_AUDIO_PLAYBACK to DC_off
URL   : https://patchwork.freedesktop.org/series/145594/
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
  CC      /workspace/kernel/build64-default/tools/objtool/builtin-check.o
  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/special.o
  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/decode.o
  CC      /workspace/kernel/build64-default/tools/objtool/elf.o
  CC      /workspace/kernel/build64-default/tools/objtool/objtool.o
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
  HOSTCC  scripts/kconfig/menu.o
  YACC    scripts/kconfig/parser.tab.[ch]
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
  UPD     include/generated/uapi/linux/version.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctls.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  WRAP    arch/x86/include/generated/uapi/asm/ipcbuf.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  WRAP    arch/x86/include/generated/uapi/asm/param.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  WRAP    arch/x86/include/generated/uapi/asm/resource.h
  WRAP    arch/x86/include/generated/uapi/asm/socket.h
  WRAP    arch/x86/include/generated/uapi/asm/sockios.h
  WRAP    arch/x86/include/generated/uapi/asm/termbits.h
  WRAP    arch/x86/include/generated/uapi/asm/termios.h
  WRAP    arch/x86/include/generated/uapi/asm/types.h
  HOSTCC  arch/x86/tools/relocs_32.o
  UPD     include/generated/compile.h
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
  CC      certs/system_keyring.o
  CC      init/do_mounts.o
  CC      init/do_mounts_initrd.o
  CC      ipc/util.o
  UPD     init/utsversion-tmp.h
  CC      ipc/msgutil.o
  CC      init/initramfs.o
  CC      ipc/msg.o
  CC      security/commoncap.o
  CC      init/calibrate.o
  CC      ipc/sem.o
  CC      mm/filemap.o
  CC      block/bdev.o
  CC      security/lsm_syscalls.o
  CC      ipc/shm.o
  CC      mm/mempool.o
  CC      init/init_task.o
  AS      arch/x86/lib/atomic64_cx8_32.o
  CC      io_uring/io_uring.o
  CC      security/min_addr.o
  CC      arch/x86/power/cpu.o
  CC      arch/x86/pci/i386.o
  CC      block/fops.o
  CC      arch/x86/realmode/init.o
  HOSTCC  security/selinux/genheaders
  AR      arch/x86/crypto/built-in.a
  AR      arch/x86/net/built-in.a
  CC      arch/x86/video/video-common.o
  CC      security/keys/gc.o
  CC      block/partitions/core.o
  CC      security/integrity/iint.o
  AR      virt/lib/built-in.a
  CC      arch/x86/events/amd/core.o
  CC      fs/nfs_common/nfsacl.o
  AR      arch/x86/entry/vsyscall/built-in.a
  CC      arch/x86/power/hibernate_32.o
  AR      arch/x86/platform/atom/built-in.a
  CC      lib/math/div64.o
  AR      drivers/cache/built-in.a
  CC      net/core/sock.o
  CC      arch/x86/virt/svm/cmdline.o
  CC      fs/notify/dnotify/dnotify.o
  CC      arch/x86/mm/pat/set_memory.o
  CC      fs/notify/inotify/inotify_fsnotify.o
  CC      arch/x86/kernel/fpu/init.o
  CC      sound/core/seq/seq.o
  AR      virt/built-in.a
  AR      arch/x86/platform/ce4100/built-in.a
  AS      arch/x86/lib/checksum_32.o
  AR      drivers/irqchip/built-in.a
  CC      arch/x86/entry/vdso/vma.o
  CC      arch/x86/kernel/cpu/mce/core.o
  CC      arch/x86/platform/efi/memmap.o
  AR      arch/x86/platform/geode/built-in.a
  AR      drivers/bus/mhi/built-in.a
  CC      kernel/sched/core.o
  AR      drivers/pwm/built-in.a
  AR      drivers/bus/built-in.a
  CC      arch/x86/lib/cmdline.o
  CC      arch/x86/kernel/cpu/mce/severity.o
  CC      crypto/asymmetric_keys/asymmetric_type.o
  AR      drivers/leds/trigger/built-in.a
  AR      drivers/leds/blink/built-in.a
  AR      drivers/leds/simple/built-in.a
  AR      arch/x86/virt/svm/built-in.a
  CC      drivers/leds/led-core.o
  AR      arch/x86/virt/vmx/built-in.a
  AR      arch/x86/virt/built-in.a
  CC      arch/x86/kernel/cpu/mce/genpool.o
  AS      arch/x86/lib/cmpxchg8b_emu.o
  CC      lib/math/gcd.o
  GEN     security/selinux/flask.h security/selinux/av_permissions.h
  CC      security/selinux/avc.o
  CC      arch/x86/lib/cpu.o
  CC      lib/math/lcm.o
  CC      lib/math/int_log.o
  CC      arch/x86/kernel/cpu/mce/intel.o
  GEN     usr/initramfs_data.cpio
  COPY    usr/initramfs_inc_data
  AS      usr/initramfs_data.o
  HOSTCC  certs/extract-cert
  AR      usr/built-in.a
  CC      lib/math/int_pow.o
  CC      arch/x86/kernel/fpu/bugs.o
  CC      arch/x86/kernel/acpi/boot.o
  CC      lib/math/int_sqrt.o
  CC      arch/x86/kernel/fpu/core.o
  CC      lib/math/reciprocal_div.o
  CC      fs/notify/inotify/inotify_user.o
  CC      arch/x86/lib/delay.o
  AS      arch/x86/realmode/rm/header.o
  CC      sound/core/seq/seq_lock.o
  CC      lib/math/rational.o
  AS      arch/x86/realmode/rm/trampoline_32.o
  AR      arch/x86/video/built-in.a
  AS      arch/x86/realmode/rm/stack.o
  CC      ipc/syscall.o
  AS      arch/x86/realmode/rm/reboot.o
  CERT    certs/x509_certificate_list
  CERT    certs/signing_key.x509
  AR      fs/notify/fanotify/built-in.a
  AS      certs/system_certificates.o
  AS      arch/x86/realmode/rm/wakeup_asm.o
  CC      sound/core/sound.o
  CC      security/integrity/integrity_audit.o
  CC      arch/x86/kernel/cpu/mce/amd.o
  AR      certs/built-in.a
  CC      drivers/leds/led-class.o
  CC      arch/x86/realmode/rm/wakemain.o
  CC      fs/nfs_common/grace.o
  CC      kernel/locking/mutex.o
  CC      kernel/power/qos.o
  CC      kernel/printk/printk.o
  CC      lib/crypto/mpi/generic_mpih-lshift.o
  CC      kernel/irq/irqdesc.o
  CC      arch/x86/pci/init.o
  CC      kernel/irq/handle.o
  CC      security/keys/key.o
  CC      arch/x86/realmode/rm/video-mode.o
  CC      crypto/asymmetric_keys/restrict.o
  AR      fs/notify/dnotify/built-in.a
  CC      kernel/irq/manage.o
  CC      drivers/leds/led-triggers.o
  CC      arch/x86/entry/vdso/extable.o
  CC      arch/x86/platform/efi/quirks.o
  AS      arch/x86/lib/getuser.o
  CC      block/partitions/msdos.o
  AS      arch/x86/realmode/rm/copy.o
  AS      arch/x86/power/hibernate_asm_32.o
  CC      net/ethernet/eth.o
  CC      lib/crypto/memneq.o
  GEN     arch/x86/lib/inat-tables.c
  AS      arch/x86/realmode/rm/bioscall.o
  CC      arch/x86/power/hibernate.o
  CC      arch/x86/lib/insn-eval.o
  CC      arch/x86/realmode/rm/regs.o
  CC      sound/core/seq/seq_clientmgr.o
  AR      lib/math/built-in.a
  CC      kernel/printk/printk_safe.o
  CC      arch/x86/realmode/rm/video-vga.o
  CC      arch/x86/mm/pat/memtype.o
  CC      arch/x86/platform/efi/efi.o
  CC      arch/x86/kernel/fpu/regset.o
  CC      arch/x86/realmode/rm/video-vesa.o
  CC      kernel/locking/semaphore.o
  CC      arch/x86/realmode/rm/video-bios.o
  CC      arch/x86/kernel/fpu/signal.o
  CC      arch/x86/platform/efi/efi_32.o
  CC      arch/x86/events/amd/lbr.o
  PASYMS  arch/x86/realmode/rm/pasyms.h
  CC      arch/x86/kernel/acpi/sleep.o
  CC      net/core/request_sock.o
  CC      crypto/asymmetric_keys/signature.o
  AR      net/802/built-in.a
  LDS     arch/x86/realmode/rm/realmode.lds
  CC      lib/zlib_inflate/inffast.o
  CC      lib/crypto/mpi/generic_mpih-mul1.o
  LD      arch/x86/realmode/rm/realmode.elf
  CC      lib/zlib_deflate/deflate.o
  LDS     arch/x86/entry/vdso/vdso32/vdso32.lds
  RELOCS  arch/x86/realmode/rm/realmode.relocs
  OBJCOPY arch/x86/realmode/rm/realmode.bin
  CC      mm/oom_kill.o
  AS      arch/x86/realmode/rmpiggy.o
  AR      arch/x86/platform/iris/built-in.a
  CC      arch/x86/events/amd/ibs.o
  AR      arch/x86/realmode/built-in.a
  CC      arch/x86/kernel/cpu/mtrr/mtrr.o
  CC      security/security.o
  CC      arch/x86/pci/pcbios.o
  CC      fs/iomap/trace.o
  AR      security/integrity/built-in.a
  CC      arch/x86/kernel/cpu/mtrr/if.o
  CC      fs/nfs_common/common.o
  CC      init/version.o
  CC      lib/zlib_inflate/inflate.o
  CC      crypto/asymmetric_keys/public_key.o
  ASN.1   crypto/asymmetric_keys/x509.asn1.[ch]
  CC      arch/x86/kernel/cpu/mtrr/generic.o
  AR      fs/notify/inotify/built-in.a
  CC      fs/notify/fsnotify.o
  AR      drivers/leds/built-in.a
  CC      drivers/pci/msi/pcidev_msi.o
  AR      arch/x86/power/built-in.a
  AS      arch/x86/entry/vdso/vdso32/note.o
  CC      drivers/pci/pcie/portdrv.o
  AS      arch/x86/entry/entry.o
  AS      arch/x86/entry/vdso/vdso32/system_call.o
  AS      arch/x86/entry/vdso/vdso32/sigreturn.o
  CC      sound/core/seq/seq_memory.o
  CC      arch/x86/pci/mmconfig_32.o
  AR      init/built-in.a
  CC      arch/x86/mm/init.o
  CC      arch/x86/entry/vdso/vdso32/vclock_gettime.o
  CC      block/partitions/efi.o
  CC      net/sched/sch_generic.o
  CC      ipc/ipc_sysctl.o
  CC      kernel/power/main.o
  CC      arch/x86/kernel/fpu/xstate.o
  CC      security/keys/keyring.o
  CC      net/netlink/af_netlink.o
  CC      arch/x86/lib/insn.o
  CC      security/selinux/hooks.o
  CC      arch/x86/mm/init_32.o
  CC      ipc/mqueue.o
  CC      lib/crypto/mpi/generic_mpih-mul2.o
  CC      arch/x86/mm/pat/memtype_interval.o
  CC      lib/zlib_deflate/deftree.o
  AS      arch/x86/kernel/acpi/wakeup_32.o
  CC      arch/x86/kernel/acpi/cstate.o
  CC      kernel/locking/rwsem.o
  CC      kernel/printk/nbcon.o
  AS      arch/x86/platform/efi/efi_stub_32.o
  CC      arch/x86/platform/efi/runtime-map.o
  CC      drivers/pci/pcie/rcec.o
  CC      fs/quota/dquot.o
  CC      arch/x86/kernel/cpu/mce/threshold.o
  CC      arch/x86/lib/kaslr.o
  CC      lib/zlib_inflate/infutil.o
  CC      fs/proc/task_mmu.o
  ASN.1   crypto/asymmetric_keys/x509_akid.asn1.[ch]
  CC      fs/proc/inode.o
  CC      crypto/asymmetric_keys/x509_loader.o
  AR      fs/nfs_common/built-in.a
  CC      ipc/namespace.o
  CC      arch/x86/kernel/cpu/microcode/core.o
  CC      kernel/irq/spurious.o
  CC      drivers/pci/msi/api.o
  AR      net/ethernet/built-in.a
  CC      security/selinux/selinuxfs.o
  CC      fs/notify/notification.o
  CC      lib/crypto/mpi/generic_mpih-mul3.o
  CC      lib/zlib_inflate/inftrees.o
  CC      arch/x86/pci/direct.o
  CC      arch/x86/entry/vdso/vdso32/vgetcpu.o
  CC      arch/x86/lib/memcpy_32.o
  CC      crypto/asymmetric_keys/x509_public_key.o
  HOSTCC  arch/x86/entry/vdso/vdso2c
  AS      arch/x86/lib/memmove_32.o
  CC      lib/zlib_inflate/inflate_syms.o
  CC      arch/x86/lib/misc.o
  CC      arch/x86/events/intel/core.o
  CC      arch/x86/lib/pc-conf-reg.o
  CC      arch/x86/events/intel/bts.o
  CC      net/core/skbuff.o
  CC      arch/x86/events/amd/uncore.o
  CC      sound/core/seq/seq_queue.o
  CC      lib/zlib_deflate/deflate_syms.o
  CC      arch/x86/kernel/cpu/mtrr/cleanup.o
  CC      fs/iomap/iter.o
  AR      arch/x86/mm/pat/built-in.a
  AR      arch/x86/kernel/acpi/built-in.a
  CC      arch/x86/kernel/cpu/mtrr/amd.o
  CC      net/core/datagram.o
  CC      lib/crypto/utils.o
  AR      block/partitions/built-in.a
  CC      block/bio.o
  CC      net/sched/sch_mq.o
  AS      arch/x86/lib/putuser.o
  AS      arch/x86/lib/retpoline.o
  CC      arch/x86/lib/string_32.o
  CC      kernel/irq/resend.o
  CC      drivers/pci/pcie/bwctrl.o
  CC      drivers/pci/pcie/aspm.o
  AR      lib/zlib_inflate/built-in.a
  CC      net/netlink/genetlink.o
  CC      arch/x86/lib/strstr_32.o
  CC      kernel/power/console.o
  AR      arch/x86/platform/efi/built-in.a
  CC      arch/x86/mm/fault.o
  CC      arch/x86/lib/usercopy.o
  CC      sound/core/init.o
  CC      kernel/locking/percpu-rwsem.o
  CC      arch/x86/platform/intel/iosf_mbi.o
  CC      arch/x86/entry/vdso/vdso32-setup.o
  CC      lib/crypto/mpi/generic_mpih-rshift.o
  AR      lib/zlib_deflate/built-in.a
  CC      net/sched/sch_frag.o
  CC      fs/notify/group.o
  CC      arch/x86/kernel/cpu/microcode/intel.o
  CC      fs/notify/mark.o
  ASN.1   crypto/asymmetric_keys/pkcs7.asn1.[ch]
  CC      crypto/asymmetric_keys/pkcs7_trust.o
  CC      drivers/pci/msi/msi.o
  CC      crypto/asymmetric_keys/pkcs7_verify.o
  CC      io_uring/opdef.o
  CC      kernel/printk/printk_ringbuffer.o
  AR      arch/x86/kernel/fpu/built-in.a
  CC      io_uring/kbuf.o
  CC      security/keys/keyctl.o
  CC      arch/x86/pci/mmconfig-shared.o
  CC      mm/fadvise.o
  CC      kernel/power/process.o
  AR      arch/x86/kernel/cpu/mce/built-in.a
  CC      arch/x86/lib/usercopy_32.o
  CC      kernel/rcu/update.o
  VDSO    arch/x86/entry/vdso/vdso32.so.dbg
  AR      drivers/pci/pwrctrl/built-in.a
  CC      fs/kernfs/mount.o
  OBJCOPY arch/x86/entry/vdso/vdso32.so
  VDSO2C  arch/x86/entry/vdso/vdso-image-32.c
  CC      arch/x86/entry/vdso/vdso-image-32.o
  CC      kernel/irq/chip.o
  CC      arch/x86/kernel/cpu/mtrr/cyrix.o
  CC      sound/core/seq/seq_fifo.o
  CC      fs/iomap/buffered-io.o
  CC      drivers/video/console/dummycon.o
  CC      crypto/asymmetric_keys/x509.asn1.o
  CC      arch/x86/lib/msr-smp.o
  CC      ipc/mq_sysctl.o
  CC      drivers/video/backlight/backlight.o
  CC      lib/crypto/mpi/generic_mpih-sub1.o
  CC      crypto/asymmetric_keys/x509_akid.asn1.o
  AR      arch/x86/entry/vdso/built-in.a
  CC      kernel/locking/spinlock.o
  AS      arch/x86/entry/entry_32.o
  CC      crypto/asymmetric_keys/x509_cert_parser.o
  AR      drivers/video/fbdev/core/built-in.a
  CC      arch/x86/entry/syscall_32.o
  AR      drivers/video/fbdev/omap/built-in.a
  CC      drivers/video/aperture.o
  AR      drivers/video/fbdev/omap2/omapfb/dss/built-in.a
  AR      drivers/video/fbdev/omap2/omapfb/displays/built-in.a
  AR      drivers/video/fbdev/omap2/omapfb/built-in.a
  AR      drivers/video/fbdev/omap2/built-in.a
  AR      drivers/video/fbdev/built-in.a
  AR      arch/x86/platform/intel/built-in.a
  CC      drivers/pci/hotplug/pci_hotplug_core.o
  AR      arch/x86/platform/intel-mid/built-in.a
  AR      arch/x86/platform/intel-quark/built-in.a
  CC      arch/x86/entry/common.o
  AR      arch/x86/events/amd/built-in.a
  AR      arch/x86/platform/olpc/built-in.a
  AS      arch/x86/entry/thunk.o
  AR      arch/x86/platform/scx200/built-in.a
  AR      arch/x86/platform/ts5500/built-in.a
  CC      drivers/video/console/vgacon.o
  AR      arch/x86/platform/uv/built-in.a
  AR      arch/x86/platform/built-in.a
  AR      drivers/pci/controller/dwc/built-in.a
  AR      drivers/pci/controller/mobiveil/built-in.a
  AR      drivers/pci/switch/built-in.a
  CC      fs/kernfs/inode.o
  CC      arch/x86/kernel/cpu/microcode/amd.o
  CC      drivers/pci/pcie/pme.o
  AR      drivers/pci/controller/plda/built-in.a
  AR      drivers/pci/controller/built-in.a
  CC      arch/x86/lib/cache-smp.o
  CC      kernel/printk/sysctl.o
  CC      crypto/asymmetric_keys/pkcs7.asn1.o
  CC      fs/notify/fdinfo.o
  CC      mm/maccess.o
  CC      kernel/sched/fair.o
  AR      ipc/built-in.a
  CC      drivers/pci/msi/irqdomain.o
  CC      kernel/locking/osq_lock.o
  CC      fs/sysfs/file.o
  CC      block/elevator.o
  CC      fs/proc/root.o
  CC      arch/x86/kernel/cpu/mtrr/centaur.o
  CC      arch/x86/lib/crc32-glue.o
  AS      arch/x86/lib/crc32-pclmul.o
  CC      drivers/video/cmdline.o
  CC      sound/core/memory.o
  CC      sound/core/seq/seq_prioq.o
  CC      security/selinux/netlink.o
  CC      arch/x86/pci/fixup.o
  CC      arch/x86/mm/ioremap.o
  CC      lib/crypto/mpi/generic_mpih-add1.o
  CC      arch/x86/kernel/cpu/cacheinfo.o
  CC      mm/page-writeback.o
  CC      crypto/asymmetric_keys/pkcs7_parser.o
  CC      kernel/power/suspend.o
  AR      kernel/printk/built-in.a
  CC      kernel/locking/qspinlock.o
  CC      security/lsm_audit.o
  CC      crypto/api.o
  CC      arch/x86/pci/acpi.o
  CC      fs/quota/quota_v2.o
  CC      net/sched/sch_api.o
  CC      kernel/irq/dummychip.o
  CC      io_uring/rsrc.o
  CC      kernel/rcu/sync.o
  CC      security/keys/permission.o
  CC      fs/proc/base.o
  CC      sound/core/control.o
  AR      drivers/video/backlight/built-in.a
  CC      arch/x86/kernel/cpu/mtrr/legacy.o
  CC      arch/x86/lib/msr.o
  CC      kernel/power/hibernate.o
  AR      fs/notify/built-in.a
  CC      fs/iomap/direct-io.o
  CC      fs/quota/quota_tree.o
  CC      drivers/pci/hotplug/acpi_pcihp.o
  CC      kernel/locking/rtmutex_api.o
  CC      fs/sysfs/dir.o
  AR      drivers/pci/pcie/built-in.a
  CC      arch/x86/kernel/cpu/scattered.o
  AR      sound/i2c/other/built-in.a
  CC      net/netlink/policy.o
  AR      sound/i2c/built-in.a
  CC      kernel/sched/build_policy.o
  CC      fs/kernfs/dir.o
  CC      fs/proc/generic.o
  AR      arch/x86/entry/built-in.a
  CC      fs/sysfs/symlink.o
  AS      arch/x86/lib/msr-reg.o
  CC      lib/crypto/mpi/mpicoder.o
  CC      kernel/irq/devres.o
  CC      kernel/irq/kexec.o
  CC      sound/core/seq/seq_timer.o
  AR      crypto/asymmetric_keys/built-in.a
  CC      fs/devpts/inode.o
  AR      drivers/pci/msi/built-in.a
  CC      drivers/video/nomodeset.o
  AR      arch/x86/kernel/cpu/mtrr/built-in.a
  CC      fs/netfs/buffered_read.o
  CC      fs/ext4/balloc.o
  CC      fs/jbd2/transaction.o
  AR      drivers/video/console/built-in.a
  CC      fs/ramfs/inode.o
  CC      fs/hugetlbfs/inode.o
  AR      arch/x86/kernel/cpu/microcode/built-in.a
  CC      fs/fat/cache.o
  CC      fs/isofs/namei.o
  CC      fs/nfs/client.o
  CC      arch/x86/mm/extable.o
  CC      fs/exportfs/expfs.o
  CC      crypto/cipher.o
  CC      fs/ext4/bitmap.o
  CC      fs/ramfs/file-mmu.o
  CC      arch/x86/pci/legacy.o
  CC      security/keys/process_keys.o
  CC      arch/x86/lib/msr-reg-export.o
  CC      drivers/video/hdmi.o
  CC      block/blk-core.o
  CC      security/device_cgroup.o
  CC      arch/x86/kernel/cpu/topology_common.o
  CC      kernel/irq/autoprobe.o
  AR      drivers/pci/hotplug/built-in.a
  CC      sound/core/seq/seq_system.o
  CC      drivers/pci/access.o
  CC      mm/folio-compat.o
  AS      arch/x86/lib/hweight.o
  CC      arch/x86/lib/iomem.o
  CC      fs/sysfs/mount.o
  CC      lib/crypto/mpi/mpi-add.o
  CC      arch/x86/kernel/apic/apic.o
  CC      kernel/irq/irqdomain.o
  CC      fs/netfs/buffered_write.o
  CC      fs/quota/quota.o
  CC      net/sched/sch_blackhole.o
  AR      fs/devpts/built-in.a
  CC      arch/x86/mm/mmap.o
  CC      kernel/locking/qrwlock.o
  AR      net/netlink/built-in.a
  CC      fs/nfs/dir.o
  CC      fs/isofs/inode.o
  CC      arch/x86/kernel/apic/apic_common.o
  CC      io_uring/notif.o
  CC      fs/iomap/fiemap.o
  CC      fs/iomap/seek.o
  CC      arch/x86/kernel/cpu/topology_ext.o
  AR      fs/exportfs/built-in.a
  CC      crypto/compress.o
  CC      arch/x86/pci/irq.o
  CC      fs/fat/dir.o
  CC      arch/x86/lib/atomic64_32.o
  CC      fs/quota/kqid.o
  CC      kernel/power/snapshot.o
  AR      fs/ramfs/built-in.a
  CC      fs/netfs/direct_read.o
  CC      fs/isofs/dir.o
  CC      arch/x86/lib/inat.o
  CC      security/selinux/nlmsgtab.o
  CC      kernel/rcu/srcutree.o
  CC      arch/x86/events/intel/ds.o
  CC      crypto/algapi.o
  CC      lib/lzo/lzo1x_compress.o
  CC      sound/core/seq/seq_ports.o
  CC      fs/kernfs/file.o
  AR      arch/x86/lib/built-in.a
  AR      arch/x86/lib/lib.a
  CC      arch/x86/kernel/kprobes/core.o
  AR      drivers/video/built-in.a
  CC      fs/iomap/swapfile.o
  CC      io_uring/tctx.o
  AR      kernel/locking/built-in.a
  CC      io_uring/filetable.o
  CC      net/core/stream.o
  CC      lib/crypto/mpi/mpi-bit.o
  CC      mm/readahead.o
  CC      security/keys/request_key.o
  CC      arch/x86/kernel/cpu/topology_amd.o
  CC      arch/x86/events/intel/knc.o
  CC      arch/x86/mm/pgtable.o
  CC      fs/sysfs/group.o
  CC      drivers/pci/bus.o
  CC      kernel/irq/proc.o
  CC      lib/lzo/lzo1x_decompress_safe.o
  CC      fs/proc/array.o
  CC      arch/x86/kernel/cpu/common.o
  CC      fs/jbd2/commit.o
  CC      fs/ext4/block_validity.o
  CC      lib/crypto/mpi/mpi-cmp.o
  CC      lib/lz4/lz4_decompress.o
  CC      fs/jbd2/recovery.o
  CC      security/keys/request_key_auth.o
  CC      drivers/pci/probe.o
  CC      arch/x86/events/zhaoxin/core.o
  AR      fs/hugetlbfs/built-in.a
  CC      arch/x86/events/core.o
  CC      net/sched/cls_api.o
  CC      fs/isofs/util.o
  CC      arch/x86/kernel/kprobes/opt.o
  CC      fs/netfs/direct_write.o
  CC      lib/crypto/mpi/mpi-sub-ui.o
  CC      fs/quota/netlink.o
  AR      fs/iomap/built-in.a
  CC      kernel/rcu/tree.o
  CC      fs/proc/fd.o
  CC      sound/core/seq/seq_info.o
  CC      crypto/scatterwalk.o
  CC      security/selinux/netif.o
  AR      lib/lzo/built-in.a
  CC      security/selinux/netnode.o
  CC      io_uring/rw.o
  CC      arch/x86/mm/physaddr.o
  CC      arch/x86/kernel/apic/apic_noop.o
  AR      fs/sysfs/built-in.a
  CC      lib/crypto/mpi/mpi-div.o
  CC      arch/x86/pci/common.o
  CC      lib/crypto/chacha.o
  CC      sound/core/misc.o
  CC      fs/kernfs/symlink.o
  AR      net/bpf/built-in.a
  CC      kernel/irq/migration.o
  CC      arch/x86/kernel/cpu/rdrand.o
  CC      arch/x86/events/intel/lbr.o
  CC      drivers/pci/host-bridge.o
  CC      lib/crypto/aes.o
  CC      sound/core/device.o
  CC      security/selinux/netport.o
  CC      fs/lockd/clntlock.o
  CC      lib/zstd/zstd_decompress_module.o
  CC      security/keys/user_defined.o
  CC      mm/swap.o
  CC      security/keys/proc.o
  CC      block/blk-sysfs.o
  CC      block/blk-flush.o
  CC      fs/fat/fatent.o
  CC      fs/isofs/rock.o
  CC      fs/ext4/dir.o
  CC      arch/x86/kernel/apic/ipi.o
  CC      fs/ext4/ext4_jbd2.o
  CC      sound/core/seq/seq_dummy.o
  CC      fs/nls/nls_base.o
  AR      fs/unicode/built-in.a
  CC      crypto/proc.o
  CC      kernel/sched/build_utility.o
  CC      arch/x86/mm/tlb.o
  AR      arch/x86/events/zhaoxin/built-in.a
  CC      fs/fat/file.o
  CC      kernel/power/swap.o
  CC      kernel/irq/cpuhotplug.o
  AR      arch/x86/kernel/kprobes/built-in.a
  CC      fs/lockd/clntproc.o
  CC      lib/zstd/decompress/huf_decompress.o
  CC      crypto/aead.o
  CC      lib/crypto/mpi/mpi-mod.o
  AR      fs/quota/built-in.a
  CC      net/sched/act_api.o
  CC      fs/netfs/iterator.o
  CC      fs/proc/proc_tty.o
  CC      block/blk-settings.o
  CC      fs/jbd2/checkpoint.o
  CC      net/core/scm.o
  CC      mm/truncate.o
  CC      mm/vmscan.o
  AR      fs/kernfs/built-in.a
  LDS     arch/x86/kernel/vmlinux.lds
  CC      lib/crypto/mpi/mpi-mul.o
  CC      security/selinux/status.o
  CC      fs/nls/nls_cp437.o
  AR      lib/lz4/built-in.a
  CC      arch/x86/pci/early.o
  CC      fs/proc/cmdline.o
  CC      security/keys/sysctl.o
  CC      arch/x86/kernel/cpu/match.o
  CC      lib/zstd/decompress/zstd_ddict.o
  CC      arch/x86/kernel/apic/vector.o
  AR      sound/core/seq/built-in.a
  CC      sound/core/info.o
  CC      crypto/geniv.o
  CC      lib/xz/xz_dec_syms.o
  CC      lib/crypto/mpi/mpih-cmp.o
  CC      arch/x86/mm/cpu_entry_area.o
  CC      fs/fat/inode.o
  AR      drivers/idle/built-in.a
  CC      fs/isofs/export.o
  CC      fs/nls/nls_ascii.o
  CC      fs/autofs/init.o
  CC      net/sched/sch_fifo.o
  CC      kernel/irq/pm.o
  CC      drivers/pci/remove.o
  CC      fs/isofs/joliet.o
  CC      arch/x86/kernel/apic/init.o
  CC      arch/x86/kernel/cpu/bugs.o
  CC      lib/xz/xz_dec_stream.o
  CC      lib/crypto/mpi/mpih-div.o
  CC      io_uring/net.o
  CC      io_uring/poll.o
  CC      mm/shrinker.o
  CC      fs/proc/consoles.o
  CC      arch/x86/events/intel/p4.o
  CC      fs/nls/nls_iso8859-1.o
  CC      arch/x86/events/probe.o
  CC      security/keys/keyctl_pkey.o
  CC      fs/autofs/inode.o
  CC      arch/x86/pci/bus_numa.o
  CC      lib/zstd/decompress/zstd_decompress.o
  CC      fs/nfs/file.o
  AR      drivers/char/ipmi/built-in.a
  CC      fs/netfs/locking.o
  AS      arch/x86/kernel/head_32.o
  CC      kernel/rcu/rcu_segcblist.o
  CC      block/blk-ioc.o
  CC      fs/netfs/main.o
  CC      security/selinux/ss/ebitmap.o
  CC      fs/jbd2/revoke.o
  CC      arch/x86/kernel/apic/hw_nmi.o
  CC      arch/x86/mm/maccess.o
  AR      kernel/livepatch/built-in.a
  CC      net/sched/cls_cgroup.o
  CC      net/ethtool/ioctl.o
  CC      fs/ext4/extents.o
  CC      fs/proc/cpuinfo.o
  CC      kernel/power/user.o
  CC      kernel/irq/msi.o
  CC      fs/nls/nls_utf8.o
  CC      net/core/gen_stats.o
  CC      fs/jbd2/journal.o
  CC      mm/shmem.o
  CC      sound/core/isadma.o
  CC      lib/xz/xz_dec_lzma2.o
  CC      arch/x86/kernel/cpu/aperfmperf.o
  CC      kernel/dma/mapping.o
  CC      fs/lockd/clntxdr.o
  CC      crypto/lskcipher.o
  CC      drivers/pci/pci.o
  CC      fs/isofs/compress.o
  CC      drivers/pci/pci-driver.o
  CC      arch/x86/mm/pgprot.o
  CC      kernel/entry/common.o
  CC      lib/crypto/arc4.o
  AR      security/keys/built-in.a
  CC      arch/x86/kernel/apic/io_apic.o
  CC      arch/x86/kernel/cpu/cpuid-deps.o
  CC      arch/x86/pci/amd_bus.o
  AR      fs/nls/built-in.a
  CC      block/blk-map.o
  CC      lib/crypto/mpi/mpih-mul.o
  CC      block/blk-merge.o
  CC      lib/xz/xz_dec_bcj.o
  CC      arch/x86/mm/pgtable_32.o
  CC      fs/autofs/root.o
  CC      sound/core/vmaster.o
  CC      fs/proc/devices.o
  CC      net/core/gen_estimator.o
  CC      net/netfilter/core.o
  CC      mm/util.o
  CC      lib/zstd/decompress/zstd_decompress_block.o
  CC      arch/x86/events/intel/p6.o
  CC      drivers/acpi/acpica/dsargs.o
  CC      drivers/pnp/pnpacpi/core.o
  AR      drivers/amba/built-in.a
  CC      net/ipv4/netfilter/nf_defrag_ipv4.o
  CC      net/xfrm/xfrm_policy.o
  CC      fs/fat/misc.o
  CC      kernel/power/poweroff.o
  CC      net/netfilter/nf_log.o
  CC      net/unix/af_unix.o
  CC      net/ipv6/netfilter/ip6_tables.o
  CC      block/blk-timeout.o
  AR      fs/isofs/built-in.a
  AR      lib/xz/built-in.a
  CC      net/xfrm/xfrm_state.o
  CC      net/xfrm/xfrm_hash.o
  AR      kernel/power/built-in.a
  CC      drivers/pnp/core.o
  CC      drivers/acpi/acpica/dscontrol.o
  CC      security/selinux/ss/hashtab.o
  CC      fs/nfs/getroot.o
  CC      arch/x86/kernel/cpu/umwait.o
  CC      crypto/skcipher.o
  AR      arch/x86/pci/built-in.a
  CC      net/sched/ematch.o
  CC      sound/core/ctljack.o
  MKCAP   arch/x86/kernel/cpu/capflags.c
  CC      arch/x86/kernel/cpu/powerflags.o
  CC      kernel/irq/affinity.o
  CC      arch/x86/mm/iomap_32.o
  CC      fs/proc/interrupts.o
  CC      kernel/entry/syscall_user_dispatch.o
  CC      fs/lockd/host.o
  CC      net/ipv6/netfilter/ip6table_filter.o
  CC      lib/crypto/mpi/mpi-pow.o
  CC      drivers/pnp/pnpacpi/rsparser.o
  AR      drivers/acpi/pmic/built-in.a
  CC      net/ipv6/af_inet6.o
  CC      arch/x86/events/intel/pt.o
  CC      drivers/acpi/acpica/dsdebug.o
  CC      io_uring/eventfd.o
  CC      fs/netfs/misc.o
  CC      fs/autofs/symlink.o
  CC      fs/proc/loadavg.o
  CC      security/selinux/ss/symtab.o
  CC      kernel/dma/direct.o
  CC      sound/core/jack.o
  CC      fs/fat/nfs.o
  CC      net/unix/garbage.o
  CC      net/core/net_namespace.o
  CC      mm/mmzone.o
  CC      kernel/irq/matrix.o
  CC      net/core/secure_seq.o
  CC      fs/netfs/objects.o
  CC      security/selinux/ss/sidtab.o
  CC      lib/crypto/gf128mul.o
  AR      kernel/rcu/built-in.a
  CC      fs/autofs/waitq.o
  CC      drivers/acpi/acpica/dsfield.o
  CC      arch/x86/mm/hugetlbpage.o
  CC      lib/crypto/blake2s.o
  CC      net/unix/sysctl_net_unix.o
  AR      kernel/entry/built-in.a
  CC      arch/x86/events/intel/uncore.o
  CC      net/ipv4/netfilter/nf_reject_ipv4.o
  CC      block/blk-lib.o
  CC      block/blk-mq.o
  CC      lib/crypto/mpi/mpiutil.o
  CC      fs/proc/meminfo.o
  CC      arch/x86/kernel/apic/msi.o
  CC      net/netfilter/nf_queue.o
  AR      kernel/sched/built-in.a
  AR      sound/drivers/opl3/built-in.a
  AR      sound/drivers/opl4/built-in.a
  CC      io_uring/uring_cmd.o
  CC      lib/crypto/blake2s-generic.o
  AR      sound/drivers/mpu401/built-in.a
  AR      sound/drivers/vx/built-in.a
  AR      sound/drivers/pcsp/built-in.a
  AR      sound/drivers/built-in.a
  CC      net/xfrm/xfrm_input.o
  CC      fs/nfs/inode.o
  CC      net/ipv6/netfilter/ip6table_mangle.o
  CC      drivers/acpi/dptf/int340x_thermal.o
  CC      crypto/seqiv.o
  CC      drivers/acpi/acpica/dsinit.o
  AR      drivers/pnp/pnpacpi/built-in.a
  CC      sound/core/hwdep.o
  CC      drivers/pnp/card.o
  AR      net/sched/built-in.a
  CC      sound/core/timer.o
  AR      drivers/clk/actions/built-in.a
  AR      drivers/clk/analogbits/built-in.a
  CC      arch/x86/events/intel/uncore_nhmex.o
  AR      drivers/clk/bcm/built-in.a
  AR      drivers/clk/imgtec/built-in.a
  AR      drivers/clk/imx/built-in.a
  AR      drivers/clk/ingenic/built-in.a
  AR      drivers/clk/mediatek/built-in.a
  AR      drivers/clk/microchip/built-in.a
  AR      drivers/clk/mstar/built-in.a
  CC      fs/fat/namei_vfat.o
  AR      drivers/clk/mvebu/built-in.a
  CC      fs/9p/vfs_super.o
  AR      drivers/clk/ralink/built-in.a
  AR      drivers/clk/renesas/built-in.a
  CC      drivers/pci/search.o
  CC      kernel/dma/ops_helpers.o
  CC      arch/x86/mm/dump_pagetables.o
  AR      drivers/clk/socfpga/built-in.a
  AR      drivers/clk/sophgo/built-in.a
  AR      drivers/clk/sprd/built-in.a
  AR      drivers/clk/starfive/built-in.a
  CC      sound/core/hrtimer.o
  AR      drivers/clk/sunxi-ng/built-in.a
  AR      drivers/clk/ti/built-in.a
  CC      fs/lockd/svc.o
  AR      drivers/clk/versatile/built-in.a
  AR      drivers/clk/xilinx/built-in.a
  AR      drivers/clk/built-in.a
  CC      mm/vmstat.o
  CC      net/ethtool/common.o
  AR      lib/crypto/mpi/built-in.a
  AR      fs/jbd2/built-in.a
  AR      fs/hostfs/built-in.a
  CC      drivers/acpi/acpica/dsmethod.o
  CC      fs/autofs/expire.o
  CC      lib/crypto/sha1.o
  CC      crypto/echainiv.o
  CC      lib/dim/dim.o
  CC      lib/dim/net_dim.o
  CC      fs/netfs/read_collect.o
  AR      drivers/acpi/dptf/built-in.a
  CC      lib/dim/rdma_dim.o
  CC      fs/netfs/read_pgpriv2.o
  CC      fs/nfs/super.o
  CC      net/ethtool/netlink.o
  CC      fs/proc/stat.o
  CC      net/ipv4/route.o
  CC      arch/x86/kernel/apic/probe_32.o
  CC      lib/zstd/zstd_common_module.o
  CC      lib/zstd/common/debug.o
  CC      fs/ext4/extents_status.o
  AR      kernel/irq/built-in.a
  CC      net/ethtool/bitset.o
  CC      net/ethtool/strset.o
  CC      security/selinux/ss/avtab.o
  CC      fs/ext4/file.o
  CC      fs/ext4/fsmap.o
  CC      drivers/acpi/x86/apple.o
  CC      drivers/acpi/x86/cmos_rtc.o
  CC      drivers/pnp/driver.o
  CC      net/ethtool/linkinfo.o
  CC      lib/crypto/sha256.o
  CC      kernel/dma/remap.o
  CC      drivers/acpi/acpica/dsmthdat.o
  CC      fs/proc/uptime.o
  CC      net/core/flow_dissector.o
  CC      fs/9p/vfs_inode.o
  CC      drivers/pci/rom.o
  AR      net/unix/built-in.a
  CC      fs/fat/namei_msdos.o
  CC      lib/zstd/common/entropy_common.o
  CC      arch/x86/mm/highmem_32.o
  CC      net/ipv4/netfilter/ip_tables.o
  CC      crypto/ahash.o
  AR      arch/x86/kernel/apic/built-in.a
  CC      net/netfilter/nf_sockopt.o
  CC      io_uring/openclose.o
  CC      drivers/pnp/resource.o
  CC      arch/x86/kernel/cpu/topology.o
  CC      lib/zstd/common/error_private.o
  CC      lib/zstd/common/fse_decompress.o
  CC      fs/autofs/dev-ioctl.o
  CC      net/ipv6/netfilter/nf_defrag_ipv6_hooks.o
  CC      drivers/acpi/acpica/dsobject.o
  CC      drivers/acpi/acpica/dsopcode.o
  AR      sound/isa/ad1816a/built-in.a
  AR      sound/isa/ad1848/built-in.a
  AR      sound/isa/cs423x/built-in.a
  AR      sound/isa/es1688/built-in.a
  CC      arch/x86/events/intel/uncore_snb.o
  AR      sound/isa/galaxy/built-in.a
  CC      arch/x86/events/utils.o
  CC      net/ipv4/netfilter/iptable_filter.o
  AR      sound/isa/gus/built-in.a
  AR      lib/dim/built-in.a
  AR      sound/isa/msnd/built-in.a
  CC      fs/debugfs/inode.o
  AR      sound/isa/opti9xx/built-in.a
  CC      drivers/acpi/x86/lpss.o
  AR      sound/isa/sb/built-in.a
  AR      lib/crypto/built-in.a
  AR      sound/isa/wavefront/built-in.a
  CC      arch/x86/events/intel/uncore_snbep.o
  AR      sound/isa/wss/built-in.a
  AR      sound/isa/built-in.a
  AR      kernel/dma/built-in.a
  CC      fs/proc/util.o
  CC      lib/zstd/common/zstd_common.o
  CC      kernel/module/main.o
  CC      net/packet/af_packet.o
  CC      fs/lockd/svclock.o
  CC      fs/lockd/svcshare.o
  CC      drivers/acpi/x86/s2idle.o
  CC      sound/core/pcm.o
  CC      arch/x86/events/intel/uncore_discovery.o
  CC      drivers/pci/setup-res.o
  CC      fs/debugfs/file.o
  AR      arch/x86/mm/built-in.a
  AR      net/dsa/built-in.a
  CC      fs/netfs/read_retry.o
  CC      fs/netfs/read_single.o
  CC      fs/netfs/rolling_buffer.o
  CC      drivers/acpi/acpica/dspkginit.o
  CC      fs/lockd/svcproc.o
  CC      mm/backing-dev.o
  AR      lib/zstd/built-in.a
  CC      lib/fonts/fonts.o
  CC      net/ipv6/netfilter/nf_conntrack_reasm.o
  CC      fs/ext4/fsync.o
  CC      arch/x86/kernel/head32.o
  CC      fs/lockd/svcsubs.o
  CC      security/selinux/ss/policydb.o
  CC      arch/x86/kernel/cpu/proc.o
  CC      net/xfrm/xfrm_output.o
  AR      fs/fat/built-in.a
  CC      fs/netfs/write_collect.o
  CC      io_uring/sqpoll.o
  CC      net/ethtool/linkmodes.o
  CC      net/netfilter/utils.o
  CC      fs/proc/version.o
  CC      io_uring/xattr.o
  CC      fs/9p/vfs_inode_dotl.o
  CC      crypto/shash.o
  AR      fs/autofs/built-in.a
  CC      crypto/akcipher.o
  CC      fs/tracefs/inode.o
  CC [M]  fs/efivarfs/inode.o
  CC      lib/fonts/font_8x16.o
  CC      drivers/pnp/manager.o
  CC      drivers/acpi/acpica/dsutils.o
  CC [M]  fs/efivarfs/file.o
  CC      drivers/pci/irq.o
  CC      sound/core/pcm_native.o
  CC      net/ipv4/inetpeer.o
  CC      io_uring/nop.o
  CC      net/ethtool/rss.o
  CC      crypto/sig.o
  CC      drivers/acpi/tables.o
  AR      lib/fonts/built-in.a
  CC      drivers/acpi/x86/utils.o
  CC      lib/argv_split.o
  CC      net/ipv4/netfilter/iptable_mangle.o
  CC      fs/proc/softirqs.o
  CC      net/ipv4/protocol.o
  CC      net/xfrm/xfrm_sysctl.o
  CC      drivers/acpi/acpica/dswexec.o
  CC      fs/nfs/io.o
  CC      drivers/acpi/osi.o
  CC      kernel/module/strict_rwx.o
  CC      arch/x86/events/rapl.o
  CC      lib/bug.o
  CC      lib/buildid.o
  CC      net/core/sysctl_net_core.o
  AR      fs/debugfs/built-in.a
  CC      drivers/dma/dw/core.o
  CC      drivers/pnp/support.o
  CC      mm/mm_init.o
  CC      drivers/dma/dw/dw.o
  CC      kernel/module/kmod.o
  CC      mm/percpu.o
  CC      net/sunrpc/auth_gss/auth_gss.o
  CC      fs/proc/namespaces.o
  CC      fs/lockd/mon.o
  CC      fs/netfs/write_issue.o
  CC [M]  fs/efivarfs/super.o
  CC      net/xfrm/xfrm_replay.o
  CC      fs/9p/vfs_addr.o
  CC      drivers/pci/vpd.o
  CC      net/ipv6/anycast.o
  CC      fs/ext4/hash.o
  CC      drivers/acpi/acpica/dswload.o
  CC      fs/tracefs/event_inode.o
  CC      drivers/dma/hsu/hsu.o
  CC      lib/clz_tab.o
  CC      block/blk-mq-tag.o
  CC      block/blk-stat.o
  CC      net/sunrpc/auth_gss/gss_mech_switch.o
  CC      net/sunrpc/auth_gss/svcauth_gss.o
  CC      net/ipv6/netfilter/nf_reject_ipv6.o
  CC      net/ipv4/netfilter/ipt_REJECT.o
  CC      drivers/acpi/x86/blacklist.o
  CC      net/netfilter/nfnetlink.o
  CC      crypto/kpp.o
  CC      net/ipv4/ip_input.o
  CC      drivers/pnp/interface.o
  CC      fs/open.o
  CC      security/selinux/ss/services.o
  CC      arch/x86/kernel/cpu/feat_ctl.o
  CC      lib/cmdline.o
  CC      drivers/acpi/acpica/dswload2.o
  CC      net/ethtool/linkstate.o
  CC      fs/lockd/trace.o
  CC      drivers/dma/dw/idma32.o
  CC      io_uring/fs.o
  CC      io_uring/splice.o
  CC      lib/cpumask.o
  CC      io_uring/sync.o
  CC      arch/x86/events/intel/cstate.o
  CC      kernel/time/time.o
  CC      drivers/acpi/osl.o
  CC      security/selinux/ss/conditional.o
  CC      fs/ext4/ialloc.o
  CC      kernel/module/tree_lookup.o
  CC      fs/nfs/direct.o
  AR      drivers/acpi/x86/built-in.a
  CC      fs/ext4/indirect.o
  CC      fs/proc/self.o
  CC      fs/9p/vfs_file.o
  CC      arch/x86/kernel/cpu/intel.o
  CC      net/ipv6/ip6_output.o
  CC [M]  fs/efivarfs/vars.o
  CC      drivers/acpi/acpica/dswscope.o
  CC      drivers/pci/setup-bus.o
  CC      fs/netfs/write_retry.o
  AR      drivers/dma/hsu/built-in.a
  CC      net/core/dev.o
  CC      security/selinux/ss/mls.o
  CC      drivers/pnp/quirks.o
  AR      fs/tracefs/built-in.a
  CC      drivers/pnp/system.o
  CC      security/selinux/ss/context.o
  ASN.1   crypto/rsapubkey.asn1.[ch]
  ASN.1   crypto/rsaprivkey.asn1.[ch]
  CC      crypto/rsa.o
  CC      net/ethtool/debug.o
  CC      kernel/futex/core.o
  CC      drivers/dma/dw/acpi.o
  CC      block/blk-mq-sysfs.o
  CC      lib/ctype.o
  CC      net/ipv6/netfilter/ip6t_ipv6header.o
  CC      lib/dec_and_lock.o
  CC [M]  net/ipv4/netfilter/iptable_nat.o
  CC      drivers/acpi/acpica/dswstate.o
  CC      net/xfrm/xfrm_device.o
  CC      fs/proc/thread_self.o
  CC      kernel/module/kallsyms.o
  CC      net/xfrm/xfrm_nat_keepalive.o
  CC      kernel/module/procfs.o
  CC      fs/proc/proc_sysctl.o
  CC      net/sunrpc/clnt.o
  CC      io_uring/msg_ring.o
  CC      lib/decompress.o
  AR      arch/x86/events/intel/built-in.a
  CC      net/netfilter/nfnetlink_log.o
  CC      io_uring/advise.o
  CC      arch/x86/events/msr.o
  CC      lib/decompress_bunzip2.o
  CC      net/ipv6/netfilter/ip6t_REJECT.o
  CC      arch/x86/kernel/cpu/tsx.o
  CC      arch/x86/kernel/cpu/intel_epb.o
  CC      fs/9p/vfs_dir.o
  CC      arch/x86/kernel/cpu/amd.o
  CC      kernel/time/timer.o
  CC      fs/lockd/xdr.o
  LD [M]  fs/efivarfs/efivarfs.o
  CC      security/selinux/netlabel.o
  CC      sound/core/pcm_lib.o
  CC      drivers/acpi/acpica/evevent.o
  CC      crypto/rsa_helper.o
  AR      net/packet/built-in.a
  AR      drivers/pnp/built-in.a
  CC      drivers/pci/vc.o
  AR      net/wireless/tests/built-in.a
  AR      sound/pci/ac97/built-in.a
  AR      fs/netfs/built-in.a
  CC      net/wireless/core.o
  AR      sound/pci/ali5451/built-in.a
  AR      sound/pci/asihpi/built-in.a
  AR      drivers/soc/apple/built-in.a
  AR      drivers/dma/dw/built-in.a
  AR      sound/pci/au88x0/built-in.a
  AR      drivers/soc/aspeed/built-in.a
  AR      drivers/dma/idxd/built-in.a
  CC      sound/core/pcm_misc.o
  AR      sound/pci/aw2/built-in.a
  AR      drivers/soc/bcm/built-in.a
  AR      drivers/dma/amd/built-in.a
  AR      drivers/soc/fsl/built-in.a
  AR      sound/pci/ctxfi/built-in.a
  AR      sound/pci/ca0106/built-in.a
  AR      drivers/dma/mediatek/built-in.a
  AR      drivers/soc/fujitsu/built-in.a
  CC      net/netfilter/nf_conntrack_core.o
  CC      net/xfrm/xfrm_algo.o
  CC      net/xfrm/xfrm_user.o
  AR      sound/pci/cs46xx/built-in.a
  AR      drivers/soc/hisilicon/built-in.a
  AR      drivers/dma/qcom/built-in.a
  AR      sound/pci/cs5535audio/built-in.a
  AR      drivers/soc/imx/built-in.a
  AR      drivers/dma/stm32/built-in.a
  AR      sound/pci/lola/built-in.a
  AR      drivers/soc/ixp4xx/built-in.a
  AR      drivers/dma/ti/built-in.a
  AR      drivers/dma/xilinx/built-in.a
  AR      drivers/soc/loongson/built-in.a
  AR      sound/pci/lx6464es/built-in.a
  CC      block/blk-mq-cpumap.o
  CC      drivers/dma/dmaengine.o
  CC      drivers/dma/virt-dma.o
  AR      drivers/soc/mediatek/built-in.a
  AR      sound/pci/echoaudio/built-in.a
  CC      net/sunrpc/xprt.o
  AR      drivers/soc/microchip/built-in.a
  AR      sound/pci/emu10k1/built-in.a
  AR      drivers/soc/nuvoton/built-in.a
  CC      sound/pci/hda/hda_bind.o
  AR      sound/pci/ice1712/built-in.a
  CC      kernel/futex/syscalls.o
  AR      drivers/soc/pxa/built-in.a
  CC      fs/ext4/inline.o
  AR      sound/pci/mixart/built-in.a
  AR      sound/pci/korg1212/built-in.a
  AR      drivers/soc/amlogic/built-in.a
  CC      net/core/dev_addr_lists.o
  CC      block/blk-mq-sched.o
  AR      drivers/soc/qcom/built-in.a
  CC      kernel/module/sysfs.o
  AR      drivers/soc/renesas/built-in.a
  AR      drivers/soc/rockchip/built-in.a
  CC      net/ethtool/wol.o
  AR      drivers/soc/sunxi/built-in.a
  AR      drivers/soc/ti/built-in.a
  CC      crypto/rsa-pkcs1pad.o
  CC      drivers/acpi/acpica/evgpe.o
  AR      drivers/soc/versatile/built-in.a
  AR      drivers/soc/xilinx/built-in.a
  CC      net/sunrpc/auth_gss/gss_rpc_upcall.o
  AR      drivers/soc/built-in.a
  CC      drivers/virtio/virtio.o
  CC      lib/decompress_inflate.o
  CC      mm/slab_common.o
  AR      sound/ppc/built-in.a
  CC      drivers/virtio/virtio_ring.o
  CC      drivers/dma/acpi-dma.o
  AR      arch/x86/events/built-in.a
  CC      arch/x86/kernel/ebda.o
  CC      io_uring/epoll.o
  CC      fs/9p/vfs_dentry.o
  CC      sound/core/pcm_memory.o
  AR      net/ipv4/netfilter/built-in.a
  CC      net/ipv4/ip_fragment.o
  CC      net/sunrpc/socklib.o
  CC      net/ethtool/features.o
  CC      sound/pci/hda/hda_codec.o
  CC      arch/x86/kernel/cpu/hygon.o
  CC      fs/read_write.o
  CC      drivers/pci/mmap.o
  CC      kernel/futex/pi.o
  CC      drivers/acpi/acpica/evgpeblk.o
  CC      lib/decompress_unlz4.o
  CC      fs/nfs/pagelist.o
  CC      fs/nfs/read.o
  AR      net/ipv6/netfilter/built-in.a
  CC      fs/ext4/inode.o
  CC      arch/x86/kernel/cpu/centaur.o
  CC      fs/file_table.o
  AR      sound/arm/built-in.a
  CC      drivers/acpi/utils.o
  CC      fs/lockd/clnt4xdr.o
  CC      crypto/rsassa-pkcs1.o
  AR      kernel/module/built-in.a
  CC      drivers/tty/vt/vt_ioctl.o
  CC      fs/9p/v9fs.o
  CC      net/ipv4/ip_forward.o
  AR      net/mac80211/tests/built-in.a
  CC      kernel/futex/requeue.o
  CC      net/mac80211/main.o
  CC      net/netlabel/netlabel_user.o
  CC      fs/proc/proc_net.o
  AR      security/selinux/built-in.a
  AR      security/built-in.a
  CC      net/core/dst.o
  CC      net/netfilter/nf_conntrack_standalone.o
  CC      drivers/acpi/reboot.o
  CC      net/wireless/sysfs.o
  CC      drivers/acpi/acpica/evgpeinit.o
  CC      block/ioctl.o
  CC      net/netfilter/nf_conntrack_expect.o
  CC      io_uring/statx.o
  CC      net/ipv4/ip_options.o
  CC      net/sunrpc/auth_gss/gss_rpc_xdr.o
  CC      arch/x86/kernel/cpu/transmeta.o
  AR      drivers/dma/built-in.a
  CC      lib/decompress_unlzma.o
  CC      net/sunrpc/xprtsock.o
  CC      drivers/pci/devres.o
  AR      sound/pci/nm256/built-in.a
  CC      fs/super.o
  CC      drivers/acpi/acpica/evgpeutil.o
  CC      sound/core/memalloc.o
  CC      arch/x86/kernel/platform-quirks.o
  CC      net/ipv6/ip6_input.o
  CC      kernel/time/hrtimer.o
  CC      kernel/cgroup/cgroup.o
  CC      net/ethtool/privflags.o
  CC      net/rfkill/core.o
  CC      fs/proc/kcore.o
  CC      crypto/acompress.o
  CC      fs/9p/fid.o
  CC      net/rfkill/input.o
  CC      fs/9p/xattr.o
  CC      kernel/futex/waitwake.o
  CC      sound/pci/hda/hda_jack.o
  CC      drivers/acpi/acpica/evglock.o
  CC      drivers/virtio/virtio_anchor.o
  CC      arch/x86/kernel/cpu/zhaoxin.o
  CC      fs/char_dev.o
  AR      sound/pci/oxygen/built-in.a
  CC      drivers/virtio/virtio_pci_modern_dev.o
  CC      io_uring/timeout.o
  CC      drivers/tty/vt/vc_screen.o
  CC      fs/lockd/xdr4.o
  CC      net/netlabel/netlabel_kapi.o
  CC      block/genhd.o
  CC      drivers/pci/proc.o
  CC      lib/decompress_unlzo.o
  CC      drivers/virtio/virtio_pci_legacy_dev.o
  CC      fs/lockd/svc4proc.o
  CC      drivers/acpi/acpica/evhandler.o
  CC      io_uring/fdinfo.o
  CC      sound/core/pcm_timer.o
  CC      arch/x86/kernel/cpu/vortex.o
  AR      sound/sh/built-in.a
  CC      drivers/acpi/nvs.o
  CC      net/sunrpc/auth_gss/trace.o
  CC      crypto/scompress.o
  CC      arch/x86/kernel/cpu/perfctr-watchdog.o
  CC      mm/compaction.o
  CC      fs/stat.o
  CC      drivers/acpi/wakeup.o
  CC      drivers/acpi/sleep.o
  CC      net/netlabel/netlabel_domainhash.o
  CC      fs/proc/vmcore.o
  AR      fs/9p/built-in.a
  CC      fs/nfs/symlink.o
  AR      kernel/futex/built-in.a
  CC      sound/pci/hda/hda_auto_parser.o
  CC      drivers/pci/pci-sysfs.o
  CC      net/ipv4/ip_output.o
  CC      net/9p/mod.o
  AR      net/rfkill/built-in.a
  CC      fs/lockd/procfs.o
  AR      net/xfrm/built-in.a
  CC      net/netfilter/nf_conntrack_helper.o
  CC      net/netfilter/nf_conntrack_proto.o
  CC      net/ethtool/rings.o
  CC      sound/core/seq_device.o
  CC      net/netfilter/nf_conntrack_proto_generic.o
  CC      drivers/acpi/acpica/evmisc.o
  CC      drivers/virtio/virtio_pci_modern.o
  CC      kernel/time/sleep_timeout.o
  CC      lib/decompress_unxz.o
  CC      drivers/tty/hvc/hvc_console.o
  CC      kernel/cgroup/rstat.o
  CC      drivers/tty/serial/serial_core.o
  CC      drivers/tty/serial/8250/8250_core.o
  CC      io_uring/cancel.o
  CC      crypto/algboss.o
  CC      drivers/tty/vt/selection.o
  CC      net/sunrpc/sched.o
  CC      drivers/tty/vt/keyboard.o
  CC      drivers/tty/serial/serial_base_bus.o
  CC      mm/show_mem.o
  CC      drivers/acpi/acpica/evregion.o
  CC      net/ethtool/channels.o
  CC      drivers/tty/serial/serial_ctrl.o
  CC      arch/x86/kernel/cpu/vmware.o
  CC      net/9p/client.o
  CC      net/wireless/radiotap.o
  CC      net/ipv6/addrconf.o
  CC      crypto/testmgr.o
  AR      sound/core/built-in.a
  CC      kernel/time/timekeeping.o
  CC      fs/exec.o
  CC      drivers/tty/serial/8250/8250_platform.o
  CC      drivers/tty/serial/8250/8250_pnp.o
  CC      lib/decompress_unzstd.o
  CC      fs/nfs/unlink.o
  CC      block/ioprio.o
  CC      net/mac80211/status.o
  AR      fs/lockd/built-in.a
  CC      fs/proc/kmsg.o
  CC      fs/ext4/ioctl.o
  CC      drivers/acpi/acpica/evrgnini.o
  CC      drivers/virtio/virtio_pci_common.o
  CC      drivers/virtio/virtio_pci_legacy.o
  CC      drivers/acpi/device_sysfs.o
  AR      drivers/tty/hvc/built-in.a
  CC      arch/x86/kernel/cpu/hypervisor.o
  AR      drivers/tty/ipwireless/built-in.a
  CC      fs/proc/page.o
  CC      net/core/netevent.o
  CC      net/dns_resolver/dns_key.o
  CC      net/ipv6/addrlabel.o
  CC      net/wireless/util.o
  CC      sound/pci/hda/hda_sysfs.o
  CC      drivers/tty/serial/8250/8250_rsa.o
  CC      net/netlabel/netlabel_addrlist.o
  CC      net/netfilter/nf_conntrack_proto_tcp.o
  CC      drivers/acpi/device_pm.o
  CC      net/ipv4/ip_sockglue.o
  CC      io_uring/waitid.o
  CC      net/dns_resolver/dns_query.o
  CC      drivers/pci/slot.o
  CC      lib/dump_stack.o
  CC      crypto/cmac.o
  CC      lib/earlycpio.o
  CC      net/9p/error.o
  CC      arch/x86/kernel/cpu/mshyperv.o
  CC      drivers/virtio/virtio_pci_admin_legacy_io.o
  CC      drivers/acpi/acpica/evsci.o
  CC      drivers/char/hw_random/core.o
  CC      drivers/char/agp/backend.o
  CC      drivers/acpi/acpica/evxface.o
  CC      drivers/acpi/acpica/evxfevnt.o
  CC      drivers/acpi/acpica/evxfgpe.o
  CC      crypto/hmac.o
  CC      block/badblocks.o
  CC      net/ethtool/coalesce.o
  CC      drivers/tty/tty_io.o
  CC      fs/nfs/write.o
  CC      net/ipv6/route.o
  CC      drivers/tty/vt/vt.o
  CC      kernel/cgroup/namespace.o
  CC      drivers/pci/pci-acpi.o
  CC      drivers/tty/serial/serial_port.o
  AR      sound/pci/pcxhr/built-in.a
  CC      net/handshake/alert.o
  CC      drivers/tty/serial/8250/8250_port.o
  CC      sound/pci/hda/hda_controller.o
  AR      fs/proc/built-in.a
  CC      sound/pci/hda/hda_proc.o
  CC      mm/interval_tree.o
  CC      net/ipv4/inet_hashtables.o
  CC      lib/extable.o
  CC      drivers/char/hw_random/intel-rng.o
  CC      kernel/time/ntp.o
  CC      drivers/acpi/acpica/evxfregn.o
  CC      net/sunrpc/auth_gss/gss_krb5_mech.o
  AR      net/dns_resolver/built-in.a
  CC      drivers/virtio/virtio_input.o
  CC      drivers/acpi/acpica/exconcat.o
  CC      net/handshake/genl.o
  CC      io_uring/register.o
  CC      drivers/char/agp/generic.o
  CC      net/netfilter/nf_conntrack_proto_udp.o
  CC      sound/pci/hda/hda_hwdep.o
  CC      fs/pipe.o
  CC      crypto/crypto_null.o
  CC      net/netlabel/netlabel_mgmt.o
  CC      net/devres.o
  CC      net/9p/protocol.o
  CC      net/socket.o
  CC      arch/x86/kernel/cpu/debugfs.o
  CC      net/sysctl_net.o
  CC      lib/flex_proportions.o
  CC      net/mac80211/driver-ops.o
  CC      net/9p/trans_common.o
  CC      drivers/acpi/acpica/exconfig.o
  CC      io_uring/truncate.o
  CC      drivers/char/mem.o
  CC      mm/list_lru.o
  CC      drivers/char/hw_random/amd-rng.o
  CC      net/ethtool/pause.o
  CC      block/blk-rq-qos.o
  CC      block/disk-events.o
  CC      net/netfilter/nf_conntrack_proto_icmp.o
  CC      drivers/virtio/virtio_dma_buf.o
  CC      fs/ext4/mballoc.o
  CC      kernel/time/clocksource.o
  CC      fs/namei.o
  CC      lib/idr.o
  CC      lib/iomem_copy.o
  CC      crypto/md5.o
  CC      drivers/acpi/acpica/exconvrt.o
  CC      kernel/trace/trace_clock.o
  CC      arch/x86/kernel/cpu/bus_lock.o
  CC      drivers/pci/iomap.o
  CC      sound/pci/hda/hda_intel.o
  CC      drivers/char/agp/isoch.o
  AR      sound/synth/emux/built-in.a
  AR      sound/synth/built-in.a
  CC      drivers/tty/n_tty.o
  COPY    drivers/tty/vt/defkeymap.c
  CC      arch/x86/kernel/process_32.o
  CC      net/handshake/netlink.o
  CC      net/sunrpc/auth_gss/gss_krb5_seal.o
  CC      drivers/acpi/proc.o
  CC      net/9p/trans_fd.o
  CC      drivers/tty/serial/8250/8250_dma.o
  CC      kernel/cgroup/cgroup-v1.o
  CC      kernel/trace/ring_buffer.o
  CC      drivers/char/hw_random/geode-rng.o
  CC      drivers/char/random.o
  CC      drivers/tty/serial/earlycon.o
  CC      net/netfilter/nf_conntrack_extend.o
  CC      net/ipv6/ip6_fib.o
  CC      drivers/pci/quirks.o
  CC      drivers/acpi/acpica/excreate.o
  CC      mm/workingset.o
  CC      lib/irq_regs.o
  CC      drivers/acpi/bus.o
  CC      net/sunrpc/auth_gss/gss_krb5_unseal.o
  AR      drivers/virtio/built-in.a
  CC      drivers/char/hw_random/via-rng.o
  CC      net/netfilter/nf_conntrack_acct.o
  CC      block/blk-ia-ranges.o
  CC      crypto/sha256_generic.o
  CC      net/sunrpc/auth.o
  AR      sound/pci/riptide/built-in.a
  CC      fs/ext4/migrate.o
  CC      net/ethtool/eee.o
  CC      lib/is_single_threaded.o
  CC      net/netlabel/netlabel_unlabeled.o
  CC      net/mac80211/sta_info.o
  CC      net/core/neighbour.o
  CC      drivers/acpi/acpica/exdebug.o
  CC      drivers/char/agp/amd64-agp.o
  AR      drivers/iommu/amd/built-in.a
  CC      io_uring/memmap.o
  CC      kernel/time/jiffies.o
  AR      drivers/iommu/intel/built-in.a
  AR      drivers/iommu/arm/arm-smmu/built-in.a
  CC      net/netlabel/netlabel_cipso_v4.o
  AR      drivers/iommu/arm/arm-smmu-v3/built-in.a
  CC      arch/x86/kernel/cpu/capflags.o
  AR      drivers/iommu/arm/built-in.a
  AR      drivers/iommu/iommufd/built-in.a
  AR      arch/x86/kernel/cpu/built-in.a
  AR      drivers/char/hw_random/built-in.a
  AR      drivers/iommu/riscv/built-in.a
  CC      drivers/iommu/iommu.o
  CC      net/ipv4/inet_timewait_sock.o
  CC      net/ipv4/inet_connection_sock.o
  CC      kernel/time/timer_list.o
  CC      net/core/rtnetlink.o
  CC      drivers/char/agp/intel-agp.o
  CC      arch/x86/kernel/signal.o
  CC      io_uring/alloc_cache.o
  CC      drivers/tty/serial/8250/8250_dwlib.o
  CC      lib/klist.o
  CC      crypto/sha512_generic.o
  CC      drivers/acpi/acpica/exdump.o
  CC      kernel/bpf/core.o
  CC      block/early-lookup.o
  CC      mm/debug.o
  CC      net/sunrpc/auth_null.o
  CC      drivers/tty/vt/consolemap.o
  CC      net/handshake/request.o
  CC      fs/nfs/namespace.o
  CC      lib/kobject.o
  CC      net/wireless/reg.o
  CC      net/sunrpc/auth_gss/gss_krb5_wrap.o
  CC      net/9p/trans_virtio.o
  CC      net/netfilter/nf_conntrack_seqadj.o
  CC      drivers/acpi/acpica/exfield.o
  CC      net/mac80211/wep.o
  CC      drivers/char/misc.o
  AR      sound/usb/misc/built-in.a
  AR      sound/usb/usx2y/built-in.a
  AR      sound/usb/caiaq/built-in.a
  AR      sound/usb/6fire/built-in.a
  CC      net/ethtool/tsinfo.o
  AR      sound/pci/rme9652/built-in.a
  CC      net/ethtool/cabletest.o
  AR      sound/usb/hiface/built-in.a
  CC      fs/nfs/mount_clnt.o
  AR      sound/usb/bcd2000/built-in.a
  AR      sound/usb/built-in.a
  AR      sound/pci/hda/built-in.a
  CC      kernel/time/timeconv.o
  AR      sound/pci/trident/built-in.a
  AR      sound/firewire/built-in.a
  AR      sound/pci/ymfpci/built-in.a
  CC      drivers/iommu/iommu-traces.o
  CC      net/sunrpc/auth_tls.o
  AR      sound/pci/vx222/built-in.a
  CC      io_uring/io-wq.o
  AR      sound/pci/built-in.a
  CC      kernel/cgroup/freezer.o
  CC      kernel/cgroup/legacy_freezer.o
  CC      fs/nfs/nfstrace.o
  AR      sound/sparc/built-in.a
  AR      sound/spi/built-in.a
  CC      drivers/char/agp/intel-gtt.o
  AR      sound/parisc/built-in.a
  CC      drivers/tty/serial/8250/8250_pcilib.o
  AR      sound/pcmcia/vx/built-in.a
  AR      sound/mips/built-in.a
  AR      sound/pcmcia/pdaudiocf/built-in.a
  CC      drivers/tty/serial/8250/8250_early.o
  AR      sound/pcmcia/built-in.a
  AR      sound/soc/built-in.a
  CC      arch/x86/kernel/signal_32.o
  AR      sound/atmel/built-in.a
  CC      sound/hda/hda_bus_type.o
  CC      crypto/sha3_generic.o
  CC      drivers/acpi/acpica/exfldio.o
  CC      arch/x86/kernel/traps.o
  CC      block/bounce.o
  CC      kernel/time/timecounter.o
  CC      mm/gup.o
  CC      lib/kobject_uevent.o
  CC      kernel/time/alarmtimer.o
  CC      kernel/time/posix-timers.o
  CC      net/core/utils.o
  CC      net/netlabel/netlabel_calipso.o
  CC      drivers/acpi/glue.o
  HOSTCC  drivers/tty/vt/conmakehash
  CC      net/netfilter/nf_conntrack_proto_icmpv6.o
  CC      drivers/tty/tty_ioctl.o
  CC      crypto/ecb.o
  CC      kernel/trace/trace.o
  CC      kernel/events/core.o
  CC      drivers/tty/serial/8250/8250_exar.o
  CC      drivers/acpi/acpica/exmisc.o
  CC      drivers/pci/pci-label.o
  CC      drivers/tty/vt/defkeymap.o
  CC      sound/hda/hdac_bus.o
  CC      net/sunrpc/auth_gss/gss_krb5_crypto.o
  CC      kernel/events/ring_buffer.o
  CC      net/ipv6/ipv6_sockglue.o
  CC      net/handshake/tlshd.o
  CC      kernel/cgroup/pids.o
  CONMK   drivers/tty/vt/consolemap_deftbl.c
  CC      drivers/tty/vt/consolemap_deftbl.o
  AR      drivers/tty/vt/built-in.a
  AR      sound/x86/built-in.a
  CC      arch/x86/kernel/idt.o
  CC      lib/logic_pio.o
  CC      io_uring/futex.o
  CC      net/ethtool/tunnels.o
  CC      kernel/events/callchain.o
  CC      net/handshake/trace.o
  CC      kernel/fork.o
  AR      net/9p/built-in.a
  CC      net/ipv6/ndisc.o
  AR      drivers/char/agp/built-in.a
  CC      net/wireless/scan.o
  CC      drivers/char/virtio_console.o
  CC      drivers/iommu/iommu-sysfs.o
  CC      crypto/cbc.o
  CC      drivers/acpi/acpica/exmutex.o
  CC      block/bsg.o
  CC      drivers/tty/serial/8250/8250_lpss.o
  CC      net/ipv4/tcp.o
  AR      sound/xen/built-in.a
  CC      sound/hda/hdac_device.o
  CC      fs/nfs/export.o
  CC      net/mac80211/aead_api.o
  CC      kernel/exec_domain.o
  CC      kernel/trace/trace_output.o
  CC      drivers/tty/serial/8250/8250_mid.o
  CC      lib/maple_tree.o
  CC      drivers/pci/vgaarb.o
  CC      net/sunrpc/auth_unix.o
  CC      kernel/cgroup/rdma.o
  AR      net/netlabel/built-in.a
  CC      net/ethtool/fec.o
  CC      drivers/acpi/acpica/exnames.o
  CC      net/ethtool/eeprom.o
  CC      crypto/ctr.o
  AR      sound/virtio/built-in.a
  CC      crypto/gcm.o
  CC      kernel/cgroup/cpuset.o
  CC      kernel/time/posix-cpu-timers.o
  CC      kernel/events/hw_breakpoint.o
  CC      drivers/iommu/dma-iommu.o
  AR      drivers/gpu/host1x/built-in.a
  CC      arch/x86/kernel/irq.o
  AR      drivers/gpu/vga/built-in.a
  CC      net/mac80211/wpa.o
  CC      block/blk-cgroup.o
  CC      sound/hda/hdac_sysfs.o
  CC      io_uring/napi.o
  CC      fs/fcntl.o
  CC      drivers/tty/serial/8250/8250_pci.o
  CC      net/netfilter/nf_conntrack_netlink.o
  AR      drivers/gpu/drm/tests/built-in.a
  AR      drivers/gpu/drm/arm/built-in.a
  AR      drivers/gpu/drm/clients/built-in.a
  CC      kernel/cgroup/misc.o
  CC      drivers/gpu/drm/display/drm_display_helper_mod.o
  CC      drivers/acpi/acpica/exoparg1.o
  CC      fs/ioctl.o
  CC      drivers/tty/tty_ldisc.o
  CC      arch/x86/kernel/irq_32.o
  CC      kernel/events/uprobes.o
  CC      mm/mmap_lock.o
  CC      drivers/iommu/iova.o
  CC      net/ipv6/udp.o
  CC      net/sunrpc/auth_gss/gss_krb5_keys.o
  AR      kernel/bpf/built-in.a
  CC      lib/memcat_p.o
  CC      drivers/gpu/drm/display/drm_dp_dual_mode_helper.o
  CC      drivers/gpu/drm/display/drm_dp_helper.o
  CC      crypto/ccm.o
  CC      fs/ext4/mmp.o
  AR      net/handshake/built-in.a
  CC      drivers/acpi/acpica/exoparg2.o
  CC      drivers/gpu/drm/ttm/ttm_tt.o
  CC      drivers/char/hpet.o
  CC      kernel/cgroup/debug.o
  CC      drivers/gpu/drm/display/drm_dp_mst_topology.o
  AR      drivers/pci/built-in.a
  CC      drivers/gpu/drm/display/drm_dsc_helper.o
  CC      drivers/tty/tty_buffer.o
  CC      fs/ext4/move_extent.o
  CC      net/ethtool/stats.o
  CC      net/core/link_watch.o
  CC      drivers/gpu/drm/i915/i915_config.o
  CC      drivers/gpu/drm/display/drm_hdcp_helper.o
  CC      sound/hda/hdac_regmap.o
  CC      net/netfilter/nf_conntrack_ftp.o
  CC      block/blk-ioprio.o
  CC      kernel/time/posix-clock.o
  CC      drivers/acpi/acpica/exoparg3.o
  CC      net/sunrpc/svc.o
  CC      drivers/acpi/scan.o
  CC      drivers/gpu/drm/i915/i915_driver.o
  CC      drivers/gpu/drm/display/drm_hdmi_helper.o
  CC      kernel/time/itimer.o
  CC      mm/highmem.o
  CC      fs/ext4/namei.o
  CC      drivers/char/nvram.o
  CC      drivers/tty/serial/8250/8250_pericom.o
  CC      drivers/acpi/acpica/exoparg6.o
  AR      drivers/iommu/built-in.a
  CC      lib/nmi_backtrace.o
  AR      drivers/gpu/drm/renesas/rcar-du/built-in.a
  AR      drivers/gpu/drm/renesas/rz-du/built-in.a
  AR      drivers/gpu/drm/renesas/built-in.a
  CC      drivers/gpu/drm/i915/i915_drm_client.o
  CC      net/ethtool/phc_vclocks.o
  CC      drivers/tty/tty_port.o
  AR      drivers/gpu/drm/omapdrm/built-in.a
  CC      drivers/gpu/drm/ttm/ttm_bo.o
  CC      crypto/aes_generic.o
  CC      net/netfilter/nf_conntrack_irc.o
  CC      lib/objpool.o
  CC      net/mac80211/scan.o
  CC      net/ethtool/mm.o
  AR      io_uring/built-in.a
  CC      mm/memory.o
  CC      net/sunrpc/svcsock.o
  CC      net/netfilter/nf_conntrack_sip.o
  AR      net/sunrpc/auth_gss/built-in.a
  CC      drivers/gpu/drm/i915/i915_getparam.o
  CC      drivers/connector/cn_queue.o
  CC      net/core/filter.o
  CC      net/ethtool/module.o
  CC      block/blk-iolatency.o
  CC      arch/x86/kernel/dumpstack_32.o
  CC      drivers/connector/connector.o
  CC      sound/hda/hdac_controller.o
  CC      drivers/acpi/acpica/exprep.o
  CC      drivers/tty/tty_mutex.o
  CC      net/mac80211/offchannel.o
  AR      kernel/cgroup/built-in.a
  CC      mm/mincore.o
  CC      sound/sound_core.o
  CC      fs/ext4/page-io.o
  CC      fs/ext4/readpage.o
  AR      drivers/tty/serial/8250/built-in.a
  AR      drivers/tty/serial/built-in.a
  CC      crypto/authenc.o
  CC      fs/nfs/sysfs.o
  CC      net/mac80211/ht.o
  CC      block/blk-iocost.o
  CC      kernel/time/clockevents.o
  AR      drivers/char/built-in.a
  CC      drivers/acpi/mipi-disco-img.o
  CC      drivers/acpi/acpica/exregion.o
  CC      kernel/panic.o
  CC      kernel/cpu.o
  CC      net/netfilter/nf_nat_core.o
  CC      net/core/sock_diag.o
  CC      kernel/trace/trace_seq.o
  CC      net/ipv6/udplite.o
  CC      sound/hda/hdac_stream.o
  CC      drivers/tty/tty_ldsem.o
  CC      arch/x86/kernel/time.o
  CC      drivers/gpu/drm/ttm/ttm_bo_util.o
  CC      fs/readdir.o
  CC      drivers/tty/tty_baudrate.o
  CC      drivers/acpi/acpica/exresnte.o
  CC      net/netfilter/nf_nat_proto.o
  CC      net/core/dev_ioctl.o
  CC      net/sunrpc/svcauth.o
  CC      kernel/exit.o
  CC      net/ipv4/tcp_input.o
  CC      crypto/authencesn.o
  AR      drivers/gpu/drm/tilcdc/built-in.a
  CC      mm/mlock.o
  CC      drivers/gpu/drm/i915/i915_ioctl.o
  CC      kernel/time/tick-common.o
  CC      fs/nfs/fs_context.o
  CC      drivers/connector/cn_proc.o
  CC      arch/x86/kernel/ioport.o
  CC      net/ethtool/cmis_fw_update.o
  CC      fs/select.o
  CC      drivers/gpu/drm/ttm/ttm_bo_vm.o
  CC      kernel/trace/trace_stat.o
  CC      drivers/gpu/drm/display/drm_scdc_helper.o
  CC      drivers/gpu/drm/i915/i915_irq.o
  CC      drivers/acpi/acpica/exresolv.o
  CC      sound/hda/array.o
  CC      kernel/time/tick-broadcast.o
  CC      net/ipv4/tcp_output.o
  CC      net/wireless/nl80211.o
  CC      sound/last.o
  CC      arch/x86/kernel/dumpstack.o
  CC      drivers/tty/tty_jobctrl.o
  CC      net/netfilter/nf_nat_helper.o
  CC      kernel/time/tick-broadcast-hrtimer.o
  CC      drivers/acpi/resource.o
  CC      kernel/trace/trace_printk.o
  CC      net/ipv6/raw.o
  CC      drivers/acpi/acpica/exresop.o
  CC      net/wireless/mlme.o
  CC      fs/dcache.o
  CC      fs/ext4/resize.o
  CC      kernel/trace/pid_list.o
  CC      drivers/base/power/sysfs.o
  CC      sound/hda/hdmi_chmap.o
  CC      drivers/base/firmware_loader/builtin/main.o
  CC      drivers/block/loop.o
  AR      drivers/mfd/built-in.a
  CC      crypto/lzo.o
  CC      drivers/misc/eeprom/eeprom_93cx6.o
  CC      kernel/softirq.o
  CC      drivers/gpu/drm/ttm/ttm_module.o
  AR      drivers/misc/cb710/built-in.a
  CC      drivers/base/power/generic_ops.o
  CC      kernel/resource.o
  CC      kernel/time/tick-oneshot.o
  AR      drivers/gpu/drm/display/built-in.a
  CC      kernel/sysctl.o
  CC      drivers/acpi/acpica/exserial.o
  CC      arch/x86/kernel/nmi.o
  CC      net/ethtool/cmis_cdb.o
  CC      net/ethtool/pse-pd.o
  CC      drivers/tty/n_null.o
  AR      drivers/connector/built-in.a
  CC      drivers/base/power/common.o
  CC      lib/plist.o
  AR      drivers/base/firmware_loader/builtin/built-in.a
  CC      net/ipv4/tcp_timer.o
  CC      drivers/base/firmware_loader/main.o
  CC      kernel/capability.o
  CC      fs/ext4/super.o
  CC      net/ethtool/plca.o
  CC      drivers/acpi/acpica/exstore.o
  AR      drivers/misc/eeprom/built-in.a
  CC      mm/mmap.o
  CC      drivers/base/power/qos.o
  AR      drivers/misc/lis3lv02d/built-in.a
  AR      drivers/misc/cardreader/built-in.a
  CC      drivers/gpu/drm/virtio/virtgpu_drv.o
  AR      drivers/misc/keba/built-in.a
  AR      drivers/misc/built-in.a
  AR      drivers/gpu/drm/imx/built-in.a
  AR      drivers/gpu/drm/panel/built-in.a
  CC      net/wireless/ibss.o
  CC      kernel/ptrace.o
  CC      net/mac80211/agg-tx.o
  CC      kernel/time/tick-sched.o
  CC      kernel/time/timer_migration.o
  CC      block/mq-deadline.o
  CC      drivers/gpu/drm/i915/i915_mitigations.o
  CC      net/mac80211/agg-rx.o
  CC      drivers/gpu/drm/ttm/ttm_execbuf_util.o
  CC      crypto/lzo-rle.o
  CC      block/kyber-iosched.o
  CC      net/sunrpc/svcauth_unix.o
  CC      kernel/trace/trace_sched_switch.o
  CC      net/wireless/sme.o
  CC      drivers/base/regmap/regmap.o
  CC      drivers/tty/pty.o
  CC      drivers/acpi/acpica/exstoren.o
  CC      drivers/base/regmap/regcache.o
  CC      net/netfilter/nf_nat_masquerade.o
  CC      sound/hda/trace.o
  CC      net/sunrpc/addr.o
  CC      fs/nfs/nfsroot.o
  CC      drivers/acpi/acpica/exstorob.o
  CC      drivers/gpu/drm/virtio/virtgpu_kms.o
  CC      crypto/rng.o
  CC      net/ethtool/phy.o
  CC      arch/x86/kernel/ldt.o
  CC      drivers/gpu/drm/ttm/ttm_range_manager.o
  CC      net/core/tso.o
  CC      drivers/block/virtio_blk.o
  CC      drivers/tty/tty_audit.o
  AR      drivers/base/firmware_loader/built-in.a
  CC      net/ipv6/icmp.o
  CC      kernel/trace/trace_nop.o
  CC      drivers/gpu/drm/virtio/virtgpu_gem.o
  CC      lib/radix-tree.o
  CC      drivers/gpu/drm/i915/i915_module.o
  CC      net/mac80211/vht.o
  CC      drivers/base/power/runtime.o
  CC      drivers/acpi/acpica/exsystem.o
  CC      net/wireless/chan.o
  CC      drivers/base/regmap/regcache-rbtree.o
  CC      kernel/trace/blktrace.o
  CC      block/blk-mq-debugfs.o
  CC      kernel/user.o
  CC      lib/ratelimit.o
  CC      net/ethtool/tsconfig.o
  CC      drivers/acpi/acpica/extrace.o
  CC      block/blk-pm.o
  AR      kernel/events/built-in.a
  CC      fs/nfs/sysctl.o
  CC      net/core/sock_reuseport.o
  CC      crypto/drbg.o
  CC      drivers/gpu/drm/virtio/virtgpu_vram.o
  CC      fs/inode.o
  CC      sound/hda/hdac_component.o
  CC      drivers/gpu/drm/ttm/ttm_resource.o
  CC      kernel/time/vsyscall.o
  CC      drivers/base/regmap/regcache-flat.o
  CC      mm/mmu_gather.o
  CC      drivers/tty/sysrq.o
  CC      net/ipv6/mcast.o
  CC      drivers/acpi/acpi_processor.o
  CC      net/wireless/ethtool.o
  CC      arch/x86/kernel/setup.o
  CC      drivers/acpi/processor_core.o
  CC      drivers/acpi/acpica/exutils.o
  CC      drivers/acpi/processor_pdc.o
  AR      drivers/base/test/built-in.a
  CC      net/wireless/mesh.o
  CC      net/netfilter/nf_nat_ftp.o
  CC      lib/rbtree.o
  CC      kernel/trace/trace_events.o
  CC      net/ipv4/tcp_ipv4.o
  CC      fs/ext4/symlink.o
  CC      kernel/time/timekeeping_debug.o
  CC      fs/attr.o
  CC      drivers/gpu/drm/ttm/ttm_pool.o
  CC      kernel/signal.o
  CC      block/holder.o
  CC      drivers/gpu/drm/i915/i915_params.o
  AR      drivers/block/built-in.a
  CC      drivers/acpi/acpica/hwacpi.o
  CC      fs/nfs/nfs3super.o
  CC      net/mac80211/he.o
  CC      drivers/base/power/wakeirq.o
  CC      net/sunrpc/rpcb_clnt.o
  CC      net/ipv4/tcp_minisocks.o
  CC      lib/seq_buf.o
  CC      drivers/gpu/drm/virtio/virtgpu_display.o
  CC      sound/hda/hdac_i915.o
  CC      net/wireless/ap.o
  CC      crypto/jitterentropy.o
  CC      net/mac80211/s1g.o
  AR      drivers/nfc/built-in.a
  CC      kernel/trace/trace_export.o
  CC      net/core/fib_notifier.o
  CC      net/mac80211/ibss.o
  CC      kernel/trace/trace_event_perf.o
  CC      crypto/jitterentropy-kcapi.o
  AR      net/ethtool/built-in.a
  CC      drivers/acpi/ec.o
  CC      drivers/base/power/main.o
  CC      mm/mprotect.o
  CC      net/ipv6/reassembly.o
  AR      drivers/gpu/drm/bridge/analogix/built-in.a
  AR      drivers/gpu/drm/bridge/cadence/built-in.a
  CC      drivers/acpi/acpica/hwesleep.o
  AR      drivers/gpu/drm/bridge/imx/built-in.a
  AR      drivers/gpu/drm/bridge/synopsys/built-in.a
  AR      drivers/gpu/drm/bridge/built-in.a
  CC      drivers/gpu/drm/ttm/ttm_device.o
  CC      kernel/trace/trace_events_filter.o
  CC      kernel/time/namespace.o
  AR      drivers/tty/built-in.a
  CC      net/core/xdp.o
  CC      lib/siphash.o
  CC      net/wireless/trace.o
  AR      block/built-in.a
  CC      drivers/acpi/acpica/hwgpe.o
  CC      arch/x86/kernel/x86_init.o
  CC      net/mac80211/iface.o
  CC      drivers/gpu/drm/i915/i915_pci.o
  CC      drivers/base/regmap/regcache-maple.o
  CC      net/netfilter/nf_nat_irc.o
  CC      crypto/ghash-generic.o
  CC      drivers/base/power/wakeup.o
  CC      net/netfilter/nf_nat_sip.o
  CC      sound/hda/intel-dsp-config.o
  AR      drivers/gpu/drm/hisilicon/built-in.a
  CC      net/ipv6/tcp_ipv6.o
  CC      net/ipv4/tcp_cong.o
  CC      drivers/gpu/drm/virtio/virtgpu_vq.o
  CC      drivers/gpu/drm/virtio/virtgpu_fence.o
  CC      crypto/hash_info.o
  CC      net/core/flow_offload.o
  CC      fs/bad_inode.o
  CC      fs/ext4/sysfs.o
  CC      lib/string.o
  CC      net/sunrpc/timer.o
  CC      fs/nfs/nfs3client.o
  CC      net/mac80211/link.o
  CC      drivers/acpi/acpica/hwregs.o
  CC      drivers/acpi/acpica/hwsleep.o
  CC      crypto/rsapubkey.asn1.o
  CC      drivers/gpu/drm/ttm/ttm_sys_manager.o
  CC      crypto/rsaprivkey.asn1.o
  AR      crypto/built-in.a
  CC      fs/ext4/xattr.o
  CC      lib/timerqueue.o
  AR      kernel/time/built-in.a
  CC      drivers/base/component.o
  CC      arch/x86/kernel/i8259.o
  CC      drivers/base/regmap/regmap-debugfs.o
  CC      lib/union_find.o
  CC      mm/mremap.o
  CC      sound/hda/intel-nhlt.o
  CC      net/netfilter/x_tables.o
  CC      lib/vsprintf.o
  CC      net/ipv6/ping.o
  AR      drivers/gpu/drm/mxsfb/built-in.a
  CC      drivers/gpu/drm/i915/i915_scatterlist.o
  CC      fs/ext4/xattr_hurd.o
  CC      net/ipv4/tcp_metrics.o
  CC      net/core/gro.o
  CC      drivers/acpi/acpica/hwvalid.o
  CC      drivers/gpu/drm/ttm/ttm_agp_backend.o
  CC      net/core/netdev-genl.o
  CC      net/netfilter/xt_tcpudp.o
  CC      net/ipv6/exthdrs.o
  CC      drivers/gpu/drm/i915/i915_switcheroo.o
  CC      kernel/sys.o
  CC      drivers/acpi/acpica/hwxface.o
  CC      lib/win_minmax.o
  AR      drivers/dax/hmem/built-in.a
  AR      drivers/dax/built-in.a
  CC      net/core/netdev-genl-gen.o
  CC      drivers/dma-buf/dma-buf.o
  CC      arch/x86/kernel/irqinit.o
  CC      drivers/base/power/wakeup_stats.o
  CC      net/core/gso.o
  CC      lib/xarray.o
  CC      net/netfilter/xt_CONNSECMARK.o
  CC      drivers/acpi/dock.o
  CC      net/ipv4/tcp_fastopen.o
  CC      drivers/base/core.o
  CC      sound/hda/intel-sdw-acpi.o
  CC      kernel/trace/trace_events_trigger.o
  CC      drivers/gpu/drm/virtio/virtgpu_object.o
  CC      drivers/base/power/trace.o
  CC      net/sunrpc/xdr.o
  CC      arch/x86/kernel/jump_label.o
  CC      fs/file.o
  AR      drivers/base/regmap/built-in.a
  CC      drivers/dma-buf/dma-fence.o
  CC      fs/nfs/nfs3proc.o
  CC      drivers/acpi/acpica/hwxfsleep.o
  CC      net/sunrpc/sunrpc_syms.o
  AR      drivers/gpu/drm/tiny/built-in.a
  CC      net/mac80211/rate.o
  CC      drivers/gpu/drm/i915/i915_sysfs.o
  CC      net/ipv4/tcp_rate.o
  AR      drivers/gpu/drm/ttm/built-in.a
  AR      drivers/cxl/core/built-in.a
  AR      drivers/cxl/built-in.a
  CC      arch/x86/kernel/irq_work.o
  CC      mm/msync.o
  CC      net/core/net-sysfs.o
  CC      net/ipv6/datagram.o
  CC      drivers/acpi/acpica/hwpci.o
  CC      fs/filesystems.o
  CC      net/mac80211/michael.o
  CC      fs/ext4/xattr_trusted.o
  AR      sound/hda/built-in.a
  AR      sound/built-in.a
  CC      kernel/umh.o
  CC      drivers/gpu/drm/i915/i915_utils.o
  CC      drivers/base/bus.o
  CC      mm/page_vma_mapped.o
  CC      kernel/workqueue.o
  CC      net/sunrpc/cache.o
  CC      drivers/acpi/acpica/nsaccess.o
  CC      net/netfilter/xt_NFLOG.o
  CC      drivers/gpu/drm/virtio/virtgpu_debugfs.o
  CC      drivers/dma-buf/dma-fence-array.o
  AR      drivers/base/power/built-in.a
  CC      net/wireless/ocb.o
  AR      drivers/gpu/drm/xlnx/built-in.a
  CC      fs/namespace.o
  CC      mm/pagewalk.o
  CC      net/ipv6/ip6_flowlabel.o
  CC      net/ipv4/tcp_recovery.o
  CC      drivers/gpu/drm/i915/intel_clock_gating.o
  CC      drivers/acpi/pci_root.o
  CC      drivers/acpi/acpica/nsalloc.o
  CC      fs/seq_file.o
  CC      net/netfilter/xt_SECMARK.o
  CC      net/netfilter/xt_TCPMSS.o
  CC      drivers/macintosh/mac_hid.o
  CC      kernel/pid.o
  CC      net/sunrpc/rpc_pipe.o
  CC      drivers/gpu/drm/virtio/virtgpu_plane.o
  CC      fs/nfs/nfs3xdr.o
  CC      drivers/gpu/drm/i915/intel_cpu_info.o
  CC      kernel/trace/trace_eprobe.o
  CC      fs/xattr.o
  CC      fs/ext4/xattr_user.o
  CC      net/sunrpc/sysfs.o
  CC      kernel/task_work.o
  CC      arch/x86/kernel/probe_roms.o
  CC      arch/x86/kernel/sys_ia32.o
  CC      drivers/gpu/drm/virtio/virtgpu_ioctl.o
  CC      drivers/acpi/pci_link.o
  CC      drivers/acpi/acpica/nsarguments.o
  CC      drivers/dma-buf/dma-fence-chain.o
  CC      lib/lockref.o
  CC      net/sunrpc/svc_xprt.o
  CC      mm/pgtable-generic.o
  CC      arch/x86/kernel/ksysfs.o
  CC      net/ipv6/inet6_connection_sock.o
  CC      drivers/base/dd.o
  CC      net/ipv6/udp_offload.o
  CC      drivers/acpi/pci_irq.o
  CC      drivers/dma-buf/dma-fence-unwrap.o
  CC      net/wireless/pmsr.o
  AR      drivers/gpu/drm/gud/built-in.a
  CC      net/sunrpc/xprtmultipath.o
  CC      mm/rmap.o
  AR      drivers/macintosh/built-in.a
  CC      kernel/trace/trace_kprobe.o
  CC      drivers/acpi/acpica/nsconvert.o
  CC      net/ipv4/tcp_ulp.o
  CC      drivers/gpu/drm/virtio/virtgpu_prime.o
  CC      drivers/base/syscore.o
  CC      drivers/acpi/acpi_apd.o
  CC      kernel/extable.o
  CC      net/sunrpc/stats.o
  AR      drivers/gpu/drm/solomon/built-in.a
  CC      drivers/base/driver.o
  CC      net/core/hotdata.o
  CC      drivers/dma-buf/dma-resv.o
  CC      drivers/base/class.o
  CC      drivers/gpu/drm/i915/intel_device_info.o
  CC      arch/x86/kernel/bootflag.o
  CC      lib/bcd.o
  CC      lib/sort.o
  CC      kernel/trace/error_report-traces.o
  CC      drivers/acpi/acpica/nsdump.o
  CC      net/ipv4/tcp_offload.o
  CC      net/netfilter/xt_conntrack.o
  CC      lib/parser.o
  CC [M]  drivers/gpu/drm/scheduler/sched_main.o
  GEN     net/wireless/shipped-certs.c
  CC      arch/x86/kernel/e820.o
  CC      lib/debug_locks.o
  CC      drivers/dma-buf/sync_file.o
  CC      drivers/acpi/acpi_platform.o
  CC      net/core/netdev_rx_queue.o
  CC      net/netfilter/xt_policy.o
  AR      drivers/scsi/pcmcia/built-in.a
  CC      net/mac80211/tkip.o
  CC      net/mac80211/aes_cmac.o
  CC      drivers/scsi/scsi.o
  CC      fs/nfs/nfs3acl.o
  HOSTCC  drivers/gpu/drm/xe/xe_gen_wa_oob
  CC      drivers/scsi/hosts.o
  CC      drivers/acpi/acpi_pnp.o
  CC      net/core/net-procfs.o
  CC      lib/random32.o
  CC      drivers/acpi/acpica/nseval.o
  CC      drivers/gpu/drm/drm_atomic.o
  CC      drivers/gpu/drm/virtio/virtgpu_trace_points.o
  CC      kernel/trace/power-traces.o
  CC      arch/x86/kernel/pci-dma.o
  GEN     xe_wa_oob.c xe_wa_oob.h
  CC [M]  drivers/gpu/drm/xe/xe_bb.o
  CC      fs/ext4/fast_commit.o
  CC      drivers/acpi/power.o
  CC      net/ipv6/seg6.o
  CC      mm/vmalloc.o
  CC      net/core/netpoll.o
  CC      kernel/params.o
  CC      fs/nfs/nfs4proc.o
  CC      mm/vma.o
  CC      drivers/base/platform.o
  CC      lib/bust_spinlocks.o
  CC      drivers/acpi/acpica/nsinit.o
  AR      drivers/nvme/common/built-in.a
  AR      drivers/nvme/host/built-in.a
  AR      drivers/nvme/target/built-in.a
  AR      drivers/dma-buf/built-in.a
  AR      drivers/nvme/built-in.a
  CC      fs/libfs.o
  CC      drivers/gpu/drm/drm_atomic_uapi.o
  CC      fs/fs-writeback.o
  CC      drivers/gpu/drm/drm_auth.o
  CC      kernel/kthread.o
  CC      lib/kasprintf.o
  CC [M]  drivers/gpu/drm/xe/xe_bo.o
  CC      net/netfilter/xt_state.o
  CC      drivers/gpu/drm/i915/intel_memory_region.o
  CC      net/ipv4/tcp_plb.o
  CC      arch/x86/kernel/quirks.o
  CC      fs/ext4/orphan.o
  CC      drivers/acpi/acpica/nsload.o
  CC      drivers/acpi/acpica/nsnames.o
  CC      drivers/gpu/drm/virtio/virtgpu_submit.o
  CC      kernel/trace/rpm-traces.o
  CC      net/wireless/shipped-certs.o
  CC      lib/bitmap.o
  CC      kernel/trace/trace_dynevent.o
  CC      net/ipv6/fib6_notifier.o
  CC      fs/pnode.o
  CC [M]  drivers/gpu/drm/scheduler/sched_fence.o
  CC      fs/ext4/acl.o
  CC      fs/ext4/xattr_security.o
  CC      kernel/sys_ni.o
  CC      drivers/base/cpu.o
  CC      net/ipv6/rpl.o
  CC      drivers/ata/libata-core.o
  CC      fs/nfs/nfs4xdr.o
  CC      net/sunrpc/sysctl.o
  CC      net/ipv4/datagram.o
  CC      drivers/scsi/scsi_ioctl.o
  CC      drivers/acpi/acpica/nsobject.o
  CC      fs/nfs/nfs4state.o
  CC      mm/process_vm_access.o
  CC      drivers/scsi/scsicam.o
  CC [M]  drivers/gpu/drm/xe/xe_bo_evict.o
  CC      drivers/ata/libata-scsi.o
  CC      drivers/gpu/drm/drm_blend.o
  CC      drivers/gpu/drm/i915/intel_pcode.o
  CC      net/ipv4/raw.o
  CC      net/ipv4/udp.o
  CC [M]  drivers/gpu/drm/scheduler/sched_entity.o
  CC      arch/x86/kernel/kdebugfs.o
  CC      net/core/fib_rules.o
  CC      mm/page_alloc.o
  CC      fs/splice.o
  CC      drivers/scsi/scsi_error.o
  CC [M]  net/netfilter/nf_log_syslog.o
  CC [M]  net/netfilter/xt_mark.o
  CC      drivers/acpi/acpica/nsparse.o
  CC      lib/scatterlist.o
  AR      drivers/gpu/drm/virtio/built-in.a
  CC      kernel/trace/trace_probe.o
  CC [M]  drivers/gpu/drm/xe/xe_devcoredump.o
  CC      kernel/nsproxy.o
  AR      drivers/net/phy/mediatek/built-in.a
  AR      drivers/net/phy/qcom/built-in.a
  CC      drivers/net/phy/realtek/realtek_main.o
  CC      mm/page_frag_cache.o
  CC      drivers/acpi/event.o
  CC      drivers/scsi/scsi_lib.o
  CC      kernel/trace/trace_uprobe.o
  CC      drivers/firewire/init_ohci1394_dma.o
  CC      net/mac80211/aes_gmac.o
  CC      drivers/net/phy/realtek/realtek_hwmon.o
  CC      drivers/net/phy/mdio-boardinfo.o
  AR      drivers/net/pse-pd/built-in.a
  CC      drivers/base/firmware.o
  CC      drivers/gpu/drm/i915/intel_region_ttm.o
  CC      fs/nfs/nfs4renewd.o
  CC      arch/x86/kernel/alternative.o
  CC      fs/sync.o
  CC      drivers/acpi/evged.o
  CC      drivers/acpi/acpica/nspredef.o
  CC      lib/list_sort.o
  CC      drivers/cdrom/cdrom.o
  CC      net/ipv6/ioam6.o
  LD [M]  drivers/gpu/drm/scheduler/gpu-sched.o
  CC      drivers/gpu/drm/i915/intel_runtime_pm.o
  CC      net/ipv4/udplite.o
  CC      kernel/notifier.o
  AR      net/sunrpc/built-in.a
  CC      drivers/net/phy/stubs.o
  CC      net/core/net-traces.o
  CC      drivers/base/init.o
  CC      net/mac80211/fils_aead.o
  CC      drivers/acpi/acpica/nsprepkg.o
  CC      arch/x86/kernel/i8253.o
  AR      fs/ext4/built-in.a
  CC      drivers/acpi/sysfs.o
  CC      drivers/ata/libata-eh.o
  AR      drivers/auxdisplay/built-in.a
  CC      drivers/ata/libata-transport.o
  AR      drivers/firewire/built-in.a
  CC      net/core/selftests.o
  CC      kernel/trace/rethook.o
  CC      mm/init-mm.o
  CC      mm/memblock.o
  CC      drivers/gpu/drm/i915/intel_sbi.o
  CC [M]  drivers/gpu/drm/xe/xe_device.o
  CC      arch/x86/kernel/hw_breakpoint.o
  CC      drivers/acpi/acpica/nsrepair.o
  CC      drivers/net/mdio/acpi_mdio.o
  CC      drivers/acpi/property.o
  CC      lib/uuid.o
  CC      drivers/base/map.o
  CC      arch/x86/kernel/tsc.o
  CC [M]  net/netfilter/xt_nat.o
  CC      drivers/acpi/debugfs.o
  CC      drivers/gpu/drm/i915/intel_step.o
  CC      lib/iov_iter.o
  CC      net/core/ptp_classifier.o
  CC      drivers/scsi/constants.o
  AR      drivers/net/phy/realtek/built-in.a
  CC      drivers/net/phy/mdio_devres.o
  CC      arch/x86/kernel/tsc_msr.o
  CC      drivers/scsi/scsi_lib_dma.o
  CC      drivers/pcmcia/cs.o
  CC      net/ipv4/udp_offload.o
  CC      drivers/net/mdio/fwnode_mdio.o
  CC      drivers/net/phy/phy.o
  CC      drivers/acpi/acpica/nsrepair2.o
  CC      drivers/net/phy/phy-c45.o
  CC      net/core/netprio_cgroup.o
  CC      drivers/gpu/drm/drm_bridge.o
  CC      drivers/pcmcia/socket_sysfs.o
  CC      drivers/usb/common/common.o
  CC      drivers/net/phy/phy-core.o
  CC      drivers/ata/libata-trace.o
  CC      drivers/acpi/acpica/nssearch.o
  CC      drivers/base/devres.o
  CC      drivers/base/attribute_container.o
  CC      kernel/ksysfs.o
  CC      drivers/net/phy/phy_device.o
  CC [M]  net/netfilter/xt_LOG.o
  CC      drivers/usb/common/debug.o
  CC      lib/clz_ctz.o
  CC      net/mac80211/cfg.o
  CC      drivers/usb/core/usb.o
  CC      mm/slub.o
  CC      drivers/ata/libata-sata.o
  CC      drivers/gpu/drm/drm_cache.o
  CC [M]  net/netfilter/xt_MASQUERADE.o
  AR      kernel/trace/built-in.a
  CC      net/ipv6/sysctl_net_ipv6.o
  CC [M]  drivers/gpu/drm/xe/xe_device_sysfs.o
  CC      drivers/acpi/acpica/nsutils.o
  AR      drivers/net/pcs/built-in.a
  CC      lib/bsearch.o
  CC      net/ipv6/xfrm6_policy.o
  CC      drivers/scsi/scsi_scan.o
  AR      drivers/cdrom/built-in.a
  CC      drivers/usb/core/hub.o
  CC      net/ipv4/arp.o
  CC      net/mac80211/ethtool.o
  CC      drivers/base/transport_class.o
  CC      drivers/gpu/drm/i915/intel_uncore.o
  CC      fs/nfs/nfs4super.o
  AR      drivers/usb/common/built-in.a
  GEN     drivers/scsi/scsi_devinfo_tbl.c
  CC      net/ipv4/icmp.o
  AR      drivers/net/ethernet/3com/built-in.a
  CC      drivers/pcmcia/cardbus.o
  CC      drivers/net/ethernet/8390/ne2k-pci.o
  AR      drivers/net/ethernet/adaptec/built-in.a
  CC      net/ipv6/xfrm6_state.o
  AR      drivers/net/ethernet/agere/built-in.a
  CC      fs/nfs/nfs4file.o
  CC      drivers/net/ethernet/8390/8390.o
  AR      drivers/net/mdio/built-in.a
  AR      drivers/usb/phy/built-in.a
  CC      drivers/gpu/drm/drm_color_mgmt.o
  CC      fs/nfs/delegation.o
  CC      kernel/cred.o
  CC      net/ipv6/xfrm6_input.o
  CC      net/ipv4/devinet.o
  CC      arch/x86/kernel/io_delay.o
  CC      drivers/acpi/acpica/nswalk.o
  AR      drivers/net/wireless/admtek/built-in.a
  AR      drivers/net/wireless/ath/built-in.a
  AR      drivers/net/wireless/atmel/built-in.a
  AR      drivers/net/wireless/broadcom/built-in.a
  AR      drivers/net/wireless/intel/built-in.a
  CC      drivers/net/phy/linkmode.o
  AR      drivers/net/wireless/intersil/built-in.a
  CC      drivers/base/topology.o
  AR      drivers/net/wireless/marvell/built-in.a
  CC      mm/madvise.o
  AR      drivers/net/wireless/mediatek/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_dma_buf.o
  AR      drivers/net/wireless/microchip/built-in.a
  AR      drivers/net/wireless/purelifi/built-in.a
  AR      drivers/net/wireless/quantenna/built-in.a
  CC      net/ipv6/xfrm6_output.o
  AR      drivers/net/wireless/ralink/built-in.a
  AR      drivers/net/wireless/realtek/built-in.a
  AR      drivers/net/wireless/rsi/built-in.a
  AR      drivers/net/wireless/silabs/built-in.a
  AR      drivers/net/wireless/st/built-in.a
  AR      drivers/net/wireless/ti/built-in.a
  AR      drivers/net/wireless/zydas/built-in.a
  AR      drivers/net/wireless/virtual/built-in.a
  AR      drivers/net/wireless/built-in.a
  CC      arch/x86/kernel/rtc.o
  CC      drivers/usb/core/hcd.o
  CC      drivers/gpu/drm/i915/intel_uncore_trace.o
  CC      drivers/usb/core/urb.o
  CC      drivers/pcmcia/ds.o
  CC      drivers/usb/mon/mon_main.o
  CC      drivers/acpi/acpica/nsxfeval.o
  CC      net/core/netclassid_cgroup.o
  CC      arch/x86/kernel/resource.o
  AS      arch/x86/kernel/irqflags.o
  CC      drivers/net/phy/phy_link_topology.o
  CC      drivers/ata/libata-sff.o
  CC      fs/utimes.o
  CC      drivers/gpu/drm/drm_connector.o
  CC      drivers/input/serio/serio.o
  CC [M]  net/netfilter/xt_addrtype.o
  CC      drivers/acpi/acpi_lpat.o
  CC      drivers/acpi/acpica/nsxfname.o
  CC      drivers/gpu/drm/i915/intel_wakeref.o
  CC      drivers/scsi/scsi_devinfo.o
  CC [M]  drivers/gpu/drm/xe/xe_drm_client.o
  CC      drivers/pcmcia/pcmcia_resource.o
  CC      drivers/base/container.o
  CC      mm/page_io.o
  CC      drivers/usb/host/pci-quirks.o
  AR      drivers/net/usb/built-in.a
  AR      drivers/net/ethernet/alacritech/built-in.a
  CC      drivers/ata/libata-pmp.o
  AR      drivers/net/ethernet/alteon/built-in.a
  CC      drivers/usb/host/ehci-hcd.o
  CC      kernel/reboot.o
  CC      drivers/input/keyboard/atkbd.o
  CC      arch/x86/kernel/static_call.o
  CC      net/mac80211/rx.o
  CC      drivers/input/mouse/psmouse-base.o
  AR      drivers/net/ethernet/8390/built-in.a
  CC      lib/find_bit.o
  AR      drivers/net/ethernet/amazon/built-in.a
  AR      drivers/net/ethernet/amd/built-in.a
  CC      drivers/usb/mon/mon_stat.o
  AR      drivers/net/ethernet/aquantia/built-in.a
  AR      drivers/net/ethernet/arc/built-in.a
  CC      kernel/async.o
  AR      drivers/net/ethernet/asix/built-in.a
  CC      kernel/range.o
  AR      drivers/net/ethernet/atheros/built-in.a
  AR      drivers/net/ethernet/cadence/built-in.a
  CC      net/core/dst_cache.o
  CC      drivers/usb/mon/mon_text.o
  CC      drivers/net/ethernet/broadcom/bnx2.o
  CC      drivers/acpi/acpica/nsxfobj.o
  CC      drivers/base/property.o
  CC      drivers/usb/mon/mon_bin.o
  CC [M]  drivers/gpu/drm/xe/xe_eu_stall.o
  CC      drivers/input/serio/i8042.o
  CC      drivers/pcmcia/cistpl.o
  CC      mm/swap_state.o
  CC      lib/llist.o
  CC      net/core/gro_cells.o
  CC      drivers/usb/host/ehci-pci.o
  CC      arch/x86/kernel/process.o
  CC      drivers/gpu/drm/i915/vlv_sideband.o
  CC      lib/lwq.o
  CC      drivers/gpu/drm/drm_crtc.o
  CC      drivers/net/phy/mdio_bus.o
  CC      net/ipv6/xfrm6_protocol.o
  AR      drivers/net/ethernet/brocade/built-in.a
  CC      drivers/input/serio/serport.o
  CC      drivers/scsi/scsi_sysctl.o
  CC      drivers/gpu/drm/i915/vlv_suspend.o
  CC      drivers/acpi/acpica/psargs.o
  CC      lib/memweight.o
  AR      drivers/net/ethernet/cavium/common/built-in.a
  AR      drivers/net/ethernet/chelsio/built-in.a
  AR      drivers/net/ethernet/cavium/thunder/built-in.a
  CC      drivers/usb/core/message.o
  AR      drivers/net/ethernet/cavium/liquidio/built-in.a
  AR      drivers/net/ethernet/cavium/octeon/built-in.a
  AR      drivers/net/ethernet/cavium/built-in.a
  CC      fs/nfs/nfs4idmap.o
  CC      kernel/smpboot.o
  CC      drivers/input/serio/libps2.o
  CC      lib/kfifo.o
  CC      drivers/input/mouse/synaptics.o
  CC      drivers/gpu/drm/drm_displayid.o
  CC      drivers/ata/libata-acpi.o
  AR      net/netfilter/built-in.a
  CC      net/core/failover.o
  CC      net/mac80211/spectmgmt.o
  CC      drivers/usb/class/usblp.o
  CC      kernel/ucount.o
  CC      fs/nfs/callback.o
  CC      drivers/net/phy/mdio_device.o
  CC      fs/d_path.o
  CC      arch/x86/kernel/ptrace.o
  AR      drivers/input/keyboard/built-in.a
  CC      drivers/acpi/acpica/psloop.o
  CC      mm/swapfile.o
  CC      drivers/scsi/scsi_proc.o
  CC      net/mac80211/tx.o
  CC      net/ipv4/af_inet.o
  CC      drivers/rtc/lib.o
  AR      net/wireless/built-in.a
  CC      fs/stack.o
  CC      drivers/net/mii.o
  CC      drivers/net/ethernet/broadcom/tg3.o
  CC [M]  drivers/gpu/drm/xe/xe_exec.o
  CC      mm/swap_slots.o
  CC      drivers/pcmcia/pcmcia_cis.o
  AR      drivers/usb/mon/built-in.a
  CC      drivers/base/cacheinfo.o
  CC      arch/x86/kernel/tls.o
  AR      drivers/input/joystick/built-in.a
  CC      drivers/acpi/acpi_pcc.o
  CC      net/ipv6/netfilter.o
  AR      drivers/net/ethernet/cisco/built-in.a
  CC      drivers/pcmcia/rsrc_mgr.o
  CC [M]  drivers/gpu/drm/xe/xe_exec_queue.o
  CC      kernel/regset.o
  CC      drivers/acpi/acpica/psobject.o
  CC      arch/x86/kernel/step.o
  CC      drivers/net/loopback.o
  AR      drivers/input/tablet/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_execlist.o
  CC      drivers/scsi/scsi_debugfs.o
  AR      drivers/net/ethernet/cortina/built-in.a
  CC      kernel/ksyms_common.o
  CC      lib/percpu-refcount.o
  AR      drivers/input/serio/built-in.a
  CC      drivers/net/netconsole.o
  CC      drivers/pcmcia/rsrc_nonstatic.o
  CC      drivers/rtc/class.o
  CC      drivers/gpu/drm/drm_drv.o
  CC      drivers/acpi/ac.o
  CC      drivers/ata/libata-pata-timings.o
  CC      net/mac80211/key.o
  CC      kernel/groups.o
  CC      drivers/gpu/drm/i915/soc/intel_dram.o
  CC      lib/rhashtable.o
  AR      drivers/input/touchscreen/built-in.a
  CC      drivers/scsi/scsi_trace.o
  AR      drivers/usb/class/built-in.a
  CC      drivers/scsi/scsi_logging.o
  AR      net/core/built-in.a
  CC      drivers/rtc/interface.o
  CC      drivers/net/phy/swphy.o
  AR      drivers/net/ethernet/dec/tulip/built-in.a
  CC      drivers/usb/host/ohci-hcd.o
  AR      drivers/net/ethernet/dec/built-in.a
  CC      net/ipv6/proc.o
  CC      drivers/acpi/acpica/psopcode.o
  CC      drivers/gpu/drm/drm_dumb_buffers.o
  CC      fs/fs_struct.o
  CC      drivers/usb/core/driver.o
  CC      drivers/acpi/button.o
  CC      drivers/input/mouse/focaltech.o
  CC      drivers/base/swnode.o
  CC      lib/base64.o
  CC      net/ipv4/igmp.o
  CC      kernel/kcmp.o
  CC      drivers/usb/storage/scsiglue.o
  CC      drivers/acpi/acpica/psopinfo.o
  CC      drivers/input/mouse/alps.o
  CC      drivers/gpu/drm/drm_edid.o
  CC      drivers/usb/host/ohci-pci.o
  CC      lib/once.o
  CC      drivers/i2c/algos/i2c-algo-bit.o
  CC      arch/x86/kernel/i8237.o
  CC      drivers/i2c/busses/i2c-i801.o
  CC      drivers/gpu/drm/i915/soc/intel_gmch.o
  CC      drivers/usb/storage/protocol.o
  CC      drivers/input/mouse/byd.o
  CC      fs/nfs/callback_xdr.o
  AR      drivers/i3c/built-in.a
  AR      drivers/input/misc/built-in.a
  AR      drivers/i2c/muxes/built-in.a
  CC      drivers/net/virtio_net.o
  AR      drivers/net/ethernet/dlink/built-in.a
  CC      fs/nfs/callback_proc.o
  CC      net/ipv6/syncookies.o
  CC      drivers/acpi/acpica/psparse.o
  CC      fs/nfs/nfs4namespace.o
  CC      drivers/ata/ahci.o
  CC      drivers/pcmcia/yenta_socket.o
  CC      kernel/freezer.o
  CC      drivers/scsi/scsi_pm.o
  CC      drivers/net/phy/fixed_phy.o
  CC      arch/x86/kernel/stacktrace.o
  AR      drivers/media/i2c/built-in.a
  CC      drivers/ptp/ptp_clock.o
  AR      drivers/pps/clients/built-in.a
  AR      drivers/media/tuners/built-in.a
  CC      drivers/pps/pps.o
  AR      drivers/media/rc/keymaps/built-in.a
  CC      drivers/power/supply/power_supply_core.o
  AR      drivers/media/rc/built-in.a
  CC      drivers/hwmon/hwmon.o
  AR      drivers/media/common/b2c2/built-in.a
  AR      drivers/media/common/saa7146/built-in.a
  CC      net/ipv4/fib_frontend.o
  AR      drivers/media/common/siano/built-in.a
  CC      drivers/pps/kapi.o
  AR      drivers/media/common/v4l2-tpg/built-in.a
  AR      drivers/media/common/videobuf2/built-in.a
  CC      drivers/net/net_failover.o
  AR      drivers/media/common/built-in.a
  CC      drivers/usb/host/uhci-hcd.o
  AR      drivers/media/platform/allegro-dvt/built-in.a
  AR      drivers/media/platform/amlogic/meson-ge2d/built-in.a
  AR      drivers/media/platform/amlogic/built-in.a
  AR      drivers/media/platform/amphion/built-in.a
  AR      drivers/media/platform/aspeed/built-in.a
  AR      drivers/media/platform/atmel/built-in.a
  AR      drivers/media/platform/broadcom/built-in.a
  CC      drivers/acpi/acpica/psscope.o
  AR      drivers/media/platform/cadence/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_force_wake.o
  CC      lib/refcount.o
  AR      drivers/media/platform/chips-media/coda/built-in.a
  CC      drivers/i2c/i2c-boardinfo.o
  CC      drivers/ptp/ptp_chardev.o
  AR      drivers/media/platform/chips-media/wave5/built-in.a
  CC      drivers/usb/host/xhci.o
  AR      drivers/media/platform/chips-media/built-in.a
  CC      arch/x86/kernel/reboot.o
  AR      drivers/media/platform/imagination/built-in.a
  AR      drivers/media/platform/intel/built-in.a
  AR      drivers/media/platform/marvell/built-in.a
  CC      drivers/acpi/fan_core.o
  CC      drivers/usb/core/config.o
  CC      drivers/usb/storage/transport.o
  AR      drivers/media/platform/mediatek/jpeg/built-in.a
  CC      drivers/base/faux.o
  AR      drivers/media/platform/mediatek/mdp/built-in.a
  AR      drivers/media/platform/mediatek/vcodec/common/built-in.a
  AR      drivers/media/platform/mediatek/vcodec/encoder/built-in.a
  AR      drivers/media/platform/mediatek/vcodec/decoder/built-in.a
  AR      drivers/media/platform/mediatek/vcodec/built-in.a
  CC      kernel/profile.o
  AR      drivers/media/platform/mediatek/vpu/built-in.a
  CC      drivers/power/supply/power_supply_sysfs.o
  AR      drivers/media/platform/mediatek/mdp3/built-in.a
  AR      drivers/media/platform/mediatek/built-in.a
  AR      drivers/media/platform/microchip/built-in.a
  CC      lib/rcuref.o
  AR      drivers/media/platform/nuvoton/built-in.a
  AR      drivers/i2c/algos/built-in.a
  CC      drivers/ata/libahci.o
  AR      drivers/media/platform/nvidia/tegra-vde/built-in.a
  AR      drivers/media/platform/nvidia/built-in.a
  CC      mm/dmapool.o
  AR      drivers/media/platform/nxp/dw100/built-in.a
  CC      drivers/gpu/drm/i915/soc/intel_pch.o
  AR      drivers/media/platform/nxp/imx-jpeg/built-in.a
  AR      drivers/media/platform/qcom/camss/built-in.a
  AR      drivers/media/platform/nxp/imx8-isi/built-in.a
  AR      drivers/media/platform/nxp/built-in.a
  AR      drivers/media/platform/qcom/venus/built-in.a
  CC      mm/hugetlb.o
  AR      drivers/media/platform/qcom/built-in.a
  CC      drivers/acpi/acpica/pstree.o
  CC      drivers/ptp/ptp_sysfs.o
  AR      drivers/media/platform/raspberrypi/pisp_be/built-in.a
  CC      lib/usercopy.o
  AR      drivers/media/platform/raspberrypi/rp1-cfe/built-in.a
  AR      drivers/media/platform/raspberrypi/built-in.a
  AR      drivers/media/platform/renesas/rcar-vin/built-in.a
  CC      drivers/rtc/nvmem.o
  AR      drivers/media/platform/renesas/rzg2l-cru/built-in.a
  CC      drivers/pps/sysfs.o
  AR      drivers/media/platform/renesas/vsp1/built-in.a
  AR      drivers/media/platform/rockchip/rga/built-in.a
  AR      drivers/media/platform/renesas/built-in.a
  CC      drivers/i2c/i2c-core-base.o
  AR      drivers/media/platform/rockchip/rkisp1/built-in.a
  AR      drivers/media/platform/rockchip/built-in.a
  CC      drivers/usb/host/xhci-mem.o
  CC      drivers/scsi/scsi_bsg.o
  AR      drivers/media/platform/samsung/exynos-gsc/built-in.a
  AR      drivers/media/platform/samsung/exynos4-is/built-in.a
  AR      drivers/media/platform/samsung/s3c-camif/built-in.a
  AR      drivers/media/platform/samsung/s5p-g2d/built-in.a
  AR      drivers/i2c/busses/built-in.a
  CC      drivers/base/auxiliary.o
  AR      drivers/media/platform/samsung/s5p-jpeg/built-in.a
  AR      drivers/media/platform/samsung/s5p-mfc/built-in.a
  AR      drivers/media/platform/samsung/built-in.a
  AR      drivers/net/ethernet/emulex/built-in.a
  CC      net/ipv4/fib_semantics.o
  AR      drivers/media/platform/st/sti/bdisp/built-in.a
  AR      drivers/media/platform/st/sti/c8sectpfe/built-in.a
  AR      drivers/media/platform/st/sti/delta/built-in.a
  AR      drivers/media/platform/st/sti/hva/built-in.a
  AR      drivers/media/platform/st/stm32/built-in.a
  AR      drivers/media/platform/st/built-in.a
  CC      net/ipv4/fib_trie.o
  AR      drivers/media/platform/sunxi/sun4i-csi/built-in.a
  AR      drivers/media/platform/sunxi/sun6i-csi/built-in.a
  CC      lib/errseq.o
  CC      drivers/input/input.o
  AR      drivers/media/platform/sunxi/sun6i-mipi-csi2/built-in.a
  AR      drivers/net/phy/built-in.a
  AR      drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/built-in.a
  CC      drivers/i2c/i2c-core-smbus.o
  AR      drivers/media/platform/sunxi/sun8i-di/built-in.a
  CC      drivers/power/supply/power_supply_leds.o
  CC      drivers/acpi/acpica/psutils.o
  AR      drivers/media/platform/sunxi/sun8i-rotate/built-in.a
  CC      drivers/input/input-compat.o
  CC      fs/nfs/nfs4getroot.o
  AR      drivers/media/platform/sunxi/built-in.a
  AR      drivers/media/platform/ti/am437x/built-in.a
  AR      drivers/media/platform/ti/cal/built-in.a
  CC      lib/bucket_locks.o
  AR      drivers/media/platform/ti/vpe/built-in.a
  AR      drivers/media/platform/ti/davinci/built-in.a
  CC      drivers/input/input-mt.o
  AR      drivers/pps/built-in.a
  AR      drivers/media/platform/ti/j721e-csi2rx/built-in.a
  CC      fs/nfs/nfs4client.o
  AR      drivers/media/platform/ti/omap/built-in.a
  CC      lib/generic-radix-tree.o
  CC      net/ipv4/fib_notifier.o
  AR      drivers/media/platform/ti/omap3isp/built-in.a
  AR      drivers/media/platform/ti/built-in.a
  CC      net/ipv6/calipso.o
  CC      kernel/stacktrace.o
  CC      drivers/input/mouse/logips2pp.o
  CC      arch/x86/kernel/msr.o
  AR      drivers/media/platform/verisilicon/built-in.a
  AR      drivers/media/platform/via/built-in.a
  CC      drivers/acpi/fan_attr.o
  AR      drivers/media/platform/xilinx/built-in.a
  AR      drivers/media/platform/built-in.a
  CC      drivers/base/devtmpfs.o
  CC      drivers/rtc/dev.o
  CC [M]  drivers/gpu/drm/xe/xe_ggtt.o
  CC      drivers/input/input-poller.o
  AR      drivers/pcmcia/built-in.a
  CC      net/mac80211/util.o
  AR      drivers/media/pci/ttpci/built-in.a
  AR      drivers/media/pci/b2c2/built-in.a
  CC      drivers/input/mouse/lifebook.o
  CC      drivers/usb/core/file.o
  AR      drivers/media/pci/pluto2/built-in.a
  AR      drivers/media/pci/dm1105/built-in.a
  CC      drivers/input/mouse/trackpoint.o
  AR      drivers/media/pci/pt1/built-in.a
  AR      drivers/media/pci/pt3/built-in.a
  CC      drivers/usb/storage/usb.o
  AR      drivers/media/pci/mantis/built-in.a
  AR      drivers/media/pci/ngene/built-in.a
  AR      drivers/media/pci/ddbridge/built-in.a
  CC      drivers/acpi/acpica/pswalk.o
  AR      drivers/media/pci/saa7146/built-in.a
  AR      drivers/hwmon/built-in.a
  AR      drivers/media/pci/smipcie/built-in.a
  CC      drivers/usb/core/buffer.o
  AR      drivers/media/pci/netup_unidvb/built-in.a
  AR      drivers/media/pci/intel/ipu3/built-in.a
  AR      drivers/media/pci/intel/ivsc/built-in.a
  CC      drivers/power/supply/power_supply_hwmon.o
  AR      drivers/media/pci/intel/built-in.a
  CC      drivers/ptp/ptp_vclock.o
  AR      drivers/media/pci/built-in.a
  CC      drivers/scsi/scsi_common.o
  AR      drivers/media/usb/b2c2/built-in.a
  CC      drivers/gpu/drm/i915/soc/intel_rom.o
  AR      drivers/media/usb/dvb-usb/built-in.a
  AR      drivers/media/usb/dvb-usb-v2/built-in.a
  AR      drivers/media/usb/s2255/built-in.a
  AR      drivers/media/usb/siano/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gpu_scheduler.o
  AR      drivers/media/usb/ttusb-budget/built-in.a
  AR      drivers/media/usb/ttusb-dec/built-in.a
  AR      drivers/media/usb/built-in.a
  CC      drivers/rtc/proc.o
  CC      lib/bitmap-str.o
  AR      drivers/media/mmc/siano/built-in.a
  AR      drivers/media/mmc/built-in.a
  CC      drivers/i2c/i2c-core-acpi.o
  CC      net/ipv4/inet_fragment.o
  AR      drivers/media/firewire/built-in.a
  AR      drivers/media/spi/built-in.a
  CC      drivers/gpu/drm/drm_eld.o
  AR      drivers/media/test-drivers/built-in.a
  AR      drivers/media/built-in.a
  CC      drivers/gpu/drm/i915/i915_memcpy.o
  CC      kernel/dma.o
  CC      drivers/acpi/acpica/psxface.o
  CC      drivers/acpi/acpica/rsaddr.o
  CC      drivers/scsi/scsi_transport_spi.o
  CC      net/ipv6/ah6.o
  CC      lib/string_helpers.o
  AR      drivers/net/ethernet/engleder/built-in.a
  CC      drivers/rtc/sysfs.o
  CC      drivers/gpu/drm/i915/i915_mm.o
  AR      drivers/net/ethernet/ezchip/built-in.a
  CC      mm/mmu_notifier.o
  CC      drivers/ptp/ptp_kvm_x86.o
  CC      drivers/acpi/acpica/rscalc.o
  CC      drivers/base/module.o
  CC      drivers/input/ff-core.o
  CC      fs/statfs.o
  CC      drivers/acpi/fan_hwmon.o
  CC      arch/x86/kernel/cpuid.o
  AR      drivers/net/ethernet/fujitsu/built-in.a
  CC      fs/nfs/nfs4session.o
  AR      drivers/power/supply/built-in.a
  CC      drivers/gpu/drm/drm_encoder.o
  AR      drivers/power/built-in.a
  CC      net/mac80211/parse.o
  CC      drivers/input/mouse/cypress_ps2.o
  CC      drivers/acpi/acpica/rscreate.o
  CC      drivers/usb/storage/initializers.o
  CC      drivers/usb/core/sysfs.o
  CC      net/ipv6/esp6.o
  CC      lib/hexdump.o
  CC      drivers/gpu/drm/drm_file.o
  AR      drivers/usb/misc/built-in.a
  CC      fs/fs_pin.o
  CC      drivers/ata/ata_piix.o
  CC      kernel/smp.o
  AR      drivers/net/ethernet/fungible/built-in.a
  CC      arch/x86/kernel/early-quirks.o
  CC      drivers/acpi/acpi_video.o
  CC      drivers/base/auxiliary_sysfs.o
  CC      net/mac80211/wme.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc.o
  CC      drivers/usb/core/endpoint.o
  CC      drivers/rtc/rtc-mc146818-lib.o
  CC      drivers/usb/early/ehci-dbgp.o
  CC      mm/migrate.o
  CC      drivers/acpi/acpica/rsdumpinfo.o
  CC      drivers/rtc/rtc-cmos.o
  CC      drivers/i2c/i2c-smbus.o
  CC      drivers/gpu/drm/drm_fourcc.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc_debugfs.o
  CC      arch/x86/kernel/smp.o
  CC      drivers/usb/core/devio.o
  AR      drivers/thermal/broadcom/built-in.a
  CC      drivers/gpu/drm/i915/i915_sw_fence.o
  AR      drivers/thermal/renesas/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gsc_proxy.o
  AR      drivers/thermal/samsung/built-in.a
  CC      drivers/thermal/intel/intel_tcc.o
  CC      drivers/ptp/ptp_kvm_common.o
  AR      drivers/thermal/st/built-in.a
  CC      drivers/acpi/video_detect.o
  AR      drivers/thermal/qcom/built-in.a
  CC      drivers/usb/host/xhci-ext-caps.o
  AR      drivers/watchdog/built-in.a
  CC      drivers/acpi/processor_driver.o
  CC      drivers/usb/storage/sierra_ms.o
  CC      drivers/input/mouse/psmouse-smbus.o
  CC      lib/kstrtox.o
  CC      drivers/base/devcoredump.o
  CC      net/ipv4/ping.o
  CC      drivers/acpi/acpica/rsinfo.o
  CC      drivers/gpu/drm/drm_framebuffer.o
  CC      kernel/uid16.o
  CC      drivers/ata/pata_amd.o
  CC      drivers/thermal/intel/therm_throt.o
  CC [M]  drivers/gpu/drm/xe/xe_gsc_submit.o
  CC      arch/x86/kernel/smpboot.o
  CC      fs/nfs/dns_resolve.o
  CC      drivers/usb/host/xhci-ring.o
  CC      kernel/kallsyms.o
  CC      drivers/acpi/acpica/rsio.o
  CC      net/mac80211/chan.o
  CC      drivers/gpu/drm/i915/i915_sw_fence_work.o
  CC      drivers/usb/storage/option_ms.o
  CC      kernel/acct.o
  CC      fs/nfs/nfs4trace.o
  CC      drivers/base/platform-msi.o
  CC      drivers/scsi/virtio_scsi.o
  CC      drivers/acpi/acpica/rsirq.o
  CC [M]  drivers/thermal/intel/x86_pkg_temp_thermal.o
  CC      lib/iomap.o
  CC      drivers/md/md.o
  CC      arch/x86/kernel/tsc_sync.o
  AR      drivers/i2c/built-in.a
  CC      drivers/gpu/drm/drm_gem.o
  AR      drivers/usb/early/built-in.a
  CC      net/mac80211/trace.o
  CC      mm/page_counter.o
  CC      lib/iomap_copy.o
  CC      drivers/md/md-bitmap.o
  AR      drivers/thermal/tegra/built-in.a
  CC      drivers/gpu/drm/i915/i915_syncmap.o
  CC      drivers/acpi/processor_thermal.o
  CC      drivers/md/md-autodetect.o
  AR      drivers/ptp/built-in.a
  CC      fs/nfs/nfs4sysctl.o
  CC      drivers/gpu/drm/drm_ioctl.o
  AR      drivers/rtc/built-in.a
  CC      drivers/input/touchscreen.o
  CC [M]  drivers/gpu/drm/xe/xe_gt.o
  CC      lib/devres.o
  CC      drivers/gpu/drm/drm_lease.o
  AR      drivers/input/mouse/built-in.a
  CC      drivers/ata/pata_oldpiix.o
  AR      drivers/thermal/mediatek/built-in.a
  CC      lib/check_signature.o
  CC      drivers/acpi/acpica/rslist.o
  CC      arch/x86/kernel/setup_percpu.o
  CC      drivers/base/physical_location.o
  CC      drivers/usb/storage/usual-tables.o
  CC      drivers/cpufreq/cpufreq.o
  CC      drivers/cpufreq/freq_table.o
  CC      net/ipv4/ip_tunnel_core.o
  CC      drivers/ata/pata_sch.o
  CC      drivers/scsi/sd.o
  CC      drivers/cpufreq/cpufreq_performance.o
  CC      drivers/gpu/drm/i915/i915_user_extensions.o
  CC      drivers/input/ff-memless.o
  CC      net/ipv6/sit.o
  CC      drivers/thermal/thermal_core.o
  CC      drivers/usb/host/xhci-hub.o
  CC      mm/hugetlb_cgroup.o
  CC      drivers/base/trace.o
  CC      mm/early_ioremap.o
  CC      drivers/acpi/acpica/rsmemory.o
  AR      drivers/thermal/intel/built-in.a
  CC      fs/nsfs.o
  CC      drivers/acpi/processor_idle.o
  CC      drivers/cpufreq/cpufreq_userspace.o
  CC      lib/interval_tree.o
  CC      drivers/scsi/sr.o
  CC      drivers/gpu/drm/drm_managed.o
  CC      drivers/usb/host/xhci-dbg.o
  CC      drivers/gpu/drm/drm_mm.o
  CC      net/mac80211/mlme.o
  CC      net/ipv6/addrconf_core.o
  CC      drivers/md/dm.o
  CC      drivers/gpu/drm/i915/i915_debugfs.o
  CC      drivers/acpi/acpica/rsmisc.o
  AR      drivers/net/ethernet/google/built-in.a
  AR      drivers/usb/storage/built-in.a
  CC      mm/secretmem.o
  CC      drivers/ata/pata_mpiix.o
  CC      drivers/cpufreq/cpufreq_ondemand.o
  CC      kernel/vmcore_info.o
  CC      lib/assoc_array.o
  CC      arch/x86/kernel/mpparse.o
  CC      kernel/elfcorehdr.o
  CC      fs/fs_types.o
  CC      net/mac80211/tdls.o
  CC      drivers/cpuidle/governors/menu.o
  CC      drivers/acpi/processor_throttling.o
  CC      drivers/cpuidle/cpuidle.o
  CC      net/ipv6/exthdrs_core.o
  CC      drivers/thermal/thermal_sysfs.o
  CC      drivers/usb/core/notify.o
  CC      net/ipv6/ip6_checksum.o
  CC      drivers/cpufreq/cpufreq_governor.o
  CC      mm/hmm.o
  CC      drivers/input/sparse-keymap.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_ccs_mode.o
  CC      net/ipv6/ip6_icmp.o
  CC      lib/bitrev.o
  CC      drivers/acpi/acpica/rsserial.o
  AR      drivers/base/built-in.a
  CC      drivers/acpi/acpica/rsutils.o
  CC      net/ipv4/gre_offload.o
  CC      drivers/gpu/drm/drm_mode_config.o
  CC      drivers/thermal/thermal_trip.o
  AR      drivers/net/ethernet/hisilicon/built-in.a
  CC      drivers/acpi/processor_perflib.o
  CC      drivers/cpuidle/governors/haltpoll.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_clock.o
  CC      kernel/crash_reserve.o
  CC      drivers/ata/ata_generic.o
  CC      drivers/cpuidle/driver.o
  CC      drivers/gpu/drm/i915/i915_debugfs_params.o
  CC      net/ipv4/metrics.o
  CC      drivers/thermal/thermal_helpers.o
  CC      drivers/input/vivaldi-fmap.o
  CC      drivers/usb/core/generic.o
  CC      drivers/md/dm-table.o
  CC      drivers/acpi/container.o
  CC      lib/crc-ccitt.o
  CC      fs/fs_context.o
  CC      drivers/cpuidle/governor.o
  CC      drivers/scsi/sr_ioctl.o
  CC      net/ipv6/output_core.o
  CC      drivers/usb/host/xhci-trace.o
  CC      drivers/cpufreq/cpufreq_governor_attr_set.o
  CC      arch/x86/kernel/trace_clock.o
  CC      drivers/acpi/acpica/rsxface.o
  AR      drivers/mmc/built-in.a
  CC      drivers/usb/host/xhci-debugfs.o
  CC      drivers/gpu/drm/drm_mode_object.o
  CC      net/ipv4/netlink.o
  CC      fs/fs_parser.o
  CC      drivers/input/input-leds.o
  CC      drivers/input/evdev.o
  CC      mm/memfd.o
  CC      arch/x86/kernel/trace.o
  CC      lib/crc16.o
  CC      drivers/acpi/acpica/tbdata.o
  CC      drivers/acpi/thermal_lib.o
  CC      drivers/acpi/acpica/tbfadt.o
  CC      drivers/cpuidle/sysfs.o
  CC      net/ipv4/nexthop.o
  CC      drivers/thermal/thermal_thresholds.o
  CC      drivers/md/dm-target.o
  CC      drivers/gpu/drm/drm_modes.o
  AR      drivers/ufs/built-in.a
  CC      drivers/md/dm-linear.o
  CC      drivers/gpu/drm/drm_modeset_lock.o
  CC      drivers/thermal/thermal_netlink.o
  HOSTCC  lib/gen_crc32table
  CC      kernel/kexec_core.o
  CC      mm/ptdump.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_freq.o
  CC      net/ipv6/protocol.o
  CC      fs/fsopen.o
  CC      drivers/cpufreq/acpi-cpufreq.o
  CC      drivers/scsi/sr_vendor.o
  CC      drivers/usb/core/quirks.o
  AR      drivers/ata/built-in.a
  CC      drivers/md/dm-stripe.o
  CC      drivers/usb/core/devices.o
  AR      drivers/cpuidle/governors/built-in.a
  CC      drivers/scsi/sg.o
  CC      lib/xxhash.o
  CC      drivers/gpu/drm/drm_plane.o
  CC      drivers/gpu/drm/i915/i915_pmu.o
  CC      drivers/gpu/drm/i915/gt/gen2_engine_cs.o
  CC      net/ipv4/udp_tunnel_stub.o
  CC      drivers/acpi/acpica/tbfind.o
  CC      arch/x86/kernel/rethook.o
  CC      arch/x86/kernel/vmcore_info_32.o
  CC      drivers/thermal/thermal_hwmon.o
  CC      drivers/gpu/drm/i915/gt/gen6_engine_cs.o
  AR      drivers/net/ethernet/huawei/built-in.a
  CC      fs/init.o
  CC      fs/kernel_read_file.o
  CC      drivers/usb/host/xhci-pci.o
  CC      drivers/cpuidle/poll_state.o
  CC      drivers/acpi/thermal.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_idle.o
  CC      net/ipv6/ip6_offload.o
  CC      drivers/thermal/gov_step_wise.o
  AR      drivers/firmware/arm_ffa/built-in.a
  AR      drivers/firmware/arm_scmi/built-in.a
  CC      net/mac80211/ocb.o
  AR      drivers/firmware/broadcom/built-in.a
  CC      arch/x86/kernel/machine_kexec_32.o
  AR      drivers/firmware/cirrus/test/built-in.a
  AR      drivers/firmware/cirrus/built-in.a
  AR      fs/nfs/built-in.a
  AR      drivers/firmware/meson/built-in.a
  CC      net/ipv4/ip_tunnel.o
  AR      drivers/firmware/microchip/built-in.a
  CC      drivers/md/dm-ioctl.o
  CC      drivers/acpi/acpica/tbinstal.o
  CC      drivers/cpuidle/cpuidle-haltpoll.o
  CC      mm/execmem.o
  AR      drivers/firmware/imx/built-in.a
  CC      drivers/md/dm-io.o
  CC      lib/genalloc.o
  CC      drivers/firmware/efi/efi-bgrt.o
  AS      arch/x86/kernel/relocate_kernel_32.o
  CC      drivers/firmware/efi/libstub/efi-stub-helper.o
  CC      kernel/crash_core.o
  AR      drivers/firmware/psci/built-in.a
  CC      drivers/acpi/nhlt.o
  CC      drivers/firmware/efi/efi.o
  AR      drivers/input/built-in.a
  CC      kernel/kexec.o
  CC      net/ipv6/tcpv6_offload.o
  CC      net/ipv4/sysctl_net_ipv4.o
  CC      drivers/cpufreq/amd-pstate.o
  CC      lib/percpu_counter.o
  CC      drivers/acpi/acpica/tbprint.o
  AR      drivers/crypto/stm32/built-in.a
  CC      drivers/usb/core/phy.o
  AR      drivers/crypto/xilinx/built-in.a
  AR      drivers/firmware/qcom/built-in.a
  CC      drivers/usb/core/port.o
  CC      drivers/usb/core/hcd-pci.o
  AR      drivers/crypto/hisilicon/built-in.a
  AR      drivers/crypto/intel/keembay/built-in.a
  AR      drivers/crypto/intel/ixp4xx/built-in.a
  AR      drivers/crypto/intel/built-in.a
  AR      drivers/crypto/starfive/built-in.a
  AR      drivers/crypto/built-in.a
  CC      fs/mnt_idmapping.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_mcr.o
  CC      drivers/acpi/acpica/tbutils.o
  AR      drivers/firmware/smccc/built-in.a
  CC      fs/remap_range.o
  CC      drivers/usb/core/usb-acpi.o
  AR      drivers/cpuidle/built-in.a
  CC      drivers/gpu/drm/drm_prime.o
  CC      drivers/firmware/efi/libstub/gop.o
  CC      net/ipv4/proc.o
  CC      drivers/cpufreq/amd-pstate-trace.o
  AR      drivers/thermal/built-in.a
  CC      drivers/acpi/acpica/tbxface.o
  AR      drivers/firmware/tegra/built-in.a
  CC      drivers/clocksource/acpi_pm.o
  CC      drivers/clocksource/i8253.o
  CC      drivers/firmware/efi/vars.o
  CC      drivers/firmware/efi/reboot.o
  CC      arch/x86/kernel/crash_dump_32.o
  CC      net/mac80211/airtime.o
  CC      drivers/cpufreq/intel_pstate.o
  CC      drivers/gpu/drm/i915/gt/gen6_ppgtt.o
  CC      drivers/hid/usbhid/hid-core.o
  CC      drivers/hid/usbhid/hiddev.o
  CC      drivers/firmware/efi/memattr.o
  AR      mm/built-in.a
  CC      drivers/scsi/scsi_sysfs.o
  CC      drivers/hid/usbhid/hid-pidff.o
  CC      lib/audit.o
  CC      kernel/utsname.o
  AR      drivers/firmware/xilinx/built-in.a
  CC      drivers/md/dm-kcopyd.o
  CC      net/mac80211/eht.o
  AR      drivers/platform/x86/amd/built-in.a
  CC      drivers/md/dm-sysfs.o
  AR      drivers/platform/x86/intel/built-in.a
  CC      drivers/platform/x86/wmi.o
  AR      drivers/platform/surface/built-in.a
  CC      net/mac80211/led.o
  CC      fs/pidfs.o
  CC      drivers/acpi/acpi_memhotplug.o
  CC      drivers/platform/x86/wmi-bmof.o
  CC      drivers/md/dm-stats.o
  CC      drivers/net/ethernet/intel/e1000/e1000_main.o
  CC      drivers/acpi/acpica/tbxfload.o
  AR      drivers/usb/host/built-in.a
  CC      drivers/net/ethernet/intel/e1000e/82571.o
  CC      drivers/mailbox/mailbox.o
  CC      drivers/firmware/efi/tpm.o
  AR      drivers/net/ethernet/broadcom/built-in.a
  CC      drivers/net/ethernet/intel/e1000e/ich8lan.o
  AR      drivers/usb/core/built-in.a
  CC      drivers/firmware/efi/libstub/secureboot.o
  AR      drivers/usb/built-in.a
  CC      drivers/firmware/dmi_scan.o
  CC      net/ipv6/exthdrs_offload.o
  CC      kernel/pid_namespace.o
  CC      drivers/net/ethernet/intel/e100.o
  CC      arch/x86/kernel/crash.o
  CC      net/ipv6/inet6_hashtables.o
  CC      drivers/firmware/efi/libstub/tpm.o
  CC      drivers/net/ethernet/intel/e1000/e1000_hw.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_pagefault.o
  AR      drivers/clocksource/built-in.a
  CC      lib/syscall.o
  CC      drivers/md/dm-rq.o
  CC      drivers/firmware/dmi-id.o
  CC      net/ipv6/mcast_snoop.o
  CC      drivers/firmware/efi/libstub/file.o
  CC      drivers/gpu/drm/drm_print.o
  CC      drivers/net/ethernet/intel/e1000/e1000_ethtool.o
  CC      drivers/acpi/acpica/tbxfroot.o
  CC      drivers/firmware/efi/libstub/mem.o
  CC      arch/x86/kernel/module.o
  CC      kernel/stop_machine.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sysfs.o
  CC      drivers/mailbox/pcc.o
  AR      drivers/perf/built-in.a
  CC      lib/errname.o
  CC      drivers/firmware/memmap.o
  CC      net/mac80211/pm.o
  CC      drivers/firmware/efi/memmap.o
  CC      drivers/acpi/acpica/utaddress.o
  CC      drivers/net/ethernet/intel/e1000e/80003es2lan.o
  CC      fs/buffer.o
  AR      drivers/net/ethernet/i825xx/built-in.a
  CC      drivers/gpu/drm/i915/gt/gen7_renderclear.o
  CC      drivers/gpu/drm/drm_property.o
  CC      drivers/platform/x86/eeepc-laptop.o
  AR      drivers/hwtracing/intel_th/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_gt_throttle.o
  AR      drivers/android/built-in.a
  CC      drivers/md/dm-io-rewind.o
  CC      drivers/net/ethernet/intel/e1000/e1000_param.o
  CC      lib/nlattr.o
  CC      drivers/gpu/drm/drm_rect.o
  AR      drivers/scsi/built-in.a
  CC      drivers/net/ethernet/intel/e1000e/mac.o
  CC      net/ipv4/fib_rules.o
  AR      drivers/nvmem/layouts/built-in.a
  CC      drivers/nvmem/core.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o
  CC      drivers/firmware/efi/capsule.o
  CC      drivers/firmware/efi/esrt.o
  AR      drivers/hid/usbhid/built-in.a
  CC      drivers/hid/hid-core.o
  CC      drivers/platform/x86/p2sb.o
  CC      lib/cpu_rmap.o
  AR      drivers/net/ethernet/microsoft/built-in.a
  CC      drivers/gpu/drm/i915/gt/gen8_engine_cs.o
  CC      drivers/firmware/efi/libstub/random.o
  CC      drivers/firmware/efi/libstub/randomalloc.o
  CC      arch/x86/kernel/doublefault_32.o
  CC      drivers/acpi/acpica/utalloc.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_topology.o
  CC      drivers/net/ethernet/intel/e1000e/manage.o
  CC      drivers/acpi/acpica/utascii.o
  AR      drivers/mailbox/built-in.a
  AR      drivers/net/ethernet/litex/built-in.a
  CC      arch/x86/kernel/early_printk.o
  CC      net/mac80211/rc80211_minstrel_ht.o
  CC      kernel/audit.o
  CC      kernel/auditfilter.o
  CC      kernel/auditsc.o
  CC      fs/mpage.o
  AR      drivers/net/ethernet/marvell/octeon_ep/built-in.a
  AR      drivers/net/ethernet/marvell/octeon_ep_vf/built-in.a
  AR      drivers/net/ethernet/marvell/octeontx2/built-in.a
  CC      drivers/acpi/acpica/utbuffer.o
  AR      drivers/net/ethernet/marvell/prestera/built-in.a
  CC      drivers/net/ethernet/marvell/sky2.o
  CC      drivers/firmware/efi/runtime-wrappers.o
  CC      drivers/firmware/efi/libstub/pci.o
  CC      lib/dynamic_queue_limits.o
  AR      drivers/net/ethernet/mellanox/built-in.a
  CC      drivers/firmware/efi/libstub/skip_spaces.o
  AR      drivers/net/ethernet/meta/built-in.a
  CC      kernel/audit_watch.o
  CC      drivers/md/dm-builtin.o
  AR      drivers/net/ethernet/micrel/built-in.a
  CC      drivers/gpu/drm/drm_syncobj.o
  AR      drivers/cpufreq/built-in.a
  AR      net/ipv6/built-in.a
  CC      net/mac80211/wbrf.o
  CC      drivers/gpu/drm/i915/gt/gen8_ppgtt.o
  CC      drivers/acpi/acpica/utcksum.o
  CC      arch/x86/kernel/hpet.o
  CC      drivers/net/ethernet/intel/e1000e/nvm.o
  CC      kernel/audit_fsnotify.o
  CC      drivers/acpi/ioapic.o
  CC      drivers/gpu/drm/i915/gt/intel_breadcrumbs.o
  CC      lib/glob.o
  CC      drivers/acpi/acpica/utcopy.o
  AR      drivers/net/ethernet/microchip/built-in.a
  CC      drivers/acpi/acpica/utexcep.o
  CC      drivers/hid/hid-input.o
  CC      drivers/acpi/battery.o
  AR      drivers/platform/x86/built-in.a
  AR      drivers/platform/built-in.a
  CC      arch/x86/kernel/amd_nb.o
  CC      lib/strncpy_from_user.o
  CC      lib/strnlen_user.o
  CC      drivers/net/ethernet/intel/e1000e/phy.o
  CC      net/ipv4/ipmr.o
  AR      drivers/nvmem/built-in.a
  CC      drivers/acpi/acpica/utdebug.o
  CC      drivers/hid/hid-quirks.o
  CC      lib/net_utils.o
  CC      drivers/hid/hid-debug.o
  CC      kernel/audit_tree.o
  CC      drivers/firmware/efi/libstub/lib-cmdline.o
  CC      drivers/firmware/efi/capsule-loader.o
  CC      arch/x86/kernel/amd_node.o
  CC      drivers/gpu/drm/i915/gt/intel_context.o
  CC      drivers/hid/hidraw.o
  CC [M]  drivers/gpu/drm/xe/xe_guc.o
  CC      drivers/md/dm-raid1.o
  CC      drivers/firmware/efi/libstub/lib-ctype.o
  CC      drivers/gpu/drm/i915/gt/intel_context_sseu.o
  CC      drivers/firmware/efi/libstub/alignedmem.o
  CC      drivers/acpi/bgrt.o
  CC      fs/proc_namespace.o
  CC      drivers/gpu/drm/drm_sysfs.o
  CC      lib/sg_pool.o
  CC      drivers/acpi/acpica/utdecode.o
  CC      drivers/acpi/acpica/utdelete.o
  CC      lib/stackdepot.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_ads.o
  CC      arch/x86/kernel/kvm.o
  CC      lib/asn1_decoder.o
  CC      drivers/firmware/efi/earlycon.o
  GEN     lib/oid_registry_data.c
  CC      drivers/md/dm-log.o
  CC      fs/direct-io.o
  CC      arch/x86/kernel/kvmclock.o
  CC      fs/eventpoll.o
  CC      fs/anon_inodes.o
  CC      net/ipv4/ipmr_base.o
  AR      drivers/net/ethernet/mscc/built-in.a
  CC      fs/signalfd.o
  CC      drivers/net/ethernet/intel/e1000e/param.o
  CC      drivers/gpu/drm/drm_trace_points.o
  CC      drivers/firmware/efi/libstub/relocate.o
  CC      kernel/kprobes.o
  CC      drivers/md/dm-region-hash.o
  CC      drivers/acpi/spcr.o
  CC      arch/x86/kernel/paravirt.o
  CC      drivers/acpi/acpica/uterror.o
  CC      drivers/net/ethernet/intel/e1000e/ethtool.o
  CC      lib/ucs2_string.o
  CC      arch/x86/kernel/pvclock.o
  CC      net/ipv4/syncookies.o
  AR      drivers/net/ethernet/myricom/built-in.a
  CC      fs/timerfd.o
  CC      lib/sbitmap.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_buf.o
  CC      drivers/firmware/efi/libstub/printk.o
  CC      drivers/gpu/drm/drm_vblank.o
  AR      drivers/net/ethernet/intel/e1000/built-in.a
  CC      drivers/acpi/acpica/uteval.o
  CC      lib/group_cpus.o
  CC      drivers/hid/hid-generic.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_capture.o
  CC      drivers/gpu/drm/i915/gt/intel_engine_cs.o
  CC      drivers/md/dm-zero.o
  AR      drivers/net/ethernet/natsemi/built-in.a
  CC      lib/fw_table.o
  CC      drivers/firmware/efi/libstub/vsprintf.o
  CC      drivers/gpu/drm/drm_vblank_work.o
  CC      drivers/net/ethernet/intel/e1000e/netdev.o
  CC      arch/x86/kernel/pcspeaker.o
  CC      fs/eventfd.o
  CC      net/ipv4/tunnel4.o
  AR      drivers/firmware/efi/built-in.a
  CC      drivers/firmware/efi/libstub/x86-stub.o
  CC      drivers/gpu/drm/drm_vma_manager.o
  CC      kernel/seccomp.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_ct.o
  CC      drivers/firmware/efi/libstub/smbios.o
  AR      drivers/net/ethernet/neterion/built-in.a
  AR      drivers/net/ethernet/netronome/built-in.a
  CC      drivers/acpi/acpica/utglobal.o
  CC      drivers/gpu/drm/i915/gt/intel_engine_heartbeat.o
  CC      net/ipv4/ipconfig.o
  STUBCPY drivers/firmware/efi/libstub/alignedmem.stub.o
  CC      drivers/net/ethernet/intel/e1000e/ptp.o
  CC      drivers/gpu/drm/i915/gt/intel_engine_pm.o
  CC      drivers/gpu/drm/drm_writeback.o
  CC      fs/aio.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_db_mgr.o
  CC      drivers/hid/hid-a4tech.o
  STUBCPY drivers/firmware/efi/libstub/efi-stub-helper.stub.o
  AR      drivers/net/ethernet/ni/built-in.a
  CC      net/ipv4/netfilter.o
  CC      kernel/relay.o
  CC      drivers/gpu/drm/i915/gt/intel_engine_user.o
  CC      drivers/acpi/acpica/uthex.o
  CC      drivers/hid/hid-apple.o
  CC      drivers/net/ethernet/nvidia/forcedeth.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_engine_activity.o
  CC      drivers/hid/hid-belkin.o
  CC      arch/x86/kernel/check.o
  CC      arch/x86/kernel/uprobes.o
  AR      lib/lib.a
  AR      drivers/md/built-in.a
  CC      fs/locks.o
  CC      kernel/utsname_sysctl.o
  CC      drivers/gpu/drm/drm_panel.o
  AR      drivers/net/ethernet/oki-semi/built-in.a
  AR      drivers/net/ethernet/packetengines/built-in.a
  CC      drivers/acpi/acpica/utids.o
  CC      kernel/delayacct.o
  GEN     lib/crc32table.h
  CC      arch/x86/kernel/perf_regs.o
  CC      lib/oid_registry.o
  CC      drivers/gpu/drm/i915/gt/intel_execlists_submission.o
  CC      drivers/hid/hid-cherry.o
  CC      net/ipv4/tcp_cubic.o
  STUBCPY drivers/firmware/efi/libstub/file.stub.o
  CC      drivers/acpi/acpica/utinit.o
  CC      drivers/gpu/drm/drm_pci.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_hwconfig.o
  AR      net/mac80211/built-in.a
  CC      net/ipv4/tcp_sigpool.o
  AR      drivers/net/ethernet/qlogic/built-in.a
  CC      drivers/acpi/acpica/utlock.o
  AR      drivers/net/ethernet/qualcomm/emac/built-in.a
  AR      drivers/net/ethernet/qualcomm/built-in.a
  CC      fs/binfmt_misc.o
  CC      drivers/hid/hid-chicony.o
  CC      kernel/taskstats.o
  STUBCPY drivers/firmware/efi/libstub/gop.stub.o
  STUBCPY drivers/firmware/efi/libstub/lib-cmdline.stub.o
  STUBCPY drivers/firmware/efi/libstub/lib-ctype.stub.o
  STUBCPY drivers/firmware/efi/libstub/mem.stub.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_id_mgr.o
  STUBCPY drivers/firmware/efi/libstub/pci.stub.o
  STUBCPY drivers/firmware/efi/libstub/printk.stub.o
  CC      drivers/gpu/drm/i915/gt/intel_ggtt.o
  CC      lib/crc32.o
  STUBCPY drivers/firmware/efi/libstub/random.stub.o
  STUBCPY drivers/firmware/efi/libstub/randomalloc.stub.o
  STUBCPY drivers/firmware/efi/libstub/relocate.stub.o
  CC      drivers/hid/hid-cypress.o
  STUBCPY drivers/firmware/efi/libstub/secureboot.stub.o
  CC      drivers/net/ethernet/realtek/8139too.o
  STUBCPY drivers/firmware/efi/libstub/skip_spaces.stub.o
  STUBCPY drivers/firmware/efi/libstub/smbios.stub.o
  STUBCPY drivers/firmware/efi/libstub/tpm.stub.o
  STUBCPY drivers/firmware/efi/libstub/vsprintf.stub.o
  STUBCPY drivers/firmware/efi/libstub/x86-stub.stub.o
  CC      drivers/hid/hid-ezkey.o
  AR      drivers/firmware/efi/libstub/lib.a
  CC      drivers/net/ethernet/realtek/r8169_main.o
  CC      kernel/tsacct.o
  CC      fs/binfmt_script.o
  CC      drivers/gpu/drm/i915/gt/intel_ggtt_fencing.o
  AR      drivers/firmware/built-in.a
  CC      drivers/gpu/drm/drm_debugfs.o
  CC      drivers/acpi/acpica/utmath.o
  CC      drivers/acpi/acpica/utmisc.o
  CC      kernel/tracepoint.o
  AR      drivers/net/ethernet/marvell/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_guc_klv_helpers.o
  CC      drivers/hid/hid-gyration.o
  CC      kernel/irq_work.o
  CC      drivers/gpu/drm/drm_debugfs_crc.o
  CC      arch/x86/kernel/tracepoint.o
  CC      drivers/gpu/drm/i915/gt/intel_gt.o
  AR      drivers/net/ethernet/renesas/built-in.a
  CC      net/ipv4/cipso_ipv4.o
  CC      drivers/net/ethernet/realtek/r8169_firmware.o
  CC      drivers/hid/hid-ite.o
  CC      drivers/gpu/drm/drm_panel_orientation_quirks.o
  CC      drivers/net/ethernet/realtek/r8169_phy_config.o
  AR      lib/built-in.a
  CC      arch/x86/kernel/itmt.o
  CC      kernel/static_call.o
  CC      drivers/hid/hid-kensington.o
  CC      drivers/acpi/acpica/utmutex.o
  CC      arch/x86/kernel/umip.o
  AR      drivers/net/ethernet/rdc/built-in.a
  CC      arch/x86/kernel/unwind_frame.o
  CC      kernel/padata.o
  CC      net/ipv4/xfrm4_policy.o
  CC      drivers/acpi/acpica/utnonansi.o
  CC      drivers/hid/hid-lg.o
  CC      drivers/hid/hid-lgff.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_log.o
  CC      kernel/jump_label.o
  CC      drivers/gpu/drm/drm_buddy.o
  AR      drivers/net/ethernet/rocker/built-in.a
  CC      fs/binfmt_elf.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.o
  CC      drivers/acpi/acpica/utobject.o
  CC      drivers/hid/hid-lg4ff.o
  CC      net/ipv4/xfrm4_state.o
  CC      drivers/gpu/drm/drm_gem_shmem_helper.o
  CC      drivers/acpi/acpica/utosi.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_pc.o
  CC      kernel/context_tracking.o
  CC      fs/mbcache.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_submit.o
  CC      fs/posix_acl.o
  CC      net/ipv4/xfrm4_input.o
  CC      kernel/iomem.o
  CC [M]  drivers/gpu/drm/xe/xe_heci_gsc.o
  CC      fs/coredump.o
  CC      drivers/hid/hid-lg-g15.o
  AR      drivers/net/ethernet/samsung/built-in.a
  CC      drivers/gpu/drm/drm_atomic_helper.o
  CC      kernel/rseq.o
  CC      net/ipv4/xfrm4_output.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.o
  CC      drivers/acpi/acpica/utownerid.o
  CC      net/ipv4/xfrm4_protocol.o
  CC [M]  drivers/gpu/drm/xe/xe_huc.o
  CC      fs/drop_caches.o
  AR      drivers/net/ethernet/seeq/built-in.a
  CC      fs/sysctls.o
  CC      fs/fhandle.o
  CC      drivers/acpi/acpica/utpredef.o
  CC      drivers/hid/hid-microsoft.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_clock_utils.o
  CC      drivers/acpi/acpica/utresdecode.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine.o
  AR      arch/x86/kernel/built-in.a
  AR      arch/x86/built-in.a
  AR      drivers/net/ethernet/silan/built-in.a
  CC      drivers/hid/hid-monterey.o
  CC      drivers/gpu/drm/drm_atomic_state_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.o
  CC      drivers/acpi/acpica/utresrc.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_debugfs.o
  CC      drivers/gpu/drm/drm_crtc_helper.o
  AR      drivers/net/ethernet/sis/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_hw_engine_group.o
  AR      drivers/net/ethernet/sfc/built-in.a
  CC      drivers/hid/hid-ntrig.o
  CC      drivers/hid/hid-pl.o
  CC      drivers/acpi/acpica/utstate.o
  CC [M]  drivers/gpu/drm/xe/xe_hw_fence.o
  CC      drivers/gpu/drm/drm_damage_helper.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.o
  CC      drivers/gpu/drm/drm_flip_work.o
  CC [M]  drivers/gpu/drm/xe/xe_irq.o
  CC      drivers/hid/hid-petalynx.o
  CC      drivers/acpi/acpica/utstring.o
  AR      drivers/net/ethernet/smsc/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_lrc.o
  CC      drivers/hid/hid-redragon.o
  CC      drivers/gpu/drm/drm_format_helper.o
  CC      drivers/gpu/drm/drm_gem_atomic_helper.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_irq.o
  CC      drivers/hid/hid-samsung.o
  CC [M]  drivers/gpu/drm/xe/xe_migrate.o
  CC      drivers/acpi/acpica/utstrsuppt.o
  CC      drivers/gpu/drm/drm_gem_framebuffer_helper.o
  AR      drivers/net/ethernet/socionext/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_gt_mcr.o
  AR      kernel/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_mmio.o
  CC      drivers/hid/hid-sony.o
  CC      drivers/acpi/acpica/utstrtoul64.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_pm.o
  CC [M]  drivers/gpu/drm/xe/xe_mocs.o
  CC      drivers/hid/hid-sunplus.o
  CC      drivers/gpu/drm/drm_kms_helper_common.o
  CC      drivers/acpi/acpica/utxface.o
  AR      drivers/net/ethernet/stmicro/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.o
  AR      drivers/net/ethernet/sun/built-in.a
  CC      drivers/gpu/drm/drm_modeset_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_module.o
  AR      drivers/net/ethernet/tehuti/built-in.a
  CC      drivers/acpi/acpica/utxfinit.o
  CC      drivers/hid/hid-topseed.o
  CC      drivers/acpi/acpica/utxferror.o
  CC [M]  drivers/gpu/drm/xe/xe_oa.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_pm_irq.o
  CC      drivers/gpu/drm/drm_plane_helper.o
  AR      net/ipv4/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_observation.o
  AR      net/built-in.a
  AR      drivers/net/ethernet/ti/built-in.a
  CC      drivers/gpu/drm/drm_probe_helper.o
  CC      drivers/acpi/acpica/utxfmutex.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_requests.o
  CC      drivers/gpu/drm/drm_self_refresh_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_pat.o
  CC [M]  drivers/gpu/drm/xe/xe_pci.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_sysfs.o
  CC      drivers/gpu/drm/drm_simple_kms_helper.o
  AR      drivers/net/ethernet/vertexcom/built-in.a
  AR      drivers/net/ethernet/via/built-in.a
  AR      drivers/net/ethernet/wangxun/built-in.a
  AR      fs/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_pcode.o
  CC      drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.o
  CC      drivers/gpu/drm/bridge/panel.o
  CC      drivers/gpu/drm/i915/gt/intel_gtt.o
  AR      drivers/net/ethernet/wiznet/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_pm.o
  CC      drivers/gpu/drm/drm_mipi_dsi.o
  CC      drivers/gpu/drm/i915/gt/intel_llc.o
  AR      drivers/net/ethernet/xilinx/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_preempt_fence.o
  CC      drivers/gpu/drm/i915/gt/intel_lrc.o
  CC [M]  drivers/gpu/drm/drm_exec.o
  AR      drivers/net/ethernet/nvidia/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_migrate.o
  AR      drivers/net/ethernet/xircom/built-in.a
  CC [M]  drivers/gpu/drm/drm_gpuvm.o
  AR      drivers/net/ethernet/synopsys/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_mocs.o
  AR      drivers/net/ethernet/pensando/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_pt.o
  CC [M]  drivers/gpu/drm/drm_suballoc.o
  AR      drivers/acpi/acpica/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_ppgtt.o
  AR      drivers/acpi/built-in.a
  CC [M]  drivers/gpu/drm/xe/xe_pt_walk.o
  CC [M]  drivers/gpu/drm/drm_gem_ttm_helper.o
  CC      drivers/gpu/drm/i915/gt/intel_rc6.o
  CC [M]  drivers/gpu/drm/xe/xe_pxp.o
  CC [M]  drivers/gpu/drm/xe/xe_pxp_debugfs.o
  CC      drivers/gpu/drm/i915/gt/intel_region_lmem.o
  CC [M]  drivers/gpu/drm/xe/xe_pxp_submit.o
  CC      drivers/gpu/drm/i915/gt/intel_renderstate.o
  CC [M]  drivers/gpu/drm/xe/xe_query.o
  CC      drivers/gpu/drm/i915/gt/intel_reset.o
  CC [M]  drivers/gpu/drm/xe/xe_range_fence.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_sr.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_whitelist.o
  CC [M]  drivers/gpu/drm/xe/xe_ring_ops.o
  CC      drivers/gpu/drm/i915/gt/intel_ring.o
  CC      drivers/gpu/drm/i915/gt/intel_ring_submission.o
  LD [M]  drivers/gpu/drm/drm_suballoc_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_rtp.o
  CC      drivers/gpu/drm/i915/gt/intel_rps.o
  CC      drivers/gpu/drm/i915/gt/intel_sa_media.o
  CC [M]  drivers/gpu/drm/xe/xe_sa.o
  CC [M]  drivers/gpu/drm/xe/xe_sched_job.o
  AR      drivers/hid/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_sseu.o
  CC [M]  drivers/gpu/drm/xe/xe_step.o
  AR      drivers/net/ethernet/realtek/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_sseu_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_survivability_mode.o
  CC [M]  drivers/gpu/drm/xe/xe_sync.o
  CC [M]  drivers/gpu/drm/xe/xe_tile.o
  CC      drivers/gpu/drm/i915/gt/intel_timeline.o
  CC [M]  drivers/gpu/drm/xe/xe_tile_sysfs.o
  CC      drivers/gpu/drm/i915/gt/intel_tlb.o
  CC [M]  drivers/gpu/drm/xe/xe_trace.o
  CC      drivers/gpu/drm/i915/gt/intel_wopcm.o
  LD [M]  drivers/gpu/drm/drm_ttm_helper.o
  CC [M]  drivers/gpu/drm/xe/xe_trace_bo.o
  CC      drivers/gpu/drm/i915/gt/intel_workarounds.o
  CC      drivers/gpu/drm/i915/gt/shmem_utils.o
  CC      drivers/gpu/drm/i915/gt/sysfs_engines.o
  CC [M]  drivers/gpu/drm/xe/xe_trace_guc.o
  AR      drivers/net/ethernet/intel/e1000e/built-in.a
  AR      drivers/net/ethernet/intel/built-in.a
  AR      drivers/net/ethernet/built-in.a
  CC      drivers/gpu/drm/i915/gt/intel_ggtt_gmch.o
  CC [M]  drivers/gpu/drm/xe/xe_trace_lrc.o
  AR      drivers/net/built-in.a
  CC      drivers/gpu/drm/i915/gt/gen6_renderstate.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.o
  CC      drivers/gpu/drm/i915/gt/gen7_renderstate.o
  CC      drivers/gpu/drm/i915/gt/gen8_renderstate.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_sys_mgr.o
  CC      drivers/gpu/drm/i915/gt/gen9_renderstate.o
  CC [M]  drivers/gpu/drm/xe/xe_ttm_vram_mgr.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_busy.o
  CC [M]  drivers/gpu/drm/xe/xe_tuning.o
  CC [M]  drivers/gpu/drm/xe/xe_uc.o
  CC [M]  drivers/gpu/drm/xe/xe_uc_fw.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_clflush.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_context.o
  CC [M]  drivers/gpu/drm/xe/xe_vm.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_create.o
  CC [M]  drivers/gpu/drm/xe/xe_vram.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_dmabuf.o
  CC [M]  drivers/gpu/drm/xe/xe_vram_freq.o
  CC [M]  drivers/gpu/drm/xe/xe_vsec.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_domain.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o
  CC [M]  drivers/gpu/drm/xe/xe_wa.o
  CC [M]  drivers/gpu/drm/xe/xe_wait_user_fence.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_internal.o
  CC [M]  drivers/gpu/drm/xe/xe_wopcm.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_lmem.o
  CC [M]  drivers/gpu/drm/xe/xe_hmm.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_mman.o
  CC [M]  drivers/gpu/drm/xe/xe_hwmon.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_object.o
  CC [M]  drivers/gpu/drm/xe/xe_pmu.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_pages.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sriov_vf.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_relay.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_phys.o
  CC [M]  drivers/gpu/drm/xe/xe_memirq.o
  CC [M]  drivers/gpu/drm/xe/xe_sriov.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_pm.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_region.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_shmem.o
  CC [M]  drivers/gpu/drm/xe/xe_sriov_vf.o
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_irq.o
  CC [M]  drivers/gpu/drm/xe/display/ext/i915_utils.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_shrinker.o
  CC [M]  drivers/gpu/drm/xe/display/intel_bo.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_stolen.o
  CC [M]  drivers/gpu/drm/xe/display/intel_fb_bo.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_throttle.o
  CC [M]  drivers/gpu/drm/xe/display/intel_fbdev_fb.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_tiling.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_ttm.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_misc.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_rps.o
  CC [M]  drivers/gpu/drm/xe/display/xe_display_wa.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_ttm_move.o
  CC [M]  drivers/gpu/drm/xe/display/xe_dsb_buffer.o
  CC [M]  drivers/gpu/drm/xe/display/xe_fb_pin.o
  CC [M]  drivers/gpu/drm/xe/display/xe_hdcp_gsc.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_userptr.o
  CC [M]  drivers/gpu/drm/xe/display/xe_plane_initial.o
  CC [M]  drivers/gpu/drm/xe/display/xe_tdf.o
  CC      drivers/gpu/drm/i915/gem/i915_gem_wait.o
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_dram.o
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_pch.o
  CC      drivers/gpu/drm/i915/gem/i915_gemfs.o
  CC      drivers/gpu/drm/i915/i915_active.o
  CC      drivers/gpu/drm/i915/i915_cmd_parser.o
  CC [M]  drivers/gpu/drm/xe/i915-soc/intel_rom.o
  CC      drivers/gpu/drm/i915/i915_deps.o
  CC      drivers/gpu/drm/i915/i915_gem.o
  CC [M]  drivers/gpu/drm/xe/i915-display/icl_dsi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_alpm.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic.o
  CC      drivers/gpu/drm/i915/i915_gem_evict.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_atomic_plane.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_audio.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_backlight.o
  CC      drivers/gpu/drm/i915/i915_gem_gtt.o
  CC      drivers/gpu/drm/i915/i915_gem_ww.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bios.o
  CC      drivers/gpu/drm/i915/i915_query.o
  CC      drivers/gpu/drm/i915/i915_request.o
  CC      drivers/gpu/drm/i915/i915_scheduler.o
  CC      drivers/gpu/drm/i915/i915_trace_points.o
  CC      drivers/gpu/drm/i915/i915_ttm_buddy_manager.o
  CC      drivers/gpu/drm/i915/i915_vma.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_bw.o
  CC      drivers/gpu/drm/i915/i915_vma_resource.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cdclk.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cmtg.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_color.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_combo_phy.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_connector.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_ads.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_capture.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_ct.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_crtc_state_dump.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cursor.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_fw.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_cx0_phy.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_log.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_rc.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_ddi_buf_trans.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_conversion.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_guc_submission.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_huc.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_device.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_huc_fw.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_uc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_driver.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.o
  CC      drivers/gpu/drm/i915/gt/uc/intel_uc_fw.o
  CC      drivers/gpu/drm/i915/gt/intel_gsc.o
  CC      drivers/gpu/drm/i915/i915_hwmon.o
  CC      drivers/gpu/drm/i915/display/hsw_ips.o
  CC      drivers/gpu/drm/i915/display/i9xx_plane.o
  CC      drivers/gpu/drm/i915/display/i9xx_display_sr.o
  CC      drivers/gpu/drm/i915/display/i9xx_wm.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_irq.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_params.o
  CC      drivers/gpu/drm/i915/display/intel_alpm.o
  CC      drivers/gpu/drm/i915/display/intel_atomic.o
  CC      drivers/gpu/drm/i915/display/intel_atomic_plane.o
  CC      drivers/gpu/drm/i915/display/intel_audio.o
  CC      drivers/gpu/drm/i915/display/intel_bios.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power.o
  CC      drivers/gpu/drm/i915/display/intel_bo.o
  CC      drivers/gpu/drm/i915/display/intel_bw.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_map.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_power_well.o
  CC      drivers/gpu/drm/i915/display/intel_cdclk.o
  CC      drivers/gpu/drm/i915/display/intel_cmtg.o
  CC      drivers/gpu/drm/i915/display/intel_color.o
  CC      drivers/gpu/drm/i915/display/intel_combo_phy.o
  CC      drivers/gpu/drm/i915/display/intel_connector.o
  CC      drivers/gpu/drm/i915/display/intel_crtc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_trace.o
  CC      drivers/gpu/drm/i915/display/intel_crtc_state_dump.o
  CC      drivers/gpu/drm/i915/display/intel_cursor.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_wa.o
  CC      drivers/gpu/drm/i915/display/intel_display.o
  CC      drivers/gpu/drm/i915/display/intel_display_conversion.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dkl_phy.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dmc.o
  CC      drivers/gpu/drm/i915/display/intel_display_driver.o
  CC      drivers/gpu/drm/i915/display/intel_display_irq.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dmc_wl.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp.o
  CC      drivers/gpu/drm/i915/display/intel_display_params.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_aux.o
  CC      drivers/gpu/drm/i915/display/intel_display_power.o
  CC      drivers/gpu/drm/i915/display/intel_display_power_map.o
  CC      drivers/gpu/drm/i915/display/intel_display_power_well.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_aux_backlight.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_hdcp.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_link_training.o
  CC      drivers/gpu/drm/i915/display/intel_display_reset.o
  CC      drivers/gpu/drm/i915/display/intel_display_rps.o
  CC      drivers/gpu/drm/i915/display/intel_display_snapshot.o
  CC      drivers/gpu/drm/i915/display/intel_display_wa.o
  CC      drivers/gpu/drm/i915/display/intel_dmc.o
  CC      drivers/gpu/drm/i915/display/intel_dmc_wl.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_mst.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dp_test.o
  CC      drivers/gpu/drm/i915/display/intel_dpio_phy.o
  CC      drivers/gpu/drm/i915/display/intel_dpll.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpll.o
  CC      drivers/gpu/drm/i915/display/intel_dpll_mgr.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpll_mgr.o
  CC      drivers/gpu/drm/i915/display/intel_dpt.o
  CC      drivers/gpu/drm/i915/display/intel_dpt_common.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dpt_common.o
  CC      drivers/gpu/drm/i915/display/intel_drrs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_drrs.o
  CC      drivers/gpu/drm/i915/display/intel_dsb.o
  CC      drivers/gpu/drm/i915/display/intel_dsb_buffer.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsb.o
  CC      drivers/gpu/drm/i915/display/intel_fb.o
  CC      drivers/gpu/drm/i915/display/intel_fb_bo.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_dcs_backlight.o
  CC      drivers/gpu/drm/i915/display/intel_fb_pin.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_dsi_vbt.o
  CC      drivers/gpu/drm/i915/display/intel_fbc.o
  CC      drivers/gpu/drm/i915/display/intel_fdi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_encoder.o
  CC      drivers/gpu/drm/i915/display/intel_fifo_underrun.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fb.o
  CC      drivers/gpu/drm/i915/display/intel_frontbuffer.o
  CC      drivers/gpu/drm/i915/display/intel_global_state.o
  CC      drivers/gpu/drm/i915/display/intel_hdcp.o
  CC      drivers/gpu/drm/i915/display/intel_hdcp_gsc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fbc.o
  CC      drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fdi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_fifo_underrun.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_frontbuffer.o
  CC      drivers/gpu/drm/i915/display/intel_hotplug.o
  CC      drivers/gpu/drm/i915/display/intel_hotplug_irq.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_global_state.o
  CC      drivers/gpu/drm/i915/display/intel_hti.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_gmbus.o
  CC      drivers/gpu/drm/i915/display/intel_link_bw.o
  CC      drivers/gpu/drm/i915/display/intel_load_detect.o
  CC      drivers/gpu/drm/i915/display/intel_lpe_audio.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdcp.o
  CC      drivers/gpu/drm/i915/display/intel_modeset_lock.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdcp_gsc_message.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hdmi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hotplug.o
  CC      drivers/gpu/drm/i915/display/intel_modeset_setup.o
  CC      drivers/gpu/drm/i915/display/intel_modeset_verify.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hotplug_irq.o
  CC      drivers/gpu/drm/i915/display/intel_overlay.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_hti.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_link_bw.o
  CC      drivers/gpu/drm/i915/display/intel_pch_display.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_lspcon.o
  CC      drivers/gpu/drm/i915/display/intel_pch_refclk.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_lock.o
  CC      drivers/gpu/drm/i915/display/intel_plane_initial.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_setup.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_modeset_verify.o
  CC      drivers/gpu/drm/i915/display/intel_pmdemand.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_panel.o
  CC      drivers/gpu/drm/i915/display/intel_psr.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pfit.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pmdemand.o
  CC      drivers/gpu/drm/i915/display/intel_quirks.o
  CC      drivers/gpu/drm/i915/display/intel_sprite.o
  CC      drivers/gpu/drm/i915/display/intel_sprite_uapi.o
  CC      drivers/gpu/drm/i915/display/intel_tc.o
  CC      drivers/gpu/drm/i915/display/intel_vblank.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pps.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_psr.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_qp_tables.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_quirks.o
  CC      drivers/gpu/drm/i915/display/intel_vga.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_snps_hdmi_pll.o
  CC      drivers/gpu/drm/i915/display/intel_wm.o
  CC      drivers/gpu/drm/i915/display/skl_scaler.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_snps_phy.o
  CC      drivers/gpu/drm/i915/display/skl_universal_plane.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_tc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vblank.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vdsc.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vga.o
  CC      drivers/gpu/drm/i915/display/skl_watermark.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_vrr.o
  CC      drivers/gpu/drm/i915/display/intel_acpi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_wm.o
  CC      drivers/gpu/drm/i915/display/intel_opregion.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_scaler.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_universal_plane.o
  CC [M]  drivers/gpu/drm/xe/i915-display/skl_watermark.o
  CC      drivers/gpu/drm/i915/display/intel_display_debugfs.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_acpi.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_opregion.o
  CC      drivers/gpu/drm/i915/display/intel_display_debugfs_params.o
  CC [M]  drivers/gpu/drm/xe/xe_debugfs.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_debugfs.o
  CC      drivers/gpu/drm/i915/display/intel_pipe_crc.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.o
  CC      drivers/gpu/drm/i915/display/dvo_ch7017.o
  CC [M]  drivers/gpu/drm/xe/xe_gt_stats.o
  CC      drivers/gpu/drm/i915/display/dvo_ch7xxx.o
  CC [M]  drivers/gpu/drm/xe/xe_guc_debugfs.o
  CC      drivers/gpu/drm/i915/display/dvo_ivch.o
  CC [M]  drivers/gpu/drm/xe/xe_huc_debugfs.o
  CC      drivers/gpu/drm/i915/display/dvo_ns2501.o
  CC [M]  drivers/gpu/drm/xe/xe_uc_debugfs.o
  CC      drivers/gpu/drm/i915/display/dvo_sil164.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs.o
  CC      drivers/gpu/drm/i915/display/dvo_tfp410.o
  CC      drivers/gpu/drm/i915/display/g4x_dp.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_display_debugfs_params.o
  CC [M]  drivers/gpu/drm/xe/i915-display/intel_pipe_crc.o
  CC      drivers/gpu/drm/i915/display/g4x_hdmi.o
  CC      drivers/gpu/drm/i915/display/icl_dsi.o
  CC      drivers/gpu/drm/i915/display/intel_backlight.o
  CC      drivers/gpu/drm/i915/display/intel_crt.o
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
  CC      drivers/gpu/drm/i915/display/intel_dp_mst.o
  CC      drivers/gpu/drm/i915/display/intel_dp_test.o
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
  CC [M]  drivers/gpu/drm/drm_suballoc_helper.mod.o
  CC [M]  drivers/gpu/drm/drm_gpuvm.mod.o
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
  LD [M]  drivers/gpu/drm/drm_exec.ko
  LD [M]  drivers/gpu/drm/drm_gpuvm.ko
  LD [M]  drivers/gpu/drm/drm_suballoc_helper.ko
  LD [M]  drivers/gpu/drm/drm_ttm_helper.ko
  LD [M]  drivers/gpu/drm/scheduler/gpu-sched.ko
  LD [M]  drivers/gpu/drm/xe/xe.ko
  LD [M]  drivers/thermal/intel/x86_pkg_temp_thermal.ko
  LD [M]  net/netfilter/nf_log_syslog.ko
  LD [M]  net/netfilter/xt_mark.ko
  LD [M]  net/netfilter/xt_nat.ko
  LD [M]  net/netfilter/xt_LOG.ko
  LD [M]  net/netfilter/xt_MASQUERADE.ko
  LD [M]  net/netfilter/xt_addrtype.ko
  LD [M]  net/ipv4/netfilter/iptable_nat.ko
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


