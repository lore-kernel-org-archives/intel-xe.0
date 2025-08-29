Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09142CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 14:49:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3ED210EBE9;
	Fri, 29 Aug 2025 14:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qb8rYM3O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E83D10EBE9
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 14:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756478991; x=1788014991;
 h=date:from:to:cc:subject:message-id;
 bh=EOvu9sNN52FgnBIG/4p28yktIp2MTmkwgaYkKNHNKAc=;
 b=Qb8rYM3OI/e24a0hbLyZ3GYZmPIIp8EH8jVr233Q70MgcDc4S6Xhe3nN
 wPnHWcUVrBVf5V/ivw+cAvOHVpZTktOPbdYiRz5U3wbIP6zSqx6UeFpfg
 XwNxYPGI9JaNX8/5qtpZn4HCIl1Q4vx1OBXA4x/65647AQTiHbxU5reac
 5qRMG9eFXQLIvzW3BsIjBcHGqAqiQG3AhhlkIyeF1PQ5o1jWwtjRVrIw1
 xEdate6N3BfD+sytR03EJWqNZHTgcGI5tdWEKmrtoH25Pecx564eRtXVr
 cq6wjTbMHJ4+cZBaBpR0bKgR8gl4hEceDtmm2XigvIjoKx3fW/r3vzBsl A==;
X-CSE-ConnectionGUID: 4jQFbQeFQJyN6Q1vyNoFZQ==
X-CSE-MsgGUID: oHUz4IEDTi+E6uQTWYNrxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58694914"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58694914"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 07:49:50 -0700
X-CSE-ConnectionGUID: cfsfXmFLTIuL/R+hX99nYA==
X-CSE-MsgGUID: zQ09IedhSImpwVQksMNIwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169923971"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by fmviesa007.fm.intel.com with ESMTP; 29 Aug 2025 07:49:50 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1us0QF-000UhH-1R;
 Fri, 29 Aug 2025 14:49:47 +0000
Date: Fri, 29 Aug 2025 22:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 eeb8117f5f1c2e8e625e5cb39dbccd21d395caad
Message-ID: <202508292200.QEZKNS1M-lkp@intel.com>
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
branch HEAD: eeb8117f5f1c2e8e625e5cb39dbccd21d395caad  drm/xe/uapi: Fix kernel-doc formatting for madvise and vma_query

elapsed time: 1453m

configs tested: 123
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250829    gcc-8.5.0
arc                   randconfig-002-20250829    gcc-10.5.0
arm                               allnoconfig    clang-22
arm                         bcm2835_defconfig    clang-22
arm                       imx_v4_v5_defconfig    clang-22
arm                   randconfig-001-20250829    gcc-10.5.0
arm                   randconfig-002-20250829    clang-22
arm                   randconfig-003-20250829    clang-22
arm                   randconfig-004-20250829    clang-22
arm                        spear6xx_defconfig    clang-22
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250829    clang-22
arm64                 randconfig-002-20250829    gcc-12.5.0
arm64                 randconfig-003-20250829    clang-22
arm64                 randconfig-004-20250829    gcc-9.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250829    gcc-9.5.0
csky                  randconfig-002-20250829    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250829    clang-22
hexagon               randconfig-002-20250829    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250829    gcc-12
i386        buildonly-randconfig-002-20250829    clang-20
i386        buildonly-randconfig-003-20250829    clang-20
i386        buildonly-randconfig-004-20250829    clang-20
i386        buildonly-randconfig-005-20250829    gcc-12
i386        buildonly-randconfig-006-20250829    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250829    clang-22
loongarch             randconfig-002-20250829    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          rb532_defconfig    clang-18
nios2                         3c120_defconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250829    gcc-11.5.0
nios2                 randconfig-002-20250829    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250829    gcc-14.3.0
parisc                randconfig-002-20250829    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250829    gcc-13.4.0
powerpc               randconfig-002-20250829    clang-22
powerpc               randconfig-003-20250829    gcc-12.5.0
powerpc64             randconfig-001-20250829    clang-22
powerpc64             randconfig-002-20250829    clang-22
powerpc64             randconfig-003-20250829    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250829    clang-22
riscv                 randconfig-002-20250829    gcc-9.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250829    gcc-11.5.0
s390                  randconfig-002-20250829    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250829    gcc-10.5.0
sh                    randconfig-002-20250829    gcc-15.1.0
sh                           se7721_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250829    gcc-15.1.0
sparc                 randconfig-002-20250829    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250829    clang-20
sparc64               randconfig-002-20250829    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-002-20250829    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250829    gcc-11
x86_64      buildonly-randconfig-002-20250829    gcc-11
x86_64      buildonly-randconfig-003-20250829    gcc-12
x86_64      buildonly-randconfig-004-20250829    clang-20
x86_64      buildonly-randconfig-005-20250829    clang-20
x86_64      buildonly-randconfig-006-20250829    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250829    gcc-11.5.0
xtensa                randconfig-002-20250829    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
