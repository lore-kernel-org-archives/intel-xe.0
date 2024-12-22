Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46034E7718B
	for <intel-xe@archiver.kernel.org>; Sun, 22 Dec 2024 01:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD45210E01F;
	Sun, 22 Dec 2024 01:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATm6RG/e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D297B10E01F
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Dec 2024 01:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734831189; x=1766367189;
 h=date:from:to:cc:subject:message-id;
 bh=fbV4K4NZVBM9S6njUkvO1+zwKqA+kuGdd97QGqJ3N5o=;
 b=ATm6RG/ewqrZSR6OPTKWg1FqbCC2f8osmuZARKapU3BVodbrCQDSsqLb
 OQ4Hi8LiahL66goPCNsRDnLcJDWkxz6nys/eRuIwKCHxTADhDOX8A9uR1
 mmtRqCNb0tywRf+vxalBqZi3AZG+n3Po9a+ETZrf2gXNR4AhY9u7w1LGy
 Ozog1hCI5cniCxQw2ZmXleFQ4cYfJDvLE7bas8oL8X18lrZHcZzRFoZwy
 i03ysGloVU9DffRA4CQYW1h6rbHomxVaTugOGf1kf/lAi5jihnfULg319
 TUWGoEJ3pgYjZWBsdNJsajzhoGgJ5WsBdQYYXGflM+xu7wVjM62JvR74r A==;
X-CSE-ConnectionGUID: w9TWUGW9RyGgJgFxV1KhBQ==
X-CSE-MsgGUID: T93QYnbrQb+nYHM1832pcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="46345260"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; d="scan'208";a="46345260"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2024 17:33:09 -0800
X-CSE-ConnectionGUID: nfDTc54bQCe0RVRcgil8nA==
X-CSE-MsgGUID: mlJD7g72RbaYLVGz4xKTbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102977556"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 21 Dec 2024 17:33:07 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tPAq8-0002eM-3A;
 Sun, 22 Dec 2024 01:33:04 +0000
Date: Sun, 22 Dec 2024 09:33:00 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 2054d38ccf708e1add482c6345f7f349059b56e0
Message-ID: <202412220954.lKud6bOr-lkp@intel.com>
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
branch HEAD: 2054d38ccf708e1add482c6345f7f349059b56e0  drm/xe: Use q->xef for accessing xe file

elapsed time: 1444m

configs tested: 211
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                          axs103_defconfig    clang-20
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20241221    gcc-13.2.0
arc                   randconfig-002-20241221    gcc-13.2.0
arc                           tb10x_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                     am200epdkit_defconfig    clang-20
arm                         bcm2835_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                        mvebu_v5_defconfig    clang-20
arm                          pxa168_defconfig    gcc-14.2.0
arm                   randconfig-001-20241221    gcc-14.2.0
arm                   randconfig-002-20241221    gcc-14.2.0
arm                   randconfig-003-20241221    gcc-14.2.0
arm                   randconfig-004-20241221    clang-18
arm                          sp7021_defconfig    clang-20
arm                          sp7021_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241221    clang-18
arm64                 randconfig-002-20241221    clang-16
arm64                 randconfig-003-20241221    clang-20
arm64                 randconfig-004-20241221    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241222    clang-20
csky                  randconfig-001-20241222    gcc-14.2.0
csky                  randconfig-002-20241222    clang-20
csky                  randconfig-002-20241222    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241222    clang-20
hexagon               randconfig-002-20241222    clang-20
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241221    gcc-12
i386        buildonly-randconfig-002-20241221    gcc-12
i386        buildonly-randconfig-003-20241221    clang-19
i386        buildonly-randconfig-004-20241221    clang-19
i386        buildonly-randconfig-005-20241221    clang-19
i386        buildonly-randconfig-006-20241221    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241222    clang-19
i386                  randconfig-002-20241222    clang-19
i386                  randconfig-003-20241222    clang-19
i386                  randconfig-004-20241222    clang-19
i386                  randconfig-005-20241222    clang-19
i386                  randconfig-006-20241222    clang-19
i386                  randconfig-007-20241222    clang-19
i386                  randconfig-011-20241222    clang-19
i386                  randconfig-012-20241222    clang-19
i386                  randconfig-013-20241222    clang-19
i386                  randconfig-014-20241222    clang-19
i386                  randconfig-015-20241222    clang-19
i386                  randconfig-016-20241222    clang-19
i386                  randconfig-017-20241222    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241222    clang-20
loongarch             randconfig-001-20241222    gcc-14.2.0
loongarch             randconfig-002-20241222    clang-20
loongarch             randconfig-002-20241222    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                  cavium_octeon_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241222    clang-20
nios2                 randconfig-001-20241222    gcc-14.2.0
nios2                 randconfig-002-20241222    clang-20
nios2                 randconfig-002-20241222    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                generic-32bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20241222    clang-20
parisc                randconfig-001-20241222    gcc-14.2.0
parisc                randconfig-002-20241222    clang-20
parisc                randconfig-002-20241222    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                    gamecube_defconfig    clang-20
powerpc                    ge_imp3a_defconfig    clang-20
powerpc                     mpc5200_defconfig    clang-20
powerpc               randconfig-001-20241222    clang-20
powerpc               randconfig-002-20241222    clang-19
powerpc               randconfig-002-20241222    clang-20
powerpc               randconfig-003-20241222    clang-17
powerpc               randconfig-003-20241222    clang-20
powerpc64             randconfig-001-20241222    clang-19
powerpc64             randconfig-001-20241222    clang-20
powerpc64             randconfig-002-20241222    clang-20
powerpc64             randconfig-003-20241222    clang-20
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241221    gcc-14.2.0
riscv                 randconfig-001-20241222    clang-20
riscv                 randconfig-002-20241221    gcc-14.2.0
riscv                 randconfig-002-20241222    clang-20
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241221    gcc-14.2.0
s390                  randconfig-001-20241222    clang-20
s390                  randconfig-002-20241221    gcc-14.2.0
s390                  randconfig-002-20241222    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20241221    gcc-14.2.0
sh                    randconfig-001-20241222    clang-20
sh                    randconfig-002-20241221    gcc-14.2.0
sh                    randconfig-002-20241222    clang-20
sh                           se7343_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241221    gcc-14.2.0
sparc                 randconfig-001-20241222    clang-20
sparc                 randconfig-002-20241221    gcc-14.2.0
sparc                 randconfig-002-20241222    clang-20
sparc64                          alldefconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241221    gcc-14.2.0
sparc64               randconfig-001-20241222    clang-20
sparc64               randconfig-002-20241221    gcc-14.2.0
sparc64               randconfig-002-20241222    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241221    clang-18
um                    randconfig-001-20241222    clang-20
um                    randconfig-002-20241221    gcc-12
um                    randconfig-002-20241222    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241221    gcc-12
x86_64      buildonly-randconfig-002-20241221    gcc-12
x86_64      buildonly-randconfig-003-20241221    gcc-12
x86_64      buildonly-randconfig-004-20241221    gcc-12
x86_64      buildonly-randconfig-005-20241221    gcc-11
x86_64      buildonly-randconfig-006-20241221    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241222    clang-19
x86_64                randconfig-002-20241222    clang-19
x86_64                randconfig-003-20241222    clang-19
x86_64                randconfig-004-20241222    clang-19
x86_64                randconfig-005-20241222    clang-19
x86_64                randconfig-006-20241222    clang-19
x86_64                randconfig-007-20241222    clang-19
x86_64                randconfig-008-20241222    clang-19
x86_64                randconfig-071-20241222    gcc-12
x86_64                randconfig-072-20241222    gcc-12
x86_64                randconfig-073-20241222    gcc-12
x86_64                randconfig-074-20241222    gcc-12
x86_64                randconfig-075-20241222    gcc-12
x86_64                randconfig-076-20241222    gcc-12
x86_64                randconfig-077-20241222    gcc-12
x86_64                randconfig-078-20241222    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241221    gcc-14.2.0
xtensa                randconfig-001-20241222    clang-20
xtensa                randconfig-002-20241221    gcc-14.2.0
xtensa                randconfig-002-20241222    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
