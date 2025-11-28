Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCA8D116EA
	for <intel-xe@archiver.kernel.org>; Fri, 28 Nov 2025 21:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E920310E946;
	Fri, 28 Nov 2025 21:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TZCfHnhy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324C610E946
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Nov 2025 21:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764364657; x=1795900657;
 h=date:from:to:cc:subject:message-id;
 bh=RhAoqP34vUHKhyyAUQNW4ooaPg11U97GfQ6mgJXaO0Q=;
 b=TZCfHnhye943xArJbYY/D9dYwC5w/FTXmETaSaYZDSpU4iE7NTGMWBWt
 myJQ8wCZIN9J4X4helI/7Jv/4d6d3HN8Tzf5gLmNW8Czl1GE3PmP86rw/
 N1A6zieC2V/BdaYSjCBopOTWy6PyxttII0tzg5GI2WQ/qFdTs4nTuRos6
 p9oPnk5nHSueoj43qihIQah4mDXqV/i5EU7+Ml2gfiYcQOLpvs8FpnX6d
 TqoK081P3ulcASqdbEcGJrHVOD51IkIZOz/o2LdN2q9tX8tvPQk5xi4Pq
 GXq7bCQfSRsznvG+403WnlPE8BY3wWtL/pgvV1uMYYXdmsaFcfoGgNwEj Q==;
X-CSE-ConnectionGUID: Fppq1HogR/eDcjbCqfwDDw==
X-CSE-MsgGUID: /kKD4tr/RZ+t1sOHuDcdWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="70259422"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="70259422"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 13:17:36 -0800
X-CSE-ConnectionGUID: mU3TzeiJS+ekGOiJhGMTAQ==
X-CSE-MsgGUID: uzbQlIkDS/mtLnBYmD0aWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="197868822"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 28 Nov 2025 13:17:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vP5qP-000000006lN-2Sdk;
 Fri, 28 Nov 2025 21:17:33 +0000
Date: Sat, 29 Nov 2025 05:16:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 43fb9e113bf11d78e7c817e2696705f458753c79
Message-ID: <202511290529.dKfx29eZ-lkp@intel.com>
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
branch HEAD: 43fb9e113bf11d78e7c817e2696705f458753c79  drm/xe/gt: Introduce runtime suspend/resume

elapsed time: 1467m

configs tested: 149
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251128    gcc-8.5.0
arc                   randconfig-002-20251128    gcc-15.1.0
arc                   randconfig-002-20251128    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                        mvebu_v5_defconfig    gcc-15.1.0
arm                   randconfig-001-20251128    gcc-14.3.0
arm                   randconfig-001-20251128    gcc-8.5.0
arm                   randconfig-002-20251128    gcc-8.5.0
arm                   randconfig-003-20251128    clang-22
arm                   randconfig-003-20251128    gcc-8.5.0
arm                   randconfig-004-20251128    clang-17
arm                   randconfig-004-20251128    gcc-8.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251128    gcc-15.1.0
arm64                 randconfig-002-20251128    gcc-15.1.0
arm64                 randconfig-003-20251128    gcc-15.1.0
arm64                 randconfig-004-20251128    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251128    gcc-15.1.0
csky                  randconfig-002-20251128    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251128    clang-22
hexagon               randconfig-002-20251128    clang-22
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386        buildonly-randconfig-001-20251128    gcc-13
i386        buildonly-randconfig-002-20251128    gcc-13
i386        buildonly-randconfig-003-20251128    gcc-13
i386        buildonly-randconfig-004-20251128    gcc-13
i386        buildonly-randconfig-005-20251128    gcc-13
i386        buildonly-randconfig-006-20251128    gcc-13
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251128    gcc-14
i386                  randconfig-002-20251128    gcc-14
i386                  randconfig-003-20251128    gcc-14
i386                  randconfig-004-20251128    gcc-14
i386                  randconfig-005-20251128    gcc-14
i386                  randconfig-006-20251128    gcc-14
i386                  randconfig-007-20251128    gcc-14
i386                  randconfig-011-20251128    gcc-14
i386                  randconfig-012-20251128    gcc-14
i386                  randconfig-013-20251128    gcc-14
i386                  randconfig-014-20251128    gcc-14
i386                  randconfig-015-20251128    gcc-14
i386                  randconfig-016-20251128    gcc-14
i386                  randconfig-017-20251128    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251128    clang-22
loongarch             randconfig-002-20251128    clang-22
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                              allnoconfig    gcc-15.1.0
mips                        bcm47xx_defconfig    gcc-15.1.0
mips                        omega2p_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251128    clang-22
nios2                 randconfig-002-20251128    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251128    clang-22
parisc                randconfig-002-20251128    clang-22
parisc64                            defconfig    clang-19
powerpc                           allnoconfig    gcc-15.1.0
powerpc                       ppc64_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251128    clang-22
powerpc               randconfig-002-20251128    clang-22
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251128    clang-22
powerpc64             randconfig-002-20251128    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251128    gcc-15.1.0
riscv                 randconfig-002-20251128    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251128    gcc-15.1.0
s390                  randconfig-002-20251128    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251128    gcc-15.1.0
sh                    randconfig-002-20251128    gcc-15.1.0
sh                          rsk7201_defconfig    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251128    clang-22
sparc                 randconfig-002-20251128    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251128    clang-22
sparc64               randconfig-002-20251128    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251128    clang-22
um                    randconfig-002-20251128    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251128    clang-20
x86_64      buildonly-randconfig-002-20251128    clang-20
x86_64      buildonly-randconfig-003-20251128    clang-20
x86_64      buildonly-randconfig-004-20251128    clang-20
x86_64      buildonly-randconfig-005-20251128    clang-20
x86_64      buildonly-randconfig-006-20251128    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251128    gcc-14
x86_64                randconfig-002-20251128    gcc-14
x86_64                randconfig-003-20251128    gcc-14
x86_64                randconfig-004-20251128    gcc-14
x86_64                randconfig-005-20251128    gcc-14
x86_64                randconfig-006-20251128    gcc-14
x86_64                randconfig-011-20251128    gcc-13
x86_64                randconfig-012-20251128    gcc-13
x86_64                randconfig-013-20251128    gcc-13
x86_64                randconfig-014-20251128    gcc-13
x86_64                randconfig-015-20251128    gcc-13
x86_64                randconfig-016-20251128    gcc-13
x86_64                randconfig-071-20251128    gcc-14
x86_64                randconfig-072-20251128    gcc-14
x86_64                randconfig-073-20251128    gcc-14
x86_64                randconfig-074-20251128    gcc-14
x86_64                randconfig-075-20251128    gcc-14
x86_64                randconfig-076-20251128    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251128    clang-22
xtensa                randconfig-002-20251128    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
