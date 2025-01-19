Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C525BC02187
	for <intel-xe@archiver.kernel.org>; Sun, 19 Jan 2025 17:55:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D37810E0A2;
	Sun, 19 Jan 2025 17:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GkAxJDjJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7B510E0A2
 for <intel-xe@lists.freedesktop.org>; Sun, 19 Jan 2025 17:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737309351; x=1768845351;
 h=date:from:to:cc:subject:message-id;
 bh=WI6CcbQicLyHoqXIGTqPVeZBoth/uKo0Wp0JKQwPV6s=;
 b=GkAxJDjJbNQxZ5OT7aQFO7C2eAL6mz1ymackglgPjujasMFo7JnNqkYB
 DqpZr9ngPLG/UQzwfeUzYZAQ69orZV1AJR1pVYYGz9t33YejV/hOLxjr9
 9/YkwxSHF7+Xf0ujXRNyAHEUUOlbmyN5f9LwHVY6OjlmCQJ7i0k1krO3c
 qDvDrONK0D3kH5oiL6zAYFzyWs4k9ABDt8MDXx2LrYSS28M6zwFz2Atue
 mdp6m/EeJ0poHypcPjahe/sEsiGSknxhWGb9wUgZ9Bv/ZXJgrygd2wrUN
 vJaA9pMEdi8O0uM7eRjJjihXYfa4z16zib5yDgTf3briCiac+iBqb84V+ g==;
X-CSE-ConnectionGUID: 8+nt+Q/3T4aLetveoGi3TA==
X-CSE-MsgGUID: vYbvi8waS5yljRjF7OeQgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="41603286"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; d="scan'208";a="41603286"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 09:55:51 -0800
X-CSE-ConnectionGUID: j3NSQ+t+ScyFZjG9PTfPLg==
X-CSE-MsgGUID: j6Whuk3SSnKm6sqjVruMFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107157379"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 19 Jan 2025 09:55:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tZZWV-000VgR-2U;
 Sun, 19 Jan 2025 17:55:47 +0000
Date: Mon, 20 Jan 2025 01:54:54 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 173baa1b2dc44e3551d9414f4919a48fe5da4880
Message-ID: <202501200148.PjXwEpu8-lkp@intel.com>
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
branch HEAD: 173baa1b2dc44e3551d9414f4919a48fe5da4880  drm/xe: Suppress printing of mode when running in non-sriov mode

elapsed time: 1015m

configs tested: 121
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                         haps_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20250119    gcc-13.2.0
arc                   randconfig-002-20250119    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g4_defconfig    clang-20
arm                           h3600_defconfig    gcc-14.2.0
arm                   randconfig-001-20250119    gcc-14.2.0
arm                   randconfig-002-20250119    clang-20
arm                   randconfig-003-20250119    clang-16
arm                   randconfig-004-20250119    gcc-14.2.0
arm                       spear13xx_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250119    clang-20
arm64                 randconfig-002-20250119    clang-20
arm64                 randconfig-003-20250119    gcc-14.2.0
arm64                 randconfig-004-20250119    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250119    gcc-14.2.0
csky                  randconfig-002-20250119    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250119    clang-20
hexagon               randconfig-002-20250119    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250119    clang-19
i386        buildonly-randconfig-002-20250119    gcc-12
i386        buildonly-randconfig-003-20250119    gcc-12
i386        buildonly-randconfig-004-20250119    gcc-12
i386        buildonly-randconfig-005-20250119    clang-19
i386        buildonly-randconfig-006-20250119    gcc-12
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250119    gcc-14.2.0
loongarch             randconfig-002-20250119    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-16
mips                           ip22_defconfig    gcc-14.2.0
nios2                         10m50_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250119    gcc-14.2.0
nios2                 randconfig-002-20250119    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                 simple_smp_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250119    gcc-14.2.0
parisc                randconfig-002-20250119    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250119    clang-20
powerpc               randconfig-002-20250119    clang-20
powerpc               randconfig-003-20250119    clang-16
powerpc64                        alldefconfig    clang-20
powerpc64             randconfig-001-20250119    clang-18
powerpc64             randconfig-002-20250119    clang-16
powerpc64             randconfig-003-20250119    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250119    gcc-14.2.0
riscv                 randconfig-002-20250119    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250119    clang-20
s390                  randconfig-002-20250119    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                    randconfig-001-20250119    gcc-14.2.0
sh                    randconfig-002-20250119    gcc-14.2.0
sh                   sh7770_generic_defconfig    gcc-14.2.0
sh                            shmin_defconfig    gcc-14.2.0
sparc                            alldefconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250119    gcc-14.2.0
sparc                 randconfig-002-20250119    gcc-14.2.0
sparc64               randconfig-001-20250119    gcc-14.2.0
sparc64               randconfig-002-20250119    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250119    clang-18
um                    randconfig-002-20250119    clang-16
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250119    clang-19
x86_64      buildonly-randconfig-002-20250119    gcc-12
x86_64      buildonly-randconfig-003-20250119    gcc-12
x86_64      buildonly-randconfig-004-20250119    clang-19
x86_64      buildonly-randconfig-005-20250119    gcc-12
x86_64      buildonly-randconfig-006-20250119    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250119    gcc-14.2.0
xtensa                randconfig-002-20250119    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
