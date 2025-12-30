Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DACFE92FE3
	for <intel-xe@archiver.kernel.org>; Tue, 30 Dec 2025 01:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF64D10E7A5;
	Tue, 30 Dec 2025 01:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jiClDVtZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997D410E7A5
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Dec 2025 01:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767059110; x=1798595110;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=156xh75pJf4Ky6te+aTxq/F0T3iBkE7HYRpyGjDEjew=;
 b=jiClDVtZ5z+wSqZi74VYKVVrGqD12s0hYIDgvEc2L4KjtdaTcC7Sstfn
 CYYW9u2yWpTFDBlKUAW9naEW5vE4usPoM8f0FUYF6dmQdC0y7HUlfGcpa
 asxfeZ8Wgcl4t5ddT3tukwZUWTGvqUK9CfjrfxNUeV8lqDMGBdJxmvYLs
 pmRbnPk1dIsWkuih9oQRtYV+Xs0BxsjQ2rfGPGf46//M6rga2S2rSy+UU
 ELrw1z4Fr+ip+xYke8o0p71K0cLs1ePq3ccRuvctIvs9w5euwnnTBZj+Q
 0mpZxcZfduTpmWyjLw+eHREipr3c++Dqqy37m3u0JH4S/geHR7QjWZXl9 A==;
X-CSE-ConnectionGUID: tI1CrYu7T/uSCpqWf/NruQ==
X-CSE-MsgGUID: wN9hzwy5SGua4Ix8TSny9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68551561"
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; d="scan'208";a="68551561"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 17:45:10 -0800
X-CSE-ConnectionGUID: ONhZkeUeTdak3oExD5NTFw==
X-CSE-MsgGUID: Ud6xeXUpSKSZGiXNXQgpIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; d="scan'208";a="231748962"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
 by orviesa002.jf.intel.com with ESMTP; 29 Dec 2025 17:45:08 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vaOnK-000000008Bd-2k2B;
 Tue, 30 Dec 2025 01:45:06 +0000
Date: Tue, 30 Dec 2025 09:44:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 bed2a6bd20681aacfb063015c1edfab6f58a333e
Message-ID: <202512300944.0u82dlWw-lkp@intel.com>
User-Agent: s-nail v14.9.25
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
branch HEAD: bed2a6bd20681aacfb063015c1edfab6f58a333e  drm/xe/guc: READ/WRITE_ONCE g2h_fence->done

elapsed time: 891m

configs tested: 158
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251229    gcc-13.4.0
arc                   randconfig-002-20251229    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-22
arm                          collie_defconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                      jornada720_defconfig    clang-22
arm                   randconfig-001-20251229    gcc-15.1.0
arm                   randconfig-002-20251229    gcc-12.5.0
arm                   randconfig-003-20251229    clang-22
arm                   randconfig-004-20251229    gcc-15.1.0
arm                        realview_defconfig    clang-16
arm                        spear6xx_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251229    clang-22
arm64                 randconfig-002-20251229    clang-22
arm64                 randconfig-003-20251229    gcc-10.5.0
arm64                 randconfig-004-20251229    gcc-9.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251229    gcc-15.1.0
csky                  randconfig-002-20251229    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251229    clang-22
hexagon               randconfig-002-20251229    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251229    clang-20
i386        buildonly-randconfig-002-20251229    gcc-14
i386        buildonly-randconfig-003-20251229    gcc-13
i386        buildonly-randconfig-004-20251229    clang-20
i386        buildonly-randconfig-005-20251229    gcc-14
i386        buildonly-randconfig-006-20251229    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251229    gcc-14
i386                  randconfig-002-20251229    clang-20
i386                  randconfig-003-20251229    clang-20
i386                  randconfig-004-20251229    clang-20
i386                  randconfig-005-20251229    clang-20
i386                  randconfig-006-20251229    clang-20
i386                  randconfig-007-20251229    clang-20
i386                  randconfig-011-20251229    gcc-14
i386                  randconfig-012-20251229    gcc-14
i386                  randconfig-013-20251229    gcc-14
i386                  randconfig-014-20251229    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251229    clang-18
loongarch             randconfig-002-20251229    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                     decstation_defconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251229    gcc-11.5.0
nios2                 randconfig-002-20251229    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251229    gcc-13.4.0
parisc                randconfig-002-20251229    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                    mvme5100_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251229    gcc-12.5.0
powerpc               randconfig-002-20251229    clang-18
powerpc64             randconfig-001-20251229    clang-20
powerpc64             randconfig-002-20251229    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251229    gcc-13.4.0
sparc                 randconfig-002-20251229    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251229    clang-20
sparc64               randconfig-002-20251229    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251229    gcc-14
um                    randconfig-002-20251229    clang-22
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251229    clang-20
x86_64      buildonly-randconfig-002-20251229    clang-20
x86_64      buildonly-randconfig-003-20251229    gcc-14
x86_64      buildonly-randconfig-004-20251229    clang-20
x86_64      buildonly-randconfig-005-20251229    gcc-14
x86_64      buildonly-randconfig-006-20251229    gcc-13
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251230    gcc-14
x86_64                randconfig-002-20251230    clang-20
x86_64                randconfig-003-20251230    clang-20
x86_64                randconfig-004-20251230    clang-20
x86_64                randconfig-005-20251230    clang-20
x86_64                randconfig-006-20251230    gcc-14
x86_64                randconfig-011-20251229    clang-20
x86_64                randconfig-012-20251229    gcc-14
x86_64                randconfig-013-20251229    clang-20
x86_64                randconfig-014-20251229    clang-20
x86_64                randconfig-015-20251229    clang-20
x86_64                randconfig-016-20251229    gcc-14
x86_64                randconfig-071-20251229    clang-20
x86_64                randconfig-072-20251229    gcc-14
x86_64                randconfig-073-20251229    gcc-13
x86_64                randconfig-074-20251229    clang-20
x86_64                randconfig-075-20251229    clang-20
x86_64                randconfig-076-20251229    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251229    gcc-8.5.0
xtensa                randconfig-002-20251229    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
