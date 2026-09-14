Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1139BC88E72
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 21:18:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF20110F27C;
	Mon, 14 Sep 2026 21:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SScTSykP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A647210F27C
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Sep 2026 21:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789420723; x=1820956723;
 h=date:from:to:cc:subject:message-id;
 bh=o5KzFVSBWJHiMEaS4D9CpYGU9NyQfvSJ2iY+jf1t53A=;
 b=SScTSykPg1eJqoHxU/jJs2qgfTnER4HiNd5Y3ZnDosCBhA4AoL/3ELZa
 461hc0KhIwo0AbN85fK1k6hLffLHPg3nALFTV2ORGkyBICNwLh5/OysLW
 psaqaT5DBdUbHW3uY0ttpXSkcfo+DSo90xu9+KQQ7gutbpM/LPouYsg0X
 dl6NZZdS4FHbo2a5dB4Vl4BwCGyzYdzsmNrMaxPXaXLYJM9RP3UyIyOwH
 8vC6UP6H4/snNkhHTJyT2oZfXDnS9JX27hjV2K/zkWFsrDog6zwciZ/sL
 OMsX7P2GW/DQxFY0gPP1uX3lVnZEXGBgpWRmbGekqGRswZAZ04d/GJ2ph Q==;
X-CSE-ConnectionGUID: ljqtXKGjSUSp4zE5wKoXOQ==
X-CSE-MsgGUID: fAazlfTiS3+eKJkh0CrkDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100443232"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100443232"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 14:18:43 -0700
X-CSE-ConnectionGUID: EhXIG06qQpqMlDmTKGi6aw==
X-CSE-MsgGUID: SWw7Ll6gTB6hKaMt+b9Y3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="311023875"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 14 Sep 2026 14:18:41 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1x6E4U-000000003Wh-2E2u;
 Mon, 14 Sep 2026 21:18:38 +0000
Date: Tue, 15 Sep 2026 05:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 7dbd24e9d5311b6afdbdd875dd247ab5ff54edca
Message-ID: <202609150524.O8V69qOL-lkp@intel.com>
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
branch HEAD: 7dbd24e9d5311b6afdbdd875dd247ab5ff54edca  drm/xe/log: Relax location ID recognition

elapsed time: 2778m

configs tested: 297
configs skipped: 27

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
alpha                randconfig-r121-20260914    gcc-12.5.0 sparse
alpha                randconfig-r123-20260914    gcc-8.5.0 sparse
alpha                randconfig-r132-20260914    gcc-12.5.0 sparse
arc                              alldefconfig    gcc-16.1.0
arc                              allmodconfig    clang-24
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-24
arc                                 defconfig    gcc-16.1.0
arc                         haps_hs_defconfig    clang-24
arc                            hsdk_defconfig    gcc-16.1.0
arc                   randconfig-001-20260914    gcc-13.4.0
arc                   randconfig-001-20260915    clang-24
arc                   randconfig-002-20260914    gcc-13.4.0
arc                   randconfig-002-20260915    clang-24
arc                  randconfig-r132-20260914    gcc-14 sparse
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-24
arm                                 defconfig    gcc-16.1.0
arm                          gemini_defconfig    gcc-16.1.0
arm                           imxrt_defconfig    gcc-16.1.0
arm                        keystone_defconfig    gcc-16.1.0
arm                            mmp2_defconfig    gcc-16.1.0
arm                   randconfig-001-20260914    gcc-13.4.0
arm                   randconfig-001-20260915    clang-24
arm                   randconfig-002-20260914    gcc-13.4.0
arm                   randconfig-002-20260915    clang-24
arm                   randconfig-003-20260914    gcc-13.4.0
arm                   randconfig-003-20260915    clang-24
arm                   randconfig-004-20260914    gcc-13.4.0
arm                   randconfig-004-20260915    clang-24
arm                  randconfig-r112-20260914    gcc-8.5.0 sparse
arm                  randconfig-r134-20260914    gcc-8.5.0 sparse
arm                         socfpga_defconfig    gcc-16.1.0
arm                    vt8500_v6_v7_defconfig    gcc-14
arm                    vt8500_v6_v7_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-24
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260914    gcc-9.5.0
arm64                 randconfig-001-20260915    gcc-12.5.0
arm64                 randconfig-002-20260914    gcc-9.5.0
arm64                 randconfig-002-20260915    gcc-12.5.0
arm64                 randconfig-003-20260914    gcc-9.5.0
arm64                 randconfig-003-20260915    gcc-12.5.0
arm64                 randconfig-004-20260914    gcc-9.5.0
arm64                 randconfig-004-20260915    gcc-12.5.0
arm64                randconfig-r112-20260915    clang-24 sparse
arm64                randconfig-r113-20260914    clang-24 sparse
arm64                randconfig-r122-20260914    clang-24 sparse
arm64                randconfig-r122-20260914    gcc-8.5.0 sparse
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260914    gcc-9.5.0
csky                  randconfig-001-20260915    gcc-12.5.0
csky                  randconfig-002-20260914    gcc-9.5.0
csky                  randconfig-002-20260915    gcc-12.5.0
csky                 randconfig-r121-20260914    clang-24 sparse
csky                 randconfig-r121-20260915    clang-24 sparse
csky                 randconfig-r122-20260914    gcc-12.5.0 sparse
csky                 randconfig-r131-20260914    gcc-13.4.0 sparse
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260914    gcc-13.4.0
hexagon               randconfig-001-20260915    clang-24
hexagon               randconfig-002-20260914    gcc-13.4.0
hexagon               randconfig-002-20260915    clang-24
hexagon              randconfig-r112-20260914    clang-24 sparse
hexagon              randconfig-r113-20260915    clang-24 sparse
hexagon              randconfig-r131-20260914    gcc-14 sparse
hexagon              randconfig-r133-20260914    gcc-12.5.0 sparse
hexagon              randconfig-r134-20260914    gcc-14 sparse
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260914    gcc-14
i386        buildonly-randconfig-002-20260914    gcc-14
i386        buildonly-randconfig-003-20260914    gcc-14
i386        buildonly-randconfig-004-20260914    gcc-14
i386        buildonly-randconfig-005-20260914    gcc-14
i386        buildonly-randconfig-006-20260914    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260914    clang-22
i386                  randconfig-002-20260914    clang-22
i386                  randconfig-003-20260914    clang-22
i386                  randconfig-004-20260914    clang-22
i386                  randconfig-005-20260914    clang-22
i386                  randconfig-006-20260914    clang-22
i386                  randconfig-007-20260914    clang-22
i386                  randconfig-011-20260914    clang-22
i386                  randconfig-011-20260915    gcc-14
i386                  randconfig-012-20260914    clang-22
i386                  randconfig-012-20260915    gcc-14
i386                  randconfig-013-20260914    clang-22
i386                  randconfig-013-20260915    gcc-14
i386                  randconfig-014-20260914    clang-22
i386                  randconfig-014-20260915    gcc-14
i386                  randconfig-015-20260914    clang-22
i386                  randconfig-015-20260915    gcc-14
i386                  randconfig-016-20260914    clang-22
i386                  randconfig-016-20260915    gcc-14
i386                  randconfig-017-20260914    clang-22
i386                  randconfig-017-20260915    gcc-14
i386                  randconfig-061-20260914    gcc-14 sparse
i386                  randconfig-062-20260914    gcc-14 sparse
i386                  randconfig-063-20260914    gcc-14 sparse
i386                 randconfig-r132-20260914    gcc-13.4.0 sparse
i386                 randconfig-r134-20260914    gcc-14 sparse
loongarch                        allmodconfig    clang-24
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-24
loongarch             randconfig-001-20260914    gcc-13.4.0
loongarch             randconfig-001-20260915    clang-24
loongarch             randconfig-002-20260914    gcc-13.4.0
loongarch             randconfig-002-20260915    clang-24
loongarch            randconfig-r122-20260915    clang-24 sparse
loongarch            randconfig-r131-20260914    gcc-12.5.0 sparse
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-24
m68k                          amiga_defconfig    gcc-16.1.0
m68k                                defconfig    clang-24
m68k                       m5249evb_defconfig    gcc-16.1.0
m68k                      m54418evb_defconfig    gcc-16.1.0
m68k                        mvme16x_defconfig    gcc-14
m68k                        mvme16x_defconfig    gcc-16.1.0
m68k                 randconfig-r111-20260914    gcc-12.5.0 sparse
m68k                 randconfig-r113-20260914    gcc-12.5.0 sparse
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-24
microblaze           randconfig-r123-20260914    gcc-12.5.0 sparse
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                        bcm47xx_defconfig    clang-24
mips                         db1xxx_defconfig    gcc-16.1.0
mips                           ip22_defconfig    gcc-16.1.0
mips                           ip32_defconfig    gcc-14
mips                 randconfig-r134-20260914    gcc-13.4.0 sparse
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-24
nios2                               defconfig    clang-24
nios2                 randconfig-001-20260914    gcc-13.4.0
nios2                 randconfig-001-20260914    gcc-8.5.0
nios2                 randconfig-001-20260915    clang-24
nios2                 randconfig-002-20260914    gcc-13.4.0
nios2                 randconfig-002-20260914    gcc-8.5.0
nios2                 randconfig-002-20260915    clang-24
nios2                randconfig-r131-20260914    gcc-8.5.0 sparse
nios2                randconfig-r133-20260914    gcc-14 sparse
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-24
openrisc                   de0_nano_defconfig    clang-24
openrisc                            defconfig    gcc-16.1.0
openrisc             randconfig-r112-20260914    gcc-12.5.0 sparse
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-24
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260914    gcc-8.5.0
parisc                randconfig-001-20260915    gcc-8.5.0
parisc                randconfig-002-20260914    gcc-8.5.0
parisc                randconfig-002-20260915    gcc-8.5.0
parisc               randconfig-r133-20260914    gcc-13.4.0 sparse
parisc64                            defconfig    clang-24
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-24
powerpc                    ge_imp3a_defconfig    gcc-14
powerpc                    ge_imp3a_defconfig    gcc-16.1.0
powerpc                     kmeter1_defconfig    gcc-16.1.0
powerpc                  mpc866_ads_defconfig    clang-24
powerpc                      pasemi_defconfig    clang-24
powerpc               randconfig-001-20260914    gcc-8.5.0
powerpc               randconfig-001-20260915    gcc-8.5.0
powerpc               randconfig-002-20260914    gcc-8.5.0
powerpc               randconfig-002-20260915    gcc-8.5.0
powerpc              randconfig-r111-20260914    clang-24 sparse
powerpc                    socrates_defconfig    clang-24
powerpc                     tqm8541_defconfig    gcc-16.1.0
powerpc64             randconfig-001-20260914    gcc-8.5.0
powerpc64             randconfig-001-20260915    gcc-8.5.0
powerpc64             randconfig-002-20260914    gcc-8.5.0
powerpc64             randconfig-002-20260915    gcc-8.5.0
powerpc64            randconfig-r133-20260914    gcc-8.5.0 sparse
riscv                            allmodconfig    clang-24
riscv                             allnoconfig    clang-24
riscv                            allyesconfig    clang-24
riscv                               defconfig    gcc-16.1.0
riscv                    nommu_virt_defconfig    gcc-16.1.0
riscv                 randconfig-001-20260914    gcc-13.4.0
riscv                 randconfig-002-20260914    gcc-13.4.0
riscv                randconfig-r111-20260915    clang-24 sparse
riscv                randconfig-r113-20260914    gcc-8.5.0 sparse
riscv                randconfig-r132-20260914    gcc-8.5.0 sparse
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-24
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260914    gcc-13.4.0
s390                  randconfig-002-20260914    gcc-13.4.0
s390                 randconfig-r123-20260915    clang-24 sparse
s390                 randconfig-r131-20260914    gcc-14 sparse
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-24
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                             espt_defconfig    gcc-16.1.0
sh                               j2_defconfig    gcc-16.1.0
sh                          kfr2r09_defconfig    gcc-16.1.0
sh                            migor_defconfig    gcc-16.1.0
sh                          r7780mp_defconfig    clang-24
sh                    randconfig-001-20260914    gcc-13.4.0
sh                    randconfig-002-20260914    gcc-13.4.0
sh                   randconfig-r123-20260914    clang-24 sparse
sh                          rsk7269_defconfig    gcc-16.1.0
sh                      rts7751r2d1_defconfig    gcc-16.1.0
sh                           se7705_defconfig    gcc-14
sh                           se7751_defconfig    gcc-16.1.0
sh                   sh7770_generic_defconfig    gcc-16.1.0
sh                            shmin_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-24
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260914    gcc-16.1.0
sparc                 randconfig-002-20260914    gcc-16.1.0
sparc                randconfig-r132-20260914    gcc-14 sparse
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260914    gcc-16.1.0
sparc64               randconfig-002-20260914    gcc-16.1.0
sparc64              randconfig-r121-20260914    gcc-8.5.0 sparse
sparc64              randconfig-r134-20260914    gcc-12.5.0 sparse
um                               allmodconfig    clang-17
um                                allnoconfig    clang-24
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260914    gcc-16.1.0
um                    randconfig-002-20260914    gcc-16.1.0
um                   randconfig-r111-20260914    gcc-8.5.0 sparse
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-24
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260914    gcc-14
x86_64      buildonly-randconfig-002-20260914    gcc-14
x86_64      buildonly-randconfig-003-20260914    gcc-14
x86_64      buildonly-randconfig-004-20260914    gcc-14
x86_64      buildonly-randconfig-005-20260914    gcc-14
x86_64      buildonly-randconfig-006-20260914    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260914    gcc-14
x86_64                randconfig-002-20260914    gcc-14
x86_64                randconfig-003-20260914    gcc-14
x86_64                randconfig-004-20260914    gcc-14
x86_64                randconfig-005-20260914    gcc-14
x86_64                randconfig-006-20260914    gcc-14
x86_64                randconfig-011-20260914    clang-22
x86_64                randconfig-012-20260914    clang-22
x86_64                randconfig-013-20260914    clang-22
x86_64                randconfig-014-20260914    clang-22
x86_64                randconfig-015-20260914    clang-22
x86_64                randconfig-016-20260914    clang-22
x86_64                randconfig-071-20260914    clang-22
x86_64                randconfig-072-20260914    clang-22
x86_64                randconfig-073-20260914    clang-22
x86_64                randconfig-074-20260914    clang-22
x86_64                randconfig-075-20260914    clang-22
x86_64                randconfig-076-20260914    clang-22
x86_64                randconfig-121-20260914    gcc-14 sparse
x86_64                randconfig-122-20260914    gcc-14 sparse
x86_64                randconfig-123-20260914    gcc-14 sparse
x86_64               randconfig-r133-20260914    gcc-14 sparse
x86_64                               rhel-9.4    clang-22
x86_64                               rhel-9.4    gcc-14
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                          rhel-9.4-func    gcc-14
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                    rhel-9.4-kselftests    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                           alldefconfig    clang-24
xtensa                            allnoconfig    clang-24
xtensa                           allyesconfig    clang-20
xtensa                generic_kc705_defconfig    gcc-16.1.0
xtensa                randconfig-001-20260914    gcc-16.1.0
xtensa                randconfig-002-20260914    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
