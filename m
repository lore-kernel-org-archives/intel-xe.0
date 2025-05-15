Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29D1C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 19:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B91510E0BC;
	Thu, 15 May 2025 19:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVeKk9FA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0952E10E0BC
 for <intel-xe@lists.freedesktop.org>; Thu, 15 May 2025 19:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747337537; x=1778873537;
 h=date:from:to:cc:subject:message-id;
 bh=KMCT5BbqcludgDX0t4Tkwo/PVdfK3y/AK+4AWLEbtbU=;
 b=XVeKk9FAfM2f+YI5qNOAhtZbifppdKRGcwtjq3ATNwTF8/Um+vTf9khW
 Iv3yYHHaAVHD8jwJz3z5CyAwBH1cQr2dCK9Mn/75N1EbmaqHmK0LFOByD
 62I1zeGOcWCxwsIGiO4t1PRpFZRkiC0Po6ApNM6CtkzTQhHHCF/4L7LBJ
 Mx5IBANVeMGKIU+MT7TWYvtreZrbjz+hIMg7deOE3iGwJj5bfDRZbOByY
 V7y6cssxKr/vNQr4Fro5DrP7obTimO8BawuV5cTopo26xuOtuQIbi+jy7
 DCGqA7jXsdqko93S2uxHOYAS1dcUWv4pE4QcJPU4aYZBnv3v4d9PmgtLd w==;
X-CSE-ConnectionGUID: 7FLbkL8WR6S+fv+L+XRgag==
X-CSE-MsgGUID: b1eqjochQC6OtHHzoIfnmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60312811"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="60312811"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 12:32:17 -0700
X-CSE-ConnectionGUID: s80LFNiMRSK4VhAQxO+Twg==
X-CSE-MsgGUID: lkB506kvSJaEXxhpdoX9qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="143590487"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 15 May 2025 12:32:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uFeJR-000Igx-12;
 Thu, 15 May 2025 19:32:13 +0000
Date: Fri, 16 May 2025 03:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 617d824c5323b8474b3665ae6c410c98b839e0b0
Message-ID: <202505160335.rjUlgkAQ-lkp@intel.com>
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-fixes
branch HEAD: 617d824c5323b8474b3665ae6c410c98b839e0b0  drm/xe: Add WA BB to capture active context utilization

elapsed time: 1446m

configs tested: 209
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              alldefconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250515    gcc-12.4.0
arc                   randconfig-001-20250515    gcc-6.5.0
arc                   randconfig-002-20250515    gcc-14.2.0
arc                   randconfig-002-20250515    gcc-6.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-14.2.0
arm                   randconfig-001-20250515    clang-21
arm                   randconfig-001-20250515    gcc-6.5.0
arm                   randconfig-002-20250515    gcc-6.5.0
arm                   randconfig-002-20250515    gcc-8.5.0
arm                   randconfig-003-20250515    gcc-6.5.0
arm                   randconfig-003-20250515    gcc-8.5.0
arm                   randconfig-004-20250515    clang-21
arm                   randconfig-004-20250515    gcc-6.5.0
arm                         vf610m4_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250515    clang-21
arm64                 randconfig-001-20250515    gcc-6.5.0
arm64                 randconfig-002-20250515    clang-21
arm64                 randconfig-002-20250515    gcc-6.5.0
arm64                 randconfig-003-20250515    clang-20
arm64                 randconfig-003-20250515    gcc-6.5.0
arm64                 randconfig-004-20250515    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250515    clang-21
csky                  randconfig-001-20250515    gcc-14.2.0
csky                  randconfig-002-20250515    clang-21
csky                  randconfig-002-20250515    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250515    clang-16
hexagon               randconfig-001-20250515    clang-21
hexagon               randconfig-002-20250515    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250515    gcc-11
i386        buildonly-randconfig-002-20250515    gcc-11
i386        buildonly-randconfig-002-20250515    gcc-12
i386        buildonly-randconfig-003-20250515    clang-20
i386        buildonly-randconfig-003-20250515    gcc-11
i386        buildonly-randconfig-004-20250515    clang-20
i386        buildonly-randconfig-004-20250515    gcc-11
i386        buildonly-randconfig-005-20250515    gcc-11
i386        buildonly-randconfig-005-20250515    gcc-12
i386        buildonly-randconfig-006-20250515    gcc-11
i386                                defconfig    clang-20
i386                  randconfig-011-20250515    gcc-12
i386                  randconfig-012-20250515    gcc-12
i386                  randconfig-013-20250515    gcc-12
i386                  randconfig-014-20250515    gcc-12
i386                  randconfig-015-20250515    gcc-12
i386                  randconfig-016-20250515    gcc-12
i386                  randconfig-017-20250515    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250515    clang-21
loongarch             randconfig-001-20250515    gcc-12.4.0
loongarch             randconfig-002-20250515    clang-21
loongarch             randconfig-002-20250515    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250515    clang-21
nios2                 randconfig-001-20250515    gcc-12.4.0
nios2                 randconfig-002-20250515    clang-21
nios2                 randconfig-002-20250515    gcc-6.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                 simple_smp_defconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250515    clang-21
parisc                randconfig-001-20250515    gcc-13.3.0
parisc                randconfig-002-20250515    clang-21
parisc                randconfig-002-20250515    gcc-13.3.0
parisc64                            defconfig    gcc-14.2.0
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                 mpc8313_rdb_defconfig    gcc-14.2.0
powerpc                      pcm030_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250515    clang-21
powerpc               randconfig-001-20250515    gcc-8.5.0
powerpc               randconfig-002-20250515    clang-21
powerpc               randconfig-002-20250515    gcc-6.5.0
powerpc               randconfig-003-20250515    clang-21
powerpc64             randconfig-001-20250515    clang-21
powerpc64             randconfig-002-20250515    clang-21
powerpc64             randconfig-002-20250515    gcc-8.5.0
powerpc64             randconfig-003-20250515    clang-21
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250515    gcc-8.5.0
riscv                 randconfig-001-20250515    gcc-9.3.0
riscv                 randconfig-002-20250515    gcc-14.2.0
riscv                 randconfig-002-20250515    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250515    clang-21
s390                  randconfig-001-20250515    gcc-9.3.0
s390                  randconfig-002-20250515    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250515    gcc-14.2.0
sh                    randconfig-001-20250515    gcc-9.3.0
sh                    randconfig-002-20250515    gcc-10.5.0
sh                    randconfig-002-20250515    gcc-9.3.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250515    gcc-6.5.0
sparc                 randconfig-001-20250515    gcc-9.3.0
sparc                 randconfig-002-20250515    gcc-10.3.0
sparc                 randconfig-002-20250515    gcc-9.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250515    gcc-9.3.0
sparc64               randconfig-002-20250515    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250515    gcc-12
um                    randconfig-001-20250515    gcc-9.3.0
um                    randconfig-002-20250515    clang-21
um                    randconfig-002-20250515    gcc-9.3.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250515    clang-20
x86_64      buildonly-randconfig-001-20250515    gcc-12
x86_64      buildonly-randconfig-002-20250515    clang-20
x86_64      buildonly-randconfig-002-20250515    gcc-12
x86_64      buildonly-randconfig-003-20250515    clang-20
x86_64      buildonly-randconfig-003-20250515    gcc-12
x86_64      buildonly-randconfig-004-20250515    clang-20
x86_64      buildonly-randconfig-004-20250515    gcc-12
x86_64      buildonly-randconfig-005-20250515    clang-20
x86_64      buildonly-randconfig-005-20250515    gcc-12
x86_64      buildonly-randconfig-006-20250515    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250515    gcc-12
x86_64                randconfig-002-20250515    gcc-12
x86_64                randconfig-003-20250515    gcc-12
x86_64                randconfig-004-20250515    gcc-12
x86_64                randconfig-005-20250515    gcc-12
x86_64                randconfig-006-20250515    gcc-12
x86_64                randconfig-007-20250515    gcc-12
x86_64                randconfig-008-20250515    gcc-12
x86_64                randconfig-071-20250515    clang-20
x86_64                randconfig-072-20250515    clang-20
x86_64                randconfig-073-20250515    clang-20
x86_64                randconfig-074-20250515    clang-20
x86_64                randconfig-075-20250515    clang-20
x86_64                randconfig-076-20250515    clang-20
x86_64                randconfig-077-20250515    clang-20
x86_64                randconfig-078-20250515    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250515    gcc-14.2.0
xtensa                randconfig-001-20250515    gcc-9.3.0
xtensa                randconfig-002-20250515    gcc-13.3.0
xtensa                randconfig-002-20250515    gcc-9.3.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
