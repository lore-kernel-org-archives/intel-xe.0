Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90982C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 06:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF63710E8DA;
	Thu, 14 Dec 2023 06:25:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806E310E8D4
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 06:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702535097; x=1734071097;
 h=date:from:to:cc:subject:message-id;
 bh=3JL2DK1JYF+UcHp2562SPASWA3UtJRoz9c5EMyH1a2M=;
 b=XBCfm1QOVj2uuHJF3RAzJCNFpxLPYqTMSSpHnaDn6WimDlY5RNm0gPif
 JhbQXux/mKT2+3y/w6wTjh1aH2ByPPkUePfAL20+7F3pRckxUBagXTX2P
 G+xSmXJb4Tb7/SluEwQLuZE6SYjDTtaqzbZQ9bI+w40Ox/7kO4Ygbd8wZ
 bpflnZVMip23+dqr8VXl/WMcOFZpF0mjMhE9DvxGaocodZBIwTX7T0MMg
 4Vsds+NKqqGofC8fLbuoxtAR6LWad2H0aHTW5MupqPD0cDqLshbfZAnMN
 in4rpthiRmHt6NBCvMqozmSv4wJmz/rrtuZ/Arho86oWlG0mDtD4oF6Vo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="375230286"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="375230286"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 22:24:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="22271807"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 13 Dec 2023 22:24:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rDf9Q-000Lgj-38;
 Thu, 14 Dec 2023 06:24:52 +0000
Date: Thu, 14 Dec 2023 14:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [drm-xe:drm-xe-next] BUILD REGRESSION
 5cd1893366708380854f4694ae57417192458a6b
Message-ID: <202312141409.9kmz0PpX-lkp@intel.com>
User-Agent: s-nail v14.9.24
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: 5cd1893366708380854f4694ae57417192458a6b  drm/xe/xe2: Support flat ccs

Unverified Error/Warning (likely false positive, please contact us if interested):

(.ref.text+0xd8): relocation truncated to fit: R_MIPS_26 against `start_secondary'
(.text+0x0): relocation truncated to fit: R_MIPS_26 against `kernel_entry'
xe_device.c:(.text.xe_device_ccs_bytes+0xa0): undefined reference to `__udivdi3'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-allmodconfig
|   `-- drivers-gpu-drm-xe-compat-i915-headers-gem-i915_gem_object.h:error:implicit-declaration-of-function-readq
|-- arm-allmodconfig
|   `-- drivers-gpu-drm-xe-compat-i915-headers-gem-i915_gem_object.h:error:implicit-declaration-of-function-readq
|-- csky-allmodconfig
|   `-- drivers-gpu-drm-xe-compat-i915-headers-gem-i915_gem_object.h:error:implicit-declaration-of-function-readq
|-- i386-randconfig-015-20231213
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-bridge-test.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-mgr-test.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-region-test.o
|-- i386-randconfig-141-20231214
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-bridge-test.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-mgr-test.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-region-test.o
|-- loongarch-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-nomadik-rng.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-st-rng.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-gpu-drm-xe-tests-xe_mocs_test.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-nvme-common-nvme-common.o
|-- m68k-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-nomadik-rng.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-st-rng.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-nvme-common-nvme-common.o
|-- microblaze-allmodconfig
|   `-- drivers-gpu-drm-xe-compat-i915-headers-gem-i915_gem_object.h:error:implicit-declaration-of-function-readq
|-- mips-allyesconfig
|   |-- (.ref.text):relocation-truncated-to-fit:R_MIPS_26-against-start_secondary
|   |-- (.text):relocation-truncated-to-fit:R_MIPS_26-against-kernel_entry
|   `-- xe_device.c:(.text.xe_device_ccs_bytes):undefined-reference-to-__udivdi3
|-- nios2-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-nomadik-rng.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-st-rng.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-nvme-common-nvme-common.o
|-- parisc-allmodconfig
|   `-- drivers-gpu-drm-xe-compat-i915-headers-gem-i915_gem_object.h:error:implicit-declaration-of-function-readq
|-- riscv-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-nomadik-rng.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-st-rng.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-gpu-drm-xe-tests-xe_mocs_test.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-nvme-common-nvme-common.o
|-- s390-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-nomadik-rng.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-st-rng.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-gpu-drm-xe-tests-xe_mocs_test.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-nvme-common-nvme-common.o
|-- sh-randconfig-002-20231213
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-nomadik-rng.o
|-- sparc-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:CTX_VALID-redefined
|-- sparc64-allmodconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:CTX_VALID-redefined
|-- sparc64-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_lrc.c:warning:CTX_VALID-redefined
|-- x86_64-allnoconfig
|   `-- drivers-gpu-drm-xe-tests-xe_pci.c:kunit-test-bug.h-is-included-more-than-once.
|-- x86_64-buildonly-randconfig-002-20231214
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-bridge-test.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-mgr-test.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-region-test.o
|-- x86_64-randconfig-016-20231214
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-bridge-test.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-mgr-test.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-region-test.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-nvme-common-nvme-common.o
`-- xtensa-randconfig-002-20231213
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-nomadik-rng.o
    `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-nvme-common-nvme-common.o
clang_recent_errors
|-- arm-randconfig-004-20231213
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-st-rng.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-nvme-common-nvme-common.o
|-- arm64-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-nomadik-rng.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-st-rng.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-gpu-drm-xe-tests-xe_mocs_test.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-nvme-common-nvme-common.o
|   |-- drivers-gpu-drm-xe-display-xe_dsb_buffer.c:warning:variable-val-is-uninitialized-when-used-within-its-own-initialization
|   `-- drivers-gpu-drm-xe-xe_gt_freq.c:warning:variable-err-is-uninitialized-when-used-here
|-- arm64-randconfig-001-20231213
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-nomadik-rng.o
|-- arm64-randconfig-002-20231213
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-nomadik-rng.o
|-- arm64-randconfig-003-20231213
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-bridge-test.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-mgr-test.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-region-test.o
|-- hexagon-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-nomadik-rng.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-st-rng.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-nvme-common-nvme-common.o
|-- i386-allmodconfig
|   |-- drivers-gpu-drm-xe-compat-i915-headers-gem-i915_gem_object.h:error:call-to-undeclared-function-readq-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   `-- drivers-gpu-drm-xe-xe_gt_freq.c:warning:variable-err-is-uninitialized-when-used-here
|-- i386-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_gt_freq.c:warning:variable-err-is-uninitialized-when-used-here
|-- i386-buildonly-randconfig-002-20231213
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-nomadik-rng.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-bridge-test.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-mgr-test.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-region-test.o
|-- i386-buildonly-randconfig-004-20231213
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-nomadik-rng.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-st-rng.o
|-- powerpc-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-nomadik-rng.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-st-rng.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-gpu-drm-xe-tests-xe_mocs_test.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-nvme-common-nvme-common.o
|   |-- drivers-gpu-drm-xe-display-xe_dsb_buffer.c:warning:variable-val-is-uninitialized-when-used-within-its-own-initialization
|   `-- drivers-gpu-drm-xe-xe_gt_freq.c:warning:variable-err-is-uninitialized-when-used-here
|-- powerpc-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_gt_freq.c:warning:variable-err-is-uninitialized-when-used-here
|-- powerpc-randconfig-003-20231213
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-nomadik-rng.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-bridge-test.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-mgr-test.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-region-test.o
|-- powerpc64-randconfig-001-20231213
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-nomadik-rng.o
|-- powerpc64-randconfig-003-20231213
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-bridge-test.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-mgr-test.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-fpga-tests-fpga-region-test.o
|-- x86_64-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-nomadik-rng.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-hw_random-st-rng.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-gpu-drm-xe-tests-xe_mocs_test.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-nvme-common-nvme-common.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-sound-soc-amd-acp-snd-acp-pci.o
|   |-- drivers-gpu-drm-xe-display-xe_dsb_buffer.c:warning:variable-val-is-uninitialized-when-used-within-its-own-initialization
|   `-- drivers-gpu-drm-xe-xe_gt_freq.c:warning:variable-err-is-uninitialized-when-used-here
|-- x86_64-allyesconfig
|   `-- drivers-gpu-drm-xe-xe_gt_freq.c:warning:variable-err-is-uninitialized-when-used-here
`-- x86_64-randconfig-003-20231214
    `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-sound-soc-amd-acp-snd-acp-pci.o

elapsed time: 1466m

configs tested: 177
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                   randconfig-001-20231213   gcc  
arc                   randconfig-002-20231213   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                          collie_defconfig   clang
arm                                 defconfig   clang
arm                      footbridge_defconfig   gcc  
arm                   milbeaut_m10v_defconfig   clang
arm                            mmp2_defconfig   clang
arm                   randconfig-001-20231213   clang
arm                   randconfig-002-20231213   clang
arm                   randconfig-003-20231213   clang
arm                   randconfig-004-20231213   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231213   clang
arm64                 randconfig-002-20231213   clang
arm64                 randconfig-003-20231213   clang
arm64                 randconfig-004-20231213   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231213   gcc  
csky                  randconfig-002-20231213   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231213   clang
hexagon               randconfig-002-20231213   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231213   clang
i386         buildonly-randconfig-002-20231213   clang
i386         buildonly-randconfig-003-20231213   clang
i386         buildonly-randconfig-004-20231213   clang
i386         buildonly-randconfig-005-20231213   clang
i386         buildonly-randconfig-006-20231213   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231213   clang
i386                  randconfig-002-20231213   clang
i386                  randconfig-003-20231213   clang
i386                  randconfig-004-20231213   clang
i386                  randconfig-005-20231213   clang
i386                  randconfig-006-20231213   clang
i386                  randconfig-011-20231213   gcc  
i386                  randconfig-012-20231213   gcc  
i386                  randconfig-013-20231213   gcc  
i386                  randconfig-014-20231213   gcc  
i386                  randconfig-015-20231213   gcc  
i386                  randconfig-016-20231213   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231213   gcc  
loongarch             randconfig-002-20231213   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                           gcw0_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231213   gcc  
nios2                 randconfig-002-20231213   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231213   gcc  
parisc                randconfig-002-20231213   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        icon_defconfig   clang
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc               randconfig-001-20231213   clang
powerpc               randconfig-002-20231213   clang
powerpc               randconfig-003-20231213   clang
powerpc64             randconfig-001-20231213   clang
powerpc64             randconfig-002-20231213   clang
powerpc64             randconfig-003-20231213   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231213   clang
riscv                 randconfig-002-20231213   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231213   gcc  
s390                  randconfig-002-20231213   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20231213   gcc  
sh                    randconfig-002-20231213   gcc  
sh                           se7750_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231213   gcc  
sparc64               randconfig-002-20231213   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231213   clang
um                    randconfig-002-20231213   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231214   gcc  
x86_64       buildonly-randconfig-002-20231214   gcc  
x86_64       buildonly-randconfig-003-20231214   gcc  
x86_64       buildonly-randconfig-004-20231214   gcc  
x86_64       buildonly-randconfig-005-20231214   gcc  
x86_64       buildonly-randconfig-006-20231214   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231214   clang
x86_64                randconfig-002-20231214   clang
x86_64                randconfig-003-20231214   clang
x86_64                randconfig-004-20231214   clang
x86_64                randconfig-005-20231214   clang
x86_64                randconfig-006-20231214   clang
x86_64                randconfig-011-20231214   gcc  
x86_64                randconfig-012-20231214   gcc  
x86_64                randconfig-013-20231214   gcc  
x86_64                randconfig-014-20231214   gcc  
x86_64                randconfig-015-20231214   gcc  
x86_64                randconfig-016-20231214   gcc  
x86_64                randconfig-071-20231214   gcc  
x86_64                randconfig-072-20231214   gcc  
x86_64                randconfig-073-20231214   gcc  
x86_64                randconfig-074-20231214   gcc  
x86_64                randconfig-075-20231214   gcc  
x86_64                randconfig-076-20231214   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                randconfig-001-20231213   gcc  
xtensa                randconfig-002-20231213   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
