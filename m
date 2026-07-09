Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1824EC43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 23:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96B510E0DE;
	Thu,  9 Jul 2026 23:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brgIAhqh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F348610E0DE
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 23:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783638730; x=1815174730;
 h=date:from:to:cc:subject:message-id;
 bh=TQH9SUoDl9o6mR8GZbKvV6UThjlL02xBXZYEMzcIlA0=;
 b=brgIAhqh+EbiTRbUoL9PjShOWYOJCq6jFW0Wr8PprNNMYAgddJT4bLoc
 Fc5o4VOM1inYp/GBNtvYt4Bhvi7jpl6WJ/BPjTIciT9BE89FOjtyOy4Me
 W+MOXqX5/MyyimPzrBK3Nti5v830q3yMtnD3/v5mbLoGLm3sYw5BDwnJa
 Mto+KJ/Pe8PQF1M9ui4vWxk9U5MoKwtZkyBcUySiaQ8r21y1o5jg2GtCh
 QkcIFrkslCSNbbbYZBoWbP3h/vKcacKYJMu73AtABo3ebu0sm7qDszmMk
 p8O9tl4/lsIqmQb/6tvJ8q3GKug/S18TXY9hNz8oGTeIKZhRUwIOtTEMo w==;
X-CSE-ConnectionGUID: KpuyiHjtQqeBF9NAmD6Ybw==
X-CSE-MsgGUID: HtvUpO42TTa+mDKrQvR1Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95851830"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="95851830"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 16:12:09 -0700
X-CSE-ConnectionGUID: 7yhwwhKgQB2PJzV5B3mfrg==
X-CSE-MsgGUID: d5SBtlOMS36TOoLdrdzspw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255378783"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 09 Jul 2026 16:12:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1whxuW-00000000IEN-0zC8;
 Thu, 09 Jul 2026 23:12:04 +0000
Date: Fri, 10 Jul 2026 07:11:54 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 d72d2706b23503617a97a066316c00bf25702f2f
Message-ID: <202607100744.FouYY25X-lkp@intel.com>
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
branch HEAD: d72d2706b23503617a97a066316c00bf25702f2f  drm/xe/guc: fix activity stats error message format

elapsed time: 1249m

configs tested: 327
configs skipped: 4

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
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-16.1.0
arc                   randconfig-001-20260709    gcc-16.1.0
arc                   randconfig-001-20260709    gcc-8.5.0
arc                   randconfig-001-20260710    clang-23
arc                            randconfig-002    gcc-16.1.0
arc                   randconfig-002-20260709    gcc-16.1.0
arc                   randconfig-002-20260709    gcc-8.5.0
arc                   randconfig-002-20260710    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                          ep93xx_defconfig    clang-23
arm                         nhk8815_defconfig    clang-23
arm                            randconfig-001    gcc-16.1.0
arm                   randconfig-001-20260709    gcc-16.1.0
arm                   randconfig-001-20260709    gcc-8.5.0
arm                   randconfig-001-20260710    clang-23
arm                            randconfig-002    gcc-16.1.0
arm                   randconfig-002-20260709    gcc-16.1.0
arm                   randconfig-002-20260709    gcc-8.5.0
arm                   randconfig-002-20260710    clang-23
arm                            randconfig-003    gcc-16.1.0
arm                   randconfig-003-20260709    gcc-16.1.0
arm                   randconfig-003-20260709    gcc-8.5.0
arm                   randconfig-003-20260710    clang-23
arm                            randconfig-004    gcc-16.1.0
arm                   randconfig-004-20260709    gcc-16.1.0
arm                   randconfig-004-20260709    gcc-8.5.0
arm                   randconfig-004-20260710    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260709    gcc-16.1.0
arm64                 randconfig-001-20260710    gcc-10.5.0
arm64                 randconfig-002-20260709    gcc-16.1.0
arm64                 randconfig-002-20260710    gcc-10.5.0
arm64                 randconfig-003-20260709    gcc-16.1.0
arm64                 randconfig-003-20260710    gcc-10.5.0
arm64                 randconfig-004-20260709    gcc-16.1.0
arm64                 randconfig-004-20260710    gcc-10.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260709    gcc-16.1.0
csky                  randconfig-001-20260710    gcc-10.5.0
csky                  randconfig-002-20260709    gcc-16.1.0
csky                  randconfig-002-20260710    gcc-10.5.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260709    clang-18
hexagon               randconfig-001-20260709    gcc-11.5.0
hexagon               randconfig-001-20260710    gcc-12.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260709    clang-18
hexagon               randconfig-002-20260709    gcc-11.5.0
hexagon               randconfig-002-20260710    gcc-12.5.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260709    gcc-14
i386        buildonly-randconfig-001-20260710    clang-22
i386                 buildonly-randconfig-002    gcc-14
i386        buildonly-randconfig-002-20260709    gcc-14
i386        buildonly-randconfig-002-20260710    clang-22
i386                 buildonly-randconfig-003    gcc-14
i386        buildonly-randconfig-003-20260709    gcc-14
i386        buildonly-randconfig-003-20260710    clang-22
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260709    gcc-14
i386        buildonly-randconfig-004-20260710    clang-22
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260709    gcc-14
i386        buildonly-randconfig-005-20260710    clang-22
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260709    gcc-14
i386        buildonly-randconfig-006-20260710    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260709    gcc-14
i386                  randconfig-001-20260710    clang-22
i386                  randconfig-002-20260709    gcc-14
i386                  randconfig-002-20260710    clang-22
i386                  randconfig-003-20260709    gcc-14
i386                  randconfig-003-20260710    clang-22
i386                  randconfig-004-20260709    gcc-14
i386                  randconfig-004-20260710    clang-22
i386                  randconfig-005-20260709    gcc-14
i386                  randconfig-005-20260710    clang-22
i386                  randconfig-006-20260709    gcc-14
i386                  randconfig-006-20260710    clang-22
i386                  randconfig-007-20260709    gcc-14
i386                  randconfig-007-20260710    clang-22
i386                           randconfig-011    gcc-14
i386                  randconfig-011-20260709    gcc-14
i386                  randconfig-011-20260710    gcc-14
i386                           randconfig-012    gcc-14
i386                  randconfig-012-20260709    gcc-14
i386                  randconfig-012-20260710    gcc-14
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260709    gcc-14
i386                  randconfig-013-20260710    gcc-14
i386                           randconfig-014    gcc-14
i386                  randconfig-014-20260709    gcc-14
i386                  randconfig-014-20260710    gcc-14
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260709    gcc-14
i386                  randconfig-015-20260710    gcc-14
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260709    gcc-14
i386                  randconfig-016-20260710    gcc-14
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260709    gcc-14
i386                  randconfig-017-20260710    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260709    clang-18
loongarch             randconfig-001-20260709    gcc-11.5.0
loongarch             randconfig-001-20260710    gcc-12.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260709    clang-18
loongarch             randconfig-002-20260709    gcc-11.5.0
loongarch             randconfig-002-20260710    gcc-12.5.0
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
nios2                         10m50_defconfig    gcc-11.5.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260709    clang-18
nios2                 randconfig-001-20260709    gcc-11.5.0
nios2                 randconfig-001-20260710    gcc-12.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260709    clang-18
nios2                 randconfig-002-20260709    gcc-11.5.0
nios2                 randconfig-002-20260710    gcc-12.5.0
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    clang-23
parisc                randconfig-001-20260709    clang-23
parisc                randconfig-001-20260710    clang-17
parisc                         randconfig-002    clang-23
parisc                randconfig-002-20260709    clang-23
parisc                randconfig-002-20260710    clang-17
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                   microwatt_defconfig    gcc-16.1.0
powerpc                 mpc836x_rdk_defconfig    clang-23
powerpc                       ppc64_defconfig    clang-17
powerpc                        randconfig-001    clang-23
powerpc               randconfig-001-20260709    clang-23
powerpc               randconfig-001-20260710    clang-17
powerpc                        randconfig-002    clang-23
powerpc               randconfig-002-20260709    clang-23
powerpc               randconfig-002-20260710    clang-17
powerpc64                      randconfig-001    clang-23
powerpc64             randconfig-001-20260709    clang-23
powerpc64             randconfig-001-20260710    clang-17
powerpc64                      randconfig-002    clang-23
powerpc64             randconfig-002-20260709    clang-23
powerpc64             randconfig-002-20260710    clang-17
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    clang-22
riscv                 randconfig-001-20260709    clang-22
riscv                 randconfig-001-20260710    clang-17
riscv                          randconfig-002    clang-22
riscv                 randconfig-002-20260709    clang-22
riscv                 randconfig-002-20260710    clang-17
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    clang-22
s390                  randconfig-001-20260709    clang-22
s390                  randconfig-001-20260710    clang-17
s390                           randconfig-002    clang-22
s390                  randconfig-002-20260709    clang-22
s390                  randconfig-002-20260710    clang-17
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                             randconfig-001    clang-22
sh                    randconfig-001-20260709    clang-22
sh                    randconfig-001-20260710    clang-17
sh                             randconfig-002    clang-22
sh                    randconfig-002-20260709    clang-22
sh                    randconfig-002-20260710    clang-17
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-8.5.0
sparc                 randconfig-001-20260709    gcc-8.5.0
sparc                          randconfig-002    gcc-8.5.0
sparc                 randconfig-002-20260709    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-8.5.0
sparc64               randconfig-001-20260709    gcc-8.5.0
sparc64                        randconfig-002    gcc-8.5.0
sparc64               randconfig-002-20260709    gcc-8.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-8.5.0
um                    randconfig-001-20260709    gcc-8.5.0
um                             randconfig-002    gcc-8.5.0
um                    randconfig-002-20260709    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    clang-22
x86_64      buildonly-randconfig-001-20260709    clang-22
x86_64      buildonly-randconfig-001-20260710    clang-22
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260709    clang-22
x86_64      buildonly-randconfig-002-20260710    clang-22
x86_64               buildonly-randconfig-003    clang-22
x86_64      buildonly-randconfig-003-20260709    clang-22
x86_64      buildonly-randconfig-003-20260710    clang-22
x86_64               buildonly-randconfig-004    clang-22
x86_64      buildonly-randconfig-004-20260709    clang-22
x86_64      buildonly-randconfig-004-20260710    clang-22
x86_64               buildonly-randconfig-005    clang-22
x86_64      buildonly-randconfig-005-20260709    clang-22
x86_64      buildonly-randconfig-005-20260710    clang-22
x86_64               buildonly-randconfig-006    clang-22
x86_64      buildonly-randconfig-006-20260709    clang-22
x86_64      buildonly-randconfig-006-20260710    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260709    clang-22
x86_64                randconfig-001-20260709    gcc-14
x86_64                randconfig-001-20260710    gcc-14
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260709    clang-22
x86_64                randconfig-002-20260709    gcc-14
x86_64                randconfig-002-20260710    gcc-14
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260709    clang-22
x86_64                randconfig-003-20260709    gcc-14
x86_64                randconfig-003-20260710    gcc-14
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260709    clang-22
x86_64                randconfig-004-20260709    gcc-14
x86_64                randconfig-004-20260710    gcc-14
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260709    clang-22
x86_64                randconfig-005-20260709    gcc-14
x86_64                randconfig-005-20260710    gcc-14
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260709    clang-22
x86_64                randconfig-006-20260709    gcc-14
x86_64                randconfig-006-20260710    gcc-14
x86_64                randconfig-011-20260709    gcc-14
x86_64                randconfig-011-20260710    clang-22
x86_64                randconfig-012-20260709    gcc-14
x86_64                randconfig-012-20260710    clang-22
x86_64                randconfig-013-20260709    gcc-14
x86_64                randconfig-013-20260710    clang-22
x86_64                randconfig-014-20260709    gcc-14
x86_64                randconfig-014-20260710    clang-22
x86_64                randconfig-015-20260709    gcc-14
x86_64                randconfig-015-20260710    clang-22
x86_64                randconfig-016-20260709    gcc-14
x86_64                randconfig-016-20260710    clang-22
x86_64                         randconfig-071    clang-22
x86_64                randconfig-071-20260709    clang-22
x86_64                         randconfig-072    clang-22
x86_64                randconfig-072-20260709    clang-22
x86_64                         randconfig-073    clang-22
x86_64                randconfig-073-20260709    clang-22
x86_64                         randconfig-074    clang-22
x86_64                randconfig-074-20260709    clang-22
x86_64                         randconfig-075    clang-22
x86_64                randconfig-075-20260709    clang-22
x86_64                         randconfig-076    clang-22
x86_64                randconfig-076-20260709    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                          iss_defconfig    gcc-16.1.0
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260709    gcc-8.5.0
xtensa                         randconfig-002    gcc-8.5.0
xtensa                randconfig-002-20260709    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
