Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813FBC30658
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jul 2024 07:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50AE810E058;
	Fri,  5 Jul 2024 07:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X8vrv4hW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E53010E058
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jul 2024 07:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720165528; x=1751701528;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=riKyDVaYEuefogWgZDsM9eHOI4guXvyVSCBeMhq/F3Q=;
 b=X8vrv4hWUF+M2SYEMaN5hYQm4/i+grNyo2LvFUOXfAfHEzf5WlzHLTSN
 18J9IgaQIv3KUP/Medmd3ubggWpX6PPTnKmpUEYjWDrKegcclXMAiLvXS
 y66pEnL++M/5zEPPb+r4F1aM2Y8Igdn+vTRept+1ZrFMZFnE/MFclcx/G
 bQLWY6/cpcHipw3F7czp+gJJ3PFi/948Gj83UBbogOrJVXvBXYZa5E6NR
 BKFfi/C7o+fZJIrEGubqBJsvoJ1BdsulcrDQ+HiLvzC9EcVYRuobrpuDI
 yQO1D+B2T8QLHvmaxj+SWcPMCwixMwvJ/t5akf+d6PbvYxCdXPD2tvWrz w==;
X-CSE-ConnectionGUID: UnjGGjKlS6eiMAcY1YLuog==
X-CSE-MsgGUID: oqSsrw7pSYmu5MEC0gxkxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28603048"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="28603048"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 00:45:27 -0700
X-CSE-ConnectionGUID: rKjqFipnSzSZxhqlB1HjGQ==
X-CSE-MsgGUID: 7gBawKhfTxGmhkzO99dm8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="46872642"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 05 Jul 2024 00:45:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sPddD-000S6G-0T;
 Fri, 05 Jul 2024 07:45:23 +0000
Date: Fri, 05 Jul 2024 15:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 1f006470284598060ca1307355352934400b37ca
Message-ID: <202407051518.6ZEUgrYu-lkp@intel.com>
User-Agent: s-nail v14.9.24
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: 1f006470284598060ca1307355352934400b37ca  drm/xe/mcr: Avoid clobbering DSS steering

elapsed time: 1274m

configs tested: 249
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              alldefconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                     haps_hs_smp_defconfig   gcc-13.2.0
arc                        nsim_700_defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240705   gcc-13.2.0
arc                   randconfig-002-20240705   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                         lpc18xx_defconfig   gcc-13.2.0
arm                            mps2_defconfig   gcc-13.2.0
arm                         mv78xx0_defconfig   gcc-13.2.0
arm                             mxs_defconfig   gcc-13.2.0
arm                   randconfig-001-20240705   gcc-13.2.0
arm                   randconfig-002-20240705   gcc-13.2.0
arm                   randconfig-003-20240705   gcc-13.2.0
arm                   randconfig-004-20240705   gcc-13.2.0
arm                             rpc_defconfig   gcc-13.2.0
arm                           sama7_defconfig   gcc-13.2.0
arm                           u8500_defconfig   gcc-13.2.0
arm                         vf610m4_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240705   gcc-13.2.0
arm64                 randconfig-002-20240705   gcc-13.2.0
arm64                 randconfig-003-20240705   gcc-13.2.0
arm64                 randconfig-004-20240705   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240705   gcc-13.2.0
csky                  randconfig-002-20240705   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240704   clang-18
i386         buildonly-randconfig-001-20240705   gcc-13
i386         buildonly-randconfig-002-20240704   clang-18
i386         buildonly-randconfig-002-20240704   gcc-13
i386         buildonly-randconfig-002-20240705   gcc-13
i386         buildonly-randconfig-003-20240704   clang-18
i386         buildonly-randconfig-003-20240704   gcc-13
i386         buildonly-randconfig-003-20240705   gcc-13
i386         buildonly-randconfig-004-20240704   clang-18
i386         buildonly-randconfig-004-20240704   gcc-12
i386         buildonly-randconfig-004-20240705   gcc-13
i386         buildonly-randconfig-005-20240704   clang-18
i386         buildonly-randconfig-005-20240704   gcc-12
i386         buildonly-randconfig-005-20240705   gcc-13
i386         buildonly-randconfig-006-20240704   clang-18
i386         buildonly-randconfig-006-20240704   gcc-12
i386         buildonly-randconfig-006-20240705   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240704   clang-18
i386                  randconfig-001-20240705   gcc-13
i386                  randconfig-002-20240704   clang-18
i386                  randconfig-002-20240704   gcc-13
i386                  randconfig-002-20240705   gcc-13
i386                  randconfig-003-20240704   clang-18
i386                  randconfig-003-20240705   gcc-13
i386                  randconfig-004-20240704   clang-18
i386                  randconfig-004-20240704   gcc-13
i386                  randconfig-004-20240705   gcc-13
i386                  randconfig-005-20240704   clang-18
i386                  randconfig-005-20240705   gcc-13
i386                  randconfig-006-20240704   clang-18
i386                  randconfig-006-20240704   gcc-12
i386                  randconfig-006-20240705   gcc-13
i386                  randconfig-011-20240704   clang-18
i386                  randconfig-011-20240704   gcc-13
i386                  randconfig-011-20240705   gcc-13
i386                  randconfig-012-20240704   clang-18
i386                  randconfig-012-20240705   gcc-13
i386                  randconfig-013-20240704   clang-18
i386                  randconfig-013-20240705   gcc-13
i386                  randconfig-014-20240704   clang-18
i386                  randconfig-014-20240705   gcc-13
i386                  randconfig-015-20240704   clang-18
i386                  randconfig-015-20240705   gcc-13
i386                  randconfig-016-20240704   clang-18
i386                  randconfig-016-20240705   gcc-13
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch                 loongson3_defconfig   gcc-13.2.0
loongarch             randconfig-001-20240705   gcc-13.2.0
loongarch             randconfig-002-20240705   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                       bvme6000_defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                        m5307c3_defconfig   gcc-13.2.0
m68k                        mvme16x_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                         bigsur_defconfig   gcc-13.2.0
mips                      bmips_stb_defconfig   gcc-13.2.0
mips                     cu1830-neo_defconfig   gcc-13.2.0
mips                  decstation_64_defconfig   gcc-13.2.0
mips                            gpr_defconfig   gcc-13.2.0
mips                  maltasmvp_eva_defconfig   gcc-13.2.0
mips                    maltaup_xpa_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240705   gcc-13.2.0
nios2                 randconfig-002-20240705   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                generic-32bit_defconfig   gcc-13.2.0
parisc                randconfig-001-20240705   gcc-13.2.0
parisc                randconfig-002-20240705   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   gcc-13.2.0
powerpc                      chrp32_defconfig   gcc-13.2.0
powerpc                          g5_defconfig   gcc-13.2.0
powerpc                    ge_imp3a_defconfig   gcc-13.2.0
powerpc                 mpc8313_rdb_defconfig   gcc-13.2.0
powerpc               mpc834x_itxgp_defconfig   gcc-13.2.0
powerpc                      pcm030_defconfig   gcc-13.2.0
powerpc                     ppa8548_defconfig   gcc-13.2.0
powerpc                       ppc64_defconfig   gcc-13.2.0
powerpc                         ps3_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240705   gcc-13.2.0
powerpc64             randconfig-002-20240705   gcc-13.2.0
powerpc64             randconfig-003-20240705   gcc-13.2.0
riscv                            allmodconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   gcc-13.2.0
riscv                               defconfig   gcc-13.2.0
riscv                 randconfig-001-20240705   gcc-13.2.0
riscv                 randconfig-002-20240705   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                             allyesconfig   clang-19
s390                                defconfig   gcc-13.2.0
s390                  randconfig-001-20240705   gcc-13.2.0
s390                  randconfig-002-20240705   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                             espt_defconfig   gcc-13.2.0
sh                     magicpanelr2_defconfig   gcc-13.2.0
sh                            migor_defconfig   gcc-13.2.0
sh                    randconfig-001-20240705   gcc-13.2.0
sh                    randconfig-002-20240705   gcc-13.2.0
sh                   rts7751r2dplus_defconfig   gcc-13.2.0
sh                          sdk7786_defconfig   gcc-13.2.0
sh                           se7206_defconfig   gcc-13.2.0
sh                           se7343_defconfig   gcc-13.2.0
sh                           se7619_defconfig   gcc-13.2.0
sh                           se7712_defconfig   gcc-13.2.0
sh                           sh2007_defconfig   gcc-13.2.0
sh                        sh7757lcr_defconfig   gcc-13.2.0
sh                          urquell_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc                       sparc64_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240705   gcc-13.2.0
sparc64               randconfig-002-20240705   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.2.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.2.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                    randconfig-001-20240705   gcc-13.2.0
um                    randconfig-002-20240705   gcc-13.2.0
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240704   clang-18
x86_64       buildonly-randconfig-001-20240705   gcc-7
x86_64       buildonly-randconfig-002-20240704   clang-18
x86_64       buildonly-randconfig-002-20240705   gcc-7
x86_64       buildonly-randconfig-003-20240704   clang-18
x86_64       buildonly-randconfig-003-20240705   gcc-7
x86_64       buildonly-randconfig-004-20240704   clang-18
x86_64       buildonly-randconfig-004-20240705   gcc-7
x86_64       buildonly-randconfig-005-20240704   clang-18
x86_64       buildonly-randconfig-005-20240705   gcc-7
x86_64       buildonly-randconfig-006-20240704   clang-18
x86_64       buildonly-randconfig-006-20240705   gcc-7
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240704   clang-18
x86_64                randconfig-001-20240705   gcc-7
x86_64                randconfig-002-20240704   clang-18
x86_64                randconfig-002-20240705   gcc-7
x86_64                randconfig-003-20240704   clang-18
x86_64                randconfig-003-20240705   gcc-7
x86_64                randconfig-004-20240704   clang-18
x86_64                randconfig-004-20240705   gcc-7
x86_64                randconfig-005-20240704   clang-18
x86_64                randconfig-005-20240705   gcc-7
x86_64                randconfig-006-20240704   clang-18
x86_64                randconfig-006-20240705   gcc-7
x86_64                randconfig-011-20240704   clang-18
x86_64                randconfig-011-20240705   gcc-7
x86_64                randconfig-012-20240704   clang-18
x86_64                randconfig-012-20240705   gcc-7
x86_64                randconfig-013-20240704   clang-18
x86_64                randconfig-013-20240705   gcc-7
x86_64                randconfig-014-20240704   clang-18
x86_64                randconfig-014-20240705   gcc-7
x86_64                randconfig-015-20240704   clang-18
x86_64                randconfig-015-20240705   gcc-7
x86_64                randconfig-016-20240704   clang-18
x86_64                randconfig-016-20240705   gcc-7
x86_64                randconfig-071-20240704   clang-18
x86_64                randconfig-071-20240705   gcc-7
x86_64                randconfig-072-20240704   clang-18
x86_64                randconfig-072-20240705   gcc-7
x86_64                randconfig-073-20240704   clang-18
x86_64                randconfig-073-20240705   gcc-7
x86_64                randconfig-074-20240704   clang-18
x86_64                randconfig-074-20240705   gcc-7
x86_64                randconfig-075-20240704   clang-18
x86_64                randconfig-075-20240705   gcc-7
x86_64                randconfig-076-20240704   clang-18
x86_64                randconfig-076-20240705   gcc-7
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                       common_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240705   gcc-13.2.0
xtensa                randconfig-002-20240705   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
