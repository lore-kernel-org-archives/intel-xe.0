Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18798E7491C
	for <intel-xe@archiver.kernel.org>; Wed, 24 Dec 2025 06:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF39710E109;
	Wed, 24 Dec 2025 06:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EcxVfSsV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684CD10E109
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Dec 2025 06:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766559537; x=1798095537;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=7mZFraaEH8okDoNlHkxLcDNRiCJiHZLpFzGdoncCarA=;
 b=EcxVfSsVefGcJB6sfiH658tUmvbR0MxeKkcav3ZGLf4HxEewN6Zy3We7
 Z8cDdRfL3/qdIeG8f3u8miclC++e90WCnRY9uar1tOGWYhujs9b6SUZMG
 uc0elOQBH2ublNEsm2AEBRs6RJ38d04lhWVWiGRGp9Hv6n3f7C0UVldwh
 mM6ubixSYx2e4JPfjg/tGMI9Da1OeEvgxL76gjGckPtqNINmj6Us2LzNA
 e7nfefH1DeMGeuERMrQxVpbsHeWo7FX9Ig2RL7ZK2rXW5obwSPWzrpQgH
 LRsUkSiQWggVtWhUD/2Xr0Bk675cp2W1ez6xgfD5iArh5tuSkgjROJSRU w==;
X-CSE-ConnectionGUID: vcN8ZqW3RZKqZP5/+isfTQ==
X-CSE-MsgGUID: GN2PbqrSTNSvoVUN2U30dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68557466"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; d="scan'208";a="68557466"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 22:58:57 -0800
X-CSE-ConnectionGUID: TUTmongcR0Gyg1+FvH5ZAw==
X-CSE-MsgGUID: P816SUGPTsSbuPhhOgsbkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; d="scan'208";a="223435481"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
 by fmviesa002.fm.intel.com with ESMTP; 23 Dec 2025 22:58:55 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vYIph-000000002mr-0RBe;
 Wed, 24 Dec 2025 06:58:53 +0000
Date: Wed, 24 Dec 2025 14:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 754c23238438600e9236719f7e67aff2c4d02093
Message-ID: <202512241429.XxPfBhuO-lkp@intel.com>
User-Agent: s-nail v14.9.25
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: 754c23238438600e9236719f7e67aff2c4d02093  drm/pagemap, drm/xe: Ensure that the devmem allocation is idle before use

elapsed time: 1249m

configs tested: 248
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              alldefconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251224    gcc-10.5.0
arc                   randconfig-001-20251224    gcc-12.5.0
arc                   randconfig-002-20251224    gcc-10.5.0
arm                              alldefconfig    clang-22
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.1.0
arm                            hisi_defconfig    gcc-15.1.0
arm                           omap1_defconfig    clang-22
arm                   randconfig-001-20251224    gcc-10.5.0
arm                   randconfig-001-20251224    gcc-8.5.0
arm                   randconfig-002-20251224    gcc-10.5.0
arm                   randconfig-002-20251224    gcc-8.5.0
arm                   randconfig-003-20251224    gcc-10.5.0
arm                   randconfig-003-20251224    gcc-12.5.0
arm                   randconfig-004-20251224    clang-22
arm                   randconfig-004-20251224    gcc-10.5.0
arm                           sama5_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251224    gcc-15.1.0
arm64                 randconfig-001-20251224    gcc-8.5.0
arm64                 randconfig-002-20251224    gcc-14.3.0
arm64                 randconfig-002-20251224    gcc-15.1.0
arm64                 randconfig-003-20251224    clang-17
arm64                 randconfig-003-20251224    gcc-15.1.0
arm64                 randconfig-004-20251224    gcc-10.5.0
arm64                 randconfig-004-20251224    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251224    gcc-15.1.0
csky                  randconfig-002-20251224    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251224    clang-22
hexagon               randconfig-001-20251224    gcc-15.1.0
hexagon               randconfig-002-20251224    clang-22
hexagon               randconfig-002-20251224    gcc-15.1.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251224    clang-20
i386        buildonly-randconfig-001-20251224    gcc-14
i386        buildonly-randconfig-002-20251224    gcc-14
i386        buildonly-randconfig-003-20251224    clang-20
i386        buildonly-randconfig-003-20251224    gcc-14
i386        buildonly-randconfig-004-20251224    gcc-12
i386        buildonly-randconfig-004-20251224    gcc-14
i386        buildonly-randconfig-005-20251224    gcc-14
i386        buildonly-randconfig-006-20251224    clang-20
i386        buildonly-randconfig-006-20251224    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251224    gcc-14
i386                  randconfig-002-20251224    gcc-14
i386                  randconfig-003-20251224    gcc-14
i386                  randconfig-004-20251224    gcc-12
i386                  randconfig-005-20251224    clang-20
i386                  randconfig-006-20251224    clang-20
i386                  randconfig-007-20251224    gcc-14
i386                  randconfig-011-20251224    clang-20
i386                  randconfig-012-20251224    clang-20
i386                  randconfig-013-20251224    clang-20
i386                  randconfig-014-20251224    clang-20
i386                  randconfig-015-20251224    clang-20
i386                  randconfig-016-20251224    clang-20
i386                  randconfig-017-20251224    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251224    gcc-15.1.0
loongarch             randconfig-002-20251224    gcc-12.5.0
loongarch             randconfig-002-20251224    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                      bmips_stb_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251224    gcc-11.5.0
nios2                 randconfig-001-20251224    gcc-15.1.0
nios2                 randconfig-002-20251224    gcc-11.5.0
nios2                 randconfig-002-20251224    gcc-15.1.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                       virt_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251224    clang-22
parisc                randconfig-001-20251224    gcc-8.5.0
parisc                randconfig-002-20251224    clang-22
parisc                randconfig-002-20251224    gcc-9.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251224    clang-22
powerpc               randconfig-002-20251224    clang-22
powerpc                     skiroot_defconfig    clang-22
powerpc                     stx_gp3_defconfig    gcc-15.1.0
powerpc                     tqm8548_defconfig    clang-22
powerpc64             randconfig-001-20251224    clang-22
powerpc64             randconfig-001-20251224    gcc-8.5.0
powerpc64             randconfig-002-20251224    clang-22
powerpc64             randconfig-002-20251224    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251224    gcc-15.1.0
riscv                 randconfig-001-20251224    gcc-8.5.0
riscv                 randconfig-002-20251224    clang-22
riscv                 randconfig-002-20251224    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    clang-22
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251224    gcc-10.5.0
s390                  randconfig-001-20251224    gcc-15.1.0
s390                  randconfig-002-20251224    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                         ap325rxa_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                         ecovec24_defconfig    gcc-15.1.0
sh                        edosk7760_defconfig    clang-22
sh                    randconfig-001-20251224    gcc-14.3.0
sh                    randconfig-001-20251224    gcc-15.1.0
sh                    randconfig-002-20251224    gcc-10.5.0
sh                    randconfig-002-20251224    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251224    gcc-14
sparc                 randconfig-001-20251224    gcc-8.5.0
sparc                 randconfig-002-20251224    gcc-14
sparc                 randconfig-002-20251224    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251224    gcc-14
sparc64               randconfig-001-20251224    gcc-8.5.0
sparc64               randconfig-002-20251224    clang-20
sparc64               randconfig-002-20251224    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251224    gcc-14
um                    randconfig-002-20251224    gcc-14
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251224    clang-20
x86_64      buildonly-randconfig-002-20251224    gcc-14
x86_64      buildonly-randconfig-003-20251224    gcc-14
x86_64      buildonly-randconfig-004-20251224    clang-20
x86_64      buildonly-randconfig-005-20251224    gcc-14
x86_64      buildonly-randconfig-006-20251224    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251224    clang-20
x86_64                randconfig-001-20251224    gcc-14
x86_64                randconfig-002-20251224    gcc-14
x86_64                randconfig-003-20251224    clang-20
x86_64                randconfig-003-20251224    gcc-14
x86_64                randconfig-004-20251224    gcc-14
x86_64                randconfig-005-20251224    gcc-14
x86_64                randconfig-006-20251224    gcc-14
x86_64                randconfig-011-20251224    gcc-14
x86_64                randconfig-012-20251224    gcc-14
x86_64                randconfig-013-20251224    clang-20
x86_64                randconfig-013-20251224    gcc-14
x86_64                randconfig-014-20251224    gcc-14
x86_64                randconfig-015-20251224    gcc-14
x86_64                randconfig-016-20251224    gcc-14
x86_64                randconfig-071-20251224    clang-20
x86_64                randconfig-072-20251224    gcc-14
x86_64                randconfig-073-20251224    clang-20
x86_64                randconfig-074-20251224    gcc-14
x86_64                randconfig-075-20251224    clang-20
x86_64                randconfig-076-20251224    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251224    gcc-14
xtensa                randconfig-001-20251224    gcc-15.1.0
xtensa                randconfig-002-20251224    gcc-14
xtensa                randconfig-002-20251224    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
