Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF39CDD1AA
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 20:02:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C486610ED0C;
	Fri, 27 Sep 2024 20:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PkYdKEw3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C12910ED0C
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 20:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727467362; x=1759003362;
 h=date:from:to:cc:subject:message-id;
 bh=MY28LLdB0Yej0Nl1h4dNtNi/S7fPdHbzqPUGNHW1xxY=;
 b=PkYdKEw3NWodkwX+fct+yTM5L2YlQRhiwdzdO2fZ//rrDa/AJC6ht/gX
 149IHaLoMavB4UPteVanYKQ//3epR2B+WI/49DXUe86mgglDkuM3WV4dd
 aI7/CbBhZVU3nIgXQu98gjc2po6nt4if5wmJuFTbdfzqe6o4ZGAktyQNo
 P85gujiMbyacgJLq0LFu50go6M9E0v14s44A7glBJmhS3ap9quWKTfhZ5
 vRZLdQHNR8PjrBM6uAEOz2/ofV0nSwXJs2Yk5o/NnCTnzC753ofiB3hPd
 K/qLOFFXsnlUD6435cH03h+Mf6FVte+nCQYB2n+nvLcHIYzSEhcX3Bd6+ A==;
X-CSE-ConnectionGUID: a18KyQ2TRZqrM+yJ893D7w==
X-CSE-MsgGUID: AQbRgDUfROKw9u7BBBkHkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37190661"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="37190661"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 13:02:42 -0700
X-CSE-ConnectionGUID: /wmFrX1tRXGlO/4VKAHoaQ==
X-CSE-MsgGUID: hzGLPSpkQNW0EOpoQiiANQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="72794846"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 27 Sep 2024 13:02:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1suHAk-000MZf-19;
 Fri, 27 Sep 2024 20:02:38 +0000
Date: Sat, 28 Sep 2024 04:02:34 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next-fixes] BUILD SUCCESS
 f1c6a03b07377730f8787217874f622ac502b02f
Message-ID: <202409280429.8ZML72G2-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next-fixes
branch HEAD: f1c6a03b07377730f8787217874f622ac502b02f  drm/xe/xe2: Add performance tuning for L3 cache flushing

elapsed time: 1454m

configs tested: 124
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20240927    gcc-13.2.0
arc                   randconfig-002-20240927    gcc-13.2.0
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                       multi_v4t_defconfig    clang-20
arm                          pxa910_defconfig    gcc-14.1.0
arm                   randconfig-001-20240927    clang-20
arm                   randconfig-002-20240927    gcc-14.1.0
arm                   randconfig-003-20240927    clang-20
arm                   randconfig-004-20240927    clang-20
arm                         s5pv210_defconfig    gcc-14.1.0
arm                           tegra_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20240927    gcc-14.1.0
arm64                 randconfig-002-20240927    gcc-14.1.0
arm64                 randconfig-003-20240927    gcc-14.1.0
arm64                 randconfig-004-20240927    clang-15
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20240927    gcc-14.1.0
csky                  randconfig-002-20240927    gcc-14.1.0
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20240927    clang-20
hexagon               randconfig-002-20240927    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240927    clang-18
i386        buildonly-randconfig-002-20240927    gcc-12
i386        buildonly-randconfig-003-20240927    clang-18
i386        buildonly-randconfig-004-20240927    clang-18
i386        buildonly-randconfig-005-20240927    clang-18
i386        buildonly-randconfig-006-20240927    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240927    clang-18
i386                  randconfig-002-20240927    clang-18
i386                  randconfig-003-20240927    clang-18
i386                  randconfig-004-20240927    gcc-12
i386                  randconfig-005-20240927    clang-18
i386                  randconfig-006-20240927    clang-18
i386                  randconfig-011-20240927    gcc-12
i386                  randconfig-012-20240927    clang-18
i386                  randconfig-013-20240927    gcc-12
i386                  randconfig-014-20240927    gcc-12
i386                  randconfig-015-20240927    gcc-11
i386                  randconfig-016-20240927    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20240927    gcc-14.1.0
loongarch             randconfig-002-20240927    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                       m5475evb_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                  cavium_octeon_defconfig    gcc-14.1.0
mips                           rs90_defconfig    gcc-13.2.0
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20240927    gcc-14.1.0
nios2                 randconfig-002-20240927    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-14.1.0
parisc                randconfig-001-20240927    gcc-14.1.0
parisc                randconfig-002-20240927    gcc-14.1.0
powerpc                    adder875_defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                      ep88xc_defconfig    gcc-14.1.0
powerpc               randconfig-001-20240927    gcc-14.1.0
powerpc64             randconfig-001-20240927    clang-20
powerpc64             randconfig-002-20240927    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                               defconfig    clang-20
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    clang-20
s390                       zfcpdump_defconfig    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-14.1.0
sh                        edosk7705_defconfig    gcc-14.1.0
sh                             shx3_defconfig    gcc-14.1.0
sh                          urquell_defconfig    gcc-14.1.0
sparc                            alldefconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc                       sparc32_defconfig    gcc-14.1.0
sparc64                             defconfig    gcc-14.1.0
um                                allnoconfig    clang-17
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240927    clang-18
x86_64      buildonly-randconfig-002-20240927    clang-18
x86_64      buildonly-randconfig-003-20240927    gcc-12
x86_64      buildonly-randconfig-004-20240927    clang-18
x86_64      buildonly-randconfig-005-20240927    clang-18
x86_64      buildonly-randconfig-006-20240927    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                randconfig-001-20240927    gcc-12
x86_64                randconfig-002-20240927    gcc-12
x86_64                randconfig-003-20240927    gcc-12
x86_64                randconfig-004-20240927    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
