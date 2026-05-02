Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5BFCD13DA
	for <intel-xe@archiver.kernel.org>; Sat,  2 May 2026 17:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A754110E032;
	Sat,  2 May 2026 17:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JxaR+kQw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1B410E032
 for <intel-xe@lists.freedesktop.org>; Sat,  2 May 2026 17:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777742673; x=1809278673;
 h=date:from:to:cc:subject:message-id;
 bh=40DwIp0JxwNz1nnvanrz/BzWTvcjgn3GNGrg2N0wbcI=;
 b=JxaR+kQwLBx8x8EvmkRiCobVVxv70voZoeHc4rNCjR15GMloAn6rd74m
 z6LqD4xaARm5sSqcKB1FZx05CWxHnX/llaHkFnW8z15T/Z8zwQxEpW0bD
 /kkuYWrCTn/dw1vSSBDkq3qcNnun1iwQMdu7iMxoRJGwg4gCUxlvZZAt5
 3gyJ+hNXlMldaa21xf49m4GaaZJddntggcb8/kFTF6glJnWi2t1lokZeY
 uRd/moNE00T5P5SoSUMA0q4KiuvG3uApgEaOPvALA7i+cA1JJxVB/LkYx
 RLU59C4rTPSHU3RX6eShJwL3azm6YQmf+jVGCsQGb7S5kxOjAIEhwUmn0 A==;
X-CSE-ConnectionGUID: oYL8vQv9Rlqb5ra9RKRj5g==
X-CSE-MsgGUID: 6bv45bjHTvC41+1XofGTYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="89770981"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; d="scan'208";a="89770981"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2026 10:24:33 -0700
X-CSE-ConnectionGUID: 85ZALkruSHChU0s9UkpMPg==
X-CSE-MsgGUID: /0Wbo8+uQBmmCgT/BDttjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; d="scan'208";a="265489332"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 02 May 2026 10:24:31 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wJE4o-000000001en-3ir0;
 Sat, 02 May 2026 17:24:26 +0000
Date: Sun, 03 May 2026 01:23:39 +0800
From: kernel test robot <lkp@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 7d9c39cfb31ff389490ca1308767c2807a9829a6
Message-ID: <202605030130.oGMz9GO7-lkp@intel.com>
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
branch HEAD: 7d9c39cfb31ff389490ca1308767c2807a9829a6  drm/xe/pf: Fix MMIO access using PF view instead of VF view during migration

elapsed time: 2669m

configs tested: 173
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260502    gcc-8.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260502    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                            randconfig-001    gcc-8.5.0
arm                   randconfig-001-20260502    gcc-8.5.0
arm                            randconfig-002    gcc-8.5.0
arm                   randconfig-002-20260502    gcc-8.5.0
arm                            randconfig-003    gcc-8.5.0
arm                   randconfig-003-20260502    gcc-8.5.0
arm                            randconfig-004    gcc-8.5.0
arm                   randconfig-004-20260502    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    gcc-10.5.0
arm64                 randconfig-001-20260502    gcc-10.5.0
arm64                          randconfig-002    gcc-10.5.0
arm64                 randconfig-002-20260502    gcc-10.5.0
arm64                          randconfig-003    gcc-10.5.0
arm64                 randconfig-003-20260502    gcc-10.5.0
arm64                          randconfig-004    gcc-10.5.0
arm64                 randconfig-004-20260502    gcc-10.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    gcc-10.5.0
csky                  randconfig-001-20260502    gcc-10.5.0
csky                           randconfig-002    gcc-10.5.0
csky                  randconfig-002-20260502    gcc-10.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260502    clang-23
hexagon               randconfig-002-20260502    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260502    gcc-14
i386        buildonly-randconfig-002-20260502    gcc-14
i386        buildonly-randconfig-003-20260502    gcc-14
i386        buildonly-randconfig-004-20260502    gcc-14
i386        buildonly-randconfig-005-20260502    gcc-14
i386        buildonly-randconfig-006-20260502    gcc-14
i386                                defconfig    gcc-15.2.0
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260502    clang-23
loongarch             randconfig-002-20260502    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                        mvme147_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260502    clang-23
nios2                 randconfig-002-20260502    clang-23
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    gcc-12.5.0
parisc                randconfig-001-20260502    gcc-12.5.0
parisc                         randconfig-002    gcc-12.5.0
parisc                randconfig-002-20260502    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                        randconfig-001    gcc-12.5.0
powerpc               randconfig-001-20260502    gcc-12.5.0
powerpc                        randconfig-002    gcc-12.5.0
powerpc               randconfig-002-20260502    gcc-12.5.0
powerpc64                      randconfig-001    gcc-12.5.0
powerpc64             randconfig-001-20260502    gcc-12.5.0
powerpc64                      randconfig-002    gcc-12.5.0
powerpc64             randconfig-002-20260502    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260502    gcc-14.3.0
riscv                 randconfig-002-20260502    gcc-14.3.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260502    gcc-14.3.0
s390                  randconfig-002-20260502    gcc-14.3.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260502    gcc-14.3.0
sh                    randconfig-002-20260502    gcc-14.3.0
sh                      rts7751r2d1_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260502    gcc-8.5.0
sparc                 randconfig-002-20260502    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260502    gcc-8.5.0
sparc64               randconfig-002-20260502    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260502    gcc-8.5.0
um                    randconfig-002-20260502    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64               buildonly-randconfig-001    clang-20
x86_64      buildonly-randconfig-001-20260502    clang-20
x86_64               buildonly-randconfig-002    clang-20
x86_64      buildonly-randconfig-002-20260502    clang-20
x86_64               buildonly-randconfig-003    clang-20
x86_64      buildonly-randconfig-003-20260502    clang-20
x86_64               buildonly-randconfig-004    clang-20
x86_64      buildonly-randconfig-004-20260502    clang-20
x86_64               buildonly-randconfig-005    clang-20
x86_64      buildonly-randconfig-005-20260502    clang-20
x86_64               buildonly-randconfig-006    clang-20
x86_64      buildonly-randconfig-006-20260502    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260502    clang-20
x86_64                randconfig-002-20260502    clang-20
x86_64                randconfig-003-20260502    clang-20
x86_64                randconfig-004-20260502    clang-20
x86_64                randconfig-005-20260502    clang-20
x86_64                randconfig-006-20260502    clang-20
x86_64                randconfig-071-20260502    gcc-14
x86_64                randconfig-072-20260502    gcc-14
x86_64                randconfig-073-20260502    gcc-14
x86_64                randconfig-074-20260502    gcc-14
x86_64                randconfig-075-20260502    gcc-14
x86_64                randconfig-076-20260502    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260502    gcc-8.5.0
xtensa                randconfig-002-20260502    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
