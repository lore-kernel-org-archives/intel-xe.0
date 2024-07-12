Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB55C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 14:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D8B10E142;
	Fri, 12 Jul 2024 14:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fcu3ElJi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E2010E142
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 14:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720792888; x=1752328888;
 h=date:from:to:cc:subject:message-id;
 bh=V9W4erfaca6s5bADDHiFeP0X7nAy73FR9uuhW/szsaU=;
 b=fcu3ElJi45XH5nOrT+JA0WykBZI5zLPjQprGkKYKeOO1j+ZT8gqqGyML
 5tnxlyJEJVWvHrlhJbSe2zYMHNFB9SMcPlzMydkMXGJKmEzYs6oEeghW4
 SzFKkyuLmbX6FN7XRrh8TefJD3tuNHGn6/lxVadJm/2GSbfcIf1+dridO
 qARfbcA2b4RfVgYf/yAdkTmuK8KRkV5Q1tSo4ilvzdYGDEWyTza7a8ChR
 bUbeF2Gfmo/XresxsALpVY6J3sKDVmwaV9RLxlaZI9Vp5MtQgdkGrjxkX
 qE5ji5ivO5Cnpv3XosAyawcMhJ1AZtizmTI/eeh5ZWaU5mMWwPee2UaDW A==;
X-CSE-ConnectionGUID: bgAhkhcwTJC7CgXrcjrjXg==
X-CSE-MsgGUID: KD2VSJekR6WXcl7nVUuAKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18049064"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="18049064"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 07:01:28 -0700
X-CSE-ConnectionGUID: POUBuTyTTnmMc9hsK994eQ==
X-CSE-MsgGUID: j2B7rJIKQbeK8IkP0jisWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="53214334"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 12 Jul 2024 07:01:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sSGpw-000apm-1b;
 Fri, 12 Jul 2024 14:01:24 +0000
Date: Fri, 12 Jul 2024 22:00:35 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 609458abd5a10180f513ca364d6c0ae30128c821
Message-ID: <202407122232.dytkEGeB-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: 609458abd5a10180f513ca364d6c0ae30128c821  drm/xe/display/xe_hdcp_gsc: Free arbiter on driver removal

elapsed time: 1329m

configs tested: 242
configs skipped: 5

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
arc                   randconfig-001-20240712   gcc-13.2.0
arc                   randconfig-002-20240712   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                          exynos_defconfig   clang-17
arm                         lpc18xx_defconfig   clang-17
arm                        multi_v7_defconfig   clang-17
arm                   randconfig-001-20240712   clang-19
arm                   randconfig-001-20240712   gcc-13.2.0
arm                   randconfig-002-20240712   clang-19
arm                   randconfig-002-20240712   gcc-13.2.0
arm                   randconfig-003-20240712   gcc-13.2.0
arm                   randconfig-003-20240712   gcc-14.1.0
arm                   randconfig-004-20240712   clang-15
arm                   randconfig-004-20240712   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240712   gcc-13.2.0
arm64                 randconfig-001-20240712   gcc-14.1.0
arm64                 randconfig-002-20240712   gcc-13.2.0
arm64                 randconfig-002-20240712   gcc-14.1.0
arm64                 randconfig-003-20240712   clang-19
arm64                 randconfig-003-20240712   gcc-13.2.0
arm64                 randconfig-004-20240712   clang-17
arm64                 randconfig-004-20240712   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240712   gcc-13.2.0
csky                  randconfig-001-20240712   gcc-14.1.0
csky                  randconfig-002-20240712   gcc-13.2.0
csky                  randconfig-002-20240712   gcc-14.1.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240712   clang-14
hexagon               randconfig-002-20240712   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240712   gcc-9
i386         buildonly-randconfig-002-20240712   clang-18
i386         buildonly-randconfig-002-20240712   gcc-9
i386         buildonly-randconfig-003-20240712   clang-18
i386         buildonly-randconfig-003-20240712   gcc-9
i386         buildonly-randconfig-004-20240712   clang-18
i386         buildonly-randconfig-004-20240712   gcc-9
i386         buildonly-randconfig-005-20240712   gcc-11
i386         buildonly-randconfig-005-20240712   gcc-9
i386         buildonly-randconfig-006-20240712   clang-18
i386         buildonly-randconfig-006-20240712   gcc-9
i386                                defconfig   clang-18
i386                  randconfig-001-20240712   clang-18
i386                  randconfig-001-20240712   gcc-9
i386                  randconfig-002-20240712   clang-18
i386                  randconfig-002-20240712   gcc-9
i386                  randconfig-003-20240712   clang-18
i386                  randconfig-003-20240712   gcc-9
i386                  randconfig-004-20240712   clang-18
i386                  randconfig-004-20240712   gcc-9
i386                  randconfig-005-20240712   clang-18
i386                  randconfig-005-20240712   gcc-9
i386                  randconfig-006-20240712   clang-18
i386                  randconfig-006-20240712   gcc-9
i386                  randconfig-011-20240712   clang-18
i386                  randconfig-011-20240712   gcc-9
i386                  randconfig-012-20240712   clang-18
i386                  randconfig-012-20240712   gcc-9
i386                  randconfig-013-20240712   clang-18
i386                  randconfig-013-20240712   gcc-9
i386                  randconfig-014-20240712   gcc-10
i386                  randconfig-014-20240712   gcc-9
i386                  randconfig-015-20240712   gcc-10
i386                  randconfig-015-20240712   gcc-9
i386                  randconfig-016-20240712   gcc-12
i386                  randconfig-016-20240712   gcc-9
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240712   gcc-13.2.0
loongarch             randconfig-001-20240712   gcc-14.1.0
loongarch             randconfig-002-20240712   gcc-13.2.0
loongarch             randconfig-002-20240712   gcc-14.1.0
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
mips                          ath79_defconfig   clang-17
mips                           ci20_defconfig   clang-17
mips                        omega2p_defconfig   clang-17
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240712   gcc-13.2.0
nios2                 randconfig-001-20240712   gcc-14.1.0
nios2                 randconfig-002-20240712   gcc-13.2.0
nios2                 randconfig-002-20240712   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240712   gcc-13.2.0
parisc                randconfig-001-20240712   gcc-14.1.0
parisc                randconfig-002-20240712   gcc-13.2.0
parisc                randconfig-002-20240712   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                          allyesconfig   gcc-14.1.0
powerpc                        fsp2_defconfig   clang-17
powerpc                 mpc8313_rdb_defconfig   clang-17
powerpc               randconfig-001-20240712   clang-15
powerpc               randconfig-001-20240712   gcc-13.2.0
powerpc               randconfig-002-20240712   clang-19
powerpc               randconfig-002-20240712   gcc-13.2.0
powerpc               randconfig-003-20240712   clang-19
powerpc               randconfig-003-20240712   gcc-13.2.0
powerpc64                        alldefconfig   clang-17
powerpc64             randconfig-001-20240712   clang-19
powerpc64             randconfig-001-20240712   gcc-13.2.0
powerpc64             randconfig-002-20240712   clang-19
powerpc64             randconfig-002-20240712   gcc-13.2.0
powerpc64             randconfig-003-20240712   gcc-13.2.0
powerpc64             randconfig-003-20240712   gcc-14.1.0
riscv                            allmodconfig   clang-19
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240712   clang-19
riscv                 randconfig-001-20240712   gcc-13.2.0
riscv                 randconfig-002-20240712   gcc-13.2.0
riscv                 randconfig-002-20240712   gcc-14.1.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240712   gcc-13.2.0
s390                  randconfig-001-20240712   gcc-14.1.0
s390                  randconfig-002-20240712   gcc-13.2.0
s390                  randconfig-002-20240712   gcc-14.1.0
s390                       zfcpdump_defconfig   clang-17
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240712   gcc-13.2.0
sh                    randconfig-001-20240712   gcc-14.1.0
sh                    randconfig-002-20240712   gcc-13.2.0
sh                    randconfig-002-20240712   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240712   gcc-13.2.0
sparc64               randconfig-001-20240712   gcc-14.1.0
sparc64               randconfig-002-20240712   gcc-13.2.0
sparc64               randconfig-002-20240712   gcc-14.1.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240712   clang-19
um                    randconfig-001-20240712   gcc-13.2.0
um                    randconfig-002-20240712   clang-15
um                    randconfig-002-20240712   gcc-13.2.0
um                           x86_64_defconfig   clang-17
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240712   clang-18
x86_64       buildonly-randconfig-002-20240712   clang-18
x86_64       buildonly-randconfig-003-20240712   clang-18
x86_64       buildonly-randconfig-004-20240712   clang-18
x86_64       buildonly-randconfig-005-20240712   clang-18
x86_64       buildonly-randconfig-006-20240712   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240712   clang-18
x86_64                randconfig-001-20240712   gcc-12
x86_64                randconfig-002-20240712   clang-18
x86_64                randconfig-002-20240712   gcc-13
x86_64                randconfig-003-20240712   clang-18
x86_64                randconfig-003-20240712   gcc-12
x86_64                randconfig-004-20240712   clang-18
x86_64                randconfig-005-20240712   clang-18
x86_64                randconfig-006-20240712   clang-18
x86_64                randconfig-011-20240712   clang-18
x86_64                randconfig-012-20240712   clang-18
x86_64                randconfig-013-20240712   clang-18
x86_64                randconfig-014-20240712   clang-18
x86_64                randconfig-015-20240712   clang-18
x86_64                randconfig-016-20240712   clang-18
x86_64                randconfig-071-20240712   clang-18
x86_64                randconfig-072-20240712   clang-18
x86_64                randconfig-073-20240712   clang-18
x86_64                randconfig-074-20240712   clang-18
x86_64                randconfig-075-20240712   clang-18
x86_64                randconfig-076-20240712   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240712   gcc-13.2.0
xtensa                randconfig-001-20240712   gcc-14.1.0
xtensa                randconfig-002-20240712   gcc-13.2.0
xtensa                randconfig-002-20240712   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
