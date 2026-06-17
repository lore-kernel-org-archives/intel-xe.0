Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AD9CD98E2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 11:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C9210E9C4;
	Wed, 17 Jun 2026 11:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CBD98aYD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949D610E9C4
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 11:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781695237; x=1813231237;
 h=date:from:to:cc:subject:message-id;
 bh=88oGRXWc2ZqqaMvPuEu2Rw8b+6qJ0xMr6twOb0C2Ts0=;
 b=CBD98aYDMw+X2HrgZcp7ctyskKDBWClfPPNQli5Wx3/mwUWDDqcIZSMz
 75Ot6Nd0CdQvmryTMfvA3+GDBcRdmL5ZAkQqHeVygwl1dqEEl+3OAdjbm
 KndQfWLtXfbe6w3/OAu0mVBuS9E/+tL0z9qNhnLcX6CxtMKEN0YH4D/BE
 3PJcXukLQQPEndjDV345u+4U9LZV/YGLUQKvtvVKE9rmPklX54uIfz+zh
 CkJBBiPXSXPpelZeA+2SrM2c65magWWaN22Z9YQigKfbSdRSn6exPYcz2
 uQ95Fz9Q+lcvFlXNAEZg42w60gGyFR98t/DvSmRGm4/cQjiskRv6KYFWT w==;
X-CSE-ConnectionGUID: JcRYTc+vS76BCFu32ocXHg==
X-CSE-MsgGUID: g1XBFd30RWGJqnOluwk7rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="92836950"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="92836950"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 04:20:36 -0700
X-CSE-ConnectionGUID: vEWH4154TjWfjFO2Fr5/Gg==
X-CSE-MsgGUID: TZl7BLJ+QQevsdA3s+vhZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="252342495"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 17 Jun 2026 04:20:35 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wZoJt-00000000UPC-0QK6;
 Wed, 17 Jun 2026 11:20:33 +0000
Date: Wed, 17 Jun 2026 19:18:56 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 669252801a4aa4098fbc5dd9dd0bd93f0625abd7
Message-ID: <202606171946.ZfUbISeS-lkp@intel.com>
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
branch HEAD: 669252801a4aa4098fbc5dd9dd0bd93f0625abd7  drm/xe: Add compact-PT and addr mask handling for page reclaim

elapsed time: 1199m

configs tested: 210
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260617    gcc-16.1.0
arc                   randconfig-002-20260617    gcc-16.1.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260617    gcc-16.1.0
arm                   randconfig-002-20260617    gcc-16.1.0
arm                   randconfig-003-20260617    gcc-16.1.0
arm                   randconfig-004-20260617    gcc-16.1.0
arm                        spear3xx_defconfig    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260617    gcc-12.5.0
arm64                 randconfig-002-20260617    gcc-12.5.0
arm64                 randconfig-003-20260617    gcc-12.5.0
arm64                 randconfig-004-20260617    gcc-12.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260617    gcc-12.5.0
csky                  randconfig-002-20260617    gcc-12.5.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260617    clang-17
hexagon               randconfig-002-20260617    clang-17
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260617    gcc-14
i386        buildonly-randconfig-002-20260617    gcc-14
i386        buildonly-randconfig-003-20260617    gcc-14
i386        buildonly-randconfig-004-20260617    gcc-14
i386        buildonly-randconfig-005-20260617    gcc-14
i386        buildonly-randconfig-006-20260617    gcc-14
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    gcc-13
i386                  randconfig-001-20260617    gcc-13
i386                           randconfig-002    gcc-13
i386                  randconfig-002-20260617    gcc-13
i386                           randconfig-003    gcc-13
i386                  randconfig-003-20260617    gcc-13
i386                           randconfig-004    gcc-13
i386                  randconfig-004-20260617    gcc-13
i386                           randconfig-005    gcc-13
i386                  randconfig-005-20260617    gcc-13
i386                           randconfig-006    gcc-13
i386                  randconfig-006-20260617    gcc-13
i386                           randconfig-007    gcc-13
i386                  randconfig-007-20260617    gcc-13
i386                  randconfig-011-20260617    clang-22
i386                  randconfig-012-20260617    clang-22
i386                  randconfig-013-20260617    clang-22
i386                  randconfig-014-20260617    clang-22
i386                  randconfig-015-20260617    clang-22
i386                  randconfig-016-20260617    clang-22
i386                  randconfig-017-20260617    clang-22
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260617    clang-17
loongarch             randconfig-002-20260617    clang-17
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260617    clang-17
nios2                 randconfig-002-20260617    clang-17
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    gcc-15.2.0
parisc                randconfig-001-20260617    gcc-15.2.0
parisc                         randconfig-002    gcc-15.2.0
parisc                randconfig-002-20260617    gcc-15.2.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                        randconfig-001    gcc-15.2.0
powerpc               randconfig-001-20260617    gcc-15.2.0
powerpc                        randconfig-002    gcc-15.2.0
powerpc               randconfig-002-20260617    gcc-15.2.0
powerpc                         wii_defconfig    gcc-16.1.0
powerpc64                      randconfig-001    gcc-15.2.0
powerpc64             randconfig-001-20260617    gcc-15.2.0
powerpc64                      randconfig-002    gcc-15.2.0
powerpc64             randconfig-002-20260617    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260617    gcc-16.1.0
riscv                 randconfig-002-20260617    gcc-16.1.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260617    gcc-16.1.0
s390                  randconfig-002-20260617    gcc-16.1.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260617    gcc-16.1.0
sh                    randconfig-002-20260617    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260617    gcc-16.1.0
sparc                 randconfig-002-20260617    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260617    gcc-16.1.0
sparc64               randconfig-002-20260617    gcc-16.1.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260617    gcc-16.1.0
um                    randconfig-002-20260617    gcc-16.1.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260617    clang-22
x86_64      buildonly-randconfig-002-20260617    clang-22
x86_64      buildonly-randconfig-003-20260617    clang-22
x86_64      buildonly-randconfig-004-20260617    clang-22
x86_64      buildonly-randconfig-005-20260617    clang-22
x86_64      buildonly-randconfig-006-20260617    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260617    clang-22
x86_64                randconfig-002-20260617    clang-22
x86_64                randconfig-003-20260617    clang-22
x86_64                randconfig-004-20260617    clang-22
x86_64                randconfig-005-20260617    clang-22
x86_64                randconfig-006-20260617    clang-22
x86_64                randconfig-011-20260617    clang-22
x86_64                randconfig-012-20260617    clang-22
x86_64                randconfig-013-20260617    clang-22
x86_64                randconfig-014-20260617    clang-22
x86_64                randconfig-015-20260617    clang-22
x86_64                randconfig-016-20260617    clang-22
x86_64                         randconfig-071    gcc-13
x86_64                randconfig-071-20260617    clang-22
x86_64                randconfig-071-20260617    gcc-13
x86_64                         randconfig-072    gcc-13
x86_64                randconfig-072-20260617    clang-22
x86_64                randconfig-072-20260617    gcc-13
x86_64                         randconfig-073    gcc-13
x86_64                randconfig-073-20260617    clang-22
x86_64                randconfig-073-20260617    gcc-13
x86_64                         randconfig-074    gcc-13
x86_64                randconfig-074-20260617    clang-22
x86_64                randconfig-074-20260617    gcc-13
x86_64                         randconfig-075    gcc-13
x86_64                randconfig-075-20260617    clang-22
x86_64                randconfig-075-20260617    gcc-13
x86_64                         randconfig-076    gcc-13
x86_64                randconfig-076-20260617    clang-22
x86_64                randconfig-076-20260617    gcc-13
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260617    gcc-16.1.0
xtensa                randconfig-002-20260617    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
