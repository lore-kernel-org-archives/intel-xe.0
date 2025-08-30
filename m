Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CE7CA0FFF
	for <intel-xe@archiver.kernel.org>; Sat, 30 Aug 2025 15:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C3210E071;
	Sat, 30 Aug 2025 15:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X/Bt/9/e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0A810E071
 for <intel-xe@lists.freedesktop.org>; Sat, 30 Aug 2025 15:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756566746; x=1788102746;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=8Eodugm/GxJwEbO7MF4ig4B/N9DPEZMJVdy3nrV9j7Y=;
 b=X/Bt/9/esCOJtY7EXtNLEaBZLCKwYwd07KaMMKagDDo4gg2dgRORzlV9
 B69CL+7arQau4yfnVMydzWm8VcFO0rK0pOvlur9MyKIJHd/61HTs3vswU
 Llnz9Db16U2/2ivqw0AENOO71EF/Z/DZjupdbUKPR4/PrB6OYGFTwss3L
 +smgXrg/Btvy/YUg+MZK7VWzP/bCwgG/emj6oXa4MIsH4Jm+u23zulBHn
 rDd7OamK572JyeMFjNfWI4OYAikn1NFnXqIHF2VTw3uxekhQArHqpx44j
 5rhxtcWn5sO6f3mLU5oBU0OI+pGtaM1Uduq+VZV8mi8vQYCV3R+01kHoC w==;
X-CSE-ConnectionGUID: iZqlj8zkT72MsYlARyAoNQ==
X-CSE-MsgGUID: hXcrf1I+SOeH8G9vzV5mHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58688349"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="58688349"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2025 08:12:26 -0700
X-CSE-ConnectionGUID: 4vR7VBDnTXKVomeZ0p8nig==
X-CSE-MsgGUID: GjdkL53CQXWiQKawWZqQxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="174977134"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by orviesa004.jf.intel.com with ESMTP; 30 Aug 2025 08:12:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1usNFd-000VS7-0v;
 Sat, 30 Aug 2025 15:12:21 +0000
Date: Sat, 30 Aug 2025 23:11:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 1047bd82794a1eab64d643f196d09171ce983f44
Message-ID: <202508302323.uh8Z9g8Y-lkp@intel.com>
User-Agent: s-nail v14.9.24
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
branch HEAD: 1047bd82794a1eab64d643f196d09171ce983f44  drm/xe: Fix incorrect migration of backed-up object to VRAM

elapsed time: 1456m

configs tested: 172
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250830    gcc-8.5.0
arc                   randconfig-002-20250830    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                         orion5x_defconfig    gcc-15.1.0
arm                   randconfig-001-20250830    gcc-11.5.0
arm                   randconfig-002-20250830    clang-22
arm                   randconfig-003-20250830    clang-19
arm                   randconfig-004-20250830    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250830    gcc-10.5.0
arm64                 randconfig-002-20250830    clang-22
arm64                 randconfig-003-20250830    gcc-8.5.0
arm64                 randconfig-004-20250830    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250830    gcc-10.5.0
csky                  randconfig-002-20250830    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250830    clang-22
hexagon               randconfig-002-20250830    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250830    clang-20
i386        buildonly-randconfig-002-20250830    clang-20
i386        buildonly-randconfig-003-20250830    clang-20
i386        buildonly-randconfig-004-20250830    gcc-12
i386        buildonly-randconfig-005-20250830    clang-20
i386        buildonly-randconfig-006-20250830    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250830    clang-20
i386                  randconfig-002-20250830    clang-20
i386                  randconfig-003-20250830    clang-20
i386                  randconfig-004-20250830    clang-20
i386                  randconfig-005-20250830    clang-20
i386                  randconfig-006-20250830    clang-20
i386                  randconfig-007-20250830    clang-20
i386                  randconfig-011-20250830    gcc-12
i386                  randconfig-012-20250830    gcc-12
i386                  randconfig-013-20250830    gcc-12
i386                  randconfig-014-20250830    gcc-12
i386                  randconfig-015-20250830    gcc-12
i386                  randconfig-016-20250830    gcc-12
i386                  randconfig-017-20250830    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250830    clang-22
loongarch             randconfig-002-20250830    clang-18
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath25_defconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
mips                           ip28_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250830    gcc-11.5.0
nios2                 randconfig-002-20250830    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250830    gcc-10.5.0
parisc                randconfig-002-20250830    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      katmai_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250830    gcc-15.1.0
powerpc               randconfig-002-20250830    clang-22
powerpc               randconfig-003-20250830    clang-22
powerpc                     tqm8548_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250830    clang-17
powerpc64             randconfig-002-20250830    gcc-14.3.0
powerpc64             randconfig-003-20250830    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv             nommu_k210_sdcard_defconfig    gcc-15.1.0
riscv                 randconfig-001-20250830    gcc-11.5.0
riscv                 randconfig-001-20250830    gcc-8.5.0
riscv                 randconfig-002-20250830    clang-22
riscv                 randconfig-002-20250830    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250830    clang-22
s390                  randconfig-001-20250830    gcc-11.5.0
s390                  randconfig-002-20250830    gcc-11.5.0
s390                  randconfig-002-20250830    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250830    gcc-11.5.0
sh                    randconfig-002-20250830    gcc-11.5.0
sh                    randconfig-002-20250830    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250830    gcc-11.5.0
sparc                 randconfig-001-20250830    gcc-13.4.0
sparc                 randconfig-002-20250830    gcc-11.5.0
sparc                 randconfig-002-20250830    gcc-8.5.0
sparc64               randconfig-001-20250830    gcc-11.5.0
sparc64               randconfig-002-20250830    clang-20
sparc64               randconfig-002-20250830    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250830    gcc-11.5.0
um                    randconfig-001-20250830    gcc-12
um                    randconfig-002-20250830    gcc-11.5.0
um                    randconfig-002-20250830    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250829    gcc-11
x86_64      buildonly-randconfig-002-20250829    gcc-11
x86_64      buildonly-randconfig-003-20250829    gcc-12
x86_64      buildonly-randconfig-004-20250829    clang-20
x86_64      buildonly-randconfig-005-20250829    clang-20
x86_64      buildonly-randconfig-006-20250829    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250830    gcc-11
x86_64                randconfig-002-20250830    gcc-11
x86_64                randconfig-003-20250830    gcc-11
x86_64                randconfig-004-20250830    gcc-11
x86_64                randconfig-005-20250830    gcc-11
x86_64                randconfig-006-20250830    gcc-11
x86_64                randconfig-007-20250830    gcc-11
x86_64                randconfig-008-20250830    gcc-11
x86_64                randconfig-071-20250830    gcc-12
x86_64                randconfig-072-20250830    gcc-12
x86_64                randconfig-073-20250830    gcc-12
x86_64                randconfig-074-20250830    gcc-12
x86_64                randconfig-075-20250830    gcc-12
x86_64                randconfig-076-20250830    gcc-12
x86_64                randconfig-077-20250830    gcc-12
x86_64                randconfig-078-20250830    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250830    gcc-11.5.0
xtensa                randconfig-001-20250830    gcc-12.5.0
xtensa                randconfig-002-20250830    gcc-11.5.0
xtensa                randconfig-002-20250830    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
