Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4174C3DA4A
	for <intel-xe@archiver.kernel.org>; Sat,  3 Aug 2024 22:10:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B5510E00C;
	Sat,  3 Aug 2024 22:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvTaa252";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D878A10E00C
 for <intel-xe@lists.freedesktop.org>; Sat,  3 Aug 2024 22:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722723028; x=1754259028;
 h=date:from:to:cc:subject:message-id;
 bh=JxNeWyCZAvScb7ztQB+sAJHh9s8emsO0su8SDSW3r/A=;
 b=gvTaa252pSFDabjSmea+FWI9DdAMNRNnXWNG2obNVdrUCPq2TooutTP+
 I1sNI3rVQxE9F6hyVwmFB69+06lmiXJYA3VGDMVRTjAwDwZQrgqAeafLI
 xO9UZHeMBBSI2BLDC17rLCCJbgd2SOAfYY+jPthrnSYU8IM/sbgsSCnzf
 G+fctb1pGy/r7bzRSRTc6ywSnGm+Lt/mckpxBUPOW/wW2cRNtw9G1Xdtu
 imOkatvA4RhQPPx8pNoMPAoStM6+2gyZevA4iKK6K+acaw7r84+MBWM5N
 wTHKbIhEDLVxGjkv5oYr0AtBeCXvlHOWU1BzFVWmw0uai9u/9z4f58YC9 w==;
X-CSE-ConnectionGUID: YJPDvekoSiS7l4QKZwPB7w==
X-CSE-MsgGUID: i/gC4sXTRDuRVOc9+MA02Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="46120007"
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; d="scan'208";a="46120007"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2024 15:10:27 -0700
X-CSE-ConnectionGUID: FydZOPD8SW6jiPY4UQROQg==
X-CSE-MsgGUID: Q8aDa3JFTD20kn65dXEm7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; d="scan'208";a="60151489"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
 by fmviesa005.fm.intel.com with ESMTP; 03 Aug 2024 15:10:26 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1saMxD-0000wY-32;
 Sat, 03 Aug 2024 22:10:23 +0000
Date: Sun, 04 Aug 2024 06:09:23 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 2009e808bc3e0df6d4d83e2271bc25ae63a4ac05
Message-ID: <202408040621.0JqtjGVl-lkp@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: 2009e808bc3e0df6d4d83e2271bc25ae63a4ac05  drm/xe/xe2: Introduce performance changes

elapsed time: 1448m

configs tested: 232
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240803   gcc-13.2.0
arc                   randconfig-002-20240803   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                         bcm2835_defconfig   clang-20
arm                        clps711x_defconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                           h3600_defconfig   gcc-14.1.0
arm                      jornada720_defconfig   clang-20
arm                   milbeaut_m10v_defconfig   gcc-14.1.0
arm                            mmp2_defconfig   gcc-14.1.0
arm                            mps2_defconfig   clang-20
arm                             mxs_defconfig   clang-20
arm                          pxa910_defconfig   gcc-14.1.0
arm                   randconfig-001-20240803   gcc-13.2.0
arm                   randconfig-002-20240803   gcc-13.2.0
arm                   randconfig-003-20240803   gcc-13.2.0
arm                   randconfig-004-20240803   gcc-13.2.0
arm                           sama5_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240803   gcc-13.2.0
arm64                 randconfig-002-20240803   gcc-13.2.0
arm64                 randconfig-003-20240803   gcc-13.2.0
arm64                 randconfig-004-20240803   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240803   gcc-13.2.0
csky                  randconfig-002-20240803   gcc-13.2.0
hexagon                           allnoconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240803   clang-18
i386         buildonly-randconfig-001-20240804   gcc-12
i386         buildonly-randconfig-002-20240803   clang-18
i386         buildonly-randconfig-002-20240803   gcc-12
i386         buildonly-randconfig-002-20240804   gcc-12
i386         buildonly-randconfig-003-20240803   clang-18
i386         buildonly-randconfig-003-20240803   gcc-12
i386         buildonly-randconfig-003-20240804   gcc-12
i386         buildonly-randconfig-004-20240803   clang-18
i386         buildonly-randconfig-004-20240803   gcc-12
i386         buildonly-randconfig-004-20240804   gcc-12
i386         buildonly-randconfig-005-20240803   clang-18
i386         buildonly-randconfig-005-20240804   gcc-12
i386         buildonly-randconfig-006-20240803   clang-18
i386         buildonly-randconfig-006-20240804   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240803   clang-18
i386                  randconfig-001-20240803   gcc-12
i386                  randconfig-001-20240804   gcc-12
i386                  randconfig-002-20240803   clang-18
i386                  randconfig-002-20240803   gcc-12
i386                  randconfig-002-20240804   gcc-12
i386                  randconfig-003-20240803   clang-18
i386                  randconfig-003-20240804   gcc-12
i386                  randconfig-004-20240803   clang-18
i386                  randconfig-004-20240803   gcc-12
i386                  randconfig-004-20240804   gcc-12
i386                  randconfig-005-20240803   clang-18
i386                  randconfig-005-20240804   gcc-12
i386                  randconfig-006-20240803   clang-18
i386                  randconfig-006-20240804   gcc-12
i386                  randconfig-011-20240803   clang-18
i386                  randconfig-011-20240803   gcc-12
i386                  randconfig-011-20240804   gcc-12
i386                  randconfig-012-20240803   clang-18
i386                  randconfig-012-20240803   gcc-11
i386                  randconfig-012-20240804   gcc-12
i386                  randconfig-013-20240803   clang-18
i386                  randconfig-013-20240804   gcc-12
i386                  randconfig-014-20240803   clang-18
i386                  randconfig-014-20240804   gcc-12
i386                  randconfig-015-20240803   clang-18
i386                  randconfig-015-20240803   gcc-12
i386                  randconfig-015-20240804   gcc-12
i386                  randconfig-016-20240803   clang-18
i386                  randconfig-016-20240803   gcc-12
i386                  randconfig-016-20240804   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240803   gcc-13.2.0
loongarch             randconfig-002-20240803   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                          ath25_defconfig   gcc-14.1.0
mips                         cobalt_defconfig   clang-20
mips                     cu1830-neo_defconfig   clang-20
mips                           gcw0_defconfig   clang-20
mips                      maltasmvp_defconfig   clang-20
mips                        maltaup_defconfig   clang-20
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240803   gcc-13.2.0
nios2                 randconfig-002-20240803   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240803   gcc-13.2.0
parisc                randconfig-002-20240803   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      chrp32_defconfig   gcc-14.1.0
powerpc                      ep88xc_defconfig   clang-20
powerpc                        fsp2_defconfig   clang-20
powerpc                     ksi8560_defconfig   gcc-14.1.0
powerpc               mpc834x_itxgp_defconfig   clang-20
powerpc                 mpc836x_rdk_defconfig   gcc-14.1.0
powerpc                      pasemi_defconfig   gcc-14.1.0
powerpc                     ppa8548_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240803   gcc-13.2.0
powerpc               randconfig-003-20240803   gcc-13.2.0
powerpc                      tqm8xx_defconfig   clang-20
powerpc64             randconfig-001-20240803   gcc-13.2.0
powerpc64             randconfig-002-20240803   gcc-13.2.0
powerpc64             randconfig-003-20240803   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv             nommu_k210_sdcard_defconfig   gcc-14.1.0
riscv                 randconfig-001-20240803   gcc-13.2.0
riscv                 randconfig-002-20240803   gcc-13.2.0
s390                             alldefconfig   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240803   gcc-13.2.0
s390                  randconfig-002-20240803   gcc-13.2.0
s390                       zfcpdump_defconfig   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                        apsh4ad0a_defconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                         ecovec24_defconfig   gcc-14.1.0
sh                    randconfig-001-20240803   gcc-13.2.0
sh                    randconfig-002-20240803   gcc-13.2.0
sh                           se7343_defconfig   gcc-14.1.0
sh                           sh2007_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240803   gcc-13.2.0
sparc64               randconfig-002-20240803   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240803   gcc-13.2.0
um                    randconfig-002-20240803   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240803   gcc-12
x86_64       buildonly-randconfig-002-20240803   gcc-12
x86_64       buildonly-randconfig-003-20240803   gcc-12
x86_64       buildonly-randconfig-004-20240803   gcc-12
x86_64       buildonly-randconfig-005-20240803   gcc-12
x86_64       buildonly-randconfig-006-20240803   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240803   gcc-12
x86_64                randconfig-002-20240803   gcc-12
x86_64                randconfig-003-20240803   gcc-12
x86_64                randconfig-004-20240803   gcc-12
x86_64                randconfig-005-20240803   gcc-12
x86_64                randconfig-006-20240803   gcc-12
x86_64                randconfig-011-20240803   gcc-12
x86_64                randconfig-012-20240803   gcc-12
x86_64                randconfig-013-20240803   gcc-12
x86_64                randconfig-014-20240803   gcc-12
x86_64                randconfig-015-20240803   gcc-12
x86_64                randconfig-016-20240803   gcc-12
x86_64                randconfig-071-20240803   gcc-12
x86_64                randconfig-072-20240803   gcc-12
x86_64                randconfig-073-20240803   gcc-12
x86_64                randconfig-074-20240803   gcc-12
x86_64                randconfig-075-20240803   gcc-12
x86_64                randconfig-076-20240803   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240803   gcc-13.2.0
xtensa                randconfig-002-20240803   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
