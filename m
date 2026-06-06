Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D26BCD8C8E
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jun 2026 17:11:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDF510E7F4;
	Sat,  6 Jun 2026 17:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mz8WQZHS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF5610E7F4
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Jun 2026 17:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780765861; x=1812301861;
 h=date:from:to:cc:subject:message-id;
 bh=oWG76K+Nbb2cFPOj/DM3jeyMaqA1YujKs9XbC5Nws6Y=;
 b=Mz8WQZHS9m4ML8QfZvvSS8Nw7P4ChsHd0dlKkcH8XXQ+wXutJ5pQRMbw
 WZQZPJjsWuFf0SDO+RXR6EG5MsGv0SfWlUG1Mn/mvOYUb9xnnq3NYxmsC
 O5Wa9ZAqHh2aV+hd+TbTb4y4+hYy5NuGXDjMgzkeevFPNkwCK4GpN5GSJ
 kA54wCJr09FCK4ICcMa1hyJ1ef4yAN51hwB1hNFznq+oJI0Nav3vxfnqU
 LTZSWk2ihrwiJyrfOhkIpehlbIv3hQ5/5yJmPgVCXg7ER6+XPYFeqfbva
 mvOxrBwHHeqlijwLGB4GfPf4VIFQAL+x5m5CoxIHr+JwpC29iGPm6hKSL w==;
X-CSE-ConnectionGUID: kPpvnABERD+E8d3ETC1zhg==
X-CSE-MsgGUID: vuq48UPhQzqtaj3vu4q1wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="69098179"
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; d="scan'208";a="69098179"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2026 10:11:01 -0700
X-CSE-ConnectionGUID: WVT8DWS9RumtgTlyUYG+tg==
X-CSE-MsgGUID: w5sdhoK+TrCobK5+zUoLSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; d="scan'208";a="245160817"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 06 Jun 2026 10:10:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wVuXl-00000000HAs-1coh;
 Sat, 06 Jun 2026 17:10:45 +0000
Date: Sun, 07 Jun 2026 01:10:11 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 ec4cbdd163f9bb2a2bd44eb93ecf4a2fa0e912a9
Message-ID: <202606070102.iUrX8YGq-lkp@intel.com>
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
branch HEAD: ec4cbdd163f9bb2a2bd44eb93ecf4a2fa0e912a9  drm/xe/multi_queue: skip submit when primary queue is suspended

elapsed time: 2574m

configs tested: 175
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260605    gcc-8.5.0
arc                   randconfig-002-20260605    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260605    gcc-10.5.0
arm                   randconfig-002-20260605    gcc-13.4.0
arm                   randconfig-003-20260605    clang-23
arm                   randconfig-004-20260605    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260605    gcc-8.5.0
arm64                 randconfig-002-20260605    gcc-13.4.0
arm64                 randconfig-003-20260605    gcc-11.5.0
arm64                 randconfig-004-20260605    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260605    gcc-16.1.0
csky                  randconfig-002-20260605    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon                        randconfig-001    clang-23
hexagon               randconfig-001-20260605    clang-20
hexagon                        randconfig-002    clang-23
hexagon               randconfig-002-20260605    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260605    clang-20
i386        buildonly-randconfig-002-20260605    clang-20
i386        buildonly-randconfig-003-20260605    clang-20
i386        buildonly-randconfig-004-20260605    clang-20
i386        buildonly-randconfig-005-20260605    gcc-12
i386        buildonly-randconfig-006-20260605    gcc-14
i386                                defconfig    clang-22
i386                  randconfig-001-20260605    clang-20
i386                  randconfig-002-20260605    clang-20
i386                  randconfig-003-20260605    gcc-14
i386                  randconfig-004-20260605    gcc-14
i386                  randconfig-005-20260605    clang-20
i386                  randconfig-006-20260605    gcc-14
i386                  randconfig-007-20260605    clang-20
i386                  randconfig-011-20260605    clang-20
i386                  randconfig-012-20260605    clang-20
i386                  randconfig-013-20260605    clang-20
i386                  randconfig-014-20260605    clang-20
i386                  randconfig-015-20260605    clang-20
i386                  randconfig-016-20260605    clang-20
i386                  randconfig-017-20260605    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    clang-23
loongarch             randconfig-001-20260605    clang-18
loongarch                      randconfig-002    gcc-16.1.0
loongarch             randconfig-002-20260605    gcc-16.1.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260605    gcc-8.5.0
nios2                          randconfig-002    gcc-8.5.0
nios2                 randconfig-002-20260605    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                   de0_nano_defconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260605    gcc-8.5.0
parisc                randconfig-002-20260605    gcc-11.5.0
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260605    gcc-8.5.0
powerpc               randconfig-002-20260605    gcc-9.5.0
powerpc64             randconfig-001-20260605    clang-23
powerpc64             randconfig-002-20260605    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260605    gcc-8.5.0
riscv                 randconfig-002-20260605    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-18
s390                  randconfig-001-20260605    clang-23
s390                  randconfig-002-20260605    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-16.1.0
sh                    randconfig-001-20260605    gcc-16.1.0
sh                    randconfig-002-20260605    gcc-10.5.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260605    gcc-15.2.0
sparc                 randconfig-002-20260605    gcc-16.1.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-23
sparc64               randconfig-001-20260605    clang-23
sparc64               randconfig-002-20260605    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260605    clang-19
um                    randconfig-002-20260605    clang-23
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260605    gcc-14
x86_64      buildonly-randconfig-002-20260605    gcc-14
x86_64      buildonly-randconfig-003-20260605    gcc-14
x86_64      buildonly-randconfig-004-20260605    gcc-14
x86_64      buildonly-randconfig-005-20260605    gcc-14
x86_64      buildonly-randconfig-006-20260605    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260605    clang-20
x86_64                randconfig-002-20260605    clang-20
x86_64                randconfig-003-20260605    clang-20
x86_64                randconfig-004-20260605    gcc-13
x86_64                randconfig-005-20260605    clang-20
x86_64                randconfig-006-20260605    gcc-14
x86_64                randconfig-011-20260605    clang-20
x86_64                randconfig-012-20260605    gcc-14
x86_64                randconfig-013-20260605    clang-20
x86_64                randconfig-014-20260605    clang-20
x86_64                randconfig-015-20260605    gcc-14
x86_64                randconfig-016-20260605    clang-20
x86_64                         randconfig-071    gcc-14
x86_64                randconfig-071-20260605    gcc-14
x86_64                         randconfig-072    gcc-14
x86_64                randconfig-072-20260605    gcc-14
x86_64                         randconfig-073    clang-22
x86_64                randconfig-073-20260605    clang-22
x86_64                         randconfig-074    gcc-14
x86_64                randconfig-074-20260605    gcc-14
x86_64                         randconfig-075    gcc-13
x86_64                randconfig-075-20260605    gcc-12
x86_64                         randconfig-076    clang-22
x86_64                randconfig-076-20260605    gcc-14
x86_64                          rhel-9.4-rust    clang-20
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260605    gcc-8.5.0
xtensa                randconfig-002-20260605    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
