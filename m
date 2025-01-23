Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09338C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 21:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A438810E0DB;
	Thu, 23 Jan 2025 21:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="foqQ7uPm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A8710E0DB
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 21:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737667765; x=1769203765;
 h=date:from:to:cc:subject:message-id;
 bh=kUweZaR0OAAi41yoBZ8pVjRTsXADP/hzMvRgMKJW8No=;
 b=foqQ7uPmk1MkDXscuKx3klbUUPPg3QFPjPLsl1yoItlhaDbSCj3bFY9j
 knnG3Yqd9eSTShAedUcNzz4OlBiusC3Irp1lPvLl2qkFr4dsyRcHAjs1r
 Gsx3AtjbSYfwlllR9x8QXkGpZuOVL3Dj3tsnPOqWrbVNgXPTAsL57G5m0
 UHohVLeOQckexg5NT6aSmx5HTdi+RR2hyxPsoL8goLULGVUAC4ZKPdTXt
 13eHhRoZB4GeH11tLg8ZO6pZ3RTJQG32ImQBodvoAPev9ul8HtmIb5w24
 ENeCBx8uAwqYtpGodmxdQ/AGdD6aOGhXGGaZWcMLqzBWUhl/YlSmRKNnW Q==;
X-CSE-ConnectionGUID: VnKt24RUTUS34kWYknYKsA==
X-CSE-MsgGUID: XoNQYFTiTRC7Q/HPGGjh6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38108444"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="38108444"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 13:29:25 -0800
X-CSE-ConnectionGUID: GDjousWoRieRV+OE3jlv+w==
X-CSE-MsgGUID: JnYrwEpZRdKn83dZ51uJiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107433283"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 13:29:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tb4lN-000bjH-1w;
 Thu, 23 Jan 2025 21:29:21 +0000
Date: Fri, 24 Jan 2025 05:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 dddc53806dd2a10e210d5ea08caec6d3f92440b2
Message-ID: <202501240521.4Df8oMGY-lkp@intel.com>
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
branch HEAD: dddc53806dd2a10e210d5ea08caec6d3f92440b2  drm/xe/ptl: Apply Wa_13011645652

elapsed time: 1366m

configs tested: 195
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250123    gcc-13.2.0
arc                   randconfig-002-20250123    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                   randconfig-001-20250123    clang-20
arm                   randconfig-002-20250123    gcc-14.2.0
arm                   randconfig-003-20250123    gcc-14.2.0
arm                   randconfig-004-20250123    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250123    gcc-14.2.0
arm64                 randconfig-002-20250123    clang-20
arm64                 randconfig-003-20250123    clang-20
arm64                 randconfig-004-20250123    clang-16
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250123    gcc-14.2.0
csky                  randconfig-002-20250123    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250123    clang-20
hexagon               randconfig-001-20250123    gcc-14.2.0
hexagon               randconfig-002-20250123    clang-20
hexagon               randconfig-002-20250123    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20250123    gcc-12
i386        buildonly-randconfig-002-20250123    clang-19
i386        buildonly-randconfig-003-20250123    gcc-12
i386        buildonly-randconfig-004-20250123    clang-19
i386        buildonly-randconfig-005-20250123    gcc-12
i386        buildonly-randconfig-006-20250123    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20250123    gcc-12
i386                  randconfig-002-20250123    gcc-12
i386                  randconfig-003-20250123    gcc-12
i386                  randconfig-004-20250123    gcc-12
i386                  randconfig-005-20250123    gcc-12
i386                  randconfig-006-20250123    gcc-12
i386                  randconfig-007-20250123    gcc-12
i386                  randconfig-011-20250123    gcc-12
i386                  randconfig-012-20250123    gcc-12
i386                  randconfig-013-20250123    gcc-12
i386                  randconfig-014-20250123    gcc-12
i386                  randconfig-015-20250123    gcc-12
i386                  randconfig-016-20250123    gcc-12
i386                  randconfig-017-20250123    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250123    gcc-14.2.0
loongarch             randconfig-002-20250123    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    gcc-14.2.0
mips                  cavium_octeon_defconfig    gcc-14.2.0
mips                         db1xxx_defconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250123    gcc-14.2.0
nios2                 randconfig-002-20250123    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250123    gcc-14.2.0
parisc                randconfig-002-20250123    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                 mpc834x_itx_defconfig    gcc-14.2.0
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc                      pmac32_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250123    gcc-14.2.0
powerpc               randconfig-002-20250123    clang-18
powerpc               randconfig-002-20250123    gcc-14.2.0
powerpc               randconfig-003-20250123    gcc-14.2.0
powerpc                     tqm8555_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250123    gcc-14.2.0
powerpc64             randconfig-002-20250123    clang-16
powerpc64             randconfig-002-20250123    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250123    gcc-14.2.0
riscv                 randconfig-002-20250123    clang-20
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250123    gcc-14.2.0
s390                  randconfig-002-20250123    clang-15
s390                       zfcpdump_defconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250123    gcc-14.2.0
sh                    randconfig-002-20250123    gcc-14.2.0
sh                          rsk7203_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250123    gcc-14.2.0
sparc                 randconfig-002-20250123    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250123    gcc-14.2.0
sparc64               randconfig-002-20250123    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250123    gcc-12
um                    randconfig-002-20250123    gcc-11
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250123    clang-19
x86_64      buildonly-randconfig-002-20250123    clang-19
x86_64      buildonly-randconfig-003-20250123    clang-19
x86_64      buildonly-randconfig-003-20250123    gcc-12
x86_64      buildonly-randconfig-004-20250123    clang-19
x86_64      buildonly-randconfig-004-20250123    gcc-12
x86_64      buildonly-randconfig-005-20250123    clang-19
x86_64      buildonly-randconfig-006-20250123    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250123    clang-19
x86_64                randconfig-002-20250123    clang-19
x86_64                randconfig-003-20250123    clang-19
x86_64                randconfig-004-20250123    clang-19
x86_64                randconfig-005-20250123    clang-19
x86_64                randconfig-006-20250123    clang-19
x86_64                randconfig-007-20250123    clang-19
x86_64                randconfig-008-20250123    clang-19
x86_64                randconfig-071-20250123    clang-19
x86_64                randconfig-072-20250123    clang-19
x86_64                randconfig-073-20250123    clang-19
x86_64                randconfig-074-20250123    clang-19
x86_64                randconfig-075-20250123    clang-19
x86_64                randconfig-076-20250123    clang-19
x86_64                randconfig-077-20250123    clang-19
x86_64                randconfig-078-20250123    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250123    gcc-14.2.0
xtensa                randconfig-002-20250123    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
