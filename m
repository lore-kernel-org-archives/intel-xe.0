Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52917E7AD52
	for <intel-xe@archiver.kernel.org>; Thu, 25 Dec 2025 15:03:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30EC12A8D0;
	Thu, 25 Dec 2025 15:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l5Y/u6gJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB6D12A8D0
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Dec 2025 15:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766675021; x=1798211021;
 h=date:from:to:cc:subject:message-id;
 bh=L5uo1hWHOLEohBsD8+8uuRdKQIUGtxr+rx7rJkzkKkg=;
 b=l5Y/u6gJRdynbkzMvhYErS6+4WblPfw6ddur7yOvxEglrD+/NRtU4qli
 ly0+2Gp7iU/r9/nLa4f1TW++4IQp+fdbEFwpFSbDxkwJ+60SdpvD2Gj06
 vddLdj6MsLIMdx1EnzFRp5YLqjo+zXmXL8dPlIkTl9tlnBU5nEpXPSsyR
 S46Z/bgOz6hTolKucL3jJN5qYwzoARihgbFwiYIdR4rKpi1E7+KO62QhD
 yK7qe+NEBzGfl1eh086jW0qZlhdCYsB9fNPW3EjzVtRftWwLnO7CKONU7
 ruTup6Gli2q9uLEau01iFiiWXq9NOsRYU5g8LjTF30f1RKBsKkSqpGyxz w==;
X-CSE-ConnectionGUID: FE+q0cfCSFyOM4K4D/Qrew==
X-CSE-MsgGUID: SUgF1hxNT0iABrg2EiO6Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="71051905"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; d="scan'208";a="71051905"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Dec 2025 07:03:40 -0800
X-CSE-ConnectionGUID: LjzrcnuHSmKZ24i25Rpw2g==
X-CSE-MsgGUID: Rq9vjaz8QMmzGeHLLEIEeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; d="scan'208";a="200715090"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
 by fmviesa009.fm.intel.com with ESMTP; 25 Dec 2025 07:03:39 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vYmsK-000000004BF-483K;
 Thu, 25 Dec 2025 15:03:36 +0000
Date: Thu, 25 Dec 2025 23:03:18 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 0b075f82935e82fc9fff90d06d2a161caaebd9c3
Message-ID: <202512252314.RoFD8b97-lkp@intel.com>
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
branch HEAD: 0b075f82935e82fc9fff90d06d2a161caaebd9c3  drm/xe: Improve rebar log messages

elapsed time: 1315m

configs tested: 208
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251225    gcc-11.5.0
arc                   randconfig-002-20251225    gcc-11.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                   randconfig-001-20251225    clang-22
arm                   randconfig-001-20251225    gcc-11.5.0
arm                   randconfig-002-20251225    gcc-11.5.0
arm                   randconfig-002-20251225    gcc-12.5.0
arm                   randconfig-003-20251225    clang-22
arm                   randconfig-003-20251225    gcc-11.5.0
arm                   randconfig-004-20251225    clang-22
arm                   randconfig-004-20251225    gcc-11.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251225    clang-18
arm64                 randconfig-002-20251225    gcc-12.5.0
arm64                 randconfig-003-20251225    clang-22
arm64                 randconfig-004-20251225    clang-22
csky                             alldefconfig    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251225    gcc-15.1.0
csky                  randconfig-002-20251225    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251225    clang-22
hexagon               randconfig-002-20251225    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251225    clang-20
i386        buildonly-randconfig-002-20251225    clang-20
i386        buildonly-randconfig-003-20251225    gcc-14
i386        buildonly-randconfig-004-20251225    clang-20
i386        buildonly-randconfig-005-20251225    clang-20
i386        buildonly-randconfig-006-20251225    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251225    gcc-14
i386                  randconfig-002-20251225    clang-20
i386                  randconfig-003-20251225    clang-20
i386                  randconfig-004-20251225    clang-20
i386                  randconfig-005-20251225    clang-20
i386                  randconfig-006-20251225    clang-20
i386                  randconfig-007-20251225    clang-20
i386                  randconfig-011-20251225    clang-20
i386                  randconfig-012-20251225    gcc-14
i386                  randconfig-013-20251225    gcc-14
i386                  randconfig-014-20251225    clang-20
i386                  randconfig-015-20251225    gcc-14
i386                  randconfig-016-20251225    clang-20
i386                  randconfig-017-20251225    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251225    clang-22
loongarch             randconfig-002-20251225    clang-22
loongarch             randconfig-002-20251225    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
m68k                          sun3x_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                          eyeq6_defconfig    clang-22
mips                           ip28_defconfig    gcc-15.1.0
mips                        maltaup_defconfig    clang-22
mips                        omega2p_defconfig    clang-22
mips                         rt305x_defconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251225    clang-22
nios2                 randconfig-001-20251225    gcc-9.5.0
nios2                 randconfig-002-20251225    clang-22
nios2                 randconfig-002-20251225    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251225    clang-22
parisc                randconfig-001-20251225    gcc-12.5.0
parisc                randconfig-002-20251225    clang-22
parisc                randconfig-002-20251225    gcc-14.3.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.1.0
powerpc                     akebono_defconfig    clang-22
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      ppc44x_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251225    clang-22
powerpc               randconfig-002-20251225    clang-22
powerpc                     redwood_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251225    clang-22
powerpc64             randconfig-001-20251225    gcc-8.5.0
powerpc64             randconfig-002-20251225    clang-22
powerpc64             randconfig-002-20251225    gcc-13.4.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251225    clang-22
riscv                 randconfig-002-20251225    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251225    gcc-14.3.0
s390                  randconfig-002-20251225    clang-19
s390                       zfcpdump_defconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                            hp6xx_defconfig    gcc-15.1.0
sh                    randconfig-001-20251225    gcc-15.1.0
sh                    randconfig-002-20251225    gcc-9.5.0
sh                           se7721_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251225    gcc-13
sparc                 randconfig-001-20251225    gcc-8.5.0
sparc                 randconfig-002-20251225    gcc-13
sparc                 randconfig-002-20251225    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251225    gcc-13
sparc64               randconfig-001-20251225    gcc-9.5.0
sparc64               randconfig-002-20251225    clang-20
sparc64               randconfig-002-20251225    gcc-13
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251225    gcc-13
um                    randconfig-002-20251225    gcc-13
um                    randconfig-002-20251225    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251225    clang-20
x86_64      buildonly-randconfig-002-20251225    clang-20
x86_64      buildonly-randconfig-003-20251225    gcc-14
x86_64      buildonly-randconfig-004-20251225    clang-20
x86_64      buildonly-randconfig-005-20251225    gcc-14
x86_64      buildonly-randconfig-006-20251225    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251225    gcc-12
x86_64                randconfig-002-20251225    clang-20
x86_64                randconfig-003-20251225    gcc-12
x86_64                randconfig-004-20251225    clang-20
x86_64                randconfig-005-20251225    gcc-14
x86_64                randconfig-006-20251225    gcc-14
x86_64                randconfig-011-20251225    gcc-13
x86_64                randconfig-012-20251225    gcc-14
x86_64                randconfig-013-20251225    clang-20
x86_64                randconfig-014-20251225    clang-20
x86_64                randconfig-015-20251225    gcc-14
x86_64                randconfig-016-20251225    clang-20
x86_64                randconfig-071-20251225    clang-20
x86_64                randconfig-072-20251225    clang-20
x86_64                randconfig-073-20251225    gcc-14
x86_64                randconfig-074-20251225    clang-20
x86_64                randconfig-075-20251225    gcc-14
x86_64                randconfig-076-20251225    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251225    gcc-13
xtensa                randconfig-001-20251225    gcc-8.5.0
xtensa                randconfig-002-20251225    gcc-10.5.0
xtensa                randconfig-002-20251225    gcc-13
xtensa                         virt_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
