Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498AFC282DE
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 20:37:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DFF10EA84;
	Thu,  6 Mar 2025 20:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZTNHade3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82E510EA84
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 20:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741293439; x=1772829439;
 h=date:from:to:cc:subject:message-id;
 bh=4P9x5AHyqyNC1ajUprCq0c/XJnYx9sZa8qZH6rPJ7kQ=;
 b=ZTNHade3CvECIIcTb6fv/f6A/Q/hS2y1v90bpng4AfpZBJWBML6TYNgR
 NKlikq2kikGvwygTYtNd4/qWsrdeOtmmMz+sl43RtdnU+nyRtSyc3ra9O
 tt3Nt9zBJOzjfv0GqKR1uLLsXsH8NLBzeNC+poGHnI0yZUlMfJsbJw7+k
 nX8gifw0TU0hmSi86YFx848D8clvmklmfHrvwDqzQDLAIrZZF0FEZRRjj
 syRedOWF35aKY1VOsSmKCRDV3d5uwXEMADTR2ROJRm6fmTmzVOWFuNGeg
 BmFhTmiroKh5ddNI9aHZNncO5pvfX0udHl21qIXlHq23uuF9YeqclImQb A==;
X-CSE-ConnectionGUID: J56nyymUSJWRE5angW1IxA==
X-CSE-MsgGUID: kaXLq22JRYSLydhmeF35Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="29910505"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="29910505"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 12:37:09 -0800
X-CSE-ConnectionGUID: AA8TtW7GQhK7RspEJ6ANFg==
X-CSE-MsgGUID: i7w3hcRjRS+JKOKGDMYVdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="124222911"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa004.fm.intel.com with ESMTP; 06 Mar 2025 12:37:07 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tqHxp-000NaP-2I;
 Thu, 06 Mar 2025 20:37:05 +0000
Date: Fri, 07 Mar 2025 04:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-fixes] BUILD SUCCESS
 333b8906336174478efbbfc1e24a89e3397ffe65
Message-ID: <202503070453.ToFonAfF-lkp@intel.com>
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
branch HEAD: 333b8906336174478efbbfc1e24a89e3397ffe65  drm/xe/userptr: Unmap userptrs in the mmu notifier

elapsed time: 1453m

configs tested: 192
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250306    gcc-13.2.0
arc                   randconfig-001-20250307    clang-15
arc                   randconfig-002-20250306    gcc-13.2.0
arc                   randconfig-002-20250307    clang-15
arc                    vdk_hs38_smp_defconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                          exynos_defconfig    gcc-14.2.0
arm                        mvebu_v7_defconfig    gcc-14.2.0
arm                   randconfig-001-20250306    gcc-14.2.0
arm                   randconfig-001-20250307    clang-15
arm                   randconfig-002-20250306    gcc-14.2.0
arm                   randconfig-002-20250307    clang-15
arm                   randconfig-003-20250306    gcc-14.2.0
arm                   randconfig-003-20250307    clang-15
arm                   randconfig-004-20250306    clang-18
arm                   randconfig-004-20250307    clang-15
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250306    gcc-14.2.0
arm64                 randconfig-001-20250307    clang-15
arm64                 randconfig-002-20250306    gcc-14.2.0
arm64                 randconfig-002-20250307    clang-15
arm64                 randconfig-003-20250306    gcc-14.2.0
arm64                 randconfig-003-20250307    clang-15
arm64                 randconfig-004-20250306    gcc-14.2.0
arm64                 randconfig-004-20250307    clang-15
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250306    gcc-14.2.0
csky                  randconfig-001-20250307    gcc-14.2.0
csky                  randconfig-002-20250306    gcc-14.2.0
csky                  randconfig-002-20250307    gcc-14.2.0
hexagon                           allnoconfig    gcc-14.2.0
hexagon               randconfig-001-20250306    clang-21
hexagon               randconfig-001-20250307    gcc-14.2.0
hexagon               randconfig-002-20250306    clang-19
hexagon               randconfig-002-20250307    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20250306    clang-19
i386        buildonly-randconfig-001-20250307    clang-19
i386        buildonly-randconfig-002-20250306    clang-19
i386        buildonly-randconfig-002-20250307    clang-19
i386        buildonly-randconfig-003-20250306    clang-19
i386        buildonly-randconfig-003-20250307    clang-19
i386        buildonly-randconfig-004-20250306    gcc-12
i386        buildonly-randconfig-004-20250307    clang-19
i386        buildonly-randconfig-005-20250306    gcc-12
i386        buildonly-randconfig-005-20250307    clang-19
i386        buildonly-randconfig-006-20250306    clang-19
i386        buildonly-randconfig-006-20250307    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20250307    clang-19
i386                  randconfig-002-20250307    clang-19
i386                  randconfig-003-20250307    clang-19
i386                  randconfig-004-20250307    clang-19
i386                  randconfig-005-20250307    clang-19
i386                  randconfig-006-20250307    clang-19
i386                  randconfig-007-20250307    clang-19
i386                  randconfig-011-20250307    gcc-11
i386                  randconfig-012-20250307    gcc-11
i386                  randconfig-013-20250307    gcc-11
i386                  randconfig-014-20250307    gcc-11
i386                  randconfig-015-20250307    gcc-11
i386                  randconfig-016-20250307    gcc-11
i386                  randconfig-017-20250307    gcc-11
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250306    gcc-14.2.0
loongarch             randconfig-001-20250307    gcc-14.2.0
loongarch             randconfig-002-20250306    gcc-14.2.0
loongarch             randconfig-002-20250307    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                          amiga_defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
microblaze                       alldefconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip32_defconfig    gcc-14.2.0
nios2                         10m50_defconfig    gcc-14.2.0
nios2                            alldefconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250306    gcc-14.2.0
nios2                 randconfig-001-20250307    gcc-14.2.0
nios2                 randconfig-002-20250306    gcc-14.2.0
nios2                 randconfig-002-20250307    gcc-14.2.0
openrisc                          allnoconfig    clang-15
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    clang-15
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250306    gcc-14.2.0
parisc                randconfig-001-20250307    gcc-14.2.0
parisc                randconfig-002-20250306    gcc-14.2.0
parisc                randconfig-002-20250307    gcc-14.2.0
powerpc                           allnoconfig    clang-15
powerpc                           allnoconfig    gcc-14.2.0
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                 linkstation_defconfig    gcc-14.2.0
powerpc                      pcm030_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250306    clang-21
powerpc               randconfig-001-20250307    gcc-14.2.0
powerpc               randconfig-002-20250306    clang-18
powerpc               randconfig-002-20250307    gcc-14.2.0
powerpc               randconfig-003-20250306    gcc-14.2.0
powerpc               randconfig-003-20250307    gcc-14.2.0
powerpc64             randconfig-001-20250306    clang-18
powerpc64             randconfig-001-20250307    gcc-14.2.0
powerpc64             randconfig-002-20250306    clang-21
powerpc64             randconfig-002-20250307    gcc-14.2.0
powerpc64             randconfig-003-20250306    clang-18
powerpc64             randconfig-003-20250307    gcc-14.2.0
riscv                             allnoconfig    clang-15
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250306    clang-18
riscv                 randconfig-001-20250307    gcc-14.2.0
riscv                 randconfig-002-20250306    gcc-14.2.0
riscv                 randconfig-002-20250307    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250306    gcc-14.2.0
s390                  randconfig-001-20250307    gcc-14.2.0
s390                  randconfig-002-20250306    clang-19
s390                  randconfig-002-20250307    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250306    gcc-14.2.0
sh                    randconfig-001-20250307    gcc-14.2.0
sh                    randconfig-002-20250306    gcc-14.2.0
sh                    randconfig-002-20250307    gcc-14.2.0
sh                          sdk7780_defconfig    gcc-14.2.0
sh                          sdk7786_defconfig    gcc-14.2.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250306    gcc-14.2.0
sparc                 randconfig-001-20250307    gcc-14.2.0
sparc                 randconfig-002-20250306    gcc-14.2.0
sparc                 randconfig-002-20250307    gcc-14.2.0
sparc64               randconfig-001-20250306    gcc-14.2.0
sparc64               randconfig-001-20250307    gcc-14.2.0
sparc64               randconfig-002-20250306    gcc-14.2.0
sparc64               randconfig-002-20250307    gcc-14.2.0
um                                allnoconfig    clang-15
um                                allnoconfig    clang-18
um                    randconfig-001-20250306    gcc-12
um                    randconfig-001-20250307    gcc-14.2.0
um                    randconfig-002-20250306    clang-16
um                    randconfig-002-20250307    gcc-14.2.0
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250306    gcc-11
x86_64      buildonly-randconfig-001-20250307    clang-19
x86_64      buildonly-randconfig-002-20250306    clang-19
x86_64      buildonly-randconfig-002-20250307    clang-19
x86_64      buildonly-randconfig-003-20250306    clang-19
x86_64      buildonly-randconfig-003-20250307    clang-19
x86_64      buildonly-randconfig-004-20250306    clang-19
x86_64      buildonly-randconfig-004-20250307    clang-19
x86_64      buildonly-randconfig-005-20250306    clang-19
x86_64      buildonly-randconfig-005-20250307    clang-19
x86_64      buildonly-randconfig-006-20250306    gcc-12
x86_64      buildonly-randconfig-006-20250307    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250307    clang-19
x86_64                randconfig-002-20250307    clang-19
x86_64                randconfig-003-20250307    clang-19
x86_64                randconfig-004-20250307    clang-19
x86_64                randconfig-005-20250307    clang-19
x86_64                randconfig-006-20250307    clang-19
x86_64                randconfig-007-20250307    clang-19
x86_64                randconfig-008-20250307    clang-19
x86_64                randconfig-071-20250307    clang-19
x86_64                randconfig-072-20250307    clang-19
x86_64                randconfig-073-20250307    clang-19
x86_64                randconfig-074-20250307    clang-19
x86_64                randconfig-075-20250307    clang-19
x86_64                randconfig-076-20250307    clang-19
x86_64                randconfig-077-20250307    clang-19
x86_64                randconfig-078-20250307    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250306    gcc-14.2.0
xtensa                randconfig-001-20250307    gcc-14.2.0
xtensa                randconfig-002-20250306    gcc-14.2.0
xtensa                randconfig-002-20250307    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
