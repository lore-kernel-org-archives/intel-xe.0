Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127B3C3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 15:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B661410EC36;
	Fri, 19 Jul 2024 15:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTgFjd26";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9AC10EC36
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 15:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721401371; x=1752937371;
 h=date:from:to:cc:subject:message-id;
 bh=fl0WD4YV6JJuQvEeFxSHWDfkDHrKC9x2hL6YRseUHFw=;
 b=XTgFjd26F2bWM6Pk3BRf96dhY3KOWNILlBjjYINpm2bNCzSH8SuXBVuE
 IaPBXNqVo6YItK85yobc3lZZ18jPHNWy8nlCXTcDzUt5AoWsd3zc4Dqy5
 NqP7irVJFQRQ/Ig3i6A8GInrBu4BbCnd4vJKPNWE/MckyvnEHS8dNsm0p
 mkiizcL0LL3DP6jgzs2fjFknEQJGilY5/fRpFRlTfBM7bBI87fjqniRDY
 CBwFWK4bWvh2WGtUOp89RVhuTKYg1ZAowt/tMpierNNzR2V2c+NtW5AyP
 od3727phPt+K5kS1apECGlKKyy7V1QuZ3BFKmGAnr8La2CELxnygAkucV Q==;
X-CSE-ConnectionGUID: TKDUb71pTdy/l1AdxyNdLw==
X-CSE-MsgGUID: axWsfVAFTOOLmtRjV33hBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="30401703"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="30401703"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 08:02:24 -0700
X-CSE-ConnectionGUID: 661hJZwlTjqQ5SLJDsddzg==
X-CSE-MsgGUID: hHqexKydR1m7xS7p7Fmt1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="51754184"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 19 Jul 2024 08:02:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sUp7k-000iGU-2V;
 Fri, 19 Jul 2024 15:02:20 +0000
Date: Fri, 19 Jul 2024 23:01:47 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:topic/xe-for-CI] BUILD SUCCESS
 35380fda665130c94063731c249473c414bca251
Message-ID: <202407192344.dotX64k2-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git topic/xe-for-CI
branch HEAD: 35380fda665130c94063731c249473c414bca251  drm/xe/huc: Define BMG HuC

elapsed time: 1118m

configs tested: 188
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                            hsdk_defconfig   gcc-13.2.0
arc                   randconfig-001-20240719   gcc-13.2.0
arc                   randconfig-002-20240719   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                           h3600_defconfig   gcc-14.1.0
arm                            mmp2_defconfig   gcc-14.1.0
arm                          moxart_defconfig   gcc-14.1.0
arm                   randconfig-001-20240719   clang-19
arm                   randconfig-002-20240719   gcc-14.1.0
arm                   randconfig-003-20240719   gcc-14.1.0
arm                   randconfig-004-20240719   clang-19
arm64                            alldefconfig   gcc-14.1.0
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240719   gcc-14.1.0
arm64                 randconfig-002-20240719   gcc-14.1.0
arm64                 randconfig-003-20240719   gcc-14.1.0
arm64                 randconfig-004-20240719   gcc-14.1.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240719   gcc-14.1.0
csky                  randconfig-002-20240719   gcc-14.1.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240719   clang-19
hexagon               randconfig-002-20240719   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240719   clang-18
i386         buildonly-randconfig-002-20240719   clang-18
i386         buildonly-randconfig-003-20240719   clang-18
i386         buildonly-randconfig-003-20240719   gcc-10
i386         buildonly-randconfig-004-20240719   clang-18
i386         buildonly-randconfig-005-20240719   clang-18
i386         buildonly-randconfig-005-20240719   gcc-10
i386         buildonly-randconfig-006-20240719   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240719   clang-18
i386                  randconfig-002-20240719   clang-18
i386                  randconfig-003-20240719   clang-18
i386                  randconfig-004-20240719   clang-18
i386                  randconfig-004-20240719   gcc-13
i386                  randconfig-005-20240719   clang-18
i386                  randconfig-006-20240719   clang-18
i386                  randconfig-011-20240719   clang-18
i386                  randconfig-012-20240719   clang-18
i386                  randconfig-013-20240719   clang-18
i386                  randconfig-014-20240719   clang-18
i386                  randconfig-015-20240719   clang-18
i386                  randconfig-015-20240719   gcc-13
i386                  randconfig-016-20240719   clang-18
i386                  randconfig-016-20240719   gcc-13
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240719   gcc-14.1.0
loongarch             randconfig-002-20240719   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                          eyeq5_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240719   gcc-14.1.0
nios2                 randconfig-002-20240719   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240719   gcc-14.1.0
parisc                randconfig-002-20240719   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                  iss476-smp_defconfig   gcc-14.1.0
powerpc                      katmai_defconfig   clang-19
powerpc                       maple_defconfig   clang-19
powerpc                    mvme5100_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240719   gcc-14.1.0
powerpc               randconfig-002-20240719   gcc-14.1.0
powerpc               randconfig-003-20240719   gcc-14.1.0
powerpc                      walnut_defconfig   gcc-14.1.0
powerpc64             randconfig-001-20240719   gcc-13.2.0
powerpc64             randconfig-002-20240719   gcc-14.1.0
powerpc64             randconfig-003-20240719   gcc-14.1.0
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                               defconfig   clang-19
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240719   clang-19
riscv                 randconfig-002-20240719   clang-19
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-19
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240719   clang-19
s390                  randconfig-002-20240719   clang-19
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                            hp6xx_defconfig   gcc-14.1.0
sh                          landisk_defconfig   gcc-14.1.0
sh                    randconfig-001-20240719   gcc-14.1.0
sh                    randconfig-002-20240719   gcc-14.1.0
sh                           se7206_defconfig   gcc-14.1.0
sh                           se7722_defconfig   gcc-14.1.0
sh                   sh7724_generic_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240719   gcc-14.1.0
sparc64               randconfig-002-20240719   gcc-14.1.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-13
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240719   clang-19
um                    randconfig-002-20240719   gcc-13
um                           x86_64_defconfig   clang-15
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240719   gcc-13
x86_64       buildonly-randconfig-002-20240719   clang-18
x86_64       buildonly-randconfig-003-20240719   gcc-10
x86_64       buildonly-randconfig-004-20240719   gcc-13
x86_64       buildonly-randconfig-005-20240719   gcc-12
x86_64       buildonly-randconfig-006-20240719   gcc-13
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240719   gcc-13
x86_64                randconfig-002-20240719   clang-18
x86_64                randconfig-003-20240719   gcc-13
x86_64                randconfig-004-20240719   gcc-7
x86_64                randconfig-005-20240719   gcc-7
x86_64                randconfig-006-20240719   clang-18
x86_64                randconfig-011-20240719   gcc-13
x86_64                randconfig-012-20240719   gcc-13
x86_64                randconfig-013-20240719   gcc-8
x86_64                randconfig-014-20240719   gcc-13
x86_64                randconfig-015-20240719   clang-18
x86_64                randconfig-016-20240719   gcc-13
x86_64                randconfig-071-20240719   clang-18
x86_64                randconfig-072-20240719   gcc-8
x86_64                randconfig-073-20240719   clang-18
x86_64                randconfig-074-20240719   gcc-10
x86_64                randconfig-075-20240719   gcc-10
x86_64                randconfig-076-20240719   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240719   gcc-14.1.0
xtensa                randconfig-002-20240719   gcc-14.1.0
xtensa                    xip_kc705_defconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
