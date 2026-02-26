Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B331CFC5910
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 10:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6897A10E0B0;
	Thu, 26 Feb 2026 10:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fgz72jde";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34A110E0B0
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 10:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772100264; x=1803636264;
 h=date:from:to:cc:subject:message-id;
 bh=KQKnj3C7ryvo3kbbg7l1FLD1ZxuGLMr9BMnMz2NltiI=;
 b=fgz72jde/aMbHC+MSiWA12Ke6QIsU/D8uI6j+TFPzySuMgt9e7HSbuSN
 ob2P3xCr2Ubl5otv4j+U3f/aHMzULlDpw6KLlTNSKeyfgtS2H6So2C5wA
 zSOm4lBhSFdt1QaSobx1AN4X4wbPKWOakYY2U6/6O70T/7PZBfC2vIzL0
 ZvvesMXPGk+C3cfQRomZrF1savjjmt1AgXGYKJGFVVjtiBCLf4fK4isP4
 cOiKlQSixLUTXnw0lqIBCu8J9B4ZXO/1qwuvysuYdRsHk/hEf4DOXQzUK
 uUuMR/Bx7aAnMYfvhvfdKmFXr6Zu+JL2nn4CqYkrGqwqzsSOeaOFK9gAx Q==;
X-CSE-ConnectionGUID: FCcWCZX+Q1Osf+s9giuC0g==
X-CSE-MsgGUID: nRPgiHDBRGudZYlHnPxTMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73029225"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="73029225"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 02:04:24 -0800
X-CSE-ConnectionGUID: a4mzfYOhQV6EmOYhAA+ZnQ==
X-CSE-MsgGUID: RvSt7FMPQMKFvgTyPyKpvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="214518009"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
 by fmviesa010.fm.intel.com with ESMTP; 26 Feb 2026 02:04:22 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vvYEF-000000008xR-2ACp;
 Thu, 26 Feb 2026 10:04:19 +0000
Date: Thu, 26 Feb 2026 18:03:26 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 0879c3f04f67e2a1677c25dcc24669ce21eb6a6c
Message-ID: <202602261818.UkFelSyJ-lkp@intel.com>
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
branch HEAD: 0879c3f04f67e2a1677c25dcc24669ce21eb6a6c  drm/xe/sync: Fix user fence leak on alloc failure

elapsed time: 759m

configs tested: 227
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                         haps_hs_defconfig    gcc-15.2.0
arc                   randconfig-001-20260226    gcc-15.2.0
arc                   randconfig-002-20260226    gcc-15.2.0
arc                   randconfig-002-20260226    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                       aspeed_g4_defconfig    gcc-15.2.0
arm                       aspeed_g5_defconfig    gcc-15.2.0
arm                         at91_dt_defconfig    clang-23
arm                         axm55xx_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                        multi_v5_defconfig    gcc-15.2.0
arm                         mv78xx0_defconfig    clang-23
arm                        mvebu_v5_defconfig    clang-23
arm                          pxa3xx_defconfig    gcc-15.2.0
arm                   randconfig-001-20260226    gcc-10.5.0
arm                   randconfig-001-20260226    gcc-15.2.0
arm                   randconfig-002-20260226    gcc-11.5.0
arm                   randconfig-002-20260226    gcc-15.2.0
arm                   randconfig-003-20260226    gcc-10.5.0
arm                   randconfig-003-20260226    gcc-15.2.0
arm                   randconfig-004-20260226    clang-16
arm                   randconfig-004-20260226    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260226    gcc-14.3.0
arm64                 randconfig-002-20260226    gcc-14.3.0
arm64                 randconfig-003-20260226    gcc-14.3.0
arm64                 randconfig-004-20260226    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260226    gcc-14.3.0
csky                  randconfig-002-20260226    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260226    clang-23
hexagon               randconfig-002-20260226    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260226    gcc-14
i386        buildonly-randconfig-002-20260226    gcc-14
i386        buildonly-randconfig-003-20260226    gcc-14
i386        buildonly-randconfig-004-20260226    gcc-14
i386        buildonly-randconfig-005-20260226    gcc-14
i386        buildonly-randconfig-006-20260226    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260226    clang-20
i386                  randconfig-002-20260226    clang-20
i386                  randconfig-003-20260226    clang-20
i386                  randconfig-004-20260226    clang-20
i386                  randconfig-005-20260226    clang-20
i386                  randconfig-006-20260226    clang-20
i386                  randconfig-007-20260226    clang-20
i386                  randconfig-011-20260226    clang-20
i386                  randconfig-011-20260226    gcc-14
i386                  randconfig-012-20260226    clang-20
i386                  randconfig-012-20260226    gcc-14
i386                  randconfig-013-20260226    gcc-12
i386                  randconfig-013-20260226    gcc-14
i386                  randconfig-014-20260226    gcc-14
i386                  randconfig-015-20260226    gcc-14
i386                  randconfig-016-20260226    clang-20
i386                  randconfig-016-20260226    gcc-14
i386                  randconfig-017-20260226    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260226    clang-23
loongarch             randconfig-002-20260226    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                       m5249evb_defconfig    gcc-15.2.0
m68k                          multi_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                        bcm47xx_defconfig    gcc-15.2.0
mips                          eyeq6_defconfig    gcc-15.2.0
mips                           gcw0_defconfig    clang-23
mips                        maltaup_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260226    clang-23
nios2                 randconfig-002-20260226    clang-23
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260226    clang-16
parisc                randconfig-001-20260226    gcc-14.3.0
parisc                randconfig-002-20260226    clang-16
parisc                randconfig-002-20260226    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                        icon_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260226    clang-16
powerpc               randconfig-001-20260226    gcc-11.5.0
powerpc               randconfig-002-20260226    clang-16
powerpc                     sequoia_defconfig    clang-23
powerpc                 xes_mpc85xx_defconfig    clang-23
powerpc64             randconfig-001-20260226    clang-16
powerpc64             randconfig-001-20260226    gcc-8.5.0
powerpc64             randconfig-002-20260226    clang-16
powerpc64             randconfig-002-20260226    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                        sh7785lcr_defconfig    gcc-15.2.0
sh                             shx3_defconfig    clang-23
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260226    gcc-8.5.0
sparc                 randconfig-002-20260226    gcc-8.5.0
sparc                       sparc64_defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260226    gcc-8.5.0
sparc64               randconfig-002-20260226    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260226    gcc-8.5.0
um                    randconfig-002-20260226    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260226    gcc-14
x86_64      buildonly-randconfig-002-20260226    gcc-14
x86_64      buildonly-randconfig-003-20260226    gcc-14
x86_64      buildonly-randconfig-004-20260226    gcc-14
x86_64      buildonly-randconfig-005-20260226    gcc-14
x86_64      buildonly-randconfig-006-20260226    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260226    gcc-14
x86_64                randconfig-002-20260226    gcc-14
x86_64                randconfig-003-20260226    gcc-14
x86_64                randconfig-004-20260226    gcc-14
x86_64                randconfig-005-20260226    gcc-14
x86_64                randconfig-006-20260226    gcc-14
x86_64                randconfig-011-20260226    clang-20
x86_64                randconfig-011-20260226    gcc-14
x86_64                randconfig-012-20260226    clang-20
x86_64                randconfig-012-20260226    gcc-14
x86_64                randconfig-013-20260226    clang-20
x86_64                randconfig-013-20260226    gcc-14
x86_64                randconfig-014-20260226    clang-20
x86_64                randconfig-014-20260226    gcc-14
x86_64                randconfig-015-20260226    clang-20
x86_64                randconfig-015-20260226    gcc-14
x86_64                randconfig-016-20260226    gcc-14
x86_64                randconfig-071-20260226    gcc-14
x86_64                randconfig-072-20260226    gcc-14
x86_64                randconfig-073-20260226    gcc-14
x86_64                randconfig-074-20260226    gcc-14
x86_64                randconfig-075-20260226    gcc-14
x86_64                randconfig-076-20260226    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                       common_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260226    gcc-8.5.0
xtensa                randconfig-002-20260226    gcc-8.5.0
xtensa                    smp_lx200_defconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
