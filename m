Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC18BC47BE1
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 17:01:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983DE10E524;
	Tue,  6 Jan 2026 17:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/r0NV5X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B06210E524
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 17:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767718876; x=1799254876;
 h=date:from:to:cc:subject:message-id;
 bh=GyY3yM6TnZUEjUuqjE+C4f+v3jdo9Tw/UNt73S+baHs=;
 b=e/r0NV5X5Oeu+kb46ocD65i9q9vvyhUuURqXTa+ZfdtQeMAEeOTY3+6B
 RPQ/1v3oDlJBIy3OC4FKhv/yople2kGvfroyJDjhuHLbrDXVu9iIm/VH7
 nsRvrqVu53/XudnIxmT0JTbOMGx/hqLQp8g6WDCcE4aj7vfQUv8j8MC4g
 /w+7mUKSw7xWvgAeRphDlVFiQZJshWrvyIUhWvYegZ5os8JPVUojDKg5d
 Ko/5FRRnvwTGGvyoGvuyhwwMBuCh/1MjT7eUjU94gORRwTru+Gx1Jn3UB
 Vv2PXZscdBVBedovXZtPj2QBny3Uu65UCiAADOmYYeQI0gqwEuDyuBwvD g==;
X-CSE-ConnectionGUID: fLK6vqSyR2eSxBc0BJKDyg==
X-CSE-MsgGUID: AViZN1n8TX+dJBtpj77FqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="56648096"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="56648096"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 09:01:16 -0800
X-CSE-ConnectionGUID: LuJhN9osSf+PQktmJw7ptg==
X-CSE-MsgGUID: Cpc3qATDSieW+O9lBSn8hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="202318854"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 06 Jan 2026 09:01:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vdAQi-000000002A1-1xqd;
 Tue, 06 Jan 2026 17:01:12 +0000
Date: Wed, 07 Jan 2026 01:01:08 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 e70711be0d0ebdd0a9213446b657fe0815e38017
Message-ID: <202601070100.GFiJYrLZ-lkp@intel.com>
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
branch HEAD: e70711be0d0ebdd0a9213446b657fe0815e38017  drm/xe/i2c: Force polling mode in survivability

elapsed time: 1484m

configs tested: 172
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20260106    gcc-13.4.0
arc                   randconfig-002-20260106    gcc-13.4.0
arc                   randconfig-002-20260106    gcc-8.5.0
arm                               allnoconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                      jornada720_defconfig    clang-22
arm                         nhk8815_defconfig    clang-22
arm                          pxa3xx_defconfig    clang-22
arm                   randconfig-001-20260106    gcc-11.5.0
arm                   randconfig-001-20260106    gcc-13.4.0
arm                   randconfig-002-20260106    clang-22
arm                   randconfig-002-20260106    gcc-13.4.0
arm                   randconfig-003-20260106    gcc-10.5.0
arm                   randconfig-003-20260106    gcc-13.4.0
arm                   randconfig-004-20260106    gcc-13.4.0
arm                   randconfig-004-20260106    gcc-8.5.0
arm                         s5pv210_defconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20260106    gcc-10.5.0
arm64                 randconfig-002-20260106    gcc-10.5.0
arm64                 randconfig-003-20260106    gcc-10.5.0
arm64                 randconfig-004-20260106    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20260106    gcc-10.5.0
csky                  randconfig-002-20260106    gcc-10.5.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20260106    clang-22
hexagon               randconfig-001-20260106    gcc-8.5.0
hexagon               randconfig-002-20260106    clang-17
hexagon               randconfig-002-20260106    gcc-8.5.0
i386                             alldefconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386        buildonly-randconfig-001-20260106    clang-20
i386        buildonly-randconfig-002-20260106    clang-20
i386        buildonly-randconfig-003-20260106    clang-20
i386        buildonly-randconfig-003-20260106    gcc-14
i386        buildonly-randconfig-004-20260106    clang-20
i386        buildonly-randconfig-005-20260106    clang-20
i386        buildonly-randconfig-005-20260106    gcc-14
i386        buildonly-randconfig-006-20260106    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20260106    clang-20
i386                  randconfig-002-20260106    clang-20
i386                  randconfig-003-20260106    clang-20
i386                  randconfig-004-20260106    clang-20
i386                  randconfig-005-20260106    clang-20
i386                  randconfig-006-20260106    clang-20
i386                  randconfig-007-20260106    clang-20
i386                  randconfig-011-20260106    clang-20
i386                  randconfig-011-20260106    gcc-14
i386                  randconfig-012-20260106    gcc-14
i386                  randconfig-013-20260106    gcc-14
i386                  randconfig-014-20260106    clang-20
i386                  randconfig-014-20260106    gcc-14
i386                  randconfig-015-20260106    gcc-14
i386                  randconfig-016-20260106    clang-20
i386                  randconfig-016-20260106    gcc-14
i386                  randconfig-017-20260106    gcc-14
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260106    gcc-15.1.0
loongarch             randconfig-001-20260106    gcc-8.5.0
loongarch             randconfig-002-20260106    gcc-15.1.0
loongarch             randconfig-002-20260106    gcc-8.5.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       alldefconfig    clang-22
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                              allnoconfig    gcc-15.1.0
mips                        vocore2_defconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260106    gcc-8.5.0
nios2                 randconfig-002-20260106    gcc-11.5.0
nios2                 randconfig-002-20260106    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.1.0
openrisc                 simple_smp_defconfig    clang-22
parisc                            allnoconfig    clang-22
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20260106    gcc-8.5.0
parisc                randconfig-002-20260106    gcc-11.5.0
parisc                randconfig-002-20260106    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                           allnoconfig    clang-22
powerpc                    gamecube_defconfig    clang-22
powerpc                     ppa8548_defconfig    gcc-15.1.0
powerpc               randconfig-001-20260106    clang-22
powerpc               randconfig-001-20260106    gcc-8.5.0
powerpc               randconfig-002-20260106    gcc-8.5.0
powerpc64             randconfig-001-20260106    gcc-8.5.0
powerpc64             randconfig-002-20260106    gcc-8.5.0
riscv                             allnoconfig    clang-22
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20260106    gcc-8.5.0
riscv                 randconfig-002-20260106    clang-22
riscv                 randconfig-002-20260106    gcc-8.5.0
s390                              allnoconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20260106    gcc-8.5.0
s390                  randconfig-002-20260106    gcc-14.3.0
s390                  randconfig-002-20260106    gcc-8.5.0
sh                                allnoconfig    clang-22
sh                                  defconfig    gcc-14
sh                        dreamcast_defconfig    gcc-15.1.0
sh                ecovec24-romimage_defconfig    gcc-15.1.0
sh                          r7780mp_defconfig    clang-22
sh                    randconfig-001-20260106    gcc-15.1.0
sh                    randconfig-001-20260106    gcc-8.5.0
sh                    randconfig-002-20260106    gcc-10.5.0
sh                    randconfig-002-20260106    gcc-8.5.0
sh                           se7712_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20260106    gcc-8.5.0
sparc                 randconfig-002-20260106    gcc-8.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260106    gcc-8.5.0
sparc64               randconfig-002-20260106    gcc-8.5.0
um                                allnoconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260106    gcc-8.5.0
um                    randconfig-002-20260106    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20260106    clang-20
x86_64      buildonly-randconfig-002-20260106    clang-20
x86_64      buildonly-randconfig-003-20260106    clang-20
x86_64      buildonly-randconfig-004-20260106    clang-20
x86_64      buildonly-randconfig-005-20260106    clang-20
x86_64      buildonly-randconfig-006-20260106    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260106    clang-20
x86_64                randconfig-002-20260106    clang-20
x86_64                randconfig-003-20260106    clang-20
x86_64                randconfig-004-20260106    clang-20
x86_64                randconfig-005-20260106    clang-20
x86_64                randconfig-006-20260106    clang-20
x86_64                randconfig-011-20260106    gcc-14
x86_64                randconfig-012-20260106    gcc-14
x86_64                randconfig-013-20260106    gcc-14
x86_64                randconfig-014-20260106    gcc-14
x86_64                randconfig-015-20260106    gcc-14
x86_64                randconfig-016-20260106    gcc-14
x86_64                randconfig-071-20260106    clang-20
x86_64                randconfig-071-20260106    gcc-14
x86_64                randconfig-072-20260106    clang-20
x86_64                randconfig-073-20260106    clang-20
x86_64                randconfig-074-20260106    clang-20
x86_64                randconfig-075-20260106    clang-20
x86_64                randconfig-075-20260106    gcc-14
x86_64                randconfig-076-20260106    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    clang-22
xtensa                randconfig-001-20260106    gcc-8.5.0
xtensa                randconfig-002-20260106    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
