Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BB8F99C8B
	for <intel-xe@archiver.kernel.org>; Sat, 18 Apr 2026 16:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4FA10E33B;
	Sat, 18 Apr 2026 16:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cpPoUWCF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B8110E35B
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Apr 2026 16:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776529935; x=1808065935;
 h=date:from:to:cc:subject:message-id;
 bh=LqJ/3ioJ2PILifxAdpmfDVAubU0jPtImIXcebRHm+NE=;
 b=cpPoUWCFAd3PbB61d14j+CWfrN10x+FAVd5tfn6tLVz7ipZN6BfVDLoP
 HaiibKBOtWGAAfmhgKSCiGm/3NTuMn6zP4M3kUQ18+0MOTSaRnd6gvvKc
 2gTKy+aiLbwiXWfOoGm9nxMnBw0gsQ1FCgi3dhAy2uUoVjYES7NJXaa0L
 4IgDOLWRc5/SV0s1ZpDdxkdlJJuY1FXQZP40GsQWIiyQpPdd5vrcjPucB
 daldABBggtIHe2Iz5b/Vpi41g53SF2DHLfKJVcJdZQXy6/smXdAkHHv6t
 1bcwZ3ezDA32blJ8jdpt4D7G/s6nBRhdy39tybHzHfRZJ02/LkAr48HzB Q==;
X-CSE-ConnectionGUID: Yab/MwsIRA6+8KX5oihmiA==
X-CSE-MsgGUID: rWe9TIrETq6arSjJ/bNgEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="94910514"
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; d="scan'208";a="94910514"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2026 09:32:15 -0700
X-CSE-ConnectionGUID: oVJAjWn+T4ik0SA0DkBeFg==
X-CSE-MsgGUID: RoVB476ATVCcoVcErjSyCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; d="scan'208";a="233061422"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 18 Apr 2026 09:32:13 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wE8aY-000000001M0-3ICW;
 Sat, 18 Apr 2026 16:32:10 +0000
Date: Sun, 19 Apr 2026 00:31:52 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 c973f7a672d07b9c297c27011bab299bc61732ba
Message-ID: <202604190044.pLHFJyiu-lkp@intel.com>
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
branch HEAD: c973f7a672d07b9c297c27011bab299bc61732ba  drm/xe/hwmon: Enable energy attributes for CRI

elapsed time: 978m

configs tested: 138
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260418    gcc-9.5.0
arc                   randconfig-002-20260418    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260418    gcc-8.5.0
arm                   randconfig-002-20260418    gcc-11.5.0
arm                   randconfig-003-20260418    clang-23
arm                   randconfig-004-20260418    clang-20
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260418    clang-23
arm64                 randconfig-002-20260418    gcc-8.5.0
arm64                 randconfig-003-20260418    clang-23
arm64                 randconfig-004-20260418    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260418    gcc-15.2.0
csky                  randconfig-002-20260418    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260418    clang-23
hexagon               randconfig-002-20260418    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260418    clang-20
i386        buildonly-randconfig-002-20260418    gcc-14
i386        buildonly-randconfig-003-20260418    clang-20
i386        buildonly-randconfig-004-20260418    clang-20
i386        buildonly-randconfig-005-20260418    gcc-14
i386        buildonly-randconfig-006-20260418    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20260418    gcc-14
i386                  randconfig-002-20260418    gcc-12
i386                  randconfig-003-20260418    gcc-14
i386                  randconfig-004-20260418    gcc-12
i386                  randconfig-005-20260418    gcc-12
i386                  randconfig-006-20260418    gcc-14
i386                  randconfig-007-20260418    clang-20
i386                  randconfig-011-20260418    clang-20
i386                  randconfig-012-20260418    clang-20
i386                  randconfig-013-20260418    gcc-13
i386                  randconfig-014-20260418    clang-20
i386                  randconfig-015-20260418    gcc-14
i386                  randconfig-016-20260418    clang-20
i386                  randconfig-017-20260418    clang-20
loongarch                         allnoconfig    clang-23
loongarch             randconfig-001-20260418    gcc-15.2.0
loongarch             randconfig-002-20260418    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260418    gcc-11.5.0
nios2                 randconfig-002-20260418    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                randconfig-001-20260418    gcc-15.2.0
parisc                randconfig-002-20260418    gcc-9.5.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260418    clang-23
powerpc               randconfig-002-20260418    gcc-12.5.0
powerpc64             randconfig-001-20260418    gcc-10.5.0
powerpc64             randconfig-002-20260418    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20260418    clang-23
riscv                 randconfig-002-20260418    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                  randconfig-001-20260418    clang-19
s390                  randconfig-002-20260418    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260418    gcc-11.5.0
sh                    randconfig-002-20260418    gcc-11.5.0
sparc                             allnoconfig    gcc-15.2.0
sparc                 randconfig-001-20260418    gcc-15.2.0
sparc                 randconfig-002-20260418    gcc-12.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260418    clang-23
sparc64               randconfig-002-20260418    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                    randconfig-001-20260418    gcc-12
um                    randconfig-002-20260418    gcc-12
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260418    gcc-14
x86_64      buildonly-randconfig-002-20260418    gcc-14
x86_64      buildonly-randconfig-003-20260418    gcc-14
x86_64      buildonly-randconfig-004-20260418    gcc-14
x86_64      buildonly-randconfig-005-20260418    clang-20
x86_64      buildonly-randconfig-006-20260418    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20260418    gcc-14
x86_64                randconfig-012-20260418    clang-20
x86_64                randconfig-014-20260418    clang-20
x86_64                randconfig-071-20260418    clang-20
x86_64                randconfig-072-20260418    gcc-14
x86_64                randconfig-073-20260418    clang-20
x86_64                randconfig-074-20260418    clang-20
x86_64                randconfig-075-20260418    clang-20
x86_64                randconfig-076-20260418    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260418    gcc-12.5.0
xtensa                randconfig-002-20260418    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
