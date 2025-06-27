Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA2DC7EE31
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 12:23:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6D310E325;
	Fri, 27 Jun 2025 12:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bURTOblt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A53710E325
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 12:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751026978; x=1782562978;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=CzUCRI8WpBRwJ5daPQk1Do8gdyQ/UgqxzzkCvM6OvjQ=;
 b=bURTObltoTSDqsLi3InPsTtoXephHxoEQErH1BNk+EKXhfQ9xFHXAiOC
 qPchuiG7/9VtVLg/ax7J71boAYN/ZZZ9+nAQR7JoyQVydY/Vy1gcFmI4/
 9BHoJmBE2C1DkvOPJMQB+l0/1zR/ZZa/X7TERGibfGDl2Bc3OsAvJUwzl
 LbN6Pe6Jq8I2RysoalngXCQibZLyWES4nqCLgysKSH4yq/eK6pBmXF/QF
 8GvjQsKu18NqYmdcXA4z6SN41Ku5PGRpXBCPN1dKgrotgYSVnmcFtXWpV
 dkVxUn3stK1m6OZUHco4qCeJhQjaR+AH+oHPimBUBmi+DViY3pYK0S7dE A==;
X-CSE-ConnectionGUID: TiVsSCvnQSqleIeRq9XPZQ==
X-CSE-MsgGUID: VPmYt9W1Q8ek2jEb3JRZWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="52458149"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="52458149"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 05:22:58 -0700
X-CSE-ConnectionGUID: UT0NApeASTGE37IAXER96A==
X-CSE-MsgGUID: ODKY3+lfRROZYWOHaWM0rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="152315409"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 27 Jun 2025 05:22:57 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uV86Y-000W9t-1o;
 Fri, 27 Jun 2025 12:22:54 +0000
Date: Fri, 27 Jun 2025 20:22:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 af2b588abe006bd55ddd358c4c3b87523349c475
Message-ID: <202506272021.pNnVCHID-lkp@intel.com>
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
branch HEAD: af2b588abe006bd55ddd358c4c3b87523349c475  drm/xe: Process deferred GGTT node removals on device unwind

elapsed time: 1347m

configs tested: 124
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              alldefconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                         haps_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20250626    gcc-12.4.0
arc                   randconfig-002-20250626    gcc-13.3.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                       multi_v4t_defconfig    clang-16
arm                   randconfig-001-20250626    clang-21
arm                   randconfig-002-20250626    clang-20
arm                   randconfig-003-20250626    gcc-10.5.0
arm                   randconfig-004-20250626    clang-21
arm                           sama5_defconfig    gcc-15.1.0
arm                       spear13xx_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250626    clang-21
arm64                 randconfig-002-20250626    clang-17
arm64                 randconfig-003-20250626    gcc-8.5.0
arm64                 randconfig-004-20250626    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250627    gcc-15.1.0
csky                  randconfig-002-20250627    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250627    clang-21
hexagon               randconfig-002-20250627    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250626    clang-20
i386        buildonly-randconfig-002-20250626    clang-20
i386        buildonly-randconfig-003-20250626    clang-20
i386        buildonly-randconfig-004-20250626    clang-20
i386        buildonly-randconfig-005-20250626    clang-20
i386        buildonly-randconfig-006-20250626    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250627    gcc-15.1.0
loongarch             randconfig-002-20250627    gcc-15.1.0
m68k                             alldefconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        mvme147_defconfig    gcc-15.1.0
m68k                           virt_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                      maltaaprp_defconfig    clang-21
mips                   sb1250_swarm_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250627    gcc-8.5.0
nios2                 randconfig-002-20250627    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250627    gcc-9.3.0
parisc                randconfig-002-20250627    gcc-8.5.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                   currituck_defconfig    clang-21
powerpc               randconfig-001-20250627    gcc-15.1.0
powerpc               randconfig-002-20250627    clang-21
powerpc               randconfig-003-20250627    gcc-15.1.0
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250627    gcc-12.4.0
powerpc64             randconfig-002-20250627    gcc-10.5.0
powerpc64             randconfig-003-20250627    gcc-8.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250627    gcc-8.5.0
riscv                 randconfig-002-20250627    gcc-13.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250627    clang-21
s390                  randconfig-002-20250627    clang-21
s390                       zfcpdump_defconfig    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250627    gcc-9.3.0
sh                    randconfig-002-20250627    gcc-15.1.0
sh                          rsk7264_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250627    gcc-11.5.0
sparc                 randconfig-002-20250627    gcc-8.5.0
sparc64               randconfig-001-20250627    gcc-11.5.0
sparc64               randconfig-002-20250627    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250627    gcc-12
um                    randconfig-002-20250627    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250627    clang-20
x86_64      buildonly-randconfig-002-20250627    clang-20
x86_64      buildonly-randconfig-003-20250627    clang-20
x86_64      buildonly-randconfig-004-20250627    clang-20
x86_64      buildonly-randconfig-005-20250627    gcc-12
x86_64      buildonly-randconfig-006-20250627    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250627    gcc-13.3.0
xtensa                randconfig-002-20250627    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
