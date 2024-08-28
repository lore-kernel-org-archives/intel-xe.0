Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB23C5479A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 09:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4AA10E367;
	Wed, 28 Aug 2024 09:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OeSzVJQa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6AD10E367
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 09:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724839088; x=1756375088;
 h=date:from:to:cc:subject:message-id;
 bh=c7f+is7jvDCcSO3PDu8Laxnal9UW5MNpOjSysqaj30k=;
 b=OeSzVJQaGGxzTSAtL+acZ2hAXZbQxpD5ZYdeawu2oBQU88X51FYcp+UI
 snq7u1nSUornwg5ceRJhtK+whlDXe3p7TLvR4t0Y8g3eqkjv5FhLpUw6N
 ziho0dfnbx6YV7QpIcvXoFJyoNPxZDDszXwO5QN1BN5VoGRn8FMvf79IR
 Y4YzxcvBA0fdz8sw465c5Yzz2zYsKSrDHGHWGCDJEefAfPEiSaBWjHjod
 uo8IVQKUgv7YOcrcnYOTsZDAt40pirLRDgZEVlvMCvMWrePx0rXcl59o3
 sYUxEcu+qyZHpsh7eKzs+1NXK/E4DgZHFXqW8Xhwvg5NuO/NVu2No3ijL Q==;
X-CSE-ConnectionGUID: rcqcw/YeQxiWGZI65lufaw==
X-CSE-MsgGUID: yktOOJ8fRQS+yLIZzMBogw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="26257012"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="26257012"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 02:58:07 -0700
X-CSE-ConnectionGUID: FsfwOpeJTYy6Jmhd8I/lCA==
X-CSE-MsgGUID: pfUWO4weSnepbO7ENjGq1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="62829796"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 28 Aug 2024 02:58:06 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sjFRE-000Km6-29;
 Wed, 28 Aug 2024 09:58:04 +0000
Date: Wed, 28 Aug 2024 17:57:11 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 1eb52589a299f8b29df0f214206da6616e33a8b6
Message-ID: <202408281709.hKCApKzu-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: 1eb52589a299f8b29df0f214206da6616e33a8b6  drm/xe: Invalidate media_gt TLBs

elapsed time: 1220m

configs tested: 139
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                      footbridge_defconfig   gcc-13.2.0
arm                            mmp2_defconfig   gcc-13.2.0
arm                         s5pv210_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240828   gcc-12
i386         buildonly-randconfig-002-20240828   gcc-12
i386         buildonly-randconfig-003-20240828   gcc-12
i386         buildonly-randconfig-004-20240828   gcc-12
i386         buildonly-randconfig-005-20240828   gcc-12
i386         buildonly-randconfig-006-20240828   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240828   gcc-12
i386                  randconfig-002-20240828   gcc-12
i386                  randconfig-003-20240828   gcc-12
i386                  randconfig-004-20240828   gcc-12
i386                  randconfig-005-20240828   gcc-12
i386                  randconfig-006-20240828   gcc-12
i386                  randconfig-011-20240828   gcc-12
i386                  randconfig-012-20240828   gcc-12
i386                  randconfig-013-20240828   gcc-12
i386                  randconfig-014-20240828   gcc-12
i386                  randconfig-015-20240828   gcc-12
i386                  randconfig-016-20240828   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
microblaze                      mmu_defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                     cu1000-neo_defconfig   gcc-13.2.0
mips                      malta_kvm_defconfig   gcc-13.2.0
mips                      maltasmvp_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                    socrates_defconfig   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                         ecovec24_defconfig   gcc-13.2.0
sh                            migor_defconfig   gcc-13.2.0
sh                          rsk7203_defconfig   gcc-13.2.0
sh                           se7712_defconfig   gcc-13.2.0
sh                   secureedge5410_defconfig   gcc-13.2.0
sh                             shx3_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240828   clang-18
x86_64       buildonly-randconfig-002-20240828   clang-18
x86_64       buildonly-randconfig-003-20240828   clang-18
x86_64       buildonly-randconfig-004-20240828   clang-18
x86_64       buildonly-randconfig-005-20240828   clang-18
x86_64       buildonly-randconfig-006-20240828   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240828   clang-18
x86_64                randconfig-002-20240828   clang-18
x86_64                randconfig-003-20240828   clang-18
x86_64                randconfig-004-20240828   clang-18
x86_64                randconfig-005-20240828   clang-18
x86_64                randconfig-006-20240828   clang-18
x86_64                randconfig-011-20240828   clang-18
x86_64                randconfig-012-20240828   clang-18
x86_64                randconfig-013-20240828   clang-18
x86_64                randconfig-014-20240828   clang-18
x86_64                randconfig-015-20240828   clang-18
x86_64                randconfig-016-20240828   clang-18
x86_64                randconfig-071-20240828   clang-18
x86_64                randconfig-072-20240828   clang-18
x86_64                randconfig-073-20240828   clang-18
x86_64                randconfig-074-20240828   clang-18
x86_64                randconfig-075-20240828   clang-18
x86_64                randconfig-076-20240828   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
