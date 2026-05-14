Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC29CD4851
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 06:35:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F193210E183;
	Thu, 14 May 2026 06:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GUVMy6UF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAB510E183
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 06:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778740546; x=1810276546;
 h=date:from:to:cc:subject:message-id;
 bh=bE4Qzq2zy++UoFFft49w2O/tRhwMpJIBe9LZ9yfDH/4=;
 b=GUVMy6UFLH5nnOLXMamGmf6QJlsKTgdFxx0fKfumO8mZHNgC4jegAIJ5
 ROS0L6XXdOtOqSiyoe3bQwrBAsFORHnj/r7y09DCqkVrha0OjkdalJQzN
 e8/Qi4GepeN0a/47vhfpJ/4vQr5piwVGb59e4Be7Ib+xFK0CZTYdYfJYd
 MFqLjLhdgNMdhscb89yUU2ZOi196MgZn6aBZEOAnaG+JKzGcel7GPv7Bk
 o5uxa8nXMwd/z4oq+CTewu0Ub7ANbM+jEe5z20dxaE5n2J7spefFZC58m
 VomLfsLgBeF+bPqdCkySYHwASEV0z7LaEo6J9X9tnx36McLziWID0zv9i w==;
X-CSE-ConnectionGUID: PJtHIBAhRCOJ/uICGbexgw==
X-CSE-MsgGUID: GussoMXWQQqY7xE93MLCuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="83548217"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="83548217"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 23:35:46 -0700
X-CSE-ConnectionGUID: XdnHMv93S2mKj2Ul/IXkMA==
X-CSE-MsgGUID: K0bFYV4xR+qv97GFdS245g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="235653185"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 13 May 2026 23:35:44 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wNPfZ-000000005xj-4A1M;
 Thu, 14 May 2026 06:35:41 +0000
Date: Thu, 14 May 2026 14:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 8fb70afe671cc8c1f6237a39aabd50714fcd1189
Message-ID: <202605141414.K7hE5kDZ-lkp@intel.com>
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
branch HEAD: 8fb70afe671cc8c1f6237a39aabd50714fcd1189  drm/xe: Drop unused ggtt_balloon field

elapsed time: 758m

configs tested: 229
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
arc                                 defconfig    gcc-15.2.0
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260514    clang-23
arc                   randconfig-001-20260514    gcc-8.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260514    clang-23
arc                   randconfig-002-20260514    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                            randconfig-001    gcc-8.5.0
arm                   randconfig-001-20260514    clang-23
arm                   randconfig-001-20260514    gcc-8.5.0
arm                            randconfig-002    gcc-8.5.0
arm                   randconfig-002-20260514    clang-23
arm                   randconfig-002-20260514    gcc-8.5.0
arm                            randconfig-003    gcc-8.5.0
arm                   randconfig-003-20260514    clang-23
arm                   randconfig-003-20260514    gcc-8.5.0
arm                            randconfig-004    gcc-8.5.0
arm                   randconfig-004-20260514    clang-23
arm                   randconfig-004-20260514    gcc-8.5.0
arm                         vf610m4_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260514    clang-23
arm64                 randconfig-002-20260514    clang-23
arm64                 randconfig-003-20260514    clang-23
arm64                 randconfig-004-20260514    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260514    clang-23
csky                  randconfig-002-20260514    clang-23
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260514    gcc-10.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260514    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260514    gcc-14
i386                 buildonly-randconfig-002    gcc-14
i386        buildonly-randconfig-002-20260514    gcc-14
i386                 buildonly-randconfig-003    gcc-14
i386        buildonly-randconfig-003-20260514    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260514    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260514    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260514    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260514    clang-20
i386                  randconfig-002-20260514    clang-20
i386                  randconfig-003-20260514    clang-20
i386                  randconfig-004-20260514    clang-20
i386                  randconfig-005-20260514    clang-20
i386                  randconfig-006-20260514    clang-20
i386                  randconfig-007-20260514    clang-20
i386                  randconfig-011-20260514    clang-20
i386                  randconfig-012-20260514    clang-20
i386                  randconfig-013-20260514    clang-20
i386                  randconfig-014-20260514    clang-20
i386                  randconfig-015-20260514    clang-20
i386                  randconfig-016-20260514    clang-20
i386                  randconfig-017-20260514    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260514    gcc-10.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260514    gcc-10.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      maltasmvp_defconfig    gcc-15.2.0
mips                        qi_lb60_defconfig    clang-23
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260514    gcc-10.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260514    gcc-10.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    gcc-13.4.0
parisc                randconfig-001-20260514    gcc-13.4.0
parisc                         randconfig-002    gcc-13.4.0
parisc                randconfig-002-20260514    gcc-13.4.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                        randconfig-001    gcc-13.4.0
powerpc               randconfig-001-20260514    gcc-13.4.0
powerpc                        randconfig-002    gcc-13.4.0
powerpc               randconfig-002-20260514    gcc-13.4.0
powerpc                     tqm8541_defconfig    clang-23
powerpc64                      randconfig-001    gcc-13.4.0
powerpc64             randconfig-001-20260514    gcc-13.4.0
powerpc64                      randconfig-002    gcc-13.4.0
powerpc64             randconfig-002-20260514    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260514    gcc-14.3.0
riscv                 randconfig-002-20260514    gcc-14.3.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260514    gcc-14.3.0
s390                  randconfig-002-20260514    gcc-14.3.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260514    gcc-14.3.0
sh                    randconfig-002-20260514    gcc-14.3.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-15.2.0
sparc                 randconfig-001-20260514    gcc-15.2.0
sparc                          randconfig-002    gcc-15.2.0
sparc                 randconfig-002-20260514    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-15.2.0
sparc64               randconfig-001-20260514    gcc-15.2.0
sparc64                        randconfig-002    gcc-15.2.0
sparc64               randconfig-002-20260514    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-15.2.0
um                    randconfig-001-20260514    gcc-15.2.0
um                             randconfig-002    gcc-15.2.0
um                    randconfig-002-20260514    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64               buildonly-randconfig-001    clang-20
x86_64      buildonly-randconfig-001-20260514    clang-20
x86_64               buildonly-randconfig-002    clang-20
x86_64      buildonly-randconfig-002-20260514    clang-20
x86_64               buildonly-randconfig-003    clang-20
x86_64      buildonly-randconfig-003-20260514    clang-20
x86_64               buildonly-randconfig-004    clang-20
x86_64      buildonly-randconfig-004-20260514    clang-20
x86_64               buildonly-randconfig-005    clang-20
x86_64      buildonly-randconfig-005-20260514    clang-20
x86_64               buildonly-randconfig-006    clang-20
x86_64      buildonly-randconfig-006-20260514    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    gcc-14
x86_64                randconfig-001-20260514    gcc-14
x86_64                         randconfig-002    gcc-14
x86_64                randconfig-002-20260514    gcc-14
x86_64                         randconfig-003    gcc-14
x86_64                randconfig-003-20260514    gcc-14
x86_64                         randconfig-004    gcc-14
x86_64                randconfig-004-20260514    gcc-14
x86_64                         randconfig-005    gcc-14
x86_64                randconfig-005-20260514    gcc-14
x86_64                         randconfig-006    gcc-14
x86_64                randconfig-006-20260514    gcc-14
x86_64                randconfig-011-20260514    clang-20
x86_64                randconfig-012-20260514    clang-20
x86_64                randconfig-013-20260514    clang-20
x86_64                randconfig-014-20260514    clang-20
x86_64                randconfig-015-20260514    clang-20
x86_64                randconfig-016-20260514    clang-20
x86_64                randconfig-071-20260514    clang-20
x86_64                randconfig-072-20260514    clang-20
x86_64                randconfig-073-20260514    clang-20
x86_64                randconfig-074-20260514    clang-20
x86_64                randconfig-075-20260514    clang-20
x86_64                randconfig-076-20260514    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                         randconfig-001    gcc-15.2.0
xtensa                randconfig-001-20260514    gcc-15.2.0
xtensa                         randconfig-002    gcc-15.2.0
xtensa                randconfig-002-20260514    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
