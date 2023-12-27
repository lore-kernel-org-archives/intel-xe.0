Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9025BC46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 19:53:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9CE10E0DC;
	Wed, 27 Dec 2023 19:53:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7754710E0DC
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 19:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703706808; x=1735242808;
 h=date:from:to:cc:subject:message-id;
 bh=SlFBXtxir6EpVOXfmXf+dYDXQCqFGOLoZBFGdvbqBUI=;
 b=kY1mN3bCVrUsMahs0lkY4bIuEBlA8woWx0WUytwxpoNjvr8YWJ5zhbw3
 snreYX1WafZewsZ13dfD3ivb/y/087YMHVmOS0qH0CBcDyMbF2OXMzmyD
 try3PxYMS0WF+mkE9PSfaM2UGJmuf2Sdn0tGrTfNHlg7e9AKdIfzzzqWY
 fS4b1S2KZCJ1a7JjM2AZwSLaHCHvmFWwZC90yBtjrV091hK06SfervV1C
 2QGWQ5jfvNqZb6rx/GYpQ2eFA+G6Hj/cPEuuVrLf4LyT4QMFDG3BqxJYh
 SzMBrvhFwDImBU6ahQVs1hc5DdTPAnw6HzHxH27sffTFfTaAcot+qnuKb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="482659474"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="482659474"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 11:53:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="1025464956"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="1025464956"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 27 Dec 2023 11:53:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rIZy1-000FiF-02;
 Wed, 27 Dec 2023 19:53:25 +0000
Date: Thu, 28 Dec 2023 03:53:11 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [drm-xe:drm-xe-next-fixes] BUILD SUCCESS
 315acff5196f4e2f84a2a2d093000e0c6b0b4d1c
Message-ID: <202312280308.ywpzmKUl-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next-fixes
branch HEAD: 315acff5196f4e2f84a2a2d093000e0c6b0b4d1c  drm/xe: Fix warning on impossible condition

elapsed time: 1455m

configs tested: 161
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231227   gcc  
arc                   randconfig-002-20231227   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          ep93xx_defconfig   clang
arm                          ixp4xx_defconfig   clang
arm                           omap1_defconfig   clang
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20231227   clang
arm                   randconfig-002-20231227   clang
arm                   randconfig-003-20231227   clang
arm                   randconfig-004-20231227   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231227   clang
arm64                 randconfig-002-20231227   clang
arm64                 randconfig-003-20231227   clang
arm64                 randconfig-004-20231227   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231227   gcc  
csky                  randconfig-002-20231227   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231227   clang
hexagon               randconfig-002-20231227   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231227   gcc  
loongarch             randconfig-002-20231227   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                       lemote2f_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231227   gcc  
nios2                 randconfig-002-20231227   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20231227   gcc  
parisc                randconfig-002-20231227   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     mpc5200_defconfig   clang
powerpc               randconfig-001-20231227   clang
powerpc               randconfig-002-20231227   clang
powerpc               randconfig-003-20231227   clang
powerpc                     tqm8548_defconfig   gcc  
powerpc64             randconfig-001-20231227   clang
powerpc64             randconfig-002-20231227   clang
powerpc64             randconfig-003-20231227   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231227   clang
riscv                 randconfig-002-20231227   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231227   gcc  
s390                  randconfig-002-20231227   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231227   gcc  
sh                    randconfig-002-20231227   gcc  
sh                           se7780_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231227   gcc  
sparc64               randconfig-002-20231227   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231227   clang
um                    randconfig-002-20231227   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231227   clang
x86_64       buildonly-randconfig-002-20231227   clang
x86_64       buildonly-randconfig-003-20231227   clang
x86_64       buildonly-randconfig-004-20231227   clang
x86_64       buildonly-randconfig-005-20231227   clang
x86_64       buildonly-randconfig-006-20231227   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231227   gcc  
x86_64                randconfig-002-20231227   gcc  
x86_64                randconfig-003-20231227   gcc  
x86_64                randconfig-004-20231227   gcc  
x86_64                randconfig-005-20231227   gcc  
x86_64                randconfig-006-20231227   gcc  
x86_64                randconfig-011-20231227   clang
x86_64                randconfig-012-20231227   clang
x86_64                randconfig-013-20231227   clang
x86_64                randconfig-014-20231227   clang
x86_64                randconfig-015-20231227   clang
x86_64                randconfig-016-20231227   clang
x86_64                randconfig-071-20231227   clang
x86_64                randconfig-072-20231227   clang
x86_64                randconfig-073-20231227   clang
x86_64                randconfig-074-20231227   clang
x86_64                randconfig-075-20231227   clang
x86_64                randconfig-076-20231227   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                randconfig-001-20231227   gcc  
xtensa                randconfig-002-20231227   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
