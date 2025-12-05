Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFA2D33987
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 16:11:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5FB10EB76;
	Fri,  5 Dec 2025 16:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IDKiEow9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CFB10EB76
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 16:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764951059; x=1796487059;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=CVfZdpMO3CecQVEs1//eErOyn0+2ckCvksOkMJt1Fq0=;
 b=IDKiEow9KnlIspSdMT2GrPYIu3wYk9/z8XRoGz5wKJdhq7i8opVJKUhs
 pVLMhWbtQ1hLSPiI9HwdxAHFjz1HVvx/u3hXqzNLUm2LAHsP272n4ehA2
 Vh9TqcGyrJ/eukht1U54t2MRPr6jTw25ABL7DML2rKpRk0WVwWvfhU5Gg
 1R1PkphdY9Jr/SX+m1wd4bH42mr9gWkqYRbmSUELxpdpQCNL7M+fjshAF
 5S18bpHaeqFtum6SGQ4qrFRvNPYQW8TpqnJ8a5lGakqG6M5AZhfXA0XCb
 r0r3xoLYYjcBfLzNGOrCUsAQHgaoD3TQba+lk6Hz6xwQB56wFQ0wYWWah A==;
X-CSE-ConnectionGUID: q4+G76+DTU65lyzKvbPR5A==
X-CSE-MsgGUID: Akm/vd1VQQa1V+6oYncnbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="78337777"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="78337777"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 08:10:58 -0800
X-CSE-ConnectionGUID: Um+JOEIkRXyz2LWMTsDvng==
X-CSE-MsgGUID: L0L+RtqmTk+MERcWAZL6gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="199510549"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 05 Dec 2025 08:10:57 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vRYOV-00000000FC5-1JB6;
 Fri, 05 Dec 2025 16:10:55 +0000
Date: Sat, 06 Dec 2025 00:10:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:topic/xe-vfio] BUILD SUCCESS
 e45b5df47b07e6ce1138b0a4e70ad0b0c4d72881
Message-ID: <202512060029.JrTtzgnS-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git topic/xe-vfio
branch HEAD: e45b5df47b07e6ce1138b0a4e70ad0b0c4d72881  drm/xe/pf: fix VFIO link error

elapsed time: 1457m

configs tested: 207
configs skipped: 0

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
arc                              allyesconfig    clang-22
arc                      axs103_smp_defconfig    clang-22
arc                                 defconfig    gcc-15.1.0
arc                        nsim_700_defconfig    clang-17
arc                   randconfig-001-20251205    gcc-13.4.0
arc                   randconfig-002-20251205    gcc-13.4.0
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                         lpc32xx_defconfig    clang-17
arm                             mxs_defconfig    clang-22
arm                   randconfig-001-20251205    gcc-13.4.0
arm                   randconfig-002-20251205    gcc-13.4.0
arm                   randconfig-003-20251205    gcc-13.4.0
arm                   randconfig-004-20251205    gcc-13.4.0
arm                        spear3xx_defconfig    gcc-15.1.0
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251205    clang-22
arm64                 randconfig-002-20251205    clang-22
arm64                 randconfig-003-20251205    clang-22
arm64                 randconfig-004-20251205    clang-22
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251205    clang-22
csky                  randconfig-002-20251205    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251205    clang-22
hexagon               randconfig-002-20251205    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251205    gcc-14
i386        buildonly-randconfig-002-20251205    gcc-14
i386        buildonly-randconfig-003-20251205    gcc-14
i386        buildonly-randconfig-004-20251205    gcc-14
i386        buildonly-randconfig-005-20251205    gcc-14
i386        buildonly-randconfig-006-20251205    gcc-14
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251205    clang-20
i386                  randconfig-002-20251205    clang-20
i386                  randconfig-003-20251205    clang-20
i386                  randconfig-004-20251205    clang-20
i386                  randconfig-005-20251205    clang-20
i386                  randconfig-006-20251205    clang-20
i386                  randconfig-007-20251205    clang-20
i386                  randconfig-011-20251205    clang-20
i386                  randconfig-012-20251205    clang-20
i386                  randconfig-013-20251205    clang-20
i386                  randconfig-014-20251205    clang-20
i386                  randconfig-015-20251205    clang-20
i386                  randconfig-016-20251205    clang-20
i386                  randconfig-017-20251205    clang-20
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251205    clang-22
loongarch             randconfig-002-20251205    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    clang-17
mips                         bigsur_defconfig    clang-17
mips                         db1xxx_defconfig    clang-17
mips                          eyeq5_defconfig    clang-22
mips                          eyeq6_defconfig    clang-17
mips                           ip28_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251205    clang-22
nios2                 randconfig-002-20251205    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251205    clang-22
parisc                randconfig-002-20251205    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                 canyonlands_defconfig    clang-22
powerpc                        fsp2_defconfig    clang-17
powerpc                    ge_imp3a_defconfig    gcc-15.1.0
powerpc                  iss476-smp_defconfig    clang-22
powerpc                      katmai_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251205    clang-22
powerpc               randconfig-002-20251205    clang-22
powerpc64             randconfig-001-20251205    clang-22
powerpc64             randconfig-002-20251205    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251205    gcc-13.4.0
riscv                 randconfig-002-20251205    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251205    gcc-13.4.0
s390                  randconfig-002-20251205    gcc-13.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                        apsh4ad0a_defconfig    clang-17
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251205    gcc-13.4.0
sh                    randconfig-002-20251205    gcc-13.4.0
sh                           se7206_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251205    gcc-14
sparc                 randconfig-002-20251205    gcc-14
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251205    gcc-14
sparc64               randconfig-002-20251205    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251205    gcc-14
um                    randconfig-002-20251205    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251205    gcc-14
x86_64      buildonly-randconfig-002-20251205    gcc-14
x86_64      buildonly-randconfig-003-20251205    gcc-14
x86_64      buildonly-randconfig-004-20251205    gcc-14
x86_64      buildonly-randconfig-005-20251205    gcc-14
x86_64      buildonly-randconfig-006-20251205    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251205    clang-20
x86_64                randconfig-002-20251205    clang-20
x86_64                randconfig-003-20251205    clang-20
x86_64                randconfig-004-20251205    clang-20
x86_64                randconfig-005-20251205    clang-20
x86_64                randconfig-006-20251205    clang-20
x86_64                randconfig-011-20251205    clang-20
x86_64                randconfig-012-20251205    clang-20
x86_64                randconfig-013-20251205    clang-20
x86_64                randconfig-014-20251205    clang-20
x86_64                randconfig-015-20251205    clang-20
x86_64                randconfig-016-20251205    clang-20
x86_64                randconfig-071-20251205    gcc-14
x86_64                randconfig-072-20251205    gcc-14
x86_64                randconfig-073-20251205    gcc-14
x86_64                randconfig-074-20251205    gcc-14
x86_64                randconfig-075-20251205    gcc-14
x86_64                randconfig-076-20251205    gcc-14
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
xtensa                randconfig-001-20251205    gcc-14
xtensa                randconfig-002-20251205    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
