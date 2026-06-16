Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69CDCD98DE
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 01:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821F510E7E6;
	Tue, 16 Jun 2026 01:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LpIkADkI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34A910E7DF
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 01:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781575160; x=1813111160;
 h=date:from:to:cc:subject:message-id;
 bh=ajIBd37oA3GVnUdgNYmbvIL9GX9nHdrWAqq/NFVQkoY=;
 b=LpIkADkIjOcdn83g/hdmbTdmElQl6cVpD3rw8MFbHmfbrOHAE3Uw3+Dj
 g8FSmvcRGVpxpbAAEV84Sz4oeJsIPKyGl9zDTs3NGt1PQpiLfhLJyEy9w
 FrZszDPzsd0zUrIWYbJpS5ejvwdwuiiHci8CD6P0kkMUf0+wLOrAHjZvh
 lTezRywCxcXdUwMBpOzTmdoqEFzMD0SCp9LFVA9aJEGsYf5nLybcDWy5L
 aAN6DRh7iuyHZlLv5yCnc08vjLizVzGJW4gHRTbWqSNsoNNmkgn+J2WJj
 artqon/0txdjdzPlLtOh93om4HtJmv+JGvALkgrv9d9rgWdsTMrgYmiLs A==;
X-CSE-ConnectionGUID: 19N8jW8YSWyEU5QQE+a70A==
X-CSE-MsgGUID: 8ZwW1LAAS8WpxlH69eF3GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82436369"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="82436369"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 18:59:19 -0700
X-CSE-ConnectionGUID: ggUetuxgRSSpwXo9vMAdhA==
X-CSE-MsgGUID: 1azbtZwmR+SjZKQyHPuAfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="247684920"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 15 Jun 2026 18:59:18 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wZJ59-00000000ScE-1e9T;
 Tue, 16 Jun 2026 01:59:15 +0000
Date: Tue, 16 Jun 2026 09:58:36 +0800
From: kernel test robot <lkp@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 0a78a44f4901aa6c9263e66be7fce02282f1109f
Message-ID: <202606160928.fQZl00lK-lkp@intel.com>
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
branch HEAD: 0a78a44f4901aa6c9263e66be7fce02282f1109f  drm/xe/guc: Fix buffer overflow in steered register list allocation

elapsed time: 806m

configs tested: 263
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260615    gcc-10.5.0
arc                   randconfig-001-20260616    gcc-9.5.0
arc                   randconfig-002-20260615    gcc-16.1.0
arc                   randconfig-002-20260616    gcc-9.5.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                       imx_v4_v5_defconfig    clang-23
arm                   randconfig-001-20260615    gcc-12.5.0
arm                   randconfig-001-20260616    gcc-9.5.0
arm                   randconfig-002-20260615    gcc-8.5.0
arm                   randconfig-002-20260616    gcc-9.5.0
arm                   randconfig-003-20260615    gcc-16.1.0
arm                   randconfig-003-20260616    gcc-9.5.0
arm                   randconfig-004-20260615    clang-23
arm                   randconfig-004-20260616    gcc-9.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260615    clang-23
arm64                 randconfig-001-20260616    gcc-13.4.0
arm64                 randconfig-002-20260615    gcc-8.5.0
arm64                 randconfig-002-20260616    gcc-13.4.0
arm64                 randconfig-003-20260615    clang-16
arm64                 randconfig-003-20260616    gcc-13.4.0
arm64                 randconfig-004-20260615    clang-23
arm64                 randconfig-004-20260616    gcc-13.4.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260615    gcc-16.1.0
csky                  randconfig-001-20260616    gcc-13.4.0
csky                  randconfig-002-20260615    gcc-10.5.0
csky                  randconfig-002-20260616    gcc-13.4.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260616    clang-23
hexagon               randconfig-002-20260616    clang-23
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260616    clang-22
i386        buildonly-randconfig-002-20260616    clang-22
i386        buildonly-randconfig-003-20260616    clang-22
i386        buildonly-randconfig-004-20260616    clang-22
i386        buildonly-randconfig-005-20260616    clang-22
i386        buildonly-randconfig-006-20260616    clang-22
i386                                defconfig    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260615    gcc-14
i386                  randconfig-001-20260616    gcc-14
i386                  randconfig-002-20260615    clang-22
i386                  randconfig-002-20260616    gcc-14
i386                  randconfig-003-20260615    clang-22
i386                  randconfig-003-20260616    gcc-14
i386                  randconfig-004-20260615    clang-22
i386                  randconfig-004-20260616    gcc-14
i386                  randconfig-005-20260615    clang-22
i386                  randconfig-005-20260616    gcc-14
i386                  randconfig-006-20260615    clang-22
i386                  randconfig-006-20260616    gcc-14
i386                  randconfig-007-20260615    gcc-14
i386                  randconfig-007-20260616    gcc-14
i386                  randconfig-011-20260615    clang-22
i386                  randconfig-011-20260616    clang-22
i386                  randconfig-012-20260615    clang-22
i386                  randconfig-012-20260616    clang-22
i386                  randconfig-013-20260615    gcc-14
i386                  randconfig-013-20260616    clang-22
i386                  randconfig-014-20260615    clang-22
i386                  randconfig-014-20260616    clang-22
i386                  randconfig-015-20260615    gcc-14
i386                  randconfig-015-20260616    clang-22
i386                  randconfig-016-20260615    clang-22
i386                  randconfig-016-20260616    clang-22
i386                  randconfig-017-20260615    gcc-14
i386                  randconfig-017-20260616    clang-22
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260616    clang-23
loongarch             randconfig-002-20260616    clang-23
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260616    clang-23
nios2                 randconfig-002-20260616    clang-23
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260616    gcc-8.5.0
parisc                randconfig-002-20260616    gcc-8.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc               randconfig-001-20260616    gcc-8.5.0
powerpc               randconfig-002-20260616    gcc-8.5.0
powerpc64             randconfig-001-20260616    gcc-8.5.0
powerpc64             randconfig-002-20260616    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-13.4.0
riscv                 randconfig-001-20260615    clang-19
riscv                 randconfig-001-20260616    gcc-16.1.0
riscv                          randconfig-002    clang-23
riscv                 randconfig-002-20260615    gcc-16.1.0
riscv                 randconfig-002-20260616    gcc-16.1.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-15.2.0
s390                  randconfig-001-20260615    gcc-11.5.0
s390                  randconfig-001-20260616    gcc-16.1.0
s390                           randconfig-002    clang-18
s390                  randconfig-002-20260615    clang-23
s390                  randconfig-002-20260616    gcc-16.1.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-14.3.0
sh                    randconfig-001-20260615    gcc-16.1.0
sh                    randconfig-001-20260616    gcc-16.1.0
sh                             randconfig-002    gcc-9.5.0
sh                    randconfig-002-20260615    gcc-10.5.0
sh                    randconfig-002-20260616    gcc-16.1.0
sh                           se7722_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-16.1.0
sparc                 randconfig-001-20260615    gcc-13.4.0
sparc                 randconfig-001-20260616    gcc-8.5.0
sparc                          randconfig-002    gcc-11.5.0
sparc                 randconfig-002-20260615    gcc-15.2.0
sparc                 randconfig-002-20260616    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-12.5.0
sparc64               randconfig-001-20260615    gcc-8.5.0
sparc64               randconfig-001-20260616    gcc-8.5.0
sparc64                        randconfig-002    clang-20
sparc64               randconfig-002-20260615    gcc-8.5.0
sparc64               randconfig-002-20260616    gcc-8.5.0
um                               allmodconfig    clang-17
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    clang-23
um                    randconfig-001-20260615    clang-23
um                    randconfig-001-20260616    gcc-8.5.0
um                             randconfig-002    clang-23
um                    randconfig-002-20260615    clang-23
um                    randconfig-002-20260616    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260616    gcc-14
x86_64      buildonly-randconfig-002-20260616    gcc-14
x86_64      buildonly-randconfig-003-20260616    gcc-14
x86_64      buildonly-randconfig-004-20260616    gcc-14
x86_64      buildonly-randconfig-005-20260616    gcc-14
x86_64      buildonly-randconfig-006-20260616    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260615    gcc-14
x86_64                randconfig-001-20260616    clang-22
x86_64                randconfig-002-20260615    gcc-14
x86_64                randconfig-002-20260616    clang-22
x86_64                randconfig-003-20260615    clang-22
x86_64                randconfig-003-20260616    clang-22
x86_64                randconfig-004-20260615    gcc-14
x86_64                randconfig-004-20260616    clang-22
x86_64                randconfig-005-20260615    gcc-14
x86_64                randconfig-005-20260616    clang-22
x86_64                randconfig-006-20260615    clang-22
x86_64                randconfig-006-20260616    clang-22
x86_64                randconfig-011-20260615    gcc-14
x86_64                randconfig-011-20260616    clang-22
x86_64                randconfig-012-20260615    clang-22
x86_64                randconfig-012-20260616    clang-22
x86_64                randconfig-013-20260615    clang-22
x86_64                randconfig-013-20260616    clang-22
x86_64                randconfig-014-20260615    clang-22
x86_64                randconfig-014-20260616    clang-22
x86_64                randconfig-015-20260615    gcc-14
x86_64                randconfig-015-20260616    clang-22
x86_64                randconfig-016-20260615    gcc-14
x86_64                randconfig-016-20260616    clang-22
x86_64                randconfig-071-20260616    gcc-14
x86_64                randconfig-072-20260616    gcc-14
x86_64                randconfig-073-20260616    gcc-14
x86_64                randconfig-074-20260616    gcc-14
x86_64                randconfig-075-20260616    gcc-14
x86_64                randconfig-076-20260616    gcc-14
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
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260615    gcc-13.4.0
xtensa                randconfig-001-20260616    gcc-8.5.0
xtensa                         randconfig-002    gcc-13.4.0
xtensa                randconfig-002-20260615    gcc-8.5.0
xtensa                randconfig-002-20260616    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
