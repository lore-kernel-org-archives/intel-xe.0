Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F063C61DB9
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 12:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F55A10E616;
	Fri, 28 Aug 2026 12:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SrOyL6Lk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A6B10E616
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 12:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787920706; x=1819456706;
 h=date:from:to:cc:subject:message-id;
 bh=0S6XECDYQ2KxO5Z0pkg99uZ0JVaYDl3ooOWud5DzQCw=;
 b=SrOyL6Lk3JEkS7Gd4drPLcC4r3Sxa14xBc8ids05jItOBnWQBLCGJkVo
 ZrZ8pS2UWid1O9Kbc2FoBNmmZIfWZjirVacKvu5WEhDEWwkgf9pm5G7nb
 i5jZur68yXzxcp4Gx1gB1slVi41efL+jcS2eWAqO9tNz83qV1M2uB+FvY
 Rb06/jPHjmhu27ZiUql5nQaGBoRJwe63gohWNjQ7P5D8dZm9n3npKi59E
 sgn30pi9vaFsBYz23jD92EdJad8Tbalt3Sg226DdF8jCu3Q82gqyAl93K
 g9rSO7hk9V+9mI7/Qttp0ouJivS67g3PP7xHdjVDWgpL+1253Ywm5SFJS Q==;
X-CSE-ConnectionGUID: Lb85CPaJRCGuS13Thjlayw==
X-CSE-MsgGUID: vcsQiaaRRNuOLvnCXzgroA==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="87371792"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="87371792"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 05:38:26 -0700
X-CSE-ConnectionGUID: 0HWYFJa3TTKBncfmCipdFg==
X-CSE-MsgGUID: epZl9VVJQYW1VNQzX3ynag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="264889836"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 28 Aug 2026 05:38:25 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wzvqg-00000000B7c-3FXK;
 Fri, 28 Aug 2026 12:38:22 +0000
Date: Fri, 28 Aug 2026 20:38:12 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 04984fcdbf6876c940c01026a7404c1e9cc91ba7
Message-ID: <202608282052.ZDXXgd7A-lkp@intel.com>
User-Agent: s-nail v14.9.25
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: 04984fcdbf6876c940c01026a7404c1e9cc91ba7  drm/xe/sysctrl: Read mailbox phase bit from hardware

elapsed time: 2910m

configs tested: 282
configs skipped: 21

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-14
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-14
arc                              allyesconfig    clang-24
arc                                 defconfig    gcc-16.1.0
arc                        nsim_700_defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-16.1.0
arc                   randconfig-001-20260827    gcc-15.2.0
arc                   randconfig-001-20260827    gcc-16.1.0
arc                            randconfig-002    gcc-16.1.0
arc                   randconfig-002-20260827    gcc-15.2.0
arc                   randconfig-002-20260827    gcc-16.1.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-14
arm                       aspeed_g5_defconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                            mmp2_defconfig    gcc-16.1.0
arm                        neponset_defconfig    gcc-16.1.0
arm                             pxa_defconfig    clang-19
arm                            qcom_defconfig    gcc-16.1.0
arm                            randconfig-001    gcc-16.1.0
arm                   randconfig-001-20260827    gcc-15.2.0
arm                   randconfig-001-20260827    gcc-16.1.0
arm                            randconfig-002    gcc-16.1.0
arm                   randconfig-002-20260827    gcc-15.2.0
arm                   randconfig-002-20260827    gcc-16.1.0
arm                            randconfig-003    gcc-16.1.0
arm                   randconfig-003-20260827    gcc-15.2.0
arm                   randconfig-003-20260827    gcc-16.1.0
arm                            randconfig-004    gcc-16.1.0
arm                   randconfig-004-20260827    gcc-15.2.0
arm                   randconfig-004-20260827    gcc-16.1.0
arm                         socfpga_defconfig    gcc-16.1.0
arm                           stm32_defconfig    gcc-16.1.0
arm64                            alldefconfig    clang-19
arm64                            allmodconfig    clang-14
arm64                            allmodconfig    clang-24
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260827    clang-21
arm64                 randconfig-001-20260827    gcc-8.5.0
arm64                 randconfig-002-20260827    clang-21
arm64                 randconfig-002-20260827    gcc-8.5.0
arm64                 randconfig-003-20260827    clang-21
arm64                 randconfig-004-20260827    clang-21
arm64                 randconfig-004-20260827    gcc-8.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260827    clang-21
csky                  randconfig-001-20260827    gcc-8.5.0
csky                  randconfig-002-20260827    clang-21
csky                  randconfig-002-20260827    gcc-8.5.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-24
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260827    gcc-16.1.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260827    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260827    clang-22
i386        buildonly-randconfig-002-20260827    clang-22
i386        buildonly-randconfig-003-20260827    clang-22
i386        buildonly-randconfig-004-20260827    clang-22
i386        buildonly-randconfig-005-20260827    clang-22
i386        buildonly-randconfig-006-20260827    clang-22
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    gcc-14
i386                  randconfig-001-20260827    gcc-14
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260827    gcc-14
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260827    gcc-14
i386                           randconfig-004    gcc-14
i386                  randconfig-004-20260827    gcc-14
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260827    gcc-14
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260827    gcc-14
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260827    gcc-14
i386                           randconfig-011    gcc-13
i386                  randconfig-011-20260827    clang-22
i386                  randconfig-011-20260827    gcc-13
i386                           randconfig-012    gcc-13
i386                  randconfig-012-20260827    gcc-13
i386                           randconfig-013    gcc-13
i386                  randconfig-013-20260827    gcc-13
i386                           randconfig-014    gcc-13
i386                  randconfig-014-20260827    gcc-13
i386                           randconfig-015    gcc-13
i386                  randconfig-015-20260827    gcc-13
i386                           randconfig-016    gcc-13
i386                  randconfig-016-20260827    gcc-13
i386                           randconfig-017    gcc-13
i386                  randconfig-017-20260827    gcc-13
loongarch                        alldefconfig    gcc-16.1.0
loongarch                        allmodconfig    clang-14
loongarch                        allmodconfig    clang-24
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-14
loongarch                           defconfig    clang-24
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260827    gcc-16.1.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260827    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-14
m68k                                defconfig    clang-14
m68k                                defconfig    clang-24
m68k                         nettel_defconfig    gcc-16.1.0
m68k                            q40_defconfig    clang-19
microblaze                       alldefconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-14
microblaze                          defconfig    clang-24
microblaze                      mmu_defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                       bmips_be_defconfig    gcc-16.1.0
mips                           gcw0_defconfig    clang-19
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-14
nios2                             allnoconfig    clang-24
nios2                               defconfig    clang-14
nios2                               defconfig    clang-24
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260827    gcc-16.1.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260827    gcc-16.1.0
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-14
openrisc                          allnoconfig    clang-24
openrisc         de0_nano_multicore_defconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
openrisc                    or1ksim_defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-14
parisc                            allnoconfig    clang-24
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                generic-32bit_defconfig    clang-19
parisc                randconfig-001-20260827    gcc-14.3.0
parisc                randconfig-002-20260827    gcc-14.3.0
parisc64                            defconfig    clang-14
parisc64                            defconfig    clang-24
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-14
powerpc                           allnoconfig    clang-24
powerpc                    amigaone_defconfig    gcc-16.1.0
powerpc                      ep88xc_defconfig    gcc-16.1.0
powerpc                    gamecube_defconfig    clang-19
powerpc               mpc834x_itxgp_defconfig    gcc-16.1.0
powerpc               randconfig-001-20260827    gcc-14.3.0
powerpc               randconfig-002-20260827    gcc-14.3.0
powerpc                     tqm5200_defconfig    clang-19
powerpc                     tqm8540_defconfig    gcc-16.1.0
powerpc                     tqm8541_defconfig    gcc-16.1.0
powerpc64             randconfig-001-20260827    gcc-14.3.0
powerpc64             randconfig-002-20260827    gcc-14.3.0
riscv                            allmodconfig    clang-14
riscv                            allmodconfig    clang-24
riscv                             allnoconfig    clang-14
riscv                             allnoconfig    clang-24
riscv                            allyesconfig    clang-14
riscv                               defconfig    gcc-16.1.0
riscv             nommu_k210_sdcard_defconfig    gcc-16.1.0
riscv                          randconfig-001    clang-14
riscv                 randconfig-001-20260827    clang-14
riscv                          randconfig-002    clang-14
riscv                 randconfig-002-20260827    clang-14
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-14
s390                              allnoconfig    clang-24
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    clang-14
s390                  randconfig-001-20260827    clang-14
s390                           randconfig-002    clang-14
s390                  randconfig-002-20260827    clang-14
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-14
sh                                allnoconfig    clang-24
sh                               allyesconfig    clang-17
sh                        apsh4ad0a_defconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-16.1.0
sh                             randconfig-001    clang-14
sh                    randconfig-001-20260827    clang-14
sh                             randconfig-002    clang-14
sh                    randconfig-002-20260827    clang-14
sh                     sh7710voipgw_defconfig    gcc-16.1.0
sh                            shmin_defconfig    clang-19
sparc                             allnoconfig    clang-14
sparc                             allnoconfig    clang-24
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260827    gcc-10.5.0
sparc                 randconfig-002-20260827    gcc-10.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260827    gcc-10.5.0
sparc64               randconfig-002-20260827    gcc-10.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-14
um                                allnoconfig    clang-24
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260827    gcc-10.5.0
um                    randconfig-002-20260827    gcc-10.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-14
x86_64                            allnoconfig    clang-24
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260827    clang-22
x86_64      buildonly-randconfig-002-20260827    clang-22
x86_64      buildonly-randconfig-003-20260827    clang-22
x86_64      buildonly-randconfig-004-20260827    clang-22
x86_64      buildonly-randconfig-005-20260827    clang-22
x86_64      buildonly-randconfig-006-20260827    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260827    clang-22
x86_64                randconfig-001-20260828    gcc-14
x86_64                randconfig-002-20260827    clang-22
x86_64                randconfig-002-20260827    gcc-14
x86_64                randconfig-002-20260828    gcc-14
x86_64                randconfig-003-20260827    clang-22
x86_64                randconfig-003-20260827    gcc-14
x86_64                randconfig-003-20260828    gcc-14
x86_64                randconfig-004-20260827    clang-22
x86_64                randconfig-004-20260827    gcc-14
x86_64                randconfig-004-20260828    gcc-14
x86_64                randconfig-005-20260827    clang-22
x86_64                randconfig-005-20260828    gcc-14
x86_64                randconfig-006-20260827    clang-22
x86_64                randconfig-006-20260828    gcc-14
x86_64                         randconfig-011    clang-22
x86_64                randconfig-011-20260827    clang-22
x86_64                         randconfig-012    clang-22
x86_64                randconfig-012-20260827    clang-22
x86_64                         randconfig-013    clang-22
x86_64                randconfig-013-20260827    clang-22
x86_64                         randconfig-014    clang-22
x86_64                randconfig-014-20260827    clang-22
x86_64                         randconfig-015    clang-22
x86_64                randconfig-015-20260827    clang-22
x86_64                         randconfig-016    clang-22
x86_64                randconfig-016-20260827    clang-22
x86_64                randconfig-071-20260827    gcc-14
x86_64                randconfig-072-20260827    gcc-14
x86_64                randconfig-073-20260827    gcc-14
x86_64                randconfig-074-20260827    gcc-14
x86_64                randconfig-075-20260827    gcc-14
x86_64                randconfig-076-20260827    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-14
xtensa                            allnoconfig    clang-24
xtensa                           allyesconfig    clang-20
xtensa                generic_kc705_defconfig    gcc-16.1.0
xtensa                randconfig-001-20260827    gcc-10.5.0
xtensa                randconfig-002-20260827    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
