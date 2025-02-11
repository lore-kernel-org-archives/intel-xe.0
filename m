Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1825EC021A2
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 12:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66E010E6AA;
	Tue, 11 Feb 2025 12:10:44 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DD110E6A9;
 Tue, 11 Feb 2025 12:10:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_drm=5Fi915=5Fprivate_to_intel?=
 =?utf-8?q?=5Fdisplay_cleanup_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Feb 2025 12:10:42 -0000
Message-ID: <173927584267.895660.10538060530254720496@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250211104857.3501566-1-suraj.kandpal@intel.com>
In-Reply-To: <20250211104857.3501566-1-suraj.kandpal@intel.com>
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

Series: drm_i915_private to intel_display cleanup (rev2)
URL   : https://patchwork.freedesktop.org/series/144587/
State : failure

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
mkdir -p /workspace/kernel/build64-default/tools/objtool && make O=/workspace/kernel/build64-default subdir=tools/objtool --no-print-directory -C objtool 
  INSTALL libsubcmd_headers
  CALL    ../scripts/checksyscalls.sh
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
  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
  GEN     Makefile
  WRAP    arch/x86/include/generated/uapi/asm/errno.h
  WRAP    arch/x86/include/generated/uapi/asm/fcntl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctls.h
  WRAP    arch/x86/include/generated/uapi/asm/ipcbuf.h
  WRAP    arch/x86/include/generated/uapi/asm/param.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  UPD     include/generated/uapi/linux/version.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  WRAP    arch/x86/include/generated/uapi/asm/resource.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  WRAP    arch/x86/include/generated/uapi/asm/socket.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  WRAP    arch/x86/include/generated/uapi/asm/sockios.h
  WRAP    arch/x86/include/generated/uapi/asm/termbits.h
  WRAP    arch/x86/include/generated/uapi/asm/termios.h
  WRAP    arch/x86/include/generated/uapi/asm/types.h
  UPD     include/generated/compile.h
  HOSTCC  arch/x86/tools/relocs_32.o
  WRAP    arch/x86/include/generated/asm/early_ioremap.h
  HOSTCC  arch/x86/tools/relocs_64.o
  WRAP    arch/x86/include/generated/asm/fprobe.h
  WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
  HOSTCC  arch/x86/tools/relocs_common.o
  WRAP    arch/x86/include/generated/asm/mmzone.h
  WRAP    arch/x86/include/generated/asm/irq_regs.h
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
  CC      init/main.o
  HOSTCC  usr/gen_init_cpio
  CC      init/do_mounts.o
  CC      certs/system_keyring.o
  CC      init/do_mounts_initrd.o
  UPD     init/utsversion-tmp.h
  CC      ipc/util.o
  CC      init/initramfs.o
  CC      init/calibrate.o
  CC      ipc/msgutil.o
  CC      init/init_task.o
  CC      security/commoncap.o
  CC      ipc/msg.o
  CC      mm/filemap.o
  CC      io_uring/io_uring.o
  AS      arch/x86/lib/atomic64_cx8_32.o
  CC      security/lsm_syscalls.o
  CC      ipc/sem.o
  CC      init/version.o
  CC      mm/mempool.o
  CC      block/bdev.o
  CC      arch/x86/pci/i386.o
  AS      arch/x86/lib/checksum_32.o
  CC      arch/x86/realmode/init.o
  CC      arch/x86/power/cpu.o
  CC      arch/x86/video/video-common.o
  AR      arch/x86/crypto/built-in.a
  AR      arch/x86/net/built-in.a
  HOSTCC  security/selinux/genheaders
  CC      security/integrity/iint.o
  CC      block/partitions/core.o
  AR      virt/lib/built-in.a
  CC      security/keys/gc.o
  CC      fs/nfs_common/nfsacl.o
  CC      arch/x86/events/amd/core.o
  AR      drivers/cache/built-in.a
  CC      net/ethernet/eth.o
  CC      fs/iomap/trace.o
  CC      block/partitions/msdos.o
  AR      arch/x86/platform/atom/built-in.a
  CC      block/fops.o
  CC      net/core/sock.o
  CC      arch/x86/mm/pat/set_memory.o
  CC      fs/notify/dnotify/dnotify.o
  CC      lib/math/div64.o
  CC      arch/x86/virt/svm/cmdline.o
  CC      arch/x86/kernel/fpu/init.o
  AR      virt/built-in.a
  AR      drivers/irqchip/built-in.a
  CC      sound/core/seq/seq.o
  AR      arch/x86/platform/ce4100/built-in.a
  CC      arch/x86/entry/vdso/vma.o
  CC      arch/x86/platform/efi/memmap.o
  CC      arch/x86/lib/cmdline.o
  AR      drivers/pwm/built-in.a
  AS      arch/x86/realmode/rm/header.o
  AR      drivers/bus/mhi/built-in.a
  CC      arch/x86/events/amd/lbr.o
  CC      kernel/sched/core.o
  AR      drivers/bus/built-in.a
  AS      arch/x86/realmode/rm/trampoline_32.o
  CC      crypto/asymmetric_keys/asymmetric_type.o
  AR      drivers/leds/trigger/built-in.a
  AR      drivers/leds/blink/built-in.a
  AS      arch/x86/realmode/rm/stack.o
  AR      drivers/leds/simple/built-in.a
  CC      drivers/leds/led-core.o
  AS      arch/x86/realmode/rm/reboot.o
  AR      arch/x86/virt/svm/built-in.a
  AR      arch/x86/virt/vmx/built-in.a
  AS      arch/x86/realmode/rm/wakeup_asm.o
  AS      arch/x86/lib/cmpxchg8b_emu.o
  AR      arch/x86/virt/built-in.a
  CC      arch/x86/lib/cpu.o
  CC      lib/math/gcd.o
  CC      fs/notify/inotify/inotify_fsnotify.o
  CC      arch/x86/realmode/rm/wakemain.o
  GEN     security/selinux/flask.h security/selinux/av_permissions.h
  CC      security/selinux/avc.o
  CC      arch/x86/events/amd/ibs.o
  CC      lib/math/lcm.o
  CC      arch/x86/realmode/rm/video-mode.o
  CC      lib/math/int_log.o
  CC      security/min_addr.o
  GEN     usr/initramfs_data.cpio
  COPY    usr/initramfs_inc_data
  AS      usr/initramfs_data.o
  AS      arch/x86/realmode/rm/copy.o
  HOSTCC  certs/extract-cert
  AR      usr/built-in.a
  CC      lib/math/int_pow.o
  CC      arch/x86/kernel/fpu/bugs.o
  CC      lib/math/int_sqrt.o
  AS      arch/x86/realmode/rm/bioscall.o
  CC      arch/x86/realmode/rm/regs.o
  CC      arch/x86/events/amd/uncore.o
  CC      lib/math/reciprocal_div.o
  CC      arch/x86/realmode/rm/video-vga.o
  CC      arch/x86/kernel/fpu/core.o
  CC      arch/x86/realmode/rm/video-vesa.o
  CC      arch/x86/lib/delay.o
  CC      lib/math/rational.o
  CC      sound/core/seq/seq_lock.o
  CC      fs/quota/dquot.o
  AR      arch/x86/video/built-in.a
  CC      arch/x86/realmode/rm/video-bios.o
  CC      arch/x86/power/hibernate_32.o
  CERT    certs/x509_certificate_list
  CERT    certs/signing_key.x509
  CC      block/partitions/efi.o
  AS      certs/system_certificates.o
  CC      fs/notify/inotify/inotify_user.o
  CC      drivers/leds/led-class.o
  AR      certs/built-in.a
  PASYMS  arch/x86/realmode/rm/pasyms.h
  CC      fs/nfs_common/grace.o
  CC      security/integrity/integrity_audit.o
  CC      kernel/locking/mutex.o
  CC      kernel/power/qos.o
  CC      arch/x86/kernel/fpu/regset.o
  CC      kernel/printk/printk.o
  LDS     arch/x86/realmode/rm/realmode.lds
  LD      arch/x86/realmode/rm/realmode.elf
  CC      net/core/request_sock.o
  CC      crypto/asymmetric_keys/restrict.o
  CC      arch/x86/pci/init.o
  RELOCS  arch/x86/realmode/rm/realmode.relocs
  OBJCOPY arch/x86/realmode/rm/realmode.bin
  AS      arch/x86/realmode/rmpiggy.o
  CC      security/keys/key.o
  CC      arch/x86/entry/vdso/extable.o
  AR      fs/notify/dnotify/built-in.a
  CC      arch/x86/platform/efi/quirks.o
  AR      arch/x86/realmode/built-in.a
  AR      fs/notify/fanotify/built-in.a
  CC      arch/x86/pci/pcbios.o
  CC      security/keys/keyring.o
  CC      drivers/leds/led-triggers.o
  AS      arch/x86/lib/getuser.o
  CC      net/core/skbuff.o
  CC      fs/notify/fsnotify.o
  GEN     arch/x86/lib/inat-tables.c
  CC      arch/x86/lib/insn-eval.o
  CC      mm/oom_kill.o
  AR      lib/math/built-in.a
  CC      sound/core/seq/seq_clientmgr.o
  CC      lib/crypto/mpi/generic_mpih-lshift.o
  CC      arch/x86/kernel/fpu/signal.o
  CC      mm/fadvise.o
  CC      io_uring/opdef.o
  CC      kernel/irq/irqdesc.o
  AS      arch/x86/power/hibernate_asm_32.o
  CC      kernel/power/main.o
  CC      fs/iomap/iter.o
  CC      crypto/api.o
  CC      arch/x86/kernel/fpu/xstate.o
  CC      crypto/asymmetric_keys/signature.o
  CC      crypto/asymmetric_keys/public_key.o
  CC      fs/iomap/buffered-io.o
  AR      arch/x86/platform/geode/built-in.a
  CC      fs/nfs_common/common.o
  CC      arch/x86/power/hibernate.o
  CC      arch/x86/mm/pat/memtype.o
  AR      arch/x86/entry/vsyscall/built-in.a
  CC      sound/core/sound.o
  CC      sound/core/init.o
  AR      net/ethernet/built-in.a
  CC      arch/x86/lib/insn.o
  CC      arch/x86/platform/efi/efi.o
  AR      security/integrity/built-in.a
  CC      arch/x86/kernel/cpu/mce/core.o
  AR      init/built-in.a
  CC      lib/zlib_inflate/inffast.o
  CC      arch/x86/pci/mmconfig_32.o
  CC      arch/x86/kernel/cpu/mtrr/mtrr.o
  CC      lib/crypto/mpi/generic_mpih-mul1.o
  AR      block/partitions/built-in.a
  CC      block/bio.o
  LDS     arch/x86/entry/vdso/vdso32/vdso32.lds
  AR      arch/x86/events/amd/built-in.a
  AR      drivers/leds/built-in.a
  AS      arch/x86/entry/vdso/vdso32/note.o
  CC      arch/x86/events/intel/core.o
  CC      drivers/pci/msi/pcidev_msi.o
  AS      arch/x86/entry/vdso/vdso32/system_call.o
  AS      arch/x86/entry/vdso/vdso32/sigreturn.o
  AR      fs/notify/inotify/built-in.a
  CC      arch/x86/entry/vdso/vdso32/vclock_gettime.o
  CC      arch/x86/kernel/cpu/microcode/core.o
  CC      arch/x86/events/zhaoxin/core.o
  CC      lib/zlib_inflate/inflate.o
  CC      security/selinux/hooks.o
  CC      mm/maccess.o
  CC      ipc/shm.o
  AR      arch/x86/platform/iris/built-in.a
  CC      fs/notify/notification.o
  CC      arch/x86/events/core.o
  CC      kernel/printk/printk_safe.o
  CC      sound/core/memory.o
  CC      arch/x86/lib/kaslr.o
  CC      arch/x86/lib/memcpy_32.o
  CC      kernel/irq/handle.o
  AS      arch/x86/entry/entry.o
  CC      ipc/syscall.o
  CC      arch/x86/kernel/cpu/mtrr/if.o
  CC      kernel/rcu/update.o
  CC      arch/x86/mm/pat/memtype_interval.o
  CC      arch/x86/platform/intel/iosf_mbi.o
  ASN.1   crypto/asymmetric_keys/x509.asn1.[ch]
  ASN.1   crypto/asymmetric_keys/x509_akid.asn1.[ch]
  CC      crypto/asymmetric_keys/x509_loader.o
  CC      mm/page-writeback.o
  CC      kernel/locking/semaphore.o
  AS      arch/x86/lib/memmove_32.o
  AR      fs/nfs_common/built-in.a
  CC      kernel/locking/rwsem.o
  CC      ipc/ipc_sysctl.o
  CC      arch/x86/lib/misc.o
  AR      arch/x86/power/built-in.a
  CC      fs/notify/group.o
  CC      security/keys/keyctl.o
  CC      crypto/cipher.o
  CC      arch/x86/lib/pc-conf-reg.o
  CC      crypto/asymmetric_keys/x509_public_key.o
  CC      lib/crypto/mpi/generic_mpih-mul2.o
  CC      arch/x86/pci/direct.o
  AS      arch/x86/lib/putuser.o
  CC      drivers/pci/msi/api.o
  CC      arch/x86/events/probe.o
  AS      arch/x86/lib/retpoline.o
  CC      sound/core/seq/seq_memory.o
  CC      kernel/power/console.o
  CC      arch/x86/lib/string_32.o
  CC      lib/crypto/memneq.o
  CC      kernel/irq/manage.o
  CC      lib/zlib_inflate/infutil.o
  CC      arch/x86/lib/strstr_32.o
  CC      kernel/irq/spurious.o
  CC      arch/x86/kernel/cpu/microcode/intel.o
  AR      net/802/built-in.a
  CC      drivers/pci/pcie/portdrv.o
  CC      arch/x86/entry/vdso/vdso32/vgetcpu.o
  CC      drivers/video/console/dummycon.o
  AR      arch/x86/kernel/fpu/built-in.a
  CC      drivers/video/backlight/backlight.o
  CC      arch/x86/lib/usercopy.o
  CC      lib/crypto/mpi/generic_mpih-mul3.o
  CC      arch/x86/platform/efi/efi_32.o
  ASN.1   crypto/asymmetric_keys/pkcs7.asn1.[ch]
  CC      kernel/power/process.o
  HOSTCC  arch/x86/entry/vdso/vdso2c
  CC      arch/x86/kernel/cpu/mtrr/generic.o
  AR      arch/x86/mm/pat/built-in.a
  CC      arch/x86/lib/usercopy_32.o
  CC      arch/x86/mm/init.o
  AR      drivers/idle/built-in.a
  CC      net/sched/sch_generic.o
  CC      fs/quota/quota_v2.o
  CC      arch/x86/kernel/acpi/boot.o
  AR      arch/x86/events/zhaoxin/built-in.a
  CC      security/selinux/selinuxfs.o
  CC      kernel/irq/resend.o
  AR      arch/x86/platform/intel/built-in.a
  AR      drivers/char/ipmi/built-in.a
  CC      lib/zlib_inflate/inftrees.o
  CC      lib/crypto/mpi/generic_mpih-rshift.o
  CC      fs/notify/mark.o
  CC      security/selinux/netlink.o
  CC      lib/crypto/utils.o
  CC      crypto/asymmetric_keys/pkcs7_trust.o
  CC      crypto/asymmetric_keys/pkcs7_verify.o
  CC      drivers/pci/msi/msi.o
  AR      kernel/livepatch/built-in.a
  CC      arch/x86/lib/msr-smp.o
  CC      kernel/locking/percpu-rwsem.o
  CC      lib/zlib_inflate/inflate_syms.o
  CC      fs/proc/task_mmu.o
  CC      net/sched/sch_mq.o
  CC      arch/x86/entry/vdso/vdso32-setup.o
  CC      arch/x86/pci/mmconfig-shared.o
  CC      arch/x86/kernel/cpu/cacheinfo.o
  CC      drivers/video/console/vgacon.o
  CC      arch/x86/kernel/cpu/mtrr/cleanup.o
  CC      ipc/mqueue.o
  AS      arch/x86/entry/entry_32.o
  CC      io_uring/kbuf.o
  CC      kernel/printk/nbcon.o
  CC      block/elevator.o
  CC      arch/x86/mm/init_32.o
  CC      crypto/compress.o
  CC      arch/x86/lib/cache-smp.o
  CC      arch/x86/kernel/acpi/sleep.o
  AS      arch/x86/kernel/acpi/wakeup_32.o
  CC      security/security.o
  CC      sound/core/seq/seq_queue.o
  AS      arch/x86/platform/efi/efi_stub_32.o
  CC      arch/x86/platform/efi/runtime-map.o
  CC      crypto/asymmetric_keys/x509.asn1.o
  VDSO    arch/x86/entry/vdso/vdso32.so.dbg
  CC      arch/x86/kernel/cpu/microcode/amd.o
  AR      lib/zlib_inflate/built-in.a
  CC      crypto/asymmetric_keys/x509_akid.asn1.o
  CC      arch/x86/mm/fault.o
  CC      net/core/datagram.o
  CC      drivers/pci/pcie/rcec.o
  OBJCOPY arch/x86/entry/vdso/vdso32.so
  CC      crypto/asymmetric_keys/x509_cert_parser.o
  VDSO2C  arch/x86/entry/vdso/vdso-image-32.c
  CC      arch/x86/entry/vdso/vdso-image-32.o
  CC      arch/x86/lib/crc32-glue.o
  AR      drivers/video/backlight/built-in.a
  CC      fs/quota/quota_tree.o
  CC      net/core/stream.o
  CC      fs/iomap/direct-io.o
  CC      lib/crypto/mpi/generic_mpih-sub1.o
  CC      security/keys/permission.o
  CC      arch/x86/kernel/cpu/mce/severity.o
  CC      kernel/locking/spinlock.o
  CC      kernel/power/suspend.o
  CC      kernel/locking/osq_lock.o
  CC      kernel/sched/fair.o
  AR      arch/x86/entry/vdso/built-in.a
  CC      arch/x86/entry/syscall_32.o
  CC      arch/x86/entry/common.o
  CC      fs/notify/fdinfo.o
  CC      sound/core/control.o
  AS      arch/x86/lib/crc32-pclmul.o
  CC      arch/x86/lib/msr.o
  CC      kernel/printk/printk_ringbuffer.o
  CC      kernel/irq/chip.o
  CC      arch/x86/kernel/cpu/mtrr/amd.o
  CC      drivers/pci/msi/irqdomain.o
  CC      drivers/acpi/acpica/dsargs.o
  CC      mm/folio-compat.o
  CC      kernel/locking/qspinlock.o
  CC      crypto/asymmetric_keys/pkcs7.asn1.o
  CC      arch/x86/kernel/acpi/cstate.o
  CC      drivers/pnp/pnpacpi/core.o
  CC      drivers/pnp/core.o
  CC      arch/x86/pci/fixup.o
  CC      crypto/asymmetric_keys/pkcs7_parser.o
  AR      sound/i2c/other/built-in.a
  AR      sound/i2c/built-in.a
  CC      lib/crypto/mpi/generic_mpih-add1.o
  CC      drivers/pci/pcie/bwctrl.o
  CC      drivers/pnp/pnpacpi/rsparser.o
  CC      sound/core/seq/seq_fifo.o
  CC      lib/crypto/chacha.o
  AR      arch/x86/platform/efi/built-in.a
  AR      arch/x86/platform/intel-mid/built-in.a
  CC      lib/crypto/aes.o
  AR      drivers/video/console/built-in.a
  AR      arch/x86/platform/intel-quark/built-in.a
  CC      kernel/irq/dummychip.o
  AR      arch/x86/platform/olpc/built-in.a
  AR      drivers/video/fbdev/core/built-in.a
  AR      arch/x86/platform/scx200/built-in.a
  AR      drivers/video/fbdev/omap/built-in.a
  AR      arch/x86/platform/ts5500/built-in.a
  AR      arch/x86/platform/uv/built-in.a
  CC      security/keys/process_keys.o
  AR      drivers/video/fbdev/omap2/omapfb/dss/built-in.a
  AR      arch/x86/platform/built-in.a
  CC      kernel/irq/devres.o
  AR      drivers/video/fbdev/omap2/omapfb/displays/built-in.a
  AR      drivers/video/fbdev/omap2/omapfb/built-in.a
  CC      arch/x86/mm/ioremap.o
  AR      drivers/video/fbdev/omap2/built-in.a
  AR      drivers/video/fbdev/built-in.a
  CC      drivers/video/aperture.o
  CC      io_uring/rsrc.o
  AR      arch/x86/kernel/cpu/microcode/built-in.a
  CC      drivers/acpi/acpica/dscontrol.o
  CC      security/selinux/nlmsgtab.o
  CC      block/blk-core.o
  CC      arch/x86/kernel/cpu/mce/genpool.o
  CC      fs/quota/quota.o
  AR      fs/notify/built-in.a
  CC      security/selinux/netif.o
  CC      kernel/locking/rtmutex_api.o
  CC      arch/x86/kernel/cpu/mtrr/cyrix.o
  CC      mm/readahead.o
  CC      sound/core/seq/seq_prioq.o
  CC      fs/iomap/fiemap.o
  AR      arch/x86/kernel/acpi/built-in.a
  AR      crypto/asymmetric_keys/built-in.a
  CC      kernel/power/hibernate.o
  CC      crypto/algapi.o
  CC      kernel/rcu/sync.o
  CC      net/netlink/af_netlink.o
  CC      kernel/rcu/srcutree.o
  CC      kernel/printk/sysctl.o
  CC      kernel/rcu/tree.o
  CC      lib/crypto/mpi/mpicoder.o
  CC      kernel/power/snapshot.o
  CC      crypto/scatterwalk.o
  AS      arch/x86/lib/msr-reg.o
  CC      arch/x86/lib/msr-reg-export.o
  AR      drivers/pci/msi/built-in.a
  CC      ipc/namespace.o
  CC      lib/crypto/mpi/mpi-add.o
  CC      kernel/power/swap.o
  AS      arch/x86/entry/thunk.o
  CC      lib/crypto/mpi/mpi-bit.o
  CC      sound/core/misc.o
  CC      drivers/acpi/acpica/dsdebug.o
  CC      security/keys/request_key.o
  CC      net/sched/sch_frag.o
  CC      sound/core/device.o
  AR      arch/x86/entry/built-in.a
  CC      security/lsm_audit.o
  CC      drivers/pci/pcie/aspm.o
  CC      fs/proc/inode.o
  CC      net/netlink/genetlink.o
  CC      kernel/irq/kexec.o
  AS      arch/x86/lib/hweight.o
  CC      arch/x86/pci/acpi.o
  CC      arch/x86/lib/iomem.o
  AR      drivers/pnp/pnpacpi/built-in.a
  AR      kernel/printk/built-in.a
  CC      arch/x86/kernel/cpu/mce/intel.o
  CC      security/keys/request_key_auth.o
  CC      drivers/pnp/card.o
  CC      kernel/locking/qrwlock.o
  CC      arch/x86/kernel/cpu/mtrr/centaur.o
  CC      arch/x86/events/intel/bts.o
  CC      arch/x86/mm/extable.o
  CC      drivers/video/cmdline.o
  CC      drivers/acpi/acpica/dsfield.o
  CC      security/keys/user_defined.o
  CC      sound/core/seq/seq_timer.o
  CC      fs/iomap/seek.o
  CC      arch/x86/events/utils.o
  CC      ipc/mq_sysctl.o
  CC      arch/x86/pci/legacy.o
  CC      kernel/irq/autoprobe.o
  CC      arch/x86/lib/atomic64_32.o
  CC      drivers/video/nomodeset.o
  AR      net/bpf/built-in.a
  CC      arch/x86/kernel/cpu/mtrr/legacy.o
  CC      block/blk-sysfs.o
  CC      drivers/pnp/driver.o
  CC      arch/x86/lib/inat.o
  CC      kernel/irq/irqdomain.o
  CC      lib/crypto/mpi/mpi-cmp.o
  CC      kernel/dma/mapping.o
  CC      drivers/pci/pcie/pme.o
  AR      kernel/locking/built-in.a
  CC      kernel/dma/direct.o
  AR      arch/x86/lib/built-in.a
  AR      arch/x86/lib/lib.a
  CC      mm/swap.o
  CC      kernel/dma/ops_helpers.o
  CC      drivers/acpi/acpica/dsinit.o
  CC      fs/quota/kqid.o
  CC      drivers/video/hdmi.o
  CC      net/sched/sch_api.o
  CC      fs/proc/root.o
  CC      io_uring/notif.o
  CC      arch/x86/kernel/cpu/mce/amd.o
  CC      fs/quota/netlink.o
  CC      kernel/dma/remap.o
  CC      net/sched/sch_blackhole.o
  AR      ipc/built-in.a
  AR      arch/x86/kernel/cpu/mtrr/built-in.a
  CC      security/device_cgroup.o
  CC      lib/crypto/mpi/mpi-sub-ui.o
  CC      security/keys/proc.o
  CC      mm/truncate.o
  CC      security/selinux/netnode.o
  CC      net/core/scm.o
  CC      drivers/pnp/resource.o
  AR      drivers/acpi/pmic/built-in.a
  CC      net/ethtool/ioctl.o
  CC      net/ethtool/common.o
  CC      crypto/proc.o
  CC      fs/kernfs/mount.o
  CC      arch/x86/mm/mmap.o
  CC      fs/iomap/swapfile.o
  CC      arch/x86/pci/irq.o
  CC      drivers/acpi/acpica/dsmethod.o
  CC      sound/core/seq/seq_system.o
  CC      fs/sysfs/file.o
  CC      block/blk-flush.o
  CC      arch/x86/events/rapl.o
  CC      mm/vmscan.o
  CC      arch/x86/kernel/cpu/scattered.o
  CC      block/blk-settings.o
  CC      arch/x86/events/intel/ds.o
  CC      kernel/power/user.o
  CC      fs/devpts/inode.o
  AR      sound/drivers/opl3/built-in.a
  AR      sound/drivers/opl4/built-in.a
  AR      sound/drivers/mpu401/built-in.a
  AR      sound/drivers/vx/built-in.a
  AR      sound/isa/ad1816a/built-in.a
  AR      sound/drivers/pcsp/built-in.a
  AR      sound/isa/ad1848/built-in.a
  AR      sound/drivers/built-in.a
  AR      sound/isa/cs423x/built-in.a
  CC      fs/kernfs/inode.o
  AR      sound/isa/es1688/built-in.a
  AR      drivers/pci/pcie/built-in.a
  AR      sound/isa/galaxy/built-in.a
  AR      drivers/pci/pwrctrl/built-in.a
  AR      sound/isa/gus/built-in.a
  CC      drivers/acpi/acpica/dsmthdat.o
  AR      sound/isa/msnd/built-in.a
  CC      drivers/pci/hotplug/pci_hotplug_core.o
  AR      sound/isa/opti9xx/built-in.a
  AR      sound/isa/sb/built-in.a
  AR      sound/isa/wavefront/built-in.a
  AR      sound/isa/wss/built-in.a
  CC      drivers/pci/hotplug/acpi_pcihp.o
  AR      sound/isa/built-in.a
  CC      net/core/gen_stats.o
  CC      lib/crypto/mpi/mpi-div.o
  CC      kernel/power/poweroff.o
  CC      fs/proc/base.o
  CC      security/keys/sysctl.o
  CC      sound/core/info.o
  CC      fs/proc/generic.o
  CC      io_uring/tctx.o
  CC      arch/x86/events/intel/knc.o
  AR      drivers/amba/built-in.a
  AR      drivers/video/built-in.a
  CC      arch/x86/kernel/cpu/mce/threshold.o
  CC      crypto/aead.o
  CC      lib/crypto/arc4.o
  CC      arch/x86/mm/pgtable.o
  AR      fs/quota/built-in.a
  CC      arch/x86/mm/physaddr.o
  CC      kernel/irq/proc.o
  CC      sound/core/seq/seq_ports.o
  CC      fs/netfs/buffered_read.o
  CC      drivers/acpi/dptf/int340x_thermal.o
  AR      sound/pci/ac97/built-in.a
  AR      sound/pci/ali5451/built-in.a
  CC      drivers/acpi/acpica/dsobject.o
  AR      sound/pci/asihpi/built-in.a
  AR      sound/pci/au88x0/built-in.a
  AR      sound/pci/aw2/built-in.a
  AR      fs/iomap/built-in.a
  AR      sound/pci/ctxfi/built-in.a
  AR      sound/ppc/built-in.a
  CC      net/ethtool/netlink.o
  AR      sound/pci/ca0106/built-in.a
  AR      sound/arm/built-in.a
  AR      sound/pci/cs46xx/built-in.a
  CC      arch/x86/mm/tlb.o
  AR      sound/pci/cs5535audio/built-in.a
  AR      sound/pci/lola/built-in.a
  AR      sound/pci/lx6464es/built-in.a
  AR      sound/pci/echoaudio/built-in.a
  CC      drivers/acpi/x86/apple.o
  AR      sound/pci/emu10k1/built-in.a
  CC      sound/pci/hda/hda_bind.o
  AR      sound/pci/ice1712/built-in.a
  CC      sound/core/isadma.o
  CC      fs/sysfs/dir.o
  CC      drivers/acpi/acpica/dsopcode.o
  AR      kernel/power/built-in.a
  CC      lib/zlib_deflate/deflate.o
  CC      lib/lzo/lzo1x_compress.o
  CC      lib/lz4/lz4_decompress.o
  AR      fs/devpts/built-in.a
  CC      drivers/pnp/manager.o
  CC      lib/zstd/zstd_decompress_module.o
  CC      security/selinux/netport.o
  CC      drivers/acpi/tables.o
  CC      block/blk-ioc.o
  CC      security/keys/keyctl_pkey.o
  CC      lib/crypto/mpi/mpi-mod.o
  CC      lib/lzo/lzo1x_decompress_safe.o
  CC      sound/pci/hda/hda_codec.o
  CC      fs/kernfs/dir.o
  CC      fs/netfs/buffered_write.o
  AR      drivers/acpi/dptf/built-in.a
  CC      lib/zlib_deflate/deftree.o
  CC      arch/x86/kernel/apic/apic.o
  CC      arch/x86/kernel/kprobes/core.o
  CC      lib/xz/xz_dec_syms.o
  CC      net/netlink/policy.o
  AR      drivers/pci/hotplug/built-in.a
  CC      arch/x86/kernel/apic/apic_common.o
  AR      drivers/pci/controller/dwc/built-in.a
  AR      drivers/pci/controller/mobiveil/built-in.a
  AR      drivers/pci/controller/plda/built-in.a
  CC      arch/x86/pci/common.o
  AR      drivers/pci/controller/built-in.a
  AR      drivers/pci/switch/built-in.a
  CC      drivers/pci/access.o
  CC      arch/x86/kernel/apic/apic_noop.o
  LDS     arch/x86/kernel/vmlinux.lds
  CC      fs/netfs/direct_read.o
  CC      kernel/irq/migration.o
  CC      drivers/acpi/acpica/dspkginit.o
  CC      drivers/acpi/acpica/dsutils.o
  CC      net/ethtool/bitset.o
  CC      lib/zstd/decompress/huf_decompress.o
  CC      drivers/acpi/x86/cmos_rtc.o
  CC      arch/x86/kernel/cpu/topology_common.o
  CC      io_uring/filetable.o
  CC      fs/sysfs/symlink.o
  CC      crypto/geniv.o
  CC      sound/core/seq/seq_info.o
  CC      arch/x86/kernel/kprobes/opt.o
  CC      net/core/gen_estimator.o
  CC      lib/xz/xz_dec_stream.o
  AR      lib/lzo/built-in.a
  CC      lib/xz/xz_dec_lzma2.o
  AR      arch/x86/kernel/cpu/mce/built-in.a
  CC      lib/xz/xz_dec_bcj.o
  CC      drivers/pnp/support.o
  AS      arch/x86/kernel/head_32.o
  CC      lib/crypto/mpi/mpi-mul.o
  CC      drivers/pnp/interface.o
  CC      mm/shrinker.o
  AR      security/keys/built-in.a
  CC      lib/zlib_deflate/deflate_syms.o
  AR      kernel/dma/built-in.a
  CC      lib/zstd/decompress/zstd_ddict.o
  CC      arch/x86/events/intel/lbr.o
  CC      fs/kernfs/file.o
  AR      sound/sh/built-in.a
  CC      io_uring/rw.o
  CC      block/blk-map.o
  CC      drivers/acpi/acpica/dswexec.o
  CC      net/sched/cls_api.o
  CC      kernel/irq/cpuhotplug.o
  CC      net/sched/act_api.o
  CC      kernel/irq/pm.o
  CC      arch/x86/kernel/apic/ipi.o
  CC      arch/x86/kernel/cpu/topology_ext.o
  CC      arch/x86/mm/cpu_entry_area.o
  AR      sound/synth/emux/built-in.a
  AR      sound/synth/built-in.a
  CC      net/sched/sch_fifo.o
  CC      kernel/entry/common.o
  CC      drivers/acpi/x86/lpss.o
  CC      sound/core/seq/seq_dummy.o
  AR      drivers/clk/actions/built-in.a
  AR      drivers/clk/analogbits/built-in.a
  AR      lib/zlib_deflate/built-in.a
  AR      drivers/clk/bcm/built-in.a
  CC      mm/shmem.o
  CC      crypto/lskcipher.o
  CC      arch/x86/pci/early.o
  AR      drivers/clk/imgtec/built-in.a
  CC      fs/kernfs/symlink.o
  AR      net/netlink/built-in.a
  AR      drivers/clk/imx/built-in.a
  CC      net/sched/cls_cgroup.o
  AR      drivers/clk/ingenic/built-in.a
  CC      fs/sysfs/mount.o
  AR      drivers/clk/mediatek/built-in.a
  AR      drivers/clk/microchip/built-in.a
  AR      drivers/clk/mstar/built-in.a
  CC      drivers/dma/dw/core.o
  AR      drivers/clk/mvebu/built-in.a
  AR      drivers/soc/apple/built-in.a
  CC      drivers/pci/bus.o
  CC      arch/x86/mm/maccess.o
  AR      drivers/clk/ralink/built-in.a
  CC      security/selinux/status.o
  AR      drivers/soc/aspeed/built-in.a
  AR      drivers/clk/renesas/built-in.a
  AR      drivers/soc/bcm/built-in.a
  CC      drivers/acpi/acpica/dswload.o
  AR      drivers/clk/socfpga/built-in.a
  AR      drivers/soc/fsl/built-in.a
  AR      drivers/clk/sophgo/built-in.a
  CC      fs/netfs/direct_write.o
  AR      drivers/soc/fujitsu/built-in.a
  CC      net/core/net_namespace.o
  AR      drivers/clk/sprd/built-in.a
  CC      lib/crypto/mpi/mpih-cmp.o
  AR      drivers/soc/hisilicon/built-in.a
  AR      drivers/clk/starfive/built-in.a
  AR      drivers/soc/imx/built-in.a
  CC      drivers/pnp/quirks.o
  AR      drivers/soc/ixp4xx/built-in.a
  AR      drivers/clk/sunxi-ng/built-in.a
  AR      lib/lz4/built-in.a
  CC      net/core/secure_seq.o
  AR      drivers/soc/loongson/built-in.a
  AR      drivers/clk/ti/built-in.a
  AR      lib/xz/built-in.a
  AR      drivers/soc/mediatek/built-in.a
  AR      drivers/clk/versatile/built-in.a
  CC      arch/x86/kernel/cpu/topology_amd.o
  CC      arch/x86/kernel/cpu/common.o
  AR      drivers/clk/xilinx/built-in.a
  AR      arch/x86/kernel/kprobes/built-in.a
  AR      drivers/soc/microchip/built-in.a
  AR      drivers/clk/built-in.a
  CC      arch/x86/kernel/apic/vector.o
  AR      drivers/soc/nuvoton/built-in.a
  CC      kernel/sched/build_policy.o
  AR      drivers/soc/pxa/built-in.a
  CC      kernel/rcu/rcu_segcblist.o
  AR      drivers/soc/amlogic/built-in.a
  CC      drivers/virtio/virtio.o
  AR      drivers/soc/qcom/built-in.a
  AR      drivers/soc/renesas/built-in.a
  CC      drivers/acpi/osi.o
  AR      drivers/soc/rockchip/built-in.a
  AR      drivers/soc/sunxi/built-in.a
  AR      drivers/soc/ti/built-in.a
  CC      fs/proc/array.o
  CC      fs/netfs/iterator.o
  AR      drivers/soc/versatile/built-in.a
  AR      drivers/soc/xilinx/built-in.a
  AR      drivers/soc/built-in.a
  CC      arch/x86/mm/pgprot.o
  CC      security/selinux/ss/ebitmap.o
  CC      mm/util.o
  AR      sound/pci/korg1212/built-in.a
  CC      security/selinux/ss/hashtab.o
  CC      drivers/virtio/virtio_ring.o
  CC      lib/crypto/gf128mul.o
  CC      kernel/irq/msi.o
  CC      lib/zstd/decompress/zstd_decompress.o
  AR      sound/core/seq/built-in.a
  CC      sound/core/vmaster.o
  CC      drivers/acpi/acpica/dswload2.o
  CC      arch/x86/events/intel/p4.o
  CC      net/ethtool/strset.o
  CC      arch/x86/kernel/apic/init.o
  CC      block/blk-merge.o
  CC      arch/x86/pci/bus_numa.o
  CC      drivers/dma/dw/dw.o
  CC      drivers/acpi/x86/s2idle.o
  CC      lib/dim/dim.o
  AR      fs/kernfs/built-in.a
  CC      drivers/virtio/virtio_anchor.o
  CC      lib/crypto/mpi/mpih-div.o
  CC      drivers/acpi/osl.o
  AR      kernel/rcu/built-in.a
  CC      kernel/module/main.o
  CC      fs/sysfs/group.o
  CC      kernel/module/strict_rwx.o
  CC      kernel/sched/build_utility.o
  CC      drivers/pci/probe.o
  CC      arch/x86/mm/pgtable_32.o
  CC      fs/netfs/locking.o
  CC      drivers/pnp/system.o
  CC      crypto/skcipher.o
  CC      net/netfilter/core.o
  CC      drivers/acpi/acpica/dswscope.o
  CC      kernel/entry/syscall_user_dispatch.o
  CC      arch/x86/kernel/apic/hw_nmi.o
  CC      lib/fonts/fonts.o
  CC      arch/x86/kernel/cpu/rdrand.o
  CC      net/ethtool/linkinfo.o
  CC      lib/dim/net_dim.o
  CC      lib/zstd/decompress/zstd_decompress_block.o
  CC      sound/core/ctljack.o
  CC      drivers/acpi/x86/utils.o
  CC      lib/crypto/blake2s.o
  CC      io_uring/net.o
  AR      sound/usb/misc/built-in.a
  AR      sound/usb/usx2y/built-in.a
  AR      sound/usb/caiaq/built-in.a
  CC      drivers/dma/hsu/hsu.o
  AR      sound/usb/6fire/built-in.a
  AR      sound/usb/hiface/built-in.a
  AR      sound/usb/bcd2000/built-in.a
  AR      sound/usb/built-in.a
  CC      io_uring/poll.o
  CC      net/netfilter/nf_log.o
  CC      arch/x86/pci/amd_bus.o
  CC      drivers/acpi/acpica/dswstate.o
  CC      sound/pci/hda/hda_jack.o
  CC      drivers/dma/dw/idma32.o
  CC      kernel/module/kmod.o
  CC      drivers/acpi/x86/blacklist.o
  CC      fs/proc/fd.o
  CC      lib/fonts/font_8x16.o
  CC      block/blk-timeout.o
  CC      lib/argv_split.o
  AR      drivers/pnp/built-in.a
  CC      arch/x86/mm/iomap_32.o
  CC      arch/x86/kernel/apic/io_apic.o
  CC      sound/core/jack.o
  CC      fs/ext4/balloc.o
  AR      fs/sysfs/built-in.a
  CC      drivers/acpi/utils.o
  CC      kernel/time/time.o
  AR      sound/firewire/built-in.a
  CC      mm/mmzone.o
  CC      lib/crypto/mpi/mpih-mul.o
  AR      kernel/entry/built-in.a
  CC      arch/x86/events/intel/p6.o
  CC      arch/x86/kernel/cpu/match.o
  CC      security/selinux/ss/symtab.o
  CC      kernel/irq/affinity.o
  CC      net/core/flow_dissector.o
  CC      fs/ext4/bitmap.o
  CC      fs/netfs/main.o
  CC      net/ethtool/linkmodes.o
  AR      lib/fonts/built-in.a
  CC      net/ipv4/netfilter/nf_defrag_ipv4.o
  CC      net/xfrm/xfrm_policy.o
  CC      drivers/pci/host-bridge.o
  CC      net/xfrm/xfrm_state.o
  CC      drivers/acpi/acpica/evevent.o
  CC      net/unix/af_unix.o
  CC      drivers/virtio/virtio_pci_modern_dev.o
  CC      security/selinux/ss/sidtab.o
  AR      drivers/acpi/x86/built-in.a
  CC      net/xfrm/xfrm_hash.o
  CC      net/unix/garbage.o
  CC      arch/x86/kernel/cpu/bugs.o
  CC      arch/x86/kernel/head32.o
  CC      drivers/dma/dw/acpi.o
  CC      lib/dim/rdma_dim.o
  AR      drivers/dma/hsu/built-in.a
  CC      mm/vmstat.o
  CC      crypto/seqiv.o
  CC      arch/x86/mm/hugetlbpage.o
  CC      block/blk-lib.o
  CC      fs/jbd2/transaction.o
  AR      arch/x86/pci/built-in.a
  CC      kernel/irq/matrix.o
  AR      sound/sparc/built-in.a
  CC      net/netfilter/nf_queue.o
  CC      arch/x86/kernel/ebda.o
  CC      fs/proc/proc_tty.o
  CC      drivers/acpi/acpica/evgpe.o
  CC      sound/core/hwdep.o
  AR      sound/pci/mixart/built-in.a
  CC      crypto/echainiv.o
  CC      fs/ext4/block_validity.o
  CC      lib/bug.o
  CC      net/sched/ematch.o
  CC      sound/pci/hda/hda_auto_parser.o
  CC      net/ipv6/netfilter/ip6_tables.o
  CC      kernel/time/timer.o
  CC      arch/x86/events/intel/pt.o
  CC      lib/crypto/mpi/mpi-pow.o
  CC      net/xfrm/xfrm_input.o
  AR      lib/dim/built-in.a
  CC      sound/core/timer.o
  CC      sound/core/hrtimer.o
  CC      net/ethtool/rss.o
  CC      net/unix/sysctl_net_unix.o
  CC      net/ipv6/af_inet6.o
  CC      drivers/pci/remove.o
  CC      drivers/virtio/virtio_pci_legacy_dev.o
  CC      drivers/acpi/acpica/evgpeblk.o
  CC      kernel/futex/core.o
  CC      arch/x86/mm/dump_pagetables.o
  CC      drivers/tty/vt/vt_ioctl.o
  CC      drivers/tty/vt/vc_screen.o
  AR      drivers/dma/dw/built-in.a
  AR      drivers/dma/idxd/built-in.a
  AR      drivers/dma/amd/built-in.a
  AR      drivers/dma/mediatek/built-in.a
  AR      drivers/dma/qcom/built-in.a
  AR      drivers/dma/stm32/built-in.a
  CC      drivers/tty/vt/selection.o
  AR      drivers/dma/ti/built-in.a
  CC      fs/proc/cmdline.o
  AR      drivers/dma/xilinx/built-in.a
  CC      drivers/dma/dmaengine.o
  CC      lib/buildid.o
  CC      crypto/ahash.o
  CC      net/ipv4/netfilter/nf_reject_ipv4.o
  CC      crypto/shash.o
  CC      block/blk-mq.o
  CC      arch/x86/events/intel/uncore.o
  CC      kernel/cgroup/cgroup.o
  CC      io_uring/eventfd.o
  CC      kernel/module/tree_lookup.o
  CC      security/selinux/ss/avtab.o
  CC      lib/crypto/mpi/mpiutil.o
  CC      drivers/acpi/acpica/evgpeinit.o
  CC      fs/ramfs/inode.o
  CC      io_uring/uring_cmd.o
  CC      arch/x86/kernel/apic/msi.o
  CC      fs/netfs/misc.o
  CC      fs/ext4/dir.o
  CC      drivers/pci/pci.o
  CC      drivers/virtio/virtio_pci_modern.o
  AR      kernel/irq/built-in.a
  CC      fs/proc/consoles.o
  AR      net/sched/built-in.a
  CC      drivers/tty/hvc/hvc_console.o
  CC      lib/zstd/zstd_common_module.o
  CC      net/netfilter/nf_sockopt.o
  CC      drivers/tty/serial/8250/8250_core.o
  AR      drivers/tty/ipwireless/built-in.a
  CC      fs/ramfs/file-mmu.o
  CC      mm/backing-dev.o
  CC      net/ethtool/linkstate.o
  CC      sound/pci/hda/hda_sysfs.o
  CC      arch/x86/mm/highmem_32.o
  CC      drivers/acpi/acpica/evgpeutil.o
  CC      lib/zstd/common/debug.o
  CC      kernel/futex/syscalls.o
  CC      io_uring/openclose.o
  CC      kernel/futex/pi.o
  CC      fs/jbd2/commit.o
  CC      drivers/tty/tty_io.o
  CC      arch/x86/kernel/cpu/aperfmperf.o
  CC      kernel/module/kallsyms.o
  CC      net/ipv4/netfilter/ip_tables.o
  CC      fs/hugetlbfs/inode.o
  CC      drivers/tty/vt/keyboard.o
  CC      net/core/sysctl_net_core.o
  CC      lib/zstd/common/entropy_common.o
  AR      lib/crypto/mpi/built-in.a
  CC      lib/crypto/blake2s-generic.o
  CC      drivers/char/hw_random/core.o
  CC      fs/proc/cpuinfo.o
  CC      lib/zstd/common/error_private.o
  CC      sound/core/pcm.o
  CC      crypto/akcipher.o
  CC      drivers/acpi/acpica/evglock.o
  CC      drivers/char/agp/backend.o
  CC      arch/x86/kernel/apic/probe_32.o
  CC      drivers/pci/pci-driver.o
  CC      lib/zstd/common/fse_decompress.o
  CC      drivers/dma/virt-dma.o
  CC      net/ipv6/netfilter/ip6table_filter.o
  CC      kernel/time/hrtimer.o
  CC      drivers/dma/acpi-dma.o
  CC      fs/netfs/objects.o
  AR      fs/ramfs/built-in.a
  CC      block/blk-mq-tag.o
  CC      net/netfilter/utils.o
  CC      sound/pci/hda/hda_controller.o
  CC      security/selinux/ss/policydb.o
  CC      lib/crypto/sha1.o
  AR      drivers/tty/hvc/built-in.a
  CC      drivers/virtio/virtio_pci_common.o
  AR      arch/x86/mm/built-in.a
  CC      net/netfilter/nfnetlink.o
  CC      fs/ext4/ext4_jbd2.o
  CC      sound/pci/hda/hda_proc.o
  AR      net/unix/built-in.a
  CC      lib/crypto/sha256.o
  CC      drivers/char/mem.o
  CC      arch/x86/kernel/cpu/cpuid-deps.o
  CC      security/selinux/ss/services.o
  CC      fs/netfs/read_collect.o
  CC      net/xfrm/xfrm_output.o
  CC      drivers/acpi/acpica/evhandler.o
  AR      arch/x86/kernel/apic/built-in.a
  AR      sound/spi/built-in.a
  CC      arch/x86/events/intel/uncore_nhmex.o
  CC      kernel/module/procfs.o
  CC      io_uring/sqpoll.o
  CC      drivers/tty/serial/8250/8250_platform.o
  CC      kernel/futex/requeue.o
  CC      fs/proc/devices.o
  CC      net/ethtool/debug.o
  CC      lib/zstd/common/zstd_common.o
  AR      drivers/iommu/amd/built-in.a
  CC      mm/mm_init.o
  AR      drivers/iommu/intel/built-in.a
  AR      drivers/iommu/arm/arm-smmu/built-in.a
  AR      drivers/iommu/arm/arm-smmu-v3/built-in.a
  AR      drivers/iommu/arm/built-in.a
  AR      lib/zstd/built-in.a
  CC      net/ipv4/route.o
  AR      drivers/iommu/iommufd/built-in.a
  AR      drivers/iommu/riscv/built-in.a
  CC      arch/x86/events/msr.o
  CC      drivers/char/hw_random/intel-rng.o
  CC      drivers/iommu/iommu.o
  AR      kernel/sched/built-in.a
  CC      drivers/acpi/acpica/evmisc.o
  CC      arch/x86/kernel/cpu/umwait.o
  CC      sound/pci/hda/hda_hwdep.o
  CC      drivers/char/agp/generic.o
  CC      kernel/cgroup/rstat.o
  CC      drivers/virtio/virtio_pci_legacy.o
  CC      fs/jbd2/recovery.o
  CC      crypto/sig.o
  AR      lib/crypto/built-in.a
  CC      lib/clz_tab.o
  CC      sound/core/pcm_native.o
  CC      lib/cmdline.o
  AR      drivers/dma/built-in.a
  CC      net/ethtool/wol.o
  CC      net/core/dev.o
  CC      lib/cpumask.o
  CC      kernel/module/sysfs.o
  CC      drivers/tty/vt/vt.o
  CC      drivers/acpi/acpica/evregion.o
  CC      net/packet/af_packet.o
  CC      fs/proc/interrupts.o
  CC      arch/x86/kernel/platform-quirks.o
  AR      sound/pci/nm256/built-in.a
  CC      drivers/char/agp/isoch.o
  CC      kernel/futex/waitwake.o
  CC      drivers/pci/search.o
  AR      sound/pci/oxygen/built-in.a
  CC      net/ipv4/inetpeer.o
  CC      fs/netfs/read_pgpriv2.o
  CC      drivers/tty/serial/8250/8250_pnp.o
  AR      fs/hugetlbfs/built-in.a
  CC      net/ipv4/netfilter/iptable_filter.o
  CC      drivers/acpi/acpica/evrgnini.o
  CC      drivers/char/hw_random/amd-rng.o
  CC      lib/ctype.o
  CC      net/ipv6/netfilter/ip6table_mangle.o
  CC      lib/dec_and_lock.o
  CC      fs/netfs/read_retry.o
  MKCAP   arch/x86/kernel/cpu/capflags.c
  CC      drivers/virtio/virtio_pci_admin_legacy_io.o
  CC      fs/netfs/read_single.o
  CC      net/core/dev_addr_lists.o
  CC      fs/jbd2/checkpoint.o
  CC      net/netfilter/nfnetlink_log.o
  CC      drivers/acpi/reboot.o
  CC      mm/percpu.o
  CC      fs/ext4/extents.o
  COPY    drivers/tty/vt/defkeymap.c
  CC      sound/core/pcm_lib.o
  CC      sound/pci/hda/hda_intel.o
  CC      arch/x86/events/intel/uncore_snb.o
  CC      kernel/time/sleep_timeout.o
  CC      kernel/time/timekeeping.o
  CC      fs/proc/loadavg.o
  CC      crypto/kpp.o
  CC      lib/decompress.o
  ASN.1   crypto/rsapubkey.asn1.[ch]
  CC      arch/x86/kernel/process_32.o
  CC      drivers/acpi/acpica/evsci.o
  CC      lib/decompress_bunzip2.o
  CC      net/xfrm/xfrm_sysctl.o
  CC      drivers/char/random.o
  AR      kernel/module/built-in.a
  CC      net/xfrm/xfrm_replay.o
  CC      fs/ext4/extents_status.o
  CC      drivers/tty/serial/8250/8250_rsa.o
  CC      fs/proc/meminfo.o
  CC      net/ethtool/features.o
  CC      io_uring/xattr.o
  CC      drivers/char/agp/amd64-agp.o
  CC      drivers/acpi/nvs.o
  AR      kernel/futex/built-in.a
  CC      drivers/char/hw_random/geode-rng.o
  CC      drivers/char/hw_random/via-rng.o
  CC      net/ipv6/anycast.o
  CC      drivers/pci/rom.o
  CC      drivers/virtio/virtio_input.o
  CC      drivers/acpi/acpica/evxface.o
  CC      security/selinux/ss/conditional.o
  CC      io_uring/nop.o
  AR      net/dsa/built-in.a
  CC      net/ipv4/netfilter/iptable_mangle.o
  CC      arch/x86/events/intel/uncore_snbep.o
  CC      sound/core/pcm_misc.o
  CC      block/blk-stat.o
  CC      fs/jbd2/revoke.o
  CC      fs/netfs/rolling_buffer.o
  CC      kernel/cgroup/namespace.o
  CC      arch/x86/events/intel/uncore_discovery.o
  CC      net/sunrpc/auth_gss/auth_gss.o
  ASN.1   crypto/rsaprivkey.asn1.[ch]
  CC      lib/decompress_inflate.o
  CC      crypto/rsa.o
  CC      drivers/iommu/iommu-traces.o
  CC      drivers/tty/serial/8250/8250_port.o
  CC      net/ipv6/netfilter/nf_defrag_ipv6_hooks.o
  AR      net/wireless/tests/built-in.a
  CC      fs/proc/stat.o
  CC      net/wireless/core.o
  CC      drivers/acpi/acpica/evxfevnt.o
  AR      drivers/char/hw_random/built-in.a
  AR      net/mac80211/tests/built-in.a
  CC      net/mac80211/main.o
  CC      net/ipv4/netfilter/ipt_REJECT.o
  CC      fs/fat/cache.o
  CC      fs/fat/dir.o
  CC      drivers/pci/setup-res.o
  CC      drivers/char/agp/intel-agp.o
  CC      net/sunrpc/clnt.o
  CC      net/sunrpc/xprt.o
  CC      drivers/virtio/virtio_dma_buf.o
  CC      arch/x86/kernel/signal.o
  CC      io_uring/fs.o
  CC      arch/x86/kernel/signal_32.o
  CC      net/netfilter/nf_conntrack_core.o
  CC      net/ethtool/privflags.o
  CC      drivers/acpi/acpica/evxfgpe.o
  CC      block/blk-mq-sysfs.o
  CC      net/xfrm/xfrm_device.o
  CC      lib/decompress_unlz4.o
  CC      block/blk-mq-cpumap.o
  CC      drivers/acpi/wakeup.o
  AR      sound/pci/hda/built-in.a
  AR      sound/pci/pcxhr/built-in.a
  CC      crypto/rsa_helper.o
  AR      sound/pci/riptide/built-in.a
  CC      fs/jbd2/journal.o
  AR      sound/pci/rme9652/built-in.a
  AR      sound/pci/trident/built-in.a
  CC      kernel/time/ntp.o
  AR      sound/pci/ymfpci/built-in.a
  CC      kernel/time/clocksource.o
  CC      sound/core/pcm_memory.o
  AR      sound/pci/vx222/built-in.a
  CC      fs/proc/uptime.o
  AR      sound/pci/built-in.a
  CC      arch/x86/kernel/cpu/powerflags.o
  CC      kernel/cgroup/cgroup-v1.o
  CC      net/sunrpc/auth_gss/gss_mech_switch.o
  CC      fs/netfs/write_collect.o
  CC      arch/x86/kernel/cpu/topology.o
  CC      kernel/cgroup/freezer.o
  CC      fs/fat/fatent.o
  CC      security/selinux/ss/mls.o
  CC      drivers/pci/irq.o
  CC      fs/isofs/namei.o
  CC      drivers/char/misc.o
  AR      drivers/virtio/built-in.a
  CC      net/ipv6/netfilter/nf_conntrack_reasm.o
  CC      net/ipv6/netfilter/nf_reject_ipv6.o
  CC      drivers/acpi/acpica/evxfregn.o
  CC      drivers/tty/vt/consolemap.o
  CC      crypto/rsa-pkcs1pad.o
  CC      drivers/iommu/iommu-sysfs.o
  CC      drivers/char/agp/intel-gtt.o
  CC      lib/decompress_unlzma.o
  CC      arch/x86/kernel/traps.o
  CC [M]  net/ipv4/netfilter/iptable_nat.o
  CC      io_uring/splice.o
  CC      drivers/tty/serial/serial_core.o
  CC      block/blk-mq-sched.o
  CC      sound/core/memalloc.o
  CC      fs/isofs/inode.o
  CC      fs/proc/util.o
  CC      fs/proc/version.o
  CC      net/netfilter/nf_conntrack_standalone.o
  CC      mm/slab_common.o
  CC      drivers/acpi/acpica/exconcat.o
  CC      fs/proc/softirqs.o
  CC      net/ethtool/rings.o
  CC      kernel/trace/trace_clock.o
  CC      kernel/bpf/core.o
  CC      drivers/tty/n_tty.o
  CC      drivers/pci/vpd.o
  CC      crypto/rsassa-pkcs1.o
  CC      net/netfilter/nf_conntrack_expect.o
  CC      net/xfrm/xfrm_nat_keepalive.o
  CC      kernel/time/jiffies.o
  CC      drivers/iommu/dma-iommu.o
  CC      fs/ext4/file.o
  CC      fs/nfs/client.o
  CC      drivers/acpi/acpica/exconfig.o
  AR      net/packet/built-in.a
  CC      drivers/char/virtio_console.o
  CC      lib/decompress_unlzo.o
  CC      fs/netfs/write_issue.o
  CC      kernel/trace/ring_buffer.o
  CC      kernel/trace/trace.o
  CC      arch/x86/events/intel/cstate.o
  CC      fs/nfs/dir.o
  HOSTCC  drivers/tty/vt/conmakehash
  CC      fs/proc/namespaces.o
  CC      fs/fat/file.o
  CC      drivers/tty/serial/8250/8250_dma.o
  CC      io_uring/sync.o
  AR      drivers/char/agp/built-in.a
  CC      crypto/acompress.o
  CC      kernel/time/timer_list.o
  CC      kernel/time/timeconv.o
  CC      net/sunrpc/auth_gss/svcauth_gss.o
  CC      security/selinux/ss/context.o
  CC      kernel/cgroup/legacy_freezer.o
  CC      drivers/tty/vt/defkeymap.o
  CC      sound/core/pcm_timer.o
  CC      fs/exportfs/expfs.o
  CC      drivers/acpi/acpica/exconvrt.o
  CC      block/ioctl.o
  AR      net/ipv4/netfilter/built-in.a
  CC      net/ipv4/protocol.o
  CC      fs/lockd/clntlock.o
  CONMK   drivers/tty/vt/consolemap_deftbl.c
  CC      fs/nls/nls_base.o
  CC      drivers/tty/vt/consolemap_deftbl.o
  CC      net/ipv6/netfilter/ip6t_ipv6header.o
  AR      drivers/tty/vt/built-in.a
  AR      fs/unicode/built-in.a
  CC      drivers/acpi/acpica/excreate.o
  CC      lib/decompress_unxz.o
  CC      fs/lockd/clntproc.o
  CC      drivers/pci/setup-bus.o
  CC      net/ipv6/ip6_output.o
  CC      net/ethtool/channels.o
  CC      fs/isofs/dir.o
  CC      drivers/iommu/iova.o
  CC      net/sunrpc/auth_gss/gss_rpc_upcall.o
  CC      fs/proc/self.o
  AR      arch/x86/events/intel/built-in.a
  CC      net/mac80211/status.o
  AR      arch/x86/events/built-in.a
  CC      drivers/acpi/sleep.o
  CC      kernel/time/timecounter.o
  CC      drivers/acpi/acpica/exdebug.o
  CC      kernel/cgroup/pids.o
  CC      drivers/tty/serial/8250/8250_dwlib.o
  CC      fs/nls/nls_cp437.o
  CC      kernel/time/alarmtimer.o
  CC      sound/core/seq_device.o
  CC      fs/autofs/init.o
  CC      fs/proc/thread_self.o
  CC      io_uring/msg_ring.o
  CC      net/xfrm/xfrm_algo.o
  AR      fs/exportfs/built-in.a
  CC      fs/ext4/fsmap.o
  CC      net/wireless/sysfs.o
  AR      sound/parisc/built-in.a
  CC      fs/isofs/util.o
  CC      crypto/scompress.o
  CC      net/netfilter/nf_conntrack_helper.o
  CC      lib/decompress_unzstd.o
  CC      net/wireless/radiotap.o
  CC      fs/fat/inode.o
  CC      net/wireless/util.o
  CC      security/selinux/netlabel.o
  CC      fs/netfs/write_retry.o
  AR      fs/jbd2/built-in.a
  AR      sound/pcmcia/vx/built-in.a
  AR      sound/pcmcia/pdaudiocf/built-in.a
  CC      fs/ext4/fsync.o
  AR      sound/pcmcia/built-in.a
  AR      drivers/gpu/host1x/built-in.a
  CC      fs/nls/nls_ascii.o
  CC      drivers/acpi/acpica/exdump.o
  CC      drivers/char/hpet.o
  CC      block/genhd.o
  CC      net/ipv4/ip_input.o
  AR      drivers/gpu/vga/built-in.a
  CC      crypto/algboss.o
  CC      net/ipv6/netfilter/ip6t_REJECT.o
  AR      drivers/gpu/drm/tests/built-in.a
  AR      drivers/gpu/drm/arm/built-in.a
  AR      drivers/gpu/drm/clients/built-in.a
  CC      drivers/gpu/drm/display/drm_display_helper_mod.o
  CC      drivers/gpu/drm/ttm/ttm_tt.o
  CC      kernel/cgroup/rdma.o
  CC      fs/proc/proc_sysctl.o
  AR      sound/core/built-in.a
  AR      sound/mips/built-in.a
  CC      mm/compaction.o
  AR      sound/soc/built-in.a
  AR      sound/atmel/built-in.a
  CC      sound/hda/hda_bus_type.o
  CC      drivers/gpu/drm/display/drm_dp_dual_mode_helper.o
  CC      fs/isofs/rock.o
  CC      drivers/tty/serial/8250/8250_pcilib.o
  CC      fs/autofs/inode.o
  CC      fs/lockd/clntxdr.o
  CC      drivers/acpi/acpica/exfield.o
  CC      lib/dump_stack.o
  CC      crypto/testmgr.o
  CC      arch/x86/kernel/cpu/proc.o
  CC      fs/nls/nls_iso8859-1.o
  CC      net/ethtool/coalesce.o
  AR      drivers/iommu/built-in.a
  CC      fs/lockd/host.o
  CC      kernel/time/posix-timers.o
  CC      io_uring/advise.o
  CC      drivers/gpu/drm/ttm/ttm_bo.o
  CC      fs/isofs/export.o
  CC      kernel/events/core.o
  CC      fs/nls/nls_utf8.o
  CC      net/netfilter/nf_conntrack_proto.o
  CC      drivers/acpi/acpica/exfldio.o
  CC      kernel/events/ring_buffer.o
  AR      fs/netfs/built-in.a
  CC      net/xfrm/xfrm_user.o
  CC      arch/x86/kernel/idt.o
  CC      net/sunrpc/auth_gss/gss_rpc_xdr.o
  CC      drivers/pci/vc.o
  CC      kernel/cgroup/cpuset.o
  CC      fs/fat/misc.o
  CC      net/ipv4/ip_fragment.o
  CC      sound/hda/hdac_bus.o
  CC      drivers/char/nvram.o
  CC      drivers/tty/serial/8250/8250_early.o
  CC      lib/earlycpio.o
  CC      arch/x86/kernel/cpu/feat_ctl.o
  AR      kernel/bpf/built-in.a
  CC      lib/extable.o
  CC      crypto/cmac.o
  CC      drivers/tty/tty_ioctl.o
  AR      fs/nls/built-in.a
  CC      drivers/gpu/drm/display/drm_dp_helper.o
  CC      net/mac80211/driver-ops.o
  CC      net/netfilter/nf_conntrack_proto_generic.o
  CC      fs/autofs/root.o
  CC      drivers/tty/serial/serial_base_bus.o
  AR      security/selinux/built-in.a
  AR      security/built-in.a
  CC      net/sunrpc/auth_gss/trace.o
  CC      arch/x86/kernel/irq.o
  CC      net/ipv6/ip6_input.o
  CC      block/ioprio.o
  CC      block/badblocks.o
  CC      drivers/acpi/acpica/exmisc.o
  AR      net/ipv6/netfilter/built-in.a
  CC      mm/show_mem.o
  CC      fs/ext4/hash.o
  CC      fs/isofs/joliet.o
  CC      io_uring/epoll.o
  CC      drivers/pci/mmap.o
  CC      lib/flex_proportions.o
  CC      arch/x86/kernel/cpu/intel.o
  CC      drivers/pci/devres.o
  CC      fs/proc/proc_net.o
  CC      crypto/hmac.o
  CC      net/ethtool/pause.o
  CC      drivers/gpu/drm/ttm/ttm_bo_util.o
  CC      drivers/tty/serial/8250/8250_exar.o
  CC      kernel/cgroup/misc.o
  CC      drivers/tty/serial/serial_ctrl.o
  CC      fs/lockd/svc.o
  CC      drivers/acpi/acpica/exmutex.o
  CC      sound/hda/hdac_device.o
  CC      fs/fat/nfs.o
  CC      sound/hda/hdac_sysfs.o
  CC      sound/hda/hdac_regmap.o
  AR      drivers/char/built-in.a
  CC      fs/nfs/file.o
  CC      fs/lockd/svclock.o
  CC      kernel/time/posix-cpu-timers.o
  CC      kernel/time/posix-clock.o
  CC      lib/idr.o
  CC      fs/isofs/compress.o
  CC      kernel/trace/trace_output.o
  CC      io_uring/statx.o
  CC      mm/interval_tree.o
  CC      fs/autofs/symlink.o
  CC      drivers/acpi/acpica/exnames.o
  CC      arch/x86/kernel/cpu/tsx.o
  CC      net/netlabel/netlabel_user.o
  CC      sound/hda/hdac_controller.o
  CC      drivers/pci/proc.o
  CC      fs/ext4/ialloc.o
  CC      mm/list_lru.o
  CC      kernel/fork.o
  CC      net/wireless/reg.o
  CC      drivers/tty/tty_ldisc.o
  CC      drivers/tty/tty_buffer.o
  CC      net/netfilter/nf_conntrack_proto_tcp.o
  CC      block/blk-rq-qos.o
  CC      net/ipv4/ip_forward.o
  CC      crypto/crypto_null.o
  CC      drivers/gpu/drm/i915/i915_config.o
  CC      drivers/tty/serial/8250/8250_lpss.o
  CC      fs/proc/kcore.o
  CC      lib/iomem_copy.o
  CC      drivers/acpi/acpica/exoparg1.o
  CC      net/core/dst.o
  CC      arch/x86/kernel/cpu/intel_epb.o
  CC      lib/irq_regs.o
  CC      fs/fat/namei_vfat.o
  CC      drivers/gpu/drm/ttm/ttm_bo_vm.o
  CC      drivers/gpu/drm/i915/i915_driver.o
  CC      arch/x86/kernel/cpu/amd.o
  CC      net/ethtool/eee.o
  CC      net/mac80211/sta_info.o
  CC      net/mac80211/wep.o
  CC      drivers/acpi/device_sysfs.o
  CC      fs/proc/vmcore.o
  CC      io_uring/timeout.o
  CC      fs/autofs/waitq.o
  AR      fs/isofs/built-in.a
  CC      io_uring/fdinfo.o
  CC      lib/is_single_threaded.o
  CC      mm/workingset.o
  CC      net/ethtool/tsinfo.o
  CC      net/rfkill/core.o
  CC      net/ipv6/addrconf.o
  CC      kernel/events/callchain.o
  CC      crypto/md5.o
  CC      block/disk-events.o
  CC      fs/ext4/indirect.o
  CC      kernel/time/itimer.o
  CC      kernel/cgroup/debug.o
  CC      sound/hda/hdac_stream.o
  CC      drivers/acpi/acpica/exoparg2.o
  CC      fs/ext4/inline.o
  CC      drivers/acpi/acpica/exoparg3.o
  CC      drivers/pci/pci-sysfs.o
  CC      kernel/exec_domain.o
  CC      net/netlabel/netlabel_kapi.o
  CC      kernel/trace/trace_seq.o
  CC      drivers/tty/serial/8250/8250_mid.o
  CC      drivers/gpu/drm/display/drm_dp_mst_topology.o
  CC      lib/klist.o
  CC      fs/lockd/svcshare.o
  CC      net/sunrpc/socklib.o
  CC      net/ipv4/ip_options.o
In file included from /workspace/kernel/drivers/gpu/drm/i915/display/intel_bw.h:12,
                 from /workspace/kernel/drivers/gpu/drm/i915/i915_driver.c:50:
/workspace/kernel/drivers/gpu/drm/i915/display/intel_display_power.h: In function ‘intel_display_power_put’:
  CC      net/sunrpc/auth_gss/gss_krb5_mech.o
/workspace/kernel/drivers/gpu/drm/i915/display/intel_display_power.h:228:43: error: passing argument 1 of ‘intel_display_power_put_unchecked’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  228 |         intel_display_power_put_unchecked(display, domain);
      |                                           ^~~~~~~
      |                                           |
      |                                           struct intel_display *
/workspace/kernel/drivers/gpu/drm/i915/display/intel_display_power.h:220:65: note: expected ‘struct drm_i915_private *’ but argument is of type ‘struct intel_display *’
  220 | void intel_display_power_put_unchecked(struct drm_i915_private *dev_priv,
      |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
  CC      drivers/gpu/drm/ttm/ttm_module.o
  CC      net/netlabel/netlabel_domainhash.o
  CC      net/sunrpc/auth_gss/gss_krb5_seal.o
  CC      net/netfilter/nf_conntrack_proto_udp.o
  AR      net/xfrm/built-in.a
  CC      io_uring/cancel.o
  CC      drivers/acpi/acpica/exoparg6.o
  CC      crypto/sha256_generic.o
  CC      lib/kobject.o
  CC      arch/x86/kernel/cpu/hygon.o
  CC      drivers/tty/serial/serial_port.o
  CC      fs/autofs/expire.o
  CC      fs/proc/kmsg.o
  CC      fs/lockd/svcproc.o
  CC      mm/debug.o
  CC      crypto/sha512_generic.o
  CC      kernel/trace/trace_stat.o
  CC      fs/nfs/getroot.o
  CC      block/blk-ia-ranges.o
  CC      net/sunrpc/xprtsock.o
  CC      net/core/netevent.o
  CC      fs/9p/vfs_super.o
  CC      net/core/neighbour.o
  AR      kernel/cgroup/built-in.a
  CC      net/netlabel/netlabel_addrlist.o
  CC      drivers/tty/serial/8250/8250_pci.o
  CC      drivers/acpi/acpica/exprep.o
  CC      net/rfkill/input.o
  CC      net/ethtool/cabletest.o
  CC      fs/fat/namei_msdos.o
  CC      kernel/time/clockevents.o
  CC      drivers/gpu/drm/ttm/ttm_execbuf_util.o
  CC      net/sunrpc/sched.o
  CC      block/early-lookup.o
  CC      sound/hda/array.o
  CC      drivers/tty/serial/earlycon.o
  CC      arch/x86/kernel/cpu/centaur.o
  CC      drivers/pci/slot.o
  CC      fs/proc/page.o
  CC      lib/kobject_uevent.o
cc1: all warnings being treated as errors
make[6]: *** [/workspace/kernel/scripts/Makefile.build:207: drivers/gpu/drm/i915/i915_driver.o] Error 1
make[5]: *** [/workspace/kernel/scripts/Makefile.build:465: drivers/gpu/drm/i915] Error 2
make[5]: *** Waiting for unfinished jobs....
  CC      lib/logic_pio.o
  CC      drivers/acpi/acpica/exregion.o
  CC      arch/x86/kernel/irq_32.o
  CC      drivers/gpu/drm/display/drm_dsc_helper.o
  CC      net/sunrpc/auth_gss/gss_krb5_unseal.o
  CC      io_uring/waitid.o
  CC      net/9p/mod.o
  CC      net/9p/client.o
  CC      net/sunrpc/auth_gss/gss_krb5_wrap.o
  CC      fs/autofs/dev-ioctl.o
  CC      drivers/gpu/drm/display/drm_hdcp_helper.o
  CC      crypto/sha3_generic.o
  AR      net/rfkill/built-in.a
  CC      fs/9p/vfs_inode.o
  CC      drivers/tty/serial/8250/8250_pericom.o
  CC      fs/lockd/svcsubs.o
  CC      io_uring/register.o
  CC      arch/x86/kernel/cpu/transmeta.o
  CC      mm/gup.o
  CC      kernel/trace/trace_printk.o
  CC      kernel/time/tick-common.o
  CC      net/core/rtnetlink.o
  CC      net/netfilter/nf_conntrack_proto_icmp.o
  AR      sound/x86/built-in.a
  CC      drivers/gpu/drm/display/drm_hdmi_helper.o
  CC      sound/hda/hdmi_chmap.o
  CC      drivers/gpu/drm/ttm/ttm_range_manager.o
  CC      drivers/acpi/acpica/exresnte.o
  CC      block/bounce.o
  CC      drivers/connector/cn_queue.o
  CC      drivers/acpi/device_pm.o
  CC      lib/maple_tree.o
  CC      net/ipv4/ip_output.o
  CC      fs/ext4/inode.o
  CC      drivers/connector/connector.o
  CC      fs/nfs/inode.o
  CC      arch/x86/kernel/dumpstack_32.o
  AR      fs/fat/built-in.a
  CC      drivers/pci/pci-acpi.o
  CC      net/wireless/scan.o
  CC      drivers/tty/tty_port.o
  CC      net/netlabel/netlabel_mgmt.o
  AR      fs/proc/built-in.a
  CC      net/9p/error.o
  CC      net/dns_resolver/dns_key.o
  CC      net/ethtool/tunnels.o
  CC      crypto/ecb.o
  CC      drivers/acpi/acpica/exresolv.o
  CC      arch/x86/kernel/cpu/zhaoxin.o
  CC      arch/x86/kernel/cpu/vortex.o
  CC      net/9p/protocol.o
  AR      drivers/tty/serial/8250/built-in.a
  AR      drivers/tty/serial/built-in.a
  AR      sound/xen/built-in.a
  CC      net/netfilter/nf_conntrack_extend.o
  CC      drivers/acpi/acpica/exresop.o
  CC      kernel/time/tick-broadcast.o
  AR      fs/hostfs/built-in.a
  CC      net/ipv6/addrlabel.o
  CC      net/netlabel/netlabel_unlabeled.o
  CC      drivers/gpu/drm/ttm/ttm_resource.o
  CC      drivers/pci/iomap.o
  AR      fs/autofs/built-in.a
  CC      net/wireless/nl80211.o
  CC      net/ethtool/fec.o
  CC      kernel/trace/pid_list.o
  CC      crypto/cbc.o
  AR      sound/virtio/built-in.a
  CC      sound/hda/trace.o
  CC      drivers/acpi/proc.o
  CC      net/sunrpc/auth_gss/gss_krb5_crypto.o
  CC      net/sunrpc/auth.o
  CC      kernel/panic.o
  CC      arch/x86/kernel/cpu/perfctr-watchdog.o
  CC      net/handshake/alert.o
  CC      fs/9p/vfs_inode_dotl.o
  CC      net/dns_resolver/dns_query.o
  CC      fs/lockd/mon.o
  CC      net/9p/trans_common.o
  CC      drivers/pci/quirks.o
  CC      drivers/tty/tty_mutex.o
  CC      drivers/acpi/acpica/exserial.o
  CC      block/bsg.o
  CC      block/blk-cgroup.o
  CC      drivers/connector/cn_proc.o
  CC      net/sunrpc/auth_null.o
  CC      crypto/ctr.o
  CC      drivers/pci/pci-label.o
  CC      kernel/time/tick-broadcast-hrtimer.o
  CC      mm/mmap_lock.o
  CC      sound/sound_core.o
  CC      drivers/acpi/acpica/exstore.o
  CC      io_uring/truncate.o
  CC      net/core/utils.o
  CC      fs/debugfs/inode.o
  CC      drivers/gpu/drm/display/drm_scdc_helper.o
  CC      fs/tracefs/inode.o
  CC      net/mac80211/aead_api.o
  CC      arch/x86/kernel/cpu/vmware.o
  CC      net/9p/trans_fd.o
  CC      drivers/gpu/drm/ttm/ttm_pool.o
  CC      kernel/trace/trace_sched_switch.o
  CC [M]  fs/efivarfs/inode.o
  CC      net/netfilter/nf_conntrack_acct.o
  CC      drivers/tty/tty_ldsem.o
  AR      net/dns_resolver/built-in.a
  CC      net/wireless/mlme.o
  CC      kernel/time/tick-oneshot.o
  CC      kernel/events/hw_breakpoint.o
  CC      net/ethtool/eeprom.o
  CC      crypto/gcm.o
  CC      fs/ext4/ioctl.o
  CC      net/sunrpc/auth_gss/gss_krb5_keys.o
  CC      drivers/acpi/acpica/exstoren.o
  CC      sound/hda/hdac_component.o
  CC      kernel/events/uprobes.o
  CC      net/wireless/ibss.o
  CC      fs/9p/vfs_addr.o
  CC      net/handshake/genl.o
  CC      fs/nfs/super.o
  CC      fs/tracefs/event_inode.o
  CC      net/netlabel/netlabel_cipso_v4.o
  CC      fs/lockd/trace.o
  CC      kernel/time/tick-sched.o
  CC      mm/highmem.o
  CC      net/netlabel/netlabel_calipso.o
  CC      net/mac80211/wpa.o
  CC      fs/nfs/io.o
  CC      drivers/acpi/acpica/exstorob.o
  CC      net/ipv4/ip_sockglue.o
  CC      arch/x86/kernel/cpu/hypervisor.o
  AR      drivers/connector/built-in.a
  CC [M]  fs/efivarfs/file.o
  CC      net/9p/trans_virtio.o
  CC      net/ipv6/route.o
  CC      io_uring/memmap.o
  CC [M]  fs/efivarfs/super.o
  CC      drivers/tty/tty_baudrate.o
  AR      drivers/gpu/drm/display/built-in.a
  CC      kernel/cpu.o
  CC      kernel/trace/trace_nop.o
  CC      fs/debugfs/file.o
  CC      arch/x86/kernel/cpu/mshyperv.o
  CC      net/wireless/sme.o
  CC      sound/hda/hdac_i915.o
  CC      drivers/acpi/acpica/exsystem.o
  CC      block/blk-ioprio.o
  CC      drivers/gpu/drm/ttm/ttm_device.o
  CC      drivers/pci/vgaarb.o
  CC      net/netfilter/nf_conntrack_seqadj.o
  CC      fs/9p/vfs_file.o
  CC      crypto/ccm.o
  CC      net/mac80211/scan.o
  CC      net/handshake/netlink.o
  CC      net/ethtool/stats.o
  CC      lib/memcat_p.o
  CC      block/blk-iolatency.o
  CC      net/ethtool/phc_vclocks.o
  CC      drivers/tty/tty_jobctrl.o
  CC      drivers/base/power/sysfs.o
  CC      drivers/base/power/generic_ops.o
  AR      net/sunrpc/auth_gss/built-in.a
  CC      net/sunrpc/auth_tls.o
  AR      fs/tracefs/built-in.a
  CC      net/sunrpc/auth_unix.o
  CC      drivers/acpi/acpica/extrace.o
  CC      io_uring/alloc_cache.o
  CC      net/sunrpc/svc.o
  CC      net/ipv4/inet_hashtables.o
  CC      mm/memory.o
  CC [M]  fs/efivarfs/vars.o
  CC      kernel/time/timer_migration.o
  CC      kernel/trace/blktrace.o
  CC      sound/hda/intel-dsp-config.o
  CC      net/ethtool/mm.o
  CC      fs/lockd/xdr.o
  CC      net/ipv6/ip6_fib.o
  AR      net/netlabel/built-in.a
  CC      drivers/acpi/acpica/exutils.o
  CC      net/core/link_watch.o
  CC      fs/ext4/mballoc.o
  CC      net/core/filter.o
  CC      drivers/gpu/drm/ttm/ttm_sys_manager.o
  CC      arch/x86/kernel/cpu/debugfs.o
  CC      drivers/base/power/common.o
  CC      fs/nfs/direct.o
  CC      fs/9p/vfs_dir.o
  CC      drivers/tty/n_null.o
  AR      net/9p/built-in.a
  AR      kernel/events/built-in.a
  CC      fs/9p/vfs_dentry.o
  AR      fs/debugfs/built-in.a
  CC      net/core/sock_diag.o
  CC      io_uring/io-wq.o
  CC      fs/nfs/pagelist.o
  CC      sound/last.o
  CC      crypto/aes_generic.o
  CC      drivers/acpi/acpica/hwacpi.o
  CC      kernel/time/vsyscall.o
  AR      drivers/pci/built-in.a
  CC      arch/x86/kernel/cpu/bus_lock.o
  CC      net/sunrpc/svcsock.o
  CC      fs/lockd/clnt4xdr.o
  CC      net/handshake/request.o
  CC      mm/mincore.o
  CC      drivers/gpu/drm/ttm/ttm_agp_backend.o
  LD [M]  fs/efivarfs/efivarfs.o
  CC      drivers/acpi/acpica/hwesleep.o
  CC      sound/hda/intel-nhlt.o
  CC      net/netfilter/nf_conntrack_proto_icmpv6.o
  CC      drivers/acpi/bus.o
  CC      arch/x86/kernel/time.o
  CC      crypto/authenc.o
  CC      drivers/base/power/qos.o
  CC      net/handshake/tlshd.o
  CC      arch/x86/kernel/ioport.o
  CC      fs/9p/v9fs.o
  CC      drivers/tty/pty.o
  CC      net/wireless/chan.o
  CC      block/blk-iocost.o
  CC      sound/hda/intel-sdw-acpi.o
  CC      net/devres.o
  CC      drivers/block/loop.o
  CC      drivers/misc/eeprom/eeprom_93cx6.o
  CC      net/ethtool/module.o
  CC      drivers/block/virtio_blk.o
  AR      drivers/misc/cb710/built-in.a
  CC      drivers/acpi/acpica/hwgpe.o
  CC      kernel/trace/trace_events.o
  CC      fs/lockd/xdr4.o
  AR      drivers/mfd/built-in.a
  CC      net/ethtool/cmis_fw_update.o
  CC      net/mac80211/offchannel.o
  CC      net/mac80211/ht.o
  CC      fs/9p/fid.o
  CC      fs/open.o
  AR      drivers/gpu/drm/ttm/built-in.a
make[4]: *** [/workspace/kernel/scripts/Makefile.build:465: drivers/gpu/drm] Error 2
make[3]: *** [/workspace/kernel/scripts/Makefile.build:465: drivers/gpu] Error 2
make[3]: *** Waiting for unfinished jobs....
  CC      kernel/time/timekeeping_debug.o
  CC      arch/x86/kernel/cpu/capflags.o
  AR      arch/x86/kernel/cpu/built-in.a
  AR      sound/hda/built-in.a
  CC      drivers/base/power/runtime.o
  AR      sound/built-in.a
  CC      drivers/tty/tty_audit.o
  AR      drivers/misc/eeprom/built-in.a
  CC      drivers/acpi/glue.o
  AR      drivers/misc/lis3lv02d/built-in.a
  AR      drivers/misc/cardreader/built-in.a
  CC      drivers/acpi/acpica/hwregs.o
  AR      drivers/misc/keba/built-in.a
  CC      kernel/exit.o
  AR      drivers/misc/built-in.a
  CC      drivers/tty/sysrq.o
  CC      fs/read_write.o
  CC      net/netfilter/nf_conntrack_netlink.o
  CC      arch/x86/kernel/dumpstack.o
  CC      net/ipv4/inet_timewait_sock.o
  CC      net/core/dev_ioctl.o
  CC      crypto/authencesn.o
  CC      io_uring/futex.o
  CC      fs/9p/xattr.o
  CC      net/ipv4/inet_connection_sock.o
  CC      drivers/base/firmware_loader/builtin/main.o
  CC      net/ipv4/tcp.o
  CC      drivers/base/firmware_loader/main.o
  CC      kernel/softirq.o
  CC      net/mac80211/agg-tx.o
  CC      net/handshake/trace.o
  CC      drivers/acpi/acpica/hwsleep.o
  CC      kernel/time/namespace.o
  CC      fs/nfs/read.o
  CC      kernel/trace/trace_export.o
  CC      mm/mlock.o
  CC      drivers/base/regmap/regmap.o
  AR      drivers/base/firmware_loader/builtin/built-in.a
  CC      arch/x86/kernel/nmi.o
  CC      fs/ext4/migrate.o
  CC      drivers/acpi/scan.o
  CC      net/core/tso.o
  CC      lib/nmi_backtrace.o
  CC      net/core/sock_reuseport.o
  CC      kernel/trace/trace_event_perf.o
  CC      fs/file_table.o
  CC      fs/lockd/svc4proc.o
  CC      drivers/base/power/wakeirq.o
  CC      drivers/acpi/acpica/hwvalid.o
  CC      net/ethtool/cmis_cdb.o
  AR      drivers/base/test/built-in.a
  CC      net/ipv4/tcp_input.o
  AR      fs/9p/built-in.a
  AR      drivers/block/built-in.a
  CC      drivers/base/regmap/regcache.o
  CC      lib/objpool.o
  CC      net/ipv4/tcp_output.o
  CC      block/mq-deadline.o
  AR      drivers/tty/built-in.a
  CC      net/core/fib_notifier.o
  CC      io_uring/napi.o
  CC      crypto/lzo.o
  CC      drivers/acpi/acpica/hwxface.o
  AR      kernel/time/built-in.a
  CC      net/mac80211/agg-rx.o
  CC      net/ipv6/ipv6_sockglue.o
  CC      drivers/acpi/mipi-disco-img.o
  AR      drivers/base/firmware_loader/built-in.a
  CC      block/kyber-iosched.o
  CC      block/blk-mq-debugfs.o
  CC      drivers/base/power/main.o
  CC      net/netfilter/nf_conntrack_ftp.o
  CC      net/wireless/ethtool.o
  CC      lib/plist.o
  CC      lib/radix-tree.o
  CC      arch/x86/kernel/ldt.o
  CC      net/sunrpc/svcauth.o
  CC      fs/nfs/symlink.o
  CC      kernel/trace/trace_events_filter.o
  CC      drivers/acpi/acpica/hwxfsleep.o
  CC      fs/super.o
  CC      drivers/acpi/resource.o
  CC      mm/mmap.o
  CC      net/mac80211/vht.o
  CC      drivers/base/power/wakeup.o
  CC      drivers/base/regmap/regcache-rbtree.o
  CC      crypto/lzo-rle.o
  CC      net/ethtool/pse-pd.o
  CC      fs/lockd/procfs.o
  CC      net/netfilter/nf_conntrack_irc.o
  CC      net/ipv6/ndisc.o
  AR      net/handshake/built-in.a
  CC      drivers/acpi/acpica/hwpci.o
  CC      net/mac80211/he.o
  CC      net/netfilter/nf_conntrack_sip.o
  CC      net/ethtool/plca.o
  CC      drivers/acpi/acpica/nsaccess.o
  CC      crypto/rng.o
  CC      block/blk-pm.o
  CC      fs/ext4/mmp.o
  CC      lib/ratelimit.o
  CC      fs/char_dev.o
  CC      drivers/base/power/wakeup_stats.o
  CC      drivers/base/component.o
  CC      fs/stat.o
  CC      crypto/drbg.o
  CC      net/mac80211/s1g.o
  CC      drivers/base/regmap/regcache-flat.o
  CC      kernel/resource.o
  CC      drivers/base/power/trace.o
  CC      net/core/xdp.o
  CC      drivers/acpi/acpica/nsalloc.o
  CC      drivers/base/core.o
  CC      arch/x86/kernel/setup.o
  CC      lib/rbtree.o
  CC      mm/mmu_gather.o
  CC      net/ethtool/phy.o
  CC      net/ethtool/tsconfig.o
  AR      fs/lockd/built-in.a
  CC      kernel/trace/trace_events_trigger.o
  CC      net/socket.o
  AR      io_uring/built-in.a
  CC      lib/seq_buf.o
  CC      drivers/acpi/acpica/nsarguments.o
  CC      fs/nfs/unlink.o
  CC      kernel/sysctl.o
  CC      net/ipv4/tcp_timer.o
  CC      block/holder.o
  CC      drivers/base/regmap/regcache-maple.o
  CC      drivers/base/bus.o
  CC      mm/mprotect.o
  CC      kernel/trace/trace_eprobe.o
  CC      fs/ext4/move_extent.o
  CC      net/netfilter/nf_nat_core.o
  CC      net/ipv4/tcp_ipv4.o
  CC      drivers/base/dd.o
  CC      net/core/flow_offload.o
  CC      net/sunrpc/svcauth_unix.o
  CC      drivers/acpi/acpica/nsconvert.o
  CC      net/netfilter/nf_nat_proto.o
  CC      net/wireless/mesh.o
  AR      drivers/base/power/built-in.a
  CC      drivers/acpi/acpi_processor.o
  CC      net/sysctl_net.o
  CC      crypto/jitterentropy.o
  CC      net/netfilter/nf_nat_helper.o
  CC      net/netfilter/nf_nat_masquerade.o
  CC      crypto/jitterentropy-kcapi.o
  CC      net/core/gro.o
  CC      lib/siphash.o
  CC      net/ipv4/tcp_minisocks.o
  CC      kernel/capability.o
  CC      arch/x86/kernel/x86_init.o
  CC      drivers/acpi/acpica/nsdump.o
  CC      fs/exec.o
  CC      drivers/base/regmap/regmap-debugfs.o
  CC      net/ipv6/udp.o
  AR      block/built-in.a
  CC      net/netfilter/nf_nat_ftp.o
  CC      drivers/base/syscore.o
  CC      crypto/ghash-generic.o
  CC      net/core/netdev-genl.o
  CC      net/ipv4/tcp_cong.o
  CC      lib/string.o
  AR      net/ethtool/built-in.a
  CC      fs/ext4/namei.o
  CC      kernel/ptrace.o
  CC      fs/nfs/write.o
  CC      drivers/acpi/acpica/nseval.o
  CC      net/mac80211/ibss.o
  CC      drivers/acpi/processor_core.o
  CC      net/ipv6/udplite.o
  CC      net/mac80211/iface.o
  CC      lib/timerqueue.o
  CC      drivers/acpi/processor_pdc.o
  CC      crypto/hash_info.o
  CC      net/sunrpc/addr.o
  CC      drivers/acpi/acpica/nsinit.o
  CC      mm/mremap.o
  CC      crypto/rsapubkey.asn1.o
  CC      crypto/rsaprivkey.asn1.o
  CC      fs/pipe.o
  AR      crypto/built-in.a
  CC      net/ipv4/tcp_metrics.o
  CC      drivers/acpi/ec.o
  CC      lib/union_find.o
  CC      arch/x86/kernel/i8259.o
  CC      mm/msync.o
  CC      lib/vsprintf.o
  CC      fs/namei.o
  CC      kernel/trace/trace_kprobe.o
  CC      net/core/netdev-genl-gen.o
  CC      net/ipv6/raw.o
  CC      fs/fcntl.o
  AR      drivers/base/regmap/built-in.a
  CC      drivers/acpi/dock.o
  CC      net/ipv4/tcp_fastopen.o
  CC      fs/nfs/namespace.o
  CC      net/netfilter/nf_nat_irc.o
  CC      fs/ext4/page-io.o
  CC      arch/x86/kernel/irqinit.o
  CC      drivers/acpi/acpica/nsload.o
  CC      net/netfilter/nf_nat_sip.o
  CC      drivers/base/driver.o
  CC      net/core/gso.o
  CC      net/mac80211/link.o
  CC      net/wireless/ap.o
  CC      fs/nfs/mount_clnt.o
  CC      drivers/acpi/acpica/nsnames.o
  CC      net/sunrpc/rpcb_clnt.o
  CC      drivers/acpi/pci_root.o
  CC      mm/page_vma_mapped.o
  CC      drivers/base/class.o
  CC      kernel/trace/error_report-traces.o
  CC      kernel/user.o
  CC      net/ipv6/icmp.o
  CC      net/netfilter/x_tables.o
  CC      fs/nfs/nfstrace.o
  CC      fs/ioctl.o
  CC      net/mac80211/rate.o
  CC      drivers/acpi/acpica/nsobject.o
  CC      arch/x86/kernel/jump_label.o
  CC      fs/ext4/readpage.o
  CC      fs/readdir.o
  CC      net/ipv4/tcp_rate.o
  CC      net/wireless/trace.o
  CC      kernel/trace/power-traces.o
  CC      fs/nfs/export.o
  CC      net/ipv6/mcast.o
  CC      net/mac80211/michael.o
  CC      drivers/acpi/pci_link.o
  CC      arch/x86/kernel/irq_work.o
  CC      net/sunrpc/timer.o
  CC      drivers/base/platform.o
  CC      drivers/acpi/acpica/nsparse.o
  CC      lib/win_minmax.o
  CC      mm/pagewalk.o
  CC      net/ipv4/tcp_recovery.o
  CC      net/mac80211/tkip.o
  CC      fs/nfs/sysfs.o
  CC      mm/pgtable-generic.o
  CC      net/netfilter/xt_tcpudp.o
  CC      arch/x86/kernel/probe_roms.o
  CC      net/sunrpc/xdr.o
  CC      fs/ext4/resize.o
  CC      fs/nfs/fs_context.o
  CC      drivers/acpi/acpica/nspredef.o
  CC      net/mac80211/aes_cmac.o
  CC      kernel/signal.o
  CC      fs/select.o
  CC      drivers/acpi/pci_irq.o
  CC      net/core/net-sysfs.o
  CC      net/ipv6/reassembly.o
  CC      arch/x86/kernel/sys_ia32.o
  CC      net/wireless/ocb.o
  CC      net/sunrpc/sunrpc_syms.o
  CC      net/ipv4/tcp_ulp.o
  CC      drivers/acpi/acpica/nsprepkg.o
  CC      net/ipv6/tcp_ipv6.o
  CC      lib/xarray.o
  CC      net/mac80211/aes_gmac.o
  CC      mm/rmap.o
  CC      kernel/sys.o
  CC      net/core/hotdata.o
  CC      net/wireless/pmsr.o
  CC      net/sunrpc/cache.o
  CC      fs/ext4/super.o
  CC      drivers/base/cpu.o
  CC      net/core/netdev_rx_queue.o
  CC      drivers/acpi/acpi_apd.o
  CC      fs/dcache.o
  CC      net/ipv6/ping.o
  CC      kernel/trace/rpm-traces.o
  CC      drivers/acpi/acpi_platform.o
  CC      kernel/umh.o
  CC      net/ipv6/exthdrs.o
  CC      drivers/acpi/acpica/nsrepair.o
  CC      kernel/trace/trace_dynevent.o
  CC      net/ipv6/datagram.o
  CC      drivers/base/firmware.o
  CC      lib/lockref.o
  CC      drivers/acpi/acpi_pnp.o
  CC      arch/x86/kernel/ksysfs.o
  CC      drivers/acpi/acpica/nsrepair2.o
  CC      drivers/acpi/acpica/nssearch.o
  CC      net/ipv6/ip6_flowlabel.o
  CC      lib/bcd.o
  CC      arch/x86/kernel/bootflag.o
  CC      fs/inode.o
  CC      kernel/trace/trace_probe.o
  CC      fs/ext4/symlink.o
  CC      net/netfilter/xt_CONNSECMARK.o
  CC      net/ipv6/inet6_connection_sock.o
  CC      arch/x86/kernel/e820.o
  GEN     net/wireless/shipped-certs.c
  CC      net/mac80211/fils_aead.o
  CC      kernel/workqueue.o
  CC      net/ipv4/tcp_offload.o
  CC      mm/vmalloc.o
  CC      drivers/acpi/power.o
  CC      drivers/base/init.o
  CC      drivers/acpi/acpica/nsutils.o
  CC      mm/vma.o
  CC      fs/attr.o
  CC      arch/x86/kernel/pci-dma.o
  CC      net/ipv6/udp_offload.o
  CC      net/mac80211/cfg.o
  CC      kernel/pid.o
  CC      net/sunrpc/rpc_pipe.o
  CC      net/netfilter/xt_NFLOG.o
  CC      fs/bad_inode.o
  CC      net/core/net-procfs.o
  CC      mm/process_vm_access.o
  CC      lib/sort.o
  CC      net/core/netpoll.o
  CC      net/mac80211/ethtool.o
  CC      drivers/acpi/event.o
  CC      lib/parser.o
  CC      net/ipv4/tcp_plb.o
  CC      kernel/trace/trace_uprobe.o
  CC      drivers/acpi/acpica/nswalk.o
  CC      drivers/acpi/evged.o
  CC      lib/debug_locks.o
  CC      drivers/base/map.o
  CC      drivers/acpi/sysfs.o
  CC      net/ipv6/seg6.o
  CC      kernel/task_work.o
  CC      net/sunrpc/sysfs.o
  CC      net/netfilter/xt_SECMARK.o
  CC      kernel/trace/rethook.o
  CC      lib/random32.o
  CC      fs/nfs/nfsroot.o
  CC      mm/page_alloc.o
  CC      net/ipv4/datagram.o
  CC      drivers/acpi/acpica/nsxfeval.o
  CC      net/ipv6/fib6_notifier.o
  CC      net/core/fib_rules.o
  CC      kernel/extable.o
  CC      net/mac80211/rx.o
  CC      fs/file.o
  CC      net/sunrpc/svc_xprt.o
  CC      arch/x86/kernel/quirks.o
  CC      drivers/base/devres.o
  CC      mm/page_frag_cache.o
  CC      fs/nfs/sysctl.o
  CC      net/netfilter/xt_TCPMSS.o
  CC      net/ipv4/raw.o
  CC      fs/filesystems.o
  CC      fs/nfs/nfs3super.o
  CC      lib/bust_spinlocks.o
  CC      net/wireless/shipped-certs.o
  CC      net/core/net-traces.o
  CC      drivers/base/attribute_container.o
  CC      net/mac80211/spectmgmt.o
  CC      drivers/acpi/acpica/nsxfname.o
  CC      net/ipv4/udp.o
  CC      fs/namespace.o
  CC      net/ipv4/udplite.o
  CC      lib/kasprintf.o
  CC      fs/ext4/sysfs.o
  CC      fs/ext4/xattr.o
  CC      fs/nfs/nfs3client.o
  CC      net/sunrpc/xprtmultipath.o
  CC      net/mac80211/tx.o
  CC      drivers/acpi/acpica/nsxfobj.o
  CC      drivers/base/transport_class.o
  CC      net/ipv6/rpl.o
  CC      net/core/selftests.o
  CC      net/core/ptp_classifier.o
  CC      lib/bitmap.o
  CC      net/core/netprio_cgroup.o
  CC      arch/x86/kernel/kdebugfs.o
  CC      lib/scatterlist.o
  CC      net/mac80211/key.o
  CC      net/sunrpc/stats.o
  CC      net/netfilter/xt_conntrack.o
  CC      fs/ext4/xattr_hurd.o
  CC      kernel/params.o
  CC      mm/init-mm.o
  CC      net/sunrpc/sysctl.o
  CC      net/ipv4/udp_offload.o
  CC      drivers/acpi/acpica/psargs.o
  CC      fs/ext4/xattr_trusted.o
  CC      lib/list_sort.o
  CC      arch/x86/kernel/alternative.o
  CC      arch/x86/kernel/i8253.o
  CC      drivers/base/topology.o
  CC      net/mac80211/util.o
  CC      drivers/acpi/property.o
  CC      fs/seq_file.o
  CC      arch/x86/kernel/hw_breakpoint.o
  CC      net/ipv6/ioam6.o
  CC      mm/memblock.o
  AR      kernel/trace/built-in.a
  CC      net/netfilter/xt_policy.o
  CC      drivers/base/container.o
  CC      arch/x86/kernel/tsc.o
  CC      net/core/netclassid_cgroup.o
  CC      drivers/acpi/acpica/psloop.o
  CC      drivers/acpi/debugfs.o
  CC      fs/nfs/nfs3proc.o
  CC      fs/xattr.o
  CC      fs/ext4/xattr_user.o
  CC      net/core/dst_cache.o
  CC      fs/nfs/nfs3xdr.o
  CC      fs/libfs.o
  CC      net/core/gro_cells.o
  CC      lib/uuid.o
  CC      net/ipv4/arp.o
  CC      drivers/acpi/acpica/psobject.o
  CC      kernel/kthread.o
  CC      drivers/base/property.o
  CC      fs/nfs/nfs3acl.o
  CC      drivers/acpi/acpica/psopcode.o
  CC      net/netfilter/xt_state.o
  CC      net/mac80211/parse.o
  CC      fs/fs-writeback.o
  CC      drivers/acpi/acpi_lpat.o
  CC      mm/slub.o
  CC      lib/iov_iter.o
  CC      net/ipv4/icmp.o
  CC      drivers/base/cacheinfo.o
  CC      fs/nfs/nfs4proc.o
  CC      net/mac80211/wme.o
  CC      drivers/acpi/acpica/psopinfo.o
  CC      drivers/acpi/acpica/psparse.o
  CC      fs/pnode.o
  CC      drivers/acpi/acpica/psscope.o
  CC      mm/madvise.o
  CC      net/ipv4/devinet.o
  CC      kernel/sys_ni.o
  CC [M]  net/netfilter/nf_log_syslog.o
  CC      net/ipv6/sysctl_net_ipv6.o
  CC      fs/nfs/nfs4xdr.o
  CC      drivers/acpi/acpi_pcc.o
  CC      lib/clz_ctz.o
  CC      drivers/acpi/acpica/pstree.o
  CC      fs/nfs/nfs4state.o
  CC      fs/splice.o
  CC      net/ipv6/xfrm6_policy.o
  CC      arch/x86/kernel/tsc_msr.o
  CC      drivers/base/swnode.o
  CC      net/ipv6/xfrm6_state.o
  AR      net/sunrpc/built-in.a
  CC      net/core/failover.o
  CC      arch/x86/kernel/io_delay.o
  CC      fs/sync.o
  CC      drivers/acpi/ac.o
  CC      fs/ext4/fast_commit.o
  CC      fs/ext4/orphan.o
  CC      net/ipv4/af_inet.o
  CC      drivers/acpi/acpica/psutils.o
  CC      drivers/acpi/acpica/pswalk.o
  CC [M]  net/netfilter/xt_mark.o
  CC      kernel/nsproxy.o
  CC      drivers/acpi/button.o
  CC [M]  net/netfilter/xt_nat.o
  CC      lib/bsearch.o
  CC      net/ipv4/igmp.o
  CC      drivers/base/auxiliary.o
  CC      drivers/acpi/acpica/psxface.o
  CC      arch/x86/kernel/rtc.o
  CC      mm/page_io.o
  CC      fs/ext4/acl.o
  CC      fs/utimes.o
  CC      drivers/acpi/fan_core.o
  CC      net/ipv4/fib_frontend.o
  CC [M]  net/netfilter/xt_LOG.o
  CC      arch/x86/kernel/resource.o
  CC [M]  net/netfilter/xt_MASQUERADE.o
  CC      drivers/acpi/acpica/rsaddr.o
  CC      fs/nfs/nfs4renewd.o
  CC      kernel/notifier.o
  CC      fs/d_path.o
  CC      lib/find_bit.o
  CC      fs/nfs/nfs4super.o
  CC      drivers/base/devtmpfs.o
  CC      fs/stack.o
  CC      mm/swap_state.o
  CC      drivers/acpi/fan_attr.o
  CC      drivers/acpi/acpica/rscalc.o
  CC      kernel/ksysfs.o
  AS      arch/x86/kernel/irqflags.o
  CC      fs/ext4/xattr_security.o
  CC      arch/x86/kernel/static_call.o
  CC      net/mac80211/chan.o
  CC      net/ipv6/xfrm6_input.o
  CC      lib/llist.o
  CC [M]  net/netfilter/xt_addrtype.o
  CC      net/ipv4/fib_semantics.o
  CC      drivers/base/module.o
  CC      drivers/acpi/fan_hwmon.o
  CC      arch/x86/kernel/process.o
  CC      mm/swapfile.o
  CC      net/ipv6/xfrm6_output.o
  CC      net/ipv6/xfrm6_protocol.o
  CC      net/mac80211/trace.o
  CC      drivers/base/auxiliary_sysfs.o
  CC      fs/nfs/nfs4file.o
  CC      drivers/acpi/acpica/rscreate.o
  CC      lib/lwq.o
  CC      arch/x86/kernel/ptrace.o
  CC      net/ipv4/fib_trie.o
  CC      net/ipv6/netfilter.o
  CC      drivers/base/devcoredump.o
  CC      fs/nfs/delegation.o
  CC      mm/swap_slots.o
  CC      drivers/base/platform-msi.o
  CC      net/mac80211/mlme.o
  CC      lib/memweight.o
  CC      drivers/acpi/acpi_video.o
  CC      drivers/acpi/acpica/rsdumpinfo.o
  CC      arch/x86/kernel/tls.o
  CC      kernel/cred.o
  CC      net/ipv6/proc.o
  CC      fs/nfs/nfs4idmap.o
  CC      lib/kfifo.o
  CC      net/ipv4/fib_notifier.o
  AR      net/core/built-in.a
  CC      arch/x86/kernel/step.o
  CC      net/ipv4/inet_fragment.o
  CC      mm/dmapool.o
  CC      net/mac80211/tdls.o
  CC      arch/x86/kernel/i8237.o
  CC      fs/fs_struct.o
  CC      fs/statfs.o
  CC      mm/hugetlb.o
  CC      drivers/acpi/video_detect.o
  CC      drivers/acpi/acpica/rsinfo.o
  CC      kernel/reboot.o
  CC      net/ipv4/ping.o
  CC      drivers/base/physical_location.o
  CC      lib/percpu-refcount.o
  CC      kernel/async.o
  CC      arch/x86/kernel/stacktrace.o
  CC      net/mac80211/ocb.o
  CC      fs/fs_pin.o
  CC      drivers/acpi/acpica/rsio.o
  CC      drivers/acpi/processor_driver.o
  AR      net/netfilter/built-in.a
  CC      drivers/base/trace.o
  CC      net/ipv4/ip_tunnel_core.o
  CC      fs/nfs/callback.o
  CC      arch/x86/kernel/reboot.o
  CC      kernel/range.o
  CC      net/ipv4/gre_offload.o
  CC      lib/rhashtable.o
  CC      lib/base64.o
  CC      drivers/acpi/processor_thermal.o
  CC      drivers/acpi/acpica/rsirq.o
  CC      net/mac80211/airtime.o
  CC      fs/nsfs.o
  CC      fs/nfs/callback_xdr.o
  CC      mm/mmu_notifier.o
  CC      drivers/acpi/acpica/rslist.o
  CC      net/ipv6/syncookies.o
  CC      net/ipv4/metrics.o
  CC      arch/x86/kernel/msr.o
  CC      net/ipv4/netlink.o
  CC      kernel/smpboot.o
  CC      net/mac80211/eht.o
  CC      fs/nfs/callback_proc.o
  CC      net/mac80211/led.o
  CC      mm/migrate.o
  CC      lib/once.o
  CC      arch/x86/kernel/cpuid.o
  CC      drivers/acpi/acpica/rsmemory.o
  CC      drivers/acpi/processor_idle.o
  CC      mm/page_counter.o
  CC      net/ipv6/calipso.o
  CC      net/ipv4/nexthop.o
  CC      net/ipv4/udp_tunnel_stub.o
  CC      net/ipv6/ah6.o
  CC      fs/nfs/nfs4namespace.o
  CC      fs/fs_types.o
  CC      arch/x86/kernel/early-quirks.o
  CC      lib/refcount.o
  CC      net/mac80211/pm.o
  AR      drivers/base/built-in.a
  CC      drivers/acpi/acpica/rsmisc.o
  CC      net/ipv6/esp6.o
  CC      lib/rcuref.o
  CC      net/ipv4/ip_tunnel.o
  CC      kernel/ucount.o
  CC      fs/nfs/nfs4getroot.o
  CC      fs/fs_context.o
  CC      lib/usercopy.o
  CC      drivers/acpi/processor_throttling.o
  CC      mm/hugetlb_cgroup.o
  CC      fs/fs_parser.o
  CC      arch/x86/kernel/smp.o
  CC      net/ipv6/sit.o
  CC      arch/x86/kernel/smpboot.o
  CC      fs/fsopen.o
  CC      fs/init.o
  CC      arch/x86/kernel/tsc_sync.o
  AR      fs/ext4/built-in.a
  CC      lib/errseq.o
  CC      net/ipv4/sysctl_net_ipv4.o
  CC      kernel/regset.o
  CC      mm/early_ioremap.o
  CC      net/mac80211/rc80211_minstrel_ht.o
  CC      net/ipv6/addrconf_core.o
  CC      drivers/acpi/acpica/rsserial.o
  CC      mm/secretmem.o
  CC      lib/bucket_locks.o
  CC      kernel/ksyms_common.o
  CC      fs/nfs/nfs4client.o
  CC      net/ipv4/proc.o
  CC      arch/x86/kernel/setup_percpu.o
  CC      net/ipv4/fib_rules.o
  CC      net/ipv4/ipmr.o
  CC      net/ipv4/ipmr_base.o
  CC      drivers/acpi/processor_perflib.o
  CC      net/mac80211/wbrf.o
  CC      kernel/groups.o
  CC      fs/nfs/nfs4session.o
  CC      net/ipv4/syncookies.o
  CC      drivers/acpi/container.o
  CC      fs/kernel_read_file.o
  CC      drivers/acpi/acpica/rsutils.o
  CC      kernel/kcmp.o
  CC      lib/generic-radix-tree.o
  CC      mm/hmm.o
  CC      net/ipv6/exthdrs_core.o
  CC      fs/nfs/dns_resolve.o
  CC      net/ipv4/tunnel4.o
  CC      arch/x86/kernel/mpparse.o
  CC      lib/bitmap-str.o
  CC      net/ipv6/ip6_checksum.o
  CC      drivers/acpi/acpica/rsxface.o
  CC      lib/string_helpers.o
  CC      mm/memfd.o
  CC      kernel/freezer.o
  CC      drivers/acpi/thermal_lib.o
  CC      fs/mnt_idmapping.o
  CC      kernel/profile.o
  CC      net/ipv6/ip6_icmp.o
  CC      net/ipv4/ipconfig.o
  CC      drivers/acpi/acpica/tbdata.o
  CC      lib/hexdump.o
  CC      kernel/stacktrace.o
  CC      drivers/acpi/thermal.o
  CC      kernel/dma.o
  CC      fs/remap_range.o
  CC      net/ipv4/netfilter.o
  CC      fs/nfs/nfs4trace.o
  AR      net/wireless/built-in.a
  CC      fs/nfs/nfs4sysctl.o
  CC      net/ipv6/output_core.o
  CC      lib/kstrtox.o
  CC      mm/ptdump.o
  CC      arch/x86/kernel/trace_clock.o
  CC      drivers/acpi/nhlt.o
  CC      kernel/smp.o
  CC      net/ipv6/protocol.o
  CC      net/ipv4/tcp_cubic.o
  CC      lib/iomap.o
  CC      mm/execmem.o
  CC      drivers/acpi/acpi_memhotplug.o
  CC      lib/iomap_copy.o
  CC      drivers/acpi/acpica/tbfadt.o
  CC      net/ipv6/ip6_offload.o
  CC      arch/x86/kernel/trace.o
  CC      kernel/uid16.o
  CC      net/ipv4/tcp_sigpool.o
  CC      lib/devres.o
  CC      net/ipv6/tcpv6_offload.o
  CC      net/ipv6/exthdrs_offload.o
  CC      net/ipv6/inet6_hashtables.o
  CC      kernel/kallsyms.o
  CC      lib/check_signature.o
  CC      net/ipv6/mcast_snoop.o
  CC      kernel/acct.o
  CC      drivers/acpi/acpica/tbfind.o
  CC      arch/x86/kernel/rethook.o
  CC      lib/interval_tree.o
  CC      fs/pidfs.o
  CC      net/ipv4/cipso_ipv4.o
  CC      kernel/vmcore_info.o
  CC      drivers/acpi/acpica/tbinstal.o
  CC      arch/x86/kernel/vmcore_info_32.o
  CC      fs/buffer.o
  CC      drivers/acpi/acpica/tbprint.o
  CC      fs/mpage.o
  CC      kernel/elfcorehdr.o
  CC      net/ipv4/xfrm4_policy.o
  CC      drivers/acpi/acpica/tbutils.o
  CC      drivers/acpi/ioapic.o
  CC      arch/x86/kernel/machine_kexec_32.o
  CC      kernel/crash_reserve.o
  CC      drivers/acpi/acpica/tbxface.o
  CC      fs/proc_namespace.o
  AS      arch/x86/kernel/relocate_kernel_32.o
  CC      drivers/acpi/battery.o
  CC      kernel/kexec_core.o
  CC      drivers/acpi/bgrt.o
  CC      lib/assoc_array.o
  CC      lib/bitrev.o
  CC      drivers/acpi/acpica/tbxfload.o
  CC      fs/direct-io.o
  CC      kernel/crash_core.o
  AR      mm/built-in.a
  CC      kernel/kexec.o
  CC      lib/crc-ccitt.o
  CC      fs/eventpoll.o
  CC      lib/crc16.o
  CC      arch/x86/kernel/crash_dump_32.o
  CC      drivers/acpi/acpica/tbxfroot.o
  CC      kernel/utsname.o
  CC      fs/anon_inodes.o
  CC      drivers/acpi/spcr.o
  HOSTCC  lib/gen_crc32table
  CC      net/ipv4/xfrm4_state.o
  CC      drivers/acpi/acpica/utaddress.o
  CC      lib/xxhash.o
  CC      kernel/pid_namespace.o
  CC      fs/signalfd.o
  CC      lib/genalloc.o
  CC      kernel/stop_machine.o
  CC      drivers/acpi/acpica/utalloc.o
  CC      net/ipv4/xfrm4_input.o
  CC      arch/x86/kernel/crash.o
  CC      fs/timerfd.o
  CC      kernel/audit.o
  CC      lib/percpu_counter.o
  CC      kernel/auditfilter.o
  CC      drivers/acpi/acpica/utascii.o
  CC      fs/eventfd.o
  CC      kernel/auditsc.o
  CC      kernel/audit_watch.o
  CC      fs/aio.o
  CC      net/ipv4/xfrm4_output.o
  CC      lib/audit.o
  CC      arch/x86/kernel/module.o
  CC      drivers/acpi/acpica/utbuffer.o
  CC      fs/locks.o
  CC      kernel/audit_fsnotify.o
  CC      lib/syscall.o
  CC      fs/binfmt_misc.o
  CC      kernel/audit_tree.o
  CC      drivers/acpi/acpica/utcksum.o
  CC      net/ipv4/xfrm4_protocol.o
  CC      fs/binfmt_script.o
  CC      lib/errname.o
  CC      kernel/kprobes.o
  CC      arch/x86/kernel/doublefault_32.o
  CC      drivers/acpi/acpica/utcopy.o
  CC      kernel/seccomp.o
  CC      fs/binfmt_elf.o
  CC      lib/nlattr.o
  CC      drivers/acpi/acpica/utexcep.o
  CC      arch/x86/kernel/early_printk.o
  CC      kernel/relay.o
  CC      fs/mbcache.o
  CC      arch/x86/kernel/hpet.o
  CC      drivers/acpi/acpica/utdebug.o
  AR      net/ipv6/built-in.a
  CC      kernel/utsname_sysctl.o
  CC      drivers/acpi/acpica/utdecode.o
  CC      lib/cpu_rmap.o
  CC      kernel/delayacct.o
  CC      fs/posix_acl.o
  CC      arch/x86/kernel/amd_nb.o
  CC      kernel/taskstats.o
  CC      drivers/acpi/acpica/utdelete.o
  CC      fs/coredump.o
  CC      arch/x86/kernel/amd_node.o
  CC      arch/x86/kernel/kvm.o
  CC      lib/dynamic_queue_limits.o
  CC      drivers/acpi/acpica/uterror.o
  CC      lib/glob.o
  CC      drivers/acpi/acpica/uteval.o
  CC      arch/x86/kernel/kvmclock.o
  CC      kernel/tsacct.o
  CC      drivers/acpi/acpica/utglobal.o
  CC      fs/drop_caches.o
  CC      lib/strncpy_from_user.o
  CC      kernel/tracepoint.o
  CC      fs/sysctls.o
  CC      drivers/acpi/acpica/uthex.o
  CC      lib/strnlen_user.o
  CC      lib/net_utils.o
  CC      drivers/acpi/acpica/utids.o
  CC      arch/x86/kernel/paravirt.o
  CC      fs/fhandle.o
  CC      lib/sg_pool.o
  CC      drivers/acpi/acpica/utinit.o
  CC      arch/x86/kernel/pvclock.o
  CC      drivers/acpi/acpica/utlock.o
  CC      kernel/irq_work.o
  CC      lib/stackdepot.o
  CC      kernel/static_call.o
  CC      arch/x86/kernel/pcspeaker.o
  CC      arch/x86/kernel/check.o
  CC      drivers/acpi/acpica/utmath.o
  CC      lib/asn1_decoder.o
  CC      kernel/padata.o
  CC      drivers/acpi/acpica/utmisc.o
  CC      kernel/jump_label.o
  CC      arch/x86/kernel/uprobes.o
  GEN     lib/oid_registry_data.c
  CC      drivers/acpi/acpica/utmutex.o
  CC      lib/ucs2_string.o
  CC      drivers/acpi/acpica/utnonansi.o
  CC      kernel/context_tracking.o
  AR      net/ipv4/built-in.a
  CC      arch/x86/kernel/perf_regs.o
  CC      lib/sbitmap.o
  CC      drivers/acpi/acpica/utobject.o
  CC      kernel/iomem.o
  CC      drivers/acpi/acpica/utosi.o
  CC      arch/x86/kernel/tracepoint.o
  CC      arch/x86/kernel/itmt.o
  CC      kernel/rseq.o
  CC      arch/x86/kernel/umip.o
  CC      arch/x86/kernel/unwind_frame.o
  CC      drivers/acpi/acpica/utownerid.o
  CC      lib/group_cpus.o
  CC      drivers/acpi/acpica/utpredef.o
  CC      lib/fw_table.o
  CC      drivers/acpi/acpica/utresdecode.o
  CC      drivers/acpi/acpica/utresrc.o
  AR      lib/lib.a
  GEN     lib/crc32table.h
  CC      lib/oid_registry.o
  CC      lib/crc32.o
  CC      drivers/acpi/acpica/utstate.o
  CC      drivers/acpi/acpica/utstring.o
  CC      drivers/acpi/acpica/utstrsuppt.o
  CC      drivers/acpi/acpica/utstrtoul64.o
  CC      drivers/acpi/acpica/utxface.o
  CC      drivers/acpi/acpica/utxfinit.o
  CC      drivers/acpi/acpica/utxferror.o
  CC      drivers/acpi/acpica/utxfmutex.o
  AR      fs/nfs/built-in.a
  AR      drivers/acpi/acpica/built-in.a
  AR      drivers/acpi/built-in.a
make[2]: *** [/workspace/kernel/scripts/Makefile.build:465: drivers] Error 2
make[2]: *** Waiting for unfinished jobs....
  AR      lib/built-in.a
  AR      arch/x86/kernel/built-in.a
  AR      arch/x86/built-in.a
  AR      fs/built-in.a
  AR      kernel/built-in.a
  AR      net/mac80211/built-in.a
  AR      net/built-in.a
make[1]: *** [/workspace/kernel/Makefile:1994: .] Error 2
make: *** [/workspace/kernel/Makefile:251: __sub-make] Error 2
run-parts: /workspace/ci/hooks/11-build-32b exited with return code 2


