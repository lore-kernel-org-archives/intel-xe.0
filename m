Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C45D77898
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 23:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4E510EC00;
	Fri, 23 Jan 2026 23:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZTL5A1GQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B2410EC00
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 23:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769211394; x=1800747394;
 h=date:from:to:cc:subject:message-id;
 bh=HFLU8UkCTg2w90bz6Lac8uOfCF4XoTJZAeirTHvyOjQ=;
 b=ZTL5A1GQc+WFL1WGhXVTlEM/FAKGm8HRSPq4Pr/f9pSyXth4c5WuyyxF
 L4AFVSIaCFxmB4UYllfTTtD4YV4VuuQJKPJ4g9mWr+mQAXPeQny0F/tmr
 zw6J+2DIx6twLPPYDJeW5jEJiSVdPufqpYhfT8JB1MnIgLJjkAIGJ5MQN
 s/wpP2dtceNhv6T/fEuYdyjxrEfA3CZS2MCQI3TBLwmrPyyjm7pXfVkSW
 XffUUars3TLBKm/lR7qf3Td4rvT0yBv3GM/b6ZLI6oXj7sHSV7IBFjqXp
 9cbg9eLlaeZwCn2YQT73oOzDt1HjsN9xqgid4yIxUzsb99GEDpzZE0f3k g==;
X-CSE-ConnectionGUID: WnJI18d6TvORFeE7i/jZZw==
X-CSE-MsgGUID: 9qc7pdSDQUOOzhXM8jg+zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74314887"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; d="scan'208";a="74314887"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 15:36:33 -0800
X-CSE-ConnectionGUID: HzOqFnCARcyBDSchWxstOA==
X-CSE-MsgGUID: 8/2/KOWuSwOkbRT1Tljrkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; d="scan'208";a="244765672"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 23 Jan 2026 15:36:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vjQhZ-00000000Uao-2wMH;
 Fri, 23 Jan 2026 23:36:29 +0000
Date: Sat, 24 Jan 2026 07:35:40 +0800
From: kernel test robot <lkp@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 6ef02656c3222b1e12032a40d644ed56806b14fc
Message-ID: <202601240735.AnaYA8XE-lkp@intel.com>
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
branch HEAD: 6ef02656c3222b1e12032a40d644ed56806b14fc  drm/xe: derive mem copy capability from graphics version

elapsed time: 973m

configs tested: 273
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              alldefconfig    clang-22
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                        nsim_700_defconfig    gcc-15.2.0
arc                     nsimosci_hs_defconfig    gcc-15.2.0
arc                   randconfig-001-20260123    gcc-10.5.0
arc                   randconfig-001-20260123    gcc-8.5.0
arc                   randconfig-001-20260124    clang-18
arc                   randconfig-002-20260123    gcc-10.5.0
arc                   randconfig-002-20260123    gcc-8.5.0
arc                   randconfig-002-20260124    clang-18
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                         assabet_defconfig    clang-22
arm                     davinci_all_defconfig    clang-19
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                      integrator_defconfig    clang-22
arm                        mvebu_v7_defconfig    clang-22
arm                          pxa168_defconfig    clang-19
arm                          pxa168_defconfig    gcc-15.2.0
arm                   randconfig-001-20260123    clang-18
arm                   randconfig-001-20260123    gcc-10.5.0
arm                   randconfig-001-20260124    clang-18
arm                   randconfig-002-20260123    clang-22
arm                   randconfig-002-20260123    gcc-10.5.0
arm                   randconfig-002-20260124    clang-18
arm                   randconfig-003-20260123    gcc-10.5.0
arm                   randconfig-003-20260124    clang-18
arm                   randconfig-004-20260123    gcc-10.5.0
arm                   randconfig-004-20260123    gcc-15.2.0
arm                   randconfig-004-20260124    clang-18
arm                           tegra_defconfig    gcc-15.2.0
arm64                            alldefconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260123    gcc-15.2.0
arm64                 randconfig-002-20260123    gcc-13.4.0
arm64                 randconfig-002-20260123    gcc-15.2.0
arm64                 randconfig-003-20260123    gcc-10.5.0
arm64                 randconfig-003-20260123    gcc-15.2.0
arm64                 randconfig-004-20260123    gcc-13.4.0
arm64                 randconfig-004-20260123    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260123    gcc-15.2.0
csky                  randconfig-002-20260123    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260124    gcc-15.2.0
hexagon               randconfig-002-20260124    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260123    clang-20
i386        buildonly-randconfig-001-20260124    gcc-14
i386        buildonly-randconfig-002-20260123    clang-20
i386        buildonly-randconfig-002-20260124    gcc-14
i386        buildonly-randconfig-003-20260123    clang-20
i386        buildonly-randconfig-003-20260124    gcc-14
i386        buildonly-randconfig-004-20260123    clang-20
i386        buildonly-randconfig-004-20260124    gcc-14
i386        buildonly-randconfig-005-20260123    clang-20
i386        buildonly-randconfig-005-20260124    gcc-14
i386        buildonly-randconfig-006-20260123    clang-20
i386        buildonly-randconfig-006-20260124    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260123    gcc-14
i386                  randconfig-002-20260123    gcc-14
i386                  randconfig-003-20260123    gcc-14
i386                  randconfig-004-20260123    gcc-14
i386                  randconfig-005-20260123    gcc-14
i386                  randconfig-006-20260123    gcc-14
i386                  randconfig-007-20260123    gcc-14
i386                  randconfig-011-20260123    clang-20
i386                  randconfig-011-20260124    clang-20
i386                  randconfig-012-20260123    clang-20
i386                  randconfig-012-20260123    gcc-14
i386                  randconfig-012-20260124    clang-20
i386                  randconfig-013-20260123    clang-20
i386                  randconfig-013-20260123    gcc-14
i386                  randconfig-013-20260124    clang-20
i386                  randconfig-014-20260123    clang-20
i386                  randconfig-014-20260124    clang-20
i386                  randconfig-014-20260124    gcc-14
i386                  randconfig-015-20260123    clang-20
i386                  randconfig-015-20260124    clang-20
i386                  randconfig-016-20260123    clang-20
i386                  randconfig-016-20260124    clang-20
i386                  randconfig-016-20260124    gcc-14
i386                  randconfig-017-20260123    clang-20
i386                  randconfig-017-20260124    clang-20
i386                  randconfig-017-20260124    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260124    gcc-15.2.0
loongarch             randconfig-002-20260124    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                          atari_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                          multi_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                     cu1000-neo_defconfig    gcc-15.2.0
mips                      maltaaprp_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260124    gcc-15.2.0
nios2                 randconfig-002-20260124    gcc-15.2.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260123    gcc-12.5.0
parisc                randconfig-001-20260124    gcc-8.5.0
parisc                randconfig-002-20260123    gcc-12.5.0
parisc                randconfig-002-20260124    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                   currituck_defconfig    clang-22
powerpc                 linkstation_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260123    gcc-12.5.0
powerpc               randconfig-001-20260124    gcc-8.5.0
powerpc               randconfig-002-20260123    gcc-12.5.0
powerpc               randconfig-002-20260124    gcc-8.5.0
powerpc                     taishan_defconfig    clang-22
powerpc64             randconfig-001-20260123    gcc-12.5.0
powerpc64             randconfig-001-20260124    gcc-8.5.0
powerpc64             randconfig-002-20260123    gcc-12.5.0
powerpc64             randconfig-002-20260124    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260124    gcc-8.5.0
riscv                 randconfig-002-20260124    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260124    gcc-8.5.0
s390                  randconfig-002-20260124    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                        edosk7705_defconfig    gcc-15.2.0
sh                          kfr2r09_defconfig    clang-22
sh                            migor_defconfig    gcc-15.2.0
sh                    randconfig-001-20260124    gcc-8.5.0
sh                    randconfig-002-20260124    gcc-8.5.0
sh                           sh2007_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260123    gcc-13.4.0
sparc                 randconfig-001-20260123    gcc-15.2.0
sparc                 randconfig-002-20260123    gcc-13.4.0
sparc                 randconfig-002-20260123    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260123    gcc-13.4.0
sparc64               randconfig-002-20260123    gcc-12.5.0
sparc64               randconfig-002-20260123    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260123    gcc-13.4.0
um                    randconfig-001-20260123    gcc-14
um                    randconfig-002-20260123    clang-22
um                    randconfig-002-20260123    gcc-13.4.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260123    clang-20
x86_64      buildonly-randconfig-002-20260123    clang-20
x86_64      buildonly-randconfig-003-20260123    clang-20
x86_64      buildonly-randconfig-004-20260123    clang-20
x86_64      buildonly-randconfig-005-20260123    clang-20
x86_64      buildonly-randconfig-006-20260123    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260123    gcc-14
x86_64                randconfig-002-20260123    gcc-14
x86_64                randconfig-003-20260123    gcc-14
x86_64                randconfig-004-20260123    gcc-14
x86_64                randconfig-005-20260123    gcc-14
x86_64                randconfig-006-20260123    gcc-14
x86_64                randconfig-011-20260123    gcc-14
x86_64                randconfig-012-20260123    gcc-14
x86_64                randconfig-013-20260123    gcc-14
x86_64                randconfig-014-20260123    gcc-14
x86_64                randconfig-015-20260123    gcc-14
x86_64                randconfig-016-20260123    gcc-14
x86_64                randconfig-071-20260123    clang-20
x86_64                randconfig-071-20260124    gcc-14
x86_64                randconfig-072-20260123    clang-20
x86_64                randconfig-072-20260124    gcc-14
x86_64                randconfig-073-20260123    clang-20
x86_64                randconfig-073-20260124    gcc-14
x86_64                randconfig-074-20260123    clang-20
x86_64                randconfig-074-20260124    gcc-14
x86_64                randconfig-075-20260123    clang-20
x86_64                randconfig-075-20260124    gcc-14
x86_64                randconfig-076-20260123    clang-20
x86_64                randconfig-076-20260124    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260123    gcc-11.5.0
xtensa                randconfig-001-20260123    gcc-13.4.0
xtensa                randconfig-002-20260123    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
