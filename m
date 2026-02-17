Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3295EE83855
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 05:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D221B10E206;
	Tue, 17 Feb 2026 05:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdNkTevY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB51F10E206
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Feb 2026 05:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771305556; x=1802841556;
 h=date:from:to:cc:subject:message-id;
 bh=6a10KZXTEJVfZenPkBWi0LvPV7F4nXakDtvxNdY3yb8=;
 b=mdNkTevY68NqcFHJaEL8SklmyfH5HcVlYKEfV/qZVeu5OKZZWJE70iBx
 mtq8luL8sCP8VHqbpKnVdy2e27x1tqeqTAj2kmOoKt9dp5SA6v4MWr0ct
 Ql4YUvl7MJJyUMxRRYIeJ2SmKY//aVT29JfPZ4npwkxxP+wpdpt49z0dB
 +9TAyPJ42CqHW/2G3rK3ntiRcl1tD2CZYSE5bd0FkNKd68tfSLFiA1Oge
 zPFwXhoXWXlM01stbD/fJPCEjp4YT4yr4pZvoP3SfrcdE0bUcy5ypzGeu
 VRnuV0qacSf8kaY2IcQAWoRFHlk7e3RHK9TpFqei1fKwA5fcjmeAGN3XA g==;
X-CSE-ConnectionGUID: cvH2GTZfQnOmi+yjg5Lv4A==
X-CSE-MsgGUID: hASSaQXQQwayV+o92w/L5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72279374"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="72279374"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 21:19:16 -0800
X-CSE-ConnectionGUID: C7w+dfxcQ9eWk9G3Z/Xpmw==
X-CSE-MsgGUID: K+4UqghnSpmWHyTCAgb+TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="212868167"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 16 Feb 2026 21:19:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vsDUO-000000010dc-2fHe;
 Tue, 17 Feb 2026 05:19:12 +0000
Date: Tue, 17 Feb 2026 13:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 08d05c736605fb3dd3852a37c8bf20cd0fc2e08b
Message-ID: <202602171343.nYxs8gTx-lkp@intel.com>
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
branch HEAD: 08d05c736605fb3dd3852a37c8bf20cd0fc2e08b  drm/xe: Remove xe_ggtt_node_allocated

elapsed time: 901m

configs tested: 235
configs skipped: 6

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
arc                   randconfig-001-20260217    gcc-11.5.0
arc                   randconfig-001-20260217    gcc-8.5.0
arc                   randconfig-002-20260217    gcc-11.5.0
arc                   randconfig-002-20260217    gcc-9.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                          exynos_defconfig    clang-23
arm                   randconfig-001-20260217    gcc-11.5.0
arm                   randconfig-001-20260217    gcc-14.3.0
arm                   randconfig-002-20260217    gcc-11.5.0
arm                   randconfig-003-20260217    gcc-11.5.0
arm                   randconfig-003-20260217    gcc-8.5.0
arm                   randconfig-004-20260217    gcc-11.5.0
arm                   randconfig-004-20260217    gcc-13.4.0
arm                           u8500_defconfig    clang-23
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260217    clang-23
arm64                 randconfig-002-20260217    clang-23
arm64                 randconfig-003-20260217    clang-23
arm64                 randconfig-004-20260217    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260217    clang-23
csky                  randconfig-002-20260217    clang-23
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260217    clang-23
hexagon               randconfig-002-20260217    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260217    clang-20
i386        buildonly-randconfig-002-20260217    clang-20
i386        buildonly-randconfig-003-20260217    clang-20
i386        buildonly-randconfig-004-20260217    clang-20
i386        buildonly-randconfig-005-20260217    clang-20
i386        buildonly-randconfig-006-20260217    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260217    gcc-14
i386                  randconfig-002-20260217    gcc-14
i386                  randconfig-003-20260217    gcc-14
i386                  randconfig-004-20260217    gcc-14
i386                  randconfig-005-20260217    gcc-14
i386                  randconfig-006-20260217    gcc-14
i386                  randconfig-007-20260217    gcc-14
i386                  randconfig-011-20260217    clang-20
i386                  randconfig-012-20260217    clang-20
i386                  randconfig-013-20260217    clang-20
i386                  randconfig-014-20260217    clang-20
i386                  randconfig-015-20260217    clang-20
i386                  randconfig-016-20260217    clang-20
i386                  randconfig-017-20260217    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260217    clang-23
loongarch             randconfig-002-20260217    clang-23
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
mips                 decstation_r4k_defconfig    clang-23
mips                          eyeq6_defconfig    clang-23
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260217    clang-23
nios2                 randconfig-002-20260217    clang-23
openrisc                         alldefconfig    clang-23
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
parisc                randconfig-001-20260217    clang-19
parisc                randconfig-001-20260217    gcc-15.2.0
parisc                randconfig-002-20260217    clang-19
parisc                randconfig-002-20260217    gcc-14.3.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                       holly_defconfig    clang-23
powerpc                      pasemi_defconfig    clang-23
powerpc                      ppc6xx_defconfig    clang-23
powerpc               randconfig-001-20260217    clang-19
powerpc               randconfig-001-20260217    gcc-8.5.0
powerpc               randconfig-002-20260217    clang-19
powerpc                     stx_gp3_defconfig    clang-23
powerpc                     taishan_defconfig    clang-23
powerpc                         wii_defconfig    clang-23
powerpc                 xes_mpc85xx_defconfig    clang-23
powerpc64             randconfig-001-20260217    clang-19
powerpc64             randconfig-001-20260217    gcc-8.5.0
powerpc64             randconfig-002-20260217    clang-19
powerpc64             randconfig-002-20260217    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260217    gcc-10.5.0
riscv                 randconfig-002-20260217    gcc-10.5.0
riscv                 randconfig-002-20260217    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260217    clang-23
s390                  randconfig-001-20260217    gcc-10.5.0
s390                  randconfig-002-20260217    clang-23
s390                  randconfig-002-20260217    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260217    gcc-10.5.0
sh                    randconfig-001-20260217    gcc-15.2.0
sh                    randconfig-002-20260217    gcc-10.5.0
sh                           se7724_defconfig    clang-23
sh                        sh7763rdp_defconfig    clang-23
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260217    gcc-12.5.0
sparc                 randconfig-002-20260217    gcc-12.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260217    gcc-12.5.0
sparc64               randconfig-002-20260217    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260217    gcc-12.5.0
um                    randconfig-002-20260217    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260217    clang-20
x86_64      buildonly-randconfig-001-20260217    gcc-14
x86_64      buildonly-randconfig-002-20260217    gcc-14
x86_64      buildonly-randconfig-003-20260217    clang-20
x86_64      buildonly-randconfig-003-20260217    gcc-14
x86_64      buildonly-randconfig-004-20260217    gcc-14
x86_64      buildonly-randconfig-005-20260217    gcc-14
x86_64      buildonly-randconfig-006-20260217    clang-20
x86_64      buildonly-randconfig-006-20260217    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260217    clang-20
x86_64                randconfig-002-20260217    clang-20
x86_64                randconfig-003-20260217    clang-20
x86_64                randconfig-003-20260217    gcc-14
x86_64                randconfig-004-20260217    clang-20
x86_64                randconfig-005-20260217    clang-20
x86_64                randconfig-006-20260217    clang-20
x86_64                randconfig-006-20260217    gcc-14
x86_64                randconfig-011-20260216    clang-20
x86_64                randconfig-011-20260217    gcc-14
x86_64                randconfig-012-20260216    gcc-13
x86_64                randconfig-012-20260217    gcc-14
x86_64                randconfig-013-20260216    clang-20
x86_64                randconfig-013-20260217    gcc-14
x86_64                randconfig-014-20260216    clang-20
x86_64                randconfig-014-20260217    gcc-14
x86_64                randconfig-015-20260216    clang-20
x86_64                randconfig-015-20260217    gcc-14
x86_64                randconfig-016-20260216    gcc-14
x86_64                randconfig-016-20260217    gcc-14
x86_64                randconfig-071-20260217    clang-20
x86_64                randconfig-071-20260217    gcc-14
x86_64                randconfig-072-20260217    clang-20
x86_64                randconfig-072-20260217    gcc-14
x86_64                randconfig-073-20260217    clang-20
x86_64                randconfig-073-20260217    gcc-14
x86_64                randconfig-074-20260217    gcc-14
x86_64                randconfig-075-20260217    clang-20
x86_64                randconfig-075-20260217    gcc-14
x86_64                randconfig-076-20260217    clang-20
x86_64                randconfig-076-20260217    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260217    gcc-12.5.0
xtensa                randconfig-002-20260217    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
