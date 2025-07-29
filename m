Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAB9C83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 15:41:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A572A10E07B;
	Tue, 29 Jul 2025 15:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JKZjwQ2l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEF610E653
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 15:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753803697; x=1785339697;
 h=date:from:to:cc:subject:message-id;
 bh=+YgV/aBoE+rXfOVFy8MkhF1MldfxCfolnYrB745C9kk=;
 b=JKZjwQ2l4JXVa16lJCFziRo+G5KS7PZbH0nOvteLP5AyeSDER47hx+l/
 Iq9XW5PI2QOlt6Mr8yoyRUdd4pGz2ngJ+02tDCCrExfByDVGXiUoZp/KQ
 pJYu5eZRwCNdzTdSVx7pzViI6AYpEde10gIX+IqzSqlZf78kGjGvtKKiZ
 tgimSCfdqLGdVp618Ojn1AVtFEyytxnr2jlSgUwNQWxs2Ttyp4BaiMR27
 x/JBCWc4kAeCwK0LQzdCG6I0Rekz7J5gawPF4irmZbJeuLH+gZiunqbfn
 vn1AJL7lVZP136Y5Jhz5+jGfsV5C1vHVSy8CiDN0Mwkv6HY8iDnHRF4Hy w==;
X-CSE-ConnectionGUID: dTRaU6vXR8Cub88QJp9I6g==
X-CSE-MsgGUID: COdJBiAISPy7xp98fulwNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55965844"
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; d="scan'208";a="55965844"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 08:41:37 -0700
X-CSE-ConnectionGUID: U2Et0glxSLKgQG7QrOXfKg==
X-CSE-MsgGUID: nzuzcXleT0SGJubyy4G8uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; d="scan'208";a="163178384"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 29 Jul 2025 08:41:34 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ugmSK-0001QH-24;
 Tue, 29 Jul 2025 15:41:32 +0000
Date: Tue, 29 Jul 2025 23:40:43 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next-fixes] BUILD SUCCESS
 942ac8da6388c25fe62b2792c78715e0ea6e649b
Message-ID: <202507292331.OujUUnax-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next-fixes
branch HEAD: 942ac8da6388c25fe62b2792c78715e0ea6e649b  drm/xe/configfs: Fix pci_dev reference leak

elapsed time: 1444m

configs tested: 236
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                          axs103_defconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                        nsim_700_defconfig    gcc-15.1.0
arc                   randconfig-001-20250729    gcc-10.5.0
arc                   randconfig-001-20250729    gcc-8.5.0
arc                   randconfig-002-20250729    gcc-10.5.0
arc                   randconfig-002-20250729    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g5_defconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                          ep93xx_defconfig    gcc-15.1.0
arm                       netwinder_defconfig    gcc-15.1.0
arm                   randconfig-001-20250729    gcc-10.5.0
arm                   randconfig-001-20250729    gcc-15.1.0
arm                   randconfig-002-20250729    clang-19
arm                   randconfig-002-20250729    gcc-10.5.0
arm                   randconfig-003-20250729    clang-22
arm                   randconfig-003-20250729    gcc-10.5.0
arm                   randconfig-004-20250729    clang-22
arm                   randconfig-004-20250729    gcc-10.5.0
arm                         socfpga_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250729    clang-17
arm64                 randconfig-001-20250729    gcc-10.5.0
arm64                 randconfig-002-20250729    gcc-10.5.0
arm64                 randconfig-003-20250729    clang-22
arm64                 randconfig-003-20250729    gcc-10.5.0
arm64                 randconfig-004-20250729    gcc-10.5.0
arm64                 randconfig-004-20250729    gcc-11.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250729    gcc-10.5.0
csky                  randconfig-001-20250729    gcc-15.1.0
csky                  randconfig-002-20250729    gcc-10.5.0
csky                  randconfig-002-20250729    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250729    clang-22
hexagon               randconfig-001-20250729    gcc-10.5.0
hexagon               randconfig-002-20250729    clang-22
hexagon               randconfig-002-20250729    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250729    gcc-12
i386        buildonly-randconfig-002-20250729    clang-20
i386        buildonly-randconfig-002-20250729    gcc-12
i386        buildonly-randconfig-003-20250729    clang-20
i386        buildonly-randconfig-003-20250729    gcc-12
i386        buildonly-randconfig-004-20250729    clang-20
i386        buildonly-randconfig-004-20250729    gcc-12
i386        buildonly-randconfig-005-20250729    gcc-12
i386        buildonly-randconfig-006-20250729    clang-20
i386        buildonly-randconfig-006-20250729    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250729    gcc-12
i386                  randconfig-002-20250729    gcc-12
i386                  randconfig-003-20250729    gcc-12
i386                  randconfig-004-20250729    gcc-12
i386                  randconfig-005-20250729    gcc-12
i386                  randconfig-006-20250729    gcc-12
i386                  randconfig-007-20250729    gcc-12
i386                  randconfig-011-20250729    clang-20
i386                  randconfig-012-20250729    clang-20
i386                  randconfig-013-20250729    clang-20
i386                  randconfig-014-20250729    clang-20
i386                  randconfig-015-20250729    clang-20
i386                  randconfig-016-20250729    clang-20
i386                  randconfig-017-20250729    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250729    gcc-10.5.0
loongarch             randconfig-001-20250729    gcc-15.1.0
loongarch             randconfig-002-20250729    gcc-10.5.0
loongarch             randconfig-002-20250729    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath79_defconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250729    gcc-10.5.0
nios2                 randconfig-001-20250729    gcc-8.5.0
nios2                 randconfig-002-20250729    gcc-10.5.0
nios2                 randconfig-002-20250729    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250729    gcc-10.5.0
parisc                randconfig-002-20250729    gcc-10.5.0
parisc                randconfig-002-20250729    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                 mpc8313_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250729    clang-22
powerpc               randconfig-001-20250729    gcc-10.5.0
powerpc               randconfig-002-20250729    gcc-10.5.0
powerpc               randconfig-002-20250729    gcc-8.5.0
powerpc               randconfig-003-20250729    gcc-10.5.0
powerpc               randconfig-003-20250729    gcc-11.5.0
powerpc                     tqm8541_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250729    clang-22
powerpc64             randconfig-001-20250729    gcc-10.5.0
powerpc64             randconfig-002-20250729    clang-16
powerpc64             randconfig-002-20250729    gcc-10.5.0
powerpc64             randconfig-003-20250729    clang-22
powerpc64             randconfig-003-20250729    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250729    clang-22
riscv                 randconfig-002-20250729    clang-17
riscv                 randconfig-002-20250729    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-12
s390                  randconfig-001-20250729    clang-22
s390                  randconfig-001-20250729    gcc-8.5.0
s390                  randconfig-002-20250729    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-15.1.0
sh                        edosk7705_defconfig    gcc-15.1.0
sh                            migor_defconfig    gcc-15.1.0
sh                    randconfig-001-20250729    clang-22
sh                    randconfig-001-20250729    gcc-14.3.0
sh                    randconfig-002-20250729    clang-22
sh                    randconfig-002-20250729    gcc-9.5.0
sh                          rsk7203_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250729    clang-22
sparc                 randconfig-001-20250729    gcc-8.5.0
sparc                 randconfig-002-20250729    clang-22
sparc                 randconfig-002-20250729    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250729    clang-22
sparc64               randconfig-002-20250729    clang-20
sparc64               randconfig-002-20250729    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250729    clang-22
um                    randconfig-001-20250729    gcc-12
um                    randconfig-002-20250729    clang-22
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250729    clang-20
x86_64      buildonly-randconfig-001-20250729    gcc-12
x86_64      buildonly-randconfig-002-20250729    clang-20
x86_64      buildonly-randconfig-002-20250729    gcc-12
x86_64      buildonly-randconfig-003-20250729    clang-20
x86_64      buildonly-randconfig-004-20250729    clang-20
x86_64      buildonly-randconfig-004-20250729    gcc-12
x86_64      buildonly-randconfig-005-20250729    clang-20
x86_64      buildonly-randconfig-006-20250729    clang-20
x86_64      buildonly-randconfig-006-20250729    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250729    clang-20
x86_64                randconfig-002-20250729    clang-20
x86_64                randconfig-003-20250729    clang-20
x86_64                randconfig-004-20250729    clang-20
x86_64                randconfig-005-20250729    clang-20
x86_64                randconfig-006-20250729    clang-20
x86_64                randconfig-007-20250729    clang-20
x86_64                randconfig-008-20250729    clang-20
x86_64                randconfig-071-20250729    gcc-12
x86_64                randconfig-072-20250729    gcc-12
x86_64                randconfig-073-20250729    gcc-12
x86_64                randconfig-074-20250729    gcc-12
x86_64                randconfig-075-20250729    gcc-12
x86_64                randconfig-076-20250729    gcc-12
x86_64                randconfig-077-20250729    gcc-12
x86_64                randconfig-078-20250729    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250729    clang-22
xtensa                randconfig-001-20250729    gcc-8.5.0
xtensa                randconfig-002-20250729    clang-22
xtensa                randconfig-002-20250729    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
