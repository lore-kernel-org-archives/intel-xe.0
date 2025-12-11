Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C686D43354
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 20:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD7410E0C8;
	Thu, 11 Dec 2025 20:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EB829vf9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9B510E0C8
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 20:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765486310; x=1797022310;
 h=date:from:to:cc:subject:message-id;
 bh=tursVFjqs3yKNrYSj+sXelDCRIHQ7I0TzVdzo+T78lc=;
 b=EB829vf9bk83kHT2/wGq3KxS66WKO5oqsfITuCNyy6zVJgpL6SwSKofA
 77t45VUChozeyQqqQAU/kDp4OZthCKi8OdN4f+qyHbEheoP+BKo8KdNa6
 pVXwE5u4ZvnvF/6ygUCjsUQ6y3P2hZ/nVvISgje8vJBQnbSou8mLKVP2o
 rNCT+ls8iGqRI8/PI11r5h9nB5Ge6RiKPPONpXqT7ZUyj6RyTCnRoLHm9
 djiY30DbFEha2YsRNrAu3ymX6+oSYbKlTvSc6A1Ifh5pOQK03NfB2Fwsw
 t+P/A4tfOXyb5Od6QYMhq9o3gmCTpFR6Obk7wf60f0cupr75HcSGih9Bj Q==;
X-CSE-ConnectionGUID: 5JodfFI9TCi2VQu9OaCQFw==
X-CSE-MsgGUID: nXdi8niIRS6ftety2hr9qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67435425"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67435425"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 12:51:49 -0800
X-CSE-ConnectionGUID: gR2yQ1IIQuiiCDbWr6Ruzg==
X-CSE-MsgGUID: qSYn6FXRSmSalqMxOtHGmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="201064539"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 11 Dec 2025 12:51:49 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vTnda-0000000056r-1CsX;
 Thu, 11 Dec 2025 20:51:46 +0000
Date: Fri, 12 Dec 2025 04:51:30 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:topic/xe-for-CI] BUILD SUCCESS
 7f3219f02c00680d63c06e779926b1715c42b51d
Message-ID: <202512120424.hmROMQuC-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git topic/xe-for-CI
branch HEAD: 7f3219f02c00680d63c06e779926b1715c42b51d  topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI

elapsed time: 1460m

configs tested: 228
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251211    gcc-10.5.0
arc                   randconfig-001-20251211    gcc-8.5.0
arc                   randconfig-002-20251211    gcc-10.5.0
arc                   randconfig-002-20251211    gcc-14.3.0
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                        mvebu_v7_defconfig    clang-22
arm                          pxa910_defconfig    gcc-15.1.0
arm                   randconfig-001-20251211    gcc-10.5.0
arm                   randconfig-001-20251211    gcc-8.5.0
arm                   randconfig-002-20251211    gcc-10.5.0
arm                   randconfig-003-20251211    clang-22
arm                   randconfig-003-20251211    gcc-10.5.0
arm                   randconfig-004-20251211    clang-22
arm                   randconfig-004-20251211    gcc-10.5.0
arm                         s5pv210_defconfig    gcc-15.1.0
arm                           stm32_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-22
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251211    clang-22
arm64                 randconfig-001-20251211    gcc-14.3.0
arm64                 randconfig-002-20251211    clang-22
arm64                 randconfig-002-20251211    gcc-14.3.0
arm64                 randconfig-003-20251211    gcc-14.3.0
arm64                 randconfig-004-20251211    clang-16
arm64                 randconfig-004-20251211    gcc-14.3.0
csky                             allmodconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251211    gcc-11.5.0
csky                  randconfig-001-20251211    gcc-14.3.0
csky                  randconfig-002-20251211    gcc-10.5.0
csky                  randconfig-002-20251211    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251211    clang-19
hexagon               randconfig-001-20251211    gcc-8.5.0
hexagon               randconfig-002-20251211    clang-17
hexagon               randconfig-002-20251211    gcc-8.5.0
i386                             allmodconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251211    clang-20
i386        buildonly-randconfig-002-20251211    gcc-14
i386        buildonly-randconfig-003-20251211    clang-20
i386        buildonly-randconfig-004-20251211    gcc-13
i386        buildonly-randconfig-005-20251211    gcc-14
i386        buildonly-randconfig-006-20251211    gcc-13
i386                                defconfig    clang-20
i386                  randconfig-001-20251211    gcc-14
i386                  randconfig-002-20251211    clang-20
i386                  randconfig-003-20251211    clang-20
i386                  randconfig-004-20251211    gcc-14
i386                  randconfig-005-20251211    clang-20
i386                  randconfig-006-20251211    gcc-14
i386                  randconfig-007-20251211    clang-20
i386                  randconfig-011-20251211    clang-20
i386                  randconfig-011-20251211    gcc-14
i386                  randconfig-012-20251211    clang-20
i386                  randconfig-012-20251211    gcc-12
i386                  randconfig-013-20251211    clang-20
i386                  randconfig-014-20251211    clang-20
i386                  randconfig-015-20251211    clang-20
i386                  randconfig-016-20251211    clang-20
i386                  randconfig-017-20251211    clang-20
i386                  randconfig-017-20251211    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251211    gcc-14.3.0
loongarch             randconfig-001-20251211    gcc-8.5.0
loongarch             randconfig-002-20251211    clang-18
loongarch             randconfig-002-20251211    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
microblaze                      mmu_defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                           xway_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251211    gcc-8.5.0
nios2                 randconfig-002-20251211    gcc-8.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-64bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20251211    clang-22
parisc                randconfig-001-20251211    gcc-14.3.0
parisc                randconfig-002-20251211    clang-22
parisc                randconfig-002-20251211    gcc-8.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                     asp8347_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251211    clang-22
powerpc               randconfig-002-20251211    clang-22
powerpc64             randconfig-001-20251211    clang-22
powerpc64             randconfig-001-20251211    gcc-8.5.0
powerpc64             randconfig-002-20251211    clang-22
powerpc64             randconfig-002-20251211    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251211    clang-22
riscv                 randconfig-001-20251211    gcc-11.5.0
riscv                 randconfig-002-20251211    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251211    gcc-11.5.0
s390                  randconfig-002-20251211    clang-22
s390                  randconfig-002-20251211    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251211    gcc-11.5.0
sh                    randconfig-001-20251211    gcc-15.1.0
sh                    randconfig-002-20251211    gcc-10.5.0
sh                    randconfig-002-20251211    gcc-11.5.0
sh                           se7343_defconfig    gcc-15.1.0
sh                   sh7724_generic_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251211    gcc-11.5.0
sparc                 randconfig-002-20251211    gcc-11.5.0
sparc                 randconfig-002-20251211    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251211    gcc-11.5.0
sparc64               randconfig-001-20251211    gcc-8.5.0
sparc64               randconfig-002-20251211    gcc-11.5.0
sparc64               randconfig-002-20251211    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251211    clang-22
um                    randconfig-001-20251211    gcc-11.5.0
um                    randconfig-002-20251211    gcc-11.5.0
um                    randconfig-002-20251211    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251211    clang-20
x86_64      buildonly-randconfig-001-20251211    gcc-14
x86_64      buildonly-randconfig-002-20251211    clang-20
x86_64      buildonly-randconfig-002-20251211    gcc-14
x86_64      buildonly-randconfig-003-20251211    clang-20
x86_64      buildonly-randconfig-004-20251211    clang-20
x86_64      buildonly-randconfig-005-20251211    clang-20
x86_64      buildonly-randconfig-005-20251211    gcc-14
x86_64      buildonly-randconfig-006-20251211    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251211    gcc-12
x86_64                randconfig-001-20251211    gcc-14
x86_64                randconfig-002-20251211    clang-20
x86_64                randconfig-002-20251211    gcc-12
x86_64                randconfig-003-20251211    gcc-12
x86_64                randconfig-004-20251211    clang-20
x86_64                randconfig-004-20251211    gcc-12
x86_64                randconfig-005-20251211    gcc-12
x86_64                randconfig-005-20251211    gcc-14
x86_64                randconfig-006-20251211    gcc-12
x86_64                randconfig-006-20251211    gcc-14
x86_64                randconfig-011-20251211    gcc-14
x86_64                randconfig-012-20251211    gcc-14
x86_64                randconfig-013-20251211    clang-20
x86_64                randconfig-013-20251211    gcc-14
x86_64                randconfig-014-20251211    clang-20
x86_64                randconfig-014-20251211    gcc-14
x86_64                randconfig-015-20251211    clang-20
x86_64                randconfig-015-20251211    gcc-14
x86_64                randconfig-016-20251211    gcc-14
x86_64                randconfig-071-20251211    gcc-14
x86_64                randconfig-072-20251211    clang-20
x86_64                randconfig-073-20251211    gcc-14
x86_64                randconfig-074-20251211    clang-20
x86_64                randconfig-075-20251211    clang-20
x86_64                randconfig-076-20251211    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                           alldefconfig    gcc-15.1.0
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                  nommu_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251211    gcc-11.5.0
xtensa                randconfig-002-20251211    gcc-11.5.0
xtensa                randconfig-002-20251211    gcc-15.1.0
xtensa                    xip_kc705_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
