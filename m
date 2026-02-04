Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0532E9537B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 11:55:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E0D10E616;
	Wed,  4 Feb 2026 11:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eOlyqV5p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5437D10E614
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 11:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770206121; x=1801742121;
 h=date:from:to:cc:subject:message-id;
 bh=9SFfCJJK05ZhmwEMJ6BRT8+rhvYn9rYSCpJJFvL/W9Q=;
 b=eOlyqV5pen43oAICdvfIaqveF+qFzCnDcLkbzH3T9mTqO2ktiZ5A6H70
 5K1SR7ShK2kmgDPK+17iJsbDLQSPmN8koPtdwNYezPbohhDeSt3eiJqc+
 lpEtApwZDB0NyoflFsELpdmigT6NNVmlZBYihMQXGbvBu6JR/q9YuAT5y
 Rtw5K1LDVPobzUOwXXRZ7mpnD/SJU75PCDAgTK7+KaJoAloN3ItFLSH8Y
 3HKuxL17tnNTjCTzcvHJIOu6P20GZAA5DHWLI1auiJif274EZb9cquKL7
 dDs7cq/cpyAPuCQjQFxOcf3Hm7p4m9o1r0TcQdKk9v9XJ25PQmzLdUeWx A==;
X-CSE-ConnectionGUID: 8piIjFXySX2Eq9KDQg9W2Q==
X-CSE-MsgGUID: kkkQtcuSSqqCuoXLLNyEhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82759887"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="82759887"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 03:55:21 -0800
X-CSE-ConnectionGUID: ianXDOvfRhC5fstacC07lQ==
X-CSE-MsgGUID: H2yb3yEQTnukTjpRsL9nyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="209241589"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 04 Feb 2026 03:55:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vnbTZ-00000000hkx-0m8x;
 Wed, 04 Feb 2026 11:55:17 +0000
Date: Wed, 04 Feb 2026 19:55:08 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 39125eaf8863ab09d70c4b493f58639b08d5a897
Message-ID: <202602041900.1IYjZRdh-lkp@intel.com>
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
branch HEAD: 39125eaf8863ab09d70c4b493f58639b08d5a897  drm/xe/pm: Disable D3Cold for BMG only on specific platforms

elapsed time: 951m

configs tested: 214
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                   randconfig-001-20260204    gcc-8.5.0
arc                   randconfig-001-20260204    gcc-9.5.0
arc                   randconfig-002-20260204    gcc-8.5.0
arm                              alldefconfig    gcc-15.2.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                        mvebu_v5_defconfig    gcc-15.2.0
arm                   randconfig-001-20260204    clang-22
arm                   randconfig-001-20260204    gcc-8.5.0
arm                   randconfig-002-20260204    gcc-11.5.0
arm                   randconfig-002-20260204    gcc-8.5.0
arm                   randconfig-003-20260204    clang-22
arm                   randconfig-003-20260204    gcc-8.5.0
arm                   randconfig-004-20260204    gcc-8.5.0
arm                       versatile_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                 randconfig-001-20260204    gcc-11.5.0
arm64                 randconfig-001-20260204    gcc-8.5.0
arm64                 randconfig-002-20260204    clang-22
arm64                 randconfig-002-20260204    gcc-11.5.0
arm64                 randconfig-003-20260204    clang-22
arm64                 randconfig-003-20260204    gcc-11.5.0
arm64                 randconfig-004-20260204    gcc-11.5.0
arm64                 randconfig-004-20260204    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                  randconfig-001-20260204    gcc-11.5.0
csky                  randconfig-002-20260204    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260204    gcc-14
i386        buildonly-randconfig-002-20260204    gcc-14
i386        buildonly-randconfig-003-20260204    gcc-14
i386        buildonly-randconfig-004-20260204    gcc-14
i386        buildonly-randconfig-005-20260204    gcc-14
i386        buildonly-randconfig-006-20260204    gcc-14
i386                  randconfig-001-20260204    gcc-14
i386                  randconfig-002-20260204    gcc-14
i386                  randconfig-003-20260204    clang-20
i386                  randconfig-003-20260204    gcc-14
i386                  randconfig-004-20260204    gcc-12
i386                  randconfig-004-20260204    gcc-14
i386                  randconfig-005-20260204    gcc-14
i386                  randconfig-006-20260204    gcc-14
i386                  randconfig-007-20260204    gcc-14
i386                  randconfig-011-20260204    clang-20
i386                  randconfig-012-20260204    clang-20
i386                  randconfig-012-20260204    gcc-14
i386                  randconfig-013-20260204    clang-20
i386                  randconfig-014-20260204    clang-20
i386                  randconfig-015-20260204    clang-20
i386                  randconfig-015-20260204    gcc-13
i386                  randconfig-016-20260204    clang-20
i386                  randconfig-017-20260204    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
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
mips                          ath79_defconfig    gcc-15.2.0
mips                          eyeq5_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260204    gcc-8.5.0
parisc                randconfig-002-20260204    gcc-10.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      bamboo_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260204    clang-22
powerpc               randconfig-002-20260204    gcc-14.3.0
powerpc64             randconfig-001-20260204    clang-19
powerpc64             randconfig-002-20260204    gcc-11.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260204    gcc-8.5.0
riscv                 randconfig-002-20260204    clang-22
riscv                 randconfig-002-20260204    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260204    clang-19
s390                  randconfig-001-20260204    gcc-8.5.0
s390                  randconfig-002-20260204    gcc-8.5.0
s390                  randconfig-002-20260204    gcc-9.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                          lboxre2_defconfig    gcc-15.2.0
sh                    randconfig-001-20260204    gcc-14.3.0
sh                    randconfig-001-20260204    gcc-8.5.0
sh                    randconfig-002-20260204    gcc-12.5.0
sh                    randconfig-002-20260204    gcc-8.5.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260204    gcc-8.5.0
sparc                 randconfig-002-20260204    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64               randconfig-001-20260204    clang-22
sparc64               randconfig-001-20260204    gcc-8.5.0
sparc64               randconfig-002-20260204    gcc-8.5.0
sparc64               randconfig-002-20260204    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                    randconfig-001-20260204    gcc-14
um                    randconfig-001-20260204    gcc-8.5.0
um                    randconfig-002-20260204    gcc-14
um                    randconfig-002-20260204    gcc-8.5.0
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260204    clang-20
x86_64      buildonly-randconfig-001-20260204    gcc-12
x86_64      buildonly-randconfig-002-20260204    clang-20
x86_64      buildonly-randconfig-002-20260204    gcc-14
x86_64      buildonly-randconfig-003-20260204    clang-20
x86_64      buildonly-randconfig-004-20260204    clang-20
x86_64      buildonly-randconfig-004-20260204    gcc-14
x86_64      buildonly-randconfig-005-20260204    clang-20
x86_64      buildonly-randconfig-006-20260204    clang-20
x86_64      buildonly-randconfig-006-20260204    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260204    gcc-14
x86_64                randconfig-002-20260204    gcc-14
x86_64                randconfig-003-20260204    gcc-14
x86_64                randconfig-004-20260204    gcc-14
x86_64                randconfig-005-20260204    gcc-14
x86_64                randconfig-006-20260204    gcc-14
x86_64                randconfig-011-20260204    clang-20
x86_64                randconfig-012-20260204    clang-20
x86_64                randconfig-012-20260204    gcc-14
x86_64                randconfig-013-20260204    clang-20
x86_64                randconfig-014-20260204    clang-20
x86_64                randconfig-014-20260204    gcc-14
x86_64                randconfig-015-20260204    clang-20
x86_64                randconfig-015-20260204    gcc-14
x86_64                randconfig-016-20260204    clang-20
x86_64                randconfig-016-20260204    gcc-14
x86_64                randconfig-071-20260204    gcc-14
x86_64                randconfig-072-20260204    gcc-14
x86_64                randconfig-073-20260204    gcc-14
x86_64                randconfig-074-20260204    gcc-14
x86_64                randconfig-075-20260204    gcc-14
x86_64                randconfig-076-20260204    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260204    gcc-8.5.0
xtensa                randconfig-001-20260204    gcc-9.5.0
xtensa                randconfig-002-20260204    gcc-12.5.0
xtensa                randconfig-002-20260204    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
