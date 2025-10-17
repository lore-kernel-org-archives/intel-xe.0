Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B75ACCD184
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 07:20:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D48710EAF5;
	Fri, 17 Oct 2025 07:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="es5dcPNQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86AF10EAF5
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 07:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760685641; x=1792221641;
 h=date:from:to:cc:subject:message-id;
 bh=4AiN36pq1ECgVHEVAKZnXfnRQ6lZkdY2nJYSr+e95+o=;
 b=es5dcPNQkim6SPy+7TuYd74EisUv2a+kRxhZggcHgQcTBmFLmRMO3wDy
 xFI4e8EcWR0GkH9bKT9dKnhQzuyGkr8gXQxXQRvx4pIUl30bVSO8AJqZD
 55cDVXEqdbsN8aLPtmL3d/hu2N5dujKg1bZur50i7xWdEKb/oC2xfWqNU
 PJ2gVQ/pauP6/s8gwVrBflK09DzE93abCy70/EFDp+TnKoQh6p1PMX8O2
 DCSSQDA2wGe5pOYFlH5u8CzU+ULUiQ5L7peVeCwkc5NSu1Tg3LgOnV+H6
 5xHHD/3sq7Zbpq3Bqz2D4W7CDnonwZlZ8p+uj/IQPlM28y2KfPxVoJJDI g==;
X-CSE-ConnectionGUID: ruy4jkl3TE+fDUDC6JK1WA==
X-CSE-MsgGUID: UfJ1KqKtS2KpAed4WKhgAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62931395"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62931395"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 00:20:41 -0700
X-CSE-ConnectionGUID: o17s2nGXRrWUGx9q0xx0oQ==
X-CSE-MsgGUID: xpGd3PnkQE2dBd9E+rx9Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186924844"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa004.jf.intel.com with ESMTP; 17 Oct 2025 00:20:40 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v9elM-0005g5-2U;
 Fri, 17 Oct 2025 07:20:34 +0000
Date: Fri, 17 Oct 2025 15:14:45 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 225bc03d85427e7e3821d6f99f4f2d4a09350dda
Message-ID: <202510171539.ffu2X5dQ-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: 225bc03d85427e7e3821d6f99f4f2d4a09350dda  drm/xe/evict: drop bogus assert

elapsed time: 1454m

configs tested: 234
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                        nsim_700_defconfig    gcc-15.1.0
arc                   randconfig-001-20251016    gcc-13.4.0
arc                   randconfig-002-20251016    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                        multi_v7_defconfig    gcc-15.1.0
arm                          pxa168_defconfig    clang-19
arm                   randconfig-001-20251016    clang-22
arm                   randconfig-002-20251016    gcc-10.5.0
arm                   randconfig-003-20251016    clang-22
arm                   randconfig-004-20251016    gcc-14.3.0
arm                       spear13xx_defconfig    gcc-15.1.0
arm                         wpcm450_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251016    clang-22
arm64                 randconfig-002-20251016    gcc-13.4.0
arm64                 randconfig-003-20251016    gcc-10.5.0
arm64                 randconfig-004-20251016    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251016    gcc-11.5.0
csky                  randconfig-001-20251017    gcc-15.1.0
csky                  randconfig-002-20251016    gcc-11.5.0
csky                  randconfig-002-20251017    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251016    clang-22
hexagon               randconfig-001-20251017    gcc-15.1.0
hexagon               randconfig-002-20251016    clang-22
hexagon               randconfig-002-20251017    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251016    clang-20
i386        buildonly-randconfig-001-20251017    clang-20
i386        buildonly-randconfig-002-20251016    gcc-14
i386        buildonly-randconfig-002-20251017    clang-20
i386        buildonly-randconfig-003-20251016    clang-20
i386        buildonly-randconfig-003-20251017    clang-20
i386        buildonly-randconfig-004-20251016    clang-20
i386        buildonly-randconfig-004-20251017    clang-20
i386        buildonly-randconfig-005-20251016    clang-20
i386        buildonly-randconfig-005-20251017    clang-20
i386        buildonly-randconfig-006-20251016    gcc-14
i386        buildonly-randconfig-006-20251017    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251017    clang-20
i386                  randconfig-002-20251017    clang-20
i386                  randconfig-003-20251017    clang-20
i386                  randconfig-004-20251017    clang-20
i386                  randconfig-005-20251017    clang-20
i386                  randconfig-006-20251017    clang-20
i386                  randconfig-007-20251017    clang-20
i386                  randconfig-011-20251017    gcc-12
i386                  randconfig-012-20251017    gcc-12
i386                  randconfig-013-20251017    gcc-12
i386                  randconfig-014-20251017    gcc-12
i386                  randconfig-015-20251017    gcc-12
i386                  randconfig-016-20251017    gcc-12
i386                  randconfig-017-20251017    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251016    gcc-15.1.0
loongarch             randconfig-001-20251017    gcc-15.1.0
loongarch             randconfig-002-20251016    gcc-13.4.0
loongarch             randconfig-002-20251017    gcc-15.1.0
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
mips                         bigsur_defconfig    gcc-15.1.0
mips                       rbtx49xx_defconfig    gcc-15.1.0
nios2                            alldefconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251016    gcc-8.5.0
nios2                 randconfig-001-20251017    gcc-15.1.0
nios2                 randconfig-002-20251016    gcc-8.5.0
nios2                 randconfig-002-20251017    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                 simple_smp_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-32bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20251016    gcc-9.5.0
parisc                randconfig-001-20251017    gcc-15.1.0
parisc                randconfig-002-20251016    gcc-8.5.0
parisc                randconfig-002-20251017    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251016    clang-16
powerpc               randconfig-001-20251017    gcc-15.1.0
powerpc               randconfig-002-20251016    gcc-8.5.0
powerpc               randconfig-002-20251017    gcc-15.1.0
powerpc               randconfig-003-20251016    clang-22
powerpc               randconfig-003-20251017    gcc-15.1.0
powerpc64             randconfig-001-20251017    gcc-15.1.0
powerpc64             randconfig-002-20251016    clang-22
powerpc64             randconfig-002-20251017    gcc-15.1.0
powerpc64             randconfig-003-20251016    gcc-13.4.0
powerpc64             randconfig-003-20251017    gcc-15.1.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                 randconfig-001-20251016    gcc-9.5.0
riscv                 randconfig-001-20251017    clang-22
riscv                 randconfig-002-20251016    gcc-10.5.0
riscv                 randconfig-002-20251017    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251016    clang-18
s390                  randconfig-001-20251017    clang-22
s390                  randconfig-002-20251016    gcc-13.4.0
s390                  randconfig-002-20251017    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                ecovec24-romimage_defconfig    gcc-15.1.0
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20251016    gcc-14.3.0
sh                    randconfig-001-20251017    clang-22
sh                    randconfig-002-20251016    gcc-14.3.0
sh                    randconfig-002-20251017    clang-22
sh                   secureedge5410_defconfig    gcc-15.1.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
sh                            titan_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251016    gcc-15.1.0
sparc                 randconfig-001-20251017    clang-22
sparc                 randconfig-002-20251016    gcc-8.5.0
sparc                 randconfig-002-20251017    clang-22
sparc64               randconfig-001-20251016    gcc-13.4.0
sparc64               randconfig-001-20251017    clang-22
sparc64               randconfig-002-20251016    gcc-8.5.0
sparc64               randconfig-002-20251017    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                    randconfig-001-20251016    gcc-12
um                    randconfig-001-20251017    clang-22
um                    randconfig-002-20251016    clang-22
um                    randconfig-002-20251017    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251016    clang-20
x86_64      buildonly-randconfig-001-20251017    clang-20
x86_64      buildonly-randconfig-002-20251016    gcc-14
x86_64      buildonly-randconfig-002-20251017    clang-20
x86_64      buildonly-randconfig-003-20251016    gcc-14
x86_64      buildonly-randconfig-003-20251017    clang-20
x86_64      buildonly-randconfig-004-20251016    gcc-12
x86_64      buildonly-randconfig-004-20251017    clang-20
x86_64      buildonly-randconfig-005-20251016    gcc-14
x86_64      buildonly-randconfig-005-20251017    clang-20
x86_64      buildonly-randconfig-006-20251016    gcc-12
x86_64      buildonly-randconfig-006-20251017    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251017    gcc-14
x86_64                randconfig-002-20251017    gcc-14
x86_64                randconfig-003-20251017    gcc-14
x86_64                randconfig-004-20251017    gcc-14
x86_64                randconfig-005-20251017    gcc-14
x86_64                randconfig-006-20251017    gcc-14
x86_64                randconfig-007-20251017    gcc-14
x86_64                randconfig-008-20251017    gcc-14
x86_64                randconfig-071-20251017    clang-20
x86_64                randconfig-072-20251017    clang-20
x86_64                randconfig-073-20251017    clang-20
x86_64                randconfig-074-20251017    clang-20
x86_64                randconfig-075-20251017    clang-20
x86_64                randconfig-076-20251017    clang-20
x86_64                randconfig-077-20251017    clang-20
x86_64                randconfig-078-20251017    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251016    gcc-10.5.0
xtensa                randconfig-001-20251017    clang-22
xtensa                randconfig-002-20251016    gcc-9.5.0
xtensa                randconfig-002-20251017    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
