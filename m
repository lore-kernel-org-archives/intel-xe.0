Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CFBCFD314
	for <intel-xe@archiver.kernel.org>; Sun, 14 Dec 2025 05:30:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F279910E013;
	Sun, 14 Dec 2025 05:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PdH+Oz/G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E7510E013
 for <intel-xe@lists.freedesktop.org>; Sun, 14 Dec 2025 05:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765690238; x=1797226238;
 h=date:from:to:cc:subject:message-id;
 bh=JmJhhFpr3dD8jsJqrq9+wXGBnbhqhnImckqPc6wzwUM=;
 b=PdH+Oz/G7XYkVhHtnDQx3y1vluZRo0c2IOHdQwQWlVE/ItpVtnVDr+Iv
 mSL6U92f6XtKNMvo6FTSDBvqJV4HLruNpmwtABGRDI/ZvSFvOOpQ+01om
 AE7tOIWRhRaklg8zD2ecE83f2NgnPFrkXQe9k32/6vTXaV/A7ABy7vB91
 PopQ/gPuf4cM7dXo9sFz8/tZVmncGH9TVGlWLK3FOPaNZw6qxX4e0NSjE
 7GAE18j4G7bcS+UFtO//fJSq+ogrQJ9x7lfEIIc3m4+AQ3ZGuC1sMVYGU
 N4aUycSdQFjUeFL/jRVPi3KVY2gxOKydddQ9g8tbuQvnilIz5gfmSKRjY A==;
X-CSE-ConnectionGUID: naC5mUj/TMeS7mamdvpFAA==
X-CSE-MsgGUID: YfWCcDVBT0GQp7l8ixNdXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="93110205"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; d="scan'208";a="93110205"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2025 21:30:37 -0800
X-CSE-ConnectionGUID: yesJpPtXQRuFbl3UYTaLoQ==
X-CSE-MsgGUID: ZnqqXpMkR+iyW2SIlgS/VA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 13 Dec 2025 21:30:36 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vUegk-000000008cb-1HsO;
 Sun, 14 Dec 2025 05:30:34 +0000
Date: Sun, 14 Dec 2025 13:30:33 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 83f4151787c5dd2f38a426cb01423149baa3bbf5
Message-ID: <202512141326.Blagnnq7-lkp@intel.com>
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
branch HEAD: 83f4151787c5dd2f38a426cb01423149baa3bbf5  drm/xe/lnl: Drop pre-production workaround support

elapsed time: 1446m

configs tested: 150
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251213    gcc-15.1.0
arc                   randconfig-002-20251213    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                   randconfig-001-20251213    clang-20
arm                   randconfig-002-20251213    gcc-8.5.0
arm                   randconfig-003-20251213    clang-22
arm                   randconfig-004-20251213    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251213    clang-22
hexagon               randconfig-002-20251213    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251213    clang-20
i386        buildonly-randconfig-002-20251213    gcc-14
i386        buildonly-randconfig-003-20251213    gcc-14
i386        buildonly-randconfig-004-20251213    clang-20
i386        buildonly-randconfig-005-20251213    clang-20
i386        buildonly-randconfig-006-20251213    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-011-20251213    gcc-14
i386                  randconfig-012-20251213    gcc-14
i386                  randconfig-013-20251213    clang-20
i386                  randconfig-014-20251213    gcc-14
i386                  randconfig-015-20251213    gcc-14
i386                  randconfig-016-20251213    gcc-14
i386                  randconfig-017-20251213    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251213    clang-20
loongarch             randconfig-002-20251213    clang-20
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                      bmips_stb_defconfig    clang-22
mips                           ci20_defconfig    clang-22
nios2                            alldefconfig    gcc-11.5.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251213    gcc-9.5.0
nios2                 randconfig-002-20251213    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251213    gcc-8.5.0
parisc                randconfig-002-20251213    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc               mpc834x_itxgp_defconfig    clang-22
powerpc               randconfig-001-20251213    clang-18
powerpc               randconfig-002-20251213    clang-22
powerpc64             randconfig-001-20251213    clang-16
powerpc64             randconfig-002-20251213    clang-16
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251213    clang-16
riscv                 randconfig-002-20251213    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251213    gcc-13.4.0
s390                  randconfig-002-20251213    clang-17
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                               j2_defconfig    gcc-15.1.0
sh                    randconfig-001-20251213    gcc-15.1.0
sh                    randconfig-002-20251213    gcc-10.5.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251213    gcc-14.3.0
sparc                 randconfig-002-20251213    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251213    gcc-15.1.0
sparc64               randconfig-002-20251213    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251213    clang-22
um                    randconfig-002-20251213    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251213    clang-20
x86_64      buildonly-randconfig-002-20251213    clang-20
x86_64      buildonly-randconfig-003-20251213    clang-20
x86_64      buildonly-randconfig-004-20251213    clang-20
x86_64      buildonly-randconfig-005-20251213    gcc-14
x86_64      buildonly-randconfig-006-20251213    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251213    gcc-14
x86_64                randconfig-002-20251213    gcc-14
x86_64                randconfig-003-20251213    gcc-14
x86_64                randconfig-004-20251213    clang-20
x86_64                randconfig-005-20251213    gcc-14
x86_64                randconfig-006-20251213    clang-20
x86_64                randconfig-011-20251213    gcc-14
x86_64                randconfig-012-20251213    gcc-14
x86_64                randconfig-013-20251213    clang-20
x86_64                randconfig-014-20251213    clang-20
x86_64                randconfig-015-20251213    gcc-14
x86_64                randconfig-016-20251213    clang-20
x86_64                randconfig-071-20251213    clang-20
x86_64                randconfig-072-20251213    clang-20
x86_64                randconfig-073-20251213    clang-20
x86_64                randconfig-074-20251213    gcc-13
x86_64                randconfig-075-20251213    clang-20
x86_64                randconfig-076-20251213    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251213    gcc-15.1.0
xtensa                randconfig-002-20251213    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
