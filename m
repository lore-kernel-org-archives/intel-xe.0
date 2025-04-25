Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D434C369D1
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 23:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E046B10E0C0;
	Fri, 25 Apr 2025 23:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A8yStHad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA5610E0C0
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Apr 2025 23:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745624113; x=1777160113;
 h=date:from:to:cc:subject:message-id;
 bh=tzcRu2O9RUz5S9+NysX8l6uhcO0FkYt/yoBiu9TLfx0=;
 b=A8yStHadY8/NnNBgsTjrSGrjqPcm1uXLrRS1TFeDbRRmkgV3/J5gm9nh
 maIrDhG5JhjQ7JGHMaDO1lWzfFh6Mf08t+E/EnY3O7aJS+6rPlKmr4v5N
 iIF4Yi3LnL8C6OSZAPUxF8Cj5jp/CTvklYhMT5rnm1gHEs3Hp0AyOHnZk
 8UAZyFS9CFD9h+glG2fEDV3rebFh5vctcGFz3LGj4uHo3U1tUG2nUrrqv
 jg9JyJoOywSap5y22MMpXdYDj8oywNyrM2bXG/IHupUXLCOiUmQ7ReRRR
 HmdLlU8qVpGGx5WgUIr53P2l0gnnvIivcD9Zz4mHoRtJVNIsncYFRRe8p g==;
X-CSE-ConnectionGUID: 4iPgvieUT0aMlDZbBIvh6w==
X-CSE-MsgGUID: +fc6CmMqR+mqdhf/1qGQ5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="72672159"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="72672159"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 16:35:09 -0700
X-CSE-ConnectionGUID: YKrjhDZNSV2JHkn5FOARmw==
X-CSE-MsgGUID: fH7G56OgQUyhAJKFTMrWGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="137846055"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 25 Apr 2025 16:35:08 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u8SZV-0005a1-1X;
 Fri, 25 Apr 2025 23:35:05 +0000
Date: Sat, 26 Apr 2025 07:34:16 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD REGRESSION
 238ae3be582070aedd91c75f07483fbb2a77fc45
Message-ID: <202504260705.110dcewB-lkp@intel.com>
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
branch HEAD: 238ae3be582070aedd91c75f07483fbb2a77fc45  drm/xe: Abort printing coredump in VM printer output if full

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202504251238.JsNgFeFc-lkp@intel.com

    xe_devcoredump.c:(.text+0x444): undefined reference to `__moddi3'

Error/Warning ids grouped by kconfigs:

recent_errors
`-- xtensa-randconfig-002-20250425
    `-- xe_devcoredump.c:(.text):undefined-reference-to-__moddi3

elapsed time: 1445m

configs tested: 109
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250425    gcc-14.2.0
arc                   randconfig-002-20250425    gcc-13.3.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250425    clang-21
arm                   randconfig-002-20250425    gcc-6.5.0
arm                   randconfig-003-20250425    clang-21
arm                   randconfig-004-20250425    gcc-6.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250425    clang-21
arm64                 randconfig-002-20250425    gcc-7.5.0
arm64                 randconfig-003-20250425    gcc-7.5.0
arm64                 randconfig-004-20250425    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250425    gcc-13.3.0
csky                  randconfig-002-20250425    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250425    clang-21
hexagon               randconfig-002-20250425    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250425    gcc-12
i386        buildonly-randconfig-002-20250425    gcc-12
i386        buildonly-randconfig-003-20250425    clang-20
i386        buildonly-randconfig-004-20250425    gcc-12
i386        buildonly-randconfig-005-20250425    gcc-12
i386        buildonly-randconfig-006-20250425    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250425    gcc-14.2.0
loongarch             randconfig-002-20250425    gcc-13.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                          rb532_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250425    gcc-5.5.0
nios2                 randconfig-002-20250425    gcc-13.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                       virt_defconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250425    gcc-10.5.0
parisc                randconfig-002-20250425    gcc-8.5.0
parisc64                         alldefconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                      arches_defconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    clang-21
powerpc               randconfig-001-20250425    clang-21
powerpc               randconfig-002-20250425    gcc-9.3.0
powerpc               randconfig-003-20250425    gcc-9.3.0
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc                     tqm8560_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250425    clang-21
powerpc64             randconfig-002-20250425    gcc-7.5.0
powerpc64             randconfig-003-20250425    gcc-10.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250425    gcc-14.2.0
riscv                 randconfig-002-20250425    clang-19
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250425    clang-17
s390                  randconfig-002-20250425    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                    randconfig-001-20250425    gcc-7.5.0
sh                    randconfig-002-20250425    gcc-9.3.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250425    gcc-8.5.0
sparc                 randconfig-002-20250425    gcc-14.2.0
sparc64               randconfig-001-20250425    gcc-10.5.0
sparc64               randconfig-002-20250425    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250425    clang-21
um                    randconfig-002-20250425    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250425    gcc-12
x86_64      buildonly-randconfig-002-20250425    clang-20
x86_64      buildonly-randconfig-003-20250425    gcc-12
x86_64      buildonly-randconfig-004-20250425    gcc-12
x86_64      buildonly-randconfig-005-20250425    clang-20
x86_64      buildonly-randconfig-006-20250425    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250425    gcc-6.5.0
xtensa                randconfig-002-20250425    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
