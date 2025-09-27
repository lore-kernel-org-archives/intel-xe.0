Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C71CAC5B8
	for <intel-xe@archiver.kernel.org>; Sat, 27 Sep 2025 14:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1247110E1B3;
	Sat, 27 Sep 2025 14:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EzjO5/gk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868A410E1B3
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Sep 2025 14:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758982936; x=1790518936;
 h=date:from:to:cc:subject:message-id;
 bh=p/HRiupvo0iSWUZUgEQZFUYS3zuFUu8z2GJobxsK3Dc=;
 b=EzjO5/gkOy2QVdgDxX/rVVy0j9yJBZtMXrwf4sSNsgBX6BaWwoKcejuS
 P1YmOgoSMSuBAgztmRafif91iUl546ITkKTJHmdmbGFI9dpXIsxeZyWjD
 6/UhdtSwr6gJhBsye0xqh05I4wbc5hLq0JZwPQ055JUesjGQA2jwKABak
 WkypKb+QZrrkG5MSRcCr8EPSypsi6OkxHcC8blmXBp5W0LUBwk1SLAr7L
 kQIaSN2bq7tifN9+A19HMyhH6VEC5/xvqUvFvJDu2tiIBaU6n/005c59k
 KeARGBbNb7xkRZRwOrRJqff7HsLPz+IWmozA4/jPFI5EzItMs9AgxZRzF g==;
X-CSE-ConnectionGUID: fZJK4EO4QSa0j/Yo0pEIQw==
X-CSE-MsgGUID: +cPzeoTmT3CNs7lAEkU72w==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="64925156"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; d="scan'208";a="64925156"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 07:22:16 -0700
X-CSE-ConnectionGUID: If4sCPOvTXuUXARhAe+0Wg==
X-CSE-MsgGUID: HimJiUCEQ4e5YHWYJTaBfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; d="scan'208";a="177890324"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
 by orviesa008.jf.intel.com with ESMTP; 27 Sep 2025 07:22:15 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v2VoR-00076l-2n;
 Sat, 27 Sep 2025 14:22:11 +0000
Date: Sat, 27 Sep 2025 22:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next-fixes] BUILD SUCCESS
 1cdda15e54274278dd873c2067527180d6112720
Message-ID: <202509272253.MzEKyWEw-lkp@intel.com>
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
branch HEAD: 1cdda15e54274278dd873c2067527180d6112720  drm/xe/configfs: Improve doc for ctx_restore* attributes

elapsed time: 1460m

configs tested: 230
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250926    gcc-8.5.0
arc                   randconfig-001-20250927    gcc-10.5.0
arc                   randconfig-002-20250926    gcc-9.5.0
arc                   randconfig-002-20250927    gcc-10.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                            dove_defconfig    gcc-15.1.0
arm                          exynos_defconfig    gcc-15.1.0
arm                          gemini_defconfig    gcc-15.1.0
arm                         nhk8815_defconfig    clang-22
arm                          pxa910_defconfig    gcc-15.1.0
arm                   randconfig-001-20250926    clang-22
arm                   randconfig-001-20250927    gcc-10.5.0
arm                   randconfig-002-20250926    clang-17
arm                   randconfig-002-20250927    gcc-10.5.0
arm                   randconfig-003-20250926    clang-22
arm                   randconfig-003-20250927    gcc-10.5.0
arm                   randconfig-004-20250926    clang-22
arm                   randconfig-004-20250927    gcc-10.5.0
arm                        spear3xx_defconfig    gcc-15.1.0
arm64                            alldefconfig    gcc-15.1.0
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250926    gcc-8.5.0
arm64                 randconfig-001-20250927    gcc-10.5.0
arm64                 randconfig-002-20250926    gcc-12.5.0
arm64                 randconfig-002-20250927    gcc-10.5.0
arm64                 randconfig-003-20250926    gcc-9.5.0
arm64                 randconfig-003-20250927    gcc-10.5.0
arm64                 randconfig-004-20250926    clang-22
arm64                 randconfig-004-20250927    gcc-10.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250926    gcc-15.1.0
csky                  randconfig-001-20250927    clang-22
csky                  randconfig-002-20250926    gcc-14.3.0
csky                  randconfig-002-20250927    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250926    clang-22
hexagon               randconfig-001-20250927    clang-22
hexagon               randconfig-002-20250926    clang-22
hexagon               randconfig-002-20250927    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250926    clang-20
i386        buildonly-randconfig-001-20250927    clang-20
i386        buildonly-randconfig-002-20250926    clang-20
i386        buildonly-randconfig-002-20250927    clang-20
i386        buildonly-randconfig-003-20250926    clang-20
i386        buildonly-randconfig-003-20250927    clang-20
i386        buildonly-randconfig-004-20250926    clang-20
i386        buildonly-randconfig-004-20250927    clang-20
i386        buildonly-randconfig-005-20250926    clang-20
i386        buildonly-randconfig-005-20250927    clang-20
i386        buildonly-randconfig-006-20250926    clang-20
i386        buildonly-randconfig-006-20250927    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250927    gcc-14
i386                  randconfig-002-20250927    gcc-14
i386                  randconfig-003-20250927    gcc-14
i386                  randconfig-004-20250927    gcc-14
i386                  randconfig-005-20250927    gcc-14
i386                  randconfig-006-20250927    gcc-14
i386                  randconfig-007-20250927    gcc-14
i386                  randconfig-011-20250927    clang-20
i386                  randconfig-012-20250927    clang-20
i386                  randconfig-013-20250927    clang-20
i386                  randconfig-014-20250927    clang-20
i386                  randconfig-015-20250927    clang-20
i386                  randconfig-016-20250927    clang-20
i386                  randconfig-017-20250927    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250926    gcc-15.1.0
loongarch             randconfig-001-20250927    clang-22
loongarch             randconfig-002-20250926    clang-22
loongarch             randconfig-002-20250927    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                          multi_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    clang-22
nios2                         3c120_defconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250926    gcc-11.5.0
nios2                 randconfig-001-20250927    clang-22
nios2                 randconfig-002-20250926    gcc-8.5.0
nios2                 randconfig-002-20250927    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250926    gcc-10.5.0
parisc                randconfig-001-20250927    clang-22
parisc                randconfig-002-20250926    gcc-10.5.0
parisc                randconfig-002-20250927    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                   lite5200b_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250926    clang-22
powerpc               randconfig-001-20250927    clang-22
powerpc               randconfig-002-20250926    clang-18
powerpc               randconfig-002-20250927    clang-22
powerpc               randconfig-003-20250926    clang-22
powerpc               randconfig-003-20250927    clang-22
powerpc64             randconfig-001-20250926    clang-22
powerpc64             randconfig-001-20250927    clang-22
powerpc64             randconfig-002-20250926    clang-16
powerpc64             randconfig-002-20250927    clang-22
powerpc64             randconfig-003-20250926    gcc-15.1.0
powerpc64             randconfig-003-20250927    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250926    clang-22
riscv                 randconfig-001-20250927    gcc-11.5.0
riscv                 randconfig-002-20250926    clang-22
riscv                 randconfig-002-20250927    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250926    clang-22
s390                  randconfig-001-20250927    gcc-11.5.0
s390                  randconfig-002-20250926    gcc-8.5.0
s390                  randconfig-002-20250927    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20250926    gcc-12.5.0
sh                    randconfig-001-20250927    gcc-11.5.0
sh                    randconfig-002-20250926    gcc-15.1.0
sh                    randconfig-002-20250927    gcc-11.5.0
sh                          rsk7264_defconfig    gcc-15.1.0
sh                           se7343_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250926    gcc-14.3.0
sparc                 randconfig-001-20250927    gcc-11.5.0
sparc                 randconfig-002-20250926    gcc-15.1.0
sparc                 randconfig-002-20250927    gcc-11.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250926    gcc-12.5.0
sparc64               randconfig-001-20250927    gcc-11.5.0
sparc64               randconfig-002-20250926    clang-22
sparc64               randconfig-002-20250927    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250926    clang-22
um                    randconfig-001-20250927    gcc-11.5.0
um                    randconfig-002-20250926    clang-22
um                    randconfig-002-20250927    gcc-11.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250926    clang-20
x86_64      buildonly-randconfig-001-20250927    gcc-14
x86_64      buildonly-randconfig-002-20250926    clang-20
x86_64      buildonly-randconfig-002-20250927    gcc-14
x86_64      buildonly-randconfig-003-20250926    gcc-14
x86_64      buildonly-randconfig-003-20250927    gcc-14
x86_64      buildonly-randconfig-004-20250926    gcc-14
x86_64      buildonly-randconfig-004-20250927    gcc-14
x86_64      buildonly-randconfig-005-20250926    gcc-14
x86_64      buildonly-randconfig-005-20250927    gcc-14
x86_64      buildonly-randconfig-006-20250926    gcc-14
x86_64      buildonly-randconfig-006-20250927    gcc-14
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250927    clang-20
x86_64                randconfig-002-20250927    clang-20
x86_64                randconfig-003-20250927    clang-20
x86_64                randconfig-004-20250927    clang-20
x86_64                randconfig-005-20250927    clang-20
x86_64                randconfig-006-20250927    clang-20
x86_64                randconfig-007-20250927    clang-20
x86_64                randconfig-008-20250927    clang-20
x86_64                randconfig-071-20250927    gcc-14
x86_64                randconfig-072-20250927    gcc-14
x86_64                randconfig-073-20250927    gcc-14
x86_64                randconfig-074-20250927    gcc-14
x86_64                randconfig-075-20250927    gcc-14
x86_64                randconfig-076-20250927    gcc-14
x86_64                randconfig-077-20250927    gcc-14
x86_64                randconfig-078-20250927    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250926    gcc-14.3.0
xtensa                randconfig-001-20250927    gcc-11.5.0
xtensa                randconfig-002-20250926    gcc-8.5.0
xtensa                randconfig-002-20250927    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
